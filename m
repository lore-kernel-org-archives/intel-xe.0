Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9CE5C52D6F
	for <intel-xe@archiver.kernel.org>; Wed, 21 Aug 2024 19:38:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A567710E6A7;
	Wed, 21 Aug 2024 19:38:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R4eDPBPu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D195610E6A7
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Aug 2024 19:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724269131; x=1755805131;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=7NqO29wmwPFzQD3EWMQ8R9S65yF5Edw1BEhvvGQxMIA=;
 b=R4eDPBPu3DiAx2AwBauxn65+28jZ8E4uzuT9UfFJi8QFNYmVPA1lVPsg
 sKUxYZ5vu1DrLCyjNp3jvuSygjaQ9BO1vDsdZVca2IVMy/SXarjYO4q3Z
 OihZYm55wiiOgs0SICeLxd21J55x9uR5/4smTavc5xakkT2vifloJO/96
 Plt+rfP16TiTbJx6G3fsHYjeyjzB+RrP4+I2P9vWsHHJ8qat7ncYm3RUn
 dTAWi/Nc+BgbzW/M2yFbAfuirpa7On2TjWihxzZgLoD7tezagm2IRjes/
 5b2lrSsdFsEXIreHLVHYDQQpmVZg61d9I49h6dtjnph/2AL70s+OVjDEW w==;
