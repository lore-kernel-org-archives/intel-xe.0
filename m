Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8480EC54E60
	for <intel-xe@archiver.kernel.org>; Thu, 14 Mar 2024 20:50:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27DD810FDAA;
	Thu, 14 Mar 2024 20:50:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dDTAo71b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D472510FDAA
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Mar 2024 20:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710449407; x=1741985407;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=MpIuFpUuwKF8k18vb+yDewD7aqxXP5exikfHh+tNQ+k=;
 b=dDTAo71bvQIA7UF3DT+loFFdxJiXVI247o9MiD8hPVei2E1OlR6Ro/ng
 XfK/XLqLN7KWju1bNIxtRfMXVyAKBoT/x+EQg4lpql8cLecvSWq0vW6u7
 Z2GW3tVDRKKTFTDVKO7Ydhnvy9QN7kbKG9nyOJZuD155heMG/vEAqbXLd
 1Eih46NHFcxF4IxZ+eXeOPXfThjlkGb51OMB34XX01IUqAIzmPrpUOqIR
 B5pENg833cTO8gxowUM3DFO+nfzq8XBmW3viXspxLRfgjPK3Z3SlX2Ogk
 Ktk2azQEVGHeifBMQ/Lq9A+wpnOW45Ndy/dvhN/T47rslxr6yYku0rMg1 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="5426344"
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; 
   d="scan'208";a="5426344"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 13:50:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; d="scan'208";a="17017971"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Mar 2024 13:50:07 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Mar 2024 13:50:06 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Mar 2024 13:50:05 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 14 Mar 2024 13:50:05 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 14 Mar 2024 13:50:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j7fPIQqUKBVgNDhe+hi6mOUMvVhbtBR4GuAcEbwzODBZUDcQabPl8mdnY2fAaG10KYtNdlym6J7CGo8d/4b5nQaptC92F6b0ASQamQ2VC/Q+aJ4Gf9a6S/mT6BU/wKTbBLQyp/9pLwlxGH6lWqi2RQwCEka8zUcCQGoLlYhN5JvFnHvMLUrs3/9v9GJelQmtwHCSRw8HNk8HzpjX8KPjsTzsJQHzw6F4ia8HTxS94/5N6xkFYMQwH4Za1+0EaTjERkUmsC2kCi3yzRAE638mNXEW+Yep+FDzGvRPjX/lHdL8t4mTygbCvqYIDobsUP3ps0X1/iVuE9TgoUGf1s/bRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iigErQRWGr7sgHIbMCclVqhZncEHapwQft8nMSvqBiY=;
 b=LZewS9VKn6/IDGq/ruhzAexIDSr6KVb2r9LWhToW0VwLXIIn43bDO2nAc7UjVq4GJhg8/mUu3gbiTXsfyt0A8mu9WF2ut5f1H4asF4/Y3dDWGdN40Iv5lYhtcZJsL08q2zbgWNRoest3cc5jVDIQ3niNBB4fR/cC90uaY77zN3wBnkuFaesHtyr8fBOdiPr9rjbgEPbDBkcj47jGPauEbBo6aWHgQciltOJ4mw1c+JqaZkk2FDZiIx61j88YWaplXm9b1OMVXjZ20fhJuDF4JUA7fXFeqWgFMjV+sRH8/n7OhIvtyJld/DFkOghhgkN6GxgkDL0QnSwsJOlOLUDeBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW3PR11MB4633.namprd11.prod.outlook.com (2603:10b6:303:5b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.13; Thu, 14 Mar
 2024 20:50:03 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7386.017; Thu, 14 Mar 2024
 20:50:03 +0000
Date: Thu, 14 Mar 2024 20:49:07 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Zeng, Oak" <oak.zeng@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Hellstrom, Thomas" <thomas.hellstrom@intel.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "Welty, Brian" <brian.welty@intel.com>, "Ghimiray, Himal
 Prasad" <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH 1/5] drm/xe/svm: Remap and provide memmap backing for GPU
 vram
Message-ID: <ZfNiw+M8ClCaR9Xn@DUT025-TGLU.fm.intel.com>
References: <20240314033553.1379444-1-oak.zeng@intel.com>
 <20240314033553.1379444-2-oak.zeng@intel.com>
 <ZfMxR/YHY/LP88KZ@DUT025-TGLU.fm.intel.com>
 <SA1PR11MB6991042C806081949493087592292@SA1PR11MB6991.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <SA1PR11MB6991042C806081949493087592292@SA1PR11MB6991.namprd11.prod.outlook.com>
X-ClientProxiedBy: BY5PR20CA0030.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::43) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW3PR11MB4633:EE_
X-MS-Office365-Filtering-Correlation-Id: 159758e0-200c-4cac-6d94-08dc44685249
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KY5+XYEwtTKB74xPt1DeikhsTumHbu8LmlSUpvJIFV2d4urcoqAIx8imZht0sLae3X0ZyH7+ETQc/dlvM+ilRKNPQdJw+BYTjjCKcp6GmqtnOsY76AFXwE0a6zXQevqTWAFIevovgKeJxaro+WCCFyd0yTAJwLO5ZpItvWOEcWL2YDFpwjJ/jNRfCED4qVgVLfidsCBkmnZwJS9zYz/wIFjJMX2sU8nKnMKzCiqD8ZRuzsHKDEEb4hbAYyJ7W+HpC1RoyNT1kjkPmoNGPGj+tT7L+fm1IPe8PhwrPyffH4oTw1gC0/Ygo9REpEc480EOtsDtE1OZYKZtG5DjEFd9eVTS07CTPXDPdQ7E5OAbPcj8Upfo7xrLEieKwf82TQH2MtNeZ7LTI/BCMppipVu5JemgYh8TtjYn491uXeXqhZsUyUvU1pQ3j/z+xxvoYQfQZQy+cBipykKmzdWndIba/5DTHeSMdT4zCp/uEAGlOu5p3ditVLHnF1gx4eqHGFJ/IR8YOtUeE5mgATSxPKy2xUSwHktboRgRC2gRHRMessZHZD/dz2yqq/ifS1DHNtOhATwKMz1cDTH+USkrV2EvOhWBc0x/G28zJwCWxQA1x58=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?qP/+QZEMVYQG+v9X5NWiBot+XMrh7zlirAWiJlZR42TrkwQgdFSsFter13?=
 =?iso-8859-1?Q?NrMe/QkNG+g+8JcihMdpURJ87S8zBjSeWyxi0ovGMUJxmNHCL6UgTBKOKM?=
 =?iso-8859-1?Q?T7E0kRsjxrJU8Z33DuaLrZTCtDBZXBAiKUf3DoMrGABhLXOihqrVhgcvp4?=
 =?iso-8859-1?Q?4dUMj4WHnheS+/bYWwk4loeh6i3xPxFkGgsZWN0u01QF+7g+rPfQAVcgdI?=
 =?iso-8859-1?Q?rJ3RWS8109W72Ypjw8q16PYFTSHgOjY33QH6YVAnyK+LP96uLoM5nyjWNe?=
 =?iso-8859-1?Q?BfK4rebsDJcY3WNUfCHQbLayLmsiS2FguLouINvEdcm7tmzR7RhNhg4g8J?=
 =?iso-8859-1?Q?hZ4vOPyB1MD76X7DowH4H/rRjIyLaN7RUDdcXvOYT1rJhHr8204CWB4rLI?=
 =?iso-8859-1?Q?LEx283DOV3p5kfBGfGUfNx3QMOP0S5laVcWnGiQ+YFm8brr6bkCsY6KIWg?=
 =?iso-8859-1?Q?xwEp0pBgkwgGU4Qs5j8lgsXS00b50tpcxw+kUEZNuJtJEbiuvsVBAyBrdp?=
 =?iso-8859-1?Q?G24weuzGBsE7jCFawKCxPbs/kZXMmCQDATDRJjxIZv9IQ8/+/Id5er9fLy?=
 =?iso-8859-1?Q?WeqJ/Uo7tt/hWhEwlwzgV8iglDkG38YlUqeZ3MnHWz6qaeIhVAFQIDGuK7?=
 =?iso-8859-1?Q?4DYED9X9m0s3S1f1dbqV1amGEymbzDxkztMxa81PXiEhOTZZbz1pGASNtT?=
 =?iso-8859-1?Q?gGOSpaUUnGaElhDCElhGdGmh1LkUVhqmWIbBntIDGIY+gliulHMQPVEQMh?=
 =?iso-8859-1?Q?23ekJpSb5PrYd16s+rfL1vooITFvHUE6xZm7O4aiHx0b+zq2fKEqn7IBqO?=
 =?iso-8859-1?Q?JTlEYP33YRfC9cuRjC2RJzLOL4jLwRbdlz5zKeg/XwwKzhRZfaFq8+3cK+?=
 =?iso-8859-1?Q?jKh5h/XWimGwlVnWB7Q1z9gfzkwTTDoIKg3weoKkr5RA8fF25YWT3s9Ro3?=
 =?iso-8859-1?Q?hHDn8idHfgrEovITVo7J17RPPMbp6RLV4JmeziYcJXGARAxyqD2hFomVBM?=
 =?iso-8859-1?Q?KiCZ+ijnRpQ0ix8NNVLDwPi4VMS+O08wd27XxT7M1x5E67rk5aNWtepScE?=
 =?iso-8859-1?Q?w4dMNi1GXkR4h2LsQfhRt2UJ2gohKJQ1dbjL37osNHorpgB2nctiE2vAqT?=
 =?iso-8859-1?Q?YMmtogQXwPvulDQOE6vVU9Zjmn9lOe8dGPrxXlmvomcmJmN4Dy1qU6pP/J?=
 =?iso-8859-1?Q?OVtblRLp9LwnlPZZCdE2IwIFKXq4ruufIPuCzt+s6B+vnweb70waJW4RMZ?=
 =?iso-8859-1?Q?A7kXakVyugPJ0ZAcz+D8HBEJfTrdtxnMjoOeCshLLInHnFcMf3rUoVitec?=
 =?iso-8859-1?Q?Ar5nfoyXCeW+b23A7Qfy+V6aAGU2e2U5kEz1F6fpWqjJjYvRGJC3agllTk?=
 =?iso-8859-1?Q?t0dqSR0pCIOYqP/axta5sOJnFv63Cclwu4H/iGlmw1CsqCkHnPlfHCI0ay?=
 =?iso-8859-1?Q?gdxUDisLdeGhNQHoXBooeG0s2lQXYmN0EnPY0KNRrkQNp8E9MCsjHMAtKz?=
 =?iso-8859-1?Q?7ek9gGL+cqhe8ZdmjZJX5+hi3Ny5/tkKgOYH+U7dm/RCCDpS81FhCD+Bg0?=
 =?iso-8859-1?Q?q7C3XZIrvOFFJGQVrIf/w6Vflk8q9eRu/ztDNbzWC6soWxR1iaRgZ9IU3g?=
 =?iso-8859-1?Q?89XfRU0j7uPpZQgDyXcH6dS54SkOUz69KhD0GrqX6BqLoki/nUwS/1IA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 159758e0-200c-4cac-6d94-08dc44685249
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2024 20:50:02.9432 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oSrRR8EA1u/V17b3iaJoHxaVqovZH7euJyrA3ffrJdbh/MHqSRx2M6K5LgLz+IA1xPJCd6ZmVoHb1AZCmTgkOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4633
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

