Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CADF1C5B549
	for <intel-xe@archiver.kernel.org>; Sat, 31 May 2025 13:02:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 653EC10E08D;
	Sat, 31 May 2025 13:02:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M1ztFO+a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27ECD10E117
 for <intel-xe@lists.freedesktop.org>; Sat, 31 May 2025 13:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748696565; x=1780232565;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6fw89vZC3f4w2T7GXP2zPsw9mcMKNZohuAxMMdp0750=;
 b=M1ztFO+acZNu4PC3s5PAjaWBckkUsroivQ+QCdaAH0hv2Yi15Z4cBgO0
 JinsIteLR557ScgllamcMFFLK0cJK7p8yUHKAw4inpgeCtbLLMADbyzQt
 Kpp2H4yvdhogNrjlQ71g2SbalYTy089jcSoTdvqIlXeUgbMKnT8CSVsRC
 iPj7uvyq4sFn20eNGr31BR2qj9i9MvjMAj5pLEYBEezJMU7CilAv6B0Gv
 oygoQEzadzBEPiRHqF1MvwNbeBoEfPMTKdWS/s7wLPibuTQlxDXrr40oh
 fqB5GNWrVcOTadudiw6o31NI1Y84JQHVfxXJj4I/GadsNujvLJ+nVhyrl g==;
X-CSE-ConnectionGUID: a5zZZ+Q5SkySVlTigMtVJw==
X-CSE-MsgGUID: 0+XKAJ+BSPK6VcJXlLjZ6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11450"; a="73307206"
X-IronPort-AV: E=Sophos;i="6.16,198,1744095600"; d="scan'208";a="73307206"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2025 06:02:42 -0700
X-CSE-ConnectionGUID: T0XX2g5ISg2HSzoxHPwCGQ==
X-CSE-MsgGUID: pCpiG/9DQzq1XEu8SD0Piw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,198,1744095600"; d="scan'208";a="149277893"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2025 06:02:42 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sat, 31 May 2025 06:02:42 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Sat, 31 May 2025 06:02:42 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.64)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Sat, 31 May 2025 06:02:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xxNkxyoXt211jsLIPCgQrqha1XB9IXFJR5WL9FlEgRbUtJQ+2knzD30KAHpOh5rQj6G3pW9e+i7ihJBTo+0Is0bafZ5RUAdXpyTCUiZjmzItlXSKKQ0XilfvVcgJH7RNNRg4xgMZ9gla3Rra/kU5XSalFjobEaCho9iSYcDtFBv08+5Q0F2Cq+mWilKytRZpQydoRRKynIwjqOJBnvxzGDhqeJj8WW/RRl+dDcNO/gIMf4HH4EWgbSnq1Tjwf4pLOepW1Fi8pP8Yy17gj9iZNl6psstVEbxCQv6Q1jibfL6yeGsRc6e//t07XtLrSRmIRNpFgmlYBk3RjxxsOvY01g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=603wgvmO8Mo0XFnvY3esqOKeS5Z4uxZBX/nVWtUD7vs=;
 b=BcXYUB24J88zRzLN1bhbNp7P58XrRnky0jElL/WU9EAPAXSEOZ3Hb8VjELjXimeq6vCGkrEFrRn2kICu919u95P1ubqmDBWZm3nZUg1B7qj33R8wCoLpMg9fui9SH3esZnQZaLSRwsKLhUFiW5lQDzdgwJx0M/WogeRW1Xmnm6drhp+Ltxvj4o1luDy4tj3/k7UKpnGTrbxCSnOhuEt/dodE2dTFsCL5+fY7B4lRa6rUtiq6FFfouiSdjcrNZiRU73y5iZh35qPJj/5ko0wC1ZPF4lUVrnv4OZMj0lGxleLW+9GoqSeeNAUSkRh/5X+cpYP4ZDVEIzToKzBBcIasrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB7050.namprd11.prod.outlook.com (2603:10b6:510:20d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.34; Sat, 31 May
 2025 13:02:26 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8769.025; Sat, 31 May 2025
 13:02:26 +0000
Date: Sat, 31 May 2025 08:02:23 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH 3/3] drm/xe/bmg: Update Wa_16023588340
Message-ID: <2j2va6umcouyrudf77hq4zb5esywonbjagjdfrkqo5gigohofd@4ixwmnzewsnn>
References: <20250530082047.742183-1-vinay.belgaumkar@intel.com>
 <20250530082047.742183-4-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250530082047.742183-4-vinay.belgaumkar@intel.com>
