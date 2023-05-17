Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 287FCC77B75
	for <intel-xe@archiver.kernel.org>; Wed, 17 May 2023 05:10:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8F8E10E047;
	Wed, 17 May 2023 05:10:05 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A04510E047
 for <intel-xe@lists.freedesktop.org>; Wed, 17 May 2023 05:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684300203; x=1715836203;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/Do+CZdkiNlEBQdkop2n4WKBlyeAUiTeEOubAW4TyRw=;
 b=gZUjeK9bfQERSWqAoGB+EeSoOmQnwayvp+7y8Ndsn4pe2ajxPJZiFka1
 GeoU+n26YV7sWR1IlYdXTpKXj0wV9DSSFtPXBDWXkzEz7ScKvbfhA8LLs
 Eyz4cDjLbTi0US2E0p46Yp7lGnF5lm9QxnJ4+7ebx8qkHsQaUL72s9N+E
 OXcPjKXwfnN0QA96dZx4RlHyOyGAvWhj3ET7YMayjESechh4wPkQwdIKI
 RfWXDuQ5cUAjKZtX2BIlSjHZr/GfyEhclfVYVO2oyJbHXQT2n9+2Pt1pW
 evtKJG9eIZwfhy6I+ajMaBBLuPtTV/nfZyewBUJLWhOOlVNGIFaQGEYt2 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="415075612"
