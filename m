Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D75ACCD1BF
	for <intel-xe@archiver.kernel.org>; Fri, 24 Oct 2025 15:58:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BF0610E214;
	Fri, 24 Oct 2025 15:58:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A6colt3c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF6B410E214
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Oct 2025 15:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761321497; x=1792857497;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ClKDE3Wua3vXBgHk+U56s81ueJN4/Sk9LCRUKRIhtsg=;
 b=A6colt3clVr1AqPjXdPQzJZX47wDEIa1PDA0ImilGsGqPjNE98UiyY9T
 zSNFZTfz3KJdKMfhbzIN1uDZCamqvRS9GJxaRoE9gAnelxauHDx07uCTK
 yweD8ql+0MXXlx2/5L3NPRBB2y96d4yCq5ZrYXjoSk9vsMXPrCOEs894p
 psTSJ1Kl7giSgknotd5SEgHOUzeibAxNSVvK/DX84YJra7VF2vRC0cW8L
 FtSWxR1ucaD8sEfgCnLpP5RT4XQ8RNkfsM0PyUhHCM2VUn9rs+Jsf9RkZ
 oKKR0p9pccd762bxuBzgai2k29NQG+jMuMo5q3VNxa61d4vTBaEZ2JZcr w==;
X-CSE-ConnectionGUID: +IEl8H93RnajRJWAJhXzoQ==
X-CSE-MsgGUID: KNzG3B10QIyUdgA5ahWhqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74177053"
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; d="scan'208";a="74177053"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 08:58:16 -0700
X-CSE-ConnectionGUID: AZbnJRXvSpSTOsQ/hk/P2Q==
X-CSE-MsgGUID: t725DMLqRjyMU1R/aGfY9w==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 08:58:16 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 08:58:16 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 24 Oct 2025 08:58:16 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.1) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 08:58:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ow4WZt5TtyEGBXXxZsYp+4Ps4H0c3ItpyqXMuQHFtvKXGL9PegxUafzVAym1QJJA7BNuT26kET+Hen6F+1YFXBzVs5Xj2JaElrcG5YagnMmZr39wNrfAvs2IbBAox+e55HUZXHksbQcXh+2p8Io5kVNvXdJ+M1pX27RrEtkTlXVH86jqYCHlMD4YdZ8pwB+ZWlilQETo6Nod6PT3r2x7VeM6aqsUgWLCyyjZSoAWCq3pvICrwEkmEvJJStQAe/mHBsvwApjSb4fKe+QJLvTsKsCL8g30GS190jJoE9p2bwPQbZtrrOEraM8VEe0adU89rzE+c+CALWDq79EojKgxHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KDwJd/uPcbqhYxKyEhcDamzzhwyLk6kJG/HroV0mjDw=;
 b=V/fOH0H5Zkdn/vk4RX/obc7zzuq0leXBdhwD0P/DnqB2otI8EsYN5GBTfdRoBryeuFafTQhHfr68FjgjkSH14v6Xx2VGQpVWOa/Dw5/e+/Xw8nfpWVTqtiK1EfCpGRiZeqiFCwAmsvF68RrMr4AO3fl0jFIokQ0bxv7UleOchz5bb6ZJxylgTIJIQpNbPk6w9+OW+MwfVzRjjUnxYN//Pb3NN9t7GD3VAGLCGZlEzdBbLaOz5Bi1cu68t0iGl1i4XroylWprvOaEwKqDGcIvO3opjW4YXVyn20yJNIgfcxbmeyrTy9LffzqrpHFFJ6hUIJPRiT/F+QqRV3xALriQhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ2PR11MB8513.namprd11.prod.outlook.com (2603:10b6:a03:56e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 15:58:14 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 15:58:13 +0000
Date: Fri, 24 Oct 2025 08:58:10 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Michal Winiarski <michal.winiarski@intel.com>,
 Tomasz Lis <tomasz.lis@intel.com>
