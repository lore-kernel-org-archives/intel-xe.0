Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FC71E7719A
	for <intel-xe@archiver.kernel.org>; Thu,  9 Jan 2025 22:58:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F049F10E4A1;
	Thu,  9 Jan 2025 22:58:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gLGmpItR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 483E910EF47
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Jan 2025 22:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736463486; x=1767999486;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=9IrmjMSl5WVl7YcYmCml4VS7bGW3JPjO6QsP9jGa/J8=;
 b=gLGmpItRLQwJG+OaResAdnPfJuG7bhcQlxnBg4Uz9c1Iuu2/osZIb/ww
 NUVG1m5fsty5ZrYaf4yiF3B4n9lTXOz35nClimwDM0GuUh9/HBxpc+Hbt
 KKNB1FeiTDn/VngAOJartsvLtn+uBl29xL4FLCsT4u9m/N9jd+Q1WgKQ2
 LSOeTcCkfxWJvznFgKORlSKDKZMwYx+/m8irV2kgRzaU+Ey1auR0zJeeR
 XwJP0EOA74fZwnvVhbuZ6MNrbJqcSaesa/ZpFnBfea2mqjVafk5jENY2a
 TXjQ1z5cLT/ffv+BpfIZizDYsTQRgBcRCy+XCQRrrMnuEJrGEe7cKtXEL A==;
