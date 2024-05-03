Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72FADC4345F
	for <intel-xe@archiver.kernel.org>; Fri,  3 May 2024 19:13:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 241D7112947;
	Fri,  3 May 2024 19:13:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CmQx887E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68232112947
 for <intel-xe@lists.freedesktop.org>; Fri,  3 May 2024 19:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714763624; x=1746299624;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=XdlqNihvPFkFl48SXVE2BU4/u9Gk/ZQKeU9+1CfTGTQ=;
 b=CmQx887E7aA5jIzDoUoC3za4ETGL2/zIo67qPVPjg+iL0B1ylZxxGpRd
 aZdfqIFw293M9+36p2bEmzidx4YvNRLPkM9MASWMTLg+eEq1iJOU6CIjc
 oS5uQHzFHjpWrLbO2juYMPnZ8T82oQNUcsqPKHJtpMVMm8A2YKOQ3KtDq
 C418jwbPzA6rzehsaks+c9mJ/H1Bluna+5XbsTQZog+F3itTUCh+YfABl
 96mtVTv7gyZ1p+ar0XJ32QSbA3zAaBG86+mFvJwKKc3VxfmWlR7soeUIn
 PtzDATItC04IOUTu5klTuFYQhuQMa4dfA6Jkk15kTrLHc47Hvd4PWwWiR Q==;
X-CSE-ConnectionGUID: 5ndLWnJGRPKyCVAmL8yuYg==
X-CSE-MsgGUID: dDQLeYBmQhySP3cWT7pGVw==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="10463056"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="10463056"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 12:13:44 -0700
X-CSE-ConnectionGUID: iapCTx6bRQCrw3zj+ne9wA==
X-CSE-MsgGUID: XtldAxWARea0H/Z/FF/CHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="27594955"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 May 2024 12:13:44 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 3 May 2024 12:13:43 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 3 May 2024 12:13:43 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 3 May 2024 12:13:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BY23AVfZI9OC9vg+LnDEgEzcQD4K/TgpPeOgJ1J2YlDzBmMhR+NBk6wLFifdn5F3fQGrAN7RYPKC51HDY/nITkq1PhDW6DQeKN750HUquBzKVC5pqOUSwurm/44SUxaezfWk+kP7zxprb+xUiRwidZ9GcZ7ZqZGBPcv8MooxeIxCRw7z/rp7s20dmc8PdAItcxBhBuNporxPCqwmy1OPkfJY0bl9kj900YrZcfr0ireAzTqNrWab71/uBoXP2WMUn9bn0t3og/TlAlVSLSKG5ildDw3XIZF46JNDgv+lBoyC738LRaETZ2wIBwE5q38/eKLSGY2mh2zubTtXJc+6wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yP3v/elRDxUEwcu3eKVhveb83h4EXGk2hrtwrH80w6M=;
 b=BQXAoWY09AaF/h5ohnk9DrRMG1Tnf9pYVFdKXCTkWr0uqhCSP+C12NnZF2BUFf0yf/7hI9dAavKWQo6PMmWqUFZknp4hMCTPZnR7km5yK0RjtCYGdBTAkDyuwJRAKDdp5kVFbfQxUy8U3Ju9GCsyZu5XtQwAsS0P3N/DqIm4NylZcoYXK8QSUL66r24EbzgwFHV8waWdSoi2wm1rx83TdGtP6wK4DWsRfi1aVEAWmL1sDtEEHIy4Db7//JUg3ZZF8LZ9R8p/NEJaHKk9bZ/Frw53tr4LZldxqWp31XWvjLOs8Q6UNG9unVOUCAORdxc/wt+hNBd9Kz4WWzEyjYI82A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS0PR11MB7579.namprd11.prod.outlook.com (2603:10b6:8:14d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.30; Fri, 3 May
 2024 19:13:41 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7519.031; Fri, 3 May 2024
 19:13:41 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <lucas.demarchi@intel.com>, <matthew.brost@intel.com>,
 <francois.dugast@intel.com>, <thomas.hellstrom@linux.intel.com>,
 <matthew.auld@intel.com>, <anshuman.gupta@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
Subject: [PATCH 7/7] drm/xe: Enable D3Cold on 'low' VRAM utilization
Date: Fri, 3 May 2024 15:13:09 -0400
Message-ID: <20240503191309.7022-8-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240503191309.7022-1-rodrigo.vivi@intel.com>
References: <20240503191309.7022-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0065.namprd02.prod.outlook.com
 (2603:10b6:a03:54::42) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DS0PR11MB7579:EE_
