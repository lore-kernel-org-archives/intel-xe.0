Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E45606A325
	for <intel-xe@archiver.kernel.org>; Tue, 10 Nov 2026 12:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VxMDmLFY
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E515410E92E;
	Tue, 10 Nov 2026 12:02:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D81AF10E2C6;
 Tue, 10 Nov 2026 12:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794312119; x=1825848119;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=W74oJItnMbrgqCmPs4fRqdpxTAwe+BZR9yNy2N0u4IU=;
 b=VxMDmLFYE99GD3jtUjFikiVMJSP+R1oCbQpWTgbvkwGxZrAs/7bRRwWF
 4qj/3fZ75rRv3xGpPz/MgbuRYolXoa9Hu2tqUgFRhcZVUUngBU0nK+IzJ
 1R4vDdr9EphCzWqItaRB+xv+2PjB/aIssRn6d/1yic7bJrTSUc0Ee24J9
 Cf6HP88jxmR4BTffZRVcK6nmjrkbmxQfdVRJ5swJ31GhgRgEUKlTsckyT
 sQGtpFYsUEr+omCcQRlfWDYdqkR/HrmI2wY52a2FeJR6RZyEfuS9UuBXP
 pErzhGQNwGh4C+7o3TGUgwywRsdf/i2IcT1fc+DTSIEQ0FC9KHs+48H6X A==;
