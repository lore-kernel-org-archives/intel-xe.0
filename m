Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA9D6CEACD6
	for <intel-xe@archiver.kernel.org>; Fri, 14 Nov 2025 21:56:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D52D10EB3F;
	Fri, 14 Nov 2025 21:56:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="csiGhmdp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0E3410EB3F
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Nov 2025 21:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763157380; x=1794693380;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LUd5ObdI70RJY3K5vswNS/cfHPTJZ66RiU9Oh4aYZfg=;
 b=csiGhmdph9gMs1ePu2lvOBdzxxtk/wWvObWgLYxoE97uOJ7SRUSgwEqF
 FW3Sg2X4xH2hKVQzVHxA8SPSF7fvH+JvVtflrm+JALNt140J02VGm8LI5
 jZ+MgpFB4EiZbUURs0KjSyvXz17bag6o9Rt/bfQkMvFN0WY5FFoDDhd/T
 OaOsEm/KH7cfoZpBXwE0HLeFJtTXT7vtBQNf/MsQQ0vmoyfh9w6cra3SP
 z8WPcFTpahpBymDxW21pzvPyqj8EhsBcWKRmhTXoPUGVaNNpVRg0RMEW5
 CBJF9ALBMEHwmn6LpkPx2URfFxpzX+NVJGQ7qF86MA0X9j6snnuEJttNY A==;
X-CSE-ConnectionGUID: NaJ6xUJnSqKe7deN5mTQ5w==
X-CSE-MsgGUID: zayzDvVtTcur7U65MoHmIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="76602637"
X-IronPort-AV: E=Sophos;i="6.19,306,1754982000"; d="scan'208";a="76602637"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 13:56:20 -0800
X-CSE-ConnectionGUID: ENZR33IfTCG4ZjZlOjq+aw==
X-CSE-MsgGUID: ATSfKi3BQcCkAsCtzcbUQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,306,1754982000"; d="scan'208";a="220760400"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 13:56:20 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 14 Nov 2025 13:56:19 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 14 Nov 2025 13:56:19 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.5) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 14 Nov 2025 13:56:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uZktx6oL/b3HJSZARcRHYzdrz26bAjpAP/WWIBvp3+YCnBxDBsdtfO8cJjtklVC6ktxxlsfKTEfnUojKrQqyLOEkel0Ms+e8XUG3yZmCovPwaCKd50tP+omr8Zg63lhmyn8vd94yYP9dETIsvL3IIGGxnJFEzcOoaexZFV1RIiasCB0ntitZPi8Lmppj2rt2wbAP1dFg+/encvFXdZHWCxb1v9rt2ZQEz80EQbDcFCulOz/3ysMdd2W3RFz+8GzqJRdbwt2oUit8Zlx6eVKgyeR+TzgYPpxSyxJ++JfrlXVFZus8p2k6vjbB7wlCmbHzL7aJSV+CYJU6TrS5HM17Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LUd5ObdI70RJY3K5vswNS/cfHPTJZ66RiU9Oh4aYZfg=;
 b=v7q80uD1wgN399MFppY3MQ7zOERz0mAZSwXAAXjeSMpq+ofKrMRPObq9TjO2751BGKvR4t7iaO4rQhkSi6mGJ3Wu6GTNiL4vBjCqyryCBT5PZR2mQHanZP2l9C2WbHkAZNCSjGtWti2huXyv2XspIBzBbDHVOyNSLN9+9JJyXqCHq1T4dYXqBfzhhfau5RY6/Um25D/L0odbO79hd9ms6l3Rfir/AKQzb9mZR/xxRWGkDHra5iH4KFy+zmPezLdg3qgJuNgR/gMgHRPZhLez1NK8LP2ZZ7RX3c9W9lvxs7wVMhohmjIyznBS1Vn4feJ3dBOy5obO6MJB2m4epX6YVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22)
 by LV3PR11MB8696.namprd11.prod.outlook.com (2603:10b6:408:216::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Fri, 14 Nov
 2025 21:56:15 +0000
Received: from SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::f04:d46a:1742:5c3c]) by SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::f04:d46a:1742:5c3c%4]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 21:56:15 +0000
From: "Wang, X" <x.wang@intel.com>
To: "Wang, X" <x.wang@intel.com>, "Lin, Shuicheng" <shuicheng.lin@intel.com>, 
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Lin, Shuicheng" <shuicheng.lin@intel.com>
Subject: RE: [PATCH] drm/xe: Fix freq kobject leak on sysfs_create_files
 failure
