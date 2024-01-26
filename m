Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 047C7C47422
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jan 2024 15:53:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D9F010FBC6;
	Fri, 26 Jan 2024 15:53:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F192F10FBC6
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jan 2024 15:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706284435; x=1737820435;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=GjEW/xgJCpk1HjBx9dfNjCdN05Ao6NeyIVZU1B1/hZw=;
 b=Oint4J97hK8Iqpgcb9w872zM75VloIkuXOJjqf/lZP9PZ+kbFPD4CCrb
 4ATvvQ4F6YmSF0bVsrDXF5daIEeZMKnWlkf/Oj6Pq8KsQiqv5jqLedqSt
 tjWtS+D6k7NfjlgMzpEamWXhSVAzQiuEkfq278dEu7WGXIB6sdpSSYyMj
 aXt7isZI7gXR63xiBTN6bMX1ZE94WBH9DgaxLxDOmmxn/mvteLiDVtd5J
 eZCfsmlrfitH645rGAGzdNbnzpbkgq7zi/VEVI0WusQ6FdRBcHuQUeudx
 NVdeyyjnevCSn/84fpbSO34oPPJy9HSmAAY8GQM4nalcqk0/7cP09DErZ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="9611616"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="9611616"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 07:53:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="28863908"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jan 2024 07:53:54 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Jan 2024 07:53:53 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 26 Jan 2024 07:53:53 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 26 Jan 2024 07:53:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ecCHR5g7jOgQ0QOxm0qvyuNmY3hwamVJYwmdFCO7JfydYyqG+yecovBjsK85FquozZ+eNcuvuMdTL30vPoRXvF7YAndYFATX18G3bWh+/LPirXNMHAi/UPATUqYfEXnsvUZSBrAPU0OOwFB/R6tuxzYMlQ1J5m3tAQS2UJAnXsXmKxDqYLHr7bO6wWPwXCM9jHBl2hwwSSfel6yJJd1NUTWoqag9SvWEMULkoh7df+TEc0iD6p9xtpxE0TAGlZaYNwq3v3FxV3p024Qh/4A9E6Pekzhb8N7IozUkmPHe1ZJ5YAcZAel9yb4Q8OF/xQWjjBjFlqy7A8CqLJ8AzFs3OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4x2ObHI85QDOKLFaE6Cl90XJXy3uJ6wCmvXji1lqv2k=;
 b=LrTWZSvxFU9K7cJDQ0bDv5JBOaQRSUnU6o7WaDZYAKoy8KYf0844A1mSP6hjLtyVziD+jlJRTErEgExViPRwkFfd5oflz/J067xiye+jl0zQKlxPR6oMuo0VRj1xJRyEOP9mRBqBIpmhlUnvxDeWJjV1MA5r3vnYgsC+NfBuIE8CT3xo3qMmqNhjfWaBdf6EqvyrOaBIcd5z2JRPGisvMZ/F3STinjb6PHOVJbyhMZ/G+pkLzpoeId034OLj0m1hMSi+oqGCkgL95+Z2d6y2WgN97SGbuaq5jR1uNCx4He6uYI/tB/2XzHlGyUqwO0LvtbfNzdaH8jGzZxpiCbFYJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH8PR11MB8061.namprd11.prod.outlook.com (2603:10b6:510:250::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Fri, 26 Jan
 2024 15:53:51 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7228.027; Fri, 26 Jan 2024
 15:53:51 +0000
Date: Fri, 26 Jan 2024 09:53:47 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Subject: Re: [PATCH] drm/xe: Add L3 bank and node masks to topology query
Message-ID: <dh3ndb2b5efrcsgqxn3auzrgvn2pwa3x55pakjkcvdf5lml44e@i7dourwtt56q>
References: <20240126153840.7-1-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240126153840.7-1-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0PR03CA0292.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::27) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH8PR11MB8061:EE_
X-MS-Office365-Filtering-Correlation-Id: e65f5dce-a6b5-43d6-ae46-08dc1e86fdb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NTnKlGpCzQsqFfoQ7AS6+d54szFCeizRluFtZpMjQLhZpO6yzoLsAzNJXm/vkiYH4Tb/oArC2s9PSFyucUXeHpR6/aZ5pt8WCRhwgLXENfN2x+e0AjnJHixsiyGso0fcaodsGjycRGlgs7JixZt9zzTZJsy6Zi+l27lUPbKsqyME/ITzfUDM8Xq9vQ6wd29viyENx3qMjBaxVqJX3vKsc0r5gKTpsKVSo/GZfgN7mYpFK6WTIV1gjmzwPiIuKV/sVQqlZA7e3DJqP8T2vSIiypBq0oIVQ6fU+CdAsHO8mw/1jRpyEXpy2RZWbUOULkR3zX73z2P6g4wZyV/Jioi6QjPe75X5vSRWB+tvKJftzS7Rx2O9ND3pl38wcnGRqQo5qzzQvtW5seV3tZAcJtIrFQngi6+SqeKgK0Kd/jtoRAOJ6c6kyjVZsTpsE9a/U8hFE3I4E8hKrtN8+k9aij5OgYbURLZp/1kep/0x8gPclTPeJUvRVRIP+buJiHSYwfw16i4DuvGL03iqiVCRrCVYYKoE8G2Qfnq1b2K7hCbYRjiWjHPEdUi71vrt4u1BPJ0V
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(396003)(366004)(136003)(39860400002)(346002)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(83380400001)(5660300002)(38100700002)(26005)(6862004)(478600001)(8936002)(82960400001)(6636002)(4326008)(66946007)(54906003)(66476007)(66556008)(316002)(86362001)(8676002)(15650500001)(2906002)(6486002)(107886003)(6512007)(6506007)(6666004)(33716001)(9686003)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?N4seq5qFIrMwMgXhewvotwezEhOydoqjsNuCW31boXc++6VN81ub3Y234oz0?=
 =?us-ascii?Q?5Z+9T7hWyrGxRAkOsTycYSFFk4vtOmIjmVSSEY6NHjc82QUfiln6IPiKP00R?=
 =?us-ascii?Q?I5Ddeakst5fxL9Iz7ApYswDmwbjf4+CU7p3Hm4dF6fw78FpQ7tkEGsSLH3TS?=
 =?us-ascii?Q?gUjqIIF8yGT0dboLQfUo/i5AZkSdmFWjhmQv5pCML3ODxuym5hFMlsdsKkL2?=
 =?us-ascii?Q?Y65Nspc5iGzTZJl8BtERtxFEb/3rbuVXEevbJVR/RlI8hQ+MKn/LsXM+IgOK?=
 =?us-ascii?Q?xLjvA7xhaExuA2zxFBUSFZn5hJPjA/N7mG/I4SVNX+Gnpnp8Ui0pNHeyPXN5?=
 =?us-ascii?Q?zeVWRQlG+bheGJANjPO/HUH3raSvWoTx/s2FVSLjnU/wz92zhCmPm03mpTpm?=
 =?us-ascii?Q?i8Cb1Z/D/u5OGB5oSeyPJPeu3zSsLlTGo6O7OyXS78cNZ9+E4QLY2bt8TFTK?=
 =?us-ascii?Q?CI1P/QD6X1nLLn3w3A9HbnVR346Wl30Sb3cvAWNVQEIpBgSEcf1HxtsA/YqS?=
 =?us-ascii?Q?ihs5qTlMs5W4i1N+RcrkUAw7Ww8F+6cGvIOYZarV+wlzLwPV7DD2le6kpFXs?=
 =?us-ascii?Q?FcZKKV54fHJ3Hb70MMHnvg8GjBQBA4S2805BtefD1zG5YfxCF1+BPZdYd+S1?=
 =?us-ascii?Q?7aefNUj0SN8xju5xbYXGBZCbpmv6V5Rca0WpddnFnT/BYnAx+KmyNISZXNvs?=
 =?us-ascii?Q?8IkixzRK1zYtUN8ZC8R7sIotEl9uxMuOld0xqLGWuSWWIbzhDjr+pb5qPgUn?=
 =?us-ascii?Q?h5RLsGtdw93zoLtCkDaE7ZKMUiXokeoXOxnFnqn3UdLpd3QRkd6xrcrppJLV?=
 =?us-ascii?Q?iPkcmoUnKAGjMR7Wp9xtp3KXQ7q+1RRScpvcL6nj5IxYks+qJ03Kygy5MNAw?=
 =?us-ascii?Q?NkN3UWCJ7vMAnAj2q5sp0RSmxpt4b5Q1MN5caS2EyHu9JbcT4pShAEv3faHz?=
 =?us-ascii?Q?FvaVCy1G38ryE2wJFr35rzxYIaHPsps/unPFBxLpquoFxIRZ09HTnPfhLkPp?=
 =?us-ascii?Q?qMsbk7Gmbw3I6LIpTQSNAx78DxKLuPOr42JhaIkOfkxABhOrnhwJLL/OB4uz?=
 =?us-ascii?Q?KVw67hAg77z+Sc/RvDv4D2RNDRHn79oExdNEa6PNofOwXVm25XC9V4h4lvLk?=
 =?us-ascii?Q?ltmE4oLxN+jT9XP4GkOsnLZbQzvRKbAlSmy0TkjHf08J0IqMetcRMlF+yqlI?=
 =?us-ascii?Q?AYer66yTtyjBUYR+aS6WaicNe98JLZHqJhv0Qs1bluwE6uUdGKSeIULhEj2y?=
 =?us-ascii?Q?nJ72qTiQ4zqneQIoeQ5VaUP7Irzjwx/ekgmRAb3qhgkqFMnTE9oG/1rfWfGe?=
 =?us-ascii?Q?G39oSK8w/2Ud4FpHHzRQWrePqIXJqDm+T8PpGU7yloTsog5hlQ+58UrXqPVa?=
 =?us-ascii?Q?LDp3mPJmL8K93Pd87PiK0hrfA9O70McpDiZ2dn+DcHPoH1G7POn7Z6y0iO2J?=
 =?us-ascii?Q?ygg/otlJf6HyRvP7vyKntNv7aEEPQ3CkiG1rWJU/Re0fL9CN/XQH3r5x0uT+?=
 =?us-ascii?Q?rsXa2IdXZ1RHIKJiRLEfmLfXaqjwUVLen2+le02WchjpBy3kRgcNK00l7bPX?=
 =?us-ascii?Q?7bgthb11fwGmAesbP+WKm4syIP0lIxh07eKiWAmljVhLjU1JCQtSp9mheWtv?=
 =?us-ascii?Q?uw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e65f5dce-a6b5-43d6-ae46-08dc1e86fdb7
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2024 15:53:51.4083 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m4jekbW258m+VJ+n52+Skzrj6ujRPkqVLJya97kKGIaZo6Vz99ciDvJwhdQTPVdMtLCxSRHjczzdqOhbSJbG+1ItvUimvoDSwOtQBTngxsE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8061
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>, intel-xe@lists.freedesktop.org,
 Robert Krzemien <robert.krzemien@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Jan 26, 2024 at 03:38:40PM +0000, Francois Dugast wrote:
