Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF1EFC4167B
	for <intel-xe@archiver.kernel.org>; Wed,  6 Dec 2023 17:53:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99B1B10E742;
	Wed,  6 Dec 2023 17:53:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DD8310E742
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Dec 2023 17:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701885179; x=1733421179;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=ffiW5h1yp00/JqZSe0RdfQZPHEq89eoeDoxvHbFnPU4=;
 b=hqq4zyQgXSqbSCGmQUvLcUgz2Ij+Vz16P6U7x1OiM+O5LgzR7pJIxmS4
 IZGjGGoc57yPiLLFA3jynol4Y0xJjmuHfmdoyABJT0v02JPu2cfSzO93F
 PljmO7MMDrTiqEe5DcxzZQOjIkGLafIW+bPAmqnKmV97mWjelXlnV8u3W
 omMZwYAEMBXVj28y5MytHhHcQzuq5OHkdUcMPvcKLhj8GU9pgqbLTYHL0
 ZHH8f4CTLEv/Pu8wpHhTDlAD3LLrPXybr+WFpU/Qu28ke8P6V2xF/eEN6
 yJLBeJn+wZmhist2bSZDP9qpcC4bkIGbJUTkqwsx4W8a6Qrzsl5uAgnGT g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="7447670"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; 
   d="scan'208";a="7447670"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 09:52:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="862178620"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; d="scan'208";a="862178620"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Dec 2023 09:52:58 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Dec 2023 09:52:58 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Dec 2023 09:52:57 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Dec 2023 09:52:57 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Dec 2023 09:52:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BSsyrYyt6z1Qd1EefIR1reYZfeDxGIsw158qhb+TJnwwb4LW1e7xYCZq9WQBx4hMblaAWDJPouDUKejXQASSfe1gulldBPlx35L6VH7h8iAYVfsk83i8VgRQPw3WH7luMC/iSwmrHS4bBJJVKSN5preN2CcLvNcLKKUCGEL3ThdHQMlIx9+QVylJ0EKKQggtdBdC5GXfFVxdzlawlc2hUIP5ONHKS7AYWbosxw8X4Q+0ETQvG3/DW229w01AVVkjHAB/zpWe5rBwnBpb6GRSqCv94PusrjKICUxyi5pbc7mqqR1BW6Qfm+Phb+/Rac06nQ7P6/qrLqO5SzbVFYFXPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ffiW5h1yp00/JqZSe0RdfQZPHEq89eoeDoxvHbFnPU4=;
 b=bvV92yR+La67OUalZlU15fkgtKnOaT5k33w2UX0nanuH40+K6rZUqQXbq6VB4IiMKtqfFD5rRZaWEopUYqO5XbUA4a7xOG9Sf2+Z9rwk6o2cLWoUEBftnUxP+cXfXrZIeo5vJak7K+OwZe4zn1faTy5vAX4DSlB7U5iKDS7fvV6iJcQ6TGErzMBKLoBq2+a4Q3P+K9aHkzvz/WpnZVz/UTMJBXvWJvn8Op3Xoz4k04Aa2IaEC7b6ysp/gMena3MlcOc8WznHDEX4Lmfwf1kYhxu1Xp648sjTkZaxKzISCCcH77MGz/15BqQT3icLPKKG0AOUXWOsMYzIps+lZQ4NJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by BN9PR11MB5546.namprd11.prod.outlook.com (2603:10b6:408:103::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Wed, 6 Dec
 2023 17:52:53 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::8076:c5fe:e0fc:cfaf]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::8076:c5fe:e0fc:cfaf%7]) with mapi id 15.20.7068.025; Wed, 6 Dec 2023
 17:52:52 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
Thread-Topic: [Intel-xe] [PATCH] drm/xe/uapi: Remove
 DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY
Thread-Index: AQHaKF5DZq9pIjLOzkeFkJEjEIXgT7Ccbl4AgAACxgCAAAIJgIAAEz6AgAABkICAAAFXAA==
Date: Wed, 6 Dec 2023 17:52:52 +0000
Message-ID: <f15faa0af5fc03f8da360dbb7bfe3a6d7a92d4d3.camel@intel.com>
References: <20231206160617.7-1-francois.dugast@intel.com>
 <3v6lvfmd37hezn6tudgzrwv235f7wv4wct4d7zswa5qres7sfx@jovwzf4vgh2l>
 <ZXCgqvhDlMiEJNFo@intel.com>
 <wpaxuzibwzygcbkoxzznwvjmb3ruvjbfauzvbkmjebq6jyxlx3@krcvv3no3x6o>
 <ZXCyg6rlskWo9T2P@intel.com>
 <3thkin72xw73v2rnbqd4reuuehwqzfioyuuyqfqospv3vabxfe@27ggwnwadhcv>
