Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEEC1C001DF
	for <intel-xe@archiver.kernel.org>; Fri,  4 Aug 2023 00:23:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8B7810E22C;
	Fri,  4 Aug 2023 00:23:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8409910E22C
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Aug 2023 00:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691108605; x=1722644605;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=S2pNd0JlJMAMJSar/5Jc8PMHy8zPHTHOs5DqQJBJASw=;
 b=V1VhEFLUTXRPFUqkJGClC+p8IOoefIeWmgdyNEvgnq/39o5sBqVpOpIO
 UwVoKjT2pDEtTzGXsJZvUCtie0G7pG95ubdACGS6dZs+/5yagOvE0FFEY
 UH4+KcJbHTpv13Us3OnOncTLrCjvBcEhMStQI4zAaB2BM/nTssWswg9r+
 7AvJBMGNBBhr/JbMNTlA918ezsuJH9Ijsdd60fRV5sec3hzHoxgmL9XXz
 NBFAJRSFeqS2KuD0yNwTSyuvzDNzdFj8rrcGJCbMzWbTgPYrJ3ntVTj8J
 UQyWIh6SeJQSLp1fcOSSMNfEoVCRGpWvvdsxXEi2/r2I8/I8ab5OmXBVL w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="350331756"
X-IronPort-AV: E=Sophos;i="6.01,253,1684825200"; d="scan'208";a="350331756"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2023 17:23:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="733010289"
X-IronPort-AV: E=Sophos;i="6.01,253,1684825200"; d="scan'208";a="733010289"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga007.fm.intel.com with ESMTP; 03 Aug 2023 17:23:24 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 3 Aug 2023 17:23:24 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 3 Aug 2023 17:23:24 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.102)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 3 Aug 2023 17:23:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MS/jmG5W5SnlwJd6Khv38mlIw0vlugzQJjX9cMzqbwwalrILO5I4qVBxCYQ6acOam15oP96TCYLsQM/41aiuc0+iAOBClTI9Ten0ytgHjqDStMnaK5ah9+gxjSmwOvPy9FJICa7zqn1nf53nsJvmBt14QqnYIL6VirFv07ExGBq/bhXuKjmNYUwPrArwmhjAZjUxKsNzlB+i5DrJT75bUobEQ1A6E9+RPhYWHmBA34L67M+k/kxEgZUN5VpKZZ1WAVj3z4MjYjTEJYT1NaDTu7B9mrlULaIz5oOwk7xfJa/SC3TIComr5iMS9bdzA8wtjXfvBh3xZDwrCrGPGU7kQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S2pNd0JlJMAMJSar/5Jc8PMHy8zPHTHOs5DqQJBJASw=;
 b=bSl+hMjSZWR4yycUIeZ2maOszKjzVB15v9IS0OCq1Ms8sjOjAjKt34UVzXmvR5yCA+sVnDRRFrUUz1h3stCG4qCF5/7wRAIcUlsVbZsW0KCHtHJmHreKtQps5V2Kvdm888MiRCqEAbCazxkHDMWV6Bo4AvlGRebDoQlWD0VwJM+arJzsAEk1w+iUY+tzp751YAxTzq/U1IB4L68V9X7n5X7dfDt2lCw/eIil3UVMxpvo1zTTeDbnIkXlk96cqmIoDWTJ39ullWrmzZj/MKT8MX4EjNutC2feDLJd3/NVQrvoycaWWWJufI/c7YfGGySka1PXJuJDXo5N5kZCGDSNWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CO6PR11MB5620.namprd11.prod.outlook.com (2603:10b6:303:13e::17)
 by CH3PR11MB7722.namprd11.prod.outlook.com (2603:10b6:610:122::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.20; Fri, 4 Aug
 2023 00:23:22 +0000
Received: from CO6PR11MB5620.namprd11.prod.outlook.com
 ([fe80::9d00:bd04:a6e3:1afe]) by CO6PR11MB5620.namprd11.prod.outlook.com
 ([fe80::9d00:bd04:a6e3:1afe%4]) with mapi id 15.20.6631.046; Fri, 4 Aug 2023
 00:23:22 +0000
From: "Zanoni, Paulo R" <paulo.r.zanoni@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>
Thread-Topic: [PATCH] drm/xe: Set max pte size when skipping rebinds
Thread-Index: AQHZxbnh1vClwNYH8UGV5H38vdP5yq/ZSEuA
Date: Fri, 4 Aug 2023 00:23:22 +0000
Message-ID: <d00a45fedeb9e4a87a6ef2e0c6927be6ad4e5c58.camel@intel.com>
References: <20230803032317.706386-1-matthew.brost@intel.com>
In-Reply-To: <20230803032317.706386-1-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.4-2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5620:EE_|CH3PR11MB7722:EE_
x-ms-office365-filtering-correlation-id: 6fb162fb-74b6-4cf0-38f3-08db948102d0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CUfbvFXtrsh6/XdS0OUyibiJRUR7/BnLCIerPL00eU+DJ/ViHq96EQsOwv+JZDieqkGMyx2ucZU9JTyEQwk+csc7aIk/p7PJiS8GXQdiP/j01SaT7FYbLJoQkFMgdWiueM53ulCeUYUpgoBUQ91EypnSeqlgaaNHhpYJlVCkPX98E2Qro4syL0cifVWqb3HDZBDvW7Bh7WXZXtYE6i59Fh3yfTFFxf1QHHs1O611UFwDfAoHpXW67Jo1lbBYdArR9eQsbz5QTlwGvJnrlk6Zb6OJsV0lgwa60jLPnPKkf40UrY8IAFFsS+gJKM/yGYlGbQU/bMy/jKFa7lIp3u6qoqxKlek62lKIjBhhYwX7q0w8qLx9VcH4LI5FG2dBFhej/38OfAJKkUTLXaM3/IdmjvtleWqntHve5+LdLq3N/wirlK7EjuC4DThEG1lpvAuI26XAJmqrXsjjUo5rNY1OIwTK5SgjzZz6G2RysQsCujDjgin0thaYa3ULM2mB3Z63GglXg5RspbE+insjGJoUbnAqKCqAvGfws4//fcl87YrAbkF0vXpvIcl/jGkR/woULzIzErN9ZYGem3bij5rkdMAQiGFdIOuvh1vCV4BLlHk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR11MB5620.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(366004)(376002)(346002)(39860400002)(136003)(186006)(1800799003)(451199021)(41300700001)(38070700005)(36756003)(86362001)(8936002)(478600001)(110136005)(38100700002)(122000001)(82960400001)(2616005)(8676002)(83380400001)(6506007)(6512007)(966005)(6486002)(71200400001)(6636002)(2906002)(66556008)(66476007)(66446008)(316002)(76116006)(66946007)(64756008)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RkhDZFgyY0ZGQmFRSUVHZEVkWVVMWVgrTHhiK2E4djRoVmNyc2tRQUhKTkwr?=
 =?utf-8?B?bzJvc1J0UCtNZ21KNWJLbVgzdE5nTzYrTFlpcmhCeVZYbGN6T3ZIRVdYOXh5?=
 =?utf-8?B?MFlMWmlicnZFcHNiWisza29RNUxWYjFoMUh2dm9JbFlyWUdFR1VWNDdaR1BS?=
 =?utf-8?B?UzJpdFM5VUNqKzVrRE9xblZCcEthZUNub1IycllXaWtGaDN2U0dtTGQxU1ZF?=
 =?utf-8?B?dGMzTWl1OFJoRmJ2MVVoMFQ5cWQ3aEF0b3BEbFNCZDgxRG1Ga05ma1pNYXNQ?=
 =?utf-8?B?N1BrNDhMM1dQWVpNd0JhK3FiZTJmWmxZZjM3TFRXN3pOY0IxMnJiNStxZTNn?=
 =?utf-8?B?cm12MS9MZzFNT1VQbnhoYVpYOENNSmRVdncycGZmTHIwNEdTTFlDOWw0aGdI?=
 =?utf-8?B?UE9xcWh5TFVSZU9TKzljc3RlYThjM1huamdTR0o5L1AyV0ZaZFhSWDBwNGpq?=
 =?utf-8?B?d2w4cHNQRk5YUUtVRzBVUWpMSVk2WVdZOWxaOWlwMW9yRWhjOEV5ZVVzSXpr?=
 =?utf-8?B?MFo1ckV4WUxLMDlEZnRaSmQrRElDRmRDYk9YdGVkSE5ubDFKR1NCZXIyQktp?=
 =?utf-8?B?SW9WQUZMOTRzdzBEaDJHODc3M3oxK2dxbk94V1UvTndtQU9JTENYNG9ENjdy?=
 =?utf-8?B?dWlwNG9lMytxdmpxVU9FWGFyaWJmZEdub0pobG14U29zcGlPSVNyL3p4SEhD?=
 =?utf-8?B?Z1RTSHRETzB6cG4zeWljcW53Y3lhaXNPazlNNkt1R3dDVmNOYS9yY2swT0VU?=
 =?utf-8?B?Z2ZNZUhBY2w2OGJ5R1FMYUZkeTR2NjUxWFdmTGNSN1lDOVFVekJCakEvLytR?=
 =?utf-8?B?UmUyUE5XSWhVdk9hVXBJalhBQjVSM1VrU1QzYmp3K2ExcjVjbDdrdVJPQkU0?=
 =?utf-8?B?SHRIRWlFY09jRVcxeUpqQUlCWjJTRHFhaVVtSDdxWmQrdEphcS94c0ZCaWtj?=
 =?utf-8?B?bkM5WjlrVENLRmFiNDUzVmszSjFkR0lqMzlXeFN3elcvZlZ1RUtxN2pWRHdW?=
 =?utf-8?B?MjNvdzVVTjdwSzNTOHV1RzZuejc3YzFTa05iOEIxU2dMakdNRWlMRTBvbHNh?=
 =?utf-8?B?RVNBWEttZ3UvK1Y3UFI2SHphdDJOek51d2EwaXhLSkEyaE5LZ1JDTVVUdU0v?=
 =?utf-8?B?WTNBVHpvaWt1VkxhRzU0SlRUWDhyakxudHk5SGdKZkloTVd0Z3YrbTNQRlU3?=
 =?utf-8?B?MGZvRGxPU0ZyRjJ0QzFWSmwrRi9rc1huT2prK0gwZ0tHN2dDNUlQQ2ZWYVht?=
 =?utf-8?B?RGxGQ1hkUG5pMkRxYmdONlViWUNWOTRzTzh1UUZKNzNNY0xOalVwUFFiKzNq?=
 =?utf-8?B?emQ3cFlxQ1VVcUtEY3BqWDdoWkdJN1ViNUVtMkpkeElTTWhwbUJ6MHFvRWpD?=
 =?utf-8?B?MDhQN3dHNnpERSszVXkwV2JRNnB2aDRnSmJIN0dPZU1QU0xyMlJGbG5NQzZ2?=
 =?utf-8?B?cVpmRlFMZWdHbWJ4Ym1QMDU5RHhYdnZBbEJLZEZMQmlyOEFIR0xwSVlmczN5?=
 =?utf-8?B?RzBmbkh1RFk2ak1ONW1pRVBONEo5ejRteHlFSStaV3VTcWtHdHd6UzJXbGt2?=
 =?utf-8?B?S200R1VLaGxjV1JUSjlYZnB3VDVTREJxYURaUzZLOVlpSERVQjc1NXJkRkxm?=
 =?utf-8?B?MkR0bGtEQ3dQd0Y0SnJEWHIrU1RaV0RIUElyYkVCOVVrTlIrci9UR0ViQVpu?=
 =?utf-8?B?dFBFZU5seTQ2TXp2UWJWSDVlUTRKMjVHc0xOM3VJVWJvV3FSM3p5K1I0M0o5?=
 =?utf-8?B?NXdNMU9HRVNacTdjeS9XZ2pIU3BqOXkzZDFGQWE2clNFVVZ6MlZBQ3NBSG11?=
 =?utf-8?B?VjMzdmt6RjlUems2TzZvRVN6SUlvaUVTMWFoKzR1RUk3anBXcDJSTU1xQXNt?=
 =?utf-8?B?MGxPckNqNlp6L3I4ZVBFVlJXWmpXR3FIRHFBdmNXME9xMkJOd3RqUHhDc3Y5?=
 =?utf-8?B?Y2RMS05rY3JzUDcvdUVudUlZYmwreGxsRzk3UzhVZTB2WUNqaFdNdGJicHlp?=
 =?utf-8?B?Smx1c1RnaTkvZG1qcCs3V3Yxd1FaRzB6eEVrQm1iUE1wc2dUMks5THpDSXph?=
 =?utf-8?B?MDQrMmtyelFsYlBzQ3ZCS3pZNm53QTQrdFJSYWJDNVcrV3Rsc0lWTER4S3N0?=
 =?utf-8?B?TndXQ21Zcy9ITDJnV3RtVUdjaGx4WEtNOTVUanh0dTFJMTkveU1WdGdIbjlu?=
 =?utf-8?B?OEpwZGNWMElEZG41Y3YxdkR2VnpaZHZ3TjVCZVd4TC9sS2VmSlFRTTRrK1NV?=
 =?utf-8?B?c1lpR2NwYXFROHhVeGpYUHd3TENnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FA4D99676A33C6498298D3D83CD89F1E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5620.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fb162fb-74b6-4cf0-38f3-08db948102d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2023 00:23:22.1734 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +yrhcj+9joJ5mXx/3eByksU4cJ/yaLoU3NtcWfBhcvAmGGSc8Nrs6ObVjAqMUM7Z20xYfZ/1yGw4EDiLcfbNJaHTQRTcz5n16/3KiFOri3A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7722
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Set max pte size when skipping
 rebinds
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

T24gV2VkLCAyMDIzLTA4LTAyIGF0IDIwOjIzIC0wNzAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
PiBXaGVuIGEgcmViaW5kIGlzIHNraXBwZWQsIHdlIG11c3Qgc2V0IHRoZSBtYXggcHRlIHNpemUg
b2YgdGhlIG5ld2x5DQo+IGNyZWF0ZWQgdm1hIHRvIHZhbHVlIG9mIHRoZSBvbGQgdm1hIGFzIHdl
IGRvIG5vdCBwdGUgd2FsayBmb3IgdGhlIG5ldw0KPiB2bWEuIFdpdGhvdXQgdGhpcyBmdXR1cmUg
cmViaW5kcyBtYXkgYmUgaW5jb3JyZWN0bHkgc2tpcHBlZCBkdWUgdG8gdGhlDQo+IHdyb25nIG1h
eCBwdGUgc2l6ZS4gTnVsbCBiaW5kcyBhcmUgbW9yZSBsaWtlbHkgdG8gZXhwb3NlIHRoaXMgYnVn
IGFzDQo+IGxhcmdlciBwdGVzIGFyZSBtb3JlIGZyZXF1ZW50bHkgdXNlZCBjb21wYXJlZCB0byBu
b3JtYWwgYmluZGluZ3MuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBNYXR0aGV3IEJyb3N0IDxtYXR0
aGV3LmJyb3N0QGludGVsLmNvbT4NCj4gVGVzdGNhc2U6IGRFUVAtVksuc3BhcnNlX3Jlc291cmNl
cy5idWZmZXIuc3Niby5zcGFyc2VfcmVzaWRlbmN5LmJ1ZmZlcl9zaXplXzJfMjQNCj4gUmVwb3J0
ZWQtYnk6IFBhdWxvIFphbm9uaSA8cGF1bG8uci56YW5vbmlAaW50ZWwuY29tPg0KPiBGaXhlczog
YTA0MmJiNGNhODk0ICgiZHJtL3hlOiBBdm9pZCBkb2luZyByZWJpbmRzIikNCj4gUmVmZXJlbmNl
OiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvbWVzYS9tZXNhLy0vbWVyZ2VfcmVxdWVz
dHMvMjMwNDUNCg0KVGhpcyBwYXRjaCBmaXhlcyB0aGUgaXNzdWVzIEkgd2FzIHNlZWluZy4NCg0K
VGVzdGVkLWJ5OiBQYXVsbyBaYW5vbmkgPHBhdWxvLnIuemFub25pQGludGVsLmNvbT4NCg0KPiAt
LS0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV92bS5jIHwgMTkgKysrKysrKysrKysrKysrKysr
LQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4g
DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfdm0uYyBiL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV92bS5jDQo+IGluZGV4IGNiMjhkYmMyYmRiYi4uOTM2NDkyOTE1ZWNiIDEwMDY0
NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfdm0uYw0KPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0veGUveGVfdm0uYw0KPiBAQCAtMjQwNiw2ICsyNDA2LDIwIEBAIHN0YXRpYyB1NjQgeGVf
dm1hX21heF9wdGVfc2l6ZShzdHJ1Y3QgeGVfdm1hICp2bWEpDQo+ICAJcmV0dXJuIFNaXzRLOw0K
PiAgfQ0KPiAgDQo+ICtzdGF0aWMgdTY0IHhlX3ZtYV9zZXRfcHRlX3NpemUoc3RydWN0IHhlX3Zt
YSAqdm1hLCB1NjQgc2l6ZSkNCj4gK3sNCj4gKwlzd2l0Y2ggKHNpemUpIHsNCj4gKwljYXNlIFNa
XzFHOg0KPiArCQl2bWEtPmdwdXZhLmZsYWdzIHw9IFhFX1ZNQV9QVEVfMUc7DQo+ICsJCWJyZWFr
Ow0KPiArCWNhc2UgU1pfMk06DQo+ICsJCXZtYS0+Z3B1dmEuZmxhZ3MgfD0gWEVfVk1BX1BURV8y
TTsNCj4gKwkJYnJlYWs7DQo+ICsJfQ0KPiArDQo+ICsJcmV0dXJuIFNaXzRLOw0KPiArfQ0KPiAr
DQo+ICAvKg0KPiAgICogUGFyc2Ugb3BlcmF0aW9ucyBsaXN0IGFuZCBjcmVhdGUgYW55IHJlc291
cmNlcyBuZWVkZWQgZm9yIHRoZSBvcGVyYXRpb25zDQo+ICAgKiBwcmlvciB0byBmdWxseSBjb21t
aXR0aW5nIHRvIHRoZSBvcGVyYXRpb25zLiBUaGlzIHNldHVwIGNhbiBmYWlsLg0KPiBAQCAtMjUx
Niw2ICsyNTMwLDcgQEAgc3RhdGljIGludCB2bV9iaW5kX2lvY3RsX29wc19wYXJzZShzdHJ1Y3Qg
eGVfdm0gKnZtLCBzdHJ1Y3QgeGVfZXhlY19xdWV1ZSAqcSwNCj4gIAkJCQkJCUlTX0FMSUdORUQo
eGVfdm1hX2VuZCh2bWEpLA0KPiAgCQkJCQkJCSAgIHhlX3ZtYV9tYXhfcHRlX3NpemUob2xkKSk7
DQo+ICAJCQkJCWlmIChvcC0+cmVtYXAuc2tpcF9wcmV2KSB7DQo+ICsJCQkJCQl4ZV92bWFfc2V0
X3B0ZV9zaXplKHZtYSwgeGVfdm1hX21heF9wdGVfc2l6ZShvbGQpKTsNCj4gIAkJCQkJCW9wLT5y
ZW1hcC5yYW5nZSAtPQ0KPiAgCQkJCQkJCXhlX3ZtYV9lbmQodm1hKSAtDQo+ICAJCQkJCQkJeGVf
dm1hX3N0YXJ0KG9sZCk7DQo+IEBAIC0yNTUwLDEwICsyNTY1LDEyIEBAIHN0YXRpYyBpbnQgdm1f
YmluZF9pb2N0bF9vcHNfcGFyc2Uoc3RydWN0IHhlX3ZtICp2bSwgc3RydWN0IHhlX2V4ZWNfcXVl
dWUgKnEsDQo+ICAJCQkJCW9wLT5yZW1hcC5za2lwX25leHQgPSAheGVfdm1hX2lzX3VzZXJwdHIo
b2xkKSAmJg0KPiAgCQkJCQkJSVNfQUxJR05FRCh4ZV92bWFfc3RhcnQodm1hKSwNCj4gIAkJCQkJ
CQkgICB4ZV92bWFfbWF4X3B0ZV9zaXplKG9sZCkpOw0KPiAtCQkJCQlpZiAob3AtPnJlbWFwLnNr
aXBfbmV4dCkNCj4gKwkJCQkJaWYgKG9wLT5yZW1hcC5za2lwX25leHQpIHsNCj4gKwkJCQkJCXhl
X3ZtYV9zZXRfcHRlX3NpemUodm1hLCB4ZV92bWFfbWF4X3B0ZV9zaXplKG9sZCkpOw0KPiAgCQkJ
CQkJb3AtPnJlbWFwLnJhbmdlIC09DQo+ICAJCQkJCQkJeGVfdm1hX2VuZChvbGQpIC0NCj4gIAkJ
CQkJCQl4ZV92bWFfc3RhcnQodm1hKTsNCj4gKwkJCQkJfQ0KPiAgCQkJCX0NCj4gIAkJCQlicmVh
azsNCj4gIAkJCX0NCg0K
