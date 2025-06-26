Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DD6AC7EE33
	for <intel-xe@archiver.kernel.org>; Thu, 26 Jun 2025 22:19:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4011A10E91F;
	Thu, 26 Jun 2025 22:19:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RHtOERoc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CDB610E91F
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Jun 2025 22:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750976346; x=1782512346;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=yYi+vNkR2peG8+nf5PSVZ1cvoQFXk3+9SXR12g8/8r4=;
 b=RHtOERocN3EoaQBAKy5oPHIXQCtbTSguHFSO4ju9/P+OLGywsEpf8IvK
 mI8E4r0M4peqh5+RxidhgdNVPWdFy/iJKEOMem/xE9arwt7orX+y3RpBR
 5XRYCPbTRnqStzRzZQ0iF57c5i21TS87ayr8lGaUinziYgakmaT3+ebq0
 3iBFhtr/oMbUsLNqhzT0V9dVPjhBrabgtrcuRs+Iew630uGV7bz3ZObd2
 TJ+0gptf2d+MA06SylUDv/JhNVxcft5DF4ctUFYdEVxuIPD6xAoujKe99
 eNfE+pkvpED7KoDuc5pN7nR1IxTKxQRtLpq6OOkgCv9rLjMUTveuOA9yY Q==;
X-CSE-ConnectionGUID: Y0LxMaIoSp2FHC5hgVDYwA==
X-CSE-MsgGUID: 3l5oAg5PTf6XczD03DczAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="53230063"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; d="scan'208";a="53230063"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 15:19:06 -0700
X-CSE-ConnectionGUID: 5rCYM30cSuWGl+1o11bLkg==
X-CSE-MsgGUID: 1/L0ri7nR+uRT3fSYDfmIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; d="scan'208";a="153156838"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 15:19:06 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 15:19:05 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 26 Jun 2025 15:19:05 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.86) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 15:19:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hX1tsRe+8TJHedNN2ydziBIAOUH+xKZ/3bWRwXWcuqbFtw2RbCFtI3rEJopLb3MFE7HZsxmdxISVUFmFfD1HrdixTUnzuv/Yv4PGzejJbUR3gKRjdd1CR3g76bz4GHnQHucZIMSFGFhetKLhCGD2eTZSiX7dAzzOKg58bcA30yrixSvhM22kjo1vX7Sjf3ynFrw042UGpQZoH9kSl7arGFG8eP0LMyD8h0qsZKT2j7zmCrmLszF/44PKSY3+5T71QwhAn3yF14RnbXAiKm+vbaVx026FvNT8V6kCQBWp1Mc7ZkwRdJwGnRGmsFTF4kvWiRj+6qNZlh3h6TCEo3shAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RdvkqIeeWwJTsU6/5EoWKqNd7THpbwsu4mZz1KBZnLE=;
 b=p9AurYYibl5o8OhVN5JWCous2MUXHAj8FX+NVVdH5VMFZbQ0rIEwsh6ILkqI7I7JHvf7WM7qdh2i2Xd2BcifSHECfVUt8ebmmMSgDGzyC57/dpi+wMqcWyLpF/hpzbpeFAlHyOtDvyAzTrBA6pfCAt3qhkVmJU7QWob18TseL26MnQNKbAjW8Na7INVnOHv0j0TOOAqoUXgEQgMi2eV4f2e6P5vGN7OIlOaYcYZQ3OpzltcX2BzSPl6M/ezHroHOCCxy6mHZpOGHLxG9WbntuqMqXHOovlj83a+FkRbMOq6AIs17UjPi/+OEjmzZXKuevUbcJQRgD9z2jv+q3t+dOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ5PPF82E3BEA84.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83b) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.26; Thu, 26 Jun
 2025 22:18:48 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8857.022; Thu, 26 Jun 2025
 22:18:48 +0000
Date: Thu, 26 Jun 2025 17:18:45 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Atwood <matthew.s.atwood@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.d.roper@intel.com>,
 <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v4 1/5] drm/xe: add xe_device_wa infrastructure
Message-ID: <e32xs4z6scq6fmrcvpviivfmxwyn5u4oatyeatmoxs552hioqe@4bnsou2nbldk>
References: <20250625200751.205166-1-matthew.s.atwood@intel.com>
 <20250625200751.205166-2-matthew.s.atwood@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250625200751.205166-2-matthew.s.atwood@intel.com>
