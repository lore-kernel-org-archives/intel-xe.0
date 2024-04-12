Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA910C4345F
	for <intel-xe@archiver.kernel.org>; Fri, 12 Apr 2024 13:43:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FFE110F656;
	Fri, 12 Apr 2024 13:43:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CG4kx/1O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF41C10F656
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Apr 2024 13:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712929377; x=1744465377;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xTReRQR8wtYDQn3D7XFenbOTTUa9qlxdp79vHSAoEks=;
 b=CG4kx/1O6mQ+7z1O3uir3zBzBujiQjXUiS6XLm0Y1e/UGC0ePXlUQ0M2
 o4NCvvOs2n+9MhLmo8nMc2/eoCGact91bNGf25YnV2dZF2sGMmX3RaC2N
 8LoAsHvFNG+DALaOStWpdBotv14yULzYAeJhV68XHXQf4riyEuOz0hTgr
 hvC8w7jXtQ1xzntWWcwkfxlJJ83HvxyFUqOFp2ORLDRQcyE03HMDmRzAQ
 /hDjzYPBgm7uFrDW+mtFDrXsvwzYMT1CJPv5yTuH8Uqx29Brsvk+LcmgJ
 mwpkM4m6pNFPeQPG6LTQ9TqD3934AGmHBXQFO1a5ry5y1IgstufXAY96j A==;
