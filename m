Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9541E606A32C
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 09:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Qpjn3D2z;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=lOG2U1TA
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 341A1112226;
	Thu, 26 Nov 2026 09:43:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0872410E3A9
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Nov 2026 09:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795686170; x=1827222170;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Sj2NFo3GDmgjRUHWD/kAYaAVBJFdhBhcuqxF3ogcQeM=;
 b=Qpjn3D2z7eMH00S+HZiVVvG12Li3z4MGR27hvHz+xhSjT9a7QyzZF1TW
 BXlsPX4tt2CIzulrJAYHdTKORAqun9ZuNCBpToxJ0QXh1UUHczKgKWld6
 o3g6Bj8AxjyGYethItiIXj6Dl4VcoSaqGCNOMKt6DcSPfG2YmronIfjvQ
 K4NfXGrTEVoioqzT7EfCea06NI7YzunAB33KDHIZ/lAzXe81G01QSHrFf
 BW4MGrnGGvjtZbV41LaxEmFlEn3i3Mi+qjFbXlzyRUESZ4xUBIHzpnsVy
 qors70lBYL9jEmE7oaXgqus3oJXA3iejWnZ/1RZ7IcrEJX2+teuqCFcOp g==;
X-CSE-ConnectionGUID: xkUnP8qKQyi5GMjF8W9TfA==
X-CSE-MsgGUID: LT7pO6ErRlSqyoHN70Dpeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4578390"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4578390"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 01:41:56 -0800
X-CSE-ConnectionGUID: 4+O9utNoTPO3Cz5Plbpa0Q==
X-CSE-MsgGUID: tgtCmPUVSfGRVluQQgVOxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="12466917"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 01:41:56 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 01:41:55 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Thu, 26 Nov 2026 01:41:55 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.71) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 01:41:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E8b7wxx6wwNYm6wV9LvyIox9qsOobGAMIKMcYl9z4JGnYv35oLlMdu3AUWxY0bm2UnxQlYsuHXJABHB35gHGjljZbkIs+hNnzx6/GhP5p/MeFGHdKDKb7iK2UBsY8ePfPP7gpy3RiyoLNuUh98SkRRYGXEz12jlacjN99Lh/mwIaLVCP8c1wQBhVSkDku3N4PDkTElvzvFY3Of2N9W5AP/0FP7Rl5t4GeNR9FxkmjMehrSU7rE/39DP/daCJFj5VAceTh5XDVGthK5BQPnkPFICbU81HQwAt00Ww9nPywkcP5uA8Ap9fit8u4hrEdvxRqfeHaw1UHLullIqPVScyFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bfijvICaIllIN0i4bp/qoaF+RohwyuoJG5sBEwNiqFc=;
 b=kM+DTypqTktdEdJzuCHOfSF6FR3OxF1rbRm9heO5B+jtkx36jOogCx9KZAqcfQwnXTjCk8kSMDBCF0XishYKfu8vEU3unywbEM6+7B6/x/Yc5O5og5CFWnZqo6VvU5qUWL3q4Yq1kdpaGSUnUaSzK5KlsJDzIuud/dAPbYQ67zxfCYUe9s3YOiSCjwMN7QgC1oacW1ELqJlTlXoACNnR1iO+e2OuZei0L+twsCFxC7K6oMYU53ax1+YaoZ+9dCyobBfJS1MSR+L5EexntRkrevcKKKhmpazX4RBvkXYFOiwvzirT/zaPgYrRk+kmDK3dE86mHMa/eVNgk/YvGDBvpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bfijvICaIllIN0i4bp/qoaF+RohwyuoJG5sBEwNiqFc=;
 b=lOG2U1TAN4kGv3/NaVA4ebsl8hAMSMzxIpIFYg9rKKc2KSSYMD2iyaszpSstTeYSZ79E4+tKqm4JNNx9+/I3s8al4kWl/+zLPSGqyzg77L31dix94htVjcyzSc3DQmSHe9GZKK+tE0Jbg7CFp+FotkvpVuAboGPdW+l2J9rJLSY=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by CY5PR11MB6463.namprd11.prod.outlook.com (2603:10b6:930:31::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 09:41:53 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%3]) with mapi id 15.21.0662.001; Thu, 26 Nov 2026
 09:41:53 +0000
