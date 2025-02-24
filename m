Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3AE4C021A4
	for <intel-xe@archiver.kernel.org>; Mon, 24 Feb 2025 15:34:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D2FA10E3CC;
	Mon, 24 Feb 2025 15:34:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wnhni3je";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3257B10E3CC
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Feb 2025 15:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740411265; x=1771947265;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=0OoUx0+yqVFJknfSnwo84iuYcnC/W1b/uoBifnZuy0I=;
 b=Wnhni3jeWT2GZQvuQNk9jQhMciqPesL4QzOv1eQ42fAhl5rvYd864LhC
 U5RZXE5FN69D3wkSsX0qS7yrDZtbUtwHR62oKgnlzdgQleCkF8Cn4GfVE
 QYVeSiglt+LgUcTn06gEhE8nOawllXG73wbFKotZZfOPdr7n27tFeXl7D
 q79S2uPYQ03uUm3UOLb0UjkeUry0Dax3rVXPmYAgE9SF/PXmpbkdEdlLu
 SUsJvf+uGtI1fpmTZtt25AJpZlEQx75FqZfvaBbgIK0NdpwqMckhUZb9U
 +OoQRCmNbw6tUJ5uOLTeywsVvtwbGjR+fNTvt8wL9NJ+R8OadPuazmY1L g==;
