Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 836FDCCF9EE
	for <intel-xe@archiver.kernel.org>; Wed, 29 Oct 2025 08:57:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 455E310E74E;
	Wed, 29 Oct 2025 08:57:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="F+BRj58l";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GOt394sH";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02E0A10E0F8
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Oct 2025 08:57:33 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59T4vLgc3764983
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Oct 2025 08:57:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=7a63mCSv+A9JvgWMq7Ieh7NT
 4tLcXzk9s+x47dKyuJQ=; b=F+BRj58lP+5eA/marruZFwnwCtmJMHkHj9YBDlBt
 qD9/cqIHj3w0TOZC3VGj94+on44sKfGeB1ku3OsYgjmuMLrniZYwqZPakT77gk1S
 WJMDmgrMtLFGrJEYoH4LCDorZG7yPw1ytbv6PC5nSAKio3Zhag1CHBJv0M4WQ5h6
 rR5Tm8cu01/aVD0/i6QaG7Bczau0v/jh+8MBkCXc6uf3UwB/gLwiCeRJP1I/J/ip
 pQwkLf9+NvB2m7Z5qall3khhRJCgtXJxYYZ1gkYc9OED1v5EyWeBLGjqh6KoL5OY
 O+6DaLmmJPzOI/NiK+/ABnInhgv6PpIn63B7kHSpETm+8w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a11vq5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Oct 2025 08:57:32 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-88fec61f826so1880270385a.1
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Oct 2025 01:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761728251; x=1762333051;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=7a63mCSv+A9JvgWMq7Ieh7NT4tLcXzk9s+x47dKyuJQ=;
 b=GOt394sHIQEwCCGvvTG460a12ibF+SLIrdI4zxXWvzfvxXs9gNJ3SCvw2CO0uzdV0H
 i4PKBbKtPst+u2SERCZ6OzBUC4+rb2twQMinrX6Ut82ZgUawirXekxz06LN6f6jllTEm
 3qFL7RKDnlkdV5VQc3lfJcYETqbt7nxz4oURbQsx22cT0oXaVFO+QuLgpKGXpBHxaBMx
 p8VduYGsV8R6oDebH2E14ywsutAUAx4NssZ0nR08NBtB8xzvwOT+6YlHbWne5nT9jcqf
 2DKYJJ0HJirV67KQUxwOKDpufSgZMsPMB/QQlZJDL9U8k/CIvIKuphjGDV3XCLwbN40H
 Kjqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761728251; x=1762333051;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7a63mCSv+A9JvgWMq7Ieh7NT4tLcXzk9s+x47dKyuJQ=;
 b=AB99ee2yKv8b4sEBG5WkfitXVXZsPaTFskKBERrj1tssp9zULdAB2SNMBW9tivmcBY
 LiE1gqUkyzjNwC8wdtv67y04kIhhEoS+C+lyxTMv1QZKIVc7J0d5ov23xf77WKQC3XR0
 JEAmhpRXx9oI4WfEFD622dWU2NxnNGvHfAfu8epVQyohHtuFE9I4EXLLpTrji5gKODkE
 m5IZkRI95aEQsEXrDtBriOUbbEy8XDevAKH+Z1lTMslDEeaEP+hV7yQTiJkZsuP7MrlU
 Vnv6nnywxJgVSCLMfKQs9c8ARhH7TwTy7nZgZMT3cgVdDTfoATmOO8uPHj2hAsQ6DkS9
 0gug==
X-Forwarded-Encrypted: i=1;
 AJvYcCUh3B5EUrDsjixKlFhvKIMHTryOW+yfgCmkGdD+gu8FjhI21blJvCyNNrt6aF0yzWzCGPgbp1Pwjw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw6tpCg3AWWEcxwSYgCJ9rZRAVkyygncYCWjtU24qSSh+9/RmhN
 X2MQFcCkRX+s9Kgeev8cKon13oAqUmHzkSz3V4A5DACYwpEEH37S3+mpLCNKElkiytWII4s+vJj
 ee9MPNZ2DkF2s2/htLZMk8qt8ZaZw3yGJQrnQ1EzcCwmRaOwhSNDsq6Yx/pLTsGc1N/nkDr9bdB
 Hadg==
