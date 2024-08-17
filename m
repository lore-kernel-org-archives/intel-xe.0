Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE55AC52D7F
	for <intel-xe@archiver.kernel.org>; Sat, 17 Aug 2024 10:36:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96AF310E06B;
	Sat, 17 Aug 2024 10:36:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M/9JX89V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 178D910E05D
 for <intel-xe@lists.freedesktop.org>; Sat, 17 Aug 2024 10:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723890984; x=1755426984;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=pvu/wCiWtGCGH0WjQ5wVtgywJH5ulxcR05a95hw5zZY=;
 b=M/9JX89VxLGscYxvw11qkIb9PBKySvTge1PHnv5n8ywLwrqt5F3Q+97i
 DrOzloy/Tf0Bbe5ROdPgRaPZpdkbdE/FhlWVnGEBsNzcFHUuMM8Y9EfV1
 bwrxeTmn+VZNCBuBBdAyiTYWK7eeAD5moHjrhlw1mPn4e0twZF02w+3DO
 bjq3fNdt8n7R3GYkVAOLfoXWvEHp779RErUYP6HNvelGMpWjZBB4JP09a
 g+Hm0DenbsWK0CgoNH88sq8uLDDuCdy4dJCGeyOL8C01G02VYpSb1R9vH
 Yn+UHglg1Cx0WObvf8PX53zV51RTpZSt4Dod5cAMwDBF2U9qCFfGSRKW1 g==;
X-CSE-ConnectionGUID: W51r0FxoQUOWDupo4k9TdQ==
X-CSE-MsgGUID: VVNS9dFrSDCn37greZDZxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="21993420"
X-IronPort-AV: E=Sophos;i="6.10,154,1719903600"; d="scan'208";a="21993420"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2024 03:36:24 -0700
X-CSE-ConnectionGUID: W0bVHVl8R+6BUxKV8dXHGg==
X-CSE-MsgGUID: nMA1FJWZQTWlGccgiRhx0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,154,1719903600"; d="scan'208";a="59755239"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Aug 2024 03:36:24 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 17 Aug 2024 03:36:23 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 17 Aug 2024 03:36:23 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sat, 17 Aug 2024 03:36:23 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sat, 17 Aug 2024 03:36:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MUd4vq6Gr+oyaWtdJeb/YuGdqglw/eYBgvrtDytxp7erYPSij5BjnpPHEEpxoPFfKJ2stoU0XAY9djkzJGEcx0RKLSugLlbAXIFBBKmockydjn91Kz021tncUJWwnCmGccw6UxsNhl9cFSCvHUQPWr2o1O95qgzJE4Gq3viCmWyoLh4RH9Z51mynTwkXzgz8cM1/6Ry5TlfuEAcweaHKa+QFkjlHrM7GohbMhQlCr4AbJwhhSjFsZb6QSZeE6INsRJ/NO/kiAvDfalRiQRc9dy/119g7Dztug2SGNHGLkvT82GHidWLskLPJeSk4gHxbj3sNX/BEE6AdOKfoQQgBeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MGjtjjp+OejUMViHUVG8lv2yCf2YmVWaq/+ZsHvpLhY=;
 b=eOijOld8Ap0vcXiNnAltmoxhmnRe9pkkUoBfCIu5ENtIcTvhhmCaA0zsnefPvxEgeli/WJvAy3dHIcerqQHOwiOSjrLokhmG/kxxJyZSWZM3gwNpl7/q35pm7JUmJGZWvDcHsT+u0kOyVIGwFxGzkziFA4hKalBWI8+U2TlO2PkRmtiZRq8FjFQw7medljpKVi+FuZjpljxlH2JPfxqXF7mguqyQwl/2itBWFuyy6yI3TG5y+wl/qJPRPEQzZvZs0xlUSll7HHTe1vlPSS4RBc6R8OjfykmenE3uu6DpgGJpHpBtb55IHxvRyO0s+vDjbslZs/u4ttCoYrhF27U5RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by SN7PR11MB6679.namprd11.prod.outlook.com (2603:10b6:806:269::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.18; Sat, 17 Aug
 2024 10:36:21 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7875.019; Sat, 17 Aug 2024
 10:36:21 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <lucas.demarchi@intel.com>, <jose.souza@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 10/12] drm/xe: Refactor xe_ggtt balloon functions to make the
 node clear
