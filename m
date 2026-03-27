Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A71BC10ED65C
	for <intel-xe@archiver.kernel.org>; Fri, 27 Mar 2026 12:18:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57DFE10EDFA;
	Fri, 27 Mar 2026 12:18:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GZNZRo8D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA9E010EDFA
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Mar 2026 12:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774613929; x=1806149929;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ZcuI3DBPQ+pDkmOYldnS+MckZYWiQeaXZiGeWyvqqFM=;
 b=GZNZRo8DFlbXCWodEdds1U0m6PfNbwLT1C4Ci9uDuj5Lv1BiXJyjsEYB
 1qSXIKzmP39FA8pNL6iu/Uirny7yKDoNDGQ6Z50C6BNVUuVqF53g7Ttff
 tFnySCUACQowtYwR9tbLiJON/8YmF5tWzTROqyjQ2B18V0E5sP1i6qMiM
 jhhPQkrNJ/+udagmpoS42qDcK44S64S6jCEuvaxFAxoO0hLkf/w3MVfPs
 scLwOP6SvdFPg0Mdic2U1kyQcapulVbSp5vVFj6nx86tCQEUJMDkmsebN
 br074QIrlC6L1BgJUOAA1v/Zv0o2AKhj1CSXfGMkLMMWGm0Vb+3BHzXzv w==;
X-CSE-ConnectionGUID: 4TZqpJ7vSGOSHalg3dFwaQ==
X-CSE-MsgGUID: KgCnk+EyR3K+WCOKjJd7Ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="74866913"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="74866913"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 05:18:49 -0700
X-CSE-ConnectionGUID: eXQjruiYTea3jBZsYJvSsg==
X-CSE-MsgGUID: aHvohDy1QGmTyErXpNmk9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="226902216"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 05:18:48 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Mar 2026 05:18:47 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 27 Mar 2026 05:18:47 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.37) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Mar 2026 05:18:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A63/WniabGMEETXKHRzYGSg4N8oZmC2hXGePtS6NkSkQ+gfYG+nDyKcItKv1FE7TJkwrYK655PaYN+u8rO2Q8BZ6ilEXRWK7I7OUP5gwRZAo8bUxzHzP9n0fzbWwOr9+DVw+iWIyBwzyuZ+OzjOhh52DUHkkXAkZk/wB/fL+rcr3bQCMkdeZU1KktnSABKh0+mL6geOkycGPCne1ZgDndUPci8hMEvgaoKTUXgM5Ibfe4q9Alrbd+07UnQCowpWWa+vOehprorx0zTqyoHo7LGtXlKZFnZc0yq7sd4hGRPTdqNFNakUwMz6TTurwX5tzOCiN/PnH3X56KbyqOcYgyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZcuI3DBPQ+pDkmOYldnS+MckZYWiQeaXZiGeWyvqqFM=;
 b=k1+iKTs4VOMkxLsMpskb0UM7G0+JYLgA7fwOQRvZTCPw3RcUaO31d2Z17FixJZ0SRV8NQmAbbX+6uK4jov71YmOzLWkSFTtxKcC0XcEtk1nsmh8/KJKtBKqsw1blyyMiK5vVa6GOWoEBSFwiXfA+156AhyWpOTrJerNwLlWXo8o7TpNpUIX/NQaC3mVy8/oaOMGOm8M3l2nCgGyye0ZuD19RU7RUFfh+eCgYL32L5Yxh8BncLp7vPsXiaWedxai62It62gSbzxm91b2I+Y1+ZoApBykIuRmZLYzAzwoI9t8lTXh7ucRH+Clc4xaUHTnXqgMz4BqtyYW/emgrmNC5+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by SJ5PPF4DC104A0B.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::827) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.6; Fri, 27 Mar
 2026 12:18:45 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::b831:13bc:a1c9:2628]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::b831:13bc:a1c9:2628%4]) with mapi id 15.20.9769.006; Fri, 27 Mar 2026
 12:18:45 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "Poosa, Karthik" <karthik.poosa@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Gupta, Anshuman" <anshuman.gupta@intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Jadav,
 Raag" <raag.jadav@intel.com>, "Tauro, Riana" <riana.tauro@intel.com>
