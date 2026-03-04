Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C5AEB7EB2
	for <intel-xe@archiver.kernel.org>; Wed,  4 Mar 2026 08:55:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBB2B10E97E;
	Wed,  4 Mar 2026 08:55:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mJNlISvS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0EA510E97E
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Mar 2026 08:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772614518; x=1804150518;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VQ4oXUgenYWvL7gaEsyw0ROOJX/B4CdRMgsZ6NdGZxo=;
 b=mJNlISvSHcH8uZQ8r3pMNmeFAItTPAU75rjhvZAMh8iU7S+h2z2dL2jM
 pu4ii/bTOe8ojmzxbtBtDOORBI0W6K76nO57DrgYs/p/6jYYBcWquXHM5
 gUA0CiVgPkuOJtYI97rAxqbKghWfPTXG65t7NdgLQGRcD8NgX8MMKNB0R
 ct3AlMkEZRfYMPSRBEQ0V8TG3KTlU55WUrnuMgWplwnsqmoXTr5QdJ9/a
 13QbvfcJyV6Jtm1glNNBW09KQggVCMaGdje12QDAZkrUproBHrZxz9NKb
 OY/07roQ0Q8mgqwyKurbKMJDJVTERlpDdFGU2R6KJt0fuiRePPmQiiEUj w==;
