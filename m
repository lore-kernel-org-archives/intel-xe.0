Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83687C4332F
	for <intel-xe@archiver.kernel.org>; Tue, 12 Dec 2023 18:30:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AF518989C;
	Tue, 12 Dec 2023 18:30:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E27A10E1FD
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Dec 2023 18:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702405848; x=1733941848;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=z6DxJan5MA7yHHDeWDGdvaRwK9+DSfLK4P3jbB/Lj0A=;
 b=esR3Lqhqt7CT7CoYq+qLF/bOdFZ35QZ8wv1hntPLI6AqeOPlEyFBcNf9
 U7975fpFqKmQ0bayNBUUhEQwHR+5ut5n+TaS2bl7Kw3DYCKHEDV3v7PQL
 SXI6wPjvM8HDl9rXYBUbgezAcbdswk7UP1LRu52qqIcvTVHGSyeJvwRte
 MBPfYN47Q9FRVXTqfEe72hz+7dPd36tLELC9ORbi+78F34nq0CJ2L1ol+
 WcYP3MwRXrpmNo+iBDv8BTUUaGsW9Pps962MKRlf2Api9xdz/5nNMmGhZ
 Hd6q8lps+BtycNYRUYWXVEF3+kTitRjN3h/f8RXmY0+4gWh8yrYMYCMmW A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="425970790"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; d="scan'208";a="425970790"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2023 10:30:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="749809549"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; d="scan'208";a="749809549"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Dec 2023 10:30:48 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Dec 2023 10:30:47 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Dec 2023 10:30:47 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 12 Dec 2023 10:30:47 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 12 Dec 2023 10:30:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QIke89KQBt0oLHBIpNknd/rOrD7mw7I11df672wp6KhstpOIFucyklvrSO8zqnKXA8xtURVX8ggmW7O4YGvwerGuvCuu5i6w9LGKs0z89pzGj5HtgYvfFeuQ8Xhm1zD2G9u0UryLs3l7rJDV7KSL0pbB/auLzjYJAfze7xihq8BsyXTV1GiNTJuO7VfoaTTacrPVWF69onCv/y5qF/s51NSC23Hz1Y26mrGk9jNRSdYGaIHqc/iQvG2Pzjg/is5/VNsP2IVPyp+rljKVQYGNJz4aw7jGUv5OssCBOpBFGRJv/uXOQGTqOpXO9fJOcdMBm0Q3qX7fZkpcoLcBMsWj0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D4MvnG1Tx/I9hVPcr1VGiS54KOr8jN8yd6VsVgToeJQ=;
 b=UAwPta4LepcRnYuxi+Hj9Qj+vRozl6crBtHSqJ4MR2AEf633PC6gLD3y2w2Z8XDDyqEWn5g+Z143aWtxgacLuk8BMxd6uW8q6n6AimoTJV91dSbE8byf9niKaA8291P5HV+2qpVtBS2uwxZL3Jhr7uDnAVsnd7+oFbH2yv05OOGU8be3T3tj1pMdlJTsQCheTiNKoK5GNdj5s/n78m4vp4YB37iLC73WkVkO7svrD778oscWRCxTWgCH8fuULRPtDh84qpzWNItvZEcuMwi/QS9Atw0+ymtEs2qa5oYw3+Y07xIvQhr3u0/gHX7SUqCLE+4bCv0x+q1RWAZqURdkQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by DS7PR11MB7689.namprd11.prod.outlook.com (2603:10b6:8:e2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33; Tue, 12 Dec
 2023 18:30:44 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::787c:c5fe:c197:443c]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::787c:c5fe:c197:443c%7]) with mapi id 15.20.7091.022; Tue, 12 Dec 2023
 18:30:44 +0000
Date: Tue, 12 Dec 2023 10:30:37 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH] drm/xe: Cleanup CCS mode related code
Message-ID: <ZXimzZ0wEYIHjscM@nvishwa1-DESK>
References: <20231208205424.29759-1-niranjana.vishwanathapura@intel.com>
 <ijrhmjdehox4awe2n4gndmhqmreed2mqqb4juk6cnq36fywixy@pdjfuzdkkpy3>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ijrhmjdehox4awe2n4gndmhqmreed2mqqb4juk6cnq36fywixy@pdjfuzdkkpy3>
