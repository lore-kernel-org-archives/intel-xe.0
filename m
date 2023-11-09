Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFD88C4167B
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 16:36:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5BAC10E8E0;
	Thu,  9 Nov 2023 16:36:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAD7810E8E6
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Nov 2023 16:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699547758; x=1731083758;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=kFAGU0B6rKbYl2vsqDHp4CwvRivnQI7VaxedS3oGgHI=;
 b=f/RIPBjJAGdWCBRrT9Od/1GvA8Lhxjr2MVi03IXlTWj45ySIgHVJM7wG
 pKsXsFJCDVKvWUgBuKNcn20SlBenfkodtkaqukpqevq8ne2sBg44xgbAX
 vS3ujucXwz8+xBxeC1E6Xv2wcVaoRJy8g52SjzayUWkmVM3pezBaJnPYb
 P5yoVAkwv7ORwAKcli8Igj9NWyqnKABnDETrWsM51XukDj5naOAN4FysN
 +waxKTkMDcKOyJWzyXVuAztsuQMg45IKqMUissyLgz14LZqPB0c3tIqXU
 wQ9boCKdJ+oQcp7Cp3jVHhTQ5HK1MHGUqxS5oSSbeDSLgaaHW+4rFwfiG g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="3050636"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="3050636"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 08:35:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="833877097"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="833877097"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Nov 2023 08:35:24 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 9 Nov 2023 08:35:24 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 9 Nov 2023 08:35:24 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 9 Nov 2023 08:35:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TOdGJrlIJNxqGSqAnl3WmUyuHXTbOCsRZnjpthn/LP/sAYg81+2X7RHgwfNJ3gTmymQEKp8y+6VsYaD6xYZ1/TnDfPI7pzit23XJD4y4tZgdnSOWDCRF61wTsvVri50A4kMQuZ05u+Ys+P+1tJgOsJ4PO9IR7W/tDTUq2M2B1HnbmXSwR0X6zDr28+8v1QoJJ1PPp+4BEnU4RVk+CF00VCUTpGYdTT8mlDt37kSxNhmgxViZS15fnRTYyCvu/WpbPmiq/297vbUFG+jix1a+3m+AcwfbPKl47NUOGj4PJM9cmOILz2KNWTQ37Kw0RWO1Qa9F+1ZIuEr3VqKjxn4jlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kFAGU0B6rKbYl2vsqDHp4CwvRivnQI7VaxedS3oGgHI=;
 b=UifJxliLUFdhjLmTsCokzaQXQy58NFNQEEFWl+7dyDV4dAry3/Vvgv9SVsQBxE1Wm0FIge1Z6SkZb26OF4Y8g+ZxCfz6M31mpXhjPSapl6npu+wiuSuEkGqQi4ZJ1ulTD7RXOS6OMI8eIZIvNxBTFwsb7vtk9usbEdZ9xBxD5lF1Oqxoxn3aifjUNrsfioobBAi3058kLYwlEaV2KhUKOkHnohZgTIpAl0Df80lGFqXAx5p2F4JqjiXJT9TckCuLys0uvU2qC1O/FcJG7MYpZaEZk3LHNGSWhW5Hemad8bcAO97Ftx1ZssOn3dDadbveEtYQnbt+9GLWvf+KbYlFGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by SJ0PR11MB4976.namprd11.prod.outlook.com (2603:10b6:a03:2d7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Thu, 9 Nov
 2023 16:35:19 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::78d8:6f60:e1a1:7b15]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::78d8:6f60:e1a1:7b15%6]) with mapi id 15.20.6954.028; Thu, 9 Nov 2023
 16:35:19 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Dugast, Francois" <francois.dugast@intel.com>
Thread-Topic: [Intel-xe] [PATCH v2 34/50] drm/xe/uapi: Move memory_region
 masks from GT to engine
