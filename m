Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6BE0C5DF80
	for <intel-xe@archiver.kernel.org>; Tue, 18 Aug 2026 08:22:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6580110EA3A;
	Tue, 18 Aug 2026 08:22:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EMd6h8A1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 858F710EA3A
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Aug 2026 08:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787041366; x=1818577366;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xifZ7pmXKDbwTpcLksobQgTbgbzAmYLwPq12HZuJHy8=;
 b=EMd6h8A1LNxRX++sIgzuyiNxhutUwil73aC5144xjwY2xZF0Njgr9ERQ
 XQrbUJdlv4jG9fVwQzQK3ewW058NF/S0iHKZVLfrEGFn4uiUUWztSzKXu
 kDFSNK3TXpncD+T6tGEVupnvxx+njgpFM0OyYbVuMqOCT15rs9pdE8mcI
 gC3cfYwntoDF3cbCGJvVM6tJST6n39dVCNSODIhFH/M7XhBAxgoeIRmEk
 l+Ypq6o/UJp/jnJSDpHmfWdsNM4WfrPSKXVYfgXcFwHFklRT2kszyLNE9
 MBPvzV3442T9sWJCOsAkFgmcNHK9KFj8zbDC3sZnjeB6edRhVqpQ1WAhK g==;
X-CSE-ConnectionGUID: hwx6GqVTRq+CLWq7LzzcRg==
X-CSE-MsgGUID: r4dLsVDQRdy8w5vxj2wj8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="87546012"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="87546012"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 01:22:46 -0700
X-CSE-ConnectionGUID: 650eUirGQq2TIpV+Dp6VhA==
X-CSE-MsgGUID: Q/JglKyFSJu+0rU0AhzNsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="264720470"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 01:22:45 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 01:22:44 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 18 Aug 2026 01:22:44 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.14) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 01:22:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YszMlOdMkIE3RS7UZYSkaZWVhmx9+oNpiBBGe4mhTOv7Lf9YT0KUo+663p3cvpU6Z+xQCG/7o3Ai05ebUgw8uSEeFM4VoE1n+JN4ZfY6Dz/K84OzmUlIO9o/oTZ70c0OUHb0+mV4QWUcABoLsjX21Di2N4gXUGapygiXn8KUPucOpMueyjYgAzUF0P3hy+hrdVClfSJikhPmql9KVsIkb5mGm4tU+zbkpaO9JSjQCu+vLkg4H/P7bPdgdMigygraYwRj1dEznHJdoHROHBTc7bxoqR5mRWDWPpAfb9shjaW0/uRrHb6rMW7sQm/YL3DnLDxg1eLhu3A4PsVagbc1jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nRodv4cpcfh/3i0lyK46l6lzJ998BJ6AHxUgL+Ib6po=;
 b=ycxLVTRoqqpi/ddB4sc8byQ85LYb5km/E5pNPO0ZZ+gHZzVr//+MTAut9nffFUBPIk18FdBHGHugOkoOWNar1PWdOyaZdmY4rd7eF7xQG6A04voS3oFO0M7ddCUhw//5TWSxSzSc2BhxmPddlfwUHdS5hyNAPdWwme420rG3C50Hp/53SZTzp04PDFUjT7rWvwKDf4d9+aINX+pXHp5Cjwo44e5ysluWKsqdPCfjbdC0vTilyK72VcXA79lJSzu3zl/ve66xVE3Cg1D9yKeESv2T3cx2pTWVtWt5bHlwLp3cQzxA1PjxfHJYecX/hRawRyMRyoQsxpe8gZ8j08TMgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 IA1PR11MB9494.namprd11.prod.outlook.com (2603:10b6:208:59c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 08:22:37 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0339.007; Tue, 18 Aug 2026
 08:22:36 +0000
