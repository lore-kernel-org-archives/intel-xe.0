Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DECDFC05027
	for <intel-xe@archiver.kernel.org>; Fri,  3 Feb 2023 20:25:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B86D410E09C;
	Fri,  3 Feb 2023 20:25:05 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FBA910E09C
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Feb 2023 20:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675455903; x=1706991903;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=cj7EixDUgQgvA2St8Agd30ezIp9L8ojcs0aggGG39R8=;
 b=RtdU3l0jwyWkp9QilDHWN5dhxX1uFInlBzGITiNUB9h2W4u10ZAH6czR
 EPsaTnAqZrAw8H8Q2JUz/F6RwMudH/zNL/kqUmnOfbhON0nYg6iJnAuFS
 Q5dE/u6RS4wz7zWl8jZQoattMweI3no8KWP+dqwG7KQe6aIk83yJXO0y3
 CegT2tQJYAO+JPqpx6CCxSPWCYF4WWzh4CQ6SUKqd8G68BGWmcns992DH
 zv8l6yv8neZ0/PPEBUMsGF3jScShyjGjKBzXfr2by8ZfxD4iYQb/GW6uq
 fE9xoBu4qLuRyRzURV0MXAuLa0AceXHYEx8aM3OZnz+8aTcxHEKaxj0Df w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="312503072"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; d="scan'208";a="312503072"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2023 12:25:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="789809013"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; d="scan'208";a="789809013"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP; 03 Feb 2023 12:25:02 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 3 Feb 2023 12:25:01 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 3 Feb 2023 12:25:01 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 3 Feb 2023 12:25:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zsya0wsbrPq36g/n/fhM3AWZgNwY6aM7IGOVqTa0s8ia/ORnb7H172bqqXtv/bnK6MjHNxrWpZsKY03RBLuVCPtP/ye8Sszp+0pBDqk9dcbXey7lFRtucFv4O1lcJsejgBJBfxECcMg0QtFEWVrNrI3QPpaj7ebCNLdH4NRFWWVHuhtokYJnveURAJTm+aDrsejAJ+1KVavpAsYquZ3RrmAVATDTIdcR/MxNHk0bJ/VyKQZxemr0oX6XJlaJ/FsR23Cy3DCuVYRmJi2b8Ge0nEZJ8w1+ihXv6KVyx2VMumEfhcM1atKJEhLPaYQe8tJAWE52Q2sYDyP99ghpce56rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xpn4qQ4zbA9UoHe24MEhJUZfEva28C2DDOID0ERH5wA=;
 b=QYcaSSHB23gQkX4uEzjmpsRbID1dtLILkPdUpyUvkjeI6iNJVaIv8y5unRl+2XSDfPfTJiOb9OP6Ax8IQ8TeG7RkrVEZ7iDdiJHgOvzLeuKhYCDOZYnlyrVuT8u7dlXTQwG/GzDCfFy+cZIJ6GTlcs070ESSx2QB9W+2Mir9lSU9VWN82YdRUJwQJF8JBHXY7HQ/DAdF9e5Y3jal1hbOpaThCkLV044eKpIbRxyyF34ri+8mhheM1y+e3mYdokwqBht24IcJkUQo67R2cGCmJwAjJXJpnIHITALakbLxo7SVCcSBDDVDm0nl3h3CtQvrZxlEbGlnYFGyA5OTM/NZog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA1PR11MB5803.namprd11.prod.outlook.com (2603:10b6:806:23e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.25; Fri, 3 Feb
 2023 20:24:59 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%7]) with mapi id 15.20.6064.022; Fri, 3 Feb 2023
 20:24:59 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 3 Feb 2023 15:23:59 -0500
