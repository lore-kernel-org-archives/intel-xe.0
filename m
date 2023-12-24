Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D339C3DA6E
	for <intel-xe@archiver.kernel.org>; Sun, 24 Dec 2023 00:26:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E1A510E06E;
	Sun, 24 Dec 2023 00:26:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0419210E06E
 for <intel-xe@lists.freedesktop.org>; Sun, 24 Dec 2023 00:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703377577; x=1734913577;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=9jc3qgFeN5efdyPqsolM0iF/6m3Q8PWzeVzdl3OHTRM=;
 b=l9vfSu7QDdBtFKfaLgqOl0TOh+ih6bwRivI+wUtetm3hGXp/hn9fNjFs
 UT5lO0APjsy35tEoyh8Ct/dsPcj7Yo9x3jfNTC38vvv5P/Tu6xWvTT+wa
 3NhRBxpEJpq0RFoPfwCLXoGk9yr+ZviOWrDc6VTr29LOXreKYcfAtXI/q
 a1dBUK2cKudsgLL1TBHVaFVK0cRUbN3VLTifZpnGP7kTg1QAfb9pm+vpd
 q6hRgRWHBFhzhWeMdny5RbxE6Vnr9RuCCSqD7JdlWD+jCeXbl8IgwEcWW
 8So6k4zkSr0BVIXrllCXLlUaMeRPdirTa4miSy7JquQrUjx9YIx3VopkO g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10933"; a="381196505"
X-IronPort-AV: E=Sophos;i="6.04,300,1695711600"; d="scan'208";a="381196505"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2023 16:26:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,300,1695711600"; d="scan'208";a="19452384"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Dec 2023 16:26:17 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sat, 23 Dec 2023 16:26:16 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sat, 23 Dec 2023 16:26:16 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sat, 23 Dec 2023 16:26:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b+CaF51+I1j5YqCaQvZE1YrwWqVJs3BAtbInaZyJJuxjStEn/QuFYWkq3YFNemFRgzVr5D3woJJk6WPSMRIC0GiUJPKXlTqbralqLNTZ/X2mFBq9FQD55kje7Ra5KBmDYjAwah64S6p1A4fOojbpbVgmFvJCfVNNepgnxw4cJQTYHKVH6JluUHARtKOPqOti0prsGnj6QLtCpkhcHpQ04oDEzUzDTi5CR6yn40W/isolUTo9jOKOhw4yLCa1m4Do7zngCDl+wFAXFcqXdR7ZC8pWtd5vmWKcCdM8m37B5vwcdwbvjUiRTXkTnsK9tP1m8OcmO4jbBcWOwOkMg50LsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9jc3qgFeN5efdyPqsolM0iF/6m3Q8PWzeVzdl3OHTRM=;
 b=fISjzxWwzFwMqjaEclHppcG8GTcO+Jvj7XLqKrX6SKiCi45LgSe8OMkF1QSi8yCDTtD/lDF0eO0muFN63i0aKB2HTr+pM6jrauUovlbVL4mnRb9xDb7C2cErNBk2WhcbqswKw0jOWmlseSbVw8gQ6ns5V0uEl9za/omUCJZVIwcc0qYtMPNSx+shPubuD65ZIu8wKg/G9mSiplfHxCL60vazc92hqthObtHu6B02zyRm/9nxuRStWsSW1TFLVJXQpjTjGHDZFsk5WLyXLJiBJeejusFcbeicmmyKHhONT11WPJqi8Igg3+Jl1X7ywEf41dQTTla8ZFRS5Ylj1bByDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by SA2PR11MB4825.namprd11.prod.outlook.com (2603:10b6:806:111::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.24; Sun, 24 Dec
 2023 00:26:13 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::8076:c5fe:e0fc:cfaf]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::8076:c5fe:e0fc:cfaf%7]) with mapi id 15.20.7113.023; Sun, 24 Dec 2023
 00:26:13 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Elbaz, 
 Koby (Habana)" <kelbaz@habana.ai>
Subject: Re: [PATCH v2 2/2] drm/xe: restore xe_mmio_ioctl as the ioctl handler
 of the mmio debugfs file
