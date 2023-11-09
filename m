Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85C95C4332F
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 19:50:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ECFA10E8FB;
	Thu,  9 Nov 2023 19:50:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F83B10E8FB
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Nov 2023 19:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699559411; x=1731095411;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=5K9nYBJ7srSVLxrvQeLcaicRJPiSafw+hZLJmcEaAqo=;
 b=lFSnc9qZmUHYw518DWbdJUQkVTyQNd4YO4HmguLPTjwmDNikXe/jaT9N
 1NMGlASK8H01gpaeGWTCGQTTTM/AwzOVx7kgJlK3o8ikkSdnJ65rd7Ymq
 HFdTmIyS+2VhnCaVBMK3d4ED0E5FfsQgiREU8pG7sdTLCeNb3BGWB4hOd
 91Fp1w+bWlfBbBxtwcZrQaWhkZQEdzlXrZ2Gi5HckrgjrzXhx2cAP+vEK
 P188HGaddiUc2soVw8qNaZv0eliIC3IhNjSPDV9npwnOuRfJmKKnN57Xd
 yGiXkFYxiByexvcMo0ag1wXj830mIKkUg1VeoLphiBO4vP3MMrbj231WP A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="392939300"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; d="scan'208";a="392939300"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 11:50:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; d="scan'208";a="11648463"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Nov 2023 11:50:08 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 9 Nov 2023 11:50:07 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 9 Nov 2023 11:50:07 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 9 Nov 2023 11:50:07 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 9 Nov 2023 11:50:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F97dxn0X0d3r7rneo62pnhh6rDADqVR7Qxky/omBD5oaOOqrODh2AskeagSsTL+Emh5vewZKkUF3PB1jXMHKC4+6pL7UwFPZ09xlYaU7hmnQqUP7nh9s0CkszjILBX2Rxlow8qUkVZbVMVTd0DuiPp1aANKGFRrbSp4Um8NbAJmUK6Hy/pdFcvTJ5o6HOzzBv30Y4B9dIYux9OJAMakC4P19J7fq1oBkLNP38lH4a8OPtVA0c6pt+4kr9Mq7BbbRYVl+edG/PmRdtFyp4sdZFOm2j0eINnYifKU4hzlIbCwGCMaqB6gAmSzUimxK2uNdak9j0dew9WzbYzP/UE+qBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5K9nYBJ7srSVLxrvQeLcaicRJPiSafw+hZLJmcEaAqo=;
 b=U4GZlnIeRaWH1Yyk8hNxekw5N2GcncX/vLvX9MmsPUU9TKeV+oaWjpEZRYTnALuEANuNM5yCHC2GpPT2ybyelYsztjzcexGqW5tyjxBfkam9WfJpA+RMjDJBB0O8E6ap68EV6msJS3R0J/m8tmnZP3jLeJATw+THfyXbp3WKhB3V+Y/Li1Q9CPM7qBhwh2rvsg+6OQhQGj2jTpnloxFdYM4iULviYb/SNfxrGH7G00bZ3MYTodwO6Dyfk2hsXykVHwrIXsj1QhT+pwejY67Tt0lbIH7ejO5u0vyM0sRyLGIilEwp0xnM0v/1rCHw4AQGWsSn8ZemICRHvzprP56OXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by MN2PR11MB4616.namprd11.prod.outlook.com (2603:10b6:208:26f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.18; Thu, 9 Nov
 2023 19:50:05 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::78d8:6f60:e1a1:7b15]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::78d8:6f60:e1a1:7b15%6]) with mapi id 15.20.6954.028; Thu, 9 Nov 2023
 19:50:04 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Thread-Topic: [Intel-xe] [PATCH v2 34/50] drm/xe/uapi: Move memory_region
 masks from GT to engine
Thread-Index: AQHaDmMf7nJI6LFhLUWelNaG6AbJNrByNwyAgAABn4CAACSJgIAAEeAA
Date: Thu, 9 Nov 2023 19:50:04 +0000
Message-ID: <d6889593ffacce61174f109832537176b5f2d28c.camel@intel.com>
References: <20231103143456.7-1-francois.dugast@intel.com>
 <20231103143456.7-35-francois.dugast@intel.com>
 <0ed7636f3caa90a01cb1128bf106d9da899f8939.camel@intel.com>
 <b5252d2f0873bcaebf0ecd1fcd4579020f7821f7.camel@intel.com>
 <ZU0o6z5MtoaG8fuZ@intel.com>
