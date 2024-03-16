Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BFF8C54E67
	for <intel-xe@archiver.kernel.org>; Sat, 16 Mar 2024 01:27:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38982112843;
	Sat, 16 Mar 2024 01:27:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c05JM/79";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DA89112843
 for <intel-xe@lists.freedesktop.org>; Sat, 16 Mar 2024 01:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710552450; x=1742088450;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ZJrkEchU535bz6QX+vQ/lLtGkkYHu0vdK7oO8QY9JYY=;
 b=c05JM/79RaF4pRWsOaIva89dhI6I49L+BnlEOnenz4n72oS1c2OuFWKv
 cVIuuc/kujPHwbLeGpkmgOrAnKG4kEwiF5i3M9QEC+s23uTCUa4jxIC5J
 2/QfgRFsv/9M8/ecA5PvBhAFh3K+DtxtIPUorwJUGq7RPXaW1M1Y8CiDT
 aIzoKEW/h9A/kJQ9Ifu5+T8QvJK0s5/jOwuIsUwPxZw8DZv5LHw+WiqZF
 4JUxmlBD3IVUrrgQK0Z9QFDVVtYTWJGQVGIlw1kewahbtwsj6v9aiccEG
 MCWCE0SGDyGqJNlToKV/0lySOF+vqoP99nNs20Z5PEhfgAztLC35VfNfW w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11014"; a="5631454"
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; 
   d="scan'208";a="5631454"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2024 18:27:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; d="scan'208";a="12811879"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Mar 2024 18:27:29 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Mar 2024 18:27:28 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Mar 2024 18:27:28 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 15 Mar 2024 18:27:28 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 15 Mar 2024 18:27:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Akk86n7LaL/CQ1JQURCTL8gcJpfnmsh+7aFyfHP3YgTeNTsyLxYscKCeZxf6mxwdq7/sXliY6hGdQt/VWTLUS3AUBGRSvxy1IUGIiyWIHd/FZqYSF8hXtPn1MCtCf2LQTPe7pHyNtFQ8LnTxPvs+FHs048EHpLmPgyncRoBeklWvkPG0L3LzfA4BnSaLI4ZRCVYtjVo7N8pWQ31UXgty1P9O9YDXAbObMZ82vUjKBx2SLL+tU6LY8DbuwUyPsXdJ6SJ6yat3jqu7EEBI9OFPer9ro0lYYZqQLhbc+wWftyrWrNVHAwOI3LIB8u9pqaos9HimcdrUbSABJr4DtpZOIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F+DWKopdi1dGfVUrl95sUccHIqz5d1RzAC/7TWARwbk=;
 b=XiDHJ+jN17uKNa4+o1avC/4DakLU6QP2fDU3H1OujOSuUOTpxxoIAEJfrJVZNO/4YuzjiWH0haAkL53WO/+30YRRPCqjLO3aG6656ZRKKqhEWb9Z7wBUCEO2i/20XjQl3K1N2GWlZf1uoDfL0XrItUiLatcohRxn6EN3wJcBBQu6OPk2tH5DzKwnQeowfKkO40N/tHSfyEIF4AjCQel8onj/WoPz799s06Gz7Gn2iuI/AuRpR7KGI4GMpBZ8dO+mn0kIFysVDcQGeTxgl80jnykk4hOdGOPvbc+88Y6XlLvrBaf+SmlivKaifb6GwR9R9/+bXP22Jzv8VFskuYlYbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB8687.namprd11.prod.outlook.com (2603:10b6:8:1be::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.19; Sat, 16 Mar
 2024 01:27:25 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7386.017; Sat, 16 Mar 2024
 01:27:25 +0000
Date: Sat, 16 Mar 2024 01:25:44 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Zeng, Oak" <oak.zeng@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Hellstrom, Thomas" <thomas.hellstrom@intel.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "Welty, Brian" <brian.welty@intel.com>, "Ghimiray, Himal
 Prasad" <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH 1/5] drm/xe/svm: Remap and provide memmap backing for GPU
 vram
Message-ID: <ZfT1GGV0mJMi2C4A@DUT025-TGLU.fm.intel.com>
References: <20240314033553.1379444-1-oak.zeng@intel.com>
 <20240314033553.1379444-2-oak.zeng@intel.com>
 <ZfMxR/YHY/LP88KZ@DUT025-TGLU.fm.intel.com>
 <SA1PR11MB6991042C806081949493087592292@SA1PR11MB6991.namprd11.prod.outlook.com>
 <ZfNiw+M8ClCaR9Xn@DUT025-TGLU.fm.intel.com>
 <SA1PR11MB6991E3115AC96F4A6FF257A792282@SA1PR11MB6991.namprd11.prod.outlook.com>
 <ZfSyDEioCxXpJrTc@DUT025-TGLU.fm.intel.com>
 <SA1PR11MB6991A38E8BD181BFA0C1701892282@SA1PR11MB6991.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <SA1PR11MB6991A38E8BD181BFA0C1701892282@SA1PR11MB6991.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR13CA0164.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB8687:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d144e75-9228-4f52-3fbe-08dc45583c94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ExSIRmojF62Ks9kPxoiOu3S4oz9Ux6Nl5HEBHin4UClmVspOVdJSEttBg6g6dqL7EyesWBCgxgzaSg3sOOzugVctOBI2mrrHbvFiv9HYYOZAPcV/d2aLWmk6pQdIOHCiiucdsx9nDu/P2TKKKPLIuQyUnl26t3M4XM6r/1KvOTmYm22ywzdx+7yinWconUijtVW1ACYUn106QotCty+TXPUKB/TPdp+kcKTaaCmpWlRTP2xTxKiYN7VDrRL+h/FZ382Xdnbi/dgaa24mpYjaTwGaSnQwKTP615aQUFhqDUQa62w/bo5QE/8LRS3MVL2OthfWEDrE4cEKsZ0ztbv8JdUfd9jWQ9HxUMvlrQZqm/r5M0iHVIqTSLP4nJHUsxxa6OfvDGW8vaPlZyswjBLzcB55lIvC0R/crDnUIYmSK0OLLMT9yrNHzUoU/wHfBUpcLKeNDd64G2MOij6lZih6AkZNo8J7WPB61lreErS28njKJraexC6a7+AFveBmWWXs/WUussJ7MdY5sr5jyYu2Vk8upE6bXFJEVXmkvo6owCJ9PuwzVk+8sSTI7nObm6OE/0GhWOGtDiwbyy3OwY2azkCMcvBW4CIUM8tf678E9eU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Be3UDd4w6Kbjm/E+kimVGCYW+MPNJDdVZwMia1S0DyDTzCS/0frsvbsMlc?=
 =?iso-8859-1?Q?XxeJgkeDCIhqJpzTOu0+sz31L8K+k1Pzn+yiNGEAI/RXleb80bHWDfZb/g?=
 =?iso-8859-1?Q?9AByw33FNjSQpdCmTmjf1PVQ/LRWekz9WV3kdoEjYzgZ9XrZqJ+qBVXmD6?=
 =?iso-8859-1?Q?EvlwFpv/BvU/AAORUEaGbsySOZolU0t5QDlmBwiE/sORGaTqhXD395Q7Kl?=
 =?iso-8859-1?Q?CrOXWS/O3hRYNSYeGHtpPhpYp9iaxW8+yHsUmrvNIAxRE0xavzg0i0dLxH?=
 =?iso-8859-1?Q?gqRBcnDFcV5BymBMLvf2T/e6WOfZXu9UKeyCvAe5KydtSvHdPxGQxQSbjP?=
 =?iso-8859-1?Q?JyXHZeKrAcB0u17cVXQX9tuTVibTvHOhqlLLbmxSmIn83ywRwi2zAOwbh6?=
 =?iso-8859-1?Q?kgwU7bqp2EXQJWObYThvKceX5BWQcU0cJyXeDUX+cwTHAAurEmqRbqDroy?=
 =?iso-8859-1?Q?NO5Pp3U538jxMxrLbqNVL47ShHzGBHB5kNusHMybt81HZUOw1w1vEheTHr?=
 =?iso-8859-1?Q?/cDTLSehigsGDqTUWeZo96eBJipF0gNXMDJipRO+VJonjoy2csGHrBDcV9?=
 =?iso-8859-1?Q?yidwpZtcUhLSrc+LVATdQdTInJVDzz9s5ttcK5uj/gVhSWMovdxLVzLJfd?=
 =?iso-8859-1?Q?CjHIC03EhQh9eHOGPdd9klxmvR6DbuPi/lx/YN6X2Lddh+Fgj1uLpFBgNz?=
 =?iso-8859-1?Q?hFnfX3OvCE/PRHFMArKWrRKx/cOgn2i2f1F1q7JKDwhPLhIkrPtszjnp06?=
 =?iso-8859-1?Q?+m7Brl/jcF0oK6maK7zCv73r+w6ZdeJXmmrcW8mpg0hp08cOqOJ0F8eAu8?=
 =?iso-8859-1?Q?Yf7UhzKPKl/U+7+8o7PNc3TJnPbaGG8R4f+oG/FlHo8Z3NsQ5UVShBLJjm?=
 =?iso-8859-1?Q?KXU+9iasHk/J/IZRTQUCinEm8C5fm47lWRnO5CBdnd52W0XfVxSfhS+1ZX?=
 =?iso-8859-1?Q?vCLtCG5tyQ/9m9rb6pEIk5PpNLF+dn1t0jSXNnXGeNI2reObiV6xhNVaP+?=
 =?iso-8859-1?Q?WjetoLjiHv9Ot+NN9zSe+DIngAl9H9eQuhRho6i4Sw58v9Oif+KJCHn0Kx?=
 =?iso-8859-1?Q?PyyOtJw23fZHGgvqZpKOahFyhd5n1vCMsT24VGJ/k3Gfy5+fNqRfOtyE/1?=
 =?iso-8859-1?Q?NRsJlZg3+TFZxwY4yybx+DRD2J2JJ2iEEHVVK1TU4LfDDicrMPZ/mQVz9n?=
 =?iso-8859-1?Q?UEQurmFaUs7mEMbIWbch/jtnNBv81YqKJNtD12gewNouK40lC0L/pW1miV?=
 =?iso-8859-1?Q?5HWmtA9r/Zm96wO/TRanHt/lOl6ynLBX8iozTinA8ETmjbhebbyqriYw+L?=
 =?iso-8859-1?Q?kBK6HiKkB2w1mmUQJ3GYC4E3dilzBfD8Dm5zJNmCgfALaMXNRk5CkHlp2U?=
 =?iso-8859-1?Q?o77GRv3XJoOOs0XhssBs+R//2eTo1p/H/evKAzyvPrkt78NRulACJEPQww?=
 =?iso-8859-1?Q?l+f7MX7Dmaa0tLANvwD72qNmxlb43twgCyTA63eT//dCSF9IkV0L1ipL3b?=
 =?iso-8859-1?Q?K2OS1e/nsN1T48E/dAJbNP21J2mi3ZHhw9DXC7DjTDiqpc0FDXQCZOr3Ea?=
 =?iso-8859-1?Q?WKrGDHV2Fwzlfe8UDFJMVbpCcmH3eTnH3MrmRamvxCltuPuZulY9fDG328?=
 =?iso-8859-1?Q?BFtHqfOxVqH4SanI925mOt3jjQdw6EV8XBtvl13C8QetcGyT1U1Hu5VA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d144e75-9228-4f52-3fbe-08dc45583c94
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2024 01:27:25.7053 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FRi70+dQhGm8mqaFzUj3BgzQW8vZ7LV55MvGqZYTxRAPXhHU7STdkaMz0AG6x04KvOAfeeJ9gMKVwlELLEddew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8687
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

On Fri, Mar 15, 2024 at 03:31:24PM -0600, Zeng, Oak wrote:
> 
> 
> > -----Original Message-----
> > From: Brost, Matthew <matthew.brost@intel.com>
> > Sent: Friday, March 15, 2024 4:40 PM
> > To: Zeng, Oak <oak.zeng@intel.com>
> > Cc: intel-xe@lists.freedesktop.org; Hellstrom, Thomas
> > <thomas.hellstrom@intel.com>; airlied@gmail.com; Welty, Brian
> > <brian.welty@intel.com>; Ghimiray, Himal Prasad
> > <himal.prasad.ghimiray@intel.com>
> > Subject: Re: [PATCH 1/5] drm/xe/svm: Remap and provide memmap backing for
> > GPU vram
> > 
> > On Fri, Mar 15, 2024 at 10:00:06AM -0600, Zeng, Oak wrote:
> > >
> > >
> > > > -----Original Message-----
> > > > From: Brost, Matthew <matthew.brost@intel.com>
> > > > Sent: Thursday, March 14, 2024 4:49 PM
> > > > To: Zeng, Oak <oak.zeng@intel.com>
> > > > Cc: intel-xe@lists.freedesktop.org; Hellstrom, Thomas
> > > > <thomas.hellstrom@intel.com>; airlied@gmail.com; Welty, Brian
> > > > <brian.welty@intel.com>; Ghimiray, Himal Prasad
> > > > <himal.prasad.ghimiray@intel.com>
> > > > Subject: Re: [PATCH 1/5] drm/xe/svm: Remap and provide memmap backing
> > for
> > > > GPU vram
> > > >
> > > > On Thu, Mar 14, 2024 at 12:32:36PM -0600, Zeng, Oak wrote:
> > > > > Hi Matt,
> > > > >
> > > > > > -----Original Message-----
> > > > > > From: Brost, Matthew <matthew.brost@intel.com>
> > > > > > Sent: Thursday, March 14, 2024 1:18 PM
> > > > > > To: Zeng, Oak <oak.zeng@intel.com>
> > > > > > Cc: intel-xe@lists.freedesktop.org; Hellstrom, Thomas
> > > > > > <thomas.hellstrom@intel.com>; airlied@gmail.com; Welty, Brian
> > > > > > <brian.welty@intel.com>; Ghimiray, Himal Prasad
> > > > > > <himal.prasad.ghimiray@intel.com>
> > > > > > Subject: Re: [PATCH 1/5] drm/xe/svm: Remap and provide memmap
> > backing
> > > > for
> > > > > > GPU vram
> > > > > >
> > > > > > On Wed, Mar 13, 2024 at 11:35:49PM -0400, Oak Zeng wrote:
> > > > > > > Memory remap GPU vram using devm_memremap_pages, so each
> > GPU
> > > > vram
> > > > > > > page is backed by a struct page.
> > > > > > >
> > > > > > > Those struct pages are created to allow hmm migrate buffer b/t
> > > > > > > GPU vram and CPU system memory using existing Linux migration
> > > > > > > mechanism (i.e., migrating b/t CPU system memory and hard disk).
> > > > > > >
> > > > > > > This is prepare work to enable svm (shared virtual memory) through
> > > > > > > Linux kernel hmm framework. The memory remap's page map type is
> > set
> > > > > > > to MEMORY_DEVICE_PRIVATE for now. This means even though each
> > GPU
> > > > > > > vram page get a struct page and can be mapped in CPU page table,
> > > > > > > but such pages are treated as GPU's private resource, so CPU can't
> > > > > > > access them. If CPU access such page, a page fault is triggered
> > > > > > > and page will be migrate to system memory.
> > > > > > >
> > > > > >
> > > > > > Is this really true? We can map VRAM BOs to the CPU without having
> > > > > > migarte back and forth. Admittedly I don't know the inner workings of
> > > > > > how this works but in IGTs we do this all the time.
> > > > > >
> > > > > >   54         batch_bo = xe_bo_create(fd, vm, batch_size,
> > > > > >   55                                 vram_if_possible(fd, 0),
> > > > > >   56
> > DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> > > > > >   57         batch_map = xe_bo_map(fd, batch_bo, batch_size);
> > > > > >
> > > > > > The BO is created in VRAM and then mapped to the CPU.
> > > > > >
> > > > > > I don't think there is an expectation of coherence rather caching mode
> > > > > > and exclusive access of the memory based on synchronization.
> > > > > >
> > > > > > e.g.
> > > > > > User write BB/data via CPU to GPU memory
> > > > > > User calls exec
> > > > > > GPU read / write memory
> > > > > > User wait on sync indicating exec done
> > > > > > User reads result
> > > > > >
> > > > > > All of this works without migration. Are we not planing supporting flow
> > > > > > with SVM?
> > > > > >
> > > > > > Afaik this migration dance really only needs to be done if the CPU and
> > > > > > GPU are using atomics on a shared memory region and the GPU device
> > > > > > doesn't support a coherent memory protocol (e.g. PVC).
> > > > >
> > > > > All you said is true. On many of our HW, CPU can actually access device
> > memory,
> > > > cache coherently or not.
> > > > >
> > > > > The problem is, this is not true for all GPU vendors. For example, on some
> > HW
> > > > from some vendor, CPU can only access partially of device memory. The so
> > called
> > > > small bar concept.
> > > > >
> > > > > So when HMM is defined, such factors were considered, and
> > > > MEMORY_DEVICE_PRIVATE is defined. With this definition, CPU can't access
> > > > device memory.
> > > > >
> > > > > So you can think it is a limitation of HMM.
> > > > >
> > > >
> > > > Is it though? I see other type MEMORY_DEVICE_FS_DAX,
> > > > MEMORY_DEVICE_GENERIC, and MEMORY_DEVICE_PCI_P2PDMA. From my
> > > > limited
> > > > understanding it looks to me like one of those modes would support my
> > > > example.
> > >
> > >
> > > No, above are for other purposes. HMM only support DEVICE_PRIVATE and
> > DEVICE_COHERENT.
> > >
> > > >
> > > > > Note this is only part 1 of our system allocator work. We do plan to support
> > > > DEVICE_COHERENT for our newer device, see below. With this option, we
> > don't
> > > > have unnecessary migration back and forth.
> > > > >
> > > > > You can think this is just work out all the code path. 90% of the driver code
> > for
> > > > DEVICE_PRIVATE and DEVICE_COHERENT will be same. Our real use of system
> > > > allocator will be DEVICE_COHERENT mode. While DEVICE_PRIVATE mode
> > allow us
> > > > to exercise the code on old HW.
> > > > >
> > > > > Make sense?
> > > > >
> > > >
> > > > I guess if we want the system allocator to always coherent, then yes you
> > > > need this dynamic migration with faulting on either side.
> > > >
> > > > I was thinking the system allocator would be behave like my example
> > > > above with madvise dictating the coherence rules.
> > > >
> > > > Maybe I missed this in system allocator design but my feeling is we
> > > > shouldn't arbitrarily enforce coherence as that could lead to poor
> > > > performance due to constant migration.
> > >
> > > System allocator itself doesn't enforce coherence. Coherence is built in user
> > programming model. So system allocator allow both GPU and CPU access system
> > allocated pointers, but it doesn't necessarily guarantee the data accessed from
> > CPU/GPU is coherent. It is user program's responsibility to maintain data
> > coherence.
> > >
> > > Data migration in driver is optional, depending on platform capability, user
> > preference, correctness and performance consideration. Driver internal data
> > migration of course shouldn't break data coherence.
> > >
> > > Of course different vendor can have different data coherence scheme. For
> > example, it is completely designer's flexibility to build model that is HW automatic
> > data coherence or software explicit data coherence. On our platform, we allow
> > user program to select different coherence mode by setting pat_index for gpu
> > and cpu_caching mode for CPU. So we have completely give the flexibility to user
> > program. Nothing of this contract is changed in system allocator design.
> > >
> > > Going back to the question of what memory type we should use to register our
> > vram to core mm. HMM currently support two types: PRIVATE and COHERENT.
> > The coherent type requires some HW and BIOS support which we don't have
> > right now. So the only available is PRIVATE. We have not other option right now.
> > As said, we plan to support coherent type where we can avoid unnecessary data
> > migration. But that is stage 2.
> > >
> > 
> > Thanks for the explaination. After reading your replies, the HMM doc,
> > and looking at code this all makes sense.
> > 
> > > >
> > > > >
> > > > > >
> > > > > > > For GPU device which supports coherent memory protocol b/t CPU and
> > > > > > > GPU (such as CXL and CAPI protocol), we can remap device memory as
> > > > > > > MEMORY_DEVICE_COHERENT. This is TBD.
> > > > > > >
> > > > > > > Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> > > > > > > Co-developed-by: Niranjana Vishwanathapura
> > > > > > <niranjana.vishwanathapura@intel.com>
> > > > > > > Signed-off-by: Niranjana Vishwanathapura
> > > > > > <niranjana.vishwanathapura@intel.com>
> > > > > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > > > > Cc: Thomas Hellström <thomas.hellstrom@intel.com>
> > > > > > > Cc: Brian Welty <brian.welty@intel.com>
> > > > > > > ---
> > > > > > >  drivers/gpu/drm/xe/Makefile          |  3 +-
> > > > > > >  drivers/gpu/drm/xe/xe_device_types.h |  9 +++
> > > > > > >  drivers/gpu/drm/xe/xe_mmio.c         |  8 +++
> > > > > > >  drivers/gpu/drm/xe/xe_svm.h          | 14 +++++
> > > > > > >  drivers/gpu/drm/xe/xe_svm_devmem.c   | 91
> > > > > > ++++++++++++++++++++++++++++
> > > > > > >  5 files changed, 124 insertions(+), 1 deletion(-)
> > > > > > >  create mode 100644 drivers/gpu/drm/xe/xe_svm.h
> > > > > > >  create mode 100644 drivers/gpu/drm/xe/xe_svm_devmem.c
> > > > > > >
> > > > > > > diff --git a/drivers/gpu/drm/xe/Makefile
> > b/drivers/gpu/drm/xe/Makefile
> > > > > > > index c531210695db..840467080e59 100644
> > > > > > > --- a/drivers/gpu/drm/xe/Makefile
> > > > > > > +++ b/drivers/gpu/drm/xe/Makefile
> > > > > > > @@ -142,7 +142,8 @@ xe-y += xe_bb.o \
> > > > > > >  	xe_vram_freq.o \
> > > > > > >  	xe_wait_user_fence.o \
> > > > > > >  	xe_wa.o \
> > > > > > > -	xe_wopcm.o
> > > > > > > +	xe_wopcm.o \
> > > > > > > +	xe_svm_devmem.o
> > > > > >
> > > > > > These should be in alphabetical order.
> > > > >
> > > > > Will fix
> > > > > >
> > > > > > >
> > > > > > >  # graphics hardware monitoring (HWMON) support
> > > > > > >  xe-$(CONFIG_HWMON) += xe_hwmon.o
> > > > > > > diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> > > > > > b/drivers/gpu/drm/xe/xe_device_types.h
> > > > > > > index 9785eef2e5a4..f27c3bee8ce7 100644
> > > > > > > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > > > > > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > > > > > > @@ -99,6 +99,15 @@ struct xe_mem_region {
> > > > > > >  	resource_size_t actual_physical_size;
> > > > > > >  	/** @mapping: pointer to VRAM mappable space */
> > > > > > >  	void __iomem *mapping;
> > > > > > > +	/** @pagemap: Used to remap device memory as ZONE_DEVICE
> > */
> > > > > > > +    struct dev_pagemap pagemap;
> > > > > > > +    /**
> > > > > > > +     * @hpa_base: base host physical address
> > > > > > > +     *
> > > > > > > +     * This is generated when remap device memory as ZONE_DEVICE
> > > > > > > +     */
> > > > > > > +    resource_size_t hpa_base;
> > > > > >
> > > > > > Weird indentation. This goes for the entire series, look at checkpatch.
> > > > >
> > > > > Will fix
> > > > > >
> > > > > > > +
> > > > > > >  };
> > > > > > >
> > > > > > >  /**
> > > > > > > diff --git a/drivers/gpu/drm/xe/xe_mmio.c
> > > > b/drivers/gpu/drm/xe/xe_mmio.c
> > > > > > > index e3db3a178760..0d795394bc4c 100644
> > > > > > > --- a/drivers/gpu/drm/xe/xe_mmio.c
> > > > > > > +++ b/drivers/gpu/drm/xe/xe_mmio.c
> > > > > > > @@ -22,6 +22,7 @@
> > > > > > >  #include "xe_module.h"
> > > > > > >  #include "xe_sriov.h"
> > > > > > >  #include "xe_tile.h"
> > > > > > > +#include "xe_svm.h"
> > > > > > >
> > > > > > >  #define XEHP_MTCFG_ADDR		XE_REG(0x101800)
> > > > > > >  #define TILE_COUNT		REG_GENMASK(15, 8)
> > > > > > > @@ -286,6 +287,7 @@ int xe_mmio_probe_vram(struct xe_device *xe)
> > > > > > >  		}
> > > > > > >
> > > > > > >  		io_size -= min_t(u64, tile_size, io_size);
> > > > > > > +		xe_svm_devm_add(tile, &tile->mem.vram);
> > > > > >
> > > > > > Do we want to do this probe for all devices with VRAM or only a subset?
> > > > >
> > > > > All
> > > >
> > > > Can you explain why?
> > >
> > > It is natural for me to add all device memory to hmm. In hmm design, device
> > memory is used as a special swap out for system memory. I would ask why we
> > only want to add a subset of vram? By a subset, do you mean only vram of one
> > tile instead of all tiles?
> > >
> > 
> > I think we talking about different things, my bad on wording in the
> > original question.
> > 
> > Let me ask again - should be calling xe_svm_devm_add on all *platforms*
> > that have VRAM. i.e. Should we do this on PVC but not DG2?
> 
> 
> Oh, I see. Good question. On i915, this feature was only tested on PVC. We don't have a plan to enable it on older platform than PVC. 
> 
> Let me add a check here, only enabled it on platform newer than PVC
> 

Probably actually check 'xe->info.has_usm'.

We might want to rename field too and drop the 'usm' nomenclature but
that can be done later.

Matt

> Oak 
> 
> > 
> > Matt
> > 
> > > Oak
> > >
> > >
> > > >
> > > > > >
> > > > > > >  	}
> > > > > > >
> > > > > > >  	xe->mem.vram.actual_physical_size = total_size;
> > > > > > > @@ -354,10 +356,16 @@ void xe_mmio_probe_tiles(struct xe_device
> > *xe)
> > > > > > >  static void mmio_fini(struct drm_device *drm, void *arg)
> > > > > > >  {
> > > > > > >  	struct xe_device *xe = arg;
> > > > > > > +    struct xe_tile *tile;
> > > > > > > +    u8 id;
> > > > > > >
> > > > > > >  	pci_iounmap(to_pci_dev(xe->drm.dev), xe->mmio.regs);
> > > > > > >  	if (xe->mem.vram.mapping)
> > > > > > >  		iounmap(xe->mem.vram.mapping);
> > > > > > > +
> > > > > > > +	for_each_tile(tile, xe, id)
> > > > > > > +		xe_svm_devm_remove(xe, &tile->mem.vram);
> > > > > >
> > > > > > This should probably be above existing code. Typical on fini to do
> > > > > > things in reverse order from init.
> > > > >
> > > > > Will fix
> > > > > >
> > > > > > > +
> > > > > > >  }
> > > > > > >
> > > > > > >  static int xe_verify_lmem_ready(struct xe_device *xe)
> > > > > > > diff --git a/drivers/gpu/drm/xe/xe_svm.h
> > b/drivers/gpu/drm/xe/xe_svm.h
> > > > > > > new file mode 100644
> > > > > > > index 000000000000..09f9afb0e7d4
> > > > > > > --- /dev/null
> > > > > > > +++ b/drivers/gpu/drm/xe/xe_svm.h
> > > > > > > @@ -0,0 +1,14 @@
> > > > > > > +// SPDX-License-Identifier: MIT
> > > > > > > +/*
> > > > > > > + * Copyright © 2023 Intel Corporation
> > > > > >
> > > > > > 2024?
> > > > >
> > > > > This patch was actually written 2023
> > > > > >
> > > > > > > + */
> > > > > > > +
> > > > > > > +#ifndef __XE_SVM_H
> > > > > > > +#define __XE_SVM_H
> > > > > > > +
> > > > > > > +#include "xe_device_types.h"
> > > > > >
> > > > > > I don't think you need to include this. Rather just forward decl structs
> > > > > > used here.
> > > > >
> > > > > Will fix
> > > > > >
> > > > > > e.g.
> > > > > >
> > > > > > struct xe_device;
> > > > > > struct xe_mem_region;
> > > > > > struct xe_tile;
> > > > > >
> > > > > > > +
> > > > > > > +int xe_svm_devm_add(struct xe_tile *tile, struct xe_mem_region
> > *mem);
> > > > > > > +void xe_svm_devm_remove(struct xe_device *xe, struct
> > xe_mem_region
> > > > > > *mem);
> > > > > >
> > > > > > The arguments here are incongruent here. Typically we want these to
> > > > > > match.
> > > > >
> > > > > Will fix
> > > > > >
> > > > > > > +
> > > > > > > +#endif
> > > > > > > diff --git a/drivers/gpu/drm/xe/xe_svm_devmem.c
> > > > > > b/drivers/gpu/drm/xe/xe_svm_devmem.c
> > > > > >
> > > > > > Incongruent between xe_svm.h and xe_svm_devmem.c.
> > > > >
> > > > > Did you mean mem vs mr? if yes, will fix
> > > > >
> > > > > Again these two
> > > > > > should
> > > > > > match.
> > > > > >
> > > > > > > new file mode 100644
> > > > > > > index 000000000000..63b7a1961cc6
> > > > > > > --- /dev/null
> > > > > > > +++ b/drivers/gpu/drm/xe/xe_svm_devmem.c
> > > > > > > @@ -0,0 +1,91 @@
> > > > > > > +// SPDX-License-Identifier: MIT
> > > > > > > +/*
> > > > > > > + * Copyright © 2023 Intel Corporation
> > > > > >
> > > > > > 2024?
> > > > > It is from 2023
> > > > > >
> > > > > > > + */
> > > > > > > +
> > > > > > > +#include <linux/mm_types.h>
> > > > > > > +#include <linux/sched/mm.h>
> > > > > > > +
> > > > > > > +#include "xe_device_types.h"
> > > > > > > +#include "xe_trace.h"
> > > > > >
> > > > > > xe_trace.h appears to be unused.
> > > > >
> > > > > Will fix
> > > > > >
> > > > > > > +#include "xe_svm.h"
> > > > > > > +
> > > > > > > +
> > > > > > > +static vm_fault_t xe_devm_migrate_to_ram(struct vm_fault *vmf)
> > > > > > > +{
> > > > > > > +	return 0;
> > > > > > > +}
> > > > > > > +
> > > > > > > +static void xe_devm_page_free(struct page *page)
> > > > > > > +{
> > > > > > > +}
> > > > > > > +
> > > > > > > +static const struct dev_pagemap_ops xe_devm_pagemap_ops = {
> > > > > > > +	.page_free = xe_devm_page_free,
> > > > > > > +	.migrate_to_ram = xe_devm_migrate_to_ram,
> > > > > > > +};
> > > > > > > +
> > > > > >
> > > > > > Assume these are placeholders that will be populated later?
> > > > >
> > > > >
> > > > > corrrect
> > > > > >
> > > > > > > +/**
> > > > > > > + * xe_svm_devm_add: Remap and provide memmap backing for
> > device
> > > > > > memory
> > > > > > > + * @tile: tile that the memory region blongs to
> > > > > > > + * @mr: memory region to remap
> > > > > > > + *
> > > > > > > + * This remap device memory to host physical address space and create
> > > > > > > + * struct page to back device memory
> > > > > > > + *
> > > > > > > + * Return: 0 on success standard error code otherwise
> > > > > > > + */
> > > > > > > +int xe_svm_devm_add(struct xe_tile *tile, struct xe_mem_region *mr)
> > > > > >
> > > > > > Here I see the xe_mem_region is from tile->mem.vram, wondering rather
> > > > > > than using the tile->mem.vram we should use xe->mem.vram when
> > enabling
> > > > > > svm? Isn't the idea behind svm the entire memory is 1 view?
> > > > >
> > > > > Still need to use tile. The reason is, memory of different tile can have
> > different
> > > > characteristics, such as latency. So we want to differentiate memory b/t tiles
> > also
> > > > in svm. I need to change below " mr->pagemap.owner = tile->xe->drm.dev ".
> > the
> > > > owner should also be tile. This is the way hmm differentiate memory of
> > different
> > > > tile.
> > > > >
> > > > > With svm it is 1 view, from virtual address space perspective and from
> > physical
> > > > struct page perspective. You can think of all the tile's vram is stacked together
> > to
> > > > form a unified view together with system memory. This doesn't prohibit us
> > from
> > > > differentiate memory from different tile. This differentiation allow us to
> > optimize
> > > > performance, i.e., we can wisely place memory in specific tile. If we don't
> > > > differentiate, this is not possible.
> > > > >
> > > >
> > > > Ok makes sense.
> > > >
> > > > Matt
> > > >
> > > > > >
> > > > > > I suppose if we do that we also only use 1 TTM VRAM manager / buddy
> > > > > > allocator too. I thought I saw some patches flying around for that too.
> > > > >
> > > > > Ttm vram manager is not in the picture. We deliberately avoided it per
> > previous
> > > > discussion
> > > > >
> > > > > Yes same buddy allocator. It is in my previous POC:
> > https://lore.kernel.org/dri-
> > > > devel/20240117221223.18540-12-oak.zeng@intel.com/. I didn't put those
> > patches
> > > > in this series because I want to merge this small patches separately.
> > > > > >
> > > > > > > +{
> > > > > > > +	struct device *dev = &to_pci_dev(tile->xe->drm.dev)->dev;
> > > > > > > +	struct resource *res;
> > > > > > > +	void *addr;
> > > > > > > +	int ret;
> > > > > > > +
> > > > > > > +	res = devm_request_free_mem_region(dev, &iomem_resource,
> > > > > > > +					   mr->usable_size);
> > > > > > > +	if (IS_ERR(res)) {
> > > > > > > +		ret = PTR_ERR(res);
> > > > > > > +		return ret;
> > > > > > > +	}
> > > > > > > +
> > > > > > > +	mr->pagemap.type = MEMORY_DEVICE_PRIVATE;
> > > > > > > +	mr->pagemap.range.start = res->start;
> > > > > > > +	mr->pagemap.range.end = res->end;
> > > > > > > +	mr->pagemap.nr_range = 1;
> > > > > > > +	mr->pagemap.ops = &xe_devm_pagemap_ops;
> > > > > > > +	mr->pagemap.owner = tile->xe->drm.dev;
> > > > > > > +	addr = devm_memremap_pages(dev, &mr->pagemap);
> > > > > > > +	if (IS_ERR(addr)) {
> > > > > > > +		devm_release_mem_region(dev, res->start,
> > resource_size(res));
> > > > > > > +		ret = PTR_ERR(addr);
> > > > > > > +		drm_err(&tile->xe->drm, "Failed to remap tile %d
> > memory,
> > > > > > errno %d\n",
> > > > > > > +				tile->id, ret);
> > > > > > > +		return ret;
> > > > > > > +	}
> > > > > > > +	mr->hpa_base = res->start;
> > > > > > > +
> > > > > > > +	drm_info(&tile->xe->drm, "Added tile %d memory [%llx-%llx] to
> > devm,
> > > > > > remapped to %pr\n",
> > > > > > > +			tile->id, mr->io_start, mr->io_start + mr-
> > >usable_size,
> > > > > > res);
> > > > > > > +	return 0;
> > > > > > > +}
> > > > > > > +
> > > > > > > +/**
> > > > > > > + * xe_svm_devm_remove: Unmap device memory and free resources
> > > > > > > + * @xe: xe device
> > > > > > > + * @mr: memory region to remove
> > > > > > > + */
> > > > > > > +void xe_svm_devm_remove(struct xe_device *xe, struct
> > xe_mem_region
> > > > > > *mr)
> > > > > > > +{
> > > > > > > +	/*FIXME: below cause a kernel hange during moduel remove*/
> > > > > > > +#if 0
> > > > > > > +	struct device *dev = &to_pci_dev(xe->drm.dev)->dev;
> > > > > > > +
> > > > > > > +	if (mr->hpa_base) {
> > > > > > > +		devm_memunmap_pages(dev, &mr->pagemap);
> > > > > > > +		devm_release_mem_region(dev, mr-
> > >pagemap.range.start,
> > > > > > > +			mr->pagemap.range.end - mr-
> > >pagemap.range.start +1);
> > > > > > > +	}
> > > > > > > +#endif
> > > > > >
> > > > > > This would need to be fixed too.
> > > > >
> > > > >
> > > > > Yes...
> > > > >
> > > > > Oak
> > > > > >
> > > > > > Matt
> > > > > >
> > > > > > > +}
> > > > > > > +
> > > > > > > --
> > > > > > > 2.26.3
> > > > > > >
