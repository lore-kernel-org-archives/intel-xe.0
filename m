Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F57DC531DC
	for <intel-xe@archiver.kernel.org>; Fri, 16 Aug 2024 15:03:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0140B10E7E4;
	Fri, 16 Aug 2024 15:03:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i3rV2EZ5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C532F10E7E7
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Aug 2024 15:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723820593; x=1755356593;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=040j/YrP3A676ui0cKzCLVpHepUU3kYPFVSLx1AboJI=;
 b=i3rV2EZ54LijedetFA5VW7ZN4zlagUya01nxkbgb+eh+IXmR1IFEN7jA
 10jNjG9Lef9RBQzsafUxP3+VS/ueNHt/6CTum4YHnD+wp21G7XcPayEzt
 21/9rlNd4/7+gKHJHSqrSw//ujG+Gyecu5Kcb+jBgsVhPp8s0e4uCe0OI
 1VH+PYig6MQRB9e/yufl1ADuEB9sh5DczTscvmfP+fp2WEeHL97Ba+sHc
 6mvFLalbtu4bATspxlTVP8fQOmz6mveuJ6GcUhVj7Lrnx7iUXewWhdfhe
 FUzqwpyArI5oGhBTWZ2vg2mI41fCutaM0A/0pCniJsTmQWUpOgTtYfimQ w==;
