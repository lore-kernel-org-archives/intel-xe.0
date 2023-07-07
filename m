Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13082EB64DA
	for <intel-xe@archiver.kernel.org>; Fri,  7 Jul 2023 13:47:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0A6810E59B;
	Fri,  7 Jul 2023 13:47:20 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0AEE10E59D
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Jul 2023 13:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688737638; x=1720273638;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=aHc2DRejAPcNqSEXs12ab8b0QEiMG0pMTepU0/xwtNU=;
 b=Y/tUgM+Wy6No07rZLC5AlfS5YuUJys4C6+F1x2Y18jxQ0cNxZBk4P9Os
 SsL5pzcxW4NgH+7L0oatS1y/+Qg+JMLF7LO5j0Nl1Na17K1TJInSF3Pup
 zEZDnx3m4DWRWNk/yRtzy3exOid4A/TPVPsr2aZyFSxdEAUuWBmBOw0an
 9s3prMeDIkOGo8Mszuk1N35mvyEqgVdS7KdEspT0wQPywldP3IW8CtWlC
 d0EGhEA1qHS/7uE2gDk6wspSKDGobh7q5WRRjItMxlhvfS4P++dqI8rTu
 gWX6Zqzg84k08PWiOU9mIQnWQ+7OudXx4m0PLO7DKbwiTQ9jbnYZvv2IA A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="348687580"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; d="scan'208";a="348687580"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2023 06:47:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="719954194"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; d="scan'208";a="719954194"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga002.jf.intel.com with ESMTP; 07 Jul 2023 06:47:15 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 7 Jul 2023 06:47:14 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 7 Jul 2023 06:47:14 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.109)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 7 Jul 2023 06:47:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VDB33yjbYNoawo30badEBhFJ4zALFP+5x7LdIVAGIxrbAXEiI8SXJAx2Mw2SAHNNWUsKHAP6KjJPWrUTlKoC5/RCx+JuXQK1tKkJRbldMoX2UDZUm+J5zUhSbba0kMim8IBo2hjho9ZzuMkOcjNEUEus5IiyhvgWEJG/o+lzCgm1qqfZ0t2Ikk0GNhStzFoSua20bv8hBguGRifdNWWCrpE1RZw1VrThqbR1i1hALijeOu3RtdhuoUGzsIaR/AxnZo3ibSF2gU63p8ERM2pXbbaf82EY2EXbBkSco4iFWxz8AMHkkVayGlRY1xlvgglu2reqsCSsTQ2WoJiOqksoRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aHc2DRejAPcNqSEXs12ab8b0QEiMG0pMTepU0/xwtNU=;
 b=DY7oRQVdudU4zh5EcZUtohQjeS/+cjBuv5eoVvbrS4T3P/hhc2cCmjY9bZTuJMXMX59qpGBnPqjkvkhDFxuG+cQZf05W9c4k+4jzjVjGul2WQQH194d5Od9p1ATnP4enl8DWE860iXWnXL9hNLOJmlRkqF3VydUOhPwrTAX1DB7xwYr0CBsu5G1BTCwHlIFcvveWN9Azr14KNmDQY1/1K84QzaYukZAxarfDQlSabvMtrxxEffwyp5oSBi+xYOC1w/zisS9IBiilw5T48s0qqbvqmOP5Job2Gly027Pc9K2DL1rpCznc3DUdYQdBgOIqpJmdwlB4nV0pLDUwzgg4TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by CY8PR11MB7827.namprd11.prod.outlook.com (2603:10b6:930:77::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.25; Fri, 7 Jul
 2023 13:47:12 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::5cab:9ad8:a5ad:6e0]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::5cab:9ad8:a5ad:6e0%7]) with mapi id 15.20.6565.025; Fri, 7 Jul 2023
 13:47:12 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Auld, 
 Matthew" <matthew.auld@intel.com>
Thread-Topic: [Intel-xe] [PATCH v5 00/10] Try to handle TLB invalidations from
 CT fast-path
