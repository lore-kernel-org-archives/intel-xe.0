Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAF29C4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 01:18:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 834BF10E5D9;
	Wed, 29 Nov 2023 01:18:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F31CB10E5DC
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 01:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701220683; x=1732756683;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=oxIfxdr0XVGBiXW5ebVKdFfEtcaWKNps1ld7qWAWGYg=;
 b=UHfH7PiXzbMVnDwgS0IIXteaOw7Uxtz3yAz+Zqkxc6cv8nprNkfcqJVa
 Rv2WEU8bjHisNguArXsz+ZwputtvHP6Ru1jjkqwnIPMBi/C6YsSGwnUOv
 ZrWcFpmYZNXfZ6pDOM98k18vCK7elriHb2lJnm7o4qmReC80IIG5tkgXT
 sEjbFOnp+yvNTkGQXqQ0Fnx0/6gYgoMVXO0L4BPQgBccTsRu75LD1NGdL
 z9pZdssWL25XvJiZd/6YP7fNpw5VPSIHIbzcck6xcOOvPe8sA9/wG4P3E
 Wf82XaGlKu/a+mM14kdgOYKeuqQYwAK1bfSOcVVtxVVI7LNFA6boiczw0 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="6280201"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="6280201"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 17:17:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="762113515"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="762113515"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Nov 2023 17:17:56 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 17:17:56 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 28 Nov 2023 17:17:56 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 28 Nov 2023 17:17:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CT/j92Bb+WhCxlfdGxX6p2LH9Wblli05cIatbNn2b9EtfZfFP5WVnFktrDcfbqzQu/OBn905TPJVAzJgyY9rLjcR85QwRry1tlMzGbZzykZLn+rcun7/LMekFP9eKoS7o++6UUvevmJGLr7t/1Nad99+0wCoxAG9U3poh94wQL5wUieadMgu5rJmf0pw31dVa8PSK9WdL41l+lItnJykWH38yKsVHOgM8YPXhUD/IRrLoCyG0q9wQvD8dCjD8xjqusPKRqpZuMg4HthOfIBHarcfWEuz44YuV3L6PMYkdztS10mdRB+kqcCxUwIJLfCLHMx56YsqS6eHUdV+PNBdWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ysEmuDYUCgw/06lW9jvnfYcMh1xho6adxJhKdy/fgv4=;
 b=STVLsBPuzIq6miLg7nM3I6p7lZxC0/nSyqkRupg5lfTXEUDACaGr2l5O+b0BE01sQzRnhCj1K2xuInE2L4rz6/pg7FhTsyn09hIeoyJQc7d3I4Vab7XD1cAiwxmFnw+9yBOS3sCGva1kFeaYR5kLCgvOkDHqPYyLZ34cNkfHK/q+BL1sx3v6bY7+SJO9jM8PK3A0k+N0YRw/KrSMEeOYsGujUc3ySmU2ON5Tr+UmZOEhyXN9xMzE9lsjaZIDGQoxe4HcltUd5J8w1v2NE8hSuaXhxNy0vqLwoZbIFpjSu7qPxDBOqQJzx63SYNYLlr92kM5s0zeagkzwD2Y+EepNbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH8PR11MB7992.namprd11.prod.outlook.com (2603:10b6:510:25b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Wed, 29 Nov
 2023 01:17:54 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 01:17:54 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 29 Nov 2023 02:16:24 +0100
Message-ID: <20231129011624.836843-23-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231129011624.836843-1-michal.winiarski@intel.com>
References: <20231129011624.836843-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P189CA0006.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::19) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH8PR11MB7992:EE_
X-MS-Office365-Filtering-Correlation-Id: dc8c60f1-ef7c-46c9-f9db-08dbf079036c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Bxm4kdIZzLjznVL5if3JmYmqRZiTpnC87y1a8G3ENBW/dvw7ymDoDdK/KFoZYc2IPjvQHRbF/GhAcxU0eXNRisFDRYEctg/jpUBmzOS8CI1etmWzs2nl5QhIDpPChcFWu3FOPr77p0YlNlEt4h1HjBiwlkk1hN28YaCUUm3UH/RrdXJu5jXUBaNdQTTkjouU2Z/E2g/1q9axgyWLVpXAoTghopCBIcrqak+EDI2s0ADLM9eSQp0wKFGyNKhf3uODxacw1STMw9hChig9Ox1VvXRY94CVwtabrw3EIkP0lrCK6IWIClhoIoN/qKUIiFPz/PiVqhXLd7bzZAwkCOdrBd1JIMzjQeoBLfDMqUSdskqWsmFD/YiQkSAKgrTSMnU0UIXJsRNn60uU6LsBwBJBtImuvBj+f4IFF1R9mKSMjPzpPYFbNSOEeRq17TgqBoyH+bom1JawW4zF0GY0SI+uE30xNEICr495umUnJneHYezvvP7TcnXpcr6CJdoFEsOji02WK36wyklJVaZv1TG5C/Wkzfe902T4PX3IV546e7LGb2vu5FfxFznsT7XJGTDrS0oBySnlkKDMlFMU1hjB6I81rNvWIoL8zAjrRk3MBCQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(376002)(346002)(396003)(136003)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(6666004)(8936002)(4326008)(8676002)(6512007)(6506007)(54906003)(66556008)(66946007)(66476007)(6916009)(316002)(478600001)(6486002)(41300700001)(38100700002)(86362001)(1076003)(36756003)(2906002)(26005)(2616005)(83380400001)(82960400001)(5660300002)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Uk1oQ3NKMjJZVGp5MzAwUW1iNGo3SldPRVkrbHYrNWFodERhVHJzNXk0a2wz?=
 =?utf-8?B?SUpVN05qNGRWVFJmUCtPWGNmVjJCemR6Q2MxQS91L0RmNUJFVE5BS1V3NW5Z?=
 =?utf-8?B?UGxkcVJDRkpNTVB1M0Rvc2RHVHN4Q2F0RDhnVXNnTVhxUjVPbDFYOXlTY1hZ?=
 =?utf-8?B?QnNpWk5acnJJMWJRR3pzdXNGSTV6Tk41TXJwdW9acjA0ODdKKzRKZXhtYVVJ?=
 =?utf-8?B?dExiMTdYR1R6dFkxVDNoblZKOHBaN21DT2hvWHRDYTVTeHRsUTdiNHhOS21s?=
 =?utf-8?B?dVdtTVRoVzdJaDM5Sno4Z2liL01seXVFdWI5R054WDJFZjBUYkdqNTkyaC84?=
 =?utf-8?B?WnJNMzR2QUpDM2hGeURScktVK0tZOXpPbmJzcTBtS3lyMkFpQndYYTFkbVJU?=
 =?utf-8?B?clpkdFZ0QVozTU4vbHE3KzdHTGFnV3lsNUNtV3lBMEZLbTNaQWQvMXFkSHVD?=
 =?utf-8?B?dnFWemJQVmdDcG1VUXB0dkt2aksxWDdwaWxKU2lVb0ZRY0tFQ0NMM3UvTWsw?=
 =?utf-8?B?YkNwUXZWZU54VjJ6MEpPTlBYcWxFNDhEOExFSmF0YzdteEw3TU9nNmM3WkYx?=
 =?utf-8?B?bHRoeW1GMElOeTVKM0RyU0YvMmdCVmxuUUNaQTF3MFVhcHZ5RHVxcFRJd3Q5?=
 =?utf-8?B?ZzUzWFovL09VeGhZU0NKZmFOejhYZWt0cWMvZyt3YjQxNWw5YTdNK3hURU10?=
 =?utf-8?B?MDhEd0VSNU1mem5PdlJXT3ZidFZ0MUp0U3JMaUhnL3NneEVmWW81SExiR1cx?=
 =?utf-8?B?S2o4dTFGOG1LNjROVThHbkEwT0pzeSszVGN5N3N6L1F2UCtENHB1UG5lV0xQ?=
 =?utf-8?B?VVlnbkJ3OWNNOEppNVBGT2wzWllXdE9hZVplbTNkdG16c3RrRWlaTncwQndG?=
 =?utf-8?B?MEhtNWxrV1dzazZPMmk4QXJXY2loTjF4M1R4Z0pFMlZhdlhVYURhTUxYNGRF?=
 =?utf-8?B?WTczKzFCWklGZnZ3ZmRxREdXQUY1eWpNaitmd0xMMHZlbjgxenhkREdKQnk3?=
 =?utf-8?B?WlpWeXd4NmZaZy9SbzBUTElUejZrOGV6aDNZZjlrYUVzUjVmcHE0RjZ4c3BV?=
 =?utf-8?B?NXhxbVZuOWJsZTRycG5NUVJLenFBLzVhazRPU0lLS0dSZEFyTUZkS0l4NTBp?=
 =?utf-8?B?WTduM0FaMjJQT0VUNkhnUEJzM2dJbVArUTNUdkNKU1BCZHoxaU0xU0xtN1hR?=
 =?utf-8?B?R2YxcXZsRnF5cncyOFRGMm5oZ3BxWUZBbmhzVGtTL0NRYzlxZFBmdkc4aEtC?=
 =?utf-8?B?eldFUWtCelhVU0w5SjhETlJCS0l0Wk9xN21hcFZUdWMwd0RNYjBiYTRyS244?=
 =?utf-8?B?cDEyTGVOUW5ncjZybjdIK1VseERjZlRYN3ZOR3VFQ0NOdm05K0hWSXhJL3Uy?=
 =?utf-8?B?YUx4b0srTE9tbVMrc2h5dFhLYnppeUdyeGNSeVB5N0tTTzdVQ1ErU2xlMlAx?=
 =?utf-8?B?U2twTWZrTTVLd292Z1ZlR1FJWExSeWNSZHZVVTJWb1ByWDAvS1REMGVpNUxO?=
 =?utf-8?B?ano1aEErMEFJZ1hrNTdEY1VXZkQ3RVBzNFVRdXpncUVMYVBHWUNUYmhSZkxs?=
 =?utf-8?B?STg0QndROWtRZ3Z5UUNPaXNqSFl2MURUZCs3MGQxQWxobmcwQnZ4OHlySE91?=
 =?utf-8?B?dXhHZ211SkpnV0R3UElaekFjamlqVmhHZVBMdDB4MXpoT2NqRFArQkV4Z3B5?=
 =?utf-8?B?MnQxdWpna3BCTUJRY28waGxBdmlnRENZUUpxOTBKQkFvN0w2bVRxNGc3ck1i?=
 =?utf-8?B?MThqSUtCZVVwWS9mTlJyKzNiVnFQWFpITXJ1V21lMTh3Wk9sSDAwM3AxZ1ps?=
 =?utf-8?B?R1J4RmFwdkh3UU1DTFVSUFE4d1lpRjBaMlFYV20rVm9TZnF0VW5ZNUdzWGtJ?=
 =?utf-8?B?VnozR21ZUEcreStEam1pTUQ2S1dNUnE3SUZMa2pWdnpQdVJiaENpS3ExWEhO?=
 =?utf-8?B?Ukhqc2phQW01T01LNmwrTC8xTHBsSzRncDBTeWQxWFBqN29BQVNVUGhQMm95?=
 =?utf-8?B?a2JGNWNidW9LMU9UbTMrdEtaTytBcXR1MDk2NU5EOGxVaEU1bzJKSzRyc2Za?=
 =?utf-8?B?TzhmdEpHbTlSdThaeGhZck50eUZhR055UXQrOFI3QjlqcEF6QkcrT3FnL05p?=
 =?utf-8?B?dnlaMFV3a3RTWk93ZkxlMS9rNlN1OGFLMUVlTnJyWUh4RWVIQVZ6UGJrN2t5?=
 =?utf-8?B?NlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dc8c60f1-ef7c-46c9-f9db-08dbf079036c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 01:17:54.4567 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xGaf3aFJskJxb6EdMczxmLsHflr1s1lWChs36yzDeManFgCoTddwGNwKLM/XkQjrtX/kL0OJy/YhXakJCrBpkslcEt9ZIRHDbkxV7iHc4Jk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7992
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v4 22/22] drm/xe: Initialize GuC earlier during
 probe
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

