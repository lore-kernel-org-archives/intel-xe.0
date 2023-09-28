Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 135C0CE7B05
	for <intel-xe@archiver.kernel.org>; Thu, 28 Sep 2023 08:23:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF19510E5E9;
	Thu, 28 Sep 2023 08:23:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98DF210E5E9
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Sep 2023 08:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695889425; x=1727425425;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=t6k76qtcSt3zFgTmQRghXBMRnjIzC0SR2ew1w6NnECA=;
 b=Y+tyiCtTqJbKxtww1bdUeroTAmzGoDPKJeqP+ibPAEIhLyvOglJ6bVuq
 7LLywbGC3HBhLk5KAGKoLKsogdCkwPk/acUvKrHib9Lkz3+mR6sawt3qx
 4ruv2oR6vaGRDFJuDWnskUXmqnULT9EhsKrlq65LhHbMuS7PFFakI70XM
 7XmaAUASntNfRNMfr6zhMwHNm1/4GGLKdvvy3H9Pufhl5rSjOzj0MeaD9
 r5IDcMv9mLj08U89FBVnyI2V0eQnMdgPxI7gsnks5fceQJdU3IMse8U8a
 0OK7ivJN7eFJtY4rNDr1euwUHxPmONUG7OiaXoBC5hU35igfxDuakSjum A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="379284967"
X-IronPort-AV: E=Sophos;i="6.03,183,1694761200"; d="scan'208";a="379284967"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 01:23:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="699192280"
X-IronPort-AV: E=Sophos;i="6.03,183,1694761200"; d="scan'208";a="699192280"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Sep 2023 01:23:44 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 28 Sep 2023 01:23:44 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 28 Sep 2023 01:23:43 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 28 Sep 2023 01:23:43 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 28 Sep 2023 01:23:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PTiL5DnoL2qoGDva54FGzo/NwrJVH1OL3sDio3I/ZzSKbdbMGAm+rP6diDE/tsThUbiRn9eeRI3kaDlQFgLZLCYCfnxJlSe88gmwAlYtu07FtiLxkgz4WZn1SHU5su2g19OCrO5oA0upGYQ+uRSae2UHw2NFk46VsXECzjK04hePLX+/AVojuYvLk13JBAMIhcKcbS6pVgo7WZ4lCthTh9onKdidxJJ3r+jg9op2gGVvttpKySxibstPr36kjcwrSrl9k+kICBxBjJcu3g9e41aghCRIL83NXddr1QM7DVq0XxORoekG9Tf/vuhXzqOkz3XDe7u+bNhVz8CSbaMrXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t6k76qtcSt3zFgTmQRghXBMRnjIzC0SR2ew1w6NnECA=;
 b=V3FL0kxf+6zLZiH+NwNRM4hfZKQVNoD1ZZDW76VtQHSnfQcg2xBQ7iyux4rFYLyrgsjyqxz8KCXp+RRzZzXYrWNn9JAsbbP5x0cCPW1xa22aFrIbZk8AAV/TBkgQY7rwC3GG/1hcZ2m+0SgG52zaODqwwaANfNdvf2ctRtwp3RM8vQx03c6zICs2NssA8/YwWjIBjHBNX4ndnTDbPbrjPJFD+z/6eKA4P4X1dNuS/fRN4AVTboxuk5oc3Lp0wbpOavqJEVMrnc/uzFrN9oWfygTK+poxwZSnqZ1FV8tf/w1UgNo0bBM8gLYcLZqOB0cpv/gh6psdpYseYEFGQrRIEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 SN7PR11MB8028.namprd11.prod.outlook.com (2603:10b6:806:2df::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6813.28; Thu, 28 Sep 2023 08:23:42 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::3c89:fe31:95fd:c2cf]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::3c89:fe31:95fd:c2cf%5]) with mapi id 15.20.6792.026; Thu, 28 Sep 2023
 08:23:41 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>
