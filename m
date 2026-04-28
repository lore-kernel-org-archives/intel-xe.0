Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D598FF8868
	for <intel-xe@archiver.kernel.org>; Tue, 28 Apr 2026 12:07:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56DAD10EB3F;
	Tue, 28 Apr 2026 12:07:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iP7VGplB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF4B210EB3F
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Apr 2026 12:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777378039; x=1808914039;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8te+dk16AwVBSh9CbTVHuL7nlXNT3WgGvr78yQ82S9o=;
 b=iP7VGplBiJZ2fnYzbr8i+50ID+WQn2cvDOe72t58/kA0UXDMQy2gMOGV
 tgS/4n4cHZH1KDcpwPAyklt+gkjFLo37ZC+ykHEjQ+JUEEJQrCPnmlAQT
 0ITkfFTrjsPtvhlz/9AH59Q4mpKtg043SBq7aUv8CP0I7o7nhvcn9pA/R
 lZn4TGCIYxWj+uFezQsmqxiWCeoxzMd/+j/lHwamnuvt7XuOlUQPCbFf2
 jB+L9BgK5AwvXYr96mRLQKoww5+Yz5A+YDpW5N57fYHCwtUeVJirfEJa1
 9p9h7dELy+dKBJz6P/d2Un9HsNVeA6KbEWJGXOHihqwNxp9l0XOECdR8H g==;
