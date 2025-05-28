Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A222CC5AE59
	for <intel-xe@archiver.kernel.org>; Wed, 28 May 2025 07:48:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6189510E58D;
	Wed, 28 May 2025 07:48:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AXzXdgKd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CB1310E59B
 for <intel-xe@lists.freedesktop.org>; Wed, 28 May 2025 07:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748418523; x=1779954523;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=pKxtrxHoBYM7wXfawvXEH9mv+l6WgpmUjxomXccosVg=;
 b=AXzXdgKd8mMMVIZUHlO1X3aOEqH0Scamdr0StItw53KC7wVPn4CPC4pH
 U8HjXP9i1IKqRtbXfPntjK9fS9ja2STj4VlY3fTkSqzKB1zAe7bCRRy3E
 FilNnWntTgTCTpQfTDRR1PKUKP+NfkLLFU3YGKD3e0EDE3QJqqB2fFxgS
 riaOrb3P3GDIFKN9x1NPjv3MhExipjqJl3KAewIFb/LUJePa1rwRicWT1
 95SSkSLu+FO9d9lppQWYywjAMbuzftfDhfBu5Vj/IouzA/TbcSKK5X562
 s4t9tz9nIlrX1EfQoFNSTWA8iHbmsv7dfVzNJKqcaKA98yQz4CwXOE39k A==;
