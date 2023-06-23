Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB1B9EB64D7
	for <intel-xe@archiver.kernel.org>; Fri, 23 Jun 2023 13:28:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AE6510E084;
	Fri, 23 Jun 2023 13:28:58 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07F0610E084
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Jun 2023 13:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687526937; x=1719062937;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jvX1nO2F18bx5mHdvjhXb6YeZiILux2Wie6CPm+PWYU=;
 b=O4iGyGkljbJ3gBNyXuf/gnArhxeTRJnUO3gNELuJrmBmLHWikjhJfllq
 iKdPTJDv1QMvHCF4qg38qwaI+KngfM4s56xyysLGlbhBoKni34pzcl2U5
 X5Nf0XN0E8yk2gmcNUbFoFLNZ/HxYHsPBGmiBBUeX+lnQ75lkCEuBhqfr
 FTOdsOQhyQQOwyhUaXlniBCYzt4f/JcJFSnnSBDSJlEvpP5UZonNNbeWw
 raueXx9JrBbKE5EObuFDhh7cjlQBHN4SrCTOA/+bDXf1pNCUEeKWN0Jxj
 9F2suWvb5KzGdTnPWMigPXHewPsPIDq0xI0Lhx7petoH0EBxu+BZYZdRZ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10750"; a="359631160"
X-IronPort-AV: E=Sophos;i="6.01,152,1684825200"; d="scan'208";a="359631160"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2023 06:28:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10750"; a="715318738"
X-IronPort-AV: E=Sophos;i="6.01,152,1684825200"; d="scan'208";a="715318738"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP; 23 Jun 2023 06:28:54 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 23 Jun 2023 06:28:54 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 23 Jun 2023 06:28:54 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 23 Jun 2023 06:28:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MGoSlwFe0UbuwIptsrZIRAfUvWuJwzK+74By1I20LxcdknPTP0xapaztiaPSenpdMEorLhqVogFdiV4pAYvWID7SB99/Jx46odjT5hzEEy0pa06uO0O+Say1UNTu+lEAFbjeBoXF3lLS/GOCkBIP4GkIYzxwYLEA7IarEwpIkrKJXAaD7sD2jphAri8VVo3PZSA4R655zEjJqpUetfIGmnEi7m8IoZ0DwqhtWrdz9aWwbewtz3NQOK9YGVQrZzUMJkWokXgfcO3IjvN2OoDNKPoNDPmbQCEyzGhFLDR6PtD05hP2mM98P77Egx5ryEdeoLNvjY34xel5XG+WLReLRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jvX1nO2F18bx5mHdvjhXb6YeZiILux2Wie6CPm+PWYU=;
 b=QWG4g4GZ6i5LNZwg7mci7zdVpStuefwbQi/uUjWvlIYBKRRFoM+pSxCf2nmfGH2Bbxi4UUdP+5umwOS5BAhpUuT4O0/sT8aO0ChPADTZtGkn0GMdCBPf11rZN6aiIxN/sR9tAGsgLh3MtRjhDqOyhQ9ZVTkHAOJQ7b6Rs+ZKGHagT9UKaAs1TVZFm3GBPGsbmMYqKfEGKM6Huzob5Sze97Db6Bui9gxr30xppXAdEE7qWwS2g+mB255Hx7BQ0579NniS7oeJGOve3+h54SfauqbhHnwvCKMm++OAFny4biI7c5vpmVgF/EPbqjfAm07ISBjLr9CsiGFHLXRgsoLp+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by IA0PR11MB7935.namprd11.prod.outlook.com (2603:10b6:208:40e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Fri, 23 Jun
 2023 13:28:50 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::3cc2:6622:cce5:cd02]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::3cc2:6622:cce5:cd02%5]) with mapi id 15.20.6521.024; Fri, 23 Jun 2023
 13:28:49 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [PATCH v2 5/5] drm/xe/pm: Init pcode and restore vram on power
 lost
Thread-Index: AQHZmTAGzC3njd58+UmfVocYcL0qra+LzAcAgAyuMUA=
Date: Fri, 23 Jun 2023 13:28:49 +0000
Message-ID: <CY5PR11MB6211291FFA824F8CB13FE4B09523A@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20230607110328.3739706-1-anshuman.gupta@intel.com>
 <20230607110328.3739706-6-anshuman.gupta@intel.com>
 <99fac071-4926-10d5-ef97-3a4164071671@intel.com>
