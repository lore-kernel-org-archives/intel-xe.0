Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B125C27C4F
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jun 2024 19:28:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8B6810E08C;
	Wed, 26 Jun 2024 19:28:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZRTv1md4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D3D310E08C
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jun 2024 19:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719430107; x=1750966107;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=e0zgR4YfY9fF9a8mNL9e3YaRGB4ew7D98NxKYXlGGQY=;
 b=ZRTv1md4Sw63JH0EPyIGVnoxYhqA6jXHapW2anN/uBarxZ9qhVE2Rjun
 fnEg66Yp0pPeoBNjPBr06KWiw6aiFpCkJOSgfGP3uwoLJCNRSoiptkAHC
 2aqOupIvRnLIAqskk6lAN81KuAloOFQxrHk3kfgwsmi8J3QiOOH8Lh0EJ
 d0chA5kzOYNJK6wmRJa4UaeWRmsfYKcX0hs9GCyY/vWw67dr5Tb26M2Yh
 U9UuJpazz0cxeW/Iq7BLhzzGfOTE1ojMCliPPLxpUmBNzu5CByQk5RHrx
 ahKf3Zo8arPHhOr5mLNyi7HyC1Fa6CEFrJMOzlrMFzPg29k6mx/kSo3WZ Q==;
X-CSE-ConnectionGUID: cPn/IjUqSHq+KtjxS4E+og==
X-CSE-MsgGUID: r7lMVKnbSyKNfaCb3R5jWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="27662335"
X-IronPort-AV: E=Sophos;i="6.08,267,1712646000"; d="scan'208";a="27662335"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 12:28:27 -0700
X-CSE-ConnectionGUID: flEwj8xHRY+G5IoQMhBfIg==
X-CSE-MsgGUID: lPiFkireSGqVhJ1jFn7Qig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,267,1712646000"; d="scan'208";a="43990257"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jun 2024 12:28:26 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 26 Jun 2024 12:28:26 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 26 Jun 2024 12:28:26 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 26 Jun 2024 12:28:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ub03l8X3emS4zYDM9Kd+rk/nNkvVJFEbMorh8PouC5x1+QcRFG2ObUC9Og7pSy6pzVue9sFZUL43RnysHchVLnTiCCmOU0IDHXJME2LZHjT7UiCICuLKuUKWMux9QmL808PuTeV9xjmEIECWL08M1o36IUrB6CNs8s4JbyIGk5PPT4/LEt2agBGTVGEKx7EzXbai940inuk8TCHmxuEcrrAZ/K3nE7aR/V3beRORQSHEVc6W0/bcA9CV5R8tWTgbaPqIcitFOFylSEg69w+GeVa5xHXGXro+FgCnq1B4iVIhjaf83l2PtKLQugvx6ySfRejY2ZY5YfZDkxgqDll+xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f59MRB/YO6KBoiZrNXiNADjVVN86eI8OVSWh13s0f44=;
 b=VorOR1jbUk0ymc8gOan+S7FEdIZOiCQRroRMyEus7IrIJYoqSJJ2rTivhBnNO2JCY7KKDPjhysaGN98LDoqsIWbcd+qMCvIhhZ94/+YDwukaqSAgNRdDD3mCSjGZY41rVG0vazcfzGSuLOHwD+yhxPy7RT9P1kTNZQhgM8Zi0lS4fok9lbSDWVn7m3FYdMHlB/EH/xusSFHe0VwsSor3I2HM6DgNA/Vwd4CLUuJW00ArbKfaCzMi0YvBSVguDKTk3KDfX2fGd1wdin72hMQRt47KIC9XycKGUCPKiU2H1ayZanT69I5obtsa40PqEDfI+/SaV/+svU7y+yty4KEhTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by PH7PR11MB6554.namprd11.prod.outlook.com (2603:10b6:510:1a8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Wed, 26 Jun
 2024 19:28:22 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.7698.025; Wed, 26 Jun 2024
 19:28:22 +0000
Date: Wed, 26 Jun 2024 19:27:43 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v5 4/7] drm/xe: Convert multiple bind ops into single job
Message-ID: <ZnxrrwN5Hr9MeRqU@DUT025-TGLU.fm.intel.com>
References: <20240626003920.4060633-1-matthew.brost@intel.com>
 <20240626003920.4060633-5-matthew.brost@intel.com>
 <6dc343ad-bd46-4402-bd0a-00ed2b366e7c@intel.com>
 <Znw+Ar2ZBt+3SaQu@DUT025-TGLU.fm.intel.com>
 <8f7de441-bd7e-44d9-8183-d688d14139f5@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8f7de441-bd7e-44d9-8183-d688d14139f5@intel.com>
