Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B51D5C79F9E
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 12:24:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7104210E434;
	Mon,  7 Sep 2026 12:24:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BN4iGWt2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A326D10E434
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Sep 2026 12:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788783852; x=1820319852;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=0no0Lq41Gvj0ObKH4y5E5zv6IjIHPJ+r2yjyTOyXRFg=;
 b=BN4iGWt27vF8zaj0v3zJ70YS592qxd2ef7MRN0ADNa96sUy6GhMl8gVG
 LFltZ20ArFwDKpJvq1yf4RMv9Fv8GMp+umA6D4SrleE1hfrqb/ABOlwuB
 UolARa8u6W14Ubq5WXJ7aq61T4CwlnWeqnIX06pGB5gFBoezE0sw1PJu6
 BeEWw5psxOFQEK3AdWMJgldEYB/TqHHs+sZgOvnEbWzWOlKioxRHkav/S
 YJS13Ly1vZB4uCbZch6LooHON5PkB6+drAk6ROx/p/mJfPLGmfAeIPjq8
 2mk5QXQV1oVjyu+Cw/kUV5M3/fOQf3UAtizUEFKoCtsbqa9yGFrjmYhuU g==;
X-CSE-ConnectionGUID: wl4WhSXhQK2enhb24gvRMg==
X-CSE-MsgGUID: Tj/9iNGmQvqbgG0JedTFwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="89218284"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="89218284"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 05:24:07 -0700
X-CSE-ConnectionGUID: 2HfGnZNGSpSzKGfHlJxeJw==
X-CSE-MsgGUID: lfIqnvDtQqedx5u7+J8Jvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="308932818"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 05:24:07 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 05:24:06 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 7 Sep 2026 05:24:06 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.34) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 05:24:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cFRhWNshyqvXCKLyLVIfXORh+/IzLDdulXUU8hGX6V0slbh4qjfba1sZJEcAGACqA1nqZOXy/3fIAjNwCbzSteFvXv8rINnf5RgPzyGhUDKmhquwgccuqBqXC08imXrTTLmpu2gFeKfpw6uYbkUKcjwCZoGWKlTUzz2l4OBtyVXMX0cCX1fP93skm/5zTSD3wTJPPO9bC88ruJqONqiHK0ZkEwZK/qK22Nne4hrZvgrpRX47F9iQ2ahQAjNazY07oMj4IGCbLcHZxPzMd+fymLu32tN/qf0OBWbO26NvdihwKWoKCRuTR+mp7erXpWqfMqInZqCpnxzf2UF/e212tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4I2OCGwp2z9mjr1MALXDL8kPQo+8d47vaNv8NdQdOz0=;
 b=gT9VpYqFQ7CUc9t8SZ6rGsX7XeY7CAgZJsriCPPNhFUvJ9iHnhW5f+rGY1SW0VaUZAf+KOvrAHDWvLpb2GDWocg81OH7+XdktY2wDAdoykQs2yvj996PpaQKlGF20ynI+9aIWRvlcSVj6kYvO03ENDEd6LSBDF2egSynmhWXYgz7cwhiUbD+Ud0sm+1ntUNjyCUquA3hFVpJy3ZHHwU6B5OS7oN2sjjTT9R3ZBAxhklQ19WLrKsvFXpllGtnDBxw+WkbNcmXzZP0b8dVsZz0i2pGo2u/t1MwpsbBcpfnBtcHJz2APNNTxKcS7W1J1qahpAaMbgGlDErCvt2gs+K8wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7551.namprd11.prod.outlook.com (2603:10b6:510:27c::12)
 by SA0PR11MB4621.namprd11.prod.outlook.com (2603:10b6:806:72::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 12:24:03 +0000
Received: from PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0]) by PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0%4]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 12:24:03 +0000
Message-ID: <781e3915-f275-46c1-8784-04f5722b8cf4@intel.com>
Date: Mon, 7 Sep 2026 14:23:57 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: FW: [RFC PATCH 2/5] drm/xe/xe_ras: Handle page offline requests
 for device memory ecc errors
