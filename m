Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830CA606A31C
	for <intel-xe@archiver.kernel.org>; Tue, 17 Nov 2026 08:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JWPovrKc;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=gCQV1PQS
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4321410EF3B;
	Tue, 17 Nov 2026 08:16:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2FA310EF3B;
 Tue, 17 Nov 2026 08:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794903352; x=1826439352;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5+TAQfOCu8/g0+QIjdoxH+pLmgD+Pu+TroY+22bGyq0=;
 b=JWPovrKcAElCJApoPu9/QPJ3bLny2hRT4BKbdeXeEY/KZyF+9LUz8Feq
 JU0+u6Qy+TnCBDMKUBaZ7kJX1RSMAXbQA0d3kTl53sYvSwl3YxbFQ3uOj
 mjSMcrSyO/It80LpKFFCV3zWztiTJOhChjpwt6G1Rsh6hmE9i9R6OQ6iZ
 jy/VEt6vnvubDcuO1fJmkW6l0XxSOr/ykPRj7qzPzBuzsmSCwqz/QW1vD
 yCP2HkRl75a4YxJk1E4BykPHCLHTw4qP/gpd74ieGzBEQ+4sG/LEjokt2
 w/EtmLfBvAKetbFEOjuWZ4UrLDEtRb95eY8+QWAv/9NUefa8/7KT5q/+U g==;
X-CSE-ConnectionGUID: YB0PegbJRuiR3ANDGYoZRQ==
X-CSE-MsgGUID: kGyN2sdZQDaPaj+hD1ER4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3545978"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3545978"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 00:15:51 -0800
X-CSE-ConnectionGUID: SDFhcumVQJSuXE5A3dr8EA==
X-CSE-MsgGUID: 0ma3FQYjT82wCJl31/l5Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9671775"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 00:15:52 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 00:15:51 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 17 Nov 2026 00:15:51 -0800
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.3) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 00:15:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RsIT6Yu/XYSbptc2g6EXnaNvBvMcQ00nKE5QPnVcs+wGFAKOT00hKNB8nqZ18bNV90rhjh1blU30tcbVW8ot/VPw5HkNJWCIkKEUCt2jE63U9HhqDof2Ufq+/kIfIQOU7DvhQ38jdXdNyNb1niTyrdnw7x/RKneWHaPZNvkbw0nLMhR7Y2HMpKt7+fQWmsImcLTPCIKiQMFGZ6kAKKEdCSUY9boo111bnEZJZCNTyRWjfnWiUoW0oJx77ot1tomjzYjG/dL66ql1vQRHLRlcckqZf37CHQx6JftTqe0S5Xp+svvRyTiFb5cokPceXouDJ73OCZPP7m3bTnNF1/rHqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5+TAQfOCu8/g0+QIjdoxH+pLmgD+Pu+TroY+22bGyq0=;
 b=gb5qQjXw/QOebwl5MrrwrlDnPdJYp5RCmMwpr2mjcIhouhCQgr/069mQd0wlaqRgiWWhJZThHqiH/AKz9e1C7eQkmHSQNEmegZBziZIMHLETH0SX7Iwvrlds2tgqIV4px77NKvFoSxfug4tWwB3udSZwdktnHiKgiBpPKooalVvzn7nN3iu0CbZxzshs6U2fBb+MvpYfcMNJT20RlW14yneMwaiNLX7h++eRPNy5QY6r4uSr5W9urzoUPNNw4tooRz4+GPxv50zalxS6RrIZZo9jPJMpMuhe+dvEndVMnUsf9NU3cRv3PjYl4dnkO4DCZphPqbQo4WhBzOO2b4O7LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5+TAQfOCu8/g0+QIjdoxH+pLmgD+Pu+TroY+22bGyq0=;
 b=gCQV1PQSiIQJcwUGRuMGd1KdPTuKgrG7XFIyrVcpzYGhNvOboPJT0IdvKH++5GtYzu4rdsjS36TSqz7Xy99Rl4owNir+KlSEHy95doMx+GER+xEWv+GoePwT99OutBIq7oIhwjqXaQ6XQj2QmfHASRb7fS1a7P29bpaH7rapigU=
