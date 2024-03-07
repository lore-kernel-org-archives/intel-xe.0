Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1906EC5475B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Mar 2024 00:16:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C68E6113605;
	Thu,  7 Mar 2024 00:16:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F8LKib0L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8493113605
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Mar 2024 00:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709770566; x=1741306566;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=432OOmWO9n/3qBHmWQexha/wGo5h2hq0PRY3Tng1YAg=;
 b=F8LKib0Lj36Hv5FjSn22ky6cvi6Prt68hDuTKZzcHBIhMqSVOhrCY5+e
 XVMmOI1OToT9qJeteRdNealTRGQNNbu10yeXH4SnkRJF/yhJpkE3+nkxz
 YCpgoHJA8gOO4xC+agPcvLmvmABVsKmQqjEZrj9/hzkwjZMKFcOxLxOW6
 O5jJe4Fm5Gy99LeooMhmffiFQ4KRRA1zQfXIy/2ta2dALAl1LEPYN8cjM
 AC6cZkDhWKNmpLrVxNMM9FnIMG7ttg6U7gZG7X/JcoCQ5klu3//pU91Zi
 0aYvfpfH1U3Swev3xyyBMRbZTssqK6fu/eez6LWlz1Fc6UIsEo35V2+VE A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="21939939"
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; d="scan'208";a="21939939"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 16:16:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="9911785"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Mar 2024 16:16:06 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Mar 2024 16:16:06 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Mar 2024 16:16:05 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Mar 2024 16:16:05 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Mar 2024 16:16:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JhYr/4U4xxkTCDzfxP5xKpFgGkQimbiTIJoL9noy7nGOaoAgx/da0lr3CiLO4dwDQ8TGY8Gphxj0U/R/xT0btPnHs8GL26waw9Be5lLL5cMwkFYItqCq3JNo1YEYaz30bJUhjElg2et/gXi4A7fPn1Vr1tyjVdB25fgHwmwCC6+6F8legZK1dKowIRzWhN9BENxXio72gomc4bxB23smWIibGH9Vd5zJVtwwzh1UXPawrjS5JcA0/nc8oeMBuQ8Il1KWFmWJ61e1FAIlJtWKIa7rshCM/+glqSHA23MDw646tC2lhmHoGTTtyu+vxHjPK6o3Izciwes/mQxfK8CLWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sl14quYa1IntF23FueDBCa2vddlI89f0W4MY2wpoLds=;
 b=FNGrXrrb2BTnnRZjgIMjliiUAeCeDmU8xQCptmq3aLKKx0oe3XHJ78P+VP699KrMVBuDqHxPVSk/FhurMj71qPgiymRAsafHiV58miV3QUoSPAbr1RnFJMHJZjywO13PVDJUkKgP9savkbJR0ohi1ua8kCkSdgwriczlr86NW+Lp3q8aP2g0TyR3do8EY+hhYjQ8fbKH2uXajniAdpkOPTzsM6S7PAlj0jmUSGeNM2wV3wKtxROGccczc/X/BCy7eL5Hfw0uWz/npoL9IKaKFMNok0Yu4iwUzmS2xh9XG3l3RBYf8cYXJGGQHw2Ce7rtpgmlkqUxwQpEMG6OayYCmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS0PR11MB7851.namprd11.prod.outlook.com (2603:10b6:8:fb::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.22; Thu, 7 Mar
 2024 00:16:03 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7362.019; Thu, 7 Mar 2024
 00:16:03 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <intel-gfx@lists.freexdesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 03/10] drm/xe: Convert GSC HDCP from mem_access to direct
 xe_pm_runtime calls