X-CSE-ConnectionGUID: W0zmAUhhT0qZXK+5wlWsGA==
X-CSE-MsgGUID: zJo+y7jwRtKhPcDQ2FXPQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="26448893"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="26448893"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 12:38:51 -0700
X-CSE-ConnectionGUID: iy9KEliOT36WoCUIKGyjIQ==
X-CSE-MsgGUID: a+EJy1xyQNCBEqiwF06ioQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="61191303"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Aug 2024 12:38:50 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 21 Aug 2024 12:38:50 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 21 Aug 2024 12:38:50 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 21 Aug 2024 12:38:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wiARWkq3YSksco7lp14T0sm+Ni1+ktp480mdizRik+86hix5kJ0O2/bhJx/dQssg1kOp8lvPAe2b5j8u2oYluOipWZpibrSFhYdQZMfzjhXn3cTJ8DZVMt1h5jwLB0WLqRv7gU1dnJKaMyAYAFgRvOWzyV/MX7I+NpFBh/BDexMEnq8hviCvD+b5rvFEX/l8r5J8+030153syGL9F7DTYVOK7Wu/B85IgjgTEz/EsTeFFXqwE2rZ7hhZQQYG2CA7cXaRki2MTk/fzC1P2oS3l8WpMlpuLf3CTnbpDeRtVLrbB5hWIOoj6BhO+ADBpx15IHeMUl6DS9MUa6wqADnYeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nPGGF6cOSh5MufufwMWlimDzt13nY6gMjMaiD/7Fzfw=;
 b=g6Slrwy+W45fwReMEhTg8qVlB38aX+1duCH9NE7dL3HWcbOTsm68XgZbJW6e4LMUYSXqfBbrqQyohxUN6iFLNttnTLFh5cK9q/L2WktkEGqPIC0hK5dewjKBew7B9dApLpyDDxokc4iM/1q/p7Qv7Xim9/NyLJk5MIiyKQVk31bXlqXVmaAtfPu9LP2MjRkjW1koyT5hiZlr2p0C2FkICjrXcuh5OFHSVV3ZpE1WKE5yeDLcL42oELgzlirMT49WbVxqsF4uXK8/bK5OksTi8ajYjAG569pJuB/9sqinsH+s1Sc3cauHakf/pNoX5HrLqeP+Fpf/SCMmVVtc5KK2FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by CO1PR11MB5041.namprd11.prod.outlook.com (2603:10b6:303:90::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.18; Wed, 21 Aug
 2024 19:38:47 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7875.019; Wed, 21 Aug 2024
 19:38:47 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <lucas.demarchi@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 "Matthew Brost" <matthew.brost@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>
Subject: [PATCH 02/12] drm/xe: Introduce GGTT documentation
Date: Wed, 21 Aug 2024 15:38:32 -0400
Message-ID: <20240821193842.352557-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240821193842.352557-1-rodrigo.vivi@intel.com>
References: <20240821193842.352557-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0339.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::14) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|CO1PR11MB5041:EE_
X-MS-Office365-Filtering-Correlation-Id: 3236b126-b35d-433c-dc44-08dcc218e018
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JHfCbrvx0yc7BRMb3NnSIn2TzLrsmq+uilC17O/tSjtpawmXUMP34gjjA/Ii?=
 =?us-ascii?Q?XbyDzoYRl+nfoDRtjvGtS39sDBwyAO31jdsf3raG4C78opbmlSxlSwSIePhR?=
 =?us-ascii?Q?K1TWkupxRBsjYUmtNAIsm+L6oK5M1YN9lciH+YZnDxUvKgIXHg6XjayONOP1?=
 =?us-ascii?Q?pJhs0wP3tfIki3uybQsrInbLO5O8jJ1SkQovh0Z07MyYLH2fWrI+Joikg3xq?=
 =?us-ascii?Q?azoyKFmCauOCZB3z7kjuXtkX/kYGSHxLB7IfwAt8VxsS2PnEbTCxlZFELFDA?=
 =?us-ascii?Q?h3TH/ZDQChhEskjc4G9Uka+ArFq9qCGm3mmFoBqZp+JPpdAHTqUX0SMWGz6Q?=
 =?us-ascii?Q?/GNZJztMSmob2DW0+E3GIj35BpQS+0mvPIROJLlAV0JRBhUj4JL6VULnPiM4?=
 =?us-ascii?Q?Jt11ebPYTeqM9UASig5Hmeqlr/zsBQk1CN/oCzcaq1MrGOZ03aTMuO/e4S7w?=
 =?us-ascii?Q?M1f2l8rvlYgp/GgIpaksIRqCH5HCGDP/NpoR6NHWNq6pDRX6FVPiZNPzddSL?=
 =?us-ascii?Q?JUKpPno67UUYq1SDiAJ9M4iBQRd0WInNS3IBybvc02m9JsehdTPt5Dhh0ZBT?=
 =?us-ascii?Q?hZs02xZ8paylgpaE/OdsEyQGvdrerXJhHpNV9RJUDirsJyTUx2IRAvbEkKmo?=
 =?us-ascii?Q?CIuUUcJYanSVHbbqS+gYx2OevhTxGyI7VvX430kA1bSTshvvEl85Cfsrk12J?=
 =?us-ascii?Q?NmOiCQyUDrYgYi1UYalpM4JeID0AShttZM3qJoocfiMMwrFuV9AirIhJV4TD?=
 =?us-ascii?Q?qZwsWAk1gCzxox8Ll0odIzgwLsk6PvWysBGglxXoztiMX13Jqx9uP1RtcdBu?=
 =?us-ascii?Q?/leXpYK7SyGOT2MBH6r4xyyCezRlSfCd8c4LSRuYpsqP15P780cfOXNjQZtd?=
 =?us-ascii?Q?EFA6uth6CyBJkaBtcHJ6UBn8eosw6w0q6XdTpJwAVv3Pf1unQod/yXF8/8wn?=
 =?us-ascii?Q?CP8QXBLfsjgo9xR0SOxjSKiMntHYzFC52atsjoc1jyjSNBqskWByMKRTAMfh?=
 =?us-ascii?Q?GaDRo9YDu/ahxsrcAHqeIi++qf63kvTBtBgaF4+8NeL6S4O82869wAOOC5V0?=
 =?us-ascii?Q?0yZvJIsl2Jb5Cc7RcrtDP7jPC5wtad8C1lLmzJlXj5nhZvaC5ISUSTy4nZcK?=
 =?us-ascii?Q?rMcgARhXlghBrhm5HGH95qp/KIeBG6xxjLM0KWbN4mg8lsecJuPpo6nVCNSC?=
 =?us-ascii?Q?f8Z4sepj5tadihrgikj8Kp7jAUAD6xgVz0e5buO6+Sg+4pgCZvTF+Gbf/HjH?=
 =?us-ascii?Q?+yIfHBaxelhDGqz6x6K9spLYowUf2HvCjZyIa7HsX14gjwu0yHf7+GhoOOa4?=
 =?us-ascii?Q?5In20cfm9QIpLYmKLt7NWB/ZUCki3vzy6tr6psQC4+PwKA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Joxwmh/guD9hYszquwa20heSuA1fmKqMxQ9m8OD1WzkzbiUWHiXxjilg4Bri?=
 =?us-ascii?Q?1B1mA02+m0nx/DwhwBRRlQIwf7lTPB4lHjHviAy1mwPP+cxYPABvo1m1vkxa?=
 =?us-ascii?Q?QC0hIlYLpaG7TljPKyOogI271JNkTXrTBvMJx4U0Gtc17lyg6bSCAJd72BGq?=
 =?us-ascii?Q?pP1C7cgF8Mz6kQwfVJFPZQKgajjjv4ntAwjaAAuI+3WcmTG/5y98MkIpMHzB?=
 =?us-ascii?Q?l6Hx3dz1IGstQbbyRViqW1v1mbD70wu5XOeza7IvczBp33iK9e+zgvC1GQEZ?=
 =?us-ascii?Q?Wf6fz6j9o3XTkeLaGqV3Ee1vhX31+phL42ajVcNplpTn7+VmFpaiZXqNlbAc?=
 =?us-ascii?Q?+0yx2KidmTYipNfq/d4V1Ub684dQo5xc1RRNOjR1oVM7it0EJfXpPzGyH/mL?=
 =?us-ascii?Q?C98dShipkKuMgxA+HbtRmdbr+Tz8HPna29IEuPaX6bSlZU9OKQbaJ94H5siC?=
 =?us-ascii?Q?SS41VNaEQPJ0hEhof2FFgn8o7tLmduHgDFJH/L0Z9qND/7srWUKFenbzaEuK?=
 =?us-ascii?Q?GxR8UBSKAKJ3TmxM8ixgPxzZ1UJeC2OXQI2CgEJ5L5sY+vefR+kz/CW4DznR?=
 =?us-ascii?Q?ennOvyeuwiwm2gWdN2UO0mLvhJozjY2oFezocWU+TaRvf+eW4IMQb4jpq41J?=
 =?us-ascii?Q?mth82q1T/3b+v6yzMVeXDu1r4E+5ikIc4pOpxaXJsfVyMvG17DFAv3AHgHc2?=
 =?us-ascii?Q?iYJHt5by5dkqKp+1OlUPi+GROWpnZK4FszNzw3G+mF4tarHOrB1C50mAcrMF?=
 =?us-ascii?Q?YcO4VwhTk6+dmvC0boW5sL9pmLhCR1vbjecpm46Esa+mFhbd5UnQ5C3vL6fT?=
 =?us-ascii?Q?Lm6Ogf6ha4sl5sKi5KkRSSHylBcT4SUQygbX7MM4hc0F7TcL4VMR72uTJVjc?=
 =?us-ascii?Q?qUnflVgq/y/A+WKvJ2nfdFV0v84nVjDKnUiC0VyNQCfnBX6f/NicM/c0//WU?=
 =?us-ascii?Q?LSDvJ+JUdmvhV/E3n6ZpueT161AmqH09ZVStRo8sFAwdmdjbj/JOWnpPlmIB?=
 =?us-ascii?Q?OKhIpoOr7itBDN4ZZW3LnZlP24lZ1fUPb0u/+nvraQzhaPPq5cDtJ40c483R?=
 =?us-ascii?Q?qToT4FSd1+sXpWptPuF93T6M9fTO2n8W13D+aKlMsa8Dzn+SySi+MoJ0v3jP?=
 =?us-ascii?Q?jieU9UEuaPTrCBMufpygG7lKRkOcZOUnHSr2o4uhQmK4ulEM3HjA6OjCOP5/?=
 =?us-ascii?Q?4dQVuAOfmVzLiXcAjyTBqffi7uvRf7t/AG+qpGBtr/FMaPml6rxLupTLG3Gd?=
 =?us-ascii?Q?n0AlKWwO34W1L1P+lUgETuM1920n/JiJ/y/tIIJz3IC1xHJ6WLYZ2j1nZ7Ad?=
 =?us-ascii?Q?Ws6ke6zAVugQa2gFnC+G/dcOINZHJXhLexLuWsN5TASvjh31ttrRQcQ67L77?=
 =?us-ascii?Q?xlxNNbUCqRGW+ICkv4gGCfEtvFUSPAGp0TmNJqYPBkOqB9HLacrvk6cjyFsQ?=
 =?us-ascii?Q?rbyeB5p6DcNFOU0WH3jFuCLNATwuyD0hnp/9FpGm2/+QjhA71La+r/TgBzZk?=
 =?us-ascii?Q?3DMenmyRdyobP3aIMIlTABdV90x0d5mV6s52PemJSmrDGBlfl52Ank+V5sou?=
 =?us-ascii?Q?XdehVpiXPcb+50cvr3VhIDGdjpvE5xrIPQUAPgKhQLehEb5Bv1cmGG18jRhl?=
 =?us-ascii?Q?+g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3236b126-b35d-433c-dc44-08dcc218e018
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 19:38:47.6173 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5S2Xt+15gs1hk+JgGRk+iWuuHQfA787b9wyWHWB42hDd0CHblP6cZYR3xZkb7vZE+orS7hAilVpYZyT1E5So0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5041
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

