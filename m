Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38755606A32A
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 10:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UdIM9wJ2;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=ZhJzBqYm
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD9D61122C0;
	Thu, 26 Nov 2026 10:09:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2C3B112285;
 Thu, 26 Nov 2026 10:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795687706; x=1827223706;
 h=from:to:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=BgR7s31XN7EafMUMUZ+YNum3wAKRMqriXZJwQ0Aq+nM=;
 b=UdIM9wJ2QJli+TAzrqY/oAjBrXtoH8+kTglnW1biCdTxVOmu+RUdP6xp
 SHDpe0AeDt2Ti6VHwerz8IQBv50hSGuUC4mwwVBic/s+xeuBAJTS+O7fm
 wWCAW1W3v5aXuFOfU1SWjZzhZfCvg6YiADHWaBlc56Jc3tD6IW51J2wPW
 /RHwEuiNb128E65tia2NPkPPa0rdMvYUZC90rEK9Yh7qVxcm2dH/9Purb
 b6SVJBtwcMAXsrc75DPRFkvIClSrPGaGXOnkpsjQB1gctXfe+sFo7xlIF
 HCeR9MiRmsO5C8NAvtbZfwJojEkO+WpKPW8dcx4BQMjY/uLX/JxOR8lRE Q==;
X-CSE-ConnectionGUID: RtukHIfuQmiRFjJ05T4WiQ==
X-CSE-MsgGUID: RFoPvc8ARYicGhqvTd/y8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4434827"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4434827"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 02:08:25 -0800
X-CSE-ConnectionGUID: E+CL0wIJSzmZvtrBV2tWzQ==
X-CSE-MsgGUID: R9nNLF9ES3uT+18MeqDmmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="12432777"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 02:08:24 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 02:08:24 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Thu, 26 Nov 2026 02:08:24 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.47) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 02:08:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=byHQQgveIh/qp7IecLaYg2L9/KoNqXuj1qq60yAgMHDcvZHS2KqoPZ36xHtyQkXs+Fzidwsr9ezHXxRhtBrBBj6Iw9QmxvJ4SUayIOtBZuaXuECszPIZnjpO2h9JQuT9Ws6fssAJIIttY6wojLTWTBxzV/vcXd8sawuDSdS7eNzXwImNij1jmx8qfYmwLBki6uBiLrbgMRV8+rT5rQZ1PXNjfx43F1QOwETOPr1fv3rhkRQdbOf2CaNzQSUuM8uDn+7cqbQ7EaMoDtQhFNE9AqjGjHk7+NBPDnuqU1rATBSeVCHlCypFGjOhyFRPvpXgX1t4CDV3Krqu9bBTWRNTgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PHlEfb7+WXwLc28cGt12UqK8yx+CDX5Rckl8q3wR6Mk=;
 b=E7RCabdY0h6rLD2CkBbwuaM3GfoKkX5V1BO1e2Uc1uhtw0esLWT5OdZ6YSwiVJ++M4wtKJ/CJ4MZBwtFI/GdOczEmxwj04cE0U/F2F8RU51RPAhDLxhCV05OWn7XzAWaxzezcnyiwbLIz0vHuAIemQh6SasuwvT647kv8MdekBo+Q3neeacwoXD89cmqDVt4cBSZX3+VL+6XQiWJp/SOxRcXngFzxqVt/XM+dI64/Lh/eGXAl5oHJ6PjimVW/LBbTWqgOZwbRTU5pQ03CSeaQW3WHe30/2wXWnizsDWwCG9EwMmaSKn2gZZZWWhFtBbUWikQZ82fz1IjS6UQL/Q4dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PHlEfb7+WXwLc28cGt12UqK8yx+CDX5Rckl8q3wR6Mk=;
 b=ZhJzBqYmZqRFJlFFutXvh7VI29PIXV8n7fAFiEmmZGXbbHmnmQGRMEnFhIrVavBB3mOx56n09XVfy5CgsaqtTG0O6jTA85oIIVgmnThWPugDy/ylwRQrXOQ6Rcj2MqRnlE2A8Furvkp7JDGjh4gXS4pvH0ArsHcpVqIzMa6Tq48=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9273.namprd11.prod.outlook.com (2603:10b6:208:573::17)
 by CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 10:08:13 +0000
