Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD31EC021B1
	for <intel-xe@archiver.kernel.org>; Thu, 20 Feb 2025 20:40:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72DE310E9E2;
	Thu, 20 Feb 2025 20:40:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ec73nFL8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A1FE10E9DE
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Feb 2025 20:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740084058; x=1771620058;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=N4sw4af6QaBXQX1eM4RzpNFRNle1iv39DVHnPI8H+YI=;
 b=Ec73nFL8m75g3xjt2ZvVl272JdmLMGPDzhBmRGJxI1qxOtf2yJsK/EYA
 Hjh1dz/Rdbe0KG6Q6EJITDujrishD1Q2l9OFABju1jkPOV7KVSrMq0vNS
 P8EYw1xUT+CXot9mEIY4585hIOz5K9maYDIuNtGCHDwVcI03HFNFY6PTK
 9Z7ZbTbxPBJiiDQsK2M7wvTap7IiCJ9ebACeE3zx+Ya7HBbD0n8e2g1HO
 Wa5rXuNcBZ64RyBbvJJkZFMZyG6nVlEPNlx4oRHk6GrUyI7OzhE39aPzO
 fG2VhA2v7uiD8c7PZzQltSAeeM6Wr0VBugLDDiZg4m8mI+sUFnwXKsCz8 w==;
X-CSE-ConnectionGUID: bu9xiKn6RGyKL7g55qfAbg==
X-CSE-MsgGUID: a6oETVyET0q83meqE/+pZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="40744599"
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; d="scan'208";a="40744599"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 12:40:58 -0800
X-CSE-ConnectionGUID: iGC4wcd+S7amALlIcWmxbg==
X-CSE-MsgGUID: q2WvJTKQRqWj/T0eXwcBeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; d="scan'208";a="114881099"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 12:40:58 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 20 Feb 2025 12:40:57 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 20 Feb 2025 12:40:57 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 20 Feb 2025 12:40:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=njC38Iatdk2EdxrDUfp1Q4VdWkQrNsX2V7ycKEESz2yHb48wQaKK9Wr3903JdxeJHFfrn6vLjx861K1uFhtPutlD6I4IEJvKarXnpdu8lU0I5QVLO5FT/v3q05T5ICisWLphqaHiCQDHHkwBeTeGLPDeiSX4Ns7xwL1tISEjtIAqOjP+cirA2TD/VLOda8oGaExxZ+WrKH9AscC/fdmPef4OBNh5VKHHnWtfw/HuQKfHtfssNR3yzMdo13ZDYsj30bbLhNODNQ9ibSREKg5VvRfI+giy+B1kvOny+6SXHGoVCx8ceNua7nvZnXT/yjfVcpYPkmxInHLbcoFsDTNmkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K97FFIU+rTlAgONPMiyvvVC/xIWJRJKH3w2yvgi9xp4=;
 b=p8WstFR9FZyEELOcTuAbM0sGXlQjN+ivJSNfNY+ivszT0ftn3wjamt0z3fBNQdhoaV4AlWhwOlo2yK3ZyKiIbKZEqqdk0kC0fHCkHkzwziw/+0/3ZKoSxzkfIlbnn1KSk0MXfuVgHuyK1UhOUdddz+fBwu5BVkHeNYSpHPANAT4w1tst21d0S3jzwuETFcl9i9w62+QzWeyqhkecM6VMpS/gcfyGF6wLEvu+FcqHw9Pdt7lFITF6klHEAEW0BM4Ez1P5Lkdan4fhRoejXPHZsPKp8GquhBEpBCRiqjD0I6IUzW4rwHIdBn+gKBIt1FPStqxVMPt40t0MBX6XBd9wQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DS7PR11MB7833.namprd11.prod.outlook.com (2603:10b6:8:ea::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.14; Thu, 20 Feb
 2025 20:40:49 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8466.013; Thu, 20 Feb 2025
 20:40:49 +0000
Date: Thu, 20 Feb 2025 12:40:47 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/4] drm/xe: Set IP names in functions handling IP version
Message-ID: <20250220204047.GU4460@mdroper-desk1.amr.corp.intel.com>
References: <20250220172532.66613-1-gustavo.sousa@intel.com>
 <20250220172532.66613-2-gustavo.sousa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250220172532.66613-2-gustavo.sousa@intel.com>
