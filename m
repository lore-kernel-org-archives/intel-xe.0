Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49C47C761A6
	for <intel-xe@archiver.kernel.org>; Fri, 31 Mar 2023 22:25:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFF5689A88;
	Fri, 31 Mar 2023 22:25:31 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D44D589A88
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Mar 2023 22:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680301522; x=1711837522;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=KfoLEfjrCRaeRd/egRDASbjoFK5y92C6b6r9kXPvg7c=;
 b=iimWvnbJDzGAFeyCSvpyAmhvoCJwPhXqar2ufNBZoFUKq7s3/AB8yKan
 IvYRi4xqh/iHUfkIkBk96nCNPz7p2mbaBKHhiApKkcuB67KmmKipP/BHr
 zS++QsYkUyC0sz4JpWYCe8TV7RE3qZ3fAjQHZUh+Szu7sYHD4BiNZrA28
 1frIlKcVuV8c1S3YnfaNzJryoMF5koUMFEap6/Cuz46dwnCFJXT6ihh6T
 ybgNVNNnwIZEp/dQhlJYEIu8FcDeDWFP+P2PCHa8y1JnrEZqaRhwhvcju
 Y7lFhuNE6DjaNEZmsaj8qvp3LLF4krPXiQsC/FEfKP5priE0RF7H2LVYH w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="321962589"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; d="scan'208";a="321962589"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 15:25:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="828867915"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; d="scan'208";a="828867915"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga001.fm.intel.com with ESMTP; 31 Mar 2023 15:25:14 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 31 Mar 2023 15:25:13 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 31 Mar 2023 15:25:13 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 31 Mar 2023 15:25:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z4OoNDEuxaRnz1sXnZwZzZlAgn2Z3e/KmVSwc+yM7f7Wrot+55M3z3LyF754jVWKgcjw16ihxZMiRnQJD8+NbIMBBTdnkRXu6/GSkqFvT8Qau6ipeE9cTq9HT3EW+CG/wjGxYL0XRNi8pn1rwHZQKopmpLqpxInoxrsMoCWC84dNNoJC8LITVHAc7dPz+qXQwADcaipv+2FpenhKKVmkl0Zh2rvo70AvUtBbMlnAMe0ZJ/rpNEBvj+TH6Insgp48cJ9LaeBtvtEiYGvGnKemaCQhWzlfkfhX0yU62ICyu90e4T5Wudg8fdesBWglYd2YBmxo/zHjiR9oEuEZK+P7aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lnMAPaBQFng4J4oScSsOMHX6Qc7yC3cdDRWt9M66xM8=;
 b=TLrZgUeHR4hOJDFzQbVaeKgaUM/gwadxm9YsPD1NKmOxMfC976WQdCSvWfodZdUn8QV12pTyZnciBkdkxehEOqlSjnQwq5Szxn9/DFy0xeUuH5zlRjR5anpQ0OS5FO5gJ2Mxnstee+o7ExcMchoOPNTN92nYl3hb98KOJlCQsk/7+aGkxgsW3ZIihhHtSEbvqzFxXpGk383FG0MGt9SCPPyJ8t7mW9ndYXnHTDHxx6kfRm6RUbLBZYrZlqcbIoZmOmw9iVeAGQo6qibfd/N+3UlEUu2dxc1zRBRQVKEG/sRqTSC9mDdfhQVde+p74PPWOxyYyfoTOMLRDy3aMMEnsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB5917.namprd11.prod.outlook.com (2603:10b6:a03:42b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Fri, 31 Mar
 2023 22:25:10 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%5]) with mapi id 15.20.6254.022; Fri, 31 Mar 2023
 22:25:10 +0000
Date: Fri, 31 Mar 2023 15:25:07 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <20230331222507.7qcndm34kiwnxajh@ldmartin-desk2.lan>
References: <20230330182405.43993-1-matthew.d.roper@intel.com>
 <20230330182405.43993-6-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230330182405.43993-6-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0PR13CA0123.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::8) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB5917:EE_
