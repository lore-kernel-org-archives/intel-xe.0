Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0F50D116F3
	for <intel-xe@archiver.kernel.org>; Wed,  3 Dec 2025 08:52:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61FDB10E784;
	Wed,  3 Dec 2025 08:52:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lddKR/+J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5C3B10E733
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Dec 2025 08:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764751962; x=1796287962;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=0CyFE+DS13jr8ejWwj7VhoMouDQFzNhv5OC7IP39RAI=;
 b=lddKR/+J7bFG0qvF9pGUfnPM/HrxGy82nMWeTq7JmD8YEkfukVjJ58/5
 rGnfhDg/9w+MNLVTrYvcilrjMAjgDtsNlN5IhitmCRfd4X8lja1t+ihzR
 0mpE2oox/QEJhv0mAJFv2G5XjrS/3bpWcG+NGIIFETd9qYK4W0Is0wO3k
 kTm3uJk7IejXflRGxiU5bLbrd4A4v+ujCien8SZAyqZmCLrSTpvkoZSiz
 B31xlwIKNxt6VXyfowetNMMEfifldreXfnWJHJO5kGVmPyG5Eq8CMqhqv
 KWEQpNvyFQ4asbafetztQAtTN45hp4czUGNT/x+uPmua7chvC7R96j6VP w==;
X-CSE-ConnectionGUID: YCfHhirOQ4en/wKF8igUZg==
X-CSE-MsgGUID: yeeGwjw7Re6AipKM+sLD1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="69332617"
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; d="scan'208,217";a="69332617"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 00:52:41 -0800
X-CSE-ConnectionGUID: MbrYhyO6T8+08RPfKVuxxw==
X-CSE-MsgGUID: zd8caWR7TdiFddvaxBR5cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; 
 d="scan'208,217";a="231957777"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 00:52:41 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Dec 2025 00:52:40 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 3 Dec 2025 00:52:40 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.62) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Dec 2025 00:52:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uRsj5xWhSTihwhH57G5kTYmCtM/BTfmnpUP05cpdyEg1qkC7oPlo+psRyHqjWmRW2lJuG8BY4TC4Xu/JO1bLvecEXYjiPvMyOt1xYL7bsCtHGyohERa6gBSVec5LCX85JEzIk6nyVIl5CT1y4r4lwr1zBld56kQ4XPWYadjEqWq9KrE23ckhUnVBl+oPnHcmiujYLcEgX1Vl9u4f/VzImtUXsecIC/pAPeiQeo0lXDLrDZWdkiw74CpJn7Qk51NXEK22iIJI6IQ67GUMgapY3JU5waQRmEU4F1dp54asCSXm0YBFHXhrBez8zEtdQvhuw1DR1vvIPeipRqvimXgGTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eRKLqQnBsmZuwPK1H99ie3ThA2wYlWymNwUHzGGjznw=;
 b=yDgGFYLMDPsTA0UNnHgJNszFNrwAph3QXUP2n1j0MjaofbXKMwwkVADPRZQd0iyEdQWMvDaovejNrRl4ukBMnb4gtRSlYCnIaKACJ8nEligvjW3uxe6deINU8S979E/2rH5UeOsyWUyG8DTq4IBKIZYd3Oxop6IbNg9PXpFd78h/8O91lSslQZRmUokaWGwaT2GvhWYLBYC8H0rFkX9RxxTsj8wcKrPp8CGzfBubPqKPysh4M1vc7zzg41bLXQxcjIDZBJ/cocXxFW1nmyBdwkZMwoVv/suTmPLLFexuPUYScOilzJwrzOoJp5s9YQ1H3k4hTh5tAMfMc0f4XP1ZqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by PH3PPF740777B0C.namprd11.prod.outlook.com (2603:10b6:518:1::d2f)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 08:52:35 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%2]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 08:52:35 +0000
Content-Type: multipart/alternative;
 boundary="------------srbvPtwB4j0wj3aeydXbqM12"
Message-ID: <39541b74-2fe5-47a7-bb97-76e3ff4799ba@intel.com>
Date: Wed, 3 Dec 2025 14:22:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] drm/xe: Mutual exclusivity between CCS-mode and PF
To: <intel-xe@lists.freedesktop.org>
References: <20251128171759.2775650-4-naresh.kumar.g@intel.com>
 <20251128171759.2775650-6-naresh.kumar.g@intel.com>
