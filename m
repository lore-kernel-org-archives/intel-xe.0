Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2926CAC5B5
	for <intel-xe@archiver.kernel.org>; Mon, 29 Sep 2025 09:00:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6943510E3D6;
	Mon, 29 Sep 2025 09:00:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="T2xqhC3m";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9521510E3D5
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Sep 2025 09:00:19 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58SLnk5W025415
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Sep 2025 09:00:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 K70Xwm8Y+J7KLULBIJyLbfN2P1E5MkuVdQpZLT5gNI0=; b=T2xqhC3mvopWRuOI
 dxF2M5bmsxCdK4g2NM7+MMJNM2TKUmoN2Xx3P7Zm0tFfES4xJro8VhVHUNntVmy8
 +HWYh0qYrsliHlpTf1lRpblNNs1dg+onkfVVUvmVnpCi4ExNZydJEZs8Rufpc9ua
 0+uLj88iEvI509YZRtaz1wjW9+GqNTHx50CiGwmyO9DUxIkEJRdTAvbtoVQuYZWq
 Fu0819rAN/llh0ud1HFmTjj2caKow1zAjKezwNjEKbBLDsfNFGWEjsejHLJwDN1o
 c/btiBM9qnka/NWzUr3JV/rQ04BYJ0eG4+3qwvgJFI5Nz21Y90GDNo5QUBGJDJVO
 DP5P+Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e78fvmc2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Sep 2025 09:00:18 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4db75c7fa8dso103082511cf.0
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Sep 2025 02:00:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759136408; x=1759741208;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K70Xwm8Y+J7KLULBIJyLbfN2P1E5MkuVdQpZLT5gNI0=;
 b=OmyYW6Qag/izs4HGaYdrlHQoa30FipVpzpY9CEv0jTj/uMvwjdLCq3QUMzTQmr9EEq
 8XngEBDMNHKnLmjxa9altU8WjW2xgVOVYrxW6Zzrh8tSx53WCuf2CWUwSKD8KHjcxdLk
 tDnN5BuFzuuUhYV7VC5EjoCx/uYWq3MLH/DxdyOLPrX9vsiJEq/4xUEVB3OY5VsisnzG
 Dcd9wCmwRXTBdmoVLK6pkdFCI+mKkcy4aztYkYDq/ec1UKEn82jVTWy0scujMoKtzU3f
 HCJS80qto+zjEtyGM8J8VzgUUdBlLASXPhyAZIWBVYUtg39TvChyfGH8mEHOjsqvpe17
 bsAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhrew9BXU1opDjvYAj+b6orpXBKCUxsBYMsZgCy1yjAZsE7/SpqENF26yla4kXTcFtBrtC2sLRFw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyysShUoImdNqvCiayxyDnx6krRwEXz7c3HqA3hvc89MI81Ot6y
 OP73YdV9q/xkial91yEJOGMHJb8CwPUJu4fWsSknFSDErbKSzXr+Id61kRVvYDXHA/NLDrtvkUo
 lXwXGhNQRj/6unzJdvOCqkD35valXflrVDwRLlnX38DKCJZ4SfcpcG3ihC55fMDXGdg+CAh7KQA
 tvwT6R
X-Gm-Gg: ASbGncuONt21FpS2UmN/5mhxX/tljAN9vpgp0OGHjCImjkc7+p6+HKpWWckrafJnmsS
 2JYeHkOAnp0nJr0qRwxMLnJbdNb1+UNAe5cppht7EgSeTXHJb1xeqqJVDoqR66zx2RwevVKsoBu
 ek+nVgmnO4MOKpbMNh/g5IyLom+iGrJe7jJATahC3zrVPQWpsKTjWYRtK+sKj9woLpKExBj18nD
 sTx3IpKTkWq2OcFkz2XG+dtW5xvoq87r0SYp04LjzOCVq6z1hW9ayu5n1SqRyP0ViJbS6pdEwQg
 wwXLBSPY1BubcP8QoqY/8NzxKIOfe/8oRdSFS7G2OpJK8Y2P18/Bip64bIT3lhsMWtFaPVWJN4M
 qSVvubo0b/FNAHp3DjTvtgFzFOYoCIPLdJHwtd/NZ5DwU1bFDlwCU