Date: Thu, 26 Nov 2026 10:41:49 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 2/7] drm/xe: Define VRAM regions and pools
Message-ID: <20261126094149.bgphw3p44d6lud5k@intel.com>
References: <20261116094523.2484301-1-piotr.piorkowski@intel.com>
 <20261116094523.2484301-3-piotr.piorkowski@intel.com>
 <ba79e8af-c172-4ae6-83cd-d6964f2af3ab@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ba79e8af-c172-4ae6-83cd-d6964f2af3ab@intel.com>
X-ClientProxiedBy: VIUP296CA0013.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:34f::14) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|CY5PR11MB6463:EE_
X-MS-Office365-Filtering-Correlation-Id: c21bfa7a-2364-4840-e348-08df4ba18073
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|10067099003|11063799006|5023799004|4143699003|56012099006|261021123027099003|261021121427099003|261009223027099003|261102123227099003|261022075727099003|261022105027099003|261026140227099003|261026121527099003|261028144727099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: fkSUavTwQ1R49ktHiiDocy3YdE4pbTegyuZhRriivI7g/Hmjb4ALadGkqLpQNRansxwBF7IVOtuFo6WB3NXDoFl13WMqlf96CRoTr/vLyqLQeYoYODgXDzZP0M4TIzZWx+XkeiKosCmenyZ2z9xbFaGz/ymMWJyL2NydFufvj5avb9ucEAjCvrgJmbR3NEIlcmFMImj8fdBrQqerdfmk5mkDCP8FeQwNgAjAd1zYa02jdrBslhQGg9YPYbT9FpHAV8rmFT4unwoYxexz9ZXQqpaqem8e6BRNVPrVTBJyNPESMd6XBIYMRO6ctVNijeZHljAxXIfQYI+7WzFHOmcbrOyR6vDmhY7gNZzt61c2DwJPKzfCdhKKJtN5NLW7IXL3/nOyKljU+vXT+O2O72fS1+bPC8L5x2fYqiAZx2QWmFqDn3+5Q83bj+qmipe9v4BmKf45fwO75NEhPNjMpKcsPP5L1ar0HM2qzIg9AHTkNZPNC6wNzaoxCTe0HLvJpN/U3JGiGlnHmPPNCbYPHfRfxPNrzhlDshF0xBIbWOeT++5tE3ZzeH6OTylMeDooYdK7pHdeW4U/miDWP03kZy06OOVkfCS23UjOLCYOYcFCX0rUxU/oR638VHEGRMEDkXqFeE3wK2hNCPJtHbmHycTJ35dXHD+nXSHBptV203MCifw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(10067099003)(11063799006)(5023799004)(4143699003)(56012099006)(261021123027099003)(261021121427099003)(261009223027099003)(261102123227099003)(261022075727099003)(261022105027099003)(261026140227099003)(261026121527099003)(261028144727099003)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QlhtWTIvdDlvMFZpcStDTlA2RXBiS0NONDZwTlRIYnI3cmVZS1lBL0hYUzVS?=
 =?utf-8?B?L0xrZGhPYVI4SFhvb3VzTCtpQyt4STQ2QkNDbVNEV2NLeHp6UDNTTmRySWY1?=
 =?utf-8?B?NlMzVXZibUtVUS9sNXBDQlFWbGhNdlFFMWJ6MkhhQXdqUlo1eWozY3E0SFNX?=
 =?utf-8?B?VXJIb2pnTUVUa3hDL2x3eXNUUFlhMWkzUHE0NWo1UHVRT2V2RXN1TjlwNjJD?=
 =?utf-8?B?TTdHWm1IUDRvb1BUUEQweThoZk1aVldDbHdQNU8wNUxaakJCeThCQU13L2Rz?=
 =?utf-8?B?N3pVc01RSlUxQ09iWGg1SzR4MFJlUjk3V0I5aTJpV3JlNG43alN3V2h4ZmxM?=
 =?utf-8?B?b0gwcmc2dFowUG1YcVRMcVNJbWNpTDZoRTYzTCtCK2hXc1h5bUZLUWM5SXgv?=
 =?utf-8?B?c0FVNTQ0U1pacE1KeHNJakxJc2Z6T2NRWmZtME9mT1YzT1E3ZTdhR3g4VmlJ?=
 =?utf-8?B?S0dZZkhaUlI1VktXQUpVa0IybFhuQTNOekVvS0cxSXlmM2xwUXNEQjd1K0U1?=
 =?utf-8?B?THp6NlRYVTNGSjk4K3g5YXYvSmlwRW5Da2l2dXU4MHk0ODBOT0RoOE5SZE9W?=
 =?utf-8?B?cTAzY3d4TmdZZUJCYVJWMWdjRGRXZXIxK1dDNUgwU1Nyc2VHSVk5VG5rc1k1?=
 =?utf-8?B?cFFxdjU0N1QxMUJkVkwxMkpsanpuNVZPV0VSRCt1WlI1QktzSjc3NUdzU2NB?=
 =?utf-8?B?ZkQ2SzV4RDZoeGFETm8yZEdXbmhqSHpranNOZC9KMzRPYUJLUlFVbFFxOVc5?=
 =?utf-8?B?Q2xuZVVZUkhYV3lTNGg5ZW1kS1Y0Q05Cdlk0VktyRmlPUi8vTjA5T1QxVkxL?=
 =?utf-8?B?RlJ5QWI5cmZ1L2psZTcvVDc2MFRaZTgxUDdaa3hybVc2LytZTjlLSXFWL3dw?=
 =?utf-8?B?dktDY2dXY0NxcVgrb1JnTHZVQVpUTzY1cFpBT0JXRWtudTNCVHY1K0hhM0E4?=
 =?utf-8?B?Z1VDT2JPN2lzd1htVTVPNXlyRG82SE9TY1I3WUpkYUdtNTh3SGdhMnZocVhN?=
 =?utf-8?B?a0JyaEl2eWJsa2RGTldvYjZvTmJhOTUvWThFaHdRcVo4NnNKMWlzS0doZTVk?=
 =?utf-8?B?SExUWUxPczdQVjNBMHB0RDN0eUltL0FEMFlmY3NySjAxZms4Vys2REYvN1Vv?=
 =?utf-8?B?RHpJTzlZYUhQTjUyZUZZS1VlQW94R1p3MWlEM2VFVE10NWpsb0xtTkdLVHd4?=
 =?utf-8?B?MUZuWVFGWFpTYkV5VTJsYWdzdU1IbEdMR2RIUzltU1ovdnIrYmxNNFFNb29U?=
 =?utf-8?B?NVZIaFVIWmViU3REQmxhVExVSDg5ZGZlWU41UW9KMjd1d0JLSmVjZ1NkZmNZ?=
 =?utf-8?B?NUtCa25xRVFBSGNCY092TFJJSENUVUpCblZvN0UrZTJoME1zV3hCb1VnR1ZB?=
 =?utf-8?B?MTgvcHdRWmp5OC8rdVd1OW9tOURkZGxaeXRyZ1d5VDNWTmJwbTFyN29Lc2Z5?=
 =?utf-8?B?VzVBdkY3cWhGMDRHOWtFU1dSTVhad2hBeUg0b2hUMjRhWWt2bndPS3lmd2V2?=
 =?utf-8?B?S0N3a1pKZFJCYVVDeGhuSEtXclI1NFFmUmZmaEo2M2I1SGxFcE1TbUZSNVhs?=
 =?utf-8?B?VUNiRjQ1YlZJQTJOSit0U2k4aHZVNDRPVGEvZ041WlVMdGxYcllBZEt4VGl2?=
 =?utf-8?B?bUhST3pZWjFxYXV0bC9pTHdWVWh6TVhUR0gwYWNKdUxmMTJ4NmJyNmY5RWhi?=
 =?utf-8?B?dlJpRWllTHlpdlNwa0ZRemR5K012bTdqZ3l0c1lqNDNHdSs5WU5wbEt1WFBI?=
 =?utf-8?B?TGx2SmN0L1hKNm1DOG96cExVcVRoNEVWZzZkUExuOTY5ODFFcDZpUGk5Q0Vh?=
 =?utf-8?B?Z2VXL3FFKzY5b2VrZ293RVVxWjhFM3o2aFVzTjZNQWVtRTlXTXZhS0tBOURS?=
 =?utf-8?B?a2I1ZWtEVzl6YVRobHljZldZR3NUcXBiVjZROGZURW1GcjBPR0pnU0FtZFU3?=
 =?utf-8?B?ZXhzYUFoLzdJcnFhSWlMYTBxQXdrazdrcnRUZmJXZjBYV3lpcHF5WUs0V2hP?=
 =?utf-8?B?WjRqZUZqd09lak0rYmtvQVAwVkRRVUNiK0Y1TDlkdlpVdmVpay83cmxUTjIz?=
 =?utf-8?B?RHdOYWJ4ZkdmeGtBdWZiMFRza3gwZXlNR2w3c1AwSlNxWTg3S1hhRnpVeUFv?=
 =?utf-8?B?cHNpQmcxYmE3aThHZ0dSNWswb0lrL1dvZ2hBaGxBT04yTEtDeGloMzZPMzFx?=
 =?utf-8?B?eUQ0bjNlSTRsYkdzOUFpc1NaOXhqTHZNNi9YRWw2enZNOEdBcFJYRkxYYUZ4?=
 =?utf-8?B?MFhabHJETkZPc0RXLzRQODg4VWZ3MnlaM2RlcTZtSjh3dXBCTnhuT2V0SXVo?=
 =?utf-8?B?SlZpNFhUd0paVmRqNGtVOWdubzVUb2JWWEJaNW84eXlGNXJiZklpTHMxU2Zh?=
 =?utf-8?Q?upReh9VoHRTRqUmw=3D?=
