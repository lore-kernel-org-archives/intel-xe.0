Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17C97C77B7A
	for <intel-xe@archiver.kernel.org>; Thu, 18 May 2023 18:44:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAA6B10E53E;
	Thu, 18 May 2023 18:44:38 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C17410E53E
 for <intel-xe@lists.freedesktop.org>; Thu, 18 May 2023 18:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684435475; x=1715971475;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=awd80CYJa+Hl9pxDuXDUws+3E+uF80rrvQRkFr9zYHE=;
 b=IQTaKGQnktSWe8pQ+a6EztZJ6/vigMeLc9QR2ZHCKp4Gkhp3A+o8hs2e
 whOzzeLZYyjYVSzXeKL1XPJWbA9+A1a6hdqGT08qilbm0pgQ67/iyLKz7
 wyyX18jz5M/ar87DC8tBvKGstAAE20ff6cY9khvQNpSDmYMNjNoUjQd1R
 ODBkqLU8r5PQXDCSXd/b4/DWyPR04A4CmXXGFqjposdF5sR+yR+2arTFq
 /PwB8wrhHMpa0rhYN6MTT3Vt1P5sUhm/qglJSVr5YW5AxkTY6dzLQMrr0
 WqOVl9iMHkPnay+mIt2PZ8tpJuABEPnppNOOItYlUrWhwFbs7ddt8ogwa Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="354502587"
X-IronPort-AV: E=Sophos;i="6.00,174,1681196400"; d="scan'208";a="354502587"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 11:44:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="792074030"
X-IronPort-AV: E=Sophos;i="6.00,174,1681196400"; d="scan'208";a="792074030"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by FMSMGA003.fm.intel.com with ESMTP; 18 May 2023 11:44:33 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 18 May 2023 11:44:33 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 18 May 2023 11:44:33 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 18 May 2023 11:44:33 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 18 May 2023 11:44:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gkpWeCuEYbstcaiMSmTJZq9fqhZQ8sFWh2YriWNsQfR2OX4ctsi+7PHgcqiYkFgcv9jJxo0y1Eb1sJ1JIayZTQXwnNAi7QH6hDSc7XuH35S8nNjcrpsb2rnBrAL6mtk5uX5dmKW6knn2l3A/LiDB1gN4EG2Xwma1auHvWI8zZcqphowUDmm9JXlEqvLYd43vIYQtWI+ASvhgQpI54Zb2oZazW6Og02KkI6lTOHSgobhFxsbXV9lWzORO2oLIQc7JB9t70sHfFOQfkaKY6afXcegCdhy5eMVP0Je2AFUhKYygOduUW/clZh+rzN7cLTHPbU8OO72Io/DRZYHIhLdZ/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=awd80CYJa+Hl9pxDuXDUws+3E+uF80rrvQRkFr9zYHE=;
 b=ki9yxb45+U02p9yQFlVrh940zrhgvFQ5oRAOUvbu8ukiHYfGCGzf6I6uorXjke+u/cMUYHYIfZJyG010RKObcpPtySclM1FbTgT6GLzuJQZd8dTbAcsNdEdoK28pLXqYh3Krd/haH/yFCQ+rCz6hzqGXlZbwIN9CJXarG5F/kZtNS2bcQpPhpTf26jJOqigns4naU2obvX48sqFyE8U0HiPMLENnSOm97AKK8F+YIeDgGFcJjDCGHrr/74mlSDNVLfJlnglrcJK8pVzQPDfgn1vRBcBe0coknlZ//JR47/SuV0fnuWMjPHHtU7aCZBS7y3XV6FIhON7wzKO0WXxRgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by CY5PR11MB6114.namprd11.prod.outlook.com (2603:10b6:930:2d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19; Thu, 18 May
 2023 18:44:26 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::3fa1:b97c:a5bb:651]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::3fa1:b97c:a5bb:651%3]) with mapi id 15.20.6387.033; Thu, 18 May 2023
 18:44:25 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "rodrigo.vivi@kernel.org" <rodrigo.vivi@kernel.org>
