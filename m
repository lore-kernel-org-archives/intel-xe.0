Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51188C30653
	for <intel-xe@archiver.kernel.org>; Mon, 24 Jun 2024 21:56:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB9FA10E22B;
	Mon, 24 Jun 2024 21:56:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cctL2iWn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFE2710E24F
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Jun 2024 21:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719266179; x=1750802179;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ESfm0d2BtK4Q1GpRuUp3PGP68FGLxpNYk2ukqwP1UEI=;
 b=cctL2iWnoqFrtIs4hG+GLyuVhYvLwa4ITY7guv36Gl8dDqd7kGV3bKXo
 muRA7tktYHmsqKmRg8PN1vtBvyprtgUVUNU0LyJ+BZgv8Q9LLXZ1P9DoF
 aWQqdky3tgSjaxvqeO/LV+jh0YWy8FHvlxyGWt0IgqnfadFf3WKZmFm94
 YTidY+2j8xMkyKLTHen4D33I0r6Wx9E9llYjJ/yRKSfqND7wJrmA8/X4L
 4wRDj3ZjzTDpc4ZqMiQeILLdB8IBngMixNalvHbhX9ypSi8iDpfSh/U4Q
 h41um6ZlT0RAVfX8hJavrN0fJRHYnTa6tIDw+1WHBlKbMgX/G6eiTrPaX w==;
X-CSE-ConnectionGUID: sM982sLeQ026oGXXCXz3Cg==
X-CSE-MsgGUID: prO/GwTqTciPs5rbsl+hNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="26947781"
X-IronPort-AV: E=Sophos;i="6.08,262,1712646000"; d="scan'208";a="26947781"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 14:56:17 -0700
X-CSE-ConnectionGUID: MwsNvqNISIy4FMaxWZYpMA==
X-CSE-MsgGUID: Iftb4Jj7TrOZdWmf2aebXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,262,1712646000"; d="scan'208";a="43243772"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Jun 2024 14:56:17 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 24 Jun 2024 14:56:17 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 24 Jun 2024 14:56:16 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 24 Jun 2024 14:56:16 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 24 Jun 2024 14:56:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CoxkyiUtz6xRdhH1t8S7DCI4y2NYCCxHTLjQHQAsHQHFtLBBmlWlzeLfAZLREFqG616TSah1y1uWRHeGPqFoueKG8Fy9U71joL84s1rFGUgO3nMdoBykVDRcCllZUdKYiF6tl41NJc9pz2V8cwCVVkh9INoBhZUlCxk6+Uj9jnVDu0K0F3bXdxfOiCxKW3mwEJ7Bx7EnGowZxzJDSnHzojH1J9WQhGseRT08FVS5oq9c//g5Hs6HHZf71auzIf9ubjd3/hf4U3RtNkB4x1rwwQBALI4CaI0jcn5uGQyh8Jk4Vuawo2072AFAkZHSmdNsGzks8b/cGWkBQFDRUTzdfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2/YUxOTxieJhEvxhERZdZ4NzBZ0ZgcLXeuhtmXZOB48=;
 b=n9ySWrrRk2bno72ZmLvHpfjT3k5nE8LJ4tw21j/UwY/o4jtYYUC5LD4KSdiaaMM9QPj5e/JAnNopOCXBIQivAe8bRz7t0XWEMQn62CAMngbOGBzTBF3FUYb0koji7P9qCtPD5OfWpiWlOfMhMdkXtg/csw497BK4jxQFQsyEJIkK+7fwzEaFKgnRvY63BT3bIArlTyOsLJk9Alcs8r2KUSGqdTdr1LsCW800ErXMf/cwRIce+WLCCIKxTe0cHL0MvNe9RlWU2ArN6OWhYbcpRi9F15d0v3tdxBDzlCJsPDjOOi2G+T9a+yUC7PJ+12l9GZFVAyU1C+Oxk6mHIDQ6Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA2PR11MB4971.namprd11.prod.outlook.com (2603:10b6:806:118::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.30; Mon, 24 Jun
 2024 21:56:14 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%3]) with mapi id 15.20.7698.025; Mon, 24 Jun 2024
 21:56:14 +0000