To: "Tauro, Riana" <riana.tauro@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
References: <20260825063615.3697317-7-riana.tauro@intel.com>
 <20260825063615.3697317-9-riana.tauro@intel.com>
 <0ef3ec26-7426-42e1-95a1-532dd5cffed4@intel.com>
 <SJ2PR11MB7619EA09682C7DE8C0A603128CB22@SJ2PR11MB7619.namprd11.prod.outlook.com>
 <d4906b36-bdf1-47df-9876-7fe86ddc4fc3@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <d4906b36-bdf1-47df-9876-7fe86ddc4fc3@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P192CA0040.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:658::16) To PH7PR11MB7551.namprd11.prod.outlook.com
 (2603:10b6:510:27c::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7551:EE_|SA0PR11MB4621:EE_
X-MS-Office365-Filtering-Correlation-Id: 7891b2cc-8a45-4d32-2c7c-08df0cdae717
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|13003099007|6133799003|10067099003|4143699003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: cgyYZQnTb+YUFsymB7e//nd8nI4kW/FG5PKxBe3UnAfn+VdfvNnBwoNMFjRGP97Jq9xnZEPHXBtd3MWolII8NJLwGjn2jvaTOpMI4Uy/YTVI4zFFmENY+fujl6PKH8Hc+NDln/x/MSgYcUDDJ4g5VqeW0VjzGVT7CRI0Bofl3Pzhu5g4t1096AjFQq6cQe3TDGl3wyonEtog2BGhDu7GirBJW1Wr0wyhL7wxmISKEnntQBkdt+DJbVdHSfmfrgbnaNkvfVc8mjEKBliJ9y2hDnDXtdkE0Rbd/PwO/vVY054sdeZj3kq7pvtFMdFyczOQHuMeH6MnYb/fUHW+0Y6/N+E9vcSVN3S7hllRr/dzNEBLfpbuQe0EBifHFx9l6WTHx4youy99rEfnZ/2feyQMNOgZi69ADAAZQU3K6o28gIxwyOCWjH0ZkFEAYdD2h+pUrswV9iuZk9a2mNmK66qmYDnFh+ZzHh83tZI9KcjqG0krsGC/hCUQypz410laHopK9bx7G4HP2bP4JufeWKP9toA23Gn1O1j3ABjzIT8UFWl9bAi2OrQIYK78Pb4TEAHPARj65S9HGm+LXqfu2ep8FfqEuBOOfoxKqtWe3/vF7FGUrv0FkCc8YURaLu7UrCz1PRv2Yv/qaXjQo9pJFv4lkMlvH4AJhd45iKGko7MOHIk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7551.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(13003099007)(6133799003)(10067099003)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WHhKQ01yWTM4S0o4ZEJkNkJnWnlsSlZ5U2dFV282T3RCSUtNZDRWNUoyRGlV?=
 =?utf-8?B?NThoSEU3MTRiNDVBaUxKSWp4cXZWb1JTZjQ0bVJkVU1zY040dldFMjJVRVdI?=
 =?utf-8?B?QVY3ak96YU9wem1NdGpVUWZhQnhyUHNlNTY2bFFGdmtZeVRiUTQxeGFDSDlx?=
 =?utf-8?B?QXNBQmljaGNsVE15ek1WZU0xeDJoSHR4Sk5DRXpTbDdTMU5YZUFxRldXd0hW?=
 =?utf-8?B?UktkMkw0NjJrTWU0Q1l2clk0cDQ3b0Jhck1HUUdqWGxVUHpPRmdSa2Excmkv?=
 =?utf-8?B?WHFYT0JqMGw4ZEZQVnBqWitOV2lJME41WmszMTV0N0FQbFBBUlh4ZjJzVlZE?=
 =?utf-8?B?VDJzU3FJckQ1MnJZVklpMXVRQk5EWFlRajFDUWFpcktaL3FnemhIREMySlZB?=
 =?utf-8?B?YklLWmVYU0pENWZYSVhEa2xadVZ1a2ZoNzFHdHdlM3QrNFNaVjlqZ2VyajBJ?=
 =?utf-8?B?M3h2RFU2YllQTm0zcFNVaGZQT0gvUWl5RFlOdW1aYmZjQlJVWWU1K2w1TmdE?=
 =?utf-8?B?Tml3bWJvUDM1SzVoZDJ6Nk9zUmVHUG41elQzcFY1MVlWK0lPakEvdFZSTG1B?=
 =?utf-8?B?QWlxcnlCV2V3TmF0eURDcENHeXVqTEduSmFVVTNiZi9ZS3dQSVdaSUUraVZM?=
 =?utf-8?B?YUlrK05YalhWdEJUNXBHMTF5NDc5ZmgwSDIwL2tzNGJ2ZC9adThrb0VyNE92?=
 =?utf-8?B?UWdieXY4ZGt2bFBsWjl6VnZ4eHEyYVFZL3hGT2p1RkZaRHM3VjBIUG9lemlw?=
 =?utf-8?B?amN1VGs1SFpIYStEYlBxOWpMYmRSNGZ4N0NoSVk5WkYzRzJYV3Yza1AvTFV6?=
 =?utf-8?B?R3U2a1N0SnEyUGtpL0hPQzVtQUEwS0JCWDdidXpQMXdGb1gzZVJTWHZZbWVh?=
 =?utf-8?B?UW9YakpVTkJoNDAyQ1BReWsvZFkyRkwvc09EVGN1bEVRMVdtK1hQbFdxdndm?=
 =?utf-8?B?SDVJRE9BckpxS1lRaGRPVlpGcnFuMkhQTDdycktlb2hqdnJKYVFLOGs1NzZy?=
 =?utf-8?B?WkJkellXRHpFLzg2K3JiVHpxNFNUSExmcHEyRzlDcmVuYUlsdEJ5bkVtbGla?=
 =?utf-8?B?LzA2VmpHd2RlbGpkRVVCd3N2MDlMY2hrN2l6TkxEL2IyWEZjelBKRmRxOFpF?=
 =?utf-8?B?dWRqdGJGQjFHNVRvOW1JVDFmV0doTUY2aWhFdURUeGhWVEYvdUJ6ajduM0kz?=
 =?utf-8?B?ZmJhMDU2K24vUGo3K2tITWpBQXlXZzFpbHhGQTNzN1dlTjVWRU5BdFFsV21L?=
 =?utf-8?B?clJXQk85K1J3MFlyZjZ0ZFg0Z3VhK0ZEdUx6K2hFQXA0QlZLaWt0WllBT1R5?=
 =?utf-8?B?SmRkelZ2NzdoUStodlpaWG5wYU5iUmNwaDN3WHhwREx4NVBKOVBQY2xmcXh5?=
 =?utf-8?B?R0FYcjZhZnZBQWZJS3I2YzFpZG50d2hONjN5M0ExcmNDeE5FY3RzZVlUbCsy?=
 =?utf-8?B?bHlKTHZyK1ZyeVFLZjNTRTBsdUtxQVl0UGhnUzZBUzgvVWNqbEpPRW9acG9y?=
 =?utf-8?B?cnZSMWtvaUxlR3NlZHpGTVRvYmhNajAySnhrVUllS3RyTDZXRHFGVjF0MkRq?=
 =?utf-8?B?emJieHM3aUlpcVh0UzNkV21zMTRvOFF6MWdiZ3JRVklrY0lucUNQcVlnQ0NN?=
 =?utf-8?B?VHI5U3BYeGtUd1dIaTZDTGpQMWppNitOZGwxeHNkZEdRQTh2MWVJYkZDS3Qv?=
 =?utf-8?B?YUpyMVhXUWo5TytCYmFnR0QweUNYblFTNVNTREJyaTQwWHNJNjQrRlcxUzJ6?=
 =?utf-8?B?T1I4dXUyVDBvcXZxRXNGYlhReGo3WXhmRG5TOE4rb1hxQndKSUI3ZjNYMlZ4?=
 =?utf-8?B?Mzc0R1FDWjRZcnh2Sm13RkdacnlmNEE1a3pEV21ETTlhcVBia04vN3pYTStn?=
 =?utf-8?B?bVltVVpWSkZWb3NvWkFyTWQ4UHk2RnRRNk1scWYwRzc4emtDcDNLUVRtclF4?=
 =?utf-8?B?ZVppS3poS3hlOGJHRjZGMmRFakkxVlUvQWRoZ24wQUVKUVUrOFdaMkM4VThD?=
 =?utf-8?B?eENLcC90OWk4VEVzNXE5cCtKSVJnajREV0pZU1FUdUcwTkxtbzhBbXZSQ1Zy?=
 =?utf-8?B?VkVJaWsxbjVjdFpQcVIyWGgwSlhzUTNyYitPWTJ2eGtOWllYVGd4aWtFS1dn?=
 =?utf-8?B?cmFLcGo4QnpmUHdwU1dxUDI2RUMwRE5ISnRFZzJ6aFp3eXd1UnpUK0lybjN2?=
 =?utf-8?B?MjFUODR5QWt1dWNpS0w2K3d2MkZ3NEdVK2FGaitXZTNJMjVsbTdjRnlkcEhl?=
 =?utf-8?B?MVFmSjhjTjlMWWNxM2hRa0hsWllSU0VEOFI0T2tVK2VHcTR4TU01cXp6ekRi?=
 =?utf-8?B?TmJoR3FqbDBITE9scVIrcjRvSHdpR0J0THZyR2owdjZqdFYrbG5pOTlFei9M?=
 =?utf-8?Q?ucKJBipzrZQNjvzA=3D?=
X-Exchange-RoutingPolicyChecked: oOUj1OnLTjj/zporryRJqqmQfF1hADuvFzyILLLOcA6GJIBf+Gj2ePT08Et1UkDY7nxJwE0jpeMTmHChidg62XGEVutVsEKDmToqVjmGwpl1FeaFgrOZDEkYN3ukXuzMYQKyXNYG2XZ4TycP2zkYL7/2d5WujwC+5rEYNWK/31oA2FZsQEgLrYOTGKtRK+Mxr6DUesGTWxYBNV0VEpkKmd04QaIHkLBzr2+0qtOeWNpW6Tw+ZM9PXenM/btXqimt+irWyLClQdwhsmshvDidYU23uYhI5yNUHN8baJakE1REJ4O+vwHwe8awtyka5g4J0VapVhDG+dIgdQ5CXLRT8g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7891b2cc-8a45-4d32-2c7c-08df0cdae717
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7551.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 12:24:03.1148 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WXEcStoczk/UwnhUY8tvY3bHJ7HzTnRFJOw1UI7GdMncM+aiGU/xOgN4DmPGZ++hPEORAozemvOyOEzimT3k9sQslqOdTcC7jBiD9kr/InA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4621
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



On 9/7/2026 8:31 AM, Tauro, Riana wrote:
>>
>> On 8/25/2026 8:36 AM, Riana Tauro wrote:
>>> This will be integrated with the related address-fault handling flow
>>> once this patch is merged.
>>> https://lore.kernel.org/intel-xe/20260818104055.3833974-14-tejas.upadhyay@intel.com/
>>> Sending for initial comments.
>>>
>>> Add basic support for sending page offline/decline requests to system
>>> controller and use it for device memory ECC error handling.
>>> Pages that belong to critical BOs cannot be handled by offlining and
>>> require a SBR (Secondary Bus Reset).
>>> Pages that are configured for log-only handling are not marked as bad by
>>> firmware.
>>>
>>> For all other valid page addresses, the first occurrence of error
>>> indicates a poison error and the page is offlined only by software.
>>> Firmware avoids permanently marking the page as bad. The second occurrence
>>> of an error indicates a Double-bit ECC error and the firmware
>>> permanently marks the page as bad.
>>>
>>> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
>>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_ras.c                   | 121 +++++++++++++++++-
>>>   drivers/gpu/drm/xe/xe_ras_types.h             |  35 +++++
>>>   drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   2 +
>>>   3 files changed, 153 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
>>> index d25d25f77531..c643c7137a42 100644
>>> --- a/drivers/gpu/drm/xe/xe_ras.c
>>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>>> @@ -3,6 +3,7 @@
>>>    * Copyright © 2026 Intel Corporation
>>>    */
>>>   +#include "xe_bo.h"
>>>   #include "xe_debugfs.h"
>>>   #include "xe_device.h"
>>>   #include "xe_drm_ras.h"
>>> @@ -200,6 +201,115 @@ static inline const char *comp_to_str(u8 component)
>>>       return xe_ras_components[component];
>>>   }
>>>   +static int send_page_offline_cmd(struct xe_device *xe, u64 page_address,
>>> +                 enum xe_ras_page_action action)
>>> +{
>>> +    struct xe_sysctrl_mailbox_command command = {0};
>>> +    struct xe_ras_page_offline_request request = {0};
>>> +    struct xe_ras_page_offline_response response = {0};
>>> +    size_t rlen;
>>> +    int ret;
>>> +
>>> +    if (!xe->info.has_sysctrl)
>>> +        return 0;
>>> +
>>> +    if (action >= XE_RAS_PAGE_ACTION_MAX) {
>>> +        xe_log_err(xe, DEVICE_MEMORY, -EINVAL, "Invalid page offline action %d\n", action);
>>> +        return -EINVAL;
>> this looks like our programming mistake, shouldn't we use xe_assert() instead?
> 
> Sure will change it to assert instead of sigid
> 
>>
>>> +    }
>>> +
>>> +    request.page_address = page_address;
>>> +    request.action = action;
>>> +
>>> +    xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_PAGE_OFFLINE,
>>> +                  &request, sizeof(request), &response, sizeof(response));
>>> +
>>> +    ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
>>> +    if (ret) {
>>> +        xe_log_err_fatal(xe, SYSCTRL, ret, "failed to send page offline command\n");
>> what about moving xe_log to the xe_sysctrl_send_command() and use:
>>
>>     "Failed to send command %u.%u (%s %s)\n"
>>         group_id, cmd_id,
>>         group_id_str(group_id), cmd_id_str(cmd_id)
> 
> This can be taken as a separate patch if required.  This is currently consistent with rest of the file
> 
>>> +        return ret;
>>> +    }
>>> +
>>> +    if (rlen != sizeof(response)) {
>>> +        xe_log_err(xe, SYSCTRL, -EINVAL,
>> -EPROTO ?
> 
> This is consistent with rest of the file.

but there are already other series in flight where we are trying
to fix returned errors, so why not doing that here right from the
beginning?

> 
>>
>>> +               "unexpected page offline response length %zu (expected %zu)\n",
>>> +               rlen, sizeof(response));
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    ret = ras_status_to_errno(response.status);
>>> +    if (ret) {
>>> +        xe_log_err(xe, SYSCTRL, ret, "page offline command failed with status %u\n",
>>> +               response.status);
>>> +        return ret;
>>> +    }
>>> +
>>> +    return ret;
>>> +}
>>> +
>>> +static int handle_page_offline(struct xe_device *xe, u64 page_address, bool send_cmd)
>>> +{
>>> +    enum xe_ras_page_action action;
>>> +    int ret = 0;
>>> +
>>> +    if (!IS_ALIGNED(page_address, XE_PAGE_SIZE)) {
>> hmm, can FW really send us such a broken address?
> 
> We cannot guarantee. Its better to have a check
> 
>>
>>> +        xe_log_err(xe, SYSCTRL, -EINVAL, "Unaligned physical page address: 0x%llx\n",
>>> +               page_address);
>> shouldn't we try to log/print other details from the notification?
> 
> like?

"Page offline notification for unaligned address: %#x\n"

> 
>>
>>> +        return -EINVAL;

btw, shouldn't we try to fix that address and move on with
attempt to offline something close to the reported bad page?

or if we think it is very unusual for FW to report that bad
address, maybe we should escalate to reset ?

just logging info about bad address seems not enough IMO

>>> +    }
>>> +
>>> +    /*
>>> +     * TODO: Call function to handle address fault
>>> +     * ret = xe_ttm_vram_handle_addr_fault(xe, page_address);
>>> +     */
>>> +
>>> +    /*
>>> +     * Handle return code from address fault handling function:
>>> +     *  0: Page soft offlined, decline to firmware
>>> +     * -EIO: Address belongs to a critical BO/stolen area that cannot be offlined
>> maybe:
>>
>> #define    EADDRINUSE    98    /* Address already in use */
>>
>>> +     * -EOPNOTSUPP: Address is valid and can be offlined but user policy is not to offline
>> #define    EPERM         1    /* Operation not permitted */
>>
>>> +     * -EXIST: Address is soft offlined but yet to be offlined by firmware for second occurrence
>> #define    EUCLEAN        117    /* Structure needs cleaning */
> 
> These return codes are from https://lore.kernel.org/intel-xe/20260818104055.3833974-14-tejas.upadhyay@intel.com/.
> Any change will have to be made there as this is dependent on the above patch.

hmm, as there are strict expectations for each scenario, maybe handle_fault()
should return one of the custom predefined enum instead of generic int/errno?

see enum irqreturn as example

> 
>>
>>> +     */
>>> +
>>> +    switch (ret) {
>>> +    case 0:
>>> +        action = XE_RAS_PAGE_ACTION_DECLINE;
>>> +        xe_log_err(xe, DEVICE_MEMORY, 0,
>>> +               "Poison detected at physical address 0x%llx, page software offlined\n",
>>> +               page_address);
>>> +        break;
>>> +    /* User policy set to decline page offlining */
>>> +    case -EOPNOTSUPP:
>>> +        action = XE_RAS_PAGE_ACTION_DECLINE;
>>> +        break;
>>> +    case -EIO:
>>> +        xe_log_err(xe, DEVICE_MEMORY, -EIO,
>>> +               "Physical page address belongs to critical BO: 0x%llx\n", page_address);
>>> +        return ret;
>>> +    case -EEXIST:
>>> +        action = XE_RAS_PAGE_ACTION_OFFLINE;
>>> +        xe_log_err(xe, DEVICE_MEMORY, -EEXIST,
>>> +               "Double-bit ECC error detected at physical address 0x%llx, page already software offlined\n",
>>> +               page_address);
>>> +        break;
>>> +    default:
>>> +        xe_log_err_fatal(xe, DEVICE_MEMORY, ret, "Failed to handle address fault 0x%llx\n",
>>> +                 page_address);
>>> +        return 0;
>>> +    }
>>> +
>>> +    if (send_cmd) {
>>> +        ret = send_page_offline_cmd(xe, page_address, action);
>>> +        if (ret)
>>> +            xe_log_err_fatal(xe, SYSCTRL, ret,
>>> +                     "Failed to offline page for physical address 0x%llx\n",
>>> +                     page_address);
>> there are 3x xe_log() in send_page_offline_cmd()
>> do we need yet another one here?
> 
> Sure will remove additional log.
> 
> Thanks
> Riana
> 
> 
>>
>>> +        return ret;
>>> +    }
>>> +
>>> +    return 0;
>>> +}
>>> +
>>>   static bool ras_counter_is_valid(struct xe_device *xe, struct xe_ras_error_class *counter)
>>>   {
>>>       u8 severity = counter->common.severity;
>>> @@ -367,11 +477,12 @@ static u8 handle_soc_internal_errors(struct xe_device *xe, struct xe_ras_error_a
>>>   static u8 handle_device_memory_errors(struct xe_device *xe, struct xe_ras_error_array *arr)
>>>   {
>>>       struct xe_ras_memory_error *info = (void *)arr->details;
>>> +    int ret;
>>>         /*
>>>        * For memory errors, the recovery action depends on the error category
>>>        *
>>> -     * TODO: Double-bit ECC errors: Page offlining
>>> +     * Double-bit ECC errors: Page offlining
>>>        * Poison and data parity errors: Log only
>>>        * For any other memory errors, request a reset as recovery mechanism
>>>        */
>>> @@ -383,10 +494,10 @@ static u8 handle_device_memory_errors(struct xe_device *xe, struct xe_ras_error_
>>>           xe_info(xe, "[RAS]: Data parity error detected\n");
>>>           break;
>>>       case XE_RAS_MEMORY_DB_ECC:
>>> -        xe_info(xe, "[RAS]: Double-bit ECC error detected at sw address 0x%llx\n",
>>> -            info->sw_address);
>>> -        /* TODO: Add page offlining for Double-bit ECC error */
>>> -        fallthrough;
>>> +        ret = handle_page_offline(xe, info->sw_address, true);
>>> +        if (ret)
>>> +            return XE_RAS_RECOVERY_ACTION_RESET;
>>> +        break;
>>>       default:
>>>           return XE_RAS_RECOVERY_ACTION_RESET;
>>>       }
>>> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
>>> index 99b2466e2062..2fac968879b6 100644
>>> --- a/drivers/gpu/drm/xe/xe_ras_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
>>> @@ -17,6 +17,19 @@
>>>   #define XE_RAS_MEMORY_POISON            BIT(2)
>>>   #define XE_RAS_MEMORY_DATA_PARITY        BIT(5)
>>>   +/**
>>> + * enum xe_ras_page_action - Page offline actions for page offline request
>>> + *
>>> + * @XE_RAS_PAGE_ACTION_OFFLINE: Instruct firmware to offline the page
>>> + * @XE_RAS_PAGE_ACTION_DECLINE: Instruct firmware to remove the page from queue
>>> + * @XE_RAS_PAGE_ACTION_MAX: Max value
>>> + */
>>> +enum xe_ras_page_action {
>>> +    XE_RAS_PAGE_ACTION_OFFLINE,
>>> +    XE_RAS_PAGE_ACTION_DECLINE,
>>> +    XE_RAS_PAGE_ACTION_MAX
>>> +};
>>> +
>>>   /**
>>>    * enum xe_ras_recovery_action - RAS recovery actions
>>>    *
>>> @@ -245,6 +258,28 @@ struct xe_ras_memory_error {
>>>       u32 reserved2[10];
>>>   } __packed;
>>>   +/**
>>> + * struct xe_ras_page_offline_request - Request for page offline command
>>> + */
>>> +struct xe_ras_page_offline_request {
>>> +    /** @page_address: Page address (4KB aligned) */
>>> +    u64 page_address;
>>> +    /** @action: Action to be performed, see &enum xe_ras_page_action */
>>> +    u32 action;
>>> +    /** @reserved: Reserved for future use */
>>> +    u32 reserved;
>>> +} __packed;
>> if this is a FW ABI, then please move it to file in abi/ folder
>>
>>> +
>>> +/**
>>> + * struct xe_ras_page_offline_response - Response from page offline command
>>> + */
>>> +struct xe_ras_page_offline_response {
>>> +    /** @status: Status of the page offline request */
>>> +    u32 status;
>>> +    /** @reserved: Reserved for future use */
>>> +    u32 reserved;
>>> +} __packed;
>> ditto
>>
>>> +
>>>   /**
>>>    * struct xe_ras_get_health_request - Request structure for obtaining gpu health
>>>    */
>>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>>> index d0341538ad05..3363f48da2b7 100644
>>> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>>> @@ -26,6 +26,7 @@ enum xe_sysctrl_group {
>>>    * @XE_SYSCTRL_CMD_GET_COUNTER: Get error counter value
>>>    * @XE_SYSCTRL_CMD_CLEAR_COUNTER: Clear error counter value
>>>    * @XE_SYSCTRL_CMD_GET_PENDING_EVENT: Retrieve pending event
>>> + * @XE_SYSCTRL_CMD_PAGE_OFFLINE: Instruct firmware to offline/decline a page
>>>    * @XE_SYSCTRL_CMD_GET_HEALTH: Retrieve gpu health
>>>    * @XE_SYSCTRL_CMD_SET_HEALTH: Set gpu health
>>>    */
>>> @@ -34,6 +35,7 @@ enum xe_sysctrl_gfsp_cmd {
>>>       XE_SYSCTRL_CMD_GET_COUNTER        = 0x03,
>>>       XE_SYSCTRL_CMD_CLEAR_COUNTER        = 0x04,
>>>       XE_SYSCTRL_CMD_GET_PENDING_EVENT    = 0x07,
>>> +    XE_SYSCTRL_CMD_PAGE_OFFLINE             = 0x08,
>> ditto
>>
>>>       XE_SYSCTRL_CMD_GET_HEALTH        = 0x0B,
>>>       XE_SYSCTRL_CMD_SET_HEALTH        = 0x0C,
>>>   };

