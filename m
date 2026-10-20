Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A5F606A31B
	for <intel-xe@archiver.kernel.org>; Tue, 20 Oct 2026 08:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LfbXzHhy
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFE6010F3D8;
	Tue, 20 Oct 2026 08:43:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F4DB10F3B2
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Oct 2026 08:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792485800; x=1824021800;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Sivwscr4mXGJhkjMTJauTwn3O5Z4fxRWroRBE7C7ZyQ=;
 b=LfbXzHhyrzfxlUbuOyQyGvNPHE/NslHPC9hJeuNsjf6Zz2OikwvQtDkG
 +gl53eitOfMcWdZsnvxA/g+2iDFNtimvMTll+KpZb/Y1OvzsSCD7d+vSq
 HW4OGmVy9+PUvAW3pPnzw8hd53LzvfF3R187KcpGSMNVBqoPWShNB5mFY
 UB19QN56Vbl0x2aXGhc7G5J+qL5T0fEbgEgRvH7BX7CM18xFiKi+XvMnv
 +dY/6+uojlcExsyNE2ak1WrXTgJYmsu+kbAAakMx64ZbevPDXN2RmmvdI
 vNU/NVv2GAtfZMMoyIQo1AI3xRYDLGFyPo80dWFYzKiQBb/U0cMs0zGYm A==;
X-CSE-ConnectionGUID: y3ZtsSQMTv2+ONW8vUBl+A==
X-CSE-MsgGUID: bgNjD/BPQ6CtWIxNDmjKCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1072098"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1072098"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 01:43:16 -0700
X-CSE-ConnectionGUID: mD/ask+pQyKyWLBxHJ8zKQ==
X-CSE-MsgGUID: PWQ8G6fjRH+QzFu/3uvqOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="3221512"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 01:43:16 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 01:43:15 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 20 Oct 2026 01:43:15 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.15) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 01:43:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LbHkExyMe2qWmcfBHNHXLFKDDvahZFZm1UDocIbvIpxkX8QJvc/4qlSJGfjyU0PPkKaA/rzRei2ImJ0cVKGfTypphmgeYImEEZZL8qWc6KjqxUv7jt86Gmfh0/+HA/Rdrkc4URY/ptj4hMR/DwzLS1YsUM/E2OyFf8UjMQbA9+D6dBATdjaTndjKO09QkGA8XJ7YpIEfjDA60njCiqTMt7pT+mo6rLF7BDrSbvs+PMwG6HpZBRkLbHHp8t8ovWIfr+GNB3KYHCn1AA61zJJvlgvFfGNV2Fbk9yYVHwVKIKOc0vMtyubbutsGlyxsBd34emMogM/mXI+ga7twQUzmPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=coa+nYbYvM7heYOCwOBmu7Hm4ozdr9AC5HiZM3TzM8o=;
 b=hikIhhHryZSrIVVYKjkRyPaOQUBC3HvonMDIyrBPI19LTSULojTBDzgOtG732TU0ckJxhNOgQk0GeidioRf7O9HNPdZAXxakC5KVRoOJLVMNBJ/ekE4agCmCk3MMfEMemzaPqyXIur2UORk0b8lKukQ1JFS3JFyGkCAKxoJiIMql5CzRiPE6HXI2Wr/HD0PpEPOHB7Vp7hsKDWwDetqXnb+K+4uQsGbg67EcsSzMdXIRLc3Rli/lJ1E0KqMNadtsqzFj9qb3m55S7K6ulQeV1ChSr0bE4Ed6rrzhjkCCJ/tWEAbx6aab+enuZ5H5e58XB66rrGYpKJ2srnKrjOcGTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by DSWPR11MB9581.namprd11.prod.outlook.com (2603:10b6:8:36e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Tue, 20 Oct
 2026 08:43:13 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0546.012; Tue, 20 Oct 2026
 08:43:13 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v3 2/7] drm/xe: Define VRAM regions and pools
