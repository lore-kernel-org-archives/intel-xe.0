Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 154BBD6A221
	for <intel-xe@archiver.kernel.org>; Thu, 14 Nov 2024 17:47:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D866910E0B1;
	Thu, 14 Nov 2024 17:47:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WMRDKpDA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE9A710E367
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Nov 2024 17:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731606449; x=1763142449;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3PSbWjLfDakvyTYWrHT8B1f+SQx4ZWHhgpQDSvQU9bU=;
 b=WMRDKpDAUG/2k6JehV2B6kXR469NP7mdpuhVffOEynprcpuYKSOpw5S/
 TbcusbooD1z7P1ZA+LUkCEDtHQNVHsqjyNhFlFwBjkU3lZQxTpv67xOVH
 oG3lp/idHAbv+ItdNLoZ6hyCfJJPNkLmGrUTVHFJiePK55MUoqpohGHc2
 hig13XVdR4ImfSCDrUqCIWkdhSLH0PL49OWLtY0sasopXJ8sKXE7Vq3W0
 CXu2NAZs9BysnNJPTq/vI6trP3kQpEfyiWVSEc6yakyu9D6Yfy4DGoNAR
 7w8I9iJqGwAtYRiRFm8ZSlWoArzydlCia4O9e3AnAqVvAiN3bag2uiCvI Q==;
X-CSE-ConnectionGUID: robLAyOvTKaRzqPqCQOlHQ==
X-CSE-MsgGUID: woREXum2SwKxVlPiVTmbPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31549359"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="31549359"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 09:47:27 -0800
X-CSE-ConnectionGUID: Gr0ApaxORpWv6kibiT3W+A==
X-CSE-MsgGUID: jrXf8jZRQl+loct8p26aHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="93237188"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2024 09:47:27 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 14 Nov 2024 09:47:26 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 14 Nov 2024 09:47:26 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 14 Nov 2024 09:47:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NWL2OVunu9dS/pImoyhY9YGgYKXinEU+iUnjy73ugRYjqoWUZ5bG8gOrgCwFGGkcpgKuppn+sPGOvKpUE9r+Rz1rlMDWDuuGn1PyHqdqq9y6XnGsCi0mAmpoGX6tfHaMJcikNawAZqdDqE+9EHxRRcfIMfVpFUjmNpLu7MK0dBJ4ZIe6bCA2Rh57j5PFCbzvAaPtBBkoInGdDp7Vfbjj5tvUfx1dFM+JjklrphAPzb3FMkhcLsEkAOn0hm/MZR4BDO4UatI3o5oyabJlPsrSWPXhfB87NzgSvIpA0nKz9z3naHs3d9DJp1+D5jMVbTOL8I1ZYLfnmZKDrRWuhwyFIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gn/OE8tM3ZGWZTptZIAnSUqCafS8SsLQW2OxGfIGNBM=;
 b=XPnJsRjpYHtbBaf51OsJkPccvbAxZbEoyfaqC2tX82rswrodZXSs2ulAjkDUbg17vSaQF4GwSqUTj7kDa3GsFyZfVdxJDzMtfJtrfxQciYw/SeBgpa4mICA+FedcwMdUV56dRd63jRuoz6J3s5jyPhqS/aZgBe7bPK1CZQdbSrgAfs3IZMOal8rkwPETMig0Yyv9I3vDv8DyGaLFQK/GsLaHKI/2wGVMQNVVBH7a8cI3TTDKzKYdO5yOdgLqRQGM7cNN84/vdaK2Sx3OEDm2GIkzLJcYG3ZTkvyxLglBsSjQ4BApSvJJKMs/uODrNL0u/P2WnrTn6Rx+d6pXnBfo/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by DS0PR11MB7802.namprd11.prod.outlook.com (2603:10b6:8:de::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Thu, 14 Nov
 2024 17:46:36 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%7]) with mapi id 15.20.8114.020; Thu, 14 Nov 2024
 17:46:35 +0000
Date: Thu, 14 Nov 2024 12:46:31 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <umesh.nerlige.ramappa@intel.com>, <vinay.belgaumkar@intel.com>,
 <aravind.iddamsetty@intel.com>, <john.c.harrison@intel.com>,
 <ashutosh.dixit@intel.com>, <soham.purkait@intel.com>
Subject: Re: [PATCH 4/7] drm/xe: add function to convert xe hw engine class
 to user class
Message-ID: <ZzY3d-NLOzlOsS5E@intel.com>
References: <20241113045549.2390980-1-riana.tauro@intel.com>
 <20241113045549.2390980-5-riana.tauro@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241113045549.2390980-5-riana.tauro@intel.com>
