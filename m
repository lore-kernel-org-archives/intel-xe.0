Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6F71C87FCA
	for <intel-xe@archiver.kernel.org>; Thu,  7 Aug 2025 18:22:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E1B610E895;
	Thu,  7 Aug 2025 18:22:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I1Zc6RRy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A34710E888
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Aug 2025 18:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754590965; x=1786126965;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=aSsSoZHX8bsHhvlP8E1Qj1Oivhu7LQZU8Yo6qWvDZDU=;
 b=I1Zc6RRyz3vzHr8JJQsqQ6CacCZBTE3JNIj8ONp8+NaVymNx5sExLLjz
 BuiSYN9G7Bt4oexPUKIdpNYpkuz6ACC9ovWGy4bi+gw0uW5rhhIIEQVLH
 V0Eyc8xH9noyb7i6DkS8qVJ2MRALpZR2zbnYmlG8aKzE4zQhFdTQGaQil
 QxUxEwpZUAvlglLcREWumhjXni2V18JBTE8ccWeAyjSd+yGP2jPFQkn2P
 QNiOkl+OELUAt/jBqx51Fyg9kxiSCBLHlWyuCfGwnnnBvj6PmmnOE7ZXX
 I7b9cgkMmMv4WVhotfarko3CJf/y4ysUG1TdFYfMdogIfiVvzxlwMXU2w g==;
X-CSE-ConnectionGUID: 1eEgRLTfTMCrjchuK8576g==
X-CSE-MsgGUID: F02cbrIZRgaeuFkB+doUVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="60566152"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="60566152"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 11:22:44 -0700
X-CSE-ConnectionGUID: RjNzz90STpusWNSbTGZumw==
X-CSE-MsgGUID: LQl3pVhlQKWmdwXPrIt81Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="164795301"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 11:22:43 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 7 Aug 2025 11:22:43 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 7 Aug 2025 11:22:43 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.84) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 7 Aug 2025 11:22:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d0A2ZIkYONHpgSutZR9G2rEVfCWj1YRnPl3ttKF7ZnyEfSSZ4nUwl3GJEmaHMNgA+dAn7SafLg/HXAGAff6UqER9JQKoE0nr/XNSy45+9FuRgWgwMicbwW35UTV2pBF/BBnvM65XuKfSJoMl3NQmCTS4OlZR8wyEfQwaOWctzcEs+WWRyTOq9VXUMTHjLtKaGM7ZdmRplpwtsU+CPS8mZT0HdOS08VTT/Ccek7cmqOGpkz+qf1dmtvwBJb0Qiay3ya57guqlK5bk7Gf9rFuWfpHu7go3PKV1ohkoSBSpBqR0DxNz5LftGVTNKKmPNoXO2EdZEsxpKZC8YPlHHtGcig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aSsSoZHX8bsHhvlP8E1Qj1Oivhu7LQZU8Yo6qWvDZDU=;
 b=bG3bqsIhwX7m63IgKcLQ4QKk1NL1Qb9Ek5nI1rugRv2Q+KkLsGS9vzF1QLrl8o/KPzxzyqEZSzZ/vttHpZiNGAZ66ZN89Xi/kVf7/V3Pf1QIUkGrmBU2h9sbLE66bOXQZHo62Axe+NE1oHbz++svY2K8rdeJNIMRPEid85DtfIFSC+9Xud6R13iSsJmJYBBLzQ5FB1Wtz0Jl7BlK5+Bq/t2RBN2dcrO/lzfXXdbGfJcRqu/Pu8N3WqBvZgrC/GQx96MSUlfwCMniET5/16TUDF039nGQsdUQuH+FVOMEAmWlk0Dp0BjLBYrgc0x3rR4wFKC42oL0gMv0O8FCa8LbTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 DM4PR11MB5971.namprd11.prod.outlook.com (2603:10b6:8:5e::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9009.13; Thu, 7 Aug 2025 18:22:39 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%3]) with mapi id 15.20.9009.016; Thu, 7 Aug 2025
 18:22:39 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Dugast, Francois" <francois.dugast@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "Mrozek, Michal"
 <michal.mrozek@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 02/11] drm/xe: Implement xe_pagefault_init
Thread-Topic: [PATCH 02/11] drm/xe: Implement xe_pagefault_init
Thread-Index: AQHcBpqUULnsSN/1VEeqxSPKxk3pY7RWQMSAgAAORACAATRDgA==
Date: Thu, 7 Aug 2025 18:22:39 +0000
Message-ID: <a269f74e7426eb389fe1e3db362943ca00059415.camel@intel.com>
References: <20250806062242.1090416-1-matthew.brost@intel.com>
 <20250806062242.1090416-3-matthew.brost@intel.com>
 <489d415972b3d9118e8d59911413802130827162.camel@intel.com>
 <aJPsVhVJUIrfUNtB@lstrano-desk.jf.intel.com>
