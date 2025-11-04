Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69676CCF9E3
	for <intel-xe@archiver.kernel.org>; Tue,  4 Nov 2025 16:13:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B53C10E27D;
	Tue,  4 Nov 2025 16:13:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nK+wqNHj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40CA810E27D
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Nov 2025 16:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762272785; x=1793808785;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=33evFa71HijWSyNGkTjr0nfOIcjCYBFL8z3mstnZFDU=;
 b=nK+wqNHjHCzfvEF7z+oVIKherD8h04+lrWu0N3YfF+y6iydBbNxUdUKo
 vs0fVcaY1ZcWPFqvFf+r6FHzsMJoPBKWqlwJknA5BeoURI34TiPdDTxuN
 PAsdWRBfnYnxirh/B7kt1RBmnK7Sx/1GA0RllFPjmmE5SBJQUWWyD9+Vb
 EFqfqjp2+j/dNp2VskHawi3tT2KE6km3xxTPVkHdOC3cpOUDLJf/RL4xo
 mU5Pxdkj7P4XNDTF/P95HozllAhzmIxlYLKsshPedJNQFNtceiX7VuUHz
 0Tex9P4s6dF+yB/ASFZ5ZvXixhvpRbBeKvhJwi+A3syU2ahZdwiJ+8gQW Q==;
X-CSE-ConnectionGUID: LmutrBK4QBWu4hPIxK1Xnw==
X-CSE-MsgGUID: 8HJQUjvkTGW97PgrpsvtMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="64403430"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="64403430"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 08:13:04 -0800
X-CSE-ConnectionGUID: X49eJnLdQOGyVp3VPkKRkw==
X-CSE-MsgGUID: kPvLKTOnTuuRz8hdDm277A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="187643411"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 08:13:05 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 08:13:04 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 4 Nov 2025 08:13:04 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.20)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 08:13:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PJ4exLRuN1heqhi23Yd6QWVMyqBoVvW/LmPhyqfqU5KMOF66krbjgf6ViILpmpwYRGCQQxC/X8GpDi3LR7Wx+2pIWys82zT3JALXWiEtUjI61iR3jnuoZOx2giZqjiKWJSal2vIPnWDP8hUwzbhFPmrBpM7z1iOqUMSgcWBygJmHytozB3fVeyoyujIqyPZtTvVP+AA/sfHwbwePS8/E2KkXMOpE3vg/R7R4BXDM87OVQoCflM3i5G24W4OGBMaDAVhFucxvb/jL0utjQZn9MWfW1iiwvUzaXy+W/pktihZWUDIdYsOm29GXV3VcU73ji6ZKdy9M5XsSfqhvXraObg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e+vnNE7YJWHHP3/VynSHuodf3F7mUzg0/mvclFRYlec=;
 b=iDWMdpV+8YQjp+sapVifTyjuz/xrjwOR4330Zvt/KdNGhoRyiRm17impOTGMSKsywTlqjqwssV+qISUDp5glU5EMAl//WVM6LStyY5+fo+RrKO+C8ijIaZbVRUWfl9YG/YaZb/1t8upiI83wqMFLX8//NyXs19Ld5a3w1UvRqex4yEj/EOBH/AQyhZI4TG9pgJ0m0XTjSDXwUMdv//Z/GtZOjmGOxIqhsAMbtco2PLvD/IOZMMpv8Y2AutMYjCan11SdAPeGKHz0KE3qudTJXu9DaNVDzJtwX7SHWkgY4c94s3IOyOkeQ6ad8Fz/LvfvKicTAfKtLaOFvCL1s+KLwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA3PR11MB8917.namprd11.prod.outlook.com (2603:10b6:208:57d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 16:13:02 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9275.013; Tue, 4 Nov 2025
 16:13:02 +0000
Date: Tue, 4 Nov 2025 10:12:59 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <stuart.summers@intel.com>,
 <francois.dugast@intel.com>
