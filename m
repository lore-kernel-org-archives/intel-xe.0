Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1BD3CD98ED
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jun 2026 16:42:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D60910EDF7;
	Thu, 18 Jun 2026 16:42:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A5idaxxb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 490FF10EDF7
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jun 2026 16:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781800948; x=1813336948;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nA57JpMzI/dWC7LvHEgwShbj0cZQdMwxub7/ogwics0=;
 b=A5idaxxbtDUoycVNs0cvNtPjvafIzr4cmA1QVL3giZ8b+Mnuw4M0NhiU
 kWVFflqpiw8O1EUSuFz6ZrKctZQ+ylz2xKWrRXzRC3h6f7uQc8kI6Cgib
 0SgVCxuRNNIx2FakZSyIz9MKalg2N/vabnDC3MDGuT3peMkoVSbtdkclC
 AKSJCLNCt4uswM+yjpYYGrc30NAGtY4DGLjSJ/8xk5nPWS8E1JDaRIGE/
 CxgSzCgb7sXMs137aZTPS9kKkWG55B7vCtKlsFpMFkgp8Hua4AppgF+B8
 lmTKXVGTkuJFOLXGznpWIkTB61MfKf5VuCW9m5Vy8HIZ6sL0ilSzu4fJw Q==;
X-CSE-ConnectionGUID: 24T5Nnw5Qc+zuA4hPZPW4Q==
X-CSE-MsgGUID: iqh6nRoKTzm02ozhZMqY+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11821"; a="108192163"
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; d="scan'208";a="108192163"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 09:42:27 -0700
X-CSE-ConnectionGUID: aWkeInNBRUOv17HPqytkKg==
X-CSE-MsgGUID: e5oUyGsAThyKjx/+E3/xiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; d="scan'208";a="246053209"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 09:42:27 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 18 Jun 2026 09:42:27 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 18 Jun 2026 09:42:27 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.30) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 18 Jun 2026 09:42:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EmlsdoGIf0ThsaK/ztJ0TQYui1PKFhTSKvcRSMTjFKPxSM+0ikCSLLRI4AmfdcA8SGMIuU0ikB1Oagl40rYR4/OBcwHPLIoVGknVZ3Z0vJcbR3RtvP7QvAlP0mYr7NL8m8sYNunkbjz9AgnA78OP/o0l3TEVy9URLph7bhuiCBZYC+SO9gdw8788Ncd5ywJEdWo+E+Q2PVkLZig3eejDFWvZEoJb1qWYZnBv58ifpefpsa5PHB/M2mb80M5IYbk3f8i291+EFY/WuLylG34dr0Ygdzm83jRQrKsk/lVXrgVpV3xKQ6M8k4ghaWpK3iNtiTs0vwxvDYmQJYobCWYQ2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gCQ6NdMcECdELYo1xIhaDAROZ5IxOj7UH+ur8mFKo5A=;
 b=dQr0C2iIB1+wXrL7zm0yeEZ/6D9csBf7Pkh5uig3C/a9RNh3WdmpVS6S05GCyV/9tXgdn7y6gZ42S13DC4/oHirPZp7k+0O10n5nucdcdKBuUofkdFVzNBvRvaeWAjvr/gwuqO1ZZkXu4l1QFRcbpjHmVNu1JBzLYikvsYJQglfqOPb0siouE+9vo8y6gfbU2tzuODUA3ZVlTQSYjCZBBnuwnYVfy1RkemWh0a939HtXseSX/U1SDZ8Wy4QNZi/LxEejPTNgrC1t8q35cV7PL1D2bzuUupwLXy82gFuyljcVoeNvNm1hlsYAT3foyDNVLYkTmcFwhbrGUpm1Q3zTDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH8PR11MB9879.namprd11.prod.outlook.com (2603:10b6:510:3c5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Thu, 18 Jun
 2026 16:42:24 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.21.0113.015; Thu, 18 Jun 2026
 16:42:24 +0000
Date: Thu, 18 Jun 2026 09:42:22 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Varun Gupta <varun.gupta@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <stuart.summers@intel.com>, "Gustavo
 Sousa" <gustavo.sousa@intel.com>
Subject: Re: [PATCH] drm/xe: Add debugfs knob to disable Mid-Thread
 Preemption per GT
Message-ID: <20260618164222.GH6262@mdroper-desk1.amr.corp.intel.com>
References: <20260618042421.483657-1-varun.gupta@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260618042421.483657-1-varun.gupta@intel.com>
X-ClientProxiedBy: SJ0PR13CA0212.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::7) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH8PR11MB9879:EE_
X-MS-Office365-Filtering-Correlation-Id: 11bfa5c9-7819-434a-095b-08decd589350
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|56012099006|11063799006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: PaXOWz9YFGfxv4KRmge8I73CjRPxCRI4stzNMC3wDGlVQJCXoy5AipYvUxGHrzwCd2lHnnG37uUyndG4NOv8ZxvjWFXjAfRdOPkuHaz9KzsvTBQ6Jwk2ALRpVTH9I5kkCEsjyjHmLtSRm5pqhkblPit9mQ1Xv3PPDX1HGEfxn5fvabqruxi++FDifcVOvKqOftVOVwZq2bntjmpyH75XEaBfu3AAdMUUjvTo6qPbRqu3DkLtJlPwpYiQbGloSCNcVGkFer0e+n44QIJ+eq5pzbX2/UQEsNC/jSNvD9ycqziCKBF51bl6ZlD/wx89m2mQV/9AZWVTcMjBwHMKW7vOkW7FdOVAAay08k7y+2gJzBkmbf/SulgTvkOeonJJOhjTuJbZAwRZEsp+f5mUYcfzNSt0ZehasVb0vCS2aIdTAnf+F64Jof3Pd7Ix2gt5zvorRoNcBmAa8Lnd9xHX2Bia3yLzo96ihqiX3UxEn0e8R1UaxZE3Q/svnpkl3Wcj1+Q88lGIaHiPSv1+J14J6ONs85UtaTM7M96l/BrIGUFVxbwLyt2vRFdkfKivERsx34uY2HETq4IgRv9eiNEo8NX8B3jq/oRZGIoj79v5M1pcDhH+RgIilU9G4yt5Hj08MsNw6uC3aMWrVYGR0eRiQDbgwGjIY5rbxMBCdjhjjOCq2nJ5/SnFvxvy+j3Ylr/WRwk1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(56012099006)(11063799006)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hq922n7UgWlKi3wPCvCN8W70EDcVQUfzyqVfrLbWjVSGfHTHp/j8g1evZ0p+?=
 =?us-ascii?Q?x8VKmhmswlw9dILc2/mh3aWe9qNdrX0nLMR1fuF6iTizay4UUjAHUCKsx74t?=
 =?us-ascii?Q?VmiMCUAvoaciHl96+blsDTTtyrqssHYLtmz1qfQFsIQ6fOIHgip/ILlh7Wf/?=
 =?us-ascii?Q?XBsiqMCTeI8J5T6gZYXHORoGe80zgQj7Ej2oRjDExBtKU6udz0wAVBhr4MQj?=
 =?us-ascii?Q?2WhIKJmJ0RmWUngPHHsaUVcsIkdmKDDgWherr1GwnOEdq+WTPEcFlkko+Z3o?=
 =?us-ascii?Q?Sox0lDNQREGr1NxzWDlkB99tOr/PQ+lv/urtySieaImus1SmaKQynKlhHqhX?=
 =?us-ascii?Q?Wmj4+18Uiy9CGLbgB7sGE6mky2PSgQ6m1vzOLwEC2tFRoNX9xw2RkeqHh7qA?=
 =?us-ascii?Q?jiLXVZVxozlTYjNZy41bWJV0GxpwmXTOfO7psehKa758m68ak4BbVhBwhg+z?=
 =?us-ascii?Q?aYSWrTW8zvri6UbraWQhhv2GNA1ww5bAvLUOIgkXDLnwvlf4D4WZAnM4EEjn?=
 =?us-ascii?Q?NkvAotmSgtGxRg0FKncLW17PQB2K9MSa3oNK4wOIfiRWgum3Ft6/Uy4oOir1?=
 =?us-ascii?Q?f/l6jjTHAvuM1ihoUk4uO3eYsX/GlLptKGCjAcHxHR+AIDGUR/X+zIatE2uQ?=
 =?us-ascii?Q?w/f3gJhIKQ2gmrXCdjoLp+M5BQnTS57nP5VRF66iusVsZ3EoXpKHajNjsaEF?=
 =?us-ascii?Q?Nxv+JnwMjmDImrTooTHQkV8iSwywXo4KAUQ9GTcFeDpmyWCgMcsTKgeOn8hq?=
 =?us-ascii?Q?m8fjZkA0+vv5rNsi+WAiX8VUjCAPEnFVl8gjVCHuSJsYHv2mDbK7bSnYYd8T?=
 =?us-ascii?Q?ruyXN+3Ke5FAztMxU/1IaKz/I5+vwiDyM3YRifg6ucmQmS8S1Kdlvj/cm8U9?=
 =?us-ascii?Q?iyB0zN5qbJe0xZNM30gRXIBUpPsqy1WaIAgOPnmfrFKuMDFn6aVRlZuNY/ek?=
 =?us-ascii?Q?n3Khpgl1IeJbclM3uchuAP+IDknEI1TyqkOQGKmYTrEv3EfxRVqadhvsoAxM?=
 =?us-ascii?Q?Q3w0Hpg2VEsFs4HW0qILlkweLLiNeVA6qG7CBgbNc+jCcmXNWJesz5DiJxO+?=
 =?us-ascii?Q?PkRUFVHOq1TYp+7sG5Jp6na1unLY3kjUHwcegrtOX1pD4WjYz+L2YOPqIq4P?=
 =?us-ascii?Q?JaVroGtwL2nZnZnglPIlmKTEhA0WDWONsaQlr3rBiHOdahy6eSxWeSearIi1?=
 =?us-ascii?Q?0OPLAp5hwTlA3Hs+nQLZXkCKo+8X6RhS5ylN7uOaCZsuWONmGSlwuGOXn8jt?=
 =?us-ascii?Q?AF3lJ0FyedP/PwOaxRp+K6/4ycE24hSNgkwu2Zy4Q2dl/+1mthvXz+UhNkPl?=
 =?us-ascii?Q?r78mm7bdMU7TC0uJFAAS0jCF0MdPNfo2nC/k5Cxn3E/EJ8zW1ctMjmTz0P1D?=
 =?us-ascii?Q?elUiTD6w7ApO5LWhJ+ijRgJInNDR6uZBLx8lktbpuLEkeBIgtjlejcCPMIRZ?=
 =?us-ascii?Q?kk0QSKEsye5EV4qqBrcL91CzemtzVG300RablWUqIUziqDA1qWTTOz49fTlQ?=
 =?us-ascii?Q?PeCkoQscQtSe0Xq8ZlkYnFgPgNfhYtwBev0IchQRVNEjYnb4M0ixE18h2bmV?=
 =?us-ascii?Q?1nnkUJoyNy7/+p9SPFHp8fDmx4kAkNsm3OhjQcii5GxsWI5yitiGdfg+Y9+V?=
 =?us-ascii?Q?emtuc2yG+khSqCj/QnXbEmUU7TCbasAcLv7s4ZfPoKcyan4r02BWuoD8ouUa?=
 =?us-ascii?Q?sn9A29/Q08BySG74het61DzGxdI/3Ghnk3NfNXMADweXI+lP0mnXLFjCMstU?=
 =?us-ascii?Q?kkv6CwIgWQWR7aXKXPLcgbHN/Q+9sNs=3D?=
