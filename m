Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDAF4C83F17
	for <intel-xe@archiver.kernel.org>; Sat, 26 Jul 2025 12:33:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F7C310E473;
	Sat, 26 Jul 2025 12:33:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LYGuj1XW";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35B1E10E475
 for <intel-xe@lists.freedesktop.org>; Sat, 26 Jul 2025 12:33:58 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56Q3t2Hq003692
 for <intel-xe@lists.freedesktop.org>; Sat, 26 Jul 2025 12:33:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=w8cRMM89BCO/d2ibKR5H0J+K
 hadOlFl5UBCobrDClss=; b=LYGuj1XWNn7PAy9gSM1fBsaSEAPLeC2rogQ5BrHE
 eicGP9AbExnTrHUhfNgTokQKqGz0ai1rIOC4gyPHIaEiNegmsENPncV73LaQKflJ
 WglWPqSCffp9+9rnt1uYIOsTyvLu7MM9VjjkuLBvGqmm9W9cLq/AYSxgKPcZpCUE
 meIIftXcjeXQNlucaQEZBbUUG0OEzZ3tvYbiW398x5Pw7pfUxvGuf9Sf3EcgoOyY
 yjSdX4K8a5TI7cAgqThweKSte21+isdIhf3Mc7hCpkwv/S9o8X72k3uQyMpWzsNT
 mq++n8WO1qrfemRzqMUl4i4ltYez/XDnYG7+2L7e5EWzAA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484mcr0uvp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Sat, 26 Jul 2025 12:33:57 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-707205f0405so38092996d6.1
 for <intel-xe@lists.freedesktop.org>; Sat, 26 Jul 2025 05:33:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753533236; x=1754138036;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w8cRMM89BCO/d2ibKR5H0J+KhadOlFl5UBCobrDClss=;
 b=Gv3AoXg1O70Z35iYiZZmj7ecxwq/ZtgJgEXTYM3/RA37sOJMXU7u/Ajf6ei8PaPf7u
 up3kIq4UpmO0+1UTHMTvZATAyV25g/rtnr+HuKpFYDBmWkigNaSd7LRvt9XlsB9yrVDd
 XmyQWQyQjsdf+bHSnSFQR9o0+7LQN31c898I6jlU7rSNm2WksiKTsdSPebG88ImEBivw
 67X7thjIre26xMuQCXg0NnWc3dxwaMnKoSGVmd4hP05TLzmcwW3FGHJQ62fcUku/kiS+
 pbNsRGcOyDm44NO0mV3N7hv890GcvkXslFoI2EUJqcx0SrJIMZ1YPpUvwfAMvJR08F8f
 eONw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUH4n7D/o965Z/rS0IIvQCdOWngTgG8ql8euVp4GMw1ukRkeV2WM3Zn7iiRLOsPfRnBYpGPSAyPlQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwxKisvdPLmNLPGHgZbEcVezmGNO2wHYcrO4r5tiACO2ymq7Zp8
 RaWvqZWuEH3ETPc4QfO4jaTxLufzVQVCY1BmEC+4IqCIJJVvdxPFqBwUXmLD6QcE6tI/asmoKJ9
 jVpf+YuQ0Otx2KCPVR69nTE/4//HfXeIWd9P6E3fLFMosdbyr9fRiqRbk8AxznzEOt1EatA==
X-Gm-Gg: ASbGncv+022cplY5KDQPUfwschN1IZtg1WQXlrO3KpYjHLEaO49S55uWXDsXxtK1UBc
 A8C1dqODDBGXhLkcX4UwNq/yWptOWsH+FDK/em8ZyoGZ+UCmuE2HGqJDao4PLN9osHudtf9dCHg
 8j/db59d4X9NOATFNrRX3pQMDMQKlFsgQi4tyinVuazu1EO5unGWMhbB+rjvT6a2QuGOi4WuByA
 oGUt/+A+UkXhf7jB/MKihscETHKuhsvswgfvVr5whtoE5xTlS+VWjHCzEQAlh7DQ9fgAU/JUbuy
 yORYq9ueb+irmgoOEJmSF4dTnLcqAF393fSm+J2lXt5L8Y7GPFVcV0Jm30Vhm28deRH+G6hzIPo
 eIeOjTCwEy2XclCEqJ1mhG0cstuQw6Pp9LeeryWLwVNbgmq6of8td
