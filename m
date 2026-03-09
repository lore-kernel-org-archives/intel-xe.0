Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B7F0FCA191
	for <intel-xe@archiver.kernel.org>; Mon,  9 Mar 2026 23:03:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F52910E5DC;
	Mon,  9 Mar 2026 23:03:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kv66oU6t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FA6F10E5DC
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Mar 2026 23:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773097393; x=1804633393;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=GcEHRQ56CoXo5e6YrbvBqMveJXhjTrLMFvdiQWYF4BE=;
 b=Kv66oU6tTt2PVn8R5Ya05dGO+7GE/xP8LT+sz7+so8BXvf4YsZOJN9Vc
 b8h7PSSyCpFOemk7/xVnwqUL5gcDbLCS6pigZ4dk03+VUQrbhabEcj5dr
 BXVWean+wSHHTiy93Upcb5EzFL2GTKZFjOTZzASiD+S2aBZQ+LZoUCMRL
 oBBfl7k5vQQ/EHT0oSXk/wdj8O+8WSEU9wMGJAdnyE/geMTq7BvPMyups
 DNp6EfBhVuYI1oM6RRxz2sjXDcmE0DaVMb6PVTVQCWoZ96rVtmpoAgVH6
 f/MrM9/BUvKLJRa2o4l3DicZpOPXplR0us/gt+QQ+9mcqeO/lS27jsR0E w==;
