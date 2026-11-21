Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC908606A336
	for <intel-xe@archiver.kernel.org>; Sat, 21 Nov 2026 06:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=crz0I1Eb;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=KOJ0kUYk
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BC4910E07D;
	Sat, 21 Nov 2026 06:49:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49FF610E07D
 for <intel-xe@lists.freedesktop.org>; Sat, 21 Nov 2026 06:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795243743; x=1826779743;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8oC+1sSbG1uyvWuLnBur8z7j7H7PoZPyzkUqMZ0ECP4=;
 b=crz0I1Ebc5PGy4tXi05IT1JxxV5t85I+Ty8lx31FiHislNX0Ux2XKiu0
 sDpzBSUJ0e/G2MApoT1CPiJN2myRDOlAXXqdl1sXr5otL5es+RACid5cH
 jowqL7s/Y7WFNkL1ZVW7W/BPMZrrWysnm+eL19wCnO8n59hdTiEvUUc3R
 HGd5g2YOpa8AteUqH+HZV5YOCFglf9YV0PnT2iLOSurEzNK8PR5HJc2Z7
 xoXmMrV7q7Up5qDQGXM/02p7oDs3PmTBLu1EZouFFgZys6+753lRxefZS
 /QF1SD2ENFXh909d9FHInuCcuYzW4aiZIV/vy8M516wz04JldjaesbR1z Q==;
X-CSE-ConnectionGUID: lc9Dm4LMTc6Ac4Xp8wYnhg==
X-CSE-MsgGUID: fi9eiU8eT3K0yDFzzy8MjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4008624"
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="4008624"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 22:49:03 -0800
X-CSE-ConnectionGUID: 1PONP22QQpe0AknYRA6pWQ==
X-CSE-MsgGUID: ibcgxoB8THG3PgFkKw+wuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; d="scan'208";a="12869696"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 22:49:03 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 22:49:02 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 20 Nov 2026 22:49:02 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.52) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 22:49:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dUoTvf+cGyNubkh1QSShHPX9QFWq2D5/T5YjDPVxg8SpBchuHq9ag1m1FbvQ+YWUMEaJTsOpowr+tdBDpjgCCSMo+j/snjcUe4UbL6VDiJatNN9+XXG55GH33NH10ZUBzcUrooKJeC5Yc5PUmB9ZLdLrcXI3QGE7/v3FuPbq4CnQBB5eRmrqa9S//X0owlGrC7l9j6+f4PZf3dGCs3W1H9SBJvKD0FNjI4O0cFC0MlSyBT4UgoTM26InKZAub8CC2mww72QvX3DJ1KIWPzxPFvXZmFAVdFeeXmWqDr5EiREfm20KMBWgzAzP5YYMcQ02bLhHv0mISFhphQJiT4ll5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qFYLDXAKptmU/7B986Gr6XyBHHeG5tdo3CterD7F++A=;
 b=Az7isK87QM5Ew/SWxsFew05+ksboYITPcqLs8LwVO9xpJx2ny5asVL9i+aBsKazlqoQqzRTyY8M2NWxHgZn300rGK3DyLj/O7tJ/X9veRDhx5zpvQaUyNrU+fRYzFMpEU8ofxy6ICgDTzg7wje80ZWETC7mWmJV3YObTFzm6vU3wNpOvifivGDPRqGCM5BOl5qOYWl9oL/2erVOICfbYgpytg5olLsWi0X+ih8FcB3ZXnj6Dle1aRdtlvumBlWzjBpipCYaLXeNwnR9nglT6PRQKnRzdSHA+OyqSMgLuX5XvNMDpkHloezLJTr/ho2Mht5KY9TAO7th3kBcJ6JHn8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qFYLDXAKptmU/7B986Gr6XyBHHeG5tdo3CterD7F++A=;
 b=KOJ0kUYkIdL/lDAmmLl8e7COiJIOfuU8pUUW2QNYfD34HaxfUbxPkdInLbIHibb/X4/89ZBjdfi1tMn1+6q3vMOP4Ccx+astY7NZQyftRhR6F51bdc1Ive3b71O4r6H53XbAoOX3y64zdFmY9rVSGJBObzNyuIizDCj6J/E/vf0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by IA3PR11MB9086.namprd11.prod.outlook.com (2603:10b6:208:57b::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Sat, 21 Nov
 2026 06:48:54 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%5]) with mapi id 15.21.0639.011; Sat, 21 Nov 2026
 06:48:54 +0000
