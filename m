Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91980D2503B
	for <intel-xe@archiver.kernel.org>; Mon, 12 Jan 2026 06:57:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1208F10E027;
	Mon, 12 Jan 2026 06:57:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GNfVSzlc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 756D010E027
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Jan 2026 06:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768201022; x=1799737022;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Rz5fuJck++5r+gQRzmi72hcvl9DZiygDhR59XBF2dgw=;
 b=GNfVSzlcXL+mzBQ+xyLKWUzvgFNHVvPsBAbDiYLc9pTJ/Rgwfw23P42X
 XFmb1J5wj/W3AnyoSM2PHHmmPgOqoZ90tnxKHaUv1JQLsXQbVKZGS8Ey7
 vm65uCM4AIUgbQGIu9PaoChtT3GZnVAqOkWkcPCrqwsO4VeLEyn0LHb27
 Yabd0dAoizFps5KGRxS4poBkVp5TCiTbD7prdQZtjeev5Xg/4dza6JAU/
 xiHEQJcD+BIgsBnGnH0QstET0sZo8eNKxeN/4GIDu/u3StEXeD1eiucVn
 puSvOIkdahjAsbgQpFoLBx36Jcj68ReXBGihzc8VdDwSoH8fZoQQvASob Q==;
X-CSE-ConnectionGUID: NIH57LyLR1GTKAbD0ykZ1Q==
X-CSE-MsgGUID: dsfpGfwATFC1pfjq9dvNPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="69522407"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="69522407"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2026 22:57:01 -0800
X-CSE-ConnectionGUID: UCYEs2eETfKUDiwtkr0V/w==
X-CSE-MsgGUID: AxRS0cVlSjqjdjwipbUSzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="208166458"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2026 22:57:01 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 11 Jan 2026 22:57:00 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Sun, 11 Jan 2026 22:57:00 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.65) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 11 Jan 2026 22:57:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jgmg1YBoYz7D/o+E803/XRkCgwTvcwKOhbhlmI1n19mwJicr3DhfAtCAf7ZyIDhKzgqSafeamxLbCmoAKwgzwVltmvvAhyxDLVOAshwHhmAcX3/UWCUjKAjojtjnqfQnm2JeJqGfr3FjaZc4RczdgH9KcKjh2PTx6IYYEkqCULWd4CQ6dpTp7k6ExmtqdGXZIvXZ+6Qfu2qfOT3/x+0OekkKpC98bQ3Q2F6dunXIPm8I7v6J1tph9YBddeDE1dNjQIxD9bTvEDnYbdXmcAFOMJyihDsYKbZqmKAKvxjfkVfWpukeKpZteEjAdNjucPJ7MtFELtmNfxA4KAyPL1TBBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bC7WOrfEKpWloG30QWILMipf8ujws3kk/KKwuIbqnKc=;
 b=guSOrtrEGnwiRFIvu/fcGKHETFmnEtBC5ED93/ZBa2J0zvxCiIsodonPstUyO0EGHBIlQxOax1Cm23XitVvdSBoAONzKw4fFnK+A16r2PjhPk0Vm5BDu3ApciVSUT9Wic9jcvna6on9BHD0FnXbTYUGvuCzrbZAdOseBeXljjjnZxyg9FWVAlSGsOps+sPgF6/mpZTzXtFHtnY6PZSKdjplqZAAsa9bJ/GBQQkbgK8vuRDkmsOH8xMlvAwa6vzp4dsOprRZL5PQTeme6fTTmgMrSKxggwpVHYMM/t02JZbDSJ8Xrd+GuoIfmwc0/hVCSeuoU+7Rihul7HLAi7pl0Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by SA2PR11MB4939.namprd11.prod.outlook.com (2603:10b6:806:115::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 06:56:53 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%4]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 06:56:53 +0000
Message-ID: <816cf42f-9ca2-4df0-af7f-799e75bc8a46@intel.com>
Date: Mon, 12 Jan 2026 12:26:46 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] drm/xe/hwmon: Expose memory controller temperature
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <rodrigo.vivi@intel.com>
References: <20260109201644.736483-1-karthik.poosa@intel.com>
 <20260109201644.736483-3-karthik.poosa@intel.com>
 <aWItFl5qz85fwjA6@black.igk.intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <aWItFl5qz85fwjA6@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0073.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b7::12) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|SA2PR11MB4939:EE_
