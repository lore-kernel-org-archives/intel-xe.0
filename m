Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07BCAC83F17
	for <intel-xe@archiver.kernel.org>; Sat, 26 Jul 2025 12:38:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B94E10E277;
	Sat, 26 Jul 2025 12:38:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="T7zXasWk";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C16A10E277
 for <intel-xe@lists.freedesktop.org>; Sat, 26 Jul 2025 12:38:46 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56Q8ueDj007435
 for <intel-xe@lists.freedesktop.org>; Sat, 26 Jul 2025 12:38:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=p9WlLsI7wH4qRMkHcYS2d4F0
 b2ykbaMu84wDP9zYLAg=; b=T7zXasWkZ06zpnqARRkITEpUQPvghYuVTqKDO/c5
 DkNlyWVe2PJbAAVW6ID1DgAu11k444F0gxoGTpym5YSzRqTVjGwmq+qvzP59MbeI
 AFxGODu8ftka/jUJdG9NVBlaBdkkq8NNxh3l10es9Zu/y9kuUbtpaag0Ics9eTdX
 iCMgFtsvCEqzlk9ey+dUSeQIzrwGEUV8wOC7e1dRdB0z+H7ZaObisUUIyFfOHBNU
 6FwPDL/twmJ7RwBB3UwPFLoHa3J/WvttRasHChoWnfCerKu1LlVhtnVmG6YQi06M
 idJMXiQZZK6O6mdrXtPJKbWuQp4fMm2AZrk7h7qX2lPK2g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484racgghw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Sat, 26 Jul 2025 12:38:45 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4ab76d734acso81168041cf.0
 for <intel-xe@lists.freedesktop.org>; Sat, 26 Jul 2025 05:38:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753533524; x=1754138324;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p9WlLsI7wH4qRMkHcYS2d4F0b2ykbaMu84wDP9zYLAg=;
 b=O6xguw617HbBS2wZQb/PVrIVfOJc/+KhqwAu/fGVdvL64I98/47SeQ7PH8uwzCH3XA
 yOkrcUTIdz9++OvrdF9AGrd1y8Uy7zuyUx/aHR6XsFoimLOteKUcLdQmsM2kqETl1McD
 PajpJy0SrjpvOReaC+bsuFAtJoWLHPR0gFdX+fiFLaeUJcg0bD+QAuXq8eCQqJTl8im3
 DDEuW8syGi6nD+ztTkUqPGQp+/hRwOmhG9ReVdTEc4V90R29FXkSEkcQcV/w/itGmHaN
 Gz4wlWKetOJ41ZTeVTGWLVcYXQZQOK/fa3ZQdSVlPYmAwSkU3SVX5azFpIXfsa9b2NbU
 G4oQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSX2rgxX0kIQ3QzneiqXlVo+m6qDhIXOIfttE8D2RLhy2FCiCCFkJhMb4D+S0NcD7JUmRHsbTd9A==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzTfmmr4AMfHozhueQmn1w0debabv2yYGmr0RCH00NsmE+LXFb8
 ncFuelBvht8WF4elNjr5RRNAnqiDbYaZdE4h16hbE/AtoEL7gJaN/aMe/mfNZ3v2EwE8hiEs8Ht
 pv1GwMKUxP/jp+d8QtlE5/A6JYzxIeY8S2g+YiWfPAHjTPbEUEzJ/RjIwbLi6usheO9CvsA==
X-Gm-Gg: ASbGncu3aqgNILa2vJzGtoS+LM4BYnYR10w7N5Ht5saVextCm8t6nHGjzm5eTk5vMw+
 F5d/f4ANBPys7YwVuVxxdEYJzR8bGprXbt8kspNuuXBrn68ZrLN4qwognRb+LXXv8HppZabaUmg
 KKwj+hh+zjCOdmLvbZhWNePMKydgJ3agtpO/aX+Ha7ovA9znQcMdIfWh4QDcmTX3qbmXiJ8zVUq
 dMjxRNAqdHRAbaCPu3YWM985wHa/KgXpISvyFoWty+LsK3E12bDA9Jhc8Nw8jL/VjtdHkp/+OeC
 b4BgGda7+5Nm92nLGsE09TEX3rlxQts0xJh3S9Ab8Ti3TCJmJ8bXE3f7I4dhMs8uWnQW4HLpvqk
 bJ59IHe5+P7xqIs6GosMv5UBAL53CwFptEGD4JffJ43b980310Uk0
X-Received: by 2002:a05:6214:c64:b0:6fb:265:a2c5 with SMTP id
 6a1803df08f44-70713d6d5d8mr103943166d6.17.1753533524546; 
 Sat, 26 Jul 2025 05:38:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNpnjyLFNka9PviBkscyS3Ceub+UziIG7kHudjcBkOBPWBI7J1LtbvLyuYM7A/xBfUxwo1Og==
X-Received: by 2002:a05:6214:c64:b0:6fb:265:a2c5 with SMTP id
 6a1803df08f44-70713d6d5d8mr103942896d6.17.1753533524022; 
 Sat, 26 Jul 2025 05:38:44 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-331f429f382sm4288081fa.92.2025.07.26.05.38.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Jul 2025 05:38:43 -0700 (PDT)
