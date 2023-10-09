Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ED5FC2BA1B
	for <intel-xe@archiver.kernel.org>; Mon,  9 Oct 2023 22:04:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB43310E14F;
	Mon,  9 Oct 2023 22:04:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E05DF10E14F;
 Mon,  9 Oct 2023 22:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696889079; x=1728425079;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=25jCP2x/gXJw0iNM0mqDy0U/QAtwRtw99sPqFI51Ea8=;
 b=iCDP0MwRMzztpUJprVhOBF4EheV0kgHC4TddqEAKemRx0mmuDbqkHW6F
 fAyn4pD28k9bU3f7KMqSpiMenMD5udlI8DvkTKkOOi5JOy+YKkdPoT0yj
 VgUuHIchKiq047rZpF94XpOLJ24TWYLUz/AkL2cTNdg8ttDzMiwUaYmfa
 nQj7RnKQR99PFHmexDZRduwk37uRSzjoniKueTHehTdolSiCq+/2FKYcD
 Hsledhob77VakWwXalAAooA7ZoSXoi00ef0KfVt7OqWZRMutg7pCHzIX9
 LXOIO5Cuvb9bDHOBBjZevO1Rxz01+eDc9uVaNngSv2rlKsFSgQ2qALO5y w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="2842349"
X-IronPort-AV: E=Sophos;i="6.03,211,1694761200"; 
   d="scan'208";a="2842349"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2023 15:04:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="843872632"
