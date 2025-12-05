Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C707AD3398B
	for <intel-xe@archiver.kernel.org>; Fri,  5 Dec 2025 16:18:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87AD910EB7C;
	Fri,  5 Dec 2025 16:18:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dbUKSI+u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E91410EB76
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Dec 2025 16:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764951524; x=1796487524;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6d5OP9yobqCr98dzVRVSZEm83DD0YrHxOBw3HMMu1rc=;
 b=dbUKSI+u/xcesCqwqWHZTM9YLWMSnQmYzEdsx1jFuvreDFR5Kl0TAATe
 Xi4sNO3pW+ypj+/m8E60jCWVQWCdIQn2Vg4iMPmTX5fzHlQl+qUuhAjuy
 gz+NtxYoZDkb2I976RH5tN1hbZkg1z6KuPYASiPm2WA/gc5JiZySUVdYt
 xCfjXmjP+wwONR7HzxtQNb6q0MTQOFeJlwvfpxR71wee3+ZkUWt5hdhWG
 VpJiFfZMXuNMcY0/zelHv7BV2OYTNH4H0vkvtNteJSuwOpZiv9/Liupju
 3aq2x4Ri7LUtTXng5FMJfwDlWaAqLSfmaIu9/H6kZLh0jjVSmSSzLIYnP A==;