X-CSE-ConnectionGUID: aQb69g/QS4ShkogbgTOy5w==
X-CSE-MsgGUID: pIh3kpBRQpqvv/bhrjHDMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="99602266"
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; d="scan'208";a="99602266"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 16:03:12 -0700
X-CSE-ConnectionGUID: dxJcxMn3QqKHRz8/5LkPWQ==
X-CSE-MsgGUID: 3fQ9pssQR3+rLq19iOLpUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; d="scan'208";a="217923226"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 16:03:11 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 9 Mar 2026 16:03:11 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 9 Mar 2026 16:03:11 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.19) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 9 Mar 2026 16:03:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ENa3sXVknewqB9b6VP42Pwmtckywq3HW+N2Xgmq8wRnlGxnRUHQk81QWatu4veO5x+CVQ8z4nq5IjRzbn9kATvSJSlcUGaTuegYCFHS0nGxYTuKaZPVTo1bInjXX0mkgYAohV+YrDECQ3Jc7t6O6CwhKLKCFcr5hPU0Mp8MITrBKtj+Mo29OJ4LYTG3iPlUWv3MQtol/a0JuHgO0HEwVI9cJVRCyL+9Xvm1wPxDwOS8W/39xxC9elpmqZj8qqnytTYXOrg+XxA4kr8UYSfKcUBVXKAul/Zpg63jlPQYB7ApM+55xJ2XjkrVV5NvpSRLsekc4wBvBuu/noSdBiiEozw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Qokti6RU9apZ6N8JGWhhVHblwQE3njSlHiXrbOTzSo=;
 b=R9FnAg4YJdg42de8zmN9lvAqtmFQIEAmGJHYcwndVIA31sAzHE943zFhHdiO6Gkmx+Y+E0D5J4+KS3PldVUz9BkhxWi+DUDcU5Fkyd8HAVgXsy5mP5CIBCmSdnQ85tYWKzE6KSMFua47aGQtkenghDL4XocpUlql1mDdfVzOjhUarIaTrsMCKC30qwWN0Vd5p34flThDykzcUHe9IB4STVMlKEIuHkFYYGIyKzo9mZV4VBOTSZDdA2IIrFyCgCQZzrnvaTRXJwG2DmMTC1HNBzqsAXTDtOpAaFuEjf6Q+h85ctzR3bHeAi0A/8PF8UmXUd2EIXukZSq9+smARpCueA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DS0PR11MB6421.namprd11.prod.outlook.com (2603:10b6:8:c7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Mon, 9 Mar
 2026 23:03:08 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9700.010; Mon, 9 Mar 2026
 23:03:08 +0000
Date: Mon, 9 Mar 2026 16:03:04 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <umesh.nerlige.ramappa@intel.com>,
 <badal.nilawar@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@intel.com>, <riana.tauro@intel.com>,
 <anshuman.gupta@intel.com>, <michael.j.ruhl@intel.com>,
 <paul.e.luse@intel.com>, <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
Subject: Re: [PATCH v8 1/6] drm/xe/sysctrl: Add System Controller types and
 device integration
Message-ID: <20260309230304.GD52346@mdroper-desk1.amr.corp.intel.com>
References: <20260302081002.3275868-8-anoop.c.vijay@intel.com>
 <20260302081002.3275868-9-anoop.c.vijay@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260302081002.3275868-9-anoop.c.vijay@intel.com>
X-ClientProxiedBy: SJ0PR05CA0024.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::29) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DS0PR11MB6421:EE_
X-MS-Office365-Filtering-Correlation-Id: ae5b700c-d3b8-4fc4-41ac-08de7e300706
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: EVDFu3R6P5QT6Cq4kTgDUVzxqCm/EiwKu3BeRrXZZZS5JidTJYokqlnyuQeAqJx30mxJBxxiwCU+rcViZu4oPmX1J8lBrVURUVNwdmli/JzzrmKnx16KFGeKcyLnZhoBoHwGC1hQ9bx6t2HZsFOfWdL0g5zay3sxFuolmo1hX5um3vuu6tB8mPbUYE/N5yuq320xS8PwKJzmGAl0i8jv2EPCI0Q/7wTCT3AX1FUzOx4dkMjb8FFOOJk/CrZtP3Ra2ZTdLhld3F5n0loh+sCGJ+HFAE3aSrU5+IFKoaNvFeoPXVBVRDRPUNTUGWttvp3um2/ZEtRFb5RUaSQ2gQn9tCOv2sMTlMpEdPRtLLtzPCzqbjzijqj/0Ly0eo/H9qlwowQrXzoFF6qTfn5Imhsu+s2qoT+eNq+V7PyTeCAcGtRx/44s3k3yM7m8KTt6PKSBOkk3P4a17U4Gikc2Bs2VtpXKL3cf29asZPDtwEVtlsEcKSU2DQElPiG+bs0d0CvJmQJ1cf38yAaVEl+ebmNuNFf1nLA5ZIp7+OD8U8kJ0OypHocHaSb6PwZNhBHj8oXXDyGNv8GtiYd14RrjxpNo/xIYZvFMIDarkgrx7DnBwdmVBxac581A5wA/85E7VLXpGZmv0en0UmbioXy6gHsUCGuPjTe2n+bV07Aj3F3UpUVDzyjhK1h8WCObUVsw1pyukAETjcof0TS/nHf1nYMLWNHD9zMci76CKuO83Nb8qbw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Af1m6gLYSpupS/FC6ZFPMj97NpaNVjTVNEihxrqaFv+zVUUjp1OYnVv7ii?=
 =?iso-8859-1?Q?6zn/+EuH3SUQs1wy3nMA+si2TbXozy6iumcY29Q8ifvKl6UHd7J1C9IPRf?=
 =?iso-8859-1?Q?/OBpdQhlb+Uf/5tslI2KzVBpa84qwCtn8lHry+je3u77PgCYYkoa3/7o3c?=
 =?iso-8859-1?Q?f49fXCBtCWHMTv6Uf5rgrod2yD3qiKmvYrrjFx1/5misEIxx54En8DIwFc?=
 =?iso-8859-1?Q?PdJmrCATI/L+JuxZUyVpwr2pD0eSWgnODFJo3r/k09d8W0IuMFTJMh0rks?=
 =?iso-8859-1?Q?NZWym8fA9DvD+yRRjkjueX7kFYW4xnp2AQXO1ra9wvbUxdVDAldfgQkCJ7?=
 =?iso-8859-1?Q?/TZhOmUTgH2rjLo3GLJ2CpKWl/efMk48Gta+upvsbCKaeV/xcSMMPgL5S4?=
 =?iso-8859-1?Q?+ZGzM2eO+DqcnEIDTnN9I58/q8LQDWKkbqA+v578fQyavv5iKHDXJTcEhF?=
 =?iso-8859-1?Q?dRoHL7RxY5L7x+5eeI7OxhlcEwTP2fRpZ1uOhxZzKQQ0QBTtkMmCWuZHpM?=
 =?iso-8859-1?Q?lhse//3NtU4cDcVFLxAfDcmAlkrRKbvUfFMq1Su9+FkbBcrUTfJZW8a9Za?=
 =?iso-8859-1?Q?9kWDAmSQkUnPss7jIl0K2yg/3aUMdnTeGMyRGFCEGcxe5vmzHm9As/OIH+?=
 =?iso-8859-1?Q?w6Aylv4wnXL8Hj8gCUzH1puPSirJDwN6xyNvfJaJ0jBEwoyBX5D4KKONnI?=
 =?iso-8859-1?Q?puKo0Io/2g+dmEil4AC2eoLWH8LhwB2zu/sP0P8z70/igPr+rjHn8707ut?=
 =?iso-8859-1?Q?Hi0DfqDoUoyb9R7SoFN/6qR/y9lpN+WPewWGudNVyKqSNIKGJ/DUGo/APC?=
 =?iso-8859-1?Q?WFdhLmN7cHy/ykHLPrgHTvsML9s06NATZumduAaP9wOXxMWn++vTqPWuAT?=
 =?iso-8859-1?Q?FjgKoMvxJdjJK9ZaLit5bt8RZZS6U2DlAdQBRzk9RLCDBtuqGkEOJn/c3A?=
 =?iso-8859-1?Q?uM5B5DkN2yumQnmv1/7WBIunQV1LY49xT1HSBbJN2kCz3eyzZ1cLqtwWc5?=
 =?iso-8859-1?Q?RHXaLT5YQMQ2bGisXGlOSo27E7ALfLBaxK0gJVZjVn2TgG8u2YXsEjnWdI?=
 =?iso-8859-1?Q?xO0gAP2gQ/89LTqhXMd8yr+bWZZWsb0nim3UW9CJBtgDwTdZZLasj8a5Ds?=
 =?iso-8859-1?Q?kwajA0Mzdi3UuY+pQ9bSyis/G6ey3nLVQOC/RuumCcN67qjBLbbh8TjNR/?=
 =?iso-8859-1?Q?bLVwDdgkQX3HaHGWVEw82zyi7yf2nWFnv43LJrPG1IdpCPkEKhTWXplXOz?=
 =?iso-8859-1?Q?b0FRXuQAH3/m4YAmRVt8o2YPFLAIfCNbhaabpJUYgjQqhLqnhvhIyqJmXi?=
 =?iso-8859-1?Q?eq7IVl8ecfVHuj8HuSG7NxqGiLjOD0vrH1Z3txZ5JLXHPeYdrrod2Ywk2l?=
 =?iso-8859-1?Q?pUS/hh+j5iMpCY4Rleoi2iWT8X5F77c1f7C4LnO4gPQhAHYo17vSh9JHI4?=
 =?iso-8859-1?Q?7w3cHotXGRE5fph1PTHziBMX8B/696OdwTAmW/NmBov7nglmdf45xzoxcZ?=
 =?iso-8859-1?Q?WsRn1DoV4jT9KBpTETaaiG1JjR01AdvtXwBccAlYm8UkD2/WF19AM5QEct?=
 =?iso-8859-1?Q?rdgMrnEkwhARw5xW5MToS6W2S1jpxHWEJPElh1Qq4LiiehSZNUSszSdeJ6?=
 =?iso-8859-1?Q?OxY9/VPSchG3fShzaU2SaOaOMwK+azDtW5Vg31q6cP1d8SIgcn3iJ0PiRN?=
 =?iso-8859-1?Q?B/SkWAheNkgWQh4Ba05+7cWSlFKb2eoTB5zZZzk0nNjW4fvOOqMeaE1UCx?=
 =?iso-8859-1?Q?axNT/v0awZFMrzDKEaefz/fSJuiyvipD/gMwOTZpLYlXanbP/OwRDbbGtN?=
 =?iso-8859-1?Q?4LMuRbCWh9FDkpFwRlDk7CI8jtSceNo=3D?=
