Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2FD3C77B75
	for <intel-xe@archiver.kernel.org>; Fri, 12 May 2023 18:03:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7668D10E236;
	Fri, 12 May 2023 18:03:51 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E780110E241
 for <intel-xe@lists.freedesktop.org>; Fri, 12 May 2023 18:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683914629; x=1715450629;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=sD8/KNu83G1I6CenMxjCYhgzN1MytXkewqsNobhCst8=;
 b=fVrCIPURkq1eWJ+iYIELfgEv0S+zKnkldb7cznhIuBFdl2Ez5q8B9pu0
 YyWl1N+lgH8WRUCw+FhA378cxaesXgsxhkZVny6jVarSNv3FG1Uuqr8aG
 U/KJekPvH/yETySATX65TRTHydVaU7+TVUfW4IWjqDxe1GtKMuUPuqTaR
 bj5MPt0iTRql7D746r0oBwMco3tAJNNHsLle0uPo9uTDFvbKWybNrrfGB
 W4kNxDuogNOsIMJUcvDgn9o3ZW9WZ+O0WTa3N+CrTNKqtEea3FrmI8flf
 ybbeDJYOsS7/H5AzdqS5xc2my+P8zdDnX1/jTS/lWGSzkV6COcE1Ou3Y2 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="348346278"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="348346278"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 11:03:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="677764764"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="677764764"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP; 12 May 2023 11:03:48 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 12 May 2023 11:03:48 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 12 May 2023 11:03:48 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 12 May 2023 11:03:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ieytcIuITsbLdmm2LsNDK+gT9IHcOv/W8v8EZtHkqpTEPVnbS6b/kZ/mEvV2X5cXb/UqAQR2qSy+oCJRUv8FLvD5fz+5t9hwN4UGE1BBwQQ+TlATz3frpS1ek587Ke8oBfG3MWZlnJklmvTal0MQh1AYw38qgEafBS060pKUCwPHKEpraxAp616gXyOvWjLjPxM39izdac/uTA0rxD/vLCgoUmjytMWByFa6axwk9Zq26jgCgnMohtbCe/lmUFf7CloBBFAp2hZTambobepg/pt+hoFK5wTCeOun/UnyxD7mloiCR3z3jSYqEoEeVwuODTJtJ9ASEd8/H8/NtT9hEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hjKR886ql9u/sbuOzUmif8b+FihddCyHiKPXt61OfBM=;
 b=YINm/LfsLWHlnbJOM3vEOjXKelO6NWdLft/ZLNq41vTTfK/otEIN57OjDJ5EYeTuxbgOT13j4b8CQapXyZ5HP3LOoQvVoPSW3zrI08iV/kepjNNMESnFsDD5aMtvW8B3QCv937WT1UUWWfibCZBoUS0YAuHpjvLBkvOgNkT2BlOcqBwVtfOeYuBhK/iYQputtdLLRWYuF6NFkv7G8UPNjl+UTi78H+nc01fwCKvwKieom+HtSFNpw16h+TaTCZlybcnVl0cdJX+fZWic5A7c+J8bsI6zoRcXoJTZLXW8Wf5kiagk/qMVcu8SUNIArpCTqsNUP3YtZEpxrHY+T8tKig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB8502.namprd11.prod.outlook.com (2603:10b6:510:30c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.24; Fri, 12 May
 2023 18:03:46 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6387.021; Fri, 12 May 2023
 18:03:46 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 12 May 2023 14:03:11 -0400
Message-ID: <20230512180313.1765011-6-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230512180313.1765011-1-rodrigo.vivi@intel.com>
References: <20230512180313.1765011-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0081.namprd05.prod.outlook.com
 (2603:10b6:a03:332::26) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB8502:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fb56fe6-bae9-45e3-7099-08db53133ac4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IoerNcxLhid2JjqhIfA5DW14Od1c7HNKFgPyGvcGvMo1gYsdBvGpVrC3nuFWNLltgI84l59BwPFxo2+J5ceHmKDvu/uCLxcyuWj94AjeiXl4f8Bbhhe5NVUYIauZ5p2odXPTFVgZ9EAvsLnd5oi8+MlGmxvnVsfd+ujp0maPNBEeZuGgIn50Tb02ZIVNIo/ADzDVb5l3T4H5vpzQQ9MP80tBV69MJzaQNGiAda8FWEMfjCwB0692dd1H7RzjZ7sTaSM858VXU3a4/c7hoKI60+lFt3hhAnfVrmAkDcG8wkMP/fGFDdbsxBHf8GelLxVXV3tDde4jsWaIOLC/8DL4pkwTkaeBdred1fQ/YoaKH1B8VVF8JdH+bU2+L7/cqZn1/dnOH7QkcKbjlIzGPZdr5ZWw2pnbZlUed+fwbXczQDW8YbpgK+OTZoEC3WzwPxA5IRVv26QnAlTdSWDvP5pXIUymO49YLYjugaob7V0bF3LhwhFtisSxFuo04ln3uCG5K6QqqpUGr8aUBZISP/i2fBOE/ut5AiagYQvNAbpBfwV6e5HCUoN8LjcDtzieufUx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(39860400002)(346002)(136003)(366004)(396003)(451199021)(6486002)(316002)(6666004)(41300700001)(36756003)(478600001)(86362001)(66556008)(6916009)(66946007)(66476007)(6512007)(1076003)(6506007)(186003)(26005)(2616005)(83380400001)(4326008)(38100700002)(82960400001)(5660300002)(8676002)(44832011)(8936002)(2906002)(107886003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WX5Sj/uEIF1lc9O/mavlft60PXSENLbpVGGh7YLYnzypXQnFeob3SYn/sYM6?=
 =?us-ascii?Q?Xuly0B6/0vWaENdWchJJPrGoET99PZ4xMOOSEcWWyoJV6G4kZoi0x3QuPPfZ?=
 =?us-ascii?Q?nAEpL2cqUq8EoV81tKXwHFB85JWiiqW0cEgZWUP7nQm9enfFVIz/EvqsaRnw?=
 =?us-ascii?Q?1EwMydaq3YXM9DU9Qeqfu672rVSjEhaQZ/RiKuJJr15yRPMzZKbNw97jSW7M?=
 =?us-ascii?Q?0jX5oOjCBcEDW9flf/LH0Yl6hZoBxmmrKejJBAytTmP15/UxnAy3muqZpKsk?=
 =?us-ascii?Q?zx/OhzijAEJzYQ2G8AlRuJoQDYGxPpDuoUn5PjMkrcTp+3fszxeXOBWW/AEX?=
 =?us-ascii?Q?ourYCIanCW57mscr3fsK67QIB7r20ynziGF2vbceAp1BaJ9WFKgqv67cqYNl?=
 =?us-ascii?Q?s5sD0z3uah2WCrORSfwyugUB5UNzx4XfBt6txSodGGiVZZxxpinxqWygWrNe?=
 =?us-ascii?Q?fB4SIo8BuvVsYed363daEIpUyNN30DfEly4FEFQmmyktABkPHBXL0MXRboaj?=
 =?us-ascii?Q?ky8syj807NUHiPm14Q1FGhs2i3AAKr5MR6D8vpcCwr07XTHhzbOuzK8cnNvV?=
 =?us-ascii?Q?dDNOuQjakdLP0Y/9eeo35iN4GurBV7FD1TezyslO0rHgi1SbMbF1oxfrYUR3?=
 =?us-ascii?Q?N4pWkOFkSnMfgkcSpayp1t0gLgenRnUy9BnuEdhZI86bceeIDav78e9bYLWN?=
 =?us-ascii?Q?HGrkKADhXKPErDsDHnofW3FSGi6VXrSyivLclf7RhDO/HzzRfMRaQ+NN5/iE?=
 =?us-ascii?Q?q2ZHsnVKprnx/IYiZe0Kl1Iaa7gCC9Y4nTBD1g+8QwX0d0117tWIO+t7kqe2?=
 =?us-ascii?Q?wXikp7DPE11CTDMYZ0eJ2VlaJPRnC5WgqQAOv40EmClV3+/ovAJCI3UGHcpz?=
 =?us-ascii?Q?FlaLkgbScmvbZdG4GK8JdkqdHD4ZucynJiAX+bunaMQVPPcfLkRnubxjO7eL?=
 =?us-ascii?Q?YVdnUx/nwkmAdepB0jplAYmJb4A1ZttZR9VOxPIxkaPrtdGDtcR3iZ/RdKPp?=
 =?us-ascii?Q?6EFNxv0ol9lbQeuLqV90Uuo5+giFskR4sFUbYMLLrMDHBRsA0qsps6TYh/ad?=
 =?us-ascii?Q?NsGOrl+i4Fd06Dl7M4hntuRULOjDpf3v3gZoXigyfUVXM4JBYGuC621wWUuW?=
 =?us-ascii?Q?cXWszCw1LHxgu1U2JU1kWMnGBCSbTGrKOR1940V+o0NkEzKRy/NZvGl2xnTr?=
 =?us-ascii?Q?ZA5NjZ4zf5uaWLTAX/UzhcAg1eAZeXEPsy/A2e5rLID/u4i7eGzJoYXusH1b?=
 =?us-ascii?Q?GZbNcovChwfK2NZmMsQg/FN1WWH1m/xIKclOW+dLuCSh8vAWXG492GJbCQtY?=
 =?us-ascii?Q?XMrmBqcIc47VJjt/VH9u1DYNKcXrw1lUOdESDyIras1QbLuMGN8f9XYEF94r?=
 =?us-ascii?Q?81nSxjoRYh7sa1aplja1xFWg1+64P8yLXeTUX54lXlztKQNctPMi9S0hdp4w?=
 =?us-ascii?Q?leBoPZmCMD6j3tirbCIE3CIsPeHEHp5ReE325fhkxFkAXuqcH4KXzVRn60th?=
 =?us-ascii?Q?NNuJ3jXJcle3k+QIgjiTBFqolCFn0B/ZnVQ1gvuBUXc+uFwaywD61izFuT1i?=
 =?us-ascii?Q?5LFmoT8aGdx0EoBLMt+cBeqC1XKxcn60ngoduZB/nKeCeqAjoGH75RQiN3ie?=
 =?us-ascii?Q?Mw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fb56fe6-bae9-45e3-7099-08db53133ac4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2023 18:03:46.5123 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fUH4ahmbmg1h9YyaqLFPCFK5VN1+78mERQ/WF3T9qfKmlmov7PvYyBu3AJ1Z/IWdfUMMC79AOGNNFOcNYNukzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8502
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 5/7] fixup! drm/xe: Cleanup page-related defines
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbdev.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index d89edd98e5d7..6362c4ce15b6 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -179,7 +179,7 @@ static int intelfb_alloc(struct drm_fb_helper *helper,
 				    DIV_ROUND_UP(sizes->surface_bpp, 8), 64);
 #else
 	mode_cmd.pitches[0] = ALIGN(mode_cmd.width *
-				    DIV_ROUND_UP(sizes->surface_bpp, 8), GEN8_PAGE_SIZE);
+				    DIV_ROUND_UP(sizes->surface_bpp, 8), XE_PAGE_SIZE);
 #endif
 	mode_cmd.pixel_format = drm_mode_legacy_fb_format(sizes->surface_bpp,
 							  sizes->surface_depth);
@@ -363,7 +363,7 @@ static int intelfb_create(struct drm_fb_helper *helper,
 		else
 			info->fix.smem_start =
 				pci_resource_start(pdev, 2) +
-				xe_bo_addr(obj, 0, GEN8_PAGE_SIZE, &lmem);
+				xe_bo_addr(obj, 0, XE_PAGE_SIZE, &lmem);
 
 		info->fix.smem_len = obj->ttm.base.size;
 	} else {
-- 
2.39.2

