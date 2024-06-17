Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FFDEC27C79
	for <intel-xe@archiver.kernel.org>; Mon, 17 Jun 2024 17:25:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 493AB10E337;
	Mon, 17 Jun 2024 17:25:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O489t5KV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9088710E337
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Jun 2024 17:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718645118; x=1750181118;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=igPFPUh/BO5/rJwiWjrIguDFZ4ztuo7rUE/DEzVxXCw=;
 b=O489t5KVAzB67ZB+fJqTSWqjrrrtkvC0U6n2EnuMyQMM8sa0UbQCuePa
 h4RMEcyh5pJAezsY/ePAQanIsdTZANizq7cPZNh4GocKdO/NvXTBEs/mQ
 bX+1MG5URqIyZgb9s17EvhF+O/V5Kjg99CGfs64F8YFZb+rzQFgSpsA1N
 9CmepZUKmgu4+ewGREssPLOD11Kv+tiy7Jvmeo9PUyS7mEmwSwulmqJPO
 9ldHcrjIfq/EsZFHRwsOYEHXqXWZcIkoXcYqulgMADa74nyK+57+6Vu07
 Qtxnfsi5Kz4mYPTj+c1mmsSIxeYePsWD2e0+pmi96aiTL1mdMPBtEV8Hl Q==;
