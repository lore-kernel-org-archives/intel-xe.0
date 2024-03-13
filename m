Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1EABC54E60
	for <intel-xe@archiver.kernel.org>; Wed, 13 Mar 2024 19:55:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45E8510EA7B;
	Wed, 13 Mar 2024 19:55:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LlH/XVhH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC58710F284
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Mar 2024 19:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710359714; x=1741895714;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=VzNhxuM0AIdrGzJEoLNwtYkyIMHswsrJa0x3o943nbM=;
 b=LlH/XVhH3Utx8fzSZedhSm42jdtG3yGNtXMAzWcG/t1ohfmS+aGAR57n
 lnjtIVjTwqwdk2/5Nz/p3m3JS9xRw2WbP+ybmvgd4gIm7YyCwG1Xkd7JO
 KvMvWvB29jwpgNl+euWSfcUqjNqnk3CO/VBs1c1vMEgZtJ1SOyJ5vNXwk
 w7sbXlzJK4ji1QG0WDVrGem6b0uQv9LaJ8bYnk/YHw4Jy9ym4WkWFnCUd
 FxwVKh5UuAcn+jY0B8269RKz61XbxuPpkwzrF4w2vBWb8+YE7JjIbbfML
 6B9IJg9oWsMIB80VvmVNrO/k5mzlsBbDByGB1Ov4sNuu9kQHpHa+gCYWt w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="8970264"
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; 
   d="scan'208";a="8970264"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 12:55:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; d="scan'208";a="16718925"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Mar 2024 12:55:14 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Mar 2024 12:55:13 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 13 Mar 2024 12:55:13 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 13 Mar 2024 12:55:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ID+C9DqQq3xXqaYPYXKiduSvXTrEyyQZ/6OC4kToRrocFx0n+DAZBJ6EBAkLGuQE0Wsi0YNn/CMDBTa6QnP8nbpLt3gmGrNf702998/C6olm1Kkl1lkrzNKvMcr5dtN5VCUH2/qhCIaYGKgHrAE5zgqO3DJGjW7gJpY24Z8PmpvfLRxh1+aUFyYjTn9kl9zNefqJNnXpMEH1QXAKXBkRwezU487obn3y+qw0/43JVZYZJI4kilUEp9Sp0gRt0oFRfsCnLP7a/NywuK5qHmOEIyn+n8tDiZoduCH5RwOdeTv4lLRyJcKVjWJ6vwCksMbhbSy9r38g5d5yjXBdtzmmaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Uz2TEsr1a0+idbTnuhPS+Xr5pcAMNuSTPrThKfxV4s=;
 b=EvM4fz/Tcd5q2P+azyYOBV1GsnpE0h6aI6kwt5DBSFTFW5/lhB4Tv5Ruo2KtydQ2Ow/X4MWNpdKrLvlB61ruVPhUJBHFe6lKgRQTVWdLAfM5z8hDj8zWzJRvvlE/XXcois7s+bSQGMMcs9R3TkyFlWtLmNv1rabZw9hNLrk7KE/0rcoE76Umd5862LIWEmyrGOL6++2EV3xj4P+9iFiPvJDGQkGD93oZk5w6fSRj7/idE5+xuYgHZSRMVflwfvkw9jZbKxoSooCPlcFlhgkzVE0tiyn4nXfDnNrVhoVOwzbBC2WkYXrcoOoN4MkBvqbJU8FdSXRqNO3fJDEeOcyzXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BL1PR11MB5254.namprd11.prod.outlook.com (2603:10b6:208:313::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.19; Wed, 13 Mar
 2024 19:55:09 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7386.017; Wed, 13 Mar 2024
 19:55:09 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 2/3] drm/xe: declare wedged and abort probe upon GuC load
 failure