X-CSE-ConnectionGUID: yCbY6PSmTUyJko9E7ImN/g==
X-CSE-MsgGUID: fCgDgCQ8T0+Rek9K4haF8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="33269040"
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; d="scan'208";a="33269040"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 08:03:13 -0700
X-CSE-ConnectionGUID: LG8gqTgSTHaonlzyG0Xz6Q==
X-CSE-MsgGUID: nLhMGvh7Q2m3FkKE3DRslQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; d="scan'208";a="64360124"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Aug 2024 08:03:13 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 16 Aug 2024 08:03:12 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 16 Aug 2024 08:03:12 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 16 Aug 2024 08:03:12 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 16 Aug 2024 08:03:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U/LIa4TnhdkajkiDS4IIPjWKGoZrISKIETpRMg2nXLXTl+qlRh3ITFubKXAfxMwVXtdiL91Mh9t+WWRI7xvmTjtaTxlNKfxf3jnB+WfHtIyOqzpVdWYbqxnAdkaJtNzrKwdI5y/O+ZhhxrbIuwow3ZMI+ujhmA/JS5lNGDmLxyHqC4DbRCV3d2OSoz6bm32xKb+pVOEileODcozzLKB6fv3SrDTmLc71d1d/JfQ09L6Vb3W1xG6B1yj58RCFgPXE05oajJnOKs04j8JUQXeXL9Y9cVcmfvcMPB6g5pUoXLrKwkynt2qHfhqxFklfpdQvBluOsfO6OqDnYxcP/p2qrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jiY8MN8TKNHhQe2ZfMFjIlFBXWPTUYZFDvvha+c6E1U=;
 b=MHIpOzE96N7aLN6Csb3jxNwRGGObSSfFoXKtsbfyMOjoJQ4pjcxidAD7miErt2xJes7y+nGASndfA3xi8nU6MSyfRgSP+J/eH0Ad7sGVm9NwP0GvRNoaXIoyk3/6IZOsl9YNLgF5ClRkPs84iYevYkhjFgBfi1OBEbYtvFfCkhYgNeYbnbsg0Yu/yc/FuR6XoXNugB5vuDOh+esynqpBSrzKOtIl9bg6LsvB00fjXRaHZ2Jg50tOdOWFJ4NbVuHnDFQFHh7Myj+9wKGWAV7kJYxsemNbj4mOWr/QlwfYQs4sIQvn9916OVRvWyS8hTJ2k74q5xLoKKJ2k+7Ls8+T2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by LV3PR11MB8554.namprd11.prod.outlook.com (2603:10b6:408:1bb::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.33; Fri, 16 Aug
 2024 15:03:08 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7828.023; Fri, 16 Aug 2024
 15:03:08 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <lucas.demarchi@intel.com>, <jose.souza@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [PATCH 09/12] drm/xe: Introduce xe_ggtt_print_holes
Date: Fri, 16 Aug 2024 11:02:40 -0400
Message-ID: <20240816150243.87596-9-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240816150243.87596-1-rodrigo.vivi@intel.com>
References: <20240816150243.87596-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0230.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::25) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|LV3PR11MB8554:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e14e992-2937-4de7-be3f-08dcbe0489ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Dz6iTPSXqXSSfcb+rmtS1BvhV20lm3wKbtR5hcQpLv8G5YOamZHVX/hAjSeC?=
 =?us-ascii?Q?ifAVQYGcqaLkvmWw0B/mkij/FxRhI0KrudLlPUPbs0uQSaUReg2y/B1wC9+y?=
 =?us-ascii?Q?sF+25cHAJL8FEmc9hEl7FEpXurZScI/QPePd1EAy9/QYgpnGVZk81VIlgWO0?=
 =?us-ascii?Q?cON98w1Lt413+s7rr6wcLSId7ix/k+eje7E74MXdCjL7AnCiKZuab7fM03Pm?=
 =?us-ascii?Q?yEltV2qz0F1ojEJN5IXlzB07HdOUNIynXQf+AU2KCJV+K7eo1SAFdkNGqo8+?=
 =?us-ascii?Q?97fcXG5wGkpRIedOjMITaYwIhbMD3rKXs/m6rkANkfuzoDGe69w0BAijeBND?=
 =?us-ascii?Q?VdipbXk/W7pkonpGUq0vdqYudllQuo6CcMCMdUePTxfH7395EaTFuTq9OrXq?=
 =?us-ascii?Q?f2M6HjfGT+J2ufprE/JxvC9kf/+oDE94wFTCy4griQJbt0LU7qLpa6Jp7p4K?=
 =?us-ascii?Q?brfzo7PEKhn7HpBxVQEC4Wad2/8DH2nEfAiEi0llOAS50jsgxkifHdkEnFvD?=
 =?us-ascii?Q?5ThSlWRzTAjO0F436fGEAh4siE1EZicBdh6KigE/2Pyhm+U9mRQLAKoLUozO?=
 =?us-ascii?Q?58aX7QHZ4i60CwrwF4qKLy8c52AbbW+AukSa1c1KFXkQmi1ArVf7lu3o5Igu?=
 =?us-ascii?Q?vFuSRUuMlHUztQSQ0ni9SWlO4JPOWkc0dJrtkPztLrnc7pbVdCDZdXEdxKEk?=
 =?us-ascii?Q?hfabthxS2hFxNZpnJdnjYr+Q6YrI2cth0tdSUob7o6gkJjUXAVUTSMk0KlXZ?=
 =?us-ascii?Q?3xkuf/ICHnBp5HvBgfYmO1usyJutOX+Okm7DjJXl4Lj71OgoPv99RecPwWzM?=
 =?us-ascii?Q?dveJLN9if0jG4iP6eg7oUzN/EmmGUiGYDuNrJ8NdR1nF1XC3r8OfnlsppYlL?=
 =?us-ascii?Q?eDk0P6U1Xk86xzMdcgF1JTff9DDi37Q8uWEivO1MFpOaoNV9IZUVpo+sYvil?=
 =?us-ascii?Q?E4KdpC2QdUX8XIT2Mw/MUw2ggQdbu5bcNyJEpqfPmdjYWqIr0SNr/PTaB/3Q?=
 =?us-ascii?Q?CH3voIRas0GQH0/q4Jm21BZtZPa0ShxUtVwh0GdX92HoPVXp7kTG3xuKn1+R?=
 =?us-ascii?Q?XBdK9vZE/w+VQykulS5Ne1LRfmQImaf+Piynx9WV5isLDoNDg3VRXwUZv7RY?=
 =?us-ascii?Q?x7tx7U+zrmYoMCFNolrGEaEANWGYVCjbprvhm4UCixKpO/lnOOnKCYz/fWLo?=
 =?us-ascii?Q?zXwoxhcBuEueyuhmJD2e9kYLGuRiibhVzMIFfGGE3qlKtuqRqja+k05X3pg8?=
 =?us-ascii?Q?DBvmfyw+Sz93H7wz19UW5mwvo/ff+Iied+yywWh2PKFFVhQabAioPPOnMsCT?=
 =?us-ascii?Q?DbrTzvc0oyRCfA7ILFcEYCB23z6CJ7ijauatS242mN0hPg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dl8tOf8mcfCXiXkcQO71ub/zNJmVecqmZIaP1cjwzvWskjVs9/G6/asrmNWb?=
 =?us-ascii?Q?navBaJsER9wqLb5xDrPxH+AfkboO+y2QaGzyuSoWF+g0A+6IEVk2sF3/u1ET?=
 =?us-ascii?Q?ExmczBFX9HGVSkGMmLeR0YwMQ5ZKrTU0xIJnqwXHznvcIZlI0K0hmNJB3VUG?=
 =?us-ascii?Q?RCOCo0eWIegx7IqDItgLEDxc0usB6GlhSqkF6GmQ5p/LuQ84rIUXsnD/jiGF?=
 =?us-ascii?Q?2KGmJQuZtpnKuDYqk0xA2Rs+9Sky6qWjJwNq1x0nKJeYVfU/GaR6RQq9g+yq?=
 =?us-ascii?Q?aNC5oEH/JJYlPEYIFcvHBVywC7uHz2UjI28FlUcK/GdBeoYEAWywaRPTQ2tJ?=
 =?us-ascii?Q?30uXOEDIwBMJB6VX5LaMfRXD67ve+ePMoya+PVMNQ/6NnyI6/6vO5Z/tA5Ae?=
 =?us-ascii?Q?PTnRhnfHTn8gnkRSslAbVczYonfKKNGVX5N21ic63t6K3Pdh8DN7J+WTL/TO?=
 =?us-ascii?Q?6T80r2TFsctuJODHRiCeUvjjOT6dnkkM8vlR1eB8PX+IKYwmlf86Tng+Piew?=
 =?us-ascii?Q?1+epOk/Lh5LHBOdUfuT39sDY59f6GLoYtTpGG4VVmsaFeaSFS0tJocuPVJsO?=
 =?us-ascii?Q?E8a9IurIyrViwkEYAYyl1ZdFAnEZDbeCOo6dUyBEefn2ExiGS6hvaGMJ/RGA?=
 =?us-ascii?Q?y+klgfMP4qOvUvagxcxszsnja6enGLhnQnm+GcU3beVWV/WyC2PzvE5Jl79o?=
 =?us-ascii?Q?f2ZIUlOm8sZDo3JOd6IrYw61k5PYgzs2vgnl5yWFdRHtS6CJ0Pw6M6uyuR7H?=
 =?us-ascii?Q?ucfy+6P2YCDvFW9XIRPnZfg8ncC626wN2umUZHbzssdd+fluiu2+vM0QjWwM?=
 =?us-ascii?Q?aIA5ABtjqT4fQijn7cSDL1kpBMJ+3aTLx72dAYTPMfftOLfVnC4P6LZUh8t/?=
 =?us-ascii?Q?WAwBVbts33myuA9p3/+n/13uc+7/g7ORPJhLTH4Hsr5CAxFPGczNxJW39QVc?=
 =?us-ascii?Q?yZzHUIYboFGNHbfm+rls8E44YY8NYP4m8G1CEogn6Zdfv7nFm/+EGIX/vMXR?=
 =?us-ascii?Q?xDM7n5DVCXw3VgxIbrECL0wUA22kPGeAJUOITiWrU959WPVeumxyFQME5i+8?=
 =?us-ascii?Q?u4cWtmDkrE13Uv1POQhvpWkjy1S9ComfriRd/LNxTw5wz4QE1oU6IMbLGl96?=
 =?us-ascii?Q?pL9ZpqoE6uBEt+1TDJy1t2Zz92bYAml+3AfkzybbFMG3/6H/U/ucScWQ3ngf?=
 =?us-ascii?Q?/wgryS0Tac94zN9z97xZyuzMh54sQ3MT7f5IJMAVkQ/4nCyjdoHIY4cr+mv/?=
 =?us-ascii?Q?txHOPJoKZF3Fsr7RoEJvDtBE1feo0lKGO/XlLNx9mU/JEuJSvysuaoaDpQ+n?=
 =?us-ascii?Q?vV4H3ewYh1bei06R0k/NCw4oa74m/v8hF4ywyiQ+se6w7rfZULazYU13XAZZ?=
 =?us-ascii?Q?dLIYPKbmlnubeyI8AfNm3bCY09YbhXZyI7r63oBNvzW0UAu2bK/kn2+z2oN0?=
 =?us-ascii?Q?EAFJKzz7JRcLCyOitWWwYsEh6O5vsa11EoNgk2oMH2y+resm1A/paMHS6KM8?=
 =?us-ascii?Q?szPLNgfx56/JK1YwXj0sqG8K77UTOwH59CZ8TrOebJWKtjeGAbCA9Sp4uBSK?=
 =?us-ascii?Q?kZE3MezmB4/9I6hp9WNxJW3SV/DAk9VGy7teeITI?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e14e992-2937-4de7-be3f-08dcbe0489ff
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2024 15:03:08.6340 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dAU9hCVsMOI5pJ8fXyhTys8oEklsPnEGPA03k8GYJmxUG4iLYNmJLwSEOjrTN6yCqutcQgRnqx0iPFOT1kmgXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8554
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

