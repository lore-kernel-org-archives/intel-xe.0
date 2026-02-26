Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BB56FD9E14
	for <intel-xe@archiver.kernel.org>; Thu, 26 Feb 2026 21:49:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25DF710E9E1;
	Thu, 26 Feb 2026 21:49:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EsjeOvUE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F17F410E9EA
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Feb 2026 21:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772142554; x=1803678554;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xpp3p4ZW2bOZRIlO0VysStkkPEfW0gEFZ1nCwS7/1kc=;
 b=EsjeOvUEHBPHwqmeOnbFNATlv0rMEXG1KYsi5BWNsQB3aWGhPhqGNvEP
 aKmuhNDzEJStgqKZoL9ySa9e93SpcwjiPWU+yT3s+nGD5QpunR4lSl7Ur
 4yZpXd8FCzr2+ksExuOF/uZHH+4YVEeHA59/XR/KP84/agbPYPchClZOm
 qqNIP61ET2wvXOOiY31shfFHNRb2Un5tWmP0G98XZrI9m6Gl33Fe+9Ykz
 taxcOk1xlALCzDmD9vDSu688g/MBlj++8e/JevJmAOT9Z6OD+jfk6amMf
 Xv3yWPWbINd7WVjCADc79FG9YsYLjlFyH4VXcxg/+Apy5s9m228yZ10rx w==;
