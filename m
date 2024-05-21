Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4648AC25B75
	for <intel-xe@archiver.kernel.org>; Tue, 21 May 2024 19:58:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E09E310E074;
	Tue, 21 May 2024 19:58:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RYERUFI1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBE1110E074
 for <intel-xe@lists.freedesktop.org>; Tue, 21 May 2024 19:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716321531; x=1747857531;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=GfMMBw8Za24hSkIj0ymCSNNv/kvhVVPKBvU6Onzfdbk=;
 b=RYERUFI16zxtAje3Ml1lnqGZI0PH8jaxGZn8ylTtUD6/HlVcOuFD4eaX
 z2yYcRTJJYAloJT+awGpSd2v+pmCFbPUO8in1qit8+pPIVl9llNhWTHKd
 Iq89dSYfAzYn9PQ6IG1m1MVdbleZkLTP6z3r0yLyScBTzplHngtVA1djs
 pSAjKwjSj4lAz9H09zl2xyywZtu7O7cE1GJrad2LV1HPZNiEEXb3vD79a
 prSdDpgANQRPScQQ89SoDaKtHX1op8qGzdteUiv62Mt/cSAHNYu/8Qmbi
 LdYtsmKi4gQ7nLYRcMkK9rnvwpvDiX3wAnhrnkpuJjo8z2cqkuitvUhe0 Q==;
X-CSE-ConnectionGUID: j1Gat+klTuyq3hhMUiU0HQ==
X-CSE-MsgGUID: ZpDtpKtmQLSc0Ftg6cEK5Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="12483260"
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="12483260"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 12:58:51 -0700
X-CSE-ConnectionGUID: xpV49bDkR5+S1bSwtBXN0Q==
X-CSE-MsgGUID: OYoMV4mbT2yUM6ZuMvezsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="37804130"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 May 2024 12:58:50 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 21 May 2024 12:58:49 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 21 May 2024 12:58:49 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 21 May 2024 12:58:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gaFaxjY72K48ur7QC0Tf1uKPzab0GPaOrzC2cdp0JfaIDwFyzIE8k7vZjIF5QLm3y0oJR1UTOViatHU3xb9iA6w48PVopDrUwRPkvBWooOegJgD/P1rmWOPpZT7thPb8EUQrrm3hJk7TKFchyM4cg2Z9eG51F3S/0L/VbxJkscbnd88nwWCmAaDQ0vupPymaNqyFEkaePfdNudOHuez2oSfe7cZSkaXD2bKopRFH2amN6y14BR9u1K7MmnttRkTKwTVWRNRFiKUe1BVMWYfVqLySTSnC8Vp5rNYkhEHfWB71GrDTJTYcY1cMJJ7Rr72zbZL2jv4lwBtOSQ7BX+bGdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GfMMBw8Za24hSkIj0ymCSNNv/kvhVVPKBvU6Onzfdbk=;
 b=Nvpvi2Z+zQmoyj1QhCa2oeCsr39dhX0wOKbFYlVDTXQrnROVA0aIQV+9yZDWp2JEESNb4lLl1oCoZ1KxFORZtCSZ+3+FOgpvaIJfKS2AQ9UZPbRYNXqkpVwrYaF0Rm1RYQ6MlURpUUU1yr7uwNXGVN1QAMXEklF3wXdo7QrHySwwOlh3wTYgOHwfGheaqvCxDj2yrEvJFYVaHQYJo/uH40tJg2rg3V6dTy/K7evGLyoL2aVaC8ub7rCyVZhuMbcc1e3GvAgoB1gcZkY89fjWQZ6n4YTJs0kUsd3vx4pECNkzKFwPe3szouoBWr99RVlYquCneT1onmcyUOCBH72jrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by PH0PR11MB5061.namprd11.prod.outlook.com (2603:10b6:510:3c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Tue, 21 May
 2024 19:58:47 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba%6]) with mapi id 15.20.7587.028; Tue, 21 May 2024
 19:58:46 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 00/17] Add OA functionality to Xe
