Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0605BC52D7F
	for <intel-xe@archiver.kernel.org>; Sat, 17 Aug 2024 10:36:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C35BC10E004;
	Sat, 17 Aug 2024 10:36:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UfQBNxPD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97ED410E034
 for <intel-xe@lists.freedesktop.org>; Sat, 17 Aug 2024 10:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723890970; x=1755426970;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=VzSiYljYX8AgmHFI5CtXv7iZUSwOmiaQTnAkCiaKuv0=;
 b=UfQBNxPDA7+pldc+EhLYCiQiJZ/dcRiUZH1+UzCbdHYejrx23dk2N42w
 4j/mhPSEY/qee2C7scF7ZtFw1rBoJwxBiNFq8mCFHdNUWoKZ211JQhHiE
 L68CDPshLJdl+0omHzTVTGA8RWETVvU0pN7d8iwBz6lqeETY3BV638jZI
 mQ5L7rpVLf/I119OKHUJbbbIuqPwO3mBUvM+2bVdMnWJK3Q5GCFoNKThA
 XXrTl77AzZ3kcvLOW8v+cdqfjCxSKNBw45/u+px6U23P2ksBuu+iXrQyl
 ZNp+4pvBAEWOFrBzFa+OQT4AK3Lg+GQz/y135x/mYYjaRjABtwxrWMmro w==;
X-CSE-ConnectionGUID: q8CeY7slQ0OeGsxc2hLZ5A==
X-CSE-MsgGUID: RjUzEk9TTH6VdQ7KW+NONQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="32812483"
X-IronPort-AV: E=Sophos;i="6.10,154,1719903600"; d="scan'208";a="32812483"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2024 03:36:09 -0700
X-CSE-ConnectionGUID: Ss9AQ9jNTiW74DriM+55kg==
X-CSE-MsgGUID: p/DZgmJASlmnrxEWZHN6Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,154,1719903600"; d="scan'208";a="97407265"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Aug 2024 03:36:08 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 17 Aug 2024 03:36:08 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 17 Aug 2024 03:36:08 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sat, 17 Aug 2024 03:36:08 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sat, 17 Aug 2024 03:36:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ebnnUyXk3dqeMWXclSvkq5kA1gv0lqpTeD2A0uRFN3Tfjw9652W9aDE6U+ZQcnQMcb/alFXnpFl7Y35oxM/P38eRF7nalE4ugWw7i4DTFLgso0vLmvlOAbbLyrzun3QWkyfqaPUcenRCZWSG/0hlThLMPE+ma6geki23A8TS+bvcK6z3WfZcyUxk30jwWI5qXEtZ+7j+92v3AYNckpVUWD53s8bAzbXR3ugpqLBydSSOaR6JDtUtsQQ9XoFwBda3m8yhreGfyfF6nnC1Y/hvjPp2Vfdjx16vq/2+vKwJQxzy793IU1EjQU1iElOOIhM5oqsKy7wgc/+FoLPbYLK8kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sVJCjNogDncuDE4OuwLFEzLj8N0KMbBT5xInlRdCffo=;
 b=tdPGcn//5wVQYYOu3E1zpDzo8eiExABIDVhyso7Sg95HxouacMnXUuP0QYDVghdfBkn7L5Qmd/sC0lTOw7FvYjInu2z/1AAKIV0y8WdHeOMhObyClSt0LGJWfuCOl1e5DqZuXWTkR9dRMN7YEKCF0AbMprQQk3tApQYY38n55wv8efEiwaf8JrOlcxQyF/IjeEluFprWiouejkOWwTojHzgFe98VxwiI6u7M493/QBKF+SyTuiwaCd0lAwp5Ft1od/efwpnocHhtNdtTHqfcvLbev3NMafbJZSIrxqvB8IdfQpbfX6F2q9o9Zm4zjddCIhqOqjF3iWDBvc7vEvtKSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by SN7PR11MB6679.namprd11.prod.outlook.com (2603:10b6:806:269::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.18; Sat, 17 Aug
 2024 10:36:06 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7875.019; Sat, 17 Aug 2024
 10:36:06 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <lucas.demarchi@intel.com>, <jose.souza@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Matthew Brost <matthew.brost@intel.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [PATCH 04/12] drm/{i915,
 xe}: Avoid direct inspection of dpt_vma from outside dpt
