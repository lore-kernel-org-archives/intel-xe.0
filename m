Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC46BC47077
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jan 2024 18:49:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6607810E0EB;
	Tue, 16 Jan 2024 18:49:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A633010E0EB
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jan 2024 18:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705430984; x=1736966984;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=aVLLCXHpQQub/F16KBGCs5u2TRSp0DQ2Pc/mL2uDhiM=;
 b=XUGqreYD5961cpKqpA1j0zMDK5vM1MygIDXs00SVY14IvPuHs7xngVXQ
 ENqc9ri5eJdJoIrDgEItiOaLakiHRilChVlUO1kh505oI5NC82mhZZX3B
 zki0xLEXoEdDjP5+OE6G4vhZlo6xQvB/IPZW+/wH+PPaHnpNlQ08Fkkam
 TcVtdmGTbkgFqTxWbzJ5ry0Qh+Tpv+5Af/BfhHW/8nP2lN5TPJeQZ9Xrz
 4NZe32dRT2sFXitA37h9DdJ2NDxMBr/2vOTvXWn9KPp/5DlwA2fI8DjQF
 mAyb8Eadm8cgXt1dAmZC6pGcOnfg3ULQuvD8hIg8P9Bf2sYlUThO0yUS5 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="6710521"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="6710521"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 10:49:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; d="scan'208";a="25894727"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Jan 2024 10:49:44 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Jan 2024 10:49:43 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Jan 2024 10:49:43 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 16 Jan 2024 10:49:43 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 16 Jan 2024 10:49:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hjfVuDKb+PI9xovqc0mt+Fqf/7JmWh1bywnOsGO0rKIvOc8WKoS70y8CtP9kS4fvvLmoINI7oUc3+DXdQaIJe+adbLzkXdGy05OU5rGDDRecHduz2lMO3qEmTZTVGCOZCaSA8IPQJFhRwhVBE7txs5emQFB1Mn+JMUueHBjg1CYEb8HZWJXTPN7AaqxxJ/9WIOJEGpg4mZw76M4kMcxdi26NE2qszbWELw86moyPav5pyLFjZ3eFHjpMiQlIOx3UYYwydP4ugF80iXlKquRgQhweCaRSD3LEAItCpOcPnHsyGXo42E1FknAV/RshpaRgoWzSFoiyuC+9cEKJmUzC+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aVLLCXHpQQub/F16KBGCs5u2TRSp0DQ2Pc/mL2uDhiM=;
 b=DpxbBaMo7aJaGcUWiKju+VvYg++XlrgSxpcXzNEnP9Dx0WXPesUEuwk+Ir37/tCYG+BqXSuzTml9wGS9n995qNDAFvgw34jHemzvEqtzoDE3osQWt/6ikKO8/slnIAAR0qqvkGn662JnOB8/FwK6ET7Z8GvA/5lec5F/c8d/E+MupHDaDBpHOZ/uNSxvdH/q/jPtW8fPMXDmVIrbvSnYIFAq0k/t3+YGCJx6MsCmCdjhN0H9uXkOPtHmZP8NxTgClsqXTSV+S1vqZD1rb7XPeEMTsDkQiF5jrb1DFhW0JeIxr+Q0dZQgvUMlhrVARPFns4KCovlaYGFm51qiMZTb6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5782.namprd11.prod.outlook.com (2603:10b6:510:147::11)
 by SJ2PR11MB7456.namprd11.prod.outlook.com (2603:10b6:a03:4cd::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.23; Tue, 16 Jan
 2024 18:49:36 +0000
Received: from PH0PR11MB5782.namprd11.prod.outlook.com
 ([fe80::1961:a216:c5a5:76cd]) by PH0PR11MB5782.namprd11.prod.outlook.com
 ([fe80::1961:a216:c5a5:76cd%3]) with mapi id 15.20.7181.020; Tue, 16 Jan 2024
 18:49:36 +0000
From: "Mishra, Pallavi" <pallavi.mishra@intel.com>
To: "Welty, Brian" <brian.welty@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v2 3/3] drm/xe: Add CLOS specific initializations
Thread-Topic: [PATCH v2 3/3] drm/xe: Add CLOS specific initializations
Thread-Index: AQHaQ1astAyCxfpaTEaID/jgLAL9obDWmVkAgAY3vIA=
Date: Tue, 16 Jan 2024 18:49:36 +0000
Message-ID: <PH0PR11MB5782ADC580A1A9236A7BA29682732@PH0PR11MB5782.namprd11.prod.outlook.com>
References: <20240109235758.1432987-1-pallavi.mishra@intel.com>
 <20240109235758.1432987-4-pallavi.mishra@intel.com>
 <ac008966-e03c-49f5-9948-336c7bf6095f@intel.com>
