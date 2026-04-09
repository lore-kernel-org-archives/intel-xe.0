Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A851E98FAC
	for <intel-xe@archiver.kernel.org>; Thu,  9 Apr 2026 05:04:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AA8110E0B0;
	Thu,  9 Apr 2026 05:04:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AXN+phHw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6DBD10E0B0
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Apr 2026 05:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775711068; x=1807247068;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=P6rZOszs7OdDBz1tByYiddIxEAeVhUyo7FOIE9xDXXo=;
 b=AXN+phHw8RjIC314tlLwrq9O3lFcocdPuOIhlb5aAMB2LlAy6AP2i7Nf
 MNHe0hkPVr0M+qbSFwa3+xGF0dz4+LAAeBJry6cjV4oCaF+NvDUkFXKw/
 UvwevX1y3H4LHZulaFuOpFRK/ti2koik7r81gPEoaRs2eSNoQ0FHNlDDv
 5V2fLALLBu6clMmxvguQHFXH0C5uGqlaRt9Oi02OBoFAoxubPKyRnXx8G
 GGLkOwQzpxuCY4HWS9mfnFjPL+oeHiNC50MplvNcUFSa0Ymrn9+buGKiE
 rmIZOZzV0KVRTUn1YaaQNLuS/6SAlyS3nR4FlWwrnNiH53a1xyMtqGuHu g==;
X-CSE-ConnectionGUID: wQrAiJugS/eWQMwvCknh4Q==
X-CSE-MsgGUID: Ecd2Eq1SRnCK5NNvF9iPOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="76828870"
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; d="scan'208";a="76828870"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 22:04:27 -0700
X-CSE-ConnectionGUID: kbCGNJ2FRJ2Tc07rbiLLDA==
X-CSE-MsgGUID: +EvQ4TWLQY+7UEs00DrkNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; d="scan'208";a="266643799"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 22:04:26 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 8 Apr 2026 22:04:26 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 8 Apr 2026 22:04:26 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.69) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 8 Apr 2026 22:04:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kgEi1eg7vveDbm6jrLjgoY5cwG/5h66pIJkgM0AlbWVUBv43KoweK3IQD8ruj1YOlnD3O68ntVES5XJEAFcMN8Fsxy2XsCbHcc6alSYOZb8aclDLzsZoGT7VrBdM2r6PFewCh5ce65gO9wAyqta83o1cMQnYAj5jTe49RwYFnMD4t2r6EUEV72hPYxFMqJ0nT32sTCTuObX8X2nh/uShiFI3H6fxEil0wuewHwjfELGyWsHBJKjXRZUBiXRmtkju/Z2IdwDjRRE/4JJZZIbxFRPkFSMaeeehoGVpx+mymOnxYuqm+Ob+LQGTskZc0NIz+Lq1bDkRTt+DN2fU7Djr0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3wiV3jj63ZPgrsSXKf3tikMZLGoA54HJdwZOQV1yf7I=;
 b=TXCc/ngKyDQduUhwJ260Cl9HlFU4FdeSocyKZ4uog49Kv64gAaSYXLs/t4AU2vIr9vs6MsJpQ/KUWXRp5ud5yJrJXaVVkGpjTkQhmEuknZjAb5Sl57ojvYlgTIBj7TgvafYJ+dIengeTKWQapnRm2/UCgQ253MNDUjBXJYMo1uhJI9PWsKYIntwCdznxxZdNdnulQIV75FtzZVfins/h/ntAceIe9hfXS+5Hpomtd4eNppIRy+OQbgw4RN3QXGHaPZyzdtZ1OHc0ZEQqN/NJuKZ2XgR3SnZGol8Vd/HcqkHvPr7I6sPrDgBVy5BBGQMXTUOi+htuvL9s7DaREtqSYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DS0PR11MB6327.namprd11.prod.outlook.com (2603:10b6:8:d1::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17; Thu, 9 Apr 2026 05:04:19 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.20.9769.016; Thu, 9 Apr 2026
 05:04:18 +0000
Message-ID: <3a24fb95-59a3-4030-9baf-87f1b0be15e4@intel.com>
Date: Thu, 9 Apr 2026 10:34:09 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] drm/xe/sysctrl: Add system controller interrupt
 handler
