Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8E04C61DA4
	for <intel-xe@archiver.kernel.org>; Thu,  2 Feb 2023 14:02:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C87010E0D5;
	Thu,  2 Feb 2023 14:02:33 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C83F410E0D5
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Feb 2023 14:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675346551; x=1706882551;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=s+cr/DVxZadUQ4SUQsqaT4IuEqqSGeh1QKhCWTExleg=;
 b=Nn39LzLojz1r1z68QKofBLNpgSB94cuwAUyYYlvoA7c/uOsjxMjNHUMw
 towoi21WAOVDjXQwn8KMQ8FI/4VTUl4DwG30R+viPYRlswyPhPtdVm4gN
 ugPLfp/NLNwlEylhBysm8MChvAe9nsYfKs5y/+YCWrY33RMnxI57ZbECb
 hf1Fk4h2pb1ZC0Fd6XGBha3p5XyMmp5/swmgJ0dVxkb2yc6UgcBOoACDC
 ei+wHkARVmLS/GTIKenkGIoN8DTPDwUud6sbAJ1JoUdNyNIS3rYnx2PWj
 +ksPYLM0Tne4GBEM+Ob9MpjAuKSNuKfhvydODYhlMuDzRZLdMRp2d3+b4 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="355791005"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; d="scan'208";a="355791005"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2023 06:02:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="733948491"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; d="scan'208";a="733948491"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga004.fm.intel.com with ESMTP; 02 Feb 2023 06:02:31 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 2 Feb 2023 06:02:30 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 2 Feb 2023 06:02:30 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 2 Feb 2023 06:02:30 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 2 Feb 2023 06:02:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RrtHaFtyNmvn6wchtL3kK1dYe1DehfFW7zqpFU0IOLfwsT3U+4hhkMB/ut/oEZQ/R3yP5In5jRYD2mUjJCh6ohFXfEdUSP2OYxwhndNi60+L4AyvW41lpweFsh9wc5DgU0E8xsO06VObCWtLrSNJQEYkIkzJlGgwiF7ImsGWU3iOYmwc9uXrxp8roOtF50RWdFUU5D8cXmKUtIuZTAEVUzP4Ppy9qO48AC19N3t/fad6L3raB7YwbEbHxkBdEazAXkhLnJQwaaZYZedn/2VxyyWeEbbwpZQycq5WMTj2MtuAIOuR5lJUcU1O5QAaTNjGdc5xGYRTzRDQXPHOeYbwGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s+cr/DVxZadUQ4SUQsqaT4IuEqqSGeh1QKhCWTExleg=;
 b=npkXXsigpyuX7PTilTjRqmBCz24bW0SkCps9bThjFcsvipnoR+KKAAWnUSYSeS+DY3Wj+QAzcnwuzV4H71yb83/BQlInxvy3tmU4cVuOY3H/48JJjKKJS48IftIadI1wNKIBmYYZ/Aq6Lc9/w5C7APzA3FeqWBB9d4XhZ/RNlRQVNGiQ3HouNi+5p6qre3ubXoFlkCm2+MRCdm/ylbbURvzJMmdVfklcZvqj8KX14AuOF4Q/DW9qkRZ6ICLM8gSgRoUtmyir/2Vdct2yy3HIDXhWRddh1wwFQxD4Zn3OqsPLhf+fgONjMIK+3QUyvzMk/MjFKw2C966aHaedgwg3RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY4PR11MB2054.namprd11.prod.outlook.com (2603:10b6:903:2d::9)
 by SJ0PR11MB4991.namprd11.prod.outlook.com (2603:10b6:a03:2df::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.25; Thu, 2 Feb
 2023 14:02:28 +0000
Received: from CY4PR11MB2054.namprd11.prod.outlook.com
 ([fe80::6d82:7102:498:a528]) by CY4PR11MB2054.namprd11.prod.outlook.com
 ([fe80::6d82:7102:498:a528%11]) with mapi id 15.20.6064.024; Thu, 2 Feb 2023
 14:02:28 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Thread-Topic: [Intel-xe] [PATCH v2] drm/xe: Add fake workaround to maintain
 backward compatible in MI_BATCH_BUFFER_START
Thread-Index: AQHZNMZgoxtTsMO+yE6am6PfoCoCAK63M2aAgAANnACAABdTgIAABH6AgAM/sQCAARfjgA==
Date: Thu, 2 Feb 2023 14:02:28 +0000
Message-ID: <2814ffcf60f6be04d450517f16795a86db3c3fa4.camel@intel.com>
References: <20230130161723.42602-1-jose.souza@intel.com>
 <Y9f7O86ki5W4Qv1C@mdroper-desk1.amr.corp.intel.com>
 <7c9f39e8eb4ad81926af9b91f45509a5a5a9d347.camel@intel.com>
 <20230130192751.ozgru3btj67iojfa@ldmartin-desk2>
 <12ca0b771f2845509e00a36e6514d456ea39073a.camel@intel.com>
 <Y9rXqCOP+8Y2MC4J@intel.com>
In-Reply-To: <Y9rXqCOP+8Y2MC4J@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY4PR11MB2054:EE_|SJ0PR11MB4991:EE_
x-ms-office365-filtering-correlation-id: 05d8705d-872f-4333-3945-08db05261e93
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0d+oAI53wlXB8T4LHOmN1rj6IKVZzgMi9OHSKCkbdpfWEddsRay4f/B+wMeqlbm1WQxNxkv+wbIdXkWbu/0YDV+LUdHHRcaf3id25mJzN7Hjfn6wsgYrBSna0uFfg5hYiwlW00o6RRjq9BjnMobyzzYuOyEM4XP7igHL5VWBjFSymI3sS6Q4Tjqz623XzQDQDTKuoU3OSM/r8IPRnawprVw+y+qHGjWbfIFGrQrGxQHVrASwASVHSSx+0is5+DVn0K8cPwUXLJHmojEILC7DnujeNTNGLNNn8oUyFBtQvmSgaRiz6Mnir+M0W+auaWTRlkO0QJqqrgNWKnAi1my0CHmSmd7240XAEQjiCTJcaTbCwVBB4jgvUGrkyjLhTcI8xcoaoUBBW95voNHWLef9nw+xpMbDBgC6G+6hEAcm2buTgmI48CQYgr93fWvz+FtPyYylPXyeSXwwDWZ+anQXhmjebRTtYSg8BMKhvX112V4A4gJSkL+aKzRMpohKVqxQdcf2urih2xdZ2ZT58PJzMV3pDayD/kB0kjGVeC9g0Ml7Hcd0kJCvuYotdPlMEvWofsCrRttVBXbxo9IlHnZao/71H/o7Z9JyRAj4BfxhV6L1VoFpUob9zSiftA/QMjW4qkNyJaVIxt1ll37ZBsGRzx92skdu4js2wTj5vWpT1K0YoEUYNp43vLkTCw9td1XycbinoWSpQgnpC5ZmfcrBzQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR11MB2054.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(396003)(366004)(376002)(346002)(136003)(451199018)(107886003)(5660300002)(38070700005)(2906002)(6862004)(8936002)(6506007)(478600001)(6486002)(2616005)(186003)(26005)(6512007)(38100700002)(41300700001)(71200400001)(82960400001)(54906003)(6636002)(86362001)(316002)(37006003)(91956017)(122000001)(36756003)(4326008)(66946007)(76116006)(83380400001)(66556008)(66446008)(66476007)(8676002)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VFMwdUp5NjY4UFdqY0VvMzRtaDIxZDRQOUs4SWFRVnFCSkFwellHOEpibnJT?=
 =?utf-8?B?OWZUM1RYTXZoYW1BcHpOWWFMMlJwNXZNbHkxNDliQlk0Y1FTOWNjK0RSemtl?=
 =?utf-8?B?eXlTWnd2d002UHp4M3hPakFEbk5PZFROR21OTGZIdWpsbEprM0txK2gzN2xQ?=
 =?utf-8?B?M0Q0eTBidzg1WXZIWWo3aStoRlBVN2ZqdktCZjJrODlvNndlRkF3Wkt5bGc2?=
 =?utf-8?B?dXNLL29pamNIZVVtR1dGalNmNUY3VU9iVVNQbW92SVhUZDB5c2pXbTk2M2U1?=
 =?utf-8?B?WkZOWG5scHFxSjNpUjNLYW42SlF6LzRhMmZNc2hSdWFEMGFLS3dhbzQ3YnV5?=
 =?utf-8?B?U2xWQncwU3luUjExSjRjSHpxc0FVU1hmaHNZVk5QeFh0dUtGcEY5WXdsYjhQ?=
 =?utf-8?B?TWRZajQvZDEzQWtVRzlRdndZeEV3NENQRnh0aXRqR292VldvUHdOdTFzWmNy?=
 =?utf-8?B?RUFES21aeC9mQSsvcDlDV3lhY09IMUthME1ZVmk5S2JZNXBjVVd0Y3MrUmtu?=
 =?utf-8?B?OHBlZEEyR3QzRlhFYkJXTVFxakRkN294TjlQYXRhbDRkNGhVSWQ5aUE2bDgw?=
 =?utf-8?B?d2VHL1VaaEJnWmJqZHV0cm9pSGZ5RGN0Nmo2c0gwUTVXRnR3d0xiOUtNNUhL?=
 =?utf-8?B?T0ZZaHlyNkFKcXYyZ3pmcTRsS21BNU5KSm14dGRiaEs4VkxpVkRMaEhmeWJF?=
 =?utf-8?B?MFRBRUd5TE9MRVUzUGg1MGNkS1JjMjR4UEtTU3gvUEdaN1NDMitZZHNncFlk?=
 =?utf-8?B?MGpVMVpmc3AwYm14Zlg3amdpNzF6NlQ1bjRXWEEwRzRqcklKWjFuendyNkVt?=
 =?utf-8?B?OURpR0xxZEhIbjA2M0tyMTdxa1lRWjdwdTZiZmoxcktDZ3RUcC82bnNVN2VW?=
 =?utf-8?B?QnRmN1FDdCtBT3dhQUtLeDdHc0hKOHRLVmlEbGZCcHpaTWJETzBYS3FTQk5m?=
 =?utf-8?B?b25uTXZlemNDMTBaMUtpYXZLYjdjMHFxTE1ES1FvZWJwbGN6WCt2RTVxWTlt?=
 =?utf-8?B?UktWREJTWjhiNzNwRWV0a3dLenpKczh0WXltQ05rclVwT09INVNKekFmRDBY?=
 =?utf-8?B?YWxxN1k5MlVZYk1NbUZwbjZyYzc5d2theXlIUVpwMmtUakFKUnRuRlBuWlNP?=
 =?utf-8?B?eitPUS84Z3J5OU1yQy8rdlhwQk4vWkRJWlowcHZDUWJEVmZHQ0FSYnZvSTFJ?=
 =?utf-8?B?eWJjWlF4QXF4SkYwZm5qZjB1K25ESno3S2ZDUzF3NjdCU2sxdXlKcVg1bEQ0?=
 =?utf-8?B?WmFrK2tRL2hPUHlMWE5sa0tBT3h5RmpaRGZGRFFHQVVkWG5obE9QTVRGcHM0?=
 =?utf-8?B?Znk2NjhHMmZBSUNibUxoNWI0WWthUVJQU1BwemUxSkFQMlRzVXViY2ZVeFFp?=
 =?utf-8?B?TnlVNklCL0x4NzEvcDhEbTVOVzJMM0hTTzFpK3NsQzF1TEpRYmRKeEUyN2pW?=
 =?utf-8?B?KzMxTWJDK0VRUEpTM3Nyc3phNFNCNTREVFZkbjZzbjJhSCtVRldtR1JKSVEy?=
 =?utf-8?B?T0hiK0h4MDMrWDBaTXZMdzBkUUxwOHpFZnYvdG9lcUQyajF6TFFQZ2kvaGFr?=
 =?utf-8?B?UWkyV2dqdkV3ZEZrcy8rRGMvTU56ZTdUUC9IYjU0Zk9SejB0MTVUL2o2V3ZI?=
 =?utf-8?B?dHBTRVhzQmJxdzlkUHlMWGpjeVRRNWczUkF6SG40bnMvUHY1VUlmTDF0RkJw?=
 =?utf-8?B?QStCbml3Z0tYcmtUZjVuenFpMUZ5Wm10eEpHaUF4QW4xK3NLK2VCbmZhekZ1?=
 =?utf-8?B?TEE4cmUwWDlSdlFZVmV1d0tuNzVNUnkzUFBMYjhGaHFoM1RpbUl4WWN0S3Nm?=
 =?utf-8?B?WWxoNE81akl4RENXY1FYdi9aWDhSLzlMdXpvVzlnQXo1VHhGSm5PWWMxbWxh?=
 =?utf-8?B?cmFlejdEQTR0T0FKMDhRQXVCMXlOS2dwVDU0M3VpOGx0MUpkVk1udmdYSVM0?=
 =?utf-8?B?Nk83eWJ3TDVNMDlmaUpOMGxlTWU2anFibFVOcUE4dTJPMHlpeHRzaXJMZHpx?=
 =?utf-8?B?SXRjVWp3OTMzZHlSVVl5aTBxRVRiZGhqa3RqNkU1d0xuTmR3bjROZ1llWEY1?=
 =?utf-8?B?aHN4ckdlSVJwRW1tN2hTMklPejBQQ2NzWlo4WUJKa3BrYkpCcWcza2ZOR2Uy?=
 =?utf-8?B?NHJsUUJjNzJFVFhaNW5zbytCNlNvb2o0bFBPRHExSXptNWR2ektrYnF1S0hr?=
 =?utf-8?B?V3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5087D8BFD031E649BCFE69ACB9AE8CCE@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB2054.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05d8705d-872f-4333-3945-08db05261e93
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2023 14:02:28.2761 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hK8X2WCP7eyI4wDAWqqgG984OVYW12Py/RKqIh6b/Z7C4rBKS3OUqI4dRAaAglOb3aMA54q93KOTSyskKvSlbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4991
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2] drm/xe: Add fake workaround to maintain
 backward compatible in MI_BATCH_BUFFER_START
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
Cc: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIzLTAyLTAxIGF0IDE2OjIwIC0wNTAwLCBSb2RyaWdvIFZpdmkgd3JvdGU6DQo+
IE9uIE1vbiwgSmFuIDMwLCAyMDIzIGF0IDA3OjQzOjU4UE0gKzAwMDAsIFNvdXphLCBKb3NlIHdy
b3RlOg0KPiA+IE9uIE1vbiwgMjAyMy0wMS0zMCBhdCAxMToyNyAtMDgwMCwgTHVjYXMgRGUgTWFy
Y2hpIHdyb3RlOg0KPiA+ID4gT24gTW9uLCBKYW4gMzAsIDIwMjMgYXQgMTA6MDQ6MjVBTSAtMDgw
MCwgSm9zZSBTb3V6YSB3cm90ZToNCj4gPiA+ID4gT24gTW9uLCAyMDIzLTAxLTMwIGF0IDA5OjE1
IC0wODAwLCBNYXR0IFJvcGVyIHdyb3RlOg0KPiA+ID4gPiA+IE9uIE1vbiwgSmFuIDMwLCAyMDIz
IGF0IDA4OjE3OjIzQU0gLTA4MDAsIEpvc8OpIFJvYmVydG8gZGUgU291emEgd3JvdGU6DQo+ID4g
PiA+ID4gPiBpOTE1IGhhcyB0aGUgc2FtZSBmYWtlIHdvcmthcm91bmQgdG8gcmV0dXJuIE1JX0JB
VENIX0JVRkZFUl9TVEFSVA0KPiA+ID4gPiA+ID4gbmVzdGVkIGJhdGNoIGJ1ZmZlciBiZWhhdmlv
ciBpbiBERzIgYW5kIG5ld2VyIHBsYXRmb3JtcyB0byB0aGUgc2FtZQ0KPiA+ID4gPiA+ID4gYmVo
YXZpb3IgYXMgb2xkZXIgcGxhdGZvcm1zLg0KPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiBTbyBo
ZXJlIGNsZWFuaW5nIHVwIFRHTF9ORVNURURfQkJfRU4gaW4gTUlfTU9ERSB0byBkaXNhYmxlIHRo
aXJkIGxldmVsDQo+ID4gPiA+ID4gPiBjaGFpbmVkIGJhdGNoIGJ1ZmZlciBsZXZlbC4NCj4gPiA+
ID4gPiANCj4gPiA+ID4gPiBJIHdhcyBraW5kIG9mIGFzc3VtaW5nIHdlJ2QganVzdCBkcm9wIHRo
aXMgc2V0dGluZyBmb3IgdGhlIFhlIGRyaXZlci4gIEkNCj4gPiA+ID4gPiBiZWxpZXZlIGhhcmR3
YXJlIHdpbGwgYmUgcmVtb3ZpbmcgdGhlIG9wdGlvbiB0byB0dXJuIG9mZiBuZXN0ZWQNCj4gPiA+
ID4gPiBiYXRjaGJ1ZmZlcnMgaW4gYW4gdXBjb21pbmcgcGxhdGZvcm0sIHNvIHVzZXJzcGFjZSBp
cyBnb2luZyB0byBoYXZlIHRvDQo+ID4gPiA+ID4gYWRhcHQgdG8gdGhlIG5ldyBiZWhhdmlvciBz
b29uIGFueXdheTsgZG9pbmcgaXQgd2hpbGUgbW92aW5nIHRvIGEgbmV3DQo+ID4gPiA+ID4gS01E
IHNlZW1zIGxpa2UgdGhlIGVhc2llc3QgdGltZSB0byBtYWtlIHRoYXQgaGFwcGVuIHNpbmNlIHRo
ZSBVTURzIGFyZQ0KPiA+ID4gPiA+IGFscmVhZHkgdXBkYXRpbmcgdGhlaXIgcHJvZ3JhbW1pbmcg
bW9kZWxzLg0KPiA+ID4gPiANCj4gPiA+ID4gVGhpcyB3b3VsZCBicmluZyBldmVuIG1vcmUgY2hh
bmdlcyB0byB0cmFjayB3aGVuIGRlYnVnZ2luZyBpc3N1ZXMgaW4gWGUgS01EIHBvcnQuDQo+ID4g
PiA+IEJldHRlciBkbyB0aGlzIGFmdGVyIFhlIEtNRCBpcyBzdGFiaWxpemVkIGFuZCB3aXRoIGJl
dHRlciBDSSBjb3ZlcmFnZSBpbiBVTURzIGFuZCBLTURzLg0KPiA+ID4gDQo+ID4gPiBidXQgaWYg
d2Ugc3RhcnQgc3VwcG9ydGluZyB0aGVzZSBwbGF0Zm9ybXMgd2l0aCBuZXN0ZWQgYmIgZGlzYWJs
ZWQsDQo+ID4gPiB3ZSBjYW4ndCBjaGFuZ2UgaXQgbGF0ZXIuIEF0IGxlYXN0IG5vdCBmb3IgdGhl
IG9sZGVyIHBsYXRmb3JtcyB0aGF0IGhhZA0KPiA+ID4gaXQgdGhhdCB3YXkuDQo+ID4gDQo+ID4g
WGUgS01EIHdpbGwgbm90IHN1cHBvcnQgYnkgZGVmYXVsdCBUR0wsIERHMi4uLiBhbnl3YXlzLg0K
PiA+IFdoeSBoYXZlIGRpZmZlcmVudCBoYXJkd2FyZSBiZWhhdmlvciBiZXR3ZWVuIEtNRHMgdGhl
bj8NCj4gDQo+IEZvciB0aGUgb2xkZXIgcGxhdGZvcm1zIHdlIHdpbGwgYWx3YXlzIGJlIGJlaGlu
ZCB0aGUgZm9yY2VfcHJvYmUuDQo+IFNvIHdlIHdpbGwgYmUgYWJsZSB0byBjaGFuZ2UgdGhlIHVh
cGkgYmVoYXZpb3IgbGF0ZXIuDQo+IA0KPiBIb3dldmVyLCBJIHRlbmQgdG8gYWdyZWUgd2l0aCBN
YXR0IGFuZCBMdWNhcyB0aGF0IGl0IHdvdWxkIGJlIGJldHRlcg0KPiBpZiB3ZSBhbGlnbiB3aXRo
IHRoZSBmdXR1cmUsIGluc3RlYWQgb2YgdHJ5aW5nIHRvIGFsaWduIHdpdGggaTkxNQ0KPiBmaXJz
dC4NCj4gDQo+IEJ1dCBJJ2QgbGlrZSB0byBoZWFyIGZyb20gSm9zZSwgaG93IG11Y2ggb2YgYSB0
cm91YmxlIHRoaXMgaXMgZm9yIHRoZQ0KPiB1c2VyIHNwYWNlPyBXaGF0IGFyZSB0aGUgYWR2YW50
YWdlcyBvZiBhbGlnbmluZyB3aXRoIGk5MTUncyBjdXJyZW50DQo+IGJlaGF2aW9yIGZpcnN0IGFu
ZCB0aGVuIG1vdmUgbGF0ZXI/DQo+IA0KPiBJZiB5b3Ugbm90aWNlZCBhbGwgb3RoZXIgdWFwaSwg
dGhlcmUncyBub3QgYSBtdWNoIG9mIGFsaWdubWVudCB3aXRoDQo+IGk5MTUgYW55d2F5LiBXaHkg
c2hvdWxkIHdlIGFsaWduIG9uIHRoaXM/DQoNCmk5MTUgeCBYZSBjaGFuZ2VzIGRvbid0IGFmZmVj
dCB0aGUgZmlsZXMgYW5kIGZ1bmN0aW9ucyB0aGF0IGZpbGwgdGhlIGJhdGNoIGJ1ZmZlcnMgaW4g
TWVzYS4NCkNoYW5naW5nIHRoZSBiZWhhdmlvciBvZiBNSV9CQVRDSF9CVUZGRVJfU1RBUlQgd291
bGQgYmUgdGhlIGZpcnN0IGNoYW5nZSB0aGF0IGFjdHVhbGx5IGdvZXMgdG8gYmF0Y2ggYnVmZmVy
cy4NCk1pbmltYWwgYmF0Y2ggYnVmZmVyIGNoYW5nZXMgbWVhbnMgbGVzcyBzdXJmYWNlIHRvIGRl
YnVnIGluIGlzc3VlcyB0aGF0IG9ubHkgaGFwcGVucyB3aXRoIFhlIEtNRC4NCg0KVGhhdCBpcyB3
aHkgSSB3b3VsZCBsaWtlIHRvIHBvc3Rwb25lIHRoaXMgYmVoYXZpb3IgY2hhbmdlIHRvIHdoZW4g
WGUgS01EIGFuZCBVTURzIHN1cHBvcnQgdG8gaXQgYXJlIG1vcmUgc3RhYmxlLg0KDQo+IA0KPiBU
aGFua3MsDQo+IFJvZHJpZ28uDQo+IA0KPiA+IA0KPiA+ID4gDQo+ID4gPiBMdWNhcyBEZSBNYXJj
aGkNCj4gPiA+IA0KPiA+ID4gPiANCj4gPiA+ID4gPiANCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBN
YXR0DQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+IHYyOg0KPiA+ID4gPiA+
ID4gLSByZXBsYWNlIElQX1ZFUlNJT05fRk9SRVZFUiBieSBYRV9SVFBfRU5EX1ZFUlNJT05fVU5E
RUZJTkVEDQo+ID4gPiA+ID4gPiAtIG1vdmUgZmFrZSB3b3JrYXJvdW5kIHRvIGxyY19hZGRpdGlv
bmFsX3Byb2dyYW1taW5nIHRhYmxlDQo+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+IEJzcGVjOiA0
NTk3NCwgNDU3MTgNCj4gPiA+ID4gPiA+IENjOiBMdWNhcyBEZSBNYXJjaGkgPGx1Y2FzLmRlbWFy
Y2hpQGludGVsLmNvbT4NCj4gPiA+ID4gPiA+IENjOiBNYXR0IFJvcGVyIDxtYXR0aGV3LmQucm9w
ZXJAaW50ZWwuY29tPg0KPiA+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogSm9zw6kgUm9iZXJ0byBk
ZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+DQo+ID4gPiA+ID4gPiAtLS0NCj4gPiA+ID4g
PiA+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3QuYyB8ICAxICsNCj4gPiA+ID4gPiA+ICBkcml2
ZXJzL2dwdS9kcm0veGUveGVfd2EuYyB8IDI4ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysN
Cj4gPiA+ID4gPiA+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfd2EuaCB8ICAxICsNCj4gPiA+ID4g
PiA+ICAzIGZpbGVzIGNoYW5nZWQsIDMwIGluc2VydGlvbnMoKykNCj4gPiA+ID4gPiA+IA0KPiA+
ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndC5jIGIvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX2d0LmMNCj4gPiA+ID4gPiA+IGluZGV4IDg0YTczZWVjY2QyOTcuLjVk
MDdlMWU3YmQ1MDYgMTAwNjQ0DQo+ID4gPiA+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfZ3QuYw0KPiA+ID4gPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0LmMNCj4g
PiA+ID4gPiA+IEBAIC0zMTEsNiArMzExLDcgQEAgaW50IHhlX2d0X3JlY29yZF9kZWZhdWx0X2xy
Y3Moc3RydWN0IHhlX2d0ICpndCkNCj4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gIAkJeGVfcmVn
X3NyX2luaXQoJmh3ZS0+cmVnX2xyYywgIkxSQyIsIHhlKTsNCj4gPiA+ID4gPiA+ICAJCXhlX3dh
X3Byb2Nlc3NfbHJjKGh3ZSk7DQo+ID4gPiA+ID4gPiArCQl4ZV93YV9wcm9jZXNzX2xyY19hZGRp
dGlvbmFsX3Byb2dyYW1taW5nKGh3ZSk7DQo+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ICAJCWRl
ZmF1bHRfbHJjID0gZHJtbV9remFsbG9jKCZ4ZS0+ZHJtLA0KPiA+ID4gPiA+ID4gIAkJCQkJICAg
eGVfbHJjX3NpemUoeGUsIGh3ZS0+Y2xhc3MpLA0KPiA+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV93YS5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3dhLmMNCj4g
PiA+ID4gPiA+IGluZGV4IDMzMjVkZTNlZGY2OTEuLjc0NGI3ZDA5ODI2ODMgMTAwNjQ0DQo+ID4g
PiA+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfd2EuYw0KPiA+ID4gPiA+ID4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3dhLmMNCj4gPiA+ID4gPiA+IEBAIC0yODgsNiArMjg4
LDIxIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgeGVfcnRwX2VudHJ5IGxyY193YXNbXSA9IHsNCj4g
PiA+ID4gPiA+ICAJe30NCj4gPiA+ID4gPiA+ICB9Ow0KPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4g
PiArc3RhdGljIGNvbnN0IHN0cnVjdCB4ZV9ydHBfZW50cnkgbHJjX2FkZGl0aW9uYWxfcHJvZ3Jh
bW1pbmdbXSA9IHsNCj4gPiA+ID4gPiA+ICsJeyBYRV9SVFBfTkFNRSgiRmFrZVdhRGlzYWJsZU5l
c3RlZEJCTW9kZSIpLA0KPiA+ID4gPiA+ID4gKwkgIC8qDQo+ID4gPiA+ID4gPiArCSAgICogVGhp
cyBpcyBhICJmYWtlIiB3b3JrYXJvdW5kIGRlZmluZWQgYnkgc29mdHdhcmUgdG8gZW5zdXJlIHdl
DQo+ID4gPiA+ID4gPiArCSAgICogbWFpbnRhaW4gcmVsaWFibGUsIGJhY2t3YXJkLWNvbXBhdGli
bGUgYmVoYXZpb3IgZm9yIHVzZXJzcGFjZSB3aXRoDQo+ID4gPiA+ID4gPiArCSAgICogcmVnYXJk
cyB0byBob3cgbmVzdGVkIE1JX0JBVENIX0JVRkZFUl9TVEFSVCBjb21tYW5kcyBhcmUgaGFuZGxl
ZC4NCj4gPiA+ID4gPiA+ICsJICAgKi8NCj4gPiA+ID4gPiA+ICsJICBYRV9SVFBfUlVMRVMoR1JB
UEhJQ1NfVkVSU0lPTl9SQU5HRSgxMjU1LCBYRV9SVFBfRU5EX1ZFUlNJT05fVU5ERUZJTkVEKSks
DQo+ID4gPiA+ID4gPiArCSAgWEVfUlRQX0NMUihSSU5HX01JX01PREUoMCksDQo+ID4gPiA+ID4g
PiArCQkgICAgIFRHTF9ORVNURURfQkJfRU4sDQo+ID4gPiA+ID4gPiArCQkgICAgIFhFX1JUUF9G
TEFHKE1BU0tFRF9SRUcsIEVOR0lORV9CQVNFKSkNCj4gPiA+ID4gPiA+ICsJfSwNCj4gPiA+ID4g
PiA+ICsJe30NCj4gPiA+ID4gPiA+ICt9Ow0KPiA+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ID4gIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgeGVfcnRwX2VudHJ5IHJlZ2lzdGVyX3doaXRlbGlzdFtdID0gew0K
PiA+ID4gPiA+ID4gIAl7IFhFX1JUUF9OQU1FKCJXYUFsbG93UE1EZXB0aEFuZEludm9jYXRpb25D
b3VudEFjY2Vzc0Zyb21VTUQsIDE0MDg1NTY4NjUiKSwNCj4gPiA+ID4gPiA+ICAJICBYRV9SVFBf
UlVMRVMoR1JBUEhJQ1NfVkVSU0lPTl9SQU5HRSgxMjAwLCAxMjEwKSwgRU5HSU5FX0NMQVNTKFJF
TkRFUikpLA0KPiA+ID4gPiA+ID4gQEAgLTM2Miw2ICszNzcsMTkgQEAgdm9pZCB4ZV93YV9wcm9j
ZXNzX2xyYyhzdHJ1Y3QgeGVfaHdfZW5naW5lICpod2UpDQo+ID4gPiA+ID4gPiAgCXhlX3J0cF9w
cm9jZXNzKGxyY193YXMsICZod2UtPnJlZ19scmMsIGh3ZS0+Z3QsIGh3ZSk7DQo+ID4gPiA+ID4g
PiAgfQ0KPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiArLyoqDQo+ID4gPiA+ID4gPiArICogeGVf
d2FfcHJvY2Vzc19scmNfYWRkaXRpb25hbF9wcm9ncmFtbWluZyAtIHByb2Nlc3MgYWRkaXRpb25h
bCBMUkMgcHJvZ3JhbW1pbmcNCj4gPiA+ID4gPiA+ICsgKiB0YWJsZQ0KPiA+ID4gPiA+ID4gKyAq
IEBod2U6IGVuZ2luZSBpbnN0YW5jZSB0byBwcm9jZXNzIHdvcmthcm91bmRzIGZvcg0KPiA+ID4g
PiA+ID4gKyAqDQo+ID4gPiA+ID4gPiArICogUHJvY2VzcyBhZGRpdGlvbmFsIGNvbnRleHQgcHJv
Z3JhbW1pbmcgdGFibGUgZm9yIHRoaXMgcGxhdGZvcm0sIHNhdmluZyBpbg0KPiA+ID4gPiA+ID4g
KyAqIEBod2UgYWxsIHRoZSByZWdpc3RlcnMgY2hhbmdlcyB0aGF0IG5lZWQgdG8gYmUgYXBwbGll
ZCBvbiBjb250ZXh0IHJlc3RvcmUuDQo+ID4gPiA+ID4gPiArICovDQo+ID4gPiA+ID4gPiArdm9p
ZCB4ZV93YV9wcm9jZXNzX2xyY19hZGRpdGlvbmFsX3Byb2dyYW1taW5nKHN0cnVjdCB4ZV9od19l
bmdpbmUgKmh3ZSkNCj4gPiA+ID4gPiA+ICt7DQo+ID4gPiA+ID4gPiArCXhlX3J0cF9wcm9jZXNz
KGxyY19hZGRpdGlvbmFsX3Byb2dyYW1taW5nLCAmaHdlLT5yZWdfbHJjLCBod2UtPmd0LCBod2Up
Ow0KPiA+ID4gPiA+ID4gK30NCj4gPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiA+ICAvKioNCj4gPiA+
ID4gPiA+ICAgKiB4ZV9yZWdfd2hpdGVsaXN0X3Byb2Nlc3NfZW5naW5lIC0gcHJvY2VzcyB0YWJs
ZSBvZiByZWdpc3RlcnMgdG8gd2hpdGVsaXN0DQo+ID4gPiA+ID4gPiAgICogQGh3ZTogZW5naW5l
IGluc3RhbmNlIHRvIHByb2Nlc3Mgd2hpdGVsaXN0IGZvcg0KPiA+ID4gPiA+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV93YS5oIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3dh
LmgNCj4gPiA+ID4gPiA+IGluZGV4IDFhMDY1OTY5MGEzMjAuLjg3MmYzZTRkZGM3M2MgMTAwNjQ0
DQo+ID4gPiA+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfd2EuaA0KPiA+ID4gPiA+
ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3dhLmgNCj4gPiA+ID4gPiA+IEBAIC0xMiw2
ICsxMiw3IEBAIHN0cnVjdCB4ZV9od19lbmdpbmU7DQo+ID4gPiA+ID4gPiAgdm9pZCB4ZV93YV9w
cm9jZXNzX2d0KHN0cnVjdCB4ZV9ndCAqZ3QpOw0KPiA+ID4gPiA+ID4gIHZvaWQgeGVfd2FfcHJv
Y2Vzc19lbmdpbmUoc3RydWN0IHhlX2h3X2VuZ2luZSAqaHdlKTsNCj4gPiA+ID4gPiA+ICB2b2lk
IHhlX3dhX3Byb2Nlc3NfbHJjKHN0cnVjdCB4ZV9od19lbmdpbmUgKmh3ZSk7DQo+ID4gPiA+ID4g
PiArdm9pZCB4ZV93YV9wcm9jZXNzX2xyY19hZGRpdGlvbmFsX3Byb2dyYW1taW5nKHN0cnVjdCB4
ZV9od19lbmdpbmUgKmh3ZSk7DQo+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ICB2b2lkIHhlX3Jl
Z193aGl0ZWxpc3RfcHJvY2Vzc19lbmdpbmUoc3RydWN0IHhlX2h3X2VuZ2luZSAqaHdlKTsNCj4g
PiA+ID4gPiA+ICB2b2lkIHhlX3JlZ193aGl0ZWxpc3RfYXBwbHkoc3RydWN0IHhlX2h3X2VuZ2lu
ZSAqaHdlKTsNCj4gPiA+ID4gPiA+IC0tDQo+ID4gPiA+ID4gPiAyLjM5LjENCj4gPiA+ID4gPiA+
IA0KPiA+ID4gPiA+IA0KPiA+ID4gPiANCj4gPiANCg0K
