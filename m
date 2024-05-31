Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A13FC25B75
	for <intel-xe@archiver.kernel.org>; Fri, 31 May 2024 16:02:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A746D10E080;
	Fri, 31 May 2024 16:02:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UOaeGz8F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E468110E080
 for <intel-xe@lists.freedesktop.org>; Fri, 31 May 2024 16:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717171334; x=1748707334;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=3jKux2d0sfBNSUA+jAZbRhbJJKqjKAxNuzAyKx/mGFs=;
 b=UOaeGz8F4wgE7gidCWnK5/vLuNNj5hisqkXG+eQRzZL63uzABlhrii0r
 UVTlpwl1n1WaV0UPa982HLHM5Q8ExhioxkwTamNfmg+wCcnWXIlob4PMS
 h88yitNH3Lt3xjwA2YjIJwIhFOMnhO9FrijS6JYCGAUVk2PevXKC8DqLs
 pfxoBcCL2Gh2FO+8b1b6P+mo7NL/XcnB6A0gHekCid2kEK/3wmfSZQ0yy
 WJBYwCMH9XpU7hdc0B767XZj2ye5It2Zpq1R40hztjxi6xx9Rcsrro6lA
 CQ0qV7hZ9Btz95S8fJfq+XjszM1eWi5LBz2ofw1K/vW0oCixuBYjwBSUZ Q==;
X-CSE-ConnectionGUID: cXd4LhJ3SDqApG7yDgU/gA==
X-CSE-MsgGUID: uGr4zBevSAa1tfgIeSfeWQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11089"; a="11840598"
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="11840598"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 09:02:13 -0700
X-CSE-ConnectionGUID: P2RdLGvcRjuyJkHBGFa7eA==
X-CSE-MsgGUID: ummpT8azRziOCS40XseqPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="36219308"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 May 2024 09:02:13 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 31 May 2024 09:02:12 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 31 May 2024 09:02:12 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 31 May 2024 09:02:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PWlwXuIENmBoCrPATCr38QaCtaUXlpIeUQkwvlSYaU1KAZ+dtuwCJMVQsBRbR+/cjAHyNAZ6KpTK1YC68dAM0begnxup0mdDL6QEd98qWVsbl64eg8U5CQPUI0Ytls2JuMyvQqd77U2tVegcSvrMuruJyrbO/4BOUZ2C0eVu//zhtdS0qPR0bMB5cLcqJYLWYZKjLIrHVSf/ETnfh0DH1mzxYwEEwm5nZ/JfcsW05F+mqLo13SPHotfnRjuIrltYKeSdgdSeBW3Birw2tNzcrfG8JuKh0em9IlmY5pnxc6P6nhUua4FKJj+k+UDlX89lINRZMe7zpQ5mX8fWWK4hMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OD1nbdnbA0OELORqL4h+6KLysLr6zSjFON6BIJcKOVo=;
 b=ma5xZu89Lm4Thb+W2Hvu9Ru60HjkBrnyh9LBLbxDLp+02K0QI2Zx6k6RmA+eQudTM1Y7WP2/KxdJ/gF13+dXXhcG/4X5sNW9iDXg6ScGww8+HjNXX5ViWyzF61gtJ7V5xzZykDSGdgLeYjc/2u3tS+moX9xg505q8pAyFv3p8i9Aw/FTmt53ZZ5cUaU90Z6yjBD2+WcxUYystBQXgTAKq88FSMU11pCXp8B3jO89mROeL/HoYNlorBqjcq9OfZYScrpRKjHsqD21hwgwMFApTZBAdondGjdvOE7I99MKL0O7JDxC8JzsAR1CRi21dCBV9PkVuM8U6UjJqnwY0X9YQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA3PR11MB7612.namprd11.prod.outlook.com (2603:10b6:806:31b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Fri, 31 May
 2024 16:02:09 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%4]) with mapi id 15.20.7633.018; Fri, 31 May 2024
 16:02:09 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Paulo Zanoni
 <paulo.r.zanoni@intel.com>, Francois Dugast <francois.dugast@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe: Fix missing runtime outer protection for
 ggtt_remove_node
