Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BFE1C79F99
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 18:34:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFFA810E142;
	Tue,  8 Sep 2026 18:34:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VJbixP4u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 288F910E142
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Sep 2026 18:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788892443; x=1820428443;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Q765UTRCLxvGYLmgV8D6CUm4ScBnmvgl8s3yzRppbpE=;
 b=VJbixP4uhaikiAbS7v/6ElnFIL3EiBQ0nRbU95ymwjEIQrzmokI/tKk5
 PmXHMysVB/U5hZdCpQq0l+upgAM96fNeG/CIyenE/HJ5AYyM8x4swkAMy
 kY8c+ma+y/eFDvUklJNlRnDJdiQqUvHkmPHist/UlsNXGygb5ZRf4H8lN
 YHQtPUozFc6d5NhcZys7mcdcDunZ1wYAHNA+g5IeXTk9dol2PGJMzS8tg
 q2J0Lb5okcHDS9+ObEqdtwOXXS2cWzAP7VgdhtMoRP4iZV6cZ40/nrePG
 O/KViziDHRtrdVU3gJ/i5aKnSHXrBYajp8JBq5ZWgSOYqT8sCxSccf3YD Q==;
X-CSE-ConnectionGUID: 59PSdcjTT7WOnw7N+JgxGA==
X-CSE-MsgGUID: Gmwb7XhoQ22IJ4/jQZDkYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="112083915"
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; d="scan'208";a="112083915"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 11:33:49 -0700
X-CSE-ConnectionGUID: E8rCa8B3QHOJsphBkXIOtA==
X-CSE-MsgGUID: mVBH3HMQTyKpVE0hoWUasA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; d="scan'208";a="271584946"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 11:33:50 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 8 Sep 2026 11:33:49 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 8 Sep 2026 11:33:49 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.4) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 8 Sep 2026 11:33:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fnGarUwx11cO6RwZaN6RcfgkGrvVGRF7Ahf9TTWXLbzS7DsVYBXkc/ehNmSW7w/I06/N6t3lg3YknYUn2SK1K2mmwmjnFjB3QN0vup+Svxp6ZFaxJq2+bwoKY+oSqBPy0z44uAUEMXJuirUbSKimX8Z1pidjEp++WmSXXyjEl2rPaVak6ts2sYddb9RRR6ZoN447KEXwiU45oMUV0QxIJTYXn15RFJbtL09/A945MHIv4wgBbnujYiI+QzXo4QPd8cg1ARyiiqBCO6Bn9+VeOk/hIkhBXn+WwfUZsnXDibfWcKyuLowfo1MRim0hwLa/K5Lmtw7/Ooye3DVjKXyIqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HOwplec/n6C+2NV/DlEf8H0+h7ZEYzgP+HCQ26Qs3v8=;
 b=NpuWF3ntk+DP0VkJI4WKrc6u0GKwbDvXYcBixxTn5Swbmei7ktqJSwI7w4mpjFfXTdxj+zqKfAcjF5WBOik6WnbWU6CpOJvvCbx4BzKd0mbYSEar32imRo2ZQtrgco0hYp1uGhTg7ESZe0hz83/lEgPqrVWu0zLBnsqw7ViGiU8+ZMEMPIFQK2CGMoDvuuzJwz2h7O31o2oRVwZ9Olzanh7t8hTj9Az6fFWs1MyPwDH7WMTUUqH9KebSZ7rnqac7f29z39QmoGqI66muVNAsNv14rcz+J5kheYB3CdoFJfSrrQz4IAvAtT59/SCvrv6KFstuss7JebQiEbOI9WS4iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7551.namprd11.prod.outlook.com (2603:10b6:510:27c::12)
 by LV8PR11MB8700.namprd11.prod.outlook.com (2603:10b6:408:201::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Tue, 8 Sep
 2026 18:33:46 +0000
Received: from PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0]) by PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0%4]) with mapi id 15.21.0406.005; Tue, 8 Sep 2026
 18:33:46 +0000
Message-ID: <c5ad8aa2-0b3c-4ac2-8856-82ff53bde557@intel.com>
Date: Tue, 8 Sep 2026 20:33:42 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/13] drm/xe/reg_sr: Report save-restore errors using
 structured xe_log API
