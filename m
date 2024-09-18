Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C6EFCDD556
	for <intel-xe@archiver.kernel.org>; Wed, 18 Sep 2024 21:19:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 085DE10E641;
	Wed, 18 Sep 2024 21:19:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gny7hJAl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E79A310E641
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Sep 2024 21:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726694369; x=1758230369;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Phxxj3InwKnttY3ZA0fFMf5P1aD3wPKmADqq4PsBy58=;
 b=gny7hJAlZ2SYc9aBbyenikWFUOkB8ltodxctTvQoIkxC1sGO2hPXN73I
 M8RAWXXxQa3qXTZnmreBEg/R1yhSR7LdNudegUSuVuUIlWsDXhqMwNYjp
 wqCUbQt7tskct1pOadiUEJTfJ8iFZw3tQZm7CmEo/Q8cJQRrMZmAvtXVG
 AKYQQb1u0cn8UNUvbx1ipRx8Y6uNb+BSrd/XlRGczP+iFuR5coKkGVDmS
 KKVAbWlC0rUFKpjjTq5U03QbLrnyoTXSNDWbn+o8GPi9xZ1soa7B4Jv2g
 swWPn1DiXNy0GeuPA29ZX9IkD0aH5PQswwcjgk3GQlnzExr1tlDH7ItDN g==;
X-CSE-ConnectionGUID: 7eiDC4oDTPy0tma+v2xzOw==
X-CSE-MsgGUID: jt0bn9ReSI2DHgFEwA3N4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="25112431"
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; d="scan'208";a="25112431"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 14:19:28 -0700
X-CSE-ConnectionGUID: wfjEFHSKRMO4rs5bx8JLBQ==
X-CSE-MsgGUID: Ba7CFjN4TqKy9elAHDaquw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; d="scan'208";a="69712862"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Sep 2024 14:19:28 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Sep 2024 14:19:28 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Sep 2024 14:19:27 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 18 Sep 2024 14:19:27 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 18 Sep 2024 14:19:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IGJNYK7vd7NrLQCuzjhNPxBMFHQOdQukNtT0h/EdQTNCkNFSdMP4nQBm8ymuq6MRIcedVnNcTBKZNmoYaC0suj7/kqAiySO0+xFMQZlAkz4HBLCNrydK8UoK+UUthS9pmLM7U1l/FZ05DfiX3HAo7Yg3jMB2+/cS+d82s/JFsXBcO105D5+EtxJHBRWsP5n3+P/NB/DyEG6kc7YRymlR7Da/2T/dKeT8tYtLjye9rkYj0+NVRReq5/eD84XxPcqoNwE3CwzNaosrXoaq0bBWsRpm8rDry2B3NCNSpvAEvdpXjBiWBuDY0sCy9j3ayk8BppiIKZnVQFQyfBt5jXpeFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q8kN0eOjrhBhHFRtk+KBqUx/x4lSNcVOHAYLjS0LUGQ=;
 b=LqrzRe1Zc9Dg59BZABAVKM3c7iQnQnlP2HRH3uk7168EmXLC4OZ1abYLdO9JoGNgHfecyPrhwSq4ueQQa+vcGyl/BJaen30p+uUcRr2AXnSTJ0act5ONQWcfQx/S+YgAHI/U6Szod/UweayfwFAwFeoTL2c2e4nK4QBuA+gHZ2/WsF/38OOopiZvcYFpngVj7RAKGXpJjYZf3h4GnB/IYJPs2x120L7+0QDrilEH5gPi8byDHskcAI4lxLjuwU+nEslwiXUUOzE3txN1PBrgF2+ER8vCJlGNWiAFtHqQU1sW7Y2dUdMIvCTSDg9fg5yHqgX9z031PwBZy4cs1lUqXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB5818.namprd11.prod.outlook.com (2603:10b6:510:132::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.17; Wed, 18 Sep
 2024 21:19:25 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.7982.016; Wed, 18 Sep 2024
 21:19:25 +0000
Date: Wed, 18 Sep 2024 16:19:22 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
CC: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2 1/3] drm/xe: Move display reference timestamp readout
 to display/
Message-ID: <rgsiho6xglvsrbgrc5ik3ylw3xhln7zlmfllsjhubdr2czyxk5@big4bvtcxtfg>
References: <20240913162910.4145142-4-matthew.d.roper@intel.com>
 <87jzfad88n.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <87jzfad88n.fsf@intel.com>
