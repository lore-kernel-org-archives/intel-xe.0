Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C174CA600C
	for <intel-xe@archiver.kernel.org>; Thu,  8 Oct 2026 13:45:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DEAA10E011;
	Thu,  8 Oct 2026 13:45:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ukdanc+n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D36610E011
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Oct 2026 13:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791467127; x=1823003127;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=nSjIA9FEqipc84bhn01HHh5yHXtWLoq/55m4zEaM2FE=;
 b=Ukdanc+nyCM2UMJgJtQwpkHHuRRxHUtOZmlrMCpeF0YGppqjA14xAdpa
 ANgKpjjkQSQunx8YdGgBEjo9jbC0W1ytRtKHeHu/FHQds0QHUp9qI+WbD
 eXCN+6AeCHE9cODebbPZdEjyh5f+OR/XktcVTJ6IVs156U+MNMY4v9Gnj
 yO8Mf5sA6uDGl1/GHljq13knolFEBMV9qCGdQAM0Q81EvHRIvQnLX962K
 sZECjZ1FKlUEEuSI8tIDfEVyC1NZYod8keDuv+WrgGxlzzhzxKVjZCY3j
 bpIbrOSPl+HF7Bz2Mh1ZNjTDPZd3RiTAdfLq1LkGYQa+ZTCg15KYJf7KL A==;
X-CSE-ConnectionGUID: J1WcH8NOT5Cd6in/DPMWrw==
X-CSE-MsgGUID: lyOhZ0ELRc+0wi3rjMqJDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="131201"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="131201"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 06:45:24 -0700
X-CSE-ConnectionGUID: yqM/5pLLTa6pnoLU21St/g==
X-CSE-MsgGUID: EgUEXELTRDeEgxhPNtCVoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="3135"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 06:45:23 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 06:45:22 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 8 Oct 2026 06:45:22 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.42)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 06:45:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bs38xLGwqpdjiRkZpfXzm9z6BIzVc7PbhXlwawWHOqLVlbRPTT3pMMhcJlL+6hMmUO2/Uc5cTVHwVuVwNFJpY0ohXzQHH1jA7mTLeeh2Pgabb9smz39G1EFUsVAvboC92jD6hYCwxPXHGZ0mhEjrM/3zv/Za7oNmAe7NMv9CuSfTFQa86DPOKlk6xYqGNhJE3VnEKwupIVmqsM0Z3ICQ4PjmlUvntUIC8DyKdBSpBcl7F9IAN1W6JyyupH1+eUt2WTChjCRC6xSYNeW545NUIRy+lI0gj/Msyzvky483zcSzNau23rCd2VYTL2c8tWrT67CtGK3XvuU7e1r0GJ+KhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Uae8BuT64Z91I+22CRX+tcdHA8LpBAMMM4R4ujBifE=;
 b=CLuKo+qRBVvhfDEtpJHVIJ90PgT4Qv00ZSAiOwMzPelWz3BjzmzYbdwqN7ZI/7wWJzXLqi/Ak0Tc4KqnLqDvxE6kfJpoSBEANcm/9TQaPPPwtNFSB2Dt/p9XgR2T1DNrmZv8jqHPrq7YaY8iANxwEcGrA/fHdJlBCa7C9AeI/CWKwjuJhmzRedM3IWPTGl0GLnL1siMAgCvR8Lb1nCn51U47+sP0w7k6rJnzkdkEZEX0QFNRYlsRK79rf0flQSejtJyc1erdEmVbpLDsaAZyH2ZskWPMq7b9MSiBuLulEWWRZ92HUozHDRB/2GCKNLBN5gXVGHtSqqSmRJM+XX0ebg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by LVXPR11MB9753.namprd11.prod.outlook.com (2603:10b6:408:387::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 13:45:20 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%4]) with mapi id 15.21.0472.016; Thu, 8 Oct 2026
 13:45:20 +0000
Message-ID: <4a4e29f9-70cc-4e41-8b8c-c68e25c9df5a@intel.com>
Date: Thu, 8 Oct 2026 19:15:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/12] drm/xe/reg_sr: Report save-restore errors using
 structured xe_log API
To: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20261007211417.2093611-1-dnyaneshwar.bhadane@intel.com>
 <20261007211417.2093611-7-dnyaneshwar.bhadane@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20261007211417.2093611-7-dnyaneshwar.bhadane@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0139.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b9::12) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|LVXPR11MB9753:EE_
