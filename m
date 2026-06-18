Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F05ECD98ED
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jun 2026 21:19:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C381F10E4F3;
	Thu, 18 Jun 2026 21:19:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tl93Xf8R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A803810E4F3
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jun 2026 21:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781817547; x=1813353547;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=v+a6g8wjzORGJ60Xjy5liiMygR4asHQWWnhiONLPHtk=;
 b=Tl93Xf8Rbfb/wnuExYp5EBgJSaG7PA9hkoIkfMTDMsxNJ/mcStQ5E8SS
 iJX1k0Zfyv2yclvcZ70wad3qYCqCjgmHy55kVcEpYVzLabszzDhNMkZDv
 Ah5quUs8mDXQnobG2p/+6vcUtyJz3r1/mPFmkbNC2Dpk9ZWz9R733yHi4
 QLmRjKFHOdf8Fsde5V0MFBmXsrUYqe7ocZRClo+4tvcYCdGUCqc9hya0s
 Usl5LkTk+0tBZ84J7WejLX3aq4gYvziAvm79fcDx49ACBzCPqmc68N+k8
 CglKyUe/7J8eAC0CppnSjPMGuB1KCgasrbvG4xSwVOouC6utpCgjUBu8w A==;
X-CSE-ConnectionGUID: /LJy1DP3SpqH57LXGrQRyQ==
X-CSE-MsgGUID: bywXIYdPRzWGn/1hpi+C2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11821"; a="82672428"
X-IronPort-AV: E=Sophos;i="6.24,212,1774335600"; d="scan'208";a="82672428"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 14:19:07 -0700
X-CSE-ConnectionGUID: eXlC12SPTQWNJM8LaauIMA==
X-CSE-MsgGUID: UWfWcjrqTYu5SvxstIhxlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,212,1774335600"; d="scan'208";a="253450931"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 14:19:07 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 18 Jun 2026 14:19:06 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 18 Jun 2026 14:19:06 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.5) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 18 Jun 2026 14:19:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=da1USMuRI+e2Vul+Obn90z3HZEWaARLLsqjGM4nZSVWw9LzdghJH/QqabQg+WkuA9Wk3m/vkKyQQZk2aszQKl6wzCwBivsttsrHLo0rQQHi/OhqU62TE10Q37SEIrXwUtfpZKZjtCPfY04np1Si+aBoDotF/dXhePMRZ84fOhunKHH2+1rdMu2uxGq9tcEh0iWoQMxDQ6yL37TQqz3J8IKbWJ9dOr5akqM6FeioLvvwgrqCDJqZEDJoHw9oN1EY8MQpvkU/e+SfVwNbvQ9vzWmgrBuf/0EAcw6mCOZtmvc3kIvoffDzoS1/gE47RGsD+9uRcjw5kWi9tRDbGaxHlOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uiKI+Am8xRmyjwTg+Ljzta95+DgCAq72fUmPS45tsvo=;
 b=YEEE61yOAvvyAvt+6kicLM+Ho9HQDgLF3xUAcJ81CgaossBI9YeLEeKnbKRb+sNiUkf/shxWnD3ynC+uBZy9eScxDno4BLq5yd2rzDHfDzgH7M6wStU/3J5opjVhOoC4HEGIH27l7gWPHz81h7pLteRW4vFTW0HjeYMaWNhzh+7Qz1K6TBd/3qSwt98ghzVotcjKh2JKDkjzewKdpxvFKjgNSwZTpgz4QJyBHOKl038yyr45rZm668koiD85lbc8D8aJ751AIecfjW4sfzj8qWOBnI1oG20u8/Pix8RFa7bs70/UPSqr0bxO+Tuh9ynHqXKHTODBzUYOIHQr6Vtr/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF46B98A11D.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::23) by SJ2PR11MB8321.namprd11.prod.outlook.com
 (2603:10b6:a03:546::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Thu, 18 Jun
 2026 21:18:56 +0000
Received: from DS4PPF46B98A11D.namprd11.prod.outlook.com
 ([fe80::5a0d:e357:ce45:3963]) by DS4PPF46B98A11D.namprd11.prod.outlook.com
 ([fe80::5a0d:e357:ce45:3963%8]) with mapi id 15.21.0139.009; Thu, 18 Jun 2026
 21:18:55 +0000
Message-ID: <6dd74183-d9e3-4f3c-934a-7600c64ec202@intel.com>
Date: Thu, 18 Jun 2026 14:18:54 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/forcewake: add delayed-release optimization
To: Maarten Lankhorst <maarten@lankhorst.se>, <intel-xe@lists.freedesktop.org>
CC: <jia.yao@intel.com>
References: <20260601213804.707256-1-zongyao.bai@intel.com>
 <20260611010320.1489179-1-zongyao.bai@intel.com>
 <4e667eef-a66b-4265-a7dc-765aa9fa54cd@lankhorst.se>
Content-Language: en-US
From: "Bai, Zongyao" <zongyao.bai@intel.com>
In-Reply-To: <4e667eef-a66b-4265-a7dc-765aa9fa54cd@lankhorst.se>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0352.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::27) To DS4PPF46B98A11D.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF46B98A11D:EE_|SJ2PR11MB8321:EE_
X-MS-Office365-Filtering-Correlation-Id: d3dd0b60-b884-4b6a-e9c8-08decd7f3471
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|56012099006|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: Frtny6QYZdbv7nNn6cwxdTudlB52ywn8qXTUBwHSwwFF/ytYD4Nf9FKguQZFO9GxXGGKr7zMlpUweoJnSeKIbJ8nssJq2DWg6uhbR25XyBH3lDj0FAelBvdYL41PNpT/DpIPuFtQg2h9IbS6EiNfy0ViyHCR9oEqohlNh0lVQ58CRzzIKEYcyvzDa1foWKjJv9cHJturYPf1TLsWL+A976buWM7Wgjh1Kk0FeWVBjqB92qBlsLWdCMw6BmYJA2zX52IIYTMFtbQqWES46Bh/TnpwzlifjVWIyrEzhl1UpS+OI9D1BAB8CjvVmGO5Mjw4lLa5i9aSWLbtxRwBa5ukjOHjJTZdojXbLHsrjR0h8KYLCxdxbViU6bvpSbR4PvF2xBSeVyZTRKOjm5V3C520ykrDNFWUxlxfx87FOi0/LEUBXRI3VJQ6bQoGIFSpeyyS1/KLa/xt6E29PwkNxX/Lzf/iKHLQ5nUBpgEZC3FwG3USKcykrbgtdL85rCMDTMvVgV5rK1sRn8MN6ijQWgu7AdiboOhAVCb5dUUmRV0ej+bOS+LwJFF/1byk99xaLclSi6SLb6lmF15RPU1VSpi5wUaiAhDmLFtnSHcDVOfRoXQYJGUGEKJwjsdkvS8kqOGSpKVZZYGul3yFgiblaIfaW5ZSuRGHCcODT/lDC0SnMyw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF46B98A11D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UHdnYWNKUFltWGowQ1paTExZTEdXaVBmbG1iOFVHcXFBbldtUG11UUdlaTZx?=
 =?utf-8?B?TmpsS0hOVFdudG9pc1BmamcwaGFjZGtFZy9veWtiRTg3enRySmFFWXQvdTda?=
 =?utf-8?B?YUZSekFmQmtaSXNQK3dXc0dtY2Vjb2RlK2c5a3kwVmlHYklZWUVjKzBLN3dz?=
 =?utf-8?B?VC9wY0p5TkR4ZE53bWlRa0JVcnpDUkxUUnhIOHh3YUc3K3p0YWM3S21XdTFq?=
 =?utf-8?B?TS81ME0rZWNPbHplbjA2eXRUU2VFVHdQTW5NTGRjeC9KV0FPUzJYUGZkdi80?=
 =?utf-8?B?T1ZPY2swL0p5c0t2S0ZkN2xGWm9BSWY5QUxGL0dlZmxoQ2MzVm9HZERUQmlh?=
 =?utf-8?B?ZW1EVTR5QlJqNGZkbVB3UDc0QVMrUmFoeElGQWwxOW55UHZCZTlVN1Vhandn?=
 =?utf-8?B?MGRpMUZiK3h2YS9IazJoZFU2SytHSU9OQXkvd1l6SCs4ZDlNSnI5U0NVTjdN?=
 =?utf-8?B?MWNvVzg0eFBFSlMzSDRYNjlwQ2xlRnZjR3BvL1JSaFEwZy9TczNxUHlHeS9q?=
 =?utf-8?B?QTc5VFZVdnlBd3Ewd2JCVFdYeEhGSDJrQ1d2cXhwSzBTMmluQ0RrTmg3ZEM4?=
 =?utf-8?B?R2kraGcrZ3QrTVc5WllKbHNCOWFadU5EK0U5M0E4czZFd2krYk5NQUZOeHo2?=
 =?utf-8?B?aVk0bHJIOTBtNUtwZFhEQWcwazJEbGNJYzJLWXQzVWFmR3h5UHErMlhQWVRl?=
 =?utf-8?B?RWVTZ085YzhpYURNVTJCNkIyNE9adXNRdVR0LzJiN0NTUHl4bnpJdExoNjBV?=
 =?utf-8?B?KzFRUkhjWm1XSVR4cWMvenNwSUppVDZkS2RWeGUvN0ROVmZoNkVVOXNpK083?=
 =?utf-8?B?NXBNVGJxTDRXQnNBOG1WT05pMDZKZlFKNmgvTnNvUDRkdkhKU0dHTEZDRkMy?=
 =?utf-8?B?S29KSjdrSUM5TjFESjdjRHpEajhCTmhSTXhSb09JS1lGY1lqcERZV0J0Y0lw?=
 =?utf-8?B?QUZXRXFMSXB2TWtLRVBtQXZiSlhmOEQ0ZmEwVVVuRzRMbkx0Ymh2NTBlMHQr?=
 =?utf-8?B?QWlLVXNXUFcxaC85Zkpva0V3d0ZIeVdybXFGRzF2c3EwSjg3bFVmWkhLUXFR?=
 =?utf-8?B?NlRQRDZDUk80WmVXY2lWMGdBaitWYVBwOTg1M0tkSnhhSVZsSS9tN1F0b3Rm?=
 =?utf-8?B?V0w2S2VtLzJkQ1oxaCtxOGRsK3RQeWdOd0o4eFFxcHJKYzc2bEE4b3JqRHRk?=
 =?utf-8?B?MGJjSFBFek9VMVBTTGNLdFJQNGNVWGRTNWhJc1laL1ZEVGJXOU0vV0w5S0tp?=
 =?utf-8?B?Vm9maEloTDUrQ0hPTTBIMC9CS2U0cHdzcHM0UHBwMGpkdkJOcjhObDI5b3dZ?=
 =?utf-8?B?WkZTYm5NSUIrS0pCZjZ2OXJodStORVJBWjFJVWJ5SEVyekZpaFFudnhDZTE0?=
 =?utf-8?B?MElCLy9tdy9iSGw5ZG4yaDNVODVUcEQxaDZ5RnY1Q29iUjFwYkFtN3hhVGVn?=
 =?utf-8?B?eXZFWGdtdkdhWDY4YkVwZnFFVUxHR0hHRVd3cXRXY0xRQUFJbks0cHozcE9U?=
 =?utf-8?B?QWZMZ0JKK2FuME9GZzk2b2RocEJmc1VPWEViUkJnZFNLandIckI2S0JZb0xY?=
 =?utf-8?B?emVvNlNXVFRKdjBqMkpjdFZCd1h6cUpxOVZ1RzNZdVcvUytMMmh4WnVtSjNh?=
 =?utf-8?B?c0pWYWJ0M0d6Sit5VUV2R3NnKzR4RUFHQ0tzcDR4dTBqMWg1d3kxcGxTcFd3?=
 =?utf-8?B?Q0trNkdaZ0tFbTZubW1xQlVYVm1OOThmbnNkUFRJTkErYWZmSnRPZXE3dXo0?=
 =?utf-8?B?NkpUNFdnelpOcCtmemFFbDkwbEpRcENEMXB3OTNvL3dGZ1EyOHUvUW1xVzJa?=
 =?utf-8?B?bjRGdURIS1p3RlJ6Z1hwUHpwQllYbWpwcTVzOVBpOFU3RTFHeVdKczVaM01U?=
 =?utf-8?B?TFZOQzgvUmhiUmpDc3VYTWZQU2xteHdEMDk4cW5uSVFnTWJwMHN5NjRTL1dY?=
 =?utf-8?B?QjRuTysxdU5RTit3cjllNzhGaGsxTklLWHh2K1MzRzZaWXdTNjIwNDEzRDV3?=
 =?utf-8?B?aDRHWXh4aS9IVXdsZG8xcHhNODdGdFJFWnRwWUdLVWJFRkRHMEY5VGRGaGVl?=
 =?utf-8?B?VEZoR0NYTk1DTW5jY1JGaGxsU1E5aytqakZ1YStlbnJNRzA2RXNmOG94emtw?=
 =?utf-8?B?MlZUVnlyMUFDOHZkTnJFR0I2NWFTVTdKRnp3TlpWVmR1QUxQYzFTYjhIdWI2?=
 =?utf-8?B?ZnpGZHNNWGMvS20rZk9DZFJBYjJXck8rTE5yeFVTOTlxRS9KTXhDRkhjV3RS?=
 =?utf-8?B?aG1SdjYxMDhvV3dsL3FNVkFwbjJtekt1U2o4U3lVbDBpRWpVUlJCdWRqL3I4?=
 =?utf-8?B?NDZzSXI2dlFlTHhTeVB4emhYdXFSa2VFbVFDZFVsS29SVFhrM0tJZz09?=
