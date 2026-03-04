Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76742EB7EC5
	for <intel-xe@archiver.kernel.org>; Wed,  4 Mar 2026 10:39:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34DE610E9A9;
	Wed,  4 Mar 2026 10:39:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hl8do7Ca";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88FBF10E9A9
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Mar 2026 10:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772620755; x=1804156755;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7I2YjgZccmsBg7t0IcA1XhUdRk6HbUMBlaUgs3ohrqA=;
 b=Hl8do7CaDOusr1Q58dNrHQ4ZDgchxrgKrHIt5zmUj2Uo4QtT4rQQ0gQV
 RDoZcqaELmJyDJSf2rrd7m3vqubyhxAQrjCwijGgsqUo8RVE5TofYH908
 hHUWA0JmR8IQoyck38TP1LQAAf5J+IeBsR+Ub0vdkpW09dKUrTDRttnFe
 rGOXCjapHUXfdTm3kPdXs8dEPSAp934hvwKL38jVgPN7LUWZMP77y2xs8
 7w9Jk2gKLYFi140Znknacnc6/FD48EH3AComyl8L1YLseaRqJqXZIl+17
 dOJYfe5O1RSbAHPsxe4tpqHy0Hkw/0JXz8rUhF4h5gJrF/zW0ZHGI2qNl Q==;
X-CSE-ConnectionGUID: YxDlwUtNSw+Lka1RUvKqJQ==
X-CSE-MsgGUID: xLBYEeLiR4G9NkDkvp4XKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="72704576"
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="72704576"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 02:39:15 -0800
X-CSE-ConnectionGUID: ZH4X+X3mTxyKZzeCdML9vA==
X-CSE-MsgGUID: PoPlfD22TvejVIEB/u4FCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="222969895"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 02:39:15 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 02:39:14 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 4 Mar 2026 02:39:14 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.64)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 02:39:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YV9v+gSdnq1LSV6+jLqFYspcStpQ9tGHYqImYv2w1LOIsVoUp5HeLkG0exuZJyG94SABWEU+VVE/PoPsPO4uPZtc4VDC8tfdOfmvilCx+Plybxx9fUyBSDU8NL49HiFYM4Jfi1qsLHVOnB2HMOmuY+vBluTR8CXY2zmlxir1nlj3mhLyfAGpmg9HMPWs7CoXm//enk9FZPUMFlAO6wyywJ5TX6ecTEmlLHpvdnwF5Yds8j5tsHo0BjYZ3A18lmvF5+zCBGDV46fB0HPVGUR/uAAUWB32DtDYA0D7476i4P4MYQ/rOU5I5LTY9pJ1wqSA68+W6d4YYNr2bNqabqxAzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PGPgwgDRJqxOhHYnHhlg2PzGcCe2DJXBCI8rZILW94k=;
 b=Stp+j9HKSGab/1LOGS3xyn/WPx80eiw5NR9Ty5lCEyHVZoQZZT5r7zHK9e/Z8l6XJuEKmY1uFxhrvrOPZpKRBMSHBdcsUlz8NDenOi3DN4BzXC3BfoHlTdN2EYur3VL05Dj7mfbzJa7fnuVpE5lgXd9wpU1qxAE6DSle1SLuD9YSSzjazIEiet4evwJ5Eg4oTMEbgKJS0mX70ZI0bDvYF8qujZRF0Q1FT+BZcbpLoKme0rxP/37r8rLWzbs8Ct/YJ5INIK/jMcWUhiQkFxEKNkmNdfafgyUWtJMfYZv1rn3iOvFVJ7yFTYWMNBHJpv7JPLUrRqM16RnPJgfqEJeCuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by DS4PPF8B2A2E830.namprd11.prod.outlook.com (2603:10b6:f:fc02::39)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 10:39:07 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 10:39:07 +0000
Message-ID: <8976f5c8-fbc1-4ff3-aaf4-0584185e6cff@intel.com>
Date: Wed, 4 Mar 2026 16:08:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/11] drm/xe/xe_pci_error: Implement PCI error
 recovery callbacks
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Matt Roper <matthew.d.roper@intel.com>
References: <20260302102155.4074630-13-riana.tauro@intel.com>
 <20260302102155.4074630-16-riana.tauro@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260302102155.4074630-16-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0209.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b0::8) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|DS4PPF8B2A2E830:EE_
