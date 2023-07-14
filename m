Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B668EB64DA
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jul 2023 12:20:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C58E510E87B;
	Fri, 14 Jul 2023 12:20:10 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85AED10E87B
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Jul 2023 12:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689337209; x=1720873209;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nosLtxJerR2uTHx+nM+9wf/63qG2nyCMgZxOQ7PcZGY=;
 b=MWoJuGUr5w2BWf3IDVhSThT8CE5V9lOiFNNfgxrLCU1vr0MTXmuKSHs1
 gw1mvZS8/TBHmc/KfmXwgs1dXhRY0nRtWDC3vcC9eVAe7DgHhBtHg5BwD
 5vEpNZZKYsOZ17Mx9nVpfPwwL5aVhH3oWf8Olkf8hUix8HiFnkx2f2Ve1
 SHBV+wCwggPGq7UPjWgJTwae/lYMVwY1yLY4mV4m5ppgv59NGZeUQUccP
 kS6k/ITaML3gTIMIy+H5jBAIhcT3WG1ZWkChoaC8960VgRyluGTEqp3VJ
 EcP4XE5yS1wOzygMqzSoI/D9PSruAxH+X7WtLLWBBWvg+TNalfmMdOya3 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="431632237"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200"; d="scan'208";a="431632237"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2023 05:20:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="716322251"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200"; d="scan'208";a="716322251"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga007.jf.intel.com with ESMTP; 14 Jul 2023 05:20:08 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 14 Jul 2023 05:20:08 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 14 Jul 2023 05:20:07 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 14 Jul 2023 05:20:07 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 14 Jul 2023 05:20:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PdMg3ACuin+jBZZ1CLbrQc5YOMxLyhexJSaB4Y3HRz1KgWAznw/+SnPihrbQSEYgUQyHP7SRw/Uo4YRD7fsMtvVgB9wBhCTYBmECJu6/L6zI/IX8lW0IXuLKXX6RATOFzwhyRv6/vkSeAGP3ku0bCdO8i4pjmeJpIwa+WHI3F7S5O43bZqObAOJ9BAp6Mov1IEzl6CL7XyIZgNgutEj3Ay4cUbUWqqlh3yM5Zk5EZ0uv7bJsnqq6WToEyIAPnzHFDrQdrpugyhJxVBl5qgPtg942YvtJJuFiiSHLSwVCqIMivp21a3QCjC/rsqQme8rn3GShtcvAg90doF2Re/FCDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nosLtxJerR2uTHx+nM+9wf/63qG2nyCMgZxOQ7PcZGY=;
 b=PeCvPxN5LBiW25hPpF2yp6W6VH4KA5hqvWdSM+MqJhHhWz3c2nPceBbCVLp1mBYivLtDMHLoKpQWCbx8tWlFSNySCBf5dn0dlTo6IZ409r1hE8asQ4HhCLtjUxhHuvY1KQragN6hVVYBUPDR8OMzttt+Tho6i/VhU+0TVtadvqTexveBZEzVpH0FF3YkoqZDhQBl9WjsGEK4rGKQw7ewfybtSSvgtn+KnVEBwBGaCNcy467KXFHyIbi0IeE3RZKr1/iphEJpi4k9FVrP8zQYBEpOXfk1ZWFkbuojP5PfImnuyrkb1tNLx9gFMokF7w8DfQoN8QMgS2DWX45/hX7DKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by CH3PR11MB7868.namprd11.prod.outlook.com (2603:10b6:610:12e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.27; Fri, 14 Jul
 2023 12:20:05 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::347c:9286:96c4:cf61]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::347c:9286:96c4:cf61%7]) with mapi id 15.20.6588.027; Fri, 14 Jul 2023
 12:20:05 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [PATCH v5 4/5] xe/drm/pm: Toggle d3cold_allowed using vram_usages
