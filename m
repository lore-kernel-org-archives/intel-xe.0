Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F53606A31B
	for <intel-xe@archiver.kernel.org>; Wed,  4 Nov 2026 01:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Fp4pKMzO
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E22210E662;
	Wed,  4 Nov 2026 01:31:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B9E110F8E6;
 Wed,  4 Nov 2026 01:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793755823; x=1825291823;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LBlVr7KAH9hryqnr+yZyfK95520HFD3ZFhRl9PM9x68=;
 b=Fp4pKMzOxsmjdJHAU8MGGG2LgM1ctg+ac87yzp63s3/n8clS8pMY2mKG
 HmY5g083eRAOWgLStg5OSzUhxFz6eKCdpytK9LhOuXULSAXySPUpbHMyo
 978giEw4tnRG7aGk90WS0nhEm2kuv3hfHOOHmdhV86DjCxZcnk1y0yduG
 tXh+Kz6ux2p6MXeq7dl/I7YmioVb68bd7m06EcyCg51KbFNymE5VpkMgw
 7ZyLr9cIcH/mrjz1mGBmHiLGJH04Xif0IYOXB8/wIHADp7JV3MYaCdOT/
 8NJ/QKyP92Mu8MCFs5paP9XJIW429EAG0iGUSz+/ioU+rczAhozcp6RIm g==;
X-CSE-ConnectionGUID: NdIuTh+lSFmTBmuSUU7lvA==
X-CSE-MsgGUID: D6U/XyqUQ7KF6Dai13ZT6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2378724"
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="2378724"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 17:30:22 -0800
X-CSE-ConnectionGUID: YQclOm4IQ/mZAIWeIX/ofw==
X-CSE-MsgGUID: 3NsVKsAaQ4ab1KZMj+8r5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="6921772"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 17:30:23 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 3 Nov 2026 17:30:22 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 3 Nov 2026 17:30:22 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.33) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 3 Nov 2026 17:30:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RQVEJDH7BvxWkCiANOSZ165hYrUMVs8lq2wMoCr2a8PqkuCLYGrG/wnCA5NyB4tPd6bNmDjd/ud3j0TyCvCB5OFuuEtRaSoqfcHUJ3KraCdAwhLADn4ksUVPfKh9R4JDU+Ga0AT7uRg1Vr4NYu3HsN0BOV9Q+wkA/ZzkTrIWxmAbTmuvLSLvAa16Z+jKU7UBLaeUwhWqvUF25NVgZKHfWdmWH66D9J1w2gfXe5lJLtJYfcqMhTFekYeCgJIWdj62dEAETrk1nHFaIdqxUgZEJouGvXgThrZFjFmaRsZZZ1vdSXwcZGMuQzdQypmypLErtrLAeJ9RHIXpQWGTKwlLAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LBlVr7KAH9hryqnr+yZyfK95520HFD3ZFhRl9PM9x68=;
 b=uBTEygSYk8WKWJyHWsgR+g08+zNm/lf81wAJEX96fyltZ7d9TleEokZVF3RI4WmI6N719WqNGPNGhr12kgqhup+CtLIwKJGZgdpXe11jVHmFhGwLmF5/G6vBkjQXlO+Tv+oZhIM6AyF2PtTPKOhzo9WZ3HT28+Lj7V5U/Pj+FCX1eAgSVeftucZG4AhIZF7CHywH8yeUbXPRN9zHMyQ9zpZ7TmEUY50ydBW+OaXC9BSWnLOj7hMhS32G8zmlE8/+LYDlD7q1dvSxgvBIPcSoex3vU++3oOxBxt681Xdi+72jVNc63D+x4J72jyhVotDE3tjst6tADxC3U2B2O753yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by DM6PR11MB4755.namprd11.prod.outlook.com
 (2603:10b6:5:2ae::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 01:30:13 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff%8]) with mapi id 15.21.0569.011; Wed, 4 Nov 2026
 01:30:12 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: Jani Nikula <jani.nikula@linux.intel.com>, "Borah, Chaitanya Kumar"
 <chaitanya.kumar.borah@intel.com>, "Shankar, Uma" <uma.shankar@intel.com>
Subject: RE: [PATCH v4 7/7] drm/i915/dp: Don't limit the Link M/N ratio with
 the symbol timing generator
Thread-Topic: [PATCH v4 7/7] drm/i915/dp: Don't limit the Link M/N ratio with
 the symbol timing generator
