Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0624C83F09
	for <intel-xe@archiver.kernel.org>; Mon,  7 Jul 2025 03:30:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E4FA10E3FA;
	Mon,  7 Jul 2025 03:30:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UFDr+EZY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02C7E10E3F1
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Jul 2025 03:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751859048; x=1783395048;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=q24gqdwk1qZG8vRDh1FV0gtTguV7IBY0OloplWacl/I=;
 b=UFDr+EZYset+P9oBpVvAghDAmPWTWyjNm+EjLMkmZ3y1JJoh19KBySem
 133Wc4Flexe1nmfmbdmeq6h93K8jyN2vI7Qdz6XXnd8eMzJvI78C4ks/J
 ujeB+1RJiLPgewj8tykhd3eYte0POM2rc5HRaY7m2/BA/L1wM1BSKLN3c
 iRZ9BM7xAtEwxhdsYdUNmstPJ1ZDdCuFPYdSKzPHDFQgpQ2PkARDWFywH
 IB/VZvxtU+KOqMBJkBWPqihMyT2o4kWC9vIE+krXZsKML8O7pTWbyR3U+
 vDqXCQ3Aox5cIV4DMZdrFd/XM89FF2qTLnPJhf9KDZlOQdlrd5bXAh8qK g==;
X-CSE-ConnectionGUID: znYg6YBuSwGKtUuWeUMr4A==
X-CSE-MsgGUID: MA/017ulRPCNSUpaLkdSGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="53996938"
X-IronPort-AV: E=Sophos;i="6.16,293,1744095600"; d="scan'208";a="53996938"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2025 20:30:48 -0700
X-CSE-ConnectionGUID: Yn4XsjqNR7CuiaXnU/75Iw==
X-CSE-MsgGUID: WXzLzQXjSFCpCjkmGcNWpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,293,1744095600"; d="scan'208";a="159123976"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2025 20:30:47 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 6 Jul 2025 20:30:47 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Sun, 6 Jul 2025 20:30:46 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.61)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 6 Jul 2025 20:30:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=okq1gOmsqFf21eN5jHUCw96cmJf24Kw67T8IByFmgr1RJB+cOSpak6QXwC0TiL/4rcR72WHeJCfGZkhX+48q+Tt1RbRmlNRi9wVlxP+XFb+KoC5PZS8abkvs83yuqjTs75gMqbRIDbaaUIfn7X/td0xXXU/4zraDdLLQKXmUQjcyFktpDvy6NCLBrzKRytApQwrOaC3Mh/3Hmq9CLQjzAlP6m2pVMGJjbYzakLqmA3I9GLJ7ddQNrqE6UyiSpULTvFFuzMrJIUMrRvW8vpuKOVjt6XgzMx5folZEX1yFQPAhFWD9ettfVoHyVQW9xN2r8UGj9qLg02WV9+gD9jKe+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hJEOdw0a4xbY1HIJJaCae0sysPwkD2rtj+v2iZ8Xjuk=;
 b=fK/58BmjKWdLcGFSH6CNqohALwgI/SmcbDP1h23RNjP2R1g71q6heqxOCg3mWmN7a0qJN5uBAFuyzk0KMVItHU6eeFLxWBuwe3DwdsA/xhk4nL3v5lVrBAIcPslv/tCrr1hvlbG9BKtgBrGMrse+CDJU7daOPGFEVPOU/aUXzjnzWIrGoQaX5umqMn2sQVVXqLU81EC12SzVLRaFgTgDFVyUD68jiODAPlocV3v8xq0Ih0wvkbHvyUO6rQKT/9C5qKsMTxpJ/pC0OUF1CKACubPcIwl9UlZS3jL6x6odVXYl3pgVafjDIs3B6AxHIzY5hnszuzNUHEOpxc33UAbhTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB7110.namprd11.prod.outlook.com (2603:10b6:806:2b3::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Mon, 7 Jul
 2025 03:30:16 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8857.022; Mon, 7 Jul 2025
 03:30:16 +0000
Date: Sun, 6 Jul 2025 22:30:11 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>, 
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH 2/7] drm/xe: Count dwords before allocating
Message-ID: <kt6owi62zxtgertnfrrrlb5tc7wdcxw7rj6y6jjdifvzeyraov@zvywv2qd4q3p>
References: <20250703-lrc-refactors-v1-0-6aa22f174041@intel.com>
 <20250703-lrc-refactors-v1-2-6aa22f174041@intel.com>
 <b3bc6a5b-c0c0-4fea-9e43-4fec14eeb317@igalia.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <b3bc6a5b-c0c0-4fea-9e43-4fec14eeb317@igalia.com>
X-ClientProxiedBy: BY3PR10CA0005.namprd10.prod.outlook.com
 (2603:10b6:a03:255::10) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB7110:EE_