X-CSE-ConnectionGUID: 39cjC3I6Sq+oOLYHcka3Sg==
X-CSE-MsgGUID: 9w+xrP19SGaWrKXhcwQRLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="85133540"
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="85133540"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 00:55:18 -0800
X-CSE-ConnectionGUID: pPf8nM+4TA2RyXr/4maxHg==
X-CSE-MsgGUID: MTZBgPDXS42KrVuVRzV8zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="218246922"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 00:55:18 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 00:55:17 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 4 Mar 2026 00:55:17 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.2) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 00:55:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FnoYuBnlC5wvkxLPju0TtrjmHJOJD/nQYOomtfo28BtU1mIKNz9JQnFQgamuOJ0Zk0uRAHUCGHKGCrBhol+5VgEuFVnV1/mMLd3JYCdaTJA86QmQydmBEA9mxVdRDY0jgkLkrPT9DljHu2QWbuYeLHZC8+ZcBMcUt70zrD8XyLpLq8QrttZMhBb69L3pmVYmH9IztWqOcK7clC7AwHDIrR+67mhs+5yDQr3T8/57NEwfNxFZwplkoirEQuSE22mkjHE+92WlldOm3d8XxNVugSeh8GNmquEoFAQae94OGVz0aJGKS33NkKGmpVcHW08Xi/1q8SdGvU55ZCs6tFYTEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VQ4oXUgenYWvL7gaEsyw0ROOJX/B4CdRMgsZ6NdGZxo=;
 b=EeLejER5MgNcWzxnU9k+MaHMC7iCpw7FZR7lMA2N2ONMjaVezEz1DaBBoYR9/m56/vbvVrdABQClXYJqtqUC2FQUwTLtQ4TQ+UKZmF1pkhpxsa7h3YD67KuNlgOIkaKiTB6nAsDQEyYnG7vLCpvCyVJJYgmFDwHu4oDBDdobuyreR7Aow09TNyvPXhvxEgnvivsDJyVgTEIhi/N3iLoCXqb1VCq1IE/HdnX7rPXfNrkK8V2ObZ+nOmOYcqzdO6NKL//ilWYWBUB5t3Gsvnt6UXw10geRavMYGgywRev3RxxpSStMV8YO/0r9AyKRKzcoZ0Nq6hV6TVnqtThv5kvFVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6266.namprd11.prod.outlook.com (2603:10b6:208:3e6::12)
 by CH3PR11MB7723.namprd11.prod.outlook.com (2603:10b6:610:127::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 08:55:15 +0000
Received: from IA1PR11MB6266.namprd11.prod.outlook.com
 ([fe80::eda2:e570:4314:8720]) by IA1PR11MB6266.namprd11.prod.outlook.com
 ([fe80::eda2:e570:4314:8720%5]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 08:55:15 +0000
From: "Bhadane, Dnyaneshwar" <dnyaneshwar.bhadane@intel.com>
To: "Sousa, Gustavo" <gustavo.sousa@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Sousa, Gustavo" <gustavo.sousa@intel.com>
Subject: RE: [PATCH] drm/xe/pat: Extract gt_pta_entry()
Thread-Topic: [PATCH] drm/xe/pat: Extract gt_pta_entry()
Thread-Index: AQHcq07mkCJp6KHPEEil9cdQNnbIpLWeEn6g
Date: Wed, 4 Mar 2026 08:55:15 +0000
Message-ID: <IA1PR11MB62666C3DB0B6AE14CBBEB0A2E27CA@IA1PR11MB6266.namprd11.prod.outlook.com>
References: <20260303-pat-gt_pta_entry-v1-1-0dee8e1e7bd9@intel.com>
In-Reply-To: <20260303-pat-gt_pta_entry-v1-1-0dee8e1e7bd9@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6266:EE_|CH3PR11MB7723:EE_
x-ms-office365-filtering-correlation-id: 23810e60-7afd-4208-678a-08de79cbc0d5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|38070700021; 
x-microsoft-antispam-message-info: k4ea6DWXPLGuyTaDeVCTtC51/PlN9ANaM0oVEvXy9GbL2tooOqy+8AK2nsX7X7Q2llgpiRzjQf2wH2QLEN+xuSlCXT9BycwFMPmzApNb53B55q8kLBY3CnFIwFVxnhn55cPs4WUJD4UFuwawVc4EnBmDbY32qgdV+bmrG6EgTaAlraferHUar6HhWIwFYhkRG2rW8i0zvRYjsreJfBCZ/GFgauYz621TERQleFOfuHaRaQg456bNZXcKv6lFlLDDtbaqYTIeea45zFyqtaDi679yiCkDhIt4JYBgZ2pTmUgWzHyWMdIB3NWpu+kD3wr1CsXUsi+BBTIkY+KWS7SIVkDdbOdEqfHIFd4dx/C7W/5EjHO5oaqLn+GA1rkMiGzawztOlW1i4WnOG4QABxfizEF+rISXLhjGSXAA2XTgQaiLJvf4FX88XGJvi7vgCzGuDivRgb3AnjzXfgop8GAhlp9cqzhZDLpc3nqiIu8ErLWszltRCoRt9PeOzxkEuuYcPyv5/wvBQZOQjbQ/SzA/pKj+xbXsPjClWiOjywVFrSIWdWFurrVb+Njf50BtHX+8semOGrJERswNYgPnkjhle2IGB3eSu0a1YhG/5iAgCCHecLNWa5Gfxtbj5HhSA0POoZPdXv3odpdBRfrrQyGej4S3RjTFVfyv57RjFiqC3tGK31Mi2Karfo1pKP6CLqKGvX5eoBwMerd8vw9Uq+40+1dhHZQ26oXTht+TYBfqZRCc8iebMkzmdeHAkKMgrws+tR0fpqU7lgZL7OuW2t+aYcc0kQI0dOBU4Hzn/7Eh6r4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6266.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c1JhRWNUNzhaOHVMNnpYT0R1Ulp6WEs5K1VLdHcrVktXbUhueHlNZzJiVURK?=
 =?utf-8?B?YzhiWm1tbCtWWFR6cTJ2UjcyQ25sbG5Hb2lrcStqck5wbVFLRlcyYkRrVGI3?=
 =?utf-8?B?cWpXMlpOTzVsUHZDampxU3IxNS9uZDBUSXUvUEVkRnR6UVB0R20zOG1OWXNF?=
 =?utf-8?B?bzU1bmNBZXVDd3Z6UFhhVTd6RllWMWtzb2k1ODQ2WFlWWDNNRzhJb1NNcFI2?=
 =?utf-8?B?L0c1ZUh0ZGZQdEdhZDU1cEZzZHR6ZHdsVDRyTFlkZG1lQlNBczhRMGphWkl6?=
 =?utf-8?B?UElIOWltVGRFMDRMaDlXUEprbFBxVURSUC9ub25vMHUzTm5rdHIzc0dwUGMz?=
 =?utf-8?B?K1hsalBtZ3B3K3QxVEh2bUthREZZeWdBVU8zdEZJM0ZWVzJzVDhzNVNDWHJi?=
 =?utf-8?B?clpSQ2E2UW5SdW9JZDZyUFVIZFRYdHZHRlFlOE9hbjFoKzQ3STUvVjRaRzNy?=
 =?utf-8?B?Nlo0WWV2TURydmNUek8vcHA2dUpLTFBzV2k5WTBPTWRLNW52MHdDT0tMZmZp?=
 =?utf-8?B?Ui9Icmk5WXY0eUhubGFjRFhGbXFGUjFBSVVKTUp0V1JLeGN4RVBOMWM2dUt2?=
 =?utf-8?B?Vml2ZHBLYlVOQkRHekhGaytoSnhlK2k2dkNjZGh4ZTJucFVmd2NVcm9EUHhx?=
 =?utf-8?B?L3ZZczJHQ1M0YUxBMlNNV2tSVmdXWU5FTjJhUUkyVXBRTk9JcHVjWERTblhS?=
 =?utf-8?B?REhEM0llekVueStMaW5xeG1aY2FkZWF3b0FZZnlVWHJnRWVrb1AzTjduMEY5?=
 =?utf-8?B?Zk9vM3ZtTUIwcDF2d2NJanFXUFJKUkFScmdYRm9XdG91bGhBUHNLRzRVMGFq?=
 =?utf-8?B?UlBwQ3UvcHNyQWdOL1phcDBpckVmYVh2TklsNFlkVy9WdlhNNTBNMjFNL1B5?=
 =?utf-8?B?Um0zMHJodUtiMDVKV3dRbzVrYzBVQnN3a3laMTYxU3FtK0x1b1pwb2M0ZVB2?=
 =?utf-8?B?VEYwOXdkMmFEM0lDWStzMGQxa0xGZTZoUHh5WFp1c1N6Nms0VW5PalRsdkg2?=
 =?utf-8?B?MDVKNFBnRDl4MHdGN0pITGRYV3lVdU9ocTZBRlMwZjJGS29oN1hmdzRKNHVJ?=
 =?utf-8?B?S1lhV0d4bHpaajYrd2RBWmY2MHdGbC93RloydlVRUi82UmJjakQrRGIwSUsv?=
 =?utf-8?B?RTBDZjZCcUR3OFM3NFJVOGFhaGRROUVhVjh4QVE5VjMvZG41cXJzODcrNlkz?=
 =?utf-8?B?RWRzSUxJL05RcW9BcEhzSDZZdzFnS2t2OXRwVDR2eHViS09iQlNvbTYwNGRO?=
 =?utf-8?B?UjdjSEdHVC90ZHZxMzhMWWx5MnFncHoveFpwU1FvME5EQ1lOT042VFkxdjZp?=
 =?utf-8?B?NVRjSkRpVGovYnA3MXhEa25sVlAvRWVaN3M2MFhSV1NpVjhUVGl2WEhRVmFk?=
 =?utf-8?B?dzgrdWNiTFdhUXk1alc4c1JLMTYrLytWbjN2MGtVYnJ2a1BBQmNXc3FieWJq?=
 =?utf-8?B?OWdORXMrQWIwYUErcU9CMXlIRFhGSHRVQ0xVS0EwZ1B1WjZYU1J2bE00TmNE?=
 =?utf-8?B?QnY4T1VrSFdPY1NVZW5YcnJ6d2c5SmdCTmZ5NXN3R3N5aW9uMDdnNHYzTld4?=
 =?utf-8?B?RnNpTkZpeXVUM3Nwc29SaXZhSTYrQkFscFVleWduTWR6aHRXNnFmaXJKR055?=
 =?utf-8?B?OEwzaWlybkVYcSt4a2twRElFNFVsUE9tdDBQV29LT3h5djc5WTRMc2lwZzdq?=
 =?utf-8?B?Y2Q0TzdYcEVtTnBFRC9SM3dMd3krUzg3OXJZSmFvVWhva2xDMUh6cXIvem1D?=
 =?utf-8?B?eFRkNG15bklSdHNnWVorbW1mVUREREtPRnJXSkt3Ym0vU1RpRFNMNk1KQ29q?=
 =?utf-8?B?cVlSbVpmamRQREVYeHkwU1hURGtIMHFzVm5DRUJUNW8xRVp1dVBFVUVxaXly?=
 =?utf-8?B?SzFrRVhmY2M4QzBobDAyeFhjZWFjY2ZCVlNVckp4cVYvTlE1SmVCQUhVZHRS?=
 =?utf-8?B?N0lXWkVLdU90a2xmakRxQ3lzOXVSdkNVc0F2c1JuQTdNS2pWZ3JReFU0cXMx?=
 =?utf-8?B?U2VrNmh3czBTbjJVQzh2NUJERzZ3NlpKSEZpS2lDWS95b0huNUozQUlVd1Z3?=
 =?utf-8?B?Qml5V2lQU2RaQ0dpV1RpZVh3b0pSWXR5dEJrb0UwQXltTFVVRlRoZjFtVVlP?=
 =?utf-8?B?SncvSE9KYXFyamRSZm9YeWRUYUdnTjJKZ3RVdTNkVzVwWW9sMDZqU2hEbXpT?=
 =?utf-8?B?MllLRXk2M3NEVVJUamUwTUFZU1graHlEcEhaeWVjSWh5M2dvN1IwcklPL1ZD?=
 =?utf-8?B?cFhqOVAvUG9yZnB0bVhUaGZYcFVmSkdJRmhVRjBmc3VwM2FXSFU5ZHpNcHEw?=
 =?utf-8?B?bitEOU8zSEJtbWNWYW0zMlliOGlabEE0SzR5ZW9KZFluZGIrSVhtdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: G8y051DDef9RDqc82sxGv+RN97lV3AV6jQtfJPn2J1P4b1EfLHfsMXwqX++CIZ+ckkCoJ3Z0XaPZY5pwUfkgs/HhIRlNSCFCz7r858faWLE0BrAljteugF9SE0euJIj3Xl/6BUUp4h0mvd8D8iOaZBLRMz4A7kKyPmJIMmyAu5MUPgKJGNuToY6MNAKcjC1WC3q22Wb3LqJ2Tk18347dUuY3C2doGO+NQjZJ0CwtlnPVIQ6aVPp7l8sz7LbT55FVzLwnM8UhBohp2ZWM45wDJRo9wabvZDGunWWjsNsQBHsed/B2epTA0n/tggsCfBiBkqtLT6qMJ7T0MKGKPEc1Hw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6266.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23810e60-7afd-4208-678a-08de79cbc0d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2026 08:55:15.2942 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ii4+KCLFlbfN5Cwhaj9UmFB5HUnjEDr1uf4kjr4hRyI2cRmBhct3gfgZVNM4T/WrATNmvSfnGT2VOcRhA8oaBE0v8TljeNZRnPsflJgtC4I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7723
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSW50ZWwteGUgPGludGVs
LXhlLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgR3VzdGF2bw0K
PiBTb3VzYQ0KPiBTZW50OiBXZWRuZXNkYXksIE1hcmNoIDQsIDIwMjYgMjoxNiBBTQ0KPiBUbzog
aW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBTb3VzYSwgR3VzdGF2byA8Z3Vz
dGF2by5zb3VzYUBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSF0gZHJtL3hlL3BhdDogRXh0
cmFjdCBndF9wdGFfZW50cnkoKQ0KPiANCj4gQXZvaWQgY29kZSBkdXBsaWNhdGlvbiBieSBleHRy
YWN0aW5nIHRoZSBsb2dpYyBmb3Igc2VsZWN0aW9uIG9mIHRoZSBjb3JyZWN0DQo+IFBBVF9QVEEg
ZW50cnkgZm9yIGEgR1QgaW50byBmdW5jdGlvbiBndF9wdGFfZW50cnkoKSBhbmQgdXNpbmcgdGhh
dCBmdW5jdGlvbg0KPiB3aGVuZXZlciBuZWNlc3NhcnkuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBH
dXN0YXZvIFNvdXNhIDxndXN0YXZvLnNvdXNhQGludGVsLmNvbT4NCg0KTG9va3MgZ29vZCB0byBt
ZSwNClJldmlld2VkLWJ5OiBEbnlhbmVzaHdhciBCaGFkYW5lIDxkbnlhbmVzaHdhci5iaGFkYW5l
QGludGVsLmNvbT4NCg0KDQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BhdC5jIHwg
MzMgKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwg
MjMgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX3BhdC5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BhdC5jIGlu
ZGV4DQo+IGY4NDBkOWE1ODc0MC4uMzRjOTAzMWUxZTc0IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0veGUveGVfcGF0LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BhdC5j
DQo+IEBAIC0zMTEsMTAgKzMxMSwyNSBAQCB1MTYgeGVfcGF0X2luZGV4X2dldF9sM19wb2xpY3ko
c3RydWN0IHhlX2RldmljZQ0KPiAqeGUsIHUxNiBwYXRfaW5kZXgpDQo+ICAJcmV0dXJuIFJFR19G
SUVMRF9HRVQoWEUyX0wzX1BPTElDWSwgeGUtDQo+ID5wYXQudGFibGVbcGF0X2luZGV4XS52YWx1
ZSk7ICB9DQo+IA0KPiArc3RhdGljIGNvbnN0IHN0cnVjdCB4ZV9wYXRfdGFibGVfZW50cnkgKmd0
X3B0YV9lbnRyeShzdHJ1Y3QgeGVfZ3QgKmd0KQ0KPiArew0KPiArCXN0cnVjdCB4ZV9kZXZpY2Ug
KnhlID0gZ3RfdG9feGUoZ3QpOw0KPiArDQo+ICsJaWYgKHhlX2d0X2lzX21haW5fdHlwZShndCkp
DQo+ICsJCXJldHVybiB4ZS0+cGF0LnBhdF9wcmltYXJ5X3B0YTsNCj4gKw0KPiArCWlmICh4ZV9n
dF9pc19tZWRpYV90eXBlKGd0KSkNCj4gKwkJcmV0dXJuIHhlLT5wYXQucGF0X21lZGlhX3B0YTsN
Cj4gKw0KPiArCXhlX2Fzc2VydCh4ZSwgZmFsc2UpOw0KPiArCXJldHVybiBOVUxMOw0KPiArfQ0K
PiArDQo+ICBzdGF0aWMgdm9pZCBwcm9ncmFtX3BhdChzdHJ1Y3QgeGVfZ3QgKmd0LCBjb25zdCBz
dHJ1Y3QgeGVfcGF0X3RhYmxlX2VudHJ5DQo+IHRhYmxlW10sDQo+ICAJCQlpbnQgbl9lbnRyaWVz
KQ0KPiAgew0KPiAgCXN0cnVjdCB4ZV9kZXZpY2UgKnhlID0gZ3RfdG9feGUoZ3QpOw0KPiArCWNv
bnN0IHN0cnVjdCB4ZV9wYXRfdGFibGVfZW50cnkgKnB0YV9lbnRyeSA9IGd0X3B0YV9lbnRyeShn
dCk7DQo+IA0KPiAgCWZvciAoaW50IGkgPSAwOyBpIDwgbl9lbnRyaWVzOyBpKyspIHsNCj4gIAkJ
c3RydWN0IHhlX3JlZyByZWcgPSBYRV9SRUcoX1BBVF9JTkRFWChpKSk7IEBAIC0zMjQsMTYNCj4g
KzMzOSwxNiBAQCBzdGF0aWMgdm9pZCBwcm9ncmFtX3BhdChzdHJ1Y3QgeGVfZ3QgKmd0LCBjb25z
dCBzdHJ1Y3QNCj4geGVfcGF0X3RhYmxlX2VudHJ5IHRhYmxlWw0KPiANCj4gIAlpZiAoeGUtPnBh
dC5wYXRfYXRzKQ0KPiAgCQl4ZV9tbWlvX3dyaXRlMzIoJmd0LT5tbWlvLCBYRV9SRUcoX1BBVF9B
VFMpLCB4ZS0NCj4gPnBhdC5wYXRfYXRzLT52YWx1ZSk7DQo+IC0JaWYgKHhlLT5wYXQucGF0X3By
aW1hcnlfcHRhICYmIHhlX2d0X2lzX21haW5fdHlwZShndCkpDQo+IC0JCXhlX21taW9fd3JpdGUz
MigmZ3QtPm1taW8sIFhFX1JFRyhfUEFUX1BUQSksIHhlLQ0KPiA+cGF0LnBhdF9wcmltYXJ5X3B0
YS0+dmFsdWUpOw0KPiAtCWlmICh4ZS0+cGF0LnBhdF9tZWRpYV9wdGEgJiYgeGVfZ3RfaXNfbWVk
aWFfdHlwZShndCkpDQo+IC0JCXhlX21taW9fd3JpdGUzMigmZ3QtPm1taW8sIFhFX1JFRyhfUEFU
X1BUQSksIHhlLQ0KPiA+cGF0LnBhdF9tZWRpYV9wdGEtPnZhbHVlKTsNCj4gKw0KPiArCWlmIChw
dGFfZW50cnkpDQo+ICsJCXhlX21taW9fd3JpdGUzMigmZ3QtPm1taW8sIFhFX1JFRyhfUEFUX1BU
QSksDQo+IHB0YV9lbnRyeS0+dmFsdWUpOw0KPiAgfQ0KPiANCj4gIHN0YXRpYyB2b2lkIHByb2dy
YW1fcGF0X21jcihzdHJ1Y3QgeGVfZ3QgKmd0LCBjb25zdCBzdHJ1Y3QgeGVfcGF0X3RhYmxlX2Vu
dHJ5DQo+IHRhYmxlW10sDQo+ICAJCQkgICAgaW50IG5fZW50cmllcykNCj4gIHsNCj4gIAlzdHJ1
Y3QgeGVfZGV2aWNlICp4ZSA9IGd0X3RvX3hlKGd0KTsNCj4gKwljb25zdCBzdHJ1Y3QgeGVfcGF0
X3RhYmxlX2VudHJ5ICpwdGFfZW50cnkgPSBndF9wdGFfZW50cnkoZ3QpOw0KPiANCj4gIAlmb3Ig
KGludCBpID0gMDsgaSA8IG5fZW50cmllczsgaSsrKSB7DQo+ICAJCXN0cnVjdCB4ZV9yZWdfbWNy
IHJlZ19tY3IgPSBYRV9SRUdfTUNSKF9QQVRfSU5ERVgoaSkpOw0KPiBAQCAtMzQzLDEwICszNTgs
OSBAQCBzdGF0aWMgdm9pZCBwcm9ncmFtX3BhdF9tY3Ioc3RydWN0IHhlX2d0ICpndCwgY29uc3QN
Cj4gc3RydWN0IHhlX3BhdF90YWJsZV9lbnRyeSB0YQ0KPiANCj4gIAlpZiAoeGUtPnBhdC5wYXRf
YXRzKQ0KPiAgCQl4ZV9ndF9tY3JfbXVsdGljYXN0X3dyaXRlKGd0LCBYRV9SRUdfTUNSKF9QQVRf
QVRTKSwgeGUtDQo+ID5wYXQucGF0X2F0cy0+dmFsdWUpOw0KPiAtCWlmICh4ZS0+cGF0LnBhdF9w
cmltYXJ5X3B0YSAmJiB4ZV9ndF9pc19tYWluX3R5cGUoZ3QpKQ0KPiAtCQl4ZV9ndF9tY3JfbXVs
dGljYXN0X3dyaXRlKGd0LCBYRV9SRUdfTUNSKF9QQVRfUFRBKSwgeGUtDQo+ID5wYXQucGF0X3By
aW1hcnlfcHRhLT52YWx1ZSk7DQo+IC0JaWYgKHhlLT5wYXQucGF0X21lZGlhX3B0YSAmJiB4ZV9n
dF9pc19tZWRpYV90eXBlKGd0KSkNCj4gLQkJeGVfZ3RfbWNyX211bHRpY2FzdF93cml0ZShndCwg
WEVfUkVHX01DUihfUEFUX1BUQSksIHhlLQ0KPiA+cGF0LnBhdF9tZWRpYV9wdGEtPnZhbHVlKTsN
Cj4gKw0KPiArCWlmIChwdGFfZW50cnkpDQo+ICsJCXhlX2d0X21jcl9tdWx0aWNhc3Rfd3JpdGUo
Z3QsIFhFX1JFR19NQ1IoX1BBVF9QVEEpLA0KPiArcHRhX2VudHJ5LT52YWx1ZSk7DQo+ICB9DQo+
IA0KPiAgc3RhdGljIGludCB4ZWxwX2R1bXAoc3RydWN0IHhlX2d0ICpndCwgc3RydWN0IGRybV9w
cmludGVyICpwKSBAQCAtNjc3LDgNCj4gKzY5MSw3IEBAIGludCB4ZV9wYXRfZHVtcChzdHJ1Y3Qg
eGVfZ3QgKmd0LCBzdHJ1Y3QgZHJtX3ByaW50ZXIgKnApICBpbnQNCj4geGVfcGF0X2R1bXBfc3df
Y29uZmlnKHN0cnVjdCB4ZV9ndCAqZ3QsIHN0cnVjdCBkcm1fcHJpbnRlciAqcCkgIHsNCj4gIAlz
dHJ1Y3QgeGVfZGV2aWNlICp4ZSA9IGd0X3RvX3hlKGd0KTsNCj4gLQljb25zdCBzdHJ1Y3QgeGVf
cGF0X3RhYmxlX2VudHJ5ICpwdGFfZW50cnkgPSB4ZV9ndF9pc19tYWluX3R5cGUoZ3QpDQo+ID8N
Cj4gLQkJeGUtPnBhdC5wYXRfcHJpbWFyeV9wdGEgOiB4ZS0+cGF0LnBhdF9tZWRpYV9wdGE7DQo+
ICsJY29uc3Qgc3RydWN0IHhlX3BhdF90YWJsZV9lbnRyeSAqcHRhX2VudHJ5ID0gZ3RfcHRhX2Vu
dHJ5KGd0KTsNCj4gIAljaGFyIGxhYmVsW1BBVF9MQUJFTF9MRU5dOw0KPiANCj4gIAlpZiAoIXhl
LT5wYXQudGFibGUgfHwgIXhlLT5wYXQubl9lbnRyaWVzKQ0KPiANCj4gLS0tDQo+IGJhc2UtY29t
bWl0OiBjZmMyMGM3NzY0ODBmZGE4YzFiMDUxN2IxODdiYjcxZWMwNzgxY2Q0DQo+IGNoYW5nZS1p
ZDogMjAyNjAzMDMtcGF0LWd0X3B0YV9lbnRyeS1hMzQyZmIzNGNiZjgNCj4gDQo+IEJlc3QgcmVn
YXJkcywNCj4gLS0NCj4gR3VzdGF2byBTb3VzYSA8Z3VzdGF2by5zb3VzYUBpbnRlbC5jb20+DQoN
Cg==
