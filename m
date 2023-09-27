Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AA99E7F14E
	for <intel-xe@archiver.kernel.org>; Wed, 27 Sep 2023 13:33:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6CF110E51D;
	Wed, 27 Sep 2023 13:33:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F19BC10E51D
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Sep 2023 13:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695821608; x=1727357608;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QP8+lBfDuBkNZ7qv5ZtHVNMKkdkT3K2C/1L2KVNq1is=;
 b=gXjl818UR8mEloRqoMtlBvvTFIQQFG1lC5J/nhU9bvaPIYoNdfCxhxle
 3vXqqSssBzi142RKktl7rPYj3jDXVO9G7+Kt/aAsDB3A41pcd+AVoZ1MC
 5xaRmDInlmDO369XWf2T0yd1sp80db3i7VI7ClhGLNI/7c0/xArNYzoaO
 UOALh+pgHdZ+3F9hi+/+Prg/JIbG85DqlF1fIyz4qq1Yvk684wGtNIrmQ
 9oNSNn0pW5lp/EVhPqdny5QQ8/eN7RzTSs7nmE8R0la49jdB+/qRxvqXk
 Jd1wCzfqitS1cz2JehsIooy6NPKgm5kCRTZtwKKe27GlS1TaTHVwJHhYd w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="412737383"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; d="scan'208";a="412737383"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 06:33:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="725811100"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; d="scan'208";a="725811100"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Sep 2023 06:33:24 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 27 Sep 2023 06:33:24 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 27 Sep 2023 06:33:24 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.44) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 27 Sep 2023 06:33:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XSgmMmrGeIzoOIJkhv2jeStLMah2krTC2Qs3PP0pQ5MRcGOADU1DV6caBlk18kCaPv1zx+VnywpC3lPX1dFWHhGcuo5bsGqQGhnbjVuNOoSmDCPGXFmdk+SMytdnxVEAYhh3Q7wY+rP2fCA5NqP3jdbpe9L9PsK4/UlZxRNTjkZ8wvxX2D0aa7nJoS0P5e9gbz/oIcz8aW86q139y3oPdpLT4JnUkXjvK85o2RyPymDuSn6Z4nrEaGDMeNn8ESKksDV2aXRYZVEU8wA/v8LdRSfXSpXfcg8GYJ9aBKKkkMLkCOQCmTvcqdSyhOy3I5TLOscgX61cgAdWnKduDQzx0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QP8+lBfDuBkNZ7qv5ZtHVNMKkdkT3K2C/1L2KVNq1is=;
 b=HWeJRI5sVJgfomLUw4EJr8pRX8eYCyE7uOnWC2uspPK8wWfvHffkYyDUFrFSFtcvjVCw5QMeUJEMUj4lua9scA9WjWuLzLuGzlfSMZqpKuBeC71lDdc/u5QdVOBZHWcYiE0cAshId9Mq/FFnPcFRjrSRpTJiAV4K8hRwWPE80GvEwA8w0dsjEuQi1an4LUi633UmDYak/XDDMArF6U3GdOBvTfoxlAp6JvUE5B+OBTnDDil50wRyLzBLlgHhCh/7uLKFOgHNCQz9mSuIN3jwJkfD+wRfJuM2pEExWgZDDHHSyXBzqqfQrJ8BlzQ7XpqdClREKi7jqvML4BB2Qu1xAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by PH7PR11MB6977.namprd11.prod.outlook.com (2603:10b6:510:205::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Wed, 27 Sep
 2023 13:33:21 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::ed57:a908:f0ad:13cd]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::ed57:a908:f0ad:13cd%7]) with mapi id 15.20.6792.026; Wed, 27 Sep 2023
 13:33:21 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH V3 1/2] drm/xe: Indroduce low level driver
 error counting APIs
