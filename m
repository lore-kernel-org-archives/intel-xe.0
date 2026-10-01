Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1615CA5FB3
	for <intel-xe@archiver.kernel.org>; Thu,  1 Oct 2026 10:26:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6556D10F601;
	Thu,  1 Oct 2026 10:26:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KWL75Oi/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6168110F601
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Oct 2026 10:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790850370; x=1822386370;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wdRdET9JHNEECS9IakLaMla3YJNwYerELFMZKMzqWJw=;
 b=KWL75Oi/Fiesn1X4KjqfvSJvoG9gxrCtzDv4SmpI3tskiSL9d0wITpqP
 sW3acaz5BzQjX8iCtR00HQMNGlDb3cGGyXJow5C92o/yoRnD9ZL+HxZFI
 Fl+luB9B3P444iN+Gg0BRdTMSahqaZQeCG7opsO5bMVuij4Hnoe3w6zud
 sTEUZcjLdrKgLazCYrB3ofz9uiftv558YP+Ir6EHBQ6BuQCdJTS2Akw4/
 n2RAWhR6iaUBCcFgAwBUq2DDHrOo0OiH7YyXKYMUrri8eka8kdXvqPaVu
 v2IytDF+EbcgRp7RKi9RMLlfuZwZWI/XEqKSDvnj75VBaENskqirLPWt1 A==;
X-CSE-ConnectionGUID: 5W4kLW2cSzi7Ix0N7XxtTg==
X-CSE-MsgGUID: RzpOa46jRjWz4pI2M1CdNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="91700298"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="91700298"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 03:26:09 -0700
X-CSE-ConnectionGUID: EA3ql08GR0yFu0nAzjrGvQ==
X-CSE-MsgGUID: bzT2XwMgSZe9MLfvoM1S1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="275497373"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 03:26:09 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 03:26:08 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 1 Oct 2026 03:26:08 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.0) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 03:26:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eZ3Wa41O48Ha2cnKohk25zmXBslv14uo4npQbcKwiKCdPnDhITSEuGwytGsK5pm5Vz8vBBSBw7hGBLcq0CzpKTFo9tlYcceCqJNztrgE7R53lXRcqj9LvgE0hYFxj+BmpkNFB3nk2SLZA05M0ut3FQXizMlLzn5vPT7oFx0PNFp0N3arphi3mwnGE0m0G4DfVJca3C+DBqgzeeV6M/aUdyxMBAAOnuHOmBIg5kK0oCXFeUo19AfwvJeO+7K4Gfwr/uPTdqEOhlsxufuerBNlgVbhqq6UVGZVIvHe12Dcy7S5+i2OLkiiXE7GuXzB9ViqfN/17EgtJHUIThW8SKtNXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CokV37E8lhE0jbIP7MwZ/+RV7pnAFkU8D+Spytm/aJ0=;
 b=Jn1OlUfBO7ZZ3vKz+y4HI8vgRyM15kykVGzvossStFxUwCXQlWFszZ18K4scV6VaEBAl2FjlwywDlidg2eUXDurppoVY1zwIIhy74n2s2I37tggt+SQJ49kL1kniGSDbp+xWatm3WAae7p2bZgv9o72rhXl+pmnjHhKPI562KWc86jKKqJjy8rcmniRSoVVExsiCXecfEw9FW5mi264cgHi/uEgYjqCLAozPEmkg95ut21/n4BCaG7B8ewFmJb9bWUQDw22q0oVOS/yao2DdAR0puMBeY590B3GVfAvCsrxoRiRZ+zFzyy6+eqRSfkvPpO95cWLovIO/H/XnWSuGiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by DM4PR11MB6480.namprd11.prod.outlook.com
 (2603:10b6:8:8d::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Thu, 1 Oct
 2026 10:26:05 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::3a:cd0a:2af8:5837]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::3a:cd0a:2af8:5837%3]) with mapi id 15.21.0451.026; Thu, 1 Oct 2026
 10:26:05 +0000