X-CSE-ConnectionGUID: Kr4hN3LHTS2EumAkz4RDqg==
X-CSE-MsgGUID: 34giO+DRR/28Xg0xJ5mn0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="73189381"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="73189381"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 13:49:12 -0800
X-CSE-ConnectionGUID: ch4KRKubR6mlAsU+oubD1w==
X-CSE-MsgGUID: liYg4zPkQvm5wP1tgbnEiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="239689971"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 13:49:12 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 13:49:12 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 26 Feb 2026 13:49:12 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.18) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 13:49:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gmnLdl4TAa8pr3aoHtRK3tmvfk+iA78fKqRIS28daIIWxVqTvajdzbrg+WPUoUyJUc7Kd5cFVA+Ew4bB56Ll45IB4muhaEjJipBS1gTB7LEtXxBvKFGz+YicyzWHkUhvqtBpGHI7oNpPnBbcTRt38KBcuJP1zq82uMDIo8t92fa7BHqydmebX3REl3WSfpUpDiL3AGKVG0LPIsc/JHRlDLuzM7ZrWqWuF4Ue8I4Z5vEu8wxRI24iURoE/1M+8NN52fjx5fp+NF0LuqLdtQ3NjsSRC5RpUftm45hx9blnkWN0Lv1Tv7nyOmCzbshMD03YEtGXdLg4R7GUEnAAFrqRww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CybFJUwJx1SBSpeieeFtqP1jee2q2PxpDxeDtz1v6Os=;
 b=Lld0cxYRwqYUXY7V1/3c654ocV0/+nwDGyPwWIjEHgepgUW/xqcYV/uh+VFmGMehc6/fkLjaJ8JwYRxYHzx5JB7piXtRaE+86L+wHAzl/6OW0NWcXtjGTSwzMaHrarahOCaGU9k1sj6uRgzceuzBP0o7/MqIDIwAp5Pn8vafzDp6BJnIPzLqd/pBDOc+SuDk+X+fGmHr+Owm9x1jDVISD3qE7UzTNmXJA8TAzk95Ipn4TU0z3xUYjCyjIQrFhrQbu2okerWhh6HyxmDkKhmJC2QERrdjbt1KBR3a3XQRa6e/wt5WwiDqCLtLuEIbdL1Nmk5y26rcG43/pnPWvmIWUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SN7PR11MB6797.namprd11.prod.outlook.com (2603:10b6:806:263::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.11; Thu, 26 Feb
 2026 21:49:05 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9654.007; Thu, 26 Feb 2026
 21:49:05 +0000
Date: Thu, 26 Feb 2026 13:49:02 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/xe3p_xpc: Drop stale MCR steering TODO comment
Message-ID: <20260226214902.GW4694@mdroper-desk1.amr.corp.intel.com>
References: <20260225203719.3310570-2-matthew.d.roper@intel.com>
 <BN9PR11MB54506ACF0AC02000AE1EF092EA75A@BN9PR11MB5450.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <BN9PR11MB54506ACF0AC02000AE1EF092EA75A@BN9PR11MB5450.namprd11.prod.outlook.com>
X-ClientProxiedBy: BYAPR06CA0012.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::25) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SN7PR11MB6797:EE_
X-MS-Office365-Filtering-Correlation-Id: 57794368-7698-4ff1-e507-08de7580dc77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: V+0Zxjp65J3DwsNPUZS8UdKMMsM4WpSD+d0VehyDXqsv7u46YNbRR4jyj39ojbmUy/hCY+y/sMMBazDDhxcy7XWoQXv9MhEfSF2oyjA5S9IaOMJvaq7OJb40DMGAA1JqSDMsQ9sCsfHUQqPWP9jTtAEaoP13BfyHGSBnmZKZEJEoHa2/kAXFy2UaqPEKjWwNFHy6xw8WB+f1XwuNsvzACcDluo32HDCLEQ0NxWqKlXMkL8NCPnW35g+TA7kijyKg3BlGYDDdFpR3hMcJybCCrhWviuE+J8tGkpjIV1occdLDBsKSemcdG/maCiz7JtikenopZv7FKsx0bUTnjn5lVBQ9li6fv7YkMGEhnd/bx39ViyYZlNkvd0/3/Zgx8LY+zGsasqd9unOUwE4zRIhpkOYDbNpZJYU79eliyQGhbtbGgGNrV5mJ7yYY8oUh9VTLrEa4lpekTcjPJzsahRGDTVnqmVVmwJ4u7PY8PawiHh6hGqeiDs3Cbur1vQGTuqcek3c26F+jgiKrm9DGrc3ZwmVMyM/Mz3M0cDjLo8B6R5A4CkYpGdfd30EDUay/2+RWItRYk08EwWn4p6D3ot+akBqjbO8X6nbhKZxkHZhPtivyjdNvju/BFlmQy+9z7tZLoOhsVn11eZI/YzLWNuFycoNRSY6o+NgHdmUMNZM7OBcsB+PihOjvBna4GVYPzQ/SkGk8W8l4BQpdw45EMr/0x0sClUkotcweScbr4oU8NMI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BbCOiFRxvuWEmzfRClJB6pQ8kowwFAmh4hm/uwJkRF0wvvQPbGdvVijEZ5Tg?=
 =?us-ascii?Q?hpc3PmLwAXwFwQ1EU6xGA9kENaMDHXD1tpkBnf3pkA5IayUOUgqKQMWWYTyI?=
 =?us-ascii?Q?Sd7QyWPxc+sB55jfpGyuLfbm37XwQa2y3kn3Xn/8qsYKrkfVBamvVB0pmOox?=
 =?us-ascii?Q?rX80QS53uzd2+aDg2zfXoCAxcV9CUOwIjJ+26j4ooBNKd/MvDVeYHZVm7sX8?=
 =?us-ascii?Q?8SGM9J8ZI64HEuYuKOLXkPILw2b2jt+OQVHWGYf2cN4rD/1OMcrFG7hNXaXe?=
 =?us-ascii?Q?HrW3/0qSR07Udd+TN+nzFm0fzr4rNFnPCIVu5yv7A5uMpjw9vq8tynyXCkfl?=
 =?us-ascii?Q?1U7liyRIvmlf6Wtiy3wpAtr1aKF5XRtxjPYYX38lYew4ZA6Mm60OpM/0N5dS?=
 =?us-ascii?Q?u5QSQRKNNU6/+bsCxZ2lPYm5aEMCHQPxkqsKnrTg5++ord7aNoTkcBUmXV5p?=
 =?us-ascii?Q?Th8EpeR5Y12fZY5rNjpvveVQ+e3c6L1LIxW4YVUDjBO44oiHVlmTqi+0gFAB?=
 =?us-ascii?Q?XNPlXzRAlKth2xemw3Cl8KtmK5JMpyclEFGhQlSEvvLOqstPdvjHg5QhQorM?=
 =?us-ascii?Q?YAHZ/h7cxxfMf9u7Qf933BdmO8HpxVKsqHWGf0hvj9tH8hX8XI86IGj1yc/J?=
 =?us-ascii?Q?jsSRa43Rf4bOQneoyOmcu4CqZRo75N0bf5Cjf7OBRrqCYQ0BSwzsiTKhyZA7?=
 =?us-ascii?Q?wldPCa38nZMFsTglHHaiYzWlIPv13Zb6dU216VP0NZVSdK4Lrv0ucwWGr8gH?=
 =?us-ascii?Q?gGPCdvPmKUGuLwO8D6SZZp4ZSLWI9LSypkDKMzMTMdwUiq3ZgjmUZUYpEwfh?=
 =?us-ascii?Q?KuEQ0GP5mq625CHLobewcDcROkzpsPOiKkYkNTxWgbi6Wu2MvjoVHzFeSW3t?=
 =?us-ascii?Q?xXmzVUXMib3zkPH5SHOU1ODz4YlFQSC/UP5cSMgxIA8sP3J/N80q5MjOKRjI?=
 =?us-ascii?Q?mLPbroT+A7Zy/RnVcLjgYvWxcr4Hs5jI7AwM4xdzzQrlPxB7qr0sWhdPEAgK?=
 =?us-ascii?Q?NYCL85lQTJ1B06TJ0SZLLshSKu1brMuC/KI40W0EIszh7KfXbKKrfPP2Hv7C?=
 =?us-ascii?Q?wSnHYKvfgKX2I5m7gAHeq9KNipeA21r+Rq8tyNdlRtfJpVu4Gj9NtqaP4cl3?=
 =?us-ascii?Q?Iq1msXvE3XJJvXD6oCgh1Mi5cIyn1ZkikVLBFsD5lGTqg0Z8aPLO0p0P3Bm+?=
 =?us-ascii?Q?shmeCZPqiZivP8fyT5L+NStbWvWoTbM+Zx0wd7yTBqsZ/AtuDji64llrNxXq?=
 =?us-ascii?Q?s1EmhfkP1AuhtbpqAe9rN/t9mvT0PjeRjw/Qwoie3/jtuNS578mutfPYxby4?=
 =?us-ascii?Q?Ti2Yhtk0OcqOybltXiB68xXqF/cnrqEsQp4xSwW5qhFEAPoPAWbej55biHp+?=
 =?us-ascii?Q?gUSsKrn5ZR7ZIWeN9SaE2nLcMBi0yjEo32+v/CO5xuagU1SBBVdSVXMfiHRy?=
 =?us-ascii?Q?nnCyF01mPwkyWX14AdIS5PvTTfi/8xYnHxEyYzFE9/FqCkF2LW6/fCvnRDYR?=
 =?us-ascii?Q?LZmCM/mccnrzeBghAHUr1waywNT23gINudsBvir/NOG1zZX0lICgvS38rFkT?=
 =?us-ascii?Q?soqvY3vhRiKNQz01B8+PThelExrgArNELbZx5MDDvrhLjgxKB2f7J97qrzck?=
 =?us-ascii?Q?cqKSDCFQXgrWoDOPBIQ3J/v1mVWQsgCZ5/S44l76EoH2SiHnRJ5rjfOKwguw?=
 =?us-ascii?Q?UiH1zn/PaK2VDLSmrdMXZXw2ju5EMkojGRMeFFUoGywzIn/9FWG9YMwF8AcW?=
 =?us-ascii?Q?KBGi6Bgs4Ldwi2Ktkbrk9PJHSQG7AZU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 57794368-7698-4ff1-e507-08de7580dc77
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 21:49:05.0313 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mEO6eEGQ0AS7FlU2+AMFY92zXqxwlIW6oRNunffeImBC5zNgmna4lA/eViiA8ufMC9yk/0SaMX/e3bcLxDLJqw0+V/rYXuUUjWy0/EYqPaM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6797
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