X-IronPort-AV: E=Sophos;i="5.99,281,1677571200"; d="scan'208";a="415075612"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 22:10:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="825829295"
X-IronPort-AV: E=Sophos;i="5.99,281,1677571200"; d="scan'208";a="825829295"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga004.jf.intel.com with ESMTP; 16 May 2023 22:10:01 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 16 May 2023 22:10:01 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 16 May 2023 22:10:00 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 16 May 2023 22:10:00 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 16 May 2023 22:10:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=afkUOG4oP14FSM4lgz1GbEbEdAac8Qx2YvQqYzWCtl5JhA6SQOfXD+7qzubDT3nKcQMNSE5GAQniVuaVGApc9edZ2lqLfPjb6JTGk3h4LHZBZTwWpMHdpi+pYOzIvP6DedOESmEf4e98NNYzqdve3R2f1cebKgWNmQqh7eLkxMg88zdoHLDk00Fqe2PxrKVHOObytvkT/beMTt1/xoghfLbF8S5Gps0w1IRUN29hZkrrWxFcruqNsPdQiVgrs2Acol4FhEAXocoUMfGhkz5pdlvY9BXOOgsmNuTxchFDdG7X0d3OQN5qCOAMiFWm7zyXDso6SZVHm1NpZKNZ+s+q9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dP5lxGIi/12/TxAo4/f32a/iAEpKD4FEc2e8VaAxNgM=;
 b=PAMavZ6WuLpa3a3F4dt9afZQr2p1pleHAX3678nMBf564IR+zg1EQkomHZKOOEYQrfheOiSmyHf9q66aWAdAB94YXlIfAW8Lx/jkb120jF4XnI2kUqd3yJEMCw3jAcbqaFvPZE2LCQwBk7YJxgtr3WFP/GD/2n4L6G1G97UoR4AejJqUNW5eeD8NNIeP8USKSPEYmPmcv6KSf3lairNjCeA9TSYANLV9yKlW5a6Rsn6r1wx/C15sutUyePihHnCIocpgm/viv21c90RHkJ79zB9+ABY92InyrnX11+8VgcsptYF8BtrqoCuEyXddlA5DM/A77GMJQIFQylrwQ+aLaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY5PR11MB6233.namprd11.prod.outlook.com (2603:10b6:930:26::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33; Wed, 17 May
 2023 05:09:58 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6387.033; Wed, 17 May 2023
 05:09:58 +0000
Date: Tue, 16 May 2023 22:09:54 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <tc2f3davdlncjgkqhtoy7z2g3fannj362qs7cjfavd4ys5at2a@7em3rdntlaga>
X-Patchwork-Hint: comment
References: <20230511034722.1929038-1-matthew.d.roper@intel.com>
 <20230511034722.1929038-11-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230511034722.1929038-11-matthew.d.roper@intel.com>
X-ClientProxiedBy: BYAPR01CA0032.prod.exchangelabs.com (2603:10b6:a02:80::45)
 To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY5PR11MB6233:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f65d90b-9d40-428a-0e36-08db5694f5e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mDrsniuvv00U+45GXIbsbhf6AcbeTl5WkGJdfw3xOTpMxsMUaM7ByRRDVyp61hKuvTRTrEKVf/GH2lnwbwR+F7YLx19Kxcf2eFaTNaNqoxr8LFgcm5edevaU9lO6NNiwceFszfhjdVCdkc69XudjEVMlp9X9lvbVRbJRLVUmI5OKPn2yM4UleFHt6IHBnVT5zRSQJiOAprrVDA0P4jOT302id6ats07Ao5rmilqRUk5ZjQiLfquoLgu8SptAmVnjEtNMtEE/0hBgUsUGMSoSpIIGXImrgcZINrkhc6j7/Y0ojRAL/CmRVZAyknfVy33Lsoe0wcvQrnklCRXI1k75DUs5z1ME7agqLt6DGdf/iajiaJorzxI1/OoWs3cIp+xZck3uFDolw/D2JhEK57VCPDnr3v0im+RtJohq0duxZ/6QUYaEbjZMtX4s0SzLTwwOHUmykCW5nQzUTQmtfhwV+pIrvX5Sf2aU4Bxj2Q/UiSu1u7xftsQ7P0ct0uusNMQFF0laLZK8CAQhtbVr9cX0CJBv2tzzU5skg8wGZqWuOdCqdeoAI4D1ofJSCYfLUSO+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(376002)(366004)(396003)(136003)(39860400002)(346002)(451199021)(6486002)(4326008)(6636002)(66946007)(66476007)(478600001)(66556008)(316002)(86362001)(83380400001)(6506007)(26005)(186003)(9686003)(6512007)(8936002)(6862004)(5660300002)(41300700001)(8676002)(2906002)(33716001)(82960400001)(38100700002)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KcqG0AsEk/1Ss8Gi3OsRsZ+XQoHJq7uI/59m6EOzZ5J8z9UFnDCghpe5Fbm+?=
 =?us-ascii?Q?+a6PDoaR0zdAHet7w1lbnr2iYQ/6tl8zx2+7WpuJ2uz2mHF5lLHvvzswxqLj?=
 =?us-ascii?Q?Tf6E2U6LTIq/rvFQaW0mp8ZAomgkRxhkW/QSpVbertCg0F71ktxbfZJ9+cM4?=
 =?us-ascii?Q?2vztS5aCwOKfx56fPvtwNISDVwPVRhmUnCZ8qm/ezSoCvpSbbV+9iVFKTk1Q?=
 =?us-ascii?Q?MH4LZLeS7kO8JfWxr98Siuq8fS6kxXtqQbmDifUfz3auun1eDEpfEgnbq9ez?=
 =?us-ascii?Q?q7M8Mad6PA2UZ1XoceeQofRsYS9h0OykB8a7RDua88/cibxphxt2sMmHQm27?=
 =?us-ascii?Q?XWGbxAN0Dij+pFAmEYx73Tb8IkPRWsH7TWnaP6BN2cDc/+bxGSMMYEoi7xG2?=
 =?us-ascii?Q?zOkq6HG7NLICuzjm1OQlFx8jz0B//UftgmDTcwvO6kq215kdQZskoE+/1RTB?=
 =?us-ascii?Q?13dMJIbpphwTN5PRX3XzQ1Yw6G2idrmsmvHavnGy06d73rf1p6AVIX3JvWh/?=
 =?us-ascii?Q?5yJFckYDmRXHFlStmdU6mVP9N4+P8SRhG9EMDbQXTcpdXukmkMwg+fAdNmYv?=
 =?us-ascii?Q?ZXkhhmZmjYo3HLOJu5AriBQpebsDMJoBVUSkWIAbCmvihz22eIlsnZ1DTUH2?=
 =?us-ascii?Q?4Chy/a/Eh4sUi3+nBwHk7XgujQ6yXI3uiqXusbV0mp2d09BfEslyPa7QqVyC?=
 =?us-ascii?Q?qdsOxv3PSgC01q4eTz0Cjn4220QfVOtZMw23Mxv3GCt5UUZzIrmaaLRK5dBi?=
 =?us-ascii?Q?qF3+THIMuudbLQGWnEMQ1MX0AfMMF5E6Pl+p4ABRNvRCM4J9wNp9vrhCwC7q?=
 =?us-ascii?Q?EcwyeqViBfIUPqd70omUrQXzKpE6q++hpO4XiNsRa7qwvxpoO+9XWzOEdw+x?=
 =?us-ascii?Q?Lg5YJsJa+34SziR+K+q58wkGrdqC0MZ1Jg80slvyyI+YjwiS8G1+qF10NDaW?=
 =?us-ascii?Q?sVu82W2wai/eAddjvJPG5VfCMKmPmwxYnnJtEpIJAX7X2sgvLAe4EbkncsY9?=
 =?us-ascii?Q?WGrBOlkULXCMmlzzLCjaiRBA56tblXGwUbPG1itLbuK3r6PSC3ePDtDAVgbi?=
 =?us-ascii?Q?mIW9hjP4Wv6xi+2fq/GW/gISQNpIbW1WsoArd6FMz6lpFyUXl2AtYDQi45R4?=
 =?us-ascii?Q?bsb8FPcu4Vklkl2U7X8o9+6sFl2yrLRYMXUUhcxTtsPLOsYz7w2OeanMy8O6?=
 =?us-ascii?Q?g8isq8DLhcK1+PkwMAr57z9vGuhOSI2JqYowYk8lTqaCXyyumr0NRUoHB3Oj?=
 =?us-ascii?Q?rNUseNAybiIJdDbJIKTshhV11bf0wuX8rcs56g3A49mRDStXRDex/fvM6Rgl?=
 =?us-ascii?Q?5fgqUQzAGXDtmj1OBAcsY2kFeEa+m3+J4poDR60FKynphV+C/RzUCQggQyGg?=
 =?us-ascii?Q?Gt9+kP/i0EyQ3DOd3QsqbJffPMFJCu8ixwYjXbyxeULp5ZuwwSPI4VcRZTLr?=
 =?us-ascii?Q?QY3R9u2ZvW042NL6hek61dgcBvSh2xNSd7e3kMfy127/ayixPCmwInIMrt/3?=
 =?us-ascii?Q?ODfk++/lCiV40GTZTqohoCX6MDddZRmLKQFyExCc+6yshfA/ShuN/J7kFcQl?=
 =?us-ascii?Q?UVzpsXONiUh2bOmu9hBQOvQ7cobpcuEAs3OuTwsAPIGcJhMDxw18aJ3ZI/9n?=
 =?us-ascii?Q?/A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f65d90b-9d40-428a-0e36-08db5694f5e3
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2023 05:09:58.5282 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wSu8bzw60Qkohg+/dDPT2BTYkWxLjNgMqnjmh/7Kx34eWgirB7z56WP0hLzbcUpZ2wS6pLY1EmAU82t3AmvwKPvYhfhaRdSD7hpG6aqrUPM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6233
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 10/26] drm/xe: Drop vram_id
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

