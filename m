Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F77606A33E
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 09:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hqDpkBPV;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=Sa3vcm9J
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E142610E2E6;
	Fri, 20 Nov 2026 09:43:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4C7C10E209;
 Fri, 20 Nov 2026 09:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795167774; x=1826703774;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=0CARCX9uVvhlZ4hCHQDWnCWwda4EAPvj2UNaj8vX1IU=;
 b=hqDpkBPVHpOJAvPxgbsa4ips2WNnXjnzTS/IN2y1WySbS/Gj7vGoZPR5
 iuWE/JJZUMMes8uxJTZDcqHpbUDsi8cucjPtfRqBm7I+WcWcAHOecScez
 K2YSH/7e8+NF2mSphT9l1nKLXLKD69TsaJcDzIgjQAlpqeqhvfL1iYQPs
 mxLDG5lpak9OtCwBI65XAxwln6vNT1V8QsyAgFEp3Qt0fU9EkNV9b6/7O
 vYEhmABaU4EX9+XkqdboxtITdhNIYrcRGiJvZyWfMc6359aIuTdPgoG78
 LPL9TjAwLTDd3Ft7my4J5ORlgClL7AsvUk8Evn5Fi9SYXWqbrjpSleDWH A==;
X-CSE-ConnectionGUID: vAdXlZkuT3aGaLSf3NuOfw==
X-CSE-MsgGUID: 5lTjvT3LTza0P8w5TDIJhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3955551"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="3955551"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 01:42:54 -0800
X-CSE-ConnectionGUID: 1Eb178pQQleWbJzt8DJRmA==
X-CSE-MsgGUID: MKyiVn98Q6mrF3d/VFDRhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; d="scan'208";a="11018221"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 01:42:53 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 01:42:52 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 20 Nov 2026 01:42:52 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.5) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 01:42:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XJXm9ZK18m11EXDqtI1sy3svcloxrE/scVng7GGHMVPcBD5bnHc1cpW6ulM75+lhUsgKkZoFFmfc7L4USm36l1ymWT0v+/faw6IZTj2ktAANW9p/HqPfjPIJkWCc/z0+mwVaGauIpWxPjXKCBqZYL3Eqchu1+Gl6AiIDnNjhb3pJGcwqUIlNorFO9xU6G/xGOE25JJJJhAJzhFxNsghLG73LfrFtYY/d4VHruvNd4bE3UIFG5kxn7WpVZvoudvK338ny7iaWviVpd8Omh9XXhocfgzgtjG64LEEplPQItLqUZyLM+3cYMh1jW3LxHuwb4nnFX7vyD/Z03a53+PSlpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0CARCX9uVvhlZ4hCHQDWnCWwda4EAPvj2UNaj8vX1IU=;
 b=pNFvx6CK3D1PN+sxPPFtlUxJ+6P7l3I9FYYvGVCZC56nPjr+zCPr+WW6Vu4tgzxOAOFRtmAJ8UWo55vVAYZ/6Npq+XExlDnu/3QyOe8DsQ9tCEviFJ/BTj/4931RaXzq+Bz6FUXnBFGtWebpAaZlq5fzHOcu30uB9x44x/jgykEfner51dyUWpIwo0pBPvWbukkXd/t8HVaHS9ZMemAtT/YUlTd6z08DO/R9cqXJ72VK+1nEddxu3X5jt8BbO91QYnMll01zqmLpaZ7yO6WSFHClInoTkM3BL5TzbDv/FhDXEfLGdORTo+DD/nMgxvOQuUHMzbFtokKyGPwpXk52zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0CARCX9uVvhlZ4hCHQDWnCWwda4EAPvj2UNaj8vX1IU=;
 b=Sa3vcm9J36J22MrsJr53G4V0Z933TayYL0uejAXAm2zcPqyTW+j0GwfPQjdDWeGjs6MlPo1BezwEQqoypgpaFUkG4oFIEfQrSt2Gi2EPHhC84MfG9Ne+6Hgkir2iA4sEOln8KiSinPEFCUTErWrFLm46ysOnub93sADPDkvBOFI=