X-CSE-ConnectionGUID: U7g/9o+JRBGvluFo373Jwg==
X-CSE-MsgGUID: 11gUcugYRleUhsSNz1T8Ew==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="19778447"
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; d="scan'208";a="19778447"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 06:42:53 -0700
X-CSE-ConnectionGUID: RaPlORdRQ3yQsPMOoGPFgw==
X-CSE-MsgGUID: 4T/tVApIRViWx3I+rLSDIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; d="scan'208";a="52200025"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Apr 2024 06:42:53 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Apr 2024 06:42:52 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 12 Apr 2024 06:42:52 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 12 Apr 2024 06:42:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Px7jXJUIprECfS9vw007y53JPpvQmCNlMkxvUmnFmvRnIoQ438s+Jyv/HyrQUm9tB7tx/aAY/lsYZeN91mVEq6PsPTK9PNkciDZPw4bL7XdAEY+TQ3Wtz6i7lAewbUqXLXwK9BFHgVG1tCWRBsK4FdrlDMKCDUBKbGaEkw5WFVfRaEzDTMn9rmnkwQ1oBFTBZPU0Aoik10BVkqCFlKI5c5JMkEjoIDrGz3q6cy0isCPO7ndBgVyIYrQUVXccH8A5u2s99XBY4YlGvD5pht2FFVS1FI5VFxdqhJ3OkoLOdUl0bxpdROaWQp65A33gQMXtqvNyniZqPnT5Z9CHrhdZsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DRdQS+7shO9A+D/hQQFZWpJ9NX9nDcXoiC5xP5NVs8A=;
 b=B5WNURpt/LazOk+kcNDsSxcy6zbElvSpelS03K8swPIPaLrCVHFIUqIbOKtVXzeAzVmWqx4pIAhSLuscw+wJGlev8PNOEbQLrX2P9O1L/1okYP8XzsK4KKQ/lUy4WliqeumXT/jTbCdEB7l/mWST6rS41+Q6wA0nFNuqo2vV4k2Mx5yzgFSWqmkZEhIgEBGHH9vDp4vc4/b5IK2OztqxB8tTRSrHhW8cTUa8qZbJSPZFUTaPY7yvqn3MVgQtEevhZ3wQag1SHK0Tm9BJNiZd9A+Lg6Qgh/eYmAPh5XKx4tprYmjrrviT3XBEPI0boaHE2SrjSLpQVDVKgfiYU9pcmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY8PR11MB6890.namprd11.prod.outlook.com (2603:10b6:930:5d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Fri, 12 Apr
 2024 13:42:50 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7452.019; Fri, 12 Apr 2024
 13:42:50 +0000
Date: Fri, 12 Apr 2024 08:42:48 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v3 7/7] drm/xe/pm: Capture errors and handle them
Message-ID: <7ioxhkpm4jidj5m4hcc5jsatfk333d4sgso7o5bl2pqmq5xxyc@36dmyunxbviy>
References: <20240412080245.1044902-1-himal.prasad.ghimiray@intel.com>
 <20240412080245.1044902-8-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240412080245.1044902-8-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: SJ2PR07CA0001.namprd07.prod.outlook.com
 (2603:10b6:a03:505::11) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY8PR11MB6890:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a26528c-8127-4214-b25f-08dc5af67250
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wVgTJT4R+LohwsCsh/P8+q186Nt7Kw4s1Q5tWcWdKed09IhUWbhlKW+JpXweVSN6kkvNhlb7pDyxXrJS1nMCBm+GkuBD5SOGR3qhD084BRNlZjm8mUSHGvUwR+sHXNmHilHgsq4R/5LIBecdqUtsZiPMuXt8kjzl34lmDSl0pj7AT2JaRU+8dcpq5e78wCqew9egWDUDjKcU8/ILKzFU/MPTrAHDefbpduGIkjSzMHY4qcHAyczAAaZXzA0WxV44/XF7X1TCq6C5gmc+aj/d0gDAgPu5KKBtp2RyIDSYGTOgh/kDLk80ZZ3S8hp2zqt3ZvugrJ9zXAsfOGxxalyeQXRCbELjXPudjwNgLw+ycRhRCWxF+h2lxwL/HNiWe5JYIBG+yQ/PWHj2wYJTNyqvJDz1MO2ME949xf6feUnwZcF86XSuysbafkE8D+XtD3vBwB+ac9lsE5lVvpzAAs0fyVnGi+2o3Cs8DwYA+GVDqYhYlZ/nHxIU06TrkuO6MWpf8wOAr6jWucnjbbzIiz4AO0Hw22uP9P07lHYszutDEaX61MZiXDrg82i1QAUlEdsn5hWBvzYMyeCj2xOCiIhzoFmBDdCYQ22G/OUk/CeupxjIpEM/1iY7AMYQHMKqwtL4LQjzFRjrz2es02N3f9om5ljpTfoElBw7Q6cSHAvrA7Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4yu8HQSuZcLrDBmi4TeK/s7ttW/lgQoN/l9FkeMGrbSNT3pbR94kXmrtoEyf?=
 =?us-ascii?Q?mewfU7Uor4eFbeV7QkFRpwGdQ6xagX2Ft6X8Ks74MEN1BMbvlvglufVDus89?=
 =?us-ascii?Q?NcisUC3RrrYKXpWKj+ApiB7LhP9yHueiqXAct8co43Th+UdI89xujWXJFO6i?=
 =?us-ascii?Q?XMMVefPGawNEvm4vx1gFNnlWvmv8v0799CdG0YE0pRBjKbFLIMjzwzmRZ5og?=
 =?us-ascii?Q?d245GSDCFxMwZdhRjpMjxOuLJw0BFxL0lw+XEO7jHZMW5frL5wkwQeKRrVWk?=
 =?us-ascii?Q?GGy7obiJ7b+WeIktNv8WmCoV//hHYtJW0H8ISi20Wb/qMqw0E2fW3fk0aBWl?=
 =?us-ascii?Q?CYPxC3YjiYEgO8VhUGZr8qA52g5MCLxms1FOFMgDx0DiJ65xqhdnwq8HYFPI?=
 =?us-ascii?Q?3T/qmQgmMAzzWvQ2vgebR6EN9s6jxO5mn0Aozgcb4rpJWrxIFQcBX6NPTqb9?=
 =?us-ascii?Q?3TjbYe2cQ0yIFLTsij6cjtsIUH4vl0GecJd67aPKVkvleU2EujXtEXjajyaR?=
 =?us-ascii?Q?cXG9hC1G7gNYQcRjg8PmfJ1s/LHjDJt/J467XgSkHI3veiKFqULWccZ69MP/?=
 =?us-ascii?Q?XXV2yrxann7pvq4nVpku4KeaKaLRhybwioMwHJE0vlmMuue3AO5lwgYlwgyO?=
 =?us-ascii?Q?BYYz6/Hp4J8ogSWWu+Q2w0ESiPhqgAxZkRcWHOk514rZ0672Bnmmux8ex5rQ?=
 =?us-ascii?Q?DlibtLbw3WsZRbRXZ8G5X7pyYyXr3jpGCm3TD/4lt1PzaFyMhJZsZ3antE/E?=
 =?us-ascii?Q?sNCnBXB7omnrvFdixnEm0ss+HUdzrf4ftcL00L8B8jRg6tWhVVKwPYetY99V?=
 =?us-ascii?Q?slKzbod1j7jI+SkeeBczJq+AdE1xz0OfvqnZQHwcY6MCN8LOGfV2QHRbSwQN?=
 =?us-ascii?Q?72CjbGmKLxsrV1cu9dhmx4oWByGICFQhnfKuex7QQKShprrdQMqY5rRYAV5d?=
 =?us-ascii?Q?7qaJ6zhmFqbJPMzoVtriJDQki1rLwtXeXRbBEREmWp2z3WiGWT7Aacu8pG/K?=
 =?us-ascii?Q?L8cYw9xrHcO4fvCjLEPFBK+qwaIwjPGhvaC2kWp+CZqyRb+GlFOLcZOUI8++?=
 =?us-ascii?Q?HuwSz/FzUAit+ThJpUrLICoUmt+GlgduPRMDSyTQGYwJT2vQ3cAbnTZFNnm/?=
 =?us-ascii?Q?/y3DfbRru0d8itK+tRmw6UvBQ3DsOoDRwVrfHLnykiVouDfoCr4RedkTSi4p?=
 =?us-ascii?Q?lhvxRD53nyfFdFDKX79grIAYdOJS+476tDuQAjpF0ikRzo98Am6JMK+5dVUL?=
 =?us-ascii?Q?BYVf/OT1sxpYFPGCXk30tJhLr0j3estxg2nfyS06kvQWrNBAhdHjVnc/cagJ?=
 =?us-ascii?Q?ZAsEYdO/ZtXmcEpH6ldN17cbGPacu+jVeFUiQKcoFdSIU3ZTyT9C1czArfds?=
 =?us-ascii?Q?qs7qk6zUj95+CbqVS7atzus0XYMDBmG916oDxpV9PRx7pwOoDzu2PYMthp5z?=
 =?us-ascii?Q?QEB7p5vJFNjG90NRJIHRhmH54pSqMpBm/E55ah4gAaI8I2df75dZsSV78zpn?=
 =?us-ascii?Q?ChCeoDOqun0wTaWQ6dWp7i0rfD0na9wO+qSyzOmrAOILozP85Je3j6783CZd?=
 =?us-ascii?Q?Skvq51475nCU9U2FfmFBocfQSl/OGpbM2ej6BaWn5gX1uzAafxN50LoixDxT?=
 =?us-ascii?Q?Ig=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a26528c-8127-4214-b25f-08dc5af67250
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2024 13:42:50.7025 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +0S94xy4XEiujKqN/ItOAmw8gXbF9/mQvaZR7ckgXB70c7Eo0yFdrCFiDSLquOzY/T/ZAzSFNnQxDmtB67k+x/y7y3CPT1ew6rWr3bOaEII=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6890
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