X-MS-Office365-Filtering-Correlation-Id: 676541db-ab33-4bcb-ead5-08ddbd069766
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6xt7w0LPcnp9Q3ZGmTzLB9HdMbk2aDOdFSy9XKH/pU12hwIOqQRDxGIIUv4B?=
 =?us-ascii?Q?5n4sboMiiCXpd4qNBWaNectD0GNZbxKLfDOk+i8PmbiNAU1V5F80R0TzT3j8?=
 =?us-ascii?Q?Fvc2O7g1l+8wtzpkbLEQmT6CyyvfYjGDaiCk1YwJqE5bUQkMih7oRFMr2AbO?=
 =?us-ascii?Q?vd0JCw40E3Oria+xxZ46ayJ9Dw4QKGQP2zFED/EI2qEnSHJi63NNasZkAuBL?=
 =?us-ascii?Q?m7u3+FpCSuCoAnYgDjCbCdxGddqVxKO2izzd5j2J3LZLfRC4jkLSoO8lX8eg?=
 =?us-ascii?Q?NyzcBCPDohMXTy78EvfC88z8px5bu6A3PY2Nk4XF67dqQs3utE+EOf+ku0K+?=
 =?us-ascii?Q?kH9XPGGtMbWrS14dauikM51f0JJV1Lop0BoAQ8PsoI2zChY9w4fOdnFub4qC?=
 =?us-ascii?Q?q5YsYJLYXizb22Qb9jjSJvdF/lFuL9moBRFWv27bpmrgxpKSJADpIIUI2ZZB?=
 =?us-ascii?Q?vnLccEuG0j/CRoQ2cKphrIiBz0tnQm8TAQW9UzVjMVhuTtgIXtPxFl/eVucO?=
 =?us-ascii?Q?/l7wI15ziGU/Orw/UrNwJpvJOPbaYkd+wDS3Qc1W1g+WanighvI/hVxiylhI?=
 =?us-ascii?Q?0WzWQAK9s9FHUAdgVBwO/OvA8LuBOVywiN/VIEzFBfCdl7MUVqjh8lR2H2sq?=
 =?us-ascii?Q?pG/aUGGkMvhLJV9k69mVsr6P3dV6TR3V7btE+O1Rgsk1ZFnkovHYcbCe/4X8?=
 =?us-ascii?Q?/Fk2RTnsnF13EHbUJJ8DAU0vjthnPSRRGt/PRV0j7/FeoFwF69287bfdxgW6?=
 =?us-ascii?Q?/J3EZgSSjJXubYpnDa5TgHZQITkR2FofTUlbWg5rmk1duWCKtbF9KuzgyG+T?=
 =?us-ascii?Q?Kz4JrypGcxc1UsAeheOb3+ZqnQId01vmDn00kyvrNDWwgEicqt0qhpF8dHcS?=
 =?us-ascii?Q?TLOh180zwldSsXufmu9Jwd835fEcP5mHLOJvbUZhIqrf3kQvmmTzXkZw2TSo?=
 =?us-ascii?Q?lGs9J9NTHIf1rFiJFkSLHB96soKutRRfhyX39pr/m6Jeoj17g/ASXItJSy+j?=
 =?us-ascii?Q?O61xLAfiisc4r/3K1uc6239OWBnyFko7X9UH7Je6HeACUSAf7E8ajzF22z+N?=
 =?us-ascii?Q?NUqBDOMJj7Gz6T+hn7SPyydhARzOD3EBGeByY7uLN9ixhm3lArDFWRO/Y4kS?=
 =?us-ascii?Q?EztFi4vdpc//JHRttbrYA3S6fgBV6WvvG75Vk8eyCISEFzNPdwaAyul1kPyc?=
 =?us-ascii?Q?g04freC79+Dao7jweP0ETFkphv9W+xx39obRozXFO1Z+OrIrN1NWEVpS/amX?=
 =?us-ascii?Q?uC+8SB2zoeB22nv3DtCef1QC9Rv0qIdb0+eZsqzEQFl9tGpTCtssosck0Hbx?=
 =?us-ascii?Q?Zz3GXbtiuTN0LQgvKvBWnjc2DAAyBPKThTWrEur7SDska5WBhsitZeaV02Ej?=
 =?us-ascii?Q?eKRqt3gqbrpBNihqlZhftFNg0n+cCe1+svyNW32JsepxaiVHpKSOWQ+3qRb5?=
 =?us-ascii?Q?BlT0RXZmwh8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZLjBNisRtjAgv66WeUtd8nZ+KS1Jqi0IfWXlJaK8Y0MafNHF5pYvYnkt5gl5?=
 =?us-ascii?Q?0blkYcQ/Qkb/WZCrJzKmNbh7vz7DnoS195JHOGB4YM+viNTlNsKsmgUdm0sX?=
 =?us-ascii?Q?cD4b4EsbyHyjimJNylAxT2B0UXd6Zpsci9tkqnJrVkF5qhJYb2X3e6jJ1bKH?=
 =?us-ascii?Q?+J5hWwx0JVsYUQBF8ld5gRPuaQtO6xW+iUUcG43Yse9KuzdXMWx7nGwA4ilq?=
 =?us-ascii?Q?Py7nTsrAKtuSyEY26p7WVjXesPv+gsZ0MDHGxmLqBfXq+fCxqfeQA8jqxn2I?=
 =?us-ascii?Q?ljRJZuKCZsUVbeZOImHK2hVbetHJK6VksiDeDeOVA3+/vtd8YUYvw+NKfmu5?=
 =?us-ascii?Q?2hwIIsbQxWRq1XNHakeY6oat+d9Pnsw8U/u/QBy5tEC79prePQJOUf0xp6iG?=
 =?us-ascii?Q?R0Rs3Sth7zP4Uvo2w80locCdXgKNENQxqY4cGMiBh4k6Tm89bR9M+lI+BuxE?=
 =?us-ascii?Q?ZUG1sJVSEGgXMGAKD5qUYLEUMtbCuUQwjsdDdLcS8yuFoknHAiOc7vA5OBzO?=
 =?us-ascii?Q?BgIFsJ4l4rP71AVq5w4/O53D2TvWQRDFm3uh69Yht4Hkfq+svDxDr1//a8qV?=
 =?us-ascii?Q?h4Ye6681B+AWX1YhhRm4k+yqEuHb37Bwe9JyMBB4aQufLkqREaiLRA8WO54s?=
 =?us-ascii?Q?/lNzavQeAPtOCvTfLFR+j6j7mmHC1ku5yQdENrWXKKOqlSLEuVHhRwn90mw1?=
 =?us-ascii?Q?smFHl3y86vNT9EMLbqyCoswkHSIYA/fXM2noNUBmVnpPBxzgh7nqauuE43GK?=
 =?us-ascii?Q?Nlwn1fHvodRq/iKRMZfviYGh3Hn/95ecZOOZqMcrn6mK63SE9hKClTTAItXV?=
 =?us-ascii?Q?OxIKG9hiu27FixLy0BcVVrJI8xxNVIGs7BM9cSTMIjxu2BpSEXX/LfcHCvVf?=
 =?us-ascii?Q?ro0YuB3U2/I6rNcatbqwXi598/rQzmAXOFk8bKuHMB7FIyN9jSE7moUO9KkM?=
 =?us-ascii?Q?zmcM72o5wr/AqImA9jP1qciaTH6I6TJhVnTE6RhfVg5YkLOgNdu5hxyI0Cxx?=
 =?us-ascii?Q?Dghy9DSzAFakQbiLth3KEfiS8A1J9iD9fO6a4gmfNUPMjYLSwNqMikj4Uhjp?=
 =?us-ascii?Q?kLva0GaIW4OFgilTmzCe6PV7PbNREwxHPzjXSM8ylB1qnH9rNWf223pa47On?=
 =?us-ascii?Q?cAmcgiEAUJBfDo+Ns0iLEkmduzN3ABKnKwdtRM7TfihhanE7rj/2GoudvC4P?=
 =?us-ascii?Q?resVq02jt9h56Fj2jXF5OAjGqly285UpsQIdUwfHAcBvxc5kdK3Cyu6hOwFk?=
 =?us-ascii?Q?e38bUpGwf5QuLzNmi48o/7cBRsUmON9H2H50BcZq+VaBB0a/dE5ggdE6rPEt?=
 =?us-ascii?Q?a2v+MvmJTEAca0ElL5aE+NKu4ptyx/YUlTKneMTV7YNRxG14LHEsrw8M7tEc?=
 =?us-ascii?Q?9qdJNuKHLuJEriNhf7jMxaK0yE49tb2nRN3WBEtyRxZYAr6OmYQom+vpOxfX?=
 =?us-ascii?Q?zxbpYNl6HGUmz9HAIZJPwZgI908ZKoYsJNtQ3sharyirjiB5Xlv1cDqoBW6x?=
 =?us-ascii?Q?prP6fAfpbofXKeRC8Z08sBNVO9x3q/5zd0PVx6PQw0S5aL8t7AHIn8zcTkrZ?=
 =?us-ascii?Q?4jgLb6c3R8YTLRn1tlDW9CdLx2q9zmlk2BKoRobr9iBD9WU2zBtOA/ZSOkXW?=
 =?us-ascii?Q?jQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 676541db-ab33-4bcb-ead5-08ddbd069766
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 03:30:16.8001 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lom3L4E4AYPXl+s1YOekomJOxwwT7BZzXH+71iktTdVcDEGJFkpxDBP95y8gz+0XTEh0MxEQs0LoUhmzgWYbQk/1lfoXkk83M/N3ZJ9lI6Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7110
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