In-Reply-To: <99fac071-4926-10d5-ef97-3a4164071671@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|IA0PR11MB7935:EE_
x-ms-office365-filtering-correlation-id: ab1bab5d-77f5-433e-6d12-08db73edc7b2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NOl0heVopf4p1RQjMB+pdZjIBudzmDKqhvgB8Y2Zt+E4Xj4lZ+nFxmDsT/uKdf8aB21GEZasaJJOQstWsHBD59QCCgaDuOzXaW+n0r1sB40Lgqx31pynpwEPfHOQzxrjmIWxKYswhy1KrAUBs4V1d6HZgVggGJdNcz2XEN/JM5JplsaQy4BYxSU+srNZemuyuOycJfZBaNlgktzjffu3JfdkgKENACnJY4Yzz0bSni476m1+7MY+xqRrT/ULbnlY6lz+7jg351ustGwNWdBlGxX8VKdf7WYSdcrFTKzTkcZ5P0B59nzYk85UwRPAPfmbINyjOUMMFnbjGvLjR06c2nhRMoKNQW23cTgDsp9j5Z3UXQV59EAizPgapk8Ujpel5IWMT9g+3xA57LR0+3OgQkWdzpxcdEEJEf3uuofAMYDpOFmkIb7jvEen6N3AcAIcTsGPJ07Vyj9bCFAmClxIN2DAdv3vJBG9H1r7pfcI1c+cN0H2QhK3O8iF1FsPldhyCZnvO+T+bFPip48m3Ud9kI+9ebYIafE2KrfnZRFJ+c6Toy4h3Lr/2sJzh4hNP56NWfv1Pu2BRQ6tY4VHp4DHtgeKbYUDPnsfbUwZl8zIiGiv32aXDOL6uzRP3YDgHi6FuGO82U8fte4ujk1KscOWUutl5TMjC9Fp7+Mt/cFzt6U=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(366004)(39860400002)(136003)(346002)(396003)(451199021)(2906002)(7696005)(71200400001)(38100700002)(82960400001)(83380400001)(107886003)(122000001)(6506007)(26005)(53546011)(186003)(9686003)(55016003)(41300700001)(110136005)(54906003)(86362001)(38070700005)(478600001)(316002)(76116006)(66556008)(4326008)(66446008)(66946007)(8936002)(8676002)(64756008)(66476007)(33656002)(52536014)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dGZGbjdCbDlOTnVaMVpYZmhqc00xQzFIZEFvQWh6eDdROHdWbEtEN1pFM3g5?=
 =?utf-8?B?MGVqRGlVZmNPamlkLzM1dm1VYm1OSWd6R2JxcVVtZDNlWVVFU1RPTHdKS0Rv?=
 =?utf-8?B?YjRDcFdoQS90aWYxRForOSsyTFQ4endsYTZrK0crN0hYc2U3Q3dWS0UxaXZO?=
 =?utf-8?B?YjZ2cm9Hb2JoY0hKaWE2VEVJTmFYZG9UTUJPSHI5TVNKUlc1bm9IazdSQm10?=
 =?utf-8?B?TTZGVU9UbTRVNEIxN3FNSTFvNVJZSTVYSkk4QVZVK1ZvaDRaOEQ1d2FGMU4z?=
 =?utf-8?B?MlZoT1lBcEgrdTlmbUZ2aUNiOG1QR3Vxbk9XemZtZ1FMbHo3Y2FXR2h2MGdt?=
 =?utf-8?B?N2RGMGVVOEtQVUFkRTZBa1JzQU95clJmUXBaaVFublBBWkNyS1Y1NUNrb1lU?=
 =?utf-8?B?R2lJdERNU1ZUNVorYnFIZlNtRzlGZXpNeU0wMklNa2VKdnNRMTRHZXhtT0lR?=
 =?utf-8?B?cW84bHV6N0xuQ0cxeUp6dkx4V0FrVGhzUE9uQllHUHVtTFE4U0hxT0orVSs5?=
 =?utf-8?B?Vmhlekt6N05DZmxrZ1lkLzlQNURHMGl2RngyYnJPTEFzVEhZRTJ6YVFNL3Jm?=
 =?utf-8?B?V2tYRFN1NFNOQmN3QU5QdTBTUUltdFNZWWRMY241SDlIZGtuakUvSjVRdjZz?=
 =?utf-8?B?Q01RbksweDBtQkxKQ3lvbWY3d3ZicEJuWUd5U2tMSkFTRENuNTJ2N2R3RDE5?=
 =?utf-8?B?QnNFaWVCclViM09SS2FySmZ3dG8ydDFiRmpCRGJNcWh4b0FLeFh4V3JXeDJK?=
 =?utf-8?B?N21TNU5FTlNpSkFMVGQvVFNBZEN1N0RxNG5rMlQ0Y3Jnc0N3dUdtQ1ZLNHVS?=
 =?utf-8?B?SUxtSmY1aUFKNDAwMUNBRE1TaDZ2LzZjVEZ0dlhyV3l1eXhtQ21tU1Q4TFlR?=
 =?utf-8?B?UmU3a1BOdjJ6NlZiUlQ4V1lGWmEzWEtSdWdubUxmTTVheHVSc2g3bVRKL0tQ?=
 =?utf-8?B?Y3U3L0pySUpwN2YycDcxaHVEdnlSTkVQZ203NHBGczRwYTBydFpLRUNmOHRG?=
 =?utf-8?B?TnM1cFRzSVpiZ0ZmVlh1a1hCbUl3dzcwVkFST2F2NEp2WDJpR1hHVHFCNU0v?=
 =?utf-8?B?R2F3VlFpMVYxZytEWVArQXNpNHNFNkxwa1p2UTMzOWZjUTdjNFUrdzVPQmdG?=
 =?utf-8?B?TmlnOWQwbWVYdnlFUld2QzZ6a2JpZ3A4RG5LS0UyTXAzNitBa0lkdGlJZEp5?=
 =?utf-8?B?TDdGZWo0cDJZeTdraUNhak94K3RXYkIwcXBEYmgrOWxMMVpUcVFNU2pVNjJs?=
 =?utf-8?B?ZXJRb3dGVEdMMVNFK05vbkNWWjB5Ujd2MlA3Ynh6WUlSOHZrWHFiSk93RWZ6?=
 =?utf-8?B?bXFmdE1nK1lkTmM4eWpEOWNLbTVMVFhwaWdVTU9XVC9XL1VlS1F5ZjgwSkdz?=
 =?utf-8?B?ejZYUHBXNzM4aGVESkUrcnVsK3JQMWhkallJdUIzVU1KL3JWbHFJZ21mZDhZ?=
 =?utf-8?B?T25xalBvT1haazdZTkVyUmd0S2JhMmhZR2tQcUpIbVpEK1dQYXhCWWQ2cmdE?=
 =?utf-8?B?R0xMNG4zUVZ1ZFRnTEtnOUlNL0tNbmRDY1ZaSjk3NXpuQThxdDRJYkdVL3Bi?=
 =?utf-8?B?QjBMd2RkMzhHUTFRSXZXNy9pdEd4UXNJZjZzUVVoWjlIRXB3azYybnBkWWo2?=
 =?utf-8?B?T2trT00zdHQrZzZ5S0JPU24vZHhNMkgySkZCYzFLMnhDRUN6VUtXTFJSVnBC?=
 =?utf-8?B?MTM3NlN6bzJsc09CYysyZW9jcnA4NFkza2w1UnIra2V4QnZsTjJSRHppRStl?=
 =?utf-8?B?ZVZmVTRvaS9VUU0zNGZlV3pPS3EzYmxIUms4bU9oUFArNENBaVBEOUwzQldx?=
 =?utf-8?B?LzBpS05jcGVGK1ZncFFMVGw4UWRVeEoxK3pUWW9UcXVZRStGL2JHT2Z6REMy?=
 =?utf-8?B?SzVHS0FSUnk5MjZQcWxMMkp0UFFXSHl2dTErelpYTXFOZzlJYTBWRGwzSnk3?=
 =?utf-8?B?ZVUvRG9rK09Fd3YxazhINWYrUkpERzlnY2Q3amh1TW5rNkJjQWFpNVFLSWhj?=
 =?utf-8?B?ZndrS2NpVUpYNm1jemV0UnNhM09QcTZwWGhRL25qUDk2ZTZydHFHcWlCZnNa?=
 =?utf-8?B?TS9rWVRxU3pkNnVDMlZzUG11QVNrNGMxWlliMmdTdzJXa2dnTVN4clJLUWRN?=
 =?utf-8?Q?Fj/qTOF7uhGJZd9L805YICfNB?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab1bab5d-77f5-433e-6d12-08db73edc7b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2023 13:28:49.7533 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zaFTxEUfrN6t5PixssNN2eZR08Qn3YhRWZ51z6T43rwqFZ1m0WAd44GQSSW0F158jYSi0Azs2fahf95IkCZz3ugsTuW9TctYuRDp3mEUQAI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7935
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 5/5] drm/xe/pm: Init pcode and restore
 vram on power lost
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
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTmlsYXdhciwgQmFkYWwg
PGJhZGFsLm5pbGF3YXJAaW50ZWwuY29tPg0KPiBTZW50OiBUaHVyc2RheSwgSnVuZSAxNSwgMjAy
MyA1OjE4IFBNDQo+IFRvOiBHdXB0YSwgQW5zaHVtYW4gPGFuc2h1bWFuLmd1cHRhQGludGVsLmNv
bT47IGludGVsLQ0KPiB4ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IFZpdmksIFJvZHJp
Z28gPHJvZHJpZ28udml2aUBpbnRlbC5jb20+OyBUYXVybywgUmlhbmENCj4gPHJpYW5hLnRhdXJv
QGludGVsLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiA1LzVdIGRybS94ZS9wbTogSW5p
dCBwY29kZSBhbmQgcmVzdG9yZSB2cmFtIG9uDQo+IHBvd2VyIGxvc3QNCj4gDQo+IA0KPiANCj4g
T24gMDctMDYtMjAyMyAxNjozMywgQW5zaHVtYW4gR3VwdGEgd3JvdGU6DQo+ID4gRG9uJ3QgaW5p
dCBwY29kZSBhbmQgcmVzdG9yZSBWUkFNIG9iamVjdHMgaW4gdmFpbi4NCj4gPiBXZSBjYW4gcmVs
eSBvbiBwcmltYXJ5IEdUIEdVQ19TVEFUVVMgdG8gZGV0ZWN0IHdoZXRoZXIgY2FyZCBoYXMgcmVh
bGx5DQo+ID4gbG9zdCBwb3dlciBldmVuIHdoZW4gZDNjb2xkIGlzIGFsbG93ZWQgYnkgeGUuDQo+
ID4gQWRkaW5nIGQzY29sZC5sb3N0X3Bvd2VyIGZsYWcgdG8gYXZvaWQgcGNvZGUgaW5pdCBhbmQg
dnJhbQ0KPiA+IHJlc3RvcmF0aW9uLg0KPiA+IEFsc28gY2xlYW5pbmcgdXAgdGhlIFRPRE8gY29k
ZSBjb21tZW50Lg0KPiA+DQo+ID4gQ2M6IFJvZHJpZ28gVml2aSA8cm9kcmlnby52aXZpQGludGVs
LmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBBbnNodW1hbiBHdXB0YSA8YW5zaHVtYW4uZ3VwdGFA
aW50ZWwuY29tPg0KVGhhbmtzIGZvciByZXZpZXcuDQo+ID4gLS0tDQo+ID4gICBkcml2ZXJzL2dw
dS9kcm0veGUveGVfZGV2aWNlX3R5cGVzLmggfCAgMyArKysNCj4gPiAgIGRyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9ndWMuYyAgICAgICAgICB8IDE3ICsrKysrKysrKysrKysrKysrDQo+ID4gICBkcml2
ZXJzL2dwdS9kcm0veGUveGVfZ3VjLmggICAgICAgICAgfCAgMSArDQo+ID4gICBkcml2ZXJzL2dw
dS9kcm0veGUveGVfcGNpLmMgICAgICAgICAgfCAgMiAtLQ0KPiA+ICAgZHJpdmVycy9ncHUvZHJt
L3hlL3hlX3BtLmMgICAgICAgICAgIHwgMTUgKysrKysrKysrKysrLS0tDQo+ID4gICA1IGZpbGVz
IGNoYW5nZWQsIDMzIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZV90eXBlcy5oDQo+ID4gYi9kcml2
ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlX3R5cGVzLmgNCj4gPiBpbmRleCBiZGQwOTNkMzA3ODgu
LjM0YmYyZWEzYjNmOSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2
aWNlX3R5cGVzLmgNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlX3R5cGVz
LmgNCj4gPiBAQCAtMzgyLDYgKzM4Miw5IEBAIHN0cnVjdCB4ZV9kZXZpY2Ugew0KPiA+ICAgCQkv
KiogQGFsbG93ZWQ6IEluZGljYXRlcyBpZiBkM2NvbGQgaXMgYSB2YWxpZCBkZXZpY2Ugc3RhdGUg
Ki8NCj4gPiAgIAkJYm9vbCBhbGxvd2VkOw0KPiA+DQo+ID4gKwkJLyoqIEBwb3dlcl9sb3N0IElu
ZGljYXRlcyBpZiBjYXJkIGhhcyByZWFsbHkgbG9zdCBwb3dlci4gKi8NCj4gPiArCQlib29sIHBv
d2VyX2xvc3Q7DQo+ID4gKw0KPiA+ICAgCQkvKioNCj4gPiAgIAkJICogQHZyYW1fdGhyZXNob2xk
IGlzIHRoZSBwZXJtaXNzaWJsZSB0aHJlc2hvbGQoaW4NCj4gbWVnYWJ5dGVzKQ0KPiA+ICAgCQkg
KiBmb3IgdnJhbSBzYXZlL3Jlc3RvcmUuIGQzY29sZCB3aWxsIGJlIGRpc2FsbG93ZWQsIGRpZmYg
LS1naXQNCj4gPiBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWMuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9ndWMuYyBpbmRleA0KPiA+IGU1MWQ4ZmI0YTM1NC4uNzA2YjNiYzA0NTJlIDEwMDY0
NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWMuYw0KPiA+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9ndWMuYw0KPiA+IEBAIC04NDgsMyArODQ4LDIwIEBAIHZvaWQgeGVf
Z3VjX3ByaW50X2luZm8oc3RydWN0IHhlX2d1YyAqZ3VjLCBzdHJ1Y3QNCj4gZHJtX3ByaW50ZXIg
KnApDQo+ID4gICAJeGVfZ3VjX2N0X3ByaW50KCZndWMtPmN0LCBwLCBmYWxzZSk7DQo+ID4gICAJ
eGVfZ3VjX3N1Ym1pdF9wcmludChndWMsIHApOw0KPiA+ICAgfQ0KPiA+ICsNCj4gPiArLyogU3J0
aWN0bHkgdG8gY2FsbGVkIGZyb20gUlBNIHJlc3VtZSBoYW5kbGVyICovIGJvb2wNCj4gPiAreGVf
Z3VjX2hhc19sb3N0X3Bvd2VyKHN0cnVjdCB4ZV9ndWMgKmd1Yykgew0KPiA+ICsJc3RydWN0IHhl
X2d0ICpndCA9IGd1Y190b19ndChndWMpOw0KPiA+ICsJdTMyIHN0YXR1czsNCj4gPiArCWludCBl
cnI7DQo+ID4gKw0KPiA+ICsJZXJyID0geGVfZm9yY2Vfd2FrZV9nZXQoZ3RfdG9fZncoZ3QpLCBY
RV9GV19HVCk7DQo+ID4gKwlpZiAoZXJyKQ0KPiA+ICsJCXJldHVybiBmYWxzZTsNCj4gPiArDQo+
ID4gKwlzdGF0dXMgPSB4ZV9tbWlvX3JlYWQzMihndCwgR1VDX1NUQVRVUyk7DQo+ID4gKwl4ZV9m
b3JjZV93YWtlX3B1dChndF90b19mdyhndCksIFhFX0ZXX0dUKTsNCj4gU2hvdWxkIGVycm9yIGNo
ZWNrIGJlIGFkZGVkIGhlcmUgYXMgd2VsbD8NClByZXZpb3VzIGVycm9yIGNoZWNrIGlzIHJlcXVp
cmVkIHRvIG1ha2Ugc3VyZSBmb3JjZXdha2UgaXMgdGFrZW4sIGJlZm9yZSByZWFkaW5nIHRoZSBH
VUNfU1RBVFVTLg0KX3B1dCBlcnJvciBjaGVjayBkb2VzIG5vdCBoYXZlIGFueSBpbXBhY3Qgb24g
cG93ZXIgbG9zdCBmbGFnLg0KVGhhbmtzLA0KQW5zaHVtYW4gR3VwdGEuIA0KPiBSZWdhcmRzLA0K
PiBCYWRhbA0KPiA+ICsNCj4gPiArCXJldHVybiAgc3RhdHVzICYgR1NfTUlBX0lOX1JFU0VUOw0K
PiA+ICt9DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWMuaCBiL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9ndWMuaA0KPiA+IGluZGV4IDc0YTc0MDUxZjM1NC4uM2U2Mjhi
YmJlNjllIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWMuaA0KPiA+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWMuaA0KPiA+IEBAIC0zNSw2ICszNSw3IEBA
IHZvaWQgeGVfZ3VjX3Jlc2V0X3dhaXQoc3RydWN0IHhlX2d1YyAqZ3VjKTsNCj4gPiAgIHZvaWQg
eGVfZ3VjX3N0b3BfcHJlcGFyZShzdHJ1Y3QgeGVfZ3VjICpndWMpOw0KPiA+ICAgaW50IHhlX2d1
Y19zdG9wKHN0cnVjdCB4ZV9ndWMgKmd1Yyk7DQo+ID4gICBpbnQgeGVfZ3VjX3N0YXJ0KHN0cnVj
dCB4ZV9ndWMgKmd1Yyk7DQo+ID4gK2Jvb2wgeGVfZ3VjX2hhc19sb3N0X3Bvd2VyKHN0cnVjdCB4
ZV9ndWMgKmd1Yyk7DQo+ID4NCj4gPiAgIHN0YXRpYyBpbmxpbmUgdTE2IHhlX2VuZ2luZV9jbGFz
c190b19ndWNfY2xhc3MoZW51bSB4ZV9lbmdpbmVfY2xhc3MNCj4gY2xhc3MpDQo+ID4gICB7DQo+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wY2kuYyBiL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV9wY2kuYw0KPiA+IGluZGV4IDZjZjY2Y2UyNTAzOS4uYjVjZDNiNjljOThlIDEw
MDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wY2kuYw0KPiA+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9wY2kuYw0KPiA+IEBAIC04MjksOCArODI5LDYgQEAgc3RhdGlj
IGludCB4ZV9wY2lfcnVudGltZV9pZGxlKHN0cnVjdCBkZXZpY2UgKmRldikNCj4gPiAgIAkJICog
YnV0IG1heWJlIGluY2x1ZGUgc29tZSBvdGhlciBjb25kaXRpb25zLiBTbywgYmVmb3JlDQo+ID4g
ICAJCSAqIHdlIGNhbiByZS1lbmFibGUgdGhlIEQzY29sZCwgd2UgbmVlZCB0bzoNCj4gPiAgIAkJ
ICogMS4gcmV3cml0ZSB0aGUgVlJBTSBzYXZlIC8gcmVzdG9yZSB0byBhdm9pZCBidWZmZXIgb2Jq
ZWN0DQo+IGxvY2tzDQo+ID4gLQkJICogMi4gYXQgcmVzdW1lLCBkZXRlY3QgaWYgd2UgcmVhbGx5
IGxvc3QgcG93ZXIgYW5kIGF2b2lkDQo+IG1lbW9yeQ0KPiA+IC0JCSAqICAgIHJlc3RvcmF0aW9u
IGlmIHdlIHdlcmUgb25seSB1cCB0byBkM2NvbGQNCj4gPiAgIAkJICovDQo+ID4gICAJCXhlLT5k
M2NvbGQuYWxsb3dlZCA9IGZhbHNlOw0KPiA+ICAgCX0NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX3BtLmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcG0uYw0KPiA+IGlu
ZGV4IDk4NzJhODAwYjBiMy4uZTM3ZWM4YWNhNjA5IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9wbS5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BtLmMN
Cj4gPiBAQCAtMTYsNiArMTYsNyBAQA0KPiA+ICAgI2luY2x1ZGUgInhlX2Rpc3BsYXkuaCINCj4g
PiAgICNpbmNsdWRlICJ4ZV9nZ3R0LmgiDQo+ID4gICAjaW5jbHVkZSAieGVfZ3QuaCINCj4gPiAr
I2luY2x1ZGUgInhlX2d1Yy5oIg0KPiA+ICAgI2luY2x1ZGUgInhlX2lycS5oIg0KPiA+ICAgI2lu
Y2x1ZGUgInhlX3Bjb2RlLmgiDQo+ID4NCj4gPiBAQCAtMTkyLDExICsxOTMsMTkgQEAgaW50IHhl
X3BtX3J1bnRpbWVfc3VzcGVuZChzdHJ1Y3QgeGVfZGV2aWNlDQo+ICp4ZSkNCj4gPg0KPiA+ICAg
aW50IHhlX3BtX3J1bnRpbWVfcmVzdW1lKHN0cnVjdCB4ZV9kZXZpY2UgKnhlKQ0KPiA+ICAgew0K
PiA+IC0Jc3RydWN0IHhlX2d0ICpndDsNCj4gPiArCXN0cnVjdCB4ZV9ndCAqZ3QsICpndDA7DQo+
ID4gICAJdTggaWQ7DQo+ID4gICAJaW50IGVycjsNCj4gPg0KPiA+IC0JaWYgKHhlLT5kM2NvbGQu
YWxsb3dlZCkgew0KPiA+ICsJLyoNCj4gPiArCSAqIEl0IGNhbiBiZSBwb3NzaWJsZSB0aGF0IHhl
IGhhcyBhbGxvd2VkIGQzY29sZCBidXQgb3RoZXIgcGNpZSBkZXZpY2VzDQo+ID4gKwkgKiBpbiBn
ZnggY2FyZCBzb2Mgd291bGQgaGF2ZSBibG9ja2VkIGQzY29sZCwgdGhlcmVmb3JlIGNhcmQgaGFz
IG5vdA0KPiA+ICsJICogcmVhbGx5IGxvc3QgcG93ZXIuIERldGVjdGluZyBwcmltYXJ5IEd0IHBv
d2VyIGlzIHN1ZmZpY2llbnQuDQo+ID4gKwkgKi8NCj4gPiArCWd0MCA9IHhlX2RldmljZV9nZXRf
Z3QoeGUsIDApOw0KPiA+ICsJeGUtPmQzY29sZC5wb3dlcl9sb3N0ID0geGVfZ3VjX2hhc19sb3N0
X3Bvd2VyKCZndDAtPnVjLmd1Yyk7DQo+ID4gKw0KPiA+ICsJaWYgKHhlLT5kM2NvbGQuYWxsb3dl
ZCAmJiB4ZS0+ZDNjb2xkLnBvd2VyX2xvc3QpIHsNCj4gPiAgIAkJZm9yX2VhY2hfZ3QoZ3QsIHhl
LCBpZCkgew0KPiA+ICAgCQkJZXJyID0geGVfcGNvZGVfaW5pdChndCk7DQo+ID4gICAJCQlpZiAo
ZXJyKQ0KPiA+IEBAIC0yMTcsNyArMjI2LDcgQEAgaW50IHhlX3BtX3J1bnRpbWVfcmVzdW1lKHN0
cnVjdCB4ZV9kZXZpY2UgKnhlKQ0KPiA+ICAgCWZvcl9lYWNoX2d0KGd0LCB4ZSwgaWQpDQo+ID4g
ICAJCXhlX2d0X3Jlc3VtZShndCk7DQo+ID4NCj4gPiAtCWlmICh4ZS0+ZDNjb2xkLmFsbG93ZWQp
IHsNCj4gPiArCWlmICh4ZS0+ZDNjb2xkLmFsbG93ZWQgJiYgeGUtPmQzY29sZC5wb3dlcl9sb3N0
KSB7DQo+ID4gICAJCWVyciA9IHhlX2JvX3Jlc3RvcmVfdXNlcih4ZSk7DQo+ID4gICAJCWlmIChl
cnIpDQo+ID4gICAJCQlyZXR1cm4gZXJyOw0K