Date: Wed, 13 Mar 2024 15:54:58 -0400
Message-ID: <20240313195459.141463-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240313195459.141463-1-rodrigo.vivi@intel.com>
References: <20240313195459.141463-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0203.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::28) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|BL1PR11MB5254:EE_
X-MS-Office365-Filtering-Correlation-Id: 5508e9bc-dffe-4cdc-c6e1-08dc43977cb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O8vTToiiJVUMFhxi/IeZlmHUDjxUD+VuZde8nGp4xOEgzdwxlm0UPU4okzwj4xAoq3l53lsP0FGBzidTdxf5YZHGaiGzZ0p8MLWAThmEBrrMni75pDaFtuN5lo5tNwKrtLDFz0LFvugeifkROlxRaj3g1UADAeIjZkFM8it40BnRJC3sPWMgNuMSKjVZFxp6CFgAtt8W9BEYzefnCKd8kYIUEKsQBQEwCdOOzkQTlUiOlOujlXw2iSGA7fVpGpFhrgqJ4XR4nSVVhaB7gf2jsKl2mUYDfEbhqJhCdsFfyB9HTOLbpSJMLU19w1bdxiiJqjKCZGjvm6rxuoj+uMh5zRjzJiTX4noxXWZXF5ACBMvz3g3PmvNHk3QrTl5Cfby4tWmRFCRSZ4Lt/en9KVFhXpSgferk3nes2zDO07GKItpEUTEWZD9sUaqGiQ01gs7A0IpZ+O4XqqCJVJ/H1kKYtRgaMsP/Pqfk63r9XqId5isreUhjobEiY7S5VpAAc6DQ7vwbIE6HGMoks2hDd7nE0ahk4sG0EPAjnqRdJs1ABe7bMKyVq8x8LgGua3EGVlb0UOMd/ckzcFcvmpe9nrqPZwpdcSszEpPYZ2V4sX4HejVT5AwxYQmKDO9WFP6530H+/tfDltOY7oxVAUJtH/8uW75e37dGsRSxMvkmposxkwA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ql9m3baEdRfvi2mbfY+UlqQ1+JKXTLG9OO6bFC16f6Bbk/ETLyLNKW3FVQzL?=
 =?us-ascii?Q?nwjMjWReZ9uF6nq9mMTgMl/nqZDpkwECw2v30MtZt7Y2EliaFhQQIEZjw7pE?=
 =?us-ascii?Q?7oMPRangFYCwXUHWpYuDnbIaCjluh3fWUdiAQMaHf8Ojhos59LMqwed3jrRX?=
 =?us-ascii?Q?+/5n1Og6c5KbmoOBK7IJJVIACxyGX+uzwUcvLEh/x6L6JiqwqJblkvJtoonK?=
 =?us-ascii?Q?fVh1/2SxaB3p0/sCLDzieoX50qhJ5ljz9CVHM46cfupwSkqfNSx3zldoXA73?=
 =?us-ascii?Q?t93lS/+TVVRN5C172ms+TWD0vKkxTXdXEh2vV1m2P7dqN1r4yGwCmmRGA4kz?=
 =?us-ascii?Q?8Q1qGULkSEIFndaZbHyBYncket9nt0o5BqaNkjfJ0mPPLF2ODeqmiV4agr5w?=
 =?us-ascii?Q?uc0ZXHHvM2BzllwPu6Qr2mFPqs+57yNdw+1MEU08lIf3LGxqujA5qMj98KPB?=
 =?us-ascii?Q?2iXWIeUZpsDCksVSpxhhn+GWm3zB/Q1fGm0X30uJrmb/An6iS0mH5CTh+BnN?=
 =?us-ascii?Q?uzL3qqCYnYuw85QqdM9rjxyXOZmJ/wil1y4uRyUqlERARe7Gd4qVPhXEhyPn?=
 =?us-ascii?Q?4VI5ZUI05ZPKp8oL+pial9A8Kjm4elsdvpmfTqlLxa5eT80DGHP+0Tqld9z0?=
 =?us-ascii?Q?jeQBX0pFoEx6kTzDhySJqTocHn0fknzJwwPBAEPDR14kVDP53ixhiyW/pjyE?=
 =?us-ascii?Q?VChElRlfEZmQgIu/iccYbj3hP7+9rB6DtIFG/4w2GyxDkhGncBUEekzknS3f?=
 =?us-ascii?Q?lxyxpWF9D4fflE/hz4UE6OMp+JwJUabUnWazyeglpa1pWiWRvArUkBpgQl58?=
 =?us-ascii?Q?I3DMohKUG8p1z2esfwhjncNatZGi7IQCVxnKrtdD7wW4K7BLxgxKy1tMkz2h?=
 =?us-ascii?Q?LXOg0dHlI4m3EgE/mkRN26JJ3Tgkh3x7cCjoByPmkOp/OUOdfemJ68y0aX1V?=
 =?us-ascii?Q?uRiXaAvpemloAfIimZWcFkKOh6gZ0Ec4cWRQvHpnako9nAvS/bHY3UwWuyTe?=
 =?us-ascii?Q?9YtNjRym8xoNU35AgAclninY77ZVrZlUZhBiHy9WtDUyA9bplFcF+tuHDBUh?=
 =?us-ascii?Q?sibvy0ZUiZh9pKicYh2nQf11zykH+/mbbbmyjdtqhgmRR0XGa6jvP2GJbTGB?=
 =?us-ascii?Q?wQdh+049QVLYWfJq1eyzjKeu6Z2uuE1L4QDIdeg6WMm9nbQXw1WjYe64KXMB?=
 =?us-ascii?Q?r+9HWtO5jhT1GVcP9Rga4WdaTpRqW0yvlAeH297uwQr3LV7aHDe23JeW0IDf?=
 =?us-ascii?Q?UI6jkY72fiffzfoMlVyK39nUsTIRX/KacvU6QYKI8Gdm/RUiBV/a1CdOvI9d?=
 =?us-ascii?Q?79QK7BD4/I/oHF5i2Uop2aJq+iX43XEREaS33rnBrO6G+Ct6UQNvVFwk6SHh?=
 =?us-ascii?Q?SdiE9nuxPGj1BRK+Oy7/6AVUCPYmHKeOwD52ewgie0oDj169MTTzqkzNBSbc?=
 =?us-ascii?Q?NT98alJ/YXbePPlD8w/csURPwcekMpjZ99N6BWYBrh0QJrkhl+soZ9x6kG8V?=
 =?us-ascii?Q?XAnnq+NXQs//xjjJMKgYoES9lOjTaqgll4Lk0a4jpb1svRx7Kn5WP7sspYDM?=
 =?us-ascii?Q?VkvDumlnZTYatmTVFJJSZK32+RGCU6fxP28zq0Dk?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5508e9bc-dffe-4cdc-c6e1-08dc43977cb0
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2024 19:55:09.2950 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3WqIGgXGPmnIOkn4hTn/3rO4kCS4jgPJscJEeCVxoO2C6OACndAAfE3axdq1iteYz7F5YpjinBjzMtHp2Kmelw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5254
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

Let's block the probe or any other sequence and declare device wedged
upon any GuC load failure.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index caa86ccbe9e7..10d0f9418b11 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -511,6 +511,8 @@ static int guc_wait_ucode(struct xe_guc *guc)
 						SOFT_SCRATCH(13)));
 			ret = -ENXIO;
 		}
+
+		xe_device_declare_wedged(xe);
 	} else {
 		drm_dbg(&xe->drm, "GuC successfully loaded");
 	}
@@ -554,7 +556,7 @@ static int __xe_guc_upload(struct xe_guc *guc)
 
 out:
 	xe_uc_fw_change_status(&guc->fw, XE_UC_FIRMWARE_LOAD_FAIL);
-	return 0	/* FIXME: ret, don't want to stop load currently */;
+	return ret;
 }
 
 /**
-- 
2.44.0

