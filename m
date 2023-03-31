Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E97AC76196
	for <intel-xe@archiver.kernel.org>; Fri, 31 Mar 2023 20:14:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B921010E1E3;
	Fri, 31 Mar 2023 20:14:36 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE56210E0E5
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Mar 2023 20:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680293672; x=1711829672;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zqA+AZmu/kwKN/ujf6h1gnTcAf7Rz4/nk4FZEdKhfsU=;
 b=ghy/E7WOa3l8489ub4klq0vTHbnnXfx+I0BNUDQarEliotQba+HEmwUp
 LhdXu6lOph8vXcZsInZ817NXFOnmYAJM6HKn3ycnJ/xT6uYjHb8nDYzhn
 Ck+z4hno90tZeqa9VEM8SNmDfpT5dS6pOYnn4FoWyavUdGUiMc/1QrMcw
 VCn9PJ2SW2+5qkgRkPhfRkvMMvzmnX3yP5mCEhYxRgSOo2q+pjyHW9cUz
 ueuoDqu2+VP0UBBTrwUHv9G2pJDy8xi8ri8vlviWZV76Al3fyyqMbjQNm
 IKLf7EgR1+pvGvHFSt/LwllGlmPTN6XKu4LrNHuwlfcTK9f2QCVVTVgUq A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="340278733"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; d="scan'208";a="340278733"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 13:14:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="687798100"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; d="scan'208";a="687798100"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga007.fm.intel.com with ESMTP; 31 Mar 2023 13:14:22 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 31 Mar 2023 13:14:22 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 31 Mar 2023 13:14:21 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 31 Mar 2023 13:14:21 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 31 Mar 2023 13:14:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BWgdiOIvIQRLZGtUysQoXWyxrkN+xApeFQTiw7ClBzKFnnBRU82mKY0s2SnKVT4VGUqnKGn1cH/JDAQfFTNSGIUHW+a0YjleFLyEVsenJDSRPjQsPEJQbLhn0054PK6S4UxypSKEQZDzcqlP7H92oOMJGgwvc++Gjhs8hT7ir6/ze6Sl09W506LN5U9YNzRJsOXVWWFKy8doeBMFcGIMdVlQvfZfs7u/DUO6YtWda9V8g+FLr72oEiQ1MplmFBGqxHC589xdbq8B6kBYe0uf3hXz2xqLV/reWkpD35dopdHxjQCCe98bMsbVYZs59nghAg8UxDanDMROHBiFA9pqyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D7Wyb1IBNiGPkYOVoWHjooxdfKbWPiE9qGvFzjmIdko=;
 b=SBem9vYgNIrvjck3MjOiQY6gHmBEIRJtJYnBPek+vgidx/0dOq2GnldzYq65C+2GI0mQ11y11WXGR+H6VqpZysCgayZGzvEAVEatUXnXgVRmPt2nzNwCdHKVM5tOE0XGhZYXObFXh98ApLZdOjFeP96wOt1Nsta/AbbuKpR4zLnBTiazO9vFTtC0neGH5dQYxUAL0t2u4Yj9ht1zYAMYcAuCTcapL2LaDmZQi1PUUJK++JzG10p78ScNgt4qou/wlARBKVDt4B2ekehoJWGg/377Xw7faI7UnsOCHLpyqIeVrH1JJSLxbxh5tFgJQJ8lyoxBhuQ9k3Wyf04Bsp+37w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB6470.namprd11.prod.outlook.com (2603:10b6:8:c2::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6254.23; Fri, 31 Mar 2023 20:14:18 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%5]) with mapi id 15.20.6254.022; Fri, 31 Mar 2023
 20:14:18 +0000
Date: Fri, 31 Mar 2023 13:14:15 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <20230331201415.gdlb7xmjpae5ybbb@ldmartin-desk2.lan>
References: <20230329173334.4015124-1-matthew.d.roper@intel.com>
 <20230329173334.4015124-2-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230329173334.4015124-2-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0PR03CA0094.namprd03.prod.outlook.com
 (2603:10b6:a03:333::9) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB6470:EE_
