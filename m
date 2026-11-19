Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73779606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 02:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QC7n6bnp;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=M5k5cIcG
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3833410E337;
	Thu, 19 Nov 2026 02:24:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E390010E0A4;
 Thu, 19 Nov 2026 02:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795055070; x=1826591070;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gEyU0y+ojMivMGG+GcElBVyfLjGD6kZ4BdapQM+KQeg=;
 b=QC7n6bnp2Gk2Rt1XKvUZL3R3X8Pdb8lXWSOAp8jnKGyuci4TRcBw2app
 aipG2/ZhvepxpDEWYWni/6STbYw2pEK2myET0MhG1VK60PKAIQo7DpU7l
 ev2ENJPonfkYMenLhUPy6uRu8IP4x/1vXQjMDERmY4e0QuSKEKkqzwvQl
 FWKxPUDZhFfML+QvAw10ZyTqj7RJBZnvPjwMJBeBXzCTtX5DaIdXjjTVa
 2QzOK3Ter9Dlv5GdVpmfhZSvfI9HcnWPoFn4lnKsSXHIOOkY01PILG2jY
 ISkllGlQ77O8x1KBmMdsboXngy8jqfxw4jKW9QfDelRx+GXY2bSv17wGR g==;
X-CSE-ConnectionGUID: JB2Xlev+Su667vPH5VdvqQ==
X-CSE-MsgGUID: IT9/nMrYQuyTycP89twLZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3810929"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3810929"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 18:24:29 -0800
X-CSE-ConnectionGUID: 3Nv85f52TyusqbryhgnbeQ==
X-CSE-MsgGUID: fecfWWLXQs2o67CePTdzGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; d="scan'208";a="12265028"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 18:24:29 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 18:24:28 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 18 Nov 2026 18:24:28 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.1) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 18:24:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E8/KcycyMh2JilloJPRyfIzYkydPedcg4P/XGTfFplIdm/yg8woRdloSw5t6+XtWUQLsQ4XG6K4UX/JQ3+p/7hkOspaMU6a8epm+5S8j8QDHj5+L8a1jfDqG4OnkI3CwROLElEhf7tWZeEjXFT1N7DwjpognbXFtlliEpwsLEy5BZe0dfQr0kTCNVZ475+2BSzJea9Fz3GYjfOgexroYcr4mmOmOstIcEgmrXQTm3Zr3wTnpmAMqOQrR+sjV8ybpsnf3AksBFUyjyr8QljVO9co12D8Hppf/QyxDC+91HHtzTbpLIjg5VSzf8gy2Y5FoW06pGnUDZ03qaIvFawiUOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wkOORiebngmTN0em2dUQqeFSrHyAnC/oHDMcPNkzHg4=;
 b=hVxRzAJBj6RHFty0sZ3KzpByWBpDqNwPwMyps7LHiq5jzPg2+BdnWoaFO4k74kRKX+iqzjBmoHDFErdt4lFOf3PZouFAH55jYFyuXe2gKVU2Lesii9EOLWjEUS/eaf1j8F0b9vaG7OdzfSkFL8/YBajxxGIOp1GB5Et0UJ+rc7IbewTW+fdmaFgEG2arCPLf5DfHOKgAGFJz3iU/DcWBtwkeKTaPtdHtm84mSCAuIv7MwD7wXmfQcsSeOaTSkKzgKBamF88SbAfaNh00DlglRaKvnKpmkEPxhPkpTRasT9Gdkd/Q55BQ58FHOv012uGhO6D9TOLpVbhmFvhhGZHXog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wkOORiebngmTN0em2dUQqeFSrHyAnC/oHDMcPNkzHg4=;
 b=M5k5cIcGlcEv2GkwEaHG1p5hJldRSOxMWpOPyBgHofJixjdRC70oeecE5YKY9GssHvypfVJ/CvzBm+3tlawIvsWNz63lrEGKKN3WkgAv03hGMenZYf4cJb+8tTEpjeBz9dKT7WpPYVMmriRl9ti15sWjvfoBJdL637xxO4Hjqxk=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV2PR11MB148960.namprd11.prod.outlook.com
 (2603:10b6:408:40f::21) by PHXPR11MB9663.namprd11.prod.outlook.com
 (2603:10b6:510:3cb::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 02:24:25 +0000
Received: from LV2PR11MB148960.namprd11.prod.outlook.com
 ([fe80::9761:b20d:6f27:5460]) by LV2PR11MB148960.namprd11.prod.outlook.com
 ([fe80::9761:b20d:6f27:5460%5]) with mapi id 15.21.0615.013; Thu, 19 Nov 2026
 02:24:25 +0000
Message-ID: <fba24224-e42f-473d-8e9d-801ba183849b@intel.com>
Date: Thu, 19 Nov 2026 07:54:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/dip: Clear VSC_SELECT before setting it
To: Eriksen Xie <xiaolu.xie@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
CC: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, "Suraj
 Kandpal" <suraj.kandpal@intel.com>
References: <20261118131441.2023100-1-xiaolu.xie@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20261118131441.2023100-1-xiaolu.xie@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0073.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b7::12) To LV2PR11MB148960.namprd11.prod.outlook.com
 (2603:10b6:408:40f::21)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR11MB148960:EE_|PHXPR11MB9663:EE_
