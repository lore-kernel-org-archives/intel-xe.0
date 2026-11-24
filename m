Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E37B606A31E
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 10:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dHyGiiat;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=DQv/a5gG
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B14C10F48B;
	Tue, 24 Nov 2026 10:50:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB11D10F46F
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Nov 2026 10:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795517428; x=1827053428;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=Q4hHwjQgiBC2dF/iP70eV8c6R1/un2UWPDm1Q2XKN3Y=;
 b=dHyGiiat6tP/04TvTRV+fW7RmFsXmJIkuRffqyxtd5ZjSMhfwfCwlXGa
 QIrAtUvtnrgMmD0cqp6lN9lgj14esNNLFK5zFBrlDYvdXyCB4sPxNxnAI
 vDaXSRjNv7OZGoFflwDb2lQr5v+w2DpzzCs/Z/npz4Scf1nXEa6FfQHlx
 R774td7xqgxXZ0Deyd/jm60xXfjcPUUyE57JZ9uSeg3jhpjrAWOwI+ouh
 NMnBWZdxqdMNJID8xaMA+APTlMFHCmxc9ZxRPdWytQiavcI007VT95oE2
 MyLT7PAdajBFZAI1T2VRs65bU1IJXGj5lFKABkNHIL5wQrPWeoSXI7i1Z w==;
X-CSE-ConnectionGUID: aQt9lJ9ETba13aCD3gOIDw==
X-CSE-MsgGUID: MSn5oEp6QEK/pPdl3IpfwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4244747"
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="4244747"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 02:50:27 -0800
X-CSE-ConnectionGUID: sqak5sePTp6eMdwK5YoIww==
X-CSE-MsgGUID: YPPsQj9YQBSDShNRfV0VhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; d="scan'208";a="13225231"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 02:50:27 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 02:50:26 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Tue, 24 Nov 2026 02:50:26 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.1) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 02:50:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CWb5uHvzjnZMsNTgcsrLxJZWo8YrQg3eSBCsfomWGJiqggsPrzJSnI+rg5v3eUjpLfA5ywjogVDgadtYKXeoet7fHDBsBSOOyDIRwsgm51edH9vtjX3VZAFbdBrZ4leLC2RYH64Bq6EbKU662/fF1A5NCZmEcxT2ZAc4MT8B2hmZ09aJNBXuy4P/qex6WTlCjU6fBuvQpih1USxbFbG6rd3nrSwn2EmYrzcIWIdTFCt9ZTCcuq6Jrxz8pbx3MP85pXoCqX6FxwmDW2s6b9pFB+numLFwzj1lTg0cBNnHbQZ/mdsUff9ALhyweOA9BSwkdNhFaYhK3Cqj0m7zHxL1Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6/pvyn/wrrOQc8QKoXMz2AdcXgIlkrwA9MSYICU2cAU=;
 b=Q5GlPpkgpiFrREEe07bzmN6FQAxqjE9QxOSAD56j12App+xsdwlHjEfaEwQFXFrr9eCtFXQrPnEuKsCsn/WtxXViHWKLmWx6qHQz2sE4kP9kdq7rwo8c5zosQbMdxzTXTMX3nTbCbvXeORrvP/24ItqsljhlYE8UGtb/WWNDugUxsAM+JnC3AxvF/W32Jh3Q2L5oOl4YqWqGLG48pR5E+4qpT+a7SZqcJbpYqv7TiDdv7P8F9v1AgTuTVZulcUfDLDFTczxIPV7yChoxiw+fU1Z883rmYt0YNY2fY03VWMMl/I/b28KwjG/gRfRNtz2XA2nDnryNmEu8NH/fBmlkIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6/pvyn/wrrOQc8QKoXMz2AdcXgIlkrwA9MSYICU2cAU=;
 b=DQv/a5gGfg3OwsgX5yyvmxQyUX7nXTXIiKvpOW3Qm+VNNfuIAmwGnTO6u54I9gTM8Pdm3grmpJXEbbTlhKjyFLcEuvSBVPTOtSSeB4epyMoKA1yjrLodQl04RugMMAa6o3bz5vDSEEYcdKk21tMQh5G7vdDY/6mMbiDLFtcGdwk=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by LV8PR11MB8721.namprd11.prod.outlook.com (2603:10b6:408:203::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Tue, 24 Nov
 2026 10:50:20 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%3]) with mapi id 15.21.0662.001; Tue, 24 Nov 2026
 10:50:19 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v2 0/3] Prepare VFs enabling for VGPU profiles