In-Reply-To: <3thkin72xw73v2rnbqd4reuuehwqzfioyuuyqfqospv3vabxfe@27ggwnwadhcv>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|BN9PR11MB5546:EE_
x-ms-office365-filtering-correlation-id: 8053f09f-ea0d-4fdc-694a-08dbf6842b4b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7tdt4fMeSlcomO7AprHrpxFYT9iqZ/hHU3oRRlWwgZTSeLug1TLEF5HFdNKt0nAR/3gvac50vSO3ejrDBRYeQAvTaMEsiTPh4YZhmyart295E2QbKYgvRyEctxsz63CVVCZvNFgjOg394VtfR29lgxze0YoNVf1Kq8xbI+L7ZG36yTYeeNg1LSj0gC4s2+OnkxBZkh6rsVybftW+1I1gbBn78jSqKkGmjMkAsXEiGcwPUyyofGOzXuQHKQlxr4R2Lj7PVKWkbg1neAuZmzHVPBUq9hNfNbJr/2tikdbhUdLsXteJgjThy9BGV8/YUhuJGqiMLy64REnn6jG/390ikkXVc06mqHGml+Nzt56kclvyKXVaGbE41u+KsOF4QVLlgWWbvfc5rq5Z/1e+q3FR4CqksPqnZDSgUUPmJj4R5Tl37B3sZd3aT/1aerJAYqZ8fQcs5bcNvpv6u193sIA0gXfuexCPjvvLyM38FBYW3UHHGY7bfPGX27eUlqd3JGx7i9Y/DxcRj/nu99yEqDrP7CnLNaxQFwmMzuwpAvGzAJ2zGGYFnI4x/HBA5bNNEyVRD/xH/dXcuGsx0q1DyQxEmYiu+YFujwo4X9khnPfa1Jr2MtpdF8ACz+Hk8aJwt1b2
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(136003)(366004)(346002)(396003)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(82960400001)(2906002)(26005)(66556008)(66476007)(66446008)(64756008)(66946007)(54906003)(6636002)(91956017)(76116006)(83380400001)(71200400001)(6506007)(41300700001)(36756003)(8676002)(8936002)(4326008)(2616005)(6512007)(86362001)(478600001)(122000001)(6486002)(38100700002)(38070700009)(5660300002)(110136005)(107886003)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YjNlUGRyK1hGYkkva3l1S3hpQVN0b1dQeURWVXRWeUZJRkErTWxScWZ6a2N4?=
 =?utf-8?B?aXNoeUVUUnhVZkxLSlhuL0Z6MVUxQXNzS0phcDVjUDFubjFUYU9FVFdOeVd5?=
 =?utf-8?B?VW5LTXBGcFdnU1NNelFZSUQzUWJKZExwcXdQdDB5Ujk3d2dkYVRuRExHSHZm?=
 =?utf-8?B?Sjd3OXFkbElWWlVhZnRhY2VZbzh1cWZUcXhUdC91NnBEbE1oT1ZRanVsN0Uy?=
 =?utf-8?B?ak85eVlLREl0SkdEYTNPY2EvYVErcnFWeVdoZlNiZHdNZm1nR1dlUHMwS3RT?=
 =?utf-8?B?R1R1dmNlNjZQRnZjNHN1WlFqc0M5NS9qWENkSHpCRDFDSlVDN1N0ald5WXhJ?=
 =?utf-8?B?eGNyVWVRNDE4ZWxtbWdBeDd5NUhEZDFSM0V6ZGE0ZmZGeldiUnBzQXZIL2tX?=
 =?utf-8?B?a2lRQis1N0VQMXpFUE9jUjA2MTZtbzhoTURwSnpsckNLYjY5b2hGZUoyeW9m?=
 =?utf-8?B?dSsrV2dKQjl6ekc4UisxRFk1S2luT1BzTC94eXNzT2NPUWZmc2IyemhyUXpV?=
 =?utf-8?B?ZTJKVVBQWndFVFFNbWJOT2w0V1ZMK2ZhblBtb0tRTXZ0Z3gweDVvTExaVkJL?=
 =?utf-8?B?Mm4zQTZpWDZqbEVSMytMM0JVNGFvNEtIOFNHc0tXZUtGdTk4YmhmdGhZdUxZ?=
 =?utf-8?B?MTk0bTI3SzNQUlcvTVA5blJxM3F4NEhUa2RkUCtzMmZnL0Y1QUs4R3R0Szhl?=
 =?utf-8?B?NS83dFIxODRmNFZObjNWckRlRzc5Vk1XeW5QNmpxbUZ1QWxpL3YwUEFMVytS?=
 =?utf-8?B?QTZXQlVYeFVnQkVVTXBJYndiUnFUSzlGV3FEdXZMQlVsUHI2UWlYMm8xeW9V?=
 =?utf-8?B?R0kvT1pBd0Y5SFg4M2FTYVV1cVMvRzc0djR1blZGcE9TNzFFaGlmVzBhYnYr?=
 =?utf-8?B?ZUVzczUwdkJSbnQ5NmhkMEpjY2NwVUl0NUtIaUdpbVhYMXdNN2M1RXpJVTFt?=
 =?utf-8?B?NldvZXdhRFN5ZVVqczI2ZWkydWxKQ0pKdmpBNjJVYzhmTEYzT3dtT2tDUlN2?=
 =?utf-8?B?QXZ6dFBtZmMvakJFMDcrdlBMU2Zaenl2Q3lKb24rYi9OVE4wcVJNbzZRWFBJ?=
 =?utf-8?B?N3plOFJ6NFVBT2d0WVRYejVzcDhvcHZDNUV2WEtRemJDdnJYUFpNaXZ4TUtw?=
 =?utf-8?B?SlkzYkJBTFc1M1lNa3hmQnBSK1RjUWdRMUo0ckNXV2xjeXg1S0t4QjdLNU52?=
 =?utf-8?B?OFF3cWR0Q2w1RUxUVVBHMGZBd3JIUlE4ZHhrRjNzQ05OdDZPSUhxcDAyY01R?=
 =?utf-8?B?MzRSdzJWS0VTR2dHYThCVEs4eDJRSmxXZllmb2dzSXo1aXhibTRLank5QldZ?=
 =?utf-8?B?WHp2N2lQMWgyWDk1bHRLTEkreDMzRXNCN0VyQjViQ01hakhleWxYQ2RCcjNw?=
 =?utf-8?B?T3RSMXduT2d2c0ZPY0NGd29udmhTd1Vaci9YRGR0aFZ5bnROUkdCSWJRUDJw?=
 =?utf-8?B?cThNMjJEcUNBMElPT05Yeno1RXlZSTJWUnh6THcwTFNaaEdkNHQxdUQzcW1T?=
 =?utf-8?B?YW1tenhjQUlvTGo1NmU4cWMzN3BjemVSZDR0ZzdUaytUT0YzZXhCaWZJMXp2?=
 =?utf-8?B?b0lUTURSN05SMUhhd3UzbHVwam1uNy9qbm1GRWQ5OC9pVTVGaDB6UHFuVDhQ?=
 =?utf-8?B?a0dQUzJld3NyemVBZnl3QTl0eGNZUExYajVGcFR4Uk9FaE9janJGcWRjaUZm?=
 =?utf-8?B?UVMzR2ZOUjM5d0pGajA2M1c1MGlRTUt5TUkzQlBDUC9PVVRVbWVGcXNxV3pJ?=
 =?utf-8?B?TmlQQTNHdm9GTzFjQW43UzB5aVdZdHAwZThHQmtQQnE2OWZiNjBpVHZ5WWFL?=
 =?utf-8?B?WFJlOU42UTR2UmZPdTRmdUd6S0U1M2FZVTk3YzN4VXEvdktoQ3FJMjB4NjNw?=
 =?utf-8?B?Yk96bWFSakgyNGh3TG9NRnlWVFRPMFNPYkZ5YUxVakdaTkdFWVkzZ3kyeXZ2?=
 =?utf-8?B?aHl1eURmTnlOV0dZSGpxVHBPSVUybllMcmp3MGJtNHg3cXBFYU5TNUMzTVVR?=
 =?utf-8?B?MlhFNVYyV2lnNTRIMUpGdWpSSU1BZFNQT2w4K29pZ2JRM1JsQUR6OFRLbktP?=
 =?utf-8?B?OFZzMGNERmphNjZ0alQ1blMybTV0MUZKZ2JEY25pMjRaRWl6cjFMb1pKYzlI?=
 =?utf-8?B?OVNvU2JSM3FlUjhBNmx0OUpVMHYwRUFHcitUSmc4OERySHJoTU85VmxqTnc1?=
 =?utf-8?B?Z2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <65BFCB31885B59409F090874860C164F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8053f09f-ea0d-4fdc-694a-08dbf6842b4b
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2023 17:52:52.5335 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aCF1VAHslpmqBcLXOWQxlhx1e8RStl74sKrbe4F5A/kQ5Fr7FxMQq8unGtwzcxcGEorstn5y46WnkmhiPHxN1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5546
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/uapi: Remove
 DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY
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