X-Exchange-RoutingPolicyChecked: LacijAsMw7tWo8aQShxe8TnegJO2SUOwncnMkA+7G23xRWCP4qfr25EIw5tSZAONMNPNnJQ/QnELPq1uymPqOVp4MYK5nAuNwsLFSqLEfo6ktZTSiPNcGrxjXYtRfXvvFvVVwNyeY0scll8UnIZVdw1ETY3s9PGm7sMwz3OaZnyMPXILj6z4rir0u0O9Vm19E7fS2PWXJm/KOJfP6gKCMBesdWU3c+/L6tbkHdeRP8R5uS2cJzbKERXoRByXXLZuB3OqLUp59jCts21AzyUGTeLMjZ6vSHyClTgBmLQqgytDVLgVSN3DID/9lXY0KdUiR0zg0cLSUuxVBeLZpQ7Urw==
X-MS-Exchange-CrossTenant-Network-Message-Id: d3dd0b60-b884-4b6a-e9c8-08decd7f3471
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF46B98A11D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 21:18:55.9417 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /FDCVOzV9uuFgb8sRCKHkdVRUwEd1dRSmq+zJuwieNBx0BXkYbbh5Mx5Zfj6rjTl3JjIQUPNruE0dpITmtbDHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8321
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


On 6/11/2026 4:59 AM, Maarten Lankhorst wrote:
> Hey,
>
> Why not used delayed_work instead of introducing a hrtimer?
> Is the 200 µs that time critical?
>
> Regardless, can we not configure the delay in hardware instead of software?
>
> Kind regards,
> ~Maarten Lankhorst

