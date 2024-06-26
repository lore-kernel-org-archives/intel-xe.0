Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB7CCC27C4F
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jun 2024 07:58:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F72E10E7B0;
	Wed, 26 Jun 2024 07:58:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I2+hKihH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43C7910E7AF
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jun 2024 07:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719388699; x=1750924699;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=vfuJXQ/dUGQvQN8NsjC6HRq7ezYR2BHMucMRqh4zOXc=;
 b=I2+hKihHAXf6sxaX+yOr4fs/VNOthqcVkd1NXv922hAtYu1v+OR6WSZL
 hkQYBBBA+/kc/3lOqDx8lPYUsBkCmAIXQ/cAyZHDEoTosr6/TqvMehkEX
 UiPJtMu1NWlDfzc3t61y+/SvylS7+r0MVK3DXhIMcGR8UOm52eCzkad4m
 EEs/KWdsduGU8UCpAGZnRSWIoBoFyJDTOfVTvF5G1JsvvUvo9E7HbV/ie
 coakQ4IwTR0CXZjQYumPS5rRr78dtjHTRAlMOoD5AJZ/NsuTva6Z8Lky0
 jpRntmFiUwIMOZk/kYdzqfYzwrgleBRM1XIagwmYOEVCWtfKMkYdekaTz Q==;
X-CSE-ConnectionGUID: IWIs0ITyRuy+ZjrntXcybg==
X-CSE-MsgGUID: fAyRS75aTNKwLnc38fX6jw==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="16267783"
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; d="scan'208";a="16267783"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 00:58:19 -0700
X-CSE-ConnectionGUID: wVcFId+QQ3u35MnL7+n84w==
X-CSE-MsgGUID: qaYerjqWST2OcJP6+ZMwHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; d="scan'208";a="48297202"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jun 2024 00:58:18 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 26 Jun 2024 00:58:18 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 26 Jun 2024 00:58:18 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 26 Jun 2024 00:58:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mVhJ4Gb92sjSo6UhJH3war0dGnB8yLPxiY38YChs/Kld5gPH+ROpoXEf8tTw2s4yYgodSLqgjZMduEwTeUKIXynpeUGZALk7Nf/Sm6NFkBoWL+d4fLE5E+udCdFugSGMObPGLl+jZkHDS7xQ5JddGMwFl9rF1vPF2/QLsY7tZvD1yLx69TFlFue835XG4jl5hglPhjv4EeeETtYCTX//vdY6fYKjNZaQz2BgZ6vV5jROSCpKGPx8pPUJ8WYCAyKcqyYSkMytHe9t8+0rx1Ysj+3+RrOc2CfAhkv/dW3BD0olgcgJqDmTNLuBfYtnkW4QdoXctrocWMS7Rmvk01RuvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SF9fFW1IFxp6LUN/YnQbkhjNduCmn+YXrulXHAulLUw=;
 b=DmrGm6EZl8WwUCcjS4NpjHbrFXrGy+uDdnfpXBX2HE4UNj1uHiT44hn3AD4WMfhn4F4/9m5oZDI0AtmIIbjrfE75mu40m6pUZYE+ksYkJt1IZ+uQSHf+kbqksptiLFnMl+5uewJ/0sboOeXPSpzXP1HrESr9MsS6bHOevLA8nL1fudYe8WwylXFGY5iPMi4CTXpTzd89I8Qa1UkfLkGi2b3tOkLXoI+9KJMrqYyR7xFk4jSJBdEcq72x5q38aHKJFnsfgO3dFgm8c33tAuPYKMRSNSIYCcb5JXSsigv/27qVRHqwYfnK0zqK5uk3TNtACOpWwVTBjocqXHdrXn1pMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by DM6PR11MB4708.namprd11.prod.outlook.com (2603:10b6:5:28f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.34; Wed, 26 Jun
 2024 07:58:15 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.7698.025; Wed, 26 Jun 2024
 07:58:15 +0000
Date: Wed, 26 Jun 2024 07:57:37 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Nirmoy Das <nirmoy.das@linux.intel.com>
CC: Nirmoy Das <nirmoy.das@intel.com>, <intel-xe@lists.freedesktop.org>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH] drm/xe/guc: Configure TLB timeout based on CT buffer size
Message-ID: <ZnvJ8XveDAEQbWhQ@DUT025-TGLU.fm.intel.com>
References: <20240625084947.30869-1-nirmoy.das@intel.com>
 <ZntAuUNTiHbYENzS@DUT025-TGLU.fm.intel.com>
 <f9bec61b-dafe-4762-9f69-2a3d403fd825@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <f9bec61b-dafe-4762-9f69-2a3d403fd825@linux.intel.com>
X-ClientProxiedBy: BYAPR05CA0069.namprd05.prod.outlook.com
 (2603:10b6:a03:74::46) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|DM6PR11MB4708:EE_