X-Exchange-RoutingPolicyChecked: DE+m8wpoEQuDukCGCowMDiPIGXhUTuizLgClnenjcs12RmCwUQnkFHF/VTFYOaZ50M4fuv2u1GMmChsIEK7DJDoVKpZBwJA3KQzXN7hJuZHj8k4oMOQ4P1LDCh3CHi1v3PrzPyp19QbbSrB4tMQer1xqOwAnB94jp6LJm1fIIuYhKAbgFalJFo3fAEQx50u++XXhxy+yrpErnJvo5cECF3gq/TkGtHS48BaRVtIKYt563xDwFZB4RGqIJkVts4alRQupqzQDaHmB6w29Kr7zutdroYCe6KbUsYRQ/x3pbbyrtxdce1GWfVcLS4HnQVllHNXDuCR+6D9Qw47ZpG55gw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 11bfa5c9-7819-434a-095b-08decd589350
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 16:42:24.7125 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XZgMxbKXUFT4zAVNe2aIxvcO4IwOzGWp5D9xBOKIYy2+EmYccxZwPYLLrJBfP6hOcx4PJ89Ii3yQnFNhlyDP7TLKOj/YMx1S7oP7RX2ppXA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB9879
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

On Thu, Jun 18, 2026 at 09:54:21AM +0530, Varun Gupta wrote:
> Add a per-GT debugfs entry 'disable_mtp' that forces thread-group
> preemption granularity on Xe2+ RCS/CCS engines by writing CS_CHICKEN1
> via MI_LRI into the WA BB of each newly created LRC.
> 
> Signed-off-by: Varun Gupta <varun.gupta@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_debugfs.c | 32 ++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_types.h   |  8 ++++++++
>  drivers/gpu/drm/xe/xe_lrc.c        | 24 ++++++++++++++++++++++
>  3 files changed, 64 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index f45306308cd6..e8f7ba6fc3c1 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -334,6 +334,37 @@ static int force_reset_sync_show(struct seq_file *s, void *unused)
>  }
>  DEFINE_SHOW_STORE_ATTRIBUTE(force_reset_sync);
>  
> +static int disable_mtp_get(void *data, u64 *val)
> +{
> +	struct xe_gt *gt = data;
> +
> +	*val = gt->disable_mtp;
> +
> +	return 0;
> +}
> +
> +static int disable_mtp_set(void *data, u64 val)
> +{
> +	struct xe_gt *gt = data;
> +	struct xe_device *xe = gt_to_xe(gt);
> +
> +	if (GRAPHICS_VER(xe) < 20)
> +		return -EOPNOTSUPP;
> +
> +	if (!(gt->info.engine_mask & (XE_HW_ENGINE_RCS_MASK | XE_HW_ENGINE_CCS_MASK)))
> +		return -EOPNOTSUPP;

Would it be better to check for RCS/CCS engines in
xe_gt_debugfs_register() so that we don't even create the debugfs entry
on GTs that it shouldn't apply to?  That would help avoid confusing
users with extra unusable debugfs entries.

> +
> +	gt->disable_mtp = !!val;
> +	drm_dbg(&gt_to_xe(gt)->drm, "GT%u: disable_mtp=%u: new LRCs will %s MTP\n",
> +		gt->info.id, !!val, !!val ? "disable" : "enable");
> +
> +	return 0;
> +}
> +DEFINE_DEBUGFS_ATTRIBUTE(disable_mtp_fops,
> +			 disable_mtp_get,
> +			 disable_mtp_set,
> +			 "%llu\n");
> +
>  void xe_gt_debugfs_register(struct xe_gt *gt)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
> @@ -366,6 +397,7 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
>  	debugfs_create_file("stats", 0600, root, gt, &stats_fops);
>  	debugfs_create_file("force_reset", 0600, root, gt, &force_reset_fops);
>  	debugfs_create_file("force_reset_sync", 0600, root, gt, &force_reset_sync_fops);
> +	debugfs_create_file("disable_mtp", 0600, root, gt, &disable_mtp_fops);

