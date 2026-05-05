Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66A44FF885A
	for <intel-xe@archiver.kernel.org>; Tue,  5 May 2026 00:35:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20EB810E06F;
	Tue,  5 May 2026 00:35:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UMZDiz0I";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NLqe/1Uv";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F416110E068
 for <intel-xe@lists.freedesktop.org>; Tue,  5 May 2026 00:35:52 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 644JqbxP331266
 for <intel-xe@lists.freedesktop.org>; Tue, 5 May 2026 00:35:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=NpX6cchQLSsH6LH2boJjUcfU
 CfkpNdpGQlSuk6n0mLw=; b=UMZDiz0I7lVUfm/VJb7KhVcl4ksimUeZ2YvWZemi
 gvyC9lm8YCaf93HJKZcXMKiH3bVfs2cC8kfLbOlgn12p0YG7rN5gbBkXSdkmHNsR
 k3BajHitAQWal8EG095jqVV4TQb9Uh0x7z35nkIxmk3ETMZqMYN9/Usl6HFCPqFu
 Dc4vQvTIYV3ERffkVHo3FZlik1dDnFmQ4g0O0vPkd1ZNm8nA3c2+4tS5Wunu89e1
 I9pFoVRPjsEm/6Ap4FSE8hYF1In9YYdhOwRnPwe5qpc5EC7mJI+RP1WgnUjzJ56q
 tb3EKQ8VElC15C6UTyOCY+g6FB8XTrmSyXZtLodOBmlxuQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxvr1a5tk-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Tue, 05 May 2026 00:35:52 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-50d84b5f73bso163591621cf.0
 for <intel-xe@lists.freedesktop.org>; Mon, 04 May 2026 17:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1777941351; x=1778546151;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=NpX6cchQLSsH6LH2boJjUcfUCfkpNdpGQlSuk6n0mLw=;
 b=NLqe/1UvwCvJG57z26zqiPGAzPLDEVLk0R3EalQxUWxdVY1KZujqZEA54pgz+Ya2Z8
 ctEbkqx9c//NsFIldhPt9AJ/EyzSTxDDRWv6zqIkjtW8c2bisWJeYncW3xyBeZ0MAaKO
 HLuZJIxS/gnBHUQ3qPu7J2Z4+25iQYUmJhhSuRA7tQWJzhHjIF827bdGugq83084wWRs
 rfMxXw9dD9/kY9GBmrLK4J1v5Z2t3ZzmvsWiSQGxFweWltpXujCYAca5iuU3zZ3Rg3lC
 bGvvC5RN4YUQ9blDqME0tzOfXqT+gB5CJJQiMKwwjX1BO3VrZkjMUvAvbtaLljYro0iw
 Gg+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777941351; x=1778546151;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NpX6cchQLSsH6LH2boJjUcfUCfkpNdpGQlSuk6n0mLw=;
 b=OYDXRJBqexCmNCB7zxEFZq6k22Z4tZIq6ltUrHc/DRvgXh0+9yYOUQrYWKdz24NLy5
 2rhVVLoJ12xuK7NPEP70aZ/bS4ofA5X6iYuITcBF2LnYxpWyFvuTJpa9PYo4LhgRYEjC
 srovIdyynPlckAoLrnEGsQvJTKMeqKMExghGTvryl3pg9eerVn+C6uQ1AoJQb9dcLpQp
 6i467+hk2N9ElSxkc/Qftzav7B/OQey4r4+EzumRTkbZaJciw5QJ+zKOrzHtAZ+cL061
 35pg8BwcTKnaZGLdYHhcssOU17KTihOK3KatwxSYWtATkJa3qmhW2HBv+9cicC5pR/DT
 /veQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/XKDgQgsX/jnGfFV7W79DPvPrcqAjxSauEJjX5vuhFLyLJqKl2+SLeoFGxg7ceFUX+KywiGmCGcA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxV1J1zQ76cyOxIZq6q6lyRmlqlfXzW7+eUJU2wHZ6Wham3FExy
 TxCKPHK84ANYJk6io+mz+AnMfap0Ob2DKVOsAq+yN9rc85YqPsC5X1EMHxI58Yv7XbTT/0k0cU3
 B044raMD/NUakyEhWU9Pp0dp+VGkYXNDByiCgwJ2IpA8wqbXBCbJcOyWkQl4LjaTRZ7Y3Jw==