X-MS-Office365-Filtering-Correlation-Id: dafaa9b0-7465-44f7-f2e2-08db322481b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k2tp/yvuXvWT5QuHQho7fiXl0Ch2gvrtggnmZEAQqAMToYEzj94AhjvsObzAM4rZfDIT9nbjxGo6Yq9i2pkQmy12hu+OlwlpEtQu9c8GoCMdomL6xV1Raz3Fs94Xpn/epAV4yBIkNpGXb3HJEbbSwKx3KTvJem39chBUwlKN1llJmR6HQD84bcf8aGvAtZdTbwc+ZeU6yQGY6my9QoPfbfUXlt67kT//MpY7KYMla64RTUSk6o1Cqd92IKIr/HpHhEbfpcDYVaSSL6ApTPoRH6rmZrZNK6F0DAKVN7dMvKVnoSoUkMjpadwdqV3BOQ8s6+vYYVdNtPLJa+w5RIg9sTxDegnsz/o/FbLoctyqMBMO5gzPGybNhkhyFyYHsGnfMXIVith/aiGzjwNCRyv264+p3ra5ITgADMIaL480weoNj5ViNBoUIbVBRbqzUV9w9UtvJRa5z0sw1VXTI0CvrY8Zj86s7Wz5KbZUAo3cUuKITVnyb+G0S7qHIA8hOHL3h7ec8e4ueZkOjekDNZf1HXIYdokSfDd6P+OlRc091NvlcbLdXdi170dcuaFfjWhQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(346002)(136003)(39860400002)(376002)(396003)(451199021)(6512007)(1076003)(26005)(9686003)(6506007)(6666004)(83380400001)(186003)(66476007)(66946007)(4326008)(66556008)(2906002)(5660300002)(8676002)(82960400001)(41300700001)(478600001)(316002)(86362001)(38100700002)(6636002)(6862004)(6486002)(8936002)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RMwMKpTD0ep7YOFuYP1B0WQeS+cD+AjH2WZvylmKOuc2uJKWzOJ/8sz882V7?=
 =?us-ascii?Q?tZqoX8oFe8Zh1l6Ki7GwkaU8Hs1XmIFSOx9X7KmwuxDlN4dpN5yRaj66yg87?=
 =?us-ascii?Q?NKPRwUC8YNuh8jBt8OdA3hfyjBS7Fe+i2IG2NuWTEBCaFg2VPeNtG21DuQCb?=
 =?us-ascii?Q?VaSlTeWLU9QciGx8L+iCU+ZoLSdHkhAvsCqBesfRV6/T8RW9SykrdvdkzPj3?=
 =?us-ascii?Q?w/OJISPuCgZbhFU4imlJ1yuXSFTQCzkQ8rUMbMm+GvL5w9B21smIquJn9P7y?=
 =?us-ascii?Q?KQ4C6LfH4XICj6rOeDrpy4oZ4QR/q3xpW3YaKou1qw5ugHT39WGTm+GM0jnD?=
 =?us-ascii?Q?/w0kHGzkYk8Z9Jy41JganU2sZZ4aO3LcjVbNnY+7PWqZR3Dg/M35tjNh5JJ1?=
 =?us-ascii?Q?atmdEFSmEwDcY13aZPTBHQLaIS79tE0Vjwh0jKOATgm4T+Oke6GRVlUuycBL?=
 =?us-ascii?Q?Dd1Ld0xhECgVxRxPcEiZkMk5LdD2Nv5wbTkp3g9AvSw8gKs86JEAodJP8tON?=
 =?us-ascii?Q?6ZZ+JdOFFqRCp834M1YyoTLE2BDFzOAAx9N7RXU8tBXVS7fMnX/QME1sYJcY?=
 =?us-ascii?Q?ju+amf6DD9RW/4jIFyrhcQ/i4GVvLeYjoJffT7fNgK60HH4fgA4GLo1rdd8n?=
 =?us-ascii?Q?Px/alGaGVxi14oofNPKE4ioJ95NZiuRENuIZ+HXvWv+zzAZnqmX087PStw1F?=
 =?us-ascii?Q?yjRVn7DCBZN6EsDEpxKPRraRQ3XfHIc3DXGtJBLnVsHFuIa4ZlMKwSB3q32V?=
 =?us-ascii?Q?QX5urhopYaFXhGYqFo7iwNmZxB6/6Fb8H+yKegFkHmPIGvaXXoXfLQU5naZi?=
 =?us-ascii?Q?Pjkbg6FTMzevdYfzZ8nAdaTmvQ43MmadzdqwfPABQusYlmktRvwcOtC2hoSM?=
 =?us-ascii?Q?SExr/7KFXzbxRdZj8yf4pYPZV23ry1IsIvoSADo4mgC4o+Gg9WECKqgwJ5K+?=
 =?us-ascii?Q?6KLdvS8lgVYTP//HEw/4BE3+FygDndh1J3WZIQdOOiawK+m6DWy9gPKrgPN+?=
 =?us-ascii?Q?T8HcTag+6LcZKUs7utReC7MfwQQnEtdy7WHMI/MSvwkRdFxttHlXuJRIFFPR?=
 =?us-ascii?Q?g1qYdHejFaIkkQ/nexFyHTTvu5PWgaw9drImCxHJhORoDTo0h2cbY88m1viD?=
 =?us-ascii?Q?KSDhITNahd/rhs+ye6hS92MFb9cQQkKkcKyVvktNZkA60sS/7r37rJt8osqJ?=
 =?us-ascii?Q?Vw4Bpvwz9ELpNzr7nYlN6cmDCEWFga000v73MvgcMkI9NQ5aam6PBg2xY0r1?=
 =?us-ascii?Q?DSvLbj3Dx2PEVkaoHuNllnFjthlUO1uaFfBmSW1PD/hJrP8ERgFPbjX5nPYV?=
 =?us-ascii?Q?XTxXqe0zTFR0Cu9f+Sy27TlqPU8rZt4/j/SXCnT9LelM2Urr21dj9PMs7brm?=
 =?us-ascii?Q?Zsl5M1P/S/sbHC84ZRTltX0Dvbd6nZJabb890Xakj/XnwOQXBPmJ7Xahvyqc?=
 =?us-ascii?Q?01foXupvhZsflSmGIxFpeJs8v1RWgryNJja7X9cVuVKWN1s2otUrOhVh73EP?=
 =?us-ascii?Q?0NMTB2iZ0CmIRdPq/jitIKhbd2OVcN6SbgVr9VrRrxUD8FEW/eMHmRpXX9IY?=
 =?us-ascii?Q?xUC5Gy7gvOOF63QfKNRexrWZlyyPLVXuKyEFjhkx+cKWTLd25jUjusILrhB4?=
 =?us-ascii?Q?AA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dafaa9b0-7465-44f7-f2e2-08db322481b9
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2023 20:14:18.3596 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fWXSn2Am8/StTdf3zp10xTSLsKZrhS3/ugDNOz/vsYBb+Z/X4MTOeQwMR+WqWpIlLbu2SQtaGIC24K2mt+xYmyJldKrrKq6iJp2hTWuc7Ro=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6470
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/3] drm/xe: Include hardware prefetch buffer
 in batchbuffer allocations
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