X-MS-Office365-Filtering-Correlation-Id: 245a8861-d94d-4657-2c96-08de79da435b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: kZXfyEUEnxpN6jSCcbHVBijFVa++6Jq21L0Jdqm+9d2WFSfNso1oydkQw6ZAJaKFkgA+gnS8nNDlpndt8PpsQ2lyo+23J99Pd85Ugm6YCiLp50e68pCrelhQ65WoTFzs/KZNocmANAPNlxGp6tPMs9Wga9dNvhVXpVpJ2FpQ+K/DKGWjd2WoMX5vcBO/glN87HDecyswBBj7z1V20nEvHUK4cj+Jm3gO5lOLJ0pWghKJm1yzrnYZWnLm0l4nI6kd53F7rAO0doTHzXcdtq+qF5T4L77yfkqRLHNrPW1LJm8ONc0WctkhiSiYornH1vl89aP5LyQgG+BD8wOqaC9o8Q5cUd6vJLcV+9nWhSdHnwlpfS4GOAdu33ZyH3IU7kbm8OB8M2NzZ/GpHi8c8OO3VYKTEqz7mh6ClmeLhWvt+ogX42ll9XbP2d3GgI90Eo4OAK5PA4qnVy0LYcXdaHCpnMYPKC9K+MXyzdJLxgUfjHouwaWAEtKrs5TP1jU7VUYhEEVwTrSzJwTa87pdTKSrSXGUsWWflkM4SUJ8C8ec8cWe/JYWS0qzVCrLaa7GOATiTrHhpAKi8moqIMY/8BUxgc8yyRA7tD542cq+Le3Kcn8wJGWIdrdlUHw+4OBEBkjOy5vfuOwEkcMgprFAwI13gWFUeqv4OUVyXKZ36LMW9LkT+BEJjK5THGg8gADzRsKR7uxKJns3BFql7O+KccVSd+VMnfR47Bz/j5DndsllNgs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V1l1dGE4NGV1TEZjNmJwbHFmSG1DSTRjd3Z4bkVLZmtlUHVaT3dUKzJVSUFW?=
 =?utf-8?B?ZmgzRVIwa2x6SHBpR1U5SFVoc3NFTjY4VXdmaWNmYkVYUVFwcTdSaGNpTU9v?=
 =?utf-8?B?SkhuMzluVklzMEFJWEU4MytLU3A5a3kweEozdUJHUnpxSFB3NHVWcVFVUm85?=
 =?utf-8?B?RGJYM2EzcUNaM1pmQ2I0Z3B2NlE3WFZFTlRVRWZ2SzNQLzllWFJMQXFEQng1?=
 =?utf-8?B?eWhjTCtsRVBBZGQ4U1k1ZzdTQWNNK3BYbGpkRHp5UUwzd0w1Vk9RUW1MbUUr?=
 =?utf-8?B?UmJ6bE1VR0hISGpnSm14QmJaTllYanUvMWNZcWx5eHhjZHhwVkc2MzlEUjQz?=
 =?utf-8?B?VmorZTRPWDc4RjJVM1ZhSEMrT1F2V09oVGl1QjY2U0h5Q2pLTEEyWmluN2lw?=
 =?utf-8?B?TzgydEVvSys0dG9YOGNkR2NVVW9sazNBNDlRMGU0RkU5amZWejBMY2JGYzdK?=
 =?utf-8?B?ZlR6QjRwbGcwMStCdzRVNGpHQzl6ZmRyV1k2R0hoNFZWN2RHVitpeVpMSmtv?=
 =?utf-8?B?cnpnMFFkM0QyN25Uemo5dHB0NEladnNqY0VhNktSR1N0WHEyNWlwMzB6VjMy?=
 =?utf-8?B?azVCNk9lTnoycU83Y1JBSGxrL204LzA1bHFuUVlNd1NiUjFaenlXYzREWGZy?=
 =?utf-8?B?bDBHOUlxWnN2ZGdwbVpKV21rSmlKNkV2TE1zclhEaWJFNzN4NjFJZzN6Y2hY?=
 =?utf-8?B?ZlJMb2RkM016cEt4S0c3U096aUZwS1ZCNVdmeDJESWE3T3lUNmM4dTVvMWUx?=
 =?utf-8?B?Vjk2MEVjNG0xRnYvQUo0akJKelRHNU1admRqWUtrYlp2UVZwejhNcFpzanAx?=
 =?utf-8?B?aHF0YkhCU2p4WFk4TXg2KzJqMmxjL1hNY2lGYVM4dHArZ3RVanRmaWNwM3F3?=
 =?utf-8?B?S0haZExKeFVwVUUrK05xaFN2ZDhaRTNFcFRETzRpRExVOVh5em1hcHVobm9p?=
 =?utf-8?B?N2xkTkdBNlRVNDA0NEVUNUJUNEd5Ykk1VXZ2WEhaSnVieXZlWGNyT2M0Q1Rm?=
 =?utf-8?B?bmtpRUNSbG5DbURHUkVGOGpWTExxYldjS0FMOE1CakkrMk05SFBJOUNENjBI?=
 =?utf-8?B?Z3UxL0hCWFRtMDAzUk5ES0JUcGk2RnprbDMrck9zZVQ5aFBBU1lrMU5rZEV1?=
 =?utf-8?B?RTlPRXl2Y2NVdDU2K3ZOdExDRE5yaElRK0ZhOCtvUENUbHRPTUo4RDNjVnlY?=
 =?utf-8?B?bzAreHlqUFBiYjdhaENYZm9nVGVIYjFRR0lnVXBYbHRTbmxIVW1ZbEluVzJx?=
 =?utf-8?B?dW1mKzlmTFhnUjdvSGFhUTdhWGdMVzdMNTNYVlNiY3M3Vm5YU1BwUUJYaVN5?=
 =?utf-8?B?U2tiamtiKzRRZEVWMFpYeVB0SENubkUvd3FERkVwc2E5K09wekFRSDZuOStJ?=
 =?utf-8?B?RzRoS3M5OUFWeHRBeS81NXM4MXkrVDNPdzBySVkzWnhodXdUTkQrZnlJYUZP?=
 =?utf-8?B?dlQxcjNydG43RzJXNFIwdnh5SC9xME9LSVlnam9yZ0Jma2ZEZ1RHc3k1RWJT?=
 =?utf-8?B?NEVnazVNK0o3SldsOEJ3VlpaU1FNb3cya255eEtKdUFiMFhZWmw4dVA2a1ps?=
 =?utf-8?B?amw3Y1RsQ3R0NkN1d2p3aVpnQUdjY04wYjRtRlo2c3pKdmFDZWd5WWl1YTY5?=
 =?utf-8?B?Z3N2UCt1NldNL3ZsZTJQaWpOaGpkQzdvYWhsMUJtZ0ZtRVhxaWZNTXE1Skdx?=
 =?utf-8?B?c0tFZUJXd3Jhc3lYZ3BYUXo4Y2hHT1VOVzF5ZUpMWEJVN3kyRStDOEVaOWxa?=
 =?utf-8?B?dFlnNU5PNW9ldGo3VFN1UnArSVA3c3dmVW1zWlVPQm5xVW5aQ1N3a3QrWHVY?=
 =?utf-8?B?a3dQYlp4Zy9kZnhLb0pyL3JPVVpSM2pha3RqSVltRU9wdFJVQVdoNGUyMkdJ?=
 =?utf-8?B?YWU4WU8rWUxpZDZPY25yVXNwdkpVMlllbVBzcUtDSGg3emhSMStUem15RXc5?=
 =?utf-8?B?Nzlkb2hYV2k1MlB5QnkxZ0NYTmxxWTlYcm5xQm4wOEVraVlqRTZrK25JaVdC?=
 =?utf-8?B?Znd2MGM2L3h4Z0VnaG1KamVxS2xCVXhmUlVqVFh1dGlkYmdUbmR3ZEt4c1k3?=
 =?utf-8?B?RXVEKzVqNlZCZEt2TDFKSlN4ZUtQVGxoTEEwckdCbFBDVkdIcXJyNGhyUldr?=
 =?utf-8?B?VE05NklmNVRZbG5DYVMvVStSV1ArWGJtTGU4UFBoL2xTcVIxM0tZZXJDVVpT?=
 =?utf-8?B?bmJTbW5OeXpvYngybEliYUpyMW02ZG9iUlF6ZUFJcFo2dTUycXNHeWU5Rjly?=
 =?utf-8?B?aEZMeUtjeVpnTkUzbDAxZkxNL2FIVXlzOFpCU2FZRm1vUWVHb0xNODVGK3B1?=
 =?utf-8?B?MlViUExNN1YxQVJpME5wZUZ0T29nWi9hNzZtYTB5Ny9iRTRLMGM5TWxEVWlW?=
 =?utf-8?Q?HpLk7p3tK8f0PIwY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 245a8861-d94d-4657-2c96-08de79da435b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 10:39:07.6682 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dDJg6yFvofz0OKZbBDuqRPonow0R3JPF0JoF9M+YvM5iTNeb6w5tZaar9hElP4OAEbPuiX3z94csWbNWWMYOmP9k8TYQHYLyN3glFhuGlC8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF8B2A2E830
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