SR-IOV VF has limited access to MMIO registers. Fortunately, it is able
to access a curated subset that is needed to initialize the driver by
communicating with SR-IOV PF using GuC CT.
Initialize GuC earlier in order to keep the unified probe ordering
between VF and PF modes.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
v3 -> v4:
- Introduce xe_gt_init_hwconfig (Matt Brost)
- Init PAT before loading GuC

 drivers/gpu/drm/xe/xe_device.c |  6 ++++
 drivers/gpu/drm/xe/xe_gt.c     | 51 ++++++++++++++++++++++++----------
 drivers/gpu/drm/xe/xe_gt.h     |  1 +
 drivers/gpu/drm/xe/xe_uc.c     | 11 ++++++--
 4 files changed, 52 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 65e9aa5e6c31e..a236c36cdae3c 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -425,6 +425,12 @@ int xe_device_probe(struct xe_device *xe)
 			return err;
 	}
 
+	for_each_gt(gt, xe, id) {
+		err = xe_gt_init_hwconfig(gt);
+		if (err)
+			return err;
+	}
+
 	err = drmm_add_action_or_reset(&xe->drm, xe_driver_flr_fini, xe);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 964e76f931a28..d2766c2c58f0f 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -297,7 +297,6 @@ int xe_gt_init_early(struct xe_gt *gt)
 		return err;
 
 	xe_gt_topology_init(gt);