Thread-Topic: [Intel-xe] [PATCH] drm/xe: Allow scanout of bos that can be
 migrated to lmem
Thread-Index: AQHZiNzED6hcj/cKM0GDaWsddJekJ69gSIEAgAACIYCAAAdugIAADbqA
Date: Thu, 18 May 2023 18:44:25 +0000
Message-ID: <6f62bbc8bb94d3b4b4e9f99493c40e5e1f0a9b9c.camel@intel.com>
References: <20230517162918.59058-1-jose.souza@intel.com>
 <ZGZefKnOnVm9rHfY@rdvivi-mobl4>
 <f4a7e0ec905b4e7b74afb9fb7d0588f2bcd37400.camel@intel.com>
 <ZGZmgV9AgVnKN9D3@rdvivi-mobl4>
In-Reply-To: <ZGZmgV9AgVnKN9D3@rdvivi-mobl4>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|CY5PR11MB6114:EE_
x-ms-office365-filtering-correlation-id: cf905c7c-00f0-421a-0f3e-08db57cfe772
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rqeEATFuUAiVNuX1FGssziAMYjTH/U6MB9ccfW1fpqIBONZBfxSNYYpPM4uhsWQWh8Avzsxa7CF9Q//UTc6QFS6nur8rl/ooZQD8ZyanljQZkbbumxLQcDRsmTsT/cZu8YyBte09WmGqFbjndJVGAXyKBza4XA5ztm0nhXH7WzyH0ytIwHHGsumjchO4lIw4FwjpojrYhJcUFrGpL52JGpBOTeQ0Oq90JZ83irZZwVOG07tMxFCCYleCMWoK39zN0B7bjfpOX+HSiKYmx+wYGQVPioEpRaE2l8g2pQh8IwwCZY7YJUbMcv+UddWEbDblN0q0XT9T9fY3c2cyLSZbDT9GvLLLyHOTLuoRXX/H/dheGR5aVOhodjPz7WEyAFyFlY0mXozxhEt+H3TMPyF8Nq0007iUKmSmaMg7pl3Oc51EZgrITCUq8iXEk7Rolv5tmlZUGf2FV8yKgBWVBjTnfoscv/qN07Zz/XGet/bXnPUlzcpqsKpRR/JLbM7E5O6a2bCb5k3EbNaPYW4vkQI5Rc1DPBFJte6w/NXyC78yPZ/RHIo3dt/K+m4Js4FwrA5hOLOLARvCoInegbrN86QE1tXp9eU5AMpeV+GokCahDGuIhaDJdkjReFfmRWrlWGUJ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(366004)(39860400002)(346002)(136003)(376002)(451199021)(2906002)(316002)(478600001)(41300700001)(6916009)(4326008)(8676002)(8936002)(6486002)(54906003)(5660300002)(71200400001)(66446008)(66556008)(66946007)(76116006)(64756008)(66476007)(91956017)(6506007)(6512007)(26005)(107886003)(82960400001)(38100700002)(186003)(122000001)(83380400001)(36756003)(38070700005)(2616005)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c1NBdHJGaUsyR2tKUzgvMEVaSnl6dGJ6Ty8raS9NcERFQ0ZERXUxL2NZZWVT?=
 =?utf-8?B?bURNaWZScFRzYVJVUXNoVnhkdHVpKzVLejQrV2cyTnRLbHBKL3hjcHBBVldr?=
 =?utf-8?B?MXJ3SVExeCswb2tMTTdPb3hYOWF5WGM1MjRKOTFpUWR5dnZqZFc5ZzZRdnpM?=
 =?utf-8?B?eTQvTWlzYXdOQTBiS29WQ0Zld1Q0TmNxWnFjcnRING1jcXhENkpLdmV2WkRB?=
 =?utf-8?B?SHkrQzdUNmVtb1p5RE1OTFNSN1BCU0cvckozeWNieVhGRmMvbzh1cUlrZ2F5?=
 =?utf-8?B?aWlQQnpMV1ZmL0pINE9hUjZTWDllWHpNOFE5K094a2c3TFVWZFFwMUo5dzNa?=
 =?utf-8?B?cjhwSTdzRTNlYTFCSTM0LzhVd3dmQkk5MVplanJnaDUwWk9JdFh6aW9IVjV3?=
 =?utf-8?B?ZmVJQUtkUm9QWDlnSVlicUFON0t0SVFoRm96bEtPcm5uNFBwMWt4cmlFN0Jn?=
 =?utf-8?B?Y0NEamszODkycjF0VGFJdmRJQlY4SWhsM245NDhLdjdjWWIza1U3OWRvaXdL?=
 =?utf-8?B?cTZBSG5hcDVLNXQ0YjBybTQrcFF3ZHZkVFE0MWhzT1J6MCtsUDNCZ1VJV2s0?=
 =?utf-8?B?Z24xVXIrYmtteVhWZzBnZlVrZWFZaFhvc3pWeE5kUTdiUFhBY0dWK1B4TTNl?=
 =?utf-8?B?TVJkNTNCZGxXMkNsSHNSVERwQndKK1A4OE95eVhGeEZpd01ucHdCVWl5dXRa?=
 =?utf-8?B?MEc5YWx0RFZ6TEZ5dm5HNXlHQVNzNjN1dENZc0orU1dXY2NENENnY2puZkJu?=
 =?utf-8?B?dlgrZXFZM01uZ21INm0vR0R6MjdIOG5ramszUmxoTUdhVzQ1ZzgySW1vQkQ2?=
 =?utf-8?B?R1Izbk53NGVVVDE4UmNsRjdRNWNscC9rc3dXVDQzbzczTWlmKzd3YitPYm96?=
 =?utf-8?B?Z1lnMEd5bkZQWWQ4UHlrUzdteTlQTk1tZDJsZjdrSlIxbmU5WFBjSHlMWTFp?=
 =?utf-8?B?TWlvdEY5WDBXYU1mOS9IQlpMSWl2N1R1RHpqUC9wbmZ1cVNZcmcxdDdqbWFl?=
 =?utf-8?B?NmVuaS96QVRwVTZRRW5URm9pOE55QS9JT1NNSEQ0KzhieG5CQWJ5amhJTzU2?=
 =?utf-8?B?QmhHK2VXKzBiTGdkaFR4MktmT3BTUFpVck56aFJob1JaWFlFOHphZnQzMnYv?=
 =?utf-8?B?d2J2RnBBMGlZanZYalhMUmVlcFFsMzhkKzhQcFdPdk9IajY3ZHpQWVBHNnMy?=
 =?utf-8?B?MEoxZmwvQjAyaTZZRVNkRFlkMTlZZXZVUzZHNUo3aWZQR3o5bWdCM3NKdTRE?=
 =?utf-8?B?UUFZRTFSN1JkbVdNbDc3b3NBVFgvOTY3bkpKbTdUYXk4L1BuRStLdlVPell3?=
 =?utf-8?B?VFlDYlA1TlpBdERvNzJqU3Y5VzM0bzg5MXpYaVdmamVkZWRtTE9vZUwvbGlm?=
 =?utf-8?B?UlRPeWFyUWNnZHZHbDhMd21kN0dqaHhGTkp3TXlWelhpb0tSNnJWL1g5Ynhm?=
 =?utf-8?B?c2hoaXpmT0VOQXFYK0wwQkpnbGFmZ25wLzEyTlU5c1BOK05IL1dBMmFBQ2tz?=
 =?utf-8?B?M0R6MU1XQmNLNlUraytXUWlEL0ZHL2pIRFc4Y3RpRk10VndyV2N3d2RKajhU?=
 =?utf-8?B?eDJUSWZQazA3Wi9Gb3dGa1RtUHFJdGJFYkptdFlmamtzTHd2aVdVdDNTb0Rj?=
 =?utf-8?B?OUVDVDloVEV3L2hrc2dORldqZzdtRTRkM0ZGSUtFMldHMjlWbjIrN01SWU5i?=
 =?utf-8?B?Y1RKWG9pM2pXdkhnK3lJRVNKMUw5b1ZmNm1jckxsNnQwUlRRM3pNTUE5cm9l?=
 =?utf-8?B?SGxpSldhRGw5V054eVRmSHU0N1JmdUJZWWNRcU90dTFISU1wU2JtVHhTd2FS?=
 =?utf-8?B?NUJhNVBtV2g1bmFObThkdzExckpmVnB6SEl0eEpYV3gvMHN1aW1xWGtrUStO?=
 =?utf-8?B?ZjlQc0lpek5neDhnclNydUlJTkpwTkN3VkZaMENZNE1ONDlENnNwWkJyYStW?=
 =?utf-8?B?ZVc5OFd1WlZpQzREVXk0azBlYkZSeXdtSkNCUGVVb1hOUXpQY0ZOd1h6NnNP?=
 =?utf-8?B?dU1PL3Raa2FyU1hHNVcxQ0pZZGhpOUpSeFRNK0lyTm95a2hhejh0R0xlblZJ?=
 =?utf-8?B?YkJaMTZqMTQ3TklGVmVGVDJsR0RrbXhNWkJqYXl1S3pLWWJoNndhMjJEUU9G?=
 =?utf-8?Q?2Sv6TNpZazL+XkGnovbYlkDSB?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7B7FBE38F925444C93F0D1D55F3AEA9C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf905c7c-00f0-421a-0f3e-08db57cfe772
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2023 18:44:25.5357 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Xi3eylh8HwenjD6bV7lWh/OKi+G5o4lQCZVlzulUvBcWfHrhVnQ1eEvl/6hNuO7nfRCUK+JvdCF3zklysoowVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6114
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Allow scanout of bos that can be
 migrated to lmem
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Auld, 
 Matthew" <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIzLTA1LTE4IGF0IDEzOjU1IC0wNDAwLCBSb2RyaWdvIFZpdmkgd3JvdGU6DQo+