Date: Sat, 17 Aug 2024 06:35:47 -0400
Message-ID: <20240817103556.163783-4-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240817103556.163783-1-rodrigo.vivi@intel.com>
References: <20240817103556.163783-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0191.namprd05.prod.outlook.com
 (2603:10b6:a03:330::16) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|SN7PR11MB6679:EE_
X-MS-Office365-Filtering-Correlation-Id: bf7e06da-f2d8-444a-7798-08dcbea8663e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Wktd5ZKRXGVIF9amkR3T0n67HhaA4ENhR25Smvb/Temek8wHJLqx0Lqx+/9k?=
 =?us-ascii?Q?CXsQbp9ha9TAnRq+22liWstD+p+UBj+/hIP8/762Ewpv3Fi0dVGwRm3ZY0ls?=
 =?us-ascii?Q?3plvQ6/xZSckszYt5mufYJ9dU3QJDh1DeeiUzP8zLm253y5aboJwOkWOC4w2?=
 =?us-ascii?Q?5ST5t+R5NytJ726IVCfZa328VYbayo/tmSPM4o5hlPAHQzt/yhU0sHmZfJr4?=
 =?us-ascii?Q?CMRS02QdJYuL8y3f99VEfOQgLhb9BOycaAXsgtRTSU/XzZkS+8orhzOkYRt9?=
 =?us-ascii?Q?ywfthCCelAAoc1dOm0r3V2hN0L8jeJTvrzvNK1LqJu6CrTU0P/Z97Bipj/x1?=
 =?us-ascii?Q?ZiGEi+ka74x3lZpsMsbrjrwY/MmNuk1otn5LB+Inx8YAPovzJMICL1LdhXqL?=
 =?us-ascii?Q?1w0llm0cLd9irGo8lL0fvTSj0KZXzKy2IMiYIrP7LOWrrblG6X7aGuqvT5g5?=
 =?us-ascii?Q?md2igUULnyhVkOSYRTMc6ZL4CLazaGl7Wk7a+j0000Yy86LoEeSTMDJEszVl?=
 =?us-ascii?Q?pSgwRVZYPNKTsvf+zi0kLYPgD0OuNLKkVeBGFMFRW94pqqoW+biHQAbtnIM/?=
 =?us-ascii?Q?RG7DqAyCvWr0PpSl3FIBCGHLjOKGRGQHeIodJf/DUnKBH9FN3uDSDsu98oEs?=
 =?us-ascii?Q?AR7YGqEn8y5FtiAGajMqhY8c7wgHH2aPEv38JxvGthOF92cXlC+Hjr/DalIE?=
 =?us-ascii?Q?+mSvCcs/SSe1vqGxKsvFuJhaW4jp5XmGP7lYb1Z7hLqsldr6DKqig5E2MMtw?=
 =?us-ascii?Q?eZybeO54zqUmoZ8THkcq5F8RG54eRv1HuBGBFlNsxKXyRmbrgPreZ+/Su3Ti?=
 =?us-ascii?Q?T5fd/Zq54bNvVlsm+b8Um491deWE0low8M+Myixc+Mm79Jebz/AV+59XBEMb?=
 =?us-ascii?Q?oVVsLM0Lhe2VmWRJIyMKOLkebChHvBb1aNuMQjNDyItYF34/q7b4pezbaAAh?=
 =?us-ascii?Q?N/9UXnDVjwMICw45RiGHwZFKHGp9u3ES/nhiTad2vvYm9Q/nhqXOYWJV1s5Y?=
 =?us-ascii?Q?PEdLSG4EWCSKMWM1wPOsqPyJGcb3xo3SdJFOw0DnvQxV+IF9Yp/V7L9tpXxO?=
 =?us-ascii?Q?JesvMzR8wEi7zCER2iTGezsV8+4y5avPjV4b0ksnRtXSY5iPKXYKb6iUabQZ?=
 =?us-ascii?Q?gUU5fqzH+yv+iTRWxUdwulyod6F7/MyviqIJ4t9jR3cXkeBa3qa4PGvOKBL+?=
 =?us-ascii?Q?LRDdpxdOsdSijDIdvs7Bllse/q7JcmXkAt1V0jmBOWgjTLFl5v+UP6WiZWkb?=
 =?us-ascii?Q?6EvAxy63taCZmHuA3LqvHqROBaLE/8spGZP5gz2SEN8C1Vyb3KXT0I22nfNG?=
 =?us-ascii?Q?dfKGrWBi8m7VgPfw18v+1Yjy47kwxl7HGgmgBCKMQe1NEg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?L8+bV3LaxwCb7+AoaSHvDD3D0vGr4z+YumcWu2Fq3sIS7CGwYQg9e8nhbVSn?=
 =?us-ascii?Q?1/yMJMmI1nLN/PPz0c8vuyYXuL5hEjC9AX4gn6owpg+bsatCUEZtoCtHVMLS?=
 =?us-ascii?Q?lR5olrw79moxT7ADSFWqrk2979Yz3RkDW4JUsZ38TBaZKB8SZE+bcoTf1PRO?=
 =?us-ascii?Q?LUs9vNZIbOijHCoxrPohE0E0pzhDxZSLMCLFm5SBBRPSA98oX18vikXRNZnk?=
 =?us-ascii?Q?kSN4LQcACjEDr9vbf5hcCnwRZVR2/sM7DW6lepeKpRnasg92sqcCO7E3Qlni?=
 =?us-ascii?Q?CQiL++S/KaNt5HfWmp2sSwJAu6JzAuO0gYLlGe24wv+sBTTWsQCIcS01QQ7H?=
 =?us-ascii?Q?W9TEmx90EcQh6b6+k6J9e15OdWa1iqeAwt7zHMaBt7vLL1E8DtWTiEbpLKQ6?=
 =?us-ascii?Q?2RR126cV3nvt2+ggZAWvle0FB64Ebvmwwtz+Y83puRqMYWFoKhRCowAK3BJ0?=
 =?us-ascii?Q?51TUTZDZJU9YSnHljNk+KeDpC5E/hvsvZWroKydMd39K53HYeX/EHuO4shVB?=
 =?us-ascii?Q?77rEWG8Pv2X+/FNQ5zGlp4tCOKaU0ode8PdQdvJSk8XbzDKfXieD7LKHj441?=
 =?us-ascii?Q?eYYDxeVXXf/k4Tgen8r5u+L3VN+0+OtRpyBItf57ofpyJY/9QlLDdOw0ST/N?=
 =?us-ascii?Q?bnf9KMSV//Yuw3MIMdLpzB2ndRZjE938pQ2zcVP0+9dQg0wYBnllkuwspSj7?=
 =?us-ascii?Q?Jlyoh1Juuw++Vedj6MIl7sSktMeWc5y6bRg6Y7td3w2l9HzwrWCjUDRqDMY6?=
 =?us-ascii?Q?0ao04/bYESpUfwuiZXpG2rfrU1SyDs3Orvfy9c6xqCDpGo2mbIhYlf1KZzXy?=
 =?us-ascii?Q?tbwdlK6fs8csNipPWkjGv+26GPqbTsWNzT8+GY4CPsPireBnBsLJRuakvG8o?=
 =?us-ascii?Q?6KH78d6gTlkCxsYYfi62jDKKiTg9Kt1MH5vEfUTh86foW9RK5FY4fli+fthX?=
 =?us-ascii?Q?QZD1vN2Ds6YhZo5BjDlYvcfjGY9PgniN63Wm1JzdwDIFSqE5PfrXemQVQ006?=
 =?us-ascii?Q?VCzwQEsUoUpzEr2dVVJyQSa0p0UFqcsAu/3Axr03uvlBcnmw761jfdCJIgfL?=
 =?us-ascii?Q?dtMosc7wMUN6e7DABbuWhE2nXPz2F/W+kKcfUdbhI//pEbYF8hsQmObCu9in?=
 =?us-ascii?Q?ard38PrYWlzX7UlcN+8jQEd7HahPbKhrAJHo7dTcfrPHB6Ae3+lNH0T4m4Tv?=
 =?us-ascii?Q?QBgHGxbm8/SLG51s2OjhmfybRNevaOZzVwSwQ4Glicp0b7bQmB5qiokbRHqm?=
 =?us-ascii?Q?9qquu6s4khQWdlcYBx3me1CDQen99I0xM0RqIoislkjc7C2PwGaTWiIw1obh?=
 =?us-ascii?Q?e6rl2hFd6JDJzpS9mS3TEZyfI531QW2sRJLoimSnR29R89V0V5B1Lu7S1z4x?=
 =?us-ascii?Q?wvaobeOE7W2guApCo9Y6y0HXvF/SCgBaXxhXT1Z6uV55f0L0WeEXAKnhZUHy?=
 =?us-ascii?Q?a7GjflyTTiopNrBLFCIbPAIFWdPnP7GXDmhP1/bgYMPQsNWnYBcqUX4UZ9zv?=
 =?us-ascii?Q?io+HX1APtaS4x8h2ganGJCzXVMgvD8KbCuBRdZizpUIWFdj/909LMvtfpx3h?=
 =?us-ascii?Q?6P/qAZkXcUxwbeW0hjIQumx+DIoK8zsdjemJOGddzU3suypLr1YPqlKJ5UV1?=
 =?us-ascii?Q?VQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bf7e06da-f2d8-444a-7798-08dcbea8663e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2024 10:36:06.0724 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: llvx7b9T9HkDyCrSUY0s4Vclinw4gIGnbxc/BOxMHNNA8vBQrNeWv+e4xyLmSSVFF0LZLlAqXBG7DgYjBBhMlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6679
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

