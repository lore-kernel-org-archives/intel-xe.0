Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFBF6EB64DA
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jul 2023 12:02:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87574896EC;
	Fri, 14 Jul 2023 12:02:27 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E41C896EC
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Jul 2023 12:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689336146; x=1720872146;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ab+C0oGLR2v7YvPmJZSGQ2OZ7wiYrhD1PczYtsqSZEU=;
 b=O3Lj/SS8CF+yXIJkLb51KtdfHkAjbZYrYGAGkqgM2cLwINk1ZCS35co8
 3m7DTh+LPpbT84KYbT9M5DjRUSKB8yQEIE1v63gfW16B5pU5+BF4ZF3CY
 jOlihpr+QXTRosDsnXLhD4whPu17PqSvqngf3rGblI0fxWC7LLoWGbZw8
 dwvQ82ygYf2O/lb+QOSjbBv6bXdTThAODThCeujiOL+nIy7Tz2B8pClWJ
 6wy8b5Rcttpq489nbr4mQ4i2OQylDNLAM5LxgfDnVBGxP4aYWBliIVqMo
 VFkqxa2cDk8DBHp6EeOGrk9rUEh51ZHOdOdnx3L2XyaJNdCD6uVJLne54 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="364332221"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200"; d="scan'208";a="364332221"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2023 05:02:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="787835630"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200"; d="scan'208";a="787835630"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP; 14 Jul 2023 05:02:24 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 14 Jul 2023 05:02:24 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 14 Jul 2023 05:02:24 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 14 Jul 2023 05:02:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hLTL2wFRPj3AhDTd1AYqasB5PNOsCn0+bRIyUI0ppLxQZDftCmA9NGy2vcHKtvTqFKS9UVvMHK6FvD8M608B2VNVOoVRfZ7xtUGhId4IAo5WHQTMZ5f+cK2sBfiio7hsfEQzaGFyi7T7qHehKqvNAyjy1wKdrlJGQvDK+HSh2mFSSscAUq+lXQLn4N9Pl9OeWF7KTgjJTlMky7uu3eSOHkQdCXa3rjCIZpJcqMR48Vj/LJRLhSD/xYC2nyd5Lbtq3wLS7KZ1mMu9tKQFYa6eHfQIsTMuroR8JHmt6aX1umf0/czrtqxzS8dxL+szPbYe6RIietSrJdg/n1R6wplvcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ab+C0oGLR2v7YvPmJZSGQ2OZ7wiYrhD1PczYtsqSZEU=;
 b=oF2cOCWpk3Y2ZrrzFtGXYV4Q4QZnQ/0tJ8uBnZuNP15lprIpBvA5IXx2nfem8b79LurJ62q4xTOm9ho7egd40mJEXaXGk294o/BxoKbic1j0kUaR7x6yrLzJUw+Lv1i4GiD1YWb8ngSHAZKOBRmp0Un8MxIh6FR++cxLefxnw7b2qzfXCb6rGi+v7AQAG5g+SschdtLg3ZiGUEXaigDXYBA66Kdy96sAjIhnkLHI7i6Eiv1/VIJopl260+ObFtpRDtQ4+3rsiyl5EhhDGEsePOaHsV2HuHZ5FAAWdYDi3XegoWgQ/clZfpFqWX52ZeUGKDXLsPJv1+PUY/s928vuoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by PH7PR11MB6700.namprd11.prod.outlook.com (2603:10b6:510:1ae::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.27; Fri, 14 Jul
 2023 12:02:21 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::347c:9286:96c4:cf61]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::347c:9286:96c4:cf61%7]) with mapi id 15.20.6588.027; Fri, 14 Jul 2023
 12:02:21 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [PATCH v5 4/5] xe/drm/pm: Toggle d3cold_allowed using vram_usages
