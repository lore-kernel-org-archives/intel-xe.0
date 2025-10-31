Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26C02CCF9FF
	for <intel-xe@archiver.kernel.org>; Fri, 31 Oct 2025 09:36:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D193510EADF;
	Fri, 31 Oct 2025 09:36:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WNppK8iX";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H1pkdngH";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 115C310EADF
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Oct 2025 09:35:59 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59V17th41512264
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Oct 2025 09:35:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 AE9otBVBcEexeCfrvE/nk91Z9IAd1uol89Nt0hwiqRU=; b=WNppK8iXQ+5JkJmJ
 IK0p23JVD7GhYa8XpPx4aQKVzOWSw1aSe0VeQEEg9CEGajR7Y4XeujzHO4kojchR
 5QGH3jjf7snoIHG+iqLVoZDuanuXwMi3U6mihO9Ibi1VEB2VI4TT8DsyDK2KroSw
 zTfPe1uEYnlje2lrz9qp+T3kisdPxlf9VyxIJWz2xhgvcFJc8YYECFqVdD6JxqnD
 1VSZO+oDKfh1zP5SX+LX33ayD5hkoAIF/w0sfgimjTxhLjes3m2yKbJHmyUVgS0b
 V69mggpmosmgH4zXYHh0XF5da9s8hnsaQoOEZkfAS7ZgOcMi3q5yB0EWLS250vir
 ev2v4A==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4k69h71u-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Oct 2025 09:35:58 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-8801e2653dfso4599466d6.0
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Oct 2025 02:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761903358; x=1762508158;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AE9otBVBcEexeCfrvE/nk91Z9IAd1uol89Nt0hwiqRU=;
 b=H1pkdngHvqL03xmGlrSxQztcZlHnlcpNRbUm7AdHmyW3Hn2APnfYhFgMHHbBDMoRNk
 fyB6TYhbwh1NeQznxkM79PNb9lDpHocfinatfVYIdAsij/AKWyg7p+vOtPOmQ445TqQX
 U84nXrtbyFcRoa60b4AwttGL8+7u4UbX00H7QnSOm4yPSh1q08yB9+wSglOfQNvir8it
 8AbOFKB7wnp/xFYklDRtxS6KWVlJLbglF5rlU/2N5axiXCvbKTImeXzpN/m325Uozuj5
 NDBT3KrpNM9chlGs6kqrA6oU2MZLH3f9hHw6i76kD/XscweEnQcPsTf8VSeM3/K8uKSK
 KpUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761903358; x=1762508158;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AE9otBVBcEexeCfrvE/nk91Z9IAd1uol89Nt0hwiqRU=;
 b=r3vEw+xacy6Gnfi/4/DHeQ8iw94MHJ4GZ5oqYUt1a2jlk63gtoAyBVPsxjtaZ+xT2X
 72haVDgGSW2mqR/RcNN7UaE9nqMjHoLu0Zb/NkdGXS10QzXLrYp/5sqQiGglB3M3GmgQ
 zJp0rAu4j8aQYXKxx9gNvrSPjH05Pp89/lrxjgnfohRwu9dQqJXqaJyyOotVGmODd/bo
 Yz4SEir4KdQHnL9TCvYnS/WT5H3Dvz6AQ/FzcmFHu70BRXsiVGgjRuSfMUPKP4CMt5NZ
 VvE/gigSAWYT8gFnHGff++2qY8D3B+gfMS12TBnNWasSmrgzlHLLoudbQ4ztQs8QQWA4
 3RbQ==
X-Gm-Message-State: AOJu0Ywetfip3LryGAQcCqu1ZWs7Cu/4RZB1Y3dekw+fjpt9WZ5DfMe7
 RnDGULr1TKRjMkGIKzdkoFQMBlCVRjG+EKXFpsK7oXyecpthYk5WRRf4MQWBE+SIMXpwsDV5nnn
 0aWZQHtOjhkD9PBl5qfJ8Z++F+vwrLUF4K0TOjTmKwgaVichdwl774jwdqVlXNn+eyqFwUQ==
