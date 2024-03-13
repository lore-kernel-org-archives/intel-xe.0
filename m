Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD705C54E58
	for <intel-xe@archiver.kernel.org>; Wed, 13 Mar 2024 03:17:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D1CF10E763;
	Wed, 13 Mar 2024 03:17:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q9FJoW/S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8513010E795
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Mar 2024 03:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710299877; x=1741835877;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=l8Loo2ybLsGMG0Tsy5W0ErhnKeJ70cD2aQ1WvXoAmLQ=;
 b=Q9FJoW/S5xdI9lpYw+3GZtF+NMIv8L7/LYZe1naf50SePdwfP2NDt1qR
 1THfdbZAQPs0TYXAX4CfMbKqVwno7qEitR6slAP76bzW1a0nPznLQfTpS
 AZs1OUlo4SIoqkYYPaNSXpOcD1CKQGX7eSa0urx0vAxLVPbYi59/0NdWn
 lYfjLSq/ez5GVyBnFQgB9INR3D11YrajdSZ4TQiVUb7x5VyArhrn0KAZf
 kQk7RPSsIcBw1BLX9A8mTgC4ZbwMbRgujpTH7zauKVDzyIKOlTmhiOAKy
 EWPd2IkBVIG/6M1jg0qGZMI4Xn8AuNRS7tpuyfwcsenY1TTTDmj9oqHtB g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="15598998"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="15598998"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 20:17:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="11688294"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Mar 2024 20:17:55 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Mar 2024 20:17:54 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 12 Mar 2024 20:17:54 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 12 Mar 2024 20:17:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q5P8W7ybEr5sQM9TwWEbgK7GiMr7QE4YCYcjT9zGQnbwpmWVEXBRIMuuVxGSyj1miQjsOPzRfO2daehjdnfNf5upp0/qWHpDC0KNy/qhqsbIwTYigxCyHkI/RpQI3OTl8yocRSiwXRO5GIG4iiyYCaaDdUkcWCQpaqkyuliOiBEFmFFqpB9j0Nj7gGXy346/IivJAx9D0MxzxSsaWfpDTgOLqoPl7J/rSpe3H6qvBnJgVlejM2m1eOj0igZ6d+iI0pEDwbP5XXz3krLtJXhvcI+JRaMbXwgAhpNwBkQ+1LkaNbd0cOOSP5vXLbpTIJzORBjHQxuQE0b3YuCoutdylQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HfCBya1BspYz/yRVdGy9kSYDMOHjAhPJ6z06kxJPr7A=;
 b=iAMzYQpW3U8MnmjaMhLxlVmuvReaws6gvHuOWsZTXWTH7/a8Jw/i6SmXiYGsXBJgEsaLl1VgExnC/y603/+haduogGeJaVcJIGggIH+4OuHTVhE1xOd5J2g4VA632M1k0+G0wKH4fmEVZvV1KYEDhKEmektUoC4l3v1xn1dLAe+1BGbSDFTdPaXEiMZZ9VdU88puD2trHN6wWrKgwYWwgwuOgQtCNGThjcod+O92qetzM4a5UxrZjR00cqSlW7yO015p/LDeDhFW+gber2LsLikXrQ9VP/6wd+OhPudDvU82CXESmKIz1q2dgwt+yjRjpHD1at9pU7AsA55uSzRsCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB6614.namprd11.prod.outlook.com (2603:10b6:806:255::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.18; Wed, 13 Mar
 2024 03:17:47 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7386.017; Wed, 13 Mar 2024
 03:17:46 +0000
Date: Wed, 13 Mar 2024 03:16:50 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Zeng, Oak" <oak.zeng@intel.com>
CC: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: Separating xe_vma- and page-table state
Message-ID: <ZfEaouWSLJZmxGmO@DUT025-TGLU.fm.intel.com>
References: <72ea6bc36260bcc2eaeb97d1abcb8bebf69f3f53.camel@linux.intel.com>
 <SA1PR11MB699139B15B97B2B056312F41922B2@SA1PR11MB6991.namprd11.prod.outlook.com>
 <ZfEA5ieJ+M9rttI3@DUT025-TGLU.fm.intel.com>
 <SA1PR11MB69912840ED414B40B6F3A829922A2@SA1PR11MB6991.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <SA1PR11MB69912840ED414B40B6F3A829922A2@SA1PR11MB6991.namprd11.prod.outlook.com>
X-ClientProxiedBy: BYAPR06CA0050.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB6614:EE_
X-MS-Office365-Filtering-Correlation-Id: bdf33e60-e3df-4087-671a-08dc430c27d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UKmat/n1wq0yWZY6lsEmN9Nj98m28JwmOQ2nMU5JVOCnj1eLSWjCTP+kXTOL+vUi+ukZjPGfnDwb26AKJK4rynVp85LJKxXlEJz488u3XSc9/qwcAFMUfJyW68X39Mly4EJhZ2Uf194PAwZWesvNMYK1pC1sqXifrxbt3Gg8527cmo5JJLwrwPjA13CsulW7HVQctPcze94dTatJOZOJqicRdPbqUFZd/R0YqP2OWXAGCBocHs3fwPbPsp7+8Cxzr92PLDtSv7I4p1LBwnQLMsBAMyYS4L+WKV/55m5tCirfgXi/YWIN9F4MGEB3g9/mQJRv6GwwwU7rgJ4s4IVrt/41qgpH9TT7SgRbqNswmhBgx36tM3gRfnV5Unvc15DdAL1Yjr5uI9xi3xv9aispPDOzMNcmgqCuMnS7MmEZZjmw8Uqj4bn4ayXcNHy+0XQkO6tzGCpSQ+Hc9MfwITN0J/byBlpjYvCknBZKsu3hiIxUn5NrjbEk81RPHiH8hKpWim3ycUiCrDdXNoDX7HMFjwbcitywxSt1WZqAjfAk/H5W6Qs2saaVEtgRL+pIj1lpFCvct2UGFBWcTtQlgpCrgJHKGfxSPGcfkH+WjqG/V5N0JSUFaBgyhMrsERNxCWJx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?w4Y9yiBXBaGPYqzENrNeQUmwoAP4KPGQsiJYaNoOuuVhgU1aSeZUiFer0V?=
 =?iso-8859-1?Q?EyBbMlVpv/0Xgc2q1tHwR8wbVz7c7K8sGYeUW4AQTSoUCdf6DU/pX2JK9G?=
 =?iso-8859-1?Q?xKlLFaT+tMYYpWy1YcBtN+5oo5xv/3LIAWewye5VwgQ/mZw/pJsxxHKVLG?=
 =?iso-8859-1?Q?3AVodWRq0GpOwDfLUVf5N2Mt75GDSiIAawf097lBUfhSbdJQDuvzQZjVMR?=
 =?iso-8859-1?Q?3Sv2syYUfKb2rFF4qHiTu0/CoAtIFHydHICTBoNoME2jTKIaqG1YFHUDQv?=
 =?iso-8859-1?Q?R3vRU2r8tAPBZUiKeAGOESViBLgl+h9ERh2PMgQ4rciEMb4YdgEGvJWP8L?=
 =?iso-8859-1?Q?IT4kzky6K/QJJ/4L313O38R/orqd7G58WiU6QSXTE9Oc2k0ImxOTvrCOUH?=
 =?iso-8859-1?Q?kpmDFIB+LrjhaAF2ceA+Ek/2G4LCaKVPJ0ufI/vYbkOACiSeJSksnjS3JP?=
 =?iso-8859-1?Q?uLELGAgJB0FKW+28ARf1CCjpkd0zc6uGj7xS2+sGf6I2IUAjqHMYxj0izd?=
 =?iso-8859-1?Q?jI2Z9D29hxjwtp1RtPK6j3N1Ce4nmLUIb5HXwtCKPpTUtqV48SkB6FEqHJ?=
 =?iso-8859-1?Q?iFh20lCpumiW5jMBwkG71yJAJZmRII2DUewJoZPxVhQE9BO9a7KVHMgKVG?=
 =?iso-8859-1?Q?4X/eQ2NmrOdJ/awe9YFhynO1yCzx5I/5OAAM32Zy6A0JhMqTvC1PyAyATM?=
 =?iso-8859-1?Q?7bueiJWeaiYCjT54PSEi9FV/7lsvVigYhSv1/9LeHtKOUHgcg7hLzoDwqX?=
 =?iso-8859-1?Q?4BtbQookWHd/NHEYB9FtMWh79kKfMaF7rzc4tF5liF9miBLLknDwiVCjhv?=
 =?iso-8859-1?Q?jC/ShlOZX6M2ObKPJ9OjaJRpU86atR2SmQQdm/Vr2wQu/mywr74cfUSobh?=
 =?iso-8859-1?Q?yIEd5YePuYbFj1y7PuhvVkaE3GIXKqdDBNTORg530Q7Ha7R8dg3bbf5yGg?=
 =?iso-8859-1?Q?rh74ApUNEX9lPE1sxSByOyVhcJ4pWE1I1olRliJvy/zUUAAC4sxT/IPwnD?=
 =?iso-8859-1?Q?f8QwwtXGiT63sTkxxNtaJGIs63ae9Fu+WXNH/kenI0NHWyt8XGEtyX+CS1?=
 =?iso-8859-1?Q?Lzi3QPs5vnQoLDX4D7tE8KlG3xgSWlmJ4mwgTAgSCr5kaXjjuOW8qEcukV?=
 =?iso-8859-1?Q?br8BMMGUIQCV5K1MhqDKgbWent6BdlYRVmPmV3GDm9fvGGU7pLzqZJWwk1?=
 =?iso-8859-1?Q?n4S0+XZEADIVS70WcV+cIyGlzh0MDWFoFkqZJ/bXrO9nZXlslIbtby+d5l?=
 =?iso-8859-1?Q?+lxfJoLQ75IGHjwwszg219j14h8fZvEEJgdoGAfn1FggwnH0YBuRjKNsKJ?=
 =?iso-8859-1?Q?EOGB2gg4rC2+rb71nfFZKocuMZGRGLKuYCdO+pQhE1sQvVCv/tGbTc1JYj?=
 =?iso-8859-1?Q?hTEDCFHYfKc9r2i5IF9ywG3ZZIcpnc1iRsRy3ubAkTrme43tMZtD/668xs?=
 =?iso-8859-1?Q?v8ivXN08DtgRqzm+vrHNHntQeTlatQ2RhIDikpHPdzDzIaey7mVoNxeIYX?=
 =?iso-8859-1?Q?ND0HatEHSTWysg4sBfJYW9J5J058Hd6Xcj8CLldfJFmEKDF4QmfRtIcR8y?=
 =?iso-8859-1?Q?gFOhmOF6kZYTPucpCMwGxRd+GtyYd+NGE1wrXXEIKcNwHm/mIetbp6dzJh?=
 =?iso-8859-1?Q?86EK4gzOXBDsNxC02+9UGBEdy7bGANex5nDRBrH0LmGfoiZSfWe4zl9g?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bdf33e60-e3df-4087-671a-08dc430c27d8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2024 03:17:46.7949 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7iqfTHN5aNhs4TQY1NnW4Q5PVCQJcnHAxzo5LXSK1v+ZjCjEqUM7Cmjw21dm9SBaLqRfgA/AsLBW1IRFv1T+ZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6614
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

On Tue, Mar 12, 2024 at 08:16:24PM -0600, Zeng, Oak wrote:
> Hi Matt,
> 
> > -----Original Message-----
> > From: Brost, Matthew <matthew.brost@intel.com>
> > Sent: Tuesday, March 12, 2024 9:27 PM
> > To: Zeng, Oak <oak.zeng@intel.com>
> > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>; intel-
> > xe@lists.freedesktop.org
> > Subject: Re: Separating xe_vma- and page-table state
> > 
> > On Tue, Mar 12, 2024 at 05:02:20PM -0600, Zeng, Oak wrote:
> > > Hi Thomas,
> > 
> > Going to reply to both Thomas and Oak to not split this thread.
> > 
> > >
> > > > -----Original Message-----
> > > > From: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > > Sent: Tuesday, March 12, 2024 3:43 AM
> > > > To: intel-xe@lists.freedesktop.org
> > > > Cc: Brost, Matthew <matthew.brost@intel.com>; Zeng, Oak
> > > > <oak.zeng@intel.com>
> > > > Subject: Separating xe_vma- and page-table state
> > > >
> > > > Hi,
> > > >
> > > > It's IMO become apparent both in the system allocator discussion and in
> > > > the patch that enables the presence of invalid vmas
> > > > that we need to be
> > > > better at separating xe_vma and page-table state, so that xe_vma state
> > > > would contain things that are mostly immutable and that the user
> > > > requested: PAT index, memory attributes, requested tile presence etc,
> > > > whereas the page-table state would contain mutable state like actual
> > > > tile presence, invalidaton state and MMU notifier.
> > 
> > Thomas:
> > 
> > 100% agree with the idea. There are 2 distict parts of xe_vma - what I
> > call GPUVM state and PT state. In addition, there is what I call IOCTL
> > state (sync objs, etc...) that is updated in various places in xe_vm.c.
> > 
> > Functions to update these respective states should be clearly seperated.
> > In the current implementaion is a complete mess in this regard, you
> > mention xe_vm_unbind_vma below, in its current state there is no way
> > this function could be easily be reused.
> > 
> > My series [1] vastly improves this seperation. It still could be split a
> > bit better though. In my next rebase I can look at this series through
> > the lens of clearly maintaining seperation + likely update [2] to do an
> > unbind rather than a invalidation.
> > 
> > [1] https://patchwork.freedesktop.org/series/125608/
> > [2] https://patchwork.freedesktop.org/series/130935/
> > 
> > >
> > > It is a valid reasoning to me... if we want to do what community want us to do
> > with system allocator,
> > > And if we want to meet our umd's requirement of "free w/o vm_unbind", yes,
> > we need this "invalid" vma concept.
> > >
> > > The strange thing is, it seems Matt can still achieve the goal without introducing
> > invalid vma concept... it doesn't look like he has
> > > This concept in his patch....
> > >
> > 
> > Oak:
> > 
> > I'm a little confused by what mean by "invalid" vma concept. Does
> > that mean no GPU backing or page tables? That is essentially what I call
> > system allocator VMA in [3], right?
> 
> Thomas also mentioned this "invalid vmas" concept. Here is my understanding:
> 
> 1) from the system allocator discussion: we introduced a gigantic vma which is invalid because address in this gigantic vma are not a valid gpu address.
> When we create a vma in gpu page fault handler, we carve out a vma from gigantic vma, this vma is a valid vma. 
> 
> Note there is subtle difference b/t invalid vma and vma without backing or page table. A valid vma can be migrated to system memory and at that time it lost its gpu backing or gpu page table but it is still a valid vma.
> 
> In the POC code you give, you don't the migration logic, so you don't need the note of "invalid vma".
> 

