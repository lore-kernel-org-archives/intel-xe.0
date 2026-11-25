Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1218E606A31E
	for <intel-xe@archiver.kernel.org>; Wed, 25 Nov 2026 14:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=axB0u5ln;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=W3LrOCq/
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C45D410FCB4;
	Wed, 25 Nov 2026 14:56:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E2E510FCA9
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Nov 2026 14:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795618552; x=1827154552;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=zo6yLjG3FAKKRm8qABZ2W1pp90lOuHdc+ZwstcOLHlc=;
 b=axB0u5lnIE/CPajLBNowaoYDnOyZQuVzftarawa/F8pA2B4/OE8Ef+RN
 VFPdfbgnQfDGvuo28ak5vsbFbuSLtI7Rc75p+345vG9cFhnrBFOu43wCx
 eUzXSr6+f4BA3o88D931z/op5qpGlDwiNcRXeZ+/seH4n7Jij3TfpPL9d
 prxIpP1DQOZSi7sf6GASF/YHTzc6wETxnonok9FIMLl6DMpxQojaZMlHW
 XGPiMkcwlni9LXeUnHOnB4q4GeNV95bo7mNYEmaKTSI15qdfugahWrXiX
 /RCP+qLkg8gsLr/hx8lLpuvpODgYM2C3fMthIPtPSKDWN5/QOxaJ6g8vi g==;
X-CSE-ConnectionGUID: +kVdrHqITKW7vQKJZK3J/A==
X-CSE-MsgGUID: iinMgduySqy0viZDRCJXMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4426774"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4426774"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 06:55:51 -0800
X-CSE-ConnectionGUID: 1EhVVWSKRTqDdFqBlCH02Q==
X-CSE-MsgGUID: P7+xRBFoRX6q4LZ648RROw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; d="scan'208";a="11767653"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 06:55:51 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 06:55:50 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Wed, 25 Nov 2026 06:55:50 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.40) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 06:55:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lv+7loXHMGJRhEwp0VqkxSfzCF6+LX+gyG814Mg1MTr43v3GbN1F9SKWJTBQTXoxktTWsbfAZeU+pmO5/KQXcjYr3yWBWFA7aZiL5Y/ijPLcnLd9zVuOomAtAZSo/GaIIF63YNxx2UIvNIsWi4xbP6d2Nt9DitwlQZak4xnAh42jWIN7dDn0JrLxcH94Afr7VNDb7w9nucUYRqxP14ZyqLYBiyA+VZEErYOsIBg8GZpPAu7pnWSHmA5vjitrttbfVInXbuG7yCMC3LAP3naCAJoCag2ethgT0tnjSANhL/IetnDhSHf5wWewQxkcEh8E8v58IBKC+Pvnu27HZiLJyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zo6yLjG3FAKKRm8qABZ2W1pp90lOuHdc+ZwstcOLHlc=;
 b=w9V5T3y56NX9jsooL1s9khEFDELGUHKKl9f2JCz/V99vxVuWnlbMKwcFkpuTbGvmISo6TIYoKuc6QQnwi+jPj3ttmKO4o7muQbsmIAcyh6HZTqEMIfxHoklxrxd2bt4Pl4HmHHvroz1WN8vGrsyMyN3NQpUxwBPWgOVkGhi76JHCvDWSV0/ESlyo+b/osfUPy3I+PhYszJknEtC3GTNv/pLaoH8o74t0ZqS03mEubFk6ACirWL/IXJ35DNeHMuac8U4UFDF7E2VVEuvJlJ/Hzh+6nGp7NcrT7V60B7g1A7hJ4h/9iStEk8X5PRKWlTUNQ+SPQbIrxXfJuh/WX56WRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zo6yLjG3FAKKRm8qABZ2W1pp90lOuHdc+ZwstcOLHlc=;
 b=W3LrOCq/ysYAqIMzkT7fdyg1UQ9RP7NNSFJQ0l8hix9gp16cV7SsmI4oeZPY8gzDbx9qPy2iT7Gy0tGDwhDZcssBbJvqVGcQhrkgcegsNiwr4HbIml8UflGa87AOfuj7KnvIA4U68Faz4UCQSQChX5c93GKB8cv0MQmdFQEp4xo=
