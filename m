Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95C77CA5FFD
	for <intel-xe@archiver.kernel.org>; Mon,  5 Oct 2026 09:31:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44B0F10EC55;
	Mon,  5 Oct 2026 09:31:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bVplgDNB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D314810EC55
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Oct 2026 09:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791192686; x=1822728686;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=EcWI7bBwnWsd4qrVij3rttyipBkyCokeEXofK5/MUVs=;
 b=bVplgDNBBjmHZW/PjDV26o4z20565vkwL4HxPAamWbYpKumQPCwoPyIj
 pCVPkgEL9fdBLJQRJd3SukgbwmiefXdUXoQ1W3jylrDzsB7+EdiEyKrCF
 6sqWJ+z8I+uZZmgm3jPr/Y84OjcH++UfG70J2tzLF1hVp56FIPT1Bv+9X
 1F0xkNOy6VUQK1B0KV9XqtppzQieCGqAIROmIuu+w67oHoFI69tjOLGMU
 ufbcbtAv8sCCY665aJlCnjNe4IONnCtULRpZBnArJMu4hKWln4qrIaXbJ
 RjRmi9CRgG9o7cGHEZcgcyYODCe5ga1Dq8BZyxGuEAL/PKSzd1oyoTcBS Q==;
X-CSE-ConnectionGUID: yAY45OuQQ6ayFsbgnKUOjg==
X-CSE-MsgGUID: tnpIrWvRRA6W4wHDkEl7mQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="90916227"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; d="scan'208";a="90916227"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 02:31:01 -0700
X-CSE-ConnectionGUID: LcihgtA6RLCQl+DpTUEO2A==
X-CSE-MsgGUID: +LnAlpA2QoeaJS14lN2NHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; d="scan'208";a="284852610"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 02:31:00 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 5 Oct 2026 02:31:00 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 5 Oct 2026 02:31:00 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.15)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 5 Oct 2026 02:30:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mHGSthluhQnSK0WIAuJ/tQbxbKXnPWfiAoTtc1DFb9RZ+s+rkikNPRL+6diEsHIwb1jurwB9L3G2Ph3RhcIfMpFlypoTtMpwlclKRiPzjYbmZfGVXCGpCJnI49dL9aJZPZq5BPy2p5cCTWtynyvGxIuG/yECXEGS/wUvWGNUQu+EkuXgvUV3aVlVWoUKhKP9GhY0xIY1nA9vwJyDFIUPA1RaFt4qPhi9ATJGDiPophQqcMtq7+GHgQVJXlGOoPrSir534nk1pSbCrFsu4knXNeOeyCM6+JwGsORrZhpW6AHWS3lgTS1OOVfa0/swFPysus/gZbsu4iz54nWGNQZDhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ryIyBpct56Lba/brwzrzLlIn2TOsvDorlobjdI4K9MQ=;
 b=IBfYkOUOV3n1guOh78PT7899L0GaBrfbXlWzrK8uuusR5geJp14Axye/1mpRMF2SPBAHc3ejb7n5FmmaTFfLwBRXhEC/Xzyx6Axl30J8FpnwXli+ZKn/oCutQen19nXVewIC6uDb0ndjIcYY5CEG9R7vmUqpPrySQ+VlnK9VJCSjgVjl8X+PWE2fbq2ONIAFi3v2Kx07IsBKloup8cU2qOUVlt4hlUjQQfIijzPpQTbcEK5ryjnXejkz63WmIlLMtckpSNbX0Y/OuPhjTpMcd+TwdxBdBB40s+KupaSP783ATrqBW0ENu6Mjp8qiLY7SUdik21wrlgDCCAAOOrOvRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by SA3PR11MB662844.namprd11.prod.outlook.com (2603:10b6:806:538::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Mon, 5 Oct
 2026 09:30:58 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0451.022; Mon, 5 Oct 2026
 09:30:58 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v2 5/7] drm/xe/vram: Allow splitting a region into pools