On 02-03-2026 03:51 pm, Riana Tauro wrote:
> Add error_detected, mmio_enabled, slot_reset and resume
> recovery callbacks to handle PCIe Advanced Error Reporting
> (AER) errors.
>
> For fatal errors, the device is wedged and becomes
> inaccessible. Return PCI_ERS_RESULT_SLOT_RESET from
> error_detected to request a Secondary Bus Reset (SBR).
>
> For non-fatal errors, return PCI_ERS_RESULT_CAN_RECOVER from
> error_detected to trigger the mmio_enabled callback. In this callback,
> the device is queried to determine the error cause and attempt
> recovery based on the error type.
>
> Once the secondary bus reset(SBR) is completed the slot_reset callback
> cleanly removes and reprobe the device to restore functionality.
>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
> v2: re-order linux headers
>      reword error messages
>      do not clear in_recovery after remove
>      return PCI_ERS_RESULT_DISCONNECT if probe fails (Michal)
>      only wedge device do not send uevent (Raag)
>      set recovery flag in error_detected and clear on resume
>      add default switch case (Mallesh)
> ---
>   drivers/gpu/drm/xe/Makefile          |  1 +
>   drivers/gpu/drm/xe/xe_device.h       | 15 +++++
>   drivers/gpu/drm/xe/xe_device_types.h |  3 +
>   drivers/gpu/drm/xe/xe_pci.c          |  3 +
>   drivers/gpu/drm/xe/xe_pci_error.c    | 99 ++++++++++++++++++++++++++++
>   5 files changed, 121 insertions(+)
>   create mode 100644 drivers/gpu/drm/xe/xe_pci_error.c
>
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 1890bbd1b28d..417b030e5ce7 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -99,6 +99,7 @@ xe-y += xe_bb.o \
>   	xe_page_reclaim.o \
>   	xe_pat.o \
>   	xe_pci.o \
> +	xe_pci_error.o \
>   	xe_pci_rebar.o \
>   	xe_pcode.o \
>   	xe_pm.o \
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index 39464650533b..972f43d20f1a 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -43,6 +43,21 @@ static inline struct xe_device *ttm_to_xe_device(struct ttm_device *ttm)
>   	return container_of(ttm, struct xe_device, ttm);
>   }
>   
> +static inline bool xe_device_is_in_recovery(struct xe_device *xe)
> +{
> +	return atomic_read(&xe->in_recovery);
> +}
> +
> +static inline void xe_device_set_in_recovery(struct xe_device *xe)
> +{
> +	atomic_set(&xe->in_recovery, 1);
> +}
> +
> +static inline void xe_device_clear_in_recovery(struct xe_device *xe)
> +{
> +	 atomic_set(&xe->in_recovery, 0);
> +}
> +
>   struct xe_device *xe_device_create(struct pci_dev *pdev,
>   				   const struct pci_device_id *ent);
>   int xe_device_probe_early(struct xe_device *xe);
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 5599534384fa..616d74792902 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -504,6 +504,9 @@ struct xe_device {
>   		bool inconsistent_reset;
>   	} wedged;
>   
> +	/** @in_recovery: Indicates if device is in recovery */
> +	atomic_t in_recovery;
> +
>   	/** @bo_device: Struct to control async free of BOs */
>   	struct xe_bo_dev {
>   		/** @bo_device.async_free: Free worker */
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index ad1e5ef2ee89..825489287f28 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -1313,6 +1313,8 @@ static const struct dev_pm_ops xe_pm_ops = {
>   };
>   #endif
>   
> +extern const struct pci_error_handlers xe_pci_error_handlers;
> +
>   static struct pci_driver xe_pci_driver = {
>   	.name = DRIVER_NAME,
>   	.id_table = pciidlist,
> @@ -1320,6 +1322,7 @@ static struct pci_driver xe_pci_driver = {
>   	.remove = xe_pci_remove,
>   	.shutdown = xe_pci_shutdown,
>   	.sriov_configure = xe_pci_sriov_configure,
> +	.err_handler = &xe_pci_error_handlers,
>   #ifdef CONFIG_PM_SLEEP
>   	.driver.pm = &xe_pm_ops,
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
> new file mode 100644
> index 000000000000..d4896a4a5014
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_pci_error.c
> @@ -0,0 +1,99 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +#include <linux/pci.h>
> +
> +#include <drm/drm_drv.h>
> +
> +#include "xe_device.h"
> +#include "xe_gt.h"
> +#include "xe_pci.h"
> +#include "xe_uc.h"
> +
> +static void xe_pci_error_handling(struct pci_dev *pdev)
> +{
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +	struct xe_gt *gt;
> +	u8 id;
> +
What is behavior when wedged mode is XE_WEDGED_MODE_NEVER and PCI error 
occurred.
> +	/* Wedge the device to prevent userspace access but don't send the event yet */
> +	atomic_set(&xe->wedged.flag, 1);
> +
> +	for_each_gt(gt, xe, id)
> +		xe_gt_declare_wedged(gt);
> +
> +	pci_disable_device(pdev);
> +}
> +
> +static pci_ers_result_t xe_pci_error_detected(struct pci_dev *pdev, pci_channel_state_t state)
> +{
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +
> +	dev_err(&pdev->dev, "Xe Pci error recovery: error detected state %d\n", state);
> +
> +	xe_device_set_in_recovery(xe);
> +
> +	switch (state) {
> +	case pci_channel_io_normal:
> +		return PCI_ERS_RESULT_CAN_RECOVER;
> +	case pci_channel_io_frozen:
> +		xe_pci_error_handling(pdev);
> +		return PCI_ERS_RESULT_NEED_RESET;
> +	case pci_channel_io_perm_failure:

Clear in_recovery flag before disconnect, dead/unusable device should 
not appear to be recovering.

in_recovery flag still set that suggest recovery is actively happening.

Thanks

-/Mallesh

> +		return PCI_ERS_RESULT_DISCONNECT;
> +	default:
> +		dev_err(&pdev->dev, "Unknown state %d\n", state);
> +		return PCI_ERS_RESULT_NEED_RESET;
> +	}
> +}
> +
> +static pci_ers_result_t xe_pci_error_mmio_enabled(struct pci_dev *pdev)
> +{
> +	dev_err(&pdev->dev, "Xe Pci error recovery: MMIO enabled\n");
> +
> +	return PCI_ERS_RESULT_NEED_RESET;
> +}
> +
> +static pci_ers_result_t xe_pci_error_slot_reset(struct pci_dev *pdev)
> +{
> +	const struct pci_device_id *ent = pci_match_id(pdev->driver->id_table, pdev);
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +
> +	dev_err(&pdev->dev, "Xe Pci error recovery: Slot reset\n");
> +
> +	pci_restore_state(pdev);
> +
> +	if (pci_enable_device(pdev)) {
> +		dev_err(&pdev->dev,
> +			"Cannot re-enable PCI device after reset\n");
> +		return PCI_ERS_RESULT_DISCONNECT;
> +	}
> +
> +	/*
> +	 * Secondary Bus Reset wipes out all device memory
> +	 * requiring XE KMD to perform a device removal and reprobe.
> +	 */
> +	pdev->driver->remove(pdev);
> +
> +	if (!pdev->driver->probe(pdev, ent))
> +		return PCI_ERS_RESULT_RECOVERED;
> +
> +	return PCI_ERS_RESULT_DISCONNECT;
> +}
> +
> +static void xe_pci_error_resume(struct pci_dev *pdev)
> +{
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +
> +	dev_info(&pdev->dev, "Xe Pci error recovery: Recovered\n");
> +
> +	xe_device_clear_in_recovery(xe);
> +}
> +
> +const struct pci_error_handlers xe_pci_error_handlers = {
> +	.error_detected	= xe_pci_error_detected,
> +	.mmio_enabled	= xe_pci_error_mmio_enabled,
> +	.slot_reset	= xe_pci_error_slot_reset,
> +	.resume		= xe_pci_error_resume,
> +};
