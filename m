Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C286CD37B0
	for <intel-xe@archiver.kernel.org>; Mon, 18 Sep 2023 08:57:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AD6410E221;
	Mon, 18 Sep 2023 08:57:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 105FE10E188
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Sep 2023 08:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695027431; x=1726563431;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=5ZHrDPRibTm2fX8cQ7tSdnUZAQNW0Uyw+ftmTVGgTf0=;
 b=l063N7mCLMwHPJKarOUmoD41iluiQye8YEowFfNqehl/gPiTwEqNbudA
 IlAJ0Go/Vi+veZzc4h6taMhFBfqdH7aA2uS+n2aR287CWe1839ID0ijZi
 IIj/XgRjnnI9m2KFO9S7xv4GBDRGThc6q+G27B8LakLwP1kL5k5cV6U0e
 WOzIdLZFASigPsECfXs3PKtuMJYSMNtFT5RVwDR06iixLLQ1lrlUywRvZ
 IWrvyoSMBN551u9GIr/S2QabK664qwRcrDxLHRhMPlGXis7ot4Z+Uf7mY
 1ta3/x5Ag1rR+YZ32VpJ88wfNiVCa08HDauIRUYbYfvugISzRi1CCM4M6 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="359856608"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; d="scan'208";a="359856608"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 01:55:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="748943989"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; d="scan'208";a="748943989"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Sep 2023 01:55:53 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 18 Sep 2023 01:55:52 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 18 Sep 2023 01:55:51 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 18 Sep 2023 01:55:51 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.108)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 18 Sep 2023 01:55:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d1lsPDVYQfpHRmy1q0jbaNCK2jnQnvKNtH9ZhDV2kPz8E1B7IZT4c7mLzwipQKlUOq7d3cuC81eaJCYU23L5I5XcYHPf0zaaOMadikrYUx9L8rrMKyDzYSzk0SSdlUSFlf0jweZVkaR3Jtw6e4uEYNCO2oRg4tiB5AoJXPCy3nYTyzMCabclC4LoukDKji1zeEx6v7z13SAMHPpbeOEORnu1vcu9Df4/iTgV36U8S4oPYGUUblbmfxcxavxOCaUeJpkpnTeS4qGG+W9g7lfZnB5XgkvgU8u7tGTOKSuY8+VHOtxKpeoMPTN5OT6T5+HpJlGPr7sJre/SBYg+9PASMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ZHrDPRibTm2fX8cQ7tSdnUZAQNW0Uyw+ftmTVGgTf0=;
 b=Aovf1CL+Xlc9zIrTbb5/gi65SjNgP+XtC12m19og105kmn58+XYMwLFbKfKCfgcXj0H+jLHNYO6JtvBr3sXIqvdbbXjdFxmCXtEkuR8db7DRE3xSHX0tAT+S9gjH5j2e93/kp0bnFB7zFKmDE3y2XekEo0J74kVmagfQFWXkzTgXSSlSa0VnugLGjiv8gafCc7ShS1w7hAXoCJ0tirsISLHZ2fqY4ZonENWBViHKVxc1Xpdz6pBxfG8v2ulmxkNWBPHP4s8uQAXyN5bajKSFvdOkFbjkqiALToI2USvVClcI4Ze35KPgkcV7G/in85IpIfCwVwTuEmRD9MP62j4fPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7777.namprd11.prod.outlook.com (2603:10b6:930:71::14)
 by PH7PR11MB8550.namprd11.prod.outlook.com (2603:10b6:510:30c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Mon, 18 Sep
 2023 08:55:48 +0000
Received: from CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::cf28:4320:6c5e:aec]) by CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::cf28:4320:6c5e:aec%5]) with mapi id 15.20.6792.026; Mon, 18 Sep 2023
 08:55:48 +0000
From: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Hogander, Jouni" <jouni.hogander@intel.com>
Thread-Topic: [Intel-xe] [PATCH v2 1/2] fixup! drm/xe/display: Implement
 display support
