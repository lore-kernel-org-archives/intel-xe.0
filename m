Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90D76C87FD2
	for <intel-xe@archiver.kernel.org>; Mon, 11 Aug 2025 10:26:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 584A310E422;
	Mon, 11 Aug 2025 10:26:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pWvBRDlF";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D3D210E423
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Aug 2025 10:26:35 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9dEwX021860
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Aug 2025 10:26:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=/4tDhgxFTFm32rKj8OsdQCqN
 y65/pv1+di1cZhSEdpw=; b=pWvBRDlFziWWj5HuLW6H45HJTcZttvz9ESkLk0uM
 NtbaIchPIMRUyLPnyIR695bRbOQWNCjwWRwgAk98kCYBnBk2qh5jQ9es6go3Dgpg
 SX0ssCGAI/alg9bRIIxq88G2InB6hzr1moD5U2QhV8hcyL7P2ZOnVtuws4dAJudD
 P4Vl5Qf8a60HnW3Xrnv7Nj+bn70KreoYJvyxCBy2nKp1EHBjp1VEjRzZoYaV7NRR
 wr8dg/RegWDNJIexQISYO07Ju5oRebJOEov79b/yNy4tD2rXH16OGqiewyhKLbnP
 XhaGft8cga81AclHPne3cWxWUUNOydlCvoPt9MBVsTVZ1A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxj440ub-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Aug 2025 10:26:35 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b061ad3cc0so132744021cf.0
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Aug 2025 03:26:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754907994; x=1755512794;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/4tDhgxFTFm32rKj8OsdQCqNy65/pv1+di1cZhSEdpw=;
 b=RoZORXiRwYLZLOQGO4lNxG7CNcQzUPMKOUEpSbrKuVVFGX3Nw8I+WgPPTAB08JrpyD
 eeHSZ5fIkonAmSXXntSlb8vuEvqDNcUrADm+glH18ZVbA3AGD7/Ed7RihV3+u7/mRn8I
 3IrR1jqs+WrTJ0j5qaQM2r+st3zGaz9SnTI/SWz7cheLvB3Wz5kevhZ5J3pIkdqDeRsZ
 VEqwXw0XMixOeB8chQeQP4lr5itdzqxkbGKqXp/w217S1hs+plx85XboX0r5CToD6vRV
 CjftFiEXbkNYcbG6m8zHLqPnP+vTUbG84pL2MlzknbdqmiphaVK+vlVo0I38T82caZTW
 PATQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVGM1TFP7+we1m2f7YBHgSwfq/75UvGq1+AT0kikSbGpCxkGnc1019jFFg01OVA5uxgNDJ/vJ+Ww==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwsPUWIBTsyVy7a2Bl03Q64kOHsVvhH8hsPRtpztROSU3TrGOaR
 NpbCZj9bkj9/MNCI/QSHTHTz0QDMJbSzYqFPh+75rFOt6QlVkrrU/+bE6K3s0QFvkvhk88OzgCa
 Djp9geOQhHUFZQY6vQ0O54uCWg1HMsGwR9aqaiF3/6D71086tA2h2T9hHVOvzLRiZcfjqMA==
X-Gm-Gg: ASbGncsNfHZmUzN+QHHzK/J+A9sVQncmhKG7CVdBPc6Se66dJDvjACsb1GToTIM/F87
 ySVgYhWvgTAxVd8HkTeVLS/Ms427CI0ylbkUftcV7tixslb27OHjyusTcol38dTNEHmS7SUMDWr
 caB9uA7JY2ZgCjzE2CV8CMBECL4bbMfJ95n/rhsUMe5GxA44EXhRrxj6XAq3M4YZZ9d+ywUbjM4
 Y3xCk+IUt4tbni3Bs6t7t3uhLYafl1rV587M2R7b08rcqzbiipqEy2QX5xkxB6H+hFg2gB1Tzti
 mWIFLMizeLEedTxM4RSO/bi3NInFeCRs3sAjgw3q6eUmDmDFQ3Sa6vFhsVZVZ69W9AJpfVPANZn
 N40L821vO909ejufI29OGAUk0UDM6iODCLI4Cjmq+rA0pRo0DXVgS
X-Received: by 2002:a05:622a:ca:b0:4b0:80c2:6674 with SMTP id
 d75a77b69052e-4b0aec9df57mr160251211cf.26.1754907993651; 
 Mon, 11 Aug 2025 03:26:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBtZfXQ4QunBGnECg8IgNPTThfg2oORkBUD9GYQsf+7kkjIYq2XXmXZ3mbOFg4UkIpF+IRdA==
