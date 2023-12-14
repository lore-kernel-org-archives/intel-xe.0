Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D74B0C4332F
	for <intel-xe@archiver.kernel.org>; Thu, 14 Dec 2023 16:19:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E86D10E082;
	Thu, 14 Dec 2023 16:19:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E20310E082
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Dec 2023 16:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702570794; x=1734106794;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=cBka6743sedQ1tr0fjXlTrOmdcPIBoyCEIwlXsNwYt4=;
 b=jx2KEjHPjvOe20vT0bh+3HfgFnBmaYYvpyb6jZcBQ2VlGzl1jAMKhT3E
 7TeOT9PJv3yArpn6BtKtIZY7HCmbGZfXSJZG8J7dMX69Xk1mcfGlQN83D
 SUoeCxn5vWr4b3TqqHsHSTQELfyiqPL26lFhgWmFxCtJTbIaNk1wYBeI/
 XccL/oZUPBepGU8ApauP/9SoGPSrjs8KfgyAEH98yue9kV28FY/+u9AGW
 Bp5QOuxbIaunQodgha5+7hgI2/CTKHRo+YOBbemNEF0eOCc8+2Da3/L6q
 MHwCskSYJyvP7az+z4TujvoDV+8WfJR0iVdNkXeJ9UEbAs3Vk/OPeBTXJ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="13835958"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; d="scan'208";a="13835958"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 08:19:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="750587875"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; d="scan'208";a="750587875"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Dec 2023 08:19:53 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Dec 2023 08:19:53 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Dec 2023 08:19:53 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 14 Dec 2023 08:19:53 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 14 Dec 2023 08:19:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C08nZBCd9tGBtuG0u0WGeljhAvet6jonlx4uWM9KvaorV9AbYNTzkug77CeCgbgKFM3z28B/F+o++l17Hw1VoQFBsy7NprFt6IjZUHqd6jO5OIQ1rODIdQi+xMTCM+Rh3fbfDkiGkXAJMba1fYM+lm4gfnXW9lBSB+ZN7gFZbEbFZw/3gq7LYVQ52Z5npB3JzxPFjdUgVj5oWAetKOMGLM/9uuod9mOw5KV5n1O7YryK8fTcIzmVtoA1n8/2x4CDj51sHb1TiJyvjH1r5YAMq299CIEOE/1VX88VZ0zezhXEIv1HqNecf2CMuXqQNk6uYsEIbyxNVigAWkhMlivcww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cBka6743sedQ1tr0fjXlTrOmdcPIBoyCEIwlXsNwYt4=;
 b=CofUzTPE+3SPFAl2ytsG4Fpjp3LiqbExnkVCgGttVPSwUlsfgBzWVwVLLA6HXa96+pdaaEoRa1uR9i6A6JWfqhDvPKSdJdLcDL4Z1TNeIl4WXGYgCY5CA8Rkut9vwJh0YLLup7GKHxWFO8z4VqegATUZKTQzNcyphPzQD1f/KIvB4svDHJXhLlIYF+yNdWN2kILEtCq/ZEV0gZWEprUwaf2XhylWj/+SWhyzUHgqPqC9Q32vJN9ci6IUtBFMjWn4nkvr/Uc59RWcL4ZN0w8ovfo/4Vra3T+3/6L3d8fsJf6KuIBKZ9smNg7iQX5ztGUAkkAcDC+G5xdCFUucJJU/Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by PH0PR11MB4902.namprd11.prod.outlook.com (2603:10b6:510:37::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Thu, 14 Dec
 2023 16:19:50 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::8076:c5fe:e0fc:cfaf]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::8076:c5fe:e0fc:cfaf%7]) with mapi id 15.20.7091.028; Thu, 14 Dec 2023
 16:19:50 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Auld, 
 Matthew" <matthew.auld@intel.com>
