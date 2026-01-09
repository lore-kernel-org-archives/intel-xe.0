Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19E84D26D8F
	for <intel-xe@archiver.kernel.org>; Fri,  9 Jan 2026 19:37:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAD4B10E1EA;
	Fri,  9 Jan 2026 19:37:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gPtztA2L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2320510E1EA
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Jan 2026 19:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767987446; x=1799523446;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=6wKrzGl5mtAqaSgZesz6RLcAvNDigxVVyFjUAV9dSUw=;
 b=gPtztA2LcgBCO/+KnzViJGNGVzBHv0HVtT90ztMw7eWlyVMJkhFqYf7i
 MUXbK3GIT1tC1KA0G9085ClKYG+em2luuajl+UOrkBWnjEGK+aq9CUIs1
 DNS5CiKOHfkNuOdfVA+Nu0ay97oOlRtz7uTuEwC6xPpM6Wt9oIcZk4YI0
 2kiZQwAd/i03SOUOmLGJLE9n4xe3FBKXGULWuecD+mqbC0V1b32xcTTLT
 SUPjCnNkmRWsEx6U1JI5LFFLFrBJNkGJazH1lM0CGV/Ub7fzhAlDrm2K+
 c/BenJZIY2vtqk1r3UXHqg8VlaCp0oH1Pvivxs/ld/XpyOGHMuq4KQISr Q==;