X-ClientProxiedBy: MW2PR16CA0067.namprd16.prod.outlook.com
 (2603:10b6:907:1::44) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB5818:EE_
X-MS-Office365-Filtering-Correlation-Id: 020ddaa4-7252-4f61-3347-08dcd8279271
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4LexspMVVmhJc7uB9fe04wyfvFGCLbcvnIEqh7hsaGZFAKsu87pZYeRD9XOA?=
 =?us-ascii?Q?w2Uswbsc9IJlvJKyIpagl889nZbXMgWkXjSshUF+YQt8zqZE51v8+unJJFHw?=
 =?us-ascii?Q?dz4jF7757WX0/5Jx5PEkmilqo5PRD+xucf9Jns/n2WGPuoO+/qg51ziwp334?=
 =?us-ascii?Q?NKVCmAWxToMXZOv3RN3Qcd4oS1jNE3BpGzZdXei41x3xh3sVdOnnPtX6WrgE?=
 =?us-ascii?Q?pRzdWpS+RR9buhTg11qfZWZEBGHRx3wCIi+KHgaIqzrCCILGZltHZaTewvGv?=
 =?us-ascii?Q?tEuFEzOCsbVozdI57Z+8gRu7jv1XWyHba0rBYFaAG23/m9YKpWvUB8AJuJ2r?=
 =?us-ascii?Q?ISHP1rKmHkxL495lyrzJVCdTNl74ZZqlCvU8v3p5wqkVwl2PosF4YpZn1hPQ?=
 =?us-ascii?Q?TYOv2hPrqD1nEjcW9UsGpLI4hCoVa4tgnqHft2kTgLQgpu0od5OaLAYDqFJq?=
 =?us-ascii?Q?mdV7sSHkkS03fHUKAMm9r8Kv08pxu6lUChyDPcZr8QznMAUf4yY9gnUMyt6C?=
 =?us-ascii?Q?echfiwpbO7e82j8XFIE/htuWHTBltGMzA9V9ti1Tp06coMPrhkKtBGgwhOju?=
 =?us-ascii?Q?Qgqq6c2n4iJymVRUmqNt7cBk0fRVxVWP9mM4LtVzAEOtDQNmcAGhrdSyLK7K?=
 =?us-ascii?Q?MGFXKqhJNK/lCGgvTgNHvVz1WFtrEDSasA2/bMbW8C6Wd5KAkssBwP1ByvNl?=
 =?us-ascii?Q?cr26vlOQYokcgGBeVbv56nOYfOswsCuSw0nH1iiu+T2/rv9GQ5faMIdaBbfU?=
 =?us-ascii?Q?SMxUO9h3coXLdGpGoTIlSTm87ma/P7pXgqnu8uglpVjTInmIFeVfjB/pRiy2?=
 =?us-ascii?Q?Uw0mKr2CBMEnEseQQ+gh32tFHS7YZ0CeadmYWi4dSoqmm25e6RSHEKxbXBV8?=
 =?us-ascii?Q?+d0hV2WiqNl8l3mJ8Df9qzSUmzvVkcKNOOkHjmnJCMYaKJwJ+b/pG83TvqXg?=
 =?us-ascii?Q?SuhYeo55V5eukMzilp+KAfuy68QuyBW7jFo8PhFBK6gqqoo/RpX8eCfDTtxp?=
 =?us-ascii?Q?vz9ac1yaH4/I8TMJqPuiXP10QVR2BAgP9cuRmh0TpfSOprEDG6k0bQM8kQ1q?=
 =?us-ascii?Q?d5B0fWkCrQd8ymsWYrE+A6h89oGUAlcIcCOzdrH7eBA7Fi+GWgbTIsj+pIFS?=
 =?us-ascii?Q?m4k8OK9C+qEJnz0w4jSAAXU7lnGJZsMrXWjQIr/alxOtPxjpt9X1RanC8hbu?=
 =?us-ascii?Q?I+ypAovavxcP//ByY1TYOWutuZFQxeyTg+B1qcKJYP8eMPyJ23MLfqRmPvY2?=
 =?us-ascii?Q?VIMtMb2Usc2FVtGdjgL5WC6y+BshkvpG0vDti4BAqYFMXv1ZkaHAFYrcs9Mb?=
 =?us-ascii?Q?CYS1Qi9iK2y3/WFKURkW/aayza0+TYAvhs4/OwmTXRDZvw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ruzSCurpRAjiKY7/M0/TfLKJfcsi59PjA1pX6Apb9UUs1jfG648CFt0nhQfO?=
 =?us-ascii?Q?zxj5kNHkgDq37cerMMrm+/paJHYEndHlcYxxm9ICMl2dqq0KLxvF0GIoDXRn?=
 =?us-ascii?Q?82pgf16IaPzrDNIs6qe0I7EOF4Zl44nxeoh/zxrEhwgfa3b3aStxJAFMs/xg?=
 =?us-ascii?Q?nSvowakQPEQEidoZ/ndxIydpkSHRVD2s8Qs99Tf09IO3lBRKgfFyWwYOT5KY?=
 =?us-ascii?Q?9eb+8QLv+zlpBJx6b1hBIWv5jJyj9EH63/sIcm06aTKUWUQj0XpEbMqosPd3?=
 =?us-ascii?Q?NTU+YO4KkMDA1Io9fmfbP5dzc7ybTuYH0MgCRCQHqDO1Dsb8nX9TMikuSX7p?=
 =?us-ascii?Q?OF8XTOcmC4wwP/dwhHDwoNW/wOVSw3Rv4p4+S9hX0Snl4rU9abRodE0yIAd1?=
 =?us-ascii?Q?ms9b/NIIkUu+MkixrWzHnfWyBC40zXFJsiea9+xWzA0o0vWiVWNWU7rNaX03?=
 =?us-ascii?Q?h5t3AtATTjSqrY+wyWivIr05jKOBVO80x2cDI6RJpGF+OnUrq9EUuQ0jAGtk?=
 =?us-ascii?Q?qY81lI1EQx8gtxnJtWYhgksIE3f+WGhbKUTAG7IZyYe9n8Xo5HVt1Xwv9ea7?=
 =?us-ascii?Q?Q6rEkKCxZAXE7+u3oJizMGQzFmR5bQOUC9y5pZ9CCTOiKHYVMcKYAXZ7IaSb?=
 =?us-ascii?Q?StwHWB3UnGtYRwsJwlCgCdsvJYfYwMMRgmmbaUxbGYxmz8MpwZJa50xJIUwK?=
 =?us-ascii?Q?DYwdoFevyTWB5uRSCGfsEfxROu7vlnuDEesNfslNgLdpD9FVEPMn8XrhqGV3?=
 =?us-ascii?Q?KvicOWMbrEJ6p4I6SIkmUu+Hh9HsY1jKNMREty79vVeD2Fpwez2UB8sVvRYf?=
 =?us-ascii?Q?pggls7Qt7w36ou1+beemItdmKeZ5SRwC9EzixFZjzxh+ghkWxwUSEYacAxKA?=
 =?us-ascii?Q?16EQzJF2DRuo2t/P33b4V8ubunv6yFwOT5/RNlipNWs5DoT+ykZGBTxJB2f7?=
 =?us-ascii?Q?jrcn71BMBPCqQjE+NO7NUFftQgwbnq9+pJyBwI8UDAZqdKJQbXEZHzJlaZd0?=
 =?us-ascii?Q?BgNVZ0ce1ItA8yOVgBMAaP6Nvu42R3cVfpqNkETzTB5CszFGitin+en60Adr?=
 =?us-ascii?Q?0pQLYacAmyUG5+7IJpqsiRpcLtgP5h5caxOinf2L551HcSFIs1cttolZ7hdk?=
 =?us-ascii?Q?+E1WF+O9lJtBwJ67NanpKEt1YffNFXS4ABha20b+141QoKxGuqaenkGugH3U?=
 =?us-ascii?Q?PB0o0K0CplzFH2r4pCjcJXoS55R9K1kg24MXVMW2b6cv/PZ3nqqRSypDXPkK?=
 =?us-ascii?Q?t5Ma1SHwnNQhW6yZxHfZQ5jJLc7E9FNvk2BuXTbsacZT35i5NyIxrE7SwnHI?=
 =?us-ascii?Q?xr73mtZa1NnWIpN47nGD47yJXvOIue33RPjdSKB9OZxT5gouQ8xZ2xL5PgHY?=
 =?us-ascii?Q?8vNpyuAMIj372GWApMCrWoFY4xrZ/dZRqJ6fLy06/vvh54mHzpqo8GpZOJjT?=
 =?us-ascii?Q?KyioEm/u/UgvS52uu4mv6lO+auL2md2ZjPyCfIhB3Po0lleT7QkKgYKKm0JO?=
 =?us-ascii?Q?Q2HL3lcwZRyXU7zAj4EbnaR4OyA1OLpRhjHDdjYyH6cFhduBATWpwgmKhxIU?=
 =?us-ascii?Q?lJmyjESGqEgT/NYQ0O4IYGOfcI9USd2Ch4OigaJB/Udxl8vv3ZR5FXFG7Dmg?=
 =?us-ascii?Q?SQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 020ddaa4-7252-4f61-3347-08dcd8279271
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 21:19:25.3870 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T0CALT8Zoh8mNEBVXB0yOwf+x6ld6BkhlHVfPL9wdKjjspA0Yf6FDtxRk9wQ8dzTvrY/R+jD3Fp1Zd7Tay7rpowMPE/dmkiAi438PyJI2GA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5818
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

