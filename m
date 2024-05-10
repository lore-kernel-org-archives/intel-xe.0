Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B72EBC25B77
	for <intel-xe@archiver.kernel.org>; Fri, 10 May 2024 12:22:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3622C10E97F;
	Fri, 10 May 2024 12:22:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xp37E69K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBB9410E06E;
 Fri, 10 May 2024 12:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715343765; x=1746879765;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=jTWoe+FHA1OgDeCtYpDImYfUP4pghBbMNE6Scdau55U=;
 b=Xp37E69KXh4lGOAAuzHxjIFwVLhg3XG7nP5V3M2ie7X+ueAxfIDu0AWq
 jOCQW/h7T1ccR8pqOZGWXiCAS5YN0h708KfivV4iiy6n49Bl1sIjtPXaL
 Xu1fwNN1jneVHVx5wOvCLJL8BlEADJHqYKpNwHxfMiiNELfMIimuqpM0h
 HcwFFGBvefSA3RPkW83P2GU7ffuwTTZZFlbvmRbaX/ARCugSUEN3sBVxd
 0xx+x4KFtfSMeew4DlwjMWttXGYEzJGtjerxVooBvl7kgyhYN1VWmbGOw
 Wn5j4oqxIDL5uh42u75G4TEjgLoNZW7C8BZcYsR0K5JPYXwb/h+xUNrv+ Q==;
X-CSE-ConnectionGUID: SmSMxz8bRLye/eCcQTsznQ==
X-CSE-MsgGUID: AynGCrEqTaqV7STo3MDVYg==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="11158155"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="11158155"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 05:22:45 -0700
X-CSE-ConnectionGUID: Tq7rrYqJQvKO6zZpFpZzQQ==
X-CSE-MsgGUID: lOhmzxqATo6xiEIAaorI6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="60451559"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 May 2024 05:22:45 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 10 May 2024 05:22:45 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 10 May 2024 05:22:45 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 10 May 2024 05:22:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kx/yTQxI8IdnGyh8VDPOSHSRK3aJvIy896SvouYiH0D5RGzmoE/Ds9p2YrNHU5lcyeuCuF00fVObj17nc+0165m53k7ItnIbnyvRldoW3wNeZ9xY+bU6+P/APFTEX/uW3n4P6y2+KMmQgH8Mwn5tbZFtk1INeTEIJHQdaXzYJcLpxBADGsJRt6NO51OzWoiRznU1gG9RKCYhDNdvwJK1ERvLFjChOZtpJ2H6OnasLlUBqQTUjPKDZ3u5Ov6505TUorZL+esZDhgAkfDXH9b6I9WLqnw9hFc6io7d3wCnuwb0i8iWytmMJc/8Jir5OSIIJkU6rH7ACkLQyS3fBVeu1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hZWmmeWagT1U2745UBypm5CvhReB9NyHMzQ0wM1DVd0=;
 b=EVLSkDeHcRTFqdfrdnKP5fB/xLcdX3i+PfiWCqXIfcNKEUuOIn4Yxt38m0FYFBOsnEC/AIYmwRpDgkhQtIk7+ju+gu7I/mPWrCEc0MKheS2RklI2UhunlDPGqtszGjiyD2/B9acBol7gf0dAynFsoIpfWgXQMB4cNxa9beIwScRg4tkuJGD5VV4TxuSZxtM6VrDqbUR0/qgH6sOqzC24XmKOyk1joSH0faqrnzCKH/rd/TUEkdISQ0M8g9rpEjgETu8eH9T1v8hAe9i7wf1FAZwU4+ECiY44yOqFAd+j66dOTwNe9eKZ50pxvF+V4hG5mNCnnOTOKBtw/tWMLUCWCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB4901.namprd11.prod.outlook.com (2603:10b6:510:3a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.48; Fri, 10 May
 2024 12:22:43 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7544.047; Fri, 10 May 2024
 12:22:43 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH i-g-t 3/4] tests/intel/xe_pm: Only check the rpm resume after
 the first mmap operation