Date: Sat, 17 Aug 2024 06:35:53 -0400
Message-ID: <20240817103556.163783-10-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240817103556.163783-1-rodrigo.vivi@intel.com>
References: <20240817103556.163783-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0127.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::12) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|SN7PR11MB6679:EE_
X-MS-Office365-Filtering-Correlation-Id: b6ea7de0-0daa-4e92-3f56-08dcbea86efb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Yc6/BvshjLPmTXUMKyw5MssOEI5HA/JxCP0mfKAqoWApKjW9Gg9bAMwkd44+?=
 =?us-ascii?Q?KTPSi/KU2mRjYdMe0YV37gjPavQb6aN+hsI/w/QGuQOSG0Tf9zDPEnrs08VM?=
 =?us-ascii?Q?qQ8jxg1YRxe/2Isr0AxsEE19Kl422g4zkWAJASo3a5hWrYDMd9qjRZ4x5bHl?=
 =?us-ascii?Q?hxWIv2JeJeMakf1EnFXWigdiBuHQEGKvKm6wRCKoJ34EjwmBoU8xsW13p+1N?=
 =?us-ascii?Q?AJQLbcFTu5/V1QaUyP3GXbwIYu/TXnMm5hQ3JA4NDzJJH4CvkAcszimkBh7v?=
 =?us-ascii?Q?RscHHNX8HQItBseP/5Rd4HrE5DvN0XKtnLqmlw87nbmHFLnS83NyBZMOpZYb?=
 =?us-ascii?Q?kYPDbYud+tekFV+7WgwaHllcHx90NPXqQkp66J9115bzk897ro7eimM5e8+B?=
 =?us-ascii?Q?6k5IFT2S8k6Ta9oDmfB7dJdqYsUEBDW+M7Z9WyTFM3y/YZ3V7rWJjyD/c6qc?=
 =?us-ascii?Q?UWps8tf43n7IWHEa9MpjIqdtengN3aoAHpYHYjWElNvDVccCk/8pNei5KBZZ?=
 =?us-ascii?Q?4Kq7Oxh2ZwrLxmE7/sAxt6365Ukppx2Q2ccIzKQPUN62c25/1Dnt6kUjK8YF?=
 =?us-ascii?Q?O4XhRK/uEO6cRt7KbiiTvSbZlDJ1F83OAwB2jxGTyYqZlB7nN3GPcGKpR2KA?=
 =?us-ascii?Q?N+jL1F8Z6yUguaSbpWMTSNsFE8zZXHCoxXBwI+N/4BcQtcy+hGY939bK4vDr?=
 =?us-ascii?Q?YfMOa7HwZW8ieXCnH/yuJikaYsQMrfR0edQ2dlJ2FkL+t6tldp/ltvbZSYSl?=
 =?us-ascii?Q?YezLOfZWXVIhUda1Rmr7F2jMk7vFvhPGra0olMWT0PRqZB2gTIYr0AjRE/18?=
 =?us-ascii?Q?rsPPF5ggP9pgnIATuWTC81K5P8LYuOSMrLWMLrkDV6R3qonJFcT6c0L2dEIP?=
 =?us-ascii?Q?jaMsuSRQyrtcW/kcbem2xetq0Bj5v2oy2OapwrpIp3p5YGuu1Uzh8g7Na5AU?=
 =?us-ascii?Q?OVmSlqAPcVF8r9BvzlmyqEZBJnX3X3ZQvhV9ihNK3B3WX6qhd1SHnUsf1Ssy?=
 =?us-ascii?Q?pPSsMdt4oKfkgw0IWu1sgCQ6q0+sjc2p/YC4WswBwnsDM2wNSAaTfyQIehRX?=
 =?us-ascii?Q?f72qXLtiAa2b7itg0fPNzOmI9ls8cH3WDO/bHH8KH2WsgfN0j+JdZ5TP9tFs?=
 =?us-ascii?Q?ZK/hzXeummP9JMeGV9Dy522owkoUYKOZpcoz5iXDCSEqaZNt9fDbux7bJT7h?=
 =?us-ascii?Q?QL0Sp+u6ESzI4rI796v13050Z4CfL3zFUVTIyirEiIXWojzGfstYNoX37rct?=
 =?us-ascii?Q?R+CeWAeqqCWYBbxNWwjfRyToycK3at4wFhduejhKNvd12+nXhQTCWnc239Um?=
 =?us-ascii?Q?gbuX52KwGvuvEPM6N00ZBzBtciz2aNoNAKgAEW1Wan6sTw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GN8qcp9Iwd6ul/UFLsJEll1FlKCnI/OJbuJkBK6U6R2w6hRXhbYfWtPzmxyu?=
 =?us-ascii?Q?Q0F7fSrBtz1m53qY5rAyRYfJhqDaTnptQwufGjzSgYLupSUdbF2+lmgo3cUR?=
 =?us-ascii?Q?+f8yUckKdEogwZ8mCOrgXfzkXWnrPTmjIeKhxyV2FowgSd3KxPEyVN+DAxRt?=
 =?us-ascii?Q?K5bc3Dc617hWefQFcaJYfc85BJfag0QcIzS89vd0Bo1Ty/rhSystmG7Ghnuo?=
 =?us-ascii?Q?b38/xE63UYH5BZUB8+SN313v4d7GOWesUh+PXqAaA/BRKx8TD+m50ZfVpSmb?=
 =?us-ascii?Q?D9hwMp8OO8vvgbyEt722n5phqHJ/FbFeK22IPjwC3YW5ANvfg45HA5QULtzD?=
 =?us-ascii?Q?DVcTmTTSCHWE01rdIJ4Q78GHdkayTzYZcpvFwBO31GgI/j0WAxSVNXZJ9+Al?=
 =?us-ascii?Q?2Il+YUPCPHdWBBgzTzrzK3y7/ZbegV1PsmNzZK8cHbo0KfX6EzAHPQCPvH9/?=
 =?us-ascii?Q?pvoRtBURGnaSl0FbFL/AYEQ7JAyGPcj+hoT1OJpjv0lzF1vTRHZHLitXkJ89?=
 =?us-ascii?Q?9nCNWoB7yqw5N4bABNHWACJTnzDJLo3FdkhASgLP2Go5sMShBBh4T0kFxOeP?=
 =?us-ascii?Q?Xi5McndmowAui9j6e4ZYC+vdV7BU+zgfo5CJkPEy/AQDG4eQZ3cI9pTAtVwl?=
 =?us-ascii?Q?/q2sq0A/fHZxCUXkEFdoHyo78mfnsQk9Pq/jblByuicfsfX6xXRRba5G59Yz?=
 =?us-ascii?Q?pEnnKKH2xGgIT2vbkGgdK2eJkvViwKOywUMfsxHts3ekJBmc0wBJhnyj+Kda?=
 =?us-ascii?Q?3aZGThERawb/VtsMNHGDopuDzMHEbubUfCq1yXXk8nRs2mDNDqpzxGP2V0ps?=
 =?us-ascii?Q?3y1uP9py57Q+a/U2PuDdgy81x3P1lqBBfaQ9mWGQsBDRO8fycihiYyurjQty?=
 =?us-ascii?Q?pLCxJCSIOirABE0FxWhKQKIa3dYsZ8Uo5bHC2SNaKqtBIYYNz531RGtLp+t0?=
 =?us-ascii?Q?NJUQP6D3ZCl34sjfBFfpAYRWIZKOouc2qq1GokDU9zwkB5InQa2XdtR2zEWt?=
 =?us-ascii?Q?Ox7sIrTheN+6FeN6nTbtQlcxlTKv2MMCd/rOpZBdyyRqmqY5o0UUCQkdKIVH?=
 =?us-ascii?Q?jMqJurw3BiiNF0EinCXA7XXQ2R4uLZ2cS8M05YEP43nMD0TN3Hh1oQd1bEby?=
 =?us-ascii?Q?x4EUeZ3Mq47MMMDelrNMqhUP7JQHdUIwRq0T9ArGeRiueRMwhPWTceb23Ili?=
 =?us-ascii?Q?1fxIMUmYqbvb9qbbSM4bzqg6Xds+cYt5eM8XKWX68PLpEo80i7ZSGzYoZgbi?=
 =?us-ascii?Q?0ndQ2xDTRioppKyi2w9oNAYIMuvxoowPkbKTP4U9mtr+qzO6S8JS8te2GYEz?=
 =?us-ascii?Q?Iv3ogM/I3msJAP61dv6tPpu+Yxw9D4DiV4tAeh7WedZsJmXSQTn7WpP/yvks?=
 =?us-ascii?Q?Al+hx3F15ij3Jao2vn2lVFQAdlfOC/tG3WfiqEB+2edSjW1V2ctQ1MfNu/vA?=
 =?us-ascii?Q?8m3xXYuWi8h/go/+n8wIQiFWLyXe3Y9J0iYt4ezNdJei4NsbC1dMjXmmuvwq?=
 =?us-ascii?Q?3xSb3zvF32NxMoJVGVURwdeugv7IE0H5s50q026SA2lk1UcSEcjLamlZVhBE?=
 =?us-ascii?Q?bSfechVvMZfAWuwTNpLseBL1uXLeLOd/jLeKJjwsF6vj0zH5E7mamkW50lcp?=
 =?us-ascii?Q?2w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b6ea7de0-0daa-4e92-3f56-08dcbea86efb
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2024 10:36:21.2847 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: myib0gIXyJmNvCfg6MmyYz3zHsowiOd6+mR5DMOrSaj9XqhvPCrcqze2ienpiqoDLD1lNGGsNq1mpOONaJV+hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6679
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