IE9uIFRodSwgTWF5IDE4LCAyMDIzIGF0IDA1OjI4OjQzUE0gKzAwMDAsIFNvdXphLCBKb3NlIHdy
b3RlOg0KPiA+IE9uIFRodSwgMjAyMy0wNS0xOCBhdCAxMzoyMSAtMDQwMCwgUm9kcmlnbyBWaXZp
IHdyb3RlOg0KPiA+ID4gT24gV2VkLCBNYXkgMTcsIDIwMjMgYXQgMDk6Mjk6MThBTSAtMDcwMCwg
Sm9zw6kgUm9iZXJ0byBkZSBTb3V6YSB3cm90ZToNCj4gPiA+IA0KPiA+ID4gVGhlIHBhdGNoIGl0
c2VsZiBsb29rcyBnb29kLCBidXQgSSBiZWxpZXZlIHRoYXQgSSBtaWdodCBiZSBjb25mdXNlZA0K
PiA+ID4gYnkgdGhlIGNvbW1pdCBtZXNzYWdlLiBzbyBhIGZldyBxdWVzdGlvbnMgaGVyZToNCj4g
PiA+IA0KPiA+ID4gPiBPcGVuR0wgc3RhY2sgbWFrZXMgc2Nhbm91dCBidWZmZXJzIGV4cG9ydGVk
IGFzIHdlbGwgYmVjYXVzZSB1c3VhbGx5DQo+ID4gPiA+IGl0IHdpbGwgYmUgZXhwb3J0ZWQgZnJv
bSBjbGllbnQgYXBwbGljYXRpb24gdG8gY29tcG9zaXRvci4NCj4gPiA+ID4gDQo+ID4gPiA+IEV4
cG9ydGVkIGJ1ZmZlcnMgbmVlZHMgdG8gYmUgcGxhY2VkIGluIFNNRU0gc28gaXQgY2FuIGJlIGFj
Y2Vzc2VkDQo+ID4gPiA+IGJ5IGRpZmZlcmVudCBHUFVzIGlmIG5lZWRlZCwNCj4gPiA+IA0KPiA+
ID4gc28sIGlmIGl0IG5lZWRzIFNNRU0sIHdoeSBhcmUgeW91IG1pZ3JhdGluZyB0byBMTUVNPw0K
PiA+IA0KPiA+IERpc3BsYXkgY2FuIG9ubHkgc2Nhbm91dCBmcm9tIGxtZW0gb3IgcHJpbWUgaW1w
b3J0ZWQgYnVmZmVycy4NCj4gPiANCj4gPiA+IA0KPiA+ID4gPiBzbyBpbiBkaXNjcmV0ZSBHUFVz
IGl0IGlzIHBsYWNlZCBpbg0KPiA+ID4gPiBTTUVNK0xNRU0uDQo+ID4gPiANCj4gPiA+IEkgc2Vl
IHRoZSBjb2RlIG1pZ3JhdGluZyB0byBMTUVNLCBidXQgbm90IG1pZ3JhdGluZyBMTUVNIHRvIFNN
RU0sDQo+ID4gPiB3aGF0IGFtIEkgbWlzc2luZz8NCj4gPiANCj4gPiBEb24ndCBrbm93IHRoaXMg
b25lIGJ1dCBwcm9iYWJseSB3aGVuIGFjY2Vzc2luZyB0aGUgcHJpbWUgYnVmZmVyIHNvbWV3aGVy
ZSBpbiBYZSBjb2RlIHRoZSBidWZmZXIgZGF0YSBpcyBtaWdyYXRlZCBmcm9tIGxtZW0gdG8gc21l
bS4NCj4gDQo+IEluZGVlZCwgYXQgeGVfZG1hX2J1Zl9waW4oKQ0KPiANCj4gPiANCj4gPiA+IA0K
PiA+ID4gPiANCj4gPiA+ID4gQnV0IHRoaXMgY29tYmluYXRpb24gaXMgY2F1c2luZyBhcGxpY2F0
aW9ucyBsaWtlIGttc2N1YmUgdG8gYmUgYWJsZQ0KPiA+ID4gPiB0byBjcmVhdGUgZnJhbWVidWZm
ZXJzLg0KPiA+ID4gDQo+ID4gPiB0byBiZSBhYmxlIG9yIHRvICpub3QqIGJlIGFibGU/IHdoYXQn
cyB0aGUgcmVhbCBjdXJyZW50IGlzc3VlPw0KPiA+IA0KPiA+IG9wcyB3aWxsIGFkZCB0aGUgbWlz
c2luZyAibm90IiwgaGVyZS4NCj4gPiBUaGUgcmVhbCBpc3N1ZSBpcyB0aGF0IHNvbWUgY29tcG9z
aXRvcnMgY2FuJ3QgY3JlYXRlIGZyYW1lYnVmZmVycyBzbyBpdCBmYWlscyB0byBpbml0aWFsaXpl
IGxlYXZpbmcgdXNlciBpbiBjbGkuDQo+IA0KPiB3aXRoIHRoZSBub3QsIGFscmVhZHkgYWRkDQo+
IA0KPiBSZXZpZXdlZC1ieTogUm9kcmlnbyBWaXZpIDxyb2RyaWdvLnZpdmlAaW50ZWwuY29tPg0K
DQp0aGFuayB5b3UNCg0KPiANCj4gDQo+ID4gDQo+ID4gPiANCj4gPiA+ID4gDQo+ID4gPiA+IFNv
IGhlcmUgZG9pbmcgdGhlIHNhbWUgaGFuZGxpbmcgYXMgaTkxNSBhbmQgYWxsb3dpbmcgYm9zIHRo
YXQgY2FuDQo+ID4gPiA+IG1pZ3JhdGUgdG8gbG1lbTAvdnJhbTAgdG8gYmUgcHJvbW90ZWQgdG8g
ZnJhbWVidWZmZXIuDQo+ID4gPiANCj4gPiA+IG9rYXksIHRoaXMgcGhyYXNlIGlzIHdoeSBJIGJl
bGlldmUgdGhlIGNvbW1pdCBpcyBkb2luZyB3aGF0IGl0IHNob3VsZCwNCj4gPiA+IGJ1dCB0aGUg
YWJvdmUgbWVzc2FnZXMgY29uZnVzZWQgbWUgYSBiaXQuLi4uDQo+ID4gPiANCj4gPiA+ID4gDQo+
ID4gPiA+IEF0IGxlYXN0IGFsbCBjdXJyZW50IGRpc2NyZXRlIEdQVXMgd2l0aCBkaXNwbGF5IG9u
bHkgaGF2ZSBvbmUgbG1lbQ0KPiA+ID4gPiByZWdpb24sIHNvIHdlIGRvbid0IG5lZWQgdG8gY2hl
Y2sgZm9yIHZyYW0xIGJ1dCB3ZSBtaWdodCBuZWVkIHRvDQo+ID4gPiA+IGV4dGVuZCBpdCBpbiBm
dXR1cmUuDQo+ID4gPiANCj4gPiA+IGFjayBvbiB0aGlzIHBhcnQuDQo+ID4gPiANCj4gPiA+ID4g
DQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEpvc8OpIFJvYmVydG8gZGUgU291emEgPGpvc2Uuc291
emFAaW50ZWwuY29tPg0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBNYXR0aGV3IEF1bGQgPG1hdHRo
ZXcuYXVsZEBpbnRlbC5jb20+DQo+ID4gPiA+IC0tLQ0KPiA+ID4gPiAgZHJpdmVycy9ncHUvZHJt
L2k5MTUvZGlzcGxheS9pbnRlbF9mYi5jIHwgNSArKystLQ0KPiA+ID4gPiAgZHJpdmVycy9ncHUv
ZHJtL3hlL2Rpc3BsYXkveGVfZmJfcGluLmMgIHwgNyArKysrKystDQo+ID4gPiA+ICAyIGZpbGVz
IGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4gPiA+ID4gDQo+ID4g
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2ZiLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2ZiLmMNCj4gPiA+ID4gaW5kZXgg
MDE1YWFjYmFkMWIxMS4uZmViOGEwZjVmYmRmNiAxMDA2NDQNCj4gPiA+ID4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9mYi5jDQo+ID4gPiA+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZmIuYw0KPiA+ID4gPiBAQCAtMjEyMSw4ICsyMTIx
LDkgQEAgaW50ZWxfdXNlcl9mcmFtZWJ1ZmZlcl9jcmVhdGUoc3RydWN0IGRybV9kZXZpY2UgKmRl
diwNCj4gPiA+ID4gIAkJcmV0dXJuIEVSUl9QVFIoLUVOT0VOVCk7DQo+ID4gPiA+ICANCj4gPiA+
ID4gIAlvYmogPSBnZW1fdG9feGVfYm8oZ2VtKTsNCj4gPiA+ID4gLQkvKiBSZXF1aXJlIHZyYW0g
ZXhjbHVzaXZlIG9iamVjdHMsIGJ1dCBhbGxvdyBkbWEtYnVmIGltcG9ydHMgKi8NCj4gPiA+ID4g
LQlpZiAoSVNfREdGWChpOTE1KSAmJiBvYmotPmZsYWdzICYgWEVfQk9fQ1JFQVRFX1NZU1RFTV9C
SVQgJiYNCj4gPiA+ID4gKwkvKiBSZXF1aXJlIHZyYW0gcGxhY2VtZW50IG9yIGRtYS1idWYgaW1w
b3J0ICovDQo+ID4gPiA+ICsJaWYgKElTX0RHRlgoaTkxNSkgJiYNCj4gPiA+ID4gKwkgICAgIXhl
X2JvX2Nhbl9taWdyYXRlKGdlbV90b194ZV9ibyhnZW0pLCBYRV9QTF9WUkFNMCkgJiYNCj4gPiA+
ID4gIAkgICAgb2JqLT50dG0udHlwZSAhPSB0dG1fYm9fdHlwZV9zZykgew0KPiA+ID4gPiAgCQlk
cm1fZ2VtX29iamVjdF9wdXQoZ2VtKTsNCj4gPiA+ID4gIAkJcmV0dXJuIEVSUl9QVFIoLUVSRU1P
VEUpOw0KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL2Rpc3BsYXkveGVf
ZmJfcGluLmMgYi9kcml2ZXJzL2dwdS9kcm0veGUvZGlzcGxheS94ZV9mYl9waW4uYw0KPiA+ID4g
PiBpbmRleCBlZDY5MWQyOGIzNGQ3Li5jN2M0ZGYxOGU0MzliIDEwMDY0NA0KPiA+ID4gPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0veGUvZGlzcGxheS94ZV9mYl9waW4uYw0KPiA+ID4gPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0veGUvZGlzcGxheS94ZV9mYl9waW4uYw0KPiA+ID4gPiBAQCAtMTgzLDYg
KzE4Myw4IEBAIHN0YXRpYyBpbnQgX194ZV9waW5fZmJfdm1hX2dndHQoc3RydWN0IGludGVsX2Zy
YW1lYnVmZmVyICpmYiwNCj4gPiA+ID4gIHN0YXRpYyBzdHJ1Y3QgaTkxNV92bWEgKl9feGVfcGlu
X2ZiX3ZtYShzdHJ1Y3QgaW50ZWxfZnJhbWVidWZmZXIgKmZiLA0KPiA+ID4gPiAgCQkJCQljb25z
dCBzdHJ1Y3QgaTkxNV9ndHRfdmlldyAqdmlldykNCj4gPiA+ID4gIHsNCj4gPiA+ID4gKwlzdHJ1
Y3QgZHJtX2RldmljZSAqZGV2ID0gZmItPmJhc2UuZGV2Ow0KPiA+ID4gPiArCXN0cnVjdCB4ZV9k
ZXZpY2UgKnhlID0gdG9feGVfZGV2aWNlKGRldik7DQo+ID4gPiA+ICAJc3RydWN0IGk5MTVfdm1h
ICp2bWEgPSBremFsbG9jKHNpemVvZigqdm1hKSwgR0ZQX0tFUk5FTCk7DQo+ID4gPiA+ICAJc3Ry
dWN0IHhlX2JvICpibyA9IGludGVsX2ZiX29iaigmZmItPmJhc2UpOw0KPiA+ID4gPiAgCWludCBy
ZXQ7DQo+ID4gPiA+IEBAIC0yMDQsNyArMjA2LDEwIEBAIHN0YXRpYyBzdHJ1Y3QgaTkxNV92bWEg
Kl9feGVfcGluX2ZiX3ZtYShzdHJ1Y3QgaW50ZWxfZnJhbWVidWZmZXIgKmZiLA0KPiA+ID4gPiAg
CWlmIChyZXQpDQo+ID4gPiA+ICAJCWdvdG8gZXJyOw0KPiA+ID4gPiAgDQo+ID4gPiA+IC0JcmV0
ID0geGVfYm9fdmFsaWRhdGUoYm8sIE5VTEwsIHRydWUpOw0KPiA+ID4gPiArCWlmIChJU19ER0ZY
KHhlKSkNCj4gPiA+ID4gKwkJcmV0ID0geGVfYm9fbWlncmF0ZShibywgWEVfUExfVlJBTTApOw0K
PiA+ID4gPiArCWVsc2UNCj4gPiA+ID4gKwkJcmV0ID0geGVfYm9fdmFsaWRhdGUoYm8sIE5VTEws
IHRydWUpOw0KPiA+ID4gPiAgCWlmICghcmV0KQ0KPiA+ID4gPiAgCQl0dG1fYm9fcGluKCZiby0+
dHRtKTsNCj4gPiA+ID4gIAl0dG1fYm9fdW5yZXNlcnZlKCZiby0+dHRtKTsNCj4gPiA+ID4gLS0g
DQo+ID4gPiA+IDIuNDAuMQ0KPiA+ID4gPiANCj4gPiANCg0K
