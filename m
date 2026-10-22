Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F727606A31A
	for <intel-xe@archiver.kernel.org>; Thu, 22 Oct 2026 21:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hs03sWPC
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A471610E4F5;
	Thu, 22 Oct 2026 21:48:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58D3B10E4F5
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Oct 2026 21:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792705675; x=1824241675;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=LG2jrU96LUANxD31OCA2nB+CklKLS+KY0hyfJScV6bk=;
 b=hs03sWPCCiN8QDbfTcMWHEMo9VjWpDsyksxDCiGU103p/8ZmVo9WwOPv
 fUXU8KFyH/lAWkowBHqLuDiOMn4DCWVQ6uvSWv3jqebrAHvlt3nN4U675
 8Zo+2kFvz1jxheSPPTI2LHBkx8/ZGEcTUKzulgdwkMP7zAvDSU5Ip6jnM
 eTet+LpLwh/U1a1BhN2wJflF+aLlyIOf2NFasSDnZVhi9QzyFxMXaJUn+
 jL+AQ0iuwBuUPdGkJe+U47riUTtemGZ3YW6fzi75dVoq2TF4i7Cisn3CE
 OhJImAzf6KpkLIF/0c32UWnKjcquZYs1CVx1qImMo8RDZu0GE7EdGwTg5 w==;
X-CSE-ConnectionGUID: dGdL11zoRde73wnUzSBogg==
X-CSE-MsgGUID: a1921UuyQHyHRa7fGJQakg==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1485690"
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="1485690"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 14:47:54 -0700
X-CSE-ConnectionGUID: IlJNGmYgSemMbJVABysZQA==
X-CSE-MsgGUID: vRgXGZfySxiqVwZnOf778w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="3371794"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 14:47:53 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 14:47:52 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 22 Oct 2026 14:47:52 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.36) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 14:47:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EuVZmwxhbf1MNIenTQAWXV3iLOyMCz1XLqknDl1ld8VtlJ/X7bXTFTEERwqAo6UEACDYXvzznvUbQES0wIyL62JOpaMWOFDPxiCPD5b+6hG0q1bqkQQ5RKi1oZ8GrvyQzhUCpkTqsYbr53uLv1xiS4IP+RZnu72cvslZNJKBZkj9NZSOzuPgjvPhwSCFSApaW6YL3cf4DRwffVSZ/sDDf8Sqz7cD9npg+CNlXJTUsM8Mro3xqZsS65VcRvqSB1ql/0mabpUaxu9wTKNbiJLBbSIhYpoo27189nkaWQHvc99fTzb4PPVxz1PmAO1bJpwlDm9vSr74aGzrqThG1KJ4lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ixfbuw1APfbG5olFepvY5G1buWJgrrxgYQFw6wtHWXI=;
 b=jLoAX9bzmY+DAfbFVEW51lw3pM34TuJngbgYkfX1OJHZcryV6VBALKgriXisX8cXtWljDrAh6bWZHjRtojJ+PLdMteTJp9EA2n6N4WcWWTStKfMfPCA47wUsO28Uuld/VrmdWXYbAVbEbvDSQmpOW8gWhGT+raTySU48goJjVE5vojuUQJO7u+chvd+qTwCFGct6uyg2HFuHwxMvou8w2zYSbcWZO5knm2Dc/vECo10umHByZi/NAEgamwGniie21Gdb9lYcS2AxY9DMZC1AXfDsK0Ip7pY60ZZGCZdOCDDC/8Dj1y3FoSsztq4oLsaO4OUokoTzKvWcKtkGr/MPkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by CYXPR11MB8663.namprd11.prod.outlook.com (2603:10b6:930:da::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 21:47:47 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0546.016; Thu, 22 Oct 2026
 21:47:47 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH] drm/xe: Don't ask for bug reports on force probed platforms