Date: Fri, 31 May 2024 12:02:05 -0400
Message-ID: <20240531160205.206604-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.45.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR05CA0094.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::35) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA3PR11MB7612:EE_
X-MS-Office365-Filtering-Correlation-Id: 99464bd8-9fa5-43b4-267a-08dc818b06ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Tm5WZVFkbWp6UEVFYzZLTU9OMGVEWXNMRzFzM01wQ25ib2tTV21kWWFML1Jx?=
 =?utf-8?B?R1JrRGRzZTNOdTQrMVYyemllcjVXcEsyejFLZXFsVmN2MFZyWGtHS1JyS3lS?=
 =?utf-8?B?QWtJYTUybXNRNmFwbnZIUXA0ZEN3a3RoTmJiYk1vdS9neGNDNzN6QllobE5E?=
 =?utf-8?B?TFZvd200WXhsclBORFhiL0ZqTEswY0ZwNkpxWS9qc1dqQ05ZdWpMV1pRNGE5?=
 =?utf-8?B?TkFZTmdaUDdtcmdZWTlKdWlRUlc3dzVwVlV5UkR6QlNTYlF5TFRhalZLN2Z2?=
 =?utf-8?B?NzlFVTdjaW8yOFV6ZjdXY0M3enUwNlBWSDBaMzRQWVJrNmZiaER4OEdmN1dP?=
 =?utf-8?B?ZVpCS2hheTkvQW1NL2NUQWJxdkgxVUE0YUFkU0JrSFdrd2lNeXdPU3hNRHJY?=
 =?utf-8?B?TU5ZTG16d2tyUFoyS2E4S1hrK0NNWEo2VFB2ZG5hOERlekZ0TllaUlBGR0l4?=
 =?utf-8?B?WkNjRUhSU1NVQy9mQzlrckZUN2swVVo3K2JIeG1GWXNuQWZLdWFscTAzQjhE?=
 =?utf-8?B?RzFKbVphUDlOdE81ZGZKUkt0Zk42NnFYeXREQW5ZTW52RUo5V0dVSjhrNERm?=
 =?utf-8?B?VlM1WWhzb05TU1BFM0pZTWhJeGY0R3o3cm45Zndad3M1Q1JLN2ZYN3VqTTQ3?=
 =?utf-8?B?NkwwRitsbzVFamtySkxTT0FIb3habmhGcUc2eHFwMFQ0R21zbE5xdnlSRzBo?=
 =?utf-8?B?SjZGWDZJVTUweWRpcENPaFhaQ0kwRStEbVRPZXI3bHhubjQ3NGhwSVNEcHJo?=
 =?utf-8?B?MGpKcGVlNzBoNVppV1k0cXdQY0lHeFU1VzNhczYzekdoRUdESXJOaHpLRENF?=
 =?utf-8?B?b0NDNDVvcnZrQysySW5ySG4za1pMOXNzRThLVjZVdU84aVVzN1VJNjNPcFhz?=
 =?utf-8?B?OEQrZkE0a3BPanJMVGJEcEJTR1JtZmZkYXdFQUlEMVZKY0hncnJuM1d6MTln?=
 =?utf-8?B?TVJzOU1OeWpmNFVNM0dkTTFUZEgwd3hyYlJLMldIMCt1QWRPeWROcExxcTVz?=
 =?utf-8?B?ajVYOHhJT0tXdW5MWGpCRTE1K252dFd2TWNkM20xMlNtaWErNnNOVWZlMVJx?=
 =?utf-8?B?R05STkpGalNkU2JIYkJraUs4a1JCZGpYMmNTUVNpTEI3SWZ0MkJLbUFObllh?=
 =?utf-8?B?ZjlhckNRWTBhbDdoOFRYN0EyTVQrM2tFMUhvUTlNZVNyNmpQZkpGU0x0SEk1?=
 =?utf-8?B?M3hCN1M0QlBjR0ppdXBhajFoTHM4b2pCYnFXQjN0NFRzYVhqOWZENndPMVI2?=
 =?utf-8?B?ZCt3bzRodjFlSStQdzZyb3dJUE9NUWRzRlM1QXNjamlKUVJ1NU9SaDl3WC9F?=
 =?utf-8?B?UDBvRjQrMUh1K3BmcUhpU0dkZStkNXE1UjlhWW04Rnd3WHJxNzZ4Y0ZTWjl1?=
 =?utf-8?B?TzY1U2lqTzVQTTJMRDA0eUY4SkdaSytVUC9qaGNYcytYc3pJa2ZFUDBUcm1O?=
 =?utf-8?B?ajZSYWJLNEN4SVVsbkxDRzZCTVlodXN4QnRjbzZJVDZEMlBySHhsck1BbUhU?=
 =?utf-8?B?OXA0aFJIazB5ZTQ2M2MrYW5weUUzT0FiTlNQZzFROTMrOEdoMkREeENvZGFQ?=
 =?utf-8?B?MkxIOW5ETS9ESDlSbU43VDd5ZWNVcDZ1ZjhNaTBBdnFuZmJtbGZzT0hON1Jw?=
 =?utf-8?B?aGhCUXJPV3FMVjQ1YjF0eXlQbzZucVk5ZWNLZm9LQzVxZ21ra1BTTk54TXVt?=
 =?utf-8?B?YmVDeVgwSUhXRmcrSk03dlgvN3dDMVIyclY3RWt4K3BhT0Y1TFpwK2x3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MmY0VVU0T1c1Vzh1eGN0VW12WG1wV1hCNk5hY1R5cFpNWFVZSW1HUUxlSTZp?=
 =?utf-8?B?WVNQdGEvRHVzVEI3TWpPbzI5aU52K1pNczZjSUNYU2pmWndpRDlBTS9JaEpj?=
 =?utf-8?B?YjhJdHFXOXh6TVJNR3hBU3Zyd3NxUitaTjJoL1ZGdWRVRzNKaGhBNWdzUStO?=
 =?utf-8?B?TUtXcW44bUNNcWtUYTdCNTRGeHVWN1hGN0duVTEzRUVWNTU0OWNiYy9wdk9k?=
 =?utf-8?B?eElSMllBNkxmdW1iWWdXZFZReHlRc2FOVHFCeGtYMGhqeFBzeHQxNDZlSk5R?=
 =?utf-8?B?amZzK0NDWWE1ODJETFFiZ0NkWXpHczNiYW1KNVdMeHYwNTlTRndOSVZ6dXF3?=
 =?utf-8?B?RDZDT2dBK3dKUGV1RFVoL0xzdFF3akZsaC9naDJib3RicmFiYTFNNkRHNmEx?=
 =?utf-8?B?ckJFVkdCc2lmZ1hCR1pjVmdCKzFiWWd1RG9uTnBmS1VoY2JpMzJNR2ZOb2M5?=
 =?utf-8?B?cURPTkV2VzZxSEtpS0taTFRvK3J1MkJsc3NEQnc2Z3FvV2hZN3VxZmVBLzRy?=
 =?utf-8?B?Y2xqMHBvQy82S1VQNkFldTNxZldodk9iVUZJenVEbFRJWFMxdTNQTVJtU3dS?=
 =?utf-8?B?OTlvZzljZmo5NjJJVEw1dVZCQ1JjdUZtQ2FiL0tXZ2dCUTd6dlZtYnNob2xh?=
 =?utf-8?B?ZUZFb2tnOVlQcHd0TWgzVVVzbHJJV3k5QThsek8wRlBKT3RPaUJLcTlqMEpX?=
 =?utf-8?B?Z3BhenB4ZkI3TUpaZ1MwYzBaYXFYYTZWRlIrdExWN21UdzF0WXN2b2RGblU0?=
 =?utf-8?B?dEdIT3d5ZkxSZk55c3hzUmtiTllyem1BQ1VKNXVhWTAyQm9UbTVVTTFBYnRE?=
 =?utf-8?B?SSsrdTBHaDdBS0JnK2lJMmR3YkViZEIxNExLQzMrY0YvTW9OUG84RmVrcFJ5?=
 =?utf-8?B?ejVVWVMyWUdaNkhteC9zai9vZ3d0eER4Y05ZNWRkcFp4UDYyY3p2M1FNZkJt?=
 =?utf-8?B?Z2VUU015c3JsSjlPcG50dmxZZjdWUlZXVGRxQ3VsRXN4UmJLdExPNytRRlFO?=
 =?utf-8?B?eXRtdVBSWmZhbzRYNjRwTzZxNHJtZ1ZUbWJ6YW9WNGVDd2preWExVGJ4cmhL?=
 =?utf-8?B?UVRJZm1uajlvOXRRNmJXdXplUWloNTMyOUk4OXRIUURTT05CL3lGQ2ZWZjkv?=
 =?utf-8?B?SWFFZzB0K0cvdTQ5VmtkM3lvME84c0tPQ2ZFOE1XVGdGaTlvK05DckIxa0kv?=
 =?utf-8?B?ajMzNW5qa0k2UHgyWktuR3B0ZllFaklVVjhIUFNCd3JST0RFcVhmNHRnOS9E?=
 =?utf-8?B?Y0J1SkxWOUJGK3ZoMnBWWmYzcldPNWN5TzVhM3BEd1lYakVUN0Y1SGJCSFQw?=
 =?utf-8?B?TmZ3WHh0dWozd0tCUGlQSkxFZU03ZzhDSzFxZUl4VXQrQXlPWDJQUjkyZERU?=
 =?utf-8?B?d1g2NXMybEJiVHBIeEUzZjdRWGU1ZFhvbWV5cTlkbUo5enJOTFRsRG50ekhN?=
 =?utf-8?B?dVBLSkg0MlBtUXoxaVhrRHlqRXNkNm9WOUFxSXVrSEcreEpPVnJRUjdRa2dl?=
 =?utf-8?B?T1RuK0JjNm5lMFR3Mnlya0k5ZVhCdkR4ZjAwaUFYZ2NNZHVBSGMxK204b2Ji?=
 =?utf-8?B?S21IQUdqdzg2M2hhcEpiSHFnb1V0T0Z5NkwxT09XSXVyS2RrQ2xnUi9SblZw?=
 =?utf-8?B?VG9Pc3pYdkhLYUJhcHhiOEFWZk5SanZ3YlNHWjIwTlBUODExNzZyZy9aMU8x?=
 =?utf-8?B?MjlvZjg4eHlBNmVwVFlUbnJCN2puQ1RETTJQeTJmOC9YcUhwdmZLNmFsOGtn?=
 =?utf-8?B?Z2dQZTBUL281alBNVCs3L3VqeWNva3lOVUtyclNXYmMyREFoOVdxYXdsQ1R4?=
 =?utf-8?B?T1JJVUJDVlkvMjNueEp6MUpZWmQ1ZTFzRkd2SzBVZVA5L21zSjQwS2lUOWFz?=
 =?utf-8?B?OUYyY2x1aVgzdXhKY2hjMXZEZjMxZ0RWUnVJTXUrM2M1TGNlV0tBL2xoYmpq?=
 =?utf-8?B?NjhENVEvdEYvLzQrVHZOVHR6UUxFNUZZSVpMU0FtNys5aHdEZk0vU051Zllv?=
 =?utf-8?B?Z0dTaTVQRnlqTTFvc21SUXhOQkl3YStrUmNOcEpqQlcrWEhFK1pRZ2NEN0Jj?=
 =?utf-8?B?aU1GNW0yYXRuY0RNNEJJQ2V1SW9veVVJQ3k5SFVBS3V0dU54Um14UU5mOG1r?=
 =?utf-8?Q?da+sm68Fm8ES1yjVBqrh2BOna?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 99464bd8-9fa5-43b4-267a-08dc818b06ae
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2024 16:02:09.4294 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n5577KFwDH7nCiQMLG02Z0J/0prOYhzPib4dkpjbUGow7Pa5rUXajwjRrjcLOeM+3v2frhdsSb2cludAL6sCQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7612
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