>Expose the masks of L3 banks and of L3 nodes to user space. L3 count is not
>sufficient because in some configuration not all banks are enabled, so user
>space needs to know which ones.
>
>Bspec: 52545, 52546, 62482
>Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")

these are reserved for fixes, not feature additions. Particularly ones
adding UAPI, we don't want to rush it in the current kernel.

+Matt Roper

>Signed-off-by: Francois Dugast <francois.dugast@intel.com>
>Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
>Cc: Robert Krzemien <robert.krzemien@intel.com>
>---
> drivers/gpu/drm/xe/regs/xe_gt_regs.h |  1 +
> drivers/gpu/drm/xe/xe_gt_topology.c  | 38 ++++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_gt_types.h     | 14 ++++++++--
> drivers/gpu/drm/xe/xe_query.c        | 20 +++++++++++++--
> include/uapi/drm/xe_drm.h            |  2 ++
> 5 files changed, 71 insertions(+), 4 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>index cd27480f6486..f8606649d1e2 100644
>--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>@@ -156,6 +156,7 @@
> #define	MIRROR_FUSE3				XE_REG(0x9118)
> #define   XE2_NODE_ENABLE_MASK			REG_GENMASK(31, 16)
> #define   L3BANK_PAIR_COUNT			4
>+#define   L3MODE_MASK				REG_GENMASK(7, 4)