On Fri, Apr 12, 2024 at 01:32:45PM +0530, Himal Prasad Ghimiray wrote:
>xe_pm_init may encounter failures for various reasons, such as a failure
>in initializing drmm_mutex, or when dealing with a d3cold-capable device
>for vram_threshold sysfs creation and setting default threshold.
>Presently, all these potential failures are disregarded.
>
>Move d3cold.lock initialization to xe_pm_init_early and cause driver
>abort if mutex initialization has failed.
>
>Warn about failure to create and setting default threshold.
>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>---
> drivers/gpu/drm/xe/xe_device_sysfs.c | 12 ++++------
> drivers/gpu/drm/xe/xe_device_sysfs.h |  2 +-
> drivers/gpu/drm/xe/xe_pm.c           | 34 +++++++++++++++++++++++-----
> drivers/gpu/drm/xe/xe_pm.h           |  2 +-
> 4 files changed, 34 insertions(+), 16 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
>index e47c8ad1bb17..21677b8cd977 100644
>--- a/drivers/gpu/drm/xe/xe_device_sysfs.c
>+++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
>@@ -76,18 +76,14 @@ static void xe_device_sysfs_fini(struct drm_device *drm, void *arg)
> 	sysfs_remove_file(&xe->drm.dev->kobj, &dev_attr_vram_d3cold_threshold.attr);
> }
>
>-void xe_device_sysfs_init(struct xe_device *xe)
>+int xe_device_sysfs_init(struct xe_device *xe)
> {
> 	struct device *dev = xe->drm.dev;
> 	int ret;
>
> 	ret = sysfs_create_file(&dev->kobj, &dev_attr_vram_d3cold_threshold.attr);
>-	if (ret) {
>-		drm_warn(&xe->drm, "Failed to create sysfs file\n");
>-		return;
>-	}
>-
>-	ret = drmm_add_action_or_reset(&xe->drm, xe_device_sysfs_fini, xe);
> 	if (ret)
>-		drm_warn(&xe->drm, "Failed to add sysfs fini drm action\n");
>+		return ret;
>+
>+	return drmm_add_action_or_reset(&xe->drm, xe_device_sysfs_fini, xe);
> }
>diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.h b/drivers/gpu/drm/xe/xe_device_sysfs.h
>index 38b240684bee..f9e83d8bd2c7 100644
>--- a/drivers/gpu/drm/xe/xe_device_sysfs.h
>+++ b/drivers/gpu/drm/xe/xe_device_sysfs.h
>@@ -8,6 +8,6 @@
>
> struct xe_device;
>
>-void xe_device_sysfs_init(struct xe_device *xe);
>+int xe_device_sysfs_init(struct xe_device *xe);
>
> #endif
>diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>index f1fc83845c01..f4d9441720b4 100644
>--- a/drivers/gpu/drm/xe/xe_pm.c
>+++ b/drivers/gpu/drm/xe/xe_pm.c
>@@ -208,10 +208,25 @@ static void xe_pm_runtime_init(struct xe_device *xe)
> 	pm_runtime_put(dev);
> }
>
>-void xe_pm_init_early(struct xe_device *xe)
>+int xe_pm_init_early(struct xe_device *xe)
> {
>+	int err;
>+
> 	INIT_LIST_HEAD(&xe->mem_access.vram_userfault.list);
>-	drmm_mutex_init(&xe->drm, &xe->mem_access.vram_userfault.lock);
>+
>+	err = drmm_mutex_init(&xe->drm, &xe->mem_access.vram_userfault.lock);
>+	if (err)
>+		return err;
>+
>+	/* Currently d3cold.lock will be used only with GuC */

it's cheaper to just initialize it regardless so this can be simpler

int xe_pm_init_early(struct xe_device *xe)
{
	int err;

	INIT_LIST_HEAD(&xe->mem_access.vram_userfault.list);

	if ((err = drmm_mutex_init(&xe->drm, &xe->mem_access.vram_userfault.lock) ||
	    (err = drmm_mutex_init(&xe->drm, &xe->d3cold.lock)))
		return err;

	return 0;
}

or keep the err assignment separate, doesn't matter much. But
when we mix success and failure for a return-early style it makes
it harder to read.

>
> /**
>@@ -219,20 +234,27 @@ void xe_pm_init_early(struct xe_device *xe)
>  * @xe: xe device instance
>  *
>  * This component is responsible for System and Device sleep states.
>+ *

wrong line

>  */
> void xe_pm_init(struct xe_device *xe)
> {
>+	int err;
>+
> 	/* For now suspend/resume is only allowed with GuC */
> 	if (!xe_device_uc_enabled(xe))
> 		return;
>
>-	drmm_mutex_init(&xe->drm, &xe->d3cold.lock);
>-
> 	xe->d3cold.capable = xe_pm_pci_d3cold_capable(xe);
>
> 	if (xe->d3cold.capable) {
>-		xe_device_sysfs_init(xe);
>-		xe_pm_set_vram_threshold(xe, DEFAULT_VRAM_THRESHOLD);
>+		err = xe_device_sysfs_init(xe);

apparently not because of this patch, but why do we call a function
named xe_device_sysfs_init() iff xe->d3cold.capable? And from within
xe_pm. That seems totally misplaced. +Rodrigo

>+		if (err)
>+			drm_warn(&xe->drm,
>+				 "Sysfs create for user to set vram threshold failed\n");

just warning?

Lucas De Marchi

>+
>+		err = xe_pm_set_vram_threshold(xe, DEFAULT_VRAM_THRESHOLD);
>+		if (err)
>+			drm_warn(&xe->drm, "Setting default vram threshold failed\n");
> 	}
>
> 	xe_pm_runtime_init(xe);
>diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
>index 0cb38ca244fe..1e6ec58878d2 100644
>--- a/drivers/gpu/drm/xe/xe_pm.h
>+++ b/drivers/gpu/drm/xe/xe_pm.h
>@@ -20,7 +20,7 @@ struct xe_device;
> int xe_pm_suspend(struct xe_device *xe);
> int xe_pm_resume(struct xe_device *xe);
>
>-void xe_pm_init_early(struct xe_device *xe);
>+int xe_pm_init_early(struct xe_device *xe);
> void xe_pm_init(struct xe_device *xe);
> void xe_pm_runtime_fini(struct xe_device *xe);
> bool xe_pm_runtime_suspended(struct xe_device *xe);
>-- 
>2.25.1
>