X-MS-Office365-Filtering-Correlation-Id: 7732181f-d5bb-4444-b84c-08dc6ba524bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rvCQUqCAngWECv0o3UExpOsjyQyIli65bWPy0LhO6HTTXLbuMY8ddpsXCJ7h?=
 =?us-ascii?Q?QvlBnJG61e4Tmb+uWvRC+3lxvbB06eR8MYZje2J17R54ppWrmKoy7AzHu45e?=
 =?us-ascii?Q?zetVE105+NLmME1BQFu/GXAowINHlFCNaGer0yAG8RAFBmvJ/HSr/wflg7hr?=
 =?us-ascii?Q?dtFcd4XpXrwaZZbeAkUCG0a3QDtrLtzw4Ix3QTUi9J5Co7GNbzxvIqvKgeRu?=
 =?us-ascii?Q?GYCkDoqCKKdY6bDSEeLctNCrHpmuiXNGq6y+Ha8dEepD/ayh2FIq3zfjWhrQ?=
 =?us-ascii?Q?gweMJ49/QZdNwpfEVLpu+GSDKvz7V2EE2R2g4vfbpvaHqId0lvZlcER++69F?=
 =?us-ascii?Q?lj1tm6fs9ZCoFn0zDhJvtN05qwspfM1s37502GGfclbhHGB+OBAgeLw+wFvJ?=
 =?us-ascii?Q?CFf2jcyLwr7fc3X70P9tT2/S2PmC/cXut32Xi91uvAUaqoEyIoVmv3WG0uK/?=
 =?us-ascii?Q?+EC5TAqGNu0x1iZfxUQY5HFLUF9l6WTShUKYAlRHZxLzdQ/BbdBVDTI0fMUV?=
 =?us-ascii?Q?jAU0iARGIf6WjEyL9quLCm3QmXbwmB5xf6Ayc9x1LbO36fVUmZdwA0dY+ruh?=
 =?us-ascii?Q?U9IEsQWuYK+oTdaWnAq1koyPybs1x3gI0yi339yhtaM/zTUbjSE9JFXzY3Us?=
 =?us-ascii?Q?prab9sqad74cv2nq5UmQfwZeOGqeoOWRabrkoBpEEpYTIbkx6c8r+jas9GrY?=
 =?us-ascii?Q?sEMlclKQQxp8YzEljOzcrEJkCGEuOoJpijT4p4w9AYqDGT4ccAJAbLEUsanH?=
 =?us-ascii?Q?VcSLTWgNwEZ5AXJthLe56z3HNyX5X2gU+O1XoXR5bZv2m2+3yZNcY/du0ZPy?=
 =?us-ascii?Q?c86FYmLLwR7QchymFdNODDuBU0ccgMWAsARqi/JsXmvv6ZhUT3q+024istF2?=
 =?us-ascii?Q?jm5qSzPfLzcVMZndgAcFiRjLj5BNEzeb0FxEf871n3h+XpS5alDxXJjdgMfG?=
 =?us-ascii?Q?hxX8xPNtrjQE/NN17geM+pC+xaYyhmEFJszkP7ak9kmpT7b1q938icuQTwoJ?=
 =?us-ascii?Q?hLQVbn+KxSG4It6028BZKVNgxVAZCG6hqH9Y90Gxi5IpJPThUu3IuKaWb8rD?=
 =?us-ascii?Q?z2UCiqBMzLhYwUwSSNsZD1FJ31StoN6il829Sf8v+zILZPv3Exm24vz+Xi+B?=
 =?us-ascii?Q?eN1fPuu7gm5EImGMug/2zrVdos5JW3Mr5JtivlUcA1qQi7VUc7pEClXPsNAf?=
 =?us-ascii?Q?d0RUetRDkse6+lkSvI8D5v6QZaZXcAtF24VuiK13Bu7rwB6ko6X0Z71tj+jx?=
 =?us-ascii?Q?Wl+9euQE5pZeWmbK4VhSRqwt1EYCJUQauBZL7E9brw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xadpP5yn5ZbgTNV1++xye74pe5eAF8vllzVhfTaCBw79w3c3umJmtiy1deLr?=
 =?us-ascii?Q?KVSVkoP85xdIIKLlvY3mu0/pY1F5rvRUa+YdN27vQ6SpDGTT4VaG2ulgkl4c?=
 =?us-ascii?Q?OhYfrh6xLVcC2oQmqBizWa9G37CxQH7LgarxPbmpmXworPhknwbf65xNzLYL?=
 =?us-ascii?Q?ixoxt6HBX6RA9acf8rYfTtklMZZa+wnjVgaqWfhG0VbRVqcgtkN9oEs3KaiZ?=
 =?us-ascii?Q?ypVnmr1xpto1ZUgYgVUG+PwJThKxkWS9uomufqGbPtTbiTWzjA9Dqh4JuCyv?=
 =?us-ascii?Q?5vL66KDCwQi6tYnTN9zK/2CCQai6Om/e56QPLK5lw2X90t/vemq6t5QSYuFB?=
 =?us-ascii?Q?6kMJBfvVYWLnww90a9f36o6cRxCBeJq6oTHeZrJEv23SJDBCRcK6nj8kxIWk?=
 =?us-ascii?Q?YIUFl8aF03K0kWATgGMhotH035AHOyCJfw1weEAFFfi/OhcZwlOCWfa7IbTX?=
 =?us-ascii?Q?llMPMcZhnRmB0gd9F1E5qWqaOwEhiq0lLSkoxt4ylhfYt6sfmPbQ2q1ez+Lj?=
 =?us-ascii?Q?gvftf3pTj6Fg/ci4IYQADguwTeALSIykZTdtlnWTFotPe2pjr5I1HdXzI1Pa?=
 =?us-ascii?Q?K9atUg+SYNoLz9UtELJMbukVmi9nmjCa3lh8k45suVvltpVJFuFkcBxET/8c?=
 =?us-ascii?Q?V8l2xZTRJfygr9rgKP3DW6uIwjEXlSpQXnl3q9DTjmI8XATnRY9XnaXMHIge?=
 =?us-ascii?Q?4jpwsmARsETmsAK4IpzTjSNtxLrvw64d3KIfXhYnwvEH5DjIAE84jNCfY1hV?=
 =?us-ascii?Q?SPY3vRdZeh2QfJjjmxMc4SM/kjjwn+f4+Xw4rNBdVOHc2XJpYOYkP4jvxi5l?=
 =?us-ascii?Q?vD5Ld81v37HgwXSReytc1Pmyd8csmsoYjaaaGxpB5Kr9cEeIEG+QDh8nZTLz?=
 =?us-ascii?Q?ukvFdn0zx1rXmV2bank+LvMrWwcQRYBagcNVLSeW98iKE+dPVbEnJNc6ASCS?=
 =?us-ascii?Q?685mrUm31gtAdkAVWuTJSA/HsxopRApIYLVslkonNuFbS0gmFkz2CDZddq26?=
 =?us-ascii?Q?l3GZdjz1Gy4OFtaxfMH4fQ3b3mQWirBrdMCUIxDyogL54UeLg+IKF2RodlEs?=
 =?us-ascii?Q?gV6Rdw5qwUlGvqCJwuhCBlm4V+8W9yUKWYypSIT+vi1lqCrBlWqnhM1Vq7gI?=
 =?us-ascii?Q?bXb5SkDOJzruiDaA0GkyHLvNrUF7OqwVS3gZawgEOmzUQMQqTaJagqHXrp/Z?=
 =?us-ascii?Q?ZYNqoqtLhbhXtwDK6K0FMhq/oc9jUrjGQwEDd9rTpMyKh9Ur6GJafiYxTqKU?=
 =?us-ascii?Q?samCY9lPSKIx4rka10rf3jVAjdJU+ZewNabIZ7pLK/Za5SePgvCSEyteHotq?=
 =?us-ascii?Q?ECvWe997hZqP0PsRCNQvEGed02OGHRL3TGgBd08CwsBp+7WmCxK2FbSrjb0c?=
 =?us-ascii?Q?T9MN6b29wg6gJvwZ2hocaJDYf4uWzKunzRsocjRvUvTNhRwxODtVuPF6q3nL?=
 =?us-ascii?Q?Nb5GwQkBUrdjSgU1cYgmFKcAH0+NuddT8FVolznClA5RMViW6Q2fsYe3NE2l?=
 =?us-ascii?Q?5HY9+opX4vxaGtvBSFvht0tKG28fipVJa2JtkrFDnmHjzB4ZeUXkepiblhCm?=
 =?us-ascii?Q?DAu91Ia1FoK4iuDzoOQnZ6+X3IUHw87D5nTakbNO?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7732181f-d5bb-4444-b84c-08dc6ba524bd
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2024 19:13:41.1071 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uWhI/Mus0hOjeVtYvSNHf8oXnYlF2DxSHmWbENAL6gImWH2ClEl2LCuMkSqQsjD0KUueLlmBFH0vWW/hoT/tyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7579
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

Now that we eliminated all the mem_access get/put with its
locking issues from the inner calls of migration, we can
allow D3Cold.

Enable it when VRAM utilization is lower then 300Mb. On
higher utilization we only allow D3hot so we don't increase
so much the latency on runtime resume due to the memory
restoration.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_pm.h | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
index f694005db278..104a21ae6dfd 100644
--- a/drivers/gpu/drm/xe/xe_pm.h
+++ b/drivers/gpu/drm/xe/xe_pm.h
@@ -8,12 +8,7 @@
 
 #include <linux/pm_runtime.h>
 
-/*
- * TODO: Threshold = 0 will block D3Cold.
- *       Before we can move this to a higher value (like 300), we need to:
- *           1. rewrite the VRAM save / restore to avoid buffer object locks
- */
-#define DEFAULT_VRAM_THRESHOLD 0 /* in MB */
+#define DEFAULT_VRAM_THRESHOLD 300 /* in MB */
 
 struct xe_device;
 
-- 
2.44.0