X-CSE-ConnectionGUID: NQWG9jXBQpS/hgtiB+GwcQ==
X-CSE-MsgGUID: zrGmyUbaQ7mrAAnOU0BinA==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="78395456"
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="78395456"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 05:07:19 -0700
X-CSE-ConnectionGUID: Enk4yBr7RMWSONtMJP+ARg==
X-CSE-MsgGUID: 560pmRNHQcqKcqCKJ2zVyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="264328350"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 05:07:18 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 28 Apr 2026 05:07:17 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 28 Apr 2026 05:07:17 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.47) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 28 Apr 2026 05:07:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SnVzSyGl+G//4pAEnMJCcpEiPOTvgd5F/rjzveYfGO6Q73wTVCTQEuhQ/d3lYLzafE+YJAgLhg7/fxP+pZ1fbOiT4B1qFLw6G7w3QCq6MJsuOVX1KGWByKYTo6QgB3JScK5RENPXX+ppd9TmqF2n9KtbYjGYv5cBbFpOc3VFlLbma9MvPtj/5IRpGuthHhWtWOGzwva9UVZXbclPIp/0+CuK2gQmm9/uYydctxNx1FLdszNygqZWUN2UIwVgBuBDLI0d738tx105BH06cS9OE3qJbOUdZuyV1zhwmQdSShw1FFF0F2a9/X2dmLMCC7e85tjLhYr1YUdik3II7ZcUlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8te+dk16AwVBSh9CbTVHuL7nlXNT3WgGvr78yQ82S9o=;
 b=UnoYU7D8VVsUzpzW2964TUoLEhturbE3+0VVfVel+veoVxcwIzrnDwwjq7u4loQBPl4O2VBf0biSipay+lbZxAZySMmcWvJ8lg5MJsko13mQSSWd1/FPJZa2mt3qpt6S30InHHiBiqK96X7GYqQxco4MkoLr2W/4EPPXjJaBLvtlykNEQ5C/7PA8fu4U2CID1Vk7GU/LZadNsCKL24Lro21jauHZXOK9RQDs/wSHrGrNk9BxUuiJC6bhXnOhTWX/MeFkSjUi/3PvdomsA7PKE8eKviwHtgoOKUa19pPlYvqvdSLerFRjOzkSAcEInTzjvcbcSQGhysEnIrlqyGCa+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN6PR11MB3232.namprd11.prod.outlook.com (2603:10b6:805:be::14)
 by CO1PR11MB4865.namprd11.prod.outlook.com (2603:10b6:303:9c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Tue, 28 Apr
 2026 12:07:10 +0000
Received: from SN6PR11MB3232.namprd11.prod.outlook.com
 ([fe80::bf74:5777:8849:5c00]) by SN6PR11MB3232.namprd11.prod.outlook.com
 ([fe80::bf74:5777:8849:5c00%6]) with mapi id 15.20.9870.016; Tue, 28 Apr 2026
 12:07:10 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Auld, Matthew" <matthew.auld@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Subject: RE: [PATCH] drm/xe: Destroy mutex on gpu_buddy_init failure in VRAM
 manager init
Thread-Topic: [PATCH] drm/xe: Destroy mutex on gpu_buddy_init failure in VRAM
 manager init
Thread-Index: AQHc1vpViV5NVL+lT0O4EmpVEqr+VLX0SHWAgAAHgACAAAkmoIAABs2AgAAA90A=
Date: Tue, 28 Apr 2026 12:07:09 +0000
Message-ID: <SN6PR11MB3232AF29575D86E9E4044FEB81372@SN6PR11MB3232.namprd11.prod.outlook.com>
References: <20260428103202.3889095-2-tejas.upadhyay@intel.com>
 <d9a80b36-f54f-4ec4-9045-c24d2f493b01@intel.com>
 <bfaa816c-bdb3-4830-ab1a-3049a0b66849@intel.com>
 <SN6PR11MB323249C2BF34D0C8805A2D9B81372@SN6PR11MB3232.namprd11.prod.outlook.com>
 <f73ddff4-86af-424b-a1c4-2636057887d7@intel.com>
In-Reply-To: <f73ddff4-86af-424b-a1c4-2636057887d7@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR11MB3232:EE_|CO1PR11MB4865:EE_
x-ms-office365-filtering-correlation-id: 732af296-2ed2-40f0-909b-08dea51eace1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|56012099003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: 22OLJPVH4VWIJUsPu2QcRfHwMdxGelCgDmzfYgcKlZWAxNqz6sKx7pn7x7SGWlMngwT724CXDZ7U8JI9AtfHCrInG4SZwJWN1dSKj6nNj3sCz07ArK/km34ZieEcqRo4/Ctcjbd7DabmKiTxBcK+/VP1ukyhOd+/GKpnJSZ7K503Ma+dnvBKP6mb7hEKOeSjpRvpVBQsmjtnTBkaHrbx5NI9qgOhEzJNupJP12iTlAEFaIwQ5MduydlugdFvhDwk8nFoDejOczu1LLysauP5UyKdhzwWmUQY7F6fkWWa8wu7mJhK1df+XBnXqtN9xr+YQVIxuSC2WKN7CudSgaMxjqlwWCHLvbhobzplrarOeEb4FMnI35MdhifkExi+f11wSJrwUrOrkzakxdGaUx4X73tKGYGuU8Ao2jzGEQPJZBAq3ny6H7uKFPPdu/6VjHmD20Z3scc2iBq1PrHXamnJrxRhCJ8ALyMMDq6gSDysIPLXD1cCApqPplMFoqORk5GsrV0kHD9UbgBUpebF9VXIyare9A5so2FSlWa3xkMEy68vxOGzF7qJ9mHWyTqUygmwWZ53ugvYhHIQecM4Kr+KNFqC0+g3YavyCEB/eX3nTQI4ja0d115X8+IdY5ti0tUozZecS89IhlMhAz7TLad4JPaz+NY5Q6mzhClGyuH908wRXC9s3yMh9cLTwxCvY0a5nAzIRB8TkfKbm/FMcjKrZHXtYLAbTfQCPKGdpbxelhMwdse8bje2YY07+xrT8M8EGFhGxdgG4HEZ2LU1ISVGCbdRVkyogx6nMwKreg2rhck=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB3232.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(22082099003)(18002099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YW9BWDVRMUtUU09Yc0R1Mi83RDNxYTlNbHM0b3p3andzMFhrbENEQVA2ZmFx?=
 =?utf-8?B?NnZ1WHdNYWhOblRSZGc5MXBWbmVDK24reTE5UDMxdCtkb2VaT0NzakhNN1hB?=
 =?utf-8?B?V2NROEJvZmkwektscW1GY0h4MlErY2dLQzc5QXQ3dC9OZDFWMk0veUVWYXJ0?=
 =?utf-8?B?WUFjYU0vT0xObWtjL1FvL0YrQ1pEN01DY1F0cjJFam9yS0NNVzZqSWhyKzF5?=
 =?utf-8?B?Y0RpNkUyR3NscFNST1lyMGJzbkdVWlR3d0xpeFhCcEc2NFMzNndhNWVvWVJy?=
 =?utf-8?B?TEtEYmczNGxJMlNpb3NRcDgybmdGZVNiVTh0TVA1aHpLUXEzdlcrdUpGYi9y?=
 =?utf-8?B?ZStXVEhmdjl1ZlFvUUkyaGRpK1pDc3htUUNTVlVUR2oydEVlb0c0QkxFVWJF?=
 =?utf-8?B?dm5TdW05SVJDb2lRWW0zYytLMTR3OENJa09IcEtHQjNUTGE3Mnc5V0xKd0Vq?=
 =?utf-8?B?RjBBNTZZTGh6TXBXVnJaVk9TNGkvZTN0SlUvbWZkUmdnM3NnVEVMZ2kzN3Rh?=
 =?utf-8?B?L0JJbmdOSVMrcWdQazBEWWNKMUJiSmZlVEpiby9JTWRYMDdpR2YycE0vY0x4?=
 =?utf-8?B?SkUvWFNJZEF5SXFSUUw0bUVOMDFEUHJWOHFDc1p1S2IrMnhlV3dra2xuY1JM?=
 =?utf-8?B?ZFdYV29vWC9wRytXanI4Y0NlRE95T3hyY1cwWVVsL0VaU2dEQ0lHRWJBa3Bw?=
 =?utf-8?B?eDQrd3ViejRaTjR1SzI3YnRaTmRNcGdUM3FkWWhmTXlJSElwWThiMURUcnc0?=
 =?utf-8?B?UU5EeGwyYjFoSnVIV3NvRTBXWHVobFFEdVQzdjJIdTRTUXdjaDVndWJkQ3hs?=
 =?utf-8?B?M2dyYVdVVmkrNkxrczhqcDRieDZGZDljaEhxVWNuYkhrSmxpR2VaZUhFOHhp?=
 =?utf-8?B?QktnNlJPb1N5VHYvZ3BKRnF1ZzBEaW5xUkZ1ekFUMy8xR0xsNkR1R0MvUVBB?=
 =?utf-8?B?VG5mTGd6Z3JHUGl4VjZ1TENoNXpzZThYUXdCd093UkZycHY5VVhJTXI5eWNK?=
 =?utf-8?B?amZJMk1PVUdwQll6ZnZxYzdIMzNUUlNVeFZzMWk1Q21ibTNOWnlzdWp5amdu?=
 =?utf-8?B?MzhBdWtNR2ZIdC9SbG9QSCs1bGw2ZHRjbEN3V0pzVUxlVUdiS0JERjhWRUNv?=
 =?utf-8?B?N0R3SkU5ZkRGMW04bkRnWnNwOG9pN2lTVXNmdjRuZWJoMG5KU1lHaVJ6dzhG?=
 =?utf-8?B?RkdYWUpOYzJDSStNQmxZc0ZQdUt2VGxaMEdsU3NSS2VpeE5HVldCZEZJR0xm?=
 =?utf-8?B?U3VjRFFYTFJCa3VGQ0p0ZTFQQkh2Z1QzRFE2OWFzU0UzUFJQK3ZZMmx5dStH?=
 =?utf-8?B?OXhiSTFoNkkyQkxIRTFKa2h1K0c3WWlSczVqMUxDL3hGby8xWng0OHdmNWNJ?=
 =?utf-8?B?Q3ZZT0ozOUczem4zU3lHaEwyUDhldUFzaTE0bUZ4MU9HaTRGbXpybUViNHRF?=
 =?utf-8?B?REs0WUE5cmtqUXdUK3RCdDVYNzRTbXNiUHhoS0R3QUx2RlBVWFU0YXU1TTh6?=
 =?utf-8?B?RDA0ZllTMlpESVhGUDQ4aDFmY0RIVlpIU3NndzhHVDY5MkltTWVBdVVBaVA1?=
 =?utf-8?B?NlZybXR1dmF0T1h5VWxYYm5rYmFIUDhKdWZvU05LU3pIR3p4Ujhmeml4KzMw?=
 =?utf-8?B?aSsrVmROakI2OWJMbXAzWnoyOVVETmN6cUx1OGNCVWFHN2tKb2VObkhaV0sy?=
 =?utf-8?B?eVpZYmJ5Ni9lb3NTMDdkWXJNSmdVU3YzcHFPdUlhSDNJeFp3RjdPWVFIZ2ZM?=
 =?utf-8?B?bDJmanZtOEdjTFBGQ1E2UVhpM3BycGM5ajJFQTdKczI0QmpZNkZFdVVhQmhu?=
 =?utf-8?B?b3B6bmtHQ0hheVRpM1ZTQTBJV3NSQ09panRJQ2Nkb3JOQUZCa2VsQ2xvTTh1?=
 =?utf-8?B?aHFJeU1QVDNNclZHaUpveTBac09Qd3lSenpWS0g1NkpLTTlmeHMyM2NUbHp1?=
 =?utf-8?B?NDlQUXVhdG1nbkZGZENsS1RITmEzcGdkR1l2cVhPeEwySmsrKzF6bGxJYXpz?=
 =?utf-8?B?WUV3eFN4eE5saVV5T1dlRjNEcU5ia1BwVEw0cWhpeWtDU2ZTVEQ4N0tXTjdW?=
 =?utf-8?B?U1NrU01DVDBEUVVyT0dzVFF4ek1Kd0ptVW9jQ2I0YjJyM2xTODFtTWUwOXcr?=
 =?utf-8?B?OXJnTlFNeXg4WTV0NGp0L1c1Y2JNakE4WkdvSlVOcnNhMUZiM2hNbHJ4Qk8y?=
 =?utf-8?B?NkY5azlzU3JVdTdMM0VZcUtXR3ovcGxQOUszdHo4RU83MHVxYmdoUUVIa1Jz?=
 =?utf-8?B?SDBXaExaY1ZHdjQyMjZZT3FNaVRSQzVEb1dkYW15REoyRjdYL1FLTkpVYktJ?=
 =?utf-8?B?UEVSRlhIdDZjbzR3VlNid280Rkg4VURwclZ5OGRIM2pqQTVvUUF2UT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: CvN2vZwFGC+1IQplUR63MFPOB5Ssy5HdUE5BuGHCulil1tVfO1JAuinzQn581F9wd29AJNHBlUO/x3i58xSJUoR69ZV5tql+1wP/AzTOf/Cs3hnP78Gy+ihZjMyQNsBeM998VOmK11fNQF1jwePihMSHoml3Q15mDP+X6lrjD3KxUw9TwMhfNw1qaCRquFGlzjXTK8aVLeSa+d1pGLJXg1qar5luTPPkwTdx5rMegv/FHBox5VbKfh+jQRmNV/khzW5ZtWnZXX8HcEYlJ9zDtR8FJmqH9ojWVqGv9qy60OANiwq3LR+Au8eZ5vzVUwUu/frD87EHwYH4BNZKC98ujQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3232.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 732af296-2ed2-40f0-909b-08dea51eace1
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2026 12:07:10.0757 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EFf4lZxXr9CDreNzTrOwTwiqveLNrT2RsaW+BZ2m0RcflRtHav2q8mD4WjcsjW/Z0+lTPI0wr8ChTqpf9ZC5ct0cs75HrLCAHNJRqlRXuyk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4865
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQXVsZCwgTWF0dGhldyA8
bWF0dGhldy5hdWxkQGludGVsLmNvbT4NCj4gU2VudDogMjggQXByaWwgMjAyNiAxNzozMw0KPiBU
bzogVXBhZGh5YXksIFRlamFzIDx0ZWphcy51cGFkaHlheUBpbnRlbC5jb20+OyBpbnRlbC0NCj4g
eGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBCcm9zdCwgTWF0dGhldyA8bWF0dGhldy5i
cm9zdEBpbnRlbC5jb20+Ow0KPiB0aG9tYXMuaGVsbHN0cm9tQGxpbnV4LmludGVsLmNvbTsgR2hp
bWlyYXksIEhpbWFsIFByYXNhZA0KPiA8aGltYWwucHJhc2FkLmdoaW1pcmF5QGludGVsLmNvbT4N
Cj4gU3ViamVjdDogUmU6IFtQQVRDSF0gZHJtL3hlOiBEZXN0cm95IG11dGV4IG9uIGdwdV9idWRk
eV9pbml0IGZhaWx1cmUgaW4NCj4gVlJBTSBtYW5hZ2VyIGluaXQNCj4gDQo+IE9uIDI4LzA0LzIw
MjYgMTI6NDAsIFVwYWRoeWF5LCBUZWphcyB3cm90ZToNCj4gPg0KPiA+DQo+ID4+IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZyb206IEF1bGQsIE1hdHRoZXcgPG1hdHRoZXcuYXVs
ZEBpbnRlbC5jb20+DQo+ID4+IFNlbnQ6IDI4IEFwcmlsIDIwMjYgMTY6MzYNCj4gPj4gVG86IFVw
YWRoeWF5LCBUZWphcyA8dGVqYXMudXBhZGh5YXlAaW50ZWwuY29tPjsgaW50ZWwtDQo+ID4+IHhl
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiA+PiBDYzogQnJvc3QsIE1hdHRoZXcgPG1hdHRoZXcu
YnJvc3RAaW50ZWwuY29tPjsNCj4gPj4gdGhvbWFzLmhlbGxzdHJvbUBsaW51eC5pbnRlbC5jb207
IEdoaW1pcmF5LCBIaW1hbCBQcmFzYWQNCj4gPj4gPGhpbWFsLnByYXNhZC5naGltaXJheUBpbnRl
bC5jb20+DQo+ID4+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIGRybS94ZTogRGVzdHJveSBtdXRleCBv
biBncHVfYnVkZHlfaW5pdCBmYWlsdXJlDQo+ID4+IGluIFZSQU0gbWFuYWdlciBpbml0DQo+ID4+
DQo+ID4+IE9uIDI4LzA0LzIwMjYgMTE6MzgsIE1hdHRoZXcgQXVsZCB3cm90ZToNCj4gPj4+IE9u
IDI4LzA0LzIwMjYgMTE6MzIsIFRlamFzIFVwYWRoeWF5IHdyb3RlOg0KPiA+Pj4+IEluIF9feGVf
dHRtX3ZyYW1fbWdyX2luaXQoKSwgaWYgZ3B1X2J1ZGR5X2luaXQoKSBmYWlscywgdGhlDQo+ID4+
Pj4gZnVuY3Rpb24gcmV0dXJucyBlYXJseSB3aXRob3V0IGNhbGxpbmcgbXV0ZXhfZGVzdHJveSgp
IG9uIG1nci0+bG9jaw0KPiA+Pj4+IHdoaWNoIHdhcyBwcmV2aW91c2x5IGluaXRpYWxpemVkIHZp
YSBtdXRleF9pbml0KCkuIFRoZSBub3JtYWwNCj4gPj4+PiBjbGVhbnVwIHBhdGggaW4NCj4gPj4+
PiB4ZV90dG1fdnJhbV9tZ3JfZmluaSgpIGlzIHJlZ2lzdGVyZWQgdmlhIGRybW1fYWRkX2FjdGlv
bl9vcl9yZXNldCgpDQo+ID4+Pj4gb25seSBhZnRlciBncHVfYnVkZHlfaW5pdCgpIHN1Y2NlZWRz
LCBzbyBpdCBuZXZlciBydW5zIGZvciB0aGlzDQo+ID4+Pj4gZXJyb3IgY2FzZS4NCj4gPj4+Pg0K
PiA+Pj4+IEFkZCBtdXRleF9kZXN0cm95KCkgYmVmb3JlIHRoZSBlYXJseSByZXR1cm4gdG8gcHJv
cGVybHkgY2xlYW4gdXANCj4gPj4+PiB0aGUgaW5pdGlhbGl6ZWQgbXV0ZXguDQo+ID4+Pj4NCj4g
Pj4+PiBGaXhlczogZGQwOGViZjZjMzUyICgiZHJtL3hlOiBJbnRyb2R1Y2UgYSBuZXcgRFJNIGJ1
ZGR5IGJhc2VkDQo+IFZSQU0NCj4gPj4+PiBtYW5hZ2VyIikNCj4gPj4NCj4gPj4gV2FpdCwgd2hl
cmUgZG9lcyB0aGlzIGNvbW1pdCB0aXRsZSBjb21lIGZyb20/IEhvdyBkaWQgeW91IGdlbmVyYXRl
IHRoaXM/DQo+ID4NCj4gPiBUb29rIGNsYXVkZSBBSSByZWNvbW1lbmRhdGlvbiBvbiB3b3JkaW5n
Lg0KPiANCj4gT2ssIHdlIHNob3VsZG4ndCBtYWtlIHVwIG5ldyBjb21taXRzIHRoYXQgZG9uJ3Qg
ZXhpc3QuIFRoZSBmaXhlcyB0YWcgbmVlZHMgdG8NCj4gYWx3YXlzIG1hdGNoIGEgcmVhbCBjb21t
aXQsIGluY2x1ZGluZyB0aGUgY29tbWl0IHRpdGxlLiBBbHNvLCBBRkFJSyB0aGlzIG5lZWRzDQo+
IHRvIGJlIGxhYmVsbGVkIHdpdGggQXNzaXN0ZWQtYnk6IDw+LCB0byBiZSBmdWxseSB0cmFuc3Bh
cmVudC4NCj4gDQo+IGh0dHBzOi8vZG9jcy5rZXJuZWwub3JnL3Byb2Nlc3MvY29kaW5nLWFzc2lz
dGFudHMuaHRtbA0KDQpJIGNoZWNrZWQgY29tbWl0IHdhcyByZWFsLCBidXQgdGhhdCBjb21taXQg
cHJvYmFibHkgZGlkIG5vdCBpbnRyb2R1Y2UgZ3B1X2J1ZGR5X2luaXQoKS4gSSB3aWxsIGNvcnJl
Y3QgaXQuDQoNClRlamFzDQo+IA0KPiA+DQo+ID4gVGVqYXMNCj4gPj4NCj4gPj4+PiBTaWduZWQt
b2ZmLWJ5OiBUZWphcyBVcGFkaHlheSA8dGVqYXMudXBhZGh5YXlAaW50ZWwuY29tPg0KPiA+Pj4+
IC0tLQ0KPiA+Pj4+ICDCoCBkcml2ZXJzL2dwdS9kcm0veGUveGVfdHRtX3ZyYW1fbWdyLmMgfCA0
ICsrKy0NCj4gPj4+PiAgwqAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQ0KPiA+Pj4+DQo+ID4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV90dG1fdnJhbV9tZ3IuYw0KPiA+Pj4+IGIvZHJpdmVycy9ncHUvZHJtLyB4ZS94ZV90dG1fdnJh
bV9tZ3IuYyBpbmRleA0KPiA+Pj4+IDVmZDBkNTUwNmE3ZS4uMzE4OWU0YjdhZDA1IDEwMDY0NA0K
PiA+Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV90dG1fdnJhbV9tZ3IuYw0KPiA+Pj4+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV90dG1fdnJhbV9tZ3IuYw0KPiA+Pj4+IEBAIC0z
MTksOCArMzE5LDEwIEBAIGludCBfX3hlX3R0bV92cmFtX21ncl9pbml0KHN0cnVjdCB4ZV9kZXZp
Y2UNCj4gPj4gKnhlLA0KPiA+Pj4+IHN0cnVjdCB4ZV90dG1fdnJhbV9tZ3IgKm1nciwNCj4gPj4+
PiAgwqDCoMKgwqDCoCB0dG1fcmVzb3VyY2VfbWFuYWdlcl9pbml0KG1hbiwgJnhlLT50dG0sIHNp
emUpOw0KPiA+Pj4+ICDCoMKgwqDCoMKgIGVyciA9IGdwdV9idWRkeV9pbml0KCZtZ3ItPm1tLCBt
YW4tPnNpemUsDQo+ID4+Pj4gZGVmYXVsdF9wYWdlX3NpemUpOw0KPiA+Pj4+IC3CoMKgwqAgaWYg
KGVycikNCj4gPj4+PiArwqDCoMKgIGlmIChlcnIpIHsNCj4gPj4+PiArwqDCoMKgwqDCoMKgwqAg
bXV0ZXhfZGVzdHJveSgmbWdyLT5sb2NrKTsNCj4gPj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgIHJl
dHVybiBlcnI7DQo+ID4+Pj4gK8KgwqDCoCB9DQo+ID4+Pg0KPiA+Pj4gQ2FuIHdlIG5vdCB1c2Ug
ZHJtbV9tdXRleF9pbml0KCkgaW5zdGVhZD8gQWxzbyBjYW4gdGhlbiBkcm9wIHRoZQ0KPiA+Pj4g
bWFudWFsIGRlc3Ryb3kgaW4gZmluaSgoKS4NCj4gPj4+DQo+ID4+Pj4gIMKgwqDCoMKgwqAgdHRt
X3NldF9kcml2ZXJfbWFuYWdlcigmeGUtPnR0bSwgbWVtX3R5cGUsICZtZ3ItPm1hbmFnZXIpOw0K
PiA+Pj4+ICDCoMKgwqDCoMKgIHR0bV9yZXNvdXJjZV9tYW5hZ2VyX3NldF91c2VkKCZtZ3ItPm1h
bmFnZXIsIHRydWUpOw0KPiA+Pj4NCj4gPg0KDQo=