Date: Thu, 22 Oct 2026 17:47:43 -0400
Message-ID: <20261022214742.3723842-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0017.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::22) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|CYXPR11MB8663:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e55c825-7f16-41c0-7960-08df30861c8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|18002099003|10067099003|261021130227099003|261021121427099003|261022115727099003|261022113327099003|261021135927099003|261021123027099003|261009223027099003|11063799006|261021133027099003|261022105027099003|56012099006|261022075727099003;
X-Microsoft-Antispam-Message-Info: +Wy//+tUQOtB/7h34hk36o0r9qsUCa1Rsruz8YDBqAT9YvUOnnQmNZAQACKM9+oVUxcloWxY/8Po4B4/oil5J81v/TqrGvACtT9bGoO0bI/Y2JeOqljBn/NkiKOmR280A7OVjtAXDH2QTF3UjeQ00v7+R/2dQFOML0e1vFbuPb22IDWlDe1J6JofsZVaJY8QLZePfbsH7bms1tppSkfUMFJaJYLlPyerGx1+yW/mCUdAjlonPNAmAxpi3vTTI7V9FIUpLorW6BKCzfRniU3J+8r3Ig3OyV1/bTTKANIb0n5FlIZ2jYaJ1yMojChMJO9ePCznP3gk27fb7fsx2dASe8/Xu8H3T9uNLoomNuCMDIem4ZpLUM0q5Tr4+h5TE4jr92jp0Vnkmq0/oP2kvIcwQb8OMqh46ifiui/NrpcVhw7uWIytp13hY3XkdASC6g6DJWUFcVZSyRt/iu49tlwfXsOX02porkh00ZF5j2qVc/oI+Xxhpdocnf8u4aNOSLYH5LT9IJp4frZPJ9oB0VByVqptixESqT/R50IB4AGm9QwRiIQGKvmNByvJ3JucMhA5/LggOPHmpnUmt4dS7TXImg28n41jDbVMIO0w/EeZ42GlL/CHgBJuWsriA4PsJTKKcOUIFp3srwKrtBi429FhBDg1KFH05kHBCQiJ5ECJP+A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(18002099003)(10067099003)(261021130227099003)(261021121427099003)(261022115727099003)(261022113327099003)(261021135927099003)(261021123027099003)(261009223027099003)(11063799006)(261021133027099003)(261022105027099003)(56012099006)(261022075727099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1NAeWFLxmVIPHJKNB4zh4PbJfuGcJ6hpWNAvi0AAX9wYf1U09UzKVLA7cQUS?=
 =?us-ascii?Q?374zKuZZfrZHratlP1fRVySzHypR5XXPeQVtxV+NQ9Qv/gzGl7QfnwYnFZNO?=
 =?us-ascii?Q?9abwbKMieAGbinpbHLNd+LM7+4JZ0vr0E2GXucTfWn1oIv2CELQ6FGJdMl4c?=
 =?us-ascii?Q?yHae08R3yLcb6K9SjhMfu28n/+W5yGpz6dStNQdr7CDnVF68Ll7Ckh/VcNBP?=
 =?us-ascii?Q?xuKAvBJYj7aiwtGw2PDPRwuW3DVr0ROT3nsHWM4Y80EwEpAh77/sLxZPicZt?=
 =?us-ascii?Q?VR7pxMaDCvTaNh3K7gt4NtuNx9jgEIhPGAp6SngC4znAcITZQQ8kLWuznKdp?=
 =?us-ascii?Q?gAwteF7K6pCCReNvRAlV/i3xmNzlXA96i7lrgfsGsRaWnVm5yX/GyY1dCrNs?=
 =?us-ascii?Q?XkTe2aEE6LR59VKVkLrXWQv6yc28GCdXU+wb5z5enhz/JQtEe3agQ/lyqFTD?=
 =?us-ascii?Q?VI5BqG0WSHVnpJdRS18TUV7kqbOVWpBj/zCd0bQA8qKohloZwuVCbFKYLYoJ?=
 =?us-ascii?Q?EKRBYwlRVKYpdzIc6xEe5T589vp+6Qg4xoQH0+X/Zu9aIB+RB8FWvCcfS555?=
 =?us-ascii?Q?sRxuQKkz774vsAdBVSxRP2JU+H8lsA/mlDCT8AWxPpQYtffvJnAxACMiC9Ry?=
 =?us-ascii?Q?PyKsdl3r6b4ettfjhSqw1rvhO8M/mTDzs4kMuUyu4PNF0qmH7dekQIMj1ZLM?=
 =?us-ascii?Q?X/SGuLSLUsbWg+cSkhYz+ingKCVs0mAb/m8tiX85b8sOTDB8fD2rLV4n6f22?=
 =?us-ascii?Q?p1DyMlSLupPeLmZ5rYdqnG+lbFdi8mZBy02MQtLpu+IHs9VTeBzy+WkM+StV?=
 =?us-ascii?Q?5vsoLpA8uFVaydMjqhJk6x7wbYat00zQg2tzIU80wBY/MDVafLlLyiDiZeEv?=
 =?us-ascii?Q?ZUs45tfc0jaUK/E34UfX++6JToxOwivaDkwhWqV1sys/dvPl4JRzMpVI+nqQ?=
 =?us-ascii?Q?00kL3rNjOKYsN1xZ4KZecL9vyf9FWG9R5EgHATh8L9leoc/MXLGXIRb5zdCk?=
 =?us-ascii?Q?UbmYUqtsX0u4GqTZK9HflGxZguocDatSM+uy7FK8EAflsri3tvnR1+3jK01t?=
 =?us-ascii?Q?xOnOiTsbHyQJblrQM5BMVBDmsACg4v3CKnmr6S0eoaEn/xYkXOOqfa4+Zk4i?=
 =?us-ascii?Q?QFLq2yC2dNKHwgTe//PSSw8WqXVlwqpwzzOYPINEBacrjHFa6craHFuSmO9c?=
 =?us-ascii?Q?m7o1s2u0MAu+doBEncHtQGxJGTMGQDbz4wvTVqkqOOZJu/vDW7tZFlG785ew?=
 =?us-ascii?Q?mv39Hu3KqH0DN5y46yzSbMuBxIsNaB+MLaajiGk5nBT20nFHK7s5pqYu3n0a?=
 =?us-ascii?Q?uDcXzdwwfzKXtPDK31AqQBJ8IJ8laipsdNxG89n2eIKNADazrnGEVMAL+njO?=
 =?us-ascii?Q?8aOEM/rdQz8hv7+CQzmfMYyRDdMaLVxonsiq4FiJXv+V9BvevZC1vAGiTP1U?=
 =?us-ascii?Q?BOtUHgfF8yjZAQg4DwRSLzoy210Hm0KriBsNfg39iJqFIjzJePlnw+yFafLn?=
 =?us-ascii?Q?AKOEj1V5e8QedljVLCQtL2kV35JQ+adTpO7LZ4TcNmrZMhtGi/Bluo1291HS?=
 =?us-ascii?Q?6CMIpzSQATg28/qYHh0QZtBIYINodtnVdC5VKcyrTidA8/284XFzfBhWXgtC?=
 =?us-ascii?Q?8Ai/09/OeXRMqgi/caWIQNjlrQicH4KnLSPkAz7o9TbGYcDk96/UorRz0rXj?=
 =?us-ascii?Q?/XNp6p4knJDhT7Rc/1xZlcqwVKs6yMZGQMIjkVNJWfZNIE1eezAdPzuDESg7?=
 =?us-ascii?Q?pBZ4naY0Fg=3D=3D?=