v2: Also move arguments around for consistency (Lucas).

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c        | 15 ++++++++-------
 drivers/gpu/drm/xe/xe_ggtt.h        |  4 ++--
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 10 +++++-----
 3 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 960f5a28b7ed..a359d94a979e 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -347,17 +347,18 @@ static void xe_ggtt_dump_node(struct xe_ggtt *ggtt,
 }
 
 /**
- * xe_ggtt_balloon - prevent allocation of specified GGTT addresses
+ * xe_ggtt_node_balloon - prevent allocation of specified GGTT addresses
  * @ggtt: the &xe_ggtt where we want to make reservation
+
+ * @node: the &xe_ggtt_node to hold reserved GGTT node
  * @start: the starting GGTT address of the reserved region
  * @end: then end GGTT address of the reserved region
- * @node: the &xe_ggtt_node to hold reserved GGTT node
  *
- * Use xe_ggtt_deballoon() to release a reserved GGTT node.
+ * Use xe_ggtt_node_deballoon() to release a reserved GGTT node.
  *
  * Return: 0 on success or a negative error code on failure.
  */
-int xe_ggtt_balloon(struct xe_ggtt *ggtt, u64 start, u64 end, struct xe_ggtt_node *node)
+int xe_ggtt_node_balloon(struct xe_ggtt *ggtt, struct xe_ggtt_node *node, u64 start, u64 end)
 {
 	int err;
 
@@ -384,13 +385,13 @@ int xe_ggtt_balloon(struct xe_ggtt *ggtt, u64 start, u64 end, struct xe_ggtt_nod
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
index 67ae5f1602a3..d61f4f976a5a 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -13,8 +13,8 @@ struct drm_printer;
 int xe_ggtt_init_early(struct xe_ggtt *ggtt);
 int xe_ggtt_init(struct xe_ggtt *ggtt);
 
-int xe_ggtt_balloon(struct xe_ggtt *ggtt, u64 start, u64 size, struct xe_ggtt_node *node);
-void xe_ggtt_deballoon(struct xe_ggtt *ggtt, struct xe_ggtt_node *node);
+int xe_ggtt_node_balloon(struct xe_ggtt *ggtt, struct xe_ggtt_node *node, u64 start, u64 size);
+void xe_ggtt_node_deballoon(struct xe_ggtt *ggtt, struct xe_ggtt_node *node);
 
 int xe_ggtt_node_insert(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
 			u32 size, u32 align);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 47222bd9988d..db9761a68ce0 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -528,7 +528,7 @@ static int vf_balloon_ggtt(struct xe_gt *gt)
 	start = xe_wopcm_size(xe);
 	end = config->ggtt_base;
 	if (end != start) {
-		err = xe_ggtt_balloon(ggtt, start, end, &tile->sriov.vf.ggtt_balloon[0]);
+		err = xe_ggtt_node_balloon(ggtt, &tile->sriov.vf.ggtt_balloon[0], start, end);
 		if (err)
 			goto failed;
 	}
@@ -536,7 +536,7 @@ static int vf_balloon_ggtt(struct xe_gt *gt)
 	start = config->ggtt_base + config->ggtt_size;
 	end = GUC_GGTT_TOP;
 	if (end != start) {
-		err = xe_ggtt_balloon(ggtt, start, end, &tile->sriov.vf.ggtt_balloon[1]);
+		err = xe_ggtt_node_balloon(ggtt, &tile->sriov.vf.ggtt_balloon[1], start, end);
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

