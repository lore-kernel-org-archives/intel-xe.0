Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA55BCCD183
	for <intel-xe@archiver.kernel.org>; Mon, 13 Oct 2025 17:34:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C70210E13C;
	Mon, 13 Oct 2025 17:34:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VYlt1vZ8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F10E510E13C
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Oct 2025 17:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760376867; x=1791912867;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=swOkrNWCcPpq8JQQKhTQmQFGA0LWDNEdwMIGI8huxNw=;
 b=VYlt1vZ8pkBbcU+dW/Wjc7TlhdxbjFUsc3aZA81XN0gPkQAFShJBGozV
 3eHjQPtHqdmVDMRaAmXYTAgOmiwt6l9eDSl6mqDQlY+OS6TCXrGGSyw2H
 els6veoNg+Y4TczEcOEtVxlamcugjoASOBObPIm8ht0BBXL+Gp0kHX09X
 DQ1rYrkzdo0bOsY9elxV1B0oFeUj37WDmtBEo0S/mPf+eL5xFCDklXp49
 +VVIeHGzV+uqs3zH0QAjOhcyMh84Izu3lHhaS+NiD3/42AgCKsbHDYKQN
 Acg7kVcfNyAI5RWKJEliBLGDNL+K9sHYVMuHnP88DqhkOoE8LWSIs2m60 Q==;
X-CSE-ConnectionGUID: 81E6q7geQu2jWYqtX5SfAA==
X-CSE-MsgGUID: +sZ/nRTgRp2A3hdt33FLMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="66178175"
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="66178175"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 10:34:27 -0700
X-CSE-ConnectionGUID: 5RKLxPfcQL2Ah4iVashBHg==
X-CSE-MsgGUID: Uz199wvSRaSmcuqVav47Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="181606874"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 10:34:26 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 10:34:25 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 13 Oct 2025 10:34:25 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.54) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 10:34:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ga+1Dadri+10IE2ICj8YSP7DAT98RtdLd44OLJaaVmA1FXPxeHKJVTlHFY+ltZUGKfkV4gwV2KQ4XX9Eb6xg4AQ5XSb/sSUoO9/quQFtrxyK7lca+SWHux2FR3h7zrEX6P56Irmtq3lYIlMWRv0Qlvdn/vogPIQrjSvQls8rkFOhCV7a7SC4y9FMSymtDYRE7O9hNhKzL/Iu2LVnApCufUJ8Npv2fI+1E/0P1YgiXhp48FdNUKpniWdFavZm7L+e+AhtbBv+iUwU/4i+6CbLtBLRJQyCsn9jKkwmdaQaRjyDO9mpLmEgyPkzlQHFYIZLc9R8eUXh8Ke4yEBJXTkyFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GD3tV3oe0CNthEVJkuBXveNzTWFPUFGLKqrVUyDxNIg=;
 b=T1diQoN7oRXdxWI/n6HKCGtMRW8dHLyRwJpYT0Zyb8tc7AUDu8Ea3VHtliSdK4+TQ2+wggzXxg8HP9B8Tz+J9ke1IiKQqygLZz69YsvztUFmxwnke8Z5wBbEVmaJdve/53XAQ3vNk2zvKGfbuVO0iW34YltnUgUl75RZaw7Q81eKLfFh3groM7rMFxqzsSRfn8bNK4yCCWG9tJ1wFi3B/8H90BsIFDs6KxaO4qyqOIhIqKnDGl+DePXvLa8k2O37JMVeznB9XIahzie3zn6YoaDW+ybhBse59Nbt2O6w1yUOFBauVQHwSe4Wp+DB0Ke9CHJpfmBWkNyyS2hZhs21xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by DS7PR11MB6222.namprd11.prod.outlook.com (2603:10b6:8:99::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 17:34:18 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%5]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 17:34:18 +0000
Date: Mon, 13 Oct 2025 10:34:15 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "simon.richter@hogyros.de" <simon.richter@hogyros.de>, "Auld, Matthew"
 <matthew.auld@intel.com>
