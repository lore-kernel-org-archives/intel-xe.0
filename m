Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E12DFC54798
	for <intel-xe@archiver.kernel.org>; Thu,  7 Mar 2024 19:02:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D63110F527;
	Thu,  7 Mar 2024 19:02:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JA92F3m3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC2DC10F527
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Mar 2024 19:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709838166; x=1741374166;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Xz7TmQhYW1n5rTgRB50ZdK7zSF6kBgxnyT97eUE2YRk=;
 b=JA92F3m3hapFm7EoGppMmwlFTaiMh8etOBdLLftSE3XIkXmd0d555Q38
 kYtxrViRtphpsZfyQHWxjw5DmL36aW9viGMi/9/FrdyUAYrLgWQptmKay
 RRYGVraisQBJcKrb8L9HQu9/HGSeZnIS7CgwIAuFp2vXDpZ0688qaeNyG
 zDxhvcPwlElUQ5omzLoE8SDkdxQsv7wSIfRStyNRp7UAhhOuVSmfkYvBe
 +oKokMt9TxO+FEc4Rke3EIi2BAwB+IUXEIZHcI0TKChXSW880vieWAWzQ
 rrLDcz4ljkz4Lj3KvEBxzspjCd0ts1WNkqa1ls0SUVvytvCKD9U59CTCw w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="15673837"
X-IronPort-AV: E=Sophos;i="6.07,107,1708416000"; d="scan'208";a="15673837"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 11:02:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,107,1708416000"; d="scan'208";a="10090920"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Mar 2024 11:02:44 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Mar 2024 11:02:44 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Mar 2024 11:02:43 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Mar 2024 11:02:43 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Mar 2024 11:02:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=geKGuPUoevbOnjmNq2QclcWraq5yCGXd1SpMqrlSmmz8oePzd43Dz3DqQj8Uo/CZiqLdZQcTi1q6Devp+ZCorRTrbyTO1PR401ILeEEZfOHbTyQq1qwP5nzi1xSdLA+RywPFk/nxtQbU/3cEoKEI7gc3h6otZek+7yUfRUcjBFqT0lBmNay05rzybyyZqqBpsXGfC0mzJVilq6qu2g35Or57tD2p2LYmBkpsKAG/LW8zRa+Bu+NnX3l/fmgXr64c4SL4/GoM7dG9JWefhHMeEFhUWC3jr08hIyt4sxybrzGNMmDfUQNTv9UdMMSvTYUdJNd6+/bCf7J0gXDlg1NVig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cZA3iV3SRWiHUhXDDoksRb3+ZpGRTSN38ZZNMaKV66Q=;
 b=eLql6ZruYu1B1pkUS6qXvHUk6nqO6Nz5t6RA/d20FwKzs9CzpCECT6kr8Bv4kR5JYCuT6eoRMhfqhQoC17EkcPwZBJadaIYR/aMYs1LUEKDIsMdPNhNPbXUhlC5fH7P6dP9Cese30e8lNd9j5KgRFLtCOhOEpRWI7CRedFpXaIy75ZSPzjy3WeQrGws1QkW0QuKunFNorRSKTY01Zbir+b07gRfKMaUYIW2kur1NbPpuDBKdawun50u40Byh4Ll38a6caJ/Y3p1g7CqgQ/cVY53oEB7hqbL/hlhke74SUGiC6uGSlECbcv9gqS/LhelKvpCnKQPlQSZjcSWtVpT0GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB7051.namprd11.prod.outlook.com (2603:10b6:510:20e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.9; Thu, 7 Mar
 2024 19:02:41 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7386.006; Thu, 7 Mar 2024
 19:02:41 +0000
Date: Thu, 7 Mar 2024 13:02:38 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH] Revert "drm/xe: Do not grab forcewakes when issuing GGTT
 TLB invalidation via GuC"