Thread-Topic: [PATCH] drm/xe: Fix freq kobject leak on sysfs_create_files
 failure
Thread-Index: AQHcVanLM8RFtzv7W0SoSjEUO4416rTyrsXAgAAHYWA=
Date: Fri, 14 Nov 2025 21:56:15 +0000
Message-ID: <SA3PR11MB80467A0A5FC550D0F8FDD87786CAA@SA3PR11MB8046.namprd11.prod.outlook.com>
References: <20251114205638.2184529-2-shuicheng.lin@intel.com>
 <SA3PR11MB804611CDBF833093BEDBB0DF86CAA@SA3PR11MB8046.namprd11.prod.outlook.com>
In-Reply-To: <SA3PR11MB804611CDBF833093BEDBB0DF86CAA@SA3PR11MB8046.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR11MB8046:EE_|LV3PR11MB8696:EE_
x-ms-office365-filtering-correlation-id: f3ef3a66-6a2c-4b3c-7eef-08de23c8a203
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|42112799006|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?QnhuR1ZhekNUUUtCT1IvcGd0dWdIdm01RytXRjZHN0NCSDNFeGlySmp6RjJj?=
 =?utf-8?B?bU5HY0NvUHRyMlRvZGsybkVnYWJpeE1JK0grM3BzaGhEVVo0NWxDN1B3a2Ja?=
 =?utf-8?B?SVZ4OG5sN0VoT2Y4RGVGYlZQeXRMa015STVKUXk2bVhWdFRUaTRjOVRZbTZo?=
 =?utf-8?B?bXRlTzBzaVNtUmVvU3JiQ1Y4ZHdzTzIwYlhzV3lzUzB0dVhSbS9wQ1puTm5X?=
 =?utf-8?B?MWVlZ3N4NzJQWUVKQlJDZ3lkT2ROSytHeHdjTHRqNTYybkwvUFNpV25VMTc0?=
 =?utf-8?B?di9xNGhGTmUydGtmeThGUDhKRjdNbjdKYW5SenpFTDhraUhFRUNHa3I4SElY?=
 =?utf-8?B?dGJtelNzSWZpcjZSTURuQlN4UDJsOGJNejYyN0wzSFdZYTA2Z0NTOVkrTW9J?=
 =?utf-8?B?VTlON3I0YmsxOUhySkxiUFFBc0lSVkhHQm4wZU9zUVpueWRsUHdjcC9qYmtT?=
 =?utf-8?B?TDhnY3VSTzg3czk5ZHF4eHhQekpSN1YxaVc0dzlNN3B4T0ZxSGZVK1NUeTQ0?=
 =?utf-8?B?MmRleFlFQlRubDM3RGpLOUUzeDZFU1F5SC9KcXZtVWdaclM3Y2Y1Qm5KcVNq?=
 =?utf-8?B?aUtBYngxNmExeTY3azR0Y0QwWHY5SWkxd2RNWU9KOUl4RmdaSUtnSkI5RVp4?=
 =?utf-8?B?cU13Sk5iR0Qvbk40UUJCdC84cXpuTTYvQ05Jekd2RWt6L05yUmdnNW5LeDUr?=
 =?utf-8?B?TVladVhONGJ3bFFtbkIwbTJ0aUo3M2UwR2RGQjk5R3dPRlVqNCtHUVE0M1VB?=
 =?utf-8?B?MkRobElWRmVkbDJDb08vVm9OcEZDVVcwMzZEWjV4SHhzTkpWN21JdVQreEZa?=
 =?utf-8?B?dW5SME01dlV2eUhXc0p6dUx5MnliYzlnYXlWdmhHcE5aN0laRll6UmFFNHcy?=
 =?utf-8?B?MW4wSVE0QldjL2ZvYk82azdKL0k2aFZSOUR5aVY2MlViOVZac0dUSjNJRXVB?=
 =?utf-8?B?Ynd3MG9zSFNWQUd3aWVvdFpYc3hDT09nZldwU3p6WndNU0k3bUdUTEhxUm9D?=
 =?utf-8?B?bDc3Nk9tdTdpUkZqSUM1NGowOWxyZmNYWHJIeEhBNnNvd0RGWUFoVFpTMFdB?=
 =?utf-8?B?WlpZVmZZUWRZZk4rTG0vYmpwMEpJZXk3T0VOeGMrUGZtTEZ2ay9kTGpjSXVC?=
 =?utf-8?B?ZEJKY0ZCdHAyVGlPVmtHTzVmMVZlNjdQb016Z3NVelhJVVM5OHBQT1IvbTBI?=
 =?utf-8?B?QzJINlRFWU9MTmNZU0xXM3FVYUJEU2JjVStsL3ByclZ2blB4WkgrdkJFZ2h1?=
 =?utf-8?B?cFpoQytZcmk0NXdjdzgyUERWbUpIZXJ5ZjA2TGhvNVZLeVk1WG11SFhOWWlE?=
 =?utf-8?B?SjU0SUNyRkpucWdlRWtXUDF3YlZSSUdsV21rREgzY2Y1ZkhQRzA3TndMeVNr?=
 =?utf-8?B?SlAwUGUyc0Y5Smk3ZnlLcDNTOVJwOG54cmFYM2luNHBDYmZIZGo0M2hXTFdh?=
 =?utf-8?B?RUdqUHlkS0xlZU5QQlE5alNPQ2JXbHBMeGRSYjczR2ZkRUdMK09QdUZxRjlp?=
 =?utf-8?B?NUtuaUl3aCtINGZPeUNROTJ3aWx4UDIwTll2ODZKQnlIUHNCdGZnb0daSmZZ?=
 =?utf-8?B?WTJHWFNMSFlVcXZId0toaHJ6d2dUcXFNenBCZ3JNRDNyTWxSSW5UUmthWkJ4?=
 =?utf-8?B?Nnh4a1pGUlRZaDJvR1JPdmZlSDgzZFJISUM3TUlveUkwdzM2ZHhNK3FJVmtk?=
 =?utf-8?B?UFVWcTB1YnJnV3NSTklxUGw1UU9QTkxmZUVrMGNPeFRhNlRnMVF3dUtOQ2ty?=
 =?utf-8?B?ZDl5ZGdJVStGYWErWER4OU1JYXplNDlFL29xdGFCbDhoMkxZY2RCYmJ2L0Vx?=
 =?utf-8?B?YU8xMU5TaVVWcStFVVJ6SlpKaEVMdDJ1RkxjbXZNUEdmbEsyVW5UM05adHUw?=
 =?utf-8?B?NnVNdlFDckVkL3l3aUxsMU5tdG5FOEVkWlpHVyt3c2RSenJSNzdYSGszM3g1?=
 =?utf-8?B?UVNHa0ZReUg4N0t6REJTUlpYbUZ2ZkN0MjN4OEI1QVNiQWlyR0tFS251SUtl?=
 =?utf-8?B?OHlvcHEvNThCOWlMMDF1N3JZdWZNYnBaQXRWZ2l4bW83Z3Z0R0tFejhLVmo5?=
 =?utf-8?Q?OCEpGY?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(42112799006)(38070700021)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QjFUWW9SZHBqbTI3ZGFTODhKa0lnR0xFd3V0VzBzWXV2eGQ1NGJ1NVlKU2Jz?=
 =?utf-8?B?V0xnZkVaUWlkTWttOVdaNm5HL0ZFREhrdXJKYXdQbWFtcjg2bWhwalhkRlVp?=
 =?utf-8?B?Y0FRK1JSMU5sQ2duK0FVOW96SncwakI4WEMra3IxKzUyQnZnMERjUGowU2Ro?=
 =?utf-8?B?dVpsV3VZdVhNNE1Bb3JtVHZDbGZxM1h0bWx5Yi9xNlZhaUxrRnNUOHlQQ2xu?=
 =?utf-8?B?UnVsUVhxUGMrazdMZHFvMzlJcXNoZUFqd2crWTIwSHNsMmdoWGw5aHZIVnlC?=
 =?utf-8?B?blBNS1RIbzRoeE8yS2RiM3JtU3F1TU5iWXQzcHVySXhUbTA3MzlQN0hPcTBh?=
 =?utf-8?B?UWZ5QzdWMTA0R0pDYkhpVU1MamFIa0xpVG8wNEJra29oRmY5MXJXcjBQRDhM?=
 =?utf-8?B?cHpYK1RBcG9TK1JyZUxENUJERWNxZ3A5WnM3NDVzb092UEtYTjA4OStsV015?=
 =?utf-8?B?dmV3ekg0cnp0ZEdvU0FWdXdab25laFBMUkZiRXRleTJqYVJiNDE2MExtaWVu?=
 =?utf-8?B?Z055cE5iY005Q0RsTFFrK1lLN1UxazA3WTdDMExRYkxaWVdzWnpNZnIzRGVV?=
 =?utf-8?B?TUVjVTNuZzd2R1NMcnJNdEVERlMvL3NSanIyRmtZaEdSYXJneGV1ampGTnEw?=
 =?utf-8?B?L2RneDJlWWNsMnNYNW9nOG04VlFGNDZIbS80N0xBR0dZdEFPMnFROHc3RzZk?=
 =?utf-8?B?WmFhY0NQWWN3WU9YdGVab0o2aldOTlNSWHUrWXhodmsvZTFEaVkyYkluRHpR?=
 =?utf-8?B?SUFhb2pjZTZKS2FYTW5mZHRYdi9KclBKdUFWbjhRM1o0M3c5Rm5BdG1hQnAr?=
 =?utf-8?B?OVA4OUQ3V1JGTENVNVVHdHNVMlBSQUhxemhwVUV4RjRCRTA1WTdBdVlKK1lw?=
 =?utf-8?B?aFoydHFTTGIxblJ2Ky9tL2tzMkk0UnZWUVJOSGphRnBVRDU0WHJmN3RrNmZp?=
 =?utf-8?B?ZXlYMnFaNGZCekg1aTBxYkRRZ0xUT29lVjgwVkx3cStrY3gzZVBLLzFUQms5?=
 =?utf-8?B?QWFVdU9BV2U3NWZ4Z24xeWZnRWtXZHZCeVlZcW5FUU1URG5PTndWYUtSVmRy?=
 =?utf-8?B?R210di9sMjdiTUo0REl2SDBPQW1tZ0NQa3IzWnMrSkszR1Ewa3BvdjQ5c1p2?=
 =?utf-8?B?NmluQklzOVQ1Wklzd0k0ekpqcjFnV285SkN5OTJTNFRmVVUxcnVBQndEUlg2?=
 =?utf-8?B?aTgvMVlwMm04N05MbnFFZDV2ajNpemFld1JwdW5mYUdLbXNDbC93YnZtM092?=
 =?utf-8?B?NHpFYWtXbFJOaFNmUklITytzL21GcEpwY1hKNk9kU0h1S3JBMjkrbDZwZHdG?=
 =?utf-8?B?ZVlwNkFSSmZPMzFDU3JjaVNtcXVRRGRtcUFBNFhoM1Exd0htWFZvbTg0bGRM?=
 =?utf-8?B?MXJtM21sTE5hWFc5ck1hcVZiUW9uV2hHRmpvYnlKTDFwMmNmK01tbUNBL2g2?=
 =?utf-8?B?TkswaWtPWHJYdEo0QnRUdVl5eVF5VmtjSDkyUHFPVG1nRjZHRzhraWtsQjB1?=
 =?utf-8?B?V1ZORHd2dFBNY3RSRlV4MzRoejBJcUtSODN4UU5XSTQ3YnVQQXI2VVdhQ01Z?=
 =?utf-8?B?elpibzZUUUZ0VkFVbkhyZ2hqcnFIYU1lYmhBVHdvNkpCODJzbGRwSkdRc09k?=
 =?utf-8?B?OEhlMzdpclVnZGw0WlJ5WjBwbjk3VVhrS1dWNE9VdkRLVzk2WklGWSttUmxw?=
 =?utf-8?B?Tm51cEFvWHpSK3gveXg0TVNPSDhzQ0wxOG5SNUt0WFc0M09mOXZKbS95Q1ZY?=
 =?utf-8?B?RmUwRG9UbG5CQkcxcHMwMnN4b01tcFlBRUxkVGIzNHo1T0l2ekQ2NDJCWWl4?=
 =?utf-8?B?MTRlWngvVFJUd25zamFqVHpId1lDQ0c5Q1BzaUlsLzlGalhOTDBNZkVMWjNB?=
 =?utf-8?B?M2VseVBqV0tsM3hJZVVhc0FZMURKejF1QXhVNkxubEJmRU1xN1ZuNUhxbStB?=
 =?utf-8?B?Q1lnUi9iUUNDZXpNbStuT2dPak5CVkF2anF1MDBGZVJiTnNYMVA3K0ROSlhv?=
 =?utf-8?B?NTZ1eDFOZ0xHWWlZNGhJUlVVamxZVzNiaTdnQTc2ekJqSllVeDU0RWs3UFMv?=
 =?utf-8?B?c3dvTDhMUHdpbUYwOG15RFVHZkVQV2Y5S0p0RXdhTUJBVXM4TzcwQkdIZTND?=
 =?utf-8?Q?lbSc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3ef3a66-6a2c-4b3c-7eef-08de23c8a203
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2025 21:56:15.1569 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nParJA/40S3RCRqMtZLdQnsrfBwQovcC1wFNCQo2QrS20RWtfiFkGSQpa8HGJi70C2WjsHkF29bfv8CMjxxnkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8696
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