X-ClientProxiedBy: BYAPR07CA0053.namprd07.prod.outlook.com
 (2603:10b6:a03:60::30) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|DS7PR11MB7689:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cf3e8d0-7b6c-4391-6f9a-08dbfb4073a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YbfJs19NFrH8dhTVXOVCEPxuNEtJlG+09A3zygauORttvgs+iWAscQHlhlH0ODRhdjjGS83FDGXnQH8FDGxrjgsh/hxIRqBiaYRXr7j5YB9RPvfbZjUyOXeVe+ViJPIzzWKHtopfnYSPjAdivfCn1yUcuihwVB+nS3hmORdscCkYca97Imrq1BrAbpByuBJVVCqSH9wxVUuWgtwAyJ5eQnHw1VtKZT+JeNuBkVdiCt1f39tBiD92EYYaVEN/zONJuoXWSMGVaB2b+3nniNWUbZq6/0v1guwNXzTfLHfZNBFqNBmq9nj9WClep4QDoVQprmICHYbbmd+TSFWqX+RRuJhZnaxMEesdklANmSnaY91HUzTP8ZesJqRe2Ay1wmFfnKQwhMZqCS5piytMiTbVa9INyjBJo66i+VKThpeVq/tQmQFopz77oSWcrxwf//NE1QxfhN2IHN2kj2/0g/KMUi0S+A5DCTmGnREFPxqnaqxLF3Q5YkOdeHJEMtowSoWns1PyqxYqekyhu3RiCO4KrEdSLK5ece+YSNAS0U1Gr3zZq5G9DSG2yrMRzjt6RUvS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(39860400002)(366004)(396003)(346002)(136003)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(41300700001)(2906002)(5660300002)(44832011)(86362001)(33716001)(6506007)(9686003)(6512007)(83380400001)(82960400001)(26005)(6666004)(6486002)(478600001)(38100700002)(316002)(66946007)(66556008)(66476007)(6636002)(8676002)(8936002)(6862004)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3Z0aPU8QlThjay1SqPM9iDGmKwba55ycAWmjJoz7tqJidBoxZuZBBOMJeuS6?=
 =?us-ascii?Q?vnAM1LFUQkO5MP88CNKNG0q/7Pf/G8VQVO+dz55sMWSKEmiyaLdK4Jr7Gl3Z?=
 =?us-ascii?Q?EM7YOGqmYfa7xJAV+7Q1gKAWHBfFtY9D40b80WHjS834apkLanJTHgVdfjSO?=
 =?us-ascii?Q?fGoxHtbcURG2YqI9wkf2Tf3ZXGAHozKN90c+d8EoBhnHPq/cB480yRIfeEQz?=
 =?us-ascii?Q?vFCY9ClM+t0MsWC/37VlcBSmzPZ3PAdxxVyk+3eQw8UaiJRY6EwbvB522ltQ?=
 =?us-ascii?Q?XyEllGUvxYXdMy8J8G/CeItAl2TI1DWbVB9i4PRKjgKzO+RkGCBkP0y5Ae1X?=
 =?us-ascii?Q?AqS65eFpKYO3jyNZtmnvXtD8d/u2/ErX0m58bH563xc/+reDb/G85aC6g8G8?=
 =?us-ascii?Q?Czp0zfXpEeN3mJsC+sRuqgiM3nGFNqXa/i8ik1zOxtjn9/snEQ0jeI+jXf5h?=
 =?us-ascii?Q?aACAekddpwuZpZ/SuAYyziI5QfxqFTE0l9vVuSCJ5e8mV+8keDq5cqIqPS5+?=
 =?us-ascii?Q?zBI7/2aGvKdWzuqF9uZjV2nU1/mlTdRM/NjJCZ/XElJr71x2WaSce6vvhauF?=
 =?us-ascii?Q?B8FK4AZpO7MdMg3YTIsxL0DvedehPMT1hrBr0lnmwsjIpl5edHizWRRhEnKM?=
 =?us-ascii?Q?jEW2TXbug83Xg+0Cb7u2QTq39kP1+fLtQZzNOZSrPQ3tLNIJmwmB4MtvME8C?=
 =?us-ascii?Q?cXBmaSc95GQbnbG1Ev+Ij0ytaIEgu/mdWYDxMs0viOReZAb2tE2c125V1ORL?=
 =?us-ascii?Q?E7VQWyHOYaCSnR4dJBO/HokieBr7E0ji3rg/2jxlZRMFztinA2WpmNchYTpI?=
 =?us-ascii?Q?eHeDYsflS5VJBbB5Y7BHChZpLFhtxcn3BnFrLWTjOTcG/SL8as3YzgzCx0U7?=
 =?us-ascii?Q?fV7i9rX+AI2GR6+6rXeoXZoBxOoO2i1zuENzXynZBxTxAog6T/g3qUlulw+X?=
 =?us-ascii?Q?tcWkzSM4l9mPTZrT8TlEiyfr2EGDQrMBFlSAwG0grcV1gm8yAu1JLzWZmEGH?=
 =?us-ascii?Q?Ie75ZrniJHUP+4BkHexigHBGpJZaDAi2IsnMvz5hOhfx1ku9a3JoIYWYsgv/?=
 =?us-ascii?Q?5ApToOV8vGjbSXU1bjoKKeKDimA8uNFuKS//GQ+nTmiS9xjNj5N3NmnbBkMG?=
 =?us-ascii?Q?g8FZjPRToYO9T0R35VY0wXbpFp9x+Yp95SuUBMGBnRG7WxDHw9O4MEtv+VVG?=
 =?us-ascii?Q?NlZzMkDMobXAoiS+ZicyO2naobvn3EDQ1aC7sY2qmkgTeXCjhNp8y4/du2BM?=
 =?us-ascii?Q?u4Pb5HV4YLdoMr0g70+efDJRTzVa/EUdj7WeLheBFt3o4hF2DXyLinoWR/b1?=
 =?us-ascii?Q?eElF2LTJx0Zcl5GqdIZ94pya3H/5JCTuGzm07Ixx4zG7lL26i+GyVVB41yj2?=
 =?us-ascii?Q?+S5ngU9qetTcDxBMlqzq2YbmRXErVET+C7guXHyC02gTlyrwYWI/fzyyjh6O?=
 =?us-ascii?Q?ft013MEWpWoke270pPm7kRE8mrBdrXJyq8HJkrGUtI2LoNty6TXVK3+4YnxY?=
 =?us-ascii?Q?ruTuh9fYVlbRGHAX0R4ZGwUrVsBxLoAe9oKYLGjju2jDfZ2deNBM0B0xA6eP?=
 =?us-ascii?Q?rBks6O3fTyPMpUH9fafDvdR7OMrDNQBRN6dyuoTh54hA1ps6VqsV3TVIEGua?=
 =?us-ascii?Q?HQ+8CLD2tjXW6WRTE3xN8tQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cf3e8d0-7b6c-4391-6f9a-08dbfb4073a3
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2023 18:30:44.1588 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y5Od3/y5KC0xyEoY5X2KNr+9sttSZDUUA3crY4cIWiaP6/iHfd3Fxk21KBkZnwd/Yn/d7g60Xf5zEgdmWrn4kfQVMKUnZUDIu+axMes/hxHK5/wQqdnBqWuV/l2JIDDf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7689
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Dec 12, 2023 at 08:00:11AM -0600, Lucas De Marchi wrote:
>On Fri, Dec 08, 2023 at 12:54:24PM -0800, Niranjana Vishwanathapura wrote:
>>Refactor some of the CCS mode related code to make it compliant
>>with the coding guidelines.
>>
>>Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>>---
>>drivers/gpu/drm/xe/regs/xe_gt_regs.h | 13 ++-----------
>>drivers/gpu/drm/xe/xe_gt.c           |  4 ++--
>>drivers/gpu/drm/xe/xe_gt.h           |  2 --
>>drivers/gpu/drm/xe/xe_gt_ccs_mode.c  | 23 +++++++++++------------
>>drivers/gpu/drm/xe/xe_gt_ccs_mode.h  |  7 +++----
>>5 files changed, 18 insertions(+), 31 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>index 5f5a72e9d0d8..cb9a1a34c2e5 100644
>>--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>@@ -405,18 +405,9 @@
>>#define   RCU_MODE_FIXED_SLICE_CCS_MODE		REG_BIT(1)
>>#define   RCU_MODE_CCS_ENABLE			REG_BIT(0)
>>
>>-/*
>>- * Total of 4 cslices, where each cslice is in the form:
>>- *   [0-3]     CCS ID
>>- *   [4-6]     RSVD
>>- *   [7]       Disabled
>>- */
>>#define CCS_MODE				XE_REG(0x14804)
>>-#define   CCS_MODE_CSLICE_0_3_MASK		REG_GENMASK(11, 0) /* 3 bits per cslice */
>>-#define   CCS_MODE_CSLICE_MASK			0x7 /* CCS0-3 + rsvd */
>>-#define   CCS_MODE_CSLICE_WIDTH			ilog2(CCS_MODE_CSLICE_MASK + 1)
>>-#define   CCS_MODE_CSLICE(cslice, ccs) \
>>-	((ccs) << ((cslice) * CCS_MODE_CSLICE_WIDTH))
>>+#define   CCS_MODE_CSLICE_0_3_MASK		REG_GENMASK(11, 0)
>
>
>>+#define   CCS_MODE_CSLICE_0_MASK		REG_GENMASK(2, 0)
>
>from the symbol name in bspec, this still looks odd, but definitely
>better than before. From the symbol name, it would had been something
>like
>
>CCS_MODE_CSLICE_ASSIGNMENT
>