X-Gm-Gg: ASbGnct4TXGtchzdeWk/PZyGr8M832+Rf5Kdt9DEy9fij+ZYQNojlg6EFBUqMdTGLmi
 7orqUckbpcx/GToT+2eJTY9qbIEqhfyrbP49ny49xVHVL1YdFyDSrtPjlMk8wHN+w4zvPtrk+Uf
 S4Ky0h4A+u04J7Ru2EzbcM9JpmcVwRxwmCzjI60juHgEuOUxKEJf8sHzAqQ8QRnsd7ILf4UNUje
 JA74ijGmvKTtJTx9OZfrJPVrGLm5aLLii7vKpqoj/q2uDDzKrmAnNKiQc4WW55rnBDrD8aIWnfg
 /2Yo/+/r71sNhkkgMOn7+0TwQ6KrFAKnPVM8/6Tn2z5p5ITVBrUGa6CVC6Ml4du0LyVSNvD2HxV
 9lmteM2KCK2/pJz7Ep8BW5rRU3N+q9iGEg2A1Y3s8puWMrugtBB2Uloxn
X-Received: by 2002:ac8:7f94:0:b0:4ec:efbe:804c with SMTP id
 d75a77b69052e-4ed30fbae1amr19443841cf.11.1761903358296; 
 Fri, 31 Oct 2025 02:35:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFM64Dqu4qewULsJFetcmJmwTPjhEdUVf5uOKf3Q05MzwfWGWCLJH888ksuI5tZfx6XDLpCCQ==
X-Received: by 2002:ac8:7f94:0:b0:4ec:efbe:804c with SMTP id
 d75a77b69052e-4ed30fbae1amr19443691cf.11.1761903357777; 
 Fri, 31 Oct 2025 02:35:57 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6407b438536sm1183628a12.26.2025.10.31.02.35.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Oct 2025 02:35:57 -0700 (PDT)
Message-ID: <60a8f86b-f529-47d0-92fd-90ffebe28243@oss.qualcomm.com>
Date: Fri, 31 Oct 2025 10:35:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/display/dp: Rename bit 4 of DPCD TEST_REQUEST to
 match DP2.1 spec
To: "Almahallawy, Khaled" <khaled.almahallawy@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "robin.clark@oss.qualcomm.com" <robin.clark@oss.qualcomm.com>,
 "Nikula, Jani" <jani.nikula@intel.com>, "lumag@kernel.org"
 <lumag@kernel.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "sean@poorly.run" <sean@poorly.run>
References: <20251028222817.3290035-1-khaled.almahallawy@intel.com>
 <78679e08-2a38-477b-a080-be0442465fbe@oss.qualcomm.com>
 <e8902945b65cee777e14bd47ac6e27ff4a0bd281.camel@intel.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e8902945b65cee777e14bd47ac6e27ff4a0bd281.camel@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 5QUr8LCBGAv6xy2CGyCt0OyGy_HuDf4M
