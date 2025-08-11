Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3720C87FDB
	for <intel-xe@archiver.kernel.org>; Mon, 11 Aug 2025 10:13:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 465D310E106;
	Mon, 11 Aug 2025 10:13:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FDwP+B0O";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B77A10E106
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Aug 2025 10:13:40 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9dEvE021860
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Aug 2025 10:13:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 tQBekwLY985lR0kL588BU9IYUYSsm3EJi76WLENqjaQ=; b=FDwP+B0OX5UBuh1A
 yaBnSgBA4PZ6KYN6UyxgXDpyNLwikqLtNO6NVZchMnFrdq1fHAr9zI3JLW/AKlB5
 nxIdKbXb87PbAZ2UiPni3kloNPTITgFmGv6lF1CH2AdwpxGy6DNhc7/lMRaa26ok
 AXFCp45EK0v4y/nT5fwiGnPWYU5wcC6mTKy1VYu3ol63+TOPdiuiJhcv9r7YqKYs
 RQyuqXukejuJ37d/tRE8V2Cn/2VVJ0n0OTxLwyvmy5rBgwi3p4b6oJM3S+Eqe5Zd
 9GSCTxs/jeBsJi5cJ0uWNqxOvHZKxGtVOz3gUSCF+MmelO9zM2JtUXFL9SlErhyO
 3BHiYQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxj43ysh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Aug 2025 10:13:39 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-7074bad04efso94474446d6.1
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Aug 2025 03:13:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754907218; x=1755512018;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tQBekwLY985lR0kL588BU9IYUYSsm3EJi76WLENqjaQ=;
 b=wTt0ixqJ3CqBWKOI7PcAlo1tGQb58u56tVSH71oPfgGJGAmhDY0F/AU0GfWz2HUDU9
 zl4F4vpY9Y5q24ioNZXAvk5tYvx5/rpf4anFlKLn1kVHNLQCQHOTGrD4rRaYUrv/fC5f
 jeE5Q/AUkrxwR4bf4GUpABeHPSO4KNCmh9OpFRdesFRTh2o7YgVV2Ead2qfZP/HwhOjD
 igLCzOavNu7RL0Q7ZP+W6xwNOLOY5OM8MuC9DmtRN4kidCsuki8Gz75N4B6UhS3/AdM2
 P4orGhVoxIwVbE6vR88R2XQGhrnY1grUGt+K//NC6Ck/KEgzJA0zPPA/m3oa6x1UdhXA
 1TeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDDpCiE/W7odwSGbF7mkYAw10FTUyge4MxCpRm1cntT3L0m2C44YtthzVHl8pczuecRYkIdFwv7A==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxqMhdcz/dp7a7WB132X7AVMELTYH+Jcrj6qdc65noVmuSz9ddx
 gN0gAVDH4eKrVjzFwY/PHF2dqqMQXHutGdkvvsPhTc2yJq/imaGqX9J2b+AcCEF/2Kp8qg9FzuJ
 nDEfQzcOOfyrWWtqgXgGtH9VfT1O7HBE26oidb45OXCjW+3kqg7y/4ICapkArkmvyuE349A==
X-Gm-Gg: ASbGnct7KXebjPXajXHaeCYhNyYx6YFpBMn2g5zdUQDTr8RhZE9xMMaUCmwaCYo6WDB
 vSeMCwvVIZ1e1J53R3PALJS93rHYo+mtXRXpGrJ646XyKAEi05Jh603gRGeyP2MvwrGk8udeAIk
 HtAyCPN1zh1afezcM4AUjwYUbW2urjie2vg1TnhZinRpm0dNRhB3U/YYPsfaJLKqTXlBwB3ukNB
 cfLvL91pHJmt2gnhV9U0S5WUylbeD9YBEYZS5KEDw/lI7eEItUznJb40jGAWOrSKSsD6PT5xKLQ
 iXh2qeZ9XfgfXcwQzHzH0/fFwzrIaIAls3AkigpyNjQNF7gTv+FBWPzDnjXq/giZwuC9KQYbzdG
 n5yrt7O6b4MLepaC9GW4C20mEJ4RISjDFESYrIEujQlL5r3s/k7xh
