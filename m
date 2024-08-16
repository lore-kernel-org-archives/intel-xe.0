Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5819BC531DC
	for <intel-xe@archiver.kernel.org>; Fri, 16 Aug 2024 15:03:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20CE110E7E9;
	Fri, 16 Aug 2024 15:03:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KS0+l/fZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48A6610E7E8
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Aug 2024 15:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723820597; x=1755356597;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=7kX0GwVjQ5y557raWwm1xU+GiTUNkJV21VQ2XwxSVlA=;
 b=KS0+l/fZ+gyuRVRQaRiqqlKJGnKbQORen15/64dJI3sazxcfRQRXyVGD
 BGY1MDIf5KQDG36mtMAp+L2w1tY2uQRRp8o4AnYaxiBj1UVQ+FrTJJVrj
 mu3iw0kf2OFWeFGT50s7cbCUgy1heL+62M0rK73lqBImSkGpm7G6Z8ucw
 +FalF6at+VL8nm7uyBFHRssxjz8PdvJCHCAgbyuOhVXggtq6uf0zErLjD
 L2GmMgIPu88wyZO384Gsajxgizb6VjjseIOveET4flWLXQVbm3MU4sI5/
 2i+qbW90HrEZjUpcvG3Tnsq38NJT63yRLyPY2ukby4cVhmNXeDTYJNRA7 w==;
X-CSE-ConnectionGUID: YiftDvtETzCxf4I+2do2xg==
X-CSE-MsgGUID: fPKvHTfCTCynCwFfbE4nZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="33269047"
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; d="scan'208";a="33269047"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 08:03:17 -0700
X-CSE-ConnectionGUID: dUw8VPlETAimwNyTGj1ejA==
X-CSE-MsgGUID: PSqbmIzeSUChuWmMK4RZ0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; d="scan'208";a="64360142"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Aug 2024 08:03:17 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 16 Aug 2024 08:03:16 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 16 Aug 2024 08:03:16 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 16 Aug 2024 08:03:16 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 16 Aug 2024 08:03:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BMBSPfYNRmGqkMkuyyt0MnDdwWpGyoJfVUAjpsCT5tje+uTXCS/JJZowXK6KUti/ASXkEHlkPcH/gYwLcbMI5bQfnf24gEwmZmAsRqc8Ejfd2SusLR7S3anlEq1rcpxx2vAo2SOwfptbUDOdG6eNcIZehEmytiYDKX9paf1+g6pg1NazdXt/+9LL6rygnWNGx9CLSSomS4dTfmxgaBAuKYxE7x3Oy93ceujR6f6c8X5ZDpTCqXuNhbgIfWjY9Zpa8KkKgDpXj4RSzEpI9Y5WXQvASIF/1RuNYKOoSwte0JSrKiX+4R/dkih947xehq5hKc9C4VH8b+BWbugyeVp5GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nxaM2/xb/CH0YB12J/dhVCOCtzobKdI3ZRJw85bNLIg=;
 b=Dwal4X/hLAMPIHWr/6eEwdBKpDJpVK2mFdTTcpXU+9cIpvHWaw1tSlvrANOcc4DMXV8OO7MRn5zn1+4Hx8Qh2cxsJzoRDHy66FeSe7U8KfB3/lkXi5OWTsOEUmL1dUoD57vVm05hA2vF+WFqxDVQ9Ci7Zh+uQBt0qQt2Ep0qtPJ0568w3sw+x/NiShteUQuXDxK5L6kPK37aThhLscvvEp9WsHw7PuyESnVl9f1HHzUkPHLYczwwwEEmp20CRORKmvdJCWRYf7HiM2lIy58s6IjFDD8JqrHQ3OWW/zQihuj1ODlDiTaJxkM9IrSf2MZbM9xb5Y61DnQ1kbakiYNKAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by LV3PR11MB8554.namprd11.prod.outlook.com (2603:10b6:408:1bb::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.33; Fri, 16 Aug
 2024 15:03:10 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7828.023; Fri, 16 Aug 2024
 15:03:10 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <lucas.demarchi@intel.com>, <jose.souza@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 10/12] drm/xe: Rename xe_ggtt balloon functions to make the
 node clear
