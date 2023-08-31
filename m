Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E83C3C83F2B
	for <intel-xe@archiver.kernel.org>; Thu, 31 Aug 2023 06:56:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B000F10E570;
	Thu, 31 Aug 2023 06:56:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 312E410E570;
 Thu, 31 Aug 2023 06:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693465002; x=1725001002;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=oemDE72HvjtDQgCejVnEWN0acz/A6tI6kI0YNVIjvVQ=;
 b=HwMvjStFGCCoAFnAHl2sdhDmrbmTzNkld/o5t9duVRcoFJHrCxx7E2yA
 hGdKcTUFTmh+oKNpJnXUGoMuNNL5SyfUAbrbDx3ZuLh/1k04tkiO5zKl9
 bpsssEH7xiv61iqR5dTvriI67vXTXmYAa68nT4VimzL4Q/3iUVutB0UOF
 GitRMKq18TZ42k7iPZmQppHjlUt/arb5xLX9Jk+jI3EZ3f+f/eiqKcdcU
 zQ0fMTCu7ZbNm96EEMfzbplvcWjEshHdF5I6LMkjPPEgjzHCQ/yXDmlY2
 ddoH2pJn2yLXHVw+gp6V/JZUBDqWMkIjqKQ5bOm51vZ/oHw7C72//vanq g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="379586322"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; d="scan'208";a="379586322"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2023 23:55:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="913099334"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; d="scan'208";a="913099334"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Aug 2023 23:55:45 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 30 Aug 2023 23:55:45 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 30 Aug 2023 23:55:45 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 30 Aug 2023 23:55:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iIU05OIh8Qgzbzc19EJiIWaQeSIpWICkAZndytweYZ5U+1hGt/drdv3uYeo+n1tPJxF3gpnZ7NP/ivmbSxcb8wdtQBCnLAnmAc5pC+Ico5hNv+4WMeThOoCLH2AGsu37VCld0jVdNG6ubk03MuqP0/C3xwPKOJ+0igwDjJpAQ7vEpBaiVEu/5dyTytBkO6Rd1GH7mxBnibHe/Aa59kjHZzl+G19qqFPZi4O+e5ysQQKf8Pl+Y/zGRkcFwRLmjdl3luVcFIVd3onLZCIsPySgsKKm3jmKACp+mQ+xSfqge/zctIGHzMHQyR2ZcxC7H2Sh2qyqWlO4ym8FIeNOy6Djdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4QHJqlFDfTeMcyg3/gBLW/WefiCP7snwcC597loZTmg=;
 b=FHKwvufEm2TXxdqMjkseLEEwdiHkXSUfVWPWWSiYOVPOpUyxML+RuPjKfdAvRNOwoH4JStDlHuNg7Bk7wqKCDoLO819bxYpm5aWQOC2zGWZp66IHB9R67NDDboYXBLx3V/wVw5J3kA9Nwm4F0axYC9+FTEFnzjerWXJqD0sQWqqTm8/2rkXgo8Q8hqU9j/psm4lS5y3V8dH5OJF3dG+JkYvXSU/7r/4gWSHMeIluwUapByFjtyl42MPXOTrJgBKHXDBTF7B7rSu3LULBw5JIO9Y2vrMvnPyvezpQFJhltWmj3QAZ/591zul46UiDcpWWuj2q/66iz2nKzHe/fxHvTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by CH3PR11MB8210.namprd11.prod.outlook.com (2603:10b6:610:163::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Thu, 31 Aug
 2023 06:55:36 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::864b:5f88:8b9d:517f]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::864b:5f88:8b9d:517f%4]) with mapi id 15.20.6699.034; Thu, 31 Aug 2023
 06:55:36 +0000
Date: Thu, 31 Aug 2023 12:25:24 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, <igt-dev@lists.freedesktop.org>
Message-ID: <ZPA5XMoVMCElkXVy@bvivekan-mobl>
References: <20230829141107.1505705-1-lucas.demarchi@intel.com>
 <20230829141107.1505705-2-lucas.demarchi@intel.com>
 <ZPAzB95lw3vSqgan@bvivekan-mobl>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZPAzB95lw3vSqgan@bvivekan-mobl>