X-Received: by 2002:a05:6214:2422:b0:707:6409:d001 with SMTP id
 6a1803df08f44-7098943a0camr242700276d6.21.1754907218059; 
 Mon, 11 Aug 2025 03:13:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9BY/zT1y+b3ji4GZxhC3ZVhQrv/r/mWPNZE1y3jpndTSli2Cjg/bMQSHGPbSf9yhMaetFWQ==
X-Received: by 2002:a05:6214:2422:b0:707:6409:d001 with SMTP id
 6a1803df08f44-7098943a0camr242699906d6.21.1754907217606; 
 Mon, 11 Aug 2025 03:13:37 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-332382a905fsm41770471fa.21.2025.08.11.03.13.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 03:13:36 -0700 (PDT)
Date: Mon, 11 Aug 2025 13:13:34 +0300
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
Subject: Re: [RFC PATCH 1/8] drm: writeback: Refactor drm_writeback_connector
 structure
Message-ID: <gvshpndrbnojzwewwa3icd5fjwecqj57jj6gfgoips5xq2oo3l@3dsebzcjwr7t>
References: <20250811092707.3986802-1-suraj.kandpal@intel.com>
 <20250811092707.3986802-2-suraj.kandpal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250811092707.3986802-2-suraj.kandpal@intel.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNyBTYWx0ZWRfX/nuz4wGSwcF9
 l9rcaOsrotTvX4dMRUzL86sgYHF0QyXYCb+CO7NuqOp1PDac479DGjAthSKxr3Ik/CTXgkq2c2K
 omNU5dZw7wDfMX96lgUS/kFW/PJ7UG6n8yVpD8LSOeinZ8u0/PvqswNuoH8GwMymaBa7FzTzQ9V
 JHHp7zRIjDj7+LpArvoMIVSGN1p9LXA9tKWqO9+qhfaymG6IU8WRd6Zd8/bLDcpkZo3y9tpQzBQ
 bqK68Mm/X7wkMgMqe8dQvtOulXsjtF+bQiryAx6UoyJQCAdP6COnMDf60AXKVG9p3CF+sbmgFm7
 nEBF6lHTigI58NixBIs5gzhNTgDuv/CSwv0qlsbTa7Zay/R1TPffknGaKz6CWlXcR4ttwrxSBXh
 lqj5G+ol
X-Authority-Analysis: v=2.4 cv=fvDcZE4f c=1 sm=1 tr=0 ts=6899c253 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=QyXUC8HyAAAA:8 a=JhAXgKmwuo5aGy_CkLIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: v7PUre2-MNmRbL0GTdR_rM9SXbTGSd5G
X-Proofpoint-GUID: v7PUre2-MNmRbL0GTdR_rM9SXbTGSd5G
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

On Mon, Aug 11, 2025 at 02:57:00PM +0530, Suraj Kandpal wrote:
> Some drivers cannot work with the current design where the connector
> is embedded within the drm_writeback_connector such as intel and
> some drivers that can get it working end up adding a lot of checks
> all around the code to check if it's a writeback conenctor or not.
> To solve this we move the drm_writeback_connector within the
> drm_connector and remove the drm_connector base which was in
> drm_writeback_connector. We do all other required
> modifications that come with these changes along with addition
> of new function which returns the drm_connector when
> drm_writeback_connector is present.
> All drivers will be expected to allocate the drm_connector.
> 
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  drivers/gpu/drm/drm_writeback.c | 33 ++++++++++------
>  include/drm/drm_connector.h     | 60 +++++++++++++++++++++++++++++
>  include/drm/drm_writeback.h     | 68 ++++-----------------------------
>  3 files changed, 89 insertions(+), 72 deletions(-)

This patch breaks building of drivers:

drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c: In function ‘dpu_encoder_phys_wb_prepare_for_kickoff’:
drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c:487:36: error: ‘struct drm_writeback_connector’ has no member named ‘base’
  487 |         drm_conn = &wb_enc->wb_conn->base;
      |                                    ^~

Please perform step-by-step modifications, making sure that on each
step all the drivers can be built and function as expected.

> 
> @@ -2305,6 +2360,11 @@ struct drm_connector {
>  	 * @cec: CEC-related data.
>  	 */
>  	struct drm_connector_cec cec;
> +
> +	/**
> +	 * @writeback: Writeback related valriables.
> +	 */
> +	struct drm_writeback_connector writeback;

I will respond to this in another thread.

>  };
>  
>  #define obj_to_connector(x) container_of(x, struct drm_connector, base)

-- 
With best wishes
Dmitry
