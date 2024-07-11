Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7884C3DA4D
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jul 2024 17:12:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B279C10EB16;
	Thu, 11 Jul 2024 17:12:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gPiAnl7h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 680F410EB1F
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jul 2024 17:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720717943; x=1752253943;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=9HAran6mc0+5XPXwpDm4fJ5YY6CWE3qam6XWsbTyQC0=;
 b=gPiAnl7hGOBC6C8faC/48aUqmxcI+op9qNHpIwkQGRhI23RGZlx+PzWX
 7TiJo4r/tILzptaEb9t6Vp2r6dBuHC+Fi9M3uIzUrpO46SLBCcQp9xFDA
 HmWsauCgZUlvD/LzzAg6p9v66HG4ALfCwKIPEM33L/AeaCLu18UOCtieF
 QGsgYfSZ9eFDrfSxDk4SZJ/k52Lh4bUZB3QCnz/ioyUuK9rzt1KdwBqar
 BtnYkqE/DrNiQIdul3WeK2QS+SHT6SgVR+IliTzLep8UIUR7DbZCfijyK
 5P11RGzcAZOp/bCLGEqxqCVSImfSyQN/J2JSj1y+NACptopwHjV9WokO0 Q==;
X-CSE-ConnectionGUID: XbvoYa0YS3ySKKwcshFJkA==
X-CSE-MsgGUID: Bpdwwz9YTImTAxgsXLmDXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="35553791"
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="35553791"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 10:12:14 -0700
X-CSE-ConnectionGUID: U2yWF1IoT4Sxr27EPAGJ3Q==
X-CSE-MsgGUID: 9Hp8iK3XRXqJWpoEhedXPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="48633014"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jul 2024 10:12:13 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 10:12:13 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 10:12:13 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 11 Jul 2024 10:12:13 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 11 Jul 2024 10:12:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UHgNvAEKv38QmoA0lYoNhmhs20+rTijufa7kL7uLZRWcNWKEDkvSTW+fGiW8nKkcv8BeDDl/8y+lY3ATqwfNKY7YyR6z2Y8fDIkUoIDpeXz54jKPZcTpAP2+KVkLPhBjtcMXW0IdgVG/qX/nv/n5nHvnDkstKWs93YjEZL/VMrn45BJH15Ho6tOUC8yNSEwGIXF0DsO9Q+yG2hAsYonRn9gz/ImQ1to5xpGw6OE+XwbvERnavAMJPEAzb7lRZp8Ut1/AvbEdAsof9LDs4VH1wgDqgEd0g5KneTiqxD74bGTxADj5V0Bxd/GlC8PHhgTG+KTCvs6HuEShdwGh61adcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B3lme+M56H7w3MNYfvUqeWR/KitWEiMzRXLs6lDmeSU=;
 b=eZ8XS/4C4gUU7u/IUaCbexdzDGoAIuRHJKj6xlNaDBDyNDbmsTTZbDNIXreUIqBnYTzd7FZ0JdBwSmv9AX5K7YvDw5CuCSedljLz5scmINJWIDO8lkC3i3Y7wqxyz/BvCJseZeK82xbbSyqDttTUIhBCEmSMs7nvzOU8AaeJ3an/++I92+U9LgNp7KHWNciBk2A+G4ZP5FMeSw+Era5pgp/CGJ5IOF+UZKTd+BrErxh2V7axvBc88Dm1EfleVoyATk4W2sDq7HpHMM/H8qqWYki/scLyEvMn2QbIMJgMOXOhcjD74ZurtCl9j8okjsaRKcarzf9ywgiF5/E066CKpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2859.namprd11.prod.outlook.com (2603:10b6:5:c9::14) by
 CY8PR11MB7107.namprd11.prod.outlook.com (2603:10b6:930:51::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7741.33; Thu, 11 Jul 2024 17:12:10 +0000
Received: from DM6PR11MB2859.namprd11.prod.outlook.com
 ([fe80::4063:4fec:bf76:f095]) by DM6PR11MB2859.namprd11.prod.outlook.com
 ([fe80::4063:4fec:bf76:f095%3]) with mapi id 15.20.7762.016; Thu, 11 Jul 2024
 17:12:10 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 03/12] drm/xe: Remove unnecessary drm_mm.h includes
