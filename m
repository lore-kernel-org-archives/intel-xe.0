Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22FA9C6FD1F
	for <intel-xe@archiver.kernel.org>; Wed,  3 Apr 2024 04:14:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95AB41123EC;
	Wed,  3 Apr 2024 04:14:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jc+3U0tA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B568A1123EC
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Apr 2024 04:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712117697; x=1743653697;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=C3F3gvKKiNqHy9mthEo016t9sGvh3grG/ryhlzN0fbA=;
 b=Jc+3U0tALaiCX7FzhPBNMcOBjGz01bajpwcP8jNHo7aFVT9O1wKn0GZ0
 ZcBAfLx1bOtYdCIzIyhzMNh4otvQTSkwnkW1hzbN4xcQjVotG+XL5o4XI
 C8YMoygu/W+dFRVXf8WCPcOvvDY9R3k/yTUfl0XJUNC44nAYbQxgwVc0C
 DBm/JJuF3wzdTFZHEHfFCZBu1lh/GL5A9/Kgbn1h7CCLp2NO2JbXgZcIq
 bRO02jFY7cmYDM+uUbPrAbQjDIVMJ4rfVx10TyyLPMRRTQbHlwoA8gPfr
 SmtOzU95HzfTFlFJCqNhcEriZlndNldvuqdcoukwjoCcXbaDDmFrqH/79 w==;
X-CSE-ConnectionGUID: P454+GV3RtGmhCLeG0YopQ==
X-CSE-MsgGUID: y0E2gGJoSxiR7G64SgHrGA==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="32719356"
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; d="scan'208";a="32719356"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 21:14:56 -0700
X-CSE-ConnectionGUID: 2/1Q2ZyCQIaxn1gRkHm0uw==
X-CSE-MsgGUID: k5y5JgUQSFi8efvoqr594Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; d="scan'208";a="22760673"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Apr 2024 21:14:56 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 2 Apr 2024 21:14:55 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 2 Apr 2024 21:14:55 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 2 Apr 2024 21:14:55 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 2 Apr 2024 21:14:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AKzCJG9W+0SHbicPqR8r2TVbgSHfBgsWUlF+eWhL+YTiwoVi6uwRxGhx0Bv/5UzHItaClrlIrPftmaBoEDLA2mnr/dJeoNZlLOhBidcv1JeAzHGhfekxm7MYx+AaaoS6A7Mq/7ZxxuX7PrV1RBg7W88WHAraJ+GU+aPGxyn2oaPjMXHk7AuYHP+D44lfoRaWJEjgrMFzusAThfUl0HfLy4HiKOwPv9PI7G9HLc+T1fGmBTWcQkdJh5Yag0MoNQJXhHNs70EoC79N0f7u0OEsPD6VCrk2PLe+bftECisjq2hJvSAep/KRjoNrwVQCkHPUrUmiDyxIGX1AmqFoGea4gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TmD6NxgjbZFJ9PV5/J1PptVBG/Mn4wxqfay23mE2814=;
 b=ip6z9YXI2jfgAqLSnvecdg8bDo+oBFEhQhgdSNodmB3WYzwA43l+/EqfsQqfBtNxjhv79pw04qZkOWG1s+UUMYPyQiMydinySixfin/Ek8Q03Two2PkDZHQJnFzNV1rXfu3XnkPRFap/ltqDPaISr7hM91IXUvk7M5wje9LuA8WMBGQPPtT6NiHhgXcVgjwNWorFdZdh13hTuXYlBXUTpW5uIMV8uxC/9wN5/3a8Sygi6xEngb+1mWeIffwt/LL+8PislPTBe+a8ZzAW3wADbke+QjELmAfHZ/SZn7NEGzCfR1MZzA+dMU0ZvNi7g3s53+Axt5G6VCX9lUlsNb2TRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25; Wed, 3 Apr
 2024 04:14:38 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7452.019; Wed, 3 Apr 2024
 04:14:37 +0000
Date: Wed, 3 Apr 2024 04:15:27 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Zeng, Oak" <oak.zeng@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Hellstrom, Thomas" <thomas.hellstrom@intel.com>, "Welty, Brian"
 <brian.welty@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH 1/3] drm/xe: Introduce helper to populate userptr