Thread-Topic: [PATCH 00/17] Add OA functionality to Xe
Thread-Index: AQHadnkcIUwutN2VakWosatViFIW8bGihZ8A
Date: Tue, 21 May 2024 19:58:46 +0000
Message-ID: <a48af5d3bf29a877dfe73a7cd0ba588ae8506501.camel@intel.com>
References: <20240315013518.2848986-1-ashutosh.dixit@intel.com>
In-Reply-To: <20240315013518.2848986-1-ashutosh.dixit@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|PH0PR11MB5061:EE_
x-ms-office365-filtering-correlation-id: d6387bfc-d5e5-4309-65ec-08dc79d06d02
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|366007|1800799015|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?S0V5NmNoeE9CMkdTMC81dXAwREdFcEFiNUVHb1RZamQ3V2krNHRKaXNIdHpC?=
 =?utf-8?B?dWY0WnZTbVNpWnoyeXNnQjVLT2haaDQ0ZFhKZkxUcFRaME94SW5Wcmlza2Zp?=
 =?utf-8?B?N1JqVVdubU1Ja3I0MU9DZGZJQzMyYjJsa0lFZVZWd1pRQVN4Vm5BNktjYWhP?=
 =?utf-8?B?eCtCT3MxMk9ubm82TW5vSEJlVVViY2RuRm9EeEkzQVBRMVk1MkZEZlMybEgv?=
 =?utf-8?B?TGVMUE5odlhLU1RTalhNK05QaUc4OENCV3g5T0JJa0JlTzNwR1J4WHM3Sldu?=
 =?utf-8?B?dnlSRUhZUElNZG9zZ1FKT29rbVh1QjZLQWg1aXJlU0FNTlVwbUI2b2tKUVVC?=
 =?utf-8?B?bmhnQThydG5RRTlFVXZNRFo4SzFMbTNxL3U5OXlEak5vdjBLVjZaUEFKVjA0?=
 =?utf-8?B?Q1lnUkswbTM0Wm9tTlllcDRZVXBVcGk1Z1RxYmlFdUpxSlNreVozQkdmOWJN?=
 =?utf-8?B?VnROeDl5TVhuSTN6UzFvdUNRYmZrcjcveUlwQ2hMbW91VjVFU0lEVnNUZm1M?=
 =?utf-8?B?Z3llZC9TOWZyWUFodjRtczZkWlBVM1RJdXhQM045ZU9YaSt4SmdCb2RIeTgz?=
 =?utf-8?B?cGxzOGlRdlNIcGpxM1FtV1JSMFBpOWM3RGdwa21kb0crdzlGQ0lCbVZVK0ZU?=
 =?utf-8?B?SzljcGZRYlBlQnBQWmtwSWIxK1dPVHN4aGhqdjF3cWRablpOSC9TVVBiL2Z6?=
 =?utf-8?B?ZEl1RWMvQ3pQN2FwdHRBYUxyUVFvZUZLRG1wcllFSVRCSE8yUVJUditDaGs2?=
 =?utf-8?B?TWVsV3BjS3RGYXRCRHBObDVHR3NtTTByRWtjVmIvdVg4KzNqcDlkblpKNG00?=
 =?utf-8?B?RHVqU1pNWGRHT1VhbVhnM1hSV3Yya09pYTU4dXI3TXVQT04zcVZIQWcrVmky?=
 =?utf-8?B?TFhHOGZ6Z0xtT0JYT2FFZCtWVUJSVWtqMnhEamVuczEwT3RYbWsydzgxNWlj?=
 =?utf-8?B?T29GcHA2ZHdFdW1oOFVJZ3hoWjlxeXBmc2RyUDJSQ3RxT1ZGL2FZTEF2eEIz?=
 =?utf-8?B?NHgrZ1Zuc3VVMGpQYlhaeXlwWnR4MUZBR2dUMXVXWUg0OE5MOFFlbGZhZkVB?=
 =?utf-8?B?dkl1THFxN2dzdlcxdlR3djJvREd3ZUVMK2hWdG1RU0lXSDRIUWkwcXM3NjQz?=
 =?utf-8?B?bzdMNnJnZk1yUGRrUjJsUGE2NzV1ZllNSDNaeWlyTy80akRTN0RGSk5uNGFw?=
 =?utf-8?B?SmRvVEE5dy9kZlh1TGNXNEpWV0djcDZSc2JTY3hTVDgxMkNUSXhUa21aWjJq?=
 =?utf-8?B?TU4rWHJJZHRpblJ5Q1NDdTIxZ05GT3d6aGxHTnF0enJ5WnRwRm5vek02RkJE?=
 =?utf-8?B?MGhKQjRmdDEydDVpMHp0WlorVDZFZ08rb0pmTjY4dUFaMmt0bHo4ZUZzQmd0?=
 =?utf-8?B?cXFRLzNMWmdKVUV0UDRtU09qQldxb3EzTEM5aWVvWFljUWI5bHFneGxINE53?=
 =?utf-8?B?S0Nnc0lPNC82ekU0b2gvdnhDZFBQY2NmaTNpMmU1b0VUNDVreVVsNmViSGxJ?=
 =?utf-8?B?UTRpQUd0eW83MlJhU25JRVJ4WFdJSGFxN1BnMnZLcXRWbEk5TGlwV2k5M0hR?=
 =?utf-8?B?QlNhaVpiR1FvOFNvTllpZjZiU0thUzJ5d0wyTjJDRzZPa2w2VnMxdk5xamFl?=
 =?utf-8?B?QmdQNTloVnArQzhjNzBHZ3ZxOFJOckMyNW9WamhpQ3R2blFUa3dxc3dGUnIz?=
 =?utf-8?B?K2JEVzErZFRtK2h5NFBDSmR2VVUvMDROcHNVZlBWSERCclpYV1g2QzU2TVBF?=
 =?utf-8?Q?l3a/ZLNYNVQK8IpIU8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SHJMUVNwZG5GOGJlbTgxRnlrMk1Pb0Q3UGZST1R2MnY4bnU0a3V0alhwRURr?=
 =?utf-8?B?Um92WFNoTUsrTzgvdm44clZkeGkzd0RnMkVvUExaTGg0Z1ZCMDdzMC9UQnQw?=
 =?utf-8?B?OFh1WEVXRXJ2STA3dCtvbmlVWHVOZnpmWjgwaVRWWEpCLzJqZ2h2bDNXbm40?=
 =?utf-8?B?dXhxZnRGTXpuY3Q4RnJTeFlLVVM2ci8ySTdzZUx5VGtHRG9CRm5wNU9Cc1Nr?=
 =?utf-8?B?NGZTR01sWExLTFJ1TjZsZTNCY2xpWVNVUUFGN1FZa21CN1hJZkI5a1JmQlZm?=
 =?utf-8?B?VFNpMVd1Y2pySWxVdGM1cE84bmNNNWFUSnRKZ0toVFhHMm4xZ2I4dE9vYjZU?=
 =?utf-8?B?WnNwOERLK3NDbFpBaDdEa1lmNU9rTWNLb2RidVYyZGV4NVFScFk2RXI1UjZx?=
 =?utf-8?B?anhZWHM1aVRESXBzVmhTUmNhYlJXaDNNcUN4WHlzODdwbFQ4NEdTcWdoazFS?=
 =?utf-8?B?MENISFRIYWxFTFI1T2lRNm5UK3F0OUpDK3dVU1RDd1VIVGx0WHM0U0tNSjV6?=
 =?utf-8?B?U1RsWER5ZXRhUXZtNVF4MklZcW1ZRy9idEpWcDdJb0dHT1ZnQmNqY2taWHpj?=
 =?utf-8?B?TkxGeks1TDVaWWVia2hGM1gxcUZESUR0S0JyUTc3VlBZVHZIQjhuN2k3elZO?=
 =?utf-8?B?SVcwSHE4OWZPTnFwSW1CRkdyRWxSUDB6YW43d1FudlUvNEZQUW5DbWxGOW1W?=
 =?utf-8?B?OHJkOXFaa255M2U1Rk0xK0s5VnBiY2JYREU0WVE2QkI3SDZ0U1hJSEdhZ0kr?=
 =?utf-8?B?bFQ5eVZibzZVQy81VS9wdURvWHpMTWVkWDNTdkVoK203ekdHUXVnV1dhejgz?=
 =?utf-8?B?TGxxNHVTK0dXaUVwT2hCRWptb0hzK1ZoaER4dlhkMjBoSWdVZkJVZStwWUZY?=
 =?utf-8?B?MmlYNDQ5N25CQUF5MmdwK3g0Z3RZV1dlWGJZQWMxSUxmRFRYSFRjSDFWd0Fa?=
 =?utf-8?B?TE9Ec1pLRk0vOWF5ckZEVzR0R29FNDVDQTZ4enVVcDJtYzhCR2dWajlZMENt?=
 =?utf-8?B?RWk5bXo1b2FFQk91ZDM5SHRtcC9QUm9lQnZkb0JhN3NBUEdQTzNLamlnRnMv?=
 =?utf-8?B?dUNCMGMxR0lVMjVtTytHUzRQcDBFMTJScTJCSWtoZHRjUVhOMHZnemFVc2ZJ?=
 =?utf-8?B?NnBRT0Qza29PekNDaWxyaDJqMVZZSllJYzBCQmx6czFKWG11akdGN0wzNzh3?=
 =?utf-8?B?NS9ZS2tPaWdLUXpXeEJGbXZBMGNCVlZOM3U3cjV4S3ZoeDRhWElVUFhYRGti?=
 =?utf-8?B?Szc2cStXZE5kKzdWNjVyNnZ0WTZFT0hnVHlIREtCUW5aTngyeDlBaHd4THJs?=
 =?utf-8?B?Y0pqa0ZBYUprb0RVMS90S3ZlNzczeGFFL1VMdDFudndsZUgrYWhlUXdtY3V3?=
 =?utf-8?B?aXJ6azVGY3dZbnNkTFZPQytJRHdzb2VYT0RDV09KM1Z4NFlLWUkxR0ZQRGZV?=
 =?utf-8?B?S1FWOURablBNTU44VDNFcGZmMHRGWDZqRmgxa0VPZ3RtQjlQV1A2dnhleVA3?=
 =?utf-8?B?ZlZ6WERVanZQMHJ5dFdOZzcwSTI4STA2bVRreFl4SStJdThOQVpMYVYxcUw0?=
 =?utf-8?B?WnNhWjFQVzVraW1jeVVmL29WUUN3OFFpYVNwU2tRdEtZL21MWWxSdEtUVXNF?=
 =?utf-8?B?S3AvbmUxbWdMYVg3c1QzSzBabUMvMzVZa2NCQkhSS0V0RjFLRy9uazhjWFBZ?=
 =?utf-8?B?VnFzUjVtT0I1T1VtaklPem5YMGh3SlA2ZFdEbEF6TE5YVkw0REx3QVZwaTFK?=
 =?utf-8?B?TnRZMFY1TzZCaEhVd1RjVHZ4N2FvZzZFUDJTdVFBdHE5RWMweXFGWllPakVF?=
 =?utf-8?B?ZXovVDhFQnRNcTdFaDZrV0szNy82aCtLTU5hcms3WVNiRHRjZHp5d2J2MTd2?=
 =?utf-8?B?SmE1RmlGcC9QQ0tGdjE0SEZkK1lJeHo2QXZDM0tMTnpNWnZmb0FHcktpUGFw?=
 =?utf-8?B?dzJTZ0tsalozRkdyZG1KcUgyd0x4dW04dUZqM01WNHVtRklBSjZVOVdwcTlB?=
 =?utf-8?B?bGxjdk5hVVh1aUI2Yk9RSVVBMldMNkZKWjMzSVFXVUFQUEEvTWtjNG1lY3RN?=
 =?utf-8?B?Z2NaUUR5OTh2NU44bUtBck13RnNaaXZoUXRWVTE5MmlHbzBTcDVHb2ppd0M1?=
 =?utf-8?B?czB2UnhaQS9vYUh5SnY1ZDVlL0tvU1RFeCtjQkV1ZkRZSitIS1UyZHZySC9Z?=
 =?utf-8?B?VFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BE33B5DE10B62B4A8A1A3335D190EE4E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6387bfc-d5e5-4309-65ec-08dc79d06d02
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2024 19:58:46.8253 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /twXmY7/dnCGJMNW8HNOewtkvo24dEawcEDfvgeAmjMmsovekz0/gizdmGxYF8Rh2AQ6dgJvxqpJej2S89Vufw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5061
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