Content-Language: en-US
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
In-Reply-To: <20251128171759.2775650-6-naresh.kumar.g@intel.com>
X-ClientProxiedBy: MA5P287CA0256.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f1::19) To LV3PR11MB8695.namprd11.prod.outlook.com
 (2603:10b6:408:211::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8695:EE_|PH3PPF740777B0C:EE_
X-MS-Office365-Filtering-Correlation-Id: 63863731-dd36-4950-9d0f-08de32494de3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WUdRR2tGeFlJNkg3NDBqQ0xoSU50a1JzTFVJMnpLUmdMYU56bllyNVdiZlQv?=
 =?utf-8?B?cDJIWGhyZVpYSXJ1eDNyL09RN2p6ZjBVRkR3THpSQkxmWlVhUk5aUVpLZmVO?=
 =?utf-8?B?aVEyZ284YWx6OU5kdXlWdWJ6WnhMZzloTW9iczJrYWtBRDhBUFI1MzVEbzl0?=
 =?utf-8?B?czZQejFDQkl5ZFJkckxyQ1FFSTExYTRXdGpjdWRRYmcwaUhOb1BJNFdzaCsw?=
 =?utf-8?B?SkUzY295MXozdjV2UVJ2UGh0bDdEcDdPcDBJdWJmMFpNVEVMc0V4VTBoTjVT?=
 =?utf-8?B?U05GV040SzJqU2pOaExDWk9lR3Y3UGhkOG44bEdIc3ovam5rNk13YzBHS1Bi?=
 =?utf-8?B?Kzh4Q0FyTm42UWtWdnU0cEpKalc2Y003SXArU2pqWXZvN0FIVW5tbTQ5UFJU?=
 =?utf-8?B?ZU9OQ2p1SDZwT3duWDdEaXRFQk8vNXZpMy96WVhFK1RhRmJ1UVkyWERGbWoz?=
 =?utf-8?B?bFdEOG51VDVUWDZPVnJsTk9QMXhJYktyeHVGTTVHSWxCRkdLcm9NU2hkTUR2?=
 =?utf-8?B?ZmJmd1Jjd3FkaVpHK3JTS05DWThMNC9HMFJORUdic2dRODhqa1hBSWxjaHp6?=
 =?utf-8?B?MmVtVHVZcmFGUmxuM0VPMmdkU2VLNmNJVWtNaTdobEJQVW9QalNHc3hKTldJ?=
 =?utf-8?B?dTJkdUh1bldHRXB3M1JzVXVzY3hhSzNZY3pMUVFrOTZNT3V6cWI2TGtwcGFy?=
 =?utf-8?B?WExPRmUrUUhmTmdGcEZLMTc5Y3l6SW13c3JGbVU1eThLOTlmQ2tYaVhNZnkx?=
 =?utf-8?B?SjBGeUgvOUZBTnp1K1JhcCttT2t2NDFSU1A5WDVkRmdGN0YzaHZKd1hPTXZT?=
 =?utf-8?B?MnQ5NmJKUW1Ya1lRSnkvU2FkQ0ZKZFFXckdGYTFqRGMxdkk1aklJNmxNdzEw?=
 =?utf-8?B?bk4wVENoK05kZ3Q0WFhud2dUbzFHMk4zNVBoMUE1N1VETTdFWVhjN2tiSWs1?=
 =?utf-8?B?ZlcxSEJrV2tSYktJVmcwTjlIMy83OER1ZW5QalU0ZTBKSnBzVXp2aDZkRFNH?=
 =?utf-8?B?V2VQZWt4Q1VqYjE5WFJpcFFxby9NRmRQSjFMc2lvcyt6emEyTHhyR2xZUExR?=
 =?utf-8?B?VmVxS0p5eGRxNFRFMjhCKzJYWWowRll4TVJlQ1JEZGlCN0dPYkpCTDBGNkJh?=
 =?utf-8?B?UlB5V1hNZC80M1dzM1Y1WlJsZ2tUeVMvWWk5eStGL3F2NFFvVjJwa09RWVp6?=
 =?utf-8?B?dmFBKzRaK29TTTJCbVJJMmVTLzBQY2U0c08ybVB4WG10NVk3ek1nc3JIdURz?=
 =?utf-8?B?TW9tWUgwNW02NjBwNDNFUms5V1dZeHk4Sy9RU0FLcUZ0THpUZ2srS3pOZ1pO?=
 =?utf-8?B?WTBhYitocHZtTWlHRWtvSis3TnVwNkdnelhhczY2MFlSaDZkUVpjb1VhQTdq?=
 =?utf-8?B?OXgxTzhCRHZScHg1dm9UeHg3OVFISnJWeDdNelFpRVczTWxCOW1LaDhkYjlR?=
 =?utf-8?B?dUVPMVo2MG1ZS2RhOTd0dFF5ZjVQRlpiTGdSaGFFbEZISFdKOUFqdXFrWEYy?=
 =?utf-8?B?MnRrZHFydy9JL2lzUWdFUTVtamRVbjJzSGVFS3R4WU1EWmhUWEYzSW11L2dG?=
 =?utf-8?B?d21oWFFzRHlBQUYvYm5GbmhlTjBzTjY2RzJkNkhQKytTYlpjUkdWU2xLbXUr?=
 =?utf-8?B?cUlFQXNRbU9UdlBKYkUvVFd6dTJVdmV1eGJDZEVuYjZvanYyeWpweUVpbC9q?=
 =?utf-8?B?Q2Q1NlZybUk3b0xTQ3hEY0p1Z0pqbldnWVgwa2FjR2IvckZ6R1lEMmhmS25Q?=
 =?utf-8?B?TlV2ejV1WWpzdHNYSlBkbTNhZXZTVHA5Ykt0QnZpL0NueXJrME80bFZZMTlT?=
 =?utf-8?B?bUE5WGtkM1pxUmlHOWZob05NVk1lY3diaSs1NGZQdU1PQVBMaTdYVmF3ZHpL?=
 =?utf-8?B?S2ZTMnA3SVpSbnc4dVd4QVpyK2srajBIeDl6QlUyN2IrTjMzMHgvSDJjY0ts?=
 =?utf-8?Q?FbaPyIq1bz5IgNz8rt3kCWJNgKncY6sM?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bU9rWU96ZUVlRGRvVDNRelh3M2hHUzRSNGZzTDFMSmVUWHdtSTQ4NEY2TFV2?=
 =?utf-8?B?SFJOYUIwRTZnM0tTZE85NkJLL2JBWTI5b0FpVXp2K0Ftc2hTMHRpWk1YeTB2?=
 =?utf-8?B?M0ZtaEN1YyszZ2gzWEN0RnFZaGozZW1FTTNOMVE5UlkzMjQ4UzNWeHdWRmZ1?=
 =?utf-8?B?aVNCQ0FnS0hKSWhGQ3dyaTRpb090UklGaCs5d0VCSzdQMHZjV05lbEhUWE1F?=
 =?utf-8?B?THZPYlJGdTM1bXpIRWl1ejBQa3NjV3Rwb2ZjN1h4d2RPSlI5STRBS1dNNmRh?=
 =?utf-8?B?SllrMUozWG9mMlU2TWtrWURMNitCcFlPSWtaMG9SOVpTVnZCYVpPalhza1p0?=
 =?utf-8?B?Z3lmNk4zYWw5a0JYdzJBZXpRZitSRExIdHdsKy9wZ3RGejNIeDdTT1NlRjls?=
 =?utf-8?B?VlBaMUt6WkFuNURZaUFFeHFRVWRZZDRuWnJWTzVjZy9iZDFwaitVaFh0M29H?=
 =?utf-8?B?ZWxreG5Yb3JsYTA1RXNUZXFoSHY2UmJZV00xQzVCcHkzOUNmM1ZXRk5qWjlQ?=
 =?utf-8?B?K2svZUFFZnNpa3kveENLZXVkQlZIREVFeGtEUktvRm4vTnQ2dzl2a2FrTGw4?=
 =?utf-8?B?dGF3N29WdGIxdjRwYUhYcjY0QzNxM2lhVXdXNHZYR1l5QklWays3anZzRjZI?=
 =?utf-8?B?QmNNZi9rUXBCWVJqOUYvVlBrSnhnVWRMU1dlc1EyRk1sV1dlUUxlUHY5QjRG?=
 =?utf-8?B?VVMvSVI2dXcwOVRHMmFZYUlQUlFiYUpVTlpZcXJ3MjU5cVN0QzdnMVUySGx6?=
 =?utf-8?B?WUxVUndIRkhxMTNNcm5HamxPZG9MQk9qWnlKc09odWNBd2VoanVmMG9VZHlB?=
 =?utf-8?B?OGtKcjBJbWJSVjBrSkNxR1RXRlh1T081SWRRU1F1dDhMVVNmR1E4UTNkOFMv?=
 =?utf-8?B?UkJlVnc3bHVLUElzVVhtaFZHWHk0UXhJWHhwck1rM05XOUlDbGtCcTdKZjFY?=
 =?utf-8?B?eEdGVzRuUU1QY1FTVktFZGo5RXhXZVlhSkFjVUsycmFMTnZxdmJnNUJZSW13?=
 =?utf-8?B?VXFRWGZMV0luYjY1aE52SStjenRiV1J5Uzg0YlgzNTdKeHViaHpwS2NRSDFi?=
 =?utf-8?B?SWhRWnZ1T2xEc0RHR042Z1M5V05QZ2lSWmp6dWdNUnFwODk5S1pDSVAyeElE?=
 =?utf-8?B?T0d4NllRSWZQNHJyRTc4b0wvVFpLVk9DcTdnK2xGUm54ZmRpOVdwRmpuaUM3?=
 =?utf-8?B?YS9rZnNJTVVPMDM4KzE1TlVPcFBwcXNLTWZUVVluTUFiK2szbmZ3R1M2ZXY0?=
 =?utf-8?B?alRvQWNxL3BRUmdUY1dOcmlORXpzQTR6ZWRoTy93WnRDUDRLcnZ5NnJqWjY4?=
 =?utf-8?B?MUU3Q09EUEtIcnBWcHU4M2svdGcrQ2dQZ0ZmREh3a2pWUEtSdjhYQng4WHFC?=
 =?utf-8?B?eG5FTlJzTGlhSXdmNDM5VTdwZzJVdXNuN0t4ZlZ0SzM1WDc0V3c3NWNxM1J5?=
 =?utf-8?B?MXNVeGQ2dlFtSDRBSU90YVRLcHREK1dOYk1vemlyNlVWczJsUTVvZTU0aTAx?=
 =?utf-8?B?WURONnYzRlY0K29UeDRUeGJ5SUJYQ3htdWphWHZaMDEzN1A0c01VeEFZVFZx?=
 =?utf-8?B?WE4vMjZFc25LK1JEdGx2cGdVa2pVaVVVREJRRTRPRWpacnhqbG15cklFdnNo?=
 =?utf-8?B?RW5JdURMaGFWckE2RHpPalF0TG5hY1A5ajRDR3FiV1hGU3lBa3hrYWRyTUxo?=
 =?utf-8?B?MEJKUmpCc3VwRk9TK3ZNNVpxSytqU25CTDluVWcwbmNucHNKc2N5Rmt0U1dC?=
 =?utf-8?B?UC81bmtVZ3ZYaUZVcGZSTWxpSFB0bWIxcUN6OGhGTXAweUtDMU45c1ROcXVZ?=
 =?utf-8?B?VDVyUjVJVmhYaTRSdERmcTkyNEZ5b1hLTDMrN2ZCbjNaR3E1YkltQ0ZaMXd3?=
 =?utf-8?B?S0ZQa24rcXVmYjUrS1JwMXdFNll4UmxsMzVRVWpOcjA0MjhRVFc0KzRYVFhl?=
 =?utf-8?B?dU1wTnVweVN1dk5jT0JROUovTzVaZGFJTFJ1NHpudDdoeExMZ2tubVVoWlZa?=
 =?utf-8?B?cFMzVGg0c0NhVitKQ05oSGtNSmNzRjl4VmNyNUdxaU9DaXRlb2RIemg5NFFP?=
 =?utf-8?B?UUlxSUsvUnZnS1lHN1UyMG8rd0E5aDdrU0FZMWZxYTN5dGgreHErc1h5T2JT?=
 =?utf-8?B?MiswemcrOUxoUFA4VzRsZEs4azVIdUpwa3luN2JJbnFqdHdQU3VZeHFBQzhz?=
 =?utf-8?B?eVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 63863731-dd36-4950-9d0f-08de32494de3
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 08:52:35.5207 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HErh5b1GsEekuJCM8+xlR+J90ozFLC9We38F6Dmgzp3EKn+SAVG/rPZX6JvJnDvR+do+MOfG+5qoLjwkW8WMMD15QD2cGe5DfY40zzuWFYA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF740777B0C
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

--------------srbvPtwB4j0wj3aeydXbqM12
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 28-Nov-25 10:48 PM, Nareshkumar Gollakoti wrote:
> Due to SLA agreement between PF and VFs,the alternate CCS-mode
> cannot be changed when VFs are already enabled.
> Similarly, enabling VFs is not permitted when the alternate
> CCS-mode is active.
>
> Signed-off-by: Nareshkumar Gollakoti<naresh.kumar.g@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt_ccs_mode.c | 59 ++++++++++++++++++++++-------
>   drivers/gpu/drm/xe/xe_gt_ccs_mode.h | 12 ++++++
>   2 files changed, 57 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> index e146e00b0ca2..6652c468e1be 100644
> --- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> +++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> @@ -13,6 +13,7 @@
>   #include "xe_gt_sysfs.h"
>   #include "xe_mmio.h"
>   #include "xe_sriov.h"
> +#include "xe_sriov_pf.h"
>   
>   static void __xe_gt_apply_ccs_mode(struct xe_gt *gt, u32 num_engines)
>   {
> @@ -108,6 +109,36 @@ ccs_mode_show(struct device *kdev,
>   	return sysfs_emit(buf, "%u\n", gt->ccs_mode);
>   }
>   
> +static int gt_prepare_ccs_mode_enabling(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +
> +	if (!IS_SRIOV_PF(xe))
> +		return 0;

The ccs mode will not be enabled for native mode (non-virtualized mode) 
with this. It should be something like

if (IS_SRIOV_VF(xe))

         return 0;

Same comment for other places as well.

> +
> +	/*
> +	 * We can't change CCS-mode when VFs are already enabled
> +	 * and we must prevent enabling VFs when alternate
> +	 * CCS-mode is active
> +	 */
> +	if (xe_gt_ccs_mode_default(gt))
> +		return xe_sriov_pf_lockdown(xe);
> +
> +	return 0;
> +}
> +
> +static void gt_finish_ccs_mode_enabling(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +
> +	if (!IS_SRIOV_PF(xe))
> +		return;
> +
> +	/* Allow enabling VFs, if CCS-mode changed to default mode */
> +	if (xe_gt_ccs_mode_default(gt))
> +		xe_sriov_pf_end_lockdown(xe);
> +}
> +
>   static ssize_t
>   ccs_mode_store(struct device *kdev, struct device_attribute *attr,
>   	       const char *buff, size_t count)
> @@ -117,12 +148,6 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
>   	u32 num_engines, num_slices;
>   	int ret;
>   
> -	if (IS_SRIOV(xe)) {
> -		xe_gt_dbg(gt, "Can't change compute mode when running as %s\n",
> -			  xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
> -		return -EOPNOTSUPP;
> -	}
> -
>   	ret = kstrtou32(buff, 0, &num_engines);
>   	if (ret)
>   		return ret;
> @@ -139,21 +164,27 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
>   	}
>   
>   	/* CCS mode can only be updated when there are no drm clients */
> -	mutex_lock(&xe->drm.filelist_mutex);
> +	guard(mutex)(&xe->drm.filelist_mutex);
>   	if (!list_empty(&xe->drm.filelist)) {
> -		mutex_unlock(&xe->drm.filelist_mutex);
>   		xe_gt_dbg(gt, "Rejecting compute mode change as there are active drm clients\n");
>   		return -EBUSY;
>   	}
>   
> -	if (gt->ccs_mode != num_engines) {
> -		xe_gt_info(gt, "Setting compute mode to %d\n", num_engines);
> -		gt->ccs_mode = num_engines;
> -		xe_gt_record_user_engines(gt);
> -		xe_gt_reset(gt);
> +	if (gt->ccs_mode == num_engines)
> +		return count;
> +
> +	ret = gt_prepare_ccs_mode_enabling(gt);
> +	if (ret) {
> +		xe_gt_dbg(gt, "Rejecting compute mode change as VFs are enabled\n");
> +		return ret;
>   	}

The function gt_prepare_ccs_mode_enabling() never returning non-zero 
error if VFs are enabled.

>   
> -	mutex_unlock(&xe->drm.filelist_mutex);
> +	xe_gt_info(gt, "Setting compute mode to %d\n", num_engines);
> +	gt->ccs_mode = num_engines;
> +	xe_gt_record_user_engines(gt);
> +	xe_gt_reset(gt);
> +

Do we need to apply gt reset after changing CCS mode? If yes, add a 
comment with why do we need it.

-Satya.

> +	gt_finish_ccs_mode_enabling(gt);
>   
>   	return count;
>   }
> diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.h b/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
> index f8779852cf0d..53a595b0882c 100644
> --- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
> +++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
> @@ -20,5 +20,17 @@ static inline bool xe_gt_ccs_mode_enabled(const struct xe_gt *gt)
>   	return hweight32(CCS_MASK(gt)) > 1;
>   }
>   
> +/**
> + * xe_gt_ccs_mode_default() - Check if CCS mode is default (single CCS mode)
> + * @gt: GT structure
> + *
> + * Return: %true if actual CCS mode is single mode, or
> + *         %false otherwise (CCS in alternate/multi mode)
> + */
> +static inline bool xe_gt_ccs_mode_default(struct xe_gt *gt)
> +{
> +	return gt->ccs_mode == 1;
> +}
> +
>   #endif
>   
--------------srbvPtwB4j0wj3aeydXbqM12
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 28-Nov-25 10:48 PM, Nareshkumar
      Gollakoti wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20251128171759.2775650-6-naresh.kumar.g@intel.com">
      <pre wrap="" class="moz-quote-pre">Due to SLA agreement between PF and VFs,the alternate CCS-mode
cannot be changed when VFs are already enabled.
Similarly, enabling VFs is not permitted when the alternate
CCS-mode is active.

Signed-off-by: Nareshkumar Gollakoti <a class="moz-txt-link-rfc2396E" href="mailto:naresh.kumar.g@intel.com">&lt;naresh.kumar.g@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_gt_ccs_mode.c | 59 ++++++++++++++++++++++-------
 drivers/gpu/drm/xe/xe_gt_ccs_mode.h | 12 ++++++
 2 files changed, 57 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
index e146e00b0ca2..6652c468e1be 100644
--- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
+++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
@@ -13,6 +13,7 @@
 #include &quot;xe_gt_sysfs.h&quot;
 #include &quot;xe_mmio.h&quot;
 #include &quot;xe_sriov.h&quot;
+#include &quot;xe_sriov_pf.h&quot;
 
 static void __xe_gt_apply_ccs_mode(struct xe_gt *gt, u32 num_engines)
 {
@@ -108,6 +109,36 @@ ccs_mode_show(struct device *kdev,
 	return sysfs_emit(buf, &quot;%u\n&quot;, gt-&gt;ccs_mode);
 }
 
+static int gt_prepare_ccs_mode_enabling(struct xe_gt *gt)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+
+	if (!IS_SRIOV_PF(xe))
+		return 0;</pre>
    </blockquote>
    <p>The ccs mode will not be enabled for native mode (non-virtualized
      mode) with this. It should be something like</p>
    <p>if (IS_SRIOV_VF(xe))</p>
    <p>&nbsp; &nbsp; &nbsp; &nbsp; return 0;</p>
    <p>Same comment for other places as well.</p>
    <blockquote type="cite" cite="mid:20251128171759.2775650-6-naresh.kumar.g@intel.com">
      <pre wrap="" class="moz-quote-pre">
+
+	/*
+	 * We can't change CCS-mode when VFs are already enabled
+	 * and we must prevent enabling VFs when alternate
+	 * CCS-mode is active
+	 */
+	if (xe_gt_ccs_mode_default(gt))
+		return xe_sriov_pf_lockdown(xe);
+
+	return 0;
+}
+
+static void gt_finish_ccs_mode_enabling(struct xe_gt *gt)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+
+	if (!IS_SRIOV_PF(xe))
+		return;
+
+	/* Allow enabling VFs, if CCS-mode changed to default mode */
+	if (xe_gt_ccs_mode_default(gt))
+		xe_sriov_pf_end_lockdown(xe);
+}
+
 static ssize_t
 ccs_mode_store(struct device *kdev, struct device_attribute *attr,
 	       const char *buff, size_t count)
