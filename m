Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AA40C10F1A
	for <intel-xe@archiver.kernel.org>; Tue,  7 May 2024 12:38:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E02AA10E747;
	Tue,  7 May 2024 12:38:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pj4wJ7AN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB2D810E747
 for <intel-xe@lists.freedesktop.org>; Tue,  7 May 2024 12:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715085527; x=1746621527;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=aJv/PBlsz3r+250JxfzaG7JH2ZMhCkOfkqr45gw0aFU=;
 b=Pj4wJ7AN7OpnB9ropes+UL/nEXjFDFYx0viHFfprKTir4CpY7KrYATPf
 ecwV4Xj1COIx7Nj+M8e/eWJjqxn4AphJdH+VnNWtANvkcikJIGa4FWfCZ
 f9wpDT1soWxxhwR09hOZCKhndanyvDFjXj7cyyGi9MHpv+rQPX4Arpv5N
 OIaeVgiRvNLIHC5gSm/mm8i9DasRCJZxDm7R2XQSw3PemYbo5MVJXawC8
 03eZuik1lULmIvZMPunFLdK7Q76zivDK4Y+DBT6b8tY6dmbsCxbB3IgNG
 gKgrG5LzL0mj5XP2OjaaNUbaNn3/8bIDA5PQa0aM0kK1ujgWUQLmXDH2f w==;
