Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 638DEC4345F
	for <intel-xe@archiver.kernel.org>; Tue, 16 Apr 2024 22:56:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AF8010F3F3;
	Tue, 16 Apr 2024 22:56:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lzGNjaeN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDACC10F3F5
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Apr 2024 22:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713308195; x=1744844195;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ymVXSEYVRFAfbuMjDJ0l4xv8P6+6pZsLIhSnm0NuDb4=;
 b=lzGNjaeNOiO3471IaL6UFJ14oVamKPneeTuYgTwQOHTHWAa5PGNAp64u
 KJQ/3tX5x5a/gsqbkLGFdCQW0CcVPnM24W3C/Hm4+8/PDT0wa87aeNbWl
 IwDdFkuR8zoZxgM5Y1zBohGmFjCXRimNwQZNQivzNz39Nz3sv+dSl91YN
 ZN5fhc7UGzNlMtyYGvHHfqd1O4hI3fLFnAOCjCq/hRxn1+2yphtvubMtX
 D1msUsl+tGWzOt/M4q8OEnBtxrzGSxaLM2IJG9b5O6Gjywpa/rUSnmKfK
 108uqcMFOkVHEgp5j1K1veHKhjzu/SxI2ZdE9OSYpyamNlDBwQhGhRsrb g==;
X-CSE-ConnectionGUID: iF5s48kKT6WuhyqaQfWekw==
X-CSE-MsgGUID: r96xMsW5Tgqm6fgkVJqAWQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="20199336"
X-IronPort-AV: E=Sophos;i="6.07,207,1708416000"; d="scan'208";a="20199336"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 15:56:35 -0700
X-CSE-ConnectionGUID: ohgabhOhS0euxN0DVGIIYw==
X-CSE-MsgGUID: lpU5diYXRvaSt8AKiNmNBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,207,1708416000"; d="scan'208";a="22287090"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Apr 2024 15:56:35 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Apr 2024 15:56:34 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Apr 2024 15:56:33 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 16 Apr 2024 15:56:33 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 16 Apr 2024 15:56:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UbCqMRWGfq7aGxfgOqGw4JGQ+jMobM6Kf3DcHceMpAWpJhQG6Nq60wGkfDD8aTM8sx9/SnT6Vml36NMZ0/oOVfrryD0d3mGYDTUggHsRHZW94wOiB0zS7zIzqRBUFYPm7Ze4yBlsGB/KUN32vd7kQsljdQsuzCcmnZY+wRns0D8zK9SP+nNbUeEHWTzzlG+C4Lk4iZ6SDy2wRCD211bCvAQzbuLM7gyeKRGbAY7xCkNwOXuObTMaeUCphYZIoU66RSn5n/wm58jusFnUL0BXfskuh0o8yXxNp2iJbzQgYDgh3OMm3n4wE2dRzr2MTFt1AhmRKlduqP5biYn2keZMYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r/dG1KgRkw1ANJ8xQQoDfGM/aX6d+IhRdSoaWe7Ud/0=;
 b=EQJyDAWaQrCTHKkj4WU6tb7vwn5+0VXgPtpRZVrneDFUeGzC6gBSIXRwQDz+70euodfcsfJVW5rUYQRO25DJOyG2vBRK0uWwTy8F49Mtz6EF+mGF9KzO0S/5cOh+Uz9w9ynuHV6tyEZmW7jsz5aPcRDpVy91Ffb8ScuRaPdlIvVNmkxk7M+ZOjtuvxI4yatvJA5gH7Nt36ZHqrCNflA+MSsFUl/Fl3oqoRfggY4Z/pN5/mqg7bPKPgqaWcllF4b/9RzdjUI8tZC6tkgtmbJqlXrh6OmWLQOL9gFWWSgbRmPbJL25q4tiwOqZk1x4ZvIRleG/zQNZL7HngcFlFPOqKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DS0PR11MB8133.namprd11.prod.outlook.com (2603:10b6:8:15b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.26; Tue, 16 Apr
 2024 22:56:31 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::cc14:a507:b02c:b551]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::cc14:a507:b02c:b551%7]) with mapi id 15.20.7472.025; Tue, 16 Apr 2024
 22:56:31 +0000