Date: Mon, 5 Oct 2026 11:30:19 +0200
Message-ID: <20261005093021.3741599-6-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261005093021.3741599-1-piotr.piorkowski@intel.com>
References: <20261005093021.3741599-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TL2P290CA0015.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:2::18) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|SA3PR11MB662844:EE_
X-MS-Office365-Filtering-Correlation-Id: 18bd1e61-acab-4616-e1ca-08df22c35cd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|10067099003|56012099006|5023799004|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: TqJvSyMyWb4SRj/yF0pW72koObzZVb/7APAiMznghVOUNl3JYrO3f3KoAT8C3blowuYzUj626j65FhZQAHpd2ZdoeDL3enDHjkCKlnC6Q3turndBlx7/wz3oCI2i0Le17tGMIz4YVdQ/xqiJUfgo69cSbqAckC718hhV6PSEpDk5zMTyECHYX2perFAtdkxaqbqvRE5HfGaDZbguQ/FxT3tXGC08uF4EihQNeFCfTrm1Hz4RtxxjHQEANcnEVUeKP3U8KRT/ktH4fOHCpBEpA4sjE3/gYDmeY8BMDttlH9xjH+P8wFMvumfoWb9Bq0bbNLiERBztaSX58BEeqVCqUXRzWHMRBDjxRzrJvFabnxuTTmPZBimZMWG2imdpX7YwDsI+fyWTBtpc0nGrS/xAIERcBTuhNG0XrBo2/5UZjRYeR8iGikAsXyYqV8O4XrUKHiCutRf1VOEWD4VZAv1+vSETvRdlErR+KKyWhGYbML49sJ5Uurk3KjmGUIUsh0E61zSz5iCavNnYG+g/6LfvKwmhQ4hsM62osrquZ4bxuEdRrGNofUCl/to7o+SdhLliSs1tc4ajdrV73o1PvmzhrsH9EFqIRgRK1nSXDDx+oY2+bp2GVvGpZFmZEOu92wwTlTDTe4k8holdBaT1RJFuUY7WWwrFonrJ3rX9K2upJyQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(10067099003)(56012099006)(5023799004)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFdlZ1I0dkJwa015RjNESHdEdHBlZWNSa3BoV0xwNnYrcjJIdWJGeG5ZdE9K?=
 =?utf-8?B?LzhlSEE4MmV6ZGJaa2NycENaQm9yQU5KK2gwczNkUUFtTU9hNU1ZeDdVKzgv?=
 =?utf-8?B?d0ZsMjNsTzB2dTQySGNVNUtvdUJSeU5NSzdrZWtjTjMzSEM0a0hGY1hmZFZH?=
 =?utf-8?B?NFRtdERhUXpuR1FuamN3d09tMkhiLzFJSmtITC80a3MxcmNZemZxTVNwaHVo?=
 =?utf-8?B?dnRnQktrWmJsU3pQVFJVK3hOempuRXpRTXU3QkxjWXUxdC9pakpQZXV0R1Ex?=
 =?utf-8?B?eWtwdmRTMm41RTVsd3JCVThDdDZkZHhQYkVoaVR1dmxEV2xlWVg5eXRRYTgz?=
 =?utf-8?B?emdCQlAzRFZCSUtEZGNGRHlVWXhiMndsMjB5WU9mQ1VQUjA1OUhvelFEWmJT?=
 =?utf-8?B?TEF3cXdCZzQyeEZENUpJVHltWm1TTmVxQmgzMWJhb1hDMk1yOE81Q2hxakVV?=
 =?utf-8?B?aC9NZU51MUhtdmZGTmRwZEkvTWpUTFBmQ0dlTTVlTklBQmtJTGhJYUZCSkJH?=
 =?utf-8?B?OFNGUkRXRU1jcGZNYU1OVUlKa21hWElscE1iei9QUWxwZUtaSE9jYnR0aXlz?=
 =?utf-8?B?L1VXOS9NSWJEYVVtSXpudG9aUk9UTjJBR0swSE5EemthdVJ2Rkc1TkpoV1A2?=
 =?utf-8?B?NEQxZ2pFSDVPcGVHQnRYNEswdE5tV0ltYVJ5K1JLRHR0MzNaR3pRMExvUlNW?=
 =?utf-8?B?NTdBUzhxTWtYMlliMFA3QUMxQm45K1h5ck4vVm5sMTNLLzkyRStZbjVzOXNs?=
 =?utf-8?B?a0FRcHJ5Z0tlV3VEOFBuL1JTbWJxYUVkaGFDSFF3eCtsak1GRHcwRjBXZGFB?=
 =?utf-8?B?ek9CaWE1YThJMDRhbVFjaldQWXhpTkQ3T296NW1KODhZZmJBWityTXpKOW5J?=
 =?utf-8?B?YXlMcnArOFJ3amZyWXdWV2VHV3B0ODhnSjNsTjRHMzBiMFJGQlcvMFZhVEcw?=
 =?utf-8?B?S0JIZXNqWFN4SUxrTk4wUmRaUnc2N2V4WjhyeDBRdlJjekl6VVdWcDd1emNN?=
 =?utf-8?B?WEk1K1ZXeDJjVDJzYTdTKzVVTDhOczVKdVM4RGZldVh5M015RVVwaUpOTTY3?=
 =?utf-8?B?MUpjSC9Ld29DUlEvSHBwdlRrSi9PV3NJbEtOaHhLVGpUaW1OU2x6bWdEQ2Jn?=
 =?utf-8?B?S0lHQ3pTVFE5NzB0WFFDT0NPVHdQeEFaTE5FaE83U0dxN2UyQ0orVk9zMHJH?=
 =?utf-8?B?b2NSTjZIRUJ1VTZPa1pXdkEzb3NaNzVTVmhLQUJyYlpNTTZhOHRkSVNCMVM5?=
 =?utf-8?B?QlFicUVGZmFsUGUwSzBhWURzN2NTWEkwZGhIRXZEYml6TVpkdldnUU1tV3lJ?=
 =?utf-8?B?dFl1WXdjTFRjbGM4Q2doUTVqVUhvR2w3bGlpdGV1UVoxY09Kem9tSWU3QmtV?=
 =?utf-8?B?S0J0c2w1eGVYcmJkQUZpdnI1Z0ozeXJnQ3lRTHJzNHVmTXpzckx3WjdtVWh6?=
 =?utf-8?B?ajY2dDdWWWp3Mi90MzJhMXN0U0g0WlVsaWp5YmpreDNvK1oyamRRZzRZakI2?=
 =?utf-8?B?K0dzcWoyRGpldVNjeTJ3Rk94ek5QZkN3eU4yKzZtV2pqcEtmc2xBK1pYY3I5?=
 =?utf-8?B?cHozTVFzTFpYcDE2bnBsU2tZVkJEc1djRmt0d1pjSkpNZU13OGttejE2RzRY?=
 =?utf-8?B?dmY0L2RGckFaR0d2U0ZkSEhrUmx5TTRMOXNIbU9XUE1Kek9YRWNoREdETC82?=
 =?utf-8?B?eFQ2TkMwa0VhWDg2bHNxbG1CRHdtazFaZHlzQkFVOE5OSUxLVmczS0xERCs0?=
 =?utf-8?B?UGIyeFhXM21rK2xicHk5MnJaSUJ5V0l0YzZUMUFsWnpsMlhsSWVqek5WUEZk?=
 =?utf-8?B?TFZzSHlOSTEwUXFZVDdINkVhOTFqSzJOQzkzMG54SE9xNVR3WmQxbkxFNUJI?=
 =?utf-8?B?RnducmI4eXZmTUV2Nk9sSmp5bmNYOFcrVGNGM0FZMXNaeTFQaE1EZ0RHUE54?=
 =?utf-8?B?L3ZxZU9tVythNjF4bDNscWdXQmdhenJLUDU0UWpiY2l0c0VmaDduYVY1dEsw?=
 =?utf-8?B?LzE2QnJGWlArYWcyL3hZcWtETFN2RzBnak1Uekhla3FMNDQ1amZWNnFjaGdN?=
 =?utf-8?B?cS9BOUxXTXBJSlR2SmJYQUlLTkcySEtOeStLVC85Y3ZoeXBtblJpNVN4OTVv?=
 =?utf-8?B?R04rSlRKMVN5R09GZ2J5bi9Ic0VseHhxVWp3cGNGWFdsd2xiUWV6bm1MOGs4?=
 =?utf-8?B?V0UxU1JlV2o0bGlqdlpaaEtWd25qTHMrMEpyMEVaR04rVm5ScW9KV2pkR1d2?=
 =?utf-8?B?ZytrMlhweEJqalRwdVo0dkY1SUEwSGdJVXRxU09PMS96YVFhK21QNVh2NURS?=
 =?utf-8?B?WC9wMTVKdmY3ZXRXNHJqcnhyV1dJS0tGWUw2TEJYVmR1L1YrVXk5dmNFdDE3?=
 =?utf-8?Q?2tyJMUUsCKLqM+j0=3D?=