Thread-Index: AQHZsCXe7QUYc7/TwUy+PVQG2vXuXq+uUsCA
Date: Fri, 7 Jul 2023 13:47:12 +0000
Message-ID: <c15cd57e9c9302199e3625b756632f362640c769.camel@intel.com>
References: <20230706162003.427026-12-matthew.auld@intel.com>
In-Reply-To: <20230706162003.427026-12-matthew.auld@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|CY8PR11MB7827:EE_
x-ms-office365-filtering-correlation-id: 40052cba-d6b3-4884-b3e7-08db7ef0aaa1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pVfV1L3eri8OHvJnBW2VDMPBSchdy9/RNjXKoPaf3/4KrY3slyZv88DtPTr3CNzLH3uEeCdGS7Qeh0m8L9jHa78wadCVdv+ilyVLby0txkGE+d4J67B0GhBt6jU0Td7n2wzz6C1Zqtcxf4jYqqWZxg96rcSomQKlmnb0dCgDZz7w/t6yJ30YAMvQ1p3LPDP7GJL0uDLBa4VsSvwyBVNTc0L+hwOZPhtUsKLXACN3WYvfvJjlyYcDxuvdS95M5YM9HGDqoMsIM7CYkFV2tr12PU01CGJEN3x6fllsJstpMc5X9ixXPAY9YrI0s+p6vxD404fprAVmUOAOcVh/P6RptVLqEi2vySU4ikIIh50QyS+NQuWbCqgBzk8Ej/JQlQAe/lpRukrYCiT/+flgQWMEWwBl9OA20XH3foG7EpbjWc+dsljaYjgWlPLRLlefvhfYs9jbHupWLL5HygJBwnkw91qn8fL2k9zCRyT9Iz+OmZOtmWlcvLNSK9ZhRHyJa7rZcc12NJiUVHTnnGzh8mQd47NFzkf9yn3G1Z4DsO5slON8qghZoCHvhx8ZHT+sDxjIVf66NgVnZGy2y3Ekcntr204/udBn895zq0REcV39c1g=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(396003)(136003)(39860400002)(346002)(366004)(451199021)(41300700001)(5660300002)(71200400001)(6486002)(110136005)(4744005)(316002)(8676002)(2906002)(8936002)(64756008)(66446008)(66476007)(66556008)(76116006)(66946007)(91956017)(36756003)(6512007)(478600001)(86362001)(186003)(38100700002)(2616005)(122000001)(82960400001)(83380400001)(6636002)(26005)(6506007)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R090SitxejNuaXNCS0RvNnpRMExGQ0JCMXh3NENubkVEK2lmSEFrVGpzL3J6?=
 =?utf-8?B?Zkt2S1JKZDN1Mkx1d04wMmhsK3U4OHFTZkY2Q0s5dzMvamlZYy8xditWWkt0?=
 =?utf-8?B?bGp5L3RIZmZHMFdlY2NFcU9qeGNSbjlxNVUrR0kxWk96OW90VTROSVV4eDM2?=
 =?utf-8?B?ZGpsemFLSDhja1F1R1FVem1LajVYbjRnSkEyTHpSbW8zY011aXI1MERUVk53?=
 =?utf-8?B?a3VZUkJjWGgwSUs4TjJxRkxzcGdMTEp4MHprUmRMS0FEc1RSbGtkWDlyR1Vq?=
 =?utf-8?B?ajFValNqSE9UVEFLM0JpSEM3d044MEpJbWl6dG9UemZFT2psYjRpbVJvQTZO?=
 =?utf-8?B?UWFFWDUveVBDK3VYbllLNklSWU5pRjRueHh5aHFzc0tKTkVBRWVlT1JNN01P?=
 =?utf-8?B?OFhBb1RPc0JTNjF3M3ZoMkdWd25RdHFsL1RPVjFjbWhBc3UzU3FqeUFYanZQ?=
 =?utf-8?B?VnNHK3ovYW9SQjhUa2pvRlNCcEd3TlUzMTBRQzJzaGp0by9WRklFVHFxam5o?=
 =?utf-8?B?c1hXdlI3Mm42RG8zaHE5QTVCQi9HZDU0SFBBQ241aXduVHQyZ1I5cnZpamt3?=
 =?utf-8?B?K0JzVHlLZDBvdlFicHFVeVIzb1NEQmR1eVc2d0pJUi9DZ2k2TFVxSzVyYVg4?=
 =?utf-8?B?SnBLSFlCbEV1UnhXYXZpTnRucTYzcjREbmt2Zkp1MGR4TmREc2lyUXZkV0k5?=
 =?utf-8?B?UzQ0K3p6OTRkYWUxcEd5WDFDd21vZGVKQ3I1OWNtVHFZUzlRV0VCcVcyRHF3?=
 =?utf-8?B?cmMydTRBK2Q1aHh1aC9Ga3VYVWw0RXFQemFGajEvN1g1QTltRFhScW4yZnBs?=
 =?utf-8?B?UjJaT3p2TVIxcXRyYXA0ZDZNaEFzN1Z3U2lhV0pPblRTVE95MFdzZCttaWQ4?=
 =?utf-8?B?blZGK2FwMkg1djU1MFNsZ0VBN3RHeUJpcVBydmovNk96NytpTUJLRzhQcFZL?=
 =?utf-8?B?TWFMemxrNGc2K1ovWm1HSlpkd1Q4TmFiK08yYWpSTktHaVp6VzlpQ0Ryc2l4?=
 =?utf-8?B?TS9OcFlERzM1N3BPMitHL01TZkxZaVNqeHZOcU0xNmY4eUVnR0RqNXF3M29R?=
 =?utf-8?B?M2xaLzBLR2pnY1ZkTVRNdGgyYk5iZGlwcTVWR1VsR01NQU1wWnVaeVRyRjl0?=
 =?utf-8?B?bEQ0aXpSVEg2MU9Bck9lbzlERUZwYjJINmludk9OdE1rcWwreUFvd1RPNy93?=
 =?utf-8?B?bi9jWjQ5dDhiclRsdC8za1A0TDl3ZUdoUXRvVWkwSHNyS3BsZzhvcVRUME9q?=
 =?utf-8?B?LzVqU0FPMHBwOE9zMFNPbjJaSmRiaVFkcVRyRk00U2lXRVk1WWhWMEpBSHNM?=
 =?utf-8?B?RTRYTUx3RnlGTE9FeWxibmt0aHFJOTNFejZVRzZwUyt5R0VYZGZjWGV0VUl6?=
 =?utf-8?B?alJJNkROM2UwbUgyVzVwT1BPNEJVUVEyN1VwZDFMd2FISXZMcVA0RlFTOGp5?=
 =?utf-8?B?TzRpd0dkMmlKbGtnOXFZUVdUcjBqSU9mM3VDd2JYbzUzQys3SkRxSlZjeVRy?=
 =?utf-8?B?UDJFUERmVmxUT2Z3UEtBS2dJZVA3MVlyejcrZEFLYVd0TTRzQWhIUUdYZDIy?=
 =?utf-8?B?VGNJMUR6amFHM0RoMlZ1QzBvL1A0am1CVDM3bXJYY1pSQU1ieGNCblozK1Bq?=
 =?utf-8?B?Y3lBSW9WZzNMSmVjdlNnMDhLMzhSYXYyTkpuRk5jR1VYQUFLd2JvRUNyQ3l5?=
 =?utf-8?B?UGJRL1B2V0VPKzRKSmpsZ2cxWUw4d0VHMVRoMTJJdXZyem5uQjNqeWdlVXVx?=
 =?utf-8?B?dUkwRW53dUhGQVF0OWtYdHU1OHpCOU9UVW5NRzkwSGJWb01vOXFDUUpXSmcw?=
 =?utf-8?B?ZHIwcUlxcFRMUUJFemVSbVZvZ0JFR242TkVYTXhpVDlKV0dIVkE1UjcySWV6?=
 =?utf-8?B?NXpTM3BBLzI4UDBsa1d0ZnZINGxpSVVVbkJEdDJxek5lV0VSQWhKaEFOOVJl?=
 =?utf-8?B?d2M5aFZoMEg4dHJLbzNIYjZsMFZOTE1Kd05uR2Y4TkVyU05XejZFbUZ5VGd0?=
 =?utf-8?B?eFVkSkNHREt6am03L1BmUTVaYWE2MGp6d25zZ0o5blc2RHFqSDdDSGJ2cE9H?=
 =?utf-8?B?UlJ2VDlvQTI5anBLeWliK3U5L1V4MnNna3RRVFVWZDk1Z2ZPVUdCRHNEMDdw?=
 =?utf-8?B?SHRYc1dIdkdPRG13d3gySGlSN2k1OEVEeHZoSExDNlhHN0xXeDFGLzNyVlFq?=
 =?utf-8?B?TkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <96933465269B0D41913F3443F3B54F33@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40052cba-d6b3-4884-b3e7-08db7ef0aaa1
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2023 13:47:12.2558 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZHE5C5iEUkmA2vWPwsXIaAkBpIexjqdk2Z47fQbEhH1i14cNGxVMuEOG7g7Umze1BodIoUGx1IXcyDhPwDdksg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7827
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v5 00/10] Try to handle TLB invalidations
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