X-ClientProxiedBy: SJ0PR05CA0091.namprd05.prod.outlook.com
 (2603:10b6:a03:334::6) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DS7PR11MB7833:EE_
X-MS-Office365-Filtering-Correlation-Id: a4bff4dd-00b1-4d27-5fff-08dd51eedc3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gBMlXJQdeihy8oJ1JKGKFLeMMnVmsFOuMog8a5jbbOkoSiIA1Z83/fH3rh7L?=
 =?us-ascii?Q?ZxAjefCBhf8BXBDiKaqnfnqP31jyPwwDeYipLVnvFbmtjC1dalWPwxMZ/xli?=
 =?us-ascii?Q?gsm2PT6GMBQLumTeh11NZkuZj6MXPCF6hsKtiDLy2x/u8VxuKgfKskoQpjuS?=
 =?us-ascii?Q?vxkAuIe6uI54fzn4RWEgHcPyPtt21EB0/CNRBQ8m7rV1QNQAHYfyxCUqxNbA?=
 =?us-ascii?Q?9RwGUQINsOXz1NGHjAOLPTOk84XgS0HUM73T+tCDfvMw2m4w+995KdEIHitX?=
 =?us-ascii?Q?bpRzhFKI3m8ua/1x05HGlXtzFaCwfe/RXqtLhhR+cmBhHWMcc5VoQqYEYRPg?=
 =?us-ascii?Q?bUNVP+VXrlKm6D0WbaI+lIjb24+igd9wHM55TJH61yzkhPy2Qetg8xFAJdW7?=
 =?us-ascii?Q?D8GhRi8oGzuPUmfGvCDcTJPvCE4XtwJGX9dzTxk2heuxMeHzHbWAOV8ScbWU?=
 =?us-ascii?Q?ItDcEq7RcKrtluPDgV403jGOUMAx9MRHzK5er0KtNAACzmJEqvykcektvGxs?=
 =?us-ascii?Q?nE3IEs/bsieCB2po969UorRWFyJzizb+85CFmh+XEmT38wt3Srp8N2ogmHjq?=
 =?us-ascii?Q?zmyqEjAZsIOwClxLS/SYzhB13GgB4gy5zdMYRYLq26w5W3gg9m/AQjM/7qFo?=
 =?us-ascii?Q?uZyA1riFibQpCJJ4hnCSHxj4RDzDdI/lGikHoRYFpoH1f00SO4nqWSj9OWv5?=
 =?us-ascii?Q?S/LlwBl59ls6NSdEJDqTjBm/BwAvmk+5FW32ZOCKYtMmwnvh+IjXklEkqmOi?=
 =?us-ascii?Q?A62AwUBg1jXhI5xal6d6c9gSrixRd/M3lVf1UgYiK9yKLNKzs8tNLZrcjifl?=
 =?us-ascii?Q?8AtRHQ2INXWmF2/C5gn+cqesqGcwvNy7BrkPFoyVNh42BmecjO5I8iz6rK62?=
 =?us-ascii?Q?IrKGzg48jG8lwRshHirB27ipexTkcKPLpKbGpn1omNdkQlL1AhebRfEWgoQO?=
 =?us-ascii?Q?vB/HBPB/g2C2IjYmRo0MF7iA7dZdkgxix1Xa9QwCnWSWZ0VqPhs7Jjz3krJF?=
 =?us-ascii?Q?s4bsqQKZ6EVzaI3h59YrifG6OyZDo2iWmaRAxOKBTJHWB83geak+Gcdvh6ph?=
 =?us-ascii?Q?A9+PbQWUvEdZ46hnL2iOihFNeF1yPDdJkZEOgjfJtiVgNVTZ4c1loztEMJFh?=
 =?us-ascii?Q?06SN4KmeZMBnb83jijhu9qaDfpnHzjCj9p8enGRiUnylMN/X6YEr6oFtaIPs?=
 =?us-ascii?Q?3FH8eOV1A/7PABmycM0kguJkNNpVZOBxHUUOHc5mp4AcAfqSdBcXXtuShBfq?=
 =?us-ascii?Q?ivOjseFR3crWX5dXt5JXWlhWexzidJDBcxoijqTRrGj/nH0aKPqOJDA7jX0R?=
 =?us-ascii?Q?CQhwvf7SqVeMRyHWSzXBZk/+IYxRDdiSybEBOeN5yxKcD2aeH1pvkJIlifUp?=
 =?us-ascii?Q?Iewijy69VhrLLz4w2StwbBjgcNAt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rH7rysWzYMuuSPK9yJBL1E2RnSWkZ3qALXO5ag+Sg/A5yRJTH2CxXUQXgBNe?=
 =?us-ascii?Q?elwASWfBn7JAO7u5LGTuPPM3LRwp5TP8TJMNrJVr/GCIlw23QlHfR2yOPxP7?=
 =?us-ascii?Q?GEjNDIpn/PKNnsHYY4I8HoAdFvTIrRFTRiE9EQ5OBYoeSz2+ZhVBYS/toPyT?=
 =?us-ascii?Q?04UzOSbOTFVGbJk9idRJYTHwkYchHbyf6VN2Os8efp3RPwEGVLwb3lcDuIhE?=
 =?us-ascii?Q?krBm2+uU4PxevCCuGdCN8nZYuBO1L0gimcMR5jqfgdpwYGy8u+memo7XcH8d?=
 =?us-ascii?Q?ZUhObdDAp/tpO5z5H4AeM9NJPvg0RHFA6dMneQyKi3paS/DYPLAjMW4KZCU+?=
 =?us-ascii?Q?5yKxAZr4Qn2PAeQoMLBQNet1t2EO8boq3vF6GX0qrIoH1bIuh3kwmI/1oEhb?=
 =?us-ascii?Q?F+SfF8CcHr1QdBixSf/G1PAYjov0Z3d2RhvKGKxjUIIS/Rq/sgCH+nt16AZZ?=
 =?us-ascii?Q?2Qf7sLH6ND+jW41dW8e2SXI2Xbeye4M45XX6hwKGbTELovJj31z8PCqy2IKx?=
 =?us-ascii?Q?MPmd+F/iEa9htiAi6Ktn38Er4p++QnJGLhyTF1YQL0zWj7ohVtX1FRCP7r85?=
 =?us-ascii?Q?95d+wYMO/wnAHhgRxo5DRB19Ujhz5CiwUmfT1OnF3HN1HmGpg8e5SEL6ul6z?=
 =?us-ascii?Q?SnfsxoH7wYrih3oCuLnO4FPE9pKoeXIyxhvwIdlLylNZoIoXCiCdRcSEMZ7S?=
 =?us-ascii?Q?R7iLCdE/XV5Ul2Egw5xA1ef2X7ZkgEiFFmK0UIYIdf5CNToB5xih/mVDgQ1L?=
 =?us-ascii?Q?mN/TFnEQGRMhrHbTc/a5/zJOAAapZOnHffsa2+klPgo3HF20TF7RwtY+x1tb?=
 =?us-ascii?Q?uA8i6QksNQ2SSX99SnABb9Uj5jL0pO4ZQ0ipw1VKpzEXbokI+7WjQHEf2Jke?=
 =?us-ascii?Q?I1sTr+oowxcI6uJs6g8enK5L5mdG5KdVUZ+/hOhy/+oYOCnlAMbsC7yTpc7n?=
 =?us-ascii?Q?jFPUMu4P+IFxdZPUnnGXRrw85hd3RFYFufSWMezkdNE/Pm7o/o6vw+cJi7nU?=
 =?us-ascii?Q?U3hMftRY8Zl7A2HUb8PdQhx/cBkembatxvcOFZNy19EBfZv/Mo95FZLfAUDs?=
 =?us-ascii?Q?pCl71ixzy7iS6UGAYLmy2pX/fJQY9VOc571b/fUkIM0l1+F9VTOHur/0Ap0j?=
 =?us-ascii?Q?XWLs0LjFrxi1E9gF+OqeoAMyvIRI9xdLpO37eHy1KDeNqLp/2iis7qX0FyrV?=
 =?us-ascii?Q?WF4ugMqh8CXxtvtFv7ZfgGpiyvcTjiAnKq8QJUHeq/EHTsVL4ib53BrHbOcr?=
 =?us-ascii?Q?daWB/QhK93BCFGL39HTKL7wVdVcBa2ZdLW++SfHYJyTp75xpCM6Z6rIwMVbS?=
 =?us-ascii?Q?c77ljXPR/BnkMTTo5tvm+eOwngBkRsPro/gQqtv0sE0jC4Oi2jPLgo7oOGp7?=
 =?us-ascii?Q?cXFE4R+9/1agK8Z/aoHOtfa83uGBuQ51OuH1UL+Qb0gOqtJf/ODlvo4/I6kV?=
 =?us-ascii?Q?iturFb8j9T/WpXhLrV7eJ7kc1za1Y/RzgVvgSryDZvZ/jfm+XmUrTqbzhXsZ?=
 =?us-ascii?Q?XqLRxHhfEAuuPy7l2OKeCNqko2h3tBdaH0LWNxFP+sxCvg8wSkPenLLdVvIh?=
 =?us-ascii?Q?xJ7nvJAnAmPp+oYDYQuiVFEBMm+jSATKpOKAdUNkrSpi1fcCr5Xel3fTD0Fl?=
 =?us-ascii?Q?Fg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a4bff4dd-00b1-4d27-5fff-08dd51eedc3d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2025 20:40:49.7330 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vKLCzwXInndd4k+nRxJaWIUO8HWSet+IdcEcGvaQ33SlZ1eSIl3pchTJSE27WMN9gyJpGpSpDEj63HRqNeq4X4EcjBo/kK1ofYR9lkMiu8o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7833
