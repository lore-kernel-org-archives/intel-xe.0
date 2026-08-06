Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25911C55ABF
	for <intel-xe@archiver.kernel.org>; Thu,  6 Aug 2026 14:17:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2C5B10E261;
	Thu,  6 Aug 2026 14:17:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n+juASJK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D137E10E261
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Aug 2026 14:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786025838; x=1817561838;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=hzJKML6PUfb7zNgRWdIcRLED1AhGUJXm2wruxqDA3/o=;
 b=n+juASJK+60uGT1hrDFQjLAlTes3dVNZnETha9nE+DY6haX1hRb3GKEY
 FMgPW4Wh8AxBayfcXHSoWYDNcZ+/3m2AbJye+kSzcnBlWezJpLMJqEMBJ
 wozG/dgW8zD8wq5E/bjZh27cgR3YdXN6nTODMUZW+d2RbzQGUZZhtKN/H
 yRnjqmtZjKSZlZ46HbqelHJG8v7P/rAYFavHn2erd99JajXmrG260+SBR
 whXidv6Hr76Guj56R6xoOWiQipX5S4Fes2nmTmSOZknUFex10v66XiqAF
 0Uj/bwSOA9/fXW4AKjWlkt6L/CCUxUbWRI4ZGcDO0uEDXXIUranyhVGjD Q==;
