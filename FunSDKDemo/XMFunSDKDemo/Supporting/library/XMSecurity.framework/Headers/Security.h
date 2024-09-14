//
//  "$Id: Security.h 482 2009-01-06 07:03:43Z liwj $"
//
//  Copyright (c)2008-2010, ZheJiang XuanChuang Technology Stock CO.LTD.
//  All Rights Reserved.
//
//	Description:	
//	Revisions:		Year-Month-Day  SVN-Author  Modification
//

#ifndef __SECURITY_H__
#define __SECURITY_H__

#include <ctype.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>

/// 3DES�����㷨
/// pResult ���ܺ�Ļ���λ�� 
///		����ĳ��� >= ((iOrigLen+7)/8)*8 
///		����iOrigLen������8�ı�������������
///	\param	pResult����ΪpOrig�����ǻḲ��ԭ�ж���
///	\param	pOrig �����ܵĻ���λ��
/// \param  iOrigLen �����ܻ��泤��
/// \param  pKey ��Կ ����16�ֽں�ֻȡǰ16�ֽ�
/// \param  iKeylen ��Կ����
/// \return : true �ɹ�, false ʧ��
bool DesEncrypt(char *pResult, char *pOrig, long iOrigLen, const char *pKey, int iKeylen);

/// 3DES�����㷨
/// \param [out] Result ���ܺ�Ļ���λ��
/// \param [in]pOrig �����ܵĻ���λ��
/// \param  iOrigLen �����ܻ��泤��
/// \param  pKey ��Կ
/// \param  iKeylen ��Կ����
/// \return : true �ɹ�, false ʧ��
bool DesDecrypt(char *pResult, char *pOrig, long iOrigLen, const char *pKey, int iKeylen);

/// MD5�����㷨
/// \param [out] strOutput ���ܺ������
/// \param [in] strInput Ҫ���ܵ�����
void MD5Encrypt(signed char *strOutput, unsigned char *strInput);

#endif