Message-ID: <20230203202409.577032-13-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230203202409.577032-1-rodrigo.vivi@intel.com>
References: <20230203202409.577032-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR03CA0032.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::45) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA1PR11MB5803:EE_
X-MS-Office365-Filtering-Correlation-Id: dc4dd1a4-24d4-47c4-9c96-08db0624b8db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NYFUi0pamAJ4wQYrawqu+wcm4jhGMxb8Nh1Ap7ZQYsbAyI3KYyMXRjkJRc0mkEoWL8eLD+TPi35a3glChT+L1faP3y6cZhI8keaYWG5u+rkYgAhdkdoluXoOLbcOITzL9Kmt1fix3JysFQoxuXLVwlO3F58aG5NXhLbOq4DvMCE46DDBdW21qCi3z+UJHaDHdMVzE5R8xD9vjkOoTQqu0MR+Scy+XHiwdB4/krIHUa+BeHTvVi8H8WrJMXqV77wQP11l6KWRW3hs9h5AJpod4/wv83cfS734Pp1STtoF80JwcKuDSgPnt+d7pTrq+Oo2gQM1iv3EVqP5cGRpsTtI4e3DfMF6x/m34CaOUerfS+hUZK3uZLGqgZRiRSO2zuy3d03esPAviDk+exXYb6mlVcl3VImblz2BB1QqkZF1CsPBn1PeTNNrskUvRBUeHcjmKZ7+dB9KIZhRznDqhDcZc8V1C4kwPkGYshO+3CzmpuAMEPdC24CL1IOddpYBSdTkDGnr8CqmVvbQfFwLUUb9gSvLUbdp/IXsKK/QiICd+zTlpA4yLkuKllTO8Gt00ozUjafLKxLJGA1PYJ3RZ6gE3a++Rp8gLl5KAuJIp81z3RMejamoQTbDT+73GCgPgklBfiyWCOoqTGjyjBxCURuKpg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(136003)(346002)(376002)(39860400002)(366004)(451199018)(82960400001)(2906002)(186003)(6486002)(107886003)(6916009)(26005)(478600001)(6512007)(66946007)(316002)(1076003)(6506007)(54906003)(66476007)(8676002)(66556008)(4326008)(41300700001)(44832011)(5660300002)(38100700002)(8936002)(2616005)(36756003)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DxbJzMFGpuEJCBCzBEztu1v8pmXovMeh8EDv12CVRNM+wl7sY9aMvCVY8XIC?=
 =?us-ascii?Q?sK/z3nGF8Mlk4qDoE1427UT7bhLpjl6jD7z6NYTAg4nOgRHNVH+UNvJt3Waa?=
 =?us-ascii?Q?QzLYi7DrClG5g7fZbECQ/39WI7keJYePx3U0uEv69hGYoPeKjOgsFCq9RHjN?=
 =?us-ascii?Q?x3psDvxNOLBDk2tEOXu0S+6YnHMA2I5VPluJOX45jeQO4ZtzrhvvJsIhxgPK?=
 =?us-ascii?Q?b0dYnDBWTbIXy8rIwvnTpCemJsBVm3Xz37p54aS1RFbL4FkPxrmg0DzbJfOk?=
 =?us-ascii?Q?nYP4M2u2ssW65zXhmMXufZIETJfoODwz0K8M90iT884w5MC300l2IE8a8iYP?=
 =?us-ascii?Q?diEZpxgEqViSWNTN+kfmFF7EyrDe01lzxYB3O2cmNuKp4vUWJjCcA1mBFBw3?=
 =?us-ascii?Q?bSwWoZdMHxC86poARBAbstIEOCt6ePC3clxtz82hFQP24EnqGsWue1pkoRoG?=
 =?us-ascii?Q?Q4iD2m4bZ9+n2ZE5W+QQW3r1jCrGebB+o5v9kCN+KwHnvtWViBhGKH2Pj5Lg?=
 =?us-ascii?Q?5KGCcI750qIDLLMAK2vtmaZNhpjP7H/5uJ1FE6MkYOwDCjX1pN6TMit2FpqA?=
 =?us-ascii?Q?O+1fjj30NprEdTfswTzYtu3SuwlSVsToPqtbqpHRh8/6mCV+APfbg+wqbSWL?=
 =?us-ascii?Q?JP7ynmAIArC5yB+1/qAiiwA4BUJz0hJLdvKhxw+E+hd/vL9BO6110jUWgS+h?=
 =?us-ascii?Q?/gAvULFZHjo8G9cNWj8BomGUhUfHpPbj5OWqTdiAfHyw5MrhaENt8XKLXQqp?=
 =?us-ascii?Q?g79lcuH2yAn3ws9OFhpWz7rxUUUAj8UNj/ch1le3tCR8vlAQAylugBZev4u5?=
 =?us-ascii?Q?f/tA6jRN+yR7k0Zkecjj3cCTbvwnFnVQEgzv1z9ZU0wRoaVFIiLHUKE7R+9n?=
 =?us-ascii?Q?kqLwfBUNhhMNzb98JlpwLvu5E5XaYoLXkK/aWGS6+eBbBZxZAboXHa7W8Zq4?=
 =?us-ascii?Q?OKeb6YIsPulHOXw2RFI1rcsub0rdiKjB8WGwY5X8lEdufxPhp1BYEy9x2OU7?=
 =?us-ascii?Q?/LA+yYD8dCj4Iqw6064nRBwlLGvFbb50RB8qhC5h8YRc/FDAbBZFSsO/YeDZ?=
 =?us-ascii?Q?2KZhuUsjtBsKW1AUyACGC0qQhESYQ7zFTrVtzkWR9IBIneiH4XWhPieatA33?=
 =?us-ascii?Q?LYELYqT4/VgU6jRLzOtLtuZxr3TL32YP5LwzIazwuz/g2+1SThAv5UcSMG+5?=
 =?us-ascii?Q?oZNtTHnZQrIlULFs3NUCf7O+IlDoyZBsFUCpskt++QbIYTyxnvQ2G6isJKeR?=
 =?us-ascii?Q?uQ2ZlJ90F342WTq0NoIDWUzMkMlkHLbTN+x37QFQz8AOwaXD7rtDQ/bGd+OO?=
 =?us-ascii?Q?YtDlf9QydYixYW+W9Td+c5QtSnGq5Cdvwxg8wI/f+tHh8grHv7Y1eYaCAoKI?=
 =?us-ascii?Q?rb2exOqt18k+NtaVD2/wLlu1wwquos1g5B0p/tSEmC39kCVicirupC9oWLAf?=
 =?us-ascii?Q?9hiZSuKTHopPYEgCjRPXRGf5NQtfmXprN2Vw3dY8fDBpTG5e8hXh2NKsVxJf?=
 =?us-ascii?Q?RFJaCMdsn6X9U9R6cPzeHLL0lFEMH+uM+asxViiIMAsWKRqYOZ4ZntOw+FMD?=
 =?us-ascii?Q?3CE/IXs+d1UUOd2xz2TbShWEwfNkymdCDDv27F8zNWJX/UWleNVvSYXPAVE6?=
 =?us-ascii?Q?Uw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dc4dd1a4-24d4-47c4-9c96-08db0624b8db
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 20:24:59.5714 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yI9FVeuD1aI4lzojnFJDz3EAcogDXSSa7iY9KVoKuEgH5OQqPO0H4csAISHLPWHFx5EEvNLVaRt6oLTuhG/ePA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5803
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 12/22] drm/xe: Add has_range_tlb_invalidation
 device attribute
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
Cc: niranjana.vishwanathapura@intel.com, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Matthew Brost <matthew.brost@intel.com>

