Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B42FB606A31B
	for <intel-xe@archiver.kernel.org>; Tue,  3 Nov 2026 23:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=b8ylHUVk
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FC0C10F910;
	Tue,  3 Nov 2026 23:06:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2954210F910
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Nov 2026 23:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793747156; x=1825283156;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=mLR94D6/HOrSznshpq2K3Yh7wZFxSXo2bxSQTko2DhI=;
 b=b8ylHUVkcJKv7wgDEkCSpW3WLjufI/bqX/za+sU+wXyo7G/NT83ympZk
 Y0/NE7QL6KVeTzecWyuD6Ez4WIE/FZ61mdOmG1JTzK/1TlX/LAGS8pZPQ
 ubj5r5gj2lCT/hYu7UCQe1fuPFXcxycglfv0UzJDylcWq1/sR1IfsWqYh
 YC2SX81yvPiM0+Vvqg3jeuCXula/BoImmOZlwjEH/Hqgeiri5yg3FsF/F
 a8gEfePNNk44TeER4fjQk6bwdiF6/T4bY1hkPAwraD6aepldnjj57zG5p
 XgdcdQAO4FmY4UzjXdcP5ZX8wnmxhqkLewKiMGcB9y7bvoc+CpZNLQ3Xn A==;
X-CSE-ConnectionGUID: OJ1xVLA6RSq3JSOQN+UD4Q==
X-CSE-MsgGUID: lLPRgjVKQg6q9Ta3I+fbHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2391221"
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="2391221"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 15:05:54 -0800
X-CSE-ConnectionGUID: IW5yV/JTTgSxTD2Eeia4RA==
X-CSE-MsgGUID: kB7QuxYkSzaG8JclZePsgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="6632844"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 15:05:54 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 3 Nov 2026 15:05:53 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 3 Nov 2026 15:05:53 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.66) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 3 Nov 2026 15:05:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iMQw+FGvIujooaxoh3is8Vdko8qJrS8/BusCvf6KbSCucgbi5u6GygDuzOyfWwHPzDFopYWwdBwwQ1C7E9hn092J4iEqPwIqycK3xva0zyxMYNbfkTe6nGlEN5dOOYDag3DHMsxWqXVpWR8eTCByAH5Rjyz/4Ckyf2apyf1lv5Rpo7LOB04etfgOD3aGEMKm53vhGZk5jNXWePYs97sUCWG3U5JO1bkp94++eg3QjScdgsRUyMg8pwOjPsempb015E0f2OaFD6Aoov9GGZE2rPmmzz1BdhnyfjDEwGDBrPlhbwU3yDDOY8J8bYE39rAu7vjUJEZG3IuI5bJvFCyWdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mLR94D6/HOrSznshpq2K3Yh7wZFxSXo2bxSQTko2DhI=;
 b=qOeS2Ur6wXcC1UZou61rgeWLKbZ6x+33lmNQlvDVStlGDlwDg8YvaDjilkzypZGKmS/ZLqvTujyuVfpgOemQfEMmSymKECHPv8RImajNqgpz4QRmql6EVMhNi/4ZGruZ4PHSaJExarAOm95Y+dZ/UsI3x2iJNLOaGumH/nAU3+uXPpIbe0aBOPSu0ReETy0sYC0XOegY8k5Zn4KXYA+JFmeyBGwVL+/yKAHKiQPyRg+WGQROjFUJe/l5kFfNBwGYOXT5Qiv4U286eYpbZ8jPGBPxs1IatO/v6SOtk78JcfzM8nWlO65Ts9iej9tQSZq+/gLeVwjlvQAwnCcuskdVEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from AT6PR11MB072844.namprd11.prod.outlook.com
 (2603:10b6:170:10a::16) by LV3PR11MB8556.namprd11.prod.outlook.com
 (2603:10b6:408:1b4::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 23:05:48 +0000
Received: from AT6PR11MB072844.namprd11.prod.outlook.com
 ([fe80::520a:561:ace1:e64b]) by AT6PR11MB072844.namprd11.prod.outlook.com
 ([fe80::520a:561:ace1:e64b%6]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 23:05:48 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Tangudu, Tilak Tirumalesh" <tilak.tirumalesh.tangudu@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "K V P,
 Satyanarayana" <satyanarayana.k.v.p@intel.com>
Subject: Re: [RFC PATCH 0/3] drm/xe: Use MI_SEMAPHORE_WAIT_64 (Wa_16029281913)
Thread-Topic: [RFC PATCH 0/3] drm/xe: Use MI_SEMAPHORE_WAIT_64 (Wa_16029281913)
Thread-Index: AQHda5CIUiHAxLxhz02F9K2xKB1Nibcc+JeA
Date: Tue, 3 Nov 2026 23:05:48 +0000
Message-ID: <1bc68eab0d2131212974e5859e03390519742dc6.camel@intel.com>
References: <20261103123727.2465599-1-tilak.tirumalesh.tangudu@intel.com>
In-Reply-To: <20261103123727.2465599-1-tilak.tirumalesh.tangudu@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AT6PR11MB072844:EE_|LV3PR11MB8556:EE_
x-ms-office365-filtering-correlation-id: 21de11df-ed44-47ad-d627-08df39feffce
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|38070700021|261021123027099003|260925021311599003|260925021911599003|260925022911599003|11063799006|56012099006|261009223027099003|261028144727099003|261022075727099003|261026140227099003|261021121427099003|261026121527099003|261022105027099003|10067099003|18002099003|22082099003|261102123227099003|6133799003|3023799007;
x-microsoft-antispam-message-info: oBSi6/mKgTHip6UebUOwVkCsGjpYw5DERX/ZXMT1/dlgy/bPxNiAHMY0RPh02Xtwqzdm+M1XwlFi7Ev4TeCxd3sIQ/TjD7M26AeW3WeSLiLvfbGDrxJIvz6CvVXlcUpgCkZbSJOaCVCHylqbGinL/7pR5VLYQETEqTDdAKp2i0CcGEZhw+qK/S/OtwYzRqIiU1WLegrhj3ff0pGGDbO1U0xcTmd2PxRd6sev3EhTdRmo1hdKMNVlSJgUOxtA+YPmu5vY+R2iaaItfhIirP8zP9a7dQ92mgBbTkekmt0M/+xxt8j4MZuG+SUzGH51F6QBeWICus5o5Spk21vLC0HqMD5E5YJW0+t+Oq67H0O+Wef/4vI0Ml9gESh6bUqVwfTBgVWcgqOXF86NzglHcH9maREW7iUXnXvmpzjknOLPhIragFHdEBRnYEZsZW1n3RQwJsSvZek/dLsDvePV0raYQ++h1aImNUFcRYbU2c/jhVBV/WaeKrklS0UrCHdLEVK1Namo07W+wxuvvWgPdMbMPm8GDY2rdkIWZGe3ixarNwqSA85jMG0SGg3kbsyvMe+F4q7EfK1LcRvNaXV5ccE32udDQ8oIekByo7ry1v7MpiFRrze+d5iQxHh27GIEn3UCbp4JphVLz7yHHhClBYivjVRVkRyYzqGqJFw5QX1ZH+Li+WqUwUpBQu+6v8e2m3uOdUY44Q5IoowEXwJFqi9ISm99bXuQA+Bu/WATMx4pNvk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AT6PR11MB072844.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(38070700021)(261021123027099003)(260925021311599003)(260925021911599003)(260925022911599003)(11063799006)(56012099006)(261009223027099003)(261028144727099003)(261022075727099003)(261026140227099003)(261021121427099003)(261026121527099003)(261022105027099003)(10067099003)(18002099003)(22082099003)(261102123227099003)(6133799003)(3023799007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZURlRnIvU1R4dTdjTXNFMG90VisxdVRSYkpUWTdDS3FaOWkzUEFLWi9INmJR?=
 =?utf-8?B?bVEvQVhrWEtzQ1VjVHplRHFUYTUreGQ4TDBwcThaTzlYdHpDWThidFZwL0lD?=
 =?utf-8?B?dlZ3ekp3dkc2Zm1Ub0p3Qzk0b0N4UFlvVGZRVzB1Y1FUOTJaRHRPb1h2aXdn?=
 =?utf-8?B?WU05RnN0djMva1NHSGpZZ3lIUXJFbzhLdVJUN0NhQyt6cnhGQlRSL0tiNWhz?=
 =?utf-8?B?bGVyYVk4bWI1WVVpY3JyalJ0RGRiMEFtWWwrUUM5cS9nMlFodUx0dSs4Y0tP?=
 =?utf-8?B?MzloU0ZqbHMzUVE0aE9WSzlWRGNOajE3MHBzU0NvY2lqT010ek5rT2xxUTRs?=
 =?utf-8?B?aFNuTkJpWVJXempJZS9aajFJZzNVcVVXZVpsYkxBMjIzWFl1U2ZrYWRhNzFR?=
 =?utf-8?B?dExvd2pMdHpvcjVlWTdVOG5tb3c5ZlZlUnI5b0ZINmhhMXllWVREYkRIQ2Vm?=
 =?utf-8?B?U1U2aXJDQ2RVcGpXYThsdHVnck1Mc2ZNdmpkMXdSdVNKS2tUVnVqbko3RHhP?=
 =?utf-8?B?QW1CWjJYaGFYaC9VM3huemlIYjI3bVhqbUd3WUgva0dvMG9DTWxienV2QWRx?=
 =?utf-8?B?Tm1WcmJ0OE5CK2d6K25pbDZnVjJhakFieHowZmhvUnVTdlk5RHdoNkEyZU9w?=
 =?utf-8?B?cnlIY3UvQUNQQTNGTzlTcUxtWkZtQ0pOYlFSZ2IrenhSSHg5QTN4L2ZYSUt4?=
 =?utf-8?B?Ym8rdnplZHYvZ1RxU2tNR3hJcXpDcmtrYkNlS2JIazcxcHU1RzAvaWJzTS9V?=
 =?utf-8?B?VlRvczNza016UThxNWxsSEtaajR1elV4bGc5VjAzbTh3eW5zMXQwZ05RbTVx?=
 =?utf-8?B?L2xWcGhrY05qbGxKL3pFRmR6UkREbTRvZGJwZUlJWXlwNi9xSk1SLzBRam9B?=
 =?utf-8?B?V25kYk54WmVYajQzWDNmcUJJT25sbk4rWjdLd25RV3N3NGRNNjNXYzNUNCtH?=
 =?utf-8?B?WnorTEg1cnlvR09rd0xIdTlMSTlacHhnYkZPUWhvT09MUE5CNW5zdDhkNUlJ?=
 =?utf-8?B?YlE0WFRJNVphREhDL1kzdUNBdytsb2gzdlpCL1BRUGlNTXZUZlNUVEdtQ2J1?=
 =?utf-8?B?b25BN3FseVlSY2FqTk9wNmU4MGQ2MWh6U3pKS2dDZ1o3UjdWL0hFazBLS2hp?=
 =?utf-8?B?NnUxbVlxdlNHV01lOHZ1d1ZnOFBlWFBxVDB5NkFQaUhvdDVMcXZRUHk4TDZr?=
 =?utf-8?B?MC9ua2JlSjlXZFhDZkpXVVpEd3F4MEhhb1BmRXdRT2puekVlQzM3OWE5aVJM?=
 =?utf-8?B?Q2E1cytIdWNNTnFKWHdZN0lVbDhMQ0pud2RETms1Qm9GM0VSZTZvSGZkOE9N?=
 =?utf-8?B?eGxJejlCcVVYZzAxcFYrUFpSckEwSEFvNC9uakVHa1FINkVQZHlBODFYMXgw?=
 =?utf-8?B?SGpNeVpVL0NZVWF4bHl1cEVhK0w3QzcybkNJQkRURzI1VEl0cVJ6RTFkTTBH?=
 =?utf-8?B?RDc3R3U3NCtwclNoWTRJUTEyNE1Wb0UxajlrNno3aDB4UE9uUlhJYUYvN3Qy?=
 =?utf-8?B?d2pSR3ltejNUOUJrcjFtTWZlell0N1hodmhnMUdBY0s4YlNtL0djTVRDK21k?=
 =?utf-8?B?RHdmQU9IR0hkSm5KNi9GWHN5M01OeVRjQTNIam5BbXFCSjVtUU1qZ0IvMnp5?=
 =?utf-8?B?YTBxc2ZtbG5ORmNkMkx2bHg2bUt3UnZXZi9qb2FaNjdzYjR1bUlCcHVHR0x4?=
 =?utf-8?B?dkdkbmpkVTVzQzRHVWJBeFNLcTlWam13ZjVvU2ljMGU4bEl4T015Ky9ES3p1?=
 =?utf-8?B?RWpidngrSStncEJMRUJwWnV5SExUV0o5ak1SM0h1ZG5tdlZMYTlzbmFqVXUv?=
 =?utf-8?B?WXFxeXJybHdDVjd6T1A0WllrTy9jYWZ4TzNRODIzVGNDS3R0OFVUSm1xclZt?=
 =?utf-8?B?ZHpZQzFuY1l3UUZkcU5VbllFaitlWkVYOVo1Z1VsM1ZjZUxnS2l2cnd1cUQz?=
 =?utf-8?B?TzZnaUp0SXBGUEpHUGU4a3kwTTdoVEVrYlpWUjlzZFFUczRZZXZhYjBRRHUw?=
 =?utf-8?B?ZVBRZXl6MWhwaTNDcFNWOTk2NHdSZUJrOUpkTjBWVS8xMFIwZ090YmREQXYr?=
 =?utf-8?B?OHkvbzVLeW1UVkRCeDJNZkx1THNBUnROTmVuM2kweFNCOS9iamZJM3R4RHZn?=
 =?utf-8?B?NC8wVzVNUk9FUmJ6TkhIcjBCWUdLcTJIWDhhNldRZ3FYaEtYZFNxVWlGRTdL?=
 =?utf-8?B?dVQrVjNWNDhqR01YVk5LVVZXS2ZiMXgxcTZsUWoxQ1N1dTMxZ3IzallWREVG?=
 =?utf-8?B?MERPS0l4ZDRHbzVadkxkQ1lueDNRYkVvN2xzYUZmQmE3WmpDUmJQeEZZaFdn?=
 =?utf-8?B?MkZpQy8rMituOFVJZ2JLNkd2RUZlbHFhQXRYbGVOM2dLSlQwdFNXbEJ3MzBW?=
 =?utf-8?Q?WmJ2jzINxW5rr9gk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0E2D7D73DC47654A9F30DCA5AEE6C075@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: q6uC1ayrV/XabpjC6L0EFmRgNdwRJnRlIJG80KhIe8HeFc0LsewBR8p5l4R0b122hpOcdF8TOawsSWqVWb+/AZw51oEmKe965zkd8kwRaOkLqnU0oCjNdk5uMxfEU688tyZoYvaiq3XYhIwcNNGhY39Ai3dJ1ECu9Ftmptx/ApDoQboITyWcINc9G4g9IzWweBCD/zcNNVL5sHSYWXer/nZypsqkKlrKRZ4t+/U4d1pr6pLwT7C1ucKs1D6srKLzeIlkCyu3PQmEiyLmyNnDCYbqv/zZr6H2W0XoZ/FmioCpeKx/Uai+7npE66jq0zwTaveHbA6JEY25JwBhR1zeVQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AT6PR11MB072844.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21de11df-ed44-47ad-d627-08df39feffce
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2026 23:05:48.5754 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NAFoKujaRMPfoK39ViYQhtobSNXmBFgOYL3iERRLgwZgQJLGH+BevCm2CBHBpdw0ZQ8rSgM9HNPeCfG4BELr8Gnf2Dxp3f7rzMTwdK7PfPA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8556
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SSdtIGEgbGl0dGxlIHdvcnJpZWQgdGhhdCB0aGlzIHdvcmthcm91bmQgaXMgb25seSB0YWtpbmcg
dGhlIEtNRCBpbnRvDQpjb25zaWRlcmF0aW9uIHdoZW4gdGhlIG1haW4gdXNlciBvZiBzZW1hcGhv
cmVzIGhlcmUgaXMgdGhlIFVNRC4gV2hhdCBpcw0KdGhlIHBsYW4gd2hlbiB0aGUgVU1EIHVzZXMg
dGhlIGxlZ2FjeSBpbnN0cnVjdGlvbiBhZnRlciB0aGlzIGNoYW5nZT8NCg0KVGhhbmtzLA0KU3R1
YXJ0DQoNCk9uIFR1ZSwgMjAyNi0xMS0wMyBhdCAxODowNyArMDUzMCwgdGlsYWsudGlydW1hbGVz
aC50YW5ndWR1QGludGVsLmNvbQ0Kd3JvdGU6DQo+IEZyb206IFRhbmd1ZHUgVGlsYWsgVGlydW1h
bGVzaCA8dGlsYWsudGlydW1hbGVzaC50YW5ndWR1QGludGVsLmNvbT4NCj4gDQo+IFdhXzE2MDI5
MjgxOTEzOiBNSV9TRU1BUEhPUkVfV0FJVCBoYXMgYW4gaXNzdWUgb24gc29tZSBYZTNwDQo+IHBs
YXRmb3Jtcy4NCj4gVGhlIHJlY29tbWVuZGF0aW9uIGlzIHRvIHVzZSB0aGUgNjQtYml0IE1JX1NF
TUFQSE9SRV9XQUlUXzY0DQo+IGluc3RydWN0aW9uDQo+IGluc3RlYWQgd2hlcmV2ZXIgdGhlIEdU
IHN1cHBvcnRzIGl0Lg0KPiANCj4gUGF0Y2ggMSBhZGRzIHRoZSBNSV9TRU1BUEhPUkVfV0FJVF82
NCBpbnN0cnVjdGlvbiBkZWZpbml0aW9uIGFuZCBhDQo+IGhhc19zZW02NCBiaXQgdG8gdGhlIGdy
YXBoaWNzL21lZGlhIElQIGRlc2NyaXB0b3JzLCByZXNvbHZlZCBpbnRvDQo+IGd0LT5pbmZvLmhh
c19zZW02NCBhdCBwcm9iZSB0aW1lLiBFdmVyeSBYZTNwIHBsYXRmb3JtIHN1cHBvcnRzIGl0DQo+
IGV4Y2VwdCBHcmFwaGljcyB2ZXJzaW9uIDM1LjEwIGFuZCBNZWRpYSB2ZXJzaW9uIDM1LjAwLCB3
aGljaCBvbmx5DQo+IGdhaW4NCj4gc3VwcG9ydCBhdCBzdGVwcGluZyBCMCwgYW5kIHRoZSBzdGVw
cGluZyBleGNlcHRpb24gaXMgYXBwbGllZCB3aGVuDQo+IHJlc29sdmluZyB0aGUgZmluYWwgdmFs
dWUsIHNvIG5vIGNhbGxlciBuZWVkcyB0byBzcGVjaWFsLWNhc2UgaXQuDQo+IA0KPiBQYXRjaGVz
IDIgYW5kIDMgc3dpdGNoIGVtaXRfZmFrZV93YXRjaGRvZygpIGFuZCBlbWl0X3VsbHNfcG9zdGFt
YmxlKCkNCj4gb3ZlciB0byBNSV9TRU1BUEhPUkVfV0FJVF82NCBvbiBwbGF0Zm9ybXMgdGhhdCBz
dXBwb3J0IGl0LCBmYWxsaW5nDQo+IGJhY2sNCj4gdG8gdGhlIGV4aXN0aW5nIDMyLWJpdCBNSV9T
RU1BUEhPUkVfV0FJVCBvdGhlcndpc2UuIFVMTFNfSk9CX1NJWkVfRFcNCj4gaXMNCj4gYnVtcGVk
IGZyb20gNDggdG8gNTAgc2luY2UgdGhlIDY0LWJpdCBwb3N0YW1ibGUgaXMgMiBkd29yZHMgd2lk
ZXIgYW5kDQo+IHRoZSBmaXhlZC1zaXplIFVMTFMgam9iIHNsb3QgaGFzIG5vIGhlYWRyb29tIHRv
IHNwYXJlIGluIHRoZSB3b3JzdA0KPiBjYXNlDQo+IChTUklPViBWRikuDQo+IA0KPiBUaGlzIHNl
cmllcyBoYXMgbm90IGJlZW4gdmFsaWRhdGVkIG9uIGFmZmVjdGVkIGhhcmR3YXJlLg0KPiBQb3N0
aW5nIGFzIFJGQyB0byBnZXQgdGhlIGFwcHJvYWNoIHJldmlld2VkIHdoaWxlDQo+IHRoaXMgaXMg
dGVzdGVkLiBXaWxsIHJlcG9zdCBhcyBhIHJlZ3VsYXIgUEFUQ0ggb25jZQ0KPiB2YWxpZGF0ZWQN
Cj4gDQo+IFRhbmd1ZHUgVGlsYWsgVGlydW1hbGVzaCAoMyk6DQo+IMKgIGRybS94ZTogQWRkIGhh
c19zZW02NCBiaXQgZm9yIE1JX1NFTUFQSE9SRV9XQUlUXzY0IHN1cHBvcnQNCj4gwqAgZHJtL3hl
OiBVc2UgTUlfU0VNQVBIT1JFX1dBSVRfNjQgZm9yIGZha2Ugd2F0Y2hkb2cgd2hlcmUgc3VwcG9y
dGVkDQo+IMKgIGRybS94ZTogVXNlIE1JX1NFTUFQSE9SRV9XQUlUXzY0IGluIFVMTFMgcG9zdGFt
YmxlIHdoZXJlIHN1cHBvcnRlZA0KPiANCj4gwqAuLi4vZ3B1L2RybS94ZS9pbnN0cnVjdGlvbnMv
eGVfbWlfY29tbWFuZHMuaMKgIHzCoCA2ICsrDQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0
X3R5cGVzLmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMiArDQo+IMKgZHJpdmVycy9n
cHUvZHJtL3hlL3hlX3BjaS5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwg
MjAgKysrKysrLQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9wY2lfdHlwZXMuaMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB8wqAgMiArDQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3Jpbmdf
b3BzLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDU4ICsrKysrKysrKysrKysrLS0tDQo+
IC0tDQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3Jpbmdfb3BzX3R5cGVzLmjCoMKgwqDCoMKg
wqDCoCB8wqAgNSArLQ0KPiDCoDYgZmlsZXMgY2hhbmdlZCwgNzYgaW5zZXJ0aW9ucygrKSwgMTcg
ZGVsZXRpb25zKC0pDQo+IA0KDQo=