X-Exchange-RoutingPolicyChecked: Oyz44nafsBzojhYcLpgYiROdWw2Rel+cCZuivRR+3sKgh9puQ8oGgbDSlyKL3vaEQgU1SnDoXz+1CB6XAlpuPXdS6OSbK12wM6drtfh98wd1LJuNibm/g4S/twwRoCaGBb9EM/ZBzGmcxzAe0I4X6KqpneX8RgUY6VOTqIBcVdzcvQ+ucGlQbRP9prmaA32ULkWNGc7zC1j9LJ2mPoX6VGW7zdJTWnxyfTLU6LyuZwo27LqRFKbgtk4EonkXMFx5lPbmKKOQQEgsoTZGJT3dAekC6kdztzRLQsVlv2IJBOsplNF9YI550HgYpyJfC/fm8I/PRXnC5wKMXSUfJ0r2kg==
X-MS-Exchange-CrossTenant-Network-Message-Id: c21bfa7a-2364-4840-e348-08df4ba18073
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 09:41:52.9449 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: foVHcv+ffq+bZHu/em+D7qwZve0j/lQ+wVn6ARPE+5xF07SOwrK8XDAhbOj5+dZZjtDRv/iXZ9bUi2u8moQl32JmkPHSAB9ZG/SfSDRGeus=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6463
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

