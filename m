Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06882C87FCA
	for <intel-xe@archiver.kernel.org>; Sat, 26 Jul 2025 12:41:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF15B10E47F;
	Sat, 26 Jul 2025 12:41:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="PFy9HuK1";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F73810E47D
 for <intel-xe@lists.freedesktop.org>; Sat, 26 Jul 2025 12:41:06 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56Q3XK8p011050
 for <intel-xe@lists.freedesktop.org>; Sat, 26 Jul 2025 12:41:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=i6whXItl51qQxYCKews8I6N2
 kwKaahew86LQlq11tEE=; b=PFy9HuK1HhCu7y6xvrIoQ9RdPCkpUehPbgXX8SIj
 ZWNbd/33SHTvjy/a2OVOMZef+gIoJEhk1wCixL0ltamK8ryf3hhdm6pTjSrABEc4
 3jd4vfMQlAAw3DmdnYzny4RedbzhzsVPYLG8s+erhEog9HHA9/MN4w+LMPbewfqV
 rn/j796D324vgRnzuXbV/2TfZSRhN7QAUfgJ6dAUU2/zwgNKGECnNDELLz4OYz45
 1uH+HPAXnvwLYAmdpWxFac/gpu2lJaXx1zAvqE57BQ0GfPasT5wgaiqnelmAgMPk
 jCrpzFf0phDxGiLHL008PPaB/ZZYxQJ0vTIgIZ4nkQIdcQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484nytrpxb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Sat, 26 Jul 2025 12:41:05 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-70708748fbaso48105536d6.3
 for <intel-xe@lists.freedesktop.org>; Sat, 26 Jul 2025 05:41:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753533664; x=1754138464;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i6whXItl51qQxYCKews8I6N2kwKaahew86LQlq11tEE=;
 b=YAg1IPAef5OSXUrnUujqKbAXFoApleSnezRfw8oSf4NylqbMTfWJjVVhXgsWnhF8Lv
 JdW++UdF9yPx4Kg4EzOkULmbBt9Z7ix+P2IOU5B730+jcWlQ5LiHCkOY3VNesqHNFbBO
 9aMsewp1D1t7p4I/GEWfhEaVIzgEiHVRa9jAp5C/aZ9ZSY5Sm2EmkKQDFNl4AhhW25bI
 8on8ZrH4gWy4zu2W8LtjuUlNkaHU+O0wCLT/yxvyqPjj7xNDqKdxYoznCAfRHAZ40jos
 1X0SmIXpaMGxSzZAiUseie9jdprdzacQkjtstPynjCEBXZhwX7n7jOpNYsUnCck9NxlL
 fr3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlAzu4ZN6N2UYf9CSSuCNrds6X9r12X4254ACbfaZ1ZRXLVL+yFSWHuY6yPU9GE9yemmmTBtAakA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyVOKy617oz2FuCEvus6agTrMye6TPsebE1vDK0xf9/dAD+qo5r
 65z0336UGR7MoSXqGNs8LfZbGEmsqsxv7ljZyGayWFi2F45ahTbbPUC1yFMG03OIx1seDH7kmNM
 1Eb9U9LRHZMkMGdrcUU3nCD0XyexLG2ky8LWTc766FigUkj7x7R2Me46MhltG+HcnralpIg==
X-Gm-Gg: ASbGnctW7NPLVH9VpnkOmWxB0NQHFxS/HzlN99sn47S52/0lkKbF0DOScEpzckcqywK
 dbOCFonxS082PpgStAxYsIzHa0xV0yFLbUCfUnDeg29fPrDBiwazucHbm4OrnLRsL3O8QSBETe2
 4doip1h7fYFKtgM5/8M+OkxmrOvvgX9v6ksdAwc7pNU7PyFMPY0jJ4xsK1CMUP+Ko7WW49Any4Y
 GV2dZIl+fop9PTxFJjQ948EOoUJcNf26d9vyzrLThwWJVd2W1u+s0w1HF219zITQwchfkQbmdxW
 5iFp1XUkqtUWNVWOIMpMkhNM7jlm3hjr+5ImF7k2NKCinwZlwKb6+GYfPAur9P59lrDhJqp1qDL
 UN88Esg0o96GJEWM2GArQN6OhR+aFbMxZQvdpdEP8kvD23r6jGxqq