Message-ID: <096b3560-2be1-4082-8e21-ed5ac92e8697@intel.com>
Date: Tue, 18 Aug 2026 13:52:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/xe/pci_error: Allow debugging PCI errors
To: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <michal.wajdeczko@intel.com>, <matthew.d.roper@intel.com>,
 <mallesh.koujalagi@intel.com>
References: <20260814143121.390791-1-raag.jadav@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20260814143121.390791-1-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0062.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::20) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|IA1PR11MB9494:EE_
X-MS-Office365-Filtering-Correlation-Id: 07680f37-8032-4e72-21f0-08defd01dc23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: sKzm+WAa5ykbdkPQMP0T4v2ilisD2jfVbOypb0YEKOtUpuwcCvZJCM7ow0APyhVbqmBzQNySx91r42VpVpRO7U/CPm3cmbnv9Gn6CNCIYOvBhgiyaSTp1kutkr8VUMDNvu+uJlJcksFVCgTEQ7eYN4nxUoAGZK7BxBtR8Y2IBqf0a/cN1cdckiL4jO86TgWY9/S6Kvkhw7xV+nmBovnEdcUz4qq607omY8Dxyn4AwQGxeKMbZJ3bAy5PI254LBiDuHbe97gYYkNQeDUp174f3c45/NNlM2sz8h99d2KVnbSAM/RtfUm2X//h95s/xCnvxRMm2lkispbhmwRJH6Iuy86jKR4zw5L+u9qTjDQYLG15DK0CIxj4wYnoVC0XBiW3EnxyOi5XKUJUL7FlGGxSw+QKP4N2O8K11nVALqzXIjmQ0OW+RuN6eIUvmyejLZBn3gjMJGnXDS9AOSF4ZICKP4HoV80fQvKORNAbBA6BVUgUm9l7fbYssx0h2aY6BOLb8ANh6f77nPkoLc5LRCbfp4CeawIKfbUWhd+GWUBvKdTaN88PqoZmX3SAvWK+McxpqgLzstphp66HKvOnntqAee+zIFGkWedTxt0gN3DmVlq3233zAYhCo61RGGcOfzlihbYXzMHqdpN3UAs0JWdP5cVa9ne/LCUXfM5Y91QrNHg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YXA3OFZnU0lyTmpnWmtFQk5WbG4rZUh4RHRBM1FlWHZRK0Y1bEllUGNXWTF0?=
 =?utf-8?B?VnVsMEJIVi81VnArOGdld3E0VzdiYTJPdFB0QWxaNWgxdXk5N0JaRFl5SVZ6?=
 =?utf-8?B?VUJIY0ZxQlUzVjJFczJZcVRhKzFieWgwcDAxbGhGc0NqSmhJQVpCQ3ozYURj?=
 =?utf-8?B?anVqcFNFRCtTc3hlbGlXSHgwMWlXRnFMVHlOcVRSUSt4R1YrTHFTTkpteWhG?=
 =?utf-8?B?RGhaNzhYUTZxZE1DaTRRMkxmM09jZEZkZUtXRVFQOEUxNEpBL2dPdkpvQjVh?=
 =?utf-8?B?cjRLanArajg3TlFkOUpWbTB0NWxZYitsdGxEN1dQVDFPSUh4UCtMOGd3REdU?=
 =?utf-8?B?SEdBREtCNFF4M0U2MEJMYytTcURjcFg4a3JBM3lMYkkzcXl3VTJKTWprTjIz?=
 =?utf-8?B?Y2lHeWhSMVEzUkZ1MS9LNFhUdjlYQ3BuYWdCQWtuSGFoQTJISTZTRGdiL1BT?=
 =?utf-8?B?ZUxnUDlOd05sbEVZZHgzTTROOVVrY3hMd0tkNTlHY2JZV0FDLzA0MXRKMnVq?=
 =?utf-8?B?MkZHeE9hQjlPQkUrTHZqMFBvNHEzanR2ZDBtWVd0ZWF0akFJTFh5SEZCeFRy?=
 =?utf-8?B?Yi9pODBObnI2bHozYjVvaHpaWEoxUXNpY1o3YVpaTVpySmlKTVVvV3ZCZjU3?=
 =?utf-8?B?dUVoWEVqalVIVTZ6bmtyaG9kRHJYRThxMkVORWo5a2JFVWtXYmpHR2d4R2hW?=
 =?utf-8?B?SDFmWjlJVCsvWjV6SXJzK09BZTNaYlB2R29vQTN1dk9FNk1VbmlzRHdtMU5L?=
 =?utf-8?B?MWRuRVRhcG1ST3lIVmJ5ZEdaVkhKWitQai9BQy9HdFpGVHYzaHVJaVNxNm1G?=
 =?utf-8?B?Ni9TT01rSm8zZ2FzZlVDZS96ZHBMZnpDL3hFQm5hM1JVeTVFNWVadFhRTkZJ?=
 =?utf-8?B?NEZTSzhDRThpUzBwZ2N1elRnWGdBeDZxMElTVjViZGxoU1N4MWc3WWxFRGlH?=
 =?utf-8?B?aVVjYVJIclh0eStpRENCU1ZrOGQ5dmNzTXhoWkxrWmw1Y0hqcmhHMWV4eEda?=
 =?utf-8?B?RXBEWlAzU0JxRWZkZlVHTjczKzhvKzR4VzZacStIRXRQZmNFRFMzOFpZZ1Bn?=
 =?utf-8?B?Vlo0SVRWaGZLMGpGVy9kcTJiR2ZDOFZmY3EyMEFUMEVuMjdZVDNWdkNkSHJq?=
 =?utf-8?B?SExEd1NZQVd1c3VLblhHUGx3aWliN0ppZFBWbklvSWhmS1lOYi9Oamw3dW9D?=
 =?utf-8?B?bWV3WUxnZTUrNmU5S1RUWTAvaW5vTzM1OVdycGxXRWd3MnYwTTdUNnI0MTd1?=
 =?utf-8?B?UEwxVzk0cXgrZ25SR3YxdU41R1llOXlRYlZrQXVKUTRZL0NpN0s1SXhxczBw?=
 =?utf-8?B?Y25yTXpTcVVvNTRIcjBiUTlXdld5dVRZaG1uM01Yd1hPVUc3SDNwNk5iOFpl?=
 =?utf-8?B?Z2xpYmFPVWhpVTQ5OTRpSW96SGRvTnA0citKZGVPeWpYYVlLcmlTWjdsbzI0?=
 =?utf-8?B?RGppZ1cvdFNTL0YyMWRRWDZ4VGxKU1FFRnpWRnhRaFphVU1URjRHZitSNmNt?=
 =?utf-8?B?WTRxOHprMTdUWXNROUtFWUQ1ZEpBZVAxM0NXUFRDb2E1bXdTYlk0Q1JiekhZ?=
 =?utf-8?B?YzNRbGZlLys4T2FHbUVMMGNOMmRndlRiRzR4UzAyM0lKTE5yY3J0dzhibjF2?=
 =?utf-8?B?ZW9ONStWMVdZc1BzYkZ6M3BvVzU0akF4RnFuSHJEelRHNTZXQ1k0L3I2bVRq?=
 =?utf-8?B?RVF4ajBSSkZ2Z05uSkdRN1hObVNHQnZ2dSt6K1NaYWVwVk93Wnd2eTZMYVBF?=
 =?utf-8?B?WW41SEk3MWtRYVdHaEQ0MVd6ekNMci8xMFB2ZnhERi8zODQxRjJmbDhhYzQ2?=
 =?utf-8?B?OGlsbXhzTk43NDNORHlkVVVGNXBwV3QrSnpRc0hTMUE0MWI1TEt4SkNWd1pN?=
 =?utf-8?B?dWdrTHpFYkoycldkOWJ4aGV3Uy9pWGpucm1WRzNJT0RvL1orVjVTb0NsREs1?=
 =?utf-8?B?R0k0VnFzQ0EvSW5Bb1h1d3BBa09OZ3kyYkdLaUcyS0VSNFdWY1BMaXZTamU3?=
 =?utf-8?B?bjJGd1FIR1dVZmRveHdKbUVDa1FJR0dpeFFub05FZXdZd0dqbjN3cEVJRXkx?=
 =?utf-8?B?dHk2eEUzd2IvdFFRNkMyZkZhWU54M2pPNk1rSmxwMzE0MUJOVGVrN3VKNG1E?=
 =?utf-8?B?UnhwbGw0Ukh3MHdJR2IzOGdQZFlNZ1ZMTHY5T2RIdUc2Um04d2hPaDdwOEwr?=
 =?utf-8?B?Ky9aTHN4UjRTdlRUVjNqby8weXRTdi94bU1KL3NDNE02cDNab0VhSnZmWTVE?=
 =?utf-8?B?WnFWNE4xYURRQ1djTmkxVmg2MUJseEJUb09iRnpBWEhtakltNm9KYnk3WVdl?=
 =?utf-8?B?ZkhYbjJWRE9IRDRLeGNyVXJ5NEZSenJLeEt4cFBCQ3UvZ2EwVWtHZz09?=