X-ClientProxiedBy: MW4PR03CA0343.namprd03.prod.outlook.com
 (2603:10b6:303:dc::18) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|DS0PR11MB7802:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b01b14e-9a49-48e3-2b02-08dd04d4487d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Mv9YVVqTr2jBXjDlsxjikUdRcR8E4Nyr7DAx4wiQKLIAgSqOeSv25qAaz42Y?=
 =?us-ascii?Q?zzEYthcWGPaEw2/i1vKUwCd+C5uJlV5O2DwSm83CyNKFHZkNA6iqX/25Qn2b?=
 =?us-ascii?Q?nC65lPSi7kYeF4ON5tfeTWH9bLzkYahn/x4zdOrNzbexX5ImeXafDvDA2gdl?=
 =?us-ascii?Q?e3jz2CC+RnT+PPhmpR74KTHCVDg7rOpT2jAYY3VYJmWw2osFC50Pw4HdqgK9?=
 =?us-ascii?Q?B9flyerXbDFVtWWAOwZ0RprPdx/Mg4mzgzrFvP154RWFml7dz8OHUJSfv5fB?=
 =?us-ascii?Q?y3bXnkH8KNCVztc8tjAOeE7U0FmZyMYEaw/HVE3/U5Au/pMryOOhVBDo2iY1?=
 =?us-ascii?Q?eHvguNStJjbhe4m6ABfkapeY4BFGnGJX5KTaJeFnOXd24GHzB5+hwSwaJQWM?=
 =?us-ascii?Q?cWYemW2l0NarbXqpKd7G1p4hW/DoDZ8DUw4d61JnPypS3c2Ep7sFDtvGgpLM?=
 =?us-ascii?Q?aIY8zFyXeY5EHBTAZhyRp1p/yGkTKB3gokGT2Au81rs0bZembBwAdhQRGjeq?=
 =?us-ascii?Q?pm/QVvLy2V4v8s5BS4Ey+fv1WL3i9vhNe4Q6Y7XvF10M1Ld+8dfKWJoERefi?=
 =?us-ascii?Q?vXJmiNHXwZEXnVnWpvXmSFjoc0GyNF05mCNKRg6/dzy21ruxugEDT8MlgQkc?=
 =?us-ascii?Q?VA3mo7AHPk3hrjKM9mswMsxOUz4AgRa1PxANObJQN0ijs7hBN0ZLghyaX7oL?=
 =?us-ascii?Q?hgMRhuLmOT9LAc7xuhwfyUr4XSMwp6j8NRE0qZGvguKeyWaeBFcb7CYgBYy4?=
 =?us-ascii?Q?fUug3Jb3kgHicFOY+iwDUirBhX5cmw1k7H7sW8qRS3J5n241jX88wy6tRrpG?=
 =?us-ascii?Q?lNLMVV0Nwu6oKdZdVjpWQVWIfwW60SZMSIBAi/OVpKl7HoUyEe8/OvLub/gd?=
 =?us-ascii?Q?fQMETAG3hsxwI835d7hW9cTa6YSf6YVLVwLOqaU3AQU5DNiZ0qmcP0SThFF9?=
 =?us-ascii?Q?5bItuRr/Aou+buNZQ9Zg6Osg2F2gFkhZsXb00a8yE37HLX+6+dLMWHOKTARE?=
 =?us-ascii?Q?iu9V1dU3a3zJB3d+tbx1S03U1DPKcELtvgEhyXjTn5xQqPSzqlzQiWl4OQGF?=
 =?us-ascii?Q?C74etOWxOT0/zWoWANItzDBhD7LpJk6DFE6p4hs+7yWcyLEwSy+a/GMuzPdt?=
 =?us-ascii?Q?gL52Xrq3bZM+PIDwjidff9gB637iiZ+FQ3r6Iwu2tueRIsXUhcsvvAu9MUGg?=
 =?us-ascii?Q?RS+psCo5FgMpcQNK6yvtbgEK99/+EXPcuqZXoBmshpFsUdaSuOO1Da2/El6m?=
 =?us-ascii?Q?LU4NX5qkUcriX7NkDU18BXfiAAV7guWYYKZdVYL8OJTGtua4GqMYAVEK7nk2?=
 =?us-ascii?Q?h03TZVyRxjdnRSKGkZKiDaj+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XvT+5nf85gPXfJpUD0tsblTHujEeMphn5xzO+dVpppSzwD4+gNiutMGnzxwF?=
 =?us-ascii?Q?3L2yLRVxE4TYV6cHmpJl7270GfgONkxY7oNk9PaytO/CdMyY4lLJmV8bkcMn?=
 =?us-ascii?Q?aA751SXmG6TgyvTgVfP+mIEvLYUwesi74kzwHcUvdmavygYsDb0VorVGjGqH?=
 =?us-ascii?Q?uRqqEFykzj4gydcx6Vi/pCaXjK/RzJ9ZMlhUqVA4gDiYOIqL73IWQCxiPtZ6?=
 =?us-ascii?Q?546tgtUl1fk0FWvCuxONPtf82yGprqS0shwCrBaoI4RcbzfKFKYVnFr7d3GW?=
 =?us-ascii?Q?TbNbfXuhJEpKb3DEO+s4iW5xWdl8FVCRp3uOW2xyGs+eJk+Pppn1S4jWwktI?=
 =?us-ascii?Q?5tSJ+MHvocO+wN3nshbIjNrvJJy0WiTRa7UMoA4oatE9/vwffHl2e+Hq0pxx?=
 =?us-ascii?Q?0K0FMvteebahLw7rLKv+oZdPzQgbTGYBtag5LZBtMJTzEBBjMckjl8C7oE4P?=
 =?us-ascii?Q?I1SCUy5Yzpw+FlsZUAODwrdBSBSA3mxypM7p+rKXDSU5k9kzSMbk/OVdwT7g?=
 =?us-ascii?Q?WAPMUdWtubuvWqtQYa6VBBugnZ7RLgOPtRrbSAuDCKr09MSMTrkdj4JS3nbh?=
 =?us-ascii?Q?qIhx0RhTYN+ycVYsI1mkAE7y9BeoLdlybg1+7Sa+lAC9FedjXCcnq5wGuBdM?=
 =?us-ascii?Q?2D2qFicTZI7St1YdOaCeLzA3QL0E+sbCz5pZ74FdpOwsamUYHvpTQno6g6uh?=
 =?us-ascii?Q?ZRhI8u27CxrwoL1UIls+thvMQyK7JjmUKFdF9UgHVYfC7kfIS5WZZAS3/vU/?=
 =?us-ascii?Q?6Y4HcxeMe/po6U36cF3nhiFleYUeCoyYuoLokVnsYMrR9eL8LhA2Zy3UyjJP?=
 =?us-ascii?Q?mAqNUM4jrsMrV6B8Z2lGNGhrEGmp3NzISfpU0vrNMETuUilqc/n4WhaUTOBh?=
 =?us-ascii?Q?n2AYK30YUnJy2WFh4PPMmT59M/wGlNnLN8P7F5kkawT1jY9+6xuHLBs4xuTT?=
 =?us-ascii?Q?3jTHjOosfmjGNowRRP6mGnVcrvox1gqRR8ScBw3+TIS7eyg2hLI1otwEivrw?=
 =?us-ascii?Q?DVZeihn7ssN8VQWVfCIYRmfZmQYI8yBpRDAI5FdlQpgZeWchLGPCjD93cxqO?=
 =?us-ascii?Q?eIa7ezDtd7TWrD2Es3PVSWgU97Q49wnj90p45eF7Tn1tcQi5xqfXfJdGVVac?=
 =?us-ascii?Q?1iBx0ObE3Q01nN5lDcgLV4HQoJ1OflrAkA/I62ilawpT8yt5l2c70/y1Sn84?=
 =?us-ascii?Q?GNypQwdn1vURUtJb+mWMdreU8yp9l8tzfsQKgxHJ7ICNDyyte9DqkNF7T4dq?=
 =?us-ascii?Q?SGKdQkTYcOhDa5U8VzRJ6VM4qy4GhDwWklEeF5RqW+b0Nef+kxQyK5xwOM/r?=
 =?us-ascii?Q?izNIOb0LpZjWeENIRTEtzBAX7Dt1/LrHTmTf8hBV8wO9npMvt2ce+bnnb3ij?=
 =?us-ascii?Q?IFiY/eI7Ffb1eTmVZkUyRzF+v2fkp57r4LZg1swhS592Ko7Xi9QXL2INRNtp?=
 =?us-ascii?Q?Jp6l1eC1x8YtO6Zi2JE30etsoL6mOwmMvslhksQ03JivaCwnUeM5JvLVoEQa?=
 =?us-ascii?Q?8XymVbLFHLZVqlqftEMcxpcxfvsgI7i6phc4wxkqPVd2oC4MMzZXC861+/HA?=
 =?us-ascii?Q?u0O2VJQVwNQ1+khjPHjvoeXve4tLvoDiVwCPupFMcx+5Gcn0GZqZGo90O1ex?=
 =?us-ascii?Q?mA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b01b14e-9a49-48e3-2b02-08dd04d4487d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 17:46:35.9065 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TyGqqE2c/F6zCQfx5xtkh3+JQRnkxAYsSkOcSvcj0Z+fSyUVH04v3+4m99ABRYM6I2A3qrSamJJkDWe4JsdNnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7802
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

