Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBB9FCDB47E
	for <intel-xe@archiver.kernel.org>; Wed, 18 Oct 2023 17:04:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A916B10E199;
	Wed, 18 Oct 2023 17:04:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 787CE10E199
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Oct 2023 17:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697648668; x=1729184668;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5FBBCkr3vlJHD3+ZrSGTThwK3mRQP2MqH0Ln1TaWmro=;
 b=NFuVxsTlcTCJzcqiJb3/KdAZ9yUCGzif6GqOKQVCcjLlno4D9Ha4CJ7I
 ISmq+YThpB3rYTSsomoycgPY0Nx8nSDMdGIWVIvwDxV3bRqMumyXMkjXC
 58LoY/r1wPIYs6GR+lJWQ7f/qR66NWpNr1ulkEsyb/GI8ZcSGVZRIxOe8
 FhTQUpbDv8Q4XBuTjTDfKjw0xsPzaahqTIJPVl9QE6+JKUIXxy1xLK/5L
 k22fYGB2hI8hdKFKyf19XRYZdZsO33XgF7AWDbrgm/wUnNd5mTsxpKfak
 dYVvNQu/zOsDou/soAfAS7mRi47rfnn73HFgj1+vJ49A0xcBDEo6byLb1 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="7610679"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; 
   d="scan'208";a="7610679"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2023 10:04:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="880303989"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; d="scan'208";a="880303989"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Oct 2023 10:04:06 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 18 Oct 2023 10:04:06 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 18 Oct 2023 10:04:06 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 18 Oct 2023 10:04:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YU8Nj7cTsvWt9E65kCZp74m+JJQYinFawSTvluLDH3z2jhy4LgaOPNStThCSh1yeL7Yb714XLuOn2tVb48S4OkvhoRKgelSvBNqyTkihlJfwt+dqk+OogCSckQdVx5Ct0O2PENJvp7Hd6Hmxiih8ORY9g80Ci2iB8+9IbP7g+DsXF6SYspq7vFj/OONI9P/sYyEP/nJZuJ+u9rESPVW9fuIP40xcfu+Nk8Hcde4YwdfsSJOB0Jy7nZo8btsv0tG10FHNgZFNWy7nMJN2NUW9V7O1AJ5QFysPEW9ZMWuUP0Mr0gOP+N2aCMYqUDKCmRTID3yYwd6dtYL9OjoYA7QJ6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6C5cGcYN0A81hLLk051YSOztt5cyXYypgdyVldkW8+I=;
 b=HO1DlRSPcPSpVOEJKSPnKoIneUldvQ+jAnoLSbRXoeQtN7zsW3qn2x+kr3z1OvRS3iuRQracX9l2qWNQZ/pebBLnLej0XH5v5jnqgp18vQ1f26WQT5eJ6OKnYoFZTQ6BQpSyRVmBLiZ+huPLnYDwEbqbT3EwQnzptLEyYSNQZIyiBnS/WKU3EyZxULjCNc4BSTPT4jtO05QIn4z5hM4K+V4YeKIwIOWlOwwVQH7OVmdUsjZwccLDzdjGBXp5cm58o76z27A/aR4ioQ70romCRM62Bwth2zWKZjScEI7gDEts9Ta5QWR5lvprWBNxqagTvdKLflotq6HO7z0caCGhDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB5519.namprd11.prod.outlook.com (2603:10b6:5:39e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Wed, 18 Oct
 2023 17:03:58 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::c228:5055:b7da:d0bf]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::c228:5055:b7da:d0bf%6]) with mapi id 15.20.6907.021; Wed, 18 Oct 2023
 17:03:58 +0000