Message-ID: <1891dfc7-4606-43ec-8646-6f08c82ee0b2@intel.com>
Date: Thu, 1 Oct 2026 15:55:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] drm/xe: Clean up kernel-doc typos in VRAM manager
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <matthew.brost@intel.com>
References: <20261001094518.1493651-6-tejas.upadhyay@intel.com>
 <20261001094518.1493651-7-tejas.upadhyay@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20261001094518.1493651-7-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0154.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d7::13) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|DM4PR11MB6480:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f524d36-c288-422e-1536-08df1fa66689
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|4143699003|11063799006|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: EOJEx5sH8s7Z1aefZm4Jjrq1WK12jpv9TZxAt9cTn4NZNd2hnJ1/PzMFWqSJh02D7X7XtjuaBiYZNgFBzRtA8Dwta3nS3KOoPJEi3dex7xPrvl3OcZR5Zm/c9An8zLsAhQAeobvumww040DYPFL+e865VdVhRkcazzJGl+wkt9716z9LcGvosiCkWn4UG5ci5wcNAIAgrVZlz9v9bj87AIOAZo6rjf5aDl3SLZTO9ywrvToPYTPO3zKhhkIflbc2R7U9+xE1cJQXoAJjXz+qg29qzsHyIfEMEYtlkwaqqhbbFVEK+XFEfnS/Td+bKU8oHWVJ8B99S0I0b9AzS2unrL+DWpd3zL1LpbLAU0F6T1ogljCfnx3o0eY1QV2rN9u7yI7yck6AGfPpHUtohjkr+0JNbiJMXp8ZYlYDB1SpC5u3NNCzMaS76mWMNkLHPEyPguKEd2SJy4mCTq0Hx30KWkDoivCPTe5iZGLidc/EDT9ZzzEJc+H8gfAWzj8JEIoxO8no/JmOaKkbpKE1IyuSw12/UtG9DZAGKyWfFqHEmetgFrqzhnpovLp0vpaBIdqCQZ4xn8eHeCfY3QeaOLBP24BT+6HoUFOto2fsY/kPEUzczZnOjKnqTGJXzJ+USDzDjkbjyTiapAve9etcK6U849MMR8ybVTk8Xdv0BDES2cU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(4143699003)(11063799006)(10067099003)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TzB6VFpnTWRIRnZpRnFBNEpGUm9MbkJTcG9Cc2hxTkduTjd0MmNlTUFGbEZz?=
 =?utf-8?B?TGU3aUk4UXJhUkFBS3laOWo0cFd1dUVBU1ROZUtOb1dwalF0UmlLK3pRek9n?=
 =?utf-8?B?TlpDV1VFTlowc2NQV1B4bWFabjZ4alpJZEgvd1pTWnhHOFdtbjZnODkwcUIv?=
 =?utf-8?B?dXdhd2MyQ0wydnhmU1NIT3ZiUmdXS1d1U1FrVFROelVCaFNFbzZPdnNsRlFk?=
 =?utf-8?B?d2NkMFRyOGxWNm4zbHZvc2gvQVVubVVHTlJja3dMSnhaMFlaRDZwenJkcm8x?=
 =?utf-8?B?RElaRm9reXZSOVU2SFlUQWNBN2FocDlvUmVDMTJoc3A3NEtzNjkyNitUbkFo?=
 =?utf-8?B?UGVxM0t2T1NVWFJ2M0NLbisxTzFyQ01UVWIwVmlmOTZoM3NxVzN1czRZZ0Vr?=
 =?utf-8?B?MVlhSjk2OXBFa1I4VG1qbzNYblVadS84cGNyZmNUZTBRbkg1UnBBU3ZtMWRi?=
 =?utf-8?B?dTFaZURFVjNRazNxcVJlUkV4MW5wUEJ2TUZjblNuVWhWUTB2T0s5Y0U4aTVE?=
 =?utf-8?B?SGF1T3VIMTBUaDZqaTc1SC9WajdjK0FFWnJWVWdXenVocld6NnJTSkoxcEQw?=
 =?utf-8?B?WStMbHp2V1diUjBZMCtOQ1d3M2t3MGt4ZGpkV1ZJQ2NiZUVUN0tDMmdwbm5B?=
 =?utf-8?B?RCtCVXBKWCtMNXVDWVBXU3E5SkRsaFFEV1VtTlZXTERSV3pGR29CbEtHSHcr?=
 =?utf-8?B?SUVuZis4MkxpQmdvQ2N0YmdYU013am9hSlY5VFYzWExtYTZ3aHp0d1p6ZE44?=
 =?utf-8?B?VTBIR2tnNlNxclpTa1FGODlKUkFNYUJHZlpBZ29ZZU9aM09ENFNPQ0xyaDJk?=
 =?utf-8?B?TkI3SzlRZTNmQnNJV205RHdmRERNT2ZIZVZldVE5amp4L0svRmpoVVNTVWp5?=
 =?utf-8?B?ay9MVjlKNnQwa29YK3duNmlCWGdOWk84ZFUvUEY4OFY5K0s5b2t4b2V2YTlD?=
 =?utf-8?B?SEJtckphWThhMnJ6MVFOZEFadFJMWXorQ1RHOGJWL3VERkpOa09FSUhONm5j?=
 =?utf-8?B?T05GVWV0NFpDVG90MEs1WGFnUTJ1d1ExUno5UGRBcDhwNEdoTEpUZWNqYS9r?=
 =?utf-8?B?clBTL2F5KzQ0blQ1dkY3NktMTFdPVG9JTGhkdXc2MDM3WTNXMDdFbVQ0Mkp6?=
 =?utf-8?B?cUI1aVZEOXAzcjlLSFBndStoUUQrQitrbU1JaG4xbXdheVU1bVRudGtLVTVB?=
 =?utf-8?B?Sk1iM2Y4bm96dXNSUUE0WVZEaks5MTdsWmRQamQ5cVFYaEI1L2k4REhVOU5J?=
 =?utf-8?B?ZUQ1VlJWcUVpcTdFeVdUM1RwSjZMR0QwQXRjSWVHdDJ0UDU5ZDVheThQSW9k?=
 =?utf-8?B?TkZMNFlJdHUyWFYvbjg0VDI1OVpWQUJQN3NPSW1jNEFiQjBsM2dsZTk1VEJN?=
 =?utf-8?B?WWlHOXNPZHJocjhRVDRHanIvVnlncTF4RmcvUXVtcTdYek1WVjZQYXVZTlgx?=
 =?utf-8?B?QmMxRzd4NmJBOWJRNVFydTdEYkU1TXBEUW9KRWJMckV4WmZTR3JRY3FFTTQv?=
 =?utf-8?B?Wkg2WC9BZWF3UkhHOXB6UGxmTVdsclUvejdwM1JnQUpVaEd4cEdVT2hoOUl0?=
 =?utf-8?B?cndmaHlDVXpZSjg1Ym5HalFRM3ROYkNXUjlTUk50MTVCL3FjQVMzZlJGYXlx?=
 =?utf-8?B?MGRhQzJLbDhlcWtqUGJ1WTFXUUttQzU2bDg3WmlzeFdOR3gyUVJHd3BibEtz?=
 =?utf-8?B?TFgvbjI1THZlUm9vMjZ5ZkV6a0FSWUQvRWpnNFYxWVV1Q3AvL2dhUWtvRHAv?=
 =?utf-8?B?WEY1dXFJUFVFZ3N6a0puSnhzK1c1NFRWcFo5Q3dsTnZQVy9wejlVSm9WVUhw?=
 =?utf-8?B?Snd0S2d3L3pQZzBiUjFiRjgyL09IOWFCVXR1MllKUEdOTWQweS82WGJWMUpG?=
 =?utf-8?B?VUh4RkV6L1Q1Q3JMM0NUZ2xrdytxb0dJSDhjZjhkTHhZbXBvcjJZdkRiVUxO?=
 =?utf-8?B?dTNTNTdISng4ZTNYL09NdXJmTURKRktHc1V5VkF5YjUzNEZjN2hMd2oySTgz?=
 =?utf-8?B?dEVmcHFIbjZsTUVOaTRIOVRhYmhPM2VDZTF0bTRjUU83aFI0M1RtdVZ4QTcw?=
 =?utf-8?B?NkhOVnpORDBWVCt3Nnd1YUlqNGtxN0gzZlRSQ1JJM3V6SHA2dExYN0NqMlgx?=
 =?utf-8?B?cFhENVRWaEozNkd6ci9ML2VZYU1OczBXZzJDSThkUGNYM1ZxR3l2KzVVMXNy?=
 =?utf-8?B?OFVuVWd3WkVkK2JLMllQOGVCQnQvZUhsM2JuWS9EYllGQ1Q2OE1UcGk3S1ZD?=
 =?utf-8?B?dmZ1b2svOU5GOTVsNFd4VmNKWFNyRlV0bWtuQnJZMnVZeGZyeGx0SG1QNnRi?=
 =?utf-8?B?bDlrcEJoSkVpeVNPaSs3aVZBTXAvQ2h6UitjNDBFYURWSm82QitMN2JmYnRI?=
 =?utf-8?Q?TVGYj/U52gjhEYAo=3D?=
