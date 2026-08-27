Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D894C5DF9D
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 07:10:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2F9610EE88;
	Thu, 27 Aug 2026 07:10:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kYjbI/6u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7598010EE94
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Aug 2026 07:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787814639; x=1819350639;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mKk2X5FFrBYIPDN206fk4WzuVAOV57kGDB+dceAEIQM=;
 b=kYjbI/6uZ3dqhZ8VdvfojIbzWAnQVjiK1SRdaEFF6GzoVRB+uGFuhkF6
 CxfxglG8eZ3SwFGUeGy1rCjFYcd8jKng5qc97sl/fq7aQACVcnNUlSVCr
 jYImZBlhsRxvLvlewQW4yi8OpGZJtHB6AhtVmx4EMen4OIu3oJmb2qH+C
 FYGLNK+QpEm/jd5M97vrfXcg8TfYJgnAHW8I44gYgzMnYs9IfX2BTL4HY
 haPhvwDNy9bG/WQJ0uGTbjWWAHgdeC1IML5jvWtRY4l7nYU45SmX6zJBP
 I95pHP61YH3r/KGHpdAqNbj4sK6QjKmxWc26blAQU+YQJ+tSj8VQmUfH9 Q==;
X-CSE-ConnectionGUID: jH6KRZBnSjGBZ8s7rbJDXw==
X-CSE-MsgGUID: ciYg+fAjS7uJ516Fw5tt1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="111089885"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="111089885"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 00:10:11 -0700
X-CSE-ConnectionGUID: VaVLn1HITbeeYGr6bUyOAA==
X-CSE-MsgGUID: 0mBKIdajSrW+FG7iNv0d0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="268364708"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 00:10:10 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 00:10:09 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 27 Aug 2026 00:10:09 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.16)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 00:10:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yo/NDtNG1OsuDy9eNW9jTIXjiUGupb8fBB3P8By1p5Qt/2xS2mToGNnmlL73EFMTWzUSTqT9jVVy5X5RRfwMzNKZzg/ljEU94xavG2sL+2paHXbZKf7LdukXnSE3ShxOIrjuLI71TdLIDK6a6/2qgk/sSidfds6q6yBKCKwP7YJGNDid4/MrqB11zJY5YyOlFDG9Yfpr1msq2O5brU4Mk2ei6R7AY1QY3LJm4Ya6tiWdYW2xLLdj8KXpmJFs7AJuBSC1T6uoOFmyHWRjR8cA7jQxF354oTlWER0RLe88JjRmMPVgGnZq4yYkFgnQr+9IUU9RSj3XfDbhwLQbeyZgWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LocMkjj9URYwST53g5aN2UG5HE1wQhsf5YhfM2SoL4o=;
 b=E8LgMEEMGVNCP9gUP4SegvomtW9mTs/e+gNWH8OmYgXiGpzvGnhMlAE6LaVCYZ+g2jP5SCYioybHOLBwchjiczAug1RIV3oMkpdHmdhSNUvacK+dx2T2ZaQHOBm9QYQi1DBmTOvjxyuYEkDUNz/u+3CEre5SIQ8jMuCtmJawW2DVsf9Fhw+WUkXn9iLlmIJpAtPvZfnxbEgNjLx3vNA/s+pxdWw89nsAgE3FS9Rv4BZZvcQDMk+CFNObxq45zZqk5knJGjmimiCVhP0NRoPAYuAsoGfAcN/FBEIas25v6FEN41qcqOXS+JUjXTjzCIAArUIxYPmi4vyMKN1k37Nbbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by LV2PR11MB096109.namprd11.prod.outlook.com
 (2603:10b6:408:422::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.9; Thu, 27 Aug
 2026 07:10:08 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687%6]) with mapi id 15.21.0360.006; Thu, 27 Aug 2026
 07:10:07 +0000
