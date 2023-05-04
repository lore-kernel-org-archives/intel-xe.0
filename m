Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D941C7EE21
	for <intel-xe@archiver.kernel.org>; Thu,  4 May 2023 19:37:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3072910E501;
	Thu,  4 May 2023 19:37:13 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D38EE10E501
 for <intel-xe@lists.freedesktop.org>; Thu,  4 May 2023 19:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683229031; x=1714765031;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=nDKiYztZmbCHemhT37AzIrGLduEYTclSAy6uk659ltg=;
 b=n7AqXZt4tLRdNUKrFrNouA21iVtDLNzE1gnT2ns7Cocr8e8GpZYhYux6
 9FMguJfZhYbOlD9Xb+j4Mlin2w5vjqNRL4qayrF1OJusMe3X5zZhckGXQ
 BhVHQ6cT/UJAUxZMkCzTHHeFzrIopcfbuEGJCXCyY2I7tjMz+qAp3qKnL
 bM3c2U45iIGnHKl6LBokDUI1yLdeBAb4eMiGLzkI5IDfdZtJ/D2WUtica
 WAeTo1VQHceemnAWvYG3JenOm2jc6CeYR6Aki3l8adCDAZ5jCOrSoEc0z
 DyH5FODrfMdsJEfyrYfmt+ti6yUPU309TJ8pjXtpQdP0OvbMbrJxmZ2f2 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="349080180"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; d="scan'208";a="349080180"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2023 12:37:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="871471241"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; d="scan'208";a="871471241"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga005.jf.intel.com with ESMTP; 04 May 2023 12:37:09 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 4 May 2023 12:37:09 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 4 May 2023 12:37:08 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 4 May 2023 12:37:08 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.174)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 4 May 2023 12:37:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=deDpSK7LmL04JgzWA0dKXZrS3uHmQ4J0ZApt5lVTvA3t4xN4rM+XG9vv459c9AlgHPKy2/bMSzCtTvrC4pkMrNlpg8re9vuIrhC8G5UFeVmS1fd3PnOxJfQPLaJpYuXE+C3jKQbhbZopXgVYEp7zu99e5awbV06PtKkx9mPyS6+66TZDgeHR8CMJyy8OmfmN77hgOTTCMhDha1RYUnW2WtQCUg3a9GaZkp4t/U6WXM7Uzg498JcMhbRUtizfpMhP3MbEhTu6bF+A47tJpbUmAryELI5UUwi+CVQCiFMV4tlVA7rM4YjYiag+LtxrltMNp4ePcU61yyZXEUBFWQfxrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nDKiYztZmbCHemhT37AzIrGLduEYTclSAy6uk659ltg=;
 b=X8LGJexu1oDFSdSufvHkpyHBDQOJDmVUVXbUbi5TV8GG9/FPxziTr9Gh0ZUBJ1mHZJ2jwTz6z/VkWileSbeNyriDce6VlOtlNNIK0jSH7gOlUC8y8VTgEIt50hBnqSZzdEgWW1evC4ZG1e0rTtE7L39K0Lylg0jsUwZ74rjtdul9aV80FY0VAzcWRhlYhBN4lDaNhvvvqwYlSK5yobyLROsntGqVYfNHIYLN7xWUHPIfRk8+7r+O8iqtJtFdKRLoivE6YXj1+CeoTRcz8mjGACIp+F/VYywX3bbXtNDh0zD7Klf007oWlmiS7EYN98wtiFiW2KT9/uWK5DIVyprNtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by DS0PR11MB7288.namprd11.prod.outlook.com (2603:10b6:8:13b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.26; Thu, 4 May
 2023 19:37:05 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::3fa1:b97c:a5bb:651]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::3fa1:b97c:a5bb:651%3]) with mapi id 15.20.6363.026; Thu, 4 May 2023
 19:37:05 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>
Thread-Topic: [Intel-xe] [PATCH 7/7] drm/xe/guc: Port workarounds to OOB infra
Thread-Index: AQHZflrJqH7DE5Ib6Eq/3YVeS8QSP69KPhIAgABC+wCAAAHUAA==
Date: Thu, 4 May 2023 19:37:05 +0000
Message-ID: <ffbb8d71931f4aec77b4b148463272d3a6dd9be3.camel@intel.com>
References: <20230504073250.1436293-1-lucas.demarchi@intel.com>
 <20230504073250.1436293-8-lucas.demarchi@intel.com>
 <d7865dca6ea77cfa8274129f584f2074e7291894.camel@intel.com>
 <dikz4xlzc6awvlu6rol2slga2nernci2zmhrnsz5qpksgi4br2@locnvrubd734>