Subject: Re: [PATCH v4 6/7] drm/xe: Add xe_guc_pagefault layer
Message-ID: <7ctk3nn7y6zwfqamjtbzpef5ln72jy6ybedbwn7j5nliy7c4xi@vua55xus6kpg>
References: <20251031165416.2871503-1-matthew.brost@intel.com>
 <20251031165416.2871503-7-matthew.brost@intel.com>
 <sfcg7e3k33utodthmvswkqyav66z3toqn6seiipgnkz5gmxzdc@7f37xxkdfspn>
 <aQj6xi3HUTHcBoD4@lstrano-desk.jf.intel.com>
 <n5hncgadbxnnyxqz2rqz7klrytupp2zvwxrnxyc5ysmuky46hb@nsn5invv6hvr>
 <aQj/V5ZuHLft6d8L@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <aQj/V5ZuHLft6d8L@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: SJ0PR05CA0024.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::29) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA3PR11MB8917:EE_
X-MS-Office365-Filtering-Correlation-Id: fc693f3d-ef91-490f-0456-08de1bbd0767
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?II5LOhTfK+ECk9qQBJrpeOHqkbs+iBd+ZjM3jZ6wa2EIIF9G4rnraS8I40M1?=
 =?us-ascii?Q?1yXWY1n/NOCqomq0hDYRik+uzsFQx37rg/rkUdConY1sNX0SebpCEvfG2VYh?=
 =?us-ascii?Q?47zD24PbWxFUXfyjF3etW7YFDiyPo2o7O8ujd5ucZjYq63weEUkeYEuxFGqZ?=
 =?us-ascii?Q?0X8LXg6rpzI80zskCsDYlCK4jO6BEqVHUqp33TID43buJyBPt823pSg96Eu9?=
 =?us-ascii?Q?ZZdnhMuxTh03HEl9eLgyWe934Ek93KW8EYlE+a+4KnHFcxtwa1djOhlBU5yj?=
 =?us-ascii?Q?KB/VBQJQjEJ+qrrJr04SpIAJCmYmvznB6FM1gAqKN4SwVQefiDl38fjskFZ8?=
 =?us-ascii?Q?tbU4xP7OLtThNR78fCnDixnSgubbFJpuYl6fk9nbVVsuDJ20khFd7QjXMARK?=
 =?us-ascii?Q?wYtpvOyIJIWlUSvlj9ZtV6nEPQWnzA58VeONR6VXPIILAbGvtoXZ8obbofUr?=
 =?us-ascii?Q?5JEHTn09piOYnUSZZuY7lrvWq6vj1oZEp6IA4aLZHiAQPqN+kXANmMLnbcD7?=
 =?us-ascii?Q?jyPm2waNVzEhAKpKum581IHLZ/G10Zq4fvszHpGoHHbuPppsXTTHua9MaC2B?=
 =?us-ascii?Q?VJcMRiJmaw/cdERUm6qnD+i6bC1QQJTOfTs1GKoz8tbUhVihX61mt12MxLW9?=
 =?us-ascii?Q?/xhYzffR6hP3fXHdUEbBk2eTb1QDTu01m+j2q7l6ZwFJhlxxBgmTN09tsGbi?=
 =?us-ascii?Q?d+8Zm9PzgxRekCOvxG2/3UXlWnLHxulFQxtPHzAqSBrIiVGBt9lMuC3kCm3Z?=
 =?us-ascii?Q?NbWQnXDWrHrCkk93csIkPBIYAtoAHg2EU50/TZZjP+XCengwt36njX90bO2o?=
 =?us-ascii?Q?u9vYTnOVFs9iBfwDSiBrYfhrKRgLcwPRla/S8cl1j4b5bAqhnSeXWPjdC+6b?=
 =?us-ascii?Q?kRj+qXtarJcLOom1eSJ0hZOlbMxOb17duUu0F2Tk5b72pwvY0kIYjQ5/igDt?=
 =?us-ascii?Q?UkRd1f/u/o9UT1xFBETiGKAYLZye8n+5+dfwnNgVftNZgmQpFSxvlgM3I8b9?=
 =?us-ascii?Q?QWPeIeRL+g/hHJ+vL0FIFg135mydia7f8Az4gxc1Ysvo4CxuAXKvlx0hwwFV?=
 =?us-ascii?Q?K6ycyQNNjUN/BkvfBrKO8AZpSy5M6WDGb85LdbfYSb8wsGtGnv5+l3zET4XS?=
 =?us-ascii?Q?UBB8KkCJkIL3F4XhO+ZNNpX796vuT1trrkP+FXGsH4XUZWuc5udnidkht1jI?=
 =?us-ascii?Q?aj8bN9Q+DAMkn0CxcwiEpdwop/N0GuaAX9RQ95Uv3MTzXWWYkt1pTyjPFh00?=
 =?us-ascii?Q?4/K09ldtHR0tWNOi80dkPAOHYh6D6mZie8sdGoAWtKzfloUk7wI1dj2Zqr9v?=
 =?us-ascii?Q?R71XrdQ/ss2WdpIlazSDWgmjz1njTHx//lW8CoNG4O+wTQbvWMFWtIWyoQz1?=
 =?us-ascii?Q?o3jx7YlOdSXkVEiWfVSKQx082rHZAzqfWro7Exmv61jylKeLuCGGXnOkHYlI?=
 =?us-ascii?Q?LNtzPmbKy0ep5oLCI6gaMLV13S7f/BCT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZkPjNhiJEF01LWpfX5DoiNdYWGZlsxgd2GeoUPU3XLtepvs5ehLiI15atwHy?=
 =?us-ascii?Q?ChmsUsheMxDg3boLBxDQWiYGv/3UDcIaSAekTFHspzyi07+X1DEB6KzQO9eN?=
 =?us-ascii?Q?PAJ4g9WPzD4qPkXJDorzOlRanT+9RTIpPOQEuKuNOzmEIafYXi+yuUi4V15v?=
 =?us-ascii?Q?Sa/tAazpk1R5XEEsbdyDF2geYrIbX31GTuG/u0e8r4WfHnOO/6yOsRcE5wn6?=
 =?us-ascii?Q?vR1NwXrquz5KOIcpb9Cxk4CEpoT5bsjC9v4iq/xd4/cKCX17iJcGR339Vsxl?=
 =?us-ascii?Q?J23h+ScXwlKOwnKbcc65j11phNeMO62BtyGnSfrbL7Mbr0uJeSCtTw0r+Qu6?=
 =?us-ascii?Q?GpmAd6syGVxAn9tjtoua57lVMIso9HGx8zja0+OvyeKHT/t+9cWn3Gr61CA0?=
 =?us-ascii?Q?FfmlRe12vGvT9AYLScTYGjHdKHCXcwlsUCAAhsrJkBNc8aUJDSv32gb/UIRI?=
 =?us-ascii?Q?6TshS7OaodECwKwOPwDHnm9ZvaGyBY5YlTBnX5NlRaLFNdBkCTl7Y+qkzLVu?=
 =?us-ascii?Q?AKc5o3qRGqfmIaD3DabKaubkxgTLSCXTZHP5/eekoRUW48rKIqqfzLiuV/9B?=
 =?us-ascii?Q?SJvhNXOG5GpwCbkbAX9+sHnuM0dfgmXce/NgdejsSORzFLrKibWMB6c271eM?=
 =?us-ascii?Q?Ka3Ew35ARsEZH+VOHgjcvpf1yLJ7mLWZiVltflGGjJ8U7ApkpdCfOhL4ZjQb?=
 =?us-ascii?Q?60mu7w8IA2u4drdDXvuvufMfT1gaAxb3aHX6+ovt0S4DW0pr3l/z+Mbe1mka?=
 =?us-ascii?Q?+JNpXnFPdQqh9R1Wi2/TEOMmM2mAL9/VIL5cP8kUYDmb9ealxpFsQKuvhe6s?=
 =?us-ascii?Q?RHIfvE3IZhazzbvIrEaD6c3sqQoSsactKYHjn0P4JaE6zj0IsUddG9W873ws?=
 =?us-ascii?Q?3YXJZ4UKj2IMRsuLlnMHqVKoPaetliB3Mqw+esofv2YkaOKNzmXadR81VwHn?=
 =?us-ascii?Q?t0MXu6r09Et6W7jNNrDyB0grQskGRTzHjCbykknPxfC1A42aKFaAU5Qo6Gxe?=
 =?us-ascii?Q?NjDM/OCghUT0DGYxwGWEufgXzvQHzsv0oqbahxR02O5Is2uScc2+lRfQnJj5?=
 =?us-ascii?Q?WpJuOmZC54X9c6ydsusESuCd+bKvTF7LBn4+/omQCxnoqhnDnqmXAk4+a0sS?=
 =?us-ascii?Q?M/zNoRqx7RDIDeZPpmi+et+n1c6iV8H0BAEeFG3Dj1FQLVB9j2dDs/FMuSu8?=
 =?us-ascii?Q?b/aPQ4D5WWXqTD5ULH50TsDRpN323Ak1EhHinU6s4iclNYc/QDGWoOxfcgSB?=
 =?us-ascii?Q?y8p3c9Wiiw0gfxJeJCqtgRnSujgyUwYWMy1isx1M8IrsAc1LlMEFFovy0ECa?=
 =?us-ascii?Q?2LiU+/9O7W1BMvTebIkKmCoH/hU2VFL59LW+LVpC4v92uvEV1Gv+Pdnls9T6?=
 =?us-ascii?Q?1KXtNZkg8DmxuxtWszxScjNVbZS5UV+Iu3L4RPQC6bEwT1ijrgpdcmHovsd4?=
 =?us-ascii?Q?sI6SpcnSKf5AZTPMKcF12YgSlQibtDJW8aUGs3bDcKS5IXA7Li9i05cslHYl?=
 =?us-ascii?Q?Pevi0nJVXE9VKnTCAQAmNnbnGAsHJa19ZdXWS/Xjs8Uttb6yrxCgmhiH9rgD?=
 =?us-ascii?Q?6TMCrA+LeMk4UBEuFAUQEIUDIx/ir+I9vdP6gteV5v5Lufs25EvNYZuHMJ3L?=
 =?us-ascii?Q?Yg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fc693f3d-ef91-490f-0456-08de1bbd0767
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 16:13:02.3357 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Iu8dPAEwAyBjypNA8mTOLcLSP2JUg/lJwFcT3AQBdAqtfI9lzfdUGd8fhbmUObGcy2fSzWR4hsCT1QD2HjGGp4YxzWQ30HPvSFki4n5PC4Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB8917
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