X-MS-Office365-Filtering-Correlation-Id: a045df7a-50a4-4d4e-7235-08db3236c9b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: afEL5ZilGza2tGs3p4VAv89I96EFcfKKi+/yGKbJKq6EJXdDaa35rzo8ujLdnp03SzhT2JZ0FruoGxdS61OWGyevq9Wqmo3cPgyw3khp9rszix+dnJBJPB0wDGtSv2WmLJD78FcLP1dHriHS6rNSYr+xYrybhpeBxPtDAAt1Zaut1OSJjmHpZIDFU92MCDdYHnP39P9Y+ulhmOhK2ljn3VT19cwDi+JZOjKYsjiONYm+sVhyqPITDhcBPT0+HrGAtIGxWxSoewbBJW+hyw4iO+kaO3TlNo1zgHbVJL44MQEOxS40GdzSl1Jr4U4CT4H8kgxfOaFv0P3R6kkLuKWzAGD6H3JhbEvT83/jNc/QQzsTRXik1Ctlto6auKzr9NgWTRlcWtPNezOD7ljZEOInjAt+GZY4yUZvMS8fuTeBB4gf+m6SP2KQHFVMQAKC7QA3VRFEl0t8ygSFq/QJ3KEyMqqoNP3dHixnibK9TsFRwvIrMpeG/YO3GM9VBWEfYniH3IveGF/JANHC2pjitbS8FZNp8iIw+os8KUy/X7nEPMBC+8Bf2DT40oa3Tedx9+62
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(346002)(376002)(39860400002)(396003)(366004)(451199021)(4326008)(2906002)(38100700002)(6862004)(41300700001)(5660300002)(36756003)(86362001)(82960400001)(8936002)(6512007)(316002)(6636002)(6666004)(6486002)(478600001)(66946007)(1076003)(26005)(6506007)(66476007)(66556008)(83380400001)(9686003)(8676002)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yXRNdFruo8O31Jh7+3JXz/waT7rmS5niKtwXxcH+ep2vybI0axlgIxZJoY5A?=
 =?us-ascii?Q?82HVxLD9tfsY9CIan1kJWbYIEe0UHe/NGxuWO8Y3W7AzqDqsjNwiz5BtftGy?=
 =?us-ascii?Q?B5C/TduWBugzc0tZGOhvHNI6MpAaW2oojJeLJ9gy2Tga0kOdbrW2c0ORDLtp?=
 =?us-ascii?Q?JcZKr7ZqD4dmtTsBidxWW2GrxmxRNakFxWblt+ioFO9e693/ubC6PLfwR2GJ?=
 =?us-ascii?Q?eSeNU8UEFlfBR4WtANw/PvB1wmNcTkUWr44V/ziaQ0aSVA4o8NhrxxC6vZN6?=
 =?us-ascii?Q?FCO4GWjdmIGF8eH+DNmd1WHZpt6x/3uLPzh5iTMxH4fz2AzNUAfVVcy/xtd1?=
 =?us-ascii?Q?jHUtijS84AMbmOP88mRkUYDMaIxbGggDsuaOfCQzmWwwtp+hzbPN65lmR+E7?=
 =?us-ascii?Q?aO4n8LO33dI3nhINaUP7I4Ir+NkoMyMNc/6JgasTorJK5FyIk3HJftXFjpcq?=
 =?us-ascii?Q?es06rGIXPSRKWWlVNp8DJcdwQe1O4sWtb0REmy4S6FA3ZEqfZXAQuQ//ZPqy?=
 =?us-ascii?Q?IFeAhef6km7nFSitkhRlT7zTWHzEF32GAbgXCf24Hd3Zv17I18zJVrLG8ElD?=
 =?us-ascii?Q?sn2kmH7SuuEVYE9dN0gPyQTpIk3oselUcSnLNdcmf8GTY8tSVtlEfIJkRunH?=
 =?us-ascii?Q?+QUH63GcaIdpRlUh1c9gwgxffzxNvFER3sT8ipxJG65xu40bahh246vmYam7?=
 =?us-ascii?Q?HKBjxIyaqUEvBCqqh3cGfE0U3F7l4p+UeTO6y7Hz5Y2ON3T7LDvxn6pJ7SPE?=
 =?us-ascii?Q?U3eAHQPo7M+a1deN2pCBznL3Ney8E+ujTJSZazdIs2/J/ZWqgkXVTIgIp+wK?=
 =?us-ascii?Q?1ggC3x2tF/ly5UttY2J6K88XBwnja1VqOt6lDUA99HS9ZMIMiv7IDoipNQNc?=
 =?us-ascii?Q?EKOcgS+IDNWolmw4CsqI1NQamhFtWCrk61OuzfcQ4AAsCRef7QvzVpqwUmoW?=
 =?us-ascii?Q?+aEV/y1Ra3oumIl28qm2ndm/Kmp2tP9lcQpZnif+KDRQLvn8vVqoAETvUAgg?=
 =?us-ascii?Q?qHXDi/i7HUKp1yi59lzcmXJvIKu/u0MJvcmaoWBJStjWGnKLI4mF0TW4UT+e?=
 =?us-ascii?Q?g7+tuRMJSlzQlKbkcZ8IfS2DGHDNfXMPbXBEpZOsV2We0ldkfeC3f5iFdvOf?=
 =?us-ascii?Q?SHilQR1s9cbOGWq2OuT5Fhu57C2j/1JyZG2yM+RYqZZ3lgjLedwvhmqx8Wvh?=
 =?us-ascii?Q?B5IUxS9xTNq7BVi2EfZyf/gNs+JBjwILDQWnjY3KMDvzbT7X/Q4VeRfJBlN4?=
 =?us-ascii?Q?TRKmrS6gF8K/wekMISZR0MXl7XYZBNSobiX/lBgvgthp2crdgDtQmtdiruWQ?=
 =?us-ascii?Q?d3968nvtacLEL+F/kaxAJlB0gxj72sGHxKAA2P9cj95ldcbwcTxgdnzmJwgE?=
 =?us-ascii?Q?332cz9/XTHzmCjvm+jWvGIgarQzdXV42zrsXF74EU0abfRH0uDgLQG+quhCc?=
 =?us-ascii?Q?bnDhor+/7ioFgcxtYb/0ZjiBP/sIrQKjX3IlMrTbCub/Lj1HIako2jiu/2Si?=
 =?us-ascii?Q?cF2WGfrjsIYsvp5OaO+CYVfD7Rw+Kh/WM8mH2oCp+/355M+KGWM8utWN46G5?=
 =?us-ascii?Q?OeHyrYI2Z4hrW2sHdHhlHn9UclOFyBl76tvCtxyNg1uyEAVXcwYpAoD0UTdF?=
 =?us-ascii?Q?SQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a045df7a-50a4-4d4e-7235-08db3236c9b2
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2023 22:25:09.8952 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l9sVSi8KgrG4F4ViS6y7Gso2pcEb/lAmmKVeZiVct3KJrTrcpmuXQd7+kzfHtNmJvkaGosMsoY0Emb3aExdDYnlwIYuS0WKa+0gUee021Ek=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5917
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 5/8] drm/xe/irq: Rename and clarify top-level
 interrupt handling routines
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