Thread-Index: AQHZtZbuW6Z4mL2b4k22hjnOwdXv5K+5Jy8AgAAIdyA=
Date: Fri, 14 Jul 2023 12:20:05 +0000
Message-ID: <CY5PR11MB6211574124CDE9F8B8C02AB79534A@CY5PR11MB6211.namprd11.prod.outlook.com>
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
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|CH3PR11MB7868:EE_
x-ms-office365-filtering-correlation-id: 07f15396-d408-4850-77c9-08db8464a7e3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FvGzEJOHITEWCneLaIaN2N07avHjOZJILggePFer1RGVgLP3qwT3HSwtzjFQ1h4RxgFkYbOODyS/5BphgA3KBYl+1wbn2dc0kt0ST0iX5lVJHgwgCC5saPtpnWhRhdR1jLEgYcfF+LfKWxEE5Hde+FWyI7ZnvLxSmZ0tD2xwsqXp1IISe6cW4wBfksmUHZjL7C4cHajfCavJTEqPoNbvGc8DAuzro/4ZS/tYurVQ1Rd9qdwgPtkoe2xWb+4dfSDyGxtw1+4hLrLICWNtjlvtdlH+zCbYVKjRX5oEWZ2zd3ZbdXBizzIHAZFPu2i61YLRHVPZ9EwQ5YYUooGtirUYSx5E9r7gyRWHhPfsqF59em+kpZf55iXqzEoaIgogegLoAssJ++lz1jyO2YYQpgi5d6lEldl97tajF1W5ERQb3M6cY6Kd0ioHLuyUy4nK7AsMy3lCQtREsNAoV4NsW13Mi1o1wkB9mhlslfZpy6pBbo6LoylZVglU7cbrmAX3qOlv2huq755c7qiPkPIVZEdInb5N5I2rJO78D3+g8qPGNZcyMPEmZfwQ9EQCax5sr+uU63rU4iIs9KSwaelxJk610uJ4fES2aMfhwWDFO8eTrR/wwEUy0T4oyil20Gg28/8V
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(346002)(376002)(396003)(366004)(136003)(451199021)(7696005)(71200400001)(33656002)(83380400001)(186003)(122000001)(38100700002)(38070700005)(86362001)(82960400001)(53546011)(26005)(9686003)(6506007)(55016003)(107886003)(66946007)(66446008)(64756008)(66476007)(76116006)(66556008)(4326008)(54906003)(110136005)(41300700001)(52536014)(5660300002)(8936002)(316002)(8676002)(2906002)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?akhucVFyZEFQSjgwNG1XeEJzd3lqY2l2QVlERkU3bkxRU01lK1RzY0JmbjJU?=
 =?utf-8?B?TTBDVDRmbTdPYXhVcGpaZ0t1VTZ4NkZQUG1ieEdnN2dRVzcyZTR1ZEx5QUFO?=
 =?utf-8?B?eDJpM3FKc1F3MWgwUG1ySHJiOFJlMnMzdk96TXNoQllNZ0k3eEFJRnVRNmg3?=
 =?utf-8?B?L1lVTFFnYkh0ejhaR0l1QXVldzU0V2xVS2J1RGdpeHJWa1FKL2ZaWHM1Szdy?=
 =?utf-8?B?M0dXYTVBcERUR0hwL0NQRmE3ZGlGcDB1TXJEajZsNmhlTmp2TzNXb0RETUdZ?=
 =?utf-8?B?TW5iVW13bDNnR0ZML0VIZUdPMFRxbzZnZVZNdWJGYkMvZ3NVR0crRjh1RTJQ?=
 =?utf-8?B?eGNqMUlXRUE1Wk1sckl3aFV6ek15VkJWSElsYjhDaWo0amdrYmQwVFA4NzBH?=
 =?utf-8?B?ZGdNWmRubGJDUVIxRTlFT2crYkJNNGhXeHR5Q2pLTGhMNVFxOE1nazljVDZB?=
 =?utf-8?B?Ylg1R0VINWRKMVJ3NlFhSWVxeVBNRFRwSlhBTUQrYllsRmxSOC91UnZoZVNq?=
 =?utf-8?B?cnNVNXdVTXJEU1ZZcFExdG9lbVhvbW1oU0Y2eXhXZ1ZvT21QUmpldXJhMGFp?=
 =?utf-8?B?NStXZzV6SGZpMEYwenRzdUVvT2RGTy81dGdUdnBicGJZRW1mMmk3TE1VeERQ?=
 =?utf-8?B?Q1lhekt2bnRaZFlPSkVCNkx3TzRTOHFDczJBV2FZL1dENGFoaTllaHdYU1hM?=
 =?utf-8?B?RS90NjVQOHdvYkMrbzZuSmNSWVZLdHVidk45SFEwdXpOdVptc3NtSVRuYWV0?=
 =?utf-8?B?RWI2OWpPRk11UnJjMk5vSWU5akNuZ2Y0cEFacmJMdmtaVnpUTkJnWTNzOUpC?=
 =?utf-8?B?U1lmVHNxL2ErTXNCbGtIdWFIVUFOUStBcDFFMWR2RkhMSGlRMDFPWmlSWFBU?=
 =?utf-8?B?cDh3UTc2TFAvdCtuUnM3ME5iQkhOSlkvWkNPZWdhWEpEd2xrWmlkaFRBSTAv?=
 =?utf-8?B?bHVXS1ovQ0hnV0pldTBXdzZrblBISm9laFQ3M0VMaGRUV1dOQ0gyL2FMVXpY?=
 =?utf-8?B?T2RaUzlibEYrQ2dlS0VJYnVnZnMxUmE2K0k0WlNIdDMwWWpOU05vWnVRVWVO?=
 =?utf-8?B?ampPdld4b1VPaG1VajZRM2tOUGJjN2NjNFROWFZnMXVLTi90bFdPVlFORFpx?=
 =?utf-8?B?SDE2V0s2MmZHL1FkZWc0N3pWaGVRNmMycGZzZVYzTkZST2M5a3RsVTV4ajBk?=
 =?utf-8?B?QkllYjI1Q1gzWHJ4Zlg2UUh4enNic2J6TXB4L1UwNERVYlpKeWpnQWo4RkQ0?=
 =?utf-8?B?c0UxWnZVWU90TkMyV2lmOWtrN2tSa1JYb0FVYXkvWDlXMUtUay8rNHJONVc3?=
 =?utf-8?B?bm1Zcm1Rb2JHZFVUNlJ6WGcwSUZ5bEV1ajRIb1I4UzdvL3NaV042RGtHNm40?=
 =?utf-8?B?Qk5wTlRmRnhnbjBYYUNWUi9Ic0s2akdtQXBMNmVEeVN1b0ZlOWJGRTJLZmxL?=
 =?utf-8?B?bVNaMXdEL2ZnR2NPWjZqWVpGY3VWYlZQS2xqMXkzQ2xKdEh3UGtaeDFuVE94?=
 =?utf-8?B?TXFwS1NHaEUxTU1pNUV0TXBCeEVqTFhYdWE5UE1CMHgzM01xckZmVWVSTkQw?=
 =?utf-8?B?RlRqU2prdjg2dDMrUHRsb3VIWGpFeUY4M2N0OENDeTZFNi9QYUQzbWVuQ1NB?=
 =?utf-8?B?YkRrL3I2N2dkNmRrM3V1RHZnNzVDeHBsL053TlRCVTN6dEpMMTNwNE9BY0I1?=
 =?utf-8?B?N2Y3bG9XckNKaC9jWjF4OTY1QjdBQjV3RUxPUUppRTBuN0tnbWdXem9HTE9s?=
 =?utf-8?B?RWZOWTBkNm9uVzZNYncvTkRnRVpOZVIwd1phUTBTZUJ2VmhBUUhya2JjVDhQ?=
 =?utf-8?B?WGsreGJwbDEyWXVwNVJFRE1CeWxUMG1pZGplRDJacEw0T2xGMnR4dUFiK3VQ?=
 =?utf-8?B?UU5wdU02OUxuaDRTQnZBNHk3MVd4ZHlKZlpqOElpQUN1bi84VmlTeEtmN2NH?=
 =?utf-8?B?bmtXaHFLWkdiR2VlYWV6YWhodGFkNzZIUjRPS2hOYUVIYTZicVEyZE9TaEFE?=
 =?utf-8?B?MU9BVnVFRnRTb1J6STRRYWhPN3YyZ01JazRnRnVYQ1BtNDdoRzBsSnJwd2p3?=
 =?utf-8?B?TEpubEJyT2JOQi9KNGU2YlB1YjhGaVVhb3hXM0QxRXVpK2QxOTVST3cwWjdT?=
 =?utf-8?Q?XAKn4rSD6PDVregTbwO+J6xDr?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07f15396-d408-4850-77c9-08db8464a7e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2023 12:20:05.1039 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I09pS+VpTZeA9ndnDg2f6D1+SG8T3mEVhUQylxa4oeMU+STyBVbjEM+BnvgYg9hkJT+v1iyUu4IUUuvYl+K8S7BhqN3+XDsU9ji6J/z06YY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7868
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
ZDNob3Q/DQpQYXRjaCA1IHJlbW92ZXMgdGhpcyBjb21tZW50LCBzbyBubyBjaGFuZ2UgcmVxdWly
ZWQgZm9yIHRoaXMuDQpSZWdhcmRzLA0KQW5zaHVtYW4uDQo+IFJlZ2FyZHMsDQo+IEJhZGFsDQo+
ID4gICAJCSAqLw0KPiA+ICAgCQl4ZS0+ZDNjb2xkLmFsbG93ZWQgPSBmYWxzZTsNCj4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BtLmMgYi9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfcG0uYw0KPiA+IGluZGV4IDA3ZTIwNDk5MGFhOS4uYzczMjMxN2I1NWNiIDEwMDY0NA0KPiA+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wbS5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX3BtLmMNCj4gPiBAQCAtMjkyLDMgKzI5MiwyOCBAQCBpbnQgeGVfcG1fc2V0X3Zy
YW1fdGhyZXNob2xkKHN0cnVjdCB4ZV9kZXZpY2UNCj4gPiAqeGUsIHUzMiB0aHJlc2hvbGQpDQo+
ID4NCj4gPiAgIAlyZXR1cm4gMDsNCj4gPiAgIH0NCj4gPiArDQo+ID4gK3ZvaWQgeGVfcG1fZDNj
b2xkX2FsbG93ZWRfdG9nZ2xlKHN0cnVjdCB4ZV9kZXZpY2UgKnhlKSB7DQo+ID4gKwlzdHJ1Y3Qg
dHRtX3Jlc291cmNlX21hbmFnZXIgKm1hbjsNCj4gPiArCXUzMiB0b3RhbF92cmFtX3VzZWRfbWIg
PSAwOw0KPiA+ICsJdTY0IHZyYW1fdXNlZDsNCj4gPiArCWludCBpOw0KPiA+ICsNCj4gPiArCWZv
ciAoaSA9IFhFX1BMX1ZSQU0wOyBpIDw9IFhFX1BMX1ZSQU0xOyArK2kpIHsNCj4gPiArCQltYW4g
PSB0dG1fbWFuYWdlcl90eXBlKCZ4ZS0+dHRtLCBpKTsNCj4gPiArCQlpZiAobWFuKSB7DQo+ID4g
KwkJCXZyYW1fdXNlZCA9IHR0bV9yZXNvdXJjZV9tYW5hZ2VyX3VzYWdlKG1hbik7DQo+ID4gKwkJ
CXRvdGFsX3ZyYW1fdXNlZF9tYiArPQ0KPiBESVZfUk9VTkRfVVBfVUxMKHZyYW1fdXNlZCwgMTAy
NCAqIDEwMjQpOw0KPiA+ICsJCX0NCj4gPiArCX0NCj4gPiArDQo+ID4gKwltdXRleF9sb2NrKCZ4
ZS0+ZDNjb2xkLmxvY2spOw0KPiA+ICsNCj4gPiArCWlmICh0b3RhbF92cmFtX3VzZWRfbWIgPCB4
ZS0+ZDNjb2xkLnZyYW1fdGhyZXNob2xkKQ0KPiA+ICsJCXhlLT5kM2NvbGQuYWxsb3dlZCA9IHRy
dWU7DQo+ID4gKwllbHNlDQo+ID4gKwkJeGUtPmQzY29sZC5hbGxvd2VkID0gZmFsc2U7DQo+ID4g
Kw0KPiA+ICsJbXV0ZXhfdW5sb2NrKCZ4ZS0+ZDNjb2xkLmxvY2spOw0KPiA+ICt9DQo+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wbS5oIGIvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX3BtLmgNCj4gPiBpbmRleCBiYmQ5MWE1ODU1Y2QuLmVlMzBjZjAyNWY2NCAxMDA2NDQNCj4g
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfcG0uaA0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV9wbS5oDQo+ID4gQEAgLTI1LDUgKzI1LDYgQEAgYm9vbCB4ZV9wbV9ydW50aW1l
X3Jlc3VtZV9pZl9zdXNwZW5kZWQoc3RydWN0DQo+IHhlX2RldmljZSAqeGUpOw0KPiA+ICAgaW50
IHhlX3BtX3J1bnRpbWVfZ2V0X2lmX2FjdGl2ZShzdHJ1Y3QgeGVfZGV2aWNlICp4ZSk7DQo+ID4g
ICB2b2lkIHhlX3BtX2Fzc2VydF91bmJvdW5kZWRfYnJpZGdlKHN0cnVjdCB4ZV9kZXZpY2UgKnhl
KTsNCj4gPiAgIGludCB4ZV9wbV9zZXRfdnJhbV90aHJlc2hvbGQoc3RydWN0IHhlX2RldmljZSAq
eGUsIHUzMiB0aHJlc2hvbGQpOw0KPiA+ICt2b2lkIHhlX3BtX2QzY29sZF9hbGxvd2VkX3RvZ2ds
ZShzdHJ1Y3QgeGVfZGV2aWNlICp4ZSk7DQo+ID4NCj4gPiAgICNlbmRpZg0K
