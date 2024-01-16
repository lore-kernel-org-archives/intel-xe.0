Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DFA8C47077
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jan 2024 21:44:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F60210E600;
	Tue, 16 Jan 2024 21:44:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6544D10E600
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jan 2024 21:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705441487; x=1736977487;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=htl482jgtgidNEDIif+GnNIgwChlfDOzetaiqo435f4=;
 b=CfAU4I4RhnTQ9WnX6dAUrKhMWhF7pEENREiWUUyrj0Znco9BG5VUxZp2
 hfXvGX1gGyMbPn8S/wBPQmyLXHlP0EQz4L1ewIGo/6ZodROr24grGTwXS
 3VeyyPW8dnAI0lSJswG+hS3PTpXcf3TU53b9q05v/6MS1vumyW6E+NhGZ
 o4M7fY7Ck1J3SxGpIadaG0MMDf9eliXDBUceyYFu5l4TeNT1vvgd27NcX
 rfQdnVvbmftZowA0Kt74cZKSZar7SXEE2+O05wQXgGFxsGCNF81KtXHNO
 mCEd/Tgx3mnXulQQFi4ZhPJKrZ2yVl7UQjOnn09T/sUyxQ2ac1esLOZsH Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="431159557"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; d="scan'208";a="431159557"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 13:44:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="957314918"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; d="scan'208";a="957314918"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Jan 2024 13:44:46 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Jan 2024 13:44:44 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Jan 2024 13:44:43 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 16 Jan 2024 13:44:43 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 16 Jan 2024 13:44:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KNd55rNhRMoWjLZlaaUIKcCx4pAnNsqg+1pVVx++8kctydt1a8DygJrA8UOP/PC5BT7RrbYwx3a1xeG+yNL2SqMkyBSWgbx21NfLEKxCEGJ8GrGR/JHTJe8DvJA6hFzOjVIfy/04uM8PVej+Hi5E+XdaISLLe1BrYFVB9myvhavEyMbh+tJ4rC4uKOZqQ4CLS/MWFNLHxBNn3h5DdDrrsmKhZTLxKThKsUvLexKhLLR1JwnnqtK2bPJWl8+6B3kNv2Y5g0pRc5iE3HFI7HUVC5cyXVVa4AfK/aQxdoeaUK1iZwFxcJDvKW1G1PapL0YeqZVcqARRKWA0zdOaT/Wehg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=htl482jgtgidNEDIif+GnNIgwChlfDOzetaiqo435f4=;
 b=L0yywxw7Ku7R2hOBVzTaoZq5YrUEaOl8wA/NR+ZaJEGh42tdH3Q4hilv2bSLi2jjxAf9nmeEz8aZJuGuqgcZPWngW2D6ctCVaX3inaYipsZVwbCCcAWCgOecfa6tVDCDq4RiB3s1xz0iHorqh6M0sYMVxc5vzBmBOKJv961Q0OTD51KRelhwKPBgue6HRlLhwY+Z42x5pG4feYTR4gzsXipv+7iMtshi38Y9bvhapJ+nt1Z99aBSc2h65vz2OQbcaTHu5MiJZutxeQT8snSKGuPj5Sh5886aLwqm20qZnLApSDOZV/cVkHmh00AYquc7AV4IlEOrbW7K7T6CTIiM6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 DM3PR11MB8759.namprd11.prod.outlook.com (2603:10b6:8:1ac::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7181.17; Tue, 16 Jan 2024 21:44:41 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::cc1f:3742:ac61:448f]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::cc1f:3742:ac61:448f%7]) with mapi id 15.20.7181.026; Tue, 16 Jan 2024
 21:44:41 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>
Subject: Re: [PATCH 2/3] drm/xe: Rename num_slices to num_cslices
Thread-Topic: [PATCH 2/3] drm/xe: Rename num_slices to num_cslices
Thread-Index: AQHaMISU+wCqHg1iF0+fRwWeBec4xLDdKWEA
Date: Tue, 16 Jan 2024 21:44:41 +0000
Message-ID: <6b60293f65e9ab6236639fdb26906d038f3b96a6.camel@intel.com>
References: <20231216214120.7394-1-niranjana.vishwanathapura@intel.com>
 <20231216214120.7394-3-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20231216214120.7394-3-niranjana.vishwanathapura@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|DM3PR11MB8759:EE_