X-CSE-ConnectionGUID: kLOXBJ3XSkqom5VADQpAMg==
X-CSE-MsgGUID: AOZad2BmS3WC+s2zzOygIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="47241213"
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; d="scan'208";a="47241213"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 14:58:06 -0800
X-CSE-ConnectionGUID: LVd5qmqbSdi1FvLhDpkzEQ==
X-CSE-MsgGUID: I6N3v5IHRxqrGvP8cKwtrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="104072768"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jan 2025 14:58:06 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 9 Jan 2025 14:58:05 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 9 Jan 2025 14:58:05 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 9 Jan 2025 14:58:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZgowByU1msGl5tibmjbOyRR5/UW+wGuHZ3p90nscJgPnSLJTTM6mLyDQa7cwLSKzfD28R7k85ThJICJ3NYO4LncdvojFgUKFiSyeoP4IGX9Y+dhTfmpokM4+nXY6YDamwx9jIhYI3jNREyry/ZNLcKuxlaVl/vtpS2Bl0efdns1V8BevVzDpua63YZp22Gg+65wB3fFvN6Kfxa8kGRmv92gkDeGEpuKWim+H2sqnJiG23ls+2NW4nctll6iven9wWf9A+/rFFgy2THpo5YmKp1F5ZsFU/Y7WuLXCOnb7qxsc5lEscJQGaani2ctMZWbWP5MI1ohi9YYJYyuUOesatw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JUzMDAPtTGg3TloV02ybOsSU+0vsyPSJb7oU+CsAehY=;
 b=b5EU+6QoceqrztQNv/mE2lT/vaYhsu8uzKv9NhnvcCdKiPATTFxjTu83w4fybPv/qywKvr3+2hXDCIfHA5dTchXGQuycb9oY7DP34pcFk0CnV0vvRhcemb/+Tz9w3f03xSB4J8pc2OMW8Ni4FwpdokamIYsjv6PARnUSTArj1my9PTkXs+REQvfLnYMoNJuW+jL4PXDz9+JfEJRzlOL4vbSfmpVF1YNyP5KJ3apMiMjfGtyeSTqtZfiuS5PoSAVX3E+b9f2QtqoJkyTdocH41YBYBIRwbfHCZs0SgzFWmDPxmQ631+KiEkmL7N4ZWH+GiaqgQu6QFU/w4YSL5dxGPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB8290.namprd11.prod.outlook.com (2603:10b6:303:20f::21)
 by DS0PR11MB7506.namprd11.prod.outlook.com (2603:10b6:8:151::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Thu, 9 Jan
 2025 22:58:01 +0000
Received: from MW4PR11MB8290.namprd11.prod.outlook.com
 ([fe80::4a98:509:3b05:29b4]) by MW4PR11MB8290.namprd11.prod.outlook.com
 ([fe80::4a98:509:3b05:29b4%5]) with mapi id 15.20.8335.011; Thu, 9 Jan 2025
 22:58:01 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Vinay Belgaumkar
 <vinay.belgaumkar@intel.com>
Subject: [PATCH 2/2] drm/i915/guc/slpc: Print more SLPC debug status
 information
Date: Thu, 9 Jan 2025 17:57:55 -0500
Message-ID: <20250109225755.992867-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250109225755.992867-1-rodrigo.vivi@intel.com>
References: <20250109225755.992867-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR03CA0200.namprd03.prod.outlook.com
 (2603:10b6:303:b8::25) To MW4PR11MB8290.namprd11.prod.outlook.com
 (2603:10b6:303:20f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB8290:EE_|DS0PR11MB7506:EE_
X-MS-Office365-Filtering-Correlation-Id: 8241d237-d934-4627-ef61-08dd3101117f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WtBjjJNmeF2fpL86fVI710AlKZfqVKaUgrv8jHPfvlR4Oxv3QPK8K/m3TA12?=
 =?us-ascii?Q?yAUh2JtvtlQKV4QHKMnoUShIDNiHLXNG2IKXUElt8mSdKEoleyiHEG3g+L51?=
 =?us-ascii?Q?RlD1Bja+6TJFlff3fZX178qwvloWf+iH5SyqxeGHpoBxW2ITi68VpUpFjq1Q?=
 =?us-ascii?Q?KNmVlWM8IJZ+ZR0M4vfdW4RwmGn190TfVbvLzrnHC8X+dID7G+CcxiaN+3IA?=
 =?us-ascii?Q?cuth+77E5D4mabFSCjopNhqEb6dwamgri9oN7Bu1kMwzue34CVPD3QzZQc0t?=
 =?us-ascii?Q?1rQ4vLQgzdJNbvgo1mszvtS8tpS4DLpWHUhTiU8V4ImH28291TOv2za8jicc?=
 =?us-ascii?Q?+PNOxt9gRuFo5H4sdpDIXnh2sYn1N71nq+UpgZo/g97YyAyAsA0qql4ItVmJ?=
 =?us-ascii?Q?v4EN3R4J1caGVCIdXpf4NmSpyxtOJg2X/hDHBGBy84OllLMoa+YJzN0p0a64?=
 =?us-ascii?Q?zOd30KYBqxpgmLkC1wNZrMBfzFJRa2rEepquN83PxPhuyUt2/6tKusPqDN3u?=
 =?us-ascii?Q?ryE3vB1kiYrHiHIy9rUYxKrmaNp1JrbjR2xTZnfbWYz8BcLscKJWXhpSte0M?=
 =?us-ascii?Q?BxhpCEf+RlRStOnp5qzWvUUlWGbza2bktMZemJFhWwbkJqUNX+I0UbfClnNC?=
 =?us-ascii?Q?WZIY1mo/YvHH6qgD76UxCO2l8UliUW7exs0KB6Vs+IjX/FqklGOoZN3mI9dD?=
 =?us-ascii?Q?7l5CRtQc8cy4b8O5wyEJqD3j2PAG3gLyyPpOvINeEMbhcx8SPtIatoW+v1ym?=
 =?us-ascii?Q?D5ITCK0mZnTLRMD7K1gAa7JGG9g5PuwU/0++Foz7rLlXAbDg+v3ZnfWhxEFH?=
 =?us-ascii?Q?tKgOaYt+ExbFMMYE+OVMYIj4Fkk1MB5iEXXAPn3dJyux+IMv/VBl/oPs21V3?=
 =?us-ascii?Q?7Vyvy+UtXvlp/zynqgbmpvJW4cuQ2mDH9KzeV1hXU7qsyeechUjqd5ZRShJM?=
 =?us-ascii?Q?RrEsdhmnPQOjEW0KbtqUMxv3o7O1CRX9p6p5oqYH+r5w22t5HDMKLJ9gAbfW?=
 =?us-ascii?Q?fDwpm6R74XXLB9yydEcR0ANCu2XyfB7xxdaeirGtQujBP2DcQnlleHl7FMGF?=
 =?us-ascii?Q?yQ6XsKm3Uk6j/v5rV2B2EMnguDrUC0w//ogM0gXOTqbzOVJKpdq7XjSfuOu/?=
 =?us-ascii?Q?Li6/l32Hqm7FFLNaHvo6x8bIj3iD3DQxXIHMk44/lwhALzJtYqKDdIhzreTL?=
 =?us-ascii?Q?5vDq0wTDQvEQCTwMsux+/1p71RSYsY05lNmuSu74sAnLCcClu2VRHRZ0UmXE?=
 =?us-ascii?Q?u9x+nwbgWbG+2Z+HsEKKTWRZEpaIKUm4MFB1kP05yZvJ1xT27rGR0COirF5Z?=
 =?us-ascii?Q?teSITRnR+dY4E+R6xSBOMKUYXBR1YGN52NAoNVQwrUPxKhvifYgqUPukxbEf?=
 =?us-ascii?Q?4mYggeVYh7zfYOHK5fhEg5Y95nBL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB8290.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DYEJpSnG69sm1aGdSHPotAnTfze8PdfHv7PczpqqUT4EzB9giCqxCN1rrL9B?=
 =?us-ascii?Q?TJJdodhhZ2Qy19SdvuT+i3f1d4GEutaUD28fl6GT/6kMTCYQ9prR18Z0D61z?=
 =?us-ascii?Q?uYYV7Qkl75BW7+lipeDSGpZwwLu55kLc+Q34Ujt/npq6lKdx7RdKM1oyQVRe?=
 =?us-ascii?Q?jSio2GAxGw6VMAqRTQwW16XA4qS4l+x/0QU+sEmXR302j++fBRf1RHiDnxQV?=
 =?us-ascii?Q?5GdKpGvwJFlkFN8F/Rkw6pGxvVjOEzfV6yTKl/3OdtZS8hMMgoz0V76YSVTA?=
 =?us-ascii?Q?+izCFHSTKKLHxTWcrM1mo19CdefwANcYDM7KbeTVWBNCL/T8UfCoSPeQMbHl?=
 =?us-ascii?Q?ZT/cuLo6iINwvrwdjejEf1r6uFMcac1SviS3zXw+Ly+V3B4ltavp5kVAZi4h?=
 =?us-ascii?Q?F5hzU+/WeL/XZcQ7J03+RT05skI9qHou0TJAwgeadzqP+BCG5BleK1lMd4oE?=
 =?us-ascii?Q?kcFu5tN0fl6pEGYgT1BRpeHf5vwQYshUhoOgh0U/Fasc/AhzatN+FKxBGQzL?=
 =?us-ascii?Q?WBEwfhg0MvVWbamoidCtj1xEzKxW5PS6Y04egTQu2ZpUVEYlcVe1dJoM/7oj?=
 =?us-ascii?Q?XuBHa4bOqkjmFzJtye3mBOXb88YslazHlxN1j5XBk4d1+T/dfRXsNb3+yXM2?=
 =?us-ascii?Q?NCj9KXB7sOzRwjTuPz5f+sRBaPHHuwvb9q3fXua6GQB9FDGXUQQMVoaqH0Fq?=
 =?us-ascii?Q?v6aE8okCNmm0Oo6PXVNrO7peoQ9d2MtVcZEbCxbOosT4oPyp85sjQJvliba3?=
 =?us-ascii?Q?7qUbV6fxM+b4YkxPtUV1sqIDUnHnbL+xDrl46l49Hg1l/ijpzI8WAANmyrdn?=
 =?us-ascii?Q?bP4l5pYaFMbMG6RfHH3P11KVQ1l2YOY+KYyHhKBf963Y2LzEIWgMmhK9bRbu?=
 =?us-ascii?Q?YuDPrXXCIJSYuTF0x2jZSkvThorbEeRWX8p8GO72UT4NIL2/9bFBVHiocSNE?=
 =?us-ascii?Q?utRX38q/oQUnUvnWy32tKoMMBBFS9y7aXp4DwkidIfIqp3z1z+/0gWpEBBh/?=
 =?us-ascii?Q?ZGHrZBqQLp4yBKTuVZL2V0LH3RXWsZF2xeUVVKWjLbGsQ3gOlMPJUsE8Vq4x?=
 =?us-ascii?Q?jj1noaWUkqC7SlJpdIbRKdwOW30unJgJeYnUNiXpXFpjIHzA89ChVVgLAhnO?=
 =?us-ascii?Q?RlfmQhJqOtMNW0pdpydb48O2ptWfco8CTHWU1NR2mTLocd9kVL4Hpznicjo8?=
 =?us-ascii?Q?7HB2NPZtxytx205V11wOVMkHUmFh4HRnUweX5YJgmKTyGAcBAlP+Z0i+p2wy?=
 =?us-ascii?Q?vyZqCg3dnQi83CrqaQy+kzib7AXwWm9QnxjsXmyIbvsOUcX2qSzG0ABfW98u?=
 =?us-ascii?Q?g5BspoFHH7ameUkAL40x1Dcf+OJSUgPzoTFYxhEnTLowNTCf8YWRnzeYboQT?=
 =?us-ascii?Q?g2/bskXlrjq7HEz0RJn06XBnMa355jdCQZi731PvYdvrgIofjZiN1q+FjsMj?=
 =?us-ascii?Q?5BeYtSREsZLXAWKzgK96hwxnRF81M0kx5wyjwT++CAnF6h+vxMwxpmtk7Scz?=
 =?us-ascii?Q?zfhwomXp2m5xFM9rWqez0PFR8H4sce+RSE54XnATRX9OBpELMDO6MQ3auZbC?=
 =?us-ascii?Q?x5cF1hLHWZyR5x+yd2q/KMMyQBDmwaRfArsHWyAkT5lXn2dLyb4UrVQZFFw2?=
 =?us-ascii?Q?wg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8241d237-d934-4627-ef61-08dd3101117f
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB8290.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 22:58:01.6549 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fXx8WFs6TyOKW94EDQlYJUShUC+pDC6ymYMABCGUYH6Aqu3kJOYw6DKQYFrVCVVIhzVT/1lNE8qk/vIyJ2OoTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7506
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

Let's peek on the Balancer and DCC status, now that we
are using the default strategies.

v2: fix identation
v3: fix typo (Vinay)

Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
index f05c92e08d9b..341f9f8a7404 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
@@ -797,6 +797,23 @@ int intel_guc_slpc_print_info(struct intel_guc_slpc *slpc, struct drm_printer *p
 			drm_printf(p, "\tSLPC state: %s\n", slpc_get_state_string(slpc));
 			drm_printf(p, "\tGTPERF task active: %s\n",
 				   str_yes_no(slpc_tasks->status & SLPC_GTPERF_TASK_ENABLED));
+			drm_printf(p, "\tDCC enabled: %s\n",
+				   str_yes_no(slpc_tasks->status &
+					      SLPC_DCC_TASK_ENABLED));
+			drm_printf(p, "\tDCC in: %s\n",
+				   str_yes_no(slpc_tasks->status & SLPC_IN_DCC));
+			drm_printf(p, "\tBalancer enabled: %s\n",
+				   str_yes_no(slpc_tasks->status &
+					      SLPC_BALANCER_ENABLED));
+			drm_printf(p, "\tIBC enabled: %s\n",
+				   str_yes_no(slpc_tasks->status &
+					      SLPC_IBC_TASK_ENABLED));
+			drm_printf(p, "\tBalancer IA LMT enabled: %s\n",
+				   str_yes_no(slpc_tasks->status &
+					      SLPC_BALANCER_IA_LMT_ENABLED));
+			drm_printf(p, "\tBalancer IA LMT active: %s\n",
+				   str_yes_no(slpc_tasks->status &
+					      SLPC_BALANCER_IA_LMT_ACTIVE));
 			drm_printf(p, "\tMax freq: %u MHz\n",
 				   slpc_decode_max_freq(slpc));
 			drm_printf(p, "\tMin freq: %u MHz\n",
-- 
2.47.1

