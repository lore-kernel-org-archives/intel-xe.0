Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EDF6606A31C
	for <intel-xe@archiver.kernel.org>; Mon, 16 Nov 2026 09:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EnS+9IRQ;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=UhVvugLP
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1702810ED5E;
	Mon, 16 Nov 2026 09:01:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3122110ED58;
 Mon, 16 Nov 2026 09:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794819686; x=1826355686;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=oRfvgPdGI774/MOdf0c3+mxo9VvQhwJ9Kpww64ic4+4=;
 b=EnS+9IRQ0KpioSUVp+WREYOkwro50vkiS9MRMOQlDMst+erZNVGSNwcd
 acSpzkzBkl/juDkGCdDbZOlUJJvZI9S/5j0FCu0yqyToPYe5V6iZv9TaT
 ldQSCZnhtfet+bA8hN1pSm/KAtumrs4N36K/SsBnKNWQnX3vNb5FleNEe
 ukt4Zn7DAQAWL/jy/SNsg5JxVJW55VhvOv6aKmen7XXXuHqCkmyIr0vxI
 IcDWq49UhTgctasH89romB9dLsUfJZK8G6WXkCrYP1QMiN65yfU+1HSCY
 oUxhKzg23p1oIiO+is4rKpJbQTe4RrWu0EKMrtWWnFdgBnvViBodS0Cnf g==;
X-CSE-ConnectionGUID: rSJ6tDuhR0qg9fX8HtSpuQ==
X-CSE-MsgGUID: 98HtfFfGSeCEcoNdDpUc3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3452242"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3452242"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 01:01:25 -0800
X-CSE-ConnectionGUID: mGxIr84ZS+6KHp49x7KgGw==
X-CSE-MsgGUID: rAMth++dTJyXiezUq5jH/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9509617"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 01:01:25 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 01:01:24 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 16 Nov 2026 01:01:24 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.29) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 01:01:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L6yLHGXkWjc9D1NLwgjWT1zsl9p1lv1o/kVlWLzxaD9hlt1xXUHAClQ7Lp9H8xMQ6w8aiwomtNJxFcGzhp03mtOQSHMqK0PtbMYsxprzhHn+SzJyy9YiFkOVZq3UyLeUb3yC7UdMejJ8xMa9WuZrIrUxyCeVXYV9HU/pQRXNPsnTWkBlNM+2Wepq7D65GRuvqnhYJ0K2gyVfUQUCSjap0//OMShsB37Jp/nG2HZv80ksfvMgCDIlYD+fCVemGGAraQWJaB/q3jEQiEIBW8VDU72ADpP9fToSQcZBZYR3Bshp58PyLN2Bb7E5sDTJRFMxZpuuu4Ns3RzOEm6JUlW7ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oRfvgPdGI774/MOdf0c3+mxo9VvQhwJ9Kpww64ic4+4=;
 b=ly65uxJV+GVQxsdrXsYHSsjiJihcMvJmzhPwBbkLKt+xampmqccTzjpQaGZb7W5PAJVlU43J9V/UAvGi+M+XxmXwXDFtgL1jZngINCmnsX/mm/pH3SKIBIPUXxOApMLPGP8LvDGgoHkcZt0qPS6UVF0Ck05dvVLrmJ+3VXxuGlxQHrz6MDziDEH4zTwl6MBgl5bWihBdIODT2kMoyjYN9+mQ6ByFXJrhz4txIgEq6zJjQ85N5E9/yyTL25Uz1+iBMQ+amrWY2MzTk6UtLgluRHrGc8GKS1CkynxCi8VEKvrQvvjYRGOKY3rWVjsih/UcKS3p/9ZHMI1u5tbQ/4ZVig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oRfvgPdGI774/MOdf0c3+mxo9VvQhwJ9Kpww64ic4+4=;
 b=UhVvugLPUB1Km3hSXzVqCg+OoTAqziirN9P9+3aG1TekdVDYRMAGHzBj2q8SBrVr7pY/RJR6I27pdm6e2g3u6HVCgUbQPaIsx9ziRqB6mRwiK6AyCKq/yYAk619KSd8xJRzvoTImDOM4euDfilWoNfj5CHJGsS8pRqSsTadoGsY=