Subject: RE: [PATCH v1 1/2] drm/xe/pcode: Add support to get pcode version
 from PMT
Thread-Topic: [PATCH v1 1/2] drm/xe/pcode: Add support to get pcode version
 from PMT
Thread-Index: AQHcutbTDwT7/IezNk6ghGwsY8sN37W8UGuAgAV3pQCAAIfDgA==
Date: Fri, 27 Mar 2026 12:18:44 +0000
Message-ID: <IA1PR11MB64181A4C32B5CA5E97ADED90C157A@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20260323151331.4043749-1-karthik.poosa@intel.com>
 <20260323151331.4043749-2-karthik.poosa@intel.com>
 <IA1PR11MB641869B65AAAAC64304A5AADC14BA@IA1PR11MB6418.namprd11.prod.outlook.com>
 <2963f582-f449-4b81-bd50-2a610ef3b072@intel.com>
In-Reply-To: <2963f582-f449-4b81-bd50-2a610ef3b072@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|SJ5PPF4DC104A0B:EE_
x-ms-office365-filtering-correlation-id: 9d308e53-ddce-4015-7624-08de8bfafdda
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|22082099003|18002099003|56012099003|38070700021;
x-microsoft-antispam-message-info: DfFh6nVYO2FyomGElrihlKdEYTbbI1bLevRHPOR1g8aHuXozuPDZ7mW2fsXq+yRfVIENt7nhy7JHAgX4D0f5h/vpTSB3Pnk0x9KP4/Ep8azZktWO9v1PVqe642WcyPzeQq5dQEOECZ4mx8tdM1xXDKkImTqT18qPmyiSj7FVhSAlfBFVo4diDkQeAK5mau6r2tKtxPbvTW5SsnO9lxJ/WD0sRx3i0yk+k8wj27ewZ+9Nj5mWeNmnMA8kqOu1sjfsVUYK3ICKm0oDvPErIgJ0vj78i5b+A2Sw9LQA59fVaAP/WCitWuDQZhI2/RhzOgpc5ZDsvwIeFV0Byce7D6W1uisLAdZwhmT1odNMY8kyIkAiHbuV0h1J+RHLDY4j1dXCksP3kFzIFHAOag+4K95SQ+O8pQ3TUx0Lzv4/tZSJtljUou2kA+2M5O2dd7XMT3ZVFItbYpANAcvmrpWqzspQxgvbp+y8eKhHR5JiLRdhfrPYdrSqx3ERkxguf96+H6o50QjdjN6I+RGIckeC7xFHptckR133xZwZ82rVwEnZ/VTQxeIDGUZRpJkM3EgM8E61lDHlRA/XEeJqyMzcEJxnU7Ir3NzOyQKIH4gymElUwSVMBlt7vmrHwounJDv8pyzL4qg0DDta2sapcLF/LdillawOk+K+8A+d100YP2o6sHtckuW+2UJ93wRxNoz0jo2D7RE+xVKatk79IWa5qKf7l1Wf0IMuQ6tBz1Ry9NVhl+TrOIjMnm31VDjEgX+vvLaS5UHlvixeu30c0OnV6Ao77ESVUkm0wCJXsnKtgxoVXrY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6418.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(18002099003)(56012099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ek1rN3MwVkVwc0R5OXZMbE4yOG9NcHdBTDF3MS9CUHBkRjREVVJqWEEyd00w?=
 =?utf-8?B?NXpvbjRxSjVHa3V2Z3lvcy9FS2pkWndLVlB5emo2TEJaL3FrZVBWdk9kdHZz?=
 =?utf-8?B?aEIzSVVtUklvaXVJV0QwSjA5ZVhhWDVadWpRaWVKVlNHajVRN1FRYldZeUs1?=
 =?utf-8?B?bmJCbVlyNlVFQytyZHMxMHFOanNPTXpKUVdyMTRML1lzMFdPRk9IbG9aU05a?=
 =?utf-8?B?T2pZTExWbkpFY1NJalBOYktYOXVjNlg5eUlyWVlmTWJ2U3ltbHhGUnpLckpC?=
 =?utf-8?B?MkhDSzlYYkJIOUJjbzRzUDZPKzlVVkVsN0VTNWd1UjBKWHlxZytZWkdYcURM?=
 =?utf-8?B?QW85aGY3cll1YVZWRitMSDlVbnVOSXp1T3h0b0l5Szh5MEpVYkhXYnhjdWUw?=
 =?utf-8?B?cWNZbDlxTFRIbkhzODRQMi80VlBGbkliT1YzdVQxRzJrWGlCN3RFZWMzMHVq?=
 =?utf-8?B?NmlTOEU0Mk1Xb1ZRYko2T0syVllHNnVwUDE0QjFkUHVMekh6OFNrU3VtdVJH?=
 =?utf-8?B?WERKYjZnSXE3dDhwSWtPUktDdElpQUNReWozbmN4S2JRSGJoT1dBaDNrcU56?=
 =?utf-8?B?dXFHTEtVQmtMWndJQWR6NEwvRzB1U1JlWlRFckZTRUpEWTlWcmM5aDJCZkIv?=
 =?utf-8?B?aiszVjlLdVBBVjgzUEdHSmpJWHlIbmxVUXlGYjNqdStkY2tXa2V5MGdKOHI0?=
 =?utf-8?B?Ymp1MkxSQjhYbU56eE12T2lXL3hpRnhDSHB0RzR3S0NHM3BUc01UQkFKZEwz?=
 =?utf-8?B?VkxQVG52V3A5K2l5OGhRVEZCUVAzNlh4WGdEM0tWUGhxcXFkeElSSVZ1Qlo5?=
 =?utf-8?B?K2tacFV0RVlPcHRxSDE1amxwaCtDSzEwMnBteTFQeWxSWi9PbTgrMDY0bzZh?=
 =?utf-8?B?eGQzZkdBV1k5dDIxWFM1RVFlUHhFNGY3VWswcit5THVkaEVIRy95S0VCV0lY?=
 =?utf-8?B?TG50aGVSbnR4Tmp5d3R5SCtsUFJ5dDk5b3dCM3Y5T2Q2R3c1Zm9yamplTEJh?=
 =?utf-8?B?NnlmN3gvODlTTSsrdFQ0cjB5NHBscEJnZHBZQnAvZTI2OW43VHZLSkpWaFp0?=
 =?utf-8?B?TGNsWEx0VWh6NlpMZFRHQm81bEoydTQzS3FGQlIwV0RzVVRRWG5UY29BOTBw?=
 =?utf-8?B?bTlTamgybUNNWE9SZXhsbElKQVNNVzNkQkFROWVUMGR4ZGlCeW81SkNndmw4?=
 =?utf-8?B?dWRwdGRXcE1OczFkS1p1MDNuZGJyTkp4YTFlNWV0OHVrOFZ6NkM1ZG14TGlH?=
 =?utf-8?B?UU1SdjFsQUhRaXNkUEU3M213cmtKU2toN01YZkRPNkR5a2xNVGJXWExOeFNW?=
 =?utf-8?B?cjZreFVOQ05EdEtVcVhnYk1pYnNPazIxcnlDSTBsNXBGMk5WSFBRUzB5VUJG?=
 =?utf-8?B?dUl1U05nYi9jWWRWVUIwNzZqME9vdVAwWHEyUncrRm1KNjl4MEkzdFhaSXRp?=
 =?utf-8?B?MXlJOG1yazRmeVB6VDlMSUozeTdNUndTUnJ4RUVrTHIybTliazFha0FTSVEz?=
 =?utf-8?B?Nk5LYTdCb3hiZGl5TDRzK2RxMmJPbzRlWmdiTFg1QkI5WGZWMThNcFFtSmRB?=
 =?utf-8?B?MWp3VUhnSjFObU4za1dzNHBmbk5TTjhlOTdoUGFxVGdncllrRlF3RHRtMnZz?=
 =?utf-8?B?NGxSd3FDbDZwejhvR3NnSDR2SVUvQnp5VUlGeDJMZ2l4Y2E4UWFLSCtTd0pN?=
 =?utf-8?B?WkFDYTJubFJMcDBOd3hhT3YxdEJVcFVQNmNVMFBTcUtkYzhVczVLOStCamxj?=
 =?utf-8?B?ZUxkK3BCZy9UUkJLTzkzejZvYVEyOC9nZFdtTmxZOVZCSVo5d0g2K2RQV2wx?=
 =?utf-8?B?TDZQRTdlU1QxOUNqbGVZM0djL1l1L0hBeENMRWhFVitIbUdFR3hKRm9GTG5l?=
 =?utf-8?B?bVZmQzJhanhuQ291MVp0RWhRdFQ0VVNmeUh6a2hQc0UybHJCZkZwa2hVYU1x?=
 =?utf-8?B?MG5EVHRDUkszeTNkMXhvbDFsWVRlV0lKSnIrcUw1S3hqYU02OWxkU29Hem85?=
 =?utf-8?B?bzUwSld5SE9XZG1ueE5PcXFzWVRHWnlzTEdIT1NYd0ZXNTlxQTRuQ0JxZC9R?=
 =?utf-8?B?K04yUGhONlg4am54c1Q1SnBkd3VPSys4c0M2ZXAvbFFqMmJxNjNZVkJ2NjNr?=
 =?utf-8?B?djVzbFpzTTA0WVRsVHpmK3Q2UkEva0F2cW91QWJMOTVuQ2pLMWR5bS9lUW5w?=
 =?utf-8?B?dDFReldtL2g1UWcyRWY1RmV1czJFOUdFN2x6aS8rRzY1Mzk0SlBCNE03c0Ix?=
 =?utf-8?B?YWcyWFJqZVFLaFJZdnFVZVA0L3VzL0VUeFhnUFN0MElMYms1L0pXeStpOHhN?=
 =?utf-8?B?cFNIalRlYnhvYTlQeDhWVmM4TlVGWlplbmgwMkVtK2Q0VU93YnBFQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: K39tbwiEqayiu1ZzVJUt2/fCLZo7WcMVSOJJEeISXgWIJ5O5hCq5IpyCZ6LSeCmBOr/ZqBAff0EJPyFI8KifLF4Aat5uS6ATsDsgnRCE95R2bwR5KpgSIthGxbA1Q9VxuW0pXmHTn7c0O7Hwi8tV08VrhQrlIfR37nDvWayoTFDied3Ej51RWtZ4Zpf5G4Fa/mmDTFgjIqJSzwuKMTLIg3cky6sWTHOXNxWbJrReJ0qHSvg7FxUgRnkLKzNIBS6DOMcJ22gtGIUPE3j2OslK1UBf6LPbyos5j2cZYt+uM8USBn5vOVz7tBuqmRpLrMSjinVPLstZ20aZX9rMiNwRzw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d308e53-ddce-4015-7624-08de8bfafdda
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2026 12:18:44.9918 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9jruzuVIAXUBD/Hb0rdWBoXOOIgeNZ9POYKwD0DL/4kT4Aob9QMGtVlVjBNEQL347UQDk7reRBnwX5yWljufSCrMZGID9oLPZOYA7Wpsk70=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF4DC104A0B
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

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogUG9vc2EsIEthcnRoaWsgPGthcnRo
aWsucG9vc2FAaW50ZWwuY29tPg0KPlNlbnQ6IEZyaWRheSwgTWFyY2ggMjcsIDIwMjYgMTI6MDUg
QU0NCj5UbzogUnVobCwgTWljaGFlbCBKIDxtaWNoYWVsLmoucnVobEBpbnRlbC5jb20+OyBpbnRl
bC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj5DYzogR3VwdGEsIEFuc2h1bWFuIDxhbnNodW1h
bi5ndXB0YUBpbnRlbC5jb20+OyBOaWxhd2FyLCBCYWRhbA0KPjxiYWRhbC5uaWxhd2FyQGludGVs
LmNvbT47IFZpdmksIFJvZHJpZ28gPHJvZHJpZ28udml2aUBpbnRlbC5jb20+OyBKYWRhdiwgUmFh
Zw0KPjxyYWFnLmphZGF2QGludGVsLmNvbT47IFRhdXJvLCBSaWFuYSA8cmlhbmEudGF1cm9AaW50
ZWwuY29tPg0KPlN1YmplY3Q6IFJlOiBbUEFUQ0ggdjEgMS8yXSBkcm0veGUvcGNvZGU6IEFkZCBz
dXBwb3J0IHRvIGdldCBwY29kZSB2ZXJzaW9uDQo+ZnJvbSBQTVQNCj4NCj4NCj5PbiAyMy0wMy0y
MDI2IDIyOjExLCBSdWhsLCBNaWNoYWVsIEogd3JvdGU6DQo+Pj4gLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0NCj4+PiBGcm9tOiBJbnRlbC14ZSA8aW50ZWwteGUtYm91bmNlc0BsaXN0cy5mcmVl
ZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZg0KPkthcnRoaWsNCj4+PiBQb29zYQ0KPj4+IFNlbnQ6
IE1vbmRheSwgTWFyY2ggMjMsIDIwMjYgMTE6MTQgQU0NCj4+PiBUbzogaW50ZWwteGVAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnDQo+Pj4gQ2M6IEd1cHRhLCBBbnNodW1hbiA8YW5zaHVtYW4uZ3VwdGFA
aW50ZWwuY29tPjsgTmlsYXdhciwgQmFkYWwNCj4+PiA8YmFkYWwubmlsYXdhckBpbnRlbC5jb20+
OyBWaXZpLCBSb2RyaWdvIDxyb2RyaWdvLnZpdmlAaW50ZWwuY29tPjsgSmFkYXYsDQo+UmFhZw0K
Pj4+IDxyYWFnLmphZGF2QGludGVsLmNvbT47IFRhdXJvLCBSaWFuYSA8cmlhbmEudGF1cm9AaW50
ZWwuY29tPjsgUG9vc2EsDQo+S2FydGhpaw0KPj4+IDxrYXJ0aGlrLnBvb3NhQGludGVsLmNvbT4N
Cj4+PiBTdWJqZWN0OiBbUEFUQ0ggdjEgMS8yXSBkcm0veGUvcGNvZGU6IEFkZCBzdXBwb3J0IHRv
IGdldCBwY29kZSB2ZXJzaW9uDQo+ZnJvbQ0KPj4+IFBNVA0KPj4+DQo+Pj4gQWRkIGFwaSBnZXRf
cGNvZGVfdmVyc2lvbigpIHRvIHJlYWQgcGNvZGUgdmVyc2lvbg0KPj4gPmZyb20gUE1UIHRlbGVt
ZXRyeS4NCj4+DQo+PiBJIHRoaW5rIHRoYXQgdGhpcyBwYXRjaCB3aWxsIG9ubHkgc3VwcG9ydCB0
aGUgY3VycmVudGx5IGRlZmluZSBCTUcNCj5zcGVjaWZpY2F0aW9uLg0KPj4NCj4+IElzIHRoaXMg
aXMgZm9yIEJNRyBvbmx5LCB0aGUgY29tbWl0IHNob3VsZCBzYXkgdGhhdC4NCj4NCj5UaGlzIHBh
dGNoIGlzIGludGVuZGVkIGZvciBCTUcgYW5kIHBvc3QgQk1HIGFsc28uDQo+DQo+Pg0KPj4+IFNp
Z25lZC1vZmYtYnk6IEthcnRoaWsgUG9vc2EgPGthcnRoaWsucG9vc2FAaW50ZWwuY29tPg0KPj4+
IC0tLQ0KPj4+IGRyaXZlcnMvZ3B1L2RybS94ZS9yZWdzL3hlX3BtdC5oIHwgIDIgKysNCj4+PiBk
cml2ZXJzL2dwdS9kcm0veGUveGVfcGNvZGUuYyAgICB8IDE4ICsrKysrKysrKysrKysrKysrKw0K
Pj4+IGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9wY29kZS5oICAgIHwgIDcgKysrKysrKw0KPj4+IDMg
ZmlsZXMgY2hhbmdlZCwgMjcgaW5zZXJ0aW9ucygrKQ0KPj4+DQo+Pj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS94ZS9yZWdzL3hlX3BtdC5oDQo+Pj4gYi9kcml2ZXJzL2dwdS9kcm0veGUv
cmVncy94ZV9wbXQuaA0KPj4+IGluZGV4IDI0MGQ1Nzk5M2VhNi4uOGE3MGUxNzkxMmYzIDEwMDY0
NA0KPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS9yZWdzL3hlX3BtdC5oDQo+Pj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3hlL3JlZ3MveGVfcG10LmgNCj4+PiBAQCAtMTUsNiArMTUsOCBAQA0K
Pj4+ICNkZWZpbmUJRU5FUkdZX1BLRwkJCVJFR19HRU5NQVNLNjQoMzEsIDApDQo+Pj4gI2RlZmlu
ZQlFTkVSR1lfQ0FSRAkJCVJFR19HRU5NQVNLNjQoNjMsIDMyKQ0KPj4+DQo+Pj4gKyNkZWZpbmUg
UFVOSVRfVkVSU0lPTl9PRkZTRVQJCSgweEEwKQ0KPj4gSXMgdGhpcyB0aGUgb2Zmc2V0IGRlZmlu
ZWQgaW4gdGhlIGZvciB0aGUgQk1HIFBNVCBYTUwgZGVmaW5pdGlvbnM/DQo+WWVzLCBoZXJlIGl0
IGlzDQo+aHR0cHM6Ly9naXRodWIuY29tL2ludGVsL0ludGVsLQ0KPlBNVC9ibG9iL21haW4veG1s
L0JNRy9QVU5JVC9ibWdfcHVuaXRfYWdncmVnYXRvci54bWwjTDEyMTgNCj4NCj4+DQo+Pj4gI2Rl
ZmluZSBCTUdfVEVMRU1FVFJZX0JBU0VfT0ZGU0VUCTB4RTAwMDANCj4+PiAjZGVmaW5lIEJNR19U
RUxFTUVUUllfT0ZGU0VUCQkoU09DX0JBU0UgKw0KPj4+IEJNR19URUxFTUVUUllfQkFTRV9PRkZT
RVQpDQo+Pj4NCj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3Bjb2RlLmMN
Cj5iL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wY29kZS5jDQo+Pj4gaW5kZXggZGM2NmQwYzdlZTA2
Li4xZWJlNjIyZTk0N2EgMTAwNjQ0DQo+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3Bj
b2RlLmMNCj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcGNvZGUuYw0KPj4+IEBAIC0x
NSw2ICsxNSw4IEBADQo+Pj4gI2luY2x1ZGUgInhlX2RldmljZS5oIg0KPj4+ICNpbmNsdWRlICJ4
ZV9tbWlvLmgiDQo+Pj4gI2luY2x1ZGUgInhlX3Bjb2RlX2FwaS5oIg0KPj4+ICsjaW5jbHVkZSAi
eGVfdnNlYy5oIg0KPj4+ICsjaW5jbHVkZSAicmVncy94ZV9wbXQuaCINCj4+Pg0KPj4+IC8qKg0K
Pj4+ICAgKiBET0M6IFBDT0RFDQo+Pj4gQEAgLTM0OCwzICszNTAsMTkgQEAgaW50IHhlX3Bjb2Rl
X3Byb2JlX2Vhcmx5KHN0cnVjdCB4ZV9kZXZpY2UgKnhlKQ0KPj4+IAlyZXR1cm4geGVfcGNvZGVf
cmVhZHkoeGUsIGZhbHNlKTsNCj4+PiB9DQo+Pj4gQUxMT1dfRVJST1JfSU5KRUNUSU9OKHhlX3Bj
b2RlX3Byb2JlX2Vhcmx5LCBFUlJOTyk7IC8qIFNlZQ0KPj4+IHhlX3BjaV9wcm9iZSAqLw0KPj4+
ICsNCj4+PiAraW50IGdldF9wY29kZV92ZXJzaW9uKHN0cnVjdCB4ZV9kZXZpY2UgKnhlLCBzdHJ1
Y3QgcGNvZGVfdmVyc2lvbiAqdmVyc2lvbikNCj4+PiArew0KPj4+ICsJaW50IHJldCA9IDA7DQo+
Pj4gKw0KPj4+ICsJcmV0ID0geGVfcG10X3RlbGVtX3JlYWQodG9fcGNpX2Rldih4ZS0+ZHJtLmRl
diksDQo+Pj4gKwkJCQl4ZV9tbWlvX3JlYWQzMih4ZV9yb290X3RpbGVfbW1pbyh4ZSksDQo+UFVO
SVRfVEVMRU1FVFJZX0dVSUQpLA0KPj4+ICsJCQkJKHU2NCAqKXZlcnNpb24sIFBVTklUX1ZFUlNJ
T05fT0ZGU0VULA0KPnNpemVvZigqdmVyc2lvbikpOw0KPj4gSWYgdGhlIFhNTCBkZWZpbml0aW9u
IChhbmQgR1VJRCkgYXJlIHJldi1lZCwgaG93IGNhbiB5b3UgdmVyaWZ5IHRoYXQgdGhlDQo+UFVO
SVRfVkVSU0lPTl9PRkZTRVQgaXMgYWxzbyB0aGUNCj4+IHNhbWU/DQo+Pg0KPj4gSXQgbG9va3Mg
dG8gbWUgdGhhdCB0aGlzIHVzYWdlIGlzIGxvY2tpbmcgdGhpcyB1c2UgY2FzZSBpbnRvIHRoZSBj
dXJyZW50IEJNRw0KPmRlZmluaXRpb24uDQo+Pg0KPj4gSWYgeW91IGFyZSBub3QgdXNpbmcgYSBC
TUcsIGlzIHRoaXMgZXhwZWN0ZWQgdG8gd29yaz8NCj4+DQo+PiBXaWxsIGFsbCBQVU5JVF9URUxF
TSBBTFdBWVMgaGF2ZSB0aGlzIGluZm9ybWF0aW9uIGF0DQo+UFVOSVRfVkVSSU9OX09GRlNFVD8N
Cj4+DQo+PiBNDQo+SSB0aGluayBzbywgbGV0IG1lIGNvbmZpcm0gdGhpcy4NCg0KS2FydGhpY2ss
DQoNCkhvdyB3aWxsIHRoaXMgYmUgdXNlZD8NCg0KVGhpcyBjb2RlIHdpbGwgT05MWSB3b3JrIGZv
ciBCTUcgKGFuZCBwb3NzaWJseSBDUkkpLg0KDQpJIHdvdWxkIHN1Z2dlc3QgdGhhdCB0aGUgY29k
ZSB0aGF0IHlvdSB3YW50IHRvIGhhdmUgaGVyZSBsb29rcyBsaWtlIHRoaXM6DQoNCglpZiAoeGUt
PnBsYXRmb3JtID09IEJNRyB8fCB4ZS0+cGxhdGZvcm0gPT0gQ1JJKSB7DQoJCWd1aWQgPXhlX21t
aW9fcmVhZDMyKHB1bmludF90ZWxlbV9ndWlkKTsNCgkJaWYgKGd1aWQgPT0gRVhQRUNURURfQk1H
X0dVSUQgfHwgZ3VpZCA9PSBFWFBFQ1RFRF9DUklfR1VJRCkNCgkJCXhlX3BtdF90ZWxlbV9yZWFk
KGd1aWQsICZ2ZXJzaW9uLCBzaXplKTsNCgl9DQoNCklzIHRoZXJlIGNvZGUgaW4gcGxhY2UgdG8g
ZW5zdXJlIHRoYXQgdGhpcyB3aWxsIG9ubHkgYmUgdXNlZCBmb3IgQk1HL0NSST8NCg0KVGhhbmtz
LA0KDQpNDQoNCj4+DQo+Pj4gKwlpZiAocmV0ICE9IHNpemVvZigqdmVyc2lvbikpIHsNCj4+PiAr
CQlkcm1fd2FybigmeGUtPmRybSwgImNvdWxkbid0IGdldCBwY29kZSB2ZXJzaW9uIGZyb20gcG10
LA0KPj4+IHJldCAlZFxuIiwgcmV0KTsNCj4+PiArCQlyZXR1cm4gcmV0Ow0KPj4+ICsJfQ0KPj4+
ICsJZHJtX2RiZygmeGUtPmRybSwgInBjb2RlIHZlcnNpb24gbWFqb3IgJWQgbWlub3IgJWQgZW5n
ZyAlZFxuIiwNCj4+PiB2ZXJzaW9uLT5tYWpvciwNCj4+PiArCQl2ZXJzaW9uLT5taW5vciwgdmVy
c2lvbi0+ZW5nZyk7DQo+Pj4gKwlyZXR1cm4gMDsNCj4+PiArfQ0KPj4+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0veGUveGVfcGNvZGUuaA0KPmIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3Bj
b2RlLmgNCj4+PiBpbmRleCA0OTBlNGYyNjk2MDcuLjhkZDQ3MjA0OTkyMSAxMDA2NDQNCj4+PiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfcGNvZGUuaA0KPj4+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV9wY29kZS5oDQo+Pj4gQEAgLTEyLDYgKzEyLDEyIEBAIHN0cnVjdCBkcm1fZGV2
aWNlOw0KPj4+IHN0cnVjdCB4ZV9kZXZpY2U7DQo+Pj4gc3RydWN0IHhlX3RpbGU7DQo+Pj4NCj4+
PiArc3RydWN0IHBjb2RlX3ZlcnNpb24gew0KPj4+ICsJdTE2IG1pbm9yOw0KPj4+ICsJdTE2IG1h
am9yOw0KPj4+ICsJdTMyIGVuZ2c7DQo+Pj4gK307DQo+Pj4gKw0KPj4+IHZvaWQgeGVfcGNvZGVf
aW5pdChzdHJ1Y3QgeGVfdGlsZSAqdGlsZSk7DQo+Pj4gaW50IHhlX3Bjb2RlX3Byb2JlX2Vhcmx5
KHN0cnVjdCB4ZV9kZXZpY2UgKnhlKTsNCj4+PiBpbnQgeGVfcGNvZGVfcmVhZHkoc3RydWN0IHhl
X2RldmljZSAqeGUsIGJvb2wgbG9ja2VkKTsNCj4+PiBAQCAtMjIsNiArMjgsNyBAQCBpbnQgeGVf
cGNvZGVfd3JpdGVfdGltZW91dChzdHJ1Y3QgeGVfdGlsZSAqdGlsZSwgdTMyDQo+Pj4gbWJveCwg
dTMyIHZhbCwNCj4+PiAJCQkgICBpbnQgdGltZW91dF9tcyk7DQo+Pj4gaW50IHhlX3Bjb2RlX3dy
aXRlNjRfdGltZW91dChzdHJ1Y3QgeGVfdGlsZSAqdGlsZSwgdTMyIG1ib3gsIHUzMiBkYXRhMCwN
Cj4+PiAJCQkgICAgIHUzMiBkYXRhMSwgaW50IHRpbWVvdXQpOw0KPj4+ICtpbnQgZ2V0X3Bjb2Rl
X3ZlcnNpb24oc3RydWN0IHhlX2RldmljZSAqeGUsIHN0cnVjdCBwY29kZV92ZXJzaW9uDQo+KnZl
cnNpb24pOw0KPj4+DQo+Pj4gI2RlZmluZSB4ZV9wY29kZV93cml0ZSh0aWxlLCBtYm94LCB2YWwp
IFwNCj4+PiAJeGVfcGNvZGVfd3JpdGVfdGltZW91dCh0aWxlLCBtYm94LCB2YWwsIDEpDQo+Pj4g
LS0NCj4+PiAyLjI1LjENCg==
