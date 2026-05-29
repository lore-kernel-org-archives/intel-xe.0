Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97972CD4F54
	for <intel-xe@archiver.kernel.org>; Fri, 29 May 2026 12:45:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B91D10FE94;
	Fri, 29 May 2026 12:45:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FLyM2GZx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2893510FE94
 for <intel-xe@lists.freedesktop.org>; Fri, 29 May 2026 12:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780058711; x=1811594711;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=xPmMSZJEYleSRk5bF5XkeV+Z+8oIRIqk/ynfNAVJdNY=;
 b=FLyM2GZxmM99k6CW9yR66614GoSPjm0R6ZU8zBal6Z3x5LcOLSpzbF7k
 g5LeAbQzflBBvqiLH9kcVGJ2mSxXSgz5hEUl+RXqB3RPsb92n6zW1BW+z
 P/0c1oGy/8A4vMRqrasulILyiWbmg9ozzZBp+5m48zZPnn640P1EvJm/d
 k5YPx68vAHbAjlsbQHRnBqHOpml5sqLTiOstNqr8hEcS1bhEqeIwcmxZ/
 Nx48XnLphHZVzsBifAVTRBkrBwxnJ3NIkDWMlKAQt3tFScETRHNBpsity
 BYtTpZ2OResZ6FXAXu3f6FgXIDJMRPLzpexCWdFSwiSY36r+3Qq/ybxoa A==;
X-CSE-ConnectionGUID: 4EqSkcl8TQaP68I0vgOVfA==
X-CSE-MsgGUID: uq1ijdpFS3GIof0NhS/OTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="80761296"
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; d="scan'208";a="80761296"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 05:45:11 -0700
X-CSE-ConnectionGUID: BAa6cIDcQA+u36VLCqwTRA==
X-CSE-MsgGUID: emseB4UFSJSY28vg0ovi4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; d="scan'208";a="247932548"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 05:45:11 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 29 May 2026 05:45:10 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 29 May 2026 05:45:10 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.30) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 29 May 2026 05:45:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wkhxlg3LiERfogKWXrhDxUixFVbr4eq8Sj/ZhcSHudwJ2GuG4rlBuL1+sNyzU2nGSleNu+C/s5vbn4ffEQ/bL1WSrodEI6ypHobxDy7Vsf19QCAzr3asPsgdrg5wF65Tgsr0JQ3ea7nk3PxjjGSQneoxur7xRuxZEB9/322/8AOVrhW4EYmrgmYckTWNtZ8vgu6wMjeNZYmu9lSW+l6+f4YxgagFi7Rj+3t9QBqWBcBHdeBsX0Hwo0kx7QRqaI0S2oBz8WuRhVnCqMbykgTe1VM8sOwXh4CCVVuJFzhXTqCPDAaf5/PLDB48eZHCNY167JB59Q+cTkmMovp0af/cxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5gjpYIq9xy+YDtJ+Z9HqpFKoPGOIB0itUb5U6v7PFkY=;
 b=xFHpPkOpK+SzOrrVV22IiY1XSvSPmrcEtap/mCYiSuGuPjEVyRH0/+h9ySvApmLOaUjsx+vcwuxi75xBDwKxKOSjT54yimtK//Gi3/nxLrSqE/uuX1R6hSw6wYbcaTwoA3APFzoxjo1o/a5hHQpVlOV0Mm8KDLlt19QPvt/yiqESfp6BgkKbLpAQyeQNGit+igv0j++111YlQd/Eka1Zmwg/Yi51vwR95jQ8C0sHxgVCUewA8E3E+mXkQOtG9HEtwt/avu6/3O/BNB0pl3Ra26z55j8IYNqcmHzqxB0eAHmMVrnwuXxKHSfaP6WUP8HTGqLNY27e1q970SzaVnJ96g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by MN2PR11MB4647.namprd11.prod.outlook.com (2603:10b6:208:262::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Fri, 29 May
 2026 12:45:08 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.21.0071.011; Fri, 29 May 2026
 12:45:07 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Nitin Gote <nitin.r.gote@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <nitin.r.gote@intel.com>, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH] drm/xe/xe3: Apply Wa_16029380221 to media