X-CSE-ConnectionGUID: cPou8XkcTe2MsM3q/geOUA==
X-CSE-MsgGUID: XAoI/4JiSqyeMvm2iHM+Kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2948014"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="2948014"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 04:01:57 -0800
X-CSE-ConnectionGUID: FQlC/2Y1Sqqnssf3C6VgVw==
X-CSE-MsgGUID: fHXZffMjTFan0X0CsUjUNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="8438579"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 04:01:57 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 10 Nov 2026 04:01:56 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 10 Nov 2026 04:01:56 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.18) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 10 Nov 2026 04:01:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pV9c1WEWJTVua20tyJ3A9tv+mDlISama/D2tDxgTnKjp5tFWzQJPk6L6gDkj7hcuvrYwpwJqgg1pEjXqEeqn5f8KEY5Krw/jF81C1TPNTczOz43HlWiNWkiffRiiY9j4Y7I2ykPXNa6VijHFWWw3B0Tbkopb5VO9t+xG8gtPoDC+zTrT5iHs7Obf3sLqBfZEPE3psQfWCFvVAs55a6uuqO04tfaCivy/92P3Ptriil3T9uY7iw/GOEttrN0JYl5OVVfpRzvg1BemRCVKtKNEuvAvP9iTiN4NfYC+ImkhB4UzScYUh1MW6GMbPe6/73meAji/85C1Wl1eM6K30qw0rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W74oJItnMbrgqCmPs4fRqdpxTAwe+BZR9yNy2N0u4IU=;
 b=cHHwdUB04qH8rQnpudIVhK+WqgTlGQkAL3V1dSZiIHCYFKAM4kgH/ofRpBqwzGZQUyBBtdCzlGoWUn69jCrajtaS7hhUanYDmKHNUeh7+74Mt32Tmcx0ZaienxKUGOdRiC20KhmT0jsKr7KwWdHVsHaJeSvVhP/V1yUc2IhjZrukZkREug0to0qXjQJ30HT6dKnK/51o51olr8OCMOefRKDBVoy58TEW4xMThn+0egGVvZX5Zkz8dEgRCDYHAilxsrriDbT1ozLRl4S2f1Je5fL6y7S37cjDxoQhELHf6s1EpeFlsMwS+1LZBgir8rv3e0RdhB1dLf/Rzlhk48axUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV2PR11MB6024.namprd11.prod.outlook.com (2603:10b6:408:17a::16)
 by SA3PR11MB953716.namprd11.prod.outlook.com (2603:10b6:806:536::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Tue, 10 Nov
 2026 12:01:48 +0000
Received: from LV2PR11MB6024.namprd11.prod.outlook.com
 ([fe80::38ad:3190:bbb2:412b]) by LV2PR11MB6024.namprd11.prod.outlook.com
 ([fe80::38ad:3190:bbb2:412b%6]) with mapi id 15.21.0592.010; Tue, 10 Nov 2026
 12:01:48 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Pramod, Ambica" <ambica.pramod@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "Kahola, Mika" <mika.kahola@intel.com>
Subject: Re: [PATCH 0/2] Frontbuffer tracking fixes
Thread-Topic: [PATCH 0/2] Frontbuffer tracking fixes
Thread-Index: AQHdaD01JjtrsEg3P0uM/qnkMuwC7LcV31yAgBFmD4CAAACeAA==
Date: Tue, 10 Nov 2026 12:01:47 +0000
Message-ID: <724eae5f6a5ae765751a5ae130ead6c0152d46cc.camel@intel.com>
References: <20261030070613.181026-1-jouni.hogander@intel.com>
 <DM6PR11MB2890BA35E537583292286DD4E16D2@DM6PR11MB2890.namprd11.prod.outlook.com>
 <b3fc42d4402167152a37e8ca994eeec052f75634.camel@intel.com>
In-Reply-To: <b3fc42d4402167152a37e8ca994eeec052f75634.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR11MB6024:EE_|SA3PR11MB953716:EE_
x-ms-office365-filtering-correlation-id: 1effcea9-5f14-4fc8-50f0-08df3f2265e6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|18002099003|22082099003|10067099003|38070700021|4143699003|11063799006|261102123227099003|261021121427099003|261021123027099003|56012099006|261009223027099003;
x-microsoft-antispam-message-info: 9fVfN93la9vKegJVqJ6xfGtcChpfbMxzTOX/CKLq0oCFLVRvFqsDV6aDyaznTBu1YUTUI02brS06Mme54ISTyIvxg4t10jzrvBFbxu/qIvylVUtQ5oUPUlaLSTewV0lQ0BWir70uCxqsPt44FKLcMvknMyySjCjmksDR3FcoMuY1CbRym/LoLoR/Drs0iLnqimH5wZdPKOHdSw/tSIQYS/SLxhORTtn20lpRbgGhnMTZlS2tBTPJNL+z6wB5wE93H9O8KFJpKBfjQ6/IxiLDbc/AgQIx8iMfrTsVMW1skDrypF6PEq+kFm3swlFc22IMCnS649y+jqZtsMZZnOfLKdU0zgoj0Jip8Z1e70M4Pnp0HJWq4QC1oPzSXqEth955GUMpuS3y540bNtivBaq4fgerrXKPvR5lHFxkmqjaFSOR0Oohpw+UnjTeGDNs5JjwNOgp0uq+0jvN0Xg4QgQPnYZPESxg1xOiYPOmtNoeCNXqvbIXxlNIRo12YJVArxwkE2tyH2EAzPO14iiT0iHBYBFc0vL50UG0nmkjBvo16ZbaLp+Gmi8aqBy5pi51WrHmoHFvEKk83vmrTEzX4JXOQVhhE8Q0+mHroMVjYSS3jvqAqc14BmhKqB4JuY2BZgMmaoWrZ1izOwKcb++ExaUgOmRLbsZDEOHWbGozuAHHNWfXARjV1AIvH+v0X4C44qVA
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR11MB6024.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(10067099003)(38070700021)(4143699003)(11063799006)(261102123227099003)(261021121427099003)(261021123027099003)(56012099006)(261009223027099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TVlsNUtkSDlRemxCUFRHb2tjRVc1UXU1VHc0dkVFZVd6NUpvWFAzNFJEMkVO?=
 =?utf-8?B?TlViQ0IrRE5RM2hUK1BmVFNnYlkxMDl2MnlMMVRMaGVlVmd3RHVGMzJVcU8w?=
 =?utf-8?B?WFRzRHVhY2RBODhGWVA5MWV3azhmZHRSNU5salVFTjIzNmNCRkZCbzNrSTdC?=
 =?utf-8?B?c0NPMlNvbTVLVlMxenpGbzM5WnNCL3RrR0dUdGh3U2YwRTN2S3lyK0FkS0Nx?=
 =?utf-8?B?M2Q5cnNWdlVKNGRBTjdJVkhNaWg5dDFjQ005a1d2SkVmdm5BY1ZYRkFpdGNm?=
 =?utf-8?B?VFl4bTQ1WHFZRExYSjZzOXQxODcyQmNvOENpRGJmTHV4aVduTkxEUzVhbUti?=
 =?utf-8?B?VGRtMDJLV1NNcGhqZk1mRXBkQVcvWCswdDZNNDVyWUorS2o4WDZ5VXVFNmxP?=
 =?utf-8?B?UWJQaDRmK2h1SXloSUxxSkk1emlXbTAwRjE4RDIrNlIxdHJPZmRFL1I3V0gy?=
 =?utf-8?B?dktDTTA1QTJzazBkMHJGOXpMSHFiVnk1TXU5NXo4SC9TMWt3UUlnc2FoZHg5?=
 =?utf-8?B?QWx0TTVRVURhQ0I5NW1zbTdYVGg0UnBXVkdoTDlBMnVYalVsaEV0QkRXOW1O?=
 =?utf-8?B?aFF0Slo3TldTUFhobGRlcmZZU2twamx5UEo1OHNBZ0VKMWswOWkxOXc0S1pS?=
 =?utf-8?B?ZUw0T25SZlA0R0RMYlZObjI0dWlsUXNQZlh4Q1hyNk96aENTUnM2T0NXNThN?=
 =?utf-8?B?N09KWlFIMEM3Q1NSY01XbXZleG1wM3N1aHBHMWU4dlNHWG1DbnA0cktrOEc1?=
 =?utf-8?B?NmRhd00zdGQ0RFJ4bW96UDQxMWxVdU1ROFVCWDRDRkR3dzRnQ3lLeEZNdHdr?=
 =?utf-8?B?ZHZmSEVMZDhtaUExK0w4YkR0d3hWZ2tZOEU1L0JnajhWZ0JSeGp5K2NyTUJC?=
 =?utf-8?B?TklKNHFBaFFPcWQ3YTZaZFRxUjFQV1FqMENTUHdKWFVBMUVMS3NvQVF0Skgv?=
 =?utf-8?B?eXVGMW5GUVNWYlZadU9aMGM2SEJtd1QyNTV3TWlSQVVHQ041RUV4YmFTOGJJ?=
 =?utf-8?B?MWczdkJQb2p6N2NtaHFFR1B3d1VTMEw1UEhaQ2kvMkxrVGJRTjNtdHZEQjNX?=
 =?utf-8?B?UnY4Lzl6MVhIUmtwYThwdmxDUkNNRTE2TWhPNXUyVjJlYUFzZzFWcm96dlZl?=
 =?utf-8?B?My95b2VJV0NCdHlub3d6OXp4dFgyaTQvQk1VSTV0RHcrR2R0WTIyS3Rkbyt4?=
 =?utf-8?B?dmJ4d3FYU2dBVkd3RXRRK3ZGajROTjU2WnRuQThtSlRyaDF0ejdQd214LzV2?=
 =?utf-8?B?cUtQTHJHdGUySTZYMzlMV2Z3RlFOTTNaNWJnUTVMdGRic0NIWHFSbGs2Vk1V?=
 =?utf-8?B?K0l1c2hHNm53Vm5vYm1JVHFPQm1pcGpPSmJTWXBvcm1DV0R3eW1IY1pIaENz?=
 =?utf-8?B?azR1RllaS1ZrbW8zZDE3RGNkTVNkbGxjRHFlN3VpM09oeDlmQzd5WHEwNnE0?=
 =?utf-8?B?Q1c5eGpoVGlMUkZ6R3RpbkQvUXNQQVJkdFRDZWZCOEJ1SVdQYU9KbUNMK1pp?=
 =?utf-8?B?QzJiRmVwekN1MWlBNkc3ckhWa1hoQ3M4T05KSFNyTTBwSGRKYm1LZmdId0Z5?=
 =?utf-8?B?YllYOGxKdG1DU01CcFJWdVdBa1p3THV1eWZoSE9KTFk0Vm5vTUdnUTh5dW9p?=
 =?utf-8?B?TE1VbzV3Rmg4OTdXMUR0SWVKUEVYLzI3K2pmOWc3SkEvNmc4QmZKR1c2cUp5?=
 =?utf-8?B?c1FEVFMrYWNxYVlscDFON3pWZ3FUSlZVbm5qdUJKVWx1bVRiOC9QNVRqNHBT?=
 =?utf-8?B?NDBnMW0zSGlmUnNuRnhJZ2xzNlBiNitldGQ1VStMNTZmbmJ6YXNDaEd4ZTVQ?=
 =?utf-8?B?Ly9DcVZtWGcwdk1hb285Q1hJWUppOStOT2hjNCtNTmUxdm8zblJHNWx4VnZV?=
 =?utf-8?B?YS9tRHhBcXBNRzNBcXpaalpjMDNzM3JESTdEYzFtU2JoK3FndXByR2dqb1J2?=
 =?utf-8?B?ZWw4eVdsVVNWVElFZUp6KzJHTjlxU0FsQU0rR1BmUmFQam5tMFdTdlI4ZmJ6?=
 =?utf-8?B?djBuN2Q5RDZlQ2hMcUxkbUlWeEFlcVRKYWNqTmptdnZRK1dNTkdTb0M0STRN?=
 =?utf-8?B?RUZnUFZMeXlKQmVoN1d3T1d2Zml4a1dJeTd3dWhjRlBzdnJxblRUaEVPazYx?=
 =?utf-8?B?L21VMHZXRWs5TEZxRWt2NlZPWVY4eGsrU1BGMC8rNWtZRmttTDBPdGFOWkth?=
 =?utf-8?B?cFIzVWEyakdsbklHWlUvekpCOElWdEV4bytMMDZ3bjBEOE5meGpLQjEvSjNO?=
 =?utf-8?B?N01rQ1pGYzZUT2podG9yWkRXa0sraEZhR0JpYzZSaXBzeG94MzJnbXVRTlM1?=
 =?utf-8?B?dUhzZUJBUFhkQTVVYTZpZDVlUWlzSVdPR1JhTlVSb2V5bW1IN09XcXNLL0VX?=
 =?utf-8?Q?HDW8IgTGp1GVUSNE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1E179FC26A95ED498CC90FD032198270@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: m69eciteuLxw1JZzuLZv6Y0w/gkltyBL0XC+7n3LcvqEQb1/Mder1FxWNhspEC0/WW/Rc3V81rAW9pTII494HGZfDlN36CTdV0VDcg8SOQ+V3ZOvDlu2MZTBDW1YUEj7PYaBPouaHVxT2R/7ya6A93u96XP3L0P8C1FhIUrAWHtry14Cz96i47yH4g5QEF4VwzlMhlHtm9/GnYiuve0M+fukHjSstDUXKDkJZVvVriYD5wpRsBWPmpU1B2cfUOVXctGu6hxdKldTSwYUJdjDs7XOvMx9KjcwVfEs/2xx1y3xXACPTgDawJGAvu9CdAwAuGP7mQhLrmKk8Agbw820Aw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR11MB6024.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1effcea9-5f14-4fc8-50f0-08df3f2265e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2026 12:01:47.7646 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Hpw7hqlmR2Np+/enBr8TJ42smh0PoyKAz0v92rNugZ4qAFtJSzZM9I0fYTfYGvO4WKQ+sVdUS0fyaisYlI4b3KF3gvae0owDRrAT4I/vf3g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB953716
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVHVlLCAyMDI2LTExLTEwIGF0IDEzOjU5ICswMjAwLCBIb2dhbmRlciwgSm91bmkgd3JvdGU6
DQo+IE9uIEZyaSwgMjAyNi0xMC0zMCBhdCAxMDoxNyArMDAwMCwgUHJhbW9kLCBBbWJpY2Egd3Jv
dGU6DQo+ID4gDQo+ID4gVGVzdCBwYXNzZWQgUEMxMC4zIGVudHJ5IG9uIE5WTCBwbGF0Zm9ybSB3
aXRoIGF1dG8tbG9naW4gZW5hYmxlZCBpbg0KPiA+IGdkbTMgY29uZmlnLg0KPiA+IA0KPiA+IA0K
PiA+IFRlc3RlZC1ieTogQW1iaWNhIFByYW1vZCA8YW1iaWNhLnByYW1vZEBpbnRlbC5jb20+DQo+
IA0KPiBUaGFuayB5b3UgQW1iaWNhIGZvciB0ZXN0aW5nIGFuZCBNaWthIGZvciByZXZpZXcuIFRo
ZXNlIGFyZSBub3cNCj4gcHVzaGVkDQo+IHRvIGRybS1pbnRlbC1uZXh0Lg0KDQpBY2NpZGVudGFs
bHkgcmVwbGllZCB0byBvbGRlciB2ZXJzaW9uLiBWZXJzaW9uIDIuIGlzIHB1c2hlZDogDQoNCmh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI2MTEwMjEwMDA1MS4yNzIxMzctMS1qb3VuaS5o
b2dhbmRlckBpbnRlbC5jb20vDQoNCkJSLA0KSm91bmkgSMO2Z2FuZGVyDQoNCj4gDQo+IEJSLA0K
PiBKb3VuaSBIw7ZnYW5kZXINCj4gDQo+ID4gDQo+ID4gDQo+ID4gDQo+ID4gRnJvbTogSW50ZWwt
Z2Z4IDxpbnRlbC1nZngtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IG9uIGJlaGFsZg0K
PiA+IG9mIEpvdW5pIEjDtmdhbmRlciA8am91bmkuaG9nYW5kZXJAaW50ZWwuY29tPg0KPiA+IFNl
bnQ6IEZyaWRheSwgT2N0b2JlciAzMCwgMjAyNiAxMjozNiBQTQ0KPiA+IFRvOiBpbnRlbC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnwqA8aW50ZWwtDQo+ID4gZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZz47IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZ8KgPGludGVsLQ0KPiA+IHhlQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZz4NCj4gPiBDYzogSG9nYW5kZXIsIEpvdW5pIDxqb3VuaS5ob2dh
bmRlckBpbnRlbC5jb20+DQo+ID4gU3ViamVjdDogW1BBVENIIDAvMl0gRnJvbnRidWZmZXIgdHJh
Y2tpbmcgZml4ZXMNCj4gPiDCoA0KPiA+IFR3byBmcm9udGJ1ZmZlciB0cmFja2luZyBwYXRocyBj
YW4gbGVhdmUgZGlzcGxheSBwb3dlciBzYXZpbmcNCj4gPiBpbmFjdGl2ZToNCj4gPiBmbGlwIGZs
dXNoZXMgbWF5IG5vdCByZS1hcm0gUFNSLCBhbmQgZmJkZXYgdXBkYXRlcyBtYXkgbGVhdmUgYnVz
eQ0KPiA+IGJpdHMgc2V0Lg0KPiA+IFJlLWFybSBQU1IgYWZ0ZXIgZXZlcnkgZmx1c2ggYW5kIGZs
dXNoIGZiZGV2IHVwZGF0ZXMgb25jZSBjb21wbGV0ZS4NCj4gPiANCj4gPiBKb3VuaSBIw7ZnYW5k
ZXIgKDIpOg0KPiA+IMKgIGRybS9pOTE1L3BzcjogUmUtYXJtIFBTUiBhZnRlciBmbHVzaA0KPiA+
IMKgIGRybS9pOTE1L2Rpc3BsYXk6IEZsdXNoIHRoZSBmYmRldiBmcm9udGJ1ZmZlcg0KPiA+IA0K
PiA+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9mYmRldi5jIHwgMTMgKysr
KysrKy0tLS0tLQ0KPiA+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9wc3Iu
Y8KgwqAgfCAxMSArKysrKystLS0tLQ0KPiA+IMKgMiBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNlcnRp
b25zKCspLCAxMSBkZWxldGlvbnMoLSkNCj4gPiANCj4gPiAtLQ0KPiA+IDIuNDMuMA0K