Thread-Index: AQHZ772gNIBPCG2adUmo/DQ74t3rGrAucviAgAA6fmA=
Date: Wed, 27 Sep 2023 13:33:21 +0000
Message-ID: <SJ1PR11MB62040D3991E67B0DD1ABC94281C2A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20230925144359.192835-1-tejas.upadhyay@intel.com>
 <20230925144359.192835-2-tejas.upadhyay@intel.com>
 <543afa35-9987-a7da-f520-055af327c2fc@linux.intel.com>
In-Reply-To: <543afa35-9987-a7da-f520-055af327c2fc@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|PH7PR11MB6977:EE_
x-ms-office365-filtering-correlation-id: fe6ccf05-b6f4-4c84-f41d-08dbbf5e5165
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: q+dLFsUjebeVJAtWkN7gtTo4kDpdHb3btyTbDTBzwFUrK0nkUUu9kh7WHk7p7/tIeuprIIMGmA1Yx3FizKLgddxfr5wf8/m78PHYoxBJdYa7BEKaqMElCnCU4HvDNDpcVgSne4pWL0CVaqlMzAr/znYd5kOPwjBgPHcc+lMrWGl8w2ATtwl5h+3SfqW8VIegyaOFRLSvIQbggY99VmtTt8J7vxdNjwCeF1NZ7yR3fU8Kbi33CiROQ70K39WX1jpeK3zzC73EEI/OoQ86riw15HsJqOFAKJ8jD+4xnpv5KlKS9pbH+Xs9IOTxBdx6FEuQxaR2FPZNLlXMmLUS1o8i8pgbnRED/cFTcxXfP4flQ1KG5jrPwomwas8yowXYEQVgMg8ObGK+xUigaXBY4Plj3n+G+NdLJxM8h2ejl6+5s9rz3l+/RkmxWfzbMrUbUYU2asgrD4Z6Ri2GDdZPkie1AQKJF7GF17K3icuiK3RlDHkWfyhPJfP5/0iRDVxQ6SANKfUUiqwPn4xZ4QbX8P+f2BsJK5BSzm1NACiKGZois1MioTEmZq+DUHpv8zB6phWHCarvVYEzzYHNv/duIeqwItqddv6UW5aqZnWbUR1hMxweMBaJdNWMaGXpbxkIgFrM
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(39860400002)(346002)(396003)(136003)(230922051799003)(1800799009)(186009)(451199024)(2906002)(478600001)(71200400001)(82960400001)(122000001)(86362001)(83380400001)(38070700005)(38100700002)(9686003)(53546011)(33656002)(7696005)(55016003)(6506007)(8936002)(8676002)(41300700001)(4326008)(316002)(5660300002)(52536014)(76116006)(66946007)(110136005)(66446008)(64756008)(66476007)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K2ZDQVBvbjc5N0ZZQnNPYXpYaTRYS0F5TlcyQ3lrS3ZPV21NcDJlaVNsNkVt?=
 =?utf-8?B?L3c0bmxOR00vOHNCK2pjNUlNaFg2TVUvemR6aEdPTjdoU1JwU1MxUG5JVWdz?=
 =?utf-8?B?Rm9kWStNVnZXamZYb1NINzB6alRPaUdnSEs5bWdhOUJmeFIxSlJaa0JhbWZM?=
 =?utf-8?B?L0hiQ29Sd0wxMWd1UmFsWkVMZnlzbjJLM1NLaG9yRmhITHZtSVZ6cDVHRytz?=
 =?utf-8?B?QXZnL0txTVZpNDRvYnk5M2V5Ukdld0FvenRHNjd6ZGtCb2hISDZoa0xZemo3?=
 =?utf-8?B?OVZiMG4yZEtyaHIxUmRYdlpmV252VVRLMDRONnA0UUtUaVYvUE1tQ2c4SkRK?=
 =?utf-8?B?RU1kaCtNMTU2blBBQzNDQ2E4MzFaWjRWRnVxNU5wd1BCSldWWG5ORW42Q1VU?=
 =?utf-8?B?QVJBQVdQOGcwdjY4T1h6TzE2Y3hvbU9iZS83akpFNi9YcGpHVDBlZ1p6aTFT?=
 =?utf-8?B?eklwNlEvY2JTNE5zNUg2eWhLajczck9Ka1l1enhCU1h1Q25aTEpDWHM5UjhM?=
 =?utf-8?B?T1ExVnlwY0d0NFZQM3RjUldjcDdwbGhSTlJSeEk1YXRwTk1URVRucURUajZT?=
 =?utf-8?B?Wlo5b09lUXA5TVdHZ1F6cWtLbDZBSVV1U2RoeHFWWkRkYTRGOFk4ZUxvY1Nt?=
 =?utf-8?B?UHE5RHFOR2NtNEZocGVHSElhM2RQWFNnb2ZZYWpxTjQ2NjNhOWJPbm96UVR4?=
 =?utf-8?B?cVYyMXNYVXRkTlNaTEFtVklsTWdnQ0xmRW9samE4b1RKUGNCTi9odzZmVys0?=
 =?utf-8?B?amtzQlZ1V3JYYm95NDZzelZERUs0cmx2RUpSY3hlOVVsMXVab0J5ZU5hZmVY?=
 =?utf-8?B?USt1SUR0ZHBTbUlCeGJrOU5sN0FJcmthbGIwU1hNNzkyWW5jVEQzVzN4UWMx?=
 =?utf-8?B?TSt5VE5DKzFVOEpSeE1GYTJyeHlacHU3Q2FGUzNpUWo4UmZXRERtV0dHU3R3?=
 =?utf-8?B?enBQSGIreDYxQVdwU3NKUVY0aEx6Ymg2NUk3dWZYWnhJNTRtU1d6VVcrWGxw?=
 =?utf-8?B?VnhVREVyUzJqcWJkQWszS2g3MGUxNHNza1FmQ21mSkJxRGpFOEVScUJxbXl2?=
 =?utf-8?B?VndtTTZpUk04alZ0VnhGOXhzU2ZNZkF6c2FpMDZjUWl6VWI5ZVJqaXhKek5k?=
 =?utf-8?B?Y3ZxZjFKY2ZzQzh5dnVCck1ITnc4S0QrckU5YXFranVWV3J0U241NjUwVUpI?=
 =?utf-8?B?YVlDMEs5UDBvTm80NStQbFNCSWl1dGh3K016RkswQXkxVklDTDQ5WjBLeHZl?=
 =?utf-8?B?eEd5SCtQOEQycEZxZU9QNEEwN3hEWG84OTZWdnhJQjNiYmFaditwdWROU2dj?=
 =?utf-8?B?d0Nxc2VZeW9FcEdaYnpZYXQ5MFA2RE0yclc4amtQR29YcjVxNEZkeS8rRTgr?=
 =?utf-8?B?bkxSekVzSEg5RmdjdXpRbkdkOXVCYm8xRDFmck1sS0lvOElRS2E4L1Q0ZUV4?=
 =?utf-8?B?S0h2L2V1ejUyU01vczFsNDlkaHBId2J5LzlRKzZXNVFpdXJ3RGEzWTltczdp?=
 =?utf-8?B?ZXpURi9PbG1jUFgvdGFOWXZNUWdrc3FOaEZzR1FHS0pXNzgyMERManFXTmVt?=
 =?utf-8?B?S3FBTWs5dlViQWgwN2U0Y2d1eGJVRldTZlhGMFlMeVIzVFJzWGpsYktwNmVL?=
 =?utf-8?B?TUIySFAyeHpxSkx0QU1YaktSV0lCa1FqSUk4MWZTU01KL2Q0NmhUTHhrTUor?=
 =?utf-8?B?YlFUTjlJeUlqblJ2WUJsY0daMUNSSEs3SXJMb3hUaThsT1kraWNwWkZWUzVs?=
 =?utf-8?B?cXgrZnNjMjZ4bloxMDZ2YVNBWC9KTzd1ZEFubGNIRE90N0NxaENRUFBQMGxK?=
 =?utf-8?B?ellXYytCdTk3NFZPL0RDV2NVL25HY0dJT3dZNUNZVEs2enR5TFJlc1Iwd3Nl?=
 =?utf-8?B?SG9BVlhUUnUxR2tsdElKZFpxYUp4WUx1YW0yVDNGV0xveS9PUEF4elozWlpx?=
 =?utf-8?B?bDZyTEVRK3FQekZoeDE4WXNyWWVaL3VSaTlDZUUzT3FXdldNNTJqclJsakFn?=
 =?utf-8?B?RmdUZlY0MmNUMzFFU2wzdmRjVDB2VitlckY0T1dxQjdzR2crcFNYUXVtNGwr?=
 =?utf-8?B?TzRRdU5oYTJIWlA3VmxpanBSUkpVeURlZ0w1WWJyUTlzZzE5QUpaUnF6Tnl0?=
 =?utf-8?B?YlVGeWJKWEs2NEFhdTJwVWFWWkF5Ny94VDBpTkt1eFNKY0ZLajVwS0NrdEQw?=
 =?utf-8?Q?RU/h/bqHbWsylB5YAexMU/LySlFp+vajzWvJH6yYyuaI?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe6ccf05-b6f4-4c84-f41d-08dbbf5e5165
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2023 13:33:21.6091 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 937q2DE+wF6maxIpjWn1VbFvarrZDMj5RQZtSeYl6Y7y+onha2ydz10FRXbmHu8E00WHm8vPscUiY+pRyqVbCQU/mxmTH7z8vjL5Spzkknc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6977
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V3 1/2] drm/xe: Indroduce low level driver
 error counting APIs
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
Cc: "Roper, Matthew D" <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQXJhdmluZCBJZGRhbXNl
dHR5IDxhcmF2aW5kLmlkZGFtc2V0dHlAbGludXguaW50ZWwuY29tPg0KPiBTZW50OiBXZWRuZXNk
YXksIFNlcHRlbWJlciAyNywgMjAyMyAzOjI5IFBNDQo+IFRvOiBVcGFkaHlheSwgVGVqYXMgPHRl
amFzLnVwYWRoeWF5QGludGVsLmNvbT47IGludGVsLQ0KPiB4ZUBsaXN0cy5mcmVlZGVza3RvcC5v
cmcNCj4gQ2M6IFJvcGVyLCBNYXR0aGV3IEQgPG1hdHRoZXcuZC5yb3BlckBpbnRlbC5jb20+DQo+
IFN1YmplY3Q6IFJlOiBbSW50ZWwteGVdIFtQQVRDSCBWMyAxLzJdIGRybS94ZTogSW5kcm9kdWNl
IGxvdyBsZXZlbCBkcml2ZXIgZXJyb3INCj4gY291bnRpbmcgQVBJcw0KPiANCj4gDQo+IE9uIDI1
LzA5LzIzIDIwOjEzLCBUZWphcyBVcGFkaHlheSB3cm90ZToNCj4gPiBMb3cgbGV2ZWwgZHJpdmVy
IGVycm9yIHRoYXQgbWlnaHQgaGF2ZSBwb3dlciBvciBwZXJmb3JtYW5jZSBpbXBhY3Qgb24NCj4g
PiB0aGUgc3lzdGVtLCB3ZSBhcmUgYWRkaW5nIGEgbmV3IGVycm9yIGNvdW50ZXIgdG8gR1QgYW5k
IHRpbGUgYW5kDQo+ID4gaW5jcmVtZW50IG9uIGVhY2ggb2NjdXJyYW5jZS4gTGV0cyBpbnRyb2R1
Y2UgQVBJcyB0byBkZWZpbmUgYW5kDQo+ID4gaW5jcmVtZW50IGVhY2ggZXJyb3IgdHlwZSBjb3Vu
dGVyLg0KPiA+DQo+ID4gVjM6DQo+ID4gICAtIGNvcnJlY3QgI2RlZmluZSBtYXggdmFsdWUNCj4g
PiBWMjoNCj4gPiAgIC0gTW92ZSBzb21lIGNvZGUgdG8gaXRzIHJlbGF0ZWQgcGF0Y2ggLSBNaWNo
YWwNCj4gPiAgIC0gUmVuYW1pbmcgaWYgQVBJIGFuZCBlbnVtIC0gTWljaGFsDQo+ID4gICAtIEdV
QyBlcnJvcnMgYXJlIG1vdmVkIHBlciBHVCAtIE1pY2hhbA0KPiA+ICAgLSBTb21lIG5pdHMgLSBN
aWNoYWwNCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFRlamFzIFVwYWRoeWF5IDx0ZWphcy51cGFk
aHlheUBpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZp
Y2UuaCAgICAgICB8ICAyICsrDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2VfdHlw
ZXMuaCB8ICA5ICsrKysrKysrKw0KPiA+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3QuYyAgICAg
ICAgICAgfCAxOCArKysrKysrKysrKysrKysrKysNCj4gPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2d0LmggICAgICAgICAgIHwgIDMgKysrDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF90
eXBlcy5oICAgICB8IDEwICsrKysrKysrKysNCj4gPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3Rp
bGUuYyAgICAgICAgIHwgMTggKysrKysrKysrKysrKysrKysrDQo+ID4gIDYgZmlsZXMgY2hhbmdl
ZCwgNjAgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9kZXZpY2UuaA0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5oIGlu
ZGV4IGM0MjMyZGU0MGFlMC4uYjQ0YzkxZDFjZWM5DQo+ID4gMTAwNjQ0DQo+ID4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5oDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2RldmljZS5oDQo+ID4gQEAgLTE1OSw1ICsxNTksNyBAQCBzdGF0aWMgaW5saW5lIGJvb2wg
eGVfZGV2aWNlX2hhc19mbGF0X2NjcyhzdHJ1Y3QNCj4gPiB4ZV9kZXZpY2UgKnhlKSAgfQ0KPiA+
DQo+ID4gIHUzMiB4ZV9kZXZpY2VfY2NzX2J5dGVzKHN0cnVjdCB4ZV9kZXZpY2UgKnhlLCB1NjQg
c2l6ZSk7DQo+ID4gK3ZvaWQgeGVfdGlsZV9yZXBvcnRfZHJpdmVyX2Vycm9yKHN0cnVjdCB4ZV90
aWxlICp0aWxlLA0KPiA+ICsJCQkJIGNvbnN0IGVudW0geGVfdGlsZV9kcnZfZXJyX3R5cGUgZXJy
KTsNCj4gPg0KPiA+ICAjZW5kaWYNCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2RldmljZV90eXBlcy5oDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlX3R5
cGVzLmgNCj4gPiBpbmRleCAzMmFiMGZlYTA0ZWUuLmEyOGUxNDBmOWU2NCAxMDA2NDQNCj4gPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlX3R5cGVzLmgNCj4gPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlX3R5cGVzLmgNCj4gPiBAQCAtNTcsNiArNTcsMTIgQEAg
c3RydWN0IHhlX2dndHQ7DQo+ID4gIAkJIGNvbnN0IHN0cnVjdCB4ZV90aWxlICogOiAoY29uc3Qg
c3RydWN0IHhlX2RldmljZSAqKSgodGlsZV9fKS0+eGUpLA0KPiAJXA0KPiA+ICAJCSBzdHJ1Y3Qg
eGVfdGlsZSAqIDogKHRpbGVfXyktPnhlKQ0KPiA+DQo+ID4gKyNkZWZpbmUgWEVfVElMRV9EUlZf
RVJSX01BWAkyDQo+IA0KPiB0aGlzIHNoYWxsIGJlIHBhcnQgb2YgYmVsb3cgZW51bSBubyBuZWVk
IHRvIGRlZmluZSBzZXBhcmF0ZWx5DQo+ID4gK2VudW0geGVfdGlsZV9kcnZfZXJyX3R5cGUgew0K
PiA+ICsJWEVfVElMRV9EUlZfRVJSX0dHVFQsDQo+ID4gKwlYRV9USUxFX0RSVl9FUlJfSU5UUg0K
PiA+ICt9Ow0KDQpIaSBBcmF2aW5kLCBpdCB3YXMgZG9uZSBzYW1lIHdheSBpbiBwcmV2aW91cyB2
ZXJzaW9uLCBidXQgTWljaGFsJ3MgY29tbWVudCB3YXMgaWYgc29tZW9uZSBwYXNzZXMgIiBYRV9U
SUxFX0RSVl9FUlJfTUFYIiB0aGVuIGNvbXBpbGVyIHdvbnQgdGhyb3cgYW4gZXJyb3IuIFNvIGJl
dHRlciB0byBkZWZpbmUgb3V0c2lkZSB3aGljaCBJIGRvbuKAmXQgdGhpbmsgaXMgYmFkIGlkZWEu
DQoNClRoYW5rcywNClRlamFzDQo+ID4gKw0KPiA+ICAvKioNCj4gPiAgICogc3RydWN0IHhlX21l
bV9yZWdpb24gLSBtZW1vcnkgcmVnaW9uIHN0cnVjdHVyZQ0KPiA+ICAgKiBUaGlzIGlzIHVzZWQg
dG8gZGVzY3JpYmUgYSBtZW1vcnkgcmVnaW9uIGluIHhlIEBAIC0xNzMsNiArMTc5LDkgQEANCj4g
PiBzdHJ1Y3QgeGVfdGlsZSB7DQo+ID4NCj4gPiAgCS8qKiBAc3lzZnM6IHN5c2ZzJyBrb2JqIHVz
ZWQgYnkgeGVfdGlsZV9zeXNmcyAqLw0KPiA+ICAJc3RydWN0IGtvYmplY3QgKnN5c2ZzOw0KPiA+
ICsNCj4gPiArCS8qKiBAZHJ2X2Vycl9jbnQ6IGRyaXZlciBlcnJvciBjb3VudGVyIGZvciB0aGlz
IHRpbGUgKi8NCj4gPiArCXUzMiBkcnZfZXJyX2NudFtYRV9USUxFX0RSVl9FUlJfTUFYXTsNCj4g
PiAgfTsNCj4gPg0KPiA+ICAvKioNCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2d0LmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3QuYw0KPiA+IGluZGV4IDFhYTQ0ZDRm
OWFjMS4uYTFhMGViNTllY2M1IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV9ndC5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0LmMNCj4gPiBAQCAtNDcs
NiArNDcsMjQgQEANCj4gPiAgI2luY2x1ZGUgInhlX3dhLmgiDQo+ID4gICNpbmNsdWRlICJ4ZV93
b3BjbS5oIg0KPiA+DQo+ID4gKy8qKg0KPiA+ICsgKiB4ZV9ndF9yZXBvcnRfZHJpdmVyX2Vycm9y
IC0gQ291bnQgZHJpdmVyIGVyciBmb3IgZ3QNCj4gJXMvZXJyL2Vycm9yL2cNCj4gPiArICogQGd0
OiBHVCB0byBjb3VudCBlcnJvciBmb3INCj4gPiArICogQGVycjogZW51bSBlcnJvciB0eXBlDQo+
ID4gKyAqDQo+ID4gKyAqIEluY3JlbWVudCB0aGUgZHJpdmVyIGVycm9yIGNvdW50ZXIgaW4gcmVz
cGVjdGl2ZSBlcnJvcg0KPiA+ICsgKiBjYXRlZ29yeSBmb3IgdGhpcyBHVC4NCj4gPiArICoNCj4g
PiArICogUmV0dXJucyB2b2lkLg0KPiA+ICsgKi8NCj4gPiArdm9pZCB4ZV9ndF9yZXBvcnRfZHJp
dmVyX2Vycm9yKHN0cnVjdCB4ZV9ndCAqZ3QsDQo+ID4gKwkJCSAgICAgICBjb25zdCBlbnVtIHhl
X2d0X2Rydl9lcnJfdHlwZSBlcnIpIHsNCj4gPiArCXhlX2d0X2Fzc2VydChndCwgZXJyID49IEFS
UkFZX1NJWkUoZ3QtPmRydl9lcnJfY250KSk7DQo+ID4gKwlXUklURV9PTkNFKGd0LT5kcnZfZXJy
X2NudFtlcnJdLA0KPiA+ICsJCSAgIFJFQURfT05DRShndC0+ZHJ2X2Vycl9jbnRbZXJyXSkgKyAx
KTsgfQ0KPiA+ICsNCj4gPiAgc3RydWN0IHhlX2d0ICp4ZV9ndF9hbGxvYyhzdHJ1Y3QgeGVfdGls
ZSAqdGlsZSkgIHsNCj4gPiAgCXN0cnVjdCB4ZV9ndCAqZ3Q7DQo+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9ndC5oIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0LmgNCj4g
PiBpbmRleCBjYWRlZDIwM2E4YTAuLjk0NDJkNjE1MDQyZiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0veGUveGVfZ3QuaA0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9n
dC5oDQo+ID4gQEAgLTY3LDQgKzY3LDcgQEAgc3RhdGljIGlubGluZSBib29sIHhlX2d0X2lzX3Vz
bV9od2Uoc3RydWN0IHhlX2d0ICpndCwNCj4gc3RydWN0IHhlX2h3X2VuZ2luZSAqaHdlKQ0KPiA+
ICAJCWh3ZS0+aW5zdGFuY2UgPT0gZ3QtPnVzbS5yZXNlcnZlZF9iY3NfaW5zdGFuY2U7ICB9DQo+
ID4NCj4gPiArdm9pZCB4ZV9ndF9yZXBvcnRfZHJpdmVyX2Vycm9yKHN0cnVjdCB4ZV9ndCAqZ3Qs
DQo+ID4gKwkJCSAgICAgICBjb25zdCBlbnVtIHhlX2d0X2Rydl9lcnJfdHlwZSBlcnIpOw0KPiA+
ICsNCj4gPiAgI2VuZGlmDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9n
dF90eXBlcy5oDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfdHlwZXMuaA0KPiA+IGlu
ZGV4IGQ0MzEwYmUzZTFlNy4uNDY0NWVhOWI3ODkzIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9ndF90eXBlcy5oDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2d0X3R5cGVzLmgNCj4gPiBAQCAtMjQsNiArMjQsMTMgQEAgZW51bSB4ZV9ndF90eXBlIHsNCj4g
PiAgCVhFX0dUX1RZUEVfTUVESUEsDQo+ID4gIH07DQo+ID4NCj4gPiArI2RlZmluZSBYRV9HVF9E
UlZfRVJSX01BWAkzDQo+IA0KPiBzYW1lIGhlcmUgYWRkIHRvIGJlbG93IGVudW0NCj4gPiArZW51
bSB4ZV9ndF9kcnZfZXJyX3R5cGUgew0KPiA+ICsJWEVfR1RfRFJWX0VSUl9HVUNfQ09NTSwNCj4g
PiArCVhFX0dUX0RSVl9FUlJfRU5HSU5FLA0KPiA+ICsJWEVfR1RfRFJWX0VSUl9PVEhFUlMNCj4g
PiArfTsNCj4gPiArDQo+ID4gICNkZWZpbmUgWEVfTUFYX0RTU19GVVNFX1JFR1MJMw0KPiA+ICAj
ZGVmaW5lIFhFX01BWF9FVV9GVVNFX1JFR1MJMQ0KPiA+DQo+ID4gQEAgLTM0Nyw2ICszNTQsOSBA
QCBzdHJ1Y3QgeGVfZ3Qgew0KPiA+ICAJCS8qKiBAb29iOiBiaXRtYXAgd2l0aCBhY3RpdmUgT09C
IHdvcmthcm91ZG5zICovDQo+ID4gIAkJdW5zaWduZWQgbG9uZyAqb29iOw0KPiA+ICAJfSB3YV9h
Y3RpdmU7DQo+ID4gKw0KPiA+ICsJLyoqIEBkcnZfZXJyX2NudDogZHJpdmVyIGVycm9yIGNvdW50
ZXIgZm9yIHRoaXMgR1QgKi8NCj4gPiArCXUzMiBkcnZfZXJyX2NudFtYRV9HVF9EUlZfRVJSX01B
WF07DQo+ID4gIH07DQo+ID4NCj4gPiAgI2VuZGlmDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV90aWxlLmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV90aWxlLmMg
aW5kZXggMTMxNzUyYTU3ZjY1Li40MDkwNzk4YWZmNGMgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX3RpbGUuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV90
aWxlLmMNCj4gPiBAQCAtNzEsNiArNzEsMjQgQEANCj4gPiAgICogIC0gTU9DUyBhbmQgUEFUIHBy
b2dyYW1taW5nDQo+ID4gICAqLw0KPiA+DQo+ID4gKy8qKg0KPiA+ICsgKiB4ZV90aWxlX3JlcG9y
dF9kcml2ZXJfZXJyb3IgLSBDb3VudCBkcml2ZXIgZXJyIGZvciB0aWxlDQo+ICVzL2Vyci9lcnJv
ci9nDQo+ID4gKyAqIEB0aWxlOiBUaWxlIHRvIGNvdW50IGVycm9yIGZvcg0KPiA+ICsgKiBAZXJy
OiBlbnVtIGVycm9yIHR5cGUNCj4gPiArICoNCj4gPiArICogSW5jcmVtZW50IHRoZSBkcml2ZXIg
ZXJyb3IgY291bnRlciBpbiByZXNwZWN0aXZlIGVycm9yDQo+ID4gKyAqIGNhdGVnb3J5IGZvciB0
aGlzIHRpbGUuDQo+ID4gKyAqDQo+ID4gKyAqIFJldHVybnMgdm9pZC4NCj4gPiArICovDQo+ID4g
K3ZvaWQgeGVfdGlsZV9yZXBvcnRfZHJpdmVyX2Vycm9yKHN0cnVjdCB4ZV90aWxlICp0aWxlLA0K
PiA+ICsJCQkJIGNvbnN0IGVudW0geGVfdGlsZV9kcnZfZXJyX3R5cGUgZXJyKSB7DQo+ID4gKwl4
ZV9hc3NlcnQodGlsZV90b194ZSh0aWxlKSwgZXJyID49IEFSUkFZX1NJWkUodGlsZS0+ZHJ2X2Vy
cl9jbnQpKTsNCj4gPiArCVdSSVRFX09OQ0UodGlsZS0+ZHJ2X2Vycl9jbnRbZXJyXSwNCj4gPiAr
CQkgICBSRUFEX09OQ0UodGlsZS0+ZHJ2X2Vycl9jbnRbZXJyXSkgKyAxKTsgfQ0KPiA+ICsNCj4g
PiAgLyoqDQo+ID4gICAqIHhlX3RpbGVfYWxsb2MgLSBQZXJmb3JtIHBlci10aWxlIG1lbW9yeSBh
bGxvY2F0aW9uDQo+ID4gICAqIEB0aWxlOiBUaWxlIHRvIHBlcmZvcm0gYWxsb2NhdGlvbnMgZm9y
DQo+IFRoYW5rcywNCj4gQXJhdmluZC4NCg==
