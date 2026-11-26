Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72C7606A326
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 10:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=O0bgwFwo;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=OnRkLZA5
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E15711229C;
	Thu, 26 Nov 2026 10:08:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64F27112285;
 Thu, 26 Nov 2026 10:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795687696; x=1827223696;
 h=from:to:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=H5G+P3ZYJl4WhEjsxB5ighSSP0UDeCadAi5u6ZHAYWE=;
 b=O0bgwFwori/QAlMTK8SxiX647wqA5sd0LFCvq9sihciIS8Xmq5961/aE
 aLDuW49+6tv6aHU0FWM3jt+dddAX21auMiT54iHac1NoB5wqGk6Vmv6UQ
 Rv0Z+nAYo7QpJnvfen9tmPABtV2JwWkVT7vyozYkRo+No6y4rgzOARv14
 wHoMtSoxcT2yONGSUyaR3IZ5DKlWR6PoBr/za6XRj5R0XimbxFwxBiUO4
 94jiGqWI8B2f+FFTbBCMeB5PThrp/2W71knwJZY78B66tOk4eNU6yohPk
 7GG2hSY4m+uFeEufdT2qgR5s10QNG/6q/B0ThHtu63+Pi6AKfzJcLkLx0 g==;
X-CSE-ConnectionGUID: MNoVEmPYQzeHEVxp27RQAw==
X-CSE-MsgGUID: ikRiZJXnTCOroEuZ2H+yBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4434793"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4434793"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 02:08:14 -0800
X-CSE-ConnectionGUID: au6nm8xSSlOfMFuU2XDIFg==
X-CSE-MsgGUID: DovNEUcAQ+ChtScczQ5Xcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="12432737"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 02:08:14 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 02:08:13 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Thu, 26 Nov 2026 02:08:13 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.47) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 02:08:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AHY/PFCXLqLU/8POpBJt3t59ls4hxB76DZLtqZH4yZmHsfj+bpyncs1E1ejO4I3Y+lE2I/uHhK3RZAmPQDvXjbN5nyeGl6NszwBuKP3w8g+b7V8RuMr02+arC5hPABFpPnsC4yDuBFF6E17jCBCJeC0NPgOAxFUFlMeOZGCYBeYcO5tLzOvF19nMF3SHQALghQjvJAwdI/EJ/R1qSWrlHhiM5wcnYoU0LLtgJtYtTc8jHBqSuKy3+yBgf4E6eMI/6WJ3y8JC6m0CXDNhc7JdLBBAu5v1LFL8hKkGhcnoufQGw9r6hwcazVgNvfEfP1K9W1n0B1PfXiA4XumKxWMUxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0KaKZpFoK4PD7bWbOYWKQUr1PFOIbtDH34bBQaaQS0Q=;
 b=MBEZfsBLCUfOr4eyCUGpA8Up7QVbI5K2JN61KxsLZbI8EX8zdZ3odLpbE9zYuQfT1QrxqKieuf1FA7eCnqriFzmLnKM9sscQCodtKL8iznq+ZVwE5AMQM4t1HYripqkXcVdBVqGKLegCyeuTa+1sCsBSGJQMkp82CWsgJ0XcPqiVFwHl7JgdKfIGBARJZFPCap70s3uJvHcuEH2PZTnBIWG4Z2WCC6d63yUD099cWVkp7hHKRY2XLA5I2hzmWm0PzxnS3ccIOzApuPeliqlMlpLdCaTVcMgL47Pnb1M6th2aozcNgg/nTDlkBo3Uw1+M8w/WxNomsVqN4jMh4wdR1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0KaKZpFoK4PD7bWbOYWKQUr1PFOIbtDH34bBQaaQS0Q=;
 b=OnRkLZA5N3dyhn0bZsC4GNplVMRW0sWFaEzOGKT12wWDnHaOVE8rbVq9HsbWY+iodlB2BT37ZkvZA1ItuP6KxJwjKP9XuElRZASczKOQ/2buQpMU5n8XcQy2poFA5GLajm0KbcCKAPne8O9PJMr47QzEsOURQrCw3oV1JbuDhXU=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9273.namprd11.prod.outlook.com (2603:10b6:208:573::17)
 by CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 10:08:03 +0000
Received: from IA3PR11MB9273.namprd11.prod.outlook.com
 ([fe80::31a4:58c:e3b5:43fa]) by IA3PR11MB9273.namprd11.prod.outlook.com
 ([fe80::31a4:58c:e3b5:43fa%6]) with mapi id 15.21.0662.001; Thu, 26 Nov 2026
 10:08:03 +0000
From: Imre Deak <imre.deak@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
Subject: [PATCH 02/13] drm/i915/hotplug: Set detector enable bits without a
 clear mask
