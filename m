Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38CEFCD37B0
	for <intel-xe@archiver.kernel.org>; Mon, 18 Sep 2023 21:20:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA13C10E052;
	Mon, 18 Sep 2023 21:20:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAE9810E052
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Sep 2023 21:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695072019; x=1726608019;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=aFPrKbEKOV9qVoHxouMKRlX9KdxlpEdPcEtW+hB9FG0=;
 b=d+ogWebq+ZqBocWhmDts/IFlqpYP9ORkTJs4sRiDC+HaM64oomZqQz6o
 5YEnlXVhVhoZeWf/GO9K/+rMWgIqfTEroA8rapUiNTXb1Mo0seFHEfifd
 0Od4PzSOUNXP/NaS3lp1FiBpQACySu8mT7nEPsK7zwsFsnBqfFPZKywl6
 0aCsYFd2BhRpIAAl6SPWS6Djg9Pu/txSPjEC00vlumfY5MyCoI88aITFP
 8eXGAIg/N/sfEf814TfacZC1shasAXgz+qsKBOTHAJAM1z9yTPyGOiKl/
 95dvCRZ0aEURdaF4/yZkZHXYDWsMc5Zi+DTwcokaH70h+U2IrTdzin3bU Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="377089520"
X-IronPort-AV: E=Sophos;i="6.02,157,1688454000"; d="scan'208";a="377089520"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 14:20:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="745970108"
X-IronPort-AV: E=Sophos;i="6.02,157,1688454000"; d="scan'208";a="745970108"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Sep 2023 14:20:18 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 18 Sep 2023 14:20:18 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 18 Sep 2023 14:20:18 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 18 Sep 2023 14:20:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eNCjNysG0U2+XbKMdVoMdhAcQlxVt5iQqF8+xjA/GBl+RP1m2B4Mrj1sOhyzp0LA3RU/ekY87r94OOYU6dOplF3n965r1/NZN5cJScppHiWa5Q+4UxlXNfmlpyUCFecSwjmelzROn4ierwLMmrWuBlJnBrqU2hiPsOLpyx4NgB9GnljEnFSZCRrB1UrSB0e4mHGjvFeCKLsPgt0zw0Lwia3mzExxWr597IuJpug5NdB7w6TgR4SdMUfmTCswHEjZJ4nxgvQ8L2fS0xM+EeCAhgUEFnVjhdoG0ozYtL5wQr1hk+3CANtEWzPFfW7co++0FVGrnLcbkVjSslHMMf6qdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aFPrKbEKOV9qVoHxouMKRlX9KdxlpEdPcEtW+hB9FG0=;
 b=EUDIEh2B5Mbb3u9glxQH7yfV9kyVMN+4En39SXIiXz1okVGU34hDos4ErpvbZDPHkbCk6EhddVCxrdPl2C2fNoa2qB0yiWmlN8Y19I8lsgL/jD11CumfcCfqVCtFYHIi4O79d23zTE1Sp0ZWul4HQI7D5vWXJYPnF+0dcJq1PshjeAU8Ujg4z3uSkRl30qTt+wVGeO5n7U9LSg55WOHomsrVvRqC7mgwajsfQO+DsiQ93L6TyYhHGeAgyv6JRm3v6BF4js3G+/Lyn4i4NCdE3j7QzwGsvHNP9y5HAMYBZo2PQpRrVIUShKe6vl3XgzqmSXZvUrx92v/kM75KgEal5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7777.namprd11.prod.outlook.com (2603:10b6:930:71::14)
 by DM4PR11MB6166.namprd11.prod.outlook.com (2603:10b6:8:ad::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.26; Mon, 18 Sep
 2023 21:20:16 +0000
Received: from CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::cf28:4320:6c5e:aec]) by CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::cf28:4320:6c5e:aec%5]) with mapi id 15.20.6792.026; Mon, 18 Sep 2023
 21:20:15 +0000
