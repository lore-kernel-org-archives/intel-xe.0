Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33929C369A2
	for <intel-xe@archiver.kernel.org>; Thu, 10 Apr 2025 19:28:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7387610EA3E;
	Thu, 10 Apr 2025 19:28:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TV4G4NM3";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2986D10EA3E
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Apr 2025 19:28:18 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AG3n6R000337
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Apr 2025 19:28:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 qh0Ep6gRYMgrzLkSqX3dxAeXJYkCyrxkcSbtorndPrE=; b=TV4G4NM312v9HVjc
 4D+iftoKVsdsS1L546pNBCtLGMuaUjOi1i+2q/Rc99W3Gy+RKhX/da/xJqB9aZjP
 veEcWjCTpQi3x6EUD+9YUCNH6qpCMRDPD3UvOx5BixWbOrjSUK6D6ReErtp/I72r
 +lcckd1McY3/c5+PLVPa5IGTLerXSEHtzfPhXFotyqtAtbQ7Qj2MoZjjw7IbCqbm
 vfeAHOLFn5A3x2LyofkyAPTArhTS922s/mpEbwNoYRrmJx80ytRVpzOIgedLLfat
 PvWxdArk3gO6xLndoArp9e/BlpUY5sYu4V9p2ILWk5y4j99w5BkcMBk1ePzeAMj1
 g2UdGg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twfkqx7q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Apr 2025 19:28:14 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c5d9d8890fso392319485a.1
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Apr 2025 12:28:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744313294; x=1744918094;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qh0Ep6gRYMgrzLkSqX3dxAeXJYkCyrxkcSbtorndPrE=;
 b=vyZpDV7MHdR0rHliz5yBla1Oj8HFVk0zAClozgR8Ab/OCFvoMIH7er8h/CFcC/J2Px
 7EeCm+UNqaS/Qf70blTd98IaEmaafdKPBokL2zaTr6lvmSMIjQydSy21LrqL9QUH10Wy
 E+/p0Hp0MF/meWeCRzu7Ftz5auhCaGmMYSWe17xlQVo8uirDFJCbrEYZsEWaNl5CaTse
 ppCC8vf6sDK/bRCEB201Q3RQ8xHBsMHw+0Otsny+Fe5qBuYS+6uyF1Ok02MY6uZrWQM0
 i3Yk64O99HfaknfUHjlP+YhprAxr+JRC+k2v1KaSg9eQMbtL6dTQBqVrBgNPVQ6xbr8B
 YRfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVP2zFQqlGiUERBdwijoBw28PQlbYot25w5Nl54hT4UGDU3gESDMV9n6l1AFYEl2D0IxUNBGzYj3w==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx9L7freLjDMIx26ZiAEhKcE12+XhBrGkfgM/ZLsK3k5X3GtIsO
 jSuKg4CuwZjCr3mf/kw8vqTZ+miDZImYVh4hj9LLbH69p56Qf6RwbkhxakgE29M+pmhImEMBXs/
 rB3JribZVnN631RwIZ42Tze3KHh7LQgO5BxfmNLJ0DfgkFbE+N6YP7yay+r0IdXdE+Q==
X-Gm-Gg: ASbGncuu7JutLEOcVEj0T6tUj6Blvk9OwQED1jrSRjl8mcjuiysDNaWQMIdmuWgkR0K
 tqS2rtNWSwtsnXqOBOzXEJ2evsndp2iRgwLR2nRdyWH9EKsDC2fDCFHAYRC0sGFrOondofjmtcm
 2JG3SN07BvS+V9mzytNtdB6OKOMUV8lzGN430PklwSk6/1SwDLdhTrhaYhu6viqENiL8KN6oGuF
 XU31lPEFFPxLqdpasnrsSR2RnxMxli0afr4AQ4da1AfSFkQNnUK8NlG2HdpfO1juJKJJZLPSE1O
 jjvv+woICGYIVZ1cnN7vQRmW6Bpqc1mgzTpuw927qC5R/nHt7x6ajJ0kRqhcU0DtCcC9myXScXQ
 =
X-Received: by 2002:a05:620a:390a:b0:7c2:3f1f:1a15 with SMTP id
 af79cd13be357-7c7a765e51dmr560004985a.8.1744313294004; 
 Thu, 10 Apr 2025 12:28:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSpgRoH6+EQN77MiLX+UVvWsFRwqYiRJvK45u6T/7sV2nB5QKrHoRaFMSU86+dK9p42cd08g==
X-Received: by 2002:a05:620a:390a:b0:7c2:3f1f:1a15 with SMTP id
 af79cd13be357-7c7a765e51dmr560001585a.8.1744313293707; 
 Thu, 10 Apr 2025 12:28:13 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54d3d502654sm227020e87.111.2025.04.10.12.28.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Apr 2025 12:28:12 -0700 (PDT)
Date: Thu, 10 Apr 2025 22:28:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 15/19] drm/msm: Pass along the format info from
 .fb_create() to drm_helper_mode_fill_fb_struct()
Message-ID: <ljqytcjityeqrek5ik72duv3oblcapm7sqysminnknud34x2v6@gmjngn7odejm>
References: <20250410163218.15130-1-ville.syrjala@linux.intel.com>
 <20250410163218.15130-16-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250410163218.15130-16-ville.syrjala@linux.intel.com>
X-Proofpoint-GUID: 2eEoa4F5Hw-Mz_oYljbxnvQySy1j0a52
X-Proofpoint-ORIG-GUID: 2eEoa4F5Hw-Mz_oYljbxnvQySy1j0a52
X-Authority-Analysis: v=2.4 cv=b7Oy4sGx c=1 sm=1 tr=0 ts=67f81bce cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=XR8D0OoHHMoA:10 a=QyXUC8HyAAAA:8 a=pGLkceISAAAA:8 a=COk6AnOGAAAA:8
 a=VwQbUJbxAAAA:8 a=tVI0ZWmoAAAA:8
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=2eKwwukf-V9ccoo5c-0A:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=zZCYzV9kfG8A:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=TjNXssC_j7lpFel5tvFf:22 a=-BPWgnxRz2uhmvdm1NTO:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_05,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 mlxscore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 mlxlogscore=931 bulkscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100141
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

On Thu, Apr 10, 2025 at 07:32:14PM +0300, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Plumb the format info from .fb_create() all the way to
> drm_helper_mode_fill_fb_struct() to avoid the redundant
> lookups.
> 
> For the fbdev case a manual drm_get_format_info() lookup
> is needed.
> 
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <lumag@kernel.org>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/msm/msm_fb.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
