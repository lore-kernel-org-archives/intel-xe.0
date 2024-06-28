Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB0BBC3065A
	for <intel-xe@archiver.kernel.org>; Fri, 28 Jun 2024 19:28:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C03410ED3B;
	Fri, 28 Jun 2024 19:28:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MKn8ZsJc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18A7E10ED35
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Jun 2024 19:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719602895; x=1751138895;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=+iNwGf/RYsB6qTVLzDD4SBSaDu7vZw8ZRgbYvhmHTAU=;
 b=MKn8ZsJceJpU+SLoN65zd6LkY94vUu9Jrx8OLEP8484O+i/y3+sDOwq5
 cOFgwiBsNEZkgWi4PQQQExz0SkuknnL3R1TEcspjV2FOXelG6FqRyOoWK
 wJigxDgnG1SzzHh31l3XilSvDH7TfgejuQLy5RZ40KiOlxIw38+Adbwby
 zLPSwsqI/kBbpDyPe4XU/kwlFPLNE+ljtG9gqdbeBfEYcMQl7Xvq/ggEP
 SgGS5QtcPzx57HIvIovgitUWV9p3/p1ikPYaIpSIMlG3x/vsiTapoDL4/
 9c6BqoRV+1udj2W0tkptwNQigmcBCY8uEKwyzdEqR9gJlfBeTruObZ0nE Q==;
