Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36747CD4F39
	for <intel-xe@archiver.kernel.org>; Thu, 14 May 2026 12:01:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3EEC10E3E5;
	Thu, 14 May 2026 12:01:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZxikVFIW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BC4A10E45F
 for <intel-xe@lists.freedesktop.org>; Thu, 14 May 2026 12:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778760064; x=1810296064;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QRJjZ68ob6CsvGw4+LwA/wXqvkJfk7O+J8oNb1l7KO8=;
 b=ZxikVFIWhTpHMXuRLZ7/gPPWBnYzIUWGR2fTboMbOfI/ugHFKZw0KEOh
 nvCZpvzypryXeZVCwAcOAuPIdzGXHKFhkwfKoZdoITIr6HSYW9OSFhtum
 OxYbImM8gVbGQgP0VpUnfWayNL0Z2eWEXbuBjebfnReJtbdR5IdGxuPHt
 eIDNgroc7YQPykPZFJ2EK7lJGwkxLq+fYX5CMO3H3kHWdPYjgmAiP+b9v
 CTr/VfnAVD8x+Sj7F371B30VrEXVzp58rH9ub9ZO4tO7x//kTYy3vWwEg
 dR+FsR7JyI5xLRKlY0zdAjx5F2tWZ80DV4aD2Pm4r5l9iJGzyGwPoODa3 A==;
