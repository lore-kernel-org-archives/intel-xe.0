Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D714C43458
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jun 2026 17:37:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 400F810E0BF;
	Mon, 29 Jun 2026 17:37:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KzYiLJJE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9404410E0BF
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jun 2026 17:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782754674; x=1814290674;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=lp2JkPSeN1ll18qkB887o4biNwjJjD+YEUrh1nq1/yA=;
 b=KzYiLJJEGhPhoSsA5DGBprFvZtY6GonFmD/YD6FwWT3CiIMXCY5DO1Jy
 ZQ8ioH1qKOkxCAScr57nvRXRTMfpFiWyi+KqZbdIW78aaISlHt6Xkyuyw
 Dy6aacSiFuw5fDxluIaLLp8TZY0incehcNJmcAfXmnePJpit4xgGMx/c8
 byuoturxpaUpm/eohszvuFWBziTzKlReDAfM46EJaHgVPTCMtD0W8bAnu
 8dZFySIg3FU/mD8HCV1dEOkSjFxlDe3VKcbffjeovWPsIuIWOVGTSaCpJ
 jvoBXZYg5nXR/4HznYeKZuWd7GB4TJKHtTwYBvMywVvkqlhzXJUiL3367 g==;
X-CSE-ConnectionGUID: plrU42XdRyWoNOMotuXutQ==
X-CSE-MsgGUID: wAtZBkrDSoKfApTNLfOD+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="86003929"
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; d="scan'208";a="86003929"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2026 10:37:53 -0700
X-CSE-ConnectionGUID: beqCjmSmQWmahc1h7XFYnw==
X-CSE-MsgGUID: fCLBswHdS0WrRlpfZH8HFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; d="scan'208";a="252671945"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2026 10:37:52 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 29 Jun 2026 10:37:52 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 29 Jun 2026 10:37:52 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.68) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 29 Jun 2026 10:37:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fVPduZ+1zVApng9s0HrSFOFcMAme+fjPKayMRMEu6W+f6XF34xN+IUfvSj49x6awiQyXgaFhjw4AqsAqF+u0yVWB0CP9T/BjvD7bMQk2rp56z3UVJr2sQT+OBPHSvVaCt2wSgtyrMfWeOEqX5L/vXI3F4uYGd3+fqViN2r+S+d1i1uebdm+0/oZY7nJP9+z+kxISJA77qZTI0cCzFHoEMm5+hEI1RSNMr2vLTNmjX9LeQS4DCjkzYQMG1UcMeO8l1EEmtoPuv+QOgVspxDV5GntXAp49OmIo/eW7i3VqhH9RlnxwnX20VsKPKkmbtPFnqHjkqVOCWoupzH/XLQWK3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+P/SuFs5DUa3YcTKGlENeuGPqe+l5rzYqP78FlpdmJY=;
 b=ftZPAeTOj6V1LXEvpL2YGNyxoPPb1+8N6joP8+S7M1M3B0yEF6nG6jwBZQ4s8HGuuH6+3dTwH9Q/l31vS3Ewv1UL0C6ok0qJsIEAZJVa6YvuvP1joVDeHbiLMTttldRIsRBHQTwf/abJBYrgr8luWJd1jjY3QV3eoYnx/7TXAlRDKTHYF09J5vRgLIWT1j+zJaGDEE9wCeVCgSx7S+41y+iYbya2DNxtNNz3A6hVS/czGSHRyMQCgNF5rRPtIwEVjSoDsEgXdS2/PIidvmbPMRtkNvg1ZmidSPOQR9ljQeZv8gdAzx1pJwD7B9R27ItmaXwH6SZheBE7tj9C9ZwVdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4979.namprd11.prod.outlook.com (2603:10b6:303:99::16)
 by DM4PR11MB6454.namprd11.prod.outlook.com (2603:10b6:8:b8::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.19; Mon, 29 Jun 2026 17:37:47 +0000
Received: from CO1PR11MB4979.namprd11.prod.outlook.com
 ([fe80::ed0a:e4ab:fde6:edcc]) by CO1PR11MB4979.namprd11.prod.outlook.com
 ([fe80::ed0a:e4ab:fde6:edcc%2]) with mapi id 15.21.0159.014; Mon, 29 Jun 2026
 17:37:47 +0000
Message-ID: <9da5a2b1-8e03-4560-8e9b-a050085f47c5@intel.com>
Date: Mon, 29 Jun 2026 10:37:46 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHES topic/xe-for-CI 0/6] drm/xe: Use GuC fw 70.70.0 for
 pre-release platforms.