Date: Wed, 18 Oct 2023 12:04:03 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <agbh6itszzkataqjh5dyxbovvxbgsz7bfgct2tagvimy75jy3u@cofeazcnjite>
References: <20231018123423.427552-2-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231018123423.427552-2-matthew.auld@intel.com>
X-ClientProxiedBy: SJ0P220CA0022.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::33) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB5519:EE_
X-MS-Office365-Filtering-Correlation-Id: d30b7fc1-89dd-4ae2-099b-08dbcffc37dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mF/8+G30QVnY/dlXVUswKA9HtpPnIB28CHaqt3yVD2miu6kFA2X+Fwb9Us/MGKASxPN41mSe5EUL3DYbOExmJJziKMJ3MRFGIgJ4Tjdx0viO5TNbL9Z5hJP+xDRmKdko//7eMt/c6FZLrEkdPM5ipLVzPNbOhpXpEwKS0xUzryFq5hnGAlmqVkaLGkbh/6uSGTEFJW3tKW30e+OaOIx6BhhWUbhMxzI41lMOs/4E2F2rg65gTUhlEgE6ViNo9olx2nNUZ7xSO8p8jgghhVC+bpn/A9wPLblcdKFLO5H+UNntJhB1Oup/mQVtYwvgKLGrfsHnesoVEdw01PdNPyQ+90v2kVISSkb/1YsCE3e5bAuI0ZtUrAxm0btXowAiN14wtdwTJsOv8/yV6eO0WmKfWiZ4Z+tvUuVCkA0wX7WBP+Xjrd80RznCwG6jG9IiOJccjkOmLqD5HJ7VKSPmUJfC1f3LwcNn11mpYjDJkyysIXUF/DQ3TYfGNnu8yOKD8Wj5KYneVdf17/dM3jk9Dz27MC1rrt/PIApnOJaUgnmfwteujFbeM8yrKEQOzlX+Tl3exANpnikMFQa5wwcbwZXc5h9lN9zxA5vc/8Ew2F0QjsL9jMtAMB9+OeTQoz+Tbry7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(136003)(376002)(39860400002)(366004)(346002)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(6486002)(478600001)(66946007)(66556008)(8676002)(6862004)(8936002)(4326008)(66476007)(316002)(6636002)(41300700001)(6506007)(33716001)(82960400001)(6512007)(86362001)(38100700002)(9686003)(6666004)(83380400001)(26005)(107886003)(2906002)(5660300002)(27256005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?grpjL3PbE2JzpMpV5ZvMhuC9gJ57qs1rvNvUw2qU1Oc64mZl6bx4QsojLjCL?=
 =?us-ascii?Q?ahxEclrw+ADy4PmfTaydr85ob+hdBk20v6egLhYY7eevWttQvrcL6SHah16m?=
 =?us-ascii?Q?aGRbxTSuLegFv8sGVEx6V0562AV3z2KzHM9JUdDTs2R8uCdtJbV2Y6lAGDnb?=
 =?us-ascii?Q?D+oXF+Oan/IX2jBewfcl64KhMYgQXNzGATl5UikmEZIAwIUIce54Wty4mRvy?=
 =?us-ascii?Q?mVVOsiOXTqGbZtKz4IooRgGTSRTLsGexC+0Gc3vQWo8Q0j24cBOsQzKCY5cN?=
 =?us-ascii?Q?HuVfYcf0oF3F521Lklr0Lk5iG+JpgWOKtmJoE6JU08Q43k+FLn5edCP/9PzP?=
 =?us-ascii?Q?169BMkn5f0dJCZxEs8kPhiA5+N9kP63iQ3esEo6kmZPlcoglGX1gXWrMsQvN?=
 =?us-ascii?Q?Tvz60ZoqYxgCzfikklQdkzzRjooPivvztc0SBP9ia4UAd8kCc/xi+7U48Oii?=
 =?us-ascii?Q?zz8fmzRXMpBrsNek4M+JmpcliphvkaCFu5AAiKemtX+WK3Psw53LkUhlDTzC?=
 =?us-ascii?Q?h/zl3XXmuFlczDm3kPheK3PjZm7/XtHhUCKb4HUry2id8UijuRRPPnG/rdpI?=
 =?us-ascii?Q?gLN7x66n3vxUxIraUXw3Vcf1SvrZX3kYnXUZLuidHvK8ZWPX1Pe+Mv4CuRQg?=
 =?us-ascii?Q?TGgW1HKeTqvYoany99cd3nriP22O0J0CDo+Sv9QZ6wHh1rCWmkOfrWw3DWQV?=
 =?us-ascii?Q?JFbz5ShIblhGJ4J84VfEycDdEFHxG+lboCBKijD9MMCg0D2O4ZySe1htq9Cq?=
 =?us-ascii?Q?+WMV6WvJHTLlNmDmfEDtMomVMwS3+MOj5IJbXplmgINOVeqGV9idb8Umcb/m?=
 =?us-ascii?Q?po50bHHi7ITmgLLW9zmokfYYyRzNC4F2YMZjVjhWjHjvETMlEwRbGvdnGAZr?=
 =?us-ascii?Q?47MVmKPerPRcCIy52aFH/miqfeEtc468UoZqtXRj7jSjTJjmNLQpni4cXvkD?=
 =?us-ascii?Q?Q/Oedo59K8zqo/We+a+athyAJu+i+v0C8SeZPBnrQDQTJaQDigwO5LzMMJd1?=
 =?us-ascii?Q?MBJGxrA1puzTTLK4kDGad4ubwtrdgaWZkjSmz2WFtKasLSzJ+aydE1grMihJ?=
 =?us-ascii?Q?03PhxFRRSpEYmAj/o7ZsibAcr49KcI8OVh00d6F0LLPWM0XwwVNP3VZssKKI?=
 =?us-ascii?Q?x/GAhAOqaRZB1JPUzbcHUhtP0qmgjrkznFqv1tuV9YADmMQBZSFZBgfpixta?=
 =?us-ascii?Q?n94GIkgLKiPJbSLAtbS2hRGR5MG3Qo2xT+1ggN6icdfjO6So0MC8PIKe95Lh?=
 =?us-ascii?Q?fPZVbdk4j9pZEFilMMFSswL92Q7spMtJEB+7Iih1tpMyRs9Q9o5csjAda/r5?=
 =?us-ascii?Q?ZO//ZHhCJ4kyWiGFaOPdCL9uUpwzukPpHtePgDSAMmn+hw3yyklezkwscL/8?=
 =?us-ascii?Q?ukLzVsS5XaMcSVaIzT2WKbeu5Su87PmyxwPl5XxKf5CnhHUK390J/BzKk7EA?=
 =?us-ascii?Q?Xyviob56Uj+5SeZcw5EC+u2MNbH6SN7HM73fCdfw4IeYTJghmEWM2PxU6wSh?=
 =?us-ascii?Q?XpWXFXnxlIeCWxqWTec0vv7B3QtTETGFT0T2C7EgYC0Yvg95SW9RzDQIeLLF?=
 =?us-ascii?Q?7CvGY6NaC0obX2sd158vb/rLQSoxu6Akk74vO5bRi2b7oDXxGl72LGrH+zof?=
 =?us-ascii?Q?2g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d30b7fc1-89dd-4ae2-099b-08dbcffc37dd
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 17:03:58.1086 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y1yRj3u/+1rISyRxCZ9qbntr+5CFASF+1jddSMhWXpYmt+u5WFr650Y2sSvyECI/2sa6MU3aGFTU2o+6UwmEFG2h3erNYj1d/8uKgwWRGvM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5519
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: fix pat[2] programming with 2M/1G
 pages
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Oct 18, 2023 at 01:34:24PM +0100, Matthew Auld wrote:
>Bit 7 in the leaf node is normally programmed with pat[2], however with
>2M/1G pages that same bit in the PDE/PDPE also toggles 2M/1G pages. For
>2M/1G entries the pat[2] is rather moved to bit 12, which is now free
>given that the address must be aligned to 2M or 1G, leaving bit 7 for
>toggling 2M/1G pages.
>
>Bspec: 59510, 45038
>Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Matt Roper <matthew.d.roper@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Another thing I missed in my refactors adding the hooks was to document
the pte_encode_* functions are not only about pte, but also pd* when
those are leaf nodes.  I may add that later or review it if someone
beats me to it.