In-Reply-To: <20260529095306.443350-2-nitin.r.gote@intel.com>
References: <20260529095306.443350-2-nitin.r.gote@intel.com>
Date: Fri, 29 May 2026 09:45:03 -0300
Message-ID: <87h5nqs7u8.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0001.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::11) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|MN2PR11MB4647:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c54268f-fe5d-4c62-8ce0-08debd801d2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: Y8jAMFnks5i6RO3VB0gV6s8qThS98rWi9EFVD6Y2AFC/fJY/Amd9WmF/cw3mawauZ1fOGHPo7MGFXTz+MOPDLSgVeg7qiJ7XS/QZUaKo+DsC9FbmS+iXG2ug3+GQPxwTs3aWoXqhU3P1ENDnJjM3P6iLPO6NyGFS+KBHj6AteDKXop6rlPEpBGDqbf0uQJl8nOnfQuR2LbsfffmB9aHIqcsSXyv7xDVYwXqS6C5f/cL+tl3uA5frp7bjNZ6fdr4T6ufhpbCu5wfAskHSsxpHdxvLkxB7kvpluesOS6ln7y1rYw5Gzv0TwTDiUYP2oQA1T3KopqMHt/s6h/5z61n+KOC2h5tHM/JW7H2HgRqimHtX5GiDt+3J1+6tkfK08gN7oKxTU0aJz/FsCoo8JkDQVGr/UDOAF03XOcJAVHOn9IkacutaK7hQGi+YcTyTRVnM4WAR2SHsVbHyHOY0meq8rHILfciaxOESJWvQjYILyN6papqn7tDTJBX6uRqK1pwDCXezQbr9ydgaL3egzrxV7quWJ9hhmnTjFQhQ6mOaiVZPjn0GO1CRNCvcPcMaUOEHyX7Byk/+mjdOXFU80DAP7VmIrwJb3x/ELC+59dVAr9o4vXKEALKPEyhRoS+TRF1AF7aYW4HbFV7y5mDhS1pwNWH+W+3u/gWnlFTqppVlNrpG+/1nFTxSeRM6qb6PzUaa
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0ZtYnVHLuPs3jFoY9q2yy4xbQRAp7J4RFl9rr0KHX+dK2BTOKAJ1L03arUCm?=
 =?us-ascii?Q?1J4GfV3hBRb8YAvez8QlZ/NMb/NbyTXnp2pxRyn+OyoGwA4dKtiQut/HbIdg?=
 =?us-ascii?Q?VXBBoIwAxz+b6/5cd014b+dwBPVxSVJLNfSKfi1cSDHAHimLTtbkXBIZJHQF?=
 =?us-ascii?Q?K1uEkaN4Cmm1d00p8t/BUuwIk4bylOvSNm8Sg6ox3mLPz+RIO0UF7U8z+Vqr?=
 =?us-ascii?Q?lSgWcMjcTWJ5D//UCenF8nCXQ0dihM3fXS2LX2dkhgsevk9A4oWh53bPoV5H?=
 =?us-ascii?Q?Eklje3KnbW/LqAOMXExda2TkUskbyOzcuXVXUvulqt7bb3GOYpgCnMlX3J0/?=
 =?us-ascii?Q?XsfMXXFZ+QYubEa5vzV1U4617G+Nkx86STunAPfcXi9QGkx5r2OhwS2uPlJz?=
 =?us-ascii?Q?8krFj7rDR9qGAgEBOBvcxGY9+VpE7fwNeoAuC2DKVy91vDGBge8M1sekZxVd?=
 =?us-ascii?Q?kGSekf9twjqG2v6dfsU4dZLTEm/7PFGxaKb9ZP3SAXwNCJ+gbJUciIgUlJQx?=
 =?us-ascii?Q?ZL7mosrdY0osTibXe3HYP44cVaZf1gv4Juyz+p73XgdToUpezMc6vWL2DIhH?=
 =?us-ascii?Q?nbYA/STRoIa7Gbh/M6IvOifkgWf59rtBJhfMYQmOerrEz03YX2ZW+cWEFPBx?=
 =?us-ascii?Q?KHqqcF0heFBhA3zZUyVN5Zs+3JJq63uzA1KWd5VNdj0a0sMijDfJSAC56Le6?=
 =?us-ascii?Q?DJnZ2JgAWvSIa0Tw7QY0BuSmNFpggryaLcraKLAPZPNbQ2sSe8a0UKEHFF2O?=
 =?us-ascii?Q?udzLxspCv2m3fLIEEJDXdyaeKH7kfEvzmrU9iiQLoIKQxlHquQtPzL37Ed0c?=
 =?us-ascii?Q?MrkUbo56zWyNZ70lE+0KP7JP/+MK0s6+Gk0JMm3/OBV1LdrqcuEAZ0lWmNzp?=
 =?us-ascii?Q?9iCs30Jhl8wa6GPpP1yZukudozCm0PeizOx+UDA5M+gLlQ2yLykLjw2gQPeG?=
 =?us-ascii?Q?6KTddIniDjOzEPawFmbLXDnLhcsr7UaSQ5hk331ado4ZeU62yguGOlTM3T4E?=
 =?us-ascii?Q?tZsBbrI8dInGEWCDLRATQ9Veux+1jZD8HJdMQNNh68sQNmABoQLMNnejENT8?=
 =?us-ascii?Q?o+HIVEpdQI2yaMpd2xn0UDD/CEbyx3cHQutIExEL6yvPNHeowrkahcWJ9xAh?=
 =?us-ascii?Q?uce6QOpcHtF0JTt4vVi2ESr8OcJWXp/yB8I215PKeDi9MQ1XmFjJNsRBtnHL?=
 =?us-ascii?Q?sAVIdzoILHFAZJps+LUtk7aue16/YFvvc3/VJIWYAW8mwn8NnoZl5lsKr2jC?=
 =?us-ascii?Q?jvsyvIEBXCtTHJ3qcwlEKdzepPs6S29SjSWUFQaNhUwRthzK1EDvD2QRB+6B?=
 =?us-ascii?Q?Ez8xb9iUG5bJ4xbuCXoxzIvzp2EO16IMqamFCzZFX1rjlDf4CXetKu5tDJJG?=
 =?us-ascii?Q?IPHAiTixAO61wyl5ptSGknzo0Os5oyiTgsOGDdQUinhbA4hVWflq8q0gMQrL?=
 =?us-ascii?Q?83QksAxTcxKBd+OqEeVC13MoDvfo9T3+E/hVUK8JExXG8eCiSGsvQOVyCnPZ?=
 =?us-ascii?Q?sIbgafJY/IuJqzSQkb8Ox0b5HWd8UOGrnoOMOeXFkjqMyaWXkflRTHGqPbUX?=
 =?us-ascii?Q?yD7tdF7r5yyjG7wVqahu+QkCBEEesQvcS7paEQhBZB7eBCkgdZkrd99yJK/9?=
 =?us-ascii?Q?bLe99gv6WYfayCEqNWuVlAKAJsPjpqyIpPewdLwCJ6u1xA3MTJ7k5lOebOkp?=
 =?us-ascii?Q?LeeaDcAWq5OqefpROgZVOsV058pkMtd2SeEVW9eX5gf9quU7CSVC+nputusq?=
 =?us-ascii?Q?EM/jHqXh7w=3D=3D?=