X-CSE-ConnectionGUID: PUd2aCxmQuiMlXMf5nq9KQ==
X-CSE-MsgGUID: EEHPFXRjTz+3PVCcOGGqAQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="11407673"
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="11407673"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 05:38:47 -0700
X-CSE-ConnectionGUID: geWCDkDKTCSpG+d0aEoYvw==
X-CSE-MsgGUID: 31cBjlK/QWqa/bHyfg14Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="33019734"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 May 2024 05:38:47 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 7 May 2024 05:38:46 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 7 May 2024 05:38:46 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 7 May 2024 05:38:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F3oI+sI0Go4QgXgbdX/6EquU8bXN67tPruTlMCJzxb++noFQoErIlKx3vi1PiYFefciNRt10Yzm0KsqeSpXFVeHE2fT24ypOj25WVYcrenUl2gS95mou2Gt03xMgbovUJnwk0QX58AlA5cf2r8eOS0UMCh9FeSVWZKnOZO3PTP2m9SdWkJsD0DFSpUUgARieAVlI8KWS5R6/lEpMcBB6jeRpau6NuHyf0NgUo86ARUYc5evaxMiaf7aquV6DZGo+e60tvT94iOZQFzVVTiexNIL5+icZFBcfKoIEFUIsHhnVDlkA3CrIIaDQzU4DzKglNsdQhWnysoeLSwgtsHmb3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zYaxlZCZyRnoSJNIsYnTeEH17/2SU5fIphgb/xnFvGM=;
 b=Z4+/ebgBz2QzIRAf9jI6OUuRWag/285F2l7b5Ja8zqPN0lMK0ui6RrIn5R46XYIk0FF3KHTaqK0ClPovANL7bSqxZqk7tnsStVoBb+yLuMKpo2mpEPBzTuqkS+RuURjGdLEkYRO0uRsZ+PcwZCoJtWrEQ8WZ2HfCBk6Fyh8hb8Xq9Hm0t4C+eFkkYDPbFBaQhyz701GPiY38NaIqkyrZsq43w6jfga2APOBggqVGehlfietsh7PT1/vnjYUc2Y2jroU8CZ9njm63c+Ejwh92btKh4QvCI58bxQehk9Vg0KCkTNVLoPshskpLCiUFvoWVIXaVnt2iJeWvKBF0jF80lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY5PR11MB6512.namprd11.prod.outlook.com (2603:10b6:930:40::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.43; Tue, 7 May
 2024 12:38:42 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7544.041; Tue, 7 May 2024
 12:38:40 +0000
Date: Tue, 7 May 2024 08:38:37 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/vm_doc: Fix some typos
Message-ID: <ZjogzbhT-e7bn8HM@intel.com>
References: <20240506202950.109750-1-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240506202950.109750-1-francois.dugast@intel.com>
X-ClientProxiedBy: BYAPR01CA0015.prod.exchangelabs.com (2603:10b6:a02:80::28)
 To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY5PR11MB6512:EE_
X-MS-Office365-Filtering-Correlation-Id: a9040a88-7330-43be-1bea-08dc6e929fc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?u4cww+N2UYms8YDSS80x9yP7CkCDurWLhuslZ6SaqeLheK6IoSJEWXjErrkq?=
 =?us-ascii?Q?JJ+1xgg3ohrkKT7BhDRZ0bA1THq2uzSKlMfApdcZzyecZHSwaDXNZcUia43W?=
 =?us-ascii?Q?smsF4L7SERae/9kzvs4a0BfY+f9gPaTiZHQWE7gMDDswv+axuAHUS6LggfKQ?=
 =?us-ascii?Q?PShDXf5snAGsVo1UF2MbOBlfeTtE6MDLuEHd1UdJYu8hyTtawl9lgXYhxIyM?=
 =?us-ascii?Q?mxkUhn+z3N8lvjP05Zjz+MOpqwyWd8gBe8HnWKOx+W4DdBG0HOekZDxUi8Fs?=
 =?us-ascii?Q?aBmyACXuaQyJLR76rIRKQCiDu+vFvf7zsYx93XX7QanvgJK/1ZUTW7FtYT7+?=
 =?us-ascii?Q?po0RxQFhVw8mfxFyF/0j//7qStfKuKm+VQ9Np+rakQqime0UT9m2sXAD1gVP?=
 =?us-ascii?Q?LBjFfXDlRKAK5VeQxitXAQD3+JqsnJ8xmRMFi3e/0o2lNR55b27XPuqLKVDW?=
 =?us-ascii?Q?TXYo46W+OgGfW3Kzx2Tj/Xgxj+6XPLrhZup9R0pBXzzUofcqLYey7796lJyj?=
 =?us-ascii?Q?HW1ISNiWE6OmmGY4otdbF1/m44KjyvrBelzAw4YdWOBkvJJ3zSeeRcSNSBDc?=
 =?us-ascii?Q?q45yvMhIBYuxC3LHhBhER1ps6PlsR0hOsgyWhvdWFl6T86qjdMvPwZh2w5k3?=
 =?us-ascii?Q?YkceZctZ7aiTKvl/N+ebc8p0OiddAId+WB5l7LBLvu5yo7cxPEMCn+4rZiNc?=
 =?us-ascii?Q?116io3JVKoDPF8wSXmOdrWQQN9QUnawxzaD0LNOtCzGGg8S8FCwgeHuxnl6l?=
 =?us-ascii?Q?5kBzQ6DlljtlFTdLw24/Inbi3e45FapUnZmoLrYReoP023vpq5dz32QMFMIV?=
 =?us-ascii?Q?edcsbWCL9D3wc0k8soDFTTyy2Nz0oWE+ZifPImTU0b5ClmQ3NwBV0jmjPuRq?=
 =?us-ascii?Q?mTCzD1v8QzEKE3L0y7E/Z2VMMUQe5TnXo0LePzY+ZY0ra6eody1fHRDPnhWo?=
 =?us-ascii?Q?cYxgysgbZEdTM7cjGj94IUqhRkKAiVK7gJ4V8q7xguyA0+PrwX1Nqzv7tb7G?=
 =?us-ascii?Q?lfE5bJE5kYUSPFM2SH9++TV0KF80KvomQqW+OxDH5CLWfhpl8UhczpmKsabH?=
 =?us-ascii?Q?tdS9NdqjnBS+VKTIggmR6lZbDT0WJwF5q9YwL+L36vZGJDd0tAjKcYO2+0nB?=
 =?us-ascii?Q?20Ysj3SYm1klkG7k1HfCJo8WQGn57K1a+KOH7qSLl4PWVO1f6M/CRtUHs44J?=
 =?us-ascii?Q?YL0GsNgaudibeeJRqI3Ra6fvlggRNMUZPT9pXZTp6x+pdI27Z9JwvVQZ/Pui?=
 =?us-ascii?Q?g77j/bmLikoxa+aadnQqp7AuibFZaPXcvTwvQp3Q4Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lwVeyWpEhBwpi9QZNuH9FnCNYB3xwVZ60F0kEh7Lv2DGryZhXwAhVYLM6jHY?=
 =?us-ascii?Q?OvK6FZ7KPZI9l/X+Qx8rbkocbktGuGse3MXpZf8mFoObx8Ku/e6Rc/Qzu7/e?=
 =?us-ascii?Q?wzAswudXCQSuwJdaYNYF0sDgGaZ7N7feT7HvaOPrghPNnbj1cGS9J4QRCfRu?=
 =?us-ascii?Q?+I3QIoFK+blpswEefLe7WA11beGnMPhFiR4w9XeAqwsTNWxZwYoyxrtmcPNJ?=
 =?us-ascii?Q?KXrgmJrJHcTYKUc+pq8Du88qWgPt70Z61UT8/W6TbmwhuNoxDTHpPqeKDQE8?=
 =?us-ascii?Q?XcAOsZ/30jaMxjUmH1JVh5u/R8RO7WflV0npCg5rRWHUtHrjdKj02IXC2aJi?=
 =?us-ascii?Q?obdFAgZM8rAguCf2+XLpy9m3QicH1ighMrNZT1WbED66FiOkasSCJYzKnFiR?=
 =?us-ascii?Q?cTOZGxFcN3cOYuq4O408Mk2mtbXdLezKbDxuXCHMwMiCtPC6qlS/FTbH1N/t?=
 =?us-ascii?Q?kEr+qOu1u1wmW3xfCCbFjtae4iGH+mG8+8VnB7m9+VezuFGijRzXOBDXvC+6?=
 =?us-ascii?Q?LBrcY0w75esQqISgRyRclll/Z1nDDnK6nRFwOpgtHzyzDLvQag2GCnCTGZsJ?=
 =?us-ascii?Q?h02qEfmnClnVxNi8FACq8efWP3haEynutfEJOmngR2VvbK0oRW6F70NM5I9b?=
 =?us-ascii?Q?7Ko/yhSKhoelXjnbNlLqQ7llECYP3AFxUNvCDBLYHqhXMo0BwbLcHwgl7ow7?=
 =?us-ascii?Q?OXBcEPHcroaadfYoPkmq/tfGAb6Z1yMLhu4nwFaBZjqyPxYIaveGvRO5z3uJ?=
 =?us-ascii?Q?aynaMBTZW4r08qMhEpIRm1O3+qr0PrXcrsaMLyMe7rhYkUB8HX7yQ21vaMN4?=
 =?us-ascii?Q?PR2u1s/eBOynTPq6INMJ4vmNLI1rGda12SMijeLotMho4AuiQmdFcT8362Nl?=
 =?us-ascii?Q?UGNTQkOuzb5K9ZX1aQ1uA9rXEMO39Qp/eJ3/ecZ3oSMrMz5ueFyJKogvAMaF?=
 =?us-ascii?Q?1zKr5y39HiF6ecQrWzrWAzoxC87IqNZFmZWaX0kdXoHlOfc5fpFpCfS/sa5D?=
 =?us-ascii?Q?6BhommCmZWBQOTC9plOdRzLKmzXVafLkAcYjvuD5mY4nhZhSW8ykQ8pC32mg?=
 =?us-ascii?Q?mIcdYeBNB1mhHnMroqr6SLtxsbfoLnquNwyhqF7JGJqlRXRO1TxzONf3cVbj?=
 =?us-ascii?Q?Fv+q5D7ANJPrW7xX2BwF46G4Qkva+1/ZvI3Sv/7XDTG/YCaV8UmQjym6nJUd?=
 =?us-ascii?Q?qnUvkGHhMo22b172VwHQFNfx+rN9tgyuI7Qo0Mpr95vUgKVCMuij2/FLTLj8?=
 =?us-ascii?Q?9FaufGYdvH+QMWswtsXEDimsuY98woxoosCy2yqKnGZI25aGlwMGzHLZqg9A?=
 =?us-ascii?Q?46G+YNQM8Fl2il5bRMR67DZMWZ4sih/iuzjZhnMIOgRgvPF2qbPiKlVsyhIF?=
 =?us-ascii?Q?86++h9x51JPXgmJK8T2kiXpyu2cJ/8x7RgbDxYjBdiVh7I33Zaz1Bi9jN8Jc?=
 =?us-ascii?Q?6LYckkT7cHUTBbLXXYtARJcVkfRTkyg0/YWQc8BuajEKlCIDqP/O2AQfkWL2?=
 =?us-ascii?Q?aRmq4hxGHYYuHRzVY8MaUBcq0TKDNJr0D69CtOYmGB7M3sRSCy0wv83yP0xy?=
 =?us-ascii?Q?rYLIp52k1MNnxCVGklfnLhTl+j8NPPOrQySow+aJ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a9040a88-7330-43be-1bea-08dc6e929fc0
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2024 12:38:40.8223 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 59vMCBz8hncznxF8SrWk3L3b1DfUgA1yXS2/mAhsnRfSFhTdRxzqE7R0f70bLDUJxp4AfL92xXpdR1yWHnnaFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6512
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

On Mon, May 06, 2024 at 10:29:50PM +0200, Francois Dugast wrote:
> Fix some typos and add / remove / change a few words to improve
> readability and prevent some ambiguities.
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm_doc.h | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm_doc.h b/drivers/gpu/drm/xe/xe_vm_doc.h

1. We should delete this _doc.h file and always aim to keep the doc with the code,
otherwise we are sentenced to live with outdated docs.

2. Is these doc files $f in (vm, migrate, bo) getting included in the final generated doc,
like: getting built and showing up in the generated html? Last time I checked it wasn't.
Another reason to move towards the xe_$f.c code.

But for the improvements below:

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> index bdc6659891a5..4d33f310b653 100644
> --- a/drivers/gpu/drm/xe/xe_vm_doc.h
> +++ b/drivers/gpu/drm/xe/xe_vm_doc.h
> @@ -25,7 +25,7 @@
>   * VM bind (create GPU mapping for a BO or userptr)
>   * ================================================
>   *
> - * Creates GPU mapings for a BO or userptr within a VM. VM binds uses the same
> + * Creates GPU mappings for a BO or userptr within a VM. VM binds uses the same
>   * in / out fence interface (struct drm_xe_sync) as execs which allows users to
>   * think of binds and execs as more or less the same operation.
>   *
> @@ -190,8 +190,8 @@
>   * Deferred binds in fault mode
>   * ----------------------------
>   *
> - * In a VM is in fault mode (TODO: link to fault mode), new bind operations that
> - * create mappings are by default are deferred to the page fault handler (first
> + * If a VM is in fault mode (TODO: link to fault mode), new bind operations that
> + * create mappings are by default deferred to the page fault handler (first
>   * use). This behavior can be overriden by setting the flag
>   * DRM_XE_VM_BIND_FLAG_IMMEDIATE which indicates to creating the mapping
>   * immediately.
> @@ -225,7 +225,7 @@
>   *
>   * A VM in compute mode enables long running workloads and ultra low latency
>   * submission (ULLS). ULLS is implemented via a continuously running batch +
> - * semaphores. This enables to the user to insert jump to new batch commands
> + * semaphores. This enables the user to insert jump to new batch commands
>   * into the continuously running batch. In both cases these batches exceed the
>   * time a dma fence is allowed to exist for before signaling, as such dma fences
>   * are not used when a VM is in compute mode. User fences (TODO: link user fence
> @@ -244,7 +244,7 @@
>   * Once all preempt fences are signaled for a VM the kernel can safely move the
>   * memory and kick the rebind worker which resumes all the engines execution.
>   *
> - * A preempt fence, for every engine using the VM, is installed the VM's
> + * A preempt fence, for every engine using the VM, is installed into the VM's
>   * dma-resv DMA_RESV_USAGE_PREEMPT_FENCE slot. The same preempt fence, for every
>   * engine using the VM, is also installed into the same dma-resv slot of every
>   * external BO mapped in the VM.
> @@ -314,7 +314,7 @@
>   * signaling, and memory allocation is usually required to resolve a page
>   * fault, but memory allocation is not allowed to gate dma fence signaling. As
>   * such, dma fences are not allowed when VM is in fault mode. Because dma-fences
> - * are not allowed, long running workloads and ULLS are enabled on a faulting
> + * are not allowed, only long running workloads and ULLS are enabled on a faulting
>   * VM.
>   *
>   * Defered VM binds
> @@ -399,14 +399,14 @@
>   * Notice no rebind is issued in the access counter handler as the rebind will
>   * be issued on next page fault.
>   *
> - * Cavets with eviction / user pointer invalidation
> - * ------------------------------------------------
> + * Caveats with eviction / user pointer invalidation
> + * -------------------------------------------------
>   *
>   * In the case of eviction and user pointer invalidation on a faulting VM, there
>   * is no need to issue a rebind rather we just need to blow away the page tables
>   * for the VMAs and the page fault handler will rebind the VMAs when they fault.
> - * The cavet is to update / read the page table structure the VM global lock is
> - * neeeed. In both the case of eviction and user pointer invalidation locks are
> + * The caveat is to update / read the page table structure the VM global lock is
> + * needed. In both the case of eviction and user pointer invalidation locks are
>   * held which make acquiring the VM global lock impossible. To work around this
>   * every VMA maintains a list of leaf page table entries which should be written
>   * to zero to blow away the VMA's page tables. After writing zero to these
> @@ -427,9 +427,9 @@
>   * VM global lock (vm->lock) - rw semaphore lock. Outer most lock which protects
>   * the list of userptrs mapped in the VM, the list of engines using this VM, and
>   * the array of external BOs mapped in the VM. When adding or removing any of the
> - * aforemented state from the VM should acquire this lock in write mode. The VM
> + * aforementioned state from the VM should acquire this lock in write mode. The VM
>   * bind path also acquires this lock in write while the exec / compute mode
> - * rebind worker acquire this lock in read mode.
> + * rebind worker acquires this lock in read mode.
>   *
>   * VM dma-resv lock (vm->ttm.base.resv->lock) - WW lock. Protects VM dma-resv
>   * slots which is shared with any private BO in the VM. Expected to be acquired
> -- 
> 2.43.0
> 