Received: from LV2PR11MB6024.namprd11.prod.outlook.com (2603:10b6:408:17a::16)
 by SN7PR11MB6775.namprd11.prod.outlook.com (2603:10b6:806:264::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 09:42:40 +0000
Received: from LV2PR11MB6024.namprd11.prod.outlook.com
 ([fe80::38ad:3190:bbb2:412b]) by LV2PR11MB6024.namprd11.prod.outlook.com
 ([fe80::38ad:3190:bbb2:412b%6]) with mapi id 15.21.0615.013; Fri, 20 Nov 2026
 09:42:40 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "j@metarealtyinc.ca" <j@metarealtyinc.ca>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "Manna, Animesh" <animesh.manna@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Shankar, Uma" <uma.shankar@intel.com>, "ville.syrjala@linux.intel.com"
 <ville.syrjala@linux.intel.com>, "jani.nikula@linux.intel.com"
 <jani.nikula@linux.intel.com>
Subject: Re: [RFC PATCH] drm/i915/psr: Send the AS SDP in PR Active while
 vblank is enabled
Thread-Topic: [RFC PATCH] drm/i915/psr: Send the AS SDP in PR Active while
 vblank is enabled
Thread-Index: AQHdVd7OB1r9KQ3+QkGsgdXDuCF/37c2+zcA
Date: Fri, 20 Nov 2026 09:42:40 +0000
Message-ID: <76935065478d9f4ab9ee42e36b541101bad34423.camel@intel.com>
References: <20260923041342.2146450-1-j@metarealtyinc.ca>
 <20261006220500.3417572-1-j@metarealtyinc.ca>
In-Reply-To: <20261006220500.3417572-1-j@metarealtyinc.ca>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR11MB6024:EE_|SN7PR11MB6775:EE_
x-ms-office365-filtering-correlation-id: 220edea1-21f2-4dc9-039b-08df46ea9e98
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|261021123027099003|261026140227099003|261021121427099003|261026121527099003|261022105027099003|261028144727099003|261102123227099003|38070700021|4143699003|5023799004|11063799006|56012099006|10067099003|261009223027099003|22082099003|18002099003|6133799003;
x-microsoft-antispam-message-info: TM598Ay4Jiuh39o06/Y31XhP1wkMbrt/XZrl30LWI26oY4GY+8M+6wdqSUX/iW+mZBhdGdrVXLD9zz3aRgSghePkTdnTxpmsxGTjVjPFwh12LW6VzYzspl2qGKxT9bUAHAzUol1QB8bppSaCcwgXe8O4PmbiqFPmljrUHOvYmFeETi5ArbZkW0wr9Dq2b0Npmsf6hN4z8c8Nj3GBYcFMMWxsOKRavOD/PrSCIOEyK/FzWQBVQeI1VupAejyzS5s5YWHi4ITfKTm87NTct/txww2+40ZsPck/AUMS+lQOcsEBCovdKPAtldmq2mdUC4mfSVn173cB16+xxDQwpkBAsUyOGI0RVMj+GvbIOC+gIWfV3Q7T6leCdby+SuQ6hiXHNw+w87zfiYiXsCLW4ncQ+LmHmFUzI1jsCVINi8hyyi2VSx8vJGzVoIww/dC7F0/ZE9P1LnDohsSzCCBPMgwrXyvrEt3D3NCrPReT11PHXjXRGEIxPReD8/0XAghIoky1gbexCua3hVfAmcg7Q41aFZHlwJjeBXNgFTV0yzetzefPhRKKEomyO593taP84oiI1QuSj6iFr0wKh3rLsCs3DOIioF0f3ezMYPuR6Bn3SD6Jwo6jaA1mU2Tx0PxUqicipOi5J+W8OhVaqDTUSParURP6X3lElyovrgi0s6RsscU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR11MB6024.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(261021123027099003)(261026140227099003)(261021121427099003)(261026121527099003)(261022105027099003)(261028144727099003)(261102123227099003)(38070700021)(4143699003)(5023799004)(11063799006)(56012099006)(10067099003)(261009223027099003)(22082099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RFhQU2VHdVVqQmlubS9rUzVwZGtiZHVMcnJXUWZoZkhneWNjak5NYjRSS25D?=
 =?utf-8?B?N0pBSG1BbHRUbENaSXNKRllZbGFPeHRJWEFYbC9USU1xSWRsZ0JCaUlsaVpz?=
 =?utf-8?B?UXphRE43Wld6NG1iMGZKdTJKcFJWelpxY2tCbjZ2bzJwbTdlQlZ5cjJEdTg1?=
 =?utf-8?B?bHI3aUJXSVNnWG1YdkFCRXRlVkpQTkw0UUVvV25aQUQ1UjczZ21nT29vLzVq?=
 =?utf-8?B?NXRoazhxTXJkYWZ5TGhpVmo4SzU3TVIzK3R1OEhzWmtYVTlDY0VCMEhjN01h?=
 =?utf-8?B?Q1BUQWI2L0l1UXJJOHplVE1ueVIyMHp6V280a3VsV1pkUFRlR2xKZDZVYmhB?=
 =?utf-8?B?V2Uxb0d1MEM3TmxRdkdnNkw1c0preGRhdzV4QmV1a3kwRVFuaTRWMmVJWE5T?=
 =?utf-8?B?VGFlWlJEU3ZYbWk2Z1ArcDVBQlNBeE1jNk9paEJabk8walJiaHhpZWIxRUlj?=
 =?utf-8?B?bVozVjZvUjVKZzNLN0FYK2IzQVVzeGxMWVJoVGtTNDBqSVN2M3NZWFJGdXJJ?=
 =?utf-8?B?THFsMmRPQmZZNlJ1clIvaTlhMzBPUHV6UWtmS09wQWQwR0xwZzl6d3N5Y1ph?=
 =?utf-8?B?Zk95WWJnY1dmWEVoN250MTE0bVJHZjJZUmpCMWNVOVNnMVBuM25NQ0VsUWNB?=
 =?utf-8?B?QUl5NG5wZmlwTjM1TEVwd2sxN1ZFWnpZZE40QitPcll5Mk5mazRndjRnMVlj?=
 =?utf-8?B?cTRUbzJkU1NwY2s2OE13RmM3STI4UmpKcGVDSVFjdEJGeDMzaThzSlY0N0Va?=
 =?utf-8?B?VzBTMnhUdTZmNFVMMFR4alVVTzFzWFFKeGd2VlVocEhrZmhqbTExYlBoQmlF?=
 =?utf-8?B?aTZWY1hlSnFPa2hJaFdiNFp6TGYzQW0wNklMVmpZc0JhajVscWpVSHFRUG5H?=
 =?utf-8?B?SVU3Qll6VEQxOFZBM3VHQXQxbVpiSVhCaklTSUsyMk94QzNJWXJGTUtsVThn?=
 =?utf-8?B?Vk5qZEFZRWNSZTFSUkRoWTZXWUJCRjByalZoYXZmNmVXcEkrcC85T1Y2NzV6?=
 =?utf-8?B?TFNFUEMxdXZyTTlOd2t6d0JaUUZSLzlpeEtCendRTnMzdmNVVEV0UkdBbCtk?=
 =?utf-8?B?MlRBZWZiUElJVVpuNUZLRUtxRExBZkFET1lUM2tpNFdTRnhYODR3N0FhNlYx?=
 =?utf-8?B?ajR1cno3RmtUUWk2d2grK3dJNVpiQldOVG16NzJJRGpBZEdJU2crRDJrSm5p?=
 =?utf-8?B?ZStScnhidnJ3a0tEZWFGaGJPRDdGSFEwQVdUYWMyWHRiUGE4Y3Q5c1lPMkpZ?=
 =?utf-8?B?b1hQN2h2emczZ0JQL2JhbzFjR3FKbjFpNTFVZzZhWjVKVGI4TktuQi9SeWJt?=
 =?utf-8?B?Y09qM2htdzM5NGJScTI4Y3lFZHpBeDE3eFM3U0gzeHhMTVZuMWdFQXJ6Z1Y3?=
 =?utf-8?B?OU9qQ0RDUjFuK3Q0NUpRZU8xODhIMzFlOUVRcjNqeFdtUFZrZVpLTXB3VHhk?=
 =?utf-8?B?ZjUxVVlUOWNHZUlVQlR6SUo4WnlKMko4dUZSZGJ6SEpCdVBxamxnMkhiWS9o?=
 =?utf-8?B?TGdVaGpFVnBRY09yRzFqRmM5bWljcUlBRDJDQnF2SlU3NG1yZ3RCL09LdFlw?=
 =?utf-8?B?WWU0eEpEM29GVStxd0p0Mkx3OHNOd2MxZU90YzlFd0N3WFo4V3hrbitDdmdL?=
 =?utf-8?B?TGFsT2FMRFlvZngyelhVTzBzK09TMlIxTjN5UjhqbmtZc1pTaWZBRVJ3K3A5?=
 =?utf-8?B?M0h0SC8xM3pzc0R4b2ZyTndIdmxLVjVHdVl2YzU2ckhQQVc2K1puQlcwL0dC?=
 =?utf-8?B?NGl0TGNqTFQxK3NicHdtT1VaY1dwT2tqZUM0dmxBN2NWbU5IVTNlU2MzaVl2?=
 =?utf-8?B?b0hHK3I0enNwNysvL0hKRU1ZUXQzUlpXSVBvTzVmeVVmeXdrZzE1d3BPOGpF?=
 =?utf-8?B?Z1BEL1VveXNVck9haEFab2ZEdGV2SGlRa1ArTG41cU40bUIvd3JtL2FRR0Iy?=
 =?utf-8?B?cGhHTC9DUjVYL2NGOWJqVUZkK0srMmZLK1Z2VFdFcGV3eVBoK05XUys1cUZ3?=
 =?utf-8?B?cDdiMXU3YmdnMVhITWExbkgvOXl3ZSs1MFIrbWtWeEJIYS93VksxNzEwdzNI?=
 =?utf-8?B?NGhhWmF4OXl4OC9kWDZVUmtnWVdXY0c1cyt0OHdDTHErRWxyaURqMDVueWFK?=
 =?utf-8?B?U2N1MmZYS2JodDBSTnJFT21WdFZScitvR1VRNGNtK0M5Q1ZzU014amd5Snhz?=
 =?utf-8?B?ZmNFbTErSm1hbnJBS3RYY2JjT0NIeHFWSnVlRmczWDMvbm8rR04xOGoxc0N0?=
 =?utf-8?B?VkYxaFduWnJrT2Y1bW0vdFNuQWo2L1k5azBWbEowYWdLVjhUamt0QW9jNnpo?=
 =?utf-8?B?U1lPbGg5RjBWamVDZHFRalNmakc3bGRsUmJmOEpLbnF5Ym1CK3FEOE1Lc2V5?=
 =?utf-8?Q?4eP915Rpyz82kYCU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5A688AB6BD3D6943A180854A00402852@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: O46Eh+ZB8KrjJS4vqynMamJZ3GxNDPRM+9siW8BLPPc1axjL3WZHSBqNCcvCp/AI8YPNXacaAX6UBZB0jObDkIYyqb05cwigJDdfL2Pq6ImSbcInlnbhuNR9Mu+9ZPZ1GGkgGbtqPL5281WQQwJMa920rP4fK8sngXyA597kzkvpKIYAcMmYsjriHd5WLrjyyBqXuNk6mnkAOcqVsidHmABl0Ao2+D5fG/UrtEFFnbPGiZd9oiJmaaKY6L9jpm+bXeCKnxIWIgf/17HIPEQZAxLZGJaINQQzyTJV448Mlqqi5FgCRREPB1klq/UuzkVcj8UztxG+j95hBDXMegCkCg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR11MB6024.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 220edea1-21f2-4dc9-039b-08df46ea9e98
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2026 09:42:40.6837 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +VuabIkZi5WN5DjeTnvaVJWlhHpqmiW0eT6Cx7dlsTgqDttoRbcn8TJpjGyeXmjBKjVSxxaPMNUTkVlJUh3zGl5Z0sIBuR0M38nfgiyZmJ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6775
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

T24gVHVlLCAyMDI2LTEwLTA2IGF0IDE4OjA1IC0wNDAwLCBKYWtlIFN0ZWlubWFuIHdyb3RlOg0K
PiBTaW5rcyB0aGF0IHN1cHBvcnQgYXN5bmMgdmlkZW8gdGltaW5nIGluIFBSIGdldCB0aGUgQVMg
U0RQIHN1c3BlbmRlZA0KPiBpbg0KPiBQUiBBY3RpdmUgKGRpc2FibGVfYXNfc2RwX3doZW5fcHJf
YWN0aXZlKS4gVGhlIExHIHBhbmVsIGluIHRoZSBEZWxsDQo+IFhQUw0KPiAxNiBEQTE2MjYwIChz
aW5rIE9VSSAwMDoyMjpiOSwgIkJhbHNhMiIpIHRoZW4ganVkZGVycyB3aGlsZSBmcmFtZXMNCj4g
YXJlDQo+IHVwZGF0aW5nLCB3aXRoIHRoZSBzb3VyY2UgZmxpcHBpbmcgYXQgYSBzdGVhZHkgOC4z
MyBtcy4gTGVhdmluZyB0aGUNCj4gQVMNCj4gU0RQIG9uIGZpeGVzIGl0IGJ1dCBibG9ja3MgREM1
L0RDNi4NCj4gDQo+IENsZWFyIFBSX0FMUE1fQ1RMW0FTIFNEUCBUcmFuc21pc3Npb24gaW4gQWN0
aXZlIERpc2FibGVdIHdoaWxlIHZibGFuaw0KPiBpbnRlcnJ1cHRzIGFyZSBlbmFibGVkIGFuZCBz
ZXQgaXQgYWdhaW4gd2hlbiB0aGV5IGFyZSBkaXNhYmxlZC4gUGFuZWwNCj4gUmVwbGF5IGFscmVh
ZHkgaG9sZHMgRENfT0ZGIHdoaWxlIHZibGFuayBpcyBlbmFibGVkLCBzbyBubyBEQzUvREM2DQo+
IHJlc2lkZW5jeSBpcyBsb3N0LiBOb3QgZG9uZSB3aGVuIEFTIFNEUCBza2lwIGZyYW1lcyBpcyBp
biB1c2UuDQoNCkZpbmFsbHkgSSB3YXMgYWJsZSB0byBnZXQgY29uZmlybWF0aW9uIGludGVybmFs
bHkgb24gdGhpcy4gV2Ugc2hvdWxkDQphY3R1YWxseSB1c2UgdGhpcyBhcHByb2FjaC4NCg0KU2Vj
b25kIHBhdGNoIGluIHlvdXIgc2V0IGNvdWxkIGJlIHJlbW92YWwgb2YgdGhlIHF1aXJrPyBUaGF0
IG9uZSBjb3VsZA0KaGF2ZSB0YWcgIkNsb3NlczoNCmh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9w
Lm9yZy9kcm0veGUva2VybmVsLy0vd29ya19pdGVtcy85MTE5Ig0KDQpBbHNvIGFkZCB0aGVzZSBp
bnRvIHRoaXMgcGF0Y2g6DQoNCkZpeGVzOiBkNmE4MzM2YzVmMDYgKCJkcm0vaTkxNS9hbHBtOiBX
cml0ZSBQUl9BTFBNX0NUTCByZWdpc3RlciIpDQpDYzogSm91bmkgSMO2Z2FuZGVyIDxqb3VuaS5o
b2dhbmRlckBpbnRlbC5jb20+DQpDYzogaW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0K
Q2M6IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KQ2M6IDxzdGFibGVAdmdlci5rZXJu
ZWwub3JnPiAjIHY2LjE3Kw0KDQo+IA0KPiBMaW5rOiBodHRwczovL2dpdGxhYi5mcmVlZGVza3Rv
cC5vcmcvZHJtL3hlL2tlcm5lbC8tL2lzc3Vlcy85MTE5DQo+IExpbms6IGh0dHBzOi8vZ2l0bGFi
LmZyZWVkZXNrdG9wLm9yZy9kcm0veGUva2VybmVsLy0vaXNzdWVzLzg5MzANCj4gQ2M6IEpvdW5p
IEjDtmdhbmRlciA8am91bmkuaG9nYW5kZXJAaW50ZWwuY29tPg0KPiBDYzogQW5pbWVzaCBNYW5u
YSA8YW5pbWVzaC5tYW5uYUBpbnRlbC5jb20+DQo+IENjOiBBbmtpdCBOYXV0aXlhbCA8YW5raXQu
ay5uYXV0aXlhbEBpbnRlbC5jb20+DQo+IENjOiBVbWEgU2hhbmthciA8dW1hLnNoYW5rYXJAaW50
ZWwuY29tPg0KPiBDYzogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVs
LmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogSmFrZSBTdGVpbm1hbiA8akBtZXRhcmVhbHR5aW5jLmNh
Pg0KPiAtLS0NCj4gSm91bmksIHRoaXMgaXMgdGhlIGZpeCBmb3IgdGhlIHN0dXR0ZXIgaW4gdGhl
IHRocmVhZCBiZWxvdy4gVGhlIDB4MTA3DQo+IGJpdCA2IHBhdGNoIHRoZXJlIGlzIHN0aWxsIGNv
cnJlY3QgYnV0IGlzIG5vdCBlbm91Z2ggb24gaXRzIG93bi4NCj4gaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvci8yMDI2MDkyMzA0MTM0Mi4yMTQ2NDUwLTEtakBtZXRhcmVhbHR5aW5jLmNhDQo+IA0K
PiAtIFJ1biBhcyBhbiBlcXVpdmFsZW50IGNoYW5nZSBvbiA3LjMtcmM0IGFuZCByYzUgKFBUTCwg
eGUpIHNpbmNlIDI4DQo+IFNlcDoNCj4gwqAgc21vb3RoLCBEQzUgc3RpbGwgcmVhY2hlZCB3aGVu
IGlkbGUuIFRoaXMgZHJtLXRpcCB2ZXJzaW9uIGlzIGJ1aWxkDQo+IMKgIHRlc3RlZCBvbmx5IChX
PTEsIGk5MTUgYW5kIHhlKS4NCj4gLSBBIHNlYW1sZXNzIFZSUiB0b2dnbGUgcmV3cml0ZXMgUFJf
QUxQTV9DVEwgdGhyb3VnaA0KPiDCoCBpbnRlbF9hbHBtX2NvbmZpZ3VyZV9wcl9hc19zZHAoKSBh
bmQgc2V0cyB0aGUgYml0IGFnYWluIHVudGlsIHRoZQ0KPiDCoCBuZXh0IHZibGFuayBlbmFibGUu
IE5vdCBoYW5kbGVkIGhlcmUuDQo+IC0gQSBzZWNvbmQgbWFjaGluZSBzaG93cyB0aGUgc2FtZSB0
aGluZzogWFBTIDEzICgxMDI4OjBlNTMsIHNhbWUgc2luaw0KPiDCoCBPVUkpLCBmaXhlZCBkb3du
c3RyZWFtIGJ5IGV4aXRpbmcgUFIgb24gZXZlcnkgZmx1c2ggKGlzc3VlIDg5MzApLg0KPiAtIFNl
cGFyYXRlIGZyb20gdGhpczogdGhlIHBhbmVsIGp1ZGRlcnMgZm9yIGEgZmV3IHNlY29uZHMgYWZ0
ZXIgcGFuZWwNCj4gwqAgcG93ZXItb24uIExvY2FsbHkgSSBob2xkIFBSIGluYWN0aXZlIGFmdGVy
IHBvd2VyLW9uOyAzIHMgd2FzIG5vdA0KPiDCoCBxdWl0ZSBlbm91Z2gsIDggcyBpcyBjbGVhbi4g
Tm90IHBhcnQgb2YgdGhpcyBwYXRjaC4NCj4gLSBDSSBoYXMgbmV2ZXIgcnVuIG9uIG15IHBhdGNo
ZXMgKGFkZHJlc3Mgbm90IG9uIHRoZSBhbGxvd2xpc3QsIGFza2VkDQo+IMKgIHR3aWNlKS4gQ291
bGQgc29tZW9uZSB0cmlnZ2VyIGl0IGZvciB0aGlzIG9uZSBhbmQgZm9yIHNlcmllcw0KPiAxNzQ4
MTA/DQo+IMKgLi4uL2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheV90eXBlcy5owqDCoMKg
IHzCoCAzICsrDQo+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9wc3IuY8Kg
wqDCoMKgwqAgfCAzNg0KPiArKysrKysrKysrKysrKysrKystDQo+IMKgMiBmaWxlcyBjaGFuZ2Vk
LCAzOCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X3R5cGVzLmgNCj4gYi9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfdHlwZXMuaA0KPiBpbmRleCAw
ZTMwODNlODUuLjc1MTEzZWQxMCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9kaXNwbGF5X3R5cGVzLmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X3R5cGVzLmgNCj4gQEAgLTE4MTYsNiArMTgxNiw5IEBA
IHN0cnVjdCBpbnRlbF9wc3Igew0KPiDCoAlib29sIGRjM2NvX2FsbG93ZWQ7DQo+IMKgCS8qIERD
M0NPIGRpc2FibGUgd29yayAqLw0KPiDCoAlzdHJ1Y3QgZGVsYXllZF93b3JrIGRjM2NvX3dvcms7
DQo+ICsJLyogQVMgU0RQIGluIFBSIEFjdGl2ZSBmb2xsb3dzIHZibGFuayBlbmFibGUgKi8NCj4g
Kwlib29sIHByX2FzX3NkcF9mb2xsb3dfdmJsYW5rOw0KPiArCWJvb2wgdmJsYW5rX2VuYWJsZWQ7
DQo+IMKgCXUxNiBzdV93X2dyYW51bGFyaXR5Ow0KPiDCoAl1MTYgc3VfeV9ncmFudWxhcml0eTsN
Cj4gwqAJYm9vbCBzb3VyY2VfcGFuZWxfcmVwbGF5X3N1cHBvcnQ7DQo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Bzci5jDQo+IGIvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9wc3IuYw0KPiBpbmRleCAwMGQwMTQ2YjIuLjBmMGIxZmM5
NCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9wc3Iu
Yw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Bzci5jDQo+IEBA
IC0yMTY2LDYgKzIxNjYsMjkgQEAgc3RhdGljIGJvb2wgcHNyX2ludGVycnVwdF9lcnJvcl9jaGVj
ayhzdHJ1Y3QNCj4gaW50ZWxfZHAgKmludGVsX2RwKQ0KPiDCoAlyZXR1cm4gdHJ1ZTsNCj4gwqB9
DQo+IMKgDQo+ICsvKg0KPiArICogU2lua3MgdGhhdCBzdXBwb3J0IGFzeW5jIHZpZGVvIHRpbWlu
ZyBpbiBQUiBnZXQgdGhlIEFTIFNEUA0KPiBzdXNwZW5kZWQgaW4gUFINCj4gKyAqIEFjdGl2ZS4g
U29tZSB0aGVuIGRyaWZ0IG91dCBvZiBwaGFzZSB3aXRoIHRoZSBzb3VyY2UgYW5kIGp1ZGRlcg0K
PiB3aGlsZQ0KPiArICogZnJhbWVzIGFyZSBiZWluZyB1cGRhdGVkLiBTZW5kIHRoZSBBUyBTRFAg
aW4gUFIgQWN0aXZlIHdoaWxlDQo+IHZibGFuaw0KPiArICogaW50ZXJydXB0cyBhcmUgZW5hYmxl
ZDogUGFuZWwgUmVwbGF5IGhvbGRzIERDX09GRiB0aGVuIGFueXdheSwgc28NCj4gdGhpcw0KPiAr
ICogY29zdHMgbm8gREM1L0RDNiByZXNpZGVuY3kuIFN1c3BlbmQgaXQgYWdhaW4gd2hlbiB2Ymxh
bmsNCj4gaW50ZXJydXB0cyBhcmUNCj4gKyAqIGRpc2FibGVkLCBiZWZvcmUgRENfT0ZGIGlzIGRy
b3BwZWQuDQo+ICsgKi8NCj4gK3N0YXRpYyB2b2lkIGludGVsX3Bzcl9wcl9hc19zZHBfdXBkYXRl
KHN0cnVjdCBpbnRlbF9kcCAqaW50ZWxfZHApDQo+ICt7DQo+ICsJc3RydWN0IGludGVsX2Rpc3Bs
YXkgKmRpc3BsYXkgPSB0b19pbnRlbF9kaXNwbGF5KGludGVsX2RwKTsNCj4gKw0KPiArCWxvY2tk
ZXBfYXNzZXJ0X2hlbGQoJmludGVsX2RwLT5wc3IubG9jayk7DQo+ICsNCj4gKwlpZiAoIWludGVs
X2RwLT5wc3IuZW5hYmxlZCB8fCAhaW50ZWxfZHAtDQo+ID5wc3IucHJfYXNfc2RwX2ZvbGxvd192
YmxhbmspDQo+ICsJCXJldHVybjsNCg0KWW91IGNvdWxkIGRyb3AgcHJfYXNfc2RwX2ZvbGxvd192
YmxhbmsuIEluc3RlYWQgY2hlY2sgaGVyZSBvbmx5DQpjcnRjX3N0YXRlLT5kaXNhYmxlX2FzX3Nk
cF93aGVuX3ByX2FjdGl2ZSBhbmQgaW50ZWxfZHAtPnBzci5lbmFibGVkDQoNClRoZW4ganVzdCB1
c2UgaW52ZXJ0ZWQgaW50ZWxfZHAtPnBzci52YmxhbmtfZW5hYmxlZCB0byBzZXQvY2xlYXIgdGhl
DQpiaXQuDQoNCkV2ZXJ5dGhpbmcgZWxzZTrCoA0KDQppbnRlbF9hbHBtX3ByX2FzX3NkcF9za2lw
X2ZyYW1lc19lbmFibGVkDQppbnRlbF9wc3JfbmVlZHNfYWxwbV9hdXhfbGVzcw0KY3J0Y19zdGF0
ZS0+aW5mb2ZyYW1lcy5lbmFibGUgJg0KaW50ZWxfaGRtaV9pbmZvZnJhbWVfZW5hYmxlKERQX1NE
UF9BREFQVElWRV9TWU5DKQ0KDQpjb3VsZCBiZSBjaGVja2VkIGluIGNvbXB1dGVfZGlzYWJsZV9h
c19zZHBfd2hlbl9wcl9hY3RpdmUuDQoNCldvdWxkIHRoaXMgd29yayBmb3IgeW91Pw0KDQo+ICsN
Cj4gKwlpbnRlbF9kZV9ybXcoZGlzcGxheSwgUFJfQUxQTV9DVEwoZGlzcGxheSwgaW50ZWxfZHAt
DQo+ID5wc3IudHJhbnNjb2RlciksDQo+ICsJCcKgwqDCoMKgDQo+IFBSX0FMUE1fQ1RMX0FTX1NE
UF9UUkFOU01JU1NJT05fSU5fQUNUSVZFX0RJU0FCTEUsDQo+ICsJCcKgwqDCoMKgIGludGVsX2Rw
LT5wc3IudmJsYW5rX2VuYWJsZWQgPyAwIDoNCj4gKwkJwqDCoMKgwqANCj4gUFJfQUxQTV9DVExf
QVNfU0RQX1RSQU5TTUlTU0lPTl9JTl9BQ1RJVkVfRElTQUJMRSk7DQoNCkkgcHJvcG9zZSB5b3Ug
YWRkIGEgbmV3IGhlbHBlciBpbnRvIGludGVsX2FscG0uYyBwcm92aWRpbmcgaW50ZXJmYWNlDQpq
dXN0IHRvIHNldCB0aGUgYml0Lg0KDQpBbHNvIHlvdSBuZWVkIHRvIHJlbW92ZSBzZXR0aW5nIHRo
ZSBiaXQgaW4NCmludGVsX2FscG1fY29uZmlndXJlX3ByX2FzX3NkcC4gVGhhdCBjb3VsZCBiZSBz
ZXBhcmF0ZSBwYXRjaC4NCg0KQlIsDQpKb3VuaSBIw7ZnYW5kZXINCg0KPiArfQ0KPiArDQo+IMKg
c3RhdGljIHZvaWQgaW50ZWxfcHNyX2VuYWJsZV9sb2NrZWQoc3RydWN0IGludGVsX2RwICppbnRl
bF9kcCwNCj4gwqAJCQkJwqDCoMKgIGNvbnN0IHN0cnVjdCBpbnRlbF9jcnRjX3N0YXRlDQo+ICpj
cnRjX3N0YXRlKQ0KPiDCoHsNCj4gQEAgLTIyMjUsNiArMjI0OCwxMiBAQCBzdGF0aWMgdm9pZCBp
bnRlbF9wc3JfZW5hYmxlX2xvY2tlZChzdHJ1Y3QNCj4gaW50ZWxfZHAgKmludGVsX2RwLA0KPiDC
oAlpbnRlbF9kcC0+cHNyLmVuYWJsZWQgPSB0cnVlOw0KPiDCoAlpbnRlbF9kcC0+cHNyLnBhdXNl
X2NvdW50ZXIgPSAwOw0KPiDCoA0KPiArCWludGVsX2RwLT5wc3IucHJfYXNfc2RwX2ZvbGxvd192
YmxhbmsgPSBjcnRjX3N0YXRlLQ0KPiA+aGFzX3BhbmVsX3JlcGxheSAmJg0KPiArCQljcnRjX3N0
YXRlLT5kaXNhYmxlX2FzX3NkcF93aGVuX3ByX2FjdGl2ZSAmJg0KPiArCQlpbnRlbF9kcC0+YXNf
c2RwX3N1cHBvcnRlZCAmJg0KPiBpbnRlbF9kcF9pc19lZHAoaW50ZWxfZHApICYmDQo+ICsJCSFp
bnRlbF9hbHBtX3ByX2FzX3NkcF9za2lwX2ZyYW1lc19lbmFibGVkKGludGVsX2RwLA0KPiBjcnRj
X3N0YXRlKTsNCj4gKwlpbnRlbF9wc3JfcHJfYXNfc2RwX3VwZGF0ZShpbnRlbF9kcCk7DQo+ICsN
Cj4gwqAJLyoNCj4gwqAJICogTGlua19vayBpcyBzdGlja3kgYW5kIHNldCBoZXJlIG9uIFBTUiBl
bmFibGUuIFdlIGNhbg0KPiBhc3N1bWUgbGluaw0KPiDCoAkgKiB0cmFpbmluZyBpcyBjb21wbGV0
ZSBhcyB3ZSBuZXZlciBjb250aW51ZSB0byBQU1IgZW5hYmxlDQo+IHdpdGgNCj4gQEAgLTI0MDAs
NiArMjQyOSw3IEBAIHN0YXRpYyB2b2lkIGludGVsX3Bzcl9kaXNhYmxlX2xvY2tlZChzdHJ1Y3QN
Cj4gaW50ZWxfZHAgKmludGVsX2RwKQ0KPiDCoAlpbnRlbF9kcC0+cHNyLnBrZ19jX2xhdGVuY3lf
dXNlZCA9IDA7DQo+IMKgCWNhbmNlbF9kZWxheWVkX3dvcmsoJmludGVsX2RwLT5wc3IuZGMzY29f
d29yayk7DQo+IMKgCWludGVsX2RwLT5wc3IuZGMzY29fYWxsb3dlZCA9IGZhbHNlOw0KPiArCWlu
dGVsX2RwLT5wc3IucHJfYXNfc2RwX2ZvbGxvd192YmxhbmsgPSBmYWxzZTsNCj4gwqB9DQo+IMKg
DQo+IMKgLyoqDQo+IEBAIC00MTYzLDcgKzQxOTMsMTEgQEAgdm9pZA0KPiBpbnRlbF9wc3Jfbm90
aWZ5X3ZibGFua19lbmFibGVfZGlzYWJsZShzdHJ1Y3QgaW50ZWxfZGlzcGxheSAqZGlzcGxheSwN
Cj4gwqAJCQkJaW50ZWxfZHAtPnBzci52Ymxhbmtfd2FrZXJlZiA9DQo+IMKgCQkJCQlpbnRlbF9k
aXNwbGF5X3Bvd2VyX2dldChkaXNwDQo+IGxheSwNCj4gwqAJCQkJCQkJCVBPV0UNCj4gUl9ET01B
SU5fRENfT0ZGKTsNCj4gLQkJCWVsc2UNCj4gKw0KPiArCQkJaW50ZWxfZHAtPnBzci52Ymxhbmtf
ZW5hYmxlZCA9IGVuYWJsZTsNCj4gKwkJCWludGVsX3Bzcl9wcl9hc19zZHBfdXBkYXRlKGludGVs
X2RwKTsNCj4gKw0KPiArCQkJaWYgKCFlbmFibGUpDQo+IMKgCQkJCWludGVsX2Rpc3BsYXlfcG93
ZXJfcHV0KGRpc3BsYXksDQo+IFBPV0VSX0RPTUFJTl9EQ19PRkYsDQo+IMKgCQkJCQkJCWludGVs
X2RwLQ0KPiA+cHNyLnZibGFua193YWtlcmVmKTsNCj4gwqAJCX0NCj4gDQo+IGJhc2UtY29tbWl0
OiBkYWViMDYyZmM0MGY3MjdmYWZlZmVkMDgwYzZkMTJhNWFkMWQwZDEyDQo=
