Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD66606C90C
	for <intel-xe@archiver.kernel.org>; Wed,  4 Nov 2026 21:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Xg3IvefN
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A899010FEE2;
	Wed,  4 Nov 2026 21:00:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0484C10E00D
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Nov 2026 21:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793826004; x=1825362004;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=SjPWVnT2zhRdB5kVFpgstLzX3MG1RrEGRg4MWx5FKsI=;
 b=Xg3IvefNxF/HWdPpkeODLtFsaW8U5zj+0BaeEYnydtNAOJuC41V3tdjI
 iphxIG/WdaSa8HIYH/59rG7MWK7bAsZAr7GCm2zcAzdifc/hXISkQtQBT
 1eF41DytEa1EqxQ9ViP7ltGuzTY4Diy2fOKlvvLmWo8SGzUJp3/wBWWB4
 aiDeaZvFV9uNVejFP6xRah6a+GgfWHJBpUG2HDFdzTvrwU7a+0uKR7Pya
 xoM1q1QCzcRlZfq3VPoCD2ZAwn78caB+aHuiFk7rQzxqd6PCdlP54F/xI
 BRetZ3nUqZ3va9a9DUM3OlJbs4K9A/X14jBSOtZziwCXjxzPCdmvpjbg4 g==;
X-CSE-ConnectionGUID: Gu7Id25LQJOd+IhHJERHFA==
X-CSE-MsgGUID: TEN8Zm3mTDGALIQjqQQGKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2470805"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2470805"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 13:00:03 -0800
X-CSE-ConnectionGUID: FDFLsXdWRs62JvctH1IGrA==
X-CSE-MsgGUID: xHoL6XExS12+HF/vlz8TTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="6678473"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 13:00:03 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 13:00:02 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 4 Nov 2026 13:00:02 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.42) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 13:00:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FpmZIWqIYn0SCLJs4XRUoeqwYIw7gDEwyD9pW6BVTpBMJOMXY+Y5tFkNzT/8WTTmLioQtgc/dyY3lfTG/cT/RYSnnU9261ZSb6+/kBxEbtZexSJ5I6FnH19llumPDiqfjTGEHuZstOnCkAidTFG9xUlQNdriSuwaygRSP0vhTuOojpSYovCfavdHvTu+iyGuOoLLqetNaZ+RKyaWwmBbd/rVoWStN2L3KeNvPXbyfuaDh8ga5sxIELg6Wzs/EncSaoa9Pn3HW5cZfS1e5t5vtWeS/kegdCY0vdI3F5iyMm7CXKfivMkviDUY4TAOSjhjM0go+oSIHkvM6ygphqDpNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SjPWVnT2zhRdB5kVFpgstLzX3MG1RrEGRg4MWx5FKsI=;
 b=DJsu61kyYxL3MmWSYCB5a+7NfrpwLszmizIwaN8iXDJmf6yUSPhZbLDTpyxkdKP2GIVWxL878QJCluqbdmyNGKaMhMoT+KKEF6hRbTZOG1GBq6RLibRd40rUDEQQbgyWFhtiEZr+85/jJ1q3/klU6RrN/Ir2OhFzFoR4nxRCDYUWUk+n3Loi7WAzXuOLr5amhwgb/xcMJQRkGKUNdxsW+CBDsTT7KYdshpWsqslgKbrptcFO4lDIHLwwQHQHk49eK2vH6PN58GzHbf/bD1RJE9NpKRUY1mqfGTYv8miRUuAn2ucTxvtC53ZfAPZh+hydyXu0d4RtJSbkeqAsBTNZOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from AT6PR11MB072844.namprd11.prod.outlook.com
 (2603:10b6:170:10a::16) by IA1PR11MB6444.namprd11.prod.outlook.com
 (2603:10b6:208:3a7::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 20:59:59 +0000
Received: from AT6PR11MB072844.namprd11.prod.outlook.com
 ([fe80::520a:561:ace1:e64b]) by AT6PR11MB072844.namprd11.prod.outlook.com
 ([fe80::520a:561:ace1:e64b%6]) with mapi id 15.21.0592.009; Wed, 4 Nov 2026
 20:59:59 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re:  CI.checkpatch: warning for driver core: platform: tests: add a
 shared software node test case
Thread-Topic: CI.checkpatch: warning for driver core: platform: tests: add a
 shared software node test case
Thread-Index: AQHdbJ9zpRxNfdLDD0mBSPym8/CQaQ==
Date: Wed, 4 Nov 2026 20:59:59 +0000
Message-ID: <26ba82bcc1f6a4a61593cf41702bce4d1c729c14.camel@intel.com>
References: <20261104202419.30180-2-stuart.summers@intel.com>
 <179382590033.120633.4167065472746494605@221881a7231d>
In-Reply-To: <179382590033.120633.4167065472746494605@221881a7231d>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AT6PR11MB072844:EE_|IA1PR11MB6444:EE_
x-ms-office365-filtering-correlation-id: 5aa10460-675e-43c3-049e-08df3ab69652
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|38070700021|56012099006|261021121427099003|261102123227099003|4143699003|261021135927099003|261022105027099003|261022113327099003|261009220027099003|261009221227099003|261009223327099003|261022115727099003|261009221727099003|261021130227099003|261022075727099003|261021123027099003|261021133027099003|11063799006|261026135527099003|261026130827099003|261009223027099003|261026140227099003|261026121527099003|261028144727099003|10067099003|22082099003|18002099003|6133799003;
x-microsoft-antispam-message-info: ZJw9E3gH6tZsJvF4slTXjX/TW4tkQoakJzvwNjuOx+vFGv/jlVqEgMFHDBOoNpDbwTBKIhzny9yk43g9ovY7cXbTajnz+on3kYysgxlbiYkJ1FEKPpI6HtmoHd97NkaqmXX0Y0aLMHv4PmSP/Bx8mOVKiHhXFgb+u/qLUdQR6foZmEMQvrUJo6drVkRu6gelM/QlGrkqwhA99DZThh/786tLDUvS0hmV8aeTEUrJVXk10BlrftWh76BNg3w7Sr87e7BGIebF3/4vkUH1S+VIbVOB7KMG4A3DP8fH7Q1M76JfqphIVG3hijqnJ9L4bWIZMmoEKlxiHwFsZKWzUUA7ag3TPcA26E61atiyOigmr3rqkb0GfwJHl/3GL5teolLLuIjbZ5Fd1AB1PDJA1fDkBxHt2BHhyfCFgMxWio7HhzrSB5GfJP1wsUbgd7k5ud+AC3yp4JcJZ6D6f5lwB0rnSt0Shot3VVHYxp18HUZF6nkYUCBbSNsu6gWTI90mWrrOlUsxS3r/AkCW+9vEkvITBpg/66BgWlnMxodFSsH2p9aXt4ct4RyqCyYwx1iueLdjxnfWn8WGbTksdOGpDFQh/WtDzjQ603QUNgkw+cQlcizvPveQOZlq3sCozsh/MKCfgUlFECzRH1+k+Emfn/TJQfszPlY2F0CLLLU3wAPle3o=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AT6PR11MB072844.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(38070700021)(56012099006)(261021121427099003)(261102123227099003)(4143699003)(261021135927099003)(261022105027099003)(261022113327099003)(261009220027099003)(261009221227099003)(261009223327099003)(261022115727099003)(261009221727099003)(261021130227099003)(261022075727099003)(261021123027099003)(261021133027099003)(11063799006)(261026135527099003)(261026130827099003)(261009223027099003)(261026140227099003)(261026121527099003)(261028144727099003)(10067099003)(22082099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y2hGZE1FZXE2UHpNbWhJN3hKWGxTbW5RbU9RaWR2MHAvRnFWK01NQVRTK29x?=
 =?utf-8?B?STRucHNjcjBZdkdHemJVOG81WFNTU0lCZEVYT3ppVmUvSCtHTGNjMzgvdEUz?=
 =?utf-8?B?K0d3MVJva0N0VnZtQlNrSG04OTlMZHhFWmI5NXFjenZpM3B4UmFWVFBUTnVU?=
 =?utf-8?B?eFpkVm9USHVLaE5SSm51Sm1ZemdBS1J2clphQWxwRm1hMWZYUXJoRStTK2Vp?=
 =?utf-8?B?Z3JJR0lnUTIrZXp2NG9UdzhHbU03ZzJYT1RLRy83UytaMDFPd21CYVdHMkQr?=
 =?utf-8?B?YUlxeWdhNEtHREQ0ZmJjQmdmamxWdjZTWHA0Zi9vUnFGRzFUNmF3aXJ2MUR6?=
 =?utf-8?B?amp4OERweitlMDkzc3NQN2t5ZnNGZ0VDemg2ODFaeU0yUkFxQkFPNmIzeUQy?=
 =?utf-8?B?SCs0QzlOWVE4UUxXYWwzVGR5U3o2MmVFby8wclhqeXRmQVRuR093SVA2bWdq?=
 =?utf-8?B?VTBsWGNlYVErN3REa1ZDZWZZbEhsVytob1pGTEdLKzlGQUIxVHJFNHRQZStk?=
 =?utf-8?B?UWRnZHNNSkt2RG81NHNsZTJRaTdNZk53N2NlUHFtem4zTUFMOFFsTjNsekhn?=
 =?utf-8?B?VkpjczdZblVHbEgrV05BeWQxeTVhamVjZUp2cEtDdXJvLzV1cU94Y1NwMHla?=
 =?utf-8?B?YVFZY05HaE0zMGtkZ2RZN3g2MzlETkl4WFpUZzJZTlp6dnJuNlpCOWw0VVlC?=
 =?utf-8?B?aFhnSHI0RUlqVStmWHg0SWw3Q2h4eGdvQTZhb0kva2FFRjF4b3NMOTFOK0lo?=
 =?utf-8?B?TVBETC9ydmYveG41L2lRU0xUSFNsYjRVWHJvS3FiRk13RUhXWmhVTmJkRG5X?=
 =?utf-8?B?RGd2eGpoSTFNUEtCRWw4R2NrYVpxMFN3Sk92NnR5ckZOb21nc2RDdmtpbUpx?=
 =?utf-8?B?SnVOaVJHTmlqOXhFbmpkbmt4QkFGNHNpMkoycjdhRjArKzdFZ2NEcVQ5VG5Z?=
 =?utf-8?B?aGtEVHZyTjRQVklRYWg5dzMra1RDSUUrU1pESFdlSXlSemk5aEk4amIveUhy?=
 =?utf-8?B?ODZyaEZIbmsxd3d1aTIrWVFHSGkrb2szZ2trdGdJOHI4UHBNVnFGZ2U0UmhM?=
 =?utf-8?B?WnJQUGN2NEhhSDRYWG10eW1NNVNucDlYZ2pmL0NETjVheUlLaTFaTUg5NDgx?=
 =?utf-8?B?WktFdjNxNjhuUXEzSnM0djY0dlVXdTBwRnBwU2ZVM0ZxYlNZS1JXZjUyVVNP?=
 =?utf-8?B?bEVLdWl5bDZpT09hYkJ1cFBqNTNrdzllemR4ZlNFRnpISUR5ZnBSajFMZmRl?=
 =?utf-8?B?eXJkU0tZTkVPSFdwNDJ5WTNVa1A0ZVFxdlFvdVh2Z3Nvd0hTNEViTDJReTJq?=
 =?utf-8?B?eEZoWEtvT2VWSUFwZ1VBUHB0eXZONDQ2L3Q2Y3BOT2Z1K0swK1NVb0M2N3pL?=
 =?utf-8?B?akcwTjlhQlE5SFhvRjZjRW5weDMwUXE3MEgzTjFlelpzblcrNHBOaXRWWUdC?=
 =?utf-8?B?d281VTdFQUl6TkpmanRwd3hzYXYvQzNidVQ2cWo1K2VEK3o1OVo5QmMxRGJJ?=
 =?utf-8?B?N3J3SWFGVk9pVzV1aUhuYmkzdVdsRndlbS9KSW1Sd1J1RDY2ZzQwZ09WMnUr?=
 =?utf-8?B?c2JWOEtpUVNEeDIrS2dOKzBzUDNSSWk4WGZVN1k3eE5TZUtIdzg0ZmdYR0h1?=
 =?utf-8?B?Tk9iQ1VLSk1Pak5BZlFTL2FIVTkxK2FnVEkvK0lkTnVkVmtIMklQTllNTkxO?=
 =?utf-8?B?djM5YjlzM0pOQ2ovSU1kTE9qemRaa1o2VFNMcWtJa1VuTW1lbEJ1WHk1YmN5?=
 =?utf-8?B?YXROMFBreWRJci82aU0xU2dFWE1iZlVPenpWU2dDTE1UZmVjSFM4M1JmSDVo?=
 =?utf-8?B?VFRQT2lOYU5nKzV0dnZOMFpwUmIvTjFCSFZxS3pEd0FxbjlmNWJKVmpJRlBW?=
 =?utf-8?B?YTFWUWZGZWEzVDZPc1lkajROdnFLTjd2MnFxd21qUjNJbTlvZG9waVBPcUIr?=
 =?utf-8?B?N1lsZjJUQTNtMUpWZGlsS2JXcEhrNHJWN2dWdkpna3FTRnVZTVdkcFZRbndW?=
 =?utf-8?B?SkRoQWxtQ01aNVFLMXJ5dzNCaHowd3I3a0F0cU4vL2p6SXQ3V1FTSlV1UmhS?=
 =?utf-8?B?UGUrZWpyLzJNZnlFWUNhdUlSUm56Z1d0aVhiakdnQWhBNWwzY2RKMWdTc0FY?=
 =?utf-8?B?TUZsY2g5UGZIYU1MU2xVZERzZjJ4RVMzRFFjZ0w0OVV6WERHUGJLRXExRCta?=
 =?utf-8?B?dHlISVJBZXNhSGNDclBhYytCYnRzNUVBVWRRRE9NbnNRMGdrdUZMZGFZMERB?=
 =?utf-8?B?VUdKbm5JKzJyNVpDUnIwYjl3YWt2SHN3TFdKc2xhYm84cGtqOHNOblZId2lp?=
 =?utf-8?B?Kys1bDhraU0vMHJ6eUdQam5nU3NUcDJrOWNHYUZWZnMwbmhPRFZwNnZFeFMv?=
 =?utf-8?Q?S1RREqzQi3ZZc6z4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D09B744CBF7E7946BA0ABEC481E1880E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: UAtGH0xeWjPlyl2rlEIjij5MVXCaAMobGP9IAC0wxdSwop3ApPac7Age4tIHLW39kJgBreIU6RZH+BuOgnxCaavkNek8Ke1DiQN8OuZYVRX6Z7B5lZ9KTWWRh/L1/ksPIw1yEyTijkIjbqpwm9sANp6+Mw9C4t+KNFyV0e9gfhFlrVN/tfWC8FoGMzO3wya9256/a0aTyrNM2us+FOvnQcAPfIDzf+KeJ/70gFbh2QCo3mLxG+mQ/UemTOTxMud2CPOwbM4mrVy0J9h9C5cBWVkAh5/PvUCWQuPB7Dhlang+q0BXDbWwBy/sjHoMv1I/NHSsRpVduKqQiTyt1h7/Tw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AT6PR11MB072844.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5aa10460-675e-43c3-049e-08df3ab69652
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2026 20:59:59.0147 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qtBvwLpUvKVZhErySFsuhC+R0sljDymU3B/FMCZ877OKfOgJrsZtWIMH57URlT+VowDfgqFAuvwS4uMSRK1QwkhngY10MMCwM6SepvidkOU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6444
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
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gV2VkLCAyMDI2LTExLTA0IGF0IDIwOjU4ICswMDAwLCBQYXRjaHdvcmsgd3JvdGU6DQo+ID09
IFNlcmllcyBEZXRhaWxzID09DQo+IA0KPiBTZXJpZXM6IGRyaXZlciBjb3JlOiBwbGF0Zm9ybTog
dGVzdHM6IGFkZCBhIHNoYXJlZCBzb2Z0d2FyZSBub2RlIHRlc3QNCj4gY2FzZQ0KPiBVUkzCoMKg
IDogaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy8xNzc3ODUvDQo+IFN0
YXRlIDogd2FybmluZw0KPiANCj4gPT0gU3VtbWFyeSA9PQ0KPiANCj4gKyBLRVJORUw9L2tlcm5l
bA0KPiArIGdpdCBjbG9uZSBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL21haW50
YWluZXItdG9vbHPCoG10DQo+IENsb25pbmcgaW50byAnbXQnLi4uDQo+IHdhcm5pbmc6IHJlZGly
ZWN0aW5nIHRvDQo+IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vbWFpbnRhaW5l
ci10b29scy5naXQvDQo+ICsgZ2l0IC1DIG10IHJldi1saXN0IC1uMSBvcmlnaW4vbWFzdGVyDQo+
IDMwMDk4NjdjZDMxODYzMjQ2ZTRhZmMxMzg1MjBhN2E4YmQzN2JiMTENCj4gKyBjZCAva2VybmVs
DQo+ICsgZ2l0IGNvbmZpZyAtLWdsb2JhbCAtLWFkZCBzYWZlLmRpcmVjdG9yeSAva2VybmVsDQo+
ICsgZ2l0IGxvZyAtbjENCj4gY29tbWl0IDVkY2UwMzg3NTliYWMyN2Y0ZGI3OTdhMjE3ZTMyMDE2
YWYyOTFkOGENCj4gQXV0aG9yOiBTdHVhcnQgU3VtbWVycyA8c3R1YXJ0LnN1bW1lcnNAaW50ZWwu
Y29tPg0KPiBEYXRlOsKgwqAgV2VkIE5vdiA0IDIwOjI0OjE2IDIwMjYgKzAwMDANCj4gDQo+IMKg
wqDCoCBkcml2ZXIgY29yZTogcGxhdGZvcm06IHRlc3RzOiBhZGQgYSBzaGFyZWQgc29mdHdhcmUg
bm9kZSB0ZXN0DQo+IGNhc2UNCj4gwqDCoMKgIA0KPiDCoMKgwqAgQ292ZXIgdGhlIHBhdHRlcm4g
dXNlZCBieSBkcm0veGUgKyBpMmMtZGVzaWdud2FyZSwgd2hlcmUgYQ0KPiBzb2Z0d2FyZSBub2Rl
DQo+IMKgwqDCoCBhc3NpZ25lZCBhcyBhIHBsYXRmb3JtIGRldmljZSdzIHByaW1hcnkgZmlybXdh
cmUgbm9kZSBpcyBoYW5kZWQNCj4gdG8gYQ0KPiDCoMKgwqAgc2Vjb25kIGRldmljZSB2aWEgZGV2
aWNlX3NldF9ub2RlKCksIGFuZCBtYWtlIHN1cmUgcmVtb3ZpbmcgdGhhdA0KPiBzZWNvbmQNCj4g
wqDCoMKgIGRldmljZSBsZWF2ZXMgdGhlIG93bmVyJ3Mgbm9kZSBpbnRhY3QuDQo+IMKgwqDCoCAN
Cj4gwqDCoMKgIEEgcG90ZW50aWFsIGZpeCBmb3IgdGhpcyBpc3N1ZSBpbiB0aGUgZHJtL3hlIGRy
aXZlciBpcyBiZWluZw0KPiBkaXNjdXNzZWQNCj4gwqDCoMKgIGluIFsxXS4NCj4gwqDCoMKgIA0K
PiDCoMKgwqAgVGhlIHNpZ25hdHVyZSBpbiB0aGlzIGNhc2UgbG9va3MgbGlrZSB0aGlzOg0KPiDC
oMKgwqAgT29wczogZ2VuZXJhbCBwcm90ZWN0aW9uIGZhdWx0LCBwcm9iYWJseSBmb3Igbm9uLWNh
bm9uaWNhbA0KPiBhZGRyZXNzDQo+IMKgwqDCoCAweDZiNmI2YjZiNmI2YjZiNzMNCj4gwqDCoMKg
IFJJUDogcGxhdGZvcm1fZGV2aWNlX3JlbGVhc2UrMHg2Zi8weDgwDQo+IMKgwqDCoCANCj4gwqDC
oMKgIFNpZ25lZC1vZmYtYnk6IFN0dWFydCBTdW1tZXJzIDxzdHVhcnQuc3VtbWVyc0BpbnRlbC5j
b20+DQo+IMKgwqDCoCBBc3Npc3RlZC1ieTogTExNDQo+IMKgwqDCoCANCj4gwqDCoMKgIFsxXTog
aHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy8xNzU4NTgvDQo+ICsgL210
L2RpbSBjaGVja3BhdGNoIDBjMDRhMzJiOTUyY2U1NGM4NjI5MjE4YzIwNzEwNTE3MzE5NjVhZTEg
ZHJtLQ0KPiBpbnRlbA0KPiA1ZGNlMDM4NzU5YmEgZHJpdmVyIGNvcmU6IHBsYXRmb3JtOiB0ZXN0
czogYWRkIGEgc2hhcmVkIHNvZnR3YXJlIG5vZGUNCj4gdGVzdCBjYXNlDQo+IC06MjE6IFdBUk5J
Tkc6QkFEX1NJR05fT0ZGOiBOb24tc3RhbmRhcmQgc2lnbmF0dXJlOiBBc3Npc3RlZC1ieToNCj4g
IzIxOiANCj4gQXNzaXN0ZWQtYnk6IExMTQ0KPiANCj4gLToyMTogRVJST1I6QkFEX1NJR05fT0ZG
OiBVbnJlY29nbml6ZWQgZW1haWwgYWRkcmVzczogJ0xMTScNCj4gIzIxOiANCj4gQXNzaXN0ZWQt
Ynk6IExMTQ0KDQpJJ2xsIHJlbW92ZSB0aGlzLi4uIHRoZSBkb2N1bWVudGF0aW9uIG9uIHRoaXMg
c2VlbXMgdG8gYmUgZXZvbHZpbmcNCnF1aWNrbHkuLi4NCg0KVGhhbmtzLA0KU3R1YXJ0DQoNCj4g
DQo+IHRvdGFsOiAxIGVycm9ycywgMSB3YXJuaW5ncywgMCBjaGVja3MsIDY2IGxpbmVzIGNoZWNr
ZWQNCj4gDQo+IA0KDQo=