X-CSE-ConnectionGUID: 00HHh5/cS8WUcH2K2g/25w==
X-CSE-MsgGUID: iP8v8pntTfWh52RLirSKaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="26899936"
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; d="scan'208";a="26899936"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 10:25:17 -0700
X-CSE-ConnectionGUID: OY06//iBQdO7pa1io8f6sQ==
X-CSE-MsgGUID: GfmEXHZtTXq8YVf5vBMdxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; d="scan'208";a="41966999"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jun 2024 10:25:17 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 17 Jun 2024 10:25:16 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 17 Jun 2024 10:25:16 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.176)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 17 Jun 2024 10:25:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gnQLZU5WZX7fYAkmzx/21EdMYRCmmyb8zfbljY4ulV02EF2Kz1k6yvY7VevEb5WqfIk/xGvhFN2nMSZRylLwXx4//H4Y5w4HUJszA2sH5xN4flidQzvXoT7BT73AVty4xypX1xa/LQ9RTBQJIGwdbkmQqM5mp29DlTbnXfdd9YdGphbDmzWORxS2J7Ro20oH+HRIhr4923tVmUSZeVEHRIN0N+aqgys0tJIirg4lYHMv1By8f58R7wyZ+HyvmXRWkYT5zD27kXNUuO240166rmAfX6a2wda967UPEhkNc/Ct9mDhLrxkwV4FCsSGN7EoUy3pAq7dapKehsJi5w5B1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BBNJauWDDLIQ7mPYh8uJLYhAxeJllqD6BczjXO4O4XA=;
 b=QU8ZJZ0R0MNzRZKuNtjjYnTjbJg7ehkaePPuJyQX7wYVzUTyJ7y2wiuGeDBU7bn06q+Nc5wlPzejyxLJAJuV+GTQGX/TIjqwFHaR6C+77/jpGoKhl/U9DTSuUwaSQ5fMJR5RVFaQ37HAv9MCpBROi9+NtPsp3Rl1Un09avhfD4w+nVX7Cy/2oKjGz0apgVyU0BThj1x1hgvd9cvm73v6JzrtV1B4hkSQ4iPFkohhZk07mTb5mqIWAE0thGHKOTVJLxaYJEjtIiNO13yu1TNiC7fgtRFO1J8u75QFdGrjLqcaPAkLG7sdOrOO+WJGSwMKEm/tbhZ9vq5ExpURv8nxPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB6478.namprd11.prod.outlook.com (2603:10b6:8:89::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Mon, 17 Jun
 2024 17:25:13 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.7677.027; Mon, 17 Jun 2024
 17:25:13 +0000
Date: Mon, 17 Jun 2024 17:24:24 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [RFC 0/3] FW guard class
Message-ID: <ZnBxSFpuGjc9c9KJ@DUT025-TGLU.fm.intel.com>
References: <20240617143430.641-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240617143430.641-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR05CA0015.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB6478:EE_
X-MS-Office365-Filtering-Correlation-Id: a295d5b6-7552-4764-2b03-08dc8ef2728d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|1800799021|366013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BT/CssevqqONJGjlkWfGr/53rTVC7DmjiHIg3bonmQK1YW5nMIhyX5BcSPbX?=
 =?us-ascii?Q?1I6ioSVQMOBSYzBf/NCagMytwcHp9iXp6bTRB9uaOfY4ivW7H2UQWd+eHUvw?=
 =?us-ascii?Q?HL9HRd6X9ApA9PfqNtk6g0wXhri4Ucsi5LgXYwkC+ffXcaydeDJqJ49LJk0B?=
 =?us-ascii?Q?bRjCkjS2LLG5xOUGXmDGMASvz1P+izuLdFMg9CS9TqGfqYDJLIYp5q5TUnl6?=
 =?us-ascii?Q?T86hsQznjmbsDD3WUAKlEHi4N/iXxeIyTqKw+LX8tWjEw3xxw9FkEq+Gyycd?=
 =?us-ascii?Q?JXmYcLYxzEXSbNyhEVxUnRXI5H4qEtFuPNOGJkT8L/t0uuboLbgzSEmTsvVU?=
 =?us-ascii?Q?IQVCgYlOSIOwTUIWvBkqHDRLon3z2Dwf02UX1ucE9HVJmHPGIuN1OnJB1Oq9?=
 =?us-ascii?Q?k7InZA11Jy0Lfh88UYB2IfPCZx8MXCfmLiLRwBku5X+yGu9hiJ6ocWtYQKQL?=
 =?us-ascii?Q?fAwNiii6/JcMeSsSMyqNqrHmZDXtg5rxGka13T1Goq9WWeyj4L+kGvl/Evwj?=
 =?us-ascii?Q?mZYNMlXkUhboSMbi4TXtSDO6Lvm2FQdgvqSc7iC/oRE2mm7Njh5I2TOHcNH3?=
 =?us-ascii?Q?295K1GArIYXjyfODz8EZZvrgTXPRSjd8YZKH2eR4vx5VaXfNUB0LFHIuOT+5?=
 =?us-ascii?Q?EK3Cc94jKfrO9HXxk80jtLdzon7SaaeZ4Y0McLfgtspb10sqMT7qV87u0TCu?=
 =?us-ascii?Q?vX6o7XZY4SUGKqUilv45+21JYsnsu9WntBL6xCLEtNjDGRKidWDfmFBSt2fT?=
 =?us-ascii?Q?vSOTgBRjfmWwa9NOTDazg5UEhYOBkCXl4pF+V8q0wTDbFNkztjTPM7aypw3M?=
 =?us-ascii?Q?bllOpy+GIZTZWeEVtwbOhiBzfejy8FHuhNvDP4awQBx50Ex/5ggc4PFOkUMw?=
 =?us-ascii?Q?ur+Sl+7Kb45DBfrJFsMcZUtIOo1S8pUvvMxSunGKnJQb9jPC5YuTmGmrmE7E?=
 =?us-ascii?Q?WQSut7u8w5RG7Cq/4ftzFQBdrnJ7LtXlWuNRoLKFXyFGB1vMzq7QPk/CCNEw?=
 =?us-ascii?Q?oSjE/hmKC66yoLmNXeuPgGzeMwMDygBWODSmzOwvVDrO/fXDxyE7AoFvs8EY?=
 =?us-ascii?Q?gjos2aKK+VCEh98iWDOlhtRV0B8C87Kg9NpSCXm0LhP5Nsbp1CzGL8OGXUbt?=
 =?us-ascii?Q?+bOlvYxldzXueMmNBidKNe/v3c84JhaIoJAavlsPi+1ED34uIKUG+gKrQHjY?=
 =?us-ascii?Q?hTsQtCkoTvHnlP8cF0Neb3hXSK7IFxubaiAdXUoN8VU/KiuP0OLkUdUMfgky?=
 =?us-ascii?Q?MexE7A4XpiSDEnZE6AcUbpMsCXsAzeiKwAJKfCT6s6tHs/COumouPiomX+ur?=
 =?us-ascii?Q?dNk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(376011)(1800799021)(366013); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jNSuYYnT+5W726LgrTMBKJ+r1HBuvWTd8XyUR2IaBp9evHZqrMICtlVu7Gwp?=
 =?us-ascii?Q?HeOxgIeN5zbxFz0PdQLL/hxG6L0z/RnjpTLPJK6T/1iyiJYKKvkHCZR0sdw8?=
 =?us-ascii?Q?o0kY/DE1OpH/aBjkq85N7H92Eg05LJ6qQrQk+ud5t7/833nh85Bydg2U6qoI?=
 =?us-ascii?Q?8QMBo1xcRuXW+OURdseUjWBYLh0z204KTu9d7kcw9PvsFTyMNsJGHuFuP7f7?=
 =?us-ascii?Q?vPvw7kvOUEahBMBV32GmTzPuPqb4fYEyHv3qCPdAApYEK/kMaF4CYsvlBcxw?=
 =?us-ascii?Q?b4Liz7BYRhKxuyZ39Z+twQ0d6bzVO3ZxOuy/TUgmoqydSIPvknD1KgNx3urg?=
 =?us-ascii?Q?SuWohi5ZUYiIe2cbMO0iU+O8TDfvrk1yAybyfDDkrZUQptfmxnkiyqT8N4kn?=
 =?us-ascii?Q?e9gzGiHBhwuqzMzbODOURdfKV4a89uQMD7qBv41qgol6QKt2a/oaX9n1lEbV?=
 =?us-ascii?Q?45tUKY9khpDabycrMhOOED9B7bZtgNC7Ly3imJFveLHNysBXoZg6emMOUdgN?=
 =?us-ascii?Q?r4Og5nW8+dFlzMIw/Pfpto73twsflYzYYizPMzag5u540hnKEhlWhn7p5i+1?=
 =?us-ascii?Q?ecOyJqtt7sen1tKiBhHjsU0jJyyCfqRQWTIXmVvllwWX0bcWeH+W9zvu/6nn?=
 =?us-ascii?Q?Mlk93nVFw+maXiT2VkpfkAv2zKjXLe2bm2uK02YEBrrwky/z7gf90Z+gU4Ko?=
 =?us-ascii?Q?EbUF+YYqaD/P3V4U7wMTKeZItbOuxz61lJ+pDSafVyjtmdwVRMfzsLTbr2eR?=
 =?us-ascii?Q?LxIG+6iX5UO6jULGfUqo0Z3ejL3MhCmrQXwIcGHQTRmBa3YQcTi2DjZ2qOXV?=
 =?us-ascii?Q?mYDvSjYBosDcythRAD9CGSRrWizyDBQRYDOsYLahWScNuNk8q9dzS+J09kKY?=
 =?us-ascii?Q?EYNwxy3QO+pn04w177pjzfTUe5wWFaxYZAUymX4aIPylOr3t57QrkmTXmZZ6?=
 =?us-ascii?Q?TnqTl1b7bAt3QUNVKfFZyh4uRUJWn0ZqDnjBZeGrq3NXCUlzoxdxEntirIMe?=
 =?us-ascii?Q?kI+XrfDWbGTTiYC7RwNUbtGoxrhjLZHFvz2Qwzabflp/o91YVS7YguwJrRlO?=
 =?us-ascii?Q?0Omgn4WZ0MPYPU3yUJaxECx3ORNI9uLVMH6tdrdbnGJMhXEv9mLnZjFqu52G?=
 =?us-ascii?Q?0bXQmOHOACUv9Z53TTQCvtctTsuXAh5qcSqIZ3P7z1ib+2yTrGG5WyN7rRpb?=
 =?us-ascii?Q?uV5UQctSO0Xj8C1NNb6QUNpwEqDSatcoLH93aAL0D9tbRn1crs3+CJxdeCx6?=
 =?us-ascii?Q?pmzReoHKIqvN8OcBCi913EV29reAtztp1HSkPA3FUpTMuGaCiFive6KdQTgW?=
 =?us-ascii?Q?zOACS+P1p3+/2LHcjJaucLu41H52/zMRXS0CCOBOJhyqAKioyTUYtoEW4xgz?=
 =?us-ascii?Q?nhm4X/Ft4tvDjp4GLTDRPUqkKp/B7RtFp4tBIwuA52TxaABUXZG/qDn8IX0v?=
 =?us-ascii?Q?o/CaY7rAWKLozmhc4AawJW/+iZVoJ66TugqxU/66/RlcMIBQtVh+cYlBb/nL?=
 =?us-ascii?Q?LYhLjbK2lEVs3h8nLH40FpO+e5+pUiVuLqIZmdx0ZjJJnim4NXCQuSEAIk2G?=
 =?us-ascii?Q?pyW0bcDvnzyqdlvubwRVqr+XnTcRzxEbTqU6IJ+XvPw6gVtn8MUMY5pIcJ74?=
 =?us-ascii?Q?Pw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a295d5b6-7552-4764-2b03-08dc8ef2728d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 17:25:13.6401 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rblEu/zBEM/U7sEgBgirOaAbsG3Aey2kilVWOeLt2jcir12zxkoAxJhNDWZwngB4UE/561vq62U1yiDUk00NZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6478
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

On Mon, Jun 17, 2024 at 04:34:27PM +0200, Michal Wajdeczko wrote:
> There is support for 'classes' with constructor and destructor
> semantics that can be used for any scope-based resource management,
> like device force-wake management.
> 
> Add necessary definitions explicitly, since existing macros from
> linux/cleanup.h can't deal with our specific requirements yet.
> 
> This should allow us to use:
> 
> 	scoped_guard(xe_fw, fw, XE_FW_GT)
> 		foo();
> or
> 	CLASS(xe_fw, var)(fw, XE_FW_GT);
> 
> without any concern of leaking the force-wake references.
> 
> Note: this is preliminary code as right now it's unclear how to
> correctly handle errors from the force-wake functions.
> 

I'm personally don't like this at all. IMO it obfuscate the code with
little real benefit. This is just an opinion though, others opinions may
differ from mine.

Matt

> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> 
> Michal Wajdeczko (3):
>   drm/xe: Introduce force-wake guard class
>   drm/xe: Use new FW guard in xe_mocs.c
>   drm/xe: Use new FW guard in xe_pat.c
> 
>  drivers/gpu/drm/xe/xe_force_wake.h       | 48 +++++++++++++++++++
>  drivers/gpu/drm/xe/xe_force_wake_types.h | 12 +++++
>  drivers/gpu/drm/xe/xe_mocs.c             | 12 +----
>  drivers/gpu/drm/xe/xe_pat.c              | 60 ++++++++----------------
>  4 files changed, 82 insertions(+), 50 deletions(-)
> 
> -- 
> 2.43.0
> 