In-Reply-To: <dikz4xlzc6awvlu6rol2slga2nernci2zmhrnsz5qpksgi4br2@locnvrubd734>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|DS0PR11MB7288:EE_
x-ms-office365-filtering-correlation-id: d9885ac9-16d5-4af2-44ef-08db4cd6f0f6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Yd9TKxjifMTR8EMWJ3xB+nUUK6OWSQQem1eqi8WN7em2bDG3GtOA2+ca+OroIES0Fg4UcBEwnm4NXMpZzJ998JGHNPKHu0HhHPRFNrrHSyioB5k8is2/wSonQnViKF9icnWnVheSNPZPGzi07NeUZFZdvlDuOQevM0/lkO6szmciysJfYKqWu3o9kk47nMUCyNkKdZG2wF/jU2Ur0LdUjAC0BX028ix9pQeLAkF4KbSSh5pMkTnpOkWMiuOLOYDEF6932/CbKQ2zp3qqvGGGhfXQZS/dTLgibhTi+XDwAMaHFGNEOWAf7o6C+dCC3Ryg/v8bvv7n1xxvOw9dvCtDnHoXovnJFuJVUP9uaFTSx810HyjGsKu68hXBSR83hC6BkSqZyiaLriHSSq4ynb8AwxZNKp3dj8yJRFnfTBARJztR+0EYNZYc/FKRKaJ+TP2Ebdie8NNbfG+hogkb51Q3/yX4k16NQZDL1QontMDcsyXwwP6wIozR1iO7moBiBJTF2tTpPF4IZQbNtDaAAIYnhSgqysuuGcBzFOxjuILfPCXWPfJvqImF3Ee4IdZztIuM/QxRHJW91Eza0qLFjVsk/BP2ElRnTudh0HRJL+0t5aNHOdzgV0kJgPjcF6cYpqGu
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(346002)(136003)(376002)(39860400002)(396003)(451199021)(2616005)(6486002)(26005)(38070700005)(41300700001)(86362001)(36756003)(316002)(6636002)(83380400001)(4326008)(76116006)(64756008)(66446008)(66476007)(66556008)(66946007)(71200400001)(91956017)(478600001)(2906002)(122000001)(82960400001)(37006003)(38100700002)(186003)(5660300002)(8676002)(8936002)(6862004)(6512007)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?amNsYnNVNGJORG8rOW8vbVZ3WUMvdUNURUFuTTVuOFgwcUZrd05zOUxraENG?=
 =?utf-8?B?UTJxVno1T0tRblRkalB5LzFoV2RITlJLL1RCOE8wQUFwU2RYb1kxUlBBSDRL?=
 =?utf-8?B?S1dRR1NBV1VaaVJBMWE3STJQMXp5MytDbFJhMW1ralJTaVJHSFkycjB0V3ZS?=
 =?utf-8?B?bHE4Z0lsRmtqY2VLdC9nUTh0Q2lzOGhGVE1wTEZJOFdWVk9EUVRjTVEwSmJ4?=
 =?utf-8?B?VjJSQTdTbHZwaXFWSzNUS1pnTGcxMGRIZWl4endkWm1XSWE1cFplUnZjWnN3?=
 =?utf-8?B?cjRPRm1GTWllOElhUmFxQ3phSS8zYjgyZHJUbUhmMTNIajYwL0k1Q2FuRjZP?=
 =?utf-8?B?SnlUZE9wNFBicTJ6c084VGhrMTdhc01sYjExRHRIRXp5UDFCSSt2TzdZZEUy?=
 =?utf-8?B?ekZCem9WSHgrU1Fjb0Q1NGpLVjlMdy94ME4zRk5iemtnVGFkaWZ0Q2dDMEVX?=
 =?utf-8?B?M2VkekhhYjYxWHlaVE5jczV6NFhyQ29qS3FOV0IwcFVUeDd5ZHExaS9iY1VN?=
 =?utf-8?B?cEhEbG1kMFh5ams5K2NGN0lCUzI0QjhacEFHdWRhOXl3QWcxQi9JOG5OMUIw?=
 =?utf-8?B?ZW5aYUlvbDBDNGUxVEphbkRwdzBwT0xMWGdGTDIrR1NqK1RabHBlOCtDN1FQ?=
 =?utf-8?B?cDFPSXlBMVlBYUdtT0I4QVUycXM3OGduaGI3YnRBcmhMa1JHZGN1UGVmR2Uv?=
 =?utf-8?B?dmVISXE2cStnSzMyamp5NWRiZU80Rkh3TllLMDBrZWpCeTdNaFcvYnVoYndJ?=
 =?utf-8?B?bVNBZ2RXZGFXbzlISWhXcXYzQWcrblo4YnZSWXQ1b3JLZXBmR0NzeGtXVzla?=
 =?utf-8?B?QlloUnYvb2dNOGtkYkUrL2Nxa1ArcXVLWHlTOW9XbUhtaG8yeGMybHNnclJB?=
 =?utf-8?B?OWtQZXkrT1kxc01hbFV1WGpCSFY3c1FYV3lZc0RjZnM5ZGgrTWpKMFRFWmk5?=
 =?utf-8?B?UXNVVzUxQ1llQVY1RERENzVGUDNSaUZxNGRSbDBIcEMrTkh2aGxCMUVGN0xJ?=
 =?utf-8?B?MVl3RDVmbTFjakJTSXB5eUMvbW52QXJ6a2tzSGV0d0w1YmMrS2JDSWRKSUJT?=
 =?utf-8?B?eEpYYjBlTnJFTFNhVDZPWHlnZDhISU9nOWFCTFlwZVlENWl5dDlidWpxL0dL?=
 =?utf-8?B?YVg2KzAyQnIyb1JHaEVLK3hqc00rYWxOK2pGd0dhTnh2SmlYWlJIS1Z3ZzAv?=
 =?utf-8?B?QnphazJNY0FVVFE3SXBEQ2Rsc0RLSVZQalU3dTNSNVJteVpEajhpNmJEcjEv?=
 =?utf-8?B?OEo5OUxmZ2RWZytWYldNcE9qVCtBVWptMUNjaytialBWWkFpYTR5dW1kS2ZV?=
 =?utf-8?B?bVVXVTVTbVhkais1TmtwbndNOXdIVTJYckVsRGUrYWl5cnMvc0dINHM0WWtX?=
 =?utf-8?B?UG4zSUpPNGlpN3pTakU0RjhIMzdWcEc2eTRVTDNkclFPT1VJSUR0RVlMUWpH?=
 =?utf-8?B?bm1YZlJlYTF4R3F3aTdXTFdMN09iNFZaekhsK0h4RXg5TTdacW1HOG5GOEJV?=
 =?utf-8?B?d3F4MG50Z0p0L0JIL1d2UFI4SXYwNmU3TXQ3azU2RmdOUHRBUm9TaTYycERX?=
 =?utf-8?B?UGF0bytlS3hBOXo4WXlQWVg0bHVpeWtnWmpWSitCM1c1OFRBS3YwMGMwNnl1?=
 =?utf-8?B?ZWNSZTJDUDJNNGdsWmthc0RaYmdOMUVsaEp0OHVzN244WXYvTUkrQi90aDF5?=
 =?utf-8?B?eHV4YnY3MkxoV3hvQUdZNE1YcHF6N2NHVDl2MW41SmpxNFJTa1czNTVCblA4?=
 =?utf-8?B?b1A2TDNBU2RCd3U0SXV2azJLelgva0N3YjZMdWZKZ05ncEJ5ZXBSVURDZ0cw?=
 =?utf-8?B?QndqbzFhUnhHb1c1TnBSSDhFbGVIaFdUYVRnRml6RW9UcEhHRnpEejZJdTFn?=
 =?utf-8?B?cjdLYkwxZVlwS25JRkRkU0hSYjZyWnF6aDlyVDRScVR6T2Qrc3FyQ2I4ZVdM?=
 =?utf-8?B?SWhkZkQ3RFZXclMvRGVSdi9RdkpJMmpnLzR2OThxSHJkVndQdzVKZnNyVWgv?=
 =?utf-8?B?dFI4TTlsYTF6TmVscFRlWHdLUkxONU4vUUpjNnk1alo2MTZUN0lJNjRtR0lu?=
 =?utf-8?B?cFJYL3RzSTRTOXVEWC8zdHQ2elZVSmQzQkNYTWNKV0VNa0dma2g1SVRFWTZq?=
 =?utf-8?Q?7bkHelTFwvRosq6bApf2hBp0S?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <31E22A33E8188A46ADDD25F98E772D20@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9885ac9-16d5-4af2-44ef-08db4cd6f0f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2023 19:37:05.2312 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SENxsJro0xTj7boKX1F3xhuqQlGuaN09WSz0am4ZZxlCalVDi/cHuGy2PWZIDnnQmb3I2IvdFEHnRxBRcoB1CQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7288
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 7/7] drm/xe/guc: Port workarounds to OOB infra
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