Subject: Re: [PATCH 1/2] drm/xe/exec: move fence reservation
Thread-Topic: [PATCH 1/2] drm/xe/exec: move fence reservation
Thread-Index: AQHaLeyjL3aF0X9yqkma1hD+XezCd7Co9tyA
Date: Thu, 14 Dec 2023 16:19:50 +0000
Message-ID: <04496d40f88d5e4ac0836d18e56835aab5bb8940.camel@intel.com>
References: <20231213174703.536989-3-matthew.auld@intel.com>
In-Reply-To: <20231213174703.536989-3-matthew.auld@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|PH0PR11MB4902:EE_
x-ms-office365-filtering-correlation-id: 342e5fc3-328a-4851-0b72-08dbfcc07f3d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZkrUpkiaHw5NXmtWKD5WUnR6Bv4T6V7a5/NqquZIdaXjov+zLck5DgXQ5zCrZNIdCWLJGp+JW3XBj9cGKLzhFU/ehmLN8HR2PquV88UAftlRPAYZGF3DSwNf4VstYKCc0fa2Fquslf7WBE2MGrd3vH4GizUUHJ8U4/aMdBL1eXO1CIzU+Iq+JqfIDRuk4UV81lDlzySrPj/swGKKvB2KGJv5BmM6qJyTaY4QjMbivG1JMWLV1KkB4IEDSNtkQqQsEm/OBCMT18zDHrLbIuBdzDn0L5cud1+ccJKV820OaHSUGnBkyDKf6/h/AlXle6NvM0c4c16+Q8g2UywJ2g7k6JNR8K6mcbR/bp21vHoLLdmknOY7qOhgqIi7Um+3fm02AictrQ5W+SrAuTHFEXx/5L1Kqd44HTXttyDB91uCrwMSrKn3M/96uMHTZfhU47r1ulNjwtHjw8oYwei1EH7z0JRtRmDmg9BC8PhOKD5kZ6gOfT1MOh9336X25NdTYIG+tQv2/0clAiDyHhnJOSeQ4WiVt2RtahJae6s+x/waNEydYrjiDg8LB5/WSOHPorlmZEf+88UWjd+F/ZcytAgxjvaVdA+wOhi8EQg+hip/+2E=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(39860400002)(376002)(366004)(396003)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(8936002)(66476007)(66556008)(66446008)(6636002)(66946007)(64756008)(8676002)(91956017)(76116006)(110136005)(66574015)(83380400001)(316002)(478600001)(6506007)(6486002)(71200400001)(966005)(2616005)(26005)(6512007)(5660300002)(4001150100001)(2906002)(41300700001)(36756003)(38070700009)(82960400001)(38100700002)(122000001)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RkY5L3hsa3lpZWk3eUtxTDR5Ym41djBPV0NGcXd5bnlsRHRVVURORzhXWkZR?=
 =?utf-8?B?ZTYrT0xnekNjc2pSVS8zVC9IQUVzUnB0Rk5zL1g4YnhwZHRxNVFHNk1wL0xy?=
 =?utf-8?B?S014KzU3VDlnemRxTmsvOEYrWUlKemtnUzdhdVdCQmJvNkZPZVFGVzZWSzda?=
 =?utf-8?B?U0xWTC9vZWx1RThLTlVJWWhKU052WGxseUhYTUkwWUpKSDNLeUhnbVptRGFF?=
 =?utf-8?B?bmY1MUpKdGJ3bFoyc3dac1R4MzI0ZFJNVHVaUzlvdTVYNDgyMHRGd2V3dVpL?=
 =?utf-8?B?RnprbnVzQjkzb3ZweWNPdEpFeGZLZll3OStGQldmenFZMnVQL25Hc3JiNlVV?=
 =?utf-8?B?R1NMdGFRNXRrMXRDZkdiMllicGd1OGIyeGhFOGo0MEZQQTVkQTl4ZDlYTmND?=
 =?utf-8?B?eTdxbEwveEUxOEF5cS9Fb001UkwvQ3lWZG10aWM5RUFIdmd2bDdMZkUxNU5G?=
 =?utf-8?B?M0dOOVZsSlErTFNlT2FUajd3QVVIMU5PRDR5dzI4YzNpUkNHYk1ncks1enJj?=
 =?utf-8?B?Z042UzNaOHNXRFR4TXoyUGpBeVcxNmdjQlpleGxDTDlXaEdjUG1ZL29nd0c5?=
 =?utf-8?B?WmE2c1U2emQrTXdxaGZBSUovWU1TWm9welJJZThwQWNUOHZRc0t6a20wQTNN?=
 =?utf-8?B?Q0NXcmRhL1NoM3FtckhkWVBJc04xTkVWUTdrNDBpU2lnN3Jzd2hDWnh3bnQv?=
 =?utf-8?B?OSthRTBiTXdNK3lVbVE2VHFDeUxPMkovOXdyTG4zOUFpZzRRQU9pQXJEV2dL?=
 =?utf-8?B?bkJzWCtKcjVUTDVhZU5EQlZldWdFb3pQT3RmRUdva2xYSWxLbnFoaHl6MEFD?=
 =?utf-8?B?aktReDc5eGJwakUzSWJreXo0WkFaVGdjclBhanN1UlhyTmYzSTFaRGF6VG1z?=
 =?utf-8?B?bWxVRDAxRi9LUGdQL3RzN3hIV2FiRVpmQVZkM3dQOVUyRmdKOXpaWGxEY3dT?=
 =?utf-8?B?OW44TWJPSDNrcjZLd0diM1FpcktUOEVXTEdZbjFleWliZ2VVd292NGVSY2xL?=
 =?utf-8?B?T0tCWnZhaXlrZXJvSk9MSmQvYXNLYnpmY2pTNFpFbCtFVHNMZWhRMXIxVzdL?=
 =?utf-8?B?UGlnZE5NQzlBMTV0akVXMml2OHRFRUxlc2ZJaUI5Rk1BdnNMRjNRRG96L3VS?=
 =?utf-8?B?cWpmZGsrWGl4Nzl2elVLTFZvL2R0RGVoODgvcEFJdkVaSnl2K2I1WDRiQVBs?=
 =?utf-8?B?VVlMUDY1dCt5TGd0TVRvTXlpdFc5UWwwOThqR2hmL2lTRWpINUtmVnh1VXpP?=
 =?utf-8?B?VmlqTVNPRzM1K0hRVTUvUXdWQ2NGSHRqdDV6dkhrei9TdmZxTkMyR2phTER0?=
 =?utf-8?B?YkVObzVYNitMa0VpWUFCZ3VVRVhMWTBsMXJjK1JmaitHbE9TaVNCb2hhVDEz?=
 =?utf-8?B?cFZYUE9pZ21tclEvWXpISFJJYlhSY1JHVWg4MUlOdUJMc25CbkVxWThyOHk0?=
 =?utf-8?B?bElIQm5qaTh5MDY3Z0lJMUFmWnN6Wm10NWdjYWVNNzhLWE9MdlRwUzFRMTYy?=
 =?utf-8?B?dWFQSXMvbzhhcjVQRjEzNGFFZWlMQlpoN0E3OGxvZ2xhTytoeHlyMTZSSk5V?=
 =?utf-8?B?eWlsQzROcFpuRldQNGZpNDRHK2VrSVJrbnFtUkR5eVBZWG9jWUp0SUFKTzc3?=
 =?utf-8?B?L2dmSXZWZkJlRU1oeCsrT3piSTgyU3hQQVQydHNPcXMyZXlKSCtwQVFZY0xy?=
 =?utf-8?B?UTFzNnZZOHpnbjVOeXlkVXY1MnR6ZWJ5OUZJdzlmNW16aU4xVjBBTjVoaHJi?=
 =?utf-8?B?SWhoMksyaGRwVzJENkY1L0pPQ0o3S0RZY1RPVDB0d0VNTFVhZVFwT2dkQmY5?=
 =?utf-8?B?dkZPLzlydkhTaU5uZGhFemZ2ejlyejFVVkVPazZVT3BXSzYybHdPUzROTWFz?=
 =?utf-8?B?dHRzRkNSTlF2M2FvRGQwaE80S09sb0RXWllYb2Q2bXJtVnpRVWNYUDdHNmwz?=
 =?utf-8?B?amN4dXQzLzlZL1drTThCd1lrc0tmU2dSZmhXQ1l1VmxuNTNuTmd6TnhaS044?=
 =?utf-8?B?U0pzZllVS0MzYTcxUWdIN0hJWWxuM2FJbkpOZ2NNdlhTb2xuU3hTazZGNm4v?=
 =?utf-8?B?TmdhQzRzbDQ5Mm1yYWlwSUdTUjA5ZTFYWi91TThXYndTaHhYWXVxdjZ2UFMx?=
 =?utf-8?B?YXBhTy82VlF4bHRZb1VrVko0d2pnTWNjLzBwL2VDbDR6YzhqVksvWExxa3V4?=
 =?utf-8?B?WXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A204CA6B9A6C0641AA70FFF9394FF732@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 342e5fc3-328a-4851-0b72-08dbfcc07f3d
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2023 16:19:50.1288 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IcfVLqQfVXJboAkopiOW3RtDxWWOyGgyrXu1Tw1U9vkrN8OZic2cDe1675ID0hXUiGQz316pm68Vz/Ud3nP1uQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4902
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