To: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20260908104550.1283933-1-dnyaneshwar.bhadane@intel.com>
 <20260908104550.1283933-8-dnyaneshwar.bhadane@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260908104550.1283933-8-dnyaneshwar.bhadane@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8P189CA0048.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:458::28) To PH7PR11MB7551.namprd11.prod.outlook.com
 (2603:10b6:510:27c::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7551:EE_|LV8PR11MB8700:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a340e5c-d252-4b68-7609-08df0dd7b7bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: BjLeuC0W2pWq8CrE8YX1viWiquGIsq+Sf8lltBYkJINnq/uasuydw0zsPtKLAEqK44CeMCSO/TR4+Cx4oI9bPXlZSoA6WVKx0OYN7qGUtqoXhpGl4K0chdk/ovuwzNB/UeqRh/1AbATCqZU8pRB8HPZNvTAAtCNmETOR9siqnfPZKl6wjUCUgz150V47X4Nyzft3TWNM1ZM0dTI7S4K5+DIM5ccbJZjLqZRX/npTG43OhPVk6xwE6sDP7P2Q/Nb7NnOHuV7WBKIPKON92ebUNCt4Xf+3Lp0l4n7DK90u2+QRy6Id77/CiZdnr3kvQC8AOWnhBaYlZieIGMOGM5SEz7M73r/G3YJguFryXcAyaXYKfAAk/X8DZFYHKmqW07bdk3TvnzwllCVJ+raPaPoaeA56gjC6VTCcPf6RdPCzE+4k1glBDdWJQK36Kjlp2+tkOCTrT+gsFTH4GMP5WybiSEpE8ihs+LuoSE927gQ7R59ra+OAKN+nH/T3UbDLkpgnKSlNcAHwdwoM7KYzbIb1R8Bp8mxf/d2TtqCCm2ZdmNwOetQZwOzwkQo1DpOreUEREkVylCw/kbT/DpjODnzRJ+CRtoHE0qSIH6YyvTu8UFSR8zxgZxV8VOKMWVWZqLgyukAamU4hj3lHKpOyrjzyUfAVpj++cTHQokc8Ba+tQxQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7551.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MXk2OVJ5NlhSUXRwV2NjVDI3dFgxSzYrd2RZOVJubWhCVEhLWk9ncldBSDFl?=
 =?utf-8?B?azNrazdkWEs0UzU1Ly9kYWoyTkRpcldscWN6UnBURFFTTkYrWWk5MHFyUU84?=
 =?utf-8?B?ZGhwSFdFdkdEVkcxUnFja1kwdENHR0dZTFBlR2hmWGVJSHFSZktHMVBHQU01?=
 =?utf-8?B?MjFaVWYvdldGQjBWY1ZrSnRYZTZnT1I4eWxqMUJETHUzVTYzV2lNVnY0czdB?=
 =?utf-8?B?TEE5Y1U0WHdoVTVWVnhDaHlVa3BxZ1JyOHg4TitsT2JPU2xyUkc5eDFOdHEw?=
 =?utf-8?B?KzYvckxoU0VMeHZzQzBxOE4veUpMYVc0dEZOazY1MndBbmpkQXFhRWY4K0hr?=
 =?utf-8?B?a2F2amNHRDRmZWJxekFDbTRaRTFRcHdWTlA3NXVURk81b0htVStiZkpHZzgr?=
 =?utf-8?B?K1JUbnpQRXI4anFPY1hURzJnd3EvQ2hPZ0JKSHdDM29OZ29DdDliRXZCcW8r?=
 =?utf-8?B?Ukgvd1Y5ajkvN25mMVBUYlE0dm03TVJkM1QzY0IyYmV0eVZpcllXWDZsdkZQ?=
 =?utf-8?B?OE1UcVRjVmV1Nkl6TjZuUG9oV05JcnRkYS92cGhWMGZTRTJsQkc3RWMwMjVP?=
 =?utf-8?B?S1BaTWkzNUcvbkcrK2JSejI5V2RlY29DWEhqUldOQUZBN3FCYlNxMHh5V2Jz?=
 =?utf-8?B?WjZiTjJDTDRBam5hUkNVMG9yWWxIeW5MMWFSK1Y2U1hma21wVm1vWVJIV2NR?=
 =?utf-8?B?SENTK3hkWEtPT0V5b3VzTXpCVUllUzRQN3ZabWhnaEdiNW1SNlcyZnp6dGZu?=
 =?utf-8?B?UHF2QlowYmpMWjhORnhGNDd6d2pTcGo5NjdRUzlaSlcvSTBVRlVqd1lmcXhx?=
 =?utf-8?B?QS91SnM2U1JRU3FjdUxnQlduWHlaWkhhbjhVNlUzVVdBeE1tOFRRamFYVHdn?=
 =?utf-8?B?WmZhdFk2VjF1Vy92aGpPVXRWQno1WEV2cGJ6WjlET0pGN2t3MEV2N2hqVHUz?=
 =?utf-8?B?eExUVTcyWW9zSHY0T0ErTjZ1YkN0ZEY3RThkc2RtNHJJSmQ5cU5FR1QxK0ww?=
 =?utf-8?B?TFBOVXJLTHd6VXpnSUkzQ0FiVk82YXd3bjlNVTFsdkgzNkx6QkJIZkVQWDdt?=
 =?utf-8?B?bERVMWppVkV3cDQyL1R6UHhCV3R3ck1FNmhHKzN0TkxxR0w5bEM3WmtteDd0?=
 =?utf-8?B?akxYQ0tYYUpjNU8vSHVoUWlHQjRqTlFORjJQT2NMbk96NVJRMDF0OFVyajZl?=
 =?utf-8?B?bDhjWXVnSVA1Nmh4S3dwaG1RT1lsd25oRHRZYUdORFVCQTNXbjZJSDFlU04x?=
 =?utf-8?B?b3ZiTis0aGRiSHAyZzJpbHRHRDlVeXlObmdQZmJUWE5pM2JycWRUUlBVTDZE?=
 =?utf-8?B?OUsza3c2U2podGdDYm43Vkl1L3dtc0pUWWRYMnhlWGVHOWVuaUJLVmlPY1Bw?=
 =?utf-8?B?UDZDeG81bENDdW5tUEI3elpmUzlRNEN1aDdGYkN1UWZKRFBPUGt0bDlhekVZ?=
 =?utf-8?B?TDRLNVFJbktBQW81VjcrbzBYZmlLRWRuMytxUTZNQ051Z1N5cnFQd2FwS0VL?=
 =?utf-8?B?VVpiMzAxL01MYVFJSE5NN3FjVzNGVUZDcGtXWW5RdjcrcFlEenAwM3VNSGhY?=
 =?utf-8?B?bkExd1NaSE1WdEprMVpudURrUFJUbzhmQU52R0VXZTVMZGtMaEtmRmxYMkVY?=
 =?utf-8?B?N2kyNlVnRHR1bXVWbUFzRlhueGhUZUNrWmlIVTErbktzUWwxUjd1NGN1RTMv?=
 =?utf-8?B?eC90UTJ5SDhkUHE0MndoN09UVklUMy9QczRLMkpXMlk5ejkrWk9ZS2hNZnpx?=
 =?utf-8?B?cmN4ZlZCdjFrSDZHT1ZTZkU0T2xpK3NTVTZ5UFRUYXJNd1VXd0dlVVRpL3Vo?=
 =?utf-8?B?S2c4aDBSVXZpUElQRWxZUWN2ZU5VZVlRMXdiTDdjVzkzVHhPcUVWSWl2empC?=
 =?utf-8?B?NzBiT05sS0xkQ0NWSGlpdW43Rjh2Y2FqNEJQTHI5MUY4ZzRXcmNrT2REWFB0?=
 =?utf-8?B?MlZ0Y2RVVFJlbGhpcmRMS21aMFc3Q21vcFpmc0JzZllkckxuT05jZ2k0Tnhk?=
 =?utf-8?B?RWFRNitNSnF2THdLcUIzTzdSb1ZOZ3VGbUlRRXNJNnZMckhxSTNDamh0ak5T?=
 =?utf-8?B?M2hzOHVqVzVybjNvMllqUUNXdTJjaUkraWxHdzlxb0Y1a3ZUVmljMXhrUDVn?=
 =?utf-8?B?dXRJQjI3OUJxb0FJZStGVDN1V05WNVloNnk0eEtuSkxrVkQ4bjJrblIyYXZV?=
 =?utf-8?B?YnBhZHhjR0o0UVpyNzJwaVVzWXFZTCsyeC83YnppSE5VcGU3YStDcjRNV1oz?=
 =?utf-8?B?VHBsZDB1REdCN25PYlNhYU9RdzZTeEh2UGg0eFNOL3hqQ0F2K2RacVBEeTE1?=
 =?utf-8?B?R1pONlF5cmxWSUZmdm9LcDBPYUZ3c2dwRDhydVpGWEhWZXBvekU5WHJHQVEr?=
 =?utf-8?Q?mVVGcR6zqhYvH9sA=3D?=
X-Exchange-RoutingPolicyChecked: D4Y5sxKZDYGqyCGw+MCXiNLLISpNHlM37kFV/jlKws9srTRZcTKv/gN7QJzJ8SQK0tI+RTcaMLrfgCveZwKVbyzHDjH8iBmAVpa3/Xd0BlEZPYAshaCXCkdnRyOBbWcO0Efxls9fRHgbL+4jB5ArfOSchte7ZO0WhPUH/TQEKg9t0wX2bAP9xCnblEuyMHYFZAAfOgCSyPZW0fkTTMVJq5AxsRdiFuw4RxXkLHIDN2ldlqgaBCZqQohgEN52l0SwwddVe4JiZfMkujxgcd+Zt0SvnDX9BO1V4AuXkvYVR/5foIF2kFPVZ6OSNsvpqFQ+NAebaD3bkLaoaBygoe+CRw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a340e5c-d252-4b68-7609-08df0dd7b7bc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7551.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 18:33:46.3015 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6ZWM9W8adfe2lDPoqa00UepRHUNBYa/vhcezhdsnKt6BJNOiS94ZITMgmZ9bWPVj5KB/wQlvvDtIWDCT7cyAhBuOWFlpn8eCtkHd4JRqLTU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8700
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



On 9/8/2026 12:45 PM, Dnyaneshwar Bhadane wrote:
> Replace xe_gt_notice() and xe_gt_err() calls with xe_log_info() and
> xe_log_err() using the REGS component tag for register save-restore
> operations:
> 
>   - MCR register mismatch corrections
>   - Failed to add register to save-restore list
>   - Force-wake timeout during SR apply
> v2:
> - Drop error type from logging explicitly(Mallesh).
> Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_reg_sr.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
> index e328f5072557..ee17e8c10a46 100644
> --- a/drivers/gpu/drm/xe/xe_reg_sr.c
> +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
> @@ -21,6 +21,7 @@
>  #include "xe_gt_printk.h"
>  #include "xe_gt_types.h"
>  #include "xe_hw_engine_types.h"
> +#include "xe_log.h"
>  #include "xe_lrc.h"
>  #include "xe_mmio.h"
>  #include "xe_rtp_types.h"
> @@ -87,15 +88,15 @@ static struct xe_reg sanitize_mcr(struct xe_reg_sr *sr,
>  
>  	if (is_mcr && !reg.mcr) {
>  		reg.mcr = 1;
> -		xe_gt_notice(gt, "xe_reg_sr_entry using non-MCR register for address 0x%x, forcing MCR\n",
> -			     reg.addr);
> +		xe_log_info(gt, REGS, "xe_reg_sr_entry using non-MCR register for address 0x%x, forcing MCR\n",
> +			    reg.addr);

should we use xe_log here?
this looks like our RTP/whitelist issue
maybe it should be xe_assert?

or if we want to use xe_log, we should add REG_SR component?
like we already have RTP?

>  		reg_sr_inc_error(sr);
>  	}
>  
>  	if (!is_mcr && reg.mcr) {
>  		reg.mcr = 0;
> -		xe_gt_notice(gt, "xe_reg_sr_entry using MCR register for address 0x%x, forcing non-MCR\n",
> -			     reg.addr);
> +		xe_log_info(gt, REGS, "xe_reg_sr_entry using MCR register for address 0x%x, forcing non-MCR\n",
> +			    reg.addr);

ditto

>  		reg_sr_inc_error(sr);
>  	}
>  
> @@ -143,12 +144,11 @@ int xe_reg_sr_add(struct xe_reg_sr *sr,
>  fail_free:
>  	kfree(pentry);
>  fail:
> -	xe_gt_err(gt,
> -		  "discarding save-restore reg %04lx (clear: %08x, set: %08x, masked: %s, mcr: %s): ret=%d\n",
> -		  idx, e->clr_bits, e->set_bits,
> -		  str_yes_no(e->reg.masked),
> -		  str_yes_no(e->reg.mcr),
> -		  ret);
> +	xe_log_err(gt, REGS, ret,
> +		   "discarding save-restore reg %04lx (clear: %08x, set: %08x, masked: %s, mcr: %s)\n",
> +		   idx, e->clr_bits, e->set_bits,
> +		   str_yes_no(e->reg.masked),
> +		   str_yes_no(e->reg.mcr));

again, is this really a REGS (IO_BUS) issue or just internal config mismatch

>  	reg_sr_inc_error(sr);
>  
>  	return ret;
> @@ -219,7 +219,7 @@ void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt)
>  
>  	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);

btw, are you planning to promote xe_gt_WARN from xe_force_wake_get() to xe_log ? 

>  	if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FORCEWAKE_ALL)) {
> -		xe_gt_err(gt, "Failed to apply, err=-ETIMEDOUT\n");
> +		xe_log_err(gt, REGS, -ETIMEDOUT, "Failed to apply\n");
>  		return;
>  	}
>  

