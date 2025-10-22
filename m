Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82FC5CCD1AB
	for <intel-xe@archiver.kernel.org>; Wed, 22 Oct 2025 17:26:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4677710E16C;
	Wed, 22 Oct 2025 17:26:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eRf8O9Ab";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7853D10E16C
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Oct 2025 17:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761154012; x=1792690012;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=dBRGgtle9ppozs6/4bOckHALKDXwL0pkDTTl0TYAKK4=;
 b=eRf8O9AbTFjgxL5tMGTiFXCbpt4eDMfN5/ReRSNTrc0ooRvgqmiRekHx
 agb7NOGUTSCI4ipfiU5ldxgAbOWCIwI2LzOk1N7Y7djVNKR5Aff5KNVs+
 RKm5a7ZDv8wc/VSLZEz0uWZWRO4hrQBAnMv7u9Yyz0jkkiQRPan0zlcZn
 pcTbHTfFHMaTPGLLv2iJqUId0zzs1Ku18qCs0w+3q4N6obiYxmAOTdRRY
 XMLqYyUuDn0nr6IpJVCRbTQ7wxqv5FMLcjpIwS9SkNxtN9SnG0cwP4jxI
 uCxlJfBrxzlDSGb7j/5M3l6bLmDe1tlA80nCEqLq8onNNO3gMzpdeexBR g==;