Date: Fri, 10 May 2024 08:22:29 -0400
Message-ID: <20240510122230.724229-3-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240510122230.724229-1-rodrigo.vivi@intel.com>
References: <20240510122230.724229-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR03CA0063.namprd03.prod.outlook.com
 (2603:10b6:303:b6::8) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB4901:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cdd1fdb-2f95-438e-6a69-08dc70ebe459
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?e4K/9GZlSyiJyzuhqTtNSBmakrZYRBC8MgMhPA/x9ti/zNAsSHh9HgVGka1t?=
 =?us-ascii?Q?nmagfUifE+agsHwSuCm8l3VEkp82yu9k5bxd3DOZ7f7iUqWLJtGF0KPt8b4V?=
 =?us-ascii?Q?HvTD3XkiNMIH+jbzwkRDwu7Qv4bJ7mn9b3btxPsGql/MnT2ED+eqfzZFLyRS?=
 =?us-ascii?Q?iFehWImorzaVH73Mtxl4tg8aG2BD7suxwV5e5DD1EVtkHBNNphE0WwEFBo1r?=
 =?us-ascii?Q?GvvxoncGyV4BlYrxOcQnLyGCwLJ6UBlHcS31vLZDEcND9ig0DhkmVRKg8AGT?=
 =?us-ascii?Q?kXuf0CU3I5Nj48W6OLaAP99qAsXA64U2qc7YGbngqXD5n5ML9tN4twKx0Fbd?=
 =?us-ascii?Q?isxRAGwBDdatoWz4MNBIsHdxNNNMPcnZnvvaF5NGjF50NPlMrZUJKs9CVAMZ?=
 =?us-ascii?Q?UcME/c3IaxDezPoWAhF9PqV++eu2Q1HREvYJwH1zFFUqPONotIb7LuZvMDKW?=
 =?us-ascii?Q?dqFc7ovrQakPTamd79z+Juo09WOwO4Tqnz7anTmmYK1ZaZTiX4a8nVUgVqTk?=
 =?us-ascii?Q?gYUUFT/jR45sM9RXQCQpfJHn53DPatJzdNoqJuBTIR+BuhIfDEZLYM58zisT?=
 =?us-ascii?Q?6XS7dNxQqGMnF3FpaczPGj+v71KdpvB8PyaTsBT/DKnG/wMx18CpQbx6+Gl8?=
 =?us-ascii?Q?LM1Ujp+yWgp6XUSev30UDDdoPuL5wh83GfgwM/27GtbH0hfsQguyiGWHE0go?=
 =?us-ascii?Q?p/6uR56NtFHMmzvft2xs7rY98ouHmK5eDrrGss6eIAz1kz/GqZBOKRuhhLyi?=
 =?us-ascii?Q?eAPfqOrABNVRIKmWQDRFDqTpSwGIpSdSTe4b5fDrCcw9ACO569ydIQiHQO2L?=
 =?us-ascii?Q?ZwRaPzNps+7Vf4sCQ8YyboI9RNkyMAnpewqS0nSPEK3+Bwdr87QsxW255ve3?=
 =?us-ascii?Q?scl77WKdAYDK78j1dMhoGV5m832Doksk6twgsCyLrEsTGsuyjKUi3agMWbj9?=
 =?us-ascii?Q?4DSy17hdjI3/3nfJC9DYD9yjpsMYGv5rVvHAr3hNUlGSijBK/T6uxEdoSNyz?=
 =?us-ascii?Q?P/MAwfvWw227nBN2zgeVyI9iVJRc7G6z40GsJyVVHbuoJcIOyo368g+Snw7S?=
 =?us-ascii?Q?yny3+wZIgURXQ4OUwm3esaN/kI2ejJPLZoAWsE434m++3NSOiB2F199wF1w7?=
 =?us-ascii?Q?A2FIMsC+u8dZP6v/AEQH9HxyjBCYNizejTvlUjPubDrTQLBrnQFCwT6b7xIn?=
 =?us-ascii?Q?LK3mw1ENjTvjBfd4LKESh1PYFDYdpnoMftceEFsW6MXd7H/MR6MZokgfPBv7?=
 =?us-ascii?Q?k2ZxvYIsIOzwLXpBjaEWNmWzTcpvuyIXajneKV+f0w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6DM9hUhbzBp10poV/MTStuJiqMVkByXBmQ59l8AhNAe4Z7Hi3Q3RuxAwUt15?=
 =?us-ascii?Q?3Fd7zMFaGXUTh4x7UhJYQK2rhZpjdHOjO0Jgb9JY2bM3yPrArfx9wW/jMB74?=
 =?us-ascii?Q?C2FPlVC2jhIwRtTPomdsx4lgkXHzoSpjCiW6PaK4ZcebJ2pgz1uAz1l2KETY?=
 =?us-ascii?Q?UWFBC4VHobU234Ka6qEwMH6yZCH5QBZE2q2A9oY+egy5hAPlQ7NST8KLZFOn?=
 =?us-ascii?Q?UJSPvqck5Fqo+ZwretsBWgChl96c0rHiWy74GkuSadM+b6Qq9k6/zUFwiTim?=
 =?us-ascii?Q?v+vlXozUlGCHejvomdY0NlD5EsfyIhU7zATGUjHlUVuosCvASbRDtqNx7o7e?=
 =?us-ascii?Q?aJXCwUWPe6gwi56mwdjaTxgT/BaNPA5oqOkHFgxztiNT0/7BKfGxV+nqftn6?=
 =?us-ascii?Q?reMe1Y8OqaZ4qt01E/urngDTw8zPk6REp18MJ3PKZ2Y+wpVHPzoVka4xiuZs?=
 =?us-ascii?Q?/zMzHzhBs6+VotBrFmKTiRvmkcGvlfOBmIdhiQGJEaRv+LpaI4gQRZd7dATh?=
 =?us-ascii?Q?VRbOg3UOUvMEM69MXb/yFNscJSXRa/S6vpAY9/do0aaqs2z30VelIdtxVgqG?=
 =?us-ascii?Q?HhcHJQvvHzYyHcNte9H6+gnVSgEnjk4JU05YHYm8Kc6Gb/of4JaVwqqX28eM?=
 =?us-ascii?Q?zq2BOoCHnzVqW0jtiNf/KFtpUBLa6ZlYI3jl2hS6Je96JJwf8VD5Dm5lspun?=
 =?us-ascii?Q?HrgOLcR7P+xMDnsQjXuX4yqRRHOwBMhHGk86CplRF2qi5+OtaLEqtMPl4EYS?=
 =?us-ascii?Q?rzkDtKUDbwVKih65oOiokADIcc5amejSOnQVtnQUXyYxxzXLl8a3kKwx4HiC?=
 =?us-ascii?Q?OjrPKdqMzicUPtbWEv+ZGCThNvo4o8J/rUl1FJT5zeFWP5g4FjRAbjWxKDzY?=
 =?us-ascii?Q?IIGB0ujbhreUbXUjV9SHdC7sBBbOF292adVFlPSTf8vws1Qc/02RtmIps0LZ?=
 =?us-ascii?Q?s5uyYnwLX0IHMk1HBz+L9iUd0F1XWJPN00lz5YFmBKgU0Hg7GZBOAOBRIsG9?=
 =?us-ascii?Q?MrYh0FqplQE+TcE7lTxdFL3DGQ/tXpOwtl7GjNBZtlAdsaYZXAbfUsRWbeRw?=
 =?us-ascii?Q?gM+dkHUpnNGGBI/8WprT8uaQ/xU7OHawDyy9i6YKPX0nI76pdk/ZwovGwNpd?=
 =?us-ascii?Q?NzwMFmBWq1p7k+J7yOgKEDF5XKIii9vmJ0Z9AG3iD/LWzmHpF4KWQCqubRzR?=
 =?us-ascii?Q?O+aA9pzHUw1xxD4Z5DPQfatuu9Dvcym6jJr27ljjZZR+zeX+fpp1Eb7h3kRb?=
 =?us-ascii?Q?uy5T9AIqMO+k0Jhh0GG6hbFCRPHP8zZoT5e2SvdZLT6afH3w/oJRZ7A44DO1?=
 =?us-ascii?Q?qsaMkf0SmsyoHHM214VbXoqM6ku+JtJWSabhcFStApHLc/TYZAmZ8lF+vrgY?=
 =?us-ascii?Q?CTx1SPglIMGdoaKOHOnz8NiToH98S5qTNhhUeO8biEshEnW22sA72zH4q5I5?=
 =?us-ascii?Q?Tm4jtp9vZ+7y1EyBlps1t0SA3R7mHyqVVi2u0MtKEoG/utmPA1o3PKV9DDzG?=
 =?us-ascii?Q?B0dehCrz3+Xg+uYt3X/FU1bs4kWlqhoQ/09ON61E6YlxfC/+89z4+pPeSe+R?=
 =?us-ascii?Q?PKhUyeruRutJ9tsA0yl2FiXwKg852PEQ8/h0JxvOmieAkfry9W2VoJ3hX3hR?=
 =?us-ascii?Q?+A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cdd1fdb-2f95-438e-6a69-08dc70ebe459
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2024 12:22:43.2197 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J73U9ziSIXPV5GDet5UzZ/65Crzs+qAVgsqBXQf+lz7thAP9+Ka7Hpe1S7liMdM4wP4mWtxKjl1rT6/qLOOUYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4901
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

