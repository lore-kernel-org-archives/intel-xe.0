Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F38D7C7EE31
	for <intel-xe@archiver.kernel.org>; Wed, 25 Jun 2025 19:14:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C73A10E7D8;
	Wed, 25 Jun 2025 19:14:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YovwhHR8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB7A410E7D8
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Jun 2025 19:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750878861; x=1782414861;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=hp2Qn8a1zOB8MiNqmZSvQFDZLwYOmFd0R7gqUSQpxxc=;
 b=YovwhHR8O/ViNjk/44l0PK8MkaLGXMKdOa7BVJr/rUMVlTLbGUI74yOr
 WBvpb6BdB6eMGHQey1XkMyjNtUGW7hUwiqsjZm2Nt+21T5J2tcafQ1AAT
 Fra1xJxW4VJOxSSpI3UjM4efsPQC4NkB2EvWIril3Paxt70ANLJBND3Ds
 slICLpBnSxZtRa+ZoFPCkYLhjAnzVozXqM2e/qDcEOkGaU4MOD2V9soCD
 ODJv4f3SjajQXsA4S6uiKcX7eW4ly8rzH+c626Jhm+kF+NTysPT7LFMr9
 tTnd8v4lDXlas2y0mQq0iTLdkOUmxfgGcuSYqRF991+9SM4hQkllFyWC+ A==;
X-CSE-ConnectionGUID: 6MoPg81pSIeukMg0OWuUrA==
X-CSE-MsgGUID: qB7A+Do5QcyhD8NMI91rTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="63762822"
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="63762822"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 12:14:21 -0700
X-CSE-ConnectionGUID: VegPMz09TXWK9ZI731Xbsg==
X-CSE-MsgGUID: YEComI+aS8uTff05ZFeJgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="152604368"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 12:14:21 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 12:14:20 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 25 Jun 2025 12:14:20 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.64)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 12:14:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JopYlqA3XQhdhMiSNxxFQidu6V1tG+hhMQkL6xxGfh1bjc0W6qi9cBth9ryP2NtL+jPNwA7sg1v1kTDGHJN5V881kAq04H8dtwmA+0RUO7Iowt+2Ziav2PKxRnzwmM1xDKgCe+goovqBqsgdcJhz6jeBbUKSsPsZ0cp+p1rzFxA+00IC29qml8p6XjJ64Zh7XyjRNPybXKrhBNK7BVIV9SV3QEmZt/rMcvgJ6al4RrGBOZVnGhlURGQiUkrIZsKcCg4UhMR6ssQCIoPK5QM1AvBHw8S3Qq3nzU4oV3SI4a6vkeRaSkZGEGx/rK4C/0KoyoLdFf0UOyvs0fI2YDDDQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YHqbFvqhk4+08G8c1iJJ7Kgpvb6AdeDrvVYkmcrve+k=;
 b=eqBr8idhQ6uGiu2uJZy7vKdoKSg7t5/bN4dlLw0oRGudyj9QjehOaUdPWDwDXXT/7kmBkk56O2Rg0YLGTkNL7w92Iz6uD+gOCJNBdkfzjeiH4iGwUfRcLgU2h90BsjoIU1R3FhFQ0e1dGnswZU89ocGpHTeqTNGqskeu9fz7VpoPmWiS377HPjCDoikpRHGLb5rnmASFgxaJnWuCrNRxjEKT/C26IAKZOJk1yV5KbeihwNElITtEtXjA7F2HxPPep3lGmlkatPx5sUv4oNPyITOQc18RpbNaDc1AJ2sN/rWzkeD7QwmYI+1+31oYaMLaO6g3RxxOtuCXNCHusJWtrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW3PR11MB4602.namprd11.prod.outlook.com (2603:10b6:303:52::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Wed, 25 Jun
 2025 19:14:18 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8857.022; Wed, 25 Jun 2025
 19:14:18 +0000
Date: Wed, 25 Jun 2025 14:14:15 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 07/11] drm/xe: Split init of xe_gt_init_hwconfig to
 xe_gt_init and *_early
Message-ID: <hya4m7jzgeopoy4g744k4us4qbdutwosdn755lc6lmjk7nx3om@qj4hn2xbaixy>
References: <20250619104858.418440-13-dev@lankhorst.se>
 <20250619104858.418440-20-dev@lankhorst.se>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250619104858.418440-20-dev@lankhorst.se>