On Tue, Sep 17, 2024 at 10:55:52AM GMT, Jani Nikula wrote:
>On Fri, 13 Sep 2024, Matt Roper <matthew.d.roper@intel.com> wrote:
>> It's quite unusual to read display registers as part of GT
>> initialization, but use of the display reference timestamp is one
>> approach to calculating the GT clock frequency on older platforms.
>> Rename the function that does this readout and move it to display/ to
>> make it more clear what's actually happening when this route is taken.
>> Also add an assert that we've probed display before calling this
>> function since we never expect this to be the route taken on platforms
>> that lack display.
>>
>> In the future we may want to move to an intel_display implementation
>> that can be shared with i915, but we'll leave that for later.
>>
>> Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>
>Mixed feelings about this. On the one hand moving to display seems
>appropriate, but adding any new stuff to xe_display.c means more stuff
>to clean up for later.
>
>As you know, i915 does this as well in i915 core. The next logical step
>is then to have this in i915/display, and share the code between i915
>and xe. Adding another interface for i915/display.

humn... but what would be the alternative? Move the i915 one to
i915/display and then make both xe-core and i915-core use that?
If we move it to display/ here then we can land this and finish the
cleanup later.

Lucas De Marchi

>
>Worth it? Display itself doesn't seem to have a use for this. I don't
>know.
>
>
>BR,
>Jani.
>
>
>
>> ---
>>  drivers/gpu/drm/xe/display/xe_display.c | 18 ++++++++++++++++++
>>  drivers/gpu/drm/xe/display/xe_display.h |  4 ++++
>>  drivers/gpu/drm/xe/xe_gt_clock.c        | 24 ++++++------------------
>>  3 files changed, 28 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
>> index a3131a67e5b1..ac6d08a5cc73 100644
>> --- a/drivers/gpu/drm/xe/display/xe_display.c
>> +++ b/drivers/gpu/drm/xe/display/xe_display.c
>> @@ -29,6 +29,7 @@
>>  #include "intel_hdcp.h"
>>  #include "intel_hotplug.h"
>>  #include "intel_opregion.h"
>> +#include "xe_mmio.h"
>>  #include "xe_module.h"
>>
>>  /* Xe device functions */
>> @@ -510,3 +511,20 @@ int xe_display_probe(struct xe_device *xe)
>>  	unset_display_features(xe);
>>  	return 0;
>>  }
>> +
>> +u32 xe_display_read_ref_ts_freq(struct xe_device *xe)
>> +{
>> +	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
>> +	u32 ts_override = xe_mmio_read32(mmio, TIMESTAMP_OVERRIDE);
>> +	u32 base_freq, frac_freq;
>> +
>> +	base_freq = REG_FIELD_GET(TIMESTAMP_OVERRIDE_US_COUNTER_DIVIDER_MASK,
>> +				  ts_override) + 1;
>> +	base_freq *= 1000000;
>> +
>> +	frac_freq = REG_FIELD_GET(TIMESTAMP_OVERRIDE_US_COUNTER_DENOMINATOR_MASK,
>> +				  ts_override);
>> +	frac_freq = 1000000 / (frac_freq + 1);
>> +
>> +	return base_freq + frac_freq;
>> +}
>> diff --git a/drivers/gpu/drm/xe/display/xe_display.h b/drivers/gpu/drm/xe/display/xe_display.h
>> index 17afa537aee5..40030cac7fe9 100644
>> --- a/drivers/gpu/drm/xe/display/xe_display.h
>> +++ b/drivers/gpu/drm/xe/display/xe_display.h
>> @@ -43,6 +43,8 @@ void xe_display_pm_resume(struct xe_device *xe);
>>  void xe_display_pm_runtime_suspend(struct xe_device *xe);
>>  void xe_display_pm_runtime_resume(struct xe_device *xe);
>>
>> +u32 xe_display_read_ref_ts_freq(struct xe_device *xe);
>> +
>>  #else
>>
>>  static inline int xe_display_driver_probe_defer(struct pci_dev *pdev) { return 0; }
>> @@ -76,5 +78,7 @@ static inline void xe_display_pm_resume(struct xe_device *xe) {}
>>  static inline void xe_display_pm_runtime_suspend(struct xe_device *xe) {}
>>  static inline void xe_display_pm_runtime_resume(struct xe_device *xe) {}
>>
>> +static u32 xe_display_read_ref_ts_freq(struct xe_device *xe) { return 0; }
>> +
>>  #endif /* CONFIG_DRM_XE_DISPLAY */
>>  #endif /* _XE_DISPLAY_H_ */
>> diff --git a/drivers/gpu/drm/xe/xe_gt_clock.c b/drivers/gpu/drm/xe/xe_gt_clock.c
>> index cc2ae159298e..886c071c10f5 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_clock.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_clock.c
>> @@ -7,6 +7,7 @@
>>
>>  #include "xe_gt_clock.h"
>>
>> +#include "display/xe_display.h"
>>  #include "regs/xe_gt_regs.h"
>>  #include "regs/xe_regs.h"
>>  #include "xe_assert.h"
>> @@ -15,22 +16,6 @@
>>  #include "xe_macros.h"
>>  #include "xe_mmio.h"
>>
>> -static u32 read_reference_ts_freq(struct xe_gt *gt)
>> -{
>> -	u32 ts_override = xe_mmio_read32(&gt->mmio, TIMESTAMP_OVERRIDE);
>> -	u32 base_freq, frac_freq;
>> -
>> -	base_freq = REG_FIELD_GET(TIMESTAMP_OVERRIDE_US_COUNTER_DIVIDER_MASK,
>> -				  ts_override) + 1;
>> -	base_freq *= 1000000;
>> -
>> -	frac_freq = REG_FIELD_GET(TIMESTAMP_OVERRIDE_US_COUNTER_DENOMINATOR_MASK,
>> -				  ts_override);
>> -	frac_freq = 1000000 / (frac_freq + 1);
>> -
>> -	return base_freq + frac_freq;
>> -}
>> -
>>  static u32 get_crystal_clock_freq(u32 rpm_config_reg)
>>  {
>>  	const u32 f19_2_mhz = 19200000;
>> @@ -57,14 +42,17 @@ static u32 get_crystal_clock_freq(u32 rpm_config_reg)
>>
>>  int xe_gt_clock_init(struct xe_gt *gt)
>>  {
>> +	struct xe_device *xe = gt_to_xe(gt);
>>  	u32 ctc_reg = xe_mmio_read32(&gt->mmio, CTC_MODE);
>>  	u32 freq = 0;
>>
>>  	/* Assuming gen11+ so assert this assumption is correct */
>> -	xe_gt_assert(gt, GRAPHICS_VER(gt_to_xe(gt)) >= 11);
>> +	xe_gt_assert(gt, GRAPHICS_VER(xe) >= 11);
>>
>>  	if (ctc_reg & CTC_SOURCE_DIVIDE_LOGIC) {
>> -		freq = read_reference_ts_freq(gt);
>> +		xe_gt_assert(gt, xe->info.probe_display);
>> +
>> +		freq = xe_display_read_ref_ts_freq(xe);
>>  	} else {
>>  		u32 c0 = xe_mmio_read32(&gt->mmio, RPM_CONFIG0);
>
>-- 
>Jani Nikula, Intel
