Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCDF4C7EE23
	for <intel-xe@archiver.kernel.org>; Wed, 24 May 2023 14:14:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD9DC10E025;
	Wed, 24 May 2023 14:14:29 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D889210E025
 for <intel-xe@lists.freedesktop.org>; Wed, 24 May 2023 14:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684937667; x=1716473667;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=a/KjiXBM4JDq806FaagsM/AbMIR+n9dztPnot1QeWYI=;
 b=KkohplTg0IiXss4+mHT4DAwtNyTmr9QUeU7abI5AzBuQY3YIFuqGHtQU
 x2i+KzLFnxJlTQAfmGqiRd1fpNOcPTVYtst3ySgdnNVE3arYaQtegls0A
 uZLWvO//4TmXSWmJzeRnY47YAKaEdjTS3xht/fXpMSjwzNSVBUxB46LGT
 h2KogfL5gY8+CgVSuIPFAPlQGdhM+KQJ92KKv8CsCRhLjIhhFcjd8yIXf
 zerzlMkgDUbqffLzqzTm5I3ofRLo6OuxZeCCR5B4379IvKkerZfrtPp5n
 SF4kOpwwPDw2zfju++JwYAOxMkrSWrYMeg1VJ1f4Y71gTs1kh52o/yvIf w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="343039406"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; d="scan'208";a="343039406"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 07:14:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="828604207"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; d="scan'208";a="828604207"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP; 24 May 2023 07:14:06 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 24 May 2023 07:14:05 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 24 May 2023 07:14:05 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 24 May 2023 07:14:05 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 24 May 2023 07:14:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X/RMY36TfTj4favwY0xSEBi/C8G0CYHwsnm/2zYe05xd4aKAYo9AUQ0WKePmRwRY8bdtBdNOcgZC7W5AsA7/0ehO+z5mIiQKLdcH9sphG/tXZcvjezfHukzNntfevr0FsGEXDJXzI7jhiJEgZA1hqXRFH6EQrnOfZ8lsNny04LvAWowgtMn21UGQVpUM3uARSIn9z6MK2DbPiM6ELlN9mzWEfQV0qO+UR083WGa8rjRY//9liT6YZvGejVtsaIuV+HJbpe2UnErJVJkcQu1DM0aRN1CozF8I2sxoNe+JZVNXRkSbzzoD91n2IhHVARXilhlyvomnxwZeTop+9M9/CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a/KjiXBM4JDq806FaagsM/AbMIR+n9dztPnot1QeWYI=;
 b=km1ylgsST2CqnWT9+DngvSCNFGKqex8gYZZNd3THbGyrqZBAVRN/X3NBfIATmRPkSmD0PGGJ5gWj9IGPVI3anUwc8XFuepMGqu26Evu6JBYu33+ziePEIli7HHl/7mk5hsYoYNtfXgEpeDmRd31w6HihipLNkVXLlyczDeukZY7t6YDwlX4OkP7zoCiBYMP/Hua9nmXTzeTOjPRBjw5ztURqGPgfW1u2qkvcZy5Li1WkRwtQ1YV+j9gHbzV+/+folbax8a/JnrLm7emuE+Du1bGld8PoipkF5Nvm/mjGqdkutHLS2vJcSHB4ieSeoq11llQZrV8zsS8b97jSijJ3xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by SJ1PR11MB6228.namprd11.prod.outlook.com (2603:10b6:a03:459::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Wed, 24 May
 2023 14:14:02 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::3fa1:b97c:a5bb:651]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::3fa1:b97c:a5bb:651%3]) with mapi id 15.20.6411.028; Wed, 24 May 2023
 14:14:02 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Das, Nirmoy" <nirmoy.das@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "nirmoy.das@linux.intel.com"
 <nirmoy.das@linux.intel.com>
Thread-Topic: [Intel-xe] [PATCH] drm/xe: Do not unbind destroyed vmas
Thread-Index: AQHZjbSaHE0AEW2PSEKFK7RR9cuYra9ogbyAgADckgCAABpAgA==
Date: Wed, 24 May 2023 14:14:02 +0000
Message-ID: <d3c214414d6d3ce39daca237fbce1a973ea9dac5.camel@intel.com>
References: <20230523202412.14671-1-nirmoy.das@intel.com>
 <ZG1Mm91KwwDrf8e2@DUT025-TGLU.fm.intel.com>
 <b4370476-3b11-c419-2859-34437ea0701f@linux.intel.com>