Message-ID: <2c698f6d-0a30-4bc9-9ca9-e12a2e01ff67@intel.com>
Date: Thu, 27 Aug 2026 12:40:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V18 14/14] drm/xe: Add fault-inject based VRAM page
 offline injection
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <michal.wajdeczko@intel.com>
References: <20260826135136.204044-16-tejas.upadhyay@intel.com>
 <20260826135136.204044-30-tejas.upadhyay@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20260826135136.204044-30-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0041.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d6::17) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|LV2PR11MB096109:EE_
X-MS-Office365-Filtering-Correlation-Id: 304a11b6-c784-4a52-4b86-08df040a39e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|6133799003|10067099003|18002099003|22082099003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info: XsE1fRqh4Ih9Ue5dl6cJiMGuTanPz/9gjpJUxVa7DkWjuPyn/CafDTsBfRkTmAJqvHblReKWOwD33FhsRejVR6FQ0zhiE6OPwIu/pSjTnQaMFaxjAsJF3jW7coBhKVmHCiI6pjSzhJz+nnQ90QDDyw88oRhcMtsAiSmBZ155hhffiotop31O4789Hsscy50+cXhnkFkRNKHouFjnbH7XXUfad+YcLzAa/HZ1N9cpyLQfYbpMjEl1O9ybu84jyeW/grkNFsNxlhYCTFuy3uapahR+LhI/UWk5u0+YTw9uz2MUjS7spQD6WC2r0R7hs+kMWaH/pcYgi7plwUg5yXg/+IRII4JpPaHJYBDSuf7Qe0YSAHCjy2+g5OzpZ0A4PNXAMg78YG9Wl4wbn97fuu0/1eKDIvonvSD6DoDnJXE7H5QevWLjvsDXDpbYEnBRvy5yDCVwdqlYWRSJcFV0fmthjOHTZVCI41riiI/3IxiRaSyqX5dk8CxjfdUHvwmhaNnH1TTJ33Cr/w+1Tljp7ITsyGh8oGv22BngvygBZuu9L1fMRKs1FJCwAox08rNA5ImsZsKlxrH+hKpBGhlrJekJmxuUTtz9Xv6xDad+cg5MK1FktZGxPadKfWOrRiX94rPiYyRvsdQWXvwqsbztE93yERsx6zHfGy4vvSIgGbHG6dI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(6133799003)(10067099003)(18002099003)(22082099003)(11063799006)(56012099006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UXArSTcxbFZzbzNZa0Y4aEhhbTU3TTlzQ2xCRFpJaGNYYjVqZHgxNmtjMjcr?=
 =?utf-8?B?bzk2YmFQMGp6VkFxVk9aUW1IdzVZNjUwWDllRGVqWGcxMFY1Q0l6Y1o3c1ZJ?=
 =?utf-8?B?VmFvMzVtWDJWR2psQjBURzBQd0xPcThuR2FJeE9kRnB5eWxjeHFXUWt3YTNv?=
 =?utf-8?B?VGJZMjE4djF3cmxPcE9FczhuKzhNbTV1L0NpaTZqa05maFlreENZeUVLcHRu?=
 =?utf-8?B?TThZZ2dpbUs1cHhhNjVtd0dKdkJneUQyTmFDSTRIeGJrWUNMaWw1NXlUenhE?=
 =?utf-8?B?UTFacWF4MEJuVDZhbzh2d2I0S2ZlNUYxOGRwcnFPM3RGZDVFVWRmbjhlYUln?=
 =?utf-8?B?QzR1QTZvZXljNWJYMEY0ajNDZndML3NoSE9CTFFCb3BpNjU5NjMyc3dDU3FV?=
 =?utf-8?B?L3lVT2VIanc0VW9NYnZOVEgySnVaRTZLejBzNmJUSTcwZ3VyMnVOOUd0Q1B2?=
 =?utf-8?B?ZFZjdWlmQW1BVmFWWkM3andYQzQvazlneVhobjlHNDVkbmtvS3IvSERGYjh1?=
 =?utf-8?B?OUdPQkhPbVpUd2VSZFd3L2h2YTdKcTN0cnlvdTJyZlRvVTZKalNTRGJOMnlY?=
 =?utf-8?B?SkxLb0E2UkhQOGRIbWRNQzdLOW9pNHVreWc1dU1ZNnJ3V3dHRldlbDVlTi9S?=
 =?utf-8?B?bklMUTl6WVdSdnBoaHJyWEFEOVRIREZhZFA3SjZYRkdnZHhBY1lWbSt0R2Nt?=
 =?utf-8?B?Yy9SZnFmMVJ4ZUVXR2oveFIyTVFRczZmZ093UE9NQWhaVHdJeWE3UVJLaUNW?=
 =?utf-8?B?SzFYZGJxZEVibjlUUi9oN0wyWFZZSjExYllQNEdkT00yZVdzY0pwQW1CdVpx?=
 =?utf-8?B?dFdLSXZ5bUEveklkZzN2L3N3MGY1Y1JFbmdrLytkaTE1SFRVczg0RG1GMmNC?=
 =?utf-8?B?dXI5RVJqdkNHKzZBdENhNmpEUFJGMTQwWmpQTzBqd094UzAwdnRtN2ZKdENo?=
 =?utf-8?B?NnUxelN0OTN4NVVpSENCMGFINDNxbFUzd2tEOVFOdGY1VTVyWUFydU5DOUU3?=
 =?utf-8?B?RFRhTSsyQzNMLzFIRDBBbnVaak9kN3JKRDFzNWZub3AvRGhWNWljNlFTZnZJ?=
 =?utf-8?B?SG1GaXVSWkwvL2hkdmlZeTNWbUFyTE9zb3lpZTJnYnhQK2FxSmF6dXRSRmMr?=
 =?utf-8?B?cnFiMjdSb0NNTjlUTkJoN2VDKzJjdGY1MWpDeXROWk9DNEgrSmNXTVc4dkhm?=
 =?utf-8?B?T1VaWEFOSkI0N0N6Y1lkeFgySE0wdmY3MVduV2Z6U0NNdGIvUFJFeFE3aWVT?=
 =?utf-8?B?Y3M4Y2FJMUhGZ1ZoVmFjRkxKWUhCZlRQSFVWWDlMUVlkdnZ6MVY2ZFFIdjZ6?=
 =?utf-8?B?bWxpbndUVHc2cGluOC9ScmlaM2ZXS2puMWFiYWQxNHRWb2hwZzUwcjJSMlVT?=
 =?utf-8?B?ekM3dDJYSGY3bUVMc0pURjBkUkNPTk04aXdFTDNiOXhVL24vMERVNlFBZlhP?=
 =?utf-8?B?RGYvTGFKRkp3M3I2NHFOWjVxOHErYUlDc2xWR3FBRU85emo1RjFXVzd2STNx?=
 =?utf-8?B?dGlVWFZTeXNRRzlCRmR0aG93V2hRSndHTFAwVG9IQUhRR1plS0VMY2dodGxG?=
 =?utf-8?B?aHlBYjVEUUF0MXhwQ2tjNTh2VElidFljYlY3Qnl2WTlROUpRdWZjMHF1MC9a?=
 =?utf-8?B?ejFhMEo2WldKYzBJS282NGN1NGZUSEFRVDJHNVUyTkJQZDY0YndWRDBORzdH?=
 =?utf-8?B?OWwrTmhpODcweTJ3cDM4dm1TZkFUR252QnZyRS90ODRIT0w0NVdZWG80bXdG?=
 =?utf-8?B?bitxM3psWThyNVRnREVFbzF0Wmt0TUxibW9ESlhxbHYwODRpUWVJVExDdSsz?=
 =?utf-8?B?emJvZm9hTGpWcDY3YlhreSt4ZE1CUnNtZU5nN2lvVTJ4blNRYTFWaGhJMEh5?=
 =?utf-8?B?WmhDSSsxVlBJNW1uU3NvbmUwSlJvMlZaRUZNSFNCUzJDaWV5V05Kb1Qxc0xV?=
 =?utf-8?B?RlVROHNsMGhjQ1dsazVRMVpwWHRrS0NncmFPZFBWQUVXbXQrbnd6TUo2U3lo?=
 =?utf-8?B?S0Zka1Z2S1UycXZ6SFUwUHRLR2wzVUJnZlFsdmRoc1ExZFZydTlnbCtHR3gz?=
 =?utf-8?B?dUl5SWZlMk9GODRVcTVaZXFGU3ZCRytHdnJiblhNQW42Y2lFeUJSeEV2OXU5?=
 =?utf-8?B?aGoxeHNOWFVJYWlSUW9SWjZkR281UnR1eGdMa2U2LzM1TWgrL0JRbUpSVDBL?=
 =?utf-8?B?a09RRFJnVGZpcUkrRStBM3JxNVl5c1oveXdwMVVJYnBrdzh3VWVvQUMwd2ky?=
 =?utf-8?B?Wmk2ZXVwdmJKaGNXV1EzZmRjcjJRM2QxSkVmaVJTZ2ZwQXhSMjlFYU9yeTQy?=
 =?utf-8?B?TXBaT1JCVGZVeHJwRWhoUzVnM0Vpb05wVlEyUUhvbVVCQklNRUE4VU11SDJB?=
 =?utf-8?Q?8705OR+i1HqfmGdo=3D?=
X-Exchange-RoutingPolicyChecked: dmxVw3LdZYovKwsXwJk8E9EftBk1NXsNlPxPu7E4YuPWyatiWYeuH6ub0NFh3QHyQHQvBovTBx1KJNsx2A/HqOLR7gj0ajUFJBxbANwNhdaXrb/lx8czxacfSrcKvRzjQ+ygOminjSyCSzctkBjQH2QuaZch7L15yTDdn++Lgerb9pDVxjZU73JtZJhm8uNqk57EXVhHdtm7CSqwqG+aL1spQ+ETrTe0uJzYFliRp7Qv/4oYBBPDG2SYVeRBbm0jsi3YmQNQHE7AQCJv9zqSKdbxNpfURIDzvQa6jHk0n6t9gcyVjilQu3ri9FscbEIskdxMvmv+WGXYDSLRR5AbGQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 304a11b6-c784-4a52-4b86-08df040a39e6
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 07:10:07.8731 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jauOzqd0iHYQvl90JmWrVhn6syyjMs4TF9rWSy5suvM+9eS/skSS+sspOQhZOh2YTdTwO/TZaQshrCjkkZ92T5B0FNMSJer/NGKAKNwxzck=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB096109
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



On 26-08-2026 19:21, Tejas Upadhyay wrote:
> Add a fault-inject based debugfs interface for testing VRAM page
> offlining. This replaces the previous standalone debugfs approach
> with the standard kernel fault-inject infrastructure.
> 
> Two debugfs entries are created under the xe debugfs root for
> CRI platforms:
> - inject_mempage_offline/: Standard fault-inject knobs (probability,
>    times, interval, etc.) created by fault_create_debugfs_attr().
>    Without CONFIG_FAULT_INJECTION_DEBUG_FS, the stub returns
>    ERR_PTR(-ENODEV) and no knobs are created, making the trigger
>    effectively a no-op.
> - inject_mempage_offline_trigger: Write a PFN value to inject a
>    specific page, or write "0" to auto-pick the last unallocated
>    VRAM page
> 
> The trigger accepts:
> - "0"      : auto-pick last unallocated page
> - "0xPFN"  : inject fault at a specific PFN address
> 
> Usage:
>    echo 100 > inject_mempage_offline/probability
>    echo 1 > inject_mempage_offline/times
>    echo 0 > inject_mempage_offline_trigger
> 
>    probability: likelihood of should_fail() returning true (0-100)
>    times: number of times injection is allowed (-1 for unlimited)
> 
> v5(Sashiko):
> - exclude SRIOV and remove dpa_base addition, already absolute dpa
> v4(Himal):
> - Use xe_fault_mempage_offline() instead of IS_ENABLED() +
>    direct should_fail(). CONFIG_FAULT_INJECTION_DEBUG_FS is now
>    an implicit requirement for the trigger to function.
> v3(Himal):
> - Use FAULT_ACTION
> v2(sashiko):
> - use cond_resched()
> - validate input first and fix addr < 0 case
> - validate vr, move block, found var as local to scope_guard

Seems reclaiming the page at addr is left to unbind/bind of driver.
Need doc for that? Multiple fault injection at random offset might make
contigous vram allocation problematic.
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_debugfs.c      | 47 +++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_debugfs.h      |  2 ++
>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 52 ++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.h |  1 +
>   4 files changed, 102 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index e19eafffbb08..003abf4af2e3 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -45,12 +45,18 @@
>   DECLARE_FAULT_ATTR(gt_reset_failure);
>   DECLARE_FAULT_ATTR(inject_csc_hw_error);
>   DECLARE_FAULT_ATTR(wedge_cold_reset);
> +DECLARE_FAULT_ATTR(inject_mempage_offline);
>   
>   static bool csc_hw_error_available(struct xe_device *xe)
>   {
>   	return !IS_SRIOV_VF(xe) && xe->info.platform == XE_BATTLEMAGE;
>   }
>   
> +static bool is_crescent_island_pf(struct xe_device *xe)
> +{
> +	return !IS_SRIOV_VF(xe) && xe->info.platform == XE_CRESCENTISLAND;
> +}
> +
>   /*
>    * Fault injection table.  Each entry registers a debugfs attribute; add a
>    * matching FAULT_ACTION() below for every entry added here.
> @@ -67,6 +73,9 @@ static struct {
>   	  .is_visible = csc_hw_error_available },
>   	{ .name = "wedge_cold_reset",
>   	  .attr = &wedge_cold_reset },
> +	{ .name = "inject_mempage_offline",
> +	  .attr = &inject_mempage_offline,
> +	  .is_visible = is_crescent_island_pf },
>   };
>   
>   /*
> @@ -82,6 +91,39 @@ bool xe_fault_##name(void)				\
>   FAULT_ACTION(gt_reset, gt_reset_failure)
>   FAULT_ACTION(csc_hw_error, inject_csc_hw_error)
>   FAULT_ACTION(wedge_cold_reset, wedge_cold_reset)
> +FAULT_ACTION(mempage_offline, inject_mempage_offline)
> +
> +static ssize_t inject_mempage_offline_trigger(struct file *f,
> +					      const char __user *ubuf,
> +					      size_t size, loff_t *pos)
> +{
> +	struct xe_device *xe = file_inode(f)->i_private;
> +	struct xe_tile *tile = xe_device_get_root_tile(xe);
> +	struct xe_vram_region *vr = tile->mem.vram;
> +	u64 pfn;
> +	int ret;
> +
> +	if (!vr)
> +		return -ENODEV;
> +
> +	ret = kstrtou64_from_user(ubuf, size, 0, &pfn);
> +	if (ret)
> +		return ret;
> +
> +	if (!xe_fault_mempage_offline())
> +		return size;
> +
> +	if (pfn == 0)
> +		return xe_ttm_vram_inject_fault(xe) ?: size;
> +
> +	/* User provided PFN - convert to DPA and inject */
> +	return xe_ttm_vram_handle_addr_fault(xe, pfn << PAGE_SHIFT) ?: size;
> +}
> +
> +static const struct file_operations inject_mempage_offline_fops = {
> +	.owner = THIS_MODULE,
> +	.write = inject_mempage_offline_trigger,
> +};
>   
>   static void xe_fault_inject_debugfs_register(struct xe_device *xe,
>   					     struct dentry *root)
> @@ -96,6 +138,11 @@ static void xe_fault_inject_debugfs_register(struct xe_device *xe,
>   		fault_create_debugfs_attr(xe_fault_inject_entry[i].name, root,
>   					  xe_fault_inject_entry[i].attr);
>   	}
> +
> +	if (is_crescent_island_pf(xe)) {
> +		debugfs_create_file("inject_mempage_offline_trigger", 0200,
> +				    root, xe, &inject_mempage_offline_fops);
> +	}
>   }
>   
>   static void read_residency_counter(struct xe_device *xe, struct xe_mmio *mmio,
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.h b/drivers/gpu/drm/xe/xe_debugfs.h
> index 0dcd28fd7dc0..88d91c78036b 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.h
> +++ b/drivers/gpu/drm/xe/xe_debugfs.h
> @@ -14,11 +14,13 @@ struct xe_device;
>   bool xe_fault_gt_reset(void);
>   bool xe_fault_csc_hw_error(void);
>   bool xe_fault_wedge_cold_reset(void);
> +bool xe_fault_mempage_offline(void);
>   void xe_debugfs_register(struct xe_device *xe);
>   #else
>   static inline bool xe_fault_gt_reset(void) { return false; }
>   static inline bool xe_fault_csc_hw_error(void) { return false; }
>   static inline bool xe_fault_wedge_cold_reset(void) { return false; }
> +static inline bool xe_fault_mempage_offline(void) { return false; }
>   static inline void xe_debugfs_register(struct xe_device *xe) { }
>   #endif
>   
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> index 8f583f1631bf..c54ad017725f 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -895,6 +895,58 @@ int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, u64 addr)
>   }
>   EXPORT_SYMBOL(xe_ttm_vram_handle_addr_fault);
>   
> +/**
> + * xe_ttm_vram_inject_fault - Inject a VRAM page fault for testing
> + * @xe: xe device instance
> + *
> + * Picks the last unallocated VRAM page and reports it as faulted
> + * via xe_ttm_vram_handle_addr_fault(). Used by the fault-inject
> + * debugfs interface for testing page offlining.
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +int xe_ttm_vram_inject_fault(struct xe_device *xe)
> +{
> +	struct xe_tile *tile = xe_device_get_root_tile(xe);
> +	struct xe_vram_region *vr = tile->mem.vram;
> +	struct xe_ttm_vram_mgr *vram_mgr = &vr->ttm;
> +	struct gpu_buddy *mm = &vram_mgr->mm;
> +	u64 addr;
> +
> +	if (vr->actual_physical_size < SZ_4K)
> +		return -ENOSPC;
> +
> +	addr = vr->actual_physical_size - SZ_4K;
> +	while (addr < vr->actual_physical_size) {
> +		struct gpu_buddy_block *block;
> +		bool found = false;
> +
> +		scoped_guard(mutex, &vram_mgr->lock) {
> +			block = gpu_buddy_allocated_addr_to_block(mm, addr);
> +			if (!block)
> +				found = true;
> +		}
> +
> +		/*
> +		 * Intentional race window: xe_ttm_vram_handle_addr_fault()
> +		 * re-acquires vram_mgr->lock internally, so we cannot hold
> +		 * it here. A concurrent allocation claiming this page between
> +		 * the two calls is an acceptable false negative for this
> +		 * test-only path.
> +		 */
> +		if (found)
> +			return xe_ttm_vram_handle_addr_fault(xe, addr + vr->dpa_base);
> +
> +		cond_resched();
> +		if (addr == 0)
> +			break;
> +		addr -= SZ_4K;
> +	}
> +
> +	return -ENOSPC;
> +}
> +EXPORT_SYMBOL(xe_ttm_vram_inject_fault);
> +
>   static int vram_bad_pages_show(struct seq_file *m, void *unused)
>   {
>   	struct xe_device *xe = m->private;
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> index f354c26c4257..8878e36292b2 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> @@ -33,6 +33,7 @@ void xe_ttm_vram_get_used(struct ttm_resource_manager *man,
>   			  u64 *used, u64 *used_visible);
>   
>   int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, u64 addr);
> +int xe_ttm_vram_inject_fault(struct xe_device *xe);
>   void xe_ttm_vram_debugfs_init(struct xe_device *xe, struct dentry *root);
>   static inline struct xe_ttm_vram_mgr_resource *
>   to_xe_ttm_vram_mgr_resource(struct ttm_resource *res)

