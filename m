Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1DE0C79FA0
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 07:41:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A43D10EA88;
	Tue,  8 Sep 2026 07:41:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OjHp7zcC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D460F10EA85;
 Tue,  8 Sep 2026 07:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788853285; x=1820389285;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=HvDJSAKvUXvYUfxet2UeRM5HCzS71bYvK3qw1VW9vuI=;
 b=OjHp7zcCMSY39as6P6w2LzAbFn8sbDRf5iFf9lSlGCjAFzcm4t0AYIXQ
 BeQNwLuxI3eiuM5dC1SpTd91ku+y61JGKjpmsvVus2lYdvjxUZTxCwd9A
 eQkN9SnlDzdqn95fS6RqUHZw4v17cK3rRkVKogX0I/fYocCW+dc0qSu6R
 GYp7Nc6S1HQK//fAt6bmctuvz3NxxPPuSty29/nqXHqEj88b2KOS8fBne
 mVezhP2WNFY0+BdyLInT//pIZEAVa4q+y/Ml4aRY01kbgv1dkFZ50ieOv
 u9MgD0RyiwFWhjopPxiPT8qXXzJJaMmcaK1dB4VkXu/qQyaV0Hurd4gBz A==;
X-CSE-ConnectionGUID: VaiU/ykISGWfWdB+1ejlyA==
X-CSE-MsgGUID: Y20xV2scQ82Zgn7960b4SQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="99907424"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="99907424"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 00:41:24 -0700
X-CSE-ConnectionGUID: oa9qhcMBTn69OKAqAka29Q==
X-CSE-MsgGUID: rm/xkNZBTZKJXwWqfzU2cA==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 00:41:23 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 8 Sep 2026 00:41:23 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 8 Sep 2026 00:41:23 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.70) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 8 Sep 2026 00:41:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ieo/J8FoSuX2w6W/UfQUJzhSGBb4hdLSjwF7/J7BdgbxYWCVcPs7KeKJhaqwqvO9fyy7a6UtrbE6DC3VDuo9RhXjsMd90v+qWj2MHuj713fzRhDHJDS9bfLNt49sB6h0+bgZlbo5x6E4KtF19S35qfy3pNxB8P/Hm89BlUzC9UiHqPyP33VCn3fbAN8248cI+Q9mJuOk7E/b3kfnVEqIa7BKod0brxqyQRn/y9mwFADgooalVt8ELSLhdhiaL4rPs1CXXzEuHcBktFe7PLudrJY0hiirFXceOvDJue5rbiBBqZKHyXZaL6rO6B3K+OOtBx6JgorgCncfM+qrw8DALw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HvDJSAKvUXvYUfxet2UeRM5HCzS71bYvK3qw1VW9vuI=;
 b=Jtz2r9r/yk5cct4DQIYvKf6U4GVhqdqarKo6zMbNKg0md83D9qjfJoyk4ZmH4EiiVK/1KESYlzDI560WG70RymkJlBlMCDnkoghvEz/uJkflUR83QTAJxIGk2ffRPZ4DvLGMWzNwTMvx+FrzcfO3d3Tn7dmIokBSROzs6SDTieNVh7qvdKZE4Gc91FxgvSi0uBwzRooBKzenoM5GZCorT+NfMzsnBM7OZ0Yy2tv1uSmHCKFPFMT5VT6ipwgBClwJxwGesdpyw7AUfLFz8yWQ92EONzqW1weSrwwD9VXbvtisW54/NkUZfR6VoLmy6CedOtfyyHj8/dSsCbjaduQQKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7777.namprd11.prod.outlook.com (2603:10b6:930:71::14)
 by DM3PPFE441933A2.namprd11.prod.outlook.com (2603:10b6:f:fc00::f56)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.6; Tue, 8 Sep 2026
 07:41:21 +0000
