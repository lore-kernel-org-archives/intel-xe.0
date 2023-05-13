Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58D95C77B7F
	for <intel-xe@archiver.kernel.org>; Sat, 13 May 2023 05:53:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DD2A10E03C;
	Sat, 13 May 2023 05:53:34 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F49210E03C
 for <intel-xe@lists.freedesktop.org>; Sat, 13 May 2023 05:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683957212; x=1715493212;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0i6rpA1dN9SFdPl51vCQK16mbNKQ3gQ8Thb6wsAmUro=;
 b=ZQlX7GBnN2lv2PlzDrAV2v0kswq78POSEjOMPcW1tcWAAlmNP2a+Moh2
 mNx2DcaWRcJg1jZePs6bfKo3SNA/NjDVPgTww05ix70B/GVyigYyvD7KL
 rY2zgC0Z7GYaP7eqNjHyOvavE2OY4jzljrE6/bk5fkpnjtrtZ9E/mDANB
 6QDPhjmZQF4Eb2C89Ff1s8XUpsps0NaK2AGySPJ4P+w69DEEnqUtuFq2g
 oinTIme9mvXiMpJx4al6NeyDZNv8cvM69KHEmiYt8LqScSL2FiemGdbrv
 WW5m/dqLmdfAccKM6AXN5rJDqWGtOSZIh1furBO2XAdxQpVKdEzS3MvfJ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="330546999"
