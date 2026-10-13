Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4134CCC6B1A
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 18:29:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08DA610E21B;
	Tue, 13 Oct 2026 18:29:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDBB510E5E6
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Oct 2026 18:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791916184; x=1823452184;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=a9rvYUeVlko2oRVCUy/XmguF9ORAl6xwRGqxh3+1a30=;
 b=VD0lgJR9kdRL3tUMY/t+zqILLo4xheVnz7fwIZMeSbVUUpCOV7J0XGk4
 zUA6zWSGdgnS6XXvOr6+kPw0KaRxhoxnzWRLTC9q6L/yFttVrSPP2EZ+n
 2ESSpmV/xGA5EXPBqtkWKu58l9wCmTGbRwJ7xxthzH6FE9fK7EUQ4uONr
 Tvns8bXgfIyNOsTGwn8jyQtb8MntRrNE/GaK757ne/B9nEV8iJnhChFyI
 FxtJaMecBgqY11Un7nsmBwsHyoj7wigwi5JHmMxFpTqD2fiOEGH+Ah8ks
 pLGgrr5m4Pghw8T03dyB279upxhW7UZDD+bIda77b5kaaLd/n7VM/7V2G w==;
X-CSE-ConnectionGUID: fmIzgCkpTBehRA151iZaHw==
X-CSE-MsgGUID: 3NRObEkjRi+E9VjjuUw0cA==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="542796"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="542796"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 11:29:44 -0700
X-CSE-ConnectionGUID: eVhBV11xSEWKdxg+PZoqRQ==
X-CSE-MsgGUID: 0wjd0Fv7QQeRor7kq5Sytg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="3068973"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 11:29:44 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 11:29:43 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 13 Oct 2026 11:29:43 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.28) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 11:29:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eA0qAEMCiyuI8ScN2akju73LjuqAZoo82gaA4f+8m7XsCS7pWp9biouI357Qon7tyP3/jLHnavqX1CsVCwdEBjaluDw4/USAVMeemeDT832wEd+L+sovLfCRhCJxBOQhl852/6idT9EEVPrK0zLkN5iy/oniF1AZs1+nOR/WJPlTmfzwK7ec8REaGFbY0Dy+aMIYscECsGvyZdGFAuCpX8bZmlcCXVfiZ+mintxOHiyQ4yCGS18kXmdrqq4VOMJSbCQHGMYFHiyPu1vv5V9kosQc/1GvGcIt3HtfN/ch6KU9Wk9MnMqN5fZCcFJ3aheWFRfjHpx0bV/TPHmjjim9+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ADzMZsUH+yCTGI2Uq/G1ulNujwRX/wDRj8W/ar4gwaE=;
 b=jEgOtq3idvpVb1md71dxwlOc6zhTVuVXGiOkis/L5tcvYviq8JzOVp/iBjUy2vxKZ8csMeJx5wfD4FIoR7pX4zgNKvMyfYkc7wV599h0w/D6bjA/EA7dtDro36y3ELNUvfHtHqud6HBp9VymS6UqaCPTLQpZ80QO+IUwZGBwdg0i1WqNKE8s7lStBg5k5OMeb30xP7tu2z62cQ/wNwJYmwP2UCLeVdeRzOAY7Oxyvh6OauyCjU2FCG01FtuO2EJS4D+ohW35zUi5Vz9AWvaVx6B7GbZFrl1N95ANBya199ffbbM9XWBLPvJBmsCx0oADsruIEXEjLn9rEP9xcgjg8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB7180.namprd11.prod.outlook.com (2603:10b6:610:148::5)
 by CY8PR11MB7314.namprd11.prod.outlook.com (2603:10b6:930:9d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 18:29:26 +0000
Received: from CH3PR11MB7180.namprd11.prod.outlook.com
 ([fe80::70dc:90b2:50b4:31a8]) by CH3PR11MB7180.namprd11.prod.outlook.com
 ([fe80::70dc:90b2:50b4:31a8%7]) with mapi id 15.21.0496.015; Tue, 13 Oct 2026
 18:29:26 +0000
Date: Tue, 13 Oct 2026 14:29:12 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <michal.wajdeczko@intel.com>, <lukasz.laguna@intel.com>,
 <matthew.d.roper@intel.com>, <matthew.brost@intel.com>,
 <mallesh.koujalagi@intel.com>
Subject: Re: [PATCH v5 1/5] drm/xe/gt: Use GT ordered workqueue for wedging
Message-ID: <as54eD2FDuQdiT6b@intel.com>
References: <20261013110439.181447-1-raag.jadav@intel.com>
 <20261013110439.181447-2-raag.jadav@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261013110439.181447-2-raag.jadav@intel.com>
X-ClientProxiedBy: SI2PR04CA0012.apcprd04.prod.outlook.com
 (2603:1096:4:197::14) To CH3PR11MB7180.namprd11.prod.outlook.com
 (2603:10b6:610:148::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB7180:EE_|CY8PR11MB7314:EE_
X-MS-Office365-Filtering-Correlation-Id: eceb6cd6-6234-418c-630a-08df2957e8c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|6133799003|10067099003|22082099003|18002099003|11063799006|4143699003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: Cx5BH9apz0lgb54YG+h+SOmbLVyCm946bcV989zfVyft0AHmN6XhXLcbho1pH2RTihPEijxqul5xTgbQYTtyCkNsf3mY+6Om8GaSmOV6cxOnR8/1KEuxSa9I0jDxhzVp7T6mSgRp5xPP1nT6nG8OuDg1M+TirLFmr+n6BmikRiskSidlIsITizinQ5Vk1JfzZo0JbzsvtKAcSMhq2OlSgQ6BbPSbi6HOFWgMhnKqVRRYRMP2ld8NMelAHrxdTZW7qnYweGxtDfuWYuem6ziNALVKGxExshEUW0GkVSj7mcXE9uqfd1KHQ6WWfoDQFuXru2p6FLZ5wdVGByupK7NICs2WobAyfzZebQuVsXwcXOL58+QStZ7cvP8638yLKwoCpNXMaDMA2+6l4lQrYAAYUorDjSvr7uFFdE2L1dd58OqdXh+F85+Sniio9BnfUrgKBW+8Aw3nbal4TVeFDAtSaOAHYqh9zyj8SXtez7hVm56AqJbwrZCfcdyrGOykf0g5AR/OMP8N5D5dvhBci2iaEro6g4r4tfFAfG02XY6OdjAjnPVX6Fz/+B2U1Zgqdo2Cm6Ok4zrePEYq/TuNCfO3JRnSJiHyMd2XOeObxjY21VYTj12O7whIfRzd4DGMxLdQ50J/tU5Eh2iKoauyV0s/xMlQDsVeN5qZ0Z4B4RaY0TY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB7180.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(6133799003)(10067099003)(22082099003)(18002099003)(11063799006)(4143699003)(261009223027099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hb0jp/anQveY/+JlLzVy412u701n7DFTGnqAXdzvKcl+ZFQdJFv/BZ1xkSHe?=
 =?us-ascii?Q?0x8io+SgRpkg7cmRKdOK4s6LbfrrrdlQAtKNe64OJxyz4A5BdX2/R1fj+7ka?=
 =?us-ascii?Q?t+FlJzL2DHBuQu6CsPY9DWgsXsA+u0itS+z26draTeauGEsjgb6SXE4RvgT5?=
 =?us-ascii?Q?og1AQtTnb8qWK8Ok9siVTQ4I9l6yN+RoXQCUeXG84hDgET9+UnFG/R0/QiRn?=
 =?us-ascii?Q?/E2N+XWKB1LUZmZQGqTRVvnioK1NqD6jSDpfZ9gpbFj8XvCpoiu17xzj43ET?=
 =?us-ascii?Q?IPoE9P2u7LA6sGVPZLcY/x71X/vG1JHVDuk38Chn/8XKgI5Yw5DB7Ru/I45J?=
 =?us-ascii?Q?OXMGFJ/ZDYliXVXue991gLv8nYnKse24Gl3bsd0z31gYYDKPRMd6o3jnvIKd?=
 =?us-ascii?Q?qVwwNALIwoHY6rOSLIn0x5OArfgtWrGNFFKsKWHmt9awr/vKnNu47HCaU6uY?=
 =?us-ascii?Q?FbcS3ZG4B878/vim/PweL20jWuH1gK0pqk8KxMfbADK+1eOfWTiJ4w/gF1rC?=
 =?us-ascii?Q?sclzb+J+qII0Vgu3WyQk4ij1+cIiAqMg6k+2yfAsfnf/NODzp2p/am9aF4p+?=
 =?us-ascii?Q?awbaN8/8AWDXnjLWcWV57a+lGkTppxXMkYlre8F2lgaBY1f2hgnGCEVeSQrg?=
 =?us-ascii?Q?buh+g9UQ/9poWDU1z5502cpUZrV7nIaJDFrOhDHKVVEFdBhdkEb45PDwvmAi?=
 =?us-ascii?Q?yNixlEoo3Dd/mei5/c9j3twV/uoBP43Q+JuJc7aUCEmq7FCP9lJaSp9Y4qiW?=
 =?us-ascii?Q?4zZw6T4rQlUGpYXJwg4z//FCt2jdI25jhMzsdWTSYhJImXhM2jikF8haCKZ4?=
 =?us-ascii?Q?bvS2wAzmceKQVEYxthhRCMWp25pHniu6+kydhwEkf+cFdXjGSbMeWeyGQp5G?=
 =?us-ascii?Q?m1g54dslOFDt10hDIiL1+/zkPEW+tkNMj72HzO/K9zlpNLMBAqMHUEJsx58C?=
 =?us-ascii?Q?F9KzPK796y4bK+Ev0X+7FAm8dq0tjiRsVSgwgTMwLlbqsIdlxFu/y1/15nBt?=
 =?us-ascii?Q?w1QwlRN25gdvcdCcWvQaZfBz1kOQV6gNEu4PV2AW3xeSM2tBItlUQ2MVe+v7?=
 =?us-ascii?Q?XpftUbMh/Tqu6ldcLS2XVH8nxAYhe9qr5XT522jEtJ3OPgYc/kpMRufcGqMP?=
 =?us-ascii?Q?C5QLMQ3yhJUQsqTjPCTlklq8pzDJX+PlpEXT7ObbFxussEdnAxCIe+zGyEuI?=
 =?us-ascii?Q?W0a22CNGkDH96TL4rhzkj5d101h4ML6dgQXVdfIIHU0+qKu7/qHIVCa5KTJT?=
 =?us-ascii?Q?9uFs5w3d8bHFPa8gBCy1KxKHh23h4ZfJf/O6PWmd/FnACBne5qvHsI1fmE3r?=
 =?us-ascii?Q?IA5kxrKHy5erPflx5t3KgL4KkvY0ycZH8YAmbphrk1zCPN0Io07UMyNC1goE?=
 =?us-ascii?Q?daTALgGXyilMvMTcNlrUH7dzlQE0O5cIYKxWfP+pu2KHC9iX5/KIiPzTLJIF?=
 =?us-ascii?Q?wF8up6QreOyrQrVoKTRVAdLrdjfc4/4u6tQMsPwH8YEEV7v+0ozlwcQEMU8z?=
 =?us-ascii?Q?BpBlnS5/fTvkffn0/pHLd8RCpFl0iX8Jc/x4DvwMtypv8d1OWncUwR0Lo9XL?=
 =?us-ascii?Q?Sp326wquAQy2AEaCrTijxLLLbn0NbfbZcBKluWOOKMv1eYc915JTxnEKjV8j?=
 =?us-ascii?Q?+sk+ZhxB7i8nF0RM5ShnJSKG0ge4C47Q+ImhGvgi9fJhhNzNcFLWDbvDadu+?=
 =?us-ascii?Q?6mmX5qgVPsBiQDrDxS1qW1aWWzgVhiC8cPXhg4RjCtZwL+wwWSU6roav8xrC?=
 =?us-ascii?Q?7YbXNe3IsYkYgUlUF2nXGT7RQQ7jcn4=3D?=
X-Exchange-RoutingPolicyChecked: LLpg7nJbgE5K47xiZ0APAbFT0weAhXxY3vUde5rl2GoenGNxmlcluE8SLmn6AaN1uxV3RHAC/5VNci3hCGQyc+CuByYPNSPD1dHIVvfqxCdzVKsOx6sd8riUKY0OVZgv1RjegbXxVqS26kIB5o0CBk1eHKLKFj+HFFtyy4i3Ml9hVbfczWlqiIvMZ6F2SDA2qHm6pmMusPgEyQs0F42othiD2oMK9QHRdlHoI0p2aNkCg2oDGRNrpZVLQofJisDE9NeWO3gPj2bLeCSY/RZmY3oxFtS1UMi5nv0ieo2V2TrV0Dd4wgO+Js6juQMfkohllxU7z3QXm/fR/G6AoI74BA==
X-MS-Exchange-CrossTenant-Network-Message-Id: eceb6cd6-6234-418c-630a-08df2957e8c3
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 18:29:26.0228 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3UmNlZusAfDtlTFmgnySr6BJPkBn6hlra1fRkjaOudQHIQQ1Fc//y9EStkcwswkTD6NLduOZkd3ICs/Sq4isOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7314
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

On Tue, Oct 13, 2026 at 04:33:53PM +0530, Raag Jadav wrote:
> Currently, xe_gt_declare_wedged() stops GuC CT and initiates exec queue
> teardown synchronously. This can result in tdr timeout in cases where
> the device is declared wedged while jobs are still in-flight.
> 
> Introduce a worker for GT specific wedge handling and queue the teardown
> on GT ordered workqueue, so we don't disrupt the scheduler while jobs
> are still in-flight.
> 
> While at it, introduce for_each_initialized_gt() macro and use it for
> wedging GT. This helps avoid races in case the device is declared wedged
> in probe sequence before GT is initialized.
> 
> Fixes: c9474b726b93 ("drm/xe: Wedge the entire device")
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> ---
> v2: Split fixes into separate patches (Rodrigo, Michal)
> v4: Introduce for_each_initialized_gt() (Michal)
> v5: Flush GT wedge worker to avoid races (Sashiko)
> ---
>  drivers/gpu/drm/xe/xe_device.c   |  2 +-
>  drivers/gpu/drm/xe/xe_device.h   |  4 ++++
>  drivers/gpu/drm/xe/xe_gt.c       | 18 ++++++++++++++++--
>  drivers/gpu/drm/xe/xe_gt_types.h |  9 +++++++++
>  4 files changed, 30 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 8392c9fad3c4..22ae10958d7f 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -1432,7 +1432,7 @@ void xe_device_declare_wedged(struct xe_device *xe)
>  			    WEDGED_URL, XE_BUG_URL);
>  	}
>  
> -	for_each_gt(gt, xe, id)
> +	for_each_initialized_gt(gt, xe, id)
>  		xe_gt_declare_wedged(gt);
>  
>  	if (xe_device_wedged(xe)) {
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index 83d6dafab53c..80bda9b548d5 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -139,6 +139,10 @@ static inline bool xe_device_uc_enabled(struct xe_device *xe)
>  	for_each_gt((gt__), (tile__)->xe, (id__)) \
>  		for_each_if((gt__)->tile == (tile__))
>  
> +#define for_each_initialized_gt(gt__, xe__, id__) \
> +	for_each_gt((gt__), (xe__), (id__)) \
> +		for_each_if(READ_ONCE((gt__)->initialized))
> +
>  static inline struct xe_force_wake *gt_to_fw(struct xe_gt *gt)
>  {
>  	return &gt->pm.fw;
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 775c826b68b4..4e047cfaf603 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -175,6 +175,7 @@ static void xe_gt_enable_comp_1wcoh(struct xe_gt *gt)
>  }
>  
>  static void gt_reset_worker(struct work_struct *w);
> +static void gt_wedge_worker(struct work_struct *w);
>  
>  static int emit_job_sync(struct xe_exec_queue *q, struct xe_bb *bb,
>  			 long timeout_jiffies, bool force_reset)
> @@ -706,6 +707,8 @@ static void xe_gt_fini(void *arg)
>  	struct xe_gt *gt = arg;
>  	int i;
>  
> +	disable_work_sync(&gt->wedge.worker);
> +
>  	if (disable_work_sync(&gt->reset.worker))
>  		/*
>  		 * If gt_reset_worker was halted from executing, take care of
> @@ -725,6 +728,7 @@ int xe_gt_init(struct xe_gt *gt)
>  	int i;
>  
>  	INIT_WORK(&gt->reset.worker, gt_reset_worker);
> +	INIT_WORK(&gt->wedge.worker, gt_wedge_worker);

perhaps this should be in the gt_alloc or some init early?

>  
>  	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i) {
>  		gt->ring_ops[i] = xe_ring_ops_get(gt, i);
> @@ -769,6 +773,8 @@ int xe_gt_init(struct xe_gt *gt)
>  			return err;
>  	}
>  
> +	/* Must be last */
> +	WRITE_ONCE(gt->initialized, true);
>  	return 0;
>  }
>  
> @@ -1010,6 +1016,14 @@ void xe_gt_reset_async(struct xe_gt *gt)
>  		xe_pm_runtime_put(xe);
>  }
>  
> +static void gt_wedge_worker(struct work_struct *w)
> +{
> +	struct xe_gt *gt = container_of(w, typeof(*gt), wedge.worker);
> +
> +	xe_uc_declare_wedged(&gt->uc);
> +	xe_tlb_inval_reset(&gt->tlb_inval);
> +}
> +
>  void xe_gt_suspend_prepare(struct xe_gt *gt)
>  {
>  	xe_uc_suspend_prepare(&gt->uc);
> @@ -1200,6 +1214,6 @@ void xe_gt_declare_wedged(struct xe_gt *gt)
>  {
>  	xe_gt_assert(gt, gt_to_xe(gt)->wedged.mode);
>  
> -	xe_uc_declare_wedged(&gt->uc);
> -	xe_tlb_inval_reset(&gt->tlb_inval);
> +	queue_work(gt->ordered_wq, &gt->wedge.worker);
> +	flush_work(&gt->wedge.worker);

This flush serialize things, but apparently it deadlock somewhere else now.
Perhaps we should avoid this one here and instead flush for each gt in
pci disable case.

>  }
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index 628911346455..c00a7c171f80 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -233,6 +233,12 @@ struct xe_gt {
>  		struct work_struct worker;
>  	} reset;
>  
> +	/** @wedge: state for GT wedge */
> +	struct {
> +		/** @wedge.worker: worker for GT wedge to be done async */
> +		struct work_struct worker;
> +	} wedge;
> +
>  	/** @tlb_inval: TLB invalidation state */
>  	struct xe_tlb_inval tlb_inval;
>  
> @@ -419,6 +425,9 @@ struct xe_gt {
>  
>  	/** @eu_stall: EU stall counters subsystem per gt info */
>  	struct xe_eu_stall_gt *eu_stall;
> +
> +	/** @initialized: GT is initialized */
> +	bool initialized;
>  };
>  
>  #endif
> -- 
> 2.43.0
> 
