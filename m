Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B30F9C61D97
	for <intel-xe@archiver.kernel.org>; Wed, 22 Nov 2023 14:33:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D0B310E653;
	Wed, 22 Nov 2023 14:33:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2612810E653
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Nov 2023 14:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700663603; x=1732199603;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=V1DmodRydpTXQ0eZzWLpYMbJHDzeRq20r2N5TT1fVEs=;
 b=R+hklGdvWEsv/d+a/XeDfme2w9fdrY5ISH9Xr/LCPv1vrFXKGYq4lzgx
 ZNOkonO4gv/kbMIxTU8AIVo95FKT71io4egNd1KmtXJQ0Ezxez7NnqwJr
 UEW+zzS1yQTyVWIXG281+EMJ7cNBIRAONXXp9vjWWoISFoK0TVEBGFNKU
 co6Nf1UG0ZuxRU/nqbAoY2mOOIyFcDgyccNBB5Z74NpuxkgBsfAOE9BQy
 5HRE9qSc3Uyyj8H5IlyoX1NV0jDZHBEtvMAmgEGFHL5FZovwd1Ztu56xj
 bigTpmEE35jZEKj31sQlL8Nlo+sLzr8QSuJFV8n0peC9tI1Za12AMqcUg g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="395981353"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; d="scan'208";a="395981353"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 06:32:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="833032637"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; d="scan'208";a="833032637"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Nov 2023 06:32:16 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 22 Nov 2023 06:32:15 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 22 Nov 2023 06:32:15 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 22 Nov 2023 06:32:15 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 22 Nov 2023 06:32:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fjFxBFVUx7mKSZoasWtxLSZSt1K3iE//qxH0tj926iKSlPhbFca04MPJUFbYTc7qFCJZOhuzw1NW2lPZkoapch5eRKX8FFenczk6XQRn07aPHfvOYDmQONiEER3rwC2mEG0gR4st9G5swfjKnXdlaYvKr+/FOuAl+mKnMFN1LQLu36ayCNvS4GE584dG0FyRK2cOQXHMwlm8sfBBU4OpolUZ0jj/EYMvFFQGqAYUt1PD4RbE2CGZ12jjMX1Mu3pg5PmHwFuEYhqS2y6Kl1LMF6ZQZzxL3w2B24tKQtts+j9Dpqa7VK0DvwE312PslBMzd92BUSfevToVwaNo94yy+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V1DmodRydpTXQ0eZzWLpYMbJHDzeRq20r2N5TT1fVEs=;
 b=F7bGbSt/bM9PIvzT6+xt6/OYRgijUqeJyYa8uoMF/ti7Z/GprkfltDq+lZCHfgOzhKew8OEbLVRIQXW7lYB/fEtYT/C8ZhW4f0Ixq+ZpqSesUNDXVGHkTZ4+oCKb8cZwOknYDP21jwse62gTCZJqA3kG/oJkjD3rXm4An8OtnyO1lgvNxF9viAFIt3eAyNOcUEwrJyn/0ise/aWufAkquSLLjjwYs1y0zWfr7qOs+2KUainheZUkjtJaiicjbVaRJVAkKhWiYLNn/daex/fVjUqyQvRLF/NI8PxUM44w+eTCjIycu1UsVljGDHXiU0yf2jdcg6O0LrrFjKT6sMi3PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by CY8PR11MB7848.namprd11.prod.outlook.com (2603:10b6:930:6c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18; Wed, 22 Nov
 2023 14:32:12 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::a226:f114:4de2:5762]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::a226:f114:4de2:5762%4]) with mapi id 15.20.7025.017; Wed, 22 Nov 2023
 14:32:12 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>, "Dixit,
 Ashutosh" <ashutosh.dixit@intel.com>, "Tauro, Riana" <riana.tauro@intel.com>
Thread-Topic: [Intel-xe] [RFC 1/4] drm/xe: Moving and renaming existing
 frequency sysfs attributes
