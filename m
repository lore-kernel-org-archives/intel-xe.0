Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6868BC10F1A
	for <intel-xe@archiver.kernel.org>; Tue,  7 May 2024 18:19:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A32910E93B;
	Tue,  7 May 2024 18:19:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="emcXyGal";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59D0310E93B
 for <intel-xe@lists.freedesktop.org>; Tue,  7 May 2024 18:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715105975; x=1746641975;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=7pv19uVRv1+vU6Dtr1vec01ZfxRFg1NuyLkKi/bc9p4=;
 b=emcXyGalx3n0hZ4ITLBNNQsodHOL1DYX3FJG96kdYj7Yhe0G3mOuJq7Q
 92xgtab6HyuTPSdRHxRRKTspP8IEdc7cTR7BH15d6sp83V/xxeXQpB7jt
 GmxImMbkPZlO8BbEobCD5bvAkRHF+3ZD6jpWuVDL0iwwzmwzgSAFsu1eu
 SIq4YIqZ2+t/fxHc4NdR7cny1M84YpPDN637C/ZQhVFmx/AHHW4XIaiQh
 zsNJbCcLv5hEpTi9mdyS7lUSq3V9To00Aw1cSOHwJ01fsTus8D8rhbZT/
 qiV6okwhiAp7QdvJ6OCX5RSRa3ipLUVXsv4BxD0UhRNLP0xD35t5eY1Rs w==;
