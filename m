Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8F5AC4706C
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jan 2024 04:48:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 560C110E9F6;
	Fri, 12 Jan 2024 04:48:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38A0910E9FE
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jan 2024 04:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705034907; x=1736570907;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=gl6TSAmc0DhBQSqN3b1vbiQSCvlzRML0lYJvRfqTxmA=;
 b=RTpmctL72qhnLA0wXN9sQK/v9wxOBzOV9D717Yj6uldjCVslPVneGW8A
 D8vpVvG6xCz0OCCT+X9Q2FZ4iCabHbb3Hpv60xJnuKGnP2vjbZIaI1r2m
 0mWUfEa1kpEQznp9BeqJpZpdtOlmGWUtqAG1wquvxChwvMlrek67GZve9
 uXiP866KsJWVQvyD7jaBNTVU4giRPD0BT1/DBdL3r9WoXCEFw/XXPjn0J
 osXGBSdoy4pWNtVx8ZLDEVJXlFscGe/i8h2fxMkuMnCiuJUFz5CD/oVV0
 xpBKMR2UPV4tgqm/nxbQMx8zYuLCt3fAscwyH5UocT8nUuQ43ODgFUDrc w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="5844313"
X-IronPort-AV: E=Sophos;i="6.04,188,1695711600"; 
   d="scan'208";a="5844313"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2024 20:48:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="906216187"
X-IronPort-AV: E=Sophos;i="6.04,188,1695711600"; d="scan'208";a="906216187"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jan 2024 20:48:26 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 11 Jan 2024 20:48:25 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 11 Jan 2024 20:48:25 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 11 Jan 2024 20:48:25 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 11 Jan 2024 20:48:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QQmh16dRf/E26FYQfSc22qOK+tQztGBcI13iETAenkDZOkLrHhmkNtDcqOfVNAdVtrR9/+mojD9ysmWCA1QMW/T/J7ialAM2DMRTdNphnq2/l8aFJLRrzBjUBZePwNl7hRJtr1YfBmzunFaFonk/1MOPsPU/2T6gia3l/nivgCr4pWqwFchNKImXN/bTSJJcRTJkPS4J14B9UMPhU1CZ2Uhmk9FxoEeqkQItXbrmMVmd1Qe2FHJDiFB8J1L5VNQlo/JdFU9wU4XqzwRfb2Sth6deWpeq4Ee5BeN50nFEK2QuWN+rw5Zy8BpombaTrX9Vm5yYdoKWtL5S0xTa8HctWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gl6TSAmc0DhBQSqN3b1vbiQSCvlzRML0lYJvRfqTxmA=;
 b=leSjp5n65YXOG2Z2ODroPQlysakk0crBub6btMo/YqSy3XmaO/bRt7aQWkY3FUYbrkvK1TomCAN77grxmuxCWU5536n5F+0dDxc1M52gv4BdV89zjCRxFnXgEg+Q4fyluTdqctqV56MeIW/BLFt/RqOg5pLiAwWbD+lzCGaMfpUcGfGuu/jjwMUWAGP9s4E2CYKaei2QNekeb0U7kn3zWJn03gTobp4p2FGVHXkVwuknvN+sg7O854j1C/9CaIUZlSktgTUFMIPoWd5RrRDF4GarmiUZJrmb1Ey6HXu0FZmkFyQZ1XGpy91rRxSYP1QQoNRnguwJSm18wtzm4iAPPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by MW4PR11MB7126.namprd11.prod.outlook.com (2603:10b6:303:22b::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.21; Fri, 12 Jan
 2024 04:48:23 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1a4b:a930:2aac:11e7]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1a4b:a930:2aac:11e7%4]) with mapi id 15.20.7159.020; Fri, 12 Jan 2024
 04:48:22 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, "Zeng, Oak"
 <oak.zeng@intel.com>, "Welty, Brian" <brian.welty@intel.com>, "Brost,
 Matthew" <matthew.brost@intel.com>