Document xe_ggtt and ensure it is part of the built kernel docs.

v2: - Accepted all Michal's suggestions
    - Rebased on top of new set_pte per platform/wa function pointer
v3: - Typos and other acronym fixes (Michal)

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com> #v1
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 Documentation/gpu/xe/xe_mm.rst     |  15 ++++
 drivers/gpu/drm/xe/xe_ggtt.c       | 136 +++++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_ggtt_types.h |  34 ++++++--
 3 files changed, 150 insertions(+), 35 deletions(-)

diff --git a/Documentation/gpu/xe/xe_mm.rst b/Documentation/gpu/xe/xe_mm.rst
index 6c8fd8b4a466..95864a4502dd 100644
--- a/Documentation/gpu/xe/xe_mm.rst
+++ b/Documentation/gpu/xe/xe_mm.rst
@@ -7,6 +7,21 @@ Memory Management
 .. kernel-doc:: drivers/gpu/drm/xe/xe_bo_doc.h
    :doc: Buffer Objects (BO)
 
+GGTT
+====
+
+.. kernel-doc:: drivers/gpu/drm/xe/xe_ggtt.c
+   :doc: Global Graphics Translation Table (GGTT)
+
+GGTT Internal API
+-----------------
+
+.. kernel-doc:: drivers/gpu/drm/xe/xe_ggtt_types.h
+   :internal:
+
+.. kernel-doc:: drivers/gpu/drm/xe/xe_ggtt.c
+   :internal:
+
 Pagetable building
 ==================
 
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index add14f3dea1f..dd5cd0df705c 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -30,6 +30,39 @@
 #include "xe_wa.h"
 #include "xe_wopcm.h"
 