X-ClientProxiedBy: SJ0PR03CA0210.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::35) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW3PR11MB4602:EE_
X-MS-Office365-Filtering-Correlation-Id: 112d5fad-1bcc-4d6e-8f3c-08ddb41c7b82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WHLs4Djm+sBoy4Zz/xfHYpoheiQ218FUMnRexJPxKCUsK0SonVhtWZlQQhoz?=
 =?us-ascii?Q?CWOKxWq8sNWsjLgx7sgevqfO/eXMqUDWUquNU8HiZjOoW0T0AYc8pk9hVovI?=
 =?us-ascii?Q?uX4IlemVVcSPzbjXKcHWMcdC0/SOcUcYh7CUVrrJs9ZUkh+6uDxQ6+QzQEcd?=
 =?us-ascii?Q?wtImlj0T8QumSzaIgGsbRVE9kY6kSloUDJEaMLpAaNPD7M35Go0BLwzQTRma?=
 =?us-ascii?Q?YY4IJppa4o2JZPTk4qg/HJxNxBw32y/3i0k+Wo7hQOfZ9eLXuNKdY3dWdVl9?=
 =?us-ascii?Q?f0aMHj4U08IgHQlGetg7xtHg3wS4vAy2R7dbgRH9uAcsSY9XZg6QSF29IKZ+?=
 =?us-ascii?Q?G10nZP10gyHWcEFksrf/UmuEv++/wkcoUsz3SW3NF3lfoaSE73sRG8Z0reBZ?=
 =?us-ascii?Q?2Rz2OAMB3bKZ6UvnaKzxLR8XicGG4cpaoOuyMvRlWOC9jqRla4DwZVOEIjR3?=
 =?us-ascii?Q?vdpCCRIDE5o0ZpghjeXExcdslAtAohmzN1PG8I1E5fafiKbCv/WDcGq6IHR2?=
 =?us-ascii?Q?2qapGuH0Qpuey91LOaP+fI2bs4v9wt4XtDEZD6V2t8NF4UVsaDBsYhBwy2ER?=
 =?us-ascii?Q?3/sdrOX8hoFJw5y3VEeBPJsAG4Db/rXfTAFQY0baiwTJ/YLmyRjLEZ9zBumP?=
 =?us-ascii?Q?pFtpPIL3XWp4ykEvHwm5CuWhys3Gg72S0Layi6sO2wFZ8oNQQ6SfNAIl7WRe?=
 =?us-ascii?Q?qdoIbtllJfSxLPGIotjvPtPoyGTNL7dHB2o6nYEJAIaPwsCcp/TDy5TFNJ05?=
 =?us-ascii?Q?ZJAvPnFCa0R5cZsN9+1M9sArgLTPXSB+x9HjCvZ3hqrRP8jL1nLepr4wUEfH?=
 =?us-ascii?Q?h4ifEgHYaW5ARsN6z7/LYUI01ip1T9FnR3GGNcPLHIMnAfZovoHw1Gw35XAd?=
 =?us-ascii?Q?QCUf7wWZPq2v2f3CdZsi2QSZN39Pk5Xk9kP/IzwKBzod92BXHPRSBvwN9vSt?=
 =?us-ascii?Q?zBWY7YxRPJ/fao19C0X9w1zCpm5Wabn47JCO9qaOOCSPIqv+Ru5dXwDRRtY6?=
 =?us-ascii?Q?iFvhES97bxUnR9oWNKtEF04qs+oSu/Ks4Js0VU+0PtttYDFm7/2ZFHMdGxdf?=
 =?us-ascii?Q?tdJpKn8QNRxV6GK2kmjW8YzioZno2EwJWIlpw6eE49ydDz3jJ/E/T/raZaWL?=
 =?us-ascii?Q?v95yPa7ZtMNcwmBYSsZi8DFj26PlcCZqW0wptx2jgHcE/6895WWFI1TnXt/V?=
 =?us-ascii?Q?R2ODI+rvvgfvrIFdVjgPJO+c8UIUHF4U/z/f+4pIbokjACcjHj4TjUVxK9dP?=
 =?us-ascii?Q?3v0+xi9Mb3f1yr9J+8N9b6CJUDLFH/cFxuuLVWU/oHGRZYMqTSsEYC8si2HY?=
 =?us-ascii?Q?BGmPqX9sRtLDKkIB5Y4RR1zJ/rr06g8K7ipgTpTVN5yVIMjbfCEMa9Ilp1Am?=
 =?us-ascii?Q?q7hpWhfxI4T0ZEBBIzf4xShvvlwTF9HxIVsgzooR5Ihk9+I2N3tulCOppISv?=
 =?us-ascii?Q?xdCZdov0qTo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?g7faN2RP2k4IrfSWR+JEXQftbxKWg7hzByjeZYtlznLCBEBKFOMj4pVD9z4M?=
 =?us-ascii?Q?x4j+mUa215twuBYWuY3fJi6wwIlc4SqIIr3Pm1Wsxgd8fE1gac5BI1AW3Vuf?=
 =?us-ascii?Q?1YU8GNwtq5N1u5el4nNuGBmu/lxwoo9eCfbWNApHGxDf6UMyKmKjpE1Yaosn?=
 =?us-ascii?Q?LDclBxFv4YSxOysDPHY+nKuUcWAtJJVhniZtGb4bxTfr5L4yQHqXxUmziHqI?=
 =?us-ascii?Q?vkxAVCTXTzzTA9xzrZEK/FAWvKP2addgo+Ne4uc9BtwckSWWgAfMbN8cGCf3?=
 =?us-ascii?Q?YLwLAu5XTE/9KzjHCNE1vDeqZiZ9EYvbzly6oRd/lTUYtV0yXafmzD62E7cC?=
 =?us-ascii?Q?LaMOI9wl/KxwJkeQi4OdPCVjd80k2mlbz8XqLzL1v1Y1H3xHAGYmlpGAshYK?=
 =?us-ascii?Q?F4LyAUZnba/TlJXfFoKJR+W4IcxLL84iDz9NjmKRkYBR5x+AyRkM/rmZUQdy?=
 =?us-ascii?Q?ZSwpdc1IBJXAqB/hQ8LJnhFrSGSxfIxEeevRZtrYXvLipypAZxtskIzmCPm4?=
 =?us-ascii?Q?XWl4/D/Wy6pVeWq/26VIz5XKE7ElTM/Z7Mw+E1ZhAXn5Lo1tHhtjvw96PbLP?=
 =?us-ascii?Q?w6IgNrWwCMMzVlv/PoEzpJdZTY+hCn7URfzDqggMRYmsaSoII560/KwuNivr?=
 =?us-ascii?Q?NvyuoEWq34HHivqH132mAiG0lVAGka4E4Q2a7eGwNH6QE0NdL+Z7pjchzT4D?=
 =?us-ascii?Q?SRQTHbV+gaX8IK8qGI8jZmQPUncmUavwlag212bgMqtqnY6/33x0055rbgR3?=
 =?us-ascii?Q?CRdv3P4ZXr6Xu2xcbQ+ocR9+PVMm0m1vb8pBpwo/apcmExhyzO1wsuVIzzG9?=
 =?us-ascii?Q?kD4suVqTN3HWOIxJuZugoSyguvOi6a2CKTrbUy9wVvK+xuuoOZAPx+fmTGpm?=
 =?us-ascii?Q?wVe36HoejJ6w4dVwDI3GZJESmXOsywquODbJizKWQ00+W3wyv/5YmA7gHFy2?=
 =?us-ascii?Q?W2R0rzHsFRdWB3cc+sysKi9t7xlv68qfWNFuHH6y6QX5yh0ObGrZW8Hz6EHF?=
 =?us-ascii?Q?pgiPGSwwvrVl+0zd6Y1GmquJ1zdiK8zTdE2rsiDPIQBTB1JYlT/L1Akt5Nqd?=
 =?us-ascii?Q?E63734zEgvH1mwIQsjnrnmuAJ7Db0EoGuCeU+390O7JBc8eBRnLhl0qICENb?=
 =?us-ascii?Q?zOikuOTFSAf+w/5nhLYL6dht9s5Svb/QY+acfrz49HWRllKqEkakJurttoDy?=
 =?us-ascii?Q?ZsBQJzWiRwwPjyuGbuQJvSdl0P+8h0dOKZJ0uLSC3v4wJPPznPRLTs+UmBt4?=
 =?us-ascii?Q?0ZD8nsa5VueT7lo0zx9DwEWq+uT10JkWN4pmGYGqtySzmFPAPfm4sepgnoub?=
 =?us-ascii?Q?G5ZM836TDBpkpIwi4Iz+vZyafPZh9+KVMh2k0YFFQYEu92lYugdFaZ8cPL/L?=
 =?us-ascii?Q?VefnS4s+5gzvNGtotEDpBVLsdcrhx4plOEI2mohCI6DxpRCXtkRCBkrcW8jn?=
 =?us-ascii?Q?IB7Y9FI/qSC4qCbvKurR60p1A3cz8tw4HHDEZqSd2CnRoodefXVe6OZnsWPZ?=
 =?us-ascii?Q?LQnHsQugnGH8779o7aEcqy+W+xCZqcGnyX5e8FR4aTL3wFdkQfVyTOwhjJGS?=
 =?us-ascii?Q?MCyW3bBs2AOdRYMsnzq09qQmNDT6Kg6YHpB8d2F2sv7lLNJ1SK52W3EJbZpU?=
 =?us-ascii?Q?dg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 112d5fad-1bcc-4d6e-8f3c-08ddb41c7b82
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 19:14:18.2006 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n8KInQqn4ffzLUgqlwfiAa3cs3FPXje+giwCN6TQ7HTBQMA6u8GnY2XCIpmL1hrT9kIw4bZGvI3/CcbXQRq07BMjjfLcAYnOnG99uSUFcPo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4602
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