In-Reply-To: <ac008966-e03c-49f5-9948-336c7bf6095f@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5782:EE_|SJ2PR11MB7456:EE_
x-ms-office365-filtering-correlation-id: 62c6909c-3401-41b7-98bc-08dc16c3e325
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GW1e1MKYFnGVupNPPBaNmEt8DBaFUOhr1ehYxnBxeiuhuvxnd/W3ghUURTDuyrzNWmXEUhFfDqACA+CTqXkOLp3t31e3Jms0TtE9p+alt7uAAfv844SVaXUB80nJ4t/jc83WiJZYmHASZMwaivaBYoMXgwvNRiIsGsG5Ivv3umhjP9EZty/t8TKuCuIIAdG9fRNd+VHD9ZvrvkCKrfIK72TFl3mthgsAloJrhzuxfefbIu6aI9U0HiIDTdvqXNEhZdPY9cj7qlA/P1jJoIPQfflhGKEr+B7mMeIeN71F5/DToSiszeqQPcMpoHgPOEd33vMMBEwrbrws5PWWBVE+0sdh1HjvRpNz4Pn6tqV/pp6d+IUK0RHaH2nxQbK8j5UWLAhCwTt3pmZfoMGX1vIRhyoj0ZlnpRWkglkNJ9O7LeRWQn+tVqy3ckDZFJ+1xzIfnS94/yQV/mnnyduMg9eAJDcqkQ2BLSaIMwb+RY6aj1tZfUud8Pi85kKHodTcSxLpOaoIJqyHbKgiowYAxvS5hEX+ceWIGkexH4pqRLyWwSGM5ujuUVUazO6txw3nmSxv1XX+mfT9TGxshrg1AVc3wggCzndhY9n13xqVHZbBVjmgu3nwq3mezHiJO7erhjEa
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5782.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(396003)(39860400002)(376002)(366004)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(122000001)(38100700002)(33656002)(38070700009)(86362001)(41300700001)(82960400001)(8676002)(4326008)(8936002)(52536014)(71200400001)(26005)(55016003)(316002)(76116006)(66446008)(110136005)(66946007)(66556008)(64756008)(54906003)(478600001)(6506007)(53546011)(9686003)(7696005)(66476007)(83380400001)(5660300002)(2906002)(107886003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a3VMQ1NQUXpDTVVrNWFOU1l2NzloOG9KV3dZakhNV05xQ3ZWRVdIeWdKVVRp?=
 =?utf-8?B?aUlXRThqRG55RTZxZUZyeHlQNXg4N3pmak1oZnRUb081dzZCemJKNzNYWmlG?=
 =?utf-8?B?WlJ0NkpKNTdpdFFZMHd1Ri9hQUFQVVQvQWhhVkwvYXI2dUMzNWp4VzlObC9L?=
 =?utf-8?B?RXBaWmg1bUNvcmt1YmUwMTEwcFpuL2JodDdHaHJmZmcrNkdhTDlZNXdBVjdh?=
 =?utf-8?B?SkFVdmJnUnpVc29hcjYvNzdzeUhtWFlXSERhZDdnSjJ2ZUhNTGp3dCtZMXRL?=
 =?utf-8?B?NW5FS2hHejJCcmNwMGQvN2JjaGIvWFl5ZURpdmZTaSt4Ym9qNEx1aWpucnAr?=
 =?utf-8?B?a3VMZnhUeGMwNERBb09KSVAwdHd2OWJBelFGdm5rUW91bDR4M3lDcGpLQSsy?=
 =?utf-8?B?Y2JWb2x0eDVNdjQ4aHk1eUJOanF6V1dwUGMreVdqelVHR2hleVVFOGRuS3dI?=
 =?utf-8?B?R0RhUldNelZCOVFPTk5MbW95aUZnSTBOQm0wR00wVHpvakZVdlV3WC9jS1c0?=
 =?utf-8?B?Wk1YdU1wQXRJZmluZm5MakROTXJreGpMYThHY2szd1AydFRMaFZVbmFGa0dT?=
 =?utf-8?B?a1VSUXRIME1YeGZLZnZoTFRvaVlNY1MxSEdCUzgzZHRnem5TTE1CaUJ1NWxl?=
 =?utf-8?B?d2pudm5XdkR3YXlCUXhCMWVObm5PbXUveS9VYjd2ZzdNaHozeVZyTEoyOGdp?=
 =?utf-8?B?YnR2VGVZMEVUUDNMUTR5NWxyYTRhaUxhbGJHNnJ3cEtLRTZ1cUh5OXFTRExz?=
 =?utf-8?B?N3lKbGZTNmpRVW1Pd3hpT3MyQkNUWEVkZ25vekZrMVJlS1F2SWUxaU5mWktp?=
 =?utf-8?B?MkR2Y0VPSlFESzdKdFFVY3lKNjJhbExFUXRDWVZVVWQ3OTVCbElxSEJOdnhy?=
 =?utf-8?B?eTVOakwrV1NDK0ttbk12ZnhqZGJ2WHpFS3dRVU84QW5OUmpPbXVORU9YQWw1?=
 =?utf-8?B?K3VIbHQ5cGNmbk5TL1ZCbmJTd2xuUkZqTTFDbVlpTThnL0hkTjdTTHNrMGRo?=
 =?utf-8?B?Yy9DV1o4ZFozK3pnSW9NNFFSaHUzbndEeDJFcXlxek9iREtxaEFJM3FuUnlB?=
 =?utf-8?B?L0lncmFmS3JoL21kWFlTMFowdGo4MEdvZmQyTmpLTFZkcy9wZndXeURoSjc5?=
 =?utf-8?B?YXEyTmNaSCtXVEdPQUdSVjlCckpaR0c1UkhTbEtGRlhLWUtZUEx3S1pFUHBN?=
 =?utf-8?B?SzlDNXZIMDE0YmtkeWdxYmpnRi9FQ0NndmVSbW52NnU0QTFiRFFVK0RGSVE4?=
 =?utf-8?B?RHE3akpVVjVNdXAydW4rcVVzdzBwMmJaRFAyZ2lsU1pNU3ppQ0o5UGkrQ1VX?=
 =?utf-8?B?OXBVR2Y0Wm0vU013WVRZdFRQTVlHT1Q1dlAxU3ptYXJlSTFHSE9aaE5rV1NC?=
 =?utf-8?B?VWYvYk1xUkwrd08walhaRkZPVzVVbWVCODV6dXA0NzczcU1laHdUaE9QZW9n?=
 =?utf-8?B?UXpYa2FSRGFpTERTdHpqZU9BUTA1cURXeFpCblFpUk9nSStsQld1U21xYVRB?=
 =?utf-8?B?N0NEaGRFNk53dWNpT2pDTEc0MjMzc0tVVmFjU20yODNUMk9NZjhxZlRjc2RX?=
 =?utf-8?B?cDNZSGo3QUFZWTNLdldUMEo0a2dYMTUwRlhaVG9KOGZTbEtqTW5CeEJlNmRj?=
 =?utf-8?B?dUdFWUJjczhjM2J2czVFbk9RVW55VDlsekRvZWVSZmE2Q0JaMW9UQk1mdFZy?=
 =?utf-8?B?QVlxd1FmTXVLUytQR2g2eTBXbkczanJXa3FJZEFPK00xREdEbnhjWTcwbkZn?=
 =?utf-8?B?ZGFNekRJMVNtNzM4eUU2d2tOcFlTV1hpMlF4Vk1pa3lRdU1sK2o3Tk1Ubm1v?=
 =?utf-8?B?eW9FaUtGbE8zaFo2Q0EzZG15V21KSkNoTnQ0MkZ1Vzl5aFNFTXpZQktEUXdm?=
 =?utf-8?B?eUpvUFppdytZc1hERDZXR2Ywa2pXamx4L0pmbnVva3h0U2x4UzA2UXJ3ZjV0?=
 =?utf-8?B?MFNndDFob2ZUdmJ1bDFEN1V3T2pjSTY1eTdxVVNQaFhDS0c2elllc2w2d1Fy?=
 =?utf-8?B?SEkrSS9uUWk5dlE2WXp0NkxRSlRCa2pEcFVZanhRNDZ5d3NuSlpESHdUdUd5?=
 =?utf-8?B?cmc0ZWV3SVRpb2NrOVVBYzdxN2FGUVZMYkFVNjhldUg2RWJLc3pKQ3VwYTYw?=
 =?utf-8?Q?EwfnAGgs8iAKfONvPrUy7X4L8?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5782.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62c6909c-3401-41b7-98bc-08dc16c3e325
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2024 18:49:36.4815 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MLK+uywEGrkuCTQa5hOsIZf+X1yxb6cHleSjHHgFYAbAccs2iqPjNEJJidLZTT+AVTWye6FvhcU8Y6e6jTlhe6VbycGXbNqGXbIG0TYnPNA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7456
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogV2VsdHksIEJyaWFuIDxi
cmlhbi53ZWx0eUBpbnRlbC5jb20+DQo+IFNlbnQ6IEZyaWRheSwgSmFudWFyeSAxMiwgMjAyNCAx
MTo0NiBBTQ0KPiBUbzogTWlzaHJhLCBQYWxsYXZpIDxwYWxsYXZpLm1pc2hyYUBpbnRlbC5jb20+
OyBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IE5ha2xpY2tpLCBNYXRldXN6
IDxtYXRldXN6Lm5ha2xpY2tpQGludGVsLmNvbT47IFZpc2h3YW5hdGhhcHVyYSwNCj4gTmlyYW5q
YW5hIDxuaXJhbmphbmEudmlzaHdhbmF0aGFwdXJhQGludGVsLmNvbT4NCj4gU3ViamVjdDogUmU6
IFtQQVRDSCB2MiAzLzNdIGRybS94ZTogQWRkIENMT1Mgc3BlY2lmaWMgaW5pdGlhbGl6YXRpb25z
DQo+IA0KPiANCj4gDQo+IE9uIDEvOS8yMDI0IDM6NTcgUE0sIFBhbGxhdmkgTWlzaHJhIHdyb3Rl
Og0KPiA+IEhhbmRsZSBDTE9TIHNwZWNpZmljIGluaXRpYWxpemF0aW9ucyBhbmQgUEFUIENMT1Mg
Y29tcGF0aWJpbGl0eSBjaGVjay4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFBhbGxhdmkgTWlz
aHJhIDxwYWxsYXZpLm1pc2hyYUBpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gICBkcml2ZXJzL2dw
dS9kcm0veGUveGVfZGV2aWNlLmMgfCAxNSArKysrKysrKysrKysrKw0KPiA+ICAgZHJpdmVycy9n
cHUvZHJtL3hlL3hlX3BhdC5jICAgIHwgMzYNCj4gKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKw0KPiA+ICAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BhdC5oICAgIHwgIDkgKysrKysr
KysrDQo+ID4gICBkcml2ZXJzL2dwdS9kcm0veGUveGVfdm0uYyAgICAgfCAxMiArKysrKysrKysr
KysNCj4gPiAgIDQgZmlsZXMgY2hhbmdlZCwgNzIgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2UuYw0KPiA+IGIvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX2RldmljZS5jIGluZGV4IDAwNGU2NTU0NGU4ZC4uNGUzZDRmMmMwZjliDQo+
ID4gMTAwNjQ0DQo+IFtzbmlwXQ0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfcGF0LmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcGF0LmMNCj4gPiBpbmRleCAxZmY2YmM3
OWU3ZDQuLmNjZGVmYmEwZjJmMyAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfcGF0LmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcGF0LmMNCj4gPiBAQCAt
NDUsNiArNDUsMTQgQEANCj4gPiAgICNkZWZpbmUgWEVMUF9QQVRfV0MNCj4gCVJFR19GSUVMRF9Q
UkVQKFhFTFBfTUVNX1RZUEVfTUFTSywgMSkNCj4gPiAgICNkZWZpbmUgWEVMUF9QQVRfVUMNCj4g
CVJFR19GSUVMRF9QUkVQKFhFTFBfTUVNX1RZUEVfTUFTSywgMCkNCj4gPg0KPiA+ICsjZGVmaW5l
IFhFMl9QQVRfQ0xPUzEgICAgICAgICAgICAgICAgICAgICAgICAgICgoMSA8PCAyMCl8KDEgPDwg
MjEpfCgxIDw8IDIyKXwoMSA8PA0KPiAyMykpDQo+ID4gKyNkZWZpbmUgWEUyX1BBVF9DTE9TMiAg
ICAgICAgICAgICAgICAgICAgICAgICAgKCgxIDw8IDI0KXwoMSA8PCAyNSl8KDEgPDwgMjYpfCgx
IDw8DQo+IDI3KSkNCj4gPiArI2RlZmluZSBYRTJfUEFUX0NMT1MzICAgICAgICAgICAgICAgICAg
ICAgICAgICAoKDEgPDwgMjgpfCgxIDw8IDI5KXwoMSA8PCAzMCl8KDEgPDwNCj4gMzEpKQ0KPiA+
ICsNCj4gPiArI2RlZmluZSBYRVBWQ19QQVRfQ0xPUzEgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICgoMSA8PCA0KXwoMSA8PCA1KSkNCj4gPiArI2RlZmluZSBYRVBWQ19QQVRfQ0xPUzIg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICgoMSA8PCA2KXwoMSA8PCA3KSkNCj4gPiAr
DQo+ID4gKw0KPiA+ICAgc3RhdGljIGNvbnN0IGNoYXIgKlhFTFBfTUVNX1RZUEVfU1RSX01BUFtd
ID0geyAiVUMiLCAiV0MiLCAiV1QiLA0KPiA+ICJXQiIgfTsNCj4gPg0KPiA+ICAgc3RydWN0IHhl
X3BhdF9vcHMgew0KPiA+IEBAIC0xNDgsNiArMTU2LDM0IEBAIHUxNiB4ZV9wYXRfaW5kZXhfZ2V0
X2NvaF9tb2RlKHN0cnVjdCB4ZV9kZXZpY2UNCj4gKnhlLCB1MTYgcGF0X2luZGV4KQ0KPiA+ICAg
CXJldHVybiB4ZS0+cGF0LnRhYmxlW3BhdF9pbmRleF0uY29oX21vZGU7DQo+ID4gICB9DQo+ID4N
Cj4gPiAraW50IHhlX3BhdF9pbmRleF9jbG9zX2NoZWNrKHN0cnVjdCB4ZV9kZXZpY2UgKnhlLCB1
MTYgcGF0X2luZGV4LCB1MTYNCj4gPiArY2xvc19pbmRleCkgew0KPiA+ICsJV0FSTl9PTihwYXRf
aW5kZXggPj0geGUtPnBhdC5uX2VudHJpZXMpOw0KPiA+ICsNCj4gPiArCWludCBlcnIgPSAwOw0K
PiA+ICsNCj4gPiArCXN3aXRjaCAoY2xvc19pbmRleCkgew0KPiA+ICsJY2FzZSAxOg0KPiA+ICsJ
CWlmICghKCgoMSA8PCBwYXRfaW5kZXgpICYgWEUyX1BBVF9DTE9TMSkNCj4gPiArCQkJfHwgKDEg
PDwgcGF0X2luZGV4ICYgWEVQVkNfUEFUX0NMT1MxKSkpDQo+ID4gKwkJCWVyciA9IC1FSU5WQUw7
DQo+ID4gKwkJYnJlYWs7DQo+ID4gKwljYXNlIDI6DQo+ID4gKwkJaWYgKCEoKCgxIDw8IHBhdF9p
bmRleCkgJiBYRTJfUEFUX0NMT1MyKQ0KPiA+ICsJCQl8fCAoMSA8PCBwYXRfaW5kZXggJiBYRVBW
Q19QQVRfQ0xPUzIpKSkNCj4gPiArCQkJZXJyID0gLUVJTlZBTDsNCj4gPiArCQlicmVhazsNCj4g
PiArCWNhc2UgMzoNCj4gPiArCQlpZiAoISgoMSA8PCBwYXRfaW5kZXgpICYgWEUyX1BBVF9DTE9T
MykpDQo+ID4gKwkJCWVyciA9IC1FSU5WQUw7DQo+ID4gKwkJYnJlYWs7DQo+ID4gKwlkZWZhdWx0
Og0KPiA+ICsJCWRybV9lcnIoJnhlLT5kcm0sICJVbnN1cHBvcnRlZCBDTE9TIHZhbHVlXG4iKTsN
Cj4gPiArCQkJZXJyID0gLUVJTlZBTDsNCj4gPiArCX0NCj4gPiArCXJldHVybiBlcnI7DQo+ID4g
K30NCj4gPiArDQo+ID4gICBzdGF0aWMgdm9pZCBwcm9ncmFtX3BhdChzdHJ1Y3QgeGVfZ3QgKmd0
LCBjb25zdCBzdHJ1Y3QgeGVfcGF0X3RhYmxlX2VudHJ5DQo+IHRhYmxlW10sDQo+ID4gICAJCQlp
bnQgbl9lbnRyaWVzKQ0KPiA+ICAgew0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfcGF0LmggYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcGF0LmgNCj4gPiBpbmRleCBmYTBk
ZmJlNTI1Y2QuLmFmYWMwNmJjNDI1ZiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfcGF0LmgNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcGF0LmgNCj4gPiBA
QCAtNTgsNCArNTgsMTMgQEAgdm9pZCB4ZV9wYXRfZHVtcChzdHJ1Y3QgeGVfZ3QgKmd0LCBzdHJ1
Y3QNCj4gZHJtX3ByaW50ZXIgKnApOw0KPiA+ICAgICovDQo+ID4gICB1MTYgeGVfcGF0X2luZGV4
X2dldF9jb2hfbW9kZShzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwgdTE2IHBhdF9pbmRleCk7DQo+ID4N
Cj4gPiArLyoqDQo+ID4gKyAqIHhlX3BhdF9pbmRleF9jbG9zX2NoZWNrIC0gY2hlY2sgd2hldGhl
ciBjbG9zIGhhcyBiZWVuIHJlc2VydmVkIGZvcg0KPiA+ICsgKiBjaG9zZW4gcGF0X2luZGV4Lg0K
PiA+ICsgKiBAeGU6IHhlIGRldmljZQ0KPiA+ICsgKiBAcGF0X2luZGV4OiBUaGUgcGF0X2luZGV4
IHRvIHF1ZXJ5DQo+ID4gKyAqIEBjbG9zX2luZGV4OiBjbG9zIGluZGV4IHRvIGNvbXBhcmUgICov
IGludA0KPiA+ICt4ZV9wYXRfaW5kZXhfY2xvc19jaGVjayhzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwg
dTE2IHBhdF9pbmRleCwgdTE2DQo+ID4gK2Nsb3NfaW5kZXgpOw0KPiA+ICsNCj4gPiAgICNlbmRp
Zg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfdm0uYyBiL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV92bS5jDQo+ID4gaW5kZXggMWNhOTE3YjgzMTVjLi44ZThjMDMwMmM4YTAg
MTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtLmMNCj4gPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0veGUveGVfdm0uYw0KPiA+IEBAIC0yODAwLDYgKzI4MDAsMTggQEAgc3Rh
dGljIGludCB2bV9iaW5kX2lvY3RsX2NoZWNrX2FyZ3Moc3RydWN0DQo+IHhlX2RldmljZSAqeGUs
DQo+ID4gICAJCQllcnIgPSAtRUlOVkFMOw0KPiA+ICAgCQkJZ290byBmcmVlX2JpbmRfb3BzOw0K
PiA+ICAgCQl9DQo+ID4gKw0KPiA+ICsJCS8qIGNoZWNrIHdoZXRoZXIgQ2xvcyBoYXMgYmVlbiBy
ZXNlcnZlZCBmb3IgY2hvc2VuIHBhdCAqLw0KPiA+ICsJCWlmICgoR1JBUEhJQ1NfVkVSKHhlKSA+
PSAyMCAmJiAocGF0X2luZGV4ID4gMTkpKSB8fCAoeGUtDQo+ID5pbmZvLnBsYXRmb3JtID09IFhF
X1BWQyAmJiAocGF0X2luZGV4ID4gMykpKSB7DQo+ID4gKwkJCW11dGV4X2xvY2soJnhlLT5jYWNo
ZV9yZXN2LmNsb3NfbXV0ZXgpOw0KPiA+ICsJCQllcnIgPSB4ZV9wYXRfaW5kZXhfY2xvc19jaGVj
ayh4ZSwgcGF0X2luZGV4LA0KPiA+ICt4ZS0+Y2FjaGVfcmVzdi5jbG9zX2luZGV4KTsNCj4gDQo+
IFRoYW5rcyBmb3IgcG9pbnRpbmcgb3V0IHRoYXQgeGUtPmNhY2hlX3Jlc3YuY2xvc19pbmRleCBp
cyB1c2VkIGhlcmUuLi4uLg0KPiBCdXQgdGhpcyBkb2Vzbid0IHNlZW0gY29ycmVjdC4gIFRoYXQg
aXMgc2ltcGx5IHRoZSBtb3N0IHJlY2VudGx5IHJlc2VydmVkDQo+IGNsb3NfaW5kZXguICBJdCBt
aWdodCBoYXZlIGJlZW4gcmVzZXJ2ZWQgYnkgc29tZSBvdGhlciB1c2VyLg0KDQpJIHNlZS4gWW91
IGFyZSByaWdodC4gSSBzZWVtIHRvIGhhdmUgY29uc2lkZXJlZCBhIHNpbmdsZSB1c2VyIHNjZW5h
cmlvLg0KPiANCj4gSSBiZWxpZXZlIHlvdSBuZWVkIHRvIHRlc3QgdXNpbmcgdGhlIHNldCBvZiBD
TE9TIGluZGV4ZXMgcmVzZXJ2ZWQgdG8NCj4gdGhpcyB1c2VyLiAgIFNvIHlvdSBuZWVkIHNvbWV0
aGluZyBsaWtlOg0KPiANCj4gICAgICBzdHJ1Y3QgeGVfZmlsZSAqeGVmID0gdG9feGVfZmlsZShm
aWxlKTsNCj4gDQo+ICAgICAgZm9yIGVhY2ggY2xvc19pbmRleCBpbiB4ZWYtPmNsb3NfcmVzdi5j
bG9zX21hc2sNCj4gICAgICAgICAgeGVfcGF0X2luZGV4X2Nsb3NfY2hlY2soeGUsIHBhdF9pbmRl
eCwgY2xvc19pbmRleCk7DQo+ICAgICAgY29uZmlybSBwYXRfaW5kZXggaXMgdmFsaWQgZm9yIG9u
ZSBvZiB0aGUgcmVzZXJ2ZWQgY2xvcyBpbmRleGVzDQo+IA0KPiBSaWdodD8NCg0KQWdyZWUuIA0K
DQpUaGFua3MsDQpQYWxsYXZpDQo+IA0KPiANCj4gPiArCQkJaWYgKGVycikgew0KPiA+ICsJCQkJ
bXV0ZXhfdW5sb2NrKCZ4ZS0+Y2FjaGVfcmVzdi5jbG9zX211dGV4KTsNCj4gPiArCQkJCWdvdG8g
ZnJlZV9iaW5kX29wczsNCj4gPiArCQkJfQ0KPiA+ICsJCQltdXRleF91bmxvY2soJnhlLT5jYWNo
ZV9yZXN2LmNsb3NfbXV0ZXgpOw0KPiA+ICsJCX0NCj4gPiArDQo+ID4gICAJfQ0KPiA+DQo+ID4g
ICAJcmV0dXJuIDA7DQo=
