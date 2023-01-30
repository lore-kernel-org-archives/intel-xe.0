Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4526C636D3
	for <intel-xe@archiver.kernel.org>; Mon, 30 Jan 2023 19:44:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A41710E11D;
	Mon, 30 Jan 2023 19:44:14 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31E0110E11D
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Jan 2023 19:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675107852; x=1706643852;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=a05N6hnmDqm7l5n0FlqG0Jg/u3StFW7+1ggjf3HUnpQ=;
 b=kxaj1UoQpfZBB/AUwjQYK00CoTNT5QoABogo+Sw71pLn6FI9Ay0ByhC3
 pxG+LikaEhXjAgXer+hMCNW7M0y00EuTh7GJG1VOz1T/nl7HB7PovTnsR
 j7J1wJQ8chlarLBf8PqCdxaBmOAcbcpB368eylK5wFWT2nVmmYJS/chw3
 CBVo3jJR9HRELcDAZxRQ9w3M/Se3BRm8YPoGe299A5at5c/EwYzp2OiKH
 MetFoiabqty8Ts3EvEf9eRLrtKNBMc/w++2uyYXc/vAS4dPx03zEiUqGh
 7tMQ/8GnqQ663ZiuRgeNQo94f2TJboPhR3AkfbBtuREn5HhKQQMgp6/h1 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="390022640"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; d="scan'208";a="390022640"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2023 11:44:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="657583191"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; d="scan'208";a="657583191"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga007.jf.intel.com with ESMTP; 30 Jan 2023 11:44:02 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 30 Jan 2023 11:44:01 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 30 Jan 2023 11:44:01 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 30 Jan 2023 11:44:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VpY2HFyW4yJImQPyN7f2w+6IRwbYW9q8cVuSPq3qikgODK8wqDhuAmL+J1AsKs79d0s2d6bE1GaC1ny/FZT16fDWe5R4zuSoyPNCLwdfDPfqFGYroLh6HBzQvdEza01oUh6k4oQsCD0G1g73Sa39oapgyHKHxe9mpmDs+WtU904KqQD9usuUtEF6Z+/3nLMDABiEAUl6n08G4E4hBHNEaVcxN5OdNxJfBk7RCHy7TjsPLWh5SmlK0sukeaus30bW9OJP7HKZj0FjLxXFo9Ja86EWuYYQW1TvU3+5shS9DKK5V/0T4GOvyc9NBjZVRzjhq64cdqFQn8MEwhZBm9OfSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a05N6hnmDqm7l5n0FlqG0Jg/u3StFW7+1ggjf3HUnpQ=;
 b=O8SXVJi7HXZglQC+aw177DprMSSPsHcCHGHeTWpzoUhuopXOLhCQxdhJXR8hMcOHMg3csQdCL7h60ykuU7dekvDfDCHoepPnjtF5xIxtDU4yoedp+z4m09ws2LvzMBf+KeJFDYKKxG9f1nU61LE1t2iK86JmjsWv2+dEO1ZiYVbgmuGK5bIGHeAwILsP1VsCioCN9Bf+zA7KzSh5X3MK299yIQSTgMy9QNvK9UMYsm403ybgV7dyq8EH+7CbJMKO4kA+wmg5Qs7M3119AIxeANSGUoit1On6jIIAc5lDeURjTpZ/uiF6TlThFELf0lXZzldTWfneLYz4wpP8OPJOBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY4PR11MB2054.namprd11.prod.outlook.com (2603:10b6:903:2d::9)
 by DM4PR11MB7207.namprd11.prod.outlook.com (2603:10b6:8:111::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Mon, 30 Jan
 2023 19:43:59 +0000
Received: from CY4PR11MB2054.namprd11.prod.outlook.com
 ([fe80::a11b:8f88:32ed:1828]) by CY4PR11MB2054.namprd11.prod.outlook.com
 ([fe80::a11b:8f88:32ed:1828%11]) with mapi id 15.20.6043.036; Mon, 30 Jan
 2023 19:43:58 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>
Thread-Topic: [PATCH v2] drm/xe: Add fake workaround to maintain backward
 compatible in MI_BATCH_BUFFER_START
Thread-Index: AQHZNMZgoxtTsMO+yE6am6PfoCoCAK63M2aAgAANnACAABdTgIAABH6A
Date: Mon, 30 Jan 2023 19:43:58 +0000
Message-ID: <12ca0b771f2845509e00a36e6514d456ea39073a.camel@intel.com>
References: <20230130161723.42602-1-jose.souza@intel.com>
 <Y9f7O86ki5W4Qv1C@mdroper-desk1.amr.corp.intel.com>
 <7c9f39e8eb4ad81926af9b91f45509a5a5a9d347.camel@intel.com>
 <20230130192751.ozgru3btj67iojfa@ldmartin-desk2>
In-Reply-To: <20230130192751.ozgru3btj67iojfa@ldmartin-desk2>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY4PR11MB2054:EE_|DM4PR11MB7207:EE_
x-ms-office365-filtering-correlation-id: 1bd2c353-6bc6-4d8f-19ee-08db02fa546d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qus3fj2PQr3sBsMaGExI8W+y6T9QzLztqB7YNn52+rlmWusm0GLTNeBW0PEnxzF9U/qv4v6ahl0VWkY47HX9MDGpVlR6pErCgkLC8ywEVpKpGJcsCCH08v/dUvu7qM6yCZWTTbmtVKLSfR5p88rZoa7gskI6aZzzmQ2oITLpxEur6Iz9+spwKoyiRLddF9wPTsFRfNY1tB8BuMxqeehdKRhjhEzefvD7lf4+yRYjr5u5YnqA78nQ5ZQCvzD51jiBLWTCI+qwir5sGUSNBOKakjcHZ+jB3+xZN1xqbTkfmgRg4gPvchWRPDVHoHhBoy8PBCpaGYHEzsx09OWThIa4mRcMOEzY/sF5sYvuuyLObXrZuiySvnHhUweGQiNfawzWZRzGhuCGzDCpUR3QT0/bCzMXQhXysAy/cmA8dsWN8YIKAidM8Fty0D+ucTnh8w7lg/EHfPKoZpIrMVQYeBF8wyO1OyUpW/vGhbFU90w3C34dc+dregLaF6/86BVm+aZNvpqoPTNrLflcp1yjBDpwtEOrueRDRREup1EDYBVdGQOB20oNNzRlSO7+B2I6OKb46fwm38SGZTz+zPQU7maa3Vlfo71bBR/xINb4NoRHl4ddUnZJ1n9RY+dR0FeDd6shimdgQAdvyIPPFePWtlNexPmgFdhqMwI8HQJeBNpLJbpdXoDF00Q9inCE77q1x2ZsLX2DgO45sConnSTSQ5V5bA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR11MB2054.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(396003)(376002)(39860400002)(346002)(366004)(451199018)(5660300002)(6862004)(8936002)(41300700001)(38100700002)(122000001)(38070700005)(82960400001)(36756003)(86362001)(2906002)(37006003)(6636002)(54906003)(2616005)(186003)(478600001)(26005)(6486002)(6512007)(71200400001)(6506007)(91956017)(316002)(4326008)(8676002)(66446008)(66476007)(64756008)(76116006)(66556008)(66946007)(83380400001)(107886003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?andiZnI0WUh2K2IyU2w0ZCt0RlZnNHpOQTRHQzA0UHRJTWU0NWIySk11L3d3?=
 =?utf-8?B?WFBSaE1aN0c5L2NqRENBNFJDd0V5VkF4RWJRY2pxNUJ2VWRYZTU1dUtkTVlU?=
 =?utf-8?B?NjBQSCtLM0hVd243QzNybDJETWV4c2FiaXFpaWhxTEJBRlVuTFFmZHNkUnBN?=
 =?utf-8?B?SE83NmdCVk45cDczZVJxY1VDNnIySnVVMi9hYnAwN1l5L1ZOZks2RTQyWW1X?=
 =?utf-8?B?LzBHWXF1YXBHaEtqeUdyczhzdUtvb3lrc29zeGs3Q0h3aUV4YVBTbEVvblFU?=
 =?utf-8?B?VkZWOW1QeEJpYWlmMTJvQU1OaFAvUXpNRmo0QXVVRDBQV284T00zMnFqNmpu?=
 =?utf-8?B?eUpFQ1c0UmNINFpNYTZCVUNaUlNhdk9BbDNrc0pjcVF3czMyMWpqd2dYdDln?=
 =?utf-8?B?ZmZ6bWhsSTJEMlcvOThuQW5vWnRZU2VhTXNlMXlwRmhDbVRoazNPQVJBbGZG?=
 =?utf-8?B?K3BTUkZQV0plSWg4U2JuaXlDK1ZOdmxWdDRRNmc4Vk9MREVwWGtuZ3RXN3lR?=
 =?utf-8?B?Q1hwZ09aVWhwZTY4RklycVU0Ymh4UzFhbnk4M2IwblpLb0JrbS8zbWFQZHNl?=
 =?utf-8?B?dHpCU2puYlhvZDB0Q0ZpYUpielc4MnZCZ21QaUh1TWtsREpKRGVnOU1oMnRs?=
 =?utf-8?B?c25CU1FmODhqNnZlV0RnN3lGelVKN29wUVJ1ZXpiM0ltanNuUllCMVpCQmpP?=
 =?utf-8?B?N1grL1hzMU5yMnF4RlhNdTBzb3JaSzFxQy9hc3ZPSXJ2S29GNW1jSFA5bWd2?=
 =?utf-8?B?bVVRMllmbGdhRldybEluMnlYb2xFTVVnVkc1YUR5TnJjN0ludHY3azFKYUV6?=
 =?utf-8?B?WVh0ZXpCNmhqeFVYdHVNNXk1T2hlbEJIWHJsMk1ET2V1VXZ1RUMyQ2R4Mzlz?=
 =?utf-8?B?UVZaZDFOQlk1OHVpaldJTjdhLzhtSmdzdzAwa1hSQkdycFdYT0hyS3phRXhw?=
 =?utf-8?B?SzNhdk1GM3FtZEhRREVZaUhaTGxVajlqd01UdzFtZ3ZJZkRvcXc3bEZSem1T?=
 =?utf-8?B?NUpRcUtyaWkrcGNxV3AzTldFQk41YUdmd1BPaHplN2xPOUxTeVZFZmxOQ2JD?=
 =?utf-8?B?bWZ4Z1puLzY1U05MdUcyYW1ETVV4TnRraEdjdjBzcElSY09yMldZVkhETEhk?=
 =?utf-8?B?aDE0WDJFSnJ3WmVBRHluTWxxbFhseTJnOUxId0VqQVdXbHlCemtTWjhMdEE4?=
 =?utf-8?B?aDBDaHJ6bm9PaUtLdmhwTzFmN2VoVThVenM0THlYa0ludHd3N25XdWE5aXhy?=
 =?utf-8?B?RHdJV3ZWV1dHU2sxeHZiSnk4R203by9FaGdxS3NrVGE2V3NQSGs1UTNaYndo?=
 =?utf-8?B?eXA5SkErQXpnZy96NU9BRDJHT09HejhrQmkwYU05UnMyYWh5eTZxUzRReXZC?=
 =?utf-8?B?bnAxZHBDQS9ZR2xmQ2RiSi9lY0lTVElZTnYwZ3BHUUU0WmxrQkVPK3hnbWNi?=
 =?utf-8?B?VURsajNZVDkwZnNrNjNvVGZnMHgzU2FlQzd5QThWVFFOT1NGdVpLNVpqdTZa?=
 =?utf-8?B?WTNNNVFBaCtZVzhIQmFVVjJVaklqelYwdGEvWml4SVJtci9VWUJpT1VEZHkv?=
 =?utf-8?B?MGlJOTV0NklOcE51ZHo1bkw0TUx6NTh3YjBQb2hHNmZHejRLWGJqZVJqNzdq?=
 =?utf-8?B?aTAvNnRvQTd4bk1ZSHEzbDJrN0pOSStUQ2tuU1RpQm9vUHpmRGV3MlRiR0Vu?=
 =?utf-8?B?NGlaeGoyR3laREVyWU9GUm84cXNySXkyVmk1UnZyZGEzRVl2NXlXV3c2dXZx?=
 =?utf-8?B?VDluQnJqU0w3R3JMdExycTlHWTdXVmJYcTh0cnlwdFBDK0hkWUFEcmIrOWpC?=
 =?utf-8?B?MGdGdy9XRU5ROW1ZSFJKUldoL015SGQ3MkZJM1V5NHlrOTRlUjJsYjFuVExD?=
 =?utf-8?B?VVJjQXpycCs2dm1vWWZuV21Jb2k1Q3BMRW53QVlLMXAyMWRSQ0pVQ1RuR3VP?=
 =?utf-8?B?aytHZmxucXhabDVvNGMxTW0xRFljdEVVTTVZQXVndG1PbGtJTEpuanZjOElw?=
 =?utf-8?B?eWVRV0tJUStUdjE0Rk1WUEJYd2tXaHhHcDdudndYeUdlNUh5cG03VUJzQ3Fj?=
 =?utf-8?B?UkgwSnorcjgyZzRmQmtpSXArejdBcVloL1dVRFIvbW43Q3AzdGNIajJ0SU9Z?=
 =?utf-8?B?RHFHcTBoVUNyRm45MktMUTR2QVJERHFQU3ZaaGVGMG96VGVTUERpZi9LRmNt?=
 =?utf-8?B?MXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1593CB6B0E6EA84293938A7040050164@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB2054.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bd2c353-6bc6-4d8f-19ee-08db02fa546d
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2023 19:43:58.3947 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p4pLlZUbcew0nLULFCEX+yT5L6fQ5/nfMTbIBW1XB6F7K5neYYlmkCGm7K7+ueE1boRFDBf3nOaEltoO96+kXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7207
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2] drm/xe: Add fake workaround to maintain
 backward compatible in MI_BATCH_BUFFER_START
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDIzLTAxLTMwIGF0IDExOjI3IC0wODAwLCBMdWNhcyBEZSBNYXJjaGkgd3JvdGU6
DQo+IE9uIE1vbiwgSmFuIDMwLCAyMDIzIGF0IDEwOjA0OjI1QU0gLTA4MDAsIEpvc2UgU291emEg
d3JvdGU6DQo+ID4gT24gTW9uLCAyMDIzLTAxLTMwIGF0IDA5OjE1IC0wODAwLCBNYXR0IFJvcGVy
IHdyb3RlOg0KPiA+ID4gT24gTW9uLCBKYW4gMzAsIDIwMjMgYXQgMDg6MTc6MjNBTSAtMDgwMCwg
Sm9zw6kgUm9iZXJ0byBkZSBTb3V6YSB3cm90ZToNCj4gPiA+ID4gaTkxNSBoYXMgdGhlIHNhbWUg
ZmFrZSB3b3JrYXJvdW5kIHRvIHJldHVybiBNSV9CQVRDSF9CVUZGRVJfU1RBUlQNCj4gPiA+ID4g
bmVzdGVkIGJhdGNoIGJ1ZmZlciBiZWhhdmlvciBpbiBERzIgYW5kIG5ld2VyIHBsYXRmb3JtcyB0
byB0aGUgc2FtZQ0KPiA+ID4gPiBiZWhhdmlvciBhcyBvbGRlciBwbGF0Zm9ybXMuDQo+ID4gPiA+
IA0KPiA+ID4gPiBTbyBoZXJlIGNsZWFuaW5nIHVwIFRHTF9ORVNURURfQkJfRU4gaW4gTUlfTU9E
RSB0byBkaXNhYmxlIHRoaXJkIGxldmVsDQo+ID4gPiA+IGNoYWluZWQgYmF0Y2ggYnVmZmVyIGxl
dmVsLg0KPiA+ID4gDQo+ID4gPiBJIHdhcyBraW5kIG9mIGFzc3VtaW5nIHdlJ2QganVzdCBkcm9w
IHRoaXMgc2V0dGluZyBmb3IgdGhlIFhlIGRyaXZlci4gIEkNCj4gPiA+IGJlbGlldmUgaGFyZHdh
cmUgd2lsbCBiZSByZW1vdmluZyB0aGUgb3B0aW9uIHRvIHR1cm4gb2ZmIG5lc3RlZA0KPiA+ID4g
YmF0Y2hidWZmZXJzIGluIGFuIHVwY29taW5nIHBsYXRmb3JtLCBzbyB1c2Vyc3BhY2UgaXMgZ29p
bmcgdG8gaGF2ZSB0bw0KPiA+ID4gYWRhcHQgdG8gdGhlIG5ldyBiZWhhdmlvciBzb29uIGFueXdh
eTsgZG9pbmcgaXQgd2hpbGUgbW92aW5nIHRvIGEgbmV3DQo+ID4gPiBLTUQgc2VlbXMgbGlrZSB0
aGUgZWFzaWVzdCB0aW1lIHRvIG1ha2UgdGhhdCBoYXBwZW4gc2luY2UgdGhlIFVNRHMgYXJlDQo+
ID4gPiBhbHJlYWR5IHVwZGF0aW5nIHRoZWlyIHByb2dyYW1taW5nIG1vZGVscy4NCj4gPiANCj4g
PiBUaGlzIHdvdWxkIGJyaW5nIGV2ZW4gbW9yZSBjaGFuZ2VzIHRvIHRyYWNrIHdoZW4gZGVidWdn
aW5nIGlzc3VlcyBpbiBYZSBLTUQgcG9ydC4NCj4gPiBCZXR0ZXIgZG8gdGhpcyBhZnRlciBYZSBL
TUQgaXMgc3RhYmlsaXplZCBhbmQgd2l0aCBiZXR0ZXIgQ0kgY292ZXJhZ2UgaW4gVU1EcyBhbmQg
S01Ecy4NCj4gDQo+IGJ1dCBpZiB3ZSBzdGFydCBzdXBwb3J0aW5nIHRoZXNlIHBsYXRmb3JtcyB3
aXRoIG5lc3RlZCBiYiBkaXNhYmxlZCwNCj4gd2UgY2FuJ3QgY2hhbmdlIGl0IGxhdGVyLiBBdCBs
ZWFzdCBub3QgZm9yIHRoZSBvbGRlciBwbGF0Zm9ybXMgdGhhdCBoYWQNCj4gaXQgdGhhdCB3YXku
DQoNClhlIEtNRCB3aWxsIG5vdCBzdXBwb3J0IGJ5IGRlZmF1bHQgVEdMLCBERzIuLi4gYW55d2F5
cy4NCldoeSBoYXZlIGRpZmZlcmVudCBoYXJkd2FyZSBiZWhhdmlvciBiZXR3ZWVuIEtNRHMgdGhl
bj8NCg0KPiANCj4gTHVjYXMgRGUgTWFyY2hpDQo+IA0KPiA+IA0KPiA+ID4gDQo+ID4gPiANCj4g
PiA+IE1hdHQNCj4gPiA+IA0KPiA+ID4gPiANCj4gPiA+ID4gdjI6DQo+ID4gPiA+IC0gcmVwbGFj
ZSBJUF9WRVJTSU9OX0ZPUkVWRVIgYnkgWEVfUlRQX0VORF9WRVJTSU9OX1VOREVGSU5FRA0KPiA+
ID4gPiAtIG1vdmUgZmFrZSB3b3JrYXJvdW5kIHRvIGxyY19hZGRpdGlvbmFsX3Byb2dyYW1taW5n
IHRhYmxlDQo+ID4gPiA+IA0KPiA+ID4gPiBCc3BlYzogNDU5NzQsIDQ1NzE4DQo+ID4gPiA+IENj
OiBMdWNhcyBEZSBNYXJjaGkgPGx1Y2FzLmRlbWFyY2hpQGludGVsLmNvbT4NCj4gPiA+ID4gQ2M6
IE1hdHQgUm9wZXIgPG1hdHRoZXcuZC5yb3BlckBpbnRlbC5jb20+DQo+ID4gPiA+IFNpZ25lZC1v
ZmYtYnk6IEpvc8OpIFJvYmVydG8gZGUgU291emEgPGpvc2Uuc291emFAaW50ZWwuY29tPg0KPiA+
ID4gPiAtLS0NCj4gPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndC5jIHwgIDEgKw0KPiA+
ID4gPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3dhLmMgfCAyOCArKysrKysrKysrKysrKysrKysr
KysrKysrKysrDQo+ID4gPiA+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfd2EuaCB8ICAxICsNCj4g
PiA+ID4gIDMgZmlsZXMgY2hhbmdlZCwgMzAgaW5zZXJ0aW9ucygrKQ0KPiA+ID4gPiANCj4gPiA+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndC5jIGIvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX2d0LmMNCj4gPiA+ID4gaW5kZXggODRhNzNlZWNjZDI5Ny4uNWQwN2UxZTdiZDUw
NiAxMDA2NDQNCj4gPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0LmMNCj4gPiA+
ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0LmMNCj4gPiA+ID4gQEAgLTMxMSw2ICsz
MTEsNyBAQCBpbnQgeGVfZ3RfcmVjb3JkX2RlZmF1bHRfbHJjcyhzdHJ1Y3QgeGVfZ3QgKmd0KQ0K
PiA+ID4gPiANCj4gPiA+ID4gIAkJeGVfcmVnX3NyX2luaXQoJmh3ZS0+cmVnX2xyYywgIkxSQyIs
IHhlKTsNCj4gPiA+ID4gIAkJeGVfd2FfcHJvY2Vzc19scmMoaHdlKTsNCj4gPiA+ID4gKwkJeGVf
d2FfcHJvY2Vzc19scmNfYWRkaXRpb25hbF9wcm9ncmFtbWluZyhod2UpOw0KPiA+ID4gPiANCj4g
PiA+ID4gIAkJZGVmYXVsdF9scmMgPSBkcm1tX2t6YWxsb2MoJnhlLT5kcm0sDQo+ID4gPiA+ICAJ
CQkJCSAgIHhlX2xyY19zaXplKHhlLCBod2UtPmNsYXNzKSwNCj4gPiA+ID4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV93YS5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3dhLmMN
Cj4gPiA+ID4gaW5kZXggMzMyNWRlM2VkZjY5MS4uNzQ0YjdkMDk4MjY4MyAxMDA2NDQNCj4gPiA+
ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3dhLmMNCj4gPiA+ID4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX3dhLmMNCj4gPiA+ID4gQEAgLTI4OCw2ICsyODgsMjEgQEAgc3RhdGlj
IGNvbnN0IHN0cnVjdCB4ZV9ydHBfZW50cnkgbHJjX3dhc1tdID0gew0KPiA+ID4gPiAgCXt9DQo+
ID4gPiA+ICB9Ow0KPiA+ID4gPiANCj4gPiA+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgeGVfcnRw
X2VudHJ5IGxyY19hZGRpdGlvbmFsX3Byb2dyYW1taW5nW10gPSB7DQo+ID4gPiA+ICsJeyBYRV9S
VFBfTkFNRSgiRmFrZVdhRGlzYWJsZU5lc3RlZEJCTW9kZSIpLA0KPiA+ID4gPiArCSAgLyoNCj4g
PiA+ID4gKwkgICAqIFRoaXMgaXMgYSAiZmFrZSIgd29ya2Fyb3VuZCBkZWZpbmVkIGJ5IHNvZnR3
YXJlIHRvIGVuc3VyZSB3ZQ0KPiA+ID4gPiArCSAgICogbWFpbnRhaW4gcmVsaWFibGUsIGJhY2t3
YXJkLWNvbXBhdGlibGUgYmVoYXZpb3IgZm9yIHVzZXJzcGFjZSB3aXRoDQo+ID4gPiA+ICsJICAg
KiByZWdhcmRzIHRvIGhvdyBuZXN0ZWQgTUlfQkFUQ0hfQlVGRkVSX1NUQVJUIGNvbW1hbmRzIGFy
ZSBoYW5kbGVkLg0KPiA+ID4gPiArCSAgICovDQo+ID4gPiA+ICsJICBYRV9SVFBfUlVMRVMoR1JB
UEhJQ1NfVkVSU0lPTl9SQU5HRSgxMjU1LCBYRV9SVFBfRU5EX1ZFUlNJT05fVU5ERUZJTkVEKSks
DQo+ID4gPiA+ICsJICBYRV9SVFBfQ0xSKFJJTkdfTUlfTU9ERSgwKSwNCj4gPiA+ID4gKwkJICAg
ICBUR0xfTkVTVEVEX0JCX0VOLA0KPiA+ID4gPiArCQkgICAgIFhFX1JUUF9GTEFHKE1BU0tFRF9S
RUcsIEVOR0lORV9CQVNFKSkNCj4gPiA+ID4gKwl9LA0KPiA+ID4gPiArCXt9DQo+ID4gPiA+ICt9
Ow0KPiA+ID4gPiArDQo+ID4gPiA+ICBzdGF0aWMgY29uc3Qgc3RydWN0IHhlX3J0cF9lbnRyeSBy
ZWdpc3Rlcl93aGl0ZWxpc3RbXSA9IHsNCj4gPiA+ID4gIAl7IFhFX1JUUF9OQU1FKCJXYUFsbG93
UE1EZXB0aEFuZEludm9jYXRpb25Db3VudEFjY2Vzc0Zyb21VTUQsIDE0MDg1NTY4NjUiKSwNCj4g
PiA+ID4gIAkgIFhFX1JUUF9SVUxFUyhHUkFQSElDU19WRVJTSU9OX1JBTkdFKDEyMDAsIDEyMTAp
LCBFTkdJTkVfQ0xBU1MoUkVOREVSKSksDQo+ID4gPiA+IEBAIC0zNjIsNiArMzc3LDE5IEBAIHZv
aWQgeGVfd2FfcHJvY2Vzc19scmMoc3RydWN0IHhlX2h3X2VuZ2luZSAqaHdlKQ0KPiA+ID4gPiAg
CXhlX3J0cF9wcm9jZXNzKGxyY193YXMsICZod2UtPnJlZ19scmMsIGh3ZS0+Z3QsIGh3ZSk7DQo+
ID4gPiA+ICB9DQo+ID4gPiA+IA0KPiA+ID4gPiArLyoqDQo+ID4gPiA+ICsgKiB4ZV93YV9wcm9j
ZXNzX2xyY19hZGRpdGlvbmFsX3Byb2dyYW1taW5nIC0gcHJvY2VzcyBhZGRpdGlvbmFsIExSQyBw
cm9ncmFtbWluZw0KPiA+ID4gPiArICogdGFibGUNCj4gPiA+ID4gKyAqIEBod2U6IGVuZ2luZSBp
bnN0YW5jZSB0byBwcm9jZXNzIHdvcmthcm91bmRzIGZvcg0KPiA+ID4gPiArICoNCj4gPiA+ID4g
KyAqIFByb2Nlc3MgYWRkaXRpb25hbCBjb250ZXh0IHByb2dyYW1taW5nIHRhYmxlIGZvciB0aGlz
IHBsYXRmb3JtLCBzYXZpbmcgaW4NCj4gPiA+ID4gKyAqIEBod2UgYWxsIHRoZSByZWdpc3RlcnMg
Y2hhbmdlcyB0aGF0IG5lZWQgdG8gYmUgYXBwbGllZCBvbiBjb250ZXh0IHJlc3RvcmUuDQo+ID4g
PiA+ICsgKi8NCj4gPiA+ID4gK3ZvaWQgeGVfd2FfcHJvY2Vzc19scmNfYWRkaXRpb25hbF9wcm9n
cmFtbWluZyhzdHJ1Y3QgeGVfaHdfZW5naW5lICpod2UpDQo+ID4gPiA+ICt7DQo+ID4gPiA+ICsJ
eGVfcnRwX3Byb2Nlc3MobHJjX2FkZGl0aW9uYWxfcHJvZ3JhbW1pbmcsICZod2UtPnJlZ19scmMs
IGh3ZS0+Z3QsIGh3ZSk7DQo+ID4gPiA+ICt9DQo+ID4gPiA+ICsNCj4gPiA+ID4gIC8qKg0KPiA+
ID4gPiAgICogeGVfcmVnX3doaXRlbGlzdF9wcm9jZXNzX2VuZ2luZSAtIHByb2Nlc3MgdGFibGUg
b2YgcmVnaXN0ZXJzIHRvIHdoaXRlbGlzdA0KPiA+ID4gPiAgICogQGh3ZTogZW5naW5lIGluc3Rh
bmNlIHRvIHByb2Nlc3Mgd2hpdGVsaXN0IGZvcg0KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX3dhLmggYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfd2EuaA0KPiA+ID4g
PiBpbmRleCAxYTA2NTk2OTBhMzIwLi44NzJmM2U0ZGRjNzNjIDEwMDY0NA0KPiA+ID4gPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0veGUveGVfd2EuaA0KPiA+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0veGUveGVfd2EuaA0KPiA+ID4gPiBAQCAtMTIsNiArMTIsNyBAQCBzdHJ1Y3QgeGVfaHdfZW5n
aW5lOw0KPiA+ID4gPiAgdm9pZCB4ZV93YV9wcm9jZXNzX2d0KHN0cnVjdCB4ZV9ndCAqZ3QpOw0K
PiA+ID4gPiAgdm9pZCB4ZV93YV9wcm9jZXNzX2VuZ2luZShzdHJ1Y3QgeGVfaHdfZW5naW5lICpo
d2UpOw0KPiA+ID4gPiAgdm9pZCB4ZV93YV9wcm9jZXNzX2xyYyhzdHJ1Y3QgeGVfaHdfZW5naW5l
ICpod2UpOw0KPiA+ID4gPiArdm9pZCB4ZV93YV9wcm9jZXNzX2xyY19hZGRpdGlvbmFsX3Byb2dy
YW1taW5nKHN0cnVjdCB4ZV9od19lbmdpbmUgKmh3ZSk7DQo+ID4gPiA+IA0KPiA+ID4gPiAgdm9p
ZCB4ZV9yZWdfd2hpdGVsaXN0X3Byb2Nlc3NfZW5naW5lKHN0cnVjdCB4ZV9od19lbmdpbmUgKmh3
ZSk7DQo+ID4gPiA+ICB2b2lkIHhlX3JlZ193aGl0ZWxpc3RfYXBwbHkoc3RydWN0IHhlX2h3X2Vu
Z2luZSAqaHdlKTsNCj4gPiA+ID4gLS0NCj4gPiA+ID4gMi4zOS4xDQo+ID4gPiA+IA0KPiA+ID4g
DQo+ID4gDQoNCg==
