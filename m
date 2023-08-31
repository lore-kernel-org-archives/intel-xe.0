Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 035D7C83F2B
	for <intel-xe@archiver.kernel.org>; Thu, 31 Aug 2023 06:28:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBE0110E57E;
	Thu, 31 Aug 2023 06:28:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2811E10E572;
 Thu, 31 Aug 2023 06:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693463325; x=1724999325;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=jdkz6tg7mWZFqtaiiQAKpReoRlCI0416/Es2I5i2nds=;
 b=L9s29vtD+TVSEHr9z8yuqpED/L6/sXUcAlhA+OoMB6nAZMONlefZlQw1
 V6Q44xvvFyWwRoXj9HqXnNaghNavn9Zz+yAuWgniL8u0ZhTJn7EeuWoaV
 hmFpv7AZLnw9oY+R42RE/CR2o04BB+FbfbNDLfUCTpdUd9/uZHdV8LB93
 cIr30wCKISmLpldxdPp4LeIy5JwbEwVao+1AGSTCVMZqlUOhpT1ExqoNU
 smqepjc7e+zZ/T/I1z01ZCSokcT3CKtSpYJFXpDKeYskPtcxI5W76HAfn
 Ua6Da8tk4ME0U185DLLeMpUPnxwrZtBnM64hObCaVAiRdSmNsKtUIkNsq Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="374742691"
X-IronPort-AV: E=Sophos;i="6.02,215,1688454000"; d="scan'208";a="374742691"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2023 23:28:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="986065870"
X-IronPort-AV: E=Sophos;i="6.02,215,1688454000"; d="scan'208";a="986065870"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP; 30 Aug 2023 23:28:43 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 30 Aug 2023 23:28:43 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 30 Aug 2023 23:28:43 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 30 Aug 2023 23:28:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eVZgio7YTCSb5+h/5D1ppK+/Fyl5CwULDFrbIu0smZ2d9hZAo3r3hFdFH1wrWOTvfroByFe3IjfUh2jCQXY1uo1KDif7JCkOlwyvLMU9ldyc51b80VKeq+KsSUH+x9PFZAIvMEM6rUdCUeh52j7XJUuke9yfR0AWz18gGrBLGdrKs3YAQA6FQjzJ8pmly5jI5LeoPiOmp9b/C3UIDNYUPId/M5t82xTMmr3Bb005icCfzCqed7sNIaGN46E5i40HIAvTLMlkI1I6PFE6wwrOzw87j7rKuQyiiHl54iXTLy2jkw2+J05yY8GDlRU5dUt7B3F4ZmLn/mc0adt9ULR7lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ahBZ9+zgxn8QuCO6qYoUKAinmYoFYvEDmoT+zh/N8kU=;
 b=fbPKUJe5dnkw2yFEcAwNDlKu9DIfkTWV8LUqHHmurjhT0SzdVgfBDgAih03TCk+oybl6d+1qDZc3z8mtv7cxufGYBLK2DX65A8T5trkMB/5XamtMoBVYgSdc7A6jNviS4abpOWkZpxP7phO4VdJ02gcGyUOFQVltsbzh5ZSBP3qVkoUaJdEWKL7/MPvUB6ZbyMxzwvWFGhyFxOx3cZ+N5cNj1U2Ad8nEZ7NJiqeNBIYVCSr1H4sPmQvbo0EWSnUt4gWindybPCTxQLzVMPtWHqZ4W5DWNBrp1aShhafZjCtKp3fVoXg76QnypyV3ezke38Gk1OUKGQFiNdM/bH1hCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by DS0PR11MB8737.namprd11.prod.outlook.com (2603:10b6:8:1a1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.20; Thu, 31 Aug
 2023 06:28:41 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::864b:5f88:8b9d:517f]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::864b:5f88:8b9d:517f%4]) with mapi id 15.20.6699.034; Thu, 31 Aug 2023
 06:28:41 +0000