X-CSE-ConnectionGUID: KRK0lDT0QqSqDhc3a7lSDQ==
X-CSE-MsgGUID: rAErO9W3Tl23WTOHaSketw==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="69420268"
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; d="scan'208";a="69420268"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 11:37:25 -0800
X-CSE-ConnectionGUID: EE5Ap5D5TZ+RCEzqlTqpfA==
X-CSE-MsgGUID: KwXogpJKRRWY0rHJEIGG8g==
X-ExtLoop1: 1
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 11:37:25 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 11:37:25 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 9 Jan 2026 11:37:25 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.45) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 11:37:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PF5H4c8q/8v/FPLPj6G9eAuv9Ul4pZA/fkBMd8wuRnbTyxUUT9a1YeoJvCBbBPfftEVAs8SQPUKVeNqC3Pt9ZCQul0zYdT7/QId8vpIiqj/00KVqRTpDfbwNyXyaI+RYvksgm421xltTVfjIvrwXBjOyBmvmlZK16OR2x5bnkQuBtE/T3tWxyxW3Cm0xf19BjBM7ezCeiGvbL2j/BiG4wQYN1oqC15UDFZV3tISQldw224i4skeRJyHR0HH7XL0H9LB2yXKW3rVbDvW0/LezZxKjQ19ixjYR8pX3lkwAGIwDI3seTDlVbGnVEvmzs3Ro1DtdrxGzGxiReBbj/ZNfDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rzwyp2F73KULAu43GQmbHE61muznnzsWGufEd+SRX/s=;
 b=KUKb/XUs5soEO5kqxrTvYuj9oX8F86r97JqLM1rJL6dl9dQNeGhJ6vgvpvzNtSpi9zuTFrczzXpzyXiVfkXiQnJoeegLsNEg+OEJLk6R6AkbSdQ8anB3LJgjY9murLRChjSi04yKHW1G37gjmTDwUPMu+D6pZe0HVRp8U3O1GVoj4Md24RnsCcKpf9MnwCYgeuTV51y7vv1S98Hd3fxlLj0XSGhe/WCmZ27ASdH7g2nZH83jGwVjKssSKk7Eu38ZO8uXpXQd40OSGC/TFg2SoONbANHvyDvgQUEI2cj0cZxFTCmBlkD3YvPkkBZSe9r0x4M7c3uthLAAHAuMyOM9yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8280.namprd11.prod.outlook.com (2603:10b6:806:25d::21)
 by PH0PR11MB7448.namprd11.prod.outlook.com (2603:10b6:510:26c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Fri, 9 Jan
 2026 19:37:16 +0000
Received: from SA1PR11MB8280.namprd11.prod.outlook.com
 ([fe80::cdde:8d34:980c:776e]) by SA1PR11MB8280.namprd11.prod.outlook.com
 ([fe80::cdde:8d34:980c:776e%5]) with mapi id 15.20.9499.003; Fri, 9 Jan 2026
 19:37:16 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260109164250.237044-2-balasubramani.vivekanandan@intel.com>
References: <20260109164250.237044-2-balasubramani.vivekanandan@intel.com>
Subject: Re: [PATCH] drm/xe/xe2hpg: Performance tuning changes
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 <intel-xe@lists.freedesktop.org>
Date: Fri, 9 Jan 2026 16:37:11 -0300
Message-ID: <176798743165.16319.15130481848588509084@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: BY1P220CA0009.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::7) To SA1PR11MB8280.namprd11.prod.outlook.com
 (2603:10b6:806:25d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8280:EE_|PH0PR11MB7448:EE_
X-MS-Office365-Filtering-Correlation-Id: f18a03b5-decd-4a39-d415-08de4fb67ea8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZGxhRGFmQnZkWk1rMlVWRkw5K3VRNndobzlxKy9nTzF0a3d5bjcwYmZkUDVk?=
 =?utf-8?B?YTVaenZNcTFRVEh2SUJpbmpVdnd1K3lBUy9LQXljSGx1NnRaZk9RWFBqY0VT?=
 =?utf-8?B?Z0pnQXg4UVkramlBUkw4RS9WOHc0cklLS0Y2d0JzTkRKN1FUNXhyNUc3NWw5?=
 =?utf-8?B?YXZNZThwRTZaYjdDMVFoR0F5dWZhVjlTRmhBcFBuQTNlRnU1VDk4eHdQc0cy?=
 =?utf-8?B?UnJhRmp5aUFaT2JFb0lOellUc0poZkpldWNMTzNndlJsc1ZKNUgyR1d4NDgz?=
 =?utf-8?B?WEJhbndRRHAzRll4a1h3NDZUOTFJdG5HclZpT0xjU0pIRVdyY1A2ZXNkbjV0?=
 =?utf-8?B?aVZ4VndGU3Y0R0lwR1ovOXQ0WDk3cmVZUExpZFh5N0NqNFZhZFlnMmlNT3Zi?=
 =?utf-8?B?R3J3SkM2Sm1mdG1PN2gwcjR2WDk0TVNHU3M3NkJlaU9vNldTclJpZ1VjYktU?=
 =?utf-8?B?eVk1RmNTN2srQ2U3M09PYW90SlU3QlRjYld4bCtMbHlNQVNzRjNrTFBVbWdM?=
 =?utf-8?B?c05QTXRvK1VRRzJ1ZUdNSnQ4NHgyU3QzS2tmeXVTRWlvblBVV3l2WW1tWDJM?=
 =?utf-8?B?UmlHRnZ0cDlmeUVsN3IvWUU5QThoMXZCYThZVFRpamlQQ21yYWhqeWkxZlNV?=
 =?utf-8?B?b2EyTzg2bjlnNUswVXhocXY1ZG4rcGo4K1d4S0loV21BMnRremt2bHBPOC9N?=
 =?utf-8?B?S3NmeVJtVDFmYUFrU1h1TnR3dkszaUwvSTh2T29rVGZpejhEMHFNeWVvQ1lu?=
 =?utf-8?B?UyttUCs2WGZZWXlPaDd1RjBkZFR1SFUwVlNrVUNIdks4WVRnYWhVdDdNcXJV?=
 =?utf-8?B?MnZGTkFHclpTbXNtNUJ6VzZQdWgrbTNiemFnSENVRVZiQVRwYmc1aFVzSDdO?=
 =?utf-8?B?NjBnWFF0dlRISWFuNVBjU2ZvNi9JUy9GVHJDVE5YZXRkMFNYSzU4RUY5L2J6?=
 =?utf-8?B?WGtHTW5nUGd5c21TL1k0OU9aS3dJRVZ0ZWFmMUJCTVNpYXJuOFdsRWljM3ZX?=
 =?utf-8?B?Qks5ZElDbHFnY09xN25aajNkNm1TQmI3RDIxUVhMNnNkRE9uVDlReUVya1Bk?=
 =?utf-8?B?NlNReE5Nc3B5dHhaT0pGNk5mVGM3ZGZRQ0FSQkJVeWNVeGkxVklzdUpPdHds?=
 =?utf-8?B?M2puV0FTSWZPdnpJKzJrUk9uOVRBelg4b0NaVElZR2w4U3cvLzFycUdHOTZq?=
 =?utf-8?B?UGM1ZVNXWTEvUXVEWFJEWVBkKzNSMEhyUFJuRTRkMTliU1I0MGt6Y3g1WDNi?=
 =?utf-8?B?VGI5QVRpcUNCMWx4ZElXNE52M0d6TVRIZGt3YnJmU3BpME9tQ3EyM2NTcmEw?=
 =?utf-8?B?RFBCbk1GN1g3N2QySm14R243Q3pQNVlkc3VtRDQwSWdReGRNd3loRFRkdWJ4?=
 =?utf-8?B?VjlBQmI2cXVkcFBWSXNsNG4xZ1p6YXBGOHZlNjduTlFZU0t4MUNVeEhsaXBl?=
 =?utf-8?B?UEphSXQrbmF2dFo1Mk1la0NNN3g2RUJsamZiTXJXbXAvcUl6WjVBT2tiWWRN?=
 =?utf-8?B?SUZSZmllNGVyY1lnQlgzdkIxUGdNbEhhcDU2c0Q3UWJZM21JZkZSTDVNNXVB?=
 =?utf-8?B?emllUDJOK3lCeUlQTjVVVlBhV2FKSlNJMndlMGZGSXQ1Mmc2ZUpvNEllT0V1?=
 =?utf-8?B?dTl1NEowMEliMXJMVEsvMFJqSmErNm1kTjhra29oVXM4RDI2eXFLMUZaclh2?=
 =?utf-8?B?QTdPbUVZaFFHK3Y5L0dTaUdEZ0tSKzhabE85QVRzNFlkN2RIa3ZQQjVMeVpK?=
 =?utf-8?B?dDEreUx1K2RYTUhONitJUTY0cVovWU1WaFNCWHd1TFhFQmZUbytvNE9JWWNR?=
 =?utf-8?B?WUxxRVBMbWZtbEs1RDdVY2JwU0l3QURrcENxRzlnbVJPcEFUeGNqb0RXUEFK?=
 =?utf-8?B?Z2szR0Z3WTZNS3RwbXRpK2JVOGZHWnp0UUREdVUzbDU5alRCNkFaZUh4cEta?=
 =?utf-8?Q?2GY8kSXF6/3uOK/vXbJaWGNrRx2WetCi?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8280.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WENQa0Z1K1NhMWJXTmhLbnV6UjBtQTdXZVJ2cXVTMVZxNE1xQnlCdjF0Ulh2?=
 =?utf-8?B?K2ZPK3drSFNoWjFqN1ZIWDdpSE1iUlhrWThxMjdTZFBIZmloYVJEQitjZWZN?=
 =?utf-8?B?MThTWVA2UkQyK3RGYTNtdk5VU005VWtzeWlQbHQyZjkvc3paQzA0Q0UvMzVZ?=
 =?utf-8?B?UkRGeG9kM1ZVaU1GWGVRTEg4aXpFZzVYY0QxM3JIQVpLci9lRlhZRTA1TEVR?=
 =?utf-8?B?SFRTa2MxRWJhU0FveWozRSt4aVRHVzdqQ05qSlFUOXpoaHN2REpjVWdoNmkx?=
 =?utf-8?B?MzdHNjBGdURyK3VRZEM0STdZVGxqVmFDeDl6akg3ekFPVkdCQ0RyVVJGeVdT?=
 =?utf-8?B?MWR3MVFWU0g4eXVjYmVTMVJ3VEVSbkhoblUvbGtlT2M3S3FJdURyT0dSWHhR?=
 =?utf-8?B?WXdwcGZscjJwVmt1K01FYkc5ZC96Ym1CSXFpeFd4MzBmRXBDeDZycDZEUCtz?=
 =?utf-8?B?SW1GTkk2ajFqOVdkOE1QWDQ1SlNzZHBLWUlOL3B3bm94aEVrWEtxQWxtWXN6?=
 =?utf-8?B?azJRRTYyUXJxTmlyRlBzdXBscTl3SUQ2ZjA4bVJOd1JHR1kvZE1PU1dqMUky?=
 =?utf-8?B?MWxXUVp1NG1ORUpVQ2JUYkZ6cHNadXl2dk5DMzhTcXRTeHpqY0RLTGxyQlV3?=
 =?utf-8?B?cC9FdmZ1Zm1yYVVWa2crYWlxZkZUZXRmVWordnkrc0NVZzZ0dGEyME84ZFhm?=
 =?utf-8?B?WEJxYWF5RVZ5TldBNGFjdEFXSFNONnVPdVhQTGZlVUxTVmszc0g3cnl4YjJq?=
 =?utf-8?B?dEIyWDNlVEF1eHNnaG1YZWhSS0VUMDZ0MEdzM0huRXZIOEZ1NCtFeVVVOXZO?=
 =?utf-8?B?d1E5dkR6L0oySUVFdzJJSzAyTHFUNXlKY0R6S3VVMFdlVlJ4UlJGNkFmUGEv?=
 =?utf-8?B?WGdhOVVoZTJLWVRZbjJ3eVBsTjlRMHRQZjRaV3k0aG11N1JmNi9WalB3T01o?=
 =?utf-8?B?c0dUMXBxdngzSVRFUTlUNmNFMngzTXF5TS9YS1FRVzI0QUdBL1ZIYmNna3Av?=
 =?utf-8?B?MXZ1YWtrY2RRZjNZOFVIMFhQYytlaUtPOGpkTnRBM09LakRNYllGOFhkWEc2?=
 =?utf-8?B?Q0hudXQ0WEw3c3ZDN3YxWG5LVVFDMjFLNG9hV0VHUW5TQ08yUk4yc3hxM2V4?=
 =?utf-8?B?THpxUnV2RGE5UjNQZ21XRVVaZlVxUlZTNlhEQUhLTUdjUWxveE9zR2hINFFn?=
 =?utf-8?B?RzFRQkZMaW8xVEFWWGMxRkFkNzIxVktSR29DN1pXeExVSUtzSS80TWphT1h5?=
 =?utf-8?B?M1VvNSs4bURvZEY5dGJPdEpaU3FxdGdxdEkzTERQUTJaZXVFS2oreEpoOXhN?=
 =?utf-8?B?QUNtOXg4WTVOT3RRZjdZZ3NqQzUrMm4yemh2cXlLcnVSSjc2YmQrWTdQQzNk?=
 =?utf-8?B?SXl3NkEyU0xoN01VKzRNWXVsU04ramlaaDV1WFBwZFovQm8xazB4TnBSSVBm?=
 =?utf-8?B?VFN2NGNNQkhNMW0vYlVjOTJhWVhxcEQ5VjlRNnhhcitvaHpsVTNtVHF4Zlpk?=
 =?utf-8?B?NHJDNTFjd3dwbUp2TnJiV0I3WUxtTzU3SDhqSjlIRFlCUW1SVkZWZnp3TGdt?=
 =?utf-8?B?SU9uczFqWFg2QTBCSGlCdU1Xa0NtREJ5SDN3UUVicVpUcWp2Y3RQbUlqd3I4?=
 =?utf-8?B?Mk5GZVlnRW9vZDltOTVudlJqM2dhTW05M2ROb1k3QXp2bXFDVStWTllXOFpS?=
 =?utf-8?B?dTFYYVl3OTkvcm5uQXRQLzMvNU51eWJBaCtWdVJuMzVlaUc4K0NEL3pTbnR4?=
 =?utf-8?B?aktRbWZQYS9rL3JqVzJCcEJ3TTdxNVoxWmxsQjltOURMVWpPVGtjL0lYTFBp?=
 =?utf-8?B?UThFRHhBM0J2VXRONVJhdFN0MmJIV3RjR3N4OUY5VUVpOGl2dmhGUGwzS0lh?=
 =?utf-8?B?OHczVkhFZis1UTJ5clJvOXc2aFFhVzNCMElQZkkza2VWb3B0ekRXSXYvcWZk?=
 =?utf-8?B?aVp1dUtZK1YrdUgzeldPeUpTWi9JREdTUmU5QUhaMkExQThFdlB3aDdIbGpk?=
 =?utf-8?B?WStUN1lhaTU2V24xQjFDNURIbHp0anhvRWdjZUQ4V3V1NS9ucEpUSEJhUW9D?=
 =?utf-8?B?RnlUczRUaDFqc3MzRkErdU45WTliYkpoMjVYZk5XcDZkbFd1bTZGKzM5WUNY?=
 =?utf-8?B?TnZyT3QvQUNuU1BEL1g1UE5zZWlGU3BrMEFweDBMeEhaSmp3T1pZT2pPdEg3?=
 =?utf-8?B?anU4WHRVUVJTYkg4ZVZuSjlvaFIweGlGTGNLcm1ncjI4SGFJbytWcmJRMjNJ?=
 =?utf-8?B?ZU9yb0Q2REp5YTY2cmV1SWdwaVRVYTREUlRkeDRSYjY2QjFqZFdQYXJJMEZj?=
 =?utf-8?B?eUhJeWYva25rZ0tBTkl1Z3ozaGJwM2FGS2ZDS1Vsb282bHJGUHVjQT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f18a03b5-decd-4a39-d415-08de4fb67ea8
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8280.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 19:37:16.3888 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l3Yzfu/npb3eLyWw2WbrkHbEiJWSad7Iau7aAexVKx++5JVo5OyBvQSnbtdvlR/GDHbO3bPTNafiIGH7y+KGRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7448
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

Quoting Balasubramani Vivekanandan (2026-01-09 13:42:51-03:00)
>Further updates to performance tuning for Xe2_HPG

Maybe worth noting that this is specific for version 20.02 of the IP.

>
>Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@inte=
l.com>
>---
> drivers/gpu/drm/xe/regs/xe_gt_regs.h | 3 +++
> drivers/gpu/drm/xe/xe_tuning.c       | 5 +++++
> 2 files changed, 8 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/reg=
s/xe_gt_regs.h
>index 93643da57428..cc18ddfb7cc0 100644
>--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>@@ -135,6 +135,9 @@
>=20
> #define XEHPG_INSTDONE_GEOM_SVGUNIT                XE_REG_MCR(0x666c)
>=20
>+#define CACHE_MODE_0                                XE_REG_MCR(0x7000, XE=
_REG_OPTION_MASKED)
>+#define   MSAA_FAST_CLEAR_ENABLED                REG_BIT(5)
>+
> #define CACHE_MODE_1                                XE_REG(0x7004, XE_REG=
_OPTION_MASKED)