X-MS-Office365-Filtering-Correlation-Id: ea7a7300-402c-4be3-3b39-08de51a7c44e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aXovSitjclhobDA2QUM5a3BGQXB4R0o3QzZISFZUcjB1U3BpNHJ1Y0Jadm5m?=
 =?utf-8?B?Z1V2blV6WXFRdEM2MUo3ZForNzYwQlZaREduSisvemlFRFJBZ3ZzWDlIclFG?=
 =?utf-8?B?aWVOYzR1dHc5SDBKY0RJSVJGQjFmNDBoanBFV1g4RnNTSFlWaXR1K2ZXOG5k?=
 =?utf-8?B?cHB6aXVRem1IMnVoVzRQUVZJTHA5UEJIZ1U5NUFMUzBkYUtjb3lNUFQrUW9P?=
 =?utf-8?B?QVVYSnovS2Q4Wnk4OWVmdDVYeWtNYlZOR2ZVQW5KQW5tK2RNYVZCTWVLS0dW?=
 =?utf-8?B?b281dk9IaE45TmlEdnJFS09SQml6RTdSV1hid1JET0NQd3lDaGszMEplK2J2?=
 =?utf-8?B?ak1wa1JEYmRCNkhGMkxpU0hPbVlZaVlzY2hNK0RMWFByd3VYUTg1WU1aZUFM?=
 =?utf-8?B?SUdaTTVxY3h1QmNyamZub0NMZHlZK25Mak5taDlBeHFMbjArc3BQTTBVcWJl?=
 =?utf-8?B?TTN2elJQN1pMVVhoclp6ekVCZVA1ZDZlS2pycG1GbnpkamRVUGorYmRBNjBs?=
 =?utf-8?B?ZHVqbFAvSVZnSGEwVjZROFBCKzBZVDI5S1c0U0JUbEpYaEdYKysvVjhKS1dI?=
 =?utf-8?B?eDMrNXNZRmRjSGpLZG9DeVB5RkJYVFpxa2Q4c2pVVXNtcEhGejRqaHJDWkpD?=
 =?utf-8?B?V291djdJaWV2Vm43b1Naay9mbUZ6cVJQWk5JZVNWb1FrUXVhaWNvQURWWVU4?=
 =?utf-8?B?QkR2WmhIaXArZjJodmVOWER6VzVEeHZyRlo5VXczeWN3QmREWnVJajRuOFZU?=
 =?utf-8?B?eG5nbTJQY25QNmFWTHFES3M0eXJmMTVXLzl3N0o2TmtKQldYNkZ1N1pTdzBB?=
 =?utf-8?B?RUgxTnVFZWRCa0NJLzE4Ynl5c0xYUFBQVTdFcWxST0djOGJvUHo5dm15ZjNX?=
 =?utf-8?B?MWVYV3BuOHlPNnY0MWQxUUxhSmhKa3AwbUlpeHI3aVU0c1c2c0tPYTE1aGVp?=
 =?utf-8?B?amtGTlRRNE5LR0MyanhzbllQbTliM3k4TlVrT1NoaENqY3pyc05WSFZSMUdy?=
 =?utf-8?B?d2xEYXlvN3U3U1N6ZXNOdkg0QmtORHB2ZXR0Z3lJNEwwQ2xrdWlLYXFKbHNo?=
 =?utf-8?B?cjN3bjVUSVpMMGRtamViOXRwUUtEOGdkL3gzSjQ0OStjOFlKOFFRckhQajdj?=
 =?utf-8?B?U0dQMFFyUER5cXlvSFVrc0hBdTZHQU9YN08reERzZmxYVHV3RVk3cDVMaGZI?=
 =?utf-8?B?djVEQVVXdnZFc3EzQklpaTd3TkJSdUZrczRyeSs1MnB4R0ZyK1AwODRQSnVh?=
 =?utf-8?B?T0Q5YWZLRjBqWlV3ZXAyUEduQ1FPOGh1QW1Yd3I2bVNoS2F0VTZKQmxTU0gz?=
 =?utf-8?B?amZ3SUpQN0JrVzZGSUt3RFlWdWN4VnIxNDZDTEJXZVhxSDhaMDF5NXdzaHhF?=
 =?utf-8?B?bWpXeUhSV1J3Q0NGemw0Y1k5VUdGUmZ0VGJPWXpHTEw0OTZiRjJGVGdmak9Z?=
 =?utf-8?B?MElOM3NpUGk0K3dYZmJMa3V2TGFNSmE3aW9Yb1E1VEJ4ZGNpK05ONEpYaEpN?=
 =?utf-8?B?ZitRUE1RSGI2NkV0cjNvT21peUV4SDM1ZjRLcXNZSjIybWR6eW5WQWljYjVs?=
 =?utf-8?B?eUZER01lZjJqMUdOeFZjaFIwd3lPb1NWakNMbzdKYWJRMmZ5N2NUQ0VUR0wx?=
 =?utf-8?B?Wm5HMGgzS3d0aDErb1FCTlNWaGhiVG9MdEJjamIvNklIZ2kzN0lVdkZQNEgv?=
 =?utf-8?B?a21TLzc0cWs2aXFweXRUWFhoUWdFQTJHdy9xeDlqbnJib0IyVUxTY0pBN0Fs?=
 =?utf-8?B?dStHWThONTlDZ0VYeFdTVExFMG9ESXUwdndtQ1pjYTdUWFIxa1BGb2Uwc3JU?=
 =?utf-8?B?aDh4dktweVBVTTErK3B6ME1kbkxmaEFNSzJEVUFhenBYYjVuM0hqRXd3YTFs?=
 =?utf-8?B?M1VVMC9ZNmJLZyt0S1J5VkRFbFVJYnhsRXllNWQrWnlJaHR6cEtrNnF5SDhv?=
 =?utf-8?Q?UhxbinOyTxdX7/OYLX6AxBeinbVBBKFi?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bW1LdW9NQkk2SXJJZGlHS2dkVkZyZDBtMmwwZzMvU0h3R0daQmtRV0Vwc2pu?=
 =?utf-8?B?a3RwbGx4b2R2YjRON0Vjc2dhUUlXbnNXRzU1M0RIL0V1ZDBieCt0QUE0UGZJ?=
 =?utf-8?B?dDVtNndvTjN1SFdBVTAxMW5ZdGJab1NpelFPeWNmNTZaNUpKV1g3YWRQdXN3?=
 =?utf-8?B?SWgvR0N1bmN1TnhEcHFCTE9ralR2ci84T1dvTHl2a2pLSk93cFEzZ2pGcSta?=
 =?utf-8?B?dmtHQzhzU2hZcXpTSjludHdRbTF0bld0QjlVbW0vMG1QNXJCVWI3K2duTnBy?=
 =?utf-8?B?bFhOMlRrcG0wNjhrZk9ickhBZmZLMWoxRlBSVTRoWjViMW12a043RmhoNkpj?=
 =?utf-8?B?YU1aVkNVdTUvbHlHanFaNHhORFkveGFEaDNDMmhOM2hLVkZ2N2lwdTZCYk1S?=
 =?utf-8?B?MDk2OXcyVjJXV3VxM2RiSWc4Nks5SStrazNqQlAvN2RjRTBCL25DKzQwd2sv?=
 =?utf-8?B?dFYrQU9hbXdTMEdqVG1hMWhiTURtOWRuVFMxSGUxSFIwRjhKT3F3dXVhb3A5?=
 =?utf-8?B?UHgvNDBBY2prczRRVlZqT2pUZ1ZsaWxkUERUaWc4Yy82Q1VQWklqREVlWHF2?=
 =?utf-8?B?MngyRUdKOFFsQUhKT3BzV0hlRjFPQjBaaW5hN1dwdVVpVkdtYXVVc1YrcWdQ?=
 =?utf-8?B?anJ0Nk9IYW9UMnBrSS9yV1VaUTRLcENodnBGNVNxUnZjWTdwU1NSMDBQcTRS?=
 =?utf-8?B?TGRXSENMSkp6TFRBTWQ0SUQ3SGZRZjFJZjhMMGZzeWVYYjVMa1lha3FieG42?=
 =?utf-8?B?eTREZ09lQ1lnYXd0MDRGL2VFK1R5NzNzeVh5Q3ZRMGxla3lWTHVvK2V2cGNi?=
 =?utf-8?B?alcwMzU2ZFJCY3JsWmFxMHM2anc3a0Z1Q3ZvVnhoUmU0YVNuWDR2eVBSMWU0?=
 =?utf-8?B?WVNHVzJwK2o4U05ocWIrQzVXYTZsbjVZM2phQzZZMmdPUllEc0I2VFQrWHky?=
 =?utf-8?B?bEw2aFpJa1FnNGtiaVNFd21IVUpyb0l3REpTRmhCWHRaeE04OXRYU0tlMEZB?=
 =?utf-8?B?MUVsSVJlRlpnY3dUaERyeFk0ZnIybzUyVTZpcGs2ZXhRTk9sWFFab2VSWTZj?=
 =?utf-8?B?TlRnZEZVeXRQbHpXQ1JodkxuYk1aK0lqQzl4Ky83ZFFVVjlZZ3NwVVcrTzN6?=
 =?utf-8?B?ZEEyMWpXYWJxYkhvd2JTcTU4Z1kzVGo1UHZsN3N3Q1ZzWVhTUnkzOXYzeWwv?=
 =?utf-8?B?NWFPeWdxVFZlL0YvazFDUlZOR3huNTdPSTRDQTkrd2JmbFpTNkppallnOUZz?=
 =?utf-8?B?MXFjS0h4MkI0MXNkblAySjdHUmZsZHFQZnFCVW54SlJobzdRUWR1TnZFaE42?=
 =?utf-8?B?UG0yTVVLSEZLTGR1Z0d2Y2lLL2VaT04wOTFDcmpTUTBrSTJoL0l2Y1VYdHNJ?=
 =?utf-8?B?dkdsUUJYUkE5RGV6NWFLQi9rYVVPTkNSRWsydTNTbUtkbU13THNpM0owZkZ2?=
 =?utf-8?B?dmVXQWZhaHNjSG5xS2F1M3RBbm5rb29CN2JvTGdmRmNUMm05U0lRTWhPU21O?=
 =?utf-8?B?aWExMGVleUxiNURIZi85N050UmV3bUppK1AyeEwvS1JpekpmeFBJM1FGTGM4?=
 =?utf-8?B?eUlOeTlwOFZyclFwYTRNMkk0SVdCQjIyUUxyZnl2UkFQTjZPUDdWQU5TYkJt?=
 =?utf-8?B?UDhRZ1AyL2QxcDdkNk56YlQ2ZFBjRlFnQ1ZJbXlGUStoaGp5WFlEaDZPeHlv?=
 =?utf-8?B?TE4rWDkzY0xuTkhxaUc4R1lQRlJmY2Z6c1JMMEdlMEQ2SnloUTF5WEszTDEy?=
 =?utf-8?B?NzJON1Y1YzFxQzQ3OGpUTkt0ZnlUOUVzYVZLMXVNVGMzdDBHOXJnQ0tvRUlY?=
 =?utf-8?B?b2RZU0IwSmNkUHFpZ005R3BVZmtXQytVQWxPWUNEUlRPTjdFRm1WcUFtZkVO?=
 =?utf-8?B?WkREdk8wamF6VjlORTNVbVJjSEo2SnU0cGE1b3lLYm12RmNXbWlEVGVCR3Y2?=
 =?utf-8?B?amJmRDRPaEExL2hsdjdyY21VZFNCZXBZWmU5RkNLRUk1MWNjdC9iRFJxLzQz?=
 =?utf-8?B?VHpYUHdQd3V0bHJZSTNGQml3STduZndnMkYzWHg2ZVVneHhrcWlvaWx6UEJZ?=
 =?utf-8?B?RkZ2U20wKzdHc1MyaXljNzFhU2JaOGhpa3ZzV2Foelk0WVV1aXViVzVPcG0r?=
 =?utf-8?B?cEN6WXR6WVIvZXlaUlhPM3k2MEprYWxNaFZxL01nN3NpWDFsSlY0czluaENU?=
 =?utf-8?B?VXhXdG90QWdHSHcvNHZYeTRxUGhPZ2VYb1JuZ2pTSU0yaUN3cXVWRFE4cXFx?=
 =?utf-8?B?aiszMWZ3VDhnNStKQmNmV0t5cnl6TkRTa3V6R1dSN0xxUTJlRE9CZ1dNSHhP?=
 =?utf-8?B?U1FsQnVYUDhtS0ZxVjJKYWVISUpzdUxad3cwQmtLZ0NtVEF3WmU2QT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ea7a7300-402c-4be3-3b39-08de51a7c44e
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 06:56:53.1342 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Olcm1C8urvMP9VnhCu2ygUml+N8ymExY19Mu1gvk07sEWQsFHqlRCp+0FdggftBC6TU1Qh/uysLhpgyB21oiQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4939
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 10-01-2026 16:12, Raag Jadav wrote:
> On Sat, Jan 10, 2026 at 01:46:42AM +0530, Karthik Poosa wrote:
>> Expose GPU memory controller average temperature and its limits under
>> temp4_xxx.
>> Update Xe hwmon documentation for this.
> ...
>
>> @@ -718,15 +727,50 @@ static int xe_hwmon_pcode_read_thermal_info(struct xe_hwmon *hwmon)
>>   {
>>   	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
>>   	int ret;
>> +	u32 config = 0;
> Use reverse xmas tree order.
okay
>
>>   	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_LIMITS, 0),
>>   			    &hwmon->temp.data[0], &hwmon->temp.data[1]);
>> +	if (ret)
>> +		return ret;
>> +
>>   	drm_dbg(&hwmon->xe->drm, "thermal info read val 0x%x val1 0x%x\n",
>>   		hwmon->temp.data[0], hwmon->temp.data[1]);
>>   
>> +	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_CONFIG, 0),
>> +			    &config, NULL);
>> +	if (ret)
>> +		return ret;
>> +
>> +	drm_dbg(&hwmon->xe->drm, "thermal config count %d\n", config);
> If you want decimal value then I think you should print after[*] you mask
> it, but if you want raw value then I think 0x%x would be more useful for
> debugging.
I'll prefer a raw value for debug, will change this to 0x%x in next 
revision.
>
>> +	hwmon->temp.count = config & TEMP_MASK;
> Use REG_FIELD_GET() for consistency.
okay
>
> [*]
>
> Reviewed-by: Raag Jadav <raag.jadav@intel.com>
