Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A6A7CCD193
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 23:29:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CA9710E108;
	Wed, 15 Oct 2025 23:29:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KkXb+GLM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 898B710E108
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 23:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760570988; x=1792106988;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=I1Ms+FikWgoNHzIgVz6X+CCKDSPLTbI+UkAv2c9beGI=;
 b=KkXb+GLM0VMvtygxGt3eChqAxGRA+w/EKdSieFenqXc2kG1tS9UqjT3z
 gq0aEuTWOaeOW2z50L8CnorvnIffe7I3sbNIM1Qo2MjUGV5wRXEy8J5oR
 BkNL1UzrkpmSnSQ+FQNWOPQN2xX2XE5ieqOvaSv7edXwALts11FceWztV
 bYADTYeVOLjJBiN9NwwxKLyJD2ySRASCoJmLmzsNcZLQIbYgrgxnHlRnV
 BDxKSnmFe8jai8Nk44z5SnyyHyJsase/Rh+39R/Ns28DNtaRJzzidhG0K
 Q68VouXNxUtDyUKTxnsapqT4gB9M3tLNj8W1ILppLH0WeaZhau1CRuvRi Q==;
X-CSE-ConnectionGUID: caE4/ZfTQxuf81+Nl6KUxA==
X-CSE-MsgGUID: nxHEiS7mQWG+2wTM6D1k6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="80197781"
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="80197781"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 16:29:47 -0700
X-CSE-ConnectionGUID: L8RJ4v44SUqMevTUv546yA==
X-CSE-MsgGUID: +fbYnw0HRqGDqyOz6FOiMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="213254387"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 16:29:47 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 16:29:46 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 15 Oct 2025 16:29:46 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.26) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 16:29:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j2rxpFyGZM99SjyHSyjEIg+gBRPOtmnVA6mn/ghvXQT6nfE83Ky/DDDa9O32n/yLGCtXyizKU/d1M4D/z59rJEvhQb0rtw91vs2pQH90p48bMztsi8zE3E/sAq5rYyt3AAfHAOnJ2nbtI78cLILewehsREy3YXbH4LvZhbo+VTJCI81uqLYipqiPRVrP0WiE5AUIY50kEO2Qa5a9HGxrWLKTIWFE/TbHxEGITydNHd1KDDkZeYeUCZtR+4CRcMbQHfy6q+gdT9ULw0U89kqt0Fc2YWI/58ZoPMHF4tY8qIYRnjLwRhdvOWsXxtKdPJWJtm87xbWpemJwv4pQrcI47A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y6ypA69uBKW6J8TcAiwrRUH4m/mOLDzyat8ej/d9PNg=;
 b=mpMcUlk7bWzEKCQTAOxGb305+MHjEj3Dix40dIfyGmlw3ScJkJyw5zbAnn3LACvt/Hm3fMWtMogSj3tjtgw+kBhsxeiHhOWejXXQe2KZwWwoyNCu0WF80HGBoVH+bhdMDdNBMLF/VlYx7j+dIHtqoGKb3yfcIre5mBJs5ccBI7hcsh3ZejOtsWB4H5nALU3CO4qqO8Rav9xW0so7DA7On8y9CCWEttHcvkW6aTYVeXzDrDa2eAPpmIG/sfM+isNKp+gv09Bm5Cd6HABdp5pVhC7XvU+AQt/Btui3eqpb1tOXMZu+GsyfJxxbnJY6NGtYWtW5k5Q/AGhjySfoQTlbLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH7PR11MB6545.namprd11.prod.outlook.com (2603:10b6:510:213::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Wed, 15 Oct
 2025 23:29:43 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9228.009; Wed, 15 Oct 2025
 23:29:43 +0000
Date: Wed, 15 Oct 2025 16:29:41 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Shekhar Chauhan
 <shekhar.chauhan@intel.com>, Balasubramani Vivekanandan
 <balasubramani.vivekanandan@intel.com>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>, Fei Yang <fei.yang@intel.com>
Subject: Re: [PATCH v2 15/22] drm/xe/xe3p_xpc: Add L3 bank mask
Message-ID: <20251015232941.GH5409@mdroper-desk1.amr.corp.intel.com>
References: <20251015-xe3p-v2-0-b9189b3056a2@intel.com>
 <20251015-xe3p-v2-15-b9189b3056a2@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251015-xe3p-v2-15-b9189b3056a2@intel.com>
X-ClientProxiedBy: BY5PR17CA0011.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::24) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH7PR11MB6545:EE_
X-MS-Office365-Filtering-Correlation-Id: 03567cfd-16a2-4bcc-e502-08de0c42b880
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pugQKKFsvc0C57CrDIbfhxaIeFHNvutKwPeZ0bs/TZqnXAGOtM67X8PYxcew?=
 =?us-ascii?Q?hXq7pap92Z8OU7Yu3oVvHg7D62CTZYk1gxyBZnyZD97PRzyW54EZEuhPqXIW?=
 =?us-ascii?Q?yFVjnCUn3UwYZPDmD07nMs6I4umcekbb2CQet/sxg+Etu0eEkUCQTghh9gX4?=
 =?us-ascii?Q?SDZtlu8zq7tP1jL72KUqgtEy2nQXqidFig+Yuw8o+eZevmebuVxC/ROchQrn?=
 =?us-ascii?Q?cmZ6nMIsY8XIee+ZuGkJYGnbvTGoHFmQha5BtvhiziF7bnWivYufvr/3AouV?=
 =?us-ascii?Q?WCprgK5TfX5ipPq4IyLuxPUjC9BokMzbCyqPVdSJwJqxlbnLkIWiJ8j9xA1L?=
 =?us-ascii?Q?sRT+1Yh7HxpnUGG55FPbV2Zbcc9ku1Avznku6w77h6VW61DJ/mABPyXpqUeS?=
 =?us-ascii?Q?wbLZ7Kt6hCLehecYSijG5MRkUIfWBfyuu1vDcNeeUpLi0NxqgACdQAw5s46s?=
 =?us-ascii?Q?KUHK+BASgFRmBPK8msidA1OsqDV+hHs20aJFqpIpOf+sv4PxAi4YDB4qc2Bg?=
 =?us-ascii?Q?SALUFyzENxLIDD/8Bkth19TLbyeIWaSjQDnwM7bXPpebcrG8fjY+Ljg0R2xY?=
 =?us-ascii?Q?OpjJB880wLIb6mF21CP1p7qMnb7qZgk+4/iCicOPnAo11/flRV94ZRMxNWpJ?=
 =?us-ascii?Q?8vBzOCtCKaLH+opUB1+Q9z10aJSG6J0MQbuNifp6Wx5Ky1U3uUNmeG0rNCFG?=
 =?us-ascii?Q?qypnJbw4QIh0RSQYmzlEbHl96VHEwsyt5V1/EE6GxQs9dgPKJqPOpHPr3SDx?=
 =?us-ascii?Q?wqR+ttMrMGBN/8nOWdTcEx4aMDs6oTP5UG/t3FrFecRZ0M3Yo0jqJxFl4bMd?=
 =?us-ascii?Q?QsTuV/AyQO8RPcivZN8EJOFaS6bqKXSb7aup6H0cVWtpWzlTRuQW3yWiZDLp?=
 =?us-ascii?Q?lS1Kh+fhuDN5Y2GSJvt3Lk43k5hBNYVCqyPqFft/V1s0AfKB3Wv0wzvY6z+4?=
 =?us-ascii?Q?E3E8WKBqF8glv5pJb+XimPqFToGe/QUFWYIyu1uWlGY+iKwWZH1L7QgraLH5?=
 =?us-ascii?Q?sqeKhyuNvDLT91yd7fBNQVVXNHr46mxPTbQymS7aheb7DPMOapkwZybz68X+?=
 =?us-ascii?Q?+keU3FFe/1Q3tUqn00Rkp+PK66dTPAlbLorcTQXiqVqAlZlkIicBEbWlMqxh?=
 =?us-ascii?Q?xWRJ+BJseTjxjbCt9zcsFXM85XHdrOWzw7iFPPiJGWGsAJCmR1/ZsIyerY6M?=
 =?us-ascii?Q?YD5gyu+frZhp8jtC/B8jeC0XFybyrFTek95gEe+U9v0vELgQmGyK87ib1blc?=
 =?us-ascii?Q?KSiXNmYsB1nDHV66vORdbSWAwowUqetKkRBSi5ymuk6q4kIR8e3uJZQFjPAm?=
 =?us-ascii?Q?HVeGCIiOPnqiYDJ8WN0g/uiztD24nbp5Xhbwlt68kb++0zO0kIKuMFDqtMOJ?=
 =?us-ascii?Q?/kayKUj9kKGVYSv8REFIDQmMQ94uOUoxkAsPEFiX4z8w0qm5fLplX7sAmNC3?=
 =?us-ascii?Q?yzL9XgxBOvQbuCNBGS7l+p3BSkfSQ6XY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fCCiZsXFH2nDZxS1zosUiNEuyZoj8V8vwjiBoLVTOSDPFg1fKSOb9wz6UGq1?=
 =?us-ascii?Q?CdgLXH7820/2mMDNCOd6JBe7nQrouWmeKWWJi0uSOnVkJ+MXtpH3LFfbVDCS?=
 =?us-ascii?Q?PADqYDvwjt7ncB0ROBkXp8ZGN7JL0sSsa3M44lEePTdKkEn2p5L6LSGKPS3w?=
 =?us-ascii?Q?JRi66yWNaXF1IYhP4b2Z75845ilHv3pMheMHDEL5G7gSwZdmAUJMiqamccpq?=
 =?us-ascii?Q?059lb6zA6e8O5L8qwz0cHTGwOOGZ70p8QtB25nLHdNBxf2PWargYQ5j3SOky?=
 =?us-ascii?Q?9wesi9xQ94gANxQIa6m3xUyFDPNNXCF5J5Flfg7d10lwYWudkJTDM+cu7+O1?=
 =?us-ascii?Q?j0PRBuvicLJxxb2P8ZxmPgbdD5GQy1YT5W34jJzjcUn21FtE2xlhg9fmk0A/?=
 =?us-ascii?Q?4MGW8QLawmvrk1V6kI6FeHOheu8p0oQDUKPV1Jbwjj59/mB+i3kywVFgnWym?=
 =?us-ascii?Q?3jxC1PE3P3hTF18OqJC4zl8oXg8y0aEKm6ftr9S+KZ4kW4DGhh9JZ7x3oR2W?=
 =?us-ascii?Q?q8J3531/jYRzr1mXqhQ+yP3LggSscJPNhfzIhWi9UWQ2e+VaxnxKD5D7+UQy?=
 =?us-ascii?Q?JRbSGiU/WlxNNzBqMK5yE1+Ex1CoTJSDG+AsKKb64rW9wR8Tg7zQK9xCrxV5?=
 =?us-ascii?Q?5r2cQxDNnvioB0+UXly6aMWMHSxobbf6J/wKw668RW9c0aGKQWWl5DFDCpnt?=
 =?us-ascii?Q?cGX6/8lxCjEqac5pCSjEoNA/vijQak6rR3EM03KbkfbWn2XbZjwomtIxeNBp?=
 =?us-ascii?Q?WYi/kN2ktggB0P41zD80z2DAl9f5TIU5X1vStVMAjRRwXUjErkeIQS6qgwlj?=
 =?us-ascii?Q?nTGIOf9tdYEVwfr+YiPnrvI6svT3DvfdRc+rJ1vcmUfk7eueBawcMw6bv7n4?=
 =?us-ascii?Q?iAkeqY+sowTZdZTmg8eUXPTHwKCdTWTEdUmgkSIG3dP7Y3xTCqpQNIlhFRU8?=
 =?us-ascii?Q?riRq7+UWCgysFBkIBxTSWWhsbzrdefeUpwKb87J77kw9zKcZaLfiipi6xxvx?=
 =?us-ascii?Q?pVGikPxkJ3SCjrJfLWSgsCNCjJ7tZzLEy6AoxrEBnZPoNlah6vg8vhn9qb9v?=
 =?us-ascii?Q?K/e6HsN5fn7VM8y7WMFJk0H22sCZGLFkQIbMQSes/JBZCayozYf4s36vYH3V?=
 =?us-ascii?Q?YMcvjrFLal4IjRPHwNBtYhA9JR1YjPjWY0iMqYKBYP08rfyBTMVzF5ZPCjPQ?=
 =?us-ascii?Q?vDVDNoRqELlWFQQFr/vo3IxasBTvur+58v1corUQ8YK1tLwhY5KMUuWWxEfN?=
 =?us-ascii?Q?6HJpegvLY5s40WgVo+nxyb2iuuzmB7Dzc6W+sSVsAlKr+qA4K8MW+BP2Cm63?=
 =?us-ascii?Q?ycJt+NTfMXs2mpXC74yIzZWhtd1D++hVQ1S8hPtGt5AhUBaUEeYOYln5TCGy?=
 =?us-ascii?Q?ZeB+d3S2cf3w52ihouubjqY86IG9TTgYLYxl8Cf7EA1UC773srAdpuX9es3V?=
 =?us-ascii?Q?suOBJvSV+m65/5pfasfrAX+yFolB6D9Q1yVn3yRek96x54taJwsBu8mRmN6A?=
 =?us-ascii?Q?CmVwCJYCTSXlHyaShm3ZDSUvJVNPetue9SJFeu/JzconcGmjnh87I9GHXSJR?=
 =?us-ascii?Q?/zWfhrWTfbF7WT7agOb8Q4QtCOqC58/cPiOFGmBKsoBvI61QcBCC39KSxdxA?=
 =?us-ascii?Q?0w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 03567cfd-16a2-4bcc-e502-08de0c42b880
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 23:29:43.7196 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WAONeSvl90zJjbkHvHlN7pBUR5JLMlGLzLzHEMpM48Blxl2LvEaGiAPsgHAcGKzgojy3cgAPyIsRo3pQ1E2hUQCVD+tglArq9o1NV8GG9CA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6545
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