In-Reply-To: <b4370476-3b11-c419-2859-34437ea0701f@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|SJ1PR11MB6228:EE_
x-ms-office365-filtering-correlation-id: de07c149-eeef-42a7-931e-08db5c612042
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VUd3tfSS9FYJf6+HVbzWFKKr+wPDmuEvJ8cAhGr6h6ubqjHLdhPal118c4PBmrDYHBi+V/Iwmj73jQ4i4aCIzq2dKemfBSES5WjQJ5cdaET+pO+b46dzQr7ujMNLyNJ1LUvwc0q0o1soOAtCuDD0rUT6E1MuaQD9uuh297JfNxWPetcML257y5teg/TvnCjCIpgrrIhr+TDb+91dlgZkDfwFt5s1Cm3D01DWASob2Fk18rAnkKNlne6qpCthYzAH/qgWzFhqexNRL+SB0ZosHhlNCB7Vvu+jm74vG2Cnvut/2mhT9enPsRkUPtpyT1aiMRX9s0RJdqV9XFj5svAiy6oqxKE+pjybRJFSgl35WJJ7F8pyRscc1ykuNd1LEILPwWBjZ0KSRqi8nUNHjWlqPMR8E1cTws/6Y/LB+wY8XZmFTqKMADG/LRNRb+dLTdBZi5gP4qibYbUlCcVBj+YVm+HaswlS0nf5sOojCRa2dDv5V59YM1nrRtc5wLhXoxKb1ldjUfc2tFOrX9+iM8zSDnskh+H5sYvljzMH5dtGjaNB1ZOZbO6dc/Caa4JcndxHH6qIZla1bGjDSfczrI7euAjNA2slJL1Y1bqZ0+S7DPtA2XXdUnRn6HTqOL0fPZGX
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(136003)(346002)(376002)(396003)(39860400002)(451199021)(82960400001)(4326008)(38070700005)(64756008)(66556008)(66446008)(66946007)(91956017)(76116006)(66476007)(38100700002)(316002)(71200400001)(122000001)(110136005)(478600001)(41300700001)(6486002)(26005)(86362001)(5660300002)(2906002)(36756003)(2616005)(53546011)(8676002)(6512007)(6506007)(186003)(83380400001)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OGVWb051dWtjV3AyVFhodExaVkw2OVdnNkgrQ3FNNi83WTJHWWMzcmExNmVI?=
 =?utf-8?B?VzlrekFkVHlMeHZVYThvV0pwcEdJNnVlZ2NRS0RNcm5oZk9lZFVHd1hQamJZ?=
 =?utf-8?B?Z011eUV1TTRHVjZ3akN3VXI0L0RNUEtXWm5jVnpvREt4bWV5MGRKb0t1QUVP?=
 =?utf-8?B?VXhYby9iU2IvOVFUZmZ3VzVWa3FKdnd2VkNyZ3dIN0E3TkpyL0oyYUFQZ2lp?=
 =?utf-8?B?aWNzQmhHbVVOYURUcktwSVFPaEE4SFMwU2VxMXgwTmxtMFZQVndKU1IxVXFh?=
 =?utf-8?B?UVNzWGdLZVFCVitLcG9OWHdUYytJbzI5V2RhQ0xqSFpMT2NQL3hiZHVESjBF?=
 =?utf-8?B?VmQ0WXlLUGNXckhoTmlYWVl5RVp4R2w3UTh4ckdrOFZMaEprSE5JaE1jeGpr?=
 =?utf-8?B?VEt4Zyt4eXF0aERzUkdlRCtjZWpaV1JHcFhDdnZLL0VQQ0RITjhSSVJUQWRu?=
 =?utf-8?B?aFNaaXlrSDNTR0I2OXZGYVBGdFBBbjJPUEJtaS9SOHdDdm9HUG9hdmVuY29X?=
 =?utf-8?B?SXBlUFhvYittTS9ZNzRhM21mbnVqWUd5Rm11djNzUk9rNUJ5NnV6NmI2RXBF?=
 =?utf-8?B?WldCOE93U3hHekdYSEo5MlFwNW1ZOVl5TCtmbnJsMlBnVzBuZnE0MlBpZ1Bt?=
 =?utf-8?B?R0xZWUtHOUFHMCswVWRPQnVsTWc4V1pGNnFrU1VCYVFtVVVnRThreUYzWG9Q?=
 =?utf-8?B?d1VsRjVPV2tzdDZFTnJuVW9Wcnprd0VjWGgxTGl4NHYzSTVXajRXMGRra3Yx?=
 =?utf-8?B?Rm5qQ2Q3eFhla2xGQW45WGlTeWFoNk9ReWk0Z2JZQUxYblk5MUlHa2JERkp3?=
 =?utf-8?B?ak5CNC9kOHk5TkFicmJJSzVKaEw1S1hBR3QwQ2Z4a3dmOTFTQmN6czJsT2ZR?=
 =?utf-8?B?V3g5QlJiN3RaWWVkWExaV2ZaWDJzcmRSWktZa0FlWWVlOEZPaXN6emo2eEJR?=
 =?utf-8?B?YSswN1FFUXhkUHJMc2VCdzAyalNiYkxvRFNRbWJJVXRPeXhxOGhMMCtOOGlv?=
 =?utf-8?B?RWlBQkhuWnFNNzJJbVRIdTRna3ZLQi94K0JYUHNMVXF5cnRuSFRwdGtyT2VZ?=
 =?utf-8?B?Vmt0d1dWRjA4V1FuUGhiTHhxREV2M3NRUzBxUy85aXJHZ3lTS09oTnd5a2RV?=
 =?utf-8?B?WkthS1U1QVdhQUhPVWZuQno0WmNwbnRsZVVsc3BVZnJRYmN6SlliN3lqWmNv?=
 =?utf-8?B?MlJaUjlHMTFVSkdEV0lGMllra0VyeWgvR25LYVUweThGU2JvL1BKL0hOVExX?=
 =?utf-8?B?S3NPY21XYWtiS1pNNFNvUlVzWnNMdndUckpsdG81MkRwZk1mUUg0V213enBm?=
 =?utf-8?B?TldzYzhEazRoUnhJODhYUUdDdE90NFAyYy9ScmR3V2Zzc1NEa3N5VjM4aGJ2?=
 =?utf-8?B?U29XRnlGTlUvM3BnSzNRYVhLQlNhaVBIa240RXlWMmlrNzNWOW52UFFMVlJP?=
 =?utf-8?B?VFRDZTBvRFNKczNYRm1uR0t1RFJoUStadStteGJHb3dxaTNLbENFMks0SzF5?=
 =?utf-8?B?T2NzbytDaTdKT05uNW1PRHVGR3Nmd0FSOHVOMlorQWF4VVhEc0h6RTNWUEwz?=
 =?utf-8?B?RVpsNXFsenJTazNCcks0ZTY1ZDV6UDRmWW1rN2V2YkRzQ1dSRERncGowRFFv?=
 =?utf-8?B?WEJaVkVYOGgrWUNla3JMcjYrSEhGM09iV1c5TjUxK0NSTHVKZFlDdjNzV1B2?=
 =?utf-8?B?a0czODZhZWxMdVZqcCtoSGttbnIwZXhSdjEwVTB5SDIzRHdHaGlWMXRISFBr?=
 =?utf-8?B?VVZFV25oT1pKNVNOYTYwZVJ1eDBxVndEMis1OVRrVG5iZExyQVlzMjRRcUow?=
 =?utf-8?B?UWtyTEJUU21EUFA5ek1pWit1eHV6SlN0VUE3dE9CS1BhdkhtdDJlNFdZQWtL?=
 =?utf-8?B?NytWdVNUNWR1MTZ3Z2IxVUVWYVNPOSt3MDZsb1pPMWl6cVVCMXdOa3laRGUz?=
 =?utf-8?B?ellEN3NaZXZPY2JJVXRmeGxtSTcxUUFSSUpvUWFzNncxaWd4ejNRSnBFTUVK?=
 =?utf-8?B?VCsrOEJrYmcrQlZobFJpdnBwbDdjajJxZlQrajFVVkNRQ2duUEJqck5mVHJw?=
 =?utf-8?B?STFORGhuS2NSWGNUWTBnb2pVVWJWUG1MWlFnVG16SU9DR1pXZmFBMEdaKy9j?=
 =?utf-8?Q?S34uVlt+DyATDTbm5s37AdseZ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <34527830545A5F4C9FCF4AB0A9F023B4@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de07c149-eeef-42a7-931e-08db5c612042
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2023 14:14:02.5553 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9bjU6UXgBFCWgMv4Hj6KRlVA2hzwMdf5rqZf83L/K16SJRXRSHMniQNkpNWNTo8iSs71sGM8h6/MJQE81T20hA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6228
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Do not unbind destroyed vmas
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

