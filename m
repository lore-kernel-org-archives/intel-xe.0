Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC69FEB64D7
	for <intel-xe@archiver.kernel.org>; Wed, 21 Jun 2023 07:54:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D2E010E0A2;
	Wed, 21 Jun 2023 07:54:02 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CA9010E0A2
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Jun 2023 07:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687334041; x=1718870041;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pYzmAxBSX4dSmyMJRaJlDZ7fy0idvTITCwD/uPUg06I=;
 b=KIG/W7z9CH4K58rZZCI/IPYnmsZsnKLpOq3uOyDpTjRJgsA9ClJTV87w
 i7Swi5LwzRhw0SCGs1f5Z3hzErA+8q5LXxK+S39eIUSZMgJ5F2eXmnZLK
 t1v04WY226OFUuvB7m/t1E8C4HejakWXOFlA627eAqgJ4S3EXo8HwFR8o
 kBKTFhrKPolgHf7atzmd1eC/0Sdt5QeNZQy34o4VS6h1/9m7TO+aMvI3T
 YUB35AgwFdIxis/LfURzSu0cN8Gdx14vApmCIcB7FgpW0cseGq3z3PJhD
 xYLwBpZD1+C/KOqB+uXbbgvvrUF7SesTcbwTiodI/qZ+1tWEFVXaAYPIN g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="446476679"
X-IronPort-AV: E=Sophos;i="6.00,259,1681196400"; d="scan'208";a="446476679"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2023 00:54:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="858881620"
X-IronPort-AV: E=Sophos;i="6.00,259,1681196400"; d="scan'208";a="858881620"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga001.fm.intel.com with ESMTP; 21 Jun 2023 00:54:00 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 21 Jun 2023 00:53:59 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 21 Jun 2023 00:53:59 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 21 Jun 2023 00:53:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cb0D2iayi3rGwlQkscKuLZjBNQr17tFjL55eOtbQqy0Q+q4Dq8/ERsUfySevrPcHXfNUD4ODyzTUIGQZfy0sxxuGyTxruXpwmKNMnjwct+eK0FTTptBNaUDV9Xwk8X2kZyM1gapzSKIiKYYxX10b5CfSxKdlUeqto+EXYVwWqJZK3l1D62sUCqeYtr4dXPUkkfziktoLtSw8xoo2MQulKH1vft56LlafU90ii9Xg2a3FSqB6VLAN/7359ruu/nSx1hHaMPpdeq9TMibshCpZDdQeRrERg18uDPjH1qK7UNoqEbcKdVbFym6dXzUIAkvunE7GieY3VaBFY2+cEeGUtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pYzmAxBSX4dSmyMJRaJlDZ7fy0idvTITCwD/uPUg06I=;
 b=Qr7m1Rzl9+dNb3tlWafcUUZkAdj2QSGRuRsCMVl4K/TS0mRpEV2xeMDIDAwcGWsnAKdfLo7TGSYCGw6IVqcqCBB9gM5NG4V9VQNm299z95XDM69vdHVB34y9KZ0FHagKkr0Z7B+yftsU7bC+KWpmsEcUTc/554wTpGFgaeBNLQu4Q33zFJ+ZyTfHHFDG8MbgwirDm2kJMVOAHZ3vtNHQWeIKprC2RNY6Nwr3BcbuFmGyvxiRm3D3PYqq0kwJYr4ihT87R0jPEMoW9vaqUY49/+SgbFrlbVW5PR8QbpEqTVzq1jjPDx3D7XBX9nCfdOGIvSRLRXzsiqb+rwpX85Gjew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by IA1PR11MB7293.namprd11.prod.outlook.com (2603:10b6:208:42a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Wed, 21 Jun
 2023 07:53:48 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::3cc2:6622:cce5:cd02]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::3cc2:6622:cce5:cd02%5]) with mapi id 15.20.6500.036; Wed, 21 Jun 2023
 07:53:48 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: Matthew Auld <matthew.william.auld@gmail.com>
Thread-Topic: [Intel-xe] [PATCH 1/2] drm/xe/pm: Wrap pm_runtime_suspended with
 power.lock
