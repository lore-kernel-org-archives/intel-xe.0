Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98C2ACCD193
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 17:24:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5650410E159;
	Tue, 14 Oct 2025 17:24:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EhjdgVx0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B331A10E159
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 17:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760462692; x=1791998692;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bv8f1aki15AJJwsFtwLOWZPnjAl1yi9p8RLHUDjtXn8=;
 b=EhjdgVx0XiP29v1wJ9F2YHe2zB9BySu8I4TkM3id9i2HgFApny9eQuww
 3wqZF9br3sJpaVctveS4j3Jy3HO0UmfzA7rrq0XfGyNOJHHNOMbaQ9ebs
 ebZgx/VTZmKWaCyeh0Tz/btbklbwHxYp0KjUU9yQZ8pcxf5W4brSABYyd
 lQJth5IZNECyJwjUTkMd6obP354TC9PZisd1S7UnhUAA7GoTcPaOPo9CB
 8V40c0PFSoDgYq/g62AN3ioU8iKOZRnXK21DfT4cDe0ExPjrwUQLMXkv9
 fA728U41c5OTd72Cgy2ant3H09tZVEVHEA61CgDS7aQLd83tFRY3C2C+Q A==;
X-CSE-ConnectionGUID: /O/eTsW1QwGDlJ49qbLMYg==
X-CSE-MsgGUID: y/IkLVuCQLGrVKx9ijQoJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="66488322"
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="66488322"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 10:24:52 -0700
X-CSE-ConnectionGUID: FrUsEcWGTnKZhc50nLMKHw==
X-CSE-MsgGUID: W626ZtXeS+aTBUXPPogjyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="219083321"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 10:24:53 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 10:24:51 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 14 Oct 2025 10:24:51 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.40) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 10:24:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m7/dlWkjpulIh1GYohZMy98P11KUQiFoFlKnk/8Yozr1UuiCCQsZQEcB9BC92GdNyWv95FKse+RxpKke2IBjGoJM5xSLxoTIGVpRJilCl8pycT8AcPO8l+6EvB6DPVi+TfAZfWyRljU1dYegumXpvyv/GZwO3UA1RrwlZKnpy7ra8b8F/Pry0rVCm39e/DCvUW2nox1/gwaHSi260a6gVhnnSoiqLIihkRsQJknbnaKyISgT4qMiU2ttZWX+wC48s1FHTcps7+IK9Q+iIBjWl+vULjwUEmIF9ZHX5AlmQ4ECnqaumL/bA7zRTnEedXo8aEfVd9VqrCMv1XQPeU3uEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GalFKnTCDdSu8QVqzUq6T4fwJ/E8RZlSMHeoqtksMx8=;
 b=URUXMWfkXVECbYshNK0VC/rKWsr+5qYfFiGwhE8WDOd7N42gjYbO2cak+yBIdnePZsehPjlB0SFgJKpucnYyx7nNkbKPtXFpo7/XRDQOXucffN7sEKCRYcITKpgwXUiE9cDTGzYkHN7TxoPUu+qh7KgVKYkdLOG8bwOCYq+EW1JBon6UxLB/QsOcSKlHHDZezAPhf8raPjcnURZjwnRE/kUhpoRZtdITEN41rGmoogjUB3Npm4JzlcvZ3/lZUYO/TBch9YPY1qinTyAXsTznaAoeUCxjWvA4reF5NJY5Kg0pgrKrFFH2gAs4Y+DWlvoKwLnBr9IF+nIaArB0KLjfhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DM4PR11MB5995.namprd11.prod.outlook.com (2603:10b6:8:5e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Tue, 14 Oct
 2025 17:24:49 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9228.009; Tue, 14 Oct 2025
 17:24:48 +0000
Date: Tue, 14 Oct 2025 10:24:45 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Shekhar Chauhan
 <shekhar.chauhan@intel.com>, Balasubramani Vivekanandan
 <balasubramani.vivekanandan@intel.com>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>, Wang Xin <x.wang@intel.com>, "Niranjana
 Vishwanathapura" <niranjana.vishwanathapura@intel.com>
Subject: Re: [PATCH 13/23] drm/xe: Dump CURRENT_LRCA and CSMQDEBUG registers
Message-ID: <20251014172445.GU5409@mdroper-desk1.amr.corp.intel.com>
References: <20251013-xe3p-v1-0-bfb74f038215@intel.com>
 <20251013-xe3p-v1-13-bfb74f038215@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251013-xe3p-v1-13-bfb74f038215@intel.com>
X-ClientProxiedBy: BY3PR10CA0029.namprd10.prod.outlook.com
 (2603:10b6:a03:255::34) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DM4PR11MB5995:EE_
X-MS-Office365-Filtering-Correlation-Id: b0708104-61d6-4f1a-ce41-08de0b469315
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?x/3wEjyXc4ms/OIUB95gWE6ZVWRXx492GyLs5g8DUAq/2Q9NqJK++5eOd+EQ?=
 =?us-ascii?Q?OEfB/xb2X4qt6tfkznEM+IfTUwrvoz5xFNpqGMwlWc3RPrEIn8PicKqC92HS?=
 =?us-ascii?Q?KNFI60zUtnv7pgEeqWcm3QZ2daqqXRcO6joLMPpCzFfF+WBndaVLHlC+yloP?=
 =?us-ascii?Q?O7wu+8YSNhOcSe1JxGz69rjpBpRV4iqSO/c44rnowGXqBS8yNA1kzEhZx2fw?=
 =?us-ascii?Q?DJyYM6JaFuSaMDCVH9LysYC0/VeSu9CFMDcgNInM2pTJWwnbtEn33FQgNxSd?=
 =?us-ascii?Q?4F+W2fnJ90jYae7YsG3Lto4mu1twKn7iB7CQmuLzHj4s604wpdXAtOo3FK0A?=
 =?us-ascii?Q?gk6sJd2uO+XPp2Vs0yTJAalgAmz8Ol4a80vKD0TMx4ytkegDGEk6glUjH4/0?=
 =?us-ascii?Q?m3RxUtSmv0YGWbL9m2tiRZgWSlsrpwDBJ3m0suLqLu25P+3xqrUBvZ2kSicu?=
 =?us-ascii?Q?hL0gqBP7UxLCI0jmAuqJNkexDT5RLdZeQa3PWS+xifl5qYF6TE/CtECmMuMX?=
 =?us-ascii?Q?pD/aj+Nj8Yw1q0C/BY81wVJovoQBHqaTcsNucBgYnR29c8oZfR7IuSWFLxIh?=
 =?us-ascii?Q?sULX1l0dB3V8w9SMNSLTUaTmHQdsy7CmiSYnannd58hxHG7rSeh0PdstHw5x?=
 =?us-ascii?Q?8YnNP0MbyxgSnrePfHA3wLRVW1Bb7LDqwcm+j5NuYq6I0rBDEkam9Y5vFFsw?=
 =?us-ascii?Q?j+rsNXvkFVw4Rt7e0ra5IdvK5sTXF58gienZ1gzoSjMVgnTznIA4GUiHLnIN?=
 =?us-ascii?Q?DuJgsJAFr80WqFSDI4JE19oGnDAjIvC9z4cpQpJ9ksXgwgVTBIXj14wT6+w6?=
 =?us-ascii?Q?z8qPqjwxj57zLz908FMaoMSfjqcfDgrjIyDWznHvQ/B5wBmAPR9frbFRWokq?=
 =?us-ascii?Q?Hp8xiuoDhvwvZf5LnPccABu7iwm0FihmCASoqdSwfk4gpVByuQWrYkmyGa+u?=
 =?us-ascii?Q?og2v679Pw4G3vjlVv70drG6ImYwvy9oiOa5QJUfwu27ntbo3hHb/2BZ+zL7t?=
 =?us-ascii?Q?sugKIyBqOql4OjOifPItVCIiKJbwNLRMuA2A++A/PXWBeECj1cf2ffi1UoUd?=
 =?us-ascii?Q?3yQ1jooLO79b+TBndpeaoV40G2IxJUif+zS3Qy0PjrEI0m/lmfwl8nENj3/e?=
 =?us-ascii?Q?yJ8C42TARpxBBqMT7s0qVMjmaV5jepvpMJFQpprS0lY3EhWn7V5wpUwvSPpq?=
 =?us-ascii?Q?OcXe9fmrYteXH78jl3u2dm5peBnT1mvgbiY5WVUDBX3tz6QS9PBn1zUy+vig?=
 =?us-ascii?Q?u6vBCVtlWEcfN0Mb9r/I4EBqEkFAQycvkx9KHJX7L8WM2rtrqzwSs6cpPku4?=
 =?us-ascii?Q?NCRH5VRlDYq1cDt0RdCiILGQVrj2Lc3NK9sF1DnnuxtrwaZojtPV3vD+GkAx?=
 =?us-ascii?Q?a9vVjTlACta08Xh2DvV/IcG0bT1y2LBDNp+htAaqlSGIsJGL+exiMQpTi3/H?=
 =?us-ascii?Q?soLXcd4OCDNiKfdPld+GvT/VhByxelsL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DnNGxCPFc8KBbtxtF+orUcf0mStkfQxWPab1EpefoCF3nlU2JUXRXWpZY+xX?=
 =?us-ascii?Q?JgecaPEvli0UP0ITUMCcc8omrQq/TQ3heAhqpzDeuH2i5FzqVC+02G6zUbul?=
 =?us-ascii?Q?lLlb8iAhy1Vhj6ZETNzWywVQao2Sd8SwLjVrtsL1kc7d2vWOTUoijk8Kx9ih?=
 =?us-ascii?Q?Ei/HWqTcoCVFni+7o7Xamm5D0ohTmsYO34sMZdk5HNQebtLJI9R/Chu6Dq9f?=
 =?us-ascii?Q?h93TzqDrBmgiBjj+3U0U8ECepvRenWklvqD8h4YbaKrChJSgVc8QB5SvnOSB?=
 =?us-ascii?Q?sLkvEVuMo3ziyRxCvbAMKBND2XnmOi/vEqCbNwcr1wKGZE+rO4k2+gPezG8N?=
 =?us-ascii?Q?D2qtdBoLmsQWn0oMWtsezxDzhridVPo7HLpp7dTFUiQhxFebI/NWlbokbca4?=
 =?us-ascii?Q?cuXQQxrKWr3Zw3gGM/18A3aHkfCml6qCXYlgB7vU1+vqOZwoLwbXun9iITMq?=
 =?us-ascii?Q?e+yyqSrJtPiVJft1gYkO3P+W5i77mAXWRdd/nekIRhJUZ/xQmihETWXlMQt4?=
 =?us-ascii?Q?aLsOQqL3dvBL9ZqEmHItXXvRTv7vW41HVqTbhnN+GKXA7GZDTRf9JLt/xdT8?=
 =?us-ascii?Q?c9c6ajiycGqOjHArYx69zGRlcWuzVgr34cAzVZFBKsMXhLoyC7BxnkmKRS9D?=
 =?us-ascii?Q?D5LR2ZVPIHGhfG+0y4AJBgxVylWVkL0J1mtYkruS2lLJV29mpQ3ltJFTZPhO?=
 =?us-ascii?Q?wt32wBm1NZBXIJPH8nhRZmXFpX5ktMSNG0LS4+bB57caueBhXGd4ntHBu2nN?=
 =?us-ascii?Q?WnVwkD6X60kev8MSY50qF4N8p1mG+Ta3FD4Igm9LDRl36WRcKub0ebPGniY9?=
 =?us-ascii?Q?6g+L36Vz/2jdChWZSPVef6kbf+PIppQIyi0CnNk+rX8Js9u5ruXBmBvKHc+S?=
 =?us-ascii?Q?Vl8M3fqD+YPt70BmJ8MJHBD/E/gGCqwvLoHG23/Fwaeysvy3EuG9Oh+Z0E5/?=
 =?us-ascii?Q?osrizYXpsqgeDZT6Q/C1Q8Vda/13lDNkiJiQaheDRGAMhT4JoY2Tocmbej3u?=
 =?us-ascii?Q?bvU2UDzIoA3nlMLAWcEvJkZK0H3OvQqyDWQZjOgexDTvueHsNk9GErBUM2mE?=
 =?us-ascii?Q?ARGRped/ruF2pzGp7nNEnscX7dUXPWvNXQUi6mGFkyne+b+5/jVgVGgEaAkY?=
 =?us-ascii?Q?gdxoyF6rcRsY98sCGwHy/YZLUhgpUmMbGTQZh8WOLLHqKbxQ5rXvtOgd0xV8?=
 =?us-ascii?Q?iUb85uoe0dCOSWhmMBUqgXagE+V5UDn0nKs9ztlJDyiUUmmTd/0W536mmGa0?=
 =?us-ascii?Q?9VpuAdWdlqxx/TwbU2HFhK/6sVEQOUfey7BLdaT2iDSAGwAnpD1aMeS2Tw3C?=
 =?us-ascii?Q?G09VIJQ0Y0xgPGUzQMw47DiiR1Uwk8IU0GNu05S9xiq5WLC9BrLvw3paF5Oz?=
 =?us-ascii?Q?W7vXGBNvDDYt6y2MucTNBkIlEZYqcRXsV6SkWTrtIpN3BQKFO3dY+jRwwdef?=
 =?us-ascii?Q?YqCptY/vZ6jS4OQV1X1ost1gk0BO1FTsfqwXp2oio2ONrUEenTz697peOwVM?=
 =?us-ascii?Q?uRJWmFiQzcYAaBbXfDSd5ipG3xoxD5Heh2EeRtp/kyOrRKkaiGIxtrWRd7HX?=
 =?us-ascii?Q?VsVakDh758ILyYDgDRcAWcTwBBLhdhtE4K4p6cH5QWqeLsp0UsksHEoHFq8H?=
 =?us-ascii?Q?jg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b0708104-61d6-4f1a-ce41-08de0b469315
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 17:24:47.9253 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iosx77vdBqZo7SlXudvpnUOx4wP7HLC5Kd3fa2vrVrjXDOJRUUe2ZLBCu0wYKrM15ZqKZoWoVuc1pvBo+q9UzHa+x1Nkuuio89POq5Yyv7Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5995
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

On Mon, Oct 13, 2025 at 08:24:45PM -0700, Lucas De Marchi wrote:
> From: Wang Xin <x.wang@intel.com>
> 
> Add CURRENT_LRCA and CSMQDEBUG to register dump to help debugging.

It might be worth splitting this into two patches since CURRENT_LRCA is
something that's been around forever and can already be dumped
unconditionally on existing platforms, whereas CSMQDEBUG is a new Xe3p
register.

Also, I think CSMQDEBUG dumping would probably make more sense to be
included as part of the MQ patch series that Niranjana will be sending
later; dumping this register doesn't really have any value outside the
context of that other work.

A couple more comments farther down...

> 
> Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Wang Xin <x.wang@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_engine_regs.h |  5 +++
>  drivers/gpu/drm/xe/xe_guc_capture.c      | 53 +++++++++++++++++++++++++++++++-
>  2 files changed, 57 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> index f4c3e1187a00a..7b6ec0cf78c85 100644
> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> @@ -141,6 +141,9 @@
>  #define   INHIBIT_SWITCH_UNTIL_PREEMPTED	REG_BIT(31)
>  #define   IDLE_DELAY				REG_GENMASK(20, 0)
>  
> +#define RING_CURRENT_LRCA(base)			XE_REG((base) + 0x240)
> +#define   CURRENT_LRCA_VALID			REG_BIT(0)
> +
>  #define RING_CONTEXT_CONTROL(base)		XE_REG((base) + 0x244, XE_REG_OPTION_MASKED)
>  #define	  CTX_CTRL_PXP_ENABLE			REG_BIT(10)
>  #define	  CTX_CTRL_OAC_CONTEXT_ENABLE		REG_BIT(8)
> @@ -153,6 +156,8 @@
>  #define   GFX_DISABLE_LEGACY_MODE		REG_BIT(3)
>  #define   GFX_MSIX_INTERRUPT_ENABLE		REG_BIT(13)
>  
> +#define RING_CSMQDEBUG(base)			XE_REG((base) + 0x2b0)
> +
>  #define RING_TIMESTAMP(base)			XE_REG((base) + 0x358)
>  
>  #define RING_TIMESTAMP_UDW(base)		XE_REG((base) + 0x358 + 4)
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
> index 243dad3e24185..265aa7b7614ce 100644
> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
> @@ -122,6 +122,7 @@ struct __guc_capture_parsed_output {
>  	{ RING_IPEHR(0),		REG_32BIT,	0,	0,	0,	"IPEHR"}, \
>  	{ RING_INSTDONE(0),		REG_32BIT,	0,	0,	0,	"RING_INSTDONE"}, \
>  	{ INDIRECT_RING_STATE(0),	REG_32BIT,	0,	0,	0,	"INDIRECT_RING_STATE"}, \
> +	{ RING_CURRENT_LRCA(0),		REG_32BIT,	0,	0,	0,	"CURRENT_LRCA"}, \
>  	{ RING_ACTHD(0),		REG_64BIT_LOW_DW, 0,	0,	0,	NULL}, \
>  	{ RING_ACTHD_UDW(0),		REG_64BIT_HI_DW, 0,	0,	0,	"ACTHD"}, \
>  	{ RING_BBADDR(0),		REG_64BIT_LOW_DW, 0,	0,	0,	NULL}, \
> @@ -149,6 +150,9 @@ struct __guc_capture_parsed_output {
>  	{ SFC_DONE(2),			0,	0,	0,	0,	"SFC_DONE[2]"}, \
>  	{ SFC_DONE(3),			0,	0,	0,	0,	"SFC_DONE[3]"}
>  
> +#define XE3P_BASE_ENGINE_INSTANCE \
> +	{ RING_CSMQDEBUG(0),		REG_32BIT,	0,	0,	0,	"CSMQDEBUG"}
> +
>  /* XE_LP Global */
>  static const struct __guc_mmio_reg_descr xe_lp_global_regs[] = {
>  	COMMON_XELP_BASE_GLOBAL,
> @@ -195,6 +199,36 @@ static const struct __guc_mmio_reg_descr xe_lp_gsc_inst_regs[] = {
>  	COMMON_BASE_ENGINE_INSTANCE,
>  };
>  
> +/* Render / Compute Per-Engine-Instance */
> +static const struct __guc_mmio_reg_descr xe3p_rc_inst_regs[] = {
> +	COMMON_BASE_ENGINE_INSTANCE,
> +	XE3P_BASE_ENGINE_INSTANCE,
> +};
> +
> +/* Media Decode/Encode Per-Engine-Instance */

I'm also wondering if we really need to dump it for the vcs/vecs/gsc
engines; although the register technically exists there, those engines
don't actually support MQ so maybe it's only worth dumping on the CCS
and BCS engines?

> +static const struct __guc_mmio_reg_descr xe3p_vd_inst_regs[] = {
> +	COMMON_BASE_ENGINE_INSTANCE,
> +	XE3P_BASE_ENGINE_INSTANCE,
> +};
> +
> +/* Video Enhancement Per-Engine-Instance */
> +static const struct __guc_mmio_reg_descr xe3p_vec_inst_regs[] = {
> +	COMMON_BASE_ENGINE_INSTANCE,
> +	XE3P_BASE_ENGINE_INSTANCE,
> +};
> +
> +/* Blitter Per-Engine-Instance */
> +static const struct __guc_mmio_reg_descr xe3p_blt_inst_regs[] = {
> +	COMMON_BASE_ENGINE_INSTANCE,
> +	XE3P_BASE_ENGINE_INSTANCE,
> +};
> +
> +/* XE3P - GSC Per-Engine-Instance */
> +static const struct __guc_mmio_reg_descr xe3p_gsc_inst_regs[] = {
> +	COMMON_BASE_ENGINE_INSTANCE,
> +	XE3P_BASE_ENGINE_INSTANCE,
> +};
> +
>  /*
>   * Empty list to prevent warnings about unknown class/instance types
>   * as not all class/instance types have entries on all platforms.
> @@ -245,6 +279,21 @@ static const struct __guc_mmio_reg_descr_group xe_hpg_lists[] = {
>  	{}
>  };
>  
> + /* List of lists for graphic product version >= 3500 */
> +static const struct __guc_mmio_reg_descr_group xe3p_lists[] = {
> +	MAKE_REGLIST(xe_lp_global_regs, PF, GLOBAL, 0),
> +	MAKE_REGLIST(xe_hpg_rc_class_regs, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE),
> +	MAKE_REGLIST(xe3p_rc_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE),
> +	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_VIDEO),
> +	MAKE_REGLIST(xe3p_vd_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_VIDEO),
> +	MAKE_REGLIST(xe_vec_class_regs, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_VIDEOENHANCE),
> +	MAKE_REGLIST(xe3p_vec_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_VIDEOENHANCE),
> +	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_BLITTER),
> +	MAKE_REGLIST(xe3p_blt_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_BLITTER),
> +	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_GSC_OTHER),
> +	MAKE_REGLIST(xe3p_gsc_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_GSC_OTHER),
> +	{}
> +};
>  static const char * const capture_list_type_names[] = {
>  	"Global",
>  	"Class",
> @@ -292,7 +341,9 @@ guc_capture_remove_stale_matches_from_list(struct xe_guc_state_capture *gc,
>  static const struct __guc_mmio_reg_descr_group *
>  guc_capture_get_device_reglist(struct xe_device *xe)
>  {
> -	if (GRAPHICS_VERx100(xe) >= 1255)
> +	if (GRAPHICS_VERx100(xe) >= 3500)

Since there's no IP with a version of exactly 35.00, I'd just do
"GRAPHICS_VER(xe) >= 35" to avoid any confusion.  Also in the comment a
little bit farther up, I'd replace the "graphic product version >= 3500"
with "Xe3p and beyond."


Matt

> +		return xe3p_lists;
> +	else if (GRAPHICS_VERx100(xe) >= 1255)
>  		return xe_hpg_lists;
>  	else
>  		return xe_lp_lists;
> 
> -- 
> 2.51.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