X-OriginatorOrg: intel.com
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

On Thu, Feb 20, 2025 at 02:25:08PM -0300, Gustavo Sousa wrote:
> In an upcoming change, we will handle setting graphics_name and
> media_name differently for GMDID-based IPs. As such, let's make both
> handle_pre_gmdid() and handle_gmdid() functions responsible for
> initializing those fields. While now we have both doing essentially the
> same thing with respect to those fields, handle_pre_gmdid() will diverge
> soon.
> 
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_pci.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 70b697fde5b9..feea897f130d 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -564,9 +564,14 @@ static void handle_pre_gmdid(struct xe_device *xe,
>  			     const struct xe_media_desc *media)
>  {
>  	xe->info.graphics_verx100 = graphics->ver * 100 + graphics->rel;
> +	xe->info.graphics_name = graphics->name;
>  
> -	if (media)
> +	if (media) {
>  		xe->info.media_verx100 = media->ver * 100 + media->rel;
> +		xe->info.media_name = media->name;
> +	} else {
> +		xe->info.media_name = "none";
> +	}
>  
>  }
>  
> @@ -588,6 +593,7 @@ static void handle_gmdid(struct xe_device *xe,
>  		if (ver == graphics_ip_map[i].ver) {
>  			xe->info.graphics_verx100 = ver;
>  			*graphics = graphics_ip_map[i].ip;
> +			xe->info.graphics_name = (*graphics)->name;
>  
>  			break;
>  		}
> @@ -598,8 +604,9 @@ static void handle_gmdid(struct xe_device *xe,
>  			ver / 100, ver % 100);
>  	}
>  
> -	read_gmdid(xe, GMDID_MEDIA, &ver, media_revid);
> +	xe->info.media_name = "none";
>  
> +	read_gmdid(xe, GMDID_MEDIA, &ver, media_revid);
>  	/* Media may legitimately be fused off / not present */
>  	if (ver == 0)
>  		return;
> @@ -608,6 +615,7 @@ static void handle_gmdid(struct xe_device *xe,
>  		if (ver == media_ip_map[i].ver) {
>  			xe->info.media_verx100 = ver;
>  			*media = media_ip_map[i].ip;
> +			xe->info.media_name = (*media)->name;
>  
>  			break;
>  		}
> @@ -698,9 +706,6 @@ static int xe_info_init(struct xe_device *xe,
>  	if (!graphics_desc)
>  		return -ENODEV;
>  
> -	xe->info.graphics_name = graphics_desc->name;
> -	xe->info.media_name = media_desc ? media_desc->name : "none";
> -
>  	xe->info.vram_flags = graphics_desc->vram_flags;
>  	xe->info.va_bits = graphics_desc->va_bits;
>  	xe->info.vm_max_level = graphics_desc->vm_max_level;
> -- 
> 2.48.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