T24gVGh1LCAyMDIzLTA3LTA2IGF0IDE3OjIwICswMTAwLCBNYXR0aGV3IEF1bGQgd3JvdGU6DQo+
IEluIHZhcmlvdXMgdGVzdCBjYXNlcyBhbmQgd29ya2xvYWRzIHRoYXQgcHV0IHRoZSBzeXN0ZW0g
dW5kZXIgYSBoZWF2eSBsb2FkLCB3ZQ0KPiBjYW4gc29tZXRpbWVzIHNlZSBlcnJvcnMgd2l0aCBt
aXNzZWQgVExCIGludmFsaWRhdGlvbnMuIElmIHdlIGhhbmRsZSB0aGUgVExCDQo+IGNvbXBsZXRp
b25zIGRpcmVjdGx5IGZyb20gSVJRIHdlIGNhbiBzZWUgYSBiaWcgaW1wcm92ZW1lbnQuDQo+IA0K
PiB2NDoNCj4gICAtIFZhcmlvdXMgdHdlYWtzLiBCaWcgdGhpbmcgaXMgdG8gbWFrZSBzdXJlIHdl
IGdyYWIgdGhlIGZhc3RfbG9jayBmb3IgdGhlIGcyaA0KPiAgICAgcmVzZXJ2YXRpb24gd2hlbiBk
b2luZyB0aGUgQ1Qgc2VuZCwgd2hpY2ggY2xvc2VzIG9uZSBiaWcgcmFjZSB3aXRoIHRoZSBDVA0K
PiAgICAgZmFzdC1wYXRoLg0KPiB2NToNCj4gICAtIFZhcmlvdXMgaW1wcm92ZW1lbnRzLiBGaXgg
dGhlIHJhY2Ugd2l0aCBhZGRpbmcgYSBmZW5jZSBhZnRlciBpdHMgc2Vxbm8gaGFzDQo+ICAgICBh
bHJlYWR5IGJlZW4gc2lnbmFsbGVkLiAoTWF0dCBCcm9zdCkNCj4gDQoNClRlc3RlZC1ieTogSm9z
w6kgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+DQoNClJlZ3Jlc3Npb25z
IGZpeGVkIGluIHRoaXMgdmVyc2lvbi4NClN0aWxsIGdldHRpbmcgc29tZSBUTEIgdGltZW91dHMg
bGlrZSB0aGlzIG9uZShodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL3hlL2tlcm5l
bC8tL2lzc3Vlcy8yODkpIGJ1dCB0aGlzIHNlcmllcyByZWR1Y2VkIHRoZSBudW1iZXIgb2YgVExC
DQp0aW1lb3V0cy4NCg==
