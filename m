Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE722C531DE
	for <intel-xe@archiver.kernel.org>; Thu, 15 Aug 2024 22:08:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 898CB10E479;
	Thu, 15 Aug 2024 22:08:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EjDdT9YN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A120610E47F
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Aug 2024 22:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723759681; x=1755295681;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=wSej1J6NFnPbcCYNY2IuXryGTr9t50InEQSR6pyt66M=;
 b=EjDdT9YNWyRueUimFrCLc22RfEdHAZHMpd8p3qOEtqBEHdZNs22fTh0n
 TshAPmOfoNnB40pNMA7iSzs4G6MDJdb0BNMiURGIBHR99JjsnmRNA7/vK
 uk76cCQiL++ckM++FV/JN0zOe1N+4T6T+nzJKFrg4EAGWbpgNgTv0rIb4
 1qjzef1ctwLsg1PJoxnbOKFENoH3tgd8o5OGJi1S8JYMnLwNLdVibAeIx
 slkgz0OwDXBRUD2zEvJZE9hpSfGodvJvWOrk/TtxfYvXpkQrNFsvtKjvW
 tu3pLs4yQ8Lc0Jm07lS3L6loRBJ6nqG724Mk+aFYJE2gIhwkSnwsYWUWJ w==;
X-CSE-ConnectionGUID: K4joooaRRkq9WbvmAqXVsA==
X-CSE-MsgGUID: XeEJlR/3RdSCmL/PPFDPDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="33455505"
X-IronPort-AV: E=Sophos;i="6.10,150,1719903600"; d="scan'208";a="33455505"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 15:07:59 -0700
X-CSE-ConnectionGUID: gESTZQcSRfuz3vZam5E7ZA==
X-CSE-MsgGUID: ZM3/Zv/NQFe69ZXzpSnZew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,150,1719903600"; d="scan'208";a="64375306"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Aug 2024 15:07:57 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 15 Aug 2024 15:07:56 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 15 Aug 2024 15:07:55 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 15 Aug 2024 15:07:55 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.44) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 15 Aug 2024 15:07:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JGlnDq/PXrFoB5eZq2wEbVqJYva+9b49Lca4vc9h1/kOmKqhpvzOeXvOA4Bh2AvEPxGd55T8swS1ZMqK/0Mw+Tf03Mdd3FhzqKvrFYOP7SrPW0VGPbcHfsgsN+FkDYvtDfiKO7PmJdaMxsFKXR1myP55XfcVH1dii4jAS49yJOVZJ+oKzv4jYZQI/4+Y+dYrh2jrVmPSanUnOJanfN5eTJJ33jmKxhyHRR30rrOzZ1coNtk/7i1PtFa4IHY30WYjMyJU3ExZdqJvOS6E7OelYUPgBc6zNMBK/ByWTceVAICZdrvcpLJLsOwLiEJina1EDTnmHRnZ+MeuqPto7kk1IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nPy4hO/TddUVMGbUNCzyPynIrclNdSplvvBaT6tcD5s=;
 b=Jjy0Wjn3yL5RnTlBS5QGLVNqfJhKYbtvYeEyOPa0OFA2bQKAfMRWfgHjvRx76vscQZlu3wQf/xUoJ80pqhl/ahe9Ztu6BXIPGXpZ/f7vCBlfduhWHT6FNp0d/3yNe2d1T/0j8Yih5P9s7qVTDRzhca81KBCxL/JTIpv6RzLOkclhPlD9BfhRWHnqOyX8LJV3R79ET74St2taWlf/nvoJEljO7oWBYuiPIGjeuTqQoJwY2hs7DgAL1nJ9FViNfKyRirHMDAwy1nl8ysrdDb9lQZRjkImIoH8lETi3RpSz43gwYSIR0LXSTQ6HQfGNdXsk+BbX4S1jYfHww9Bqy8yF1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by CY8PR11MB7133.namprd11.prod.outlook.com (2603:10b6:930:63::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Thu, 15 Aug
 2024 22:07:50 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7828.023; Thu, 15 Aug 2024
 22:07:46 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <lucas.demarchi@intel.com>, <jose.souza@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Matthew Brost <matthew.brost@intel.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [PATCH 04/12] drm/{i915,
 xe}: Avoid direct inspection of dpt_vma from outside dpt
Date: Thu, 15 Aug 2024 18:07:24 -0400
Message-ID: <20240815220732.49675-4-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240815220732.49675-1-rodrigo.vivi@intel.com>
References: <20240815220732.49675-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0106.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::21) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|CY8PR11MB7133:EE_
X-MS-Office365-Filtering-Correlation-Id: 35169e2f-ef6d-4e88-86b4-08dcbd76b1aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sHWElrCV63ZTjKPWLSLqG094VkW50VAjp+mTYHvOVH7Yxy9H4fw9HiT2CYv8?=
 =?us-ascii?Q?XbJv150fIivQ1y9qjwnW4CrVQ439xnRp1FjlpBbiMqDcVvHRyaJFLf6MnGyI?=
 =?us-ascii?Q?qZjRNV2i2FWeUVWEA9Q/mAJBc0qIAeMzQ6k6VXpZx19/s2MmMTc2bxj+S5yI?=
 =?us-ascii?Q?eGkv95q/BpurK9c4KAvl9F8ia0sBoQ6mMPNcvXHIhF213N6Ha++SWoAtFRnZ?=
 =?us-ascii?Q?4X/q0OY9DJpS+aWA56fnX6kLGR6YRLXUvCOcwrAJJ8JvgxiD9377HEObHzU0?=
 =?us-ascii?Q?7QvIk3o1xw51H7TKBKkXHMnI2y9NiuygPBahH0mhmRIhxt4nFnx5acypxoYz?=
 =?us-ascii?Q?MmSlwpptGZrR1Yk5UYyeNaIsx8wj3ZO6sgVSADRLPv2mBl4JGSo0UbrZ4pDJ?=
 =?us-ascii?Q?jreMaCUnm5xEy/MFzjxi7vQKqwJ3HZ2ocZ5XTo7zXLu6MXm2VZj4ACKK08XB?=
 =?us-ascii?Q?t/iw2f7E/g/9r/NZ24t8WD8Z++ushHez7ysUkB2/Ph/6qwwe11ls0eiQ0wzj?=
 =?us-ascii?Q?3/EH1yKPgEAlUk9gB8loAzj17Ux1EqzHJI9GX+xF58Dv+/YB5Lwz7u72gVQ/?=
 =?us-ascii?Q?w78zUVTFVnITIYrf80OAqVMrY6IOGX9bzgrmTmicU1hNGb4wgE00kt+c13Tz?=
 =?us-ascii?Q?4qUTMbX8VDppVzJae/z26SFd2NRy5q+xqRTeQ/prYHO66/ZudRWjymTq06pO?=
 =?us-ascii?Q?g4tGWYsi+4Aa0yWZOkIVpJC05zYN4ojFGmysigs67eKXVGaNd1kWGwPytfCU?=
 =?us-ascii?Q?VGCfuOjRZOxtrCqC1HcEf3PXfbaz//PHtB7QwDgAzA5qZ1hrgd3md5sRVsEx?=
 =?us-ascii?Q?Hie+YsJLN7GXuDo33AiUCIEUApUrM6kC+BydENmIcxMXhNFKLmNXpBgxNnmA?=
 =?us-ascii?Q?I5sTlmu8WhlnsdXKnBw1R1f156KfIGprnP/V3e0l0yNb1iPs4HBbNflmpGTy?=
 =?us-ascii?Q?YbanqpZq2Kbq5ertWQsd10kl5HAM1ZSJ1sGQDiguAoPDCYCRdt+pb38it5sH?=
 =?us-ascii?Q?G11FmlZfHRsltProeZ0BktU4kQWLUWGJW28RZdT/H1v88zhZMIE3+XyZdZPf?=
 =?us-ascii?Q?V9YX4ggNL7BKmSsoPuVq9MIDgisPnjv0LoHtEkEzhahwJ4vJXbCiXzyVF5CW?=
 =?us-ascii?Q?4FnkjsMk8OyLOCeMhohss6xl78NVrn3lBOl9SU+vO5alrA+oY1D/juxIW7JL?=
 =?us-ascii?Q?GD4NhusEO0+aKDqF2Kd8EERBgNTnCa3ofAx7T1Tz/O7OdpscOGFEJ7s5u+3f?=
 =?us-ascii?Q?4Vg/VcsXhqzADbWT9HjdOlmuyo4rD+VKEIKZeeQmexkcgC3XP3UNWhC6jtgW?=
 =?us-ascii?Q?DLbFab5B8l4dPxKNPjki0ON4R2Nwbj+93CCOO8AQ4EnVLg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sr84EUhpofYNJW8C29jfvrFSXQvUX+ojZXnp95VmXapeAfOjoIIHe7Xnbp6x?=
 =?us-ascii?Q?hjOSYgTUla1A+tx1VunkEWMN+iI1gkbBKXCveRIsK62/6y+4ULaqfo9F/+dc?=
 =?us-ascii?Q?jwTBRFNuuObDYq3DcW+2n8apLiQMYeW1jZVkcpW7bPlIAxwWUYHpJPnAIwxf?=
 =?us-ascii?Q?IrfEiMd21nagGuRCn4PVVs/84W8IPer3jP0A+zj6ZtoFSWtoxYP4tW3ovtf7?=
 =?us-ascii?Q?DkDE0l1NdKFI+hVwXggY+jjlAQgrZ6L/rVe/szNC5iMKJYZd6G8EIXQcsOmD?=
 =?us-ascii?Q?tmJXrSLZpC0TlFs85H1XuDoOY1zfvM5aivplofZxw2xwT/xXUTa7zoCe7B6t?=
 =?us-ascii?Q?x8NeqHu9QYpiQEiiSzmlT9bQxDakWj9T4ZHscWFD6yx+zroovtqdTb3+FqyB?=
 =?us-ascii?Q?ru7g/Y5xqhXTGcAqpd9XC5ofgvpDiECGI26KwKdNOfqL66XLuvUYHfFT1Qo5?=
 =?us-ascii?Q?iHEklSk68IQX23eOml1gaQ2yJOUOFIq8mqKNto9o1Uf9wEZf+2C0a5IupCmM?=
 =?us-ascii?Q?a7E0zeZyeVLDrpbwrF3i1YkY4ZRHPWQBzq+4Ek8J/rZHgLtm9nLtSbk0FBNH?=
 =?us-ascii?Q?TMLHLIAcCvXacix/2hlbBQecwG+82Oh45Age8q3JC/ovBoh4iKBZqP7MTXJc?=
 =?us-ascii?Q?nBFHL5aKhdCbZeMZtAvKCR44ZzEfghkeUaWIebggvtPF7rnIVWC5tkuFTgu/?=
 =?us-ascii?Q?QbrQYYSyEmI+T2U1Pym+U3Ggw306AP9OWAolMiVF6qoPCWrw4eTjESM+Fi+5?=
 =?us-ascii?Q?TCsJcjts0l0whdw+JN/7juAeDZYSG75iPPQwF5kXuOxN6saIjcSgP1ULPx5V?=
 =?us-ascii?Q?Yn1Y0l7za53UPAlWvsDGvUT6K6bHV7+N6RcnQZ4OyNKAvAR2QaKmLkBKaAQu?=
 =?us-ascii?Q?E3Jq0wFfRo07e2EdbOgoB4U8KyMlRao91duyM0Tw9Z1iPpLnTrPvos6VKd4a?=
 =?us-ascii?Q?6nebIWRKSFuB7ayUyjeulyw25vjNBSwtp3XieIJSlNLm44GHOz7kf50Nh3TV?=
 =?us-ascii?Q?fkW6uzM8YH1Uu8JgKYSWLJl+EDICeDNase95yF2I2VZf+5o7UpPC496083KG?=
 =?us-ascii?Q?8hzIS/WM4NpHhFPSx8ovf6HjVPUoP+j1i0RxIUlZEhgcXnc/+IrTk3k6uw1I?=
 =?us-ascii?Q?spz9jwd43F9lsaDTn2N/l+IVmiaKrW9fnDKqvCQwt96aOMAE5VVUuPjqP1lI?=
 =?us-ascii?Q?Xm79xTcgz//vIidoOC5rvgbSVgfaH0T8pmv09MfN7uy3J4QmcFnYM5AIBxwM?=
 =?us-ascii?Q?qFDDOWVf2SOnXe3LW1yt153Ua5wtmt94AHG5f5QQC8FAoSAX5sF+5n7iJPEc?=
 =?us-ascii?Q?JVbCPh7NnK5dKSebq/21MJxCI/lTLrTroWb66N6yyMu8A1gbwPmwbtmbsnCb?=
 =?us-ascii?Q?aWpnXkEg6Pcukwt/Xr6is4ssZtE3eal3xxgVz+fGfr31hdgi9KmWGRJs6Ayg?=
 =?us-ascii?Q?sk1c5Jxjw6Z72wSmWyvTbzDMCQtxJ+VqDCz7TH1bisdhzt0Eqnx2Y5NPJTHb?=
 =?us-ascii?Q?xBPQL0xkFbFrminkPXmICQy30lgk2z8enNPsBi7vgOL//SWVMIeYQYqA3XHI?=
 =?us-ascii?Q?YTQ/E4oqUX4MY4NJ/J5PR6L8/ybq/2RX0RwkiIkqDFKFuDHygiZjV4BKej+8?=
 =?us-ascii?Q?Og=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 35169e2f-ef6d-4e88-86b4-08dcbd76b1aa
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2024 22:07:46.8278 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +xALrGgxrFycY76RG+JKWXb0yffAYcWtrRI4xP8s82imkI1JI0Lg9CjuiN2vRP17cKKXSoNDrfj1JS0g+rLPZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7133
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
 drivers/gpu/drm/i915/display/intel_dpt.h           | 1 +
 drivers/gpu/drm/i915/display/skl_universal_plane.c | 3 ++-
 drivers/gpu/drm/xe/display/xe_fb_pin.c             | 9 +++++++--
 4 files changed, 14 insertions(+), 3 deletions(-)

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
index ff18a525bfbe..7336e905142d 100644
--- a/drivers/gpu/drm/i915/display/intel_dpt.h
+++ b/drivers/gpu/drm/i915/display/intel_dpt.h
@@ -20,5 +20,6 @@ void intel_dpt_suspend(struct drm_i915_private *i915);
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