Message-ID: <ZgzX3yHr3thHMU7n@DUT025-TGLU.fm.intel.com>
References: <20240322035520.2382600-1-oak.zeng@intel.com>
 <20240322035520.2382600-2-oak.zeng@intel.com>
 <ZgzHG+Qfqvb6ARlu@DUT025-TGLU.fm.intel.com>
 <PH7PR11MB7004585EB926742911DB627F923D2@PH7PR11MB7004.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PH7PR11MB7004585EB926742911DB627F923D2@PH7PR11MB7004.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR13CA0166.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::21) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB8287:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x9i2n0GWXOYKkjt/5EFYVDjzzZihhf0LV3rJH0onqTfU6w7bfQG+z+++01a+t/PYpyfD/MA4SKSPhmFlPEs7aT0mIEDqC1YJa3xqydgfadyGVeJH/uTP/0u0GysXQ7UyM2A9YwRuKLXo+9fWQxVQt6Q1T/BDdtbTRARnPNb6Cb+fT59cP4ro72Tpd2f6Vw9sRm/UT5yYG6FWtYxNq+QIV/3DlXbeu+d6T82oKL7IOG/uk3G1du8W19I9QYcTTAd5qoACo6ZMSO6r7JnSLK5RXoDafp20/5vQkwCyauXX6GhMeFbhQK7V4o5ofnR1030QlHks9xWxn8G1f7LgZVdXsaB6eSXbZdSS304Q5282w2H4FHtRoh1l3m18YCRZQrp4M/qKolYxNA7334ZMWnO9CB3Zk9CxVIFDr+ej8EphdIiI6LRYvjEVcfG8HX//Jw+GnUBaonp6TcgTm5EEEgZpfyY/dVqWNpF5aNf9ll1w/Rd24ub6H6o5A/o/oosmfzIVK2zJ9coe5CM5WTsmacqnhUEHuSo/V1Gvh1lJ4wGHyaLEavSqRZLJQnFyrlERSmJLp20v8jBu8DFQ3zCF/Cc3CWdbXro4TS8wTby+ClhzGBLNXsU3C0rof34Q+7vu/PykFAUPqvRjHoqc6Mn5E9Xx0ndAK/CRIb0ReSz+H74+ID8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?tyMA5AO5okI00KYGsx5IG1I2POpLnYJNBHIX7ESEp00+XpQ5fexlq1AVRP?=
 =?iso-8859-1?Q?F0sZufN5F4+7xESUvDjBq5Eb71CRXxvJ7Kt4Uj2KTzgW3cTE9h2Q6vNfTF?=
 =?iso-8859-1?Q?czMapImPXbRhc2GWqpPH7RsK38Vxuc5nnvqK2GIKv3X9Wp/nZaK6HSVnkr?=
 =?iso-8859-1?Q?bkRhKbXe/FJPVllPjnLoHqmVOSa1I6XPnEW4XDeRJWXhtHQ4v8V3coWk2L?=
 =?iso-8859-1?Q?o75V752pWz7mZHla1DdJZu9rU6nmqy59Cw1bElwzSigNhrtAgUvQL2L45R?=
 =?iso-8859-1?Q?nwy9wksNhdoqI1axlmWoq2mtNGLgAjuq1x4sGdawTayPKUj/cM4a+AYPCN?=
 =?iso-8859-1?Q?WJf8n/x8XJkxODP1vNVzsU7UOpre5if8QRUFK/HT6rtOgDh3pJosWK6bQw?=
 =?iso-8859-1?Q?QjnlvqticYRjdWulg2uYfYACQfyPmgj3ra6w1AG2lx6TH47yYvc8xZuXAa?=
 =?iso-8859-1?Q?9hqqid1MLlmTDvvfBOEB00p3O0MFwthGuNA1uY008p16Kl2Qy22iP5UUpW?=
 =?iso-8859-1?Q?qMzXhCkrydjDqNleAs6bGwXYxDwBszuRP5aa6Iw9vT90MS3VE1PFDfAZuu?=
 =?iso-8859-1?Q?di2ULHnteSupQEOhBas/mSB79TjZTAblCsd7UjSeOdLELtbkmBAhLc1xuz?=
 =?iso-8859-1?Q?M8gQ3JLJXauCDfqp7eBn6hWrwjdGjieKP7DsfckDT39CvAffU/gZ2pmqiE?=
 =?iso-8859-1?Q?SZGnuKybcwTuu7kcWzuX9ETNIRHMsE6hPcBnChnwPtHqmyCOwTYjjSLQam?=
 =?iso-8859-1?Q?tLJYc9Fi/QqdYl7iSVAvkJE3HLV5E87Cb7rkqyl87zcIKYjhA16xuvkK0d?=
 =?iso-8859-1?Q?lesypcjQTkrhi/kCHnxaMri4wbxOREGN+EFunWEXgkFLDj/Uy6CixT17F6?=
 =?iso-8859-1?Q?ZyG1yfwBFNiz2hpQpyCtqlVKY8Kl18mA3t+1xPv8hKdP6kGajfHkNzF12W?=
 =?iso-8859-1?Q?5PQurDVngyeg+zeOuCa7BvoExg6nQpKS0qbMdDQFR8+IS2QOWXFkIu+1HE?=
 =?iso-8859-1?Q?jKsSqb3s+kxY1wb5dOp8k7P/319jQhRGFrlUbjv+ekrHLZ8TxZGU0/D8w3?=
 =?iso-8859-1?Q?qvW/CvxKTZJ9qPW5VzKew8MVAvihHszAEJbOfFbAdbOs0hcrq6PTQi418J?=
 =?iso-8859-1?Q?f3scJ+YBB1iTv37YJT9uc1Z1QQJ5C2S3kwlJo6VCySSl4QLLzXVZ31K4uA?=
 =?iso-8859-1?Q?e83QU8r1Vbo5ywlg1rUkmnM57sEJd41/nhFstnD9Uo1qIuhfC/oBrSoffb?=
 =?iso-8859-1?Q?zTL6LmLgqP5Nnk6ko3GZ1i6u1iMZTT8sUXjSJQaxVSGifyIB3HzpFtrhAd?=
 =?iso-8859-1?Q?ePCvVIFBRmQCF00HddcSp5jah70/pa/hXsLGzLgLh+DkvA9gJjmrsq9esE?=
 =?iso-8859-1?Q?18E9uYl6GKETztyC5jLU1cEWKnLABRymMQujJn9u0YICZ3RLm3NZIf8EXQ?=
 =?iso-8859-1?Q?TSLSmOAOhJCQPEzasNqpx/YDMZVnXxtGZFQ8VRRruv7hORNty+rsSCJodl?=
 =?iso-8859-1?Q?3hLjFwKO3U9KqM4W5bmYDl92D0rL+BX1UhGukjRurytU8f5DTQmemDrbAJ?=
 =?iso-8859-1?Q?SssHf/8T2gLR+Zp1QM22pwShkLHoiIz5eyfsa8Z/1hijXOml1RsD7F0r6g?=
 =?iso-8859-1?Q?VoFI9maoO/ydpku4I0n0EKSsDUVC9yS48CQLLjqIYFYYUqdVgVmOCgbg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a283e9ac-9b97-4f42-db0d-08dc5394937c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2024 04:14:37.6530 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BI54e08ICryXOQPL775y1VrTjgLcL+uoiSmU8yLZxaF1j+I8jXB0l6Ou7SARSsbOrcQuhxWEkIMOQqS4b5DrQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8287
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