X-Proofpoint-GUID: 5QUr8LCBGAv6xy2CGyCt0OyGy_HuDf4M
X-Authority-Analysis: v=2.4 cv=OYaVzxTY c=1 sm=1 tr=0 ts=690482fe cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=1UTDxpAJyHcS0dvM0xQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDA4NiBTYWx0ZWRfXyJID3i6CVUPl
 TpYcKXsi8tofl//8YQpcb+kzladD6NYABFmJQlemGdvOqglZbSkQ+A9IMubxBKTz9puY/4BDp2S
 AUyy8FNO6T9syUtKm9M8M9ORDu2QlFzdd2fYoojPii8Lqv6B+8GOUlzX1xyLPf7g70OM43LXFpY
 4xCrUMAxWvBaLKsWBuQdgqO5mztx4Leock6LSnBIeWkc3Vg5E4FHC0AsNo39BcqxbG7eq/B6icj
 oNikf0g9eahJtOTWcypZVG+kfylxrmrbhgXKQh2SsgUF0HDytTkJ0KIYBcd/TN/0hLDCW9P+/aD
 BfTRLdW5bS9E4mqHl/UjF9BDFLpkyPSnQTqGxk66qEydntVVbQOcxCAVsQD73DvMrYuhj1xF8Kj
 7ya62H6FvLm8VyroecGn3jxvqEzqaA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 malwarescore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310086
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 10/29/25 10:42 PM, Almahallawy, Khaled wrote:
> On Wed, 2025-10-29 at 10:42 +0100, Konrad Dybcio wrote:
>> On 10/28/25 11:28 PM, Khaled Almahallawy wrote:
>>> The DP_TEST_LINK_FAUX_PATTERN field was deprecated in the DP 1.3
>>> spec.
>>> Update its name to align with the DP 2.1 definition and reflect its
>>> actual use in the code. No functional changes.
>>>
>>> Cc: Jani Nikula <jani.nikula@intel.com>
>>> Cc: Rob Clark <robin.clark@oss.qualcomm.com>
>>> Cc: Dmitry Baryshkov <lumag@kernel.org>
>>> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>> Cc: Sean Paul <sean@poorly.run>
>>> Signed-off-by: Khaled Almahallawy <khaled.almahallawy@intel.com>
>>> ---
>>>  drivers/gpu/drm/msm/dp/dp_link.c | 2 +-
>>>  include/drm/display/drm_dp.h     | 2 +-
>>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/dp/dp_link.c
>>> b/drivers/gpu/drm/msm/dp/dp_link.c
>>> index 66e1bbd80db3..5d465cf4dbc2 100644
>>> --- a/drivers/gpu/drm/msm/dp/dp_link.c
>>> +++ b/drivers/gpu/drm/msm/dp/dp_link.c
>>> @@ -665,7 +665,7 @@ static int msm_dp_link_parse_request(struct
>>> msm_dp_link_private *link)
>>>  		return rlen;
>>>  	}
>>>  
>>> -	if (!data || (data == DP_TEST_LINK_FAUX_PATTERN)) {
>>> +	if (!data || (data ==
>>> DP_TEST_PHY_TEST_CHANNEL_CODING_TYPE)) {
>>>  		drm_dbg_dp(link->drm_dev, "link 0x%x not
>>> supported\n", data);
>>>  		goto end;
>>>  	}
>>> diff --git a/include/drm/display/drm_dp.h
>>> b/include/drm/display/drm_dp.h
>>> index e4eebabab975..610b8cbf1125 100644
>>> --- a/include/drm/display/drm_dp.h
>>> +++ b/include/drm/display/drm_dp.h
>>> @@ -849,7 +849,7 @@
>>>  # define DP_TEST_LINK_VIDEO_PATTERN	    (1 << 1)
>>>  # define DP_TEST_LINK_EDID_READ		    (1 << 2)
>>>  # define DP_TEST_LINK_PHY_TEST_PATTERN	    (1 << 3) /* DPCD >=
>>> 1.1 */
>>> -# define DP_TEST_LINK_FAUX_PATTERN	    (1 << 4) /* DPCD >=
>>> 1.2 */
>>> +# define DP_TEST_PHY_TEST_CHANNEL_CODING_TYPE	    (1 << 4)
>>
>> I think it'd be useful to keep a comment of what it was before the
>> deprecation and rename
> 
> Given that msm is currently the only driver that reads this bit and
> correctly interprets it when handling automated test requests to
> determine 128b/132b support—and following the style used throughout
> this file, since I don’t see other examples referencing deprecated
> names in comments
> 
> what do you think about using something like this instead?
> 
> #define DP_TEST_PHY_TEST_CHANNEL_CODING_TYPE  (1 << 4) /* DP 2.1 */

Makes sense, let's do it

Konrad
