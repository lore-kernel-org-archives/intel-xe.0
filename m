Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 753EDC98328
	for <intel-xe@archiver.kernel.org>; Mon, 28 Sep 2026 05:12:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FD4910E77A;
	Mon, 28 Sep 2026 05:12:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g3U/1htN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F1B310E770;
 Mon, 28 Sep 2026 05:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790572337; x=1822108337;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uujijEhUGiyejbHrcmq9FvBuxo/4CZBw1bWIPlGwLRI=;
 b=g3U/1htNcDBrUw2ppEA1xHcz/qntNn7CrCdXXLBVTd6Uovnj0iFxQMij
 gQdCwFrDeQBvofRc45zox1d+jtiytcymtuurt6NmcOSBpWHVVUtgaUCjQ
 7ZRXgR4hZ+y83D5qvtRQoqIUJgc2CQHuNFlGvnORHk8YpiysR84fKL2V1
 UPc0fEgB/vbP3E0TEjWvdb1keexiT8qPgSmgTenHrU8akuEPx8bx+pvZy
 1IuFyt2xX/79ArNg3jsPn5Immu+52YWRDYxk6oz1yiDCEjCcpRp2d4C3Q
 sannWf/MXS00W2R9qblpM82dQw35WRvCN6R6C3Vz5+4BbNI+Ls9rcY14z A==;
X-CSE-ConnectionGUID: 05+0AFvjRLKugtdmttbN3Q==
X-CSE-MsgGUID: esodXuh9TTaJdHe9sbnIMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="101920967"
X-IronPort-AV: E=Sophos;i="6.27,127,1787036400"; d="scan'208";a="101920967"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2026 22:12:17 -0700
X-CSE-ConnectionGUID: KlmoMS09RLiQQHVe88jrYg==
X-CSE-MsgGUID: s6pPjZNbSHqLKvfmNuzNtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,127,1787036400"; d="scan'208";a="274996323"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2026 22:12:17 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 27 Sep 2026 22:12:16 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Sun, 27 Sep 2026 22:12:16 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.1) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 27 Sep 2026 22:12:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ffR5ZQDMNqujume7xTBlZpV+lgXqMT8xqVYaTUgwbVAkynnCDRAhyI9Ig2rwab3SUwkt3HBqtLlA6Gl9uvo+ZsThJMmny7jKcs1eMREuwcI66sGaA9D665xfah+mtt5+lHyykGecJ0EQEgCMWdA/15rNW53putaDUBUEEq7Wo0+SwYmwzhF6zkmGSqxZL7XDxhDjQ5RifGw9FisfM0wE0ZdmOdpuNTLWokE6aus8Yuga6FxnD+Q3GJyLb5mcOUTZkUSR/iMa370yzYbCpq9wtQoEq+0qaAJSa8YdvtMruUMXI5RzdP4539kEQBAhQKc/6wivw7Qe83kfiKoUPlBw2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xp/QWb5CAUyii7EmEhwPCQK9dMDtwBThVdwCRKAC5aQ=;
 b=e98g8AMZoJXv5+gbIP1iFt+wliGmLr0Tcq198ttYF4lM07WKl2jqWxXaFVs2p4RsJDOTIwe8+z7OFrGoFc/kgyBzEbnoHct2WZawCqdJVFaI/3P5MKN20SVlc65/pBnQFeXoReDd3YNiL2HZ5ZlOyAvfKb2PMAq82x6obVVs7R+koxoGMd30N3mWEOaL6htW7KNfCTRvSoUoI6Avtmug8DEsyll7cOeagUk1a/wEey4D0LjvKnQeUCyucRpNbQ1EnOllXEOvGNhcUzvOdKVUIQcq6xfbSjcVBXEulZoTqSi941Qb092aRkTBsl3cmXT5dZgQtmM+xb92AMXU+tzIhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7149.namprd11.prod.outlook.com (2603:10b6:303:221::14)
 by SJ5PPF867D7FF5E.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83d) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 05:12:09 +0000
Received: from MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c]) by MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c%4]) with mapi id 15.21.0451.014; Mon, 28 Sep 2026
 05:12:08 +0000