X-Exchange-RoutingPolicyChecked: fvjG1tk7o2nthXFA48+Q9YePKXJdbZwET217ps0mu+va84/ORZeZZ1kIXpoaexbPYgw4hcCx99DG/z60C2ChsSxmjeWU4TvmDj0IGPB8Nz5Us8rQni7JBx9lCOdt3wCUYf0xj1DOQF3MwIibnnfpaxz8bYmzMwXPfPXJ8s7KCEgbVgx4m1tD8V2jRnyAx33R1e7m0Is9gB742yFo8QRoCbrW9TdUx2jN+p2JgrZdJ2DelUdN3INCoXByyEsWtHOlxOU7xKEScyEjGa3PCTcIdBZNjmdhqxo7C75BtCQu4I0Gk4fuX7e6IA+wM6ZQVus0RNk8dVGtqXSbFNZRCkIdPw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 07680f37-8032-4e72-21f0-08defd01dc23
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 08:22:36.8696 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3KjEW+B0oNsM8uLgMYbBafBS9W39aALP5f6h1bM1V0UZvWTaVp2fq+pH8w5rXJ6xnmq09Ynk9MyKzJpEqG0Sag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB9494
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


On 14-08-2026 20:01, Raag Jadav wrote:
> XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET is intended for debugging hangs.
> Disconnect the device on AER and prevent bus reset, so that it is available
> to the user for debugging.
>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pci_error.c | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
> index e41af2ac7f23..4858ce2f9c19 100644
> --- a/drivers/gpu/drm/xe/xe_pci_error.c
> +++ b/drivers/gpu/drm/xe/xe_pci_error.c
> @@ -63,6 +63,12 @@ static pci_ers_result_t xe_pci_error_detected(struct pci_dev *pdev, pci_channel_
>   	if (xe_survivability_mode_is_boot_enabled(xe) || xe_device_wedged(xe))
>   		return PCI_ERS_RESULT_DISCONNECT;
>   
> +	/* User wants to debug the error, prevent reset */
> +	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET) {
> +		xe_device_declare_wedged(xe);
> +		return PCI_ERS_RESULT_DISCONNECT;
> +	}

This should be for nonfatal errors in mmio_enabled after processing the 
errors.
Also  for fatal errors, we cannot skip recovery as pci port driver 
requests reset.
Either way it should be moved to mmio enabled.

Thanks
Riana

> +
>   	switch (state) {
>   	case pci_channel_io_normal:
>   		return PCI_ERS_RESULT_CAN_RECOVER;