The very first memory operation on a mmaped region after runtime suspend,
the device will be resumed if the memory used is vram.
However, after this first operation with page fault, the memory
can be migrated to the system memory.

During this migration, Xe kernel will get a notification at
xe_bo_move_notify, and the bo will be removed from the
vram_userfault list. Then, on the next suspend, we won't mark
bo for page fault and resume won't happen and the active count
won't increase. This is okay, since the bo is now in the system
memory we don't need to wake up the device. But the current
test is wrong, because it assumes that the bo keeps forever
in vram, what is the issue here.

Only checking the resume after the first operation is the
enough. But also, ensure that both read and write operations
are actually validated.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tests/intel/xe_pm.c | 36 +++++++++++++++++++++++++-----------
 1 file changed, 25 insertions(+), 11 deletions(-)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index 72d484163..81226a910 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -37,6 +37,11 @@
 #define PREFETCH (0x1 << 1)
 #define UNBIND_ALL (0x1 << 2)
 
+enum mem_op {
+	READ,
+	WRITE,
+};
+
 typedef struct {
 	int fd_xe;
 	struct pci_device *pci_xe;
@@ -525,7 +530,8 @@ static void test_vram_d3cold_threshold(device_t device, int sysfs_fd)
  *
  * Functionality: pm-d3
  */
-static void test_mmap(device_t device, uint32_t placement, uint32_t flags)
+static void test_mmap(device_t device, uint32_t placement, uint32_t flags,
+		      enum mem_op first_op)
 {
 	size_t bo_size = 8192;
 	uint32_t *map = NULL;
@@ -563,8 +569,12 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags)
 	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
 	active_time = igt_pm_get_runtime_active_time(device.pci_xe);
 
-	for (i = 0; i < bo_size / sizeof(*map); i++)
-		igt_assert(map[i] == MAGIC_1);
+	for (i = 0; i < bo_size / sizeof(*map); i++) {
+		if (first_op == READ)
+			igt_assert(map[i] == MAGIC_1);
+		else
+			map[i] = MAGIC_2;
+	}
 
 	/* dgfx page-fault on mmaping should wake the gpu */
 	if (xe_has_vram(device.fd_xe) && flags & DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM)
@@ -574,12 +584,12 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags)
 	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
 	active_time = igt_pm_get_runtime_active_time(device.pci_xe);
 