Defer the ggtt node removal to a thread if runtime_pm is not active.

The ggtt node removal can be called from multiple places, including
places where we cannot protect with outer callers and places we are
within other locks. So, try to grab the runtime reference if the
device is already active, otherwise defer the removal to a separate
thread from where we are sure we can wake the device up.

Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 56 ++++++++++++++++++++++++++++++++----
 1 file changed, 51 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index b01a670fecb8..d63bf1a744b5 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -443,16 +443,14 @@ int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 	return __xe_ggtt_insert_bo_at(ggtt, bo, 0, U64_MAX);
 }
 
-void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
-			 bool invalidate)
+static void ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
+			     bool invalidate)
 {
 	struct xe_device *xe = tile_to_xe(ggtt->tile);
 	bool bound;
 	int idx;
 
 	bound = drm_dev_enter(&xe->drm, &idx);
-	if (bound)
-		xe_pm_runtime_get_noresume(xe);
 
 	mutex_lock(&ggtt->lock);
 	if (bound)
@@ -467,10 +465,58 @@ void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
 	if (invalidate)
 		xe_ggtt_invalidate(ggtt);
 
-	xe_pm_runtime_put(xe);
 	drm_dev_exit(idx);
 }
 
+struct remove_node_work {
+	struct work_struct work;
+	struct xe_ggtt *ggtt;
+	struct drm_mm_node *node;
+	bool invalidate;
+};
+
+static void ggtt_remove_node_work_func(struct work_struct *work)
+{
+	struct remove_node_work *remove_node = container_of(work, struct remove_node_work, work);
+	struct xe_device *xe = tile_to_xe(remove_node->ggtt->tile);
+
+	xe_pm_runtime_get(xe);
+	ggtt_remove_node(remove_node->ggtt, remove_node->node, remove_node->invalidate);
+	xe_pm_runtime_put(xe);
+
+	kfree(remove_node);
+}
+
+static void ggtt_queue_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
+				   bool invalidate)
+{
+	struct remove_node_work *remove_node;
+
+	remove_node = kmalloc(sizeof(*remove_node), GFP_KERNEL);
+	if (!remove_node)
+		return;
+
+	INIT_WORK(&remove_node->work, ggtt_remove_node_work_func);
+	remove_node->ggtt = ggtt;
+	remove_node->node = node;
+	remove_node->invalidate = invalidate;
+
+	queue_work(system_unbound_wq, &remove_node->work);
+}
+
+void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
+			 bool invalidate)
+{
+	struct xe_device *xe = tile_to_xe(ggtt->tile);
+
+	if (xe_pm_runtime_get_if_active(xe)) {
+		ggtt_remove_node(ggtt, node, invalidate);
+		xe_pm_runtime_put(xe);
+	} else {
+		ggtt_queue_remove_node(ggtt, node, invalidate);
+	}
+}
+
 void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 {
 	if (XE_WARN_ON(!bo->ggtt_node.size))
-- 
2.45.1