T24gV2VkLCAyMDIzLTEyLTA2IGF0IDExOjQ4IC0wNjAwLCBMdWNhcyBEZSBNYXJjaGkgd3JvdGU6
DQo+IE9uIFdlZCwgRGVjIDA2LCAyMDIzIGF0IDEyOjQyOjI3UE0gLTA1MDAsIFJvZHJpZ28gVml2
aSB3cm90ZToNCj4gPiBPbiBXZWQsIERlYyAwNiwgMjAyMyBhdCAxMDozMzozNUFNIC0wNjAwLCBM
dWNhcyBEZSBNYXJjaGkgd3JvdGU6DQo+ID4gPiBPbiBXZWQsIERlYyAwNiwgMjAyMyBhdCAxMToy
NjoxOEFNIC0wNTAwLCBSb2RyaWdvIFZpdmkgd3JvdGU6DQo+ID4gPiA+IE9uIFdlZCwgRGVjIDA2
LCAyMDIzIGF0IDEwOjE2OjIyQU0gLTA2MDAsIEx1Y2FzIERlIE1hcmNoaSB3cm90ZToNCj4gPiA+
ID4gPiBPbiBXZWQsIERlYyAwNiwgMjAyMyBhdCAwNDowNjoxN1BNICswMDAwLCBGcmFuY29pcyBE
dWdhc3Qgd3JvdGU6DQo+ID4gPiA+ID4gPiBUaGUgZXhlY19xdWV1ZV9zZXRfcHJvcGVydHkgZmVh
dHVyZSB3YXMgcmVtb3ZlZCBpbiBhIHByZXZpb3VzDQo+ID4gPiA+ID4gPiBjb21taXQgKCJkcm0v
eGUvdWFwaTogS2lsbCBleGVjX3F1ZXVlX3NldF9wcm9wZXJ0eSIpIGFuZCBpcyBubw0KPiA+ID4g
PiA+ID4gbG9uZ2VyIHVzYWJsZSwgc3RydWN0IGRybV94ZV9leGVjX3F1ZXVlX3NldF9wcm9wZXJ0
eSBkb2VzIG5vdA0KPiA+ID4gPiA+ID4gZXhpc3QgYW55bW9yZSwgc28gbGV0J3MgcmVtb3ZlIHRo
aXMuDQo+ID4gPiA+IA0KPiA+ID4gPiBteSBiYWQsIHNvcnJ5DQo+ID4gPiA+IA0KPiA+ID4gPiA+
ID4gDQo+ID4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBGcmFuY29pcyBEdWdhc3QgPGZyYW5jb2lz
LmR1Z2FzdEBpbnRlbC5jb20+DQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gc2hvdWxkIHByb2JhYmx5
IGJlIGEgZml4dXAgdG8gdGhhdCBwYXRjaD8gQW55d2F5LA0KPiA+ID4gPiANCj4gPiA+ID4gbm8g
YmVjYXVzZSBpdCBpcyBpbiB0aGUgdWFwaSBoZWFkZXIgdGhhdCBnZXRzICJjb3BpZWQiIGJ5IHRo
ZSBVTURzDQo+ID4gPiA+IGFuZCBJR1QgYWxyZWFkeSBtZXJnZWQgYW5kIE1lc2EgbGlrZWx5Li4u
IGFuZCB3ZSBjYW5ub3QgZG8gZml4dXANCj4gPiA+ID4gb24gdGhlaXIgc2lkZXMuDQo+ID4gPiAN
Cj4gPiA+IHdhdD8NCj4gPiA+IA0KPiA+ID4gYW55IFVNRHMgd291bGQganVzdCBjb3B5IHRoZSBo
ZWFkZXIgYW5kIHBvaW50IHRvIHRoZSBjb21taXQgaXQgY2FtZQ0KPiA+ID4gZnJvbS4gSXQgZG9l
c24ndCBtYXR0ZXIgaWYgd2UgdXNlZCBhIGZpeHVwIG9yIG5vdC4NCj4gPiANCj4gPiBCdXQgaGlz
dG9yeSB3b3VsZG4ndCBhbGlnbi4gSWYgdGhleSBoYXZlIGFscmVhZHkgbWVyZ2VkIHRoZSBjb21t
aXQgd2l0aA0KPiA+IHRoZSBzeW5jIHBvaW50aW5nIHRvIGEga2VybmVsIGNvbW1pdCB0aGF0IHdl
IGRvIGEgbGF0ZXIgZml4dXAsIHRoZXJlDQo+ID4gd291bGQgYmUgYSBtaXNtYXRjaC4gQW55b25l
IGxvb2tpbmcgdGhlIGhpc3RvcnkgaW4gYSBsYXRlciB0aW1lIHdvdWxkDQo+ID4gdGhpbmsgdGhh
dCB0aGUgVU1EIGNvZGUgd2FzIHdyb25nLg0KPiA+IA0KPiA+IEFuZCBpbnN0ZWFkIG9mIGJsYW1p
bmcgbWUgZm9yIGhhdmluZyBtaXNzZWQgdGhpcyBsaW5lIGluIHRoZSBmaXJzdA0KPiA+IGNvbW1p
dCB0aGV5IHdvdWxkIHVuZmFpcmx5IGJsYW1lIHdob2V2ZXIgYXV0aG9yZWQgdGhlIFVNRCBwYXRj
aA0KPiA+IA0KPiA+IHJpZ2h0IEpvc2U/DQo+ID4gDQo+ID4gQnV0IEkgd291bGQgYmUgb2theSB3
aXRoIGEgZml4dXAgaWYgdGhhdCBpcyBva2F5IGZvciBKb3NlLg0KPiANCj4gDQo+IHdoZW4gYSBm
aXh1cCBpcyBhbWVuZGVkLCBpdCdzIG5vdCBsaWtlIHRoZSBjb21taXQgcmVtYWlucyB0aGUgc2Ft
ZS4gWW91DQo+IHdpbGwgaGF2ZSBhIGRpZmZlcmVudCBoYXNoIGZvciB0aGUgbmV3IGNvbW1pdC4g
SnVzdCBwb2ludCB0byB0aGUgbmV3DQo+IGNvbW1pdCB3aGljaCBoYXMgdGhlIHNhbWUgY29tbWl0
IG1lc3NhZ2UgYXMgdGhlIHByZXZpb3VzIG9uZS4NCj4gDQo+IEFuZCB3ZSBhcmUgc3RpbGwgb24g
dG9wIG9mIGRybS10aXAuIEFsbCB0aGVzZSBjb21taXRzIHdpbGwgc3RpbGwgYmUNCj4gcmViYXNl
ZCBhbmQgaGF2ZSB0aGVpciBoYXNoZXMgY2hhbmdlZCBhbnl3YXkuDQo+IA0KPiBBcyBsb25nIGFz
IHdlIGtlZXAgc2F2aW5nIHRoZSB0YWdzIHNvIGNvbW1pdHMgZG9uJ3QgZXZlbnR1YWxseQ0KPiBk
aXNhcHBlYXIgZnJvbSB0aGUgcmVtb3RlLCB3ZSBzaG91bGQgYmUgZmluZS4NCg0KSSBhZ3JlZSB0
aGF0IGZvciBVTURzIGhpc3RvcnkgaGF2ZSBhIGZpeHVwIHdvdWxkIGJlIG9kZC4NCg0KTWVzYSB3
b3VsZCBoYXZlIHR3byBjb21taXRzIHBvaW50aW5nIHRvIHRoZSBzYW1lIGNvbW1pdCB0aXRsZSBi
dXQgd2l0aCBkaWZmZXJlbnQgaGFzaGVzLg0KDQo+IA0KPiBMdWNhcyBEZSBNYXJjaGkNCj4gDQo+
ID4gDQo+ID4gPiANCj4gPiA+IEx1Y2FzIERlIE1hcmNoaQ0KPiA+ID4gDQo+ID4gPiA+IA0KPiA+
ID4gPiBBY2tlZC1ieTogUm9kcmlnbyBWaXZpIDxyb2RyaWdvLnZpdmlAaW50ZWwuY29tPg0KPiA+
ID4gPiANCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBSZXZpZXdlZC1ieTogTHVjYXMgRGUgTWFyY2hp
IDxsdWNhcy5kZW1hcmNoaUBpbnRlbC5jb20+DQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gTHVjYXMg
RGUgTWFyY2hpDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiAtLS0NCj4gPiA+ID4gPiA+IGluY2x1
ZGUvdWFwaS9kcm0veGVfZHJtLmggfCAxIC0NCj4gPiA+ID4gPiA+IDEgZmlsZSBjaGFuZ2VkLCAx
IGRlbGV0aW9uKC0pDQo+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9pbmNs
dWRlL3VhcGkvZHJtL3hlX2RybS5oIGIvaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaA0KPiA+ID4g
PiA+ID4gaW5kZXggZGVlNzUwMzg1MTYxLi4zNDYwMDdlODA3NGQgMTAwNjQ0DQo+ID4gPiA+ID4g
PiAtLS0gYS9pbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oDQo+ID4gPiA+ID4gPiArKysgYi9pbmNs
dWRlL3VhcGkvZHJtL3hlX2RybS5oDQo+ID4gPiA+ID4gPiBAQCAtNTMsNyArNTMsNiBAQCBleHRl
cm4gIkMiIHsNCj4gPiA+ID4gPiA+ICNkZWZpbmUgRFJNX0lPQ1RMX1hFX1ZNX0JJTkQJCQlEUk1f
SU9XKERSTV9DT01NQU5EX0JBU0UgKyBEUk1fWEVfVk1fQklORCwgc3RydWN0IGRybV94ZV92bV9i
aW5kKQ0KPiA+ID4gPiA+ID4gI2RlZmluZSBEUk1fSU9DVExfWEVfRVhFQ19RVUVVRV9DUkVBVEUJ
CURSTV9JT1dSKERSTV9DT01NQU5EX0JBU0UgKyBEUk1fWEVfRVhFQ19RVUVVRV9DUkVBVEUsIHN0
cnVjdCBkcm1feGVfZXhlY19xdWV1ZV9jcmVhdGUpDQo+ID4gPiA+ID4gPiAjZGVmaW5lIERSTV9J
T0NUTF9YRV9FWEVDX1FVRVVFX0RFU1RST1kJCURSTV9JT1coRFJNX0NPTU1BTkRfQkFTRSArIERS
TV9YRV9FWEVDX1FVRVVFX0RFU1RST1ksIHN0cnVjdCBkcm1feGVfZXhlY19xdWV1ZV9kZXN0cm95
KQ0KPiA+ID4gPiA+ID4gLSNkZWZpbmUgRFJNX0lPQ1RMX1hFX0VYRUNfUVVFVUVfU0VUX1BST1BF
UlRZCURSTV9JT1coRFJNX0NPTU1BTkRfQkFTRSArIERSTV9YRV9FWEVDX1FVRVVFX1NFVF9QUk9Q
RVJUWSwgc3RydWN0IGRybV94ZV9leGVjX3F1ZXVlX3NldF9wcm9wZXJ0eSkNCj4gPiA+ID4gPiA+
ICNkZWZpbmUgRFJNX0lPQ1RMX1hFX0VYRUNfUVVFVUVfR0VUX1BST1BFUlRZCURSTV9JT1dSKERS
TV9DT01NQU5EX0JBU0UgKyBEUk1fWEVfRVhFQ19RVUVVRV9HRVRfUFJPUEVSVFksIHN0cnVjdCBk
cm1feGVfZXhlY19xdWV1ZV9nZXRfcHJvcGVydHkpDQo+ID4gPiA+ID4gPiAjZGVmaW5lIERSTV9J
T0NUTF9YRV9FWEVDCQkJRFJNX0lPVyhEUk1fQ09NTUFORF9CQVNFICsgRFJNX1hFX0VYRUMsIHN0
cnVjdCBkcm1feGVfZXhlYykNCj4gPiA+ID4gPiA+ICNkZWZpbmUgRFJNX0lPQ1RMX1hFX1dBSVRf
VVNFUl9GRU5DRQkJRFJNX0lPV1IoRFJNX0NPTU1BTkRfQkFTRSArIERSTV9YRV9XQUlUX1VTRVJf
RkVOQ0UsIHN0cnVjdCBkcm1feGVfd2FpdF91c2VyX2ZlbmNlKQ0KPiA+ID4gPiA+ID4gLS0NCj4g
PiA+ID4gPiA+IDIuMzQuMQ0KPiA+ID4gPiA+ID4gDQoNCg==