-	xe_gt_mcr_init(gt);
 
 	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 	if (err)
@@ -336,22 +335,12 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 	if (err)
 		goto err_hw_fence_irq;
 
-	xe_pat_init(gt);
-
 	if (!xe_gt_is_media_type(gt)) {
 		err = xe_ggtt_init(gt_to_tile(gt)->mem.ggtt);
 		if (err)
 			goto err_force_wake;
 	}
 
-	err = xe_uc_init(&gt->uc);
-	if (err)
-		goto err_force_wake;
-
-	err = xe_uc_init_hwconfig(&gt->uc);
-	if (err)
-		goto err_force_wake;
-
 	xe_gt_idle_sysfs_init(&gt->gtidle);
 
 	/* XXX: Fake that we pull the engine mask from hwconfig blob */
@@ -415,10 +404,6 @@ static int all_fw_domain_init(struct xe_gt *gt)
 	if (err)
 		goto err_force_wake;
 
-	err = xe_uc_init_post_hwconfig(&gt->uc);
-	if (err)
-		goto err_force_wake;
-
 	if (!xe_gt_is_media_type(gt)) {
 		/*
 		 * USM has its only SA pool to non-block behind user operations
@@ -442,6 +427,10 @@ static int all_fw_domain_init(struct xe_gt *gt)
 		}
 	}
 
+	err = xe_uc_init_post_hwconfig(&gt->uc);
+	if (err)
+		goto err_force_wake;
+
 	err = xe_uc_init_hw(&gt->uc);
 	if (err)
 		goto err_force_wake;
@@ -462,6 +451,38 @@ static int all_fw_domain_init(struct xe_gt *gt)
 	return err;
 }
 
+/*
+ * Initialize enough GT to be able to load GuC in order to obtain hwconfig and enable CTB
+ * communication.
+ */
+int xe_gt_init_hwconfig(struct xe_gt *gt)
+{
+	int err;
+
+	xe_device_mem_access_get(gt_to_xe(gt));
+	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	if (err)
+		goto out;
+
+	xe_gt_mcr_init(gt);
+	xe_pat_init(gt);
+
+	err = xe_uc_init(&gt->uc);
+	if (err)
+		goto out_fw;
+
+	err = xe_uc_init_hwconfig(&gt->uc);
+	if (err)
+		goto out_fw;
+
+out_fw:
+	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
+out:
+	xe_device_mem_access_put(gt_to_xe(gt));
+
+	return err;
+}
+
 int xe_gt_init(struct xe_gt *gt)
 {
 	int err;
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index caded203a8a03..e9d6aeceb56af 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -31,6 +31,7 @@ static inline bool xe_fault_inject_gt_reset(void)
 #endif
 
 struct xe_gt *xe_gt_alloc(struct xe_tile *tile);
+int xe_gt_init_hwconfig(struct xe_gt *gt);
 int xe_gt_init_early(struct xe_gt *gt);
 int xe_gt_init(struct xe_gt *gt);
 int xe_gt_record_default_lrcs(struct xe_gt *gt);
diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index 13e76e6805ca1..123baafc9ec38 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -29,13 +29,15 @@ uc_to_xe(struct xe_uc *uc)
 /* Should be called once at driver load only */
 int xe_uc_init(struct xe_uc *uc)
 {
+	struct xe_device *xe = uc_to_xe(uc);
 	int ret;
 
+	xe_device_mem_access_get(xe);
+
 	/*
 	 * We call the GuC/HuC init functions even if GuC submission is off to
 	 * correctly move our tracking of the FW state to "disabled".
 	 */
-
 	ret = xe_guc_init(&uc->guc);
 	if (ret)
 		goto err;
@@ -45,7 +47,7 @@ int xe_uc_init(struct xe_uc *uc)
 		goto err;
 
 	if (!xe_device_uc_enabled(uc_to_xe(uc)))
-		return 0;
+		goto out;
 
 	ret = xe_wopcm_init(&uc->wopcm);
 	if (ret)
@@ -55,9 +57,14 @@ int xe_uc_init(struct xe_uc *uc)
 	if (ret)
 		goto err;
 
+out:
+	xe_device_mem_access_put(xe);
+
 	return 0;
 
 err:
+	xe_device_mem_access_put(xe);
+
 	return ret;
 }
 
-- 
2.43.0