X-ClientProxiedBy: SJ0PR13CA0024.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::29) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ5PPF82E3BEA84:EE_
X-MS-Office365-Filtering-Correlation-Id: fe51b0ce-9ea1-4953-e5e4-08ddb4ff6c63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4D8ElfWTQq5SDGTkYI5r4VuCwm6VpZ4+OgfBIsCKBLTTKRCZSKEbwao+kQmo?=
 =?us-ascii?Q?Fsa+XiP7gBFL5mCuMjAJQhaiWpLvY92DRz9mo+78BvPwUFM6HMFkwMXSVV6N?=
 =?us-ascii?Q?Sk8nvCbhHFE3H3ajjdQDSQc9V2n7QSmWV3TEoGJNGYU8ytjnq4AiG8hvPbLf?=
 =?us-ascii?Q?iOqwEocUHfzGWFBXJKbewu0IJh++DMn/JI7Ly4I8qhLvjk4I+1QHukM15bb1?=
 =?us-ascii?Q?SPVNuQRHbkpLeBePx67kk0vzLaKDZgmDR0wsTqunUGZljJaD7KqW9EZD5yIs?=
 =?us-ascii?Q?L+Og5NLHjO5+9C3SaP00xqYLbHuWqxuVwR4sNCBq74WF/xND/CkvIexUd8Jr?=
 =?us-ascii?Q?BwN30deoLR7Tj70cYlnNlM6wRIMGC/AjXfAt45F70GgEynuW7WeCjGO9XiBH?=
 =?us-ascii?Q?4CSvbSnxXohCr5Jqxyf5i+T5vkAjHYlBpZSN4sqcp6lNwhgKwMnCdA9xrUjR?=
 =?us-ascii?Q?rRATKh9W0QcqdSZD/W46cRbhGGhRCwnBrXk4FD/ZXfYPtypUg5wraeq82suu?=
 =?us-ascii?Q?y/9Ed+lWQiwF/tGyusVmjHmuuTVesNOaxxE3EdX8n07cBLxBNp5Ms0OyORvC?=
 =?us-ascii?Q?FnoquMNrd4bfnHy407q0AFEB9NLZgvWD5AKsEfyhrPcjaHc6uFkYlygjl5KM?=
 =?us-ascii?Q?ZW3xpA+2G0I4Jz7HvUHgb0C4wbbZ0bhcKtXoWcNotFrIlRb0D3vZ4+JjcD4P?=
 =?us-ascii?Q?0Xkq7nu0plgWFzDNTbh79s7veZOvmgrtffBcImIIkPz2oWrhGdvSwJ6tPcRc?=
 =?us-ascii?Q?tmkK4OKITXCh9lBARn95bkHGXcDBgDNaSZW5hA7rIQVxFgNi5jDVyCjF1jcr?=
 =?us-ascii?Q?dHIKyCKwZjadEALdjwETAw6RH6XQZPX/twWMBiTVuWJCm/SKc8J7qqOK2OYh?=
 =?us-ascii?Q?lss86VuWLPx5d9fkUVmWAXn91IEQGDy7L376juc49lm3oJUhMiOYDJTGfub2?=
 =?us-ascii?Q?S9TBQztmEPq597v4w2iFIjjk3JBKfbtPYqG6u2Hb+q0HmID/cU0V76W+bhQT?=
 =?us-ascii?Q?5xq1j2+tt7mMtDHfpFhCQ3N3hAht3509ruFKukG200gwN0c4a7KFRWgnvIyD?=
 =?us-ascii?Q?EDNpbOm6JtW0wnYOBjaZ0RpCPXsbKwhEhVxgyFfGtggtg4CDEOW5esjUd3GI?=
 =?us-ascii?Q?qaNE3R5QrxYp4bT+u82bvizMl2LGJ43xTyibcsmXsK3gUMjyMnQN1uWPRHnl?=
 =?us-ascii?Q?hRcSR39zR2E6dn0GemYLpk81ekxqpAxxRXLfMjF48rYTYA95QIG6YkEnBFTV?=
 =?us-ascii?Q?JpwQvf8OsAHSq+duh/1Yu1h4VPQ9/X1HDE5JtjwW1uP4JOoVCRElhuHUM6Nb?=
 =?us-ascii?Q?u3On7LPPcQqVKhynmQPlt13FzNTVDX2/CIX6RoMjXlKEQWqk5/fe2aIPWal0?=
 =?us-ascii?Q?1ewxstIt9jTchvjLIrv0pZSaETxb40ipwcJn13WvF07+Uc5OsbsdwbMOMc11?=
 =?us-ascii?Q?RLSAb3SRt04=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5jL0GaqMk5rGafIBbJYwtN1L2e1VqngMGPbithAyROWpIfwepl3rw6y4NXGz?=
 =?us-ascii?Q?SK0kAgoNFswZkvQQOnYU4ORQlMPOk+R4mAOL6HZABurthBJ7NXqJQv6lslZ1?=
 =?us-ascii?Q?W9/L3rzsV8T07mglZD7aTpxKdgRDfrZF44MtAh84496PutxEt9uaYZUsFrTr?=
 =?us-ascii?Q?DotBhoK8H2XRSp/xtAuUNgWk5DODtCSdqnKZVyECE5x/YZrAZKTLNBhAKcLR?=
 =?us-ascii?Q?UrpRbyRPf5OBlVVXDSH9FqlpuGEdwh/DgHP2HEzNuBgxZgFRvVDLC09RJlIn?=
 =?us-ascii?Q?0nhCXT3+P3kmAz9NyfvqW0O2qFzDG+Q4gjdbXOGzdAlt2mPjKIdrQJS20RNO?=
 =?us-ascii?Q?6slA43lbLfaajXrGZ7x3H044eeWvrnfmkrGoPHozNbkqnizXVbL0KxEC5hs4?=
 =?us-ascii?Q?K/Wro0DFSw0xEsx9ilRNZO/xxkeCBb0/F9T9jkoxpwc9CCzttLgnmQ7C7v0h?=
 =?us-ascii?Q?x4y28sOaM+5HEp/3BT0FK0M4HtoetE+nmISdaDBkg4fOLxXnW5fouLRL1SRg?=
 =?us-ascii?Q?8FiGk0ntScvXfNAleGpyRU7II6qyXVm+dEAc+NxhFfJ3xgGs0gPqxUvR3+kg?=
 =?us-ascii?Q?U7fVBl0XVAXSk5HrpONC3shYTI7m99T2TZK6p/k0QWM+gNFOLLifionbDmGY?=
 =?us-ascii?Q?i97bmN6T5pSiisWikomF02nZYbP4/kAiR3YYQeB1l8UcoPPcQ2q3ttQoJBlW?=
 =?us-ascii?Q?gDpI4TxisKuKW0AB0r8+9wizB6bydrKmG/dF+HSg7qU/6pfw2VRis0Tky0Az?=
 =?us-ascii?Q?3uM7ENKTmI41r17BKHtyixfKInblwYcDZX+6Fj/KSVzkX5MeWbO0BzsAsf9G?=
 =?us-ascii?Q?lVGmbLWpk3AUwUPMnNqwPZP/v9OopdgHvjfh3QCuiRWfBHe/goj+cqmng493?=
 =?us-ascii?Q?bDqDYI7ERXbeKBhyYezKYHJPMlwMljHAXlpyMkeG+1qkplSQy7M8042+q5aC?=
 =?us-ascii?Q?9eDV5PuX53RBe7eCdj7yTweGCss/bem65mudpWV0Oq47rVh5+GwFrTOlHsAT?=
 =?us-ascii?Q?rH0uPea2joK4VpiT+XV+ZvlC3sZWG2MV/O6evBHVdrpg2kZg0wcXqzyAOuIW?=
 =?us-ascii?Q?EBOC0LOQV+CKV/dKZGPCuOAH8gnLmOTW4rJCqQkdIYxusHXxFNiF1nertdG/?=
 =?us-ascii?Q?1B18YNeWBnlUPsaHfTg0loEpAIG/+PhIsQDXKkTPQ4PQ08r3JvQ3ZMS92/US?=
 =?us-ascii?Q?6Gcuzr9Nz6r7de3GaxwR3LdhOHa1Cc8iovCF2kRMP8bZjl7HKXVcfnloGQJq?=
 =?us-ascii?Q?kAMmwdr/VYHXfmvFIpZ8o+RTyIei45DURGDfFTazc/6sHZhk1gA0HR8byvEm?=
 =?us-ascii?Q?fPFpy0kuhvuAIUaLaF/zZbY6nd5248lPRmaF5Mt47YCWW5BnaocFEM1G8VzC?=
 =?us-ascii?Q?9g94Z+wH9feiuVFu3rqyWomJbEv+MWdcLQww5mTC+eebgH78UElNSbRcqO/2?=
 =?us-ascii?Q?uT8MCMIlLoq2iDCRQJ2OVnx0oUpYjZixSN695yst2IMqcA6Z0+tsKozqBN4/?=
 =?us-ascii?Q?gGqGtGefcGaEa1P7N2STH6Elgu2W5Ou63yVTSsa6UEPfjqHw8GM64+0wWncn?=
 =?us-ascii?Q?l3Isr/q9wY9HX70b7jU9aVEaKplvhPoBipZFFCmVMUJTHx792zxtqpow8mfQ?=
 =?us-ascii?Q?9A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fe51b0ce-9ea1-4953-e5e4-08ddb4ff6c63
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 22:18:48.7101 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pU0LqXQ+XEQFVroz5M6UG2s/jHoZ/sSqQxovU43JPicd+On1JXi+lAwiZv2iWOX3Eob+Ol6FpA+zvvJocOg0ri7uR0TGwUeJPj8MNa1t1+s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF82E3BEA84
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