Received: from DS0PR11MB7733.namprd11.prod.outlook.com (2603:10b6:8:dc::19) by
 DSVPR11MB9717.namprd11.prod.outlook.com (2603:10b6:8:34c::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.14; Wed, 25 Nov 2026 14:55:47 +0000
Received: from DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::3e49:3435:98fa:130f]) by DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::3e49:3435:98fa:130f%3]) with mapi id 15.21.0662.001; Wed, 25 Nov 2026
 14:55:47 +0000
From: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Tangudu, Tilak Tirumalesh" <tilak.tirumalesh.tangudu@intel.com>, "Narvaez,
 Jesus" <jesus.narvaez@intel.com>, "K V P, Satyanarayana"
 <satyanarayana.k.v.p@intel.com>, "Summers, Stuart"
 <stuart.summers@intel.com>, "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "Piorkowski, Piotr" <piotr.piorkowski@intel.com>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH 2/4] drm/xe: Add MI_SEMAPHORE_WAIT_64 instruction
 definition
Thread-Topic: [PATCH 2/4] drm/xe: Add MI_SEMAPHORE_WAIT_64 instruction
 definition
Thread-Index: AQHdc4gTipSxNVJaGEaU8avaAK5LZrc2n90AgABNoaCABPeV8IACahvwgACj2QA=
Date: Wed, 25 Nov 2026 14:55:47 +0000
Message-ID: <8049b2d9f1fef222a37dc5efe6f661cf0aeac381.camel@intel.com>
References: <20261113155734.4164230-1-tilak.tirumalesh.tangudu@intel.com>
 <20261113155734.4164230-3-tilak.tirumalesh.tangudu@intel.com>
 <1334be6a-b10d-48ba-acdd-81b54e0cc15b@intel.com>
 <DS4PR11MB131308979BF5529C7AEA338F72C8782@DS4PR11MB131308.namprd11.prod.outlook.com>
 <DS4PR11MB1313087323AD767C4484EC94D8C8452@DS4PR11MB131308.namprd11.prod.outlook.com>
 <DS4PR11MB13130841BCD43C2A80DA7ACB7EC8432@DS4PR11MB131308.namprd11.prod.outlook.com>