X-Exchange-RoutingPolicyChecked: AHrIUMTyu2bt/fnMEGCCt8WsxAQwwnMkiaCzUHSXB6UdJBYq7KsoChQi5sjMYc8KQuC7X+ONWQoqlcXk4xewYcEmtH12QmO32uXIq/AahWDEYhFJI47hXKnV+wE4pYSUyEkWbN3XtsLFzGleAbsaEraEvKGBMox+yCdF7c3U+q/sFOLawkVXrj725ThWXxn2cJ9D2/GV0cEcJn9mWReGPRtGSKn8g255lovIlit1ltsieAVBjX/TGX3W/NBgJJicrKfKVyhakquImB7zXVkzFZ7cHrhmTWlHskZdSoiJ4P29yqlE5QT1VOA0cMW/fqth7NKc5SBS4ZSaXVrukSjEKQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 18bd1e61-acab-4616-e1ca-08df22c35cd4
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 09:30:58.4107 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WlI4gyT5jipFNty8mQRJxty/hMtKXY44DoagGLUP9/tpcw3e3DyupyTCXHF1l6v3navPSPukR1Gk6LZFqDJAjzyMrfZiCShH4AEuXxciYnc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB662844
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

Add xe_vram_pool_create(), which carves a pool with a dedicated purpose
out of the low addresses of a region and shrinks the default pool
accordingly. This is the building block for reserving a range of a
tile's VRAM exclusively for a given purpose, e.g. the lowest chunk for
kernel allocations. Placement of such a pool is narrowed to the page
range it covers, and the VRAM manager backs it with a buddy allocator
of its own.

