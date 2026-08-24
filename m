Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43A92C5DF94
	for <intel-xe@archiver.kernel.org>; Mon, 24 Aug 2026 08:09:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D370110E65F;
	Mon, 24 Aug 2026 08:09:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="chzjxcvk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E4A210E65F
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Aug 2026 08:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787558974; x=1819094974;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=VZa8CNXzpR99+Bc+hPvnkA8hh73p38YTXs88ycl7UvU=;
 b=chzjxcvkbOUgiDdFSNGKLL7LVytQlEGkxLJ3m1BSKJi9DkuYoojWIDIy
 aLkYKDwNDvSzf3rNPEk3EEq5ND7CcwDmjAKNc+aDJv8gFGf8A2vX36D4z
 qWtfEVD3+j+QaFPdVhDTPy334D/Pf/OisiFvLjr7050tRdXboplqQltRS
 J4K40gKK2OIvqx/lQRkUQ39WC9KE0iG5ngr0pnPuhBQxeTdJtU7fPj51d
 1F0KpQ+ErpL0GLFauXTRnVfsAivHL+6tXze1fgCn6/4UX2xa4XazbBJub
 +RnqSrj5y/JSrWmziFixnh0ZN9IvxCFgYZxKNlChxCAjJvZf3878nsTRy g==;
X-CSE-ConnectionGUID: jPMyBZzARwGAeARi/U/HzQ==
X-CSE-MsgGUID: 2VTPXpwbTW2diff8NqXtMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="91681492"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; d="scan'208";a="91681492"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 01:09:34 -0700
X-CSE-ConnectionGUID: 5JsYeZi8TDiPzK8VSXo8RA==
X-CSE-MsgGUID: KxwDQ4vVQe+tRwB7QiVH3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; d="scan'208";a="305135237"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 01:09:34 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 24 Aug 2026 01:09:33 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 24 Aug 2026 01:09:33 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.45) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 24 Aug 2026 01:09:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TSivpv5VJbCra8bL/N1R8b4vSuOsis1q7uGwDffP1f6TvnsVats+xu4l023ww+rv0BE0oLrTAO3MzaY+uu90kU1Mac6V/4Mm8HKKD0lVAXSNZ3MBF+zGPYVchZCPgwsqpv+DB8oeNawxKStNJOWXJfbPUqjFJKzwlk7IqRWX4xjut1/Fha9d3e96NO/NCsqtaUExFEul7yWEsvO7wZeMclClsm/jAWZCS/cYrFOapxElFORVl5o+zWpl1xScCqAJ1s+rpWgeWwZeGWSWfc+zrlOhtZKiS+uSA/t/mlqHZ4KsnYbMQz46zNAGh3iQwv8/8BNLddNTaz4tNvyHuAy3kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f+pvKxzpOv697Rcwoy1jB83s2cO1iwNSAZw+bduvvxg=;
 b=FnMy98MYVA/PShtvKWZgYacyznoSi9UOb4WoZE0iMArQuPwQkTtudcaoCdGoNg7oEM0B2bFMcSpoFv+pOS5o7hrtweoAjACB3OYq22EhLm71hw3W2qUNMTkoyMhCkFtYiuWqzB0QWlk/JrlFG0IxDA/Hgwicn4MlStwsHBak458XmBb+2nTNj+tdjdTVW2n4raL4zyKiCFyUzpJT95+/lo16N4wDyPq5nyInZU9nzYnXj1svAs9EP5mQaVfTvDAJcXsRuDE9+Shls7jCkOFO+b/a0YLElcvkNMxWFpoyE19u4AS56ocKAiNL/OPGq9H+noUOR0c5+cpnNAIMvzKNSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by BL4PR11MB8869.namprd11.prod.outlook.com (2603:10b6:208:5a8::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Mon, 24 Aug
 2026 08:09:27 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 08:09:27 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v3 3/4] drm/xe/vram: Add initial support for PF-mem regions
Date: Mon, 24 Aug 2026 10:09:07 +0200
Message-ID: <20260824080908.701133-4-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260824080908.701133-1-piotr.piorkowski@intel.com>
References: <20260824080908.701133-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZPR01CA0045.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::20) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|BL4PR11MB8869:EE_
X-MS-Office365-Filtering-Correlation-Id: f4beb4c0-b713-4f2a-ca15-08df01b70458
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|56012099006|10067099003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: RLla46n88g5lJnwUJ7RY3bXXUdsJQHcVy1uYfN5Jplux89WoKyOlM4i0vs6tBNDYQqFBmAvPt7j2Rqt5f3tC3JRoKe6ylm4K0bezCUD86KT4WJBTBci6048Zm9YQSxG+n+vyHoagprdsaULhL9kWP1A/JeDmE7OdgWvMDsAYaP7822r4+gZgDp1zkCR+8cp713OEIyDCaz0wiD1HGhUCGNKHq06rneN0G15u2IWbwUlvKEnACh26qPbowlNzd3gy9z0rHv79JEvTDdgrQAuObCSWVM2SJcZM9gG3P+JsvFEdTtikFTqpTDk7QEvIiYyNVin9+VlxGbDWM4J66HrxPMqqitBTHFRDPCZy7rc58m3hlw3uv+S41a1E7svEd0Misa61EGqqTtOolpSpHXi1XZic3HNthJpciy0z4b9+A5RPP3aesToiJlvCgizFCHAAHRSrcgrFzckhfYI7LlmclaP2HWMopNayW9zgJdA75SlCnHwo0Zh6DFwnwHuLv/bkODDWXvuNLU4FHz8J70ecF4/B6tG/zs/1X3p78CbDM2d/8EsJVQ4bGQGKa9KlvBO7qR09OnFjAc9JTN+LUVEjFYMtAXuvzlXK6qmxdtW2hIqP1qC1mI9Wh7Z6fSthSQm7w+UwB1rLMZ9mlVnGHaRD+4sEaZ3XhFAQbkCHmuMSr4g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ejIrYjRGWldOVEtDS0grSHF4UTlReTM2TFV1VGZYZG5QQm9GSUMvYVptMmFN?=
 =?utf-8?B?NXhZWFBQT2JNd0hjVjY0WkhKQkRsWE9iRXh0aXQwVDdYam9VYkIyRkR5Z1lo?=
 =?utf-8?B?NWdVSzZOckp2WXdtNXZUWEg5N3A4T0hSVDIrM2ZlbE4wbklYN1crVm9LcUx3?=
 =?utf-8?B?YmV3RGVuQ0RuRjJBZmF5Wm1JcXFyZzlhVVpETnNBeUswazIxL1ZvMG5uTnpE?=
 =?utf-8?B?YkN1c2gya0gvcW1yVEk1R0RqM1hjNU5jVXY4c2FjWHhRajRQbk9DYlpQdEdh?=
 =?utf-8?B?TkVrRGs5TjdIQThwMmorN1NjazlwdlJXV25zSkl3YnM4cWN1SFhWb0xjb2RK?=
 =?utf-8?B?UUtHSUlONjl0MEYvSE5JYlVadGd4SU1JRWdpa2JsVXRkQ2JlSUNzWmh2TW9J?=
 =?utf-8?B?a24rRmExbUYwZGZtOWRUNWxOV1ZzMWRUL25PbWxDcTVIUnlKOXBwc2ppZCs3?=
 =?utf-8?B?SGQvWnlReUM3dHlnZzJBRU5QeUN5TFZBZjdJWVZRa1hiU1NXQzZyRmFjRXpw?=
 =?utf-8?B?M2NWMHlrK3E2RkVrV2tHT2dFaVZWMGhIQzdOODg0bUNYWUJJTzhvM3YzQm5C?=
 =?utf-8?B?aEo5N3k2eXY1TFF3Mk5KYVJ1YjNCNk5kMWFHODJlakI4VDVBYnFmaURab1RQ?=
 =?utf-8?B?ZWE1SG9EM0xSTlBJZlQ0NmRRNmlEUkNZVnNWVk4xNU1FN0habVcwaXVEYkh0?=
 =?utf-8?B?YnBYZ3l4QnQ2SnMva2lLMFJlY1pSRVh1S2gzYUgxN0JIaU1Ic3BoY2VIUkdn?=
 =?utf-8?B?THFKYVdJRGdSTGU5S29pZnJ6R2hESEdBZ3VTdVUyUC9mTzUxK2hUKytRT2lr?=
 =?utf-8?B?b0k1NThRVWordVc0NGRZbnQ2M0tZK3BjQlhiTnNHdEZvTEYxaWdFaWc2Z0tv?=
 =?utf-8?B?UTQ5T0drUnczTVBJeTRJRCt2TTQ2MWlqSG0yZXhPZFdneE9kamFOTElHSVRJ?=
 =?utf-8?B?OFJsVVBOSWwzcHBKam4rQTZ0VkdxNnVTQ1lIcW9KWHdTMjlDcEV0L0o1OEdu?=
 =?utf-8?B?ckdYaDZzNTVNWFhVSlJZQVFFRUVDb2JMTER3ZFNKS1gweVNtT2NTeHJReTBU?=
 =?utf-8?B?d0dCRzdZTmsycnlicGFaWWhQZmRwSy90WnVLRm5la1RGNkhLTkxXcGtMQUlI?=
 =?utf-8?B?SEdGK2lhT2JaTmVLdEFZZjhBQiszdUpqYm51T2dFSFVYZmRndzVoVldSRk50?=
 =?utf-8?B?aC9md2pNWFdybGRxWVcxT3UzM3k2RFdSV1FwZGhydjBXVmQ1UWV4RjFGUWpX?=
 =?utf-8?B?bFpZRmpLMUlLcVczeU94ZzFvYktMa0t5ZFExWmdGOGI2OVA0N216Vkw2bWZ4?=
 =?utf-8?B?Z2xteHhtRVRRckxJYVZqdGJrN3NuV2tCc2cvbEY0Yk1rRlB2emZwVEdvL2lE?=
 =?utf-8?B?Y1lHalM5ZWhxdGtxTnR0Unp4S0R2NXBaZGlERlFFOGQ2VkFITXUxVjlrd1My?=
 =?utf-8?B?WFB4eXFGSEVKQWk0ajgrazRLK0dOSTVJL3hPM014UzRQc3ZCMmFLbVFzcnVG?=
 =?utf-8?B?QzFqQWdpR25qRllRUzBKUFN3MmxXQnBseVZySGhTaWlrMUhUbU90anJ2aGlz?=
 =?utf-8?B?MDIwd2hKSDhsYUphTGZyaUh2K0Jadkc4UVc1SWZTNmtsWmdBdTNWdk96YlVw?=
 =?utf-8?B?THMwcmRaRkZWWWFOcEhpV1prZ2JyZ2RST1QzWlJxYmVycDR1VGxtUHdsTDcx?=
 =?utf-8?B?ZU9KN0Via0toVHowUWs5S0V0WTk5ZEtPTW5WSHNGbEpTQ0RjMER6SHBUQXRi?=
 =?utf-8?B?M293aEFpU3FqclROTGdUcGVZZzhFSTNtd1kzREpoVEE1eXhlbG0zVnVWbTB6?=
 =?utf-8?B?UFRHa2w5Y2Z4aG9KRUZtQ0VCajBQSFFQNytIaVc4SDBEUitKbzlEREpZUmpu?=
 =?utf-8?B?MDhNN0tlWHROVHFhSnFsQ0luUlBsRWx6QlpQRFFFeEJmYzB0eGJSem1MSUxm?=
 =?utf-8?B?TnBDUS9mbHdzK2FxTnZCaStQR1d0R0lZYmdyTFo1dmdJaHFJWUxFanhhZWpG?=
 =?utf-8?B?VmZQZFhuK0VpN0syQzJrbnFsREhUbnZkNXVPSXpZT0NtTFhYK002ekhIM1g5?=
 =?utf-8?B?Vm5rK2ZzaWpKYkN4dmgzRU51Mm1mU0lwR2Q2VjhmWktPRXA5YzVmeWw5L2lM?=
 =?utf-8?B?SXEvR2tMcGJYQnQ1R1NZMXNjTlVrczZMdDVXOVFVdmlrR2tRUzRoSUVZWUp1?=
 =?utf-8?B?eEYvOHZpQkFwSDNXSVREbVlSUVFHYkZGSk4yN3k2L0FpVkJpeHpGbEFmYTR0?=
 =?utf-8?B?aWtpSXI5ZnF3V3pKMCtWUllzS21LOGp3MnVoN0Y0REhxdCtvTUd2MUNwQS91?=
 =?utf-8?B?RHgvcU9wNkNPL2x5cnZlVjFJTHFtcXFFRkhhVkpUTEVVaHJXZ0R3akkzbi9q?=
 =?utf-8?Q?iWD/rAuy2A5OwDmc=3D?=
X-Exchange-RoutingPolicyChecked: KCYnj4cKdpub383RIGh0jDx22TsTlPxjiw1Xrh/hcQCr9fnWVNvx4t1humUANC5ISP350dUfVuZfVIRjXedYQfldw6ujv6umm00Bwv1HjvWSnKkqtcanUKv9VCl/bWcn2gJzA0VnXm7l1ATcJPBlJp/Eg4mFRKsWC+zgVNCEn+fykoSnmOj0lNxdgHShO8Nm8cIg/ThvG0GtkWBoWkyZmM8XLhjQntK1ulYjlpHjqBwpXIehfDzuF1M6uLy5bW6CdPlrcXlC/x0WzdAE11mnIsRMyScbwCSSQ3CcvGXB7Na2xB3IEk5pCYgvfQBVALznbAtflzIm2mlO9wJqZtyPDw==
X-MS-Exchange-CrossTenant-Network-Message-Id: f4beb4c0-b713-4f2a-ca15-08df01b70458
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 08:09:27.5162 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4TePRFyeNfmu009hMiw+DA5Wb+vx3YVMQhRrY4KnJHaTd9OMgR5Qmdl+9TjP8te5ZLJSbsek+57FYai82gJ3CPEA0VzBIgtJtisvs+onGag=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8869
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

Add helpers to allocate and initialize such a region from a
caller-provided parent, offset, and size, and assign the matching TTM
placement. The helpers do not decide when the region is needed or how
large it should be. A separate TTM VRAM manager is initialized when a
caller installs the region as the tile kernel_vram.

v2:
 - Enforce page alignment on offset/size and guard against a NULL
   parent BAR mapping (Sashiko).

Assisted-by: Claude:claude-5-sonnet
Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/xe_tile.c       |  8 ++++++
 drivers/gpu/drm/xe/xe_vram.c       | 46 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vram.h       |  4 +++
 drivers/gpu/drm/xe/xe_vram_types.h |  2 ++
 4 files changed, 60 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index fd0c2e4cbdd2..e196f424fda4 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -198,6 +198,14 @@ int xe_tile_init_noalloc(struct xe_tile *tile)
 		xe->info.mem_region_mask |= BIT(tile->mem.vram->id) << 1;
 	}
 
+	if (IS_DGFX(xe) && tile->mem.kernel_vram &&
+	    tile->mem.kernel_vram != tile->mem.vram &&
+	    !ttm_resource_manager_used(&tile->mem.kernel_vram->ttm.manager)) {
+		err = xe_ttm_vram_mgr_init(xe, tile->mem.kernel_vram);
+		if (err)
+			return err;
+	}
+
 	return xe_tile_sysfs_init(tile);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index 2376d32b8ce7..61fb4a543cb0 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -33,6 +33,8 @@ static const char *stringify_vram_binding(enum xe_vram_binding binding)
 		return "Device";
 	case XE_VRAM_BINDING_TILE:
 		return "Tile";
+	case XE_VRAM_BINDING_PFMEM:
+		return "PF-mem";
 	}
 
 	return "Unknown";
@@ -282,6 +284,11 @@ static int vram_region_init(struct xe_device *xe, struct xe_vram_region *vram,
 	if (vram->mapping)
 		return 0;
 
+	if (!lmem_bar->mapping) {
+		drm_err(&xe->drm, "Failed to map LMEM BAR\n");
+		return -ENOMEM;
+	}
+
 	vram->actual_physical_size = region_size;
 	vram->io_start = lmem_bar->io_start + offset;
 	vram->io_size = min_t(u64, usable_size, remain_io_size);
@@ -300,6 +307,45 @@ static int vram_region_init(struct xe_device *xe, struct xe_vram_region *vram,
 	return 0;
 }
 
+/**
+ * xe_vram_region_alloc_pfmem - Allocate a PF-mem VRAM region
+ * @xe: the &xe_device
+ * @id: tile id the region belongs to
+ *
+ * Return: the allocated VRAM region, or NULL on failure.
+ */
+struct xe_vram_region *xe_vram_region_alloc_pfmem(struct xe_device *xe, u8 id)
+{
+	return vram_region_alloc(xe, XE_VRAM_BINDING_PFMEM, id, XE_PL_VRAM0_PFMEM + id);
+}
+
+/**
+ * xe_vram_region_init_pfmem - Initialize a PF-mem VRAM region
+ * @vram: pre-allocated VRAM region to initialize
+ * @parent: tile VRAM region that provides the address space context
+ * @offset: region offset relative to the parent
+ * @size: region size
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int xe_vram_region_init_pfmem(struct xe_vram_region *vram,
+			      struct xe_vram_region *parent,
+			      u64 offset, u64 size)
+{
+	struct xe_device *xe = parent->xe;
+	resource_size_t remain_io_size;
+
+	if (!size || !PAGE_ALIGNED(offset) || !PAGE_ALIGNED(size) ||
+	    offset > parent->usable_size || size > parent->usable_size - offset)
+		return -EINVAL;
+
+	remain_io_size = offset < parent->io_size ? parent->io_size - offset : 0;
+	if (!remain_io_size)
+		return -EINVAL;
+
+	return vram_region_init(xe, vram, parent, offset, size, size, remain_io_size);
+}
+
 /**
  * xe_map_resource_to_region - Map ttm resource to vram memory region
  * @res: The ttm resource
diff --git a/drivers/gpu/drm/xe/xe_vram.h b/drivers/gpu/drm/xe/xe_vram.h
index 20148791cb21..a2f4e33b5947 100644
--- a/drivers/gpu/drm/xe/xe_vram.h
+++ b/drivers/gpu/drm/xe/xe_vram.h
@@ -18,6 +18,10 @@ int xe_vram_probe(struct xe_device *xe);
 
 struct xe_vram_region *xe_vram_region_alloc_tile(struct xe_device *xe, u8 id);
 struct xe_vram_region *xe_vram_region_alloc_device(struct xe_device *xe);
+struct xe_vram_region *xe_vram_region_alloc_pfmem(struct xe_device *xe, u8 id);
+int xe_vram_region_init_pfmem(struct xe_vram_region *vram,
+			      struct xe_vram_region *parent,
+			      u64 offset, u64 size);
 resource_size_t xe_vram_region_io_start(const struct xe_vram_region *vram);
 resource_size_t xe_vram_region_io_size(const struct xe_vram_region *vram);
 resource_size_t xe_vram_region_dpa_base(const struct xe_vram_region *vram);
diff --git a/drivers/gpu/drm/xe/xe_vram_types.h b/drivers/gpu/drm/xe/xe_vram_types.h
index e4e928b39fa3..91b66f21b718 100644
--- a/drivers/gpu/drm/xe/xe_vram_types.h
+++ b/drivers/gpu/drm/xe/xe_vram_types.h
@@ -20,11 +20,13 @@ struct xe_migrate;
  * @XE_VRAM_BINDING_NONE: no binding assigned, default value of a zeroed region
  * @XE_VRAM_BINDING_DEVICE: device level region aggregating all tile VRAM regions
  * @XE_VRAM_BINDING_TILE: general-purpose VRAM region bound to a tile
+ * @XE_VRAM_BINDING_PFMEM: VRAM region reserved solely for PF kernel allocations
  */
 enum xe_vram_binding {
 	XE_VRAM_BINDING_NONE = 0,
 	XE_VRAM_BINDING_DEVICE,
 	XE_VRAM_BINDING_TILE,
+	XE_VRAM_BINDING_PFMEM,
 };
 
 /**
-- 
2.34.1