This will help implementing range based TLB invalidations.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h | 2 ++
 drivers/gpu/drm/xe/xe_pci.c          | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index eba224236c86..6d13587bfa7b 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -92,6 +92,8 @@ struct xe_device {
 		bool has_flat_ccs;
 		/** @has_4tile: Whether tile-4 tiling is supported */
 		bool has_4tile;
+		/** @has_range_tlb_invalidation: Has range based TLB invalidations */
+		bool has_range_tlb_invalidation;
 
 		struct xe_device_display_info {
 			u8 ver;
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index a96004aa34aa..53e87b27fcde 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -77,6 +77,7 @@ struct xe_device_desc {
 	bool supports_usm;
 	bool has_flat_ccs;
 	bool has_4tile;
+	bool has_range_tlb_invalidation;
 };
 
 #define PLATFORM(x)		\
@@ -213,6 +214,7 @@ static const struct xe_device_desc dg1_desc = {
 	.require_force_probe = true, \
 	.graphics_ver = 12, \
 	.graphics_rel = 50, \
+	.has_range_tlb_invalidation = true, \
 	.has_flat_ccs = true, \
 	.dma_mask_size = 46, \
 	.max_tiles = 1, \
@@ -332,6 +334,7 @@ static const struct xe_device_desc mtl_desc = {
 	.max_tiles = 2,
 	.vm_max_level = 3,
 	.media_ver = 13,
+	.has_range_tlb_invalidation = true,
 	PLATFORM(XE_METEORLAKE),
 	.extra_gts = xelpmp_gts,
 	.platform_engine_mask = MTL_MAIN_ENGINES,
@@ -496,6 +499,7 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	xe->info.has_flat_ccs = desc->has_flat_ccs;
 	xe->info.has_4tile = desc->has_4tile;
 	xe->info.display = desc->display;
+	xe->info.has_range_tlb_invalidation = desc->has_range_tlb_invalidation;
 
 	spd = subplatform_get(xe, desc);
 	xe->info.subplatform = spd ? spd->subplatform : XE_SUBPLATFORM_NONE;
-- 
2.39.1

