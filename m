Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82EA4606A325
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 09:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lWurEzoL;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=GJ5JeP9r
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4879C10E2E6;
	Fri, 20 Nov 2026 09:25:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 991A510E2B2
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Nov 2026 09:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795166747; x=1826702747;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=STxzCnCiECLKa53s3GIyYOhI7lGeI7RCjBwLoLzM5Bg=;
 b=lWurEzoLQgs325b5bN6pbYaQSGXSPSdnKQnXVm68FCyUU4V6djMoIR+p
 FpM9zxvZq04Etd+7rr/YaOiyeDgMS69dxl5rGOd52y23k44Tu9R79DEsg
 ddL4e6E6zYZ2y4bj+ylFodsEKx/rCf6Best4DQeFYTsaQXfi8Yf2+Livu
 rWk8nnB4ctWLxoujSKPSa/6W1yTwI1s0EI2xMftVM+XdF8imyOw1X4BBL
 tA+c3MDkXAjq/JEtjUYNNT+jWGqMk9CxeoeXtid4mJZm7PBfRhQQ3TXWm
 QMu7bzxZMqtErlKTNXoPM5AepkCmYDzE0RdK4PZemlx+cgd9Lqzba+ro1 Q==;
X-CSE-ConnectionGUID: 1OdgdWrpS0KL1d2skOShwQ==
X-CSE-MsgGUID: vTYoImMoSYGCamKQMRSRnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4044939"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="4044939"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 01:25:46 -0800
X-CSE-ConnectionGUID: bIl4qrxUSEyJH1J3a8T+BA==
X-CSE-MsgGUID: 0NuF3akGTXicG4QMK21gig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; d="scan'208";a="10652860"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 01:25:46 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 01:25:45 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 20 Nov 2026 01:25:45 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.29)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 01:25:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oEkKxQr1u+t/13Cro/tz3inSNZQYhNpFKswJn+bqVf9QxtSkVim1J4D0pw3ZmjQ0gseDEMngiBOCNFPUIOC0Ywc9D+Iq+ayYW9uEtu46/K6qQtClw4dsiWMjXDu+LvNT6Fa6RheRYMvaqyG9WDginofRUTDRsTXY2N+VRmumh0cZhNNy5J3ZtV7L/eBw7b72NCH1wqYFQJKo69wokSeCmcreIUn/Nua45YvrxL3MXq5szr0l5BjUyfdQxy65GuD9ttDtybVt0rxb3RvkReumVtVTsPQEahzCN+s4Ca7/jrMjtoIKhvHntvLGA+QiuzqFIEC2Co5EDVK1FUoFqjPGWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=npHuRNRMs0PuNotB2HeDs3tS+2ToNH0A7H2nWg1TYYE=;
 b=yhLbxaJ4uhhXbPvN0eFKUKY4ad4f2ddy6MwDMvGOJhvwfvPCky47TDDMLVVmbRGEd2INJh+p5spLxH40xBpNpPkH5kPBy8LidOObBMEdorTnUZQtOoyq4GyMcCSE6idLBhlJg8dx/zDt6dBy2lPX4wWV9XU3fkjOAvz/L7p6ejXzfscoXcuUjXVNGb94HHfA9Zxg27pDfkFSum7aoGzzURMcivHZB2h6axZSzL5YDzfnDe5bhMevGKrYMTU8RMnrZlBzMga+OqSH0AvrSjsqU/CGyY/0Up0yqKOjtaaAHpakz8D1sNyIrlTOx59sm1nhKdt98VAGOX1NGzosuQkPUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=npHuRNRMs0PuNotB2HeDs3tS+2ToNH0A7H2nWg1TYYE=;
 b=GJ5JeP9rIRdnc8xu+5oBMg2Z1AA7u6fx5e2vQ/nerxZfVlw3zt0YQHhnqCwcxyeJC7LaIe+hcqhVmsOLNkD5M05o2wariYtw5iryMX0RBByzn5uF1yK+9vezCvHco5qhwuXTwnf94oEMvzrlioT4ne6U8UBKBH1kCqgsOrmuKFU=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.10; Fri, 20 Nov 2026 09:25:37 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0639.010; Fri, 20 Nov 2026
 09:25:37 +0000