X-Received: by 2002:a05:622a:ca:b0:4b0:80c2:6674 with SMTP id
 d75a77b69052e-4b0aec9df57mr160250851cf.26.1754907993170; 
 Mon, 11 Aug 2025 03:26:33 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-332388fef31sm41894971fa.70.2025.08.11.03.26.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 03:26:32 -0700 (PDT)
Date: Mon, 11 Aug 2025 13:26:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>
Cc: kernel-list@raspberrypi.com, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, ankit.k.nautiyal@intel.com,
 arun.r.murthy@intel.com, uma.shankar@intel.com, jani.nikula@intel.com,
 harry.wentland@amd.com, siqueira@igalia.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 liviu.dudau@arm.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, robin.clark@oss.qualcomm.com,
 abhinav.kumar@linux.dev, tzimmermann@suse.de,
 jessica.zhang@oss.qualcomm.com, sean@poorly.run,
 marijn.suijten@somainline.org,
 laurent.pinchart+renesas@ideasonboard.com, mcanal@igalia.com,
 dave.stevenson@raspberrypi.com, tomi.valkeinen+renesas@ideasonboard.com,
 kieran.bingham+renesas@ideasonboard.com, louis.chauvet@bootlin.com
Subject: Re: [RFC PATCH 8/8] drm/msm/dpu: Adapt dpu writeback to new
 drm_writeback_connector
Message-ID: <ag34es6qm4b22qti4hbsju6sk5ny7ixq5fiwtni22vf7tvx5ba@ficntlx6i2hs>
References: <20250811092707.3986802-1-suraj.kandpal@intel.com>
 <20250811092707.3986802-9-suraj.kandpal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250811092707.3986802-9-suraj.kandpal@intel.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNyBTYWx0ZWRfX/UhcSIUz0qBP
 veZEvd106xX9C/05ipl18TG28e84RZSeNMLQA+4xBmh8u1nAms1zpSSaztSJoQvL3cqMNa21Eq5
 zle5EDRtWpmQcwc/JsUNwWskp2p3gy6au37ULGLUbE4kM50UlqhYthMMA3dj2WJhH9INMF6a7GS
 871cmGQwrJ1Mo+PtWQiU0WIRFDkTj5E8bgbeYU7tmPOkKnUIgJ8HwFnuptoHZHYuPCCp/qxyI3l
 S7D4h4L72cz+HwMhSaC7eAhIaNajdNxes71vwVw8jWboB1gLSamy3fDl2oTToolVHvYfLF+LLbT
 07AdfLzvz0FVTD/tK1bN+6pQr1owd+m/ul+q9JI6pXSKcHs+cMRGCprRjNdwbRPGQOrHVUg+SIo
 ajnGp8/y
X-Authority-Analysis: v=2.4 cv=fvDcZE4f c=1 sm=1 tr=0 ts=6899c55b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=QyXUC8HyAAAA:8 a=Fxrl8DOH8qgm06HfJ5gA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: vYyWFuazt3s33LXqcK9q-e4X5Dt1Qpbg
X-Proofpoint-GUID: vYyWFuazt3s33LXqcK9q-e4X5Dt1Qpbg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090027
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

On Mon, Aug 11, 2025 at 02:57:07PM +0530, Suraj Kandpal wrote:
> Now that drm_writeback_connector is embedded with the drm_connector
> adapt the dpu writeback functionality to this changes. This
> includes changing the drm_writeback_connector to be changed to
> drm_connector within the dpu_wb_connector.
> Some other changes are done which are a result of the all the above
> changes mentioned.
> 
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c  |  3 ++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c    | 16 +++++++++-------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h    |  4 ++--
>  3 files changed, 13 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> index 56a5b596554d..0e60c1ac07c5 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> @@ -484,7 +484,8 @@ static void dpu_encoder_phys_wb_prepare_for_kickoff(
>  		return;
>  	}
>  
> -	drm_conn = &wb_enc->wb_conn->base;
> +	drm_conn =
> +		container_of(wb_enc->wb_conn, struct drm_connector, writeback);

Just store drm_connector in dpu_encoder_phys_wb instead of
drm_writeback_connector.

>  	state = drm_conn->state;
>  
>  	if (wb_enc->wb_conn && wb_enc->wb_job)

-- 
With best wishes
Dmitry
