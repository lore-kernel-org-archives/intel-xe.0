Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5A48CCD185
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 14:59:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 986B310E824;
	Wed, 15 Oct 2025 14:59:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cUpfysOz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B47BA10E81E
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 14:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760540378; x=1792076378;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=S40qamoqNdgn4S3L3sLR50XZi/nYIq0xbTvEbIFnxSM=;
 b=cUpfysOzc+RgiULn3RP53OSggEFNx0DpC2zJ4C4dIFqjDlX5wy82n9sP
 rplTDR/NKZeJ1R8QbeSDU6HjR0HG2HrNdf9NbA7kEr7so6Kc1F6Nul/Rs
 cswjTCiClsO+GFmFCoAQaHsC8gtfcDO545fg/JFe8h5tGDnq1NuM28ioe
 LErJHAzB+zNsd9whk6vfVnD5jMAj6NQ+R9nuM7sLwA3R7tKe0/96L9gio
 wYbGqHz4T4L8btTi9MjJ+jcI6e1ypeSF+JCQ3EMVvs0asMAurVXwxseNH
 SN7wGpoW5KKzno/gKhzARSUOxwWnVW6KXzf+sN38262mI+Lc7T3f//ES+ w==;
X-CSE-ConnectionGUID: buUXDStiR5aaV2rZWveueA==
X-CSE-MsgGUID: fQM1O5ZAR+2b00zbCgy4jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="61924510"
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; d="scan'208";a="61924510"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 07:59:38 -0700
X-CSE-ConnectionGUID: EXgF54ehSNutTwKSuc95dg==
X-CSE-MsgGUID: J8q3ZvkwTSi+XDERH3beZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; d="scan'208";a="182182387"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 07:59:37 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 07:59:36 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 15 Oct 2025 07:59:36 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.11) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 07:59:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H8ifhjUanU963pOhA2qqsLDDV92hFpevZG9quOv5+ExJPJyB0RTWwGyaf197xSzdpbu4qSDUtw9ttQChp1Fz0IQKguPlmYtwtWURpgV/80n/JJc5uuHe7LBmja1CyNnQHcq0rO/CaLMmrIxO9XshsSGAqHI8SsgB7SbTtOU6RlTlSss8uFIC1+UFxWdv2t0MdcC58jZKgyGALGFfvgtWwPK3IIS/N5yTsNZLB3Mstr65hN6q+1W67C6na4HpN6uQCcWvK+/NiK5WMMLla0iVuDkVUVuKn3QKjzNJES5oVImo1z3kcEGsz6x++d/t5kymJqLVlPko4ylBN1g4F+jKZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S1PegJIzfEW5hrbzXM94CvkOdCalD9NFHaygGhWnXjQ=;
 b=f8Jez4czbxFdg1Fc67h9U+R1I+PvYor/zkqdaZgTYWQifzxWy1DYOW0hl4SnJ+ThuzpRAXyup+2GcRbmM8WyZAGymuITvrd0BLbo9PTxKLNyGrJqWUHbr13/SUUBEnz7DCVXIHT1psJ3MSgePpgKZ4j7e+OyuihC0WUyojG5sW51fnTJJ/1AnPgKAR3jucdOtMqFcJ5Cj4crAbhYGbWBMGfEx9FFXq+7EfcKwIXYRJICTdQtArP3Dd8NS3XLl9KXlwGEaC3NAE1e6YoGOk7MAqANf+jF/k6bDZ+pv2si6dVv/+Q7obZWEN/OY2dpL1sQ8W/3w+OC2k8Tx38u7lJtmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CYXPR11MB8690.namprd11.prod.outlook.com (2603:10b6:930:e5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Wed, 15 Oct
 2025 14:59:34 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9228.009; Wed, 15 Oct 2025
 14:59:34 +0000
Date: Wed, 15 Oct 2025 07:59:31 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Shekhar Chauhan
 <shekhar.chauhan@intel.com>, Balasubramani Vivekanandan
 <balasubramani.vivekanandan@intel.com>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>, Brian Welty <brian.welty@intel.com>
Subject: Re: [PATCH 03/23] drm/xe/xe3p_lpm: Configure MAIN_GAMCTRL_QUEUE_SELECT
Message-ID: <20251015145931.GI1207432@mdroper-desk1.amr.corp.intel.com>
References: <20251013-xe3p-v1-0-bfb74f038215@intel.com>
 <20251013-xe3p-v1-3-bfb74f038215@intel.com>
 <20251014163403.GO5409@mdroper-desk1.amr.corp.intel.com>
 <jkedmz7ocmab6vs5wchwuazhpmysh4synxcd6hrs3a7v5g2vlf@suwamovrz6jb>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <jkedmz7ocmab6vs5wchwuazhpmysh4synxcd6hrs3a7v5g2vlf@suwamovrz6jb>
X-ClientProxiedBy: SJ0PR13CA0135.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::20) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CYXPR11MB8690:EE_
X-MS-Office365-Filtering-Correlation-Id: f0c512b7-39bb-4712-2fb7-08de0bfb73b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PYKeqxRsLU4xGPmHlrPA4Q51md0qivBE+ELMzJpJ4GCeMA7t5IeS+VwRtpGd?=
 =?us-ascii?Q?98SK/zL4zFJnsDvanNjdaqJLqsSdP59vgyf3y3gVs0wukuNc2DnHJFZ0hRnl?=
 =?us-ascii?Q?D0SJdtMGQeEKMr0Fypd5eriIUAjOAZpn2oLoiuh+ZvVtGolFtkmDwhXF8HOF?=
 =?us-ascii?Q?VHPw7hQp7IWFIXYm2NYzhOUKEMWu63F+Ns7y4UQn1/Lhl11k5ofISSOmSCmh?=
 =?us-ascii?Q?vbDHzyzLOao5N5mPdy1lfDiv93mOMP9j7PR8u0+xiezxcF6ngHht2PhnUtxB?=
 =?us-ascii?Q?Qs1Z1Xezhf4DVwNyEqL0D/oRa1jiljEp2Ym/G4ilwhJM5DBTWFCA/cl4A7Hk?=
 =?us-ascii?Q?ZjZy0tIMxMLkRpfU6kYI+cPERTXGZK8iXN3lo/zzdFHxmgpbXeqprP0ZQupD?=
 =?us-ascii?Q?5fZKEl1OIAWdZ/KmhrZjFqfktiU6I/PqFft51G2pC8+Ru4C2S89SD14p+J5m?=
 =?us-ascii?Q?lju7ePD0gyjBXY1MaqyDMo6LxD+8q/GK4Du+JCayARgW8JcP2WoptFGGfczx?=
 =?us-ascii?Q?D3ynSYo9Bp7qEj/hcMnPFk9pQnPdBcWLeCQwE3xgX+YuEvqlsew/skY5ieOl?=
 =?us-ascii?Q?1I/pqtzDa7C2QzyUTsbCzISsEkIoYrKhLecdYXD8j2BP7AY3DvLCXxkkxfVe?=
 =?us-ascii?Q?gYnEFu7mqDSoAIuwOUn/TwCg6J2E6RZe3ZrxG524HSB/V5Tog57zUTYr0NX9?=
 =?us-ascii?Q?tOuAWOmTmvyPOKOr8hU0zzH50yrdYLH8UA9o3BFDLhnwmx8t4m2Yhmsno6Gn?=
 =?us-ascii?Q?E/dWV6bt4Z9SKuxOiH017ZEAfO8A+u8kgtckp2JhMgXv9SXD6yLMB0WPxKf6?=
 =?us-ascii?Q?eLPaeePPNP/M6fK/W/3VFthUUIH5rP9OOLh9LPBWjQaFSyuZEB5nE+VL+X0Z?=
 =?us-ascii?Q?7ddBoL0S2NhUNtUCHdtyxdrleWt0SWdLZ8Lcl7nJ2jHNCK6C4Np/BKRfCfzh?=
 =?us-ascii?Q?11Wq9yIcL+56SjSXHXDPeulVxQx3Cs9nY5Ch21GAruSjTApZOZnQ1VKOtG63?=
 =?us-ascii?Q?TcUU9OrOMDdo8w8gAQhuHEoH8G+Lj/7EBhjfTUtFBSAxHAfrpmklSbkuv69x?=
 =?us-ascii?Q?wsZHLFplpfJ9Ww1sgnhAz0TRTGKffEa1jzo+Py8L8hPQxZXu35uz1v5s7EIM?=
 =?us-ascii?Q?5qZYWLHEJh/LXsjyBuozIQfNAUnZ9s0w9xTILI/m+tfxyCE6qAbZhbLgPvDw?=
 =?us-ascii?Q?EZmh+c2zSmKnYVUShIBMOcQvSLzb/AEcGBQ7CO08IiAOdGmXL6s4oNyD7GzQ?=
 =?us-ascii?Q?2FTGUqSDManEOgMAdyzjqIvF4/mF5BVGC4KJlH3YCCxVIwMhiJhQC/+Ov31u?=
 =?us-ascii?Q?zLuX9D3azsApojvumlM00eZK2MA7DodTv8a0v1ICBmWHJloHb+2hBxSGQEcH?=
 =?us-ascii?Q?Qxtd2rn4jfhb/kLVEdDtHV/aa9c07bSXuqGioeNcZWnxagB1+/t+QhjZPGCj?=
 =?us-ascii?Q?gQYpTRKDSoTdDdXH1uVKDIa35MNksiTU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?E8ttBTFhQw4tdiWu49LfCG2aVvx+887kxZCb5/m5mRApFwnFBnLqzcqp3oF/?=
 =?us-ascii?Q?1T+jqdfwDXZKTT2xBPjvHhKutTdxTPZcfO3bGYYu7/BL9aqZUaSGWffuXFeA?=
 =?us-ascii?Q?j9193jVOoPgTriuCN/pLOSXzxH+A8WljfG23cflhYgER0Owg6h1ocvTPEK4w?=
 =?us-ascii?Q?Lc2lP7O9Vo07UT/e7gj//F5wSKIrMpyT+NZrgxEOLoTgvhgN5HO8v3WrqVpe?=
 =?us-ascii?Q?uoMW9IBbuEUWUxCgK9F9H1/Vm6+xs6UWfO3Ag4zcIak+EzM8kr+chY4cSM8d?=
 =?us-ascii?Q?/CBnihD9yifV/o9gMA6tLJfuS0xVkkwN7Za68z+s+vv08I1A66tiH/a1k630?=
 =?us-ascii?Q?XvPa8XJQ+0OhhEhUzBmbhzJcqLPY9VcOD4dIwzczc46RZPEqx4HhzZ/1tvYH?=
 =?us-ascii?Q?/rxvOb8fOA7fyf/zH4uOkAE3S7XEGNd0PPp2AskkN0LnnlVt6l/at2RgiUEZ?=
 =?us-ascii?Q?bSnHqSz7LWQG5bItMLgXaDPc/bxhdO34F4N9UlJB4e2pUHYQl+4j/7+j74SF?=
 =?us-ascii?Q?8d0X6/p9t9gumBvT+how/RNMs9g2ucjaGVln5evpHjJOzJEvuErnD3kWvrOl?=
 =?us-ascii?Q?W80stjwhoET586lThgutv/9yVLvEDQbFCh4Ff3uky+hApijgHpcMawWn2g1c?=
 =?us-ascii?Q?9ggSFWVc8huCZpzYMW2QL7sJ0F39/Zoz7/j3nhnOfNNWastoQKhUf6Ems8+e?=
 =?us-ascii?Q?Tqh31MZmUfv3eANJM+RQhblopHL3RJDoY59yPo3++F5FUyZX2y92S2M2Rreq?=
 =?us-ascii?Q?ci6NqjO+jtRGTHZJqF+ZsaJ6UljmNtviFoLKpAO+evt+SGb9GX9gy+hGEhsW?=
 =?us-ascii?Q?XTXtDMI07f+sMs/U3oxfl7GMkjebHdZjGxjPM701cdHFR1dNBTE4u2z5zoZ7?=
 =?us-ascii?Q?coc4kx1Qdp376ksYf1yQ6zQxRooRHXBajXJ57odQFblGp2MPWqxrbKFs3Es9?=
 =?us-ascii?Q?Ukyt+XDfnBzUBGWj02NOgIjhb7Op7sgBPBfCm0qUBUoJlRA3kKzQTND5J4jo?=
 =?us-ascii?Q?qZ6Nck1EPBQmfwcmlVEwZBxhvc5HYdY7C5YILLQBEWYG5kC3nnT38DyFoIEy?=
 =?us-ascii?Q?CIKEROf9SpTmL76BA2FfagHZOhscMzug8gFjYzsBHhTeP1bxQDqVim6gcri7?=
 =?us-ascii?Q?9UQUYfxxkFu2OvaKToY5uYVB4CNm1HyE1/PKbvMmNuj1QdQAKkQ2Ml0gzlfv?=
 =?us-ascii?Q?e+enkw6uLfJ7XpWMKIIS5eBIS0yNzUlHQuOYB/tsDqFcskdINTgJIXkn274g?=
 =?us-ascii?Q?g4Gkt2+q7U5oOW7kkp8bdwoeBJf3IGEO/yiGpLJoZMAeYNxwfSag/EGqsL1B?=
 =?us-ascii?Q?TIl6ntjrs4Jx+zRKdnrIWn+pV7cnrq2uayoFz+XqXLJpKj/VjKdWQeZLlc6y?=
 =?us-ascii?Q?3GJ9/Xx53V0BDPUAVXdBVDum9l9omLAO6nLsdLUvsAXn/kxpR6TEgWwmhTe4?=
 =?us-ascii?Q?ZxUSg60BIi2WwICf7Zt9lbRDKfg/WeQn47o3yn3wrA6gbNJk5Qo+Q88mnJk2?=
 =?us-ascii?Q?qf1r7Auve5SttLQvVJYlnHF729UJYUobVLh+tFDA2uugxUDcFLrF9oIqzt90?=
 =?us-ascii?Q?kqkIHql0fwxU6JPJUJj71Gnp82ZbHH2dRmLOCqIaGL9rXI0HmMU4QTJs5Ret?=
 =?us-ascii?Q?bg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f0c512b7-39bb-4712-2fb7-08de0bfb73b8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 14:59:34.1592 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M0vot/JU4VNIF5OjTAc+RabkbAdZDeFQj0z/pMhAD/d609tv841yiPFr7JNX9/cg4AyI+Ndli9uV8pNfCTGw46pzcH1xkjsvrOhgYttHIfM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8690
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