On Wed, Oct 15, 2025 at 03:06:30PM -0700, Lucas De Marchi wrote:
> From: Fei Yang <fei.yang@intel.com>
> 
> Expose L3 bank mask through topology query interface.
> 
> In Xe3p_XPC, MIRROR_L3BANK_ENABLE represents the full L3 bank mask (not
> just a per-node mask), and each bit represents a single bank. With that
> there's no extra complexity to calculate the L3 bank mask like there was
> in previous platforms.
> 
> Bspec: 73439
> Signed-off-by: Fei Yang <fei.yang@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
> v2: Better commit message (Matt Roper)
> ---
>  drivers/gpu/drm/xe/xe_gt_topology.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
> index 80ef3a6e0a3b5..14af073783ad3 100644
> --- a/drivers/gpu/drm/xe/xe_gt_topology.c
> +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
> @@ -148,7 +148,11 @@ load_l3_bank_mask(struct xe_gt *gt, xe_l3_bank_mask_t l3_bank_mask)
>  	if (!xe_gt_topology_report_l3(gt))
>  		return;
>  
> -	if (GRAPHICS_VER(xe) >= 30) {
> +	if (GRAPHICS_VERx100(xe) == 3511) {
> +		u32 fuse_val = xe_mmio_read32(mmio, MIRROR_L3BANK_ENABLE);
> +
> +		bitmap_from_arr32(l3_bank_mask, &fuse_val, 32);
> +	} else if (GRAPHICS_VER(xe) >= 30) {
>  		xe_l3_bank_mask_t per_node = {};
>  		u32 meml3_en = REG_FIELD_GET(XE2_NODE_ENABLE_MASK, fuse3);
>  		u32 mirror_l3bank_enable = xe_mmio_read32(mmio, MIRROR_L3BANK_ENABLE);
> 
> -- 
> 2.51.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