On Thu, Jun 19, 2025 at 12:49:06PM +0200, Maarten Lankhorst wrote:
>Now that we added the separate step of initialising GUC in
>xe_gt_init_early, it should be ok to initialise the minimum during early
>init, and the rest after allocations are allowed.
>
>Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_device.c |  6 ----
> drivers/gpu/drm/xe/xe_gt.c     | 60 +++++++++++++++-------------------
> drivers/gpu/drm/xe/xe_gt.h     |  1 -
> 3 files changed, 26 insertions(+), 41 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>index 2bc7fbf15d058..60b3b50013a6d 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -798,12 +798,6 @@ int xe_device_probe(struct xe_device *xe)
> 			return err;
> 	}
>
>-	for_each_gt(gt, xe, id) {
>-		err = xe_gt_init_hwconfig(gt);
>-		if (err)
>-			return err;
>-	}
>-
> 	err = xe_devcoredump_init(xe);
> 	if (err)
> 		return err;
>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>index 435d888a1dfc8..3942f1ac253e7 100644
>--- a/drivers/gpu/drm/xe/xe_gt.c
>+++ b/drivers/gpu/drm/xe/xe_gt.c
>@@ -390,6 +390,7 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
>
> int xe_gt_init_early(struct xe_gt *gt)
> {
>+	unsigned int fw_ref;
> 	int err;
>
> 	if (IS_SRIOV_PF(gt_to_xe(gt))) {
>@@ -426,7 +427,19 @@ int xe_gt_init_early(struct xe_gt *gt)
> 	 */
> 	xe_gt_mmio_init(gt);
>
>-	return xe_uc_init_noalloc(&gt->uc);
>+	err = xe_uc_init_noalloc(&gt->uc);
>+	if (err)
>+		return err;
>+
>+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>+	if (!fw_ref)
>+		return -ETIMEDOUT;
>+
>+	xe_gt_mcr_init_early(gt);
>+	xe_pat_init(gt);
>+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>+
>+	return 0;
> }
>
> static void dump_pat_on_error(struct xe_gt *gt)
>@@ -449,6 +462,18 @@ static int gt_init_with_gt_forcewake(struct xe_gt *gt)
> 	if (!fw_ref)
> 		return -ETIMEDOUT;
>
>+	err = xe_uc_init(&gt->uc);
>+	if (err)
>+		goto err_force_wake;
>+
>+	err = xe_uc_init_hwconfig(&gt->uc);
>+	if (err)
>+		goto err_force_wake;
>+
>+	xe_gt_topology_init(gt);
>+	xe_gt_mcr_init(gt);
>+	xe_gt_enable_host_l2_vram(gt);
>+
> 	if (!xe_gt_is_media_type(gt)) {
> 		err = xe_ggtt_init(gt_to_tile(gt)->mem.ggtt);
> 		if (err)
>@@ -580,39 +605,6 @@ static int gt_init_with_all_forcewake(struct xe_gt *gt)
> 	return err;
> }
>
>-/*
>- * Initialize enough GT to be able to load GuC in order to obtain hwconfig and
>- * enable CTB communication.
>- */
>-int xe_gt_init_hwconfig(struct xe_gt *gt)
>-{
>-	unsigned int fw_ref;
>-	int err;
>-
>-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>-	if (!fw_ref)
>-		return -ETIMEDOUT;
>-
>-	xe_gt_mcr_init_early(gt);
>-	xe_pat_init(gt);
>-
>-	err = xe_uc_init(&gt->uc);
>-	if (err)
>-		goto out_fw;
>-
>-	err = xe_uc_init_hwconfig(&gt->uc);
>-	if (err)
>-		goto out_fw;
>-
>-	xe_gt_topology_init(gt);
>-	xe_gt_mcr_init(gt);
>-	xe_gt_enable_host_l2_vram(gt);
>-
>-out_fw:
>-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>-	return err;
>-}
>-
> static void xe_gt_fini(void *arg)
> {
> 	struct xe_gt *gt = arg;
>diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
>index 187fa6490eafc..8128ddfdd7886 100644
>--- a/drivers/gpu/drm/xe/xe_gt.h
>+++ b/drivers/gpu/drm/xe/xe_gt.h
>@@ -28,7 +28,6 @@ static inline bool xe_fault_inject_gt_reset(void)
> }
>
> struct xe_gt *xe_gt_alloc(struct xe_tile *tile);
>-int xe_gt_init_hwconfig(struct xe_gt *gt);
> int xe_gt_init_early(struct xe_gt *gt);
> int xe_gt_init(struct xe_gt *gt);
> void xe_gt_mmio_init(struct xe_gt *gt);
>-- 
>2.45.2
>