X-CSE-ConnectionGUID: 1EcaFzNVSHqvCM+L5qvQ3w==
X-CSE-MsgGUID: D471vjb4RSaTcHvkp7GzTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="90439282"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; d="scan'208";a="90439282"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 07:17:17 -0700
X-CSE-ConnectionGUID: CMDujL2nRhagEG10Q5h6NA==
X-CSE-MsgGUID: 66hseaEMSnWvgRoj/W7XIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; d="scan'208";a="262195748"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 07:17:18 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 6 Aug 2026 07:17:16 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 6 Aug 2026 07:17:16 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.50) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 6 Aug 2026 07:17:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g6nDqrOMzVgJnxopLOWuqzJwiG8LXWpOpoTf7n24KAVwpLddAAa92nO/90G8mgyd1eQcJ0+zokmJr0USrZgaLL2q+OyWDW784Gz1UAUV4OGbmgBCYR/bsOkbp3qxRSCXhH6fWAXZ642cklXNCDWSppXCO8yQ/Y068kg2j35PlsBQ3uXNywexMQrSIN9HgwqQI9zSnxujFbU6Y6cvGh5Rxj6f+qMNR3j+9upAIK7akH/3JDQnC4Sz25HAgAyexQ+UB0kOynqZavlAKYaOkK9+mD9SibRsV9m4Wt5F0HHXxWSpvYeCvR5rJ1srhDOCHKnDtDndpWthc6nCJOngGfHQbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B7lR+5tTwtRW9H+DQf+mhA5fDYug/IQjjLexVlHhxWI=;
 b=bmknGMIrBu+qoI7J3j5W2NCfQpguORQP8cTH+/jYTipmVTpt0G8pfl++Xy5DiT0ZMq4Zt0nXjj9mFTTbPdINxGUSRI/zPD6gdZDJUbef2m61r2lQyOT5n4zwrjvyAXmLEujwVaSP+b5wUaG+oScJYkbBryWpSJOFoY6YhRgbePjTsWJWoeruHaVEUxt7JBebIJJYj22N+TEmfUK+t1AA563Y6eGtvkB0wczr9PXbjUCHSCUxWN2zyvsXT9oHKUmpS3PcSiQqwXVPnLueh4ttggJEnD2FztX1qaENmNTrVesqkcCaL2obirBhM82QvbteSfJOJJ1rcfVG5jBs4BiBgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by PH7PR11MB5914.namprd11.prod.outlook.com (2603:10b6:510:138::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.20; Thu, 6 Aug
 2026 14:17:08 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0292.018; Thu, 6 Aug 2026
 14:17:08 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
Subject: [PATCH v1 3/3] drm/xe/ggtt: Add KUnit tests for usable and shareable
 pools
Date: Thu, 6 Aug 2026 16:16:40 +0200
Message-ID: <20260806141640.186830-4-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260806141640.186830-1-piotr.piorkowski@intel.com>
References: <20260806141640.186830-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU7P191CA0019.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:54e::33) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|PH7PR11MB5914:EE_
X-MS-Office365-Filtering-Correlation-Id: dd75d4d4-264d-4976-6029-08def3c56622
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|11063799006|56012099006|10067099003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: V1lTt5ULJSa+gf3vQJOGru4985N6yTKI7jE/OcfFadpTSkYpiHFHYyrV2MrP5Aicn+XUj3MMO8kZ8aFNDx6zDJbBEDDT9SmivV0DgbRpoWXoSG+atDvZAXq/rzwdjFfKHkqVCzSRSkGjlplPTwlxjcuTpn4F43Nqr+Hgv9GzoWAmDoadmJYZH0MwVjXymHbtwMI1N5CeSQf9fwDS5n/Q6Ee8Eb2mHARaxKJeRCHXlcI7SXoJdp48osxcu4sgvS5f5NCe9Usi3285ir0GvlpJ/SrQaSoNduZSXK+JQiNXZ+5pRqwXSxgpd0ZIw6AC0E5GGeAAXfCCANozPPrWlF3LbijuEL+NpFi0Def+d95o3AI6LAR1cl83lKXQz5Kvx/opARpW2gBscjz3gfHggdnJbAnpR83+tJZwtFuobyN9K9exbqqHKzUv9UC07EC8R+wZ8EQi+ZRegT84KEVWmWvMGn4k4sa5W0PVZWAGauAZMx0aEZP8JWqXRK7kE9hdH9mvBdLOckKjM3trVvTIaMhIOqMYb4wR/sYHmbdRy0grFzZxPFRSfYgr3XjG2x9Dt2RtRrwwOoIcohDOu0RzrdFEVJC84hpX96pBG775eRfl+bianUZLnk7Zfpw1zYnZ8QvS0vdbBLo++lDXxRi//q42ynxqzU4l8j2BUoNswkJ3Ujc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(11063799006)(56012099006)(10067099003)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TnhHUitndU1zcjhHOFQyV1dtbjhGWTBScjk4ajhMa0prclNzTTRQN3JvdUpV?=
 =?utf-8?B?NzlFN0RJTlNQMjkvcWlkdEx4T2hVS2hkdmpBWCtzMURZNW1NWWNOZk5sVTZ0?=
 =?utf-8?B?ZjREM2FUN01MdWlzdEpyc3RoMkhDbUFxUkpRU3kyTFZtUW8wR3ZueW5yQTBk?=
 =?utf-8?B?ZGlhRXcrbVVza2F2S1FzcEVNWk9ZNHFueHE3YTVZK2dBakZWRjVWajFZRU8w?=
 =?utf-8?B?OUhUa05CS3dqRnlNTzVzTWJJTDF2TDhFVThyOG9yblJWMjM4WHJWUkpBd05S?=
 =?utf-8?B?RmVBMmRjVElPb1hpMVZML0o3R3hEdzc3MGxwZWthVG0xdlVCZU91aGIvbk9i?=
 =?utf-8?B?VE5KT1RvTFU3dk1ZUVdYY2pSRStZMHFVSjBCVkVSWThNbEV6M2FDLzI1bmc5?=
 =?utf-8?B?Q1R4TTYvRlpJV1BwN0phQjltaG1DbERTc0gzV2I0cWRNV3N5KzdacDYrWElw?=
 =?utf-8?B?ZkxucWpoclJaZlJWdEMzTWhFQTdzMFNFRUtvbklhZkpIeGI0cS9VN1U0TWN3?=
 =?utf-8?B?dHVPSlFPeGVRMzR2bmNQQnMyNE41VzlWd1E0b2MxSUxrbTlxb0JaejJpUlVN?=
 =?utf-8?B?WHNBMXRVdy9TYzJKdTc4WndoVnV5Mko1SHlPQklLRFJxZWpseGNyZTBqODhK?=
 =?utf-8?B?cEEwTlptRHJQNnJiWGRDM1RxTWdwc0p0NURnKzlGc3ByczBKMHZlT0Q4TE5K?=
 =?utf-8?B?WWtUOVVmUXIxZ3VudHF1M3FCL0JxYi9kbXY0eUNtWjJaa0lrTDVIbFZIa2NQ?=
 =?utf-8?B?MjN1a3IzY2k3WGRqL3FjY2ZNQytpeE1FNzBLQ29Cb1Z0ZlptczlxWkc3UDl6?=
 =?utf-8?B?cEVxY3N5QjhQS3lpNlQ0SlhRaklWYUdSc3JCVDFEd1ZUcGRYMFdwZFJpOTBB?=
 =?utf-8?B?U3REVHp5UjY1TlNsVFgyeG9PQ0RFZTliMHFndXRLd28wbTZrQlBBTGNIK3ln?=
 =?utf-8?B?RlRxdmpEMVdTTldTSDVUM0tla1c2dWhIdy82cEtaT1R0NmZSbXEwTUl4aXFp?=
 =?utf-8?B?dGNvNnJwM1ZweUtuSXJySmVWc0E4OFhNSVpxcFNtZjV5aVpGTU9ZTDFFeGhp?=
 =?utf-8?B?ODNKbTN1Sk5nNnRtY2NRZ2pZdGJZczhEU3EvV1AyZFc1SGpabjNseEhwbnZX?=
 =?utf-8?B?YTgzS2VlL0xSVnN6RTZOTTFEaVcra0JTMXR0VFBSYWpycXovaTFYTDVmcjFv?=
 =?utf-8?B?eDBHVlhOdEd6U3liZUEvQW9weS85ZVRiK3Vpa2ZLL3V0VHBnSy9NVGFIYlVM?=
 =?utf-8?B?bG9hek0rZUczaEZDTUNuWUY4Njdvc2VET3Q5NmFtaU9zZ2lqSUVHNUlReHYv?=
 =?utf-8?B?dlNjNkRJODMvZXFtT0lKekdlcTNVZTBtS2lCVjdpcGhIWjdYQ3BWY0JIYkZW?=
 =?utf-8?B?ekFaalBuV3VsUWRhVytCZGVRejF0RE9YZGQ1cVNNYWZzQmI3Mkk1Unl3YXhk?=
 =?utf-8?B?MVNzazZYM21MbnRILzVkYzRZR3dsc0o4K1pDUTRrRWZFTHhxNDNJa2NpS0dl?=
 =?utf-8?B?QVdXU0c0ZmZsVmtwbkNwU3RTV2VMNS8vZ3lsYTZoRU9rMTVrekZoa2VrYTc1?=
 =?utf-8?B?K2d4SkNCajZKUDY3b09WTG5NR0pCYnBNRTJqZ3BYSk45RkFRSk5xRngxM1N4?=
 =?utf-8?B?UWxYTWIzRVRPUGR5Y0lzcjdEZ2w2emxBOTllS3VId2VWME4zMjQwN2xPNjc4?=
 =?utf-8?B?Z3hwQ2ozR1FXdnIzcmFibGZPLzQ4RDJnWVp6Sm5kNTc3TnkxSk55Zy9PNWZQ?=
 =?utf-8?B?Nm9BZ2NkOTVHKzdlcG05aXluVWFvZTJoWnZyd1oxcStXVldkeHhaSndTNE95?=
 =?utf-8?B?bnBNUkNDWm0rT3pPNE9mOE5Eb1R2a0JvTFVnQmxjeStLaGVzZ3BUNE9uM1pk?=
 =?utf-8?B?bjFNQW1SNms4Uy9oYXNHUjk0UVI1Zy9UV2h1WG44NUJXUHZtY25ZK1RPYmtE?=
 =?utf-8?B?Q3VrOEF3ODhDK3hPYVovNlhCcXFTK2NpRzhJYXFKeWs0Z24zN2ZRWEpwN1RM?=
 =?utf-8?B?UlhOa0VuNTdpakNRd1hjbStKMTk1K1NnR3hSN3BZRWxhSEVMYnVXWDl2R0tY?=
 =?utf-8?B?M01yTVBxcFRwNzlSYjh2OHUrUTh4NFhNOVg1Z2pMaS82dzVpczJYM0RJOGxj?=
 =?utf-8?B?WUh4L3JxMjlCb2ZyeEVaZ3lCdE9jQzNqczJmYjNsWW01emU4eVVBaHdrclM1?=
 =?utf-8?B?dG5rR0hZQlZkUEp3VEpkMkRLaFMwN3BjVG9WS1paQXFvb3VEOGk1eHp0YnBV?=
 =?utf-8?B?Ni9ZYVhmOHVtSUQzQWhSQklXc3RQallTcXQ1dFVWbEs2a0pLMXozZVhSdDdJ?=
 =?utf-8?B?d2pvaE1ycUd3TUQrenp5T1ZDY3QvbVhuR29HNDd3TFNQcEFBNmNoUk1Ed1Rt?=
 =?utf-8?Q?cQJCB+qAWgfcrQuY=3D?=