X-CSE-ConnectionGUID: xMhcZFQ5Rk+EvHu10cZy6w==
X-CSE-MsgGUID: TyK/utGMTRKqKJLYyrqZiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="58586121"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="58586121"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 07:34:25 -0800
X-CSE-ConnectionGUID: A/ylvksHQyqwNWoDVil1ug==
X-CSE-MsgGUID: VDzl1bk0SD+rrnFGk5NEHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="116575678"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 07:34:20 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Mon, 24 Feb 2025 07:34:19 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 24 Feb 2025 07:34:19 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 24 Feb 2025 07:34:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OKRaHsZbK30bStNo2L3hjYwP6ctWQAXTzYOYSfXo6fFeZ1d7TZ/lJzWCpCamRAdMtcWEcEjr+QPlMrDm2L2fuXiiKRbMzPWAHwH4+/g8eUkbH5A8JeKLUqG92uBpBjQKajG7XCHJh+2naHst2Xtvpxh0pPvaYu3fUESrZ4NXcFVZu3U8ZLSLT1j+VkSXH9PhQyd9S/D2wqA32Ub62BlwxF5nIrXTzvLtEsrgfy5DFFKaL9IqS065T9EzHpLoGw7h5AMqHXzYR5rSTp838kNdaomU4wTwJofCGVMCsdsuJgeueU857tvzMJ6Tb6x+OdbpO2qnzRLtXMn3ur9TxMM/PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KI/+HTekIbqtu9e1MCV7mrp0ARsHQz610xVTOi6aJEY=;
 b=LoE8XebImThk2EJvdqZo/92U+08shh6WObHEhewzUdE/QuA6hs4b8WuJcLV+URsdG1l6wSl3CHLrAmjBwNe4rDjcvx2CH1X2EjV9pkSnnOskW4mdk3QydIaZqyycqjNUo5MUUTdWKBOq2ii0gJVr4QgZ66A4KjkotD3YhybGjNfSo6ZP/Cb8/Iz12/+/ko5DOlThJjlISQO9rv61yVB/29PPnVP1ToELlPkVlxEMeI06drxc3QJz2vFWMWeRVtd0tXJpIi972/ngkNfmznKuf7h8NSZIWESU+pxPCqFfQvU67mxbFWEIWccpq8xelB9WLEpCEA8VISygXmhNg52C1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ2PR11MB8566.namprd11.prod.outlook.com (2603:10b6:a03:56e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Mon, 24 Feb
 2025 15:34:15 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 15:34:14 +0000
Date: Mon, 24 Feb 2025 07:35:18 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.auld@intel.com>
Subject: Re: [PATCH v2 2/3] drm/xe: Userptr invalidation race with binds fixes
Message-ID: <Z7yRtqjxmFUcTWVG@lstrano-desk.jf.intel.com>
References: <20250224040529.3025963-1-matthew.brost@intel.com>
 <20250224040529.3025963-3-matthew.brost@intel.com>
 <e5e829157edf3f4e1f4ea3178216ba400ff6f314.camel@linux.intel.com>
 <Z7yLDpCcS6jGBM/w@lstrano-desk.jf.intel.com>
 <2f1e88d3a2e6041a49684025b037f2ee4098a369.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2f1e88d3a2e6041a49684025b037f2ee4098a369.camel@linux.intel.com>
X-ClientProxiedBy: MW4P221CA0009.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ2PR11MB8566:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b40d762-b865-4f82-71e2-08dd54e8b19f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?+Xctrh4QpHy39YwcXEFQUmIXDbYP8PCGPnPMBYcV3lcC6XbRSz1Mn5thU2?=
 =?iso-8859-1?Q?0bevc2baAS3Z+ZYji+VMDj+Y2MCNiPouGu2WcWi28ueA0R1Yaa81gRVV0l?=
 =?iso-8859-1?Q?YFJvsbSQkVIIFjlURP7ipTA3+APiJgwpl24iOWnDGLWGrThayxFC65eIjX?=
 =?iso-8859-1?Q?9LqRaXwbHK9lIV5NQMtRvA86Ybx6BExCXv84ss+zoWM0+n6j6VFsnvMeUQ?=
 =?iso-8859-1?Q?hl3BxPvI301JIn6wL1Oif1619i5x9NO68It70/YlGL3NMiMr9ihPuwbu2S?=
 =?iso-8859-1?Q?Bq/CWd0FPBcZDTaoVddvo7+MFTgD1ZYWbwNnT/wzXiHG/I8z/GJY56k4VP?=
 =?iso-8859-1?Q?3AUUD2g4+BKEDM+2DS6CSKL9k+MfqZuzOoXceM0j4ETTdIhcNKEX9I4FpF?=
 =?iso-8859-1?Q?t2o4LOp154Juchf3MpfV2aOGeg16WdEG1NknsCmmkzKGuaXLFF+iinfKy/?=
 =?iso-8859-1?Q?Uw2ygA1NCF2jB5NGFFimU14uyKanr1d1E+kE2jRf6cs0stKWpCAnpWENgv?=
 =?iso-8859-1?Q?Uhg6voQaVhSCYk4QppZOIIjAG8HfeJkmRx3KTuuPALPLEA2Qqzeb9dmoMr?=
 =?iso-8859-1?Q?4sXa357Sb/0HWSo8dEntfBDdvz3/I2PkMVY75Ksa+nTSDCgyJCD4EK9Wfp?=
 =?iso-8859-1?Q?oY7jj3fwWe+S7yv8Bn5sT7lj0cxTBR1OCAAOPtIE/7TZ8U4rPTMnOv3qu/?=
 =?iso-8859-1?Q?Xzi3295lwcD21nx9Jf+AKkr0B/zyQ580y6xtY9aW70W883HrkzfAYJZq+b?=
 =?iso-8859-1?Q?HVfzuNrS5T7EgCo05YyEdxxvB589Ztp14Vivf2LjmHpVeqB9b+xUvyBDhK?=
 =?iso-8859-1?Q?mvMpxNFvhA2i0i5EpdHjyp4Eh34H6kNZT67DskkfiCseTCPzFhyy1ajrMw?=
 =?iso-8859-1?Q?3ZfV5UrBjSaEIx40iHQAlutkPc+nZIWmy9jiOcgul8Jm9zpnclaqpZwA8a?=
 =?iso-8859-1?Q?TGodCOuxszVwyAPa77EBs9TtFPtawk7sXTPaO38gwozTd8LsSKT9WArtSA?=
 =?iso-8859-1?Q?ar5RMOB5dMgOTqVsohdiqHdn0F6KAz0wwkpjAarKowdnC0+OOmDrabCe5t?=
 =?iso-8859-1?Q?4GVjLr1Zb0cN+PzNA+QVEXaWlrlOpgfiehfn52+I67as1LA7zJ2OEZhAkZ?=
 =?iso-8859-1?Q?5VsYTcR4VXm0hFtMYJ7CWaqvObWuDpSnCSKeY5iHgxHl0XGIG7Cl1w8sCl?=
 =?iso-8859-1?Q?OoE0mqQFZTPtqyXgw74UfS+t7nLkic8n05OFwVOmZg0pORi1XRtEycPXG+?=
 =?iso-8859-1?Q?hapdSkI2xnuGs4bxGMgn5+kUaIjPbj0IiEYChVk3TXsuHPPU1IiKFcz0Rd?=
 =?iso-8859-1?Q?aezCSN8k1vRwM/tUFul+ktjj1fQYg/E7hqQSI3WZUo0XLTjVEMtuo76ePa?=
 =?iso-8859-1?Q?RwJhyz8/0a8JADk8TX0hB8xa/OXmOMDuAs/zL+jShS3MvaD1dwDb8D68Hg?=
 =?iso-8859-1?Q?bDYT1rUMgFbz/iqt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?QvV3wVKgVLoNmOsne8KvcXlgrd7BPgGwt+QKW8j+IS0I8BQOGRwfBtFbuT?=
 =?iso-8859-1?Q?d7VVBKNmD44quzHglGwZO0edkkUONtVM/N1N61tcrT3MWTAYJ2x4gY/ZMM?=
 =?iso-8859-1?Q?NPaprS9GPIAAGjYyMUy538X+SHo3K3/KvGxC3vB7vOR+QrokDqlsI3xoCm?=
 =?iso-8859-1?Q?QQHy5ui+y6bUn5D/FY4ytt13jHYYeP0SmEOnWFtBZobckwnZ1ZkyIEqtYe?=
 =?iso-8859-1?Q?aTtq/r1nmabJiLgIXjWsHetGfN30m6XIZHZAoYwJc1A2xplmyUbBc3xwB3?=
 =?iso-8859-1?Q?9q0Syu6+jw5Gox8R/DSSjnCAiqOuhcpXKyT5BAlkkBiWJNuTV2U2ALnvci?=
 =?iso-8859-1?Q?U7BN1DwPTt4hfODvOCZr9mrbCZXilY8Rv+bwMS2HyAFewuGbn2bKBgnzVc?=
 =?iso-8859-1?Q?UVZDOcYEgLJdDwBPSphsDrjUxFSZVJMJQPcxcDqGPc5gW+9GDrg1EYOg0e?=
 =?iso-8859-1?Q?fgtSlewRBtoiC5WUZHOT8uGienTJQdgBxW49o3zruxHMq3zU7i9RjvM9+J?=
 =?iso-8859-1?Q?/riliBtQ0VGvpJ03dCJTsPApvujPUa9MJE/bj4iECd9w3AXqlk73uM8jFt?=
 =?iso-8859-1?Q?uV7G5SuUdC/4oPO3NnlFay4qatgbeKFxOQfyG7Go+6ykrkNRiBlPxzPFet?=
 =?iso-8859-1?Q?HJENWdhf6yJmW18H8B2WFaX9Zyn4peTRCg8lVHKZaHGj/2ttRgP//TOSaH?=
 =?iso-8859-1?Q?+7Pm1UFsdQ5pKCG1lrUI/0DwoCtgspicKG+YvsLHZhWf4gKkWT/Na0I9fB?=
 =?iso-8859-1?Q?kdwnzFXw1+zen87S6HuYp3JMAd04xoXpH4fWmGe26xMFqYPehR8UGVRDZY?=
 =?iso-8859-1?Q?CGzDCu0fixMRYurKUX6+AL4YKfIwvR2V3xVU8f3KoogmckW+x0vMtm1xVz?=
 =?iso-8859-1?Q?lqiQo1oeaYnT0dJ1XwROmRP9bl8BHnTXaIkn06khTDSwVzfXXrCSIYMKq5?=
 =?iso-8859-1?Q?FUM/loyFVnanrNVD/GVlKb/R4+6ZWloAQCYbQRBumTrOkTNuGz9qA4AZ2o?=
 =?iso-8859-1?Q?Sw5E0pEXvkZo/osi0dbBB11Ul+rjKC7WkhTU16ATz2BjrXL/UYvxLc9mdp?=
 =?iso-8859-1?Q?N8nRdkvXIY/93Oc+vX2X/62YmK9a9OBvT1utK5PYsZZ/woOjuFM9cN1Mev?=
 =?iso-8859-1?Q?p9tD95L9PiPIfpune2qP1jtfRWgzVQNrR98zvN7J8v6LR79mK3hTqNT+h3?=
 =?iso-8859-1?Q?faUmipMzcRHyZRs2ET+AzEqn9PDQVuwiGTo7+8TMKc4vlfQuBuC+f8WmxQ?=
 =?iso-8859-1?Q?sHiZodAVeSbqfy60suO2Pg+L3YZviANbHKpk7WRxr7itU4yy6YntL0xzuS?=
 =?iso-8859-1?Q?sBjnKNEYP61kmVCsh9NDgcOzqdSQpjEsfJ/7Ek0ZgX72tm1nGh7RuSAM2A?=
 =?iso-8859-1?Q?GK2K4dPlkez/kqMB2kTLxkJktGrNkSIroJAIZYJAzvzkj8QTmsr0tZwTiq?=
 =?iso-8859-1?Q?tTVg94+NqjiT62Ap299c0NGLhjotDG1VUSwSPS8tYzEcMenR3el6R7N/zJ?=
 =?iso-8859-1?Q?3xrKR8OOUIXga4moOvMNK8dFSAPj9/mRz46yBmxNTFUVwFn7QIlVFmq6i7?=
 =?iso-8859-1?Q?g/JB6gHJ4/Xp4alQ/AqgMgHhnZ4W/buWC1nuCG/YZzH23rRtZR6BF0J01f?=
 =?iso-8859-1?Q?hDDfhWD32gReKYHwbG+B0rnl+DIu0bBLXzdMWTC3yBD2hFjeG6vDHk3w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b40d762-b865-4f82-71e2-08dd54e8b19f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2025 15:34:14.8491 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jB016aPF8j8PKZ/Mi80SmF7ngdtcSBEmtPx/S2W+sEBCBzzkfrCIR0XrC0w+TJGuMEWPFsx/NCPgMCnzCLh/xA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8566
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

On Mon, Feb 24, 2025 at 04:20:07PM +0100, Thomas Hellström wrote:
> On Mon, 2025-02-24 at 07:06 -0800, Matthew Brost wrote:
> > On Mon, Feb 24, 2025 at 09:21:09AM +0100, Thomas Hellström wrote:
> > > On Sun, 2025-02-23 at 20:05 -0800, Matthew Brost wrote:
> > > > Squash bind operation after userptr invalidation into a clearing
> > > > of
> > > > PTEs. Will prevent valid GPU page tables from pointing to stale
> > > > CPU
> > > > pages.
> > > > 
> > > > Fixup initial bind handling always add VMAs to invalidation list
> > > > and
> > > > clear PTEs.
> > > > 
> > > > Remove unused rebind variable in xe_pt.
> > > > 
> > > > Always hold notifier across TLB invalidation in notifier to
> > > > prevent a
> > > > UAF if an unbind races.
> > > > 
> > > > Including all of the above changes for Fixes patch in hopes of an
> > > > easier
> > > > backport which fix a single patch.
> > > > 
> > > > v2:
> > > >  - Wait dma-resv bookkeep before issuing PTE zap (Thomas)
> > > >  - Support scratch page on invalidation (Thomas)
> > > > 
> > > > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > > Cc: <stable@vger.kernel.org>
> > > > Fixes: e8babb280b5e ("drm/xe: Convert multiple bind ops into
> > > > single
> > > > job")
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_pt.c       | 146 +++++++++++++++++++++++--
> > > > ----
> > > > --
> > > >  drivers/gpu/drm/xe/xe_pt_types.h |   3 +-
> > > >  drivers/gpu/drm/xe/xe_vm.c       |   4 +-
> > > >  3 files changed, 115 insertions(+), 38 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_pt.c
> > > > b/drivers/gpu/drm/xe/xe_pt.c
> > > > index 1ddcc7e79a93..add521b5c6ae 100644
> > > > --- a/drivers/gpu/drm/xe/xe_pt.c
> > > > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > > > @@ -351,7 +351,8 @@ xe_pt_new_shared(struct xe_walk_update *wupd,
> > > > struct xe_pt *parent,
> > > >   */
> > > >  static int
> > > >  xe_pt_insert_entry(struct xe_pt_stage_bind_walk *xe_walk, struct
> > > > xe_pt *parent,
> > > > -		   pgoff_t offset, struct xe_pt *xe_child, u64
> > > > pte)
> > > > +		   pgoff_t offset, struct xe_pt *xe_child, u64
> > > > pte,
> > > > +		   unsigned int level)
> > > >  {
> > > >  	struct xe_pt_update *upd = &xe_walk-
> > > > >wupd.updates[parent-
> > > > > level];
> > > >  	struct xe_pt_update *child_upd = xe_child ?
> > > > @@ -389,6 +390,9 @@ xe_pt_insert_entry(struct
> > > > xe_pt_stage_bind_walk
> > > > *xe_walk, struct xe_pt *parent,
> > > >  		idx = offset - entry->ofs;
> > > >  		entry->pt_entries[idx].pt = xe_child;
> > > >  		entry->pt_entries[idx].pte = pte;
> > > > +		entry->pt_entries[idx].level = level;
> > > > +		if (likely(!xe_child))
> > > > +			entry->pt_entries[idx].level |=
> > > > XE_PT_IS_LEAF;
> > > >  		entry->qwords++;
> > > >  	}
> > > >  
> > > > @@ -515,7 +519,8 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent,
> > > > pgoff_t offset,
> > > >  			}
> > > >  		}
> > > >  
> > > > -		ret = xe_pt_insert_entry(xe_walk, xe_parent,
> > > > offset,
> > > > NULL, pte);
> > > > +		ret = xe_pt_insert_entry(xe_walk, xe_parent,
> > > > offset,
> > > > NULL, pte,
> > > > +					 level);
> > > >  		if (unlikely(ret))
> > > >  			return ret;
> > > >  
> > > > @@ -571,7 +576,7 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent,
> > > > pgoff_t offset,
> > > >  
> > > >  		pte = vm->pt_ops->pde_encode_bo(xe_child->bo, 0,
> > > > pat_index) | flags;
> > > >  		ret = xe_pt_insert_entry(xe_walk, xe_parent,
> > > > offset,
> > > > xe_child,
> > > > -					 pte);
> > > > +					 pte, level);
> > > >  	}
> > > >  
> > > >  	*action = ACTION_SUBTREE;
> > > > @@ -752,6 +757,10 @@ struct xe_pt_zap_ptes_walk {
> > > >  	/* Input parameters for the walk */
> > > >  	/** @tile: The tile we're building for */
> > > >  	struct xe_tile *tile;
> > > > +	/** @vm: VM we're building for */
> > > > +	struct xe_vm *vm;
> > > > +	/** @scratch: write entries with scratch */
> > > > +	bool scratch;
> > > >  
> > > >  	/* Output */
> > > >  	/** @needs_invalidate: Whether we need to invalidate
> > > > TLB*/
> > > > @@ -779,9 +788,18 @@ static int xe_pt_zap_ptes_entry(struct
> > > > xe_ptw
> > > > *parent, pgoff_t offset,
> > > >  	 */
> > > >  	if (xe_pt_nonshared_offsets(addr, next, --level, walk,
> > > > action, &offset,
> > > >  				    &end_offset)) {
> > > > -		xe_map_memset(tile_to_xe(xe_walk->tile),
> > > > &xe_child-
> > > > > bo->vmap,
> > > > -			      offset * sizeof(u64), 0,
> > > > -			      (end_offset - offset) *
> > > > sizeof(u64));
> > > > +		if (unlikely(xe_walk->scratch)) {
> > > > +			u64 pte = __xe_pt_empty_pte(xe_walk-
> > > > >tile,
> > > > xe_walk->vm,
> > > > +						    level);
> > > > +
> > > > +			for (; offset < end_offset; ++offset)
> > > > +				xe_pt_write(tile_to_xe(xe_walk-
> > > > > tile),
> > > > +					    &xe_child->bo->vmap,
> > > > offset, pte);
> > > > +		} else {
> > > > +			xe_map_memset(tile_to_xe(xe_walk->tile),
> > > > &xe_child->bo->vmap,
> > > > +				      offset * sizeof(u64), 0,
> > > > +				      (end_offset - offset) *
> > > > sizeof(u64));
> > > > +		}
> > > >  		xe_walk->needs_invalidate = true;
> > > >  	}
> > > >  
> > > > @@ -792,6 +810,31 @@ static const struct xe_pt_walk_ops
> > > > xe_pt_zap_ptes_ops = {
> > > >  	.pt_entry = xe_pt_zap_ptes_entry,
> > > >  };
> > > >  
> > > > +struct xe_pt_zap_ptes_flags {
> > > > +	bool scratch:1;
> > > > +};
> > > > +
> > > > +static bool __xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma
> > > > *vma,
> > > > +			     struct xe_pt_zap_ptes_flags flags)
> > > > +{
> > > > +	struct xe_pt_zap_ptes_walk xe_walk = {
> > > > +		.base = {
> > > > +			.ops = &xe_pt_zap_ptes_ops,
> > > > +			.shifts = xe_normal_pt_shifts,
> > > > +			.max_level = XE_PT_HIGHEST_LEVEL,
> > > > +		},
> > > > +		.tile = tile,
> > > > +		.vm = xe_vma_vm(vma),
> > > > +		.scratch = flags.scratch,
> > > > +	};
> > > > +	struct xe_pt *pt = xe_vma_vm(vma)->pt_root[tile->id];
> > > > +
> > > > +	(void)xe_pt_walk_shared(&pt->base, pt->level,
> > > > xe_vma_start(vma),
> > > > +				xe_vma_end(vma), &xe_walk.base);
> > > > +
> > > > +	return xe_walk.needs_invalidate;
> > > > +}
> > > > +
> > > >  /**
> > > >   * xe_pt_zap_ptes() - Zap (zero) gpu ptes of an address range
> > > >   * @tile: The tile we're zapping for.
> > > > @@ -810,24 +853,13 @@ static const struct xe_pt_walk_ops
> > > > xe_pt_zap_ptes_ops = {
> > > >   */
> > > >  bool xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma *vma)
> > > >  {
> > > > -	struct xe_pt_zap_ptes_walk xe_walk = {
> > > > -		.base = {
> > > > -			.ops = &xe_pt_zap_ptes_ops,
> > > > -			.shifts = xe_normal_pt_shifts,
> > > > -			.max_level = XE_PT_HIGHEST_LEVEL,
> > > > -		},
> > > > -		.tile = tile,
> > > > -	};
> > > > -	struct xe_pt *pt = xe_vma_vm(vma)->pt_root[tile->id];
> > > > +	struct xe_pt_zap_ptes_flags flags = {};
> > > >  	u8 pt_mask = (vma->tile_present & ~vma-
> > > > >tile_invalidated);
> > > >  
> > > >  	if (!(pt_mask & BIT(tile->id)))
> > > >  		return false;
> > > >  
> > > > -	(void)xe_pt_walk_shared(&pt->base, pt->level,
> > > > xe_vma_start(vma),
> > > > -				xe_vma_end(vma), &xe_walk.base);
> > > > -
> > > > -	return xe_walk.needs_invalidate;
> > > > +	return __xe_pt_zap_ptes(tile, vma, flags);
> > > >  }
> > > >  
> > > >  static void
> > > > @@ -1201,7 +1233,46 @@ static bool
> > > > xe_pt_userptr_inject_eagain(struct
> > > > xe_userptr_vma *uvma)
> > > >  
> > > >  #endif
> > > >  
> > > > -static int vma_check_userptr(struct xe_vm *vm, struct xe_vma
> > > > *vma,
> > > > +static void
> > > > +vma_convert_to_invalidation(struct xe_tile *tile, struct xe_vma
> > > > *vma,
> > > > +			    struct xe_vm_pgtable_update_ops
> > > > *pt_update)
> > > > +{
> > > > +	struct xe_pt_zap_ptes_flags flags = { .scratch = true,
> > > > };
> > > > +	int i, j, k;
> > > > +
> > > > +	/*
> > > > +	 * Need to update this function to bypass scratch setup
> > > > if
> > > > in fault mode
> > > > +	 */
> > > > +	xe_assert(xe_vma_vm(vma)->xe,
> > > > !xe_vm_in_fault_mode(xe_vma_vm(vma)));
> > > > +
> > > > +	for (i = 0; i < pt_update->current_op; ++i) {
> > > > +		struct xe_vm_pgtable_update_op *op = &pt_update-
> > > > > ops[i];
> > > > +
> > > > +		if (vma != op->vma || (!op->bind && !op-
> > > > >rebind))
> > > > +			continue;
> > > > +
> > > > +		for (j = 0; j < op->num_entries; ++j) {
> > > > +			for (k = 0; k < op->entries[j].qwords;
> > > > ++k)
> > > > {
> > > > +				struct xe_pt_entry *entry =
> > > > +					&op-
> > > > > entries[j].pt_entries[k];
> > > > +				unsigned int level = entry-
> > > > >level;
> > > > +
> > > > +				if (!(level & XE_PT_IS_LEAF))
> > > > +					continue;
> > > > +
> > > > +				level &= ~XE_PT_IS_LEAF;
> > > > +				entry->pte =
> > > > __xe_pt_empty_pte(tile,
> > > > +							      
> > > > xe_vma_vm(vma),
> > > > +							      
> > > > level);
> > > > +			}
> > > > +		}
> > > > +	}
> > > > +
> > > > +	__xe_pt_zap_ptes(tile, vma, flags);
> > > 
> > > As mentioned in my previous email, I'm pretty sure if we modify all
> > > the
> > > ptes in the entry array, not just the leaves, (that's basically all
> > > ptes of shared page-table entries) that will be equivalent to a
> > > zap.
> > > 
> > 
> > That doesn't work. I had that way originally but IGTs fail with IOMMU
> > CAT errors (e.g. xe_exec_basic.once-userptr fails like this [1])
> > 
> > Let me explain with example.
> > 
> > Array of bind 0x0000-0x1000 (A), 0x1000-0x2000 (B)
> > 
> > - (A) hits userptr invalidation
> > 	- If modify all ptes in the entry array, highest level PDE
> > is
> > 	  invalidated. Both (A) and (B) either are 0 or scratch
> > - (A) does rebind in exec
> > 	- We only modify leaf entry, not the highest level PDE which
> > is
> > 	  0 or scratch
> > 
> > Matt
> 
> Argh. You're right. What would happen if we don't do anything to the
> ptes, then? It looks from the code in faulting mode we error and unwind
> with -EAGAIN.
> 
>  In preempt-fence mode and !LR we could instead ensure properly stop
> gpu access and put the userptr on the invalidated list in the notifier.
> 

In dma-fence mode we'd have a window where existing (previously
submited) GPU jobs could corrupt pages which have been invalidated.
Unlikely but a very subtle security / data corruption issue.

> The reason I don't really like zapping here is it's yet another corner
> case in the code. If it works by doing this in the notifier, we get rid
> of two corner cases.
> 

I think the only other option here is return -EAGAIN but with that
approach we also have to tweak the error injection to be per user bind
rather per bind OP.

Can't say I love the approach in this patch but it does seem to work and
do I think a tangible beneift could be seen in SVM prefetch where we can
squash parts of a prefetch into an invalidation where this race is more
likely to occur.

Open to this patch or changing to -EAGAIN.

Matt

> /Thomas
> 
> 
> 
> 
> > 
> > [1]
> > [  359.895920] [IGT] xe_exec_basic: starting subtest once-userptr
> > [  359.902643] xe 0000:03:00.0: [drm:pf_queue_work_func [xe]]
> >                 ASID: 462
> >                 VFID: 0
> >                 PDATA: 0x0c90
> >                 Faulted Address: 0x00000000001a0000
> >                 FaultType: 0
> >                 AccessType: 0
> >                 FaultLevel: 4
> >                 EngineClass: 0 rcs
> >                 EngineInstance: 0
> > [  359.902686] xe 0000:03:00.0: [drm:pf_queue_work_func [xe]] Fault
> > response: Unsuccessful -22
> > [  359.902890] xe 0000:03:00.0:
> > [drm:xe_guc_exec_queue_memory_cat_error_handler [xe]] GT0: Engine
> > memory cat error: engine_class=rcs, logical_mask: 0x1, guc_id=2
> > [  359.905791] xe 0000:03:00.0: [drm] GT0: Engine reset:
> > engine_class=rcs, logical_mask: 0x1, guc_id=2
> > [  359.905826] xe 0000:03:00.0: [drm] GT0: Timedout job:
> > seqno=4294967169, lrc_seqno=4294967169, guc_id=2, flags=0x0 in
> > xe_exec_basic [9607]
> > [  359.905831] xe 0000:03:00.0: [drm:xe_devcoredump [xe]] Multiple
> > hangs are occurring, but only the first snapshot was taken
> > [  359.962840] [IGT] xe_exec_basic: finished subtest once-userptr,
> > FAIL
> > [  359.963049] [IGT] xe_exec_basic: exiting, ret=98
> > 
> > 
> > > /Thomas
> > > 
> > > 
> > > > +}
> > > > +
> > > > +static int vma_check_userptr(struct xe_tile *tile, struct xe_vm
> > > > *vm,
> > > > +			     struct xe_vma *vma,
> > > >  			     struct xe_vm_pgtable_update_ops
> > > > *pt_update)
> > > >  {
> > > >  	struct xe_userptr_vma *uvma;
> > > > @@ -1215,9 +1286,6 @@ static int vma_check_userptr(struct xe_vm
> > > > *vm,
> > > > struct xe_vma *vma,
> > > >  	uvma = to_userptr_vma(vma);
> > > >  	notifier_seq = uvma->userptr.notifier_seq;
> > > >  
> > > > -	if (uvma->userptr.initial_bind &&
> > > > !xe_vm_in_fault_mode(vm))
> > > > -		return 0;
> > > > -
> > > >  	if (!mmu_interval_read_retry(&uvma->userptr.notifier,
> > > >  				     notifier_seq) &&
> > > >  	    !xe_pt_userptr_inject_eagain(uvma))
> > > > @@ -1226,6 +1294,8 @@ static int vma_check_userptr(struct xe_vm
> > > > *vm,
> > > > struct xe_vma *vma,
> > > >  	if (xe_vm_in_fault_mode(vm)) {
> > > >  		return -EAGAIN;
> > > >  	} else {
> > > > +		long err;
> > > > +
> > > >  		spin_lock(&vm->userptr.invalidated_lock);
> > > >  		list_move_tail(&uvma->userptr.invalidate_link,
> > > >  			       &vm->userptr.invalidated);
> > > > @@ -1234,25 +1304,27 @@ static int vma_check_userptr(struct xe_vm
> > > > *vm, struct xe_vma *vma,
> > > >  		if (xe_vm_in_preempt_fence_mode(vm)) {
> > > >  			struct dma_resv_iter cursor;
> > > >  			struct dma_fence *fence;
> > > > -			long err;
> > > >  
> > > >  			dma_resv_iter_begin(&cursor,
> > > > xe_vm_resv(vm),
> > > >  					   
> > > > DMA_RESV_USAGE_BOOKKEEP);
> > > >  			dma_resv_for_each_fence_unlocked(&cursor
> > > > ,
> > > > fence)
> > > >  				dma_fence_enable_sw_signaling(fe
> > > > nce)
> > > > ;
> > > >  			dma_resv_iter_end(&cursor);
> > > > -
> > > > -			err =
> > > > dma_resv_wait_timeout(xe_vm_resv(vm),
> > > > -						   
> > > > DMA_RESV_USAGE_BOOKKEEP,
> > > > -						    false,
> > > > MAX_SCHEDULE_TIMEOUT);
> > > > -			XE_WARN_ON(err <= 0);
> > > >  		}
> > > > +
> > > > +		err = dma_resv_wait_timeout(xe_vm_resv(vm),
> > > > +					   
> > > > DMA_RESV_USAGE_BOOKKEEP,
> > > > +					    false,
> > > > MAX_SCHEDULE_TIMEOUT);
> > > > +		XE_WARN_ON(err <= 0);
> > > > +
> > > > +		vma_convert_to_invalidation(tile, vma,
> > > > pt_update);
> > > >  	}
> > > >  
> > > >  	return 0;
> > > >  }
> > > >  
> > > > -static int op_check_userptr(struct xe_vm *vm, struct xe_vma_op
> > > > *op,
> > > > +static int op_check_userptr(struct xe_tile *tile, struct xe_vm
> > > > *vm,
> > > > +			    struct xe_vma_op *op,
> > > >  			    struct xe_vm_pgtable_update_ops
> > > > *pt_update)
> > > >  {
> > > >  	int err = 0;
> > > > @@ -1264,18 +1336,21 @@ static int op_check_userptr(struct xe_vm
> > > > *vm,
> > > > struct xe_vma_op *op,
> > > >  		if (!op->map.immediate &&
> > > > xe_vm_in_fault_mode(vm))
> > > >  			break;
> > > >  
> > > > -		err = vma_check_userptr(vm, op->map.vma,
> > > > pt_update);
> > > > +		err = vma_check_userptr(tile, vm, op->map.vma,
> > > > pt_update);
> > > >  		break;
> > > >  	case DRM_GPUVA_OP_REMAP:
> > > >  		if (op->remap.prev)
> > > > -			err = vma_check_userptr(vm, op-
> > > > >remap.prev,
> > > > pt_update);
> > > > +			err = vma_check_userptr(tile, vm, op-
> > > > > remap.prev,
> > > > +						pt_update);
> > > >  		if (!err && op->remap.next)
> > > > -			err = vma_check_userptr(vm, op-
> > > > >remap.next,
> > > > pt_update);
> > > > +			err = vma_check_userptr(tile, vm, op-
> > > > > remap.next,
> > > > +						pt_update);
> > > >  		break;
> > > >  	case DRM_GPUVA_OP_UNMAP:
> > > >  		break;
> > > >  	case DRM_GPUVA_OP_PREFETCH:
> > > > -		err = vma_check_userptr(vm, gpuva_to_vma(op-
> > > > > base.prefetch.va),
> > > > +		err = vma_check_userptr(tile, vm,
> > > > +					gpuva_to_vma(op-
> > > > > base.prefetch.va),
> > > >  					pt_update);
> > > >  		break;
> > > >  	default:
> > > > @@ -1301,7 +1376,8 @@ static int xe_pt_userptr_pre_commit(struct
> > > > xe_migrate_pt_update *pt_update)
> > > >  	down_read(&vm->userptr.notifier_lock);
> > > >  
> > > >  	list_for_each_entry(op, &vops->list, link) {
> > > > -		err = op_check_userptr(vm, op, pt_update_ops);
> > > > +		err = op_check_userptr(&vm->xe->tiles[pt_update-
> > > > > tile_id],
> > > > +				       vm, op, pt_update_ops);
> > > >  		if (err) {
> > > >  			up_read(&vm->userptr.notifier_lock);
> > > >  			break;
> > > > diff --git a/drivers/gpu/drm/xe/xe_pt_types.h
> > > > b/drivers/gpu/drm/xe/xe_pt_types.h
> > > > index 384cc04de719..6f99ff2b8fce 100644
> > > > --- a/drivers/gpu/drm/xe/xe_pt_types.h
> > > > +++ b/drivers/gpu/drm/xe/xe_pt_types.h
> > > > @@ -29,7 +29,6 @@ struct xe_pt {
> > > >  	struct xe_bo *bo;
> > > >  	unsigned int level;
> > > >  	unsigned int num_live;
> > > > -	bool rebind;
> > > >  	bool is_compact;
> > > >  #if IS_ENABLED(CONFIG_DRM_XE_DEBUG_VM)
> > > >  	/** addr: Virtual address start address of the PT. */
> > > > @@ -52,6 +51,8 @@ struct xe_pt_ops {
> > > >  struct xe_pt_entry {
> > > >  	struct xe_pt *pt;
> > > >  	u64 pte;
> > > > +#define XE_PT_IS_LEAF	BIT(31)
> > > > +	unsigned int level;
> > > >  };
> > > >  
> > > >  struct xe_vm_pgtable_update {
> > > > diff --git a/drivers/gpu/drm/xe/xe_vm.c
> > > > b/drivers/gpu/drm/xe/xe_vm.c
> > > > index ea2e287e6526..f90e5c92010c 100644
> > > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > > @@ -623,8 +623,6 @@ static bool vma_userptr_invalidate(struct
> > > > mmu_interval_notifier *mni,
> > > >  		spin_unlock(&vm->userptr.invalidated_lock);
> > > >  	}
> > > >  
> > > > -	up_write(&vm->userptr.notifier_lock);
> > > > -
> > > >  	/*
> > > >  	 * Preempt fences turn into schedule disables, pipeline
> > > > these.
> > > >  	 * Note that even in fault mode, we need to wait for
> > > > binds
> > > > and
> > > > @@ -647,6 +645,8 @@ static bool vma_userptr_invalidate(struct
> > > > mmu_interval_notifier *mni,
> > > >  		XE_WARN_ON(err);
> > > >  	}
> > > >  
> > > > +	up_write(&vm->userptr.notifier_lock);
> > > > +
> > > >  	trace_xe_vma_userptr_invalidate_complete(vma);
> > > >  
> > > >  	return true;
> > > 
> 