Received: from CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::5a6:cd7:969c:fa41]) by CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::5a6:cd7:969c:fa41%4]) with mapi id 15.21.0382.014; Tue, 8 Sep 2026
 07:41:20 +0000
From: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Hogander, Jouni" <jouni.hogander@intel.com>, "jani.nikula@linux.intel.com"
 <jani.nikula@linux.intel.com>
CC: "Deak, Imre" <imre.deak@intel.com>
Subject: Re: [PATCH v2 5/5] drm/xe/pm: handle the PME capability and runtime
 pm routines
Thread-Topic: [PATCH v2 5/5] drm/xe/pm: handle the PME capability and runtime
 pm routines
Thread-Index: AQHdO3sIPw27qI2T70W8nAoUfZPQvra+MkmAgAYK34CAABbBgA==
Date: Tue, 8 Sep 2026 07:41:20 +0000
Message-ID: <72062813fd0dd71f67e0d201e628091bb8cd7d5f.camel@intel.com>
References: <20260903080410.489411-1-vinod.govindapillai@intel.com>
 <20260903080410.489411-6-vinod.govindapillai@intel.com>
 <f5e074540e36b2c9fee11a9bfd14beabcc8cf016@intel.com>
 <83e32e6c3fafdc6a5da34593718a8a403ccd3695.camel@intel.com>
