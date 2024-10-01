Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B099CCEACD5
	for <intel-xe@archiver.kernel.org>; Tue,  1 Oct 2024 15:56:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A80D10E320;
	Tue,  1 Oct 2024 15:56:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eLJBJ132";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42F7C10E320
 for <Intel-Xe@lists.freedesktop.org>; Tue,  1 Oct 2024 15:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727798172; x=1759334172;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=OB6rQIftn+ii9OpwnY8lVon7OEGSxim8rHzzPx/gvbs=;
 b=eLJBJ1325q9QKzIwF4tppGHDPNGmwcXgaVYTUdr7k/M+aoJggPsBMRIx
 /FmgXXzvIf96nw0/ahwlKXl6fI87tMx9Wh9aToBy6dBt3awMzFcfBmBRh
 kpQhCqtPpeCUKswU+5gtNHhzaXzeJ0goKeNo4rM7g2zpcdEWqcmoVvNWf
 qPBu0tdPJBnY46tQpSpcTSLi1ioSPHV78/KDq04obumSk2YN6gw8tB0iu
 oUKw0EAaJhhGKBZI6AuT9tqmDJKqc0O8ce3gumMJXhFSBjObLSRz52Z0S
 d0ptRhrlessq0X4rCmowH8N57Gfog04LHIS4/JvL/lpcfgz+XJQsm5/bl Q==;
X-CSE-ConnectionGUID: sYJpL3W9SSW8lkn9zw6a0A==
X-CSE-MsgGUID: Mr4yNZfXR5Coc7OFAby1ZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="26446648"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="26446648"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2024 08:56:12 -0700
X-CSE-ConnectionGUID: bE05O657RaGR4w6ITXMs0w==
X-CSE-MsgGUID: Kcsq1t5fTXelZyIipXxJ0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="73751600"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Oct 2024 08:56:11 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 1 Oct 2024 08:56:11 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 1 Oct 2024 08:56:10 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 1 Oct 2024 08:56:10 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 1 Oct 2024 08:56:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SLgcUB/2JXnl6ZzL4OA+KAdAXtLkayxJ1f+z+QlXLqekEqSVqZ5Ky2TKtA6rgqzWX8HlmodpleW8Z8KxxcP7NglIby3ZZaWmaWGm3DqmmhtDh45FQtic8LjTsWWlIi1jDs78fOvTNYDwZY3nh77ozEuEdk62Q844kUMzbYpczm7pPgcGti1IGgAqaxZU7wTcG5IMgUa1f11MXG67V5B0nIkzDUtTtN5ghg1ISwQ9Rrn00Shs9Z7nO/oLPoLU9AlcNjPPufD1C2wLHvhc3XybIj3AlctaHKOkWIC9VLuQZxED0obtuQ22vEL2r8a8BVA9dK3jJ4Lk+hqT5zvA7Gc68g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OB6rQIftn+ii9OpwnY8lVon7OEGSxim8rHzzPx/gvbs=;
 b=S+nli/t2m5/UZb7X+1VVe8UBSiSN+gZNtVURHmWY3MsEFENlDNZqtLqwLEuah/Tzb+Z7Kbo9g3pXrBsjWbDzZrPdr2Z/TRbMoEvdshpOV2XBVVewjqJb7BxT99TKQl6HFqmMi/lU6QtTQqHcBvWmIC3WxD9wuLkTKUtLtZPavfEITWY9Ecmm64d2gBTNOPEUZ/lULI/7RhZi0M2GlvH8YaMd4JLrBb1nsbKGvMsKKzPGQQha0mbdvHgG5LF7ydZCIvbzOv1vZCqKnFpXmS7IAOrRjgzs5vFPxLjPvHQ5DWXjn+FQW7GSt3d9BtV9+YxglG5nvE/CZJaRQ4TQRQY92A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by PH0PR11MB5784.namprd11.prod.outlook.com (2603:10b6:510:129::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.27; Tue, 1 Oct
 2024 15:56:08 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::2ca4:29ad:f305:6fc0]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::2ca4:29ad:f305:6fc0%5]) with mapi id 15.20.8026.014; Tue, 1 Oct 2024
 15:56:08 +0000