Thread-Topic: [RFC PATCH 0/3] Xe dma fence handling on atomic commit
Thread-Index: AQHZ8RSx7xsxwvkxfEavit+3eP74xbAuehSAgAADNoCAAB6cAIABTBuA
Date: Thu, 28 Sep 2023 08:23:41 +0000
Message-ID: <fb8f3086713e91e4280421c507b082949a3640f8.camel@intel.com>
References: <20230927073125.3825836-1-jouni.hogander@intel.com>
 <ee8b5153-1cbd-4ab3-2b1a-626b13fbd761@linux.intel.com>
 <2fd37d47aacb192f9d4b4e8491743323536f364c.camel@intel.com>
 <85245068-4cce-8851-e527-29792385f78b@linux.intel.com>
In-Reply-To: <85245068-4cce-8851-e527-29792385f78b@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|SN7PR11MB8028:EE_
x-ms-office365-filtering-correlation-id: 584eb5f8-ce34-4894-48eb-08dbbffc391c
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ojTJliiw3PjvlMTvDgk1N9/kGuMDdDUg3poXU7K+9XQaO0033vdQ0HrcWKGQKrnmLlPULl7P+D6I25bNgjwE/jy4gH5dXPNlRPoBEq1mLaGjnJyiKh4Hl/U69AjdPbTxnB+HbLg5BG2OyeDWq8sreOVT0A4VWtb8LGovS27i/GVHvc6V22PCZSQ/fgBCqXVr8Ao83ILihG6tM+z3cJR1Sh4SOQGAcKBn8yKw021Q/IAOPbFsQ1XyMj7YCr9Au7MOj8Rsbcl8cGLb7lEA4nRbC7nCuWiXKp/wPZCzkRYK64Wu+Pd0nOFmunpQkq/3D8aQo6IXX5Wj+8mnUy+pG/lJjrgcnn+dpwGXZo9FWx0Qn8ZReWm405I0EQ2mb3CL7Dmw4zjA1jsWKzNRmRMxmkxQcAfCkQeV2hzsAN3ySpaD4lti4in9ueXA974m7/OqTsya7YxTZiEVFKyDMfiKRmyVnUbSevMZfsgkVg74Bw9uJq0QLqCpAa2bkWvkgbJw2tGyQUePWvtwb/yOqTXOgU88xRqkzt0SbBb5pgRk/qD3AbyaedK/OOmNg/4GAC2MGT/wcoWqnlcofd/7kZembFW0P+uJn6ZRKXNYL2Yw9s9BRMU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(376002)(136003)(346002)(39860400002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(71200400001)(2906002)(64756008)(5660300002)(110136005)(66476007)(66446008)(66556008)(54906003)(91956017)(76116006)(478600001)(966005)(6512007)(53546011)(66946007)(2616005)(6486002)(26005)(6506007)(316002)(66574015)(8936002)(83380400001)(4326008)(41300700001)(8676002)(86362001)(38100700002)(82960400001)(38070700005)(122000001)(36756003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SDlGUWcvOU96dHVHZFkwQ29ZRlZBSFNsNlpwdkl3dmM1UFM5c0hMejUyUFps?=
 =?utf-8?B?VVlUZ1Z3ZkJoVWY5TDBUUEhETzNNNFB0RXhsL1d1SmQvRWlDcUhwQ3Y0Tk51?=
 =?utf-8?B?Vk1GbGZCZjNPN3Q2MGdvZ3JxWkdvWTBqYnRLSG03UHVYSWoyR1ZwK1RqR3pn?=
 =?utf-8?B?aDhaVERPQ3RpbThRSkhUNDEwRThQaFFYRmg4QkY5ZXhNbnhMYjFPSFluMVFI?=
 =?utf-8?B?ZmhucXpPRmVqVkJxMWlIbHBkRHpURVBmdlpUeDg5cVN2UlFsVkppVGV6dlRW?=
 =?utf-8?B?c2dNUnNySS9rNkM0a240cVdEZGtEQ2piZzA5Z29ua3N3RUJEbXJnWGluR090?=
 =?utf-8?B?UTJtNUxVSGJrUS9KMW82Y2xQOUhGWERRa1Aza2hPUXJqL2FuZHBTL011RkE3?=
 =?utf-8?B?dXJyTWR1b1BkN2NuTmlJNjRsQjJYRlFGV29xODRlRGdueTBSY1loeTFSTlQ1?=
 =?utf-8?B?SW0rb3RtaVc1em5UTVdnaGh0VEFQbjJQOXdJVjcxNkJUMDFWNjdUOG1Qcjhj?=
 =?utf-8?B?RGJRK0RLZ0YrcHNvcGJmRGJyQW9OV1ZIV0dFd1NTekhZaXhrWXdmUy9mU2ts?=
 =?utf-8?B?blJ0NjVqUmNUUzVVdWF5SDQ2azY2MUhPREpWRFNqREtvbVNvNXY5ZUcwTjQ0?=
 =?utf-8?B?VDFFSmdhTXVDck5sUG5takY4QVBpRWhoYjZzaUJqaGRYQVBmYi9XdDVoczRk?=
 =?utf-8?B?ZlJvT2krbzZNSzczR29LSGdYY3NFc3FTMENDeEFGVzNqWjZzcDN1ZVQvMkVP?=
 =?utf-8?B?K3Z3OXBVeTNONmpRVDRJWmtjeXRucUFFVHBqOUwrbUFkeVh0M3UxZUhWc0Fy?=
 =?utf-8?B?bTBIN3R2cTN5czlLd0tWcGNwaHp3ZkcwOXpSdTlRTTNpYmdRelV4emdjanMw?=
 =?utf-8?B?Q3VBRVpvWVM2cENSajlHTGFjRFZFRHVtL1JnY0NWWTlyQ2NKemJ2YXFEQnZP?=
 =?utf-8?B?QlQvWVd0akF0RHdQMmJBb0dXSXF3SEM0bnRIaE54d2xndTFFc1VvSGprczJy?=
 =?utf-8?B?UUNjMmhmMVBVbElGSUNFRTNRUFM1MnJaeEN3Ylp6RGtzZkR6VmZiOTdnSU93?=
 =?utf-8?B?SHh1aDJOTTlqUlcrZnNPRE04dDB2VE1hR0pLeUdHVnU5RXZRV0p0VXZLUXQ3?=
 =?utf-8?B?aFphWFJMRGc1R3VmY09RMG56SXZRc3kveCtLMWNYenpzRGhzb2lNTm01Umtq?=
 =?utf-8?B?ZWxVVTBnM0lIRzBMK0J0MkRITTlTTldhTmhYMTFEMmRLYnRHcVp3VGpIcmVY?=
 =?utf-8?B?QVhSOTJVTXlLUnBZMVBVOWMrQXFyQm5RZEZEN2w4ZWVPcXBxREVmTm5YL01D?=
 =?utf-8?B?dExQTE9tUHNuWTRnL08ydFllUlpWRlNTbXNJYUVvVzhjd0ZQd3FVSlBydGIr?=
 =?utf-8?B?Sm1HMXY3Z2JMd0dYODhNQ3hWaEQvVldjN0cyK05kQnZmcXk3MUpFQXF6VVR2?=
 =?utf-8?B?Mk1JcUcvQUwwV1M2bjZEV1JzUXk2ZUdiUHplUysvSU1ya1Q3MHdxSE0wTTVK?=
 =?utf-8?B?cjJMVDRlby9NbVczd2hEdmsrYm9vei9HbHBoUlhhQzlMbmRyakxqbVhNMzVx?=
 =?utf-8?B?OWR4dmxNYWZtcGdGcWZodVVTYjVjamRNajEvMmRQVDd5b2hXdWVDTk1IQmVV?=
 =?utf-8?B?WUcxZjBQY3l0N3Y3ODI4bWJnOVBrZXpjbEcwVFJJOFQwUmQ1K3BNc1ZhTlk3?=
 =?utf-8?B?M3NQS1QybXlMUk9HaHdEd3h0alEyMmtWTm40eHM4RU9EUW5kdVcrNmhNd1Ji?=
 =?utf-8?B?QUZqWHc2TjhPOXFpUXJRWmp1WE96d0FXVmhiSGRDb1JnRVBMeEFsUnF6UjRD?=
 =?utf-8?B?YTZEYkJQejhYOUZOMGR2YkVLUTJVTkI4VWxqNHRJL2tDZVo2d1BhbVF0UVNQ?=
 =?utf-8?B?NVFqMjZwZitobllzaEUzZVdWbyt5ZUdzcnlSUEwwdHZjUCtjOTd0b2VIUTBV?=
 =?utf-8?B?elBmT0l6WXdXajBybW9FZ2lPZzJzM0xUK29uSVF3ZkgrYkRxOWJwN3pJbXdr?=
 =?utf-8?B?YWhDUGxpVDV2MG1tWEhtZEFrZStwQjFYbDl4MkpLWnJXRGRKamV5WUh4TGl4?=
 =?utf-8?B?cUpWdE8yRkEzbElLbXdiYjI2OFE5WHhxRWowTWtKL2dHUkZIWnlnSjJXOEs2?=
 =?utf-8?B?VjAxNUd0S3NWcEVxcWRRak9VNUN5Q1IxRFpabjRzV3c5T1hqQ2xNQ2lFSE1i?=
 =?utf-8?B?b3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <290005D822A7EC43ABF7E46305E8F47A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 584eb5f8-ce34-4894-48eb-08dbbffc391c
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2023 08:23:41.3573 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6zVz4j4YPgtOdvy0Dz4zzma9XKZsWn1FUjsPxvhiDffwewVw8TTLTQBb8y82GTn32Y05PaETND18IYbW2qJ3GOsCN/8vySqC0eEYdOSgaWc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8028
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC PATCH 0/3] Xe dma fence handling on atomic
 commit
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
Cc: "Nikula,
 Jani" <jani.nikula@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIzLTA5LTI3IGF0IDE0OjM1ICswMjAwLCBNYWFydGVuIExhbmtob3JzdCB3cm90
ZToNCj4gSGV5LA0KPiANCj4gT24gMjAyMy0wOS0yNyAxMjo0NSwgSG9nYW5kZXIsIEpvdW5pIHdy
b3RlOg0KPiA+IE9uIFdlZCwgMjAyMy0wOS0yNyBhdCAxMjozMyArMDIwMCwgTWFhcnRlbiBMYW5r
aG9yc3Qgd3JvdGU6DQo+ID4gPiBIZXksDQo+ID4gPiANCj4gPiA+IFdoZW4gd2Ugd3JvdGUgdGhl
IG9yaWdpbmFsIGRpc3BsYXkgc3VwcG9ydCwgd2UgcHVycG9zZWx5IGRlY2lkZWQNCj4gPiA+IG9u
DQo+ID4gPiBub3QNCj4gPiA+IGFkZGluZyBpOTE1X3N3X2ZlbmNlIHN1cHBvcnQuDQo+ID4gPiAN
Cj4gPiA+IEluIHRoaXMgY2FzZSwgSSB0aGluayBhIGJldHRlciBhcHByb2FjaCB3b3VsZCBiZSB0
byByZW1vdmUgdGhpcw0KPiA+ID4gY29kZQ0KPiA+ID4gZnJvbSBpOTE1IGFzIHdlbGwsIGFuZCBl
bmQgdXAgd2l0aCBjbGVhbmVyIGRpc3BsYXkgY29kZSBmb3IgYm90aA0KPiA+ID4gZHJpdmVycy4N
Cj4gPiANCj4gPiBZZXMsIEkgYWdyZWUgZXZlbnR1YWxseSB0aGlzIHdvdWxkIGJlIHRoZSBnb2Fs
LiBJIGRpZCBzb21lDQo+ID4gZXhwZXJpbWVudHMNCj4gPiBoZXJlOg0KPiA+IA0KPiA+IGh0dHBz
Oi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC81NTg5ODIvP3Nlcmllcz0xMjM4OTgm
cmV2PTQNCj4gPiANCj4gPiBXaGljaCBpcyByZXBsYWNpbmcgaTkxNV9zd19mZW5jZSB3aXRoIHNh
bWUgY29kZSBJJ20gdXNpbmcgZm9yIFhlDQo+ID4gZHJpdmVyDQo+ID4gaW4gdGhpcyBwYXRjaCBz
ZXQuIFRoZSBwcm9ibGVtIGlzIEdQVSByZXNldCBkZXRlY3Rpb24uIEkgZG9uJ3QgaGF2ZQ0KPiA+
IGN1cnJlbnRseSBnb29kIGlkZWFzIGhvdyB0byB0YWNrbGUgdGhhdCB3aXRob3V0IGNvbXByb21p
emluZyBpOTE1DQo+ID4gZnVuY3Rpb25hbGl0eSBpbiB0aGlzIHNjZW5hcmlvIC0+IGVuZGVkIHVw
IGRvaW5nIHRoaXMgb25seSBmb3IgWGUNCj4gPiB0bw0KPiA+IGVuc3VyZSB0aGlzIGlzIG5vdCBi
bG9ja2luZyB1cHN0cmVhbWluZyBYZS4gV291bGQgdGhpcyBiZQ0KPiA+IGFjY2VwdGFibGUgYXMN
Cj4gPiB0ZW1wb3Jhcnkgc29sdXRpb24gdG8gYmUgc29sdmVkIGFmdGVyIHVwc3RyZWFtaW5nPyBB
bnl3YXlzIHdoYXQgSSdtDQo+ID4gZG9pbmcgaW4gdGhlc2UgcGF0Y2hlcyBpcyBub3QgcmVhbGx5
IGFuIGk5MTVfc3dfZmVuY2UgcmV2aXNlZCwgYnV0DQo+ID4gdXNpbmcgZG1hX2ZlbmNlcy4NCj4g
SW4gYXRvbWljLCBwbGFuZV9zdGF0ZS0+ZmVuY2UgaXMgc2V0IGZvciBhbGwgZmVuY2VzLCBhbmQg
dGhhdCBzaG91bGQNCj4gYmUgDQo+IGVub3VnaC4gSSB0aGluayBjcmVhdGluZyBhIHJlc2VydmF0
aW9uIG9iamVjdCBpcyBhIG1hc3NpdmUgb3ZlcmtpbGwsDQo+IGFuZCB3ZSBzaG91bGQgdHJ5IHRv
IHVzZSB0aGUgZHJtX2F0b21pY19oZWxwZXJfd2FpdF9mb3JfZmVuY2VzIGlmIGF0DQo+IGFsbCAN
Cj4gcG9zc2libGUuDQoNCkNoZWNrZWQgdGhpcyBwbGFuZV9zdGF0ZS0+ZmVuY2UuIFRvIG1lIGl0
IGxvb2tzIGxpa2UgaXQncyBmb3IgdXNlcnNwYWNlDQp0byBzZXQ/IEkgZG9uJ3QgdGhpbmsgdGhp
cyBpcyB0aGUgY2FzZSBmb3IgaTkxNS4gRm9yIFhlLCBJIGRvbid0IGtub3cNCmlzIGl0IGRvbmU/
DQoNCkFsc28gaTkxNSBpcyB3YWl0aW5nIGZvciBmZW5jZXMgb24gb2xkIGZyYW1lIGJ1ZmZlciBv
YmplY3RzIGFuZCBuZXcgZmINCm9iamVjdHMuIFNob3VsZG4ndCB3ZSBkbyB0aGUgc2FtZSBmb3Ig
WGUgYXMgd2VsbD8gQW55d2F5cyB0aGVyZSBpcw0KY3VycmVudGx5IG5vIG1lY2hhbmlzbSBpbiBk
bWFfZmVuY2UgaW1wbGVtZW50YXRpb24gdG8gaGF2ZSBjb21tb24gZmVuY2UNCmZvciB0d28gc2Vw
YXJhdGUgZG1hX3Jlc3Ygb2JqZWN0cyAoZG1hX3Jlc3ZfZ2V0X3NpbmdsZXRvbikgLT4gSSBkaWQN
CnRoaXMgYnkgY3JlYXRpbmcgYSBuZXcgZG1hX3Jlc3YgZm9yIHRoaXMgcHVycG9zZS4gSWYgdGhl
cmUgaXMgbm8gcmVhc29uDQp0byB3YWl0IGZvciBwb3NzaWJsZSBmZW5jZXMgb24gb2xkIGZiIG9i
amVjdCwgbWF5YmUgd2UgY291bGQganVzdCBkbw0KZG1hX3Jlc3ZfZ2V0X3NpbmdsZXRvbiBpbiBw
cmVwYXJlIHBsYW5lcyBmb3IgWGUgYW5kIHdhaXQgZm9yIHRoYXQgYW5kDQp1YXBpLmZlbmNlIGlu
IGNvbW1pdD8NCg0KQlIsDQoNCkpvdW5pIEjDtmdhbmRlcg0KPiANCj4gQ2hlZXJzLA0KPiB+TWFh
cnRlbg0KDQo=