On Tue, Oct 14, 2025 at 09:28:19PM -0500, Lucas De Marchi wrote:
> On Tue, Oct 14, 2025 at 09:34:03AM -0700, Matt Roper wrote:
> > On Mon, Oct 13, 2025 at 08:24:35PM -0700, Lucas De Marchi wrote:
> > > From: Brian Welty <brian.welty@intel.com>
> > > 
> > > Starting from Xe3p, there are two different copies of some of the GAM
> > > registers:  the traditional MCR variant at their old locations, and a
> > > new unicast copy known as "main_gamctrl."  The Xe driver doesn't use
> > > these registers directly, but we need to instruct the GuC on which set
> > > it should use.  Since the new, unicast registers are preferred (since
> > > they avoid the need for unnecessary MCR synchronization), set a new GuC
> > > feature flag, GUC_CTL_MAIN_GAMCTRL_QUEUES to convey this decision.  A
> > > new helper function, xe_guc_using_main_gamctrl_queues(), is added for
> > > use in the 3 independent places that need to handle configuration of the
> > > new reporting queues.
> > > 
> > > The mmio write to enable the main gamctl is only done during the general
> > > GuC upload.  The gamctrl registers are not accessed by the GuC during
> > > hwconfig load.
> > > 
> > > Last, the ADS blob for communicating the queue addresses contains both a
> > > DPA and GGTT offset. The GuC documentation states that DPA is now MBZ
> > > when using the MAIN_GAMCTRL queues.
> > > 
> > > Signed-off-by: Brian Welty <brian.welty@intel.com>
> > > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  3 +++
> > >  drivers/gpu/drm/xe/xe_gt.h           |  6 ++++++
> > >  drivers/gpu/drm/xe/xe_guc.c          | 27 +++++++++++++++++++++++++++
> > >  drivers/gpu/drm/xe/xe_guc.h          |  1 +
> > >  drivers/gpu/drm/xe/xe_guc_ads.c      |  6 +++++-
> > >  drivers/gpu/drm/xe/xe_guc_fwif.h     |  1 +
> > >  6 files changed, 43 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > > index 51f2a03847f9d..47e13a3fb9072 100644
> > > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > > @@ -545,6 +545,9 @@
> > >  #define SARB_CHICKEN1				XE_REG_MCR(0xe90c)
> > >  #define   COMP_CKN_IN				REG_GENMASK(30, 29)
> > > 
> > > +#define MAIN_GAMCTRL_MODE			XE_REG(0xef00)
> > > +#define   MAIN_GAMCTRL_QUEUE_SELECT		REG_BIT(0)
> > > +
> > >  #define RCU_MODE				XE_REG(0x14800, XE_REG_OPTION_MASKED)
> > >  #define   RCU_MODE_FIXED_SLICE_CCS_MODE		REG_BIT(1)
> > >  #define   RCU_MODE_CCS_ENABLE			REG_BIT(0)
> > > diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> > > index 5df2ffe3ff838..9d710049da455 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt.h
> > > +++ b/drivers/gpu/drm/xe/xe_gt.h
> > > @@ -22,6 +22,12 @@
> > > 
> > >  #define CCS_MASK(gt) (((gt)->info.engine_mask & XE_HW_ENGINE_CCS_MASK) >> XE_HW_ENGINE_CCS0)
> > > 
> > > +#define GT_VER(gt) ({ \
> > > +	typeof(gt) gt_ = (gt); \
> > > +	struct xe_device *xe = gt_to_xe(gt_); \
> > > +	xe_gt_is_media_type(gt_) ? MEDIA_VER(xe) : GRAPHICS_VER(xe); \
> > > +})
> > > +
> > >  extern struct fault_attr gt_reset_failure;
> > >  static inline bool xe_fault_inject_gt_reset(void)
> > >  {
> > > diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> > > index d94490979adc0..37e3735f34e63 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc.c
> > > @@ -91,6 +91,9 @@ static u32 guc_ctl_feature_flags(struct xe_guc *guc)
> > >  	if (xe_configfs_get_psmi_enabled(to_pci_dev(xe->drm.dev)))
> > >  		flags |= GUC_CTL_ENABLE_PSMI_LOGGING;
> > > 
> > > +	if (xe_guc_using_main_gamctrl_queues(guc))
> > > +		flags |= GUC_CTL_MAIN_GAMCTRL_QUEUES;
> > > +
> > >  	return flags;
> > >  }
> > > 
> > > @@ -1255,8 +1258,13 @@ int xe_guc_min_load_for_hwconfig(struct xe_guc *guc)
> > > 
> > >  int xe_guc_upload(struct xe_guc *guc)
> > >  {
> > > +	struct xe_gt *gt = guc_to_gt(guc);
> > > +
> > >  	xe_guc_ads_populate(&guc->ads);
> > > 
> > > +	if (xe_guc_using_main_gamctrl_queues(guc))
> > > +		xe_mmio_write32(&gt->mmio, MAIN_GAMCTRL_MODE, MAIN_GAMCTRL_QUEUE_SELECT);
> > > +
> > >  	return __xe_guc_upload(guc);
> > >  }
> > > 
> > > @@ -1657,6 +1665,25 @@ void xe_guc_declare_wedged(struct xe_guc *guc)
> > >  	xe_guc_submit_wedge(guc);
> > >  }
> > > 
> > > +/**
> > > + * xe_guc_using_main_gamctrl_queues() - Detect which reporting queues to use.
> > > + * @guc: The GuC object
> > > + *
> > > + * For Xe3p and beyond, we want to program the hardware to use the
> > > + * "Main GAMCTRL queue" rather than the legacy queue before we upload
> > > + * the GuC firmware.  This will allow the GuC to use a new set of
> > > + * registers for pagefault handling and avoid some unnecessary
> > > + * complications with MCR register range handling.
> > > + *
> > > + * Return: true if can use new main gamctrl queues.
> > > + */
> > > +bool xe_guc_using_main_gamctrl_queues(struct xe_guc *guc)
> > > +{
> > > +	struct xe_gt *gt = guc_to_gt(guc);
> > > +
> > > +	return GT_VER(gt) >= 35;
> > 
> > Revisiting the spec on this, I'm not sure whether using GT_VER() here is
> > actually the right thing to do.  As far as I can see, the media GT does
> > not actually have a "main gamctrl" register range at all (i.e., bspec
> > 76445 only lists MCR gamctrl ranges, and 0x38EF00-0x38EFFF falls within
> > a reserved/unused block).  That means that registers like
> 
> true
> 
> > MAIN_GAMCTRL_MODE that we're trying to write during xe_guc_upload above
> 
> We do have MAIN_GAMCTRL_MODE for xe3p_lpm in bspec 73540.
> The tagging is odd, but there is a reference to the register at
> 0x38EF00. It wouldn't make sense to have a 0x38xxxx register instance
> for primary/graphics GT.

I think this is an artifact of how the bspec's web interface is being
strained beyond its original design considerations.  0x38xxxx copies of
GT registers get listed somewhat automatically, but on platforms where
they've split things into separate "die" designators, the 0x38xxxx
register should be ignored if it _only_ applies to the "graphics" die
and isn't also tagged as existing on the die that actually holds the
media IP.  That's the case here since the media die doesn't show up in
the list of "platforms."

This is unfortunately very non-obvious and confusing.  :-(


Matt

> 
> So either
> 
> 1) we don't have it like you said
> 2) we have it and there's something missing in the MCR range
> 
> > don't actually exist for the media GT.  Furthermore, the tagging on the
> > register detail page 73540 also seems to imply that this only applies to
> > the primary/graphics GT.
> 
> so... in that case we'd need to check both the gt type and graphics ver,
> so we load GuC with those different flags. I will take a shot at that
> and check if anything breaks.
> 
> Bala, since you did the patch following this, do you remember of
> anything related to this?
> 
> Lucas De Marchi
> 
> > 
> > 
> > Matt
> > 
> > > +}
> > > +
> > >  #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
> > >  #include "tests/xe_guc_g2g_test.c"
> > >  #endif
> > > diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
> > > index 1cca05967e621..e2d4c5f44ae34 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc.h
> > > +++ b/drivers/gpu/drm/xe/xe_guc.h
> > > @@ -52,6 +52,7 @@ void xe_guc_stop_prepare(struct xe_guc *guc);
> > >  void xe_guc_stop(struct xe_guc *guc);
> > >  int xe_guc_start(struct xe_guc *guc);
> > >  void xe_guc_declare_wedged(struct xe_guc *guc);
> > > +bool xe_guc_using_main_gamctrl_queues(struct xe_guc *guc);
> > > 
> > >  #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
> > >  int xe_guc_g2g_test_notification(struct xe_guc *guc, u32 *payload, u32 len);
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> > > index 22ac2a8b74c80..bcb85a1bf26d9 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> > > @@ -820,16 +820,20 @@ static void guc_mmio_reg_state_init(struct xe_guc_ads *ads)
> > >  static void guc_um_init_params(struct xe_guc_ads *ads)
> > >  {
> > >  	u32 um_queue_offset = guc_ads_um_queues_offset(ads);
> > > +	struct xe_guc *guc = ads_to_guc(ads);
> > >  	u64 base_dpa;
> > >  	u32 base_ggtt;
> > > +	bool with_dpa;
> > >  	int i;
> > > 
> > > +	with_dpa = !xe_guc_using_main_gamctrl_queues(guc);
> > > +
> > >  	base_ggtt = xe_bo_ggtt_addr(ads->bo) + um_queue_offset;
> > >  	base_dpa = xe_bo_main_addr(ads->bo, PAGE_SIZE) + um_queue_offset;
> > > 
> > >  	for (i = 0; i < GUC_UM_HW_QUEUE_MAX; ++i) {
> > >  		ads_blob_write(ads, um_init_params.queue_params[i].base_dpa,
> > > -			       base_dpa + (i * GUC_UM_QUEUE_SIZE));
> > > +			       with_dpa ? (base_dpa + (i * GUC_UM_QUEUE_SIZE)) : 0);
> > >  		ads_blob_write(ads, um_init_params.queue_params[i].base_ggtt_address,
> > >  			       base_ggtt + (i * GUC_UM_QUEUE_SIZE));
> > >  		ads_blob_write(ads, um_init_params.queue_params[i].size_in_bytes,
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
> > > index 50c4c2406132e..c90dd266e9cf9 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
> > > +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
> > > @@ -113,6 +113,7 @@ struct guc_update_exec_queue_policy {
> > >  #define   GUC_CTL_ENABLE_SLPC		BIT(2)
> > >  #define   GUC_CTL_ENABLE_LITE_RESTORE	BIT(4)
> > >  #define   GUC_CTL_ENABLE_PSMI_LOGGING	BIT(7)
> > > +#define   GUC_CTL_MAIN_GAMCTRL_QUEUES	BIT(9)
> > >  #define   GUC_CTL_DISABLE_SCHEDULER	BIT(14)
> > > 
> > >  #define GUC_CTL_DEBUG			3
> > > 
> > > --
> > > 2.51.0
> > > 
> > 
> > -- 
> > Matt Roper
> > Graphics Software Engineer
> > Linux GPU Platform Enablement
> > Intel Corporation

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