Received: from IA3PR11MB9273.namprd11.prod.outlook.com
 ([fe80::31a4:58c:e3b5:43fa]) by IA3PR11MB9273.namprd11.prod.outlook.com
 ([fe80::31a4:58c:e3b5:43fa%6]) with mapi id 15.21.0662.001; Thu, 26 Nov 2026
 10:08:12 +0000
From: Imre Deak <imre.deak@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
Subject: [PATCH 09/13] drm/i915/ddi_mgr: Register encoders with dynamic DDI
 support
Date: Thu, 26 Nov 2026 12:07:49 +0200
Message-ID: <20261126100755.1252635-10-imre.deak@intel.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20261126100755.1252635-1-imre.deak@intel.com>
References: <20261126100755.1252635-1-imre.deak@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3PEPF0001DBA8.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::6e6) To IA3PR11MB9273.namprd11.prod.outlook.com
 (2603:10b6:208:573::17)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9273:EE_|CY5PR11MB6366:EE_
X-MS-Office365-Filtering-Correlation-Id: 28419e46-c67d-42ce-408b-08df4ba52e2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|10067099003|56012099006|11063799006|261026140227099003|261028144727099003|261022105027099003|261022075727099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 4tAsdrVvA+/SYQtb9ZbhGXQwZC3NaPdPQM9LHRIXQ/HbQxlrVDgEIOqMqD8g/8g9Qc/XpuIi6YP3weYqBAtx+/aSbkn0Td3sNkzrZck3ZklcJRtnebHjyhFvyQvV5r88Ruq8wNLpbRLRh8lc6dXflDGAxI0dDRPYr3rp5Th0WV4dp11nnU+eTANNGDTtULbzF0q0ZzsXLsTJXSVJf+gemmClwfijvEKrLyW2ut1VKh4fw7cV2yftQ6vgGusM5QHugFFs+KqzU0CsSPM7ro9yx2aK1o6qki2omtuHKgJrQqJKdxwBPCFNXrIrsCkporGN2aQaLoNYRvnap1yk1oXOMK74z/R5BsSp+HUx5Ke1nE2uTknfRfK3I8GsMZ1c9WFrfFC/J45JEBJE/BYmnBGJd/UM0fn+neJ9tDOkLlDX74ST3Rca3DA2RbA3WvVXUvRfDLAGPkph6BX+Foawisi8QkC2f68HKetyX0Zr/no4hq+kc9pz4yiFELk+6OM9jpQpj5nsmfVKUEGiqY1lxH2Qu6GIXhIzlFSYumPCjjJxc2lUnBxN5KHxesbrpeaHjFMZlXdP8Y4esHU9PQnbX1Yz4CXBTgnB2s1TRJARrq0igXekV6uEeGOoBDYLFP7YtDavOYjwA7t9p4Y5OFi25Gl5SIfmXTncDvD8/6Wo/2qQ6z8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9273.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(10067099003)(56012099006)(11063799006)(261026140227099003)(261028144727099003)(261022105027099003)(261022075727099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+0ymOLy8bjGGKrJtgNHVI8NyHhE3/UyupRoWUGAtdL10ZCrzY3ZbsbihEKqH?=
 =?us-ascii?Q?mj/+S1Gu+GoYTsp0bRDodHIco6HE4H9j8nZuHWfhAdso+Ukg4WgRDfMF2nTR?=
 =?us-ascii?Q?qCttGThn1G+YEWeSSrvFBD/bFl6jhhzxAHjXfH/q+0vJ5nLqRl9AEtWD8FJI?=
 =?us-ascii?Q?U+r8NQ3ZUt/pvpy4K/IgOw8vdqOaeZm3z4z8jGB3Dh1rNHAtLPYbIljaTv0s?=
 =?us-ascii?Q?xl7q1CFa19dvEOUgaU0BoIt3bwVirbmdVRU0U7uTZwi/3Y/yU972Cli4N1gA?=
 =?us-ascii?Q?g1hH6YlbkuEs24o+cU0joFruYf3VrNOJAvcuBWGigq27t4ZyjDMPPvfxTLVE?=
 =?us-ascii?Q?VUB3ByKJIDDeaIiX+s/jA9IIF4N03mqp0s3faH2l0qI8/WVmI6NUqJDKbpxP?=
 =?us-ascii?Q?Bb1YOnDw68lIAvadj/9+CfMbHTKNDGDv5ATISZQsHiFrHKTnhicidEncnWxz?=
 =?us-ascii?Q?byvn3gpb0Lctj/cG8ERY8LB7q0JKeI5lUCpLiLOU9eAS+3nUG4E7oD/8G9ZM?=
 =?us-ascii?Q?OzoQJ5uLB9QdKshfqMWUIX3LZtZgUTbE/JC9pUFj5LLAHi94TilwC02UPlzp?=
 =?us-ascii?Q?/bEQ4hZhuNPqGc/wqyf0rGPWmm30/KSkpzebo27NEcRaGhxHsXsIDkuQLMGj?=
 =?us-ascii?Q?KN7bgZlHSXB3L4CAGqbQj7tGLddvE5J1VmFRq6wM0tgwIetlTkAu91d6kHwN?=
 =?us-ascii?Q?V8N7gRJ7rh5Mz570/vJjCgJVD5VmtWnwFYoMYV+aOnL9/3L5ORCMcoyJGMAf?=
 =?us-ascii?Q?g1KW5ej23Lnobrbb/KX69dqR1osRgxIDLtv9FA1xavLUg7Ra9VcYz7puXqTf?=
 =?us-ascii?Q?Eazj5K2Vc24wk0CtiPsY+03pL7eNACB85lvtigcrR72/eUZoCcAX0itL1UOx?=
 =?us-ascii?Q?VCktROV1QnKAj4H2CtaASPCPVzVfxG70Yx0xynaeJrVFgnXul9Q3AzO2ADi/?=
 =?us-ascii?Q?fWyeNuK8HtkxpE8FdERqgK+zLQzBlBMVDFYbzJjHamys21M6+Z8fvnG5dP7x?=
 =?us-ascii?Q?vdk3Af7VP8BWvYGzAgHSrhKYj3kMsB99kJwB3XoMlO3uxvXpEY998uXXGmsM?=
 =?us-ascii?Q?EgXZCa1uOP4NltaRbm0j676NJxnK5L6EROy+ATptjwQJPeOWutvhP3fkcW8m?=
 =?us-ascii?Q?z8p98PMJZd/u1yIl+4JQK119iJwBO2IyouLRmWgN0eWlLUOEZvFG60csTwY1?=
 =?us-ascii?Q?gYcCPbK6Yeuq4CrfZen3Hw5CAl0d+sOX8R7lEh3Y2XU/a6OjryA4kVdtT1pp?=
 =?us-ascii?Q?z9TMnpJIipeuazaDCIrS89mLa9wTW67vvUuQUNCcTd4XwmNlrwg8GQCltFMu?=
 =?us-ascii?Q?krYaKgKGQ8yXYrirjbfY11AbA7cXORWJfNJ8gsX5IbmbWNKAl7CSh0i03N8B?=
 =?us-ascii?Q?bMBjs0uULqVI6kZSH0SlBVh9qLtX9auDOmPcQT/O4++zCnLSPH5wWlmA1+Lq?=
 =?us-ascii?Q?5PZNIpMAnYF64mhFxV8Y/ZoNDyQ818SdcICATa+zBlBZfWdu2Wqgq4uIzgUc?=
 =?us-ascii?Q?vndFBJHyZXRKysat3Vxu1z1rtBNKQFQBL7YvXHdN7NIQ4Q+kytfbUUGjG/jH?=
 =?us-ascii?Q?N/sbwMFEf9J687GH+ztFd7stX0LSb+rq7c6ouKKRRmqmLl8FajJ+cuZAfjvH?=
 =?us-ascii?Q?+SPRemnlfQ3luKCF0nRqNkw6LspRpAUkLFKIdj2Y1pxfGCW6ebUtpJCDY8gJ?=
 =?us-ascii?Q?cap7rTlFbPu7omVsxl6dgE65mRN1vpFTsj8/wFflluW8wrBp4YOqA2zjv2Wn?=
 =?us-ascii?Q?VYl8/G1Ndg=3D=3D?=
X-Exchange-RoutingPolicyChecked: ZutPo2Seo51Ls7yMQEGf9iu5hvlQIWUaeX26ydY/1tJz8GxZbb6JERBikYNfgOcuMeAUK1tugL6h2/4vUodGNaJauy3+gK9w1qNF5KvijKFHYGGCDhSHMeLr9Hcb7/ZUtUJ4SPUySfHFp403Q9ZGJphSl4YfcsvVe8MEE8WktIknIII9Md6OkfCHTqmdUtgYAsIqASg0ALagtWpH5arPisWCmQvqJt6nnsw8F5CF2ImFWM0QFFYFAJAAdNb7xFtndoN6EqjAMtMO2FX5fXL0DBnTlogKNYc6NyVDiX/QbweojwJZt0Z+eBaYkUO92xI41GqTp7HEjmzF949bULSEGg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 28419e46-c67d-42ce-408b-08df4ba52e2d
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9273.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 10:08:12.8275 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2/U0gBr+toN+Intk4IHiftDqhF+leOOjDJKhcv/cQ01N/6+AjqcFjZueX1xIDmf79wc2hzo2zUYkEU8t9NIGTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6366
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
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Register encoders for the DDI pool shared by dynamic legacy and
DP-alt/TBT-alt ports. Each pool encoder keeps a fixed DDI but may serve
a different legacy PHY or an alt-mode sink, depending on the allocation.

Register a DP connector for every pool encoder, even when its original
VBT entry describes an HDMI-only legacy port, since it may instead serve
a DP-alt/TBT-alt sink. If any dynamic legacy port supports HDMI/DVI,
register an HDMI connector for every pool encoder too: an encoder
originally described as an alt-mode port may be selected to drive that
legacy PHY.

VBT attributes such as the maximum link rate must follow the legacy PHY,
regardless of which encoder serves it. Let the DDI manager select
encoder->devdata from the assigned PHY's VBT entry and determine the
Type-C port's legacy mode from the current allocation. Pool encoders
without a legacy assignment remain non-legacy.

Legacy lane reversal is described both by VBT and by DDI_BUF_CTL for the
allocated DDI. Derive each pool encoder's lane reversal from the
selected PHY's VBT entry and the allocated DDI's register state,
clearing it for non-legacy encoders.

Reject modesets for a connector when the current allocation cannot
support it, while allowing the connector to be detached.

Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_atomic.c  |  4 ++
 drivers/gpu/drm/i915/display/intel_ddi.c     | 18 ++++-
 drivers/gpu/drm/i915/display/intel_ddi_mgr.c | 71 ++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_ddi_mgr.h |  8 +++
 4 files changed, 98 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_atomic.c b/drivers/gpu/drm/i915/display/intel_atomic.c
index b042c3cc78e11..d5968ca39fc60 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic.c
@@ -37,6 +37,7 @@
 
 #include "intel_atomic.h"
 #include "intel_cdclk.h"
+#include "intel_ddi_mgr.h"
 #include "intel_display_core.h"
 #include "intel_display_types.h"
 #include "intel_dp_tunnel.h"
@@ -129,6 +130,9 @@ int intel_digital_connector_atomic_check(struct drm_connector *conn,
 	if (!new_state->crtc)
 		return 0;
 
+	if (!intel_ddi_mgr_connector_available(to_intel_connector(conn)))
+		return -ENODEV;
+
 	crtc_state = drm_atomic_get_new_crtc_state(state, new_state->crtc);
 
 	/*
diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index e21c237b39f4f..c3f486b81e0c3 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -48,6 +48,7 @@
 #include "intel_cx0_phy_regs.h"
 #include "intel_ddi.h"
 #include "intel_ddi_buf_trans.h"
+#include "intel_ddi_mgr.h"
 #include "intel_de.h"
 #include "intel_dip.h"
 #include "intel_display_power.h"
@@ -5298,6 +5299,12 @@ void intel_ddi_init(struct intel_display *display,
 		intel_bios_encoder_supports_hdmi(devdata);
 	init_dp = intel_bios_encoder_supports_dp(devdata);
 
+	if (intel_ddi_mgr_is_pool_ddi(display, port)) {
+		init_dp = true;
+		init_hdmi = intel_ddi_mgr_pool_supports_hdmi(display);
+		devdata = intel_ddi_mgr_get_devdata_for_ddi(display, port);
+	}
+
 	if (intel_bios_encoder_is_lspcon(devdata)) {
 		/*
 		 * Lspcon device needs to be driven with DP connector
@@ -5480,8 +5487,11 @@ void intel_ddi_init(struct intel_display *display,
 
 	ddi_buf_ctl = intel_de_read(display, DDI_BUF_CTL(port));
 
-	dig_port->lane_reversal = intel_bios_encoder_lane_reversal(devdata) ||
-		ddi_buf_ctl & DDI_BUF_PORT_REVERSAL;
+	if (intel_ddi_mgr_is_pool_ddi(display, port))
+		dig_port->lane_reversal = intel_ddi_mgr_encoder_has_lane_reversal(encoder);
+	else
+		dig_port->lane_reversal = intel_bios_encoder_lane_reversal(devdata) ||
+			ddi_buf_ctl & DDI_BUF_PORT_REVERSAL;
 
 	dig_port->ddi_a_4_lanes = DISPLAY_VER(display) < 11 && ddi_buf_ctl & DDI_A_4_LANES;
 
@@ -5509,7 +5519,9 @@ void intel_ddi_init(struct intel_display *display,
 			!intel_bios_encoder_supports_typec_usb(devdata) &&
 			!intel_bios_encoder_supports_tbt(devdata);
 
-		if (!is_legacy && init_hdmi) {
+		if (intel_ddi_mgr_is_pool_ddi(display, port)) {
+			is_legacy = intel_ddi_mgr_is_legacy_pool_encoder(encoder);
+		} else if (!is_legacy && init_hdmi) {
 			is_legacy = !init_dp;
 
 			drm_dbg_kms(display->drm,
diff --git a/drivers/gpu/drm/i915/display/intel_ddi_mgr.c b/drivers/gpu/drm/i915/display/intel_ddi_mgr.c
index a4a4673dda585..58e48a61b8160 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi_mgr.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi_mgr.c
@@ -71,6 +71,11 @@ static enum tc_port ddi_to_tc(int ddi)
 	return TC_PORT_1 + ddi;
 }
 
+static enum port tc_to_port(enum tc_port tc_port)
+{
+	return PORT_TC1 + tc_port - TC_PORT_1;
+}
+
 static enum hpd_pin tc_to_hpd_pin(enum tc_port tc_port)
 {
 	return HPD_PORT_TC1 + tc_port - TC_PORT_1;
@@ -120,6 +125,72 @@ u8 intel_ddi_mgr_ddc_pin_for_ddi(struct intel_display *display, enum port ddi)
 	return mgr->ddc_pin[route->phy];
 }
 
+bool intel_ddi_mgr_is_legacy_pool_encoder(struct intel_encoder *encoder)
+{
+	struct intel_display *display = to_intel_display(encoder);
+
+	return intel_ddi_mgr_is_enabled(display->ddi_mgr) &&
+		intel_ddi_mgr_is_pool_ddi(display, encoder->port) &&
+		display->ddi_mgr->route[encoder->port - PORT_TC1].mode == INTEL_DDI_ROUTE_LEGACY;
+}
+
+bool intel_ddi_mgr_encoder_has_lane_reversal(struct intel_encoder *encoder)
+{
+	struct intel_display *display = to_intel_display(encoder);
+
+	if (!intel_ddi_mgr_is_legacy_pool_encoder(encoder))
+		return false;
+
+	return intel_bios_encoder_lane_reversal(encoder->devdata) ||
+		intel_de_read(display, DDI_BUF_CTL(encoder->port)) & DDI_BUF_PORT_REVERSAL;
+}
+
+const struct intel_bios_encoder_data *
+intel_ddi_mgr_get_devdata_for_ddi(struct intel_display *display, enum port ddi)
+{
+	struct intel_ddi_mgr *mgr = display->ddi_mgr;
+	enum port port = ddi;
+
+	if (intel_ddi_mgr_is_enabled(mgr) && intel_ddi_mgr_is_pool_ddi(display, ddi)) {
+		const struct intel_ddi_route *route = &mgr->route[ddi - PORT_TC1];
+
+		if (route->mode == INTEL_DDI_ROUTE_LEGACY)
+			port = tc_to_port(route->phy);
+	}
+
+	return intel_bios_encoder_data_lookup(display, port);
+}
+
+static struct intel_digital_port *connector_dig_port(struct intel_connector *connector)
+{
+	if (intel_attached_encoder(connector))
+		return intel_attached_dig_port(connector);
+
+	if (connector->mst.dp)
+		return dp_to_dig_port(connector->mst.dp);
+
+	return NULL;
+}
+
+bool intel_ddi_mgr_connector_available(struct intel_connector *connector)
+{
+	struct intel_digital_port *dig_port = connector_dig_port(connector);
+	struct intel_display *display = to_intel_display(connector);
+	struct intel_encoder *encoder;
+
+	if (!dig_port || !intel_ddi_mgr_is_pool_ddi(display, dig_port->base.port))
+		return true;
+
+	encoder = &dig_port->base;
+	if (connector->base.connector_type == DRM_MODE_CONNECTOR_HDMIA)
+		return intel_ddi_mgr_is_legacy_pool_encoder(encoder) &&
+			(intel_bios_encoder_supports_hdmi(encoder->devdata) ||
+			 intel_bios_encoder_supports_dvi(encoder->devdata));
+
+	return !intel_ddi_mgr_is_legacy_pool_encoder(encoder) ||
+		intel_bios_encoder_supports_dp(encoder->devdata);
+}
+
 static const char *iom_lock_owner(u32 semaphore)
 {
 	switch (semaphore & IOM_REQUESTOR_ID_MASK) {
diff --git a/drivers/gpu/drm/i915/display/intel_ddi_mgr.h b/drivers/gpu/drm/i915/display/intel_ddi_mgr.h
index 0f84c7286dab6..887075e019770 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi_mgr.h
+++ b/drivers/gpu/drm/i915/display/intel_ddi_mgr.h
@@ -8,12 +8,20 @@
 
 enum port;
 
+struct intel_bios_encoder_data;
+struct intel_connector;
 struct intel_display;
+struct intel_encoder;
 
 void intel_ddi_mgr_init(struct intel_display *display);
 
 bool intel_ddi_mgr_is_pool_ddi(struct intel_display *display, enum port ddi);
 bool intel_ddi_mgr_pool_supports_hdmi(struct intel_display *display);
+bool intel_ddi_mgr_is_legacy_pool_encoder(struct intel_encoder *encoder);
+bool intel_ddi_mgr_encoder_has_lane_reversal(struct intel_encoder *encoder);
+bool intel_ddi_mgr_connector_available(struct intel_connector *connector);
 u8 intel_ddi_mgr_ddc_pin_for_ddi(struct intel_display *display, enum port ddi);
+const struct intel_bios_encoder_data *
+intel_ddi_mgr_get_devdata_for_ddi(struct intel_display *display, enum port ddi);
 
 #endif
-- 
2.49.1