In-Reply-To: <83e32e6c3fafdc6a5da34593718a8a403ccd3695.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7777:EE_|DM3PPFE441933A2:EE_
x-ms-office365-filtering-correlation-id: b5f72766-1579-4d0d-1954-08df0d7c9359
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|23010399003|376014|1800799024|366016|4143699003|56012099006|11063799006|5023799004|38070700021|10067099003|6133799003|22082099003|18002099003;
x-microsoft-antispam-message-info: MxtIj7tLUFw//J3nRD84yjX3oCHKlMOaSkiOUILscrlPQekksVSJ9bI5VZFATkc0cmbWA4TRzk3RKsuRK9gpITwlvUVWnB6ydgCn/29vE+ki7etJV+UHyi8Vf2p2JTEZXXQTpyEkJZXjrBUlaTcU16tjd36yKp9gBiC93odCreUxB7luREuxm4+0TT07/aZiN2MkQas71b9mdIekbflcEjjgvdZrPK3CWO73JpXJxGNS2NuO3Mt9RNZWYEacspPu/Piq9mhY5bxS5IyDFmyI08rqbYyHRBXNalBCqzWb+xU8tZsCXtsTSNUg42Nvhwh/24WBvU17P0ROU9dBnYGGhu5y3m2SnDni8librfBe9XTOwRTXKYl8P23hbRtFfjVq6yMkqrHYJnffCRdTnkx4x3QX/MQV8y2AoOwAHLAGwcS9mSDqYF6HHDMgbEyQiZUHfWaS0H+6sPsBiIEXxjDJ0uYPGoRPwSYAkcT5L0VOqTa1K5fTNKE9Y/QnRLd8a4+5Rp+ovnwiAZIVag5P8964+TdvC7+Az9eQyhhbYzCiUfM5TrZt7pwYHfLOrn+6JUG2JxzSTApYTS/u8ky1VNJgdYDAlXoYnA1mNIaOYLYCHaRw9k0WjxcDyp3f+VFGTcP215Q3ki7qQ7QP3mUmRds0fw+uHpRoe7PjjqQOqtpGfAumv2GD0Dhp6IA8Fxdh97Iv+YW44qXj+d41uHpZs53KNDgRerEwbKchcl4tEOu+OI8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7777.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(23010399003)(376014)(1800799024)(366016)(4143699003)(56012099006)(11063799006)(5023799004)(38070700021)(10067099003)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QVVnM1dxVnBRaGVTNVI0ZXltS0VEOGpITHF6dzNMM2dxaXY5enF2eTdBbm5Y?=
 =?utf-8?B?WXRwWUtpRjM4cGp3SW5pb2dnVENlYTVFMDNGSjNqZnphaFBxcnRKOUp2a1pv?=
 =?utf-8?B?V2Vnbm9Zd2xWN0VZQmxlVTVkNU9ScHZ5R2Y5dDZMVjg0QzNlRWt4akVGdGNx?=
 =?utf-8?B?SlUvRTFTSXdjM29hWllHRVMyYmcrQ3NqdnRlVUlLaDJOczU4SVZXVHNWUzdr?=
 =?utf-8?B?cTFhYXd3Tzk2WUdQeGhMUzJGU2NidDRDK2QvVUMwWHRvbnlGcjhuQ0x4Wm4x?=
 =?utf-8?B?WXhadE8xOUM3eThQSFFWOFZqNGp0eWtYcE4yMmt2ZTVUWlhzZWhtQXY3U053?=
 =?utf-8?B?dVN6bnpXSklrRzdlNkRZVHk5NVpOOVpkeTdudmxPckx0eVhWclVXUkJsZUZO?=
 =?utf-8?B?MzUyL1NHTUQ5LzZDakVuYWxjRis3d0tWOWMrQWNERkZacXpKdjlyb2VmTTVK?=
 =?utf-8?B?b3pLdU9SWVlYY3l0U1VmdDlTcHdNanlsSTNmOVF5SDhCbDlTa1dGd0h5MWRt?=
 =?utf-8?B?bEZTMURzYXM1MEdpQWhpcWZjbFhuSVg0OUZJU3dTUmsyeERycG1TK09RMXVF?=
 =?utf-8?B?Mmo4cFBWK0dabWRxZSt3bDhHT2VETVdxWTVPRXBHL3dwWEhrNUhqaTJudVlP?=
 =?utf-8?B?MFJXRnF6WkNrTEJtY1YyRmRkNDRYdVdiRzhtUC8vcHU0bG5INnBwWVQ1NWVM?=
 =?utf-8?B?S3hlQXhRazZBNHhleG1IOHJIMUlOSll5dUQrL0NxQlFNSmRldlRFbmhCYUM3?=
 =?utf-8?B?a3YrNWg0SW1IS2ZUeTFUM2F6S1NvMGdYeFgvTjdrdzBBYUE2aG9XWHhHbWJP?=
 =?utf-8?B?Y3dKdHlxL0UwQjdSaDdBNm9lcVAzK2JId2ZvTTB2VWhIRStORlBFbG5EcHRF?=
 =?utf-8?B?ZnIvaE1GWFY3cHo0WTUvSndVcE5MblNYait6UmFkR1R6ZjN0N0V6RCtPbU91?=
 =?utf-8?B?WFBLNW9Ccmo5TTRvMHdWYU85L2p5c0NyampmOWFyd0ZCTjVFTEdpNUZTeFB2?=
 =?utf-8?B?NGdRV3dnazNEaCtUOWVzV3oxV05aWFdqOEI2cVpxQ2JFaHVCeHlicE85cGVH?=
 =?utf-8?B?R2dUcFpqUC9pQzNHMG8xZTFKZzJWY3lZcGRlMjZwaWkrRnBobkEzcWNFaHVk?=
 =?utf-8?B?RDhoYnlKYngwb3RxRnpQMXA4c0doWThiY21MZUNHZUZJWXhyRkVLRnpDT0tq?=
 =?utf-8?B?OTc1Mnl2b0lwcG83ZzZkMVFYWUJCL2IwL0JkZlZxbG5ONUsxcEtlSTVNOUtB?=
 =?utf-8?B?ZmJJVHdNS0llYkRicHIzeDFSdWNBZzdkRGFmMWhzbGJSOGJtZnVwcEc0RENI?=
 =?utf-8?B?MVk4UjdKM05xLzRLUTFTcTlzNVBSZjhWNjNrb01CRnppcjFsaFFjbSt3Vy9L?=
 =?utf-8?B?djFJTk95Yk5vY3A4UVBuVkIxaEk0a05PS252THUvaWFWQmtYdWp0MmIwTWN5?=
 =?utf-8?B?dHA0c1JTeThJTHg3SDBkdlFndDhxV0h4ODQwd2V6TzRyUE9xME9sSC8xVXhM?=
 =?utf-8?B?bGdWUDdDL01vUFZGVlppQW1hSHRPRWoyZzlQMHBKNHpaRnY5cFNTSVFNQ3lp?=
 =?utf-8?B?djZPeE1Vc3hXcEtoeWFGT1k0aCtONG9pWGVmQ09pcjFFZlM1SXN3SkVJbkJO?=
 =?utf-8?B?S2ZjYlpEN2VGQ2c3d2h5MTl5V01ZaGdZeDhmMkI4UTM0aCt1T3hXeHkyRHlW?=
 =?utf-8?B?ZkJxZ0Iyd1RUMkVObEg1SElOOWdlSDN0N2QyTUI3TTd1dkcvRDE3ME1ZN1h5?=
 =?utf-8?B?VnRHdzBRREFQWW8reDFqdm51Wmhpb0lpUnFRSTNxcFJpRnlBL2pLR1lrenRG?=
 =?utf-8?B?cUZJV3NnV2IrN01TTFVrQUlkcG1YSjFrTk4xdlROdEtXNmYzbGJHZ1NROFFj?=
 =?utf-8?B?RHZXWFgxM0h5KytPS2JyK3cyMnVqMGFZVjl2ZHE3TEloOFFUd2ZFbkxhUkFQ?=
 =?utf-8?B?UUx2emVqUGhwMk9JT0todjFTN3VadVRtUmdEbTFqZllhMkN3Y0JMdzcvdjJo?=
 =?utf-8?B?SnRtdFR4N2FpREtkSkhrV0FQMFRjZTFpbkZqSHAycDJFb2JjWmFMVWR2V3Bw?=
 =?utf-8?B?VWVOaTNxM3RpL1B3M0Jsc3VoUEZIQVYybXVmUjZOeXdwT0tnbXRIMDRoWXhD?=
 =?utf-8?B?Qnk4eXFERVdEcmJ3ZFF0UkhZblF6NnRvbldQdmsrVUxvWHpDVlZJOXJ4czFv?=
 =?utf-8?B?NGljbGYrcG5BUjl4c2JHSjFTQlBDakFRSFM0ZFVZZkZXYU9QQ1lQWitYUDRm?=
 =?utf-8?B?RzFjSG13RjNMazNBQi96aHpZanhoUEExWStPY1pVd3Y4ZitYblFIL2h3K3JU?=
 =?utf-8?B?cmhkUHArRm9wWlUvVVl0RkZTQlZKTmMrNzQzYlB2ZXJVM1dqaElXYWYzQzRD?=
 =?utf-8?Q?Ya1MSEFSAiKkeXzSI8hs/Z7RKaNFqY93w3CIzqPJNLViD?=