X-Received: by 2002:a05:6214:2622:b0:704:7c55:4ff3 with SMTP id
 6a1803df08f44-7072049f1admr69563856d6.4.1753533236059; 
 Sat, 26 Jul 2025 05:33:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYL+i20wvik2k8ybZcLSjUO54dD2ixoLhw+HaO6iD4q20/2WO93wX4OnjSp+gZ9Ik7pPwU+w==
X-Received: by 2002:a05:6214:2622:b0:704:7c55:4ff3 with SMTP id
 6a1803df08f44-7072049f1admr69563546d6.4.1753533235548; 
 Sat, 26 Jul 2025 05:33:55 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b6316d6cbsm427270e87.29.2025.07.26.05.33.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Jul 2025 05:33:53 -0700 (PDT)
Date: Sat, 26 Jul 2025 15:33:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, ankit.k.nautiyal@intel.com,
 arun.r.murthy@intel.com, uma.shankar@intel.com
Subject: Re: [PATCH 03/28] drm/writeback: Define function to get
 drm_connector from writeback
Message-ID: <ng2ps7k5h74w6zo62oqazzetunjc2psooobmh3zcrrmxesi2ua@va6z7eqjst2u>
References: <20250725050409.2687242-1-suraj.kandpal@intel.com>
 <20250725050409.2687242-4-suraj.kandpal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250725050409.2687242-4-suraj.kandpal@intel.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI2MDEwMiBTYWx0ZWRfXweFrUa4fe7LK
 raOBq0Z5UOicSAukn67AzwCRKeSee3tRHGHJaTRn0qYNxIagpCbACPumygjz35JfnNV6moQfq1f
 1GVvVIW60tzXhcDdU4jNA5wX9c5jlCKfrrtK+ej3jJJp0XVYJHHPPKFrvc+uEvFqw0cU01rQgVq
 nGJgjSBwfl3IN6qrq8t3nLlbA0wMYiJSknXwHqjZZSv1sxUqkx9UQwelZmsu2BCIfy5BeCgaMWG
 /0FuqHWfI59d6j2MCrTpkrWrdgokrNg2/7d8lTfugoj75PiIc52tJx6AIpc5nZcdovCHknTmgGg
 WH4xFKLXQsaBjRTvd2SjPefF66bm0Ix+8EsaPJnjDOO1ViV7d6XADF8I/Po5dROOX37lXA05PuB
 B+HC2M4U3mtweS8M5IE18pZG/zXVS7zetkuVAmcrVYycfn9Xw6uZtHA1Xp6cFufOWYhwmtOe
X-Authority-Analysis: v=2.4 cv=Hth2G1TS c=1 sm=1 tr=0 ts=6884cb35 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=QyXUC8HyAAAA:8 a=ueQVv7-7oDeDgNA6tiQA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: PWflUldEuhF19iVc7Wnk8L4vTQ0js4yG
X-Proofpoint-ORIG-GUID: PWflUldEuhF19iVc7Wnk8L4vTQ0js4yG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-26_03,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 mlxlogscore=999 clxscore=1015
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507260102
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