To: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <rodrigo.vivi@intel.com>,
 <michal.wajdeczko@intel.com>, <matthew.d.roper@intel.com>,
 <umesh.nerlige.ramappa@intel.com>, <mallesh.koujalagi@intel.com>,
 <soham.purkait@intel.com>, <anoop.c.vijay@intel.com>,
 <aravind.iddamsetty@linux.intel.com>
References: <20260407110629.198158-1-raag.jadav@intel.com>
 <20260407110629.198158-2-raag.jadav@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20260407110629.198158-2-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0117.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d0::9) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DS0PR11MB6327:EE_
X-MS-Office365-Filtering-Correlation-Id: c2dacab7-cefe-4a78-b80d-08de95f5745c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: jREaRKmx5Jn0wbnpiYcb6U9xl128X72539WI5tHlZbaACdVyTG6ifUnNU5m/k3qwFqQ/3HiHK2n91ewUU6ninmhmPLVAyRH2rLViOB2d2SkviDXy4xZNcpFoGD2pv+EqibLmab7nUksD1kSsVhFhORTzAcOHSQW0YOjdDXbyZyMbcPwkp1n8ugvXt0v8o1kfpJH36/Zz9CODZDFJdg5xpS/2wh2cy2k/YMvYy6rsttFX20A20Q8vqz5x7EighwJEqS4/HrDvMH9oRtk/HM4idoRWY3818jWz8fvjewmxtO1/xE9Vl5rsrW5rTingWPdQ+2i+KWsHGkuAh7glTRST4ORyvGHwxaWphr56+S3S74yxkAgxFUAsj4IJOaB/FKrfS/wyrZBpH1mY3vjvs7bIXN65jOGr5UMUTSRdZ7jYQ0aCbfAD9hMSI2iGTGiTl1F/gGLFFJsOD0OqcWEwQu4a5bl5m9vCzsU0DpQh7JxQweSj8zYeHYUWaQG2fpUVwOxk9heXmm6BbHIceNx0BeYilphu9Is0Ei+arY53dzlkOuSD+jl/feEbFb/AnfXWxgbdJNo5zSDMTaXyvYukwo4Mq+JapRUjIjhkQZSDJpfJ5ae/KOZMdjnjGRukQn9HwsFwUuTLJDMd/ekXhFHgQsAvcpdcNiaXLonZsqTflNmYqW/1O4o8NDVBYkpDHwmY15PpTDrk25QySzvuiRdyUXMekgfZvy6fnW/2SrpKdCyhWds=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YVlZMXVhb3A0Y0FENGhUUXZsd1pFT2xrZFAzR0N3TXltcHFvclE0U3VaVkw3?=
 =?utf-8?B?N3BDRHhUUHlsS25oQkhmaXh5M3AxbW81L0VmY0pzbWx2Lzg1Vkp4SmxrWVRp?=
 =?utf-8?B?WWV5RUxaeWNFK3VtSmJZRlZoanZoZ0NNRStOR2xSMHFXdlJLN3V6TW1jaW1S?=
 =?utf-8?B?bVNKUXg3ZHRuRTZ5cTRjcSt4OW4vTklTanVFNVBFVXJjUitiTTc3Ums5VXJE?=
 =?utf-8?B?Tm83Wm8zbGIxNU9iQURtNGJOUzFhZTNpWHpUQUhYR2tkZWdNQzdHbXdxVDZN?=
 =?utf-8?B?UXpXRE0xdGptNFRxQTNYS0RWcjB0MGREbVRBeVR0WVdETXdCNEtFUDFwYUNN?=
 =?utf-8?B?VXc4cFM5Wm5XWjEwNGMyckcweWprTUQ1MHFpV1Bwd21TTmZGdnIyMVpFWmNU?=
 =?utf-8?B?c0lGUDlVZDMzcGp6Rmw2YnVBOVphbTNzSzdNOEZBMCtHNTk4UUdyaWRPemhH?=
 =?utf-8?B?RkJxYkdMVWt4UUZUMW41Tm5WS1VhQWZQZ0VRSjRJejBHZXdPUXRWZ2d2MUZl?=
 =?utf-8?B?NXZrclJ4Q2lRbmlSczExWW9JZzlLZ09tQm1UWHhmY05JRWpsQitBRTJmNXRK?=
 =?utf-8?B?MzZyM2IxcmVvMkFhN2ZyY0c2eDByZ0VTZzdJeEhJN0N6TS9scVZpZEhUQ3Jh?=
 =?utf-8?B?WlpES0tvenViODZGKytLU0VUYWUzTTNlU2l3T3VweThvZ2FaQm9mNHNwRGM3?=
 =?utf-8?B?ZGxRbDRHclF0WFNCTnpKc25uM3hVaGlaYmpzdi8xMmorYmJUY3RXc083Ymxk?=
 =?utf-8?B?NTdEOVliRTlSYWRzU1hpYWk0Y01qa3pycnA3R0hoTVNuUGxHSGQ5N1FrUDNZ?=
 =?utf-8?B?d0VaQXVlRFQ5RGp0cWJBVzNCMng0N3RHbXB2a29tUnRkamovZ08zbmk2M1dz?=
 =?utf-8?B?QlBFNUpOMkFvSDUydElXb2RXcUZvZEwxRVdPTFI4U2FxTHg2OUx6UEYyU1A4?=
 =?utf-8?B?Z0o4RnVOdHVMWE0xcERHTk83Qk1UcXo4dGF4Szl1ekJhMUsvai9NVXlrK0hH?=
 =?utf-8?B?NmorMk1JZDAvaFhUYnBFN2M1VS84dzMrdHNuS3VZcWFaZzZCSUljWnFiZzFV?=
 =?utf-8?B?VHp5dDZpMkxnb3FsME13TmFMclBnbUsvaUdRbnlTY0tRQmhTVmUrR3U2ZE9W?=
 =?utf-8?B?bG5QRC9uNFd4b3JuUE81amFScThHeE1ockRORGtYR2lyQ25WNEdiNjk3S3Vk?=
 =?utf-8?B?Q2EwSzMreHdTS2FCdlFHWGJCYUJPNFVkK1lMVTRPMDhrMWMyL1V2RlQrdHc5?=
 =?utf-8?B?VW5UOHZpNnVqYXZvMlllMUg4SWhvNHBYM1I3ZFV5VnBNWWdaeWlETlRTblgr?=
 =?utf-8?B?TmplbGxTTE5JUmN1TXVIWGZYVUY4emNUZ0hvNk5lcE5KL2VLU1liL3JwRFBD?=
 =?utf-8?B?czlGK3lPREFuWUhEZUVCUndkdkxNamJNZkZIR3gweFE2SG5FOGpjbFBvMkMy?=
 =?utf-8?B?UTY3Sy9STnVBR3FoVzA0MktLem1iU3EzM2tCQjVNeHpUbjFjbTl6cmduaHZv?=
 =?utf-8?B?ZEp5aDFBK29Pcjd5aDBTNkhETlFxamVPYml1WU1QeHF2VVJrSEJnalpLNzIr?=
 =?utf-8?B?aE05MHJEK0FWRXlZcnV0bnR6eFdLYUUrSkpYbDkrYlNiUGRBZzdnQzRwNG1s?=
 =?utf-8?B?eUZTMHRiMTFKbFdKT3ZOa0wrQXd0Mk16N0F4ZDE5bCs2WUVxYS9GaEhqNlJ2?=
 =?utf-8?B?akNqNDl5eTZ1aUdTc1JOMzgvU2xGUElmVjNvTkZCZi9tUVErdTdOcGNHKzdu?=
 =?utf-8?B?dm8ybGwzMG9TUGhBSlpRNXpXS3drK2YzejYzY0Jqa1YxSnYrVUxudmhocllM?=
 =?utf-8?B?c0pOVFphb2dPV1ArQzRodk13QUE1aCtQa29udG9xTXR6a0xHTUcvSSttdUdO?=
 =?utf-8?B?NmRqd2NySHREbzhlMC83WHVJY2RuOEdmejc3R0x6MGZETTl6ZzY0N3RCUmR4?=
 =?utf-8?B?dE9RR0NFcEtNYXBaVU1KMUVNK1pHM2kzYmNZd1o1MHU3TkcwODdUSWRyNXgr?=
 =?utf-8?B?RFY4NkFnZVdoVXNpMWVFVkp4eDZmemRpVFJKdEw4c0lGT3ZwMkZQNEU4cGE2?=
 =?utf-8?B?VHhscjlYWDNZZHpzSmNHK296MlJVeWVGSElDZDJiWFhuREZGdzZGV1BKU0Rr?=
 =?utf-8?B?eDF6ZENwTWRFT0cralVvaHNDY0NSRENlcDlNNnZDbUhjVzZLVEpEN214aWlV?=
 =?utf-8?B?MmtMVG5YS0lkY21qekwwNzdERE5kOVgzVUpEcnlEWncrNTROaDhHQXNtV3Nn?=
 =?utf-8?B?MGtEMnliRjBDNGthVXdMdDJBRHNIUjlPdEUxRGRJQmpTbjNITkVScUg4OGI2?=
 =?utf-8?B?S3h6OU1yR2tiMGlWVU81Yzd0UXZBR3hUTFVHUjljMFJEM2NYaExsdz09?=