On Wed, May 10, 2023 at 08:47:06PM -0700, Matt Roper wrote:
>The VRAM ID is always the tile ID; there's no need to track it
>separately within a GT.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

with the move to be tile-based, with the hope it stays like this for
future platforms

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/tests/xe_bo.c | 6 +++---
> drivers/gpu/drm/xe/xe_pci.c      | 2 --
> 2 files changed, 3 insertions(+), 5 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
>index bee5a2031153..e4d1d17b1d3c 100644
>--- a/drivers/gpu/drm/xe/tests/xe_bo.c
>+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
>@@ -115,9 +115,9 @@ static void ccs_test_run_gt(struct xe_device *xe, struct xe_gt *gt,
> 	int ret;
>
> 	/* TODO: Sanity check */
>-	vram_bit = XE_BO_CREATE_VRAM0_BIT << gt->info.vram_id;
>+	vram_bit = XE_BO_CREATE_VRAM0_BIT << gt_to_tile(gt)->id;
> 	kunit_info(test, "Testing gt id %u vram id %u\n", gt->info.id,
>-		   gt->info.vram_id);
>+		   gt_to_tile(gt)->id);
>
> 	bo = xe_bo_create_locked(xe, NULL, NULL, SZ_1M, ttm_bo_type_device,
> 				 vram_bit);
>@@ -179,7 +179,7 @@ static int evict_test_run_gt(struct xe_device *xe, struct xe_gt *gt, struct kuni
> 	int err, i;
>
> 	kunit_info(test, "Testing device %s gt id %u vram id %u\n",
>-		   dev_name(xe->drm.dev), gt->info.id, gt->info.vram_id);
>+		   dev_name(xe->drm.dev), gt->info.id, gt_to_tile(gt)->id);
>
> 	for (i = 0; i < 2; ++i) {
> 		xe_vm_lock(vm, &ww, 0, false);
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index be7c41024838..0f3508c72c79 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -34,7 +34,6 @@ struct xe_subplatform_desc {
>
> struct xe_gt_desc {
> 	enum xe_gt_type type;
>-	u8 vram_id;
> 	u32 mmio_adj_limit;
> 	u32 mmio_adj_offset;
> };
>@@ -258,7 +257,6 @@ static const struct xe_device_desc dg2_desc = {
> static const struct xe_gt_desc pvc_gts[] = {
> 	{
> 		.type = XE_GT_TYPE_REMOTE,
>-		.vram_id = 1,
> 		.mmio_adj_limit = 0,
> 		.mmio_adj_offset = 0,
> 	},
>-- 
>2.40.0
>