Date: Fri, 16 Aug 2024 11:02:41 -0400
Message-ID: <20240816150243.87596-10-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240816150243.87596-1-rodrigo.vivi@intel.com>
References: <20240816150243.87596-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0219.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::14) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|LV3PR11MB8554:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ac02e0f-6168-4cf5-a374-08dcbe048b32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LIQztqhBfex5w3pKE7y30+uBNFFzpQ01WgduAZ43sbD6Yx73Kg78XT65tyC4?=
 =?us-ascii?Q?f6lUNZLStK8MpJX4wp8VRKp33dGril1UrxFDFdNtH8qSwg+/JKnodDquAhtR?=
 =?us-ascii?Q?Dh3simCLv6DBGi885ynJgEuOVoRxBjh2EkxMVp+DeWu9SPl60RrGXLx/BoZu?=
 =?us-ascii?Q?NBjCYkHbIEQqsFk7nMcmCawg9J+iM2J2417ZB7Xr4Q2OPiFQKNJkNe1GjxbE?=
 =?us-ascii?Q?xrhVTEPVUBxQ0rN23K1ct890Aqj0sP3Woyroy0VMz2Rfc3fk1fPns8mfPYUW?=
 =?us-ascii?Q?5BT6FdGy31uPibVzGTZbuixIJ+Ot3ssVQQh/HCnE/7ViyDSW1odOhHAyR2uI?=
 =?us-ascii?Q?MzrXkJU1iDveVqLiJVgAhqB9EhEDh+qWdKMP+0YLcjToD2+YX2FDBbZkSc5p?=
 =?us-ascii?Q?At41BW6CNv/v3PluzdWq7e+dGaLWbSfsm6Q0k4VJSVuITWh5apXDnRzl4iV5?=
 =?us-ascii?Q?d6hC7CwR+CqGMcZ7k2VwE2YWtoBGEhJycEosWZjPkFyGDjfoDkaxpM8OZ8/r?=
 =?us-ascii?Q?5tFyGbWwmX6QvxIcZiQYpP0ToBNvOrumWiAT4O9pAmJMZVZz1LiSBafoPefP?=
 =?us-ascii?Q?t2OcQXoYudwiVTLQBNucLf80oQc8ZolEAjooDXObgFl57qd4DrlSYgrJ2/RR?=
 =?us-ascii?Q?X0R79xYuCL2FdVfaE5uh/FSvUfKbdZlYpTHqF3Q3VBETIWVMywN+pjcLDHoa?=
 =?us-ascii?Q?/ytWuJm83eXW7TxBwTyaDV6DfgvXh1u8ratP0R6YKDBv+ODUHJBJTjfnqx8a?=
 =?us-ascii?Q?/sirLsSZoBcXRcM72cRHL4g8pIRaoSWfVZcq4sH9H670pUzLM2xzXDIHcuGM?=
 =?us-ascii?Q?3QcI9q/nTTs9R3QxQbUgK9Suez0ef3qSBR1iqHBtaxyjObSAZTeW4+HMtn9C?=
 =?us-ascii?Q?kZDZz6xGaz7D7UjvQTcl7Zq7TsYga2/T53q3RVmWBY6puU/rz0Pklc2u1Ie6?=
 =?us-ascii?Q?Ke+gjT8mzZId46CzkiU64QIdd1ND7p8CqGP+t6g2NkiPsA2vZ+gACDRFvDWq?=
 =?us-ascii?Q?v0lb1O++y4n2qGv8fKCKLE8sMoTkoBQ4DE0bh/WoMsmzLNd8U8jRFaaGHw9+?=
 =?us-ascii?Q?7ORsYfEoUjCiXabwj8c7le0mj8AKlRYsFyuHRBMPgL7FkUhf/oElNk2wlSk1?=
 =?us-ascii?Q?Zy47IOcmK2jRWHNDvSGlm7jJTDMhXq9Nv4PW6iFd75aiqnKYpCpgrzijtAyC?=
 =?us-ascii?Q?FxY09jn7V4bxiF6jPA8JBVxrabtLQ+3d1j+uwf1YZG3CmHwdhGwyhxP/hDpV?=
 =?us-ascii?Q?ZNlzCjOxIBWjWMEDwlVDQ1cJeDiLwOaTzr8NNsL7MfiTlGc5KH6hmCub71BP?=
 =?us-ascii?Q?zMN0M62/9JMqNBVs0OzfQ2mwNZtQHQW/k08n1WaqgXTa6Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tXiarcM6V0VWKETkWMuP9PIOSi/Zu4Xxl8/61lKuTCTRXsGeH/AcxexZkrf+?=
 =?us-ascii?Q?64iyUpybniODpxcQ08cI3SLAQJ9OzrsLjaetn7W1b75viVwDgk9AvLlpL/e4?=
 =?us-ascii?Q?/ooFgE2iyTg+5Aa+2RcpXcqEY/wCiK3qefGV/8fqHfXReB+eEGgb/gYyC6Xd?=
 =?us-ascii?Q?Qmkikx73BmHtCekvVsVsTBba55EdMZ3pfD5XnyLPprn4SDBLitzes+as1cTB?=
 =?us-ascii?Q?qnp2slELdpwZzCbO4u3D0p8UwG7M5eo1/DH/8ckgFq4o4JH1wzPMnGCNz8hC?=
 =?us-ascii?Q?RJbVpaE0k8Gj+pUZhmPhgDdWftcnf7BYtDyFS7GeDcyuG5pRBAllw+WaXXT2?=
 =?us-ascii?Q?SJPvQqQYzPKBspAstCBEBoCYyWJg7UYc5kVem3pCFtaGHT3Ad0pQQZn55IYs?=
 =?us-ascii?Q?TceZ9n7T8RdBEUf7sJcjs+Fzk/p8uJb8SSxOKxuu1Uy7DAnPG9ZxnuHuxpRC?=
 =?us-ascii?Q?3Briy1qW07y9tBoHbRRnQu97jTHNKGAdApr9skhr9V83B66L0SDI1YwtY2Mi?=
 =?us-ascii?Q?1t8kdmjpULQO/Vn4CQFlrPjIqHljwn9tuLquPUfTGfY20bTllHABDCV6BvQH?=
 =?us-ascii?Q?bsgADzKpCNn+uSJjU+K/xjbovErp8vHfYEruT4XbVK1lbGkKS7TDJ+8BUxKr?=
 =?us-ascii?Q?NmHVInLCqK9riqbzGHc0CEpDVrcwo7DuG37LecVV1vwWBPCLP96CgArRrr4R?=
 =?us-ascii?Q?Xg1suZua1hJJZzvVQ0Jm2cl/OCX5Yyy96Lji8YYoK4CJ7+DfmYNKtTV+HKfb?=
 =?us-ascii?Q?WitvA7/hzxMZLMVr0bX9A3YurZVO3AvBnIVlTV9+TacEWw1g61blk+JR6r2a?=
 =?us-ascii?Q?uMIwCLhj4YO9BAnnlo6Gu8n8b+74oDB2L9uHquQQscQXG/hhvNqmJXnYqHll?=
 =?us-ascii?Q?rJc1BKbetRCNaUJP+DTJZCCGtbOk8tupDCPb6g7gGslpnRLVtnqb4MnfRIKy?=
 =?us-ascii?Q?e/X9ll9/b6D/KRbuMwLv3ZaOunfS0fY9hdIOPgNXHuEXKhfYJUaM7ljgUtSI?=
 =?us-ascii?Q?hMwX73nRtCQGS9x+LYsxNn8BNZTgZ11b1FmtH3MqPClsYpbyyXRZQRe98SmD?=
 =?us-ascii?Q?meqaBdtu3UEANTvXwv/tpBA6IUOoIIl8zjNPNLVWWnUk5EZ43vO9XgLtSIsm?=
 =?us-ascii?Q?jbzvnIJjOP+PNFO/oXHfcZVblYsM4qk9jwJovBumqaidm0GQGEuDgFe6GGRc?=
 =?us-ascii?Q?9FKLZMzYC8y2rgH46DVXlmh0A/pjg47PG3IPd+peWGp1Fv3Ikw5Y2NRbvM7J?=
 =?us-ascii?Q?XtGD/D/TQgEP7NFhNaRwlTG9WB64Vmyv+IVJ1Kxgcu0Mw3X4hE78uz0KQlQd?=
 =?us-ascii?Q?DTVDnn58wFn+MekbrvWFaGCHQ6PJwkg1cMUVSGDg6HfxXqegw418FkWY33oF?=
 =?us-ascii?Q?d4NOH+BBbmNhOpT00TWc2fglfcEMJcmorxoDna8nEqmospY9kCWiO8fVOpgN?=
 =?us-ascii?Q?vC0v+EVpqBe9Xmv0MFHEhmGfAO/OiWQ3v3CcrVQnVi2FAo+cryPju4qQrYte?=
 =?us-ascii?Q?L9rX0xi2gFaMJcGVSdXMex7vb4TdwsArUeFCpXwLF+w9pACsXvCez/RQTAn+?=
 =?us-ascii?Q?QAxh9peROSAUbBwZQFXlvoamH/P05QJyMi3TWVxS?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ac02e0f-6168-4cf5-a374-08dcbe048b32
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2024 15:03:10.6824 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ct8tl9zgTwMBvJoUoSyXkL0wZdUVx8fE00hmAcs7Eb82LHIvPZmqHpIy9xvHl63Hgb9q026C0yYhLsSnWTZb1g==
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