DPT code is so dependent on i915 vma implementation and it is not
ported yet to Xe.

This patch limits inspection to DPT's VMA struct to intel_dpt
component only, so the Xe GGTT code can evolve.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dpt.c           | 4 ++++
 drivers/gpu/drm/i915/display/intel_dpt.h           | 3 +++
 drivers/gpu/drm/i915/display/skl_universal_plane.c | 3 ++-
 drivers/gpu/drm/xe/display/xe_fb_pin.c             | 9 +++++++--
 4 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dpt.c b/drivers/gpu/drm/i915/display/intel_dpt.c
index 73a1918e2537..3a6d99044828 100644
--- a/drivers/gpu/drm/i915/display/intel_dpt.c
+++ b/drivers/gpu/drm/i915/display/intel_dpt.c
@@ -317,3 +317,7 @@ void intel_dpt_destroy(struct i915_address_space *vm)
 	i915_vm_put(&dpt->vm);
 }
 
+u64 intel_dpt_offset(struct i915_vma *dpt_vma)
+{
+	return dpt_vma->node.start;
+}
diff --git a/drivers/gpu/drm/i915/display/intel_dpt.h b/drivers/gpu/drm/i915/display/intel_dpt.h
index ff18a525bfbe..1f88b0ee17e7 100644
--- a/drivers/gpu/drm/i915/display/intel_dpt.h
+++ b/drivers/gpu/drm/i915/display/intel_dpt.h
@@ -6,6 +6,8 @@
 #ifndef __INTEL_DPT_H__
 #define __INTEL_DPT_H__
 
