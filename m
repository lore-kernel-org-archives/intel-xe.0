Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E8F2606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 13:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MXuqRTjf;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=Fo1wJHQT
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D10CD10E0A9;
	Thu, 26 Nov 2026 13:03:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EB0A10E0A9;
 Thu, 26 Nov 2026 13:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795698188; x=1827234188;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GCMqYA4soqHeZANxrOsfZNig6zS2L8i3oWWWRZpgZ7s=;
 b=MXuqRTjfgMtT/UQOrVRWlPU308q3BxuWCuHElxE99Sk6UbzFtMq/xbfL
 DlTrQ8QWtJiuzv/y3e2rl8k4xdYp8nGDyyTvDgNm27Rh4cKUcPGPL5yLu
 jAznmUggvXmMDqVMvTyDIJEovkgySZSQjZZn9Wxo63uo8EqBDIfiDE9rb
 MeVPJXx64SZublc9HHgiy0pSEaxCK5icWm/PK2uVXz234+Hktc4pvEGkU
 vbnHXRFsplR96KGzJovHOodLlGWJXeYdkAiihcIK5Dqfq241OmY4G48A6
 TYd0E9xUY8kWtSiZZbayfKXLUw+xqcuE2NiU1ZwSZ2CBY9TkTvYvDLBP3 A==;
X-CSE-ConnectionGUID: DERvZLvYRjaLSMH2njmxfQ==
X-CSE-MsgGUID: zFmFIWMcQJ6hfDrySrgydQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4503248"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4503248"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 05:03:07 -0800
X-CSE-ConnectionGUID: 4YBKBmNKRgWYkyTnWnRxxg==
X-CSE-MsgGUID: 2X8c1oQqQ5uNB1vUrTJbpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="12081106"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 05:03:08 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 05:03:07 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Thu, 26 Nov 2026 05:03:07 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.38) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 05:03:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DYk/bSKtr0Ova7ezd8k/SVFB+te8RByNx7PDXiiFFbAMcJrGW8ydqYu31PLJuSdaRQexPlkZ13GJbSpVYoY3AJOIFE8dJnBzx1DVstPqI2apW2hoRNyHRJvQQYovWavkF1Xip1OttUhliV5F14oa/t1HXxgs42D2pCGrNGRnORjSKGMOGSbaZpxLR6QaAp1vA0cnpBKr7FAOmpq2kRFGgDM7y8h1BeLjhFdHzGDU2yJaKy3MoPnnKC4ko6xz4zJHVTi8LZQ5ee6AVFKw/D8ToXj7hOahCdEq6TWrDedBjsOA/Oo5gFsct14eqNSM1ye7AG1Z4vyJomfX0Vqdo7UEAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=07MiaHv0Cy+VmrHHLzemC3VOVruA0VDW2MLdEylVggY=;
 b=JcTx70ZQ081rl0XjfMvKkQuw0DfKMyAGAb7i+d/URxHrTLM6pR24YMsM1EZZLo1oImM5nDA2S0vwHoibO70Y8kpRGDPJErMiZxRo4/RAIECTXtEM1FDy2lYkKw7GOIlL2q3VjgDB1Una8xEwWHXLw7ihqJpTE4Gh2dLszRWBZPpQEekPznk2mDIRmd1Ly4TsPE987YZdyihxpMpPsDEQWrbAxP3M+6Q56jZDIU5v34S6sp+RNJU2xb2iS5j/HciU8xm0p/7EQnkrUeDqDZz/J5B8y2YvPJOMLWFv/X9fFtvmyEJYWLQ7JbqtPuTZkJQ/iXqmdXkfhZ0BfF/ztVyL4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=07MiaHv0Cy+VmrHHLzemC3VOVruA0VDW2MLdEylVggY=;
 b=Fo1wJHQTLvsr8Cb5rPFbIku/eNcxYqL+ixOPUlVu/GieBLtAHRpY8PpzHkqmQR7GS5svo2n2zCmutiadIOTvi5dHmtffIaFsheucqjJ2rgL+kcxEM6EP8olzK7cx9xMoz8VPPVZJlkUTfZbCWmlBrHtsk+h8G5kionDxWt0t6HY=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV2PR11MB148960.namprd11.prod.outlook.com
 (2603:10b6:408:40f::21) by SN7PR11MB6680.namprd11.prod.outlook.com
 (2603:10b6:806:268::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 13:02:59 +0000
Received: from LV2PR11MB148960.namprd11.prod.outlook.com
 ([fe80::9761:b20d:6f27:5460]) by LV2PR11MB148960.namprd11.prod.outlook.com
 ([fe80::9761:b20d:6f27:5460%5]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 13:02:59 +0000
Message-ID: <314a02d6-bc22-47b9-8713-4dc4410bb3d2@intel.com>
Date: Thu, 26 Nov 2026 18:32:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] drm/i915/gmbus: pass struct i2c_adapter to debugfs
 functions
To: Jani Nikula <jani.nikula@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
CC: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
References: <cover.1795607055.git.jani.nikula@intel.com>
 <b1932eb5ddd156dfe3d2dc2e3b2074c3a5b74fc4.1795607055.git.jani.nikula@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <b1932eb5ddd156dfe3d2dc2e3b2074c3a5b74fc4.1795607055.git.jani.nikula@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0031.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::18) To LV2PR11MB148960.namprd11.prod.outlook.com
 (2603:10b6:408:40f::21)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR11MB148960:EE_|SN7PR11MB6680:EE_