X-ClientProxiedBy: SJ0PR13CA0108.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::23) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|PH7PR11MB6554:EE_
X-MS-Office365-Filtering-Correlation-Id: cb5b2acb-7bbc-4b44-cb6d-08dc96162424
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230038|376012|1800799022|366014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?o3FRkSnUb4qjZR/qdOtVAj8310Hh5zOZkkKvkWYaToyj9qRWFpEDm1PNZ4?=
 =?iso-8859-1?Q?xOo5mXvhx21XkY82vu2aUpllDlw7nExfUdzOE6RIWAGIzkDX5Ne8ZIyPUu?=
 =?iso-8859-1?Q?MN9+rgOhKC9FFV10hZ3G4cOMu6owZ1s58gTEj/wWJRuNpNBodgnjU3lCmX?=
 =?iso-8859-1?Q?ruXSlb3RKjOWFk2Y8ObO5YWXSrI2lYS53M+0nErXtJXzg/069in9btc5Tk?=
 =?iso-8859-1?Q?saNtLZZSCVnqz+3zDjpleLumKpDx5zS2T7PzvpkXnSpK7VXUZ8hXhBpAxB?=
 =?iso-8859-1?Q?Kx3kXyPlBKyt0GuQWruhhRUJspwIIrFuj90GNck6vUNcQ7T2SVK0oKO5Gx?=
 =?iso-8859-1?Q?YeX/ofI3cFg5oyvccGKfYRPVerysybkbkueFoODOSYxfAN2FQuEI/5jLY/?=
 =?iso-8859-1?Q?oe1x6B6GQJ9trWfLiois1Cvq0eikUH6kkRKw5LhKuiyRNu8uTlA4U18j//?=
 =?iso-8859-1?Q?LA5FU0rtfEaObkabWGdb43cvB3Q/DEIfRLJlEJUWK5dOmH6hrPkWNYoZek?=
 =?iso-8859-1?Q?L93Pgwzc2vOGKIhoMDTnavIybWlWOv/HlKz1AQC+ctST/2w8BF5lU2CSWB?=
 =?iso-8859-1?Q?qSCuJ4uL9pqCjwiSJeb3t0K2TR8ZTFTSQiOpPPoZ6cawaiHyKcL4SYW7Bs?=
 =?iso-8859-1?Q?76o0p/Ba/ha84+ncJ+Vx/kkcOouPjCuahvIUxJNMxWPl/Qk7Q8KwYS7Ybr?=
 =?iso-8859-1?Q?h7NdC08JEcMhAq7gxLSrA+ppFtbq0Nr4+lRQXmGr3URiDTn3UkxkmDut/P?=
 =?iso-8859-1?Q?wWHSFKI8+BTEBFUsaBaDCVf5LPJ7Bp3A4L2SUQTbX0CVMNTcigKDjCsqwQ?=
 =?iso-8859-1?Q?/uUmHaMFIqxXzo5AAhWWNruphW86hfReu92GGmU2WIvpXMYvduD3oZoUkf?=
 =?iso-8859-1?Q?No1NC9SgSaCCCMVJ6pC2cFASu0pIuk8M0FEu+Q7l8yDQxbxI+9PqEAeHic?=
 =?iso-8859-1?Q?fzqY+AALhv6g2FBBS3rGPNhoUN9BxupjsemtW1TjfdyInHTq89rqTAHZxl?=
 =?iso-8859-1?Q?XZW25+KPLci1IuDTxoUAixlZTNWm+3oColdDKhPL018d18zUBF+QQhTl9h?=
 =?iso-8859-1?Q?dHnhXanYo4A+0sUq9uYpOcty7Xvc3BOKL32jvMSwBiCt0BPhjy+FBoP8E/?=
 =?iso-8859-1?Q?MbeHkFVYH1zo9nlKa1Q6yCDJ8rv/QYTvTJToxI26Wz0ghUW6jDjB5sGvcA?=
 =?iso-8859-1?Q?YreIou5i+3tNcHE+ykZ2Eh9GarcVfhvJRxBZb28/yqclg54nYi59/5dA9K?=
 =?iso-8859-1?Q?iNNOzNHKm7CnOhdJIlr/82R/QR5WCot5akB5J4vBEFaBF7TFxGhkrqgILk?=
 =?iso-8859-1?Q?bgL6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230038)(376012)(1800799022)(366014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?6iv73zh8XIpt+daxQFOxN+SbeEkgoMW0mcrP5lbaAXCGM6N88Vi0JhWMUa?=
 =?iso-8859-1?Q?lJrN73pmQ2ypjtYSSFpga36xwXKoZ3t0H4e2kaJTX+hsUilGbStvTKwMbz?=
 =?iso-8859-1?Q?fjTxnCleo00WHfmwXhivx7EbdM500dzwhGFMA2uwagoDnVCSThmrWG0u+/?=
 =?iso-8859-1?Q?kWbOHxR/UoToYeDAbjWhYwaK4OQ5SrvK/0OD41Kpq6oyIvles4RiZJKxSQ?=
 =?iso-8859-1?Q?GEmq2/LU3HJaRX7HrqH71H1/lvnKPVIKYejYBU2agAIGdDVkN35RP4SfMz?=
 =?iso-8859-1?Q?F9grAVLl2FvQ6nEosbyCUYcgyIJHTdUyjeq3fBQZajBYt4zprq943Tk6TK?=
 =?iso-8859-1?Q?gyYI0f08UhuLwtsKKbT1Z0sRYmk7GQPno+N5uHPIJA5whkjea/Z06Xq9J7?=
 =?iso-8859-1?Q?ago18SZ/DDdxRQI2bXW3TKWyV07ckog2KzMMWFoUXlPikoFruL3XIuqo6/?=
 =?iso-8859-1?Q?V8B9vFIVVm/UdsKL/QGl4kB8uMDGurUv56LLC0v1SBw9ZUQ5y1YhIZ+R2I?=
 =?iso-8859-1?Q?vThoye4Nq+geM/zcZ0cJEu+FIcYp/tkbX+jzIwLNkQi+kk0lvK4gZBvimi?=
 =?iso-8859-1?Q?KsdfM3ihQ4u1ZL4nxQFq42f2F8r+/AHYtFjG4oHjBELC5j8oj5J0csDAxO?=
 =?iso-8859-1?Q?NQcpD/QziKdlR0BkT4xjo3suufqV6NrGx7a4+n9n+DV3uhXuNhlH4hKE3A?=
 =?iso-8859-1?Q?zKWbVI0qFkgeUwgKEjVoc3Gvjkr5/4QquW6SkNTaV7IIYEM625zlql7WlC?=
 =?iso-8859-1?Q?iZaUgbrodz9G+v6N0OF6JJdtn+sicLRFLInu8cYHxghpxyQiQG4UpaV3jk?=
 =?iso-8859-1?Q?Vf9nOPfajm/gdxJoULLN/yDkgNoM+rYQ/4MFQg6gkNRjmDi79SUmfj0nrK?=
 =?iso-8859-1?Q?VvmTnJfiZxkj3cIMfmIeghtqDUOpXuqf9T5TQLA/kq5+wOyxRoFvEeRSHp?=
 =?iso-8859-1?Q?haTMGAI/XLpTdW1gTHjr4Ol6NM6GyKIRsbvPHEWTsux1R5Q7biPaLGiHtA?=
 =?iso-8859-1?Q?sNpSRTELBbDP86D2sR8N9ROK+MAGdfQUz+QCnRJHjIK3ggoydcH0TCOATq?=
 =?iso-8859-1?Q?4/rUeaiHjsl1DYF68qyjhoAvRfyU7YVEDmHgFO76lXCysHHWb1rAxt9hyb?=
 =?iso-8859-1?Q?28ex170sIBwxkuBx6cX0aCx5E5vEpt1hIT/x2M68f3CXihqGKRh43v8RNL?=
 =?iso-8859-1?Q?VMbvJZtZxq01W7Ps/+GDvM5Z4yoCdAyw0uXZhxtET67RCJNhE4/ZgLlHlT?=
 =?iso-8859-1?Q?2wwaISxBeNnDImU9KH598bGQgQtco537T6odu8S9m1cIyFdnjYYoqU8D2n?=
 =?iso-8859-1?Q?9o0FW/M4yMfLKSV3+e3YaXc9/FUpX7c4/jRTY0gVK6dTkR+EtxcLhErIhE?=
 =?iso-8859-1?Q?lUQQROu/kHXAuJmra/UW1n7VU7kB81HSMoXjM62GHkNuVjmPzWXHepyL2s?=
 =?iso-8859-1?Q?VKfoe52kMJ1aLUYnm1iEeE0+RwG/x/qC9jJDNBMjTNhY0U/oo9LKGNV3Lh?=
 =?iso-8859-1?Q?HrvETvjsNjxMFA2QUR64p1F/ch09gJU/OG0pWD6wGOVo2H+Y+2iPAd1iYK?=
 =?iso-8859-1?Q?VQ/wOVKh1ibkUKyrq2xMNoABQ4r44eSrfqPe/FwvSbtGLso2JoxrnJTdI5?=
 =?iso-8859-1?Q?Gj1eP4s958ZiP39JL2ZEtSa89FtcJ0zJ8BVuah27SXecbhT4Ejf8MPDQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cb5b2acb-7bbc-4b44-cb6d-08dc96162424
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2024 19:28:22.0801 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jLGogu+KyGG/As2W+AZf2Qohk8qLdPmiuSChSx5d5Bxe6WEdGcNPz617KUtySWSdndQjsG4zs7z4kcaPRQkMlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6554
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

On Wed, Jun 26, 2024 at 05:39:45PM +0100, Matthew Auld wrote:
> On 26/06/2024 17:12, Matthew Brost wrote:
> > On Wed, Jun 26, 2024 at 03:03:41PM +0100, Matthew Auld wrote:
> > > On 26/06/2024 01:39, Matthew Brost wrote:
> > > > This aligns with the uAPI of an array of binds or single bind that
> > > > results in multiple GPUVA ops to be considered a single atomic
> > > > operations.
> > > > 
> > > > The implemenation is roughly:
> > > > - xe_vma_ops is a list of xe_vma_op (GPUVA op)
> > > > - each xe_vma_op resolves to 0-3 PT ops
> > > > - xe_vma_ops creates a single job
> > > > - if at any point during binding a failure occurs, xe_vma_ops contains
> > > >     the information necessary unwind the PT and VMA (GPUVA) state
> > > > 
> > > > v2:
> > > >    - add missing dma-resv slot reservation (CI, testing)
> > > > v4:
> > > >    - Fix TLB invalidation (Paulo)
> > > >    - Add missing xe_sched_job_last_fence_add/test_dep check (Inspection)
> > > > v5:
> > > >    - Invert i, j usage (Matthew Auld)
> > > >    - Add helper to test and add job dep (Matthew Auld)
> > > >    - Return on anything but -ETIME for cpu bind (Matthew Auld)
> > > >    - Return -ENOBUFS if suballoc of BB fails due to size (Matthew Auld)
> > > >    - s/do/Do (Matthew Auld)
> > > >    - Add missing comma (Matthew Auld)
> > > >    - Do not assign return value to xe_range_fence_insert (Matthew Auld)
> > > > 
> > > > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > ---
> > > >    drivers/gpu/drm/xe/xe_bo_types.h |    2 +
> > > >    drivers/gpu/drm/xe/xe_migrate.c  |  306 ++++-----
> > > >    drivers/gpu/drm/xe/xe_migrate.h  |   32 +-
> > > >    drivers/gpu/drm/xe/xe_pt.c       | 1102 +++++++++++++++++++-----------
> > > >    drivers/gpu/drm/xe/xe_pt.h       |   14 +-
> > > >    drivers/gpu/drm/xe/xe_pt_types.h |   36 +
> > > >    drivers/gpu/drm/xe/xe_vm.c       |  519 +++-----------
> > > >    drivers/gpu/drm/xe/xe_vm.h       |    2 +
> > > >    drivers/gpu/drm/xe/xe_vm_types.h |   45 +-
> > > >    9 files changed, 1036 insertions(+), 1022 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
> > > > index 86422e113d39..02d68873558a 100644
> > > > --- a/drivers/gpu/drm/xe/xe_bo_types.h
> > > > +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> > > > @@ -58,6 +58,8 @@ struct xe_bo {
> > > >    #endif
> > > >    	/** @freed: List node for delayed put. */
> > > >    	struct llist_node freed;
> > > > +	/** @update_index: Update index if PT BO */
> > > > +	int update_index;
> > > >    	/** @created: Whether the bo has passed initial creation */
> > > >    	bool created;
> > > > diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> > > > index af62783d34ac..160bfcd510ae 100644
> > > > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > > > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > > > @@ -1125,6 +1125,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
> > > >    }
> > > >    static void write_pgtable(struct xe_tile *tile, struct xe_bb *bb, u64 ppgtt_ofs,
> > > > +			  const struct xe_vm_pgtable_update_op *pt_op,
> > > >    			  const struct xe_vm_pgtable_update *update,
> > > >    			  struct xe_migrate_pt_update *pt_update)
> > > >    {
> > > > @@ -1159,8 +1160,12 @@ static void write_pgtable(struct xe_tile *tile, struct xe_bb *bb, u64 ppgtt_ofs,
> > > >    		bb->cs[bb->len++] = MI_STORE_DATA_IMM | MI_SDI_NUM_QW(chunk);
> > > >    		bb->cs[bb->len++] = lower_32_bits(addr);
> > > >    		bb->cs[bb->len++] = upper_32_bits(addr);
> > > > -		ops->populate(pt_update, tile, NULL, bb->cs + bb->len, ofs, chunk,
> > > > -			      update);
> > > > +		if (pt_op->bind)
> > > > +			ops->populate(pt_update, tile, NULL, bb->cs + bb->len,
> > > > +				      ofs, chunk, update);
> > > > +		else
> > > > +			ops->clear(pt_update, tile, NULL, bb->cs + bb->len,
> > > > +				   ofs, chunk, update);
> > > >    		bb->len += chunk * 2;
> > > >    		ofs += chunk;
> > > > @@ -1185,114 +1190,58 @@ struct migrate_test_params {
> > > >    static struct dma_fence *
> > > >    xe_migrate_update_pgtables_cpu(struct xe_migrate *m,
> > > > -			       struct xe_vm *vm, struct xe_bo *bo,
> > > > -			       const struct  xe_vm_pgtable_update *updates,
> > > > -			       u32 num_updates, bool wait_vm,
> > > >    			       struct xe_migrate_pt_update *pt_update)
> > > >    {
> > > >    	XE_TEST_DECLARE(struct migrate_test_params *test =
> > > >    			to_migrate_test_params
> > > >    			(xe_cur_kunit_priv(XE_TEST_LIVE_MIGRATE));)
> > > >    	const struct xe_migrate_pt_update_ops *ops = pt_update->ops;
> > > > -	struct dma_fence *fence;
> > > > +	struct xe_vm *vm = pt_update->vops->vm;
> > > > +	struct xe_vm_pgtable_update_ops *pt_update_ops =
> > > > +		&pt_update->vops->pt_update_ops[pt_update->tile_id];
> > > >    	int err;
> > > > -	u32 i;
> > > > +	u32 i, j;
> > > >    	if (XE_TEST_ONLY(test && test->force_gpu))
> > > >    		return ERR_PTR(-ETIME);
> > > > -	if (bo && !dma_resv_test_signaled(bo->ttm.base.resv,
> > > > -					  DMA_RESV_USAGE_KERNEL))
> > > > -		return ERR_PTR(-ETIME);
> > > > -
> > > > -	if (wait_vm && !dma_resv_test_signaled(xe_vm_resv(vm),
> > > > -					       DMA_RESV_USAGE_BOOKKEEP))
> > > > -		return ERR_PTR(-ETIME);
> > > > -
> > > >    	if (ops->pre_commit) {
> > > >    		pt_update->job = NULL;
> > > >    		err = ops->pre_commit(pt_update);
> > > >    		if (err)
> > > >    			return ERR_PTR(err);
> > > >    	}
> > > > -	for (i = 0; i < num_updates; i++) {
> > > > -		const struct xe_vm_pgtable_update *update = &updates[i];
> > > > -
> > > > -		ops->populate(pt_update, m->tile, &update->pt_bo->vmap, NULL,
> > > > -			      update->ofs, update->qwords, update);
> > > > -	}
> > > > -
> > > > -	if (vm) {
> > > > -		trace_xe_vm_cpu_bind(vm);
> > > > -		xe_device_wmb(vm->xe);
> > > > -	}
> > > > -
> > > > -	fence = dma_fence_get_stub();
> > > > -
> > > > -	return fence;
> > > > -}
> > > > -
> > > > -static bool no_in_syncs(struct xe_vm *vm, struct xe_exec_queue *q,
> > > > -			struct xe_sync_entry *syncs, u32 num_syncs)
> > > > -{
> > > > -	struct dma_fence *fence;
> > > > -	int i;
> > > > -	for (i = 0; i < num_syncs; i++) {
> > > > -		fence = syncs[i].fence;
> > > > -
> > > > -		if (fence && !test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
> > > > -				       &fence->flags))
> > > > -			return false;
> > > > -	}
> > > > -	if (q) {
> > > > -		fence = xe_exec_queue_last_fence_get(q, vm);
> > > > -		if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags)) {
> > > > -			dma_fence_put(fence);
> > > > -			return false;
> > > > +	for (i = 0; i < pt_update_ops->num_ops; ++i) {
> > > > +		const struct xe_vm_pgtable_update_op *pt_op =
> > > > +			&pt_update_ops->ops[i];
> > > > +
> > > > +		for (j = 0; j < pt_op->num_entries; j++) {
> > > > +			const struct xe_vm_pgtable_update *update =
> > > > +				&pt_op->entries[j];
> > > > +
> > > > +			if (pt_op->bind)
> > > > +				ops->populate(pt_update, m->tile,
> > > > +					      &update->pt_bo->vmap, NULL,
> > > > +					      update->ofs, update->qwords,
> > > > +					      update);
> > > > +			else
> > > > +				ops->clear(pt_update, m->tile,
> > > > +					   &update->pt_bo->vmap, NULL,
> > > > +					   update->ofs, update->qwords, update);
> > > >    		}
> > > > -		dma_fence_put(fence);
> > > >    	}
> > > > -	return true;
> > > > +	trace_xe_vm_cpu_bind(vm);
> > > > +	xe_device_wmb(vm->xe);
> > > > +
> > > > +	return dma_fence_get_stub();
> > > >    }
> > > > -/**
> > > > - * xe_migrate_update_pgtables() - Pipelined page-table update
> > > > - * @m: The migrate context.
> > > > - * @vm: The vm we'll be updating.
> > > > - * @bo: The bo whose dma-resv we will await before updating, or NULL if userptr.
> > > > - * @q: The exec queue to be used for the update or NULL if the default
> > > > - * migration engine is to be used.
> > > > - * @updates: An array of update descriptors.
> > > > - * @num_updates: Number of descriptors in @updates.
> > > > - * @syncs: Array of xe_sync_entry to await before updating. Note that waits
> > > > - * will block the engine timeline.
> > > > - * @num_syncs: Number of entries in @syncs.
> > > > - * @pt_update: Pointer to a struct xe_migrate_pt_update, which contains
> > > > - * pointers to callback functions and, if subclassed, private arguments to
> > > > - * those.
> > > > - *
> > > > - * Perform a pipelined page-table update. The update descriptors are typically
> > > > - * built under the same lock critical section as a call to this function. If
> > > > - * using the default engine for the updates, they will be performed in the
> > > > - * order they grab the job_mutex. If different engines are used, external
> > > > - * synchronization is needed for overlapping updates to maintain page-table
> > > > - * consistency. Note that the meaing of "overlapping" is that the updates
> > > > - * touch the same page-table, which might be a higher-level page-directory.
> > > > - * If no pipelining is needed, then updates may be performed by the cpu.
> > > > - *
> > > > - * Return: A dma_fence that, when signaled, indicates the update completion.
> > > > - */
> > > > -struct dma_fence *
> > > > -xe_migrate_update_pgtables(struct xe_migrate *m,
> > > > -			   struct xe_vm *vm,
> > > > -			   struct xe_bo *bo,
> > > > -			   struct xe_exec_queue *q,
> > > > -			   const struct xe_vm_pgtable_update *updates,
> > > > -			   u32 num_updates,
> > > > -			   struct xe_sync_entry *syncs, u32 num_syncs,
> > > > -			   struct xe_migrate_pt_update *pt_update)
> > > > +static struct dma_fence *
> > > > +__xe_migrate_update_pgtables(struct xe_migrate *m,
> > > > +			     struct xe_migrate_pt_update *pt_update,
> > > > +			     struct xe_vm_pgtable_update_ops *pt_update_ops)
> > > >    {
> > > >    	const struct xe_migrate_pt_update_ops *ops = pt_update->ops;
> > > >    	struct xe_tile *tile = m->tile;
> > > > @@ -1301,59 +1250,53 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
> > > >    	struct xe_sched_job *job;
> > > >    	struct dma_fence *fence;
> > > >    	struct drm_suballoc *sa_bo = NULL;
> > > > -	struct xe_vma *vma = pt_update->vma;
> > > >    	struct xe_bb *bb;
> > > > -	u32 i, batch_size, ppgtt_ofs, update_idx, page_ofs = 0;
> > > > +	u32 i, j, batch_size = 0, ppgtt_ofs, update_idx, page_ofs = 0;
> > > > +	u32 num_updates = 0, current_update = 0;
> > > >    	u64 addr;
> > > >    	int err = 0;
> > > > -	bool usm = !q && xe->info.has_usm;
> > > > -	bool first_munmap_rebind = vma &&
> > > > -		vma->gpuva.flags & XE_VMA_FIRST_REBIND;
> > > > -	struct xe_exec_queue *q_override = !q ? m->q : q;
> > > > -	u16 pat_index = xe->pat.idx[XE_CACHE_WB];
> > > > +	bool is_migrate = pt_update_ops->q == m->q;
> > > > +	bool usm = is_migrate && xe->info.has_usm;
> > > > +
> > > > +	for (i = 0; i < pt_update_ops->num_ops; ++i) {
> > > > +		struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[i];
> > > > +		struct xe_vm_pgtable_update *updates = pt_op->entries;
> > > > -	/* Use the CPU if no in syncs and engine is idle */
> > > > -	if (no_in_syncs(vm, q, syncs, num_syncs) && xe_exec_queue_is_idle(q_override)) {
> > > > -		fence =  xe_migrate_update_pgtables_cpu(m, vm, bo, updates,
> > > > -							num_updates,
> > > > -							first_munmap_rebind,
> > > > -							pt_update);
> > > > -		if (!IS_ERR(fence) || fence == ERR_PTR(-EAGAIN))
> > > > -			return fence;
> > > > +		num_updates += pt_op->num_entries;
> > > > +		for (j = 0; j < pt_op->num_entries; ++j) {
> > > > +			u32 num_cmds = DIV_ROUND_UP(updates[j].qwords, 0x1ff);
> > > 
> > > Why 0x1ff here? Should it not be MAX_PTE_PER_SDI? There is a failure in CI
> > > here: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133034v5/shard-lnl-8/igt@xe_vm@mmap-style-bind-either-side-partial-split-page-hammer.html
> > > 
> > 
> > Yes it should be MAX_PTE_PER_SDI, copy paste error or perhaps this code
> > changed since my patch was originally authored. Will fix.
> > 
> > > Wondering if this is the cause? i.e we think we can fit more stores per
> > > MI_STORE_DATA_IMM, since write_pgtable() below is using MAX_PTE_PER_SDI and
> > > not 0x1ff?
> > 
> > Hmm, unsure. Will have to dig in on HW. The math to calculate batch_size
> > could be wrong somewhere else too.
> > 
> > > 
> > > > +
> > > > +			/* align noop + MI_STORE_DATA_IMM cmd prefix */
> > > > +			batch_size += 4 * num_cmds + updates[j].qwords * 2;
> > > > +		}
> > > >    	}
> > > >    	/* fixed + PTE entries */
> > > >    	if (IS_DGFX(xe))
> > > > -		batch_size = 2;
> > > > +		batch_size += 2;
> > > >    	else
> > > > -		batch_size = 6 + num_updates * 2;
> > > > -
> > > > -	for (i = 0; i < num_updates; i++) {
> > > > -		u32 num_cmds = DIV_ROUND_UP(updates[i].qwords, MAX_PTE_PER_SDI);
> > > > +		batch_size += 6 + num_updates * 2;
> > > > -		/* align noop + MI_STORE_DATA_IMM cmd prefix */
> > > > -		batch_size += 4 * num_cmds + updates[i].qwords * 2;
> > > > -	}
> > > > -
> > > > -	/*
> > > > -	 * XXX: Create temp bo to copy from, if batch_size becomes too big?
> > > > -	 *
> > > > -	 * Worst case: Sum(2 * (each lower level page size) + (top level page size))
> > > > -	 * Should be reasonably bound..
> > > > -	 */
> > > > -	xe_tile_assert(tile, batch_size < SZ_128K);
> > > > +	bb = xe_bb_new(gt, batch_size, usm);
> > > 
> > > So do we now validate that batch_size fits within the total pool size
> > > somewhere, to avoid triggering the warning in drm_suballoc_new? Did your igt
> > > not trigger the warning? Also the below check is not too late?
> > > 
> > 
> > I think the idea with xe_tile_assert is we should not expose asserts
> > which user space can trigger. e.g. When I run [1] we shouldn't see
> > asserts pop.
> > 
> > The below IGT passed so I think letting xe_bb_new fail and converting to
> > -ENOBUFS is correct.
> 
> There was no warning when running it? drm_suballoc_new() treats that as a
> programmer error and throws a full blown warning when returning EINVAL.
> Unless I'm missing something here, we have to do the check before.
> 

Ah, yes there is a warning. Let's move the check outside of xe_bb_new then.

Matt

> > 
> > [1] https://patchwork.freedesktop.org/series/135143/
> > > > +	if (IS_ERR(bb)) {
> > > > +		/*
> > > > +		 * BB to large, return -ENOBUFS indicating user should split
> > > > +		 * array of binds into smaller chunks.
> > > > +		 */
> > > > +		if (PTR_ERR(bb) == -EINVAL)
> > > > +			return ERR_PTR(-ENOBUFS);
> > > > -	bb = xe_bb_new(gt, batch_size, !q && xe->info.has_usm);
> > > > -	if (IS_ERR(bb))
> > > >    		return ERR_CAST(bb);
> > > > +	}
> > > >    	/* For sysmem PTE's, need to map them in our hole.. */
> > > >    	if (!IS_DGFX(xe)) {
> > > >    		ppgtt_ofs = NUM_KERNEL_PDE - 1;
> > > > -		if (q) {
> > > > -			xe_tile_assert(tile, num_updates <= NUM_VMUSA_WRITES_PER_UNIT);
> > > > +		if (!is_migrate) {
> > > > +			u32 num_units = DIV_ROUND_UP(num_updates,
> > > > +						     NUM_VMUSA_WRITES_PER_UNIT);
> > > > -			sa_bo = drm_suballoc_new(&m->vm_update_sa, 1,
> > > > +			sa_bo = drm_suballoc_new(&m->vm_update_sa, num_units,
> > > >    						 GFP_KERNEL, true, 0);
> > > 
> > > And maybe here also?
> > > 
> > 
> > Hmm, I think here we should also convert IS_ERR(sa_bo) to -ENOBUFS. Will
> > fix.
> > 
> > > >    			if (IS_ERR(sa_bo)) {
> > > >    				err = PTR_ERR(sa_bo);
> > > > @@ -1373,14 +1316,26 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
> > > >    		bb->cs[bb->len++] = ppgtt_ofs * XE_PAGE_SIZE + page_ofs;
> > > >    		bb->cs[bb->len++] = 0; /* upper_32_bits */
> > > 
> > > Off camera this is doing:
> > > 
> > > b->cs[bb->len++] = MI_STORE_DATA_IMM | MI_SDI_NUM_QW(num_updates);
> > > 
> > > What are certain that num_updates still can be done with single command
> > > here?  Do we not need to break it up like we do with write_pgtable? If it's
> > 
> > The IGT assert from the CI failure will pop if we overun the allocated
> > batch buffer. So I think we are good on our commands fitting.
> 
> Ok, sounds good.
> 
> > 
> > We could potentially break this but kinda goes against the idea a single
> > job per IOCTL. Also I don't really want to overengineer this when we
> > have a planned UMD fallback path via returning -ENOBUFS and eventually
> > want to move to CPU binds and this entire problem just goes away.
> > 
> > Matt
> > 
> > > not an issue I think would be good to add an assert to ensure it fits?
> > > 
> > > <snip>