Message-ID: <1f411e7d-9da3-43d8-993d-629bc1f76e41@intel.com>
Date: Tue, 1 Oct 2024 08:56:04 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 04/11] drm/xe/devcoredump: Add ASCII85 dump helper
 function
To: <John.C.Harrison@Intel.com>, <Intel-Xe@Lists.FreeDesktop.Org>
References: <20240920032108.629796-1-John.C.Harrison@Intel.com>
 <20240920032108.629796-5-John.C.Harrison@Intel.com>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <20240920032108.629796-5-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0018.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::23) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|PH0PR11MB5784:EE_
X-MS-Office365-Filtering-Correlation-Id: 70d3efa7-9594-4f30-3e9e-08dce2319006
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UEdLR1IxWlIxYlFzQlVzMmVQRjBVN2FOQkZFL0lRSUVSSXQ2d1FHYnJIMjlW?=
 =?utf-8?B?d216eFE0VWZRQlFIZFZqTUNpb0tDYzFweXZXOFNEQWtET1p3VlJrdjZ6NGdx?=
 =?utf-8?B?dGd0eXJvNEZFd1RlR3YycnhJS0sxM2xlZ05SV00rWjFvTFhiWjEwUWt1NXFU?=
 =?utf-8?B?ZlB6RTVJUVZuUmNra0RSYmR4MG5xbGxkOUNKcE1NcCtQRVBldldpYzNyeHFB?=
 =?utf-8?B?VjF2UzA3eGhaVzRZcTdReE4xb0xnSkpRTHVleG5vQjh5ajEvNHpuakppWk9J?=
 =?utf-8?B?V1R3V0tBdXVoTWQwOVZtUDV6QnR5cHZFVmZCa1NUazFMdjlSdjFiRmZWK1Yz?=
 =?utf-8?B?TS9ZRysvWU5lY0ViSmI3bnMwZ2g1OVB5dDhuZ3BiOVpDT3Q5MzR2U3c4MnRr?=
 =?utf-8?B?RFhMZWgwTXpCdzVqSzJQd1NwYml3TWFIcnhBcTI2SlRzMXhXbVh0TVpkUm1l?=
 =?utf-8?B?VHI0aG00dlNSMFpUdEJaUmJrK0VzMDhMdEd4bDRiMGRPMlkvcUxkVGs1QlB4?=
 =?utf-8?B?T1QxMjFWVXg5b1E5bXNPY3NsMm5zNWZTQ0FlNDVnS01RK2NiTzBpV0t5ai81?=
 =?utf-8?B?M0pBMXd2YW9oUGQvRERzdFJYYTN0VCtiTjk3U3ZMcmN3Sjkya0ZUaXR4bEk2?=
 =?utf-8?B?UGJoMVBWL05OQUF2QWNLaW0yYi9xOS91Rk5aVFNsMGx6am5LdVh6a3JiR3E1?=
 =?utf-8?B?VjZrWnlacWxSMit6dHE5UDdMQU1EYmVDUVEvUjRQZ0RORWpjdHhxWlZVTjdG?=
 =?utf-8?B?bDhpKzBxSGcrMXpJZnFpY3JoSmdDNHNmSytwNTM2NHFDa0p0VWwvVzk1dVJ0?=
 =?utf-8?B?ZHpUenVLM0YxdUROSTFBSkVSSER4MkJtZ3dHTjlrTUo5SVhsODRJaElwbjYv?=
 =?utf-8?B?K1J6a1NPYjNZRGV5R0kzZG4rRS9jNjFhSHE2TlRXNXoxMzBuL3ozZDBXempW?=
 =?utf-8?B?VzFkMnE0T0NLR0hpVm92a1F5ZmU0VlVweFZmYi85Q0VCb0dHb3oxUy9ZY2dW?=
 =?utf-8?B?djF3aDUxRFI2U3dUMnBnYWM2bDdCUmpUUmZsbHpVT3FMWXJOemFJblNrN1ds?=
 =?utf-8?B?SkFmaHZPRDBvWm9GOEZyd0ZvOE04N0lmd2ZRZzRMMytrdlhIWkVGS29YMlZX?=
 =?utf-8?B?OEtLVE55QnMrTlpUT0d6ekNyVHdOYklXUXpWRGVYeTI1enpSR2NVM1Q1dk5P?=
 =?utf-8?B?NnJ3bVFnU1JZRnpqL3BuVHJ3ZU9SUk1uSjdLMzNzd3JkRk9kd3Uwa3BFYnA1?=
 =?utf-8?B?MkkyMVJPN3FTZWNIM1pKK1AzQVpSdmE2MVV0Tnc5SmUxSEkvN0pxb2k5Sjd1?=
 =?utf-8?B?U1dyQXdDcEhZQ3QrenFrRmNhS2crMXN2UDd2cnFQUDZFTzRZdGpDM3NyZmc4?=
 =?utf-8?B?R3VRbm1xUUcwaWZJeC9WWlFBNzd2VkRnVWxkc3Z3YkFoZkNpZWxTekRpOXpo?=
 =?utf-8?B?ZGtxb3o0VDZBNTk5WUpmRFhpek44Y1hod0JkMTE2RVlWNm5qMUZtU2d1Z1Vq?=
 =?utf-8?B?RG5ZNEg4WFBpY0tHbEdpTmxTZ3lRb21BV3o4QnZsL0Uva3UwREEzNDkvSndC?=
 =?utf-8?B?K0lqTk5qcC9GS2RUcktVUkxXRGVTcmxFeDZWTHgwNU5JRnNyM2RQRnJiK0FK?=
 =?utf-8?B?blFLVVVzaWFteUU3eTlWWEhncEUrR0ZrRUlkR3JobTFFR0lReDE5RWJyR2Ry?=
 =?utf-8?B?Z21kTjBvb1k4eDIxK0ZBSllLK1RLaHQvMmRzbDM2d0RNS3VOc2ltcC9RPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bjNEem5ocWZPcUw5ZTQ2T2R1K01Fa0c0cVp1NWY3SGFjTnh6R3BlT2JaMVph?=
 =?utf-8?B?VU5VSUhucXp5cTB3cHNkQ253dVRWQXlaTHljVE5vbHhsQ1FMNmdRVkxpVXU0?=
 =?utf-8?B?bVREdFZNVWlxeVdrRXRDZlRsdW0wQmQwcmQ0clcyOGc5NUQ2ZW9uV0szeWJp?=
 =?utf-8?B?WWFydHVzWVY4TlRTVVpRcU1MTjdXc1ZYYjZMZ2VSZGxJdDVQVUJnaGJnSnd2?=
 =?utf-8?B?QXAxeXN3OW16S0R4aXNkVmNEdXduZGlYZm04eXZPekN6eGZhbHRKWEFDbVM1?=
 =?utf-8?B?SkI3bU5LbGkvTll2d2l2WWFRTVVUN3JjZy9zbnBGZlI4K24vZEJ1WUNvZEto?=
 =?utf-8?B?N1J6WXN6SXQybGlxcGxlaXNYL0NDbGp0bW9HTUtaRUorQnV2WFh2RTM5K2lU?=
 =?utf-8?B?S3ExWnZST2JldVhqanVaZGpOQlo1OW9HdG5nWkp0Vi95TDZCRjJ4Q1BiRnNK?=
 =?utf-8?B?RzZFOGFYcENmZmYzWlR6d3lFSTNETEcyNXVraE9XRGRQMXY2a3haa3NVSk9P?=
 =?utf-8?B?WUpoMkkxaEpSSUhwUUhFSzRaeUYxU3ZJdUFqbHgvaEVmSmR6RUNMNFZRbVIr?=
 =?utf-8?B?ai9tSkorb3MyNlZuTDhXQVBESmlRNjlsbFdkQytjVUQ2bitjeDdLU09IK1E0?=
 =?utf-8?B?TjhueHhmdXZQU3pINWJNTVYrcHdiM3lrTXkvano3VnNIK0huVTBDSTBVZzho?=
 =?utf-8?B?N0xRYklUZVp6Q250aFdKemQwaGtpZ1JkU1FDdHZBSXpkSUljRW03aW1GQU41?=
 =?utf-8?B?NXVjNmFnY0NXaXlWRUJUM0s4b0ErNTBla01SSGpoOEdMdmJkbW5vU2dPN2t0?=
 =?utf-8?B?WFV1a2xZZ29kUTZqcHNPeFFXd2hmNXBNOVh4eU55NTBTU3l4T1RvNGlabmRQ?=
 =?utf-8?B?Szh3T2pWdWNIZ01QZTFlbFdHL0xvbkwwVm84dnBibnJpc1d6Y2liMVdabnBD?=
 =?utf-8?B?ZVdCV1dOeXRwUVo5SElrSllsd3o3cEJPeS94Nk1nMzhqRUE0aW0rVEpWSGh3?=
 =?utf-8?B?b29QSlUxaDBJUUl6aHJyaTBaczEyYk5OK1RFMGxoNStudlZCWEcwVmZnRTRJ?=
 =?utf-8?B?QXN0c0FXV3lrNTF4Mm02ekE1U29ZTHRRNFFqWmtnQ3hZRWZkbGU3UHM3c2h5?=
 =?utf-8?B?WDdSS05yb1F0YzBPWGFodVNpVHUzbkVsdjM4VjdYd2FoVmE4YzNvVDk4Wk5S?=
 =?utf-8?B?dExpQWo3QmhMRkdkZnpRNXk2VlNWRGh4M2NXK2owMHJpLzNDL3FvdFprMkty?=
 =?utf-8?B?M3V3M05EdDZHNXc2M3A5NlB2SDhpWTlwQ0NBZDkwcmdlREpuOWhGYXBiTUdI?=
 =?utf-8?B?WVBCWkdOanFvelVTR2JaTGkxRXArYks2bU4zY2s5dk4zNGRKa1ZzN0VDdnky?=
 =?utf-8?B?REVVeWhnL1NIVjdodTRGZGV2cU1vWjB0L0wzWC9PY3JHTENQVUkzT1p5Vi8y?=
 =?utf-8?B?a3lCdzR1b3pOM3kwYUFnR213L0tPM2VXVVE1Ylp4cGZaN0MxR2NjcmlCcDFr?=
 =?utf-8?B?dHQwL3ZpeEZYemxWOEVoNy8wTVBIcTdpKzFIV3FaeWE1WUVNSVFoVTJSc244?=
 =?utf-8?B?NTRlSlF5dmJPbm5OZ0ZWS0Y2SUNrNm54eHQxclg1ejdKbUFMLzdpTEh5cVJ4?=
 =?utf-8?B?Qnd1SDROZzE5WWw1WjB5ZFM4NW1VQ0ZvQ3g3cXRFVlNwbiszbXhNUVJ2L0kz?=
 =?utf-8?B?eFdPMnhBL09Fak5tNlZnY3lKbVk4c21BN1ZDWUh2VVNoQm5OMmdZNlNiRlZI?=
 =?utf-8?B?WER3cjQ2TGF1WXVQTTRTeTJUakxuYmI0WlhYVlhNb0VlMEVtZlF0akk4cWhK?=
 =?utf-8?B?bTYyVFdnWGgwMGp0TTVNcHhROFMrRnRWQ3g4ZVhXcFRERlk1cFVIUTltZXNH?=
 =?utf-8?B?aC9IM0lXMHQvSG5FZUFqNjJVQm5KQUNpamJMNnYrUU5zSk5TNFcwbVdKLzBK?=
 =?utf-8?B?bHdoVVZjbXBRQi9ZS1hWZ3dmbnd1Q09YSmsxcGpicnRUQ3lKVmloWk5TMlQz?=
 =?utf-8?B?UmxPU0czSGhTdUZOV0RjdWRDTTlzRHZScDBGYitGNWxaZGc5SkNLaldxV0Zy?=
 =?utf-8?B?eUZQcnMxd0FZRlhYeWpCSTF4WlRCWENPL1BIRlM1NndVdnh6d1NHQ3pjYzB5?=
 =?utf-8?B?dVdDL3R0VXdHTTU2d0J6N1VtZE90NWZDZHV1UFBsWC9qMkFHN1BBSlh4WDBv?=
 =?utf-8?B?M3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 70d3efa7-9594-4f30-3e9e-08dce2319006
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2024 15:56:07.9682 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FsZV5QBxEk8abg986sIY9bENuvJP2TRtWeTvKu+7n4/jUCP4mTwYy2luSMHqfzOfu4WN/hd554emwiMvPNanI3k6RD+9mL6WE1UA4Bj0jBE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5784
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

Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>