X-Gm-Gg: ASbGnctdlUXy/bzwJnN23E7xdcwUc52Oi8r96/zSBat5cfLHXjku9hOPK2sAjNN3zDl
 w9Y2/8Rr3HH7YZHSW8vybIaI1lm+Cn/8MQanfMlMrIyyzURUG2i5Ed4OW9FizPJloxVBbi1D7PF
 RMlVofN3euEr9i/tHFoI6p0fWNVsKthbuynWQZUZUDTmuym6/vAaI8WxAUTCT5g7Lw4y0ZJKF5X
 uFleBI/ELQ3xwazXegIPQjAmBJUEGugpaiFI/MqcA00XO8psfpkCKbQp3j/ffkWaa4zjQfLaUPm
 OKYfY1F1/ej2IG5z6+l7fEQWqrFwRd4M3mseafYZN1ULs4JlsDHli8EGWRLfP7qDrWc/00tRFoq
 KyKVDNaLu+bhWXZKzHLIwCGqolxO0hjU4sl3vMd2eRCTHfc+/PSO/2LPRGm7vKob1U9PEfX3Da0
 NkM21UTULpeA7o
X-Received: by 2002:a05:622a:1b87:b0:4b2:9cdc:6d52 with SMTP id
 d75a77b69052e-4ed15c9afcamr25245951cf.71.1761728251392; 
 Wed, 29 Oct 2025 01:57:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHHMxS9dJDlfut9jklaN1u7WjxrtXy+M4HfVu5cw7ucNDEH9oxaqvAGSpJbi0LaKmBBPdMe+A==
X-Received: by 2002:a05:622a:1b87:b0:4b2:9cdc:6d52 with SMTP id
 d75a77b69052e-4ed15c9afcamr25245721cf.71.1761728250874; 
 Wed, 29 Oct 2025 01:57:30 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-378ee0bbfeasm32127811fa.25.2025.10.29.01.57.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Oct 2025 01:57:29 -0700 (PDT)
Date: Wed, 29 Oct 2025 10:57:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Khaled Almahallawy <khaled.almahallawy@intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Jani Nikula <jani.nikula@intel.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>
Subject: Re: [PATCH] drm/display/dp: Rename bit 4 of DPCD TEST_REQUEST to
 match DP2.1 spec
Message-ID: <jn7piiqfyeiiinpxu5ht7qza2la3cigdqlhtlvuvkbzqeyhcad@v5aypgcrcdok>
References: <20251028222817.3290035-1-khaled.almahallawy@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251028222817.3290035-1-khaled.almahallawy@intel.com>
X-Proofpoint-GUID: zPvtyqlQoTzOZuSL9se1JJhjoTpslbC9
X-Proofpoint-ORIG-GUID: zPvtyqlQoTzOZuSL9se1JJhjoTpslbC9
X-Authority-Analysis: v=2.4 cv=A5dh/qWG c=1 sm=1 tr=0 ts=6901d6fc cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=rHtxkZaJ8jImS8H9yjEA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDA2NiBTYWx0ZWRfX/ePl5rF8WAu3
 amXUob5Hd098peWFAgu2jiiLRNg2q8GvhF+jlM4RuaB9JtIMYpm+KszeL59HIdNfG875CyjNfyY
 eEFC+2KEcOoXH24s8152NiVYHgvZ2norEkgDV4PcRtZwcHJ+TuhXJJCt8i10+Mv28xtsOHngR8I
 dBnVKF+6a06QyZEWg4a/1dUWDAjqkhjrEP0SuMQbABU1zY+i6UaoyYavijmpNUjhAr9G9USQGlu
 cBQsVnf028m1gLbpbJYX36seU3qNVmyi2u3oiEslmXAFGjfHMwxmopAAHHTQyFFdQFcWCJ3ZaRr
 VmGv47MQH8jYZteqB1nSlZM34lBj1PbwJr6ihobBQWngEKcxPu7lKt6D90vo6vtfnXTJmErc2Am
 B6DsjkS78wSP46RE27xTmNwFyUDI1g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290066
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

On Tue, Oct 28, 2025 at 03:28:17PM -0700, Khaled Almahallawy wrote:
> The DP_TEST_LINK_FAUX_PATTERN field was deprecated in the DP 1.3 spec.
> Update its name to align with the DP 2.1 definition and reflect its
> actual use in the code. No functional changes.
> 
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Rob Clark <robin.clark@oss.qualcomm.com>
> Cc: Dmitry Baryshkov <lumag@kernel.org>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Sean Paul <sean@poorly.run>
> Signed-off-by: Khaled Almahallawy <khaled.almahallawy@intel.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_link.c | 2 +-
>  include/drm/display/drm_dp.h     | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Would you prefer to merge this through drm-misc-next or through msm-next?

-- 
With best wishes
Dmitry