Subject: RE: [PATCH] xe/xe_bo_move: Enhance xe_bo_move trace
Thread-Topic: [PATCH] xe/xe_bo_move: Enhance xe_bo_move trace
Thread-Index: AQHaP5hJYzJvU7XSoUGRRJZMDC8Ri7DQE6gAgAABuICABZBT0A==
Date: Fri, 12 Jan 2024 04:48:22 +0000
Message-ID: <CH3PR11MB8434B14B6CDB60D9DB3FAED38D6F2@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20240105052420.2389969-1-priyanka.dandamudi@intel.com>
 <beb1c5e0b197a6315d20c19ff70bcf9108eaac0b.camel@linux.intel.com>
 <8734v7ygdq.fsf@intel.com>
In-Reply-To: <8734v7ygdq.fsf@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|MW4PR11MB7126:EE_
x-ms-office365-filtering-correlation-id: 8f883b03-cb37-4278-ebc4-08dc1329b4d0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uHRheB/kbLKos1oA09GQQ3nXwY4N9b19/vL0LNvqbhffb+fHjFz8b8Q5d7YRE/TCl0a7c1FistykB8O4TF0A2/gmY4EkkPwewZIt3mUug7ywf6wvcHXii2d2t3qDF62KhHmH520EXsgFoUzrpo8SavbZEJrIH7iookBCvalxuPhun86riOBAQLXK4vPAuECIZaE4pRE2DQAmlsQNR2Zd+zbFBZh/5RxQ7Hr7fTvDJE4WoDB98LP01wKE3pI64eLh4zZu/yG8oYY7q0FehyQVoLKO0uFkR69HCgk8uRx9kyw2fxE7i4Cj6SQMRKe1/2T6n+TBbi4XXJycuIbuwU2nVZc/AeVvqIqZcjcxPdqpbOX0+Sb7gvwKE2S92wA62H5D1MZzjJx/bbZ1I/qonrvDdGukejYMRf5d6pi+XvJsBZ+3mUFcJIlqPUeT8FJ814/a9oMdJd/MSG32IURc/Je+/NuqjLtrny7vAyTqvxL/88oVWg6PiUHXHynIL6d1d6ifQkG8cnCl+tpL4H+Mpn3GO+1duR9vN/NbzvJ1BTzV6Y6u4WAyhb3SyuRMKyFNB2PkblQsP1DG9uVcrCgilzbYabXPgBYQb+x9yDuCzsl/fFNdxzI29cNu8OasNSw4FTE4
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(396003)(376002)(136003)(346002)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(53546011)(7696005)(6506007)(478600001)(71200400001)(38070700009)(26005)(66574015)(41300700001)(921011)(83380400001)(9686003)(5660300002)(110136005)(76116006)(33656002)(2906002)(38100700002)(82960400001)(8936002)(52536014)(6636002)(66946007)(66556008)(55016003)(66446008)(64756008)(66476007)(316002)(8676002)(122000001)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SDZlQ3ZpeGdlUGNWb2pRakJIejZoWWJ0dGY5RW1hYmQ2UHdxWmd1eWdNenpS?=
 =?utf-8?B?S0Y5Y3VxSi9yOGhMcGVVRzB0UlZLQmFUTEl3MjRUR2FZT3hTdGFSd3lLMzd5?=
 =?utf-8?B?SU5UVzlhWm40cHRJbWR1amFvaUVUZ0ZwbmxWeVprV0MrQjZ0OFZlMCtiaHBF?=
 =?utf-8?B?OWxPRHNKby94OUQ3bkpaOXUvYllhUFdNV3JBWmJRU2JjQnFWRWRlV24xaDFn?=
 =?utf-8?B?NExhSmRDbmVkejJQTlRCSkw3WGNZUmpOekR6SUNPUFJkZm0rY2lKTHBlN0lR?=
 =?utf-8?B?T2d1OHIrcTRBS2l1UE1GdjhkMlVGT3BZVSticFdzYUxvd2JGa0x2b2N1NTlt?=
 =?utf-8?B?VThpU2hxcE5UTnZLeUxWeE8ybEh6eGFRYnJwbTVlaGZkK01TTzgwKzU5Ujda?=
 =?utf-8?B?RFFOc1M5Rko4QXJibC9xOEtDLy9JM2svT0JtVFF0dDBrMTVtQk0rOXc5L3Rq?=
 =?utf-8?B?QVo3TFE4Y09NVXJMOHlPQ3Q2WElnYk0vbG0yaGVhS29kR2M5NEhyZmpHTHBH?=
 =?utf-8?B?L2trMXlOTWxHM1JoOWJNM1gxS3pYRmJFS3RFSk9xWklYVlFmcTJTR2VrbFlr?=
 =?utf-8?B?TVZCbVZRaVExdG5vRFRLdTYySUo2QVlnV0MzRnJGd2pTVFE1WmVRc1VJZ0tr?=
 =?utf-8?B?bW5kMDlJcytRd0dnc21pWTJtN1hkMkdtd1VEQUNCL2RIaHZ3RWxGN0JTWFEy?=
 =?utf-8?B?R3FmK1MvWHZ3YStvc09mR2I2YkIwTGtsY0paZlpzY216SHlsUjdLQXI4K3lM?=
 =?utf-8?B?TExKT0lYMC95RG5vY3d4NFIxNnV6ZVplN3UzUHFNYWdRNWhuMmtlcHdPczlO?=
 =?utf-8?B?VGt2dytRdHR2T1R1bFJMQkdROWg3QXVDa0dzVmRTTkFGbFRJekhpL1lQdTNX?=
 =?utf-8?B?Qk5pc2hvdHRmMjhSSWNtZ084N0FybGJ4eG1Hb21Tdk5tcjZpV2pXckxlb3BR?=
 =?utf-8?B?b0JMZHFua0VKczJOdStrNmhmeGo0d29IMTRZMEhzY2xvZmZQR296SENCSW4x?=
 =?utf-8?B?dmFqYmtXM2FYaTZOWHFCbHNDcW1aOFpLOXB2d0l4MWJMeFdJc1QxamxtSWJl?=
 =?utf-8?B?MENUTTE2M2RlaFRoN3hFUXBoS2xPWXQrcWh5R2JwL0EyNGNWOVFwQ3BWODVK?=
 =?utf-8?B?MXE4cmFSNWhDU2ZvT294NHJheXNwV0VDa0xvR3hDSjVoSUVUbmVjRmgwNkJ2?=
 =?utf-8?B?QUJQb2VxTmJleTFUTVlHdHVIMHZIQ3FaMTRoQ0FsOXRINUluckx5ZGMrSmlz?=
 =?utf-8?B?RG83cnVTa1p2TFFiMFRzTlo3L28ySlczaEdubE01ZzVPSUEvK3JnSnJFYkFS?=
 =?utf-8?B?SE9QM2crZFpRY1VsNGh4aDlzQkw5V3NNRlhVZFJvVTJYbjZyMnhGcTQwK0ZT?=
 =?utf-8?B?N2dvVTZ2UTh4cHpvaU9HQ2tML2lyRWFrOUFVa09jaDR5R2xISWMrcTU3M2c2?=
 =?utf-8?B?Qms4b0F6bW9UbjJIZmM1dXY0ZzJqdEpUS3hwM3BYc1JGQzBvY2kySHNLem0v?=
 =?utf-8?B?bXljbGhLRnRKZkJZTHZIRzFOU0s5RVRPL0R2dmFKZ2pWdVYzcmhyaGNJOFlp?=
 =?utf-8?B?VlJaVUV2UXA2WWdXRWNuSXM2bXpiRnM2NXUyNFIxSVFtSFZmODRBcGk2bHlN?=
 =?utf-8?B?bS8rQ1RNRndUZU1kbDdTbkczOVpmZkRqMm0rR0MxdmtnTzRWSFFac3dnSjVw?=
 =?utf-8?B?OFJEd3Y0SHZiOEd0S29ralI5b2hnbEE1ajBlcGorSTZUNlRaRmJoZ3NjUElQ?=
 =?utf-8?B?K1hVYWJQNlN0YXF1NzFTczE5R3Q2dHpaYWZrZ3l5RlhkUERIVWdXc1c3NFlt?=
 =?utf-8?B?Qlp3VE9yN3V2L0VZK2thSFN6SEYxZDlqRnZIdWFQQzZRdTRVNGZDZVJpcVc3?=
 =?utf-8?B?UjE3SXdacEpYQVo3aS9HSW5ZL0dITEtxVWM2SU05ZXFDNjJoY2gzbVdZMVJI?=
 =?utf-8?B?UDJNOS95ZjVNbWU5dVFkZGxaUi9KK1A4Q1VXM0hmZExTNVVCcEFQVG9xRWRl?=
 =?utf-8?B?ZkZsNlJKWWxNMStJTGxsZGxMaFA5alcxa1FMK0pSM3JKY1k4Tm9HUkw0RndO?=
 =?utf-8?B?UlFLdmRmOE5YN2lxeGNvOXI4eHpmYVR1UHNhUkZEMWhoK1FCcVlBK0d4WjFX?=
 =?utf-8?B?ZDhNdk9zMkY3bncrb0d5QjBsY2JOSEZyWTNwOUFWcU1DT013TG5xYTdCbDN0?=
 =?utf-8?B?R1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f883b03-cb37-4278-ebc4-08dc1329b4d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2024 04:48:22.7765 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 25FWVcPsrbgTNYIwBMFNpOTOjhtLVVb336gkc1oUuUVjOn4x3lyY72dVRWFb6XQ4cDvcstG7ejSe7CwOVj6Bl2e6rNtPsi7+iakaarinVhI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7126
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFuaSBOaWt1bGEgPGph
bmkubmlrdWxhQGxpbnV4LmludGVsLmNvbT4NCj4gU2VudDogTW9uZGF5LCBKYW51YXJ5IDgsIDIw
MjQgOToyMCBQTQ0KPiBUbzogVGhvbWFzIEhlbGxzdHLDtm0gPHRob21hcy5oZWxsc3Ryb21AbGlu
dXguaW50ZWwuY29tPjsgRGFuZGFtdWRpLA0KPiBQcml5YW5rYSA8cHJpeWFua2EuZGFuZGFtdWRp
QGludGVsLmNvbT47IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsNCj4gS2VtcGN6eW5z
a2ksIFpiaWduaWV3IDx6Ymlnbmlldy5rZW1wY3p5bnNraUBpbnRlbC5jb20+OyBaZW5nLCBPYWsN
Cj4gPG9hay56ZW5nQGludGVsLmNvbT47IFdlbHR5LCBCcmlhbiA8YnJpYW4ud2VsdHlAaW50ZWwu
Y29tPjsgQnJvc3QsDQo+IE1hdHRoZXcgPG1hdHRoZXcuYnJvc3RAaW50ZWwuY29tPg0KPiBTdWJq
ZWN0OiBSZTogW1BBVENIXSB4ZS94ZV9ib19tb3ZlOiBFbmhhbmNlIHhlX2JvX21vdmUgdHJhY2UN
Cj4gDQo+IE9uIE1vbiwgMDggSmFuIDIwMjQsIFRob21hcyBIZWxsc3Ryw7ZtDQo+IDx0aG9tYXMu
aGVsbHN0cm9tQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6DQo+ID4gT24gRnJpLCAyMDI0LTAxLTA1
IGF0IDEwOjU0ICswNTMwLCBwcml5YW5rYS5kYW5kYW11ZGlAaW50ZWwuY29tIHdyb3RlOg0KPiA+
PiBGcm9tOiBQcml5YW5rYSBEYW5kYW11ZGkgPHByaXlhbmthLmRhbmRhbXVkaUBpbnRlbC5jb20+
DQo+ID4+DQo+ID4+IEVuaGFuY2VkIHhlX2JvX21vdmUgdHJhY2UgdG8gYmUgbW9yZSByZWFkYWJs
ZS4NCj4gPj4gSXQgd2lsbCBoZWxwIHRvIHNob3cgdGhlIG1pZ3JhdGlvbiBkZXRhaWxzLg0KPiA+
PiBTcmMgYW5kIGRzdCBkZXRhaWxzLg0KPiA+Pg0KPiA+PiB2MjogTW9kaWZ5IHRyYWNlX3hlX2Jv
X21vdmUoKSwgaXQgdGFrZXMgdGhlIGludGVnZXIgbWVtX3R5cGUgcmF0aGVyDQo+ID4+IHRoYW4g
YSBzdHJpbmcuDQo+ID4+IE1ha2UgbWVtX3R5cGVfdG9fbmFtZSgpIGV4dGVybiwgaXQgd2lsbCBi
ZSB1c2VkIGJ5IHRyYWNlLihUaG9tYXMpDQo+ID4+DQo+ID4+IHYzOiBNb3ZlIG1lbV90eXBlX3Rv
X25hbWUoKSB0byB4ZV9iby5bY2hdIChUaG9tYXMsIE1hdHQpDQo+ID4+DQo+ID4+IENjOiBUaG9t
YXMgSGVsbHN0csO2bSA8dGhvbWFzLmhlbGxzdHJvbUBsaW51eC5pbnRlbC5jb20+DQo+ID4+IENj
OiBPYWsgWmVuZyA8b2FrLnplbmdAaW50ZWwuY29tPg0KPiA+PiBDYzogS2VtcGN6eW5za2kgWmJp
Z25pZXcgPFpiaWduaWV3LktlbXBjenluc2tpQGludGVsLmNvbT4NCj4gPj4gQ2M6IE1hdHRoZXcg
QnJvc3QgPG1hdHRoZXcuYnJvc3RAaW50ZWwuY29tPg0KPiA+PiBDYzogQnJpYW4gV2VsdHkgPGJy
aWFuLndlbHR5QGludGVsLmNvbT4NCj4gPj4gU2lnbmVkLW9mZi1ieTogUHJpeWFua2EgRGFuZGFt
dWRpIDxwcml5YW5rYS5kYW5kYW11ZGlAaW50ZWwuY29tPg0KPiA+PiAtLS0NCj4gPj4gwqBkcml2
ZXJzL2dwdS9kcm0veGUveGVfYm8uY8KgwqDCoMKgwqDCoMKgwqAgfCAxMSArKysrKysrKystLQ0K
PiA+PiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9iby5owqDCoMKgwqDCoMKgwqDCoCB8wqAgMSAr
DQo+ID4+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RybV9jbGllbnQuYyB8wqAgOCAtLS0tLS0t
LQ0KPiA+PiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV90cmFjZS5owqDCoMKgwqDCoCB8IDI0ICsr
KysrKysrKysrKysrKysrKysrKy0tLQ0KPiA+PiDCoDQgZmlsZXMgY2hhbmdlZCwgMzEgaW5zZXJ0
aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pDQo+ID4+DQo+ID4+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0veGUveGVfYm8uYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9iby5jDQo+ID4+IGlu
ZGV4IDhlNGEzYjFmNmI5My4uMTE1NGQ4ZjdiM2IxIDEwMDY0NA0KPiA+PiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0veGUveGVfYm8uYw0KPiA+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfYm8u
Yw0KPiA+PiBAQCAtMjgsNiArMjgsMTQgQEANCj4gPj4gwqAjaW5jbHVkZSAieGVfdHRtX3N0b2xl
bl9tZ3IuaCINCj4gPj4gwqAjaW5jbHVkZSAieGVfdm0uaCINCj4gPj4NCj4gPj4gK2NvbnN0IGNo
YXIgKmNvbnN0IG1lbV90eXBlX3RvX25hbWVbVFRNX05VTV9NRU1fVFlQRVNdwqAgPSB7DQo+ID4+
ICsJW1hFX1BMX1NZU1RFTV0gPSAic3lzdGVtIiwNCj4gPj4gKwlbWEVfUExfVFRdID0gImd0dCIs
DQo+ID4+ICsJW1hFX1BMX1ZSQU0wXSA9ICJ2cmFtMCIsDQo+ID4+ICsJW1hFX1BMX1ZSQU0xXSA9
ICJ2cmFtMSIsDQo+ID4+ICsJW1hFX1BMX1NUT0xFTl0gPSAic3RvbGVuIg0KPiA+PiArfTsNCj4g
Pj4gKw0KPiA+PiDCoHN0YXRpYyBjb25zdCBzdHJ1Y3QgdHRtX3BsYWNlIHN5c19wbGFjZW1lbnRf
ZmxhZ3MgPSB7DQo+ID4+IMKgCS5mcGZuID0gMCwNCj4gPj4gwqAJLmxwZm4gPSAwLA0KPiA+PiBA
QCAtNzEzLDggKzcyMSw3IEBAIHN0YXRpYyBpbnQgeGVfYm9fbW92ZShzdHJ1Y3QgdHRtX2J1ZmZl
cl9vYmplY3QNCj4gPj4gKnR0bV9ibywgYm9vbCBldmljdCwNCj4gPj4gwqAJCW1pZ3JhdGUgPSB4
ZS0+dGlsZXNbMF0ubWlncmF0ZTsNCj4gPj4NCj4gPj4gwqAJeGVfYXNzZXJ0KHhlLCBtaWdyYXRl
KTsNCj4gPj4gLQ0KPiA+PiAtCXRyYWNlX3hlX2JvX21vdmUoYm8pOw0KPiA+PiArCXRyYWNlX3hl
X2JvX21vdmUoYm8sIG5ld19tZW0tPm1lbV90eXBlLCBvbGRfbWVtX3R5cGUpOw0KPiA+PiDCoAl4
ZV9kZXZpY2VfbWVtX2FjY2Vzc19nZXQoeGUpOw0KPiA+Pg0KPiA+PiDCoAlpZiAoeGVfYm9faXNf
cGlubmVkKGJvKSAmJiAheGVfYm9faXNfdXNlcihibykpIHsgZGlmZiAtLWdpdA0KPiA+PiBhL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9iby5oIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2JvLmggaW5k
ZXgNCj4gPj4gOTdiMzI1MjhjNjAwLi5iZjc3YmYxN2U1MTkgMTAwNjQ0DQo+ID4+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9iby5oDQo+ID4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV9iby5oDQo+ID4+IEBAIC0yNDQsNiArMjQ0LDcgQEAgaW50IHhlX2JvX2V2aWN0X3Bpbm5lZChz
dHJ1Y3QgeGVfYm8gKmJvKTsNCj4gPj4gwqBpbnQgeGVfYm9fcmVzdG9yZV9waW5uZWQoc3RydWN0
IHhlX2JvICpibyk7DQo+ID4+DQo+ID4+IMKgZXh0ZXJuIHN0cnVjdCB0dG1fZGV2aWNlX2Z1bmNz
IHhlX3R0bV9mdW5jczsNCj4gPj4gK2V4dGVybiBjb25zdCBjaGFyICpjb25zdCBtZW1fdHlwZV90
b19uYW1lW107DQo+ID4NCj4gPiBOSVQ6IFdlIHNob3VsZCBuYW1lIHRoaXMgeGVfbWVtX3R5cGVf
dG9fbmFtZVtdIG5vdyB0aGF0IGl0J3MgZXh0ZXJuLg0KPiA+DQo+ID4gV2l0aCB0aGF0LA0KPiA+
IFJldmlld2VkLWJ5OiBUaG9tYXMgSGVsbHN0csO2bSA8dGhvbWFzLmhlbGxzdHJvbUBsaW51eC5p
bnRlbC5jb20+DQo+IA0KPiBGV0lXLCBpbiBpOTE1IGxhbmQgSSB3b3VsZCd2ZSByZXF1aXJlZCBj
b252ZXJ0aW5nIHRoYXQgdG8gYSBwcm9wZXIgZnVuY3Rpb24sDQo+IHdpdGggYm91bmRzIGNoZWNr
cyBldGMuDQo+IA0KPiBEYXRhIGlzIG5vdCBhbiBpbnRlcmZhY2UsIGFuZCBhbGwgdGhhdC4NCj4g
DQo+IEJSLA0KPiBKYW5pLg0KSSB0aGluayB3ZSBjYW4gbWFrZSB0aGlzIGFzIGFuIGVuaGFuY2Vt
ZW50IG9uIHRvcCBvZiB0aGlzLg0KUmVnYXJkcywNClByaXlhbmthDQo+IA0KPiA+DQo+ID4NCj4g
Pj4NCj4gPj4gwqBpbnQgeGVfZ2VtX2NyZWF0ZV9pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2
LCB2b2lkICpkYXRhLA0KPiA+PiDCoAkJCXN0cnVjdCBkcm1fZmlsZSAqZmlsZSk7DQo+ID4+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZHJtX2NsaWVudC5jDQo+ID4+IGIvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2RybV9jbGllbnQuYw0KPiA+PiBpbmRleCA4MmQxMzA1ZTgzMWYu
LjFhYzE0YzkxMDQ5MSAxMDA2NDQNCj4gPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2Ry
bV9jbGllbnQuYw0KPiA+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZHJtX2NsaWVudC5j
DQo+ID4+IEBAIC0xMzEsMTQgKzEzMSw2IEBAIHN0YXRpYyB2b2lkIGJvX21lbWluZm8oc3RydWN0
IHhlX2JvICpibywNCj4gPj4NCj4gPj4gwqBzdGF0aWMgdm9pZCBzaG93X21lbWluZm8oc3RydWN0
IGRybV9wcmludGVyICpwLCBzdHJ1Y3QgZHJtX2ZpbGUNCj4gPj4gKmZpbGUpDQo+ID4+IMKgew0K
PiA+PiAtCXN0YXRpYyBjb25zdCBjaGFyICpjb25zdA0KPiA+PiBtZW1fdHlwZV90b19uYW1lW1RU
TV9OVU1fTUVNX1RZUEVTXcKgID0gew0KPiA+PiAtCQlbWEVfUExfU1lTVEVNXSA9ICJzeXN0ZW0i
LA0KPiA+PiAtCQlbWEVfUExfVFRdID0gImd0dCIsDQo+ID4+IC0JCVtYRV9QTF9WUkFNMF0gPSAi
dnJhbTAiLA0KPiA+PiAtCQlbWEVfUExfVlJBTTFdID0gInZyYW0xIiwNCj4gPj4gLQkJWzQgLi4u
IDZdID0gTlVMTCwNCj4gPj4gLQkJW1hFX1BMX1NUT0xFTl0gPSAic3RvbGVuIg0KPiA+PiAtCX07
DQo+ID4+IMKgCXN0cnVjdCBkcm1fbWVtb3J5X3N0YXRzIHN0YXRzW1RUTV9OVU1fTUVNX1RZUEVT
XSA9IHt9Ow0KPiA+PiDCoAlzdHJ1Y3QgeGVfZmlsZSAqeGVmID0gZmlsZS0+ZHJpdmVyX3ByaXY7
DQo+ID4+IMKgCXN0cnVjdCB0dG1fZGV2aWNlICpiZGV2ID0gJnhlZi0+eGUtPnR0bTsgZGlmZiAt
LWdpdA0KPiA+PiBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV90cmFjZS5oIGIvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX3RyYWNlLmggaW5kZXgNCj4gPj4gOTUxNjNjMzAzZjNlLi5jNjZhOTFkZjdkOGIg
MTAwNjQ0DQo+ID4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV90cmFjZS5oDQo+ID4+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV90cmFjZS5oDQo+ID4+IEBAIC0xMiw2ICsxMiw3IEBA
DQo+ID4+IMKgI2luY2x1ZGUgPGxpbnV4L3RyYWNlcG9pbnQuaD4NCj4gPj4gwqAjaW5jbHVkZSA8
bGludXgvdHlwZXMuaD4NCj4gPj4NCj4gPj4gKyNpbmNsdWRlICJ4ZV9iby5oIg0KPiA+PiDCoCNp
bmNsdWRlICJ4ZV9ib190eXBlcy5oIg0KPiA+PiDCoCNpbmNsdWRlICJ4ZV9leGVjX3F1ZXVlX3R5
cGVzLmgiDQo+ID4+IMKgI2luY2x1ZGUgInhlX2dwdV9zY2hlZHVsZXJfdHlwZXMuaCINCj4gPj4g
QEAgLTEwMCw5ICsxMDEsMjYgQEAgREVGSU5FX0VWRU5UKHhlX2JvLCB4ZV9ib19jcHVfZmF1bHQs
DQo+ID4+IMKgCcKgwqDCoMKgIFRQX0FSR1MoYm8pDQo+ID4+IMKgKTsNCj4gPj4NCj4gPj4gLURF
RklORV9FVkVOVCh4ZV9ibywgeGVfYm9fbW92ZSwNCj4gPj4gLQnCoMKgwqDCoCBUUF9QUk9UTyhz
dHJ1Y3QgeGVfYm8gKmJvKSwNCj4gPj4gLQnCoMKgwqDCoCBUUF9BUkdTKGJvKQ0KPiA+PiArVFJB
Q0VfRVZFTlQoeGVfYm9fbW92ZSwNCj4gPj4gKwnCoMKgwqAgVFBfUFJPVE8oc3RydWN0IHhlX2Jv
ICpibywgdWludDMyX3QgbmV3X3BsYWNlbWVudCwNCj4gPj4gdWludDMyX3Qgb2xkX3BsYWNlbWVu
dCksDQo+ID4+ICsJwqDCoMKgIFRQX0FSR1MoYm8sIG5ld19wbGFjZW1lbnQsIG9sZF9wbGFjZW1l
bnQpLA0KPiA+PiArCcKgwqDCoCBUUF9TVFJVQ1RfX2VudHJ5KA0KPiA+PiArCQnCoMKgwqDCoCBf
X2ZpZWxkKHN0cnVjdCB4ZV9ibyAqLCBibykNCj4gPj4gKwkJwqDCoMKgwqAgX19maWVsZChzaXpl
X3QsIHNpemUpDQo+ID4+ICsJCcKgwqDCoMKgIF9fZmllbGQodTMyLCBuZXdfcGxhY2VtZW50KQ0K
PiA+PiArCQnCoMKgwqDCoCBfX2ZpZWxkKHUzMiwgb2xkX3BsYWNlbWVudCkNCj4gPj4gKwkJCSks
DQo+ID4+ICsNCj4gPj4gKwnCoMKgwqAgVFBfZmFzdF9hc3NpZ24oDQo+ID4+ICsJCcKgwqAgX19l
bnRyeS0+Ym/CoMKgwqDCoMKgID0gYm87DQo+ID4+ICsJCcKgwqAgX19lbnRyeS0+c2l6ZSA9IGJv
LT5zaXplOw0KPiA+PiArCQnCoMKgIF9fZW50cnktPm5ld19wbGFjZW1lbnQgPSBuZXdfcGxhY2Vt
ZW50Ow0KPiA+PiArCQnCoMKgIF9fZW50cnktPm9sZF9wbGFjZW1lbnQgPSBvbGRfcGxhY2VtZW50
Ow0KPiA+PiArDQo+ID4+ICsJCcKgwqAgKSwNCj4gPj4gKwnCoMKgwqAgVFBfcHJpbnRrKCJtaWdy
YXRlIG9iamVjdCAlcCBbc2l6ZSAlenVdIGZyb20gJXMgdG8gJXMiLA0KPiA+PiArCQnCoMKgwqDC
oMKgIF9fZW50cnktPmJvLCBfX2VudHJ5LT5zaXplLA0KPiA+PiBtZW1fdHlwZV90b19uYW1lW19f
ZW50cnktPm9sZF9wbGFjZW1lbnRdLA0KPiA+PiArCQnCoMKgwqDCoMKgIG1lbV90eXBlX3RvX25h
bWVbX19lbnRyeS0+bmV3X3BsYWNlbWVudF0pDQo+ID4+IMKgKTsNCj4gPj4NCj4gPj4gwqBERUNM
QVJFX0VWRU5UX0NMQVNTKHhlX2V4ZWNfcXVldWUsDQo+ID4NCj4gDQo+IC0tDQo+IEphbmkgTmlr
dWxhLCBJbnRlbA0K