X-MS-Office365-Filtering-Correlation-Id: 42f0241e-11b9-4cae-2d8e-08df254264ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|18002099003|22082099003|10067099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 6B8qTwJ6EJ9GHC7Ou4qzJ0yuWCIwzGlKhOxmkY1qvFgToPUuAt+rSUge8jWfdu5mAt+2+ZRcQJ+A9RU6JdV4CmBr0pB5PdlMHOXNR3TOH5zihHYOpvXuQ+RBp+1W7h2VFUGpj6cnMjLuVFsYzmmy39HtqAPSRuNosLbByE4bADyk3f2jHBCq4oUchKmSdJ+Jez8SN+j6FLtuwmfyac09B84YSE/TK91EJXJIowY2y6xHuLpqSpuIdCoy/Gw+a9x+uTz/VhE61GYdW1+hkTc+agAwwlLc0AcE+oBV8xmi8Nm0qXqmr+MB5fPdRWfK9NcqPudfG07lE+5uJHegRnPRX0WmbH4m8p+twPSxzdRkkGVHojMHMZRsXEuy0ugYFNYWonQOuMcJydWYykw1Ns84wxXhbT5XCvGCTZi5kCZJ6bW90atcWaRTCMpHrlj/Hh5r2DuVH0wfRdhCx5PKoMwlZ/73w95ReihN2aM7TTGDfsOY88wt4NTocdH23ucCTsAAxLFV6yYMJZcAHbwcBFhHJXo+/P9LV+q5+XbgElotORwN9LlpQ7oQoQxxwSccK5DLvGRLfVOF+6QXHKOld9lCIewsLbDHT+FUV24gFoaNSUe4ncKGJJ9x6gf1MhCcx3ATcRlF5QS1i3lam65W++aZiOUr3I2Ghn3ggbhs7nq4F8c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(18002099003)(22082099003)(10067099003)(4143699003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?elV6TG5RM0tWOHIyVnFPbkxSMHRZTlQwc0wrbThqVUg0eWNMSm9JejIxUWI0?=
 =?utf-8?B?WTdzK0J2NWNBRVVaWGhhbHV0MTdEdHVEVVdRRFM3M2pNR0s4eFUwT3hqRnZ2?=
 =?utf-8?B?RWJ0WFJxSlBIOXZ0cmx1c3F1ZkdibUw4eWRHZDJKUkJnYlVvMnZSb2JWeHNy?=
 =?utf-8?B?SVN4dExFTkhmeDVpa09kbWQ5bFEzRTE5THVCTmp4WFBoK0Eyd1p5bTFzb3pL?=
 =?utf-8?B?ZUtIYUt2eThlS3pSaVdOby9ia2hHU2lyZUtnK2pTSWxXbGJ3eDRRS1BzUkhy?=
 =?utf-8?B?UXNYOU5kMGtSMmkxdWh2cjZUVTd3eFM5UHk3NDN4dWk4MHJDdEl0SUJXaENP?=
 =?utf-8?B?MnpNL2FsVlpoWXlCeURjOThmOUlGRlFZdzZ1YjRjRWZIa1Vac3I2cEhZWldT?=
 =?utf-8?B?bTFBS2hrK2JhNVpVUmhtUVExU0VUL3EzZU9sWXpISk5CMmFsT1duVDhmYUtF?=
 =?utf-8?B?ZmFmWHBkbmc4dnFJU0tvVE82d1BuL21UMDlrNVZWSkZvcmJ3cWVwcFNYdHVT?=
 =?utf-8?B?OSs2ZStISStOWTJuazZMeFBLZDE4RmZyMXBnMi9ya2oya3VtaGgvWEZmdDlv?=
 =?utf-8?B?SVN5bkI0R3Z4VEozb2dsRlA2dmdmRlBNUXIySDNlT3ROckVlK0JFTXhzOVpJ?=
 =?utf-8?B?akJrSlQ0c3pGQmIzczgvV091cnVlN0FzZ2V3YzNwd0tDM3MyMmxIVkVqMkhZ?=
 =?utf-8?B?T1djSlJ0QWJUMExqcHZ1VFlJbWU5M3NSZG94T3JVc2ZBVHdIcjRYcXVTQWN3?=
 =?utf-8?B?VmxyWGlBNUQ3SWlEQThNOTZ6VDg5NmVKanNNclJjM2J5aEdnZ0JUVENYeGN0?=
 =?utf-8?B?SkdRME9wZUtERFlueHNhcmZ6RWM1NFl3QXR4VDRwaFd2aWVPSlM0RWVoN3JC?=
 =?utf-8?B?L1YvdldYNU5wRkd4MVBrVDQvNk1VU2VSRUVoanF2dVhaL2U2UklVdjFWVXZi?=
 =?utf-8?B?UG1HclgyNDlSM0ZRb21pblh4aVR2RXRXZFVIQU51bnBFS0hOaXQyVVNPNExP?=
 =?utf-8?B?dGk0VnJRTmFxN05mVWQxUTNnZ3BTUFZOT0ZqcFA2V2NrTzIvVHFyOURzUVVK?=
 =?utf-8?B?MVg1ckNTZnpKbHZ5b2djTEk1cm9nUXRPWFVBRmxsLzdWMk5mdGlncGUvSlNj?=
 =?utf-8?B?Y3lHVmdYM2JvY2VZK2VJQ3NsajhyYngzZWZjanE5VWkwZ0hYcUxQYVBvQmFF?=
 =?utf-8?B?ZU5qNVpnTi9UMDZhRjB5TmVEdkMxREphS2R6RjduVVlQTDFBcXl0VmR1Qy9Q?=
 =?utf-8?B?aWZWNHNjNXVWN0ZST3RINVFaSUU0UEpXL082OWZLUm5VN2xIamdxTTJxWjJj?=
 =?utf-8?B?RnZjVzZXdmF6UytzY0YwU3ZuN2JXeFU0MkhCV1A4V3lsSWwvWjZWazZDdEQx?=
 =?utf-8?B?ZzVkcExlUXNXZDUrbE9YbFNnaHF5alJJN25ROUl2aHJMNDJZMkRocm9GNnYx?=
 =?utf-8?B?eFJnU3dRaDlrNFNWbWVoUjFIMDhhcEtoanFzZjNlY3NOditQRnNlMlRHaWJY?=
 =?utf-8?B?d0tUOVV1djhpcDNQb1ViSlF4L09reEx6WmRFYzkvalQyS0ZSdGI0MVViZzhh?=
 =?utf-8?B?NW52d051UCtwdmZnelVMZjBrMGJlZVBKOC9tVWx3dWErWEg0U2hocmMzQUhW?=
 =?utf-8?B?bzFPbUh0dTdiOUUrT3BnZWwvWE4ydTVibXFFUmFuT212UUJUVENSbFBzb2pi?=
 =?utf-8?B?NlpLcU1keDBPTUc3TC9CT0xFUXc5UFUrdFUvc0k0ejl0QllGd2hlT2MzQjEx?=
 =?utf-8?B?ZmVBdHRIbTQ2eFN5VVFodjBidXUzT1J5VWNSK0hPVndKbWRaNCs3SXViTExV?=
 =?utf-8?B?U2pzL1BBejZJWmRsT0l2L0hMYkg0U3V2bzNmUXFEVjByRGdKRnl3UGp4MTZQ?=
 =?utf-8?B?WXIvbWN6T1haa1BYbm5XQzZ5NTB6VGJjZGlsY3NPekpmR2crOXZnOWlSSlJJ?=
 =?utf-8?B?N3IvWEcyT21adGNxMXNNM29jQmdoL0Z6b2k2QkZjZ3I5SGZjMjduaTBjT3F5?=
 =?utf-8?B?U2VsVTVnZWkwOXM4bndTRkwveVlPeHRIL0pqWTZocTh6N0JEYStCdWNOa25w?=
 =?utf-8?B?TWErazNLQUxqcGo4cGh2eFJDQ1IyNW1ITVdDakE0Z2w5NjIzM3RGQkh3MlVP?=
 =?utf-8?B?SVFUdXZaNWtBand4SmNpN0xicUxpQzdNNTd5L3U2RWZ5Y0hZcCtFR2dwVjhM?=
 =?utf-8?B?eHJseVpjMzV5MkFnVE1NdUx3Q0REODlESlRNRWZIQStzaDA1T0JGWFdjYndI?=
 =?utf-8?B?MXpCTVJpWDU4UUxjV3VIUUJGMHVlQ3R6WURvbUYwcnVSUXp4T3B1YkdSL2JX?=
 =?utf-8?B?Mm9nczdDU0lnd1dCem9TckRudkUwbkdCUmNLcFZidHNNQ0FhTGxtbUZ5dklr?=
 =?utf-8?Q?//9xaaQ1HPo51Wpo=3D?=
X-Exchange-RoutingPolicyChecked: ozfgdKLv4Sm78WxP4dMwPxZNqQnd0euYR76WyRqbUWs0cmar3pYRQ048HcSjl/RMObwE6B60LCmyNaj65rNc6XROBoikTbSDAOof8HOwugGp0sGpav64ZbltEEgSgl68613hrlcnFATG3Hv6IAXOGtJR7j9ZIrHihQNC3nsulXjcLt66DgGokQnwP1pChHZHo4OGXbrtwtOxID30dRd2CJ8YW8/FYoYU9PJ2cP0jfZQcnUvhcoNYRFF1QUQ51mbDt2QQ+S7zaDQmQtsdVRE/Pc7wG5ITK90yAvZ3lXcoc7hYXBbrtDuOfZy7tzB18Yk5HJVG3aYtEo4vcoQQky8lQg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 42f0241e-11b9-4cae-2d8e-08df254264ce
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 13:45:20.2734 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mb+k/dCVbwJThQeTsBuFczaF+xDZ0yECaoMqrLl1oIPoxt9tUrpld3ho0JiRU3h6kpg/u8Hn/EBVj+zEZKPUwE0FWq30yC025uKaUmMi2oA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVXPR11MB9753
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


On 08-10-2026 02:44 am, Dnyaneshwar Bhadane wrote:
> Replace xe_gt_notice() and xe_gt_err() calls with xe_log_info() and
> xe_log_err() using the RTP and REGS component tags for register
> save-restore operations.
>
> Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
LGTM,
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>
> ---
> v2:
>   - Drop error type from logging explicitly (Mallesh)
>
> v3:
>   - Replace RTP instead of REG_SR (Michal)
>
> v4:
>   - Update commit description (sashiko)
>
> ---
> ---
>   drivers/gpu/drm/xe/xe_reg_sr.c | 11 ++++++-----
>   1 file changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
> index e328f5072557..eab84a528d12 100644
> --- a/drivers/gpu/drm/xe/xe_reg_sr.c
> +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
> @@ -21,6 +21,7 @@
>   #include "xe_gt_printk.h"
>   #include "xe_gt_types.h"
>   #include "xe_hw_engine_types.h"
> +#include "xe_log.h"
>   #include "xe_lrc.h"
>   #include "xe_mmio.h"
>   #include "xe_rtp_types.h"
> @@ -87,15 +88,15 @@ static struct xe_reg sanitize_mcr(struct xe_reg_sr *sr,
>   
>   	if (is_mcr && !reg.mcr) {
>   		reg.mcr = 1;
> -		xe_gt_notice(gt, "xe_reg_sr_entry using non-MCR register for address 0x%x, forcing MCR\n",
> -			     reg.addr);
> +		xe_log_info(gt, RTP, "xe_reg_sr_entry using non-MCR register for address 0x%x, forcing MCR\n",
> +			    reg.addr);
>   		reg_sr_inc_error(sr);
>   	}
>   
>   	if (!is_mcr && reg.mcr) {
>   		reg.mcr = 0;
> -		xe_gt_notice(gt, "xe_reg_sr_entry using MCR register for address 0x%x, forcing non-MCR\n",
> -			     reg.addr);
> +		xe_log_info(gt, RTP, "xe_reg_sr_entry using MCR register for address 0x%x, forcing non-MCR\n",
> +			    reg.addr);
>   		reg_sr_inc_error(sr);
>   	}
>   
> @@ -219,7 +220,7 @@ void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt)
>   
>   	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>   	if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FORCEWAKE_ALL)) {
> -		xe_gt_err(gt, "Failed to apply, err=-ETIMEDOUT\n");
> +		xe_log_err(gt, REGS, -ETIMEDOUT, "Failed to apply\n");
>   		return;
>   	}
>   