Date: Mon, 24 Jun 2024 14:56:12 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Get XE_FORCEWAKE_ALL to read RING_TIMESTAMP
Message-ID: <20240624215612.GV2906448@mdroper-desk1.amr.corp.intel.com>
References: <20240621192325.227230-1-umesh.nerlige.ramappa@intel.com>
 <yolllanxh5neppqhi5whzwsdxetbqfkzurfsbaf5x63s72tppn@e7c6xhqf46eb>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <yolllanxh5neppqhi5whzwsdxetbqfkzurfsbaf5x63s72tppn@e7c6xhqf46eb>
X-ClientProxiedBy: SJ0PR03CA0340.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::15) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA2PR11MB4971:EE_
X-MS-Office365-Filtering-Correlation-Id: c867da60-8195-474a-d06c-08dc949877d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|1800799021;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DXPVMsN6vH6/4q8NoTojrK/GgM2nqOb+h6p41Asd/xD45pZQ2sUhpRlcF/Re?=
 =?us-ascii?Q?fwE2u9QeHsTWmtRffs/63twTBqRktPurYdrBJaeFR3z50guWnqzwjrxrsSsl?=
 =?us-ascii?Q?NdJcrL05OqfHhBesEbrkdfwTYxqTP2dbVkcupflsd+hY9hrYC5kIF7iTX9i8?=
 =?us-ascii?Q?1ZgofXb6i2N7e4OzWlKpMUtzoaAe6BgkXI4Y3ntwCa+mKr/s6MueGAo++u+a?=
 =?us-ascii?Q?z31YSEBbmUCOQmdTqlDxoZpqqMmPWbE77KuWalfAVrdgcQJLCbaq2678uKde?=
 =?us-ascii?Q?CIMV2cKG2zpRIMlGgT50TdM1sgp7ZwD6GIcbdE0vHmU+2yoi+AUv3pIvXYqa?=
 =?us-ascii?Q?fPj4mxBPkPrz7vnApGMFVIItoj1+qNOpS6A9iLkHtRyGt87qdABZxztpwp6Y?=
 =?us-ascii?Q?SRw+tEKo81l7Q1pG/rWTCi7tkNT5ztAirKPH8A4qdIpGDF59JgNTtQffb4NG?=
 =?us-ascii?Q?wSqi3inmG4ktpg9DVaqyVW5EwO+rEEu70NTbrtHyZaf4MckFSskxJF78kVp+?=
 =?us-ascii?Q?b3htr+wuJyARjVOBT50BxDIVmdP3hWOpvss81cHzd+60HKQ2aBr3TPd7PJ+3?=
 =?us-ascii?Q?EOhqki/3ILVgZPH6Mm2dCe0DfjxwibJVdZxUzv6+W8SKwSdtjvlnMg1FdHzL?=
 =?us-ascii?Q?w/o14fB7/Ykvv2F3BJY+JGQqRVPq2f00+UGipJr0uLpi2bH+7EbZmU98a20n?=
 =?us-ascii?Q?cLQbrv2w6xuUkuHhqRyKHNl7ns9xC2ObEvdhuRiEvg1/Osq5uOtSCreOcJZl?=
 =?us-ascii?Q?5Vwjn/teIcEeuQ1InfZBPyDXzyvpMgmsonr7fWa5/WXbqx916VA4fxPDRiSV?=
 =?us-ascii?Q?/zDM7WYB707+dplYUslV0ycXI5dBZUAxd/7kP0tXpGEr/NA/f45xY8WgNZ3i?=
 =?us-ascii?Q?vI2aU1fNSE3BT77d87zKFAC5GUYIpqcOwjOVnEzWjxxXjyehBci3RP32cm5y?=
 =?us-ascii?Q?9Uzy9rBue07+h6GoNF7ACV95jmh8/13G2ON9DpUsbGnPKh1Wp29tRoa43KZV?=
 =?us-ascii?Q?PWXJEDv1fFaf8FMmS5st27yAjtlaqwyEw1x5ouljNNqOA9kWIcAB6TKfl4WQ?=
 =?us-ascii?Q?6ekcdlhvH5nlJO+EYOJYSFQosQkN61yVPGjZQZSTRpPD7b/p4Kia38nQMfcL?=
 =?us-ascii?Q?9EFZlMbUNHYvsvQShJWN0jIEkbPhHVgMt4r216dr1zbkVF0p1fqzCvx7jFgX?=
 =?us-ascii?Q?W0cz6Lg2HjcDHuiQd9DCtZ2ZcObzWf/QtQU8fXscOigpgk/7iuzLUEmPWr2F?=
 =?us-ascii?Q?J271EQQTfjdyTwgCiJeF05sKQOKxufleiNroFIeFQEGIGISvaDTGF+m1Dujl?=
 =?us-ascii?Q?bfQckaNGwYIzAZ0yCf1RRmpz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(376011)(1800799021); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yIs6EZCgiAkIP/kFRfFCrahssseS/nlOb/PMbkz5nbF8tSQbolhyUEag+XXN?=
 =?us-ascii?Q?XMyby/4ur//HIk8XpNY4/OvBW/ePRDV/SsfQys2RiK9GyB1jzxJxa2pzz4Y7?=
 =?us-ascii?Q?dMJb0ApNKKAg2Z0MCYhuHEi1G8ZIzemF7AzdjhET4CeRF1R/sliOyNgxb1Lz?=
 =?us-ascii?Q?4V9wlMoywtGaJTSU9vD0mHX62jnp/m9jFfi3EPGpepVBWELL2ljjtAWbwga4?=
 =?us-ascii?Q?nKicyjyEnBWRikm8XcaWtxGbsHXysXxVCdrvFtKbV+gjbDiW5p5w6Qk77ljy?=
 =?us-ascii?Q?Nkc7ik20qBCFgn+ZWMGzYGYtxQc9kBjjfHqV+RUb/7EUZYAUb5EH5UFF6hvD?=
 =?us-ascii?Q?sum+Yb68b5iSz/c0MA40iFU7blT+0p9eqqNGZ3H9UWiCZfcbHRg8CNJE9glF?=
 =?us-ascii?Q?3olH2Qn5RNqU81t7Cj/xrSLSMRInUWO/tvBuDtT9Cex1LTgjKyYgpbsKJm1W?=
 =?us-ascii?Q?m0SQQX6fFp8pWhfGCxGi6nheJZXyG2Czh7+OqmECTCiUZ8WhAmTqzSaKcdcf?=
 =?us-ascii?Q?D7vtZm6CG+T0tkcUd9Io0vyMjpDgHXC5kV1Rddv3+rflG0ud8JqRSyfFmKxw?=
 =?us-ascii?Q?sG48HWyGgX79NoK5TN/vcojdvofqh7bMjnDmWBiblGA+05cnouAJ/7GvOy8v?=
 =?us-ascii?Q?6Ue+OK1EPUV1QQFywvwYpHCB50XZNnqNufiQCE7FuXOdNrdMjWBMafxzNrxO?=
 =?us-ascii?Q?CSPpKBpCL32rqJTcBf916tco2lXEDf1LimssCTaMc+eYRDIMTAL7FYTg0MiZ?=
 =?us-ascii?Q?SSjkOwwunBgc0PHCUg7fdA/1nA44hc2SK9MSVZ5GE5vfG81zVtGcN69YiJj0?=
 =?us-ascii?Q?6kVnhkDpn8E8ZIlBQU4r3acxMH9xEhWV4vcjqj1fenRUFucLvYbbR3a2Fc8L?=
 =?us-ascii?Q?3IfqdHZDxR6PHkuG2nJVC4hHzu2wZrx72p8o2hVIYSCMBQ/cKWi6fdu5dClw?=
 =?us-ascii?Q?b0wF2hsA22pqay4DaEoPeDcb6gErU7O2M2qAUbTSpO9p5UulLWKAFqBLVicg?=
 =?us-ascii?Q?2TJzfTbKi47P13wTABuFIl1zVh2G6xcAZ/dE6yh69MLo/5GzJYTIubltaogW?=
 =?us-ascii?Q?ezwrzVU7SfoH8yEjYKAcSys2nj1BgfVWt3rrejad/8d3XAr2aN+mBsTDeVU6?=
 =?us-ascii?Q?jjKM8qTOOy+2Rgua+79fKq8T7Q2gurMZhUKCdkBKsbDUcMYEcuHK7UlDrMvl?=
 =?us-ascii?Q?XdDj/oa8mGwG5BgjJEo7haEdfbzyi/7iV8nNcXYPpV+jw34av9bG7+GxHz8A?=
 =?us-ascii?Q?hg4xy+ISGFRLNYpAUy0P2F+wSXwKhQD24bZ49L0FGLvLGoAcffs1EAos6Bk+?=
 =?us-ascii?Q?1l+FldqeUkrqGG8Dz3XauAIRVzOd0meCynMAGCIzc9wsS6ZS83b1ltLNJw79?=
 =?us-ascii?Q?zKABfeiB0+YxTQ8n1IpSBLceJB17YodtQpGwD7UG+qmNHqVPxcyeMq8qG9E6?=
 =?us-ascii?Q?eylKoHtcg3tqd3rzCJj6qMyq4qABHfS5dYWavbsrteKTOZ6V6uFErBH7dtH0?=
 =?us-ascii?Q?oR1LJSccG48POrK8Jkrv5pQtkxN4oUKbjIAFKkC6TLZEzrGzjJI/3aQ7/WM/?=
 =?us-ascii?Q?6aTm+pWLCD2G8mE3qlS6ioTF9tHfRk1kG6kWS/0nb5BUtgE6CLPdadn+H9R3?=
 =?us-ascii?Q?dw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c867da60-8195-474a-d06c-08dc949877d8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2024 21:56:14.7595 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 51VkaPIkxEnDR+KODgd0YnjNHnW/8O/6XrOzeAH9C+d5+9iaYBqSe3YOrWr4Tkre+JR78h1xej/vsNND1MYZlKrBjrodkm6wY4rYYro0jh0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4971
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