On Wed, Feb 25, 2026 at 02:19:08PM -0800, Lin, Shuicheng wrote:
> On Wed, Feb 25, 2026 12:37 PM Matt Roper wrote:
> > Proper steering+termination for Xe3p_XPC NODE and BANK multicast ranges
> > was added in commit 6d5511e56b2d ("drm/xe/xe3p_xpc: Add MCR steering
> > for NODE and L3BANK ranges") but we forgot to remove the corresponding
> > TODO comment at the top of the block.  Drop it now to avoid confusion.
> > 
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> 
> LGTM.
> Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>
> 

Applied to drm-xe-next.  Thanks for the review.


Matt

> > ---
> >  drivers/gpu/drm/xe/xe_gt_mcr.c | 6 ------
> >  1 file changed, 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c
> > b/drivers/gpu/drm/xe/xe_gt_mcr.c index 8989d02ea84d..7c6f039c880d
> > 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
> > @@ -532,12 +532,6 @@ void xe_gt_mcr_init_early(struct xe_gt *gt)
> >  		}
> >  	} else {
> >  		if (GRAPHICS_VERx100(xe) == 3511) {
> > -			/*
> > -			 * TODO: there are some ranges in bspec with missing
> > -			 * termination: [0x00B000, 0x00B0FF] and
> > -			 * [0x00D880, 0x00D8FF] (NODE); [0x00B100,
> > 0x00B3FF]
> > -			 * (L3BANK). Update them here once bspec is
> > updated.
> > -			 */
> >  			gt->steering[DSS].ranges =
> > xe3p_xpc_xecore_steering_table;
> >  			gt->steering[GAM1].ranges =
> > xe3p_xpc_gam_grp1_steering_table;
> >  			gt->steering[INSTANCE0].ranges =
> > xe3p_xpc_instance0_steering_table;
> > --
> > 2.53.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