Received: from MW4PR11MB6570.namprd11.prod.outlook.com (2603:10b6:303:1e3::6)
 by MN2PR11MB4679.namprd11.prod.outlook.com (2603:10b6:208:26b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Tue, 17 Nov
 2026 08:15:48 +0000
Received: from MW4PR11MB6570.namprd11.prod.outlook.com
 ([fe80::63e8:6dc8:402b:36d1]) by MW4PR11MB6570.namprd11.prod.outlook.com
 ([fe80::63e8:6dc8:402b:36d1%6]) with mapi id 15.21.0615.009; Tue, 17 Nov 2026
 08:15:43 +0000
From: "Kahola, Mika" <mika.kahola@intel.com>
To: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>, "Syrjala, Ville"
 <ville.syrjala@intel.com>, "Heikkila, Juha-pekka"
 <juha-pekka.heikkila@intel.com>
Subject: RE: [PATCH v4 1/2] drm/i915/fbc: update the supported FP16 formats
Thread-Topic: [PATCH v4 1/2] drm/i915/fbc: update the supported FP16 formats
Thread-Index: AQHdcP9Fp5TFqrqMrUCP7k4Jazo3ibcx9ZkA
Date: Tue, 17 Nov 2026 08:15:43 +0000
Message-ID: <MW4PR11MB657039CF21D4D20CD0EAF4DDEF7B2@MW4PR11MB6570.namprd11.prod.outlook.com>
References: <20261110103513.176529-1-vinod.govindapillai@intel.com>
In-Reply-To: <20261110103513.176529-1-vinod.govindapillai@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB6570:EE_|MN2PR11MB4679:EE_
x-ms-office365-filtering-correlation-id: 48f158d7-1045-43ef-03e7-08df4482f9b3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|10070799003|1800799024|366016|23010399003|38070700021|10067099003|56012099006|11063799006|261028144727099003|261022105027099003|261021123027099003|261022075727099003|261021121427099003|261026140227099003|261102123227099003|261009223027099003|22082099003|18002099003;
x-microsoft-antispam-message-info: WXtE+h+a3BdtEu26BB7InoEm6ZKY5k+BKcK7EM0dRrIE84GBDrLGSWAuRawnbiFp+LeNNUOFcSOSX8wO3qdq9IZJGOlsOw5uifectdh55aJJ55sLKYmSF6lWoFgo+A5n7yA5lUdEgAUfqDJq3mUq+RXO2qfyKM80VsjITE2vIvEvU1x+dex97lTDervWJyh4QxCFIELnJMx4+6sTkcnatRz9tA9XsVQ1M63UhtSXlyaw2qmkgc0khV+7JgWX9S+AJusnub1Zps/FOuBtDhFmlI0tHZ6ZNdNokGegTljIsxDJG8ZY8RQZwBLyM6RNT69a5hAhmX7pQvJXRWVo4Gf6maVwppNRaD889AVYt9LjneGGooolqvZ/GmijZvxuahnMHvajCUTBiVpCCkVoa3SujvViZ88sYwYBWgYcuBMWt5ONv7IrqRgJiesTfyh0GvmSfkSGDB1Fhv0sIStHrZMcGR/qpA6z/UAZLDAI3YZh0TXFvB1wgbr1/UMmrqDwgB7DPHHzUhvDSChUjM5Px7U/1TtysWko+4PWKehbQzaesaGDFNsYj5F+O+ZyXHCGpUE9qNoUbToyqj1bPaxdbIh1nx5PBUylmCgOfYj/Qmh3ss3P01gozm1jp1CBbyR/Ah8lZafYqpcaOu2vVD5GA1pf+qEwVt5t2Mn/o9Zo4GOL7NZ/Tz1EcYo4dJZ/M6TTAyOeJNq0Up+OUk3bCjvd3Y9tALEiPblGgX5AxMVoPWy+6+k=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6570.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(1800799024)(366016)(23010399003)(38070700021)(10067099003)(56012099006)(11063799006)(261028144727099003)(261022105027099003)(261021123027099003)(261022075727099003)(261021121427099003)(261026140227099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NVk1TVRZNThsWlIyZkNWeWFmQzVOUERSc01VZG1XRmdwRzNYdG02VWdmWFVF?=
 =?utf-8?B?eFpqMjlham5FWEU3aTI4TjlJN2lsSWNFTkNrcEpGOTJOS2xmU3JsSDV6cVRD?=
 =?utf-8?B?NDFjbXM3aWdGZFV5UEpoUFFtSVRBdHVvVXcycy9GWEo5VFUyMmlkU1c5ZjdC?=
 =?utf-8?B?bHJSYUlYVjY5Tno5ekZ5MjhPT1VGcU5xcC8rVElqRzBldjlFRkdsaWNVbmNN?=
 =?utf-8?B?OW9rOVNZenJuTVd3OTVVbHowdlRZVm95Rm84MjFsNmZYMldHeXJySER1OWpD?=
 =?utf-8?B?TlJ3R2psL1lJcTBmWWVvbjl5ZzZnQ1hsUFg5bVdaTEsvS1A5c0cwZkxHY2d6?=
 =?utf-8?B?WElLTkNBYXY0QTVFWFRZcnhTamhTT2pYS0QyODNueGhJOGJuUnhhSXZyMHZW?=
 =?utf-8?B?bC9DeDliaU5ncjBsUWpqUDZUWG9nRmpPUWxPRThrWUtoQ3hQd09YQkRZMWc1?=
 =?utf-8?B?U2xnZ3NxKzlHUlBwZDBEMk83alRGZk9hQ2l5dnZNc2pGTnA0YkNRY0NZSE1Y?=
 =?utf-8?B?NENLQmdhRW9nWVRxeGhiM0t3NGlKcm5IbHJsS0hpb0hhSXBlY2FHZDFuSjIw?=
 =?utf-8?B?U1lZWWloMmVqREdCVVlQNXNCSmZkY3NBTUx0d3lCSUpFWU5PSjN1SEpnSzh1?=
 =?utf-8?B?Z3M3Y3pxN0Z1TE4zbzVaVFd0bDBYUnlqbm9XNVNMWGE1elNwMzVrUWoxY3Vo?=
 =?utf-8?B?MGhiSTVjVnNKeG4vZFN4VFlmNjh0RE1GdTFlRVhRVURQdDJmSnU0Y2JFams3?=
 =?utf-8?B?ODdZME9zZGlOTC9IY2JmZnFuaVprWXNzdnJ1azBMc2RTdUlqei9zelFudmFU?=
 =?utf-8?B?N1A1QnVxVUNMZTgzSlF2R2pyaGFxM1c2VHViV2VBVVUyTXJhOXovTmtJVmhN?=
 =?utf-8?B?ZkZnMDBOOFlMQ0N2YWFlTk8xYk5tN0d0d3V5eFMwcWNuS2dhOERmSkJlbXhJ?=
 =?utf-8?B?MHBIa1F5L0pFUVNFU29RRXZZRnlEVit6VVZOZUVBSmVpVlBXcVQrekwwS3l4?=
 =?utf-8?B?b3dIZmtCQkxuL2E0VmVobzMrdE0xeXN0RFBwRmViL253V3BRSTI0dHV6Uzdi?=
 =?utf-8?B?eUM0TmZQbEpTMmVjMTBZbUNiWUVTWENDN0F6Z1ljS0N6YXk0T25VWXpWNGpk?=
 =?utf-8?B?aTdCUkVoaDRkbGdvVkU3NzZqNEV4VTlKMlBMTklOb1hicnA3eXhpR0JEc0V4?=
 =?utf-8?B?aFVPcFcvNktNSTB0VTRSaEFpYWRUeHp2T2NvQ0hINjNqdldSN2JlTUN1eVZl?=
 =?utf-8?B?czZhZERIc3V1RExKTU5EUEpBYUdMcEZpa1oyRnZhSGdlQkVGeEZSVFFDNHE5?=
 =?utf-8?B?c1ZvVHlJTWhKUjBkMFVmVkZYMndlcnNSOUlvSWN3TUlIVkMyQ0czQ3A5WDZ5?=
 =?utf-8?B?NVlXOFVYTGI4Sm5Qc1dsM2c2U2h3cTdBNGNIa1M3akplZXA5YU1KbVNXTFo0?=
 =?utf-8?B?UCswNmFBQ3VJeUVPOFQ0ZHAvMnVaTDNHcnhFb3JaSnlZVjFrcnA5bVBMU25x?=
 =?utf-8?B?dk9RUk40c0xvNTArN0huL2c3WDdLd2x2NjBud2QzOU9Sck11dUpoVi9BcDk0?=
 =?utf-8?B?UGx1d1hnOWx6N1AzYUVwUDBMdU1oeVJPZEM1SXN5bVNCUVRCL0puTHg4YkFt?=
 =?utf-8?B?RUJ5OVVnUkxTdUFsak9KWWJYQlUrc2kraFdiVlNHaVRDdnUwS1pNN0F0bHhQ?=
 =?utf-8?B?eTQ4amNXZ0luL2JZSU5nVzRPZEhYQ3NhdWZ4ZFllcXdDa2cydTJXbUpFNUsr?=
 =?utf-8?B?ZnVNaGJpQWlmT29mTDdxdXZud1VYQ1FhdDc0VlBBM3JnbS9Qc0tQQlBETEt6?=
 =?utf-8?B?WmdWcnRvWU1Oc1QwVHZUMGYxSkdOR2RhNko1SW9xYXV6cUFFVmI1N2RHVlZJ?=
 =?utf-8?B?eXR5WVRMZ2RBUTlneGd3Z3cyZlJlMTZrK040Z0Y2dk5GZG1MdzdCbUpDRlFx?=
 =?utf-8?B?R2FNcTZqK3B2MXhlSTlPWEVHRlNWNE1OUzYwMEQxTTBkbmExdFFGRkxwdHNk?=
 =?utf-8?B?aHZDR1FCRzJRMlhrNTJvWi8wSHZDaUM5eVJnejh5QmtZTERndEwzb2Vtbm5B?=
 =?utf-8?B?NVU5N2NZaGZaSGlELzI2RFlpOEVUODVoQStVaHBHZmo3azJCODRtUlk1cU4r?=
 =?utf-8?B?cHRFb2dzUHlYTWZMczBSRll1OVdTanJZY1pjMjJlWUhDSXVHVzg4MXl0dU1t?=
 =?utf-8?B?Y21zS0ZRSDlWSzJqYm1rNmZmSjNVVzdTNThHd0RwMjVmSHZONWlmYjJRaDFX?=
 =?utf-8?B?UmtZVVRWTW1ySG4wUnhnRGhEcGtpbWN1VWtVS2Q5ME9JS3NzWlk5My94d1k5?=
 =?utf-8?B?NDJXcmV4aTN4ckNMSzB2S3E1OXpJbnhZMnMra2d0WmdJdW04RllrRlR3ZnVl?=
 =?utf-8?Q?qrDdtypA2Gh1b/gpSZXPVRr78JfB3717l7kJf?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: B3grV4ziJpjwMqtpqjCK+hUJCYj3vT2EoNv12uiXQl4pbo5mHFjuQgg9NgZFEdUZqsKE79FkCFb1eVu+w3kaXiaps84o2dDstKf/6jSC9jVSHBpY+NeIkBAsySZDyKKv06ez65FRxrIcdKuZBtFz9PAOYnX06zWoOWtTATr/NOx96Azex6GWUVogjBHvjkn9dBDbfz8tU6h/AM40/AVKHN99kAyL7icvrkSVG4kBb1zE1l6NRXn6b9DYDJ/TzYM3eg3UQnODG2gu+/p+avG3Pdp95YqaLXmPvS84GHThW1MLvaOwl+nB5CF+LMrjNjrWAW6PY07oB/rHH8Sl29bA4w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6570.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48f158d7-1045-43ef-03e7-08df4482f9b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2026 08:15:43.5165 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3u8N0dqosmBGHJZrIt4erTSyl3XERnnUspJQ/x8o0onVOk+Nej9G6QaFZ4YaJuLwfZHmbWnLuSNlxfAZ0LjIsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4679
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBJbnRlbC14ZSA8aW50ZWwteGUt
Ym91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBWaW5vZCBHb3ZpbmRh
cGlsbGFpDQo+IFNlbnQ6IFR1ZXNkYXksIDEwIE5vdmVtYmVyIDIwMjYgMTIuMzUNCj4gVG86IGlu
dGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgaW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZw0KPiBDYzogR292aW5kYXBpbGxhaSwgVmlub2QgPHZpbm9kLmdvdmluZGFwaWxsYWlAaW50
ZWwuY29tPjsgU3lyamFsYSwgVmlsbGUgPHZpbGxlLnN5cmphbGFAaW50ZWwuY29tPjsgSGVpa2tp
bGEsIEp1aGEtcGVra2EgPGp1aGEtDQo+IHBla2thLmhlaWtraWxhQGludGVsLmNvbT4NCj4gU3Vi
amVjdDogW1BBVENIIHY0IDEvMl0gZHJtL2k5MTUvZmJjOiB1cGRhdGUgdGhlIHN1cHBvcnRlZCBG
UDE2IGZvcm1hdHMNCj4gDQo+IEZCQyBpcyBzdXBwb3J0ZWQgd2l0aCBGUDE2IGZvcm1hdHMgd2l0
aCBvciB3aXRob3V0IGFscGhhLiBVcGRhdGUNCj4gdGhlIHBsYXRmb3JtIHNwZWNpZmljIGZvcm1h
dCBjaGVjayBmdW5jdGlvbiB0byBsaXN0IGFsbCB0aGUNCj4gc3VwcG9ydGVkIGZvcm1hdHMgYXMg
aXQgaXMuIEFsc28gYWRkIGEgc2VwYXJhdGUgZnVuY3Rpb24gdG8gY2hlY2sNCj4gaWYgdGhlIGZv
cm1hdCBpcyBmbG9hdCBiZWNhdXNlIHRoZSBwaXhlbCBub3JtYWxpemVyIGJsb2NrIG11c3QgYmUN
Cj4gYWN0aXZlIHRvIGhhdmUgRkJDIGVuYWJsZWQgZm9yIEZQMTYgZm9ybWF0cy4NCj4gDQo+IHYy
OiBsaXN0IHRoZSBzdXBwb3J0ZWQgZm9ybWF0cyBwZXIgcGxhdGZvcm0gYXMgaXQgaXMgYW5kIGlu
dHJvZHVjZQ0KPiAgICAgZm9ybWF0X2lzX2Zsb2F0KCkgKFZpbGxlKQ0KPiANCj4gdjM6IHVwZGF0
ZSBpbnRlbF9mYmNfbmVlZF9waXhlbF9ub3JtYWxpemVyKCkNCj4gDQo+IEJzcGVjOiA2ODkwNA0K
DQpSZXZpZXdlZC1ieTogTWlrYSBLYWhvbGEgPG1pa2Eua2Fob2xhQGludGVsLmNvbT4NCg0KPiBT
aWduZWQtb2ZmLWJ5OiBWaW5vZCBHb3ZpbmRhcGlsbGFpIDx2aW5vZC5nb3ZpbmRhcGlsbGFpQGlu
dGVsLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Zi
Yy5jIHwgNDQgKysrKysrKysrKysrKystLS0tLS0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMjYg
aW5zZXJ0aW9ucygrKSwgMTggZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9mYmMuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2Rpc3BsYXkvaW50ZWxfZmJjLmMNCj4gaW5kZXggNTY5NGQyMDc3M2Y4Li4yZTQzN2I5Njk0NTEg
MTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZmJjLmMN
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9mYmMuYw0KPiBAQCAt
MTE4MCwxNCArMTE4MCwxNSBAQCBzdGF0aWMgYm9vbCBsbmxfZmJjX3BpeGVsX2Zvcm1hdF9pc192
YWxpZChjb25zdCBzdHJ1Y3QgaW50ZWxfcGxhbmVfc3RhdGUgKnBsYW5lXw0KPiAgCX0NCj4gIH0N
Cj4gDQo+IC1zdGF0aWMgYm9vbA0KPiAteGUzcF9scGRfZmJjX2ZwMTZfZm9ybWF0X2lzX3ZhbGlk
KGNvbnN0IHN0cnVjdCBpbnRlbF9wbGFuZV9zdGF0ZSAqcGxhbmVfc3RhdGUpDQo+ICtzdGF0aWMg
Ym9vbCBmb3JtYXRfaXNfZmxvYXQoY29uc3Qgc3RydWN0IGludGVsX3BsYW5lX3N0YXRlICpwbGFu
ZV9zdGF0ZSkNCj4gIHsNCj4gIAljb25zdCBzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICpmYiA9IHBs
YW5lX3N0YXRlLT5ody5mYjsNCj4gDQo+ICAJc3dpdGNoIChmYi0+Zm9ybWF0LT5mb3JtYXQpIHsN
Cj4gIAljYXNlIERSTV9GT1JNQVRfQVJHQjE2MTYxNjE2RjoNCj4gKwljYXNlIERSTV9GT1JNQVRf
WFJHQjE2MTYxNjE2RjoNCj4gIAljYXNlIERSTV9GT1JNQVRfQUJHUjE2MTYxNjE2RjoNCj4gKwlj
YXNlIERSTV9GT1JNQVRfWEJHUjE2MTYxNjE2RjoNCj4gIAkJcmV0dXJuIHRydWU7DQo+ICAJZGVm
YXVsdDoNCj4gIAkJcmV0dXJuIGZhbHNlOw0KPiBAQCAtMTE5NiwyNCArMTE5NywyMiBAQCB4ZTNw
X2xwZF9mYmNfZnAxNl9mb3JtYXRfaXNfdmFsaWQoY29uc3Qgc3RydWN0IGludGVsX3BsYW5lX3N0
YXRlICpwbGFuZV9zdGF0ZSkNCj4gDQo+ICBzdGF0aWMgYm9vbCB4ZTNwX2xwZF9mYmNfcGl4ZWxf
Zm9ybWF0X2lzX3ZhbGlkKGNvbnN0IHN0cnVjdCBpbnRlbF9wbGFuZV9zdGF0ZSAqcGxhbmVfc3Rh
dGUpDQo+ICB7DQo+IC0JaWYgKGxubF9mYmNfcGl4ZWxfZm9ybWF0X2lzX3ZhbGlkKHBsYW5lX3N0
YXRlKSkNCj4gLQkJcmV0dXJuIHRydWU7DQo+IC0NCj4gLQlpZiAoeGUzcF9scGRfZmJjX2ZwMTZf
Zm9ybWF0X2lzX3ZhbGlkKHBsYW5lX3N0YXRlKSkNCj4gLQkJcmV0dXJuIHRydWU7DQo+IC0NCj4g
LQlyZXR1cm4gZmFsc2U7DQo+IC19DQo+IC0NCj4gLWJvb2wgaW50ZWxfZmJjX25lZWRfcGl4ZWxf
bm9ybWFsaXplcihjb25zdCBzdHJ1Y3QgaW50ZWxfcGxhbmVfc3RhdGUgKnBsYW5lX3N0YXRlKQ0K
PiAtew0KPiAtCXN0cnVjdCBpbnRlbF9kaXNwbGF5ICpkaXNwbGF5ID0gdG9faW50ZWxfZGlzcGxh
eShwbGFuZV9zdGF0ZSk7DQo+ICsJY29uc3Qgc3RydWN0IGRybV9mcmFtZWJ1ZmZlciAqZmIgPSBw
bGFuZV9zdGF0ZS0+aHcuZmI7DQo+IA0KPiAtCWlmIChIQVNfUElYRUxfTk9STUFMSVpFUihkaXNw
bGF5KSAmJg0KPiAtCSAgICB4ZTNwX2xwZF9mYmNfZnAxNl9mb3JtYXRfaXNfdmFsaWQocGxhbmVf
c3RhdGUpKQ0KPiArCXN3aXRjaCAoZmItPmZvcm1hdC0+Zm9ybWF0KSB7DQo+ICsJY2FzZSBEUk1f
Rk9STUFUX1hSR0I4ODg4Og0KPiArCWNhc2UgRFJNX0ZPUk1BVF9YQkdSODg4ODoNCj4gKwljYXNl
IERSTV9GT1JNQVRfQVJHQjg4ODg6DQo+ICsJY2FzZSBEUk1fRk9STUFUX0FCR1I4ODg4Og0KPiAr
CWNhc2UgRFJNX0ZPUk1BVF9SR0I1NjU6DQo+ICsJY2FzZSBEUk1fRk9STUFUX0FSR0IxNjE2MTYx
NkY6DQo+ICsJY2FzZSBEUk1fRk9STUFUX1hSR0IxNjE2MTYxNkY6DQo+ICsJY2FzZSBEUk1fRk9S
TUFUX0FCR1IxNjE2MTYxNkY6DQo+ICsJY2FzZSBEUk1fRk9STUFUX1hCR1IxNjE2MTYxNkY6DQo+
ICAJCXJldHVybiB0cnVlOw0KPiAtDQo+IC0JcmV0dXJuIGZhbHNlOw0KPiArCWRlZmF1bHQ6DQo+
ICsJCXJldHVybiBmYWxzZTsNCj4gKwl9DQo+ICB9DQo+IA0KPiAgc3RhdGljIGJvb2wgcGl4ZWxf
Zm9ybWF0X2lzX3ZhbGlkKGNvbnN0IHN0cnVjdCBpbnRlbF9wbGFuZV9zdGF0ZSAqcGxhbmVfc3Rh
dGUpDQo+IEBAIC0xMjMwLDYgKzEyMjksMTUgQEAgc3RhdGljIGJvb2wgcGl4ZWxfZm9ybWF0X2lz
X3ZhbGlkKGNvbnN0IHN0cnVjdCBpbnRlbF9wbGFuZV9zdGF0ZSAqcGxhbmVfc3RhdGUpDQo+ICAJ
CXJldHVybiBpOHh4X2ZiY19waXhlbF9mb3JtYXRfaXNfdmFsaWQocGxhbmVfc3RhdGUpOw0KPiAg
fQ0KPiANCj4gK2Jvb2wgaW50ZWxfZmJjX25lZWRfcGl4ZWxfbm9ybWFsaXplcihjb25zdCBzdHJ1
Y3QgaW50ZWxfcGxhbmVfc3RhdGUgKnBsYW5lX3N0YXRlKQ0KPiArew0KPiArCXN0cnVjdCBpbnRl
bF9kaXNwbGF5ICpkaXNwbGF5ID0gdG9faW50ZWxfZGlzcGxheShwbGFuZV9zdGF0ZSk7DQo+ICsN
Cj4gKwlyZXR1cm4gSEFTX1BJWEVMX05PUk1BTElaRVIoZGlzcGxheSkgJiYNCj4gKwkgICAgICAg
cGl4ZWxfZm9ybWF0X2lzX3ZhbGlkKHBsYW5lX3N0YXRlKSAmJg0KPiArCSAgICAgICBmb3JtYXRf
aXNfZmxvYXQocGxhbmVfc3RhdGUpOw0KPiArfQ0KPiArDQo+ICBzdGF0aWMgYm9vbCBpOHh4X2Zi
Y19yb3RhdGlvbl9pc192YWxpZChjb25zdCBzdHJ1Y3QgaW50ZWxfcGxhbmVfc3RhdGUgKnBsYW5l
X3N0YXRlKQ0KPiAgew0KPiAgCXJldHVybiBwbGFuZV9zdGF0ZS0+aHcucm90YXRpb24gPT0gRFJN
X01PREVfUk9UQVRFXzA7DQo+IC0tDQo+IDIuNDMuMA0KDQo=