x-ms-exchange-antispam-messagedata-1: b6tWmfAxbVs6cQIycqb3MU3fYcZVpEiG8ipp4F6m8zeYTcmZKZbRk7AN
Content-Type: text/plain; charset="utf-8"
Content-ID: <EF34F688FD17C247BCD8E90FE956BCB3@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 2Qzet95r0aaVuuw7A/MKQd7MGAydOKT6z884pMNXkh5KFdSiz2BmgBfwxt8A/eMyJTPK8Dc7PjmTpZZILUH44rT5oQTT8Tyhzd3b0ERi/VJUczxe64EJ376KYKwWcIRHsm1/kKBUlHUxqJ/MKAMtFz+PhrJp1aTBKeVQcrxap64daCiK6Lw7HMhFyYarqiyit2rTippBhFnmuZemSfWC2gp2HKMdT476BVFHUlBT2auSty+50qJ9PSbVMWztQ1YUEJcM3HK46sUkuwXIdycNwmEom8PHCThbCMJJts75Z8yuZa6FT4Womey3LJ4X7PZYSFsORdojP3BddGElV+edHg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7777.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5f72766-1579-4d0d-1954-08df0d7c9359
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2026 07:41:20.8985 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NjqFCMp9fCyzNHttGpvro8Edu0phCmSx0qztZIWsNq59gRvDStihhcC6BNW+Ad9X7H5TNEHfojzMd/MIdtV4PqrA1Csr6/f2PKrKdps3HyY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFE441933A2
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