Date: Thu, 11 Jul 2024 13:11:46 -0400
Message-ID: <20240711171155.173717-3-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240711171155.173717-1-rodrigo.vivi@intel.com>
References: <20240711171155.173717-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0004.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::9) To DM6PR11MB2859.namprd11.prod.outlook.com
 (2603:10b6:5:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2859:EE_|CY8PR11MB7107:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bb2b7a5-3c4e-401f-f879-08dca1cc99ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tRyGrlCmUlKKWlxev1nnKTvlBX1v9TcBvUXcJJYCmIhYaT09mIchtee+Pz7h?=
 =?us-ascii?Q?XiWIMG9F6W4OIfY8CZmnl7FTWxM0qU0NQs+IA6apj+OZEGjUTl9s7rg9jm+2?=
 =?us-ascii?Q?Cy4rmVV4rMMh1Vx9aFoCZX0nL1MBmCJzfAAjfeevQiqygxEK1JQkOUDRa2aU?=
 =?us-ascii?Q?f0Qtx+WLIbA+JMGHFB8gZkIMPTYUIKhks/bAwZx7T8AN0lr20z6PqMBL8+Bt?=
 =?us-ascii?Q?5s5q4KOfVZV6MysAKTpGUejzaIhPDwSquuhO0Lfvuwk4RhwPcixwhGGuW0JN?=
 =?us-ascii?Q?ROLikvwuokbXukZ+HP3IRVX6DGI/oMxiKx9FDmfGhd+3JuxUHVUPoL9jR1rO?=
 =?us-ascii?Q?T0DFOmdnX3um03tR8CV6e6ACGGMjzBnzk4KJkSp4pv972T3DNpgqWXdtOJ+a?=
 =?us-ascii?Q?vmxAlxQBaK5TfeNJpK14a5TZirQ7ZgzLxUjAUp/gY+/E+c0aVY853Oc/Z0Fq?=
 =?us-ascii?Q?OjKLHcWuOUDMwl+QXL/S92m/KfUHi+BsjXKDcIsFj9I7tw826sWO6lQg+QXR?=
 =?us-ascii?Q?egBnWIxG46OGMzBtcQLxHaq2whnJY8Iy+nUYaKuc0CS7g1N9Kw6oWj4WloJI?=
 =?us-ascii?Q?Qnx1zYx3nBS9balZkQHQSgNHPXHV0rxDCClah6z5xKXQwFf0BJPdSkQPH1l9?=
 =?us-ascii?Q?LIN8p6VWzPaY6qqnumLzZvyfcz64/MSvuFIhi4kOn+McNokouo4nB44vJeOa?=
 =?us-ascii?Q?KlKPYf8sCALLXaoZM/PU0TxbcBph3ZLJ0liLCijtbVQ1SclwyoH2uoEcHEo6?=
 =?us-ascii?Q?aWeMn6PE80C7iDlkZdR+CXXtmg5CVs4kyVPKTnmPAxCm3D78OmuehjaFDjb+?=
 =?us-ascii?Q?KFYkt57l1SMpAbQtJWFf8AGB9Vz4GhAjiUO35JbzpRFNhrlEWyLbaraFADWV?=
 =?us-ascii?Q?Vo27OtwC4Irb2rrCJoXwhlBi1r6Y5E1v7fts5U8S87bk2fXZjcp4rkMEFQ/y?=
 =?us-ascii?Q?QPxetrammmChhfO5joQw4I09jGDczVTLWo9xLZVQ9AM3NGQR+iQo/CgRKYIJ?=
 =?us-ascii?Q?Xx2J25w7AG4jvsdVsQYhLU348DwDUlPdYBkh+/q4uyFJbju1NlPIbKvWXzkb?=
 =?us-ascii?Q?7KNfojjl2PEMf7wPmc+19vYt+HD75D27epsCGcRD/SR9phBtRkRC8W9hbd/p?=
 =?us-ascii?Q?7Juvbhd451MAMVLYTRPcWdjkMXhsK3Er+PeJIirN+ANlrOs1YDx5zUR2sbmC?=
 =?us-ascii?Q?U3zr9rE9EXyBs9UwTq7/El+2o5NTeIhOI8bVVS5Cjosgy/5pYQsUWmLKu0vp?=
 =?us-ascii?Q?rQ3TJtNaJFXbz+1H/wfsHvl6k6QjXJmBXuDvr0xs2O+7PFfkPgudaYDYbOJP?=
 =?us-ascii?Q?yp1xI3VK+xihb/oXWmT7q4X/ih0pj5/BatMStfsQs+zXlg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xMNxHzi5E80w9j0RV9SN7RaftlDd1XiAQLYOjvjjxfA3TqSnw4hMpv+i3Fx6?=
 =?us-ascii?Q?i+FqjUoTHRZ+hxwKookeso45RRzKwS9uryk4FGuzUoD6KSUs6gO+H0hhZI+c?=
 =?us-ascii?Q?WIHUrAgrYZL/FVUodH4dT0Nf4qoZACSvLI9GnmRlXdugi3cfXV2NLwLucjms?=
 =?us-ascii?Q?tlMoA1ZH9EOW1hzy5Rw/rTtu2OADUeRhBCmO25kwq26Cg6anrU9ei3NEu8N+?=
 =?us-ascii?Q?7WmsnUw9WZzzzBFw6sDB48wDkMNegOelPSU7T4At9rkKdaxGurjdG8FmXRQ8?=
 =?us-ascii?Q?Mi7L1D28wzkSoIA1AQod72Gw8TjkVkfm5+0f2i+FUrm6x+A4GYqxZCGZyqnO?=
 =?us-ascii?Q?bQ3EWGfW2O9pZwDV6RtlJBQ/Ph0MOiYmWAOHCoZqldK1Zb0+uBq8VNHCH4sn?=
 =?us-ascii?Q?VoH3wNjXI8wM2917FQmFibR0HLEkYTwIp8dRAhjZJH7B/QcZ80G3TgmNDp4g?=
 =?us-ascii?Q?dc771ggmkBU9FDRizIa5FfKk/jvut5U24YxOSl5Nuv7A1QnRzh1yMkr3rni4?=
 =?us-ascii?Q?j8gLBWPPEIqNVhK0ErUe0Ty3nXqgjNMYqpRIU+4yDMsC650PN0dc3zD81s7D?=
 =?us-ascii?Q?OdX0BRaGxaQU/gGRJRBN65rdJnmGtKE5HBDVXYVLTGwM+QoSP+Jpl7YIZw/f?=
 =?us-ascii?Q?BUimAS1R+fQizYFPmPRaaHGkr3Bi6oYKBiY+9Yfwt8D4j9yJt1qQ5mPJDUcN?=
 =?us-ascii?Q?9u8iHdQBnCDUNzDsRwR+ezT7JJTwwEhfgMDadN952Rvu/MCSbIYDIEGOaouh?=
 =?us-ascii?Q?RnI3fzv1+0R3x66g9wtBn6aHYGYDMtRs0oRLcjX7FXnPyXVjKBis+BffykhQ?=
 =?us-ascii?Q?Itsmrrn1bX4/MWSnu/aHn75e9agA/XTcie33kdBT+Vp/LyNrofVDORU+2xtv?=
 =?us-ascii?Q?NMZDFRn2aAPHCPHclska2UgmdFtckATFVxX7Eu/9jbFQps+0F2IXy7B4RftE?=
 =?us-ascii?Q?18hJDRsdDShMEyko5mFpb0Ocy0MZV2U6lybRCSVUzcZrGrvO2LWFJO6C1EUZ?=
 =?us-ascii?Q?CvlqmnaJJBWZhvGFrk+46y3+0ij9eGz2D/toW2ZpggfTgZqqJuWDuVfxnka6?=
 =?us-ascii?Q?8S2qkvFMsiJjOdlrvDl7AqZ1fBiW0cgDSiixnValLJoyN3HN9Hbkug6mQDwn?=
 =?us-ascii?Q?Z3KHZPfBDJ26TW+Ynq1ALDpDJRkOb9xpDE/njMVcsRAr0PVxDgB+dnJW/KTc?=
 =?us-ascii?Q?yMCGf9hDpjTwnQ9POywhUnoTrn6JasBN6C9tn8VnUrwYNSxJhSWHnNF686UE?=
 =?us-ascii?Q?Y5EJiwL3UUqdoF+O8VP2mtvi2cqR2io+Zcsckv3/kYy7VlQmSoferlaPblCi?=
 =?us-ascii?Q?IUSA84hX0ZOOE5XoB9T5WCFOKp9wDsOf2c6omEm8oJTR7g44mfSCr+BMLmel?=
 =?us-ascii?Q?1vb+SJKxOgiFcb7H+/rZ3UiVFXVmkFlKpcV90BcsWUBlUr8laP/sZNnEC1ZN?=
 =?us-ascii?Q?EhaqatRZtYgIq0B8NWgfjr8C4fInktaYfHw7sNYYl0l0EbqVknJG+HzhhlA3?=
 =?us-ascii?Q?v6MAdQwb1TUyu6Ccv0oOMEoihzoq51euxkdXC5Uf0HkYAeFgEXNKwXgR19BI?=
 =?us-ascii?Q?hghkKnIu9THmRQvAaCGf7zdsgh0nJMkfSkMF3oK1nfYwrQ+ThK4KEIZ8HbcY?=
 =?us-ascii?Q?2Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bb2b7a5-3c4e-401f-f879-08dca1cc99ba
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 17:12:10.6023 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g8krYX9EZZbWBdVtyr/fGchAiZ0aG0R2pS4hnla5rpxjqMIlY/MVKGpDmpnK/bVZYEKyGFm7pAtZ71Ir1TRGkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7107
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

These includes are no longer necessary, and where appropriate
replace by the linux/types.h one.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.h        | 2 +-
 drivers/gpu/drm/xe/xe_res_cursor.h     | 1 -
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 1 -
 3 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index 453e0ecf5034..f2af9355c051 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -6,7 +6,7 @@
 #ifndef _XE_MIGRATE_
 #define _XE_MIGRATE_
 
-#include <drm/drm_mm.h>
+#include <linux/types.h>
 
 struct dma_fence;
 struct iosys_map;
diff --git a/drivers/gpu/drm/xe/xe_res_cursor.h b/drivers/gpu/drm/xe/xe_res_cursor.h
index 655af89b31a9..dca374b6521c 100644
--- a/drivers/gpu/drm/xe/xe_res_cursor.h
+++ b/drivers/gpu/drm/xe/xe_res_cursor.h
@@ -26,7 +26,6 @@
 
 #include <linux/scatterlist.h>
 
-#include <drm/drm_mm.h>
 #include <drm/ttm/ttm_placement.h>
 #include <drm/ttm/ttm_range_manager.h>
 #include <drm/ttm/ttm_resource.h>
diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
index f46fd2df84de..f7113cf6109d 100644
--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
@@ -5,7 +5,6 @@
  */
 
 #include <drm/drm_managed.h>
-#include <drm/drm_mm.h>
 
 #include <drm/ttm/ttm_device.h>
 #include <drm/ttm/ttm_placement.h>
-- 
2.45.2