Date: Tue, 16 Apr 2024 15:56:29 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Tvrtko Ursulin <tursulin@ursulin.net>
Subject: Re: [PATCH 5/7] drm/xe: Add helper to capture engine timestamp
Message-ID: <Zh8CHQe/yx3+j97L@orsosgc001>
References: <20240416030454.3739862-1-lucas.demarchi@intel.com>
 <20240416030454.3739862-6-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240416030454.3739862-6-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW4PR03CA0252.namprd03.prod.outlook.com
 (2603:10b6:303:b4::17) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DS0PR11MB8133:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ed14545-400d-4fdf-eead-08dc5e6874dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fe7Iddz4OTtjVP7DWI/BNbUApcrMRLN5Kpt0/PUT445XpYoa0NFOAZLzgAepxkGzqpHFj+qz4coODQvUnb/OuNFgIzDMXvxF1gyoy7eDcT7s3n1XlYMpkrzlykIyBebCfVw02I3//yvtfToxzBi1KFcbyv2guIKHcXfMJXr24V6P82ZhfKlW/9pDHS2ccRQx0i2mKPHLTyyg71TO9aq3iyfhNYMc0UsI6FYtLSnvZfaJwB6cnIrnwsAvkzpvFrEqmO7kKjqS5UmZkkqJfO4OUHVlpve0KJJO7Q/VMb2PrDjEryt5cjSJ3zSlI7Fw+SaNEFF2LrSM2ucQDvECQDHckZ7ECi/yQF7oJxOHW3FeiD0KiZPqUOxkTpApok1gXPWkRueweVgGZCWhGhZpyJFpMRGGc7To6nf3YT8PN6cJSzoRc/A2/Xri5/dS3p9jUaoQAMonMvn4V9vquZY9h1SaQC4KMxx1CRZxPZOvZGZ5MbAzVaQi/HMlvWXYXF+c0Nh5qw+ekknGR3EoPZwCQ0owLJOTxBkPirV+ohfz0AjEVKbVIawGiGxoRBPgrWYLIMKZC3fuYym3ULxYRnUdQDXJq2I30LvDVzlIV1By5grfSIJ8Bx+mXHDjhBBAOELvRJ6QMGxFc1In6CZaw4PXO8kXXSmtVucZvB8w7ZcPm7b4x1o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGVCT0o4TEU5YWRaZTJuNm5KV20wSlZtL1VkbWR1SkRCeVZEQjU2ZFBmU2du?=
 =?utf-8?B?Y0xIblo2SFZsY2tTNzM4anhRSE5LajZpUUZtdHBKRjhKbm9jS1hPMUwwOFFl?=
 =?utf-8?B?NTU0SUEwWlcxMFBJUWEwTE9RVlNzSGJYRlZoVEtENS93Y1ZQVnNqVXJJUmdI?=
 =?utf-8?B?Q0UrT1pLRzdndDIvVjVEZzR5c2tuc0NUR2pWKzNBYkJzNGVpTld5bzJEV1pX?=
 =?utf-8?B?QzhJZWcwQ0dBV2c1WG40TUJCc0ZpaFBNVWk4YTdWZENMRUJYSTl5Mkw0RDda?=
 =?utf-8?B?SXJ3SDRqK2hadU1jUW9jcjh0OGJhc2xNYWNmRjhVajFBYnBUY0tFSEwyRjRl?=
 =?utf-8?B?MjhlOTNrVHZielN1ME5UYU1FbERUUWFQbzhKWFdDUkJNWG9EOGZDMG45MURM?=
 =?utf-8?B?M0NwUTE0dzVDMFRPMXo5K1lOS0c0SVpFQ01idHpMMjR4Mm9lQnN4Y2w4ZkZp?=
 =?utf-8?B?cC9ieUZVWlpidTJsbmJFeDQ0ODNlRDdERDBzZmlBQ3p1bityL1NIak0yMXMr?=
 =?utf-8?B?VmRNeFJQT3ljUmkwZHVTOGI3YmF2TUpEaStoN1hWSHNSN05BSC9sYjd3MlZF?=
 =?utf-8?B?NnRuYlJOZGg5aC9TU0VYN3NhRHVxOVd5VVJPeXhjSVczQUNrdEdodEN5aTNo?=
 =?utf-8?B?RnJLbkFjSlRoUXl3UDVKeTAwSGJWWHJpTjNrTHB0aGw5Smx1MFBOODIzNThH?=
 =?utf-8?B?NFNIeU5lQzdTVU9mVDBWRm9jTEhham94cG1reXp2MVZQSzdXc0xaeGJRMmdl?=
 =?utf-8?B?YnBjR0t0UUV5QjJVanUyWTNNNmlUcFU2OXRGYmJmMm9qa3h3bW1NaFRPdVRV?=
 =?utf-8?B?dzJDUGcwUndrWDJLSmdpN3M1aWVNc2p5WEVpK0x1eEd2VWlQdUtiRmtSR3oy?=
 =?utf-8?B?N2ovYkk1a25icWM0d0pwbVBLY3BKcjhsUE9WQ29PTTZydDh1VzhzWnhyWHNS?=
 =?utf-8?B?WkVvdHJmMXg5bVpiM21FaGxHWVUwYWozTkVMM2pDV0lYakNaZ0Robk1TMFJy?=
 =?utf-8?B?amVnbGxFWjVqY3I5bWk0bGxtajBZcW9mYi9WUUx5ZmZIY1dGOGNQa2tSemF2?=
 =?utf-8?B?bndJOW5TR1F6aEtVeVVXeVoxQlF5dnRqWnNrRHk4ZHlBdUVROXVwZytsKzAy?=
 =?utf-8?B?cEJBVCtQcWRRRmEvelFpUkZXRVJSOG1JVkswakgzaXFMYkRVKzFKUWl2ZTZ1?=
 =?utf-8?B?VEh0UmNCcVJDb0hTUy9HZll5MU5EVlRwRjNxME91WnFGdzFvbWN6aEZicHF6?=
 =?utf-8?B?SDJSMkhvVnNub3Y1bmdneVBkbkNxRktsYWhyTm11T0haRlhud1VidzBMSFBi?=
 =?utf-8?B?V1Q4MC9MNHV1TVhjQWk0UHJxNVhFSDVuQUZkUEpNQjB2YWdTUzJFdzZlUk5s?=
 =?utf-8?B?NGJWRnRya1c1V2ZDWE9Fb3Z3c2lmVUx4ZWFQSW1lUGh0aHRCSVhDY1NlYS9z?=
 =?utf-8?B?NGppZGVjRGRzQW9oNjF4RTR6WHNWUEVTOFFaR2kxTE84UkNxN0dOelU0OVFm?=
 =?utf-8?B?Tmg1d1A0VkFDdWNyd0htUDU3aHBIclJwMkNhZEsxd0g3b3VjZlkxSkVCWFY1?=
 =?utf-8?B?VC9kM2JQUUZQY2JzMjhwRXhicjVzWmsrY1ZsUGlSUzlQNnRjUThMdW0rM0hP?=
 =?utf-8?B?bzRjcUhGU0YyMEFPNUFNbHluZ0gvcVZzN2xVNXRVZmhkVmViYVVnczhhUVRE?=
 =?utf-8?B?VVQyKzVNZjdBNFpFbGpTcmxZeFBrYWxRajNuR2xJczh6bVhnamxXWFUycVNa?=
 =?utf-8?B?eFlxbnZ0a1k3d0luc2tlbG9TWHdHaldjRFYvSUR4VFBBMXBDZG12c0VIWDM4?=
 =?utf-8?B?NGdhMGdkdzBDbXJlRDFXUXdXbzNxM1JxRHB6cm5lQlNKMnRKKzBNNnhWNFZG?=
 =?utf-8?B?Mjdoc0tmQ1hwTVcwQThDamZMNnU0TmQ5cmc4dkREUHoxZjlXNW1mUmZDa25S?=
 =?utf-8?B?UHI4MnZtUjZTcFpJb0RUaHVwWTBRSGJGWjF3U3hhSTZvTnNvRWNST3J6UlA3?=
 =?utf-8?B?aFkwamlTOVNjRDZMR2d1TTZHQzFORmdwUVFmM0RscEJqaFIrM1E4KzlhbVcy?=
 =?utf-8?B?Y0VhSHFwQW9Zc1RER2pLcVV4L3AxQS93enFjc1VIN0k2YWVGTFBLY1ZFQ1d5?=
 =?utf-8?B?M05RRGhQN0Q3RERYTElsRThwVXBxQXdXd1FCWmVGN3MxL0l3Y1MvMjE4OUNI?=
 =?utf-8?Q?O41x+0Y0N713LDQ6CFA8uU0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ed14545-400d-4fdf-eead-08dc5e6874dc
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 22:56:31.1411 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e7Xu56c1nfgTHu97Gy6JacG03N2tuNvbD7TiHAKjecH4ebpw6aLebSvMMcD0N0y+qDjVAphf9AWQeDeTUh1grPrH1E49WhG8F77Gob9eyJI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8133
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