Subject: Re: [PATCH v5 2/2] drm/xe: Enable 2M pages in xe_migrate_vram
Message-ID: <aO04Fz0f9pRFVgUF@lstrano-desk.jf.intel.com>
References: <20251013034555.4121168-1-matthew.brost@intel.com>
 <20251013034555.4121168-3-matthew.brost@intel.com>
 <a435a2a974b8627c945471e75c4dc21b835e9d22.camel@intel.com>
 <aO0zhM9xAMlnUDea@lstrano-desk.jf.intel.com>
 <acdd0cfc8e700710ee5b43c816cdf7de3f57b374.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <acdd0cfc8e700710ee5b43c816cdf7de3f57b374.camel@intel.com>
X-ClientProxiedBy: MW4P223CA0019.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::24) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|DS7PR11MB6222:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d563493-0345-49c0-9054-08de0a7ebcf2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?TLXOys0+e9VusjBE7TPeLPcF2aP84MrKtgL4BcgWSxEl/qiiaCozdHGB47?=
 =?iso-8859-1?Q?E/M9vODa0KWUsp5yyQg4KRyL+e8lQhEzPL997rXAKRwoiXxfh1x6KU0eV7?=
 =?iso-8859-1?Q?r1k6zWEcBP3JxWc90hdye47XxOtbgin8+uTgbpixL5ZTso8oZKhrksG3b6?=
 =?iso-8859-1?Q?Ukz+HhAvXl+5fgRDYyn9dzyYDKS1NDtPs6ap0/qffudgI+FrXkJSLXgqLR?=
 =?iso-8859-1?Q?mzyHekAJGsVZEhIFUG6TNOwar8fgfJWqEhAyjNmii0V9AWiVJcijV4VQLY?=
 =?iso-8859-1?Q?uJHGO0RGR1rKp6h5Hv5NRX4VYMXeD2gFTBeFukWW8NzhtJOGBA30vpkxV6?=
 =?iso-8859-1?Q?1BgQeG6xBASDylIjq8CK71DhfwyTY5whTKufaP2nWy5a4qCKisnv/y93OJ?=
 =?iso-8859-1?Q?s0HNaDRA23O7t3iYiK5Z66n1XZt5exGzhTuviwsywScPXaArLAK/Ih6NhK?=
 =?iso-8859-1?Q?6YTfse3TjKB8HvV8skjuw/pd8J2R71RAswPbFTyI/SP/p/FePXoICpWp5y?=
 =?iso-8859-1?Q?EClg1TKxXpqnDEmaVrXKDU+ywAUqntqJdagP6RONTFDyqwqP+6qukhl3RM?=
 =?iso-8859-1?Q?6VEtzIvSujuKaib62fOXiKiwxodorrF7ey+hCAfeYaQYzXoGjrAHsTvy+k?=
 =?iso-8859-1?Q?HL+uohNhUn5AXK4igjr5+4MEJKAf/21mb7VyXTtRij06jHN8Cq/9TFg7gY?=
 =?iso-8859-1?Q?SnHMok9LOccOaoveLpdKhO/S/OshZrnyyps5YcW7zt95uO8TaDIo5FProX?=
 =?iso-8859-1?Q?IDZZ/f46+y8k0PBHdJ19GbYmSwZHQuORpwxNwEso0expwDic/rNaQTkwMQ?=
 =?iso-8859-1?Q?7k8YWpXwuFukkzecNyz41LFLFlSgTFm9EcU0uMb6+WJiHa55xji9gphne3?=
 =?iso-8859-1?Q?G3DSrtigtMYj10CHkZw8CGcp+C6T6itT57Dojr8IVfGqWwA3+NnekUxajE?=
 =?iso-8859-1?Q?Erk2s11+s7jZDiq+VlUD9AfirglQEUIDIc4pxsMHVYyde/wfGNwi/wGN8V?=
 =?iso-8859-1?Q?VhNSGB0OHq0O5iKB+hNPuH5yxsa3eHPcuEZlIxCDUgedS9wMipxwWe/lxL?=
 =?iso-8859-1?Q?ow2/iNGi2Y0iTPi8FKowFMXFAsK89+9SUKI95LNWof4iuAJO/Ts0T5B3I4?=
 =?iso-8859-1?Q?Dhfwb+xdTEyUA0TwWPaAfOfV1FwxusrXKb4JFzMCHvY5kua2wDxrWwlacM?=
 =?iso-8859-1?Q?4SQJgdGZlxeYGQZSVj/dnWBnxMtMOSa/3o7YaVGOXLqwmREXrpmUOOwVL6?=
 =?iso-8859-1?Q?NWALGDIAJGOSBRnKNZTKMr1eEZMDtlKOphV1W9YyLYPc7+p1KliNKqcpG8?=
 =?iso-8859-1?Q?QdPUd32rs83+DddYggwW9oRq+e/ibGzSDJuVGqV2AvV9DumAy8E/ZPlPS4?=
 =?iso-8859-1?Q?1Uzvgh8Env2BLgs/lUGp0iDazSdwDV46yUF+/K2Li5WlwLAKKFFiHZuHDs?=
 =?iso-8859-1?Q?tgXUaXPqRAyfTknYg/RdORjNUYafba46b08PxbeA8t0fl4wwOmst+YlKGN?=
 =?iso-8859-1?Q?KvRnalPGI4I5AwvUX8shx9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?rBAIEnNHT3OA8uO874FAg7X+zZd4np3C0akhfWc0ReMVt0s7jZ+aZDddB5?=
 =?iso-8859-1?Q?CpG7pZOFdvxC3+dZpAe8sJqtXZCrS5pKqcmUWjg3QtPL+dgKYRc0o8K1Vp?=
 =?iso-8859-1?Q?E61lPLHE6g2tCF0LvtMp85uJNl8aFPJscEt1x2xqHjaH+XlXAdbU3fw/90?=
 =?iso-8859-1?Q?7EYlliMFo3by7sSTe6vwXuFPDQj6SKLSYKiA2yiAnJdvvXm8fVzBZORowe?=
 =?iso-8859-1?Q?wGGurrRVXlhlZ8jBWlco6wBlyOGYFBpk1YpzldZ48EAKjy58EIIAR12UVV?=
 =?iso-8859-1?Q?KnonN2ToTZL8xlxNzn6UDv38zo3cKxCiHavjiVFEd1/kw2KHUB5Ezxd5p9?=
 =?iso-8859-1?Q?X5O8UFFcrvcxjgpwohMY9e5KI/ShPTLiGl7xDSxUrhQ03ZISC0qq7m3Nec?=
 =?iso-8859-1?Q?vIyVBbw38pg3HF/Bd1OmO1bth4Nu0iYtOENUZeiqLJVFWSBe9DzXWFGmu+?=
 =?iso-8859-1?Q?YW7BCsjs74LTtT72E4Iyo4syVIP18VjgPTTN3kMGGbU8z7IYuytQKe+nhn?=
 =?iso-8859-1?Q?g1BVgoal2PpA2NI/yIKnEx8jlKZI/eyY1IdbhSWzfzAsjeq/uVIdWh1cfO?=
 =?iso-8859-1?Q?nUyAxHkqFO6Yo4A0i9N20pLCZYAiQCG9BQnf6SwsHCfGFV5By5xfut+B5X?=
 =?iso-8859-1?Q?rCwYMRiJx4PNgEEIx5X49NxInqOZZ2SjT5p/jSo4w8LqHplpNEta2jqS/J?=
 =?iso-8859-1?Q?RTGfKETXvnUbH1SL6ulupgZ8blc2sHxk2WI5TmrfWfxWqOxNw2dI2XOyUP?=
 =?iso-8859-1?Q?fNbjZTq1VwpTSRUNeCI5LXUnVNUwNrr3MwQVqPo9pq6uXKNoBBUwrmFgZo?=
 =?iso-8859-1?Q?OGc1yndrDFsCijDYhMwDVMXQe9iw1NKsNRc5TWAOvMpA39bykyfXg3NfRb?=
 =?iso-8859-1?Q?bjAcH1wY5tV1VKl5sGMuojeDXge5ptCPiEQlJZEwfMPkFZVCZluGkfEhpE?=
 =?iso-8859-1?Q?6/QTL/gT9ZsahkyrorJ+rejMxjPaf5jTys0ADX3NuJ8SNk2SgnoySGbRSK?=
 =?iso-8859-1?Q?TKSeLlnrWmYFgDtHJrJ2dSFRk3iTLDXx2TptoIzo1Fsijmv4TghMisfL23?=
 =?iso-8859-1?Q?dZfsmx+Xg8i0RWEC5VpH/V+EzwHpeb5WEIB+5mhg8XmXzgYwXRrsyJzvNN?=
 =?iso-8859-1?Q?cVmCqCJGBi2z/CcHMIHtj+e4V0zvsYLPmgL9AjDF8a3gThv/i8xAxppzuk?=
 =?iso-8859-1?Q?EZ8sfKlkJRdhzVbkSVwUI0/j8a969KGRlj9K7gR+zKjjGLt9DtfPelFZlt?=
 =?iso-8859-1?Q?mSngwKYIwzVFYtwtb4a0G5uS4tXlI5MoTg064SBxoVXqJ73JB6fNf5scgz?=
 =?iso-8859-1?Q?acFnQVkEriU0Ib7/aWgC1+tAxihw6Jy3DHJD7eu1LVkydi7oWbgNmSAogp?=
 =?iso-8859-1?Q?DVw7Jp71kHIC6oYUvg+d/xjwrA5kf0AtQDq3VSfkVTYY7QYT55tFsqg5R9?=
 =?iso-8859-1?Q?JqFMIa6YaZpw0UrhIMNhklLHxNJDDxHm0y7iehV7TgViT5n7S6FMlijU9a?=
 =?iso-8859-1?Q?6o6TabUQ0bhxIRyWJyiDZUSSW3KToN832IOgJTiqXLm8mdxXIKJiO3XHiU?=
 =?iso-8859-1?Q?nWTTs640+MucVtfl6uQH0OJBROwHI8XFH31jV/936rlZDfKTToHKBCDxIZ?=
 =?iso-8859-1?Q?TmDT+xjdd4b5HupMMNnzmFHVLCPg1MK+ugEjFX+Xeh4gedoCWSRjd1Yg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d563493-0345-49c0-9054-08de0a7ebcf2
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 17:34:18.6473 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dR5zbosxZG3VTCYC2JvfQpsCO7yknIh2OrBBEQEzZQU5bKe1jneo4KP3fwLLMD7MN3qT2uv9fdxVAmekXipt0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6222
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