Date: Tue, 20 Oct 2026 10:42:53 +0200
Message-ID: <20261020084258.443645-3-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261020084258.443645-1-piotr.piorkowski@intel.com>
References: <20261020084258.443645-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZPR01CA0008.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::17) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|DSWPR11MB9581:EE_
X-MS-Office365-Filtering-Correlation-Id: 94a72aca-fd75-40b4-d45b-08df2e862d71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|56012099006|5023799004|11063799006|261009223027099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: +qhQ/ebFtHF8mYx7cE6a/VBmhqYbBib340nJugL9sZr5ar1P/yyU9513t1S+zdRiv536iEEEsQwOEgho8RWoCFGPA4KHQsZ7isfIxPXs4gCO+NYXDQg3vm/m4L8tmUiqYfYmS2IGAVhXoRxebUzs5qTy3eVV3Va7YqIjozemaigtUqkRBjD8xtKENBfDKxzGHi8BD/dO9e+EyhlvutvpY2n9K5sTwemP1uc6P19RUCak6zfpJlbRPEi5W1rU6uujyB1MJZPpp0qjb1OjDf4Ci2rN+XKPmhtT/s04lvI3flS+H2MKQkCwZ3NZjAxzoOJe++raCvax1RxF4Ojg+isphS7DHNzsMNWw/Q+4DyT2YI/+7d9hKiWahw0lEyBbn8WGc9lqj+5sChmgKc+Lg5C6BEmm6c954cPUtWcdBDZP18htCAwdLP/OPyYs6HWgMyQuqeSCRPnih8xEL5UFsI3cn2gJcOgFXsIebXcAIlGeYtnu0HOsjc2FeoGhDIlraddD4BTUOQfrjwd4nvIA38qFoyXkUQfpH8yL8qs9fWlL6M6ZOUy2P0x6UWbibOgswrcI35g5Fn/ON49ClEpfs4H0bx978iBMoVquIUI2hpwDB22Rb37Jh+QFEg+DBHQJ5EFIUaaXm7UTTh6RzIIZqwg2QvsRV3yymUJ+XFijOWsj/yA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(56012099006)(5023799004)(11063799006)(261009223027099003)(10067099003)(22082099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U2sybyt1N0N2SHdDcDNmV1pyTWovYzV1ZU9EdnlLOVZvVGRqNE9UYjFqbzJQ?=
 =?utf-8?B?YU1ZbWNENFVuTng1VERocWtlQityVFY1Zi92UGpVYU9HZWI3aU9GM1lTSUV5?=
 =?utf-8?B?SGJ4aFZlS0tna2IzdWJtZEtnb0gxMWVhaXU4bXljaGU4ZUhCdi8vUmtFU3Ft?=
 =?utf-8?B?RmxDTXRwS2pFamlwUWZITmJQdDNEQTVRSjNOWmVwYkhvMmFpTFg4RjJ5WEgw?=
 =?utf-8?B?N1lKSmtYdnN0YXNzTzRqOURZY0VOUWZIeE5HVUQyTENmLy9vUlBLYSs0aXZ4?=
 =?utf-8?B?b0w1dUFJN3NVZkRBMXNHbHIrZk1JbjRObERyY0NQb3R6RlhxOXRqcWdyUUlr?=
 =?utf-8?B?bVFnSVgxSFFTVkdxdkd1elA1bUUyeVFpMzVHd3BLVEMydFBiVVc3a1FyQ1Ar?=
 =?utf-8?B?RHVHWlpTeWxTYjZMZHBCVVpnVEVpK21BaEd6ajF4ZmVvUzVyYmZQY0Z3dndw?=
 =?utf-8?B?VDhkcXcyT0sxNEFyMDJJQ1dhdU5kcUpkZ2hMbFVvV3pIc2oxY0ZNUkhvRVlU?=
 =?utf-8?B?STJML0phUHlhb1kvUVZNVHpHVGRhbURqNlViTFdxNWxWMDVBQnprQVB4a1RZ?=
 =?utf-8?B?UjRSTWhwZE85RHJwQTFUdWRMVkpnVGplZis4NlcvK1NqWWNHR1JzRHVaVVA3?=
 =?utf-8?B?Tmhsb1RPWUNRUGY3MWYyVDlxUnhPZ3VBdGxUaTFWWG9YaWRqY0UxSFRFNkdB?=
 =?utf-8?B?ZzhtWDRFejBPTjR2VGxEZ2hkRHpwOG1CMkhEazYrYzFjR2l0OVpPTEI5LzZr?=
 =?utf-8?B?UUhSQ1ZNcXRZbFFwRzdWNEluSE94ck5LUEhGVkZxaVJic28rTlFBMkxzYVp1?=
 =?utf-8?B?U01Bd1hHOUhra2RYSDU3WGdzcENDZlNpV3g4UlVYaWoxMTk2bndNMnVnSTJ6?=
 =?utf-8?B?LzllWUFlemNGbUxveDBnSUhZK1NTYzZlYnhkY2RuNWRpcDZJTCtKaEtLWVVJ?=
 =?utf-8?B?UFl0ZXB1MUdBYlJ4Q3pHaG9QLzRsTXJQTUpJanA3TE92czV1NXA4WUIyeWVm?=
 =?utf-8?B?RE53OUVLdTIrbjJEN2RkQVNDRFFDcWxaV0FVNzl4dnNIUVBHdHFxcG9peUZN?=
 =?utf-8?B?Wlp1NTErY0NuK0NaMWxXVXFvYUpSOWNWa3QvN0lQWG1GTXF0OTVGRWNjcGw0?=
 =?utf-8?B?WTB5Y0JvSmlPQjNNRzNmZjlNbVVOSjJTZWkrYUNVQzJzaUFtSWEwOUpMVTBy?=
 =?utf-8?B?b041dnNHaW5hc2djRTN3akl0T1F5eXNxSEJ6N0M3MlZrR0cwakVTK3lVRXRL?=
 =?utf-8?B?dmRzakhydXlmK1MrWDJCL3J4Zkp1aU94WFdyNExjQ3VQWUowUGxTUmFEdWdO?=
 =?utf-8?B?U01lY3F2NHgrS2FybzJhazl3ZkR1bDY2REVYWm9aOG1ud25sdFFkbUhzQlQx?=
 =?utf-8?B?NklhanR6elNpVzRzK2drOFJ0Rnp2TjdRblJCb0tHQ3NiaVZjZWd4Z3UzQ0o5?=
 =?utf-8?B?V014TEIvVE96Z1ZPUzhSLzBrYWZZZ2ljc0xuTHU3dlJMVWRHTUZlYjcwK2lh?=
 =?utf-8?B?WU1VSjlzZlBveERzZ1JqeENWZkhYYTcxUGFvdGRFZmVqbE5ZY2wxZlErdUhT?=
 =?utf-8?B?TVQ1LzdtQ2FpSERqaTNrSTBnUUdJOUFEeTJpczJnZktabXlCcWtKakhmRkVH?=
 =?utf-8?B?Tzdwd2FXdVhPK3MxUnNveHhPYzBqek5PVE55YU5uU0dFWnQxY0N5R2pZOWlD?=
 =?utf-8?B?Z2FzLzBSS1NDdklNNUVwL1p4SkY3QzgzQmNxeXRvS1d3eWV2THJ2cWU2Q2F5?=
 =?utf-8?B?L3pyT2FiSUNUbWx6M0lQTk5ZMGxJblVRRmJYVjBCdjdLV2MybklNVWphNmdo?=
 =?utf-8?B?UmdWbXVodENuV0w4RjlteVpyUWJsb3JSbjFBOGNvUGg1S0k3ZjRjQ1Fob1hv?=
 =?utf-8?B?NzVEZC9WbG45RHdrTWJnMkE5cHlIUEZ5Sm9DdGMxRXM2WXB1SWIwaGhJSGxC?=
 =?utf-8?B?cVV6eVVuVFN6NDRoZVVZUm5DbTVsN2syblE3NFNQWll5MUFzNUFBYVRlWnF5?=
 =?utf-8?B?YnV0RkZaQ0N6dXRXcTFNUHBiRkMrSGZBYjJJQjNmU3RLdGVyZy9PdHY5cWRv?=
 =?utf-8?B?SFZ6V2QwVHNUK0VBWFlrSEFSSTE3b3dhVUc4QXBXaStwb08wdVBhYkg3TXdV?=
 =?utf-8?B?MnFQOExhbXNacWgrRUtzVHV1NGRVVW55aWpPNEN6VSt5RjlCckU2UkpLWHRu?=
 =?utf-8?B?dEEwYjJQZ1cxc1c3blMraWdPMWRNdEcrcmRZZks4cFBvd1F2dHViWTlxR3hl?=
 =?utf-8?B?UVBqUEwyMFNkVWU1dk9pQ2FMUzAwSUhvR3F1bjJXME9KVXBMaUxGS2tCd0hQ?=
 =?utf-8?B?SU91bWRDNGpCNTJLUWgxTThpOTB1MXpSSmN6N05vUUFmdTRTTkNnQVhCZkhU?=
 =?utf-8?Q?8i8+MyHYvcg+Cz8A=3D?=
X-Exchange-RoutingPolicyChecked: m5dUPjJfOW8f9WAEYgAVzBLy1srbK+itwhmZU4yG8RMescCw9N0Tkgjy1gmF2gBiduztq4qxkTrYTbkQQUuxK+fMPC1k4bFbIZTLQpqK+txi8SC8/mSoWdF3S/jPHfq/Jga01omywq9ejv+aJRZjx2RbNb8XH0ZlRflQbvk7hcue0yyUiUbRp2eEIXRoKvcvWRipxOmfN0QXcwcXp7fTNJttVaBH2AVJNiFE7LjShw9P+E5yANk/h2ySRJ4VhUfvVV/ECSGh7mXdcYyYQhbbqnM9z2x4u3AMLnf+oyEJH47Rjets5MFgsWKtZTdj8XrLEb1IWcqUECeK4u+G01wqTA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 94a72aca-fd75-40b4-d45b-08df2e862d71
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 08:43:13.3548 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2cEostRep0BrTHmRPfgGbkb//+KJDV/IOmB4nsyim5jwISpepr4sIu0P9yQcOgQOmFkQVB6Obm6Cr4+SVuR023O/RmCjBewICF8KnI/yYL0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR11MB9581
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

Allocation paths place memory through a struct xe_vram_region, which is
both the physical carrier of a VRAM range (BAR mapping, DPA range, TTM
manager) and the only handle for the purpose an allocation serves. That
makes it impossible to dedicate part of a region to a given purpose,
e.g. to keep kernel allocations such as LRCs and page tables in a range
of their own, away from VRAM that may be reachable by other agents.

Separate the two concepts. A struct xe_vram_pool represents an allocation
domain: it identifies the purpose served by a range within a VRAM region,
whether that range is available for general use or dedicated to
a particular purpose. A struct xe_vram_region owns the physical resources
and embeds its pools as partitions, keeping pool pointers published during
initialization stable when the region is later split. The region also
records its binding, distinguishing a device-wide aggregate from a tile
region, since both may use ID 0 for the first tile.

Assisted-by: Claude Opus 5.5
Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/xe_vram_types.h | 159 ++++++++++++++++++++++++++++-
 1 file changed, 158 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vram_types.h b/drivers/gpu/drm/xe/xe_vram_types.h
index 646e3c12ae9f7..a3e421f2f32d4 100644
--- a/drivers/gpu/drm/xe/xe_vram_types.h
+++ b/drivers/gpu/drm/xe/xe_vram_types.h
@@ -15,6 +15,142 @@
 struct xe_device;
 struct xe_migrate;
 
+/**
+ * enum xe_vram_binding - VRAM region binding types
+ * @XE_VRAM_BINDING_NONE: no binding assigned, default value of a zeroed region
+ * @XE_VRAM_BINDING_DEVICE: device-level region aggregating all tile VRAM regions
+ * @XE_VRAM_BINDING_TILE: VRAM region bound to a tile
+ */
+enum xe_vram_binding {
+	XE_VRAM_BINDING_NONE = 0,
+	XE_VRAM_BINDING_DEVICE,
+	XE_VRAM_BINDING_TILE,
+};
+
+/**
+ * enum xe_vram_pool_purpose - What a VRAM pool serves
+ * @XE_VRAM_POOL_GENERAL: general-purpose memory, available to userspace
+ * @XE_VRAM_POOL_KERNEL: kernel-only memory, never exposed to userspace
+ */
+enum xe_vram_pool_purpose {
+	XE_VRAM_POOL_GENERAL = 0,
+	XE_VRAM_POOL_KERNEL,
+};
+
+/**
+ * XE_VRAM_MAX_PARTITIONS - Max partitions a single VRAM region can be split into
+ *
+ * A region currently holds its default pool and at most one pool dedicated
+ * to another purpose. The TTM manager mirrors the partitions of a region one
+ * by one, so a region cannot hold more of them than the manager can back.
+ */
+#define XE_VRAM_MAX_PARTITIONS	XE_TTM_VRAM_MGR_MAX_PARTS
+
+/**
+ * DOC: VRAM pools, regions and partitions
+ *
+ * Allocation paths place memory through a struct xe_vram_pool. A pool names
+ * a purpose (general-purpose, kernel-only ...) and resolves to a TTM
+ * placement plus the address range serving it, see xe_vram_pool_place().
+ * Whether that range is the whole region, or one of several partitions
+ * sharing a region, is a backend detail pool consumers do not need to know.
+ *
+ * A struct xe_vram_region is the physical carrier: it owns the BAR mapping,
+ * the DPA range and the TTM resource manager. A non-aggregate region
+ * initially contains one partition spanning its whole usable range. That
+ * partition is the region's default, general-purpose pool. It always
+ * occupies partitions[0].
+ *
+ * Each partition is described by a struct xe_vram_pool embedded in the
+ * region, so a pointer published during initialization remains valid if a
+ * later split changes the pool's offset and size. A split never changes a
+ * pool's purpose and may only happen before the region's TTM manager is
+ * initialized.
+ *
+ * The device aggregate described below is the only region type that has no
+ * manager and no partitions.
+ *
+ * The id shown below is the VRAM region instance id. For a tile region it
+ * is the id of the tile, which the uAPI relies on. The pair (binding, id)
+ * must uniquely identify a region.
+ *
+ * Partitioned region:
+ * A tile's VRAM region can be split so that a pool dedicated to some purpose,
+ * e.g. kernel-only, gets a range of its own and the default pool keeps the
+ * rest. The dedicated partition is carved out at the start of the region, at
+ * the lowest addresses, and takes the next free index. The default partition
+ * keeps index 0 and is moved above the dedicated range. A tile without such
+ * a reservation keeps one partition spanning the whole usable range::
+ *
+ *         xe_vram_region "tile0" (VRAM region id 0, binding TILE)
+ *         ,-------------------------------------------------------------.
+ *         | ttm: struct xe_ttm_vram_mgr (one manager, shared)           |
+ *         | .---------------------------------------------------------. |
+ *         | |  partitions[1]            |  partitions[0]              | |
+ *         | |  offset 0                 |  offset pool_size           | |
+ *         | |  size   pool_size         |  size   usable - pool_size  | |
+ *         | `---------------------------------------------------------' |
+ *         `-------------------------------------------------------------'
+ *                  ^                               ^
+ *                  |                               |
+ *             dedicated pool                  general-purpose pool
+ *
+ *         xe_vram_region "tile1" (VRAM region id 1, binding TILE)
+ *         ,-------------------------------------------------------------.
+ *         | ttm: struct xe_ttm_vram_mgr (one manager)                   |
+ *         | .---------------------------------------------------------. |
+ *         | |  partitions[0]                                          | |
+ *         | |  offset 0                                               | |
+ *         | |  size   whole usable range                              | |
+ *         | `---------------------------------------------------------' |
+ *         `-------------------------------------------------------------'
+ *                                     ^
+ *                                     |
+ *                            general-purpose pool
+ *
+ * Device aggregate:
+ * A device-level aggregate region is unrelated to the tile regions. It is
+ * never backed by a resource manager and has no partitions. It only
+ * aggregates the sizes and DPA ranges of every tile for reporting purposes.
+ * Nothing is ever allocated from it::
+ *
+ *         xe_vram_region "device" (VRAM region id 0, binding DEVICE)
+ *         ,-------------------------------------------------------------.
+ *         | ttm:        unused, not backed by any resource manager      |
+ *         | partitions: none, this region is never allocated from       |
+ *         | size:       total VRAM summed across all tiles              |
+ *         `-------------------------------------------------------------'
+ */
+
+/**
+ * struct xe_vram_pool - VRAM range used for a given allocation purpose
+ *
+ * VRAM allocations are placed through this frontend. It identifies an
+ * allocation purpose and resolves it to a TTM placement and the address
+ * range serving it. Whether that range is a whole region of its own - and
+ * thus has its own placement, mapping and address range - or one of several
+ * partitions of a region is a backend detail the allocation paths do not
+ * need to know, see xe_vram_pool_place().
+ *
+ * A pool stays valid for the lifetime of its region and its purpose is fixed
+ * once published.
+ */
+struct xe_vram_pool {
+	/** @region: region this pool belongs to */
+	struct xe_vram_region *region;
+	/**
+	 * @part: TTM partition backing this pool, or NULL until the manager
+	 * is initialized
+	 */
+	struct xe_ttm_vram_mgr_part *part;
+	/** @offset: byte offset of the pool from the start of @region */
+	u64 offset;
+	/** @size: size of the pool in bytes */
+	u64 size;
+	/** @purpose: allocation purpose served by this pool */
+	enum xe_vram_pool_purpose purpose;
+};
+
 /**
  * struct xe_vram_region - memory region structure
  * This is used to describe a memory region in xe
@@ -26,9 +162,11 @@ struct xe_vram_region {
 	/**
 	 * @id: VRAM region instance id
 	 *
-	 * The value should be unique for VRAM region.
+	 * The pair (@binding, @id) must uniquely identify a VRAM region.
 	 */
 	u8 id;
+	/** @binding: VRAM region instance binding */
+	enum xe_vram_binding binding;
 	/** @io_start: IO start address of this VRAM instance */
 	resource_size_t io_start;
 	/**
@@ -57,6 +195,25 @@ struct xe_vram_region {
 	 * (e.g stolen mem)
 	 */
 	resource_size_t actual_physical_size;
+	/**
+	 * @partitions: partitions this region is split into
+	 *
+	 * A non-aggregate region initially has @partitions[0] spanning its
+	 * whole usable range. It is the region's default, general-purpose
+	 * pool. An optional split may adjust its range and create another
+	 * partition before the TTM resource manager is initialized.
+	 *
+	 * A device aggregate region has no partitions. Allocation paths do
+	 * not take a region pointer, they take a &xe_vram_pool pointing into
+	 * this array, see the DOC above.
+	 */
+	struct xe_vram_pool partitions[XE_VRAM_MAX_PARTITIONS];
+	/**
+	 * @num_partitions: number of valid entries in @partitions
+	 *
+	 * Zero for a device aggregate region.
+	 */
+	unsigned int num_partitions;
 	/** @mapping: pointer to VRAM mappable space */
 	void __iomem *mapping;
 	/** @ttm: VRAM TTM manager */
-- 
2.34.1