T24gVHVlLCAyMDI2LTA5LTA4IGF0IDA2OjE5ICswMDAwLCBIb2dhbmRlciwgSm91bmkgd3JvdGU6
DQo+IE9uIEZyaSwgMjAyNi0wOS0wNCBhdCAxMzowMyArMDMwMCwgSmFuaSBOaWt1bGEgd3JvdGU6
DQo+ID4gT24gVGh1LCAwMyBTZXAgMjAyNiwgVmlub2QgR292aW5kYXBpbGxhaQ0KPiA+IDx2aW5v
ZC5nb3ZpbmRhcGlsbGFpQGludGVsLmNvbT4gd3JvdGU6DQo+ID4gPiBEdXJpbmcgdGhlIHJ1bnRp
bWUgc3VzcGVuZCwgY2hlY2sgaWYgZGV2aWNlIGlzIGNhcGFibGUgb2Ygd2FrZXVwDQo+ID4gPiBm
cm9tIFBNRS4gSWYgeWVzIHVwZGF0ZSB0aGUgaGVscGVyIHNvIHRoYXQgSVJRIHJlc2V0IGFuZCBI
UEQNCj4gPiA+IHBvbGxpbmcgY2FuIGJlIGhhbmRsZWQgYWNjb3JkaW5nbHkuIEZvciBQTUUgY2Fw
YWJsZSBkZXZpY2VzLA0KPiA+ID4gSFBEIHJlbGF0ZWQgSVJRcyBhcmUgbm90IHJlc2V0IGR1cmlu
ZyBydW50aW1lIHN1c3BlbmQgYW5kDQo+ID4gPiBkbyBub3Qgc3RhcnQgcG9sbGluZyBmb3IgSFBE
cyBldmVyeSAxMHMuIEluc3RlYWQgUE1FIGNhbiBiZQ0KPiA+ID4gZ2VuZXJhdGVkIGZyb20gSFBE
cyBhbmQgY29ycmVzcG9uZGluZyBydW50aW1lIHJlc3VtZSBjYWxscw0KPiA+ID4gY2FuIGJlIGlu
dm9rZWQgYnkgUE1FLg0KPiA+ID4gDQo+ID4gPiBCc3BlYzogNTI5NzksIDUyOTgwLCA2ODg1Nywg
Njg4NjcsIDY4OTcwDQo+ID4gPiBBc3Npc3RlZC1ieTogR2l0SHViX0NvcGlsb3Q6Y2xhdWRlLW9w
dXMtNQ0KPiA+ID4gU2lnbmVkLW9mZi1ieTogVmlub2QgR292aW5kYXBpbGxhaQ0KPiA+ID4gPHZp
bm9kLmdvdmluZGFwaWxsYWlAaW50ZWwuY29tPg0KPiA+ID4gLS0tDQo+ID4gPiDCoGRyaXZlcnMv
Z3B1L2RybS94ZS9kaXNwbGF5L3hlX2Rpc3BsYXkuYyB8IDEwICsrKysrKysrKysNCj4gPiA+IMKg
ZHJpdmVycy9ncHUvZHJtL3hlL2Rpc3BsYXkveGVfZGlzcGxheS5oIHzCoCA0ICsrKysNCj4gPiA+
IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BjaS5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwg
MTYgKysrKysrKysrKysrKysrLQ0KPiA+ID4gwqAzIGZpbGVzIGNoYW5nZWQsIDI5IGluc2VydGlv
bnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPiA+IA0KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS94ZS9kaXNwbGF5L3hlX2Rpc3BsYXkuYw0KPiA+ID4gYi9kcml2ZXJzL2dwdS9kcm0v
eGUvZGlzcGxheS94ZV9kaXNwbGF5LmMNCj4gPiA+IGluZGV4IDdiMjVjMDgxNDY3NC4uZmY0YTc0
YzVjNzYzIDEwMDY0NA0KPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL2Rpc3BsYXkveGVf
ZGlzcGxheS5jDQo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUvZGlzcGxheS94ZV9kaXNw
bGF5LmMNCj4gPiA+IEBAIC0yMzYsNiArMjM2LDE2IEBAIHZvaWQgeGVfZGlzcGxheV9pcnFfcG9z
dGluc3RhbGwoc3RydWN0DQo+ID4gPiB4ZV9kZXZpY2UgKnhlKQ0KPiA+ID4gwqAJaW50ZWxfZGlz
cGxheV9pcnFfcG9zdGluc3RhbGwoZGlzcGxheSk7DQo+ID4gPiDCoH0NCj4gPiA+IMKgDQo+ID4g
PiArdm9pZCB4ZV9kaXNwbGF5X3NldF9wbWVfY2FwYWJsZShzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwg
Ym9vbA0KPiA+ID4gcG1lX2Zyb21faHBkKQ0KPiA+ID4gK3sNCj4gPiA+ICsJc3RydWN0IGludGVs
X2Rpc3BsYXkgKmRpc3BsYXkgPSB4ZS0+ZGlzcGxheTsNCj4gPiA+ICsNCj4gPiA+ICsJaWYgKCF4
ZS0+aW5mby5wcm9iZV9kaXNwbGF5KQ0KPiA+ID4gKwkJcmV0dXJuOw0KPiA+ID4gKw0KPiA+ID4g
KwlpbnRlbF9ocGRfc2V0X3BtZV9jYXBhYmxlKGRpc3BsYXksIHBtZV9mcm9tX2hwZCk7DQo+ID4g
DQo+ID4gVGhlIGRvd25zaWRlIHdpdGggdGhpcyBpcyB0aGF0IEkndmUgYmVlbiB0cnlpbmcgaGFy
ZCB0byAqcmVkdWNlKg0KPiA+IHRoZQ0KPiA+IG51bWJlciBvZiBkaXJlY3QgbG93LWxldmVsIGNh
bGxzIGZyb20gaTkxNSBhbmQgeGUgY29yZSB0byBkaXNwbGF5Lg0KPiA+IA0KPiA+IFRoZXJlIGFy
ZSAxMDArIGNhbGxzIGFscmVhZHkuIElNTyB3ZSBuZWVkIHRvIGRyb3AgdGhlbSB0byB0aGUNCj4g
PiBiYWxscGFyaw0KPiA+IG9mIGxlc3MgdGhhbiBoYWxmLg0KPiA+IA0KPiA+IFRoaXMgd291bGQg
Z28gZGlyZWN0bHkgdG8gYSBUT0RPIGxpc3Qgb2YgdGhpbmdzIHRvIHJlZmFjdG9yIGFuZA0KPiA+
IGNsZWFuDQo+ID4gdXAuDQo+ID4gDQo+ID4gRmVlbHMgbGlrZSBpdCB3b3VsZCBiZSBtb3JlIGNs
ZWFuIHdpdGggYSBwYXJlbnQgaW50ZXJmYWNlIGZvciB0aGUNCj4gPiBkaXNwbGF5IHRvIGFzayBp
ZiBwbWUgaXMgYXZhaWxhYmxlLCB3aGVuIG5lZWRlZCwgZXZlbiB0aG91Z2ggdGhlDQo+ID4gcGFy
ZW50DQo+ID4gaW50ZXJmYWNlIGlzIGFsc28gdG9vIGJpZy4uLg0KPiANCj4gV291bGQgaXQgYmUg
b2sgdG8gc29sdmUgdGhpcyBieSBkb2luZyBhbGwgdGhpcyBpbiBkaXNwbGF5IHJ1bnRpbWUNCj4g
Y2FsbGJhY2tzPw0KPiANCj4gUG9zc2libGUgZDNjb2xkIGVudHJ5IGNvdWxkIGJlIGZvdW5kIG91
dCBieSB1c2luZyBwY2lfdGFyZ2V0X3N0YXRlLg0KPiANCj4gSXMgaXQgb2sgdG8gYWNjZXMgcGNp
IGRldmljZSAocGNpX2VuYWJsZV93YWtlIGFuZCBwY2lfdGFyZ2V0X3N0YXRlKQ0KPiBpbg0KPiBk
aXNwbGF5IHBtIHJ1bnRpbWUgY2FsbGJhY2tzLg0KPiANCj4gQlIsDQo+IEpvdW5pIEjDtmdhbmRl
cg0KPiANCj4gPiANCj4gPiBCUiwNCj4gPiBKYW5pLg0KPiA+IA0KPiA+IA0KPiA+IA0KDQo+ID4g
DQpCdHcsIHRoZXJlIGlzIGFuIHVwZGF0ZWQgdmVyc2lvbiBvZiB0aGlzIHBhdGNoLi4gdGhlIGRp
ZmYgaXMgDQoNCisjZGVmaW5lIEhBU19QTV9QTUVfU1VQUE9SVCh4ZSkgKEdSQVBISUNTX1ZFUngx
MDAoeGUpID49IDM1MDApDQorYm9vbCB4ZV9wbV9wbWVfc3VwcG9ydGVkKHN0cnVjdCB4ZV9kZXZp
Y2UgKnhlKQ0KK3sNCisJc3RydWN0IHBjaV9kZXYgKnBkZXYgPSB0b19wY2lfZGV2KHhlLT5kcm0u
ZGV2KTsNCisNCisJaWYgKCFIQVNfUE1fUE1FX1NVUFBPUlQoeGUpKQ0KKwkJcmV0dXJuIGZhbHNl
Ow0KKw0KKwlpZiAoIWRldmljZV9tYXlfd2FrZXVwKCZwZGV2LT5kZXYpKQ0KKwkJcmV0dXJuIGZh
bHNlOw0KKw0KKwlyZXR1cm4gcGNpX2Rldl9ydW5fd2FrZShwZGV2KTsNCit9DQoNCkJlY2F1c2Ug
SSBub3RpY2VkIHRoYXQgd2UgbmVlZCB0byBjYWxsICJwY2lfZGV2X3J1bl93YWtlIiB0byBzZWUg
dGhlIGh3DQpwb2xpY3kgYWxzbyBzdXBwb3J0cyBQTUUuIGRldmljZV9tYXlfd2FrZXVwKCkgY2hl
Y2sgdGhlIGFueSB1c2VyDQpjb250cm9sbGVkIGNoYW5nZXMgdG8gdGhlIHdha2V1cCBwb2xpY3kg
dGhyb3VnaCBkZWJ1Z2ZzLg0KSEFTX1BNX1BNRV9TVVBQT1JUKCkgZm9yIHRoZSBic3BlYy4uIHdo
aWNoIGlzIG5vdCByZWFsbHkgbmVlZGVkIEkgdGhpbmsNCi0gcGNpX2Rldl9ydW5fd2FrZSgpIHNo
b3VsZCBoYW5kbGUgdGhhdC4gQnV0IGFueXdheSB0aGlzIGdpdmVzIGENCmNsYXJpdHkgd2hlbiB0
aGlzIGZlYXR1cmUgd2FzIGludHJvZHVjZWQgYW5kIGlmIGFueSBvdGhlciBjb2RlDQp2YXJpYXRp
b25zIGFyZSByZXF1aXJlZCBpbiBmdXR1cmUuDQoNCkFsc28gbm90ZSwgcGNpX3RhcmdldF9zdGF0
ZSgpIGlzIGEgc3RhdGljIGZ1bmN0aW9uLiBCdXQgYW55d2F5DQpwY2lfZGV2X3J1bl93YWtlKCkg
dXNlIHRoYXQgaW50ZXJuYWxseSB0byBzZWUgcmV0dXJuIGlmIFBNRSBpZg0Kc3VwcG9ydGVkLg0K
DQpUcnlpbmcgdG8gc29sdmUgdHdvIHRoaW5ncyBoZXJlLi4NCg0KMS4gaWYgUE1FIGlzIHN1cHBv
cnRlZCB3ZSBuZWVkIHRvIGF2b2lkIEhQRCBJUlEgcmVzZXRzIGR1cmluZyB4ZSBJUlENCnJlc2V0
cyB3aGljaCBpcyBwYXJ0IG9mIHRoZSBzdXNwZW5kIHJvdXRpbmUuDQoNCjIuIEF2b2lkIEhQRCBw
b2xsaW5nDQoNCldlbGwuLiBJIHdhc24ndCBzdXBlciBoYXBweSBhYm91dCB0aGlzIGludGVsX2hw
ZF9zZXRfcG1lX2NhcGFibGUoKQ0KaW50ZXJmYWNlLiBUaGUgYWx0ZXJuYXRpdmUgaXMgImtlZXBf
SHBkIiBwbHVtYmVkIGluIHRvIHRoZSBJUlEgcmVzZXQNCmNhbGxzIGluIHRoZSBwcmV2aW91cyBp
dGVyYXRpb24sIHRvIGF2b2lkIHJlc2V0dGluZyBIUEQgSVJRcyBmb3IgUE1FLg0KDQpTbyBmYXIg
aW50ZWxfaHBkX2luaXQsIGludGVsX2hwZF9wb2xsX2VuYWJsZS9kaXNhYmxlIGFyZSBiZWluZyBj
YWxsZWQNCmZyb20geGVkaXNwbGF5IGFuZCBoYXZlIGNvbW1vbiBpbXBsZW1lbnRhdGlvbiBmb3Ig
eGUgYW5kIGk5MTUuIFRoYXRzDQp0aGUgcmVhc29uIEkgZGlkbnQgbW92ZSB0aGlzIHRvIHRoZSBp
bnRlbF9wYXJlbnQgaW50ZXJmYWNlLg0KDQpBbHNvIEkgd2FudGVkIHRvIGtlZXAgYSBzaW5nbGUg
cG9pbnQgY2hlY2sgZm9yIHRoZSBwbWVfY2FwYWJsaXR5IGluDQp4ZV9wY2lfcnVudGltZV9zdXNw
ZW5kKCkgc28gdGhhdCB0aGUgc291cmNlIG9mIHRoZSBsb2dpYyBmb3IgYXZvaWRpbmcNCkhQRCBJ
UlEgcmVzZXRzIGFuZCBhdm9pZGluZyBIUEQgcG9sbGluZyBmcm9tIGEgc2luZ2xlIGNhbGwgdG8g
Y2hlY2sgcG1lDQpjYXBhYmlsaXR5IC0gYXMgL3N5cy9idXMvcGNpL2RldmljZXMvMDAwMDowMDow
Mi4wL3Bvd2VyL3dha2V1cCBjb3VsZA0KYWZmZWN0IHRoZSB3YWtldXAgcG9saWN5Lg0KDQpCUg0K
Vmlub2QgDQo=