X-Exchange-RoutingPolicyChecked: bxevnZ79C4Bl1dZqzEkYcbgzvzZCYrhzIlutPYsiv465qL9myhzusum7WtPScldnrS1RaXw41hY2vOAfK5YznwXyxi/9dE6d998sG02+ejmKY0xfRGWlLsJwJNE52NXZdokFtWnJOEgaWT0gV4B/gSO6msUdMHqsSrCfdYdvywChvcEvzTolBdsQvr9X09AsJ0SJrJAhXicVkIptlRlfomJTSUCF1mPgdI1UgJfreicENHqhnEBLS/XwlQio5Y9iLzXttFW9WwbsMYg1SIaCaXAbC+OY/OyGMPaZ8RFiw7NG1VFiWVSsKzQuesLZ0meu/986Sux+YMLTguxPUhVPLQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f524d36-c288-422e-1536-08df1fa66689
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 10:26:05.6483 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zKC5XMwNJHRrIIR7NhJvvyP1JKEoLXT1emzaqp+jkimlmJXzAPwoX7Y52QvGHBrtj6TyP0pbfWPzqxa64550UGO9qurQlmzsyyZakqcW1dc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6480
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



On 01-10-2026 15:15, Tejas Upadhyay wrote:
> Fix grammatical errors and misspelled hardware probing
> definitions within the TTM VRAM manager structures.
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       | 6 +++---
>   drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h | 2 +-
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> index 9a514d983e90..4c5837cdb996 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -886,11 +886,11 @@ static struct xe_vram_region *xe_ttm_vram_addr_to_region(struct xe_device *xe, u
>   }
>   
>   /**
> - * xe_ttm_vram_handle_addr_fault - Handle vram physical address error flaged
> + * xe_ttm_vram_handle_addr_fault - Handle vram physical address error flagged
>    * @xe: pointer to parent device
>    * @addr: physical faulty address
>    *
> - * Handle the physcial faulty address error on specific tile.
> + * Handle the physical faulty address error on specific tile.
>    *
>    * Returns 0 for success, negative error code otherwise as follow:
>    * * %-EIO - critical BO or address outside any VRAM region; next action is reset.
> @@ -953,7 +953,7 @@ EXPORT_SYMBOL(xe_ttm_vram_handle_addr_fault);
>    * debugfs interface for testing page offlining.
>    *
>    * Note: Executing this test will permanently retire the allocated
> - * memory tracking pages. The driver must be rebinded (unbind and bind)
> + * memory tracking pages. The driver must be rebound (unbind and bind)
>    * post-test execution to reclaim the reserved space, as these pages
>    * cannot be freed or reclaimed dynamically while the current instance
>    * remains active.
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
> index efcf3e1d4e80..95a427e3b0a7 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
> @@ -27,7 +27,7 @@ struct xe_ttm_vram_mgr {
>   	struct list_head queued_pages;
>   	/** @n_queued_pages: Number of queued pages */
>   	u16 n_queued_pages;
> -	/** @visible_size: Proped size of the CPU visible portion */
> +	/** @visible_size: Probed size of the CPU visible portion */

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

>   	u64 visible_size;
>   	/** @visible_avail: CPU visible portion still unallocated */
>   	u64 visible_avail;

