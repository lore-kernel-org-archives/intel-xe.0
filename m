Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77780C48BF6
	for <intel-xe@archiver.kernel.org>; Mon,  4 Mar 2024 18:22:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B79611244D;
	Mon,  4 Mar 2024 18:22:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BC7GnIZV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2E9211244D
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Mar 2024 18:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709576537; x=1741112537;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=DBFarfTWjFxG2Ill+6bSecjZb5oZVcwkmUMNgL4bSjQ=;
 b=BC7GnIZVVo1i991w/oHwhYCm7l1d+fGGAS9jgpiS/tg1Jqf72enOwmm3
 7OYmUW+VMv4msXuJeNTMya0UmA18RLoY33yYPiltm0AxIYW8/QOKydtRB
 jNmV+HxsJv0QplgFam3B4oAsLXDqTrsEFv5gr0V+9gEhrZakI5QiN2uFx
 w9JbuOw8dox+SwB4nPsQvuz09mlxbPFy2o4lan6XJsrNBuyIJH42bQ3Bq
 aLzlfLLIMhS6UrkvXFprK1hHP80zG2X2ZdA/KP8oa0ZxnNJUE0EZEmN+J
 HyY2mq+hNfyqk/JRlJ0YOaumzhVUuUQzJhSDb4Nn/+Y7m8tnK89hdVcpu A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="15492986"
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; d="scan'208";a="15492986"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 10:22:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; 
   d="scan'208";a="9026155"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Mar 2024 10:22:16 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Mar 2024 10:22:15 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 4 Mar 2024 10:22:15 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 4 Mar 2024 10:22:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FzGVzAnmeJUmnQ/ThCCFdVfAAU03B0w3cz3HGKJzQPsgX78X/xGUcCQA5x4U2twDACKOtsw4gdFOVLgEBmyI+1voG0sCrJ0AGLBNsV8cpv2WTxQDdQXydyGhHQ4paesDHxcWDK9jPObHxc0UQQp+BNuIcgfLRs5FuAo+1DXhp28QQ/lAPPntvDbin2Qi25uKbYRXC7cu2hizErhbUGatQ9u9nZIacaSGmG2eZkyH6KjLyalSlOCPAI7z6fDGKfjV9JIdYHfAKx1VOKtrBzRjSghilJqQoMbGnP/yzF8LQYVgTEvSdfr2EAD43JGFFQfOWEGOHrCKk63PiFXsvhZHhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k+tpa/AoaTktOS2BnuYwv346Yg+BaxZlxg831A78auI=;
 b=eD9WyuDhg+EOZiM6dFk8ygUSOb8VQrHdotvBpCpyp9K3Ezi0EANJb5QYb7Vg6TOsIfxnQvoscKkHM7fzbzGx2NiPME7cugDaRDPKPX1rU9tV1T7nzsFkoPfVT9iuIHk5i2xl6q8D6fAKNJvhPccELyGe/E/lLn9gLxWgvzJvueywq5MATra4jWiag/iXaYptLKze24JvXKD1HZ//rI/UJXKSXQVun4NCkEV9FqcTvWq90NT6aw02fi1CJElV9lLQfsT8ebafXjgzgr+JCcmaekBKxlqloDNfv7y89df2sxOGOm/1K772HXFBx8e9f4XXwKTg6DjaCIL+eSrmxzdpyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB5133.namprd11.prod.outlook.com (2603:10b6:a03:2ac::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.23; Mon, 4 Mar
 2024 18:22:13 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7362.019; Mon, 4 Mar 2024
 18:22:12 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <matthew.auld@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 5/9] drm/xe: Removing useless mem_access protection from
 runtime pm
