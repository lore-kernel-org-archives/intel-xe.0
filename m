Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5280C04FFE
	for <intel-xe@archiver.kernel.org>; Wed,  8 May 2024 20:08:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F66110FCB0;
	Wed,  8 May 2024 20:08:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ibHb6DeC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1FFF10FCB0
 for <intel-xe@lists.freedesktop.org>; Wed,  8 May 2024 20:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715198893; x=1746734893;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=XdlqNihvPFkFl48SXVE2BU4/u9Gk/ZQKeU9+1CfTGTQ=;
 b=ibHb6DeCTkB9qr/xPwNFqqd52pygD++uifSxkkJpET2ialM9+DhsKOfK
 pdsljg/e4J1vLgVGr1SqELw00ncHoqQM5Cwrzz0J5wg4fMduUtBiAPz4n
 k2K04xIUYg3AGtwL3XlDymoPQw/59uigvSjc3qCG/rBI0Xh1Mo0z9bHk/
 vFoGqMhnMidixKV8ul4/UEZr3J26njVwOquQqxaXgCxrokHjH/CQoYHNF
 tRXROuouDFgzAw/dtELq1etp3Qq6EJ0FOyJ5vQ7UjDv6DlLZtjKJ0yiIl
 TjtnPqyoSH71fv02fApBDvlSUS4T9U1acmq7PynCk+c2H17hqTuZ8VRKM A==;
X-CSE-ConnectionGUID: 2B4s22f4Q7ykKjHkxG0YpQ==
X-CSE-MsgGUID: ERSj3hlHTRyFK9y5zajYUg==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="14882485"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="14882485"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 13:07:40 -0700
X-CSE-ConnectionGUID: moU6FdmXR8S7proeugudng==
X-CSE-MsgGUID: Jt/fHVfTQSKGRMEjpYO6CA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="29042607"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 May 2024 13:07:35 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 8 May 2024 13:07:35 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 8 May 2024 13:07:35 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 8 May 2024 13:07:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ixkjGtT9iFUDNIMAxEIoyhCmfqxofoyGNqHsO2FvIJXbZULSssV9sDJ/euysTGvF1Y9pCp2YbyH+WzU93YDo35MEfLRfBKmD3yRH/+CVsFCdN5jU3nWN/LeQvyqAbFGZZnWV5UicNgS7Bu5yhJ3V0bEBZ9ypXZ5h9X2jPn+3JtspYZadEdwWFHroyKx9vA9Te5UfHOS5O4HbONf93b6ZLLd3XVW8pd+WNRi9nlCG6tokVbJEIwgNjIk8HlROy31eyBcOWCAPqpLqjeLQwkckx9erPnhPzklm+cSO8s+cHkbRp3WF2uMgaFl6+4ZZXx8d+bYsNQS2ouP9sVBJcd7hKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yP3v/elRDxUEwcu3eKVhveb83h4EXGk2hrtwrH80w6M=;
 b=VCp/2FeUaG7kbWhsg6p8+7YQV7y+Iehn8QU0mfLfMrUR6/jfpRF4WH+Mg4J+znHfL+UKKPmbXPsFkh0RKDN5Nl2cd2VIn4Qk6jUazzexzsneAvQc7RgKMWHFiMhMCAIiED9KkfJQ/yrVEIwK4G2rUp1wnHj6SviICkaMTDPHDkLwg61+j++7X0lGgTszEBLkDlOmpOWdAfZnB8qe7eZCBCRaqX9JhCQ/DrhtEZpFBVLemqS2ZILAoOU6frE5c9vSkt7WBt4DtRAoMTYICx3N9n5Ldg2KJAzOjsUYHKkWwJh8qYqX3+yffYssFDFGhMQlNuEuYTz+PMAeLc9LPFJAJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH3PR11MB7390.namprd11.prod.outlook.com (2603:10b6:610:14e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42; Wed, 8 May
 2024 20:07:32 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7544.041; Wed, 8 May 2024
 20:07:32 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 7/7] drm/xe: Enable D3Cold on 'low' VRAM utilization