Message-ID: <4hoacashd7fylyggfhlwotu5klcnohdamvvrezbzjj2u6rwma2@rk2h2tmnue5b>
References: <20240307001105.161856-1-rodrigo.vivi@intel.com>
 <uovrap7ztb6mhbqfbw73yaslpqkhmt74kiyudzy646oukoii2e@ojksg6dxqp5b>
 <ZeoKncU_r_iyKtAG@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ZeoKncU_r_iyKtAG@intel.com>
X-ClientProxiedBy: SJ0PR03CA0150.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::35) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB7051:EE_
X-MS-Office365-Filtering-Correlation-Id: 69beeeae-9a09-407b-2cf0-08dc3ed929c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LvTEZwfxLKPei+VJWht4z93Igk7faoVIddiG/eqUWIxIPsjMT6BAnHVrs5yeA4awX1koDjh/BiE8DMFf/ws37WYmvPmu1LNOPEn6fPhjNYu6RUhbhHBJ7/7q4jrHOi0Ghu6ca/GnpUZXRY4r9XIpBq1D00KZ/aJTlwLPwCyDOrurxu2J0NeasTsRz3RpHXup6byI0AsD9NwC0nKE8+VCQmk7SSoMeYbJUkIZgsvrXY9hBHt0IOa5kW9Gzy97iNSnO6mn6BrE9rHEY5ga5B17BsDE6vwGIcezKitzuLFnJpMtMqt4bG5XhiYEBz+ZumB3cfCxcC8GMpzcj81qtfQuC/VUtv0CmUMA2aOq+GSNG/K/q0TdaMh1rFjdgqeISjijfH1TJSAwyTxwWa8fsP89GrumoJGeLWf8knzGCGLPVOH1cHZbVU36XoqpCfmYRFP0v55n2b8O1nFzI7SVYdkRlbbP5U2V3YEbo25j4+XPe5mvasaLWoJONW5+ulMFipBWweCf7Y5OqLmMWBTjUzjvSCF3p2uE3ePrau8blvohPHIZUA8lcfyB52Thm1BmYh+eM6JT4eqspyfFplA4QdXAN6ZOI7d1OH5HVrz3OxnaS+g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oL82Z6sXlYYRs+2IYSi249SLe5yC+CZGek7ouo9r5N1HB+ooVxeiaLdESul9?=
 =?us-ascii?Q?pXIP8Vq2dCLdSHtA5Ggg5EKF7UCDg9DyWrIUyCe9z8W6zL9j4+hhC5QpebZN?=
 =?us-ascii?Q?T8cedmvYRnwQfU+dcZrQKFzRdSksOaAq8qT98YY1NEdNZaj/1ZxpIIcGyi2i?=
 =?us-ascii?Q?JkHVBmhnRHBCD1/h727j1ws+Y1lchmU2X9sboF+3y7PluU2zzObDUJKfRKCx?=
 =?us-ascii?Q?NMmJ2JCGpkKgMjy0PkOfbKWiHI/vWGSOLijk/j06Vr5kv1Ipv2arVX10V3VO?=
 =?us-ascii?Q?6AlKBb7uGGj8jEauJ9xosy8XAotH3SIWlLs2qVSN7dIVsDt/agZbSgsEKDnY?=
 =?us-ascii?Q?Zf7P+1fuoubbtQzDjug+9ApthMcSCG6f6+YMBAQIz7FhEjfq2oykkVkqEmHP?=
 =?us-ascii?Q?oHnQZo/O1gvmAclLwLf9adwDi4GvT76dPSajoGDk7vE+1vQ2Sw9s/YAx5oAY?=
 =?us-ascii?Q?ZknucydK0CNU9yW3NNlgFMuDT9lu0EXBmNNTvLxH8u9scaqB0b83Mg3iNolL?=
 =?us-ascii?Q?/him0gWpFxJDK3fSnDzKoKDGBW7GmRmYwDYSFSWKqSL1ZZhTwmshb9ss1A9Z?=
 =?us-ascii?Q?KOrKP8BTj7rDjRgnYmw+VBQ86VNpnA2uq5KPk7e6hKu8Ku9aBZQ92z0QrsNm?=
 =?us-ascii?Q?mc2U2GjD3M6euZWkxD9PPHzFq7ZzPy6pZn5HruXq4h3lR4vOEy0m+GxKC3ea?=
 =?us-ascii?Q?53FvFlRptNDB+Gr4b8xpliSJg6Gw1Hg0kPxo1ZA5oVLXx2cVpowUagMt5Mb4?=
 =?us-ascii?Q?SBWsoqpJQ6bzzWxr5fH5Mu4ZnX/FPIkM/LGdn+RJ1QE/qFTQ427dvILY0KAm?=
 =?us-ascii?Q?yEb0B+rmppFrmbUjDgtqFo8gq4Gw46iAq09yARPRdRtLHCh+dmZcogLj2Bql?=
 =?us-ascii?Q?T4htDpF4BFnlEFkmXunSJ5UCbkGWy5LJIVQnM6IrSxGQ1cPmMBxQSAoyz2YL?=
 =?us-ascii?Q?r6u4GL13gzQMH/F1LIfEna1RshE5asoij6MQ4GC1GQLIV8yjarDvBVEh/NUD?=
 =?us-ascii?Q?2+G1Glt8Xn+zt4Pi1zk9hPxtPKsmRrFks9Z+thNCoHc0CjFJsn/mHN4M9K9f?=
 =?us-ascii?Q?htHMoic1FZ3Dts5hxPMdWUIOD+VsX/kE+FVJ8znmNX9Ggh6g9Ak49UEW/dAh?=
 =?us-ascii?Q?g/VqDz1EvsRDyIAyJ7oE8JkE/i9rJGgFrk4jB1li0Dnmv/nsW7wyOhfld75+?=
 =?us-ascii?Q?4ttj8O2E9gVo0DcBcCPnCazF2SaG92oAH77whDGlPVBYe8TaLVlSETbZPXb9?=
 =?us-ascii?Q?Se8ws/Axte8srB0FRz2WomEK0niSpFnT+XdHqGfVpgzOjxOjctu2+N4QP7ks?=
 =?us-ascii?Q?ylquu4asP36/88lw6rSLmf3tDtsEK+W8DLlgnh2kczd6uI9dadQ8ce2LrDwn?=
 =?us-ascii?Q?vciM7PcoC9Jc7zjRnSa/kqBqEB6gaiTrJUgiSWE0YQGJsJ+CGjBJiMbRnW9m?=
 =?us-ascii?Q?IRxtySKxNyJSngscSZYbCzzOEt6ta5sd5hB4M4Kk+vdFYUp4RuPVuDGc20/l?=
 =?us-ascii?Q?/G/gRLEQo4Bj5gSqdLp/amzFH+yFCVbMi+mNid78Qt6HiRUkF0a+eoaZSSNG?=
 =?us-ascii?Q?spU9aVJP+cfp8UoIo/rIkxnYQi5r8R0e2JoXQw23n75/hLQszfdG+G6K59hv?=
 =?us-ascii?Q?wg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 69beeeae-9a09-407b-2cf0-08dc3ed929c3
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2024 19:02:41.1408 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WpCXJiJzsxVW0shoMDDIYftlwux/zRy6IS7nWfl4teAGPEuvqrogrgvja5lPS3kKL+fZPhc85I9afs35lIHHW3jdUJqhwUDgbJi38dlG9ag=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7051
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