Date: Thu, 26 Nov 2026 12:07:42 +0200
Message-ID: <20261126100755.1252635-3-imre.deak@intel.com>
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
X-MS-Office365-Filtering-Correlation-Id: 5743172c-3f11-4717-2240-08df4ba52878
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|10067099003|56012099006|11063799006|261022075727099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 5+pdZLwFDp+GIOYRjlcYUv333ydfnfCksl2YNJfxxZ5S/nrTTWjsy1k8cYV+phVPVEMtR0JnOS7SoBxnf/TNvLAYYviFb3zhAvm/bUTgO0MLDsyZzFERX9ESJkzg+vzVT+kRW8/dnp9BJgccpaALD5htVEqBuKYxJgTpHLw1yqq7CK6gzllLpcPg6YEddjbY4ggtBzpnbeyyorDg1dEOLpIHjlvCo1bsfIok/I9+SaIDlt6KSQVkwqHyyx/Lfwse4mhb7ePGlpG/Xi5Px6PsbImBnm7zuMJcRr8rlDjyUvrgbMrqR8bfXrscTW4fegmlOfzudmNqiVBNOp2OO8W2q6BC/wVh47TfypGLtHNZZPkdHSAIXE1FB22p5RBDMEzi5M7zPm2Vhb1z/3lMyATARrLSPmsWy+KpwTVFUjg4vdee0rINJMag+ykMFz1oRWMpdeqaAtTp3Vn+cFy28pPsrQ4Hav1rSw/AZSO07CIP8OirZzeGnNaRMJ08LFLVRG3DgFOBiQ8xmvqfTjsbLAfceblwlz6eBnVkYllaW5HVG4UjVGct0H4UnxXhL2wkjBDZzkqUVOd7gIgb8QIPYfRHNMLOH5ULkov9EWAc7BClNpycrGS0XlFmPfGS5eg9nSL+fu+qpJOXcyyV/f1/gB/Xi3Oc+8NFbdEChPuIRgA/LqU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9273.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(10067099003)(56012099006)(11063799006)(261022075727099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9nY9nu93/k0TpLCAL9iGY0cqR26Z5htUIzGVBGB9Z1n+LKgk0nRDa1tOBacV?=
 =?us-ascii?Q?cNDSxs/UwlOQTPEPEewtill0vzBIqgyj4z2JQOy7FnGQ/ViZUiTL7b59zV7O?=
 =?us-ascii?Q?Bj7pKPzpsqkd8pDz6EPh5MQrieJSRRyhSb9CNOh2Q1ZD9YLbxUhjkLRLWLFV?=
 =?us-ascii?Q?NHjaxVEZZaI9PdnHMGcX8dlEVH3DfnYAaCsE5XQDm2hQPUWULpXHkGwHdxKv?=
 =?us-ascii?Q?5A00o1akELoEeVGcyis4k9hFrRVQxIU0Be/ccUl2XsETPfqmyjo6dck29M1v?=
 =?us-ascii?Q?4vYm0cz+gVGgII33Z7vkXNoqltvgWZmwBVmZ7Bj7vRbPiVMLenhLtjn1Ch29?=
 =?us-ascii?Q?9cPEGyVbj7Y9lvDqWWJXLyRCvId9WL2LLTbFRAz0CTpVQW5Bht1VBMmDaPWz?=
 =?us-ascii?Q?P4beqe8MoIzZmdzTjEeuH7DycyUCqHB7OMT9jF4+/76sP6newek9FROkt0A6?=
 =?us-ascii?Q?x5Sc9rgTWa35NB8ivHXCp42MkYO/Z40XGFCu89/u8Uo4TCCKo4DkglpSIhiV?=
 =?us-ascii?Q?GBO3GIn69RD1YmsbQ9dUE85bpTmbXF6417lYVUR2g1sL+RK/y93FKwWnXNM4?=
 =?us-ascii?Q?oZp07RhscWQVQ8SDqI8RWjycycia/tUM71N4T1VikaIiEcEsQ24z/2AFoLHU?=
 =?us-ascii?Q?f5EWWeszrEh1SZ3GkLcnGSEsqmCGIOfeM9QDL3Jq9PA8XpYcIJK4pO45R75X?=
 =?us-ascii?Q?y+bfaM5GUfgoRjXDETu+2UYjZz6b+tSzLt8xiTw9G/G9mPRowh/oO4JEK2Rl?=
 =?us-ascii?Q?HBZZTWWIzIkvj9G6GczqnrexnLWWLqy7RUMtk43yOLGAb35ypo0EIMk9IAPI?=
 =?us-ascii?Q?YUOwyA8+dAveT12GZNKQ9rfjW3DxQbX50cf1znYxctqIiXG3apjG+BVJY4jG?=
 =?us-ascii?Q?OeJALqZNLVh1PKTvBF13UI2IFDgBH5O4QU1wFnq8YurvxOj9FeMaIchWTjHm?=
 =?us-ascii?Q?dbKXbTZpHJ9ohmRzyx77xhhAeRK6ckRVsFpLP3FfDNVVIKtffHiM0KHZ3vpw?=
 =?us-ascii?Q?BfN0i8N9/lJe5vaoY40mSPptW/hGlnRTihbJVig86xDj/SRA5ApfenIsv3Uw?=
 =?us-ascii?Q?PprlNQTQJHi0v6oVU6jlHXdJYjyDI/XZMU+Q/UUdWx+PRz72HAgvK4XLup02?=
 =?us-ascii?Q?m6a5vhXbDyrv0V0ysHswIcmxVqk7uTAbuA7HanrU8jL3qfYaCmq27pksBG7c?=
 =?us-ascii?Q?1rgvazQvhJMz4DrFLgSW4GnbxwHDyHxt92Sa1Hkb7OUjP3v3t5cPwy1S6LOM?=
 =?us-ascii?Q?tf0A7BLI6vTqXgB2DKEWhilhsohZdm19pGCp3WDtt7IJ/eXQtt2/b7awN1Xa?=
 =?us-ascii?Q?p8od7YLAtDGfj9UuzPVAKVDdvZEWv/7+g56/YeLYvi6f5EPKd3dwrk/spSZ1?=
 =?us-ascii?Q?hsnRUDe1Bd7RUaOvb78UshTlUnnqC7RIP1cBtpJcv01eTmAECd83f+w+WP6I?=
 =?us-ascii?Q?s/HVeGRiWR+s9kzT4vEI6DIFGgbeJGLDTBwZm91QO7MJUDKLb4d2NjmlBKOo?=
 =?us-ascii?Q?9h0PTtxpOVoK48WWETIiLHUU9UDPgUTyP0W41s/P/cHvj9NOa3BCx0zcL7nI?=
 =?us-ascii?Q?nA1JzkNGMRdMihn0lwfYLG6G1tRn36pDT20Y4GF5nag3Hcc27ORurS47r0tH?=
 =?us-ascii?Q?MC2Op+sdh7uySTMnJ5UD9hc/Te+WBM4wu0TghbZJjd+v3EhPGTMmIVlL/rxi?=
 =?us-ascii?Q?/VKdGmNZcLQPE7y4ooBqYqxrwqaTTKs6rx5O1lh0EwejIWg8j/qcAuI7pi4Y?=
 =?us-ascii?Q?LcLgaJ4row=3D=3D?=
X-Exchange-RoutingPolicyChecked: BBR2Wb0NywO53vEcrnjo4MBPehjF/b4ytAzauDkB0+475faLqqh/0ArSKeXixO7da2l5A6x8LO6rOVahg1twaW+786oeyzEIxEyq0tp8MHMFdAYWIH/XpipOMn+4Xq5bWmMeqoBUqY8QESxSYrcffP6/mzb/T1XVxRdFCEjohq0LktnhVCUZsc5Hx9pl7+PXvjt8mlBr/vrXhdM7nKyDbNq3Bn188XfIBdA6NQ+5c8OAX+ABaI34oXu2s+LzEIjxTWjt13AmSASaEu6TTRqn7U+dq3evqHfTKjfAWsDy/cXu6RldpNDTAhNMldT2FVR/gbu6sp/2k0txJ1Kr89i0Gg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5743172c-3f11-4717-2240-08df4ba52878
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9273.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 10:08:03.2942 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zBH6Tr9NdjsGICXlAUP3R/1NbWgDZBlaxzxy2isdJBz3GPDtLhWInmMmO501Ko2mvOqVr1FykanV2z+UyLqf4A==
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
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The MTP DDI and TC HPD detection enable fields are single bits, so set
them without clearing them first. This simplifies a follow-up change
that remaps an encoder's logical HPD pin to a hardware pin.

Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_hotplug_irq.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hotplug_irq.c b/drivers/gpu/drm/i915/display/intel_hotplug_irq.c
index ce0c8f56106a9..81aaf38f1b130 100644
--- a/drivers/gpu/drm/i915/display/intel_hotplug_irq.c
+++ b/drivers/gpu/drm/i915/display/intel_hotplug_irq.c
@@ -1007,10 +1007,10 @@ static void mtp_ddi_hpd_detection_setup(struct intel_display *display)
 static void mtp_ddi_hpd_enable_detection(struct intel_encoder *encoder)
 {
 	struct intel_display *display = to_intel_display(encoder);
+	u32 enables = mtp_ddi_hotplug_enables(encoder);
 
-	intel_de_rmw(display, SHOTPLUG_CTL_DDI,
-		     mtp_ddi_hotplug_mask(encoder->hpd_pin),
-		     mtp_ddi_hotplug_enables(encoder));
+	/* Only set the enable bit; no clear mask is needed. */
+	intel_de_rmw(display, SHOTPLUG_CTL_DDI, 0, enables);
 }
 
 static void mtp_tc_hpd_detection_setup(struct intel_display *display)
@@ -1023,10 +1023,10 @@ static void mtp_tc_hpd_detection_setup(struct intel_display *display)
 static void mtp_tc_hpd_enable_detection(struct intel_encoder *encoder)
 {
 	struct intel_display *display = to_intel_display(encoder);
+	u32 enables = mtp_tc_hotplug_enables(encoder);
 
-	intel_de_rmw(display, SHOTPLUG_CTL_TC,
-		     mtp_tc_hotplug_mask(encoder->hpd_pin),
-		     mtp_tc_hotplug_enables(encoder));
+	/* Only set the enable bit; no clear mask is needed. */
+	intel_de_rmw(display, SHOTPLUG_CTL_TC, 0, enables);
 }
 
 static void mtp_hpd_invert(struct intel_display *display)
-- 
2.49.1