X-IronPort-AV: E=Sophos;i="6.03,211,1694761200"; d="scan'208";a="843872632"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Oct 2023 15:04:38 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 9 Oct 2023 15:04:37 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 9 Oct 2023 15:04:37 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 9 Oct 2023 15:04:37 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 9 Oct 2023 15:04:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RgNhJAsg2S1WnB668DbAIr8e2xMsqssg2Uwy6mCV5uLFlW6HLkdDYcTuGNegGAz/LTHGPlEZgZypFr6llKS5vp4AQfeTAfQuTAOtoWDRmSMHEXQEu9bvAhdxYwirXd1QdKJcrrqOtF3urSfTIY0k25yG0VkaimlBeyHkHEmJDHP8u/bw96KlpKN4D/nhDyOvV4BBYNX/juNlSr/5ea0r26ux/OEyaRu05TbQQooMpSN1/cO3lTTqIBs7csNxidlICPyd2rONksMvEaU7L8hOTDMfuPXntAKHf3V+NU+0WEtA+s79UBHqc3CNo2uj3fHPqCpR44yOxRvexPZW7KsvcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=25jCP2x/gXJw0iNM0mqDy0U/QAtwRtw99sPqFI51Ea8=;
 b=ied5VUJ/gqkovKardaoyUSZr2BGHLUKbMSPp5dnedKS/avxb+Gp77XTMqq3T0IBJ9jCgzX+rgrN5ieWuqDG0RcNz1lXrItu+34kDArjp5UASi3mR4uy8dTqkhBZBMHY867pPbzQuA7A7DCedjX2dxA8Sdt3yEklc/2Sz5aeU8PF3qTO2mkEpR651W67Up+wyNgs8j9EAwfk06Ls3JBL4t/hghoual0iyLXFBccyiD7wb4IaV/mYKj/duH/TfPK3DwOd5jx7OG9id4FMDWNPPqOh+IPKe1JPhDGUkZgpil93osKnnE/YcOuW+Ub0zAMTkKLmuo3p5UTs22iKqMhatjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5782.namprd11.prod.outlook.com (2603:10b6:510:147::11)
 by MW4PR11MB6960.namprd11.prod.outlook.com (2603:10b6:303:226::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Mon, 9 Oct
 2023 22:04:35 +0000
Received: from PH0PR11MB5782.namprd11.prod.outlook.com
 ([fe80::fc2f:c7e1:8163:6c24]) by PH0PR11MB5782.namprd11.prod.outlook.com
 ([fe80::fc2f:c7e1:8163:6c24%4]) with mapi id 15.20.6838.033; Mon, 9 Oct 2023
 22:04:34 +0000
From: "Mishra, Pallavi" <pallavi.mishra@intel.com>
To: "Auld, Matthew" <matthew.auld@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Thread-Topic: [PATCH i-g-t 04/12] lib/xe: support cpu_caching and coh_mod for
 gem_create
Thread-Index: AQHZ96EQ7IwcXjpp50OYP12sfJgu5bBCCdLg
Date: Mon, 9 Oct 2023 22:04:34 +0000
Message-ID: <PH0PR11MB57827340B06B8647E0D0694E82CEA@PH0PR11MB5782.namprd11.prod.outlook.com>
References: <20231005153116.452319-1-matthew.auld@intel.com>
 <20231005153116.452319-5-matthew.auld@intel.com>
In-Reply-To: <20231005153116.452319-5-matthew.auld@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5782:EE_|MW4PR11MB6960:EE_
x-ms-office365-filtering-correlation-id: 3fee196b-c0f1-4112-aa9e-08dbc913b903
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AiQiLXVAgRZxhy6IQuQjKSVWH3OKwXnEPxX3QKWfQqCWA1jfbo00LEiZv7ZOuBczv1g1AzHOEcoO03/He0fUCMW8Oc7KilwkudBcn4RnsKQBJ0DNN6gjuSamBumWKaFKNMn4aCuhxOJXNNVVtYQVI+1tbIFlDf3/DPUL0KdmKcS7JE6g+8T4YyPEau6PnTxk9uGTFeTMOJXfoFH13GFLv+Ya65mz9sdgpVhvn/LpPEGnEvbbyYVmBonwT/HMd3mOpgWR2TB9kcRblFURGpuHaAEUO8rza6yKyNYNm86ZqCv8JLkcybh+NTX65NBFYFmAlJNlLsTKQDNhKn+/rhF4D94HC6mdpO1j0TChTxeM0aPIwPRD2CgPcpLqQcYUexL9gR9Jcr/YEeWlmLTmKrjr6Lz7LcbCoyW+BQ0RTTI97k0gU+HUW0Gb2t8otWAB77Zsa+jssGVP+QCdEHcrf4fXZYhMmVKtZqh8t7FIftd34MdWwp9IIOQ21ooX2EhM8OxMUOp/K86twSPKjzDWj9eLwVGUZ5oZR0Rr6TsAjI/DHxJFHD/ADCHK4GApNdZeytfmYJxjpE458yTqUXZIhy0SZAlFQK+Mr4bZzgVQHICpFp3ITfgqntWaX8dtPI39WBsF
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5782.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(366004)(396003)(136003)(376002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(55016003)(26005)(83380400001)(122000001)(82960400001)(38100700002)(8936002)(450100002)(4326008)(8676002)(110136005)(54906003)(66446008)(66556008)(66946007)(66476007)(316002)(76116006)(52536014)(107886003)(9686003)(5660300002)(478600001)(41300700001)(2906002)(53546011)(7696005)(71200400001)(6506007)(64756008)(33656002)(38070700005)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U3V4dE84QnBPM3Ivb3BOUUhCZW1mcUVOS1lyZ3ZEVDYybWVZcDFaUHR6Nllt?=
 =?utf-8?B?WHlKWTVLaTlTNnE4MmM1YTJreVdTUzdtL28yNis2OER3VWNNdU5ob0F4Mklm?=
 =?utf-8?B?QlZwTVRLS3dQNHpJN2NlVzdxL1NOekpwb01OVFRVdlc4ZmVGRjYzaDBmUXFt?=
 =?utf-8?B?ZzBzbld2MFRncmJTQ3RrQ21iUlpjaFN6QmVHbkhwQVpHYWdFOXloVFRXaFQ1?=
 =?utf-8?B?eWFZOUVGYlljdHBBQm1wNEFuOFZUVmdNTk51TXN4M1FDRmpyUjc3eFVkTEVX?=
 =?utf-8?B?bXByN1RFOVpURHpjTlRGRzRoVG83U1ZoTXF3ZlJtRVVKVHdsd05MNHUvOGMy?=
 =?utf-8?B?UVF4MmNqTlJDT2NEakozNFlCRFRQTzc2RXRFVjBGa0ZZTHEzam9xSnoyM2cr?=
 =?utf-8?B?MEZrYlMzT1plbTRaVW9XeGJJREtoYzBuWW5lTGlaSkpzRDgwZ1FVNlZzaVJj?=
 =?utf-8?B?eXZsN0lWSXNuZUZQRThhZHAwYlpmRDc5ZmhIanluWU1mTUQwRUMwRFlLS3F0?=
 =?utf-8?B?T2lUL1FpQlVQbi9zUkdORFhXa3BBeVg4TXJTMjhPTi9nYVlielIxV0lEb0Vl?=
 =?utf-8?B?TzJwbUhrRjdMUE1GRGlNOVliM29GcjVDVXdyeHdvVUNxVS8ycWg0WVQvcGIx?=
 =?utf-8?B?b3N6VWFIYnRUa2ZiVDd5dkNoOGRRZVlBMU0yc21kcUlYZHhzRGlGdFN6ZFdu?=
 =?utf-8?B?eTNNZTFsZXQxNDcwWHpnYXpqdFJUekh4VU1xS3F0MFJ0NUZ4QXI5ZUNweHBk?=
 =?utf-8?B?Z2tyaEZYZlFIdjJISGswbjZ5U0ExMlJpWmlsODNhMWs3RnVYbTkxaTYrVEhj?=
 =?utf-8?B?eERPYzFrQnhIRnZtN1ZzTzVnNjh1ZEQzWHh4Q2poS3VNWlFjK3FjTTNwS0lm?=
 =?utf-8?B?UW9tUFBUZGJYL25EL3UySkpKRVVib1d5d3IrbmtSMFFEWmd3a0NXb3g4d0Uw?=
 =?utf-8?B?TzdlRENIeFBLSkdxMVFCMHJSMWlEVmNGNFZYM2VuN0gzS1ZtdUJuQlAzSzZR?=
 =?utf-8?B?RDYzQjJoOWpiSzYydnQzbU5ua0VVWGxDWm1YdXdpYXRvR0hyUWNiY1FnS0g0?=
 =?utf-8?B?TGpIU3I3Tm1lLytxamVrK2pVbExwaWllWmQ1TWxvQllwVHlNdnQ4bEQxbjdY?=
 =?utf-8?B?cnd0enJoS25LUEgzaFNzd3JObUMzekZjenZrVVUxbmFIZ1pXcmtJKzFPZU11?=
 =?utf-8?B?V0kwSHM3ZEZrbnlXL25rOFdEb0paUnk4SHNTaGtDQmhsN3NLU2Yvdms3dmx0?=
 =?utf-8?B?c3E2U1o1anlnVVc2cm9mdll3V1REM21tTHVFeWdWWVB4d0JEUHFnQzUyN2Zt?=
 =?utf-8?B?Y1BLQWFPSFNFV0M2aHVENXpSSUE3Rncvd1plZUVaNXp4UWtFNFgzQ2pjclN1?=
 =?utf-8?B?MDZES05uNFJZVGhFWS9pUW1SRVJ5U0JOVm9lVi83bVk3aStrK0ttdWIwaS9U?=
 =?utf-8?B?eTdHa2pSWHFsWnVRTFRUNjVXUFhKL01WY1ZEUEh3djFBeGxJdDUvY2s5YUln?=
 =?utf-8?B?ZjFoRmFBZEU1UVZSMVdEQXc2THlHTVNLSnkxcUNaRUUzdnhsckZlYmkrczBD?=
 =?utf-8?B?aXFYK1J0SkIvVEdsZnRzT1lpbkFlWXBmWitHS2pXMU1FWjVuVzNSS0l3RThO?=
 =?utf-8?B?YmxZTkhKeEhpQ0VwZ3ZvYnFaVDAwQ2M2MXQ1NlRKQ1czQ1BqUmtwa0J4K3do?=
 =?utf-8?B?U0dpVTBvRkpvdVhqYmVIdUM2SlMvNlNIZFkvTWhJOS91Nkh2b3BPcy9kN0dS?=
 =?utf-8?B?ajJyNmlMSGd0Y0ZZdjFpMGg3aDdPRDk3V0I1b1lxcEtRRUlQVGo4Smd2TEsx?=
 =?utf-8?B?YmJHMDlaU0VON0M2OFFvWlA4bkRxdkRGTm53NjRBWnFyR2w0dDkvc0xDaXQ1?=
 =?utf-8?B?dUltSUZpUDRNbnpqS1VQMkU5VHBqcnNRM2N0cUVRcU5JUFNPSEp4WUpVYU9s?=
 =?utf-8?B?N2w0Rk5vcURCQzhwanhJdURZdkFtRGk2KzYyV0lqcXhqN2dJTTgvY1JLZkN0?=
 =?utf-8?B?MXFuUGdqUnNSRVRhSVd0eFp2Qk5EaE1xU0JueW1jZy8zZGhKelhtS2dmVHhO?=
 =?utf-8?B?R2xoYlE5OFBaVWwxR01ZczZaTm51YXcza3hBSXUySGJrVlF6bmpyU0pzVm8y?=
 =?utf-8?Q?DQ6/RbePCa1IYZsDU6/9+CM/x?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5782.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fee196b-c0f1-4112-aa9e-08dbc913b903
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2023 22:04:34.8048 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 88M0JoLnB4O24RCI6XoRCd5MDWTvUOYQf+R4FCD8XpDmM1/gWUBPT9qOARc5T6NsIYcI5oGwQTN4Oqi9y9yfIDGP1e009DcfF0p1g8yv6Uk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6960
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH i-g-t 04/12] lib/xe: support cpu_caching and
 coh_mod for gem_create
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQXVsZCwgTWF0dGhldyA8
bWF0dGhldy5hdWxkQGludGVsLmNvbT4NCj4gU2VudDogVGh1cnNkYXksIE9jdG9iZXIgNSwgMjAy
MyA4OjMxIEFNDQo+IFRvOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogaW50
ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBTb3V6YSwgSm9zZSA8am9zZS5zb3V6YUBpbnRl
bC5jb20+Ow0KPiBNaXNocmEsIFBhbGxhdmkgPHBhbGxhdmkubWlzaHJhQGludGVsLmNvbT4NCj4g
U3ViamVjdDogW1BBVENIIGktZy10IDA0LzEyXSBsaWIveGU6IHN1cHBvcnQgY3B1X2NhY2hpbmcg
YW5kIGNvaF9tb2QgZm9yDQo+IGdlbV9jcmVhdGUNCj4gDQo+IE1vc3QgdGVzdHMgc2hvdWxkbid0
IGFib3V0IHN1Y2ggdGhpbmdzLCBzbyBsaWtlbHkgaXQncyBqdXN0IGEgY2FzZSBvZiBwaWNraW5n
IHRoZQ0KPiBtb3N0IHNhbmUgZGVmYXVsdC4gSG93ZXZlciB3ZSBhbHNvIGFkZCBzb21lIGhlbHBl
cnMgZm9yIHRoZSB0ZXN0cyB0aGF0IGRvDQo+IGNhcmUuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBN
YXR0aGV3IEF1bGQgPG1hdHRoZXcuYXVsZEBpbnRlbC5jb20+DQo+IENjOiBKb3PDqSBSb2JlcnRv
IGRlIFNvdXphIDxqb3NlLnNvdXphQGludGVsLmNvbT4NCj4gQ2M6IFBhbGxhdmkgTWlzaHJhIDxw
YWxsYXZpLm1pc2hyYUBpbnRlbC5jb20+DQoNClJldmlld2VkLWJ5OiBQYWxsYXZpIE1pc2hyYSA8
cGFsbGF2aS5taXNocmFAaW50ZWwuY29tPg0KPiAtLS0NCj4gIGxpYi94ZS94ZV9pb2N0bC5jICAg
ICAgIHwgNjUgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0NCj4gIGxp
Yi94ZS94ZV9pb2N0bC5oICAgICAgIHwgIDggKysrKysNCj4gIHRlc3RzL2ludGVsL3hlX2NyZWF0
ZS5jIHwgIDMgKysNCj4gIDMgZmlsZXMgY2hhbmdlZCwgNjUgaW5zZXJ0aW9ucygrKSwgMTEgZGVs
ZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbGliL3hlL3hlX2lvY3RsLmMgYi9saWIveGUv
eGVfaW9jdGwuYyBpbmRleCA3MzBkY2ZkMTYuLjgwNjk2YWE1OQ0KPiAxMDA2NDQNCj4gLS0tIGEv
bGliL3hlL3hlX2lvY3RsLmMNCj4gKysrIGIvbGliL3hlL3hlX2lvY3RsLmMNCj4gQEAgLTIzMywx
MyArMjMzLDMwIEBAIHZvaWQgeGVfdm1fZGVzdHJveShpbnQgZmQsIHVpbnQzMl90IHZtKQ0KPiAg
CWlndF9hc3NlcnRfZXEoaWd0X2lvY3RsKGZkLCBEUk1fSU9DVExfWEVfVk1fREVTVFJPWSwgJmRl
c3Ryb3kpLA0KPiAwKTsgIH0NCj4gDQo+IC11aW50MzJfdCBfX3hlX2JvX2NyZWF0ZV9mbGFncyhp
bnQgZmQsIHVpbnQzMl90IHZtLCB1aW50NjRfdCBzaXplLCB1aW50MzJfdA0KPiBmbGFncywNCj4g
LQkJCSAgICAgIHVpbnQzMl90ICpoYW5kbGUpDQo+ICt2b2lkIF9feGVfZGVmYXVsdF9jb2hfY2Fj
aGluZ19mcm9tX2ZsYWdzKGludCBmZCwgdWludDMyX3QgZmxhZ3MsDQo+ICsJCQkJCSB1aW50MTZf
dCAqY3B1X2NhY2hpbmcsDQo+ICsJCQkJCSB1aW50MTZfdCAqY29oX21vZGUpDQo+ICt7DQo+ICsJ
aWYgKChmbGFncyAmIGFsbF9tZW1vcnlfcmVnaW9ucyhmZCkpICE9IHN5c3RlbV9tZW1vcnkoZmQp
IHx8DQo+ICsJICAgIGZsYWdzICYgWEVfR0VNX0NSRUFURV9GTEFHX1NDQU5PVVQpIHsNCj4gKwkJ
LyogVlJBTSBwbGFjZW1lbnRzIG9yIHNjYW5vdXQgc2hvdWxkIGFsd2F5cyB1c2UgV0MgKi8NCj4g
KwkJKmNwdV9jYWNoaW5nID0gRFJNX1hFX0dFTV9DUFVfQ0FDSElOR19XQzsNCj4gKwkJKmNvaF9t
b2RlID0gRFJNX1hFX0dFTV9DT0hfTk9ORTsNCj4gKwl9IGVsc2Ugew0KPiArCQkqY3B1X2NhY2hp
bmcgPSBEUk1fWEVfR0VNX0NQVV9DQUNISU5HX1dCOw0KPiArCQkqY29oX21vZGUgPSBEUk1fWEVf
R0VNX0NPSF9BVF9MRUFTVF8xV0FZOw0KPiArCX0NCj4gK30NCj4gKw0KPiArc3RhdGljIHVpbnQz
Ml90IF9fX3hlX2JvX2NyZWF0ZV9mbGFncyhpbnQgZmQsIHVpbnQzMl90IHZtLCB1aW50NjRfdCBz
aXplLA0KPiB1aW50MzJfdCBmbGFncywNCj4gKwkJCQkgICAgICB1aW50MTZfdCBjcHVfY2FjaGlu
ZywgdWludDE2X3QgY29oX21vZGUsDQo+IHVpbnQzMl90ICpoYW5kbGUpDQo+ICB7DQo+ICAJc3Ry
dWN0IGRybV94ZV9nZW1fY3JlYXRlIGNyZWF0ZSA9IHsNCj4gIAkJLnZtX2lkID0gdm0sDQo+ICAJ
CS5zaXplID0gc2l6ZSwNCj4gIAkJLmZsYWdzID0gZmxhZ3MsDQo+ICsJCS5jcHVfY2FjaGluZyA9
IGNwdV9jYWNoaW5nLA0KPiArCQkuY29oX21vZGUgPSBjb2hfbW9kZSwNCj4gIAl9Ow0KPiAgCWlu
dCBlcnI7DQo+IA0KPiBAQCAtMjQ5LDYgKzI2NiwxOCBAQCB1aW50MzJfdCBfX3hlX2JvX2NyZWF0
ZV9mbGFncyhpbnQgZmQsIHVpbnQzMl90IHZtLA0KPiB1aW50NjRfdCBzaXplLCB1aW50MzJfdCBm
bGFncw0KPiANCj4gIAkqaGFuZGxlID0gY3JlYXRlLmhhbmRsZTsNCj4gIAlyZXR1cm4gMDsNCj4g
Kw0KPiArfQ0KPiArDQo+ICt1aW50MzJfdCBfX3hlX2JvX2NyZWF0ZV9mbGFncyhpbnQgZmQsIHVp
bnQzMl90IHZtLCB1aW50NjRfdCBzaXplLCB1aW50MzJfdA0KPiBmbGFncywNCj4gKwkJCSAgICAg
IHVpbnQzMl90ICpoYW5kbGUpDQo+ICt7DQo+ICsJdWludDE2X3QgY3B1X2NhY2hpbmcsIGNvaF9t
b2RlOw0KPiArDQo+ICsJX194ZV9kZWZhdWx0X2NvaF9jYWNoaW5nX2Zyb21fZmxhZ3MoZmQsIGZs
YWdzLCAmY3B1X2NhY2hpbmcsDQo+ICsmY29oX21vZGUpOw0KPiArDQo+ICsJcmV0dXJuIF9fX3hl
X2JvX2NyZWF0ZV9mbGFncyhmZCwgdm0sIHNpemUsIGZsYWdzLCBjcHVfY2FjaGluZywNCj4gY29o
X21vZGUsDQo+ICsJCQkJICAgICBoYW5kbGUpOw0KPiAgfQ0KPiANCj4gIHVpbnQzMl90IHhlX2Jv
X2NyZWF0ZV9mbGFncyhpbnQgZmQsIHVpbnQzMl90IHZtLCB1aW50NjRfdCBzaXplLCB1aW50MzJf
dCBmbGFncykNCj4gQEAgLTI2MCwxOSArMjg5LDMzIEBAIHVpbnQzMl90IHhlX2JvX2NyZWF0ZV9m
bGFncyhpbnQgZmQsIHVpbnQzMl90IHZtLA0KPiB1aW50NjRfdCBzaXplLCB1aW50MzJfdCBmbGFn
cykNCj4gIAlyZXR1cm4gaGFuZGxlOw0KPiAgfQ0KPiANCj4gK3VpbnQzMl90IF9feGVfYm9fY3Jl
YXRlX2NhY2hpbmcoaW50IGZkLCB1aW50MzJfdCB2bSwgdWludDY0X3Qgc2l6ZSwgdWludDMyX3QN
Cj4gZmxhZ3MsDQo+ICsJCQkJdWludDE2X3QgY3B1X2NhY2hpbmcsIHVpbnQxNl90IGNvaF9tb2Rl
LA0KPiArCQkJCXVpbnQzMl90ICpoYW5kbGUpDQo+ICt7DQo+ICsJcmV0dXJuIF9fX3hlX2JvX2Ny
ZWF0ZV9mbGFncyhmZCwgdm0sIHNpemUsIGZsYWdzLCBjcHVfY2FjaGluZywNCj4gY29oX21vZGUs
DQo+ICsJCQkJICAgICBoYW5kbGUpOw0KPiArfQ0KPiArDQo+ICt1aW50MzJfdCB4ZV9ib19jcmVh
dGVfY2FjaGluZyhpbnQgZmQsIHVpbnQzMl90IHZtLCB1aW50NjRfdCBzaXplLCB1aW50MzJfdA0K
PiBmbGFncywNCj4gKwkJCSAgICAgIHVpbnQxNl90IGNwdV9jYWNoaW5nLCB1aW50MTZfdCBjb2hf
bW9kZSkgew0KPiArCXVpbnQzMl90IGhhbmRsZTsNCj4gKw0KPiArCWlndF9hc3NlcnRfZXEoX194
ZV9ib19jcmVhdGVfY2FjaGluZyhmZCwgdm0sIHNpemUsIGZsYWdzLA0KPiArCQkJCQkgICAgIGNw
dV9jYWNoaW5nLCBjb2hfbW9kZSwgJmhhbmRsZSksDQo+IDApOw0KPiArDQo+ICsJcmV0dXJuIGhh
bmRsZTsNCj4gK30NCj4gKw0KPiAgdWludDMyX3QgeGVfYm9fY3JlYXRlKGludCBmZCwgaW50IGd0
LCB1aW50MzJfdCB2bSwgdWludDY0X3Qgc2l6ZSkgIHsNCj4gLQlzdHJ1Y3QgZHJtX3hlX2dlbV9j
cmVhdGUgY3JlYXRlID0gew0KPiAtCQkudm1faWQgPSB2bSwNCj4gLQkJLnNpemUgPSBzaXplLA0K
PiAtCQkuZmxhZ3MgPSB2cmFtX2lmX3Bvc3NpYmxlKGZkLCBndCksDQo+IC0JfTsNCj4gLQlpbnQg
ZXJyOw0KPiArCXVpbnQzMl90IGhhbmRsZTsNCj4gDQo+IC0JZXJyID0gaWd0X2lvY3RsKGZkLCBE
Uk1fSU9DVExfWEVfR0VNX0NSRUFURSwgJmNyZWF0ZSk7DQo+IC0JaWd0X2Fzc2VydF9lcShlcnIs
IDApOw0KPiArCWlndF9hc3NlcnRfZXEoX194ZV9ib19jcmVhdGVfZmxhZ3MoZmQsIHZtLCBzaXpl
LCB2cmFtX2lmX3Bvc3NpYmxlKGZkLA0KPiBndCksDQo+ICsJCQkJCSAgICZoYW5kbGUpLCAwKTsN
Cj4gDQo+IC0JcmV0dXJuIGNyZWF0ZS5oYW5kbGU7DQo+ICsJcmV0dXJuIGhhbmRsZTsNCj4gIH0N
Cj4gDQo+ICB1aW50MzJfdCB4ZV9iaW5kX2V4ZWNfcXVldWVfY3JlYXRlKGludCBmZCwgdWludDMy
X3Qgdm0sIHVpbnQ2NF90IGV4dCkgZGlmZiAtLQ0KPiBnaXQgYS9saWIveGUveGVfaW9jdGwuaCBi
L2xpYi94ZS94ZV9pb2N0bC5oIGluZGV4IDZjMjgxYjNiZi4uYzE4ZmM4NzhjIDEwMDY0NA0KPiAt
LS0gYS9saWIveGUveGVfaW9jdGwuaA0KPiArKysgYi9saWIveGUveGVfaW9jdGwuaA0KPiBAQCAt
NjcsNiArNjcsMTQgQEAgdm9pZCB4ZV92bV9kZXN0cm95KGludCBmZCwgdWludDMyX3Qgdm0pOyAg
dWludDMyX3QNCj4gX194ZV9ib19jcmVhdGVfZmxhZ3MoaW50IGZkLCB1aW50MzJfdCB2bSwgdWlu
dDY0X3Qgc2l6ZSwgdWludDMyX3QgZmxhZ3MsDQo+ICAJCQkgICAgICB1aW50MzJfdCAqaGFuZGxl
KTsNCj4gIHVpbnQzMl90IHhlX2JvX2NyZWF0ZV9mbGFncyhpbnQgZmQsIHVpbnQzMl90IHZtLCB1
aW50NjRfdCBzaXplLCB1aW50MzJfdA0KPiBmbGFncyk7DQo+ICt1aW50MzJfdCBfX3hlX2JvX2Ny
ZWF0ZV9jYWNoaW5nKGludCBmZCwgdWludDMyX3Qgdm0sIHVpbnQ2NF90IHNpemUsIHVpbnQzMl90
DQo+IGZsYWdzLA0KPiArCQkJCXVpbnQxNl90IGNwdV9jYWNoaW5nLCB1aW50MTZfdCBjb2hfbW9k
ZSwNCj4gKwkJCQl1aW50MzJfdCAqaGFuZGxlKTsNCj4gK3VpbnQzMl90IHhlX2JvX2NyZWF0ZV9j
YWNoaW5nKGludCBmZCwgdWludDMyX3Qgdm0sIHVpbnQ2NF90IHNpemUsIHVpbnQzMl90DQo+IGZs
YWdzLA0KPiArCQkJICAgICAgdWludDE2X3QgY3B1X2NhY2hpbmcsIHVpbnQxNl90IGNvaF9tb2Rl
KTsgdm9pZA0KPiArX194ZV9kZWZhdWx0X2NvaF9jYWNoaW5nX2Zyb21fZmxhZ3MoaW50IGZkLCB1
aW50MzJfdCBmbGFncywNCj4gKwkJCQkJIHVpbnQxNl90ICpjcHVfY2FjaGluZywNCj4gKwkJCQkJ
IHVpbnQxNl90ICpjb2hfbW9kZSk7DQo+ICB1aW50MzJfdCB4ZV9ib19jcmVhdGUoaW50IGZkLCBp
bnQgZ3QsIHVpbnQzMl90IHZtLCB1aW50NjRfdCBzaXplKTsgIHVpbnQzMl90DQo+IHhlX2V4ZWNf
cXVldWVfY3JlYXRlKGludCBmZCwgdWludDMyX3Qgdm0sDQo+ICAJCQkgIHN0cnVjdCBkcm1feGVf
ZW5naW5lX2NsYXNzX2luc3RhbmNlICppbnN0YW5jZSwgZGlmZiAtDQo+IC1naXQgYS90ZXN0cy9p
bnRlbC94ZV9jcmVhdGUuYyBiL3Rlc3RzL2ludGVsL3hlX2NyZWF0ZS5jIGluZGV4DQo+IDhkODQ1
ZTVjOC4uZjVkMmNjMWIyIDEwMDY0NA0KPiAtLS0gYS90ZXN0cy9pbnRlbC94ZV9jcmVhdGUuYw0K
PiArKysgYi90ZXN0cy9pbnRlbC94ZV9jcmVhdGUuYw0KPiBAQCAtMzAsNiArMzAsOSBAQCBzdGF0
aWMgaW50IF9fY3JlYXRlX2JvKGludCBmZCwgdWludDMyX3Qgdm0sIHVpbnQ2NF90IHNpemUsDQo+
IHVpbnQzMl90IGZsYWdzLA0KPiANCj4gIAlpZ3RfYXNzZXJ0KGhhbmRsZXApOw0KPiANCj4gKwlf
X3hlX2RlZmF1bHRfY29oX2NhY2hpbmdfZnJvbV9mbGFncyhmZCwgZmxhZ3MsICZjcmVhdGUuY3B1
X2NhY2hpbmcsDQo+ICsJCQkJCSAgICAmY3JlYXRlLmNvaF9tb2RlKTsNCj4gKw0KPiAgCWlmIChp
Z3RfaW9jdGwoZmQsIERSTV9JT0NUTF9YRV9HRU1fQ1JFQVRFLCAmY3JlYXRlKSkgew0KPiAgCQly
ZXQgPSAtZXJybm87DQo+ICAJCWVycm5vID0gMDsNCj4gLS0NCj4gMi40MS4wDQoNCg==
