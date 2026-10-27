Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE92606A324
	for <intel-xe@archiver.kernel.org>; Tue, 27 Oct 2026 10:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EMPhiKTG
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5540010F398;
	Tue, 27 Oct 2026 10:30:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4341010F3BD
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Oct 2026 10:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793097037; x=1824633037;
 h=from:to:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=2R/NGO0LCRb09lNiV4vMD2D8PaCB5FX0FWUSAR1luPQ=;
 b=EMPhiKTGL78OpXWQgGAs4IoCSh9HVwc8/uoiU2EGrBj/l7KUCf9OQRhx
 eeXGD+eFb7F0qwv37N+XZFzQLitbcf98QqJSME/3+LH+fK+E+T8mrL3DA
 WhP1+v3zMAWdovX4jWDeSu8Q//WeSZADy+6sfJbnTIdgBG9fxhz2afYZs
 JsxS5Z0ay7/+SHG32zFyQKEl+wu2n9sONv9VnbEEIcDZSiSEiizohDVFl
 SKXKkC95Lz2B6/b14kg2L5v3moFhmkO5+JmLyepTHAsgBbTj7RRRG2i6l
 b9/0wgqrx9LS3beQ2EcS+7sWeVBOtjR0WHcPuD3Qv2wodD7VY+SQHTmxE A==;
X-CSE-ConnectionGUID: nOupfjzcT6y/xC5JxJvbZw==
X-CSE-MsgGUID: TXEdfZ24RTqfxmmF8e6v5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1696088"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1696088"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 03:30:36 -0700
X-CSE-ConnectionGUID: WnAA6HJ7QFu0Qkznohv7qg==
X-CSE-MsgGUID: SOMo8rjxT1qW+ZBmuYJR+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="6383995"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 03:30:35 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 03:30:34 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 27 Oct 2026 03:30:34 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.71) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 03:30:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QlSjlf4B67smESh4jUeIiJ6Hn8WuPv4sbe9QDLk1WKJYB0claSohwMd0yH94fT1UeMwvL/0qoRbt0dHn76WqoJZFEAtWNYpIVdNvB2HlrNyg2CJNpZZYj92sljokQvlh65sYRYObihAhiVsDsM36zuUVKXtZZcFwguUjEwrzC4CVH08qsaogyil0lwVw5tTGwcjIqmAjz+ht+2yx+7IjWGMXEyiZ+E6gD4h6y/GOEPtqLfeHr78DmXx9cQRd/U8Su+UUmOeanEjWlDt5aqukKzQigfqJyPM/+BK7v+KEY860UkIy9rtfR2ln9CAi02q8vx3do9FJKzDCpisvqT5jnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oWfHfR/wcr9TDfzUNPUPg8wj18G7LspQ+UvChVMd3ak=;
 b=Zi3EnJ22x2cMlgz2Lg1Zlsong6BGNdpObAbsECy2zVT5fCDVOHQR9JC2pEC5xQdTGG0TCxoww0OzfNJkUhpncyG+X5hUy1GRHVbn+s6XvSRKJ3ZnXjf00miqFC4Bj4ydnDFRsR3c6TJSt7USU0JiSmbTISnE/JA94f8/e5+65MDPGu93b4Im3qt3wU01GqfUm1E/b6bOWp4UqyRMZJcvUJNKb0Phg0CjbgHCcdWAL/kUMZ/rqOIuRTArKexOlz5qp+gHAY+5FQbSEON5kzUQ4EifkB9NTWClCEUvs6hHYIHXa/XsoqcPIF+e2e93ent94kNAhbYszqneJOzJSypj0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by LV1PR11MB8789.namprd11.prod.outlook.com (2603:10b6:408:2b4::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.19; Tue, 27 Oct
 2026 10:30:21 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 10:30:21 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH v1 1/5] drm/xe/pf: Split the bulk priority provisioning
 function
