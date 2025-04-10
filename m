Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11BCEC3601E
	for <intel-xe@archiver.kernel.org>; Thu, 10 Apr 2025 17:20:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C635B10E367;
	Thu, 10 Apr 2025 17:20:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PeEzxU0z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2F8A10E135
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Apr 2025 17:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744305652; x=1775841652;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=74FqtaUE2JOxPTfymr2hvpiDDqAV8Kr1jWncfn7DZDk=;
 b=PeEzxU0zJQoBi2qKnwmfOO9B+KJWH7TQLMZHfjRbcgz3mrbsCl7lQH/3
 jn/u9cTueDMSQq2Rucz9EeK4Y9TMJc1uZvhDfWgO2zS2mGDIJ32WcUwTY
 V+Y7WrxnKn85urvTkXxqv8fNvNYJ5EVSGCosQTRX3tZDSsmaZY1qZnVGv
 zjCK/E+2SC4mMcbc6AJd6LabrFMTsH+Cve8nGzqv5ym2XC129L/93qt0q
 leWNQCm24ayNwMpNYMGGM2Jmap+KO3IYwNTpPAWDxVvMAXrM0MHNLnkwu
 b9+R5sVuRqs7bD17gIoTtIlUX5A21xwgQBoJMM9y7U7+sg/y0Q1IWbZna g==;
X-CSE-ConnectionGUID: rz1aDcj5TQyYe34KveBT2Q==
X-CSE-MsgGUID: BF+ZVQ5jQuyN2g+fzbSgAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="44980127"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="44980127"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 10:20:51 -0700
X-CSE-ConnectionGUID: gpwPyYS0S4Wrs300kzUg5g==
X-CSE-MsgGUID: 1fVBqoeTTMWTnEMzX6eF+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="152144740"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 10:20:51 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 10 Apr 2025 10:20:51 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 10 Apr 2025 10:20:51 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 10 Apr 2025 10:20:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xnwzHGXuuywyzgbGcUvXWveG381nplSrooyjVnyl/u0E+KCmwoXWd5jxce0GHgW3i13tL/NmkiTCmU3k27JR9ihIH8wsuKq/jsqtn0WQoBqqSGj+JyEB6KbiESFyQDexjuRZXL56SQbjxOxurh3x1lB3YAaBOx+AX727qBSVSZ9tH3tfPBStRPzE/28INnSHb05G0qeC9tviJ7w6ncZpunQdbJ4lGm5ggwV235EdizzQHPA3cFZJ3LnhQUm2n/uTYzS+NcdlqHAJrqE4/eHlPZrzYzts6EtYES2BxfiL75Y5ltw9V1LHLnu2FmMIoU1V67FS6hZFHkkXrcNLVzfN3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wk7Y12QcZBNQijsMoNqNsrUH3bUgwsMESNEDCz7SqQ4=;
 b=Zhttfm5nXRwa8Okam7V0eqZQt+fboy2FUybmZgEZxXwq2oumsT/Hky2wT6pMMGjLrhMOQSQRQfyCa7Zx22UdwpdrLJhc5oj1gmh/SM5sNdIKmpRAbTKLP9Dz8Ml6I7xxEoTCzLw/ZapNTnofb61GHD689GP9KqcAud/8l1LxWgLgPfQy8HHltjn8+Dz0VjXKxtaY4+ylvXTEn/UNLpzLWTsYzSoqaDWTpfVV4Ub5WXG0fKyfrM6lCIYVmz5+yL2j2+qv01rb3kGW/JbNOWNHJmgNFSy4MyRFDNHzIk7L+ap1biqyj17uTDEnUx1AS49pGixceBYsH3gAmU7kI4sKyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MN2PR11MB4568.namprd11.prod.outlook.com (2603:10b6:208:266::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.22; Thu, 10 Apr
 2025 17:20:47 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8606.033; Thu, 10 Apr 2025
 17:20:47 +0000
Date: Thu, 10 Apr 2025 12:20:45 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 1/3] drm/xe/guc: Refactor GuC debugfs initialization
Message-ID: <4ru4orvn5ufdbkj6vlhqjr6znsacqasath25bty2iydagdjoxh@hlrbknju5grd>
References: <20250403142635.1821-1-michal.wajdeczko@intel.com>
 <20250403142635.1821-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250403142635.1821-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW4PR03CA0324.namprd03.prod.outlook.com
 (2603:10b6:303:dd::29) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MN2PR11MB4568:EE_