In-Reply-To: <ZU0o6z5MtoaG8fuZ@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|MN2PR11MB4616:EE_
x-ms-office365-filtering-correlation-id: f1da191f-8f74-4fe6-a13c-08dbe15d118e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: M4KaQ2unLrOudQUbcyD7gxyQWdJZVoXSMWtIy3pAIwwVzEg/NuSkZ/1gbOn65G9+S9gPSMrXNLuwu5dlLDalMtHaGTFNXFJvNNM8N51l5tWLZesXXECDBzGFnTVmCffSAyJlBFUVJPpGWeLgRHU+WVZmfIji08WnHgpBsWYu+y0zJ7h0Bvs+qxb8ddQH1a8mPUBRAuMoROWJ+hrCOpCv18lam3KuVnkOgBMtKoPwZjHuBuafKnS7pzFluLCPdNagasxQ+UaUouxEZDTT3dxZraLfn/8KajaHJ4DxLH65Ow/pijmECbJ5LFOnDKOoGAY1UcekLLI9w2mXKgJASzbtXKNELj2h5pV2SFbkMx/iIbH5yKfLmDwt8m2JwvBMGSpIGM/W/se0cZVnpvZk1hks4AhfH4YlK79MLDbHoNz40yL5vAmlCdKsZ3szPQhhvkSNNd2THk5d20gJlmwmRk7ELVXnoSlNs78ECwHiBBMjWNuZbuar5/Q4MoMVMVGzfV6aMkULMI5Of83FuKfNMK0QtePe7UUTkvRx/65FjF8DrwTTK5wt6wHC7RxTfpKjP+IDEpgOKfWlI7iS66KuXXM+cABiXbtd05qYb+Swkm6xD1AL05DUlUVMtolcBQjyiJkb
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(136003)(346002)(396003)(376002)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(38070700009)(36756003)(316002)(8676002)(6862004)(4326008)(8936002)(83380400001)(76116006)(66946007)(91956017)(54906003)(64756008)(66556008)(66476007)(6636002)(66446008)(26005)(37006003)(2906002)(478600001)(6486002)(6512007)(5660300002)(6506007)(71200400001)(2616005)(82960400001)(122000001)(107886003)(86362001)(38100700002)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OEtTdmFCMEVQc1h2TDFDcG1tNUdYellrM1ZLTTlUZTk2NmpRTU9GajRDT05z?=
 =?utf-8?B?OTJvMnY3bXpENHJYRXkrQWc2MXNGTVFTeG9DaWVhQytGSTNvb2c3bDZnOUw1?=
 =?utf-8?B?UmpNTjlyaXBuMGpya1d6Mm5LSGsyV2tlbTFyeHBqQW40d255MHhUVVhkWXdL?=
 =?utf-8?B?ZWFaUTN5WnEzdVlSSlRzZVdmZytsZTlBdm8vaUEwYVpCZDA4dVJzVXNlUk9D?=
 =?utf-8?B?bHU4WlZjRjk3dStMYXRSL0QyU2hrSEd0d1VPUkZHM2Z2emlUVVVwa2sxM3Rm?=
 =?utf-8?B?ZXlQZmJlSW5uU05FTXl4akl5V1ozSEdER3FVQjA3SDArVzRDZndLQXZ5cUxS?=
 =?utf-8?B?b2U3UVB0VGxObUFVb0t0WFlMN1lIZE1zU3BzcHFqSjA3bzRoZS8rdjhSM1d3?=
 =?utf-8?B?a3psS0d2cVhsbXErMnQrdEczcHV1T0x3ci9VK09scEJhSHN5RjVOeGVtWW5a?=
 =?utf-8?B?Z01qNGROeDlOT0RPU0VoblhScmtNUnJiaFNMNkFVeWd4NWV4eXo1QjRSTldF?=
 =?utf-8?B?RnF1S0pLMnF0ZE82NWNIVUhZTFIvNUl1RE5rS1lWVk56UEJxMHVHMkRvdnVO?=
 =?utf-8?B?aVlHVXZxWkpwdEh4Y0sxRDEyQ2hwSlRJUXN5SCtzMDdldS9UaFVxN0Y3YU96?=
 =?utf-8?B?V3lodVdVc0pvMUtTL1psdFBkTFY5RlJaUWVhL2N6SHRYRlIyQ3BidUdSZXQ4?=
 =?utf-8?B?YUtoQTBaeUUyaXlBS0dyUXROb08vdjNrMDFQQWg1OHNqLzF5TGkyQmNKWHM2?=
 =?utf-8?B?ZDR5YXVPTmMvYVRkTzl4ZWlObkVXanhDQXVGWSs5empoWVB4d2dteUVFZDFa?=
 =?utf-8?B?TWxqcjlkdyttcjlkb3E2WTZubVQ5VjZwSnpBMEJjMWFLdjRmRGFYUmVNbUty?=
 =?utf-8?B?dnh3SDNJcWsyT1FjbDBZUGxTaVgybjdTQzVDOEhTTFJBYjlzYy8xR1FXSCtF?=
 =?utf-8?B?THNFa3VJOXhwOXViN1NLTmJ4ZDVyVmdnUk5qTHlGWmlGVkxQTXRGSVJWWHNT?=
 =?utf-8?B?bk5kdUpiZ2Q2ODRuYUQzMGY4c3h3emdCdEo3QkNydlBubnI2NDI2aGZobjhq?=
 =?utf-8?B?a0dVSERsNEVlNmtyeHpLVm55UHlyWlc0dVFaYWYyVURvanJIZWszYjI1S0FJ?=
 =?utf-8?B?Q2FOemRnRXF2VnROS0hLcSs4Z2xQWm9tcHBFb0xjamk1TW4vZGNwa1FLbmg5?=
 =?utf-8?B?MURSc0NqVnJyL3BTODF2ekFHTjl5cUsrWWo3VTFhU0tnbFNITUloRjg4V3l4?=
 =?utf-8?B?VkoxcTdpaEk5ZjFXc09KUkc2UXozK2JJWElNUTJ0Ukk2eFJpT1hkcmVrbUxR?=
 =?utf-8?B?YWhkejVhaS80NzFQcml6UGhzYWZEalI2aFFWV3k1ZHFIQVJQVTIraGoxRnZN?=
 =?utf-8?B?SEg1eEpxSXU2WnJnMGU5UlN5enNHd0RTd3lQWExHeEw4OXFFSWFJSW9vZ3NH?=
 =?utf-8?B?T0ljMjVTRHM0TFZGZVNiM1ZlS21hTG9vcWp5dmplRVU0K0xldkJXeXptTnVH?=
 =?utf-8?B?blc3OWhiZnRpNmVENXJKYkFtNHRSVzAzdGF1OSsvalIzRTI2ZVRTU2xqbjJI?=
 =?utf-8?B?TE1uSDhWRzF0MnlZZUNnMHNqelo1NmJPZnhURVlCOTJ6MENsUzMwMWE4bjhi?=
 =?utf-8?B?UHZOb0VnSXZ0S2xZQmM2MDVWU3pQYlo2VWc3RFFEMmE0SXlpazVxWG5FZHV2?=
 =?utf-8?B?dzFWa1JBdmZ4TE1YQ3RLZHQvcXIyVm9MZ1l3MlpoVGk1REwvYjVKSnJBak5S?=
 =?utf-8?B?bGIzcnh3eDNGOVlUSzl0MHZFSEQ2aXA5S2xlWkdqOWdDL3RyeS9WditUS3Vy?=
 =?utf-8?B?UlVoNitzKzBiRm0yZXdKRGtiZEdSR3k0OEZYZzNleENxYkJjZlBnOXUrRXlO?=
 =?utf-8?B?VVRtWXloRkw4dE1KY2taK1BvWURPbU1rZG1FKy9DcVpPZG1mb1VVOTl4U2s0?=
 =?utf-8?B?UEFTZ2FwQUVHc3pTY1RDb3hmQmJsS2dTYm5oWHZPZjIrbWF3RHpYdFIyZVFw?=
 =?utf-8?B?aktqN3AzOVZXOTBMdVBhNnlwODZPY1JOSHo2VFZCWTZEZUFHWlc1QmNGRnIw?=
 =?utf-8?B?TG16WGlMRi9CcmxOUVJJeU1NM0Rkakhtb2twWTNjOWNrQktvRklET2Q0TWpL?=
 =?utf-8?B?b2p5c2dGZEZYWDBIV0Q3VEhxZmo5NDAzZ1pWTTdRTzMyaUlZcEJKSktzQjI2?=
 =?utf-8?B?VWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4CDDBCDD2B9E184AA4A5639DB2423614@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1da191f-8f74-4fe6-a13c-08dbe15d118e
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2023 19:50:04.5731 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZZuIJLNg40904t6TARyab/sYlfLZIZ24wucNn3Tf1LrPHZp9zoqVv4KglmPigGGKLpGmXEVExEM1e0nCc+Tv0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4616
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
Cc: "Dugast, Francois" <francois.dugast@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIzLTExLTA5IGF0IDEzOjQ2IC0wNTAwLCBSb2RyaWdvIFZpdmkgd3JvdGU6DQo+
IE9uIFRodSwgTm92IDA5LCAyMDIzIGF0IDA0OjM1OjE5UE0gKzAwMDAsIFNvdXphLCBKb3NlIHdy
b3RlOg0KPiA+IE9uIFRodSwgMjAyMy0xMS0wOSBhdCAwODoyOSAtMDgwMCwgSm9zw6kgUm9iZXJ0
byBkZSBTb3V6YSB3cm90ZToNCj4gPiA+IE9uIEZyaSwgMjAyMy0xMS0wMyBhdCAxNDozNCArMDAw
MCwgRnJhbmNvaXMgRHVnYXN0IHdyb3RlOg0KPiA+ID4gPiBGcm9tOiBSb2RyaWdvIFZpdmkgPHJv
ZHJpZ28udml2aUBpbnRlbC5jb20+DQo+ID4gPiA+IA0KPiA+ID4gPiBJbiB0aGUgVGlsZWQgcGxh
dGZvcm1zLCB0aGUgbWVtb3J5IGlzIG1vcmUgdGllZCB0byB0aGUgVGlsZQ0KPiA+ID4gPiB0aGFu
IHRvIHRoZSBHVC4NCj4gPiA+ID4gVGhlIGRpc3RhbmNlIChuZWFyIHZzIGZhcikgbWFrZXMgbW9y
ZSBzZW5zZSBmcm9tIHRoZSBFbmdpbmUNCj4gPiA+ID4gcGVyc3BlY3RpdmUgdGhhbiBmcm9tIHRo
ZSBHVCBwZXJzcGVjdGl2ZS4NCj4gPiA+IA0KPiA+ID4gd2h5IG5vdCBhZGQgYSB1QVBJIHRvIHF1
ZXJ5IHRpbGUgaW5mb3JtYXRpb24/DQo+ID4gPiB0aGlzIGlzIGR1cGxpY2F0aW5nIGEgdGlsZSBp
bmZvcm1hdGlvbiBvbnRvIGV2ZXJ5IGVuZ2luZSBvZiB0aGF0IHRpbGUuDQo+ID4gPiB3ZSBjb3Vs
ZCBsZWF2ZSByZXNlcnZlZCBmaWVsZHMgaW4gdGhlIHRpbGUgdUFQSSB0byBpbmNsdWRlIGFkZGl0
aW9uYWwgaW5mb3JtYXRpb24gdGhhdCBtaWdodCBiZSByZWxldmFudCBpbiBmdXR1cmUuDQo+IA0K
PiBUaGlzIGlzIG5vdCBuZWNlc3NhcmlseSBhIHRpbGUgaW5mb3JtYXRpb24uIEluIFBWQywgdHJ1
bHkgdGhlIG1lbV9yZWdpb24gaXMgdGllZCB0byB0aGUgdGlsZSwNCj4gYnV0IHdlIGRvbid0IHdh
bnQgdG8gZml4IHRoZSB1YXBpIGluIG9ubHkgb25lIHBsYXRmb3JtLg0KPiBMaWtlIGluIHRoZSBw
cmV2aW91cywgdGhlIG1lbV9yZWdpb24gd2FzIHBlciBHVC4gd2hvIGtub3dzIHRoZSBmdXR1cmU/
IQ0KDQpPbGRlciBwbGF0Zm9ybXMgaGFkIG9uZSBndCBhbmQgb25lIHRpbGUsIE1UTCBoYXMgMSB0
aWxlIGFuZCAyIGd0cyBhbmQgaW4gYm90aCBjYXNlcyBpdCBtYXRjaGVzIHdpdGggaGF2aW5nIGEg
dGlsZSBxdWVyeS4NCg0KPiANCj4gQnV0IHRoZSBlbmdpbmUgbmVlZHMgdGhlIGluZm9ybWF0aW9u
IG9uIHdoaWNoIG1lbV9yZWdpb24gY291bGQgYmUgYmV0dGVyLA0KPiByZWdhcmRsZXNzIG9mIGlm
IGl0IGxpdmVzIGFsb25nIHRoZSBzYW1lIGd0LCBvciB0aGUgc2FtZSB0aWxlLCBvciBvdXRzaWRl
Lg0KPiBTbywgbmVhciBhbmQgZmFyIHNvdW5kZWQgdGhlIG1vc3QgZ2VuZXJpYyBhbmQgZnV0dXJl
IHByb29mIHdheS4NCg0KTWVtb3J5IHJlZ2lvbnMgYXJlIGFsc28gdXNlZCBoZXJlIGluIGRybV94
ZV92bV9iaW5kX29wLnRpbGVfbWFzay9wdF9wbGFjZW1lbnRfaGludC4NClRvIG1lIGl0IGxvb2tz
IG9kZCB0aGF0IEkgbmVlZCB0byBnbyB0cm91Z2ggYWxsIGVuZ2luZXMgdG8ga25vdyB3aGF0IGFy
ZSBhdmFpbGFibGUgdGlsZXMuDQoNCk90aGVyIHdheSB0byBtYWtlIGl0IGZ1dHVyZSBwcm9mIGlz
IGtlZXAgdGhpcyBpbmZvcm1hdGlvbiBpbiBndCBxdWVyeSwgZWFjaCBlbmdpbmUgd2lsbCBhbHdh
eXMgYmVsb25nIHRvIG9uZSBHVCBhbmQgZWFjaCBHVCB3aWxsIGFsd2F5cyBiZWxvbmcgdG8gb25l
DQp0aWxlLg0KVGhpcyB3YXkgaXQgZG8gbm90IG1hdHRlcnMgaWYgdGhlIG1lbW9yeV9yZWdpb24g
aXMgdGlsZSBzcGVjaWZpYyBpbmZvcm1hdGlvbiBvciBhIEdUIHNwZWNpZmljIGluZm9ybWF0aW9u
IHRoZSB1QVBJIHdpbGwgYmUgY29uc2lzdGVudCB3aXRoIGxlc3MNCmR1cGxpY2F0aW9uIHRoYW4g
cHV0dGluZyBpdCBpbiBodyBlbmdpbmUuDQoNCj4gDQo+ID4gDQo+ID4gb3RoZXIgaXNzdWUgaGVy
ZSBhbmQgaW4gb3RoZXIgcGF0Y2hlcyBvZiB0aGlzIGh1Z2UgcGF0Y2ggc2VyaWVzLg0KPiA+IA0K
PiA+IGEgcHJldmlvdXMgcGF0Y2ggaW4gdGhpcyBzZXJpZXMgcmVuYW1lZCBuZWFyX21lbV9yZWdp
b25zLCB0aGVuIHRoaXMgb25lIG1vdmVzIGl0IHRvIG90aGVyIHN0cnVjdC4uLiBwbGVhc2UgZHJv
cCB0aGUgZmlyc3QgcGF0Y2ggYW5kIHJlbmFtZSBhbmQgbW92ZSBpdA0KPiA+IGludG8gYSBzaW5n
bGUgcGF0Y2guDQo+IA0KPiBva2F5LCByZW5hbWUgYW5kIG1vdmUgaW4gdGhlIHNhbWUgcGF0Y2gg
a2luZCBvZiBtYWtlcyBzZW5zZS4gYW5kIHBhdGNoZXMNCj4gY291bGQgYmUgc3F1YXNoZWQgdG9n
ZXRoZXIuIEJ1dCB3aGVuIGRvaW5nIHRoZSBJR1Qgb24gdGhlIHNpZGUsIEkgZmVsdA0KPiB0aGF0
IHNtYWxsIGNoYW5nZXMgd2VyZSBiZXR0ZXIsIHNvIHJlbmFtZXMgZ29lcyB3aXRoIHNlZCBjb21t
YW5kcyBhbmQNCj4gdGhlIHBhdGNoIHdhcyBzbWFsbCBhbmQgY2xlYXIuIEJ1dCBJIGRvbid0IG1p
bmQgaWYgdGhleSBnZXQgc3F1YXNoZWQgaW4NCj4gdGhlIGVuZC4NCj4gDQo+ID4gDQo+ID4gYSBz
ZXJpZXMgYXMgYmlnIGFzIHRoaXMgb25lIHdpbGwgY2F1c2UgcmV2aWV3cyBpbiBLTUQgYW5kIFVN
RCB0byB0YWtlIGEgd2hpbGUuLi4NCj4gDQo+IHRoYXQncyB1bmZvcnR1bmF0ZSBpbmRlZWQuIEJ1
dCBiaWcgcGF0Y2hlcyBhbHNvIGRvbid0IGhlbHAgbXVjaCB0byBzcGVlZCB1cCByZXZpZXdzLg0K
PiANCj4gPiANCj4gPiA+IA0KPiA+ID4gPiANCj4gPiA+ID4gU28sIGxldCdzIG1vdmUgdGhpcyBv
dXQgZnJvbSB0aGUgR1QgYW5kIGludG8gdGhlIGVuZ2luZSBpbmZvLg0KPiA+ID4gPiANCj4gPiA+
ID4gU2lnbmVkLW9mZi1ieTogUm9kcmlnbyBWaXZpIDxyb2RyaWdvLnZpdmlAaW50ZWwuY29tPg0K
PiA+ID4gPiAtLS0NCj4gPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9xdWVyeS5jIHwgMTQg
KysrKysrKy0tLS0tLS0NCj4gPiA+ID4gIGluY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmggICAgIHwg
MjcgKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tDQo+ID4gPiA+ICAyIGZpbGVzIGNoYW5nZWQs
IDIxIGluc2VydGlvbnMoKyksIDIwIGRlbGV0aW9ucygtKQ0KPiA+ID4gPiANCj4gPiA+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9xdWVyeS5jIGIvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX3F1ZXJ5LmMNCj4gPiA+ID4gaW5kZXggYWE1NzQzZTJlNGQwLi40OWE5YjM2ZjExOTMg
MTAwNjQ0DQo+ID4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9xdWVyeS5jDQo+ID4g
PiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9xdWVyeS5jDQo+ID4gPiA+IEBAIC0yMTcs
NiArMjE3LDEzIEBAIHN0YXRpYyBpbnQgcXVlcnlfZW5naW5lcyhzdHJ1Y3QgeGVfZGV2aWNlICp4
ZSwNCj4gPiA+ID4gIAkJCQlod2UtPmxvZ2ljYWxfaW5zdGFuY2U7DQo+ID4gPiA+ICAJCQlod19l
bmdpbmVfaW5mb1tpXS5pbnN0YW5jZS5ndF9pZCA9IGd0LT5pbmZvLmlkOw0KPiA+ID4gPiAgCQkJ
aHdfZW5naW5lX2luZm9baV0uaW5zdGFuY2UucGFkID0gMDsNCj4gPiA+ID4gKwkJCWlmICghSVNf
REdGWCh4ZSkpDQo+ID4gPiA+ICsJCQkJaHdfZW5naW5lX2luZm9baV0ubmVhcl9tZW1fcmVnaW9u
cyA9IDB4MTsNCj4gPiA+ID4gKwkJCWVsc2UNCj4gPiA+ID4gKwkJCQlod19lbmdpbmVfaW5mb1tp
XS5uZWFyX21lbV9yZWdpb25zID0NCj4gPiA+ID4gKwkJCQkJQklUKGd0X3RvX3RpbGUoZ3QpLT5p
ZCkgPDwgMTsNCj4gPiA+ID4gKwkJCWh3X2VuZ2luZV9pbmZvW2ldLmZhcl9tZW1fcmVnaW9ucyA9
IHhlLT5pbmZvLm1lbV9yZWdpb25fbWFzayBeDQo+ID4gPiA+ICsJCQkJaHdfZW5naW5lX2luZm9b
aV0ubmVhcl9tZW1fcmVnaW9uczsNCj4gPiA+ID4gIAkJCW1lbXNldChod19lbmdpbmVfaW5mby0+
cmVzZXJ2ZWQsIDAsIHNpemVvZihod19lbmdpbmVfaW5mby0+cmVzZXJ2ZWQpKTsNCj4gPiA+ID4g
IA0KPiA+ID4gPiAgCQkJaSsrOw0KPiA+ID4gPiBAQCAtMzc3LDEzICszODQsNiBAQCBzdGF0aWMg
aW50IHF1ZXJ5X2d0X2xpc3Qoc3RydWN0IHhlX2RldmljZSAqeGUsIHN0cnVjdCBkcm1feGVfZGV2
aWNlX3F1ZXJ5ICpxdWVyeQ0KPiA+ID4gPiAgCQkJZ3RfbGlzdC0+Z3RfbGlzdFtpZF0udHlwZSA9
IERSTV9YRV9RVUVSWV9HVF9UWVBFX01BSU47DQo+ID4gPiA+ICAJCWd0X2xpc3QtPmd0X2xpc3Rb
aWRdLmd0X2lkID0gZ3QtPmluZm8uaWQ7DQo+ID4gPiA+ICAJCWd0X2xpc3QtPmd0X2xpc3RbaWRd
LmNsb2NrX2ZyZXEgPSBndC0+aW5mby5jbG9ja19mcmVxOw0KPiA+ID4gPiAtCQlpZiAoIUlTX0RH
RlgoeGUpKQ0KPiA+ID4gPiAtCQkJZ3RfbGlzdC0+Z3RfbGlzdFtpZF0ubmVhcl9tZW1fcmVnaW9u
cyA9IDB4MTsNCj4gPiA+ID4gLQkJZWxzZQ0KPiA+ID4gPiAtCQkJZ3RfbGlzdC0+Z3RfbGlzdFtp
ZF0ubmVhcl9tZW1fcmVnaW9ucyA9DQo+ID4gPiA+IC0JCQkJQklUKGd0X3RvX3RpbGUoZ3QpLT5p
ZCkgPDwgMTsNCj4gPiA+ID4gLQkJZ3RfbGlzdC0+Z3RfbGlzdFtpZF0uZmFyX21lbV9yZWdpb25z
ID0geGUtPmluZm8ubWVtX3JlZ2lvbl9tYXNrIF4NCj4gPiA+ID4gLQkJCWd0X2xpc3QtPmd0X2xp
c3RbaWRdLm5lYXJfbWVtX3JlZ2lvbnM7DQo+ID4gPiA+ICAJfQ0KPiA+ID4gPiAgDQo+ID4gPiA+
ICAJaWYgKGNvcHlfdG9fdXNlcihxdWVyeV9wdHIsIGd0X2xpc3QsIHNpemUpKSB7DQo+ID4gPiA+
IGRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oIGIvaW5jbHVkZS91YXBpL2Ry
bS94ZV9kcm0uaA0KPiA+ID4gPiBpbmRleCA1MTY0ZWQxNTBhMmUuLjhlODRlZjZmZDQ2ZSAxMDA2
NDQNCj4gPiA+ID4gLS0tIGEvaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaA0KPiA+ID4gPiArKysg
Yi9pbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oDQo+ID4gPiA+IEBAIC0yMjgsNiArMjI4LDIwIEBA
IHN0cnVjdCBkcm1feGVfcXVlcnlfZW5naW5lX2luZm8gew0KPiA+ID4gPiAgCS8qKiBAaW5zdGFu
Y2U6IFRoZSBAZHJtX3hlX2VuZ2luZV9jbGFzc19pbnN0YW5jZSAqLw0KPiA+ID4gPiAgCXN0cnVj
dCBkcm1feGVfZW5naW5lX2NsYXNzX2luc3RhbmNlIGluc3RhbmNlOw0KPiA+ID4gPiAgDQo+ID4g
PiA+ICsJLyoqDQo+ID4gPiA+ICsJICogQG5lYXJfbWVtX3JlZ2lvbnM6IEJpdCBtYXNrIG9mIGlu
c3RhbmNlcyBmcm9tDQo+ID4gPiA+ICsJICogZHJtX3hlX3F1ZXJ5X21lbV9yZWdpb25zIHRoYXQg
aXMgbmVhciB0aGlzIGVuZ2luZS4NCj4gPiA+ID4gKwkgKi8NCj4gPiA+ID4gKwlfX3U2NCBuZWFy
X21lbV9yZWdpb25zOw0KPiA+ID4gPiArCS8qKg0KPiA+ID4gPiArCSAqIEBmYXJfbWVtX3JlZ2lv
bnM6IEJpdCBtYXNrIG9mIGluc3RhbmNlcyBmcm9tDQo+ID4gPiA+ICsJICogZHJtX3hlX3F1ZXJ5
X21lbV9yZWdpb25zIHRoYXQgaXMgZmFyIGZyb20gdGhpcyBlbmdpbmUuDQo+ID4gPiA+ICsJICog
SW4gZ2VuZXJhbCwgaXQgaGFzIGV4dHJhIGluZGlyZWN0aW9ucyB3aGVuIGNvbXBhcmVkIHRvIHRo
ZQ0KPiA+ID4gPiArCSAqIEBuZWFyX21lbV9yZWdpb25zLiBGb3IgYSBkaXNjcmV0ZSBkZXZpY2Ug
dGhpcyBjb3VsZCBtZWFuIHN5c3RlbQ0KPiA+ID4gPiArCSAqIG1lbW9yeSBhbmQgbWVtb3J5IGxp
dmluZyBpbiBhIGRpZmZlcmVudCBUaWxlLg0KPiA+ID4gPiArCSAqLw0KPiA+ID4gPiArCV9fdTY0
IGZhcl9tZW1fcmVnaW9uczsNCj4gPiA+ID4gKw0KPiA+ID4gPiAgCS8qKiBAcmVzZXJ2ZWQ6IFJl
c2VydmVkICovDQo+ID4gPiA+ICAJX191NjQgcmVzZXJ2ZWRbM107DQo+ID4gPiA+ICB9Ow0KPiA+
ID4gPiBAQCAtNDAxLDE5ICs0MTUsNiBAQCBzdHJ1Y3QgZHJtX3hlX3F1ZXJ5X2d0IHsNCj4gPiA+
ID4gIAlfX3UxNiBndF9pZDsNCj4gPiA+ID4gIAkvKiogQGNsb2NrX2ZyZXE6IEEgY2xvY2sgZnJl
cXVlbmN5IGZvciB0aW1lc3RhbXAgKi8NCj4gPiA+ID4gIAlfX3UzMiBjbG9ja19mcmVxOw0KPiA+
ID4gPiAtCS8qKg0KPiA+ID4gPiAtCSAqIEBuZWFyX21lbV9yZWdpb25zOiBCaXQgbWFzayBvZiBp
bnN0YW5jZXMgZnJvbQ0KPiA+ID4gPiAtCSAqIGRybV94ZV9xdWVyeV9tZW1fcmVnaW9ucyB0aGF0
IGlzIG5lYXIgdGhlIGN1cnJlbnQgZW5naW5lcyBvZiB0aGlzIEdULg0KPiA+ID4gPiAtCSAqLw0K
PiA+ID4gPiAtCV9fdTY0IG5lYXJfbWVtX3JlZ2lvbnM7DQo+ID4gPiA+IC0JLyoqDQo+ID4gPiA+
IC0JICogQGZhcl9tZW1fcmVnaW9uczogQml0IG1hc2sgb2YgaW5zdGFuY2VzIGZyb20NCj4gPiA+
ID4gLQkgKiBkcm1feGVfcXVlcnlfbWVtX3JlZ2lvbnMgdGhhdCBpcyBmYXIgZnJvbSB0aGUgZW5n
aW5lcyBvZiB0aGlzIEdULg0KPiA+ID4gPiAtCSAqIEluIGdlbmVyYWwsIGl0IGhhcyBleHRyYSBp
bmRpcmVjdGlvbnMgd2hlbiBjb21wYXJlZCB0byB0aGUNCj4gPiA+ID4gLQkgKiBAbmVhcl9tZW1f
cmVnaW9ucy4gRm9yIGEgZGlzY3JldGUgZGV2aWNlIHRoaXMgY291bGQgbWVhbiBzeXN0ZW0NCj4g
PiA+ID4gLQkgKiBtZW1vcnkgYW5kIG1lbW9yeSBsaXZpbmcgaW4gYSBkaWZmZXJlbnQgVGlsZS4N
Cj4gPiA+ID4gLQkgKi8NCj4gPiA+ID4gLQlfX3U2NCBmYXJfbWVtX3JlZ2lvbnM7DQo+ID4gPiA+
ICAJLyoqIEByZXNlcnZlZDogUmVzZXJ2ZWQgKi8NCj4gPiA+ID4gIAlfX3U2NCByZXNlcnZlZFs4
XTsNCj4gPiA+ID4gIH07DQo+ID4gPiANCj4gPiANCg0K