Date: Tue, 27 Oct 2026 11:30:05 +0100
Message-ID: <20261027103009.1259199-2-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261027103009.1259199-1-piotr.piorkowski@intel.com>
References: <20261027103009.1259199-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1P291CA0003.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::6) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|LV1PR11MB8789:EE_
X-MS-Office365-Filtering-Correlation-Id: a71fbb6d-a28e-47e4-0f99-08df34154d73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|11063799006|261026140227099003|56012099006|18002099003|22082099003|10067099003|261009223027099003|261021121427099003|261022105027099003|261022075727099003|261021123027099003;
X-Microsoft-Antispam-Message-Info: APUYyrPLgmBu/Plm5uuCC1qeRu1dhNXKF7jv2lcuUucnLXo+gdT9PBlduaSu3QztDQRlSoko7DN3FSJVV9vBg5MRoEBsaezzCPcFjk+co3dV22nSlF7dd+NwqvjCEfMxfE2o1PGIY4tFXtSCRNLX8NQk+lodRm87y7WnDf5SxsFZTYnNMzKPrWCa+hCsRIJKrBAm+icdppVS4O+tJSkknXv+piYSVT/mnzDr9Vs6GGqqbz+8JFVL6A5XpLX+cs7nA1shO+8VlyUeuFmAvye2XvYJMxsU3hVm+Y+B6EgPcTLuedhMz40SdQDb55Ji3nGY7VbrMqlIf65QgWyhFC6rbSWx6Z2ZiappqLiACVtuFpZfk4+MotloH10WlHH4D3oCyJSnsKrh32/LndvZ5+nsyzHYMCnNScz+Abdwelue6Cp3BaKxdJAa6MQdH8hRcpQDM7pCGmSiAuL+JPZKFKv7ga/dC06HiC19PPJ9hNN+FZVwaEe+4EZ2zfN0fl6ehyN0ArVSMOq7jJz6WhUBZMNYpSHMI1QARYJLDm1ARVd6PbJfSRvvxj7bKPX6lPIFVZ/Wnxh8E3KZwN3DUZdqWaBp5yII6FJaif15uq5e4UxnwDoq9urz27WoKH5bNl6T1r909u0wtCsI3lGO/hCqzvxnkRLKa0urSdwS9JMVUMPy6Ig=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(11063799006)(261026140227099003)(56012099006)(18002099003)(22082099003)(10067099003)(261009223027099003)(261021121427099003)(261022105027099003)(261022075727099003)(261021123027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UU5WSCtyWktRTlgrQ0ZiUEJxbUhhVnRoUTRLYk1oczJMeXFPRGUyU1BHckxz?=
 =?utf-8?B?MktVb3RuVTdiM0RiRmdHM2ZXUzdXZm5nbjUrY2RXdllQZEtibldqL2JGNDBJ?=
 =?utf-8?B?YVJtSU8wQWRpNHhVRlRja1R3a2F4aUFaN21uQjFRamdacFN3OXRZcGhXTFc2?=
 =?utf-8?B?aHo3Y3BLZVF2KzBYNmdZS0l5dG00b0lVL2FKaXFiUzhNSXMwSE9oUk9oZ1FN?=
 =?utf-8?B?Y0xDaUYxbjJNU0d0cjkwNTM5S2s1SHdTb3NwZGZ6Y0dhV0xxbFZKMW5peFli?=
 =?utf-8?B?QUI3NmtTVFhXUm5HRXhKaVZCZXN3NVZHcUhuWXVseitSRlNaOEp3UEJLcUNa?=
 =?utf-8?B?YlFLNUhGdDFuYmZyU1Y4ZFdDdE10Rzg4VlljclBtekFNNGZ1N3l4eFJNcEJr?=
 =?utf-8?B?M3RUbUVTTjZGa1B3QnVpZFJJUkR3dW1QLzdGUS83YnRhVHgwYnFJMFp5U2Zv?=
 =?utf-8?B?QTV1bUxyWXE5N2xhQ1ZTTXpMWE5xeW0wNDNRdERkSlo5MVIxcXl6UVZpdmFY?=
 =?utf-8?B?RFA4cUViSHhNRXVlMDF5OTIxM3VIYnBSa3ZrMGZWOWt3Q0pLRDhiZEtSMVZG?=
 =?utf-8?B?WEI1U3FBb1dVSnNWN2NNSG5odlZPSXlUVFJlSm1wdTNxU1VIdTB5cTN2UDUy?=
 =?utf-8?B?Y2lWeEtYeUZUbkt1RTUvNUNVZ2VLZTdDUkZGYWt4cno4dHIzWk5WZ1dmMld6?=
 =?utf-8?B?dmdiRm5FMTVzanNDYlJNd0VsOW5ZMkwrQjBSUnFIcWdyaDhTb3ozc1lzRzBj?=
 =?utf-8?B?UFNQVm5Hdmgyb2RMUEswdENuUWtBRmxaZFI0ZE10VWxka3NFMVJiODl4aTdJ?=
 =?utf-8?B?enRHc3pnb1hKdWZZcFg3YlZzQ01EdjlOYkZDQ2diNWk1ank3bVVuRUpLanZy?=
 =?utf-8?B?K3ZIZVNjMllSbDBicW5za0Y0VGE4dER0eTdDNEloYm02d09hRTZNcElya2Q4?=
 =?utf-8?B?N2MrUUc3Y3IwZUdFUVV6dmY4TWVkOFRuSGxIQWRxYk90bzZCUndyT1JnaHU4?=
 =?utf-8?B?d2RyS2swNTFQZFBOUS9NTktVeWhZRThhRE0rRjZOeVFTZUJtME5kUFk1NEhP?=
 =?utf-8?B?aU5hdEg1U2dOT21hcmhWQ1JYbUVUTDRFZTZZSjQ3N0FzQkVrR3hBK2hSWitx?=
 =?utf-8?B?NGhsKzV5Y04xdUZCMXc2blJPcjRwZVN1Ym5NaWxhdzBPV0NBMGtLWFdqaXYz?=
 =?utf-8?B?YlkwY1RhVktobUVqcThIMWJtUlVGQmV1eDVhRzJxdkd1blNlcHhGZEloR3pP?=
 =?utf-8?B?cjNzMnRWNFhtanlPdEwxY0xBOVowazdMeXRFcWNKVkhDZExlazIxNmtCK2RD?=
 =?utf-8?B?dVBQMlo2djlLMEpDdUlGZGJLVWRtQm5ueUpzeGVCOVVFaUg4enprcXY0U3Rm?=
 =?utf-8?B?bmwvREY3dWQwVGN5QjNUY0FOekFnSUFuYWFMcGVQeTZ6eCtTWVBlN210dWx3?=
 =?utf-8?B?eS94SzA3bzBKc2ZHQ25MT2ZDOWl3aHYxNFBCbUl4M2ZIL2YwZFBIUmwxOWgz?=
 =?utf-8?B?MmRqVVl6ZzVROEZNR3IxZTc3bW5rY0xialp4alZTdDlyYWNzNUlacXBRWXp0?=
 =?utf-8?B?ajZON0lDL1BsNm15UXQrNW5yMitkeEJlK0NOa0xhY1Q3Qjg5ZlBYS09FZTk5?=
 =?utf-8?B?MDVPdW9DZmxobTdVYzJJRFo2Ky9mSzY2TVZwNGNpY083THhDNDM4eDJKQzVX?=
 =?utf-8?B?REhhczRPZ1BreW5Ibi95Y2ZMNHM3dWdYSGdSOVd4Z1h0VmU1cDNzcTUzL0RH?=
 =?utf-8?B?Y3lueUgzclBGb01namI4SUJ4MEo4NHBKZU5GUGwrWFQyMkVOa1BQWU11N0hu?=
 =?utf-8?B?MkFmOFM5NWVCQWdYWHgveHE1T3FvOWorbXJ1RVFQbDVwUnkzTVVCV0cwb0R0?=
 =?utf-8?B?RytaakJra2QwVlZDV1hpMTZTSUlOUHMrNnlDaFRVOFhxVE5FeWFqMndTb1kx?=
 =?utf-8?B?L0FBakJHaDA5UHEvMDA3anNKRjhvY0dRa1RVYklObWFJOSs0TTNOWGdrUEFW?=
 =?utf-8?B?b2ZRY0h0VlV0cG9ZZmdRa2owVk0zcjJHalVCc3pzQTZKM0JsSFlRTEk3Vjhu?=
 =?utf-8?B?K3hRdGtXT05tMFdybGJpQ2RuQm9mVFk3SXYwMDg2bjdMd2dRNmpuL0hXd0x6?=
 =?utf-8?B?YnlueFQ2K2FkM2ZacjJKRE5obmlMSFoyYmJJNXhqcDZ4aDkzSmFTOWZ4NUxK?=
 =?utf-8?B?N1ZoT3Zhb1E5cEpDbVdVOGZLTlpsN1ZYYWhEVGQwYjhyL0s2WTkwQmQ4NDdr?=
 =?utf-8?B?dHRFQ2tlMHVQTEtLc1hFVVByUHlRak50eHVJaGduL2pZRk9sWEtsTGpyVDVF?=
 =?utf-8?B?bXJ1T3NZbitXaExQemQxSm9XNzJqNGx5MytrdDMycS96VGdORThoVncrMzJE?=
 =?utf-8?Q?gX01lEjfhB9e/3Pg=3D?=
X-Exchange-RoutingPolicyChecked: VuhCUjX5ItEkHHpvFnswD9MmwGG8znPwPiw0G8SI13h9k1ptaS9n+9akSyfV3OauNrXyK4iJz2bGv5DXd/WqDLfwfEME23uUIxPuMzKnbRFx5Dy96vsEql3RVQuULZiAFpYkoUv8r5Qi2N4Eg24Y0cRGn/o9SXuX6aJknV/+P8F8yZMjkqxMAqGwIIdbpqYPtum08My3GCIUSBN3CGaR0OPuQNjgR28d6LqRec16HuZ5R/PgHN2qOyQG8SHDQPm5oF5KlPZyFw/JCxLMw28AmTVjymcoEvuLOD0/DjqQ1f71kDaikRO001lzn8ZV9CL1dKeErcln0SaVH3I9XQCNvg==
X-MS-Exchange-CrossTenant-Network-Message-Id: a71fbb6d-a28e-47e4-0f99-08df34154d73
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 10:30:20.9365 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DRmRFYk596r6RREaOotDspRlLSiPLVlF9kyrqGsMb8p/TCxLm2axyC1vAZi8gTHxEClIifB4eH7CgcUoN+wEtPRng4VUBY9p88Mq6c6fUX4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8789
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
	T_SPF_TEMPERROR,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Michal Wajdeczko <michal.wajdeczko@intel.com>

During VGPU profile provisioning we will want to reuse the current
code that converts the scheduling priority into the schedule-if-idle
policy, while already holding the master mutex.

Move that code into a static helper that expects the caller to hold
the master mutex, and let the public function take that mutex. As a
side effect, the schedule-if-idle policy is now updated on all GTs
under a single lock, instead of taking the lock separately for each
GT.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/xe_sriov_pf_provision.c | 35 ++++++++++++++--------
 1 file changed, 22 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
index c37e422b5a5c..91670063f706 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
@@ -376,18 +376,7 @@ int xe_sriov_pf_provision_query_vf_pt(struct xe_device *xe, unsigned int vfid, u
 	return !count ? -ENODATA : 0;
 }
 
-/**
- * xe_sriov_pf_provision_bulk_apply_priority() - Change scheduling priority of all VFs and PF.
- * @xe: the PF &xe_device
- * @prio: scheduling priority to set
- *
- * Change the scheduling priority provisioning on all tiles/GTs.
- *
- * This function can only be called on PF.
- *
- * Return: 0 on success or a negative error code on failure.
- */
-int xe_sriov_pf_provision_bulk_apply_priority(struct xe_device *xe, u32 prio)
+static int pf_bulk_apply_priority(struct xe_device *xe, u32 prio)
 {
 	bool sched_if_idle;
 	struct xe_gt *gt;
@@ -395,6 +384,8 @@ int xe_sriov_pf_provision_bulk_apply_priority(struct xe_device *xe, u32 prio)
 	int result = 0;
 	int err;
 
+	lockdep_assert_held(xe_sriov_pf_master_mutex(xe));
+
 	/*
 	 * Currently, priority changes that involves VFs are only allowed using
 	 * the 'sched_if_idle' policy KLV, so only LOW and NORMAL are supported.
@@ -403,13 +394,31 @@ int xe_sriov_pf_provision_bulk_apply_priority(struct xe_device *xe, u32 prio)
 	sched_if_idle = prio == GUC_SCHED_PRIORITY_NORMAL;
 
 	for_each_gt(gt, xe, id) {
-		err = xe_gt_sriov_pf_policy_set_sched_if_idle(gt, sched_if_idle);
+		err = xe_gt_sriov_pf_policy_set_sched_if_idle_locked(gt, sched_if_idle);
 		result = result ?: err;
 	}
 
 	return result;
 }
 
+/**
+ * xe_sriov_pf_provision_bulk_apply_priority() - Change scheduling priority of all VFs and PF.
+ * @xe: the PF &xe_device
+ * @prio: scheduling priority to set
+ *
+ * Change the scheduling priority provisioning on all tiles/GTs.
+ *
+ * This function can only be called on PF.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_pf_provision_bulk_apply_priority(struct xe_device *xe, u32 prio)
+{
+	guard(mutex)(xe_sriov_pf_master_mutex(xe));
+
+	return pf_bulk_apply_priority(xe, prio);
+}
+
 /**
  * xe_sriov_pf_provision_apply_vf_priority() - Change VF's scheduling priority.
  * @xe: the PF &xe_device
-- 
2.34.1