is this supposed to be L3*N*ODE_MASK?


Lucas De Marchi

> #define   L3BANK_MASK				REG_GENMASK(3, 0)
> /* on Xe_HP the same fuses indicates mslices instead of L3 banks */
> #define   MAX_MSLICES				4
>diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
>index a8d7f272c30a..6f4cf147a7aa 100644
>--- a/drivers/gpu/drm/xe/xe_gt_topology.c
>+++ b/drivers/gpu/drm/xe/xe_gt_topology.c
>@@ -13,6 +13,8 @@
>
> #define XE_MAX_DSS_FUSE_BITS (32 * XE_MAX_DSS_FUSE_REGS)
> #define XE_MAX_EU_FUSE_BITS (32 * XE_MAX_EU_FUSE_REGS)
>+#define XE_MAX_L3_BANK_FUSE_BITS (32 * XE_MAX_L3_BANK_FUSE_REGS)
>+#define XE_MAX_L3_NODE_FUSE_BITS (32 * XE_MAX_L3_NODE_FUSE_REGS)
>
> static void
> load_dss_mask(struct xe_gt *gt, xe_dss_mask_t mask, int numregs, ...)
>@@ -62,6 +64,36 @@ load_eu_mask(struct xe_gt *gt, xe_eu_mask_t mask)
> 	bitmap_from_arr32(mask, &val, XE_MAX_EU_FUSE_BITS);
> }
>
>+static void
>+load_l3_masks(struct xe_gt *gt, xe_l3_bank_mask_t l3_bank_mask,
>+	      xe_l3_node_mask_t l3_node_mask)
>+{
>+	u32 bank, node;
>+
>+	if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 1270) {
>+		node = REG_FIELD_GET(MEML3_EN_MASK,
>+				     xe_mmio_read32(gt, MIRROR_FUSE3));
>+		bank = REG_FIELD_GET(GT_L3_EXC_MASK,
>+				     xe_mmio_read32(gt, XEHP_FUSE4));
>+	} else if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 1250) {
>+		node = REG_FIELD_GET(MEML3_EN_MASK,
>+				     xe_mmio_read32(gt, MIRROR_FUSE3));
>+		bank = REG_FIELD_GET(L3MODE_MASK,
>+				     xe_mmio_read32(gt, MIRROR_FUSE3));
>+	} else {
>+		/*
>+		 * Here the mask logic is reversed: a bit is set if the bank is
>+		 * disabled.
>+		 */
>+		bank = REG_FIELD_GET(L3BANK_MASK,
>+				     ~xe_mmio_read32(gt, MIRROR_FUSE3));
>+		node = 0; /* Unused */
>+	}
>+
>+	bitmap_from_arr32(l3_bank_mask, &bank, XE_MAX_L3_BANK_FUSE_BITS);
>+	bitmap_from_arr32(l3_node_mask, &node, XE_MAX_L3_NODE_FUSE_BITS);
>+}
>+
> static void
> get_num_dss_regs(struct xe_device *xe, int *geometry_regs, int *compute_regs)
> {
>@@ -106,6 +138,8 @@ xe_gt_topology_init(struct xe_gt *gt)
> 		      XEHPC_GT_COMPUTE_DSS_ENABLE_EXT,
> 		      XE2_GT_COMPUTE_DSS_2);
> 	load_eu_mask(gt, gt->fuse_topo.eu_mask_per_dss);
>+	load_l3_masks(gt, gt->fuse_topo.l3_bank_mask,
>+		      gt->fuse_topo.l3_node_mask);
>
> 	xe_gt_topology_dump(gt, &p);
> }
>@@ -121,6 +155,10 @@ xe_gt_topology_dump(struct xe_gt *gt, struct drm_printer *p)
> 	drm_printf(p, "EU mask per DSS:     %*pb\n", XE_MAX_EU_FUSE_BITS,
> 		   gt->fuse_topo.eu_mask_per_dss);
>
>+	drm_printf(p, "L3 bank mask:        %*pb\n", XE_MAX_L3_BANK_FUSE_BITS,
>+		   gt->fuse_topo.l3_bank_mask);
>+	drm_printf(p, "L3 node mask:        %*pb\n", XE_MAX_L3_NODE_FUSE_BITS,
>+		   gt->fuse_topo.l3_node_mask);
> }
>
> /*
>diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
>index 70c615dd1498..adb1de613e77 100644
>--- a/drivers/gpu/drm/xe/xe_gt_types.h
>+++ b/drivers/gpu/drm/xe/xe_gt_types.h
>@@ -24,11 +24,15 @@ enum xe_gt_type {
> 	XE_GT_TYPE_MEDIA,
> };
>
>-#define XE_MAX_DSS_FUSE_REGS	3
>-#define XE_MAX_EU_FUSE_REGS	1
>+#define XE_MAX_DSS_FUSE_REGS		3
>+#define XE_MAX_EU_FUSE_REGS		1
>+#define XE_MAX_L3_BANK_FUSE_REGS	1
>+#define XE_MAX_L3_NODE_FUSE_REGS	1
>
> typedef unsigned long xe_dss_mask_t[BITS_TO_LONGS(32 * XE_MAX_DSS_FUSE_REGS)];
> typedef unsigned long xe_eu_mask_t[BITS_TO_LONGS(32 * XE_MAX_EU_FUSE_REGS)];
>+typedef unsigned long xe_l3_bank_mask_t[BITS_TO_LONGS(32 * XE_MAX_L3_BANK_FUSE_REGS)];
>+typedef unsigned long xe_l3_node_mask_t[BITS_TO_LONGS(32 * XE_MAX_L3_NODE_FUSE_REGS)];
>
> struct xe_mmio_range {
> 	u32 start;
>@@ -332,6 +336,12 @@ struct xe_gt {
>
> 		/** @fuse_topo.eu_mask_per_dss: EU mask per DSS*/
> 		xe_eu_mask_t eu_mask_per_dss;
>+
>+		/** @l3_bank_mask: L3 bank mask */
>+		xe_l3_bank_mask_t l3_bank_mask;
>+
>+		/** @l3_node_mask: L3 node mask */
>+		xe_l3_node_mask_t l3_node_mask;
> 	} fuse_topo;
>
> 	/** @steering: register steering for individual HW units */
>diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
>index 9b35673b286c..fe3906e8f721 100644
>--- a/drivers/gpu/drm/xe/xe_query.c
>+++ b/drivers/gpu/drm/xe/xe_query.c
>@@ -453,10 +453,12 @@ static int query_hwconfig(struct xe_device *xe,
> static size_t calc_topo_query_size(struct xe_device *xe)
> {
> 	return xe->info.gt_count *
>-		(3 * sizeof(struct drm_xe_query_topology_mask) +
>+		(5 * sizeof(struct drm_xe_query_topology_mask) +
> 		 sizeof_field(struct xe_gt, fuse_topo.g_dss_mask) +
> 		 sizeof_field(struct xe_gt, fuse_topo.c_dss_mask) +
>-		 sizeof_field(struct xe_gt, fuse_topo.eu_mask_per_dss));
>+		 sizeof_field(struct xe_gt, fuse_topo.eu_mask_per_dss) +
>+		 sizeof_field(struct xe_gt, fuse_topo.l3_bank_mask) +
>+		 sizeof_field(struct xe_gt, fuse_topo.l3_node_mask));
> }
>
> static void __user *copy_mask(void __user *ptr,
>@@ -515,6 +517,20 @@ static int query_gt_topology(struct xe_device *xe,
> 				      sizeof(gt->fuse_topo.eu_mask_per_dss));
> 		if (IS_ERR(query_ptr))
> 			return PTR_ERR(query_ptr);
>+
>+		topo.type = DRM_XE_TOPO_L3_BANK;
>+		query_ptr = copy_mask(query_ptr, &topo,
>+				      gt->fuse_topo.l3_bank_mask,
>+				      sizeof(gt->fuse_topo.l3_bank_mask));
>+		if (IS_ERR(query_ptr))
>+			return PTR_ERR(query_ptr);
>+
>+		topo.type = DRM_XE_TOPO_L3_NODE;
>+		query_ptr = copy_mask(query_ptr, &topo,
>+				      gt->fuse_topo.l3_node_mask,
>+				      sizeof(gt->fuse_topo.l3_node_mask));
>+		if (IS_ERR(query_ptr))
>+			return PTR_ERR(query_ptr);
> 	}
>
> 	return 0;
>diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>index 50bbea0992d9..eca8f5f502c3 100644
>--- a/include/uapi/drm/xe_drm.h
>+++ b/include/uapi/drm/xe_drm.h
>@@ -513,6 +513,8 @@ struct drm_xe_query_topology_mask {
> #define DRM_XE_TOPO_DSS_GEOMETRY	(1 << 0)
> #define DRM_XE_TOPO_DSS_COMPUTE		(1 << 1)
> #define DRM_XE_TOPO_EU_PER_DSS		(1 << 2)
>+#define DRM_XE_TOPO_L3_BANK		(1 << 3)
>+#define DRM_XE_TOPO_L3_NODE		(1 << 4)
> 	/** @type: type of mask */
> 	__u16 type;
>
>-- 
>2.34.1
>