+/**
+ * DOC: Global Graphics Translation Table (GGTT)
+ *
+ * Xe GGTT implements the support for a Global Virtual Address space that is used
+ * for resources that are accessible to privileged (i.e. kernel-mode) processes,
+ * and not tied to a specific user-level process. For example, the Graphics
+ * micro-Controller (GuC) and Display Engine (if present) utilize this Global
+ * address space.
+ *
+ * The Global GTT (GGTT) translates from the Global virtual address to a physical
+ * address that can be accessed by HW. The GGTT is a flat, single-level table.
+ *
+ * Xe implements a simplified version of the GGTT specifically managing only a
+ * certain range of it that goes from the Write Once Protected Content Memory (WOPCM)
+ * Layout to a predefined GUC_GGTT_TOP. This approach avoids complications related to
+ * the GuC (Graphics Microcontroller) hardware limitations. The GuC address space
+ * is limited on both ends of the GGTT, because the GuC shim HW redirects
+ * accesses to those addresses to other HW areas instead of going through the
+ * GGTT. On the bottom end, the GuC can't access offsets below the WOPCM size,
+ * while on the top side the limit is fixed at GUC_GGTT_TOP. To keep things
+ * simple, instead of checking each object to see if they are accessed by GuC or
+ * not, we just exclude those areas from the allocator. Additionally, to simplify
+ * the driver load, we use the maximum WOPCM size in this logic instead of the
+ * programmed one, so we don't need to wait until the actual size to be
+ * programmed is determined (which requires FW fetch) before initializing the
+ * GGTT. These simplifications might waste space in the GGTT (about 20-25 MBs
+ * depending on the platform) but we can live with this. Another benefit of this
+ * is the GuC bootrom can't access anything below the WOPCM max size so anything
+ * the bootrom needs to access (e.g. a RSA key) needs to be placed in the GGTT
+ * above the WOPCM max size. Starting the GGTT allocations above the WOPCM max
+ * give us the correct placement for free.
+ */
+
 static u64 xelp_ggtt_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
 				   u16 pat_index)
 {
@@ -164,12 +197,16 @@ static const struct xe_ggtt_pt_ops xelpg_pt_wa_ops = {
 	.ggtt_set_pte = xe_ggtt_set_pte_and_flush,
 };
 
-/*
- * Early GGTT initialization, which allows to create new mappings usable by the
- * GuC.
- * Mappings are not usable by the HW engines, as it doesn't have scratch /
+/**
+ * xe_ggtt_init_early - Early GGTT initialization
+ * @ggtt: the &xe_ggtt to be initialized
+ *
+ * It allows to create new mappings usable by the GuC.
+ * Mappings are not usable by the HW engines, as it doesn't have scratch nor
  * initial clear done to it yet. That will happen in the regular, non-early
- * GGTT init.
+ * GGTT initialization.
+ *
+ * Return: 0 on success or a negative error code on failure.
  */
 int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 {
@@ -194,29 +231,6 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 	if (IS_DGFX(xe) && xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
 		ggtt->flags |= XE_GGTT_FLAGS_64K;
 
-	/*
-	 * 8B per entry, each points to a 4KB page.
-	 *
-	 * The GuC address space is limited on both ends of the GGTT, because
-	 * the GuC shim HW redirects accesses to those addresses to other HW
-	 * areas instead of going through the GGTT. On the bottom end, the GuC
-	 * can't access offsets below the WOPCM size, while on the top side the
-	 * limit is fixed at GUC_GGTT_TOP. To keep things simple, instead of
-	 * checking each object to see if they are accessed by GuC or not, we
-	 * just exclude those areas from the allocator. Additionally, to
-	 * simplify the driver load, we use the maximum WOPCM size in this logic
-	 * instead of the programmed one, so we don't need to wait until the
-	 * actual size to be programmed is determined (which requires FW fetch)
-	 * before initializing the GGTT. These simplifications might waste space
-	 * in the GGTT (about 20-25 MBs depending on the platform) but we can
-	 * live with this.
-	 *
-	 * Another benifit of this is the GuC bootrom can't access anything
-	 * below the WOPCM max size so anything the bootom needs to access (e.g.
-	 * a RSA key) needs to be placed in the GGTT above the WOPCM max size.
-	 * Starting the GGTT allocations above the WOPCM max give us the correct
-	 * placement for free.
-	 */
 	if (ggtt->size > GUC_GGTT_TOP)
 		ggtt->size = GUC_GGTT_TOP;
 
@@ -262,6 +276,12 @@ static void xe_ggtt_initial_clear(struct xe_ggtt *ggtt)
 	mutex_unlock(&ggtt->lock);
 }
 
+/**
+ * xe_ggtt_init - Regular non-early GGTT initialization
+ * @ggtt: the &xe_ggtt to be initialized
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
 int xe_ggtt_init(struct xe_ggtt *ggtt)
 {
 	struct xe_device *xe = tile_to_xe(ggtt->tile);
@@ -382,6 +402,18 @@ void xe_ggtt_deballoon(struct xe_ggtt *ggtt, struct drm_mm_node *node)
 	mutex_unlock(&ggtt->lock);
 }
 
+/**
+ * xe_ggtt_insert_special_node_locked - Locked version to insert a &drm_mm_node into the GGTT
+ * @ggtt: the &xe_ggtt where node will be inserted
+ * @node: the &drm_mm_node to be inserted
+ * @size: size of the node
+ * @align: alignment constrain of the node
+ * @mm_flags: flags to control the node behavior
+ *
+ * To be used in cases where ggtt->lock is already taken.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
 int xe_ggtt_insert_special_node_locked(struct xe_ggtt *ggtt, struct drm_mm_node *node,
 				       u32 size, u32 align, u32 mm_flags)
 {
@@ -389,6 +421,15 @@ int xe_ggtt_insert_special_node_locked(struct xe_ggtt *ggtt, struct drm_mm_node
 					  mm_flags);
 }
 
+/**
+ * xe_ggtt_insert_special_node - Insert a &drm_mm_node into the GGTT
+ * @ggtt: the &xe_ggtt where node will be inserted
+ * @node: the &drm_mm_node to be inserted
+ * @size: size of the node
+ * @align: alignment constrain of the node
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
 int xe_ggtt_insert_special_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
 				u32 size, u32 align)
 {
@@ -402,6 +443,11 @@ int xe_ggtt_insert_special_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
 	return ret;
 }
 
+/**
+ * xe_ggtt_map_bo - Map the BO into GGTT
+ * @ggtt: the &xe_ggtt where node will be mapped
+ * @bo: the &xe_bo to be mapped
+ */
 void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 {
 	u16 cache_mode = bo->flags & XE_BO_FLAG_NEEDS_UC ? XE_CACHE_NONE : XE_CACHE_WB;
@@ -449,17 +495,39 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 	return err;
 }
 
+/**
+ * xe_ggtt_insert_bo_at - Insert BO at a specific GGTT space
+ * @ggtt: the &xe_ggtt where bo will be inserted
+ * @bo: the &xe_bo to be inserted
+ * @start: address where it will be inserted
+ * @end: end of the range where it will be inserted
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
 int xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 			 u64 start, u64 end)
 {
 	return __xe_ggtt_insert_bo_at(ggtt, bo, start, end);
 }
 
+/**
+ * xe_ggtt_insert_bo - Insert BO into GGTT
+ * @ggtt: the &xe_ggtt where bo will be inserted
+ * @bo: the &xe_bo to be inserted
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
 int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 {
 	return __xe_ggtt_insert_bo_at(ggtt, bo, 0, U64_MAX);
 }
 
+/**
+ * xe_ggtt_remove_node - Remove a &drm_mm_node from the GGTT
+ * @ggtt: the &xe_ggtt where node will be removed
+ * @node: the &drm_mm_node to be removed
+ * @invalidate: if node needs invalidation upon removal
+ */
 void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
 			 bool invalidate)
 {
@@ -488,6 +556,11 @@ void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
 	drm_dev_exit(idx);
 }
 
+/**
+ * xe_ggtt_remove_bo - Remove a BO from the GGTT
+ * @ggtt: the &xe_ggtt where node will be removed
+ * @bo: the &xe_bo to be removed
+ */
 void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 {
 	if (XE_WARN_ON(!bo->ggtt_node.size))
@@ -544,6 +617,13 @@ void xe_ggtt_assign(struct xe_ggtt *ggtt, const struct drm_mm_node *node, u16 vf
 }
 #endif
 
+/**
+ * xe_ggtt_dump - Dump GGTT for debug
+ * @ggtt: the &xe_ggtt to be dumped
+ * @p: the &drm_mm_printer helper handle to be used to dump the information
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
 int xe_ggtt_dump(struct xe_ggtt *ggtt, struct drm_printer *p)
 {
 	int err;
diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
index 2245d88d8f39..154de298a4e3 100644
--- a/drivers/gpu/drm/xe/xe_ggtt_types.h
+++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
@@ -13,30 +13,50 @@
 struct xe_bo;
 struct xe_gt;
 
+/**
+ * struct xe_ggtt - Main GGTT struct
+ *
+ * In general, each tile can contains its own Global Graphics Translation Table
+ * (GGTT) instance.
+ */
 struct xe_ggtt {
+	/** @tile: Back pointer to tile where this GGTT belongs */
 	struct xe_tile *tile;
-
+	/** @size: Total size of this GGTT */
 	u64 size;
 
 #define XE_GGTT_FLAGS_64K BIT(0)
+	/**
+	 * @flags: Flags for this GGTT
+	 * Acceptable flags:
+	 * - %XE_GGTT_FLAGS_64K - if PTE size is 64K. Otherwise, regular is 4K.
+	 */
 	unsigned int flags;
-
+	/** @scratch: Internal object allocation used as a scratch page */
 	struct xe_bo *scratch;
-
+	/** @lock: Mutex lock to protect GGTT data */
 	struct mutex lock;
-
+	/**
+	 *  @gsm: The iomem pointer to the actual location of the translation
+	 * table located in the GSM for easy PTE manipulation
+	 */
 	u64 __iomem *gsm;
-
+	/** @pt_ops: Page Table operations per platform */
 	const struct xe_ggtt_pt_ops *pt_ops;
-
+	/** @mm: The memory manager used to manage individual GGTT allocations */
 	struct drm_mm mm;
-
 	/** @access_count: counts GGTT writes */
 	unsigned int access_count;
 };
 
+/**
+ * struct xe_ggtt_pt_ops - GGTT Page table operations
+ * Which can vary from platform to platform.
+ */
 struct xe_ggtt_pt_ops {
+	/** @pte_encode_bo: Encode PTE address for a given BO */
 	u64 (*pte_encode_bo)(struct xe_bo *bo, u64 bo_offset, u16 pat_index);
+	/** @ggtt_set_pte: Directly write into GGTT's PTE */
 	void (*ggtt_set_pte)(struct xe_ggtt *ggtt, u64 addr, u64 pte);
 };
 
-- 
2.46.0

