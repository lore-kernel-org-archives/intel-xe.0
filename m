Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AFC2606A321
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 20:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jepOCxGZ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y10GiUR6
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6B8F10E8C1;
	Tue, 24 Nov 2026 20:35:29 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7419510E8C0
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Nov 2026 20:35:18 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AOIXNrI2036924
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Nov 2026 20:35:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 /lgmsLAWFTOpUTSUavZ1s40ItzJRXtSmrwzglhKM+H8=; b=jepOCxGZ/3mUXS89
 6SfFAI8VX2Qds7NbhfhyN5LRDjx2kRVYsFHIVo1lZwf/aGQc3aQyRGMJD2rDKA6d
 ASuW/1pI112r08jBl6CfmfViH96i1oN3EBGAHEDRaPUh3ROMSyfJ2olsvt2FwFpY
 9XKO/Sh2qNe18NdvXKdHsoSf+e0H1RZNXa4H2ztcrl6YrxOffFgsZpxEbcPfMcx6
 L3BOE4hvRCzJPrar0xjaNk3di9fK47Pw8lOFxkVgjLbkudDTCpGssDQM7g8mTBC/
 x4E5xu78jUbn9sb+wvrvxkgBezF+T0tMfIVtoOJMetdv2WYowbbdqvA3r8xOGDpd
 XCoHOw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com
 [74.125.82.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5dngh884-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Nov 2026 20:35:17 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id
 5a478bee46e88-3854627c1c8so7115111eec.1
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Nov 2026 12:35:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795552517; x=1796157317;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=/lgmsLAWFTOpUTSUavZ1s40ItzJRXtSmrwzglhKM+H8=;
 b=Y10GiUR69I6bS/0OO1lG/yeS9mPlURBn7M75PQ3GhGLSUuIruS8zXc14ftgGrfIbnE
 h20UNjUh1WzWed5A4sGKaGLa0RY5EyL51wew7zdhpFyGrI4d9FEXFPq+E6YouJDcHxDT
 bdkGCke67WQREbFeQuf0UDFHznEkKEOdyrFAM8jsY8m7rzraxzmaMGa7xgJgdsblNRe7
 kT6xsqIXvQOLrlMegFWpnt2r4vQBCMGerY3d6bfN2H7cwCOF1N2dVgXLGjfceiEz4hE3
 V/VFvkyhxFcaL0HizCCWML+Q5yP2NJJV1YXBEVSDOQFNXJGfLhHGoaQRthgofBQ+Vt5f
 xl2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795552517; x=1796157317;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=/lgmsLAWFTOpUTSUavZ1s40ItzJRXtSmrwzglhKM+H8=;
 b=f4wi8k7kFtQiIAMV9KKcxhLhcEV+INlJXB5ryycem57qnO/08u3OnEmay9xW3/qLWF
 JzB3H4rzETkfWUdV/CUsTk4sLIss1EC29bs+TiraHG3IjFCFH4l2Tjr/SuDZNJvM+xP4
 kNk5sdQ0e3FWzkG8LAB5953JElKebwhU31OsXohBC+i9baFW5FNfJ6w3rgvkc56cpa0B
 tEmS9Xc1Uv6EW8ij3Ez3Ej/3Ddk303OcGaCjAQBRSS5+s0s555BUFJRDLLILkfwSa849
 96cI4QZGoZstobE1+ruGofbPDD+ba29zuwlh3eyL7omKVRe8kMgJQTiwnbDXGLxvmZEv
 ADWQ==
X-Gm-Message-State: APuU4Z++gVNyBSfUJt5z1z9pnKgNBq6AZTCY3oSSOKGTvrNflBj4e7Lj
 ar1QxSR4DumTivQwYTkksvd9CRH2PcFrb7Frf3VPabfwC/UXvCvrzAJXtWOa96M3IG8J60lWowv
 JWueGb7XvHF4YXqOxzX1++/8CuZl5kIY7D8J1c6y20vebPyvc7dbhAq7Rqq8QP1mm2U28sA==
X-Gm-Gg: AZFdTZeWCbiJ0vAVxG7kuDww6XVgWsE8935vl1mQ9llTQc8chD9ENiaYgx9OtFB2Ljx
 e3sX+hIoCyK8g7NZc+WTc50cdcblO58y5Bed9zyl71oj8pL3QVvutpD8+sWand1IKByPHO+mgMI
 CFYSUtCLNFm02IzshmiZvbbIXDhjy/TGPFqIzsyBfRv4NqghsDHCkXaNpx2xMHs3Lzfv99Ss1IR
 uyt476zylBtLBLKP5i8baYyJpfNoMSWpRgk3yq4eXWAtUX35FYKBSleGYjAmGDwTVMPbf8Fbqa0
 yvRWOFaZ9LPXpGAhRSW27zsO8MvevfDvmn/leK7/NF6NOWuNUvuhR+2mCEADiyw0N0//OIy7SE/
 IN/2MDzk3K4ZYDDF5Mj73+GPIVRMzyop7NSiJADjc4m4GYOAXCXBB4tE7tW7EHRWoF34+/Z0LPh
 8jLP3j3e/GC4WQsCPEB9i08WQkE+beBX4=
X-Received: by 2002:a05:7301:6083:b0:386:a01f:a36b with SMTP id
 5a478bee46e88-386a01fa8d8mr17003155eec.35.1795552517042; 
 Tue, 24 Nov 2026 12:35:17 -0800 (PST)
X-Received: by 2002:a05:7301:6083:b0:386:a01f:a36b with SMTP id
 5a478bee46e88-386a01fa8d8mr17003123eec.35.1795552516435; 
 Tue, 24 Nov 2026 12:35:16 -0800 (PST)
Received: from [10.226.48.50] (Global_NAT1.qualcomm.com. [129.46.96.20])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-385672ce402sm44409448eec.16.2026.11.24.12.35.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Nov 2026 12:35:16 -0800 (PST)
Message-ID: <fdbe8a18-fd34-4419-ad9c-133b38f818f4@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 13:35:14 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ras: Do not fail an error-counter dump on a skipped
 last ID
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>
References: <20261124202102.3578912-2-rodrigo.vivi@intel.com>
Content-Language: en-US
From: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>
In-Reply-To: <20261124202102.3578912-2-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA4MCBTYWx0ZWRfXzO+OyiQ2MoGu
 9gcRkiGrQy2EQ67Q4mMg1RFfRI3Gnf43zb8G/IbjDeUL52ltvUo6Lv28jjVpCkai9R4WCrdJYfG
 b7O1pp3qj6MzDXk614/iP9u0ugQa8KQ=
X-Proofpoint-ORIG-GUID: M17OAdFbcttbqdy8xI4RXSrjR_dT3a--
X-Proofpoint-GUID: M17OAdFbcttbqdy8xI4RXSrjR_dT3a--
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA4MCBTYWx0ZWRfX/IdwJILIpGMo
 KJGwXGdYL0rOHdqWqT2sc/3NDwTdPxCUWlp/2pqbscMnNmcIpwfc45art/JEoJbixTe+sDnyMs6
 YtymseRN/ymSu92kyXDP91gHCFAWCWfQ7Sg/KUTNwymrdVyGEUHNHj0HKJMN3Gu1NOxVlZPJnMI
 7Jx3KxFAsWesYS1yyIlXOUZL5jyK6rrFQmeTwjOsM3bOBNYGdr/FIyXVdrvbORaae/YDRnCtf6a
 NFgifd8eqbELhqQTDpKRUda2f8MT7unGubuW+Pg31vj7ONC0EyY7k1q/bSGkw6OjDgPHFqjvQaG
 gCdWOMliO8/D1UqdxsoFlX2edSkQbjnvc8IL2LWZscphZqstTZreEajtvsT0woYskEdx4P5Epry
 TNoySvHHsKV2uinH1Pb+iQX/FJdsRKvt9ZkPucBfo+OOLPR0efsB700iM393NpTTThSvJbIl33n
 mDtfBxZ8ziL/dWjg0Kw==
X-Authority-Analysis: v=2.4 cv=U9cHnuru c=1 sm=1 tr=0 ts=6b05f505 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=VE9ESCdJRH24Gw-HOaMA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 clxscore=1011 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240080
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/24/2026 1:21 PM, Rodrigo Vivi wrote:
> drm_ras_nl_get_error_counter_dumpit() skips the IDs the driver reports
> as -ENOENT, but keeps that value in ret. If the last ID of the range is
> skipped, a complete dump then fails with -ENOENT.
> 
> Fixes: c36218dc49f5 ("drm/ras: Introduce the DRM RAS infrastructure over generic netlink")
> Cc: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>
> Cc: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
> Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   drivers/gpu/drm/drm_ras.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_ras.c b/drivers/gpu/drm/drm_ras.c
> index bc30bf0745e5..82fcc766b84b 100644
> --- a/drivers/gpu/drm/drm_ras.c
> +++ b/drivers/gpu/drm/drm_ras.c
> @@ -616,8 +616,10 @@ int drm_ras_nl_get_error_counter_dumpit(struct sk_buff *skb,
>   		 * For non-contiguous range, driver return -ENOENT as indication
>   		 * to skip this ID when listing all errors.
>   		 */
> -		if (ret == -ENOENT)
> +		if (ret == -ENOENT) {
> +			ret = 0;
>   			continue;
> +		}
>   		if (ret)
>   			break;
>   

Reviewed-by: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>
