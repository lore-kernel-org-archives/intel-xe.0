Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CC0AC27C79
	for <intel-xe@archiver.kernel.org>; Mon, 17 Jun 2024 18:07:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20E7B10E48F;
	Mon, 17 Jun 2024 18:07:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n0KzAnn8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F9B210E48F
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Jun 2024 18:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718647641; x=1750183641;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UTFh69lDQCOMzASE9SjEMAxdQ6Y5zlJlIn7w2+HuQCs=;
 b=n0KzAnn8bisYmV4LRuum8EwxxEm/7E8R0UUuT/LEhS4e02zQk7YMf7Bs
 VvDdXVAVyzNt2NjEmsdGWQwBTdnOalOEdmeGlb7bFFdHiv2xQMQhxtmgb
 zRjm1P6BUwoUlHHQiilH0INI0CJCzKUfHmqOhTzCdMafpEOskYFy0xux7
 nZGfm+mYatEu5Qsp7YJ5bBi14ztGu5AUnzcKdEg8msCZJ98wAQEi42iBP
 WlK3i/70fHwkr4lk6ZOhrVX/4UqwG3czMij4/KnFsDT2IzdAnROsIbrVs
 9m1iIV+B/siIvkEfnzTfiYxbYTcTv2PISHPkCZqWbeiSY/NGC+gl8XTCY g==;