Matthew Auld <matthew.auld@intel.com> wrote on śro [2026-lis-25 17:38:07 +0000]:
> On 16/11/2026 09:45, Piórkowski, Piotr wrote:
> > From: Piotr Piórkowski <piotr.piorkowski@intel.com>
> > 
> > Allocation paths place memory through a struct xe_vram_region, which is
> > both the physical carrier of a VRAM range (BAR mapping, DPA range, TTM
> > manager) and the only handle for the purpose an allocation serves. That
> > makes it impossible to dedicate part of a region to a given purpose,
> > e.g. to keep kernel allocations such as LRCs and page tables in a range
> > of their own, away from VRAM that may be reachable by other agents.
> 
> "other agents", what is meant by that?

Hi,

That wording is too vague, sorry. "Other agents" meant other users of
the device's VRAM whose memory must be kept separate from the PF's
allocations. One example is SR-IOV: we want to reserve a VRAM pool
for the VFs, with a guarantee that this pool is used by the VFs only.
Other sub-drivers that need a separate VRAM pool fall into the same
category.

The pool is meant as a generic mechanism for that, not something
specific to VFs.

> 
> > 
> > Separate the two concepts. A struct xe_vram_pool represents an allocation
> > domain: it identifies the purpose served by a range within a VRAM region,
> > whether that range is available for general use or dedicated to
> > a particular purpose. A struct xe_vram_region owns the physical resources
> > and embeds its pools as partitions, keeping pool pointers published during
> > initialization stable when the region is later split. The region also
> > records its binding, distinguishing a device-wide aggregate from a tile
> > region, since both may use ID 0 for the first tile.
> > 
> > Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_vram_types.h | 159 ++++++++++++++++++++++++++++-
> >   1 file changed, 158 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_vram_types.h b/drivers/gpu/drm/xe/xe_vram_types.h
> > index 646e3c12ae9f7..a3e421f2f32d4 100644
> > --- a/drivers/gpu/drm/xe/xe_vram_types.h
> > +++ b/drivers/gpu/drm/xe/xe_vram_types.h
> > @@ -15,6 +15,142 @@
> >   struct xe_device;
> >   struct xe_migrate;
> > +/**
> > + * enum xe_vram_binding - VRAM region binding types
> > + * @XE_VRAM_BINDING_NONE: no binding assigned, default value of a zeroed region
> > + * @XE_VRAM_BINDING_DEVICE: device-level region aggregating all tile VRAM regions
> > + * @XE_VRAM_BINDING_TILE: VRAM region bound to a tile
> > + */
> > +enum xe_vram_binding {
> > +	XE_VRAM_BINDING_NONE = 0,
> > +	XE_VRAM_BINDING_DEVICE,
> > +	XE_VRAM_BINDING_TILE,
> > +};
> > +
> > +/**
> > + * enum xe_vram_pool_purpose - What a VRAM pool serves
> > + * @XE_VRAM_POOL_GENERAL: general-purpose memory, available to userspace
> > + * @XE_VRAM_POOL_KERNEL: kernel-only memory, never exposed to userspace
> > + */
> > +enum xe_vram_pool_purpose {
> > +	XE_VRAM_POOL_GENERAL = 0,
> > +	XE_VRAM_POOL_KERNEL,
> > +};
> > +
> > +/**
> > + * XE_VRAM_MAX_PARTITIONS - Max partitions a single VRAM region can be split into
> > + *
> > + * A region currently holds its default pool and at most one pool dedicated
> > + * to another purpose. The TTM manager mirrors the partitions of a region one
> > + * by one, so a region cannot hold more of them than the manager can back.
> > + */
> > +#define XE_VRAM_MAX_PARTITIONS	XE_TTM_VRAM_MGR_MAX_PARTS
> > +
> > +/**
> > + * DOC: VRAM pools, regions and partitions
> > + *
> > + * Allocation paths place memory through a struct xe_vram_pool. A pool names
> > + * a purpose (general-purpose, kernel-only ...) and resolves to a TTM
> > + * placement plus the address range serving it, see xe_vram_pool_place().
> > + * Whether that range is the whole region, or one of several partitions
> > + * sharing a region, is a backend detail pool consumers do not need to know.
> > + *
> > + * A struct xe_vram_region is the physical carrier: it owns the BAR mapping,
> > + * the DPA range and the TTM resource manager. A non-aggregate region
> > + * initially contains one partition spanning its whole usable range. That
> > + * partition is the region's default, general-purpose pool. It always
> > + * occupies partitions[0].
> > + *
> > + * Each partition is described by a struct xe_vram_pool embedded in the
> > + * region, so a pointer published during initialization remains valid if a
> > + * later split changes the pool's offset and size. A split never changes a
> > + * pool's purpose and may only happen before the region's TTM manager is
> > + * initialized.
> > + *
> > + * The device aggregate described below is the only region type that has no
> > + * manager and no partitions.
> > + *
> > + * The id shown below is the VRAM region instance id. For a tile region it
> > + * is the id of the tile, which the uAPI relies on. The pair (binding, id)
> > + * must uniquely identify a region.
> > + *
> > + * Partitioned region:
> > + * A tile's VRAM region can be split so that a pool dedicated to some purpose,
> > + * e.g. kernel-only, gets a range of its own and the default pool keeps the
> > + * rest. The dedicated partition is carved out at the start of the region, at
> > + * the lowest addresses, and takes the next free index. The default partition
> > + * keeps index 0 and is moved above the dedicated range. A tile without such
> > + * a reservation keeps one partition spanning the whole usable range::
> > + *
> > + *         xe_vram_region "tile0" (VRAM region id 0, binding TILE)
> > + *         ,-------------------------------------------------------------.
> > + *         | ttm: struct xe_ttm_vram_mgr (one manager, shared)           |
> > + *         | .---------------------------------------------------------. |
> > + *         | |  partitions[1]            |  partitions[0]              | |
> > + *         | |  offset 0                 |  offset pool_size           | |
> > + *         | |  size   pool_size         |  size   usable - pool_size  | |
> > + *         | `---------------------------------------------------------' |
> > + *         `-------------------------------------------------------------'
> > + *                  ^                               ^
> > + *                  |                               |
> > + *             dedicated pool                  general-purpose pool
> > + *
> > + *         xe_vram_region "tile1" (VRAM region id 1, binding TILE)
> > + *         ,-------------------------------------------------------------.
> > + *         | ttm: struct xe_ttm_vram_mgr (one manager)                   |
> > + *         | .---------------------------------------------------------. |
> > + *         | |  partitions[0]                                          | |
> > + *         | |  offset 0                                               | |
> > + *         | |  size   whole usable range                              | |
> > + *         | `---------------------------------------------------------' |
> > + *         `-------------------------------------------------------------'
> > + *                                     ^
> > + *                                     |
> > + *                            general-purpose pool
> > + *
> > + * Device aggregate:
> > + * A device-level aggregate region is unrelated to the tile regions. It is
> > + * never backed by a resource manager and has no partitions. It only
> > + * aggregates the sizes and DPA ranges of every tile for reporting purposes.
> > + * Nothing is ever allocated from it::
> > + *
> > + *         xe_vram_region "device" (VRAM region id 0, binding DEVICE)
> > + *         ,-------------------------------------------------------------.
> > + *         | ttm:        unused, not backed by any resource manager      |
> > + *         | partitions: none, this region is never allocated from       |
> > + *         | size:       total VRAM summed across all tiles              |
> > + *         `-------------------------------------------------------------'
> > + */
> > +
> > +/**
> > + * struct xe_vram_pool - VRAM range used for a given allocation purpose
> > + *
> > + * VRAM allocations are placed through this frontend. It identifies an
> > + * allocation purpose and resolves it to a TTM placement and the address
> > + * range serving it. Whether that range is a whole region of its own - and
> > + * thus has its own placement, mapping and address range - or one of several
> > + * partitions of a region is a backend detail the allocation paths do not
> > + * need to know, see xe_vram_pool_place().
> > + *
> > + * A pool stays valid for the lifetime of its region and its purpose is fixed
> > + * once published.
> > + */
> > +struct xe_vram_pool {
> > +	/** @region: region this pool belongs to */
> > +	struct xe_vram_region *region;
> > +	/**
> > +	 * @part: TTM partition backing this pool, or NULL until the manager
> > +	 * is initialized
> > +	 */
> > +	struct xe_ttm_vram_mgr_part *part;
> > +	/** @offset: byte offset of the pool from the start of @region */
> > +	u64 offset;
> > +	/** @size: size of the pool in bytes */
> > +	u64 size;
> > +	/** @purpose: allocation purpose served by this pool */
> > +	enum xe_vram_pool_purpose purpose;
> > +};
> 
> Can this not somehow be merged with the zone? Or why does this need to be a
> separate layer on top?

