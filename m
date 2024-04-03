Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91602CD128A
	for <intel-xe@archiver.kernel.org>; Wed,  3 Apr 2024 23:00:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2898811245B;
	Wed,  3 Apr 2024 23:00:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fGCbX0qm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E55C112180
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Apr 2024 23:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712185224; x=1743721224;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=DdatanKDktO8tRUyx7teTVGokaNQJkz1lyS/nPaEl5Y=;
 b=fGCbX0qmZPLZkwNySXeIRzwFUEu0g/nf7Lkid36rNOCRJoCF5GxxKIaT
 EslSOb7N6URY7M05yOv29gva94zNrngrDUg+iX6Mu60jHY49zbKC1CSvY
 Q+yAFEH5S4OEKhOfmK5hOcP3S2b/VNSfPjIEdYifoDT7/XRJpcKXi8M8t
 BSQmLMLGvYchLDwQ+YPLgQNYAaR3FEyKK3UtixhTK6rTep+gq9dtZ37wR
 sMNyyF6grL3bf2uV2QGFihGkCyZ4PmAVqF2aSg5IbGYlS4CkGS18rnGwJ
 X2F42mQA+pfF63A/GYnYc1zmm6TfMpYC14tsJv1PEPxCOBoHaQkSBGdMC w==;
X-CSE-ConnectionGUID: 03q22a8tR8WCeyDJA9Uokw==
X-CSE-MsgGUID: ftMzPS0ITW+aLHrLHnfjEA==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="18063856"
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; d="scan'208";a="18063856"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 16:00:18 -0700
X-CSE-ConnectionGUID: wOL0NpfMROGu5Z3EkkVHkg==
X-CSE-MsgGUID: ltQRNsMyRsCh8aeKZgNG+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; d="scan'208";a="49818291"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Apr 2024 16:00:18 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Apr 2024 16:00:17 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Apr 2024 16:00:17 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 3 Apr 2024 16:00:17 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 3 Apr 2024 16:00:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gwLr9pLo9vQ1nG34Vxcsi1rWK65Ske2ILt1kMpA1O/S7T4hhzr0g1MVu9r1mnKNs5cZMG74cAbIRxabGFGnDEWVKZtYkrcXABdN6zvQeHV7Aw/Psn9nnEyffzM3hhR6Zw/3SdrV83lX7dLYQ4yk3giuJUdProHk1AFgAIwfwHVG9oTtd9Iwf1iPtR20tAFv4RTtfHlPGBZ1/BpjRzIHLXg1294KASlyChyMEwKEHQHqOte1K6f+Y6tgkmD24jlvHNNRKgpf7cbql1u1JpWcOq5zxj3Dy1N1+NHn+V1GToksj9BVLzxBjrYWCzvTtjavb+8tPIJ6OgPbRM5E08bdZhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MhmVp37Kb1n2b+4qKLpT/t6hFVWaWxlASXpOkarO/bk=;
 b=Brb1LgxHcauwPYzra3JzOES33z+oc0vjzKhojwzwB/ANTmDWtjKKo3e7/uo8HdUP+h4opaYz7Q6cNmkqKk/ypzHbLdMH3fcXvAT5pcnyJf/LagohOXr43dKEll/qhVt+3VhNvq6nRW6ffUCKsVc4DTf7KKzLVSJiA6poswlT5EvW7+9KzStVePfrvTryAWTDIHwjmFq648aKKHYYhlqWt6vP42o23U6+ZllUBi7z915FfOT2e6HN561HtvELXaP3uQaV3R1sL2T0zoHhwEtJEhSnCyuH8v8e62JOnpt63kqCXK31G+wnQGYIW6+E/PxDBgSjXY57axNyevsiQwPcEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ2PR11MB7455.namprd11.prod.outlook.com (2603:10b6:a03:4cd::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.18; Wed, 3 Apr
 2024 23:00:11 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493%6]) with mapi id 15.20.7452.019; Wed, 3 Apr 2024
 23:00:11 +0000
Date: Wed, 3 Apr 2024 16:00:09 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Niranjana Vishwanathapura
 <niranjana.vishwanathapura@intel.com>
