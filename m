Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABAE606E80E
	for <intel-xe@archiver.kernel.org>; Wed,  4 Nov 2026 20:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WMT5gNQV
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB10E10FEE1;
	Wed,  4 Nov 2026 20:01:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2392010FEC6
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Nov 2026 20:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793822496; x=1825358496;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=T3X+/WYvf7ymFoFDkP3JW4DexmKBP5d9zbd1axi991U=;
 b=WMT5gNQVxgwRzeZvR9DPibvq8eLjsc2E51ueK2dFM0KPKn7Ayht6ckVb
 hQTSM06pnKCMYN6YyZ4eBd4Qre9Zw5/z4qyrVyeNSQgroUYQWUBLxc0va
 8HsXAE0u50MIR42Rw064chFRhB6P8ABh/SqZT6juMWnU8JpBepx6wFOjS
 aBldM+X8yRLtx+pHDRHw75jaxcWgoRiTeCGCpaXU3MC0QH5N2AxYgTvnL
 vd4nqh4b4+fQd/d6q6FbhfFqhO4ngZ44mOGY6e5E70eAuPp73B3Io0VVe
 e1E8bOu/rMRWkLkXTv0iCm9R3CPCa54fzI/nLH6ADkZf950UHVvBuVm6H g==;
X-CSE-ConnectionGUID: YbhOE8geQGSEiMMmL0r6Zw==
X-CSE-MsgGUID: m1YCqBdvQl2Um+wqKGadqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2491187"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2491187"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 12:01:35 -0800
X-CSE-ConnectionGUID: eEC5/1gUR6mAN8dOEuSvDw==
X-CSE-MsgGUID: Zk6/VfG5Q9GWHRCvJ4ElyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="7206487"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 12:01:34 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 12:01:34 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 4 Nov 2026 12:01:34 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.71)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 12:01:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JHhhMRuWEe4HmictElwZ5e5K1P0y7BbilwYsiCPfwmfza5dk4osYkd3hbnQ9nx+em/RS5kiyalSLYhcxZ0zJd7qPciaYPQeaYQ5dllZNxF95H7mcXCh/YSvUu6jdrzjel03M0lNn9EkmLFIDPQ6xEDQCxWDldf++CcrrBrjvipohD9LWG6eGTGgeo5RGU4yxBFKANsQfE4rFfm6AwQBVDuWRH7lmW3vROR6hAmeWoRjJj1/uV2MGUGJE9vQm1sVRoJvEcMVUf+xbI+gq1psqRv2eBOz+WTO7U2y4W2OHl2xDEsPcM4PTCm1fIImtWPveS9JDEtdkTRrnyK/QNoAONQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T3X+/WYvf7ymFoFDkP3JW4DexmKBP5d9zbd1axi991U=;
 b=jsdPH2PJXocNg69rOU1el8mR4eGg5q71wW29i/5uirgs7y0t+5dM2vA3vqGZ4bMpMif4XBMfxca5TtMKNfxlcTWWNqgxpxzKVtH0LoB43AaQtaRGQUKWeQx3uUNFJcl6MzzLhmEVYIPW2ZQjEXltfBvE7faJUG5NVnGlVgcX77XKZfqTE9XcXSMTfZ4ST6djy8MQqZMCQ+n/E5u9zeMh4GAcZJjE/BuGJ4uQNtLkgytAMB9hNeruy2zQxKp5/2B9qVwlDlrScMPjf7pyM1YCFNr0ZPuhoI+YlHlChgxTjS4wtJkbDprHGiN8r69RKHp51GpOIYeMfCK5k2X7leUF7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from AT6PR11MB072844.namprd11.prod.outlook.com
 (2603:10b6:170:10a::16) by PH0PR11MB4776.namprd11.prod.outlook.com
 (2603:10b6:510:30::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Wed, 4 Nov
 2026 20:01:31 +0000
Received: from AT6PR11MB072844.namprd11.prod.outlook.com
 ([fe80::520a:561:ace1:e64b]) by AT6PR11MB072844.namprd11.prod.outlook.com
 ([fe80::520a:561:ace1:e64b%6]) with mapi id 15.21.0592.009; Wed, 4 Nov 2026
 20:01:31 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "brgl@kernel.org" <brgl@kernel.org>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "andriy.shevchenko@linux.intel.com"
 <andriy.shevchenko@linux.intel.com>, "Kumar G, Naresh"
 <naresh.kumar.g@intel.com>, "Vivekanandan, Balasubramani"
 <balasubramani.vivekanandan@intel.com>, "heikki.krogerus@linux.intel.com"
 <heikki.krogerus@linux.intel.com>, "dakr@kernel.org" <dakr@kernel.org>,
 "bartosz.golaszewski@oss.qualcomm.com" <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH] drm/xe/i2c: Fix use-after-free on driver unload