I thought about it, but I would like to keep them separate.

The pool says what a VRAM range is used for: its purpose and its
range. This is what users of the memory hold, like
tile->mem.kernel_vram or the BO placement code. The zone is internal
allocator state (the buddy and the CPU visible accounting). It is
about how we allocate from that range.

They are also filled in by different parts of the driver. xe_vram
sets up the pool during probe, and changes it only if the region is
split, all before the TTM manager is initialized. The zone belongs
to the manager and is set up only when the manager is initialized.
With two types, it is clear which code is responsible for which
fields.

Today there is one zone per pool, but this may change. Your
visible/non-visible idea is a good example. That split is about the
allocator, not about the purpose, so one general-purpose pool on a
small BAR would be backed by two zones. With separate types, this is
mostly a change in the manager. The tile and the BO code would not
need to change. If pool and zone were the same thing, we would need
to split them again.

Also, a pool does not have to be a slice of a region. It can also
cover a whole VRAM region of its own, with its own placement, mapping
and TTM manager. The user of the pool does not need to know which
case it is.

I agree that right now it looks like duplication, with counters on
both sides and pointers in both directions. I will try to reduce this
in v5, for example the manager will not keep its own zone count next
to the region's partition count. I will also explain in the commit
message and in the DOC section how pools and zones relate.