In-Reply-To: <aJPsVhVJUIrfUNtB@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|DM4PR11MB5971:EE_
x-ms-office365-filtering-correlation-id: c26223e5-61c1-4ecb-e2cd-08ddd5df6421
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?N245WkExekJRL3hUOHZZR2FXRC81ajdjZEovZ2dPOGg3US9wczFFSFBXN1dO?=
 =?utf-8?B?SU83YXJ1OENNdmlrVDBqUWNtQ1VjOGZNZlFYVXBVK3Urc0tlN0YzSlJqejB2?=
 =?utf-8?B?STZaVTJsb2pUOXBKaFZBTGhpUWozR3BvSW90TmRDUFFXMS8yREtXVDlLNEpN?=
 =?utf-8?B?em5KdnllQmNlQk84eWswbWxkR3lyWWpMdXlGaXhjRDUvVVljNXFzQVNpL0oy?=
 =?utf-8?B?cnp5Zjg3ZGh3cEgwdERZRE9SenlkMXRMZXN4WVVGcUxsSGFHWUxpVnc2bVpR?=
 =?utf-8?B?SHdYejZkaDJvaWk3TnJMQ0F5OWY1S3NTNDdwRnNCYU5NVVQ5YkdCNXlsMjlJ?=
 =?utf-8?B?bk9wbGMxNmczR3o1dElFSlM4clZpbm01YU01bXhLQTh5UTFHSE92dUpFb1pI?=
 =?utf-8?B?Y2pEa1JJVmR2WnJMUGZuSXYvd1hJOTVlYk43S2pBRkNpS0Fnck5rLzNuUVg1?=
 =?utf-8?B?dU4zYlBiWUprUkdUbTcwOEFpalRaS0hWV3pwL1hYS09wN0FrOTJ1S1ZOTFhy?=
 =?utf-8?B?c1NGVlZVc2VDKzYyaXJWd0Y2S3QwcVZkNjhlcEZjb09XYXhqZGhGUzhCdjBi?=
 =?utf-8?B?ZGJMOS9weTdaczZGWTRINDJWOWRKTDNQUllpOW5YTXlZcENvR0RDQU9SVito?=
 =?utf-8?B?SnBzbUdWUGNaaUpOREw2WTFlc1RLTFRsa0xiSFJZRC8yOXEvZm8vL2tjaVNj?=
 =?utf-8?B?a3FubTdtOERpZVZwMnB4SlR6dnJud0RUUHJWc3g0WW1LbGRmUkk2em1JSnlt?=
 =?utf-8?B?bWwwM2hieVk0eFp5Z3EzRmpkUEs4RUhwbTdBZDJoYkpVVDdYK3dzYzVhaFdn?=
 =?utf-8?B?WExrVVlrTE5ERHdmNENobGNOQmVwV2FmUlJ5TjRGN1VRUEp5b3JZOHJXcUht?=
 =?utf-8?B?SzhZSXFxaHZiR2hLUTEwTTdieTg0ZjNEWUIxd2JKNjU2Ulo3ek13cUR3TzZ1?=
 =?utf-8?B?b0tMNG91dER4Z09IT0h3czNQNW1ZcVVueGxaNWhITG0xTTU1dVJZSWhtNWxT?=
 =?utf-8?B?N1A2NXZ4djJiOGcrVDRLVUYyWEVPMDBRWHdCMS9EWHdGU1I1WWJJVDlybnVp?=
 =?utf-8?B?UkRIQnlyRnNnK1hPTXAvV3JLc0gzTnNINWMvN0VqaTJObE91ZUtGaHE3RUpZ?=
 =?utf-8?B?N01scU1XVjVNTTlwMlUxYnV2dFpwaXpCVlMyRThWZmpNV3FoMjloeFhCRWtq?=
 =?utf-8?B?WTlNUzRyV29sZEI5WlBUMFlXMExQN2tDcEtCRmZDVHkycDR6SmMrSXlVSm5u?=
 =?utf-8?B?SnBCbU5oQkhRZm44M0JOSk5IVWpQNm5GVWlJcWhVM1IzV3o2TzZ4ZzgvcVdQ?=
 =?utf-8?B?SmVsN3V4UWdwYmpRUHVTWTZ5QUg2b1IzeG13T2FGeUdqUVFaOVlNemQzYW12?=
 =?utf-8?B?NU1uWXM1S0EycWFmZTFCd0FvVjFkL3ViTFNrbUl0bDNxRG9UdC8wTDZ2M3Rk?=
 =?utf-8?B?cDlRWFd2eXFjeWY1bkFLR1FZTHFqWHRzSDVSallnTjV3V3FxSCt1bmFva3pI?=
 =?utf-8?B?WHRXTVBibFJ4THlQN25LaE5MVEphblRYczVkWjRZWXVlamZtR09lZVZBR0xW?=
 =?utf-8?B?ZkFveGgwa2RyVnk5UU10NmI1Z0RtWm52ZnZ4U1N6cjUxeldoVFVYNThXZDBZ?=
 =?utf-8?B?UThzZUFLa1B5UDRGZjNDU2tidndZcnpzc0M4MGxvaEZnWjJqVkdtcVNuc1Aw?=
 =?utf-8?B?OEk3bnp4OHJqWUNDTmNuREVvWWNRbkJ3UWZndmpIUjBaM0FjR0lrb2I5SU5T?=
 =?utf-8?B?SDhMNFN0cnpsa1VRd1RuTVRsMDNEU2RLQWhBNmtjaVBZVWxYaHhsVy82Y1Zu?=
 =?utf-8?B?Z1VSbU5Ed1IxUDJUZlZ2MXViQnVrSXFJL2o3ZzBMWVpWR1RzVHA4eWV2alR3?=
 =?utf-8?B?V0QwM0s0emI0UXRFa0VYaFRmYloxV0RjZ3o2NjZmM3U2ZlhZZFNaOUhiUTBV?=
 =?utf-8?Q?sqlexBhFVRA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YmU0M3crWjNQcUljK3ZlZFlLT2w2WUhVdUl5NFRwVU5IamhwTklWazg0cUVv?=
 =?utf-8?B?b28wUVFQWDkybFUzOXcrejJDVC8xNEIybWJiR3dnNk1icklQc1ZMU1FXUGxT?=
 =?utf-8?B?MkdPT0ZySUx2M3ZaNHhFTHQ3NnRUL2N5TGMwajN3MFRJQlh3c3JqajNGZ2M4?=
 =?utf-8?B?K0lhV1BtSVFCbmh0QzZ2OWhjZmp0LzV6QlFtTUZtemNmWFJyNE5GUEQzaTBs?=
 =?utf-8?B?UG9DVHZDK3pDdGxEclVkVkx5NEFSZ3lacjEyTlhwbkIwMDRlUG5WelYzRFhS?=
 =?utf-8?B?STgyWEYrbHhJaElkb0FXMGhLSUZ3QW5RRGwxRTVXU2grU0ZKeklONGdQYThJ?=
 =?utf-8?B?T1NLRHRVOVlZb0h6d2E0TFJLZTRRK2VJZTdJamw2UzBONzRiUmtLWFJvVEht?=
 =?utf-8?B?d1l1T25vL0tLeUR4SWJXMU5yeUtuZDlCSFRmTEhUWHQzczdzT0QyMzRXM0Zu?=
 =?utf-8?B?Sjd2amV4d1RzVisycndxVVBTQnV6akVEb0Rmc0Z6OSs0TkJxVjBiWVFwSVhI?=
 =?utf-8?B?QXlsdXNNN1lpZndNTk9oMDN6T0ZRRnNsWHBDNkJycjVKWktVWll2QmxLNkhz?=
 =?utf-8?B?VUJMTThvVG9FZFNmNFA2QzA3bHY1M3hxYmdEZkRnS1h0VTRVSDRNRWp5THVs?=
 =?utf-8?B?NFhTbXBrQ2h0Nys3T2VPVDNjbWZKNG02enhSamNKakE2VmFvc1M2bjB4V3Bt?=
 =?utf-8?B?NTdhdzR4bk04VjMxM3VuR1k2akNDN2NiQ0M0U2dnallXUloyQmZEeHFOT1Bs?=
 =?utf-8?B?ZHo4KzlRV043NGJTTk5pbVRoSWk2WDZSckloRkVZTHAyTTEwQTZ4cTFWaTBO?=
 =?utf-8?B?TFAxWS8vMk5yeDJNVXpwRi95KzFRUm5LSGpNVUNsZUpVYkZVU3ZPeEVmUkor?=
 =?utf-8?B?NHNoZ2hHSDNUUXJDUjhYem51ZUZ1bE9hYnYyaFpHbE5PeHpjN2dNV0xWcEZs?=
 =?utf-8?B?VTExaEtWNGZzUWdxWFcwc2VNU0oreXIwYUFPMzFlalJZWmpXdzBOYzNlTExQ?=
 =?utf-8?B?WVo1dVRNL3p2dm1rdzM2eGZ4WkhQMHFRSkRKeTh2VmROSlpiWlYzOW50Tmdq?=
 =?utf-8?B?RExmRE02Wi9zOVVHblVJMlhxZ2RPUlczSVN1eEdxa3BQbzlNYW1QbEQ0R3la?=
 =?utf-8?B?SXQ2VXhZVVVhUGtGWStrdHkxY2ZHcTd5ZlNTRDY5SkVZcDh5VXNjN1c4bkxH?=
 =?utf-8?B?YXA3RTJxYmR1TG5TVTZoMmdiV2hHS001cWNUTERuaUhrMERQWjk5cHVNUHlP?=
 =?utf-8?B?enlPWUJLVnNRekdhWUd0L3RpUTlVSEhhUGVpbTJSbGIyZXVYUHQwa0VsQlI5?=
 =?utf-8?B?eVgyb2lSSW1GaHljOGpKUVl4eTA1MXBYVTJta3ppVk9sSnBlTitKeXVlQ3ky?=
 =?utf-8?B?YngzZ2RjWTl1RlE4LzBubTVvNktrSHdrbmRLVFVPOXVtU25yRFZtb083dlR3?=
 =?utf-8?B?VWlRdzB5NklPbVlZcG81YndNUUZuOWVzSEdPWkNvZGtabjZmQmV3TU5FYkt3?=
 =?utf-8?B?b2lHaWR2ZTJyN0RMdXZ4ajc5VDhWcXg0SXBWTmpNZ0VGTE9lRndHcHc3Tklw?=
 =?utf-8?B?OFUzRjVJcG1PalRMUUNUZkhQazlSSjZ2eEVNK21uYmd3bndITkJGVy9XRlBK?=
 =?utf-8?B?Um1sWTkyVDBkbVhFWWJxVG90VWhQS2IvbnhWRmtGSlNCb3lydnJZS2R6bTh4?=
 =?utf-8?B?ME1nNlZHbC9RVjhPYzJPT1FtZjU5SkFMb3lzd25vYmdoL1g3R3ZsTnBsSEs5?=
 =?utf-8?B?aXdSU01jSVpaZzRLSnI2M0hzQStHM01Ga3Zlb1RvRkJocDljT1Z5NUNUSEc0?=
 =?utf-8?B?N3IzTVY2ejRtUHBlTDFTMDhUcGxCUGZBcTBoRUt3bng4Zm9xM3gyYVhrZnlM?=
 =?utf-8?B?VmhUMGM3cjlYalZXdzFqL3NObUZzRlRTekliaER1b1VaRzl6eFpoNHhGRVY4?=
 =?utf-8?B?U0lhM25lS1krM3U1Y1Rtc2ExYVo1NVd0ckZQdS9QSW5tNnRya3dCNjZHa1RT?=
 =?utf-8?B?V01ZVFRjM1pqU0F5T0g3NkZIbDllcFNTT1hLMTVwQ2M1aE1KNnFjTkdXN0tT?=
 =?utf-8?B?MTU4SUl3ZWsrMlI0bzh2UFdKRjdxamREYWJtU2RpVDhYcW42QlNLdk9WZVdJ?=
 =?utf-8?B?ekNuUGs1SFNVVVFjajdRQmhOUzJxKyt1eFpYUGtyUWZoSmEzaUowd0YvS0dh?=
 =?utf-8?B?dWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2BBD9552C736804B9B56E48CCF505A66@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c26223e5-61c1-4ecb-e2cd-08ddd5df6421
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2025 18:22:39.0208 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BuoTJTW+AXgE/koRP6nKxd7pkD4ORQBiEB3SoP+DiZ77tw35EEJd/5nbaAqckQqpIE6OyaEHyCJScGkl5I9lwDdOVK2F1neUP8SgR21CCd8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5971
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