Date: Wed, 6 Mar 2024 19:15:47 -0500
Message-ID: <20240307001554.162153-3-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240307001554.162153-1-rodrigo.vivi@intel.com>
References: <20240307001554.162153-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0029.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::42) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DS0PR11MB7851:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f262612-afaf-4aee-d528-08dc3e3bc6a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jhiIdXPJvAYoA209UVxTwqrfO4DxJJ+InPpjdXIu64ty4eqrAqSvWfYxGETCY0D8HUG+Pf9Qnkr90Y+2P63e/AH+nou1TzdwcqDSPEbaUDwSlVNF26gcleUoE9jj0DK3ieovg3PgtoqUZr69oyYFHCXIPI941oX2YHWLL1fMwB25Pi0XtuAKijcvIUooZvUERWrhF/vjJVcMM3VJ4g/1rV96Z4HYHIhvm8ytdyQvNwv2h9KbKBlCG8gSpUMmog4YvW53Oa35uEtaE7/s1jz13x36SLeEe7FH/+YwemXH1c/ThhhwbOuiBboYfe833/0SDWPbRRESvMprcEnQvo6/dTK9HWhr0Nz8Wlbh55Q32RUJl5aiLOqdTH/Ry/UkxBEWgDv0466coRe/BhumOTDfZEPg3iMGexQMhD/MBH+fVfSEwog2CBWmqr7e5tWGQbeAvNLa+6zPxpwu8Qrt6Q2yiWjHZtwYf+rxr1faRQOwVw1dpBThje5vjkpL0yDhQT+Fb5jCDWy+NcmizkhqpTv4mLex6djb+pSjO4dnM+usLCZ++RCiVwkWYoccG4CifqmQof6TPP8UZGJustYNE3kCxNNZr4PMbsz12ksK6QF25rBQi9wWONUxciAZ45F7e31/uoDk2CEOy5ZR4yDNsLt+0eTm/u4tt1RlRhHrTCUBrIc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jOwQtxTAnRZcTgcf+D8AQig+TyhsfUfot9igY4++BAqLASh2sWxngWx/xTVw?=
 =?us-ascii?Q?bnwp8yod4zzBcG5GPoxy6almnuiEXX8124Ln4PKpVQl078odW16j6ZnChNz1?=
 =?us-ascii?Q?5sEKdO4yQfvBO8encceCCBrekZispyDqCkmPEd77xKY+uDP0Qcp2Glf4AyK1?=
 =?us-ascii?Q?RHimmzXWCGEI2lvAze5zgPZNdZUpBh7jiDxRH/CHz05I7nhsWMvTsKZx4UWI?=
 =?us-ascii?Q?FmgJFdBBcyaKp5p/w4LtENEItit2Tt03bVYv5LYlMr8ArXgaB6bcoNLylnRf?=
 =?us-ascii?Q?WLDm30/hGULOGttXY5ixa/5D7hlICwDsuoxn1e/gmgXa7DOOOdIyLWFgSK8a?=
 =?us-ascii?Q?3jK0SitLmfNQ3ztMPivBmVw7meL86RJx9ioQ+Prtmg0T1tmn+upMLaQlwBEo?=
 =?us-ascii?Q?hPMPRMzFzWPaqHYDiazpocIY73n1OxBOBjK/CdC/wqWmwCv83I8E3QlLclhx?=
 =?us-ascii?Q?X92kmnewfcChZf5PkkS+Ni7xYAji7fTkkM4f6PAGzQ8BjjS5NFvDNqIjZKE4?=
 =?us-ascii?Q?TQkmSXW5vavXqQ8lV6S5BvDUMdI/BvvKSi2O9IZJ00pwV/czWE6e4J7uSGzT?=
 =?us-ascii?Q?3MTQ3EKBNvG9hRRW1h7/MED4vsC7bE6Lc+03cf3zHnlOIHziYFS0zNpVLNNw?=
 =?us-ascii?Q?uXD3x1kxDi9cjXtQuO3vTdppeEzZTclW0fNZWdv+GsCWxUzhCkc08StmFf62?=
 =?us-ascii?Q?4xzVQNw/Uyq6MHPxWHZGjrdc9t4nXVlSa5LX1+LI/EuiLVopVQYhMuxon8Hx?=
 =?us-ascii?Q?8OacfnUfJFkYm4BxAXOiFDylZbmRCwzEJz5DRiG0LEyEL5W9dMHQTe+CZHwM?=
 =?us-ascii?Q?5Bb/xtBFQ/RhHgvPXogkrZamH1Iy1cOr9siE3ZBgx7SXwV1yxxaYvBQ8ApnS?=
 =?us-ascii?Q?Wf8rOgALNcC8G26f2z7nETuBEMBvov/ma9POUKrWsvYy1ItrcX9/PN0lUzox?=
 =?us-ascii?Q?j8IaLR5ntSIKe/vxI4TT9LajIzzi9Je4M1kCC7CJMV+HaBI9JgGvL3I8TibM?=
 =?us-ascii?Q?BePXmlS8d1SRJ0vITW98aghZNQqmIE5fHJ9tOMiC4za+r4uyudWRoM9fJ/VX?=
 =?us-ascii?Q?ZIvG1M4g/0Q6aALTXPnl1jz3ndMIGmXUjb6jMkgDyXusYQTHvVWsDhUZ3qdA?=
 =?us-ascii?Q?9oAed91yi2TUJ0vcfqklVMZmvBBFdITJiNHqbmIzprwVZ0mRQgXlS2xNM6lx?=
 =?us-ascii?Q?VJBwtwRwpPvhSCgD0pt5QQlFcx8rDKqtCRUyOrSptpvWQLEpIfggq6+nfM5z?=
 =?us-ascii?Q?ybaAY2SxYJoKCApO5RJUEGBkE4hyjqOKg0B9P+ApffQo6R8fF1sGYkwecFiM?=
 =?us-ascii?Q?o8Mn1zCHQGfgR9P5H0iGb0qr2OePovchidO/4fleqzl3MFGgQkID7W39JGXe?=
 =?us-ascii?Q?gm62cqqgHBM1/sIe3VJr0L0AgzaEQF0H7GIQTvGJ+UoqR6afQ9/xkP13Vg1Y?=
 =?us-ascii?Q?EtXf4xRsz7QOSGZvr7eCtjFDYfsWP8R11ValyVGgwAtnpy1y+6qsPyaVmWdh?=
 =?us-ascii?Q?l5A8IfdKOvBFRZC7pXfFQ/IfRG4Mnr8A4+8rktYG0rA49VCpnj976CfpZca+?=
 =?us-ascii?Q?mQxnPv7XMtJCxWuwPhPH+ko4UjaxFScq/K0jbIfa96VMWq/MlPCT/j21Em7X?=
 =?us-ascii?Q?pw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f262612-afaf-4aee-d528-08dc3e3bc6a8
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2024 00:16:03.8332 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i064qGYet+myDxNaCZIpMDSiWl2KtNF/3TyBMYCTyslTCOHoD19qR6sMOK4wqXHchPrhaonScYezQ4snzUhqTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7851
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

We need to convert so we can continue to kill the mem_access.

At this point we should be protected by the display wakerefs already,
so let's use the noresume variant.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/display/xe_hdcp_gsc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
index dcde1d0ac1f8..df1df072f3c5 100644
--- a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
+++ b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
@@ -217,7 +217,7 @@ ssize_t intel_hdcp_gsc_msg_send(struct xe_device *xe, u8 *msg_in,
 	addr_out_off = PAGE_SIZE;
 
 	host_session_id = xe_gsc_create_host_session_id();
-	xe_device_mem_access_get(xe);
+	xe_pm_runtime_get_noresume(xe);
 	addr_in_wr_off = xe_gsc_emit_header(xe, &hdcp_message->hdcp_bo->vmap,
 					    addr_in_wr_off, HECI_MEADDRESS_HDCP,
 					    host_session_id, msg_in_len);
@@ -249,6 +249,6 @@ ssize_t intel_hdcp_gsc_msg_send(struct xe_device *xe, u8 *msg_in,
 			   msg_out_len);
 
 out:
-	xe_device_mem_access_put(xe);
+	xe_pm_runtime_put(xe);
 	return ret;
 }
-- 
2.43.2

