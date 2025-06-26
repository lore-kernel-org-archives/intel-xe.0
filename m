Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D313C7EE30
	for <intel-xe@archiver.kernel.org>; Thu, 26 Jun 2025 20:58:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41DAE10E2EB;
	Thu, 26 Jun 2025 20:58:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CyBGHxiA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F92E10E0E7
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Jun 2025 20:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750971527; x=1782507527;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=BGi+AHqNdJVrmE/UBbpFjz1ylKeL9APmrjjubTYYdF8=;
 b=CyBGHxiAB92IOaKoIXn/ONXIISltvVj3Py/WlALOjMHLNILAE8Z3Lo0s
 +MC5F7noGfTGewkh/XmgScH95ZqaYk4DWwr+5/20mjdRZ2ouykhaa8pTU
 tBrsf0LOlJjKGLBjt0r/XrgfCPh+iLjy9IzpZ4sadD5ZrSbcYNBk/v9MK
 CXXRrwkKzDbI9oQMQvezb0sLezxjOViVxepLlClt8JfudkDoiQrtGcCu5
 oqxxuJ2mXCHXFoAM6RBHlvxNxu6Hg8KKBxEK74FL8IeQLKYvynEw/sIKP
 ANiLVVCmomZFzd1Hipt+67y/KKXlAECudVMkLcSf+5qQlHitcDiFBrVbh w==;
