Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7368C3ABD8
	for <intel-xe@archiver.kernel.org>; Fri, 16 May 2025 19:12:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9068A10EB7A;
	Fri, 16 May 2025 19:12:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MA88Uf3J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1027510EB7A
 for <intel-xe@lists.freedesktop.org>; Fri, 16 May 2025 19:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747422729; x=1778958729;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=GfRAV/RrtIS8D+oPPwzfXernyQ2y5NtDJTy0kmn2+k4=;
 b=MA88Uf3JVl8WULazVu5XgEXrHNlpYQKwdtYChd4g8kru8p1AA+V9XOBW
 K0vvTu9s+lirYKAc/LkZGkqfAp9xb7Gb/Gs6s+1g2sjAPl03sdSLgAy9c
 u28BZ0Pu0SklPMz+5rlZDOC7RW558W3qmjLljuPg/58TvOkMSbVu4kNM8
 n+pRwEY2xbo3P/g1brijuOAVoIdRekCHFvvIdiFHJxFu1llOtbYfxkyBc
 QVOUO8lWC1RY30Q8RUT/xKsT4zh5eZmT5xD3tMuIznqG0lD2DCpgUDq7Q
 uaNvtnTK63DkoIaHLe/L+DIL3natcTC610T7CFH4YxbqILjZgSgnugQN9 g==;
X-CSE-ConnectionGUID: 1dioQj2bTu2pzPQTJVug9Q==
X-CSE-MsgGUID: eSQCH6rwRCWWjK8TLOq/UQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="48659579"
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="48659579"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 12:12:08 -0700
X-CSE-ConnectionGUID: pXUd3A6vQdyILuSvlhfQZw==
X-CSE-MsgGUID: DjnA6K+DSqukG6us2OE/sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="138830599"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 12:12:08 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 16 May 2025 12:12:08 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 16 May 2025 12:12:08 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 16 May 2025 12:12:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zKh4NwTJquzVZ9S6/gAeD1RoSDVmHp4J+DfN/Jfggj3Gp+/CEPZFCduSvzwQYiEkraJqmZ3ZQXf/6zh1kqh4O08VM6fIvZOD+u2b1bV4zkTVgSfPfWdsGdrT7WFNa89YAOk87RanueILfR7Ni29HrhLF4uW6jwQEY8OwxA6z8/HDD9i5xXEYGVjtRdSCD0TAswHwQlDWGenzljC0zsDUlOnL7YrclP/Y/EHlBg/vJenyYfylgqDZMHeIwIwX0aKeE6R/0jHALtAvz88q3YbScXnf2OHo5vGhe6TckUe1LwqgqX3WtlbhOtTkRyP53YhGkYvvHvA93rtPci5BMP18cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MnCanwqeRsdwf7BIujF0j9GrLL3Ym01sKFKEb5M2eNs=;
 b=oCcm7JOu8HMdUqTAb6xvYPx5XCRYgxG0T3SUyZwm2dygctozEsbFPv9f2Mgul1Wgtiyxtkf+e3raWQKyCmOy2vGIZOca/GljAETAgwcQyzFUKocSSaJmYxOSo3LH0mSXdlCJ/BXJWytxSSS6uvN1Iz+SrZGyBQ2o7uLeolXsT5cOmWxTk0/XzR+C5woA8hnel+t5mUPD+9E6fNTelsOZ1NSH9iCUIAbUbLh1nnz89jLXVYhYY/mueBAqHbei8t9fD/E0ch5TQF0cIDZsvRxU93A8ViqUNglGkRyg/2wjrWZLxFdXeZgHHwkrLWeJI63IgZU3OwKD8JDtno0Ye7M6Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ0PR11MB6768.namprd11.prod.outlook.com (2603:10b6:a03:47f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Fri, 16 May
 2025 19:12:05 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%3]) with mapi id 15.20.8722.031; Fri, 16 May 2025
 19:12:05 +0000
Date: Fri, 16 May 2025 12:12:03 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Satyanarayana K V P
 <satyanarayana.k.v.p@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH] drm/xe/bo: optimise CCS case for WB pages
