Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7FF5C48BC4
	for <intel-xe@archiver.kernel.org>; Tue, 20 Feb 2024 19:51:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DB2E10E54C;
	Tue, 20 Feb 2024 19:51:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LFa7nDQd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41E6610E54C
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Feb 2024 19:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708458715; x=1739994715;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=YOEMumRJBaDKuki0WrOBgj9+FbE4kszliNFHNB5IABs=;
 b=LFa7nDQdahiN11QpOahdVziliL/SCNum3Kz9jdQynEUe/RUn55VCUXWG
 u79R48l0cF+CDE0Qdwdeu2ExA1xcinAlPxy4iACvGXggm2RNPD+PkMaHO
 pcd3WT2tP2gkCD8Qcy/gONtoLtAis9GeyDwfhboW8VUMgmSne9K0qb43A
 DFctlp5cuzrdqLUc8QVAOkjSikWLjW/L37YkgQdQDKDVK+NXfC5KOF54Q
 68Cdtpst3yhgi76KuDJprB559UJWGr9ux7yzj1omDSaO5dAIx0orueGZZ
 DsTD0/impCcTGzSwAvRH7EQCcN2VU0vdEYdmR0Gs8dLLTPvgLEfZPuxdn g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="2446067"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="2446067"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 11:51:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="4839897"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Feb 2024 11:51:55 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 20 Feb 2024 11:51:54 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 20 Feb 2024 11:51:53 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 20 Feb 2024 11:51:53 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 20 Feb 2024 11:51:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AKaSTHUpIJSLNLKm4pnWENIPgFmLlVVyqU+kAIQNpabHKgdDc+4VOj7WF17MCM9eHOvt9eAaxNMSPXrFaknIgfWvy6LkUR4DdIOOtitmz5EUuH+AQAb9gkQE90QYfvXmm6JrVy93hE4MGakcd+pqDG/Yq8Q7OQvf0DIfrLVSwEvCLNkOa+oHaG/zjTfWyi55albHosk6l4xJDZ50v6MPT45SQg5VYmHTmWiCizf17Q9jg9sK+Vg1UzSo+bbjruFSo1g2FTMaz0LMDQsG9V9uNXE1Q+r0UagPezVsS37Nx8YTPbK/nAph0iUE5YwzvlEDbXQDE9lgyhxDtffLyyLgAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YOEMumRJBaDKuki0WrOBgj9+FbE4kszliNFHNB5IABs=;
 b=HM+OOW4CyHH+c2H9UeQuF/XLtAANOSxrRJEihEkbayWCF5x92Z/RQr8cPqoyItsduJ1u8XTDE9mKCez4mYCgt/4wo/zxkm7bJ9VSKEscc2b4xo05dnz6mks9O5jB731PJWJ1Jzl5hHkz/+TKu6ABWd5fP2HxXDH5MZGdeKV9srMxVz4a/bepnApXLxDOPLTGT8a8MUGkF1JFICgFCjy/zJBZDq+Wt35zgnYuQA4Qu+UpBe1OEJa1Bk3iRoatwJ1hFd0y4kvq1+L7lFZ60RNEDdsJ0ktal59QAvRNEcCI0CQdhebqlpMQ1Zz7rptDuEqMUR67f79Q14m/2HFdZBhrLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CO6PR11MB5620.namprd11.prod.outlook.com (2603:10b6:303:13e::17)
 by IA1PR11MB7775.namprd11.prod.outlook.com (2603:10b6:208:3f3::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.32; Tue, 20 Feb
 2024 19:51:51 +0000
Received: from CO6PR11MB5620.namprd11.prod.outlook.com
 ([fe80::a786:33f:a080:6e9a]) by CO6PR11MB5620.namprd11.prod.outlook.com
 ([fe80::a786:33f:a080:6e9a%5]) with mapi id 15.20.7292.036; Tue, 20 Feb 2024
 19:51:51 +0000
From: "Zanoni, Paulo R" <paulo.r.zanoni@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>
CC: "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2 0/3] Skip remap fixes
Thread-Topic: [PATCH v2 0/3] Skip remap fixes
Thread-Index: AQHaY3lEO6nRZsCMYku3i7L6fEhBH7ETpYoA
Date: Tue, 20 Feb 2024 19:51:51 +0000
Message-ID: <f46a2c6e8763cbd17fa8eb135eaf208fd5314890.camel@intel.com>
References: <20240219211942.3633795-1-matthew.brost@intel.com>
In-Reply-To: <20240219211942.3633795-1-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.4-2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5620:EE_|IA1PR11MB7775:EE_
x-ms-office365-filtering-correlation-id: c1931dba-d7ae-4be7-3177-08dc324d61ce
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZpFVZoTmDl/rXC/5oG8Hzl95J778d8VezFhix0/gel5XzeVdDz+zW7Cujz/70KoILGcdHdaHce1fDfjxn6LviXWrDOnE7Z0iDeY82ADHaFqn4WH/nrVZbLALjJ4fOmVUcmFPIP3n98eIG2ss9ImXwTgreUPO6n2/E5cJewdGQr5yof6MxUo1E0SoPxS0kXf0NBke6vTkxz9tG1peyuHAPYfwWyVg9cTKmTpIxSD09rYHbBUOcfXGWheI+3XKJlx3RL9NM6+3LxYPEmYdI6OEaaSCNpY1NgKkuWlkxUrRIXbC+r6ymOlV6XiS6SxhmrxXsP2gSihGrvX63l+uyfUvk1sr6vbAroHmpBh690ZTOOu7KYZTPlvMyAiQZ1zU+OJcxQkQSt3dZkEDmB4epkkHHAQZBEYB61Cnlc8v86XmPEGD/ar2qjprQGvKMo6oyiw7olU2QQYSjpQloD2HGmC94qy64W3ui8nqtI8pijicIKWSdpCOX/hdHO5SenOEBQTMo6LyINfmz57EbTOQ60ggJanZYe+2pjNpH7JnhxwcV3evhNrUIwmc9vOYH/QA6AxxGsd8xb7boq1UTWKH9XSuihG/E6rLfRsSirBGUiDNhVP35SRWkUdUDstFplLyjFhh
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR11MB5620.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Zld5N2dZVHpkSUFRNVBhTjFXd0FudisrQkk5K2Evcno0RkZyZW5GTXNRMXUx?=
 =?utf-8?B?YURBTVlVNzRWa29XWmYxSnV2REhGREVIczVJbXBvQXQ1c2lidlh3bTNyOVZG?=
 =?utf-8?B?WE9VdWoxZGhZc3ZFZk9SSUJHWUdxWThBNFRlb0ZTM0IrWFZrSVduZC9LWERL?=
 =?utf-8?B?eXZqSWZJV0FMazlRTFBXOTNPNkRWVTd1WXMwYmd4MGhPSUZkWnUvNk5PSVJs?=
 =?utf-8?B?VXppWWVJNG53cW0vYlNQS2p4NUZyME5qZHMvR0VCbWh5RU42T3pvbUdLUGhQ?=
 =?utf-8?B?MjRxTUkrcThWSThQaGVmVHd0Vjh5OFlmclpZT3VCNlZjZzdCQVh1YVFoWXZI?=
 =?utf-8?B?enF3YldxSFZJdDNwaG5udE8zbjdVMGNNWGMrQWNHaVliaks3aDIwb0ZrOWlX?=
 =?utf-8?B?QXI1MVYxTlpaK1I2SWRGaGlnZmtQVWFEMjRoTkNEZU9IUHByK2ljei8zL0NL?=
 =?utf-8?B?VkZVckVlOUI4MVlla0c3OUg5QzA3cjYwQWMwRWFpSVpGY1UwOGRZZW1VZzQx?=
 =?utf-8?B?Lzh1TGx2M2N2bW9RMlpDbUlGWE1GKzV6MGdyU2pnRVNHVWVNWW45cml6WkRk?=
 =?utf-8?B?Z1lQeCtJUWhBK3B4ZXVmTWd3RXFmNzdOcGtEM3pGRFh1WlNkdlZBUm1SQW1G?=
 =?utf-8?B?YmtSdFhsNm1uM2F6NERGNHdyaFVHWFEzQmNSMG1jMjF3YjdxOWNZMVBnWWV6?=
 =?utf-8?B?NGV3b0NmWmFPRW0vUUxhcEMwZThTNUQ0TEJZV1pTOW10amlpMFNMZVhpQ0ZP?=
 =?utf-8?B?MFhjM0pLMStIemp6akltcjNxSU55algvRkxERnlVWXNiUGVSeUVhcUVyMHZ3?=
 =?utf-8?B?K3VsakJlOW9FQWRsV2ROSGdJN1FJbHVtNTJUV2FQdlBoRE9BSWFnUnhOa2Vy?=
 =?utf-8?B?ZjA5VmZNRndJeG8rU1NmQVFGT0lrQkQzOW9xVHMwVmpobWpEQkh6SzEyVnU3?=
 =?utf-8?B?b2F3TkNSdGgyKzdld2ZPSlBuMEZYdUlJU3U4UHF2RlJWb0hRcmpLVTMyYnht?=
 =?utf-8?B?azc0MzNIT2NXMTFTc1BqYmtPTTRlaDJPcllvWjhsTFNad2NETjFGS2pJSnM4?=
 =?utf-8?B?ZzBkcWtlc1VTa2d5aG51R09pOGpmUncyRXRlZkZvTmpGUGQ4MW9mR0YwMjNG?=
 =?utf-8?B?UkxyaVRnK1FPYmx0QUZmVHpJNTliVUFXUjFWc20xc0I3MW5NSWZEQjNWaGZq?=
 =?utf-8?B?YXpycENCUmtHSVNDcUkrU3pCWS9tMXg3TEdFWm16YUZNRkUyRzl0WG9nMzh6?=
 =?utf-8?B?QVN4UTIrRlRlR25oQnNMUjVIWFFlNEdSZjduWTV2SU9VNENEQUxKOUw3by9X?=
 =?utf-8?B?RTgyQkRDYURHWFZuY0xkWVFGQS9ua2YwSHNpb2dvRFN1VHlpLytPS1pTaHR2?=
 =?utf-8?B?VVdOSkthU2dOUUJNWEZMM3l1VFBuQ1pIRzJsQ25WbHYyd2dqNnVTKzQ4ZStG?=
 =?utf-8?B?eGNoYjRrRkJvaHlCMm02NzA0ZitsUWl6Ky9lVkJBdTdVYWtiK0llai8rd2Zn?=
 =?utf-8?B?U1dTUkZSbk1HY0ZwcjJxeTdhWU5tYXFmT1RRck83MGNtR2lLeDRzL2J5SlAw?=
 =?utf-8?B?a08xZnVQUldOQ2ZrYkZIQ1cvMGQ2TC8yKytsK202akRlb045MnFqV0ppVkJZ?=
 =?utf-8?B?TVVzM0NjaWdLVmxuL2dnclloNjY2K1QybFJQeFBZYmtEZXBJN2VWVTlqaGlw?=
 =?utf-8?B?WkNybVFBaHVEK3J2c3pCM3FTaThiU1dvZjR3SWs1VFZzQ1ErTDdydTJWbTAw?=
 =?utf-8?B?TGQ4Y2loZnFGWmNOd2Jxc3VkTGJDMHNDbEw4cVRoVkJGT3lVNDRKRnFka2FO?=
 =?utf-8?B?aDkrWk0wdlBkOGVUOFd2Y3pkcFU3RVM4RmRlaHFpWFJCMGphbnNqTUFvelhK?=
 =?utf-8?B?N3E4eUlvSm5Pc0xYNTJTK2t4MlNJei8xcEtvcXp5M1oyZnQ1L2JKQ1lnRzdH?=
 =?utf-8?B?QkswM21MWGJoSlpXSHlhVEJwUUVMend6NUZsekZPcXE2eTJEc3UxSlhwUzRY?=
 =?utf-8?B?eGNaN0h0NGhxNnlSZGVGclRUeWQ2b05kL05MMTBwTHdiREEwK0dnc3A1RVpR?=
 =?utf-8?B?YUNmRHR0L3c2SitJT29uRUwwKzI0VzRxMGtsclB3cVViNW83Wk1taE1JMytM?=
 =?utf-8?B?SkxxQVk2bE1vV1ZDZ2hSMW5Da3hWNDYzR3RrUEIyL205UEFkREJZT25DV2Z5?=
 =?utf-8?B?aUR6L2xubWFlZmJhRzJuYXFqWW9iek1tNzhUS3NUYStScEt3OG5yS2FMT21N?=
 =?utf-8?B?dCtNbUxDU25LQ0ErYnJLa2dmdXh3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <60BECDC5ABF7554C938E0241A50040D3@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5620.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1931dba-d7ae-4be7-3177-08dc324d61ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2024 19:51:51.4050 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N12iR1YFsBE49coHx0ncuQraJbhHayLVHmLY2uAo+7hnkxQglbnBRuKVRg9ihxM214WluNG2cCQRJG7HqVrRpak71+b+n4GIrsTBwPfbEyY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7775
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

T24gTW9uLCAyMDI0LTAyLTE5IGF0IDEzOjE5IC0wODAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
PiBBIGZldyBmaXhlcyByZWxhdGVkIHRvIHNraXBwaW5nIHJlbWFwcy4NCj4gDQo+IFdpbGwgcHV0
IHRvZ2V0aGVyIGFuIElHVCBzaG93aW5nIGZhaWx1cmVzIHRvby4NCj4gDQo+IHYyOiBJbmNsdWRp
bmcgbWlzc2luZyBmaWxlcw0KDQpJIGp1c3QgdGVzdGVkIHRoaXMgc2VyaWVzIGFuZCBpdCBpbmRl
ZWQgc2VlbXMgdG8gc29sdmUgaXNzdWUgNzU4LiBJIHJhbg0KdGhlIFZ1bGthbiBDb25mb3JtYW5j
ZSBzdWl0ZSBzcGFyc2UgdGVzdHMgb24gREcyIGFuZCB0aGluZ3Mgc2VlbSB0bw0Kd29yayBmaW5l
Lg0KDQpUZXN0ZWQtYnk6IFBhdWxvIFphbm9uaSA8cGF1bG8uci56YW5vbmlAaW50ZWwuY29tPg0K
DQpUaGFua3MgYSBsb3QhDQoNCj4gDQo+IE1hdHQNCj4gDQo+IE1hdHRoZXcgQnJvc3QgKDMpOg0K
PiAgIGRybS94ZTogRml4IHhlX3ZtYV9zZXRfcHRlX3NpemUNCj4gICBkcm0veGU6IEFkZCBYRV9W
TUFfUFRFXzY0SyBWTUEgZmxhZw0KPiAgIGRybS94ZTogUmV0dXJuIDJNQiBwYWdlIHNpemUgZm9y
IGNvbXBhY3QgNjRrIFBURXMNCj4gDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfcHQuYyAgICAg
ICB8IDExICsrKysrKysrLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfdm0uYyAgICAgICB8
IDE0ICsrKysrKysrKystLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfdm1fdHlwZXMuaCB8
ICAyICsrDQo+ICAzIGZpbGVzIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25z
KC0pDQo+IA0KDQo=
