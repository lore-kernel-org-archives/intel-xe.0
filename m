Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 063E5C197A0
	for <intel-xe@archiver.kernel.org>; Thu, 16 Nov 2023 20:40:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2C1C10E6E4;
	Thu, 16 Nov 2023 20:40:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95DBB10E6E4
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Nov 2023 20:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700167235; x=1731703235;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=fGXpZzwmYH8y7XdpImmC3fhZsM4f1kmQMuU2DZAT/jk=;
 b=BYMLCIjwT+ehFiDE7OAEV2WgPNc0fEU05xjifLofRtkdUzdPVrJyox1A
 bCKR1s7UPrbnPsCpL8MmQemSExeYujCREz8UvpdSwKih4HsqtZ6NB9IyT
 cz6peCeh6vindAd1YurizvN3QRr3zPB5uFJs/dwZ9UEKB5aI0eNAgFR2p
 jp4GG3MmNSMYIN3mbAXJwpwXsMWjLHIzKf2dXsKYluedh9CbvHlvhCa0d
 bGzctNMOyBxmlLK5imonMrJB+xnfN9ovMDGVImG+MrJu+fiNJEDlTSyqm
 8bIABO5tgboBnwWEaAXGA7sT/Hh5woX2lQG2Epn7F0Z2FRQ2v0UK02v8M w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="12726659"
X-IronPort-AV: E=Sophos;i="6.04,205,1695711600"; d="scan'208";a="12726659"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 12:40:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="800269218"
X-IronPort-AV: E=Sophos;i="6.04,205,1695711600"; d="scan'208";a="800269218"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Nov 2023 12:40:32 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 16 Nov 2023 12:40:31 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 16 Nov 2023 12:40:31 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 16 Nov 2023 12:40:31 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 16 Nov 2023 12:40:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=htXM70bIu7/pwqvkCh8DByyCN2DkfiVUFav0aN3Y8vazSRAy1uPzn2Zz/fatcefc5Tc66q0d1lo8WpwzY5A/mLTJeNQj5DZ/k6NXXheDgKt6M4XNV9todxMEnDEFKOL5KEzgXPOuaXYNIcDCGnIcq2+j4kG0qAALe16ksURePnOPq31DqP50V8mlIy4ZmoUjEG3NlH9tZrDKh5ymH579fWHbJCPcIVCF/n6dlUXHu9UBmPmQid/F/HFNpVYeek1ntLjEntD4ls6bRrFpN1SyFwppH0N2CwtAByoqFHC9ORaV7JXz8Y8wTsECwsxszLAutrYc4srQmbYXGOgjkDaLSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fGXpZzwmYH8y7XdpImmC3fhZsM4f1kmQMuU2DZAT/jk=;
 b=Mz2qbByqMHlOOCNbQZtxmdA9obdpqKY0wdI50vk7b5nxyYxSp3i4TwGMNXY+2r9W+7W8PkNfpnJjvS6IIi6g6dduKeJy4kZZ5/SXQDyFIN6g9E3U+OttQTqHZVkigMCTcHK5N0OHpKWkF5uhfnoa0xhNr6JZ6H5X4uA6njDOAXUvWP3DLgkVEHbolx/rosa5NBpWqO779O2qBedpeODgjOUqXLiEL3fRN5INFDvqtyy8TtP7gUR3VfJDI1CtTRJGOTRpymEOCYyGNSHJjQ9RJxxWMEUcyMCU5Q4FmmiNWlsoI5nQRwGpzT9N3XDt87POIiHqrep/bTiSX1ALNF6Gvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.20; Thu, 16 Nov
 2023 20:40:26 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::8076:c5fe:e0fc:cfaf]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::8076:c5fe:e0fc:cfaf%7]) with mapi id 15.20.7002.021; Thu, 16 Nov 2023
 20:40:26 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Dugast, Francois" <francois.dugast@intel.com>
Thread-Topic: [PATCH v1 6/8] drm/xe/uapi: Align on a common way to return
 arrays (gt)
Thread-Index: AQHaGJtISILNP2xuNE+ruVD8VjcpCLB9aQeA
Date: Thu, 16 Nov 2023 20:40:26 +0000
Message-ID: <b53c6f92cafa55a32d2315dfabc4698b6cea17ac.camel@intel.com>
References: <20231116144316.7-1-francois.dugast@intel.com>
 <20231116144316.7-7-francois.dugast@intel.com>