Message-ID: <20250516191203.GN5080@mdroper-desk1.amr.corp.intel.com>
References: <20250516153810.223530-2-matthew.auld@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250516153810.223530-2-matthew.auld@intel.com>
X-ClientProxiedBy: BY3PR03CA0022.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::27) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ0PR11MB6768:EE_
X-MS-Office365-Filtering-Correlation-Id: b82b583d-9355-4f9a-5ae8-08dd94ad8c03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?9GkDv9+QtYpdUZ9Fp0rTsrZmtgS0yDRh3iJAOJT9OhOgZNqG8TYIxO5UFs?=
 =?iso-8859-1?Q?x50YZpYDRHgh/GERy7XzLWTQNsbHWZKEPXG0G0CKOBPK2od2H56hHnrL0Q?=
 =?iso-8859-1?Q?fQRHc7xqyuIqpUluQA8LoivXiRI677GeiIgCewyGpSlvJEk6KX1eZrgCrI?=
 =?iso-8859-1?Q?l4IfMUGn1jEjLBJXd/kCMPZ2W8ZlzObLyc3/rOyPLhv7KXeaR+DSIa8yCs?=
 =?iso-8859-1?Q?47UwXcdwcEdX4gY9QjWpVD+rr0GjJEHS2Ro495W/+55ZEnkO+U3YF796+M?=
 =?iso-8859-1?Q?0gtjHreh0+c9p6Ve+RwKV9CNO5+GOHOv7pJ157zG9AoeO2QHoFdko9FuR1?=
 =?iso-8859-1?Q?ISCvZsdBi83EIti0mMR5yuxZMvSpinx863P8bqBC8gcrY67qnzG1Aqd8su?=
 =?iso-8859-1?Q?6snGxkXCGCXsHLzeZBaTxQaXW9RrD9eGhcnxalq/C0Lx76GHlITfAgZQNy?=
 =?iso-8859-1?Q?j0Xr+4QPuvI556XrEZIIk22ZXJrRNYduuz2nTSG3qrDlRCvxs1peTH8FgE?=
 =?iso-8859-1?Q?XpgZEbDvF+RXLG8kH8RQzrdh1UfeCeCCKJiPSs48wMB6w/3AlUmchVMCys?=
 =?iso-8859-1?Q?EOg6Mlax7gaskL3Sak4AlZ/TXcwAxspcEdkwlXzLR6vpxdWG2q/UCDh/G/?=
 =?iso-8859-1?Q?OTEPy1DfF7NfoJazcXMbPsDn1uBghuaEZd0PluRE6kSIGkdKzIZs9A/I90?=
 =?iso-8859-1?Q?L2e5fucraUdc7bLvZAEJRbE3bVlsH63Y+7f1PQ3osFNR7mESOrrNLmng3I?=
 =?iso-8859-1?Q?f+Bi1oYpwAUl8fFDPXErcVZsz5FsGsa1MkYTjkHLYGbL+u1TFRK5tnPuMy?=
 =?iso-8859-1?Q?LNU1/6L4gq8JYue03TRawaRYactgL3yIUUWLkjkQo/6qaD58ylHR/jytEb?=
 =?iso-8859-1?Q?V9plSavgqmboOQmY/IER5tzVMZu7Z+U2+SP2XMqUi9a/Qh0459SqYQzmKH?=
 =?iso-8859-1?Q?TjCTv0MtvG93cYoC3iOqw+DvjyuXPiKy7PToi88UWs1PELtzeQ4J5MJ/bV?=
 =?iso-8859-1?Q?NR25+9zbNd3Rk99VfD8MPgVw9g8i4c+TDw2/3ZMHntzJK+dscNKG7AbbWh?=
 =?iso-8859-1?Q?/PaTgocT9FL9Nj+b3BnBN0yWQ/gtwUDeZEHnFxQ5YqpyJrb2YG/7OsuUO3?=
 =?iso-8859-1?Q?8SA/L/JbRwAlH+8K+TfgRTfi/B/zVnl1u8j6zFKQmgH0R1hNgNYrTLRFLQ?=
 =?iso-8859-1?Q?nveILU0z+ZeqD6l8YLgmJ4ocP9ZmCAdIAM4CM6gaFDFog8O/cUbp6Ywob3?=
 =?iso-8859-1?Q?5mL1vMOklhDNw6LaG9BLe7VLEJDisfl+IH0OXw3SXvOiVSkrADULi7NqI+?=
 =?iso-8859-1?Q?7J4gut2kTu+vzx2D9/cJ/hMwHFPk48OLg/KnbfjEG+8OT+xEPDlfDzQyr2?=
 =?iso-8859-1?Q?RZVYseVynVDFubLjrkwQ6aqRKADh3bQBJDq0cfC/ZPKJ/PxzVom1O6WMUV?=
 =?iso-8859-1?Q?ao/mfws5rwqIBXgEsl1ffusVKCVwFw4u8TRqqAZ3lRUzdHSMaVFXzW6v+v?=
 =?iso-8859-1?Q?s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?G+IUHo//fBrck4HNW7XqVJAbwnAMysbfFj3yLVGPpsmzZXbsoo18Bb1KQ0?=
 =?iso-8859-1?Q?Z27R0s6b1iD97P5YuCG2xoC+3+lj6lurvrYwIYhHfLy53Ba059mitZj4Z0?=
 =?iso-8859-1?Q?KVMei6gBtJVcwL4fCvMhp5MQqXMNPeuCz+r4dUPd7DDKSfzOKIt41dSAIK?=
 =?iso-8859-1?Q?NURj+4CYzh7GtOBgHXxpExQyga8njil6UKoRJI+tAD+pFoOeKWC6bB9FTY?=
 =?iso-8859-1?Q?OIdohwZOVLGLWiA+6m8aKakhEtJbJt3k1VhDYSaQF27BGdzvKesczR5/QW?=
 =?iso-8859-1?Q?0SCP1wkqAlQT3H3KqzzVJ6Wxq8Cmu/Bov6/Jf2cJlzUYjr+1WhBLdYNwVb?=
 =?iso-8859-1?Q?cO+gLKMvxjcCQ1SN99RE1P06wtxn8YbAUbb4dLYPdH+HSNUNb1K/G0Imia?=
 =?iso-8859-1?Q?mQkOqKSU8sjM2iUcOUOpe6y8niRrGcbi0vTIFuZsOrZLIQ4ox7fBFeAqjB?=
 =?iso-8859-1?Q?TU7uwYi6c66vE42zxRndWnk+MYGgZOp6KEUNqU6cWxdi74QYnUDaGw5q7T?=
 =?iso-8859-1?Q?aNzDq3EDxMDYwW9kTA4Abtgistz1mW+X15UmCmp9BsBddBHuB+Wd8cCyQF?=
 =?iso-8859-1?Q?Kc6QLdGqE7/wFp4BsK+SlP+RZcta48CPFTm2YeMSeuFViJwNumO/6uVFep?=
 =?iso-8859-1?Q?z/bNYPmiLK5eyN93Cp82G4B0HiBSesxktyMiLFrrrsLX1bwhNcP5ZNyekb?=
 =?iso-8859-1?Q?W7JTM6yY7ydFEm3O5LTv6VqBinLBWseJPRZPW385X3NlEi5cBzL0wmq/BD?=
 =?iso-8859-1?Q?k21mq8GaXxq45R6KtVtOXYfOsEqDjnlCFeQ0csC0VLz3PLpKzh4iHPCp/P?=
 =?iso-8859-1?Q?Vcdfa/B87TPGsMoG0uyzQ3ygU7bjImByH7t6EHPEuW5an2P0RrKL+lKUyX?=
 =?iso-8859-1?Q?aRNpaxDUimmHDspj/tkdWU7j1E9ZHSFKyYoRCGdhLuEuOoxC0fhvCw0ner?=
 =?iso-8859-1?Q?Ai9l6S8C+crusGI55N7wNepfsszeqynSFEwAlUNF/PWr7kiitE92lzyNTu?=
 =?iso-8859-1?Q?pcEZaIkIeSYpUfon1Am6Xww8nhwDVi4RsRnoF/+aqn/7P6glugoLrY2dSa?=
 =?iso-8859-1?Q?m4oAW65hua8329T1OXH/OLp4QTPvWBZmgPTJ6IDNFlOaq2d3na1RUFKHFH?=
 =?iso-8859-1?Q?LTJcnkK5wYWmz+NO9XIgdP2zZcM0Vlr8UhP9lLQvLjqpsGFCpgZpodPFRd?=
 =?iso-8859-1?Q?HP0tKkHktowtfoNySN6v/VmfKRPV15JjVAtFBI8y+w4/gs9JZQ/RSxwyz9?=
 =?iso-8859-1?Q?hhFNFA0jwG9zVlgBRHb8HoF+wHTMm/a+lXF/sX9xhYFQzu9p3t5ox9HDLJ?=
 =?iso-8859-1?Q?WBTvBYPMh7aelat4CQcBdWIL4+lGCBjJzktoNbiVABXAGXair84FZ5xcyp?=
 =?iso-8859-1?Q?gSIV71DmfVXewinq4u7W+yAbQBZwsD/gmoErpHaowanTf3FBdwmQjSIwXc?=
 =?iso-8859-1?Q?IDJ6zx0k+utXJgdYh5UltjTKJCjd87DA8txV+rjjjbH4bJbdUNqe3/H7rZ?=
 =?iso-8859-1?Q?06/VjZc1XajMVnuxSAXfnWxk+v8jK32z6WWa9/4Ah6x5N++rFTXJ6HQkLo?=
 =?iso-8859-1?Q?i2rbAsZL5Pz5JHhlPUggVP66UZNqyvdGx+6/Orl04p5O2lthWRTPoRw5JQ?=
 =?iso-8859-1?Q?/a5UPizvPg4hgH1fxQpPWuRHVuJ1eQrJTTWh6xWWRaTwS6eQ0MbXxsEQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b82b583d-9355-4f9a-5ae8-08dd94ad8c03
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 19:12:05.7170 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tDJrjAUh5Zs9nvOS/pcsaqMsXqrL5BUZi9Z4URO2RaEwQXcVCQVKyV5jcOo087/AT9tgdvifG+CaqMu8tQPkMPL7V6n8KHIXRd/xulybGA8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6768
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

