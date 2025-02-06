Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4A51C02199
	for <intel-xe@archiver.kernel.org>; Thu,  6 Feb 2025 01:54:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB22210E1FF;
	Thu,  6 Feb 2025 01:54:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BfayxxVA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A896210E1FF
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Feb 2025 01:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738806899; x=1770342899;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zyw/YN+MfDpI1Aa+/PRg9AHE8xKLdVpdcaYt30g8GZs=;
 b=BfayxxVAqLZP4xDoiNPCq3Xl8aKwKgUQpDgiMvXVth4KJcSctOZA7Qio
 CUMz6PsOr/rALSX4VvpUC/zUks7qvTDtnNtPYN6oyWZ+W+pFS+YgzpBX7
 D14WvZ99EVCqDmqGyfwgIb8Y3iutocziqwxjw9ZBWPim3P7hCd+eDjKiO
 Fa5mqvx+E8MvqIxYpqYiPG2hn6RvVYq/6M2Slr+VneK5WWAhL79EZFA+6
 LRjyGMl4jf82E/dLa4SRdoeWy/+ExziL+Wy0c+ZHlukQT+r/brLt/nrm2
 JJtli/DZENf2qh92gKe8km95adwHr8umq1DVUVhLaSS65+RInqzsacMFh w==;
X-CSE-ConnectionGUID: A8GCpedESCefq3fk5NQH+Q==
X-CSE-MsgGUID: AKYkx7KXR/C5wGtrL7xMlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39555872"
X-IronPort-AV: E=Sophos;i="6.13,263,1732608000"; d="scan'208";a="39555872"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2025 17:54:58 -0800
X-CSE-ConnectionGUID: jJpNTzRdQn2TsMFgu1CRxQ==
X-CSE-MsgGUID: GqjFjqzUSjqVQatWpMTYaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,263,1732608000"; d="scan'208";a="111045914"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Feb 2025 17:54:57 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 5 Feb 2025 17:54:53 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 5 Feb 2025 17:54:53 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 5 Feb 2025 17:54:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V8x/sFutI16PnXxZI/pxJ+o+IZ0suniRoDqb6Aepu9AuLNio/TkGXfoMyN8kJFIVLqlEhFK7i73tYIPNKEpGErkHCNp6cnA/u5WDFkO3yiVVne8PwsDnFOJjipOBQMW0oTbYaYZmTqjKd0Cuu2m5mgjVRxRLeisHAwK29fvlkJLwi80IXHOxS/Hvr+Dy75nmFNiX0kBXUI8QF4CIMZUBGEe9dzC16xOOGA0juDMXg+PrYgZyAkJD8BIGSkyrKCAseLiOF4qhey9uZm0r1SVI68LayEfCchZzKf+EJk1reieEnYjluc/lTBW1xjGR8HA8FRi/xF76SMic5/dAuv7p2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zyw/YN+MfDpI1Aa+/PRg9AHE8xKLdVpdcaYt30g8GZs=;
 b=gIkJBt2hJzTMCe7CV5c8ln0sp6DqIz710n7zdAgjTOKA6owuTgznRBxxmPwnPdnXq31UfYY9IYCWthX9ebUpXBIb1RhT0FB8FHTvDx5Q3Se77+16l1shIEPSQjbsaB1O0Dc5QgKXmUDG4qkS1xc3IV8FVSSxL8Jfk1iqA5AKAfMvif4D2b7m2qN4sy9+F0hhTAwFA968lf1TAi58WB2Eodz4FaVJtMQ0xn/F9BDQWrNyvfyJdTnRsj21nzOayH5ja9dSFF/QLPEE8pwho5YVpnSZBCIoxqoePst9VMRHI/W65UQl50Pm3YTjdBdL7R2mWYRcOufYqhxK+4L2s/eigw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN2PR11MB4728.namprd11.prod.outlook.com (2603:10b6:208:261::17)
 by MN0PR11MB6208.namprd11.prod.outlook.com (2603:10b6:208:3c4::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Thu, 6 Feb
 2025 01:54:50 +0000
Received: from MN2PR11MB4728.namprd11.prod.outlook.com
 ([fe80::2fe8:64e:97a1:b4bf]) by MN2PR11MB4728.namprd11.prod.outlook.com
 ([fe80::2fe8:64e:97a1:b4bf%7]) with mapi id 15.20.8398.021; Thu, 6 Feb 2025
 01:54:49 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 3/3] drm/xe: Allow scratch page under fault mode for
 certain platform