Introduce a new xe_ggtt_print_holes helper that attends the SRIOV
demand and finishes the goal of limiting drm_mm access to xe_ggtt.

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c               | 40 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ggtt.h               |  1 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 25 +-------------
 3 files changed, 42 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 2d055f489879..960f5a28b7ed 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -682,3 +682,43 @@ int xe_ggtt_dump(struct xe_ggtt *ggtt, struct drm_printer *p)
 	mutex_unlock(&ggtt->lock);
 	return err;
 }
+
+/**
+ * xe_ggtt_print_holes - Print holes
+ * @ggtt: the &xe_ggtt to be inspected
+ * @alignment: min alignment
+ * @p: the &drm_printer
+ *
+ * Print GGTT ranges that are available and return total size available.
+ *
+ * Return: Total available size.
+ */
+u64 xe_ggtt_print_holes(struct xe_ggtt *ggtt, u64 alignment, struct drm_printer *p)
+{
+	const struct drm_mm *mm = &ggtt->mm;
+	const struct drm_mm_node *entry;
+	u64 hole_min_start = xe_wopcm_size(tile_to_xe(ggtt->tile));
+	u64 hole_start, hole_end, hole_size;
+	u64 total;
+	char buf[10];
+
+	mutex_lock(&ggtt->lock);
+
+	drm_mm_for_each_hole(entry, mm, hole_start, hole_end) {
+		hole_start = max(hole_start, hole_min_start);
+		hole_start = ALIGN(hole_start, alignment);
+		hole_end = ALIGN_DOWN(hole_end, alignment);
+		if (hole_start >= hole_end)
+			continue;
+		hole_size = hole_end - hole_start;
+		total += hole_size;
+
+		string_get_size(hole_size, 1, STRING_UNITS_2, buf, sizeof(buf));
+		drm_printf(p, "range:\t%#llx-%#llx\t(%s)\n",
+			   hole_start, hole_end - 1, buf);
+	}
+
+	mutex_unlock(&ggtt->lock);
+
+	return total;
+}
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index 31060fe7644b..67ae5f1602a3 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -32,6 +32,7 @@ void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
 u64 xe_ggtt_largest_hole(struct xe_ggtt *ggtt, u64 alignment, u64 *spare);
 
 int xe_ggtt_dump(struct xe_ggtt *ggtt, struct drm_printer *p);