X-CSE-ConnectionGUID: fjI35AlxQw6EIPtiy+uVsA==
X-CSE-MsgGUID: dQ1IC+ijSYiCM59bsF+hVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="105159436"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="105159436"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 05:01:04 -0700
X-CSE-ConnectionGUID: Yz12XuExR+CaXp30fTd2Ag==
X-CSE-MsgGUID: yEF30TOCRtGYCDZAYIz4cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="235724732"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 05:01:04 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 14 May 2026 05:01:03 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 14 May 2026 05:01:03 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.61) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 14 May 2026 05:01:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nJ6qXmRhhv8f50KDO6IWZN+ZquNzQHv39W0nLUDB0FZF9i8+esKLMRfkdH4hDgYIkEvkKEwduE1MUkNfBUVAulZ6F5KqmtJJ0gLzVY+a5/JD9oDZJnMH9Fj6TxzGtCkofHIETj3VaHq7UAzyGZ32nbbjygcnL1pZrOZrMWMJ6r5yECQwWGjwQ78/iGQdd6DbxY63J+KO+3Nn9JFC4tq4945CfyHzFY74/t6xcuPTNVFUK7vU4rUydj/R24ii/fCL+EPQTZzqzktXWQwI5hooelpzSmZCdbAMhTM9mpgaCYibRtNwyzgrlq6W8jq5v47iZ5e3OIlkr6UKwxLUNu1M4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QRJjZ68ob6CsvGw4+LwA/wXqvkJfk7O+J8oNb1l7KO8=;
 b=YvUiMSNX1uxZlx+CUWfSn73aZi9FOf6//gQXSQuXEDhxXfyurQiMaH+nXvNJIBxRL4hgbRAbCOA5kBsfGVM14dx6zxkxIBaUDHfBsi8VDCBcQW064qFYlE05kTTXcU1Tq0dqxHhERU8cOmpdIr5UovT6v7+EluV/+Ezphe8dFLbIOLSaIY2e0FE7/Fb1pWtLz3UsVZiiGpCsMxx/bTafT8l1GJ1pGYrrOmzH+HXirI7OSkb5ma+GEUXCfiCsvBDnfVy9uygWCAjte+CvPRO+Qjfm5XHj4VAa2LoOXzqk474z4+qy4x8u3hSxUXgWyhm0gkzid0X3I9wh6fjvvALPuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5564.namprd11.prod.outlook.com (2603:10b6:610:d7::18)
 by CY8PR11MB7825.namprd11.prod.outlook.com (2603:10b6:930:71::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Thu, 14 May
 2026 11:59:52 +0000
Received: from CH0PR11MB5564.namprd11.prod.outlook.com
 ([fe80::bdb2:f221:b705:aaeb]) by CH0PR11MB5564.namprd11.prod.outlook.com
 ([fe80::bdb2:f221:b705:aaeb%7]) with mapi id 15.20.9913.009; Thu, 14 May 2026
 11:59:52 +0000
From: "Girotra, Himanshu" <himanshu.girotra@intel.com>
To: "Sousa, Gustavo" <gustavo.sousa@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "Sousa, Gustavo"
 <gustavo.sousa@intel.com>
Subject: RE: [PATCH] drm/xe/guc: Use xe_device_is_l2_flush_optimized()
Thread-Topic: [PATCH] drm/xe/guc: Use xe_device_is_l2_flush_optimized()
Thread-Index: AQHc4wzHS5Si7gclGUymcAV0ZPs+XbYNa/JQ
Date: Thu, 14 May 2026 11:59:51 +0000
Message-ID: <CH0PR11MB5564D434BB05246B60A8568F98072@CH0PR11MB5564.namprd11.prod.outlook.com>
References: <20260513-guc-l2-flush-opt-use-xe_device_is_l2_flush_optimized-v1-1-36fa866d6ed8@intel.com>
In-Reply-To: <20260513-guc-l2-flush-opt-use-xe_device_is_l2_flush_optimized-v1-1-36fa866d6ed8@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5564:EE_|CY8PR11MB7825:EE_
x-ms-office365-filtering-correlation-id: 158c9577-d014-4093-2fdb-08deb1b04e57
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700021|18002099003|22082099003|56012099003|3023799003|11063799003;
x-microsoft-antispam-message-info: Yyk/K46MwyRDw38g20s+j/GPYuj5lFtsBEIx3/f0MssiXZNb3cCPZ002JPGI7daEplhPTGo6Q/Jcd/t2jZXLUQ63DwZDtKDxaqWJ7VhtIg8E8S54GuQbu5eHTn5UYESlbP56IL8SLp9nbv4adsSnkm5Gh9G28zvtjwVxG3GjtyYBQoJZ2zgX2rp1LBQc3w9k5nyd7Sm6ibJv65U01RyIcepZmHcXfPfMOo/tWmBvM4okKSoFscCozBP/LiZ4ci4c1WzRh+6evZ6toWfwRuVG8Sw4hCr5TllDNCwW/o234D2IuPj3Fr6yqZ5wMgXhC4b7MecNHFKcIzqJY00hHpXbWCHMfYgj8yBs+lZUjRm9HI4MfZdq8Gzqr7L302vfif92imunkykAwjtJIqP6bTgETAf5oy+CnfVkHzxjYaSUaiLvZNwv1wER4bwGYOxemmEYpNrxGZlPRDNc4ySEE1Mi5doG12jR0hoBFNUeWNoUPNmz++/Ak+GBFAfJLVxaGqSgBA2vuu39MkKpCGLle3FUKAus6Nt8rWz8cUs1MS83iAkeUe8J0aobYamhMeJmHxSCl2m7nOT8MaUbFKsvab1fxeroZr2id1mtKgk3MHO7u79K5TItr9Doje1Q+hEWZkP/DduVX+8bh8qb3jPwHdZxZDR/Mi+gzImoezMRrogtW9Eaea3m+U0deeycR/wbPZn3oAZQKNTHf6/HqtkqRzN4RtiD2oi0l2HrnqSG5RybMReV8x0XjzTnmRnjunNYqBB2
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5564.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(18002099003)(22082099003)(56012099003)(3023799003)(11063799003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RXpRZGpZMjI3R3E4K2tITnZmRUtyaG9KTzI2amZySDVyY0dHb3RpdVkvL3Z4?=
 =?utf-8?B?WXo3akRKSC8wNlNzY1NveHpNTnhEU0R3SkIzeHdyWkhjNFBhYnl1NXk4NTAx?=
 =?utf-8?B?ZXk0OEh3dVpEN3ZmbE04Z2cyT1VFRllpL2dnRUpNOEkrVFAwYlVnNDA3MHgy?=
 =?utf-8?B?S1EwY3A2VytnUlBoWS8yR1R0Q0VkRmNYeDh0cmNVTUhCTGJxWlBDYWcxS0pF?=
 =?utf-8?B?VTJlU2FuSVZZV25IVTRZeEduWCsvOVNyRlozbDB3QW9WL3JjRXBxWlp3TVBn?=
 =?utf-8?B?eEZmaE16VGtXUy9ZNFBlTVhGNFhobVJ6U2ZlWklaSHB0NEZqYis5WGk1TEFw?=
 =?utf-8?B?V2dJbGdMMVg5cWRjVnpTdCtlNGJlejlFZFp1SmV1ZThSS1FuRWl6V1F0Rjhy?=
 =?utf-8?B?Q3p4bmZJNDQvNjYycTlnNjVJZFc2U25JOG5wTnduaGF5MmRvMEtMQVRsN3ly?=
 =?utf-8?B?RlQxd2llcjJ5eHpLRmZqOTJHc2tDNGltRHNzbWpxZ3JzbWZpZEVDMVJDV2dm?=
 =?utf-8?B?WHhvS1RkZldLMG5DRDNuOFNhcGRpWUl1SGRGZUE1ZnI1QkFVTW5OZ3VVK1o5?=
 =?utf-8?B?ZEQ3czROak0vWE55Wkx6aXRKMjAvL0VFOHdsTHA0UjFzS3hiakEwcmZ2TVdi?=
 =?utf-8?B?Y1p0Rm9jV1RhYVJ6UlByT3pMcmFNYlAwQ1B4dTlkdlJXMjc2Qzlkb0o5V2hH?=
 =?utf-8?B?WGpvaDdZd1ZMK1FGaWhMS29LL2FYSnJ5QnFCWFp4NXQzSEJoOHErUWRqOGg3?=
 =?utf-8?B?Z3BYVVNKSE1neEVrcXozbzZqR0wyRDRtb1BjWFBRNEdCZG00Ukp1WE0yZm1j?=
 =?utf-8?B?TldFVUMzdzlZdXQydko2NUJyUXI4cnc5Vmw2NitPeGc0ODRFV2JkUGVxQTdW?=
 =?utf-8?B?R1BEUitZR3l6YW0vZUpqUDVidGVWdjZGbzZCb2orL2wxcm9DdFVBam9MSmFL?=
 =?utf-8?B?OE1NcWk5L0krVkRGbkNaUDIrTmVNUnA5UUhWeXJub0E1R3V2cE00WWhKYWFo?=
 =?utf-8?B?UEFxNGIreXBDWjFXS2VkSk82SXBEMFlWK2pDQ25aSzZINlpQeTBaUTVKVzJl?=
 =?utf-8?B?VUhWZzgxcWtURjJFYWg5ak9Zd1BzMGZzK0FCdXN1RVB3V2VKUndDNEV5Vi9K?=
 =?utf-8?B?MTF2eGI3SldIVTlneHZsSGdlVkFVa0xUSEJJMWRZVG0vdS9Hb0F2dXEzL0hu?=
 =?utf-8?B?d0F5TnExemtmUWR4dkJZcFlWMzhtUzZJWGFuWDZVeUlqdDRXNEY4R3h2QzNR?=
 =?utf-8?B?VXZhYjlKdmp5RVFoa0twTU04aDlySW1ROGJZVS9Fa2pRZG83a2FQSkJkdTFw?=
 =?utf-8?B?WlR3YzJzejZKR2hVYmNvVHU4VkMyUG1DZnkyODJMeExNMDdoU0lrSDJMWEdK?=
 =?utf-8?B?T0dZN3FJcDBQQjZHQ1JIbW44bTRRQmxjb1Fuckg5RkdSdWhHaFNZQTZNTFdr?=
 =?utf-8?B?c2t0NVhWelhoNmRaWjdtaWxqSUkwejB4WitaL0NDMmNVaE00cTRBanBqd0xr?=
 =?utf-8?B?c1MxaEY2UjFWVDUxZi9oRlZuZzlKTytQMkhXYkRUdEhMN3BHVHBGT0RkdVVx?=
 =?utf-8?B?STczSFEvTXNlajlnSGZTMGdCVXd6MjVhZ1I3Y2ZPTDFvTnllZmorNHBIZkQ1?=
 =?utf-8?B?QmJMZ0Q2dWxqL2JrdkNSOXFwMVJtazJaQUFBb3A2Zy9UQysxTWlvYVliV09J?=
 =?utf-8?B?N0R3dFlJRUhHOTJEcCtnb1dGRXc5NWNwS2ZHY3ljbnJKL29VUC9pUitSeDE5?=
 =?utf-8?B?bUJ2TEVGY1FKaG1kZGZMamhYdnZDakJCZ25kQWVuZGsyOERVcGF4VnR0Y3da?=
 =?utf-8?B?ZFJqYStmVjFJaXFHTjUvVFFwMTRHR0ZnSGh1RFVyMWtZM3VJNEh2N1AwMmYr?=
 =?utf-8?B?SittbXdiMHlyUno3NWpaWXg4WkR4Q3hndXZjS3hxSjBUWGM1QmtYcW1xcVRl?=
 =?utf-8?B?OENvaUplelhEVUtWRjhSRU05dDJYeG1STTVLQ3o5NFhjVmU0T3BYaEdadVlM?=
 =?utf-8?B?ZDR3eDB1N05TeFNud3RnV2dVY0h2VTJNZXRHeVF1NWQ2UVZWWHdnaWdzblZQ?=
 =?utf-8?B?RHE3RnZHbUx3QTd1ejM0MC83ZjVkeUozSHlMNXJUc285Y3poUHpweXU1dUcw?=
 =?utf-8?B?VHA2REMzVlJic3BnQkJkb25IL21CQjFObnA0NkJ0dGM0cUh2SHBmQmpoeE9I?=
 =?utf-8?B?TnZjeEx0R0FxRU1CeXFmR0hXcFd2ZFRVRDFLQmd4SGdCNVlsNTRmOUt6aFF3?=
 =?utf-8?B?cGFBN2Z5MVBrN2xjT1RsQ01GTXorbjJDTDFES0hlb0pqMldScER2VWJtMGQ3?=
 =?utf-8?B?REtlZi9TWklpcVFQN2xLNHVGUDhZQVQ2Z2dWUnRJTytZT096aUhEQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: nSwbFdeGbiJz1pvYh2XE1EjsgiX48VgF0G0ZjEH/FRTb9t2w7dlyxgGfCSh3/Gs3/cxY6F8s13pvKvbdewlaY8Ip0ExX/Vl0Ck+xtSFa8C7+bfgzFe5FjQFLN/KUbeldAsDgOY6qRE8Fnmj9ibdXQD+5H8RXGFYk0sMVyaDmr/J9fr0cMUKiIHptgCpFq/VZ22XZKRLDYz2Vz31+F+3UynFUnVrf+Ua7HU5IIBTA+4dgj7aYpvHY/UGKqZ0jc5IJFJsjDD6Fu2rVj9U3MZAnpTYRCG6LrGd6PK4VTC2uJXMTwOhMIK7GhN7qtJVFeaORM6L7j5cw4K0FQt4YX5EACQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 158c9577-d014-4093-2fdb-08deb1b04e57
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2026 11:59:51.9395 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eUrddmnyMRsdGpnFJfh+hm1+S13vqhyQKc0CzETuU7h2khW0423lIgrAj+gUDz9bivKwxJPzWfcTyIO+LvPIuvb5NL7J+himTpyPTgt4Vg8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7825
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
PiBTb3VzYQ0KPiBTZW50OiAxNCBNYXkgMjAyNiAwMDozNw0KPiBUbzogaW50ZWwteGVAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBVcGFkaHlheSwgVGVqYXMgPHRlamFzLnVwYWRoeWF5QGlu
dGVsLmNvbT47IFNvdXNhLCBHdXN0YXZvDQo+IDxndXN0YXZvLnNvdXNhQGludGVsLmNvbT4NCj4g
U3ViamVjdDogW1BBVENIXSBkcm0veGUvZ3VjOiBVc2UgeGVfZGV2aWNlX2lzX2wyX2ZsdXNoX29w
dGltaXplZCgpDQo+IA0KPiBXZSBlbmNhcHN1bGF0ZSB0aGUgbG9naWMgdG8gY2hlY2sgaWYgdGhl
IHBsYXRmb3JtIGhhcyBMMiBmbHVzaCBvcHRpbWl6YXRpb24gZmVhdHVyZQ0KPiBpbiB4ZV9kZXZp
Y2VfaXNfbDJfZmx1c2hfb3B0aW1pemVkKCksIGJ1dA0KPiBndWNfY3RsX2ZlYXR1cmVfZmxhZ3Mo
KSBpcyB1c2luZyBhbiBvcGVuLWNvZGVkIHZlcnNpb24gb2YgdGhhdCBzYW1lIHR5cGUgb2YgY2hl
Y2suDQo+IEZpeCB0aGF0IGJ5IHJlcGxhY2luZyB0aGUgb3Blbi1jb2RlZCBjaGVjayB3aXRoDQo+
IHhlX2RldmljZV9pc19sMl9mbHVzaF9vcHRpbWl6ZWQoKS4NCj4gDQo+IENjOiBUZWphcyBVcGFk
aHlheSA8dGVqYXMudXBhZGh5YXlAaW50ZWwuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBHdXN0YXZv
IFNvdXNhIDxndXN0YXZvLnNvdXNhQGludGVsLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEhpbWFuc2h1
IEdpcm90cmEgPGhpbWFuc2h1Lmdpcm90cmFAaW50ZWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMv
Z3B1L2RybS94ZS94ZV9ndWMuYyB8IDIgKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9ndWMuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWMuYyBpbmRleA0KPiBlNDY4YjYz
ODI3MWIuLjQwMjM3MDBmZjJhOSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2d1Yy5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWMuYw0KPiBAQCAtOTgsNyAr
OTgsNyBAQCBzdGF0aWMgdTMyIGd1Y19jdGxfZmVhdHVyZV9mbGFncyhzdHJ1Y3QgeGVfZ3VjICpn
dWMpDQo+ICAJaWYgKHhlX2d1Y191c2luZ19tYWluX2dhbWN0cmxfcXVldWVzKGd1YykpDQo+ICAJ
CWZsYWdzIHw9IEdVQ19DVExfTUFJTl9HQU1DVFJMX1FVRVVFUzsNCj4gDQo+IC0JaWYgKEdSQVBI
SUNTX1ZFUih4ZSkgPj0gMzUgJiYgIUlTX0RHRlgoeGUpICYmDQo+IHhlX2d0X2lzX21lZGlhX3R5
cGUoZ3VjX3RvX2d0KGd1YykpKQ0KPiArCWlmICh4ZV9kZXZpY2VfaXNfbDJfZmx1c2hfb3B0aW1p
emVkKHhlKSAmJg0KPiAreGVfZ3RfaXNfbWVkaWFfdHlwZShndWNfdG9fZ3QoZ3VjKSkpDQo+ICAJ
CWZsYWdzIHw9IEdVQ19DVExfRU5BQkxFX0wyRkxVU0hfT1BUOw0KPiANCj4gIAlyZXR1cm4gZmxh
Z3M7DQo+IA0KPiAtLS0NCj4gYmFzZS1jb21taXQ6IGU1NGExNGJiZjkyMGFhNWVlZmM3MGFiYTk5
Mjc0ODJlYmU2MzBmOGINCj4gY2hhbmdlLWlkOiAyMDI2MDUxMy1ndWMtbDItZmx1c2gtb3B0LXVz
ZS14ZV9kZXZpY2VfaXNfbDJfZmx1c2hfb3B0aW1pemVkLQ0KPiBmOTRlNTRlZjUxY2INCj4gDQo+
IEJlc3QgcmVnYXJkcywNCj4gLS0NCj4gR3VzdGF2byBTb3VzYSA8Z3VzdGF2by5zb3VzYUBpbnRl
bC5jb20+DQoNCg==