Hi Maarten,

     Thank you for review.

1. Why not used delayed_work instead of introducing a hrtimer?
    Is the 200 µs that time critical?
    This optimization is target for back-to-back access to avoid 
frequently sleep/wake up actions.
    A tiny short hold time is enough for that. Introducing a hrtimer 
could make it precise with less jitter.
    delayed_work may make this tiny-short time > 1ms.
    200us is validated for zeDeviceGetGlobalTimestamps benchmark.
    But yes, we could test more values, like 100us/50us/...
    The shorter the better for the power consume.
    I'll update the result here later.

2. Regardless, can we not configure the delay in hardware instead of software?
    I do not see a generic, driver-visible hardware control for programming a
    forcewake auto-release delay in the current xe forcewake interface or register.
    And it likes a kind of software policy for optimization, there is no hard-limitation here.
    so the delayed release is implemented in software.

>
> On 6/11/26 03:03, Zongyao Bai wrote:
>> Add delayed-release optimization:
>>   - Add domain sleep XE_FORCE_WAKE_HOLD_DELAY_US after xe_force_wake_put()
>>   - Skip MMIO wake in xe_force_wake_get() if domain still awake.
>> Reduces frequent wake/sleep cycles for back-to-back operations.
>> Examples of scenarios: zeDeviceGetGlobalTimestamps read by VTune, PTI
>>
>> v2:
>>   - Add xe_force_wake_flush() and call it on the runtime/system
>>     suspend paths to ensure no deferred-sleep runs after GT power-off.
>>     (Sashiko)
>>
>> Assisted-by: GitHub-Copilot:claude-sonnet-4.6
>> Assisted-by: GitHub-Copilot:claude-opus-4.8 #v2
>> Signed-off-by: Zongyao Bai <zongyao.bai@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_force_wake.c       | 146 +++++++++++++++++++----
>>   drivers/gpu/drm/xe/xe_force_wake.h       |  23 +++-
>>   drivers/gpu/drm/xe/xe_force_wake_types.h |  11 ++
>>   drivers/gpu/drm/xe/xe_gt.c               |  26 ++--
>>   4 files changed, 171 insertions(+), 35 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
>> index 197e2197bd0a..b7c674f5f69a 100644
>> --- a/drivers/gpu/drm/xe/xe_force_wake.c
>> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
>> @@ -6,15 +6,20 @@
>>   #include "xe_force_wake.h"
>>   
>>   #include <drm/drm_util.h>
>> +#include <linux/device.h>
>> +#include <linux/hrtimer.h>
>>   
>>   #include "regs/xe_gt_regs.h"
>>   #include "regs/xe_reg_defs.h"
>> +#include "xe_device.h"
>>   #include "xe_gt.h"
>>   #include "xe_gt_printk.h"
>>   #include "xe_mmio.h"
>> +#include "xe_pm.h"
>>   #include "xe_sriov.h"
>>   
>>   #define XE_FORCE_WAKE_ACK_TIMEOUT_MS	50
>> +#define XE_FORCE_WAKE_HOLD_DELAY_US	200
>>   
>>   static const char *str_wake_sleep(bool wake)
>>   {
>> @@ -27,6 +32,8 @@ static void mark_domain_initialized(struct xe_force_wake *fw,
>>   	fw->initialized_domains |= BIT(id);
>>   }
>>   
>> +static enum hrtimer_restart xe_force_wake_domain_timer(struct hrtimer *timer);
>> +
>>   static void init_domain(struct xe_force_wake *fw,
>>   			enum xe_force_wake_domain_id id,
>>   			struct xe_reg reg, struct xe_reg ack)
>> @@ -38,11 +45,29 @@ static void init_domain(struct xe_force_wake *fw,
>>   	domain->reg_ack = ack;
>>   	domain->val = FORCEWAKE_MT(FORCEWAKE_KERNEL);
>>   	domain->mask = FORCEWAKE_MT_MASK(FORCEWAKE_KERNEL);
>> +	domain->fw_back = fw;
>> +	hrtimer_setup(&domain->timer, xe_force_wake_domain_timer,
>> +		      CLOCK_MONOTONIC, HRTIMER_MODE_REL);
>>   
>>   	mark_domain_initialized(fw, id);
>>   }
>>   
>> -void xe_force_wake_init_gt(struct xe_gt *gt, struct xe_force_wake *fw)
>> +static void xe_force_wake_fini(void *arg)
>> +{
>> +	struct xe_force_wake *fw = arg;
>> +	struct xe_gt *gt = fw->gt;
>> +	struct xe_force_wake_domain *domain;
>> +	unsigned int tmp;
>> +
>> +	for_each_fw_domain(domain, fw, tmp) {
>> +		xe_gt_WARN(gt, domain->ref,
>> +			   "Forcewake domain %d still referenced (%u) at teardown\n",
>> +			   domain->id, domain->ref);
>> +		hrtimer_cancel(&domain->timer);
>> +	}
>> +}
>> +
>> +int xe_force_wake_init_gt(struct xe_gt *gt, struct xe_force_wake *fw)
>>   {
>>   	struct xe_device *xe = gt_to_xe(gt);
>>   
>> @@ -58,6 +83,8 @@ void xe_force_wake_init_gt(struct xe_gt *gt, struct xe_force_wake *fw)
>>   			    FORCEWAKE_GT,
>>   			    FORCEWAKE_ACK_GT);
>>   	}
>> +
>> +	return devm_add_action_or_reset(xe->drm.dev, xe_force_wake_fini, fw);
>>   }
>>   
>>   void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
>> @@ -142,10 +169,37 @@ static void domain_sleep(struct xe_gt *gt, struct xe_force_wake_domain *domain)
>>   	__domain_ctl(gt, domain, false);
>>   }
>>   
>> -static int domain_sleep_wait(struct xe_gt *gt,
>> -			     struct xe_force_wake_domain *domain)
>> +static enum hrtimer_restart xe_force_wake_domain_timer(struct hrtimer *timer)
>>   {
>> -	return __domain_wait(gt, domain, false);
>> +	struct xe_force_wake_domain *domain =
>> +		container_of(timer, struct xe_force_wake_domain, timer);
>> +	struct xe_force_wake *fw = domain->fw_back;
>> +	struct xe_gt *gt = fw->gt;
>> +	unsigned long flags;
>> +
>> +	xe_gt_assert(gt, !xe_pm_runtime_suspended(gt_to_xe(gt)));
>> +
>> +	spin_lock_irqsave(&fw->lock, flags);
>> +
>> +	if (!(fw->timer_domains & BIT(domain->id)) || domain->ref) {
>> +		spin_unlock_irqrestore(&fw->lock, flags);
>> +		return HRTIMER_NORESTART;
>> +	}
>> +	if (domain->timer_rearm) {
>> +		domain->timer_rearm = false;
>> +		spin_unlock_irqrestore(&fw->lock, flags);
>> +		hrtimer_forward_now(timer,
>> +				    ns_to_ktime(XE_FORCE_WAKE_HOLD_DELAY_US *
>> +						NSEC_PER_USEC));
>> +		return HRTIMER_RESTART;
>> +	}
>> +
>> +	fw->timer_domains &= ~BIT(domain->id);
>> +	domain_sleep(gt, domain);
>> +	fw->awake_domains &= ~BIT(domain->id);
>> +	spin_unlock_irqrestore(&fw->lock, flags);
>> +
>> +	return HRTIMER_NORESTART;
>>   }
>>   
>>   /**
>> @@ -187,8 +241,13 @@ unsigned int __must_check xe_force_wake_get(struct xe_force_wake *fw,
>>   	spin_lock_irqsave(&fw->lock, flags);
>>   	for_each_fw_domain_masked(domain, ref_rqst, fw, tmp) {
>>   		if (!domain->ref++) {
>> -			awake_rqst |= BIT(domain->id);
>> -			domain_wake(gt, domain);
>> +			if (fw->awake_domains & BIT(domain->id)) {
>> +				fw->timer_domains &= ~BIT(domain->id);
>> +				hrtimer_try_to_cancel(&domain->timer);
>> +			} else {
>> +				awake_rqst |= BIT(domain->id);
>> +				domain_wake(gt, domain);
>> +			}
>>   		}
>>   		ref_incr |= BIT(domain->id);
>>   	}
>> @@ -213,27 +272,23 @@ unsigned int __must_check xe_force_wake_get(struct xe_force_wake *fw,
>>   }
>>   
>>   /**
>> - * xe_force_wake_put - Decrement the refcount and put domain to sleep if refcount becomes 0
>> + * xe_force_wake_put - Decrement the refcount and arm the delayed-sleep timer
>>    * @fw: Pointer to the force wake structure
>>    * @fw_ref: return of xe_force_wake_get()
>>    *
>> - * This function reduces the reference counts for domains in fw_ref. If
>> - * refcount for any of the specified domain reaches 0, it puts the domain to sleep
>> - * and waits for acknowledgment for domain to sleep within 50 milisec timeout.
>> - * Warns in case of timeout of ack from domain.
>> + * This function reduces the reference counts for domains in fw_ref.  When a
>> + * domain's refcount reaches 0 the sleep request is not issued immediately;
>> + * instead a hrtimer is armed for XE_FORCE_WAKE_HOLD_DELAY_US so that a rapid
>> + * xe_force_wake_get() can reuse the still-awake domain at zero MMIO cost.  On
>> + * timer expiry, if the domain is still idle, the sleep request is written.
>>    */
>>   void xe_force_wake_put(struct xe_force_wake *fw, unsigned int fw_ref)
>>   {
>>   	struct xe_gt *gt = fw->gt;
>>   	struct xe_force_wake_domain *domain;
>> -	unsigned int tmp, sleep = 0;
>> +	unsigned int tmp;
>>   	unsigned long flags;
>> -	int ack_fail = 0;
>>   
>> -	/*
>> -	 * Avoid unnecessary lock and unlock when the function is called
>> -	 * in error path of individual domains.
>> -	 */
>>   	if (!fw_ref)
>>   		return;
>>   
>> @@ -245,20 +300,59 @@ void xe_force_wake_put(struct xe_force_wake *fw, unsigned int fw_ref)
>>   		xe_gt_assert(gt, domain->ref);
>>   
>>   		if (!--domain->ref) {
>> -			sleep |= BIT(domain->id);
>> -			domain_sleep(gt, domain);
>> +			fw->timer_domains |= BIT(domain->id);
>> +			if (hrtimer_callback_running(&domain->timer)) {
>> +				domain->timer_rearm = true;
>> +			} else {
>> +				domain->timer_rearm = false;
>> +				hrtimer_start(&domain->timer,
>> +					      ns_to_ktime(XE_FORCE_WAKE_HOLD_DELAY_US *
>> +							  NSEC_PER_USEC),
>> +				      HRTIMER_MODE_REL);
>> +			}
>>   		}
>>   	}
>> -	for_each_fw_domain_masked(domain, sleep, fw, tmp) {
>> -		if (domain_sleep_wait(gt, domain) == 0)
>> +	spin_unlock_irqrestore(&fw->lock, flags);
>> +}
>> +
>> +/**
>> + * xe_force_wake_flush - Cancel pending delayed-sleep timers and settle domains
>> + * @fw: Pointer to the force wake structure
>> + *
>> + * The delayed-release optimization in xe_force_wake_put() arms a short hrtimer
>> + * instead of putting an idle domain to sleep immediately.  That deferred sleep
>> + * performs MMIO and must not be allowed to run after the device has been
>> + * powered down.  Callers on the runtime/system suspend path must therefore
>> + * flush any outstanding timers once forcewake has been fully released, before
>> + * the hardware is powered off.
>> + *
>> + * For every domain this cancels the pending timer (synchronously waiting for an
>> + * in-flight callback to finish) and, if the domain is still idle with an
>> + * outstanding deferred sleep, performs the sleep request right away so the
>> + * domain is left in a consistent, fully-asleep state.  hrtimer_cancel() must be
>> + * called without holding fw->lock, since the timer callback takes that same
>> + * lock.
>> + */
>> +void xe_force_wake_flush(struct xe_force_wake *fw)
>> +{
>> +	struct xe_gt *gt = fw->gt;
>> +	struct xe_force_wake_domain *domain;
>> +	unsigned int tmp;
>> +	unsigned long flags;
>> +
>> +	for_each_fw_domain(domain, fw, tmp)
>> +		hrtimer_cancel(&domain->timer);
>> +
>> +	spin_lock_irqsave(&fw->lock, flags);
>> +	for_each_fw_domain(domain, fw, tmp) {
>> +		domain->timer_rearm = false;
>> +		if ((fw->timer_domains & BIT(domain->id)) && !domain->ref) {
>> +			fw->timer_domains &= ~BIT(domain->id);
>> +			domain_sleep(gt, domain);
>>   			fw->awake_domains &= ~BIT(domain->id);
>> -		else
>> -			ack_fail |= BIT(domain->id);
>> +		}
>>   	}
>>   	spin_unlock_irqrestore(&fw->lock, flags);
>> -
>> -	xe_gt_WARN(gt, ack_fail, "Forcewake domain%s %#x failed to acknowledge sleep request\n",
>> -		   str_plural(hweight_long(ack_fail)), ack_fail);
>>   }
>>   
>>   const char *xe_force_wake_domain_to_str(enum xe_force_wake_domain_id id)
>> diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
>> index e2721f205d6c..1b6d5efead38 100644
>> --- a/drivers/gpu/drm/xe/xe_force_wake.h
>> +++ b/drivers/gpu/drm/xe/xe_force_wake.h
>> @@ -11,13 +11,32 @@
>>   
>>   struct xe_gt;
>>   
>> -void xe_force_wake_init_gt(struct xe_gt *gt,
>> -			   struct xe_force_wake *fw);
>> +int xe_force_wake_init_gt(struct xe_gt *gt,
>> +			  struct xe_force_wake *fw);
>>   void xe_force_wake_init_engines(struct xe_gt *gt,
>>   				struct xe_force_wake *fw);
>>   unsigned int __must_check xe_force_wake_get(struct xe_force_wake *fw,
>>   					    enum xe_force_wake_domains domains);
>>   void xe_force_wake_put(struct xe_force_wake *fw, unsigned int fw_ref);
>> +void xe_force_wake_flush(struct xe_force_wake *fw);
>> +
>> +/**
>> + * xe_force_wake_put_and_flush - Release forcewake and settle any deferred sleep
>> + * @fw: Pointer to the force wake structure
>> + * @fw_ref: return of xe_force_wake_get()
>> + *
>> + * Convenience helper for paths that must guarantee the domain is fully asleep
>> + * before returning (typically right before the GT is powered off on
>> + * runtime/system suspend). Because the flush has to run after the final put
>> + * but before HW power-off, scope-based cleanup via CLASS(xe_force_wake, ...)
>> + * cannot be used here.
>> + */
>> +static inline void
>> +xe_force_wake_put_and_flush(struct xe_force_wake *fw, unsigned int fw_ref)
>> +{
>> +	xe_force_wake_put(fw, fw_ref);
>> +	xe_force_wake_flush(fw);
>> +}
>>   
>>   const char *xe_force_wake_domain_to_str(enum xe_force_wake_domain_id id);
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_force_wake_types.h b/drivers/gpu/drm/xe/xe_force_wake_types.h
>> index 14b7b86e801b..ee5675069fe0 100644
>> --- a/drivers/gpu/drm/xe/xe_force_wake_types.h
>> +++ b/drivers/gpu/drm/xe/xe_force_wake_types.h
>> @@ -6,6 +6,7 @@
>>   #ifndef _XE_FORCE_WAKE_TYPES_H_
>>   #define _XE_FORCE_WAKE_TYPES_H_
>>   
>> +#include <linux/hrtimer.h>
>>   #include <linux/mutex.h>
>>   #include <linux/types.h>
>>   
>> @@ -51,6 +52,8 @@ enum xe_force_wake_domains {
>>   	XE_FORCEWAKE_ALL	= BIT(XE_FW_DOMAIN_ID_COUNT)
>>   };
>>   
>> +struct xe_force_wake;
>> +
>>   /**
>>    * struct xe_force_wake_domain - Xe force wake power domain
>>    *
>> @@ -82,6 +85,12 @@ struct xe_force_wake_domain {
>>   	u32 mask;
>>   	/** @ref: domain reference */
>>   	u32 ref;
>> +	/** @timer_rearm: put() ran while callback was in-flight; callback must restart timer */
>> +	bool timer_rearm;
>> +	/** @timer: hrtimer for delayed sleep request */
>> +	struct hrtimer timer;
>> +	/** @fw_back: back pointer to parent xe_force_wake */
>> +	struct xe_force_wake *fw_back;
>>   };
>>   
>>   /**
>> @@ -101,6 +110,8 @@ struct xe_force_wake {
>>   	spinlock_t lock;
>>   	/** @awake_domains: mask of all domains awake */
>>   	unsigned int awake_domains;
>> +	/** @timer_domains: mask of domains with an outstanding delayed-sleep timer */
>> +	unsigned int timer_domains;
>>   	/** @initialized_domains: mask of all initialized domains */
>>   	unsigned int initialized_domains;
>>   	/** @domains: force wake domains */
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index 783eb6d631b5..bba51a655b28 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -511,7 +511,9 @@ int xe_gt_init_early(struct xe_gt *gt)
>>   
>>   	xe_wa_process_gt_oob(gt);
>>   
>> -	xe_force_wake_init_gt(gt, gt_to_fw(gt));
>> +	err = xe_force_wake_init_gt(gt, gt_to_fw(gt));
>> +	if (err)
>> +		return err;
>>   	spin_lock_init(&gt->global_invl_lock);
>>   
>>   	err = xe_gt_tlb_inval_init_early(gt);
>> @@ -998,13 +1000,15 @@ void xe_gt_suspend_prepare(struct xe_gt *gt)
>>   
>>   int xe_gt_suspend(struct xe_gt *gt)
>>   {
>> +	unsigned int fw_ref;
>>   	int err;
>>   
>>   	xe_gt_dbg(gt, "suspending\n");
>>   	xe_gt_sanitize(gt);
>>   
>> -	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>> -	if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FORCEWAKE_ALL)) {
>> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>> +	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
>> +		xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>   		xe_gt_err(gt, "suspend failed (%pe)\n", ERR_PTR(-ETIMEDOUT));
>>   		return -ETIMEDOUT;
>>   	}
>> @@ -1012,7 +1016,7 @@ int xe_gt_suspend(struct xe_gt *gt)
>>   	err = xe_uc_suspend(&gt->uc);
>>   	if (err) {
>>   		xe_gt_err(gt, "suspend failed (%pe)\n", ERR_PTR(err));
>> -		return err;
>> +		goto err_force_wake;
>>   	}
>>   
>>   	xe_gt_idle_disable_pg(gt);
>> @@ -1021,7 +1025,10 @@ int xe_gt_suspend(struct xe_gt *gt)
>>   
>>   	xe_gt_dbg(gt, "suspended\n");
>>   
>> -	return 0;
>> +err_force_wake:
>> +	xe_force_wake_put_and_flush(gt_to_fw(gt), fw_ref);
>> +
>> +	return err;
>>   }
>>   
>>   void xe_gt_shutdown(struct xe_gt *gt)
>> @@ -1080,10 +1087,13 @@ int xe_gt_resume(struct xe_gt *gt)
>>    */
>>   int xe_gt_runtime_suspend(struct xe_gt *gt)
>>   {
>> +	unsigned int fw_ref;
>> +
>>   	xe_gt_dbg(gt, "runtime suspending\n");
>>   
>> -	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>> -	if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FORCEWAKE_ALL)) {
>> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>> +	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
>> +		xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>   		xe_gt_err(gt, "runtime suspend failed (%pe)\n", ERR_PTR(-ETIMEDOUT));
>>   		return -ETIMEDOUT;
>>   	}
>> @@ -1093,6 +1103,8 @@ int xe_gt_runtime_suspend(struct xe_gt *gt)
>>   
>>   	xe_gt_dbg(gt, "runtime suspended\n");
>>   
>> +	xe_force_wake_put_and_flush(gt_to_fw(gt), fw_ref);
>> +
>>   	return 0;
>>   }
>>   