X-CSE-ConnectionGUID: 7pC+NnUpQGO8iDsq1jn1TQ==
X-CSE-MsgGUID: etlzZoBcQt60CrUXsJtAsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63206772"
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="63206772"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 10:26:51 -0700
X-CSE-ConnectionGUID: hFuoMrv1RLqAAUu0hCWR6A==
X-CSE-MsgGUID: JnomhA0RR2irG+TMvwF/Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="221123707"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 10:26:51 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 10:26:50 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 22 Oct 2025 10:26:50 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.49) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 10:26:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eEr2O6D8EKtFqsdXATDTRVMBuuP45oyoKC7a0/4lcFiBsLDM/2EZQN38vs7I5Y2+waopuk90mJB0e5zZPioB14dJH8kUsK6or0iK2DVs0G4xvJIDOGbncgaqLSW3nIg3HNvAwmk3eDu/Ux8J+7gn0PitcZoSdxgy5JKmtipemKOzcmqFkpy2xA54e4ToaYZ1Dq5QkkGStag+C149NTa3kbFzgPoiKotdBzt7csjBbn104Rf/+/NfzLYmG9Oi7Vn7+HAEjFHsgDFnQ8v1OWbgm8n9erWaghtwUtffBiWbeQeyeIutPq/YTpz/Fu4wGK9gB08liCZuKkWlS4ZDxQwPTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7CMHlrHD39Wa/5CzMtroFxTTtzNonQrfXRqc91to9hQ=;
 b=khcaXKV16Db8wLgNPkFuT+OHu3/OsQoI+M7Bt8m5yQ25/jT9iwofbQIMtm2Qi1jKjFO2cBaflt7WVx+onfxiqKkA83YOsaKiKHpH9lnho7lpKf8zHteiY1zt6lr57j2GcmEAEKaRwP/R9T2aqVkmRNNBbEuT399z4ZpAME7Z5JTgI4Z+Y/ri1Uu2H1aPZ1gY4jBmDMICxhhz0EfoJC5K8O0JBLzLB/RM7x/n66ZFeKLITSWpYa8DhS9R0zyse1klbEnpw0cc6A89YRsjMBn1Wo0BmkK+s6Dmm6I6Hb6PHpSi7w6IOvNPrWWzHEbYOBXaPxhaNOvvKhMS43uCKHVKtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB7022.namprd11.prod.outlook.com (2603:10b6:510:222::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Wed, 22 Oct
 2025 17:26:46 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9228.015; Wed, 22 Oct 2025
 17:26:46 +0000
Date: Wed, 22 Oct 2025 10:26:43 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw6IGZhaWx1?= =?utf-8?Q?re_fo?=
 =?utf-8?Q?r?= Improve VMA merging for CPU-address-mirrored mappings (rev2)
Message-ID: <aPkT0+C5pkeWOiEU@lstrano-desk.jf.intel.com>
References: <20251022041649.626645-1-himal.prasad.ghimiray@intel.com>
 <176111659521.39919.4980445510221908832@97596180aaec>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <176111659521.39919.4980445510221908832@97596180aaec>
X-ClientProxiedBy: MW4P221CA0014.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB7022:EE_
X-MS-Office365-Filtering-Correlation-Id: 6055f982-e790-4aaa-6df0-08de11902d04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UkTxkbYxkUCsdrlSG+62k+q03WIADfHJUSe7eadpW9TVVNx4dc135sJynGn1?=
 =?us-ascii?Q?M/hFOrEPhwJisj/J8cQCzXdCg2l6CcYzIa+gqo0Xk+7e7xcT5Jii6ZdVu1uc?=
 =?us-ascii?Q?vLkIGUznJXcbiUTUciN+7u2OOefJuaqwoTBTqMwLcmxkOxggz3ZGGOLlZciY?=
 =?us-ascii?Q?VaoPwVOM8Y3VyhWSamdC8jtub4meGmJaNWC2FzhPsjY6tbXKeOLP1R+fe7DO?=
 =?us-ascii?Q?csQ6D+ec0TiC6cLCWG9mK8s9N8HOPjbeZA0NEes4dT49QuPVYA6mMKVXgGg0?=
 =?us-ascii?Q?AGyx20N8jK7a0xYMZpeLZ9hl39jDgcm+3S40xg8/2RuVrG9eSv/7WM7cQGwQ?=
 =?us-ascii?Q?dinKhAhDxAeDO47vUrtK3OKhg3+8+9Fk+1/WL5fAXcLzMozOr4ZKPneiFWHx?=
 =?us-ascii?Q?d+NKIpk10KZZevjuAYnonSNunWH4R+hilTb/XfRYkFRtJ2teZEOcFq85We+H?=
 =?us-ascii?Q?/6j4gI04iAJOFhXySNQIo3jHKOqL26zmOq8gd/xv8isCRFm6iblP+ZVcEA5a?=
 =?us-ascii?Q?M0UGDK3wJaXXlKpTyYWcJvgev5k38i1ExhRVbkk69Sh7B9vSZYadua/9kNcJ?=
 =?us-ascii?Q?vcnFS+w1OSJd3BHmAiECx40XKzvBhLy52zRTzm4pWQrikZHIbHKmDuhiIVMA?=
 =?us-ascii?Q?VAAcCEVdpZTYBl2UAP06Ta+HesssxlfAKX44n9HhFq4fTcompu1W9RWxB1Pr?=
 =?us-ascii?Q?TdLiT3M9HlMk/s3yyks2wRshhuIaSCJxTxz7HB/fErLm5m/Ezq0XNnjJe1rD?=
 =?us-ascii?Q?b8kWVsq83UaNldb4qebkw3WO7T6XE8Q2Yj44Jr0IHIoYWmkz1FZtf7s+nQvc?=
 =?us-ascii?Q?HNmRdwSfZpAsmyLFOU2xsDTRrxbXl1DVbeLR+PZZ0yGj3cByOdx7QvPtJUAW?=
 =?us-ascii?Q?kUVjU+ubwColStpY8eHAFh38+celkiEQ5ariv6DzxzI2a8sursm2dE15qjnM?=
 =?us-ascii?Q?1543tZIsb+f03ZRS09p/Yk4rBhNKTa3LvI5VQ3kb0RU4OQJEjv7OVHo9Kxpa?=
 =?us-ascii?Q?TAyJZOg6ugln7zf24kQ6eTfAxJYZGpYirEB/HTRgrAPRBBH+gtaqW6NDN2iZ?=
 =?us-ascii?Q?tZfWITV/9OXofLQiruUveIkYavOtdeSc/FxqYxcdkBFGWUzIhyjJUQd08Htz?=
 =?us-ascii?Q?m+vHyBIaLu02WlxmAr2cYX5wjaxKEjRFlAT7lmTpPuvn72ekP/XzSKGkDsmB?=
 =?us-ascii?Q?qTdabyOEEafx1abl8mheEGrxQzFd98YcrfRWcfEnga5X0Sy1GLores5DKwCJ?=
 =?us-ascii?Q?nW7MDZNH8fDk8dEo3XGHdZGtYfHL3/NKN4n5jF+8xXikMjCkmVfQT57Lgs3v?=
 =?us-ascii?Q?iff938BA08rcx1q78f7aHF8trXsVVz/COFVIq0UtiEkwjXz49NCJv8mJTH+L?=
 =?us-ascii?Q?zDFJ3rF1LmeESzv/T5BNjF9W+4gOXBgP4pHqEUBMJ0v65rRpcA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?71GpoCnkHlv6H93eJ4L9U0/rp7rDTTFuGGaKE8rLElEhZWa4QWbAOx34D/Bx?=
 =?us-ascii?Q?I9mgvUqySqMFIBYIjjZtJtSWQLAgRC5RKOFd45gg4Ryx804YvxEWGNiKvN4r?=
 =?us-ascii?Q?zl1rw2jqVryfgc/O2q2DGrMmOQDxJeil41eBIrn07ixIkmgHNiGUZDbHcZWi?=
 =?us-ascii?Q?SfYnw1ojILZtHEcJkU2EviD5bpTqFpgW4DCokKa/1zWJiJ2Rv9ZnWc7RuEa8?=
 =?us-ascii?Q?90oCAmXO6VwvVgXknqGtYLuvuIMjnP4DCn+ElHXzN+qD/7V1YDsvJFPq76n9?=
 =?us-ascii?Q?n4N/gTKRt4py5Bp/g8AOvO6ld2x+GnIvdGe5/PTZlC8wMvjrkWQqvMlDHGl4?=
 =?us-ascii?Q?BXO0CHBxlMxh2R8mzv1IfA0zjPhbqNhmy3t+nAvNRGYON1xMU7TLz6dEvigJ?=
 =?us-ascii?Q?umn0affg6cZuyOm2nfcM5+yZgQar8HKz+8I2GTVVpF1T+ZU/UyKZmO+C2IEB?=
 =?us-ascii?Q?5GSgPttlD8cVMlMFTBteFsjdFJONVyXsykI0nO33INUdzbubze2tmDTIE+K6?=
 =?us-ascii?Q?d56sioAXVnUirJfbFhqYjYR0MCso0hrwKVizPbwgRsnOF3Xrj9dg3usU88Xc?=
 =?us-ascii?Q?Bm1e/kX0kJmHo9TGOeaEWOzUE4i5sg6bz2Iw//7dz03VGD5czeNl13aQH0o4?=
 =?us-ascii?Q?b/rQc+wohFiYLrnU8Rx3dWC/0QZXBLA50fsYG91FiUJm0n6jRelfwjTc9w6q?=
 =?us-ascii?Q?aAtUZ2oCqKpNaZNVDvn0BgOjLXci8mz3D8K+dlE4ePyypNRp87y53dnusTMy?=
 =?us-ascii?Q?xx3b0x6pA7aBGV/CYvgqoaG5U52oCEp7GxcOcwD85q7zXgYeeEQtVm6OQXKv?=
 =?us-ascii?Q?KkHmMrLHmGo/O62MqSr2ajnZr+Kd0zM1Fu1CobgRolk5p6/U9Wq9+ZpPL8VR?=
 =?us-ascii?Q?d2qw/klzTkdNmndwFCjh2jOHhlwbe5XlzhmJtd+HVf0qm1i41zD3R0xr9RZp?=
 =?us-ascii?Q?cSM2AcNb5a/bmdYrJMX7VRHNx/W25zIzeqoGg+HRSOVTg2ZAsQyUCFpO/d8S?=
 =?us-ascii?Q?uXbzaNfUloSrWAOEm9jrVxMYSrT3q+fd+5ZCGqKMLPxDFNtooSsPUj7qZNlB?=
 =?us-ascii?Q?gzPjWJ+Z5IkYItRfsgchSnDIYME1ZriS/4NNIdRjIgKZMpL537QDITtbAcVr?=
 =?us-ascii?Q?vYPpkUNcF/yY4N7n+cwgAbomkrB0wGorMDnsW6pcFUL1rtpAs2atoXs1QuuK?=
 =?us-ascii?Q?xJ/nYwAR+oiB4JvPIk58DjpNk2Prfw8Kp10NUMUBp8IMN0wC+PJvZ8RfJyY7?=
 =?us-ascii?Q?7bQX3nlkc2H4gkgFajlR+IXPGg74rM9oYPFsgEYQwOaLk8ekXRtBjAvBBESz?=
 =?us-ascii?Q?nW1A2kMnvetvbiQLi31oAnuTQBKE7X/QFDAotlijknfk1UV3B+/39eLmLA5W?=
 =?us-ascii?Q?TFZxSCpf5ODXUbJ3169iLi8XgKfKyQDOgUR8LWky/9bUOBPtfa0ouz0FgXhO?=
 =?us-ascii?Q?WH/BWy//fys6FB35nB/+he++th9bvG5LXVWdjAUJXTAT++2CymFnCdC0BcOP?=
 =?us-ascii?Q?YHgKa/gro0uogPg8RHgzZiBRzOyqOX/3jx/3EKRIYPnZLxBrl1CgoOqJ/Ckl?=
 =?us-ascii?Q?5Uut4FTehi51hsNYmp4motRK67LSd56w5cFqzYIQ9eZRNzYELDwX2oG4UXIT?=
 =?us-ascii?Q?ig=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6055f982-e790-4aaa-6df0-08de11902d04
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 17:26:46.3803 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: khVfA6jYB96Nhq+yMiFyzyF+KhLznSmJxSTBH/LPopASltT98h/MtrIvGvcex/3GUOB1abf4jX5ghAEa16nfCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7022
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

On Wed, Oct 22, 2025 at 07:03:15AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Improve VMA merging for CPU-address-mirrored mappings (rev2)
> URL   : https://patchwork.freedesktop.org/series/154832/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687_FULL -> xe-pw-154832v2_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-154832v2_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-154832v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-154832v2_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset:
>     - shard-lnl:          [PASS][1] -> [FAIL][2] +9 other tests fail
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-lnl-5/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v2/shard-lnl-5/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html
> 
>   * igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset:
>     - shard-bmg:          [PASS][3] -> [FAIL][4] +9 other tests fail
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v2/shard-bmg-7/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html
> 

I think the above CI failures need to be figured out. A bit overloaded
with reviews atm, so going to defer looking here until the above
failures are fixed.

Matt

>   * igt@xe_vm@munmap-style-unbind-userptr-inval-front:
>     - shard-adlp:         [PASS][5] -> [INCOMPLETE][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-4/igt@xe_vm@munmap-style-unbind-userptr-inval-front.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v2/shard-adlp-9/igt@xe_vm@munmap-style-unbind-userptr-inval-front.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-154832v2_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_addfb_basic@addfb25-y-tiled-legacy:
>     - shard-adlp:         [PASS][7] -> [DMESG-WARN][8] ([Intel XE#2953] / [Intel XE#4173]) +9 other tests dmesg-warn
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-3/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v2/shard-adlp-1/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html
> 
>   * igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-1:
>     - shard-adlp:         [PASS][9] -> [DMESG-WARN][10] ([Intel XE#4543]) +9 other tests dmesg-warn
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-2/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-1.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v2/shard-adlp-2/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-1.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1:
>     - shard-lnl:          [PASS][11] -> [FAIL][12] ([Intel XE#6054]) +3 other tests fail
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v2/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
>     - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#1124])
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v2/shard-bmg-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
>     - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#367])
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v2/shard-bmg-4/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:
>     - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2652] / [Intel XE#787]) +8 other tests skip
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v2/shard-bmg-4/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:
>     - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2887])
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v2/shard-bmg-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
>     - shard-bmg:          [PASS][17] -> [INCOMPLETE][18] ([Intel XE#3862]) +1 other test incomplete
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v2/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [PASS][19] -> [DMESG-WARN][20] ([Intel XE#1727] / [Intel XE#3113])
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     [PASS][21] -> [INCOMPLETE][22] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_chamelium_frames@dp-crc-single:
>     - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2252]) +2 other tests skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v2/shard-bmg-4/igt@kms_chamelium_frames@dp-crc-single.html
> 
>   * igt@kms_content_protection@atomic:
>     - shard-bmg:          NOTRUN -> [FAIL][24] ([Intel XE#1178]) +2 other tests fail
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v2/shard-bmg-4/igt@kms_content_protection@atomic.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-64x21:
>     - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2320]) +1 other test skip
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v2/shard-bmg-4/igt@kms_cursor_crc@cursor-onscreen-64x21.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
>     - shard-bmg:          [PASS][26] -> [SKIP][27] ([Intel XE#2291]) +3 other tests skip
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-3/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v2/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
> 
>   * igt@kms_display_modes@extended-mode-basic:
>     - shard-bmg:          [PASS][28] -> [SKIP][29] ([Intel XE#4302])
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-4/igt@kms_display_modes@extended-mode-basic.html
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v2/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html
> 
>   * igt@kms_dsc@dsc-with-output-formats:
>     - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2244])
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v2/shard-bmg-4/igt@kms_dsc@dsc-with-output-formats.html
> 
>   * igt@kms_flip@2x-plain-flip:
>     - shard-bmg:          [PASS][31] -> [SKIP][32] ([Intel XE#2316]) +6 other tests skip
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-8/igt@kms_flip@2x-plain-flip.html
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v2/shard-bmg-6/igt@kms_flip@2x-plain-flip.html
> 
>   * igt@kms_flip@absolute-wf_vblank-interruptible@c-hdmi-a6:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][33] ([Intel XE#2049])
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v2/shard-dg2-436/igt@kms_flip@absolute-wf_vblank-interruptible@c-hdmi-a6.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank:
>     - shard-dg2-set2:     [PASS][34] -> [FAIL][35] ([Intel XE#301])
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank.html
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v2/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@c-dp4:
>     - shard-dg2-set2:     [PASS][36] -> [FAIL][37] ([Intel XE#301] / [Intel XE#3321])
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v2/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#455]) +1 other test skip
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v2/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y:
>     - shard-adlp:         [PASS][39] -> [FAIL][40] ([Intel XE#1874])
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y.html
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v2/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y:
>     - shard-adlp:         [PASS][41] -> [DMESG-FAIL][42] ([Intel XE#4543])
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v2/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#2311]) +1 other test skip
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v2/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#5390]) +1 other test skip
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#2313]) +4 other tests skip
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html
> 
>   * igt@kms_hdr@static-toggle-dpms:
>     - shard-bmg:          [PASS][46] -> [SKIP][47] ([Intel XE#1503])
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-3/igt@kms_hdr@static-toggle-dpms.html
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v2/shard-bmg-6/igt@kms_hdr@static-toggle-dpms.html
> 
>   * igt@kms_joiner@basic-ultra-joiner:
>     - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#2927])
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v2/shard-bmg-4/igt@kms_joiner@basic-ultra-joiner.html
> 
>   * igt@kms_plane_scaling@2x-scaler-multi-pipe:
>     - shard-bmg:          [PASS][49] -> [SKIP][50] ([Intel XE#2571])
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-4/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v2/shard-bmg-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
> 
>   * igt@kms_pm_dc@dc3co-vpb-simulation:
>     - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#2391])
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v2/shard-bmg-4/igt@kms_pm_dc@dc3co-vpb-simulation.html
> 
>   * igt@kms_psr@fbc-pr-basic:
>     - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850])
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v2/shard-bmg-4/igt@kms_psr@fbc-pr-basic.html
> 
>   * igt@kms_psr@fbc-psr-sprite-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][53] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929])
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v2/shard-dg2-436/igt@kms_psr@fbc-psr-sprite-blt.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
>     - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#3414] / [Intel XE#3904])
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v2/shard-bmg-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
> 
>   * igt@kms_vrr@cmrr@pipe-a-edp-1:
>     - shard-lnl:          [PASS][55] -> [FAIL][56] ([Intel XE#4459]) +1 other test fail
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v2/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html
> 
>   * igt@xe_eudebug@basic-exec-queues:
>     - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#4837]) +2 other tests skip
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v2/shard-bmg-4/igt@xe_eudebug@basic-exec-queues.html
> 
>   * igt@xe_exec_balancer@once-parallel-userptr-invalidate:
>     - shard-adlp:         [PASS][58] -> [DMESG-FAIL][59] ([Intel XE#3876]) +2 other tests dmesg-fail
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-4/igt@xe_exec_balancer@once-parallel-userptr-invalidate.html
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v2/shard-adlp-9/igt@xe_exec_balancer@once-parallel-userptr-invalidate.html
> 
>   * igt@xe_exec_basic@many-null-defer-bind:
>     - shard-adlp:         [PASS][60] -> [DMESG-WARN][61] ([Intel XE#3876])
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-4/igt@xe_exec_basic@many-null-defer-bind.html
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v2/shard-adlp-9/igt@xe_exec_basic@many-null-defer-bind.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-rebind:
>     - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#2322]) +1 other test skip
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v2/shard-bmg-4/igt@xe_exec_basic@multigpu-no-exec-rebind.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#288]) +1 other test skip
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v2/shard-dg2-436/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate.html
> 
>   * igt@xe_exec_reset@cm-gt-reset:
>     - shard-adlp:         [PASS][64] -> [FAIL][65] ([Intel XE#6325])
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-4/igt@xe_exec_reset@cm-gt-reset.html
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v2/shard-adlp-9/igt@xe_exec_reset@cm-gt-reset.html
> 
>   * igt@xe_exec_system_allocator@threads-many-mmap-free-nomemset:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#4915]) +7 other tests skip
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v2/shard-dg2-436/igt@xe_exec_system_allocator@threads-many-mmap-free-nomemset.html
> 
>   * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge:
>     - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#4943]) +3 other tests skip
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v2/shard-bmg-4/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge.html
> 
>   * igt@xe_exec_threads@threads-cm-rebind:
>     - shard-adlp:         [PASS][68] -> [FAIL][69] ([Intel XE#5625]) +2 other tests fail
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-4/igt@xe_exec_threads@threads-cm-rebind.html
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v2/shard-adlp-9/igt@xe_exec_threads@threads-cm-rebind.html
> 
>   * igt@xe_module_load@force-load:
>     - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#2457])
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v2/shard-bmg-4/igt@xe_module_load@force-load.html
> 
>   * igt@xe_pm@s2idle-exec-after:
>     - shard-adlp:         [PASS][71] -> [TIMEOUT][72] ([Intel XE#3876])
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-4/igt@xe_pm@s2idle-exec-after.html
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v2/shard-adlp-9/igt@xe_pm@s2idle-exec-after.html
> 
>   * igt@xe_pm_residency@gt-c6-freeze@gt0:
>     - shard-adlp:         [PASS][73] -> [DMESG-FAIL][74] ([Intel XE#5545]) +1 other test dmesg-fail
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-4/igt@xe_pm_residency@gt-c6-freeze@gt0.html
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v2/shard-adlp-9/igt@xe_pm_residency@gt-c6-freeze@gt0.html
> 
>   * igt@xe_query@multigpu-query-cs-cycles:
>     - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#944])
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v2/shard-bmg-4/igt@xe_query@multigpu-query-cs-cycles.html
> 
>   * igt@xe_sriov_auto_provisioning@fair-allocation:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][76] ([Intel XE#4130])
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v2/shard-dg2-436/igt@xe_sriov_auto_provisioning@fair-allocation.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@core_hotunplug@hotrebind-lateclose:
>     - shard-adlp:         [DMESG-WARN][77] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][78]
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-9/igt@core_hotunplug@hotrebind-lateclose.html
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v2/shard-adlp-9/igt@core_hotunplug@hotrebind-lateclose.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
>     - shard-bmg:          [SKIP][79] ([Intel XE#2291]) -> [PASS][80] +3 other tests pass
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v2/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
> 
>   * igt@kms_dp_link_training@non-uhbr-sst:
>     - shard-bmg:          [SKIP][81] ([Intel XE#4354]) -> [PASS][82]
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-6/igt@kms_dp_link_training@non-uhbr-sst.html
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v2/shard-bmg-4/igt@kms_dp_link_training@non-uhbr-sst.html
> 
>   * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
>     - shard-bmg:          [SKIP][83] ([Intel XE#2316]) -> [PASS][84] +5 other tests pass
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v2/shard-bmg-8/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
> 
>   * igt@kms_flip@absolute-wf_vblank-interruptible@b-hdmi-a6:
>     - shard-dg2-set2:     [INCOMPLETE][85] ([Intel XE#2049]) -> [PASS][86]
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-dg2-466/igt@kms_flip@absolute-wf_vblank-interruptible@b-hdmi-a6.html
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v2/shard-dg2-436/igt@kms_flip@absolute-wf_vblank-interruptible@b-hdmi-a6.html
> 
>   * igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1:
>     - shard-adlp:         [DMESG-WARN][87] ([Intel XE#4543]) -> [PASS][88] +10 other tests pass
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-8/igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1.html
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v2/shard-adlp-8/igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
>     - shard-lnl:          [FAIL][89] ([Intel XE#301]) -> [PASS][90] +3 other tests pass
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v2/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y:
>     - shard-adlp:         [FAIL][91] ([Intel XE#1874]) -> [PASS][92]
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v2/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html
> 
>   * igt@kms_hdr@invalid-metadata-sizes:
>     - shard-bmg:          [SKIP][93] ([Intel XE#1503]) -> [PASS][94]
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-6/igt@kms_hdr@invalid-metadata-sizes.html
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v2/shard-bmg-8/igt@kms_hdr@invalid-metadata-sizes.html
> 
>   * igt@kms_plane_multiple@2x-tiling-4:
>     - shard-bmg:          [SKIP][95] ([Intel XE#4596]) -> [PASS][96]
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-4.html
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v2/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-4.html
> 
>   * igt@kms_pm_dc@dc6-dpms:
>     - shard-adlp:         [FAIL][97] ([Intel XE#718]) -> [PASS][98]
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-1/igt@kms_pm_dc@dc6-dpms.html
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v2/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.html
> 
>   * igt@xe_evict@evict-beng-mixed-many-threads-small:
>     - shard-bmg:          [INCOMPLETE][99] ([Intel XE#6321]) -> [PASS][100]
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-4/igt@xe_evict@evict-beng-mixed-many-threads-small.html
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v2/shard-bmg-3/igt@xe_evict@evict-beng-mixed-many-threads-small.html
> 
>   * igt@xe_exec_balancer@once-parallel-userptr-invalidate:
>     - shard-bmg:          [DMESG-FAIL][101] ([Intel XE#3876]) -> [PASS][102] +2 other tests pass
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-2/igt@xe_exec_balancer@once-parallel-userptr-invalidate.html
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v2/shard-bmg-4/igt@xe_exec_balancer@once-parallel-userptr-invalidate.html
> 
>   * igt@xe_exec_basic@many-null-defer-bind:
>     - shard-bmg:          [DMESG-WARN][103] ([Intel XE#3876]) -> [PASS][104]
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-2/igt@xe_exec_basic@many-null-defer-bind.html
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v2/shard-bmg-4/igt@xe_exec_basic@many-null-defer-bind.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-imm:
>     - shard-bmg:          [FAIL][105] ([Intel XE#5625]) -> [PASS][106] +3 other tests pass
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-2/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-imm.html
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v2/shard-bmg-4/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-imm.html
> 
>   * igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm:
>     - shard-bmg:          [FAIL][107] ([Intel XE#6050]) -> [PASS][108] +1 other test pass
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm.html
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v2/shard-bmg-4/igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm.html
> 
>   * igt@xe_exec_reset@cm-gt-reset:
>     - shard-bmg:          [FAIL][109] ([Intel XE#6325]) -> [PASS][110]
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-2/igt@xe_exec_reset@cm-gt-reset.html
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v2/shard-bmg-4/igt@xe_exec_reset@cm-gt-reset.html
> 
>   * igt@xe_exec_system_allocator@twice-mmap-new-race-nomemset:
>     - shard-bmg:          [FAIL][111] ([Intel XE#4937] / [Intel XE#5625]) -> [PASS][112] +32 other tests pass
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-2/igt@xe_exec_system_allocator@twice-mmap-new-race-nomemset.html
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v2/shard-bmg-4/igt@xe_exec_system_allocator@twice-mmap-new-race-nomemset.html
> 
>   * igt@xe_pm@s2idle-exec-after:
>     - shard-bmg:          [TIMEOUT][113] ([Intel XE#3876] / [Intel XE#6162]) -> [PASS][114]
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-2/igt@xe_pm@s2idle-exec-after.html
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v2/shard-bmg-4/igt@xe_pm@s2idle-exec-after.html
> 
>   * igt@xe_pm_residency@gt-c6-freeze@gt0:
>     - shard-bmg:          [DMESG-FAIL][115] ([Intel XE#5545]) -> [PASS][116] +1 other test pass
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-2/igt@xe_pm_residency@gt-c6-freeze@gt0.html
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v2/shard-bmg-4/igt@xe_pm_residency@gt-c6-freeze@gt0.html
> 
>   * igt@xe_pm_residency@gt-c6-freeze@gt1:
>     - shard-bmg:          [FAIL][117] ([Intel XE#5545]) -> [PASS][118]
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-2/igt@xe_pm_residency@gt-c6-freeze@gt1.html
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v2/shard-bmg-4/igt@xe_pm_residency@gt-c6-freeze@gt1.html
> 
>   * igt@xe_vm@munmap-style-unbind-userptr-inval-front:
>     - shard-bmg:          [INCOMPLETE][119] ([Intel XE#4842]) -> [PASS][120]
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-2/igt@xe_vm@munmap-style-unbind-userptr-inval-front.html
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v2/shard-bmg-4/igt@xe_vm@munmap-style-unbind-userptr-inval-front.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
>     - shard-dg2-set2:     [INCOMPLETE][121] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345] / [Intel XE#6168]) -> [INCOMPLETE][122] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345])
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_content_protection@lic-type-0:
>     - shard-bmg:          [FAIL][123] ([Intel XE#1178]) -> [SKIP][124] ([Intel XE#2341]) +1 other test skip
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-4/igt@kms_content_protection@lic-type-0.html
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v2/shard-bmg-6/igt@kms_content_protection@lic-type-0.html
> 
>   * igt@kms_content_protection@srm:
>     - shard-bmg:          [SKIP][125] ([Intel XE#2341]) -> [FAIL][126] ([Intel XE#1178])
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-6/igt@kms_content_protection@srm.html
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v2/shard-bmg-7/igt@kms_content_protection@srm.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:
>     - shard-adlp:         [DMESG-FAIL][127] ([Intel XE#4543]) -> [FAIL][128] ([Intel XE#1874])
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v2/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
>     - shard-bmg:          [SKIP][129] ([Intel XE#2312]) -> [SKIP][130] ([Intel XE#2311]) +9 other tests skip
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v2/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
>     - shard-bmg:          [SKIP][131] ([Intel XE#5390]) -> [SKIP][132] ([Intel XE#2312]) +7 other tests skip
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
>     - shard-bmg:          [SKIP][133] ([Intel XE#2312]) -> [SKIP][134] ([Intel XE#5390]) +4 other tests skip
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:
>     - shard-bmg:          [SKIP][135] ([Intel XE#2311]) -> [SKIP][136] ([Intel XE#2312]) +10 other tests skip
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
>     - shard-bmg:          [SKIP][137] ([Intel XE#2313]) -> [SKIP][138] ([Intel XE#2312]) +10 other tests skip
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
>     - shard-bmg:          [SKIP][139] ([Intel XE#2312]) -> [SKIP][140] ([Intel XE#2313]) +9 other tests skip
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v2/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_plane_multiple@2x-tiling-yf:
>     - shard-bmg:          [SKIP][141] ([Intel XE#5021]) -> [SKIP][142] ([Intel XE#4596]) +1 other test skip
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-yf.html
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v2/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-yf.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-dg2-set2:     [SKIP][143] ([Intel XE#362]) -> [SKIP][144] ([Intel XE#1500])
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v2/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
>     - shard-adlp:         [ABORT][145] ([Intel XE#4917] / [Intel XE#5530]) -> [ABORT][146] ([Intel XE#5530])
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-3/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v2/shard-adlp-1/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
> 
>   
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
>   [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
>   [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
>   [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
>   [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
>   [Intel XE#2391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391
>   [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
>   [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
>   [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
>   [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
>   [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
>   [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
>   [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
>   [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
>   [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
>   [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
>   [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
>   [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
>   [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
>   [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
>   [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
>   [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
>   [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
>   [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
>   [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
>   [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
>   [Intel XE#4842]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4842
>   [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
>   [Intel XE#4917]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917
>   [Intel XE#4937]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4937
>   [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
>   [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
>   [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
>   [Intel XE#5530]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530
>   [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
>   [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
>   [Intel XE#6050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6050
>   [Intel XE#6054]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6054
>   [Intel XE#6162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6162
>   [Intel XE#6168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168
>   [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
>   [Intel XE#6325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6325
>   [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687 -> xe-pw-154832v2
> 
>   IGT_8594: 8594
>   xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687: fb0f56ad8a2c9953c57c3337a72ccbf9c5050687
>   xe-pw-154832v2: 154832v2
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v2/index.html