Subject: Re: [PATCH v2] drm/xe/vf: Fix up GGTT on S4 resume under SR-IOV
Message-ID: <aPuiEoi6zyEFw7U5@lstrano-desk.jf.intel.com>
References: <20251023064610.4499-2-satyanarayana.k.v.p@intel.com>
 <aPrpPxQxUq/M/14S@lstrano-desk.jf.intel.com>
 <30bed83f-9730-43fe-a81a-719057d03e33@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <30bed83f-9730-43fe-a81a-719057d03e33@intel.com>
X-ClientProxiedBy: MW4PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:303:8f::11) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ2PR11MB8513:EE_
X-MS-Office365-Filtering-Correlation-Id: 74796b0c-606f-421a-625c-08de1316236b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DMQM5Bpvaic3RWzYDkL3RGcujg/bNzaR0V19fginE3nUi55sH0acz/d2i67r?=
 =?us-ascii?Q?stju+6DA+p4MoxiA0P1j0M5bc582gaU0A9iIjDQOB57U/5rgka3PaRT2LHMn?=
 =?us-ascii?Q?eN4qy/kU0bXrrUBqttzg0TJDl6us7IWJHlq/27JhUpHtFtsmy0/TW4Aknksb?=
 =?us-ascii?Q?GaY9GNRGt2w7pp/dDPzHOaOnDkZOp2WQRhwcT6K8ZBOwCAOm367+RC73kYNR?=
 =?us-ascii?Q?5skAnkl24AUF8DOJiopTs4Q5/9SUUL6B+Ry3rv/zXnqLeqEUKEjOR6BunyQi?=
 =?us-ascii?Q?fmaaA57V+dp4hERodOttcfuvc8F8aNZTdXwvw8LqSDwWWl69fgCz/NYEkBu1?=
 =?us-ascii?Q?3rI89N4KkcaO7wYi34pLurwNJj/ktGCxTG4cS2bzUE8Oe8kLrMeZhIhS/ONC?=
 =?us-ascii?Q?nbkggXzveDOlYFm3xV1GJb1xaMa5DWxG5sMPum70r0dJkvTA4yyeGutC/rRT?=
 =?us-ascii?Q?tz2S3Gn3A1l4dkoGvF4ru1aQGds/0OI1Huy0cDMjPPO0DZy4+dfC7bVTaK83?=
 =?us-ascii?Q?XBho6KBim1AojQxQzxQO5wEhJnXXzqX8nVLCD2yfXlJjyRDt31bxgq1ZCBKB?=
 =?us-ascii?Q?7hPxc7p7WIYN8U2adkXAbp55D2Uw9iReUt9KaygRLz8uIOo91MuOIxhwUq7q?=
 =?us-ascii?Q?OVbaeX8q30yn7BtT1mID7hj9obX51AfPjx6ZMmPEIqNZmQICJ3aZ9uUptEY8?=
 =?us-ascii?Q?/FVWqcG2qWgW4LVLI50wkitw6/fi7nFrVZQCgo4Qb4zeRaXOr+9YTuICfyUL?=
 =?us-ascii?Q?iMDW10SgCe00gntmTZT2VUDbUP5aLbJN4WAjMo0lNE7Z+mggH1a/e/50mpM8?=
 =?us-ascii?Q?Ut6tNmGoAZM8OOulLwwRwChP9ze9+5JEvHrhdDBBT8ir9a3oJue5Ul99FXzp?=
 =?us-ascii?Q?1swdKOWzT9MFA+phcBcRnomVcg8BBl8VvImV73eHIlbnBVqsdYD2OGG81win?=
 =?us-ascii?Q?fttlWKIvxqUsUS4+LdM4EKBooC37+wAhNDCzsA/TtlhanEkUEKEDPG0eVj9m?=
 =?us-ascii?Q?G3w6P/C2f5BHlSijZ+QL7VqR3QXZHT3+irCuSNEldDA5SJv959A/juRREBRy?=
 =?us-ascii?Q?ZGm6EQEun/EFCf7IHfnZhRRWPuhga3GEqDsjuUkdMnEwRN79GlnhLs/+f0Qp?=
 =?us-ascii?Q?RhLF6f2yZGsK5o//XL4taFsZgz4E0P1l0rUDTq/PIY7uRtoVwsYkCRjTThCc?=
 =?us-ascii?Q?Xp31mSbKTlomTRmW7rJX3+eOZnr7LpHWugziVcqYDAzaYxKuMs9tMKPlJlh5?=
 =?us-ascii?Q?BGIVl/8C7ZeFzOSA9+2GvQs+96FQ/PoMu+jTPz98ZUFhudOifDBswOhfSyDo?=
 =?us-ascii?Q?siuct0YgkPc0WLgyHqXLfksc/Vh1lnCyfAapazI9gQFyIl5z9JcLwo2TdCxQ?=
 =?us-ascii?Q?czEOz4ZKTnLWw+MLFQPr+SgqVq8dHTcGF46Ca8j3NPoYD2XAbfBGg+/4mBzS?=
 =?us-ascii?Q?p+e+jh4R97Tqgv70OXRMqT+3ElpWxH7m?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qAy3KAZC3dc7B49j4iM+dZiM+Yl0e7OM2rYLktVfM78YNoyrYtWmoeuezXTN?=
 =?us-ascii?Q?ThkUG49/zZf2j+KJxJobbUpgGfawHTE086Rw0iKvEmJzJbW2bNsTWoa0bZXK?=
 =?us-ascii?Q?Gf0sphgB1DYkEC2w+8hqPdfwdBFRUeNoer3BkN6ddT+5g9s0HYlGIv2vF6WH?=
 =?us-ascii?Q?H50VI+RTMi8xNevdU5XweUnlxeeVyVrtf+fYRvwkBxDL2rh7ddZ3rho93SXk?=
 =?us-ascii?Q?ng8akLGKAF0Emj30NNRC9Pa/T1MiYNUTYObor6SfWbsWiRc7rHu4eB2MAl/u?=
 =?us-ascii?Q?Gb/CduB56Hq9lOP5yEr6fpImqGJLjRyGfZsQN8lOGzTEQyl1sU4Bu+R/zOwc?=
 =?us-ascii?Q?e1hc7pMrEFWWkUNaKdkGl61gIaU8JGYFznNHA5YNwVI2cfaoFxykECXhCb+o?=
 =?us-ascii?Q?kVAgKy7hJTV04qi+/JrwHudnma33kU3e5b09sUw7yZcAF1y4lybOcIJFpakP?=
 =?us-ascii?Q?qhrS0H8pYquHeHsBJTIFB1R2Z6u5z2RIxmLUFktxblVRsiiYTFXfh7e57bRa?=
 =?us-ascii?Q?fVtFDcXZ+pSw4cBQwu14TCf/Q7eEaNjnmdlD15iqBx8OeYLq+2n9e06PMq8p?=
 =?us-ascii?Q?bMJMZ5MmMT3cNYCwUPT9Sy1VtF9jW3+Nyhr22RYnKS0LXj3e44r71GNTtFsr?=
 =?us-ascii?Q?LArApglS0hajzxF3y97PsEDsLpUveEeIEljYmBz0yo5LPN2G4pcFUmRktOEt?=
 =?us-ascii?Q?khLLSgiX4pAIqz4/5eQctTCsgPAnuyfTRMbriqSr2aX4fL7W1zXlFvtgprxn?=
 =?us-ascii?Q?W52iSBgnMLyJZtdLgMIr8efiuArCrIDeiqyhByeqSVV51oIwfAMkMSK8GpGG?=
 =?us-ascii?Q?zHCb8h6zfMtJR1kmDRmjYiRQoEKRukcnBV7jImadJ0Dh9UHi409NfnqgSI6c?=
 =?us-ascii?Q?SjMNZjeWTQOwRj/VCiTp1Ll4LL30ZD+oXK7SGckdMViBatEzgLMH8lpxD7MC?=
 =?us-ascii?Q?s6xd1pU3yRvEDA2Yx6+79mZYSe3YHYZKkLxFNovUyyfRLlu2wmGXOqTWj9zz?=
 =?us-ascii?Q?3dYxLXLb+AaRtie1tazWj8SS3NbfLMBHYNz1aa3Lid9klxcD6iWty1SDlkEp?=
 =?us-ascii?Q?37d7gAv8ie204vgV6LObfOsb2toym0T+DDezU/8Wxt7U0VFYi3JGOkdmkDEI?=
 =?us-ascii?Q?835y66QM7WK8lH8CtJ1ahM1EHbTeFrbmtq38BmKLqQDWRucmIvxYiMnV33pU?=
 =?us-ascii?Q?84KIeu6rhOIH1xziy0eeMIaE7/BMNq+2tkxA7enFiZySLDOLDblUFfGolI7R?=
 =?us-ascii?Q?IbMCUvpLuSRTOku+9GMI2K8NnYxtjHWfLmN4uwJYNffg9tBPd+9Q1ksxg/Vs?=
 =?us-ascii?Q?qXULtOnYgf4svs1rGgfc5CYwanKhNksZjATSLnYZGwS29aoZ1NH9WqKxOzS4?=
 =?us-ascii?Q?b3s1DY7NT5vnKsBOuZ/8OvjvV03e1+FZTnBEnAEZh4yq6vCABM2cQ2jwfnUf?=
 =?us-ascii?Q?2HGxz66wpYrQTbD8HChWvRwGBW8RWFkMI9ymwa7R+HAQmKoOQYHZ6I489lzy?=
 =?us-ascii?Q?IKgMhipQA9TSXmzyTcx3GC3Gih37LlqyqjxnrHrdLDViVyoPDFDyXyvQl0fs?=
 =?us-ascii?Q?2aJoxtsl/swD/Uz4+Y2S2UChPuj9MR+bTOwnCZRZ4ihyjZjvkwnovEBj+vBm?=
 =?us-ascii?Q?Hw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 74796b0c-606f-421a-625c-08de1316236b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 15:58:13.9402 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8EVloMNBiEG4eTtw7DC41fzjBKiynsa8l6nwZG56lw5tt4dzn7VamAFIvyIwY8OYyv40SPibpW6AvaZHSD9v0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8513
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