X-IronPort-AV: E=Sophos;i="5.99,271,1677571200"; d="scan'208";a="330546999"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 22:53:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="703397356"
X-IronPort-AV: E=Sophos;i="5.99,271,1677571200"; d="scan'208";a="703397356"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga007.fm.intel.com with ESMTP; 12 May 2023 22:53:31 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 12 May 2023 22:53:30 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 12 May 2023 22:53:30 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 12 May 2023 22:53:30 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 12 May 2023 22:53:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FNvNt1kHVZaRjsBlr8wdk9Qw8FknbAbhz+6/3bNf1zdkfSb6aHVDBlYZJj0S2kdHUt6nqMZTC5Lht725CMmAGewyG2GjcaYKzEDcA+D+ii7ISxAwrEK7dSOoQa/UXAkIYZjL0giMlEi11/BhtATzs5xxdgj+oS2aCJjB9Mz902REiKONny1MJeGAuOro9E0tpEpBpV0RFJFvjSN8glkzF2zs23Xq+fWDfT0VoPDSd9tvlzgQa5BZ7V2OKpu1VUBeHK6FaKYkfBFfS306PuLGB+dWxAoij0L4gS92I6qV8VP7CMTk4qFFpVfr7fLPB+dgM3r6WqKrOmnTYpIWB4WGQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XH0qn4PfTXzgbhxubA7Ed+ajV3MH07ecCzIXV3yhktM=;
 b=GjFw8a9NhLEq4IYNewhbEVhwAEwvMeJ1c0UDpack0bAzgLFejaxK7KjnXR4TIo+G/bbcBe2uUroLBuF+azyM4tZHO0quau5xN5yosYOaxiXEZ5pAH1W4S1joib/yaGEN5Ja51OVkYwQu274Jqm2kkfpJ8vNj44Itsw0TP0uvfNwZpod7a7rjeX/maX4yeteAOcOtF3Dcsn54ZzHPQgHn24jhXVaPxXJ5pEjI0yQ8Hb1tuGzoWA2goqQpIS+EjAWMo/OfDHZ1lrWB6hR7HM43nZX43C25YpkthD5nfWuwvW0y7ZoHZewDqII3ZRV+TAusIkv2ypKKJXG0Gp7rMx+MEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CYYPR11MB8358.namprd11.prod.outlook.com (2603:10b6:930:c9::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.24; Sat, 13 May
 2023 05:53:26 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6387.024; Sat, 13 May 2023
 05:53:26 +0000
Date: Fri, 12 May 2023 22:53:23 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <go7x33w2573yypejf4oc4l7qiz4q2w4oqqegoz5sort7b35qj3@yjhb6nrxexfl>
X-Patchwork-Hint: comment
References: <20230511034722.1929038-1-matthew.d.roper@intel.com>
 <20230511034722.1929038-6-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230511034722.1929038-6-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0PR03CA0113.namprd03.prod.outlook.com
 (2603:10b6:a03:333::28) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CYYPR11MB8358:EE_
X-MS-Office365-Filtering-Correlation-Id: 590f8298-dccf-4185-0854-08db53765e09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BlhWUZ/pV1n6+FvXUDeArEtq2gGiu1SIAPUoiUU0bv5u+G6QBct3ZQci7QxI27vQ0s2PuyboKkloyqoSTT/dBtjJd5n/YLN0H3h8a8N6IffjosBq5fEx0rgnx5fggs81fK6nNZxiGFB+R9NJa3B6SMghQmtVSOSDITBekV8eQTAOFVUrJQ6YAgmoSQccDW8IGzJoNxhNHHtb6HknePvZAM5KC50kY7NkAZ8syOKzAPf2MBFCCcs+YeIjKt4sTY4xRt2xHIhdHtfHDjKjIcwux/j/7Avtp5KGpW+p3RjKkswlkcIcp/9UBw3ukZptUVDEFgt3iCF/xG8esKhc0XpIXwGoiJ6Lnn671MNGVWp2Up9qu0OQej+D/f/19jmhPiNhSchOWs4JQqJyLO4cyTZuiHXM7q/XIcBkcmLfUh2MdsgqPLa8FwrT7DXsXilH92wiW/pio5NspOYEpRD2SfFNU58t1w+/2tJPOyziJv5uzZZS6mH59AZpHtBs+eqwhTSghE0rt63DLbZxjKfvAUfkTh0+dPM5l4Ep/R4Ich1gxgq0OQG8xoARky/+K3u9hrbP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(136003)(376002)(366004)(39860400002)(396003)(346002)(451199021)(4326008)(6636002)(478600001)(66946007)(66476007)(66556008)(6486002)(316002)(86362001)(83380400001)(26005)(186003)(6512007)(6506007)(9686003)(6666004)(5660300002)(8936002)(2906002)(8676002)(6862004)(33716001)(41300700001)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?l1y48i1T2PotHDyUNluPdbsrPNJMkzQKFOyXjwRSm0uufAIvLZyRrSmHijMv?=
 =?us-ascii?Q?U4ZbZSf9UemIhreh7OFlfcP2K9AfJLzghzqlz+0wZ3US7FGOxUP9if36bgKb?=
 =?us-ascii?Q?H/iQF8YP2BR6N1COPEJb53jZPii0bgLP2XgZvGlmhPZhn/4a6QikBBu512hr?=
 =?us-ascii?Q?/NxcQLwBqtQOg+HEkJ9AzG7gK8sTcd/+ZfXOMfp3qnhEtGsxA0Rv47OkB/Zq?=
 =?us-ascii?Q?MPbn6AFlgHdjeqZ2K6aZ/2a10IgmhBPA9uiAHelVbFiNrMzLX0eRvIbnGswx?=
 =?us-ascii?Q?67SUzM9CugWMIK89KgvJYp8vA51masIMBUYWzBAMr5Sbnuf0kj+1l/KcZJMw?=
 =?us-ascii?Q?JIaU/tsl65/4bQzBi+ffUTYaQ5fWAKZIG9Yd8nQY1H+oOwH6NY8puNSqebbk?=
 =?us-ascii?Q?yD5AC7DUutU9lbDGIpTYf9TcwA++olDd0DwC716jrehC3/BbFznPfMOF6oFQ?=
 =?us-ascii?Q?JFKYg/Iq/bXBzfo6CsvB7BldexVTn2YWpCAx1KUzVw1fUZaxuAUBczR+0I0j?=
 =?us-ascii?Q?MrAJRG1h8dY/J72goE22omLytydPvBgalwU1cwLbV+OsiB2i7X69m6D1/0dG?=
 =?us-ascii?Q?bwkrESnwg9fjvDJzkCcTEEQUEiYKkeuV8ZbNXLXTBxwbWXDj8ryIkpaCLRqn?=
 =?us-ascii?Q?fb4udm+cX5Gzv0gx5ppPDKXSjOY5M4NeUbd6AHzUhEdMt7n0anFrmIRUHQ5g?=
 =?us-ascii?Q?tRWJigF9njC7qQkUFjOyhUOv4qADyHCVUsbu9ab0M8rvsgeLrDVPVa310v37?=
 =?us-ascii?Q?qdhNNIxavpADkfofXaJOe6+/6rIR0rRreGvHPa6FzU1uw+IbutSuL+d6Io6N?=
 =?us-ascii?Q?qMGnNTbcww1e2BY/K9rDpXV5BRjb8nZZtTdpd0HodbpuHW5wMNKCBC0oleQC?=
 =?us-ascii?Q?ze00jpreRt23875vwogXpS30yQIF4NVKU7/Qj6xO0PF3P0bA2cdDh3PAidFp?=
 =?us-ascii?Q?WvcM/TIctWZWpLQ26+uhzhO7XjKCBVnvfnWvDWSe2UINdMEJk+uDhp8hHW2L?=
 =?us-ascii?Q?O/VSWgEczEsLtPf4aHcCl5U6LpdWUZRYYfPZBX9ARfVCksfc1bhSp5RoBHwj?=
 =?us-ascii?Q?XDb1mkV/mjtD2NclTn4wGUJfSIkzO2uoFbfphFQUgKaL/FBHSQsQeZs4/89F?=
 =?us-ascii?Q?/dsbna+O5d8P/6W7STCQGy5qDNVvr0uVxvzR+f5wLGl1BjU20YGpQt9mWaza?=
 =?us-ascii?Q?Y58foqiZwlTmOwPoPrIchEUBZ923dpwoe9WJhFHS8zpZhm2ZSE7MNCQDJVzh?=
 =?us-ascii?Q?cNdZiKvP3JNNCJUkuJ5m1C7MY5uugalHqlls0e8/S71UBrDFskF41k0a9cpJ?=
 =?us-ascii?Q?FeQNZoacRwsRqF/frxJAB1YJFBuiT3wGMoCrS1stbJinjitWuP0XMSYcRDz4?=
 =?us-ascii?Q?CSQ1mzwwe9tK2yLIAYnaKS8EYiuCXm3bKoUC6+loILDIDzjzF9XGs/EGfqs4?=
 =?us-ascii?Q?i0K973GmAhdPPGMAtnTKCPHP5MPIB0KmHiqlGGKW7ULcCXxszAFkJxH3aAdV?=
 =?us-ascii?Q?YgP19TlnSJnBFEwjjusnl1jjk2cXQjXQtbgMDl8EZCv+EqHCQkFdV2TOgnHp?=
 =?us-ascii?Q?hDz5xXs4UKJ/dupF8zQW/wc7LrKHoJnbeB1JZIb8+g70q4YUVmFwYyhrfN5M?=
 =?us-ascii?Q?rw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 590f8298-dccf-4185-0854-08db53765e09
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2023 05:53:25.5557 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7RYM0u1v01CgRtrS7BAQPRSPlOLspguVqIGr6jDvDWLpauEaO+1G8gKKa83qjn0umgoOms68mN1m7LmPcKpqrGkfrgKb79VTpvDXgt8zziU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8358
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 05/26] drm/xe: Move register MMIO into xe_tile
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, May 10, 2023 at 08:47:01PM -0700, Matt Roper wrote:
>Each tile has its own register region in the BAR, containing instances
>of all registers for the platform.  In contrast, the multiple GTs within
>a tile share the same MMIO space; there's just a small subset of
>registers (the GSI registers) which have multiple copies at different
>offsets (0x0 for primary GT, 0x380000 for media GT).  Move the register
>MMIO region size/pointers to the tile structure, leaving just the GSI
>offset information in the GT structure.