X-MS-Office365-Filtering-Correlation-Id: ddb60e50-6f35-4b64-4178-08dc95b5bb94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230038|376012|1800799022|366014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dRcL/DSEnFGoLTwmpcFAOP8rox/SHYha3+ehihgxkCDj1FbTN7aAdZUhBHp3?=
 =?us-ascii?Q?4IHCGER7PdX5n1qhznfuqHBHDKG6UUW45PUX7p+DyEIfQnOvS1UaYjLEaiUQ?=
 =?us-ascii?Q?VShi1YnYJVhHe8mivzMArrMMJOAyRITxjXZf14E4ERG9UoWzSmdk8TPIn9WZ?=
 =?us-ascii?Q?OyovdQjGwLhy3l6/S9qQDT/fZuupohmG0CrPl7IpqpaVjBNSCa/gOZkYmX72?=
 =?us-ascii?Q?vP+QnOFqxwtoxpU99dSmmwnWNUbdd6vXsFFAR6c84tOuzItJ5nRQIHVtL0nH?=
 =?us-ascii?Q?LCLZxuTXYFhlzdcqfgvtldT6SIYpoTFwsJjr63/GHnP6p6dke4+bzmyMKMxE?=
 =?us-ascii?Q?R6ODRzre5E6kpefqqUJm7gmpDEMIEBiuuLbZ/zIB+3tui+5FQ41NedKD1XR7?=
 =?us-ascii?Q?LJD7G/IEkjo6Y6BLLx1Uqvl6yhQwPKJ6e1E/NWtXojuwz3DVeaxDMr6Nx188?=
 =?us-ascii?Q?JHxVAHd6kbgb9+DE2EdSA4cPGdGgyOqmvSt86OkYTF+Y6rdbss1okBYXJI9E?=
 =?us-ascii?Q?qghVDdkyHjl2LJHLOxAToHMD0toZA5ppauPiRWKPBwbveJzM2tUNr/xtNP0X?=
 =?us-ascii?Q?idhaCkPq2ea1W6MFHuZuhFOtddqDcfMqt6vbp0HZTl0GDe+f285CAmIO5jUi?=
 =?us-ascii?Q?6+3WTU5h9lU5R7gb5Tjg4VN2H6u4YtzGisfOjKbdlIWvWxyZX83MMvX1IqFS?=
 =?us-ascii?Q?Vsy5fsFXCg+ykK9RSQTHWSdWEckRg0vEXAktL35ThK9aFHhXaXWfrdic7arQ?=
 =?us-ascii?Q?geRFoTF3LyiJjpixEINf8vOm9Lqpdzm5TosfGoMFnGi59dj4l/TznwX1XZan?=
 =?us-ascii?Q?5a6FRiysOWwkznYcFU53vcVns+HSHi6hdkl5vF8DalU+rw0SgqGvH1WUnmRG?=
 =?us-ascii?Q?xnz0qCtBB5dARjZJwJvzMC6EgpskuLYc7gZQsviusWdwAH4YhQDa0/SBaknq?=
 =?us-ascii?Q?S/7bEj+FjIKFz1kt7VCx5ME1rEy+Oqj0JJPGU71sfJG9TCxvhOJKwkFiATgs?=
 =?us-ascii?Q?gidwJ8sWsABSqGO6tTOilQHy34aZQW81v9Kxk5eM892RV+qdZ1ZirAPyqi+c?=
 =?us-ascii?Q?mmCd9gwPffQcu5uC6G/f3K2gbgA2wurJuUPy7yrbQ7I2P3aywwcHWID0eeHT?=
 =?us-ascii?Q?te71AShaUx3zEEW/QKY7o/UhSCTm2sqGAsZtnR3WgZPKokIXcrpeKRla5/80?=
 =?us-ascii?Q?iCe1aIIaPXJZLv8XYUO3ZyZh+s7JsQikjJqkm6rbNZQuxfrWaziTCqw7Fy1O?=
 =?us-ascii?Q?cXHqNRrgYnzpISstXvJ2CHsQmANoJZwbaxL8q0LQnYege15IC/qhZ5g4swZo?=
 =?us-ascii?Q?5C0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230038)(376012)(1800799022)(366014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MPF/NcEWbBrxVq+VU/RHrBuJVvtvRXOV2CpU6/SH7rxRUUoXi/phN550KvJX?=
 =?us-ascii?Q?L2LjLUdtjMeqs60xqhQ9csQ1eijhwu8M0Y4OaJzix/N/MNHNbrtpnFPN+zyR?=
 =?us-ascii?Q?JTD94GmW/S+43uh8cYoyF+jMakDUvvR70u8GoxIeungKRfYNNhNLe5wNGVBZ?=
 =?us-ascii?Q?+dcGduaOBUvHJuOxDAHhPhfd8QzYwrPT4qsJRSCruxOxcSt9Y8Kog2Axb3fI?=
 =?us-ascii?Q?vXml7UcicFyXMwymPCtBWX8kVFLsmlfNxX/NKza4khG/zJpTAYgjHmf5PqOE?=
 =?us-ascii?Q?QKZ5xyQsW7MMNIyMhnYioifgk2HIfmwS98LOic4IsAGB4N+RAPwjgJ7f4270?=
 =?us-ascii?Q?VVuNU8YRqzLmtgWSvm14Z9cdTdBaZ6/WNZBaYvocbSulSAMa5aVK0nySpibS?=
 =?us-ascii?Q?1zqgqS1D/vl7glywzAgSQ3C3STkvEQ1WNG/RXYNccuJ2ta8cRtjyEWgUpl6d?=
 =?us-ascii?Q?ApVbI+/P0Hkfsc30UQQJ8csKmG0ZIZwSubxMryoLMGbW7x55nHfvdpCGlma3?=
 =?us-ascii?Q?xMSBE1JiR/Ei07r+6vZLjBtk2ZuxQSTmliFpU2Rv4K9RQXrmM6jwkxPvB6xY?=
 =?us-ascii?Q?cjkIWskLSd18b9tRAHrUe06Z/PADCUoq8kg4B/ST56Jj7muPbz5lig7weLK8?=
 =?us-ascii?Q?m2r0ATLrcOfFkdrDXsd4f3MqvAuRr/wo9Cux+xvfnZdM/h/zv0npV6TfmKwx?=
 =?us-ascii?Q?tPsGhOjwnBEnHgfSad6eeWImduzkf0Fd9bjA9Fth6levDOeipbjSGF74FzIr?=
 =?us-ascii?Q?5sQOlCTX79fI57NZSgoyRV0n2OMIF7LSlVxat6QTifwiHIIJp8yTMGo4JB3F?=
 =?us-ascii?Q?ubgSbLeUY2XmpdG5JsjCt2Caxo85Gyk1wn6BWtkVSqdNz1m+WFGt/LyUk8bB?=
 =?us-ascii?Q?yZAMNWo7WYiqG5xwP8AKOG54eL+D27WPP3xNOmvp99UcLnXKVotu6fItM4Wt?=
 =?us-ascii?Q?ynC6L4ZGFaGF7jzjYmsrUSmeAq4eyjsIP3cvndoYufzMAprqswYi8BIGXaeQ?=
 =?us-ascii?Q?3J/AF5FAdJxuWRwYxzUejXDXJGp2Z26HpwW1kJL0IsMBHT4xh6iWnkUjrAz2?=
 =?us-ascii?Q?mcPqi1NYwa49ayJ1AZxEBJOACqij6JSMmbByUTsHJaP/BsL/USVix1n6v3va?=
 =?us-ascii?Q?QbEGZ/XBZP3PlUPR4mB2xdDXcB6WaSPuxDZOnGEexwGcm75a6xEp4+aV3tvo?=
 =?us-ascii?Q?4bt39trpu+P5VMJsP9cNi8LbGOOPsoNmk/h8+FqqrPAmsD5zk9ecDDJERS4O?=
 =?us-ascii?Q?UNKR6ZM9vh5GQMPt9UXQY1FWJhLBxFV/llmAjR8meGuGFrqby6gAjIUhhNhS?=
 =?us-ascii?Q?2g/7UiwgjCxHON+H2BMhFinvfzy/eqUx1nPhGPkr2Ajue65S4vZ9IXrfLTPH?=
 =?us-ascii?Q?/yKqQvdsP7+NQyXuo32HC80PxzWrLg3crytYnubrsF16rk6uGDDTBVwQvEx6?=
 =?us-ascii?Q?BfXcGJHnS2mnsuoZ5JESEpVIw6xDg4n8hOdJO3Cx2Iwdtz6mo/LAiNROzsBw?=
 =?us-ascii?Q?QufHJ+GWx70GuWkj0QxESYdaLyPVX0WNzPpKCwokDpQDzRqqv6QH9cW1o5O7?=
 =?us-ascii?Q?uRWpJ5f95f1AJualRsK937QCneI59e2jhBwguJ0sYErFVvugKl+6uMM2qB1y?=
 =?us-ascii?Q?Gg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ddb60e50-6f35-4b64-4178-08dc95b5bb94
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2024 07:58:14.9190 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kroaGCuwDFj+k/r+mLi9MioLiOgX0tWHiYQJAXg0oy/PqD3KhXKJJx0N4i5zTzLqjNOjuVdYM95WqWSpW/DE+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4708
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

On Wed, Jun 26, 2024 at 09:33:46AM +0200, Nirmoy Das wrote:
> Hi Matt,
> 

Missed a few questions.

> On 6/26/2024 12:12 AM, Matthew Brost wrote:
> > On Tue, Jun 25, 2024 at 10:49:47AM +0200, Nirmoy Das wrote:
> > > GuC TLB invalidation depends on GuC to process the request from the CT
> > > queue and then the real time to invalidate TLB. Add a function to return
> > > overestimated possible time a TLB inval H2G might take which can be used
> > > as timeout value for TLB invalidation wait time.
> > > 
> > Not reviewing this patch as some reviews seem to be inflight, just
> > adding some thoughts. I will say that this patch looks correct as a
> > short term fix.
> > 
> > Longterm I think we need explore coalescing TLB invalidations targeting
> > the same VM when pressure exists (VM bind case, [1] should help here
> > a bit) or
> 
> I assume you mean to queue tlb requests in kernel for sometime and then
> coalesce before sending.
> 
> 
> >   optimize out invalidations
> What do you mean ? Queue ggtt invalidation and send only one ?

We currently issue a GuC GGTT TLB invalidation anytime we make change
the GGTT mappings but I don't think this is strickly required. I have to
dig up how optimized this avoid issuing GGTT invalidations, conceptually
I think the idea was right but my implementation was buggy so just
dropped it. We could try that approach again. 

We also could additionally use the water mark + coalescing approach I
sent in the previous reply too but in this case rather coalescing in a
VM it would in a GGTT.

> >   (GGTT case, at one point I had
> > logic in for this but pulled it out as it was buggy).
> > 
> > I say this because when debugging [2] I found that lots of TLB
> > invalidations can overwhelm the GuC to the point where it can barely
> > make forward progess on submissions.
> This sounds very serious!

Potentially, this is a synthetic IGT. Maybe in real workloads it is a
non-issue but certainly this shows how lots of TLB invalidations can be
problematic.

Matt

> > The former is likely a fairly large refactor, while the latter shouldn't
> > be too difficult.
> > 
> > Something for us to keep in mind as a group.
> 
> Created https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2162 to track
> it.
> 
> 
> Thanks,
> 
> Nirmoy
> 
> > 
> > Matt
> > 
> > [1] https://patchwork.freedesktop.org/series/133034/
> > [2] https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/799#note_2449497https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/799#note_2449497
> > 
> > > Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1622
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Suggested-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> > > Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |  2 +-
> > >   drivers/gpu/drm/xe/xe_guc_ct.c              | 12 ++++++++++++
> > >   drivers/gpu/drm/xe/xe_guc_ct.h              |  2 ++
> > >   3 files changed, 15 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > > index e1f1ccb01143..fa61070d6201 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > > +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > > @@ -17,7 +17,7 @@
> > >   #include "xe_trace.h"
> > >   #include "regs/xe_guc_regs.h"
> > > -#define TLB_TIMEOUT	(HZ / 4)
> > > +#define TLB_TIMEOUT	xe_guc_tlb_timeout_jiffies()
> > >   static void xe_gt_tlb_fence_timeout(struct work_struct *work)
> > >   {
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > index b4137fe195a4..e30c0da86acc 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > @@ -112,6 +112,18 @@ ct_to_xe(struct xe_guc_ct *ct)
> > >   #define CTB_G2H_BUFFER_SIZE	(4 * CTB_H2G_BUFFER_SIZE)
> > >   #define G2H_ROOM_BUFFER_SIZE	(CTB_G2H_BUFFER_SIZE / 4)
> > > +/**
> > > + * xe_guc_tlb_timeout_jiffies - Calculate the maximum time to process a tlb inval command
> > > + *
> > > + * This function computes the maximum time to process a tlb inval H2G commands
> > > + * in jiffies. A 4KB buffer full of commands takes a little over a second to process,
> > > + * so this time is set to 2 seconds to be safe.
> > > + */
> > > +long xe_guc_tlb_timeout_jiffies(void)
> > > +{
> > > +	return (CTB_H2G_BUFFER_SIZE * HZ) / SZ_2K;
> > > +}
> > > +
> > >   static size_t guc_ct_size(void)
> > >   {
> > >   	return 2 * CTB_DESC_SIZE + CTB_H2G_BUFFER_SIZE +
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> > > index 105bb8e99a8d..a9755574d6c9 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> > > +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> > > @@ -64,4 +64,6 @@ xe_guc_ct_send_block_no_fail(struct xe_guc_ct *ct, const u32 *action, u32 len)
> > >   	return xe_guc_ct_send_recv_no_fail(ct, action, len, NULL);
> > >   }
> > > +long xe_guc_tlb_timeout_jiffies(void);
> > > +
> > >   #endif
> > > -- 
> > > 2.42.0
> > > 