Subject: Re: [PATCH] drm/xe: Label RING_CONTEXT_CONTROL as masked
Message-ID: <20240403230009.GT6571@mdroper-desk1.amr.corp.intel.com>
References: <20240403210207.3839459-1-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240403210207.3839459-1-ashutosh.dixit@intel.com>
X-ClientProxiedBy: SJ0PR03CA0215.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::10) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ2PR11MB7455:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hm0RCLqo3w0p047jbsiKMGAB12EQgZBDeT9eGc/lv1QV5PSAT36nrcwQubi7coIKmq1Njc+NzJx5khiE84SsxzsJh2huBJqbT579lEUVrcLqCh+H0mXVMAFM/wVHZJITwLo8UOBE8X/xumjh1t5Np+RTHnTjJStOzen9uQhRSL8MQDGDgtae+K+MURBczn4zlI1Ky0J1bs8lrEn2671HwfjketYf/k+7crZUYxfEvZJ16nhmyf+D3+BnjkLyH6V/RZ/t7XFCWAnljnYTXgeWmd+SqDAx0SLTc1qLUoWxsTmPix3qeqYXJW4qzgd1b6QjGiq1E8CNevM4CUtxegowojKJObmjomHVsxvO5RhJh8PlqN54lvkNEf8dZDmIpCpDW6xTmvgAv03r5e3H/KYgWu0KyJVqJ6pxkNttllVLDCP38hMC51IrrEoYy91GTbYzcptNqdQZ46dQf++2kc+0pI9d/UF3H0XlERXewR/L+juHq+NI3UCxxLYwe0qtKDzFp1k9pMpSLvKfd7cw3WwnGzOki9N08Kqc0IJqm73tJDztDowMzhr2KnjSZC/jVZKI4qmTP3HQ1bzXaXtQ3Y8NGnLOrznW4SITZ9ieMQ0fpDc50VivCncImN1xIZID4u1q1xlRA5eEgeUZRycDkJloL724Vipl+E+tgWTTnAoqDJY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4eVq3q/dQaqb8kYB/F8SUrosWOg1VFMctYLx7MbUE03czMZQD6IfkZHUaTbS?=
 =?us-ascii?Q?E8oUuH6lBcGgXyWBiKAVwt+scPyP7/shERovcM6zRcqW2PFUz32gMtapb4x5?=
 =?us-ascii?Q?x+uetlR/cKgWf6i8OrR5K4NEkV596NFTUgb32IncuQ71PmBtG0F6G101GRie?=
 =?us-ascii?Q?Ehmm0xvMH3m19NKdMqeHZagf8OaxFKIc8hwfZVZwSexBRyxqtgClqmsxAaJQ?=
 =?us-ascii?Q?yNlaPffxMylQdg8LxBhCYd95Bhq/xV1sKZqkTJHeGJTFSIhOUAHpm3hWHE2X?=
 =?us-ascii?Q?GwiniSiVThEryvmhIIJikHdfLLjJDzTVqdrXEiGVOzViysWA4oicVx6Nrdon?=
 =?us-ascii?Q?u2vC7sHP++iWCEjZI/ghgwG1SRKqiHnms9pEy/q08JAh1BIU3jb3MCh58WNp?=
 =?us-ascii?Q?BtvfUBZY+1WudBR7+OeALzfk8MkJu0grb1zcUF7gNUr2bc+5MAjVsnFzmHDN?=
 =?us-ascii?Q?R4gLlaawtdxSOncMCgbLqgHosekGn/DfM/Pho27f5gyC8XVWX7keRjuvbi2B?=
 =?us-ascii?Q?DBRbMtBNTAYbyTQ4IqAczWJBOMdJwzTnaHGT+FYGd1o/rqwwTzpEPWAD2ucc?=
 =?us-ascii?Q?k8wV036R0UUAoX0SyUrcxZvm2rC6P2BavbTT86gWqqQxCNqL5toZWHsZdps1?=
 =?us-ascii?Q?ksFZTlxa+lLv9+X6VeYqCG486nO9kktwfvg3VWISDu+fPe4RJnVQsE684QcI?=
 =?us-ascii?Q?jaEAM7ofs9k/lBD2iVix0PhhQGuiHTUqIPqIyAMPHPWGiF1Dl/uPCHZVhVkh?=
 =?us-ascii?Q?McC1/W8E99U//q5CjTs65erg1qt6hvw/0pY5ptzh53aigE8EWzKoO1ZNXMSq?=
 =?us-ascii?Q?UlQDFO3Mub3gg5OdU6LfMC5QByqvykoGyOSa5pp7gO0N14r15l7HME2pJkvt?=
 =?us-ascii?Q?4Rd2RjCV/aFNVfV/6nshqkxDD9qDsn8DgGZn8CAQUQ8n/7T3YUqG+83H48TX?=
 =?us-ascii?Q?iJZdYwmgiXNFFT1F+fPnoWbMfryrQu3vfOlZdRXSO6LjhHrkMM9rzPEV0n4d?=
 =?us-ascii?Q?231ML60UQ3sBML4zrTcoD6GIO7qfPFGKk84cgrh44uT8MKfGnp3i7BL748HH?=
 =?us-ascii?Q?JnXE8l7TXOMURxgDtxLHRz/ItHK+lSM96mHmqN5bn66pioIVli6bIBRiqyAu?=
 =?us-ascii?Q?MLoQUDKhfFE6sB54loCV3Is18G4zl2pt0KwCtYAIzbOTNGiwT1XNKvGVsT09?=
 =?us-ascii?Q?A4zJ15Lqp+CO0Aeu2yq9GQh9yRZMfpSsyihT7Hyk16GUh1PFhZWF7SuPB5ze?=
 =?us-ascii?Q?0kSbeFWiv+6wRO6ju047IewY36xLIysUVmM1NF4C9e3wRXTai9VehpyHRSHu?=
 =?us-ascii?Q?lEMDmXKNM4NshLwNX351lo6afSX75jmy6jTmhYfp9PNqSd4FyCqHNGzoFlDf?=
 =?us-ascii?Q?KdsI+/+FCnAasn5J2y3OKZ2iqzaaBJ6xCZ3hKSsvSuufm46hwWvI12IpKjq5?=
 =?us-ascii?Q?mes6DhuvvX9PJP6GgC9gz51gBlP5yuue3OSAGiaeUy7DkVGSwuPKdpIYvGDU?=
 =?us-ascii?Q?WiG3WT6BwrM8KgYjgnNp4sBnyO9KvrpyRjbq9fecz9BLJmC5Fz4Cz3MzzQ+z?=
 =?us-ascii?Q?k2ek2MqB0hyaHgsfhLn9vIV5fIcTIHAmbPuWJvqUZf1/K3L4iWEL9QJ3XczX?=
 =?us-ascii?Q?3Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a992e4ee-153e-4ef7-6fbc-08dc5431d098
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2024 23:00:11.1309 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2KwA78p4UVqfjxHhE1NZZ6+ch+cZNZnONLT1/4Mc3Rkk97FczXX3MNdWcrEIK2GIbsGat0y9veZ2qY5bEr1vTblg2Us+nUAI/38N4vwOVLQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7455
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

On Wed, Apr 03, 2024 at 02:02:07PM -0700, Ashutosh Dixit wrote:
> RING_CONTEXT_CONTROL is a masked register.
> 
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/regs/xe_engine_regs.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> index a08528d9c76b..af71b87d8030 100644
> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> @@ -122,7 +122,7 @@
>  #define RING_EXECLIST_STATUS_LO(base)		XE_REG((base) + 0x234)
>  #define RING_EXECLIST_STATUS_HI(base)		XE_REG((base) + 0x234 + 4)
>  
> -#define RING_CONTEXT_CONTROL(base)		XE_REG((base) + 0x244)
> +#define RING_CONTEXT_CONTROL(base)		XE_REG((base) + 0x244, XE_REG_OPTION_MASKED)
>  #define	  CTX_CTRL_INHIBIT_SYN_CTX_SWITCH	REG_BIT(3)
>  #define	  CTX_CTRL_ENGINE_CTX_RESTORE_INHIBIT	REG_BIT(0)
>  
> -- 
> 2.41.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