X-ClientProxiedBy: SJ0PR03CA0277.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::12) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB7050:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ee41287-164b-41eb-edfc-08dda0436433
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bT77UtsisWdgexBFq8EN0IYjmEmLSYDJvOYzWr7VMQkUqdz3D+QCpqt1pdZc?=
 =?us-ascii?Q?9gHOEELFrip3j1WpWlZ4Vz1A1r8XwpFe/pCC1O5F9Y1nZ1v6ikNHouWAoc1Z?=
 =?us-ascii?Q?slUV7956J5ASnuPCVjYg+8s0ab5gMISrcmNhfkdRPdmH1qBgqRIU0DQn6u4C?=
 =?us-ascii?Q?gyuNIvrbA6CCLmM9xrw7mMzVMmBolPEa/LXs8/4K5ryTJlUWD65NHDmxcA/0?=
 =?us-ascii?Q?dwHI5yeQTszm78R5RQMO35QePsxoMVDDZKDE/t+VQ7S8ZyAoqpSoEvWyM1Xa?=
 =?us-ascii?Q?f/VrELT53e+DRnsKzLHRpPaA0RaaYgPc52jT39rdyG8093EA0Li31/3gN/Y9?=
 =?us-ascii?Q?feHnWePpRF/6Qy2e75yI9YePiDz5ol1PNaV+a+D+HvijCcbKGJeJdMWwLXNh?=
 =?us-ascii?Q?V35mcm1/TaSYQBrSNI6mCfYDTNfSOO0qNOq8w43HfZE8hcNllqpMO0lVGaKJ?=
 =?us-ascii?Q?ry3EhrD2Q3nexbY5Xa4ALk2aRg0NQoiKPlXqPl9/H89TE03xBzX7PWXDXoPJ?=
 =?us-ascii?Q?4812dX+r4D1h+gi/2x+buPcC50B9Q/W5GQ1Rbj94OlBk4K+0C8tFt+uLmKj4?=
 =?us-ascii?Q?77DtA0Sv5B7YfviN1etazBQHXkragfRDuIXkMhWmcR3egTrfah/kSKAUrqJr?=
 =?us-ascii?Q?hAj0Pp14sFjgwnVkwtUk5putJSgyhY3I4ApQOvftERwj9nqO6fFRdu0HE+xs?=
 =?us-ascii?Q?Pm4Ios/x+oss0v/kfnnuMEKzPS8Z3OSgy4ppEg43b9tb5aDlvZhPYYcErt8i?=
 =?us-ascii?Q?8aqDog/KzliOlzppYxe+MdrFjpildLMp1eMvtXixWlMX/jCir6JMJlvgOGXt?=
 =?us-ascii?Q?K1GA0hdPIREhgLvZeICuO0GaWiS7YsGAlh80itqT413nmyNoSeaRJsuQdeNV?=
 =?us-ascii?Q?X5eX6OOvEbk+/a+rka60JKqjGVPs9sZleiX71L3DgN0Xa2mdbmSCaPKnLSkz?=
 =?us-ascii?Q?biB2ys8GqLOlDWWa6zqCo4Y60HP/OdFnrhLEwrYES4LeRqM6t/dojaPADHty?=
 =?us-ascii?Q?cFnAeKC7aFAmkabWaQjJW/FJEZSUKRFLlFpaBEByyoDrZZPnoROYN1rtmhQy?=
 =?us-ascii?Q?Rz11Dj8s6kbedM2IU2fR4l+Q8mYaP0EsfInhYbqFUQ1spG0eDzeiAabQFtF5?=
 =?us-ascii?Q?4f2PYutceeUSvKU99To2DjuUFFBbAKJ97VC4FQTKopVG8s/CDgnmaWSmtlQP?=
 =?us-ascii?Q?HbCF86jHjftHm7/sBRHyfRKVmAZfxEalfm22E4R3MLtG5FJr0erm5dWVC0jl?=
 =?us-ascii?Q?0a4fpHc3Jm6UZyPW6IWdmPVIR1ieeacn91PklJwYzTv7lLpJ6DaxhB1I88tk?=
 =?us-ascii?Q?Ja/gJ6bcZj6TYDV9ceZbMXUxGNvqk/5mu5isbTJtp1+yotnz74BXUtH3CY76?=
 =?us-ascii?Q?4JDhNgDKgxwVrxwpDC9tvTghlmUctHCgnUsrbly0tLwU0WuL6bpi5AO3zpeQ?=
 =?us-ascii?Q?c8qex/dkb/o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6xVrkMKPH6CZW88u+n/E++nC43ISC8Zx1dqLzS8BIfnZtr5d4yhJ5JePEb+b?=
 =?us-ascii?Q?cxPM/Sp17evFEuB90NupKn96FV2tzw4v7j78JaP9oP2xQRMDMrSxPiLy3+rR?=
 =?us-ascii?Q?9TfGWBNUS0xaWp6/vZ+S3IrIKBEHUPewrIjBsUbF4bIZfhoI7vsktgSgKTkr?=
 =?us-ascii?Q?ncdOknkNNenXo6KEC9MIcqvn3zAxKb5Bfa9fPd36Qi+XrnkkniLjr6I14//Q?=
 =?us-ascii?Q?zXjIW9IC3LGOtXkXIv+qU6hhXCYze3vQz0+BY5Fq0Vqx4xRZDDJ5nSIJauJF?=
 =?us-ascii?Q?jlDibu2lllkJKz7hhtaSHOTxxCtxu2iKlBPSr+KJb3apXN1+FGFJpIQLjTk0?=
 =?us-ascii?Q?25xNwe2ddkMsHXo0vMw9DEZ9Eu3sbnK9SynyDcIP9mKko0BSIEOp+dc2AbmQ?=
 =?us-ascii?Q?c9apLdOIxLE5RrN6kh2Z59IxnajU1I80ajWSuSmXWROZqyCTGrh5r1pweNLn?=
 =?us-ascii?Q?a9sq5s2LPk+UJu063leREbSSTp2sNFJU/h7s+4S0iQcYNPkyTDrzpxPGNzpB?=
 =?us-ascii?Q?JQj2dk0aKQnKadPSY2+Nb/wuwhDsAWcfpPMrrm3OxwgNVJ0Nv18mfbSzNbZR?=
 =?us-ascii?Q?vLKzap8wlDeVqktLVNWgklzup7DRw3BCiHwubMB7aKj5wtljXjnaalOIdqUd?=
 =?us-ascii?Q?gi1A7TteXMQZKng5ukDGFOb0zMvs1mYB3dMh99Iune8AbKLolqpbjIYZEaEB?=
 =?us-ascii?Q?Z/BygyRdCChasp1BnM09g7M0QOyUXDNRQ8cBppuglwbfen0DjokYFMd4XdOt?=
 =?us-ascii?Q?duLsfy0bgBLP/lf8RCfXJbQJEnzYQclITUcns0RILPHw/yvwFLdvgnNI0Zht?=
 =?us-ascii?Q?JFt9B2Z0M4/0G8MBV0+Rq7dc0PGkMADNKnBoH+sbpfvxCUG+4Afc5c8/L/KP?=
 =?us-ascii?Q?vs/Ycjemoidvp8dT884tWBhlVwKAiLjZcUEPb7FFkFdDRmjcjn9O1DO+xHwY?=
 =?us-ascii?Q?lGVUrYphaVhEsEOmY6R2rbzrMRyf9CnrmswL2jXyguxdv188xKcfot10ZGnk?=
 =?us-ascii?Q?2PF6KjwNMpJk06QZS84GO5oKkym8Ricj8AX+k5mAWsC6R6+U6d7ArA6uTWcm?=
 =?us-ascii?Q?7qNtePz8TkWH7PBZvveIu7wmGeHlMxIhpUlxMjszKbyx/pggeKY5a3cK87MD?=
 =?us-ascii?Q?MyWJW8jT1Gp1w6EHzQw69ZG91vOiFMHa123fodemUF/jQxsW9ckP3gub9rap?=
 =?us-ascii?Q?CBzFIvPbq512nEmWehWjUr1+Fi7ubfSZa7M9NrrlaUVM1ZGCNnGHnTbFWkvl?=
 =?us-ascii?Q?6HGIOFKoW2Qw5N5CM9Cd5Zp9LGumw0gDo7vWVzTuARfgWJbPS+JjrMDy9hm6?=
 =?us-ascii?Q?2p3Btcg5DhUCmIIEcrH5Dxxa5dP7MGseWlb+szD79D+xLvmEzjUqPdflwppv?=
 =?us-ascii?Q?AryIQFFCdsHmwide7tyJP6z8E7SGqfOiC94FSAUPMruy1M5CvzZgazE92sbQ?=
 =?us-ascii?Q?9Nu5oGRimw3ipS7Ob4iYQmahqV+u+oWPG58J1t6NDYwkfu0/efSG31crRdTE?=
 =?us-ascii?Q?rSnYNDJmxfxbArSpKC/jPyfJHS0zUjbtWm+wrkTXPumYN3qV/h5y6enaDFwQ?=
 =?us-ascii?Q?Ea9biPO84A7Nu9+Yn+RJEBQgQk9J3xRzzcMB2q2JyPwt5nuNWfC73zpInDk0?=
 =?us-ascii?Q?Ig=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ee41287-164b-41eb-edfc-08dda0436433
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2025 13:02:26.2648 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Ba9JcODHfSLGKVpE2SHHP877STwd8J8H4O9K0eq/9pZ9niQn/Dtlx9F67IkHnaqM+uF1yTkSirzKEaXJyQt1J/X7c+0+Gysf0DkJ3o5x/A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7050
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

On Fri, May 30, 2025 at 01:20:47AM -0700, Vinay Belgaumkar wrote:
>This allows for additional L2 caching modes.
>
>Fixes: 01570b446939 ("drm/xe/bmg: implement Wa_16023588340")
>

drop the newline here... Fixes needs to be part of the trailers for
tooling to work properly

Lucas De Marchi

>Cc: Matthew Auld <matthew.auld@intel.com>
>Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>---
> drivers/gpu/drm/xe/xe_gt.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>index 0e5d243c9451..6c4cb9576fb6 100644
>--- a/drivers/gpu/drm/xe/xe_gt.c
>+++ b/drivers/gpu/drm/xe/xe_gt.c
>@@ -118,7 +118,7 @@ static void xe_gt_enable_host_l2_vram(struct xe_gt *gt)
> 		xe_gt_mcr_multicast_write(gt, XE2_GAMREQSTRM_CTRL, reg);
> 	}
>
>-	xe_gt_mcr_multicast_write(gt, XEHPC_L3CLOS_MASK(3), 0x3);
>+	xe_gt_mcr_multicast_write(gt, XEHPC_L3CLOS_MASK(3), 0xF);
> 	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> }
>
>-- 
>2.38.1
>