X-Exchange-RoutingPolicyChecked: L97Jkc87qUkWXk5cSpTE2fkSfQuoH1HuAD7dQoIn2msUWyOWj2BT0l9O6S9iSNsfz/bPUVyZc28BG1K4jnWIp8++VYt2DEluLBkpUPZkkVyXDRkEYxmmw/roMPlBu+6+vDxFLpoqy0vVV5sFsx3DUv7GoKRQSskbkgmFtes0SIHWGeozyRsqQ0XnI94atgQMl75pTQJe7iZon9+aQzMC65LHPv0KcXhfSShg3lYKZw6xM6HPWHwGRFMvcc3enbavB2zJ2DIzFvfgI6Tj1uBpsfQjuN1ydNEvYeo9LNC19bph9yLUUJsZnq9kl3ZJEWNS4kP2U/M0dWVU+JFeRgEDIA==
X-MS-Exchange-CrossTenant-Network-Message-Id: c2dacab7-cefe-4a78-b80d-08de95f5745c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 05:04:18.8604 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gSQJ98ygT996Es94FPXaNbSSiHwGkwyR3jzm++xRXGXkn86XSjSLSMSgy9Z/Vpo1cfrQbkMprqHxXyPgww++rA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6327
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


On 4/7/2026 4:36 PM, Raag Jadav wrote:
> Add system controller interrupt handler which is denoted by 11th bit in
> GFX master interrupt register. While at it, add worker for scheduling
> system controller work.
>
> Co-developed-by: Soham Purkait <soham.purkait@intel.com>
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
> v2: Use system_percpu_wq instead of dedicated (Matthew Brost)
> v4: Handle IRQ before sysctrl initialization (Mallesh)
> ---
>   drivers/gpu/drm/xe/regs/xe_irq_regs.h |  1 +
>   drivers/gpu/drm/xe/xe_irq.c           |  2 ++
>   drivers/gpu/drm/xe/xe_sysctrl.c       | 39 ++++++++++++++++++++++-----
>   drivers/gpu/drm/xe/xe_sysctrl.h       |  1 +
>   drivers/gpu/drm/xe/xe_sysctrl_types.h |  7 +++++
>   5 files changed, 44 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_irq_regs.h b/drivers/gpu/drm/xe/regs/xe_irq_regs.h
> index 9d74f454d3ff..1d6b976c4de0 100644
> --- a/drivers/gpu/drm/xe/regs/xe_irq_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_irq_regs.h
> @@ -22,6 +22,7 @@
>   #define   DISPLAY_IRQ				REG_BIT(16)
>   #define   SOC_H2DMEMINT_IRQ			REG_BIT(13)
>   #define   I2C_IRQ				REG_BIT(12)
> +#define   SYSCTRL_IRQ				REG_BIT(11)
>   #define   GT_DW_IRQ(x)				REG_BIT(x)
>   
>   /*
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index 9a775c6588dc..e9f0b3cad06d 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -24,6 +24,7 @@
>   #include "xe_mmio.h"
>   #include "xe_pxp.h"
>   #include "xe_sriov.h"
> +#include "xe_sysctrl.h"
>   #include "xe_tile.h"
>   
>   /*
> @@ -525,6 +526,7 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
>   				xe_heci_csc_irq_handler(xe, master_ctl);
>   			xe_display_irq_handler(xe, master_ctl);
>   			xe_i2c_irq_handler(xe, master_ctl);
> +			xe_sysctrl_irq_handler(xe, master_ctl);
>   			xe_mert_irq_handler(xe, master_ctl);
>   			gu_misc_iir = gu_misc_irq_ack(xe, master_ctl);
>   		}
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/xe_sysctrl.c
> index 2bcef304eb9a..afa9654668a2 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl.c
> @@ -8,6 +8,7 @@
>   
>   #include <drm/drm_managed.h>
>   
> +#include "regs/xe_irq_regs.h"
>   #include "regs/xe_sysctrl_regs.h"
>   #include "xe_device.h"
>   #include "xe_mmio.h"
> @@ -30,10 +31,16 @@
>   static void sysctrl_fini(void *arg)
>   {
>   	struct xe_device *xe = arg;
> +	struct xe_sysctrl *sc = &xe->sc;
>   
> +	cancel_work_sync(&sc->work);
>   	xe->soc_remapper.set_sysctrl_region(xe, 0);
>   }
>   
> +static void xe_sysctrl_work(struct work_struct *work)
> +{
> +}
> +
>   /**
>    * xe_sysctrl_init() - Initialize System Controller subsystem
>    * @xe: xe device instance
> @@ -55,11 +62,7 @@ int xe_sysctrl_init(struct xe_device *xe)
>   	if (!xe->info.has_sysctrl)
>   		return 0;
>   
> -	xe->soc_remapper.set_sysctrl_region(xe, SYSCTRL_MAILBOX_INDEX);
> -
> -	ret = devm_add_action_or_reset(xe->drm.dev, sysctrl_fini, xe);
> -	if (ret)
> -		return ret;
> +	xe_assert(xe, xe->soc_remapper.set_sysctrl_region);
>   
>   	sc->mmio = devm_kzalloc(xe->drm.dev, sizeof(*sc->mmio), GFP_KERNEL);
>   	if (!sc->mmio)
> @@ -73,9 +76,33 @@ int xe_sysctrl_init(struct xe_device *xe)
>   	if (ret)
>   		return ret;
>   
> +	ret = devm_mutex_init(xe->drm.dev, &sc->work_lock);
Nit: Mutex can be added in the same patch where it is used.

Reviewed-by: Riana Tauro <riana.tauro@intel.com>

> +	if (ret)
> +		return ret;
> +
> +	xe->soc_remapper.set_sysctrl_region(xe, SYSCTRL_MAILBOX_INDEX);
>   	xe_sysctrl_mailbox_init(sc);
> +	INIT_WORK(&sc->work, xe_sysctrl_work);
>   
> -	return 0;
> +	return devm_add_action_or_reset(xe->drm.dev, sysctrl_fini, xe);
> +}
> +
> +/**
> + * xe_sysctrl_irq_handler() - Handler for System Controller interrupts
> + * @xe: xe device instance
> + * @master_ctl: interrupt register
> + *
> + * Handle interrupts generated by System Controller.
> + */
> +void xe_sysctrl_irq_handler(struct xe_device *xe, u32 master_ctl)
> +{
> +	struct xe_sysctrl *sc = &xe->sc;
> +
> +	if (!xe->info.has_sysctrl || !sc->work.func)
> +		return;
> +
> +	if (master_ctl & SYSCTRL_IRQ)
> +		schedule_work(&sc->work);
>   }
>   
>   /**
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl.h b/drivers/gpu/drm/xe/xe_sysctrl.h
> index f3b0f3716b2f..f7469bfc9324 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl.h
> @@ -17,6 +17,7 @@ static inline struct xe_device *sc_to_xe(struct xe_sysctrl *sc)
>   }
>   
>   int xe_sysctrl_init(struct xe_device *xe);
> +void xe_sysctrl_irq_handler(struct xe_device *xe, u32 master_ctl);
>   void xe_sysctrl_pm_resume(struct xe_device *xe);
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_types.h b/drivers/gpu/drm/xe/xe_sysctrl_types.h
> index 8217f6befe70..13fbf2990280 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_types.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_types.h
> @@ -8,6 +8,7 @@
>   
>   #include <linux/mutex.h>
>   #include <linux/types.h>
> +#include <linux/workqueue_types.h>
>   
>   struct xe_mmio;
>   
> @@ -27,6 +28,12 @@ struct xe_sysctrl {
>   
>   	/** @phase_bit: Message boundary phase toggle bit (0 or 1) */
>   	bool phase_bit;
> +
> +	/** @work: Pending events work */
> +	struct work_struct work;
> +
> +	/** @work_lock: Mutex protecting pending events */
> +	struct mutex work_lock;
>   };
>   
>   #endif