Thread-Index: AQHaDmMf7nJI6LFhLUWelNaG6AbJNrByNwyAgAABn4A=
Date: Thu, 9 Nov 2023 16:35:19 +0000
Message-ID: <b5252d2f0873bcaebf0ecd1fcd4579020f7821f7.camel@intel.com>
References: <20231103143456.7-1-francois.dugast@intel.com>
 <20231103143456.7-35-francois.dugast@intel.com>
 <0ed7636f3caa90a01cb1128bf106d9da899f8939.camel@intel.com>
In-Reply-To: <0ed7636f3caa90a01cb1128bf106d9da899f8939.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|SJ0PR11MB4976:EE_
x-ms-office365-filtering-correlation-id: 3a5d1ddf-49ee-482b-a3df-08dbe141dcbd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: swdX4fLrnwuaJanPjedlwpiPkkF4+0kHgtcVoahNLMGRmAmRPCWEmp7b/vMK4Cfrb9c3eKdY1FY8v3AHeYWOjO7k3nyE64viK9oAi64sf/i5SEnsYe9CzkSRXZ6SHAP6cezk7sN/EogRJ6d3fqUA0M+5HKmpRsIU2xZjRbt17B+fMYQAbRfo9qTfZuGP88kcyF2os4YPyZK+IHZ5RdEqgT5asqgPC30stna2jyu6REae+EK62nZFymGZ9ID9U1AfLROGZXUS7EUMM01tGgKc8QSl3LhAAAf9ET7GE7Swg700EHAEKPFxmGm5zpmI2XRCZnA04ydsLaZ/VC2EGWaV7lzCfHYjTGLv4LxHmgD3+S8gPdXRhv4h/HxPamcez1ufWWpHMmDbB4J6V3UDo7W/Qw+E1InYayYCUaulq90F7JhKo4SvxS/SMcrD2KYp/WLx2GfdKvxCEq/25L0JggmqKM33n12Tn61H5k/DBzcgM1P4sBS03244En8wDKvud0tn9faabN+juLnwUqttfvAIDrSL2dKc+tVZR7QvB3Ymmr5wnt06GR/C6YXmBqJ3SSlvkGFR86jyt5PqmJIUg1wXlDQPYOmw5hu/Sm94ORqQnti12Sc8H94FcmTE0AwNfTCb
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(376002)(366004)(396003)(39860400002)(230922051799003)(1800799009)(451199024)(64100799003)(186009)(110136005)(76116006)(6512007)(26005)(91956017)(66946007)(107886003)(2616005)(83380400001)(478600001)(6506007)(71200400001)(8936002)(8676002)(4326008)(66476007)(64756008)(66446008)(316002)(66556008)(6636002)(6486002)(5660300002)(41300700001)(38100700002)(86362001)(82960400001)(122000001)(2906002)(38070700009)(36756003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cEs3S2dmTm1mNU1KaDNvc2ZpaUJhbFFtZC9FU3kxc1hWR0FKOTh6TFNhNWVD?=
 =?utf-8?B?QXVuQ082aDFRQTVCb2orOTMwNUxubkVxZFlxaTk5Y1V6alNwcDN4ZXJ2eC9z?=
 =?utf-8?B?UHYyMjhFV2dHb05uWDRIZmlFZWZ1a3FTa2xVWGxEM1hvRHNJcS96aTQzZ2Uz?=
 =?utf-8?B?MERmMk1oR2pyNWFGc3ZzMnhJNDJpQzhRM0RqTWtMTGFudHVsRU5JNHo4RnM2?=
 =?utf-8?B?U2FZcSsvZkxmaFhzeWx5aU5jWHFGTHYrQ09VWGlEN1BzMW9UdDNrN3FMM3Vy?=
 =?utf-8?B?dG1SQWtNVW5KSGppYnpNWXhUVUJMMHhwVkNXNTNLem1LbU9LLzVqbCt4OTlu?=
 =?utf-8?B?VXJqYmZjNHFwUUk2YjN2a0tiM0RaczR3MDlmZW9CUjZxeG15cFM4dGxRenVR?=
 =?utf-8?B?eXBTSW1QUytGcVViL0ppUUd5Y3VjRnJ6U1RpS1JDdlBZWk9haDl0Y1F3LzF5?=
 =?utf-8?B?VHlzWHRLN2pBNmRxWkVFdHE0N2o2a3NTL1g5SjdOc3JRM2lZUnh0M3hJUWQx?=
 =?utf-8?B?VUZxdHpZS3lIUkI5TDI0YzBTeS8xOUNXOEl3bzlubGVKS0RKSnl0QXhUZkZ5?=
 =?utf-8?B?bjltMkMrS3RKUU1iWENROHpxdDZoekdSNHZ4VEk4UmcvNEdsMTM4ZUJyY2hv?=
 =?utf-8?B?Zk9HbGsxdlg2SEdoTlJNOFJmTXY0WHo1MG82d0hXenlVRUJRZTRMM1ltUzNT?=
 =?utf-8?B?Z3FHUHhVQkhQYVBkWXFhbGRuK00vQWFjalBlNkRWbGE0Y0ljRGNSWEJUaC9w?=
 =?utf-8?B?RldqbTVzd095ZHMvTnkyeEdTRHJOVmRnc1V4UGVuUVpjZk4rbHpOVmo0bEV4?=
 =?utf-8?B?ZlhsRlhpazZHMzhSRG84amJGUTVoSjZyRmhqdkJvTERtc2t2Nnp5UjE4Y3pS?=
 =?utf-8?B?YW9SdkF6WTQ1M1A1R0xjREQ0M1JWL0NSMDFOZXZ5VHNJV3ZVeEI2UGo5aHVx?=
 =?utf-8?B?NithLzdyMUx0TDFrc2tlb2Vxdlh6U1JnNFY0Z3NFVXNMLzJFdUVOYlc3R04v?=
 =?utf-8?B?c21Fbms0VVJ1QUh3S3VNOTU2TnFOZFFJTVZHVHFjM0xwbDBPOE44aGNMVjlY?=
 =?utf-8?B?YS9PaGJqRXhTYm5rS1NNLzlhWU1WOTAwTWxBN3RTV0dJbDdSZktscTBRN1Zr?=
 =?utf-8?B?RWJiWnN4TUszWDlZVmE2TDB2YTRDTkZzSWk5K1lpanBkQno5RnU4L1hxRTB4?=
 =?utf-8?B?cHA5T2RQTEJxQ1JIdEFaTWhRMUlEQVFKUklhZi9uZjQzN1VyTW4zRjZMUVYw?=
 =?utf-8?B?bEphbFZleC9QMWwrRUkzVnZYUkxiaFdIalIwUW1FMU8zVXhxR1ZlcjB1TnBk?=
 =?utf-8?B?aDNKRnZ1Vm5VKzYzMWhNamM4OHdRR2ZVTzdvMkZPVmM4dEJST0xBVm5ub3F1?=
 =?utf-8?B?bnFyKytFQkx3Vlo0RmxuWDhxY3p6aXRXNXFRdy9kNXNJVCszdjdMWkZDL2R3?=
 =?utf-8?B?a3VtVUVWOVBabjhNS1Vka3NxaC8yc2x5ZHFQbzRQOHVKNXF0Sk5KaWFoRlRs?=
 =?utf-8?B?MjZyV01DTUhOWGFIV2laYVVYbWhXTi9kTzMvRkdpVWt6STI0L1IzL2hvUUFj?=
 =?utf-8?B?Rk9SZDMrM1dXM1A1NCtaM1pPWWRzQ21zN21RVjYxTGo3anBEZ1lGaTlXUFBZ?=
 =?utf-8?B?NjF5aStRaFBjeVY3U1RQeU0wQmxoSkd6U25mejBtSHdHYmZwaFE5YXBNM0xN?=
 =?utf-8?B?UjRPcXl1YTlwTXNhMnVQWmFDY1dvOEJ4ek84eUxoc2ZqY01Zdnk4Rk5odW50?=
 =?utf-8?B?SUtuM1Q4aGtQTnluSk5UeVltMzdGNUFaZkxxMVBiaitrT01OT0o2cm5ZYWxy?=
 =?utf-8?B?M0ZlMnp0cXVyMS9MQXFVSTJ3YU1KL2Fha2EvTStQM05WQzNnNEowMWpLR216?=
 =?utf-8?B?OVljYUxQemYza2IyaG1TVHNDN1NQR3B4VWtsYlpSSmxQNExIakhGV2NQZ1dh?=
 =?utf-8?B?eTFOY0hkSFMxVlIveStDWjcwRkVmMCtHWkJDckUvd1Nyck8vZmR1dzZnVWtZ?=
 =?utf-8?B?dVBwNXVxdk1pdVVxY2ZTeHdlK2hOZ0ZHSHpHLzg2bnlqQ0lOdTlsOVRCdkdY?=
 =?utf-8?B?bmJpRnMvSGd0ZW95aU5tTEgyOUJuOUhHcDNLczdDTWRsUEZZbFdQWG5RbFBw?=
 =?utf-8?B?RFhyMXpVd3p1NnBvUDBpQlRYbG1HSnRNakFaYXZEMWJQUWdHd2hjNVNnUWUr?=
 =?utf-8?B?MGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <51834899656690418B28833A8C2E2CD1@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a5d1ddf-49ee-482b-a3df-08dbe141dcbd
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2023 16:35:19.5354 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TdJWnJYfWSuj5ziuRoynXD+jCtNKrgW7coQ5kVqZ8dr1LcJ4Mem7OL0FfLLahk5EAd0U4yYDfT5tQVPToVlIlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4976
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 34/50] drm/xe/uapi: Move memory_region
 masks from GT to engine
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
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIzLTExLTA5IGF0IDA4OjI5IC0wODAwLCBKb3PDqSBSb2JlcnRvIGRlIFNvdXph
IHdyb3RlOg0KPiBPbiBGcmksIDIwMjMtMTEtMDMgYXQgMTQ6MzQgKzAwMDAsIEZyYW5jb2lzIER1
Z2FzdCB3cm90ZToNCj4gPiBGcm9tOiBSb2RyaWdvIFZpdmkgPHJvZHJpZ28udml2aUBpbnRlbC5j
b20+DQo+ID4gDQo+ID4gSW4gdGhlIFRpbGVkIHBsYXRmb3JtcywgdGhlIG1lbW9yeSBpcyBtb3Jl
IHRpZWQgdG8gdGhlIFRpbGUNCj4gPiB0aGFuIHRvIHRoZSBHVC4NCj4gPiBUaGUgZGlzdGFuY2Ug
KG5lYXIgdnMgZmFyKSBtYWtlcyBtb3JlIHNlbnNlIGZyb20gdGhlIEVuZ2luZQ0KPiA+IHBlcnNw
ZWN0aXZlIHRoYW4gZnJvbSB0aGUgR1QgcGVyc3BlY3RpdmUuDQo+IA0KPiB3aHkgbm90IGFkZCBh
IHVBUEkgdG8gcXVlcnkgdGlsZSBpbmZvcm1hdGlvbj8NCj4gdGhpcyBpcyBkdXBsaWNhdGluZyBh
IHRpbGUgaW5mb3JtYXRpb24gb250byBldmVyeSBlbmdpbmUgb2YgdGhhdCB0aWxlLg0KPiB3ZSBj
b3VsZCBsZWF2ZSByZXNlcnZlZCBmaWVsZHMgaW4gdGhlIHRpbGUgdUFQSSB0byBpbmNsdWRlIGFk
ZGl0aW9uYWwgaW5mb3JtYXRpb24gdGhhdCBtaWdodCBiZSByZWxldmFudCBpbiBmdXR1cmUuDQoN
Cm90aGVyIGlzc3VlIGhlcmUgYW5kIGluIG90aGVyIHBhdGNoZXMgb2YgdGhpcyBodWdlIHBhdGNo
IHNlcmllcy4NCg0KYSBwcmV2aW91cyBwYXRjaCBpbiB0aGlzIHNlcmllcyByZW5hbWVkIG5lYXJf
bWVtX3JlZ2lvbnMsIHRoZW4gdGhpcyBvbmUgbW92ZXMgaXQgdG8gb3RoZXIgc3RydWN0Li4uIHBs
ZWFzZSBkcm9wIHRoZSBmaXJzdCBwYXRjaCBhbmQgcmVuYW1lIGFuZCBtb3ZlIGl0DQppbnRvIGEg
c2luZ2xlIHBhdGNoLg0KDQphIHNlcmllcyBhcyBiaWcgYXMgdGhpcyBvbmUgd2lsbCBjYXVzZSBy
ZXZpZXdzIGluIEtNRCBhbmQgVU1EIHRvIHRha2UgYSB3aGlsZS4uLg0KDQo+IA0KPiA+IA0KPiA+
IFNvLCBsZXQncyBtb3ZlIHRoaXMgb3V0IGZyb20gdGhlIEdUIGFuZCBpbnRvIHRoZSBlbmdpbmUg
aW5mby4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBSb2RyaWdvIFZpdmkgPHJvZHJpZ28udml2
aUBpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9xdWVyeS5j
IHwgMTQgKysrKysrKy0tLS0tLS0NCj4gPiAgaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaCAgICAg
fCAyNyArKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0NCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAy
MSBpbnNlcnRpb25zKCspLCAyMCBkZWxldGlvbnMoLSkNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX3F1ZXJ5LmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcXVl
cnkuYw0KPiA+IGluZGV4IGFhNTc0M2UyZTRkMC4uNDlhOWIzNmYxMTkzIDEwMDY0NA0KPiA+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9xdWVyeS5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX3F1ZXJ5LmMNCj4gPiBAQCAtMjE3LDYgKzIxNywxMyBAQCBzdGF0aWMgaW50IHF1
ZXJ5X2VuZ2luZXMoc3RydWN0IHhlX2RldmljZSAqeGUsDQo+ID4gIAkJCQlod2UtPmxvZ2ljYWxf
aW5zdGFuY2U7DQo+ID4gIAkJCWh3X2VuZ2luZV9pbmZvW2ldLmluc3RhbmNlLmd0X2lkID0gZ3Qt
PmluZm8uaWQ7DQo+ID4gIAkJCWh3X2VuZ2luZV9pbmZvW2ldLmluc3RhbmNlLnBhZCA9IDA7DQo+
ID4gKwkJCWlmICghSVNfREdGWCh4ZSkpDQo+ID4gKwkJCQlod19lbmdpbmVfaW5mb1tpXS5uZWFy
X21lbV9yZWdpb25zID0gMHgxOw0KPiA+ICsJCQllbHNlDQo+ID4gKwkJCQlod19lbmdpbmVfaW5m
b1tpXS5uZWFyX21lbV9yZWdpb25zID0NCj4gPiArCQkJCQlCSVQoZ3RfdG9fdGlsZShndCktPmlk
KSA8PCAxOw0KPiA+ICsJCQlod19lbmdpbmVfaW5mb1tpXS5mYXJfbWVtX3JlZ2lvbnMgPSB4ZS0+
aW5mby5tZW1fcmVnaW9uX21hc2sgXg0KPiA+ICsJCQkJaHdfZW5naW5lX2luZm9baV0ubmVhcl9t
ZW1fcmVnaW9uczsNCj4gPiAgCQkJbWVtc2V0KGh3X2VuZ2luZV9pbmZvLT5yZXNlcnZlZCwgMCwg
c2l6ZW9mKGh3X2VuZ2luZV9pbmZvLT5yZXNlcnZlZCkpOw0KPiA+ICANCj4gPiAgCQkJaSsrOw0K
PiA+IEBAIC0zNzcsMTMgKzM4NCw2IEBAIHN0YXRpYyBpbnQgcXVlcnlfZ3RfbGlzdChzdHJ1Y3Qg
eGVfZGV2aWNlICp4ZSwgc3RydWN0IGRybV94ZV9kZXZpY2VfcXVlcnkgKnF1ZXJ5DQo+ID4gIAkJ
CWd0X2xpc3QtPmd0X2xpc3RbaWRdLnR5cGUgPSBEUk1fWEVfUVVFUllfR1RfVFlQRV9NQUlOOw0K
PiA+ICAJCWd0X2xpc3QtPmd0X2xpc3RbaWRdLmd0X2lkID0gZ3QtPmluZm8uaWQ7DQo+ID4gIAkJ
Z3RfbGlzdC0+Z3RfbGlzdFtpZF0uY2xvY2tfZnJlcSA9IGd0LT5pbmZvLmNsb2NrX2ZyZXE7DQo+
ID4gLQkJaWYgKCFJU19ER0ZYKHhlKSkNCj4gPiAtCQkJZ3RfbGlzdC0+Z3RfbGlzdFtpZF0ubmVh
cl9tZW1fcmVnaW9ucyA9IDB4MTsNCj4gPiAtCQllbHNlDQo+ID4gLQkJCWd0X2xpc3QtPmd0X2xp
c3RbaWRdLm5lYXJfbWVtX3JlZ2lvbnMgPQ0KPiA+IC0JCQkJQklUKGd0X3RvX3RpbGUoZ3QpLT5p
ZCkgPDwgMTsNCj4gPiAtCQlndF9saXN0LT5ndF9saXN0W2lkXS5mYXJfbWVtX3JlZ2lvbnMgPSB4
ZS0+aW5mby5tZW1fcmVnaW9uX21hc2sgXg0KPiA+IC0JCQlndF9saXN0LT5ndF9saXN0W2lkXS5u
ZWFyX21lbV9yZWdpb25zOw0KPiA+ICAJfQ0KPiA+ICANCj4gPiAgCWlmIChjb3B5X3RvX3VzZXIo
cXVlcnlfcHRyLCBndF9saXN0LCBzaXplKSkgew0KPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3Vh
cGkvZHJtL3hlX2RybS5oIGIvaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaA0KPiA+IGluZGV4IDUx
NjRlZDE1MGEyZS4uOGU4NGVmNmZkNDZlIDEwMDY0NA0KPiA+IC0tLSBhL2luY2x1ZGUvdWFwaS9k
cm0veGVfZHJtLmgNCj4gPiArKysgYi9pbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oDQo+ID4gQEAg
LTIyOCw2ICsyMjgsMjAgQEAgc3RydWN0IGRybV94ZV9xdWVyeV9lbmdpbmVfaW5mbyB7DQo+ID4g
IAkvKiogQGluc3RhbmNlOiBUaGUgQGRybV94ZV9lbmdpbmVfY2xhc3NfaW5zdGFuY2UgKi8NCj4g
PiAgCXN0cnVjdCBkcm1feGVfZW5naW5lX2NsYXNzX2luc3RhbmNlIGluc3RhbmNlOw0KPiA+ICAN
Cj4gPiArCS8qKg0KPiA+ICsJICogQG5lYXJfbWVtX3JlZ2lvbnM6IEJpdCBtYXNrIG9mIGluc3Rh
bmNlcyBmcm9tDQo+ID4gKwkgKiBkcm1feGVfcXVlcnlfbWVtX3JlZ2lvbnMgdGhhdCBpcyBuZWFy
IHRoaXMgZW5naW5lLg0KPiA+ICsJICovDQo+ID4gKwlfX3U2NCBuZWFyX21lbV9yZWdpb25zOw0K
PiA+ICsJLyoqDQo+ID4gKwkgKiBAZmFyX21lbV9yZWdpb25zOiBCaXQgbWFzayBvZiBpbnN0YW5j
ZXMgZnJvbQ0KPiA+ICsJICogZHJtX3hlX3F1ZXJ5X21lbV9yZWdpb25zIHRoYXQgaXMgZmFyIGZy
b20gdGhpcyBlbmdpbmUuDQo+ID4gKwkgKiBJbiBnZW5lcmFsLCBpdCBoYXMgZXh0cmEgaW5kaXJl
Y3Rpb25zIHdoZW4gY29tcGFyZWQgdG8gdGhlDQo+ID4gKwkgKiBAbmVhcl9tZW1fcmVnaW9ucy4g
Rm9yIGEgZGlzY3JldGUgZGV2aWNlIHRoaXMgY291bGQgbWVhbiBzeXN0ZW0NCj4gPiArCSAqIG1l
bW9yeSBhbmQgbWVtb3J5IGxpdmluZyBpbiBhIGRpZmZlcmVudCBUaWxlLg0KPiA+ICsJICovDQo+
ID4gKwlfX3U2NCBmYXJfbWVtX3JlZ2lvbnM7DQo+ID4gKw0KPiA+ICAJLyoqIEByZXNlcnZlZDog
UmVzZXJ2ZWQgKi8NCj4gPiAgCV9fdTY0IHJlc2VydmVkWzNdOw0KPiA+ICB9Ow0KPiA+IEBAIC00
MDEsMTkgKzQxNSw2IEBAIHN0cnVjdCBkcm1feGVfcXVlcnlfZ3Qgew0KPiA+ICAJX191MTYgZ3Rf
aWQ7DQo+ID4gIAkvKiogQGNsb2NrX2ZyZXE6IEEgY2xvY2sgZnJlcXVlbmN5IGZvciB0aW1lc3Rh
bXAgKi8NCj4gPiAgCV9fdTMyIGNsb2NrX2ZyZXE7DQo+ID4gLQkvKioNCj4gPiAtCSAqIEBuZWFy
X21lbV9yZWdpb25zOiBCaXQgbWFzayBvZiBpbnN0YW5jZXMgZnJvbQ0KPiA+IC0JICogZHJtX3hl
X3F1ZXJ5X21lbV9yZWdpb25zIHRoYXQgaXMgbmVhciB0aGUgY3VycmVudCBlbmdpbmVzIG9mIHRo
aXMgR1QuDQo+ID4gLQkgKi8NCj4gPiAtCV9fdTY0IG5lYXJfbWVtX3JlZ2lvbnM7DQo+ID4gLQkv
KioNCj4gPiAtCSAqIEBmYXJfbWVtX3JlZ2lvbnM6IEJpdCBtYXNrIG9mIGluc3RhbmNlcyBmcm9t
DQo+ID4gLQkgKiBkcm1feGVfcXVlcnlfbWVtX3JlZ2lvbnMgdGhhdCBpcyBmYXIgZnJvbSB0aGUg
ZW5naW5lcyBvZiB0aGlzIEdULg0KPiA+IC0JICogSW4gZ2VuZXJhbCwgaXQgaGFzIGV4dHJhIGlu
ZGlyZWN0aW9ucyB3aGVuIGNvbXBhcmVkIHRvIHRoZQ0KPiA+IC0JICogQG5lYXJfbWVtX3JlZ2lv
bnMuIEZvciBhIGRpc2NyZXRlIGRldmljZSB0aGlzIGNvdWxkIG1lYW4gc3lzdGVtDQo+ID4gLQkg
KiBtZW1vcnkgYW5kIG1lbW9yeSBsaXZpbmcgaW4gYSBkaWZmZXJlbnQgVGlsZS4NCj4gPiAtCSAq
Lw0KPiA+IC0JX191NjQgZmFyX21lbV9yZWdpb25zOw0KPiA+ICAJLyoqIEByZXNlcnZlZDogUmVz
ZXJ2ZWQgKi8NCj4gPiAgCV9fdTY0IHJlc2VydmVkWzhdOw0KPiA+ICB9Ow0KPiANCg0K