On Fri, Jul 04, 2025 at 11:20:08AM +0100, Tvrtko Ursulin wrote:
>
>On 03/07/2025 23:41, Lucas De Marchi wrote:
>>The bb allocation in emit_wa_job() is wrong in 2 ways: first it's
>>allocating enough space for the 3DSTATE or hardcoding 4k depending on
>>the engine. In the first case it doesn't account for the WAs and in the
>>former it may not be sufficient. Secondly it's using the size instead of
>>number of dwords, causing the buffer to be 4x bigger than needed.
>>
>>While it's unlikely this is causing any real issue, let's calculate the
>>needed space and allocate just enough.
>>
>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>---
>>  drivers/gpu/drm/xe/xe_gt.c | 33 +++++++++++++++++++++------------
>>  1 file changed, 21 insertions(+), 12 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>>index d397df056e4cd..a926f560f2e36 100644
>>--- a/drivers/gpu/drm/xe/xe_gt.c
>>+++ b/drivers/gpu/drm/xe/xe_gt.c
>>@@ -189,16 +189,7 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
>>  	long timeout;
>>  	int count_rmw = 0;
>>  	int count = 0;
>>-
>>-	if (q->hwe->class == XE_ENGINE_CLASS_RENDER)
>>-		/* Big enough to emit all of the context's 3DSTATE */
>>-		bb = xe_bb_new(gt, xe_gt_lrc_size(gt, q->hwe->class), false);
>>-	else
>>-		/* Just pick a large BB size */
>>-		bb = xe_bb_new(gt, SZ_4K, false);
>>-
>>-	if (IS_ERR(bb))
>>-		return PTR_ERR(bb);
>>+	size_t bb_len;
>>  	/* count RMW registers as those will be handled separately */
>>  	xa_for_each(&sr->xa, idx, entry) {
>>@@ -211,8 +202,26 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
>>  	if (count || count_rmw)
>>  		xe_gt_dbg(gt, "LRC WA %s save-restore batch\n", sr->name);
>>+	bb_len = count * 2;
>
>Shouldn't this be count * 2 + 1 ?

right, but then we also need a `if (count)`, like we have for count_rmw.

>
>>+	if (count_rmw)
>>+		bb_len += count_rmw * 20 + 7;
>
>1)
>This one is good. For both hardcoded value are a bit fragile 
>maintenance wise but it can be improved later.
>
>2)
>Until now bb_len is in dwords, but below it is in bytes, right? In 
>which case here there should be one, at this point exactly:
>
> bb_len *= sizeof(u32);

