Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C54BDEB64DC
	for <intel-xe@archiver.kernel.org>; Mon, 10 Jul 2023 14:41:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92B2110E132;
	Mon, 10 Jul 2023 14:41:34 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5201C10E132
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Jul 2023 14:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689000092; x=1720536092;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=+Kz4KIBUCbjdoPmy0jSvnUuCq51Z0XZpcX1/5HIGpTA=;
 b=efxe1UHoxFshe3fBt/hO84fHsx1L+jmJ0DPp2fnE9Tgpz57TdHBlkYKm
 fbY0+ai/tmpX3r92BrRlBRG9smid010gLINwTduncMti9oqgL/HiJCjdX
 k8b6J0pXVV5Z1nmty9egOlloku7A9yYkfX6dwC3KMiX8nOtEmzoDkBptY
 o1m2v+imD3Jp60Nz0VWYXfet3amr0okx2wfoqg0bu22XXDcmkf0G5ASJr
 uP8xmehFxZ19maciD2pQPyn9SEBOPYBjYBLWaV0fZKTjAfgXVD5oWKb8K
 wXSsNlt6YUf/Hwn+Dp0nduQzbH8MQ0p7u6ySRs3hQVyY7VrEWqWLZ37qn g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="395144420"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; d="scan'208";a="395144420"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2023 07:41:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="810843561"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; d="scan'208";a="810843561"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP; 10 Jul 2023 07:41:31 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 10 Jul 2023 07:41:30 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 10 Jul 2023 07:41:30 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 10 Jul 2023 07:41:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fcb48/JzlOV51AW+I0KqqacdAILgFUOfSbOh/9fpp++lt0HCnIz6wt1ewjfbXzYyBuQ+VTCwAmLlh7pYHcNxLiqLuVCZKkmnkE1DVuz2sF9iErUvEs7jvIt4uzvwqnoH8F7NNqHMUnfQIbYjPkC5t94CYtPi4X0QGQriB2TM7P3LaOwnu3WQchsgGnC8wLPLw2pTT73F8fv9cPT3L+eB36wnDAIYJTbQWTBned7OQMTpRm5iNnBlNcSWcbpzmFak2s+ZI7e1yUpFd5VkhKUS+JS6vx6u4OfDrZMn4AGU3SAieya7G7dbReJTavg8uicjxjOZlW/zgMwwXoEScApdFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Kz4KIBUCbjdoPmy0jSvnUuCq51Z0XZpcX1/5HIGpTA=;
 b=gpv0wKST9gmPcB/xcHxXw1xlWdzCODIglv02+b5Y/rdXYbo9gtmyJWG/KPH+Wqxjt5IiJi6tIhY2k/Z4aujVBlD+jvCpejgLOLh/KeNcaSQFVSv66xZLjjMakOCKra0UT0asene7Z5Me8Iw7nkmg6HfJHXoHB7XfWjiK8ODZYH4iiUfaDM0l6XuCwz//YktaDefB5xYJJTenthM/4gV6rUsSe1J9hIwwEgFsoePQfQGg2KotKctrVhr+KrfWsNOxHO1K8DI88gSQEunv/m15X/DWM0PV2vwaPourG6erapKpJKFx4hukZeU1wSPTtP6TeQ064PQltMr6WO7RT8FIJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by PH7PR11MB6329.namprd11.prod.outlook.com (2603:10b6:510:1ff::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.31; Mon, 10 Jul
 2023 14:41:26 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::5cab:9ad8:a5ad:6e0]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::5cab:9ad8:a5ad:6e0%7]) with mapi id 15.20.6565.028; Mon, 10 Jul 2023
 14:41:26 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Auld, 
 Matthew" <matthew.auld@intel.com>
Thread-Topic: [Intel-xe] [PATCH v6 00/11] Try to handle TLB invalidations from
 CT fast-path