X-CSE-ConnectionGUID: x76U91ciT0aoIb8Q/EOofQ==
X-CSE-MsgGUID: lED3s1JQTaa5hmho+DzUvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="15329435"
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; d="scan'208";a="15329435"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 11:07:20 -0700
X-CSE-ConnectionGUID: ZxpXMrlPSsKMZJheyggr6A==
X-CSE-MsgGUID: JdQT01AqRz2wm+801gUpcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; d="scan'208";a="41141966"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jun 2024 11:07:19 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 17 Jun 2024 11:07:19 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 17 Jun 2024 11:07:19 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 17 Jun 2024 11:07:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lUCZibQ9FRbwgBlfZYwrZnkrUWIjNK84/1hBUEhWGuP0WKUn7Djt0UX9zdjPcxfl0pdpkRCMe3scwzJfHax5ZdLce0wCai4QCiSybZkD5R7M39xSPL7+cZHMicbkIYyL8Nk7RnQCxhdfaWQNzxPGkiXWiNsYK3AUIj3kUyDn5VwdIvbPz7Bx3rSjP2w+tR80B9mqe9sqVkS7ZrB+HnTDn+4I95NB13oL4IXlBvuEPUVxkpJvwLuOPNgCfjSNoXrRY+qRTz2kCzduEnnDV7vbZaeDtDJyX3kBCe/jjDxMFCDo9jgQl1Ul5wdvm++ImnrTxQqMCBLNocXZH3x1Ip4uGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ADndsmYUTdGYhnD0hEbS+tHrhNe/An3sz7wqB+mdc+U=;
 b=PCd+C4dx/OEUqk+h0Jo658yljtQ3siexrcKDg1ZDSP8h9J3VfDSSsOh/UR6SejG11oli8cLz2ndjb2je8+u7XkK/5CwliZGmmqAkZkfgWxpcrGuCEet8kbMdjfCTU1aXqPyVmWMtlUqMyoPNYpYa4bs4Jh5cFJlCBZWfyLJ7mAupUXfkBWPQCadh2fi1EdrbJr/0nKFmEMcAV+Ty8BZaSUX8KMSPBufJ9GCIiY4cQC7d6A5xbmXFNxDzwY7Kzq9b5XQxqvtS1xWNYKiFvR3br61+DYjsAsvVxcbn1pTsJGbTOgU0BhHZ0uA/Rfj8MixQwKI2pbQq2c5WA6jdBKJlHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB7663.namprd11.prod.outlook.com (2603:10b6:510:27c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Mon, 17 Jun
 2024 18:07:16 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.7677.027; Mon, 17 Jun 2024
 18:07:16 +0000
Date: Mon, 17 Jun 2024 18:06:20 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [RFC 0/3] FW guard class
Message-ID: <ZnB7HJ3qKSCpyNwR@DUT025-TGLU.fm.intel.com>
References: <20240617143430.641-1-michal.wajdeczko@intel.com>
 <ZnBxSFpuGjc9c9KJ@DUT025-TGLU.fm.intel.com>
 <ZnB51-d3XtwUfPfT@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZnB51-d3XtwUfPfT@intel.com>
X-ClientProxiedBy: SJ0PR05CA0077.namprd05.prod.outlook.com
 (2603:10b6:a03:332::22) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB7663:EE_
X-MS-Office365-Filtering-Correlation-Id: d61474cd-733b-4551-9a92-08dc8ef85179
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|1800799021|376011;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fExzUJPrW78K10hS7oOhBhL01HiRrWpUIWXR7viQYlMrJI2fcXEKMkpxm2oG?=
 =?us-ascii?Q?GGklN0hJvU86kc6JCWlJUVBoRhwoAV8SjPngiP6obSBNu3vymC7+5+sQkkkD?=
 =?us-ascii?Q?F62oSgZyO/PNtVMd2BML9UQlY+7AH9WX1LId7EaBVdYEFoqQ9RiFlhoSdoCP?=
 =?us-ascii?Q?QlVQPabkJrkb67K2rkDpD/ZfgOAq1SuVZl0WVs0kuJj4xtw9yTADOt4Jtq3t?=
 =?us-ascii?Q?CjXjIk9SzKefPsEhAafvYjY5uEJbrlNbkYFknXkS9RsgT9C5qZbit9LmYBFd?=
 =?us-ascii?Q?2dS0SD8AusM0Vr4tOzkMxdhsCrcqlNY22Iiyb5ooG48Mf9nSL/lD2ioBHwDj?=
 =?us-ascii?Q?6oDM2cwJAqQaDDAhXToBGPFBJNWJvciqBc+vF7f+sXOvVgDxiYPAZJehWeUS?=
 =?us-ascii?Q?+8jE1RI5p+U5L6tKq/3k0c0cEWMZLp9Ljy2r/NARdIYx85jomW+w0bxZbbqi?=
 =?us-ascii?Q?FToTfYs9f8th8Rodp+7h6/iwP+ndnm+WVG7LI0O8yZN7UTXlXRf5ECyWen38?=
 =?us-ascii?Q?G6uSP1vvY06zm0uqg/4MHJOcrSd00OaS15IlybC7GHWy3GuJSX2aPE8gdM5P?=
 =?us-ascii?Q?EXsWEHUZD4BGqaDnQzKC0E+gEkc/xKUYjJgdfAM2IxDLuhEmxzFq78Xk/LV8?=
 =?us-ascii?Q?MlR9pWikPwbP6kjQ6igsUN6/xTzOJmM9iF0Hda6j+R1ZZg0SvJO1pmDb3C9h?=
 =?us-ascii?Q?tA0UaFNRQ5VD5IHy5xF8RpOjszrblz/qHR7ncc56+FFG9BiKyTHEaOXd51UB?=
 =?us-ascii?Q?przfp1ffqlT44avB7dpDqzUhCH6Nhx3vVsFtUdVszjsumMfDtRgV+gDee4dg?=
 =?us-ascii?Q?8Sbsx79L8WGavq2+GuzHByhkA1QYpI+dXZDwFfJ9p64AoI9jnXciO7rgQ5CI?=
 =?us-ascii?Q?Crc19rzh59Cu5d0+PIKHUwcnMJVQXFUOnu0LNiEosMDRrr7j8pNcbHqMaFxs?=
 =?us-ascii?Q?WXn5tLnTjFtmIRxXIdwHj7Km3YIz4hAFmHQ9OZOobvLIX020A1ji4LfZpJ8v?=
 =?us-ascii?Q?WZkH95u1sRMuNCy+KLD41KZPnK724AMq0PkU192uAD+mRfOsroRpFIs41N1s?=
 =?us-ascii?Q?mS+e0mXyXuNAY+cTjfx+F84rxuckSfuWtXtBYIaMPK+6vQbnN0wF4jpvX1ZO?=
 =?us-ascii?Q?81TVneILVuZmy7ABjfcnDncQRylBGlUnJvCfNdbnqYQf4R8AXv7mM48F3Tl0?=
 =?us-ascii?Q?L9Gxv4vxDF0vKvPEhlwNovLlnDC21rbWG2Is21YbQ8CYUBeUGMXOlYBeWSHe?=
 =?us-ascii?Q?ebw7oGErZ191eMqqUnGMTb3jE0pYasT8gSABgNcjH1vFOIpCO0yXpDCqMjpj?=
 =?us-ascii?Q?u9url+oXU30j8tP92zg4WbBt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(1800799021)(376011); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4fais+mzFvaUGQCzKTZIF1v67t2WyWEEHoz/Z42tAK5rot0OYwu8eGx5u1CJ?=
 =?us-ascii?Q?lsi+DMCCTUb5C66nGfPXrZAiVkcAOK4tDaax/DgOLPWL4h/utSG3tjRy+NAL?=
 =?us-ascii?Q?0pmLNVEIaQjw//WsvnaAiq4oU8xZmVqJIQfGtSyD0LbYAZyGKUwL9K8Okwqo?=
 =?us-ascii?Q?Q263UUHHjUVVUepcby/zMz7FtojqhZPp2OpYfwKYVqjWFb/IyPVy6cVoxxcv?=
 =?us-ascii?Q?h2WPCthTkkOhSAWkqCInZ2/wVYFjMxHjkNouTx5Q949/iobqvd+5xrDHQAta?=
 =?us-ascii?Q?RjB4xUpIS8k8xZHuBZh/QbjCJLFEbDCTnJ3ioerc897y4Q5jV8XKd2rEfuJF?=
 =?us-ascii?Q?Jnde8nbgqfbV6HrKqItZTEbrm3R1xJYzMLGkO0+qo/Kcnzc1yhFALmo5muKN?=
 =?us-ascii?Q?Wloim5IyrMvGKi5m7/X2FOI8TuFGVxiD4LjDXvvsrxqbM0QC2wppJ3LuvD3J?=
 =?us-ascii?Q?YxW2e34aHBqL8XEa6Gq+MekXzi9WWU4/yYu6ur/543hyMbOnVg03Q2pMXWru?=
 =?us-ascii?Q?4AWlWDYjIY4/YL2vGbogjRfQrQ+fnknfr7MdYrHVq+NvDqMH92bR67TjgQaL?=
 =?us-ascii?Q?UdAGTsNflYsIA969lQZfM8lwSywPqeyXL1wIxB1u8lwusMnW5pVByYoCUZ2c?=
 =?us-ascii?Q?9MLvVMcwvCf5e7iLtVkcDO/jQE4INOZXrBB/V/TIrBYfiKfRD3xiK7fb4RTf?=
 =?us-ascii?Q?6XGUkZW7HYhbl1KnBrUw1QDLQSSdgmR2RvHQ2yinI74BMbM5Z8Wg+FsWRgBC?=
 =?us-ascii?Q?hPzg3EUVV/LDsBcn9AqAwy9VwD4yEjSDCIpIJd9/9am4tiRUG52x/gDOmEOJ?=
 =?us-ascii?Q?SMK6smcyxAG7cjWoTFft7RSfwT+jduMXkfPjkZbFi/7G3BofwfspCpJzZ4B5?=
 =?us-ascii?Q?RbMTZb8O4JSuDCx5d1JI1TrxoJ1BqMTWVt3nQAS6wbyp9suealaPBaKkapex?=
 =?us-ascii?Q?qP9I1q6wHUDmG55040hWD0nj9cWt3Y5MfDdAcDS0BWmQBVPshj/SFWkJxHVh?=
 =?us-ascii?Q?niqokpUv94gfn6S6XFaHtehQu66g+4gNEiRvTfKHZZafloDtNfqtshKMRJq4?=
 =?us-ascii?Q?lis1sA6yJ06LgGEqAGqT0G3HzLf/Sov5ZqeeM6+sraaGyAGB824UVj4RgW/U?=
 =?us-ascii?Q?Bd8igj7h1WGGMPdc7EyS+Aykg6/U1AU25iuSPa+9jcxUXrIIEN8CIpJphR3y?=
 =?us-ascii?Q?E52XGzB3g0B2oLgs0lMIlN2EUbL0HsBha0fcVyeqBAIiVmAkn7KI7vn+b/rF?=
 =?us-ascii?Q?S2YcGgv9jmWAyA3gl5Aoiqw9QiDnXmR5RMPJAB1Wc/3bElIYFa+5IFkHrJw9?=
 =?us-ascii?Q?8u6/0XphUpG2gAAEdtCqhXgNxFYlkHtD21VC6m/qcx2gZ3b8GX/PA+LEvMFv?=
 =?us-ascii?Q?2+MSQuhd2WUNQkT/y6fdu2UNBkWdH4rBHUEv5bKtSukFEYg5SAdxzTnrWGqq?=
 =?us-ascii?Q?N2cHboqgm+REYgfSgXlJYcE3fmpX/xuRK0gP/NBfghzBHnXYUgmWBMfz64hh?=
 =?us-ascii?Q?DK0pdHNYXcwLjZFvkxc6Y3U6+k0fAkjNDIY/VCII+ytbyTzPfbfh30W8/iiT?=
 =?us-ascii?Q?fhteIzdzcimAT9hGTbWHHI3dm3coVIxB1E4i5gXiQnY8CAXxbSKKjIjDKCfS?=
 =?us-ascii?Q?dQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d61474cd-733b-4551-9a92-08dc8ef85179
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 18:07:16.4820 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DbtlSp2R4ds4yz1SMNTcXuOrVZRM40/tSn8fB5Onqk2VD3B1zdRf+T7jrpVtePaPdZE8MijkYi5hm1KWJHRztg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7663
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

On Mon, Jun 17, 2024 at 02:00:55PM -0400, Rodrigo Vivi wrote:
> On Mon, Jun 17, 2024 at 05:24:24PM +0000, Matthew Brost wrote:
> > On Mon, Jun 17, 2024 at 04:34:27PM +0200, Michal Wajdeczko wrote:
> > > There is support for 'classes' with constructor and destructor
> > > semantics that can be used for any scope-based resource management,
> > > like device force-wake management.
> > > 
> > > Add necessary definitions explicitly, since existing macros from
> > > linux/cleanup.h can't deal with our specific requirements yet.
> > > 
> > > This should allow us to use:
> > > 
> > > 	scoped_guard(xe_fw, fw, XE_FW_GT)
> > > 		foo();
> > > or
> > > 	CLASS(xe_fw, var)(fw, XE_FW_GT);
> > > 
> > > without any concern of leaking the force-wake references.
> > > 
> > > Note: this is preliminary code as right now it's unclear how to
> > > correctly handle errors from the force-wake functions.
> > > 
> > 
> > I'm personally don't like this at all. IMO it obfuscate the code with
> > little real benefit. This is just an opinion though, others opinions may
> > differ from mine.
> 
> Well, on the positive side, it is not adding a driver only thing like
> i915's with_runtime_pm() macro.
> 
> But I'm also not sure if I like the overall idea anyway:
> 
> - I don't like adding C++isms in a pure C code. Specially something not
> so standard and common that will decrease the ramp-up time for newcomers.
> - It looks like and extra overhead on the object creation destruction.
> - It looks not flexible for handling different cases... like forcewake for
> instance where we might want to ignore the ack timeout in some cases.

Thanks for writing this out. I agree 100% on all your points.

Matt

> 
> > 
> > Matt
> > 
> > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > > 
> > > Michal Wajdeczko (3):
> > >   drm/xe: Introduce force-wake guard class
> > >   drm/xe: Use new FW guard in xe_mocs.c
> > >   drm/xe: Use new FW guard in xe_pat.c
> > > 
> > >  drivers/gpu/drm/xe/xe_force_wake.h       | 48 +++++++++++++++++++
> > >  drivers/gpu/drm/xe/xe_force_wake_types.h | 12 +++++
> > >  drivers/gpu/drm/xe/xe_mocs.c             | 12 +----
> > >  drivers/gpu/drm/xe/xe_pat.c              | 60 ++++++++----------------
> > >  4 files changed, 82 insertions(+), 50 deletions(-)
> > > 
> > > -- 
> > > 2.43.0
> > > 