T24gV2VkLCAyMDIzLTEyLTEzIGF0IDE3OjQ3ICswMDAwLCBNYXR0aGV3IEF1bGQgd3JvdGU6DQo+
IFdlIGN1cnJlbnRseSBhc3N1bWUgdGhhdCB3ZSBjYW4gdXBmcm9udCBrbm93IGV4YWN0bHkgaG93
IG1hbnkgZmVuY2UNCj4gc2xvdHMgd2Ugd2lsbCBuZWVkIGF0IHRoZSBzdGFydCBvZiB0aGUgZXhl
YywgaG93ZXZlciB0aGUgVFRNIGJvX3ZhbGlkYXRlDQo+IGNhbiBpdHNlbGYgY29uc3VtZSBudW1l
cm91cyBmZW5jZSBzbG90cywgYW5kIGR1ZSB0byBob3cgdGhlDQo+IGRtYV9yZXN2X3Jlc2VydmVf
ZmVuY2VzKCkgd29ya3MgaXQgb25seSBlbnN1cmVzIHRoYXQgYXQgbGVhc3QgdGhhdCBtYW55DQo+
IGZlbmNlIHNsb3RzIGFyZSBhdmFpbGFibGUuIFdpdGggdGhpcyBpdCBpcyBxdWl0ZSBwb3NzaWJs
ZSB0aGF0IFRUTQ0KPiBzdGVhbHMgc29tZSBvZiB0aGUgZmVuY2Ugc2xvdHMgYW5kIHRoZW4gd2hl
biBpdCBjb21lcyB0aW1lIHRvIGRvIHRoZSB2bWENCj4gYmluZGluZyBhbmQgZmluYWwgZXhlYyBz
dGFnZSB3ZSBhcmUgbGFja2luZyBlbm91Z2ggZmVuY2Ugc2xvdHMsIGxlYWRpbmcNCj4gdG8gc29t
ZSBuYXN0eSBCVUdfT04oKS4gQSBzaW1wbGUgZml4IGlzIHRvIHJlc2VydmUgb3VyIG93biBmZW5j
ZXMgbGF0ZXIsDQo+IGFmdGVyIHRoZSB2YWxpZGF0ZSBzdGFnZS4NCj4gDQo+IFJlZmVyZW5jZXM6
IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0veGUva2VybmVsLy0vaXNzdWVzLzY5
OA0KDQpUZXN0ZWQtYnk6IEpvc8OpIFJvYmVydG8gZGUgU291emEgPGpvc2Uuc291emFAaW50ZWwu
Y29tPg0KDQo+IFNpZ25lZC1vZmYtYnk6IE1hdHRoZXcgQXVsZCA8bWF0dGhldy5hdWxkQGludGVs
LmNvbT4NCj4gQ2M6IFRob21hcyBIZWxsc3Ryw7ZtIDx0aG9tYXMuaGVsbHN0cm9tQGxpbnV4Lmlu
dGVsLmNvbT4NCj4gQ2M6IE1hdHRoZXcgQnJvc3QgPG1hdHRoZXcuYnJvc3RAaW50ZWwuY29tPg0K
PiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9leGVjLmMgfCA0MCArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAzOCBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9leGVjLmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZXhlYy5jDQo+IGluZGV4IGJhOTJl
NTYxOWRhMy4uNjNlODJlNTI4NWJjIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfZXhlYy5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9leGVjLmMNCj4gQEAgLTk2
LDcgKzk2LDQ0IEBADQo+ICANCj4gIHN0YXRpYyBpbnQgeGVfZXhlY19mbihzdHJ1Y3QgZHJtX2dw
dXZtX2V4ZWMgKnZtX2V4ZWMpDQo+ICB7DQo+IC0JcmV0dXJuIGRybV9ncHV2bV92YWxpZGF0ZSh2
bV9leGVjLT52bSwgJnZtX2V4ZWMtPmV4ZWMpOw0KPiArCXN0cnVjdCB4ZV92bSAqdm0gPSBjb250
YWluZXJfb2Yodm1fZXhlYy0+dm0sIHN0cnVjdCB4ZV92bSwgZ3B1dm0pOw0KPiArCXN0cnVjdCBk
cm1fZ2VtX29iamVjdCAqb2JqOw0KPiArCXVuc2lnbmVkIGxvbmcgaW5kZXg7DQo+ICsJaW50IG51
bV9mZW5jZXM7DQo+ICsJaW50IHJldDsNCj4gKw0KPiArCXJldCA9IGRybV9ncHV2bV92YWxpZGF0
ZSh2bV9leGVjLT52bSwgJnZtX2V4ZWMtPmV4ZWMpOw0KPiArCWlmIChyZXQpDQo+ICsJCXJldHVy
biByZXQ7DQo+ICsNCj4gKwkvKg0KPiArCSAqIDEgZmVuY2Ugc2xvdCBmb3IgdGhlIGZpbmFsIHN1
Ym1pdCwgYW5kIG9uZSBtb3JlIGZvciBldmVyeSBwZXItdGlsZQ0KPiArCSAqIGJpbmQuIE5vdGUg
dGhhdCB0aGVyZSBhcmUgcG90ZW50aWFsbHkgbWFueSB2bWEgcGVyIG9iamVjdC9kbWEtcmVzdiwN
Cj4gKwkgKiBob3dldmVyIHRoZSBmZW5jZSBzbG90IHdpbGwganVzdCBiZSByZS11c2VkLCBzaW5j
ZSB0aGV5IGFyZSBsYXJnZWx5DQo+ICsJICogdGhlIHNhbWUgdGltZWxpbmUgYW5kIHRoZSBzZXFu
byBzaG91bGQgYmUgaW4gb3JkZXIuDQo+ICsJICovDQo+ICsJbnVtX2ZlbmNlcyA9IDEgKyB2bS0+
eGUtPmluZm8udGlsZV9jb3VudDsNCj4gKw0KPiArCS8qDQo+ICsJICogV2UgZG9uJ3Qga25vdyB1
cGZyb250IGV4YWN0bHkgaG93IG1hbnkgZmVuY2Ugc2xvdHMgd2Ugd2lsbCBuZWVkIGF0DQo+ICsJ
ICogdGhlIHN0YXJ0IG9mIHRoZSBleGVjLCBzaW5jZSB0aGUgVFRNIGJvX3ZhbGlkYXRlIGFib3Zl
IGNhbiBjb25zdW1lDQo+ICsJICogbnVtZXJvdXMgZmVuY2Ugc2xvdHMuIEFsc28gZHVlIHRvIGhv
dyB0aGUgZG1hX3Jlc3ZfcmVzZXJ2ZV9mZW5jZXMoKQ0KPiArCSAqIHdvcmtzIGl0IG9ubHkgZW5z
dXJlcyB0aGF0IGF0IGxlYXN0IHRoYXQgbWFueSBmZW5jZSBzbG90cyBhcmUNCj4gKwkgKiBhdmFp
bGFibGUgaS5lIGlmIHRoZXJlIGFyZSBhbHJlYWR5IDEwIHNsb3RzIGF2YWlsYWJsZSBhbmQgd2Ug
cmVzZXJ2ZQ0KPiArCSAqIHR3byBtb3JlLCBpdCBjYW4ganVzdCBub29wIHdpdGhvdXQgcmVzZXJ2
aW5nIGFueXRoaW5nLiAgV2l0aCB0aGlzIGl0DQo+ICsJICogaXMgcXVpdGUgcG9zc2libGUgdGhh
dCBUVE0gc3RlYWxzIHNvbWUgb2YgdGhlIGZlbmNlIHNsb3RzIGFuZCB0aGVuDQo+ICsJICogd2hl
biBpdCBjb21lcyB0aW1lIHRvIGRvIHRoZSB2bWEgYmluZGluZyBhbmQgZmluYWwgZXhlYyBzdGFn
ZSB3ZSBhcmUNCj4gKwkgKiBsYWNraW5nIGVub3VnaCBmZW5jZSBzbG90cywgbGVhZGluZyB0byBz
b21lIG5hc3R5IEJVR19PTigpIHdoZW4NCj4gKwkgKiBhZGRpbmcgdGhlIGZlbmNlcy4gSGVuY2Ug
anVzdCBhZGQgb3VyIG93biBmZW5jZXMgaGVyZSwgYWZ0ZXIgdGhlDQo+ICsJICogdmFsaWRhdGUg
c3RhZ2UuDQo+ICsJICovDQo+ICsJZHJtX2V4ZWNfZm9yX2VhY2hfbG9ja2VkX29iamVjdCgmdm1f
ZXhlYy0+ZXhlYywgaW5kZXgsIG9iaikgew0KPiArCQlyZXQgPSBkbWFfcmVzdl9yZXNlcnZlX2Zl
bmNlcyhvYmotPnJlc3YsIG51bV9mZW5jZXMpOw0KPiArCQlpZiAocmV0KQ0KPiArCQkJcmV0dXJu
IHJldDsNCj4gKwl9DQo+ICsNCj4gKwlyZXR1cm4gMDsNCj4gIH0NCj4gIA0KPiAgaW50IHhlX2V4
ZWNfaW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwgc3RydWN0IGRybV9m
aWxlICpmaWxlKQ0KPiBAQCAtMTg5LDcgKzIyNiw2IEBAIGludCB4ZV9leGVjX2lvY3RsKHN0cnVj
dCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsIHN0cnVjdCBkcm1fZmlsZSAqZmlsZSkNCj4g
IAl9DQo+ICANCj4gIAl2bV9leGVjLnZtID0gJnZtLT5ncHV2bTsNCj4gLQl2bV9leGVjLm51bV9m
ZW5jZXMgPSAxICsgdm0tPnhlLT5pbmZvLnRpbGVfY291bnQ7DQo+ICAJdm1fZXhlYy5mbGFncyA9
IERSTV9FWEVDX0lOVEVSUlVQVElCTEVfV0FJVDsNCj4gIAlpZiAoeGVfdm1faW5fbHJfbW9kZSh2
bSkpIHsNCj4gIAkJZHJtX2V4ZWNfaW5pdChleGVjLCB2bV9leGVjLmZsYWdzKTsNCg0K