Thread-Index: AQHZsxLP8mOU4ntRKkCxGQ8p5whzy6+zEwyA
Date: Mon, 10 Jul 2023 14:41:25 +0000
Message-ID: <1a8fa626466bdf8bffce3aa7e1a9c022bd6def53.camel@intel.com>
References: <20230710094037.28179-13-matthew.auld@intel.com>
In-Reply-To: <20230710094037.28179-13-matthew.auld@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|PH7PR11MB6329:EE_
x-ms-office365-filtering-correlation-id: e35964ac-4672-4470-b9e0-08db8153bcdb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CALYUXppNzZQsDs727lI0HdQflSg0VK2nkUjii+0illDEOm0wx90JDE0i2/1cW4lVSbW8ckTxY3dQhcHZWhIhGdVW3KzKIdyjeiJEmFzO9efJYBqg1xDQmcXBVUu/KX1uDxcVmyQO1Kv8EeDtp/Q2LoMTCUymTtLCOL/pHiEfeGUSgkQu3sN/Mqyw3uzmuLGs5AWe3YFbYlLYBxo+y0JdUEPt9fSViyQzXm3OKqkInHD8TH609yAdrVgIMKpw0fc3VxW+tr4a8h+gaTbxXjzADnVWRUjt8kuGi3EXXiC57UMd1R7X7pZDnyg4F/1H/pgVVDVh/pVb9tPdJvSagy9b1VniKy4jdKlWLnNcaLcuv3c81pAQOrMd1qMf0zkxX6da88OMdgoq6ZKteWp0lD3lg1rppqdw+D4ujQ8fScqFP3ZLoxnYqH8m4vs4BUH+WCcMQuRXZl9UCwBFnO14goACgnP8B2D8JwU7Ze4cO1s2qlqg1KdfkAFEX638ml6dR6sonTJyL3pdS2ddwuupdapbgBVb4waR3ZX5Eca8FRGjIhWMLfpUlc0ObikEGrIRS3VUmQq3rhDjSYYTiAYRPsw2CeinSSAx3ddYrdW2OuSw16uXFEdvwWxGb1vReXXFPiZ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(136003)(366004)(376002)(39860400002)(396003)(451199021)(82960400001)(38100700002)(110136005)(71200400001)(6486002)(86362001)(6512007)(38070700005)(36756003)(478600001)(6506007)(26005)(186003)(2906002)(4744005)(41300700001)(83380400001)(316002)(122000001)(8676002)(8936002)(5660300002)(76116006)(64756008)(66946007)(66446008)(66556008)(66476007)(2616005)(91956017)(6636002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UWhwTnBEZkxxSzRmMDdQSFFuRGdTVEtPazhjRHM3SEpHSklickdVWlZpV0Q2?=
 =?utf-8?B?dkJRM2hYYzc3S1FqYzZyb2JUbXJWaGNWQ203R1A3aTBCT29Xb3k3OGZ5VC9V?=
 =?utf-8?B?Zzd5V0toUHVtTWFEV3BHQWptbFB2TGxXZGdqQTkvc2thWVpwV05NbTN6UWV6?=
 =?utf-8?B?am1HbVJ6OWlyYzhVQ1o1dVZZeFZ1bkR2My9KNWlDVE52KzVPdmt6dHRKdmVp?=
 =?utf-8?B?b0JiR1Z6MlQrMHJHTHdxSmk1YzZoVUgvem5RN25reWN1MkZ5bTFJSXpwdXBQ?=
 =?utf-8?B?Nk54M2w5dlFaVGR1bUtwd3A4dnArc3BvNlUwK0pmeGdjWlVOV2oyMWxnQWNL?=
 =?utf-8?B?Y2ZFcTVCWGgrRm5jNHpXaHcvUHJTcUcxWTRsZ3FMWUt4MEkwQzNNQ1BUZHNW?=
 =?utf-8?B?MndSRkt2UDFNbUxDRndSejFrZTFlT0FlM0tWNDFUeFZ0RkpFUFJJQW1aaXM5?=
 =?utf-8?B?R0xLa01mL1d1OVdZK2xCb000WkJhY1Z5ODVkcnRuVmZVZkJkNEh0Qmx4YnNN?=
 =?utf-8?B?YjU2Vkp4VzhENysyYStoR2JEaGZ4Z1FDUUUyRGhLUktjcVo3czZxMS9QZEpq?=
 =?utf-8?B?NzU3SGg3S2dhK1gwQ3BiMUVGNXRRYjBBWXh1REwySEpFb3Jtcmp1VHJCeWoy?=
 =?utf-8?B?SVh3WGtuWjEyNWtrZVVrcFczdHhuWVI5UHJRclhNb0RLUEorMHVCK3F6Ymp4?=
 =?utf-8?B?TmREa0pRcHM1enJsMndLUGRFcEFJbnBtSm0yNit6aU1EcnRnNVF4UEZaM2JV?=
 =?utf-8?B?K1pQZVdLNEdreC9DWUNaQlBhMzdTaEpqR0F1RnZ0anZtRmRDRHBIVWl2enVx?=
 =?utf-8?B?MDRnQ2dJVzRMRERBUjRQTnRqS3dacEdwbnVYb2kyVlowOVU1bVJHNDlSV2FC?=
 =?utf-8?B?SzdUcUxtZlNnV1NpRzZkSUY4amdFT2NScFhwVy8vRitEeENYZ3M4UU5Wclly?=
 =?utf-8?B?cTYrL2tsWkxSM2E3bzJMZ3dLZkxlQjFSUll2aEppM2ZHYVYvdU44d0NUMFBz?=
 =?utf-8?B?RzQ3WjdDUUV1OWFxZHk3YjArQzE3ZVVKVGZwQU4zUzQ5dUlmZVQzNHFFbzd5?=
 =?utf-8?B?Yi9sd0tXQkU4bjdUYzdzYmFyTmJDeUNuZWptMVhReURtaUxDM1g2TTdRZ1hL?=
 =?utf-8?B?eFpwbWg0bFVFNENsMVlmcDhRSW1DdDhtSjJmamNFczJmZmJ5R0tnemY1SW9H?=
 =?utf-8?B?ak9UTTNPbTlaQnI0RVRrQ3BEQlhzNE1idHFlZVNwVUd0dUNCRDBrKzl5bU93?=
 =?utf-8?B?eDhVNC9jKzN6TWpNSUh6dDV6MXdjdmVmWGJ3VmtaVjkrSlN5UmVxdXNMWm9m?=
 =?utf-8?B?TGxUazdGc2RBbFF4V3UvRUhTK012YXFqKzdxVGJ3ZjEwdmJHRXN1c1dLNUxk?=
 =?utf-8?B?VnUvTUtOaEtpalM0K0ZZTGs0SmlvUjgzNSttdFNUT2hRclZaWXo2OWUyL2Q0?=
 =?utf-8?B?RDgrQitncjZ3T0FPdjU5MVFvb3JjZzAyemdyeTB1aXpxN1FVVnowVnRFeU44?=
 =?utf-8?B?emFuWmgveXc0d0kzT0swS0lSRlRjR3RLbkx4dXA0UHBJY1ZhNTN5clBrVW1L?=
 =?utf-8?B?QTM4b0sxS2ZVb1FrSmQ0WHpzQ3owMkduMjhSSzErV1ZabXNaYmhPbGx5dzBt?=
 =?utf-8?B?VWIvK3AxK3dic3ZhanJLSzBQdTBXc2xlR0haTFBvUDRHaVVkOGVadEhzWXFs?=
 =?utf-8?B?S1dKWm9hWkZqdHdid3I5MjV5S2grSGtHNFNqdWVTTlVxT2g3cFV5N21zOGV2?=
 =?utf-8?B?K2RlVlVGRWNDWEIzQzQ2RnB0V2JzUE12dFYwRWw0QkZOT094NW9zblo2aFdz?=
 =?utf-8?B?elBrTklnOUt3cEpnVDROWTRTV1NoR2x3UytLUDVKd09Td3lkaGwxOFJYWCs4?=
 =?utf-8?B?L1RoWTNTUXhRbGVhYVEvZVpYbU05NDJPaGR5ZjdVeTlwU0t3bU1MNlpsNERY?=
 =?utf-8?B?N25BL0RYaElMMVNlRHQxdzM0QlNqVUIyY1lzTkhFc3pGY1BHK2NpaEJQWlRE?=
 =?utf-8?B?SStqTnpxeW0xSmt0M1k5NlZzeit4ekg0c0RjT1JycmtSL1JNTEl6QW95YTBB?=
 =?utf-8?B?WHBEY2ZjZkpzMkxvN3JTdlROWlYxdGlLdGdQTU9pdjI1TEdzQmV4Y0dibE1x?=
 =?utf-8?B?V0FYVUxXRk0wSzBKbUZJYm1aYnZZRWt0UzEvRDdqNXFzbEhWUE9pR1I0RHFI?=
 =?utf-8?B?dWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F50C51269F61884E8A16E1ED5FC66BA0@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e35964ac-4672-4470-b9e0-08db8153bcdb
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2023 14:41:25.3328 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 46gkJthtu+yxJqn5i5jROVS+UqYfFGwojb41bINkENUzfgy/pbLY40Gk9hnqITg1A4bArsNrPaT4vDIlnObXlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6329
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v6 00/11] Try to handle TLB invalidations
 from CT fast-path
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

