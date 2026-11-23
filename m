Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148FB606A31A
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 05:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IQf11Eg6;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=lo1rlTJR
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3DDA10E09F;
	Mon, 23 Nov 2026 05:03:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE30A10E09F;
 Mon, 23 Nov 2026 05:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795410216; x=1826946216;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=W+V/PtOVKGQDbkuj2gMThpz8U5Dcw+V20IwiYSC8BoA=;
 b=IQf11Eg69GrVhPmb+0i85scCn4XC7Aofl5+3Pc6A+LZp1qqiZdhZs5B0
 U0dcpXDTFm/htYo3pIMuJtVSSqzcXTr35IRI7n9f18+h4sp5C3pwLzQEU
 /WlOObVfHfUjQj6r5yALEAh1uJPMK+VCehxBjCd2oZQWY3tSLuwO1XisH
 SMJDhyKtbXJ09pJiGk49zk7aQA5t/ImaIRIt+VA65Xj5ISnlHqGJllak5
 /QyEebtenOrb865LQbHXF67LMrLEnABf7taB4q3P8V1J9HZR17S1Z05/B
 +YenpDvf2qWGpvf2gscYFX3jsU89y098t65ol/R3n/mdxrQrEgGlFrehB Q==;
X-CSE-ConnectionGUID: j1K+AAHoRh2k3b8eq1c1nA==
X-CSE-MsgGUID: HlrLvmZzSy63JVvU7oj3AQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4093633"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4093633"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2026 21:03:35 -0800
X-CSE-ConnectionGUID: vy1nWIeQSd+MR+/473dj/Q==
X-CSE-MsgGUID: A7f9gKaFSHmFr1UBY8qE1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208";a="11083472"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2026 21:03:34 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Sun, 22 Nov 2026 21:03:34 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Sun, 22 Nov 2026 21:03:34 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.71)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 22 Nov 2026 21:03:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Af4koQTYuQPOhKATyKZUQG/qC6G7jplJgZlh+CMhyIaU/4HRlQ0s0BxsrEHVE1v6Sna0Yv0cSwlf2I625KqL0auL64iCtH7YQx+/z46fV6y2K6funb7fMkO5oi+RX3ZJVtL6IcYJwYXIJ2sEBjR2nWW2nfGI60G+HlaF+FPHTZ4biE7XO33SCqi7Tt5A8S9aYlsg/a7+1SqjDkeJ7I/ifddul4FMC5VaJb/GFM2shsLTfpZ738yhDMFlnO9vk014eGTIfdThE1sET+tu7ppyyRo+6SOugxJEsn/BpZEUNTiTLAXb5evDWlAokbWTIcFnfai6tF2s7HIalO3QDBEF2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8H1gKKeGKfpOy0J7NF9Eeffku2q00yRUhn5fxz5zbkM=;
 b=SFdVAG3k1WViHXHrpC+wKosoIgvFY3JihBIY0jKkSf2b3ruBOCCvvDFw/GK7BaqMfm9jYHUML79K0x1x0zgwlzj2plXUIXG9tnyMt/UPVwatDYsU9t22TRg7ieyf0hNjJXnVVEuMYroa/zd+fnVhiushiUxr+aW28Uc9IrH0YoADwwc3rDC4Qifj/d6pJX0RODoCxH4ij/BNfSfZrhcZmREFEKynTjqOBn0HmGEKIkoa7y9JTlHoV/XCwSVGHAWVozed8vRWuccRxEkkaLJFCecbejl7lUuQAsgKS4SASLeBN1vMWHNde/6QmBSlXHwwFqNKU6yEl27IdMJLONzjmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8H1gKKeGKfpOy0J7NF9Eeffku2q00yRUhn5fxz5zbkM=;
 b=lo1rlTJRLrytghB+cqlxDf7xL1BW7pnN+63kbdRRnFOehDgud3mqk6GK+gaOT4XSA15u10/jWewpr8Ocx5DRXIgg4FY0dsjRbo0HyYywYNziMeyY4xFtM9Uz3X4+Cc6MuTCWfnIuFcj+WNIv7q/qRolCVKTGHn7HWSvDwKNsql8=
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by PH8PR11MB6973.namprd11.prod.outlook.com (2603:10b6:510:226::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Mon, 23 Nov
 2026 05:03:30 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc%6]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 05:03:30 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Kamil
 Konieczny" <kamil.konieczny@linux.intel.com>, "Auld, Matthew"
 <matthew.auld@intel.com>, "Kempczynski, Zbigniew"
 <zbigniew.kempczynski@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/xe_create: Add
 create-huge-sysmem-defer-backing subtest