On Wed, Mar 29, 2023 at 10:33:32AM -0700, Matt Roper wrote:
>The hardware prefetches several cachelines of data from batchbuffers
>before they are parsed.  This prefetching only stops when the parser
>encounters an MI_BATCH_BUFFER_END instruction (or a nested
>MI_BATCH_BUFFER_START), so we must ensure that there is enough padding
>at the end of the batchbuffer to prevent the prefetcher from running
>past the end of the allocation and potentially faulting.
>
>Bspec: 45717
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/xe_bb.c | 25 +++++++++++++++++++++++--
> 1 file changed, 23 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
>index 5b24018e2a80..f326f117ba3b 100644
>--- a/drivers/gpu/drm/xe/xe_bb.c
>+++ b/drivers/gpu/drm/xe/xe_bb.c
>@@ -8,11 +8,26 @@
> #include "regs/xe_gpu_commands.h"
> #include "xe_device.h"
> #include "xe_engine_types.h"
>+#include "xe_gt.h"
> #include "xe_hw_fence.h"
> #include "xe_sa.h"
> #include "xe_sched_job.h"
> #include "xe_vm_types.h"
>
>+static int bb_prefetch(struct xe_gt *gt)
>+{
>+	struct xe_device *xe = gt->xe;
>+
>+	if (GRAPHICS_VERx100(xe) >= 1250 && !xe_gt_is_media_type(gt))
>+		/*
>+		 * RCS and CCS require 1K, although other engines would be
>+		 * okay with 512.
>+		 */
>+		return SZ_1K;
>+	else
>+		return SZ_512;
>+}
>+
> struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 dwords, bool usm)
> {
> 	struct xe_bb *bb = kmalloc(sizeof(*bb), GFP_KERNEL);
>@@ -21,8 +36,14 @@ struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 dwords, bool usm)
> 	if (!bb)
> 		return ERR_PTR(-ENOMEM);
>
>-	bb->bo = xe_sa_bo_new(!usm ? &gt->kernel_bb_pool :
>-			      &gt->usm.bb_pool, 4 * dwords + 4);
>+	/*
>+	 * We need to allocate space for the requested number of dwords,
>+	 * one additional MI_BATCH_BUFFER_END dword, and additional buffer
>+	 * space to accomodate the platform-specific hardware prefetch
>+	 * requirements.
>+	 */
>+	bb->bo = xe_sa_bo_new(!usm ? &gt->kernel_bb_pool : &gt->usm.bb_pool,
>+			      4 * (dwords + 1) + bb_prefetch(gt));

if the command buffer for the CS is 512 or 1024, wouldn't it be
sufficient to just align the end rather than increase it by that?

Lucas De Marchi
