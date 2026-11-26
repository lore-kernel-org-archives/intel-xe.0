Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75355606A334
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 07:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XIZygjwO;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=VP9RGzec
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26B0210E73D;
	Thu, 26 Nov 2026 07:59:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1B6B10FE7C
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Nov 2026 07:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795679929; x=1827215929;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=9pnx9fb838qij1AZ67EQSvo0laxZZWocNPiYmsF6hvU=;
 b=XIZygjwOWPkfDaViv8bcY7dtWa454vdBq5YlROOTP2NEtb1ahRDVfMHy
 8yIyUv8R4LhcLIji9Kk+5hYYvFJ6whkO0G1XnQvmamJ7al1jsy34DqpFZ
 MVAZ+mfSWQH4ltb6jYgwxxUU/XKOB6GQzYkt6e9vP6ClwlGWaENpr+NTw
 Qx7/jdSXCTzIVZ122iUW7ap0CodLHSmVQZWC397euL6zuq+Py2O+0OwKo
 b4U3jzFJxc1FUcknevXwBYy96tBZUu8M8wrS/Fi/wIs5RutkIm2QUuhNg
 ShARqwWMsBpUvRDa1R2eMGoFioFeA7VMFPOo4d30rfZvE4oCTPAcm51Da w==;
X-CSE-ConnectionGUID: m/gYvuDuToWCqDxVBofi4Q==
X-CSE-MsgGUID: N1e+nwhcTj+o93WVtO6dSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4465573"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4465573"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 23:58:29 -0800
X-CSE-ConnectionGUID: +6VPy77LR4ejwTWKzNR/4g==
X-CSE-MsgGUID: qlOrPULZST6Rq9qBZ7Wb9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="12707774"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 23:58:25 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 23:58:24 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Wed, 25 Nov 2026 23:58:24 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.54) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 23:58:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TneAODZe8WNqVbPk2R7+zyuvqPGdowicK9A1sSiJQNFntBTvJq14k1Gm4Hj7koKe4iMfaA5WdEx+rHzTVGvS/Yz0Hx+tG1GYLyqG0iyz2iKnWhpTW1Ug4m83EtPY9WYnIfD4l2THdIbXQNqQOT0TcBrOaNZuKcRZuUWSQ5EzEkbPQqgMMOV5egKtzEX0B9/n/2HArfLG5T90yhoJlgnr2cYaumZzufLGXk+dm1GSJzFvmf3HFRuHsJ76p8pcb6QrTMJO5WSArNVDYQVY43bwLklkge1sjYQcUc965qXzkpajW6rV3s6o4ICxZEE4e+Ahd+kA2hTtEIQIt8LliNWq0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9pnx9fb838qij1AZ67EQSvo0laxZZWocNPiYmsF6hvU=;
 b=HYggwMwOVDaPzzPJ1g9YbobhByCmaoQBjpiCSrcw4Pdanqf2dqoaJQOz8ZOPZYS+CoNoAbTDYEEndEA1Qz/qLXMHMju4XKTF9KRHveiEHmFxIiVZhJAykfQa6QB+gaGcdgnYKSxWIYM12iKYXHeJEV5zYDnHvw4GnU6mIsCXSpsjZqWJx9Ywlx+Nw6tYlvnanThtXY21LlwqOHALshNystFKggNKMDOYhaYtiLCDdZzmAD0OVNkmQmPGHggqPpAQGK7MppoHb4F+uWqh7uVTPDmKp/Lw0k1RSWr/HVsEr6tfNBTbfyRbo7LC4fZHBrgBluQKGF0Gp4BLHO/+U0G2tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9pnx9fb838qij1AZ67EQSvo0laxZZWocNPiYmsF6hvU=;
 b=VP9RGzec6rN6GIbkpysMts+Zt2uBIEjTEL/TBK+kILHr9oM4iK8n0H3QqLMgXgPP+9xHgziEE3RSCKiT+ZZKBtAfYCkpZNMW88DDA453LTSrR3Zdlk1NVa/DZOzA2P70Ir1Tphl6ZbkwKP4yPHxPoKkOB7zPaEC8AlxqnKqe14s=
Received: from DS4PR11MB131308.namprd11.prod.outlook.com (2603:10b6:8:502::7)
 by DM3PPFC3B7BD011.namprd11.prod.outlook.com (2603:10b6:f:fc00::f49)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 07:58:13 +0000