X-CSE-ConnectionGUID: uaLJiP8HQvWmUREedfUzOg==
X-CSE-MsgGUID: 690qJpw1QPauc26WjUclQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="67023489"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="67023489"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 08:18:44 -0800
X-CSE-ConnectionGUID: zXixNNCSTSyliAzjzgR0Hw==
X-CSE-MsgGUID: ibGlVZBqTsGb1sdYztdH0w==
X-ExtLoop1: 1
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 08:18:44 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Dec 2025 08:18:38 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 5 Dec 2025 08:18:38 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.43)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Dec 2025 08:18:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qcg/kwhfnQiut8GiCb6iRSIPsbHq5tSyNSa1HIT2YkQt1tqQcuZH9ocnmJAZYZEAsICagV53H5LRPtKqjJkE6yAF46wQ/vNTq9s02ujgmHvSpfwmW2ya28cyDGX71ZMl8G9B+bZbGEVlTPwGUfamz5WF2/HdcrNiPtO6SGwTJbvfjFp/0fZjqK0osP59egc8SSISOSWJhAPYNLpWl9k8IZyNMKcA2ByxbaX90/IIw4pglhNZdHDzIYwqXPHJBMt8E3vkeWSBoNzvIegZCtAKWe0ctB0v1uZJB14VYXUtijSk0bdJ80Hu5DERbz79VLsm7jCDvPz3srwoH26UiDDsYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Hqvlw7H0TQ+UWfM61mHMtDxEhpLkbqEilJv8wMctdM=;
 b=KmGc5rjlV9s1Khp+QNhKxRNL1nxepCzKMC/T3MfcQjVCb4X/Fe9l8160U7ycOFGarGbasHoc5TfUcXuaBmSy90bmmQQGfn55qIqfqhCNIm3/td3Ro2dhqYLiq9xhnCV8atARxzxg3HZPQ2P6unTqQrcu0yokafvhTFCGC9jNC8YkWAlOKqBi2eYOqCHZavS6T6bwUfOgEniH9OdHRQdwujyWkA0EQDElhAgJkzYlepWlPXrsFD19Fmw6mAds3CEixqs7q4XXfCfF0Z+VaoVANlGd+J9TvhudoEp/dlkUEooSC4Hv4ckN6GWx7qX5v/brYoxZIHjlLcrUB2HILVeE7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MW4PR11MB5909.namprd11.prod.outlook.com (2603:10b6:303:168::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Fri, 5 Dec
 2025 16:18:34 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9388.011; Fri, 5 Dec 2025
 16:18:33 +0000
Date: Fri, 5 Dec 2025 08:18:31 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Xin Wang <x.wang@intel.com>
Subject: Re: =?utf-8?B?4pyTIFhlLkNJLkZ1bGw6IHN1Y2Nl?= =?utf-8?Q?ss?= for
 drm/xe: expose PAT software table via debugfs (rev8)
Message-ID: <20251205161831.GS4065316@mdroper-desk1.amr.corp.intel.com>
References: <20251117230156.366860-1-x.wang@intel.com>
 <176493097508.61003.11108365368012838216@a3b018990fe9>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <176493097508.61003.11108365368012838216@a3b018990fe9>
X-ClientProxiedBy: SJ0PR03CA0369.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::14) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MW4PR11MB5909:EE_
X-MS-Office365-Filtering-Correlation-Id: a7521aaa-e2c2-43fa-acab-08de3419efda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?d2EGxZuwSjy0GU9no2AK02DTcTlTzD1dG9vxab9Zh2AwXHMuU4R95sIUIprk?=
 =?us-ascii?Q?Fws5KBkVbTh8gPs9+WuMco8aY6FGQNEvy35DLRazr2GvVdHv5FfORLwlW/QM?=
 =?us-ascii?Q?dpEqtU9PGFZdHTvsYF3pWIPLe7j4K11eDt0ZHKZbEK6nt03kabGPF1HauPjm?=
 =?us-ascii?Q?3bO2tm+QHElKPYKzL6T56ns+begHlH4C+uJkA8w75hlPrzbLqvcS696fzpZx?=
 =?us-ascii?Q?z3FiaUxsboZxkU+gDwdZE4Ng9P1varmjGoMHV4dKp7gTZA6bqnWJ9logohqx?=
 =?us-ascii?Q?ciO2W6a21E3i5UHwG6WGvLjaOkaefyHbJZhZ3YWT+q/2lPm3waV3EwNZJTP+?=
 =?us-ascii?Q?FSVWcB131o7tSScNJ2WRQU1dDLBPRSLbmm62yw2X9YTkWmqb23bhBViiFVKE?=
 =?us-ascii?Q?Egi5LidEfeLzE1UNs5WeSIHtL0ydoG8EwvlUz4UPalS5vdtmUUtnEz9aM7yk?=
 =?us-ascii?Q?BnwoFxx6PR2uV9XVY86eKvU3MNSHA1W78O46+ZQZslBhA5Ocqg5319WumgR3?=
 =?us-ascii?Q?bNfcerhpBfHUqdxPIRrTdpZXJLHt67Rk2qZpL41RQTtAoAfXSakq6UIox2sk?=
 =?us-ascii?Q?w9Lb/4iyT6GyaeMWNAmLDtjn9KMM4qyMrBVNdE2e2ptry2IuEw1MzZcdhgad?=
 =?us-ascii?Q?QcCanVYdbUmg64csL/tAtCVKr1SqHv3Z48GuOPWaJuD4ekFNFfcqjkBx59s5?=
 =?us-ascii?Q?D9hUNv7bqIR0aPu6F8OrAlcECjmm51zwj8omcnaHMhU7cN3yZlbFQZKT1bs2?=
 =?us-ascii?Q?XCs08MQk5F04xGqwlEgOkKVZ0+5Igwf+SV2bOnvXaWYIYf8ecve8kC9DWOhY?=
 =?us-ascii?Q?sJLQy7lBp4mmQkaCZnyS/5ugMqNMTQXNEg1oOKMKXJsKQYf8XxwJj/mGMF9t?=
 =?us-ascii?Q?BkkWIkr5nlRJkMz8MY7T3VNEHyG6L01MjYsBhODvdzeQdIzmNRCr0Z66aYUV?=
 =?us-ascii?Q?vZO6IOhKBKnELwO9nFxSn1n3xaznj+cGSWRMX1RadTrKqPHhNxGybwGPp6oV?=
 =?us-ascii?Q?J8NDP8wvFvqI/axPi4fLdCRu9e+ZpWbqVH2e5LT3JtmFTk61b1gRsrYqa3p6?=
 =?us-ascii?Q?6Is3dsShhtt0ma509coY9X2jFEGvf9DhFjYA6LdJk87v3LOu/sKGkiPiLY6f?=
 =?us-ascii?Q?TzFCVm9BTKR6hOyDXCCWSVHzWO1+setNyXgmM3xoGqY3GizSe/TvF486IrKR?=
 =?us-ascii?Q?y7wjOQIc44BynBxkbfEShPcztORv1Ruedr7zHkOgeRwrha6s3zjv8SvIdfbP?=
 =?us-ascii?Q?kfwpE9NZhPUICvMq7gstnwuG46qaOpEfY8H/5txr5nMtC35l2LGO/yHMyZFL?=
 =?us-ascii?Q?sBUvDT+3bc5+29xGS2I6leN8gVT4spYmStM82sfH4hPNZwBemdiXvsGTT0xe?=
 =?us-ascii?Q?xj7RJlCl+xVnLDaamjm6+mcYReE/qzgl0a6hcaTW6gbsG0REog=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3JUP+AwWx7IglKKOa29bTJxGThcMK98JJqvdySU+FF8/2TVkySgzCzrnF2du?=
 =?us-ascii?Q?sL3vqiyUIcOwYUdZ4fWYjzqcEKfLAfngHqq17JAU88qorcvjDiWlb0zJQLNe?=
 =?us-ascii?Q?s16sS8jzJFNmUwzxz/M9LEyw+eI7zun59hryLnL5VDFAZgy++3uLPbfzVLrp?=
 =?us-ascii?Q?FATV9BiveQ92WCwriQ/dNRa3U9lo36PAgiSW85OsBf2HaPp4IprLQpz1lK2d?=
 =?us-ascii?Q?MVGM5h5ShRoSa4PkSKuss71HVzNRduyH7Wt7Bk7qRKgxa1/8eif/gYcuXRtm?=
 =?us-ascii?Q?Ofknjr6zKivvQgquCldAlB1r0JYAAEyWFl002eYjqhpXknhVUhs+PsTKA4CT?=
 =?us-ascii?Q?HqYpCUo1SAQ8ZPImhbVX1Vhx0QIo8xTPGPHFLZn0ZEQUuOb+NERHGTjWed2z?=
 =?us-ascii?Q?mwDxEX29WIJ8pY9Zu2odcwjVbsCg8EByITL9SDx3usffoZYVZJIhLHDz8MQZ?=
 =?us-ascii?Q?D2BNKalM0ow2l9GzhWnZRFeUJOhDGL+YXwQ0MzNvZMHAwQDRvozefjknrvgE?=
 =?us-ascii?Q?HwvnLXh4qhLBmekzNqd7bCAggbNieGcnS5EOb0mAT6oBLVhJ9oYWSPoZKPao?=
 =?us-ascii?Q?skqTOuRJsUXphsD52+MfggeQVQ12fJiKWvS1Tk0SWDGPrbPh+inWzn8tiCUw?=
 =?us-ascii?Q?fO9ZzWiwsg0TsRC+o9uvn9EsfRKYp/gq87LivCB67qft9A8fQwOrxBMm0EO5?=
 =?us-ascii?Q?SheFwN1bkk9hGalakhX+qJC0ahETLFlfycstRnY7+hIzvo45mDOv/azVvUCF?=
 =?us-ascii?Q?L0lZHIXALJ2Y+IZoDZzW5Ok8EkFxsStbfOQ6qE+g1s0J3Ul6YLDEjafbnFmQ?=
 =?us-ascii?Q?ikXjGrdPQepJTo5P+T9hft9hM6CME31aezTXhLhcW4FEDTMFLSdusvJbHJx1?=
 =?us-ascii?Q?WnNSQUde3Yu+fAZp55r0KWURG2ApwDhumsigo+R9S5w2hkZjsHUldEtjKnTD?=
 =?us-ascii?Q?ypo2b1abm8eg5UYP6D1gdrJMess0lmoLD9zIggvDjExxX0/kP4Nw5kbnC75k?=
 =?us-ascii?Q?LXsdqWlwGCCRImiCdT3pOyttMxaO/AZPyYmVznLELSJJ+GgvRYp4GZL+s2Bj?=
 =?us-ascii?Q?VpDWgFESKyoidOVFVjgEO7V5Soj6py5LWPixGOKozgoWek0ZjvcagkcsutxM?=
 =?us-ascii?Q?aTGaMfG0aljfYBL3gEdxqqZlyMLeb+tarFrXXJjp/3o9hxwqEAO5eAXZvI92?=
 =?us-ascii?Q?xWFTqMiQgxHttl0bsmZVzmemNfV7J36LV56w8gKxAy97OS+XrRlBJGKUFXLC?=
 =?us-ascii?Q?FvFgRegV4kr5d+vZU9BbSjK8p++KIIMazf6tpLAp+e2QO22/y1xebYLgByMc?=
 =?us-ascii?Q?Qy4M0uJfAZX/X1ERc5Hd42qssF44hdb9RqtbnVieNCsx0U2Vna7/oToiIlvR?=
 =?us-ascii?Q?7BPkmP5nfp7g3+Rv490a/bV6CLh8gj3igmZVfeIIwc4kO9EyxiWzpaC/Umx0?=
 =?us-ascii?Q?YXryBvxtjHX5e47M4q5Mpp4N0wlg53Gf7CocZkZx/3bpwrdI4Z0eIFWF2wH8?=
 =?us-ascii?Q?ISbq/S/0Y/4C5VZNF7dk9OUbG0KhJIKM3/JKELEqKOyVob49fnD+gOPI+la4?=
 =?us-ascii?Q?V4Q+N1hW6ZXPYZZKDPMyoB0D/uE2BZq/gZ3GpyNwo4iKK2dtRbU8NEcztQ6p?=
 =?us-ascii?Q?QQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a7521aaa-e2c2-43fa-acab-08de3419efda
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 16:18:33.8131 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BTPhnG0b3lBo/pwyvgUl1oldf9NUufTf7/FgW/XR6fI2O2YTiY8gw5w2pwKl4KVG/R5FUDfZ+AGlPutKnliz61D4hiiTwgLw/ZS0LAPW+6s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5909
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

