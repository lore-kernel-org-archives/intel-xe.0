Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A31C1C25B4F
	for <intel-xe@archiver.kernel.org>; Fri,  3 May 2024 19:13:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69D0910E641;
	Fri,  3 May 2024 19:13:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kgDvkSIl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00D7F112947
 for <intel-xe@lists.freedesktop.org>; Fri,  3 May 2024 19:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714763624; x=1746299624;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=KaM1FMC/bYsPWOjHk7KSMrR7FklMxqS5it4T1vtVcCU=;
 b=kgDvkSIl3CN9Exev8JSIeQ9i/M74j1CWN0lzM+cVPkS3BE1gbC2X1Vi3
 0vcgEoAM4JcXeVHRc7gU9VyIx1BqSpy4rFKi1xxyzvHuB+FtGLWWxyJM3
 788Afvxo9wFH5iDuLjA6ZTvWE/OK7tQHGRFWcrfXq0ZAP47h+0oLhGW3O
 eUfYQwSa/fZdoraGO25eaPGTeP74Gk6MYlH15c8/CgAciPpadKER6RQcN
 UVODY9YdhftR1pvcKii7Ce8pVqJPF3CuUXY1gbi1Ty9mVYt4DmE7EwKcM
 e7PN7v9UNe2zwJDaXxQY+kFGdnevP1MmH2U/u8jJkRXvF2aAo1ndfDQd3 A==;
