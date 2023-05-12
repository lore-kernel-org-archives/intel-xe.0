Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD82CC7EE26
	for <intel-xe@archiver.kernel.org>; Fri, 12 May 2023 18:03:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A162810E23B;
	Fri, 12 May 2023 18:03:47 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B479A10E23B
 for <intel-xe@lists.freedesktop.org>; Fri, 12 May 2023 18:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683914625; x=1715450625;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=aeS9OOB/48JRKxtuDe+jFBpSmCyRlrkRhDNZBODCuxM=;
 b=TddcyJI2u10dXoe/WUhVLPAGUU+OZO9OR+K8kvYF3VLrMfNJuf7oDxTo
 qRq04uMGp6oNWb8+dkq/EgSuhgispgoYu2VMzGPQhDZXacer9obVgLXzV
 NhazS6h3lEVKWwq39Y5R/g/Cskm+oTj4g/NqyWSlvg8dmi19GBSFloDnz
 CDFfsTzT7PcQ+0dGhLxQEk2VMnEhuFs5Yd6UkYntsIhMQT+rKpoUr3Bqm
 dOcm2IUXrD7Nrnv3EuQgcMDT/8ixQ5jbzRhdj6FyeJPE5PG2Lte0VdGbY
 nDWWOhHnUD6YRXtiWREAnSxe6gbGqXve720iTcwXG5lCVjYXP+2prxEW9 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="349694366"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="349694366"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 11:03:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="733130626"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="733130626"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga001.jf.intel.com with ESMTP; 12 May 2023 11:03:45 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 12 May 2023 11:03:44 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 12 May 2023 11:03:44 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 12 May 2023 11:03:44 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 12 May 2023 11:03:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OH7KYfkT6OHd5RMgawA7yq5wUMUCO+YpqbIFnBMVdjxIKdincMrdw2AK5KQbD3IzLAO91suf9OuoDfnMj8DM9DRjPk/XDJzZxnwWEqfHVSvVEijp1Q+pkEujeYNcqVFguoz6VSryqE/qMiUC9kv8fdqHJdkK7sibM+tnWAcMNTUI4E4g4xtevF3tQg/UVjulSmtnXW9ifUa5vIYmw+hLepikxqBIc9icrAvC0Vs3/d6vwDMG7VsBYkadBBun9+/9ComeOB81+CksI98F8+gUdQQ780ec1Q8FkfA6kWfahAiX+v9QforP/oE1u8VdZTI1Cfz3hlyYaXH44tmCDsDTaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oQ+3CZhIrvg5DzHl9mHsx1IPQsZxAW7GyPN+z6IccsU=;
 b=mbrJURstl1Yx/WHAlph++WgAgavSP8XYH9zjDiTBbcCNQTbHYCB7kokNMJuPm5dYch0qiJaqYl/M6tr4dYOk52hxTGjE20cPI10V1aj9CQs8K66y05S0/CxU566r0P96ljhRMfbHkYqD0LtTUqUk1jMkwo1dpCiGbS1fFISAf4UNiMbf10cW7hVj4v/5h60W3xGNbPAslSNEzAfyYyzQxxyPRX3meVjsKHfkNJIKwFm6qcl1Mps/AV4shtT38+sfc5tPTncHnGBgNsdeROm/1e1v7dHqTGrOzyXG40V99uvBFgikuFmWsvCsClAMPhwU235aYEs1ujQDqTsYK4/j5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB8502.namprd11.prod.outlook.com (2603:10b6:510:30c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.24; Fri, 12 May
 2023 18:03:42 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6387.021; Fri, 12 May 2023
 18:03:42 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 12 May 2023 14:03:10 -0400
Message-ID: <20230512180313.1765011-5-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230512180313.1765011-1-rodrigo.vivi@intel.com>
References: <20230512180313.1765011-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR03CA0007.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::12) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB8502:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bd0a588-9ac7-4109-df13-08db53133891
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x61JVrJ0HLGCJhbYVmDCJxD1VKtOg2CfCvvaLXhELEZJZoMLLX7rnglCgMKPTSJgeGKpd3eCIKiv4KoaRmIWRC4EZsmt3Z13c7Wfy/MQEXHUKiFPTWIhY7r4H4Tx0k0rduJDKLF2xmxwvbrv0iny2hcqigmfC/kfkzmkbnGjBNZFUFUdQpxAJo8aZCK/HbrBX0/gyz1Vbh/a6oZSie9eoz9tGYypUDlhLMibvRzYDsJkBsVPgU8PNopI4JwMVjviNca3ZzVY17CLNEeFmTrYx1STYVvSI13zow4gsJGolNb7ew8CamTcRytZuuPfb9jyMMml8MOZzWKWaOUCXrkh6FecpOu68vHANCQQnnFgBJIQFowNQ3Y7wN79WrEuSO2lMsiBMI/78HJi14F9XV0gSZzI0j78wmEcY2XcLgyXt1/BzO0kI759Lb0grHQd9SUhH3Dg93sR9eO4gDg1VIKe31QMpf9PAK2SPQ3rJ5Px87n+1myKFY+n3UhJEfKpUKyPNCFv3fwLwUIZ/jzagkoHrjeEIs1DwB7LQ2vMqor2xGMZMFOBzvUbP60Eoj709n4L
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(39860400002)(346002)(136003)(366004)(396003)(451199021)(6486002)(316002)(6666004)(41300700001)(36756003)(478600001)(86362001)(66556008)(6916009)(66946007)(66476007)(6512007)(1076003)(6506007)(186003)(26005)(2616005)(83380400001)(4326008)(38100700002)(82960400001)(5660300002)(8676002)(44832011)(8936002)(2906002)(4744005)(107886003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5PaGZAPRmqpkmEgaSHKEDXXGFBXRmrFufS7q7L76GCnkeLoulz7AD9SRl2w3?=
 =?us-ascii?Q?St4Eusv3SX1lUPfWx9zJlvfP1J6FGohxnFzJHAwNQ9tftTmsC0Lb44GO6ibH?=
 =?us-ascii?Q?AnPuOgYqhToNisPhH4n4IylDP6f0dhNn5MYmts6x2Gl37DLr11MdjAFZVnCT?=
 =?us-ascii?Q?awv2B/RBgoPMoMLcrBu9T3W4pTDhVve4bw+ArrkXbb3L7YtZ16gHwKWvy6Cw?=
 =?us-ascii?Q?Qr5bt5Fa4ZKQ6mwI4OD5F47y/7YFd+SdFKYCFYKVsl2gjxtQ7XYwmfDglAw6?=
 =?us-ascii?Q?sukRc/13P2YomUFOFMHkDGrtG+t5hcvOAaAJcp20y/yOrVDau+oWg2FVKX9L?=
 =?us-ascii?Q?XzdilDwDHO5h3Dm6UgT1iO0csi7umZnAc1LJ8Mq+22izbk5VkU4WXptbgRj0?=
 =?us-ascii?Q?GPtwGAw5voe3WxDIiECrZD087ysPdB+3KUcRwnZcK07qoZ2wQWx5w+R6OU43?=
 =?us-ascii?Q?mEK7iTninq//clv69Cf6mKLTG45gqNi6SUDi6HIOrUtAYI+KSFHm7oNygtae?=
 =?us-ascii?Q?cbqLGiZSCIChrUOIelr1ePh0EMNQTCajK1/aPk71fGafWc5paEJptQUnHwF+?=
 =?us-ascii?Q?NsrxykYNtEvokpg6i6ILmFysXMUdl+4vOfbsWsR1TfLLOPdBN2iKVsm7AcJ/?=
 =?us-ascii?Q?PgcQkYZoo9snV6QFbRDm3iXFGAIG+VLrafvmA3faRxicR3GlJX2W6bCOuGNR?=
 =?us-ascii?Q?KkA53SNrpOV167q/91tkFmI0XOpKN3ihctnakj8+H69TRP5EBZVbTk6QHrHE?=
 =?us-ascii?Q?0+36uU4WFkr4LjPat7cYfmxy93sdSsKMsqjZL94hfQ/lqMLiklfQ6K2/zXuU?=
 =?us-ascii?Q?Xp13Gd0GcJ/CFwjAUHbB97kVz2rFeNQmIOFkhnxeA5ridPQvg2WeXbHZts/D?=
 =?us-ascii?Q?UXMofk5Bc9O/6XabTxFndiKleH0OlCEFnFuRq5hmWw4hyHPwO4QAvqjlSr1n?=
 =?us-ascii?Q?7DIRuh549USN5+PHIQQeGLVRlNZjQj06U1VbZrx65vXL+IrbjMsCU83IooqU?=
 =?us-ascii?Q?0Oatak5y3tDmCSbqcLoCqU+wCd5JqEfSbKB9PSNo1yn5jLvzPimKH8DuDKcI?=
 =?us-ascii?Q?QLiE1s/s0WT4s39n7PYnwgj8joh2wHTKMpMmJxkXiYkP3sS9VaKYqZm1LDiJ?=
 =?us-ascii?Q?0kzNnvk4JJ9jGKCmq1+d2v9u5z7xLTx+Lm9L9G6THH7EDMIQcw9iqVoeTlYf?=
 =?us-ascii?Q?532CkpPIBf9zzbyGm0OwfozRE/k9IS/GpimVul5HPgGGB4QQgST6ijL7QbMb?=
 =?us-ascii?Q?p8LFvp4trWr98gDjQLuGMou69pUDKrVw5LzZXLubfTyo1pBdJlR1rYVclTA6?=
 =?us-ascii?Q?3VQ4dl2fs67QgfFfeq1gmzXf3Y2aJkkjBBzFC64RHPFYRoZfuby3kMPJNFZE?=
 =?us-ascii?Q?MmQkES8A3eLeXIwRolD41ZbS4VRY/th3rJtnX1P29lYbj7tkcRC/0WdT6hBW?=
 =?us-ascii?Q?uqoIZYXw4xQYvOIfj1pdzH2Ht0gvyFok9kbnmuR6s5Royr0dGaJd34nSmvn6?=
 =?us-ascii?Q?d9Tm7CLcN5NBe/jkZ+6luqmUwaFGuIq2mNuHi0t7qbDvDRe/q/qaAICAn1Zr?=
 =?us-ascii?Q?ncrgswFoEg2jY8PMMZuy6t+/dy3HqkFDFF0/6taW?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bd0a588-9ac7-4109-df13-08db53133891
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2023 18:03:42.3132 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ef6Gy6KYa2RcUieuLvcmjoSXe/Z9d0LFR9TN74lLH9kv1m5+YZ677cIwN5OG/NDbp2NxaEbJlJZbpOftCg3Egg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8502
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 4/7] fixup! drm/xe/display: Implement display
 support
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/display/ext/i915_irq.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/ext/i915_irq.c b/drivers/gpu/drm/xe/display/ext/i915_irq.c
index 2317e60cc682..e9dfe3658ca1 100644
--- a/drivers/gpu/drm/xe/display/ext/i915_irq.c
+++ b/drivers/gpu/drm/xe/display/ext/i915_irq.c
@@ -1027,8 +1027,8 @@ void gen11_display_irq_reset(struct drm_i915_private *dev_priv)
 			intel_uncore_write(&dev_priv->uncore, TRANS_PSR_IIR(trans), 0xffffffff);
 		}
 	} else {
-		intel_uncore_write(dev_priv, EDP_PSR_IMR, 0xffffffff);
-		intel_uncore_write(dev_priv, EDP_PSR_IIR, 0xffffffff);
+		intel_uncore_write(&dev_priv->uncore, EDP_PSR_IMR, 0xffffffff);
+		intel_uncore_write(&dev_priv->uncore, EDP_PSR_IIR, 0xffffffff);
 	}
 
 	for_each_pipe(dev_priv, pipe)
-- 
2.39.2