X-MS-Office365-Filtering-Correlation-Id: 4596e2ab-b69d-4aea-b1ea-08df45e43aec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|18002099003|22082099003|261009223027099003|6133799003|11063799006|261026121527099003|261026140227099003|56012099006|261021123027099003|10067099003|261022105027099003|261021121427099003|261028144727099003|261022075727099003|261102123227099003;
X-Microsoft-Antispam-Message-Info: PQ3EUcthPMkQAfxdM2GKAO46745W756fAC4ba9KOUfybYaPBcBb02FaGm+5LCF26vOeDo40joueLtgd4l9Qr/QTwKOxhRFcBUJSURFAbuG0+Iw2c16cxTPNGpUDttENU2KVo5+hVpSysHHRwQXVK6xukTkxPr7670/BNGUgR3i01ym06rKYU5EFDJoDyA+FrHTivnejcnGt6aKUbt3cVbFyXLJ7M7lxDeJvLmRKqJojipxeWd/gzFc5xjdhIPPnJSgFKhkl83LvoPlESDsAETeKnZEhyDT9/YjQASwR7eQ4eOhYZJHWBI/e5YSsdRTe8P1KrcHeF/bQJC5qtMyO09VoQFLlvhrGawihJyMlySUJCTP/g+D8wAyyangx2vZ4dArVKUR+iSDPdJFo9nbSH7NKjCitiVrZRooh4vWUSsF7sUAsjUYJwJ5wyYLvOz0dBcIgLB/HxkK/an09PXj8P47wYQXJlxysfOegS0d7mW98QAE/1lgMKElDM6LfvYeMrWkGLNNrKOYfQ6dAFQDMEbgFQSM12k54IH+kuBU7+q8cqRIpIlXh30d+hPgNVx3A3gQyh1H1H9uV2ho8L8VkMU6s3PwYaQCpXFLm5qpFSjRO7HyImIHuCrEx2K2T576Sm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR11MB148960.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(18002099003)(22082099003)(261009223027099003)(6133799003)(11063799006)(261026121527099003)(261026140227099003)(56012099006)(261021123027099003)(10067099003)(261022105027099003)(261021121427099003)(261028144727099003)(261022075727099003)(261102123227099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aFM4WEZGazlRUXY5Z0MxRW9mcVpxY2VDQ3ZHdDZCeDFqbUY0MTdOc0ozUVJw?=
 =?utf-8?B?L0JSVHN0ODk3dUNsbkIyZU9heDZlYWxxeVJzZEcvZDIrdVE2anZORENsNlRI?=
 =?utf-8?B?YUVXblAwQU54MGtuNGg0SkdGZzR6QXFKY2lLUEVIV1BXbXEyYklmMzNRVG9z?=
 =?utf-8?B?TDI3YXdIMzNyOGszcGxibmRtQklzRGtKdlA0NktkeWIycEZxOHhzWTZpMkhy?=
 =?utf-8?B?Y0FuNkpMajNyQ0p4dVd5cFozM1grRGhibmdYNnAvMTlNU2wvRjJtc3pvb1VO?=
 =?utf-8?B?WjZrdmhwdE1NdkRnKzV5TVhMNFBrQ0FpV0FtR3ltRkVmZkJKYUZhaTlyVHlz?=
 =?utf-8?B?cERsL1JFaDV0MjdzNThWaGEvOVdQTmlibVREaTZ4ckp0ZTBORnI4a1JvakNZ?=
 =?utf-8?B?K2p0MjFxMWt1TDJvTEJQMUUzeU03Mjk3TFNBNTFPT2ZKWmQrMm02emFQK1pI?=
 =?utf-8?B?Y3A0eFhhcVoxTVU1S3dwTTJ6dTE0V0MzaGU0U3VOdFRhV05jZGQ5OHZXVWlJ?=
 =?utf-8?B?dmZobEoyc2tOQWExZUVxeFVOZnljQUh1ZWthaWlvUFB0QTd6dkYrdGVlelhu?=
 =?utf-8?B?a2duNEZocEQ3eGhTV2E3U3pnK2JkbVE2QXllSlp5WlZjS3VHL0JGUjFTZThk?=
 =?utf-8?B?djkyQW1xSGVrR1Z6MUFmWVJxb1Iyem5MMkR4WWV3Yjh2aEFZZFN2VjMrWDkx?=
 =?utf-8?B?NkZhZFRxYXNqdkJsenlRbUx6Z2tSbDhqNTBGaFlaMlBGSTJGV1dPOFFEbnZm?=
 =?utf-8?B?NmdmSStYSzFvZkNzWThvdjkzUDFmM2hibktFaUxIZC9seFIrdHhZdWU0UStF?=
 =?utf-8?B?Q2kzc1Qyb1ZQOHp0aHU1cS92R21pYUhWWjRTRC83Q3djMFQrbHZEbzhsM0E4?=
 =?utf-8?B?dFJpUmhob081ZFQ2d0V4NHUxb3hidDB3VDdJd1lCRi8rQWcrK1hlME5pM2Na?=
 =?utf-8?B?NXdqY1lQblgvVytIZ2xLS0N0S1RCeFMzY25qTldhRGJqak5NVEkyaXlmL2dS?=
 =?utf-8?B?Mmo1ZzlXZGxQcGZyNWhNSXNuOW5zLzhCekhuMGJmbDAzdmRNL0hrVjNzZlls?=
 =?utf-8?B?cWRGeG80NHlsWWtFYjVYS2tGMS9XbzRnT0t4c3ZWNnRpYU84ZTJCZUNQZE5S?=
 =?utf-8?B?WWkwT2xJOEF0Q1FtVEh3SHgwblN5ajI1UzBuT2dmQnF6MUFPL2JhYk9kTUJY?=
 =?utf-8?B?N2NGRWl1eCtERzdGNi9HY0l5c3hZYlhwb2pXUUttcFNsYmxIMFJUNmdZdlBq?=
 =?utf-8?B?OEo3WVp0MW5TemVyb0U4M3lUaEpnVGNySW9pMDd4am1NWDQ1UnZtWjVzOHFa?=
 =?utf-8?B?MDdMRy94UXVFL2kvZjF6VGdQaWZxTW5oTSsvbDNBcnhzejNwN0o2cmpvb0x4?=
 =?utf-8?B?T01GVW5JZW4zMVhxbGtZbTJCblBBRUNka0lSVDJWUm5BY1FVck9kYXQ2U2pl?=
 =?utf-8?B?VERHY0dDTEdhZkxML3k5eFRxZ2cyUE0wNnZKcmV4Ni9YQmUzdDlQWElTYSt4?=
 =?utf-8?B?dkZQd2ZUQmNkR0VYT3ltRHM4RWI3N2NvSDN5TjluZ3M0YWdoSnRzWmVZZG9W?=
 =?utf-8?B?QTRvTHg5L1E1RWNVZFpQcmEwMmFvTUZoMlY4TXpOQ29YUGp2Z2ovcHl3MGNq?=
 =?utf-8?B?WW1XaUx0QklFUkRPQUJueUlUZHlmb2dobkp0dS9pZHJ5VFJwR09Pa3B2TkY1?=
 =?utf-8?B?SEYxWlFpUGdxTWovd0VQRXVGc2ZKM3RkTlh1Z3FSd3pzZXpMaDQ3ejdnNmJQ?=
 =?utf-8?B?TDJRczh6V3RSbjdwQUp6YmVJbUd4TDZPZnFYVUZGNzV3azd6cGtUU2lLc01V?=
 =?utf-8?B?clF3TEd5UmN6UjV1aGVLY3czVEZEYWVoU1lGT0dLWnpJQzhZSG5iSEh0SE9P?=
 =?utf-8?B?c2JSbXFlaEw1ODRkSlp5Mk5XSjdkOU1NZUlmcmJnNHJVWk5aNlRvTFNQWUZj?=
 =?utf-8?B?dVptbXJVUUE2TG9kVlJRL3o5WXNKaXpXTHJZZnZwNTBhYk1kVCtqK1JDY3Jt?=
 =?utf-8?B?d2EzQ1JzQ0hhSVpqVXpEQmw4L0YvNGFvK2F6WWVNOFRyYWR1dVR2b2FjVHJF?=
 =?utf-8?B?Y3Q1dEhza3RodjJYaVdjOURMQnlNSWt4ZDU0bEJlbXZjK0hYdnU5WW9yaE96?=
 =?utf-8?B?VUN1VFM2YlBHeDB0MXRqUEdWUnB6Wk4wNncxNVVFUndSWlFyS1pGUit6eVdF?=
 =?utf-8?B?cDNobFl0WWwyWjFidGQzVDdjZWdpeUNHc2VGZE1KdFdXZ09DTVpDcW9FR2t2?=
 =?utf-8?B?RXh5U0FwaFM3M05LWS9DQnRwbW84WUVVWXk3K1FrU0ZhMFVhREtZRUhGdFVy?=
 =?utf-8?B?SDZCTlVVb3BaS3l6Zk1idzRTejdRWDlYTDZNR3QxNEJXckd0RmJzNkhNaktG?=
 =?utf-8?Q?377avMje0ETBIAnM=3D?=
X-Exchange-RoutingPolicyChecked: S+tURQpzncLLjq1EyasGFV5Q/8FDwyFY+moRwSAoribJduPfLTiNGe2UfGqRW7iDJUKG7atVK0XZWkGbfpn6NAJnCs6+Fv8a2Pj4SQK3vTAo8FbY9wQm1uHvRwVd6cGtrH7RS/6ZxUZmDWGtFjoco6NnOhH0XQS5Ue087tqTDWPdkRHRZJtDU3AzRfZYQ8HTbNFTqAueUEJ+CGIeqDx0KO2yRaSGN0xJHoX9jGgCYtCFdIecsWchr9/iQHGS1BFWLWK8KgkdURepDS2Uok8FOo1BodM/NQGkzW647Nel+XPj1qUu+RXVIUMmpBgeY4uqy/Klj6+NXPjP22apTrXZlw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4596e2ab-b69d-4aea-b1ea-08df45e43aec
X-MS-Exchange-CrossTenant-AuthSource: LV2PR11MB148960.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 02:24:25.6118 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oV1zDXYRwVOJXE45xDa/lfugQzh6Ul78kcHRKB5FkaXu0RIhHFsbbZRGqykqHF309NJvXW1+LSXNsAiWKtj6HJZ62MI2MxVXCgQPb+RBhm8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PHXPR11MB9663
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
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 11/18/2026 6:44 PM, Eriksen Xie wrote:
> VSC_SELECT in VIDEO_DIP_CTL is a two bit field selecting whether the
> header and the data of the VSC SDP are generated by the hardware or
> taken from the DIP data registers. hsw_write_infoframe() ORs
> VSC_DIP_HW_DATA_SW_HEA into the value read back from the register
> without clearing the field first, so a different value left in it,
> e.g. by the firmware, isn't replaced but combined with the new one
> (VSC_DIP_HW_HEA_SW_DATA | VSC_DIP_HW_DATA_SW_HEA results in
> VSC_DIP_SW_HEA_DATA).
>
> Clear the field before setting it.
>
> Signed-off-by: Eriksen Xie <xiaolu.xie@intel.com>


LGTM.

Sashiko suggested a 'Fixes' tag, but I don't think it's needed here, as 
there is no known bug.

The driver doesn't accidentally change this bit, and any leftover state 
would just be from GOP/BIOS programming, which hasn't caused issues.

Keeping the tag off avoids unnecessary stable backport churn.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


Regards,

Ankit

> ---
>
> This was split out of my earlier patch [1], as suggested by Ankit in the
> review of Chaitanya's v2 [2]. It doesn't depend on that patch and applies
> with or without it.
>
> There is no report of a stale VSC_SELECT value on actual hardware, the
> issue follows from the field being only ORed into.
>
> [1] https://patchwork.freedesktop.org/patch/763779/
> [2] https://lists.freedesktop.org/archives/intel-gfx/2026-November/400881.html
>
>   drivers/gpu/drm/i915/display/intel_hdmi.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
> index 4ec0db8d93..14dacbb58a 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
> @@ -552,8 +552,10 @@ void hsw_write_infoframe(struct intel_encoder *encoder,
>   	      !crtc_state->has_panel_replay && type == DP_SDP_VSC))
>   		val |= hsw_infoframe_enable(type);
>   
> -	if (type == DP_SDP_VSC)
> +	if (type == DP_SDP_VSC) {
> +		val &= ~VSC_SELECT_MASK;
>   		val |= VSC_DIP_HW_DATA_SW_HEA;
> +	}
>   
>   	intel_de_write(display, ctl_reg, val);
>   	intel_de_posting_read(display, ctl_reg);