x-ms-office365-filtering-correlation-id: f08d1e5a-8dc4-4be6-2d5f-08dc16dc58cd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zUT4WdHS6WuE1nNPBFHPobThwoIpMK4/Kk764Ubi7b8+Pc6A8p+fht5dyJ48PFQSLyFX3f5cSscSKQP08P2yBppPsXRrcfuxjRJM5Qfptgep8qdhKq4rG1SBr/zJvJbN/N7jgfPRmeBSAvWJaEaZ8YG0kcCjBzRW4Wht+mKVv9eM420ON4rWRm7vekmFGKEJj+GNnWJhSJYP7BrQonFBKv++8jJ3Ue+scr5q/Cw+e1qRkqtPi5+dnotX/TG8PbDAH+tzFGERCqfrp5zofMbJ94EvudQ+h3RNzB41w0D8rOC4/XlL3Emb3/rZFD0SDXuxAXuu5Zf8qy1R6MMahQvbwMEI7/tjP/vRMdE5zuvR7H7X2VSox18WrsTuRfj0yfvZMuA5B9tyc9LQMBuS0ZIFLOTzpkx6GKfUDW/jHQ/aL1h1i/ZslkMI/mhDK1VUa2JJQKnvi1y4riLbHkkrSwNsFypr0Z9QUxJQfU764wdTnVrEz/EQGjtO4oVnV07Iad0IrO3bl0QES9L+SSReb7oSKe9eix3FHPmEsS0eNUGKnCusGcFvr9z8SMeeJxs7G2pAgUsklSfVKh3TzryRiewzoPAT1VyZsoUX4vyZtP19vX6SsaAkXzLDGYAgWA/OmcCA
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(376002)(366004)(346002)(136003)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(83380400001)(4326008)(6512007)(107886003)(478600001)(38100700002)(2616005)(26005)(110136005)(66556008)(122000001)(66446008)(64756008)(2906002)(5660300002)(8676002)(316002)(71200400001)(66476007)(66946007)(8936002)(4001150100001)(6486002)(6506007)(36756003)(76116006)(6636002)(41300700001)(38070700009)(86362001)(82960400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NTYvRzVEd0lXS2NwUEdaUXErejJEaWZRcjFUYnFJaFJjd0RoK0lobG95MkRj?=
 =?utf-8?B?blpYWHhKVFYyVDFFWEcrZUt6UFpTMnMwV0p6UGZKNFVnZUpRN3lmNUhsMEIx?=
 =?utf-8?B?cVZTWVBFVHN3MzdFRk1CZlZyZ3NJQjNlMS93cDhJVTJ5U2UrK29XVGx2bGUy?=
 =?utf-8?B?WVlCMVFaVHFLbjNBcGlTbnQzUFp2MEc2SWptWWw5TDkxTWszUi9SZmE2cVNN?=
 =?utf-8?B?a0RpYTdpc1hmVUtRa1R1Z3J0ZnY4RTNEZFVTVmFUZk01clduR0kzZUpTRnRl?=
 =?utf-8?B?UjR1YnhRVEtvYytYRVRaTzZWY1BmdHd3TmE4TkllT2tVWWVGdzZBVzlpb3h2?=
 =?utf-8?B?cGlOV3dsUTV1ZkpwbWxWdHpNM3ZYTmREOUxWck9TOHErR2hRcStPT25CeGxD?=
 =?utf-8?B?NkYydXMwSWN2NXVKVGhCVGNnZXNFUTNUS2xkSUVkM2ZiSVJtNjBaZEhzNUF5?=
 =?utf-8?B?eHZMd1ErQUFURVJsdkh4M1Z3cHRERFZwYTN5S3NpZmg5NzJsU051L0lGWG1E?=
 =?utf-8?B?d0lsMG1JTGQwRTBNTkFIQnAyMW1oM3ZLck1hSy9JMHNYMGlwby9vVEV2bEdR?=
 =?utf-8?B?NDlRdVcvQXZUYVFzWXAvVG1mMlV1ZUpzaWlydEo5QUVrYVhoYVZpUkhrZWRx?=
 =?utf-8?B?dkpMeTlyOCtWdUpxZmdMcW9JekF1V3I3ZEszTUdDb3hGRC9NUHZtM1FNcXor?=
 =?utf-8?B?eFQ3UldZcmdQWklkbmhrZ3lpTWYzUnlwK0Jzc3ZvMnhlbzFJL1lqMTJpdkla?=
 =?utf-8?B?ZExkKzNmY1NKc2lrZDhtT0Y1cEhZWS9aOSs5SWRDR0cwOGJoWXdEVjV5bXJ3?=
 =?utf-8?B?dFVrLzRyVFdzYWQrSGpCdDNmaU4zdzhoWTBNbWZEd3Q2aXYwYlNCSUQ0bFph?=
 =?utf-8?B?OFlPM0JIVUdrSnlqSi9CZDlmdlgwb2tQWDZteWJxTDZSbWI2N3cyTGtFUlI0?=
 =?utf-8?B?bWEreHZjMmdPdXZ4VWo5Y1BWMzJveTU5U01jWC9EL1RRbDJmZWJ6bjJMSEdl?=
 =?utf-8?B?SWJrSWJJQ0haOTdJVWc4c0Y1NmpmUWkzZ3BXMUxPTGtvbnovQzBoU0JvZndR?=
 =?utf-8?B?bThHaDJ2d2xuU3k0bTZucDV2ZzdWbXJ6YnRrTWhqd3RvNm0ydVRBcFQyTmk3?=
 =?utf-8?B?bUhPRjRrVWkxbTdFY1JIcWk1MDNjaVRHbUhHUjl5QldheUF4VnNqWmpnMzdX?=
 =?utf-8?B?VTVnQW55dTVNRU0xcTdMOEdMaXV6c3RoaFJCOVdZS3dlSXhHTG1nWjM0SXZ4?=
 =?utf-8?B?RXhHUkg5ZUY2TXR4MXVPWmRtdlVCWHhxNWpGNkFJV1o2ZjIrNDRWSVp6YUZm?=
 =?utf-8?B?czR2UEJ1Zk4wdG1ybEFGWTNDSzN6dDhsUkVJUEFGN2gvVjlYYy9zcmRrRkFQ?=
 =?utf-8?B?dDBsRkY1eG5RalpGK3o1THV3NlpVVVptMXdadTJVTG5KMm9ab2dFUlpBZjdn?=
 =?utf-8?B?cWdnOUlrNWVvdzIvelg0WXN6b2lCTURndnp3UjFPdHZjcUcxRnpOT29Iekgz?=
 =?utf-8?B?WFpnVlRKTlpacFFUVWxHdWNIbFUzZ1BmSHEvRGtQMXU1WWFrZHNyUjFXY0Rk?=
 =?utf-8?B?TnFxZHgzNDcwVnBLVkFlODhHQmJFMjNJZXdXQmoxcFIxTmZjMDl1ZGhlcCtj?=
 =?utf-8?B?RThaRjNaL0lVeTBrL2FtckxHb3ViLzBvZ1pjdlV4UVlrS1F0K0Zic2lRWmM2?=
 =?utf-8?B?ejhnWnpNVUJod1JpMEtMQ1FGN1NJNGF4OGlDbHVPak9wQS9CNjdMWE1nYi9L?=
 =?utf-8?B?aTFwSEM1bUtIUU1iZ2Y1N1pBdE9CcDFMNXp5WWo1RHhLMUxteDgvMlFtZ2V6?=
 =?utf-8?B?ZHBYT2FINEw5d1krNVVGajczc3oycVlCVWpsTmlTbTR5V2ZuL0FNeWM2dFQ2?=
 =?utf-8?B?Umk4RjRqUHBoM0hadVZXdjNuSkhCaEpDZHNpSGI3ZkdWbTl4YUU1Vk53SGhX?=
 =?utf-8?B?MVRnaldISy9WWFduK3kxS1AxZ0U5SU5VV1krbEd6SFh5aVRyTHFBaEpEOHcv?=
 =?utf-8?B?U3ZLejB4ajNMd1NabDdZeFJpRWNzbzJ1YXpyMWZ0OGR3dlZobW0yU2lONmVy?=
 =?utf-8?B?VzJPaU8wdjIvcVV2RWhSNmVMMHd5T3l5MjZ6ZVU0RFRlSlhzeWdyREZwWElD?=
 =?utf-8?B?bEdhZitHMDVVczZNZVRyRG5sdXI4Q1dSUGxKR2dWZmtIL1RGcWxPQTBsY0Fy?=
 =?utf-8?B?ZlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C712D77AE2194646A85E9A273DDB27EF@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f08d1e5a-8dc4-4be6-2d5f-08dc16dc58cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2024 21:44:41.7976 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pmcYO1eqJ/rrLjsf52ODz+69R+pp28Lw/K3nbiLz2SQq37ICTzq9DUFnWmSFpjqWZ3TK2j8zhudmC2JPVBZA8W3k7RLnuPKDBhDpOkiuSvg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8759
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
Cc: "De Marchi, Lucas" <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gU2F0LCAyMDIzLTEyLTE2IGF0IDEzOjQxIC0wODAwLCBOaXJhbmphbmEgVmlzaHdhbmF0aGFw
dXJhIHdyb3RlOgo+ICdjc2xpY2UnIGluZGljYXRlcyBjb21wdXRlIHNsaWNlIGFuZCByZW1vdmVz
IGFueQo+IGFtYmlndWl0eSB3aXRoICdnc2xpY2UnIHVzZWQgZWxzZXdoZXJlIGluIHRoZSBkcml2
ZXIuCj4gCj4gU2lnbmVkLW9mZi1ieTogTmlyYW5qYW5hIFZpc2h3YW5hdGhhcHVyYQo+IDxuaXJh
bmphbmEudmlzaHdhbmF0aGFwdXJhQGludGVsLmNvbT4KClJldmlld2VkLWJ5OiBTdHVhcnQgU3Vt
bWVycyA8c3R1YXJ0LnN1bW1lcnNAaW50ZWwuY29tPgoKPiAtLS0KPiDCoGRyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9ndF9jY3NfbW9kZS5jIHwgMjQgKysrKysrKysrKysrLS0tLS0tLS0tLS0tCj4gwqAx
IGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCj4gCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9jY3NfbW9kZS5jCj4gYi9kcml2ZXJz
L2dwdS9kcm0veGUveGVfZ3RfY2NzX21vZGUuYwo+IGluZGV4IGVlMTA2NWM0NGRhN2YuLjE3M2Ix
MTlhMjFjMDAgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X2Njc19tb2Rl
LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfY2NzX21vZGUuYwo+IEBAIC0yMSwx
MCArMjEsMTAgQEAKPiDCoC8qIEdldCBDQ1MgbW9kZSBtYXNrIHRvIGRpc2FibGUgYWxsIGNvbXB1
dGUgc2xpY2VzICovCj4gwqBzdGF0aWMgdTMyIHhlX2d0X2Njc19tb2RlX2Rpc2FibGVkKHN0cnVj
dCB4ZV9ndCAqZ3QpCj4gwqB7Cj4gLcKgwqDCoMKgwqDCoMKgaW50IGksIG51bV9zbGljZXMgPSBo
d2VpZ2h0MzIoZ3QtPmluZm8uX19lbmdpbmVfbWFzayAmCj4gWEVfSFdfRU5HSU5FX0NDU19NQVNL
KTsKPiArwqDCoMKgwqDCoMKgwqBpbnQgaSwgbnVtX2NzbGljZXMgPSBod2VpZ2h0MzIoZ3QtPmlu
Zm8uX19lbmdpbmVfbWFzayAmCj4gWEVfSFdfRU5HSU5FX0NDU19NQVNLKTsKPiDCoMKgwqDCoMKg
wqDCoMKgdTMyIG1vZGUgPSAwOwo+IMKgCj4gLcKgwqDCoMKgwqDCoMKgZm9yIChpID0gMDsgaSA8
IG51bV9zbGljZXM7IGkrKykKPiArwqDCoMKgwqDCoMKgwqBmb3IgKGkgPSAwOyBpIDwgbnVtX2Nz
bGljZXM7IGkrKykKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoG1vZGUgfD0gQ0NT
X01PREVfQ1NMSUNFKGksCj4gQ0NTX01PREVfQ1NMSUNFX0FTU0lHTk1FTlQpOwo+IMKgCj4gwqDC
oMKgwqDCoMKgwqDCoHJldHVybiBtb2RlOwo+IEBAIC0zMyw3ICszMyw3IEBAIHN0YXRpYyB1MzIg
eGVfZ3RfY2NzX21vZGVfZGlzYWJsZWQoc3RydWN0IHhlX2d0Cj4gKmd0KQo+IMKgdm9pZCB4ZV9n
dF9jY3NfbW9kZV9hcHBseShzdHJ1Y3QgeGVfZ3QgKmd0KQo+IMKgewo+IMKgwqDCoMKgwqDCoMKg
wqB1MzIgbW9kZSA9IHhlX2d0X2Njc19tb2RlX2Rpc2FibGVkKGd0KTsgLyogZGlzYWJsZSBhbGwg
YnkKPiBkZWZhdWx0ICovCj4gLcKgwqDCoMKgwqDCoMKgaW50IG51bV9zbGljZXMgPSBod2VpZ2h0
MzIoQ0NTX01BU0soZ3QpKTsKPiArwqDCoMKgwqDCoMKgwqBpbnQgbnVtX2NzbGljZXMgPSBod2Vp
Z2h0MzIoQ0NTX01BU0soZ3QpKTsKPiDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IHhlX2RldmljZSAq
eGUgPSBndF90b194ZShndCk7Cj4gwqDCoMKgwqDCoMKgwqDCoHUzMiBudW1fZW5naW5lcyA9IGd0
LT5jY3NfbW9kZTsKPiDCoMKgwqDCoMKgwqDCoMKgaW50IHdpZHRoLCBjc2xpY2UgPSAwOwo+IEBA
IC00Myw4ICs0Myw4IEBAIHZvaWQgeGVfZ3RfY2NzX21vZGVfYXBwbHkoc3RydWN0IHhlX2d0ICpn
dCkKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybjsKPiDCoAo+IMKgwqDC
oMKgwqDCoMKgwqB4ZV9hc3NlcnQoeGUsIHhlX2d0X2Njc19tb2RlX2VuYWJsZWQoZ3QpKTsKPiAt
wqDCoMKgwqDCoMKgwqB4ZV9hc3NlcnQoeGUsIG51bV9lbmdpbmVzIDw9IG51bV9zbGljZXMpOwo+
IC3CoMKgwqDCoMKgwqDCoHhlX2Fzc2VydCh4ZSwgIShudW1fc2xpY2VzICUgbnVtX2VuZ2luZXMp
KTsKPiArwqDCoMKgwqDCoMKgwqB4ZV9hc3NlcnQoeGUsIG51bV9lbmdpbmVzIDw9IG51bV9jc2xp
Y2VzKTsKPiArwqDCoMKgwqDCoMKgwqB4ZV9hc3NlcnQoeGUsICEobnVtX2NzbGljZXMgJSBudW1f
ZW5naW5lcykpOwo+IMKgCj4gwqDCoMKgwqDCoMKgwqDCoC8qCj4gwqDCoMKgwqDCoMKgwqDCoCAq
IExvb3Agb3ZlciBhbGwgYXZhaWxhYmxlIHNsaWNlcyBhbmQgYXNzaWduIGVhY2ggYSB1c2VyCj4g
ZW5naW5lLgo+IEBAIC02NCw3ICs2NCw3IEBAIHZvaWQgeGVfZ3RfY2NzX21vZGVfYXBwbHkoc3Ry
dWN0IHhlX2d0ICpndCkKPiDCoMKgwqDCoMKgwqDCoMKgICrCoMKgIHNsaWNlIDI6IGNjczIKPiDC
oMKgwqDCoMKgwqDCoMKgICrCoMKgIHNsaWNlIDM6IGNjczMKPiDCoMKgwqDCoMKgwqDCoMKgICov
Cj4gLcKgwqDCoMKgwqDCoMKgZm9yICh3aWR0aCA9IG51bV9zbGljZXMgLyBudW1fZW5naW5lczsg
d2lkdGg7IHdpZHRoLS0pIHsKPiArwqDCoMKgwqDCoMKgwqBmb3IgKHdpZHRoID0gbnVtX2NzbGlj
ZXMgLyBudW1fZW5naW5lczsgd2lkdGg7IHdpZHRoLS0pIHsKPiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoHN0cnVjdCB4ZV9od19lbmdpbmUgKmh3ZTsKPiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoGVudW0geGVfaHdfZW5naW5lX2lkIGlkOwo+IMKgCj4gQEAgLTg5LDgg
Kzg5LDggQEAgdm9pZCB4ZV9ndF9jY3NfbW9kZV9hcHBseShzdHJ1Y3QgeGVfZ3QgKmd0KQo+IMKg
Cj4gwqDCoMKgwqDCoMKgwqDCoHhlX21taW9fd3JpdGUzMihndCwgQ0NTX01PREUsIG1vZGUpOwo+
IMKgCj4gLcKgwqDCoMKgwqDCoMKgeGVfZ3RfaW5mbyhndCwgIkNDU19NT0RFPSV4IGNvbmZpZzol
MDh4LCBudW1fZW5naW5lczolZCwKPiBudW1fc2xpY2VzOiVkXG4iLAo+IC3CoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1vZGUsIGNvbmZpZywgbnVtX2VuZ2luZXMsIG51bV9zbGlj
ZXMpOwo+ICvCoMKgwqDCoMKgwqDCoHhlX2d0X2luZm8oZ3QsICJDQ1NfTU9ERT0leCBjb25maWc6
JTA4eCwgbnVtX2VuZ2luZXM6JWQsCj4gbnVtX2NzbGljZXM6JWRcbiIsCj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbW9kZSwgY29uZmlnLCBudW1fZW5naW5lcywgbnVtX2Nz
bGljZXMpOwo+IMKgfQo+IMKgCj4gwqBzdGF0aWMgc3NpemVfdAo+IEBAIC0xMTksNyArMTE5LDcg
QEAgY2NzX21vZGVfc3RvcmUoc3RydWN0IGRldmljZSAqa2Rldiwgc3RydWN0Cj4gZGV2aWNlX2F0
dHJpYnV0ZSAqYXR0ciwKPiDCoHsKPiDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IHhlX2d0ICpndCA9
IGtvYmpfdG9fZ3QoJmtkZXYtPmtvYmopOwo+IMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgeGVfZGV2
aWNlICp4ZSA9IGd0X3RvX3hlKGd0KTsKPiAtwqDCoMKgwqDCoMKgwqB1MzIgbnVtX2VuZ2luZXMs
IG51bV9zbGljZXM7Cj4gK8KgwqDCoMKgwqDCoMKgdTMyIG51bV9lbmdpbmVzLCBudW1fY3NsaWNl
czsKPiDCoMKgwqDCoMKgwqDCoMKgaW50IHJldDsKPiDCoAo+IMKgwqDCoMKgwqDCoMKgwqByZXQg
PSBrc3RydG91MzIoYnVmZiwgMCwgJm51bV9lbmdpbmVzKTsKPiBAQCAtMTMwLDEwICsxMzAsMTAg
QEAgY2NzX21vZGVfc3RvcmUoc3RydWN0IGRldmljZSAqa2Rldiwgc3RydWN0Cj4gZGV2aWNlX2F0
dHJpYnV0ZSAqYXR0ciwKPiDCoMKgwqDCoMKgwqDCoMKgICogRW5zdXJlIG51bWJlciBvZiBlbmdp
bmVzIHNwZWNpZmllZCBpcyB2YWxpZCBhbmQgdGhlcmUgaXMKPiBhbgo+IMKgwqDCoMKgwqDCoMKg
wqAgKiBleGFjdCBtdWx0aXBsZSBvZiBlbmdpbmVzIGZvciBzbGljZXMuCj4gwqDCoMKgwqDCoMKg
wqDCoCAqLwo+IC3CoMKgwqDCoMKgwqDCoG51bV9zbGljZXMgPSBod2VpZ2h0MzIoQ0NTX01BU0so
Z3QpKTsKPiAtwqDCoMKgwqDCoMKgwqBpZiAoIW51bV9lbmdpbmVzIHx8IG51bV9lbmdpbmVzID4g
bnVtX3NsaWNlcyB8fCBudW1fc2xpY2VzICUKPiBudW1fZW5naW5lcykgewo+ICvCoMKgwqDCoMKg
wqDCoG51bV9jc2xpY2VzID0gaHdlaWdodDMyKENDU19NQVNLKGd0KSk7Cj4gK8KgwqDCoMKgwqDC
oMKgaWYgKCFudW1fZW5naW5lcyB8fCBudW1fZW5naW5lcyA+IG51bV9jc2xpY2VzIHx8IG51bV9j
c2xpY2VzCj4gJSBudW1fZW5naW5lcykgewo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgeGVfZ3RfZGJnKGd0LCAiSW52YWxpZCBjb21wdXRlIGNvbmZpZywgJWQgZW5naW5lcyAlZAo+
IHNsaWNlc1xuIiwKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIG51bV9lbmdpbmVzLCBudW1fc2xpY2VzKTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG51bV9lbmdpbmVzLCBudW1fY3NsaWNlcyk7Cj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gLUVJTlZBTDsKPiDCoMKgwqDC
oMKgwqDCoMKgfQo+IMKgCgo=