X-CSE-ConnectionGUID: mxZFdStLSlmdR1EyMosoAg==
X-CSE-MsgGUID: Y4jJgaIyQpCbU1O1HMBxGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="60688492"
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; d="scan'208";a="60688492"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 00:48:40 -0700
X-CSE-ConnectionGUID: p4zNbo6FQZeIRlesOkUO3Q==
X-CSE-MsgGUID: zgdhT1PcQVq0L61Jg5OClg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; d="scan'208";a="143512011"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 00:48:32 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 28 May 2025 00:48:31 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 28 May 2025 00:48:31 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.61)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 28 May 2025 00:48:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I5DPiQY6QWkfXizksejeObRsu+VeDLfwbUIbT9npZLFcei6sEpjHioQlAzFigDHzYtXTbk6/1Pj0bm50wK5iLJ6Dow03oIItiTnIzXZTNH6G+8S0f22YYofU69xIdxaawITdJMoYxCavaWpp3DMHBBdXDKIzFiDMu5cblhJPGWuN7D7/zVLQk4sXYH9KUGXs9aYL/J6hIs6ns8PeMnCqs5Obrw5SmxUb49xfWfbZSnPD/YC+xKNUL8yWmiX73IIAwq0Y96XuHMNCPie/u6EZgyaAewBmkFKdWq287zPb/JqL83LPY5+P78mxsDhu21DLDATLoTiJwdedY07nX4dcsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v1Sr47FZLyMnW7pQlq9Up0kNCqicNYttHbs4Ne17jRc=;
 b=UZAKVvHGtX7x2iBK6Mw2XqpmR9jvx0/fUB0fYfvbro9rccO5OGYL/UG0jhI0fBVwAIYRiR3inSjy6IZAO2uDCU4MgzmkT6y7gbjeGxU1jxPamGM11UXMsskyxRv+esMuzk9gNLiVrhVFvK6AQe48977s8p1YrnO3OYgfykFs9YqDQzC3UM1045dN+++SslaJ+AFMVosMPOwfWO8bURumaIpa/IYJZu0RINhQvMLV5aZ8aTwmUITsIbbbS35h4DfHGq0KPpbEKoNTYDbHPN2qVajYCUKaG2pwS7rkAEoV6VGjuWZOeNQ6qtyVNqT9NS++M5MUQqslfI0JwuP92B0Mfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by IA0PR11MB7356.namprd11.prod.outlook.com (2603:10b6:208:432::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.22; Wed, 28 May
 2025 07:47:58 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.8769.022; Wed, 28 May 2025
 07:47:58 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Stuart
 Summers" <stuart.summers@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v2 1/2] drm/xe: Use dynamic allocation for tile and device
 VRAM region structures
Date: Wed, 28 May 2025 09:47:42 +0200
Message-ID: <20250528074743.2027563-2-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250528074743.2027563-1-piotr.piorkowski@intel.com>
References: <20250528074743.2027563-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU7P195CA0018.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:10:54d::18) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|IA0PR11MB7356:EE_
X-MS-Office365-Filtering-Correlation-Id: d3aa4442-e478-4859-4d1b-08dd9dbbf695
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b2R3bW5CVG1wbENpUU12TXBlVjc0ZGE4ckxqSGZFTzU0SnFnMk1STkJnNWVH?=
 =?utf-8?B?Wk5KYmR6Ymw4SzQyT3lRYXFZcjNoRHUrM2hLOTVPTnFTeTJhVjQ4am8xUzcr?=
 =?utf-8?B?QnR5S3Y5amdBRlIxZkRMdjJSSXV4N0QwdElQNzRUOStXZTBYYVJHQysyZGhP?=
 =?utf-8?B?Q1Mxbm1BWUxuZ2FEMHlKcUI3bzdGQ3ZDcG9KU3cyOGl2bXorWVRMdEFuQXlX?=
 =?utf-8?B?QmxjdFZwQWt6K0NiMVFEdkk5dXZaZ25BK0RiZm9jcTVxcWV6dGg1NWZ1SERY?=
 =?utf-8?B?clRpclFSYzRldlFJRUk0MVNTanlONTlnMTBJY1E3Z1gwMlg3M20wMTFiNEc4?=
 =?utf-8?B?WG9rOGVkODdqOWsrM3AwaENwOHMzQzg1d0YyZC9iWGpwNUdIa1hTOTU2WHE5?=
 =?utf-8?B?RlZPbElnaUkyVVJ6NEdzbnFxTkNjOEVlRlU3VWM5TWd4dzdxTElvK3ZpZEdZ?=
 =?utf-8?B?UHJ2NDltbUtqWkRqaWdLcTZ0dW10RGNVQk01TXZyRDQ0ZnVON3BBM0x2Q1BC?=
 =?utf-8?B?UDBsR1kzcjdybmc0bmlaU0JHUExNOHRaNFRtakJqMitsN0piTnlQbXE3bnBT?=
 =?utf-8?B?UVBNSTV6UEtVYWlRNklzeGdnZW0xY3dFSDh4RG1qK1h3dldIR2JqKzFNM3pv?=
 =?utf-8?B?NDlWcUVwbnlKdm9lY25EVGh4eUloYlQyS2VGY2g5SzdWSFplamtQUHVaVzdE?=
 =?utf-8?B?V25LODhGZy9kQUJCYkpkYW04RlNUYmtheTliRmMvSXdhOTJMMTBpNmFSdmtT?=
 =?utf-8?B?K3BWNmQ0eit5cUQzemFQT2hlS0FtUWdpSGpLQWR1NHpSeVVlU3BBYVJxSXJr?=
 =?utf-8?B?WGxHNFBKY1BodWNuMk5ZMVU3SWphaU1MdVNWajdneVRxOU4yZGtnYlVOK2to?=
 =?utf-8?B?THNiZ0dQaHEwQ2dUTDNQMmIrRWZxL2hQeFVNSXpzMFJjZjdMVWM5a2JlMjRF?=
 =?utf-8?B?djVldDAxRy9wWTIzZEdvSFFCUlpqNlErQ2duSEhHOERjbCt0dTlnWElQQVIv?=
 =?utf-8?B?SGh1eDgwMDFZVHQ0V00zWXRTNE9lL2JsMkt1SWVKZ05xSFZCZmVoMnVTRzdm?=
 =?utf-8?B?YXFoR1Z0ZWR1Qmt3RGlqUXRzMWkyNEdScWZWRUZkbHdIempUTXQ1S281eHcy?=
 =?utf-8?B?WkIvRVIxSmtyYTBoRzJDTSsxWFlHeXJsL1pieTREWWEvbi83QkR0eDBTaGJR?=
 =?utf-8?B?blkvOXpyamR6TXMrNjBkZjEzSTRSVGl3RFBoNU1lVEIveEFBR1RaUmdLb0FU?=
 =?utf-8?B?Y085U1dKNHNnSStPMGpoVGNNSVA2REtVazB5akVzY200eHdHNTM5WSsrQ0Rp?=
 =?utf-8?B?RCtVbE1LcUdhS2kvdXpadWhoNkdQSmFVMlFTMW14Nm4zZEp4MWJVOEJDTFp3?=
 =?utf-8?B?M3hTakFCWENUV1BwWUxLaFB4b0Zpdk5ITE9ZVGxxczhWd2hCL0NPcUhhaDJa?=
 =?utf-8?B?RkJySW1ZVTl6THFGclZNV3NCczh2UWlsNk1UYkV5bXNRUEw1aDUwc1ZRaHpa?=
 =?utf-8?B?U2tmRm4rUitGTXRKemRLRUZPOEl3UDEySWJpdHFWNE4ra1ZhYVdyenpGdDlP?=
 =?utf-8?B?Q1ZJOWxSU0lZWjRxQXV5Z3FzWTdRck90UUl5WkZ1ZHlDL2VxbEtvM21kT096?=
 =?utf-8?B?bDRHYW9LNTVjWno1MTBMcEZjUzA0YXBIdGNwLzNsVU5tSWpGYndFelNMOEpz?=
 =?utf-8?B?VUdtbEl2R1dBWGhrVVNDTEJNTko1VngvWmcwSlE3b0xHbkFQQVpzaTJ1UUsx?=
 =?utf-8?B?ZllWejBDWk91MkdIanBWMUphbUFpajVBVFJ5REJ2dloxSEhmWjR2UGUyNWRl?=
 =?utf-8?B?SW1ocEZHTXdQL1ZKYnhEbm5Ud05xSDlsZXo0UjE2cGEzbXVxYUhncGNSWURG?=
 =?utf-8?B?WUsvQ1dKeUhWTGJiR0g4V0dSMU8zeHJ4eUxTZmhiczQzVVYrU0hlMlRxVUd6?=
 =?utf-8?Q?mjUjDvsPIZ8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RTl4dWg1eWJtOUwwTEhqWThBYitmay9iWnlRTWdOOC94WTZiZ2NPTmRUb1hG?=
 =?utf-8?B?bXVNNHA5ajlFNW01V0Z4OWZod0h2eUdKdE9zVGd0TkNmYkwyYXNMYzgrdXI3?=
 =?utf-8?B?aUNpcGY2WVo0QnVYYmxraWRicldlNkNUY1Frd1NQKzBHd2JEYVg0QXliamZu?=
 =?utf-8?B?YmRUQ1V5Zy9rZ2wySXBVUzE4TW0zQzR6RE4vcEdCTndqZWFOUGI0cmk1empm?=
 =?utf-8?B?L0Z3WWVWdlRZTGZ5eEw2eVI2WXNGSmJFeHdISnBiOC9RZDZMV1EwcjJNQzBl?=
 =?utf-8?B?eFp4NDdCWlN3bGNxN0hsd3pMbHBPYzFCTXhFb01lSUVNREJoeTYycVAwZS9p?=
 =?utf-8?B?RzBkMnFaK0FXOUc1eGFFK1NURklKcms5cGhEU3BoNFgyTHEzSjJacW5yWEcr?=
 =?utf-8?B?TjVGRWRMSi9qY1FNV0VwdkpDUzZrZEtIYStHN1pFazF2MnE2Y3dxWTdwZTN6?=
 =?utf-8?B?MlMvTjhxY1JmbURId2MvSnMyT3JDT0pTU0g3bCtzamxyR0J6NzVNMElRYlo1?=
 =?utf-8?B?N0xOVjlHU3FaMW5BM1k3WlBibUVTQmhwRXBGaDJBRldrU25LUnZxMTcwZkpL?=
 =?utf-8?B?MnpyTVBhQlM3aU5Lb3VDMWFaYXB1Q1RHd3RvYUVBM3ZUNlJVU1dUZGYzNEJp?=
 =?utf-8?B?dFZTTXJNdzNmd1N1MmNHSGN2a0MvRkVPUGFRZHkzc3N6RXlvQmF0UWtTaGlV?=
 =?utf-8?B?c0hTQnQ1cTBTOEsrWkdzTTZyUmhFNzFiNm8wNGtYbkFzcTV3SzRkSWs3YmNi?=
 =?utf-8?B?cWY1YzZJV2VrcUVBcGVXU3prUHdZdmtiSjZ3NE5XN01tOEtPM2Q0R25zaWor?=
 =?utf-8?B?QTlpeU5EY0prQ1hGOXh3V1lmUkRvdkxvWWp6ZmJXV3dlaldyTkwxSkgxQSsx?=
 =?utf-8?B?Z0tkUk1naVl6cnUwU05ZRi9IMFFGQUwvUytrTnFickFrby84ZmI5OWVEYkFU?=
 =?utf-8?B?Y2p1UFdqNGRRTElCa1I5Y3RlRHBIYlMyZHpqTGxUSGdINDBWVXVIK2dnRXh0?=
 =?utf-8?B?R29hNm5uVUxuYXRVL2NCYVRtQ0UvT3BZQ1hsY3c4dGk5eTJFUVFrck5LUkYw?=
 =?utf-8?B?Z2p4cHBpWVdsSW5sd29SY21RUExTMXZ4Qk5SeVJWeXgwM1RDSDFMcTROZXpZ?=
 =?utf-8?B?bUwzS01paUdSTncrb2JBVWJWYlJmdXVvQ2FFQ3Q1R01JVmNHSnlPRm1nT0Rw?=
 =?utf-8?B?V3ZkeVQ5RGtFdFdoM0NIRCt4MEpDY05qVHJ1TW44M010c3NIKzF4RW5OMG5W?=
 =?utf-8?B?bzgwRTl2QmtuLzArT2lPdERvQVVQelNUQWdVU21UWC90czlaYUVJYjV5bnVF?=
 =?utf-8?B?cU5CVVdpbERMcFlWMVI3MEJSQTRNdk1ER3l2TVpGdFdHNE1YLzk5dTZGZ2VO?=
 =?utf-8?B?NWhiYUcyQVpkcVJGa1R1TjA3MEh0NWJBMXJialRnK0Irc1VwTFcrdVhGenBV?=
 =?utf-8?B?VVFWN0Q0ekU3ekN3d3p3eHJKb1VKOXB0bmpkbUtzYWNRUFRTSDd5UEdENmxm?=
 =?utf-8?B?U3hwQ1hNZ1dha0ZGdTZXSy9aTlprUFlYUVdGajJZQ2FObXBBOVB2SzltbSt1?=
 =?utf-8?B?aEo0K3QwQkNCNnlSSEtOZytHUUt5OXdCaG5Sc0xHYnJsK2xJZXFDYWtsZnZP?=
 =?utf-8?B?R0xiWWE1VEVhZXNUZVVCcUZvTnFqWXpZQmlKclJRU2MzRHF4Ui9DWUpjZzZS?=
 =?utf-8?B?a1lwRXRuV3NCdTAwdDFoMWI0cnRFb21XOTY5TW9Pcy9venhvbDcwekNjQkgw?=
 =?utf-8?B?NE9tWmd5NlVmNWtwTlFVT29nQ0RXeDV0T3IvZ0J4OTg2VHhzY3czL3pLM3J0?=
 =?utf-8?B?QTdXbnNoVGdxTERkVlJDWmpQaDM2cFNQbm5VVDY3RHdNVE43T2E2VFBhWVFU?=
 =?utf-8?B?UWJ2V3FGRzFnWkxBVnZ0Q3czb3Z3OUZMTlVUcmt2ckFJRkU5VVVWaUt6THRG?=
 =?utf-8?B?R2JtMHNMRC9jdXNCRjhOeVhjeWVUYVRjZmIyRTVDNk9aeHdGMG1xRzR0cXVJ?=
 =?utf-8?B?WjllQnFuc2dDVXJ5MFBHaGtxQWpVazNDSS96aEdqUWpnM2IrZk1LNWNVdG1Z?=
 =?utf-8?B?ckw5QTdzMngveHQzdTEwd0lKUDhYeUc3NU94M0M5ZWtGeTlSMkUyK0lCMU1R?=
 =?utf-8?B?Q0h4bzFja25zb24yQTR5WGdKaHpBT1QwT3NwcmlqZUZLYlRqNHh6RE1kYTFn?=
 =?utf-8?B?Ymc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d3aa4442-e478-4859-4d1b-08dd9dbbf695
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 07:47:57.9713 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H0DPyb5r4RQ72F40jgfA2oREvDNVIiyUvpP1H3/7vsbG8JzzZH6eLgyY24JGLx3m709ffnT8FZv0uVulLITDVKLqsALaO7oU0B8mfH3rGf4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7356
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