T24gTW9uLCAyMDIzLTA3LTEwIGF0IDEwOjQwICswMTAwLCBNYXR0aGV3IEF1bGQgd3JvdGU6DQo+
IEluIHZhcmlvdXMgdGVzdCBjYXNlcyBhbmQgd29ya2xvYWRzIHRoYXQgcHV0IHRoZSBzeXN0ZW0g
dW5kZXIgYSBoZWF2eSBsb2FkLCB3ZQ0KPiBjYW4gc29tZXRpbWVzIHNlZSBlcnJvcnMgd2l0aCBt
aXNzZWQgVExCIGludmFsaWRhdGlvbnMuIElmIHdlIGhhbmRsZSB0aGUgVExCDQo+IGNvbXBsZXRp
b25zIGRpcmVjdGx5IGZyb20gSVJRIHdlIGNhbiBzZWUgYSBiaWcgaW1wcm92ZW1lbnQuDQo+IA0K
PiB2NDoNCj4gICAtIFZhcmlvdXMgdHdlYWtzLiBCaWcgdGhpbmcgaXMgdG8gbWFrZSBzdXJlIHdl
IGdyYWIgdGhlIGZhc3RfbG9jayBmb3IgdGhlIGcyaA0KPiAgICAgcmVzZXJ2YXRpb24gd2hlbiBk
b2luZyB0aGUgQ1Qgc2VuZCwgd2hpY2ggY2xvc2VzIG9uZSBiaWcgcmFjZSB3aXRoIHRoZSBDVA0K
PiAgICAgZmFzdC1wYXRoLg0KPiB2NToNCj4gICAtIFZhcmlvdXMgaW1wcm92ZW1lbnRzLiBGaXgg
dGhlIHJhY2Ugd2l0aCBhZGRpbmcgYSBmZW5jZSBhZnRlciBpdHMgc2Vxbm8gaGFzDQo+ICAgICBh
bHJlYWR5IGJlZW4gc2lnbmFsbGVkLiAoTWF0dCBCcm9zdCkNCj4gdjY6DQo+ICAgLSBPbmUgc21h
bGwgZml4IHRvIHBhdGNoIDggdG8gbWFrZSBzdXJlIHdlIHdyaXRlIHRoZSBjb3JyZWN0IHNlcW5v
IG9uIHJlc2V0Lg0KPiANCg0KVGVzdGVkLWJ5OiBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIDxqb3Nl
LnNvdXphQGludGVsLmNvbT4NCg==