Message-ID: <eedf6324-56d2-4462-bef9-4d721fcc78b7@intel.com>
Date: Mon, 28 Sep 2026 10:42:02 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] drm/i915/gmbus: Add bit-banging debugfs control
To: Jani Nikula <jani.nikula@intel.com>, <intel-xe@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>
CC: <ankit.k.nautiyal@intel.com>
References: <20260924152812.439986-1-ramanaidu.naladala@intel.com>
 <20260924152812.439986-2-ramanaidu.naladala@intel.com>
 <ee11604db9b3c47383e1c32e68a34ffdca2fde86@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <ee11604db9b3c47383e1c32e68a34ffdca2fde86@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0109.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b5::14) To MW4PR11MB7149.namprd11.prod.outlook.com
 (2603:10b6:303:221::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7149:EE_|SJ5PPF867D7FF5E:EE_
X-MS-Office365-Filtering-Correlation-Id: b3d12f18-7e33-481b-ea5d-08df1d1f0bbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|3023799007|10067099003|56012099006|11063799006|5023799004|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 3IZE6mQZSRRpmQYneOmtDKgndz1mgNJ3adn1/VHISN+5Rj+MIO/FjFwjmYtjixXdrdiokrHL8ODa9qX4fCoid+cB9U7KlT5TwxTYz9L8KxPNzcrRsuHZjiy18J58nMmwvJX8iBe7bK3eUVTE/2ow+8gOkyuw4t+jC8AG/7BdxLVtUMaecKsWQ+7gGhBRZSgdISyjo5wGdOLAQW4EE5wZjRMwllf9t94kC+xk24/3S4iqWKhVJLwfYzeYXrW1BJXTubOjj6BGqvVik2jVioxYI2+3KXjwJctCguwHV0hldOTDyxjOxLrHPFAkIM6M8ErqA8c8z75Mzro9cmW5WqDm7NOHEQ3S+K5V+5M6zLhKhiq0aX+lkiZKdZdjj7zoySfB6KWnImr0vDG7GI8jyOdNLJ9f6W9GGuzsWJz7gv51Ska7Xm/6GkBflep+cca3tleC6nnPfHRFLlrzdU2zJnaUdtLH16AvDJ8Y5UnGb+i9PnwrwlYLeiuBbeMuztiTHCjsbhE1nZgK+QQ2a0ZeKvUelPeZ3lcPRFdy3nm9hgyZhobzIHFVkypMdzga61cH2xTXB+Apdp04foqkVq5goFM8EgExUz0Ftwi0r3Sd/hbfya3kuESk/wEsTTozowVg88BJe4LcESwdL4CW8kWZd03OSzVRINwpdMir7UOK7MMKH6A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7149.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(3023799007)(10067099003)(56012099006)(11063799006)(5023799004)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dDJJbU0vb09wWU1qQ2R1ejFmbmp1NmZ1RFVQWVh6TWJzc3NQZmo5SGJxNUQz?=
 =?utf-8?B?dFgvVlA3WGZBTXZqcFdCMGV5cGxOOWRveHJOR3E2NjF5YzYzM0Zvc2lEMWxX?=
 =?utf-8?B?YUw1cUFueVhBbDhZUjJkY1hCWStadU8vUW5tN0YvMWpXaWVNWG5JanFpeFpj?=
 =?utf-8?B?WngyNm80NGhGOWF0QThZQVEyV0h4clVtRkFPZi96bDMzVHRyWXp6aEpvVkxz?=
 =?utf-8?B?QUsrKzhIV2Q2R3R3Vllpd1AwZTBhak44YVRhZmM2aDJBQS9SalJOWUlMRnpq?=
 =?utf-8?B?RWRDR3ZMMkpGa2lhWWM2anovR0ZLQkJTLzNIRFZoZlZOUWVCcG0vbUdYMzIx?=
 =?utf-8?B?aVdYTW9JekdUM2lJbXRWSG9DdU1WRGFkUkRmTU9wakc2d2g3OFJheFpFN2dF?=
 =?utf-8?B?NVN5S09xUEI4SWJFVjhFOXlxQ0pqTmVoeGNJWHQ0Z2tMTkI1MG9JdEN1aEFz?=
 =?utf-8?B?MUhvcTVEWTdMUlg4YkFsV00xQzJ4MG0yNk44a3N3Vitld0tMR2FVeWJZUmFO?=
 =?utf-8?B?bDBadDJGMlpNZXQwYTROSFducG5Wc05VcjFtWVE4aGNUeW1qeElsUm1OYUpr?=
 =?utf-8?B?Qms0aVhocy9oN1FaSVQrTm1zV2lkS2hkNmRnaGx5c0Ntbm9KOWplMlR1U0dv?=
 =?utf-8?B?UUY2d2dJQ3FpNjVKSzF2c0Ewa0IrWlVTVDEyanNCQktqcktnbFpvQmw3a0hP?=
 =?utf-8?B?YllIcTVCcGEwQkduMGdJVEQxUURCc2owMXkwSkxLRnlmc0dMRnBzdm90ckNB?=
 =?utf-8?B?ZGx6em5GS0RwMmJBWEVZcWVqRjVjSzdHWU1oeUtSSUZyRk1jN1BNUzNyUzYr?=
 =?utf-8?B?QkxjUDNuamRMTE9lOVZiK3Y0RlJIb1BxaEZCZzZTU3hQbnhYOVYrVkVYZTRp?=
 =?utf-8?B?VjJsNng3M3JUaG5tQWVmd1BNZ0h4TWErS0YvQkEwRjQ1MXVkNWIzeGgvUFhM?=
 =?utf-8?B?R0E0bE5GU2ErZkVqRVZOQlNpRElNaWdNVUhCMW54WHJidG5JcWxJMEZGYWVG?=
 =?utf-8?B?K1d5M3ExK3RxTHBiRUlrbysvRldVYkJQd1lqWisxQlU3VTFIYzN6bXJNdjZr?=
 =?utf-8?B?UWpxaXhDMVhEaFlZbGlqdUtxZXo2Sk9KQ09YY1FTY3pVRW9rZ1hCZEU2VU5x?=
 =?utf-8?B?L2tnWWNhU05Qa082OS8wQXVUcTZoZVlib2pqTnlKWXZxZXlzODVJVWhWYjhn?=
 =?utf-8?B?dTNSNkV4Q1RYMXNTUXdFSEN0S2JhVEFFOWRjNjNOTXJ4b0lJR05BT3ZBcjJr?=
 =?utf-8?B?ZlhUWm1CZlVkTjJpZE5vY0RrV2REbUF4b0hGZnQxalNnL0xqbG4xREcxcVAy?=
 =?utf-8?B?NW52OHFjekd1NHh3NGZEVEJnSGFYY0ZlR0p0TE1reS8rY1Yya1J2Z0EwSjZQ?=
 =?utf-8?B?QlJjTVNTZkFkTVBoSnprUU9TNEFUUWt2ZGYyU21Vakh4SDZUQjdjWGZsV3pa?=
 =?utf-8?B?R1M4cnpjM3ZYRFluYjFOai9uZHJ0SnRMSkkyVVdINGo3ZXdMNkdmWTQxa2FG?=
 =?utf-8?B?M0JFU1lEOVJXK3VVR29qa1g4OW5RbU1GRVAzbVJDY0hpQmUybTNnM2ZuWlJM?=
 =?utf-8?B?TEpCVVd2VDkwdXpTR2cxYXlMRkFqZE4xTW1TMzduWEFsMzZoK2hQcTAwQUpC?=
 =?utf-8?B?a1lVSWpScDBMUEZZZDB2WWlsbmV3SlVaeXgvZGVMNytDL3NXNkFoc1NYQVNz?=
 =?utf-8?B?ZDNkWEVYbmdzWkxsOHU0c2tJLzJPWWtNNWNFNjB4TmdIWVhJUkFENmVmMG9m?=
 =?utf-8?B?aVJEMnRYd2VEc1B5b3dIY1BHYnl3WXhHOVJhRFRrZGdzN291bk9RZEZYdDF3?=
 =?utf-8?B?cXg4YkxzUUdjNzhSWng0RzlWZnNKNXc3RHdzNlRSZ3g0Ky9kRkFqNVRnZVBF?=
 =?utf-8?B?cC9PREt2eWtkSlhWeVVLV2J4S0k5RjhDLzRnQkpFc1hJaFlWd3lDL2krTUg5?=
 =?utf-8?B?R2JiTEpJdzk0enNqb3VxSjc4eGNGanh3K21qRWRYRHNNOVBGMEowTlZML1Bj?=
 =?utf-8?B?NjBJZEsvalZ6bVVLZm5uTUJOSUxSOGgybHZvM1hhOXcvSUR2OWhmdVBBMnhu?=
 =?utf-8?B?OFl6dnlPUVdSSXVuTlBvaFdBZmV1dVVFZGpielF0OWdDK2ZEbkh4cXYyL3V2?=
 =?utf-8?B?UlFNVm45SjdveUVUYitDOTRIV0tOd1FqbHR5VUYwSWhva0E5bEdqNU9hb3d1?=
 =?utf-8?B?aUd4MHM0WWQrT3NuOVFjeTFJalZRSTcveTBjaVNCVksydDZna2JidkNyY1k4?=
 =?utf-8?B?VlI3K0dZL2xxMU84REVMV3VPRkk3SmZaeC94UzM4VUpsTmtPTWFxcWtQbEhn?=
 =?utf-8?B?RGNGdE5pWGUzenJzUnVsVHdGTEVpaTRweWs3Sm1YOVBRL1RDQzhIRitoZ1Jt?=
 =?utf-8?Q?TLr/pq6RATjawXyg=3D?=
X-Exchange-RoutingPolicyChecked: Z0dT8Sev16CGvMlXt86+wm6s8oZf5nXMu/doAq85CWKWtjlGbLKkt9Z2sQZJbfUJsZu2orMzBWJzg3zX1ORMNQNzS/5vya2HU4lNS9DR09yFmNdcZhJEwADrKVdWhS0U2Ll5ixusBmgQdAjBhj+6Hxzt40j3h6BFbV32n8KpN5HjLRUhTrm2mIKMC1piwyY9Jgbyaubx6Y24BNc2vseP/Yr+19s3j8EnmyrxP1WtbhUeFl1D/QqEiVcSC9ocK6Upp7czoO3oYMCRizU291DhyGeHeTmBAUUFg9dAZlbswgVQzIoLrjN7c7h3c9In+3fia4OpdcwfmiADTqFjMUUjAA==
X-MS-Exchange-CrossTenant-Network-Message-Id: b3d12f18-7e33-481b-ea5d-08df1d1f0bbb
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 05:12:08.9025 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4rmAVK2M5lpiVdqggkPgbdF2ebA71ToljiYsW7anpm5wHcyvB9TzjQEOwJ5gVnbCehwo4En0l15K4TBdDoCtc2fVfZ38Y2Pe8X+5w3dlJYU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF867D7FF5E
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

Hi Jani,

Thanks for the review comments. Sure i will fix them in the next revision.

On 9/25/2026 4:00 PM, Jani Nikula wrote:
> On Thu, 24 Sep 2026, Naladala Ramanaidu <ramanaidu.naladala@intel.com> wrote:
>> Add a connector debugfs interface to enable or disable I2C
>> bit-banging for Intel GMBUS adapters.
>>
>> v1: Address below review comments: (Jani Nikula)
>>      - Remove HDMI-specific EDID read path changes.
>>      - Control bit-banging directly from debugfs via intel_gmbus_force_bit()
>>
>> Assisted-by: OpenAI Codex:GPT-5
>> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
>> ---
>>   .../drm/i915/display/intel_display_debugfs.c  |  3 +
>>   .../drm/i915/display/intel_display_types.h    |  1 +
>>   drivers/gpu/drm/i915/display/intel_gmbus.c    | 61 +++++++++++++++++++
>>   drivers/gpu/drm/i915/display/intel_gmbus.h    |  3 +
>>   4 files changed, 68 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
>> index 3e302f23f247..74f065175a72 100644
>> --- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
>> +++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
>> @@ -40,6 +40,7 @@
>>   #include "intel_fb.h"
>>   #include "intel_fbc.h"
>>   #include "intel_fbdev.h"
>> +#include "intel_gmbus.h"
>>   #include "intel_hdcp.h"
>>   #include "intel_hdmi.h"
>>   #include "intel_hotplug.h"
>> @@ -1327,6 +1328,8 @@ void intel_connector_debugfs_add(struct intel_connector *connector)
>>   	if (!root)
>>   		return;
>>   
>> +	intel_gmbus_connector_debugfs_add(connector);
>> +
> Superfluous newline. All the other calls below are back to back.
>
>>   	intel_drrs_connector_debugfs_add(connector);
>>   	intel_hdcp_connector_debugfs_add(connector);
>>   	intel_pps_connector_debugfs_add(connector);
>> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
>> index 79f30660c2b6..5cef2582c361 100644
>> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
>> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
>> @@ -558,6 +558,7 @@ struct intel_connector {
>>   	u8 polled;
>>   
>>   	int force_joined_pipes;
>> +	bool force_bit_banging;
> This should be hidden in struct intel_gmbus next to force_bit, maybe as
> debugfs_force_bit or something.
>
>>   
>>   	struct {
>>   		struct drm_dp_aux *dsc_decompression_aux;
>> diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.c b/drivers/gpu/drm/i915/display/intel_gmbus.c
>> index 60a70dea5d85..38d6d1148399 100644
>> --- a/drivers/gpu/drm/i915/display/intel_gmbus.c
>> +++ b/drivers/gpu/drm/i915/display/intel_gmbus.c
>> @@ -27,6 +27,7 @@
>>    *	Chris Wilson <chris@chris-wilson.co.uk>
>>    */
>>   
>> +#include <linux/debugfs.h>
>>   #include <linux/export.h>
>>   #include <linux/i2c-algo-bit.h>
>>   #include <linux/i2c.h>
>> @@ -871,6 +872,66 @@ static const struct i2c_algorithm gmbus_algorithm = {
>>   	.functionality	= gmbus_func
>>   };
>>   
>> +bool intel_gmbus_is_adapter(struct i2c_adapter *adapter)
> This should be static.
>
>> +{
>> +	return adapter->algo == &gmbus_algorithm;
>> +}
>> +
>> +static int intel_force_bit_banging_show(struct seq_file *m, void *data)
>> +{
>> +	struct intel_connector *connector = m->private;
>> +
>> +	seq_printf(m, "%u\n", connector->force_bit_banging);
>> +
>> +	return 0;
>> +}
>> +
>> +static ssize_t intel_force_bit_banging_write(struct file *file,
>> +						     const char __user *ubuf,
>> +						     size_t len, loff_t *offp)
>> +{
>> +	struct seq_file *m = file->private_data;
>> +	struct intel_connector *connector = m->private;
>> +	bool force_bit_banging;
>> +	int ret;
>> +
>> +	ret = kstrtobool_from_user(ubuf, len, &force_bit_banging);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (force_bit_banging != connector->force_bit_banging) {
>> +		intel_gmbus_force_bit(connector->base.ddc, force_bit_banging);
>> +		connector->force_bit_banging = force_bit_banging;
>> +	}
>> +
>> +	*offp += len;
>> +
>> +	return len;
>> +}
>> +
>> +static int intel_force_bit_banging_open(struct inode *inode, struct file *file)
>> +{
>> +	return single_open(file, intel_force_bit_banging_show, inode->i_private);
>> +}
>> +
>> +static const struct file_operations intel_force_bit_banging_fops = {
>> +	.owner = THIS_MODULE,
>> +	.open = intel_force_bit_banging_open,
>> +	.read = seq_read,
>> +	.llseek = seq_lseek,
>> +	.release = single_release,
>> +	.write = intel_force_bit_banging_write,
>> +};
>> +
>> +void intel_gmbus_connector_debugfs_add(struct intel_connector *connector)
>> +{
>> +	if (connector->base.ddc &&
>> +	    intel_gmbus_is_adapter(connector->base.ddc))
> The connector->base.ddc != NULL check should be inside
> intel_gmbus_is_adapter().
>
>> +		debugfs_create_file("intel_force_bit_banging", 0644,
>> +				    connector->base.debugfs_entry, connector,
>> +				    &intel_force_bit_banging_fops);
>> +}
>> +
>>   static void gmbus_lock_bus(struct i2c_adapter *adapter,
>>   			   unsigned int flags)
>>   {
>> diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.h b/drivers/gpu/drm/i915/display/intel_gmbus.h
>> index 5fdeab1aa794..968f8cb42821 100644
>> --- a/drivers/gpu/drm/i915/display/intel_gmbus.h
>> +++ b/drivers/gpu/drm/i915/display/intel_gmbus.h
>> @@ -9,6 +9,7 @@
>>   #include <linux/types.h>
>>   
>>   struct i2c_adapter;
>> +struct intel_connector;
>>   struct intel_display;
>>   
>>   #define GMBUS_PIN_DISABLED	0
>> @@ -41,6 +42,8 @@ int intel_gmbus_output_aksv(struct i2c_adapter *adapter);
>>   
>>   struct i2c_adapter *
>>   intel_gmbus_get_adapter(struct intel_display *display, unsigned int pin);
>> +bool intel_gmbus_is_adapter(struct i2c_adapter *adapter);
>> +void intel_gmbus_connector_debugfs_add(struct intel_connector *connector);
>>   void intel_gmbus_force_bit(struct i2c_adapter *adapter, bool force_bit);
>>   bool intel_gmbus_is_forced_bit(struct i2c_adapter *adapter);
>>   void intel_gmbus_reset(struct intel_display *display);