X-Exchange-RoutingPolicyChecked: mLoID6KOLkWba4rmZDknbpOSmLNQZlp0lx7Oh6qGyUn+RW0PmSPzlwLDnAxXCNKebgOpOaCRBOyEPKdp29PhLrraiH51IhFNga4bx0wQUU9QEndCS666M84pMmw6KjS5ANHZTerj1j6t6DCINVnMrcTFwtWdfOTc2rtPPD2jiEtMlXNtnNCRUqv2yRKCccumQzGh9cB+a5YnA5QZ4mXaa4SU+0RMFf2BJLnu15buofGqpzJOl+xyDe2+50zj9Q+qAGBy2NJIvsSq9HJh7ghHmSLSrLwHESlOO4vcszIQrDd7zIIbuxPvBCnZNfLYwRlSy/J4ujrSnoY9PtR2QMUEyQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: dd75d4d4-264d-4976-6029-08def3c56622
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 14:17:08.3515 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WJ46jS0bHk/0ydstvFgsUUA4KVt66mkhZA6XHQwtO3jNPQX4ENLZyl0UmPw/8Sib6u4kH5YO7Jt7s9sS2vWePCZOj/EakK4zjT6Xza7v3Y0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5914
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

Add GGTT KUnit tests focused on the newly introduced usable and
shareable pools.