On Wed, Jun 25, 2025 at 01:07:46PM -0700, Matt Atwood wrote:
>There are some workarounds that must be applied before gt init,
>wa_150154044425 for example. Instead of sprinkling them conditionally
>throughout the driver as we did for i915 generate an oob.rules file
>reusing the RTP infrastructure to make these easier to track.
>
>v2: rename xe_soc_wa to xe_device_wa
>
>Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
>---
> drivers/gpu/drm/xe/Makefile               | 11 ++++++++-
> drivers/gpu/drm/xe/xe_device_wa_oob.rules |  0
> drivers/gpu/drm/xe/xe_gen_wa_oob.c        | 27 ++++++++++++++++-------
> 3 files changed, 29 insertions(+), 9 deletions(-)
> create mode 100644 drivers/gpu/drm/xe/xe_device_wa_oob.rules
>
>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>index eee6bac01a00..64498ce2a839 100644
>--- a/drivers/gpu/drm/xe/Makefile
>+++ b/drivers/gpu/drm/xe/Makefile
>@@ -21,6 +21,15 @@ $(obj)/generated/%_wa_oob.c $(obj)/generated/%_wa_oob.h: $(obj)/xe_gen_wa_oob \
> 		 $(src)/xe_wa_oob.rules
> 	$(call cmd,wa_oob)
>
>+generated_device_oob := $(obj)/generated/xe_device_wa_oob.c $(obj)/generated/xe_device_wa_oob.h
>+quiet_cmd_device_wa_oob = GEN     $(notdir $(generated_device_oob))
>+      cmd_device_wa_oob = mkdir -p $(@D); $^ $(generated_device_oob)
>+$(obj)/generated/%_device_wa_oob.c $(obj)/generated/%_device_wa_oob.h: $(obj)/xe_gen_wa_oob \
>+		 $(src)/xe_device_wa_oob.rules
>+	$(call cmd,device_wa_oob)
>+
>+
>+
> # Please keep these build lists sorted!
>
> # core driver code
>@@ -339,4 +348,4 @@ $(obj)/%.hdrtest: $(src)/%.h FORCE
> 	$(call if_changed_dep,hdrtest)
>
> uses_generated_oob := $(addprefix $(obj)/, $(xe-y))
>-$(uses_generated_oob): $(obj)/generated/xe_wa_oob.h
>+$(uses_generated_oob): $(obj)/generated/xe_wa_oob.h $(obj)/generated/xe_device_wa_oob.h
>diff --git a/drivers/gpu/drm/xe/xe_device_wa_oob.rules b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
>new file mode 100644
>index 000000000000..e69de29bb2d1
>diff --git a/drivers/gpu/drm/xe/xe_gen_wa_oob.c b/drivers/gpu/drm/xe/xe_gen_wa_oob.c
>index ed9183599e31..d8bb26317f28 100644
>--- a/drivers/gpu/drm/xe/xe_gen_wa_oob.c
>+++ b/drivers/gpu/drm/xe/xe_gen_wa_oob.c
>@@ -18,8 +18,8 @@
> 	" *\n" \
> 	" * This file was generated from rules: %s\n" \
> 	" */\n" \
>-	"#ifndef _GENERATED_XE_WA_OOB_\n" \
>-	"#define _GENERATED_XE_WA_OOB_\n" \
>+	"#ifndef _GENERATED_%s_\n" \
>+	"#define _GENERATED_%s_\n" \
> 	"\n" \
> 	"enum {\n"
>
>@@ -52,7 +52,7 @@ static char *strip(char *line, size_t linelen)
> }
>
> #define MAX_LINE_LEN 4096
>-static int parse(FILE *input, FILE *csource, FILE *cheader)
>+static int parse(FILE *input, FILE *csource, FILE *cheader, bool device)
> {
> 	char line[MAX_LINE_LEN + 1];
> 	char *name, *prev_name = NULL, *rules;
>@@ -96,7 +96,10 @@ static int parse(FILE *input, FILE *csource, FILE *cheader)
> 		}
>
> 		if (name) {
>-			fprintf(cheader, "\tXE_WA_OOB_%s = %u,\n", name, idx);
>+			if (device == false)
>+				fprintf(cheader, "\tXE_WA_OOB_%s = %u,\n", name, idx);
>+			else
>+				fprintf(cheader, "\tXE_DEVICE_WA_OOB_%s = %u,\n", name, idx);
>
> 			/* Close previous entry before starting a new one */
> 			if (idx)
>@@ -117,8 +120,10 @@ static int parse(FILE *input, FILE *csource, FILE *cheader)
> 	/* Close last entry */
> 	if (idx)
> 		fprintf(csource, ") },\n");
>-
>-	fprintf(cheader, "\t_XE_WA_OOB_COUNT = %u\n", idx);
>+	if (device == false)
>+		fprintf(cheader, "\t_XE_WA_OOB_COUNT = %u\n", idx);
>+	else
>+		fprintf(cheader, "\t_XE_DEVICE_WA_OOB_COUNT = %u\n", idx);
>
> 	return 0;
> }
>@@ -157,9 +162,15 @@ int main(int argc, const char *argv[])
> 		}
> 	}
>
>-	fprintf(args[ARGS_CHEADER].f, HEADER, args[ARGS_INPUT].fn);
>+	char *device = strstr(args[ARGS_CHEADER].fn, "device_");
>+	if (device == NULL)
>+		fprintf(args[ARGS_CHEADER].f, HEADER, args[ARGS_INPUT].fn, "XE_WA_OOB", "XE_WA_OOB");
>+	else
>+		fprintf(args[ARGS_CHEADER].f, HEADER, args[ARGS_INPUT].fn, "XE_DEVICE_WA_OOB", "XE_DEVICE_WA_OOB");

We could just derive a prefix from the argument rather than look for a
hardcoded value and use another hardcoded value.

	char prefix[128];

	...

	if (fn_to_prefix(args[ARGS_CHEADER].fn, prefix, sizeof(prefix)) < 0)
		return 1;

where fn_to_prefix() does something like (totally untested, just to give
an idea):

	if (strlcpy(prefix, fn, sz) >= sz)
		return -ENAMETOOLONG;

	for (p = prefix; *p; p++) {
		switch (*p) {
		case '.':
			*p = '_';
			break;
		default:
			*p = toupper(*p);
			break;
		}
	}

Then this is a "prep patch" to derive the hardcoded defines from the
filename, which makes sense in our case.

Lucas De Marchi

>+
>+	bool prefix = device != NULL ? true : false;
> 	ret = parse(args[ARGS_INPUT].f, args[ARGS_CSOURCE].f,
>-		    args[ARGS_CHEADER].f);
>+		    args[ARGS_CHEADER].f, prefix);
> 	if (!ret)
> 		fprintf(args[ARGS_CHEADER].f, FOOTER);
>
>-- 
>2.49.0
>
