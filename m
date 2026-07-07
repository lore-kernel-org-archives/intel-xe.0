Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44202C43458
	for <intel-xe@archiver.kernel.org>; Tue,  7 Jul 2026 19:08:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D626510EEC3;
	Tue,  7 Jul 2026 19:08:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P3+zQqDa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE87210EEC3
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Jul 2026 19:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783451304; x=1814987304;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zVXp6x4yRdMwGmAcY01tsR4Qi5OulkKHQZJ1910gLXo=;
 b=P3+zQqDawvinniOXIJ/piEyZPrbJAIALv6YRrYxtHakv+kculjkxmwDa
 +BWTlSkhUxdd8YEAAhouYA/Vyrp0IBZi5jP1Xs9h9LlBgDO97ifTeA22l
 8ZiUMfInzitZrbtUScb28n/9w2lEqr5GtalObVnMafL4v7dSDYlkQ2thr
 pUm58fv36TzKlR8v/jRNswx5DorWhyWNfT4vZQkY+Po0Qqe8fl6VDW975
 ZLZme3k7ran6jcY3DtDUxJxTCDvpR6R/wIvkK+6lxjFjMj+oUdlU32SyA
 dkLF+g7nr4JBbeXuO4kkK71VILIbPyzF8Xx1w+Mx3WnOPI1nN9gWOPH2r Q==;
X-CSE-ConnectionGUID: Tk+87Se3RmaeWh1AkTJGHg==
X-CSE-MsgGUID: X/CbOueCQPq5IzCAlL4S9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="95626889"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="95626889"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2026 12:08:23 -0700
X-CSE-ConnectionGUID: FdhmeyvBTHq1rEf4sKYsNw==
X-CSE-MsgGUID: 9Wkg/VAdSbGe0fn1JkaLyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="252991367"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2026 12:08:17 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 7 Jul 2026 12:08:16 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 7 Jul 2026 12:08:16 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.46)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 7 Jul 2026 12:08:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uXp7+FvzwyVs7ZSF5VuTdchLLTsqhuhILnnwEVFE+ibhAso7Wmku21z62WNQE0mISNWH5shF4KTZniiTD5Uv67iqabpXbQIas8ijTtR99XB+pYqgagZi4ymDw+cyMwJisC+YUxIDTmj87mdl5uB98aV/jnCRMhvw4ZqwY6con/4jutc4JOaB4JAKiMIXBThJDElAvv336Xc02yqBH016mJOh8PWR4e0G9wvVHXhuxb1yePTHyTIAPBT6czlyxZzpE9KsrLlkVL64KOOAjaTZG0dFCCugW/TiCNAbqSBJFOP447ZEYjFGMhjeKw9fHrLqfLcDiYF4lajuZavQbgffVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zVXp6x4yRdMwGmAcY01tsR4Qi5OulkKHQZJ1910gLXo=;
 b=o/73QN6lyrTgBgBfuRdN6F2XFSBTLkrH4xdiBZMcmZTUcL0pOBOYxyWWcQkY26SvrVZnWjazI8AbMmRrxuOB8R1QN0hkzFkIyy79bLi5WPrxghAxuqYTFb610RfCjlmahNwB09T766P6SAMqa16GMZGqo1DGtyFJsqHOePuvbq2KoKPJHtS9wGBHrlhXEtanLXeKlwKTkVW0vQWAVFc7UrTMB9DQO/pfBGV9yMrDeKqX4PjY9jQ/N1rgT10yT/oLFLc21y9dxc3DbDz6jvhNepf8vt2KRJKPePi/NLasaYs7Q1PusqRst1KDDWYEee+1VqErATAoKJ+yOKM5DmGkQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by BL3PR11MB6458.namprd11.prod.outlook.com (2603:10b6:208:3bd::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Tue, 7 Jul 2026
 19:08:11 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203%4]) with mapi id 15.21.0181.008; Tue, 7 Jul 2026
 19:08:11 +0000
Message-ID: <e87e1ed1-753f-4cfb-9437-5e03fa2d9b64@intel.com>
Date: Tue, 7 Jul 2026 12:08:08 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] drm/xe/guc: Define GuC firmware for NVL-S
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matt Roper <matthew.d.roper@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
References: <20260707175638.30935-8-julia.filipchuk@intel.com>
 <20260707175638.30935-12-julia.filipchuk@intel.com>
 <5d11c80c-ff71-424c-8fbe-e86db545cf7d@intel.com>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <5d11c80c-ff71-424c-8fbe-e86db545cf7d@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0061.namprd03.prod.outlook.com
 (2603:10b6:303:b6::6) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|BL3PR11MB6458:EE_