@@ -117,12 +148,6 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
 	u32 num_engines, num_slices;
 	int ret;
 
-	if (IS_SRIOV(xe)) {
-		xe_gt_dbg(gt, &quot;Can't change compute mode when running as %s\n&quot;,
-			  xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
-		return -EOPNOTSUPP;
-	}
-
 	ret = kstrtou32(buff, 0, &amp;num_engines);
 	if (ret)
 		return ret;
@@ -139,21 +164,27 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
 	}
 
 	/* CCS mode can only be updated when there are no drm clients */
-	mutex_lock(&amp;xe-&gt;drm.filelist_mutex);
+	guard(mutex)(&amp;xe-&gt;drm.filelist_mutex);
 	if (!list_empty(&amp;xe-&gt;drm.filelist)) {
-		mutex_unlock(&amp;xe-&gt;drm.filelist_mutex);
 		xe_gt_dbg(gt, &quot;Rejecting compute mode change as there are active drm clients\n&quot;);
 		return -EBUSY;
 	}
 
-	if (gt-&gt;ccs_mode != num_engines) {
-		xe_gt_info(gt, &quot;Setting compute mode to %d\n&quot;, num_engines);
-		gt-&gt;ccs_mode = num_engines;
-		xe_gt_record_user_engines(gt);
-		xe_gt_reset(gt);
+	if (gt-&gt;ccs_mode == num_engines)
+		return count;
+
+	ret = gt_prepare_ccs_mode_enabling(gt);
+	if (ret) {
+		xe_gt_dbg(gt, &quot;Rejecting compute mode change as VFs are enabled\n&quot;);
+		return ret;
 	}</pre>
    </blockquote>
    <p>The function&nbsp;<span style="white-space: pre-wrap">gt_prepare_ccs_mode_enabling() never returning non-zero error if VFs are enabled.</span></p>
    <blockquote type="cite" cite="mid:20251128171759.2775650-6-naresh.kumar.g@intel.com">
      <pre wrap="" class="moz-quote-pre">
 
-	mutex_unlock(&amp;xe-&gt;drm.filelist_mutex);
+	xe_gt_info(gt, &quot;Setting compute mode to %d\n&quot;, num_engines);
+	gt-&gt;ccs_mode = num_engines;
+	xe_gt_record_user_engines(gt);
+	xe_gt_reset(gt);
+</pre>
    </blockquote>
    <p>Do we need to apply gt reset after changing CCS mode? If yes, add
      a comment with why do we need it.</p>
    <p>-Satya.</p>
    <blockquote type="cite" cite="mid:20251128171759.2775650-6-naresh.kumar.g@intel.com">
      <pre wrap="" class="moz-quote-pre">
+	gt_finish_ccs_mode_enabling(gt);
 
 	return count;
 }
diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.h b/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
index f8779852cf0d..53a595b0882c 100644
--- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
+++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
@@ -20,5 +20,17 @@ static inline bool xe_gt_ccs_mode_enabled(const struct xe_gt *gt)
 	return hweight32(CCS_MASK(gt)) &gt; 1;
 }
 
+/**
+ * xe_gt_ccs_mode_default() - Check if CCS mode is default (single CCS mode)
+ * @gt: GT structure
+ *
+ * Return: %true if actual CCS mode is single mode, or
+ *         %false otherwise (CCS in alternate/multi mode)
+ */
+static inline bool xe_gt_ccs_mode_default(struct xe_gt *gt)
+{
+	return gt-&gt;ccs_mode == 1;
+}
+
 #endif
 
</pre>
    </blockquote>
  </body>
</html>

--------------srbvPtwB4j0wj3aeydXbqM12--