T24gVGh1LCAyMDI0LTAzLTE0IGF0IDE4OjM1IC0wNzAwLCBBc2h1dG9zaCBEaXhpdCB3cm90ZToN
Cj4gUGxlYXNlIHNlZSBjb3ZlciBsZXR0ZXIgZm9yIHY3IGhlcmU6DQo+IGh0dHBzOi8vcGF0Y2h3
b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTIxMDg0LyNyZXY3DQo+IA0KPiBGb3IgY2hhbmdl
cyBpbiB2OCB0aHJvdWdoIHYxMCwgc2VlOg0KPiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3Rv
cC5vcmcvc2VyaWVzLzEyODk5My8NCj4gDQo+IEZvciBjaGFuZ2VzIGluIHYxMSwgc2VlOg0KPiBo
dHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzEzMDcwNS8NCj4gDQo+IFRo
aXMgc2VyaWVzIGlzIGFsc28gYXZhaWxhYmxlIGF0Og0KPiAgICAgICAgIGh0dHBzOi8vZ2l0bGFi
LmZyZWVkZXNrdG9wLm9yZy9hZGl4aXQva2VybmVsLy0vdHJlZS94ZS1vYQ0KPiANCj4gVGhlIHNl
cmllcyBoYXMgYmVlbiB0ZXN0ZWQgYWdhaW5zdCB0aGlzIElHVCBzZXJpZXM6DQo+ICAgICAgICAg
aHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2FkaXhpdC9pZ3QtZ3B1LXRvb2xzLy0vdHJl
ZS94ZS1vYSwgb3IsDQo+IAlodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVz
LzEzMDAzMy8NCj4gDQoNCk1lc2Egc2lkZSBhdmFpbGFibGUgaGVyZTogaHR0cHM6Ly9naXRsYWIu
ZnJlZWRlc2t0b3Aub3JnL21lc2EvbWVzYS8tL21lcmdlX3JlcXVlc3RzLzI5MzEyDQoNCj4gdjI6
IEZpeCBidWlsZA0KPiB2MzogUmViYXNlLCBkdWUgdG8gcy94ZV9lbmdpbmUveGVfZXhlY19xdWV1
ZS8NCj4gdjQ6IFJlLXJ1biBmb3IgdGVzdGluZw0KPiB2NTogQWRkcmVzcyByZXZpZXcgY29tbWVu
dHMsIG5ldyBwYXRjaGVzIDExIHRocm91Z2ggMTcNCj4gdjY6IE5ldyBwYXRjaGVzIDE4IHRocm91
Z2ggMjENCj4gdjc6IFBhdGNoZXMgYXJlIGNvbXBsZXRlbHkgcmVkb25lIGFuZCBkb24ndCBzdGFy
dCB3aXRoIGk5MTUgdmVyc2lvbiBvZiB0aGUgdWFwaQ0KPiB2ODogU2VlIGh0dHBzOi8vcGF0Y2h3
b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC81NzUyMTQvP3Nlcmllcz0xMjg5OTMmcmV2PTENCj4g
djk6IFNlZSBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvNTc3NDQxLz9z
ZXJpZXM9MTI4OTkzJnJldj0yDQo+IHYxMDogU2VlIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNr
dG9wLm9yZy9wYXRjaC81Nzc5NDMvP3Nlcmllcz0xMjg5OTMmcmV2PTMNCj4gdjExOiBTZWUgaHR0
cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoLzU4MTIzOS8/c2VyaWVzPTEzMDcw
NSZyZXY9MQ0KPiB2MTI6IEFkZCBsYXN0IHR3byBuZXcgcGF0Y2hlcyB0byBlbmFibGUgWGUyKyBv
dmVycnVuIG1vZGUNCj4gdjEzOiBVcGRhdGUgbGFzdCB0d28gcGF0Y2hlcyBhZnRlciBjb2RlIHJl
dmlldyBjb21wbGV0aW9uDQo+IA0KPiBBc2h1dG9zaCBEaXhpdCAoMTcpOg0KPiAgIGRybS94ZS9w
ZXJmL3VhcGk6ICJQZXJmIiBsYXllciB0byBzdXBwb3J0IG11bHRpcGxlIHBlcmYgY291bnRlciBz
dHJlYW0NCj4gICAgIHR5cGVzDQo+ICAgZHJtL3hlL3BlcmYvdWFwaTogQWRkIHBlcmZfc3RyZWFt
X3BhcmFub2lkIHN5c2N0bA0KPiAgIGRybS94ZS9vYS91YXBpOiBBZGQgT0EgZGF0YSBmb3JtYXRz
DQo+ICAgZHJtL3hlL29hL3VhcGk6IEluaXRpYWxpemUgT0EgdW5pdHMNCj4gICBkcm0veGUvb2Ev
dWFwaTogQWRkL3JlbW92ZSBPQSBjb25maWcgcGVyZiBvcHMNCj4gICBkcm0veGUvb2EvdWFwaTog
RGVmaW5lIGFuZCBwYXJzZSBPQSBzdHJlYW0gcHJvcGVydGllcw0KPiAgIGRybS94ZS9vYTogT0Eg
c3RyZWFtIGluaXRpYWxpemF0aW9uIChPQUcpDQo+ICAgZHJtL3hlL29hL3VhcGk6IEV4cG9zZSBP
QSBzdHJlYW0gZmQNCj4gICBkcm0veGUvb2EvdWFwaTogUmVhZCBmaWxlX29wZXJhdGlvbg0KPiAg
IGRybS94ZS9vYTogQWRkIE9BUiBzdXBwb3J0DQo+ICAgZHJtL3hlL29hOiBBZGQgT0FDIHN1cHBv
cnQNCj4gICBkcm0veGUvb2EvdWFwaTogUXVlcnkgT0EgdW5pdCBwcm9wZXJ0aWVzDQo+ICAgZHJt
L3hlL29hL3VhcGk6IE9BIGJ1ZmZlciBtbWFwDQo+ICAgZHJtL3hlL29hOiBBZGQgTU1JTyB0cmln
Z2VyIHN1cHBvcnQNCj4gICBkcm0veGUvb2E6IE92ZXJyaWRlIEd1QyBSQyB3aXRoIE9BIG9uIFBW
Qw0KPiAgIGRybS94ZS9vYTogQ2hhbmdlcyB0byBPQV9UQUtFTg0KPiAgIGRybS94ZS9vYTogRW5h
YmxlIFhlMisgb3ZlcnJ1biBtb2RlDQo+IA0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL01ha2VmaWxl
ICAgICAgICAgICAgICAgICAgIHwgICAgMiArDQo+ICAuLi4vZ3B1L2RybS94ZS9pbnN0cnVjdGlv
bnMveGVfbWlfY29tbWFuZHMuaCAgfCAgICAzICsNCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS9yZWdz
L3hlX2VuZ2luZV9yZWdzLmggICAgICB8ICAgIDQgKy0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS9y
ZWdzL3hlX2d0X3JlZ3MuaCAgICAgICAgICB8ICAgIDMgKw0KPiAgZHJpdmVycy9ncHUvZHJtL3hl
L3JlZ3MveGVfb2FfcmVncy5oICAgICAgICAgIHwgICA5OSArDQo+ICBkcml2ZXJzL2dwdS9kcm0v
eGUveGVfZGV2aWNlLmMgICAgICAgICAgICAgICAgfCAgIDE4ICstDQo+ICBkcml2ZXJzL2dwdS9k
cm0veGUveGVfZGV2aWNlX3R5cGVzLmggICAgICAgICAgfCAgICA0ICsNCj4gIGRyaXZlcnMvZ3B1
L2RybS94ZS94ZV9ndF90eXBlcy5oICAgICAgICAgICAgICB8ICAgIDQgKw0KPiAgZHJpdmVycy9n
cHUvZHJtL3hlL3hlX2d1Y19wYy5jICAgICAgICAgICAgICAgIHwgICA1NiArDQo+ICBkcml2ZXJz
L2dwdS9kcm0veGUveGVfZ3VjX3BjLmggICAgICAgICAgICAgICAgfCAgICAzICsNCj4gIGRyaXZl
cnMvZ3B1L2RybS94ZS94ZV9od19lbmdpbmVfdHlwZXMuaCAgICAgICB8ICAgIDIgKw0KPiAgZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2xyYy5jICAgICAgICAgICAgICAgICAgIHwgICAxMSArLQ0KPiAg
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2xyYy5oICAgICAgICAgICAgICAgICAgIHwgICAgMSArDQo+
ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfbW9kdWxlLmMgICAgICAgICAgICAgICAgfCAgICA2ICsN
Cj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9vYS5jICAgICAgICAgICAgICAgICAgICB8IDIzMzQg
KysrKysrKysrKysrKysrKysNCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9vYS5oICAgICAgICAg
ICAgICAgICAgICB8ICAgMzAgKw0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX29hX3R5cGVzLmgg
ICAgICAgICAgICAgIHwgIDIyOSArKw0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BlcmYuYyAg
ICAgICAgICAgICAgICAgIHwgICA2NyArDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfcGVyZi5o
ICAgICAgICAgICAgICAgICAgfCAgIDIwICsNCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9xdWVy
eS5jICAgICAgICAgICAgICAgICB8ICAgNzcgKw0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3Jl
Z193aGl0ZWxpc3QuYyAgICAgICAgIHwgICAyNCArLQ0KPiAgaW5jbHVkZS91YXBpL2RybS94ZV9k
cm0uaCAgICAgICAgICAgICAgICAgICAgIHwgIDI4NiArKw0KPiAgMjIgZmlsZXMgY2hhbmdlZCwg
MzI3NSBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQ0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0
IGRyaXZlcnMvZ3B1L2RybS94ZS9yZWdzL3hlX29hX3JlZ3MuaA0KPiAgY3JlYXRlIG1vZGUgMTAw
NjQ0IGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9vYS5jDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJp
dmVycy9ncHUvZHJtL3hlL3hlX29hLmgNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dw
dS9kcm0veGUveGVfb2FfdHlwZXMuaA0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1
L2RybS94ZS94ZV9wZXJmLmMNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0v
eGUveGVfcGVyZi5oDQo+IA0KDQo=