From: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Hogander, Jouni" <jouni.hogander@intel.com>
Thread-Topic: [Intel-xe] [PATCH 1/4] Revert "FIXME: drm/i915: runtime pm
 changes"
Thread-Index: AQHZ6f4Z9G6dqhGj7UqMHnDOs8MMLLAhF9OA
Date: Mon, 18 Sep 2023 21:20:15 +0000
Message-ID: <a72f92505c3b7367520f4d4245fe40c027ff2381.camel@intel.com>
References: <20230918070100.1387082-1-jouni.hogander@intel.com>
 <20230918070100.1387082-2-jouni.hogander@intel.com>
In-Reply-To: <20230918070100.1387082-2-jouni.hogander@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7777:EE_|DM4PR11MB6166:EE_
x-ms-office365-filtering-correlation-id: 1334a244-5111-4c54-b4df-08dbb88d0d4a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fMCnpoAw/O9ck6fQmWkg+NO31TC8kysdsrqlMqJ3M/SwDWihOV5U4LhcNth8vRd6DDT8fVBCiUcL9F+pJ/LE85kZ+FpErbMItLsP4YjVmdx1ziOLcx1zozsvgg3fJpqRg3eUspMZ0w48HTmJh6EL2NgnYcGf0mjSWWHBERr884QpUG0eZ45UkUJC0Xyip9lgjbiXwq8kyFRfcUct+6UWRpzswsxQa3yww1vurvnR51DknhuosLSfQP7opXkCuojEsz3Z34MfwU5vOTB9AL5NurUZcGNOsDhL2GQgKAVB+kV6GG+HXNnnMjRMJUV3pWF+M3F3N35+IX7xGPXOcEzlqlUdbOmStQzHOHDE7HLrJmNvcJJhLVoZ+xfB1+9sCcP4SrPP8CZORq/T1aOTMPyT3nU+TxVRHTVh158IZyFbMi/M2KnhFkYqlY3eX9LqSzTk4HIZAjUTkK3Npv1yqVQgK9ENTqTxel6Gh2c4/s9eu9ARPc2um2Pj8QLoaxkf5so9MjWtSc1KUntrEhT3mZd4ltOR+Anqt4GWeNLlv3vNWcSmnZTq7aR6Gipalk+WCbyUG8+db2Cze1LedIMb7aB6Trpc4ccavDdp5CaJXn6dOCMNJYUIXB56xEGug7rhae53
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7777.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(376002)(136003)(39860400002)(396003)(1800799009)(186009)(451199024)(26005)(82960400001)(8936002)(2616005)(8676002)(122000001)(83380400001)(2906002)(36756003)(66574015)(86362001)(6506007)(6486002)(478600001)(5660300002)(71200400001)(6636002)(316002)(6512007)(110136005)(76116006)(91956017)(66946007)(64756008)(66446008)(41300700001)(38070700005)(38100700002)(66476007)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MmhnUUMwNndQOUJQUDRCd3I4dnFkVHBROXhCMnhhaUJNTi9FT3VISGh0RERx?=
 =?utf-8?B?Wkt1ekdrY0VXaHJJS3lOOGtpMWVsNDlSd2ozU1JZa3VPWkdLdHRrMlN0ci9k?=
 =?utf-8?B?cXdaKzVzTFN5Qm5uelovdmN4d0Z3MjBPc1dLZVlVcitWWDR0UzBOb1YxOThm?=
 =?utf-8?B?QjFaclRhdWhIcFRYcXJLNEZmbEdUWmZyT0dtTnlCYnl0dGlVNEJMZ3A3eW5C?=
 =?utf-8?B?ZHhGNjdmVU41MWtsN1puZEFweHZiL0gwZU9uNjhuallGWTBFZXJWdXJlV2hT?=
 =?utf-8?B?M2ZVbjZleDBzV0RxWDlOa3N2NW50UDQ1TnpOR2loa0JQNkpUSG96aktHNlZm?=
 =?utf-8?B?QWozZ3JJT29aNXdnUU1nK2xmRFRrV2g4M2pvRUpIaDN3TUEwTlF1SFJWNmNy?=
 =?utf-8?B?NGdYcXFLcWFIWDQyUENSTlZLYnVHQ0hWY3RNMFNOU0xtTHZoYVFKeUtGQjhM?=
 =?utf-8?B?Nld5Y0ZBWlhOZkY4WXJqRWRYRUIyZ1kwTStBbTNJbS9WcTN2anJlMWlHb09Z?=
 =?utf-8?B?bWNVUElvaDArbVEwMUM3UGhJTS9EbjYrSDlBNjlvdG1OWFlCWkRqZmVqSFU0?=
 =?utf-8?B?eGVHblhJQ3pzUlFpT0hVbCs3UU43WG5xMXRUNjhmWUc5ZXZ2SUdPbXhlOE5u?=
 =?utf-8?B?YkljVkJscjFZVi9kSnJaZ3B6U3lucVBnN21FMjBtb3BNMkhnQUtzTFJITEY0?=
 =?utf-8?B?bFg4WlJJcWVWVXZYQysxR3JZUlZoUHV6Ylo2NHdNbjh0SnI3MnNBMzcrci8w?=
 =?utf-8?B?SVRtdW1QQ092ZWFScmVYYzhwRU5CdkFyaGxMN0FXSGRsTVoxU05sM1pybit5?=
 =?utf-8?B?WDllaUtoRVJCdTQ2K083Um92REhnWkxsaCt3TWNpem5zMDBtc2JxK2FTSldz?=
 =?utf-8?B?RytmeFM5TGhkTVZ4aitCUlozT0pGbloxMm01V2xjcDJYSGJSUmxnKy9rYzBM?=
 =?utf-8?B?S0FvUkJUN1k5eHJsaTVnR3hUcFFwaDhrc3Z3ZHAxRnlvZVBNd3VPT1pyWjhZ?=
 =?utf-8?B?bFZtZ3FMTUxpUytzV05rMVJpMElzb2d1VkFlbTFMUU5hUmJKUkwyRzFvRHJT?=
 =?utf-8?B?Ym9UK3NPRk51bTdHb0gzR3FBelFNbmFrWTVUT00wSlpJZ2FLVmNZOUJiYmt5?=
 =?utf-8?B?SlZuYmgvTHBrRGRpbTc0R1BpMGZVc0k2dm42eTlDNWxHQTl1MmM1TjBsTWZ4?=
 =?utf-8?B?NUdKT04xV3g2Y0E2cE81b3NBeXNYQTZRM1p3RkZoVlFSUUxkWkdOZDE2cllk?=
 =?utf-8?B?ZW1DWm9XZ1JmL3grQThOSWNqdFh0QnBwNnd0aFRWTjBLVmUxWkpwOFozcXcv?=
 =?utf-8?B?ZEZIaWM4SkJFU1NRdUJBQVJvaWZ1cHBWZnBRZU11WnRsVWorMHptL0ZCWmhG?=
 =?utf-8?B?WTgzckhWaEpURUZ2M1c1RGdhL2xXR0ZTcGtFamsrN0VzN2JUOEhrMTlEZmg5?=
 =?utf-8?B?dVM2eEh5QzRhenpDRFJaMTM5cnFvbW9tSGR1SFFFODU4R3RzMmRlUzV2WTIv?=
 =?utf-8?B?UXk4cVlHRUhWcjBXbmpsV201a2J2NkZtQTdYNTRnZWV5VDRFL25kUTREazJO?=
 =?utf-8?B?YWxQaHMxRlZJU1huSHJQL1YyeXg5dUlxbTBjMzJnT09ZQXlPdlk5bWFWeDBw?=
 =?utf-8?B?UWVxQ3JMMzdTcDE5dXdwYTV2dTBHd0hQRFlpU3JoMWtNbkI5Wkc0cVhUWTlv?=
 =?utf-8?B?bm1ZMnRQTHZhU25VT3ZpS2JzeVNGMnU5THZxOG10ZDVzcmNKNGNIbEF3YXpZ?=
 =?utf-8?B?UHdiczRNQW03MXRLeU1xOTR6c1l6U1BxdWZyd1QrS3Y4Q3Jzak5NOE1qQ3JD?=
 =?utf-8?B?SnA0T2p5NllSUEloTlh6M3JpVmsyUzZONG8vbzZYV3ptRWNHK0x6ZEdVK0pG?=
 =?utf-8?B?Z21vWDFVdnhYWDJUSmM4NFV4KzNaNURsT2UxVFB1dDhmTzQrOHJQVHhLK2lC?=
 =?utf-8?B?NGFaYitQV240eFJ5cmpzaUIxdVI1UkxNcVJPOUYzbmJGOTBmY3haMyt2dU9G?=
 =?utf-8?B?Qnl6Wno3eS9qbUlhQ0F5ZVlkSzBBeXdzVDZGa25UTFNMbFZVcllRL3AzSDd4?=
 =?utf-8?B?bVM1VkZKNXp4eWM5QTE2dENhZXJjcnJkN2ZBSVFYQ01XNFJ5UHlsZTVoSnpv?=
 =?utf-8?B?K2VNOEFvMjVHUHY2bjUzcDRZWU9HY0hrS3p6MmJKT0FHTHB1cUJaaVBKYzV0?=
 =?utf-8?Q?tK8ppqkyir3MlFzXxVI2rKI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E1D0024EC0A51F4CB4F0C64C656C0222@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7777.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1334a244-5111-4c54-b4df-08dbb88d0d4a
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2023 21:20:15.5873 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: waPI+An2akFmiqqyXSGFtfN1TIYemQ3hCqjM7Pw/9auSk112nZ1wnoIrdu5+UeeCBvLCa8+qeZJMu071PPFv+nc1Lyjg+GAYAQ9cIlR/8PE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6166
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/4] Revert "FIXME: drm/i915: runtime pm
 changes"
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