We have gotten a little off topic from original point of this thread...

Anyways we already have this concept on tip, see xe_vm_invalidate_vma.
When a BO is moved or a userptr is invalidated we call
xe_vm_invalidate_vma which invalidates the page tables. Next GPU access
will result in a fault and page fault handler will rebind the VMA. Any
new migration code would call xe_vm_invalidate_vma too.

> 2) from the userptr discussion "free userptr without vm_unbind": in your patch, when user free userptr without vm_unbind, the code behavior is, you invalidate that userptr from gpu page table and put it into a repin list. Userptr vma will be repined on the next exec submission. I guess Thomas call such vma (freed, but not vm_unbind) as "invalid vma"
> 
> For me this behavior causes unnecessary complication. I would destroy the userptr vma when user free it. We can create a new userptr vma on next umd vm_bind. Is this simpler?

Still not following but let's table this as again this is off topic.

Matt

> 
> Oak
> 
> 
> > 
> > Also based on Thomas say below related to xe_vm_unbind_vma and [2] we
> > should be able to have VMA that points to a backing store (either
> > userptr or BO) but doesn't have GPU mappings. We do have this for
> > faulting VMs before the initial bind of a VMA but we cannot currently
> > dynamically change this (we can invalidate page tables but cannot remove
> > them without destroying the VMA). We should fix that.
> > 
> > [3] https://gitlab.freedesktop.org/mbrost/xe-kernel-driver-system-allocator/-
> > /commit/3fcc83c9b075364a9d83415ca73a9f9625543d7c
> > 
> > >
> > > >
> > > > So far we have had no reason to separate the two, but with hmmptr we
> > > > would likely end up with multiple page-table regions per xe-vma,
> > >
> > > Can we still maintain 1 xe-vma : 1 page table region relationship for simplicity?
> > >
> > > This requires vma splitting. i.e., if you have a hmmptr vma cover range [0~100],
> > > And fault happens at range [40~60], then we will end up with 3 vmas:
> > > [0~40], a dummy hmmptr vma, not mapped gpu
> > > [40~60], hmmptr vma mapped to gp
> > > [60~100], dummy, not mapped to gpu.
> > >
> > > Does this work for you? Or do you see a benefit of not splitting vma?
> > >
> > 
> > Thomas / Oak:
> > 
> > Agree for at least the initial implementation a 1 to 1 relationship will
> > be easier. Also unsure what the benefit of not splitting VMAs is?
> > 
> > That being said, I don't think this is something we need to decide now.
> > 
> > >
> > >
> > > and
> > > > with the patch discussed earlier we could've easily reused
> > > > xe_vm_unbind_vma() that only touches the mutable page-table state and
> > > > does the correct locking.
> > > >
> > > > The page table could would then typically take a const xe_vma *, and
> > > > and xe_pt_state *, or whatever we choose to call it. All xe_vmas except
> > > > hmmptr ones would have an 1:1 xe_vma <-> xe_pt_state relationship.
> > 
> > Thomas:
> > 
> > I like the idea of VMAs in the PT code function being marked as const
> > and having the xe_pt_state as non const. It makes ownership very clear.
> > 
> > Not sure how that will fit into [1] as that series passes around
> > a "struct xe_vm_ops" which is a list of "struct xe_vma_op". It does this
> > to make "struct xe_vm_ops" a single atomic operation. The VMAs are
> > extracted either the GPUVM base operation or "struct xe_vma_op". Maybe
> > these can be const? I'll look into that but this might not work out in
> > practice.
> > 
> > Agree also unsure how 1:N xe_vma <-> xe_pt_state relationship fits in
> > hmmptrs. Could you explain your thinking here?
> > 
> > > >
> > >
> > > Matt has POC codes which works for me for system allocator w/o this
> > vma/pt_state splitting: https://gitlab.freedesktop.org/mbrost/xe-kernel-driver-
> > system-allocator/-/commits/system_allocator_poc?ref_type=heads
> > >
> > > Can you take a look also...
> > >
> > 
> > Thomas:
> > 
> > It might be helpful to look at that branch too, the last 3 patches [3]
> > [4] [5] implement a PoC system allocator design built on top of [1],
> > using existing userptrs for now, and is based on our discussions in the
> > system allocator design doc. Coding is sometimes the easiest way to
> > convay ideas and this roughly what I had in mind. Not complete by any
> > means and still tons of work to do to make this a working solution.
> > 
> > [4] https://gitlab.freedesktop.org/mbrost/xe-kernel-driver-system-allocator/-
> > /commit/3fcc83c9b075364a9d83415ca73a9f9625543d7c
> > [5] https://gitlab.freedesktop.org/mbrost/xe-kernel-driver-system-allocator/-
> > /commit/d2371e7c007406fb5e84e6605da238d12caa5c62
> > [6] https://gitlab.freedesktop.org/mbrost/xe-kernel-driver-system-allocator/-
> > /commit/91cf8b38428ae9180c92435d3519193d074e837a
> > 
> > > When I worked on system allocator HLD, I pictured the invalid vma concept also.
> > But somehow Matt was able to make it working without such concept....
> > >
> > 
> > Oak:
> > 
> > Still unclear on this. Maybe we can chat offline to clear this up.
> > 
> > Matt
> > 
> > > Oak
> > >
> > > > Thoughts, comments?
> > > >
> > > > Thanks,
> > > > Thomas