+#include <linux/types.h>
+
 struct drm_i915_private;
 
 struct i915_address_space;
@@ -20,5 +22,6 @@ void intel_dpt_suspend(struct drm_i915_private *i915);
 void intel_dpt_resume(struct drm_i915_private *i915);
 struct i915_address_space *
 intel_dpt_create(struct intel_framebuffer *fb);
+u64 intel_dpt_offset(struct i915_vma *dpt_vma);
 
 #endif /* __INTEL_DPT_H__ */
diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index ba5a628b4757..1cf1d5c8b9dc 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -14,6 +14,7 @@
 #include "intel_de.h"
 #include "intel_display_irq.h"
 #include "intel_display_types.h"
+#include "intel_dpt.h"
 #include "intel_fb.h"
 #include "intel_fbc.h"
 #include "intel_frontbuffer.h"
@@ -1162,7 +1163,7 @@ static u32 skl_surf_address(const struct intel_plane_state *plane_state,
 		 * within the DPT is always 0.
 		 */
 		drm_WARN_ON(&i915->drm, plane_state->dpt_vma &&
-			    plane_state->dpt_vma->node.start);
+			    intel_dpt_offset(plane_state->dpt_vma));
 		drm_WARN_ON(&i915->drm, offset & 0x1fffff);
 		return offset >> 9;
 	} else {
diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index d7db44e79eaf..42d431ff14e7 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -377,8 +377,8 @@ void intel_plane_unpin_fb(struct intel_plane_state *old_plane_state)
 }
 
 /*
- * For Xe introduce dummy intel_dpt_create which just return NULL and
- * intel_dpt_destroy which does nothing.
+ * For Xe introduce dummy intel_dpt_create which just return NULL,
+ * intel_dpt_destroy which does nothing, and fake intel_dpt_ofsset returning 0;
  */
 struct i915_address_space *intel_dpt_create(struct intel_framebuffer *fb)
 {
@@ -389,3 +389,8 @@ void intel_dpt_destroy(struct i915_address_space *vm)
 {
 	return;
 }
+
+u64 intel_dpt_offset(struct i915_vma *dpt_vma)
+{
+	return 0;
+}
-- 
2.46.0

