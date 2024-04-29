Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02228C4345F
	for <intel-xe@archiver.kernel.org>; Mon, 29 Apr 2024 21:03:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 939F910F214;
	Mon, 29 Apr 2024 21:03:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MuT0rIUO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3B3010F214
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Apr 2024 21:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714424612; x=1745960612;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mA4w+VkSURnudXlZ2PxvDD1zeYU3KvaA2eV7ktvEo5k=;
 b=MuT0rIUObb9pS/8B737clW+JUSJdlWW3T4ysaiBnEH4X97aTz1cNdrW3
 IOrC0xmumyWBk6nPZAHB5Lge1+F3SoWJFOrNem3AmkpnhYFvvkHdZS/Zz
 4sQu6F3dyMHkPNq+LfVkJkRdKaMmIkBKXeNkDr5xIROCF0PH4zGb5DpE9
 Qr9WyPHmSyPib2twgx9IVsRvdpa+LSquVorhBfuOAhYZJ8jwcNU163aIH
 lqXjUE5k4Syf2HN6lH669EEAXHEdRzcOesPGYP0djwdRKUOn/nIOzG7hW
 Ws89dskI9NT/fGrGKzj0ivDzunM/5j1bDV4tOvFCp9ZXv/VPiaIZ28S6i g==;
X-CSE-ConnectionGUID: ib45EycKSoa5excnOWKZaw==
X-CSE-MsgGUID: 2D7b1FYpTOWIl8ebTzlt/g==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="20792561"
X-IronPort-AV: E=Sophos;i="6.07,240,1708416000"; d="scan'208";a="20792561"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 14:03:31 -0700
X-CSE-ConnectionGUID: 5U8fLQ2nSlGzZgPcpLAkKA==
X-CSE-MsgGUID: PBnvOlHgR2e0L3IDlu7mUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,240,1708416000"; d="scan'208";a="26099270"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Apr 2024 14:03:31 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Apr 2024 14:03:30 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Apr 2024 14:03:30 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 29 Apr 2024 14:03:30 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 29 Apr 2024 14:03:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O19CGpJiCbnA6QbLcCs/woLVUTSbSJ0KhSef/Q1LvzGnItTNA6F1t9BhB6zFpU6ERW8DKl3+gQSANUxzvsmuUl3LszZXpNIcXLfkC9AAule7F+nV7jeZRxqFM1BslOJYU9VBZxJ0zpqpeq9pdjw1Y2UJhM+HjygNy/CjIxpI7BjoNmBUS2/naxmY9WLWB8zzqM6l4W9YPOAe359BlplxR5tcXP+o1IRhO91p+71D6rM+ZwZmLD2y2dCIUnGjaZqKV1CmvfINMKLZjYCxdwXRqEn1YRoI3nAEijJTm+Ku+qRpP+GSX2VXHjhUcoxPiaXEd3DSkC2Sq0PmRuZQ9Hb++w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PumeJ6NXcbhTKxuWOVQdoSlZv6eAJd8s2H2s4pJClV0=;
 b=NsB2lqwXta/Wl5ZDFp/dzo8Plv84JCt+peVhGZJxDMyG665Pqa+CdeqpgMZFwP7Z90IZMQVvX0+TNpKYOl5J+dBu/vq5BzhRd13X0bEzZZYsukqwO6GnL0RIeAh1po4pA2YrP5C0DuYJMLyNuiLiNODJ6LQilMta7Bm1bhisg/VOMbsoYVaUC8iYTaQKhIaAytdoRhpSZ5ccuhMNkha/vFrsT+YVd/Bin6NSVPryJM0qC/OTtKSRJL419Syvb7FaG8gpJFlHmFnXORx4gC40V5sXjh6+EYiwwYGe+B9gVAShYNDn+KTrI7TFAW7kCk6Qg8ct8ME/NtElYvDZif3U+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA2PR11MB5019.namprd11.prod.outlook.com (2603:10b6:806:f8::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.35; Mon, 29 Apr
 2024 21:03:28 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9365:d8e6:4e8d:8711]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9365:d8e6:4e8d:8711%6]) with mapi id 15.20.7519.031; Mon, 29 Apr 2024
 21:03:28 +0000