Thread-Index: AQHZtZbuW6Z4mL2b4k22hjnOwdXv5K+5Jy8AgAADYsA=
Date: Fri, 14 Jul 2023 12:02:21 +0000
Message-ID: <CY5PR11MB62117040B5E85562A0AFAAA39534A@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20230713143121.3901357-1-anshuman.gupta@intel.com>
 <20230713143121.3901357-5-anshuman.gupta@intel.com>
 <8d24ff61-95a7-78f4-0dbc-bbd1f7c050c0@intel.com>
In-Reply-To: <8d24ff61-95a7-78f4-0dbc-bbd1f7c050c0@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|PH7PR11MB6700:EE_
x-ms-office365-filtering-correlation-id: 309c8bf0-a49b-4721-54bf-08db84622df7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ozKoNNBWXy9D1x6JbiYb2usjuM21sUBxBYnkcldOW/AMWl+RMr7pEV4uTVyHU9z1pZoI8nBa8dbzpA3fxeWxbr4Ot0GL+z2mbs9nxRYp3yrazyXU+e+vvgW4OIoyNu1TYf4YsaAIlknXL09wFbxBgIojbLnK0g2gzJFm6Q020NgqlqbBGEL/h8bXxf/s/sduuw19JLWG+12MvGthsXiwiAYPgwyOl2jKd3wonXgfS3ZOnm7+2D5b5cIXpEI8djend0t4ZkuawlJmuWwa225fUDwk0ojT+kVzytNAxSwrI3N+Ns6TKfjt/vbsmXMlCS9zXxJahaK2VW6jDXgJsfvimCtjNleR+rqI3+z7HBe4c+ETUpDYz0rKU2mNZ0o4zHRuiQa/Re1vrUlwdv8rPgRuef7WBjVtTwXokhOdvTSrAQsxE71595CRLHE+vpsrdBxo1qUTYZ2HjW+9bewOPaKWv1vKjGGbkfWOguNO4DLh1ekz7Kii/NGDqGLw6xzzjVL7HXNRP3SFYrRwtZ1I6KXGi36rbntXlB7PfVk7oG8yckNpkHktNXNaiMj04X5YISQvK8I0a9Vi00t6kw+O6Ku1jPLofDJnkSLI3L1PizP2GS+m4Vkst+iom4Qo//vregVs
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(346002)(376002)(396003)(366004)(136003)(451199021)(7696005)(71200400001)(33656002)(83380400001)(186003)(122000001)(38100700002)(38070700005)(86362001)(82960400001)(53546011)(26005)(9686003)(6506007)(55016003)(107886003)(66946007)(66446008)(64756008)(66476007)(76116006)(66556008)(4326008)(54906003)(110136005)(41300700001)(52536014)(5660300002)(8936002)(316002)(8676002)(2906002)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZVp1WEZ4OEhnazBHRjUxOGJlK2pQY0hBQTBwSWcxd2piRU5XbDhEZ3pveWxi?=
 =?utf-8?B?Z1JVTFNrS2Zwdjg2d2JHWTlTUTZXU3dmaE1IVlVPQVJzbnBvMFozcEk4VW1U?=
 =?utf-8?B?YzlKNUY2K2Q2Q3R2V3VLQXNPcHpBdUpiQnh1ajVFVDI0SldJajZRZElJQ0ls?=
 =?utf-8?B?T2lpN1MwcThXQ2JJUEprZFJaOERLM0REUm1SY3UrUEwrczhkRWZaWEJxeG5D?=
 =?utf-8?B?ekdWMVJETS8xUGNoQXRmaXNLUWsxM2RnbWlXWFRlZFJqemd0eXlHdGdTUFc5?=
 =?utf-8?B?Z2NLbFpmZmg1VGJQVXZ0b0JlYVFmcmRIREkxRnlaVlhSZUlMdTVPS3BWUHRI?=
 =?utf-8?B?RVJmeVZjemhWOStNQ3dHcHFZZGlBbnUyR09aVWxwVGk4d0Q5ZnhoeFdWTXVo?=
 =?utf-8?B?Mnp6L3plZDVxNzdDaDlERHdVVHRjeklsTm9ycWEvWXRyNzhoVFlPRmJzUVlq?=
 =?utf-8?B?RFFCRXU3d3llYUdJWUgveDNKQ082TDVzbE8ybEZ6Nkt3OVdTbE1XTUZ4Y2cz?=
 =?utf-8?B?bFYvUFhiUXoyVUpOZDZYMVZOc1Zwb2F4YTYzckZsVWdsN2JFSzZOWW1ETzFE?=
 =?utf-8?B?d0YzTDRKMXd2VzlWakpUeFpoTFBlVHRIK3VuYXVTYWdISzVHbS9EcGFVU0Rm?=
 =?utf-8?B?OEh6MTBUbmcvbEh2OGJUa05SczgzaGlreXFQaGpsRHN2M1hWaVRWTHRKMFZM?=
 =?utf-8?B?ZEpVMU92anowS0VrcDluM3lMeVJnbHU4LzBZMGp3d1A2Y1dHQ25Jekk5NjlT?=
 =?utf-8?B?RkEwdmhJbkpjZzNzREpkVmRyMXZRck5Za3hyamdTQnE1VGIxSlkvdnl5R1FD?=
 =?utf-8?B?dXAwWjJNZVhjTi92b0xUYXpoUW1nMk9LdlFITjhoRGlHYnJwekVMaFk5QjVa?=
 =?utf-8?B?a1BBSjFlM2dNd3JOTEF3TDNCVHVVZnFvWmxaYVVnV3pZREZhUk4xWVdZamdr?=
 =?utf-8?B?ZnVhTE9xaysySmZBR0tvb0tyeWVsMXZUYWdzdnJxRFQwcEVOOXNmK3E4aFVm?=
 =?utf-8?B?MDhFR05jZU55b0pqdWNWRms4OW45bG1iSDA0cWRaY1hTZCtsZVBKQ3dpTDVl?=
 =?utf-8?B?Q3lhQyswY25kMmYrMHdhWlUyZ0MxNkRQVlo4MC8yVnRMVlExVERiM1N2dXVP?=
 =?utf-8?B?VjI5a0dnMFBJYTNpNW94SnlTbFlVVmRUWksxV3UyWFVwNjJIMnVVTkdvVVNv?=
 =?utf-8?B?a3RsS2NvaVpZZHU4eWU3dURFZkV2cTFPbjdCNUZYZ1EycUZZTUEwclM1VnhH?=
 =?utf-8?B?aFVncXJLRmdObURLdmdoYkZFc25vaC9VRlllcjIxVGRWOGpZdThKN1VKNEk5?=
 =?utf-8?B?NEEzeVIrcTl5dTZPYk54Y3QvQTh4UFhqRTB1M1pYYyt3ZHZDaUV6NlpRYi9i?=
 =?utf-8?B?WFFnZHlkelV6cHArN1dCMEREb1Noc0JWT2pyVm5BNkx6blZnNHE2NHB1cDBP?=
 =?utf-8?B?YWhLZHYvbTlwOWp0NXBrSGlUcUl0VUlyK1d6WWE0TUhpUFQrV2pDdGkramRl?=
 =?utf-8?B?aGx3SGl6b0I4TmVtejUwQndNTnh5b3VZWlN6VTk1bGdFOStLd0xiTmw3Y1ln?=
 =?utf-8?B?RnF2cnljZDFGN1FEcUpyc0lpZ1hCdi9aZjRMNHZqODNDbXRQQVZ0Y2tnbnlt?=
 =?utf-8?B?Q25tTkhQd293d2JOUmk3dzBXTGpNOUxyK295dHl1SHpiQ1lQNCs3VG5jcVhM?=
 =?utf-8?B?ZHAxVGRtSksvZTBVMTVta1pnTzVSdis1Q0ErRm9sOFVBUzJIcXRweHQzd0dv?=
 =?utf-8?B?SHFPaUpmWStZTGs2SUNwdk1leHplaGJyR0piLzhSbmFPazM3dC9IcTdCNndX?=
 =?utf-8?B?TlVmU2owc2x4RXl5bTJnZ1JDUS92QVpSTzBHb0NySHNSZWZNMnJjMndIQnJ3?=
 =?utf-8?B?TnN0RnIyUnptTmU3NXdFNlFYMnZvZmNxZGJIcGt6ZWVaYXRYRTA1dVFrZ1d3?=
 =?utf-8?B?Y2JQbXdPNE9JdlJmVjdSNkFWODJ0UlY2U0tHalZVdTRqQ1F1dTN4US94dXF1?=
 =?utf-8?B?a2hCQnlaYjJDa3RSM0cvZXh3c0FPUWozYmZQQTNLWFF6QXE0TEZUd0lJaEJw?=
 =?utf-8?B?QnV0bVBDMi8yVGJENTlZVmcwRE5jREo4T1hhSWZWL0xmNXR1VStsbVlnUVFJ?=
 =?utf-8?Q?8c/cGdeboHKzv+v9pm9XNlykn?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 309c8bf0-a49b-4721-54bf-08db84622df7
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2023 12:02:21.5315 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6QUIUVkTLmajYu/Wcj4j6/kzwmIANqtUBH8b2lhYNri+gQbPPUHv78BUaLCFdXEOnIlGtiKcblG4EYTR5FvsudqL98edcbKY756TXf3gBEg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6700
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v5 4/5] xe/drm/pm: Toggle d3cold_allowed
 using vram_usages
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
Cc: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTmlsYXdhciwgQmFkYWwg
PGJhZGFsLm5pbGF3YXJAaW50ZWwuY29tPg0KPiBTZW50OiBGcmlkYXksIEp1bHkgMTQsIDIwMjMg
NToxOSBQTQ0KPiBUbzogR3VwdGEsIEFuc2h1bWFuIDxhbnNodW1hbi5ndXB0YUBpbnRlbC5jb20+
OyBpbnRlbC0NCj4geGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBWaXZpLCBSb2RyaWdv
IDxyb2RyaWdvLnZpdmlAaW50ZWwuY29tPjsgVGF1cm8sIFJpYW5hDQo+IDxyaWFuYS50YXVyb0Bp
bnRlbC5jb20+OyBTdW5kYXJlc2FuLCBTdWphcml0aGENCj4gPHN1amFyaXRoYS5zdW5kYXJlc2Fu
QGludGVsLmNvbT47IEJyb3N0LCBNYXR0aGV3DQo+IDxtYXR0aGV3LmJyb3N0QGludGVsLmNvbT47
IEhhcnJpc29uLCBKb2huIEMgPGpvaG4uYy5oYXJyaXNvbkBpbnRlbC5jb20+DQo+IFN1YmplY3Q6
IFJlOiBbUEFUQ0ggdjUgNC81XSB4ZS9kcm0vcG06IFRvZ2dsZSBkM2NvbGRfYWxsb3dlZCB1c2lu
Zw0KPiB2cmFtX3VzYWdlcw0KPiANCj4gDQo+IA0KPiBPbiAxMy0wNy0yMDIzIDIwOjAxLCBBbnNo
dW1hbiBHdXB0YSB3cm90ZToNCj4gPiBBZGRpbmcgc3VwcG9ydCB0byBjb250cm9sIGQzY29sZCBi
eSB1c2luZyB2cmFtX3VzYWdlcyBtZXRyaWMgZnJvbSB0dG0NCj4gPiByZXNvdXJjZSBtYW5hZ2Vy
Lg0KPiA+IFdoZW4gcm9vdCBwb3J0ICBpcyBjYXBhYmxlIG9mIGQzY29sZCBidXQgeGUgaGFzIGRp
c2FsbG93ZWQgZDNjb2xkIGR1ZQ0KPiA+IHRvIHZyYW1lX3VzYWdlcyBhYm92ZSB2cmFtX2QzY2Nv
bGRfdGhyZXNob2wuIEl0IGlzIHJlcXVpcmVkIHRvIGRpc2FibGUNCj4gPiBkM2NvbGQgdG8gYXZv
aWQgYW55IHJlc3VtZSBmYWlsdXJlIGJlY2F1c2Ugcm9vdCBwb3J0IGNhbiBzdGlsbA0KPiA+IHRy
YW5zaXRpb24gdG8gZDNjb2xkIHdoZW4gYWxsIG9mIHBjaWUgZW5kcG9pbnRzIGFuZCB7dXBzdHJl
YW0sDQo+ID4gdmlydHVhbH0gc3dpdGNoIHBvcnRzIHdpbGwgdHJhbnNpdGlvbiB0byBkM2hvdC4N
Cj4gPiBBbHNvIGNsZWFuaW5nIHVwIHRoZSBUT0RPIGNvZGUgY29tbWVudC4NCj4gPg0KPiA+IHYy
Og0KPiA+IC0gTW9kaWZ5IGQzY29sZC5hbGxvd2VkIGluIHhlX3BtX2QzY29sZF9hbGxvd2VkX3Rv
Z2dsZS4gW1JpYW5hXQ0KPiA+IC0gQ29uZCBjaGFuZ2VkICh0b3RhbF92cmFtX3VzZWRfbWIgPCB4
ZS0+ZDNjb2xkLnZyYW1fdGhyZXNob2xkKQ0KPiA+ICAgIGFjY29yZGluZyB0byBkb2MgY29tbWVu
dC4NCj4gPiB2MzoNCj4gPiAtIEFkZGVkIGVudW0gaW5zdGVhZCBvZiB0cnVlL2ZsYXNlIGFyZ3Vt
ZW50IGluDQo+ID4gICAgZDNjb2xkX3RvZ2dsZSgpLiBbUm9kcmlnb10NCj4gPiAtIFJlbW92ZWQg
VE9ETyBjb21tZW50LiBbUm9kcmlnb10NCj4gPg0KPiA+IENjOiBSb2RyaWdvIFZpdmkgPHJvZHJp
Z28udml2aUBpbnRlbC5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogQW5zaHVtYW4gR3VwdGEgPGFu
c2h1bWFuLmd1cHRhQGludGVsLmNvbT4NCj4gPiBSZXZpZXdlZC1ieTogQmFkYWwgTmlsYXdhciA8
YmFkYWwubmlsYXdhckBpbnRlbC5jb20+DQo+ID4gQWNrZWQtYnk6IFJvZHJpZ28gVml2aSA8cm9k
cmlnby52aXZpQGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS94ZS94
ZV9wY2kuYyB8IDM2DQo+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLQ0KPiA+
ICAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BtLmMgIHwgMjUgKysrKysrKysrKysrKysrKysrKysr
KysrKw0KPiA+ICAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BtLmggIHwgIDEgKw0KPiA+ICAgMyBm
aWxlcyBjaGFuZ2VkLCA1OSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wY2kuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9wY2kuYw0KPiA+IGluZGV4IGNlNGJkZmNiYzQ2ZC4uODcxODY4MzAxODM4IDEwMDY0
NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wY2kuYw0KPiA+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9wY2kuYw0KPiA+IEBAIC0yNiw2ICsyNiwxMSBAQA0KPiA+ICAgI2lu
Y2x1ZGUgInhlX3BtLmgiDQo+ID4gICAjaW5jbHVkZSAieGVfc3RlcC5oIg0KPiA+DQo+ID4gK2Vu
dW0gdG9nZ2xlX2QzY29sZCB7DQo+ID4gKwlEM0NPTERfRElTQUJMRSwNCj4gPiArCUQzQ09MRF9F
TkFCTEUsDQo+ID4gK307DQo+ID4gKw0KPiA+ICAgc3RydWN0IHhlX3N1YnBsYXRmb3JtX2Rlc2Mg
ew0KPiA+ICAgCWVudW0geGVfc3VicGxhdGZvcm0gc3VicGxhdGZvcm07DQo+ID4gICAJY29uc3Qg
Y2hhciAqbmFtZTsNCj4gPiBAQCAtNzU0LDYgKzc1OSwyOCBAQCBzdGF0aWMgaW50IHhlX3BjaV9y
ZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KQ0KPiA+ICAgCXJldHVybiAwOw0KPiA+ICAgfQ0KPiA+
DQo+ID4gK3N0YXRpYyB2b2lkIGQzY29sZF90b2dnbGUoc3RydWN0IHBjaV9kZXYgKnBkZXYsIGVu
dW0gdG9nZ2xlX2QzY29sZA0KPiA+ICt0b2dnbGUpIHsNCj4gPiArCXN0cnVjdCB4ZV9kZXZpY2Ug
KnhlID0gcGRldl90b194ZV9kZXZpY2UocGRldik7DQo+ID4gKwlzdHJ1Y3QgcGNpX2RldiAqcm9v
dF9wZGV2Ow0KPiA+ICsNCj4gPiArCWlmICgheGUtPmQzY29sZC5jYXBhYmxlKQ0KPiA+ICsJCXJl
dHVybjsNCj4gPiArDQo+ID4gKwlyb290X3BkZXYgPSBwY2llX2ZpbmRfcm9vdF9wb3J0KHBkZXYp
Ow0KPiA+ICsJaWYgKCFyb290X3BkZXYpDQo+ID4gKwkJcmV0dXJuOw0KPiA+ICsNCj4gPiArCXN3
aXRjaCAodG9nZ2xlKSB7DQo+ID4gKwljYXNlIEQzQ09MRF9ESVNBQkxFOg0KPiA+ICsJCXBjaV9k
M2NvbGRfZGlzYWJsZShyb290X3BkZXYpOw0KPiA+ICsJCWJyZWFrOw0KPiA+ICsJY2FzZSBEM0NP
TERfRU5BQkxFOg0KPiA+ICsJCXBjaV9kM2NvbGRfZW5hYmxlKHJvb3RfcGRldik7DQo+ID4gKwkJ
YnJlYWs7DQo+ID4gKwl9DQo+ID4gK30NCj4gPiArDQo+ID4gICBzdGF0aWMgaW50IHhlX3BjaV9y
dW50aW1lX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQ0KPiA+ICAgew0KPiA+ICAgCXN0cnVj
dCBwY2lfZGV2ICpwZGV2ID0gdG9fcGNpX2RldihkZXYpOyBAQCAtNzcxLDYgKzc5OCw3IEBADQo+
IHN0YXRpYw0KPiA+IGludCB4ZV9wY2lfcnVudGltZV9zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRl
dikNCj4gPiAgIAkJcGNpX2lnbm9yZV9ob3RwbHVnKHBkZXYpOw0KPiA+ICAgCQlwY2lfc2V0X3Bv
d2VyX3N0YXRlKHBkZXYsIFBDSV9EM2NvbGQpOw0KPiA+ICAgCX0gZWxzZSB7DQo+ID4gKwkJZDNj
b2xkX3RvZ2dsZShwZGV2LCBEM0NPTERfRElTQUJMRSk7DQo+ID4gICAJCXBjaV9zZXRfcG93ZXJf
c3RhdGUocGRldiwgUENJX0QzaG90KTsNCj4gPiAgIAl9DQo+ID4NCj4gPiBAQCAtNzk1LDYgKzgy
Myw4IEBAIHN0YXRpYyBpbnQgeGVfcGNpX3J1bnRpbWVfcmVzdW1lKHN0cnVjdCBkZXZpY2UNCj4g
KmRldikNCj4gPiAgIAkJCXJldHVybiBlcnI7DQo+ID4NCj4gPiAgIAkJcGNpX3NldF9tYXN0ZXIo
cGRldik7DQo+ID4gKwl9IGVsc2Ugew0KPiA+ICsJCWQzY29sZF90b2dnbGUocGRldiwgRDNDT0xE
X0VOQUJMRSk7DQo+ID4gICAJfQ0KPiA+DQo+ID4gICAJcmV0dXJuIHhlX3BtX3J1bnRpbWVfcmVz
dW1lKHhlKTsNCj4gPiBAQCAtODA4LDE1ICs4MzgsMTUgQEAgc3RhdGljIGludCB4ZV9wY2lfcnVu
dGltZV9pZGxlKHN0cnVjdCBkZXZpY2UgKmRldikNCj4gPiAgIAlpZiAoIXhlLT5kM2NvbGQuY2Fw
YWJsZSkgew0KPiA+ICAgCQl4ZS0+ZDNjb2xkLmFsbG93ZWQgPSBmYWxzZTsNCj4gPiAgIAl9IGVs
c2Ugew0KPiA+ICsJCXhlX3BtX2QzY29sZF9hbGxvd2VkX3RvZ2dsZSh4ZSk7DQo+ID4gKw0KPiA+
ICAgCQkvKg0KPiA+ICAgCQkgKiBUT0RPOiBkM2NvbGQgc2hvdWxkIGJlIGFsbG93ZWQgKHRydWUp
IGlmDQo+ID4gICAJCSAqIChJU19ER0ZYKHhlKSAmJiAheGVfZGV2aWNlX21lbV9hY2Nlc3Nfb25n
b2luZyh4ZSkpDQo+ID4gICAJCSAqIGJ1dCBtYXliZSBpbmNsdWRlIHNvbWUgb3RoZXIgY29uZGl0
aW9ucy4gU28sIGJlZm9yZQ0KPiA+ICAgCQkgKiB3ZSBjYW4gcmUtZW5hYmxlIHRoZSBEM2NvbGQs
IHdlIG5lZWQgdG86DQo+ID4gICAJCSAqIDEuIHJld3JpdGUgdGhlIFZSQU0gc2F2ZSAvIHJlc3Rv
cmUgdG8gYXZvaWQgYnVmZmVyIG9iamVjdA0KPiBsb2Nrcw0KPiA+IC0JCSAqIDIuIGJsb2NrIEQz
Y29sZCBpZiB3ZSBoYXZlIGEgYmlnIGFtb3VudCBvZiBkZXZpY2UgbWVtb3J5DQo+IGluIHVzZQ0K
PiA+IC0JCSAqICAgIGluIG9yZGVyIHRvIHJlZHVjZSB0aGUgbGF0ZW5jeS4NCj4gPiAtCQkgKiAz
LiBhdCByZXN1bWUsIGRldGVjdCBpZiB3ZSByZWFsbHkgbG9zdCBwb3dlciBhbmQgYXZvaWQNCj4g
bWVtb3J5DQo+ID4gKwkJICogMi4gYXQgcmVzdW1lLCBkZXRlY3QgaWYgd2UgcmVhbGx5IGxvc3Qg
cG93ZXIgYW5kIGF2b2lkDQo+IG1lbW9yeQ0KPiA+ICAgCQkgKiAgICByZXN0b3JhdGlvbiBpZiB3
ZSB3ZXJlIG9ubHkgdXAgdG8gZDNjb2xkIEkgdGhpbmsgYXZvaWQNCj4gcmVzdG9yYXRpb24gaWYg
ZDNob3Q/DQpUaGlzIGNvbW1lbnQgaXMgbm90IHJlbGF0ZWQgdG8gdGhpcyBwYXRjaCwgaXQgaXMg
cmVsYXRlZCB0byBleGlzdGluZyBjb2RlLg0KV2lsbCBjaGFuZ2UgdGhpcy4NClJlZ2FyZHMsDQpB
bnNodW1hbi4NCj4gUmVnYXJkcywNCj4gQmFkYWwNCj4gPiAgIAkJICovDQo+ID4gICAJCXhlLT5k
M2NvbGQuYWxsb3dlZCA9IGZhbHNlOw0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfcG0uYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wbS5jDQo+ID4gaW5kZXggMDdlMjA0
OTkwYWE5Li5jNzMyMzE3YjU1Y2IgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX3BtLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcG0uYw0KPiA+IEBAIC0y
OTIsMyArMjkyLDI4IEBAIGludCB4ZV9wbV9zZXRfdnJhbV90aHJlc2hvbGQoc3RydWN0IHhlX2Rl
dmljZQ0KPiA+ICp4ZSwgdTMyIHRocmVzaG9sZCkNCj4gPg0KPiA+ICAgCXJldHVybiAwOw0KPiA+
ICAgfQ0KPiA+ICsNCj4gPiArdm9pZCB4ZV9wbV9kM2NvbGRfYWxsb3dlZF90b2dnbGUoc3RydWN0
IHhlX2RldmljZSAqeGUpIHsNCj4gPiArCXN0cnVjdCB0dG1fcmVzb3VyY2VfbWFuYWdlciAqbWFu
Ow0KPiA+ICsJdTMyIHRvdGFsX3ZyYW1fdXNlZF9tYiA9IDA7DQo+ID4gKwl1NjQgdnJhbV91c2Vk
Ow0KPiA+ICsJaW50IGk7DQo+ID4gKw0KPiA+ICsJZm9yIChpID0gWEVfUExfVlJBTTA7IGkgPD0g
WEVfUExfVlJBTTE7ICsraSkgew0KPiA+ICsJCW1hbiA9IHR0bV9tYW5hZ2VyX3R5cGUoJnhlLT50
dG0sIGkpOw0KPiA+ICsJCWlmIChtYW4pIHsNCj4gPiArCQkJdnJhbV91c2VkID0gdHRtX3Jlc291
cmNlX21hbmFnZXJfdXNhZ2UobWFuKTsNCj4gPiArCQkJdG90YWxfdnJhbV91c2VkX21iICs9DQo+
IERJVl9ST1VORF9VUF9VTEwodnJhbV91c2VkLCAxMDI0ICogMTAyNCk7DQo+ID4gKwkJfQ0KPiA+
ICsJfQ0KPiA+ICsNCj4gPiArCW11dGV4X2xvY2soJnhlLT5kM2NvbGQubG9jayk7DQo+ID4gKw0K
PiA+ICsJaWYgKHRvdGFsX3ZyYW1fdXNlZF9tYiA8IHhlLT5kM2NvbGQudnJhbV90aHJlc2hvbGQp
DQo+ID4gKwkJeGUtPmQzY29sZC5hbGxvd2VkID0gdHJ1ZTsNCj4gPiArCWVsc2UNCj4gPiArCQl4
ZS0+ZDNjb2xkLmFsbG93ZWQgPSBmYWxzZTsNCj4gPiArDQo+ID4gKwltdXRleF91bmxvY2soJnhl
LT5kM2NvbGQubG9jayk7DQo+ID4gK30NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX3BtLmggYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcG0uaA0KPiA+IGluZGV4IGJiZDkx
YTU4NTVjZC4uZWUzMGNmMDI1ZjY0IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9wbS5oDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BtLmgNCj4gPiBAQCAt
MjUsNSArMjUsNiBAQCBib29sIHhlX3BtX3J1bnRpbWVfcmVzdW1lX2lmX3N1c3BlbmRlZChzdHJ1
Y3QNCj4geGVfZGV2aWNlICp4ZSk7DQo+ID4gICBpbnQgeGVfcG1fcnVudGltZV9nZXRfaWZfYWN0
aXZlKHN0cnVjdCB4ZV9kZXZpY2UgKnhlKTsNCj4gPiAgIHZvaWQgeGVfcG1fYXNzZXJ0X3VuYm91
bmRlZF9icmlkZ2Uoc3RydWN0IHhlX2RldmljZSAqeGUpOw0KPiA+ICAgaW50IHhlX3BtX3NldF92
cmFtX3RocmVzaG9sZChzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwgdTMyIHRocmVzaG9sZCk7DQo+ID4g
K3ZvaWQgeGVfcG1fZDNjb2xkX2FsbG93ZWRfdG9nZ2xlKHN0cnVjdCB4ZV9kZXZpY2UgKnhlKTsN
Cj4gPg0KPiA+ICAgI2VuZGlmDQo=