X-CSE-ConnectionGUID: auSXOyIySoi2M6mxHw8RZQ==
X-CSE-MsgGUID: vi4SfX/xQSmn6sMvGfvxbw==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="14713524"
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000"; d="scan'208";a="14713524"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 11:19:35 -0700
X-CSE-ConnectionGUID: e3AsvuI8RUa5yxub+ye/1w==
X-CSE-MsgGUID: 8xpKL5pxTXy5R7NdCW72Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000"; d="scan'208";a="51819020"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 May 2024 11:19:34 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 7 May 2024 11:19:34 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 7 May 2024 11:19:34 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 7 May 2024 11:19:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aM5ZEU7lQjb4QGIshTzMQtSv9+JACOiI/t3I9eUh1l/TDsDa6CByY0kbofyDbtsbFW7UmSaFS7LGzwM8iRmaEGLYcPF9+0+8UFqJ8mtgdFuAQWZb1+spVY+OlzIX4egnMWQINn//ktoTCKrGg3FhP1rk3rZAj0aaC8PiKHODd1bs0mET5sFlViy7J/qpvSMsB+aRV8k18+4kfiRTo5Ohyu02l7XATlihz2MtbK4ocRM3H/ML2oSDpkjVuD1PnAw8ZAkqa0Rn/CxnVEjlDwKdXcm/ZPc/A7h1+2p02E7RQ5hk6ZAqqik9wYZ6e3kkrciVww5YZtSuDnZgPXiqcmHpUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R5+3+XlfGS3YpwAPqyXpxAJazVTwsMEG9JheQjmx5q8=;
 b=RR2BQtPFE0jXGCIPyqWhkY+4vH80HSUyWdifqgbfpXSA/wfscJZ1NI5MQj2cuZcGsoO0iSFzGhccvzKNS+Zs+hH5vwSy3p+ASX5MJ+wpmyRG9UYn7GYhp98P3J5Wf0wPTwRDk6EAiYn5HQCKvM+EedT2VnI/GcTpYUyjSEHyj5JiN+birX1Jl/ZI9plXZFQoEqccFneq23KEwNTAaj0Xo1Km5vlOneAEyyY9JUg1DghDukSqGriVZHnColAXI9I5DpGvuTZ086xAJTGn+zu/ahJYALNyHa3sook1/aJejth18G6FvlXv+1NCPRYhl1EfBpfJ3kisEzukEZeNnso5nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB6608.namprd11.prod.outlook.com (2603:10b6:510:1b3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41; Tue, 7 May
 2024 18:19:32 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.7544.041; Tue, 7 May 2024
 18:19:32 +0000
Date: Tue, 7 May 2024 18:19:17 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>, <lucas.demarchi@intel.com>,
 <francois.dugast@intel.com>, <matthew.auld@intel.com>,
 <anshuman.gupta@intel.com>
Subject: Re: [PATCH 4/7] drm/xe: Relax runtime pm protection around VM
Message-ID: <ZjpwpXQ5VCk2KC68@DUT025-TGLU.fm.intel.com>
References: <20240503191309.7022-1-rodrigo.vivi@intel.com>
 <20240503191309.7022-5-rodrigo.vivi@intel.com>
 <e0106194140f1801232744002779b6fa51af6fa4.camel@linux.intel.com>
 <ZjjnxOqHMXT9Ybw6@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZjjnxOqHMXT9Ybw6@intel.com>
X-ClientProxiedBy: SJ0PR03CA0076.namprd03.prod.outlook.com
 (2603:10b6:a03:331::21) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB6608:EE_
X-MS-Office365-Filtering-Correlation-Id: 3afbb3e3-3c51-448b-aefe-08dc6ec23dc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?1wjzMjzu9iH6DD8xzyr1tYhX3JRFPvI0m6ZhYSAMugseMrZaeDO30zZc7V?=
 =?iso-8859-1?Q?SFA+ibIdyZq4PM/14STnIqN3JZjSovKteYDEJisB2Yc68azGwClvnBEjbd?=
 =?iso-8859-1?Q?TS/SwUVmcflm20b/0CtkAzbmBkjFMHs9pDMwCL0Uk/2XLFfNZDe686iWXl?=
 =?iso-8859-1?Q?/9dxeoM5KHslnKzscRSLGo9bn8c2/Yvm9R896cDzv1u2DnhwNtc3fF+cXD?=
 =?iso-8859-1?Q?B2hkbP59eD4HFAOMsuv3No4dlS4Y83BBkwzDlFKaVZx/gY17gRX+ZrCiIX?=
 =?iso-8859-1?Q?S9dOZHvxFhYKpPCcb1Ulv4zwnA2bKwBP4ZK27OhVzpXoYT+S150muC59lr?=
 =?iso-8859-1?Q?sKKYxRI225iDPNnc2h0gMsIcnbtCAFcESaC69v6IhCGzj0BfX2zE/BjqYv?=
 =?iso-8859-1?Q?Ol1RqkKihkp18e5ggZGOGKGSvbSwtN4+Oejdodt7Oju3/ySCeC428pdBsY?=
 =?iso-8859-1?Q?wU1B/DCDKs2haq26tUFqBOc9/B6HrERMhoa3HVJGtkSFmH1joQLNqResFW?=
 =?iso-8859-1?Q?3prHma/vynkMGMyBiTIF7Hxck0yK7BDwhZC0R4vFJFA6rEXObVeq0CwYu0?=
 =?iso-8859-1?Q?+QLPfFqksDrC7jSMm/qb9shaWcENrkJ91IuAAc+7Y96wC4mg29+4WCCtdc?=
 =?iso-8859-1?Q?RqYH5Pg2j1g9mgPqVCxokJgJjVnmzKmEYehDZkfgvlxEpd/XxU582bsT3P?=
 =?iso-8859-1?Q?9q9ZxNJwcQxgcncfyWDHaYbsobFO81UeUzHhe7dJac4EGewy7DpozLVvdy?=
 =?iso-8859-1?Q?HHOofYwjUFov0xYI8I9IyZFucwzlNklfuCPWAkH7Lqhw14Vhae96WQ3Pgo?=
 =?iso-8859-1?Q?BwsLB2KgeVbD2HjICM/Oh8qz+1/FiCF6DQTOr88nCRJBsZF3/Y4i+vTQef?=
 =?iso-8859-1?Q?72WVOBv0xKxl2j1j3AYhHGYiFgU0ob1UGId1D3MXrKq1l1fjYkBhay2tD+?=
 =?iso-8859-1?Q?oKuB0aUbky/TVm2QQm3xiJMn5CMaded35K4Htl2yQRr8lzjzjnerbhfjjf?=
 =?iso-8859-1?Q?CzVvT/YAypsDRb+LEQ8HEL0gIxoGL0qPMNAaZpajng94hIjc7iuRJa34bW?=
 =?iso-8859-1?Q?byUyY+dzDxCwyzIKd0Xjw93PSQHq7W9t3UpgJcGQTlGzGGu+AV/JQpkAA2?=
 =?iso-8859-1?Q?g6z0E19CoQJZmXw2vsAysPFnepYALSpFegBLWXOMoZvTH5LowO91zIDVu3?=
 =?iso-8859-1?Q?7hnJcPLBaHxulnZXfhLgmMEkJjuUldgd6PbIiqZshpVw2W6RYLbfV5Gutf?=
 =?iso-8859-1?Q?K/d5iol5rVID08r91Ppg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?heVupiIzOrf9tShBmCrYsc0PaXiEn5ir1PRBoiHYnFM4RXZK27xFOcQ6WN?=
 =?iso-8859-1?Q?ucY//18VEiVXMv4hZSa/uzraSp6QsYh4IshR87MXdIUntlNHd0UMT7iiQW?=
 =?iso-8859-1?Q?VFchYecvSr0pAUR52KHI7IeNMqhodr92rzXVgVloPlhNtx1/LNTm/ZzJN1?=
 =?iso-8859-1?Q?aajuoZMMnzvPiJthuzLvjAPYDWKgpm+Fl2I8jVNczeUmmWmIU7FAJ1UpcJ?=
 =?iso-8859-1?Q?9KYyw+60eBM/U9Ot3I2HjJzvKmUk6qxd16WEPElI7wxRBHfzQcJcuqW7fy?=
 =?iso-8859-1?Q?FGAFEh4HSW8F15AZfJQwjNobhJ8saZuUxkjemDhmNcddJnhvuJOQzOQeda?=
 =?iso-8859-1?Q?f4HIM/Q/x9CthRGv0Ktu0jlzP4mSjJf7KryOOiCujGNNmfceHafqB1VVom?=
 =?iso-8859-1?Q?S65HG/F23UAnyBJxj6q//W/6GRXSO7unP+cHD6esBEJTsmHoohGCmNzkJF?=
 =?iso-8859-1?Q?l5FqtBGbI5LFCTt79XEycxMKOj1baTE8t4mhLLHa++r/j8CVdKA91OiOZo?=
 =?iso-8859-1?Q?9tUAZVM2vbqOhb5Mbb8Kk42AwuHW8eZmpy8AEt+ALFeOiJIooq2nABRVNB?=
 =?iso-8859-1?Q?1Ku4qYOooohD60KJVa4x3pQr4Qwgb7IOjbiK7bm67wWmUnKlpMLNTnjJ8D?=
 =?iso-8859-1?Q?JTdVM+NnrVmo6qdxB8VyxXbsGPVra3976NGU8Cd/G6xcHYSH7nvbrmrAjq?=
 =?iso-8859-1?Q?EIPFrOXtVwjqMm1MZ240evIP/oOWFi4vFCT2csD7nEaEXQWafFQxYZCgu8?=
 =?iso-8859-1?Q?PaO7xciBsyqbN3AD2h4Yy/3/1FgxWJ2gAzebai8wVn7ceS18op0Bdi9WuS?=
 =?iso-8859-1?Q?4H2SLMKPiI7P8i2y9tpjSSmERqi6Y0vozkuawxeyS0bdnVxNXFnFSZWDKe?=
 =?iso-8859-1?Q?b5IlOdwGA3HC7Y6AWHNFvKUx2R+khuevzVvTgh9W6i/c1Vl0mr+lB886iV?=
 =?iso-8859-1?Q?QCOr27l+D2Jb+oqoy6Wv5Qj6B6xYtJrkbgH0Ug1dsiib3yvMd42CBAu/NI?=
 =?iso-8859-1?Q?Qj8pJ5b6M5FdPUXtqH4eDMBj9uEh9i8Bj4sV7wPfdn6k541XVA+I1z52qf?=
 =?iso-8859-1?Q?LtzmupfzIJ13HDPKgBp7ci67/F6AKWOdhRRwKtYTpphKg/rM7CmU8JzRXe?=
 =?iso-8859-1?Q?y3k/MzSf1qpb0lXQ2dF2K7vQ4XBC6E7RkLRWcBhDAGnnYNZgKsrmH1vkWp?=
 =?iso-8859-1?Q?4dY1xB1xnx4BvmQgzfsjoCnr0kbPu0/YTCMEMjxnds8IksWjziImL/8Rmq?=
 =?iso-8859-1?Q?z8o1xEqmMJs6mGYS5v33cGB/Q1Ke1HNbyNa02YZqybR/vQKPFE4puXkHA8?=
 =?iso-8859-1?Q?qHt+qtAmsIYEM/NBlD+YHK18HJ/Z0qv4+obzp2uzYgPT/WILIQ+ls4sXY6?=
 =?iso-8859-1?Q?eXR4auizJhVWXcoX3g/+ons+TBR1F83JZXoXSl3sYzrA3U+YS21QA7bm9E?=
 =?iso-8859-1?Q?88YBfloeGxEZWFAI3cL0U0VS/pKfwi4FA/zAcClHq/4MqCnxp5xhuQMvzo?=
 =?iso-8859-1?Q?acb4vr49AfZ6yViY62PD18pArwOgIsGRhrezRi6CrI9DkQv8TJCuOQpK4e?=
 =?iso-8859-1?Q?RrPoyLRJitMoD/FGXQVZQOl8V/43o0A/6L1BmOLYHfVPX1hZycSdxgEVDJ?=
 =?iso-8859-1?Q?4I11WN/S8rWkm+PGiRPCDc6+ORzfosNDS6zn8Xo2+N+UY79tydzv0z9g?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3afbb3e3-3c51-448b-aefe-08dc6ec23dc6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2024 18:19:32.0857 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d5i0uOqfR11pQD5yjc7HB4fbKHzLxvEsjyWs7ldt9E/aamNu5CIkjs6sNd1gCZrwle/tRmC/1nyejQ6xp5zDaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6608
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

On Mon, May 06, 2024 at 10:23:00AM -0400, Rodrigo Vivi wrote:
> On Mon, May 06, 2024 at 02:30:03PM +0200, Thomas Hellström wrote:

Thomas / Rodrigo, replying to both you to keep a continous thread.

> > Hi, Rodrigo.
> > 
> > On Fri, 2024-05-03 at 15:13 -0400, Rodrigo Vivi wrote:
> > > In the regular use case scenario, user space will create a
> > > VM, and keep it alive for the entire duration of its workload.
> > > 
> > > For the regular desktop cases, it means that the VM
> > > is alive even on idle scenarios where display goes off. This
> > > is unacceptable since this would entirely block runtime PM
> > > indefinitely, blocking deeper Package-C state. This would be
> > > a waste drainage of power.
> > > 
> > > So, let's limit the protection only for the long running workloads,
> > > which memory might be mapped and accessed during this entire
> > > workload.
> > > 
> > > This indeed opens up a risk of use case without display, and
> > > without long-running workload, where memory might be mapped
> > > and accessed with direct read and write operations without
> > > any gpu execution involved. Because of this, we are also
> > > adding here, the extra protection for the special vm_op access
> > > callback.
> > 
> > A couple of ignorant questions:
> > 
> > Why aren't the runtime_pm get / put in xe_sched_job_create() /
> > destroy() sufficient also for LR vms? If not, could the vm deactivation
> > / reactivation be used for this (see xe_vm_reactivate_rebind)


LR jobs become immediately free once they hit the hardware, i.e.,
run_job returns NULL so the scheduler can drop all references and we
don't accidentally export a DMA fence that will not signal for a long
time.

Sima and I landed on this design after a lengthy discussion [1].

So as soon as an LR job is put on the hardware, we will drop the job
runtime PM reference. With that, the part of the patch for holding
runtime PM on LR VMs looks correct to me.

With that, for the LR PM changes (haven't look at xe_vm_access change):
Acked-by: Matthew Brost <matthew.brost@intel.com>

[1] https://patchwork.freedesktop.org/patch/530656/?series=116054&rev=1

> 
> Yes, in general we should be already protected by the sched or in
> the compute exported cases by the dma_buf...
> 
> But I was afraid to end up in some corner cases of non-display
> compute scenarios where mapped memory would be accessed without
> any protection.
> 
> Then it was also a request from Matt in some old reviews.
> 
> Matt, thoughts?
> 
> > 
> > > 
> > > In the ideal case of the mmapped scenario of vm_ops, we would
> > > also get references in the 'open' and 'mmap' callbacks, and
> > > put it back on the 'close' callback, for a balanced case.
> > > However, this would also block the regular desktop case, so
> > > we are not doing this.
> > 
> > I'm not completely following here. We have xe_runtime_pm_get() in the
> > fault handler + some form of delayed xe_runtime_pm_put(). Does this say
> > we ideally should replace that with open + mmap / close? 
> 
> Exactly! Ideally yes, but we cannot do this or this entirely kill the
> PC10 and D3Cold in regular desktop case. Because compositors keep all
> the mmaped buffers alive even when display goes off in idle scenarios.
> 
> > 
> > Thanks,
> > Thomas
> > 
> > > 
> > > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Cc: Francois Dugast <francois.dugast@intel.com>
> > > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_bo.c | 17 ++++++++++++++++-
> > >  drivers/gpu/drm/xe/xe_vm.c |  6 +++---
> > >  2 files changed, 19 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > > index 52a16cb4e736..48eca9f2651a 100644
> > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > @@ -1157,11 +1157,26 @@ static vm_fault_t xe_gem_fault(struct
> > > vm_fault *vmf)
> > >  	return ret;
> > >  }
> > >  
> > > +static int xe_vm_access(struct vm_area_struct *vma, unsigned long
> > > addr,
> > > +			void *buf, int len, int write)
> > > +{
> > > +	struct ttm_buffer_object *tbo = vma->vm_private_data;
> > > +	struct drm_device *ddev = tbo->base.dev;
> > > +	struct xe_device *xe = to_xe_device(ddev);
> > > +	int ret;
> > > +
> > > +	xe_pm_runtime_get(xe);
> > > +	ret = ttm_bo_vm_access(vma, addr, buf, len, write);
> > > +	xe_pm_runtime_put(xe);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > >  static const struct vm_operations_struct xe_gem_vm_ops = {
> > >  	.fault = xe_gem_fault,
> > >  	.open = ttm_bo_vm_open,
> > >  	.close = ttm_bo_vm_close,
> > > -	.access = ttm_bo_vm_access
> > > +	.access = xe_vm_access
> > >  };
> > >  
> > >  static const struct drm_gem_object_funcs xe_gem_object_funcs = {
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > > index dfd31b346021..aa298b768620 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > @@ -1347,7 +1347,7 @@ struct xe_vm *xe_vm_create(struct xe_device
> > > *xe, u32 flags)
> > >  
> > >  	vm->pt_ops = &xelp_pt_ops;
> > >  
> > > -	if (!(flags & XE_VM_FLAG_MIGRATION))
> > > +	if (flags & XE_VM_FLAG_LR_MODE)
> > >  		xe_pm_runtime_get_noresume(xe);
> > >  
> > >  	vm_resv_obj = drm_gpuvm_resv_object_alloc(&xe->drm);
> > > @@ -1457,7 +1457,7 @@ struct xe_vm *xe_vm_create(struct xe_device
> > > *xe, u32 flags)
> > >  	for_each_tile(tile, xe, id)
> > >  		xe_range_fence_tree_fini(&vm->rftree[id]);
> > >  	kfree(vm);
> > > -	if (!(flags & XE_VM_FLAG_MIGRATION))
> > > +	if (flags & XE_VM_FLAG_LR_MODE)
> > >  		xe_pm_runtime_put(xe);
> > >  	return ERR_PTR(err);
> > >  }
> > > @@ -1592,7 +1592,7 @@ static void vm_destroy_work_func(struct
> > > work_struct *w)
> > >  
> > >  	mutex_destroy(&vm->snap_mutex);
> > >  
> > > -	if (!(vm->flags & XE_VM_FLAG_MIGRATION))
> > > +	if (vm->flags & XE_VM_FLAG_LR_MODE)
> > >  		xe_pm_runtime_put(xe);
> > >  
> > >  	for_each_tile(tile, xe, id)
> > 