On Wed, Nov 13, 2024 at 10:25:46AM +0530, Riana Tauro wrote:
> add a function to convert xe hw engine class to
> user engine class

a bit of why would be desired here.

I noticed that it is now used by patch 7 on PMU, but some words
here would be better.

> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_hw_engine.c | 25 +++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_hw_engine.h |  1 +
>  drivers/gpu/drm/xe/xe_query.c     | 12 ++----------
>  3 files changed, 28 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 1557acee3523..ba40f2692f34 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -981,6 +981,31 @@ const char *xe_hw_engine_class_to_str(enum xe_engine_class class)
>  	return NULL;
>  }
>  
> +/**
> + * xe_hw_engine_to_user_class - converts xe hw engine to user engine class
> + * @engine_class: hw engine class
> + *
> + * Returns: user engine class on success, -1 on error
> + */
> +u16 xe_hw_engine_to_user_class(enum xe_engine_class engine_class)
> +{
> +	switch (engine_class) {
> +	case XE_ENGINE_CLASS_RENDER:
> +		return DRM_XE_ENGINE_CLASS_RENDER;
> +	case XE_ENGINE_CLASS_COPY:
> +		return DRM_XE_ENGINE_CLASS_COPY;
> +	case XE_ENGINE_CLASS_VIDEO_DECODE:
> +		return DRM_XE_ENGINE_CLASS_VIDEO_DECODE;
> +	case XE_ENGINE_CLASS_VIDEO_ENHANCE:
> +		return DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE;
> +	case XE_ENGINE_CLASS_COMPUTE:
> +		return DRM_XE_ENGINE_CLASS_COMPUTE;
> +	default:
> +		XE_WARN_ON(engine_class);
> +		return -1;
> +	}
> +}
> +
>  u64 xe_hw_engine_read_timestamp(struct xe_hw_engine *hwe)
>  {
>  	return xe_mmio_read64_2x32(&hwe->gt->mmio, RING_TIMESTAMP(hwe->mmio_base));
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
> index da0a6922a26f..3aca7751a482 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.h
> @@ -74,6 +74,7 @@ static inline bool xe_hw_engine_is_valid(struct xe_hw_engine *hwe)
>  
>  const char *xe_hw_engine_class_to_str(enum xe_engine_class class);
>  u64 xe_hw_engine_read_timestamp(struct xe_hw_engine *hwe);
> +u16 xe_hw_engine_to_user_class(enum xe_engine_class engine_class);
>  enum xe_force_wake_domains xe_hw_engine_to_fw_domain(struct xe_hw_engine *hwe);
>  
>  void xe_hw_engine_mmio_write32(struct xe_hw_engine *hwe, struct xe_reg reg, u32 val);
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index 170ae72d1a7b..98b036678eee 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -26,14 +26,6 @@
>  #include "xe_ttm_vram_mgr.h"
>  #include "xe_wa.h"
>  
> -static const u16 xe_to_user_engine_class[] = {
> -	[XE_ENGINE_CLASS_RENDER] = DRM_XE_ENGINE_CLASS_RENDER,
> -	[XE_ENGINE_CLASS_COPY] = DRM_XE_ENGINE_CLASS_COPY,
> -	[XE_ENGINE_CLASS_VIDEO_DECODE] = DRM_XE_ENGINE_CLASS_VIDEO_DECODE,
> -	[XE_ENGINE_CLASS_VIDEO_ENHANCE] = DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE,
> -	[XE_ENGINE_CLASS_COMPUTE] = DRM_XE_ENGINE_CLASS_COMPUTE,
> -};
> -
>  static const enum xe_engine_class user_to_xe_engine_class[] = {
>  	[DRM_XE_ENGINE_CLASS_RENDER] = XE_ENGINE_CLASS_RENDER,
>  	[DRM_XE_ENGINE_CLASS_COPY] = XE_ENGINE_CLASS_COPY,
> @@ -206,7 +198,7 @@ static int query_engines(struct xe_device *xe,
>  				continue;
>  
>  			engines->engines[i].instance.engine_class =
> -				xe_to_user_engine_class[hwe->class];
> +				xe_hw_engine_to_user_class(hwe->class);
>  			engines->engines[i].instance.engine_instance =
>  				hwe->logical_instance;
>  			engines->engines[i].instance.gt_id = gt->info.id;
> @@ -677,7 +669,7 @@ static int query_oa_units(struct xe_device *xe,
>  				if (!xe_hw_engine_is_reserved(hwe) &&
>  				    xe_oa_unit_id(hwe) == u->oa_unit_id) {
>  					du->eci[j].engine_class =
> -						xe_to_user_engine_class[hwe->class];
> +						xe_hw_engine_to_user_class(hwe->class);
>  					du->eci[j].engine_instance = hwe->logical_instance;
>  					du->eci[j].gt_id = gt->info.id;
>  					j++;
> -- 
> 2.40.0
> 