In-Reply-To: <DS4PR11MB13130841BCD43C2A80DA7ACB7EC8432@DS4PR11MB131308.namprd11.prod.outlook.com>
Accept-Language: en-SE, en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.58.3 (3.58.3-2.fc43) 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7733:EE_|DSVPR11MB9717:EE_
x-ms-office365-filtering-correlation-id: d35bf9e9-a601-45b0-825c-08df4b043052
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|10070799003|18002099003|22082099003|3023799007|921020|260925021311599003|56012099006|5023799004|260925022911599003|260925021911599003|261021121427099003|11063799006|4143699003|261028144727099003|261102123227099003|261022105027099003|261026121527099003|261009223027099003|261026140227099003|261022075727099003|261022113327099003|38070700021|10067099003;
x-microsoft-antispam-message-info: nxis9DP3G7LuptoW75JLgGrIY/GX2eU5M/a0Eh3w2RLI3psARV8IHu8APHqhTZpbBwOoWq/ahWl7rcl2VonPEz7CPbeH4fRny0MdzJYA2EF7Wu6zkImN/kKh5iN8Hpw10ljjpoESZ4pj9womAPEttSBU8rw8N1fjH0LKB+E2GO7QpsEarFMGH6nlVL+I2Cb56O0ZrTrg/b9bUtY8w9Lu6CbzkdbPDEF4TKCD9D/xuxQ76uOjJ+QHlmGA3XhOgfhbRSVABifoONL9QBzMsCY+S3SczGKgN27VFIl7YQamP7oO83WBoXTTKaKC8Gq6WkfcVpSOxYO0GfYBi7Wsvell/mK+FcJT5DTBv7xEPGl2bCs9S3ijtO/TbKpkpO2Ep8fZnjzSGq7xCbBBq0Qfep5sl5ydMhG2xIM5ESxwxvVH//wqEXDq+SWaGTfT1+TBFRt/s66VVN9AX6qxwZqVWCOmpr/+vLEqG0EPE+2Adqxu1Ety6ie0iWQu2pdLzFxlWWkHyYtS5EwlSRfME96LQrgJLTXTMEWoZbO8vZbCN2pcY5gSOEkFWDNgStC8yUWDs/kvbsBVp/pQb9cR0jt2u6awOngJCE22/09aj2PhpwAlywbRJlmMuPGOL+svL6zKuRJl9J5Euup/c3soYFWzKG4xf0H5e9Kkdilkb8AUaG70xDC/K6K5IfkvGGRniKQzgRWZB5Vb4W/W8tounlPIsJdov0kX8AjepqqjVKr9JQnhgM4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7733.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(10070799003)(18002099003)(22082099003)(3023799007)(921020)(260925021311599003)(56012099006)(5023799004)(260925022911599003)(260925021911599003)(261021121427099003)(11063799006)(4143699003)(261028144727099003)(261102123227099003)(261022105027099003)(261026121527099003)(261009223027099003)(261026140227099003)(261022075727099003)(261022113327099003)(38070700021)(10067099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Qy9hc3R4YmN1M2w0QXZWaXhCUzBucjc0eFNpZjlyY0JSSEk1UTk1L3FZMEdO?=
 =?utf-8?B?SkhOSXNBc3F6WGVJQ1VlWGZQV3lYUXJSRWJPNUtOYk5mSXB3bFFUVzdWeDZC?=
 =?utf-8?B?c05wRmdXandSb2Vjd0xwRkpFdngva21yQTFtZHpXa1dQcGVyTVJKMUxtVnFh?=
 =?utf-8?B?bVU0Q1dGbFg1VzdkckhCS3d2Qm1OVHJLbkxWRlVqRHNUTlI5UlcvOWRaWndO?=
 =?utf-8?B?NGFVcWdNNkQ2Znp0cXgwakFxK1pZMEFIZk90d09tbXRGS3hnY1Q2akNERnBI?=
 =?utf-8?B?b1BIMkFoYXc1ZitWV1k1aFRwSFVKL1E3dVo4Mk9vUEQ2UTZ0eW9jY3RCKzJO?=
 =?utf-8?B?YkF4VEJkSjZHSGdkek9QOVZIcjRkNzBzVkpzYWJyN1J2K2lZc2xqdnJCei96?=
 =?utf-8?B?TFdrT2lhL2N2eHZiYzBLWktmOXVHNlMrYjVVUklZMHBITkZNQS9VeDlBQVh4?=
 =?utf-8?B?QlI4TVNvZFF2dmt5Qy9Kb3o1NjY5M2tMemx4bVV2TTZTbVR2aDZ6NHAyaHRa?=
 =?utf-8?B?RVV3VmdVZlUvOUtWOHVvQzh2UDFvaGRiOHMzZjFYeTZyQlNrMTFpN1RId213?=
 =?utf-8?B?VnRUa3JuaDhzR2xZMjVWdnVMRzVJekdveVAxVlRvN1FBeGlld0xlNWM5Slgy?=
 =?utf-8?B?ZklCNTl0WmZqT09HYVVqQ0poSmhHWXVISy9HbkVja0JaMkhoVkVsdDU1NVJp?=
 =?utf-8?B?eUo1UzJCQVI4bGJuQzRPbktndjZxSHhlR0lMY0tTTWRsM3RJYnNhdllPazBo?=
 =?utf-8?B?V1RUcytBNW9rTmRBMVgxbGhFTDBHbWFWVTBEOXcxdkFyaWdsT1RyV1FiblJT?=
 =?utf-8?B?NHZXbTNCUko4cFNYWWw0UVFzVGJjY1pvSGVHSktGN2NQOFJWdXh5UFJENGJP?=
 =?utf-8?B?MHpVTTNvMmF4MmtCSHdKeU5qYSs4YmwwRGs2UkdPL25YWFVwQ29Sa1hFQXZT?=
 =?utf-8?B?blI0TkFZSXhsL0FaaXpteko4d1lhRjU3K2JDcWJHOHFuWFJmekpvL296KzJm?=
 =?utf-8?B?cTRoQ2FqL3IxMVAvQndhNmlOMVNsaldNVlEwMW1vMk9xQllqRWxzQWVMMmFP?=
 =?utf-8?B?R2V6OFFCT290b3hqZWFaelN0NG04ZWNQZG93Q2lnZW9JWlc5Q2EzZWdDRTMz?=
 =?utf-8?B?cjNYeC9jWFZnL3JrdVhwWHBkNEtyNEJJOG13TjdHbGlrYnZHaDV0LzZtcXlx?=
 =?utf-8?B?Y0g1RW9GTkV4eVc2YU9JVCtRbW9HaTJnK3J5YzF6UmQxeFU0Y3paQ2dIemlB?=
 =?utf-8?B?RzBUWWRweklHZGNtVUkyenB6NlRxWGJoNEg4NzFxcDhJY2dwd2JOSmIzZm0x?=
 =?utf-8?B?YmNPMm9Fdi9janRoU2dteDNKYTEvNVNla2hTL3lUZVFtaVdPUUw3RHRrZnhN?=
 =?utf-8?B?YVp0SkkzZ3YrNUI0aHhKaXlOSWF6VTM2Rm9lU1h4enNyTmFXS1diR01zR0ls?=
 =?utf-8?B?MDU4TEtnV3krZ0kvTGFhVGo4RHV3aVUvL3lXRGswV09FeUdsMUNjREhpeks3?=
 =?utf-8?B?MW1xQnMyQXdhZElLMklwRHB5R2dnOFo4MW1DMkgwY2hSUHJVZXN4WVRwT1V0?=
 =?utf-8?B?eVkxTGJiNUZVM1E1OUh6T1lSZGI1QUprRmNCNkl1bnhUc05nMStMVmllY3hp?=
 =?utf-8?B?ck9ZMG9iWDI3aEQ0TTdlSCs4Wk94bHJZNFNtYjJJUVA2TzhwMEhWWHhUakx0?=
 =?utf-8?B?VXFPcFhpK1dUTWFlelVreWdLN2lHMHA1dWxJVlFLQnZITVRxV3picHlRRGpF?=
 =?utf-8?B?R2p6dXl2dWRsYURxRkpMZmNpeEZ1YWNaMWVwVGV4UDEyS3ZoU202Y3lkZkln?=
 =?utf-8?B?REZ2cDVKemVtMnpOdVVQVUFVdWZzRU83Wlk1b3lYc1A5ZWM0K2E0L0RXUmJp?=
 =?utf-8?B?L1QvbzNmMGdnOERBRDljTmZuYTRScXlQWjM4aDhwNGhiRWVuQlFRdXR1Vjhr?=
 =?utf-8?B?RE02TmhTS0FWdWdaYllDMUZhUzVEZnJOSGNaQmVUUm45L2VoQVFFemIvcEpU?=
 =?utf-8?B?U0NDU3NURU1meHgzM1pmdGxkQkJwYW5jeGlCZ3ExNkRYdG9pUHB0TEhqMXVR?=
 =?utf-8?B?Smd0blh5Zi9YTnBQVWRUck5EUURUWmZRK2NVZ2pKOTBkUjlldHA3R05OejBt?=
 =?utf-8?B?NHM0YTBKc1prUkd6U095SXd2TG9MMXQrZXE4d0VIK2JvaHAybUhHNVZzcm1Q?=
 =?utf-8?B?Z1B0SUxKYWVtUENyN2pwUFN4czdPbk9FblU5OG9BSHJSV2RiYjIvdGEvRWdF?=
 =?utf-8?B?MVJKWXUwNjZqTE5KdVZsMmpvMFF5NmdLZ2tvbDZJd3JxUTBBVmNZN2gzVXc4?=
 =?utf-8?B?RXVib1pDSjBvcEFaUUZHOC9hR3pFbXorWU4xOVZEMGp4MEZJdFdxVWhCQVFH?=
 =?utf-8?Q?6zHPueKSP0AHc0uBl7lDCZXlDesYUJIwvl6uGy47eL474?=