+u64 xe_ggtt_print_holes(struct xe_ggtt *ggtt, u64 alignment, struct drm_printer *p);
 
 #ifdef CONFIG_PCI_IOV
 void xe_ggtt_assign(struct xe_ggtt *ggtt, const struct xe_ggtt_node *node, u16 vfid);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 1852ff45bea4..e133594cc6bd 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -6,9 +6,6 @@
 #include <linux/string_choices.h>
 #include <linux/wordpart.h>
 
-/* FIXME: remove this after encapsulating all drm_mm_node access into xe_ggtt */
-#include <drm/drm_mm.h>
-
 #include "abi/guc_actions_sriov_abi.h"
 #include "abi/guc_klvs_abi.h"
 
@@ -2103,11 +2100,7 @@ int xe_gt_sriov_pf_config_print_dbs(struct xe_gt *gt, struct drm_printer *p)
 int xe_gt_sriov_pf_config_print_available_ggtt(struct xe_gt *gt, struct drm_printer *p)
 {
 	struct xe_ggtt *ggtt = gt_to_tile(gt)->mem.ggtt;
-	const struct drm_mm *mm = &ggtt->mm;
-	const struct drm_mm_node *entry;
 	u64 alignment = pf_get_ggtt_alignment(gt);
-	u64 hole_min_start = xe_wopcm_size(gt_to_xe(gt));
-	u64 hole_start, hole_end, hole_size;
 	u64 spare, avail, total = 0;
 	char buf[10];
 
@@ -2116,24 +2109,8 @@ int xe_gt_sriov_pf_config_print_available_ggtt(struct xe_gt *gt, struct drm_prin
 	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
 
 	spare = pf_get_spare_ggtt(gt);
+	total = xe_ggtt_print_holes(ggtt, alignment, p);
 
-	mutex_lock(&ggtt->lock);
-
-	drm_mm_for_each_hole(entry, mm, hole_start, hole_end) {
-		hole_start = max(hole_start, hole_min_start);
-		hole_start = ALIGN(hole_start, alignment);
-		hole_end = ALIGN_DOWN(hole_end, alignment);
-		if (hole_start >= hole_end)
-			continue;
-		hole_size = hole_end - hole_start;
-		total += hole_size;
-
-		string_get_size(hole_size, 1, STRING_UNITS_2, buf, sizeof(buf));
-		drm_printf(p, "range:\t%#llx-%#llx\t(%s)\n",
-			   hole_start, hole_end - 1, buf);
-	}
-
-	mutex_unlock(&ggtt->lock);
 	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
 
 	string_get_size(total, 1, STRING_UNITS_2, buf, sizeof(buf));
-- 
2.46.0