Date: Sat, 26 Jul 2025 15:38:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, ankit.k.nautiyal@intel.com,
 arun.r.murthy@intel.com, uma.shankar@intel.com
Subject: Re: [PATCH 18/28] drm/i915/writeback: Add connector atomic check
Message-ID: <75d63c4377tss5cml47qu3ferkwuod7rceox6t5lrjqdzykuxx@q26ta2glzndw>
References: <20250725050409.2687242-1-suraj.kandpal@intel.com>
 <20250725050409.2687242-19-suraj.kandpal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250725050409.2687242-19-suraj.kandpal@intel.com>
X-Authority-Analysis: v=2.4 cv=WqsrMcfv c=1 sm=1 tr=0 ts=6884cc56 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=QyXUC8HyAAAA:8 a=7yYpvgMhsW9ct4Lpu_sA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: eZ7t3iVx7CFaJV-V9L0ca0G1q7S9Dqip
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI2MDEwNyBTYWx0ZWRfXw7xaL59W/DJV
 vdHaaGy4eGj6G+fRk6ea1h9Qu4uVTyf1I9cvW7/tR0x0jrkAzQyg4JTEmO5K6k/osVeGdzNsXuz
 +GJeVWKseceuPaZ8BanFXV2QVdIYLHeOGu5mqlbI9wsnWDSGV9k0LgTMm77NEEmQy+BI+YXb0qI
 QN6PSWEYVAzVJ87DU9DhQjTARDoRLBQww7plPKdFWZB1FfjNiZuWiumYArqUVj8O0PnX9C0E3n0
 zUIZs+0rbowN1G1vUyKcyPLGbug2naIv6MdR95ZLWcodhFT8tzZg38JCg4K6y7KcSc/bKfz910M
 RReFI86cHI0rwYDgCg4+cpIidlYqOAZt7a8MvE9UniJf0dxcPFvmTtJgGP8FVd687udXAGqHrrz
 24xpHgofjcp34vrabStTI2qx7aiXeJ9nWT7iVKwF5GhWSoH+mctUwR4BOE2lvgLZFvhpFlsn
X-Proofpoint-ORIG-GUID: eZ7t3iVx7CFaJV-V9L0ca0G1q7S9Dqip
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-26_03,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 clxscore=1015 mlxlogscore=974 impostorscore=0 mlxscore=0 malwarescore=0
 adultscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507260107
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

On Fri, Jul 25, 2025 at 10:33:59AM +0530, Suraj Kandpal wrote:
> Add connector helper function for atomic check which sets the
> mode_changed bit and checks if pixel format of fb is valid or not.
> 
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  .../gpu/drm/i915/display/intel_writeback.c    | 49 +++++++++++++++++++
>  1 file changed, 49 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_writeback.c b/drivers/gpu/drm/i915/display/intel_writeback.c
> index 9b2432d86d35..7fb30cc61991 100644
> --- a/drivers/gpu/drm/i915/display/intel_writeback.c
> +++ b/drivers/gpu/drm/i915/display/intel_writeback.c
> @@ -186,6 +186,54 @@ static void intel_writeback_connector_destroy(struct drm_connector *connector)
>  	kfree(connector);
>  }
>  
> +static int intel_writeback_check_format(u32 format)
> +{
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(writeback_formats); i++) {
> +		if (writeback_formats[i] == format)
> +			return 0;
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +static int intel_writeback_atomic_check(struct drm_connector *connector,
> +					struct drm_atomic_state *state)
> +{
> +	struct drm_connector_state *conn_state =
> +		drm_atomic_get_new_connector_state(state, connector);
> +	struct drm_crtc_state *crtc_state;
> +	struct drm_framebuffer *fb;
> +	int ret;
> +
> +	/* We return 0 since this is called while disabling writeback encoder */
> +	if (!conn_state->crtc)
> +		return 0;
> +
> +	/* We do not allow a blank commit when using writeback connector */
> +	if (!conn_state->writeback_job)
> +		return -EINVAL;
> +
> +	fb = conn_state->writeback_job->fb;
> +	if (!fb)
> +		return -EINVAL;

Other atomic_check functions return 0 if there is no writeback_job or no
FB. Please elaborate.

> +
> +	crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
> +	if (fb->width != crtc_state->mode.hdisplay ||
> +	    fb->height != crtc_state->mode.vdisplay)
> +		return -EINVAL;
> +
> +	ret = intel_writeback_check_format(fb->format->format);
> +	if (ret) {
> +		drm_dbg_kms(connector->dev,
> +			    "Unsupported drm format sent in writeback job\n");
> +		return ret;
> +	}

Missing a call to drm_atomic_helper_check_wb_connector_state(). Please
use the framework where available.

> +
> +	return 0;
> +}
> +
>  static struct drm_writeback_connector *
>  intel_get_writeback_connector(struct drm_connector *connector)
>  {
> @@ -221,6 +269,7 @@ static const struct drm_connector_helper_funcs conn_helper_funcs = {
>  	.get_writeback_connector = intel_get_writeback_connector,
>  	.get_modes = intel_writeback_get_modes,
>  	.mode_valid = intel_writeback_mode_valid,
> +	.atomic_check = intel_writeback_atomic_check,
>  	.prepare_writeback_job = intel_writeback_prepare_job,
>  	.cleanup_writeback_job = intel_writeback_cleanup_job,
>  };
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