On Mon, Oct 13, 2025 at 11:22:10AM -0600, Summers, Stuart wrote:
> On Mon, 2025-10-13 at 10:14 -0700, Matthew Brost wrote:
> > On Mon, Oct 13, 2025 at 11:08:03AM -0600, Summers, Stuart wrote:
> > > On Sun, 2025-10-12 at 20:45 -0700, Matthew Brost wrote:
> > > > Using 2M pages in xe_migrate_vram has two benefits: we issue
> > > > fewer
> > > > instructions per 2M copy (1 vs. 512), and the cache hit rate
> > > > should
> > > > be
> > > > higher. This results in increased copy engine bandwidth, as shown
> > > > by
> > > > benchmark IGTs.
> > > > 
> > > > Enable 2M pages by reserving PDEs in the migrate VM and using 2M
> > > > pages
> > > > in xe_migrate_vram if the DMA address order matches 2M.
> > > > 
> > > > v2:
> > > >  - Reuse build_pt_update_batch_sram (Stuart)
> > > >  - Fix build_pt_update_batch_sram for PAGE_SIZE > 4K
> > > > v3:
> > > >  - More fixes for PAGE_SIZE > 4K, align chunk, decrement chunk as
> > > > needed
> > > >  - Use stack incr var in xe_migrate_vram_use_pde (Stuart)
> > > > v4:
> > > >  - Split PAGE_SIZE > 4K fix out in different patch (Stuart)
> > > > 
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_migrate.c | 53
> > > > ++++++++++++++++++++++++++++---
> > > > --
> > > >  1 file changed, 45 insertions(+), 8 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_migrate.c
> > > > b/drivers/gpu/drm/xe/xe_migrate.c
> > > > index 216fc0ec2bb7..4ca48dd1cfd8 100644
> > > > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > > > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > > > @@ -57,6 +57,13 @@ struct xe_migrate {
> > > >         u64 usm_batch_base_ofs;
> > > >         /** @cleared_mem_ofs: VM offset of @cleared_bo. */
> > > >         u64 cleared_mem_ofs;
> > > > +       /** @large_page_copy_ofs: VM offset of 2M pages used for
> > > > large copies */
> > > > +       u64 large_page_copy_ofs;
> > > > +       /**
> > > > +        * @large_page_copy_pdes: BO offset to writeout 2M pages
> > > > (PDEs) used for
> > > > +        * large copies
> > > > +        */
> > > > +       u64 large_page_copy_pdes;
> > > >         /**
> > > >          * @fence: dma-fence representing the last migration job
> > > > batch.
> > > >          * Protected by @job_mutex.
> > > > @@ -288,6 +295,12 @@ static int xe_migrate_prepare_vm(struct
> > > > xe_tile
> > > > *tile, struct xe_migrate *m,
> > > >                           (i + 1) * 8, u64, entry);
> > > >         }
> > > >  
> > > > +       /* Reserve 2M PDEs */
> > > > +       level = 1;
> > > > +       m->large_page_copy_ofs = NUM_PT_SLOTS <<
> > > > xe_pt_shift(level);
> > > > +       m->large_page_copy_pdes = map_ofs + XE_PAGE_SIZE * level
> > > > +
> > > > +               NUM_PT_SLOTS * 8;
> > > > +
> > > >         /* Set up a 1GiB NULL mapping at 255GiB offset. */
> > > >         level = 2;
> > > >         xe_map_wr(xe, &bo->vmap, map_ofs + XE_PAGE_SIZE * level +
> > > > 255
> > > > * 8, u64,
> > > > @@ -1778,10 +1791,10 @@ static u32 pte_update_cmd_size(u64 size)
> > > >  static void build_pt_update_batch_sram(struct xe_migrate *m,
> > > >                                        struct xe_bb *bb, u32
> > > > pt_offset,
> > > >                                        struct drm_pagemap_addr
> > > > *sram_addr,
> > > > -                                      u32 size)
> > > > +                                      u32 size, int level)
> > > >  {
> > > >         u16 pat_index = tile_to_xe(m->tile)-
> > > > >pat.idx[XE_CACHE_WB];
> > > > -       u64 gpu_page_size = 0x1ull << xe_pt_shift(0);
> > > > +       u64 gpu_page_size = 0x1ull << xe_pt_shift(level);
> > > >         u32 ptes;
> > > >         int i = 0;
> > > >  
> > > > @@ -1808,7 +1821,7 @@ static void
> > > > build_pt_update_batch_sram(struct
> > > > xe_migrate *m,
> > > >  again:
> > > >                         pte = m->q->vm->pt_ops-
> > > > >pte_encode_addr(m-
> > > > > tile->xe,
> > > >                                                                 a
> > > > ddr,
> > > > pat_index,
> > > > -
> > > >                                                                0,
> > > > false, 0);
> > > > +                                                               l
> > > > evel
> > > > , false, 0);
> > > >                         bb->cs[bb->len++] = lower_32_bits(pte);
> > > >                         bb->cs[bb->len++] = upper_32_bits(pte);
> > > >  
> > > > @@ -1826,6 +1839,19 @@ static void
> > > > build_pt_update_batch_sram(struct
> > > > xe_migrate *m,
> > > >         }
> > > >  }
> > > >  
> > > > +static bool xe_migrate_vram_use_pde(struct drm_pagemap_addr
> > > > *sram_addr,
> > > > +                                   unsigned long size)
> > > > +{
> > > > +       u32 large_size = (0x1 << xe_pt_shift(1));
> > > > +       unsigned long i, incr = large_size / PAGE_SIZE;
> > > > +
> > > > +       for (i = 0; i < DIV_ROUND_UP(size, PAGE_SIZE); i += incr)
> > > > +               if (PAGE_SIZE << sram_addr[i].order !=
> > > > large_size)
> > > > +                       return false;
> > > > +
> > > > +       return true;
> > > > +}
> > > > +
> > > >  enum xe_migrate_copy_dir {
> > > >         XE_MIGRATE_COPY_TO_VRAM,
> > > >         XE_MIGRATE_COPY_TO_SRAM,
> > > > @@ -1855,6 +1881,7 @@ static struct dma_fence
> > > > *xe_migrate_vram(struct
> > > > xe_migrate *m,
> > > >                 PAGE_SIZE : 4;
> > > >         int err;
> > > >         unsigned long i, j;
> > > > +       bool use_pde = xe_migrate_vram_use_pde(sram_addr, len +
> > > > sram_offset);
> > > >  
> > > >         if (drm_WARN_ON(&xe->drm, (len & XE_CACHELINE_MASK) ||
> > > >                         (sram_offset | vram_addr) &
> > > > XE_CACHELINE_MASK))
> > > > @@ -1879,7 +1906,7 @@ static struct dma_fence
> > > > *xe_migrate_vram(struct
> > > > xe_migrate *m,
> > > >          * struct drm_pagemap_addr. Ensure this is the case even
> > > > with
> > > > higher
> > > >          * orders.
> > > >          */
> > > > -       for (i = 0; i < npages;) {
> > > > +       for (i = 0; !use_pde && i < npages;) {
> > > 
> > > What if the CPU page size is larger than 2M? Don't we still want
> > > this?
> > > 
> > 
> > I'm not handling this but I believe CPU pages are at most 64k on ARM,
> > power, or longsoon. I could add an assert I suppose to make sure this
> > unhandled case never occurs.
> 
> So according to https://docs.kernel.org/admin-guide/mm/hugetlbpage.html
> we can potentially get 4M-256M pages on some architectures. Maybe we
> want to say we aren't supporting these? In which case, yeah I think
> having an assertion here would be helpful. Would it be easier just to
> apply this same code if sram_addr[i].order > != 2M?
> 

I only enable the PDE path if order == 2M. See what xe_migrate_vram_use_pde does.

Matt

> Thanks,
> Stuart
> 
> > 
> > Matt
> > 
> > > Thanks,
> > > Stuart
> > > 
> > > >                 unsigned int order = sram_addr[i].order;
> > > >  
> > > >                 for (j = 1; j < NR_PAGES(order) && i + j <
> > > > npages;
> > > > j++)
> > > > @@ -1889,16 +1916,26 @@ static struct dma_fence
> > > > *xe_migrate_vram(struct xe_migrate *m,
> > > >                 i += NR_PAGES(order);
> > > >         }
> > > >  
> > > > -       build_pt_update_batch_sram(m, bb, pt_slot * XE_PAGE_SIZE,
> > > > -                                  sram_addr, len + sram_offset);
> > > > +       if (use_pde)
> > > > +               build_pt_update_batch_sram(m, bb, m-
> > > > > large_page_copy_pdes,
> > > > +                                          sram_addr, len +
> > > > sram_offset, 1);
> > > > +       else
> > > > +               build_pt_update_batch_sram(m, bb, pt_slot *
> > > > XE_PAGE_SIZE,
> > > > +                                          sram_addr, len +
> > > > sram_offset, 0);
> > > >  
> > > >         if (dir == XE_MIGRATE_COPY_TO_VRAM) {
> > > > -               src_L0_ofs = xe_migrate_vm_addr(pt_slot, 0) +
> > > > sram_offset;
> > > > +               if (use_pde)
> > > > +                       src_L0_ofs = m->large_page_copy_ofs +
> > > > sram_offset;
> > > > +               else
> > > > +                       src_L0_ofs = xe_migrate_vm_addr(pt_slot,
> > > > 0) +
> > > > sram_offset;
> > > >                 dst_L0_ofs = xe_migrate_vram_ofs(xe, vram_addr,
> > > > false);
> > > >  
> > > >         } else {
> > > >                 src_L0_ofs = xe_migrate_vram_ofs(xe, vram_addr,
> > > > false);
> > > > -               dst_L0_ofs = xe_migrate_vm_addr(pt_slot, 0) +
> > > > sram_offset;
> > > > +               if (use_pde)
> > > > +                       dst_L0_ofs = m->large_page_copy_ofs +
> > > > sram_offset;
> > > > +               else
> > > > +                       dst_L0_ofs = xe_migrate_vm_addr(pt_slot,
> > > > 0) +
> > > > sram_offset;
> > > >         }
> > > >  
> > > >         bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
> > > 
> 