not at this point exactly... xe_bb_new() arg is number of dwords.
What we are missing is to make sure the size is 4k aligned...

>
>>+
>>+	if (q->hwe->class == XE_ENGINE_CLASS_RENDER)
>>+		/*
>>+		 * Big enough to emit all of the context's 3DSTATE via
>>+		 * xe_lrc_emit_hwe_state_instructions()
>>+		 */
>>+		bb_len += xe_gt_lrc_size(gt, q->hwe->class) / sizeof(u32);
>>+
>>+	/* Make sure accounting offsets downward is also aligned */
>>+	bb_len = ALIGN(bb_len, SZ_4K);
>
>I did not get what you mean by "accounting offsets downward"?

we use e.g. `xe_bo_size(lrc->bo) - 4K` to get the offset to "the last
page" in the buffer. However if the overall size is not a multiple, it
will return a non-aligned value which is not allowed here: the
bb_per_ctx_ptr for example needs to be 4k-aligned.

thanks
Lucas De Marchi

>
>Regards,
>
>Tvrtko
>
>>+
>>+	bb = xe_bb_new(gt, bb_len, false);
>>+	if (IS_ERR(bb))
>>+		return PTR_ERR(bb);
>>+
>>  	if (count) {
>>-		/* emit single LRI with all non RMW regs */
>>+		/* Emit single LRI with all non RMW regs: 2 dw per reg */
>>  		bb->cs[bb->len++] = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(count);
>>@@ -236,7 +245,7 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
>>  	}
>>  	if (count_rmw) {
>>-		/* emit MI_MATH for each RMW reg */
>>+		/* Emit MI_MATH for each RMW reg: 20dw per reg + 7 trailing dw */
>>  		xa_for_each(&sr->xa, idx, entry) {
>>  			if (entry->reg.masked || entry->clr_bits == ~0)
>>
>
