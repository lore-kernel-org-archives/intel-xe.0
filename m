Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E149DE7718B
	for <intel-xe@archiver.kernel.org>; Fri, 20 Dec 2024 15:31:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA39D10EFD6;
	Fri, 20 Dec 2024 15:31:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N9XjOdAw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B3F410EFDA
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Dec 2024 15:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734708661; x=1766244661;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=hzNOJdX6zaqijFU0WXP8pIQLg24WTQNqsZFaoEEseTA=;
 b=N9XjOdAw0Mcf/ZyMhN3mQKS1IYWoBgZ97rAQdDK1fO4E9CpE177xsbdW
 yOXQz1fyAe0gDBC5nTCqxRD/sXmjT0VxmUZIhAcg/MeKqS1GoHtY7mLKA
 dvJSgGuaUIwpl2sZNxx1IZppxNaHLsrJYv+ky+DDV1uSB1WTpNyVCdRoB
 vM7o8pJvBw1XTYrNnFPoghqCjobwvRY3LQVCpYhnQQ/SBs9M/EJSZ4LOM
 BhDht3ld7m41U79gsPMLmPbtsVUiKimIe8vHZUJA7Yg0c3Rkc8hVfz5hU
 8+BHsElhshAtYPqBbZdar3LHVCwveRCc1X599ULzkUF8XF4SkeEOBKWAk g==;