On Fri, May 16, 2025 at 04:38:11PM +0100, Matthew Auld wrote:
> Dealing with CCS state is significant on LNL+, where we end up clearing
> the compression state on every page alloc using the blitter for user
> buffers, including also saving and restoring it when moving between
> domains, plus we need to alloc extra pages to hold the raw CCS state for
> the save step.
> 
> However all compression PAT modes, on platforms like LNL, also require
> coh_none, meaning that only WC memory can use compression in the first

On PTL/Xe3 there's a new PAT entry 16 that has CCS compression + 1-way
coherency (according to bspec page 71582).  It looks like we don't have
that in the driver yet today, but we probably need to add it since
userspace is expected to be able to use it.


Matt

> place. With this we can be sneaky and completely ignore CCS for WB
> buffers, which is likely the common case anyway. This would then skip
> all blitter moves/clears between sys <-> tt and then also means we can
> drop the extra CCS pages.
> 
> This should be safe since there is no way to interact with the
> compression state (potentially uncleared) without using a PAT enabled
> index (which is rejected at bind), including if trying to be malicious
> and copy the raw CCS state from userpace, which should give back all
> zeroes if the src surface (indirect) is lacking compressed PAT index.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c  | 8 ++++++++
>  drivers/gpu/drm/xe/xe_pat.c | 3 ++-
>  2 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index d99d91fe8aa9..3fafdcb8d95b 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -2982,6 +2982,14 @@ bool xe_bo_needs_ccs_pages(struct xe_bo *bo)
>  	if (IS_DGFX(xe) && (bo->flags & XE_BO_FLAG_SYSTEM))
>  		return false;
>  
> +	/*
> +	 * Compression implies coh_none, therefore we know for sure that WB
> +	 * memory can't currently use compression, which is likely one of the
> +	 * common cases.
> +	 */
> +	if (bo->cpu_caching == DRM_XE_GEM_CPU_CACHING_WB)
> +		return false;
> +
>  	return true;
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index 30fdbdb9341e..38a6a49c1b2a 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -103,7 +103,8 @@ static const struct xe_pat_table_entry xelpg_pat_table[] = {
>   *
>   * Note: There is an implicit assumption in the driver that compression and
>   * coh_1way+ are mutually exclusive. If this is ever not true then userptr
> - * and imported dma-buf from external device will have uncleared ccs state.
> + * and imported dma-buf from external device will have uncleared ccs state. See
> + * also xe_bo_needs_ccs_pages().
>   */
>  #define XE2_PAT(no_promote, comp_en, l3clos, l3_policy, l4_policy, __coh_mode) \
>  	{ \
> -- 
> 2.49.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
