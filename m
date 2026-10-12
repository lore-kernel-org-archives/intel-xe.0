Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F02B1CA9ED0
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 19:55:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9242C10E627;
	Mon, 12 Oct 2026 19:55:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D43FC10E627
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 19:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791834900; x=1823370900;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=54RK53VFN4lcLvbNlCMmAs132wn67TP0dFF6nYD/RsU=;
 b=JA7T2nN5w0+aWkLIOOkPnVwddcAMxyN4mhEebOq+W4fbfJOL9divJLGA
 p327UVFfsSMl8dpEedMBOJ35AlR+cF3uWpUEsf/t4cJrDDP75gpfDdiuU
 QGqvTwa2ZfbbfjVufdC7zQ9I8rkANuc5oWTvGDDap+rcqKPzujW0k22DR
 d6dCvHK9n+Dg9B2kDkwCEgbDbvzD1aYHkW1mhu+oSP1MGHLICPl85PcG2
 7BiUj1FukGx+Qu0o4fBIjH2df+OUGyQ4a8wYIj9HXe/SglrW2bbUx8h+9
 e9d8kV3chL2jHwwonOuTsk5gS0uLltyanT/sW86Zv23td4pUWvOHfrN7R Q==;
X-CSE-ConnectionGUID: A0xFZaI+Qp2GEjlFov4U+Q==
X-CSE-MsgGUID: nmfwGBqyRDulv+i8DixFYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="560989"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="560989"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 12:54:59 -0700
X-CSE-ConnectionGUID: DuB/Y9mYSu6HRMt+jRdC6w==
X-CSE-MsgGUID: 9ZDeM9lyRleEabVfpBoCGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="1452746"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 12:54:59 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 12:54:58 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 12 Oct 2026 12:54:58 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.64) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 12:54:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pWKOz0PjUFcszWuKTTO6XxEETidvUdSAHUrTgQHb3GRy8gNi5FtX2hLpkwLA/Q1aBlYzf66P0gQ4gzyc0sBLQPERzlMabOgNJ958mnH6dUvB/iqSm3U8oxC8YuudTjRHRLNU01G5FOM8gsRt7fQ9vIwWaoyCrjpSpPynZcsMAlGvErzLN2eyH5W+E0Rjz3NSusbq8hgesqwY/PSoiHSQMVA3LbavA2smr3Br0GyMeKJpg/JFGg1Ps2mRtUGOZkH9B727SXufhBXe1L6kI4eXzYb5xLnAjDb1t/RC141fvG2677S/OlKtZQO2ZRd/YU/j4SieaQ1IX0zrynSMibuO2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0TSJu6TaSjZpqWUFh1PQf27CY+3/8CNv9vDYaC4xrA8=;
 b=b1PPu1KNoCM9G7UsfaWpsH1QRPNqsRS2oRstjkd2qWO4GZj19xyTiZu0JetpNsUqBBOq1HjGbCxOQnavgO0/KlvE7BokqggVATKGfpUrwNQISK6bOA9hJ8Qr8KOZyXi9J1X6MZFtMmpYYhKY3ATh4y4mILpgLXmrRav1ydi/LHP3rX/+2vzWDw7OSA8Ox6ff++CnHHiSjyaThOuUooF+DYs6SesK1SyWO5+kB7UIdWhZZY6aVnXF/H5Y/8Ys5Q3moOsae1g15BM8Gewc3Q5C6cUGw82447GrSB2rx4ye7WtrnnF+xxBCwQuetiJo+YnhbaghU1Vo3AOpq6Bjd4RlJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB7180.namprd11.prod.outlook.com (2603:10b6:610:148::5)
 by MW4PR11MB7127.namprd11.prod.outlook.com (2603:10b6:303:221::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Mon, 12 Oct
 2026 19:54:55 +0000
Received: from CH3PR11MB7180.namprd11.prod.outlook.com
 ([fe80::70dc:90b2:50b4:31a8]) by CH3PR11MB7180.namprd11.prod.outlook.com
 ([fe80::70dc:90b2:50b4:31a8%7]) with mapi id 15.21.0496.015; Mon, 12 Oct 2026
 19:54:55 +0000
Date: Mon, 12 Oct 2026 15:54:41 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>, Danilo Krummrich
 <dakr@kernel.org>
CC: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>, 
 Piotr =?iso-8859-1?Q?Pi=F3rkowski?= <piotr.piorkowski@intel.com>
Subject: Re: [PATCH v6 0/3] Fix kernel crash during driver teardown
Message-ID: <as07AdBFlOQZrH_4@intel.com>
References: <20261012093053.2103743-5-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261012093053.2103743-5-satyanarayana.k.v.p@intel.com>
X-ClientProxiedBy: SI2P153CA0031.APCP153.PROD.OUTLOOK.COM (2603:1096:4:190::7)
 To CH3PR11MB7180.namprd11.prod.outlook.com
 (2603:10b6:610:148::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB7180:EE_|MW4PR11MB7127:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ddba326-35ca-4e5c-8edf-08df289aaf8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|11063799006|56012099006|18002099003|22082099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info: UnxT3qHEw9u124uheRgByneVpQO8PGB90njrgwPzMD7QSDF4BA/XetPYYSL0pT7nMuDwQmUhH2z4Ykp2pagrylxL9WldF96BIg2JeVW37ThNqng7A+7jzoc9vL5o4EkkaMm2gN26KlVl5IoDse0DMMJ3uE7I07uDuhbxm60w7GjbwQfDHEKqtkefDxHpNdMeZT1P8Hcab6HaXaDX3DpRLIfYUbwjzsHXWd4RuU56586ve6qeeVPuL0Hhu0y4Iucy/QCyHF11s6b3jFMz+CIc6w0kBIchFyC3+8rJt2CyA0aFHUTu6SE3CEBdyqdemQ3ih1133GkaTK7fnXm64pvCXClWa5M/B2finF0tn9fVW+rgQBKFquShaBWR6mcan9tuoeOT4V+fpu6ZS82Hh0bEcdIoQFWDWjP0QwyE+nEvtsF/GSovOHmhQMo4IL9L66bCEVJHRdUsPN8GykW7HvJSa4gnI6UkvDINF9RAYNu+5XKR7pYmubVn3O3B6C7hyDrAej3m2GWreqMHwfmGnLSZVVukbEe0ERPCl+gF6xJW8DImRn26wuEfDHzDMyLPZLl3/39tedDTMoYiCoG2KC4NfipGaSgsxX6eCIHMuLD3qAiHlS5gnujtk2MIQcaA7ZN4CNA8C7QMwxFKL49B+l3qTfKAG4t9ma4OvpD8yi4MGVA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB7180.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(11063799006)(56012099006)(18002099003)(22082099003)(261009223027099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?OphGjBNMkvtRCnpA79JOAnjP+ZUgLkLMYioEh7S7b/5VGMmeGttwO8iwcp?=
 =?iso-8859-1?Q?tbY7X5vImIGlZirIDp9YQDb0KTTkx+1C9x4HzIouGB9QjJqCb9mfAY9dnb?=
 =?iso-8859-1?Q?aQCgJErWi5pZqjJC2+fmZjKFUtnZpRBKmJK15Xd3Ikool8jRtjAnlb2EV1?=
 =?iso-8859-1?Q?qKHs2805fbE4wdUDJzAfHaN4XjhZkhwfGl1Zi0lVRDtpvYU1qcGg4/fOeZ?=
 =?iso-8859-1?Q?qHNC5r4hwoSsVN8IxaUKLsKW+0B0HtLxLDglal5wjsF0CGFpcP435oHD6M?=
 =?iso-8859-1?Q?LTdvRjwKRtHFecJYOHviyGF/+0LzvDU3I74PssYwx+E/A9rhfw4X1XfGw4?=
 =?iso-8859-1?Q?GzOjLrGXwDduU8XOUmrIknSBAcmGvvAfhrFuYanIiVqo788/jDJEa6Ct7a?=
 =?iso-8859-1?Q?zAbIPFbupC3qfKBWEPREL+0+IbXN2D5ln76Xj8Qcn+YaQdNn4SB6gUoJLX?=
 =?iso-8859-1?Q?emu/ji9tHjpJCQJvNtPDLxp2qGdrTt7Zm9chS7VL/D+bPbRJSLt2bwqZaF?=
 =?iso-8859-1?Q?ut6t9RbI/XZbPc3TSdmJyOOB2S5BhK57S/4xY9eCr0g1SliFXEpDnjRJ/c?=
 =?iso-8859-1?Q?ctLnOkilkhi1dYXsJpxiS1MzezHRmIKHzEr9JqNekMPfA6EAZtGSNz/sjK?=
 =?iso-8859-1?Q?xyAkSrPyuoWvh/lTuK07DxEEj2vglodTAEYa4Nr/N73qvxM7vI4ub0jpX3?=
 =?iso-8859-1?Q?W0SJrs2fhWvQYPz6n+ztqHlyqYG1vAQDb496lPd2R0LSrHP55ZpscXUmkt?=
 =?iso-8859-1?Q?Jld3i7U1HOSuiRELaSpJcv1EQVaN+1Jq2sdNe0Lj0BzrbkLA+MTcLhUmGU?=
 =?iso-8859-1?Q?kCa2ntKHl7ELCTpJlFu+gEPOUbDBRrz+72YCFAIj4bLDM3QhXfZjzmYgc+?=
 =?iso-8859-1?Q?f6mPdPnFkY45KVmuCzABiUiAfIBSCOi1FFMh6tIUf7NQqq0iYAV3+Po5Bq?=
 =?iso-8859-1?Q?T6LP9Jz8P7uDAmda5J9zrTC+iVt7loyqnoMb7zNGgEFMrmT1M7zJLgNz0t?=
 =?iso-8859-1?Q?oAMSeY9dPeMw04ZC8AnOz3ipJALfHwFioVMG13sZTT3aXANBKqgZ9hgWGl?=
 =?iso-8859-1?Q?dYywHnsGy7A05JCKmGPDrBcX2sICiq2WQuH+TMFUNNz5JbMPUa4CHeQ772?=
 =?iso-8859-1?Q?aymTqGHMFz5yN/EE6kf3aCrhmLe7rvV8VdsQKH0wqtyyWQK+ww19BhUyif?=
 =?iso-8859-1?Q?ughr+6kb+aU6U24dLnj84E9jkcgnYr5AHSoW7pjzujOqJHQwxQLpvHGl+T?=
 =?iso-8859-1?Q?SJquPTcKepT6grFzIH5uxKKOXVC0T2GTVXslt9NxUNNkEm/WJ74JhxaeVp?=
 =?iso-8859-1?Q?WfkVz9wReDTjj1b3TVCFRRz5Fky6NfQo98R8R84YH21V0IUF7BR+aF8wHX?=
 =?iso-8859-1?Q?QR/WqCrSoTA0Xa+68dEeuMZtS7t1m4TN2aqom/EqvDDZRDSmn/mo3cSh8y?=
 =?iso-8859-1?Q?0EsJ+podMNkUNx15UqF9j3D+Z9w7vUCyukkcmJ/RPUMyvgf1hkbCFDyRxa?=
 =?iso-8859-1?Q?PAjKxaoM3DMo8brBIOZ4EDc9T4CDNDkVK+M/1mglggR04ZnOV2PoyaFTcd?=
 =?iso-8859-1?Q?fXbdmk/Kx7HjhBeZmPbYlKcai7tD15/OURZU/aGqVLPWGjr4feoyu3qLM7?=
 =?iso-8859-1?Q?qn3J/o8hNF+v6eCjpuMtmzZYaWXFeaa3xjNsaCA2oO1av8VgawGaOSCjyR?=
 =?iso-8859-1?Q?wv93ya+qHvBcVHboaZ+yFbgIJhJC2w6DUi1Z71fT8v7CT3ECxuIJX+FzfN?=
 =?iso-8859-1?Q?YK2JxuRWZctxRkE0j8omiNjVa3l+cYkNToDUZVtaPqVInOB+sQ3nlfWGn1?=
 =?iso-8859-1?Q?DsV26d02sw=3D=3D?=
X-Exchange-RoutingPolicyChecked: HXZNaMDgClnxiaKyD94nd1MdEVszG1m7CBvw4hHGcJ+WVr5EFDtfLBZTkpD9eiNn8KxkVXZRNES2+aN1tRuISEh9GDsiebDATGHCKokOs7tAU7P6YNibAVVBb6dO9LTXQ3M4MG3kqEMLu9RSRhnGqwWIdPqa13T+NaSgSsfrxSXUJ1gjkiKq6NjBuNlR6DxCTNxvOsWD9aj9BRM9yy1Q1sF6ubESYPqv3fPjd7X3CErDhSHRtvh6P4mbgLcPsB9ZhYHzrXHXM4YTGZDR1F5zKNDoDHMhexVkbAsVJ75x5zWL2GcjirSZw+vxoo02vW5Vqk1MtjBm3bJmkbBR55gmAA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ddba326-35ca-4e5c-8edf-08df289aaf8c
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 19:54:54.9729 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: riqhOtwuAZ2j7eHkZkiw6gqyzY+nZXJM4EY8L8/2Htuf9FVIJaHxDgj3Y4klm/5mWsPHzUNjsxHsPkHzE2Md6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7127
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

On Mon, Oct 12, 2026 at 09:30:54AM +0000, Satyanarayana K V P wrote:
> During driver release, the hardware engine is only partially invalidated
> during teardown. Its name remains set, so the memory IRQ handler can still
> identify the engine and access its state after teardown. This can result
> in a NULL pointer dereference.
> 
> Invalidate the hardware engine name during teardown so the IRQ handler no
> longer treats the engine as available.
> 
> The crash log below shows an example of the failure.
> 
> BUG: kernel NULL pointer dereference, address: 0000000000000000
> PF: supervisor read access in kernel mode
> PF: error_code(0x0000) - not-present page
> PGD 0 P4D 0
> Oops: Oops: 0000 [#1] SMP NOPTI
> Tainted: [U]=USER
> Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS
> 2025.11-3ubuntu7 03/31/2026
> RIP: 0010:xe_hw_engine_handle_irq+0x18/0x70 [xe]
> Code: 00 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 0f 1f
> 44 00 00 55 48 89 e5 41 54 41 89 f4 48 89 d6 53 48 8b 07 48 89 fb <48> 8b 00 48
> 8b 38 e8 5d 84 08 00 48 8b 83 b8 00 00 00 48 85 c0 74
> RSP: 0018:ffffd07840003e80 EFLAGS: 00010046
> RAX: 0000000000000000 RBX: ffff8904657fa740 RCX: 0000000000000000
> RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffff8904657fa740
> RBP: ffffd07840003e90 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000001
> R13: ffff89046a490000 R14: ffff89046a491af8 R15: ffff8904657faf20
> FS:  0000000000000000(0000) GS:ffff8905fd219000(0000)
> knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 0000000000000000 CR3: 0000000103705005 CR4: 0000000000772ef0
> PKRU: 55555554
> Call Trace:
>  <IRQ>
>  xe_memirq_handler+0xc3/0x200 [xe]
>  vf_mem_irq_handler+0x46/0x90 [xe]
>  __handle_irq_event_percpu+0x59/0x200
>  handle_irq_event+0x36/0x90
>  handle_edge_irq+0xc5/0x190
>  __common_interrupt+0x50/0x160
>  ? irq_enter_rcu+0x84/0xb0
>  common_interrupt+0xb0/0xe0
>  </IRQ>


I believe issues like this prove's Danilo's point on his LPC
presentation [1] right?!

[1] https://www.youtube.com/live/QkKqzX2Vv4c?si=FUEfOoBA5q_ZkoXL&t=19761

And sashiko shows that it might be harder... I wonder if there are some
layering split we could do here to proper handle this lifetime and
ownership clear without a major refactoring :/

> 
> ---
> V5 -> V6:
> - Return DRM_GPU_SCHED_STAT_NO_HANG instead of DRM_GPU_SCHED_STAT_ENODEV
>  (Piotr)
> 
> V4 -> V5: 
> - Return DRM_GPU_SCHED_STAT_ENODEV instead of DRM_GPU_SCHED_STAT_NO_HANG
> (Sashiko).
> V3 -> V4:
> - Fix race condition reported by LLM (Sashiko).
> 
> V2 -> V3:
> - Fixed race condition with guc_exec_queue_timedout_job(). (Sashiko).
> - Disable GT reset worker before engine teardown (LLM).
> 
> V1 -> V2:
> - Fix race with xe_memirq_handler() and hw_engine_fini() (Sashiko & Piotr).
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Assisted-by: LLM
> 
> Satyanarayana K V P (3):
>   drm/xe: Prevent VF memory IRQ from accessing a torn-down engine
>   drm/xe/guc: Protect timeout handling from device unplug
>   drm/xe/gt: Disable GT reset worker before engine teardown
> 
>  drivers/gpu/drm/xe/xe_gt.c         | 29 ++++++++++++++++++++++-------
>  drivers/gpu/drm/xe/xe_guc_submit.c | 12 +++++++++++-
>  drivers/gpu/drm/xe/xe_hw_engine.c  | 17 ++++++++++++++---
>  drivers/gpu/drm/xe/xe_irq.c        |  3 +++
>  drivers/gpu/drm/xe/xe_memirq.c     |  3 +++
>  5 files changed, 53 insertions(+), 11 deletions(-)
> 
> -- 
> 2.43.0
> 