X-Exchange-RoutingPolicyChecked: j+EdxlLHwcJrMd8ejrJBMbDXgRpoAdI234BVf89yaFOpUjMd7Dq4XQJTIDzWG6Vx4se/aGIZ2u4xDAmUaNLsO7JMRRyoPByXr/y0jl0yRg6YExCA4UB9T4XcKBGc2nGLtDtDUe39itb3NP5aDJVXmlxQiTeV2MAeSMV+NA5K2jxOXEwMUvu657O/ZqB7XTM5/mox/FzkkHDDnulbzFaU4m4meTLtuI+huIzt+aX+HShWupjpPBz+f+Yyf7Rc8DOdvll78Ce6PimUIsHYo0lhLGjD/M4wjYLL8ZvFhbPQ+BdzV05bIYNH2w92flthlby6lEuQXwRNLRwVQuWphYIv2g==
X-MS-Exchange-CrossTenant-Network-Message-Id: ae5b700c-d3b8-4fc4-41ac-08de7e300706
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 23:03:08.0100 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0GTzmIpqdnuag65/gnBzpG3pLSu6fN4tE9BBGfVC0rbe2/NjnQft9Nw1wU/T+smgVx8wMBpJEu3QyTElnvoiAiewK/nhcc8Ob2Ggp6g3S1g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6421
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