Thread-Index: AQHZ5tVboHLJ6Lp6Pkm9XNYDthi4V7AgTimA
Date: Mon, 18 Sep 2023 08:55:47 +0000
Message-ID: <d8913332b0616c1c14610a8cb28541039e75a954.camel@intel.com>
References: <20230914063211.5210-1-jouni.hogander@intel.com>
 <20230914063211.5210-2-jouni.hogander@intel.com>
In-Reply-To: <20230914063211.5210-2-jouni.hogander@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7777:EE_|PH7PR11MB8550:EE_
x-ms-office365-filtering-correlation-id: 6c5cdc9c-c9a3-45fa-cb14-08dbb8250d4f
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uAmR6QnJnlvns0XguKBk5IgbyvPHD9rvW0Ge9dNDbAa27EMszF276l2q+KvW9RjI9aM1GDSZoCkqTP+1xJKL0g4hnWphjOzdV02wnW812kKLrhml/p2dfuQZ++rADras6O3WorGpih/441N8Xc2N3qtamxgPmw05w8ZW8xNK6QnDaaYPj7Ig3UulgZFQ+kYjfgVCXnlhUnHWBaE5BIvTCtyj18n/4vaW2jmAXuBsdl3Ojjhl/b4ENT2YKPCQ0lVEhVg41Pv8myGvHx6JtIKvkW0Ov13e4M0m2AxLEYA7COt3lPk1g9c0kUiIkWgaWIKdKA8/3oRRZ0A79Loxz3ZDEuPqxgxd88JVnJaFt6slDitlRHxk0/XBfj+o/1uCkjfwPc2qfaAvhr/n9OvgepyTgC+v6dGSojeNog9m8+VLELhihFihBMNArTA0SZpRuwLWk0EVWehwr2vRKgljFGZcZPoK20KJMzAa5Kc1hLJCJgxl3nh/5WR3qyT62CsfPsGbdxrYytLxgL8LlXD6DpjxILFpXcIUu9aCnIsVc7tOa0rtCZfxPKkxu1beftSx5lcZHV/4p/A9RKonj83xpP2ajFghOEr6Wgd4rCbt4tKdWr/CQTEokJtnJ4PJfbRfdAZZ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7777.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(376002)(366004)(346002)(136003)(186009)(1800799009)(451199024)(66446008)(66476007)(64756008)(66556008)(478600001)(316002)(6636002)(66946007)(110136005)(76116006)(91956017)(71200400001)(2616005)(6506007)(26005)(6486002)(6512007)(8936002)(8676002)(41300700001)(5660300002)(2906002)(4744005)(4326008)(38100700002)(38070700005)(82960400001)(122000001)(36756003)(86362001)(107886003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UDZkaFZEbHdlSHhOeWdWQzhFbm5GLys5Uk1kWGFMQWc4OFZNQnJoRExGWUtw?=
 =?utf-8?B?TE5HcXNBOEJYNWVmV0dXQnRYcCtJOFJxRFdiblRrVzhhNXZRdmJCZUphTkhG?=
 =?utf-8?B?VTNXOGVaeDVpTktBUW90VTBiWUJHTTNSb0FLakIyRCtyMjF5QXVSZGs0bzlj?=
 =?utf-8?B?TDgzcUE3Mlg3Q3EwMkFHblkxQ1A1Zmp2Q244OW1VaFVrS01COHk4anZncUlI?=
 =?utf-8?B?Y2NXaXlSc056Vkc5ZVg5UEw3aTV1dnlWVTIyTjhHYllBek01VUdIT0E1Q1pF?=
 =?utf-8?B?Rzh2ZWxPTzlmSGQvenErL3V0V3dzWE44RGE1YTV1ekRCN2RUNWtYcENLUkdu?=
 =?utf-8?B?blMxdzB6anRQVUsyckJmR1hOWFdXY2pURXoyOGRMd0xYTkhlNlM0d01HdEZk?=
 =?utf-8?B?UUpRZlhHdmdIVzIvV2ROSGVPRHZOYW1rcms3a0hla0JzRmtiTi9WaGV0cjN2?=
 =?utf-8?B?aXB4VDVOQzFITStMMUYrL2lDamF3c0RieVcyNVpBbVVrYW8xaVozQWY0S3Jz?=
 =?utf-8?B?VW1lZWxVYmkwU2loN2UvMDRpdy8rQ0VCZkQ0NXlSdVdkSVlaQ2M1anMrZkFE?=
 =?utf-8?B?QWcxMzdnN2xRSG1LV2k2RVNOcUp0aUxzMEhXTUNmN3J2VGQ4MVFlZlFMTkxa?=
 =?utf-8?B?NXBSMG80Y3ZaSHZzK1N1Q3Rnc1VvMVNhbkUwVjhjQW5tR0lHRWlQMkordWYv?=
 =?utf-8?B?THBpWldIUVhRN3cyTUVBWEt2dnpCM3JYVE0ybUZTdzdHdksvTWwvZVk5N0cv?=
 =?utf-8?B?NVZWd3FmZWt4aS9GWlB3OTNUczlhZ1lNelBoTGYyVEtiSmxtU3VPdnphUXF5?=
 =?utf-8?B?QmlnYTJQZzY4NWI0QUNIcFJKQWJpa2Y3eTFzTVB2ZUJrRS9WMVU4eXd3SWly?=
 =?utf-8?B?YStuaHQwT2tNT3I1ZzJzVHJuc2EwamhNL0VtUGpUaEpDV2hkZWh0WjY1cG1W?=
 =?utf-8?B?dkpmV2xpU0Q5WkR4bXRsL0NBQmVpSTNlNzlOdjZFbWJwV3JYZHpZcnp6WjBh?=
 =?utf-8?B?aFg3SjFybG8yQVJ2MHpKeXAzNjd2SUIrK0VBcGxBNWVmLyt5OFdEbFZuSG1j?=
 =?utf-8?B?K0FNZkRtZFYweFVhOTl6UUNnR0k2Rjh3V2tKTVoyZVJHeWxvdGd3Ynp1M09L?=
 =?utf-8?B?UFl1MTYvK3VRQUdzQ09OQ202RENlMmF2T1hYYzEzKzBMY202Z25oTVE4QjdC?=
 =?utf-8?B?NkZHRm5hZUh2cUN1TEpxNHEvOHhzR2RjeTRSTHM1ZitaZDVUOWNjWWZhOER3?=
 =?utf-8?B?dlFQeG5zUDg0VFVhNG5RZWFKcHplVWIrYlJ2clVvOXptUnJGTHRmck9qQWwy?=
 =?utf-8?B?dUNDWHMwTnZaQzBZejdqMzRrNjZ0U25KOGkyb09saHNkQmY0VTNJWEkzYkpv?=
 =?utf-8?B?dlBZd2VCRGpaUnR0b2FmSTVlR0RoMml4dFdMdm9xTDJGYmYzeFdGTmMvUDZ2?=
 =?utf-8?B?aCs4OTJqMS9VNk43TWFoOWlmUElsTk5mOWtEY3hQR21QNDlWaXg2b0FuVnd3?=
 =?utf-8?B?M0xmb2hhUnJNQjQvd2FOV1Y2dTArQkJrVzZtU2dramJOY0ZPRWRETDNsNjFG?=
 =?utf-8?B?SFd5amZoRTRGNS83UTNFOVVkUENYMWlaWFl6ay8zMVlyRGRIM2lGZXNESW00?=
 =?utf-8?B?RThrc2tKekk0N0NnOTdwcDRJSzBOc2c5MjBlMlhwdnptWG1SMFpzRDE5NW9U?=
 =?utf-8?B?Q25ndTdrdG5DWEFBZDkvMFJtamZUV21LSzAxdXFydHVEWitDOXRNS01wVlE3?=
 =?utf-8?B?NmMvRmZCY1BrZFBQK3BBTnptOGZLTVNCaEdNdVZVbVdPOWthd0puc2J4Wkto?=
 =?utf-8?B?dFlCallzUFZDVkJubndRNHV1OHpTVlNERVpwWVlRZGs2eDhIREpkaFQyS3Br?=
 =?utf-8?B?REZ5MXdzOEgzR2g4dVkzeGFqQy9ONjZYVmJTT1VMYS9pQjFYdmVNelRYTHRN?=
 =?utf-8?B?ZVNZeUxZMDJLK040WGV1amgvYStPWnhlcEFNcy9aaWlvc0N1djlVV1I1MDVm?=
 =?utf-8?B?WnhSdExrenIySlhLQzBQNlFhWVFsMnJKZjJrNUI3bDZWSjcwY1VFeXRxR0Uy?=
 =?utf-8?B?MWR2OHZuYjFCUWZYQXFINyt5Y0VXcFRwYVEvbTFtTytzOHNqOFloa21tRW8v?=
 =?utf-8?B?QlRDYzNWWlp3bTBQclJrY3FUb1FMZWJ6ZzVZMGhYZlltT01VNEdMaHF2OXY2?=
 =?utf-8?Q?aKi1SJm7wsKzD0xz42VBTd0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7AE27F42E133A94A88D562771E39A975@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7777.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c5cdc9c-c9a3-45fa-cb14-08dbb8250d4f
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2023 08:55:47.9549 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0sMmr5P8C1MPIz6wxEgi9C8kkDX1FSaBlve5iHibJXUF5ZlnoPa23ZBzaa8QF/RH2/UDfMlDjVtSeSPl4buYSpKh2fldSmkCTcg7HHR0kTA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8550
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 1/2] fixup! drm/xe/display: Implement
 display support
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIzLTA5LTE0IGF0IDA5OjMyICswMzAwLCBKb3VuaSBIw7ZnYW5kZXIgd3JvdGU6
DQo+IFNpZ25lZC1vZmYtYnk6IEpvdW5pIEjDtmdhbmRlciA8am91bmkuaG9nYW5kZXJAaW50ZWwu
Y29tPg0KPiBBY2tlZC1ieTogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGludGVsLmNvbT4NCj4g
LS0tDQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL2NvbXBhdC1pOTE1LWhlYWRlcnMvaTkxNV9kcnYu
aCB8IDEgKw0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KDQpSZXZpZXdlZC1i
eTogVmlub2QgR292aW5kYXBpbGxhaSA8dmlub2QuZ292aW5kYXBpbGxhaUBpbnRlbC5jb20+DQoN
Cj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUvY29tcGF0LWk5MTUtaGVhZGVy
cy9pOTE1X2Rydi5oIGIvZHJpdmVycy9ncHUvZHJtL3hlL2NvbXBhdC1pOTE1LQ0KPiBoZWFkZXJz
L2k5MTVfZHJ2LmgNCj4gaW5kZXggOTRhYjAzNTQxODVlLi4wM2FjMzllZmJhMzggMTAwNjQ0DQo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS9jb21wYXQtaTkxNS1oZWFkZXJzL2k5MTVfZHJ2LmgN
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL2NvbXBhdC1pOTE1LWhlYWRlcnMvaTkxNV9kcnYu
aA0KPiBAQCAtMjEsNiArMjEsNyBAQA0KPiDCoCNpbmNsdWRlICJpOTE1X3V0aWxzLmgiDQo+IMKg
I2luY2x1ZGUgImludGVsX2d0X3R5cGVzLmgiDQo+IMKgI2luY2x1ZGUgImludGVsX3VuY29yZS5o
Ig0KPiArI2luY2x1ZGUgImludGVsX3J1bnRpbWVfcG0uaCINCj4gwqAjaW5jbHVkZSA8bGludXgv
cG1fcnVudGltZS5oPg0KPiDCoA0KPiDCoHN0YXRpYyBpbmxpbmUgc3RydWN0IGRybV9pOTE1X3By
aXZhdGUgKnRvX2k5MTUoY29uc3Qgc3RydWN0IGRybV9kZXZpY2UgKmRldikNCg0K