SGkgU2h1aWNoZW5nLA0KDQpUaGFua3MgZm9yIHRoZSBmaXjigJRwYXRjaCBsb29rcyBnb29kLiBJ
IGRvdWJsZeKAkWNoZWNrZWQgeGVfZ3RfY2NzX21vZGVfc3lzZnNfaW5pdCgpIGFuZCBpdHMgZXJy
b3IgcGF0aHMgYWxyZWFkeSByZWxlYXNlIHRoZSBrb2JqZWN0LCBzbyBubyBhZGRpdGlvbmFsIGNo
YW5nZSBpcyByZXF1aXJlZCB0aGVyZS4NCg0KUmV2aWV3ZWQtYnk6IFhpbiBXYW5nIDx4LndhbmdA
aW50ZWwuY29tPg0KDQrigJMgWGluDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4g
RnJvbTogSW50ZWwteGUgPGludGVsLXhlLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBP
biBCZWhhbGYgT2YgV2FuZywgWA0KPiBTZW50OiBGcmlkYXksIE5vdmVtYmVyIDE0LCAyMDI1IDEz
OjMyDQo+IFRvOiBMaW4sIFNodWljaGVuZyA8c2h1aWNoZW5nLmxpbkBpbnRlbC5jb20+OyBpbnRl
bC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IExpbiwgU2h1aWNoZW5nIDxzaHVpY2hl
bmcubGluQGludGVsLmNvbT4NCj4gU3ViamVjdDogUkU6IFtQQVRDSF0gZHJtL3hlOiBGaXggZnJl
cSBrb2JqZWN0IGxlYWsgb24gc3lzZnNfY3JlYXRlX2ZpbGVzIGZhaWx1cmUNCj4gDQo+IEEgc2lt
aWxhciBpc3N1ZSBjYW4gYmUgZm91bmQgaW4gZnVuY3Rpb24gOiAgeGVfZ3RfY2NzX21vZGVfc3lz
ZnNfaW5pdChzdHJ1Y3QNCj4geGVfZ3QgKmd0KSBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfY2Nz
X21vZGUuYw0KPiANCj4gQ2FuIHlvdSBmaXggaXQgYWxzbz8NCj4gDQo+IC0gWGluDQo+ID4gLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiBGcm9tOiBJbnRlbC14ZSA8aW50ZWwteGUtYm91
bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZg0KPiA+IFNodWljaGVuZyBM
aW4NCj4gPiBTZW50OiBGcmlkYXksIE5vdmVtYmVyIDE0LCAyMDI1IDEyOjU3DQo+ID4gVG86IGlu
dGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiA+IENjOiBMaW4sIFNodWljaGVuZyA8c2h1
aWNoZW5nLmxpbkBpbnRlbC5jb20+DQo+ID4gU3ViamVjdDogW1BBVENIXSBkcm0veGU6IEZpeCBm
cmVxIGtvYmplY3QgbGVhayBvbiBzeXNmc19jcmVhdGVfZmlsZXMNCj4gPiBmYWlsdXJlDQo+ID4N
Cj4gPiBFbnN1cmUgZ3QtPmZyZXEgaXMgcmVsZWFzZWQgd2hlbiBzeXNmc19jcmVhdGVfZmlsZXMo
KSBmYWlscyBpbiB4ZV9ndF9mcmVxX2luaXQoKS4NCj4gPiBXaXRob3V0IHRoaXMsIHRoZSBrb2Jq
ZWN0IHdvdWxkIGxlYWsuDQo+ID4gQWRkIGtvYmplY3RfcHV0KCkgYmVmb3JlIHJldHVybmluZyB0
aGUgZXJyb3IuDQo+ID4NCj4gPiBGaXhlczogZmRjODFjNDNmMGMxICgiZHJtL3hlOiB1c2UgZGV2
bV9hZGRfYWN0aW9uX29yX3Jlc2V0KCkgaGVscGVyIikNCj4gPiBTaWduZWQtb2ZmLWJ5OiBTaHVp
Y2hlbmcgTGluIDxzaHVpY2hlbmcubGluQGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX2d0X2ZyZXEuYyB8IDQgKysrLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2d0X2ZyZXEuYw0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2d0X2ZyZXEuYyBpbmRleCA4NDllYTZjODZlOGUuLmNlM2M3ODEwNDY5Zg0KPiA+IDEwMDY0NA0K
PiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9mcmVxLmMNCj4gPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0veGUveGVfZ3RfZnJlcS5jDQo+ID4gQEAgLTI5Myw4ICsyOTMsMTAgQEAgaW50
IHhlX2d0X2ZyZXFfaW5pdChzdHJ1Y3QgeGVfZ3QgKmd0KQ0KPiA+ICAJCXJldHVybiAtRU5PTUVN
Ow0KPiA+DQo+ID4gIAllcnIgPSBzeXNmc19jcmVhdGVfZmlsZXMoZ3QtPmZyZXEsIGZyZXFfYXR0
cnMpOw0KPiA+IC0JaWYgKGVycikNCj4gPiArCWlmIChlcnIpIHsNCj4gPiArCQlrb2JqZWN0X3B1
dChndC0+ZnJlcSk7DQo+ID4gIAkJcmV0dXJuIGVycjsNCj4gPiArCX0NCj4gPg0KPiA+ICAJZXJy
ID0gZGV2bV9hZGRfYWN0aW9uX29yX3Jlc2V0KHhlLT5kcm0uZGV2LCBmcmVxX2ZpbmksIGd0LT5m
cmVxKTsNCj4gPiAgCWlmIChlcnIpDQo+ID4gLS0NCj4gPiAyLjQ5LjANCg0K