X-Received: by 2002:a05:622a:438c:b0:4db:e906:21d5 with SMTP id
 d75a77b69052e-4dbe90625b2mr119075911cf.5.1759136407860; 
 Mon, 29 Sep 2025 02:00:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGs7jT0iWYWJCXgAu4QKcdkIglyJQcSU8ATVnEsnVaemdKEYJ2P7+RTKKGMTHiRPC2iB6Hy7A==
X-Received: by 2002:a05:622a:438c:b0:4db:e906:21d5 with SMTP id
 d75a77b69052e-4dbe90625b2mr119075461cf.5.1759136406987; 
 Mon, 29 Sep 2025 02:00:06 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-36fb7713a3dsm26929591fa.42.2025.09.29.02.00.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Sep 2025 02:00:06 -0700 (PDT)
Date: Mon, 29 Sep 2025 12:00:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imre Deak <imre.deak@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v5 2/6] drm/dp: Add helpers to query the branch DSC max
 throughput/line-width
Message-ID: <agzmuyty22gxtm7cwpdl7ynmrubot45e65tfavbq5muamn6qnj@2wsbjqlc3pye>
References: <20250926211236.474043-3-imre.deak@intel.com>
 <20250929063644.533890-1-imre.deak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250929063644.533890-1-imre.deak@intel.com>
X-Authority-Analysis: v=2.4 cv=DZAaa/tW c=1 sm=1 tr=0 ts=68da4aa2 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=e5mUnYsNAAAA:8 a=QyXUC8HyAAAA:8 a=wX2-_eRYuEKPtGxe6ucA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=dawVfQjAaf238kedN5IG:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAyMiBTYWx0ZWRfX7/K7naGmu4l4
 GxJQOd+sC32U5KeLavk+yDUuQAAa1JXXIhAoJPR089w3XTNCcnnzuF1Xc1sX+dRzfZenHgzgUSt
 yza0vePDZAvqyAPuZvMDG2rUW5vUJC24VXNpYfleedMhRTH7B7pwspXo1IQ0p/t6BFiaYY3VeeA
 hkblBGMGL6KXzrAY+VdLCYd15D7/kL1l+IRdh8UwEzCuSq8otZ7yKH+7TNbR+k992DKzblWUW7T
 lAK6xv07XJ8qWy/8H40eMc1MQcy9U+ZXkQ4A8Ro7jOSul7n4SLTWwmR7f02gmn2G5y5LsMN54Rt
 A1f3VoJ2XyWYlxletT2kPIHV0SIXiRKjMXyEawKr3rL2u3RA5UK5tU8anmvjMsz2k3QB+IDNYXR
 yeY/Ur/O1BoB8NkDoRG6waN11AfAqQ==
X-Proofpoint-GUID: Bhn1pPQWAszfs2YTcrjCpiPURfhcl465
X-Proofpoint-ORIG-GUID: Bhn1pPQWAszfs2YTcrjCpiPURfhcl465
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_03,2025-09-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270022
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

On Mon, Sep 29, 2025 at 09:36:44AM +0300, Imre Deak wrote:
> Add helpers to query the DP DSC sink device's per-slice throughput as
> well as a DSC branch device's overall throughput and line-width
> capabilities.
> 
> v2 (Ville):
> - Rename pixel_clock to peak_pixel_rate, document what the value means
>   in case of MST tiled displays.
> - Fix name of drm_dp_dsc_branch_max_slice_throughput() to
>   drm_dp_dsc_sink_max_slice_throughput().
> v3:
> - Fix the DSC branch device minimum valid line width value from 2560
>   to 5120 pixels.
> - Fix drm_dp_dsc_sink_max_slice_throughput()'s pixel_clock parameter
>   name to peak_pixel_rate in header file.
> - Add handling for throughput mode 0 granular delta, defined by DP
>   Standard v2.1a.

This one got sent as a separate V5, without a proper changelog. What has
changed?

> 
> Cc: dri-devel@lists.freedesktop.org
> Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  drivers/gpu/drm/display/drm_dp_helper.c | 156 ++++++++++++++++++++++++
>  include/drm/display/drm_dp.h            |   3 +
>  include/drm/display/drm_dp_helper.h     |   5 +
>  3 files changed, 164 insertions(+)
> 

-- 
With best wishes
Dmitry