BO placement resolves pools through the tile, so creating a pool does not
by itself redirect any allocation, the caller has to publish the new pool
in the tile.

Nothing creates a second pool yet, so there is still no functional
change.

Assisted-by: Claude Opus 5.5
Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/xe_vram.c | 88 ++++++++++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_vram.h |  2 +
 2 files changed, 87 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index ec95b53bc53b1..1df4f2514afc0 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -41,6 +41,18 @@ static const char *stringify_vram_binding(enum xe_vram_binding binding)
 	return "Unknown";
 }
 
+static const char *stringify_vram_pool_purpose(enum xe_vram_pool_purpose purpose)
+{
+	switch (purpose) {
+	case XE_VRAM_POOL_GENERAL:
+		return "General";
+	case XE_VRAM_POOL_KERNEL:
+		return "Kernel";
+	}
+
+	return "Unknown";
+}
+
 static bool resource_is_valid(struct pci_dev *pdev, int bar)
 {
 	if (!pci_resource_flags(pdev, bar))
@@ -297,7 +309,8 @@ struct xe_vram_pool *xe_vram_region_default_pool(struct xe_vram_region *vram)
  * xe_vram_tile_alloc_kernel - Initialize the kernel VRAM pool of a tile
  * @tile: the &xe_tile, with its general purpose VRAM pool already allocated
  *
- * Kernel allocations use the general-purpose pool by default.
+ * Kernel allocations use the general-purpose pool by default. A separate
+ * kernel-only pool can be created explicitly with xe_vram_pool_create().
  *
  * Return: 0 on success, negative error code on failure.
  */
@@ -358,19 +371,88 @@ static int vram_region_init(struct xe_device *xe, struct xe_vram_region *vram,
 	vram->dpa_base = lmem_bar->dpa_base + offset;
 	vram->usable_size = usable_size;
 
+	print_vram_region_info(xe, vram);
+
 	/* The device aggregate only reports sizes, nothing is allocated from it */
 	if (vram->binding != XE_VRAM_BINDING_DEVICE) {
 		/* Until split, partitions[0] spans the whole usable range */
 		vram->partitions[0].offset = 0;
 		vram->partitions[0].size = usable_size;
 		vram->num_partitions = 1;
+		drm_info(&xe->drm,
+			 "Created %s[%u] VRAM pool[%u]: purpose=%s offset=0x%llx size=0x%llx\n",
+			 stringify_vram_binding(vram->binding), vram->id, 0,
+			 stringify_vram_pool_purpose(vram->partitions[0].purpose),
+			 vram->partitions[0].offset, vram->partitions[0].size);
 	}
 
-	print_vram_region_info(xe, vram);
-
 	return 0;
 }
 
+/**
+ * xe_vram_pool_create - Add a pool to a VRAM region
+ * @vram: the VRAM region
+ * @purpose: the purpose served by the new pool
+ * @size: the size of the new pool
+ *
+ * Add a pool at the bottom of @vram and shrink the default pool accordingly.
+ * Existing non-default pools stay at the bottom in creation order. All pools
+ * share the region, the TTM manager and the placement, while the VRAM manager
+ * backs each of them with a buddy allocator of its own.
+ *
+ * The bottom of a region is also where its CPU visible window starts, so on
+ * a small BAR device the new pool takes CPU visible memory away from the
+ * default pool.
+ *
+ * Creating a pool does not make allocations use it. BO placement resolves
+ * pools through the tile, so the caller has to publish the new pool there,
+ * e.g. in &xe_tile.mem.kernel_vram for a kernel-only pool.
+ *
+ * Return: the new pool, or NULL if the pool cannot be created, in particular
+ * once the TTM manager of @vram is initialized.
+ */
+struct xe_vram_pool *xe_vram_pool_create(struct xe_vram_region *vram,
+					 enum xe_vram_pool_purpose purpose, u64 size)
+{
+	struct xe_device *xe = vram->xe;
+	struct xe_vram_pool *pool;
+	u64 offset;
+
+	/* Splitting is only safe while no memory has been handed out yet */
+	if (ttm_resource_manager_used(&vram->ttm.manager))
+		return NULL;
+
+	/* A region without partitions, e.g. the device aggregate, cannot split */
+	if (!vram->num_partitions ||
+	    vram->num_partitions >= XE_VRAM_MAX_PARTITIONS)
+		return NULL;
+
+	if (!size || !IS_ALIGNED(size, XE_TTM_VRAM_MGR_PART_ALIGN))
+		return NULL;
+
+	if (size >= vram->partitions[0].size)
+		return NULL;
+
+	offset = vram->partitions[0].offset;
+	pool = &vram->partitions[vram->num_partitions];
+	*pool = (struct xe_vram_pool) {
+		.region = vram,
+		.offset = offset,
+		.size = size,
+		.purpose = purpose,
+	};
+	vram->partitions[0].offset += size;
+	vram->partitions[0].size -= size;
+	vram->num_partitions++;
+	drm_info(&xe->drm,
+		 "Created %s[%u] VRAM pool[%u]: purpose=%s offset=0x%llx size=0x%llx\n",
+		 stringify_vram_binding(vram->binding), vram->id,
+		 vram->num_partitions - 1,
+		 stringify_vram_pool_purpose(pool->purpose), pool->offset, pool->size);
+
+	return pool;
+}
+
 /**
  * xe_vram_pool_place - Fill in the TTM placement of a pool
  * @pool: the VRAM pool to place in
diff --git a/drivers/gpu/drm/xe/xe_vram.h b/drivers/gpu/drm/xe/xe_vram.h
index 184850f4ed188..c45e4934a90c6 100644
--- a/drivers/gpu/drm/xe/xe_vram.h
+++ b/drivers/gpu/drm/xe/xe_vram.h
@@ -21,6 +21,8 @@ int xe_vram_probe(struct xe_device *xe);
 struct xe_vram_region *xe_vram_region_alloc_device(struct xe_device *xe);
 struct xe_vram_region *xe_vram_region_alloc_tile(struct xe_device *xe, u8 id);
 struct xe_vram_pool *xe_vram_region_default_pool(struct xe_vram_region *vram);
+struct xe_vram_pool *xe_vram_pool_create(struct xe_vram_region *vram,
+					 enum xe_vram_pool_purpose purpose, u64 size);
 int xe_vram_tile_alloc_kernel(struct xe_tile *tile);
 
 void xe_vram_pool_place(const struct xe_vram_pool *pool, struct ttm_place *place);
-- 
2.34.1