On Tue, Apr 02, 2024 at 09:54:50PM -0600, Zeng, Oak wrote:
> Hi Matt,
> 
> For the comments to the static function, I prefer to keep it. It always helpful to have a comments.
> 
> I agree most of the comments, except the mmap lock one. See inline
> 
> Also answered a question.
> 
> > -----Original Message-----
> > From: Brost, Matthew <matthew.brost@intel.com>
> > Sent: Tuesday, April 2, 2024 11:04 PM
> > To: Zeng, Oak <oak.zeng@intel.com>
> > Cc: intel-xe@lists.freedesktop.org; Hellstrom, Thomas
> > <thomas.hellstrom@intel.com>; Welty, Brian <brian.welty@intel.com>; Ghimiray,
> > Himal Prasad <himal.prasad.ghimiray@intel.com>
> > Subject: Re: [PATCH 1/3] drm/xe: Introduce helper to populate userptr
> > 
> > On Thu, Mar 21, 2024 at 11:55:18PM -0400, Oak Zeng wrote:
> > > Introduce a helper function xe_userptr_populate_range to populate
> > > a a userptr range. This functions calls hmm_range_fault to read
> > > CPU page tables and populate all pfns/pages of this virtual address
> > > range.
> > >
> > > If the populated page is system memory page, dma-mapping is performed
> > > to get a dma-address which can be used later for GPU to access pages.
> > >
> > > If the populated page is device private page, we calculate the dpa (
> > > device physical address) of the page. This will be handled in future
> > > patches.
> > >
> > > The dma-address or dpa is then saved in userptr's sg table. This is
> > > prepare work to replace the get_user_pages_fast code in userptr code
> > > path.
> > >
> > > v1: Address review comments:
> > >     separate a npage_in_range function (Matt)
> > >     reparameterize function xe_userptr_populate_range function (Matt)
> > >     move mmu_interval_read_begin() call into while loop (Thomas)
> > >     s/mark_range_accessed/xe_mark_range_accessed (Thomas)
> > >     use set_page_dirty_lock (vs set_page_dirty) (Thomas)
> > >     move a few checking in xe_vma_userptr_pin_pages to hmm.c (Matt)
> > > v2: Remove device private page support. Only support system
> > >     pages for now. use dma-map-sg rather than dma-map-page (Matt/Thomas)
> > >
> > > Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> > > Co-developed-by: Niranjana Vishwanathapura
> > <niranjana.vishwanathapura@intel.com>
> > > Signed-off-by: Niranjana Vishwanathapura
> > <niranjana.vishwanathapura@intel.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Cc: Thomas Hellström <thomas.hellstrom@intel.com>
> > > Cc: Brian Welty <brian.welty@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/Kconfig  |   1 +
> > >  drivers/gpu/drm/xe/Makefile |   2 +
> > >  drivers/gpu/drm/xe/xe_hmm.c | 224
> > ++++++++++++++++++++++++++++++++++++
> > >  drivers/gpu/drm/xe/xe_hmm.h |  17 +++
> > >  4 files changed, 244 insertions(+)
> > >  create mode 100644 drivers/gpu/drm/xe/xe_hmm.c
> > >  create mode 100644 drivers/gpu/drm/xe/xe_hmm.h
> > >
> > > diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> > > index 1a556d087e63..449a1ecbc92a 100644
> > > --- a/drivers/gpu/drm/xe/Kconfig
> > > +++ b/drivers/gpu/drm/xe/Kconfig
> > > @@ -41,6 +41,7 @@ config DRM_XE
> > >  	select MMU_NOTIFIER
> > >  	select WANT_DEV_COREDUMP
> > >  	select AUXILIARY_BUS
> > > +	select HMM_MIRROR
> > >  	help
> > >  	  Experimental driver for Intel Xe series GPUs
> > >
> > > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > > index 3c3e67885559..a805a543056d 100644
> > > --- a/drivers/gpu/drm/xe/Makefile
> > > +++ b/drivers/gpu/drm/xe/Makefile
> > > @@ -145,6 +145,8 @@ xe-y += xe_bb.o \
> > >  	xe_wa.o \
> > >  	xe_wopcm.o
> > >
> > > +xe-$(CONFIG_HMM_MIRROR) += xe_hmm.o
> > > +
> > >  # graphics hardware monitoring (HWMON) support
> > >  xe-$(CONFIG_HWMON) += xe_hwmon.o
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_hmm.c b/drivers/gpu/drm/xe/xe_hmm.c
> > > new file mode 100644
> > > index 000000000000..4011207630a5
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/xe/xe_hmm.c
> > > @@ -0,0 +1,224 @@
> > > +// SPDX-License-Identifier: MIT
> > > +/*
> > > + * Copyright © 2024 Intel Corporation
> > > + */
> > > +
> > > +#include <linux/mmu_notifier.h>
> > > +#include <linux/dma-mapping.h>
> > > +#include <linux/memremap.h>
> > > +#include <linux/swap.h>
> > > +#include <linux/hmm.h>
> > > +#include <linux/mm.h>
> > > +#include "xe_hmm.h"
> > > +#include "xe_vm.h"
> > > +#include "xe_bo.h"
> > > +
> > > +static u64 xe_npages_in_range(unsigned long start, unsigned long end)
> > > +{
> > > +	return (PAGE_ALIGN(end) - PAGE_ALIGN_DOWN(start)) >> PAGE_SHIFT;
> > 
> > Nit: start and end should always be page aligned.
> > 
> > > +}
> > > +
> > > +/**
> > > + * xe_mark_range_accessed() - mark a range is accessed, so core mm
> > > + * have such information for memory eviction or write back to
> > > + * hard disk
> > > + *
> > > + * @range: the range to mark
> > > + * @write: if write to this range, we mark pages in this range
> > > + * as dirty
> > > + */
> > 
> > Doesn't hurt but kernel doc is not required for static functions.
> > 
> > > +static void xe_mark_range_accessed(struct hmm_range *range, bool write)
> > > +{
> > > +	struct page *page;
> > > +	u64 i, npages;
> > > +
> > > +	npages = xe_npages_in_range(range->start, range->end);
> > > +	for (i = 0; i < npages; i++) {
> > > +		page = hmm_pfn_to_page(range->hmm_pfns[i]);
> > > +		if (write)
> > > +			set_page_dirty_lock(page);
> > > +
> > > +		mark_page_accessed(page);
> > > +	}
> > > +}
> > > +
> > > +/**
> > > + * xe_build_sg() - build a scatter gather table for all the physical pages/pfn
> > > + * in a hmm_range. dma-map pages if necessary. dma-address is save in sg
> > table
> > > + * and will be used to program GPU page table later.
> > > + *
> > > + * @xe: the xe device who will access the dma-address in sg table
> > > + * @range: the hmm range that we build the sg table from. range-
> > >hmm_pfns[]
> > > + * has the pfn numbers of pages that back up this hmm address range.
> > > + * @st: pointer to the sg table.
> > > + * @write: whether we write to this range. This decides dma map direction
> > > + * for system pages. If write we map it bi-diretional; otherwise
> > > + * DMA_TO_DEVICE
> > > + *
> > > + * All the contiguous pfns will be collapsed into one entry in
> > > + * the scatter gather table. This is for the purpose of efficiently
> > > + * programming GPU page table.
> > > + *
> > > + * The dma_address in the sg table will later be used by GPU to
> > > + * access memory. So if the memory is system memory, we need to
> > > + * do a dma-mapping so it can be accessed by GPU/DMA.
> > > + *
> > > + * FIXME: This function currently only support pages in system
> > > + * memory. If the memory is GPU local memory (of the GPU who
> > > + * is going to access memory), we need gpu dpa (device physical
> > > + * address), and there is no need of dma-mapping. This is TBD.
> > > + *
> > > + * FIXME: dma-mapping for peer gpu device to access remote gpu's
> > > + * memory. Add this when you support p2p
> > > + *
> > > + * This function allocates the storage of the sg table. It is
> > > + * caller's responsibility to free it calling sg_free_table.
> > > + *
> > > + * Returns 0 if successful; -ENOMEM if fails to allocate memory
> > > + */
> > 
> > Kinda verbose given a static function but guess that is ok.
> > 
> > > +static int xe_build_sg(struct xe_device *xe, struct hmm_range *range,
> > > +			     struct sg_table *st, bool write)
> > 
> > Weird indentation, use look at checkpatch.
> > 
> > > +{
> > > +	struct device *dev = xe->drm.dev;
> > > +	struct page **pages;
> > > +	u64 i, npages;
> > > +	int ret;
> > > +
> > > +	npages = xe_npages_in_range(range->start, range->end);
> > > +	pages = kvmalloc_array(npages, sizeof(*pages), GFP_KERNEL);
> > > +	if (!pages)
> > > +		return -ENOMEM;
> > > +
> > > +	for (i = 0; i < npages; i++) {
> > > +		pages[i] = hmm_pfn_to_page(range->hmm_pfns[i]);
> > > +		xe_assert(xe, !is_device_private_page(pages[i]));
> > > +	}
> > > +
> > > +	ret = sg_alloc_table_from_pages_segment(st, pages, npages, 0,
> > > +			npages << PAGE_SHIFT, xe_sg_segment_size(dev),
> > GFP_KERNEL);
> > 
> > Weird indentation here too.
> > 
> > 
> > 
> > > +	if (ret)
> > > +		goto free_pages;
> > > +
> > > +	ret = dma_map_sgtable(dev, st, write ? DMA_BIDIRECTIONAL :
> > DMA_TO_DEVICE,
> > > +			DMA_ATTR_SKIP_CPU_SYNC |
> > DMA_ATTR_NO_KERNEL_MAPPING);
> > > +
> > > +free_pages:
> > 
> > The SG table isn't free'd if dma_map_sgtable fails.
> > 
> > > +	kvfree(pages);
> > > +	return ret;
> > > +}
> > > +
> > > +/**
> > > + * xe_userptr_populate_range() - Populate physical pages of a virtual
> > > + * address range
> > > + *
> > > + * @uvma: userptr vma which has information of the range to populate.
> > > + *
> > > + * This function populate the physical pages of a virtual
> > > + * address range. The populated physical pages is saved in
> > > + * userptr's sg table. It is similar to get_user_pages but call
> > > + * hmm_range_fault.
> > > + *
> > > + * This function also read mmu notifier sequence # (
> > > + * mmu_interval_read_begin), for the purpose of later
> > > + * comparison (through mmu_interval_read_retry).
> > > + *
> > > + * This must be called with mmap read or write lock held.
> > > + *
> > > + * This function allocates the storage of the userptr sg table.
> > > + * It is caller's responsibility to free it calling sg_free_table.
> > > + *
> > > + * returns: 0 for succuss; negative error no on failure
> > > + */
> > > +int xe_userptr_populate_range(struct xe_userptr_vma *uvma)
> > 
> > See my comments about arguments in previous rev. Still would raather
> > have this layer accept arguments from xe_userptr_vma rather than that
> > struct but can live with xe_userptr_vma as an argument I suppose.
> > 
> > But s/xe_userptr_populate_range/xe_hmm_userptr_populate_range/ given
> > that this is file xe_hmm.c - exported functions should try to have the
> > 'xe_hmm' prefix.
> > 
> > > +{
> > > +	unsigned long timeout =
> > > +		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
> > > +	unsigned long *pfns, flags = HMM_PFN_REQ_FAULT;
> > > +	struct xe_userptr *userptr;
> > > +	struct xe_vma *vma = &uvma->vma;
> > > +	u64 start = xe_vma_userptr(vma);
> > > +	u64 end = start + xe_vma_size(vma);
> > > +	struct xe_vm *vm = xe_vma_vm(vma);
> > > +	struct hmm_range hmm_range;
> > > +	bool write = !xe_vma_read_only(vma);
> > > +	bool in_kthread = !current->mm;
> > > +	unsigned long notifier_seq;
> > > +	u64 npages;
> > > +	int ret;
> > > +
> > > +	userptr = &uvma->userptr;
> > > +	mmap_assert_locked(userptr->notifier.mm);
> > 
> > See my comments about locking in an eariler rev, while it may be true
> > the system allocator code has to call this function with mmap locked it
> > certainly non-system allocator code does not.
> 
> In the original non-system allocator codes, the mmap lock is just embedded in the get_user_page function. So they do have mmap lock.
> 

Yes, so that aligns with grabbing / releasing the lock directly before /
after hmm_range_fault. General a good practice hold a lock for a little
period of time as possible. This especially is true for a widly used
lock like mmap lock.

> Or do you see a problem to ask caller to hold mmap lock? This scheme is suggested by hmm design document. It works for both userptr and hmmptr. I don't see an obvious problem.
>

Not a problem, just see above. For non-system allocator code the lock
only needs to held around the hmm_range_fault call. This lock might need
to held longer in the system allocator prevent races between a CPU fault
and a GPU fault. If that is needed, see my suggestion about a locked
version or argument for this function.

Matt

> Oak
> 
> 
> 
>  I'd rather move the mmap
> > lock around the hmm_range_fault call for now. If the system allocator
> > needs to hold mmap, probably add locked argument (or *_locked) function
> > with the proper lockdep asserts / do not take mmap lock around
> > hmm_range_fault.
> > 
> > > +
> > > +	if (vma->gpuva.flags & XE_VMA_DESTROYED)
> > > +		return 0;
> > > +
> > > +	notifier_seq = mmu_interval_read_begin(&userptr->notifier);
> > > +	if (notifier_seq == userptr->notifier_seq)
> > > +		return 0;
> > > +
> > > +	npages = xe_npages_in_range(start, end);
> > > +	pfns = kvmalloc_array(npages, sizeof(*pfns), GFP_KERNEL);
> > > +	if (unlikely(!pfns))
> > > +		return -ENOMEM;
> > > +
> > > +	if (write)
> > > +		flags |= HMM_PFN_REQ_WRITE;
> > > +
> > > +	if (in_kthread) {
> > > +		if (!mmget_not_zero(userptr->notifier.mm)) {
> > > +			ret = -EFAULT;
> > > +			goto free_pfns;
> > > +		}
> > > +		kthread_use_mm(userptr->notifier.mm);
> > 
> > I think this can actually be dropped as hmm_range_fault takes the
> > notifier (and the MM) as an argument. Do you want to test this out?
> > 
> > If we can drop kthread_use_mm, we blindly (no kthread test) probably
> > just call mmget_not_zero.
> > 
> > > +	}
> > > +
> > > +	memset64((u64 *)pfns, (u64)flags, npages);
> > 
> > See my comment in an ealier rev about using default flags. Still valid.
> > 
> > > +	hmm_range.hmm_pfns = pfns;
> > > +	hmm_range.notifier = &userptr->notifier;
> > > +	hmm_range.start = start;
> > > +	hmm_range.end = end;
> > > +	hmm_range.pfn_flags_mask = HMM_PFN_REQ_FAULT |
> > HMM_PFN_REQ_WRITE;
> > > +	/**
> > > +	 * FIXME:
> > > +	 * Set the dev_private_owner can prevent hmm_range_fault to fault
> > > +	 * in the device private pages owned by caller. See function
> > > +	 * hmm_vma_handle_pte. In multiple GPU case, this should be set to the
> > > +	 * device owner of the best migration destination. e.g., device0/vm0
> > > +	 * has a page fault, but we have determined the best placement of
> > > +	 * the fault address should be on device1, we should set below to
> > > +	 * device1 instead of device0.
> > > +	 */
> > 
> > I'd drop this FIXME, I prefer not to predict the future in comments.
> > 
> > > +	hmm_range.dev_private_owner = vm->xe;
> > > +
> > 
> > Longterm, probably a helper to derive private owner. Likely just
> > something like:
> > 
> > xe_dev_private_owner(xe)
> > 	return xe
> > 
> > But it help avoid bugs setting the private owner to the wrong value in
> > various places.
> > 
> > > +	while (true) {
> > > +		hmm_range.notifier_seq = mmu_interval_read_begin(&userptr-
> > >notifier);
> > 
> > We set hmm_range.notifier_seq above... maybe set this after if (ret ==-EBUSY)
> > 
> > Again see my comment about locking.
> > 
> > > +		ret = hmm_range_fault(&hmm_range);
> > > +		if (time_after(jiffies, timeout))
> > > +			break;
> > 
> > Maybe also move this under the if (ret ==-EBUSY) logic too.
> > 
> > > +
> > > +		if (ret == -EBUSY)
> > > +			continue;
> > > +		break;
> > > +	}
> > > +
> > > +	if (in_kthread) {
> > > +		kthread_unuse_mm(userptr->notifier.mm);
> > > +		mmput(userptr->notifier.mm);
> > 
> > See comment above about kthread_unuse_mm.
> > 
> > > +	}
> > > +
> > > +	if (ret)
> > > +		goto free_pfns;
> > > +
> > > +	ret = xe_build_sg(vm->xe, &hmm_range, &userptr->sgt, write);
> > > +	if (ret)
> > > +		goto free_pfns;
> > > +
> > > +	xe_mark_range_accessed(&hmm_range, write);
> > > +	userptr->sg = &userptr->sgt;
> > > +	userptr->notifier_seq = hmm_range.notifier_seq;
> > > +
> > > +free_pfns:
> > > +	kvfree(pfns);
> > > +	return ret;
> > > +}
> > > +
> > > diff --git a/drivers/gpu/drm/xe/xe_hmm.h b/drivers/gpu/drm/xe/xe_hmm.h
> > > new file mode 100644
> > > index 000000000000..91686a751711
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/xe/xe_hmm.h
> > > @@ -0,0 +1,17 @@
> > > +// SPDX-License-Identifier: MIT
> > > +/*
> > > + * Copyright © 2024 Intel Corporation
> > > + */
> > > +
> > > +#include <linux/types.h>
> > > +
> > > +struct xe_userptr_vma;
> > > +
> > > +#if IS_ENABLED(CONFIG_HMM_MIRROR)
> > 
> > Do we need this? Don't we just require CONFIG_HMM_MIRROR to build our
> > driver?
> 
> Yes we need this. Our driver/userptr should build even if HMM_MIRROR is disabled. I had a build error without this.
> 
> Oak
> 
> 
> > 
> > Matt
> > 
> > > +int xe_userptr_populate_range(struct xe_userptr_vma *uvma);
> > > +#else
> > > +static inline int xe_userptr_populate_range(struct xe_userptr_vma *uvma)
> > > +{
> > > +	return -ENODEV;
> > > +}
> > > +#endif
> > > --
> > > 2.26.3
> > >