Huh. A bit unrelated to this patch, but I find it weird that
CACHE_MODE_1 is not defined as multicast.

The current users of CACHE_MODE_1 are DG2 and MTL and that register is
multicast for both (Bspec 66534 and 67788).  We probably need a separate
patch to fix this.

Anyway,

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

> #define   MSAA_OPTIMIZATION_REDUC_DISABLE        REG_BIT(11)
>=20
>diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning=
.c
>index 5766fa7742d3..122829c8d14e 100644
>--- a/drivers/gpu/drm/xe/xe_tuning.c
>+++ b/drivers/gpu/drm/xe/xe_tuning.c
>@@ -144,6 +144,11 @@ static const struct xe_rtp_entry_sr lrc_tunings[] =3D=
 {
>           XE_RTP_ACTIONS(FIELD_SET(FF_MODE, VS_HIT_MAX_VALUE_MASK,
>                                    REG_FIELD_PREP(VS_HIT_MAX_VALUE_MASK, =
0x3f)))
>         },
>+
>+        { XE_RTP_NAME("Tuning: MSAA fast clear"),
>+          XE_RTP_RULES(GRAPHICS_VERSION(2002), ENGINE_CLASS(RENDER)),
>+          XE_RTP_ACTIONS(SET(CACHE_MODE_0, MSAA_FAST_CLEAR_ENABLED))
>+        },
> };
>=20
> /**
>--=20
>2.43.0
>