Date: Mon, 29 Apr 2024 16:03:25 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>,
 <vinay.belgaumkar@intel.com>, <michal.winiarski@intel.com>
Subject: Re: [PATCH 1/5] drm/xe: Drop __engine_mask
Message-ID: <2nxudidnseyqjxa7fsug2nnrudaysoqysl5vp2ftr4ikt6u4cw@ufsbnqheyovt>
References: <20240425182410.2705061-1-lucas.demarchi@intel.com>
 <20240425182410.2705061-2-lucas.demarchi@intel.com>
 <ZjADLvXstooUQk58@intel.com>
 <ZjAEtBb/P1kDQzeI@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZjAEtBb/P1kDQzeI@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: BYAPR01CA0003.prod.exchangelabs.com (2603:10b6:a02:80::16)
 To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA2PR11MB5019:EE_
X-MS-Office365-Filtering-Correlation-Id: 58c3c23f-ce32-4112-b72a-08dc688fd12e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?py1T26AJnzo+RMiPYQgHzx+nc8i0gnHYHs2PVM90zObRcmg2P8LQ9doO8xFU?=
 =?us-ascii?Q?L8sCMre82hammiC12HkUq1dWMPN/JWLBRtMQRvOV95WEIU0/5Tdq0F1JvZOf?=
 =?us-ascii?Q?B7cv9N32Muvi7QRl4n+9fNHRjz33QSRiAiv20410utV5vCvBPSGKjEizORd4?=
 =?us-ascii?Q?Bax14F47ViNrw2dy1xk3lsZdlRKFoIi0Z80wEnvRDhgpvHOBBgpgBEtGsJDX?=
 =?us-ascii?Q?d0ix/OaKIpgjScG8QkT7nivRcE3z+AUMdsyJQpCWmmCj4rbOknrOKYDznElI?=
 =?us-ascii?Q?kAnC3kLMh6ruyVkZa5AJ5XT14diiNAvPYrHs8y4e/fJVxiVXjK/m6Ma6T1po?=
 =?us-ascii?Q?GPeCkoPjNEZNAKkyugo5w1LxHienWhY+sSp91/YrBq6WqgwPbFdpQlLypeKh?=
 =?us-ascii?Q?LRE2/8050ZQwE5/Pl1jnlERjv3LvAmZlpgSkxmyE2WWJbXoobrD2x9TJwdiZ?=
 =?us-ascii?Q?P25c+kGv2Z7gbhV6oQDXaBpVFX5lz7aegdFmSBarGpNJKh9QINlfVNYiWtQZ?=
 =?us-ascii?Q?WUyz0wkKZ7FZ197k2+HoaQ56iOQInJNvPTq8Hea/HRMNcv1QtUWL8Uij/rgy?=
 =?us-ascii?Q?kKvKqrMY6fZIFinkpgHlrHYZdRvb1HzpTSh5NNvpmgwAStzQp+foEAZtf4S/?=
 =?us-ascii?Q?LjcWdEiQFGBFwTi2ASd5vdyRnCsT0Qw6HnAh/SHUNo2MhIPbTDRUpH7Hw1Ue?=
 =?us-ascii?Q?85aj7YCGsIDb5RKJVvYybHyOtDW3P3oNqmrQCl2umkAFL6QepBQaT2BLjh8t?=
 =?us-ascii?Q?b+/QiS6VoIBX6IFKwMjynxbJJwZgdgjAbrV4wHRDhWMP/U3q/pscbTNdS1eu?=
 =?us-ascii?Q?SNnBFKt7v3a/cDzpagMoj5BkDeLcmW5DxmcJtySX6kYEJK7fVqAiOXY0tNSo?=
 =?us-ascii?Q?ZMJFU5GW7ceWHijssl6ONnFPF6CzKYu0WdWC8eJ8BPgV4BF/5QzNJZ2ubFvc?=
 =?us-ascii?Q?fl9m52oWK//Wjku7FxjulVHBtASpTLy4sZ5RjGNZBvbQEiRm5lW4DG+nAibN?=
 =?us-ascii?Q?M/7YtkdJujCpFORzTQy+8jhA+oMMe1q93N/1/heLrgK6iD0KadKy8lllzvbR?=
 =?us-ascii?Q?+Iy42MV2B6xToY2j83TI4nJisYGlvwa4sqDWRpi9nDIhdnu7zUTA5/68M2wX?=
 =?us-ascii?Q?sRK8mvBaXkiASLowjvn2TCX6IHu3P8fnnOp3lN04aerYTll00AmvXxcP5vZN?=
 =?us-ascii?Q?eX/Pm/5sOEklppZsukv7HCr0TshDGteUbXLc9KptLSQrm+Unped7Cc2jgkVi?=
 =?us-ascii?Q?RqzBWJIb8TzJv0wmp+u/L4/aAzUnKk1Cs6BmW8O8aQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iSOlPTpax3NdMKvVslfs5wDrcmW5Mgd4Rd5I/G1yaMpcg2WbDOMVt/+HzLBN?=
 =?us-ascii?Q?VT3+MPEVQCyb+om0H7XomPIQaZmz0qBg8qIMbqOqYjVzoKkHt7zLjtXx5kC0?=
 =?us-ascii?Q?qUaNooQEiOt0x96Z7FY56x7NzngMXt+eaDJ3f7bJLpABbw0vftc7YUCDlbl2?=
 =?us-ascii?Q?Nl51mZAT+yWzC5L07pgPe83D5D9CB/EAkHbpxgX1LfClCqLHG3/tlgikLvVx?=
 =?us-ascii?Q?6MZ5DHR91zFswo9M5kJRLDeE4hfsa43U2MKGLDMguU30ACAyrH1vndORuy++?=
 =?us-ascii?Q?rSYa5+8dminuyaM+ogf1ACW5agAQbyl5iDMfKUDCUA+8igcloK6fPdAY5Abc?=
 =?us-ascii?Q?9ayiXtKOEH485+vV8XQHkfTpzPFpz0qv20DUPxouhfYzwTFuzQXv2WwcwdIL?=
 =?us-ascii?Q?riFYwhZ4HX4PHUkztIVIbJmzpaPFCt79JyRQuAFq27VmjftFeHbMlw3ZdeFA?=
 =?us-ascii?Q?qtkCs3Rbsl7iKs1UXyr0mLW1hX7HQA8BuKMyNQMkdLL3pPUezJJ33JQgu/vS?=
 =?us-ascii?Q?WBCaimBEatPNtiJeSLPJ6ue/oVYsXbexJud2A2//f5rGxf1tr5cwWv4ezd1F?=
 =?us-ascii?Q?4GVw4Gn1FeQAM0wUrUaGomYHNEHw12LbZHONeiQeEIuWgNP/4SSwEmdDKAM5?=
 =?us-ascii?Q?TkZevSTZXeIxaLQynj4c1KbNbIpWTdB4BHf4zySpDdoW+t1R2P/R4RYwv0hE?=
 =?us-ascii?Q?J8ZGSS81OK7CnXE1REsSzd6MBwjxN9WGuALSCbm8538DX374rvf4UatqLISu?=
 =?us-ascii?Q?7r+0I2alF/iB6J9X41ovvlktyvOa5D8jVoNK059QiY2UTvK4TdN1aU5bOp0N?=
 =?us-ascii?Q?JgkFjszx9oQyB0TxrAiezNP9YAcHrPrEkHPXtiWp41eJ68WFsb083Nc2M7Mv?=
 =?us-ascii?Q?GO/li0RXUDSP2+0HazFn2kP+0GwriMIbNi58bsCUHwptmQHo4CWfGi1qNElY?=
 =?us-ascii?Q?+h9E3fpabaQ9Q0jEgVuqfeG96D7MxTq/fqxbuCP4UHqaYBLfSpS0HxhSN0PR?=
 =?us-ascii?Q?13KpD+8l6oH9ZgrvxA543PmXTNobjpEUiNQAgvmWoSF7YPqiN14M8P+1BCq2?=
 =?us-ascii?Q?6Cnuu4oOZ+v5Tr3rwNi340DKlXHvi0FvAuGcl9M+hAY6j3Um5IcUP61RxnN/?=
 =?us-ascii?Q?E/ltpko2XrY8dy8T0VJqh7dOh0UjisvcFWtL0aYRneL93ckyZe3SKd1LfUnF?=
 =?us-ascii?Q?ZN072sqKix0flREssmr/0LFAkpvZwwIyY4juOVa/Fs5XqmUibG2e6g6Dup8o?=
 =?us-ascii?Q?ig2KevpQ8q3fIx4YQRJfqn6Q2Xr2cnAxFESDQQ7AGEB2CfCN60eB/Da9yeYt?=
 =?us-ascii?Q?rjld3Y63KCfqsKecGF1u0JEtUAOmnLZvhWaqM7hk3s5pwuionUTNY1thpu8V?=
 =?us-ascii?Q?lt3rvJgob3swAFfGU42LUEP/EaTyP0dJU/aB6Ujf4IUo03nvH8IY1hEvu0E8?=
 =?us-ascii?Q?SdBSpESp7lMcO0/I78K0ui7Y953uDsluevhMvraGFBBlzoo4BGYS1TDcGLmJ?=
 =?us-ascii?Q?5/KrN76Ae+G0TNyEhJ06adtxEl5SeIIdvGKXxyVP8vnwFoJ81SsayZnMhBgi?=
 =?us-ascii?Q?SGC0aBm04l1QHX56blhW1bLYUADJWwpW2gpRsxa4qy7kl5XirUpZU0025JN3?=
 =?us-ascii?Q?6A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 58c3c23f-ce32-4112-b72a-08dc688fd12e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2024 21:03:28.1422 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y0sMORxuMldn4h48LpJPLJ+30kzYxbZ5uLFZVzm2vLOajAqyqmJFoeoaj+1xn+h9IuZJ8Hw0s7g0/5KEhm00fuiguMIJAM1MusK7jiKRq6o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5019
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