On Mon, Mar 02, 2026 at 12:10:03AM -0800, Anoop, Vijay wrote:
> From: Anoop Vijay <anoop.c.vijay@intel.com>
> 
> Add foundational type definitions for System Controller support and
> integrate them into xe_device structure. Also add has_sysctrl
> capability flag to device descriptor and runtime info.

If people come across the 'has_sysctrl' flag in the code, they'll likely
'git blame' back to this commit and expect the commit message to tell
them something about what the system controller is and what parts of the
code will eventually be impacted by this flag.  So it would probably be
a good idea to extend the commit message here a bit to help people
understand what the point of this is.

It's best to write the commit message assuming that the reader is
generally familiar with the Xe driver and how it works on past
platforms, but has never heard of the system controller before, knows
nothing about new platforms like CRI, and has no access to the specs. Do
we need to communicate with the system controller to perform general
operations driver that were previously done in a different way on past
platforms (if so, which ones)?  Or is the system controller only
relevant to enabling new features/functionality that platforms without a
system controller didn't have?


Matt

> 
> No functional changes. This is preparatory infrastructure for
> System Controller support.
> 
> Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
> ---
> v4: (Matt, Mike)
> - Add domain-specific MMIO accessor
> - Change phase_bit type from u32 to bool
> 
> v6: (Matt)
> - Add mailbox protocol constants
> 
> v8: (Matt, Michal)
> - Reordered patches for logical flow
> ---
>  drivers/gpu/drm/xe/xe_device_types.h  |  6 +++++
>  drivers/gpu/drm/xe/xe_pci_types.h     |  1 +
>  drivers/gpu/drm/xe/xe_sysctrl_types.h | 32 +++++++++++++++++++++++++++
>  3 files changed, 39 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_types.h
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index caa8f34a6744..ec66ef772cd6 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -26,6 +26,7 @@
>  #include "xe_sriov_vf_ccs_types.h"
>  #include "xe_step_types.h"
>  #include "xe_survivability_mode_types.h"
> +#include "xe_sysctrl_types.h"
>  #include "xe_tile_types.h"
>  #include "xe_validation.h"
>  
> @@ -203,6 +204,8 @@ struct xe_device {
>  		u8 has_soc_remapper_telem:1;
>  		/** @info.has_sriov: Supports SR-IOV */
>  		u8 has_sriov:1;
> +		/** @info.has_sysctrl: Supports System Controller */
> +		u8 has_sysctrl:1;
>  		/** @info.has_usm: Device has unified shared memory support */
>  		u8 has_usm:1;
>  		/** @info.has_64bit_timestamp: Device supports 64-bit timestamps */
> @@ -512,6 +515,9 @@ struct xe_device {
>  	/** @i2c: I2C host controller */
>  	struct xe_i2c *i2c;
>  
> +	/** @sc: System Controller */
> +	struct xe_sysctrl sc;
> +
>  	/** @atomic_svm_timeslice_ms: Atomic SVM fault timeslice MS */
>  	u32 atomic_svm_timeslice_ms;
>  
> diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
> index 47e8a1552c2b..6ffef99b7973 100644
> --- a/drivers/gpu/drm/xe/xe_pci_types.h
> +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> @@ -57,6 +57,7 @@ struct xe_device_desc {
>  	u8 has_soc_remapper_sysctrl:1;
>  	u8 has_soc_remapper_telem:1;
>  	u8 has_sriov:1;
> +	u8 has_sysctrl:1;
>  	u8 needs_scratch:1;
>  	u8 skip_guc_pc:1;
>  	u8 skip_mtcfg:1;
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_types.h b/drivers/gpu/drm/xe/xe_sysctrl_types.h
> new file mode 100644
> index 000000000000..c1a3f4c835b8
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_types.h
> @@ -0,0 +1,32 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_SYSCTRL_TYPES_H_
> +#define _XE_SYSCTRL_TYPES_H_
> +
> +#include <linux/mutex.h>
> +#include <linux/types.h>
> +
> +struct xe_mmio;
> +
> +/**
> + * struct xe_sysctrl - System Controller driver context
> + *
> + * This structure maintains the runtime state for System Controller
> + * communication. All fields are initialized during xe_sysctrl_init()
> + * and protected appropriately for concurrent access.
> + */
> +struct xe_sysctrl {
> +	/** @mmio: MMIO region for system control registers */
> +	struct xe_mmio *mmio;
> +
> +	/** @cmd_lock: Mutex protecting mailbox command operations */
> +	struct mutex cmd_lock;
> +
> +	/** @phase_bit: MKHI message boundary phase toggle bit (0 or 1) */
> +	bool phase_bit;
> +};
> +
> +#endif
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
