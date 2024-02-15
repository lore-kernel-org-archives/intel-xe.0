Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52AFEC48BC4
	for <intel-xe@archiver.kernel.org>; Thu, 15 Feb 2024 19:35:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEFE610EA26;
	Thu, 15 Feb 2024 19:35:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eq/IMCTe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4EB610EA44
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Feb 2024 19:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708025714; x=1739561714;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=nuf05QQNUKf/J20Tqar+1CaYlvGBYYB4H8ZMKeozsMM=;
 b=eq/IMCTe+zKuLNRg8t37lHNoPID5McRt54SlaF1bgGfRnp/yFBvd94FA
 EUCMOCA0F5lTjK+cbxq2zgLrx3IN8j0fVBuZ1ebuCxgRpyWM5UIMItUCg
 tUGTUBBI8CmarLcLKChsnRbUvNN2pTAIuxCY3EXCyWegM8+Ils+O4JS1y
 pIkxh1ZpKA0TXVRbzwh4q5EnCtXMph22jZF3IzZU9XhKssXJSfzh9YzSi
 JSJ2fdZTH1x4CTHhWoZR67gPyQ3QTnr6eKOVH6MpDhm1SeEqoeub8HcMR
 J18GZlXIaAWAGAi4EDTbQDp+gf28inLtmfPd17gOO7+Nzy1O9/TZs7Bd6 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="13539240"
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; d="scan'208";a="13539240"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 11:35:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="8309585"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Feb 2024 11:35:15 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 15 Feb 2024 11:35:13 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 15 Feb 2024 11:35:13 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 15 Feb 2024 11:35:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yu2z2oO7DrSiRbXIi120NU1o0IJneNHwV4vVhSXQV6NnKBZmxifwRoWbaLdkT/DI2hUli2nhJk6KzCKA99P9vkbnhpkmDl6hYGDzK71WpOsOQe8ED0rLjeGVnt8rQU5nRgWEL/8rVMiZE3Qx+5s2gZs9z/iSELMbJA7D3mOBL+azjRPlQiS5R7jgT/bbiiZRZD/wJpr0CaJN3iEaoIfRqBphwCP8WkYfzkcIe7rMbD0CuJXJ8S398f+Kup17q5NuP6mRusiYIqsA48mTS0sDBTDolZAgcgpSPU7P2Apb61XRENN8ixUJYM3LsYlCf1vm9/9WHvDpKixA6iyk4PxPDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y7TBnp22WZcJxEesaGE+m4831DhNlEBtZ+cxC7Km6a0=;
 b=dCQOP+hWvIKN588/XjjLmbUxG0cyCsTO0F32lumKnJufjfR6GdlO8y4Bh/xzahlW0qEn14q8Al0h2Elt5U10ji0BCsA82wZ+rbUZnG5HDkwlEbjELm4YDxOOmZ/BsGnl+/ZkCt2g6zGgNB2oDVgwHWuXmd6a7eJ3hIZ0NaqESM6FcntAA1HHJh0cp6MPiwZokaYimZ6Mic+bU1xvT8Muh6LS2L0mK2wh8UqkGkP9xITuUs2rp+cR+E1vRH0P/cQ3HzEkws6wQTbQ/afBzTqxHVTaqv25yzyx1gj2BxmGwp+VTZhgY619aAPIMofLxdK30rKPq5wL3P61Hu20LRkhvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA3PR11MB7977.namprd11.prod.outlook.com (2603:10b6:806:2f3::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39; Thu, 15 Feb
 2024 19:35:11 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7270.036; Thu, 15 Feb 2024
 19:35:11 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: [PATCH 10/14] drm/xe: Remove useless mem_access protection for query
 ioctls
Date: Thu, 15 Feb 2024 14:34:26 -0500
Message-ID: <20240215193430.130106-10-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240215193430.130106-1-rodrigo.vivi@intel.com>
References: <20240215193430.130106-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0187.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::12) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA3PR11MB7977:EE_
X-MS-Office365-Filtering-Correlation-Id: 6355e429-bd74-4e62-251b-08dc2e5d39ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u2/k+L+8mHUx6q8YiRiauKopOSFudmgY92PkEwM4fRu63gBzerL4oraTOf9VNFwccdXJToUFXBdc22bOAUHje53VbJyG7AD7JNKk8Cjsww8jUqjjdazQrDOYzIA80GljdzPfbA1oyZuKJ5zCuhsLBY+mfSNR51AO0ipqHLFJ+0Z4B0yTcGGbXQPjJE8n+m6ae3CT43H7XW4MwiHLP/pJkUZVwtOppI6c8V+IDF5NmM/0ntJeoQ1phKPZTIZAqfv6NMiAwplKmDswHjA2uJE5vro5BmhDx3BoaEfLUju4JDxb0zb/Un3ZsCqXuccTwSkEXQqcwfX2pKjUjwMonyclpBn3o3xqOeYf6CpkPoCU4iiG9xzdlhJKTDpq3ES74o1PYLq1HLN0pIWVMiYDDfDcd8OlGNlVxDUdFogORD6xmXyc52381zVuJcaHKXI0xSsNngH0slngg5wfU2wVzmok/zQTdJ5hQ1uM74l6oLC7vEajs0JicDeE++84beSIs4b5IBhkLS7qZ6v/li+aGciXbRV2wAiZIatVqJvV02KnrH1by2bSZS0vVSooQO/JTdX7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(136003)(39860400002)(366004)(376002)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(2906002)(44832011)(36756003)(8936002)(6916009)(66476007)(38100700002)(4326008)(66556008)(8676002)(66946007)(5660300002)(82960400001)(316002)(107886003)(41300700001)(83380400001)(1076003)(6506007)(86362001)(6486002)(6666004)(2616005)(26005)(54906003)(478600001)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8WVfl3kzjSCDMvMmZ3FRLzL8CE4kBkZcqpik23/HwvrXxX3b+TKjSBXxdLQT?=
 =?us-ascii?Q?egTgpeUJ8KwpoDlllAORMaYx9+9ZmymGeTavPidCsl0dTp3kF6FlY7yrF69R?=
 =?us-ascii?Q?rmzxBgq05qD8aNxESfSQLfsAw+dxIMflqx5e/xaB3o8mEGuXTsxGjis6VsDN?=
 =?us-ascii?Q?YfTdVeQgQ9qhVx8b1Orp0AMzgIvsE8lpCQG6uJDWSbNl3aVUCTg92C0sBOCk?=
 =?us-ascii?Q?1+CWoGnxaq99CQnWmQU/0lo95T61DkM6rhLpyg+5LU2f3k0Iv5e8e4r3h0RC?=
 =?us-ascii?Q?PLHi6gHr5sElWEDhwdl4vX0m2LNKKhIU32IAsG4vxNnugiN61F01XTcq84rW?=
 =?us-ascii?Q?98utTy7T6WvNCV/JYwa2aZqo9PH3FDfe4McN0KSRwOXDn3vt0n93zhLBZ8Da?=
 =?us-ascii?Q?vlDH6rZrgX79YyTkOl6Xze4QxRIDS92l19MYv7EshI/0q6uPFDeWb5gPRGb/?=
 =?us-ascii?Q?SZYY3pN1b5B9ZXdmk45+t5lRor6b1G25gQpr0awkIhPnTRwsYJHJAqcKRneg?=
 =?us-ascii?Q?l1nNiG5QSRCfwdzvV2E7vIVSW3tfC8/KelDkdL4WrEMY2Cm2IHVpfD3kJdzi?=
 =?us-ascii?Q?70ZEeqK9+rPp6mfKBzitWYpt43ckaheZcVQs3Z+Clb6Qlow0yPoIeDrsfgkh?=
 =?us-ascii?Q?gNsy/qdWtz+JkZ2LXvXUyNp5eHnJT/QzDyLHB/OJ/X0S5nfunvwuxw1HkGct?=
 =?us-ascii?Q?juIgQ5h+0cvtFc6hCslDQxvEmTykpwWyX/mTxN7pIj3njGiJjMOLydBPaU+Y?=
 =?us-ascii?Q?7rwwoaWaMdywGtFd/uiP8kxV1yLV7IWwg1pmMBK3Orrt0tl/0q2FtNDw54yy?=
 =?us-ascii?Q?vrSUzB7TSo++MgJoBbaYiYSzuTTzm4HEIDUH2kaTHsFJdDqNw9dyXtgLaVRM?=
 =?us-ascii?Q?Ssyeoe2OeMUDPWSp1ZBrDkg87qWTYTDk9dJglWPFYkO9Jxi4ScDKvIwIlyoL?=
 =?us-ascii?Q?UoTlBdxSkVtv80XAW5V1ufZw4gmAURAmmywPJv4684N5ayosZM5KHh7hTeiO?=
 =?us-ascii?Q?N6gvH6wJ3eLAZYBS+vqQyh3dxY1AasqO2+K4ujZUtjFlUaPdIxxDx2i4QQ/S?=
 =?us-ascii?Q?I9HCOr0wot7tyULkDZHLPSObyPUr1W9DN+U7dl98Pf4WuriCU/pbDUXdlCZL?=
 =?us-ascii?Q?TJeJ86XjoMcpdFwuf2hXDdtdExZu1UyeTJAMyrM4DWXzdYzJu47Bs/gC3kGw?=
 =?us-ascii?Q?iIcM0voMSrsLbUR0jh7JsW+mNSwXyBb15Sx3sBCh7Np0qPpNt4rFv5NhSqZb?=
 =?us-ascii?Q?afUhbexhFf/k/GDWdniamedc7F4aucsdyPQmBzX0UwT+9rAVcHKoGqgMePxf?=
 =?us-ascii?Q?klAEVfVB2uzg/X0SlN4AGSJ0EHZcG62QYU0txepYBW758kg62+fK1oZy0djE?=
 =?us-ascii?Q?v5vVwtld+7EtU9gWWeMB5aJBE2NBTdDQv6+633eUDA8MgcCnSAECB+MCv8o+?=
 =?us-ascii?Q?BbgPlMCdlBgosUMeqfZTBzpAbDcTzJHFOYTQ0TCIwamHLSe9BOWZYtepnEpx?=
 =?us-ascii?Q?sdT2NPV4Ajy1yt9DQUzzVkF30aPIdiAR0KJi/wsFLgas7bwyG9u++bQdByWN?=
 =?us-ascii?Q?ryDmpadBtOEr7pWqfjEphXJZ33hTPdD2MiWJtsrAS4TCut+3Cbzd6lNDNeWa?=
 =?us-ascii?Q?Bg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6355e429-bd74-4e62-251b-08dc2e5d39ca
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2024 19:35:11.7808 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g1e7Psf+6J6Kt7JbwoOM+w2m28Oog0IhsfF7kmM48cz3JSdTfLae8wxwEXctQp5ddwz3FGN9cVTuvxwekvMaoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7977
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

Every IOCTL is already protected on its outer bounds by
xe_pm_runtime_{get,put} calls, so we can now remove
these.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 92bb06c0586e..f1876b556ab4 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -147,7 +147,6 @@ query_engine_cycles(struct xe_device *xe,
 	if (!hwe)
 		return -EINVAL;
 
-	xe_device_mem_access_get(xe);
 	xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 
 	__read_timestamps(gt,
@@ -159,7 +158,6 @@ query_engine_cycles(struct xe_device *xe,
 			  cpu_clock);
 
 	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-	xe_device_mem_access_put(xe);
 	resp.width = 36;
 
 	/* Only write to the output fields of user query */
@@ -433,9 +431,7 @@ static int query_hwconfig(struct xe_device *xe,
 	if (!hwconfig)
 		return -ENOMEM;
 
-	xe_device_mem_access_get(xe);
 	xe_guc_hwconfig_copy(&gt->uc.guc, hwconfig);
-	xe_device_mem_access_put(xe);
 
 	if (copy_to_user(query_ptr, hwconfig, size)) {
 		kfree(hwconfig);
-- 
2.43.0