On Mon, Apr 29, 2024 at 08:36:04PM GMT, Matthew Brost wrote:
>On Mon, Apr 29, 2024 at 04:29:34PM -0400, Rodrigo Vivi wrote:
>> On Thu, Apr 25, 2024 at 11:24:06AM -0700, Lucas De Marchi wrote:
>> > Not really used, it's just a copy of engine_mask, which already reads
>> > the fuses to mark engines as available/not-available.
>>
>> I got confused trying to understand why this ever existed.
>> It indeed doesn't make much sense on today's code.
>>
>
>That was my doing with the intent that we never use the engine mask
>until after hwconfig load as the engine mask would be read from that. Or
>alternatively in SRIOV via CTB (or MMIO) relays.
>
>i.e. it was fake way to enforce correct load ordering.

but we never used it from hwconfig (instead we kept the fake copy here)
and we never will as it doesn't have the info we need.

Instead we just went out of our way and started using __engine_mask
instead where needed. See e.g.  drivers/gpu/drm/xe/xe_migrate.c. 
I fail to see how exactly this enforces the correct load ordering. At most it
would return the wrong value and we would silently ignore it (e.g. if we
had a call like xe_hw_engine_mask_per_class() before that point since it
uses gt->info.engine_mask).

For SR-IOV, nothing overrides engine_mask anywhere. Not even if I look
at the wip branch for VF.  So, I'd say that if VF needs it, then please
add the prep together with patches making use of that because the way it
is is now it's too fragile.