X-MS-Office365-Filtering-Correlation-Id: d093b8bf-44db-46d9-d43d-08dedc5b1678
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|22082099003|4143699003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 00RmpiJ3VvxJ+VBT3kJAV60a+0v7U7q1X6JYoPCLLv+DAIJ7c5xjlwfg/g+KnR6wRoeAxYiZ1innMmR9s1iwXpOWBq7NWDCtDPzDK9+9/YZiz64NEovGVwAJzdDKpTUytD9eKequMJ79Zj6IBkL/wp29KVNAIvzWaOYuxvM1UIaL8slDXwqPLtjvEr6EZKdaMuI3v/bp1B1O7PR+wRD5VRBezSjJoJomy1kA8si2qseXU6T6CSTtze3zkm/3mS+J81dXCkx/H8KuQH0fgayxtryoGMjzV6CA9qRBhOXLkYGqQjTBUAHn09W1ealk38bzcxzxg2UsWINPkOJpbrGveoIWPS5vu3u0/y1ume31XCXDLcMtFnbMVxy9S/MbpqN+ePrqvk9ZvIcMExMDA/PvUFjLU0sNR4ssgj9D1R+YGrPElPJmmT4mb46YwH2eic5I7pS1T8sRKr/oct8VLhD0wZYywrsSJvbrn1t753VYpKCsW5gvipmJQ2zsGkpQdXlS0btTUo7i/z+6+XlCdu8IVln3lXf/B1sD1hp4RebVCYJ9CeKX90AUVY+jH+c/wVD7mvI7jWt/GnnI2PJ/1kYPNXuYiThVkHAGpFej0QR2KfGBt5OkFVkrBpa0f2K5aejvHsNaHwkMO7CFyOl4Inad0Qrn/PVCxa7YGeL+HpZJaPw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(22082099003)(4143699003)(18002099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dURxMzFLa09ZWkZaZzF4Ym4vWFM4NWFZRlVYODMxQjVvOEprYTkvemF5dSt3?=
 =?utf-8?B?U25kZXlqZlVBV3I0b05CWitCTW5lWS84YjFnQTBJeHEyUFNjYjhKd1NpWW5u?=
 =?utf-8?B?ams5WWFoN3Fyb2QvYjl2Nmp2RlJTbkdjdHhZcnNSN21wYStjMkdrNjd4ZW8v?=
 =?utf-8?B?bTlTQUw4cVVqUkt0bDNnRjJ1ckY3dU9EbUJFeE9DOUd1QlREQXdYa05nS1Rl?=
 =?utf-8?B?K2NucVFvZTNOUkFTTG1yd3I0VzlCR0haRlNwcWovWlZGYnJXUmQxSWg5cVpR?=
 =?utf-8?B?MEVFa3ZiZ1JRNmVlTHl1c0RrUU04VnppdWZHWElJRGI0K29GdXlvL1V6Skxr?=
 =?utf-8?B?YVB3WmxOWnFVdmpralpQZFhXWkRUMmZ6bXJBS05tSmI0YStvSXNPSFVOL2FE?=
 =?utf-8?B?USt3RUUxMTVHZ0pVRGFlTzJ1QmFhTlhmU2h1VWNGWU9FWVdPVjFDekZTNXpm?=
 =?utf-8?B?U3JyMHFLdVNRVllWbkVHamx5c2c3SlBSalp1N0hEeE8xTldSTlFxTUR5TzRN?=
 =?utf-8?B?VVhUcEV3SllBdEh3SnpsNkl1eGxURU5XSzZqUVdwNUhhR0Y3U2RhSE9Hb1Zu?=
 =?utf-8?B?eGc2MERzM2ZBcDJNQ3lNMFFIamxLNVBiN25iL05VdG82YXhWaDZsOTg0M1ky?=
 =?utf-8?B?NHk4OUg2VVAyVDJ3ekhlRFVqRFZJb3AvclJWMU0yN2t1S0hKQTc3UUJEVmlV?=
 =?utf-8?B?aUJPMmRMZXdkTEZoYm91bWphZnFhNWt5akd1S0t5clRvWHpTaHFuUXNyWjQ2?=
 =?utf-8?B?dlNyQlpSWGtRMW1kc0F4U2FkKzZwS3dwbTJGK0JwTlNMdHE1RVRyUlorUGpL?=
 =?utf-8?B?WTlNbXJVMmtJb05Rai83R3ZNVkZZcS80WGJSMmpYR2JMMUlYWUZkcS8vVU55?=
 =?utf-8?B?RmV2MGdpUEV2VWtxN2I1cURCVHBJeTdFRGlVV2hHV2REbHBYZC9iSDIzRGJi?=
 =?utf-8?B?Rmp2VjBaZVpIOHEydjJtcWZGbXQ3QTlMRWM0dUVqWXM1NEVYd2ZDM1lhQ21C?=
 =?utf-8?B?ZHphRFFESENWNXY3VjRGZjdmTnkrZW0zVHJZcDdoUmhmb2NkQThiK3lsRDdx?=
 =?utf-8?B?cWk5NWdEcUZ6VGZkL3REd3ZZRlZHYTIzeWZkY09mOHByY1dYYWMvMWdFWXZp?=
 =?utf-8?B?R2hVN25MbUpZZjdKdk14MSt1QXdkTEJweHJWVlIvL0lhWkd1MzJOMzVEckFY?=
 =?utf-8?B?RlhzU0drdnpqcVZmZkt6aHRBVEQzUE5INXF0TU53cG5kS1drSTJEOER1dGg0?=
 =?utf-8?B?Q204N0gwRFJSQTF0NDh3NTZrNkdhc1BSSWkyV3p2d3FTSWtCWlNpOWF5eEU2?=
 =?utf-8?B?OC9rK0NEMXdWRU5rQ0x1VklGeTdYQ1diYVJobklhWkVBcSt4d1JUK0FzVHRF?=
 =?utf-8?B?b0YrSWliSlNGTHN1S1BEYmFDWFpxQ2NPYzZxODI0RWszb0dzYmRTV2RIWG9r?=
 =?utf-8?B?QmRDQnFJUm8xYWlhcFVOSll2RERSOFlIWWJRUlhqN0tTdkppMUxFbVZxZXhl?=
 =?utf-8?B?UklaT2s2MkRGWjhYZU1LYTZDVGRlYTMzSkVFajBqQVBqd3l5dmI3YTBzRlVw?=
 =?utf-8?B?ajJTNFBsWmYwS0Z5dVUvb0JkSHVqd3Q3WFRheFB3R0JLRktDdXVZUU5jb0F3?=
 =?utf-8?B?Ky96L1YrNlFwRGJuS3kxZERlMk9yalRlRWRtMnYvY0hjYWdXUHgvamVqYU9o?=
 =?utf-8?B?dzc0NWlQQ0IxVVZhVEMzb0RTZUtUNXZLUEIvaWUyeDhFeTJObm51OEhyL1hx?=
 =?utf-8?B?NWUvQTBRa24ySFpiWThGSUdnK1RLV3MxeUtOT0hnRGtLMUhrWS82QWY1dkhX?=
 =?utf-8?B?TDlnYTdTRW1zZThBendJYVR4Sy9tWEc1MzFFNWVxOHNTd2wwK1lwaXR2VStj?=
 =?utf-8?B?ZzMyOE9JTHVYM3Y4SHBJY3d3WjRHdDVTZUR3OUFSL2VLang3RzZKYWJGeVg2?=
 =?utf-8?B?a3dtWkUvZWFDWmJ1TVFSL0ltSmpJdWIyZ2NZak15T2YrVkpucThWUUpIWllz?=
 =?utf-8?B?UmVhd3hsVEt1MWZud01rT1FYZXdkcDRjL3NsSFdpOVR2WVRCRWxIdHErL2t2?=
 =?utf-8?B?TXFPZHh3OTU5NHZiL2hCbkJvMlZjR2twL29EK25oaFl3dFZMa1RrZ3JybEhi?=
 =?utf-8?B?d1hlSTlKWnkxSEIrM3ZLemRRQ2tjbThOcENSelpOUEZOS3B3b3J0cW8xMmpV?=
 =?utf-8?B?MW1UMUdIL2ZIcHVMME91NUJpTFBleXJ3RmprK0UzWHlRcmxJNGpCdEQ0OWtw?=
 =?utf-8?B?T0FGeXFKYmltTXVPTmVDeDN0eFFzaDQvNGVrNVNwUXZ1M1dQa2doN0VuUnQ0?=
 =?utf-8?B?NmJ0MDBsd1IrRkZrSU1Cbkx0cmtiTmxRQzl6eXgxb1B0ZmFVdGJOUWxyWWZX?=
 =?utf-8?Q?aiCDN4+zCPRdjueA=3D?=
X-Exchange-RoutingPolicyChecked: nGiXUsx35amkpkpi5ZexCZMm4Y8mTOBL7NQ79ldT/Shm1B62inANS+Xu/po6+qEEnmrQEhyHfQH8o5ZY4lkKyPV3CsQ9FMM/GCb3oagO7WJ/PxSdU+Y7zUtQ3vzxMUjwWfzIlt6IlHNNKzxJXVLX00MVjaz6XC/y68m0Re/l1CRIcjLpVEhvtehU+0AW1e3Nwj9kOmAkhmJ3GkQrdA7J2iSq18pOpjn5QioGOHdlPLcAYWb4+F+4PbdzdhV6yfVPjlNJLKZ3ytTlukVna23jaTJg+Gj3bJY2i5PI5VGb7cvwwDd8uebFMU7BC693prXSTALdrjV5+HOPLJ1zvQmASg==
X-MS-Exchange-CrossTenant-Network-Message-Id: d093b8bf-44db-46d9-d43d-08dedc5b1678
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 19:08:11.2428 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tb2FVyzS9URbeWmtHfu0KuZ3zSzunfaeYJeJw56NB4CkTEFAX8Lm2g4fkDVc0fS8UypYixvP+0En1dSepycHnxZ3j54uQrrW7tDZRzgOgw8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6458
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

Adjusted in next revision. Thank you.