Thread-Topic: [PATCH v2 2/2] drm/xe: restore xe_mmio_ioctl as the ioctl
 handler of the mmio debugfs file
Thread-Index: AQHaM3NR5HG0DHSA4Uykl1rRsiBnSLC3mK8A
Date: Sun, 24 Dec 2023 00:26:12 +0000
Message-ID: <ce121c183ceda0ddd38f5c0457bcd536915f34d3.camel@intel.com>
References: <20231220183447.297585-1-kelbaz@habana.ai>
 <20231220183447.297585-2-kelbaz@habana.ai>
In-Reply-To: <20231220183447.297585-2-kelbaz@habana.ai>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|SA2PR11MB4825:EE_
x-ms-office365-filtering-correlation-id: 41a5ba4e-24f1-4785-3800-08dc0416ef4a
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: C/F9V+UfmYolaFI8+qUYcsUTLZzsZXCiUQ6ZQEJGzBPLTHA8d0q5oFooKz/+Xpk+mXP6QAtmyClDRJtHuOVdy1jNtr7U4bqCzQvsfBZg4wvFAVakw14WdTtd332Y9AcG7fUvHTf3W2pvLIOR0+/FJSpGmlLqrKEfIERK9xUQ6ayTNXnBExpuDqEyEbG392LbxZjtQ07+LjIxdbJ+gn95nYO8ZRvvJCp/7bvDrnvh+S7WCPoSkm+HdtW74EFTSsvfMwJ1pZE+FRCZKOrkkjELfQA7lrj5DeX3f8NsKi/AZSJnsYDMnFeEbya61BToVgBktBvRSW03IicM1ZBvJWw+noRMlZzWswRrZhF+IM1+jk98CPIo8LdRU/YFwKrfP1Vcrb6CujXfBgUU4+N9iXx6ga45zoAi7qx2A6WiERHHbcfF6iQWNe7xJUKbs0M74SoG41tLmdKMQgljurQKNJNAorTjbUzWmslD5HLoQk/kcRVD88I6FvQQSSnjQgmJzDYl6AuuBE7aeRXKB7OlAYOWmHt19fVrqXDePDzZWhM7S1sYRsChyxq+TZJJ1CM0epYhJcW/OvBNxsCLPq7T3TBtj/D41pe7RCDI3cWeUP1j80uu0VhdhRaw9EQISaJjzNPr
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(39860400002)(396003)(366004)(346002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(4001150100001)(5660300002)(122000001)(86362001)(8936002)(36756003)(41300700001)(38100700002)(2906002)(8676002)(4326008)(38070700009)(76116006)(91956017)(110136005)(316002)(66476007)(66946007)(54906003)(64756008)(66446008)(66556008)(478600001)(82960400001)(6486002)(107886003)(2616005)(83380400001)(71200400001)(26005)(6506007)(6512007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bzFJZHVzN05EYlFieXMzVGhKU3lmL0VUSHZ5aG1ad2hNNXhoZUtjdlhUWi96?=
 =?utf-8?B?Q1RRK2doOXgxSHNmL3pQUVJpanNES0RIREc1cXluM1JvclcwSmtaYXlmOWZn?=
 =?utf-8?B?ZkNDWmZEaGo3bk96Qzhyb0F6MTlrQXhMeDFpSmx2WU1LNlJVb1V4NHN3M2J2?=
 =?utf-8?B?a2k5S1RIV0JFUkVxU29DclBkeXlxV3g3K09Md21GdjZIYVB5d0hHTGRldEE2?=
 =?utf-8?B?NDdwMzh6M3VLbVdENm0zZld6djhhclBVWG9TK29QbEJJa04rTy9JWGdPanhk?=
 =?utf-8?B?bXlNSDg1bG5tVU81ZVNLWk1ldHpzVThWNVVXQnQvWEZoWnZxbmErNmxXcGFv?=
 =?utf-8?B?cVpBL2N3K3dycVhtWjdhUUhLc29YMTVMODljRWFRT1dsMHcxVnd1MTJWL3lu?=
 =?utf-8?B?RXpXMk1ZRjZCVUlEbU5zVTU2anFWdnNzNENJeTlEamZyeUVDeXBtOWF5QXlE?=
 =?utf-8?B?OUpabldmbG0xbjkzMEhYbjdJeWxCV0dKV0phTzNjMHBCV28zQ3E2VlJISEx6?=
 =?utf-8?B?UE1YZWFheUZ2TExYMW1IMXJpNzlDMHRmcmF2MmZ6L0MyS3ljRndhUU5uWFNM?=
 =?utf-8?B?OGtDTFdrbEdsalUrYUFWWlZEZHFBSklrUlhWUXpWS2U1VWhnTnV1Z1BOS0ho?=
 =?utf-8?B?Vm1mYllRNEhMZ1E1c1JFakx4TWpRN3F4QitJVFYybUU5UEUxbndyZTBhVFZv?=
 =?utf-8?B?MnNqeHdQRVZpbG9RUDJNanNMd0hQSXlsOGNxTVBvczM5N1NpOFlaYWszN1l4?=
 =?utf-8?B?blE0NGFLbjlibjlsNUQxaTMxTm51UldVVnNNejY3TU1OOGlOc1FkNkcrMVF5?=
 =?utf-8?B?K0Izalp6cjFpSmcvOUV5aVovVkRmM3hqb3FWR1NobGo1N1RKQlR1NHl5RGor?=
 =?utf-8?B?bWlOeXJRcTlLTEg3eW5CZk5rTk02dnZxM0FWd0w0ZDlEbmdqUnhPUW15VFB4?=
 =?utf-8?B?ekFENmw0MTBjQXNqK0ZmRm5TOHVwdDZ4c3liK0xDR1V4MjBPZTZvTEVKejBN?=
 =?utf-8?B?ejVjM0pUNjJ6NjhXTkthTXFWN3hVVjlYcGtCcGVrWjQrM3FuaHRIazhwZ0dz?=
 =?utf-8?B?K2k4QnZoNHBEMFR0WWFBdzd0a1pxcUtiR3poVm54aktFcGxxL3ZEOUJ1RVI4?=
 =?utf-8?B?ektZa0MycHY2dkQ0aEQvQmlrZjhHaXlLRXdlNmFoa2M0ZGdXSjJrN1Q0OHcw?=
 =?utf-8?B?aEJaSzNlK1pXSGN0bGc2M1E3YXZjc3NGZi9ETU1kbjFTMVRBZ25hM0d0N3RR?=
 =?utf-8?B?dms0REhBZHBOMVRQWjFJVVlWSXpwYU00T2RkNlJ5cktLbGI3M3RqV0JmWWRh?=
 =?utf-8?B?bUg1WWs3UmhZN1drVjJNelZzOXFGelh5TFhWRW1YL1lWaGFWZnY0eDVwR0ph?=
 =?utf-8?B?SkFPV3VoTm5KaWlyV002RWRkOHd2WVNBR0VKMlZhT056STBOQTZCQUU2dnZB?=
 =?utf-8?B?S0dmanp3eGRQbm95WktaOTBVNTRUTE4zWFFTRTdmT2JEaDdYQjdram50OVJL?=
 =?utf-8?B?VVY1ckR5K2VMMUh2WnFWVldSSlFId1ZGTkFYT3JoZ0ErZWVhTm5yQUVScklB?=
 =?utf-8?B?bFovY0Zmd25xQ3R2c2FOQzFQZUdqMjdRRkN4dnRuR3hja2tETk1UZTdZa0xn?=
 =?utf-8?B?aEd0TTBvdFB2NDJLUnVkYUhzTTBvWDNtbDVqL3oxM2NNWUFvZk00Sm5DdmNr?=
 =?utf-8?B?dHBpYm8raWhBd1VabWVGRTkzejNzWlp0MlVyL1hqajF4RHFOQWJTMFdkVnQ1?=
 =?utf-8?B?ZXM2dlVKczZiV3kvcWY4bnZweFh5bHN2djVrZ2MzY3FFNktqS01wVkliOHV0?=
 =?utf-8?B?UDNhK3h0ZEV3WkEyY3dOTnNNcEs4Unk0eklEd0N3MWJiQWd6UlAva2JyWkRQ?=
 =?utf-8?B?UWptaHEwUzNLdXBtNU5xSmFWOFZEMnZpZnFad0VCTkNwL0JTTjJuOGtqRDFj?=
 =?utf-8?B?L2NZVjNveW5KT0ovVjNVVkYwRzRKREFKOWE0bFY5ZTl0blkwMFM0bFNLRzF0?=
 =?utf-8?B?V2Rzbjk3cnh5RzV1YTFtOHQwSFNwMDBhdjVHV0tnRjhVYkJuMGloOXNvVlA4?=
 =?utf-8?B?MGN1YUxiamR4YndrSWJkK00yaVN3SjhRb3NPRS9FSHkvYUdIaks5MUU5dGVT?=
 =?utf-8?B?dm5ueUk1cDhJVFYwOWFIdjM2WXRVTGdEREtsbFJWMnJYUXQzL2pWbExMRmxN?=
 =?utf-8?B?U3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9DB7B55BA454B24DBD29A35B22493290@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41a5ba4e-24f1-4785-3800-08dc0416ef4a
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Dec 2023 00:26:13.0071 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BzBXuaF0+EpSilEayQyJyTU5OfLSUtwxTIM0ZfEl56GHoOy8Oz0ihhnqKbnZT+fPCPY7wTzFEvz+zn0Shax45Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4825
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
Cc: "daniel@ffwll.ch" <daniel@ffwll.ch>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIzLTEyLTIwIGF0IDIwOjM0ICswMjAwLCBLb2J5IEVsYmF6IHdyb3RlOg0KPiBU
aGUgZHJtIG1taW8gaW9jdGwgaGFuZGxlciAoeGVfbW1pb19pb2N0bCkgd2Fzbid0IG5lZWRlZCBh
bnltb3JlLA0KPiBhbmQgdGhlcmVmb3JlLCByZWNlbnRseSByZW1vdmVkLg0KPiBOZXZlcnRoZWxl
c3MsIGl0IGlzIG5vdyByZXN0b3JlZCBmb3IgZGVidWdnaW5nIHB1cnBvc2VzIHRvIGZ1bmN0aW9u
DQo+IGFzIHRoZSBpb2N0bCBoYW5kbGVyIG9mIHRoZSAnbW1pbycgZGVidWdmcyBmaWxlLg0KPiBO
b3RlLCB0aGF0IHRoZSBub24tYWRtaW4gdXNlcidzIGxpbWl0ZWQgbW1pbyBhY2Nlc3MgKGFrYSwg
d2hpdGVsaXN0KSwNCj4gd2FzIHJlbW92ZWQgYmVpbmcgaXJyZWxldmFudCBhbnltb3JlLCBub3cg
dGhhdCBhIHVzZXIgdXNpbmcgZGVidWdmcw0KPiBtdXN0IGFueXdheSBoYXZlIHJvb3QgcGVybWlz
c2lvbiB0byB1c2UgaXQuDQoNCnlvdSBjYW4gdXNlIGEgSUdUIHRvb2wgY2FsbGVkIGludGVsX3Jl
ZyB0aGF0IGRvZXMgd2hhdCB5b3Ugd2FudCB3aXRob3V0IGFkZGluZyBhbnkgbGluZSB0byBYZSBk
cml2ZXIuDQoNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEtvYnkgRWxiYXogPGtlbGJhekBoYWJhbmEu
YWk+DQo+IC0tLQ0KPiBDaGFuZ2VzIGluIHYyOiByZW1vdmVkIHdoaXRlbGlzdCBzdXBwb3J0IGZv
ciBub24tYWRtaW4gdXNlcnMNCj4gDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfZGVidWdmcy5j
ICAgICAgfCAxMDcgKysrKysrKysrKysrKysrKysrKysrKysrKystDQo+ICBkcml2ZXJzL2dwdS9k
cm0veGUveGVfZGVidWdmc19tbWlvLmggfCAgNDQgKysrKysrKysrKysNCj4gIDIgZmlsZXMgY2hh
bmdlZCwgMTUwIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gIGNyZWF0ZSBtb2RlIDEw
MDY0NCBkcml2ZXJzL2dwdS9kcm0veGUveGVfZGVidWdmc19tbWlvLmgNCj4gDQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGVidWdmcy5jIGIvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2RlYnVnZnMuYw0KPiBpbmRleCBjMjQ2MzdmZjA5ZDguLmE0MzgxZTNkN2QzNyAxMDA2NDQN
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RlYnVnZnMuYw0KPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0veGUveGVfZGVidWdmcy5jDQo+IEBAIC0xMyw2ICsxMywxMCBAQA0KPiAgI2luY2x1
ZGUgInhlX2RldmljZS5oIg0KPiAgI2luY2x1ZGUgInhlX2d0X2RlYnVnZnMuaCINCj4gICNpbmNs
dWRlICJ4ZV9zdGVwLmgiDQo+ICsjaW5jbHVkZSAieGVfZGVidWdmc19tbWlvLmgiDQo+ICsjaW5j
bHVkZSAieGVfbW1pby5oIg0KPiArI2luY2x1ZGUgInJlZ3MveGVfcmVncy5oIg0KPiArI2luY2x1
ZGUgInJlZ3MveGVfZW5naW5lX3JlZ3MuaCINCj4gIA0KPiAgI2lmZGVmIENPTkZJR19EUk1fWEVf
REVCVUcNCj4gICNpbmNsdWRlICJ4ZV9ib19ldmljdC5oIg0KPiBAQCAtOTcsOCArMTAxLDEwOSBA
QCBzdGF0aWMgaW50IGZvcmNld2FrZV9yZWxlYXNlKHN0cnVjdCBpbm9kZSAqaW5vZGUsIHN0cnVj
dCBmaWxlICpmaWxlKQ0KPiAgCXJldHVybiAwOw0KPiAgfQ0KPiAgDQo+IC1zdGF0aWMgbG9uZyB4
ZV9kZWJ1Z2ZzX21taW9faW9jdGwoc3RydWN0IGZpbGUgKmYsIHVuc2lnbmVkIGludCBjbWQsIHVu
c2lnbmVkIGxvbmcgYXJnKQ0KPiArc3RhdGljIGludCBfeGVfZGVidWdmc19tbWlvX2lvY3RsKHN0
cnVjdCB4ZV9kZXZpY2UgKnhlLCBzdHJ1Y3QgeGVfZGVidWdmc19tbWlvX2lvY3RsX2RhdGEgKmFy
Z3MpDQo+ICB7DQo+ICsJc3RydWN0IHhlX2d0ICpndCA9IHhlX3Jvb3RfbW1pb19ndCh4ZSk7DQo+
ICsJdW5zaWduZWQgaW50IGJpdHNfZmxhZywgYnl0ZXM7DQo+ICsJc3RydWN0IHhlX3JlZyByZWc7
DQo+ICsJaW50IHJldCA9IDA7DQo+ICsNCj4gKwlpZiAoWEVfSU9DVExfREJHKHhlLCBhcmdzLT5l
eHRlbnNpb25zKSB8fA0KPiArCSAgICBYRV9JT0NUTF9EQkcoeGUsIGFyZ3MtPnJlc2VydmVkWzBd
IHx8IGFyZ3MtPnJlc2VydmVkWzFdKSkNCj4gKwkJcmV0dXJuIC1FSU5WQUw7DQo+ICsNCj4gKwlp
ZiAoWEVfSU9DVExfREJHKHhlLCBhcmdzLT5mbGFncyAmIH5YRV9ERUJVR0ZTX01NSU9fVkFMSURf
RkxBR1MpKQ0KPiArCQlyZXR1cm4gLUVJTlZBTDsNCj4gKw0KPiArCWlmIChYRV9JT0NUTF9EQkco
eGUsICEoYXJncy0+ZmxhZ3MgJiBYRV9ERUJVR0ZTX01NSU9fV1JJVEUpICYmIGFyZ3MtPnZhbHVl
KSkNCj4gKwkJcmV0dXJuIC1FSU5WQUw7DQo+ICsNCj4gKwliaXRzX2ZsYWcgPSBhcmdzLT5mbGFn
cyAmIFhFX0RFQlVHRlNfTU1JT19CSVRTX01BU0s7DQo+ICsJYnl0ZXMgPSAxIDw8IGJpdHNfZmxh
ZzsNCj4gKwlpZiAoWEVfSU9DVExfREJHKHhlLCBhcmdzLT5hZGRyICsgYnl0ZXMgPiB4ZS0+bW1p
by5zaXplKSkNCj4gKwkJcmV0dXJuIC1FSU5WQUw7DQo+ICsNCj4gKwkvKg0KPiArCSAqIFRPRE86
IGFsbG93IGRpc3RpbmN0aW9uIGJldHdlZW4gWEVfUkVHIC8gWEVfUkVHX0VYVCB0bw0KPiArCSAq
IGhhbmRsZSByZWdpc3RlcnMgZnJvbSBib3RoIE1NSU8gJiBNTUlPX0VYVCBzcGFjZS4NCj4gKwkg
Ki8NCj4gKw0KPiArCS8qDQo+ICsJICogVE9ETzogbWlncmF0ZSB0byB4ZV9ndF9tY3IgdG8gbG9v
a3VwIHRoZSBtbWlvIHJhbmdlIGFuZCBoYW5kbGUNCj4gKwkgKiBtdWx0aWNhc3QgcmVnaXN0ZXJz
LiBTdGVlcmluZyB3b3VsZCBuZWVkIHVhcGkgZXh0ZW5zaW9uLg0KPiArCSAqLw0KPiArCXJlZyA9
IFhFX1JFRyhhcmdzLT5hZGRyKTsNCj4gKw0KPiArCXhlX2RldmljZV9tZW1fYWNjZXNzX2dldCh4
ZSk7DQo+ICsJeGVfZm9yY2Vfd2FrZV9nZXQoZ3RfdG9fZncoZ3QpLCBYRV9GT1JDRVdBS0VfQUxM
KTsNCj4gKw0KPiArCWlmIChhcmdzLT5mbGFncyAmIFhFX0RFQlVHRlNfTU1JT19XUklURSkgew0K
PiArCQlzd2l0Y2ggKGJpdHNfZmxhZykgew0KPiArCQljYXNlIFhFX0RFQlVHRlNfTU1JT18zMkJJ
VDoNCj4gKwkJCWlmIChYRV9JT0NUTF9EQkcoeGUsIGFyZ3MtPnZhbHVlID4gVTMyX01BWCkpIHsN
Cj4gKwkJCQlyZXQgPSAtRUlOVkFMOw0KPiArCQkJCWdvdG8gZXhpdDsNCj4gKwkJCX0NCj4gKwkJ
CXhlX21taW9fd3JpdGUzMihndCwgcmVnLCBhcmdzLT52YWx1ZSk7DQo+ICsJCQlicmVhazsNCj4g
KwkJZGVmYXVsdDoNCj4gKwkJCWRybV9kYmcoJnhlLT5kcm0sICJJbnZhbGlkIE1NSU8gYml0IHNp
emUiKTsNCj4gKwkJCWZhbGx0aHJvdWdoOw0KPiArCQljYXNlIFhFX0RFQlVHRlNfTU1JT184QklU
OiAvKiBUT0RPICovDQo+ICsJCWNhc2UgWEVfREVCVUdGU19NTUlPXzE2QklUOiAvKiBUT0RPICov
DQo+ICsJCQlyZXQgPSAtRU9QTk9UU1VQUDsNCj4gKwkJCWdvdG8gZXhpdDsNCj4gKwkJfQ0KPiAr
CX0NCj4gKw0KPiArCWlmIChhcmdzLT5mbGFncyAmIFhFX0RFQlVHRlNfTU1JT19SRUFEKSB7DQo+
ICsJCXN3aXRjaCAoYml0c19mbGFnKSB7DQo+ICsJCWNhc2UgWEVfREVCVUdGU19NTUlPXzMyQklU
Og0KPiArCQkJYXJncy0+dmFsdWUgPSB4ZV9tbWlvX3JlYWQzMihndCwgcmVnKTsNCj4gKwkJCWJy
ZWFrOw0KPiArCQljYXNlIFhFX0RFQlVHRlNfTU1JT182NEJJVDoNCj4gKwkJCWFyZ3MtPnZhbHVl
ID0geGVfbW1pb19yZWFkNjRfMngzMihndCwgcmVnKTsNCj4gKwkJCWJyZWFrOw0KPiArCQlkZWZh
dWx0Og0KPiArCQkJZHJtX2RiZygmeGUtPmRybSwgIkludmFsaWQgTU1JTyBiaXQgc2l6ZSIpOw0K
PiArCQkJZmFsbHRocm91Z2g7DQo+ICsJCWNhc2UgWEVfREVCVUdGU19NTUlPXzhCSVQ6IC8qIFRP
RE8gKi8NCj4gKwkJY2FzZSBYRV9ERUJVR0ZTX01NSU9fMTZCSVQ6IC8qIFRPRE8gKi8NCj4gKwkJ
CXJldCA9IC1FT1BOT1RTVVBQOw0KPiArCQl9DQo+ICsJfQ0KPiArDQo+ICtleGl0Og0KPiArCXhl
X2ZvcmNlX3dha2VfcHV0KGd0X3RvX2Z3KGd0KSwgWEVfRk9SQ0VXQUtFX0FMTCk7DQo+ICsJeGVf
ZGV2aWNlX21lbV9hY2Nlc3NfcHV0KHhlKTsNCj4gKw0KPiArCXJldHVybiByZXQ7DQo+ICt9DQo+
ICsNCj4gK3N0YXRpYyBsb25nIHhlX2RlYnVnZnNfbW1pb19pb2N0bChzdHJ1Y3QgZmlsZSAqZmls
cCwgdW5zaWduZWQgaW50IGNtZCwgdW5zaWduZWQgbG9uZyBhcmcpDQo+ICt7DQo+ICsJc3RydWN0
IHhlX2RldmljZSAqeGUgPSBmaWxlX2lub2RlKGZpbHApLT5pX3ByaXZhdGU7DQo+ICsJc3RydWN0
IHhlX2RlYnVnZnNfbW1pb19pb2N0bF9kYXRhIG1taW9fZGF0YTsNCj4gKwlpbnQgcmV0Ow0KPiAr
DQo+ICsJaWYgKGNtZCA9PSBYRV9ERUJVR0ZTX01NSU9fSU9DVEwpIHsNCj4gKwkJcmV0ID0gY29w
eV9mcm9tX3VzZXIoJm1taW9fZGF0YSwgKHN0cnVjdCB4ZV9kZWJ1Z2ZzX21taW9faW9jdGxfZGF0
YSBfX3VzZXIgKilhcmcsDQo+ICsJCQkJc2l6ZW9mKG1taW9fZGF0YSkpOw0KPiArCQlpZiAocmV0
KQ0KPiArCQkJcmV0dXJuIC1FRkFVTFQ7DQo+ICsNCj4gKwkJcmV0ID0gX3hlX2RlYnVnZnNfbW1p
b19pb2N0bCh4ZSwgJm1taW9fZGF0YSk7DQo+ICsJCWlmIChyZXQpDQo+ICsJCQlyZXR1cm4gcmV0
Ow0KPiArDQo+ICsJCXJldCA9IGNvcHlfdG9fdXNlcigoc3RydWN0IHhlX2RlYnVnZnNfbW1pb19p
b2N0bF9kYXRhIF9fdXNlciAqKWFyZywNCj4gKwkJCQkmbW1pb19kYXRhLCBzaXplb2YobW1pb19k
YXRhKSk7DQo+ICsJCWlmIChyZXQpDQo+ICsJCQlyZXR1cm4gLUVGQVVMVDsNCj4gKwl9IGVsc2Ug
ew0KPiArCQlyZXR1cm4gLUVJTlZBTDsNCj4gKwl9DQo+ICsNCj4gIAlyZXR1cm4gMDsNCj4gIH0N
Cj4gIA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RlYnVnZnNfbW1pby5o
IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RlYnVnZnNfbW1pby5oDQo+IG5ldyBmaWxlIG1vZGUg
MTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAwMDAwMC4uNTI1OTBiNWFjYTBlDQo+IC0tLSAvZGV2L251
bGwNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RlYnVnZnNfbW1pby5oDQo+IEBAIC0w
LDAgKzEsNDQgQEANCj4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBNSVQgKi8NCj4gKy8q
DQo+ICsgKiBDb3B5cmlnaHQgwqkgMjAyMyBJbnRlbCBDb3Jwb3JhdGlvbg0KPiArICovDQo+ICsN
Cj4gKyNpZm5kZWYgX1hFX0RFQlVHRlNfTU1JT19IXw0KPiArI2RlZmluZSBfWEVfREVCVUdGU19N
TUlPX0hfDQo+ICsNCj4gKyNpbmNsdWRlIDxkcm0vZHJtLmg+DQo+ICsNCj4gKyNkZWZpbmUgWEVf
REVCVUdGU19NTUlPXzhCSVQJCTB4MA0KPiArI2RlZmluZSBYRV9ERUJVR0ZTX01NSU9fMTZCSVQJ
CTB4MQ0KPiArI2RlZmluZSBYRV9ERUJVR0ZTX01NSU9fMzJCSVQJCTB4Mg0KPiArI2RlZmluZSBY
RV9ERUJVR0ZTX01NSU9fNjRCSVQJCTB4Mw0KPiArI2RlZmluZSBYRV9ERUJVR0ZTX01NSU9fQklU
U19NQVNLCTB4Mw0KPiArI2RlZmluZSBYRV9ERUJVR0ZTX01NSU9fUkVBRAkJMHg0DQo+ICsjZGVm
aW5lIFhFX0RFQlVHRlNfTU1JT19XUklURQkJMHg4DQo+ICsNCj4gKyNkZWZpbmUgWEVfREVCVUdG
U19NTUlPX1ZBTElEX0ZMQUdTIChcDQo+ICsJWEVfREVCVUdGU19NTUlPX0JJVFNfTUFTSyB8XA0K
PiArCVhFX0RFQlVHRlNfTU1JT19SRUFEIHxcDQo+ICsJWEVfREVCVUdGU19NTUlPX1dSSVRFKQ0K
PiArDQo+ICtzdHJ1Y3QgeGVfZGVidWdmc19tbWlvX2lvY3RsX2RhdGEgew0KPiArCS8qKiBAZXh0
ZW5zaW9uczogUG9pbnRlciB0byB0aGUgZmlyc3QgZXh0ZW5zaW9uIHN0cnVjdCwgaWYgYW55ICov
DQo+ICsJX191NjQgZXh0ZW5zaW9uczsNCj4gKw0KPiArCV9fdTMyIGFkZHI7DQo+ICsNCj4gKwlf
X3UzMiBmbGFnczsNCj4gKw0KPiArCV9fdTY0IHZhbHVlOw0KPiArDQo+ICsJLyoqIEByZXNlcnZl
ZDogUmVzZXJ2ZWQgKi8NCj4gKwlfX3U2NCByZXNlcnZlZFsyXTsNCj4gK307DQo+ICsNCj4gKyNk
ZWZpbmUgWEVfREVCVUdGU19NTUlPX0lPQ1RMX05SCTB4MDANCj4gKw0KPiArI2RlZmluZSBYRV9E
RUJVR0ZTX01NSU9fSU9DVEwgXA0KPiArCV9JT1dSKDB4MjAsIFhFX0RFQlVHRlNfTU1JT19JT0NU
TF9OUiwgc3RydWN0IHhlX2RlYnVnZnNfbW1pb19pb2N0bF9kYXRhKQ0KPiArDQo+ICsNCj4gKyNl
bmRpZiAvKiBfWEVfREVCVUdGU19NTUlPX0hfICovDQoNCg==