T24gV2VkLCAyMDI1LTA4LTA2IGF0IDE2OjU5IC0wNzAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOgo+
IE9uIFdlZCwgQXVnIDA2LCAyMDI1IGF0IDA1OjA4OjE4UE0gLTA2MDAsIFN1bW1lcnMsIFN0dWFy
dCB3cm90ZToKPiA+IE9uIFR1ZSwgMjAyNS0wOC0wNSBhdCAyMzoyMiAtMDcwMCwgTWF0dGhldyBC
cm9zdCB3cm90ZToKPiA+ID4gQ3JlYXRlIHBhZ2VmYXVsdCBxdWV1ZXMgYW5kIGluaXRpYWxpemUg
dGhlbS4KPiA+ID4gCj4gPiA+IFNpZ25lZC1vZmYtYnk6IE1hdHRoZXcgQnJvc3QgPG1hdHRoZXcu
YnJvc3RAaW50ZWwuY29tPgo+ID4gPiAtLS0KPiA+ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVf
ZGV2aWNlLmPCoMKgwqDCoMKgwqAgfMKgIDUgKysKPiA+ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUv
eGVfZGV2aWNlX3R5cGVzLmggfMKgIDYgKysKPiA+ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVf
cGFnZWZhdWx0LmPCoMKgwqAgfCA5Mwo+ID4gPiArKysrKysrKysrKysrKysrKysrKysrKysrKyst
Cj4gPiA+IMKgMyBmaWxlcyBjaGFuZ2VkLCAxMDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKPiA+ID4gCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNl
LmMKPiA+ID4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlLmMKPiA+ID4gaW5kZXggNTdl
ZGJjNjNkYTZmLi5jN2M4YWVlMDM4NDEgMTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9kZXZpY2UuYwo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNl
LmMKPiA+ID4gQEAgLTUwLDYgKzUwLDcgQEAKPiA+ID4gwqAjaW5jbHVkZSAieGVfbnZtLmgiCj4g
PiA+IMKgI2luY2x1ZGUgInhlX29hLmgiCj4gPiA+IMKgI2luY2x1ZGUgInhlX29ic2VydmF0aW9u
LmgiCj4gPiA+ICsjaW5jbHVkZSAieGVfcGFnZWZhdWx0LmgiCj4gPiA+IMKgI2luY2x1ZGUgInhl
X3BhdC5oIgo+ID4gPiDCoCNpbmNsdWRlICJ4ZV9wY29kZS5oIgo+ID4gPiDCoCNpbmNsdWRlICJ4
ZV9wbS5oIgo+ID4gPiBAQCAtODkwLDYgKzg5MSwxMCBAQCBpbnQgeGVfZGV2aWNlX3Byb2JlKHN0
cnVjdCB4ZV9kZXZpY2UgKnhlKQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgaWYgKGVycikKPiA+ID4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gZXJyOwo+ID4gPiDCoAo+ID4g
PiArwqDCoMKgwqDCoMKgwqBlcnIgPSB4ZV9wYWdlZmF1bHRfaW5pdCh4ZSk7Cj4gPiA+ICvCoMKg
wqDCoMKgwqDCoGlmIChlcnIpCj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBy
ZXR1cm4gZXJyOwo+ID4gPiArCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqB4ZV9udm1faW5pdCh4ZSk7
Cj4gPiA+IMKgCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqBlcnIgPSB4ZV9oZWNpX2dzY19pbml0KHhl
KTsKPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2VfdHlwZXMu
aAo+ID4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2VfdHlwZXMuaAo+ID4gPiBpbmRl
eCAwMWU4ZmEwZDJmOWYuLjZhYTExOTAyNmNlOSAxMDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX2RldmljZV90eXBlcy5oCj4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9kZXZpY2VfdHlwZXMuaAo+ID4gPiBAQCAtMTcsNiArMTcsNyBAQAo+ID4gPiDCoCNpbmNs
dWRlICJ4ZV9sbXR0X3R5cGVzLmgiCj4gPiA+IMKgI2luY2x1ZGUgInhlX21lbWlycV90eXBlcy5o
Igo+ID4gPiDCoCNpbmNsdWRlICJ4ZV9vYV90eXBlcy5oIgo+ID4gPiArI2luY2x1ZGUgInhlX3Bh
Z2VmYXVsdF90eXBlcy5oIgo+ID4gPiDCoCNpbmNsdWRlICJ4ZV9wbGF0Zm9ybV90eXBlcy5oIgo+
ID4gPiDCoCNpbmNsdWRlICJ4ZV9wbXVfdHlwZXMuaCIKPiA+ID4gwqAjaW5jbHVkZSAieGVfcHRf
dHlwZXMuaCIKPiA+ID4gQEAgLTM5NCw2ICszOTUsMTEgQEAgc3RydWN0IHhlX2RldmljZSB7Cj4g
PiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgdTMyIG5leHRfYXNpZDsKPiA+ID4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAvKiogQHVzbS5sb2NrOiBwcm90ZWN0cyBV
TSBzdGF0ZSAqLwo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCBy
d19zZW1hcGhvcmUgbG9jazsKPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC8q
KiBAdXNtLnBmX3dxOiBwYWdlIGZhdWx0IHdvcmsgcXVldWUsIHVuYm91bmQsCj4gPiA+IGhpZ2gK
PiA+ID4gcHJpb3JpdHkgKi8KPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHN0
cnVjdCB3b3JrcXVldWVfc3RydWN0ICpwZl93cTsKPiA+ID4gKyNkZWZpbmUgWEVfUEFHRUZBVUxU
X1FVRVVFX0NPVU5UwqDCoMKgwqDCoMKgwqA0Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAvKiogQHBmX3F1ZXVlOiBQYWdlIGZhdWx0IHF1ZXVlcyAqLwo+ID4gPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IHhlX3BhZ2VmYXVsdF9xdWV1ZQo+ID4gPiBw
Zl9xdWV1ZVtYRV9QQUdFRkFVTFRfUVVFVUVfQ09VTlRdOwo+ID4gPiDCoMKgwqDCoMKgwqDCoMKg
fSB1c207Cj4gPiA+IMKgCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqAvKiogQHBpbm5lZDogcGlubmVk
IEJPIHN0YXRlICovCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfcGFn
ZWZhdWx0LmMKPiA+ID4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcGFnZWZhdWx0LmMKPiA+ID4g
aW5kZXggM2NlMGU4ZDc0YjlkLi4xNDMwNGM0MWViMjMgMTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9wYWdlZmF1bHQuYwo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfcGFnZWZhdWx0LmMKPiA+ID4gQEAgLTMsNiArMywxMCBAQAo+ID4gPiDCoCAqIENvcHly
aWdodCDCqSAyMDI1IEludGVsIENvcnBvcmF0aW9uCj4gPiA+IMKgICovCj4gPiA+IMKgCj4gPiA+
ICsjaW5jbHVkZSA8ZHJtL2RybV9tYW5hZ2VkLmg+Cj4gPiA+ICsKPiA+ID4gKyNpbmNsdWRlICJ4
ZV9kZXZpY2UuaCIKPiA+ID4gKyNpbmNsdWRlICJ4ZV9ndF90eXBlcy5oIgo+ID4gPiDCoCNpbmNs
dWRlICJ4ZV9wYWdlZmF1bHQuaCIKPiA+ID4gwqAjaW5jbHVkZSAieGVfcGFnZWZhdWx0X3R5cGVz
LmgiCj4gPiA+IMKgCj4gPiA+IEBAIC0xOSw2ICsyMyw3MSBAQAo+ID4gPiDCoCAqIHdpdGggYSBz
aW5nbGUgc2hhcmVkIGNvbnN1bWVyLgo+ID4gPiDCoCAqLwo+ID4gPiDCoAo+ID4gPiArc3RhdGlj
IGludCB4ZV9wYWdlZmF1bHRfZW50cnlfc2l6ZSh2b2lkKQo+ID4gPiArewo+ID4gPiArwqDCoMKg
wqDCoMKgwqByZXR1cm4gcm91bmR1cF9wb3dfb2ZfdHdvKHNpemVvZihzdHJ1Y3QgeGVfcGFnZWZh
dWx0KSk7Cj4gPiAKPiA+IE5pY2UgdGhhbmtzIQo+ID4gCj4gPiA+ICt9Cj4gPiA+ICsKPiA+ID4g
K3N0YXRpYyB2b2lkIHhlX3BhZ2VmYXVsdF9xdWV1ZV93b3JrKHN0cnVjdCB3b3JrX3N0cnVjdCAq
dykKPiA+ID4gK3sKPiA+ID4gK8KgwqDCoMKgwqDCoMKgLyogVE9ETzogSW1wbGVtZW50ICovCj4g
PiA+ICt9Cj4gPiA+ICsKPiA+ID4gK3N0YXRpYyBpbnQgeGVfcGFnZWZhdWx0X3F1ZXVlX2luaXQo
c3RydWN0IHhlX2RldmljZSAqeGUsCj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IHhlX3BhZ2VmYXVs
dF9xdWV1ZQo+ID4gPiAqcGZfcXVldWUpCj4gPiA+ICt7Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoHN0
cnVjdCB4ZV9ndCAqZ3Q7Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoGludCB0b3RhbF9udW1fZXVzID0g
MDsKPiA+ID4gK8KgwqDCoMKgwqDCoMKgdTggaWQ7Cj4gPiA+ICsKPiA+ID4gK8KgwqDCoMKgwqDC
oMKgZm9yX2VhY2hfZ3QoZ3QsIHhlLCBpZCkgewo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgeGVfZHNzX21hc2tfdCBhbGxfZHNzOwo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgaW50IG51bV9kc3MsIG51bV9ldXM7Cj4gPiA+ICsKPiA+ID4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoGJpdG1hcF9vcihhbGxfZHNzLCBndC0+ZnVzZV90b3BvLmdf
ZHNzX21hc2ssCj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgZ3QtPmZ1c2VfdG9wby5jX2Rzc19tYXNrLAo+ID4gPiBYRV9NQVhfRFNTX0ZVU0Vf
QklUUyk7Cj4gPiA+ICsKPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoG51bV9k
c3MgPSBiaXRtYXBfd2VpZ2h0KGFsbF9kc3MsCj4gPiA+IFhFX01BWF9EU1NfRlVTRV9CSVRTKTsK
PiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoG51bV9ldXMgPSBiaXRtYXBfd2Vp
Z2h0KGd0LQo+ID4gPiA+IGZ1c2VfdG9wby5ldV9tYXNrX3Blcl9kc3MsCj4gPiA+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqBYRV9NQVhfRVVfRlVTRV9CSVRTKSAqCj4gPiA+IG51bV9kc3M7Cj4gPiA+
ICsKPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHRvdGFsX251bV9ldXMgKz0g
bnVtX2V1czsKPiA+IAo+ID4gSSdtIGJlaGluZCBvbiB0aGF0IHBhdGNoIEkgaGFkIHBvc3RlZCBh
IHdoaWxlIGJhY2sgdG8gdXBkYXRlIHRoaXMKPiA+IGFsZ29yaXRobSA6KC4gV2FudCB0byBwdWxs
IHRoYXQgY2FsY3VsYXRpb24gaW4gaGVyZSBkaXJlY3RseSBzbyB3ZQo+ID4gY2FuCj4gPiByZW1v
dmUgdGhlIFBGX01VTFRJUExJRVIgeW91IGhhdmUgYmVsb3c/Cj4gPiAKPiA+IFNlZQo+ID4gaHR0
cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoLzY1MTQxNS8/c2VyaWVzPTE0ODUy
MyZyZXY9MQo+ID4gCj4gPiBJIGNhbiBhbHNvIHJld29yayB0aGF0IG9uIHRvcCBvZiB0aGlzIGlm
IHlvdSdkIHByZWZlciwgZWl0aGVyIHdheQo+ID4gaXMKPiA+IGZpbmUgd2l0aCBtZS4KPiA+IAo+
IAo+IEVpdGhlciB3YXkgd29ya3MgZm9yIG1lLiBJZiB5b3UgZ2V0IHRoaXMgb25lIGluIGFoZWFk
IG9mIG1lLCBubwo+IGlzc3VpbmcKPiBwaWNraW5nIGl0IHVwIGluIGEgcmViYXNlIG9yIG9mYyBp
ZiBsYW5kcyBmaXJzdCB5b3UgY2FuIHBvc3Qgb24gdG9wCj4gb2YKPiB0aGlzLiBJZiB5b3UgYXJl
IGNvbmNlcm5lZCBhYm91dCBoaXN0b3J5LCB0aGVuIHRoZSBsYXRlciBtaWdodCBiZQo+IGJldHRl
ci4KCk9rIEknbGwgaG9sZCBvZmYgcHVzaGluZyBtaW5lIGJhY2sgdG8gdGhlIGxpc3QgdW50aWwg
eW91J3JlIGRvbmUuIEkgd2FzCmFsc28gc3VnZ2VzdGluZyB5b3UgY291bGQganVzdCBwdWxsIG15
IGNoYW5nZXMgaW50byB5b3VyIHBhdGNoIGlmIHlvdQp3YW50ZWQsIGFsdGhvdWdoIG1heWJlIHRo
YXQgY29tcGxpY2F0ZXMgd2hhdCBpcyBtb3N0bHkgYW4gaW50ZXJuYWwKaW50ZXJmYWNlIHVwZGF0
ZSBoZXJlIHdpdGggbW9yZSBmdW5jdGlvbmFsLWZvY3VzZWQgY2hhbmdlcy4gQnV0IGlmIHlvdQpk
ZWNpZGUgbm90IHRvIGRvIHRoYXQgSSdsbCBqdXN0IHdhaXQgdW50aWwgeW91cnMgbGFuZCBhbmQg
cHVsbCBpdCBpbiBvbgp0b3AuCgpUaGFua3MsClN0dWFydAoKPiAKPiBNYXR0Cj4gCj4gPiBUaGFu
a3MsCj4gPiBTdHVhcnQKPiA+IAo+ID4gPiArwqDCoMKgwqDCoMKgwqB9Cj4gPiA+ICsKPiA+ID4g
K8KgwqDCoMKgwqDCoMKgeGVfYXNzZXJ0KHhlLCB0b3RhbF9udW1fZXVzKTsKPiA+ID4gKwo+ID4g
PiArwqDCoMKgwqDCoMKgwqAvKgo+ID4gPiArwqDCoMKgwqDCoMKgwqAgKiB1c2VyIGNhbiBpc3N1
ZSBzZXBhcmF0ZSBwYWdlIGZhdWx0cyBwZXIgRVUgYW5kIHBlciBDUwo+ID4gPiArwqDCoMKgwqDC
oMKgwqAgKgo+ID4gPiArwqDCoMKgwqDCoMKgwqAgKiBYWFg6IE11bHRpcGxpZXIgcmVxdWlyZWQg
YXMgY29tcHV0ZSBVTUQgYXJlIGdldHRpbmcgUEYKPiA+ID4gcXVldWUgZXJyb3JzCj4gPiA+ICvC
oMKgwqDCoMKgwqDCoCAqIHdpdGhvdXQgaXQuIEZvbGxvdyBvbiB3aHkgdGhpcyBtdWx0aXBsaWVy
IGlzIHJlcXVpcmVkLgo+ID4gPiArwqDCoMKgwqDCoMKgwqAgKi8KPiA+ID4gKyNkZWZpbmUgUEZf
TVVMVElQTElFUsKgwqA4Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoHBmX3F1ZXVlLT5zaXplID0gKHRv
dGFsX251bV9ldXMgKyBYRV9OVU1fSFdfRU5HSU5FUykgKgo+ID4gPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgeGVfcGFnZWZhdWx0X2VudHJ5X3NpemUoKSAqIFBGX01VTFRJUExJRVI7
Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoHBmX3F1ZXVlLT5zaXplID0gcm91bmR1cF9wb3dfb2ZfdHdv
KHBmX3F1ZXVlLT5zaXplKTsKPiA+ID4gKyN1bmRlZiBQRl9NVUxUSVBMSUVSCj4gPiA+ICsKPiA+
ID4gK8KgwqDCoMKgwqDCoMKgZHJtX2RiZygmeGUtPmRybSwgInhlX3BhZ2VmYXVsdF9lbnRyeV9z
aXplPSVkLAo+ID4gPiB0b3RhbF9udW1fZXVzPSVkLCBwZl9xdWV1ZS0+c2l6ZT0ldSIsCj4gPiA+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB4ZV9wYWdlZmF1bHRfZW50cnlfc2l6ZSgp
LCB0b3RhbF9udW1fZXVzLAo+ID4gPiBwZl9xdWV1ZS0KPiA+ID4gPiBzaXplKTsKPiA+ID4gKwo+
ID4gPiArwqDCoMKgwqDCoMKgwqBwZl9xdWV1ZS0+ZGF0YSA9IGRldm1fa3phbGxvYyh4ZS0+ZHJt
LmRldiwgcGZfcXVldWUtCj4gPiA+ID5zaXplLAo+ID4gPiBHRlBfS0VSTkVMKTsKPiA+ID4gK8Kg
wqDCoMKgwqDCoMKgaWYgKCFwZl9xdWV1ZS0+ZGF0YSkKPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoHJldHVybiAtRU5PTUVNOwo+ID4gPiArCj4gPiA+ICvCoMKgwqDCoMKgwqDC
oHNwaW5fbG9ja19pbml0KCZwZl9xdWV1ZS0+bG9jayk7Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoElO
SVRfV09SSygmcGZfcXVldWUtPndvcmtlciwgeGVfcGFnZWZhdWx0X3F1ZXVlX3dvcmspOwo+ID4g
PiArCj4gPiA+ICvCoMKgwqDCoMKgwqDCoHJldHVybiAwOwo+ID4gPiArfQo+ID4gPiArCj4gPiA+
ICtzdGF0aWMgdm9pZCB4ZV9wYWdlZmF1bHRfZmluaSh2b2lkICphcmcpCj4gPiA+ICt7Cj4gPiA+
ICvCoMKgwqDCoMKgwqDCoHN0cnVjdCB4ZV9kZXZpY2UgKnhlID0gYXJnOwo+ID4gPiArCj4gPiA+
ICvCoMKgwqDCoMKgwqDCoGRlc3Ryb3lfd29ya3F1ZXVlKHhlLT51c20ucGZfd3EpOwo+ID4gPiAr
fQo+ID4gPiArCj4gPiA+IMKgLyoqCj4gPiA+IMKgICogeGVfcGFnZWZhdWx0X2luaXQoKSAtIFBh
Z2UgZmF1bHQgaW5pdAo+ID4gPiDCoCAqIEB4ZTogeGUgZGV2aWNlIGluc3RhbmNlCj4gPiA+IEBA
IC0yOSw4ICs5OCwyOCBAQAo+ID4gPiDCoCAqLwo+ID4gPiDCoGludCB4ZV9wYWdlZmF1bHRfaW5p
dChzdHJ1Y3QgeGVfZGV2aWNlICp4ZSkKPiA+ID4gwqB7Cj4gPiA+IC3CoMKgwqDCoMKgwqDCoC8q
IFRPRE8gLSBpbXBsZW1lbnQgKi8KPiA+ID4gLcKgwqDCoMKgwqDCoMKgcmV0dXJuIDA7Cj4gPiA+
ICvCoMKgwqDCoMKgwqDCoGludCBlcnIsIGk7Cj4gPiA+ICsKPiA+ID4gK8KgwqDCoMKgwqDCoMKg
aWYgKCF4ZS0+aW5mby5oYXNfdXNtKQo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgcmV0dXJuIDA7Cj4gPiA+ICsKPiA+ID4gK8KgwqDCoMKgwqDCoMKgeGUtPnVzbS5wZl93cSA9
Cj4gPiA+IGFsbG9jX3dvcmtxdWV1ZSgieGVfcGFnZV9mYXVsdF93b3JrX3F1ZXVlIiwKPiA+ID4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoFdRX1VOQk9VTkQgfCBXUV9ISUdIUFJJLAo+ID4gPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgWEVfUEFHRUZBVUxUX1FVRVVFX0NPVU5UKQo+ID4gPiA7Cj4gPiA+
ICvCoMKgwqDCoMKgwqDCoGlmICgheGUtPnVzbS5wZl93cSkKPiA+ID4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoHJldHVybiAtRU5PTUVNOwo+ID4gPiArCj4gPiA+ICvCoMKgwqDCoMKg
wqDCoGZvciAoaSA9IDA7IGkgPCBYRV9QQUdFRkFVTFRfUVVFVUVfQ09VTlQ7ICsraSkgewo+ID4g
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZXJyID0geGVfcGFnZWZhdWx0X3F1ZXVl
X2luaXQoeGUsIHhlLQo+ID4gPiA+dXNtLnBmX3F1ZXVlICsKPiA+ID4gaSk7Cj4gPiA+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAoZXJyKQo+ID4gPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGdvdG8gZXJyX291dDsKPiA+ID4gK8KgwqDC
oMKgwqDCoMKgfQo+ID4gPiArCj4gPiA+ICvCoMKgwqDCoMKgwqDCoHJldHVybiBkZXZtX2FkZF9h
Y3Rpb25fb3JfcmVzZXQoeGUtPmRybS5kZXYsCj4gPiA+IHhlX3BhZ2VmYXVsdF9maW5pLCB4ZSk7
Cj4gPiA+ICsKPiA+ID4gK2Vycl9vdXQ6Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoGRlc3Ryb3lfd29y
a3F1ZXVlKHhlLT51c20ucGZfd3EpOwo+ID4gPiArwqDCoMKgwqDCoMKgwqByZXR1cm4gZXJyOwo+
ID4gPiDCoH0KPiA+ID4gwqAKPiA+ID4gwqAvKioKPiA+IAoK