Side node:

I was not very confortable with the sentiment "the abstraction is
currently completely broken as gt is used to access registers that are
not per gt".  I was not the one doing the previous abstraction, but I
understand it as a valid one too: the gt, just like uncore in i915, is
the leaf node that knows, depending on the register, what is the offset
to be applied, which essentially boils down to

	tile_base + addr
	tile_base + gsi_base + addr

gt->regs previously pointed to the right tile_base depending on what
they were ("normal" vs media-type). Here we are creating the tile
abstraction so we differentiate the a complete tile vs gt. It seems
cleaner and I like the direction.

>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/display/ext/i915_irq.c |  2 +-
> drivers/gpu/drm/xe/xe_device_types.h      | 16 ++++++++++++++
> drivers/gpu/drm/xe/xe_ggtt.c              |  3 ++-
> drivers/gpu/drm/xe/xe_gt_types.h          |  9 +++-----
> drivers/gpu/drm/xe/xe_mmio.c              | 26 ++++++++++++-----------
> drivers/gpu/drm/xe/xe_mmio.h              | 21 +++++++++++++-----
> 6 files changed, 52 insertions(+), 25 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/display/ext/i915_irq.c b/drivers/gpu/drm/xe/display/ext/i915_irq.c
>index afde97b6faa6..a9cbd7b59360 100644
>--- a/drivers/gpu/drm/xe/display/ext/i915_irq.c
>+++ b/drivers/gpu/drm/xe/display/ext/i915_irq.c
>@@ -920,7 +920,7 @@ gen8_de_irq_handler(struct drm_i915_private *dev_priv, u32 master_ctl)
>
> void gen11_display_irq_handler(struct drm_i915_private *i915)
> {
>-	void __iomem * const regs = to_gt(i915)->mmio.regs;
>+	void __iomem * const regs = xe_device_get_root_tile(i915)->mmio.regs;
> 	const u32 disp_ctl = raw_reg_read(regs, GEN11_DISPLAY_INT_CTL);
>
> 	/*
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>index 5dcf1695925f..2481b2045284 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -80,6 +80,22 @@ struct xe_tile {
> 	struct xe_gt primary_gt;
>
> 	/* TODO: Add media GT here */
>+
>+	/**
>+	 * @mmio: MMIO info for a tile.
>+	 *
>+	 * Each tile has its own 16MB space in BAR0, laid out as:
>+	 * * 0-4MB: registers
>+	 * * 4MB-8MB: reserved
>+	 * * 8MB-16MB: global GTT
>+	 */
>+	struct {
>+		/** @size: size of tile's MMIO space */
>+		size_t size;
>+
>+		/** @regs: pointer to tile's MMIO space (starting with registers) */
>+		void *regs;
>+	} mmio;
> };
>
> /**
>diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
>index 546240261e0a..200976da3dc1 100644
>--- a/drivers/gpu/drm/xe/xe_ggtt.c
>+++ b/drivers/gpu/drm/xe/xe_ggtt.c
>@@ -93,6 +93,7 @@ static void ggtt_fini_noalloc(struct drm_device *drm, void *arg)
> int xe_ggtt_init_noalloc(struct xe_gt *gt, struct xe_ggtt *ggtt)
> {
> 	struct xe_device *xe = gt_to_xe(gt);
>+	struct xe_tile *tile = gt_to_tile(gt);
> 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> 	unsigned int gsm_size;
>
>@@ -106,7 +107,7 @@ int xe_ggtt_init_noalloc(struct xe_gt *gt, struct xe_ggtt *ggtt)
> 		return -ENOMEM;
> 	}
>
>-	ggtt->gsm = gt->mmio.regs + SZ_8M;
>+	ggtt->gsm = tile->mmio.regs + SZ_8M;
> 	ggtt->size = (gsm_size / 8) * (u64) XE_PAGE_SIZE;
>
> 	if (IS_DGFX(xe) && xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
>diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
>index c4376d50786b..03dd625b2781 100644
>--- a/drivers/gpu/drm/xe/xe_gt_types.h
>+++ b/drivers/gpu/drm/xe/xe_gt_types.h
>@@ -124,14 +124,11 @@ struct xe_gt {
> 	} info;
>
> 	/**
>-	 * @mmio: mmio info for GT, can be subset of the global device mmio
>-	 * space
>+	 * @mmio: mmio info for GT.  All GTs within a tile share the same
>+	 * register space, but have their own copy of GSI registers at a
>+	 * specific offset, as well as their own forcewake handling.
> 	 */
> 	struct {
>-		/** @size: size of MMIO space on GT */
>-		size_t size;
>-		/** @regs: pointer to MMIO space on GT */
>-		void *regs;
> 		/** @fw: force wake for GT */
> 		struct xe_force_wake fw;
> 		/**
>diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>index 254b4a63d901..54fa1212fcd9 100644
>--- a/drivers/gpu/drm/xe/xe_mmio.c
>+++ b/drivers/gpu/drm/xe/xe_mmio.c
>@@ -307,6 +307,7 @@ static void xe_mmio_probe_tiles(struct xe_device *xe)
>
> 	if (xe->info.tile_count > 1) {
> 		const int mmio_bar = 0;
>+		struct xe_tile *tile;
> 		size_t size;
> 		void *regs;
>
>@@ -320,11 +321,11 @@ static void xe_mmio_probe_tiles(struct xe_device *xe)
> 		size = xe->mmio.size / adj_tile_count;
> 		regs = xe->mmio.regs;
>
>-		for_each_gt(gt, xe, id) {
>-			if (id && !xe_gt_is_media_type(gt))
>-				regs += size;
>-			gt->mmio.size = size;
>-			gt->mmio.regs = regs;
>+		for_each_tile(tile, xe, id) {
>+			tile->mmio.size = size;
>+			tile->mmio.regs = regs;

it looks like the adj_tile_count meaning is now lost and w could have a
single tile_count variable and info printed?

also, I'm not sure there is much value to do

hardcoded -------->>----.
	xe->mmio.size = SZ_16M * tile_count

and then do

	size = xe->mmio.size / tile_count

size is always SZ_16M, as documented in the mmio struct.
AFAICS, this whole thing could now be simplified to:

	mtcfg = xe_mmio_read64(gt, XEHP_MTCFG_ADDR);
	xe->info.tile_count = REG_FIELD_GET(TILE_COUNT, mtcfg) + 1;

	/* re-map IO to cover all tiles */
	if (xe->info.tile_count > 1) {
		pci_iounmap(to_pci_dev(xe->drm.dev), xe->mmio.regs);
		xe->mmio.size = SZ_16M * xe->info.tile_count;
		xe->mmio.regs = pci_iomap(to_pci_dev(xe->drm.dev),
					  mmio_bar, xe->mmio.size);
	}

	for_each_tile(tile, xe, id) {
		tile->mmio.size = SZ_16M;
		tile->mmio.regs = xe->mmio.regs + SZ_16M * id;
	}


anyway, this is a small simplification. Patch looks correct to me.


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>+
>+			regs += size;
> 		}
> 	}
> }
>@@ -340,15 +341,16 @@ static void mmio_fini(struct drm_device *drm, void *arg)
>
> int xe_mmio_init(struct xe_device *xe)
> {
>+	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
> 	struct xe_gt *gt = xe_device_get_gt(xe, 0);
> 	const int mmio_bar = 0;
> 	int err;
>
> 	/*
>-	 * Map the entire BAR, which includes registers (0-4MB), reserved space
>-	 * (4MB-8MB), and GGTT (8MB-16MB). Other parts of the driver (GTs,
>-	 * GGTTs) will derive the pointers they need from the mapping in the
>-	 * device structure.
>+	 * Map the first 16MB of th BAR, which includes the registers (0-4MB),
>+	 * reserved space (4MB-8MB), and GGTT (8MB-16MB) for a single tile.
>+	 * This will get remapped later if we determine that we're running
>+	 * on a multi-tile system.
> 	 */
> 	xe->mmio.size = SZ_16M;
> 	xe->mmio.regs = pci_iomap(to_pci_dev(xe->drm.dev), mmio_bar,
>@@ -362,9 +364,9 @@ int xe_mmio_init(struct xe_device *xe)
> 	if (err)
> 		return err;
>
>-	/* 1 GT for now, 1 to 1 mapping, may change on multi-GT devices */
>-	gt->mmio.size = xe->mmio.size;
>-	gt->mmio.regs = xe->mmio.regs;
>+	/* Setup first tile; other tiles (if present) will be setup later. */
>+	root_tile->mmio.size = xe->mmio.size;
>+	root_tile->mmio.regs = xe->mmio.regs;
>
> 	/*
> 	 * The boot firmware initializes local memory and assesses its health.
>diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
>index 1407f1189b0d..acf0b18f3111 100644
>--- a/drivers/gpu/drm/xe/xe_mmio.h
>+++ b/drivers/gpu/drm/xe/xe_mmio.h
>@@ -10,6 +10,7 @@
> #include <linux/io-64-nonatomic-lo-hi.h>
>
> #include "regs/xe_reg_defs.h"
>+#include "xe_device_types.h"
> #include "xe_gt_types.h"
>
> struct drm_device;
>@@ -20,27 +21,33 @@ int xe_mmio_init(struct xe_device *xe);
>
> static inline u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
> {
>+	struct xe_tile *tile = gt_to_tile(gt);
>+
> 	if (reg.addr < gt->mmio.adj_limit)
> 		reg.addr += gt->mmio.adj_offset;
>
>-	return readb(gt->mmio.regs + reg.addr);
>+	return readb(tile->mmio.regs + reg.addr);
> }
>
> static inline void xe_mmio_write32(struct xe_gt *gt,
> 				   struct xe_reg reg, u32 val)
> {
>+	struct xe_tile *tile = gt_to_tile(gt);
>+
> 	if (reg.addr < gt->mmio.adj_limit)
> 		reg.addr += gt->mmio.adj_offset;
>
>-	writel(val, gt->mmio.regs + reg.addr);
>+	writel(val, tile->mmio.regs + reg.addr);
> }
>
> static inline u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg)
> {
>+	struct xe_tile *tile = gt_to_tile(gt);
>+
> 	if (reg.addr < gt->mmio.adj_limit)
> 		reg.addr += gt->mmio.adj_offset;
>
>-	return readl(gt->mmio.regs + reg.addr);
>+	return readl(tile->mmio.regs + reg.addr);
> }
>
> static inline u32 xe_mmio_rmw32(struct xe_gt *gt, struct xe_reg reg, u32 clr,
>@@ -58,18 +65,22 @@ static inline u32 xe_mmio_rmw32(struct xe_gt *gt, struct xe_reg reg, u32 clr,
> static inline void xe_mmio_write64(struct xe_gt *gt,
> 				   struct xe_reg reg, u64 val)
> {
>+	struct xe_tile *tile = gt_to_tile(gt);
>+
> 	if (reg.addr < gt->mmio.adj_limit)
> 		reg.addr += gt->mmio.adj_offset;
>
>-	writeq(val, gt->mmio.regs + reg.addr);
>+	writeq(val, tile->mmio.regs + reg.addr);
> }
>
> static inline u64 xe_mmio_read64(struct xe_gt *gt, struct xe_reg reg)
> {
>+	struct xe_tile *tile = gt_to_tile(gt);
>+
> 	if (reg.addr < gt->mmio.adj_limit)
> 		reg.addr += gt->mmio.adj_offset;
>
>-	return readq(gt->mmio.regs + reg.addr);
>+	return readq(tile->mmio.regs + reg.addr);
> }
>
> static inline int xe_mmio_write32_and_verify(struct xe_gt *gt,
>-- 
>2.40.0
>