X-MS-Office365-Filtering-Correlation-Id: 5991e63a-2590-447d-2d5d-08dd785408a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?G43x3KCt8q37RTwtQuXlE0IgDaFXAxoFu1widDmkSQ8AI+bY5w6LnxQBEjm+?=
 =?us-ascii?Q?U+Tjo8Fbx+qlnsAebTifeq+4iJ1k6hiPnlBTor/6r1QhyeKHuVMuuDc2C3YR?=
 =?us-ascii?Q?1wbPmMnkYsgPK7NtqaFIVBHUWsmg/5OExgtmoGbi5jHiYYhcDouSR4TRUf2g?=
 =?us-ascii?Q?+UlyAKLbQllKA1dBXF+LsS+JBmKzlFu+KwH2SzqGCeX9UQjxqUjrBZ2Qf3aH?=
 =?us-ascii?Q?1eKQROBRA7DjT99Lgn5AEQaxcXUVebMXRE2kislSxm+1Pu7ceNaJR0kWuSQs?=
 =?us-ascii?Q?0QOXgpRWD27kJUp9gcsv/x2B1pe4HsD4RDqyJAj0AK/erQNrr58rH4hQ6ItI?=
 =?us-ascii?Q?J+4yfZGMkdiAuSqlPoaYuoZs2IJURGFNjAxg+pkH2vhWTQfzl6CiclGUUgW5?=
 =?us-ascii?Q?tsncnwwUnfIZNgzv02xx9ydD2wtcp5Ben7XVbW+7NIMLRR8lDimMG4SGg+bQ?=
 =?us-ascii?Q?rGR2lBjcTmv5x+7OCAKISZvkCcJj3MoRe2mYxarAKoBtGxzAnSTbK72hiDt8?=
 =?us-ascii?Q?BOoaseQUFXlB0N/BJkEU67sota/a8Bj2YOKV8WXUjkNWfxXAU23Qzy0mjDcI?=
 =?us-ascii?Q?+t0Owvpw/USrKOjo/3wuLR7tidhRNj44pkOLmHcObiHj1dwqhJZh3fJO+kqX?=
 =?us-ascii?Q?KW2rOjL4uAph/aMdSwQGIHTLk414rDJy69mWxZvqgFRggaYJAxWOYCwqthBn?=
 =?us-ascii?Q?9Qegxrxj/+g/PMGAYJF3ii2h22EHuzcSB5aeNQ9/b8mp/q43MjUuG5uBEHmg?=
 =?us-ascii?Q?WLVxGSRiaoRzdrJOI25ErMoTrcmAbaITb+btvyEIRyO7iGtJ9CBfwP8P3Pae?=
 =?us-ascii?Q?6ZEBZ359TkwiewcV99MYbhs3MxWH0bCzPnE6kbmfk4TEGVeew281Plh+qeox?=
 =?us-ascii?Q?gtJe98othMMd/yAwq3uiVEvv0qZkMqsgzgv6vtqri+GlZub3FDE70c1fbULj?=
 =?us-ascii?Q?BFfJwrqEIA6BKCwFbyXdG+ZqjZNZznBV96eVuYPw0EDC9YZBCo61+Ws5rHDj?=
 =?us-ascii?Q?nMJsyRE44U1nSpovIp66cVvcmfspTVm5l5o/KXQtPKVjQVWMqyQkZ7PxHG/T?=
 =?us-ascii?Q?4Zfz4ShoAPcxOnqi+F23KYpBoMAtvQC4EcqM7h2T/x+lfUSRBPt9VBzuTLfL?=
 =?us-ascii?Q?v8UDp71vLAVWgI9ZZALHBOa7KnZ0HgOAax0tvKkcbwCtFiHZI2YJouVmrhrA?=
 =?us-ascii?Q?4daxeSC5AR9XbjVilCshK3tlS9vJZbBPFT/t6yNQ4LLhst8grRMxlFArd7At?=
 =?us-ascii?Q?+5R7YZLTtr8Km2UKK0VQAAfVM2nlCSGdU+GOtI7+Z17BPvoGSfJmRAY9QWqW?=
 =?us-ascii?Q?Bbh5sGU0AxT9Tt073u39sEvXURlgwGosGNHCA/JxPaj20j+bfKbFhg2hGwz7?=
 =?us-ascii?Q?YounbEgPPy4EqFZDu14xj0WdsJxfOnPJxmaUBfUVGNgP+yrj7G4Eub+xD4LD?=
 =?us-ascii?Q?AJXDSpmsofE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fqwY1TkCh2OI4OO3AzRaMRBtxE7VElh9pmb8PHqws1aHOTHzQptRpDXnEaeh?=
 =?us-ascii?Q?DqhcGeIM3VTPww/gw3jVx9j9erY/gGpfAgPSJxKFxOyk86I3qo3OhX9QDrQt?=
 =?us-ascii?Q?+mXsMrW+fghLBYF/oxiNBiVbwL+TjEBRa50QZpuOrUPyJ0P76vwjsaM4/udf?=
 =?us-ascii?Q?LUdmawFrsSUfsMU9lbEW9WmZ/GNapHVTRZGhu9ZNc/K4fosXMd9+W1jRsHkx?=
 =?us-ascii?Q?QTteSOU7/Um/oLcAoL80a5/1YcxcaWeNYQKH8HBdzCtIevaBvHtSyCCeRUM2?=
 =?us-ascii?Q?g4YOPPuHjEhaIeZtL3YlJVG4fBWiy7JRB6XhZ2hQKn5zwh0K8d8tqRdSKtAW?=
 =?us-ascii?Q?BDFwpQoxl31Lk7fpRl6QzuwImhzjYFzKegYxW6V89Mj7ou/8nNggD5/bTQ+K?=
 =?us-ascii?Q?uGerYHtqpLcF+1ovf8xGyo7gp0AP31A52yMQZts/2qaGhDb4ckzzTUBtVac2?=
 =?us-ascii?Q?/IlW1bnP6ijcA/02GhVgyXBLVs0ScA5qjPMcI4gkJ0iikGgHC7CCyxzoPQlk?=
 =?us-ascii?Q?RJ4Voqduk2NR1htDaXVohM3OmQHhTQ+Rvx/Rqq0i+NbiQ7yozqKx+jHh51v9?=
 =?us-ascii?Q?A90QdfIi/d/X2+uzGYzDS1p9iMYwi3ksbwKyAbdlywv3AXFcEdPlSCCdZSyp?=
 =?us-ascii?Q?PuCBTZTBhhd4T+DFmiqFRgvDp9UlKgGteSgT7R7VOrJbRjiZq6xykCA4Olv/?=
 =?us-ascii?Q?4dvvHKvup9i4RJfe0OGwKeBo/wIpaLYN8UzFuo+n6esyfaY74Tw6uiMQDyOA?=
 =?us-ascii?Q?MLNbZGLL5L4JErT3n+F5jakwMmOfr/6aWZ5AHSkt/I8Y/w5rF1bPYF8XBMK+?=
 =?us-ascii?Q?FLhUeGWNoZ1XCC/byucXlc3G60DDH+ZD7/AWlcpJY/QDziez/dJpA9ZJMBA/?=
 =?us-ascii?Q?ViIehv0+LRTrbBgIgdltv/bc1DtKlrlZ6i21a4jxjhgbkGLh6P/hotDKvoWN?=
 =?us-ascii?Q?PcD/h1/kiK98JaYHeUsv7eAnRgdomKf5v3loX7FZagk6/Zk49OIsf+WaLj20?=
 =?us-ascii?Q?Xp7+5BW2hZRU3CBjsiNG7c37eTgXP1X7R9TXto46xICIOszqU23f4N206lOE?=
 =?us-ascii?Q?90TSL02yh+Dxq3lipQnejnSGA/BgbACJ7lP2PbFbKl8TRFgWgdOczW9RsEZO?=
 =?us-ascii?Q?VhCvZgeZLYLxVFBVe8fLovcf+vkpConWnBDOuImIcB8OfOA7Sib9R5UMyq7e?=
 =?us-ascii?Q?wmxjjJBU3h/iR5NVlThpLqLZSLmI6aTmkTNmApQbvjDvwLN0PxIdOWwOzLr3?=
 =?us-ascii?Q?0qUuH5UYw8dOjqQbPbgR6tzHZSlcNY6nuDsWoPZnJKMn4svWwdzYjktRaKWo?=
 =?us-ascii?Q?XCrBglz8WhQXHk8eFy1F/UiA8CqgUgGT/CRBDU89Ie2JZtsMbbyRKNZKxZW0?=
 =?us-ascii?Q?Ps9iPmKzBIycHP+E46LXPs2BP5urtRu2CkPSvWY1Io+V3YMgSXxYDwdteIkA?=
 =?us-ascii?Q?J4cnfQ/d9qpgkeDXy3C9j/joCU0g3Wlbb1jygrLODrl3SttvzLzdXFYCEPWa?=
 =?us-ascii?Q?8G50XgPbi9ivX+MHCMght+UppyAmJ62i2C3pJwjIcsVZXLb29KTwwMhoeErO?=
 =?us-ascii?Q?3eHM8katrrFRr3JhyFsWJp69zk3Yq90yJqoSXRb/8iUKvrRvZY5E80iULf4Q?=
 =?us-ascii?Q?5g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5991e63a-2590-447d-2d5d-08dd785408a8
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 17:20:47.6492 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Rg+XnkBltBWYHIM+FcdmPUib3Leh8dRjuEPDJCdQ+iDFbrF02b/XHS7nfFbV22bPscE9PKRxpoX1HnO7qoAd3OllzhkDhQq0A26QrkLdNI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4568
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

On Thu, Apr 03, 2025 at 04:26:33PM +0200, Michal Wajdeczko wrote:
>We don't have to drmm_kmalloc() local copy of debugfs_list to
>write there our pointer to the struct xe_guc as we can extract
>pointer to the struct xe_gt from the grandparent debugfs entry,
>in similar way to what we did for GT debugfs files.
>
>Note that there is no change in file/directory structure, just
>refactored how files are created and how functions are called.
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com> #v1
>---
>v2: document guc_debugfs_show helper (Lucas)
>    clarify no changes in file structure (Lucas)

my review above stands, you can remove the #v1.

Thanks
Lucas De Marchi