Date: Mon, 4 Mar 2024 13:21:50 -0500
Message-ID: <20240304182154.42611-5-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240304182154.42611-1-rodrigo.vivi@intel.com>
References: <20240304182154.42611-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0297.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::32) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB5133:EE_
X-MS-Office365-Filtering-Correlation-Id: 409c0b7b-5253-4a2a-3118-08dc3c78031e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jxPwPSFQL8spetoPYLHBl4ewvoofoFiLzQ5eArp/vfXZetm95kyXnReW9U2BdoLc7l8r6JQz3GD+vV84EpYIFzgo6xX9qXnuTqAF2ePK6lE1oAbXbSkM33Ajke790IIRTBCauKKwSO8Ikh1CGDkjjrkwwpAN+I7SpPCstqVSRHYSPFXm2r5xgR4AejEpTBmbhPcpkB75WZg56+iOlHrrdG8wR7j4SvJMtRSRmfthGCK4KAACtOx7VqrnC1yGwW2YpHOe9q95tZXJuo0pNNS60mGo4h67XRX/ZraSMn2HxNUVS/XNO98bJmxFcp1y3/AQyd1I+iUbARD1U3PoqjN8njZ9BGaVefHAvPPB4AsUb/c6/CW89Os9NY/cVx9qDvOT00XMA0r8FT1GZUkaEtZSO4qWjlk6J9NlSAzZqa83PAJU/jifrjeqpATuaADmtT51yMjMXjYdXRKOcKBE+yxj2N/IEztusYJr00meJDxUBIddD0gTccoKQTnSpmiILjgsBkzUMF4U30+yyVCcsSg0ihjbNPWJ1f4qXljBPR7em+2Voi+bzM7o7JYIoIuORiYcR5k2il6rTf/hACp5AVn6JJpbfg/lhq2zt1+NH9t/xLNGq177ZvkNVA/SOrJBIgJqc7vA8442oRfuccQxgQFBL8sqo4co8MsY5ewlXWkP6dc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?amhiVgvtMB4NXK3RaX0YZJRpYmKKXrO5vUqGL3wjY4MYKG3FV82UObE4t2dm?=
 =?us-ascii?Q?gm5DS/riVM171GCwSSFdxVu6ke1BaWLUNAeiT4Yrt8r3J2yayDJ0OD+bU1O5?=
 =?us-ascii?Q?gKFOCKjiTjsYgDJyIfI4CGSmARKW7rmxwntFgJhpyrhynX2d7K6sAfbvfF8V?=
 =?us-ascii?Q?diWxYS3vbqP99gPTP1NG0bksSdwTpmx8OG9qM18IV+STxyhTEDGy/0obnZEo?=
 =?us-ascii?Q?yrPXPeTPkck6Hr1KHoTMr5Ro/d6wBX1jcouBCqNZmllNaulGgU7l0A7D4HiC?=
 =?us-ascii?Q?3Aj/cKMBCyObb3fAEKRTEosAgcxHzI0StwchpUSXMVFDgPQli4INKbmfZlXG?=
 =?us-ascii?Q?Pf9yASJ33Qz+YTp65cquaRARS3oV9vQEqvJYPnz0/BRG6cD/4sBGUVL057L7?=
 =?us-ascii?Q?jbj6kbiwcUu9AGRDAF3iJe88ezh6DoTNpqQnJJCiFC276xGgiJm+eH4ypuAt?=
 =?us-ascii?Q?RdD3t8HhQNEZ6SB2fntPpxcDAMdaFbam6jalh3WKSgTz5JzsTgcnFnzu43fE?=
 =?us-ascii?Q?vSgwI1wJk8a98OcmvMJdfGvA4rDn6FB485I8UOlOfyB9GsRjWX30qJP1vqIM?=
 =?us-ascii?Q?ffsjY1gxTi3qaVFJiBFt8d5W4De6naZuaXre+1KM8fLkyBHVTUXG6TLj7hsP?=
 =?us-ascii?Q?oCYPP75zCmhtPZnKjn22/P5I8WTphZYd2zqfx9dRDawMPyNkZ2yG6kyFnCJ3?=
 =?us-ascii?Q?wpr+ElcCyKxoGY/P0gikcVpwxpibyFiDBxxYmGDg2W6a11A8G2wAnMcJB8nS?=
 =?us-ascii?Q?XSU7fqHSfgxZiF8FJf7oceI51WwHeOGXJRlBY8v2ou0fRBIw4v2GmyJa7WoX?=
 =?us-ascii?Q?EWHeh9LtnpVvY1GBg+qRkUbKBr5pBi/QGk0prZNF6hJLxatX+sxuaduBGho+?=
 =?us-ascii?Q?MqpiGjxc55IQ0yZRYvv39wZk0/522e612CoOC8WbV8T9yL8hUn6EQ8SlkdKj?=
 =?us-ascii?Q?uIkAPt7twTjn9bL9uCFEIIoSvSR7XyaEPOpGBTwxxwHr1FGeVMfJiu7/dI8a?=
 =?us-ascii?Q?HoQO3osc93CB+L7fIM7zpIeI3e0gsaTqC6Qcvpdup1/IMLALdRgKqzK6QBud?=
 =?us-ascii?Q?G1sBB9Medy6w0pp2C+VrytYX0QSPyYCBOkjS1vFVOyRyul1piiRiah2SaGBE?=
 =?us-ascii?Q?2tGUrLF7rYxXYHpYtucnVqnTavlzJOqlkV76OKcwxMy56OuwsfGoC87Dz/cq?=
 =?us-ascii?Q?GNTi+NIZ71y8moaA7OLVON3i+1darIahn6eS0K8qyvRlQmP8f6hpRad/JtPZ?=
 =?us-ascii?Q?CTUluJZ8yFMKAAJswd1x7EtGIRfvfs2naNjASGKW0Mx4YJCeyTjKbNv85//p?=
 =?us-ascii?Q?PNV2vPD05jZ8hmZAgmJxD46Ob+tKn7WZPSYvZNCluqEJ/Sk0px2yeCKbDeh1?=
 =?us-ascii?Q?kZIgLhhNqjQy+DF5ZbbqHYasMac19NpsFvmKtf37diwkDwj5WQfHKuJAcp0y?=
 =?us-ascii?Q?ltxuY7jDEg82JzRg1OOyPafIHxdcO/GqpBTMu3fJZFSu5uLK5cSPCmD+36bU?=
 =?us-ascii?Q?IyNhSKyshPJ60XBiQHfJKmBbs9zmA0MCa3JgyHEqy7mk4bdkjDep5psMs3BS?=
 =?us-ascii?Q?5LvzIBj2bxr0/cCo92viHlFlLiVTfrDO++zaaEOF?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 409c0b7b-5253-4a2a-3118-08dc3c78031e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2024 18:22:12.8676 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5ilHWFU1sMbLdpuNqA7uvmCmoRdi6pHwF9hciaLjuFk7GYF6W1Ticow0X8OJtXfJg+xEkGHhGphI/EuLmD6hTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5133
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