Thread-Topic: [PATCH] drm/xe/i2c: Fix use-after-free on driver unload
Thread-Index: AQHdWAv2C1K8lB/uD0uf3ba2q+QLVLb5znsAgAAZS4CAFepAgIAAaF4AgASkLgCACEuPAIAAjOeAgADHcAA=
Date: Wed, 4 Nov 2026 20:01:31 +0000
Message-ID: <eac803a47fcc89ba9c76a21c589ba06660b0d547.camel@intel.com>
References: <20261009164241.923756-2-balasubramani.vivekanandan@intel.com>
 <7939f69c-bc63-4465-a578-8024e20c4eb8@intel.com>
 <aszdvyOY5zkyFTU1@bvivekan-mobl1> <at8_996Aarbq0_TO@black.igk.intel.com>
 <at-XhFGST5C3lFTu@ashevche-desk.local>
 <q2caxyahv532pazvrfgzartdn6433hkkz35ofwhfuizdzbd5ch@rkvjmv63kdce>
 <80e999b49fb3489a891742dc4267be740b0035c6.camel@intel.com>
 <vr6opngpmfg75pngzrkb7xnllrjnpjq5dlliishq3tm3wdm4n7@kwlo3kdvjquf>
In-Reply-To: <vr6opngpmfg75pngzrkb7xnllrjnpjq5dlliishq3tm3wdm4n7@kwlo3kdvjquf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AT6PR11MB072844:EE_|PH0PR11MB4776:EE_
x-ms-office365-filtering-correlation-id: 80b7a057-ce8a-41ce-8c6d-08df3aae6bc2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|10067099003|18002099003|22082099003|38070700021|261022075727099003|4143699003|261022105027099003|56012099006|11063799006|261028144727099003|261026140227099003|261009223027099003;
x-microsoft-antispam-message-info: au9BuIYg3BDijIrk5cezaewNVVmasQwABVoaD6ita9GSDdkE0aiLAS3QDyrfKR3J+ldladDKTwC8YPFH6KzbqJyi+FZ2QuEL+mspXMX+iq6vI7bMFtxsow73EpSpp1iRU/nRiaIY2kj4JZMfzU0y/DKyPk34PjPm6ORBrWdgTtoy+5oVcC3rzfo3DsqF4yaEFlHNdwt2w9qki82yW1VpTU5EuuC4T4IBQtNMsxIthlK4gOKd56RBAH4K5s1IzJn9MAQJYZZ0VLKToBIQgC+64oyIqQziVjHuUGRr3S8EINCkU8IvbHryq4JU17f/sgIieVgWlpzP21qeH1LAibP/YY4cFrijy5SM9cQh93lAknqakolXcDnW1uAYt3iN3ftUbVE6WB3XrFbfgVfjWXdGawOFQqtRPaQLYQ5znu+7n+3ED0H2V6Dua/juc9/kg4aII1kLUUFw0fCCU78xfYm9B7y5sHjF/oF19EUUqSIARQHjUb+Wv3wiWUy96TN+pjiW9cKK1c9oYp3JkR/yuXIQIb8hcK+jVWLEx1UCU/tirt5f1rfwgsXJjKIxzGuaO4zlWkHxugW8tTMyhGL+QCZgkzANFxCQUqv3u0zKxgoW3xyCOgMFnr4L0oWjSf1MuAk4iBAD1+8lLHHyMYaB0GGMBqQWZrd7qmwwR/vYCdwYosomseT9qKmQCNe2F3W96o9t
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AT6PR11MB072844.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(10067099003)(18002099003)(22082099003)(38070700021)(261022075727099003)(4143699003)(261022105027099003)(56012099006)(11063799006)(261028144727099003)(261026140227099003)(261009223027099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZG9ZOWFrYWVpSUxsTmEyQ2pDeHRFSzlVdGVTSnBNWlRGak5PbzB1Y0E3Y2xw?=
 =?utf-8?B?VTUxMEpuRCtCb1N5K1pZRFRDTnEzQVF1QlE1dmRwZGg4eGVVSzdSMWdOSWNX?=
 =?utf-8?B?aEZZVjJuKzVZM1l1SzczSjRJa0JBckV2dmVpa0pXOGhCTVExU3hHT2haaER6?=
 =?utf-8?B?S09GNEo2TFdVd0tjU2E0QTUzVFNyaUNLTlIzaEhkRVFvWUhkNStMWDIrYlJm?=
 =?utf-8?B?T0pHaEtUTVVlWEEybEhiNTBrbDdESjRMR3MyUDAwc2JnUkplc0c0MllNcWRo?=
 =?utf-8?B?QkRXYitKMGlJV05UeTBRZHBtTElJTGs5dGdubmZvNG5FTTU4Q0tyaDJJb21z?=
 =?utf-8?B?eGsvMSt1NHZtRGxTMjZjK1ZLOWQwTTFCMXR3STQ1QjBVSndmUnFKcjhBb1gx?=
 =?utf-8?B?YzdWamNwbXBDblo4UThFWWJ2WVdjdm5ZY3d3dXY1VEN0TmtRaWtBejRZQ29J?=
 =?utf-8?B?MDd3emJjUWRnTlFLWDh1ZlRGaTJkTVkxMDZvUU16ZW9TckpBUGx3dFBuanRH?=
 =?utf-8?B?WkVUUE1yaHdVeHZRTXh2UnJmV1pTMHlhRDlyZ1Rsb3pYbFJES0MyOU9GdGc3?=
 =?utf-8?B?U2tMMktzSytaV0NpbGtvUGhiLzlsc2Rxb2FtRjAraHgzMXhOV0JTTHpFZWtq?=
 =?utf-8?B?ZTBDZkx0c3NZd0lTNHQ2UUFnUVZ3YVhZZlRCenBpOGphSUtPTTlPaWZ1dy9i?=
 =?utf-8?B?WFlDdWVYL2tBQWZNaUEvMlI5VmJrSGs4RzJiVmJlZW5VS09WdlN5clJ1YzZK?=
 =?utf-8?B?RjVWbnB3NjBGSFRqV1RBaml6djQ2REx5TS84WE5uWm9JNkhyUUpCUFU2M2Z0?=
 =?utf-8?B?Q3V2MEtWTjFSS1B2dzV0ZU9Cc2RjQy91a1V4bkYxdXNLRTZRQ0NyT0pIU0wx?=
 =?utf-8?B?eDZWUklWSXFlNTdHb3hSaWJnTmEyMWx5aGNUSy9GMzZFZFhNQlpta1dzSUN2?=
 =?utf-8?B?ZzVIN09oc1FyWE1HbE0wdGNDVzFWRUNac3JaLzEyZ0NZUWRLSVkxL3EwNE9i?=
 =?utf-8?B?cVA2cEZJWXFDZ1VyS0lVQk1VTUV6RGZsOUlpYUhVcnNFWDZyRGxtMlVISHFl?=
 =?utf-8?B?cTR2RW9YWElNQms0YVIvcGROQllQd0s5YTJHQm9GQWpJcWNHMmw5ajZvNmVm?=
 =?utf-8?B?MVhhbDJ4RFR2Um1JbFJGQzd0Vnd5bE5wNk5iWDBZWFRzWjliSUtTOFN1Mksv?=
 =?utf-8?B?a1VEWjMrWjljL1pKL2pBbXJBN0s2bS9yZ0hLUW1CUGZjdVFDUmozSXphdDla?=
 =?utf-8?B?bmw4MmJRalJjMUFKMWhCUmdaWWJMMFhkd1V4NnY0b0Nqem1acVFCVFIxa2pu?=
 =?utf-8?B?WmZjTXZnM0hPVHJHeWIwbTBZRFhuRTFIdFh5Z1hneGZyR09YMG9yYk1FQ0gr?=
 =?utf-8?B?ekFweFo3SzgxamxHQnQxTzlXVyt2ckQ2V2pibngrWFVtS0VRS3dqL3dBVWVy?=
 =?utf-8?B?UU45SnZ1OGw3VjRGV0ZTUE5JVmNQZERiV0NWY0ZSZjdMZVYwK3M2K3A0R0Fx?=
 =?utf-8?B?bzNRY3pERUZXTDdsTm9id0xLM1FDYVhXbU1KcWFkd2RhRE05YzNrR2gyQXda?=
 =?utf-8?B?VVVVY2dRSXhlWGIvZWh5eSt3M2NLUW9zU1kwV2ZjZGZwWmZ1NVJHREhjckM4?=
 =?utf-8?B?NUdqaytBTkMyVzl2YXVYQkY5ZW5hY1R0MDJYVXpRVVJmZ1dXY1luWnJyRERS?=
 =?utf-8?B?dnNGRmJEdUxSTmN6NUVVTXkvRlZyL1RuL1NPL2NnL3FKVm4zOUxXTnVtc0Mz?=
 =?utf-8?B?SHlZL1NvZnVQSVNCb2l0L0RBbms4cWtMaXZYL05HUDFMNnBrYVR3OS8xL0Qx?=
 =?utf-8?B?S2JFVUpDaC9jVm90b0Y0RVV2clNCdjdWTitUM1Nvd0VEekFDQ3NDaHI5MXRT?=
 =?utf-8?B?RDZYbGVWVVBZcW11UDZIajZkVVdTL3g4cktLMVJrc1M5dlBKQTFVQ01DeXps?=
 =?utf-8?B?bGV0bFFHTEFNQ2d5WU5uc1RmMnk5QnJIRzNYMGZVc0tJZWt6eFFsT1l1SDRM?=
 =?utf-8?B?QWVmQUdWRTduRWh1eVRCUURKbVpUdnVlMXFtSkcyaHZtQy8wMFI4REIyY3pE?=
 =?utf-8?B?SmlDQUpjdG9BTVkzZUFkQ0F3STMwd2hadXBrcUNjRGFrY21VYU0yMkxsSjZY?=
 =?utf-8?B?bEZiTmpBUnpTMnQ2ZnRsdmg5YzE3YW9sREVHa2tnS3VzM1NERTZGRHlFSjI1?=
 =?utf-8?B?eUNBSitMVjN2WllFMDI0Vk1CWVJhUlJMMG1qbTc0VXJ1bURSOGUwMFRVU1JM?=
 =?utf-8?B?MW1GSkswYVQybXZBYWNNTlRxUXN2LzFuZkNwdzYrL0hpUWNOajI2Y0o4aGtD?=
 =?utf-8?B?cEI3eVJGQ1o5clp3OVYyWE96SkF3bXMxOWdvUDVNUkRIZjc1R2JyT0lXTDBm?=
 =?utf-8?Q?I6BZV35K4knx3am4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A997B465021B904A8895DE6B0DFD776C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: e2bSdSeuZNqClI1KCZZGdUBoLmPSPgVggFk4bRc+eq8lssVBo8oNtnRH31ePy6G/w8AZFi++J79sheP/fbR8OpXx4azgs7bLtiSuX6Yw/Xgo8wgoq5aKmPLHOCJO6nhxLWXBJ2IYMZk7cABbT8bZ/KxniVFIexDFNCJc0MHjburHyz/hYkSk0hYG4sfisEMzVxV8Ra6mjogsOK3NbrlgtZZnM17zpadEpRWgFvU30IM6gAOaE6sEiTqnO0qilj4GUjucEvTs41SSVb/NH/HumPNergTqKThtyWxgLsYkor2mUNtwYTaz7n+fAneI/RYKDUppmtqDut1X7yTrIi0/cA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AT6PR11MB072844.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80b7a057-ce8a-41ce-8c6d-08df3aae6bc2
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2026 20:01:31.6085 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uWiGdsAtNES/vD01PxHI/7oB8XSRVPOp4aMB2TO557h2MTWCOtvQUm5DoI7HQtXnvVdyhm8UsjCbwTF60VO3ekM7vwcl/6v+6fn7alhojcM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4776
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gV2VkLCAyMDI2LTExLTA0IGF0IDA5OjA3ICswMTAwLCBCYXJ0b3N6IEdvbGFzemV3c2tpIHdy
b3RlOg0KPiBPbiBUdWUsIE5vdiAwMywgMjAyNiBhdCAxMTo0MzoyM1BNICswMDAwLCBTdW1tZXJz
LCBTdHVhcnQgd3JvdGU6DQo+ID4gT24gVGh1LCAyMDI2LTEwLTI5IGF0IDE4OjAyICswMTAwLCBC
YXJ0b3N6IEdvbGFzemV3c2tpIHdyb3RlOg0KPiA+ID4gT24gTW9uLCBPY3QgMjYsIDIwMjYgYXQg
MDg6MTA6MTJQTSArMDIwMCwgQW5keSBTaGV2Y2hlbmtvIHdyb3RlOg0KPiA+ID4gPiA+IA0KPiA+
ID4gPiA+IFRoZSBiZWxvdyBwYXRjaCBhY3R1YWxseSBsb29rcyBtb3JlIGNvcnJlY3QgdG8gbWUg
Y29tcGFyZWQgdG8NCj4gPiA+ID4gPiB0aGUNCj4gPiA+ID4gPiBzd25vZGUgcGF0Y2ggYWJvdmUu
DQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gQW5keSwgSSdtIHNvcnJ5IHRvIGJvdGhlciB5b3Ugd2l0
aCB0aGlzLCBidXQgY2FuIHlvdSB0YWtlIGENCj4gPiA+ID4gPiBsb29rLg0KPiA+ID4gPiANCj4g
PiA+ID4gQmFydCBpcyBpbiBDYyBhbmQgSSBiZWxpZXZlIGhlIHJlY2VudGx5IHByb3Bvc2VkIHNv
bWUgZml4ZXMNCj4gPiA+ID4gYWdhaW5zdA0KPiA+ID4gPiBkcml2ZXINCj4gPiA+ID4gY29yZSwg
YnV0IEkgY2FuJ3Qgc2F5IG5vdyBob3cgcmVsZXZhbnQgdGhleSBhcmUgKGF0IGxlYXN0IGFsbA0K
PiA+ID4gPiBrZXl3b3JkcyBzb3VuZHMNCj4gPiA+ID4gdmVyeSBzaW1pbGFyKS4NCj4gPiA+ID4g
DQo+ID4gPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyNjEwMjMtc3dub2RlLWRl
di1ub3RpZnktYmFsYW5jZS12Mi0wLTk0OGQ5MjBhNzlmNkBvc3MucXVhbGNvbW0uY29tLw0KPiA+
ID4gPiANCj4gPiA+ID4gQ2EgeW91IGdpdmUgYSB0cnkgYW5kIHNlZSBpZiBpdCByZXNvbHZlcyB5
b3VyIGlzc3VlPw0KPiA+ID4gPiANCj4gPiA+IMKgDQo+ID4gPiBIaSENCj4gPiA+IA0KPiA+ID4g
U29ycnksIEkgbWlzc2VkIHRoaXMgdGhyZWFkIGJlZm9yZS4gVGhpcyBzZXJpZXMgZml4ZXMgYSBk
aWZmZW50DQo+ID4gPiBpc3N1ZS4NCj4gPiA+IEknbGwgdGFrZSBhIGxvb2sgYXQgdGhpcyBvbmUg
YnV0IGl0J2xsIHByb2JhYmx5IGJlIGEgZGlmZmVyZW50DQo+ID4gPiBmaXguDQo+ID4gPiANCj4g
PiA+IE9uIHRoYXQgbm90ZTogaXMgdGhlIHN3bm9kZSBiYWxhbmNpbmcgc2VyaWVzIGdvb2QgdG8g
Z28/IEkNCj4gPiA+IGhhdmVuJ3QNCj4gPiA+IHJlY2VpdmVkIGFueSByZXZpZXdzLg0KPiA+ID4g
DQo+ID4gPiBCYXJ0DQo+ID4gDQo+ID4gSSB3YXMgc2VlaW5nIHRoaXMgb24gbXkgc2lkZSB0b28g
b24geGUgZHJpdmVyIHVuYmluZCBhbmQgcHV0IGENCj4gPiBxdWljaw0KPiA+IHVuaXQgdGVzdCB0
b2dldGhlciB3aXRoIENsYXVkZSBpbiB0aGF0IHJlcHJvZHVjZXMgaWYgdGhhdCdzDQo+ID4gaW50
ZXJlc3RpbmcuLi4NCj4gPiANCj4gDQo+IFdoZW4gdGhlIGZpeCBnb2VzIGluLCBwbGVhc2UgY29u
c2lkZXIgc3VibWl0dGluZyB0aGlzIHRlc3QgaW4gYW4NCj4gYWN0dWFsDQo+IHBhdGNoIHRvby4N
Cg0KVGhhbmtzIGFuZCB5ZXMgdGhhdCB3YXMgbXkgcGxhbi4gSnVzdCB0aG91Z2h0IEknZCBjaGlt
ZSBpbiBoZXJlIHNpbmNlDQp0aGlzIHNlZW1zIHRvIGhhdmUgcG9wcGVkIHVwIGluIGEgZmV3IHBs
YWNlcy4NCg0KVGhhbmtzLA0KU3R1YXJ0DQoNCj4gDQo+IEJhcnQNCg0K