On Mon, Jun 24, 2024 at 09:44:03AM -0500, Lucas De Marchi wrote:
> On Sat, Jun 22, 2024 at 03:23:25AM GMT, Umesh Nerlige Ramappa wrote:
> > Per client engine utilization uses RING_TIMESTAMP to return
> > drm-total-cycles to the user. We read only the rcs RING_TIMESTAMP in
> > platforms that have render. While this works for rcs and
> > ccs, it is observed that this value is 0 when running work on bcs, vcs
> > and vecs. Ideally we should read the engine specific RING_TIMESTAMP, but
> 
> what do you mean by engine specific RING_TIMESTAMP? We are already
> reading the engine specific copy of the same timestamp. AFAIR just
> getting the gt fw was working for reading this register from vcs, vecs,
> bcs. Can you demonstrate the failure with a bug open or a series of
> intel_reg invocations showing otherwise?
> 
> I think the simplest way to show it doesn't work is to call
> `intel_reg write` to get a GT forcewake, then `intel_reg read` to read
> this register.

I'm surprised to hear that this has been working for the RCS/CCS but not
the BCS; that seems backward.  RING_TIMESTAMP is $engine_base + 0x358.
According to bspec pages 71185 & 71186:

 - Render  (0x2358) needs RENDER forcewake
 - BCS0   (0x22358) needs GT forcewake
 - BCS8  (0x3ee358) needs GT forcewake
 - CCS0   (0x1a358) needs RENDER forcewake
 - CCS1   (0x1c358) needs RENDER forcewake
 - CCS2   (0x1e358) needs RENDER forcewake
 - CCS3   (0x26358) needs RENDER forcewake
 - VCS0  (0x1c0358) needs VDBOX0 forcewake
 - VECS0 (0x1c8358) needs VEBOX0 forcewake
 - GSC   (0x11a358) needs GSC forcewake