T24gTW9uLCAyMDIzLTA5LTE4IGF0IDEwOjAwICswMzAwLCBKb3VuaSBIw7ZnYW5kZXIgd3JvdGU6
Cj4gVGhpcyByZXZlcnRzIGNvbW1pdCA3NDJlNDQ5ZGRjYTQzNTg5N2VlYzZkOWMyMWQ0ZDI1NzNi
NzcyNDJkLgo+IAo+IFRoaXMgY2hhbmdlIGlzIG5vdCBuZWVkZWQgYW55bW9yZSBhcyBuZXh0IHBh
dGNoIGlzIGNoYW5naW5nIHRoaXMgdG8KPiB1c2UgcG1fcnVudGltZV9zdXNwZW5kZWQoKSBpbnN0
ZWFkIG9mIGN1c3RvbSBzdXNwZW5kZWQgYm9vbGVhbi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKb3Vu
aSBIw7ZnYW5kZXIgPGpvdW5pLmhvZ2FuZGVyQGludGVsLmNvbT4KPiAtLS0KPiDCoC4uLi9kcm0v
aTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfcG93ZXIuY8KgwqDCoCB8IDIzICsrKysrKysrKyst
LS0tLS0tLS0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlv
bnMoLSkKCkxvb2tzIGdvb2QsCgpSZXZpZXdlZC1ieTogVmlub2QgR292aW5kYXBpbGxhaSA8dmlu
b2QuZ292aW5kYXBpbGxhaUBpbnRlbC5jb20+Cgo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfcG93ZXIuYwo+IGIvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X3Bvd2VyLmMKPiBpbmRleCBjMjU3NTQyZDI2
OWQuLjA2OGRjMjIzNjUzZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNw
bGF5L2ludGVsX2Rpc3BsYXlfcG93ZXIuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfZGlzcGxheV9wb3dlci5jCj4gQEAgLTIxNiwxMCArMjE2LDggQEAgYm9vbCBf
X2ludGVsX2Rpc3BsYXlfcG93ZXJfaXNfZW5hYmxlZChzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAq
ZGV2X3ByaXYsCj4gwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCBpOTE1X3Bvd2VyX3dlbGwgKnBvd2Vy
X3dlbGw7Cj4gwqDCoMKgwqDCoMKgwqDCoGJvb2wgaXNfZW5hYmxlZDsKPiDCoAo+IC0jaWZkZWYg
STkxNQo+IMKgwqDCoMKgwqDCoMKgwqBpZiAoZGV2X3ByaXYtPnJ1bnRpbWVfcG0uc3VzcGVuZGVk
KQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIGZhbHNlOwo+IC0jZW5k
aWYKPiDCoAo+IMKgwqDCoMKgwqDCoMKgwqBpc19lbmFibGVkID0gdHJ1ZTsKPiDCoAo+IEBAIC02
MzgsNiArNjM2LDcgQEAgcmVsZWFzZV9hc3luY19wdXRfZG9tYWlucyhzdHJ1Y3QgaTkxNV9wb3dl
cl9kb21haW5zICpwb3dlcl9kb21haW5zLAo+IMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgZHJtX2k5
MTVfcHJpdmF0ZSAqZGV2X3ByaXYgPQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
Y29udGFpbmVyX29mKHBvd2VyX2RvbWFpbnMsIHN0cnVjdCBkcm1faTkxNV9wcml2YXRlLAo+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRp
c3BsYXkucG93ZXIuZG9tYWlucyk7Cj4gK8KgwqDCoMKgwqDCoMKgc3RydWN0IGludGVsX3J1bnRp
bWVfcG0gKnJwbSA9ICZkZXZfcHJpdi0+cnVudGltZV9wbTsKPiDCoMKgwqDCoMKgwqDCoMKgZW51
bSBpbnRlbF9kaXNwbGF5X3Bvd2VyX2RvbWFpbiBkb21haW47Cj4gwqDCoMKgwqDCoMKgwqDCoGlu
dGVsX3dha2VyZWZfdCB3YWtlcmVmOwo+IMKgCj4gQEAgLTY0Niw4ICs2NDUsOCBAQCByZWxlYXNl
X2FzeW5jX3B1dF9kb21haW5zKHN0cnVjdCBpOTE1X3Bvd2VyX2RvbWFpbnMgKnBvd2VyX2RvbWFp
bnMsCj4gwqDCoMKgwqDCoMKgwqDCoCAqIHdha2VyZWYgdG8gbWFrZSB0aGUgc3RhdGUgY2hlY2tl
ciBoYXBweSBhYm91dCB0aGUgSFcgYWNjZXNzIGR1cmluZwo+IMKgwqDCoMKgwqDCoMKgwqAgKiBw
b3dlciB3ZWxsIGRpc2FibGluZy4KPiDCoMKgwqDCoMKgwqDCoMKgICovCj4gLcKgwqDCoMKgwqDC
oMKgYXNzZXJ0X3JwbV9yYXdfd2FrZXJlZl9oZWxkKCZkZXZfcHJpdi0+cnVudGltZV9wbSk7Cj4g
LcKgwqDCoMKgwqDCoMKgd2FrZXJlZiA9IGludGVsX3J1bnRpbWVfcG1fZ2V0KCZkZXZfcHJpdi0+
cnVudGltZV9wbSk7Cj4gK8KgwqDCoMKgwqDCoMKgYXNzZXJ0X3JwbV9yYXdfd2FrZXJlZl9oZWxk
KHJwbSk7Cj4gK8KgwqDCoMKgwqDCoMKgd2FrZXJlZiA9IGludGVsX3J1bnRpbWVfcG1fZ2V0KHJw
bSk7Cj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKgZm9yX2VhY2hfcG93ZXJfZG9tYWluKGRvbWFpbiwg
bWFzaykgewo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLyogQ2xlYXIgYmVmb3Jl
IHB1dCwgc28gcHV0J3Mgc2FuaXR5IGNoZWNrIGlzIGhhcHB5LiAqLwo+IEBAIC02NTUsNyArNjU0
LDcgQEAgcmVsZWFzZV9hc3luY19wdXRfZG9tYWlucyhzdHJ1Y3QgaTkxNV9wb3dlcl9kb21haW5z
ICpwb3dlcl9kb21haW5zLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgX19pbnRl
bF9kaXNwbGF5X3Bvd2VyX3B1dF9kb21haW4oZGV2X3ByaXYsIGRvbWFpbik7Cj4gwqDCoMKgwqDC
oMKgwqDCoH0KPiDCoAo+IC3CoMKgwqDCoMKgwqDCoGludGVsX3J1bnRpbWVfcG1fcHV0KCZkZXZf
cHJpdi0+cnVudGltZV9wbSwgd2FrZXJlZik7Cj4gK8KgwqDCoMKgwqDCoMKgaW50ZWxfcnVudGlt
ZV9wbV9wdXQocnBtLCB3YWtlcmVmKTsKPiDCoH0KPiDCoAo+IMKgc3RhdGljIHZvaWQKPiBAQCAt
NjY1LDcgKzY2NCw4IEBAIGludGVsX2Rpc3BsYXlfcG93ZXJfcHV0X2FzeW5jX3dvcmsoc3RydWN0
IHdvcmtfc3RydWN0ICp3b3JrKQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgY29u
dGFpbmVyX29mKHdvcmssIHN0cnVjdCBkcm1faTkxNV9wcml2YXRlLAo+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRpc3BsYXkucG93ZXIu
ZG9tYWlucy5hc3luY19wdXRfd29yay53b3JrKTsKPiDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IGk5
MTVfcG93ZXJfZG9tYWlucyAqcG93ZXJfZG9tYWlucyA9ICZkZXZfcHJpdi0+ZGlzcGxheS5wb3dl
ci5kb21haW5zOwo+IC3CoMKgwqDCoMKgwqDCoGludGVsX3dha2VyZWZfdCBuZXdfd29ya193YWtl
cmVmID0gaW50ZWxfcnVudGltZV9wbV9nZXRfcmF3KCZkZXZfcHJpdi0+cnVudGltZV9wbSk7Cj4g
K8KgwqDCoMKgwqDCoMKgc3RydWN0IGludGVsX3J1bnRpbWVfcG0gKnJwbSA9ICZkZXZfcHJpdi0+
cnVudGltZV9wbTsKPiArwqDCoMKgwqDCoMKgwqBpbnRlbF93YWtlcmVmX3QgbmV3X3dvcmtfd2Fr
ZXJlZiA9IGludGVsX3J1bnRpbWVfcG1fZ2V0X3JhdyhycG0pOwo+IMKgwqDCoMKgwqDCoMKgwqBp
bnRlbF93YWtlcmVmX3Qgb2xkX3dvcmtfd2FrZXJlZiA9IDA7Cj4gwqAKPiDCoMKgwqDCoMKgwqDC
oMKgbXV0ZXhfbG9jaygmcG93ZXJfZG9tYWlucy0+bG9jayk7Cj4gQEAgLTcwNiw5ICs3MDYsOSBA
QCBpbnRlbF9kaXNwbGF5X3Bvd2VyX3B1dF9hc3luY193b3JrKHN0cnVjdCB3b3JrX3N0cnVjdCAq
d29yaykKPiDCoMKgwqDCoMKgwqDCoMKgbXV0ZXhfdW5sb2NrKCZwb3dlcl9kb21haW5zLT5sb2Nr
KTsKPiDCoAo+IMKgwqDCoMKgwqDCoMKgwqBpZiAob2xkX3dvcmtfd2FrZXJlZikKPiAtwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaW50ZWxfcnVudGltZV9wbV9wdXRfcmF3KCZkZXZfcHJp
di0+cnVudGltZV9wbSwgb2xkX3dvcmtfd2FrZXJlZik7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoGludGVsX3J1bnRpbWVfcG1fcHV0X3JhdyhycG0sIG9sZF93b3JrX3dha2VyZWYp
Owo+IMKgwqDCoMKgwqDCoMKgwqBpZiAobmV3X3dvcmtfd2FrZXJlZikKPiAtwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgaW50ZWxfcnVudGltZV9wbV9wdXRfcmF3KCZkZXZfcHJpdi0+cnVu
dGltZV9wbSwgbmV3X3dvcmtfd2FrZXJlZik7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoGludGVsX3J1bnRpbWVfcG1fcHV0X3JhdyhycG0sIG5ld193b3JrX3dha2VyZWYpOwo+IMKg
fQo+IMKgCj4gwqAvKioKPiBAQCAtNzMwLDcgKzczMCw4IEBAIHZvaWQgX19pbnRlbF9kaXNwbGF5
X3Bvd2VyX3B1dF9hc3luYyhzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqaTkxNSwKPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgaW50IGRlbGF5X21zKQo+IMKgewo+IMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgaTkx
NV9wb3dlcl9kb21haW5zICpwb3dlcl9kb21haW5zID0gJmk5MTUtPmRpc3BsYXkucG93ZXIuZG9t
YWluczsKPiAtwqDCoMKgwqDCoMKgwqBpbnRlbF93YWtlcmVmX3Qgd29ya193YWtlcmVmID0gaW50
ZWxfcnVudGltZV9wbV9nZXRfcmF3KCZpOTE1LT5ydW50aW1lX3BtKTsKPiArwqDCoMKgwqDCoMKg
wqBzdHJ1Y3QgaW50ZWxfcnVudGltZV9wbSAqcnBtID0gJmk5MTUtPnJ1bnRpbWVfcG07Cj4gK8Kg
wqDCoMKgwqDCoMKgaW50ZWxfd2FrZXJlZl90IHdvcmtfd2FrZXJlZiA9IGludGVsX3J1bnRpbWVf
cG1fZ2V0X3JhdyhycG0pOwo+IMKgCj4gwqDCoMKgwqDCoMKgwqDCoGRlbGF5X21zID0gZGVsYXlf
bXMgPj0gMCA/IGRlbGF5X21zIDogMTAwOwo+IMKgCj4gQEAgLTc2Miw5ICs3NjMsOSBAQCB2b2lk
IF9faW50ZWxfZGlzcGxheV9wb3dlcl9wdXRfYXN5bmMoc3RydWN0IGRybV9pOTE1X3ByaXZhdGUg
Kmk5MTUsCj4gwqDCoMKgwqDCoMKgwqDCoG11dGV4X3VubG9jaygmcG93ZXJfZG9tYWlucy0+bG9j
ayk7Cj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKgaWYgKHdvcmtfd2FrZXJlZikKPiAtwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgaW50ZWxfcnVudGltZV9wbV9wdXRfcmF3KCZpOTE1LT5ydW50
aW1lX3BtLCB3b3JrX3dha2VyZWYpOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBp
bnRlbF9ydW50aW1lX3BtX3B1dF9yYXcocnBtLCB3b3JrX3dha2VyZWYpOwo+IMKgCj4gLcKgwqDC
oMKgwqDCoMKgaW50ZWxfcnVudGltZV9wbV9wdXQoJmk5MTUtPnJ1bnRpbWVfcG0sIHdha2VyZWYp
Owo+ICvCoMKgwqDCoMKgwqDCoGludGVsX3J1bnRpbWVfcG1fcHV0KHJwbSwgd2FrZXJlZik7Cj4g
wqB9Cj4gwqAKPiDCoC8qKgoK