>
>Assuming fuses are read after this removed LoC, the load ordering is
>correct.

fuses are read much much earlier than that, in xe_pci.c. Why would it be
wrong?

Lucas De Marchi

>
>Matt
>
>> >
>> > While at it, use XE_HW_ENGINE_BCS_MASK to span all copy engines.
>> >
>> > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>
>>
>> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>
>>
>> > ---
>> >  drivers/gpu/drm/xe/xe_gt.c       | 3 ---
>> >  drivers/gpu/drm/xe/xe_gt_types.h | 6 ------
>> >  drivers/gpu/drm/xe/xe_migrate.c  | 3 +--
>> >  drivers/gpu/drm/xe/xe_pci.c      | 6 +++---
>> >  4 files changed, 4 insertions(+), 14 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> > index e922e77f5010..00a22cf2f5b5 100644
>> > --- a/drivers/gpu/drm/xe/xe_gt.c
>> > +++ b/drivers/gpu/drm/xe/xe_gt.c
>> > @@ -515,9 +515,6 @@ int xe_gt_init_hwconfig(struct xe_gt *gt)
>> >  	if (err)
>> >  		goto out_fw;
>> >
>> > -	/* XXX: Fake that we pull the engine mask from hwconfig blob */
>> > -	gt->info.engine_mask = gt->info.__engine_mask;
>> > -
>> >  out_fw:
>> >  	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>> >  out:
>> > diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
>> > index cfdc761ff7f4..72568414fb7d 100644
>> > --- a/drivers/gpu/drm/xe/xe_gt_types.h
>> > +++ b/drivers/gpu/drm/xe/xe_gt_types.h
>> > @@ -116,12 +116,6 @@ struct xe_gt {
>> >  		u32 reference_clock;
>> >  		/** @info.engine_mask: mask of engines present on GT */
>> >  		u64 engine_mask;
>> > -		/**
>> > -		 * @info.__engine_mask: mask of engines present on GT read from
>> > -		 * xe_pci.c, used to fake reading the engine_mask from the
>> > -		 * hwconfig blob.
>> > -		 */
>> > -		u64 __engine_mask;
>> >  		/** @info.gmdid: raw GMD_ID value from hardware */
>> >  		u32 gmdid;
>> >  	} info;
>> > diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
>> > index 9f6e9b7f11c8..59a3f24d31e6 100644
>> > --- a/drivers/gpu/drm/xe/xe_migrate.c
>> > +++ b/drivers/gpu/drm/xe/xe_migrate.c
>> > @@ -936,8 +936,7 @@ static bool has_service_copy_support(struct xe_gt *gt)
>> >  	 * all of the actual service copy engines (BCS1-BCS8) have been fused
>> >  	 * off.
>> >  	 */
>> > -	return gt->info.__engine_mask & GENMASK(XE_HW_ENGINE_BCS8,
>> > -						XE_HW_ENGINE_BCS1);
>> > +	return gt->info.engine_mask & XE_HW_ENGINE_BCS_MASK;
>> >  }
>> >
>> >  static u32 emit_clear_cmd_len(struct xe_gt *gt)
>> > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> > index a0cf5dd803c2..6b2086ea24ab 100644
>> > --- a/drivers/gpu/drm/xe/xe_pci.c
>> > +++ b/drivers/gpu/drm/xe/xe_pci.c
>> > @@ -656,9 +656,9 @@ static int xe_info_init(struct xe_device *xe,
>> >  		gt = tile->primary_gt;
>> >  		gt->info.id = xe->info.gt_count++;
>> >  		gt->info.type = XE_GT_TYPE_MAIN;
>> > -		gt->info.__engine_mask = graphics_desc->hw_engine_mask;
>> > +		gt->info.engine_mask = graphics_desc->hw_engine_mask;
>> >  		if (MEDIA_VER(xe) < 13 && media_desc)
>> > -			gt->info.__engine_mask |= media_desc->hw_engine_mask;
>> > +			gt->info.engine_mask |= media_desc->hw_engine_mask;
>> >
>> >  		if (MEDIA_VER(xe) < 13 || !media_desc)
>> >  			continue;
>> > @@ -673,7 +673,7 @@ static int xe_info_init(struct xe_device *xe,
>> >
>> >  		gt = tile->media_gt;
>> >  		gt->info.type = XE_GT_TYPE_MEDIA;
>> > -		gt->info.__engine_mask = media_desc->hw_engine_mask;
>> > +		gt->info.engine_mask = media_desc->hw_engine_mask;
>> >  		gt->mmio.adj_offset = MEDIA_GT_GSI_OFFSET;
>> >  		gt->mmio.adj_limit = MEDIA_GT_GSI_LENGTH;
>> >
>> > --
>> > 2.43.0
>> >