T24gV2VkLCAyMDIzLTA1LTI0IGF0IDE0OjQwICswMjAwLCBEYXMsIE5pcm1veSB3cm90ZToNCj4g
SGkgTWF0dCwNCj4gDQo+IE9uIDUvMjQvMjAyMyAxOjMwIEFNLCBNYXR0aGV3IEJyb3N0IHdyb3Rl
Og0KPiA+IE9uIFR1ZSwgTWF5IDIzLCAyMDIzIGF0IDEwOjI0OjEyUE0gKzAyMDAsIE5pcm1veSBE
YXMgd3JvdGU6DQo+ID4gPiBGaXggYSB2bWEgVUFGIHdoZW4gdXNlcnNwYWNlIGNhbGxzIHVuYmlu
ZCBpb2N0bCBtb3JlDQo+ID4gPiB0aGFuIG9uY2UuDQo+ID4gPiANCj4gPiBJIHNlZSB0aGUgcHJv
YmxlbSwgeWVhIHRoaXMgaXMga2luZGEgYW4gaXNzdWUgYnV0IHdpbGwgY29uZmxpY3Qgd2l0aCB0
aGUNCj4gPiBHUFVWQSBzZXJpZXMgd2hlcmUgdGhpcyBpcyBhbHNvIGZpeGVkIGJ5IHJlbW92aW5n
IHRoZSBhc3luYyB3b3JrZXIuDQo+IA0KPiBZZXMsIHRoZSBpc3N1ZSBpcyB0aGF0IHRoZSBhc3lu
YyB3b3JrZXIgd2lsbCBhY2Nlc3MgdGhlIGZyZWVkIHZtYS4gSSBkaWQgDQo+IHRyeSB0byByZW1v
dmUgdGhlDQo+IA0KPiBhc3luY19vcCBmb3IgdGhhdCB2bWEgZnJvbSB0aGUgcGVuZGluZyBsaXN0
IGJ1dCBJIG1pc3NlZCBzb21lIGZlbmNlIA0KPiBzaWduYWxpbmcgc29tZXdoZXJlLg0KPiANCj4g
DQo+ID4gDQo+ID4gSXMgdGhpcyBhIHByb2JsZW0gZnJvbSBhbnkgVU1Ecz8gSWYgaXQgaXNuJ3Qg
SSdkIHNheSBkZWZlciB0aGlzIHVudGlsDQo+ID4gdGhlIEdQVVZBIHNlcmllcy4NCj4gDQo+IA0K
PiBOb3Qgc3VyZSBhYm91dCBVTUQgYnV0IEkgaGl0IHRoaXMgd2hpbGUgdHJ5aW5nIHRvIGltcGxl
bWVudCBtYWR2aXNlIGZvciANCj4gVk1BcyB3aGVyZSBJIHdvdWxkIHVuYmluZCBhIHZtYSBpZiBp
dCBpcyBzZXQgdG8gRE9OVE5FRUQuDQo+IA0KPiAgRnJvbSBteSBzaWRlIHRoaXMgY2FuIHdhaXQu
DQoNClRoaXMgY2hhbmdlIGlzIHNvIHNtYWxsLCB0aGUgY29uZmxpY3Qgd291bGQgYmUgbWlub3Iu
DQorMiBmb3IgYW55dGhpbmcgdGhhdCBjYW4gaGVscCBzdGFiaWxpemVkIHRoZSBzdGFjay4NCg0K
PiANCj4gDQo+IFJlZ2FyZHMsDQo+IA0KPiBOaXJtb3kNCj4gDQo+ID4gDQo+ID4gTWF0dA0KPiA+
IA0KPiA+ID4gU2lnbmVkLW9mZi1ieTogTmlybW95IERhcyA8bmlybW95LmRhc0BpbnRlbC5jb20+
DQo+ID4gPiAtLS0NCj4gPiA+ICAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtLmMgfCAyICstDQo+
ID4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiA+
ID4gDQo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtLmMgYi9kcml2
ZXJzL2dwdS9kcm0veGUveGVfdm0uYw0KPiA+ID4gaW5kZXggYTAzMDY1MjZiMjY5Li43YTlmMWJh
NDMyYjggMTAwNjQ0DQo+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfdm0uYw0KPiA+
ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtLmMNCj4gPiA+IEBAIC0yNzY5LDcgKzI3
NjksNyBAQCBzdGF0aWMgc3RydWN0IHhlX3ZtYSAqdm1fdW5iaW5kX2FsbF9sb29rdXBfdm1hcyhz
dHJ1Y3QgeGVfdm0gKnZtLA0KPiA+ID4gICAJeGVfYm9fYXNzZXJ0X2hlbGQoYm8pOw0KPiA+ID4g
ICANCj4gPiA+ICAgCWxpc3RfZm9yX2VhY2hfZW50cnkodm1hLCAmYm8tPnZtYXMsIGJvX2xpbmsp
IHsNCj4gPiA+IC0JCWlmICh2bWEtPnZtICE9IHZtKQ0KPiA+ID4gKwkJaWYgKHZtYS0+dm0gIT0g
dm0gfHwgdm1hLT5kZXN0cm95ZWQpDQo+ID4gPiAgIAkJCWNvbnRpbnVlOw0KPiA+ID4gICANCj4g
PiA+ICAgCQlwcmVwX3ZtYV9kZXN0cm95KHZtLCB2bWEpOw0KPiA+ID4gLS0gDQo+ID4gPiAyLjM5
LjANCj4gPiA+IA0KDQo=
