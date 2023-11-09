Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34E2CC4332F
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 15:36:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19FC410E8D2;
	Thu,  9 Nov 2023 15:35:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12FF010E8D8
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Nov 2023 15:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699544148; x=1731080148;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=gFjgtXhPfKP4rNN6ROnVIxjgxqtpczPp5HnYzZpByms=;
 b=e14afG8xM7o4A5Dizt/mL85wbzU/UK6jn9X22gUpIKX7HcP2q9JF4l8Q
 Ktig0VLPST7A8472K55IofUs/Cm6UKDo/Id5sR5pqFdsNpznZAXg39KAo
 1BB2lunSuYhzU/71/D7wALwUXD7UmwLvbPL78pxGkISvzDZBCzl7/2u3h
 X/l02Itk6OPuKG5tJ5Tfg7t9l2f0dK9GT9oyXcLHMclB7tLxNOefzatxc
 SZ5vixqEpRN5crsj4TPalb7Lkmsb8t8hEMHaT3d8PLcZdano+ogz2R1rR
 mtSdXxIRZ07QCo7BeY+CMX5IQk2NYeYCGKC/5Sbdqqygv4zgyQi2YJx92 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="476235494"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="476235494"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 07:35:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="792579210"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="792579210"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Nov 2023 07:35:46 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 9 Nov 2023 07:35:45 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 9 Nov 2023 07:35:45 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 9 Nov 2023 07:35:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T/ZKLtG/9bMJO5M0R8LMhyLdcDi/DahahqVlsYrYc6XJ0eB9HEgkWmEsYOlpioDtDr5yXX3MSNOPvkyiDENWgvAm8blM4m19sjaawSbvKNskPpy8Bcql8lj+672Zg8Jr01Fsc/RNuoLBOtkWI9woSpYnuD6CdhCNXxQuEjV7q8ObFlw3vJVSOnocJR+KNdGPw4GSo775IhOR4UG7hsLcmyhSrJ6hyHrixVuhtSJRWEe8l2MYIy5ieqG6R/5vKJSZB2+2VtaRvvxqNtuoqPs6PZv4VE3IvZaRVuwd9L6Ir/7dMQMdU3svix8ag6ueQ3wQY7/CVDkY++sCuIftey29WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gFjgtXhPfKP4rNN6ROnVIxjgxqtpczPp5HnYzZpByms=;
 b=WWh4MXc0SIWFlYMadas0am8zSzPK+9TIIOzdlxkvw+DKtwn9/qhDQJ+K+DC4Bd7/XBD0dutW+v93d/NLsDeHMnmD79YeZHBAtjpVpcR3I1+eWPPrX7zrPLAI1JQlqtcSUL9DeyO/QN650LoawUcfUFoSWjCZmfQ3of1/1+pjT4L8iJuiD2G/JBKvJITdXPR0klj0xuyqt9qJjj46ZDG71RYswi3MoxPnCV6DmXkVrJK6sY9moOBfKsgkTpsmFQCSfinN9wxg0RX0zFRAjx29Ky19GdLoG5CqWbmfZwUVkQfl69TAQf6iPlmPq8y2ADE6HIEf2RPbJYWi8CcjoBZ21A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by DM6PR11MB4692.namprd11.prod.outlook.com (2603:10b6:5:2aa::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Thu, 9 Nov
 2023 15:35:41 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::78d8:6f60:e1a1:7b15]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::78d8:6f60:e1a1:7b15%6]) with mapi id 15.20.6954.028; Thu, 9 Nov 2023
 15:35:41 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Dugast, Francois" <francois.dugast@intel.com>
Thread-Topic: [Intel-xe] [PATCH v2 49/50] drm/xe/uapi: Add block diagram of a
 device
Thread-Index: AQHaDmMnLJjTCuSY/UCzVsGJEtDkl7ByKAAA
Date: Thu, 9 Nov 2023 15:35:41 +0000
Message-ID: <5cf9034f430f3236ea32510fff17fc3b8db78746.camel@intel.com>
References: <20231103143456.7-1-francois.dugast@intel.com>
 <20231103143456.7-50-francois.dugast@intel.com>