This condition was always impossible. Likely the original
idea was to only have an extra protection to exit resume if
refcount was not zero, but ended up with a bad implementation.

Since it doesn't make sense, let's remove this extra usage of
mem_access_ongoing, so we can proceed with killing mem_access
helpers.

v2: Improve commit message to highlight it is impossible,
    rather than stating it is not useful anymore (Matt).

Cc: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 8 --------
 drivers/gpu/drm/xe/xe_device.h | 1 -
 drivers/gpu/drm/xe/xe_pm.c     | 3 ---
 3 files changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 49a413725c8f..a9128bde85c1 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -639,14 +639,6 @@ u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size)
 		DIV_ROUND_UP_ULL(size, NUM_BYTES_PER_CCS_BYTE(xe)) : 0;
 }
 
-bool xe_device_mem_access_ongoing(struct xe_device *xe)
-{
-	if (xe_pm_read_callback_task(xe) != NULL)
-		return true;
-
-	return atomic_read(&xe->mem_access.ref);
-}
-
 /**
  * xe_device_assert_mem_access - Inspect the current runtime_pm state.
  * @xe: xe device instance
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 2653f53bee4e..2327b6c0ae6a 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -138,7 +138,6 @@ bool xe_device_mem_access_get_if_ongoing(struct xe_device *xe);
 void xe_device_mem_access_put(struct xe_device *xe);
 
 void xe_device_assert_mem_access(struct xe_device *xe);
-bool xe_device_mem_access_ongoing(struct xe_device *xe);
 
 static inline bool xe_device_in_fault_mode(struct xe_device *xe)
 {
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 919250e38ae0..1c323e4734a9 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -296,9 +296,6 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
 	u8 id;
 	int err = 0;
 
-	if (xe->d3cold.allowed && xe_device_mem_access_ongoing(xe))
-		return -EBUSY;
-
 	/* Disable access_ongoing asserts and prevent recursive pm calls */
 	xe_pm_write_callback_task(xe, current);
 
-- 
2.43.2