Message-ID: <42fd85c8-7e94-4def-be53-e79a281edc78@intel.com>
Date: Sat, 21 Nov 2026 12:18:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/6] drm/xe/cper: Prepare CPER headers for software
 errors
To: Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>
CC: <anshuman.gupta@intel.com>, <vinay.belgaumkar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <sk.anirban@intel.com>,
 <raag.jadav@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <jani.nikula@linux.intel.com>
References: <20261119060019.2031897-8-mallesh.koujalagi@intel.com>
 <20261119060019.2031897-10-mallesh.koujalagi@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20261119060019.2031897-10-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0132.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d5::9) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|IA3PR11MB9086:EE_
X-MS-Office365-Filtering-Correlation-Id: b6c61a9d-f805-44fe-5257-08df479b8206
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|10067099003|4143699003|11063799006|261022105027099003|261028144727099003|261026140227099003|261022113327099003|261021123027099003|261102123227099003|56012099006|261021121427099003|261022075727099003|261009223027099003|18002099003|22082099003|6133799003|261009221227099003;
X-Microsoft-Antispam-Message-Info: giK7bf47yjqmfS1t66fA797loLX+syewnPSx4pqkJZmqCK7FxtTTloNO5cIGwf1aZIN751a5Ask0Chtg+0qbBCR/W+bl2Xl41Ie8pm9FIj2Bq+fjkVQeJctAI1416X+izKSBM7zLHK8UixSSFhiA0gaO/BYyJs/97lUDYdugBPwEO9+TGUGMlL/3GhjpMK63wZdEftomFjyFDbL+ZXCCdF6K8BVTVp6w6eNe95uh7/Y7/vtSHninrTKbqhLZJUIZ9vkKTasauftOWflnTn4TzC8oYadFqIbXARycpRdctxdutjJe4rG2B1ZstmICrfLHQTnUb4UPhOOKPiuKfDrtgWhC7XCrOVPEA5zsQm3iIhpYLZRETORaZ6fsH5HQHm5w3u3LC3DKQrG7RLvN2Irt4bjKjOLqdapAU+Cry50xAajpUHfNJ4eqcBf+7p3Dt0Ic2G1A8Q39OE4eANRd3S6cq2J7gKBNiwPx/EvJCmCObruL6FgOa9XjIzD4R3W3tlo7RPvQYvUivHMkePbE89od4TGlADqo90Jd1PNHLNB081e/f15Ll9iR5RQ8YsApsKhU0ZT+UJt2CnMjBVFwTaQ+fddg3o2G9DQP6F3Nku+Hyzxlns0c+ox/qktFbISs72lRRoR6gVAF4uCbh0DTm8XcT1OTwkhOz9IUfSvNo39bVIg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV0PR11MB9792.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(10067099003)(4143699003)(11063799006)(261022105027099003)(261028144727099003)(261026140227099003)(261022113327099003)(261021123027099003)(261102123227099003)(56012099006)(261021121427099003)(261022075727099003)(261009223027099003)(18002099003)(22082099003)(6133799003)(261009221227099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TTFjNThWVC9CaE1aVVFGdDJndzExTjR4L3oxRnZ3SS9QN2VmR3pDQ1owei9U?=
 =?utf-8?B?ZUhuVjMzQjdUUkhWRUZQTXNCaE9EQTVzUDllUVV0Unlpd0JTaUY4RmRYbWRx?=
 =?utf-8?B?M24wZC80d05XOUlnSjA1NEZFSTRrZWdTVWYzZGJCaDdmVWNqbDZMejVYY2FX?=
 =?utf-8?B?Mlk2SnNxZjFHQStxbGo5SzFWVXNPam9DSHB5eWdHRTZFcmxJM0prMjh6YUcz?=
 =?utf-8?B?ME1FSGpSKytub2pvQ0wwRTRRZmdMVk54WTVES243RVgwMkVhdzF1TGVlcWtj?=
 =?utf-8?B?b3ZucVVrbmVCaXVtNnNQdTdlSmVPUEI4MldCY0FBRm4yTWQ1TjJVQkc3TVE3?=
 =?utf-8?B?SUZnUFhiMGMxNGhsYWZUc3VVcWt3YmdVcXh6aXFqMG5ZcER5S1dwNWlnSkJG?=
 =?utf-8?B?aDhIbnJZT2NMa05lVGt6SXJNeFBCOWxtaDhKUVkwa1lsblhpMVVrekx1UjlM?=
 =?utf-8?B?WHorOTRIblB4SC8zb20yaUozQnZZRTJ4SU9waE9hYWNqVmFqQmFHR0dldHR2?=
 =?utf-8?B?VHBXYUZiWmpVTVc0RUVNV0hydTZlTTc0RWtaSURJc3g1Q0V5OHJwLzBsdmJq?=
 =?utf-8?B?ZFRJYkRPVmszN29XMjZzeFc4blZVcDNlY1cwZVZ2ZG4zL0t3N2c0NGtZMjZX?=
 =?utf-8?B?eDN2amdLa1piOFpqQllQMk9OTWxDeG1oYTVtd0c3OUxxSXUwZWZ6TVVlY1kx?=
 =?utf-8?B?eUowaXBVVnZLbERQTFRGVDErSWxnTXZIaUEzQ0NPb3FmeGxwdXp4cG1LQnl6?=
 =?utf-8?B?c3RzUlVDSW9XL3hZSUpkMXd0MWwzSkpFUVFRWllUc0JFWmd2cFdCdjJHd2xZ?=
 =?utf-8?B?aE1zYVN2UHZ4RG5KbzB1d1poN2R4SmVGUnJMK2JoVHd6L0E2eDJQMnRQamo2?=
 =?utf-8?B?SHZvdzlnUHRkR0M0Q3NOR2wvSE5sd1NIWmJYTE4vOGsrQnNlaEQ0bEtIc1V5?=
 =?utf-8?B?WWtuWVY1c1dLOExVNElsWkRuL2J6MzNPeGtuV1lZSk4xcjEydnpTb1p4bGla?=
 =?utf-8?B?Q3cyNjFBQnhPY1ZQUmJ1aE42NGFLekRwaTgvQmYvSHZpcmpIQ21YUUlyYllF?=
 =?utf-8?B?UFV5cTV3SkRYMER1YXNJb0dqOHY0aGlrZzh0cFJmaVdvNm83cm1JSElIOEda?=
 =?utf-8?B?VGh4Syt2bWFMSUNnWXI5bFF2WUwyYlhLRHAzUFQrVkJlTlp2M0V6c3JYWG1W?=
 =?utf-8?B?ZERiTHZkbDVzTW9nbENmdlNmRE9nMHowYzJVTmhkVVpmTzBJSGkwZkVLUWZ6?=
 =?utf-8?B?R3BQc29ub2N4bXgxbTN2SDRrOGoyUWZhWE9IZzVReVV6N3ljbmRIS1hTcmRE?=
 =?utf-8?B?bENBL25VMExHVDczYmpWaW9FaHBwdThkUk1qVm9IZmpyUUVWcG90cmk2Vm13?=
 =?utf-8?B?WlhvVmdmN2hSYk1wTzl0YXJFZDNPSVBWK1doSUxJU3FhQWZQdUNudHdMT0N6?=
 =?utf-8?B?TU5IL0VDSWtzUjIxV0hQcEl1TThtbVpIRVg2aHJWUU1QYWNrYUIyYzkwQkRX?=
 =?utf-8?B?U1NpcnVLSzlzTXVMaDkxRUFxOGR4Ui9rdHdZZ2tWTzUvTEhwSStpTURUZmdy?=
 =?utf-8?B?ZW5WLzNNdU4rTmNFbjNJQW0yZmNUZ3ZKRU1MTWJaZHptNDZKaTFhOGV3TllC?=
 =?utf-8?B?YnVHUjZzenJ6R2YvaURZQjB3RmNlN0NaUFAwZUlaSVFSR1hLNnJJNXpRQWhy?=
 =?utf-8?B?cVkwT0lFdXIvcndqZithaVNCWTY3TmxCWGk4a0gxS0hvbmVrbTRxcGdZeE00?=
 =?utf-8?B?RkZuempySXFsa29CR0h3aVpiUW9KMDJsVFpieUtZVy8rbng1SVAzZ1VjQjBo?=
 =?utf-8?B?U2h4bC9vNTlIRFBZODM4aHNIMVpCVEdCOFUyT3RLM3p0elQ4UkxSbzBSR1Qw?=
 =?utf-8?B?U0ZLbjl2WXFFK3o0a0oyUU8wUHc2c0ZjL3UvVGtZc2xJR2lvaHhEQ0VnUkxL?=
 =?utf-8?B?M3dOc3kvTjFoOHJaajJoMCt2M0lXcEtnMWsxeFZsTzFKZlFrb2xRL1g0MjhL?=
 =?utf-8?B?ZkREdzROeHVnTHpzMnBFUDI3VjZaOElTSGZBOC9Yc05PSlpqOGp1aURjTjBs?=
 =?utf-8?B?SjljMUlLMGppSmZ1cytlOVhWc3FPUVBheGgySE5sbXlSVkI0eWNHVjFENitT?=
 =?utf-8?B?SEdsOU8zd0lmSkcyMjg4TUdreXdQUlNaRGFBUDBiR0E0aVg1RkZFMjU1ekJB?=
 =?utf-8?B?cjNxNkRvZVF4WWtsc0FqSU9NZTBSelFDVVZPN3dFMDZaUDlSSE5hUE1KL2xC?=
 =?utf-8?B?WndiVjg5RXdiaHpWQ01kT3NNbmhoRkpoRFAyR1VRQ2dNQ2E2NEVYNmpsOEg1?=
 =?utf-8?B?dWFuOVVCTVZNc0drWTI3NFlIczdKc2dmMm5hY2IxSDkyU0hRWmtUUT09?=
X-Exchange-RoutingPolicyChecked: X+YTn0dpcpfuwPitb6w+vRzLnKt4O01JDtGNIC2TWSBFALTD70FeVRMAD8jDZzCu7AbIWZeUfBzoDHI8n2Rn50ex6eGocLz9NFibbgQ2ZKYaxlV5RlH6n0Fma6JtJZ2SrWVjhRvCSx9k4fdEXCQBOoxTurG8yDZ8IR0ZnaRb7J5TWoyVTV2ziyrBJVMtUfwJp1zWmid6c6XXwBIAGI3SNriBYru3pG/27umEaQ+huSciuVLZm4XABJlGV/R9dumFUEWOpQhH3WFmi3uYJzvUeiatvKIKivRFf/EH/X6XMgboRbTnn3JzIDve1R7XLqwpQbKvVWmnNVFJ7HxReZyvqQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: b6c61a9d-f805-44fe-5257-08df479b8206
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2026 06:48:54.0020 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A6IoXVyr/pIVwEWGoGlqupUs5vvEMlk3/dMnK4DZ1pOAsrcRa2CNayiW+JiWAXVxBX2fh42liroMGrnshDfobQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9086
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


On 19-11-2026 11:30, Mallesh Koujalagi wrote:
> Add software error classification support and reuse the
> common CPER header initialization path.
>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
> v2:
> - Move union inside xe_cper_intel_hdr structure. (Badal)
>
> v3:
> - Introduce structure where it's used. (Badal)
> - Move error-class union inside cper_init_intel_hdr. (Badal)
>
> v4:
> - Update commit message. (Badal)
> - Use ktime_get_real_ns.
> - Add BUILD_BUG_ON. (Raag)
>
> v5:
> - Call timestamp near to use. (Badal)
> ---
>   drivers/gpu/drm/xe/xe_cper.c       | 26 ++++++++++++++++++++----
>   drivers/gpu/drm/xe/xe_cper_types.h | 32 ++++++++++++++++++++++++++++--
>   2 files changed, 52 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
> index efc49ecb86c2..4cb83896c6b5 100644
> --- a/drivers/gpu/drm/xe/xe_cper.c
> +++ b/drivers/gpu/drm/xe/xe_cper.c
> @@ -14,6 +14,8 @@
>   #include <linux/time.h>
>   #include <linux/timekeeping.h>
>   
> +#include "abi/xe_log_abi.h"
> +
>   #include "xe_cper.h"
>   #include "xe_cper_types.h"
>   #include "xe_device.h"
> @@ -92,11 +94,14 @@ static u64 cper_timestamp_now(void)
>   	return ts;
>   }
>   
> -static void cper_init_intel_hdr(struct xe_device *xe, const struct xe_ras_error_class *counter,
> +static void cper_init_intel_hdr(struct xe_device *xe, const union xe_cper_error_class *error_class,
>   				u64 first_timestamp, u32 sig_id, u32 error_count,
>   				struct xe_cper_intel_hdr *ihdr)
>   {
> -	ihdr->counter = *counter;
> +	BUILD_BUG_ON(sizeof(struct xe_ras_error_class) !=
> +		     sizeof(struct xe_cper_driver_error_class));
> +
> +	ihdr->error_class = *error_class;
>   	ihdr->validation_bits |= XE_CPER_VALID_LOCATION;
>   	ihdr->sig_id = U32_MAX;
>   
> @@ -219,12 +224,12 @@ void xe_cper_emit_counter(struct xe_device *xe, int cper_sev, enum xe_sigid sigi
>   			  const struct xe_ras_error_class *counter,
>   			  const struct xe_ras_get_counter_response *response)
>   {
> +	union xe_cper_error_class error_class = { .counter = *counter };
>   	struct xe_cper_intel_hdr ihdr = {};
>   
>   	xe_assert(xe, is_hw_sigid(sigid));
>   
> -	cper_init_intel_hdr(xe, counter, response->timestamp,
> -			    sigid, response->value, &ihdr);
> +	cper_init_intel_hdr(xe, &error_class, response->timestamp, sigid, response->value, &ihdr);
>   	cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_GPU_ERROR, &ihdr, NULL, 0);
>   }
>   
> @@ -249,6 +254,19 @@ static void cper_emit_sw_err(struct xe_device *xe, int cper_sev, enum xe_sigid s
>   			     u32 component, u32 location, const void *data,
>   			     struct va_format *vaf)
>   {
> +	union xe_cper_error_class error_class = {};
> +	struct xe_cper_intel_hdr ihdr = {};
> +	struct xe_cper_driver_error_class *driver = &error_class.driver;
> +	u64 timestamp;
> +
> +	driver->error_type = cper_sev;
> +	driver->error_component = component;
> +	driver->tile = location;
> +	if (IS_ERR(data))
> +		driver->cause = -PTR_ERR(data);
> +
> +	timestamp = ktime_get_real_ns();
> +	cper_init_intel_hdr(xe, &error_class, timestamp, sigid, 1, &ihdr);
>   }
>   
>   /**
> diff --git a/drivers/gpu/drm/xe/xe_cper_types.h b/drivers/gpu/drm/xe/xe_cper_types.h
> index 68e30df0440e..c9ea8b1694a9 100644
> --- a/drivers/gpu/drm/xe/xe_cper_types.h
> +++ b/drivers/gpu/drm/xe/xe_cper_types.h
> @@ -45,6 +45,29 @@
>   	GUID_INIT(0xea9d8f84, 0x4258, 0x5227, \
>   		  0x80, 0x28, 0xb9, 0xb1, 0x3e, 0x6d, 0x58, 0xb0)
>   
> +/**
> + * struct xe_cper_driver_error_class - Intel GPU CPER driver-detected error classification
> + */
> +struct xe_cper_driver_error_class {
> +	/** @error_type: CPER severity: CPER_SEV_* */
> +	u8  error_type;
> +	/** @reserved0: Reserved, must be zero */
> +	u8  reserved0;
> +	/** @error_component: Driver component id: CLASS[7:0].TYPE[15:8] */
> +	u16 error_component;
> +	/** @tile: Driver location id: TYPE[7:0].ID[15:8] ('tile' and 'GT' field region) */
> +	u16 tile;
> +	/** @reserved1: Reserved, must be zero */
> +	u16 reserved1;
> +	/** @cause: errno of the failing operation, or 0 if none */
> +	u32 cause;
> +};
> +
> +/* Same size as the counter-sourced error_class */
> +#define XE_CPER_ERROR_CLASS_SIZE	12
> +
> +static_assert(sizeof(struct xe_cper_driver_error_class) == XE_CPER_ERROR_CLASS_SIZE);
> +
>   /**
>    * struct xe_cper_intel_hdr - Intel-specific CPER header
>    *
> @@ -52,8 +75,13 @@
>    * All multi-byte fields are little-endian.
>    */
>   struct xe_cper_intel_hdr {
> -	/** @counter: Error class (severity, component, location, cause) */
> -	struct xe_ras_error_class counter;
> +	/** @error_class: Error classification */
> +	union xe_cper_error_class {
> +		/** @error_class.counter: Error class (severity, component, location, cause) */
> +		struct xe_ras_error_class counter;
> +		/** @error_class.driver: Driver-detected error classification */
> +		struct xe_cper_driver_error_class driver;
> +	} error_class;

Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>


>   	/** @first_timestamp: First occurrence of this error class, in ticks */
>   	u64 first_timestamp;
>   	/** @sig_id: Aggregated error class SIG ID; set to U32_MAX if unknown */