In future platforms, we will need to represent the device and tile
VRAM regions in a more dynamic way, so let's abandon the static
allocation of these structures and start use a dynamic allocation.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Stuart Summers <stuart.summers@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c        |  2 +-
 drivers/gpu/drm/xe/display/xe_plane_initial.c |  2 +-
 drivers/gpu/drm/xe/xe_assert.h                |  2 +-
 drivers/gpu/drm/xe/xe_device.c                | 19 ++++++
 drivers/gpu/drm/xe/xe_device_types.h          |  6 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |  2 +-
 drivers/gpu/drm/xe/xe_migrate.c               | 18 ++---
 drivers/gpu/drm/xe/xe_pci.c                   |  6 ++
 drivers/gpu/drm/xe/xe_query.c                 |  2 +-
 drivers/gpu/drm/xe/xe_svm.c                   | 17 ++---
 drivers/gpu/drm/xe/xe_tile.c                  | 33 +++++++++-
 drivers/gpu/drm/xe/xe_tile.h                  |  2 +
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c        |  6 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c          |  4 +-
 drivers/gpu/drm/xe/xe_vram.c                  | 66 ++++++++++---------
 15 files changed, 121 insertions(+), 66 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 461ecdfdb742..a90febdb4646 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -302,7 +302,7 @@ static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
 		 * accessible.  This is important on small-bar systems where
 		 * only some subset of VRAM is CPU accessible.
 		 */