On Fri, Oct 24, 2025 at 09:39:18AM +0530, K V P, Satyanarayana wrote:
> 
> 
> On 24-10-2025 08:19, Matthew Brost wrote:
> > On Thu, Oct 23, 2025 at 12:16:11PM +0530, Satyanarayana K V P wrote:
> > > With SRIOV enabled, while resuming from S4, there is a possibility that,
> > > the VM might have been suspended on one VF and resumed on another VF.
> > > Since GGTT space is not virtualized, we need to fixup all the GGTT
> > > references while resuming.
> > > 
> > > While resuming from S4, check whether the GGTT space is same or not for
> > > the given VF and fix-up if it is different.
> > > 
> > 
> > Before I really think about if this will work - quick question, have you
> > been able to test this out and see GGTT shift after S4 exit? Also with
> > running workloads?
> > 
> > Matt
> Hi Matt,
>  Yes. I have checked it with idle system and by running basic 3D workload
> glxgears. They work fine.
> -Satya. >
> > > Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> > > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > > Cc: Michal Winiarski <michal.winiarski@intel.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Cc: Tomasz Lis <tomasz.lis@intel.com>
> > > ---
> > > V1 -> V2:
> > > - Rebased to latest drm-tip.
> > > ---
> > >   drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 32 +++++++++++++++++++++++++++++
> > >   drivers/gpu/drm/xe/xe_gt_sriov_vf.h |  1 +
> > >   drivers/gpu/drm/xe/xe_pm.c          | 12 +++++++++++
> > >   3 files changed, 45 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > > index d0b102ab6ce8..38528495478f 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > > @@ -1375,3 +1375,35 @@ void xe_gt_sriov_vf_wait_valid_ggtt(struct xe_gt *gt)
> > >   					       HZ * 5);
> > >   	xe_gt_WARN_ON(gt, !ret);
> > >   }
> > > +
> > > +/**
> > > + * xe_sriov_vf_fixup_ggtt - Fix up GGTT on resume from S4.
> > > + * @gt: the &xe_gt.
> > > + *
> > > + * This function shall be called only by VF.
> > > + * Main GT and media GT share the same GGTT space. So, fixups are needed
> > > + * only for Main GT.
> > > + *
> > > + * Returns: 0 if the operation completed successfully, or a negative
> > > + * error code otherwise.
> > > + */
> > > +int xe_gt_sriov_vf_fixup_ggtt(struct xe_gt *gt)
> > > +{
> > > +	int err = 0;
> > > +
> > > +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> > > +
> > > +	if (gt->info.type != XE_GT_TYPE_MAIN)
> > > +		return err;

I'd return 0 here. It makes it more clear this is not an error case.

> > > +
> > > +	xe_guc_comm_init_early(&gt->uc.guc);

Do you need xe_guc_comm_init_early, this appears to be purely a software
thing that should have already be run on driver load and I don't think
this state would be lost across S4. 

> > > +	err = xe_gt_sriov_vf_bootstrap(gt);
> > > +	if (err)
> > > +		goto out;

I'd drop the 'out' label and just return an error here.

> > > +
> > > +	err = vf_post_migration_fixups(gt);
> > > +
> > > +out:
> > > +	return err;
> > > +}
> > > +
> > > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> > > index af40276790fa..17004223f33a 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> > > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> > > @@ -39,5 +39,6 @@ void xe_gt_sriov_vf_print_runtime(struct xe_gt *gt, struct drm_printer *p);
> > >   void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p);
> > >   void xe_gt_sriov_vf_wait_valid_ggtt(struct xe_gt *gt);
> > > +int xe_gt_sriov_vf_fixup_ggtt(struct xe_gt *gt);
> > >   #endif
> > > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > > index 210298c4bcb1..68bf08ae62f6 100644
> > > --- a/drivers/gpu/drm/xe/xe_pm.c
> > > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > > @@ -19,6 +19,7 @@
> > >   #include "xe_ggtt.h"
> > >   #include "xe_gt.h"
> > >   #include "xe_gt_idle.h"
> > > +#include "xe_gt_sriov_vf.h"
> > >   #include "xe_i2c.h"
> > >   #include "xe_irq.h"
> > >   #include "xe_late_bind_fw.h"
> > > @@ -248,6 +249,17 @@ int xe_pm_resume(struct xe_device *xe)
> > >   	xe_display_pm_resume_early(xe);
> > > +	/* GGTT fixups (if needed) have to be done before restoring BOs */
> > > +	if (IS_SRIOV_VF(xe)) {
> > > +		for_each_gt(gt, xe, id) {
> > > +			err = xe_gt_sriov_vf_fixup_ggtt(gt);
> > > +			if (err) {
> > > +				drm_err(&xe->drm, "GGTT fixups failed with %d\n", err);
> > > +				return err;

I you need 'goto err' so xe_pm_block_end_signalling is called + we get
the 'Device resume failed' error message.

I also noticed if 'xe_pcode_ready' fails the error path is just
returning too which doesn't look right. While you are here can you fix
that too?

Matt

> > > +			}
> > > +		}
> > > +	}
> > > +
> > >   	/*
> > >   	 * This only restores pinned memory which is the memory required for the
> > >   	 * GT(s) to resume.
> > > -- 
> > > 2.51.0
> > > 
> 