On Fri, Dec 05, 2025 at 10:36:15AM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe: expose PAT software table via debugfs (rev8)
> URL   : https://patchwork.freedesktop.org/series/157558/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-4196-462e41b32e734e43257cecb104fcbb5d08479c02_FULL -> xe-pw-157558v8_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.

Applied to drm-xe-next.  Thanks for the patches.


Matt

> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-157558v8_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-edp-1:
>     - shard-lnl:          NOTRUN -> [FAIL][1] ([Intel XE#6676]) +2 other tests fail
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-lnl-8/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-edp-1.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:
>     - shard-adlp:         [PASS][2] -> [FAIL][3] ([Intel XE#3908]) +1 other test fail
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4196-462e41b32e734e43257cecb104fcbb5d08479c02/shard-adlp-2/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-adlp-3/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
>     - shard-lnl:          NOTRUN -> [SKIP][4] ([Intel XE#1407]) +1 other test skip
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-lnl-8/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
>     - shard-adlp:         NOTRUN -> [SKIP][5] ([Intel XE#1124]) +6 other tests skip
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-adlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-16bpp-rotate-180:
>     - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#1124]) +4 other tests skip
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-bmg-2/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html
> 
>   * igt@kms_big_fb@y-tiled-32bpp-rotate-270:
>     - shard-adlp:         NOTRUN -> [SKIP][7] ([Intel XE#316]) +2 other tests skip
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-adlp-1/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html
> 
>   * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][8] ([Intel XE#1124])
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-dg2-435/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb:
>     - shard-adlp:         NOTRUN -> [SKIP][9] ([Intel XE#619])
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-adlp-4/igt@kms_big_fb@yf-tiled-addfb.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
>     - shard-lnl:          NOTRUN -> [SKIP][10] ([Intel XE#1124])
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-lnl-8/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html
> 
>   * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
>     - shard-bmg:          [PASS][11] -> [SKIP][12] ([Intel XE#367])
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4196-462e41b32e734e43257cecb104fcbb5d08479c02/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
> 
>   * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
>     - shard-adlp:         NOTRUN -> [SKIP][13] ([Intel XE#2191])
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-adlp-4/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
>     - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#367]) +1 other test skip
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-bmg-8/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
> 
>   * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
>     - shard-adlp:         NOTRUN -> [SKIP][15] ([Intel XE#367]) +1 other test skip
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-adlp-1/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html
> 
>   * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
>     - shard-adlp:         NOTRUN -> [SKIP][16] ([Intel XE#455] / [Intel XE#787]) +29 other tests skip
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-adlp-6/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-dp-2:
>     - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2652] / [Intel XE#787]) +8 other tests skip
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-bmg-2/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-dp-2.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][18] ([Intel XE#787]) +44 other tests skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-adlp-4/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-dg2-433/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs@pipe-a-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#787]) +6 other tests skip
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-dg2-433/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs@pipe-a-dp-4.html
> 
>   * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs:
>     - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#2887]) +1 other test skip
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-lnl-8/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#2907])
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
>     - shard-bmg:          NOTRUN -> [ABORT][23] ([Intel XE#6675]) +3 other tests abort
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#3432])
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2887]) +4 other tests skip
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
>     - shard-adlp:         NOTRUN -> [SKIP][26] ([Intel XE#2907]) +1 other test skip
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-adlp-4/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
> 
>   * igt@kms_cdclk@mode-transition:
>     - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2724])
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-bmg-8/igt@kms_cdclk@mode-transition.html
> 
>   * igt@kms_chamelium_color@ctm-0-50:
>     - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#306])
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-lnl-8/igt@kms_chamelium_color@ctm-0-50.html
> 
>   * igt@kms_chamelium_color@ctm-red-to-blue:
>     - shard-adlp:         NOTRUN -> [SKIP][29] ([Intel XE#306]) +2 other tests skip
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-adlp-6/igt@kms_chamelium_color@ctm-red-to-blue.html
> 
>   * igt@kms_chamelium_frames@dp-crc-single:
>     - shard-adlp:         NOTRUN -> [SKIP][30] ([Intel XE#373]) +5 other tests skip
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-adlp-4/igt@kms_chamelium_frames@dp-crc-single.html
> 
>   * igt@kms_chamelium_frames@hdmi-cmp-planes-random:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#373]) +1 other test skip
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-dg2-433/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
>     - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2252]) +1 other test skip
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-bmg-8/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
> 
>   * igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#373]) +2 other tests skip
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-lnl-8/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html
> 
>   * igt@kms_chamelium_sharpness_filter@filter-basic:
>     - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#6507])
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-adlp-6/igt@kms_chamelium_sharpness_filter@filter-basic.html
> 
>   * igt@kms_colorop@plane-xr24-xr24-ctm_3x4_bt709_enc_dec:
>     - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#6704]) +3 other tests skip
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-bmg-2/igt@kms_colorop@plane-xr24-xr24-ctm_3x4_bt709_enc_dec.html
> 
>   * igt@kms_colorop@plane-xr24-xr24-pq_eotf-pq_inv_eotf:
>     - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#6704]) +8 other tests skip
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-adlp-4/igt@kms_colorop@plane-xr24-xr24-pq_eotf-pq_inv_eotf.html
> 
>   * igt@kms_colorop@plane-xr30-xr30-multiply_125:
>     - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#6704])
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-lnl-8/igt@kms_colorop@plane-xr30-xr30-multiply_125.html
> 
>   * igt@kms_content_protection@legacy:
>     - shard-adlp:         NOTRUN -> [SKIP][38] ([Intel XE#455]) +24 other tests skip
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-adlp-4/igt@kms_content_protection@legacy.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-32x10:
>     - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#1424])
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-lnl-8/igt@kms_cursor_crc@cursor-offscreen-32x10.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-32x32:
>     - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2320]) +1 other test skip
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-bmg-8/igt@kms_cursor_crc@cursor-offscreen-32x32.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-512x512:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#308])
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-dg2-433/igt@kms_cursor_crc@cursor-offscreen-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-random-512x512:
>     - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#2321])
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-bmg-8/igt@kms_cursor_crc@cursor-random-512x512.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
>     - shard-adlp:         NOTRUN -> [SKIP][43] ([Intel XE#309]) +1 other test skip
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-adlp-6/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
>     - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#309])
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-lnl-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
>     - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#323])
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-adlp-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
> 
>   * igt@kms_fbcon_fbt@psr:
>     - shard-adlp:         NOTRUN -> [SKIP][46] ([Intel XE#776])
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-adlp-6/igt@kms_fbcon_fbt@psr.html
> 
>   * igt@kms_feature_discovery@chamelium:
>     - shard-adlp:         NOTRUN -> [SKIP][47] ([Intel XE#701])
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-adlp-1/igt@kms_feature_discovery@chamelium.html
> 
>   * igt@kms_flip@2x-plain-flip-interruptible:
>     - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#310]) +2 other tests skip
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-adlp-4/igt@kms_flip@2x-plain-flip-interruptible.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#1397]) +1 other test skip
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
>     - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2293] / [Intel XE#2380]) +2 other tests skip
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
>     - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#2293]) +2 other tests skip
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#1397] / [Intel XE#1745]) +1 other test skip
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-mmap-wc:
>     - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#651])
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#651]) +2 other tests skip
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:
>     - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#2311]) +9 other tests skip
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][56] ([Intel XE#656]) +33 other tests skip
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#4141]) +4 other tests skip
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#656]) +2 other tests skip
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw:
>     - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#651]) +7 other tests skip
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][60] ([Intel XE#653])
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
>     - shard-adlp:         NOTRUN -> [SKIP][61] ([Intel XE#653]) +12 other tests skip
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html
> 
>   * igt@kms_frontbuffer_tracking@plane-fbc-rte:
>     - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#2350])
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-bmg-8/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc:
>     - shard-adlp:         NOTRUN -> [SKIP][63] ([Intel XE#6312]) +1 other test skip
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#2313]) +9 other tests skip
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html
> 
>   * igt@kms_joiner@basic-force-big-joiner:
>     - shard-adlp:         NOTRUN -> [SKIP][65] ([Intel XE#2925] / [Intel XE#3012])
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-adlp-4/igt@kms_joiner@basic-force-big-joiner.html
> 
>   * igt@kms_joiner@basic-force-ultra-joiner:
>     - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#2934] / [Intel XE#6590])
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-bmg-8/igt@kms_joiner@basic-force-ultra-joiner.html
> 
>   * igt@kms_joiner@invalid-modeset-big-joiner:
>     - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#346] / [Intel XE#6590])
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-bmg-8/igt@kms_joiner@invalid-modeset-big-joiner.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [ABORT][68] ([Intel XE#6675]) +2 other tests abort
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-adlp-4/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:
>     - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#5825]) +4 other tests skip
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-bmg-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b.html
> 
>   * igt@kms_pm_backlight@basic-brightness:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([Intel XE#870])
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-dg2-433/igt@kms_pm_backlight@basic-brightness.html
> 
>   * igt@kms_pm_dc@dc5-psr:
>     - shard-adlp:         NOTRUN -> [SKIP][71] ([Intel XE#1129])
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-adlp-4/igt@kms_pm_dc@dc5-psr.html
> 
>   * igt@kms_pm_lpsp@kms-lpsp:
>     - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#2499])
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-bmg-8/igt@kms_pm_lpsp@kms-lpsp.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp:
>     - shard-adlp:         NOTRUN -> [SKIP][73] ([Intel XE#836])
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-adlp-6/igt@kms_pm_rpm@modeset-non-lpsp.html
> 
>   * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
>     - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#1406] / [Intel XE#1489]) +2 other tests skip
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-bmg-8/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html
> 
>   * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
>     - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#1406] / [Intel XE#2893])
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-lnl-8/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][76] ([Intel XE#1406] / [Intel XE#1489])
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-dg2-433/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html
> 
>   * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
>     - shard-adlp:         NOTRUN -> [SKIP][77] ([Intel XE#1406] / [Intel XE#1489]) +4 other tests skip
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-adlp-1/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html
> 
>   * igt@kms_psr2_su@page_flip-xrgb8888:
>     - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#1406] / [Intel XE#2387])
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-bmg-8/igt@kms_psr2_su@page_flip-xrgb8888.html
> 
>   * igt@kms_psr@fbc-psr2-basic:
>     - shard-adlp:         NOTRUN -> [SKIP][79] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +10 other tests skip
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-adlp-2/igt@kms_psr@fbc-psr2-basic.html
> 
>   * igt@kms_psr@pr-sprite-render:
>     - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-bmg-8/igt@kms_psr@pr-sprite-render.html
> 
>   * igt@kms_psr@psr-basic:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][81] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +2 other tests skip
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-dg2-433/igt@kms_psr@psr-basic.html
> 
>   * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>     - shard-adlp:         NOTRUN -> [SKIP][82] ([Intel XE#1406] / [Intel XE#2939] / [Intel XE#5585])
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-adlp-4/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
> 
>   * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
>     - shard-adlp:         NOTRUN -> [SKIP][83] ([Intel XE#1127])
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-adlp-4/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
>     - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#2330])
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-bmg-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
>     - shard-lnl:          NOTRUN -> [SKIP][85] ([Intel XE#3414] / [Intel XE#3904])
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-lnl-8/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
> 
>   * igt@kms_setmode@basic-clone-single-crtc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][86] ([Intel XE#455])
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-dg2-433/igt@kms_setmode@basic-clone-single-crtc.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-adlp:         NOTRUN -> [SKIP][87] ([Intel XE#362])
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-adlp-2/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@kms_vrr@cmrr@pipe-a-edp-1:
>     - shard-lnl:          [PASS][88] -> [FAIL][89] ([Intel XE#4459]) +1 other test fail
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4196-462e41b32e734e43257cecb104fcbb5d08479c02/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-lnl-1/igt@kms_vrr@cmrr@pipe-a-edp-1.html
> 
>   * igt@kms_vrr@lobf:
>     - shard-adlp:         NOTRUN -> [SKIP][90] ([Intel XE#2168])
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-adlp-1/igt@kms_vrr@lobf.html
> 
>   * igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01:
>     - shard-dg2-set2:     [PASS][91] -> [ABORT][92] ([Intel XE#6675]) +2 other tests abort
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4196-462e41b32e734e43257cecb104fcbb5d08479c02/shard-dg2-435/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01.html
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-dg2-463/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01.html
> 
>   * igt@xe_compute_preempt@compute-preempt-many-vram-evict:
>     - shard-adlp:         NOTRUN -> [SKIP][93] ([Intel XE#5191])
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-adlp-1/igt@xe_compute_preempt@compute-preempt-many-vram-evict.html
> 
>   * igt@xe_copy_basic@mem-copy-linear-0x369:
>     - shard-adlp:         NOTRUN -> [SKIP][94] ([Intel XE#1123]) +1 other test skip
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-adlp-6/igt@xe_copy_basic@mem-copy-linear-0x369.html
> 
>   * igt@xe_eu_stall@blocking-read:
>     - shard-adlp:         NOTRUN -> [SKIP][95] ([Intel XE#5626])
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-adlp-4/igt@xe_eu_stall@blocking-read.html
> 
>   * igt@xe_eudebug@basic-read-event:
>     - shard-adlp:         NOTRUN -> [SKIP][96] ([Intel XE#4837] / [Intel XE#5565]) +7 other tests skip
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-adlp-4/igt@xe_eudebug@basic-read-event.html
> 
>   * igt@xe_eudebug@basic-vm-access-faultable:
>     - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#4837]) +2 other tests skip
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-bmg-8/igt@xe_eudebug@basic-vm-access-faultable.html
> 
>   * igt@xe_eudebug_online@interrupt-all-set-breakpoint-faultable:
>     - shard-adlp:         NOTRUN -> [SKIP][98] ([Intel XE#4837] / [Intel XE#5565] / [Intel XE#6665]) +3 other tests skip
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-adlp-4/igt@xe_eudebug_online@interrupt-all-set-breakpoint-faultable.html
> 
>   * igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram:
>     - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#4837] / [Intel XE#6665])
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-bmg-8/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram.html
> 
>   * igt@xe_evict@evict-beng-mixed-threads-large:
>     - shard-adlp:         NOTRUN -> [SKIP][100] ([Intel XE#261]) +3 other tests skip
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-adlp-4/igt@xe_evict@evict-beng-mixed-threads-large.html
> 
>   * igt@xe_evict@evict-beng-small:
>     - shard-adlp:         NOTRUN -> [SKIP][101] ([Intel XE#261] / [Intel XE#5564] / [Intel XE#688]) +1 other test skip
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-adlp-1/igt@xe_evict@evict-beng-small.html
> 
>   * igt@xe_evict@evict-cm-threads-large:
>     - shard-lnl:          NOTRUN -> [SKIP][102] ([Intel XE#688])
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-lnl-8/igt@xe_evict@evict-cm-threads-large.html
> 
>   * igt@xe_evict@evict-threads-small:
>     - shard-adlp:         NOTRUN -> [SKIP][103] ([Intel XE#261] / [Intel XE#688])
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-adlp-1/igt@xe_evict@evict-threads-small.html
> 
>   * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:
>     - shard-adlp:         NOTRUN -> [SKIP][104] ([Intel XE#688])
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-adlp-4/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null:
>     - shard-adlp:         NOTRUN -> [SKIP][105] ([Intel XE#1392] / [Intel XE#5575]) +4 other tests skip
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-adlp-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html
> 
>   * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:
>     - shard-bmg:          NOTRUN -> [SKIP][106] ([Intel XE#2322]) +2 other tests skip
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-bmg-8/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html
> 
>   * igt@xe_exec_fault_mode@many-bindexecqueue-imm:
>     - shard-adlp:         NOTRUN -> [SKIP][107] ([Intel XE#288] / [Intel XE#5561]) +19 other tests skip
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-adlp-6/igt@xe_exec_fault_mode@many-bindexecqueue-imm.html
> 
>   * igt@xe_exec_reset@cm-cat-error:
>     - shard-adlp:         NOTRUN -> [DMESG-WARN][108] ([Intel XE#3868])
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-adlp-4/igt@xe_exec_reset@cm-cat-error.html
> 
>   * igt@xe_exec_system_allocator@once-large-mmap-free-huge-nomemset:
>     - shard-lnl:          NOTRUN -> [SKIP][109] ([Intel XE#4943])
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-lnl-4/igt@xe_exec_system_allocator@once-large-mmap-free-huge-nomemset.html
> 
>   * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-single-vma:
>     - shard-lnl:          NOTRUN -> [SKIP][110] ([Intel XE#6196])
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-lnl-8/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-single-vma.html
> 
>   * igt@xe_exec_system_allocator@processes-evict-malloc:
>     - shard-adlp:         NOTRUN -> [SKIP][111] ([Intel XE#4915]) +251 other tests skip
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-adlp-4/igt@xe_exec_system_allocator@processes-evict-malloc.html
> 
>   * igt@xe_exec_system_allocator@threads-many-stride-malloc-bo-unmap:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][112] ([Intel XE#4915]) +34 other tests skip
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-dg2-435/igt@xe_exec_system_allocator@threads-many-stride-malloc-bo-unmap.html
> 
>   * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge:
>     - shard-bmg:          NOTRUN -> [SKIP][113] ([Intel XE#4943]) +5 other tests skip
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-bmg-8/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge.html
> 
>   * igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:
>     - shard-adlp:         NOTRUN -> [SKIP][114] ([Intel XE#6281])
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-adlp-1/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html
> 
>   * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
>     - shard-lnl:          NOTRUN -> [SKIP][115] ([Intel XE#2229])
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-lnl-4/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
> 
>   * igt@xe_mmap@small-bar:
>     - shard-adlp:         NOTRUN -> [SKIP][116] ([Intel XE#512])
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-adlp-4/igt@xe_mmap@small-bar.html
> 
>   * igt@xe_mmap@vram:
>     - shard-adlp:         NOTRUN -> [SKIP][117] ([Intel XE#1008] / [Intel XE#5591])
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-adlp-1/igt@xe_mmap@vram.html
> 
>   * igt@xe_oa@buffer-size:
>     - shard-adlp:         NOTRUN -> [SKIP][118] ([Intel XE#6032])
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-adlp-4/igt@xe_oa@buffer-size.html
> 
>   * igt@xe_oa@non-system-wide-paranoid:
>     - shard-adlp:         NOTRUN -> [SKIP][119] ([Intel XE#3573]) +4 other tests skip
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-adlp-1/igt@xe_oa@non-system-wide-paranoid.html
> 
>   * igt@xe_oa@whitelisted-registers-userspace-config:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][120] ([Intel XE#3573])
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-dg2-433/igt@xe_oa@whitelisted-registers-userspace-config.html
> 
>   * igt@xe_pat@pat-index-xehpc:
>     - shard-adlp:         NOTRUN -> [SKIP][121] ([Intel XE#2838] / [Intel XE#979])
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-adlp-1/igt@xe_pat@pat-index-xehpc.html
> 
>   * igt@xe_pm@d3cold-i2c:
>     - shard-bmg:          NOTRUN -> [SKIP][122] ([Intel XE#5694])
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-bmg-8/igt@xe_pm@d3cold-i2c.html
> 
>   * igt@xe_pm@d3cold-multiple-execs:
>     - shard-adlp:         NOTRUN -> [SKIP][123] ([Intel XE#2284] / [Intel XE#366])
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-adlp-4/igt@xe_pm@d3cold-multiple-execs.html
> 
>   * igt@xe_pm@s2idle-vm-bind-userptr:
>     - shard-bmg:          [PASS][124] -> [ABORT][125] ([Intel XE#6675])
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4196-462e41b32e734e43257cecb104fcbb5d08479c02/shard-bmg-1/igt@xe_pm@s2idle-vm-bind-userptr.html
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-bmg-8/igt@xe_pm@s2idle-vm-bind-userptr.html
> 
>   * igt@xe_pm@s3-d3cold-basic-exec:
>     - shard-bmg:          NOTRUN -> [SKIP][126] ([Intel XE#2284])
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-bmg-8/igt@xe_pm@s3-d3cold-basic-exec.html
> 
>   * igt@xe_pm@s3-d3hot-basic-exec:
>     - shard-adlp:         [PASS][127] -> [ABORT][128] ([Intel XE#6675]) +3 other tests abort
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4196-462e41b32e734e43257cecb104fcbb5d08479c02/shard-adlp-6/igt@xe_pm@s3-d3hot-basic-exec.html
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-adlp-3/igt@xe_pm@s3-d3hot-basic-exec.html
> 
>   * igt@xe_pm@s3-mocs:
>     - shard-dg2-set2:     NOTRUN -> [ABORT][129] ([Intel XE#6675])
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-dg2-435/igt@xe_pm@s3-mocs.html
> 
>   * igt@xe_pxp@pxp-stale-bo-exec-post-suspend:
>     - shard-adlp:         NOTRUN -> [SKIP][130] ([Intel XE#4733] / [Intel XE#5594]) +1 other test skip
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-adlp-4/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html
> 
>   * igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:
>     - shard-bmg:          NOTRUN -> [SKIP][131] ([Intel XE#4733])
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-bmg-8/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html
> 
>   * igt@xe_pxp@pxp-stale-queue-post-termination-irq:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][132] ([Intel XE#4733])
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-dg2-435/igt@xe_pxp@pxp-stale-queue-post-termination-irq.html
> 
>   * igt@xe_query@multigpu-query-oa-units:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][133] ([Intel XE#944]) +1 other test skip
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-dg2-433/igt@xe_query@multigpu-query-oa-units.html
> 
>   * igt@xe_query@multigpu-query-topology-l3-bank-mask:
>     - shard-bmg:          NOTRUN -> [SKIP][134] ([Intel XE#944])
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-bmg-8/igt@xe_query@multigpu-query-topology-l3-bank-mask.html
> 
>   * igt@xe_query@multigpu-query-uc-fw-version-huc:
>     - shard-adlp:         NOTRUN -> [SKIP][135] ([Intel XE#944]) +3 other tests skip
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-adlp-4/igt@xe_query@multigpu-query-uc-fw-version-huc.html
> 
>   * igt@xe_sriov_scheduling@equal-throughput:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][136] ([Intel XE#4351])
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-dg2-433/igt@xe_sriov_scheduling@equal-throughput.html
> 
>   * igt@xe_sriov_vram@vf-access-provisioned:
>     - shard-adlp:         NOTRUN -> [SKIP][137] ([Intel XE#6376]) +1 other test skip
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-adlp-6/igt@xe_sriov_vram@vf-access-provisioned.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
>     - shard-dg2-set2:     [INCOMPLETE][138] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345] / [Intel XE#6168]) -> [PASS][139]
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4196-462e41b32e734e43257cecb104fcbb5d08479c02/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [INCOMPLETE][140] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#6168]) -> [PASS][141]
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4196-462e41b32e734e43257cecb104fcbb5d08479c02/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-64x64:
>     - shard-adlp:         [DMESG-WARN][142] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][143] +2 other tests pass
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4196-462e41b32e734e43257cecb104fcbb5d08479c02/shard-adlp-4/igt@kms_cursor_crc@cursor-rapid-movement-64x64.html
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-adlp-1/igt@kms_cursor_crc@cursor-rapid-movement-64x64.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
>     - shard-bmg:          [FAIL][144] ([Intel XE#5299]) -> [PASS][145]
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4196-462e41b32e734e43257cecb104fcbb5d08479c02/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
> 
>   * igt@kms_vblank@ts-continuation-suspend@pipe-a-dp-2:
>     - shard-bmg:          [ABORT][146] ([Intel XE#6675]) -> [PASS][147] +1 other test pass
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4196-462e41b32e734e43257cecb104fcbb5d08479c02/shard-bmg-4/igt@kms_vblank@ts-continuation-suspend@pipe-a-dp-2.html
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-bmg-1/igt@kms_vblank@ts-continuation-suspend@pipe-a-dp-2.html
> 
>   * igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-vram01-vram01:
>     - shard-dg2-set2:     [ABORT][148] ([Intel XE#6675]) -> [PASS][149] +1 other test pass
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4196-462e41b32e734e43257cecb104fcbb5d08479c02/shard-dg2-435/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-vram01-vram01.html
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-dg2-463/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-vram01-vram01.html
> 
>   * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma:
>     - shard-lnl:          [FAIL][150] ([Intel XE#5625]) -> [PASS][151]
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4196-462e41b32e734e43257cecb104fcbb5d08479c02/shard-lnl-2/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-lnl-8/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html
> 
>   * igt@xe_module_load@load:
>     - shard-bmg:          ([PASS][152], [PASS][153], [PASS][154], [PASS][155], [PASS][156], [PASS][157], [SKIP][158], [PASS][159], [PASS][160], [PASS][161], [PASS][162], [PASS][163], [PASS][164], [PASS][165], [PASS][166], [PASS][167], [PASS][168], [PASS][169], [PASS][170], [PASS][171], [PASS][172], [PASS][173], [PASS][174], [PASS][175], [PASS][176]) ([Intel XE#2457]) -> ([PASS][177], [PASS][178], [PASS][179], [PASS][180], [PASS][181], [PASS][182], [PASS][183], [PASS][184], [PASS][185], [PASS][186], [PASS][187], [PASS][188], [PASS][189], [PASS][190], [PASS][191], [PASS][192], [PASS][193], [PASS][194], [PASS][195], [PASS][196], [PASS][197], [PASS][198], [PASS][199], [PASS][200], [PASS][201])
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4196-462e41b32e734e43257cecb104fcbb5d08479c02/shard-bmg-6/igt@xe_module_load@load.html
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4196-462e41b32e734e43257cecb104fcbb5d08479c02/shard-bmg-8/igt@xe_module_load@load.html
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4196-462e41b32e734e43257cecb104fcbb5d08479c02/shard-bmg-1/igt@xe_module_load@load.html
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4196-462e41b32e734e43257cecb104fcbb5d08479c02/shard-bmg-1/igt@xe_module_load@load.html
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4196-462e41b32e734e43257cecb104fcbb5d08479c02/shard-bmg-1/igt@xe_module_load@load.html
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4196-462e41b32e734e43257cecb104fcbb5d08479c02/shard-bmg-1/igt@xe_module_load@load.html
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4196-462e41b32e734e43257cecb104fcbb5d08479c02/shard-bmg-1/igt@xe_module_load@load.html
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4196-462e41b32e734e43257cecb104fcbb5d08479c02/shard-bmg-3/igt@xe_module_load@load.html
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4196-462e41b32e734e43257cecb104fcbb5d08479c02/shard-bmg-2/igt@xe_module_load@load.html
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4196-462e41b32e734e43257cecb104fcbb5d08479c02/shard-bmg-2/igt@xe_module_load@load.html
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4196-462e41b32e734e43257cecb104fcbb5d08479c02/shard-bmg-8/igt@xe_module_load@load.html
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4196-462e41b32e734e43257cecb104fcbb5d08479c02/shard-bmg-5/igt@xe_module_load@load.html
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4196-462e41b32e734e43257cecb104fcbb5d08479c02/shard-bmg-3/igt@xe_module_load@load.html
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4196-462e41b32e734e43257cecb104fcbb5d08479c02/shard-bmg-3/igt@xe_module_load@load.html
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4196-462e41b32e734e43257cecb104fcbb5d08479c02/shard-bmg-3/igt@xe_module_load@load.html
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4196-462e41b32e734e43257cecb104fcbb5d08479c02/shard-bmg-4/igt@xe_module_load@load.html
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4196-462e41b32e734e43257cecb104fcbb5d08479c02/shard-bmg-4/igt@xe_module_load@load.html
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4196-462e41b32e734e43257cecb104fcbb5d08479c02/shard-bmg-6/igt@xe_module_load@load.html
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4196-462e41b32e734e43257cecb104fcbb5d08479c02/shard-bmg-2/igt@xe_module_load@load.html
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4196-462e41b32e734e43257cecb104fcbb5d08479c02/shard-bmg-6/igt@xe_module_load@load.html
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4196-462e41b32e734e43257cecb104fcbb5d08479c02/shard-bmg-6/igt@xe_module_load@load.html
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4196-462e41b32e734e43257cecb104fcbb5d08479c02/shard-bmg-8/igt@xe_module_load@load.html
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4196-462e41b32e734e43257cecb104fcbb5d08479c02/shard-bmg-8/igt@xe_module_load@load.html
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4196-462e41b32e734e43257cecb104fcbb5d08479c02/shard-bmg-4/igt@xe_module_load@load.html
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4196-462e41b32e734e43257cecb104fcbb5d08479c02/shard-bmg-5/igt@xe_module_load@load.html
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-bmg-3/igt@xe_module_load@load.html
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-bmg-3/igt@xe_module_load@load.html
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-bmg-3/igt@xe_module_load@load.html
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-bmg-2/igt@xe_module_load@load.html
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-bmg-5/igt@xe_module_load@load.html
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-bmg-5/igt@xe_module_load@load.html
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-bmg-4/igt@xe_module_load@load.html
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-bmg-4/igt@xe_module_load@load.html
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-bmg-8/igt@xe_module_load@load.html
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-bmg-1/igt@xe_module_load@load.html
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-bmg-1/igt@xe_module_load@load.html
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-bmg-4/igt@xe_module_load@load.html
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-bmg-3/igt@xe_module_load@load.html
>    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-bmg-1/igt@xe_module_load@load.html
>    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-bmg-1/igt@xe_module_load@load.html
>    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-bmg-6/igt@xe_module_load@load.html
>    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-bmg-5/igt@xe_module_load@load.html
>    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-bmg-4/igt@xe_module_load@load.html
>    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-bmg-8/igt@xe_module_load@load.html
>    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-bmg-2/igt@xe_module_load@load.html
>    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-bmg-2/igt@xe_module_load@load.html
>    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-bmg-2/igt@xe_module_load@load.html
>    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-bmg-8/igt@xe_module_load@load.html
>    [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-bmg-8/igt@xe_module_load@load.html
>    [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-bmg-6/igt@xe_module_load@load.html
>     - shard-adlp:         ([PASS][202], [PASS][203], [PASS][204], [PASS][205], [PASS][206], [PASS][207], [PASS][208], [PASS][209], [PASS][210], [PASS][211], [PASS][212], [PASS][213], [PASS][214], [PASS][215], [PASS][216], [SKIP][217], [PASS][218], [PASS][219], [PASS][220], [PASS][221], [PASS][222], [PASS][223], [PASS][224], [PASS][225], [PASS][226], [PASS][227]) ([Intel XE#378] / [Intel XE#5612]) -> ([PASS][228], [PASS][229], [PASS][230], [PASS][231], [PASS][232], [PASS][233], [PASS][234], [PASS][235], [PASS][236], [PASS][237], [PASS][238], [PASS][239], [PASS][240], [PASS][241], [PASS][242], [PASS][243], [PASS][244], [PASS][245], [PASS][246], [PASS][247], [PASS][248], [PASS][249], [PASS][250], [PASS][251], [PASS][252])
>    [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4196-462e41b32e734e43257cecb104fcbb5d08479c02/shard-adlp-6/igt@xe_module_load@load.html
>    [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4196-462e41b32e734e43257cecb104fcbb5d08479c02/shard-adlp-4/igt@xe_module_load@load.html
>    [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4196-462e41b32e734e43257cecb104fcbb5d08479c02/shard-adlp-3/igt@xe_module_load@load.html
>    [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4196-462e41b32e734e43257cecb104fcbb5d08479c02/shard-adlp-3/igt@xe_module_load@load.html
>    [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4196-462e41b32e734e43257cecb104fcbb5d08479c02/shard-adlp-9/igt@xe_module_load@load.html
>    [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4196-462e41b32e734e43257cecb104fcbb5d08479c02/shard-adlp-2/igt@xe_module_load@load.html
>    [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4196-462e41b32e734e43257cecb104fcbb5d08479c02/shard-adlp-9/igt@xe_module_load@load.html
>    [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4196-462e41b32e734e43257cecb104fcbb5d08479c02/shard-adlp-4/igt@xe_module_load@load.html
>    [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4196-462e41b32e734e43257cecb104fcbb5d08479c02/shard-adlp-4/igt@xe_module_load@load.html
>    [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4196-462e41b32e734e43257cecb104fcbb5d08479c02/shard-adlp-2/igt@xe_module_load@load.html
>    [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4196-462e41b32e734e43257cecb104fcbb5d08479c02/shard-adlp-2/igt@xe_module_load@load.html
>    [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4196-462e41b32e734e43257cecb104fcbb5d08479c02/shard-adlp-8/igt@xe_module_load@load.html
>    [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4196-462e41b32e734e43257cecb104fcbb5d08479c02/shard-adlp-8/igt@xe_module_load@load.html
>    [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4196-462e41b32e734e43257cecb104fcbb5d08479c02/shard-adlp-8/igt@xe_module_load@load.html
>    [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4196-462e41b32e734e43257cecb104fcbb5d08479c02/shard-adlp-1/igt@xe_module_load@load.html
>    [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4196-462e41b32e734e43257cecb104fcbb5d08479c02/shard-adlp-2/igt@xe_module_load@load.html
>    [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4196-462e41b32e734e43257cecb104fcbb5d08479c02/shard-adlp-1/igt@xe_module_load@load.html
>    [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4196-462e41b32e734e43257cecb104fcbb5d08479c02/shard-adlp-4/igt@xe_module_load@load.html
>    [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4196-462e41b32e734e43257cecb104fcbb5d08479c02/shard-adlp-9/igt@xe_module_load@load.html
>    [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4196-462e41b32e734e43257cecb104fcbb5d08479c02/shard-adlp-9/igt@xe_module_load@load.html
>    [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4196-462e41b32e734e43257cecb104fcbb5d08479c02/shard-adlp-1/igt@xe_module_load@load.html
>    [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4196-462e41b32e734e43257cecb104fcbb5d08479c02/shard-adlp-1/igt@xe_module_load@load.html
>    [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4196-462e41b32e734e43257cecb104fcbb5d08479c02/shard-adlp-6/igt@xe_module_load@load.html
>    [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4196-462e41b32e734e43257cecb104fcbb5d08479c02/shard-adlp-6/igt@xe_module_load@load.html
>    [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4196-462e41b32e734e43257cecb104fcbb5d08479c02/shard-adlp-6/igt@xe_module_load@load.html
>    [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4196-462e41b32e734e43257cecb104fcbb5d08479c02/shard-adlp-3/igt@xe_module_load@load.html
>    [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-adlp-6/igt@xe_module_load@load.html
>    [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-adlp-2/igt@xe_module_load@load.html
>    [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-adlp-3/igt@xe_module_load@load.html
>    [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-adlp-6/igt@xe_module_load@load.html
>    [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-adlp-6/igt@xe_module_load@load.html
>    [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-adlp-1/igt@xe_module_load@load.html
>    [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-adlp-1/igt@xe_module_load@load.html
>    [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-adlp-8/igt@xe_module_load@load.html
>    [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-adlp-8/igt@xe_module_load@load.html
>    [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-adlp-6/igt@xe_module_load@load.html
>    [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-adlp-2/igt@xe_module_load@load.html
>    [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-adlp-1/igt@xe_module_load@load.html
>    [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-adlp-1/igt@xe_module_load@load.html
>    [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-adlp-4/igt@xe_module_load@load.html
>    [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-adlp-2/igt@xe_module_load@load.html
>    [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-adlp-9/igt@xe_module_load@load.html
>    [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-adlp-9/igt@xe_module_load@load.html
>    [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-adlp-9/igt@xe_module_load@load.html
>    [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-adlp-3/igt@xe_module_load@load.html
>    [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-adlp-3/igt@xe_module_load@load.html
>    [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-adlp-8/igt@xe_module_load@load.html
>    [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-adlp-4/igt@xe_module_load@load.html
>    [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-adlp-8/igt@xe_module_load@load.html
>    [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-adlp-4/igt@xe_module_load@load.html
>    [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-adlp-4/igt@xe_module_load@load.html
> 
>   * igt@xe_pm@s2idle-basic:
>     - shard-lnl:          [ABORT][253] ([Intel XE#6675]) -> [PASS][254] +1 other test pass
>    [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4196-462e41b32e734e43257cecb104fcbb5d08479c02/shard-lnl-4/igt@xe_pm@s2idle-basic.html
>    [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-lnl-4/igt@xe_pm@s2idle-basic.html
> 
>   * igt@xe_pm@s3-multiple-execs:
>     - shard-adlp:         [ABORT][255] ([Intel XE#6675]) -> [PASS][256] +4 other tests pass
>    [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4196-462e41b32e734e43257cecb104fcbb5d08479c02/shard-adlp-6/igt@xe_pm@s3-multiple-execs.html
>    [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-adlp-6/igt@xe_pm@s3-multiple-execs.html
> 
>   * igt@xe_sriov_scheduling@nonpreempt-engine-resets:
>     - shard-bmg:          [ABORT][257] -> [PASS][258] +1 other test pass
>    [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4196-462e41b32e734e43257cecb104fcbb5d08479c02/shard-bmg-1/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html
>    [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-bmg-8/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_hdr@brightness-with-hdr:
>     - shard-bmg:          [SKIP][259] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][260] ([Intel XE#3544])
>    [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4196-462e41b32e734e43257cecb104fcbb5d08479c02/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html
>    [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1008]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008
>   [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
>   [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
>   [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>   [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
>   [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
>   [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
>   [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
>   [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
>   [Intel XE#2499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499
>   [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
>   [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
>   [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
>   [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
>   [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
>   [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
>   [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
>   [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
>   [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
>   [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
>   [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>   [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
>   [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
>   [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
>   [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
>   [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
>   [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
>   [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
>   [Intel XE#3868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868
>   [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
>   [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
>   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>   [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
>   [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
>   [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
>   [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
>   [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
>   [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
>   [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
>   [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
>   [Intel XE#5191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5191
>   [Intel XE#5299]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299
>   [Intel XE#5561]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561
>   [Intel XE#5564]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564
>   [Intel XE#5565]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5565
>   [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
>   [Intel XE#5585]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5585
>   [Intel XE#5591]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5591
>   [Intel XE#5594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5594
>   [Intel XE#5612]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5612
>   [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
>   [Intel XE#5626]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5626
>   [Intel XE#5694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694
>   [Intel XE#5825]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5825
>   [Intel XE#6032]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6032
>   [Intel XE#6168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168
>   [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
>   [Intel XE#6196]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6196
>   [Intel XE#6281]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6281
>   [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
>   [Intel XE#6376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6376
>   [Intel XE#6507]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#6590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6590
>   [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
>   [Intel XE#6675]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6675
>   [Intel XE#6676]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6676
>   [Intel XE#6704]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6704
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
>   [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-4196-462e41b32e734e43257cecb104fcbb5d08479c02 -> xe-pw-157558v8
> 
>   IGT_8655: 8655
>   xe-4196-462e41b32e734e43257cecb104fcbb5d08479c02: 462e41b32e734e43257cecb104fcbb5d08479c02
>   xe-pw-157558v8: 157558v8
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v8/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