Thread-Topic: [PATCH i-g-t] tests/intel/xe_create: Add
 create-huge-sysmem-defer-backing subtest
Thread-Index: AQHdeZtOqoiaF4Nx6Eq2xEa0IyrAt7c7HJzg
Date: Mon, 23 Nov 2026 05:03:30 +0000
Message-ID: <CH3PR11MB84343502B29909942687E0B28D452@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20261121093216.1509828-2-shuicheng.lin@intel.com>
In-Reply-To: <20261121093216.1509828-2-shuicheng.lin@intel.com>
Accept-Language: en-US, en-IN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|PH8PR11MB6973:EE_
x-ms-office365-filtering-correlation-id: 8e6b250e-3343-455d-c360-08df491f1dd9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|10070799003|366016|1800799024|23010399003|18002099003|22082099003|6133799003|261009223027099003|56012099006|11063799006|10067099003|5023799004|261102123227099003|261022105027099003|261026140227099003|261026121527099003|261028144727099003|261021123027099003|261021121427099003|38070700021;
x-microsoft-antispam-message-info: EZkXIpXGwWvthHKq2+6PiN99DH4s1YGsyfW8YpxzRJPn3dM0jhbqOX4I6RfqVce5xwfIE0aKB8vQR86+nzQfCFSvmDal6zPSffRudZQPdywVAn2LqvEJwWHQFcjZxNaIrPl7qc9WBbaq9ykBOg/YTRUwUPMX1nPBCKegtE5nldscjLA9ZARJZMKanugdp70H6mGcQ+LNLIRIK4OvC1/ij4sPNfjdnuBxxm1rnvL7Rf/xnrf3I+Tr/QWg/Lp+Fpv4xyofHGN6oPnkppshv9ky3q0+e92Qdjq49gnmXlz/ktjj4rZ9gaHOGmo3RV5vYSWf6Ltt/fggUfgbUMkh/O7RNaw5J3whGxeoQDSypEhqhYYrc2chmI5i0xymY9Tb1buCu5CBo03MWJPpm/QcaGTY8mTrpvkx80lZ54FRAiewPd37R8RMXej9HTooCIAszoC2Er5YfwAACKxXTXssaWXZb6tv+yQTp/sVBrGGZ8GnrpsG5iMa1AucdlNaKYvFTrWqPvMpwFP2fy0wv3kO5DMhALtUJ0s/zg3cY15RMIhNsDtv2aoNBESnSwMmZLdB1xw9CUE5Xh57zJBOo1iLtJsVNDKz3P6wMgtAOplVc4RjIvv8VXrCdBhIEBc9nRuUj+Egwuzrjil9Av/a+dLOb2kb/8vez+DeZ29XAIJ8a/Fba5U=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(366016)(1800799024)(23010399003)(18002099003)(22082099003)(6133799003)(261009223027099003)(56012099006)(11063799006)(10067099003)(5023799004)(261102123227099003)(261022105027099003)(261026140227099003)(261026121527099003)(261028144727099003)(261021123027099003)(261021121427099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?PCJQzM9wrpzOyllQZNeJ6wQeM/FmaffgvFYQR6Fgnbvsj25hl4M+VhLI0lDz?=
 =?us-ascii?Q?RKQ4zDKlpvXpzDq1g+dXPjZGUrJa7Gx4dYgINvbKIcLKcuY5wgVneslP+mXH?=
 =?us-ascii?Q?C8cTjVk/+UqEvUykp/EHLoorQpLSRz8iXh7Tganoyuvn3K3lsFHKyK9itpaF?=
 =?us-ascii?Q?rPKjiuFOlTQolA8prkh1eWCVzdTrNRQgjhiSVtXKHZFlZ2DwoSaS5oP/WaAl?=
 =?us-ascii?Q?FEwWTDS3PI3kjuC1Llp1CBvYu6rzPO5o4qdRGd3QryTIRSD7jY6+0+2U+2in?=
 =?us-ascii?Q?K5Hqabk3vbvlKlfb8HlsKUZg7FP2AHefUKen2wxZZ12RKHaCqKxXPkROZbv3?=
 =?us-ascii?Q?3Mhb5opE7EqY3H0jdbO9Womd4xaj2k++DMIJr6/LshDpW4UzGMPMJx0snAeL?=
 =?us-ascii?Q?aIab6fY5PRYvhII2Dyh0d2FTBvHLdo942lPrNoAx3vwgIJKi+sqMUs+4GWkT?=
 =?us-ascii?Q?IYEiAzZFhS/x9f30OkkTYfK4t1CHHlUMSET3K1bf+/1o3pZlqkD1eH1ToiTm?=
 =?us-ascii?Q?wDu8NGMenbwDtmRj8SVWIf35bEANXD1kZXVUOkYwoPq/ANAQOTRd2INcXwws?=
 =?us-ascii?Q?lyQBvRVESrbPivMyzdDA+UT0Cxo2J/WLmVjPxOa2Lcr2orA35okm5PSvVamM?=
 =?us-ascii?Q?AGFLCviurCDgnBu+0yfyjIWPVl+qvGqtCM6bQnGcpJEkESK82Q6zzzohnHV+?=
 =?us-ascii?Q?iXy6KQ7aX8ZzD2wIQU8XluWaCcdOBBkWsPn2SBnUVioQQeVFhhwMiaKPEUDO?=
 =?us-ascii?Q?2vgPaXh67qhHEddVmSkAIugKGxoGGDkbBvpB0Oi0NoER2bssOUGXGJK+iQ8g?=
 =?us-ascii?Q?4M9Djqo6KyTPzc0Acynu02WMJYShscwST7MXyADups0MZ6GZz6W3w15/qoZc?=
 =?us-ascii?Q?IWeA3gxZH1jjTEUfThBbjFhI9PNkleBQGMghBXWE+GXNxWV66qbSl1pgWffP?=
 =?us-ascii?Q?NlvW4phOljHCszX9MrJoJywbid5IT+Ti4I/bUS/sDgpEVyFFq9020NhTvpWb?=
 =?us-ascii?Q?Tjc9QfSUlE0YYpvpoMxdLEiTi/k2yHdM94TNPPuwJIMAt98uwlf/thlahNDE?=
 =?us-ascii?Q?381dBx/ohmsqCfBXzSOcGwjLSIjJSfR9Gz9upV1SZLe4Y3ODg9hIY3AGrfx5?=
 =?us-ascii?Q?UUMwmKbQrJo4By0FyE1kMB6x9A4LOZSy3GJh3m51XT4POsZIenF1rdCtZjWh?=
 =?us-ascii?Q?/VCJMWJPgSjND5CXBKfOdGlsNswY/V5YA/SXbxKHfBUAT4/+yYZwXqoGY4fw?=
 =?us-ascii?Q?ZP5U3H/zMfm84APZ3RQhdkwGO6lh8A6LhLCtaCnXtIrCwtzJUOo/AcLSB02b?=
 =?us-ascii?Q?lGD7RmqQj8VH+bj+H1QAq6lIupUtSEbWOaqSBfP+LJ6PZtJB/9JGKV/bv3h1?=
 =?us-ascii?Q?PwimHBDayCBlF9+Q3puVg8W9MXCdQfnAOjeOGMY2ztghUi/bJGZyHm7VVFvC?=
 =?us-ascii?Q?1aJCMvbRg1SBA4Ype0hU/uEZZWVUvd9UOuesWw0aO3iBvyQ6PuNGbiQGb9Sv?=
 =?us-ascii?Q?qTDLyVXL+eGOlNRkCjbOLA6NHX4u+PI6P1ahNrCx9cWZxNf+sM0oHe6QCBdx?=
 =?us-ascii?Q?6mTMQi16CDHO+Ra6wGlo6oARbdyfAATzaKzPgm5B3V12aT49AR66e2CNO8lG?=
 =?us-ascii?Q?awXcmvW5VTkZlPQ04Mc+ClJazNwDSWfPb9GS5sxEe71SAOWhNqiZBfasMJJ3?=
 =?us-ascii?Q?1tUzbiQvEtCOz8zWrCbVl2kyVyQ+cYoA2OmESQD92960WJDRL5T1lgkPromu?=
 =?us-ascii?Q?puJ4KCGAu7UEYrmTCy9UqwRrtFOGelGwiow6hoD1KyQXGK6Npt6p87yDsa37?=
x-ms-exchange-antispam-messagedata-1: b1semIGjMNFjCt+afzhgFPx9psz0jkModCc=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: VicJrG/TnvIXeLL3baTlsviONb61ErqUywZW5dndtGky6x4066VoBX9NyL1XDccWyHES3aaMPUpFUraDeQuHjZp9l86QULaxSQdbPNy8T3JxvMuj5CUEC4VZp2Fvc6TcwK18sAaJCORlRxFW7Dh9Vv8Pu5CwmRj5KYkcn5HoUjJW+/40XzXKxR4k9EUxlN4/OSIkSqLoX5e9nketwBBmHKZAO70YwS7XCISYkFpeuolzyIQBSG7IYAH4Vt9Ozt90/dvSMbdjR/1oqXPVuLMb9ozBvh44oKF4Tiu1ahJqYsc2dfdjziNFhfmVI9DT/snDsBTxZWcoOK2iwIQqzZ0D2Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e6b250e-3343-455d-c360-08df491f1dd9
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2026 05:03:30.2705 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lfDnoljwPA6Zeho1t7mon3XcbrEfH0XqEoKwhanRxPYaTE9CUZPF7oEIZ+JMGY4feATPCzItVnhhZAMaULdGk8BJOVkbV+eal4gHOmDRBFE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6973
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



> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Shui=
cheng
> Lin
> Sent: 21 November 2026 15:02
> To: igt-dev@lists.freedesktop.org
> Cc: Lin, Shuicheng <shuicheng.lin@intel.com>; intel-xe@lists.freedesktop.=
org;
> Kamil Konieczny <kamil.konieczny@linux.intel.com>; Auld, Matthew
> <matthew.auld@intel.com>; Kempczynski, Zbigniew
> <zbigniew.kempczynski@intel.com>
> Subject: [PATCH i-g-t] tests/intel/xe_create: Add create-huge-sysmem-defe=
r-
> backing subtest
>=20
> Create a 1 TiB system memory bo with DEFER_BACKING. Its TTM page director=
y
> needs more than INT_MAX bytes, which made kvmalloc() emit a kernel
> WARNING. Check that the ioctl fails gracefully; the WARNING itself is cau=
ght by
> igt_runner through dmesg. The expected TTM "Failed allocating page table"=
 error
> message is ignored.
>=20
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>=20
> Notes:
>     This test depends on the kernel patch "drm/ttm: Don't warn on oversiz=
ed
>     page directory allocations":
>     https://patchwork.freedesktop.org/series/179273/
>     https://lore.kernel.org/all/20261121091815.1436090-2-
> shuicheng.lin@intel.com/
>=20
>     The bo creation only reaches the TTM page directory allocation once t=
he
>     DRM mmap offset range is larger than 1 TiB, i.e. with kernel commit
>     6a68105dac4f ("drm: increase 64-bit mmap_range size to 8TB"), current=
ly
>     in drm-tip. Without it the ioctl fails earlier with -ENOSPC and the t=
est
>     passes. With it, but without the TTM fix, the kernel WARNs and the te=
st
>     is reported as dmesg-warn (or abort with --abort-on-monitored-error).
>=20
>     Tested on BMG with drm-xe-next plus 6a68105dac4f, with and without th=
e
>     TTM fix.
>=20
>  tests/intel/xe_create.c | 62 +++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 59 insertions(+), 3 deletions(-)
>=20
> diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c index
> fd1993b21..1edb9593d 100644
> --- a/tests/intel/xe_create.c
> +++ b/tests/intel/xe_create.c
> @@ -42,14 +42,16 @@ static int __ioctl_create(int fd, struct
> drm_xe_gem_create *create)
>  	return ret;
>  }
>=20
> -static int __create_bo(int fd, uint32_t vm, uint64_t size, uint32_t plac=
ement,
> -		       uint32_t *handlep)
> +static int __create_bo_flags(int fd, uint32_t vm, uint64_t size,
> +			     uint32_t placement, uint32_t flags,
> +			     uint32_t *handlep)
>  {
>  	struct drm_xe_gem_create create =3D {
>  		.vm_id =3D vm,
>  		.size =3D size,
> -		.cpu_caching =3D __xe_default_cpu_caching(fd, placement, 0),
> +		.cpu_caching =3D __xe_default_cpu_caching(fd, placement, flags),
>  		.placement =3D placement,
> +		.flags =3D flags,
>  	};
>  	int ret;
>=20
> @@ -61,6 +63,12 @@ static int __create_bo(int fd, uint32_t vm, uint64_t s=
ize,
> uint32_t placement,
>  	return ret;
>  }
>=20
> +static int __create_bo(int fd, uint32_t vm, uint64_t size, uint32_t plac=
ement,
> +		       uint32_t *handlep)
> +{
> +	return __create_bo_flags(fd, vm, size, placement, 0, handlep); }
> +
>  /**
>   * SUBTEST: valid-flag
>   * Functionality: ioctl_input_validation @@ -405,6 +413,51 @@ static voi=
d
> create_massive_size(int fd)
>  	}
>  }
>=20
> +/**
> + * SUBTEST: create-huge-sysmem-defer-backing
> + * Functionality: ioctl
> + * Test category: functionality test
> + * Description: Create a system memory bo with DEFER_BACKING whose TTM
> page
> + *		directory needs more than INT_MAX bytes, and verify the
> + *		ioctl fails gracefully instead of triggering a kernel warning
> + *		in the kvmalloc() size check.
> + */
> +static void create_huge_sysmem_defer_backing(int fd) {
> +	/*
> +	 * TTM keeps one pointer per page in its page directory, and
> +	 * kvmalloc() refuses (and warns about) anything above INT_MAX bytes.
> +	 * 1 TiB of 4 KiB pages needs 2 GiB of pointers, just above the limit.
> +	 * DEFER_BACKING places the bo in system memory first, which
> bypasses
> +	 * the total-RAM limit of the TT manager, so the page directory
> +	 * allocation is reached without any real memory being consumed.
> +	 */
> +	const uint64_t size =3D ((uint64_t)INT_MAX / sizeof(uint64_t) + 1) *
> +			      PAGE_SIZE;
> +	uint32_t handle =3D 0;
> +	int ret;
> +
> +	/* The expected allocation failure is logged with pr_err() by TTM. */
> +	igt_emit_ignore_dmesg_regex("Failed allocating page table");
> +
> +	ret =3D __create_bo_flags(fd, 0, size, system_memory(fd),
> +
> 	DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING, &handle);
> +	igt_debug("bo create of %" PRIu64 " bytes returned %d\n", size, ret);
> +
> +	/*
> +	 * -ENOSPC: the size does not fit in the mmap offset range.
> +	 * -ENOMEM: the TTM page directory could not be allocated.
> +	 * Success is fine as well, as long as no kernel warning is emitted,
> +	 * which is checked by igt_runner through dmesg.
> +	 */
> +	igt_assert_f(ret =3D=3D 0 || ret =3D=3D -ENOMEM || ret =3D=3D -ENOSPC,
> +		     "unexpected bo create result %d (%s)\n", ret,
> +		     strerror(-ret));
> +
> +	if (!ret)
> +		gem_close(fd, handle);
> +}
> +
>  /**
>   * SUBTEST: create-big-vram
>   * Functionality: bo
> @@ -581,6 +634,9 @@ int igt_main_args("Q:p:", NULL, help_str, opt_handler=
,
> NULL)
>  		create_massive_size(xe);
>  	}
>=20
> +	igt_subtest("create-huge-sysmem-defer-backing")
> +		create_huge_sysmem_defer_backing(xe);
LGTM,
Reviewed-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> +
>  	igt_subtest_with_dynamic("create-big-vram") {
>  		int gt;
>=20
>=20
> base-commit: 792f1105b5f0e2bc254cf2254cc8f6aef8799659
> --
> 2.43.0