X-MS-Office365-Filtering-Correlation-Id: bd9e6321-642d-4785-347e-08df4bbd98d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|4143699003|6133799003|261009223027099003|22082099003|18002099003|10067099003|11063799006|261102123227099003|261022105027099003|261022113327099003|261022075727099003|261028144727099003|261026140227099003|56012099006|261021123027099003|261021121427099003;
X-Microsoft-Antispam-Message-Info: MtAsoDVH+Z4dKvY3nX1zJsYBB0soULj/t+5vCnnlMDStxbodFquTzRytRqUxaMSlaO80BiJW3Wsh3fxoKabl4NozJ+KCHCTu9qMlWV5Mt21AdSEkwDi17B7Elsj1zc8BL1ioK6BhTxLXC9Awbz/MNcT8PPj43Fvl7u89NPFvLw6JKF0rO67diHmoekxZnMjyeZ9UFOBLJiX85/u8Gd0PKKwGykg6CKcPd2lWOkTiWIrOVbhbAcHmmN7cxRDZdttaBF+9o5eisB9FfsY9rnMXxPS54aUXUOSmMtmOJWUE/pOl05TqTwh3ilp9n+h8HN3x/tsGSruoM7OUs3qqZAk0cqKfKmp0Tbk3FjYJFpP6weGwxcbHW8Czl4TfeIX/l2QBQTGCh8o5o3bGouRVUZfgYp7CRoFl6APLw7hLUv8ipkdN6hxY+xqk25HT5A8Z/dy3IL2xCD0moCgdbtT/i041uGjbKEBUSuLYg2zZdWXrbCcO2n0EWUL9ypfXQ4Mq+K11AFnomSl73cYw7vexc9uRZqWrjB0zhTL/EPKTDIPy/sPCDzDHjAm8TMPZJaXJYdjKlk8JR6JxOXxzDktJi25QOXQUDwBH4uLlydhKrfkaRk8mYgKPwmettjqCV0IS8vEt5EgC9U0mreU1JuhERQX6Ywy9OlV4R53HfBCo0O3tmn0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR11MB148960.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(4143699003)(6133799003)(261009223027099003)(22082099003)(18002099003)(10067099003)(11063799006)(261102123227099003)(261022105027099003)(261022113327099003)(261022075727099003)(261028144727099003)(261026140227099003)(56012099006)(261021123027099003)(261021121427099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2x5cURCK3BjSStWTndaK2JYalNrRW1XRWxyL0N1bDJnUm9RWFRHRU9pYm1B?=
 =?utf-8?B?ZVl1RXZmYnkyUU1WbUEwQWVsK2llTE01V2gzS2h6Ly8vQXkvRzd2S3ZlbThN?=
 =?utf-8?B?VDBwWXhpR2x5eUlxdXVYRkplWFNnb25sQTBSOHdGU29RUjdQZzVQVlc2Nkc1?=
 =?utf-8?B?TUhiZHdXVUxGR09ienN1U1NMRUJTVWtnaWNIc2NUUGtkc3RzZFR0VXppVjlW?=
 =?utf-8?B?OWcrL1NHbGtkbnVyWjB5SmdhbjZnM1ljMXQwajBjZEdWVWxDSWtyejVTTkZp?=
 =?utf-8?B?N012N2E0VHRsbTZPRjd1Z0lDN2d1bFNQZjZuazlvdWV6b1M1Y2hvTGloczhY?=
 =?utf-8?B?b2I1elpBY1I2cVJmL0g4bGdDUVhualJrZEs0UTJlQklCOEJ0cWtWWlBwRjZ5?=
 =?utf-8?B?ZkFSREx5dUp0QzNXcXJPWm5jb1NNQk5abElkcVNmNHBlR1o5c0QyT1hLeHJa?=
 =?utf-8?B?c1d5WjBlNHBsL1luU2RNWGM5N0FIOHR4bk9WRVRsUFZKbUlkVWF0M1l5VGtW?=
 =?utf-8?B?Wm9yemVDUks5SUlnTWQrSGFXWWVralA0UGpEVzllT0FWNHV5S2JOQUw2cmlE?=
 =?utf-8?B?T2FuS0d2bnJCcGFUV0xVVlNWd1lxWUwxSDUvZUJaNmsrek1tcnlXSVJ0T3hN?=
 =?utf-8?B?TGJLMnJhNngwS003UUlJS21DVFFTWVA5SERJVnU3Tlk2SGhCVVZUSFFjTHh0?=
 =?utf-8?B?T0NNQlhiK0RObVlHOHlpbFp3bGdxQ3huQk04a0o5MDh4enNITklMeXVabG9X?=
 =?utf-8?B?OU85a09KVjQ3MzJSVFBMNTlhRlFHWkRZbmxkNllTSnVYNVRXbklvaWdYbVYw?=
 =?utf-8?B?NHRFeWpiNjBNQTZhWEVCZ2lzQ1VhS2ZXV3BEUVB3MXBYbkZyWnozNUJScVRi?=
 =?utf-8?B?YkhMMjlBcDlYU25mV3lENk92Q1hqcGluTHBpdlk1TFR5SXNTaVVvL1B6bUVY?=
 =?utf-8?B?NFdBOFdXMzlwTDlSOXFEYkFXWTBwS1BLLzlYTzQvbG1FZHBubWowYmNXQXB2?=
 =?utf-8?B?VCt6UHUxNllCWEthVUU5bVNEOHVOcFBmbDBJdVl4blloeXM1a2tzdzNuL2pL?=
 =?utf-8?B?MTJZZFpSZ3YxdzA5cTJ0ZTJqVU80aGJMRGZ5emFrZUtzOVE1VGpvdDQ4Vk9Z?=
 =?utf-8?B?czZIRGpOMDF0Y1U3YUpUWlM0ZU1MWGcwZlpLZ2xIOWZtVU5XdGpSR210d25v?=
 =?utf-8?B?WXBicFJoQkZBN2tGWThTeDM2TmxKWE10ZXV6NVRyVSsxTlZ1VEJHdHpFTkRH?=
 =?utf-8?B?aEwydXFGTFl6QTJ2eUY0Z1VkeXhPaXl3alBEZnU5bU44NU1ReEIwV2l0L2tF?=
 =?utf-8?B?alJpV3gxOGQwWEcwME0xVG9kRnE4VVJLQXFwMzJLYUlFY3NIRTkxb3R5RFR0?=
 =?utf-8?B?ZzYxVnVCdW9INGxWZjA2d1YrY2hGdGU3Z3pPR2pBL2V1UHZvZTlWTkRYUy9u?=
 =?utf-8?B?Q2FnK0doTWdQWE04dXJVRGNpQXhJTWNGbld5c0pLRW1qNjdBcTZ1Mk9KSzVO?=
 =?utf-8?B?OGg0aGVCR2N6Q1hGOU85YkxKU0EvbkRoeUhXWVhiNW9vQXU1Tkh4eXI3M1Rq?=
 =?utf-8?B?NTMrVWMzOWkwbzMvNFVrZFF5a3U5NFlyTEt4V0tENkYzVFdqM2dTdVRLRVd4?=
 =?utf-8?B?dHRvbW9tODBNTHJpczZQMDdSZXFYcGpGNVBOMWI5RVMvUmhtaTRET3pWT0Fh?=
 =?utf-8?B?Y1htc3pQUGR0RnF1OGdIQTdlWnVSUGtBWTJxRC9TY1ZiV1BUdFBzSUFxbW85?=
 =?utf-8?B?U1E3VXhCUStYVmtwRzJVdnh2ZGp0RTBkNURiSWhac1VCU2ZHTkNzeEFSeFND?=
 =?utf-8?B?SkFHNWRFRzFmd3NHUGtmMW5hOThzN0ovSmt5TjZvSnRraStwclNkY0VjZUtq?=
 =?utf-8?B?Yy91MmpvZE5Cd2d0UllnL1RkSlZURE5GcklLUEx6aXpMbmN6ai9DVmNmT0xC?=
 =?utf-8?B?TVVwWDIrcElQZElGb1htQm1Ec0NwTm1Ia3NpV1JLSU80MWFnMjVoUEdhVDRS?=
 =?utf-8?B?cUtoU1BrRmUwcDAvclMrM0liZldEa3VtVWZ4Vjl5VHZ6UGFSeW5TTkg4bUhM?=
 =?utf-8?B?NGZXQ2xCajJmNHlsN3c2UUhocjlvNndkMDVFQzB1bUFKRDc1UDArbVYyTjhO?=
 =?utf-8?B?OUp2YmNyR3pHZmttdXFxaDR3WnhYZTZ6K3psZjJ3bnBuSXJnNnkvcVMzS1c1?=
 =?utf-8?B?OUJLOVNBMXdKbVlBcFdaMm5KcGRJQ0NWTEI5ME8xRmhjZ1hlYXJzcTFEV0ZF?=
 =?utf-8?B?bFRWenQ4Zm9wNHM5akZjdGp2cTRNTko1MzJqbmo1WHJtdHhjQng0ZXZSNWVy?=
 =?utf-8?B?TlplTnZLK2UzOVptenJibmlmQjlhU1ZTblpuTDRVc1RxQVN1U0tEYUphOUda?=
 =?utf-8?Q?7LKT6c8N6eMEhBB8=3D?=
X-Exchange-RoutingPolicyChecked: POG6+42ztgqUMJneqBJQxdi0ItycoMS8wzaFJOrewP2dpewLk/0MTIxgYe14CVsnikaq3KV+mHt9lrvEgKRt+0Mq7KUFtMvjtn++W1yex7PU/9okHFz9thvKXBMbX5AxS/P0r+Y3x1PKyLPfqA5ZydDu9PE6BIVF3D7KFQGess9hC/XKoSZiVEgxrWibxR+B3qJmb8T5DREn5TBtg49QFZxJ304oLfRY3bEVOVcw57wf/28kl+cVm/p9nItRh5YNNKsRXjiMnefEDIgk/uTj//hUZhlWH52FMfA+n1g+uzjQq53EV6qUKAGBQtqtjtBeCzbe/u3+vIA6RIWL87+qBA==
X-MS-Exchange-CrossTenant-Network-Message-Id: bd9e6321-642d-4785-347e-08df4bbd98d3
X-MS-Exchange-CrossTenant-AuthSource: LV2PR11MB148960.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 13:02:59.5318 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EMKRn1Y4G0ra2NSJuat3viGkgUSjQANNDkinM+X74uGR9dwdGAtPHA/6jyOw5vMTyrg5F9WiLbMMtXCEHBfVNKLqzFDXlBbTYGal1iuh8Ag=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6680
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


On 11/25/2026 5:16 PM, Jani Nikula wrote:
> Throughout the gmbus implementation, struct intel_connector usage isn't
> really a thing, and the conversions flow naturally from struct
> i2c_adapter to other types. Using struct intel_connector is a
> hindrance. Pass struct i2c_adapter to debugfs functions instead, letting
> us use to_intel_gmbus().
>
> Cc: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


> ---
>   drivers/gpu/drm/i915/display/intel_gmbus.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.c b/drivers/gpu/drm/i915/display/intel_gmbus.c
> index 70784e7dae2a..c8f79384260d 100644
> --- a/drivers/gpu/drm/i915/display/intel_gmbus.c
> +++ b/drivers/gpu/drm/i915/display/intel_gmbus.c
> @@ -1070,9 +1070,8 @@ void intel_gmbus_irq_handler(struct intel_display *display)
>   
>   static int intel_force_bit_banging_show(struct seq_file *m, void *data)
>   {
> -	struct intel_connector *connector = m->private;
> -	struct intel_gmbus *bus = container_of(connector->base.ddc,
> -					       struct intel_gmbus, adapter);
> +	struct i2c_adapter *adapter = m->private;
> +	struct intel_gmbus *bus = to_intel_gmbus(adapter);
>   	struct intel_display *display = bus->display;
>   	bool force_bit_banging;
>   
> @@ -1090,9 +1089,8 @@ static ssize_t intel_force_bit_banging_write(struct file *file,
>   					     size_t len, loff_t *offp)
>   {
>   	struct seq_file *m = file->private_data;
> -	struct intel_connector *connector = m->private;
> -	struct intel_gmbus *bus = container_of(connector->base.ddc,
> -					       struct intel_gmbus, adapter);
> +	struct i2c_adapter *adapter = m->private;
> +	struct intel_gmbus *bus = to_intel_gmbus(adapter);
>   	struct intel_display *display = bus->display;
>   	bool force_bit_banging;
>   	bool changed = false;
> @@ -1116,7 +1114,7 @@ static ssize_t intel_force_bit_banging_write(struct file *file,
>   		drm_dbg_kms(display->drm,
>   			    "%sabling bit-banging on %s. force bit now %d\n",
>   			    force_bit_banging ? "en" : "dis",
> -			    connector->base.ddc->name, force_bit);
> +			    adapter->name, force_bit);
>   
>   	*offp += len;
>   
> @@ -1139,8 +1137,10 @@ static const struct file_operations intel_force_bit_banging_fops = {
>   
>   void intel_gmbus_connector_debugfs_add(struct intel_connector *connector)
>   {
> +	struct i2c_adapter *adapter = connector->base.ddc;
> +
>   	if (intel_gmbus_is_adapter(connector))
>   		debugfs_create_file("intel_force_bit_banging", 0644,
> -				    connector->base.debugfs_entry, connector,
> +				    connector->base.debugfs_entry, adapter,
>   				    &intel_force_bit_banging_fops);
>   }