In-Reply-To: <20231103143456.7-50-francois.dugast@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|DM6PR11MB4692:EE_
x-ms-office365-filtering-correlation-id: 79ccadf2-b631-4076-1a8e-08dbe13987d5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7Uuj3l6oJlEjx4JloMU1e0GN27c1h/xsQLW3igQIGrMsOyY7dhB9mNmxHxO95yPEg1K7eu5S1KNz4pRA6g/lcF+oygZWt6FXvUQEQU/5svCmc53/SOHn6IbiOmyrI5SjIKv/0JL3JOCQP+dpYKZdFv3EKTLFiWipYPPZp40VwLV7qlCSu/tMBgLtD5Sa06moYEXa9kNfEuN6zH1n0vo5/q3z9pRhiRe94+81wQNxyxWGjlcxw6sCU5QBJjeFcJE8feuHcJanPvQSnjh7yY6IPh6rfBc5wegl4snyzF253Gef8RvkQG1RAkbQ9i+5n47b0uC2jjq6gsp/WFvwxH8oLzFArF42TmWK8kw7Awn61ZnXO3HafodvFYlKiPv/AFHFfAbdCu7aV5rXfrzG2vSMZ0Gov48arllUObcrzIxIaNb19IbZX/UBhW//YieiQKXB3hzQ0WsAKwrO9fLS1qdqcLkjSa1qfeAyfKBh52Ku+30AhKQg420vj3Kq4wLJOCbPW3hume9sARwp4B0X339nYk3FEJd5nonGecHAQ2JQlHHzInh89IGCGNAQRBkIgl0isnX70ZsSU5edctSR6iIjVNcRBydqEjTc6Zj4Ho64E60DOnwti/kGzcajwkviiFOh
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(366004)(136003)(346002)(396003)(230922051799003)(186009)(451199024)(64100799003)(1800799009)(6512007)(71200400001)(6486002)(478600001)(6506007)(26005)(83380400001)(66446008)(66556008)(66476007)(64756008)(6636002)(316002)(91956017)(110136005)(76116006)(38100700002)(66946007)(2616005)(122000001)(5660300002)(82960400001)(8676002)(8936002)(41300700001)(36756003)(86362001)(2906002)(38070700009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T3lQSmJOY2pNVDNMWXFXNHBDbGR6VTVyM1JZZVArZ0ZsQnlBb3hlNVl3N3Vo?=
 =?utf-8?B?emJnWU81b3lGSjlBT2VOd3B6NUlZRU4ycXMwdGt4Zmt3dVVKc09wbE1SKzM5?=
 =?utf-8?B?Um1xbUExZjBpSWdGM1lpSU9Pd1VaTm05Z0dPSkRyOGdCQ3BySi9MWWhoTTRJ?=
 =?utf-8?B?WWZFUFlFR3QrdmVEWHBJbDBKNU9tekgvbVNDWDBwNHFUVzYyM3JMOTBHR2Ru?=
 =?utf-8?B?anh0RWFPMVQ0YzVick9pQ3BLYUEwRFhyTEpDY2NoZyttaXRUMXJ1MWpnbXpr?=
 =?utf-8?B?VkNWaXQrUTBVRVRjb0JpWTI4R0VEWnNDNzdjY2cxVFZXejE5Wmp5Wkw5QlRX?=
 =?utf-8?B?QThUblc2VTZ2L1NpM1l2S0VBdDduUkFaZnFmdThFODRockQvMFY4aGI0eE1m?=
 =?utf-8?B?NDN6WTdXMEpmM2tHSUZkdk0vc3p4aGdlZkpLUHFnakNyREJmSXNzS2d3ZTRm?=
 =?utf-8?B?c05CRHRZMTNBcVZFYU5vaGt3U0lNc1J1b29TN3dBUExFNFhTRDVidWRCWkJn?=
 =?utf-8?B?SGVadFpCTFl5a3JoaTNOMkZJN2hhS2ZBVW9KUm84NzFWMDRJNHcwQWlBRThS?=
 =?utf-8?B?c2toTy84K2ZSdFRScnhNQTBWdGFUVWN1QWltSjNXZkdHcHRsdVVLRGp4QlJX?=
 =?utf-8?B?KzMzNTF3b05UcFlFZDlaMVJBbXErclNJZW96Z3pRTlNOdDBrR2dKSWtJb0Zv?=
 =?utf-8?B?dEQzZVBKZ1pwNVFJODRvYkdIN2FiYU5NTmVZU3VXVUhMRUUxbk5nZFNucGVv?=
 =?utf-8?B?WHpIV25LNGVFNm8wa3Y4cVVzbUtKMFFkUFJBVi9qVCswU2Y1bit4M0RmQzBz?=
 =?utf-8?B?V0ZlZi9yMFc0MGxpellkeXEwcWJZZVYwMkYwb01kdElrVFNPNitjdENPSHVo?=
 =?utf-8?B?NFdCQ1NreVk2Q01uZUIzaTA0cEZBZG5LRGFSajVIcVZMTEJNSmNRZHpUWUNw?=
 =?utf-8?B?SXZoaUpCQy82WjY5ZG12VG5VR3ZjaXBWTERkbEg2eDF2Z0Z1b3V6NHR2Q1Np?=
 =?utf-8?B?U05ZekZOYWl1SnhBd0k2Zno1cmVyeHI5RVJxUDN0aHhsbFV0dUl5UUJJbTlD?=
 =?utf-8?B?dDFKU1RPVjN5MXlJUDNBZE1tSUpEelExaytXRUlTUTRlbnR0VjRJNVlPTDR5?=
 =?utf-8?B?d1JWNGdhU3gxUk4ranFsSnJ5cUZGdzZ6Z2tYMmJOUUw4b1V0MHY1ZmFMOW8y?=
 =?utf-8?B?a05TYTRYTS9VTldYUlJlOEVXU3pZaGNrbDZyZkpSdUtCMkpuc0JROGg0bmhl?=
 =?utf-8?B?cWZTSzZFSThVTUloTVRxUmxiQ0JvTGFhemcwWS95dUw5SkVvY2M4M0ppVTV6?=
 =?utf-8?B?Zk9TT2ZHajd1aGNOMDY4VVhtdEZzcVVOWmZDemMxcnRKbVhWTlZDeHJ3UVNZ?=
 =?utf-8?B?bDN3UnBISHdSQ2x2VVRBNys1ZWFWKzVCRU0rUFZ3bmEzT25GL1NxWmJ1ckRo?=
 =?utf-8?B?RG8vT0hhSWpNcVVUWTRySzltSUpnZUFNa2RnS2MrbkJhU1l0d1FNYkRjakp6?=
 =?utf-8?B?cnB6bVNDZ1hPcXJ1MHJhd2F1RzNjd21WL21kRjBtLzRuZEV4eWVDUi9vc3h6?=
 =?utf-8?B?OTBpV0dQcytTTUUycDFhOTgzSUQrN0puOWJpMmhIeEg5OXNnVjRyN2FQVWk2?=
 =?utf-8?B?Y3Jrc0FHU1ZNcUZHeWJFYjZEbTJOTWVQWHdsUUU4dUpXVVNqVlNhWjBHR1ZO?=
 =?utf-8?B?QzdzQmI3cFd4a3ArVFlHNjdMbVZMTlFJQ2puSHJEdFhSbWhBV29xcWo0RXFQ?=
 =?utf-8?B?YUZzOEx3NEZIL0RwdkljR255K1dkTHlNN29YRXhMTzc0TGRRWncrdkVWSFhO?=
 =?utf-8?B?U0ZzVTluK1g4bDU3WXllNVNTdkFnbmI2TWxvR05IR1ptOVRGWFpBL0ZYUE1W?=
 =?utf-8?B?a09NL281cC95RFZ6cTFaSlpoaDBFZ3FqWVRHOEliMDJEMEpTSE9vNXREVVpE?=
 =?utf-8?B?MHg3elhHMmovaVFnVGpTT1k0MXhPKzZpLzZwZVhIdVhmZU5wbEoxemVNSlFk?=
 =?utf-8?B?bU5nVld5bVdNVkZhdC9ENnF6MGUvbTk5NzNxTWxKTkRSUHdLTDIvUTFpbUZD?=
 =?utf-8?B?cEdod2VYVktGTzdGZmVheEVCVWFqNnFTbER3WjV6cjRnZno4ekhQVTBjNkRY?=
 =?utf-8?Q?VgaEFzLoa5n3qIkjA4hCZLUxM?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4BA9A9A519EF87498CE6237B2FF2A1EC@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79ccadf2-b631-4076-1a8e-08dbe13987d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2023 15:35:41.1285 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UkgBhokPyiltHdOTasXEC02X744K4mHVl9O5+4jSgGFJsgGVkHAW4LKUNJ8NHPpbFKevIcNNNNjT+/zEN+CAcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4692
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 49/50] drm/xe/uapi: Add block diagram of a
 device
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