On Mon, Nov 03, 2025 at 11:15:35AM -0800, Matthew Brost wrote:
>On Mon, Nov 03, 2025 at 01:11:34PM -0600, Lucas De Marchi wrote:
>> On Mon, Nov 03, 2025 at 10:56:06AM -0800, Matthew Brost wrote:
>> > On Mon, Nov 03, 2025 at 12:28:50PM -0600, Lucas De Marchi wrote:
>> > > On Fri, Oct 31, 2025 at 09:54:15AM -0700, Matthew Brost wrote:
>> > > > Add xe_guc_pagefault layer (producer) which parses G2H fault messages
>> > > > messages into struct xe_pagefault, forwards them to the page fault layer
>> > > > (consumer) for servicing, and provides a vfunc to acknowledge faults to
>> > > > the GuC upon completion. Replace the old (and incorrect) GT page fault
>> > > > layer with this new layer throughout the driver.
>> > > >
>> > > > v2:
>> > > > - Include engine instance (Stuart)
>> > > >
>> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>> > > > ---
>> > > > drivers/gpu/drm/xe/Makefile           |  2 +-
>> > > > drivers/gpu/drm/xe/xe_gt.c            |  6 --
>> > > > drivers/gpu/drm/xe/xe_guc_ct.c        |  6 +-
>> > > > drivers/gpu/drm/xe/xe_guc_pagefault.c | 95 +++++++++++++++++++++++++++
>> > > > drivers/gpu/drm/xe/xe_guc_pagefault.h | 15 +++++
>> > > > drivers/gpu/drm/xe/xe_svm.c           |  3 +-
>> > > > drivers/gpu/drm/xe/xe_vm.c            |  1 -
>> > > > 7 files changed, 113 insertions(+), 15 deletions(-)
>> > > > create mode 100644 drivers/gpu/drm/xe/xe_guc_pagefault.c
>> > > > create mode 100644 drivers/gpu/drm/xe/xe_guc_pagefault.h
>> > > >
>> > > > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> > > > index b35021e5b9eb..319f208eb19a 100644
>> > > > --- a/drivers/gpu/drm/xe/Makefile
>> > > > +++ b/drivers/gpu/drm/xe/Makefile
>> > > > @@ -58,7 +58,6 @@ xe-y += xe_bb.o \
>> > > > 	xe_gt_freq.o \
>> > > > 	xe_gt_idle.o \
>> > > > 	xe_gt_mcr.o \
>> > > > -	xe_gt_pagefault.o \
>> > > > 	xe_gt_sysfs.o \
>> > > > 	xe_gt_throttle.o \
>> > > > 	xe_gt_topology.o \
>> > > > @@ -73,6 +72,7 @@ xe-y += xe_bb.o \
>> > > > 	xe_guc_id_mgr.o \
>> > > > 	xe_guc_klv_helpers.o \
>> > > > 	xe_guc_log.o \
>> > > > +	xe_guc_pagefault.o \
>> > > > 	xe_guc_pc.o \
>> > > > 	xe_guc_submit.o \
>> > > > 	xe_guc_tlb_inval.o \
>> > > > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> > > > index e4852c4c90cd..44ed3202dfd1 100644
>> > > > --- a/drivers/gpu/drm/xe/xe_gt.c
>> > > > +++ b/drivers/gpu/drm/xe/xe_gt.c
>> > > > @@ -32,7 +32,6 @@
>> > > > #include "xe_gt_freq.h"
>> > > > #include "xe_gt_idle.h"
>> > > > #include "xe_gt_mcr.h"
>> > > > -#include "xe_gt_pagefault.h"
>> > > > #include "xe_gt_printk.h"
>> > > > #include "xe_gt_sriov_pf.h"
>> > > > #include "xe_gt_sriov_vf.h"
>> > > > @@ -638,10 +637,6 @@ int xe_gt_init(struct xe_gt *gt)
>> > > > 	if (err)
>> > > > 		return err;
>> > > >
>> > > > -	err = xe_gt_pagefault_init(gt);
>> > > > -	if (err)
>> > > > -		return err;
>> > > > -
>> > > > 	err = xe_gt_idle_init(&gt->gtidle);
>> > > > 	if (err)
>> > > > 		return err;
>> > > > @@ -851,7 +846,6 @@ static int gt_reset(struct xe_gt *gt)
>> > > > 	xe_uc_gucrc_disable(&gt->uc);
>> > > > 	xe_uc_stop_prepare(&gt->uc);
>> > > > 	xe_pagefault_reset(gt_to_xe(gt), gt);
>> > > > -	xe_gt_pagefault_reset(gt);
>> > > >
>> > > > 	xe_uc_stop(&gt->uc);
>> > > >
>> > > > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>> > > > index e68953ef3a00..529d2b3bec21 100644
>> > > > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>> > > > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>> > > > @@ -21,12 +21,12 @@
>> > > > #include "xe_devcoredump.h"
>> > > > #include "xe_device.h"
>> > > > #include "xe_gt.h"
>> > > > -#include "xe_gt_pagefault.h"
>> > > > #include "xe_gt_printk.h"
>> > > > #include "xe_gt_sriov_pf_control.h"
>> > > > #include "xe_gt_sriov_pf_monitor.h"
>> > > > #include "xe_guc.h"
>> > > > #include "xe_guc_log.h"
>> > > > +#include "xe_guc_pagefault.h"
>> > > > #include "xe_guc_relay.h"
>> > > > #include "xe_guc_submit.h"
>> > > > #include "xe_guc_tlb_inval.h"
>> > > > @@ -1545,10 +1545,6 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>> > > > 	case XE_GUC_ACTION_TLB_INVALIDATION_DONE:
>> > > > 		ret = xe_guc_tlb_inval_done_handler(guc, payload, adj_len);
>> > > > 		break;
>> > > > -	case XE_GUC_ACTION_ACCESS_COUNTER_NOTIFY:
>> > > > -		ret = xe_guc_access_counter_notify_handler(guc, payload,
>> > > > -							   adj_len);
>> > > > -		break;
>> > >
>> > > this doesn't seem to belong here. Should that be in the last patch?
>> >
>> > I think it is in this patch as xe_gt_pagefault.h was removed as include
>> > and xe_guc_pagefault.h was added. So I think this is probably correct.
>>
>> humn... ok, now I see why, but it still looks weird. The justification
>> in the next patch for removal was "it's now dead code", but there's no
>> mention why we made it dead code in the first place.
>>
>
>Let me adjust the comment in the follow patch.

if that's done in the next patch, then I don't have any other feedback
for this one and it looks good.

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