On Thu, Mar 30, 2023 at 11:24:02AM -0700, Matt Roper wrote:
>Platforms supported by the Xe driver handle top-level interrupts in one
>of two ways:
> - Xe_LP platforms only have a "graphics master" register and lack a
>   "master tile" register, so top-level interrupt detection and
>   enable/disable happens in the graphics master.
> - Xe_LP+ (aka DG1) and beyond have a "master tile" interrupt register
>   that controls the enable/disable of top-level interrupts and must
>   also be consulted to determine which tiles have received interrupts
>   before the driver moves on the process the graphics master register.
>
>For functions that are only relevant to the first set of platforms,
>rename the function prefix to Xe_LP since "gen11" doesn't make sense in
>the Xe driver.  Also add some comments briefly describing the two
>top-level handlers.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/xe_irq.c | 46 +++++++++++++++++++------------------
> 1 file changed, 24 insertions(+), 22 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
>index b1b94ba43b3f..de0c27c0a09c 100644
>--- a/drivers/gpu/drm/xe/xe_irq.c
>+++ b/drivers/gpu/drm/xe/xe_irq.c
>@@ -70,7 +70,7 @@ static void mask_and_disable(struct xe_gt *gt, u32 irqregs)
> 	xe_mmio_read32(gt, IIR(irqregs).reg);
> }
>
>-static u32 gen11_intr_disable(struct xe_gt *gt)
>+static u32 xelp_intr_disable(struct xe_gt *gt)
> {
> 	xe_mmio_write32(gt, GFX_MSTR_IRQ.reg, 0);
>
>@@ -98,7 +98,7 @@ gen11_gu_misc_irq_ack(struct xe_gt *gt, const u32 master_ctl)
> 	return iir;
> }
>
>-static inline void gen11_intr_enable(struct xe_gt *gt, bool stall)
>+static inline void xelp_intr_enable(struct xe_gt *gt, bool stall)
> {
> 	xe_mmio_write32(gt, GFX_MSTR_IRQ.reg, MASTER_IRQ);
> 	if (stall)
>@@ -168,7 +168,7 @@ static void gen11_gt_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
> 	xe_mmio_write32(gt, GUC_SG_INTR_MASK.reg,  ~0);
> }
>
>-static void gen11_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
>+static void xelp_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
> {
> 	/* TODO: PCH */
>
>@@ -176,7 +176,7 @@ static void gen11_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
>
> 	unmask_and_enable(gt, GU_MISC_IRQ_REGS, GU_MISC_GSE);
>
>-	gen11_intr_enable(gt, true);
>+	xelp_intr_enable(gt, true);
> }
>
> static u32
>@@ -278,7 +278,11 @@ static void gen11_gt_irq_handler(struct xe_device *xe, struct xe_gt *gt,
> 	spin_unlock(&xe->irq.lock);
> }
>
>-static irqreturn_t gen11_irq_handler(int irq, void *arg)
>+/*
>+ * Top-level interrupt handler for Xe_LP platforms (which did not have
>+ * a "master tile" interrupt register.
>+ */
>+static irqreturn_t xelp_irq_handler(int irq, void *arg)
> {
> 	struct xe_device *xe = arg;
> 	struct xe_gt *gt = xe_device_get_gt(xe, 0);	/* Only 1 GT here */
>@@ -286,9 +290,9 @@ static irqreturn_t gen11_irq_handler(int irq, void *arg)
> 	long unsigned int intr_dw[2];
> 	u32 identity[32];
>
>-	master_ctl = gen11_intr_disable(gt);
>+	master_ctl = xelp_intr_disable(gt);
> 	if (!master_ctl) {
>-		gen11_intr_enable(gt, false);
>+		xelp_intr_enable(gt, false);
> 		return IRQ_NONE;
> 	}
>
>@@ -298,7 +302,7 @@ static irqreturn_t gen11_irq_handler(int irq, void *arg)
>
> 	gu_misc_iir = gen11_gu_misc_irq_ack(gt, master_ctl);
>
>-	gen11_intr_enable(gt, false);
>+	xelp_intr_enable(gt, false);
>
> 	xe_display_irq_enable(xe, gu_misc_iir);
>
>@@ -342,6 +346,11 @@ static void dg1_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
> 		dg1_intr_enable(xe, true);
> }
>
>+/*
>+ * Top-level interrupt handler for Xe_LP+ and beyond.  These platforms have
>+ * a "master tile" interrupt register which must be consulted before the
>+ * "graphics master" interrupt register.
>+ */
> static irqreturn_t dg1_irq_handler(int irq, void *arg)
> {
> 	struct xe_device *xe = arg;
>@@ -435,9 +444,9 @@ static void gen11_gt_irq_reset(struct xe_gt *gt)
> 	xe_mmio_write32(gt, GUC_SG_INTR_MASK.reg,		~0);
> }
>
>-static void gen11_irq_reset(struct xe_gt *gt)
>+static void xelp_irq_reset(struct xe_gt *gt)
> {
>-	gen11_intr_disable(gt);
>+	xelp_intr_disable(gt);
>
> 	gen11_gt_irq_reset(gt);
>
>@@ -462,13 +471,10 @@ static void xe_irq_reset(struct xe_device *xe)
> 	u8 id;
>
> 	for_each_gt(gt, xe, id) {
>-		if (GRAPHICS_VERx100(xe) >= 1210) {
>+		if (GRAPHICS_VERx100(xe) >= 1210)
> 			dg1_irq_reset(gt);
>-		} else if (GRAPHICS_VER(xe) >= 11) {
>-			gen11_irq_reset(gt);
>-		} else {
>-			drm_err(&xe->drm, "No interrupt reset hook");
>-		}
>+		else
>+			xelp_irq_reset(gt);
> 	}
>
> 	xe_display_irq_reset(xe);
>@@ -480,10 +486,8 @@ void xe_gt_irq_postinstall(struct xe_gt *gt)
>
> 	if (GRAPHICS_VERx100(xe) >= 1210)
> 		dg1_irq_postinstall(xe, gt);
>-	else if (GRAPHICS_VER(xe) >= 11)
>-		gen11_irq_postinstall(xe, gt);
> 	else
>-		drm_err(&xe->drm, "No interrupt postinstall hook");
>+		xelp_irq_postinstall(xe, gt);
>
> 	xe_display_irq_postinstall(xe, gt);
> }
>@@ -501,10 +505,8 @@ static irq_handler_t xe_irq_handler(struct xe_device *xe)
> {
> 	if (GRAPHICS_VERx100(xe) >= 1210) {
> 		return dg1_irq_handler;
>-	} else if (GRAPHICS_VER(xe) >= 11) {
>-		return gen11_irq_handler;
> 	} else {
>-		return NULL;
>+		return xelp_irq_handler;


also a great cleanup of dead code since these else branches
unreachable.


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi
