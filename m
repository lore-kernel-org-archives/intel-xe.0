Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2544FC54FB3
	for <intel-xe@archiver.kernel.org>; Mon, 26 May 2025 14:58:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1EC310E389;
	Mon, 26 May 2025 14:58:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HcIupBFr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94FBE10E38D
 for <intel-xe@lists.freedesktop.org>; Mon, 26 May 2025 14:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748271482; x=1779807482;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=JaMsaq/X2WkzneB4HTCWPMtIVl/QDX24WBuG10n6gM8=;
 b=HcIupBFrHkn4p9fQxOfa0jWhaXqhwb6gH0G4HRh1lFqwtbnj18voH7C0
 ChetdispWOfrWxdCz0/szm6A7GXrFQBY4Z0L13DRTJgCSRv9wDZwpGZUj
 Oda70Trl8DBzptxFlEJULjbZRf0kg3h+z6d8X8lF7Yi69Cl8716NpJqC4
 YHPHSwWx96S6dXHb65pqsRnO8uUg0iCVpu3NH9E+7nki/+pOvqx6H6oTI
 QmL+EZkTtQTulcKnjSWoqztBP9rZ7HeELiCuyA35aiZCmOtwP8v+lYAiy
 KyJnXyYYzPQDP36jKZIr3xKV8s/3hrwL6Q4oHYM+16Gn2GgIbJ0Jo3YS4 g==;
X-CSE-ConnectionGUID: z3aT0D5WTlCJ6T79yaWgag==
X-CSE-MsgGUID: l1b5QG/cRfiKirJmgBFzBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="60880009"
X-IronPort-AV: E=Sophos;i="6.15,316,1739865600"; d="scan'208";a="60880009"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 07:58:01 -0700
X-CSE-ConnectionGUID: WT/xFkzmReyyP6P3CpScEg==
X-CSE-MsgGUID: JrNmZA/GTWO18QzrTlYO1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,316,1739865600"; d="scan'208";a="146305094"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 07:57:54 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 26 May 2025 07:57:53 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 26 May 2025 07:57:53 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.44)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 26 May 2025 07:57:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xkEO3sGH2cwe3Ma6ImFTqp3oOvhT+yUev1cjBtJlX8tdoLL1RFu0BDZN8E9Bo0BgFEF31NzCkvomgR26zI8V2hsN0jiO314WKK1avpyW/yaS3pnnxoSgTMoOONa5dv+KMdsPHIbWRo5w/IytpNdt4NujD4YuUnbC2Y1Q75J5wlx/KC+g7zvZker+T4yaT3xeVzj20zjSs/xTfLpcwqg+pz/sUXFsU2Im6AoRtPjd+NFDzTpG635w4yCO8hJLMR78jNQmF9vc7nfTa1S1pV4nfYFv7MNWBmlg0g1j46w27M4lkAswXv1sNDRsk3kALxqtLmMcGDzLpwPi/MmrcoEppQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3423Ep34QtzUJaKMfYMXn99hWNV9oJ/tK4vssXR8Mls=;
 b=sW6UJaEpVuOdLWvnPCN3iNnAx6e5VGDUAXWqe3Venh6YE/pPpyvgSn93DM70AxObgDJc2WYwmI490LofBgC7Bt9fzZ3f3o0MTZbUBIW4YRM9kRKy58GfskezXgtWisPAKlJ9Lo/CFDFDgyMg6a6/DC2a6E/94ltBsYDJFrjs9JIfYlmB5ns1LFj43MxhjW4tP7VyyiGSRk9oegCtMiie4PQbWUpiJ21OrxfR6KzOqU6R81ti3SGxtpIrIt7/ilyWJq7d7AokGt65438X56ItYsVHPvteIAdPRKFy2czRVZpCd6AQV+0/lC5tRhqw1OM91Igjrd2vm3hRt1T5RuGz1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SA0PR11MB4640.namprd11.prod.outlook.com (2603:10b6:806:9b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Mon, 26 May
 2025 14:57:27 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.8769.022; Mon, 26 May 2025
 14:57:27 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Stuart
 Summers" <stuart.summers@intel.com>, Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH 2/2] drm/xe: Unify the initialization of VRAM regions
Date: Mon, 26 May 2025 16:56:47 +0200
Message-ID: <20250526145647.1958756-3-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250526145647.1958756-1-piotr.piorkowski@intel.com>
References: <20250526145647.1958756-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VE1PR03CA0040.eurprd03.prod.outlook.com
 (2603:10a6:803:118::29) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SA0PR11MB4640:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c70b66a-86ca-4f8d-c3e9-08dd9c65a199
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bGozZ25KdzJBeDFZcXJ2MWwzRjdLMzA2a3dCNUp1RE1hdFhYOEYwU1BuRzZo?=
 =?utf-8?B?cG5URWVaUncrU1JXQ24rYk03azVGV09ESEJyb1JUWVpyaE5LcG5RczRJVk5X?=
 =?utf-8?B?VU0rR29iT1ZNWmhyYzJRNlQvWEcxQTRoT05ZTmNLckI3SHBodHJnUi9RTjl6?=
 =?utf-8?B?a0RQK0dmM1FFb1RDWVBwdEUxd1JkZDc0ZDVBRjJ0OU4rN1JieE9YSzc4MTNT?=
 =?utf-8?B?NGl3bTlFTzdTaXRUWTlHTVVSaU1VVTdIN2M1MWYxQnM0bmtqRnQycFYza2VN?=
 =?utf-8?B?WTF1bXNGZWhkb0UvK2grRTJrTWlaa0UvS2pGbUxDV0lLMTVvTXg0MzJDdzFi?=
 =?utf-8?B?dXB5RkYya0Jma0NyemFBaVZua0lsdzEzUHhYQVhWdUJ5dmhoNVNNbEhTeXZ5?=
 =?utf-8?B?REUzaEJqUVR2VjNFR0V5Q0lkNisvSS93bTQwemtld0Nva2w4WVBYNVM1L2tr?=
 =?utf-8?B?OGZOeVN5ZHRzUWp6VllOcWZhN0hna0N2Nms0UDNWd3dQMWVYcFZKRlYrZHNx?=
 =?utf-8?B?TlV0b1lQalREY1ZJUjdFQlhtUE9KOWtmSUpGUHFEY3NOT1pvcDVwcFdtYjkv?=
 =?utf-8?B?WmE1N1A5Z0JIU0szSDkyZENydHMva1R3LzBSdG5sR25mSURmYzJidXNXNEp2?=
 =?utf-8?B?Yy9MME1IQTF3a2REQmU0aGFmaWt2TmFOYnNRY09aQW1GSXNNOGM0MmNwdmpR?=
 =?utf-8?B?TTRnRmN4MEdEVG9INkpnU0Z2RXFWRUsxcGlVczcrbERkMEM0NlkzR002QVRv?=
 =?utf-8?B?cGplaFFnREZxbjU0VFlsdUcrdmJmVllOeUNuMnNPWXdVbFhDSTFtcklKcDd1?=
 =?utf-8?B?M3JZWnVlNSsvQW85ZmlyQmt2RDBQMENWNCtmOW5NUDRESXY2L2hZWXFBakZ3?=
 =?utf-8?B?RHZUMmlMWiszRSt3N0JWcHZKekUrTGYvc1JxbVRHRlRmaTBWanNlcVh1QURX?=
 =?utf-8?B?TGxNZEpmZG1ib1VnZFJEWEVBcWVUMmNYd0VxZ0dwelpFRXA1ZGpPVXVBUWJj?=
 =?utf-8?B?dWk3VnBpdXR6dVczVEVmM01DK1RaRUJ1c1ovRjVrM2Q3OTEvVW5UeEFlL0pZ?=
 =?utf-8?B?akhLYzBmall5elpoSFhXbS9HQmlweE4wNm5iZEg4Zll5NngrMTgvYUROeDh0?=
 =?utf-8?B?UFVydzY5RVBYUFYrSTVJQWhTcFBMaFlwa0EwaHA3WlM3bE9oT2VnMVhSVlRl?=
 =?utf-8?B?OVhrcWUrRzhuVHlYYUV2c1VmNHpGazVJUXRWRWIzc1pJY3czOXdaVEpjWDhq?=
 =?utf-8?B?K3piZWE2aWtMZkx1NGxwZ1NaWWFXTG9heEdFOEc1ZVNSR0xVMGpRVXFuc2p0?=
 =?utf-8?B?OHd0YWdleDNaanZWa3cvQTZmY0h4MEYxL2VIYWpINGhLZHoxSWt3Tlk2VndL?=
 =?utf-8?B?Tkt6aHRFL3Z2UE5FY0Ftbkw4WkFJUTlrRS96SktRRTZnMTI3YkMyTkN1OWM4?=
 =?utf-8?B?U29LOTBWT3NTbmxkSlFyWkZFM0hqeXdBQ0d3eWthYnR5SXovTFVWZlBUZGNH?=
 =?utf-8?B?alc0R2tZQ2xkTEpZRW43dmpDUEZrVW81blBiNHpxR3ZuaGtVWkhVZ2s3YWJ2?=
 =?utf-8?B?eWRvZXhtckJaRTQ3b2I5eGsvMzZMdVp4WHlKZnRla3BvRW9ndzVhdFBFYlVy?=
 =?utf-8?B?dUQ3T2Y2ZTRraEhPOVBwUGp6eFkwdHF4RVdvM0xDK2I5OEJIbVNnV05CdThR?=
 =?utf-8?B?UmpGNnpPYlM5L2FKUXRHeGlzZDdwUGZtYndNRzROWFJrVTlqQVExOGRiNHd5?=
 =?utf-8?B?cXEwRS8vNDZ4Q3ZBOFNpY1hKbGRsT2xRSmZFU3Z2Skh3aFgxMkJYYUtkdzkv?=
 =?utf-8?B?Nkh5b1A3ZmFRTXFDcmhPVHBzbWZvMUNaVDF4TVppTE9ySmFLY3NOZzRCRXhl?=
 =?utf-8?B?U3B5MkRMY2R6Vk9QamtVVDM3L0xmSmZrUzlreVZIY0w2NThwN0VNU3N6b0I4?=
 =?utf-8?Q?QZpuM153myg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aHJiOTErenhsZ2hwTlAxcEZwNVRoUDUwZU9FVU5nOTBFdGc5ZzEzSEFxeU1Q?=
 =?utf-8?B?b2YrTENmS2VnM3R0TEVoM1UvN0tGQjlVbTA0dzdpekFZNk96dy80cDMzS2lW?=
 =?utf-8?B?eTQ0L3dDZDVDSWNUMk1zVXpoUWdGSFhBUlJadjJyekJTNEtLM1JLN1RQdDZN?=
 =?utf-8?B?dzQ3QS9UWHdQZHhoVXNjblFIbFJMWmgvZlNOc1hKcnVndnFCV1BSSTV0Ylk4?=
 =?utf-8?B?T0R1TWJocWV0YW84Ry94bWt5bzZCOFNuZ2t4SFJzRmoxWUVuMzRUOTI1dFVq?=
 =?utf-8?B?MjlHVEIvR3QwYWFCOGdXOWhWSVlJZS9ybWdmdFdMWFoxVHFDU2EwL05hWEVp?=
 =?utf-8?B?a2F0aUZCd2M5L01IRGg2dnVaTDdIVmFTTHBvNVpmYUc4N3BDRk01VFlKUEUy?=
 =?utf-8?B?VmEwdDBVUHIxVTBjK08rRDdsUW5DakJXcE05ZmJkelVQVlkrcnpBdHFWUjBh?=
 =?utf-8?B?Uk52RXg0M3UwVyt0MUJaM20vTDRXeUxvUlYzaE9mNGtzWExnRjdicHFLcE9R?=
 =?utf-8?B?VUFaRDc2ck9nRHkwcXBJeGhPazBwcEZDSDA4QVN2NW9pN3BVbUNWWFcwVUts?=
 =?utf-8?B?MnZLN3ZzTEZkYys1Z1pOSkQrejZIV1llRWh3VjVRcUdGQlRydzJmK01wUFNV?=
 =?utf-8?B?WVQ3N3lkQTF2SXo4RHRTdlVwUVpHRXhOTHh0YWVjbENQUzYzMWQ5SitOaWho?=
 =?utf-8?B?aGJOelQ0SVdHZVVOL2NNNC9ORDNPOXp6U1RMbEkybTZEOXNab01XQ01SeTYx?=
 =?utf-8?B?Rm5vL0ZFODMvc0QxR1FRc2lHUU9JajBRNDAvVzZ3TEJLMzdFNU5meTRXYzN6?=
 =?utf-8?B?N05TRjNxM2ZpcWFZNGErQ1RVOTJGdDJlem1xdERCUGFDdzQvdTB0TThNZ1Vt?=
 =?utf-8?B?TFRvdWlOTWcvTkhHQ0s5dXJ6blZGTmtmOHR0UUNWSkI3dHhvWmY4V09WbzBE?=
 =?utf-8?B?RU5zVzlwc21QSjRKLzU0d2Z4cEtISXBoVk9nUlhrSC9INjUramo0S2drYitk?=
 =?utf-8?B?cGtxNGx0UUcxL1dLMGlIenk3NUZOMFo0M3M4V2V1TklsdmdyTFlubWhiRjk5?=
 =?utf-8?B?SGFoZ2krQWxXRWZKcmhXMEFWME14OXNSeTZPcXNJdHBYYXdLcXdKUUIxVGF4?=
 =?utf-8?B?Mk82bU5kZFNWVENJaXZHbGMwMGREWXUvZWZCV3VpNEw5YnBPSmRMb2RPZTRD?=
 =?utf-8?B?NTNZWXV1ZmRKNnFmZXA0MHZ0Wng1R0V5MFRTR0JDa1hnSGFTSUVncTJMUk1I?=
 =?utf-8?B?bldUNE9NSEtqUjJYT0hqQTVubkpxVzVTWFRGV2tONnFYTHRkM1lUWkZmcTIx?=
 =?utf-8?B?QjhIcTgxeXl0VURXc0l6MW51ZUtKam56d1p4L3lNMmlQYTJReFdBWGZ6amtH?=
 =?utf-8?B?U3c4Um1IQUpGa2hnY1VuUEFSL2VGY2pROXdWTkJ4d1lIbEo2bzUrQlU2VlEw?=
 =?utf-8?B?NW5VZFluLzdDaVNaSVB2VXNvQkp5eUFlVkFwaVo5Zzl3eVlHbXpRRkg4UzNk?=
 =?utf-8?B?WlpUVWxZcEpHN0p3a3FwZHVndU9kNVFvRWxZMFJsSnV0OEVtcENSaFVyQ0xw?=
 =?utf-8?B?U0piUm1aRkllOElNSzZKQ2VRZmhvZTl6c0c0VSs4dWZ4bmtEak9vcG9tZmNR?=
 =?utf-8?B?VVBFeTk4SnJGVEJBR3c4eE5jQTErdzBvTTB2TFp1b3NNRFkrREduWDdBYVJQ?=
 =?utf-8?B?cWQyeUplb2d3OHhmUXQ3bHo0UFBRaUd0L0wrcDRJY3dBZGtHOVJMNk1VMFVC?=
 =?utf-8?B?K2FQNXlJa3lhUzBUeC9oRHVqTDhMVTA2Zi94dDdHcHhLRWEzSDNCSDhab0Zy?=
 =?utf-8?B?MnV4QldCWGRqV2N6dlRsN1BKblBkL0NwamE5U3lOZmtOM2ZMQysrUWdNZEc4?=
 =?utf-8?B?bDE3TERVek14UzlGand6d3h3NlhZazlEZzdYd3NmUmN2d0dGVWkwSmZvUjNG?=
 =?utf-8?B?ZmxKbG1WRHh3Sk5FUlVacVhlWWdNSk50b1NWbFVOdGJhem04L2ZJaU52cGpI?=
 =?utf-8?B?dmFyNGtWY2kxdEhzV0Q3ZzV1a3YxM2kyZmhJM2ZIdGlPKzNLUHZsVS9TSTNu?=
 =?utf-8?B?SmlzY1VvUEVDWW0rb3BOOGw5eTN6Rmx0WnlvSUVCQ1FrbDBSalhidERDSW05?=
 =?utf-8?B?eWFDYjVvRjZZMElGL0N0SlQzOWtkSWdjbVZYVEYwRTRYbWhHY1JmZVhvMXU2?=
 =?utf-8?B?blE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c70b66a-86ca-4f8d-c3e9-08dd9c65a199
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 14:57:27.5531 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YVJIOOrlPEmlujzoGvzW3oZ9SEr7mQc2kaunOYTLh+PrK5xByvlZBt5lpqP9ZuakxjZGSd9I4tv1IetCpOYKA9laDJJLALEmdF8k2MTjeSk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4640
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

Currently in the drivers we have defined VRAM regions per device and per
tile. Initialization of these regions is done in two completely different
ways. To simplify the logic of the code and make it easier to add new
regions in the future, let's unify the way we initialize VRAM regions.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Stuart Summers <stuart.summers@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       |   4 +
 drivers/gpu/drm/xe/xe_device_types.h |   8 ++
 drivers/gpu/drm/xe/xe_gt_pagefault.c |   4 +-
 drivers/gpu/drm/xe/xe_query.c        |   2 +-
 drivers/gpu/drm/xe/xe_tile.c         |  30 +----
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c |  16 ++-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.h |   3 +-
 drivers/gpu/drm/xe/xe_vram.c         | 175 ++++++++++++++++++---------
 drivers/gpu/drm/xe/xe_vram.h         |   5 +
 9 files changed, 154 insertions(+), 93 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index a80e892d6959..9793f1a6dab8 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -862,6 +862,10 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
+	err = xe_vram_init_regions_managers(xe);
+	if (err)
+		return err;
+
 	for_each_tile(tile, xe, id) {
 		err = xe_tile_init_noalloc(tile);
 		if (err)
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 911afac994bc..2c2c47997029 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -25,6 +25,7 @@
 #include "xe_step_types.h"
 #include "xe_survivability_mode_types.h"
 #include "xe_ttm_vram_mgr_types.h"
+#include "xe_vram.h"
 
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
 #define TEST_VM_OPS_ERROR
@@ -78,6 +79,11 @@ struct xe_pxp;
 struct xe_vram_region {
 	/** @tile: Backpointer to tile */
 	struct xe_tile *tile;
+	/** @id: VRAM region instance id
+	 *
+	 * The value should be unique for VRAM region.
+	 */
+	u8 id;
 	/** @io_start: IO start address of this VRAM instance */
 	resource_size_t io_start;
 	/**
@@ -110,6 +116,8 @@ struct xe_vram_region {
 	void __iomem *mapping;
 	/** @ttm: VRAM TTM manager */
 	struct xe_ttm_vram_mgr ttm;
+	/** @placement: TTM placement dedicated for this region */
+	u32 placement;
 #if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
 	/** @pagemap: Used to remap device memory as ZONE_DEVICE */
 	struct dev_pagemap pagemap;
diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 7a8f87709e39..51d88cdb693e 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -138,7 +138,7 @@ static int handle_vma_pagefault(struct xe_gt *gt, struct xe_vma *vma,
 	/* Lock VM and BOs dma-resv */
 	drm_exec_init(&exec, 0, 0);
 	drm_exec_until_all_locked(&exec) {
-		err = xe_pf_begin(&exec, vma, atomic, tile->id);
+		err = xe_pf_begin(&exec, vma, atomic, (tile->mem.vram) ? tile->mem.vram->id : 0);
 		drm_exec_retry_on_contention(&exec);
 		if (xe_vm_validate_should_retry(&exec, err, &end))
 			err = -EAGAIN;
@@ -575,7 +575,7 @@ static int handle_acc(struct xe_gt *gt, struct acc *acc)
 	/* Lock VM and BOs dma-resv */
 	drm_exec_init(&exec, 0, 0);
 	drm_exec_until_all_locked(&exec) {
-		ret = xe_pf_begin(&exec, vma, true, tile->id);
+		ret = xe_pf_begin(&exec, vma, true, (tile->mem.vram) ? tile->mem.vram->id : 0);
 		drm_exec_retry_on_contention(&exec);
 		if (ret)
 			break;
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 99189d15d4a5..a3b59949e31e 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -409,7 +409,7 @@ static int query_gt_list(struct xe_device *xe, struct drm_xe_device_query *query
 			gt_list->gt_list[id].near_mem_regions = 0x1;
 		else
 			gt_list->gt_list[id].near_mem_regions =
-				BIT(gt_to_tile(gt)->id) << 1;
+				BIT(gt_to_tile(gt)->mem.vram->id) << 1;
 		gt_list->gt_list[id].far_mem_regions = xe->info.mem_region_mask ^
 			gt_list->gt_list[id].near_mem_regions;
 
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index 8303ebd90099..7beb87124f3b 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -7,6 +7,7 @@
 
 #include <drm/drm_managed.h>
 
+#include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_ggtt.h"
 #include "xe_gt.h"
@@ -18,6 +19,7 @@
 #include "xe_tile_sysfs.h"
 #include "xe_ttm_vram_mgr.h"
 #include "xe_wa.h"
+#include "xe_vram.h"
 
 /**
  * DOC: Multi-tile Design
@@ -115,11 +117,9 @@ int xe_tile_alloc_vram(struct xe_tile *tile)
 	if (!IS_DGFX(xe))
 		return 0;
 
-	vram = drmm_kzalloc(&xe->drm, sizeof(*vram), GFP_KERNEL);
-	if (!vram)
-		return -ENOMEM;
-
-	vram->tile = tile;
+	vram = xe_vram_region_alloc(xe, tile->id, XE_PL_VRAM0 + tile->id);
+	if (IS_ERR(vram))
+		return PTR_ERR(vram);
 	tile->mem.vram = vram;
 
 	return 0;
@@ -157,21 +157,6 @@ int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id)
 }
 ALLOW_ERROR_INJECTION(xe_tile_init_early, ERRNO); /* See xe_pci_probe() */
 
-static int tile_ttm_mgr_init(struct xe_tile *tile)
-{
-	struct xe_device *xe = tile_to_xe(tile);
-	int err;
-
-	if (tile->mem.vram->usable_size) {
-		err = xe_ttm_vram_mgr_init(tile, &tile->mem.vram->ttm);
-		if (err)
-			return err;
-		xe->info.mem_region_mask |= BIT(tile->id) << 1;
-	}
-
-	return 0;
-}
-
 /**
  * xe_tile_init_noalloc - Init tile up to the point where allocations can happen.
  * @tile: The tile to initialize.
@@ -189,11 +174,6 @@ static int tile_ttm_mgr_init(struct xe_tile *tile)
 int xe_tile_init_noalloc(struct xe_tile *tile)
 {
 	struct xe_device *xe = tile_to_xe(tile);
-	int err;
-
-	err = tile_ttm_mgr_init(tile);
-	if (err)
-		return err;
 
 	xe_wa_apply_tile_workarounds(tile);
 
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index d9afe0e22071..3a9780d39c65 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -337,12 +337,18 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
 	return drmm_add_action_or_reset(&xe->drm, ttm_vram_mgr_fini, mgr);
 }
 
-int xe_ttm_vram_mgr_init(struct xe_tile *tile, struct xe_ttm_vram_mgr *mgr)
+/**
+ * xe_ttm_vram_mgr_init - initialize TTM VRAM region
+ * @xe: pointer to Xe device
+ * @vram: pointer to xe_vram_region that contains the memory region attributes
+ *
+ * Initialize the Xe TTM for given @vram region using the given parameters.
+ *
+ * Returns 0 for success, negative error code otherwise.
+ */
+int xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_vram_region *vram)
 {
-	struct xe_device *xe = tile_to_xe(tile);
-	struct xe_vram_region *vram = tile->mem.vram;
-
-	return __xe_ttm_vram_mgr_init(xe, mgr, XE_PL_VRAM0 + tile->id,
+	return __xe_ttm_vram_mgr_init(xe, &vram->ttm, vram->placement,
 				      vram->usable_size, vram->io_size,
 				      PAGE_SIZE);
 }
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
index cc76050e376d..47422873c324 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
@@ -6,6 +6,7 @@
 #ifndef _XE_TTM_VRAM_MGR_H_
 #define _XE_TTM_VRAM_MGR_H_
 
+#include "xe_device_types.h"
 #include "xe_ttm_vram_mgr_types.h"
 
 enum dma_data_direction;
@@ -15,7 +16,7 @@ struct xe_tile;
 int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
 			   u32 mem_type, u64 size, u64 io_size,
 			   u64 default_page_size);
-int xe_ttm_vram_mgr_init(struct xe_tile *tile, struct xe_ttm_vram_mgr *mgr);
+int xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_vram_region *vram);
 int xe_ttm_vram_mgr_alloc_sgt(struct xe_device *xe,
 			      struct ttm_resource *res,
 			      u64 offset, u64 length,
diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index 18124a5fb291..5f68fe4d414a 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -19,6 +19,7 @@
 #include "xe_mmio.h"
 #include "xe_module.h"
 #include "xe_sriov.h"
+#include "xe_ttm_vram_mgr.h"
 #include "xe_vram.h"
 
 #define BAR_SIZE_SHIFT 20
@@ -136,7 +137,7 @@ static bool resource_is_valid(struct pci_dev *pdev, int bar)
 	return true;
 }
 
-static int determine_lmem_bar_size(struct xe_device *xe)
+static int determine_lmem_bar_size(struct xe_device *xe, struct xe_vram_region *lmem_bar)
 {
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 
@@ -147,16 +148,16 @@ static int determine_lmem_bar_size(struct xe_device *xe)
 
 	resize_vram_bar(xe);
 
-	xe->mem.vram->io_start = pci_resource_start(pdev, LMEM_BAR);
-	xe->mem.vram->io_size = pci_resource_len(pdev, LMEM_BAR);
-	if (!xe->mem.vram->io_size)
+	lmem_bar->io_start = pci_resource_start(pdev, LMEM_BAR);
+	lmem_bar->io_size = pci_resource_len(pdev, LMEM_BAR);
+	if (!lmem_bar->io_size)
 		return -EIO;
 
 	/* XXX: Need to change when xe link code is ready */
-	xe->mem.vram->dpa_base = 0;
+	lmem_bar->dpa_base = 0;
 
 	/* set up a map to the total memory area. */
-	xe->mem.vram->mapping = ioremap_wc(xe->mem.vram->io_start, xe->mem.vram->io_size);
+	lmem_bar->mapping = ioremap_wc(lmem_bar->io_start, lmem_bar->io_size);
 
 	return 0;
 }
@@ -287,6 +288,92 @@ static void vram_fini(void *arg)
 		tile->mem.vram->mapping = NULL;
 }
 
+struct xe_vram_region *xe_vram_region_alloc(struct xe_device *xe, u8 id, u32 placement)
+{
+	struct xe_vram_region *vram;
+	struct drm_device *drm = &xe->drm;
+
+	xe_assert(xe, id < xe->info.tile_count);
+
+	vram = drmm_kzalloc(drm, sizeof(*vram), GFP_KERNEL);
+	if (!vram)
+		return NULL;
+
+	vram->id = id;
+	vram->placement = placement;
+	vram->tile = &xe->tiles[id];
+
+	return vram;
+}
+
+static void print_vram_region_info(struct xe_device *xe, struct xe_vram_region *vram)
+{
+	struct drm_device *drm = &xe->drm;
+
+	if (vram->io_size < vram->usable_size)
+		drm_info(drm, "Small BAR device\n");
+
+	drm_info(drm,
+		 "VRAM[%u]: Actual physical size %pa, usable size exclude stolen %pa, CPU accessible size %pa\n",
+		 vram->id, &vram->actual_physical_size, &vram->usable_size, &vram->io_size);
+	drm_info(drm, "VRAM[%u]: DPA range: [%pa-%llx], io range: [%pa-%llx]\n",
+		 vram->id, &vram->dpa_base, vram->dpa_base + (u64)vram->actual_physical_size,
+		 &vram->io_start, vram->io_start + (u64)vram->io_size);
+}
+
+static int vram_region_init(struct xe_device *xe, struct xe_vram_region *vram,
+			    struct xe_vram_region *lmem_bar, u64 offset, u64 usable_size,
+			    u64 region_size, resource_size_t remain_io_size)
+{
+	/* Check if VRAM region is already initialized */
+	if (vram->mapping)
+		return 0;
+
+	vram->actual_physical_size = region_size;
+	vram->io_start = lmem_bar->io_start + offset;
+	vram->io_size = min_t(u64, usable_size, remain_io_size);
+
+	if (!vram->io_size) {
+		drm_err(&xe->drm, "Tile without any CPU visible VRAM. Aborting.\n");
+		return -ENODEV;
+	}
+
+	vram->dpa_base = lmem_bar->dpa_base + offset;
+	vram->mapping = lmem_bar->mapping + offset;
+	vram->usable_size = usable_size;
+
+	print_vram_region_info(xe, vram);
+
+	return 0;
+}
+
+/**
+ * xe_vram_init_regions_managers - Init all VRAM TTM managers.
+ * @xe: the &xe_device
+ *
+ * Return: 0 on success, error code on failure
+ */
+int xe_vram_init_regions_managers(struct xe_device *xe)
+{
+	struct xe_tile *tile;
+	u8 id;
+	int err;
+
+	if (!IS_DGFX(xe))
+		return 0;
+
+	for_each_tile(tile, xe, id) {
+		if (!ttm_resource_manager_used(&tile->mem.vram->ttm.manager)) {
+			err = xe_ttm_vram_mgr_init(xe, tile->mem.vram);
+			if (err)
+				return err;
+			xe->info.mem_region_mask |= BIT(tile->mem.vram->id) << 1;
+		}
+	}
+
+	return 0;
+}
+
 /**
  * xe_vram_probe() - Probe VRAM configuration
  * @xe: the &xe_device
@@ -298,82 +385,52 @@ static void vram_fini(void *arg)
 int xe_vram_probe(struct xe_device *xe)
 {
 	struct xe_tile *tile;
-	resource_size_t io_size;
+	struct xe_vram_region lmem_bar;
+	resource_size_t remain_io_size;
 	u64 available_size = 0;
 	u64 total_size = 0;
-	u64 tile_offset;
-	u64 tile_size;
-	u64 vram_size;
 	int err;
 	u8 id;
 
 	if (!IS_DGFX(xe))
 		return 0;
 
-	/* Get the size of the root tile's vram for later accessibility comparison */
-	tile = xe_device_get_root_tile(xe);
-	err = tile_vram_size(tile, &vram_size, &tile_size, &tile_offset);
+	err = determine_lmem_bar_size(xe, &lmem_bar);
 	if (err)
 		return err;
+	drm_info(&xe->drm, "VISIBLE VRAM: %pa, %pa\n", &lmem_bar.io_start, &lmem_bar.io_size);
 
-	err = determine_lmem_bar_size(xe);
-	if (err)
-		return err;
+	remain_io_size = lmem_bar.io_size;
 
-	drm_info(&xe->drm, "VISIBLE VRAM: %pa, %pa\n", &xe->mem.vram->io_start,
-		 &xe->mem.vram->io_size);
-
-	io_size = xe->mem.vram->io_size;
-
-	/* tile specific ranges */
 	for_each_tile(tile, xe, id) {
-		err = tile_vram_size(tile, &vram_size, &tile_size, &tile_offset);
+		u64 region_size;
+		u64 usable_size;
+		u64 tile_offset;
+
+		err = tile_vram_size(tile, &usable_size, &region_size, &tile_offset);
 		if (err)
 			return err;
 
-		tile->mem.vram->actual_physical_size = tile_size;
-		tile->mem.vram->io_start = xe->mem.vram->io_start + tile_offset;
-		tile->mem.vram->io_size = min_t(u64, vram_size, io_size);
+		total_size += region_size;
+		available_size += usable_size;
 
-		if (!tile->mem.vram->io_size) {
-			drm_err(&xe->drm, "Tile without any CPU visible VRAM. Aborting.\n");
-			return -ENODEV;
-		}
+		err = vram_region_init(xe, tile->mem.vram, &lmem_bar, tile_offset, usable_size,
+				       region_size, remain_io_size);
+		if (err)
+			return err;
 
-		tile->mem.vram->dpa_base = xe->mem.vram->dpa_base + tile_offset;
-		tile->mem.vram->usable_size = vram_size;
-		tile->mem.vram->mapping = xe->mem.vram->mapping + tile_offset;
-
-		if (tile->mem.vram->io_size < tile->mem.vram->usable_size)
-			drm_info(&xe->drm, "Small BAR device\n");
-		drm_info(&xe->drm,
-			 "VRAM[%u, %u]: Actual physical size %pa, usable size exclude stolen %pa, CPU accessible size %pa\n",
-			 id, tile->id, &tile->mem.vram->actual_physical_size,
-			 &tile->mem.vram->usable_size, &tile->mem.vram->io_size);
-		drm_info(&xe->drm, "VRAM[%u, %u]: DPA range: [%pa-%llx], io range: [%pa-%llx]\n",
-			 id, tile->id, &tile->mem.vram->dpa_base,
-			 tile->mem.vram->dpa_base + (u64)tile->mem.vram->actual_physical_size,
-			 &tile->mem.vram->io_start,
-			 tile->mem.vram->io_start + (u64)tile->mem.vram->io_size);
-
-		/* calculate total size using tile size to get the correct HW sizing */
-		total_size += tile_size;
-		available_size += vram_size;
-
-		if (total_size > xe->mem.vram->io_size) {
+		if (total_size > lmem_bar.io_size) {
 			drm_info(&xe->drm, "VRAM: %pa is larger than resource %pa\n",
-				 &total_size, &xe->mem.vram->io_size);
+				 &total_size, &lmem_bar.io_size);
 		}
 
-		io_size -= min_t(u64, tile_size, io_size);
+		remain_io_size -= min_t(u64, tile->mem.vram->actual_physical_size, remain_io_size);
 	}
 
-	xe->mem.vram->actual_physical_size = total_size;
-
-	drm_info(&xe->drm, "Total VRAM: %pa, %pa\n", &xe->mem.vram->io_start,
-		 &xe->mem.vram->actual_physical_size);
-	drm_info(&xe->drm, "Available VRAM: %pa, %pa\n", &xe->mem.vram->io_start,
-		 &available_size);
+	err = vram_region_init(xe, xe->mem.vram, &lmem_bar, 0, available_size, total_size,
+			       lmem_bar.io_size);
+	if (err)
+		return err;
 
 	return devm_add_action_or_reset(xe->drm.dev, vram_fini, xe);
 }
diff --git a/drivers/gpu/drm/xe/xe_vram.h b/drivers/gpu/drm/xe/xe_vram.h
index e31cc04ec0db..4453d2ecc249 100644
--- a/drivers/gpu/drm/xe/xe_vram.h
+++ b/drivers/gpu/drm/xe/xe_vram.h
@@ -6,8 +6,13 @@
 #ifndef _XE_VRAM_H_
 #define _XE_VRAM_H_
 
+#include <linux/types.h>
+
 struct xe_device;
+struct xe_vram_region;
 
+struct xe_vram_region *xe_vram_region_alloc(struct xe_device *xe, u8 id, u32 placement);
+int xe_vram_init_regions_managers(struct xe_device *xe);
 int xe_vram_probe(struct xe_device *xe);
 
 #endif
-- 
2.34.1