Date: Thu, 31 Aug 2023 11:58:23 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, <igt-dev@lists.freedesktop.org>
Message-ID: <ZPAzB95lw3vSqgan@bvivekan-mobl>
References: <20230829141107.1505705-1-lucas.demarchi@intel.com>
 <20230829141107.1505705-2-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230829141107.1505705-2-lucas.demarchi@intel.com>
X-ClientProxiedBy: MA0PR01CA0119.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::19) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|DS0PR11MB8737:EE_
X-MS-Office365-Filtering-Correlation-Id: 27447f28-2b38-4bed-8166-08dba9eb848f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: shttpM4r2BoHUVdffEVIHFirpQnanjaZCY5z0rnrG5GvU01aEfWYLQnqK7THnJWk8oXtvjMEdJyv/DKGS0zAOkRPz/QG+sS9MVe8I3dtncc6UcSyLmnC/Auitm39QCiRmwaVtM7A6MvJMVkSecH7pHPVXL91sS0V1v8Iqfs1x+Lslqxgayk49PMVmhCHsi5aLvxW+pUQG384ysq/47sYK+0cysqXcTGFwtZvGrO2aTpgvo/0o9bDgPN4YOex9WikXKXz28CaumGA+0hzPgGOiRCityNhTaS3StNiGkot79ANQ9TkiZ4eYkE7a2EuZZYVJ3hmXUnyQoM4b80/DLQvrhMBtleJ4O/QtyeA1nPoK4Gd5330uvb9gq1rjRw8CwZserlFhdvWPgQsognlUTHmB2kQIjJWl9lHsxAB0am0mPwcWSq/NN7jd6FfYsin2t6c8HSHKFzAqNiSkdXvJncHBH8MP3Zsr297uSJu/Q8jmJHgupFE4QLzoCtiKnN7356H39v0t1Wr0ePbf8kd36MUzg9AQYkhlIuXHg09Nw5G6Ao13gNXFxlbG30meQ03vR/0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(346002)(376002)(366004)(396003)(136003)(1800799009)(186009)(451199024)(450100002)(33716001)(41300700001)(8936002)(66556008)(8676002)(4326008)(66476007)(478600001)(6666004)(66946007)(316002)(6512007)(6486002)(6506007)(53546011)(9686003)(2906002)(38100700002)(82960400001)(5660300002)(44832011)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGhjcUdHNmhDZlVNL2oxdE5xc0E1RVNmeXcrKzhUbWdLOEl5azJQZTBBekpm?=
 =?utf-8?B?ZE9ZM2k4ZmZ3N3M3c0NIRVpKNnQxWWV2b0FwbHcrUnl2bk9vVVR1OXllR24y?=
 =?utf-8?B?b2w4TDFrNDE1Znh0Wlp6eUpKZVlpUThmWjBaSFFGNko5REt4MUtXVFJ6ZjFi?=
 =?utf-8?B?RXBBeXdNTEZJRzlVYXg4R3QxaUdvM2Z3SjVYNVJhV1A1SnpNSG5vUmNreVF5?=
 =?utf-8?B?b1ZjUitzZ0V0WXhTS3hOQzNxTTMza0doNExuUlN4SWpwblVLMWJ3bkRheSti?=
 =?utf-8?B?NzM1UUt5TVNud0Exb3JJUHZiaHpxRWppbnhZUG4zdmZYZjBWZ3VTNFQ2ZDRK?=
 =?utf-8?B?UStWeXV0U2FESjd1dGFkNzh0a2NIZWxLdzg0V3pubGNtY3lpaVF3MkdsWllF?=
 =?utf-8?B?cm5KTVpFeS9DRE5MTTBIbW9JVHZUaElOaTRrNkpXYU5Bc1Y5aGdkaU9ZeUky?=
 =?utf-8?B?d1RHbDF2Y21SS3Y0L1BoRWVGUVByZWFlOWdqZC9MbzhWbHREZTUwWWVudFRo?=
 =?utf-8?B?MzNjbTRuVC8xTWxXM0h1dUt5SktNdkJQcmF4NGFlTk5qZ3hjYklScW5QaUVi?=
 =?utf-8?B?QUZ1R1N1c01SS3BMbitMc1FyVUNTM1QxTHEyN3VPTFVpY3lIUGFLQzBtWGIy?=
 =?utf-8?B?dFVvN0Q5TzAzQk1XOUtYVFAzR2lMMGluRjZIRmJUUjB0d01xN3lzL1lHMmJQ?=
 =?utf-8?B?eUFTSlAyY0xvM0czVVZKTlFMaHJ3emY4Vkx1R3R4YWlFNmJJS1pGTnVVczJE?=
 =?utf-8?B?YkZPTWlFV2tndmxweWZWcmw5TmRvYWZHY3g3NFdWckQ3S2V2YVl5TUxvVEx0?=
 =?utf-8?B?MHNMbHJaNTNyM3dBcm95OSswb0xHemxHK2M4dzBqNnhXaTc2bUlVdHozc2ow?=
 =?utf-8?B?bmgzWHBMVDQvL2JmWXc1dm1HZDBobG9OQnVtTzdsdlBKZ2dBMmR4VTl4dkgv?=
 =?utf-8?B?QnpwbmI0NytFeVBKL2hMaS9FSzNXNmsybVRNVEhlQ3BMdUdMZWZCcjdwTG5k?=
 =?utf-8?B?elRQb1dURWtPT0NqRzRNcjl5Z0RTNTVWWTllWUc1ajVQNlArVGZqb3VMaUlt?=
 =?utf-8?B?SG1sQU1aQ3pPbFloRXl3OW9pTk56N0h5VWxkL2xsSGtteDlHaDU3ZGFBS1FJ?=
 =?utf-8?B?V0Q4OStxRGdDc3JNbWVDVG40WkMzSjgzU3A0RmFuR1ZJdUpURldGalZCM1d3?=
 =?utf-8?B?VDJQNUoxSHo4aldrSVhORFJpeVhTVWpwQy9tL2JaZ0RHcUNHUXZvY3Biczd1?=
 =?utf-8?B?YlpPUjQzZlk2b2F6Z0FsRHU1dWViaGtzR0pnb3BKNW1pTnJMMWQzZTBHei8v?=
 =?utf-8?B?TVZWclI2bnYrMjNPMC9XRWhGTktuZFVEdFBQVUNIWWJ5OEhzSVRKMFlSbnMv?=
 =?utf-8?B?NTdwVHhEVyt1VmZldlU5WnNMak5ac1EyL2YyMzByZ014TU9kTnRLQ2ZjNGlH?=
 =?utf-8?B?TWkzdmxqRlZXeG1ZN2lMdm56dE1qc0d6cnRlT0QzdTNHQzRnMklCNWlCWWha?=
 =?utf-8?B?MExpMkdGMjNLaFBmMEs2Q2tHb0VUWFNnMmNXM0RyaFA0TG1mRHdmOW1uUU1V?=
 =?utf-8?B?cC9VZEc3MFROR1ZLeU04V1NOSHp3OUV0M2w3d0Jyb3RZajUxdVkwSC82Wkh0?=
 =?utf-8?B?bFd6djRoeVlqUVp4SURReTB6amcwSDhockRTMVEraTFBVW8wZjB0cktBZlJM?=
 =?utf-8?B?dGJRVTdGUWJwMFpkakpERVN3KzdPK2h5YkZQS05hOTRwbGtjTmZuQjNHY2pP?=
 =?utf-8?B?TlkySFU4ZzJ3T0Z4Rm1KaTRJRlBkY3QycisxTWFRNktnakZlZnd5YVR1OTJZ?=
 =?utf-8?B?K0xMVVhMbE1YODJpRko4Mmt6RGZvUVVReklyUU5rQ1FvZzRSQkVoUk8xcjd3?=
 =?utf-8?B?ZnpDNC9Ec0RIMHlYaDZhbUtHVFJmM3JJdVpkN1pXVGF2VWRMNFVsZWppYnBP?=
 =?utf-8?B?N3pvUkFHYTRjNWQxcnJVay85RFQvMlBDM1owZ1B4R1BQeGhHSmYxdGRHZVY2?=
 =?utf-8?B?NE9jU0krd0dqQ3Zyd0N0M3pjNDJQeVIzT1B5K25uL1Z6MGYzSVp4dGE3K0tw?=
 =?utf-8?B?ekxLM0hTeXNodUF6S2ZWQVJ2S2ZIY0RDZHJIby9KNXpERjBHWjRzZTlTMTE2?=
 =?utf-8?B?d3BtZUxmbzN6bWNzUytwWCtuanZwd3orSFBZc1daZzZ0YzR6WkJUWU05Z0Yw?=
 =?utf-8?B?K2RwNDc0TDNOZUVyc0pWdDMzVDVwcHVaa0s2KzFJR0lNY281WjF4VUNzeFhO?=
 =?utf-8?B?QlRvOXNvMnVWK2ZOM0l6SmQ0SnlGV3VwQ3lJUWwzSmFGSTJyb2JRTUR0Zlli?=
 =?utf-8?Q?J6OG4yclc7cnrwcu4Q?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 27447f28-2b38-4bed-8166-08dba9eb848f
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 06:28:41.2466 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uj3gZ+iwTVCbrj7KRhszn6wqQ3LkKlyIsJeeSY2n6sTYgTbcKzROoVpfNIQpvczxdyRqtr2c/GipFM7r1yqpIbWi0YFlxYo2LDzXDxsJUee21nlEixuA2tMWS4X5pb5h
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8737
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH igt 1/4] lib: Add xe_pciids.h
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 29.08.2023 07:11, Lucas De Marchi wrote:
> With the introduction of Lunar Lake, igt won't be able to just re-use
> i915_pciids.h for both drivers anymore since the support for LNL is only
> coming with the xe module. Copy xe_pciids.h from the drm-xe-next branch
> (up to commit b9c9020fc816 ("drm/xe/pvc: Use fast copy engines as
> migrate engine on PVC") and start including it where needed. This brings
> all the LNL PCI IDs.

I couldn't find the commit hash b9c9020fc816. Is it lost due to rebase?
In that case, does it make sense to use the commit hash or just keep the
commit subject?

Regards,
Bala

> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  docs/reference/igt-gpu-tools/meson.build |   1 +
>  lib/intel_device_info.c                  |   1 +
>  lib/xe_pciids.h                          | 215 +++++++++++++++++++++++
>  3 files changed, 217 insertions(+)
>  create mode 100644 lib/xe_pciids.h
> 
> diff --git a/docs/reference/igt-gpu-tools/meson.build b/docs/reference/igt-gpu-tools/meson.build
> index 6b832ad27..513385b4b 100644
> --- a/docs/reference/igt-gpu-tools/meson.build
> +++ b/docs/reference/igt-gpu-tools/meson.build
> @@ -21,6 +21,7 @@ ignore_headers = [
>  	'media_fill_gen9.h',
>  	'gen9_render.h',
>  	'version.h',
> +	'xe_pciids.h',
>  ]
>  
>  test_groups = [
> diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
> index 2c9a45b68..5d53d2906 100644
> --- a/lib/intel_device_info.c
> +++ b/lib/intel_device_info.c
> @@ -1,6 +1,7 @@
>  #include "intel_chipset.h"
>  #include "i915_pciids.h"
>  #include "i915_pciids_local.h"
> +#include "xe_pciids.h"
>  
>  #include <strings.h> /* ffs() */
>  
> diff --git a/lib/xe_pciids.h b/lib/xe_pciids.h
> new file mode 100644
> index 000000000..29f07a00a
> --- /dev/null
> +++ b/lib/xe_pciids.h
> @@ -0,0 +1,215 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2022 Intel Corporation
> + */
> +
> +#ifndef _XE_PCIIDS_H_
> +#define _XE_PCIIDS_H_
> +
> +/*
> + * Lists below can be turned into initializers for a struct pci_device_id
> + * by defining INTEL_VGA_DEVICE:
> + *
> + * #define INTEL_VGA_DEVICE(id, info) { \
> + *	0x8086, id,			\
> + *	~0, ~0,				\
> + *	0x030000, 0xff0000,		\
> + *	(unsigned long) info }
> + *
> + * And then calling like:
> + *
> + * XE_TGL_12_GT1_IDS(INTEL_VGA_DEVICE, ## __VA_ARGS__)
> + *
> + * To turn them into something else, just provide a different macro passed as
> + * first argument.
> + */
> +
> +/* TGL */
> +#define XE_TGL_GT1_IDS(MACRO__, ...)		\
> +	MACRO__(0x9A60, ## __VA_ARGS__),	\
> +	MACRO__(0x9A68, ## __VA_ARGS__),	\
> +	MACRO__(0x9A70, ## __VA_ARGS__)
> +
> +#define XE_TGL_GT2_IDS(MACRO__, ...)		\
> +	MACRO__(0x9A40, ## __VA_ARGS__),	\
> +	MACRO__(0x9A49, ## __VA_ARGS__),	\
> +	MACRO__(0x9A59, ## __VA_ARGS__),	\
> +	MACRO__(0x9A78, ## __VA_ARGS__),	\
> +	MACRO__(0x9AC0, ## __VA_ARGS__),	\
> +	MACRO__(0x9AC9, ## __VA_ARGS__),	\
> +	MACRO__(0x9AD9, ## __VA_ARGS__),	\
> +	MACRO__(0x9AF8, ## __VA_ARGS__)
> +
> +#define XE_TGL_IDS(MACRO__, ...)		\
> +	XE_TGL_GT1_IDS(MACRO__, ## __VA_ARGS__),\
> +	XE_TGL_GT2_IDS(MACRO__, ## __VA_ARGS__)
> +
> +/* RKL */
> +#define XE_RKL_IDS(MACRO__, ...)		\
> +	MACRO__(0x4C80, ## __VA_ARGS__),	\
> +	MACRO__(0x4C8A, ## __VA_ARGS__),	\
> +	MACRO__(0x4C8B, ## __VA_ARGS__),	\
> +	MACRO__(0x4C8C, ## __VA_ARGS__),	\
> +	MACRO__(0x4C90, ## __VA_ARGS__),	\
> +	MACRO__(0x4C9A, ## __VA_ARGS__)
> +
> +/* DG1 */
> +#define XE_DG1_IDS(MACRO__, ...)		\
> +	MACRO__(0x4905, ## __VA_ARGS__),	\
> +	MACRO__(0x4906, ## __VA_ARGS__),	\
> +	MACRO__(0x4907, ## __VA_ARGS__),	\
> +	MACRO__(0x4908, ## __VA_ARGS__),	\
> +	MACRO__(0x4909, ## __VA_ARGS__)
> +
> +/* ADL-S */
> +#define XE_ADLS_IDS(MACRO__, ...)		\
> +	MACRO__(0x4680, ## __VA_ARGS__),	\
> +	MACRO__(0x4682, ## __VA_ARGS__),	\
> +	MACRO__(0x4688, ## __VA_ARGS__),	\
> +	MACRO__(0x468A, ## __VA_ARGS__),	\
> +	MACRO__(0x4690, ## __VA_ARGS__),	\
> +	MACRO__(0x4692, ## __VA_ARGS__),	\
> +	MACRO__(0x4693, ## __VA_ARGS__)
> +
> +/* ADL-P */
> +#define XE_ADLP_IDS(MACRO__, ...)		\
> +	MACRO__(0x46A0, ## __VA_ARGS__),	\
> +	MACRO__(0x46A1, ## __VA_ARGS__),	\
> +	MACRO__(0x46A2, ## __VA_ARGS__),	\
> +	MACRO__(0x46A3, ## __VA_ARGS__),	\
> +	MACRO__(0x46A6, ## __VA_ARGS__),	\
> +	MACRO__(0x46A8, ## __VA_ARGS__),	\
> +	MACRO__(0x46AA, ## __VA_ARGS__),	\
> +	MACRO__(0x462A, ## __VA_ARGS__),	\
> +	MACRO__(0x4626, ## __VA_ARGS__),	\
> +	MACRO__(0x4628, ## __VA_ARGS__),	\
> +	MACRO__(0x46B0, ## __VA_ARGS__),	\
> +	MACRO__(0x46B1, ## __VA_ARGS__),	\
> +	MACRO__(0x46B2, ## __VA_ARGS__),	\
> +	MACRO__(0x46B3, ## __VA_ARGS__),	\
> +	MACRO__(0x46C0, ## __VA_ARGS__),	\
> +	MACRO__(0x46C1, ## __VA_ARGS__),	\
> +	MACRO__(0x46C2, ## __VA_ARGS__),	\
> +	MACRO__(0x46C3, ## __VA_ARGS__)
> +
> +/* ADL-N */
> +#define XE_ADLN_IDS(MACRO__, ...)		\
> +	MACRO__(0x46D0, ## __VA_ARGS__),	\
> +	MACRO__(0x46D1, ## __VA_ARGS__),	\
> +	MACRO__(0x46D2, ## __VA_ARGS__)
> +
> +/* RPL-S */
> +#define XE_RPLS_IDS(MACRO__, ...)		\
> +	MACRO__(0xA780, ## __VA_ARGS__),	\
> +	MACRO__(0xA781, ## __VA_ARGS__),	\
> +	MACRO__(0xA782, ## __VA_ARGS__),	\
> +	MACRO__(0xA783, ## __VA_ARGS__),	\
> +	MACRO__(0xA788, ## __VA_ARGS__),	\
> +	MACRO__(0xA789, ## __VA_ARGS__),	\
> +	MACRO__(0xA78A, ## __VA_ARGS__),	\
> +	MACRO__(0xA78B, ## __VA_ARGS__)
> +
> +/* RPL-U */
> +#define XE_RPLU_IDS(MACRO__, ...)		\
> +	MACRO__(0xA721, ## __VA_ARGS__),	\
> +	MACRO__(0xA7A1, ## __VA_ARGS__),	\
> +	MACRO__(0xA7A9, ## __VA_ARGS__)
> +
> +/* RPL-P */
> +#define XE_RPLP_IDS(MACRO__, ...)		\
> +	MACRO__(0xA720, ## __VA_ARGS__),	\
> +	MACRO__(0xA7A0, ## __VA_ARGS__),	\
> +	MACRO__(0xA7A8, ## __VA_ARGS__)
> +
> +/* DG2 */
> +#define XE_DG2_G10_IDS(MACRO__, ...)		\
> +	MACRO__(0x5690, ## __VA_ARGS__),	\
> +	MACRO__(0x5691, ## __VA_ARGS__),	\
> +	MACRO__(0x5692, ## __VA_ARGS__),	\
> +	MACRO__(0x56A0, ## __VA_ARGS__),	\
> +	MACRO__(0x56A1, ## __VA_ARGS__),	\
> +	MACRO__(0x56A2, ## __VA_ARGS__)
> +
> +#define XE_DG2_G11_IDS(MACRO__, ...)		\
> +	MACRO__(0x5693, ## __VA_ARGS__),	\
> +	MACRO__(0x5694, ## __VA_ARGS__),	\
> +	MACRO__(0x5695, ## __VA_ARGS__),	\
> +	MACRO__(0x5698, ## __VA_ARGS__),	\
> +	MACRO__(0x56A5, ## __VA_ARGS__),	\
> +	MACRO__(0x56A6, ## __VA_ARGS__),	\
> +	MACRO__(0x56B0, ## __VA_ARGS__),	\
> +	MACRO__(0x56B1, ## __VA_ARGS__)
> +
> +#define XE_DG2_G12_IDS(MACRO__, ...)		\
> +	MACRO__(0x5696, ## __VA_ARGS__),	\
> +	MACRO__(0x5697, ## __VA_ARGS__),	\
> +	MACRO__(0x56A3, ## __VA_ARGS__),	\
> +	MACRO__(0x56A4, ## __VA_ARGS__),	\
> +	MACRO__(0x56B2, ## __VA_ARGS__),	\
> +	MACRO__(0x56B3, ## __VA_ARGS__)
> +
> +#define XE_DG2_IDS(MACRO__, ...)		\
> +	XE_DG2_G10_IDS(MACRO__, ## __VA_ARGS__),\
> +	XE_DG2_G11_IDS(MACRO__, ## __VA_ARGS__),\
> +	XE_DG2_G12_IDS(MACRO__, ## __VA_ARGS__)
> +
> +#define XE_ATS_M150_IDS(MACRO__, ...)		\
> +	MACRO__(0x56C0, ## __VA_ARGS__)
> +
> +#define XE_ATS_M75_IDS(MACRO__, ...)		\
> +	MACRO__(0x56C1, ## __VA_ARGS__)
> +
> +#define XE_ATS_M_IDS(MACRO__, ...)		\
> +	XE_ATS_M150_IDS(MACRO__, ## __VA_ARGS__),\
> +	XE_ATS_M75_IDS(MACRO__, ## __VA_ARGS__)
> +
> +/* PVC */
> +#define XE_PVC_XT_IDS(MACRO__, ...)		\
> +	MACRO__(0x0BD5, ## __VA_ARGS__),	\
> +	MACRO__(0x0BD6, ## __VA_ARGS__),	\
> +	MACRO__(0x0BD7, ## __VA_ARGS__),	\
> +	MACRO__(0x0BD8, ## __VA_ARGS__),	\
> +	MACRO__(0x0BD9, ## __VA_ARGS__),	\
> +	MACRO__(0x0BDA, ## __VA_ARGS__),	\
> +	MACRO__(0x0BDB, ## __VA_ARGS__),	\
> +	MACRO__(0x0BE0, ## __VA_ARGS__),	\
> +	MACRO__(0x0BE1, ## __VA_ARGS__),	\
> +	MACRO__(0x0BE5, ## __VA_ARGS__)
> +
> +#define XE_PVC_IDS(MACRO__, ...)		\
> +	XE_PVC_XT_IDS(MACRO__, ## __VA_ARGS__)
> +
> +/* MTL */
> +#define XE_MTL_M_IDS(MACRO__, ...)		\
> +	MACRO__(0x7D40, ## __VA_ARGS__),	\
> +	MACRO__(0x7D43, ## __VA_ARGS__),	\
> +	MACRO__(0x7DC0, ## __VA_ARGS__)
> +
> +#define XE_MTL_P_IDS(MACRO__, ...)		\
> +	MACRO__(0x7D45, ## __VA_ARGS__),	\
> +	MACRO__(0x7D47, ## __VA_ARGS__),	\
> +	MACRO__(0x7D50, ## __VA_ARGS__),	\
> +	MACRO__(0x7D55, ## __VA_ARGS__),	\
> +	MACRO__(0x7DC5, ## __VA_ARGS__),	\
> +	MACRO__(0x7DD0, ## __VA_ARGS__),	\
> +	MACRO__(0x7DD5, ## __VA_ARGS__)
> +
> +#define XE_MTL_S_IDS(MACRO__, ...)		\
> +	MACRO__(0x7D60, ## __VA_ARGS__),	\
> +	MACRO__(0x7DE0, ## __VA_ARGS__)
> +
> +#define XE_ARL_IDS(MACRO__, ...)		\
> +	MACRO__(0x7D67, ## __VA_ARGS__)
> +
> +#define XE_MTL_IDS(MACRO__, ...)		\
> +	XE_MTL_M_IDS(MACRO__, ## __VA_ARGS__),	\
> +	XE_MTL_P_IDS(MACRO__, ## __VA_ARGS__),	\
> +	XE_MTL_S_IDS(MACRO__, ## __VA_ARGS__),	\
> +	XE_ARL_IDS(MACRO__, ## __VA_ARGS__)
> +
> +#define XE_LNL_IDS(MACRO__, ...) \
> +	MACRO__(0x6420, ## __VA_ARGS__), \
> +	MACRO__(0x64A0, ## __VA_ARGS__), \
> +	MACRO__(0x64B0, ## __VA_ARGS__)
> +
> +#endif
> -- 
> 2.40.1
> 