Thread-Index: AQHda3qmZ7CpmEHQgUOFVQyDokb++bcdILTg
Date: Wed, 4 Nov 2026 01:30:12 +0000
Message-ID: <DS4PPFE901A304F36C9292E8FFF415A3BB4E3682@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20261103-vlk-64036-dp-symbol-tg-v4-0-6cf8a588b54c@intel.com>
 <20261103-vlk-64036-dp-symbol-tg-v4-7-6cf8a588b54c@intel.com>
In-Reply-To: <20261103-vlk-64036-dp-symbol-tg-v4-7-6cf8a588b54c@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|DM6PR11MB4755:EE_
x-ms-office365-filtering-correlation-id: 736f5da3-1d74-4406-232f-08df3a132be6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|38070700021|260925022911599003|260925021911599003|260925021311599003|11063799006|4143699003|56012099006|261009223027099003|261026121527099003|261102123227099003|261021121427099003|261021123027099003|10067099003|18002099003|22082099003|3023799007;
x-microsoft-antispam-message-info: LChn9BhsUrTm3j9eUg42rpl4OkcHsJliThjI9ANX6bexSFFU6fbgfHLGcKPymFBk9b9qkeyKbvdTqjUGIzF8353iAZup8VTUgunLkBghc1IIeMak31A0sbRm7ODlS7VPnHzVVx5niSdzFp5Wxx4CqOqs7p1j0yM41e/T7m+O949lW2x60WlsYTYo4A2V27gGkxdcmtuetH+gzfshX6+Hh/qtDLBIRD0FiUJYpQjfXswVUJ3B7xCm4yj/Ngz2qc5ihhHlSNBKGFa3kFamHdeNYNJBZnS4woEMThh90izJ5smJAVEUnwWisgToO1eRb7mCoIwi3w/8bEqrceeYbul/FrZ+UEqvVcU6upwq9WTnjtovKIUQ5H2DLXbSXORlPO4dcp4IEbsRQT8plZfvpi1fxd6OXgE0YV03zhFnpJQ28783RoNikuRuj0247G38CQ23NExIrhvUcVG3TBP7Ek6R63ntoQJUwqqYX0ayTjtdsQJ/hr8sWMKcqt37bhplbQopvGWRiIIY39Xubr9vYslihhW27mSl/0zXJ/O0U4xSvYrK8vdzeTb5wF6PMocPHzMu7wantqKx3uoOyPZg+bxF+Foz+o0IC5lK7cPLRxjVzk59uPtqprgJ/N1n5lE2RmU1MyZMb/MYaB8NgEsbUlT5ZGDLmOSCIVbDxiKlmoMvbBd/CO9zeBpkZuamh9YJ+tCPaiLNIXYZ3q4FwqueGyMXRjhEetTYLU6tGU3AMb92/DQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(38070700021)(260925022911599003)(260925021911599003)(260925021311599003)(11063799006)(4143699003)(56012099006)(261009223027099003)(261026121527099003)(261102123227099003)(261021121427099003)(261021123027099003)(10067099003)(18002099003)(22082099003)(3023799007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bmFzUmRWeVQxRFFsT3Vrb2Z1c2xSZDJNeHplTWcvbmtHSWtvNTM4R0xrQ2M3?=
 =?utf-8?B?WldIK0hzdTU0bmMvSUFtOEowQzVoN3YyMC84WEVuUDVETkRtVjFtQjNhZnNm?=
 =?utf-8?B?bHgrUk5hTHorM2F5WWhPaTFNcEpPOVRYWC9BL0RyNTdUYkNpMWtrM0txWnUv?=
 =?utf-8?B?bmZEc1UwTWpkOUUrdlRLVTlOV3JFOFY1QUtnejY0TW9aSUlCbzJGS0lPd1dh?=
 =?utf-8?B?K0ROZ24wWFUxbzJrbW9WQnUwWW5QTDN5U1dhSE5oMFNDanEwRC9pVnhyUjNQ?=
 =?utf-8?B?bjdITDlGcmpaTEFpZGkwYW44TThMd1J1S2gxZnQ0a0kwMFJDL3ZINS9RRjRj?=
 =?utf-8?B?WFVhZjQrYWVsR2NjN3NFd2IydlhSeUNYZ1diT3JxVVo4V0hPMFRrUDNSVW14?=
 =?utf-8?B?aGhQUnoydURqbmxsS0dJRjMzYVJTMEtyS1lnd2p3Tzl1SldOT2FsVGQwZlho?=
 =?utf-8?B?TFZuVEwrS2xNbVFoeHRzRFhGOExNdkVqekJzeFhFZHFhc1FyUFpzeU1kMU9t?=
 =?utf-8?B?TTZnREdnK1FlQ2ExSjVZN3dnWGpPeUZpaU5YaEk2MGdMM2ZxSStlSEdOM2p3?=
 =?utf-8?B?WVEwSjZIYXRjZk4xamcrd2lkSmIrR2lKOXNjRENjcVJxYUdnWHN1K1dUelhy?=
 =?utf-8?B?M1dPaGdkeGo2YWFET3pJMUJVNkxsZXlRMTd3aFF2WUpmTWY4WDhtNmtpOHM3?=
 =?utf-8?B?dVhiUWNyaXl0NGhSeDJ6U3BWZDJxcFpCbHhJT05oVVhMQ0oxS1hkWGlFNXlm?=
 =?utf-8?B?TmdGYkVOSUpvcmNQMjUrN3l3L1NySUxWUWQxVXk3WTJTdHIxcTg4WjR3L3VY?=
 =?utf-8?B?ZmhwNU1sOWJUM0xJRUlBMEZ6VWNCMGZ4akVzcXdmKzFCRGROWWtPU01OZHNY?=
 =?utf-8?B?KzRVTnJES0x4ZFpiYmtJN2htbHYxdE8zZnA1aWE2Rm1OSHd4TEZpNlJ2Tjl2?=
 =?utf-8?B?NkV3eWRLWWtTTHBvZHVTRnkxS0p2M1IxSDcwUWcxakZpcVhXZWsrQVBGS3BW?=
 =?utf-8?B?eXlldWs0cGhvSFh3eWMrSGNuRUh5OUR5TUZyTWNMT2prZW5uTkNPZ1RacjVn?=
 =?utf-8?B?RVR0TzdoSlhadnFLZk02ZHJGWmtXZUhRRkI1S1QvYmdSaXlzZ3g5UHhieXJl?=
 =?utf-8?B?YU4vbXVaVjJ2V1RrWG5hc0hzMFJoaTJKa3Z3RTcxWjVkcUQ5blR2MHhZMXJR?=
 =?utf-8?B?OUZMamFNd1VmaHJ6WHRHU2loL0RmdmRabVlaNW8zWVlQY0dtblIrUnE3MS8r?=
 =?utf-8?B?SHlFZ08zM2o3bVFTMngyei9jL3NTbmcxTGN2RXY4ZFgxL3MyS1ZPeFV0a1Fa?=
 =?utf-8?B?T1NlcEpZQWJWVnVSdVZ3elVQaFZ2WE91eEVoaUZNaC9sM0ZxcGRsZ3VmQ01N?=
 =?utf-8?B?T1JmNjZZakJBRGNZcmRLR3o2UDBDdFBhV0lCOXh0VXJWTVFrVHlyRG9pVzVm?=
 =?utf-8?B?TS8wUkgxMVgxclU2MzkwUmZUdFdwbkdOS3N2TnhvUndCWTVyVDVjMVMwdUxs?=
 =?utf-8?B?OXJsejNHMTBGRzcrdkVoejRObCtBSnJYbmR6NVpJdnJYSHU5RHJEelFFUkR6?=
 =?utf-8?B?MHNDNU9vbDg2UDF2R2dWZDUvUVhqNXQxOE1VVmN1dkU0a2xDM05JUjlReVc5?=
 =?utf-8?B?Zi8ydnJ4UHBNeVdFcm1iRE1zVjNQK0FLWnZwa09LRHQwV1p6SmlMMDJQMWVY?=
 =?utf-8?B?VkU1SERaWnY3eVUzK3U5VERHbXMyR2U3dXJvZm5nUHhMeU5JTm1wOThDY0lr?=
 =?utf-8?B?MlRCMVAySVRhVWtSdHlsMFNvSk5SSWlKU3hkaUp6ZXdteThManJaT2wxVHlk?=
 =?utf-8?B?S1I5TmIvTkc0S09tcUR2aTVTbHBmT3YrcjRyZVJoNko5MENRUTZKQ2NTeWtE?=
 =?utf-8?B?eEVwUS9lQWdLTTVpSHZhd25UWHpsVXFIUnlwU1h1c3p6VFZYSnBhVTE1eGxG?=
 =?utf-8?B?YUlNSTFqMEJlY202UDIrdW5DMVp6S1VnTzlQUVRvK2J4RmN0emFjaWEwN1BY?=
 =?utf-8?B?cEpZVHpEaTQ5TTk0ay9uUkFYSXIxL1JEdjdrdTVBR2NYalhjVXgvOFlpNUlG?=
 =?utf-8?B?bm5QeW1OalVoUG5SRUNvVC9RK0t4cnlkYjljdEVha09GVkpnWllpa3pQMjBY?=
 =?utf-8?B?Vm5mV1B3aXlweTVCeElic2xkVlFKOFVJdzNVQzhKdW1wcXBWZnpWQTQwYlFp?=
 =?utf-8?B?YXdzVXVxSHhVSmtCbVVSdDhHUnQ4NDdiYnRmcHF3dEVOZjUrOW94NjVXRThK?=
 =?utf-8?B?Z0owZUFydHlCNWlrME43bk5kN2wvL2NjU0dsTWdIaEVhUW1lN1o2L1BCcDRw?=
 =?utf-8?B?ZHVkbWwyWG52dUFqZm5qWGtvU2ZMK29ockRxUlZqMUh6NGtPeHJ2UT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: lUWg9NAwESuXAoNoKOZtiIEGit0yM+Hhk4xYyRcNBoLVLKFlAVtKavTauZurMcrPHZlMID5pa3TGS0T5M+tFpSTjy4LZxJtB8JlH/u3JOUKuTd1qlWg6MmbLKVyqDIThfXL0LAiYn3ACkj9DDiUc0rZkpazR0QrtCnlgiUCkakf9mfOcknGXA43o/kkJ5nEUgOwFBPF53O1X0ialHhONanbfgeo3VnoCPZzTsiC3wo1fcFPEjQpA+n8LRfU3mbzCZPqc+BDEDEDCd25OkE8lA9q7WTMFEZrlJE3QPEBSfv7zOOSg5C6P70eaN1BcFSWSeTa/H7BMzUX+E2MwmYtE5Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 736f5da3-1d74-4406-232f-08df3a132be6
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2026 01:30:12.4942 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: khkG58PN+GQ6Z/SJBh6pguCxWgrn0FKn6G4fW9emuhBum0SNk0Js1vFwn3rnRkEjR9XxM/hAghUNFkaq+39HFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4755
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
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

PiBTdWJqZWN0OiBbUEFUQ0ggdjQgNy83XSBkcm0vaTkxNS9kcDogRG9uJ3QgbGltaXQgdGhlIExp
bmsgTS9OIHJhdGlvIHdpdGggdGhlDQo+IHN5bWJvbCB0aW1pbmcgZ2VuZXJhdG9yDQo+IA0KPiBU
aGUgbGltaXQgb24gdGhlIExpbmsgTS9OIHJhdGlvIG9ubHkgYXBwbGllcyB0byB0aGUgcGl4ZWwg
YmFzZWQgdGltaW5nDQo+IGdlbmVyYXRvciwgdGhlcmUgaXMgbm8gc3VjaCByZXN0cmljdGlvbiB3
aGVuIHRoZSBzeW1ib2wgYmFzZWQgdGltaW5nDQo+IGdlbmVyYXRvciBpcyB1c2VkLg0KPiANCj4g
QnNwZWM6IDY4OTIyDQo+IFNpZ25lZC1vZmYtYnk6IEFydW4gUiBNdXJ0aHkgPGFydW4uci5tdXJ0
aHlAaW50ZWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfZHAuYyAgICAgfCAxNyArKysrKysrKysrKysrLS0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2k5
MTUvZGlzcGxheS9pbnRlbF9kcF9tc3QuYyB8ICA0ICsrKy0NCj4gIDIgZmlsZXMgY2hhbmdlZCwg
MTYgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9kaXNwbGF5L2ludGVsX2RwLmMNCj4gaW5kZXgNCj4gNzg4YzE2ZGY5ODAxMTMxMjk0Yzcz
NDIwYzJjMGQ0ZDNlYzg0ODMxMC4uYThmYTA4MDkwNzllOGIzZjZmYjU3NGNmYg0KPiA3M2ZiNmJi
OGIwMTljYzMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfZHAuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmMN
Cj4gQEAgLTEyNzcsOCArMTI3NywxMiBAQCBzdGF0aWMgYm9vbCBpbnRlbF9kcF9oYXNfc3ltYm9s
X3RnKHN0cnVjdA0KPiBpbnRlbF9kaXNwbGF5ICpkaXNwbGF5LCBib29sIGlzX21zdCwgYiAgfQ0K
PiANCj4gIHN0YXRpYyBpbnQNCj4gLWludGVsX2RwX2dldF9tYXhfbV9uX3JhdGlvKHN0cnVjdCBp
bnRlbF9kaXNwbGF5ICpkaXNwbGF5KQ0KPiAraW50ZWxfZHBfZ2V0X21heF9tX25fcmF0aW8oc3Ry
dWN0IGludGVsX2Rpc3BsYXkgKmRpc3BsYXksIGJvb2wgaXNfbXN0LA0KPiAraW50IGxpbmtfcmF0
ZSkNCj4gIHsNCj4gKwkvKiBObyBMaW5rIE0vTiByYXRpbyBsaW1pdCB3aXRoIHRoZSBzeW1ib2wg
YmFzZWQgdGltaW5nIGdlbmVyYXRvciAqLw0KPiArCWlmIChpbnRlbF9kcF9oYXNfc3ltYm9sX3Rn
KGRpc3BsYXksIGlzX21zdCwNCj4gZHJtX2RwX2lzX3VoYnJfcmF0ZShsaW5rX3JhdGUpKSkNCj4g
KwkJcmV0dXJuIElOVF9NQVg7DQo+ICsNCj4gIAlpZiAoRElTUExBWV9WRVIoZGlzcGxheSkgPj0g
MzUpDQo+ICAJCXJldHVybiAyMjsNCj4gDQo+IEBAIC0xMzA4LDcgKzEzMTIsOSBAQCBib29sIGlu
dGVsX2RwX2Nhbl9zdXBwb3J0X21fbihzdHJ1Y3QNCj4gaW50ZWxfZGlzcGxheSAqZGlzcGxheSwN
Cj4gIAkJCSAgICAgIGNvbnN0IHN0cnVjdCBpbnRlbF9jcnRjX3N0YXRlICpjcnRjX3N0YXRlLA0K
PiAgCQkJICAgICAgaW50IHBpeGVsX2Nsb2NrLCBpbnQgbGlua19yYXRlKSAgew0KPiAtCWludCBt
YXhfbV9uX3JhdGlvID0gaW50ZWxfZHBfZ2V0X21heF9tX25fcmF0aW8oZGlzcGxheSk7DQo+ICsJ
Ym9vbCBpc19tc3QgPSBjcnRjX3N0YXRlICYmDQo+ICsJCSAgICAgIGludGVsX2NydGNfaGFzX3R5
cGUoY3J0Y19zdGF0ZSwgSU5URUxfT1VUUFVUX0RQX01TVCk7DQo+ICsJaW50IG1heF9tX25fcmF0
aW8gPSBpbnRlbF9kcF9nZXRfbWF4X21fbl9yYXRpbyhkaXNwbGF5LCBpc19tc3QsDQo+ICtsaW5r
X3JhdGUpOw0KPiAgCWVudW0gdHJhbnNjb2RlciBjcHVfdHJhbnNjb2RlciA9IFRSQU5TQ09ERVJf
QTsNCj4gIAl1MzIgbGlua19tLCBsaW5rX247DQo+ICAJaW50IG1fbl9yYXRpbzsNCj4gQEAgLTEz
MzEsNyArMTMzNywxMCBAQCB2b2lkIGludGVsX2RwX2NoZWNrX21fbl9yYXRpbyhjb25zdCBzdHJ1
Y3QNCj4gaW50ZWxfY3J0Y19zdGF0ZSAqY3J0Y19zdGF0ZSwNCj4gIAkJCSAgICAgIHN0cnVjdCBp
bnRlbF9saW5rX21fbiAqbV9uKQ0KPiAgew0KPiAgCXN0cnVjdCBpbnRlbF9kaXNwbGF5ICpkaXNw
bGF5ID0gdG9faW50ZWxfZGlzcGxheShjcnRjX3N0YXRlKTsNCj4gLQlpbnQgbWF4X21fbl9yYXRp
byA9IGludGVsX2RwX2dldF9tYXhfbV9uX3JhdGlvKGRpc3BsYXkpOw0KPiArCWludCBtYXhfbV9u
X3JhdGlvID0NCj4gKwkJaW50ZWxfZHBfZ2V0X21heF9tX25fcmF0aW8oZGlzcGxheSwNCj4gKwkJ
CQkJICAgaW50ZWxfY3J0Y19oYXNfdHlwZShjcnRjX3N0YXRlLA0KPiBJTlRFTF9PVVRQVVRfRFBf
TVNUKSwNCj4gKwkJCQkJICAgY3J0Y19zdGF0ZS0+cG9ydF9jbG9jayk7DQo+ICAJaW50IG1fbl9y
YXRpbzsNCj4gDQo+ICAJbV9uLT5ieXBhc3NfbV9uX3JhdGlvX2xpbWl0ID0gZmFsc2U7DQo+IEBA
IC0yODE1LDcgKzI4MjQsNyBAQCBpbnRlbF9kcF9jb21wdXRlX21fbl9yYXRpb19saW1pdHMoc3Ry
dWN0DQo+IGludGVsX2RwICppbnRlbF9kcCwNCj4gIAkJZHJtX2RiZ19rbXMoZGlzcGxheS0+ZHJt
LA0KPiAgCQkJICAgICJbQ09OTkVDVE9SOiVkOiVzXSBObyBsaW5rIGNvbmZpZyB3aXRoIGEgTGlu
aw0KPiBNL04gcmF0aW8gPD0gJWRcbiIsDQo+ICAJCQkgICAgY29ubmVjdG9yLT5iYXNlLmJhc2Uu
aWQsIGNvbm5lY3Rvci0+YmFzZS5uYW1lLA0KPiAtCQkJICAgIGludGVsX2RwX2dldF9tYXhfbV9u
X3JhdGlvKGRpc3BsYXkpKTsNCj4gKwkJCSAgICBpbnRlbF9kcF9nZXRfbWF4X21fbl9yYXRpbyhk
aXNwbGF5LCBmYWxzZSwgMCkpOw0KDQpKdXN0IHVzZSBjcnRjX3N0YXRlLT5wb3J0X2Nsb2NrIGlu
c3RlYWQgb2YgMC4NCg0KV2l0aCB0aGF0IGZpeGVkIExHVE0sDQpSZXZpZXdlZC1ieTogU3VyYWog
S2FuZHBhbCA8c3VyYWoua2FuZHBhbEBpbnRlbC5jb20+DQoNCj4gDQo+ICAJCXJldHVybiBmYWxz
ZTsNCj4gIAl9DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2lu
dGVsX2RwX21zdC5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcF9t
c3QuYw0KPiBpbmRleA0KPiA4MWFjNDU0NjAzNjAzZGY0MmRiNDc3ZGRiMjZjZmIyZjYyMGRjZmVh
Li5mZTljZGY3NzFmNDgxZmM4YThiOGYzZjI5ZTQNCj4gYTI0YWE1M2E1M2Y5NCAxMDA2NDQNCj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcF9tc3QuYw0KPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwX21zdC5jDQo+IEBAIC0xNTcw
LDcgKzE1NzAsOSBAQCBtc3RfY29ubmVjdG9yX21vZGVfdmFsaWRfY3R4KHN0cnVjdA0KPiBkcm1f
Y29ubmVjdG9yICpfY29ubmVjdG9yLA0KPiAgCQkJCQkgICBtaW5fbGlua19icHBfeDE2LA0KPiAg
CQkJCQkgICBid19vdmVyaGVhZF9mbGFncyk7DQo+IA0KPiAtCWlmICghaW50ZWxfZHBfY2FuX3N1
cHBvcnRfbV9uKGRpc3BsYXksIE5VTEwsIG1vZGUtPmNsb2NrLA0KPiBtYXhfbGlua19jbG9jaykp
IHsNCj4gKwkvKiBNU1QgYWx3YXlzIHVzZXMgdGhlIHN5bWJvbCBiYXNlZCB0aW1pbmcgZ2VuZXJh
dG9yLCB3aGljaCBoYXMgbm8NCj4gTGluayBNL04gcmF0aW8gbGltaXQgKi8NCj4gKwlpZiAoIUhB
U19EUF9TWU1CT0xfVEcoZGlzcGxheSkgJiYNCj4gKwkgICAgIWludGVsX2RwX2Nhbl9zdXBwb3J0
X21fbihkaXNwbGF5LCBOVUxMLCBtb2RlLT5jbG9jaywNCj4gK21heF9saW5rX2Nsb2NrKSkgew0K
PiAgCQkqc3RhdHVzID0gTU9ERV9DTE9DS19ISUdIOw0KPiAgCQlyZXR1cm4gMDsNCj4gIAl9DQo+
IA0KPiAtLQ0KPiAyLjI1LjENCg0K