T24gRnJpLCAyMDIzLTExLTAzIGF0IDE0OjM0ICswMDAwLCBGcmFuY29pcyBEdWdhc3Qgd3JvdGU6
Cj4gSW4gb3JkZXIgdG8gbWFrZSBwcm9wZXIgdXNlIHRoZSB1QVBJLCBhIHByZXJlcXVpc2l0ZSBp
cyB0byB1bmRlcnN0YW5kCj4gc29tZSBrZXkgY29uY2VwdHMgYWJvdXQgdGhlIGRpc2NyZXRlIEdQ
VSBkZXZpY2VzIHdoaWNoIGFyZSBzdXBwb3J0ZWQKPiBieSB0aGUgWGUgZHJpdmVyLiBGb3IgZXhh
bXBsZSwgc29tZSBzdHJ1Y3RzIGRlZmluZWQgaW4gdGhlIHVBUEkgYXJlIGFuCj4gYWJzdHJhY3Rp
b24gb2YgYSBoYXJkd2FyZSBjb21wb25lbnQgd2l0aCBhIHNwZWNpZmljIHJvbGUuCj4gCj4gVGhp
cyBkaWFncmFtIGhlbHBzIHRvIGJ1aWxkIGEgbWVudGFsIHJlcHJlc2VudGF0aW9uIG9mIGEgZGV2
aWNlIGhvdyBpdAo+IGlzIHNlZW4gYnkgdGhlIFhlIGRyaXZlci4gQXMgd3JpdHRlbiBpbiB0aGUg
ZG9jdW1lbnRhdGlvbiwgaXQgZG9lcyBub3QKPiBpbnRlbmQgdG8gYmUgYSBsaXRlcmFsIHJlcHJl
c2VudGF0aW9uIG9mIGFuIGV4aXN0aW5nIGRldmljZS4gQSBsb3QKPiBtb3JlIGluZm9ybWF0aW9u
IGNvdWxkIGJlIGFkZGVkIGJ1dCB0aGUgaW50ZW50aW9uIGZvciB0aGUgb3ZlcnZpZXcgaXMKPiB0
byBrZWVwIGl0IHNpbXBsZSwgYW5kIGdvIGludG8gZGV0YWlsIGFzIG5lZWRlZCBpbiBvdGhlciBz
ZWN0aW9ucy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBGcmFuY29pcyBEdWdhc3QgPGZyYW5jb2lzLmR1
Z2FzdEBpbnRlbC5jb20+Cj4gLS0tCj4gIGluY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmggfCA0MSAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQs
IDQxIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2RybS94ZV9k
cm0uaCBiL2luY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmgKPiBpbmRleCA4NWRjMGQzNDNlYTguLjBi
YWI1M2YyYmVkOSAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oCj4gKysr
IGIvaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaAo+IEBAIC0yOCw2ICsyOCw0NyBAQCBleHRlcm4g
IkMiIHsKPiAgICoKPiAgICovCj4gIAo+ICsvKioKPiArICogRE9DOiBYZSBEZXZpY2UgQmxvY2sg
RGlhZ3JhbQo+ICsgKgo+ICsgKiBUaGUgZGlhZ3JhbSBiZWxvdyByZXByZXNlbnRzIGEgaGlnaC1s
ZXZlbCBzaW1wbGlmaWNhdGlvbiBvZiBhIGRpc2NyZXRlCj4gKyAqIEdQVSBzdXBwb3J0ZWQgYnkg
dGhlIFhlIGRyaXZlci4gSXQgc2hvd3Mgc29tZSBkZXZpY2UgY29tcG9uZW50cyB3aGljaAo+ICsg
KiBhcmUgbmVjZXNzYXJ5IHRvIHVuZGVyc3RhbmQgdGhpcyBBUEksIGFzIHdlbGwgYXMgaG93IHRo
ZWlyIHJlbGF0aW9ucwo+ICsgKiB0byBlYWNoIG90aGVyLiBUaGlzIGRpYWdyYW0gZG9lcyBub3Qg
cmVwcmVzZW50IHJlYWwgaGFyZHdhcmU6Ogo+ICsgKgo+ICsgKiAgIOKUjOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUkAo+ICsgKiAgIOKUgiDilIzilIDilIDilIDilIDilIDilIDilIDilIDi
lIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDi
lIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDi
lIDilIDilIDilIDilJAg4pSM4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSQIOKUggo+ICsg
KiAgIOKUgiDilIIgICAgICAgICAgICAgIOKUjOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUkCAgICAgICAgICAg4pSC
IOKUgiDilIzilIDilIDilIDilIDilIDilJAg4pSCIOKUggo+ICsgKiAgIOKUgiDilIIgICAgICAg
ICAgICAgIOKUgiAgICAgICAgIFZSQU0wICAgICAgICAg4pSCICAgICAgICAgICDilIIg4pSCIOKU
glZSQU0x4pSCIOKUgiDilIIKPiArICogICDilIIg4pSCICAgICAgICAgICAgICDilJTilIDilIDi
lIDilIDilIDilIDilIDilIDilIDilIDilIDilKzilIDilIDilIDilIDilIDilIDilIDilIDilIDi
lIDilIDilJggICAgICAgICAgIOKUgiDilIIg4pSU4pSA4pSA4pSs4pSA4pSA4pSYIOKUgiDilIIK
PiArICogICDilIIg4pSCIOKUjOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUtOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUkCDilIIg4pSCIOKU
jOKUgOKUgOKUtOKUgOKUgOKUkCDilIIg4pSCCj4gKyAqICAg4pSCIOKUgiDilIIg4pSM4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pSQICDilIzilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDi
lIDilJAg4pSCIOKUgiDilIIg4pSCICAgICDilIIg4pSCIOKUggo+ICsgKiAgIOKUgiDilIIg4pSC
IOKUgiDilIzilIDilIDilJAg4pSM4pSA4pSA4pSQIOKUjOKUgOKUgOKUkCDilIzilIDilIDilJAg
4pSCICDilIIg4pSM4pSA4pSA4pSA4pSA4pSA4pSQIOKUjOKUgOKUgOKUgOKUgOKUgOKUkCDilIIg
4pSCIOKUgiDilIIg4pSCICAgICDilIIg4pSCIOKUggo+ICsgKiAgIOKUgiDilIIg4pSCIOKUgiDi
lIJFVeKUgiDilIJFVeKUgiDilIJFVeKUgiDilIJFVeKUgiDilIIgIOKUgiDilIJSQ1MwIOKUgiDi
lIJCQ1MwIOKUgiDilIIg4pSCIOKUgiDilIIg4pSCICAgICDilIIg4pSCIOKUggo+ICsgKiAgIOKU
giDilIIg4pSCIOKUgiDilJTilIDilIDilJgg4pSU4pSA4pSA4pSYIOKUlOKUgOKUgOKUmCDilJTi
lIDilIDilJgg4pSCICDilIIg4pSU4pSA4pSA4pSA4pSA4pSA4pSYIOKUlOKUgOKUgOKUgOKUgOKU
gOKUmCDilIIg4pSCIOKUgiDilIIg4pSCICAgICDilIIg4pSCIOKUggo+ICsgKiAgIOKUgiDilIIg
4pSCIOKUgiDilIzilIDilIDilJAg4pSM4pSA4pSA4pSQIOKUjOKUgOKUgOKUkCDilIzilIDilIDi
lJAg4pSCICDilIIg4pSM4pSA4pSA4pSA4pSA4pSA4pSQIOKUjOKUgOKUgOKUgOKUgOKUgOKUkCDi
lIIg4pSCIOKUgiDilIIg4pSCICAgICDilIIg4pSCIOKUggo+ICsgKiAgIOKUgiDilIIg4pSCIOKU
giDilIJFVeKUgiDilIJFVeKUgiDilIJFVeKUgiDilIJFVeKUgiDilIIgIOKUgiDilIJWQ1MwIOKU
giDilIJWQ1MxIOKUgiDilIIg4pSCIOKUgiDilIIg4pSCICAgICDilIIg4pSCIOKUggo+ICsgKiAg
IOKUgiDilIIg4pSCIOKUgiDilJTilIDilIDilJgg4pSU4pSA4pSA4pSYIOKUlOKUgOKUgOKUmCDi
lJTilIDilIDilJgg4pSCICDilIIg4pSU4pSA4pSA4pSA4pSA4pSA4pSYIOKUlOKUgOKUgOKUgOKU
gOKUgOKUmCDilIIg4pSCIOKUgiDilIIg4pSCICAgICDilIIg4pSCIOKUggo+ICsgKiAgIOKUgiDi
lIIg4pSCIOKUgiDilIzilIDilIDilJAg4pSM4pSA4pSA4pSQIOKUjOKUgOKUgOKUkCDilIzilIDi
lIDilJAg4pSCICDilIIg4pSM4pSA4pSA4pSA4pSA4pSA4pSQIOKUjOKUgOKUgOKUgOKUgOKUgOKU
kCDilIIg4pSCIOKUgiDilIIg4pSCICAgICDilIIg4pSCIOKUggo+ICsgKiAgIOKUgiDilIIg4pSC
IOKUgiDilIJFVeKUgiDilIJFVeKUgiDilIJFVeKUgiDilIJFVeKUgiDilIIgIOKUgiDilIJWRUNT
MOKUgiDilIJWRUNTMeKUgiDilIIg4pSCIOKUgiDilIIg4pSCIC4uLiDilIIg4pSCIOKUggo+ICsg
KiAgIOKUgiDilIIg4pSCIOKUgiDilJTilIDilIDilJgg4pSU4pSA4pSA4pSYIOKUlOKUgOKUgOKU
mCDilJTilIDilIDilJgg4pSCICDilIIg4pSU4pSA4pSA4pSA4pSA4pSA4pSYIOKUlOKUgOKUgOKU
gOKUgOKUgOKUmCDilIIg4pSCIOKUgiDilIIg4pSCICAgICDilIIg4pSCIOKUggo+ICsgKiAgIOKU
giDilIIg4pSCIOKUgiDilIzilIDilIDilJAg4pSM4pSA4pSA4pSQIOKUjOKUgOKUgOKUkCDilIzi
lIDilIDilJAg4pSCICDilIIg4pSM4pSA4pSA4pSA4pSA4pSA4pSQIOKUjOKUgOKUgOKUgOKUgOKU
gOKUkCDilIIg4pSCIOKUgiDilIIg4pSCICAgICDilIIg4pSCIOKUggo+ICsgKiAgIOKUgiDilIIg
4pSCIOKUgiDilIJFVeKUgiDilIJFVeKUgiDilIJFVeKUgiDilIJFVeKUgiDilIIgIOKUgiDilIJD
Q1MwIOKUgiDilIJDQ1MxIOKUgiDilIIg4pSCIOKUgiDilIIg4pSCICAgICDilIIg4pSCIOKUggo+
ICsgKiAgIOKUgiDilIIg4pSCIOKUgiDilJTilIDilIDilJgg4pSU4pSA4pSA4pSYIOKUlOKUgOKU
gOKUmCDilJTilIDilIDilJgg4pSCICDilIIg4pSU4pSA4pSA4pSA4pSA4pSA4pSYIOKUlOKUgOKU
gOKUgOKUgOKUgOKUmCDilIIg4pSCIOKUgiDilIIg4pSCICAgICDilIIg4pSCIOKUggo+ICsgKiAg
IOKUgiDilIIg4pSCIOKUlOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgERTU+KUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUmCAg4pSCIOKUjOKUgOKUgOKUgOKUgOKUgOKUkCDilIzilIDilIDi
lIDilIDilIDilJAg4pSCIOKUgiDilIIg4pSCIOKUgiAgICAg4pSCIOKUgiDilIIKPiArICogICDi
lIIg4pSCIOKUgiAgICAgICAgICAgICAgICAgICAgICAgICAg4pSCIOKUgkNDUzIg4pSCIOKUgkND
UzMg4pSCIOKUgiDilIIg4pSCIOKUgiDilIIgICAgIOKUgiDilIIg4pSCCj4gKyAqICAg4pSCIOKU
giDilIIg4pSM4pSA4pSA4pSA4pSA4pSA4pSQIOKUjOKUgOKUgOKUgOKUgOKUgOKUkCDilIzilIDi
lIDilIDilIDilIDilJAgIOKUgiDilJTilIDilIDilIDilIDilIDilJgg4pSU4pSA4pSA4pSA4pSA
4pSA4pSYIOKUgiDilIIg4pSCIOKUgiDilIIgICAgIOKUgiDilIIg4pSCCj4gKyAqICAg4pSCIOKU
giDilIIg4pSCIC4uLiDilIIg4pSCIC4uLiDilIIg4pSCIC4uLiDilIIgIOKUgiAgICAgICAgICAg
ICAgICAg4pSCIOKUgiDilIIg4pSCIOKUgiAgICAg4pSCIOKUgiDilIIKPiArICogICDilIIg4pSC
IOKUgiDilJTilIBEU1PilIDilJgg4pSU4pSARFNT4pSA4pSYIOKUlOKUgERTU+KUgOKUmCAg4pSU
4pSA4pSA4pSA4pSA4pSARW5naW5lc+KUgOKUgOKUgOKUgOKUgOKUmCDilIIg4pSCIOKUgiDilIIg
ICAgIOKUgiDilIIg4pSCCj4gKyAqICAg4pSCIOKUgiDilJTilIDilIDilIDilIDilIDilIDilIDi
lIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDi
lIBHVDDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilJgg
4pSCIOKUgiDilJTilIBHVDHilIDilJgg4pSCIOKUggo+ICsgKiAgIOKUgiDilJTilIDilIDilIDi
lIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDi
lIDilIDilIDilIDilIDilIBUaWxlMOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUmCDilJTilIAgVGlsZTHilIDilIDilJgg4pSCCj4gKyAqICAg4pSU
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSARGV2aWNlMOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUrOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUmAo+ICsgKiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAg4pSCCj4gKyAqICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICDilIIKPiArICogICAgICAgICAgICAgICAgICAgICAgICDilIDilIDilIDilIDi
lIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDi
lLTilIDilIDilIDilIDilIDilIDilIDilIDilIDilIAgUENJIGJ1cwo+ICsgKgo+ICsgKi8KPiAr
CgpXaHkgbm90IGFsc28gaW5jbHVkZSBhIEdUMSBpbnNpZGUgVGlsZTA/IFRvIHJlZmxlY3QgdGhl
IHN0YW5kYWxvbmUgbWVkaWEgaW4gTVRMKy4KCj4gIC8qKgo+ICAgKiBET0M6IFhlIHVBUEkgT3Zl
cnZpZXcKPiAgICoKCg==