X-Exchange-RoutingPolicyChecked: rCvD0iSorQKRZ3m3XqwSHBHh+zC7F0IAVAFOgrhVuqGR8tfpBd0T02kBjZPeuDAF43OxVft3YONrh33C7UTXE3N0SuooQ0Y/ojiuoDyJmgOyEIUgKzf1128gd6Jye2IHftGx4b3moCpTtKspG8SeXd8ccQ8cru+tIIwc1lmY2yHMb3Jw+AuA9CrM8DOekPNqF9fRejkrMDYM6mA5HS2hiPgDhlTBC4HxJKnPgKBy8YAh/pyWEOde/F6PmPrCCmbB/2nnL+qk/JvkNSFlEnL18t1yAhiUOCzo9ciyNMFklO2tSTLPTBOUiuHJC52FjakGrJlrU4jzEqqIeH/C5UoF+Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c54268f-fe5d-4c62-8ce0-08debd801d2f
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 12:45:07.8165 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b8J6CqKosox6oCCiT2XUFOQQa15LVn4zrRzDwjJXFyuvsgRmcVuRg9q3hopT5cwRg9SL/SFvS+2NeWzUDs8rsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4647
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

Nitin Gote <nitin.r.gote@intel.com> writes:

> Apply Wa_16029380221 to Xe3p_LPM.
>
> The Xe3p_LPM media page walker is hard-wired NonCoherent and cannot
> observe CPU:WB cached page table data. Force page tables to CPU:WC
> by clearing has_cached_pt when MEDIA_VERSION(3500) is detected.
>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c     | 9 +++++++++
>  drivers/gpu/drm/xe/xe_wa_oob.rules | 1 +
>  2 files changed, 10 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index d224861b6f6f..8a6f494e11d5 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -948,6 +948,15 @@ int xe_device_probe(struct xe_device *xe)
>  			return err;
>  	}
>  
> +	/*
> +	 * Wa_16029380221: Xe3p_LPM media page walker is hard-wired
> +	 * NonCoherent, so page tables must use CPU:WC (uncached) to
> +	 * be visible to the media engine regardless of stepping.
> +	 */
> +	for_each_gt(gt, xe, id)
> +		if (XE_GT_WA(gt, 16029380221))
> +			xe->info.has_cached_pt = false;
> +

This will also disable the feature for the primary GT. Do we really
want/need that?

I wonder if we should change this setting to be a per-GT one instead of
global to the device.  Perhaps one problem would be page tables shared
between media and primary GT.  Is that a possibility?

--
Gustavo Sousa

>  	for_each_tile(tile, xe, id) {
>  		err = xe_ggtt_init_early(tile->mem.ggtt);
>  		if (err)
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index f8a185103b80..9027365f0043 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -65,3 +65,4 @@
>  
>  14025883347	MEDIA_VERSION_RANGE(1301, 3503)
>  		GRAPHICS_VERSION_RANGE(2004, 3005)
> +16029380221	MEDIA_VERSION(3500)
> -- 
> 2.50.1