-	for (i = 0; i < bo_size / sizeof(*map); i++)
-		map[i] = MAGIC_2;
-
-	if (xe_has_vram(device.fd_xe) && flags & DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM)
-		igt_assert(igt_pm_get_runtime_active_time(device.pci_xe) >
-			   active_time);
+	for (i = 0; i < bo_size / sizeof(*map); i++) {
+		if (first_op == READ)
+			map[i] = MAGIC_2;
+		else
+			igt_assert(map[i] == MAGIC_2);
+	}
 
 	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
 
@@ -781,7 +791,8 @@ igt_main
 			     "when device along with parent bridge in d3");
 		igt_subtest("d3-mmap-system") {
 			dpms_on_off(device, DRM_MODE_DPMS_OFF);
-			test_mmap(device, system_memory(device.fd_xe), 0);
+			test_mmap(device, system_memory(device.fd_xe), 0, READ);
+			test_mmap(device, system_memory(device.fd_xe), 0, WRITE);
 			dpms_on_off(device, DRM_MODE_DPMS_ON);
 		}
 
@@ -800,7 +811,10 @@ igt_main
 			/* Give some auto suspend delay to validate rpm active during page fault */
 			igt_pm_set_autosuspend_delay(device.pci_xe, 1000);
 			dpms_on_off(device, DRM_MODE_DPMS_OFF);
-			test_mmap(device, vram_memory(device.fd_xe, 0), DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+			test_mmap(device, vram_memory(device.fd_xe, 0),
+				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM, READ);
+			test_mmap(device, vram_memory(device.fd_xe, 0),
+				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM, WRITE);
 			dpms_on_off(device, DRM_MODE_DPMS_ON);
 			igt_pm_set_autosuspend_delay(device.pci_xe, delay_ms);
 		}
-- 
2.44.0