x-ms-exchange-antispam-messagedata-1: /CBsy1vVL8aeQg==
Content-Type: text/plain; charset="utf-8"
Content-ID: <0EFAD323FA4DFE4EBAE509D09590556D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: CHJmnO5w9nU4iIoRqBp8+NQQkvPWgL7bivRQlDTifM25YTfrft+skXrs47gB1P1rLG4ra8VqiIYGmsM0OFXxZYRgb2ap9ajkzBlK/WrAmYgrR87y6n2s/n2uIuY3+ekRXgDGz0x6sUHD/K/IQFBtglxppnhLR8HxqqK0MjsU+XWqbfgL5ZoPq3hsNHB7NI9pa/0xEzca+gaUPS4gdbjKwzHF6hNPyG1q7qdwLu6QD8pzHKAY4a5hLqWzYnDIf5LWXuHbzx8uyMaRgRQv5B1u0S46oE5oNdxHLc+TCzwOXK5Ch7aXBAGeGRK/ty6EobVX/zo+d1pf6w3c10Z7Z//iTA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d35bf9e9-a601-45b0-825c-08df4b043052
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2026 14:55:47.1887 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +dnW19xGz4WCyICpjHtjoIvq9rOOAR31vomcNhDyjPGvAXcBzu5km9E8JqaPeQDVTZJdDAGK3uxHBf6OxUNhLCM6PE2UkyztPOX4xBB8ISQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR11MB9717
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