On Mon, Apr 15, 2024 at 08:04:52PM -0700, Lucas De Marchi wrote:
>Just like CTX_TIMESTAMP is used to calculate runtime, add a helper to
>get the timestamp for the engine so it can be used to calculate the
>"engine time" with the same unit as the runtime is recorded.
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>---
> drivers/gpu/drm/xe/xe_hw_engine.c | 7 +++++++
> drivers/gpu/drm/xe/xe_hw_engine.h | 2 ++
>  files changed, 9 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
>index ab227fa8984a..528b271c9f23 100644
>--- a/drivers/gpu/drm/xe/xe_hw_engine.c
>+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>@@ -981,3 +981,10 @@ const char *xe_hw_engine_class_to_str(enum xe_engine_class class)
>
> 	return NULL;
> }
>+
>+u64 xe_hw_engine_read_timestamp(struct xe_hw_engine *hwe)
>+{
>+	struct xe_reg reg = RING_TIMESTAMP(hwe->mmio_base);
>+
>+	return xe_mmio_read64_2x32(hwe->gt, reg);
>+}
>diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
>index 843de159e47c..41cd0cd71ae0 100644
>--- a/drivers/gpu/drm/xe/xe_hw_engine.h
>+++ b/drivers/gpu/drm/xe/xe_hw_engine.h
>@@ -69,4 +69,6 @@ static inline bool xe_hw_engine_is_valid(struct xe_hw_engine *hwe)
>
> const char *xe_hw_engine_class_to_str(enum xe_engine_class class);
>
>+u64 xe_hw_engine_read_timestamp(struct xe_hw_engine *hwe);
>+
> #endif
>-- 
>2.43.0
>