Received: from DS4PR11MB131308.namprd11.prod.outlook.com
 ([fe80::40c0:7a50:a98c:8920]) by DS4PR11MB131308.namprd11.prod.outlook.com
 ([fe80::40c0:7a50:a98c:8920%6]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 07:58:13 +0000
From: "Tangudu, Tilak Tirumalesh" <tilak.tirumalesh.tangudu@intel.com>
To: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Narvaez,
 Jesus" <jesus.narvaez@intel.com>, "K V P, Satyanarayana"
 <satyanarayana.k.v.p@intel.com>, "Summers, Stuart"
 <stuart.summers@intel.com>, "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "Piorkowski, Piotr" <piotr.piorkowski@intel.com>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>
Subject: RE: [PATCH 2/4] drm/xe: Add MI_SEMAPHORE_WAIT_64 instruction
 definition
Thread-Topic: [PATCH 2/4] drm/xe: Add MI_SEMAPHORE_WAIT_64 instruction
 definition
Thread-Index: AQHdc4gTipSxNVJaGEaU8avaAK5LZrc2n90AgABNoaCABPeV8IACahvwgACj2QCAAR1IgA==
Date: Thu, 26 Nov 2026 07:58:13 +0000
Message-ID: <DS4PR11MB1313084BA1BEED090CF9D5FA79C8422@DS4PR11MB131308.namprd11.prod.outlook.com>
References: <20261113155734.4164230-1-tilak.tirumalesh.tangudu@intel.com>
 <20261113155734.4164230-3-tilak.tirumalesh.tangudu@intel.com>
 <1334be6a-b10d-48ba-acdd-81b54e0cc15b@intel.com>
 <DS4PR11MB131308979BF5529C7AEA338F72C8782@DS4PR11MB131308.namprd11.prod.outlook.com>
 <DS4PR11MB1313087323AD767C4484EC94D8C8452@DS4PR11MB131308.namprd11.prod.outlook.com>
 <DS4PR11MB13130841BCD43C2A80DA7ACB7EC8432@DS4PR11MB131308.namprd11.prod.outlook.com>
 <8049b2d9f1fef222a37dc5efe6f661cf0aeac381.camel@intel.com>
In-Reply-To: <8049b2d9f1fef222a37dc5efe6f661cf0aeac381.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PR11MB131308:EE_|DM3PPFC3B7BD011:EE_
x-ms-office365-filtering-correlation-id: 7338b20c-4615-441a-a689-08df4b9305b4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|4143699003|261009223027099003|22082099003|18002099003|3023799007|921020|260925021911599003|260925021311599003|260925022911599003|10067099003|11063799006|5023799004|56012099006|261102123227099003|261028144727099003|261022113327099003|261022105027099003|261022075727099003|261026121527099003|261026140227099003|261021121427099003|38070700021;
x-microsoft-antispam-message-info: GVDSR8bO2UxKvZ6CnB2ht7Y3xP80sk3sMi38e6WJ32nq5YuRv2PAENA5n+D1D13Ubd2VywuB5IpQHIFeddMmsfmur7Lwlu+c8dnS3dX8lIDOxw6AZYE7H7i983vfB8/f0rWmOXEVRhc0bV1+xKGKeHmH02kXDigPVWWZ0Z3X/n/5p0dMoUnGkV51n0a9GtTm6kznbl/MYO93tBqTGm9N/8MZ2jNDYn8vnQJUpCHjaiCPHXRprKWf5UxRM/lArt9s4MoZmzpkUBGKm6etOq3iUeyAaHlY6K4nthcEKAcV7MOkykQXBsCPXODc+Un3PCVR3Wzzs+md4Lv2SND55fiAzGxCju5QmscEcEcDYw0rrJ+RkXY2WUZjxhSWUw14kEl7ICJbLvYDSMORlxlG3GtBXNqJIlGfBbXzxAwMGeHDtRd8KBa+8Hri7wD8pZnOMbf39pUE+XEoElAlXF2UZIwIxzZ67yk0IW7c6qkBF4H09MkipYVVFFYgsZeAB1xbGWXggsOzGJgLeJw18gjS5a7RXGpvne/nUphc33FC95XjH5nYffKqOoVS5i3zeeBabApD60NybwZJGTcNElN5jn+0lxYKNqh42eWUEv/s8JWISycoMo6qKMbQGDV2TukhAThBb6c+7RRP5PNGK6iCRUT4HUdpa6R9m8VySFUF2wYW9IOt+hStKCCxUB/0tcnuRPUumPF4cGtPh80Wryp6PNElm6EEi6kdUM4S5sROPrIKlOo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PR11MB131308.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(4143699003)(261009223027099003)(22082099003)(18002099003)(3023799007)(921020)(260925021911599003)(260925021311599003)(260925022911599003)(10067099003)(11063799006)(5023799004)(56012099006)(261102123227099003)(261028144727099003)(261022113327099003)(261022105027099003)(261022075727099003)(261026121527099003)(261026140227099003)(261021121427099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eUc0MllJQWlZNzAyZzcrcTB4STVHOW82RGZXT1puR29KUnFYMGVWdlRpMnJP?=
 =?utf-8?B?ZUp0dTVNVVplckYyWUNRK3hvYmhsUXRhRmpLcDM3VHgyV0JRS1BLZW85Rk5n?=
 =?utf-8?B?N3lxYlRXWStzSzhhWXlnSWUra0NwS2FhdGx1RDVTUzFjUHZtZnBheUsxL1gw?=
 =?utf-8?B?YzI2andkUFg2TC9KMWdPZ1orTzRoWmNmbVJYWnNsMU9PRUxpQVZqelFVY2pN?=
 =?utf-8?B?T2FkUUFUUDJBSUpNVENIemhsV3JHNnI4cXJSU3UvWncxV3ZiNkxmMGtzQnNz?=
 =?utf-8?B?eVQ3ekV3U3Y4Z2N4cnFMZ2xIb000K25Uc0ZLSDhFR1FBRVN4K0Z2bDNHZjdK?=
 =?utf-8?B?RitGT3JKRHlwaXcxNHh5a3NVdW9LVjg5L2ZVMlZzL1ZWc29kdXc4SXVZTm9k?=
 =?utf-8?B?TE9mUkt3UUZ0NUlpZzc3M3VobXNnNTZMWC9tTEhTMW54NGk0L2lnb09qN09Q?=
 =?utf-8?B?ZGFYL29NczVpbUFlejU2VFVDMlF4ZEV0Qnp1Z1AwTWQ4SDEveUx4eFZiMFVH?=
 =?utf-8?B?RXlnRFFFZUNqQnJ2M0ZLSWdFRnFOWHk4d1JtSENkZ01hUFFaV0FUNUpiTk1s?=
 =?utf-8?B?ZFRjSGxVTi9HL1hPREJtYlZ3ckxrQkZqTjV3bnhDS2JFRjcycURMR2VBbW5j?=
 =?utf-8?B?Qm1aTFRDZXRlTFFTTDIyZWFOQzN1RW8zc00wdjh3RWlOcW9GdkxpRFRBSmQ5?=
 =?utf-8?B?LzdDcjVFZU9oVU80dEtrdU0vNUJaT3E4OUxlb3UwZzNQNjZiYTZzVXNtbWxw?=
 =?utf-8?B?enIxaE1JRVVzOGVlUStaQ3plNk9ybjF6eGlxT1g3VDloT2g3WktGQ0Z4aVF3?=
 =?utf-8?B?MjVrMEZPOGh3SmIyS2ZkZkgrUlZubnV2ZlpYeFhtTldGZ1J0VUhON3h0VTd0?=
 =?utf-8?B?QVhhWCtlM1pLTHZQS1JLSTdlLzkwbG9ZckNWQmFXRXprNEZnbCt0Q1RpYjJT?=
 =?utf-8?B?NXUrSU0xck1SZE54eG92S21NT1hZbm1oSytGcmc2VThuOHpBM1VUbThYcmt4?=
 =?utf-8?B?WFBpZkdORERkNVBReUYrYTBrc0ZMQ21xcWhyWCtrOEtBSnhzamdSRnRRU2Uy?=
 =?utf-8?B?cXhzVnNzRDJ2VCtEcUhZMmJHcGNUV3pUZ0dDQjBFVEpGS1RWM3BaZVdaN3R5?=
 =?utf-8?B?bERpdUhINVdvcjlZbm01TDRab2JXT2RZNkU1SGVWOU5MQVlZZk82M3BJVkk3?=
 =?utf-8?B?YS9RcXcyc1BHTXZZYzdOQlhlcHVNUGEyaFhMV0pndXZ1aEpiZVAxU2NtL3Ju?=
 =?utf-8?B?aW0rQ1NOb25WVkYzcTR5NXFvOHBiRCtIQm8vMlVkWE9QUG9TRlZrOEdzSUE0?=
 =?utf-8?B?UjBHUkpMYk1aeTU5ZDhrSjFJQnFUbTRYUVpQcDN2Y1pMbyswQzNOczdiTDl6?=
 =?utf-8?B?MW5KNWF6R3BxcjNhYU43RzNBTU4xWGpmanlKSTV5Ynd0VWJpMGNXekswejN3?=
 =?utf-8?B?RHYvQjFCTXpmUlRHempJck91VjMzWDhicThCWjk3a0hqTjhxaGhzVHBTQlFt?=
 =?utf-8?B?K3FHTU1pMzc5MlR2R2RJNHJxTXljTWg5eE9NaEtWRE1MRmhqQXdkVFR5K3Qv?=
 =?utf-8?B?VVQySkRoU1I4UmlUZ29jUCthZmk3Q0hmcmVIOFFmbjA5Um5pQXJXU3RrZDVB?=
 =?utf-8?B?Nm9WRHhPakJoUnBGLzBpUFB5ekJ1cTRxendzaUEzTUszRjh6dGFDd1dpNTlw?=
 =?utf-8?B?YkRsaVFGLyszM3ByNmQrd2d6R1IvU2QwMUEveVdGNlBSVVBHOW5xOEJOQnZP?=
 =?utf-8?B?UGtYMVgzbVBjazFOUDk4TnVXWDJSbVlRUmxRTEs1MjZoMFJZY0VYYnFWT0Jn?=
 =?utf-8?B?UGlocGhldnZkeWdhWHY5UCtlRFlZbWphdmtCVFZHT016bE83WG11MjhnTjVC?=
 =?utf-8?B?ZUN6ekNLSUtOdDd6dXBVY21zbnhwcWRVQUdQOWdVYmRtYWlrSVdJcllnNEF0?=
 =?utf-8?B?clJKUEEwcGxOeE9sL0dTYmVOdjlxVjc1WmhOOU0zZVFnZHNuYnFrL3cwNGl5?=
 =?utf-8?B?R052aFBXdjQvdUNKeFowWDJWUUJSTVUwT0FkMjBmVjNaSUp3TFJDRVJ0eWJ4?=
 =?utf-8?B?ODBDZk5mMzhjcDBRTzZ3U2MxTlpuNXlwS0IvNkJjQjlvNDlzM1BudG9URlhD?=
 =?utf-8?B?R2F4VVlla0dCNWhUdGNmRFpISWFENlZuaXlNcDFmTDV5VGQvSHNaNjA0MnZU?=
 =?utf-8?B?QjFLRmlySzh2OUhnd0t3aWdUYlkvR0g4bGhGZUliNVdnNUIyYS9XMUl3amU1?=
 =?utf-8?B?b1pXamZSZ1podlA1TTNZTmxtVkdYNUVPN3hGRnZBR1RpMHRuOVo5dEFrS2gx?=
 =?utf-8?B?QnFtazNTdzNPMjk3RGtYZXlFL1ZkN0dYS0FET3BrSEs4WWZmek5GNVlYQWpa?=
 =?utf-8?Q?o4M3pjKLqnUHqJQI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: ONDUwgUXTCXWYR7otjx0z+uy9oxFWyiPzLZpL6MbyPBcNnm9LnR20Ei4FqQKMg4GcHjJlWr9dzejjloKCBSeIx33q9zHeh1anJBrbksQz4YRqsFyNrWsV0QJeN1wpBgT8fFkt68xa0KmqkD+73F4U5VWjLAjpPxwbfqmxeKKK7knIIyIrI2tMeNHxNVBzx34lfqSKo82wah9GrtwXW0G/IrBErbQJ5PrFosX+asqh/yt5BGm8r6/5HGcuCaAFPDeBwg6bcQhYItwRw+vDG8MMYPhCRmH9ReO+sUzuQSw9iQbpcMxynam2P9RVEdB4V3/rFKmtIXxVKxGzQagTjgiuw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PR11MB131308.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7338b20c-4615-441a-a689-08df4b9305b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2026 07:58:13.7702 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BXCPtLQM/f7TiIs5W0r2CViFlAEjQ+vBQsVKIhQ7eG6xXWLPcxUgqt+zgDtOIsUIXun3wx3trqZhapR0TVfGlx3Q782UoMxfl30DjcJV23Io9kSvxyKWuhjk3mmEIYvB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFC3B7BD011
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSGVsbHN0cm9tLCBUaG9t
YXMgPHRob21hcy5oZWxsc3Ryb21AaW50ZWwuY29tPg0KPiBTZW50OiAyNSBOb3ZlbWJlciAyMDI2
IDIwOjI2DQo+IFRvOiBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IFRhbmd1ZHUsIFRp
bGFrIFRpcnVtYWxlc2gNCj4gPHRpbGFrLnRpcnVtYWxlc2gudGFuZ3VkdUBpbnRlbC5jb20+OyBO
YXJ2YWV6LCBKZXN1cw0KPiA8amVzdXMubmFydmFlekBpbnRlbC5jb20+OyBLIFYgUCwgU2F0eWFu
YXJheWFuYQ0KPiA8c2F0eWFuYXJheWFuYS5rLnYucEBpbnRlbC5jb20+OyBTdW1tZXJzLCBTdHVh
cnQNCj4gPHN0dWFydC5zdW1tZXJzQGludGVsLmNvbT47IFJvcGVyLCBNYXR0aGV3IEQNCj4gPG1h
dHRoZXcuZC5yb3BlckBpbnRlbC5jb20+OyBQaW9ya293c2tpLCBQaW90cg0KPiA8cGlvdHIucGlv
cmtvd3NraUBpbnRlbC5jb20+OyBDZXJhb2xvIFNwdXJpbywgRGFuaWVsZQ0KPiA8ZGFuaWVsZS5j
ZXJhb2xvc3B1cmlvQGludGVsLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCAyLzRdIGRybS94
ZTogQWRkIE1JX1NFTUFQSE9SRV9XQUlUXzY0IGluc3RydWN0aW9uDQo+IGRlZmluaXRpb24NCj4g
DQo+IE9uIFdlZCwgMjAyNi0xMS0yNSBhdCAwNToxMiArMDAwMCwgVGFuZ3VkdSwgVGlsYWsgVGly
dW1hbGVzaCB3cm90ZToNCj4gPg0KPiA+DQo+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0t
LQ0KPiA+ID4gRnJvbTogVGFuZ3VkdSwgVGlsYWsgVGlydW1hbGVzaA0KPiA+ID4gU2VudDogMjMg
Tm92ZW1iZXIgMjAyNiAyMTo0OA0KPiA+ID4gVG86IEsgViBQLCBTYXR5YW5hcmF5YW5hIDxTYXR5
YW5hcmF5YW5hLksuVi5QQGludGVsLmNvbT47DQo+ID4gPiBQaW9ya293c2tpLCBQaW90ciA8UGlv
dHIuUGlvcmtvd3NraUBpbnRlbC5jb20+OyBOYXJ2YWV6LCBKZXN1cw0KPiA+ID4gPGplc3VzLm5h
cnZhZXpAaW50ZWwuY29tPjsgQ2VyYW9sbyBTcHVyaW8sIERhbmllbGUNCj4gPiA+IDxkYW5pZWxl
LmNlcmFvbG9zcHVyaW9AaW50ZWwuY29tPjsgU3VtbWVycywgU3R1YXJ0DQo+ID4gPiA8c3R1YXJ0
LnN1bW1lcnNAaW50ZWwuY29tPjsgJ2ludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZycNCj4g
PiA+IDxpbnRlbC0NCj4gPiA+IHhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz47IFJvcGVyLCBNYXR0
aGV3IEQNCj4gPiA+IDxtYXR0aGV3LmQucm9wZXJAaW50ZWwuY29tPg0KPiA+ID4gU3ViamVjdDog
UkU6IFtQQVRDSCAyLzRdIGRybS94ZTogQWRkIE1JX1NFTUFQSE9SRV9XQUlUXzY0DQo+ID4gPiBp
bnN0cnVjdGlvbiBkZWZpbml0aW9uDQo+ID4gPg0KPiA+ID4NCj4gPiA+ID4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4gPiA+ID4gRnJvbTogVGFuZ3VkdSwgVGlsYWsgVGlydW1hbGVzaA0K
PiA+ID4gPiBTZW50OiAyMCBOb3ZlbWJlciAyMDI2IDE4OjA2DQo+ID4gPiA+IFRvOiBLIFYgUCwg
U2F0eWFuYXJheWFuYSA8U2F0eWFuYXJheWFuYS5LLlYuUEBpbnRlbC5jb20+Ow0KPiA+ID4gPiBQ
aW9ya293c2tpLCBQaW90ciA8UGlvdHIuUGlvcmtvd3NraUBpbnRlbC5jb20+OyBOYXJ2YWV6LCBK
ZXN1cw0KPiA+ID4gPiA8amVzdXMubmFydmFlekBpbnRlbC5jb20+OyBDZXJhb2xvIFNwdXJpbywg
RGFuaWVsZQ0KPiA+ID4gPiA8ZGFuaWVsZS5jZXJhb2xvc3B1cmlvQGludGVsLmNvbT47IFN1bW1l
cnMsIFN0dWFydA0KPiA+ID4gPiA8c3R1YXJ0LnN1bW1lcnNAaW50ZWwuY29tPjsgaW50ZWwteGVA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+ID4gPiA+IFN1YmplY3Q6IFJFOiBbUEFUQ0ggMi80XSBk
cm0veGU6IEFkZCBNSV9TRU1BUEhPUkVfV0FJVF82NA0KPiA+ID4gPiBpbnN0cnVjdGlvbiBkZWZp
bml0aW9uDQo+ID4gPiA+DQo+ID4gPiA+DQo+ID4gPiA+DQo+ID4gPiA+ID4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4gPiA+ID4gPiBGcm9tOiBLIFYgUCwgU2F0eWFuYXJheWFuYSA8c2F0
eWFuYXJheWFuYS5rLnYucEBpbnRlbC5jb20+DQo+ID4gPiA+ID4gU2VudDogMjAgTm92ZW1iZXIg
MjAyNiAxMzoxOA0KPiA+ID4gPiA+IFRvOiBUYW5ndWR1LCBUaWxhayBUaXJ1bWFsZXNoDQo+ID4g
PiA+ID4gPHRpbGFrLnRpcnVtYWxlc2gudGFuZ3VkdUBpbnRlbC5jb20+Ow0KPiA+ID4gPiA+IFBp
b3Jrb3dza2ksIFBpb3RyIDxwaW90ci5waW9ya293c2tpQGludGVsLmNvbT47IE5hcnZhZXosIEpl
c3VzDQo+ID4gPiA+ID4gPGplc3VzLm5hcnZhZXpAaW50ZWwuY29tPjsgQ2VyYW9sbyBTcHVyaW8s
IERhbmllbGUNCj4gPiA+ID4gPiA8ZGFuaWVsZS5jZXJhb2xvc3B1cmlvQGludGVsLmNvbT47IFN1
bW1lcnMsIFN0dWFydA0KPiA+ID4gPiA+IDxzdHVhcnQuc3VtbWVyc0BpbnRlbC5jb20+OyBpbnRl
bC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gPiA+ID4gPiBTdWJqZWN0OiBSZTogW1BBVENI
IDIvNF0gZHJtL3hlOiBBZGQgTUlfU0VNQVBIT1JFX1dBSVRfNjQNCj4gPiA+ID4gPiBpbnN0cnVj
dGlvbiBkZWZpbml0aW9uDQo+ID4gPiA+ID4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IE9uIDEzLU5v
di0yNiA5OjI3IFBNLCB0aWxhay50aXJ1bWFsZXNoLnRhbmd1ZHVAaW50ZWwuY29twqB3cm90ZToN
Cj4gPiA+ID4gPiA+IEZyb206IFRhbmd1ZHUgVGlsYWsgVGlydW1hbGVzaA0KPiA+ID4gPiA+ID4g
PHRpbGFrLnRpcnVtYWxlc2gudGFuZ3VkdUBpbnRlbC5jb20+DQo+ID4gPiA+ID4gPg0KPiA+ID4g
PiA+ID4gV2FfMTYwMjkyODE5MTMgcmVjb21tZW5kcyB1c2luZyB0aGUgTUlfU0VNQVBIT1JFX1dB
SVRfNjQNCj4gPiA+ID4gPiBpbnN0cnVjdGlvbg0KPiA+ID4gPiA+ID4gaW5zdGVhZCBvZiB0aGUg
bGVnYWN5IE1JX1NFTUFQSE9SRV9XQUlULCBkdWUgdG8gYW4gaXNzdWUgd2l0aA0KPiA+ID4gPiA+
ID4gdGhlDQo+ID4gPiA+ID4gPiBsZWdhY3kgc2VtYXBob3JlIG9uIHNvbWUgWGUzcCBwbGF0Zm9y
bXMuDQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gQXNzaXN0ZWQtYnk6IExMTQ0KPiA+ID4gPiA+
ID4gU2lnbmVkLW9mZi1ieTogVGFuZ3VkdSBUaWxhayBUaXJ1bWFsZXNoDQo+ID4gPiA+ID4gPiA8
dGlsYWsudGlydW1hbGVzaC50YW5ndWR1QGludGVsLmNvbT4NCj4gPiA+ID4gPiA+IC0tLQ0KPiA+
ID4gPiA+ID4gwqAgZHJpdmVycy9ncHUvZHJtL3hlL2luc3RydWN0aW9ucy94ZV9taV9jb21tYW5k
cy5oIHwgNiArKysrKysNCj4gPiA+ID4gPiA+IMKgIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlv
bnMoKykNCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3hlL2luc3RydWN0aW9ucy94ZV9taV9jb21tYW5kcy5oDQo+ID4gPiA+ID4gPiBiL2RyaXZl
cnMvZ3B1L2RybS94ZS9pbnN0cnVjdGlvbnMveGVfbWlfY29tbWFuZHMuaA0KPiA+ID4gPiA+ID4g
aW5kZXggODM1ZWY3NWJiZWIxLi4xODZjOWFjMzVlNWIgMTAwNjQ0DQo+ID4gPiA+ID4gPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0veGUvaW5zdHJ1Y3Rpb25zL3hlX21pX2NvbW1hbmRzLmgNCj4gPiA+
ID4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS9pbnN0cnVjdGlvbnMveGVfbWlfY29tbWFu
ZHMuaA0KPiA+ID4gPiA+ID4gQEAgLTM0LDYgKzM0LDcgQEANCj4gPiA+ID4gPiA+IMKgICNkZWZp
bmUNCj4gPiA+ID4gPiA+IE1JX0ZPUkNFX1dBS0VVUAkJCV9fTUlfSU5TVFIoMHgxRCkNCj4gPiA+
ID4gPiA+IMKgICNkZWZpbmUgTUlfTUFUSChuKQkJCShfX01JX0lOU1RSKDB4MUEpIHwNCj4gPiA+
ID4gPiBYRV9JTlNUUl9OVU1fRFcoKG4pICsgMSkpDQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4g
Ky8qIFdhXzE2MDI5MjgxOTEzOiBNSV9TRU1BUEhPUkVfV0FJVCBoYXMgYW4gaXNzdWUgb24gc29t
ZQ0KPiA+ID4gWGUzcCwNCj4gPiA+ID4gPiB1c2UNCj4gPiA+ID4gPiA+ICtNSV9TRU1BUEhPUkVf
V0FJVF82NCAqLw0KPiA+ID4gPiA+IERvIHdlIG5lZWQgdG8gbWVudGlvbiB0aGlzIGluIHRoZSBy
ZWdpc3RlciBkZWZpbml0aW9uIGZpbGU/DQo+ID4gPiA+DQo+ID4gPiA+IEkgbWlzc2VkIHRoaXMg
Y29tbWVudCwgYXBvbG9naWVzDQo+ID4gPiA+DQo+ID4gPiA+IEFncmVlZCB3aXRoIFNhdHlhJ3Mg
Y29tbWVudC4gQnV0IHRoZW4gaG93IGRvIHdlIHByb21wdCBmdXR1cmUNCj4gPiA+ID4gdXNlcnMN
Cj4gPiA+ID4gbm90IHRvIHVzZSB0aGUgbGVnYWN5IHNlbWFwaG9yZSBvbiBwbGF0Zm9ybXMgdGhh
dCBzdXBwb3J0IHNlbTY0Pw0KPiA+ID4gPg0KPiA+ID4gQFJvcGVyLCBNYXR0aGV3IEQNCj4gPiA+
IEFueSBjb21tZW50cyBvciBzdWdnZXN0aW9uIGhlcmU/DQo+ID4gPiA+IFN0dWFydC9EYW5pZWxl
LCBhbnkgc3VnZ2VzdGlvbnMgaGVyZT8NCj4gPiBASGVsbHN0cm9tLCBUaG9tYXMNCj4gPiBBbnkg
c3VnZ2VzdGlvbnMgb24gdGhpcz8NCj4gDQo+IE5vdGhpbmcgbmVhdC4NCj4gSWYgbmVlZGVkIG9u
ZSBjb3VsZCBwZXJoYXBzIGNoYW5nZSB0aGUgbWFjcm8gdG8gc29tZXRoaW5nDQo+IHRoYXQgd2Fy
bnMgaWYgdXNlZCBvbiBkZWJ1ZyBidWlsZHMgb24gZGV2aWNlcyB3aGVyZSB0aGUgV0EgaXMgYWN0
aXZlPw0KPiANCj4gQnV0IHRoYXQgd291bGQgYWxzbyBtYWtlIGl0IGludG8gdGhlIHJlZ2lzdGVy
IGRlZmluaXRpb24gZmlsZS4NCj4gDQoNCkkgd2lsbCBnbyB3aXRoIFRob21hcyBzdWdnZXN0aW9u
IGhlcmUsIGJ1dCB3aWxsIHRha2UgdXAgaW4gYSBkaWZmZXJlbnQgDQpmb2xsb3ctdXAgcGF0Y2gg
c2VyaWVzLA0KDQo+IFRoYW5rcywNCj4gVGhvbWFzDQo+IA0KPiANCj4gDQo+IA0KPiANCj4gDQo+
ID4NCj4gPiA+ID4NCj4gPiA+ID4gLVRpbGFrDQo+ID4gPiA+DQo+ID4gPiA+ID4gPiDCoCAjZGVm
aW5lIE1JX1NFTUFQSE9SRV9XQUlUCQkoX19NSV9JTlNUUigweDFjKSB8DQo+ID4gPiA+ID4gWEVf
SU5TVFJfTlVNX0RXKDUpKQ0KPiA+ID4gPiA+ID4gwqAgI2RlZmluZcKgwqAgTUlfU0VNV19HR1RU
CQkJUkVHX0JJVCgyMikNCj4gPiA+ID4gPiA+IMKgICNkZWZpbmXCoMKgIE1JX1NFTVdfUkVHSVNU
RVJfUE9MTAkJUkVHX0JJVCgxNikNCj4gPiA+ID4gPiA+IEBAIC00OCw2ICs0OSwxMSBAQA0KPiA+
ID4gPiA+ID4gwqAgI2RlZmluZcKgwqAgTUlfU0VNV19DT01QQVJFKE9QKQ0KPiA+ID4gPiA+IAlS
RUdfRklFTERfUFJFUChNSV9TRU1XX0NPTVBBUkVfT1BfTUFTSywNCj4gPiA+ID4gPiBDT01QQVJF
X09QXyMjT1ApDQo+ID4gPiA+ID4gPiDCoCAjZGVmaW5lwqDCoCBNSV9TRU1XX1RPS0VOKHRva2Vu
KQ0KPiA+ID4gPiA+IAlSRUdfRklFTERfUFJFUChSRUdfR0VOTUFTSyg5LCAyKSwgKHRva2VuKSkN
Cj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiArI2RlZmluZSBNSV9TRU1BUEhPUkVfV0FJVF82NAkJ
KF9fTUlfSU5TVFIoMHgzYikgfA0KPiA+ID4gPiA+IFhFX0lOU1RSX05VTV9EVyg3KSkNCj4gPiA+
ID4gPiA+ICsjZGVmaW5lwqDCoCBNSV9TRU1XNjRfSU5URVJSVVBUCQlSRUdfQklUKDIwKSAvKg0K
PiA+ID4gPiA+ID4gcmFpc2VzDQo+ID4gPiB0aGUNCj4gPiA+ID4gPiBzZW1hcGhvcmUtZmFpbCBp
bnRlcnJ1cHQgKi8NCj4gPiA+ID4gPiA+ICsjZGVmaW5lwqDCoCBNSV9TRU1XNjRfMzJCX0NPTVBB
UkUJCVJFR19CSVQoMTkpDQo+ID4gPiA+ID4gPiAvKiAwOiA2NGINCj4gPiA+ID4gPiBjb21wYXJl
IChkZWZhdWx0KSwgMTogMzJiIGNvbXBhcmUgKi8NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IENoZWNr
IGFsaWdubWVudCBoZXJlLg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gLVNhdHlhLg0KPiA+ID4gPiBB
ZGRyZXNzZWQNCj4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gKyNkZWZpbmXCoMKgIE1JX1NFTVc2NF9J
TkhJQklUX0NUWF9TV0lUQ0gJUkVHX0JJVCgxNSkgLyogcG9sbA0KPiA+ID4gPiA+ID4gaW4NCj4g
PiA+ID4gPiBwbGFjZSwgZG9uJ3Qgc3dpdGNoIG91dCBvbiBmYWlsICovDQo+ID4gPiA+ID4gPiAr
DQo+ID4gPiA+ID4gPiDCoCAjZGVmaW5lIE1JX1NUT1JFX0RBVEFfSU1NCQlfX01JX0lOU1RSKDB4
MjApDQo+ID4gPiA+ID4gPiDCoCAjZGVmaW5lwqDCoCBNSV9TRElfR0dUVAkJCVJFR19CSVQoMjIp
DQo+ID4gPiA+ID4gPiDCoCAjZGVmaW5lwqDCoCBNSV9TRElfTEVOX0RXCQkJR0VOTUFTSyg5LA0K
PiA+ID4gPiA+ID4gMCkNCg==