Thread-Index: AQHZoFy0Qnp8qKjQuUiImpAmEKBuvq+N2vYAgAP+muCAADn0gIAC0wQA
Date: Wed, 21 Jun 2023 07:53:47 +0000
Message-ID: <CY5PR11MB621192D546FCE64CF2F5D5DA955DA@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20230616141115.1128000-1-anshuman.gupta@intel.com>
 <20230616141115.1128000-2-anshuman.gupta@intel.com>
 <ZIzAcvfQnGQvDMb7@DUT025-TGLU.fm.intel.com>
 <CY5PR11MB62115C1381F4AE8C6F0EB8BC955FA@CY5PR11MB6211.namprd11.prod.outlook.com>
 <CAM0jSHOSCK1mVaZ-cuE=94UMs38hHPJ24JmQWrs8gCBpaVR9-g@mail.gmail.com>
In-Reply-To: <CAM0jSHOSCK1mVaZ-cuE=94UMs38hHPJ24JmQWrs8gCBpaVR9-g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|IA1PR11MB7293:EE_
x-ms-office365-filtering-correlation-id: e943cf74-9a3b-4c00-6e22-08db722ca54d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: k4CkpnCVMhxfxbW989ZCpptmqVDSFfae5/ffzGZR6jtyuVe2HIOQnbeBrsoG1au6FEkeovUarV+wvUkUHdrGuoHynAVd2Bhc99kTpPErotZWEfxrFfAQmvQQ4+2I+0oEK/EpN8yvuk++KcEzproMdroKm3EnaQdxLNBjmQY1KQY0Pk5TvK1oIxbgcTTazpLhnF/D7qd/pYEIUYjj0olwnNvNSddO4aldPBrrqwvhQB0kBMBgG8DGQDL7Ynkzy5yRwgtBRgLxyTEdTpW1kEkFApazcOEXgWxSaG/D1QycVQbzeISwFyPiEbM9PxIcWp6U05vvn1hchGj1TlnmVQSYUZD8znwEVeMAZAekRTYyifwwnCLUSeepdbEq7IFL1nE7NIMzH/jAG6TpdaQBA3tCibRn8nzVlo5ULpGxAb7Si7q2O6+UQjcbZm+98sYS8snmfz9QMQw+MyWakQKw9EKSGpJa3aTB+W8MokxhqSLusmdenhdBMENJwDvpHxS/c29EhXStkKZqotPR1wz5YeX6fcYPguNt5WuL/jcsPGZtNX9yqvSWx/AkzYWR2lVeoHqJ04X/sld3ADFQeMgoAGnmqpwytYV3zatUdJFLLMEsg5/BnTai1vmwNVNcxVYufQjdC395P6aHYb+CC7WcL2S7lw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(346002)(39860400002)(136003)(366004)(376002)(451199021)(83380400001)(54906003)(7696005)(316002)(38100700002)(8936002)(8676002)(9686003)(86362001)(26005)(4326008)(33656002)(186003)(6506007)(66476007)(41300700001)(5660300002)(52536014)(66446008)(53546011)(64756008)(66946007)(6916009)(66556008)(76116006)(82960400001)(71200400001)(122000001)(966005)(55016003)(38070700005)(478600001)(107886003)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NHlQeGNtbk5pTTBNa0JrSzJZUFFudUpPcGZya0psaXRjODM4elNvaVJPWXlF?=
 =?utf-8?B?UlZNTlZ5Vi83Z1RURGxtdGlVUklMMm9McVFFZXU5YlY5VnZxVnNUdFRVZXZS?=
 =?utf-8?B?dldmS2xDVWZNZENXOVY1L2EzVTJ4RHRvQ0MzOURPRCtzVFZVUlg2ZjRUdUlq?=
 =?utf-8?B?N3lEb1RWQmNVWStpOEk2M0dDOFpTM2U1d2FoeTBFVm5RVG9KeWNWRjFyUGwr?=
 =?utf-8?B?Z0RkaHFrNmhmL25QOWlLS0JlMjJoeTZSbEZPQXhvSTU5WUoxNnc2UldhZVRt?=
 =?utf-8?B?MTlNRG95L3IrVWJYbEcybFJkd21DQ2NpU1JaaVdZMndxMWpOcG5sN21yMDlC?=
 =?utf-8?B?VXFydjh1engxb3JpN3gzZ0tWNi9ielM0c21XUXh3RWNnckROZzJycFlmaGRK?=
 =?utf-8?B?dTkxbHptNDRQY05vSjdnRERqejNOclZ5Tjl0Z0RuVWgzdEhUZVk0NFV5R2NE?=
 =?utf-8?B?eXFkM05zOUo5eHV1YWxQY2poVG93RXFxbWdMUm83dEY5R2JSNFZqRG9QK0lR?=
 =?utf-8?B?WTV2cExQTHJxU3NEd3NtSG5ac1Vhb3VOQ2F5S3NvNmQ1Qk1Pd213bDJaMjdj?=
 =?utf-8?B?VUVQMkhWVGFnNjQzOXJOSHJ6UGJPUkZoa2R1Z3JBQmlocml1Z3B4ODFuRUkr?=
 =?utf-8?B?L0U5YjBmUUhqSGhvVWlEOXg2d3lsOXA5OFIyZmxqTXpTQk0zMUFZYlBNUzJy?=
 =?utf-8?B?N0VvendIS2hKQnNja2tacFdPd0lCRk1RazJXaWVRU0pMVlh1MURkTVgvaFF0?=
 =?utf-8?B?ZTlYcE1rUGwvUFlRb2creC8xV0tnZSt4bmFWWVYyK1hwTEREZGlkTmViblVF?=
 =?utf-8?B?cElPaCtaVXVGRkRnK3lwcmh5U1AwZjBUM2NBUlN6dnN2K29tUTdZZStXZ2dt?=
 =?utf-8?B?MHdaTW5rY1RhK0RmNGE5K1pCQkVranprN0hoSi9sTHMyS1BCRWxpM3g0Umd5?=
 =?utf-8?B?QStMT3RrdjYwOW9FRUQvejQ3UzZIZHMyNG43cFNnTGttVlZQS0J5TW5BVCtL?=
 =?utf-8?B?ZVNpUEFPRENGVHBzQ1BPck1SeTdHdWprbWhSMEorMnhyeDRXSkxkSzNOZGxw?=
 =?utf-8?B?TlgyY2lOZmI4d1BzUWdlYW83Z0RZVHgrSnlHcFQxSE95akhNNEJGRkI5N0Nh?=
 =?utf-8?B?WUlycmRNRnBrRUdKMmNuekZOWEF6RkZxeEhMQVgrWkJ6Z1NhTzB5UTlibTlX?=
 =?utf-8?B?Q3lDNnY2M0kzOEFiaG10c2VIbnhJa3pBTlVLbk90YkVTRm0rcjRTY0pOOWhN?=
 =?utf-8?B?Q2JJbEY2SVRWYmpSK3lJYy9RcEtJejU5MEFRcVdSaFhOZGVtMnlBcUdyZ0ta?=
 =?utf-8?B?ZnFtT3puVExYNXpjc0JZTy9iT2FETDZoRm1CVURGb3pINFhHbEtqbEdxdWYr?=
 =?utf-8?B?ampVZmVUY3hFaVU4eCtPbFBUbG9mTXhuY2Q1WjBlRmNiUGdmU3grd2NyNFlq?=
 =?utf-8?B?ak8yY0JIclpLcytSYXZ3dkhyYk9JK2YwVm9wUHhqcEI5cC9oMFBwYUJtdFFv?=
 =?utf-8?B?L2kvcVVlSjFZY0dFVFlMYUNVVk9WUGxiWjN1ZktOaTIvSllLZEkyNi9LUlcv?=
 =?utf-8?B?RmM3cFl4UXc4b3RBLzB6MGZlWTQwb3R1VlE0b1JMaDhnM0NPTVM5VkZWWGto?=
 =?utf-8?B?cnErd2ZjZG51NDBnUkxFSHBkN3BJL1M1YTBqd2VIc1lpMGdCNGIxblFRNlJE?=
 =?utf-8?B?MlRGeVBUK1Yycng2TW1KN3RjaVNoYXBjUnd4LzNBdXlSMXFxcEM2bEFsazVS?=
 =?utf-8?B?TFRGMWxha0doeS80cEt1RitZM2FST1dIanRNYmRWd3J1UW9oLzJFcHgyZnRM?=
 =?utf-8?B?TVYyRGR3Sy9jWGN1aDNSNmhCTW5EUHBJc2N0SThtSjF1ZzBINmRIQzI3aTdS?=
 =?utf-8?B?RG4ybFd5NTAyYjJZd3htWm1FTWZRVm91VE5ITXl2RVdKa3Mvbk9FSzdWS0FQ?=
 =?utf-8?B?bFhXNFV3b0djdTB1QnFSaFA1RXQ3MERNL2I4QWl1S3FuSWhucmhXVU1UeXdH?=
 =?utf-8?B?MzlyL1k2QnpyVFFDU2tBd0ErMGUxQjdrZnRHWFhCdjFGekZkcUt2VGhrQkRQ?=
 =?utf-8?B?bUsvQjBacFUvandqL1ZVYmhwUEtmaE45NkErenlmUFF5WjM5azBhN055T2Vh?=
 =?utf-8?Q?NzNkuUXb9k7MeBsXzRjzte9uo?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e943cf74-9a3b-4c00-6e22-08db722ca54d
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2023 07:53:48.0021 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PBgEfYe9E/PyY6d290Hbgja2khiRm8hhhe1FjsSpsDkfp0f+dxHrws3dnMSJtIPhmbZ0UYxiGb1bIOpJHUAPsk4hLfD1TrWpTgy5Oo7c1rw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7293
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe/pm: Wrap pm_runtime_suspended
 with power.lock
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
Cc: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTWF0dGhldyBBdWxkIDxt
YXR0aGV3LndpbGxpYW0uYXVsZEBnbWFpbC5jb20+DQo+IFNlbnQ6IE1vbmRheSwgSnVuZSAxOSwg
MjAyMyA2OjAzIFBNDQo+IFRvOiBHdXB0YSwgQW5zaHVtYW4gPGFuc2h1bWFuLmd1cHRhQGludGVs
LmNvbT4NCj4gQ2M6IEJyb3N0LCBNYXR0aGV3IDxtYXR0aGV3LmJyb3N0QGludGVsLmNvbT47IFN1
bmRhcmVzYW4sIFN1amFyaXRoYQ0KPiA8c3VqYXJpdGhhLnN1bmRhcmVzYW5AaW50ZWwuY29tPjsg
aW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBWaXZpLA0KPiBSb2RyaWdvIDxyb2RyaWdv
LnZpdmlAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBSZTogW0ludGVsLXhlXSBbUEFUQ0ggMS8yXSBk
cm0veGUvcG06IFdyYXANCj4gcG1fcnVudGltZV9zdXNwZW5kZWQgd2l0aCBwb3dlci5sb2NrDQo+
IA0KPiBPbiBNb24sIDE5IEp1biAyMDIzIGF0IDEyOjE4LCBHdXB0YSwgQW5zaHVtYW4NCj4gPGFu
c2h1bWFuLmd1cHRhQGludGVsLmNvbT4gd3JvdGU6DQo+ID4NCj4gPg0KPiA+DQo+ID4gPiAtLS0t
LU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gRnJvbTogQnJvc3QsIE1hdHRoZXcgPG1hdHRo
ZXcuYnJvc3RAaW50ZWwuY29tPg0KPiA+ID4gU2VudDogU2F0dXJkYXksIEp1bmUgMTcsIDIwMjMg
MTozNSBBTQ0KPiA+ID4gVG86IEd1cHRhLCBBbnNodW1hbiA8YW5zaHVtYW4uZ3VwdGFAaW50ZWwu
Y29tPg0KPiA+ID4gQ2M6IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgTmlsYXdhciwg
QmFkYWwNCj4gPiA+IDxiYWRhbC5uaWxhd2FyQGludGVsLmNvbT47IFZpdmksIFJvZHJpZ28gPHJv
ZHJpZ28udml2aUBpbnRlbC5jb20+Ow0KPiA+ID4gVGF1cm8sIFJpYW5hIDxyaWFuYS50YXVyb0Bp
bnRlbC5jb20+OyBTdW5kYXJlc2FuLCBTdWphcml0aGENCj4gPiA+IDxzdWphcml0aGEuc3VuZGFy
ZXNhbkBpbnRlbC5jb20+DQo+ID4gPiBTdWJqZWN0OiBSZTogW1BBVENIIDEvMl0gZHJtL3hlL3Bt
OiBXcmFwIHBtX3J1bnRpbWVfc3VzcGVuZGVkDQo+IHdpdGgNCj4gPiA+IHBvd2VyLmxvY2sNCj4g
PiA+DQo+ID4gPiBPbiBGcmksIEp1biAxNiwgMjAyMyBhdCAwNzo0MToxNFBNICswNTMwLCBBbnNo
dW1hbiBHdXB0YSB3cm90ZToNCj4gPiA+ID4gcG1fcnVudGltZV9zdXNwZW5kZWQoKSBkb2MgaGFz
IHJlcXVpcmVtZW50IHRvIHVzZSBpdCB3aXRoIFBNIGxvY2sNCj4gPiA+ID4gb2YgQGRldiB0byBn
ZXQgdGhlIHRydXN0ZWQgdmFsdWUuDQo+ID4gPiA+IFdyYXAgcG1fcnVudGltZV9zdXNwZW5kZWQg
d2l0aGluIHhlX3BtX3J1bnRpbWVfc3VzcGVuZGVkKCkNCj4gd2l0aA0KPiA+ID4gcHJvcGVyDQo+
ID4gPiA+IGxvY2tpbmcuDQo+ID4gPiA+DQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEFuc2h1bWFu
IEd1cHRhIDxhbnNodW1hbi5ndXB0YUBpbnRlbC5jb20+DQo+ID4gPiA+IC0tLQ0KPiA+ID4gPiAg
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BtLmMgfCAxNiArKysrKysrKysrKysrKy0tDQo+ID4gPiA+
ICAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gPiA+
ID4NCj4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wbS5jDQo+ID4g
PiA+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BtLmMgaW5kZXggYjdiNTdmMTBiYTI1Li4wNGM1
MzUzYmE4NzANCj4gPiA+ID4gMTAwNjQ0DQo+ID4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9wbS5jDQo+ID4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wbS5jDQo+ID4g
PiA+IEBAIC0yMTAsMTEgKzIxMCwyMyBAQCBpbnQgeGVfcG1fcnVudGltZV9wdXQoc3RydWN0IHhl
X2RldmljZQ0KPiAqeGUpDQo+ID4gPiA+ICAgICByZXR1cm4gcG1fcnVudGltZV9wdXRfYXV0b3N1
c3BlbmQoeGUtPmRybS5kZXYpOw0KPiA+ID4gPiAgfQ0KPiA+ID4gPg0KPiA+ID4gPiArc3RhdGlj
IGJvb2wgeGVfcG1fcnVudGltZV9zdXNwZW5kZWQoc3RydWN0IHhlX2RldmljZSAqeGUpIHsNCj4g
PiA+ID4gKyAgIHVuc2lnbmVkIGxvbmcgZmxhZ3M7DQo+ID4gPiA+ICsgICBib29sIHN1c3BlbmRl
ZDsNCj4gPiA+ID4gKw0KPiA+ID4gPiArICAgc3Bpbl9sb2NrX2lycXNhdmUoJnhlLT5kcm0uZGV2
LT5wb3dlci5sb2NrLCBmbGFncyk7DQo+ID4gPiA+ICsgICBzdXNwZW5kZWQgPSBwbV9ydW50aW1l
X3N1c3BlbmRlZCh4ZS0+ZHJtLmRldik7DQo+ID4gPiA+ICsgICBzcGluX3VubG9ja19pcnFyZXN0
b3JlKCZ4ZS0+ZHJtLmRldi0+cG93ZXIubG9jaywgZmxhZ3MpOw0KPiA+ID4NCj4gPiA+IEEgZmV3
IHRoaW5ncy4NCj4gPiA+DQo+ID4gPiBGaXJzdCwgeW91IHByb2JhYmx5IGNhbiBtYWtlIHRoaXMg
c3Bpbl9sb2NrX2lycSAvIHNwaW5fdW5sb2NrX2lycSBhcw0KPiA+ID4gSVJRIGNvbnRleHRzIGFy
ZSBub3QgcmVhbGx5IHVzZWQgaW4gWGUgaXQgaXMgZG91YnRmdWwgdGhpcyBmdW5jdGlvbg0KPiA+
ID4gd291bGQgZXZlciBiZSBjYWxsZWQgZnJvbSBhbiB1bmtub3duIGNvbnRleHQuDQo+ID4gVGhh
bmtzICBmb3IgcmV2aWV3ICwgSSB3aWxsIGZpeCB0aGlzLg0KPiA+ID4NCj4gPiA+IFNlY29uZCwg
SSBoYXZlIHF1ZXN0aW9ucyBpZiB0aGlzIHBhdGNoIGlzIGFjdHVhbGx5IGRvaW5nIGFueXRoaW5n
DQo+ID4gPiB1c2VmdWwuIFllcywgSSBjYW4gc2VlIGRvYyB3aGljaCBpbmRpY2F0ZXMgdGhhdCBw
bV9ydW50aW1lX3N1c3BlbmRlZA0KPiA+ID4gY2FuIG9ubHkgYmUgdHJ1c3RlZCBpZiB0aGUgbG9j
ayBpcyBoZWxkIGJ1dCBsb29raW5nIGF0IHRoZSBjb2RlDQo+ID4gPiBwYXRocyB3aGVyZSB4ZV9w
bV9ydW50aW1lX3N1c3BlbmRlZCBpcyBjYWxsZWQgdW5zdXJlIGhvdyB0aGlzIGxvY2sNCj4gaGVs
cHMuDQo+ID4gPg0KPiA+ID4gZS5nLiBIb3cgaXMgdGhpcyBiZXR0ZXI/DQo+ID4gVGhpcyBpcyBo
ZWxwZnVsIGluIGNhc2UsIHdoZW4gcG1fcnVudGltZV9zdXNwZW5kZWQoKSByZXR1cm5zIHN0YXR1
cyBpcw0KPiA+IFJQTV9TVVNQRU5ESU5HIGFuZCBpdCB3aWxsIGJlIGdvaW5nIHRvIGNoYW5nZSB0
byBSUE1fU1VQRU5ERUQsDQo+ID4gcnBtX3N1c3BlbmQoKSBjaGFuZ2VzIHRoZSBydW50aW1lIHN0
YXR1cyBmcm9tIFJQTV9BQ1RJVkUgLT4NCj4gPiBSUE1fU1VTUEVORElORyAtPiBkcml2ZXItPnJ1
bnRpbWVfc3VzcGVuZCgpIGNhbGxiYWNrIC0+DQo+IFJQTV9TVVNQRU5ERUQNCj4gPiBodHRwczov
L2VsaXhpci5ib290bGluLmNvbS9saW51eC9sYXRlc3Qvc291cmNlL2RyaXZlcnMvYmFzZS9wb3dl
ci9ydW50DQo+ID4gaW1lLmMjTDU1OA0KPiA+IHJwbV9zdXNwZW5kKCkgY2FsbGVyIGhhcyBhbHJl
YWR5IGdyYWJiZWQgdGhlIGxvY2sgYW5kIFJQTSBzdGF0dXMNCj4gY2hhbmdlZCB0byBSUE1fU1VT
UEVORElORywgdGhlcmVmb3JlIFhlIGhhcyB0byB3YWl0IHRvIGdyYWIgdGhlIGxvY2sgdG8NCj4g
Z2V0IHRoZSB0cnVzdGVkIHZhbHVlLCB3aGljaCBpcyBSUE1fU1VTUEVOREVELg0KPiA+IFdpdGhv
dXQgYSBwcm9wZXIgbG9jaywgdGhlIHhlIGRyaXZlciBtYXkgYWNjZXNzIHRoZSB2cmFtIHdoaWxl
IHRoZQ0KPiA+IGRldmljZSB3YXMgcnVudGltZSBzdXNwZW5kZWQsIHdoaWNoIGlzIGEgdmlvbGF0
aW9uIG9mICBQQ0llIHNwZWNzLj4gaWYNCj4gPiAodHJ1c3RlZCB2YWx1ZSkNCj4gPiA+ICAgICAg
IG5vdyB0aGUgdHJ1c3RlZCB2YWx1ZSBjYW4gY2hhbmdlLCBkbyBzb21ldGhpbmcNCj4gPiBUaGUg
b3RoZXIgd2F5IGFyb3VuZCBpcyBpZiBYZSBoYXMgZ3JhYmJlZCB0aGUgbG9jayBmaXJzdCB0aGVu
IHRoZQ0KPiA+IHBvc3NpYmxlIHJ1bnRpbWUgc3RhdHVzIGlzIGVpdGhlciBSUE1fQUNUSVZFIG9y
IFJVTlRJTUVfU1VQRU5ERUQgIGZvcg0KPiBib3RoIFhlIGlzIGluY3JlYXNpbmcgdXNhZ2UgcmVm
IGNvdW50IGV4cGxpY2l0bHkgdG8gbWFrZSBzdXJlIHRoZSBkZXZpY2UgaXMgaW4NCj4gYW4gYWN0
aXZlIHN0YXRlLg0KPiANCj4gRnJvbSBteSByZWFkaW5nIG9mIHRoZSBSUE0gY29yZSBjb2RlLCBp
dCBldmVudHVhbGx5IGRyb3BzIHRoZSBwb3dlci5sb2NrDQo+IGJlZm9yZSBjYWxsaW5nIGFueSBv
ZiB0aGUgZHJpdmVyIHBtIGNhbGxiYWNrcyAoc2VlDQo+IF9fcnBtX2NhbGxiYWNrKCkgZm9yIGV4
YW1wbGUpLCBhbmQgdGhlbiBvbmx5IHJlLWFjcXVpcmVzIGl0IGFmdGVyLiBJIHRoaW5rIGl0DQo+
IG1vc3RseSBqdXN0IHByb3RlY3RzIHRoZSBSUE0gc3RhdGUuIElmIHNvbWV0aGluZyBpcyB0cmFu
c2l0aW9uaW5nIGZyb20NCj4gUlBNX0FDVElWRSAtPiBSUE1fU1VTUEVORElORyBvciB3aGF0ZXZl
ciwgZ3JhYmJpbmcgdGhlIHBvd2VyLmxvY2sNCj4gd29uJ3Qgc3luY2hyb25pc2UgdGhlIGFjdHVh
bCBvcGVyYXRpb24sIHNpbmNlIHRoZSBsb2NrIGlzIG5vdCBldmVuIGJlaW5nIGhlbGQNCj4gd2hl
biBvdXIgY2FsbGJhY2sgaXMgYmVpbmcgcnVuLiBJZiB3ZSB3YW50IHRvIGFjdHVhbGx5IHN5bmNo
cm9uaXNlIGFuIG9uZ29pbmcNCj4gU1VTUEVORElORyBvciBSRVNVTUlORyB5b3UgaGF2ZSB0byBj
YWxsIHNvbWV0aGluZyBsaWtlDQo+IHBtX3J1bnRpbWVfZ2V0X3N5bmMoKSBJIHRoaW5rLg0KQWxs
IHJwbV97aWRsZSxyZXN1bWUsc3VzcGVuZH0gUE0gY29yZSBjYWxscyBiZWluZyBjYWxsZWQgd2l0
aCBwb3dlci5sb2NrIGhlbGQuIA0KU2VlIGJlbG93Lg0KaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5j
b20vbGludXgvbGF0ZXN0L3NvdXJjZS9kcml2ZXJzL2Jhc2UvcG93ZXIvcnVudGltZS5jI0wxMTQw
DQpodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC9sYXRlc3Qvc291cmNlL2RyaXZlcnMv
YmFzZS9wb3dlci9ydW50aW1lLmMjTDExNTgNCmh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xp
bnV4L2xhdGVzdC9zb3VyY2UvZHJpdmVycy9iYXNlL3Bvd2VyL3J1bnRpbWUuYyNMMTEwMg0KDQpT
byBkdXJpbmcgZHJpdmVyIGNhbGxiYWNrIGFzIHdlbGwsIHBvd2VyIGxvY2sgd2lsbCBiZSBoZWxk
Lg0KDQpXZSBjYW4gbm90IHVzZSBwbV9ydW50aW1lX2dldF9zeW5jKCkgaW4gdGhlIHRoZSBydW50
aW1lIHN1c3BlbmQgY2FsbCBwYXRoIGFzIGl0IHdpbGwgY2F1c2UgYSBkZWFkbG9jay4NClNlZSB4
ZV9kZXZpY2VfbWVtX2FjY2Vzc19nZXQoKSBpcyBldmVuIGdldCBjYWxsZWQgZnJvbSBydW50aW1l
IHN1cGVuZCBjYWxsIHBhdGNoIGFzIHdlbGwuDQpUaGlzIHNlZW1zIGludGVudGlvbmFsIHRvIHJl
dXNlIHRoZSBjb2RlLg0KPiANCj4gQWxzbyBsaWtlIE1hdHQgc2FpZCwgZXZlbiBpZiB0aGlzIHNv
bWVob3cgYWxsIHdvcmtlZCB0aGVyZSBpcyBzdGlsbCB0aGUgYWN0dWFsDQo+IHJhY2Ugd2luZG93
IGJldHdlZW4gY2hlY2tpbmcgaWYgaXQgaXMgbm90IHN1c3BlbmRlZCBhbmQgdGhlbiBwcm9jZWVk
aW5nIGFzDQo+IGlmIHRoYXQgaXMgc3RpbGwgZ29pbmcgdG8gYmUgdGhlIGNhc2UuDQo+IA0KPiBG
V0lXIHRoZXJlIGlzIGFuIGF0dGVtcHQgdG8gZml4IHN1Y2ggaXNzdWVzIGhlcmUsIGFsdGhvdWdo
IGl0J3MgYWxsIHF1aXRlIG5hc3R5Og0KPiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5v
cmcvc2VyaWVzLzExOTIxMy8NClRoYW5rcyBmb3IgcG9pbnRpbmcgdGhlIHNlcmllcywgd2lsbCB0
YWtlIGxvb2sgaW4gIHRvIGl0Lg0KDQpUaGFua3MsDQpBbnNodW1hbiBHdXB0YS4NCg0KPiANCj4g
Pg0KPiA+IFRoYW5rcyAsDQo+ID4gQW5zaHVtYW4gR3VwdGEuDQo+ID4gPg0KPiA+ID4NCj4gPiA+
IFRoYW4/DQo+ID4gPiBpZiAodW50cnVzdGVkIHZhbHVlKQ0KPiA+ID4gICAgICAgZG8gc29tZXRo
aW5nDQo+ID4gPiBBbHNvIGlmIHlvdSBsb29rIGFsbCBvdmVyIGtlcm5lbCBwbV9ydW50aW1lX3N1
c3BlbmRlZCBpcyBjYWxsZWQNCj4gPiA+IGZyZXF1ZW50bHkNCj4gPiA+IGRldi0+cG93ZXIubG9j
ay4NCj4gPiA+DQo+ID4gPiBNYXR0DQo+ID4gPg0KPiA+ID4gPiArDQo+ID4gPiA+ICsgICByZXR1
cm4gc3VzcGVuZGVkOw0KPiA+ID4gPiArfQ0KPiA+ID4gPiArDQo+ID4gPiA+ICAvKiBSZXR1cm4g
dHJ1ZSBpZiByZXN1bWUgb3BlcmF0aW9uIGhhcHBlbmVkIGFuZCB1c2FnZSBjb3VudCB3YXMNCj4g
PiA+ID4gaW5jcmVhc2VkICovICBib29sIHhlX3BtX3J1bnRpbWVfcmVzdW1lX2lmX3N1c3BlbmRl
ZChzdHJ1Y3QNCj4gPiA+IHhlX2RldmljZQ0KPiA+ID4gPiAqeGUpICB7DQo+ID4gPiA+ICAgICAv
KiBJbiBjYXNlIHdlIGFyZSBzdXNwZW5kZWQgd2UgbmVlZCB0byBpbW1lZGlhdGVseSB3YWtlIHVw
ICovDQo+ID4gPiA+IC0gICBpZiAocG1fcnVudGltZV9zdXNwZW5kZWQoeGUtPmRybS5kZXYpKQ0K
PiA+ID4gPiArICAgaWYgKHhlX3BtX3J1bnRpbWVfc3VzcGVuZGVkKHhlKSkNCj4gPiA+ID4gICAg
ICAgICAgICAgcmV0dXJuICFwbV9ydW50aW1lX3Jlc3VtZV9hbmRfZ2V0KHhlLT5kcm0uZGV2KTsN
Cj4gPiA+ID4NCj4gPiA+ID4gICAgIHJldHVybiBmYWxzZTsNCj4gPiA+ID4gQEAgLTIyMiw2ICsy
MzQsNiBAQCBib29sDQo+IHhlX3BtX3J1bnRpbWVfcmVzdW1lX2lmX3N1c3BlbmRlZChzdHJ1Y3QN
Cj4gPiA+ID4geGVfZGV2aWNlICp4ZSkNCj4gPiA+ID4NCj4gPiA+ID4gIGludCB4ZV9wbV9ydW50
aW1lX2dldF9pZl9hY3RpdmUoc3RydWN0IHhlX2RldmljZSAqeGUpICB7DQo+ID4gPiA+IC0gICBX
QVJOX09OKHBtX3J1bnRpbWVfc3VzcGVuZGVkKHhlLT5kcm0uZGV2KSk7DQo+ID4gPiA+ICsgICBX
QVJOX09OKHhlX3BtX3J1bnRpbWVfc3VzcGVuZGVkKHhlKSk7DQo+ID4gPiA+ICAgICByZXR1cm4g
cG1fcnVudGltZV9nZXRfaWZfYWN0aXZlKHhlLT5kcm0uZGV2LCB0cnVlKTsgIH0NCj4gPiA+ID4g
LS0NCj4gPiA+ID4gMi4zOC4wDQo+ID4gPiA+DQo=