X-Received: by 2002:a05:6214:529b:b0:702:da74:d022 with SMTP id
 6a1803df08f44-707205d33b1mr80399166d6.35.1753533664088; 
 Sat, 26 Jul 2025 05:41:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPQDX73wCshkrBut65BKJsC8lKGRUiTfd5OXC0vTlX80yzrSUGlo1K4bxyQk5IG+160yXWeQ==
X-Received: by 2002:a05:6214:529b:b0:702:da74:d022 with SMTP id
 6a1803df08f44-707205d33b1mr80398866d6.35.1753533663708; 
 Sat, 26 Jul 2025 05:41:03 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b6336387csm426079e87.107.2025.07.26.05.41.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Jul 2025 05:41:01 -0700 (PDT)
Date: Sat, 26 Jul 2025 15:40:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, ankit.k.nautiyal@intel.com,
 arun.r.murthy@intel.com, uma.shankar@intel.com
Subject: Re: [PATCH 17/28] drm/i915/writeback: Define function to destroy
 writeback connector
Message-ID: <3paeal7ew2pjo6h23rr4t7fqz33avbyxuync5cxnxlh7w4xxr6@ja77buhqtlva>
References: <20250725050409.2687242-1-suraj.kandpal@intel.com>
 <20250725050409.2687242-18-suraj.kandpal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250725050409.2687242-18-suraj.kandpal@intel.com>
X-Proofpoint-GUID: pGFtfrMIGHSU3oevlsn2fDhw6lCeDPCL
X-Proofpoint-ORIG-GUID: pGFtfrMIGHSU3oevlsn2fDhw6lCeDPCL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI2MDEwNyBTYWx0ZWRfXzNUOtVxNwwUW
 ubnJ0DpZ4GGGxSAJXls7rJ30JxwMbt7XIwiIQ4t1tYdL1JSAkB6zuUIsoNHU3c1pMoxx9k41HlY
 Ev28acBVx5XdfxXUX83wDy4Wyjcua49RCV1j1kBKNU1QNvNrzt1GdQ9qnm/VJGwnBsVqWmBMGLB
 mLTPPUGjBCph/edr9EYEhPQCKi2xBhivB1hAqs/ER+MIfD1w+7oUopEy0ZPt/SBsCfQDdKkPCrl
 0Q/Fx/UuEzDREpzf0JumwGtjxXEoUiL+z2ArDbJtec+R21jPVukxobVYoexu4yAiYHRQrkuYNw0
 ebEoNppNSh/VIhRzT+itBrJNeZc60yOq+sSowQFH0Hjqaye8/HnNJVwGZ5SPf3On8DJeXxuBgE6
 BlaN9vjvPnfbj/KVecNuTHDbXV3V9x+Y9LJuJqKYGJqQEVU4LDVjpbkNqexRuiGMlLpXsMd3
X-Authority-Analysis: v=2.4 cv=CLoqXQrD c=1 sm=1 tr=0 ts=6884cce1 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=QyXUC8HyAAAA:8 a=DSuhFVeksThMRZl9yJUA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-26_03,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0 suspectscore=0 mlxlogscore=968 spamscore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507260107
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

On Fri, Jul 25, 2025 at 10:33:58AM +0530, Suraj Kandpal wrote:
> Define function to destroy the drm_writbeack_connector and
> drm_connector associated with it.
> 
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_writeback.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_writeback.c b/drivers/gpu/drm/i915/display/intel_writeback.c
> index def33191a89e..9b2432d86d35 100644
> --- a/drivers/gpu/drm/i915/display/intel_writeback.c
> +++ b/drivers/gpu/drm/i915/display/intel_writeback.c
> @@ -180,6 +180,12 @@ intel_writeback_detect(struct drm_connector *connector,
>  	return connector_status_connected;
>  }
>  
> +static void intel_writeback_connector_destroy(struct drm_connector *connector)
> +{
> +	drm_connector_cleanup(connector);
> +	kfree(connector);
> +}

Nice example of what I've written in my response to the cover letter:
without this commit we have a memory leak here, don't we?

> +
>  static struct drm_writeback_connector *
>  intel_get_writeback_connector(struct drm_connector *connector)
>  {
> @@ -208,6 +214,7 @@ const struct drm_connector_funcs conn_funcs = {
>  	.fill_modes = drm_helper_probe_single_connector_modes,
>  	.atomic_duplicate_state = intel_digital_connector_duplicate_state,
>  	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> +	.destroy = intel_writeback_connector_destroy,
>  };
>  
>  static const struct drm_connector_helper_funcs conn_helper_funcs = {
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
