Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00E6ECCD185
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 23:34:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 935B410E108;
	Wed, 15 Oct 2025 23:34:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f6SXWCZP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78DA510E108
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 23:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760571274; x=1792107274;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=q8TGKs+k8L5pvAhLSFtyT+K3agYg1ZN45UsL/x9dCPY=;
 b=f6SXWCZPwd9Tp6VIHcvu6tvyG5GF15YYhIV/2LtFMPN+NmeWdA8sdQY6
 jBqUefY8iPTnFCXOlywrohoKpzlLOBmM70U1Qa9JKiwE0Tabv8stvXqmH
 6/UP3YQ+RgSFbS+iXMEqsUkEpD9p94fqMGz1rI4Ckms1kIBeANxvy9wrs
 rs0q8tV0SV5c6OmrefNaQtAXEaqxGkZ2upB7nWcyggyLnc2l5fKO8GH6+
 SISb/sERCGPWX2OhOiVKHQmFx7fuVXMiEb8Yj2HTceb/dlS6dph71i4J+
 o7ko1Hhm/pqvcdhN17RECR5Gwo26xJoUCsMnn6o+Q6Kn1fG/mewXejb3E g==;
X-CSE-ConnectionGUID: c36B2bYyTaOpdRrS0ocXJg==
X-CSE-MsgGUID: vZ/bwtFDSfeN5cJuqpC4sQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="85374649"
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="85374649"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 16:34:33 -0700
X-CSE-ConnectionGUID: iZBvwiiITTCRe/2BicxN3w==
X-CSE-MsgGUID: +tQgCGKXSuSgK2Y+buBcPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="182705789"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 16:34:33 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 16:34:32 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 15 Oct 2025 16:34:32 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.23) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 16:34:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DfzvFOO278VM3sHc6CqTj/KPIPQin8DzPhuuE3PbiZctiWqQcdnWUDg9csuzilKsUjobl17hbj8qjo+Qib9+bptAYhVJitk3zJwftXAxaymY6cjUh6MirQczXEtZMVHwXObqApkUD9qWTwjKBFa9Urb8rDpsTkiDo+VPn8hKv04fBA6HIZTWBd1c3YCD9qjML2l1fmPY+u1PUXyrulVHyiV1B17+wMUuDzHqktbBSXM2b77BUjOVl1iTK3AIh4Y9FrUVRIo7yuUefLl9Q9ngPql29dnLVsnF9sqa2CcR7YrCYUAsukG1dOtJVZKGACijjFoYsttlBcsmslGvTfkZlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IXvm2G2Zc0g+J6f2oxUkKu4bAbFRPWxEEb4cJCK4T8k=;
 b=Onats65VL+W10wFhgP1fgVYCSEUpj7mL8U4/Od6NSXEDhFqYKWF1ei+e/dSk/NZd8lElLnm0uvcdj6D4GiFiF9AC2a9XuNaRyah0MIb/fupeH+MDOcxp96AtbP9XAr/e0GmGxaikg7OvOtqHquLqkYaM3CGfFcwDEm7rKg4GdYTX8wQRxefYD5O5nf1FTR0CHLRvr+6rhU1+PxagbkbRzxpAcRGVvstNbO6+ijn7gcgcyTdvAee2udw/gQEmuxKaVspNLANMeBnQoM4Ri+tp5pots393ILOI8wJpYCpLu9Zl1/yL/94UXA2lLFJeIKSdsl2d8FIEX/qZgaGsrvYWSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CH3PR11MB8659.namprd11.prod.outlook.com (2603:10b6:610:1cf::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Wed, 15 Oct
 2025 23:34:30 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9228.009; Wed, 15 Oct 2025
 23:34:29 +0000
Date: Wed, 15 Oct 2025 16:34:27 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Shekhar Chauhan
 <shekhar.chauhan@intel.com>, Balasubramani Vivekanandan
 <balasubramani.vivekanandan@intel.com>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>
Subject: Re: [PATCH v2 04/22] drm/xe: Add GT_VER() to check version specific
 to gt type
Message-ID: <20251015233427.GJ5409@mdroper-desk1.amr.corp.intel.com>
References: <20251015-xe3p-v2-0-b9189b3056a2@intel.com>
 <20251015-xe3p-v2-4-b9189b3056a2@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251015-xe3p-v2-4-b9189b3056a2@intel.com>
X-ClientProxiedBy: SJ0PR05CA0104.namprd05.prod.outlook.com
 (2603:10b6:a03:334::19) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CH3PR11MB8659:EE_
X-MS-Office365-Filtering-Correlation-Id: d49fe66a-c9be-439a-2680-08de0c436306
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uKGe6Ip7jpD4nI4BboNiRc1WWvrPtl+1PZR4vIToQELdL5VVwBUMYbE09Nnj?=
 =?us-ascii?Q?oWN8EKb9fS9dyPMfEBl5en+K1TGSrA2IvxqhqXrEGKJBa2KNuuDGsv0RvFp0?=
 =?us-ascii?Q?a2cRrdAODA/eRTGYICm3NfiazNibgrAXKlcMdCg5f1f3E5+PC0bnE7KqXRkh?=
 =?us-ascii?Q?JTf0wniU/92XxiEvkwbX06lNDLs84MtlvxbrUg88dsr7aV5upv1zHaa68Z9I?=
 =?us-ascii?Q?Ne9IxY3kieEbVNiG0WhM8MXwQ8Nc/WbqtmRahrUJfkjNORZYj4GS1UlnqEcX?=
 =?us-ascii?Q?Ag+f+Zc11F4cKgMgyrrtVqj6rs5WfiGSO4O313Tmi2z13SxH0LwwVJBH85Bk?=
 =?us-ascii?Q?TTkgbpplJRNs9zppNM2DIubXaGa/+zzmi3J1tCNpehq2xEZP+tz4/+r9rpTu?=
 =?us-ascii?Q?aKMqEemuaI1kubiJyPinZCFts88XLXIY9IC8TB8kTIw+sFEUlkdocxecyVYn?=
 =?us-ascii?Q?vCqlazGfp3KGxbubicUpoLkwR9+hbWGWz9hWt3GFlefpDtfDVdyxha8TEB8n?=
 =?us-ascii?Q?ME5f9zfympRW2T6Qre752jjTMJoyCkL3iHA1U9441WqzttV46s8PCnE4CTP3?=
 =?us-ascii?Q?kVuVIgENAdwB0cV5WLibL6lhxJNmcXruJQZu+X3ChjiBpypHyjnUsZpiMtnL?=
 =?us-ascii?Q?ENLrHPk4pWNbtXFaeb3Hg9QzZSNIs38kTq0zYmCdQJfjlP71OnrY3ivp2M1n?=
 =?us-ascii?Q?EPinAYEttAxnifr/wPZcE27b9qa4iNqh8qrcEAnEQ43Z27JkE6va6efrAp92?=
 =?us-ascii?Q?sgi57JH0SUWI4AofXVG2CHFL7FM9WmymAZoQ0x6/3MiPtOfcS/oGBMaY8cV7?=
 =?us-ascii?Q?j34mHsdgvTWQSTzFSOjddFJj4jqt0Z8DixExcQt0UZTpd0wsJn1zraMqmvep?=
 =?us-ascii?Q?cUAh3tVzVVmIyKbZaqN8V1+n750o72ZJJoHdjM+qJc+09A3pGvynHQdY9fqH?=
 =?us-ascii?Q?wXpXwKoIfhHYd6ZqwK6dRRDmO2b7V343ztDJEoqVy6mcjvuCah16cp82z2vV?=
 =?us-ascii?Q?o2ftU8J81yF2D5KgBB6cTLnsTddCTPzT4RKPFCtnwey7FdDNXf5ULSJDb62O?=
 =?us-ascii?Q?6RNPYQ00bGtolP8mj4TN5tKqcb7CORh+ovipuT6Hz822c0ViFCbYZ7EJ1vL2?=
 =?us-ascii?Q?17cEcl9rgqXRzqew8WYY8WCwjQengZ1gr8DavM4UU1gxEksgZnfKKaOtlkpQ?=
 =?us-ascii?Q?tKZHkETg4GAoopwQR9EeYVTzqxCZTKPvVIC1KIWtfJVKF5Bxfnw2HdydOnU5?=
 =?us-ascii?Q?hrJRLRV3I1JA2TdmSosQsP5HjlmXWwan/cP+nyGCrMYvz9Js8EwThwHBntQz?=
 =?us-ascii?Q?coVwPmkXbnCgDj6o/0b2d5PL3ORQkJYac+VQ/7Jh1CFOtoDgiwBfD0vqX6Ns?=
 =?us-ascii?Q?RElFsxVF+TAgH6ArjRFbTVq0SIr/yFouyAJ5qPB3S/gbgV9kXjKkOhVSrpcB?=
 =?us-ascii?Q?eB6wGHR8VBhNXLtOab55KJE+1hkq+6za?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3pEsQn782FT9Io7SIa5mi/075TghIQnprymXB/TM6MYdtH0OSumP8QfgPLIf?=
 =?us-ascii?Q?KMv5g2EUFkPu/7g62lmhMO+OjFEwGruUAUvt3vBrEdbRGggWHLofnlFpZwxu?=
 =?us-ascii?Q?MQCM9e33NEaLpYyrWHbhATJFAUkXUVgxF95hGcmUcAMn5mA+Fl8tSYsW/zEC?=
 =?us-ascii?Q?LYGOSajPYobgZLjNc5z/OQMXVElUjdFKCrmBKFSkC5pR1rsLZbRNLNA9a6CE?=
 =?us-ascii?Q?DqbsWrqyHFIiJrMKE0NV8mtM8Mbgdm+aY64lsqqoU8CkpOPrbo8TeYfjB0Qg?=
 =?us-ascii?Q?4UPWi6EOIuWCn/WbF1hDZW3DlqlsJ1FRg3Lyei94IPe8CPXeM1sXfHF3hDVF?=
 =?us-ascii?Q?Z3mDsvxCgUizKTvsIaWkUvmgXc7ysNvTzsfWiJHI+mJpZT2j5VP9Rgtt+rPv?=
 =?us-ascii?Q?YHTe+xD/2TZZ1l6YekJ4HzEZWXXBZeEKpO8uPetb+DsHXUUekPVhkRL7c5lq?=
 =?us-ascii?Q?Nj7n+gVPnxInYDsvD2g+8BvPrVNSmHcrug0RtBfg/OLzJAJO0+ESb8oV0+xy?=
 =?us-ascii?Q?+PxfM3XKbHppM2SRuFerQzPSUsxlqKrSd8ZoKm9dIa1QqjActBQgcIsObXt2?=
 =?us-ascii?Q?6u5P8GlHPvx1fKoV/44KLFBa0A4cwfne8oIj8QVWn7c6WouLWSycXsF8hzQd?=
 =?us-ascii?Q?EMTX3FN0Q2uU9kjnlR8zxKRg76KGRFjUYG2V+iHYEEyuvg+pG9gczogVRle4?=
 =?us-ascii?Q?A6mfC6pPfveloSB9M0sE9g5vzPbyOrVeluXYyLCr3M25oq9U/j1K2e3NWvPr?=
 =?us-ascii?Q?HhjbEnJisDp+b2WCyR0cRXdygIFdJ1Nanb4Yt1z/xhzRX19tTkJntPotI0Ix?=
 =?us-ascii?Q?bBuor9/ctnat+3GHD3OejdAmPYmiKy23A/xIbh8f3DZ0sD4XklXjDOogVtm9?=
 =?us-ascii?Q?OAUBl1qWcBG7JUYZtKXzCH9CShDSVuU4BiehQMhGwgRldQuG2+HNEVVZLzq+?=
 =?us-ascii?Q?/HasBOT8sJ5nAajErMV2lb7+dXUFAWGl5uWAGKU08vyxFPhtTvKuV2h1g/4H?=
 =?us-ascii?Q?9OCozbmYJ+vrTZr/nK+JMoW7LGssd9rDYriJlQKtQnEBhzM3IAnRy/HKtMU+?=
 =?us-ascii?Q?TAW7Sz3TPL4Zy6DeY53S1TFDiAl2PmoQESNQlLC+TkD6O24Uhtdw6a3dxFdK?=
 =?us-ascii?Q?k/+AZJ4TrnqvMKWEG/Rw8xS+LrUrlZP4SvB1gLVTFcxjw/t549Euz1WLf8fS?=
 =?us-ascii?Q?t9ZjQZe4zw+6DFQpa8IwwC9APoX28chY81GbRcliNf07hgOmnjU/xopbiO+X?=
 =?us-ascii?Q?8xHU2oLeyILUmRqVfVQF/sk6fvbYCh162cKDiWZThAOZMUUbSH9uhl1TfL+N?=
 =?us-ascii?Q?8xoN4DBktAK5ZmvOMeeqRVS/AaS0Q7O1EXSmtkcmzVfAAyQ92AMQ2hzshkcy?=
 =?us-ascii?Q?jNuhXA3D59elnR/IAQn+PsiQFNeN/D3UzGPBDW3LJBGz2Yww2KFEc9CaV+HY?=
 =?us-ascii?Q?89FX/tm/qh099/Z0mjVMdwFWgXTzSASNM7ry5S1UG6aDMCEZqqFCsRqOrTr0?=
 =?us-ascii?Q?jbhDx5cDirMWlBujNLi8kZHHh6Z0hT34lfhiEO11rQfKY7PC9CI4esnTKdiv?=
 =?us-ascii?Q?jLjomIbIxPo5zEIxBJJHM24x8HyZxsq5wtGxY3mbPhAQjqljebQIz4RtwVSu?=
 =?us-ascii?Q?dw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d49fe66a-c9be-439a-2680-08de0c436306
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 23:34:29.8384 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pFZiU1x4mg+c6/fvVdcEp0DHGkw1s2rvhSFE3kwrOnGZts3DdnEsOtDi8sCS0GYlf5egUo9L245XBtf9MNcIoQ1F82vM9FQfGYXRlLID5oo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8659
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

On Wed, Oct 15, 2025 at 03:06:19PM -0700, Lucas De Marchi wrote:
> In some situations we will need to check the version of the specific gt
> being passed as argument, not if the device has a certain graphics/media
> version.
> 
> This is extracted from a patch by Balasubramani Vivekanandan that
> may need some rework, but this helper is still useful for other enabling
> parts of Xe3p.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt.h | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index 5df2ffe3ff838..9d710049da455 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -22,6 +22,12 @@
>  
>  #define CCS_MASK(gt) (((gt)->info.engine_mask & XE_HW_ENGINE_CCS_MASK) >> XE_HW_ENGINE_CCS0)
>  
> +#define GT_VER(gt) ({ \
> +	typeof(gt) gt_ = (gt); \
> +	struct xe_device *xe = gt_to_xe(gt_); \
> +	xe_gt_is_media_type(gt_) ? MEDIA_VER(xe) : GRAPHICS_VER(xe); \
> +})
> +
>  extern struct fault_attr gt_reset_failure;
>  static inline bool xe_fault_inject_gt_reset(void)
>  {
> 
> -- 
> 2.51.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