X-ClientProxiedBy: MA0P287CA0004.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::14) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|CH3PR11MB8210:EE_
X-MS-Office365-Filtering-Correlation-Id: 77d50121-5961-4bd8-aba0-08dba9ef4763
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +k028EWyP7AJg0zqwMvDN9vTfDf+nEVoltEMutZqamhILWQfSR4kdzHee8SDuMTW6k+08w7qE5qWNnlXzWE7Kw/EPhlyeDyVWPsxXUe08ngy2w6lFeMbQHT21PK2YvneEbuTdNAMNn4Z1i1UsbjxumlyPqAQF2GIThr7h/04ev2P9xQcwDw3kHhio3yFXnTwj29k+kzqBxIVkjuC3d9UL9VvQYVrZrA4jw+2OkW3SMDcVmysVyNytKbasOsmQ3tUgji19gWKpUlmiGQxzRDY89QqrBgkhqnM2O+UxHR5+BjV7nutwnn57ZvpMClulJlUpz7d5jZvSgpqaGIPRykyrq590Uk1dVq3jw42VUn9nlg1XvCb1v0xh0bP1iXKL/VnkEQ+E2TuO32M/fw8008ve4ZVynJCWsQxuAWBUKD0fjtI0hE1J+eBT5TH4DeZclmByc2r447H7fITeId70U4eAsVSm20wRjBvXccJvwFGXUb23S66umxtaOcTu1DorQTvAk9wmGVeznGKB1ipx+4ux+MAcG+NBCGqy1dGrxPS+jvvt7PvRTJ5iAT9I2KwzABU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(39860400002)(136003)(346002)(396003)(376002)(451199024)(1800799009)(186009)(6512007)(9686003)(316002)(38100700002)(41300700001)(82960400001)(5660300002)(4326008)(33716001)(44832011)(8676002)(86362001)(2906002)(8936002)(450100002)(6666004)(66556008)(6506007)(66476007)(6486002)(478600001)(53546011)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmhzV3dUNExIeW4vZUJ1bU16dk5YYS9Cbnl4QW9RblZ4d0JEOE01N1E3Tk5D?=
 =?utf-8?B?bzNYZFYwWkRWdHdrSHFnRkhyYlpKUXZNeTQ1Q3I1TG5VdHNxWnlMV0Z2aW5P?=
 =?utf-8?B?eGkyQk5LVG14L29tWVg3QmluUDFZVENrVXhwa2xPaWdCWnNvTnkxOHU3OFkz?=
 =?utf-8?B?V1U5Mnc5c01pQ0UzdDNqTlhDd2RwUEppNG8xcVFvRC80bEYzRGZ0L0s1YWp4?=
 =?utf-8?B?ZlZySHY4MnRURndWc2F6T1VoVUEwczVNelhncENKdXNRWEVUbis0NWcwS1FM?=
 =?utf-8?B?YlVaNlExOUZza0RtajIzRG9mUTJNaWhwUk9KSUFHQzNETDY4cXM4bjdHMTZK?=
 =?utf-8?B?T2MvVk9vVjFFemt3Sk13NTZKY3NPZGo1NW00SEs5Y3lSM2h6VWpSZ1J2ZTd5?=
 =?utf-8?B?djBmSE1zTDBOSHZjSXJIME9PazF5QTJRSXJHaHJGWEJSa05RdkV5Wi9CVlQ0?=
 =?utf-8?B?QkxoN0Z2cWRJREUydUdvVHV2NGxuY0FpRDNyWHA5UnZUM0hRamJFWlJIWEZj?=
 =?utf-8?B?TjlReFUyd3J0blN5R1RjWStMclMwTzVBRktkc2orL3M5ZmpiemxZcUNTSmNa?=
 =?utf-8?B?UEJYOFVodGVzcGNEcUJlVVhvemlrQ3pVVDUwTDBpZ20rbURHSVNab24rNlc3?=
 =?utf-8?B?eW1JdTVzSjFZTGlqTytoVkdaNFZBYUxLUmptZXZ4d3VlNXY0NXR5bnZpRnJ0?=
 =?utf-8?B?UnRodDRtd1lwTnB2cXFpbDBwSzdyUmZMODh6blBxSTNLZzc2VkFmQWFMakp0?=
 =?utf-8?B?Mk5WOUlhYzV6MERuaWIzNnE3VDVvb3RHZnBXVVpnbFlTbzJmalZkYmZNM0Fw?=
 =?utf-8?B?OWoyQ2FZOUVvekl5Skd5UHMxTllsKzBCUThxb2J6MnE4OVJuVkV4WE0zSXJr?=
 =?utf-8?B?Rmp1V2laS01mRWNTNU5tSkk1anpqSnpVNjZBUllDVE9lRnJWandkNlNXYjdT?=
 =?utf-8?B?UUFLaWlqUjJrc0g1ZFFNekVaYTFGK24wSjZ1Z1dMdHNVNXdTb2JGVEx6d0dw?=
 =?utf-8?B?M1ptK1RMcEVYQVRZcUdabWw5SHFraDlQbkZySWtWZEQ1VityY0dMcW5QeWsz?=
 =?utf-8?B?Q2hZNU5vcGNZTlc2L1RKWUthWTBmcTNMNXBjR0hTalVGQW1pK3pEU2xORDla?=
 =?utf-8?B?aWRnckR1eEJhampqMWQzQlBqZk4yMDREQjM1N0hjZEhtaXpRVWh1UkorK0or?=
 =?utf-8?B?WTA3Z3Zlb3hVcWZNcFVoSHRPMGNnYjkrQitqSHVGOEtKQzA5Y3NEMlBmWnlV?=
 =?utf-8?B?ZlFjRmkyZUI0eWFPY1o4OTZBaENydFVNUzdVK3MzazNPZ0p4TmUzSmtHTGJX?=
 =?utf-8?B?TElzSmd2alEveFh0ZzVrM1U0bUd5c2NZVVBzNDFIL2dLVmk0YzlxUGpvaXdn?=
 =?utf-8?B?OXhWWmZHQkNzQzFXK3lxQnN6cHg4N09yQ3RYUVpPWW82Ri9KckN4dlVNalZH?=
 =?utf-8?B?Wm9qT1hiOS9laHRJZm5kc1RiUHVHV3hzbEdqN2ZZY3lIU01zdFdiVkxDMFV0?=
 =?utf-8?B?dDNmaUlySGdhQXRJWGRqQTFmcDJMU0xacGxFZHZIUjJDM1haVnl4VzAwRnRV?=
 =?utf-8?B?bHorUWFQTWo5QWtNeHN5bkNHV01GUENZNk5NRE4rYTkrKyt4aVFpbXhuRCth?=
 =?utf-8?B?NWFXNy9VL2twbVBiTnNMMlQ5N2EwWU11MGFkTGNJL3VrN3A3amNJdi9jbzdJ?=
 =?utf-8?B?NnprL3ZzVGx3bk9TbExGMFcxNTdIb1N6WkpJSEI3Z2pFOTNrdHR5aVNZOURT?=
 =?utf-8?B?OHBsRlZvdVRQbGhDZ2Z3UDFHNHkxWW1pdkE0b3lSMnlEN1BoekhacUJnMjZx?=
 =?utf-8?B?OVdBY2htQnowZ2ZlZW9TQmpVdjVBNC9XQldKTy9QZm1lVjZVaW4zUEo3T0hp?=
 =?utf-8?B?TnBrS3pBMmxHeGNtSE9uelRweEg3dmZYSEx4TldvdWpmUzBsV3pOMnJ5OUZr?=
 =?utf-8?B?Nmg4R0F0TnBLa1BMQm1MdCt6aG9WMmEzM2VZaVRCRUNObGRMSk8xVk85YWxh?=
 =?utf-8?B?RHdmZjl1OWNZUVhDVlpTWGRRaFJNclFCTmk0V01BKzA4WnllSGFPNVBZaEt3?=
 =?utf-8?B?SjQxbW1meCt1aWFEa2M5czliZmtmRlBuUzNnaDhDSUl2alppeFdzRUVzc2Qz?=
 =?utf-8?B?RU1RcTAySGd3a3g0cGZvZXdlSkw0TGVDa0JSc05MZkUyVEs4dmcyekhQUUQv?=
 =?utf-8?B?R0NwMG1CYjMyb3FBSjdGSUhmRmNQaFdiekZuNFRGL2RnMWYyR1JsRC9ZRFlq?=
 =?utf-8?B?dDJtVnRwT3F6Vms5QzhlMTFXRnZuYmdzMUQrVW9nTUlTUXRKckptS21pM3RX?=
 =?utf-8?Q?Qg2UjOTmRjasD7CB2R?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 77d50121-5961-4bd8-aba0-08dba9ef4763
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 06:55:36.6125 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fepx9bJOoIft+Ap1TlXRKluBwrCOmcBU2chT6LVC8B4oENMzx5UiVawXKxnM0eOmYMmwfmR8ym7JOgB0zYlLdY6XV3w9V9z5HhuBOU/eiQ78DK2LDCNE5MR+xFnk1R/L
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8210
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH igt 1/4] lib: Add xe_pciids.h
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 31.08.2023 11:58, Balasubramani Vivekanandan wrote:
> On 29.08.2023 07:11, Lucas De Marchi wrote:
> > With the introduction of Lunar Lake, igt won't be able to just re-use
> > i915_pciids.h for both drivers anymore since the support for LNL is only
> > coming with the xe module. Copy xe_pciids.h from the drm-xe-next branch
> > (up to commit b9c9020fc816 ("drm/xe/pvc: Use fast copy engines as
> > migrate engine on PVC") and start including it where needed. This brings
> > all the LNL PCI IDs.
> 
> I couldn't find the commit hash b9c9020fc816. Is it lost due to rebase?
> In that case, does it make sense to use the commit hash or just keep the
> commit subject?
> 
> Regards,
> Bala

Apart from that.

Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Regards,
Bala

> 
> > 
> > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > ---
> >  docs/reference/igt-gpu-tools/meson.build |   1 +
> >  lib/intel_device_info.c                  |   1 +
> >  lib/xe_pciids.h                          | 215 +++++++++++++++++++++++
> >  3 files changed, 217 insertions(+)
> >  create mode 100644 lib/xe_pciids.h
> > 
> > diff --git a/docs/reference/igt-gpu-tools/meson.build b/docs/reference/igt-gpu-tools/meson.build
> > index 6b832ad27..513385b4b 100644
> > --- a/docs/reference/igt-gpu-tools/meson.build
> > +++ b/docs/reference/igt-gpu-tools/meson.build
> > @@ -21,6 +21,7 @@ ignore_headers = [
> >  	'media_fill_gen9.h',
> >  	'gen9_render.h',
> >  	'version.h',
> > +	'xe_pciids.h',
> >  ]
> >  
> >  test_groups = [
> > diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
> > index 2c9a45b68..5d53d2906 100644
> > --- a/lib/intel_device_info.c
> > +++ b/lib/intel_device_info.c
> > @@ -1,6 +1,7 @@
> >  #include "intel_chipset.h"
> >  #include "i915_pciids.h"
> >  #include "i915_pciids_local.h"
> > +#include "xe_pciids.h"
> >  
> >  #include <strings.h> /* ffs() */
> >  
> > diff --git a/lib/xe_pciids.h b/lib/xe_pciids.h
> > new file mode 100644
> > index 000000000..29f07a00a
> > --- /dev/null
> > +++ b/lib/xe_pciids.h
> > @@ -0,0 +1,215 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2022 Intel Corporation
> > + */
> > +
> > +#ifndef _XE_PCIIDS_H_
> > +#define _XE_PCIIDS_H_
> > +
> > +/*
> > + * Lists below can be turned into initializers for a struct pci_device_id
> > + * by defining INTEL_VGA_DEVICE:
> > + *
> > + * #define INTEL_VGA_DEVICE(id, info) { \
> > + *	0x8086, id,			\
> > + *	~0, ~0,				\
> > + *	0x030000, 0xff0000,		\
> > + *	(unsigned long) info }
> > + *
> > + * And then calling like:
> > + *
> > + * XE_TGL_12_GT1_IDS(INTEL_VGA_DEVICE, ## __VA_ARGS__)
> > + *
> > + * To turn them into something else, just provide a different macro passed as
> > + * first argument.
> > + */
> > +
> > +/* TGL */
> > +#define XE_TGL_GT1_IDS(MACRO__, ...)		\
> > +	MACRO__(0x9A60, ## __VA_ARGS__),	\
> > +	MACRO__(0x9A68, ## __VA_ARGS__),	\
> > +	MACRO__(0x9A70, ## __VA_ARGS__)
> > +
> > +#define XE_TGL_GT2_IDS(MACRO__, ...)		\
> > +	MACRO__(0x9A40, ## __VA_ARGS__),	\
> > +	MACRO__(0x9A49, ## __VA_ARGS__),	\
> > +	MACRO__(0x9A59, ## __VA_ARGS__),	\
> > +	MACRO__(0x9A78, ## __VA_ARGS__),	\
> > +	MACRO__(0x9AC0, ## __VA_ARGS__),	\
> > +	MACRO__(0x9AC9, ## __VA_ARGS__),	\
> > +	MACRO__(0x9AD9, ## __VA_ARGS__),	\
> > +	MACRO__(0x9AF8, ## __VA_ARGS__)
> > +
> > +#define XE_TGL_IDS(MACRO__, ...)		\
> > +	XE_TGL_GT1_IDS(MACRO__, ## __VA_ARGS__),\
> > +	XE_TGL_GT2_IDS(MACRO__, ## __VA_ARGS__)
> > +
> > +/* RKL */
> > +#define XE_RKL_IDS(MACRO__, ...)		\
> > +	MACRO__(0x4C80, ## __VA_ARGS__),	\
> > +	MACRO__(0x4C8A, ## __VA_ARGS__),	\
> > +	MACRO__(0x4C8B, ## __VA_ARGS__),	\
> > +	MACRO__(0x4C8C, ## __VA_ARGS__),	\
> > +	MACRO__(0x4C90, ## __VA_ARGS__),	\
> > +	MACRO__(0x4C9A, ## __VA_ARGS__)
> > +
> > +/* DG1 */
> > +#define XE_DG1_IDS(MACRO__, ...)		\
> > +	MACRO__(0x4905, ## __VA_ARGS__),	\
> > +	MACRO__(0x4906, ## __VA_ARGS__),	\
> > +	MACRO__(0x4907, ## __VA_ARGS__),	\
> > +	MACRO__(0x4908, ## __VA_ARGS__),	\
> > +	MACRO__(0x4909, ## __VA_ARGS__)
> > +
> > +/* ADL-S */
> > +#define XE_ADLS_IDS(MACRO__, ...)		\
> > +	MACRO__(0x4680, ## __VA_ARGS__),	\
> > +	MACRO__(0x4682, ## __VA_ARGS__),	\
> > +	MACRO__(0x4688, ## __VA_ARGS__),	\
> > +	MACRO__(0x468A, ## __VA_ARGS__),	\
> > +	MACRO__(0x4690, ## __VA_ARGS__),	\
> > +	MACRO__(0x4692, ## __VA_ARGS__),	\
> > +	MACRO__(0x4693, ## __VA_ARGS__)
> > +
> > +/* ADL-P */
> > +#define XE_ADLP_IDS(MACRO__, ...)		\
> > +	MACRO__(0x46A0, ## __VA_ARGS__),	\
> > +	MACRO__(0x46A1, ## __VA_ARGS__),	\
> > +	MACRO__(0x46A2, ## __VA_ARGS__),	\
> > +	MACRO__(0x46A3, ## __VA_ARGS__),	\
> > +	MACRO__(0x46A6, ## __VA_ARGS__),	\
> > +	MACRO__(0x46A8, ## __VA_ARGS__),	\
> > +	MACRO__(0x46AA, ## __VA_ARGS__),	\
> > +	MACRO__(0x462A, ## __VA_ARGS__),	\
> > +	MACRO__(0x4626, ## __VA_ARGS__),	\
> > +	MACRO__(0x4628, ## __VA_ARGS__),	\
> > +	MACRO__(0x46B0, ## __VA_ARGS__),	\
> > +	MACRO__(0x46B1, ## __VA_ARGS__),	\
> > +	MACRO__(0x46B2, ## __VA_ARGS__),	\
> > +	MACRO__(0x46B3, ## __VA_ARGS__),	\
> > +	MACRO__(0x46C0, ## __VA_ARGS__),	\
> > +	MACRO__(0x46C1, ## __VA_ARGS__),	\
> > +	MACRO__(0x46C2, ## __VA_ARGS__),	\
> > +	MACRO__(0x46C3, ## __VA_ARGS__)
> > +
> > +/* ADL-N */
> > +#define XE_ADLN_IDS(MACRO__, ...)		\
> > +	MACRO__(0x46D0, ## __VA_ARGS__),	\
> > +	MACRO__(0x46D1, ## __VA_ARGS__),	\
> > +	MACRO__(0x46D2, ## __VA_ARGS__)
> > +
> > +/* RPL-S */
> > +#define XE_RPLS_IDS(MACRO__, ...)		\
> > +	MACRO__(0xA780, ## __VA_ARGS__),	\
> > +	MACRO__(0xA781, ## __VA_ARGS__),	\
> > +	MACRO__(0xA782, ## __VA_ARGS__),	\
> > +	MACRO__(0xA783, ## __VA_ARGS__),	\
> > +	MACRO__(0xA788, ## __VA_ARGS__),	\
> > +	MACRO__(0xA789, ## __VA_ARGS__),	\
> > +	MACRO__(0xA78A, ## __VA_ARGS__),	\
> > +	MACRO__(0xA78B, ## __VA_ARGS__)
> > +
> > +/* RPL-U */
> > +#define XE_RPLU_IDS(MACRO__, ...)		\
> > +	MACRO__(0xA721, ## __VA_ARGS__),	\
> > +	MACRO__(0xA7A1, ## __VA_ARGS__),	\
> > +	MACRO__(0xA7A9, ## __VA_ARGS__)
> > +
> > +/* RPL-P */
> > +#define XE_RPLP_IDS(MACRO__, ...)		\
> > +	MACRO__(0xA720, ## __VA_ARGS__),	\
> > +	MACRO__(0xA7A0, ## __VA_ARGS__),	\
> > +	MACRO__(0xA7A8, ## __VA_ARGS__)
> > +
> > +/* DG2 */
> > +#define XE_DG2_G10_IDS(MACRO__, ...)		\
> > +	MACRO__(0x5690, ## __VA_ARGS__),	\
> > +	MACRO__(0x5691, ## __VA_ARGS__),	\
> > +	MACRO__(0x5692, ## __VA_ARGS__),	\
> > +	MACRO__(0x56A0, ## __VA_ARGS__),	\
> > +	MACRO__(0x56A1, ## __VA_ARGS__),	\
> > +	MACRO__(0x56A2, ## __VA_ARGS__)
> > +
> > +#define XE_DG2_G11_IDS(MACRO__, ...)		\
> > +	MACRO__(0x5693, ## __VA_ARGS__),	\
> > +	MACRO__(0x5694, ## __VA_ARGS__),	\
> > +	MACRO__(0x5695, ## __VA_ARGS__),	\
> > +	MACRO__(0x5698, ## __VA_ARGS__),	\
> > +	MACRO__(0x56A5, ## __VA_ARGS__),	\
> > +	MACRO__(0x56A6, ## __VA_ARGS__),	\
> > +	MACRO__(0x56B0, ## __VA_ARGS__),	\
> > +	MACRO__(0x56B1, ## __VA_ARGS__)
> > +
> > +#define XE_DG2_G12_IDS(MACRO__, ...)		\
> > +	MACRO__(0x5696, ## __VA_ARGS__),	\
> > +	MACRO__(0x5697, ## __VA_ARGS__),	\
> > +	MACRO__(0x56A3, ## __VA_ARGS__),	\
> > +	MACRO__(0x56A4, ## __VA_ARGS__),	\
> > +	MACRO__(0x56B2, ## __VA_ARGS__),	\
> > +	MACRO__(0x56B3, ## __VA_ARGS__)
> > +
> > +#define XE_DG2_IDS(MACRO__, ...)		\
> > +	XE_DG2_G10_IDS(MACRO__, ## __VA_ARGS__),\
> > +	XE_DG2_G11_IDS(MACRO__, ## __VA_ARGS__),\
> > +	XE_DG2_G12_IDS(MACRO__, ## __VA_ARGS__)
> > +
> > +#define XE_ATS_M150_IDS(MACRO__, ...)		\
> > +	MACRO__(0x56C0, ## __VA_ARGS__)
> > +
> > +#define XE_ATS_M75_IDS(MACRO__, ...)		\
> > +	MACRO__(0x56C1, ## __VA_ARGS__)
> > +
> > +#define XE_ATS_M_IDS(MACRO__, ...)		\
> > +	XE_ATS_M150_IDS(MACRO__, ## __VA_ARGS__),\
> > +	XE_ATS_M75_IDS(MACRO__, ## __VA_ARGS__)
> > +
> > +/* PVC */
> > +#define XE_PVC_XT_IDS(MACRO__, ...)		\
> > +	MACRO__(0x0BD5, ## __VA_ARGS__),	\
> > +	MACRO__(0x0BD6, ## __VA_ARGS__),	\
> > +	MACRO__(0x0BD7, ## __VA_ARGS__),	\
> > +	MACRO__(0x0BD8, ## __VA_ARGS__),	\
> > +	MACRO__(0x0BD9, ## __VA_ARGS__),	\
> > +	MACRO__(0x0BDA, ## __VA_ARGS__),	\
> > +	MACRO__(0x0BDB, ## __VA_ARGS__),	\
> > +	MACRO__(0x0BE0, ## __VA_ARGS__),	\
> > +	MACRO__(0x0BE1, ## __VA_ARGS__),	\
> > +	MACRO__(0x0BE5, ## __VA_ARGS__)
> > +
> > +#define XE_PVC_IDS(MACRO__, ...)		\
> > +	XE_PVC_XT_IDS(MACRO__, ## __VA_ARGS__)
> > +
> > +/* MTL */
> > +#define XE_MTL_M_IDS(MACRO__, ...)		\
> > +	MACRO__(0x7D40, ## __VA_ARGS__),	\
> > +	MACRO__(0x7D43, ## __VA_ARGS__),	\
> > +	MACRO__(0x7DC0, ## __VA_ARGS__)
> > +
> > +#define XE_MTL_P_IDS(MACRO__, ...)		\
> > +	MACRO__(0x7D45, ## __VA_ARGS__),	\
> > +	MACRO__(0x7D47, ## __VA_ARGS__),	\
> > +	MACRO__(0x7D50, ## __VA_ARGS__),	\
> > +	MACRO__(0x7D55, ## __VA_ARGS__),	\
> > +	MACRO__(0x7DC5, ## __VA_ARGS__),	\
> > +	MACRO__(0x7DD0, ## __VA_ARGS__),	\
> > +	MACRO__(0x7DD5, ## __VA_ARGS__)
> > +
> > +#define XE_MTL_S_IDS(MACRO__, ...)		\
> > +	MACRO__(0x7D60, ## __VA_ARGS__),	\
> > +	MACRO__(0x7DE0, ## __VA_ARGS__)
> > +
> > +#define XE_ARL_IDS(MACRO__, ...)		\
> > +	MACRO__(0x7D67, ## __VA_ARGS__)
> > +
> > +#define XE_MTL_IDS(MACRO__, ...)		\
> > +	XE_MTL_M_IDS(MACRO__, ## __VA_ARGS__),	\
> > +	XE_MTL_P_IDS(MACRO__, ## __VA_ARGS__),	\
> > +	XE_MTL_S_IDS(MACRO__, ## __VA_ARGS__),	\
> > +	XE_ARL_IDS(MACRO__, ## __VA_ARGS__)
> > +
> > +#define XE_LNL_IDS(MACRO__, ...) \
> > +	MACRO__(0x6420, ## __VA_ARGS__), \
> > +	MACRO__(0x64A0, ## __VA_ARGS__), \
> > +	MACRO__(0x64B0, ## __VA_ARGS__)
> > +
> > +#endif
> > -- 
> > 2.40.1
> > 