Thread-Index: AQHaGJeiDUVQq38KWUudcXrOSXR6trCEOy4AgAACUICAAcxKgIAAZemg
Date: Wed, 22 Nov 2023 14:32:12 +0000
Message-ID: <CY5PR11MB62117EC6AF687A3032C35AE995BAA@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20231116143043.908412-1-sujaritha.sundaresan@intel.com>
 <20231116143043.908412-2-sujaritha.sundaresan@intel.com>
 <27e7aba4-6048-4023-ae71-f1501bca570d@intel.com>
 <8734wz7lee.wl-ashutosh.dixit@intel.com>
 <8d8d0ab6-425a-42af-a0b5-77e8e6f51269@intel.com>
In-Reply-To: <8d8d0ab6-425a-42af-a0b5-77e8e6f51269@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|CY8PR11MB7848:EE_
x-ms-office365-filtering-correlation-id: 673c103b-7da9-40e5-14ac-08dbeb67d11b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VcwINAU13dPFhHpryeboUhdSE71xGEWnp/bl4jzWjeUHrQHbfMpCXjOqQZAitreYM5TvqEpql3KdwzRIMp27yXY8rbmQ1naVugcmZmsNIJXLBIrgxQKPYXmBMcFGx4WoeYJTgtfmY86XrGoiBI4NZ3PKxcH6NieQMgIpnQ2xjCo09hyYiLgDBXK3Y+49LEqtC7iBl+WGHvyCQrO5pGZz/FiasAE/T6JMXoIThXuNQYTjsTwJkVwi1IYvg2+PzPh0+Vjpqoei3d6cthm1vVoHxoXy5QGFlggsYnz/NuENS4VK5TwYRDLhDp2QeN+t45CMEyjSr08M112BNTfGDTtmJlcYZE8dxCrGvRxFoOybyHikhWq1aQZKbJ0nF3K0bdWdY+aaA4PHMwa5JG+F22tdS7CFGV4UN5XkFQJv9qD8he6WfCoJBHhtQBGvKkutNIsBizuXeRkWg1pRKjAP28a1o622lfYlLgDnG7zF+nv/sgMCRH2NsTbBD5V5NYRLPTcWXtUQ4ww8fsITvpY3vM+VV+q7HU0T8hvgBC6OnJg/TGHLPN/PNJ//otzVOItX7NEA7M3wTVpgLC4VCSxiauXVZmCA1vZVlOkQzcfKQHM8JwA7jqVCOBn1JI01w+GyFRNN
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(346002)(39860400002)(376002)(136003)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(5660300002)(52536014)(8936002)(33656002)(4326008)(8676002)(41300700001)(2906002)(110136005)(66946007)(66446008)(66476007)(66556008)(55016003)(6636002)(64756008)(316002)(76116006)(54906003)(478600001)(53546011)(86362001)(6506007)(7696005)(71200400001)(9686003)(107886003)(26005)(83380400001)(38100700002)(38070700009)(122000001)(82960400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QkNKc2pQWk81a1E5MGEzWlVIeHRWNGpnUUpLVDdlbHNIc3J0MngyK0sxL1d2?=
 =?utf-8?B?TUlkM2g5RjFRd3o2eE00aVFUODduZ0pnSkpBMWREdkwrbHRIWDJvaExNMFpH?=
 =?utf-8?B?aGZycG5EY0JNaTJZeUYwUWVJMUczVERiNHVBaThXeWFUNTMwcys1cERYNytK?=
 =?utf-8?B?NXh2UWl1S0tUZGlRTjRJQ1daMHBZZEV0V3NNa1VvN3ZBc2I3WldmOGdiMFNH?=
 =?utf-8?B?TngzankrQ2Fkd2F6WVY1b2Z6ZmRya0dMaEx3dWFKdHJ1Mmk1OE1tWVg4MWxk?=
 =?utf-8?B?S1lEZzVsZmNIYkFGSGhNVlBpbStFbTdvRzlpelROVTZXMFpNUll1bHpOVkVz?=
 =?utf-8?B?RGxjT09hQ0hUM2NjZ0Jod1hCeHNOVzF0OUlER2I1WjZzYUx3c2RZKy8xdTE4?=
 =?utf-8?B?NVBNV3djWDR6MGVucWxVSmNNZ1lyanNMVWJXSEVzdHg2YXJ4OERiL09VMnND?=
 =?utf-8?B?M1djdnJ3aVN1MitiWlZCdkIvYlArZXJzL2w0cDVhYXcrWk85SzFMYW02UTQ5?=
 =?utf-8?B?L0hjc29jYWc5OW1tYWtlbjF5aWlVVUFWUkVGbDN3bWsrekZVSkpZdjRHYVRr?=
 =?utf-8?B?aVRsSkNmT3d4dnFROWVIZVkrRGw2bXQ5K2V1STk1K1lvSXIxeHdIVHRpazZi?=
 =?utf-8?B?WloxMGwvR0c4TE1uZ2JyVVZydUxWVUJTMjJVWUxRcGR5OERHRUhDeWxMTWpM?=
 =?utf-8?B?b2l5c2hsc0lmVXNLNmFkcnFFYXFlZkhRVEhnVDdUTkFqS2lJZXRVTEUrbWZw?=
 =?utf-8?B?ekVsVzZJV1p4MklhaDZkb1ZIclplV3ptR3JDaGlrTmI0NVZHSkJWbVM4dUhI?=
 =?utf-8?B?NWVJTkJsUjgxZXpBWGlFQVBoRUV6ZG9zb1VtV0tWR0RBWlRDYnBZQitNeVc0?=
 =?utf-8?B?dUZFTFpyQllPVFNqZjlER0VXT2ZkaTdIN0t1dmcrMlBvS0Q3b2VVSWF1Sk9j?=
 =?utf-8?B?b1pONUQyUXZraUs4RThMZ3lXQmFGbzdkTytoWG56S0Rra1VhWVNadFBMOWZW?=
 =?utf-8?B?eS9XNjFNTHZHcHZUcnFIcU9ZdTduRW94dEVTK3UyWExwWG9XYmttS3NGZU00?=
 =?utf-8?B?dkNCVzdPV0JxK1hGU0JjU2x2R1NPOHJuZ3hDR0laSXkzWi9vQWVBaVFKT3FL?=
 =?utf-8?B?VDduNEs3cWFrSEJiczZhdWNCRCtuSi94Tlc2aVJONzROdlJYSDBwa09jcS91?=
 =?utf-8?B?YnBuUzBsbmRSN1ZJZ05OYm5lU3hKTXozWjN1YmpYbG03MmdYcGxMY09BamVz?=
 =?utf-8?B?QWVncGNpTUZWaFZRUWRBd3N0ZVpWSFZYN2dhNDY2VlpOcHRiL2t6S05tc3l1?=
 =?utf-8?B?ako1bmRoRWFlQnkyUmR4RkdIMVRIT21uTDNjNUVLTDE0Mk9HcC9CZGFXUHoz?=
 =?utf-8?B?UDRsU1RsOXdRQ211VGw2OE1hbXN0cHFWK1JoREFHTkN4Nlg1aWpJUG5NNmlL?=
 =?utf-8?B?cDQwRFE4Rzc0UFJYZDBhbG82cjVUcW1ESWxVcVN5dlBmTFNXYkFqNkd2UlFl?=
 =?utf-8?B?QVhGZjk2d2xHV1Nlc2gyeTRKZ0w5TGlrUUhmN0xwbGtMREJkNlZtS0pKRDZp?=
 =?utf-8?B?Z2xyQStxOHBRNGlYdC95aXdOMkNvbXY3U0g5U29ZcDlsUWUrak91ZlN3SUdJ?=
 =?utf-8?B?SUFDNUJFUkd2UnFXQ0lLUHRWRDRHNDZyYWpzcklwcWM4ZG16MDZwMWNQdXQ1?=
 =?utf-8?B?RTJCZCtYOG9OcUFMNkRSeGltQlJKVXVMOEVDd1dPc20zblIvRFlJWngzY1FU?=
 =?utf-8?B?b1RJSVBNdUFJNVBDUTlwS2tyb0o5aWdrL0JjWmRVYkZoaXVQSkdyL1UyZUdl?=
 =?utf-8?B?VmxkTUV2R0Z6UkVsSkNDamNIMW84ZlZpemFaQWpMczlXNFNVbWh3MG1KQnlO?=
 =?utf-8?B?VUdRbkZZNENYSlhVZ0FnWndqWjV6clhpUlNURHQ5MmNEL2g1a2QvdGd2K1M5?=
 =?utf-8?B?UVZXOFoxbStMRUYvVDN5N1Qvb2R4b3VrVXhtN2xXYXo0YUgvQ205Zng1U2s3?=
 =?utf-8?B?NTQ4dnMxOThLdVcyUnJZWDBETjdBLzhISWk1RTZxb2V4eXU2ZUYvWFo5c0ZD?=
 =?utf-8?B?ZjNSbmF4enlCODZ1aTErRmtPNVQrdlZyWGJCc1dOZEtDMkdrM0hHT2xwZFEr?=
 =?utf-8?Q?z0soZGZH/+VwmymdhgohXydJJ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 673c103b-7da9-40e5-14ac-08dbeb67d11b
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2023 14:32:12.5228 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fd0/EzvhO5pMQvFyZ3oONCIBudYjkbQHYfx2cQu/aPqlwhlxEeU268FtbezFZif1uKiimt3tYVbHdumPtfcteFiFE/NA4aikkMlNpWNS0Yk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7848
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC 1/4] drm/xe: Moving and renaming existing
 frequency sysfs attributes
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU3VuZGFyZXNhbiwgU3Vq
YXJpdGhhIDxzdWphcml0aGEuc3VuZGFyZXNhbkBpbnRlbC5jb20+DQo+IFNlbnQ6IFdlZG5lc2Rh
eSwgTm92ZW1iZXIgMjIsIDIwMjMgMTo1NiBQTQ0KPiBUbzogRGl4aXQsIEFzaHV0b3NoIDxhc2h1
dG9zaC5kaXhpdEBpbnRlbC5jb20+OyBUYXVybywgUmlhbmENCj4gPHJpYW5hLnRhdXJvQGludGVs
LmNvbT4NCj4gQ2M6IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgVml2aSwgUm9kcmln
byA8cm9kcmlnby52aXZpQGludGVsLmNvbT47IEd1cHRhLA0KPiBBbnNodW1hbiA8YW5zaHVtYW4u
Z3VwdGFAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBSZTogW0ludGVsLXhlXSBbUkZDIDEvNF0gZHJt
L3hlOiBNb3ZpbmcgYW5kIHJlbmFtaW5nIGV4aXN0aW5nIGZyZXF1ZW5jeQ0KPiBzeXNmcyBhdHRy
aWJ1dGVzDQo+IA0KPiANCj4gT24gMTEvMjEvMjAyMyAxMDoyOCBBTSwgRGl4aXQsIEFzaHV0b3No
IHdyb3RlOg0KPiA+IE9uIE1vbiwgMjAgTm92IDIwMjMgMjA6NTA6MDAgLTA4MDAsIFJpYW5hIFRh
dXJvIHdyb3RlOg0KPiA+Pj4gICAgQEAgLTk1MCw2ICs5NTAsNyBAQCBpbnQgeGVfZ3VjX3BjX2lu
aXQoc3RydWN0IHhlX2d1Y19wYyAqcGMpDQo+ID4+PiAJc3RydWN0IHhlX3RpbGUgKnRpbGUgPSBn
dF90b190aWxlKGd0KTsNCj4gPj4+IAlzdHJ1Y3QgeGVfZGV2aWNlICp4ZSA9IGd0X3RvX3hlKGd0
KTsNCj4gPj4+IAlzdHJ1Y3QgeGVfYm8gKmJvOw0KPiA+Pj4gKwlzdHJ1Y3Qga29iamVjdCAqa29i
ajsNCj4gPj4+IAl1MzIgc2l6ZSA9IFBBR0VfQUxJR04oc2l6ZW9mKHN0cnVjdCBzbHBjX3NoYXJl
ZF9kYXRhKSk7DQo+ID4+PiAJaW50IGVycjsNCj4gPj4+ICAgIEBAIC05NjUsNyArOTY2LDkgQEAg
aW50IHhlX2d1Y19wY19pbml0KHN0cnVjdCB4ZV9ndWNfcGMgKnBjKQ0KPiA+Pj4gCQlwYy0+Ym8g
PSBibzsNCj4gPj4+ICAgIC0JZXJyID0gc3lzZnNfY3JlYXRlX2ZpbGVzKGd0LT5zeXNmcywgcGNf
YXR0cnMpOw0KPiA+Pj4gKwlrb2JqID0ga29iamVjdF9jcmVhdGVfYW5kX2FkZCgiZnJlcSIsIGd0
LT5zeXNmcyk7DQo+ID4+IEhhbmRsZSBlcnJvciBoZXJlDQo+ID4+PiArDQo+ID4+PiArCWVyciA9
IHN5c2ZzX2NyZWF0ZV9maWxlcyhrb2JqLCBwY19hdHRycyk7ID4JaWYgKGVycikNCj4gPj4gYWRk
IGtvYmplY3QgcHV0IGlmIGNyZWF0aW5nIGZpbGVzIHJldHVybnMgZXJyb3INCj4gPj4NCj4gPj4g
YWxzbyBjbGVhbiB1cCBvbiBmaW5pc2gNCj4gPiBUaGVzZSBhcmUgbmVlZGVkIHRvbyBidXQgd29u
J3QgZml4IHRoZSBrZXJuZWwgY3Jhc2guIExvb2sgYXQgZXhpc3RpbmcNCj4gPiBzeXNmcyBmdW5j
dGlvbnMsIGF0IGxlYXN0IGk5MTUgaGFzIHRob3NlLg0KPiA+DQo+ID4gSGludDogdGhlIGlzc3Vl
IGlzIGNyZWF0aW5nIHRoZSBuZXcgZnJlcSBkaXJlY3RvcnkuDQpUaGUgaXNzdWUgaXMgZHVlIHRv
IHVzaW5nIHdyb25nICZkZXYtPmtvYmogdG8gZ2V0IGd0Lg0KZGV2IHJlcHJlc2VudCBrb2JqICwg
d2hpY2ggeW91IGhhZCBjcmVhdGVkIHdpdGggbmFtZSAiZnJlcSIuDQpZb3UgY2FuJ3QgZ2V0IGd0
IGZyb20ga29ial90b19ndCwgaWYgeW91IHBhc3MgImZyZXEiIGtvYmouDQpTYW1lIGlzIGFwcGxp
Y2FibGUgdG8gZGV2X3RvX3BjKCkgaGVyZSBpbiB5b3VyIHBhdGNoLg0KDQpUaGFua3MsDQpBbnNo
dW1hbiBHdXB0YS4NCj4gDQo+IEkgdGhpbmsgb3ZlcmFsbCwgc2luY2Ugd2UgYXJlIGxvb2tpbmcg
dG8gYWRkIG90aGVyIHN1YiBkaXJlY3RvcmllcyBpbnNpZGUgdGhlIG5ldw0KPiBndC9mcmVxIGRp
cmVjdG9yeSwgaXQncw0KPiANCj4gYmV0dGVyIHRvIGhhdmUgdGhhdCBiZSBhIG1pZCBsYXllciBh
cyBSb2RyaWdvIHN1Z2dlc3RlZCBpbiB0aGUgcmV2aWV3IGZvciB0aGUNCj4gdGhyb3R0bGUgcmVh
c29ucyBwYXRjaC4NCj4gDQo+IFRoYXQgd2lsbCBtYWtlIGl0IGVhc2llciB0byBwb2ludCB0byB0
aGUgb3RoZXIgZGlyZWN0b3JpZXMgYmVpbmcgY3JlYXRlZCB3aXRoIGZyZXENCj4gYXMgd2VsbC4N
Cj4gDQo+IFRoYW5rcywNCj4gDQo+IFN1amENCg0K