On Thu, Mar 14, 2024 at 12:32:36PM -0600, Zeng, Oak wrote:
> Hi Matt,
> 
> > -----Original Message-----
> > From: Brost, Matthew <matthew.brost@intel.com>
> > Sent: Thursday, March 14, 2024 1:18 PM
> > To: Zeng, Oak <oak.zeng@intel.com>
> > Cc: intel-xe@lists.freedesktop.org; Hellstrom, Thomas
> > <thomas.hellstrom@intel.com>; airlied@gmail.com; Welty, Brian
> > <brian.welty@intel.com>; Ghimiray, Himal Prasad
> > <himal.prasad.ghimiray@intel.com>
> > Subject: Re: [PATCH 1/5] drm/xe/svm: Remap and provide memmap backing for
> > GPU vram
> > 
> > On Wed, Mar 13, 2024 at 11:35:49PM -0400, Oak Zeng wrote:
> > > Memory remap GPU vram using devm_memremap_pages, so each GPU vram
> > > page is backed by a struct page.
> > >
> > > Those struct pages are created to allow hmm migrate buffer b/t
> > > GPU vram and CPU system memory using existing Linux migration
> > > mechanism (i.e., migrating b/t CPU system memory and hard disk).
> > >
> > > This is prepare work to enable svm (shared virtual memory) through
> > > Linux kernel hmm framework. The memory remap's page map type is set
> > > to MEMORY_DEVICE_PRIVATE for now. This means even though each GPU
> > > vram page get a struct page and can be mapped in CPU page table,
> > > but such pages are treated as GPU's private resource, so CPU can't
> > > access them. If CPU access such page, a page fault is triggered
> > > and page will be migrate to system memory.
> > >
> > 
> > Is this really true? We can map VRAM BOs to the CPU without having
> > migarte back and forth. Admittedly I don't know the inner workings of
> > how this works but in IGTs we do this all the time.
> > 
> >   54         batch_bo = xe_bo_create(fd, vm, batch_size,
> >   55                                 vram_if_possible(fd, 0),
> >   56                                 DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> >   57         batch_map = xe_bo_map(fd, batch_bo, batch_size);
> > 
> > The BO is created in VRAM and then mapped to the CPU.
> > 
> > I don't think there is an expectation of coherence rather caching mode
> > and exclusive access of the memory based on synchronization.
> > 
> > e.g.
> > User write BB/data via CPU to GPU memory
> > User calls exec
> > GPU read / write memory
> > User wait on sync indicating exec done
> > User reads result
> > 
> > All of this works without migration. Are we not planing supporting flow
> > with SVM?
> > 
> > Afaik this migration dance really only needs to be done if the CPU and
> > GPU are using atomics on a shared memory region and the GPU device
> > doesn't support a coherent memory protocol (e.g. PVC).
> 
> All you said is true. On many of our HW, CPU can actually access device memory, cache coherently or not. 
> 
> The problem is, this is not true for all GPU vendors. For example, on some HW from some vendor, CPU can only access partially of device memory. The so called small bar concept.
> 
> So when HMM is defined, such factors were considered, and MEMORY_DEVICE_PRIVATE is defined. With this definition, CPU can't access device memory.
> 
> So you can think it is a limitation of HMM.
> 

Is it though? I see other type MEMORY_DEVICE_FS_DAX,
MEMORY_DEVICE_GENERIC, and MEMORY_DEVICE_PCI_P2PDMA. From my limited
understanding it looks to me like one of those modes would support my
example.

> Note this is only part 1 of our system allocator work. We do plan to support DEVICE_COHERENT for our newer device, see below. With this option, we don't have unnecessary migration back and forth.
> 
> You can think this is just work out all the code path. 90% of the driver code for DEVICE_PRIVATE and DEVICE_COHERENT will be same. Our real use of system allocator will be DEVICE_COHERENT mode. While DEVICE_PRIVATE mode allow us to exercise the code on old HW. 
> 
> Make sense?
>

I guess if we want the system allocator to always coherent, then yes you
need this dynamic migration with faulting on either side.

I was thinking the system allocator would be behave like my example
above with madvise dictating the coherence rules.

Maybe I missed this in system allocator design but my feeling is we
shouldn't arbitrarily enforce coherence as that could lead to poor
performance due to constant migration.

> 
> > 
> > > For GPU device which supports coherent memory protocol b/t CPU and
> > > GPU (such as CXL and CAPI protocol), we can remap device memory as
> > > MEMORY_DEVICE_COHERENT. This is TBD.
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
> > >  drivers/gpu/drm/xe/Makefile          |  3 +-
> > >  drivers/gpu/drm/xe/xe_device_types.h |  9 +++
> > >  drivers/gpu/drm/xe/xe_mmio.c         |  8 +++
> > >  drivers/gpu/drm/xe/xe_svm.h          | 14 +++++
> > >  drivers/gpu/drm/xe/xe_svm_devmem.c   | 91
> > ++++++++++++++++++++++++++++
> > >  5 files changed, 124 insertions(+), 1 deletion(-)
> > >  create mode 100644 drivers/gpu/drm/xe/xe_svm.h
> > >  create mode 100644 drivers/gpu/drm/xe/xe_svm_devmem.c
> > >
> > > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > > index c531210695db..840467080e59 100644
> > > --- a/drivers/gpu/drm/xe/Makefile
> > > +++ b/drivers/gpu/drm/xe/Makefile
> > > @@ -142,7 +142,8 @@ xe-y += xe_bb.o \
> > >  	xe_vram_freq.o \
> > >  	xe_wait_user_fence.o \
> > >  	xe_wa.o \
> > > -	xe_wopcm.o
> > > +	xe_wopcm.o \
> > > +	xe_svm_devmem.o
> > 
> > These should be in alphabetical order.
> 
> Will fix
> > 
> > >
> > >  # graphics hardware monitoring (HWMON) support
> > >  xe-$(CONFIG_HWMON) += xe_hwmon.o
> > > diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> > b/drivers/gpu/drm/xe/xe_device_types.h
> > > index 9785eef2e5a4..f27c3bee8ce7 100644
> > > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > > @@ -99,6 +99,15 @@ struct xe_mem_region {
> > >  	resource_size_t actual_physical_size;
> > >  	/** @mapping: pointer to VRAM mappable space */
> > >  	void __iomem *mapping;
> > > +	/** @pagemap: Used to remap device memory as ZONE_DEVICE */
> > > +    struct dev_pagemap pagemap;
> > > +    /**
> > > +     * @hpa_base: base host physical address
> > > +     *
> > > +     * This is generated when remap device memory as ZONE_DEVICE
> > > +     */
> > > +    resource_size_t hpa_base;
> > 
> > Weird indentation. This goes for the entire series, look at checkpatch.
> 
> Will fix
> > 
> > > +
> > >  };
> > >
> > >  /**
> > > diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> > > index e3db3a178760..0d795394bc4c 100644
> > > --- a/drivers/gpu/drm/xe/xe_mmio.c
> > > +++ b/drivers/gpu/drm/xe/xe_mmio.c
> > > @@ -22,6 +22,7 @@
> > >  #include "xe_module.h"
> > >  #include "xe_sriov.h"
> > >  #include "xe_tile.h"
> > > +#include "xe_svm.h"
> > >
> > >  #define XEHP_MTCFG_ADDR		XE_REG(0x101800)
> > >  #define TILE_COUNT		REG_GENMASK(15, 8)
> > > @@ -286,6 +287,7 @@ int xe_mmio_probe_vram(struct xe_device *xe)
> > >  		}
> > >
> > >  		io_size -= min_t(u64, tile_size, io_size);
> > > +		xe_svm_devm_add(tile, &tile->mem.vram);
> > 
> > Do we want to do this probe for all devices with VRAM or only a subset?
> 
> All

Can you explain why?

> > 
> > >  	}
> > >
> > >  	xe->mem.vram.actual_physical_size = total_size;
> > > @@ -354,10 +356,16 @@ void xe_mmio_probe_tiles(struct xe_device *xe)
> > >  static void mmio_fini(struct drm_device *drm, void *arg)
> > >  {
> > >  	struct xe_device *xe = arg;
> > > +    struct xe_tile *tile;
> > > +    u8 id;
> > >
> > >  	pci_iounmap(to_pci_dev(xe->drm.dev), xe->mmio.regs);
> > >  	if (xe->mem.vram.mapping)
> > >  		iounmap(xe->mem.vram.mapping);
> > > +
> > > +	for_each_tile(tile, xe, id)
> > > +		xe_svm_devm_remove(xe, &tile->mem.vram);
> > 
> > This should probably be above existing code. Typical on fini to do
> > things in reverse order from init.
> 
> Will fix
> > 
> > > +
> > >  }
> > >
> > >  static int xe_verify_lmem_ready(struct xe_device *xe)
> > > diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> > > new file mode 100644
> > > index 000000000000..09f9afb0e7d4
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/xe/xe_svm.h
> > > @@ -0,0 +1,14 @@
> > > +// SPDX-License-Identifier: MIT
> > > +/*
> > > + * Copyright © 2023 Intel Corporation
> > 
> > 2024?
> 
> This patch was actually written 2023 
> > 
> > > + */
> > > +
> > > +#ifndef __XE_SVM_H
> > > +#define __XE_SVM_H
> > > +
> > > +#include "xe_device_types.h"
> > 
> > I don't think you need to include this. Rather just forward decl structs
> > used here.
> 
> Will fix
> > 
> > e.g.
> > 
> > struct xe_device;
> > struct xe_mem_region;
> > struct xe_tile;
> > 
> > > +
> > > +int xe_svm_devm_add(struct xe_tile *tile, struct xe_mem_region *mem);
> > > +void xe_svm_devm_remove(struct xe_device *xe, struct xe_mem_region
> > *mem);
> > 
> > The arguments here are incongruent here. Typically we want these to
> > match.
> 
> Will fix
> > 
> > > +
> > > +#endif
> > > diff --git a/drivers/gpu/drm/xe/xe_svm_devmem.c
> > b/drivers/gpu/drm/xe/xe_svm_devmem.c
> > 
> > Incongruent between xe_svm.h and xe_svm_devmem.c. 
> 
> Did you mean mem vs mr? if yes, will fix
> 
> Again these two
> > should
> > match.
> > 
> > > new file mode 100644
> > > index 000000000000..63b7a1961cc6
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/xe/xe_svm_devmem.c
> > > @@ -0,0 +1,91 @@
> > > +// SPDX-License-Identifier: MIT
> > > +/*
> > > + * Copyright © 2023 Intel Corporation
> > 
> > 2024?
> It is from 2023
> > 
> > > + */
> > > +
> > > +#include <linux/mm_types.h>
> > > +#include <linux/sched/mm.h>
> > > +
> > > +#include "xe_device_types.h"
> > > +#include "xe_trace.h"
> > 
> > xe_trace.h appears to be unused.
> 
> Will fix
> > 
> > > +#include "xe_svm.h"
> > > +
> > > +
> > > +static vm_fault_t xe_devm_migrate_to_ram(struct vm_fault *vmf)
> > > +{
> > > +	return 0;
> > > +}
> > > +
> > > +static void xe_devm_page_free(struct page *page)
> > > +{
> > > +}
> > > +
> > > +static const struct dev_pagemap_ops xe_devm_pagemap_ops = {
> > > +	.page_free = xe_devm_page_free,
> > > +	.migrate_to_ram = xe_devm_migrate_to_ram,
> > > +};
> > > +
> > 
> > Assume these are placeholders that will be populated later?
> 
> 
> corrrect
> > 
> > > +/**
> > > + * xe_svm_devm_add: Remap and provide memmap backing for device
> > memory
> > > + * @tile: tile that the memory region blongs to
> > > + * @mr: memory region to remap
> > > + *
> > > + * This remap device memory to host physical address space and create
> > > + * struct page to back device memory
> > > + *
> > > + * Return: 0 on success standard error code otherwise
> > > + */
> > > +int xe_svm_devm_add(struct xe_tile *tile, struct xe_mem_region *mr)
> > 
> > Here I see the xe_mem_region is from tile->mem.vram, wondering rather
> > than using the tile->mem.vram we should use xe->mem.vram when enabling
> > svm? Isn't the idea behind svm the entire memory is 1 view?
> 
> Still need to use tile. The reason is, memory of different tile can have different characteristics, such as latency. So we want to differentiate memory b/t tiles also in svm. I need to change below " mr->pagemap.owner = tile->xe->drm.dev ". the owner should also be tile. This is the way hmm differentiate memory of different tile.
> 
> With svm it is 1 view, from virtual address space perspective and from physical struct page perspective. You can think of all the tile's vram is stacked together to form a unified view together with system memory. This doesn't prohibit us from differentiate memory from different tile. This differentiation allow us to optimize performance, i.e., we can wisely place memory in specific tile. If we don't differentiate, this is not possible. 
>

Ok makes sense.

Matt

> > 
> > I suppose if we do that we also only use 1 TTM VRAM manager / buddy
> > allocator too. I thought I saw some patches flying around for that too.
> 
> Ttm vram manager is not in the picture. We deliberately avoided it per previous discussion
> 
> Yes same buddy allocator. It is in my previous POC: https://lore.kernel.org/dri-devel/20240117221223.18540-12-oak.zeng@intel.com/. I didn't put those patches in this series because I want to merge this small patches separately.
> > 
> > > +{
> > > +	struct device *dev = &to_pci_dev(tile->xe->drm.dev)->dev;
> > > +	struct resource *res;
> > > +	void *addr;
> > > +	int ret;
> > > +
> > > +	res = devm_request_free_mem_region(dev, &iomem_resource,
> > > +					   mr->usable_size);
> > > +	if (IS_ERR(res)) {
> > > +		ret = PTR_ERR(res);
> > > +		return ret;
> > > +	}
> > > +
> > > +	mr->pagemap.type = MEMORY_DEVICE_PRIVATE;
> > > +	mr->pagemap.range.start = res->start;
> > > +	mr->pagemap.range.end = res->end;
> > > +	mr->pagemap.nr_range = 1;
> > > +	mr->pagemap.ops = &xe_devm_pagemap_ops;
> > > +	mr->pagemap.owner = tile->xe->drm.dev;
> > > +	addr = devm_memremap_pages(dev, &mr->pagemap);
> > > +	if (IS_ERR(addr)) {
> > > +		devm_release_mem_region(dev, res->start, resource_size(res));
> > > +		ret = PTR_ERR(addr);
> > > +		drm_err(&tile->xe->drm, "Failed to remap tile %d memory,
> > errno %d\n",
> > > +				tile->id, ret);
> > > +		return ret;
> > > +	}
> > > +	mr->hpa_base = res->start;
> > > +
> > > +	drm_info(&tile->xe->drm, "Added tile %d memory [%llx-%llx] to devm,
> > remapped to %pr\n",
> > > +			tile->id, mr->io_start, mr->io_start + mr->usable_size,
> > res);
> > > +	return 0;
> > > +}
> > > +
> > > +/**
> > > + * xe_svm_devm_remove: Unmap device memory and free resources
> > > + * @xe: xe device
> > > + * @mr: memory region to remove
> > > + */
> > > +void xe_svm_devm_remove(struct xe_device *xe, struct xe_mem_region
> > *mr)
> > > +{
> > > +	/*FIXME: below cause a kernel hange during moduel remove*/
> > > +#if 0
> > > +	struct device *dev = &to_pci_dev(xe->drm.dev)->dev;
> > > +
> > > +	if (mr->hpa_base) {
> > > +		devm_memunmap_pages(dev, &mr->pagemap);
> > > +		devm_release_mem_region(dev, mr->pagemap.range.start,
> > > +			mr->pagemap.range.end - mr->pagemap.range.start +1);
> > > +	}
> > > +#endif
> > 
> > This would need to be fixed too.
> 
> 
> Yes...
> 
> Oak
> > 
> > Matt
> > 
> > > +}
> > > +
> > > --
> > > 2.26.3
> > >