Message-ID: <689afa8d-99e8-4eeb-8d53-4e5bdda788e3@intel.com>
Date: Fri, 20 Nov 2026 14:55:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] drm/xe/wedge: Introduce xe_wedge_mode_is_no_reset()
To: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <stuart.summers@intel.com>
References: <20261119102344.2053821-1-raag.jadav@intel.com>
 <20261119102344.2053821-3-raag.jadav@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20261119102344.2053821-3-raag.jadav@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0003.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:176::12) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SA2PR11MB4874:EE_
X-MS-Office365-Filtering-Correlation-Id: 90a6a458-c19a-4ec6-f959-08df46e83c19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|10067099003|261028144727099003|56012099006|261026140227099003|11063799006|4143699003|261022075727099003|261021121427099003|261021123027099003|261022105027099003|261102123227099003|22082099003|261009223027099003|18002099003;
X-Microsoft-Antispam-Message-Info: PApBU+2zryuKYQ0oZbZo4LaZZB6dW32p00muvAkR65cDeyWM8AWqRhYtYi3W+XM57fiVwTHFMxr9EUvZOxCLgFXjMioFfHA9RnvaxIvgBG736dgLowqnHOp1ohIP91rZlFNQkWSQOSQFt4tX75VSntTWS0iX95gI0qOb/beHkgnV1bPQ92O/LsMTiHXMxtzm6lSV28nC5uJtnTlxo1qIZTF+dIUmHJ6Hdf373e5iAohFPh2v/cYPiLmD62JsfjSCXVq+WQ7sldhGXp/pLN0GyvIb+PrAQgHhgjG0P1sV6DzkBHff1Pnuj0vMPo3mob+0QcVdhxhnvUXEjkb81UiEC4w8Sd8FtdOgb3NZzJHCfLMT+NJT9u5Z76goG78Ey9kkdljA3CKrF7T7oPinq5ItTWo1BRK5huvRsvjLTUFPfnf6Pzj8uCeK2HxhRupcrGyPFTNWbhPvAj3j0r18d4BxUuaGaLB+hsEXBGdlqssZk76mVmDqeHd5vZwRJkSFgBtDSm7vovDULV2Hu5YvpVCDz0y+WCu2ERBJwV3VQ7/v1uMcQ8H+83y8ArLxWQjtUNJcBSmeQ/cGIChBXwoJ/HWhl9z9SosfkBsoLjS8GO6xZVEjppF2JObnqEau1rxP+Fzv7YmbRqZj3xhBA2wXMQ+fBmiX2ZXFXqDzjr09kZK0Ywc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(10067099003)(261028144727099003)(56012099006)(261026140227099003)(11063799006)(4143699003)(261022075727099003)(261021121427099003)(261021123027099003)(261022105027099003)(261102123227099003)(22082099003)(261009223027099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c0JwMlNtaWxNUFEzTkZUV2xRem1wZzBibHhMZW1GOFB0QUNxeXJMdnJIVHVh?=
 =?utf-8?B?TkdJcmsxRzhzN3FpME9IUHRqYUd2Y24vem9ObU9Sd1BjTU4rQUFMZVpzZTFi?=
 =?utf-8?B?RWJkVlV6c0ZMMXBWd2h3OUNSelZCbktobFVWV21Ha0FEU3VEaDhYVTZEZjRU?=
 =?utf-8?B?ZEcxVzlZa1RidWhydFByeGxXSXRYOE5qVlh0V3o2RlZqNVhDMEFxM3FsK0xH?=
 =?utf-8?B?NVN6SDBuMUVsaDRUVVZ1enBlRmw3Q1NaZGdrbEhmdEFreFBOWGg4YmlxQ2c1?=
 =?utf-8?B?QUI3WkRQZXBtYU4vSHR0b2tGcVBJTUE3bmNuSlF1U0FBS3E0MDhXVEQ3Mk1h?=
 =?utf-8?B?Ti9kYXI1Z25RSGxqRHVvbExrWHQ3b3p1WmphTmhnTXZQT2p5bjBjZk1FNWxw?=
 =?utf-8?B?cTJ1STQ5RUdZWHRMeC9MMGprejBGY1BlY1l6Y212SDRieWpSRGxiTUhOdGpH?=
 =?utf-8?B?Rk4xSHJyT09aaGJKM0hLNlBrSzk5S25SUENrcVhTK0tVK3RwdS8vUkw5UTlu?=
 =?utf-8?B?dU9MMWNGV1lyeFk0Z0hGa3IvaGViak5VL0g5V1VxaFZ2dXRiM0I3d2VZc0xp?=
 =?utf-8?B?VnpVWHEzdVlYYlN6RHhJRUFObWg0a1B5NjlaY0ZzVldwTlJqYmxpZHNhNkhk?=
 =?utf-8?B?MWh6R0toa0NMUUFIc2ZuaGNFUzZwS3B5NTc2K2MrVlVEM1pBWm5tWnZMRHZC?=
 =?utf-8?B?bWhmWXVwMWhxWThTelNjZXU0bmlQd0R2RlFLdWIvQlh3MjcxT2NBb2xWZDgw?=
 =?utf-8?B?TDJuMHExODcvQm05WkVMWFN5YnNGc1Q5Sk16UkIvYjlDdnNnSXhLaElpU1VX?=
 =?utf-8?B?SGtWazVQVE9vQTNmRVpSRGlIcDV0QWUwQW9QSUpwbHlWc1k4WmFJN1dJVUVr?=
 =?utf-8?B?Y2ZkTE53L0QwWlltdkJkQmtZMjRMK08zRnlqenlIWmsxZkJPRU9kbVJVQzNh?=
 =?utf-8?B?Njdrbkk5ZGJONDhIN0dGcVFsREY5NnZucGNXcnJWYUF1aVJ4eDZvRWIvNjJE?=
 =?utf-8?B?OG5mTVRDeTV4TDFvQnFOQzZ0Q1RQRjh1c1poUlE1QU43eFZPZGRxUFhKdTBi?=
 =?utf-8?B?dHp3Z09RUW1Cd2RMRmNMdzh1QjU4ci8xVmN5Q1I2T2NzQ2lzMWFVeXF2dzNK?=
 =?utf-8?B?MC95NjJCSzVLczNIVHR3MkJweEtSRi81UU4xeVQxSzg4VktXMll2NGcvdTdX?=
 =?utf-8?B?WXUzbGNHeW84cCt1cmM5c1VRZmVqS3BUcmw2QzFwd296YTVMY3hMVEt6K1Z3?=
 =?utf-8?B?dmJCUTU1Qmx2SjVtR0JyaStnSWE1VGI3N0hLLy9rMjlES2syWUZGRmltclMz?=
 =?utf-8?B?ZldxaG5udk1INHZjTVNvc0k0dFRrRTh3ZlJYMWU5aGxYSURMRFFOYWF3aWpR?=
 =?utf-8?B?K0xpQUxLcWJKTWs1MWtDYUZ6MktBUG5tUk5rMHJ6NDFzTk5hY1JSRnVLOGM2?=
 =?utf-8?B?MkRKU1NXMmROSkFLNWxrTkVEOXBuVTRJSUxYNHFnVGowRytaeWgyZTBoZnpQ?=
 =?utf-8?B?QXNCem5vcjhiSTdRWjlQbFRnVkIvUmFNakJiaDlUQzFnaS9vY2hFUjhyQ1ZH?=
 =?utf-8?B?Y25KQkdVMW5wS3phTnhKU0pzU1l0M1dlem9nQ0RMWVVDNXM3VFVMU0ZHd0Qz?=
 =?utf-8?B?NnFXSEJIN1dkajFwcDFoUXdIUlNtVDVINFJjY0x3eUI5ZUYveDY3S3JtREJx?=
 =?utf-8?B?YVJvWVVQL2ZGTWw3Y3gwUEJ0ZDU2bjB0bThmWVIwZVMreS9HT3lkTDJLc0JZ?=
 =?utf-8?B?WFBGWEpLamFCUXBDVVhMdWRFTm1qUFg0eGFTRWZ5YzJlS3Q1VkZvTkhZUGZ5?=
 =?utf-8?B?U1I0VkpyRE5jaFd2a0pkaHVnOHdnbEdGbEU1Zm1sK2NpeVB6THZyUGhtVklJ?=
 =?utf-8?B?MGpaTkt5R05hWUdnOXNFWUpMS0o3QVNxdTVuZDVjMzN2ckRQZTlXeitza1Uy?=
 =?utf-8?B?eC8yc3kwbWs2SThaNHVMRFArcXorN0ZEa0JTVkZlSjZPbGtZZ3lVTkZ5dnAy?=
 =?utf-8?B?Q2dVTmEranpKVHMzWkVzOWExdmNQczlCd2cxODZkZ1VqSFU5VForRXJNb3J2?=
 =?utf-8?B?Y0VNazg5cTFyUHBweEZJVTNZYTkwTDBLaWhybGkxRWtFRVQwV3JsQzlBckh4?=
 =?utf-8?B?YzJTV01SL3BacnJJajhEYkdvVDRQZXNtek9aeWxpRCtwczV6UnVaWG1ub3Fh?=
 =?utf-8?B?RmJ5UmQrS2JKNGVQYVpVQmdpUUk5bVliSnBlVWlSclhrK1VzdEJLdFRsM2g3?=
 =?utf-8?B?cXcxN2lpT3N4eFRzM1dMamlYQUZrckMrMTE5Nk1wWVdZZHA5ZUVabjdjVUhz?=
 =?utf-8?B?THord2l2K1kxcU9Sbm9rNE04WmVqYTJJMG5nMmdvK01abUpCUnhvZz09?=
X-Exchange-RoutingPolicyChecked: L0NYtT4R04rS/neCHSc+gJxU7myKmzIpVaxljObxvU/IAU9x95mNRnWSFsNWsgWFt4VOYSEJ33Tf5tS61Uj6+QI8AWnyAWI++Zgwr2u8CdOc3m4nlEEUnSFirrZnVlwwiax+OTSTIAZL8Qd5NYFwgKLYukImRVA5qDtre8lvJwemo0xnE07n2AElbtwNNzpQHb5VxhqJDXa4DTL83VGZ4DMGot9W+3WdbiIqjN6OrRo8BtYODLLDkyRPFkCTUpfHF+uL/9xRCTeKMid9GboqnuzxF1BJ9HVqRYkeOTdH9u/Li5Jc1VHf7NjeoI0Gw6FSe8MW2xuErPwO/+WsMVHicw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 90a6a458-c19a-4ec6-f959-08df46e83c19
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 09:25:37.2758 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jHCfkyVfTA0lxeIQtuYhr+9UE+Eq2qUunT+mCo50bz0x/RjfeM1QJs/Vu3e47XPx2P44huD6Bl28uG+y6MNmAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4874
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
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 19-11-2026 15:52, Raag Jadav wrote:
> Convert open-coded XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET check into its
> own helper.
>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>

Reviewed-by: Riana Tauro <riana.tauro@intel.com>

> ---
> v2: Introduce xe_wedge_mode_is_no_reset()
> v3: Fix wedge_validate_mode() to check for local mode (Sashiko)
> v4: Also use xe_wedge_mode_is_no_reset() in guc_submit_hint_wedged() (Sashiko)
> ---
>   drivers/gpu/drm/xe/xe_drm_ras.c     | 2 +-
>   drivers/gpu/drm/xe/xe_guc_ads.c     | 3 ++-
>   drivers/gpu/drm/xe/xe_guc_capture.c | 3 ++-
>   drivers/gpu/drm/xe/xe_guc_submit.c  | 4 ++--
>   drivers/gpu/drm/xe/xe_pci_error.c   | 2 +-
>   drivers/gpu/drm/xe/xe_wedge.c       | 5 ++---
>   drivers/gpu/drm/xe/xe_wedge.h       | 5 +++++
>   7 files changed, 15 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_drm_ras.c b/drivers/gpu/drm/xe/xe_drm_ras.c
> index 3ca6c82345dd..86c589437a9f 100644
> --- a/drivers/gpu/drm/xe/xe_drm_ras.c
> +++ b/drivers/gpu/drm/xe/xe_drm_ras.c
> @@ -21,7 +21,7 @@ static const char * const error_severity[] = DRM_XE_RAS_ERROR_SEVERITY_NAMES;
>   static int drm_ras_counter_get(struct xe_device *xe, struct xe_drm_ras_counter *info,
>   			       u32 error_id, int *idx)
>   {
> -	if (xe_wedged(xe) && xe->wedged.mode != XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
> +	if (xe_wedged(xe) && !xe_wedge_mode_is_no_reset(xe))
>   		return -ECANCELED;
>   
>   	if (!info || !info[error_id].name)
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index 0e1674a394b6..f333480f94e5 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -30,6 +30,7 @@
>   #include "xe_map.h"
>   #include "xe_mmio.h"
>   #include "xe_wa.h"
> +#include "xe_wedge.h"
>   
>   /* Slack of a few additional entries per engine */
>   #define ADS_REGSET_EXTRA_MAX	8
> @@ -544,7 +545,7 @@ static void guc_policies_init(struct xe_guc_ads *ads)
>   	ads_blob_write(ads, policies.max_num_work_items,
>   		       GLOBAL_POLICY_MAX_NUM_WI);
>   
> -	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
> +	if (xe_wedge_mode_is_no_reset(xe))
>   		global_flags |= GLOBAL_POLICY_DISABLE_ENGINE_RESET;
>   
>   	ads_blob_write(ads, policies.global_flags, global_flags);
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
> index 0fd68b41d412..e528b3e9d158 100644
> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
> @@ -35,6 +35,7 @@
>   #include "xe_map.h"
>   #include "xe_mmio.h"
>   #include "xe_sched_job.h"
> +#include "xe_wedge.h"
>   
>   /*
>    * struct __guc_capture_bufstate
> @@ -1962,7 +1963,7 @@ xe_guc_capture_get_matching_and_lock(struct xe_exec_queue *q)
>   
>   	xe = gt_to_xe(q->gt);
>   
> -	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
> +	if (xe_wedge_mode_is_no_reset(xe))
>   		return NULL;
>   
>   	if (!xe_device_uc_enabled(xe))
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index b5c916a764db..0aec902d0ef5 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1435,7 +1435,7 @@ void xe_guc_submit_wedge(struct xe_guc *guc)
>   	if (!guc->submission_state.initialized)
>   		return;
>   
> -	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET) {
> +	if (xe_wedge_mode_is_no_reset(xe)) {
>   		mutex_lock(&guc->submission_state.lock);
>   		xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
>   			if (xe_exec_queue_get_unless_zero(q))
> @@ -1455,7 +1455,7 @@ static bool guc_submit_hint_wedged(struct xe_guc *guc)
>   {
>   	struct xe_device *xe = guc_to_xe(guc);
>   
> -	if (xe->wedged.mode != XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
> +	if (!xe_wedge_mode_is_no_reset(xe))
>   		return false;
>   
>   	if (xe_wedged(xe))
> diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
> index d288bb291aa1..fc6ff71d84a0 100644
> --- a/drivers/gpu/drm/xe/xe_pci_error.c
> +++ b/drivers/gpu/drm/xe/xe_pci_error.c
> @@ -179,7 +179,7 @@ static pci_ers_result_t xe_pci_error_mmio_enabled(struct pci_dev *pdev)
>   	action = xe_ras_process_errors(xe);
>   
>   	/* User wants to debug the error, prevent reset */
> -	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET) {
> +	if (xe_wedge_mode_is_no_reset(xe)) {
>   		xe_wedge_declare(xe, DRM_WEDGE_RECOVERY_NONE);
>   		return PCI_ERS_RESULT_DISCONNECT;
>   	}
> diff --git a/drivers/gpu/drm/xe/xe_wedge.c b/drivers/gpu/drm/xe/xe_wedge.c
> index 827fae058976..e48cca34d660 100644
> --- a/drivers/gpu/drm/xe/xe_wedge.c
> +++ b/drivers/gpu/drm/xe/xe_wedge.c
> @@ -157,7 +157,7 @@ void xe_wedge_declare(struct xe_device *xe, unsigned long method)
>   	 * hangs, so wedge the device with 'none' recovery method and have
>   	 * it available to the user for debugging.
>   	 */
> -	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
> +	if (xe_wedge_mode_is_no_reset(xe))
>   		xe->wedged.method = DRM_WEDGE_RECOVERY_NONE;
>   	else
>   		xe->wedged.method = method;
> @@ -203,8 +203,7 @@ static bool wedge_mode_needs_policy_update(struct xe_device *xe, enum xe_wedged_
>   	if (xe->wedged.mode == mode)
>   		return false;
>   
> -	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET ||
> -	    mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
> +	if (xe_wedge_mode_is_no_reset(xe) || mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
>   		return true;
>   
>   	return false;
> diff --git a/drivers/gpu/drm/xe/xe_wedge.h b/drivers/gpu/drm/xe/xe_wedge.h
> index f2cab855db35..edb5174c5a75 100644
> --- a/drivers/gpu/drm/xe/xe_wedge.h
> +++ b/drivers/gpu/drm/xe/xe_wedge.h
> @@ -26,6 +26,11 @@ static inline bool xe_wedged_permanent(struct xe_device *xe)
>   	return atomic_read(&xe->wedged.perm);
>   }
>   
> +static inline bool xe_wedge_mode_is_no_reset(struct xe_device *xe)
> +{
> +	return xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET;
> +}
> +
>   void xe_wedge_declare(struct xe_device *xe, unsigned long method);
>   int xe_wedge_init(struct xe_device *xe);
>   int xe_wedge_set_mode(struct xe_device *xe, enum xe_wedged_mode mode);