T24gVGh1LCAyMDIzLTA1LTA0IGF0IDEyOjMwIC0wNzAwLCBMdWNhcyBEZSBNYXJjaGkgd3JvdGU6
DQo+IE9uIFRodSwgTWF5IDA0LCAyMDIzIGF0IDAzOjMwOjQ4UE0gKzAwMDAsIEpvc2UgU291emEg
d3JvdGU6DQo+ID4gT24gVGh1LCAyMDIzLTA1LTA0IGF0IDAwOjMyIC0wNzAwLCBMdWNhcyBEZSBN
YXJjaGkgd3JvdGU6DQo+ID4gPiBMZXQgeGVfZ3VjLmMgc3RhcnQgdXNpbmcgWEVfV0EoKSBmb3Ig
d29ya2Fyb3VuZHMuIE9uZSB3b3JrYXJvdW5kDQo+ID4gPiBjb3VsZG4ndCBiZSBjb252ZXJ0ZWQg
ZHVlIHRvIG5vIHN1cHBvcnQgZm9yIGZ1bmN0aW9uIGhvb2sgY2hlY2tzLg0KPiA+ID4gDQo+ID4g
PiBTaWduZWQtb2ZmLWJ5OiBMdWNhcyBEZSBNYXJjaGkgPGx1Y2FzLmRlbWFyY2hpQGludGVsLmNv
bT4NCj4gPiA+IC0tLQ0KPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWMuYyB8IDQwICsr
KysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gPiA+ICAxIGZpbGUgY2hhbmdl
ZCwgMTQgaW5zZXJ0aW9ucygrKSwgMjYgZGVsZXRpb25zKC0pDQo+ID4gPiANCj4gPiA+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjLmMgYi9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfZ3VjLmMNCj4gPiA+IGluZGV4IGY3ZDMyYjc0NDI0Ny4uZWVhNWVkMDE1MjgyIDEwMDY0NA0K
PiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Yy5jDQo+ID4gPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0veGUveGVfZ3VjLmMNCj4gPiA+IEBAIC0xOSw3ICsxOSw5IEBADQo+ID4gPiAg
I2luY2x1ZGUgInhlX2d1Y19zdWJtaXQuaCINCj4gPiA+ICAjaW5jbHVkZSAieGVfbW1pby5oIg0K
PiA+ID4gICNpbmNsdWRlICJ4ZV9wbGF0Zm9ybV90eXBlcy5oIg0KPiA+ID4gKyNpbmNsdWRlICJ4
ZV9ydHAuaCINCj4gPiA+ICAjaW5jbHVkZSAieGVfdWNfZncuaCINCj4gPiA+ICsjaW5jbHVkZSAi
eGVfd2EuaCINCj4gPiA+ICAjaW5jbHVkZSAieGVfd29wY20uaCINCj4gPiA+IA0KPiA+ID4gICNk
ZWZpbmUgTUVESUFfR1VDX0hPU1RfSU5URVJSVVBUICAgICAgICBYRV9SRUcoMHgxOTAzMDQpDQo+
ID4gPiBAQCAtMTM2LDI5ICsxMzgsMjIgQEAgc3RhdGljIHUzMiBndWNfY3RsX3dhX2ZsYWdzKHN0
cnVjdCB4ZV9ndWMgKmd1YykNCj4gPiA+ICAJc3RydWN0IHhlX2d0ICpndCA9IGd1Y190b19ndChn
dWMpOw0KPiA+ID4gIAl1MzIgZmxhZ3MgPSAwOw0KPiA+ID4gDQo+ID4gPiAtCS8qIFdhXzIyMDEy
NzczMDA2OmdlbjExLGdlbjEyIDwgWGVIUCAqLw0KPiA+ID4gLQlpZiAoR1JBUEhJQ1NfVkVSKHhl
KSA+PSAxMSAmJg0KPiA+ID4gLQkgICAgR1JBUEhJQ1NfVkVSeDEwMCh4ZSkgPCAxMjUwKQ0KPiA+
ID4gKwlpZiAoWEVfV0EoeGUsICIyMjAxMjc3MzAwNiIsIEdSQVBISUNTX1ZFUlNJT05fUkFOR0Uo
MTEwMCwgMTI1MCkpKQ0KPiA+ID4gIAkJZmxhZ3MgfD0gR1VDX1dBX1BPTExDUzsNCj4gPiANCj4g
PiBKdXN0IGEgc3VnZ2VzdGlvbiBidXQgd291bGQgYmUgYmV0dGVyIHRvIGhhdmUgdGhlIHdvcmth
cm91bmQgcnVsZSBkZWZpbmVkIHNvbWV3aGVyZSBlbHNlIGFuZCBoZXJlIG9ubHkgaGF2ZSAnaWYg
KFhFX1dBKHhlLCAiMjIwMTI3NzMwMDYiKSknLg0KPiA+IA0KPiA+IA0KPiA+IE1lc2Egbm93IGhh
cyBzb21ldGhpbmcgbGlrZSB0aGF0Lg0KPiA+IFdlIGhhdmUgYSBQeXRob24gc2NyaXB0IHRoYXQg
Z2VuZXJhdGVzIGEgSlNPTiBmaWxlIHdpdGggd29ya2Fyb3VuZCBkYXRhIGZyb20gdGhlIHdvcmth
cm91bmQgZGF0YWJhc2UgQVBJLg0KPiA+IER1cmluZyBidWlsZCB0aW1lLCBhbm90aGVyIFB5dGhv
biBzY3JpcHQgZ2VuZXJhdGVzIHRoZSBpbnRlbF93YS5jIGZpbGUgdXNpbmcgdGhlIGluZm9ybWF0
aW9uIGluIEpTT04sIHNldHRpbmcgYSBiaXQgZm9yIGVhY2ggd29ya2Fyb3VuZCB0aGF0IGFwcGxp
ZXMNCj4gPiB0byBlYWNoIHBsYXRmb3JtLg0KPiA+IEluIHJ1bnRpbWUgaXQgZ2V0IHRoZSBiaXQg
ZmllbGQgd2l0aCB0aGUgd29ya2Fyb3VuZHMgdGhhdCBhcHBsaWVzIHRvIHJ1bm5pbmcgcGxhdGZv
cm0gb24gZ2l2ZW4gc3RlcHBpbmcuDQo+IA0KPiB0aGF0IGlzIG9uZSBvZiB0aGUgYWx0ZXJuYXRp
dmVzIEkgc2hhcmVkIGluIHRoZSBSRkMuIFRoZXJlIGFyZQ0KPiBzb21lIGlzc3VlcyB3aXRoIHN1
Y2ggYXBwcm9hY2ggdGhvdWdoOg0KPiANCj4gMSkgVGhlIGNvbmRpdGlvbiBpcyBpbiBhIHRvdGFs
bHkgZGlmZmVyZW50IHBsYWNlIHRoYSBoYXZlIHRvIGJlIGNoZWNrZWQNCj4gICAgIHRvIGZvbGxv
dyB0aGUgY29kZSBmbG93Lg0KPiANCj4gICAgIFRoZSB1cHNpZGUgaXMgdGhhdCBpZiB0aGUgc2Ft
ZSBjb25kaXRpb24gbmVlZHMgdG8gYmUgY2hlY2tlZCBhZ2FpbiBpbg0KPiAgICAgbXVsdGlwbGUg
cGxhY2VzIGZvciB0aGVzZSBPT0Igd29ya2Fyb3VuZHMsIHRoZSBjb25kaXRpb24gZG9lc24ndA0K
PiAgICAgbmVlZCB0byBiZSByZXBlYXRlZA0KPiANCj4gMikgTm90IHBvc3NpYmxlIHRvIGVuY29k
ZSBjb25kaXRpb25zIHRoYXQgYXJlIG5vdCBwbGF0Zm9ybS1jZW50cmljIG9yDQo+IHRoYXQgbmVl
ZHMgdG8gYmUgZGVjaWRlZCBpbiBydW50aW1lIChlLmcuIGlmIGFuIGVuZ2luZSBpcyBmdXNlZCBv
ZmYgb3INCj4gbm90KQ0KPiANCj4gPiBJbiBjb2RlIE1lc2Egd2UgaGF2ZSAnaWYgKGludGVsX25l
ZWRzX3dvcmthcm91bmQoZGV2aW5mbywgMTQwMTUwNTU2MjUpKScsIFhlIGttZCB3b3VsZCBwcm9i
YWJseSBuZWVkIGFkZGl0aW9uYWwgY2hlY2tzIGxpa2UgJ2lmIChlbmdpbmUgPT0gQkxJVCAmJg0K
PiA+IFhFX1dBKHhlLCAieHh4eHh4IikpJy4NCj4gDQo+IHllYWguLi4gdGhhdCBtYXliZSBzb2x2
ZXMgdGhlIGlzc3VlICgyKSBhYm92ZS4gV2UnZCBuZWVkIHRvIGxlYXZlIHRoZQ0KPiBub24tcGxh
dGZvcm0gY2hlY2tzIHRvIGVhY2ggY2FsbGVycy4gQW5kIG1heWJlIGZvbGxvdyB0aGUgc2FtZSBw
YXR0ZXJuDQo+IGZvciB0aGUgZ3QvZW5naW5lL2xyYyB3b3JrYXJvdW5kcy4NCj4gDQo+ID4gDQo+
ID4gVGhpcyBzb2x2ZSB0aGUgcHJvYmxlbSB3ZSBoYXZlIHdlcmUgd29ya2Fyb3VuZHMgYXJlIGxl
ZnQgZW5hYmxlZCBpbiBwbGF0Zm9ybXMgdGhhdCBhbHJlYWR5IGhhdmUgYSBIVyBmaXggZm9yIGl0
Lg0KPiANCj4gbm90IHN1cmUgaG93IHRoYXQgc29sdmVzIHRoaXMgaXNzdWUgdGhvdWdoLiBXZSBt
YXJrIHRoZSBzdGVwcGluZyBpbg0KPiB3aGljaCB0aGUgd29ya2Fyb3VuZCBhcmUgc3VwcG9zZWRs
eSBmaXhlZC4NCg0KTWVzYSBwcm9ibGVtcyB3YXMgd2l0aCBwZXJtYW5lbnQgd29ya2Fyb3VuZHMs
IGEgZXhhbXBsZToNCg0KU29tZSB3b3JrYXJvdW5kIGlzIHJlcXVpcmVkIGJ5IGFsbCBnZW4xMi4w
IGFuZCBkZzIgYW5kIHdhcyBpbXBsZW1lbnRlZCB3aXRoOiAnaWYgKGd0X3ZlciA+PSAxMiknIGJ1
dCB0aGVuIGl0IHdhcyBmaXhlZCBpbiBNVEwuDQpJdCBpcyBwcmV0dHkgZWFzeSB0byBmb3JnZXQg
dG8gdXBkYXRlIGl0Lg0KDQo+IA0KPiA+IA0KPiA+IE5vdCBzdXJlIGlmIHN1Y2ggdGhpbmsgd291
bGQgYmUgYWNjZXB0YWJsZSBpbiBMaW51eCwganVzdCBzaGFyaW5nIHdoYXQgTWVzYSBoYXZlIGRv
bmUuDQo+IA0KPiBHZW5lcmF0aW5nIGNvZGUgdG8gYmUgYnVpbHQgaXMgZG9uZSBpbiBhIGZldyBw
bGFjZXMgaW4gdGhlIGtlcm5lbA0KPiBJIGFscmVhZHkgc3VnZ2VzdGVkIGRvaW5nIHRoYXQgZm9y
IHRoZSByZWdpc3RlciBkZWZpbml0aW9ucywgYnV0DQo+IHRoZXJlIGFyZSBhbHdheXMgcHVzaCBi
YWNrLiAgSSB3aWxsIHRha2UgYSBsb29rIGF0IHRoaXMgYWdhaW4uDQo+IA0KPiBUaGFua3MNCj4g
THVjYXMgRGUgTWFyY2hpDQo+IA0KPiA+IA0KPiA+ID4gDQo+ID4gPiAtCS8qIFdhXzE2MDExNzU5
MjUzICovDQo+ID4gPiAtCS8qIFdhXzIyMDExMzgzNDQzICovDQo+ID4gPiAtCWlmIChJU19TVUJQ
TEFURk9STV9TVEVQKHhlLCBYRV9ERzIsIFhFX1NVQlBMQVRGT1JNX0RHMl9HMTAsIFNURVBfQTAs
IFNURVBfQjApKQ0KPiA+ID4gKwlpZiAoWEVfV0EoeGUsICIxNjAxMTc1OTI1MywgMjIwMTEzODM0
NDMiLA0KPiA+ID4gKwkJICBTVUJQTEFURk9STShERzIsIEcxMCksIFNURVAoQTAsIEIwKSkpDQo+
ID4gPiAgCQlmbGFncyB8PSBHVUNfV0FfR0FNX0NSRURJVFM7DQo+ID4gPiANCj4gPiA+IC0JLyog
V2FfMTQwMTQ0NzU5NTkgKi8NCj4gPiA+IC0JaWYgKElTX1BMQVRGT1JNX1NURVAoeGUsIFhFX01F
VEVPUkxBS0UsIFNURVBfQTAsIFNURVBfQjApIHx8DQo+ID4gPiAtCSAgICB4ZS0+aW5mby5wbGF0
Zm9ybSA9PSBYRV9ERzIpDQo+ID4gPiArCWlmIChYRV9XQSh4ZSwgIjE0MDE0NDc1OTU5W210bF0i
LCBQTEFURk9STShNRVRFT1JMQUtFKSwgU1RFUChBMCwgQjApKSB8fA0KPiA+ID4gKwkgICAgWEVf
V0EoeGUsICIxNDAxNDQ3NTk1OVtkZzJdIiwgUExBVEZPUk0oREcyKSkpDQo+ID4gPiAgCQlmbGFn
cyB8PSBHVUNfV0FfSE9MRF9DQ1NfU1dJVENIT1VUOw0KPiA+ID4gDQo+ID4gPiAgCS8qDQo+ID4g
PiAtCSAqIFdhXzE0MDEyMTk3Nzk3DQo+ID4gPiAtCSAqIFdhXzIyMDExMzkxMDI1DQo+ID4gPiAt
CSAqDQo+ID4gPiAgCSAqIFRoZSBzYW1lIFdBIGJpdCBpcyB1c2VkIGZvciBib3RoIGFuZCAyMjAx
MTM5MTAyNSBpcyBhcHBsaWNhYmxlIHRvDQo+ID4gPiAgCSAqIGFsbCBERzIuDQo+ID4gPiAgCSAq
Lw0KPiA+ID4gLQlpZiAoeGUtPmluZm8ucGxhdGZvcm0gPT0gWEVfREcyKQ0KPiA+ID4gKwlpZiAo
WEVfV0EoeGUsICIxNDAxMjE5Nzc5NywgMjIwMTEzOTEwMjUiLCBQTEFURk9STShERzIpKSkNCj4g
PiA+ICAJCWZsYWdzIHw9IEdVQ19XQV9EVUFMX1FVRVVFOw0KPiA+ID4gDQo+ID4gPiAgCS8qDQo+
ID4gPiBAQCAtMTY5LDI3ICsxNjQsMjAgQEAgc3RhdGljIHUzMiBndWNfY3RsX3dhX2ZsYWdzKHN0
cnVjdCB4ZV9ndWMgKmd1YykNCj4gPiA+ICAJaWYgKEdSQVBISUNTX1ZFUngxMDAoeGUpIDwgMTI3
MCkNCj4gPiA+ICAJCWZsYWdzIHw9IEdVQ19XQV9QUkVfUEFSU0VSOw0KPiA+ID4gDQo+ID4gPiAt
CS8qIFdhXzE2MDExNzc3MTk4ICovDQo+ID4gPiAtCWlmIChJU19TVUJQTEFURk9STV9TVEVQKHhl
LCBYRV9ERzIsIFhFX1NVQlBMQVRGT1JNX0RHMl9HMTAsIFNURVBfQTAsIFNURVBfQzApIHx8DQo+
ID4gPiAtCSAgICBJU19TVUJQTEFURk9STV9TVEVQKHhlLCBYRV9ERzIsIFhFX1NVQlBMQVRGT1JN
X0RHMl9HMTEsIFNURVBfQTAsDQo+ID4gPiAtCQkJCVNURVBfQjApKQ0KPiA+ID4gKwlpZiAoWEVf
V0EoeGUsICIxNjAxMTc3NzE5OFtkZzJfZzEwXSIsIFNVQlBMQVRGT1JNKERHMiwgRzEwKSwgU1RF
UChBMCwgQzApKSB8fA0KPiA+ID4gKwkgICAgWEVfV0EoeGUsICIxNjAxMTc3NzE5OFtkZzJfZzEx
XSIsIFNVQlBMQVRGT1JNKERHMiwgRzExKSwgU1RFUChBMCwgQjApKSkNCj4gPiA+ICAJCWZsYWdz
IHw9IEdVQ19XQV9SQ1NfUkVTRVRfQkVGT1JFX1JDNjsNCj4gPiA+IA0KPiA+ID4gLQkvKg0KPiA+
ID4gLQkgKiBXYV8yMjAxMjcyNzE3MA0KPiA+ID4gLQkgKiBXYV8yMjAxMjcyNzY4NQ0KPiA+ID4g
LQkgKi8NCj4gPiA+IC0JaWYgKElTX1NVQlBMQVRGT1JNX1NURVAoeGUsIFhFX0RHMiwgWEVfU1VC
UExBVEZPUk1fREcyX0cxMCwgU1RFUF9BMCwgU1RFUF9DMCkgfHwNCj4gPiA+IC0JICAgIElTX1NV
QlBMQVRGT1JNX1NURVAoeGUsIFhFX0RHMiwgWEVfU1VCUExBVEZPUk1fREcyX0cxMSwgU1RFUF9B
MCwNCj4gPiA+IC0JCQkJU1RFUF9GT1JFVkVSKSkNCj4gPiA+ICsJaWYgKFhFX1dBKHhlLCAiMjIw
MTI3MjcxNzAsIDIyMDEyNzI3Njg1IFtkZzJfZzEwXSIsIFNVQlBMQVRGT1JNKERHMiwgRzEwKSwg
U1RFUChBMCwgQzApKSB8fA0KPiA+ID4gKwkgICAgWEVfV0EoeGUsICIyMjAxMjcyNzE3MCwgMjIw
MTI3Mjc2ODUgW2RnMl9nMTFdIiwgU1VCUExBVEZPUk0oREcyLCBHMTEpLCBTVEVQKEEwLCBGT1JF
VkVSKSkpDQo+ID4gPiAgCQlmbGFncyB8PSBHVUNfV0FfQ09OVEVYVF9JU09MQVRJT047DQo+ID4g
PiANCj4gPiA+ICAJLyogV2FfMTYwMTU2NzU0MzgsIFdhXzE4MDIwNzQ0MTI1ICovDQo+ID4gPiAr
CS8qIEZJWE1FOiBjdXJyZW50bHkgdGhlcmUgaXMgbm8gc3VwcG9ydCBmb3IgZ3QgY2hlY2tzIGlu
IFhFX1dBKCkgKi8NCj4gPiA+ICAJaWYgKCF4ZV9od19lbmdpbmVfbWFza19wZXJfY2xhc3MoZ3Qs
IFhFX0VOR0lORV9DTEFTU19SRU5ERVIpKQ0KPiA+ID4gIAkJZmxhZ3MgfD0gR1VDX1dBX1JDU19S
RUdTX0lOX0NDU19SRUdTX0xJU1Q7DQo+ID4gPiANCj4gPiA+IC0JLyogV2FfMTUwOTM3MjgwNCAq
Lw0KPiA+ID4gLQlpZiAoSVNfUExBVEZPUk1fU1RFUCh4ZSwgWEVfUFZDLCBTVEVQX0IwLCBTVEVQ
X0MwKSkNCj4gPiA+ICsJaWYgKFhFX1dBKHhlLCAiMTUwOTM3MjgwNCIsIFBMQVRGT1JNKFBWQyks
IFNURVAoQjAsIEMwKSkpDQo+ID4gPiAgCQlmbGFncyB8PSBHVUNfV0FfUkVOREVSX1JTVF9SQzZf
RVhJVDsNCj4gPiA+IA0KPiA+ID4gIAlyZXR1cm4gZmxhZ3M7DQo+ID4gDQoNCg==