T24gV2VkLCAyMDI2LTExLTI1IGF0IDA1OjEyICswMDAwLCBUYW5ndWR1LCBUaWxhayBUaXJ1bWFs
ZXNoIHdyb3RlOg0KPiANCj4gDQo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiBG
cm9tOiBUYW5ndWR1LCBUaWxhayBUaXJ1bWFsZXNoDQo+ID4gU2VudDogMjMgTm92ZW1iZXIgMjAy
NiAyMTo0OA0KPiA+IFRvOiBLIFYgUCwgU2F0eWFuYXJheWFuYSA8U2F0eWFuYXJheWFuYS5LLlYu
UEBpbnRlbC5jb20+Ow0KPiA+IFBpb3Jrb3dza2ksIFBpb3RyDQo+ID4gPFBpb3RyLlBpb3Jrb3dz
a2lAaW50ZWwuY29tPjsgTmFydmFleiwgSmVzdXMNCj4gPiA8amVzdXMubmFydmFlekBpbnRlbC5j
b20+Ow0KPiA+IENlcmFvbG8gU3B1cmlvLCBEYW5pZWxlIDxkYW5pZWxlLmNlcmFvbG9zcHVyaW9A
aW50ZWwuY29tPjsgU3VtbWVycywNCj4gPiBTdHVhcnQNCj4gPiA8c3R1YXJ0LnN1bW1lcnNAaW50
ZWwuY29tPjsgJ2ludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZycNCj4gPiA8aW50ZWwtDQo+
ID4geGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPjsgUm9wZXIsIE1hdHRoZXcgRA0KPiA+IDxtYXR0
aGV3LmQucm9wZXJAaW50ZWwuY29tPg0KPiA+IFN1YmplY3Q6IFJFOiBbUEFUQ0ggMi80XSBkcm0v
eGU6IEFkZCBNSV9TRU1BUEhPUkVfV0FJVF82NA0KPiA+IGluc3RydWN0aW9uDQo+ID4gZGVmaW5p
dGlvbg0KPiA+IA0KPiA+IA0KPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+
IEZyb206IFRhbmd1ZHUsIFRpbGFrIFRpcnVtYWxlc2gNCj4gPiA+IFNlbnQ6IDIwIE5vdmVtYmVy
IDIwMjYgMTg6MDYNCj4gPiA+IFRvOiBLIFYgUCwgU2F0eWFuYXJheWFuYSA8U2F0eWFuYXJheWFu
YS5LLlYuUEBpbnRlbC5jb20+Ow0KPiA+ID4gUGlvcmtvd3NraSwNCj4gPiA+IFBpb3RyIDxQaW90
ci5QaW9ya293c2tpQGludGVsLmNvbT47IE5hcnZhZXosIEplc3VzDQo+ID4gPiA8amVzdXMubmFy
dmFlekBpbnRlbC5jb20+OyBDZXJhb2xvIFNwdXJpbywgRGFuaWVsZQ0KPiA+ID4gPGRhbmllbGUu
Y2VyYW9sb3NwdXJpb0BpbnRlbC5jb20+OyBTdW1tZXJzLCBTdHVhcnQNCj4gPiA+IDxzdHVhcnQu
c3VtbWVyc0BpbnRlbC5jb20+OyBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gPiA+
IFN1YmplY3Q6IFJFOiBbUEFUQ0ggMi80XSBkcm0veGU6IEFkZCBNSV9TRU1BUEhPUkVfV0FJVF82
NA0KPiA+ID4gaW5zdHJ1Y3Rpb24NCj4gPiA+IGRlZmluaXRpb24NCj4gPiA+IA0KPiA+ID4gDQo+
ID4gPiANCj4gPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+ID4gRnJvbTog
SyBWIFAsIFNhdHlhbmFyYXlhbmEgPHNhdHlhbmFyYXlhbmEuay52LnBAaW50ZWwuY29tPg0KPiA+
ID4gPiBTZW50OiAyMCBOb3ZlbWJlciAyMDI2IDEzOjE4DQo+ID4gPiA+IFRvOiBUYW5ndWR1LCBU
aWxhayBUaXJ1bWFsZXNoDQo+ID4gPiA+IDx0aWxhay50aXJ1bWFsZXNoLnRhbmd1ZHVAaW50ZWwu
Y29tPjsNCj4gPiA+ID4gUGlvcmtvd3NraSwgUGlvdHIgPHBpb3RyLnBpb3Jrb3dza2lAaW50ZWwu
Y29tPjsgTmFydmFleiwgSmVzdXMNCj4gPiA+ID4gPGplc3VzLm5hcnZhZXpAaW50ZWwuY29tPjsg
Q2VyYW9sbyBTcHVyaW8sIERhbmllbGUNCj4gPiA+ID4gPGRhbmllbGUuY2VyYW9sb3NwdXJpb0Bp
bnRlbC5jb20+OyBTdW1tZXJzLCBTdHVhcnQNCj4gPiA+ID4gPHN0dWFydC5zdW1tZXJzQGludGVs
LmNvbT47IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiA+ID4gPiBTdWJqZWN0OiBS
ZTogW1BBVENIIDIvNF0gZHJtL3hlOiBBZGQgTUlfU0VNQVBIT1JFX1dBSVRfNjQNCj4gPiA+ID4g
aW5zdHJ1Y3Rpb24gZGVmaW5pdGlvbg0KPiA+ID4gPiANCj4gPiA+ID4gDQo+ID4gPiA+IE9uIDEz
LU5vdi0yNiA5OjI3IFBNLCB0aWxhay50aXJ1bWFsZXNoLnRhbmd1ZHVAaW50ZWwuY29twqB3cm90
ZToNCj4gPiA+ID4gPiBGcm9tOiBUYW5ndWR1IFRpbGFrIFRpcnVtYWxlc2gNCj4gPiA+ID4gPiA8
dGlsYWsudGlydW1hbGVzaC50YW5ndWR1QGludGVsLmNvbT4NCj4gPiA+ID4gPiANCj4gPiA+ID4g
PiBXYV8xNjAyOTI4MTkxMyByZWNvbW1lbmRzIHVzaW5nIHRoZSBNSV9TRU1BUEhPUkVfV0FJVF82
NA0KPiA+ID4gPiBpbnN0cnVjdGlvbg0KPiA+ID4gPiA+IGluc3RlYWQgb2YgdGhlIGxlZ2FjeSBN
SV9TRU1BUEhPUkVfV0FJVCwgZHVlIHRvIGFuIGlzc3VlIHdpdGgNCj4gPiA+ID4gPiB0aGUNCj4g
PiA+ID4gPiBsZWdhY3kgc2VtYXBob3JlIG9uIHNvbWUgWGUzcCBwbGF0Zm9ybXMuDQo+ID4gPiA+
ID4gDQo+ID4gPiA+ID4gQXNzaXN0ZWQtYnk6IExMTQ0KPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6
IFRhbmd1ZHUgVGlsYWsgVGlydW1hbGVzaA0KPiA+ID4gPiA+IDx0aWxhay50aXJ1bWFsZXNoLnRh
bmd1ZHVAaW50ZWwuY29tPg0KPiA+ID4gPiA+IC0tLQ0KPiA+ID4gPiA+IMKgIGRyaXZlcnMvZ3B1
L2RybS94ZS9pbnN0cnVjdGlvbnMveGVfbWlfY29tbWFuZHMuaCB8IDYgKysrKysrDQo+ID4gPiA+
ID4gwqAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQ0KPiA+ID4gPiA+IA0KPiA+ID4g
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUvaW5zdHJ1Y3Rpb25zL3hlX21pX2Nv
bW1hbmRzLmgNCj4gPiA+ID4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS9pbnN0cnVjdGlvbnMveGVf
bWlfY29tbWFuZHMuaA0KPiA+ID4gPiA+IGluZGV4IDgzNWVmNzViYmViMS4uMTg2YzlhYzM1ZTVi
IDEwMDY0NA0KPiA+ID4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS9pbnN0cnVjdGlvbnMv
eGVfbWlfY29tbWFuZHMuaA0KPiA+ID4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS9pbnN0
cnVjdGlvbnMveGVfbWlfY29tbWFuZHMuaA0KPiA+ID4gPiA+IEBAIC0zNCw2ICszNCw3IEBADQo+
ID4gPiA+ID4gwqAgI2RlZmluZQ0KPiA+ID4gPiA+IE1JX0ZPUkNFX1dBS0VVUAkJCV9fTUlfSU5T
VFIoMHgxRCkNCj4gPiA+ID4gPiDCoCAjZGVmaW5lIE1JX01BVEgobikJCQkoX19NSV9JTlNUUigw
eDFBKSB8DQo+ID4gPiA+IFhFX0lOU1RSX05VTV9EVygobikgKyAxKSkNCj4gPiA+ID4gPiANCj4g
PiA+ID4gPiArLyogV2FfMTYwMjkyODE5MTM6IE1JX1NFTUFQSE9SRV9XQUlUIGhhcyBhbiBpc3N1
ZSBvbiBzb21lDQo+ID4gWGUzcCwNCj4gPiA+ID4gdXNlDQo+ID4gPiA+ID4gK01JX1NFTUFQSE9S
RV9XQUlUXzY0ICovDQo+ID4gPiA+IERvIHdlIG5lZWQgdG8gbWVudGlvbiB0aGlzIGluIHRoZSBy
ZWdpc3RlciBkZWZpbml0aW9uIGZpbGU/DQo+ID4gPiANCj4gPiA+IEkgbWlzc2VkIHRoaXMgY29t
bWVudCwgYXBvbG9naWVzDQo+ID4gPiANCj4gPiA+IEFncmVlZCB3aXRoIFNhdHlhJ3MgY29tbWVu
dC4gQnV0IHRoZW4gaG93IGRvIHdlIHByb21wdCBmdXR1cmUNCj4gPiA+IHVzZXJzDQo+ID4gPiBu
b3QgdG8gdXNlIHRoZSBsZWdhY3kgc2VtYXBob3JlIG9uIHBsYXRmb3JtcyB0aGF0IHN1cHBvcnQg
c2VtNjQ/DQo+ID4gPiANCj4gPiBAUm9wZXIsIE1hdHRoZXcgRA0KPiA+IEFueSBjb21tZW50cyBv
ciBzdWdnZXN0aW9uIGhlcmU/DQo+ID4gPiBTdHVhcnQvRGFuaWVsZSwgYW55IHN1Z2dlc3Rpb25z
IGhlcmU/DQo+IEBIZWxsc3Ryb20sIFRob21hcw0KPiBBbnkgc3VnZ2VzdGlvbnMgb24gdGhpcz8N
Cg0KTm90aGluZyBuZWF0Lg0KSWYgbmVlZGVkIG9uZSBjb3VsZCBwZXJoYXBzIGNoYW5nZSB0aGUg
bWFjcm8gdG8gc29tZXRoaW5nDQp0aGF0IHdhcm5zIGlmIHVzZWQgb24gZGVidWcgYnVpbGRzIG9u
IGRldmljZXMgd2hlcmUgdGhlIFdBIGlzIGFjdGl2ZT8NCg0KQnV0IHRoYXQgd291bGQgYWxzbyBt
YWtlIGl0IGludG8gdGhlIHJlZ2lzdGVyIGRlZmluaXRpb24gZmlsZS4NCg0KVGhhbmtzLA0KVGhv
bWFzDQoNCg0KDQoNCg0KDQo+IA0KPiA+ID4gDQo+ID4gPiAtVGlsYWsNCj4gPiA+IA0KPiA+ID4g
PiA+IMKgICNkZWZpbmUgTUlfU0VNQVBIT1JFX1dBSVQJCShfX01JX0lOU1RSKDB4MWMpIHwNCj4g
PiA+ID4gWEVfSU5TVFJfTlVNX0RXKDUpKQ0KPiA+ID4gPiA+IMKgICNkZWZpbmXCoMKgIE1JX1NF
TVdfR0dUVAkJCVJFR19CSVQoMjIpDQo+ID4gPiA+ID4gwqAgI2RlZmluZcKgwqAgTUlfU0VNV19S
RUdJU1RFUl9QT0xMCQlSRUdfQklUKDE2KQ0KPiA+ID4gPiA+IEBAIC00OCw2ICs0OSwxMSBAQA0K
PiA+ID4gPiA+IMKgICNkZWZpbmXCoMKgIE1JX1NFTVdfQ09NUEFSRShPUCkNCj4gPiA+ID4gCVJF
R19GSUVMRF9QUkVQKE1JX1NFTVdfQ09NUEFSRV9PUF9NQVNLLA0KPiA+ID4gPiBDT01QQVJFX09Q
XyMjT1ApDQo+ID4gPiA+ID4gwqAgI2RlZmluZcKgwqAgTUlfU0VNV19UT0tFTih0b2tlbikNCj4g
PiA+ID4gCVJFR19GSUVMRF9QUkVQKFJFR19HRU5NQVNLKDksIDIpLCAodG9rZW4pKQ0KPiA+ID4g
PiA+IA0KPiA+ID4gPiA+ICsjZGVmaW5lIE1JX1NFTUFQSE9SRV9XQUlUXzY0CQkoX19NSV9JTlNU
UigweDNiKSB8DQo+ID4gPiA+IFhFX0lOU1RSX05VTV9EVyg3KSkNCj4gPiA+ID4gPiArI2RlZmlu
ZcKgwqAgTUlfU0VNVzY0X0lOVEVSUlVQVAkJUkVHX0JJVCgyMCkgLyoNCj4gPiA+ID4gPiByYWlz
ZXMNCj4gPiB0aGUNCj4gPiA+ID4gc2VtYXBob3JlLWZhaWwgaW50ZXJydXB0ICovDQo+ID4gPiA+
ID4gKyNkZWZpbmXCoMKgIE1JX1NFTVc2NF8zMkJfQ09NUEFSRQkJUkVHX0JJVCgxOSkNCj4gPiA+
ID4gPiAvKiAwOiA2NGINCj4gPiA+ID4gY29tcGFyZSAoZGVmYXVsdCksIDE6IDMyYiBjb21wYXJl
ICovDQo+ID4gPiA+IA0KPiA+ID4gPiBDaGVjayBhbGlnbm1lbnQgaGVyZS4NCj4gPiA+ID4gDQo+
ID4gPiA+IC1TYXR5YS4NCj4gPiA+IEFkZHJlc3NlZA0KPiA+ID4gPiANCj4gPiA+ID4gPiArI2Rl
ZmluZcKgwqAgTUlfU0VNVzY0X0lOSElCSVRfQ1RYX1NXSVRDSAlSRUdfQklUKDE1KSAvKiBwb2xs
DQo+ID4gPiA+ID4gaW4NCj4gPiA+ID4gcGxhY2UsIGRvbid0IHN3aXRjaCBvdXQgb24gZmFpbCAq
Lw0KPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiDCoCAjZGVmaW5lIE1JX1NUT1JFX0RBVEFfSU1NCQlf
X01JX0lOU1RSKDB4MjApDQo+ID4gPiA+ID4gwqAgI2RlZmluZcKgwqAgTUlfU0RJX0dHVFQJCQlS
RUdfQklUKDIyKQ0KPiA+ID4gPiA+IMKgICNkZWZpbmXCoMKgIE1JX1NESV9MRU5fRFcJCQlHRU5N
QVNLKDksDQo+ID4gPiA+ID4gMCkNCg==