On Thu, Mar 07, 2024 at 01:42:37PM -0500, Rodrigo Vivi wrote:
>On Thu, Mar 07, 2024 at 12:09:42PM -0600, Lucas De Marchi wrote:
>> On Wed, Mar 06, 2024 at 07:11:05PM -0500, Rodrigo Vivi wrote:
>> > This reverts commit 27ee413bbc0b04146f4ee1c7444422bf18dafd47.
>> >
>> > On DG2 after this patch:
>> >
>> > [  439.105953] general protection fault, probably for non-canonical ad=
dress 0xdffffc0000000000: 0000 [#1] PREEMPT SMP KASAN NOPTI
>> > [  439.117349] KASAN: null-ptr-deref in range [0x0000000000000000-0x00=
00000000000007]
>> > [  439.124924] CPU: 8 PID: 7160 Comm: insmod Tainted: G     U     OE  =
    6.8.0-rc7+ #5
>> > [  439.132669] Hardware name: iBUYPOWER INTEL/B660 DS3H AC DDR4-Y1, BI=
OS F5 12/17/2021
>> > [  439.140332] RIP: 0010:xe_ggtt_invalidate+0x150/0x260 [xe]
>> > [  439.145860] Code: 48 8d 7d 18 48 89 fa 48 c1 ea 03 80 3c 02 00 0f 8=
5 b3 00 00 00 48 b8 00 00 00 00 00 fc ff df 48 8b 5d 18 48 89 da 48 c1 ea 0=
3 <80> 3c 02 00 0f 85 87 00 00 00 48 b8 00 00 00 00 00 fc ff df 48 8b
>> > [  439.164609] RSP: 0018:ffffc9000201eee8 EFLAGS: 00010246
>> > [  439.169843] RAX: dffffc0000000000 RBX: 0000000000000000 RCX: 000000=
0000000000
>> > [  439.176980] RDX: 0000000000000000 RSI: ffffffffb6ae4040 RDI: ffff88=
818231a478
>> > [  439.184121] RBP: ffff88818231a460 R08: 0000000000000001 R09: fffffb=
fff7563e5c
>> > [  439.191259] R10: fffff52000403d92 R11: 0000000000000001 R12: ffff88=
8185330028
>> > [  439.198401] R13: ffffffffffffffff R14: 0000000000001000 R15: 000000=
0000000000
>> > [  439.205543] FS:  00007f6c0fd92740(0000) GS:ffff888f76400000(0000) k=
nlGS:0000000000000000
>> > [  439.213634] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> > [  439.219393] CR2: 00007ffedd41de70 CR3: 00000001063ec000 CR4: 000000=
0000750ef0
>> > [  439.226534] PKRU: 55555554
>> > [  439.229256] Call Trace:
>> > [  439.231713]  <TASK>
>> > [  439.233832]  ? die_addr+0x3c/0xa0
>> > [  439.237165]  ? exc_general_protection+0x158/0x240
>> > [  439.241882]  ? asm_exc_general_protection+0x22/0x30
>> > [  439.246774]  ? xe_ggtt_invalidate+0x150/0x260 [xe]
>> > [  439.251679]  ? xe_ggtt_invalidate+0xa0/0x260 [xe]
>> > [  439.256490]  __xe_ggtt_insert_bo_at+0x24b/0x720 [xe]
>> > [  439.261556]  ? __pfx____xe_bo_create_locked+0x10/0x10 [xe]
>> > [  439.267144]  ? __pfx___xe_ggtt_insert_bo_at+0x10/0x10 [xe]
>> > [  439.272737]  __xe_bo_create_locked+0x4af/0x1080 [xe]
>> > [  439.277806]  xe_bo_create_pin_map_at+0x40/0x400 [xe]
>> > [  439.282873]  ? xe_uc_fw_check_version_requirements+0x496/0x900 [xe]
>> > [  439.289255]  xe_managed_bo_create_from_data+0x38/0x130 [xe]
>> > [  439.294934]  xe_uc_fw_init+0xe71/0x3270 [xe]
>> > [  439.299317]  ? __pfx_xe_uc_fw_init+0x10/0x10 [xe]
>> > [  439.304127]  ? __pfx_lock_acquired+0x10/0x10
>> > [  439.308406]  ? __pfx___drm_printfn_info+0x10/0x10
>> > [  439.313118]  ? _raw_spin_unlock_irqrestore+0x4b/0x80
>> > [  439.318093]  ? __pm_runtime_resume+0x7f/0x110
>> > [  439.322458]  xe_guc_init+0x8d/0x890 [xe]
>> > [  439.326497]  xe_uc_init+0x65/0x1a0 [xe]
>> > [  439.330440]  xe_gt_init_hwconfig+0xdc/0x180 [xe]
>> > [  439.335161]  xe_device_probe+0x747/0x1060 [xe]
>> > [  439.339712]  ? __pfx___drmm_mutex_release+0x10/0x10
>> > [  439.344599]  ? __drmm_add_action+0x19d/0x280
>> > [  439.348883]  ? __pfx___drmm_mutex_release+0x10/0x10
>> > [  439.353769]  xe_pci_probe+0x168b/0x2f30 [xe]
>> > [  439.358154]  ? __pfx_lock_acquired+0x10/0x10
>> > [  439.362433]  ? __pfx_xe_pci_probe+0x10/0x10 [xe]
>> > [  439.367158]  ? _raw_spin_unlock_irqrestore+0x62/0x80
>> > [  439.372131]  ? lockdep_hardirqs_on+0xc7/0x140
>> > [  439.376498]  ? _raw_spin_unlock_irqrestore+0x4b/0x80
>> > [  439.381473]  ? __pfx_xe_pci_probe+0x10/0x10 [xe]
>> > [  439.386196]  local_pci_probe+0xd6/0x190
>> > [  439.390042]  pci_device_probe+0x223/0x740
>> > [  439.394064]  ? __pfx_pci_device_probe+0x10/0x10
>> > [  439.398605]  ? kernfs_create_link+0x167/0x230
>> > [  439.402970]  ? do_raw_spin_unlock+0x54/0x1f0
>> > [  439.407252]  really_probe+0x3df/0xb80
>> > [  439.410926]  __driver_probe_device+0x18c/0x450
>> > [  439.415382]  driver_probe_device+0x4a/0x120
>> > [  439.419572]  __driver_attach+0x1e1/0x4a0
>> > [  439.423505]  ? __pfx___driver_attach+0x10/0x10
>> > [  439.427963]  bus_for_each_dev+0xf2/0x160
>> > [  439.431897]  ? __pfx_bus_for_each_dev+0x10/0x10
>> > [  439.436436]  bus_add_driver+0x29d/0x570
>> > [  439.440283]  driver_register+0x130/0x450
>> > [  439.444218]  ? __pfx_xe_init+0x10/0x10 [xe]
>> > [  439.448507]  xe_init+0x81/0x140 [xe]
>> > [  439.452188]  ? __pfx_xe_init+0x10/0x10 [xe]
>> > [  439.456478]  do_one_initcall+0xcf/0x420
>> > [  439.460326]  ? __pfx_do_one_initcall+0x10/0x10
>> > [  439.464783]  ? kasan_unpoison+0x40/0x70
>> > [  439.468631]  do_init_module+0x238/0x730
>> > [  439.472478]  load_module+0x5ff7/0x6c30
>> > [  439.476242]  ? __pfx_load_module+0x10/0x10
>> > [  439.480356]  ? ima_post_read_file+0x163/0x190
>> > [  439.484722]  ? __pfx_ima_post_read_file+0x10/0x10
>> > [  439.489435]  ? security_kernel_post_read_file+0x6d/0xb0
>> > [  439.494673]  ? __pfx_kernel_read_file+0x10/0x10
>> > [  439.499220]  ? init_module_from_file+0xc0/0x100
>> > [  439.503758]  init_module_from_file+0xc0/0x100
>> > [  439.508125]  ? __pfx_init_module_from_file+0x10/0x10
>> > [  439.513103]  ? do_raw_spin_unlock+0x54/0x1f0
>> > [  439.517382]  idempotent_init_module+0x241/0x660
>> > [  439.521924]  ? __pfx_idempotent_init_module+0x10/0x10
>> > [  439.526986]  ? security_capable+0x6d/0xb0
>> > [  439.531003]  __x64_sys_finit_module+0xba/0x130
>> > [  439.535459]  do_syscall_64+0x97/0x190
>> > [  439.539135]  ? lockdep_hardirqs_on_prepare+0x17b/0x420
>> > [  439.544282]  ? do_syscall_64+0xa7/0x190
>> > [  439.548125]  ? lockdep_hardirqs_on+0xc7/0x140
>> > [  439.552493]  ? do_syscall_64+0xa7/0x190
>> > [  439.556341]  ? do_syscall_64+0xa7/0x190
>> > [  439.560188]  ? lockdep_hardirqs_on+0xc7/0x140
>> > [  439.564556]  ? do_syscall_64+0xa7/0x190
>> > [  439.568401]  ? do_syscall_64+0xa7/0x190
>> > [  439.572249]  ? lockdep_hardirqs_on_prepare+0x17b/0x420
>> > [  439.577395]  entry_SYSCALL_64_after_hwframe+0x6e/0x76
>> > [  439.582460] RIP: 0033:0x7f6c0f73160d
>> > [  439.586047] Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e f=
a 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 0=
5 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d f3 47 0c 00 f7 d8 64 89 01 48
>> > [  439.604792] RSP: 002b:00007ffd0ecad3b8 EFLAGS: 00000246 ORIG_RAX: 0=
000000000000139
>> > [  439.612368] RAX: ffffffffffffffda RBX: 0000565382a36740 RCX: 00007f=
6c0f73160d
>> > [  439.619506] RDX: 0000000000000000 RSI: 0000565382a362a0 RDI: 000000=
0000000003
>> > [  439.626644] RBP: 00007ffd0ecad470 R08: 0000000000000000 R09: 000056=
5382a37760
>> > [  439.633782] R10: 0000000000000003 R11: 0000000000000246 R12: 000056=
5382a362a0
>> > [  439.640925] R13: 0000000000000000 R14: 0000565382a38790 R15: 000056=
5382a362a0
>> > [  439.648066]  </TASK>
>> > [  439.650263] Modules linked in: xe(OE+) snd_hda_codec_hdmi snd_seq_d=
ummy snd_hrtimer rfcomm nf_conntrack_netbios_ns nf_conntrack_broadcast nft_=
fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 n=
f_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_nat nf_conntrack nf_defrag=
_ipv6 nf_defrag_ipv4 ip_set nf_tables nfnetlink qrtr bnep sunrpc binfmt_mis=
c vfat fat intel_rapl_msr snd_sof_pci_intel_tgl iwlmvm intel_rapl_common sn=
d_sof_intel_hda_common snd_soc_hdac_hda snd_sof_pci intel_uncore_frequency =
snd_sof_xtensa_dsp intel_uncore_frequency_common snd_sof_intel_hda x86_pkg_=
temp_thermal snd_sof intel_powerclamp mac80211 snd_sof_utils snd_soc_acpi_i=
ntel_match snd_soc_acpi snd_soc_core coretemp snd_compress snd_sof_intel_hd=
a_mlink snd_hda_ext_core kvm_intel snd_hda_intel snd_intel_dspcfg libarc4 s=
nd_hda_codec kvm snd_hwdep snd_hda_core btusb iwlwifi irqbypass snd_seq btr=
tl snd_seq_device iTCO_wdt btintel rapl pmt_telemetry intel_pmc_bxt snd_pcm=
 intel_cstate btbcm ee1004 iTCO_vendor_support btmtk mei_hdcp
>> > [  439.650319]  mei_pxp pmt_class cfg80211 i2c_i801 snd_timer intel_un=
core wmi_bmof gigabyte_wmi bluetooth pcspkr snd i2c_smbus mei_me soundcore =
mei idma64 rfkill intel_vsec intel_hid joydev acpi_tad acpi_pad sparse_keym=
ap loop zram drm_gpuvm hid_logitech_hidpp i915 crct10dif_pclmul crc32_pclmu=
l crc32c_intel polyval_clmulni polyval_generic ghash_clmulni_intel nvme r81=
69 sha512_ssse3 nvme_core pinctrl_alderlake hid_logitech_dj ip6_tables ip_t=
ables fuse
>> > [  439.739896] Unloaded tainted modules: xe(OE):2 [last unloaded: xe(O=
E)]
>> > [  439.786092] ---[ end trace 0000000000000000 ]---
>> > [  439.790733] RIP: 0010:xe_ggtt_invalidate+0x150/0x260 [xe]
>> > [  439.796254] Code: 48 8d 7d 18 48 89 fa 48 c1 ea 03 80 3c 02 00 0f 8=
5 b3 00 00 00 48 b8 00 00 00 00 00 fc ff df 48 8b 5d 18 48 89 da 48 c1 ea 0=
3 <80> 3c 02 00 0f 85 87 00 00 00 48 b8 00 00 00 00 00 fc ff df 48 8b
>> > [  439.815026] RSP: 0018:ffffc9000201eee8 EFLAGS: 00010246
>> > [  439.820262] RAX: dffffc0000000000 RBX: 0000000000000000 RCX: 000000=
0000000000
>> > [  439.827407] RDX: 0000000000000000 RSI: ffffffffb6ae4040 RDI: ffff88=
818231a478
>> > [  439.834549] RBP: ffff88818231a460 R08: 0000000000000001 R09: fffffb=
fff7563e5c
>> > [  439.841691] R10: fffff52000403d92 R11: 0000000000000001 R12: ffff88=
8185330028
>> > [  439.848835] R13: ffffffffffffffff R14: 0000000000001000 R15: 000000=
0000000000
>> > [  439.855978] FS:  00007f6c0fd92740(0000) GS:ffff888f76400000(0000) k=
nlGS:0000000000000000
>> > [  439.864072] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> > [  439.869824] CR2: 00007ffedd41de70 CR3: 00000001063ec000 CR4: 000000=
0000750ef0
>> > [  439.876966] PKRU: 55555554
>> >
>> > Fixes: 27ee413bbc0b ("drm/xe: Do not grab forcewakes when issuing GGTT=
 TLB invalidation via GuC")
>> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> > Cc: Matthew Brost <matthew.brost@intel.com>
>> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> > ---
>> > drivers/gpu/drm/xe/xe_ggtt.c                | 7 +++++++
>> > drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 2 --
>> > 2 files changed, 7 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt=
.c
>> > index 5e739513ab0a..717d0e76277a 100644
>> > --- a/drivers/gpu/drm/xe/xe_ggtt.c
>> > +++ b/drivers/gpu/drm/xe/xe_ggtt.c
>> > @@ -257,9 +257,16 @@ static void ggtt_invalidate_gt_tlb(struct xe_gt *=
gt)
>> > 	if (!gt)
>> > 		return;
>> >
>> > +	/*
>> > +	 * Invalidation can happen when there's no in-flight work keeping th=
e
>> > +	 * GT awake.  We need to explicitly grab forcewake to ensure the GT
>> > +	 * and GuC are accessible.
>>
>>
>> aside from the null pointer deref, what exactly
>> from this comment above that would not be true to make the patch
>> correct?
>
>That's a very good question. maybe -ENOTENOUGHCOFFEE from my side...
>my bisect took me to this patch that touches the RIP function:
>[  439.140332] RIP: 0010:xe_ggtt_invalidate+0x150/0x260 [xe]
>and I had to use this revert to be able to proceed with my work yesterday.
>
>But then, Matt pointed me to https://patchwork.freedesktop.org/patch/58152=
2/?series=3D130786&rev=3D1
>and applying that here also make things work...


well, that first patch fixes the null pointer deref, but that is while
printing an *error*. The error is still there. I see commit
27ee413bbc0b ("drm/xe: Do not grab forcewakes when issuing GGTT TLB
invalidation via GuC")  removed the forcewake without proper explanation
(at least to me), and now we are reproducing the error path (with the
extra annoyance of the null deref).

>although that doesn't touch the xe_ggtt_invalidate but only ggtt_invalidat=
e_gt_tlb
>
>So, I'm still puzzled on the backlog above, but anyway,
>what we need is not this revert, but get this
>drm/xe: Fix NULL check in xe_ggtt_init()
>pushed asap

/me confused ... as I said above we'd still have the error, just not the
null deref. Unless the other patches in that series are fixing something
more.

Lucas De Marchi