Date: Wed, 8 May 2024 16:07:07 -0400
Message-ID: <20240508200707.375414-7-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240508200707.375414-1-rodrigo.vivi@intel.com>
References: <20240508200707.375414-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0296.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::31) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH3PR11MB7390:EE_
X-MS-Office365-Filtering-Correlation-Id: 2686e834-ac80-462e-c536-08dc6f9a7e6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0Ed6f6nLHLgZmavw7qgKk3msEGMRSekkXMlGNx50NMgA0LF/wTvGlkK3anIn?=
 =?us-ascii?Q?CmCyyUPZE2VD004GfoWOz3xX1FAj9dz1U772JauITzQdK9cGrtSv7HHUwvvX?=
 =?us-ascii?Q?7D2655DGh4PUH91SYmxZYtAro5Dz0igf7I6yP9uBr6iljRUpBLCTLKXTOjIK?=
 =?us-ascii?Q?pfm7k6QF+llYUUDlon2y1/QdxGjO0ky95zjDBYtnaDM/WuNuJzdVWcS3VtFD?=
 =?us-ascii?Q?8bT+8uxC0hiEyG6/8a9yplTurKCHY8zzLduRPXyHkA/o+6EgxDBFZNT8GALP?=
 =?us-ascii?Q?8uThWXNhUOu7jwj1WJJVnxbdUyFNOwXinfo8zknqASNc+W75hs2nbnMmLMCf?=
 =?us-ascii?Q?xzHzLZvzQaVAtCYMcBJ2QYhb6TH3QK5sveIf/9mwMgp7+BroO5hRAQk+wYcP?=
 =?us-ascii?Q?mSeaGGlQ8Zo6gpVp2WsIm6agFoyP9xLy5BLU1VxeVMdV9jSjVH2RO3ljx1eA?=
 =?us-ascii?Q?1fArV4hMWQMn3kgkvFpd3gbrCwlGe1ZcqRpxtBD/IDFo2hzvuYmRkUv+YWBK?=
 =?us-ascii?Q?AAhCpC8pSq2q+dP3HQopl5s8JGvIuk27zWvG9qpti7ZQ99V3ovsYsYqhbvkC?=
 =?us-ascii?Q?IZTmrcHqxsGDPIqB9jvrDWMkUa3NFOqWvtQ1s6gwRVQPzqYiACXtkJrTErvr?=
 =?us-ascii?Q?B7VwUB/lPqDhPAXIAyyWYN4YUBUtW3LxtmjxZ6jXEEmAPZaA+Uatk0C/ml5+?=
 =?us-ascii?Q?to8UffMXrZbkq0VctICdo+WHYtHpbVyYsDO9/zgCHBMQ6GtJJCnOJ3KjV26z?=
 =?us-ascii?Q?Q10dZmgNO2l9aKBI/5t6n3sLICsiS1dPIakt8Wf7aglmL7jUDL5gM4S0YoQb?=
 =?us-ascii?Q?fqbP6oxWcfFzsdkDEC3vA8OunDoay5zPpanC+aK3ENogMGpDKgCQjMoSxn5Q?=
 =?us-ascii?Q?5U2LU8LvuzrOkWSFamLiyBBCWbSjWxqMb0LI7uVRD74JkR/PIRPfCvcd1eu3?=
 =?us-ascii?Q?wrbqdhJ80Rs87xTr3Pf9xRdMN8dflkSU0H2kXvg7yw1fzRShCkqau9MOLklv?=
 =?us-ascii?Q?7xtTxmSNEB9Z0FYJNrnlDIT/suOEABmTaKUricCWcBJSvg1yBjXUX2BY5nuK?=
 =?us-ascii?Q?NSoX3hgsAr3iOH/Wrcvv91ftK+62maPd/fcD7/5+OVsdMyGyAwodTDb+l5nL?=
 =?us-ascii?Q?OjJVwOfbqgpr341DiIHG2mAm5FAEHIwNrDsu/aiMbJBae46jvpAPaqH8VkPO?=
 =?us-ascii?Q?hAAT6LCefEuc8d0Kb5ravdp6gEk3uUtiiiZfxE40XGx8bpK3pQTfw+n9EtQR?=
 =?us-ascii?Q?JL/QNJj/b47uyzAnb8R800fdbLRCkYZSlZzJDtG4nQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iKqobOUSru34bOEwBKUS+k2wp5iOJe3FfNXJwHWiB1QZfbOL4bEtdsJ98jHS?=
 =?us-ascii?Q?SbRAfusZ4GZUHNHXYxc35kE4pda2w6sJnhCXrXUXrtl3sPzMXwmOxvG5B+hz?=
 =?us-ascii?Q?YIzoE1rRth97TzJNBS310j1GLBjp6B/6S14D+r98xXDa6kZD2GAPSmIOSCyQ?=
 =?us-ascii?Q?D3Tv9QowpdUXu+2hQ2Pli7KVcYRU1InMXI0RClYMAjgxsNsepp3Mqgn5fk1p?=
 =?us-ascii?Q?IsGoKSvCzVY0iqo2OhF3TfqDktihpR4wWl0p7PpiTypkS4QbliRvmfvjhQdD?=
 =?us-ascii?Q?drIpTthSH/D5h9ZFJCohT+e80dAEB586MDjb4wPceX2Y3wtcOBhA0wq88etR?=
 =?us-ascii?Q?GxgNdKlAFCwzAholuQ60rSqhtLDGL7cLUb8rnnlRgibvssFI1KxQ/lsE8lkD?=
 =?us-ascii?Q?6+tRoAm1lNcZUvetniuDeXP9LPVv4qvFWxxWmv7+O4zpUTDW48XHfy6bEytK?=
 =?us-ascii?Q?apV5pgXP1RZyYwrWj2PNBG9thqQ/f/S/BGNh1w6uXKUU/pD3RBxVZjqMX1bs?=
 =?us-ascii?Q?OiHB7BGQDVnLS3sDUpho/PV1HdtLHmD1o8GOO8MTZ4dqn0jcAFh1z/J+BKxz?=
 =?us-ascii?Q?z5HY9JZPmVjcEuBwGEGqT5lczb8ILwj5i597EVfbllC0HRKNAjdKPiCo2HGh?=
 =?us-ascii?Q?Tuy1bF9bAa1no50wTKE+M9HFRqWSXz/wOREeqLMxQmzMbQeAv7H3DEWKr5Wh?=
 =?us-ascii?Q?CiJMknXHDHwaLHi9LWx2g3GgG34JHsBHNX5dxJKPDZJ1f3OF0ELBMGGtjFJV?=
 =?us-ascii?Q?Kxnhm5VWt9HD9KxLz9lKZb+PsVtsWethy6YawO+WFCwuIhFfMmlZmyVlOpoD?=
 =?us-ascii?Q?q8YgdiBeRUJB5t4bgz1wB7MM14JvPTy0lqrqI+ZbG7LXEBQzatXhg17+Y/VM?=
 =?us-ascii?Q?7YAnGE7lwKqcVGiGkkH2bALClU3fChPM2n8DRHstetnlrUUf2fONzVvX58cI?=
 =?us-ascii?Q?mORgxtz0H0yrzlVFHFvpMJjdyhSvKLDtb6yDmN+50cxu9FWjPMU8cH+ya5H2?=
 =?us-ascii?Q?0WPRnsg6ECNks6ppT7WtTryLLFcWPV2ayLIDnXgADK6ix5DnFk54dIsI59ym?=
 =?us-ascii?Q?1CpVyGG3TONtbTUrTiacUksaDuAt+DmgmRaLClOFjyBtDpcxRWw/r8kInEos?=
 =?us-ascii?Q?UsyYkJQD2Zo4baEx8CfATeHdOkgJl0KRKm76hTPunU7XZDmBe7i+UMZXbXI+?=
 =?us-ascii?Q?bjMhoKfutMNxYGCTCTGDKCrOnGXETs1hRl4nmvuvtvo+I9GBmHQUcHykwkgF?=
 =?us-ascii?Q?kulE4iAv62aNnK2zpgW4LrUHuZIRumF8F/JkZnSCiKGfsVEYU23Vdz7VfRvM?=
 =?us-ascii?Q?axhVAyMIQ6oipOceLy8XXB2QlgmsY59OVSeP27/lInYqZ6/DoFKanWEhEqSY?=
 =?us-ascii?Q?42PUdNTD+h0+ypZDLywXfWuWwud4E8ojuBfONsD3PhKo6a8Y5lnIK/fAW+q/?=
 =?us-ascii?Q?YUYTEjEijDbjrUB38LD40VPP3HpYfWaJnsKhjM0hrskD/LG8K1K25QUHgx5m?=
 =?us-ascii?Q?2MPPwXZq/xOnhtj4G4eZ4fPsB5qRfRnEgRD2iFvD7jCKF9YTpPLjlq+wGWTC?=
 =?us-ascii?Q?s6GbxwcQfsr1vFtUjDk+e6nM9URFJEExtdkQ/wupaFsSMgkygmjRFtJYt2fc?=
 =?us-ascii?Q?Mg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2686e834-ac80-462e-c536-08dc6f9a7e6d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2024 20:07:31.8287 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HSSdSl+eKy2mpeBessdvgLTXQM6prib0RcFxaGgzi0k1OcSdm0lIkazuOFtywm5G1MB4KFsSTOek6f9QZ8Tr8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7390
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