To: Julia Filipchuk <julia.filipchuk@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260618222536.3351750-8-julia.filipchuk@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20260618222536.3351750-8-julia.filipchuk@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR05CA0056.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::31) To CO1PR11MB4979.namprd11.prod.outlook.com
 (2603:10b6:303:99::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4979:EE_|DM4PR11MB6454:EE_
X-MS-Office365-Filtering-Correlation-Id: 2feee4ec-b57c-4f41-fde6-08ded6052225
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: +ktVfNW2d4+XAhrY8ObvBig0/Ph+wJYnEZHMKO54i501tiovNgJBCtCGbrM3N0QIc4OaE5yBhiMi1BNnRDpbZ4+l0f15QWdM9uDFwQyzDm8gQwN5dLvvTwrgph7EaBihmdcUgnUTXjl30JZYh1Kl7mHoB8XSZcCJsLKUWZXEDzmfFo95aMDZ+MzZZsDwwdsmFQe2gPrV/yTmz1On192147Euq0FM+7dQcKUf6erS2zz+b9QoXuAbw5AkB33Fyln8JCJOwuFol40veHRYPMW2W1UTwMMMT464Lx47wx6kTHpLMaCfE7OHGNv6HUYB6J7Le4So03OmEp/eZ2to5w6K7i8vOQqQ5Hke3dgKGNVkOIqmkdUieipoS3opD1LKbeJ6c1fhW4VIMSX3Fp7xQSmVxvWJ2H+ChjXJDR0KA3K+u8Ic57opGjRf21Cp3QYraJ4VOWYQk/BWdw9x3dBmoz7DbCmnS0ZonLHa5RTwg6i+yt7ZPZFD1b7Xr93tfou1hAeZ+IIN8homBaPVQpNeRjQInNJ3WfiQhceur6yD0wzALUuqFZ7VpNszurIJYBxo4I9dfDGGzwGJccO+anle67DLokXUFMvnnBfh21E615Unsjk4talFtB/YJ/U12g9PeiH9GslfDMnQM/ejnptAco6VSDKhyPsWhYHDhxB76wYkY2U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(56012099006)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?STFxVStFYlprTDBSOG0rbkZzOHFNUXdXeFFDZTkraldEMnROWWt6M1J4NVZo?=
 =?utf-8?B?RGd2VFRuR3ZrT0p4bS84c0ZlTjBHYisvMXlkSzV1ZGlGKzJ4c1VSVnJLTytl?=
 =?utf-8?B?MEpNNlRoK1kyUmUvT25nZXpENGNpaHZJNnlJZXVwTnYxUXZtbTFrcTUzK3l1?=
 =?utf-8?B?bW1WN3IrWE9xMEk4Y1hjYklzTDhNTTJkT2VBU0xzNEQ5eURWWHRtWnY0SVFu?=
 =?utf-8?B?VlRwc1VuRHFkdTBqR3JqMGNtOXlkaURhQnR0aXBITnlyRFdYcVhmUTVGMldC?=
 =?utf-8?B?bVE5SjN0UkF2ZXRsb0tod0xnUnJ3OEpyTndVVEQyTHJmVzVFV3g3N3lLUzBj?=
 =?utf-8?B?M1drRFk0VXF6QktSTEhaSDdiWWZUMEtIWStqQk5PRlNsUkMvaWsrN1Z2UGlS?=
 =?utf-8?B?RzdJTC80OS94SzNTS0EwZTZvUkpyUlVweVFndUl4dzhhT2RwcGJleWlYVUV6?=
 =?utf-8?B?ZWRmSGwzdUZkZjFvQXN1N2o5Wk84NDJacGxTdWhOS053T0U0bDJWTWxOcVlT?=
 =?utf-8?B?bXlFRWljbHB3dHU4T05iVmg0Y0grL0NPNXUxUU42a0RBZXorVjdGd1FvbTBl?=
 =?utf-8?B?YVNUZ3JreHlmU09rUVRyaWo1YjNCaXR0VUdPOEtRa1FWR1RhQUVmRXgrTUVk?=
 =?utf-8?B?aUN5N2FoTld3ejZtRHVLQVlNdEVFQVpIT2FXZnZObm9zTEVJTzU5OStKNFg5?=
 =?utf-8?B?MU5HcW5FY25TemtuQ0R1TlF4Sm5WZnJWcWJXVGoxUFZHS3MxM1c2V2k0SkVF?=
 =?utf-8?B?S0R0bTZSY2FZMHpPSWxTY1Q0VkMzSDlaVTdKTFJiUEZYeTFQR3pTWS9YeUxT?=
 =?utf-8?B?UFZRM3NkUWZ5TlBmbmpuWVpBUmJoc2dOMlU4c0NJRjBFOU5zV3RjcnJPc3l0?=
 =?utf-8?B?N0RXeDY0TTBVZFVuYkR1TFRFeUpzN3ptaThQRnYydHF4eUREUHVLbFducVhH?=
 =?utf-8?B?dGc3VUhITzJVOGJWbmorOUs4UWNvdVV1N3NJOVJjSVNTZ0QvV25KSnowam1T?=
 =?utf-8?B?M3QrblFSRHpFTy9vaG4vS01kTkJ5cks5RGdQMFRXUHRtRFVDM29CNUg1T2xF?=
 =?utf-8?B?QzVPOFYrU1NOeXJseCs2ajVFYjF0Qmd3UVpWcGtjRDdyYTNOeHcwdy9NMlJS?=
 =?utf-8?B?RnNHb1UxNDZLWVpJUmx2aWZLZVFRNWI1ckk5dnAyVTdITUN6RC80QncrRXpR?=
 =?utf-8?B?YXNyWUJ5RVBOeEtzL3B4SEdyY2FnN1NUanE3WWRFNi9zTTFrV0V6R2RwZGNy?=
 =?utf-8?B?aEVLK0J0WFdLM2dWWC9ZUFA1aG90ZTNHUE0ydElSMDJIcmtkTXBXbW9WMm1n?=
 =?utf-8?B?NzRCRDAybXZtMjJKOHl4Rmtna3dPNVZHM3hQWmYzcFM2eUVHTjExZ1RDS0NC?=
 =?utf-8?B?VWh2NU1iSzFrZk96dVZKWmoyekJPRWZPUWRqVVd1SHZCMjI4T3JrV1N2VitW?=
 =?utf-8?B?b3pDdUl3eEhrRXgxSVF0a0YzNllNRE9qWDRrWm9YTjNBVkQ3MWphdm5rb0p4?=
 =?utf-8?B?RktOaWZlSklma2x5bHlHZWNvUlVQVUhyUFhIcTlMMjRabUw2elFucGc3SUJH?=
 =?utf-8?B?NThIMXA4dmlKTEJNc0xjRVM0Vk02K1dFZ09nUDIzaEh1UkZ3cFBYZzcyREVH?=
 =?utf-8?B?T1psQS9ySXpMMExxQmprR2lQR0hoQ0hXakQxV0JHNHNIbUtnbzB2djFSWksz?=
 =?utf-8?B?QSt4d082VDhEN1FzVjRFSmJ3L0RRZnVYMk9lK0RzYWNVLzBTVjJ1NVR3SFVo?=
 =?utf-8?B?bkdkaXh0cjlaRGFTZ1ZNN0t1eXVOTW1uRWpzUUY2NWZyRXRBT3hXOERhcFVB?=
 =?utf-8?B?LzNCSTgzS3lNd0ZvdTNCYmJuTy9KaVdaSjJZL0JoeEdLWXRMWk5obFR0NWl2?=
 =?utf-8?B?RCtneXRReFpMd2xkRU84MHJFd0NWWnJXUFY1QjZXRkxkY0JCU0lnQWpXNFEx?=
 =?utf-8?B?eFNEeWZKRmVRY0lGUVp5WGFLYzR4dGJnNEFCV3VvNXBaYml6THZFb0FlRDZx?=
 =?utf-8?B?RmdHdTIyUEFLaEV2UkdSWmoxdnh6WlJVTWtBZFFIVkdzU2lrL0RZTis4K3k2?=
 =?utf-8?B?RFdZWUhqV0VnU0pVK0k2MDhncm5aSU9maU9lNUp5bnZ5emNvOW12cGlWSHgx?=
 =?utf-8?B?alRXV21XQ3hEdm5SVEZ0N2pDc3FBT1AwcGppN2lKZldvcFF3ZWtNakY4Rlc3?=
 =?utf-8?B?NnBDRFFQa2dvazFtcCtVVVJ0THRTY2dJTUQ3VDhZd1VvTlc1bFRmODJRNWNv?=
 =?utf-8?B?UTNOTVJQVXgrQmZZYUZoNWc1UmRYTmtWN3IzSEE3SzdXTTgwMlpGZFBiM3VR?=
 =?utf-8?B?WDd4UWxSdlJacWQ1UEJ2YTJFZmtqc3N5RXhuQ09nZ21UOE43TmRFS2RxdWVn?=
 =?utf-8?Q?vZx00AtGWO5JO+5s=3D?=
X-Exchange-RoutingPolicyChecked: mbx5wvFQ1LqSfKHYUcwKBWh+NI8Vf2nSJvIz9TrPG7xZu38m5U/25pbTLQv0aiqrHKhwCvW/ftDoLN5YLhNDpIqUkjrrYoP2D/VTQ6AD/Pc1us8rtSeyEDn2SgdAVwkWF1YnPPx3e17E1eXECUpwqUpGHeyjOfVYebHqXIELWi3cbV6wmxF+WaVQaWv+6PfEgy6zOqxBmcHHVpAgmLgnp3isNtXV/6jmgeEI7jt4FjcBY4cDdsV6t7dMAS81SwBAxjzSeTQVfzBilPsGJhmf3yDFq7fO7YyOz5KCu95SG2B2WBTi8GS6Aa+atPq4bfvrEpjX1y1u8HsPdlyk9jkoMQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2feee4ec-b57c-4f41-fde6-08ded6052225
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 17:37:47.5054 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SaO0yD/QZ1bVX3il/X6KYkXTrr7ae4+4fWzLNh4OOKCtRvzEhC18cegoOVgxlmjoeEOTRDIMf6KcS8bk9L0skYUp5tSG9BbViu1FLOEm4PM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6454
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



On 6/18/2026 3:25 PM, Julia Filipchuk wrote:
> Use GuC firmware 70.70.0 (UAPI 1.37.0) for NVL-S, CRI, NVL-P.
>
> Patches are intended to be merged into drm-xe:topic/xe-for-CI branch.
>
> Platforms NVL-S, CRI, NVL-P are not merged to upstream at present. The
> GuC definitions for those only exist in the xe-for-CI topic branch
> drm-xe:topic/xe-for-ci. This patch set reverts then re-applys those
> patches via cherry-pick with appropriate version bumps.

All 3 new commits now have a "cherry picked from" tag, which I don't 
think is correct to have given that the source commit of the cherry pick 
won't exist in the tree.
with that removed:

Acked-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

>
>
> Balasubramani Vivekanandan (1):
>    topic/for-xe-CI: drm/xe/cri: Define GuC firmware for CRI
>
> John INTEL (1):
>    topic/xe-for-CI: Define GuC firmware for NVL-P
>
> Julia INTEL (3):
>    Revert "topic/xe-for-CI: Define GuC firmware for NVL-P"
>    Revert "topic/for-xe-CI: drm/xe/cri: Define GuC firmware for CRI"
>    Revert "topic/xe-for-CI: Define GuC firmware for NVL-S"
>
> Matt Roper (1):
>    topic/xe-for-CI: Define GuC firmware for NVL-S
>
>   drivers/gpu/drm/xe/xe_uc_fw.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>

