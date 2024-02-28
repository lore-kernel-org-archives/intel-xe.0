Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBE37C5478C
	for <intel-xe@archiver.kernel.org>; Wed, 28 Feb 2024 15:09:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AA0B10E102;
	Wed, 28 Feb 2024 15:09:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gR00LYtv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69BA910E102
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Feb 2024 15:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709132957; x=1740668957;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=9yZZ+ZDZwEKIFT7MUPH1CPqdsi+PM67abZTrEYDNJqE=;
 b=gR00LYtvhMOKO9MMCniDWTAO0GfanfdGbPtUX5s+x8fDQkNPL9b/+/56
 /agb7XiEBa4BUT7Ptm/EgDnIF+PNCyq4zWP0YSKcDzf6awX0kNrDut4tQ
 ZsVBNpQl8lE7KcjgoElez2TsYfAV9hYA7je9ThmsFxgvTCyUbJC24FuZH
 A8MB0KRD/vmb5Ow3l3EBHVf+HUdGHt9ztSogyFtfQCbXp8dy8TUZmPLZp
 Zi5LF4b59ddWqnISXALQDXvu5rqT8cZ3Shf1/zfSF5oaf6pLfFg4yIi++
 SNbz7uGZpS6ECd8rfPx2z6yXmZ7sVKIUmjrYLBrQqpFgcuTez4MCCYene g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="28970623"
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; d="scan'208";a="28970623"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 07:09:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; d="scan'208";a="12032223"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Feb 2024 07:09:15 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 28 Feb 2024 07:09:15 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 28 Feb 2024 07:09:15 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 28 Feb 2024 07:09:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m+SVavl0OeCYjstCSENWK/udZbvrTUThWMdpT+jrrcP6crX4JU8lvEufZ9fpQHc5i6gBgcB+oFTfa7LtlyQMISTBfcXFfEVzfFTncA2rX+Oiq+MUGatTqXL331TNS7DUdrhBzfz1mtig9uSLp87z9QRLNHyiLxeBCVXos4ILhBgujIQjT91Qwc8FRdQu1RXAC8xBAL5TBTUKyS7H8eqlaX9FNavx+ArFig7XHEKhH0LgnUN4BmUj0BHGOWm6RVE+QXAJlzi4DcODagsLpdkvuGLmH9Il+PRMmG8BMvrM+VfiQaJUjYAGjpVV2a809sa1KYz6xukhTbUgcJvXEWdvmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IFAZE0MeGfescN+zwvGWQ9wtJ80xeNl4h6GgxH6wn9Q=;
 b=islNMuhyYmovwxgkOWIHriiuOmrbr+Lkt0Fe3h/0yDgR5H8Wxjj4dsszBGp3Y4tgMSzN52UUyfbcsACL4mW96k/XPaR176N4r8dJ11Meh+p6jkT9bo4BqSzEy59/7BiJtHGM/u0VZ/5sQOCjifW+0zGvqZQNzCgbO6PwubaQnWXXJfJJyxgIUh46iPkyS0v19lI3wWJo8HOTLZ3WGW/eD/dW1JB564lLWXi/O92DOgki5hKsxQtFV8PCTNZNZRP7Ca8FGcQ6DZg7K9xkrKIu1pMJBCJxxe9mtOIxXcIgVZD1kFJ3gOge6A77BY1BW9TMEzpC1WxPBmkaJpnhuGe0Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5624.namprd11.prod.outlook.com (2603:10b6:8:35::16) by
 IA1PR11MB7678.namprd11.prod.outlook.com (2603:10b6:208:3f4::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.24; Wed, 28 Feb
 2024 15:09:12 +0000
Received: from DM8PR11MB5624.namprd11.prod.outlook.com
 ([fe80::d14c:c9b8:75b8:6add]) by DM8PR11MB5624.namprd11.prod.outlook.com
 ([fe80::d14c:c9b8:75b8:6add%4]) with mapi id 15.20.7339.024; Wed, 28 Feb 2024
 15:09:12 +0000
Message-ID: <855d5345-a208-412d-a8f8-ca8eb1bdf803@intel.com>
Date: Wed, 28 Feb 2024 20:39:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Add LRC parsing for more GPU instructions
Content-Language: en-US
To: <intel-xe@lists.freedesktop.org>
References: <20240222184009.6857-2-matthew.d.roper@intel.com>
From: "Vodapalli, Ravi Kumar" <ravi.kumar.vodapalli@intel.com>
In-Reply-To: <20240222184009.6857-2-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0123.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:6::8) To DM8PR11MB5624.namprd11.prod.outlook.com
 (2603:10b6:8:35::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5624:EE_|IA1PR11MB7678:EE_
X-MS-Office365-Filtering-Correlation-Id: a66a8a0e-114d-498f-12dc-08dc386f38c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K5eeD2CpvJ9IisOPPEv0i/gAuL+obdGwz8c8WA9gV800AWuElgB7j3Tv9F+qNmbSoYBZeD8FlAz4hGq9sky+2/peLOPUX/LCLj0vksi3cMB3sbdH/Y47LTE8NtmxYQLDw5SFdS5rAH21Nu6gpNXyx1yqApNZzSkJSv8a9ghYNzNLPjoNia3HRHTShuxV+F87DE4+dXhO+RsfAja6O8Xtxt9+JUA2yYjjKjGHGglZ3TUpX2Ge/p8iq4xkyj+r3xtBWOA2Z2ALgfxNkev5PQUxQWjtzlKrXlLVnAHM1iPZHJ0/0EOUZKPH8pmE1spmQIOkfVALWKbgaMujJ731VDtwqxqYaIpoUF/QllVArfdS+FM3x4J52uTDhVAcNWlgiElLGN0ZVcQSZmPwBez+huK/nFHCkAVZwvmqxGECT+8BA0Qzk5px672xN8UoYa3TKwQTbL7LKV6soUXl8ckIDLExe3JTHcs/oqrPdjePLxhxFQXX4sokv2boFhTkxWly4niMJly9ALil2qZW1UmFC7ygIxTWXuurQWYOKNw4OzmO0p7zaJUMf+yTLA9OcHe1NLz/Fsg3AoypMfsIRgYWGNGcNM6toAWR3F3zBIHSJpTehMzMwjqMpimcn48aPBDrnnnE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5624.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TytGUW8rd2txMElTd2NaOElWNmVGS3VlNy9IeUFKVElmelRyUzBJblNBdHU5?=
 =?utf-8?B?TFZTdDlERWdWaEVPMldiOFlMRm80Y2JTNGtKTkxtVGZGcGM1UzlISUxNTThG?=
 =?utf-8?B?OHZwSzhrellReHlPa1JjdXQ1NWNaR2lmVUVVRWNESWNzb0Vibzh0OTljd0Uv?=
 =?utf-8?B?MER4bEpHK2JBQzF4NisvWXlQTENBUkJVU3dSZnkyRGJPMUNyOEtnWkV0RWt5?=
 =?utf-8?B?VWp5Ymx5dGkxR3BZZFNFU3BnSzg4dCtsZnNNcHN6SDQ2ZEhybE9JVHB0bU1W?=
 =?utf-8?B?QXJTVEN6eUl3OFI3bVlaUFBkU2FWMjA3ZnRoOG1aVDRNd3BlUjNHdmlBNXYy?=
 =?utf-8?B?MlBvY3kzaEVFOFNrVkVVRzM1ZUtILzRYWGpaK2Nidk9USS9PNi9GSGJ1eGdG?=
 =?utf-8?B?Vzd5RnNScmhNM3Bvekcxalo1dk4vSXJCRmlrcXJiVVlDa2pmdGJNOW9QL2t3?=
 =?utf-8?B?SklpZUpVdXVIU2w3UzljSUEyZFNHVkoxam0yMVF6b2k4Y3dTa1QrcGJmNVVu?=
 =?utf-8?B?T2JIdldtbDJITDBuaDhKY3MvU25UWDlsV3FNOUFnWVBRbUIxcm43SXNLaEVK?=
 =?utf-8?B?OUtxQ1g3Vk1maGFUUERCbEo4TXZtUHcwVGhVcFRyN2lCRUZXTDJDdkRXbGEw?=
 =?utf-8?B?SlcvczFLVHBaUFA1NUdjQ2xrN21kSStwL3haaTVsUTR6NEI4bk43VVBHTmhV?=
 =?utf-8?B?NWxwOUIvM0VBZnZaVUdmS2FWcm9yVEY4NndkNkxZdWZQV08rNm9lbG9uUGFD?=
 =?utf-8?B?Y250NThzWmY4TXYrUlg0azV6SHE3WmZ0QUNBcCs2N0hUUTNmTnUwaTVCVmoz?=
 =?utf-8?B?TUxoMHB2aEY1T1dDT05wVVp5cEZvWHFHbHN0SUdFQVJCQmxFcXZhN1Bwem43?=
 =?utf-8?B?NWZMaEhMOXFhRUYvRkhnMmFTZnpsY2FPWXQwYVVzK1JNYysrWlRzcTBEdXlh?=
 =?utf-8?B?azhscGlsVGxYOGxTT3pmb3hxcnNsQjczT1RFREVFalRWVDFnZjVtVTgwTUJ4?=
 =?utf-8?B?dlllV2M1cnVwWDhOOWJmQXdZQk5ldzE3Y0owVzlNclZGdkUzcEYwYXFUTDN6?=
 =?utf-8?B?dG9FZFRJWk84ZnBnczV6a294TUFyWkphVjAvSFNWaGFqUllOa3lKd05XM3Fh?=
 =?utf-8?B?OWNINERGd0FkYXl5dFRad09sN1RiSHhoTkFqL2JkdWZQTmVob3FTU00yTGIv?=
 =?utf-8?B?WklGdDFQMFpmaHJoTWlsVy8xSUdyQllZY3FYQ1hZblB2Vi94eHVULzAzU2xB?=
 =?utf-8?B?Z25KSTVmS3BaKzBqUDJjZUhKdWpJczJGWWVnQzZnK2JHWVR3SGxKek9VNjJQ?=
 =?utf-8?B?K0NGTzNtTEMwM2VwZFZvS3ViODB2b2JWeUR2RTdSQzJmWmFaR3FmNGh4RDZJ?=
 =?utf-8?B?Uk8xQmw1RFRxSEZ1amJSN21TbzBiZFM5Q2pqZmM2L3gwWFlubFJ5VkNRRlRk?=
 =?utf-8?B?eDJnWjlYMTN5bXYyTllYWXBvOVB6NU11eU5LSmhyU2xtRU9TQW9FVTYvSk12?=
 =?utf-8?B?MyswVkZ6elhBeUV0TFo0ZXA1RzEralU1V0FBNVQxSkFZa0I2bFBUM0hVNjZG?=
 =?utf-8?B?aGQ1M2JHWDVTWXM3NjYwL3lKa25FSXcyZmxrYlBqbXU0WFo2Z2EvekpKdDhI?=
 =?utf-8?B?aVNuUHo2TE9IZXNTYnp3c3VKREtSRi9QSUtNT0dUdWZvVlFRNE5sU1N0UzZs?=
 =?utf-8?B?cC8wVnBvNmRwek1QR09FalBQMnJRMTROM2NBc1BUMmtkZ3NjY2xjQnZkL3Y1?=
 =?utf-8?B?ZkoxTUNwNWp6dzJrNENDdTdYYmtzS2MvQXlyME5McG5KWmpFNzhNMVNLejY1?=
 =?utf-8?B?T0RwL2taTmd3NHF0Ym9URnFOdnFvZVMvQXAzeFBrdTBZVmJid2dzZCtnZFlD?=
 =?utf-8?B?TDY3Q3cyOUY3SVdCczVjdjhGWDZxVE9yRUg3YkpoYUErU2lTR2ZxbGczU0Q5?=
 =?utf-8?B?ZWJ6ZjNRRG9NSG80Z1hmM3ZybzFYRDJSQk9HWGhockQrSkRMazYxSXNmaU4x?=
 =?utf-8?B?blZob0Y5VTk2Y21BTXNac2djUlpOOU5hZjJ2V0dqcDdCNlpMOURyc0wyOGpo?=
 =?utf-8?B?NlcwWUZVNCthVFg5TCtWbTh2NzUzR2RRNmcvR1BZZjZrMko3SUhSSngvbUJG?=
 =?utf-8?B?d2ZqNzVjdDhWNmJSWndZU2JYVm04TldIaXUzYXh3U1F1WGttL3I4ZHM0TEQz?=
 =?utf-8?Q?jKnj28TMEnfAuQJNzBEbpWQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a66a8a0e-114d-498f-12dc-08dc386f38c7
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5624.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2024 15:09:12.8291 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /u6SS1AZ5UHlR/4guwfa8CxPj5v1hgXbZAElxe8vP92jxq35la+/kbPxhozKn0d1FrpuIRF2sd+MaXcHKok76KVjnf7976CfY9GJEyFdxNA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7678
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

Hi Matt,

There are some doubts i will discuss with you for my understanding, 
patch Looks good

Reviewed-by: Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>

Thanks & Regards,
Ravi Kumar V

On 2/23/2024 12:10 AM, Matt Roper wrote:
> The LRCs on some of our newer platforms appear to contain a few GPU
> instructions that weren't handled in our LRC parser.  Add the relevant
> instruction names and opcodes so that our debugfs LRC dumps will
> properly indicate what these are.
>
> Bspec: 55866, 64848, 46931
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>   .../xe/instructions/xe_gfx_state_commands.h   | 18 +++++++++++
>   .../drm/xe/instructions/xe_gfxpipe_commands.h |  3 ++
>   .../gpu/drm/xe/instructions/xe_instr_defs.h   |  1 +
>   drivers/gpu/drm/xe/xe_lrc.c                   | 31 +++++++++++++++++++
>   4 files changed, 53 insertions(+)
>   create mode 100644 drivers/gpu/drm/xe/instructions/xe_gfx_state_commands.h
>
> diff --git a/drivers/gpu/drm/xe/instructions/xe_gfx_state_commands.h b/drivers/gpu/drm/xe/instructions/xe_gfx_state_commands.h
> new file mode 100644
> index 000000000000..dca62af5a5d5
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/instructions/xe_gfx_state_commands.h
> @@ -0,0 +1,18 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#ifndef _XE_GFX_STATE_COMMANDS_H_
> +#define _XE_GFX_STATE_COMMANDS_H_
> +
> +#include "instructions/xe_instr_defs.h"
> +
> +#define GFX_STATE_OPCODE			REG_GENMASK(28, 26)
> +
> +#define GFX_STATE_CMD(opcode) \
> +	(XE_INSTR_GFX_STATE | REG_FIELD_PREP(GFX_STATE_OPCODE, opcode))
> +
> +#define STATE_WRITE_INLINE			GFX_STATE_CMD(0x0)
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/instructions/xe_gfxpipe_commands.h b/drivers/gpu/drm/xe/instructions/xe_gfxpipe_commands.h
> index 8e6dd061f2ae..31d28a67ef6a 100644
> --- a/drivers/gpu/drm/xe/instructions/xe_gfxpipe_commands.h
> +++ b/drivers/gpu/drm/xe/instructions/xe_gfxpipe_commands.h
> @@ -47,6 +47,8 @@
>   #define GPGPU_CSR_BASE_ADDRESS			GFXPIPE_COMMON_CMD(0x1, 0x4)
>   #define STATE_COMPUTE_MODE			GFXPIPE_COMMON_CMD(0x1, 0x5)
>   #define CMD_3DSTATE_BTD				GFXPIPE_COMMON_CMD(0x1, 0x6)
> +#define STATE_SYSTEM_MEM_FENCE_ADDRESS		GFXPIPE_COMMON_CMD(0x1, 0x9)
> +#define STATE_CONTEXT_DATA_BASE_ADDRESS		GFXPIPE_COMMON_CMD(0x1, 0xB)
>   
>   #define CMD_3DSTATE_VF_STATISTICS		GFXPIPE_SINGLE_DW_CMD(0x0, 0xB)
>   
> @@ -71,6 +73,7 @@
>   #define CMD_3DSTATE_WM				GFXPIPE_3D_CMD(0x0, 0x14)
>   #define CMD_3DSTATE_CONSTANT_VS			GFXPIPE_3D_CMD(0x0, 0x15)
>   #define CMD_3DSTATE_CONSTANT_GS			GFXPIPE_3D_CMD(0x0, 0x16)
> +#define CMD_3DSTATE_CONSTANT_PS			GFXPIPE_3D_CMD(0x0, 0x17)
>   #define CMD_3DSTATE_SAMPLE_MASK			GFXPIPE_3D_CMD(0x0, 0x18)
>   #define CMD_3DSTATE_CONSTANT_HS			GFXPIPE_3D_CMD(0x0, 0x19)
>   #define CMD_3DSTATE_CONSTANT_DS			GFXPIPE_3D_CMD(0x0, 0x1A)
> diff --git a/drivers/gpu/drm/xe/instructions/xe_instr_defs.h b/drivers/gpu/drm/xe/instructions/xe_instr_defs.h
> index 04179b2a48e1..fd2ce7ace510 100644
> --- a/drivers/gpu/drm/xe/instructions/xe_instr_defs.h
> +++ b/drivers/gpu/drm/xe/instructions/xe_instr_defs.h
> @@ -17,6 +17,7 @@
>   #define   XE_INSTR_MI			REG_FIELD_PREP(XE_INSTR_CMD_TYPE, 0x0)
>   #define   XE_INSTR_GSC			REG_FIELD_PREP(XE_INSTR_CMD_TYPE, 0x2)
>   #define   XE_INSTR_GFXPIPE		REG_FIELD_PREP(XE_INSTR_CMD_TYPE, 0x3)
> +#define   XE_INSTR_GFX_STATE		REG_FIELD_PREP(XE_INSTR_CMD_TYPE, 0x4)
>   
>   /*
>    * Most (but not all) instructions have a "length" field in the instruction
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 8c85e90220de..2c876eb1fd6b 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -7,6 +7,7 @@
>   
>   #include "instructions/xe_mi_commands.h"
>   #include "instructions/xe_gfxpipe_commands.h"
> +#include "instructions/xe_gfx_state_commands.h"
>   #include "regs/xe_engine_regs.h"
>   #include "regs/xe_gpu_commands.h"
>   #include "regs/xe_lrc_layout.h"
> @@ -1045,6 +1046,8 @@ static int dump_gfxpipe_command(struct drm_printer *p,
>   	MATCH(GPGPU_CSR_BASE_ADDRESS);
>   	MATCH(STATE_COMPUTE_MODE);
>   	MATCH3D(3DSTATE_BTD);
> +	MATCH(STATE_SYSTEM_MEM_FENCE_ADDRESS);
> +	MATCH(STATE_CONTEXT_DATA_BASE_ADDRESS);
>   
>   	MATCH3D(3DSTATE_VF_STATISTICS);
>   
> @@ -1069,6 +1072,7 @@ static int dump_gfxpipe_command(struct drm_printer *p,
>   	MATCH3D(3DSTATE_WM);
>   	MATCH3D(3DSTATE_CONSTANT_VS);
>   	MATCH3D(3DSTATE_CONSTANT_GS);
> +	MATCH3D(3DSTATE_CONSTANT_PS);
>   	MATCH3D(3DSTATE_SAMPLE_MASK);
>   	MATCH3D(3DSTATE_CONSTANT_HS);
>   	MATCH3D(3DSTATE_CONSTANT_DS);
> @@ -1161,6 +1165,31 @@ static int dump_gfxpipe_command(struct drm_printer *p,
>   	}
>   }
>   
> +static int dump_gfx_state_command(struct drm_printer *p,
> +				  struct xe_gt *gt,
> +				  u32 *dw,
> +				  int remaining_dw)
> +{
> +	u32 numdw = instr_dw(*dw);
> +	u32 opcode = REG_FIELD_GET(GFX_STATE_OPCODE, *dw);
> +
> +	/*
> +	 * Make sure we haven't mis-parsed a number of dwords that exceeds the
> +	 * remaining size of the LRC.
> +	 */
> +	if (xe_gt_WARN_ON(gt, numdw > remaining_dw))
> +		numdw = remaining_dw;
> +
> +	switch (*dw & (XE_INSTR_GFX_STATE | GFX_STATE_OPCODE)) {
> +	MATCH(STATE_WRITE_INLINE);
> +
> +	default:
> +		drm_printf(p, "[%#010x] unknown GFX_STATE command (opcode=%#x), likely %d dwords\n",
> +			   *dw, opcode, numdw);
> +		return numdw;
> +	}
> +}
> +
>   void xe_lrc_dump_default(struct drm_printer *p,
>   			 struct xe_gt *gt,
>   			 enum xe_engine_class hwe_class)
> @@ -1185,6 +1214,8 @@ void xe_lrc_dump_default(struct drm_printer *p,
>   			num_dw = dump_mi_command(p, gt, dw, remaining_dw);
>   		} else if ((*dw & XE_INSTR_CMD_TYPE) == XE_INSTR_GFXPIPE) {
>   			num_dw = dump_gfxpipe_command(p, gt, dw, remaining_dw);
> +		} else if ((*dw & XE_INSTR_CMD_TYPE) == XE_INSTR_GFX_STATE) {
> +			num_dw = dump_gfx_state_command(p, gt, dw, remaining_dw);
>   		} else {
>   			num_dw = min(instr_dw(*dw), remaining_dw);
>   			drm_printf(p, "[%#10x] Unknown instruction of type %#x, likely %d dwords\n",