X-CSE-ConnectionGUID: qkiTAFmxTHGMv6WbDL0n7w==
X-CSE-MsgGUID: rdSzrOwST4qQvkqc6nhVGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="34974462"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; d="scan'208";a="34974462"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 07:31:01 -0800
X-CSE-ConnectionGUID: c3LJlztPRaGrqEXmUg/z+g==
X-CSE-MsgGUID: VNlRXjAJQyC/CZC8ln0W6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="135883339"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Dec 2024 07:31:01 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 20 Dec 2024 07:31:00 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 20 Dec 2024 07:31:00 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 20 Dec 2024 07:31:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XTLI6w2q0eKjqIoTyVVcpfDtD7hDmuvbbyCYAS8T1J6vpjIavRFItT+wijzW5c9qM6exx3eR/Zl+a1ZDEa/zOsXTemycg4DbiEF539m5ewpwfSj25MICzVWHa+EEsyy6mJqO4q8+ngxgT6MvuIxRzoEa+MFrLa+8UNZW9aKNRcr1hS0QzxUgtmGJPKgYa/Mw9nCc5IOmxWHzYLwALOPiDpD9YFJkkMl0WilowVAxrmxIgp51WUkB5BjS8l/C8YCD3d7+gKHegI1eGelofqd576qZ0zwEe2yZCBwO1IICxUGBoKOvS1XoSTyZgLEiF7oGyMzPTppPeaF/ilv5LxvOyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w+1oEyJpUHeawcKSl1bT1ylXBMMAD0bixhgXSm/I8h4=;
 b=OmoWNARTXWohu3LFmVDDgidGih3FwOw/kpZTyioA7c54XwupZhN0AMx52+7Fh+M9u1Bj5RnWeQ6RV9ajqdFLqRE8v3e2NXzcHQba46OXy8Awi0hay+xmNs9VTBLLcT8d4cHNSGqcCsjwaIHdOVQEEmp9lyP8VDBpJyWthzLOePI8kuekx8Q2ydDWnpUrUmB3GM/8xAE6L+PDY1ScWjz3x92ZjtZOkIcx12fjzACYRzfF2vtD6wE85AF/naVBqivL4DZAjaW5UYsFyFQNlo6TdbNEIYSEdvi4JnkXgxHZZINznF+meAQNMo1Wc07qGRAEqOe8aXUWnwPmYMqM2v99YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by SA3PR11MB7462.namprd11.prod.outlook.com (2603:10b6:806:31d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Fri, 20 Dec
 2024 15:30:17 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 15:30:17 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Vinay Belgaumkar
 <vinay.belgaumkar@intel.com>
Subject: [PATCH 2/2] drm/xe/lnl: Enable GuC SLPC DCC task
Date: Fri, 20 Dec 2024 10:30:10 -0500
Message-ID: <20241220153010.623747-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241220153010.623747-1-rodrigo.vivi@intel.com>
References: <20241220153010.623747-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR03CA0133.namprd03.prod.outlook.com
 (2603:10b6:303:8c::18) To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|SA3PR11MB7462:EE_
X-MS-Office365-Filtering-Correlation-Id: f6299772-a4d9-469a-2178-08dd210b34da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lb1Ebi4COPDmmr82GjcZwL+AFFEBycuwfWsiF9DnDI64gqTC0OgmQhzZL53+?=
 =?us-ascii?Q?cW44C7pvcwOrRbLiIalwCD0OSM5hVAlFG6yfAgHlFqTlpP9t799p6gZi0d6x?=
 =?us-ascii?Q?BTuAX3shUNGYv6COp9HQ2Ny+6WyEgyS1z4434RvfXpwCHp5iRGnZX/+KzYKk?=
 =?us-ascii?Q?VruSfjqJvq79KYvh5TOpGmY2lxSFGjO4q7dYMIz9NU8GXyoq/FsTVw779ekH?=
 =?us-ascii?Q?rZF7FsuvP+1EZSfqvNh+3cNrFmASnsCUwCk4h0rxsjkXORC1PBulB5wXWx48?=
 =?us-ascii?Q?Cxcr59cTgC2UyQOk/aDD8hnC7/LZOMDJzg9W5bQuqeAOU0iRmLfXwhuhaWGp?=
 =?us-ascii?Q?gQhl9ukt3lhGQDH04idnBDvWdSHZsKuK9H6s1lNG6ORpivORso4XCwhUJ5rv?=
 =?us-ascii?Q?Qmjtf6mcX604GTZRhgbylIUJKAeNMxbCyX8lFacMydjkDZN2qMj+6Kg804BY?=
 =?us-ascii?Q?T8oSfPh304uinjDnNVlu90RNc1yCPKzXk6CGezCJiM776T/mJC2iq0w2Hw6J?=
 =?us-ascii?Q?Qoycma9ATOAey3n0mtX8lWtux/qoZxpTQJ8WaflLBwdlcjb8kohmoiIpIEJl?=
 =?us-ascii?Q?lACPWCh88YOwy0Zi4xtb1tDHLMpojAr6nQlWnKRzFUEn53I1PchZbsEMUZ++?=
 =?us-ascii?Q?bl/y9odofb/YstsnFNu2gV2f0k7EKD8PE8Ta7jsZAoZwaXzJqzOtXewSUXb4?=
 =?us-ascii?Q?cgCX3K/mmNQtiCLzsa7PxkGZ+B5Qzfv697Si0ZvlorrSDwzopo7b9nh9m7iM?=
 =?us-ascii?Q?ThLK7Do1RkrGiTI5W5GX1ffiZq8WKczMo0GZ9PNWumIaNqn9JjoasTH45q5o?=
 =?us-ascii?Q?u37hpwiueggujakrP5qs4eWSeQ4mYqZUYZ+s2S6Xssyo/shRIF58gI06lUwV?=
 =?us-ascii?Q?d6MKxSNQl6nFjR0FaEEhUv1AtRwTqjh9bky65MhKfkR6bfSxZ/Wc22s9wyVQ?=
 =?us-ascii?Q?QQO9IxQTcmh6PLkW1CI7z2mgIeehNNu3UzwEbf8ZOqCTFlOEOFU3oy3idf2l?=
 =?us-ascii?Q?wub8Wi0v2yzCWMZRdXTLGzqkOxNLoUoT00WKuw331e91G/thr47X+R75or7x?=
 =?us-ascii?Q?9H0rkixA2qi4oiaq9vZ5XUnWBJIlCCraz91KKdA7Ft5dlsvpajZLzi66pqdq?=
 =?us-ascii?Q?bYGmq5MWgH8M1JNiboYRp5cBPlWByRnsxts95qHCH6JLtkVkxadlRFimGm3x?=
 =?us-ascii?Q?5bexEMZjWvbOUmE40bULp97w0xu/lZ6YtG1DHjoWNUJ3wDBJv3VPxZhb56hv?=
 =?us-ascii?Q?9wKlxvxNSpDt7FZmViYH20l1DLHo6mQXwzNqo3g2xN29wWwaUZqXQg3jlFHj?=
 =?us-ascii?Q?8WaNzuiu5EztSrCTeqmhhDhQ5Nv05dK3NWYwJMY71j3xzsqIH+oR0H3GLetd?=
 =?us-ascii?Q?VsnPhj9WesEGmB2qU6D/vFDdayvF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PZuu/u/doeV23cbZ+SVKeLHsAaFAeSbU9U0hxmKMvvH+eUlYALTb398YApwJ?=
 =?us-ascii?Q?J1v84PG+OZ7Qo1Q3lD+s2h+TRGaeZ5s2OOJsqy/xs+x+42uVKVojnts8Nppz?=
 =?us-ascii?Q?27UWjpbFvGnlNMNCzR1RqD64Cu/9BmmB4d0YHAPr9vuJ/nlI+KuU3oIRrlVH?=
 =?us-ascii?Q?dTxXDAjtbyqT9gajzV6YB7G3yfQ63Pff6dmgQSE/DiS34zXSkGkWR1l+drHG?=
 =?us-ascii?Q?LCnqETvrjFpEGQ4c4JkhoakbJISbAWXQZsp9onS6lbM26/4pacrsNm7gnw2g?=
 =?us-ascii?Q?Kqso4hAOM1AAzNXVSSUyOE38GxIJxtQRX2ql2EwqhTx/ZSodqiCquEXlznKh?=
 =?us-ascii?Q?0VYJCzGcZfKysIIvXZ6AzLyZZMEl7wZ+k201qqR1yA2+yRsTodmYYU1IkpZK?=
 =?us-ascii?Q?U3iF3jRSKLoXtqXyLANVwtxWJ+i63vThG1SLeH+n25Qq9fOlsWVRTOsfYEm5?=
 =?us-ascii?Q?3cPPzQHeXTz/o2YqhmgF0udkDVGEP0i2QdPwVrbj8o7TxJyp0ZHaRx3ilNGx?=
 =?us-ascii?Q?e3LZiE9ztElKdMh2NiH4H9jyYAghmot/nZmtY+0+UwUl7rrFrCSpwuX/faPQ?=
 =?us-ascii?Q?8moq7eKe4mOuDyIvaNzLPRlEImK4GojE4HVrkH73ThkCKTrtvDyPd22TzDmF?=
 =?us-ascii?Q?JU2b0aQj+RGZhzqp0iyG0EUjO7b7L31bSma9pfayzkWyKwY9Dzf7oU1r6IOA?=
 =?us-ascii?Q?losGCwv+f1ZSjlqpf7g4ayhNaW5HucGnMNOqqUxtFDIH0bzB0Xc3Z+Jvq3/p?=
 =?us-ascii?Q?oG5EiBapZ46/cXuZQztD08He5guHxgVSplvszDx6o7nx4JT9GGF60PDoYE2G?=
 =?us-ascii?Q?BQb4vJ4T37MAS3svyvUNRgyUk+7Kg5O+zioX8afSmJ9+rnEih7S5XQ26Vwqk?=
 =?us-ascii?Q?zT0sC8TU0KoOissw7z0LLlgE2ySgkUAE0F5tA5WgdcIo4dE4RR5kYjjidF8A?=
 =?us-ascii?Q?9LQQU7zmlnv+2S6OSRSyNlnbFn5rCU2UfbHYgu+E4sf/wcakfG/1r7ewpokb?=
 =?us-ascii?Q?rTXlydW2xOUCVfW2jxpHevTA8NXiapPWiRLYdsIJriRIfnZNWIydiPcQh5Iy?=
 =?us-ascii?Q?LP8Cm58mgOGY22njiJHJcVl+rduKbnzR02x+WlpA4j2iWJNI/cDTUQa1Oj2d?=
 =?us-ascii?Q?lu2jXj1ZEyzjXo3L1wmOn6u890r3noQ62s5malEfkTQDE9c9cNk6V/eEa+Rm?=
 =?us-ascii?Q?IzSMkcof+h2GEzjG7Mtn3A9rVEN5XRf4VvQwDXkwuFAVRQp1J/sZOtR8WzfC?=
 =?us-ascii?Q?bNMHOqNt4R1FDYLK9geDWLU4OgOw/LQIxCf24kYj6jX2FUPOapy0WTMHtnJp?=
 =?us-ascii?Q?n9ECl2W2QCgZRhlSHCT4qhLGjiU6lTIah0t93HBtIeAMxei3hPZ0YNC6cWDs?=
 =?us-ascii?Q?YwxhtF6U/QF7G+ufPpYDnO86DbBiw46qEIq3qQ3mdC41sUDBNIJfnx/Q1R7D?=
 =?us-ascii?Q?Phe6nqKdJpKOWzIA9WHC6B0rIoC05nBK4Ob++B+gWuoVjEDIKFy2UB6Xt73T?=
 =?us-ascii?Q?jdTtiSHwavm4x3dikCcb4MrdWZwzRZSOpuboURHuF4FWWw1TfVqLWhAT9D1W?=
 =?us-ascii?Q?tOlW2LCXKBxkQf7+/JlzcplRiB5ywWedTvv1aUX4Q1BqWCM41usANf0Cu9P5?=
 =?us-ascii?Q?EQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f6299772-a4d9-469a-2178-08dd210b34da
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 15:30:17.4410 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ziabNSzQE0wXmIMHG0bL1rCFw8embE1SfLxV8GkGTaK0nxzhU17/PGzXNehgOY4W9YtZVbT4rKuK/I8X2IPALw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7462
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

Enable DCC (Duty Cycle Control) in Lunar Lake.

DCC is the SLPC task that tries to keep
the GT from operating inefficiently when thermally constrained.

Although the recommendation is to enable it, LNL GuC is leaving
it disabled by default on LNL.

It would minimize the GT frequency oscilation on throttled
scenarios, what could potentially reduce latencies.

v2: Move set_policies call after wait for running state, so
    we ensure it is not overwritten. (Vinay)

Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 9f9e0642c796..4233679036de 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -956,6 +956,16 @@ static int pc_init_freqs(struct xe_guc_pc *pc)
 	return ret;
 }
 
+static int slpc_set_policies(struct xe_guc_pc *pc)
+{
+	struct xe_device *xe = pc_to_xe(pc);
+
+	if (xe->info.platform == XE_LUNARLAKE)
+		return pc_action_set_param(pc, SLPC_PARAM_TASK_ENABLE_DCC, 1);
+
+	return 0;
+}
+
 /**
  * xe_guc_pc_start - Start GuC's Power Conservation component
  * @pc: Xe_GuC_PC instance
@@ -1000,6 +1010,10 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
 		goto out;
 	}
 
+	ret = slpc_set_policies(pc);
+	if (ret)
+		goto out;
+
 	ret = pc_init_freqs(pc);
 	if (ret)
 		goto out;
-- 
2.47.1