Date: Tue, 24 Nov 2026 11:50:06 +0100
Message-Id: <20261124105009.3431301-1-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU6P191CA0007.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:540::22) To BY1PR11MB8054.namprd11.prod.outlook.com
 (2603:10b6:a03:52f::10)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|LV8PR11MB8721:EE_
X-MS-Office365-Filtering-Correlation-Id: 46377367-a6a0-4a2b-0225-08df4a18bb63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|261026140227099003|261028144727099003|261022105027099003|261021123027099003|261022075727099003|261021121427099003|261102123227099003|11063799006|56012099006|10067099003|261009223027099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: A7eZWyiuBrhsuu77J2RgM+qH8qsyTQoMv6MyDBAdw8cjwqZytsrHdAHV+Hwuy7XVovLoOudAN/zS7nXX2pJ9d+8e1dX+10p+gF12ud/8gdUNaI9DO9QD/B+TIOgt/XUbPnDBnrXgeNVYjGFUt/bv5gzk4l21PstWz3MOgbhf8zaSnwDk2pwubCbF44+WBU2wsA93E06dQs5iAyqlB9klBxWXPO+l+dz2k2GlBklOWr13bxN/YUjQFn2qwdIa+GrOMJgemL6XYrm0ZKIaa5zRzYRgEZw/7qGki/ovMJuJJh/RmY1sf9B8FtRSrx33zO0bwWaHkfI6WJ3M2RTYn6ifYFx7e2+X7j/vje4Ss2o2m6S1xgXugez4aPae18YhVG2mTLXsxUPscvKu90j4lfEUbggQFNnVmpTAxkPvtIDovBMMqiWYOeRZkzl/ZspUkp851HvAi1NQVpj7p9+uXn4xMNSYqdIsjD2mSN0i5HJBQW2GMYM3vnGNT7FWlZ4DJikJh3OrxIgv3liAsczg4sB1eZPwO9ASQK5HkQyjj2mGDQJaeu8eWVHUh/FcIwO7ViKLLkz84wmIJdARHxEGqL4/ErcwA5j5ivnWHaE98KzP7U/zBa2AU0F6zpbqXwI6YJr0QD3ouhNb2GpULqLNCjRjnbl58QUGWYNL7zfn3K2kW50=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(261026140227099003)(261028144727099003)(261022105027099003)(261021123027099003)(261022075727099003)(261021121427099003)(261102123227099003)(11063799006)(56012099006)(10067099003)(261009223027099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?clBUUGhOT2VDbE5QMi81UzIxZTBLd1g4TkkxanFsbmRBMk1MWTZHblpKQWhU?=
 =?utf-8?B?RjBZQ2JsQkUyMElXR3A2cFVhc1NwR1BKNjFGVitKb3lnZXdoSGlQZWtCMVVD?=
 =?utf-8?B?MmRGUVRnQzlEQ0F5TDFKYjZWeWFqenVDa1ZOUnpwS0hMWDdOeDREY1IvdUgz?=
 =?utf-8?B?bWZKb3BhcXVzVnZUZ1J3bFpxeGwyaXdyV3RXSHAxdVpOemF1djhUaTBYeUZq?=
 =?utf-8?B?T0R3OTNsNU50WUpneTlJdHdHY3FLdDZLUGlOcm8wUC9HOXRpREtYcFQyZVRS?=
 =?utf-8?B?a3JueXFIVngzd0NRS2xXMThwNjNYUlRZRXZMNWdvcCtTZU1WaWlVcDgwc0Z6?=
 =?utf-8?B?NHo5MmloL1JtcnIzSVJyRUJpNzBIMFViT25vL2FRQk9NTFVhUjYvWlUyN2p6?=
 =?utf-8?B?TGdRZDlkdlFwSncveWRuNmhCTUUwVjVrc3QydmU4ZTdPN0tTV0xybmt6b0wz?=
 =?utf-8?B?Z1p2SkpMeEpkcmNMZzNBd0NVa09KTXo1V01wdGtqUkZobnhQM1dqZjdQWlJz?=
 =?utf-8?B?anNreUsreVl0bFM1dUNFTUNkcmNqTXdpLzBYenl2TkM5MjlURFJNc01nVkEz?=
 =?utf-8?B?K1c1T2t0NU9hOGY3Z3h3Qk1kUWNta1BhS01hcG5jcXVLa0RiNWpFa3lBUWpP?=
 =?utf-8?B?OFNDVVBFUk5aaUo3b1FBOFBEVTd5ZkR2Njl2eHFOdytLMUFvK09TNk96b3NZ?=
 =?utf-8?B?MVJoeUhub0VKOGh1aHBlNEZmMU4yT25xYjNyemNnSGNUV0RkOFcwQ0JqdnlY?=
 =?utf-8?B?MUhJUHJpQmM1bUdKenloVUh5aEpQSWFRayt2V2U5NnAvTHlQaityZHpVQ3R5?=
 =?utf-8?B?eVVnb2VIWUFCZS9sTVdnbjRiSEFSSExPOTlzalFXMjQyeGlSY25yVmZvUklX?=
 =?utf-8?B?K3hGQ2R6a1lZbWo2N3llZjBIeldTeExMQk9hRlh3OUVIdFQ0eTlndnVDSEFP?=
 =?utf-8?B?R3lZL1ZrdFFET0JFeXhGdDdSSWFFcStRQ1pYL2ZqclJJY0EzTVZrbERUVndP?=
 =?utf-8?B?VjhmTURDUVhIcmM1VWVFdGhaSmJnZk5tU2N2Wjl1by9hcXNrQWczZ1N0dCtT?=
 =?utf-8?B?bS81YWVWdkhzRTFxTzJsNDhHK2JObDBPVm91WHY2TWJSUDh4VXhCaENsYzV2?=
 =?utf-8?B?M1ZsYnUya2lQOUNQY0lrWlM1clpZaW5OWEtkZGhTRS84Wi8xZHNTTHdsejNh?=
 =?utf-8?B?OW5tUzB3MEJmOW45Ti9YWlF5dDhLYlQ5bXZVcE1OZytnK3NUamRGdEFYUUF1?=
 =?utf-8?B?Y0s2WEdXN3ZVbzNOdmd5UEY3cXQ0THhIa25KR0IwZ3hTN3FCbGZIczBpRlBz?=
 =?utf-8?B?czJ5Z3Y5R3doYWRvUEkvNjY2UjFXaTNLMzBuQU9OR1lnVERMSFROTnF6S2tX?=
 =?utf-8?B?Qk5CcitUWW5GU2NsdTVOVEdaVzBxQWlySk1KRXNId002WmxILzlPWndhV2JV?=
 =?utf-8?B?dzRXUDdWd1lKNTRwRnlYZURVRktPb0FDYnEzRHd5MTNCOUQ5aVBqQzVUQU5u?=
 =?utf-8?B?bDlIaXQ2V3d2ekZ0WGk4OEVNSkFtTWZiR2tmT3dmNGtablVTVE8zOWxQL2Y0?=
 =?utf-8?B?RnpKZlZ2SFd2NUdTY1J5dHl0TnpMaG5keE5pQWttaFlGYXVHdEQxTFNCR1Bl?=
 =?utf-8?B?Q09ZdjdUZUNQVzFIVjMxVlJlRjA2bU44MFBXR0RCODVxRmd2NHYyUEp6OHNt?=
 =?utf-8?B?U3V3aUk1RUV0c0lzK29FZ2JoamZLUHQ5dmJuWlNZUjZaTXFuRjZVYUsxUkQ0?=
 =?utf-8?B?NUdWenowcWRtbk9Lcm94NDd2bFBQaVI2ZEdVaTFqQVFMRGZWMG4vN0s5UDk2?=
 =?utf-8?B?aGtVZnA5ZnBacXVINGs3bTM5UXFyYzg0OW5OQ3Q1ZVJ1Yiswa1NwN0VFL0VK?=
 =?utf-8?B?SWh4eTBMa3h4ellSWVp0dCtkQllJaTFLVjNYSmQ1TjBIc1pnN0ZoKzVOWkEz?=
 =?utf-8?B?dEF4aWNVZFovcmJmM2x4V25tV1haMm90ak5pbnFQOXFzQ2lXZ3RJWStOemVC?=
 =?utf-8?B?OVBCN0lZOEdWbURFN0pnNUc1bDZQNXl4MGRjS2dqZWdKY3lCRTdtVGljdjJN?=
 =?utf-8?B?bmtsSFhpT2pYVEJWbnhDR0VzTTMxRW9ET0dMYTdqQ1ZMdWRDM2l1TFZtYWRs?=
 =?utf-8?B?NXlMbHhZVXhLSkVqamxSYzRBL3VFaG1zeHZiM3I2UmtCVExLbkR3ZE1odUJC?=
 =?utf-8?B?K0NBczBXNXZEaDRUQ2xDWmZud3FrNjRkMUZnMDNnMEQrTDNNaHlMZXErS0VQ?=
 =?utf-8?B?eGMzY1pxMWhCblBnenR0OFNkOEt2WURtcXc5OGhFaWdBK0NWcGRyTlBYQlR5?=
 =?utf-8?B?WUswbkNpRDk3K2hDUWtYOWY0dUdsZ0ZaSW05Qktud3EyNG9FeGt6OGE1VmdU?=
 =?utf-8?Q?NzqYHemtkSEFiF3o=3D?=
X-Exchange-RoutingPolicyChecked: Sd16B/wCckGmeDnOLkk8O4wFgxbeTkdKfKJn+jRl/3j+zHRxMeLMqJQOuNcZJGxxdbAa1IcHCely3lP4c2CnDM0XzeHs98+8aYc8Z/pdeSL0QaEFSTDE2c2Vue1bJZacfB9PKHfSl5DEeoSqjyrREDRiCJPyn3QMAJYDoiHTLqmaEaTIV+jhGyfg2LwFLXyRAT8DfYyIp3DpqLYslMz4kdhXdu9J79NM+vxmd+ufEvtH6xhM8qmw0mWzZI8eKIc79B0JgIVAfbzQqERLQW7P+uyq+CaVKWtmbPsX0QAGKhpuNXOIrXMQ4dPwlEy4Tl3Dhp19ewHSMHuNuQcc411LWQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 46377367-a6a0-4a2b-0225-08df4a18bb63
X-MS-Exchange-CrossTenant-AuthSource: BY1PR11MB8054.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 10:50:19.8392 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tg27JiKoVRTlaydLzN97yPzDGaLgUpNVVkiDfR/7+20xhsVW+yHL5pbT7oE0MVYHFATE3pUmd/b6l9PQIKZg9e0fK77Vya0Tqyo/0Mv2XBk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8721
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

Split pf_enable_vfs() into prepare, provision and commit steps,
so the upcoming VGPU profiles code can reuse it with its own
provisioning step. Error handling stays the same.

v1 -> v2:
- pick up Marcin's fix for missing PF reprovisioning as 1/3 (Marcin)
- keep VFs unprovisioning and PF reprovisioning out of the revert
  helper, so the provisioning steps stay next to each other (Marcin)

Marcin Bernatowicz (1):
  drm/xe/pf: Restore default PF scheduling on failed VF enable

Michal Wajdeczko (2):
  drm/xe/pf: Extract VFs enabling revert helper
  drm/xe/pf: Split VFs enabling into prepare and commit steps

 drivers/gpu/drm/xe/xe_pci_sriov.c | 91 ++++++++++++++++++++-----------
 1 file changed, 60 insertions(+), 31 deletions(-)

-- 
2.34.1