X-Gm-Gg: AeBDievXa487V8Lw/7waOKyfIoey1KQqJG88wwZlZslAQblIYB+Fb3Nf5T1HMsaRZAO
 +nDa00OH05lY++lbwNefzg8kHMSFao1YdwfkNCvS7iaSAKCAXExBfsT68aqUB+DB7vqEIxyWAG1
 t07RnHx7zoSb3QfND156v1otHEBpNnhUpdC/kL1JgG/AL3/laU6t9BvbdJLxCB4Q5YXjysn3wWt
 nkcP0XXgOyjRpzxKopxyaSg7qt1++WqOo/tsa09sUvtVfoVBkSvytTJM0Qn7pBABI5OrKPiqHFt
 RoSoKyksZnXpNei2v1bw/zo0G33ZNNnkQrOLYLGpweOWYDiK2LeijYSvrwqk0458Ym8cMiYzs+W
 VLY71YHKzHbAIyDG+mA7dJo7f78bb20IMc9/+5swSLRqMwyhIrXX7w/GXyDKC2vJ9zxMDtpP5Sy
 8tj6uBfeODV3r0lF/F2cp0X3JkFCZAgqCKSZ/xrlioYK369Q==
X-Received: by 2002:a05:622a:4d8a:b0:509:238f:ad8f with SMTP id
 d75a77b69052e-5130698bfc5mr17753491cf.5.1777941351508; 
 Mon, 04 May 2026 17:35:51 -0700 (PDT)
X-Received: by 2002:a05:622a:4d8a:b0:509:238f:ad8f with SMTP id
 d75a77b69052e-5130698bfc5mr17753151cf.5.1777941351115; 
 Mon, 04 May 2026 17:35:51 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a85c3418b8sm3432152e87.64.2026.05.04.17.35.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2026 17:35:48 -0700 (PDT)
Date: Tue, 5 May 2026 03:35:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>
Cc: freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-list@raspberrypi.com, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, ankit.k.nautiyal@intel.com,
 uma.shankar@intel.com, arun.r.murthy@intel.com, jani.nikula@intel.com,
 harry.wentland@amd.com, siqueira@igalia.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 liviu.dudau@arm.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, robin.clark@oss.qualcomm.com,
 abhinav.kumar@linux.dev, tzimmermann@suse.de, sean@poorly.ru,
 marijn.suijten@somainline.org, laurent.pinchart+renesas@ideasonboard.com,
 dave.stevenson@raspberrypi.com, tomi.valkeinen+renesas@ideasonboard.com,
 kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH v3 7/7] drm/connector: Modify cleanup_writeback_job helper
Message-ID: <nfxifrthux5hej4foawtavpiaegtnorai5j5l5hljmrvxwi34s@nryizbirf3lv>
References: <20260316083008.87466-1-suraj.kandpal@intel.com>
 <20260316083008.87466-8-suraj.kandpal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260316083008.87466-8-suraj.kandpal@intel.com>
X-Proofpoint-ORIG-GUID: -90hdQD4XnJUzG2YLj5fnEEPjwA_uBtY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDAwMiBTYWx0ZWRfX3wqY4VRZieqx
 N1cGykxUHAdsXReiynr0S/2HRnsq579+z6+b9Q9AKvxk8hrRDEecxK9wN15C3WVg5b55H8unZsD
 CaWF1x3nspWpwKq4UvEoNf5Ko7LuTsJWAB1GFALxAMYBmwJb6Cv4JBDoVRG2BoHycwTSiVOxBMW
 ZE3Acue5dRHl19xKlIDwnw+VEamiMDBlMkPrjg+XD1C6+8jlTS7Wn+R9gaDYyL3QE8mgNM048nk
 9Q1ypKwlGiNJj84PYZyEzojCm2byz2TRCZCN+wDK1ya0w0YRLM9ce7hVcUp0Wu4ICg2MlEBMdO2
 RxeQNi16hjUZUq1xH8NHKSX7vEkzMluQvqhyJQqYVJSsgnJ70PkAvcdnfZHar8zTytA5cixfGmd
 SXPQNtSXz+RptKM3Cctd4coOKLH/3IA0PllOUM+EtoAW3r1hc1dD9V/JEdstcDdFOJuDSyzJOxV
 5z7MN9N7HJI6CFeGjtg==
X-Proofpoint-GUID: -90hdQD4XnJUzG2YLj5fnEEPjwA_uBtY
X-Authority-Analysis: v=2.4 cv=RvL16imK c=1 sm=1 tr=0 ts=69f93b68 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=tQ94oCB4lqOImTN_oEMA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_06,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050002
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

On Mon, Mar 16, 2026 at 02:00:09PM +0530, Suraj Kandpal wrote:
> Pass drm_connector to prepare_writeback_job since

Typo: ... to cleanup_writeback_job callback ...

> drm_writeback_connector now resides within drm_connector.
> It also makes it uniform with params passed to other
> drm_connector_helper_funcs.
> 
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c | 4 ++--
>  drivers/gpu/drm/drm_writeback.c                      | 2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c        | 4 +---
>  drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c  | 6 ++----
>  drivers/gpu/drm/vkms/vkms_writeback.c                | 5 +----
>  include/drm/drm_modeset_helper_vtables.h             | 2 +-
>  6 files changed, 8 insertions(+), 15 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