-		if (tile->mem.vram.io_size < tile->mem.vram.usable_size) {
+		if (tile->mem.vram->io_size < tile->mem.vram->usable_size) {
 			ret = -EINVAL;
 			goto err;
 		}
diff --git a/drivers/gpu/drm/xe/display/xe_plane_initial.c b/drivers/gpu/drm/xe/display/xe_plane_initial.c
index fada6f877bca..627c87435c1d 100644
--- a/drivers/gpu/drm/xe/display/xe_plane_initial.c
+++ b/drivers/gpu/drm/xe/display/xe_plane_initial.c
@@ -107,7 +107,7 @@ initial_plane_bo(struct xe_device *xe,
 		 * We don't currently expect this to ever be placed in the
 		 * stolen portion.
 		 */
-		if (phys_base >= tile0->mem.vram.usable_size) {
+		if (phys_base >= tile0->mem.vram->usable_size) {
 			drm_err(&xe->drm,
 				"Initial plane programming using invalid range, phys_base=%pa\n",
 				&phys_base);
diff --git a/drivers/gpu/drm/xe/xe_assert.h b/drivers/gpu/drm/xe/xe_assert.h
index 68fe70ce2be3..cd63cdd2dc78 100644
--- a/drivers/gpu/drm/xe/xe_assert.h
+++ b/drivers/gpu/drm/xe/xe_assert.h
@@ -145,7 +145,7 @@
 	const struct xe_tile *__tile = (tile);							\
 	char __buf[10] __maybe_unused;								\
 	xe_assert_msg(tile_to_xe(__tile), condition, "tile: %u VRAM %s\n" msg,			\
-		      __tile->id, ({ string_get_size(__tile->mem.vram.actual_physical_size, 1,	\
+		      __tile->id, ({ string_get_size(__tile->mem.vram->actual_physical_size, 1,	\
 				     STRING_UNITS_2, __buf, sizeof(__buf)); __buf; }), ## arg);	\
 })
 
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 660b0c5126dc..a80e892d6959 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -684,6 +684,21 @@ static void sriov_update_device_info(struct xe_device *xe)
 	}
 }
 
+static int xe_device_vram_alloc(struct xe_device *xe)
+{
+	struct xe_vram_region *vram;
+
+	if (!IS_DGFX(xe))
+		return 0;
+
+	vram = drmm_kzalloc(&xe->drm, sizeof(*vram), GFP_KERNEL);
+	if (!vram)
+		return -ENOMEM;
+
+	xe->mem.vram = vram;
+	return 0;
+}
+
 /**
  * xe_device_probe_early: Device early probe
  * @xe: xe device instance
@@ -728,6 +743,10 @@ int xe_device_probe_early(struct xe_device *xe)
 
 	xe->wedged.mode = xe_modparam.wedged_mode;
 
+	err = xe_device_vram_alloc(xe);
+	if (err)
+		return err;
+
 	return 0;
 }
 ALLOW_ERROR_INJECTION(xe_device_probe_early, ERRNO); /* See xe_pci_probe() */
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 0482e00e58df..cba1eed9ed6a 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -72,6 +72,8 @@ struct xe_pxp;
  * device, such as HBM memory or CXL extension memory.
  */
 struct xe_vram_region {
+	/** @tile: Backpointer to tile */
+	struct xe_tile *tile;
 	/** @io_start: IO start address of this VRAM instance */
 	resource_size_t io_start;
 	/**
@@ -211,7 +213,7 @@ struct xe_tile {
 		 * Although VRAM is associated with a specific tile, it can
 		 * still be accessed by all tiles' GTs.
 		 */
-		struct xe_vram_region vram;
+		struct xe_vram_region *vram;
 
 		/** @mem.ggtt: Global graphics translation table */
 		struct xe_ggtt *ggtt;
@@ -386,7 +388,7 @@ struct xe_device {
 	/** @mem: memory info for device */
 	struct {
 		/** @mem.vram: VRAM info for device */
-		struct xe_vram_region vram;
+		struct xe_vram_region *vram;
 		/** @mem.sys_mgr: system TTM manager */
 		struct ttm_resource_manager sys_mgr;
 		/** @mem.sys_mgr: system memory shrinker. */
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 3556c41c041b..a33a6f3a6731 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1574,7 +1574,7 @@ static u64 pf_query_free_lmem(struct xe_gt *gt)
 {
 	struct xe_tile *tile = gt->tile;
 
-	return xe_ttm_vram_get_avail(&tile->mem.vram.ttm.manager);
+	return xe_ttm_vram_get_avail(&tile->mem.vram->ttm.manager);
 }
 
 static u64 pf_query_max_lmem(struct xe_gt *gt)
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 8f8e9fdfb2a8..c0bd23aaaa23 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -130,9 +130,9 @@ static u64 xe_migrate_vram_ofs(struct xe_device *xe, u64 addr, bool is_comp_pte)
 	u64 identity_offset = IDENTITY_OFFSET;
 
 	if (GRAPHICS_VER(xe) >= 20 && is_comp_pte)
-		identity_offset += DIV_ROUND_UP_ULL(xe->mem.vram.actual_physical_size, SZ_1G);
+		identity_offset += DIV_ROUND_UP_ULL(xe->mem.vram->actual_physical_size, SZ_1G);
 
-	addr -= xe->mem.vram.dpa_base;
+	addr -= xe->mem.vram->dpa_base;
 	return addr + (identity_offset << xe_pt_shift(2));
 }
 
@@ -142,22 +142,22 @@ static void xe_migrate_program_identity(struct xe_device *xe, struct xe_vm *vm,
 	u64 pos, ofs, flags;
 	u64 entry;
 	/* XXX: Unclear if this should be usable_size? */
-	u64 vram_limit =  xe->mem.vram.actual_physical_size +
-		xe->mem.vram.dpa_base;
+	u64 vram_limit = xe->mem.vram->actual_physical_size +
+		xe->mem.vram->dpa_base;
 	u32 level = 2;
 
 	ofs = map_ofs + XE_PAGE_SIZE * level + vram_offset * 8;
 	flags = vm->pt_ops->pte_encode_addr(xe, 0, pat_index, level,
 					    true, 0);
 
-	xe_assert(xe, IS_ALIGNED(xe->mem.vram.usable_size, SZ_2M));
+	xe_assert(xe, IS_ALIGNED(xe->mem.vram->usable_size, SZ_2M));
 
 	/*
 	 * Use 1GB pages when possible, last chunk always use 2M
 	 * pages as mixing reserved memory (stolen, WOCPM) with a single
 	 * mapping is not allowed on certain platforms.
 	 */
-	for (pos = xe->mem.vram.dpa_base; pos < vram_limit;
+	for (pos = xe->mem.vram->dpa_base; pos < vram_limit;
 	     pos += SZ_1G, ofs += 8) {
 		if (pos + SZ_1G >= vram_limit) {
 			entry = vm->pt_ops->pde_encode_bo(bo, pt_2m_ofs,
@@ -310,7 +310,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 
 		xe_migrate_program_identity(xe, vm, bo, map_ofs, IDENTITY_OFFSET,
 					    pat_index, pt30_ofs);
-		xe_assert(xe, xe->mem.vram.actual_physical_size <=
+		xe_assert(xe, xe->mem.vram->actual_physical_size <=
 					(MAX_NUM_PTE - IDENTITY_OFFSET) * SZ_1G);
 
 		/*
@@ -320,10 +320,10 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 		if (GRAPHICS_VER(xe) >= 20 && xe_device_has_flat_ccs(xe)) {
 			u16 comp_pat_index = xe->pat.idx[XE_CACHE_NONE_COMPRESSION];
 			u64 vram_offset = IDENTITY_OFFSET +
-				DIV_ROUND_UP_ULL(xe->mem.vram.actual_physical_size, SZ_1G);
+				DIV_ROUND_UP_ULL(xe->mem.vram->actual_physical_size, SZ_1G);
 			u64 pt31_ofs = bo->size - XE_PAGE_SIZE;
 
-			xe_assert(xe, xe->mem.vram.actual_physical_size <= (MAX_NUM_PTE -
+			xe_assert(xe, xe->mem.vram->actual_physical_size <= (MAX_NUM_PTE -
 						IDENTITY_OFFSET - IDENTITY_OFFSET / 2) * SZ_1G);
 			xe_migrate_program_identity(xe, vm, bo, map_ofs, vram_offset,
 						    comp_pat_index, pt31_ofs);
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index b68c90910d82..23186d287f49 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -700,12 +700,18 @@ static int xe_info_init(struct xe_device *xe,
 	 * All of these together determine the overall GT count.
 	 */
 	for_each_tile(tile, xe, id) {
+		int err;
+
 		gt = tile->primary_gt;
 		gt->info.id = xe->info.gt_count++;
 		gt->info.type = XE_GT_TYPE_MAIN;
 		gt->info.has_indirect_ring_state = graphics_desc->has_indirect_ring_state;
 		gt->info.engine_mask = graphics_desc->hw_engine_mask;
 
+		err = xe_tile_alloc_vram(tile);
+		if (err)
+			return err;
+
 		if (MEDIA_VER(xe) < 13 && media_desc)
 			gt->info.engine_mask |= media_desc->hw_engine_mask;
 
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 2dbf4066d86f..99189d15d4a5 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -337,7 +337,7 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
 	config->num_params = num_params;
 	config->info[DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID] =
 		xe->info.devid | (xe->info.revid << 16);
-	if (xe_device_get_root_tile(xe)->mem.vram.usable_size)
+	if (xe->mem.vram)
 		config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
 			DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM;
 	if (xe->info.has_usm && IS_ENABLED(CONFIG_DRM_XE_GPUSVM))
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 4432685936ed..932b68dc5f65 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -336,16 +336,11 @@ static struct xe_vram_region *page_to_vr(struct page *page)
 	return container_of(page_pgmap(page), struct xe_vram_region, pagemap);
 }
 
-static struct xe_tile *vr_to_tile(struct xe_vram_region *vr)
-{
-	return container_of(vr, struct xe_tile, mem.vram);
-}
-
 static u64 xe_vram_region_page_to_dpa(struct xe_vram_region *vr,
 				      struct page *page)
 {
 	u64 dpa;
-	struct xe_tile *tile = vr_to_tile(vr);
+	struct xe_tile *tile = vr->tile;
 	u64 pfn = page_to_pfn(page);
 	u64 offset;
 
@@ -400,7 +395,7 @@ static int xe_svm_copy(struct page **pages, dma_addr_t *dma_addr,
 
 		if (!vr && spage) {
 			vr = page_to_vr(spage);
-			tile = vr_to_tile(vr);
+			tile = vr->tile;
 		}
 		XE_WARN_ON(spage && page_to_vr(spage) != vr);
 
@@ -536,7 +531,7 @@ static u64 block_offset_to_pfn(struct xe_vram_region *vr, u64 offset)
 
 static struct drm_buddy *tile_to_buddy(struct xe_tile *tile)
 {
-	return &tile->mem.vram.ttm.mm;
+	return &tile->mem.vram->ttm.mm;
 }
 
 static int xe_svm_populate_devmem_pfn(struct drm_gpusvm_devmem *devmem_allocation,
@@ -550,7 +545,7 @@ static int xe_svm_populate_devmem_pfn(struct drm_gpusvm_devmem *devmem_allocatio
 
 	list_for_each_entry(block, blocks, link) {
 		struct xe_vram_region *vr = block->private;
-		struct xe_tile *tile = vr_to_tile(vr);
+		struct xe_tile *tile = vr->tile;
 		struct drm_buddy *buddy = tile_to_buddy(tile);
 		u64 block_pfn = block_offset_to_pfn(vr, drm_buddy_block_offset(block));
 		int i;
@@ -717,7 +712,7 @@ u64 xe_svm_find_vma_start(struct xe_vm *vm, u64 start, u64 end, struct xe_vma *v
 #if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
 static struct xe_vram_region *tile_to_vr(struct xe_tile *tile)
 {
-	return &tile->mem.vram;
+	return tile->mem.vram;
 }
 
 /**
@@ -764,7 +759,7 @@ int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
 	drm_gpusvm_devmem_init(&bo->devmem_allocation,
 			       vm->xe->drm.dev, mm,
 			       &gpusvm_devmem_ops,
-			       &tile->mem.vram.dpagemap,
+			       &tile->mem.vram->dpagemap,
 			       xe_svm_range_size(range));
 
 	blocks = &to_xe_ttm_vram_mgr_resource(bo->ttm.resource)->blocks;
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index 0771acbbf367..8303ebd90099 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -98,6 +98,33 @@ static int xe_tile_alloc(struct xe_tile *tile)
 	return 0;
 }
 
+/**
+ * xe_tile_alloc_vram - Perform per-tile VRAM structs allocation
+ * @tile: Tile to perform allocations for
+ *
+ * Allocates VRAM per-tile data structures using DRM-managed allocations.
+ * Does not touch the hardware.
+ *
+ * Returns -ENOMEM if allocations fail, otherwise 0.
+ */
+int xe_tile_alloc_vram(struct xe_tile *tile)
+{
+	struct xe_device *xe = tile_to_xe(tile);
+	struct xe_vram_region *vram;
+
+	if (!IS_DGFX(xe))
+		return 0;
+
+	vram = drmm_kzalloc(&xe->drm, sizeof(*vram), GFP_KERNEL);
+	if (!vram)
+		return -ENOMEM;
+
+	vram->tile = tile;
+	tile->mem.vram = vram;
+
+	return 0;
+}
+
 /**
  * xe_tile_init_early - Initialize the tile and primary GT
  * @tile: Tile to initialize
@@ -135,8 +162,8 @@ static int tile_ttm_mgr_init(struct xe_tile *tile)
 	struct xe_device *xe = tile_to_xe(tile);
 	int err;
 
-	if (tile->mem.vram.usable_size) {
-		err = xe_ttm_vram_mgr_init(tile, &tile->mem.vram.ttm);
+	if (tile->mem.vram->usable_size) {
+		err = xe_ttm_vram_mgr_init(tile, &tile->mem.vram->ttm);
 		if (err)
 			return err;
 		xe->info.mem_region_mask |= BIT(tile->id) << 1;
@@ -171,7 +198,7 @@ int xe_tile_init_noalloc(struct xe_tile *tile)
 	xe_wa_apply_tile_workarounds(tile);
 
 	if (xe->info.has_usm && IS_DGFX(xe))
-		xe_devm_add(tile, &tile->mem.vram);
+		xe_devm_add(tile, tile->mem.vram);
 
 	return xe_tile_sysfs_init(tile);
 }
diff --git a/drivers/gpu/drm/xe/xe_tile.h b/drivers/gpu/drm/xe/xe_tile.h
index eb939316d55b..8dd87ccb2aca 100644
--- a/drivers/gpu/drm/xe/xe_tile.h
+++ b/drivers/gpu/drm/xe/xe_tile.h
@@ -14,6 +14,8 @@ int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id);
 int xe_tile_init_noalloc(struct xe_tile *tile);
 int xe_tile_init(struct xe_tile *tile);
 
+int xe_tile_alloc_vram(struct xe_tile *tile);
+
 void xe_tile_migrate_wait(struct xe_tile *tile);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
index d9c9d2547aad..19bfc22b9706 100644
--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
@@ -89,8 +89,8 @@ static s64 detect_bar2_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
 	u64 tile_offset;
 	u64 tile_size;
 
-	tile_offset = tile->mem.vram.io_start - xe->mem.vram.io_start;
-	tile_size = tile->mem.vram.actual_physical_size;
+	tile_offset = tile->mem.vram->io_start - xe->mem.vram->io_start;
+	tile_size = tile->mem.vram->actual_physical_size;
 
 	/* Use DSM base address instead for stolen memory */
 	mgr->stolen_base = (xe_mmio_read64_2x32(mmio, DSMBASE) & BDSM_MASK) - tile_offset;
@@ -107,7 +107,7 @@ static s64 detect_bar2_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
 
 	/* Verify usage fits in the actual resource available */
 	if (mgr->stolen_base + stolen_size <= pci_resource_len(pdev, LMEM_BAR))
-		mgr->io_base = tile->mem.vram.io_start + mgr->stolen_base;
+		mgr->io_base = tile->mem.vram->io_start + mgr->stolen_base;
 
 	/*
 	 * There may be few KB of platform dependent reserved memory at the end
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 9e375a40aee9..d9afe0e22071 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -340,7 +340,7 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
 int xe_ttm_vram_mgr_init(struct xe_tile *tile, struct xe_ttm_vram_mgr *mgr)
 {
 	struct xe_device *xe = tile_to_xe(tile);
-	struct xe_vram_region *vram = &tile->mem.vram;
+	struct xe_vram_region *vram = tile->mem.vram;
 
 	return __xe_ttm_vram_mgr_init(xe, mgr, XE_PL_VRAM0 + tile->id,
 				      vram->usable_size, vram->io_size,
@@ -392,7 +392,7 @@ int xe_ttm_vram_mgr_alloc_sgt(struct xe_device *xe,
 	 */
 	xe_res_first(res, offset, length, &cursor);
 	for_each_sgtable_sg((*sgt), sg, i) {
-		phys_addr_t phys = cursor.start + tile->mem.vram.io_start;
+		phys_addr_t phys = cursor.start + tile->mem.vram->io_start;
 		size_t size = min_t(u64, cursor.size, SZ_2G);
 		dma_addr_t addr;
 
diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index e421a74fb87c..18124a5fb291 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -147,16 +147,16 @@ static int determine_lmem_bar_size(struct xe_device *xe)
 
 	resize_vram_bar(xe);
 
-	xe->mem.vram.io_start = pci_resource_start(pdev, LMEM_BAR);
-	xe->mem.vram.io_size = pci_resource_len(pdev, LMEM_BAR);
-	if (!xe->mem.vram.io_size)
+	xe->mem.vram->io_start = pci_resource_start(pdev, LMEM_BAR);
+	xe->mem.vram->io_size = pci_resource_len(pdev, LMEM_BAR);
+	if (!xe->mem.vram->io_size)
 		return -EIO;
 
 	/* XXX: Need to change when xe link code is ready */
-	xe->mem.vram.dpa_base = 0;
+	xe->mem.vram->dpa_base = 0;
 
 	/* set up a map to the total memory area. */
-	xe->mem.vram.mapping = ioremap_wc(xe->mem.vram.io_start, xe->mem.vram.io_size);
+	xe->mem.vram->mapping = ioremap_wc(xe->mem.vram->io_start, xe->mem.vram->io_size);
 
 	return 0;
 }
@@ -278,13 +278,13 @@ static void vram_fini(void *arg)
 	struct xe_tile *tile;
 	int id;
 
-	if (xe->mem.vram.mapping)
-		iounmap(xe->mem.vram.mapping);
+	if (xe->mem.vram->mapping)
+		iounmap(xe->mem.vram->mapping);
 
-	xe->mem.vram.mapping = NULL;
+	xe->mem.vram->mapping = NULL;
 
 	for_each_tile(tile, xe, id)
-		tile->mem.vram.mapping = NULL;
+		tile->mem.vram->mapping = NULL;
 }
 
 /**
@@ -320,10 +320,10 @@ int xe_vram_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
-	drm_info(&xe->drm, "VISIBLE VRAM: %pa, %pa\n", &xe->mem.vram.io_start,
-		 &xe->mem.vram.io_size);
+	drm_info(&xe->drm, "VISIBLE VRAM: %pa, %pa\n", &xe->mem.vram->io_start,
+		 &xe->mem.vram->io_size);
 
-	io_size = xe->mem.vram.io_size;
+	io_size = xe->mem.vram->io_size;
 
 	/* tile specific ranges */
 	for_each_tile(tile, xe, id) {
@@ -331,44 +331,48 @@ int xe_vram_probe(struct xe_device *xe)
 		if (err)
 			return err;
 
-		tile->mem.vram.actual_physical_size = tile_size;
-		tile->mem.vram.io_start = xe->mem.vram.io_start + tile_offset;
-		tile->mem.vram.io_size = min_t(u64, vram_size, io_size);
+		tile->mem.vram->actual_physical_size = tile_size;
+		tile->mem.vram->io_start = xe->mem.vram->io_start + tile_offset;
+		tile->mem.vram->io_size = min_t(u64, vram_size, io_size);
 
-		if (!tile->mem.vram.io_size) {
+		if (!tile->mem.vram->io_size) {
 			drm_err(&xe->drm, "Tile without any CPU visible VRAM. Aborting.\n");
 			return -ENODEV;
 		}
 
-		tile->mem.vram.dpa_base = xe->mem.vram.dpa_base + tile_offset;
-		tile->mem.vram.usable_size = vram_size;
-		tile->mem.vram.mapping = xe->mem.vram.mapping + tile_offset;
+		tile->mem.vram->dpa_base = xe->mem.vram->dpa_base + tile_offset;
+		tile->mem.vram->usable_size = vram_size;
+		tile->mem.vram->mapping = xe->mem.vram->mapping + tile_offset;
 
-		if (tile->mem.vram.io_size < tile->mem.vram.usable_size)
+		if (tile->mem.vram->io_size < tile->mem.vram->usable_size)
 			drm_info(&xe->drm, "Small BAR device\n");
-		drm_info(&xe->drm, "VRAM[%u, %u]: Actual physical size %pa, usable size exclude stolen %pa, CPU accessible size %pa\n", id,
-			 tile->id, &tile->mem.vram.actual_physical_size, &tile->mem.vram.usable_size, &tile->mem.vram.io_size);
-		drm_info(&xe->drm, "VRAM[%u, %u]: DPA range: [%pa-%llx], io range: [%pa-%llx]\n", id, tile->id,
-			 &tile->mem.vram.dpa_base, tile->mem.vram.dpa_base + (u64)tile->mem.vram.actual_physical_size,
-			 &tile->mem.vram.io_start, tile->mem.vram.io_start + (u64)tile->mem.vram.io_size);
+		drm_info(&xe->drm,
+			 "VRAM[%u, %u]: Actual physical size %pa, usable size exclude stolen %pa, CPU accessible size %pa\n",
+			 id, tile->id, &tile->mem.vram->actual_physical_size,
+			 &tile->mem.vram->usable_size, &tile->mem.vram->io_size);
+		drm_info(&xe->drm, "VRAM[%u, %u]: DPA range: [%pa-%llx], io range: [%pa-%llx]\n",
+			 id, tile->id, &tile->mem.vram->dpa_base,
+			 tile->mem.vram->dpa_base + (u64)tile->mem.vram->actual_physical_size,
+			 &tile->mem.vram->io_start,
+			 tile->mem.vram->io_start + (u64)tile->mem.vram->io_size);
 
 		/* calculate total size using tile size to get the correct HW sizing */
 		total_size += tile_size;
 		available_size += vram_size;
 
-		if (total_size > xe->mem.vram.io_size) {
+		if (total_size > xe->mem.vram->io_size) {
 			drm_info(&xe->drm, "VRAM: %pa is larger than resource %pa\n",
-				 &total_size, &xe->mem.vram.io_size);
+				 &total_size, &xe->mem.vram->io_size);
 		}
 
 		io_size -= min_t(u64, tile_size, io_size);
 	}
 
-	xe->mem.vram.actual_physical_size = total_size;
+	xe->mem.vram->actual_physical_size = total_size;
 
-	drm_info(&xe->drm, "Total VRAM: %pa, %pa\n", &xe->mem.vram.io_start,
-		 &xe->mem.vram.actual_physical_size);
-	drm_info(&xe->drm, "Available VRAM: %pa, %pa\n", &xe->mem.vram.io_start,
+	drm_info(&xe->drm, "Total VRAM: %pa, %pa\n", &xe->mem.vram->io_start,
+		 &xe->mem.vram->actual_physical_size);
+	drm_info(&xe->drm, "Available VRAM: %pa, %pa\n", &xe->mem.vram->io_start,
 		 &available_size);
 
 	return devm_add_action_or_reset(xe->drm.dev, vram_fini, xe);
-- 
2.34.1