Thanks,
Piotr


> 
> > +
> >   /**
> >    * struct xe_vram_region - memory region structure
> >    * This is used to describe a memory region in xe
> > @@ -26,9 +162,11 @@ struct xe_vram_region {
> >   	/**
> >   	 * @id: VRAM region instance id
> >   	 *
> > -	 * The value should be unique for VRAM region.
> > +	 * The pair (@binding, @id) must uniquely identify a VRAM region.
> >   	 */
> >   	u8 id;
> > +	/** @binding: VRAM region instance binding */
> > +	enum xe_vram_binding binding;
> >   	/** @io_start: IO start address of this VRAM instance */
> >   	resource_size_t io_start;
> >   	/**
> > @@ -57,6 +195,25 @@ struct xe_vram_region {
> >   	 * (e.g stolen mem)
> >   	 */
> >   	resource_size_t actual_physical_size;
> > +	/**
> > +	 * @partitions: partitions this region is split into
> > +	 *
> > +	 * A non-aggregate region initially has @partitions[0] spanning its
> > +	 * whole usable range. It is the region's default, general-purpose
> > +	 * pool. An optional split may adjust its range and create another
> > +	 * partition before the TTM resource manager is initialized.
> > +	 *
> > +	 * A device aggregate region has no partitions. Allocation paths do
> > +	 * not take a region pointer, they take a &xe_vram_pool pointing into
> > +	 * this array, see the DOC above.
> > +	 */
> > +	struct xe_vram_pool partitions[XE_VRAM_MAX_PARTITIONS];
> > +	/**
> > +	 * @num_partitions: number of valid entries in @partitions
> > +	 *
> > +	 * Zero for a device aggregate region.
> > +	 */
> > +	unsigned int num_partitions;
> >   	/** @mapping: pointer to VRAM mappable space */
> >   	void __iomem *mapping;
> >   	/** @ttm: VRAM TTM manager */
> 

-- 