On Fri, Jul 25, 2025 at 10:33:44AM +0530, Suraj Kandpal wrote:
> Now that drm_connector may not always be embedded within
> drm_writeback_connector, let's define a function which either uses
> the writeback helper hook that returns the drm_connector associated
> with the drm_writeback_connector or just return the drm_connector
> embedded inside drm_writeback_connector if the helper hook is not
> present. Lets use this function and call it whenever
> drm_connector is required mostly when connector helper private funcs
> need to be fetched.
> 
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  drivers/gpu/drm/drm_writeback.c | 33 ++++++++++++++++++++++++++-------
>  1 file changed, 26 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
> index e9f7123270d6..d610cb827975 100644
> --- a/drivers/gpu/drm/drm_writeback.c
> +++ b/drivers/gpu/drm/drm_writeback.c
> @@ -120,6 +120,18 @@ drm_connector_to_writeback(struct drm_connector *connector)
>  }
>  EXPORT_SYMBOL(drm_connector_to_writeback);
>  
> +static struct drm_connector *
> +drm_connector_from_writeback(struct drm_writeback_connector *wb_connector)
> +{
> +	const struct drm_writeback_connector_helper_funcs *funcs =
> +		wb_connector->helper_private;
> +
> +	if (funcs && funcs->get_connector_from_writeback)
> +		return funcs->get_connector_from_writeback(wb_connector);

The get_connector_from_writeback() and
drm_writeback_connector_helper_funcs should be moved to this patch.

However it feels really awkward to make drm_writeback_connector, which
is a wrapper around the drm_connector, to use some external DRM
connector. A quick grepping reveals API (which you missed) that expects
drm_writeback_connector.base to be a valid connector. And it would be
very hard to catch sunch an API later on.

If you want to use DRM framwework, while retaining
intel_connector for writeback connectors, I'd suggest following slightly
different path: extract common parts of drm_writeback_connector into a
common structure, and use it within the DRM core. Then provide functions
to fetch drm_connector from that struct or fetch it from drm_connector.


> +
> +	return &wb_connector->base;
> +}
> +
>  static int create_writeback_properties(struct drm_device *dev)
>  {
>  	struct drm_property *prop;
> @@ -478,6 +490,7 @@ drm_writeback_connector_init_with_conn(struct drm_device *dev, struct drm_connec
>  	if (ret)
>  		goto connector_fail;
>  
> +	drm_writeback_connector_helper_add(wb_connector, wb_funcs);
>  	INIT_LIST_HEAD(&wb_connector->job_queue);
>  	spin_lock_init(&wb_connector->job_lock);
>  
> @@ -527,13 +540,15 @@ int drm_writeback_set_fb(struct drm_connector_state *conn_state,
>  
>  int drm_writeback_prepare_job(struct drm_writeback_job *job)
>  {
> -	struct drm_writeback_connector *connector = job->connector;
> +	struct drm_writeback_connector *wb_connector = job->connector;
> +	struct drm_connector *connector =
> +		drm_connector_from_writeback(wb_connector);
>  	const struct drm_connector_helper_funcs *funcs =
> -		connector->base.helper_private;
> +		connector->helper_private;
>  	int ret;
>  
>  	if (funcs->prepare_writeback_job) {
> -		ret = funcs->prepare_writeback_job(connector, job);
> +		ret = funcs->prepare_writeback_job(wb_connector, job);
>  		if (ret < 0)
>  			return ret;
>  	}
> @@ -579,12 +594,14 @@ EXPORT_SYMBOL(drm_writeback_queue_job);
>  
>  void drm_writeback_cleanup_job(struct drm_writeback_job *job)
>  {
> -	struct drm_writeback_connector *connector = job->connector;
> +	struct drm_writeback_connector *wb_connector = job->connector;
> +	struct drm_connector *connector =
> +		drm_connector_from_writeback(wb_connector);
>  	const struct drm_connector_helper_funcs *funcs =
> -		connector->base.helper_private;
> +		connector->helper_private;
>  
>  	if (job->prepared && funcs->cleanup_writeback_job)
> -		funcs->cleanup_writeback_job(connector, job);
> +		funcs->cleanup_writeback_job(wb_connector, job);
>  
>  	if (job->fb)
>  		drm_framebuffer_put(job->fb);
> @@ -665,9 +682,11 @@ EXPORT_SYMBOL(drm_writeback_signal_completion);
>  struct dma_fence *
>  drm_writeback_get_out_fence(struct drm_writeback_connector *wb_connector)
>  {
> +	struct drm_connector *connector =
> +		drm_connector_from_writeback(wb_connector);
>  	struct dma_fence *fence;
>  
> -	if (WARN_ON(wb_connector->base.connector_type !=
> +	if (WARN_ON(connector->connector_type !=
>  		    DRM_MODE_CONNECTOR_WRITEBACK))
>  		return NULL;
>  
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