X-CSE-ConnectionGUID: lpffIjN7T3aDcntPOMEdYg==
X-CSE-MsgGUID: 17JZ4rciSXKY7gAj0aw5Pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="52512551"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; d="scan'208";a="52512551"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 13:58:47 -0700
X-CSE-ConnectionGUID: RrI6+Zv+SXuqkQFkMPJ1Bg==
X-CSE-MsgGUID: sjPSpgojRI2QJUuAblahsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; d="scan'208";a="152245655"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 13:58:47 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 13:58:46 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 26 Jun 2025 13:58:46 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.48)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 13:58:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JWhT6w//s6oj7D8EMub5rPM8ghXo0wa9nB0XnFUHzlXBLW5zDANN47c7trvT3PrT+gixXpY05Uv4UF7lOhHJV560WKVGghEZFNV8oujpC2UK75Uu3Y8lro/s3NsRseiWFFfVO4aKTmk68nVPWBqcTcXBqP0yaqwu/CHEbIrvUkkgeAnRdHto5jaH3owllECjC+Fu8Yd/1APcGnEJ310Iych0GZiEPwyLLg1iy9HVaqkxdgwkPz89DbfUnmJdVj17YTXf8R/5Gqc2MKw1YES329UhBSRuV/Cs7KDHCQhAIzC33Esa4kD7Dyy5fWNuQioC8FpUpe3lEA71JraYS29EoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k/JsJnF2hOg9O3bhbwaKn9j35g2xO31ElY1rNtEtV+U=;
 b=Abypp0dWaENFwDr4bKjN8T4Pa9cSvSJDZCf0fdKHNjCU00cSC57D0OvQcHpVUAWe4ngGfespqJ2kSA7DvggF2/KNuHWGP3GU1s/S3uoj0y2K8BAYz4pQ98toAGVbM4wTfmbwSl8Lm6S7bllELcOWQy/VIyR0P+6Egc301Ygm9fFyQBP+SqD9lH2M4XulHXOMUhgpunDeS0S7KgD8LaAO/L5X+kApehYMZj41yj2syjYoBlOIDJlwI/NW3geTFREy4nDC2UqXyvhb2MrPeeLcj4ElY7LlVOiM477PF4CnCsda1CAdbGdGQngVv+TORv38onNcp5ijIySyKolKy7Ctsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH8PR11MB6612.namprd11.prod.outlook.com (2603:10b6:510:1cf::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.16; Thu, 26 Jun
 2025 20:58:44 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8857.022; Thu, 26 Jun 2025
 20:58:44 +0000
Date: Thu, 26 Jun 2025 15:58:42 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 6/7] drm/xe/ptl: Add HuC FW definition for PTL
Message-ID: <c676ywoqiwyk25xizidhaj6qgwdgakfxhtiwv3e3rwh32vatl3@eqbgvcawtwez>
References: <20250626182805.1701096-9-daniele.ceraolospurio@intel.com>
 <20250626182805.1701096-15-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250626182805.1701096-15-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: SJ0PR13CA0214.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::9) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH8PR11MB6612:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d8c146c-e07f-4cc6-a8d3-08ddb4f43d10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|27256017;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?w7ODR0M1tvLXSts+mpDMwhnSaUfmO1FGQHs3zlcPtMjdddxySoTeIRjiX+3f?=
 =?us-ascii?Q?yZmgPsVSxZXWUvkoHSCTpa1FWmCZcsmIGjhsKpDGcnHEDHi9nNcZOhkthPvp?=
 =?us-ascii?Q?6EEJsN7FpBDxd0uVJ6LTJz9gWub7WibhzcJdVG0IKCHn8JED6cxuTtkMx5lY?=
 =?us-ascii?Q?hZpWdO/FnkDncCXOBvgoKWIYklFYGlzHnJpWWgcqbywDWSNMFh+sl1Bjq7zU?=
 =?us-ascii?Q?3WnHhrAHH2EnQduvdPlwKptEaTFEigNB9HNHS9j2JwTLyIv4eDO9M+24Akk4?=
 =?us-ascii?Q?un23nU1CuegDq2eWbt3Y7v0TABrDsyLXuD/W0zdjaYNSxKGIIhsLYhRRkeLQ?=
 =?us-ascii?Q?bISyIYbJvyPRm0rB3PM/plsqwrWgFKAbbjgsYiJme9wO8quOMFGjChtCphIa?=
 =?us-ascii?Q?weJL47n+jCrun9/YAs4/wMuuqdbZulePz4HJT3KjdLNc8NVWCuXINTuv/oWw?=
 =?us-ascii?Q?JPFNwYw7zcvBTYIDfMBnU/9180XGBCOyd5f+MjFqrO5eD734Tc/LjLJsSzsp?=
 =?us-ascii?Q?HCrrigQY6mXbp/Oswne97egUudY6oT1S/ll/bbRzMI2CFqIUiLRdZfkypQK+?=
 =?us-ascii?Q?6INj3LEtuYuXNH8tV3mhwAbjkrrV5IXQTXRxaYumLeQCm3qkX2Mm9lPx6///?=
 =?us-ascii?Q?jfxw/QJxcgg/F+s/fTezAjOlvuJjrJnvoplgsmV8pT8M+rTAU8xJT8dsacjD?=
 =?us-ascii?Q?Z1ZIvDchObXqM+K5PRYnwRlynwy7PBX6jGJ7Ot079lu4FFoVyo1PptjgWk15?=
 =?us-ascii?Q?cvDXel/5i+PrRpwiLgADeTvb0RMilah5W7mYDdhtdKXlmUzLypSH9rgURquk?=
 =?us-ascii?Q?vGX2U7wWcdW6mBCWambalpBzu9jFwEciHaKF3tH6Ps9e7HadWHIubdV3EpJG?=
 =?us-ascii?Q?deHV3BQMbR+YZReuEKPNWbEK++U3ahP/yJQADYsA6Wqdg3XiLLlQPc2PV70X?=
 =?us-ascii?Q?uT53CW2mDlje3SQgFX1Q9aPT0wVme3Zni6Drf0DtMKXz6pbjNK2vRO+VU296?=
 =?us-ascii?Q?fa6Kc8ldUKhOUWNisy3q1UjybmjGBHr70QNaZDaSKw6V8pVLrToBieTGDxyw?=
 =?us-ascii?Q?pn7zRbWckhQCbcrCX/cJxjSbCC6XxoTvTY/xPQxFPu1prR8cIWBPIfNudg3G?=
 =?us-ascii?Q?HA2P0S1qVGvA778bMl9glovWAbYAg+pS8TBL2AkJN5JHqFCCiu5DNZ53rWyI?=
 =?us-ascii?Q?ZoDcooC9B0Q+m+lxqnDec/FF7znfeljflM2tngkt7iUp2LWHg1C4PhAQcSev?=
 =?us-ascii?Q?gGMB/A1sV8M30k/nz2qq1OQEoj5fEdPqs/5ogfDV4h4EzfIdhsODSC8X5NkH?=
 =?us-ascii?Q?GjsJOUP2yyAQ/4D/cIPqvCqwML4dsPflt1j041jaFDCfNy2D9SW2nPv4RlG1?=
 =?us-ascii?Q?16u7YWMk9qQFsxty4i66nOzw/cvbPQs0Ar/JCgnuFwz9f31e8HtNpYrc2Qmz?=
 =?us-ascii?Q?MDTVLFX8DEGkXZ6MRGLvZ81eM90Dh7AbwApkaQ1ZwiBc9L5L753HnA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(27256017); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Rv6mJoaJURJs19VqjjRraetK64O5PTyRCvL9xuOCHWrmsg4qt4FVLdCasBsH?=
 =?us-ascii?Q?kKEWD+1w1hKgp+TYjJ07wMxSVC72kiGD66ntFs42o8CjIipeJ4uFFh+tdgLT?=
 =?us-ascii?Q?CnLoRqrokDXwejWNHnvW+uqL9esTCK+7Kv2uKPaTCi04aOQ/a5Z7zt9i2g6z?=
 =?us-ascii?Q?PQnAS5HnHJVaD20FO8OT9LAc7RD9xt6zIEj+JYHWTYv4n0JUcS0CntYb8EFa?=
 =?us-ascii?Q?/7ys0EWdSe1zsZPpcz8Pl2aTno7PK2fAAioYA87BJ400XHb+tyOVzryFLfuV?=
 =?us-ascii?Q?wyup6WYlNvRBhjO7X1VsGIsPNezw7hg/vuQOSDCYBtz//u5VnDcmB3PIcKUK?=
 =?us-ascii?Q?J/CNIK+n5pMotRL4mY5ewo121wVdhdPR1JssVaah52nPcu8MEpm/6JZwwlYI?=
 =?us-ascii?Q?1f5wP/8Ot4YpdgTP/A/Kr+Iiq61Z8LSqwAwso9/7vvzZfTelKX4r2Uv2n0NU?=
 =?us-ascii?Q?gEJT2zP+SqghVNU/rdJ7nJr1s9krQxkysoCIeIfnLLq4QMYWJ3swV7W1+AXF?=
 =?us-ascii?Q?n5lcnmS4Dv0FbY2WbnWEtWsSLdzXRiFUTQEtxGhZGaacCOOWWmrqbj11/2HI?=
 =?us-ascii?Q?camCYncVCELN2lGG2I19/d93EaLHMF/vCYNEaA8elIjE+Ua1EhRJ9/aM56Ab?=
 =?us-ascii?Q?Vlr1HijxAcGo1EyTADDeSTU+45r5YXCEl24iClGbhOofqVx6Lli2WbWyxdu4?=
 =?us-ascii?Q?CPaeiSmHgAmMzFH+58qMb0xKYf0rKEXGQj13Ruyejyj9NV3DSnczCwQSvgic?=
 =?us-ascii?Q?vsOsxbDQdKQEK0R4tEOa3Vh0eCt3Gq8enScrUJpcFv0NWlP02PDMxXVfYn7i?=
 =?us-ascii?Q?POJXteNiwV5EyxdrYQ5ZP4EScYOI0FoOYIUwOQgEDG6xLFz3g1MIXD8bxRo7?=
 =?us-ascii?Q?1whrhrpP2rS8+Cs6twZeyuftwpuXu3G59svCFyndhk0FHBnOlFQuewXnvhrp?=
 =?us-ascii?Q?ZQ1DVfobbd6WBq4uiOBKM/IDRh8IiDWJaFIH4D9SEIEvylqifq0duqO0MLCe?=
 =?us-ascii?Q?3E/kANRkNB03Ha30q2jmXYv9qfCltAlTGJlAN13OABEe7rJ4I6gzt7ZrcXSa?=
 =?us-ascii?Q?EIZi/Bx70yahkMUjOx/Mfh/rSrIv9/sqLfA+WM1zUDNFkR7F+TJdmArAuszG?=
 =?us-ascii?Q?VrPZYdwzC/6p7ch+IJv0VfgobLiWvjMDnwe3vJYzLrMOsFWAel4xCB0Y6heY?=
 =?us-ascii?Q?fkvmFlStHQil2VEq7dZ+M/WbVy7lyMo24APPaZCTPdzUiOvTk5AwoQa3P/x8?=
 =?us-ascii?Q?oUkDhiMjWXbhej0PlbfkWVR/I3cFYFRXTTXsRPelpAnAsx8Mjqw1D7Ll3gv5?=
 =?us-ascii?Q?5QJ01UFVMzAK2qTyhIQjr2scxZWADkD1lBKm+56xiAucGhGcrVFNkultrq9J?=
 =?us-ascii?Q?4sSsCWx60IXJ7dMYU1c8sM+QKYMD0VJkK6DYKoDeP7JsII7oqG2dCiKX/Fad?=
 =?us-ascii?Q?27bN3lwoS9lrdnbFNjr8/2gC+lk1ljm5y6tRTBs7B4tih3k8/jJRBI9h6NS/?=
 =?us-ascii?Q?clSrrgkIajXvu077Tqk0h/KGiZw2rwCzXiQwLuwaKDD34RNgb27x+gOKRs8N?=
 =?us-ascii?Q?dlHhKMFiNMdcoZQrjGTYsLobXEKs7Y98snpfvy1sgvvVor8FKy++bfc0Q8da?=
 =?us-ascii?Q?sw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d8c146c-e07f-4cc6-a8d3-08ddb4f43d10
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 20:58:44.7724 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7reKSiHUJ2S+fPgo61P4nz3VsbWIu6mlsbfWuP1FIT40G8JzeCuYPm0wN+d43nWGbpXc9rw+8q0g/0w/4XPMbdE+rgRECDArWVbd1HveNmU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6612
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

On Thu, Jun 26, 2025 at 11:28:12AM -0700, Daniele Ceraolo Spurio wrote:
>Add the unversioned define for the PTL HuC FW.
>
>Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
>index 2584ee3b0316..9bbdde604923 100644
>--- a/drivers/gpu/drm/xe/xe_uc_fw.c
>+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>@@ -128,6 +128,7 @@ struct fw_blobs_by_type {
> 	fw_def(TIGERLAKE,	GT_TYPE_ANY,	major_ver(i915,	guc,	tgl,	70, 44, 1))
>
> #define XE_HUC_FIRMWARE_DEFS(fw_def, mmp_ver, no_ver)		\
>+	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	no_ver(xe,	huc,		ptl))		\
> 	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	no_ver(xe,	huc,		bmg))		\
> 	fw_def(LUNARLAKE,	GT_TYPE_ANY,	no_ver(xe,	huc,		lnl))		\
> 	fw_def(METEORLAKE,	GT_TYPE_ANY,	no_ver(i915,	huc_gsc,	mtl))		\
>-- 
>2.43.0
>