So I'd expect everything _except_ the BCS engines to be broken today...

FORCEWAKE_ALL is a big hammer that should indeed solve the immediate
problem, but I wonder if it would make more sense to store the specific
domain that needs to be grabbed for accesses to any registers in an
engine's ($engine_base .. $engine_base+0x2000) MMIO region so that we
can avoid unnecessarily waking up all the unrelated power domains
whenever we want to read a timestamp?


Matt

> 
> Lucas De Marchi
> 
> > to keep the logic simple, just get XE_FORCEWAKE_ALL instead of XE_GT_FW.
> > 
> > This should work fine on multi-gt platforms as well since the
> > gt_timestamp is in sync on all GTs.
> > 
> > Fixes: 188ced1e0ff8 ("drm/xe/client: Print runtime to fdinfo")
> > Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_drm_client.c | 4 ++--
> > 1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
> > index 4a19b771e3a0..74f2244679f3 100644
> > --- a/drivers/gpu/drm/xe/xe_drm_client.c
> > +++ b/drivers/gpu/drm/xe/xe_drm_client.c
> > @@ -264,9 +264,9 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
> > 		if (!hwe)
> > 			continue;
> > 
> > -		xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> > +		xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> > 		gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
> > -		xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> > +		xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> > 		break;
> > 	}
> > 
> > -- 
> > 2.34.1
> > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