X-CSE-ConnectionGUID: MxEZNKFFRR+lQCMuZgSRcw==
X-CSE-MsgGUID: zh2E3MV4S/yqWne3Ia8QvQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="10708807"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="10708807"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 12:13:44 -0700
X-CSE-ConnectionGUID: 4XDHUZC5Qs2LRHGD0Vjqkg==
X-CSE-MsgGUID: 29S3T/yIRQOEpVe0aUOUjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="27943531"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 May 2024 12:13:44 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 3 May 2024 12:13:43 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 3 May 2024 12:13:43 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 3 May 2024 12:13:43 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 3 May 2024 12:13:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lwIpuyXnqa6bATljg1cOnI8/EoCPmJ7ZmX/BJWMDkOqM9yGeXf1BcvI5e8wDFgOVMkHvPZ2skcipbT2LMbyXnKqRR9Nrj2LA8vSRNCl8AjzavuLE8mAN5Ir/Dk7qP059NI9vI8ofUKFJaHQL+nf7TcPv1NYzOYE96zvrqI8wiqE2xHwSWRWu1Lmu38Rr609LsIgPtO5MjIiEKqto0Kn6eJi5YBj4aLKoTHDjmN7yBfzyNJTxnp65b2P6v4m3xC+bVUTRnMsxBjwh3/3GNanNqaJr+inDziacY+vDoSf47VWP7mHvt4DprHKzv7qDdBAlgSlQLms8oljknVJ9EwHqXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/i91P9WRHef1yAyQ1w3RSQQIWZevnJVOgm9KtK8Hlp0=;
 b=bx9cEwztCYGa8AYogrfFIFvkh+lkZ2phzRAV9OJqp3uYJsm8U+lGuOTL/1pr7/SkMbtM0ePdMRJe5Nuaqwqu7yc1/QMOonUyNDwd7zfmPAddwDTGyMwmopLMFiwQjfqy8N9X+tVpHjQKpIHeMap0gWZ79uj/CUDIOugoJw9QwluVbK8S856gB9aLICzQEUY2Ah3qCFSER9OSqMb+QZGfMsguM4P5kZ35slk1zhezWyZYivkvM1cJIhjaTMcYWUwcRB85jtUBI/8+GBRYCuP16X1Bw2L4I4m3p9hY7rpFzNa7zp6Rl3b4JFxW6u9SKfqkzUd/WEYqoUdPWqhatsyLHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY8PR11MB7922.namprd11.prod.outlook.com (2603:10b6:930:7b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.33; Fri, 3 May
 2024 19:13:37 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7519.031; Fri, 3 May 2024
 19:13:37 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <lucas.demarchi@intel.com>, <matthew.brost@intel.com>,
 <francois.dugast@intel.com>, <thomas.hellstrom@linux.intel.com>,
 <matthew.auld@intel.com>, <anshuman.gupta@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
Subject: [PATCH 6/7] drm/xe: Stop checking for power_lost on D3Cold
Date: Fri, 3 May 2024 15:13:08 -0400
Message-ID: <20240503191309.7022-7-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240503191309.7022-1-rodrigo.vivi@intel.com>
References: <20240503191309.7022-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR10CA0014.namprd10.prod.outlook.com
 (2603:10b6:a03:255::19) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY8PR11MB7922:EE_
X-MS-Office365-Filtering-Correlation-Id: 904b3dc3-2479-46d2-c126-08dc6ba5227b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Xl8JExyWgvupPWZpmJGjG8PgrHFWttimaM2ATyVKIf5fN2YSGSlcX6vZQDk0?=
 =?us-ascii?Q?+ADM3XMR0X7P/CNlwYEJwIyy1fZcw0tr4pLbzVBYdj63A8ghuM3/oSHl8GrC?=
 =?us-ascii?Q?hmLh6vomgA9SQ/VzgMV5IAPpuOiG3AxWIccljZBGngAZEWlc88yBT0+gjQgQ?=
 =?us-ascii?Q?JnAC2o0/wx/7A7kX6lopdLP/uA4GLFJdhBAg76EsVCVvHSEY7Y7aLWJlqyPv?=
 =?us-ascii?Q?tzmYiVhabzBwENV/IRr/GOl/EncuVFc+1oo8AbsnAhMs4h6G65p+2kQZeJ9S?=
 =?us-ascii?Q?8PzPYNsd6RyZi19NGa3BhGhvjNkO8p08nAg533vbb7wnHPt004OmpQxAq6HI?=
 =?us-ascii?Q?MPS9hOTvM424gTg5reCNtgedr2Tm5uMMVKVqdgM4ymqdsvMlMHbqF8ogkM76?=
 =?us-ascii?Q?JjlIhubuPRbnwOyBlgNn3QKeCLEdpepOdLT87Xsu8mkd4EL+U0g88Ki1siWl?=
 =?us-ascii?Q?na/vFMmTZYtTjltmpFS+JIQFwYLFyAXBbLLT23GKBvd4bEsmaIymwYgNIfwP?=
 =?us-ascii?Q?xu0XrMRzWyAULzsWs68JRZ4IuGZeGxSlifMhjMZ99PZuu8kN+vjPxnKYWA+u?=
 =?us-ascii?Q?M0VdmqxG/VCflIV1aOS6ASauEUKUR8PKBSchrHNopGobiz9+dyjnfxyyyoZb?=
 =?us-ascii?Q?8CK1KkterQfkOs3429FnhLK4Jfs+H+bZTotK7n3LSZJTsPjjxleXsQDxPDPO?=
 =?us-ascii?Q?1x16/chn0Xw5WDkyy8DrzCJnqfedh1Nb4t8ZwuLruqvgig+cEHe3hOOuVvIH?=
 =?us-ascii?Q?1D5phMnO0wCUuW4FbdyV2TzE8Km8o/iSrHJWZfQD7FxIHnISY9mjOZvERqhb?=
 =?us-ascii?Q?8lvj4a/QNLp1vAJFMbfmVP+xIw7gUgCe4/ONOozyikEB7mrtRBGmsaofyYg9?=
 =?us-ascii?Q?oo/BCkk64OwD7emViKZRI5FG8Hb75S4/gmHuCuixooEeKF3P+Js2jQDlAXWk?=
 =?us-ascii?Q?csSDi3Q4wGwXHqOGHBrYKkoBVWvoFHOlZRxfiptL/GyZefyFmOOwMuLQwK4s?=
 =?us-ascii?Q?C53V5zNS6HLuk+fbX4I76RjJQTMzBHHBh86GPR1esddOssIEh/qxwwJKKHBF?=
 =?us-ascii?Q?/XKJx+oPzY32treXH+Mr6hYT0OE0i4tig7rRo+F4J9N+B1PAltGcvuHq5OZq?=
 =?us-ascii?Q?mWXPHNUP4oBoEvxS/uwHKTD06X7VJbMTLANRKqUZPxgs3ep2F29N3mEDkYHI?=
 =?us-ascii?Q?4SP9ZXQ0sSCqEIbHSQ0K+mwEw0ItnFjo/cPLf8LPcWb17BUlWsCi1jdDBD5x?=
 =?us-ascii?Q?LnfvscU9flOMm4yaY2TEvgElADsJMt+bcPrCK2b7RA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3mxjhJaiUmj/6BAOcbdLZ9vtGkBP1oZ/hZ4QYLwDn68acYltyRFehqFgDUxG?=
 =?us-ascii?Q?jHonC6+05lXhQlh/yRHSSBKbUg98PpwH+X5nvJFScPjlcxcIaI1sHyoBrL8T?=
 =?us-ascii?Q?BwciJ9KttWL6hKFeSVB/TZzaleMSez3nnwx7l2gZzHOCWZmQByiKFFRoQ2ey?=
 =?us-ascii?Q?fe4gUFOvrp81paWgvMSAUzxs9GR5h81uCaRNps7VBp72FlCEgKfEQRnHeR9N?=
 =?us-ascii?Q?kYSVseu630t8QaZuNxgENJWG/sAdoP18CRO6Ok0DUbgiKJxR8yKU2YkkaKV8?=
 =?us-ascii?Q?wS1d+ObIZfHZXTTEpTgyZjweC/3d/NR+MEDI0Tn+Ti+VbnVt1ImIncEDVzkW?=
 =?us-ascii?Q?AbB6hr0C19t50jaUtTSoUF0EWGHcMWaC0cmmAyPbrGHSrXlHGJTxTjoP1T2o?=
 =?us-ascii?Q?4+kJZLqJIIo8efWCfWwKIpSVrVZpzL0b56NQZmO8D6Sf/3jD9bSADU2yX06K?=
 =?us-ascii?Q?qiG0q6RCkq3rG/6ZcQ2RDFrRyHPEWoqd9tmDqpZw76Db3/vXRLPXgNbBuemp?=
 =?us-ascii?Q?PtVfPQWOSJqzTMrkvsVGpPLfAS739927J/3rMz4OOAJXm4PMt3Fd1YBruF5H?=
 =?us-ascii?Q?MeZwWO3gIcSt4f3l9O95cIFRYQ9DG+IkEogOrh0Cy6J3A9j8d06CaMkiMeLg?=
 =?us-ascii?Q?0v2oMUkNnVzpzz6zVXL+wtrY8xWwE+NOUPnc+PFW5N9d/jFD+zSQTh0qF/lY?=
 =?us-ascii?Q?edYu20sboOj5shMsmviIV76i9iDqvC3d8qIqEi4eU1HKhSw19s1rHD25A8wy?=
 =?us-ascii?Q?QYiEcojbXbbGH6y6KBVmdG/vaWHzIy80besrnbkne5Pa+JzWM8Qe5bX0yJ9y?=
 =?us-ascii?Q?aRT4wyebNW1G3ZYcl9Q9pQnchkLSuSD2qZL+Q4QyKFHEgJz9FJeyKpWFEsWt?=
 =?us-ascii?Q?EA9FKRDo92f/arAiEMm4dZNexOn5dk08x7CEYjNlZPGQeS/CGhIlw6+QgV1v?=
 =?us-ascii?Q?IFFToB+Ht1ZKQcX10Mg8eNdkZKdxgRcBcGj0qjdunhhKNCBA2LPS/ienh2WA?=
 =?us-ascii?Q?fz5okMcdQEH1jEAd6oCEBOy49mIzDVmjnA+vlC5B3iCr24g3655BLnwgpxeB?=
 =?us-ascii?Q?JLX2yeI3CZWwH65MvLfBEe3KqDMnH08xNCjlg7qsH2GA7+YzE3Y46QBcPcl4?=
 =?us-ascii?Q?+Yg4ZjqyaGGEE0fUJH7R5gIcG8SjpWgamQ9pKrw2YRA9vUjFwL02rT9sgQ5b?=
 =?us-ascii?Q?Kbz5IzsFW6qC/nRu5alAiYNFZKAjT5/B5zg/+0bws43gGDpNDPIxIK0n3CTv?=
 =?us-ascii?Q?hZdUCyXbXADz6/uOBsb+VQ41gNKECzUZ/WFt62++SWiqHXEA/1Nk/phX8eiW?=
 =?us-ascii?Q?PDzHtopEa8bJlhfOOBXdw22ccst8YB83ajngyTp5aq0xHCCawvsBGkPDicyC?=
 =?us-ascii?Q?zyXkJN7N6+R4eClKB8X74HFEtXDN/4kGC9XpQyFN6SzCAAV5UTOBi5bIhVor?=
 =?us-ascii?Q?MTnfcglNkV2szs5iDveCrrAyDhbH5ovfZKjRN10S2mOFMizhAUxEayrMyLcs?=
 =?us-ascii?Q?iPOchHl0QV2cETw09hBqLwZdaGC3TWRUA0lXFQrb3PMuuE5gZNjN/rK5RShC?=
 =?us-ascii?Q?uUnDEE19fPh+WGlPcjDFIb4TojgX3RR8RURI3d7wmoev+G8Z/DookKaGPd4H?=
 =?us-ascii?Q?Sg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 904b3dc3-2479-46d2-c126-08dc6ba5227b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2024 19:13:37.5184 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1LdcPP6TBZ1JqYz/VNTi4zO8kDPCSjmv7MjfNKJTeff+ZAU+2SmskQ0T/t8ITznH/rYYahzeXIcoGR6TU0CNUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7922
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

GuC reset status is not reliable for this purpose and it is
once in a while ending up in a situation of D3Cold, where
power_reset is false and without the proper memory restoration
the GuC reload and Display will fail to come back from D3Cold.

So, let's do a full restoration of everything if we have a risk
of losing power, without further optimizations.

v2: also remove the gut_in_reset function (Anshuman)

Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |  3 ---
 drivers/gpu/drm/xe/xe_guc.c          | 27 ---------------------------
 drivers/gpu/drm/xe/xe_guc.h          |  1 -
 drivers/gpu/drm/xe/xe_pm.c           | 12 ++----------
 4 files changed, 2 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 0f68c55ea405..863ba49fedea 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -427,9 +427,6 @@ struct xe_device {
 		/** @d3cold.allowed: Indicates if d3cold is a valid device state */
 		bool allowed;
 
-		/** @d3cold.power_lost: Indicates if card has really lost power. */
-		bool power_lost;
-
 		/**
 		 * @d3cold.vram_threshold:
 		 *
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 0c9938e0ab8c..7860b720a99c 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -938,30 +938,3 @@ void xe_guc_print_info(struct xe_guc *guc, struct drm_printer *p)
 	xe_guc_ct_print(&guc->ct, p, false);
 	xe_guc_submit_print(guc, p);
 }
-
-/**
- * xe_guc_in_reset() - Detect if GuC MIA is in reset.
- * @guc: The GuC object
- *
- * This function detects runtime resume from d3cold by leveraging
- * GUC_STATUS, GUC doesn't get reset during d3hot,
- * it strictly to be called from RPM resume handler.
- *
- * Return: true if failed to get forcewake or GuC MIA is in Reset,
- * otherwise false.
- */
-bool xe_guc_in_reset(struct xe_guc *guc)
-{
-	struct xe_gt *gt = guc_to_gt(guc);
-	u32 status;
-	int err;
-
-	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (err)
-		return true;
-
-	status = xe_mmio_read32(gt, GUC_STATUS);
-	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
-
-	return  status & GS_MIA_IN_RESET;
-}
diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
index a3c92b74a3d5..af59c9545753 100644
--- a/drivers/gpu/drm/xe/xe_guc.h
+++ b/drivers/gpu/drm/xe/xe_guc.h
@@ -37,7 +37,6 @@ void xe_guc_reset_wait(struct xe_guc *guc);
 void xe_guc_stop_prepare(struct xe_guc *guc);
 void xe_guc_stop(struct xe_guc *guc);
 int xe_guc_start(struct xe_guc *guc);
-bool xe_guc_in_reset(struct xe_guc *guc);
 
 static inline u16 xe_engine_class_to_guc_class(enum xe_engine_class class)
 {
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 8500dc93f695..fa099a8981e7 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -404,15 +404,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 
 	lock_map_acquire(&xe_pm_runtime_lockdep_map);
 
-	/*
-	 * It can be possible that xe has allowed d3cold but other pcie devices
-	 * in gfx card soc would have blocked d3cold, therefore card has not
-	 * really lost power. Detecting primary Gt power is sufficient.
-	 */
-	gt = xe_device_get_gt(xe, 0);
-	xe->d3cold.power_lost = xe_guc_in_reset(&gt->uc.guc);
-
-	if (xe->d3cold.allowed && xe->d3cold.power_lost) {
+	if (xe->d3cold.allowed) {
 		err = xe_pcode_ready(xe, true);
 		if (err)
 			goto out;
@@ -433,7 +425,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 	for_each_gt(gt, xe, id)
 		xe_gt_resume(gt);
 
-	if (xe->d3cold.allowed && xe->d3cold.power_lost) {
+	if (xe->d3cold.allowed) {
 		xe_display_pm_resume(xe, true);
 		err = xe_bo_restore_user(xe);
 		if (err)
-- 
2.44.0