Received: from SJ0PR11MB5039.namprd11.prod.outlook.com (2603:10b6:a03:2da::22)
 by DM3PPFCA3BFC2BF.namprd11.prod.outlook.com (2603:10b6:f:fc00::f4c)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 09:00:16 +0000
Received: from SJ0PR11MB5039.namprd11.prod.outlook.com
 ([fe80::d9f2:247d:ca72:fc1e]) by SJ0PR11MB5039.namprd11.prod.outlook.com
 ([fe80::d9f2:247d:ca72:fc1e%6]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 09:00:16 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>, "Kandpal,
 Suraj" <suraj.kandpal@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: Jani Nikula <jani.nikula@linux.intel.com>, "Shankar, Uma"
 <uma.shankar@intel.com>
Subject: RE: [PATCH v4 7/7] drm/i915/dp: Don't limit the Link M/N ratio with
 the symbol timing generator
Thread-Topic: [PATCH v4 7/7] drm/i915/dp: Don't limit the Link M/N ratio with
 the symbol timing generator
Thread-Index: AQHda3qmmPptSsu+1UmERaJBGWNH2LcdIRwAgBH7Z4CAAV3cEA==
Date: Mon, 16 Nov 2026 09:00:16 +0000
Message-ID: <SJ0PR11MB5039A6CA55E7C40C22D86E44BA7C2@SJ0PR11MB5039.namprd11.prod.outlook.com>
References: <20261103-vlk-64036-dp-symbol-tg-v4-0-6cf8a588b54c@intel.com>
 <20261103-vlk-64036-dp-symbol-tg-v4-7-6cf8a588b54c@intel.com>
 <DS4PPFE901A304F36C9292E8FFF415A3BB4E3682@DS4PPFE901A304F.namprd11.prod.outlook.com>
 <c84dad40-1cdf-4dca-9079-f222d49ccca1@intel.com>
In-Reply-To: <c84dad40-1cdf-4dca-9079-f222d49ccca1@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB5039:EE_|DM3PPFCA3BFC2BF:EE_
x-ms-office365-filtering-correlation-id: 4ba4f6dd-0ecf-4a35-0397-08df43c00886
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|18002099003|22082099003|261009223027099003|11063799006|260925021311599003|260925021911599003|56012099006|260925022911599003|10067099003|4143699003|261102123227099003|261028144727099003|261026121527099003|261026140227099003|261021121427099003|261021123027099003|261022113327099003|261022105027099003|38070700021;
x-microsoft-antispam-message-info: 4KsyChvldgPXePvdejnGHUP4JJqZMsqD7JJ30hHNELn4mPIA+ZieFseoHMy33hhECFhCELDTGB+0Jk5Ju16O9U2XMY1isuJc49VYdMIfie4XYjXRjULjPZBZbTxSNEDNtm6IqNrKDrR2DjesJwouVfvjJnP3+agdx5+Yk85B0iblx6cMDxp+RYUdMtHgx80Torejt2WPES655RwgZYq1elXdbaL5e9oMjIn71VGWE/SIV3sTSAhOEFLRqqgwg/QXw430BuDOFD87YNs2qW1fOxZRSeEVMX2+2RVodB2doOGQSo7xEwuXNDD4d84xFZF/9EIPDaUIbB00c2ahVB+Yl3Lftc3rpUly5YJjfExuzM7AAjViy1Wx+o0HEcmxMB67DkGk5qE44vZ0pzmfmtesgo64xce2etOodQm5Z7Ux8jMIbFFYJJZdbVAN323O5T1nmeUwPFWb+M1XAxHxypo4F0xlFilhjZr6Dl4ZdCG0dl5piDC0g+ofbIKvPZPTrXOg2LQtxkSCq6+Z6/yQfYeBlmQpW12d1udt3sXVMYUOeum0H7D/tCdQLu+JD5jwwuahvtuqqlMm/pL+S7JaQDUZw72MRIvG9I+wOD8ZtJBGSMoNLchf6LC2ePJXf+Ozv+LejGywUD1DJCvIGj8FrNC1bSJfeqz/By11p9yge2Ir5MqBwbZFYvDlSV/J/7KcVJw0TYlW8iQMqmxay4C5+U6+Z2JNWfxHaepo4/Z/WBaELg4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB5039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(22082099003)(261009223027099003)(11063799006)(260925021311599003)(260925021911599003)(56012099006)(260925022911599003)(10067099003)(4143699003)(261102123227099003)(261028144727099003)(261026121527099003)(261026140227099003)(261021121427099003)(261021123027099003)(261022113327099003)(261022105027099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UlM3d0FDaW1lTzAyQnV3MGJ0dnpyaWZqeFZJT1ZiY3NBZGw3ZGZiWDVzaWs4?=
 =?utf-8?B?VklMWk5OdFVzdU84SUJoZG1Rb3dZOTArZUJuK1orQk96VWo5cHAvWWp6TmZp?=
 =?utf-8?B?Wm5XK0NpcmFQanVaKzlVR1FVMXd5QzZ0Z3hTell1ak5tS1gwYkRYTkU5aFRZ?=
 =?utf-8?B?eUNrZEU5K3lrbmdjd0FscDRBTDQ0ajJhWnJhZmM5ZjBla3h6VFVVSGdXanBl?=
 =?utf-8?B?ZkJPY3oyUDF5RzFzOHpaSy8yeExLTHlqclBZR1NRNHhCNFRwdGxGVHI5YjVk?=
 =?utf-8?B?UnNHSEZJZUk4bWo5Qy9acG9VbGphQlJmQSs0bzltUnBkSDBiQWNhMk9sRERP?=
 =?utf-8?B?T2RiWmxpSkNSZ0txZ0VuSmVnQS9IQVdqSmN4Ri9LQlVlOE1pK0V1TS9scGNS?=
 =?utf-8?B?MnBFcG9UdG9RazVEMWswRWN1NEo5bmV3WStiM3RjeVpxQW4vUFRja0hQcGJO?=
 =?utf-8?B?RjBBdjgvbElCcnFDMTVIeEU5SWc0SXFVWlRQMzIwTUhwenhkRWtuajAwOHVQ?=
 =?utf-8?B?Zll5MzI2cU9KUXZuVkpocTRncFEyQ3BkVUpYSWtERjU4ZHJGMVhQb3RaVDhz?=
 =?utf-8?B?WnNEZ25vRSthWVJzaUFhZUdncCtIRkwxWmlXcjNPZVZMeDFSMTdMM1BYeUVE?=
 =?utf-8?B?dkdiWElKWGtrUHJ1cUlPdjFEZEZYWjkybGpNNHZjN0lwZG1VdmxKNmhjL0cx?=
 =?utf-8?B?Ukx6bGJ3QTJwQWdsT2Jxeit2d3RSWVRqRFlCMUhMNUJqUnNPMmNNTkhmeTNC?=
 =?utf-8?B?ak0rK3N5Uk9KZGI3YUoweU1XM3NTN0YxOTB4MDlkMFNQRVM0eng3cmErSEJ3?=
 =?utf-8?B?VkNJWWtuaHFObDh3cnZNVmNHUUV0Y3p2NzJ0Qkgzb1prK0xBeGEvamJybitV?=
 =?utf-8?B?Y2cvL0VaaXRWMWJHM2wyVFpLb2c4NEpuUk1KRDdSZUFDQXhSQVBuVXBkODU1?=
 =?utf-8?B?RFI1VGxidlJYeWQ5ZjFKRXF0SDh6TklON3BjRW4wV2NNZ2srNm5RUlYydFFS?=
 =?utf-8?B?QU55M3IycGhkYnphMkRpejgwejlMRjB3bEFsUXFRc2VWYTgwcGFzRzlQUDJi?=
 =?utf-8?B?SjVuTExkdHB1UlNITlhrUVgzTmxORlBzNmNuMHNvUW1hdlUxS3diRkorOFdn?=
 =?utf-8?B?ZjFyNFlXS1dEWk9oZUtiME4yL3FaQ21PVVNoQVIvR0pLY0tuNFBWenNHOFZN?=
 =?utf-8?B?STVwQTJhcmJaa2lMRHZpQkFSY2J6c2dQV1A4UjR3UkJnTS84LzlIZ1VGcXJF?=
 =?utf-8?B?Wmg2WHBLbG5VeTNGQllLelAwcVJLMnpRb3lKMzJaRDg3U0pVMnk4UkNCbncx?=
 =?utf-8?B?TlVqVmV3eUpHWHJjRGp6NjVEekQ3Wm5YRWI5Y1NPNVBUVHErU3RRU3lXSWJV?=
 =?utf-8?B?RDE4LzNoLzNFa1BXUGJnSWQwWExtOFBrRDZENFRWNytPK1BsWmVuVS94NER2?=
 =?utf-8?B?UDQ4Y0N5WEE1MW9iaE8rZUM1N1J6WEJGcUlxOTF3Q0ZRU205azAxb3RzdnBl?=
 =?utf-8?B?Z20zeGt6emRuUkhtOVdKaG5DS2ZGUXo3U3JGaU5lOHB2MUdYZFBySm1nVTBl?=
 =?utf-8?B?aGFuY3BrVjE1UjZHeDVkQytzMzhCL0xMNUV3ZkYvYUhwNC9uc29BNTNkUVRh?=
 =?utf-8?B?MGNUMnhsNWo4d3BkdEsrR2dmYVE3SVdINDF1OXV0MHMwUDFQaUEwOHlWOHJx?=
 =?utf-8?B?ZEd4aS95WDJ1Yi9pUzRiTTREK2p1MlZFSGJkWDJqRWtHWVZXZnhXRlJJb3dM?=
 =?utf-8?B?WklXNDl4VitTTStHU21DNEZIcytMeE1GZERCZmxNZ0tLNHVLZW56YnRrL1hM?=
 =?utf-8?B?dStKeFBhVXNQNnRWcS8yUkRhR3BvbDhwTUs5aUxpeFhQTHpiTnJscGVoTWY4?=
 =?utf-8?B?d3M3VDBmR0JRS0RSalBMUStkQzdZR2tyanFZZDR3UXVQZTl0R29DMlZkYVJE?=
 =?utf-8?B?TzBjdlczeFlTYnZOclRQd1RmV0djdWFoMDdPTGx0RWdaZFM3dkxrNXhXOGtH?=
 =?utf-8?B?SUQ5Q1A4OXdScUhYeVpwdFFiYzhPRjVHNFlHYURGVlM1cVRHSTdpRlkraEM2?=
 =?utf-8?B?YmR3dDVTSU9XYU5Pc25Lb1hNYTY3KzRybm5FY0t0UERDbER3eVhNeThlekIx?=
 =?utf-8?B?RXhOQnByRGJiaUVwZDRQS3dUYm02b1BvZGpORVE5NjRvQkZTcTk2Njhzc0RL?=
 =?utf-8?B?Wmk3N0ZPRGxUZHFETjU1dVdRczBtMlZRSVpZdlNMTFlGQUVWZVh3K2pYZGtu?=
 =?utf-8?B?OVhpL01DWkZjaVRYdDk4ZUlFVURJeVFWanVkTE1WenZtclBwTDhMRFUxampI?=
 =?utf-8?B?N3U5VUE5WlRKWEhqb3B2RzJmZWxYdVlsN3g2bG5VN2IvZkZoZDVBUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: J9FkuN8Ej33FuUC4qhsdpyOWKQWShTsOJipqoYxX1oxzFVe+gJ7EksB9abDZLUDjv+1Fcf4QaCgVIG4Hqk53aM68YTITmTqmWWP6bP9WcgCwh+xoNvlZS/vI6zAG87rh8QQxZDq/kWrfy79EFrIhRIvzTBSRAUYqbTYkKeLGtSDUL2AyMlMOr1oviOyvHXgegxyh8DppkTE/cBmZAr/ElJMmZr6Hs/xbbk5TmIKpDtyOk575pS2glkm2i0tuubLvwTrAzaMmL9c+JnBvRTw0w4Ui0Q2ki21KMNoiPJchehu5nqtzMtHii6dQJ5ByLMPv90lSytHuxGTGaJOLMiH/bg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ba4f6dd-0ecf-4a35-0397-08df43c00886
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2026 09:00:16.5604 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b5zX3MkBAoj4y7pKleL3wCI5+e8MDefj/wcYnRXMOUTqFUFIKoHg+lRhTpPftpYM2qlog29RV0tF+unfydixFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFCA3BFC2BF
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

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEJvcmFoLCBDaGFpdGFueWEg
S3VtYXIgPGNoYWl0YW55YS5rdW1hci5ib3JhaEBpbnRlbC5jb20+DQo+IFNlbnQ6IFN1bmRheSwg
Tm92ZW1iZXIgMTUsIDIwMjYgNTozNiBQTQ0KPiBUbzogS2FuZHBhbCwgU3VyYWogPHN1cmFqLmth
bmRwYWxAaW50ZWwuY29tPjsgTXVydGh5LCBBcnVuIFINCj4gPGFydW4uci5tdXJ0aHlAaW50ZWwu
Y29tPjsgaW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgaW50ZWwtDQo+IHhlQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGxpbnV4Lmlu
dGVsLmNvbT47IFNoYW5rYXIsIFVtYQ0KPiA8dW1hLnNoYW5rYXJAaW50ZWwuY29tPg0KPiBTdWJq
ZWN0OiBSZTogW1BBVENIIHY0IDcvN10gZHJtL2k5MTUvZHA6IERvbid0IGxpbWl0IHRoZSBMaW5r
IE0vTiByYXRpbyB3aXRoDQo+IHRoZSBzeW1ib2wgdGltaW5nIGdlbmVyYXRvcg0KPiANCj4gDQo+
IA0KPiBPbiAxMS80LzIwMjYgNzowMCBBTSwgS2FuZHBhbCwgU3VyYWogd3JvdGU6DQo+ID4+IFN1
YmplY3Q6IFtQQVRDSCB2NCA3LzddIGRybS9pOTE1L2RwOiBEb24ndCBsaW1pdCB0aGUgTGluayBN
L04gcmF0aW8NCj4gPj4gd2l0aCB0aGUgc3ltYm9sIHRpbWluZyBnZW5lcmF0b3INCj4gPj4NCj4g
Pj4gVGhlIGxpbWl0IG9uIHRoZSBMaW5rIE0vTiByYXRpbyBvbmx5IGFwcGxpZXMgdG8gdGhlIHBp
eGVsIGJhc2VkDQo+ID4+IHRpbWluZyBnZW5lcmF0b3IsIHRoZXJlIGlzIG5vIHN1Y2ggcmVzdHJp
Y3Rpb24gd2hlbiB0aGUgc3ltYm9sIGJhc2VkDQo+ID4+IHRpbWluZyBnZW5lcmF0b3IgaXMgdXNl
ZC4NCj4gPj4NCj4gPj4gQnNwZWM6IDY4OTIyDQo+ID4+IFNpZ25lZC1vZmYtYnk6IEFydW4gUiBN
dXJ0aHkgPGFydW4uci5tdXJ0aHlAaW50ZWwuY29tPg0KPiA+PiAtLS0NCj4gPj4gICBkcml2ZXJz
L2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmMgICAgIHwgMTcgKysrKysrKysrKysrKy0t
LS0NCj4gPj4gICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwX21zdC5jIHwg
IDQgKysrLQ0KPiA+PiAgIDIgZmlsZXMgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgNSBkZWxl
dGlvbnMoLSkNCj4gPj4NCj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfZHAuYw0KPiA+PiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfZHAuYw0KPiA+PiBpbmRleA0KPiA+Pg0KPiA3ODhjMTZkZjk4MDExMzEyOTRjNzM0MjBjMmMw
ZDRkM2VjODQ4MzEwLi5hOGZhMDgwOTA3OWU4YjNmNmZiNTc0Y2ZiDQo+ID4+IDczZmI2YmI4YjAx
OWNjMyAxMDA2NDQNCj4gPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRl
bF9kcC5jDQo+ID4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAu
Yw0KPiA+PiBAQCAtMTI3Nyw4ICsxMjc3LDEyIEBAIHN0YXRpYyBib29sIGludGVsX2RwX2hhc19z
eW1ib2xfdGcoc3RydWN0DQo+ID4+IGludGVsX2Rpc3BsYXkgKmRpc3BsYXksIGJvb2wgaXNfbXN0
LCBiICB9DQo+ID4+DQo+ID4+ICAgc3RhdGljIGludA0KPiA+PiAtaW50ZWxfZHBfZ2V0X21heF9t
X25fcmF0aW8oc3RydWN0IGludGVsX2Rpc3BsYXkgKmRpc3BsYXkpDQo+ID4+ICtpbnRlbF9kcF9n
ZXRfbWF4X21fbl9yYXRpbyhzdHJ1Y3QgaW50ZWxfZGlzcGxheSAqZGlzcGxheSwgYm9vbA0KPiA+
PiAraXNfbXN0LCBpbnQgbGlua19yYXRlKQ0KPiA+PiAgIHsNCj4gPj4gKwkvKiBObyBMaW5rIE0v
TiByYXRpbyBsaW1pdCB3aXRoIHRoZSBzeW1ib2wgYmFzZWQgdGltaW5nIGdlbmVyYXRvciAqLw0K
PiA+PiArCWlmIChpbnRlbF9kcF9oYXNfc3ltYm9sX3RnKGRpc3BsYXksIGlzX21zdCwNCj4gPj4g
ZHJtX2RwX2lzX3VoYnJfcmF0ZShsaW5rX3JhdGUpKSkNCj4gPj4gKwkJcmV0dXJuIElOVF9NQVg7
DQo+ID4+ICsNCj4gDQo+IFRoaXMgcmVsaWVzIG9uIHRoZSBzeW1ib2wgVEcgYWx3YXlzIGJlaW5n
IHVzZWQgd2hlbmV2ZXINCj4gaW50ZWxfZHBfaGFzX3N5bWJvbF90ZygpIGlzIHRydWUuIFVubGVz
cyB0aGUgc3VnZ2VzdGlvbnMgbWFkZSBvbiBwYXRjaA0KPiA1IHRvIGluY29ycG9yYXRlIHRoZSBz
eW1ib2wgVEcgaW4gdGhlIGxpbmsgY29tcHV0YXRpb24gcGF0aCBhcmUgYWRvcHRlZCwgdGhlDQo+
IHBpeGVsIFRHIGNvdWxkIGVuZCB1cCBiZWluZyB1c2VkIHdpdGhvdXQgdGhlIExpbmsgTS9OIHJh
dGlvIGNoZWNrLg0KPiANClNob3VsZCBiZSBoYW5kbGVkIHVwb24gbW92aW5nIHRoZSBzeW1ib2wg
VEcgdG8gY29tcHV0ZSENCg0KVGhhbmtzIGFuZCBSZWdhcmRzLg0KQXJ1biBSIE11cnRoeQ0KLS0t
LS0tLS0tLS0tLS0tLS0tLQ0K