thanks
Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_bo.h |  1 +
> drivers/gpu/drm/xe/xe_vm.c | 17 +++++++++++------
> 2 files changed, 12 insertions(+), 6 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
>index 78da28f4ea13..4e74201cc986 100644
>--- a/drivers/gpu/drm/xe/xe_bo.h
>+++ b/drivers/gpu/drm/xe/xe_bo.h
>@@ -41,6 +41,7 @@
>
> #define XELPG_PPGTT_PTE_PAT3		BIT_ULL(62)
> #define XE2_PPGTT_PTE_PAT4		BIT_ULL(61)
>+#define XE_PPGTT_PDE_PDPE_PAT2		BIT_ULL(12)
> #define XE_PPGTT_PTE_PAT2		BIT_ULL(7)
> #define XE_PPGTT_PTE_PAT1		BIT_ULL(4)
> #define XE_PPGTT_PTE_PAT0		BIT_ULL(3)
>diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>index fa6fa34a0663..498c0b3e1d73 100644
>--- a/drivers/gpu/drm/xe/xe_vm.c
>+++ b/drivers/gpu/drm/xe/xe_vm.c
>@@ -1210,7 +1210,8 @@ static u64 pde_encode_pat_index(struct xe_device *xe, u16 pat_index)
> 	return pte;
> }
>
>-static u64 pte_encode_pat_index(struct xe_device *xe, u16 pat_index)
>+static u64 pte_encode_pat_index(struct xe_device *xe, u16 pat_index,
>+				u32 pt_level)
> {
> 	u64 pte = 0;
>
>@@ -1220,8 +1221,12 @@ static u64 pte_encode_pat_index(struct xe_device *xe, u16 pat_index)
> 	if (pat_index & BIT(1))
> 		pte |= XE_PPGTT_PTE_PAT1;
>
>-	if (pat_index & BIT(2))
>-		pte |= XE_PPGTT_PTE_PAT2;
>+	if (pat_index & BIT(2)) {
>+		if (pt_level)
>+			pte |= XE_PPGTT_PDE_PDPE_PAT2;
>+		else
>+			pte |= XE_PPGTT_PTE_PAT2;
>+	}
>
> 	if (pat_index & BIT(3))
> 		pte |= XELPG_PPGTT_PTE_PAT3;
>@@ -1265,7 +1270,7 @@ static u64 xelp_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
>
> 	pte = xe_bo_addr(bo, bo_offset, XE_PAGE_SIZE);
> 	pte |= XE_PAGE_PRESENT | XE_PAGE_RW;
>-	pte |= pte_encode_pat_index(xe, pat_index);
>+	pte |= pte_encode_pat_index(xe, pat_index, pt_level);
> 	pte |= pte_encode_ps(pt_level);
>
> 	if (xe_bo_is_vram(bo) || xe_bo_is_stolen_devmem(bo))
>@@ -1284,7 +1289,7 @@ static u64 xelp_pte_encode_vma(u64 pte, struct xe_vma *vma,
> 	if (likely(!xe_vma_read_only(vma)))
> 		pte |= XE_PAGE_RW;
>
>-	pte |= pte_encode_pat_index(xe, pat_index);
>+	pte |= pte_encode_pat_index(xe, pat_index, pt_level);
> 	pte |= pte_encode_ps(pt_level);
>
> 	if (unlikely(xe_vma_is_null(vma)))
>@@ -1304,7 +1309,7 @@ static u64 xelp_pte_encode_addr(struct xe_device *xe, u64 addr,
>
> 	pte = addr;
> 	pte |= XE_PAGE_PRESENT | XE_PAGE_RW;
>-	pte |= pte_encode_pat_index(xe, pat_index);
>+	pte |= pte_encode_pat_index(xe, pat_index, pt_level);
> 	pte |= pte_encode_ps(pt_level);
>
> 	if (devmem)
>-- 
>2.41.0
>