Cover range initialization for native and PF modes, including partially
overlapping pools. Exercise allocation direction and conflicts between
the pools, as well as the unavailable shareable pool and requests
exceeding pool capacity.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_ggtt_test.c | 315 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ggtt.c            |   4 +
 2 files changed, 319 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_ggtt_test.c

diff --git a/drivers/gpu/drm/xe/tests/xe_ggtt_test.c b/drivers/gpu/drm/xe/tests/xe_ggtt_test.c
new file mode 100644
index 000000000000..c9b9dab058fb
--- /dev/null
+++ b/drivers/gpu/drm/xe/tests/xe_ggtt_test.c
@@ -0,0 +1,315 @@
+// SPDX-License-Identifier: GPL-2.0 AND MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include <kunit/test.h>
+
+#include "xe_device.h"
+#include "xe_kunit_helpers.h"
+
+#define GGTT_TEST_START		SZ_1M
+
+static int ggtt_test_init(struct kunit *test)
+{
+	xe_kunit_helper_xe_device_test_init(test);
+	return 0;
+}
+
+static void init_native(struct kunit *test)
+{
+	struct xe_tile *tile = xe_device_get_root_tile(test->priv);
+	struct xe_ggtt ggtt = { .tile = tile };
+	u64 accessible = ggtt_accessible_size(&ggtt);
+	u64 usable = min_t(u64, SZ_1G, accessible);
+
+	ggtt_init_ranges(&ggtt, GGTT_TEST_START, usable, 0);
+
+	KUNIT_EXPECT_EQ(test, ggtt.start, GGTT_TEST_START);
+	KUNIT_EXPECT_EQ(test, ggtt.size_usable, usable);
+	KUNIT_EXPECT_EQ(test, ggtt_total_size(&ggtt), usable);
+
+	drm_mm_takedown(&ggtt.mm);
+}
+
+static void alloc_usable_pool_high(struct kunit *test)
+{
+	struct xe_tile *tile = xe_device_get_root_tile(test->priv);
+	struct xe_ggtt ggtt = { .tile = tile };
+	struct xe_ggtt_node *usable_node;
+	u64 accessible = ggtt_accessible_size(&ggtt);
+	u64 usable = (accessible * 3) / 4;
+
+	ggtt_init_ranges(&ggtt, GGTT_TEST_START, usable, 0);
+
+	usable_node = xe_ggtt_insert_node(&ggtt, XE_PAGE_SIZE, XE_PAGE_SIZE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, usable_node);
+	KUNIT_EXPECT_EQ(test, xe_ggtt_node_addr(usable_node),
+			GGTT_TEST_START + usable - XE_PAGE_SIZE);
+
+	ggtt_node_remove(usable_node);
+	drm_mm_takedown(&ggtt.mm);
+}
+
+static void alloc_usable_pool_oversized(struct kunit *test)
+{
+	struct xe_tile *tile = xe_device_get_root_tile(test->priv);
+	struct xe_ggtt ggtt = { .tile = tile };
+	struct xe_ggtt_node *node;
+	u64 accessible = ggtt_accessible_size(&ggtt);
+	u64 usable = (accessible * 3) / 4;
+
+	KUNIT_ASSERT_LE(test, usable + XE_PAGE_SIZE, (u64)U32_MAX);
+
+	ggtt_init_ranges(&ggtt, GGTT_TEST_START, usable, 0);
+
+	node = xe_ggtt_insert_node(&ggtt, usable + XE_PAGE_SIZE, XE_PAGE_SIZE);
+	KUNIT_ASSERT_TRUE(test, IS_ERR(node));
+	KUNIT_EXPECT_EQ(test, PTR_ERR(node), -ENOSPC);
+
+	drm_mm_takedown(&ggtt.mm);
+}
+
+#if IS_ENABLED(CONFIG_PCI_IOV)
+static void init_shared_pf(struct kunit *test)
+{
+	struct xe_tile *tile = xe_device_get_root_tile(test->priv);
+	struct xe_ggtt ggtt = { .tile = tile };
+	u64 accessible = ggtt_accessible_size(&ggtt);
+
+	ggtt_init_ranges(&ggtt, GGTT_TEST_START, accessible, accessible);
+
+	KUNIT_EXPECT_EQ(test, ggtt.size_usable, accessible);
+	KUNIT_EXPECT_EQ(test, ggtt.shareable.start, 0);
+	KUNIT_EXPECT_EQ(test, ggtt.shareable.size, accessible);
+	KUNIT_EXPECT_EQ(test, ggtt_total_size(&ggtt), accessible);
+
+	drm_mm_takedown(&ggtt.mm);
+}
+
+static void init_partial_overlap(struct kunit *test)
+{
+	struct xe_tile *tile = xe_device_get_root_tile(test->priv);
+	struct xe_ggtt ggtt = { .tile = tile };
+	u64 accessible = ggtt_accessible_size(&ggtt);
+	u64 usable = (accessible * 3) / 4;
+	u64 shareable = accessible / 2;
+
+	KUNIT_ASSERT_GT(test, accessible, 0ULL);
+	KUNIT_ASSERT_GT(test, usable, shareable);
+
+	ggtt_init_ranges(&ggtt, GGTT_TEST_START, usable, shareable);
+
+	KUNIT_EXPECT_EQ(test, ggtt.size_usable, usable);
+	KUNIT_EXPECT_EQ(test, ggtt.shareable.start, accessible - shareable);
+	KUNIT_EXPECT_EQ(test, ggtt.shareable.size, shareable);
+	KUNIT_EXPECT_LT(test, ggtt.shareable.start, usable);
+	KUNIT_EXPECT_EQ(test, ggtt_total_size(&ggtt), accessible);
+
+	drm_mm_takedown(&ggtt.mm);
+}
+
+static void alloc_usable_pool_low(struct kunit *test)
+{
+	struct xe_tile *tile = xe_device_get_root_tile(test->priv);
+	struct xe_ggtt ggtt = { .tile = tile };
+	struct xe_ggtt_node *usable_node;
+	u64 accessible = ggtt_accessible_size(&ggtt);
+	u64 usable = (accessible * 3) / 4;
+	u64 shareable = accessible / 2;
+
+	ggtt_init_ranges(&ggtt, GGTT_TEST_START, usable, shareable);
+
+	usable_node = xe_ggtt_insert_node(&ggtt, XE_PAGE_SIZE, XE_PAGE_SIZE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, usable_node);
+	KUNIT_EXPECT_EQ(test, xe_ggtt_node_addr(usable_node), GGTT_TEST_START);
+	KUNIT_EXPECT_EQ(test, xe_ggtt_node_size(usable_node), (u64)XE_PAGE_SIZE);
+
+	ggtt_node_remove(usable_node);
+	drm_mm_takedown(&ggtt.mm);
+}
+
+static void alloc_shareable_pool_high(struct kunit *test)
+{
+	struct xe_tile *tile = xe_device_get_root_tile(test->priv);
+	struct xe_ggtt ggtt = { .tile = tile };
+	struct xe_ggtt_node *shareable_node;
+	u64 accessible = ggtt_accessible_size(&ggtt);
+	u64 usable = (accessible * 3) / 4;
+	u64 shareable = accessible / 2;
+
+	ggtt_init_ranges(&ggtt, GGTT_TEST_START, usable, shareable);
+
+	shareable_node = xe_ggtt_insert_node_shareable(&ggtt,
+						       XE_PAGE_SIZE,
+						       XE_PAGE_SIZE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, shareable_node);
+	KUNIT_EXPECT_EQ(test, xe_ggtt_node_addr(shareable_node),
+			GGTT_TEST_START + accessible - XE_PAGE_SIZE);
+	KUNIT_EXPECT_EQ(test, xe_ggtt_node_size(shareable_node),
+			(u64)XE_PAGE_SIZE);
+
+	ggtt_node_remove(shareable_node);
+	drm_mm_takedown(&ggtt.mm);
+}
+
+static void alloc_partial_overlap(struct kunit *test)
+{
+	struct xe_tile *tile = xe_device_get_root_tile(test->priv);
+	struct xe_ggtt ggtt = { .tile = tile };
+	struct xe_ggtt_node *usable_node, *shareable_node;
+	u64 accessible = ggtt_accessible_size(&ggtt);
+	u64 usable = (accessible * 3) / 4;
+	u64 shareable = accessible / 2;
+
+	ggtt_init_ranges(&ggtt, GGTT_TEST_START, usable, shareable);
+
+	usable_node = xe_ggtt_insert_node(&ggtt, XE_PAGE_SIZE, XE_PAGE_SIZE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, usable_node);
+	shareable_node = xe_ggtt_insert_node_shareable(&ggtt,
+						       XE_PAGE_SIZE,
+						       XE_PAGE_SIZE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, shareable_node);
+
+	KUNIT_EXPECT_EQ(test, xe_ggtt_node_addr(usable_node), GGTT_TEST_START);
+	KUNIT_EXPECT_EQ(test, xe_ggtt_node_addr(shareable_node),
+			GGTT_TEST_START + accessible - XE_PAGE_SIZE);
+
+	ggtt_node_remove(shareable_node);
+	ggtt_node_remove(usable_node);
+	drm_mm_takedown(&ggtt.mm);
+}
+
+static void alloc_partial_overlap_usable_full(struct kunit *test)
+{
+	struct xe_tile *tile = xe_device_get_root_tile(test->priv);
+	struct xe_ggtt ggtt = { .tile = tile };
+	struct xe_ggtt_node *usable_node, *shareable_node;
+	u64 accessible = ggtt_accessible_size(&ggtt);
+	u64 usable = (accessible * 3) / 4;
+	u64 shareable = accessible / 2;
+
+	KUNIT_ASSERT_LE(test, usable, (u64)U32_MAX);
+	KUNIT_ASSERT_LE(test, shareable, (u64)U32_MAX);
+
+	ggtt_init_ranges(&ggtt, GGTT_TEST_START, usable, shareable);
+
+	usable_node = xe_ggtt_insert_node(&ggtt, usable, XE_PAGE_SIZE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, usable_node);
+	shareable_node = xe_ggtt_insert_node_shareable(&ggtt,
+						       shareable,
+						       XE_PAGE_SIZE);
+	KUNIT_ASSERT_TRUE(test, IS_ERR(shareable_node));
+	KUNIT_EXPECT_EQ(test, PTR_ERR(shareable_node), -ENOSPC);
+
+	ggtt_node_remove(usable_node);
+	drm_mm_takedown(&ggtt.mm);
+}
+
+static void alloc_partial_overlap_shareable_full(struct kunit *test)
+{
+	struct xe_tile *tile = xe_device_get_root_tile(test->priv);
+	struct xe_ggtt ggtt = { .tile = tile };
+	struct xe_ggtt_node *usable_node, *shareable_node;
+	u64 accessible = ggtt_accessible_size(&ggtt);
+	u64 usable = (accessible * 3) / 4;
+	u64 shareable = accessible / 2;
+
+	KUNIT_ASSERT_LE(test, usable, (u64)U32_MAX);
+	KUNIT_ASSERT_LE(test, shareable, (u64)U32_MAX);
+
+	ggtt_init_ranges(&ggtt, GGTT_TEST_START, usable, shareable);
+
+	shareable_node = xe_ggtt_insert_node_shareable(&ggtt,
+						       shareable,
+						       XE_PAGE_SIZE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, shareable_node);
+	usable_node = xe_ggtt_insert_node(&ggtt, usable, XE_PAGE_SIZE);
+	KUNIT_ASSERT_TRUE(test, IS_ERR(usable_node));
+	KUNIT_EXPECT_EQ(test, PTR_ERR(usable_node), -ENOSPC);
+
+	ggtt_node_remove(shareable_node);
+	drm_mm_takedown(&ggtt.mm);
+}
+
+static void alloc_shareable_pool_unavailable(struct kunit *test)
+{
+	struct xe_tile *tile = xe_device_get_root_tile(test->priv);
+	struct xe_ggtt ggtt = { .tile = tile };
+	struct xe_ggtt_node *node;
+	u64 accessible = ggtt_accessible_size(&ggtt);
+	u64 usable = (accessible * 3) / 4;
+
+	ggtt_init_ranges(&ggtt, GGTT_TEST_START, usable, 0);
+
+	node = xe_ggtt_insert_node_shareable(&ggtt, XE_PAGE_SIZE, XE_PAGE_SIZE);
+	KUNIT_ASSERT_TRUE(test, IS_ERR(node));
+	KUNIT_EXPECT_EQ(test, PTR_ERR(node), -ENOSPC);
+
+	drm_mm_takedown(&ggtt.mm);
+}
+
+static void alloc_shareable_pool_oversized(struct kunit *test)
+{
+	struct xe_tile *tile = xe_device_get_root_tile(test->priv);
+	struct xe_ggtt ggtt = { .tile = tile };
+	struct xe_ggtt_node *node;
+	u64 accessible = ggtt_accessible_size(&ggtt);
+	u64 usable = (accessible * 3) / 4;
+	u64 shareable = accessible / 2;
+
+	KUNIT_ASSERT_LE(test, shareable + XE_PAGE_SIZE, (u64)U32_MAX);
+
+	ggtt_init_ranges(&ggtt, GGTT_TEST_START, usable, shareable);
+
+	node = xe_ggtt_insert_node_shareable(&ggtt,
+					     shareable + XE_PAGE_SIZE,
+					     XE_PAGE_SIZE);
+	KUNIT_ASSERT_TRUE(test, IS_ERR(node));
+	KUNIT_EXPECT_EQ(test, PTR_ERR(node), -ENOSPC);
+
+	drm_mm_takedown(&ggtt.mm);
+}
+#else
+#define GGTT_PCI_IOV_TEST_SKIP(_name) \
+	static void _name(struct kunit *test) \
+	{ \
+		kunit_skip(test, "requires CONFIG_PCI_IOV"); \
+	}
+
+GGTT_PCI_IOV_TEST_SKIP(init_shared_pf)
+GGTT_PCI_IOV_TEST_SKIP(init_partial_overlap)
+GGTT_PCI_IOV_TEST_SKIP(alloc_usable_pool_low)
+GGTT_PCI_IOV_TEST_SKIP(alloc_shareable_pool_high)
+GGTT_PCI_IOV_TEST_SKIP(alloc_partial_overlap)
+GGTT_PCI_IOV_TEST_SKIP(alloc_partial_overlap_usable_full)
+GGTT_PCI_IOV_TEST_SKIP(alloc_partial_overlap_shareable_full)
+GGTT_PCI_IOV_TEST_SKIP(alloc_shareable_pool_unavailable)
+GGTT_PCI_IOV_TEST_SKIP(alloc_shareable_pool_oversized)
+
+#undef GGTT_PCI_IOV_TEST_SKIP
+#endif /* CONFIG_PCI_IOV */
+
+static struct kunit_case ggtt_test_cases[] = {
+	KUNIT_CASE(init_native),
+	KUNIT_CASE(alloc_usable_pool_high),
+	KUNIT_CASE(alloc_usable_pool_oversized),
+	KUNIT_CASE(init_shared_pf),
+	KUNIT_CASE(init_partial_overlap),
+	KUNIT_CASE(alloc_usable_pool_low),
+	KUNIT_CASE(alloc_shareable_pool_high),
+	KUNIT_CASE(alloc_partial_overlap),
+	KUNIT_CASE(alloc_partial_overlap_usable_full),
+	KUNIT_CASE(alloc_partial_overlap_shareable_full),
+	KUNIT_CASE(alloc_shareable_pool_unavailable),
+	KUNIT_CASE(alloc_shareable_pool_oversized),
+	{}
+};
+
+static struct kunit_suite ggtt_suite = {
+	.name = "xe_ggtt",
+	.test_cases = ggtt_test_cases,
+	.init = ggtt_test_init,
+};
+
+kunit_test_suites(&ggtt_suite);
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 18e7d8f55673..8b5dc482f0d3 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -1366,3 +1366,7 @@ u64 xe_ggtt_node_size(const struct xe_ggtt_node *node)
 {
 	return node->base.size;
 }
+
+#if IS_BUILTIN(CONFIG_DRM_XE_KUNIT_TEST)
+#include "tests/xe_ggtt_test.c"
+#endif
-- 
2.34.1