In addition to the suggestion above about moving the engine check here,
we should also probably check the FUSE4[20] register to make sure that
MTP support isn't fused off entirely at the hardware level.  If it is,
that would be another reason not to register this file at all.

Or we can go with Gustavo's suggestion, and instead of making this a
"disable mtp" knob, we can make it a "choose gpgpu preemption
granularity" knob instead that can choose from mid-thread, thread-group,
or command preemption.  In that case, we'd still expose the debugfs file
if FUSE4[20] indicated that MTP was fused off, but we'd instead reject
attempts to select MTP as the preemption type.

>  
>  	drm_debugfs_create_files(vf_safe_debugfs_list,
>  				 ARRAY_SIZE(vf_safe_debugfs_list),
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index e5588c88800a..4f6d63b614f9 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -219,6 +219,14 @@ struct xe_gt {
>  	 */
>  	u32 ccs_mode;
>  
> +	/**
> +	 * @disable_mtp: Force thread-group preemption granularity by disabling
> +	 * Mid-Thread Preemption on newly created LRCs.
> +	 *
> +	 * Xe2+ RCS/CCS only, controlled via debugfs.
> +	 */
> +	bool disable_mtp;
> +
>  	/** @usm: unified shared memory state */
>  	struct {
>  		/**
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 3e7c995085d0..893456dad6a5 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -1262,6 +1262,29 @@ static ssize_t setup_invalidate_auxccs_wa(struct xe_lrc *lrc,
>  	return emit(gt, batch) - batch;
>  }
>  
> +static ssize_t setup_disable_mtp_wa(struct xe_lrc *lrc,
> +				    struct xe_hw_engine *hwe,
> +				    u32 *batch, size_t max_len)
> +{
> +	struct xe_gt *gt = lrc->gt;
> +	struct xe_device *xe = gt_to_xe(gt);
> +	u32 *cmd = batch;
> +
> +	if (!gt->disable_mtp || GRAPHICS_VER(xe) < 20 ||
> +	    (hwe->class != XE_ENGINE_CLASS_RENDER &&
> +	     hwe->class != XE_ENGINE_CLASS_COMPUTE))
> +		return 0;
> +
> +	if (xe_gt_WARN_ON(gt, max_len < 3))
> +		return -ENOSPC;
> +
> +	*cmd++ = MI_LOAD_REGISTER_IMM | MI_LRI_LRM_CS_MMIO | MI_LRI_NUM_REGS(1);
> +	*cmd++ = CS_CHICKEN1(0).addr;
> +	*cmd++ = REG_MASKED_FIELD(PREEMPT_GPGPU_LEVEL_MASK, PREEMPT_GPGPU_THREAD_GROUP_LEVEL);
> +
> +	return cmd - batch;
> +}
> +
>  struct bo_setup {
>  	ssize_t (*setup)(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>  			 u32 *batch, size_t max_size);
> @@ -1342,6 +1365,7 @@ int xe_lrc_setup_wa_bb_with_scratch(struct xe_lrc *lrc, struct xe_hw_engine *hwe
>  		{ .setup = setup_timestamp_wa },
>  		{ .setup = setup_invalidate_state_cache_wa },
>  		{ .setup = setup_utilization_wa },
> +		{ .setup = setup_disable_mtp_wa },

Putting the programming in here is going to run a special batchbuffer to
reprogram the register every time there's a context switch, which I
think is overkill in this case.  The CS_CHICKEN1 register is already
saved/restored naturally on context switches, so as long as we create
the context with the right setting at the beginning, that setting will
persist for the context automatically after that point.

So I think it would be better if the debugfs interface did one of these
two options:

 * Use xe_lrc_write_ctx_reg() on gt->default_lrc[class] to update the
   golden LRC that serves as the starting point for all newly-created
   contexts.  When new LRCs are created, they make a copy of
   gt->default_lrc[class] and will have whatever settings are stored in
   the golden LRC.

 * Leave the golden LRC unchanged, but if debugfs has adjusted the
   preemption settings, call xe_lrc_write_ctx_reg() in xe_lrc_ctx_init()
   to adjust the value for newly-created LRCs after they're copied from
   the golden context.

That will basically make the debugfs knob something that controls the
behavior of all LRCs created after this point, making it possible to
mix-and-match where different LRCs have different preemption granularity
settings.


Matt

>  		{ .setup = setup_configfs_post_ctx_restore_bb },
>  	};
>  	struct bo_setup_state state = {
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