Ok, will fix.
Will also remove CCS_MODE_CSLICE_0_3_MASK and instead get this info from
gt->info.__engine_mask. That way, it will be truely platform independent.

>>
>>#define FORCEWAKE_ACK_GT			XE_REG(0x130044)
>>#define   FORCEWAKE_KERNEL			BIT(0)
>>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>>index dfd9cf01a5d5..523942cd1157 100644
>>--- a/drivers/gpu/drm/xe/xe_gt.c
>>+++ b/drivers/gpu/drm/xe/xe_gt.c
>>@@ -462,7 +462,7 @@ static int all_fw_domain_init(struct xe_gt *gt)
>>	/* Configure default CCS mode of 1 engine with all resources */
>>	if (xe_gt_ccs_mode_enabled(gt)) {
>>		gt->ccs_mode = 1;
>>-		xe_gt_apply_ccs_mode(gt);
>>+		xe_gt_ccs_mode_apply(gt);
>>	}
>>
>>	if (IS_SRIOV_PF(gt_to_xe(gt)) && !xe_gt_is_media_type(gt))
>>@@ -584,7 +584,7 @@ static int do_gt_restart(struct xe_gt *gt)
>>	}
>>
>>	/* Get CCS mode in sync between sw/hw */
>>-	xe_gt_apply_ccs_mode(gt);
>>+	xe_gt_ccs_mode_apply(gt);
>>
>>	return 0;
>>}
>>diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
>>index f3c780bd266d..11265e851a81 100644
>>--- a/drivers/gpu/drm/xe/xe_gt.h
>>+++ b/drivers/gpu/drm/xe/xe_gt.h
>>@@ -17,8 +17,6 @@
>>		for_each_if(((hwe__) = (gt__)->hw_engines + (id__)) && \
>>			  xe_hw_engine_is_valid((hwe__)))
>>
>>-#define CCS_MASK(gt) (((gt)->info.engine_mask & XE_HW_ENGINE_CCS_MASK) >> XE_HW_ENGINE_CCS0)
>>-
>>#ifdef CONFIG_FAULT_INJECTION
>>extern struct fault_attr gt_reset_failure;
>>static inline bool xe_fault_inject_gt_reset(void)
>>diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>>index 529fc286cd06..7e847c8eab32 100644
>>--- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>>+++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>>@@ -12,17 +12,24 @@
>>#include "xe_gt_sysfs.h"
>>#include "xe_mmio.h"
>>
>>-static void __xe_gt_apply_ccs_mode(struct xe_gt *gt, u32 num_engines)
>>+#define CCS_MODE_CSLICE_WIDTH		ilog2(CCS_MODE_CSLICE_0_MASK + 1)
>>+#define CCS_MODE_CSLICE(cslice, ccs)	\
>>+	((ccs) << ((cslice) * CCS_MODE_CSLICE_WIDTH))
>>+
>>+void xe_gt_ccs_mode_apply(struct xe_gt *gt)
>>{
>>	u32 mode = CCS_MODE_CSLICE_0_3_MASK; /* disable all by default */
>>	int num_slices = hweight32(CCS_MASK(gt));
>
>we have cslice and we have gslice. This is cslice. Anyway, this CCS_MASK
>seems to be leaking information from the more appropriate place.
>

Ok, will rename to num_cslices.
We need to read from gt->info.engine_mask to get num_cslices and to see
which cslice is fused off. Ok, will try to contain it within .c files
and remove it form .h file.

>>	struct xe_device *xe = gt_to_xe(gt);
>>+	u32 num_engines = gt->ccs_mode;
>>	int width, cslice = 0;
>>	u32 config = 0;
>>
>>-	xe_assert(xe, xe_gt_ccs_mode_enabled(gt));
>>+	if (!num_engines)
>>+		return;
>>
>>-	xe_assert(xe, num_engines && num_engines <= num_slices);
>>+	xe_assert(xe, xe_gt_ccs_mode_enabled(gt));
>>+	xe_assert(xe, num_engines <= num_slices);
>>	xe_assert(xe, !(num_slices % num_engines));
>>
>>	/*
>>@@ -60,7 +67,7 @@ static void __xe_gt_apply_ccs_mode(struct xe_gt *gt, u32 num_engines)
>>			while ((CCS_MASK(gt) & BIT(cslice)) == 0)
>>				cslice++;
>>
>>-			mode &= ~CCS_MODE_CSLICE(cslice, CCS_MODE_CSLICE_MASK);
>>+			mode &= ~CCS_MODE_CSLICE(cslice, CCS_MODE_CSLICE_0_MASK);
>>			mode |= CCS_MODE_CSLICE(cslice, hwe->instance);
>>			cslice++;
>>		}
>>@@ -72,14 +79,6 @@ static void __xe_gt_apply_ccs_mode(struct xe_gt *gt, u32 num_engines)
>>		   mode, config, num_engines, num_slices);
>>}
>>
>>-void xe_gt_apply_ccs_mode(struct xe_gt *gt)
>>-{
>>-	if (!gt->ccs_mode)
>>-		return;
>>-
>>-	__xe_gt_apply_ccs_mode(gt, gt->ccs_mode);
>>-}
>>-
>>static ssize_t
>>num_cslices_show(struct device *kdev,
>>		 struct device_attribute *attr, char *buf)
>>diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.h b/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
>>index f39975aaaab0..1d9d5f0bd222 100644
>>--- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
>>+++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
>>@@ -6,12 +6,11 @@
>>#ifndef _XE_GT_CCS_MODE_H_
>>#define _XE_GT_CCS_MODE_H_
>>
>>-#include "xe_device_types.h"
>>-#include "xe_gt.h"
>>#include "xe_gt_types.h"
>>-#include "xe_platform_types.h"
>>
>>-void xe_gt_apply_ccs_mode(struct xe_gt *gt);
>>+#define CCS_MASK(gt) (((gt)->info.engine_mask & XE_HW_ENGINE_CCS_MASK) >> XE_HW_ENGINE_CCS0)
>
>I think the logic can be reworked slight so it doesn't need this.
>If keeping it, please contain it to the only user. We don't want other
>parts of the code to include xe_gt_ccs_mode.h to use this completely
>unrelated macro.
>

We need to read from gt->info.engine_mask for above mentioned reasons.
Adding it here as the xe_gt_ccs_mode_enabled() function below needs it.
Ok, will move this function and the macro xe_gt_ccs_mode.c file.

Niranjana

>Lucas De Marchi
>
>>+
>>+void xe_gt_ccs_mode_apply(struct xe_gt *gt);
>>void xe_gt_ccs_mode_sysfs_init(struct xe_gt *gt);
>>
>>static inline bool xe_gt_ccs_mode_enabled(const struct xe_gt *gt)
>>-- 
>>2.43.0
>>