In-Reply-To: <20231116144316.7-7-francois.dugast@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|MN0PR11MB6011:EE_
x-ms-office365-filtering-correlation-id: 8e9a4122-231b-4af0-428f-08dbe6e44378
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PstmLpSRbToVZEegFCpbPkUz6t+IZdFB0mXxXAVvVTSsEMxqwNfpgXMK6qvs9NVpblgoewvSmf9MM/3zGLPvtCcBryPl8nkztGcj6ZjJbrozatn4ISE3Z3AYR6zIUfhaLKsZv9nMNUAPEo8jL+f57AHsooJZt/nIAhRFliEuAHcoYrFp2H9o9dfq4YqwHoC1BGq+1t8qZWrUJdmr1+w76Q1bgqtHq87J52AD10HLHJy98RG5pYGcuUJIoX+YWcPZh1mb8bHHKv2Zrkyv7Nlb0WeOV0dEa3BecLNPA/0uJXcevl2RT+Enx+Bn40K5FqvixiGJmJOt/s9gp2WFx72brEW8QVb4GDvbiD2YgU7HMmCDpJSBYhSoRbpo0VaKYK3zfif+C84nISaGbk56GfQMmHGKzNAzmp8qQ06K0lwHCa/xNRi+5Ks+bp6rcMKs4jlmPKQtaPfY1KcHno5oCzF1TjDirs82m/eljHd2BK0NPrzpRLQ4Wot7ZNwTBNZU93PWhgwgEj5galdvOnKKxCtrKo1pMFO/N6pNOmS8l/SrzldJ87X1Fx9KypZhdSoYxVLSjsIJXrFDkk6sfL02YirYLoGCFijry56y9zm53DZsspKFaAgx5THBOlqnb5qSRZOH5ucXPye+MbF5VeXi6EnnSQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(376002)(136003)(396003)(346002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(38070700009)(110136005)(83380400001)(38100700002)(66946007)(64756008)(8676002)(8936002)(66446008)(66556008)(66476007)(76116006)(36756003)(122000001)(41300700001)(82960400001)(26005)(6512007)(2616005)(6506007)(4001150100001)(478600001)(6486002)(2906002)(6636002)(316002)(91956017)(71200400001)(5660300002)(86362001)(43043002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Qmx2UnB3ZHAvcmlScVBnNEQzWHpyUlJnWmZMb2JLbWFodEdVYlZnMXJtRmV0?=
 =?utf-8?B?U0tZeUJzUkxsc0wzQTNtQ3NTaFhCalJaZHk5b3ZMdkdodmN5QmZEOUFMVmU1?=
 =?utf-8?B?VzB4Nkkrcm1RSkg4bzNYNXRvL0plTE8vL25qVURUTGxpeDVkQmNZZFMvdW1v?=
 =?utf-8?B?eng5NW5HcnRGMkVhd1FkOGozLzFMQkdwdm9Ebld4ZWZMUWlManI0bk52QTdp?=
 =?utf-8?B?MzhSWlRmYUViNFZDNWtpeVlCcWd2SVhtODBNclY2VzR4WkEwVVRlMWZoRmln?=
 =?utf-8?B?Zkhud1liSUYyTFZVazMzeG5teXk2NXlyeUYvUk52UGduNGdvZUNBeHZVb21I?=
 =?utf-8?B?VXJNZWc5Qll5NjBjK05lZU04S0Z5NzM0aWdId0NuWHUvd3VkTElWTXlWUURn?=
 =?utf-8?B?MnRPU2RqUGdmQVFFR2s1U2t3WmloTGw5M1U5VXVBY2JRSmlJZ3ptUE5NR3h5?=
 =?utf-8?B?UHFFamxudGdud1VraTdKSXh5TnBIVWwvWUsrbzQvV3BMdklSdzhWYnNXV3p0?=
 =?utf-8?B?NzZiQmMzUUtwNHRCamt6UWVSWURzNUs3Y2lLbDNBQStyY0cydEl5UzRySmZs?=
 =?utf-8?B?aDdrK2NoeGRhTU5qd3dxUzQrY2cvZFVIeGJ2dkIvemJQQ1diRGZQeEltUEZl?=
 =?utf-8?B?MFBLUTIwSVk2NVhqRXlPNDNETFVLV1FLclhOZEVySjBCdFNkeThzd1Y5bkNh?=
 =?utf-8?B?bHB5RktQaUlJNEw1VFV6Y21qMXRSWStxWHZ6b0JRcnJMd1dyV3JXeWFuOVNW?=
 =?utf-8?B?d0ZPTmYrZEV2dVJXUFY1VkMyajd2ZVdKanFXN2UyaVk5eEVKckQrY0s3VFcz?=
 =?utf-8?B?c3JCNWlEQ3kvTW9yUXFGd2MyY2R2TGppSkZnN2dzd3NTVGlpUnQwMURXQlZn?=
 =?utf-8?B?a0tuaGhYT2QxbCttQ0RlN0lMeDd3K3daM2lMdXRmMnh6M3k5dXdFSFNlZUY5?=
 =?utf-8?B?RzN2bGRSbmQydkF0YzRUUmhOM285WWVzK245c0xuQlpXcTErc2R5dGZFcXM4?=
 =?utf-8?B?cFdBdXF3Y1FLcXlpRnNyZmxiRnNNSHoxOUFLWHBKVzErTEExRXRZbzF6aEEr?=
 =?utf-8?B?ZlJCTDBnMVdyR3pCSlF0anZtaTRCM1ZpTkY0eWdueTNkRmEzQ05JY1NYaVdv?=
 =?utf-8?B?eVU1dHNEcW0zeG12MVgzVklNVi9aRzZKenZHbXJrRmVyZXhZWEFWbXlaaDVl?=
 =?utf-8?B?cnZqWkdNN0FmY2tvOE5OTTRTWnRwSEtXVDJXVE5NVHBZNUtjWEdWVmR4TEly?=
 =?utf-8?B?dEEwZjVNdFB5K2hLcE55RXl0N3JjbEVleDJZRGI2cHJOVkMycEkvMjgvUHpr?=
 =?utf-8?B?VFo3clpRYmlZQzY4allENkJvVE02U3FSSi9pMEtiV0hCeTZaNXhuVndLVVNB?=
 =?utf-8?B?SVE0ZFNuQ2hxNnVqVlUxL3hBZHQ4UDZabWlRUWduM2hDQ1crSGJMR3Z4VURj?=
 =?utf-8?B?S01WYUZDR3IyRlNYY29iZmFCbDM3WTJKQnU1MSt3empLTi82bkdGU1Y3QVdZ?=
 =?utf-8?B?bE9hUWg2MEVEUEpQVnNGYlA2TlRURElKc2NpT1FyMWJ6dEc0QXlCTWZwM1dl?=
 =?utf-8?B?bU56ZTB0OTkrSkowSnpnQk1uVjV5TFpiclQ3NXk1dG5WSnAyUldySnZWL0l2?=
 =?utf-8?B?Zkszc0V0d09OajU5VFdERWg1R3JIZmVJNUpRdWJkQzhheHpTTkhVbXhzLzBN?=
 =?utf-8?B?aG9oVDZZOThwZVFUSWo4aTJCbU1SeHFTMjEzTlhTZVhOOFU1VFI1UGlmT3Zj?=
 =?utf-8?B?UnFXNFlqWGYzVS9UemNpV25na3JXVUE0R2dZTlpYbytENUUzd2k4MzVZVURC?=
 =?utf-8?B?Z3J6Q0FUbHdsTXpGMDBtbU9Gd0RHNUM1bHJZUWxzbUUrRmJ2RFVTejcyaGJ1?=
 =?utf-8?B?NFRVUVZMc0NwUGJGbkd2VDluckVUaS9pMllpT3JpODl5UWI3MU5UL2QwaVFP?=
 =?utf-8?B?cVROYkZKaElLVjhMVEE5OSs4dzFmUmFiRWtCdHhKQnFjU0IwR3U2R2ErSUw1?=
 =?utf-8?B?a1phMGo0ZjF4MXdSUzNmeCtiQzN1elNDRnptSmRFRFVqQlhIbmd0d3h1RnVz?=
 =?utf-8?B?VFVNc3BWMnVONm5WOGhZeHZYL2hWR09pZTk1V0VPdjh1UUtVTDdLRGFwdU5j?=
 =?utf-8?B?bU9pYjZuNDZxS3FQOUxZWmV3YWhqOXJhUUU2ME93RER5Q3E0VmVkUlVUZC9a?=
 =?utf-8?B?U3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3E23FBF73B291F4D99FC034D71C65206@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e9a4122-231b-4af0-428f-08dbe6e44378
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2023 20:40:26.1883 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LodlhEVSJ/E4DGHi/8ilHKhtynL2mB13hculE8PRJe+id+azmQs4Gn8MTLNsusyD18hQVXRxEzeXGPo2gBTm3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6011
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v1 6/8] drm/xe/uapi: Align on a common way to
 return arrays (gt)
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

T24gVGh1LCAyMDIzLTExLTE2IGF0IDE0OjQzICswMDAwLCBGcmFuY29pcyBEdWdhc3Qgd3JvdGU6
DQo+IFRoZSB1QVBJIHByb3ZpZGVzIHF1ZXJpZXMgd2hpY2ggcmV0dXJuIGFycmF5cyBvZiBlbGVt
ZW50cy4gQXMgb2Ygbm93DQo+IHRoZSBmb3JtYXQgdXNlZCBpbiB0aGUgc3RydWN0IGlzIGRpZmZl
cmVudCBkZXBlbmRpbmcgb24gd2hpY2ggZWxlbWVudA0KPiBpcyBxdWVyaWVkLiBGaXggdGhpcyBm
b3IgZ3QgYnkgYXBwbHlpbmcgdGhlIHBhdHRlcm4gYmVsb3c6DQo+IA0KPiAgICAgc3RydWN0IGRy
bV94ZV9xdWVyeV9YIHsNCj4gICAgICAgIF9fdTMyIG51bV9YOw0KPiAgICAgICAgc3RydWN0IGRy
bV94ZV9YIFhzW107DQo+ICAgICAgICAuLi4NCj4gICAgIH0NCj4gDQo+IEhvd2V2ZXIsIHN0cmlj
dGx5IGZvbGxvd2luZyB0aGlzIHJ1bGUgd291bGQgYnJpbmcgYmFjayB0aGUgbmFtZSAiZ3RzIg0K
PiB3aGljaCBpcyBhdm9pZGVkIGFzIHBlciBjb21taXQgKCJkcm0veGUvdWFwaTogUmVuYW1lIGd0
cyB0byBndF9saXN0IikNCj4gc28gbGVhdmUgZXhjZXB0aW9ucyBpbiB0aGUgY2FzZSBvZiBndCB3
aXRoIG51bV9ndCAoc2luZ3VsYXIpIGFuZA0KPiAiZ3RfbGlzdCIuIEFsc28sIHRoaXMgY2hhbmdl
IHJlbW92ZXMgInF1ZXJ5IiBpbiB0aGUgbmFtZSBvZiBzdHJ1Y3QNCj4gZHJtX3hlX3F1ZXJ5X2d0
IGFzIGl0IGlzIG5vdCByZXR1cm5lZCBmcm9tIHRoZSBxdWVyeSBJT0NUTC4gVGhlcmUgaXMNCj4g
bm8gZnVuY3Rpb25hbCBjaGFuZ2UuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBGcmFuY29pcyBEdWdh
c3QgPGZyYW5jb2lzLmR1Z2FzdEBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJt
L3hlL3hlX3F1ZXJ5LmMgfCAgOCArKysrLS0tLQ0KPiAgaW5jbHVkZS91YXBpL2RybS94ZV9kcm0u
aCAgICAgfCAxOCArKysrKysrKystLS0tLS0tLS0NCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTMgaW5z
ZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX3F1ZXJ5LmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcXVlcnkuYw0KPiBp
bmRleCBiMzFlMDBiZDI5YmMuLjU3NTZkOGVhZjk3MiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX3F1ZXJ5LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3F1ZXJ5
LmMNCj4gQEAgLTM1MywxMSArMzUzLDExIEBAIHN0YXRpYyBpbnQgcXVlcnlfY29uZmlnKHN0cnVj
dCB4ZV9kZXZpY2UgKnhlLCBzdHJ1Y3QgZHJtX3hlX2RldmljZV9xdWVyeSAqcXVlcnkpDQo+ICBz
dGF0aWMgaW50IHF1ZXJ5X2d0X2xpc3Qoc3RydWN0IHhlX2RldmljZSAqeGUsIHN0cnVjdCBkcm1f
eGVfZGV2aWNlX3F1ZXJ5ICpxdWVyeSkNCj4gIHsNCj4gIAlzdHJ1Y3QgeGVfZ3QgKmd0Ow0KPiAt
CXNpemVfdCBzaXplID0gc2l6ZW9mKHN0cnVjdCBkcm1feGVfcXVlcnlfZ3RfbGlzdCkgKw0KPiAt
CQl4ZS0+aW5mby5ndF9jb3VudCAqIHNpemVvZihzdHJ1Y3QgZHJtX3hlX3F1ZXJ5X2d0KTsNCj4g
LQlzdHJ1Y3QgZHJtX3hlX3F1ZXJ5X2d0X2xpc3QgX191c2VyICpxdWVyeV9wdHIgPQ0KPiArCXNp
emVfdCBzaXplID0gc2l6ZW9mKHN0cnVjdCBkcm1feGVfcXVlcnlfZ3QpICsNCj4gKwkJeGUtPmlu
Zm8uZ3RfY291bnQgKiBzaXplb2Yoc3RydWN0IGRybV94ZV9ndCk7DQo+ICsJc3RydWN0IGRybV94
ZV9xdWVyeV9ndCBfX3VzZXIgKnF1ZXJ5X3B0ciA9DQo+ICAJCXU2NF90b191c2VyX3B0cihxdWVy
eS0+ZGF0YSk7DQo+IC0Jc3RydWN0IGRybV94ZV9xdWVyeV9ndF9saXN0ICpndF9saXN0Ow0KPiAr
CXN0cnVjdCBkcm1feGVfcXVlcnlfZ3QgKmd0X2xpc3Q7DQo+ICAJdTggaWQ7DQo+ICANCj4gIAlp
ZiAocXVlcnktPnNpemUgPT0gMCkgew0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2RybS94
ZV9kcm0uaCBiL2luY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmgNCj4gaW5kZXggZjU0ZTU0NWNjNGZi
Li5mYTRmNTU0YjUyNjQgMTAwNjQ0DQo+IC0tLSBhL2luY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmgN
Cj4gKysrIGIvaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaA0KPiBAQCAtMzU2LDE0ICszNTYsMTQg
QEAgc3RydWN0IGRybV94ZV9xdWVyeV9jb25maWcgew0KPiAgfTsNCj4gIA0KPiAgLyoqDQo+IC0g
KiBzdHJ1Y3QgZHJtX3hlX3F1ZXJ5X2d0IC0gZGVzY3JpYmUgYW4gaW5kaXZpZHVhbCBHVC4NCj4g
KyAqIHN0cnVjdCBkcm1feGVfZ3QgLSBkZXNjcmliZSBhbiBpbmRpdmlkdWFsIEdULg0KPiAgICoN
Cj4gLSAqIFRvIGJlIHVzZWQgd2l0aCBkcm1feGVfcXVlcnlfZ3RfbGlzdCwgd2hpY2ggd2lsbCBy
ZXR1cm4gYSBsaXN0IHdpdGggYWxsIHRoZQ0KPiArICogVG8gYmUgdXNlZCB3aXRoIGRybV94ZV9x
dWVyeV9ndCwgd2hpY2ggd2lsbCByZXR1cm4gYSBsaXN0IHdpdGggYWxsIHRoZQ0KPiAgICogZXhp
c3RpbmcgR1QgaW5kaXZpZHVhbCBkZXNjcmlwdGlvbnMuDQo+ICAgKiBHcmFwaGljcyBUZWNobm9s
b2d5IChHVCkgaXMgYSBzdWJzZXQgb2YgYSBHUFUvdGlsZSB0aGF0IGlzIHJlc3BvbnNpYmxlIGZv
cg0KPiAgICogaW1wbGVtZW50aW5nIGdyYXBoaWNzIGFuZC9vciBtZWRpYSBvcGVyYXRpb25zLg0K
PiAgICovDQo+IC1zdHJ1Y3QgZHJtX3hlX3F1ZXJ5X2d0IHsNCj4gK3N0cnVjdCBkcm1feGVfZ3Qg
ew0KPiAgI2RlZmluZSBEUk1fWEVfUVVFUllfR1RfVFlQRV9NQUlOCQkwDQo+ICAjZGVmaW5lIERS
TV9YRV9RVUVSWV9HVF9UWVBFX01FRElBCQkxDQo+ICAJLyoqIEB0eXBlOiBHVCB0eXBlOiBNYWlu
IG9yIE1lZGlhICovDQo+IEBAIC0zOTAsMTkgKzM5MCwxOSBAQCBzdHJ1Y3QgZHJtX3hlX3F1ZXJ5
X2d0IHsNCj4gIH07DQo+ICANCj4gIC8qKg0KPiAtICogc3RydWN0IGRybV94ZV9xdWVyeV9ndF9s
aXN0IC0gQSBsaXN0IHdpdGggR1QgZGVzY3JpcHRpb24gaXRlbXMuDQo+ICsgKiBzdHJ1Y3QgZHJt
X3hlX3F1ZXJ5X2d0IC0gQSBsaXN0IHdpdGggR1QgZGVzY3JpcHRpb24gaXRlbXMuDQo+ICAgKg0K
PiAgICogSWYgYSBxdWVyeSBpcyBtYWRlIHdpdGggYSBzdHJ1Y3QgZHJtX3hlX2RldmljZV9xdWVy
eSB3aGVyZSAucXVlcnkNCj4gLSAqIGlzIGVxdWFsIHRvIERSTV9YRV9ERVZJQ0VfUVVFUllfR1Rf
TElTVCwgdGhlbiB0aGUgcmVwbHkgdXNlcyBzdHJ1Y3QNCj4gLSAqIGRybV94ZV9xdWVyeV9ndF9s
aXN0IGluIC5kYXRhLg0KPiArICogaXMgZXF1YWwgdG8gRFJNX1hFX0RFVklDRV9RVUVSWV9HVCwg
dGhlbiB0aGUgcmVwbHkgdXNlcyBzdHJ1Y3QNCj4gKyAqIGRybV94ZV9xdWVyeV9ndCBpbiAuZGF0
YS4NCj4gICAqLw0KPiAtc3RydWN0IGRybV94ZV9xdWVyeV9ndF9saXN0IHsNCj4gK3N0cnVjdCBk
cm1feGVfcXVlcnlfZ3Qgew0KDQpJbiBteSBvcGluaW9uIGl0IHNob3VsZCBiZSBkcm1feGVfcXVl
cnlfZ3RzIG9yIGtlZXAgZHJtX3hlX3F1ZXJ5X2d0X2xpc3QNCg0KPiAgCS8qKiBAbnVtX2d0OiBu
dW1iZXIgb2YgR1QgaXRlbXMgcmV0dXJuZWQgaW4gZ3RfbGlzdCAqLw0KPiAgCV9fdTMyIG51bV9n
dDsNCj4gIAkvKiogQHBhZDogTUJaICovDQo+ICAJX191MzIgcGFkOw0KPiAgCS8qKiBAZ3RfbGlz
dDogVGhlIEdUIGxpc3QgcmV0dXJuZWQgZm9yIHRoaXMgZGV2aWNlICovDQo+IC0Jc3RydWN0IGRy
bV94ZV9xdWVyeV9ndCBndF9saXN0W107DQo+ICsJc3RydWN0IGRybV94ZV9ndCBndF9saXN0W107
DQo+ICB9Ow0KPiAgDQo+ICAvKioNCj4gQEAgLTQ5NSw3ICs0OTUsNyBAQCBzdHJ1Y3QgZHJtX3hl
X2RldmljZV9xdWVyeSB7DQo+ICAjZGVmaW5lIERSTV9YRV9ERVZJQ0VfUVVFUllfRU5HSU5FUwkJ
MA0KPiAgI2RlZmluZSBEUk1fWEVfREVWSUNFX1FVRVJZX01FTV9SRUdJT04JCTENCj4gICNkZWZp
bmUgRFJNX1hFX0RFVklDRV9RVUVSWV9DT05GSUcJCTINCj4gLSNkZWZpbmUgRFJNX1hFX0RFVklD
RV9RVUVSWV9HVF9MSVNUCQkzDQo+ICsjZGVmaW5lIERSTV9YRV9ERVZJQ0VfUVVFUllfR1QJCQkz
DQo+ICAjZGVmaW5lIERSTV9YRV9ERVZJQ0VfUVVFUllfSFdDT05GSUcJCTQNCj4gICNkZWZpbmUg
RFJNX1hFX0RFVklDRV9RVUVSWV9HVF9UT1BPTE9HWQkJNQ0KPiAgI2RlZmluZSBEUk1fWEVfREVW
SUNFX1FVRVJZX0VOR0lORV9DWUNMRVMJNg0KDQo=