These operations are related to node. Convert them to the
new appropriate name space xe_ggtt_node.

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c        | 12 ++++++------
 drivers/gpu/drm/xe/xe_ggtt.h        |  4 ++--
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 10 +++++-----
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 960f5a28b7ed..05c3e6e929ae 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -347,17 +347,17 @@ static void xe_ggtt_dump_node(struct xe_ggtt *ggtt,
 }
 
 /**
- * xe_ggtt_balloon - prevent allocation of specified GGTT addresses
+ * xe_ggtt_node_balloon - prevent allocation of specified GGTT addresses
  * @ggtt: the &xe_ggtt where we want to make reservation
  * @start: the starting GGTT address of the reserved region
  * @end: then end GGTT address of the reserved region
  * @node: the &xe_ggtt_node to hold reserved GGTT node
  *
- * Use xe_ggtt_deballoon() to release a reserved GGTT node.
+ * Use xe_ggtt_node_deballoon() to release a reserved GGTT node.
  *
  * Return: 0 on success or a negative error code on failure.
  */
-int xe_ggtt_balloon(struct xe_ggtt *ggtt, u64 start, u64 end, struct xe_ggtt_node *node)
+int xe_ggtt_node_balloon(struct xe_ggtt *ggtt, u64 start, u64 end, struct xe_ggtt_node *node)
 {
 	int err;
 
@@ -384,13 +384,13 @@ int xe_ggtt_balloon(struct xe_ggtt *ggtt, u64 start, u64 end, struct xe_ggtt_nod
 }
 
 /**
- * xe_ggtt_deballoon - release a reserved GGTT region
+ * xe_ggtt_node_deballoon - release a reserved GGTT region
  * @ggtt: the &xe_ggtt where reserved node belongs
  * @node: the &xe_ggtt_node with reserved GGTT region
  *
- * See xe_ggtt_balloon() for details.
+ * See xe_ggtt_node_balloon() for details.
  */
-void xe_ggtt_deballoon(struct xe_ggtt *ggtt, struct xe_ggtt_node *node)
+void xe_ggtt_node_deballoon(struct xe_ggtt *ggtt, struct xe_ggtt_node *node)
 {
 	if (!drm_mm_node_allocated(&node->base))
 		return;
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index 67ae5f1602a3..e68cede2e6b5 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -13,8 +13,8 @@ struct drm_printer;
 int xe_ggtt_init_early(struct xe_ggtt *ggtt);
 int xe_ggtt_init(struct xe_ggtt *ggtt);
 
-int xe_ggtt_balloon(struct xe_ggtt *ggtt, u64 start, u64 size, struct xe_ggtt_node *node);
-void xe_ggtt_deballoon(struct xe_ggtt *ggtt, struct xe_ggtt_node *node);
+int xe_ggtt_node_balloon(struct xe_ggtt *ggtt, u64 start, u64 size, struct xe_ggtt_node *node);
+void xe_ggtt_node_deballoon(struct xe_ggtt *ggtt, struct xe_ggtt_node *node);
 
 int xe_ggtt_node_insert(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
 			u32 size, u32 align);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 47222bd9988d..9a1be23ae71d 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -528,7 +528,7 @@ static int vf_balloon_ggtt(struct xe_gt *gt)
 	start = xe_wopcm_size(xe);
 	end = config->ggtt_base;
 	if (end != start) {
-		err = xe_ggtt_balloon(ggtt, start, end, &tile->sriov.vf.ggtt_balloon[0]);
+		err = xe_ggtt_node_balloon(ggtt, start, end, &tile->sriov.vf.ggtt_balloon[0]);
 		if (err)
 			goto failed;
 	}
@@ -536,7 +536,7 @@ static int vf_balloon_ggtt(struct xe_gt *gt)
 	start = config->ggtt_base + config->ggtt_size;
 	end = GUC_GGTT_TOP;
 	if (end != start) {
-		err = xe_ggtt_balloon(ggtt, start, end, &tile->sriov.vf.ggtt_balloon[1]);
+		err = xe_ggtt_node_balloon(ggtt, start, end, &tile->sriov.vf.ggtt_balloon[1]);
 		if (err)
 			goto deballoon;
 	}
@@ -544,7 +544,7 @@ static int vf_balloon_ggtt(struct xe_gt *gt)
 	return 0;
 
 deballoon:
-	xe_ggtt_deballoon(ggtt, &tile->sriov.vf.ggtt_balloon[0]);
+	xe_ggtt_node_deballoon(ggtt, &tile->sriov.vf.ggtt_balloon[0]);
 failed:
 	return err;
 }
@@ -555,8 +555,8 @@ static void deballoon_ggtt(struct drm_device *drm, void *arg)
 	struct xe_ggtt *ggtt = tile->mem.ggtt;
 
 	xe_tile_assert(tile, IS_SRIOV_VF(tile_to_xe(tile)));
-	xe_ggtt_deballoon(ggtt, &tile->sriov.vf.ggtt_balloon[1]);
-	xe_ggtt_deballoon(ggtt, &tile->sriov.vf.ggtt_balloon[0]);
+	xe_ggtt_node_deballoon(ggtt, &tile->sriov.vf.ggtt_balloon[1]);
+	xe_ggtt_node_deballoon(ggtt, &tile->sriov.vf.ggtt_balloon[0]);
 }
 
 /**
-- 
2.46.0