X-Exchange-RoutingPolicyChecked: ZwAvVKJFDC4+LK5IprcKFp0vyoRcrf56H322GKrA68Qc8FfpaMVXr9+xBkFXjd8uQQjpoGyf3Vw5aqU/E+v3A0xFYii22BZQNmfsZrQvhmMFAi7Z9NM9nuM/p1N+0Xh/88uzO/STp0thaVrHWBzBqDMGdm8xpDJqUrOP6tqQU8s1VVsszIgvlgxx1bE0XVYlskpMB3M2wIGYV2ht1WDMj/T+MVgMXahIehN2I7DjDQIb5AezwU32Os5qyKUKAOS2qyHSAwP5hgDvzdzWzo4BtIInkaULK3llZD7MbuvCN6tM8ITjHBCona4K000aKjdxuaM/+vZvByTPJxPxj8SB+Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e55c825-7f16-41c0-7960-08df30861c8b
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 21:47:47.5497 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NIJue5K7Vz829/nRDFNWH5EueztFWJLWEeQGjgKILUORkvgAfnjmkTa5peY7odRODd1GabryE5jEQZopH4vGxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8663
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Platforms that require force_probe are not yet officially supported,
and users enabling them do so at their own risk. Only point to the
issue tracker when a device gets wedged on supported platforms.

Suggested-by: Jani Nikula <jani.nikula@intel.com>
Assisted-by: LLM
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h | 2 ++
 drivers/gpu/drm/xe/xe_pci.c          | 1 +
 drivers/gpu/drm/xe/xe_wedge.c        | 8 +++++---
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 6a6f9a24365c..a318aa5f363c 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -236,6 +236,8 @@ struct xe_device {
 		 * state the firmware or bootloader left it in.
 		 */
 		u8 probe_display:1;
+		/** @info.require_force_probe: platform requires force_probe */
+		u8 require_force_probe:1;
 		/** @info.skip_guc_pc: Skip GuC based PM feature init */
 		u8 skip_guc_pc:1;
 		/** @info.skip_pcode: skip access to PCODE uC */
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 0c13eb901aa7..99f6c379f334 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -824,6 +824,7 @@ static int xe_info_init_early(struct xe_device *xe,
 		desc->has_sriov;
 	xe->info.has_sysctrl = desc->has_sysctrl;
 	xe->info.has_temp_sentinel = desc->has_temp_sentinel;
+	xe->info.require_force_probe = desc->require_force_probe;
 	xe->info.skip_guc_pc = desc->skip_guc_pc;
 	xe->info.skip_pcode = desc->skip_pcode;
 	xe->info.needs_scratch = desc->needs_scratch;
diff --git a/drivers/gpu/drm/xe/xe_wedge.c b/drivers/gpu/drm/xe/xe_wedge.c
index 2f35937c5e66..0bc0a4ffc594 100644
--- a/drivers/gpu/drm/xe/xe_wedge.c
+++ b/drivers/gpu/drm/xe/xe_wedge.c
@@ -105,9 +105,11 @@ void xe_wedge_declare(struct xe_device *xe, unsigned long method)
 
 	xe_log_err_fatal(xe, WEDGED, -EIO, "Device declared wedged!\n");
 	xe_err_once(xe, "IOCTLs and executions are now blocked!\n"
-			"For recovery procedure, refer to %s\n"
-			"Please file a _new_ bug report at %s\n",
-			WEDGED_URL, XE_BUG_URL);
+			"For recovery procedure, refer to %s\n",
+			WEDGED_URL);
+	if (!xe->info.require_force_probe)
+		xe_err_once(xe, "Please file a _new_ bug report at %s\n",
+			    XE_BUG_URL);
 
 	for_each_initialized_gt(gt, xe, id)
 		xe_gt_wedge_declare(gt);
-- 
2.55.0