Thread-Topic: [PATCH 3/3] drm/xe: Allow scratch page under fault mode for
 certain platform
Thread-Index: AQHbdzMAz2icu23EZUWDO+GW412BELM4sU+AgADT2HA=
Date: Thu, 6 Feb 2025 01:54:49 +0000
Message-ID: <MN2PR11MB4728736D182B9C0671A8501692F62@MN2PR11MB4728.namprd11.prod.outlook.com>
References: <20250204184558.4181478-1-oak.zeng@intel.com>
 <20250204184558.4181478-3-oak.zeng@intel.com>
 <68c890a3baff21199f6aca82dccdd024f56de199.camel@linux.intel.com>
In-Reply-To: <68c890a3baff21199f6aca82dccdd024f56de199.camel@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR11MB4728:EE_|MN0PR11MB6208:EE_
x-ms-office365-filtering-correlation-id: 7e0c02e3-cfda-40b8-e399-08dd46513dcb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?M0dIeXdnbEdQUEJpVlUvWnA0NThzWnZKR2IwdHJybjZZNDZPejN0a2FGKytw?=
 =?utf-8?B?WVI4YXpCc1QzQmhWLzRVcDROWnkxVm43bU1PWXk0SkhlbVRHaXV0NDZWaXRX?=
 =?utf-8?B?RGlTSzR4YlNjT1JpbytXVGVpNTdTQUhrVzUzd25xUVZrUkJMTEtmbzQrdTFG?=
 =?utf-8?B?bFEzbDh0NExpTXJUZHNlYXhvZnJwY3BJUTN5dkc5UFZHbDgvc21UcHZYVzdm?=
 =?utf-8?B?eVBuSEdGMHBJZndEUVpDK1Q4YjRsMGJBL0ZoaTk5ZlNsUHY0TG9tOStaK3Vv?=
 =?utf-8?B?dG9xbkpxRFd6Mmg3N1VycGkxVnJnTVQzaDhyQ0xGYW80N2diUVM3RnpnWXJy?=
 =?utf-8?B?bk5qMEhkWk5qN0M5ZDRjd3BGUmtNTmlvQVcwbEVsNDJNeHl6bVVSNDVjTk02?=
 =?utf-8?B?amZZTkgzdGhOL3R5RjhQZ1ZZNnpIR1ZxcEF6aHBON3g0dlA1WGpodjlHWHZ5?=
 =?utf-8?B?cjRuU3R4aXlpVVRwaWo1aWozeXdkWmtTbG1zRkVJRE03MkJDbWJIY2g5cGNt?=
 =?utf-8?B?Q1hzeVVRYjNka2FSY1RPc3VsbEdjU0R0bmU3cTRJUHladm5GeHNVVVZUNGM4?=
 =?utf-8?B?S2pqRmtQU1JyTHdLSzZyRmpYRmJubm1QTG5VbThla2FGL212TTJPaGFTNDdJ?=
 =?utf-8?B?bGk3OUVTV1FoUWl6RXJqczdzUnNKTFJMVjNWWUdtM05WRzRLK0hWUzRaZjJs?=
 =?utf-8?B?ME8vTzVxT05MSE5uekNDT2kxRW9Fc1VUTXpZK05Od0dxV1pycXNINzBXU1BU?=
 =?utf-8?B?bG9UNmIzdmtnMVZBdVR3NmZiYmd6TnpTclVvUW51dXFxR2JJTEZzMUhiSnlr?=
 =?utf-8?B?dmhJQmxmV05IZjFoZ3dEUXQ5ZG02QlRpekRyYm1Bem1iRDJlbytvek5QSlpJ?=
 =?utf-8?B?TVlIMmowTG9FR2hKV0dDOWl0VDNoQ29uUlVpRnF1NlZKR0xseFFsT1FybjFZ?=
 =?utf-8?B?MmtlZjBjeWtmUzVKYUdBRWNoUGhBSjV2YTRHOGt0b3RXTmswNmFKS25ZcndW?=
 =?utf-8?B?OGtmcDFsd2RiMVc0c3ZpSDZnc01GVGhINjZLVWNKWDVlNzEzR2pIYXIvT1BX?=
 =?utf-8?B?MXZHbUlUNk1wSE9KcStjcE1tR1kvZDAvbk1qaGNsN0NPdExJak80dXNyc1pF?=
 =?utf-8?B?ZFNuMU15UEhwNXd4aURLdTY4ZW5XT1RxZkp1Tnk5bE8xZmFXSVF6RUtLN3h0?=
 =?utf-8?B?dkd0Q2pFa0JmL29sNFd2bXFEN1Nac25VVVc1OGtjOVN4a0kyazBkbDRtYyt5?=
 =?utf-8?B?eGxrWWxBc2tDK2tpem1CYmJPZFA0dlQxTHQveTgvZGpmVGJYOFdPeFY2WTZE?=
 =?utf-8?B?c1BveGlzVGpKTVR6M0hnTkx5MzZtMHBXQkxLZ2RjL0F3NnM0UW9yeHNQc09a?=
 =?utf-8?B?MFd5WERQU2pWNFZBU2FhL1lTYmFiNUxUeTFpQmtKaVg5WXdCNVdJRUoydnhr?=
 =?utf-8?B?MkdMZ1hUSGxDZERFMnNWQlRXdDU3L1VYdnNuMGlPRUlhOWRLbjlMVWVFbUhX?=
 =?utf-8?B?ZUJyV3dCdHZtWXAwbDJYS1E3Y1Y5RGRoV3g3cDk0Y05CZGphVE1NZDRDKzhN?=
 =?utf-8?B?M1pzRTBsMVBZOU50cTUvMkJVRlFpdzU5RjNWUGFZOFN2TUVHd3JIRVgxYkJE?=
 =?utf-8?B?NkttOFVRaWgwNjE0c3lmenkzTDB4U0Qrdm5nN2ROcE1QK0ptbFR5bmlxWjNo?=
 =?utf-8?B?THAxRERzaExIbCt0ZFBPdVZhMnZzUldYSnZDa3NZLzkyZFRwWlpZTHNVT0N0?=
 =?utf-8?B?SFdVQUl0dzFra05BZnY0L3J0ZzNuRXNTRitHWlJvVjZWcFlDOE42MWZsWGJT?=
 =?utf-8?B?MWdoM1FCOWJsRENtR212Vlc5NTJXdW0rM1lKalJ5bUJ1MDVUZjFkTE8zWUpt?=
 =?utf-8?Q?KElcLD1Kp5nzQ?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4728.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dzlSN3lkTTljSUtmTjV1dEJEajNKdThvWU1XejljYmtSSitNQ1FhMXRvN0V1?=
 =?utf-8?B?czY5NW1ySkh4Nzg1blJyNUFtNUI4ZVFDK0t2RDEvVnFDallOYzR6WlFtMDhj?=
 =?utf-8?B?V1I5bVRuNndsNEJQUnVQRXR5OE8wZkMzV2V2VEh1OUlSK3kvbWJCeXZSYmhT?=
 =?utf-8?B?amMvRC9QS1RGZTZHNU1QNUdSRm1OQVlYRytDME1zanVzVWYvT2xVUDA2cGJr?=
 =?utf-8?B?dmZrTGxOSEdzZ2VTUDNCQ3lPd2gvVzNxVVBRVGxrVlR6Y3BuYXJmTlpwU0pk?=
 =?utf-8?B?ZXI1TmtmRmdXWk80QVhEYVYwOENMamZ3dnIwSlVXRXdsLzNNYW92Ly8wMit0?=
 =?utf-8?B?ME53dXBhR2E4eUFkTkFFb3pVbEtUN0RSK2FUR0Zzelg5Ykt2MGxkbUM2TVQz?=
 =?utf-8?B?Y25sdGZXWlNPV0hzWXRxdnV5RmRpMGtzVHlpRFc1K1owRE1EalpFU3lQUG0x?=
 =?utf-8?B?Nldxd3RTWnFiY2owRmRicE1DbVBnNGVZcDJZUHFYSWNORmdnb05EaFhNWWQz?=
 =?utf-8?B?MGFEeHVXb1kyZ2pjcnVidTFxOHpKZHFJQThEUGE3QmpqYmZET20xMUkrYkdD?=
 =?utf-8?B?c0NXWlVCbkl5QVp2T3hjMGFvbzF5RmtUVkhLeG05eVZHbzBmUS9YRG5zT21F?=
 =?utf-8?B?Z09VWUoxOXk2N1Zld0JubEtZZGd3Zy9GMmtnazlocXduVjdhTXNTZFl4dUQv?=
 =?utf-8?B?UjFPYmRiaVNjRXBMWDg0THdEOFM4ai9ObGtsQVl0WThUU0kzRWVKYzY5SGRG?=
 =?utf-8?B?d3NtV2VmU0kwTVRLUytKMkFlY005TThra21Xb0FMa0JHeXpQWXMxUWhvNjMy?=
 =?utf-8?B?ZzhJSldIaTVrZ3ordzdCbTEremY4ZnVMWTUrajJLWTdKWkphTm0wOWZidXBZ?=
 =?utf-8?B?WGFxcXB3S1A5NDFuN2RPRmp4VkhPaGNjb1gzUHZ6SWF5NzFWVnN4Tm5yQ244?=
 =?utf-8?B?SVJaL3dFclpZaEJoR2ZGbmN1L29GQ2VDVzJBbkJIVnFaL2syK1BlcHVlaFcy?=
 =?utf-8?B?NnNqODFVU0U5dXpIdUpOdHpNWlVocE5hTzl5djcxblRuUUtmVlVmWk83Zlhi?=
 =?utf-8?B?dUlGRVhhWTNpd3JDc0tVdGlXSlIvdWxkQWlzaHEwZmhteGtWRjhGUkZIVUZk?=
 =?utf-8?B?UUpsV3VNWEJpaCs5S2tXeFkvZ0hkYUh2K21Nc3g4VEI0Z25mZFhIdDJ3eElW?=
 =?utf-8?B?bUxWM25Td21DYjJTZUVJZDcwL2sxMkNDQUNFbzFmd0xraXlvWU1yMCtrRU9V?=
 =?utf-8?B?NUc4d3kvM3ZTcDJ0SVd1b0Y0OE42a3pzOFg0L0pmNmU3ZytuNDE5bFlKUmdi?=
 =?utf-8?B?WE5aRk1XYnRhaUU3MXVTbHRQZ2FvQ1preFZYd256TEFuemZlUGR5d3BwcHdP?=
 =?utf-8?B?R1hqbHRTUUF4SWROM3JDalAvL2NzbnZYZGVoRE1SNjlQcCtnWDVDMFVhS3VK?=
 =?utf-8?B?YXFEZGhXRVNhVHFzSmg5ZnVha0YrWXJ5WlVOUEVkVDBXdUxqeWF5U3NaNXJR?=
 =?utf-8?B?RE12V1BUSVhQLzl4NkQrQ0xBNjI2RlhqUkRHWG15L3h6eEQ1RXhCdG4zbkpP?=
 =?utf-8?B?c21kTHZEc0xKUEFTSlV3cWdUZWRDQWtHV2lodm8wdFdTOUFEdzV5K2VvQnpI?=
 =?utf-8?B?eWNhUlFwbUNDTWNHcVkwVi9UWGRldFowaU1rMXI2eDZ0QUpiV0dnaVZCcjVB?=
 =?utf-8?B?TVdlTStNdHV6QkF2UVNQUHhoaUlZejg1UGgvRk4rNFBaZVJqUXk0UUEyVFJM?=
 =?utf-8?B?cWhpbXRVejJPajBDODNXbG41UEViNTlpMFpId1VSVXpXRFJVMlZjb2VSeEhU?=
 =?utf-8?B?RURUOHVmWExPckhrNVNsZ1BzeHBnbGdHVStrekNYRDlTVzVvUFJ1emZHZzVS?=
 =?utf-8?B?clhrSmhFbDN0WkxIRkNBOThQblNmejRHeVllRHhmMFVVSmhGZnlkdTBtczE3?=
 =?utf-8?B?VGs3cDROQmZnNWlKTVRVdWVqeVVGTXhrMTdDNDlKNXNxUWEvL2dzTThwWXhY?=
 =?utf-8?B?MWVXYnFWMHJFN3g3cnhXeERKZ2lXanZOL3NoQkh1dUlzRTdkQVJnMnJMeU4r?=
 =?utf-8?B?Z0FIWHF5WGI5U2MwMXRURzlwOFBXd0tTNTVpcUs5ZngxUk56QmtFMDkwbUNr?=
 =?utf-8?Q?xX4E=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4728.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e0c02e3-cfda-40b8-e399-08dd46513dcb
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2025 01:54:49.9375 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AAjTH6RTGyBlKZNkjkwa3ut+NC3F13Vtjx2ll4I/zD2fL+7O/GO8dn0a04fzO5EDBt6+C9Vyv20PmYvOCtgu7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6208
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVGhvbWFzIEhlbGxzdHLD
tm0gPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPg0KPiBTZW50OiBGZWJydWFyeSA1
LCAyMDI1IDg6MTQgQU0NCj4gVG86IFplbmcsIE9hayA8b2FrLnplbmdAaW50ZWwuY29tPjsgaW50
ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBCcm9zdCwgTWF0dGhldyA8bWF0dGhl
dy5icm9zdEBpbnRlbC5jb20+OyBDYXZpdHQsIEpvbmF0aGFuDQo+IDxqb25hdGhhbi5jYXZpdHRA
aW50ZWwuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDMvM10gZHJtL3hlOiBBbGxvdyBzY3Jh
dGNoIHBhZ2UgdW5kZXIgZmF1bHQNCj4gbW9kZSBmb3IgY2VydGFpbiBwbGF0Zm9ybQ0KPiANCj4g
T24gVHVlLCAyMDI1LTAyLTA0IGF0IDEzOjQ1IC0wNTAwLCBPYWsgWmVuZyB3cm90ZToNCj4gPiBO
b3JtYWxseSBzY3JhdGNoIHBhZ2UgaXMgbm90IGFsbG93ZWQgd2hlbiBhIHZtIGlzIG9wZXJhdGUg
dW5kZXINCj4gcGFnZQ0KPiA+IGZhdWx0IG1vZGUsIGkuZS4sIGluIHRoZSBleGlzdGluZyBjb2Rl
cywNCj4gPiBEUk1fWEVfVk1fQ1JFQVRFX0ZMQUdfU0NSQVRDSF9QQUdFDQo+ID4gYW5kIERSTV9Y
RV9WTV9DUkVBVEVfRkxBR19GQVVMVF9NT0RFIGFyZSBtdXR1YWwNCj4gZXhjbHVzaXZlLiBUaGUg
cmVhc29uDQo+ID4gaXMgZmF1bHQgbW9kZSByZWxpZXMgb24gcmVjb3ZlcmFibGUgcGFnZSB0byB3
b3JrLCB3aGlsZSBzY3JhdGNoIHBhZ2UNCj4gPiBjYW4gbXV0ZSByZWNvdmVyYWJsZSBwYWdlIGZh
dWx0Lg0KPiA+DQo+ID4gT24geGUyIGFuZCB4ZTMsIG91dCBvZiBib3VuZCBwcmVmZXRjaCBjYW4g
Y2F1c2UgcGFnZSBmYXVsdCBhbmQNCj4gPiBmdXJ0aGVyDQo+ID4gc3lzdGVtIGhhbmcgYmVjYXVz
ZSB4ZWttZCBjYW4ndCByZXNvbHZlIHN1Y2ggcGFnZSBmYXVsdC4gU1lDTCBhbmQNCj4gT0NMDQo+
ID4gbGFuZ3VhZ2UgcnVudGltZSByZXF1aXJlcyBvdXQgb2YgYm91bmQgcHJlZmV0Y2ggdG8gYmUg
c2lsZW50bHkNCj4gPiBkcm9wcGVkDQo+ID4gd2l0aG91dCBjYXVzaW5nIGFueSBmdW5jdGlvbmFs
IHByb2JsZW0sIHRodXMgdGhlIGV4aXN0aW5nIGJlaGF2aW9yDQo+ID4gZG9lc24ndCBtZWV0IGxh
bmd1YWdlIHJ1bnRpbWUgcmVxdWlyZW1lbnQuDQo+ID4NCj4gPiBBdCB0aGUgc2FtZSB0aW1lLCBI
VyBwcmVmZXRjaGluZyBjYW4gY2F1c2UgcGFnZSBmYXVsdCBpbnRlcnJ1cHQuDQo+IER1ZQ0KPiA+
IHRvDQo+ID4gcGFnZSBmYXVsdCBpbnRlcnJ1cHQgb3ZlcmhlYWQgKGkuZS4sIG5lZWQgR3VjIGFu
ZCBLTUQgaW52b2x2ZWQgdG8NCj4gZml4DQo+ID4gdGhlIHBhZ2UgZmF1bHQpLCBIVyBwcmVmZXRj
aGluZyBjYW4gYmUgc2xvd2VkIGJ5IG1hbnkgb3JkZXJzIG9mDQo+ID4gbWFnbml0dWRlLg0KPiA+
DQo+ID4gRml4IHRob3NlIHByb2JsZW1zIGJ5IGFsbG93aW5nIHNjcmF0Y2ggcGFnZSB1bmRlciBm
YXVsdCBtb2RlIGZvcg0KPiB4ZTINCj4gPiBhbmQNCj4gPiB4ZTMuIFdpdGggc2NyYXRjaCBwYWdl
IGluIHBsYWNlLCBIVyBwcmVmZXRjaGluZyBjb3VsZCBhbHdheXMgaGl0DQo+ID4gc2NyYXRjaA0K
PiA+IHBhZ2UgaW5zdGVhZCBvZiBjYXVzaW5nIGludGVycnVwdC4NCj4gPg0KPiA+IEEgc2lkZSBl
ZmZlY3QgaXMsIHNjcmF0Y2ggcGFnZSBjb3VsZCBoaWRlIGFwcGxpY2F0aW9uIHByb2dyYW0gZXJy
b3IuDQo+ID4gQXBwbGljYXRpb24gb3V0IG9mIGJvdW5kIGFjY2Vzc2VzIGFyZSBoaWRlZA0KPiBz
L2hpZGVkL2hpZGRlbi8NCj4gDQo+ID4gIGJ5IHNjcmF0Y2ggcGFnZSBtYXBwaW5nLA0KPiA+IGlu
c3RlYWQgb2YgZ2V0IHJlcG9ydGVkIHRvIHVzZXIuDQo+ID4NCj4gPiBpZ3QgdGVzdDogaHR0cHM6
Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy8xNDQzMzQvLiBUZXN0DQo+ID4gcmVz
dWx0IG9uDQo+ID4gQk1HOg0KPiA+DQo+ID4gcm9vdEBEVVQxMTMwQk1HRlJEOi9ob21lL3N6ZW5n
L2RpaS10b29scy9pZ3QtDQo+IHB1YmxpYy9idWlsZC90ZXN0cyMNCj4gPiAuL3hlX2V4ZWNfZmF1
bHRfbW9kZSAtLXJ1bi1zdWJ0ZXN0IHNjcmF0Y2gtZmF1bHQNCj4gPiBJR1QtVmVyc2lvbjogMS4z
MC1nZGUxYTNjYjQyICh4ODZfNjQpIChMaW51eDogNi4xMy4wLXhlIHg4Nl82NCkNCj4gPiBVc2lu
ZyBJR1RfU1JBTkRPTT0xNzM4Njg0ODA1IGZvciByYW5kb21pc2F0aW9uDQo+ID4gT3BlbmVkIGRl
dmljZTogL2Rldi9kcmkvY2FyZDANCj4gPiBTdGFydGluZyBzdWJ0ZXN0OiBzY3JhdGNoLWZhdWx0
DQo+ID4gU3VidGVzdCBzY3JhdGNoLWZhdWx0OiBTVUNDRVNTICgwLjA4MHMpDQo+ID4NCj4gPiBX
aXRob3V0IHRoaXMgc2VyaWVzLCB0aGUgdGVzdCByZXN1bHQgaXM6DQo+ID4NCj4gPiByb290QERV
VDExMzBCTUdGUkQ6L2hvbWUvc3plbmcvZGlpLXRvb2xzL2lndC0NCj4gcHVibGljL2J1aWxkL3Rl
c3RzIw0KPiA+IC4veGVfZXhlY19mYXVsdF9tb2RlIC0tcnVuLXN1YnRlc3Qgc2NyYXRjaC1mYXVs
dA0KPiA+IElHVC1WZXJzaW9uOiAxLjMwLWdkZTFhM2NiNDIgKHg4Nl82NCkgKExpbnV4OiA2LjEz
LjAteGUgeDg2XzY0KQ0KPiA+IFVzaW5nIElHVF9TUkFORE9NPTE3Mzg2ODYwNDYgZm9yIHJhbmRv
bWlzYXRpb24NCj4gPiBPcGVuZWQgZGV2aWNlOiAvZGV2L2RyaS9jYXJkMA0KPiA+IFN0YXJ0aW5n
IHN1YnRlc3Q6IHNjcmF0Y2gtZmF1bHQNCj4gPiAoeGVfZXhlY19mYXVsdF9tb2RlOjUwNDcpIENS
SVRJQ0FMOiBUZXN0IGFzc2VydGlvbiBmYWlsdXJlDQo+IGZ1bmN0aW9uDQo+ID4gdGVzdF9leGVj
LCBmaWxlIC4uL3Rlc3RzL2ludGVsL3hlX2V4ZWNfZmF1bHRfbW9kZS5jOjM0OToNCj4gPiAoeGVf
ZXhlY19mYXVsdF9tb2RlOjUwNDcpIENSSVRJQ0FMOiBGYWlsZWQgYXNzZXJ0aW9uOg0KPiA+IF9f
eGVfd2FpdF91ZmVuY2UoZmQsICZleGVjX3N5bmNbaV0sIDB4ZGVhZGJlZWZkZWFkYmVlZnVsbCwN
Cj4gPiBleGVjX3F1ZXVlc1tpICUgbl9leGVjX3F1ZXVlc10sICZ0aW1lb3V0KSA9PSAwDQo+ID4g
KHhlX2V4ZWNfZmF1bHRfbW9kZTo1MDQ3KSBDUklUSUNBTDogTGFzdCBlcnJubzogNjIsIFRpbWVy
IGV4cGlyZWQNCj4gPiAoeGVfZXhlY19mYXVsdF9tb2RlOjUwNDcpIENSSVRJQ0FMOiBlcnJvcjog
LTYyICE9IDANCj4gPiBTdGFjayB0cmFjZToNCj4gPiDCoCAjMCAuLi9saWIvaWd0X2NvcmUuYzoy
MjY2IF9faWd0X2ZhaWxfYXNzZXJ0KCkNCj4gPiDCoCAjMSAuLi90ZXN0cy9pbnRlbC94ZV9leGVj
X2ZhdWx0X21vZGUuYzozNDYgdGVzdF9leGVjKCkNCj4gPiDCoCAjMiAuLi90ZXN0cy9pbnRlbC94
ZV9leGVjX2ZhdWx0X21vZGUuYzo1MzcNCj4gPiBfX2lndF91bmlxdWVfX19fcmVhbF9tYWluNDA3
KCkNCj4gPiDCoCAjMyAuLi90ZXN0cy9pbnRlbC94ZV9leGVjX2ZhdWx0X21vZGUuYzo0MDcgbWFp
bigpDQo+ID4gwqAgIzQgLi4vc3lzZGVwcy9ucHRsL2xpYmNfc3RhcnRfY2FsbF9tYWluLmg6NzQN
Cj4gPiBfX2xpYmNfc3RhcnRfY2FsbF9tYWluKCkNCj4gPiDCoCAjNSAuLi9jc3UvbGliYy1zdGFy
dC5jOjEyOCBfX2xpYmNfc3RhcnRfbWFpbkBAR0xJQkNfMi4zNCgpDQo+ID4gwqAgIzYgW19zdGFy
dCsweDJlXQ0KPiA+IFN1YnRlc3Qgc2NyYXRjaC1mYXVsdCBmYWlsZWQuDQo+ID4NCj4gPiB2Mjog
UmVmaW5lIGNvbW1pdCBtZXNzYWdlIChUaG9tYXMpDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBP
YWsgWmVuZyA8b2FrLnplbmdAaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+IMKgZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX3ZtLmMgfCA5ICsrKysrLS0tLQ0KPiA+IMKgMSBmaWxlIGNoYW5nZWQsIDUgaW5z
ZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0veGUveGVfdm0uYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92bS5jDQo+ID4g
aW5kZXggODEzZDg5M2Q5YjYzLi5jMDM3MmYwODNkNDIgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX3ZtLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfdm0u
Yw0KPiA+IEBAIC0xNzUyLDYgKzE3NTIsMTEgQEAgaW50IHhlX3ZtX2NyZWF0ZV9pb2N0bChzdHJ1
Y3QNCj4gZHJtX2RldmljZSAqZGV2LA0KPiA+IHZvaWQgKmRhdGEsDQo+ID4gwqAJaWYgKFhFX0lP
Q1RMX0RCRyh4ZSwgYXJncy0+ZXh0ZW5zaW9ucykpDQo+ID4gwqAJCXJldHVybiAtRUlOVkFMOw0K
PiA+DQo+ID4gKwlpZiAoWEVfSU9DVExfREJHKHhlLCBhcmdzLT5mbGFncyAmDQo+ID4gRFJNX1hF
X1ZNX0NSRUFURV9GTEFHX1NDUkFUQ0hfUEFHRSAmJg0KPiA+ICsJCQkgYXJncy0+ZmxhZ3MgJg0K
PiA+IERSTV9YRV9WTV9DUkVBVEVfRkxBR19GQVVMVF9NT0RFICYmDQo+ID4gKwkJCSAhKE5FRURT
X1NDUkFUQ0goeGUpKSkpDQo+ID4gKwkJcmV0dXJuIC1FSU5WQUw7DQo+ID4gKw0KPiANCj4gV2Ug
c2hvdWxkIHByb2JhYmx5IG1vdmUgdGhpcyB0ZXN0IHRvIHdoZXJlIHRoZSBvbGQgdGVzdCB3ZXJl
IGJlbG93LA0KPiBzaW5jZSB0aGUgV0EgYmVsb3cgZW5hYmxlcyBzY3JhdGNoIHBhZ2VzLg0KDQoN
CkJlbG93IHdhIGNvZGUgaXMgZm9yIGRnMi4NCklmIHdlIG1vdmUgdGhpcyB0ZXN0IGJlbG93IHRo
ZSB3YSBjb2RlLCB0aGVuIG9uIGRnMiwgaWYgcGVvcGxlIGNyZWF0ZSB2bQ0KV2l0aCBGQVVMVF9N
T0RFIHwgTFJfTU9ERSwgYWJvdmUgY2hlY2sgd291bGQgZmFpbCB1c2VyLg0KDQpTbyBJIGRvIHRo
aW5rIHdlIHNob3VsZCBrZWVwIHRoaXMgY2hlY2sgYWJvdmUgd2EgY29kZXMuDQoNCk9haw0KDQoN
Cj4gDQo+IC9UaG9tYXMNCj4gDQo+IA0KPiA+IMKgCWlmIChYRV9XQSh4ZV9yb290X21taW9fZ3Qo
eGUpLCAxNDAxNjc2MzkyOSkpDQo+ID4gwqAJCWFyZ3MtPmZsYWdzIHw9DQo+IERSTV9YRV9WTV9D
UkVBVEVfRkxBR19TQ1JBVENIX1BBR0U7DQo+ID4NCj4gPiBAQCAtMTc2NSwxMCArMTc3MCw2IEBA
IGludCB4ZV92bV9jcmVhdGVfaW9jdGwoc3RydWN0DQo+IGRybV9kZXZpY2UgKmRldiwNCj4gPiB2
b2lkICpkYXRhLA0KPiA+IMKgCWlmIChYRV9JT0NUTF9EQkcoeGUsIGFyZ3MtPmZsYWdzICYNCj4g
PiB+QUxMX0RSTV9YRV9WTV9DUkVBVEVfRkxBR1MpKQ0KPiA+IMKgCQlyZXR1cm4gLUVJTlZBTDsN
Cj4gPg0KPiA+IC0JaWYgKFhFX0lPQ1RMX0RCRyh4ZSwgYXJncy0+ZmxhZ3MgJg0KPiA+IERSTV9Y
RV9WTV9DUkVBVEVfRkxBR19TQ1JBVENIX1BBR0UgJiYNCj4gPiAtCQkJIGFyZ3MtPmZsYWdzICYN
Cj4gPiBEUk1fWEVfVk1fQ1JFQVRFX0ZMQUdfRkFVTFRfTU9ERSkpDQo+ID4gLQkJcmV0dXJuIC1F
SU5WQUw7DQo+ID4gLQ0KPiA+IMKgCWlmIChYRV9JT0NUTF9EQkcoeGUsICEoYXJncy0+ZmxhZ3Mg
Jg0KPiA+IERSTV9YRV9WTV9DUkVBVEVfRkxBR19MUl9NT0RFKSAmJg0KPiA+IMKgCQkJIGFyZ3Mt
PmZsYWdzICYNCj4gPiBEUk1fWEVfVk1fQ1JFQVRFX0ZMQUdfRkFVTFRfTU9ERSkpDQo+ID4gwqAJ
CXJldHVybiAtRUlOVkFMOw0KDQo=