X-CSE-ConnectionGUID: BAYNNs7/St+ym5blZ9yF8Q==
X-CSE-MsgGUID: 3Jx7rKXsSxaVhW4ra6iPRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="27930966"
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; d="scan'208";a="27930966"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 12:28:15 -0700
X-CSE-ConnectionGUID: w4C+nLJGSjWxuPPKMS/iWQ==
X-CSE-MsgGUID: syw+n3KURViJEOk06mXIkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; d="scan'208";a="45253687"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Jun 2024 12:28:15 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 28 Jun 2024 12:28:14 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 28 Jun 2024 12:28:14 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 28 Jun 2024 12:28:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ju6lc0cW9waTvCq0ots6RwseV0+gN/QUTUfgbJbMc+WlOqa9pzJkns4iUYko38uBETjjWpmRIBaRQc21S45+xzEi6QfigHBZ/cefJEbj8apwIOI1Ke2AY5SjBtY8YW5Y3kC1PeRS058SjXUgHjx6sgrOgOgBfc+9HSn1sW7RPZmdbQL7uTJmkbC2P9++84s+TwW5hAOes2xWp2dABNEEsIa4RMrz7odwbf9QT2bJC+kVbCVuWFfeAz5aISodTRbqsNqTq1DigJqcjyoRIL/9ZB2YRJ46WIy+YFpnFIMvhLEVPv7UXXD822xEGzLEorKIndMmq+KPgKoTMXkiHUkDBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hXikQOdk7Z3pcJKsy2pLOSgRzbizWffYqLHwgtXmI2E=;
 b=UTBDeRFB2x6IQ4te7BMl3phW395Qi8T0fDPPsQW5+YYRAZ0HVS7NnXdFSJRtmUI9IVOK9EVWgunv5y9QFH3eVjAWx4MEXhEcsu75EAjz0iVMAm8LjpjYCHZNx54ZS47TkrrRGQyZZ+mjV1kx6M9IanmhZ9zvuJFhDaYWETA8MKSUAdi58ecfmWylABPY6R7YIPkLufbFkPDn0CkKbOyco+5+9MPjgGe3I4KZKrk3/jVHfySHsHrjjeoDmbXwOZ3X9seZwpz+63ycXUiE0pX/JtkPEhEcec4LVCfcrj+i4voAtJYyy7ed/7WUYzfzGnhrfQ5SXSTz0jVrRGaoXyFLLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by DS0PR11MB7483.namprd11.prod.outlook.com (2603:10b6:8:147::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.26; Fri, 28 Jun
 2024 19:28:09 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7698.033; Fri, 28 Jun 2024
 19:28:08 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [RFC 02/12] drm/xe: Introduce GGTT documentation
Date: Fri, 28 Jun 2024 15:27:43 -0400
Message-ID: <20240628192753.386137-3-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240628192753.386137-1-rodrigo.vivi@intel.com>
References: <20240628192753.386137-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0086.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::27) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|DS0PR11MB7483:EE_
X-MS-Office365-Filtering-Correlation-Id: 83d328d2-81c2-48b8-f389-08dc97a870ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LgkhIQzvFYWnT8Vlqeb2VjTHX5krg3KhMnXhLClljpLs4QynoLBvgsYqLRDR?=
 =?us-ascii?Q?bFoS7o5rS4uMPFI6a5CXljh6G8UhMS6T+5QQfHriln/nG8d//sJLjQ6LmihR?=
 =?us-ascii?Q?kCX57MBJAZr2HuiCydkoBpyPBWt0pMhKjPj3mI+G9xPfm4v3yuuXen0NQvU3?=
 =?us-ascii?Q?EOFXhnUnHJisbGt0Wk7/cuaio7sP8RDH4a1KP6rGGmJ76JhsQivB8sUDpsHA?=
 =?us-ascii?Q?+D+QlvbD3a0Xg2fUg7Vs0GfpjcvqhT1P6deMLT3rw3XZ8c/PBtMsqkhk6wLC?=
 =?us-ascii?Q?Ob5QCN8OfH2xCdcc65FhN5E26FrlYgBWCv1+oZUq5frJv6RAyLjFrE7R3TOH?=
 =?us-ascii?Q?VYTCUMqoXbuFLrlypAtE1dLm5009kfY/fZMdVH10Vl7m8kq+LxhyWX5gTvBZ?=
 =?us-ascii?Q?85u02tj7BA0Si8c+mY7VsH4bsjcxYVwuijNiGTGHHiVt/QePiOlaTqEVcYgR?=
 =?us-ascii?Q?GfJ9CXOOMLWvIqJt+9cbHIZB7HvikAzPI4qG8ifTuBEpi/6kjS1ov9caqM/c?=
 =?us-ascii?Q?zvScNVNA7WfWUOnldT/xXbpVK51MJmsTuTgghaFjqaweyJdtRJn6Rwnzuzjy?=
 =?us-ascii?Q?98T9GAqgjiI1f3gM0Xyw253CFkgZd7jicPVdqeWNPv45mUNjjHMyvFklfNGN?=
 =?us-ascii?Q?NtsySbh3eXuMQX1PHOpRUQk6LjK2qZVnTXQ0lRVnUizqrIkjxfghZkNijyOn?=
 =?us-ascii?Q?4D9JtiSccbMRHgFc9LnE4DOqVpwKaPw+8MOZAYxNBgt+7CqsXX1LAl2PP5It?=
 =?us-ascii?Q?jNt5ofK1A6BHfxM3WFDcdaQ07A8cuf43HZRXsS+LgKJ5tBN2vtrc1SeZ1PFk?=
 =?us-ascii?Q?1edMW45AS3u22mNZCSckUiTVJyhZPFVeuuTavdXIIag7KBOiz2vh5YdoDLuB?=
 =?us-ascii?Q?UcqR8Jn0LunNWk8pIfdB3Q2n5+gehXDZvXpjEEQvugFxIgTXp9cNO0QwxXNf?=
 =?us-ascii?Q?Vc1kRqByz2M66W4fbHRR2ko15ZRWWP7Ym2AePvVycVZWYHvbWIslSz/8YSS5?=
 =?us-ascii?Q?m2sS6L0kmH+PLlkWLzqy+p9IkWz+q0bwiBVFMR8VieAI4HfueN7aSjEdcO+m?=
 =?us-ascii?Q?oxw/LYfk5+BWrTHeRZyJC+xI8I2A0QwzyyTz/rF2dBMvraNZp0a4lFee7eDl?=
 =?us-ascii?Q?QskPdW+jQexEutUHDkaH8Yb5HLB/ieIlKkFONxrQK12JUmqNuaVvnSmhU1KC?=
 =?us-ascii?Q?Q8zTkIxVS8R4+urDW2bv/6GzsDFPXUZnl/488JXxjuvpAW90JZjUbblQaxXD?=
 =?us-ascii?Q?+1dXYg93GLE6q1RjgYMVkP/iRCgnezlOEriq/RSp2zuzbPsn7+ejX5Uju2Jv?=
 =?us-ascii?Q?o/wZiS4x/hCg/bD6fXlbuTxVrKVxKPEA2Taq5qoESmSrtg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?s1y4dYwhBaWCWiFk6c3iBNGK5gLVpVA45V3rzOWyRMslTyO1tBlPb6jsdECq?=
 =?us-ascii?Q?auTIuJp/W3hiuOco9q/5PiMBgpqCoddALVp8UQWlzwM/t9bdeSYl10wWeegc?=
 =?us-ascii?Q?hLzBjz++lpF0qf8IbNiACJjG9nk4fQFtTm0WcLKDPou9E398g0GL5+oRmg0m?=
 =?us-ascii?Q?KvQT19z3qaXNhCLESo/VF9ggvVGXDwjDu1VwPVQd8q9xvgRNRu/A0VsBmzI6?=
 =?us-ascii?Q?S8lyIOSq+qRBZPqp9bspVjH/MZ7XmJmmBVJ+9b5KUDvGin0EG1+Y4AabAhEf?=
 =?us-ascii?Q?K20wl4DId4S9UVlO/eMlHHba3RWK8iGpLNZaRTI1jGvnwnicXlkmOq01jwQr?=
 =?us-ascii?Q?7iVRxQrIfIK0nKGssYULNaRam3fkv+e8rJrgLLoc+7piAQbOVji7rcgcfZcU?=
 =?us-ascii?Q?bmYCJQu1SYJFY6QvqOLg8XAxOnQRZPipo0+3Dp5NEcdUnz2jbBbxl4jrqZ1x?=
 =?us-ascii?Q?XHytYi2RZzTLT8G/al6P9I6dkOt05LewRIH5rL+d1YAKHuD5AVww8Ehb861R?=
 =?us-ascii?Q?4QNTNQXJHcaLLM0zMWq0FW+/Z/fRB/Ab0BPPtBAqUwU8Ek9SP/m8CMP8NpqO?=
 =?us-ascii?Q?nMa1GIN6INvs+KfG2T0UVhU6UWeS9cxbxIVr0W/kLxfNZqq8+JhvzkGnTB0H?=
 =?us-ascii?Q?x+kGkwdnQt0Lv9nuRA2b5RAAZ0UYO3DajjSCv+8Zz+Tmro/4Tz5vpg/yLwLl?=
 =?us-ascii?Q?lGn7BG18B2e9tRWPOYS4ItCe+eXSYoKUh11fO9nwOR7QIwPcO3I8cbAb31U8?=
 =?us-ascii?Q?UfbeteCHohyamAePNxXS1NC5BUB6YgyGAR3cc1iX5zGfnhFW58JaNVXO3F+N?=
 =?us-ascii?Q?lhakkCh/5NzhrYyu27lMsx9uYXPn8nZ7CM0KWxf836KQ/isnpDaJIMhjhIq9?=
 =?us-ascii?Q?pmiViBiXhk1vZc3eVn0zFMYxNPkQh25261LaInNbrq+lUXF9PlfY42gkllbg?=
 =?us-ascii?Q?Whu3adpFQvQcdLUpYGMF6qx6MMFeDSFUvshhDsDvCICIl/4kaWRPi05eciJP?=
 =?us-ascii?Q?uXPMidqjJRT5BpkAYUcLHvtuIJNk4GzRYkK4EfCYa6ozA/TOuqbgAr/J1RL6?=
 =?us-ascii?Q?w8R7I9beLBlnwRR6G6s6BWZz6tCdNJ0/bLpCIpaLwxhl0PObcHTfAlqdLK0R?=
 =?us-ascii?Q?FSjPfzTh6nWfER0XSrjIYFHM1mSXP9vo/ueOffSvv6Kdd91mmB1tbqtPhy/P?=
 =?us-ascii?Q?O8YXSjsgaIh5DO8hGopn172FqIwdqn+OCVzR0wcz/0y5UNdUCcsOaivvsvnt?=
 =?us-ascii?Q?xeIDpCWSgakclhdKcm+sspwgU7/9+0Cd0q/1KCg9vvstPX3vIAnx/Q95zyG7?=
 =?us-ascii?Q?q4dgosi25aJ6APmowek+YLf2tX+Pl0dBfwgz7toK5kGfvZw0HGG6pVAgDglb?=
 =?us-ascii?Q?PxhV8vIrglwqs1ILdYTD4b27gaTknCHK1y9nBoGxxC5CQoCEztAVX75hKLwY?=
 =?us-ascii?Q?o1fZW35+4hH1Ao80tZfpaSXZ1B7WVBYYZrseMlvtWI+12E7jy3KembG5f5bd?=
 =?us-ascii?Q?k2CPG8Hn/il30r5lOfeXC2yjaKxVaibYZAAIoEigMmDoyvSRPIYX04nOqGDl?=
 =?us-ascii?Q?oO4nuoM8Rr1/tbATM8JiRL/1Y4Wz4bnFApa8ycsPW+HEz2mDZElB+U4RTUMw?=
 =?us-ascii?Q?Cg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 83d328d2-81c2-48b8-f389-08dc97a870ef
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 19:28:08.6799 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YxDTpF2bQfHG3psFdqjdyWYrtXbGMu3lexn2oxCUErYqoUqKhWmxI3Xz6BuP43JfxU1okEpuG/IxaqEBFUOzTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7483
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

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com> #v1
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 Documentation/gpu/xe/xe_mm.rst     |  15 ++++
 drivers/gpu/drm/xe/xe_ggtt.c       | 136 +++++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_ggtt_types.h |  32 +++++--
 3 files changed, 148 insertions(+), 35 deletions(-)

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
index e68e74fc44c0..a7b6348bfa55 100644
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
+ * certain range of it that goes from the WOPCM (Write-Once Power Control Module)
+ * to a predefined GUC_GGTT_TOP. This approach avoids complications related to
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
+ * depending on the platform) but we can live with this. Another benifit of this
+ * is the GuC bootrom can't access anything below the WOPCM max size so anything
+ * the bootom needs to access (e.g. a RSA key) needs to be placed in the GGTT
+ * above the WOPCM max size. Starting the GGTT allocations above the WOPCM max
+ * give us the correct placement for free.
+ */
+
 static u64 xelp_ggtt_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
 				   u16 pat_index)
 {
@@ -161,12 +194,16 @@ static const struct xe_ggtt_pt_ops xelpg_pt_wa_ops = {
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
@@ -191,29 +228,6 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
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
 
@@ -257,6 +271,12 @@ static void xe_ggtt_initial_clear(struct xe_ggtt *ggtt)
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
@@ -377,6 +397,18 @@ void xe_ggtt_deballoon(struct xe_ggtt *ggtt, struct drm_mm_node *node)
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
@@ -384,6 +416,15 @@ int xe_ggtt_insert_special_node_locked(struct xe_ggtt *ggtt, struct drm_mm_node
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
@@ -397,6 +438,11 @@ int xe_ggtt_insert_special_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
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
@@ -444,17 +490,39 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
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
@@ -483,6 +551,11 @@ void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
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
@@ -539,6 +612,13 @@ void xe_ggtt_assign(struct xe_ggtt *ggtt, const struct drm_mm_node *node, u16 vf
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
index 2245d88d8f39..4e2114201b35 100644
--- a/drivers/gpu/drm/xe/xe_ggtt_types.h
+++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
@@ -13,30 +13,48 @@
 struct xe_bo;
 struct xe_gt;
 
+/**
+ * struct xe_ggtt - Main GGTT struct
+ * In general, each tile can contains its own GGTT instance.
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
2.45.1

