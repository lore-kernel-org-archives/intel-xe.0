Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 668B3C98317
	for <intel-xe@archiver.kernel.org>; Thu, 24 Sep 2026 11:16:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25E2E10E152;
	Thu, 24 Sep 2026 11:16:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XrGdcg4i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C44910E152
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Sep 2026 11:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790248594; x=1821784594;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GAeN8M6XaiAOK17XxI44540Vut8k08b59MyUHtJspqM=;
 b=XrGdcg4iRDc0xdFKXZopGCgcXwBF7jNCma+18gsq5qbdZmAArrKKgHy/
 YEVMEqBbkJGxFh8XjsRwQUK4JsLRvLgkIkSdFpMEev4GXnxbSTMyw881o
 V8HTPdl0thHTFcdnNeXYS6RoEdIGkc5jL09xvCN3HSESFlnHbxH3fNj6K
 /NQOd9b8T56qAD9AtM7PJAj7qxt6cDHGlePXAkdNeSe8MRmlzslFdjqsJ
 4SPM89xG8Y7iJdUlP5LVajedtTEiji5HGJvzXYs7UMdrigBrozFC/Uo7b
 XATFXvSvTbsWynBnX+OKmmgCl6CkvoNjgwr+4OgHRtDg+wWvLvO9wmzWy g==;
X-CSE-ConnectionGUID: aLSd5fJhTHuXGny7rWl0Dw==
X-CSE-MsgGUID: itiSSsACQ5qTApgr8trP3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="112801378"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208";a="112801378"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 04:16:33 -0700
X-CSE-ConnectionGUID: AaG20ZvDQbe5baCZLIrVkQ==
X-CSE-MsgGUID: 33uyENL7TcC0bdgEmZr0KA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208";a="271828157"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 04:16:33 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 24 Sep 2026 04:16:32 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 24 Sep 2026 04:16:32 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.36) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 24 Sep 2026 04:16:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LGvNaE8ymjk7/e++OGmgIJzLgCglFZlvmDnuELpCSrO00CShzyZh4wKhQ5sZS+koyI4It+Bgv3r0kiwjwY6+EBeFnQyOAGN6uhBeVtxtPRE962hMu4xh+6G1P5MpMJpOWBKxYEHR0+oZ1UPa1mzzQ/z3hKuc4dIR0LH5/GhfPK9l2FcO6tGn535dJZeS/LBKRiwVOx3XMdBQGLhEZPemZpTfgYX1vOf0QcTrCV5x4YbSe9Q4dS6Mj84Y70kmEUqvEwAG38dscthwWN/koMc+5pigGgwGG0SRdiL//1ChclHSJ0q6j+aRNWEuYk9zfyOfxNe8z8SaVHx6ER1bveNqHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xjFqvLzwkejRmjvNT6hX3vXmJUCgWuh1jVxLd1hhtTs=;
 b=FF6BYMGXsbSSCA/pZAzQqQfn+l2zC8EatYM9XdBpR06iZB8/JxMs6CP61h57ebjh2PwAi5mooG4WQuER0/dcAQVNNFI0cuatkXLIDh4dyf9IUd0bA4xXINw+nZWFZSr1xtxkAbeCNnpBS2yKglR1uCkRePZ3/jDsarYUbNWhgjf99rEDI+m0eTYbFPFLODckTO1ymdMsHNj1n311gNXYukwYRyVxF8ujKsf35mdBHbIn6VHTo0EfFfcWWkPVLD/nQd65fP0DQWvvz//UEAXig3RToUyaAXYL1k0K/f91Wo4rDrcT40cPnagPsLGgCXiyK2Oc1RA0QPFn5Xasd1tdvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by DM4PR11MB7758.namprd11.prod.outlook.com (2603:10b6:8:101::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 11:16:30 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%6]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 11:16:30 +0000
Message-ID: <3e281317-1b9c-4ceb-8e64-21be3160ea4d@intel.com>
Date: Thu, 24 Sep 2026 16:46:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] drm/xe/hwmon: Update hwmon thermal mailbox handling
To: <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>,
 <soham.purkait@intel.com>
References: <20260910182756.638830-1-karthik.poosa@intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <20260910182756.638830-1-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0087.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::17) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|DM4PR11MB7758:EE_
X-MS-Office365-Filtering-Correlation-Id: e02d2651-0a2f-4380-c1e9-08df1a2d4852
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|10067099003|56012099006|6133799003|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info: rp4ImgxDuvpuCIpYgKi10XF4LwdGSwalRkrLscaMHYnWsPf/hWCJKTCpQXXmtKqValOuJz0ZrmEbu5Qd9boAdzKdbQ35Ec25wRVy2iJ8b18/+RhYLhBa3u3u69eAtZfhtdKhPzYzIhEJ8LhDlzv6B9MCnrpK5C1586HmJ8PkCzp40TdpEstjy4+YKPJlZEI6eqMeHk2smGjkC6j91PxvtIsuXzkFKYiI7rSZ3ZGX1vG7TNFZb9jLaU58j9f283Ps18Tkmd8jlFGP2zhbjx/YSDR0/PjTnFjeCAqAtrrfEyttMq3Rlaf4huM55SkrCqeuNXpKXzkphTNHlnVUCghTH6v5yuIMVY2qZzWNYnXvZl97S9yroQJYmxwHhRg3j0eGUHP/F40ShHm9PdxxodljBDsz4LxB4e1HBXU8NvprBK1S1x3SdstmjItZK6lWBBFH9VrafwrSHmx4pdpplhz5jFLUv4+iXgmCx7fnbS5Xvg9T7p2CBLKtdk25akImm0roa5UTyGGB8xKURfPTAjzObTt6u/tOxuEeUyvLxOXoziVRVjgYu0iQP3/37TGg65CX8KpppCPp5McbGweFHzrEzh9h7bSI8xeufkOI/t544Xl8Vp814/xWEOcSzvLknOqi
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(10067099003)(56012099006)(6133799003)(18002099003)(22082099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UVRrRjZaQmVRb2c5QkR1VElJNmpIcG4yVTk0STFVSUU0K0o0S1NidGs4enF2?=
 =?utf-8?B?eEJqZnJFSlRHbjV4SDZONTRWR2c3NmljOEFOeFh1UWhxUTVhZ3VVSFpOT0Ux?=
 =?utf-8?B?dnF3Wk9mTS9UNEd3TWh3Mi93R2E2QkszcVdzMkdFcEVvNHdCNEJIejgvTkNI?=
 =?utf-8?B?SFo5TzdyZTNteGluRjJIeXJKYmVGUjNzdGVZUDNiV3B0aTdoS2R5MUZ1MWNx?=
 =?utf-8?B?dXFoazcydnRWaXJJQitvZEhyaTdkajdKVUgveXVQQjQ0enZrRmwvNmtvSkRQ?=
 =?utf-8?B?SDNVdDgzVzdieHFIUkduQW9MWlhnNUZTcXpHd0JxaFQzK2cwWWlEVWdmSDhq?=
 =?utf-8?B?TS9TWVZLNVpXSW5yUlZITzR4ZUgwYzdDakhLZkh4SDRmbDFoa1BlUWNmMTAw?=
 =?utf-8?B?Q1N2SVpUWFBDUGd6YU8xTDFvY001TGtyZytuUnIxRldJQ2ROOFNCbjFqVkpp?=
 =?utf-8?B?RFkvYjQycXhuZWR5bExFZFhveit1eTl3VEhoai9kVHlBUFhkZmFRZXpGZ1Zn?=
 =?utf-8?B?L1FleG5LZFBoUnNtZ2gwOHhxN2Z0WEEwYVAvaWxLOXNDSGV3ZlBHNytqaVVj?=
 =?utf-8?B?Zm1hNU9YMkw2NDY2bERkSTFvSlpreTRObC9nODFGNytHK2tkR2NKOXIyMUtX?=
 =?utf-8?B?RHNCNWFZTzlweDZBWTh3UE1LTkMxQkVSL1NFaGpuT3o2M2xXcUh1elhic0tS?=
 =?utf-8?B?elhPWWw1bXhwMlNEc0UwUjJTSnBKOFJYbnRYUEdKNGllUHIrUlllVU9kbExY?=
 =?utf-8?B?Z1ZOWXpqVmk5R0ptZ09sTC9DTmxpNzJObVN3a083NTJKSkZjT0E1bE1qR3JJ?=
 =?utf-8?B?Z2FMU0Z4c0wwQUJEczZSdUVSR3VIYnJ6NTJvUEdPM1hQWjVzdlJTYUREU3Bx?=
 =?utf-8?B?T0FnY0xTcVpiVmtPRmF0OTNvVjVVMVptNW8wS0JtNkJxYlo5S3FjSnNkV2hY?=
 =?utf-8?B?YlBndWo3RTg4NWx6SXdZNHFXUlBjaklwYUliTzUrTVpaUUpzMFNRZ0JFYzJF?=
 =?utf-8?B?QWplMGtBb1JDVmhGZ1ZScmJaeWRNcmdBbktNTmRiVUVCQjZMTnc1UTY1ejJU?=
 =?utf-8?B?ZWVBUjY2VXdVenl5dVFPdDMrT1hPZ1IvcEdKSms4MmZqRlJqN0FSb0JCNjBv?=
 =?utf-8?B?S3ZrR1pieUROT01NNzJKdHAvWEU1Vy9tSDB6SEhwRFNRQ01MZ1hKNXdZeEFE?=
 =?utf-8?B?b21wdzhCeVZjTHBuNDdzblpkVCtQNkVXMGZaS2xOT1N1blh0YkpJZk5LclEw?=
 =?utf-8?B?RGl1RXBIWW5Wbi8vWjFUQTNCYlhySFB1R240M0crMGx6dW1ueGVjNG1FT0RU?=
 =?utf-8?B?NWd2R1Z4dUVUcU44cm5wbUFtRUlwb2dNbHVCM2c1RmRyaG1razJGNW9HUEhH?=
 =?utf-8?B?elliMEhxUmR2SlNxN0plMk1WUnJTaVV0a1JUZkpXemxKVVZtQXBxSFdNSzhs?=
 =?utf-8?B?eHhVVElqNy9raVVxbVd1eVNvd0hzZ3lRYzlEaTNDbUJBQyswOHNzMjNKT05V?=
 =?utf-8?B?QU1SZG1Ic2xxSHRKM1k1aW1WSTFmbThSY2IxOElHMTFqNDhKZHhRUWZYT1JN?=
 =?utf-8?B?cjlqdTQ1M0FGSTJFb2xRTS9lSjZwTFRJM0hWUXVSaXppR1dEZCttYkZ6VHJC?=
 =?utf-8?B?SGRRRmVlcGIwZWdKOG1xbE93NWxvajNsekZSajBUUldjUDVxRlNtcXp5Wk5r?=
 =?utf-8?B?eGZSYUxFTzc3YXlYYXRFeVBhSjlQS09Od2ZaNy9GMjI1U3dDM2hoQVlYTUhX?=
 =?utf-8?B?SHBRWHZ6blkzY1hKdEk3WjFoWm13NFg2TDdScTd1ek9IQlBYb0JhTCt5WVZD?=
 =?utf-8?B?anFBZHVOaDMvOFR3aERBVUNFdVE2K0Vkd1BDYit4eWx0NnNsVHpRemdrNE9M?=
 =?utf-8?B?R0FLL0dqajhHU2lQTnp1MkNIajIvWUxTRWNMaDN2a2NyMWpwdG16Ym1BNW8y?=
 =?utf-8?B?S2JvRG5GMm02QWNUckJHMDRUM2dQS0FqS1hEV1RRVmZQcHdvTmFkOUNhb1ds?=
 =?utf-8?B?Zy9HbS9LdjZtL0RHMVlVS3p0QlpzVGVWWE1VV3hOVlNncVdLbHVHeHdKL1g5?=
 =?utf-8?B?OHZzTE9hZktYSmhIdDhBOFhtZWZnQmZ1VmlDaUtXdUV5UjRRYS9Tc0tPVnZ5?=
 =?utf-8?B?K0ExV093NytHU1JZbE9yMjN0WHgwMEd3MmZPY1IxeU5kRHdCUEs1UGUzWE5p?=
 =?utf-8?B?Z2s4ZGxvZ2JZUjhQQnk3cDRFSmcyVGtLcTBZaGtLb3JnRWdDWDF1dUI0THhs?=
 =?utf-8?B?bVQ1UlpVWk9UcU1lSkx5VXNLMXlYZ1J2YkE0TXdrdngrTE0rUEtvVTI4Kys5?=
 =?utf-8?B?dnloU2dBU2ZVTmpiOVYzRmpzUXZYMmxlSUM0WEpnaDJSRGpKZElGdz09?=
X-Exchange-RoutingPolicyChecked: B6x+8PY9IFbl+DV0XwEegMlBOmzPWmontlxJP+duobndP1MuNhymyZwuUxspt8yuEVkVrPlvxkBbon8/m+aEHXxgaqImVM+sIJ/KuzmwULzbk4blT+bUDmWS08eS3zf4ISMfAeGMuTWQ2PxHX6vHYYIhS3ZDDQlP3wh+kFYhQ+0gOCS96wqsKW+pxpD66KCgUZYw0rCQexl8zB8aVO36WcMeCOHrfTbx7BFKJCYYn5YFHvnuspGhBwvd+4DRmeRCiJYUMRBbcyl9ZVECQhDQj5aLpaWQJxkljGsJ5uV2vgrL4oB+CPKLCZq0SDVVRqC2+TV4IuRYSujRdKPLkKJT8Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: e02d2651-0a2f-4380-c1e9-08df1a2d4852
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 11:16:30.2975 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /PqojeyWS2t310FBcomC52Eo/l9Jdvm49leSvfgqFMdVEfNJ8FzBDzj279l0Lney29OIBDXYagsN32aj6oyPBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7758
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


On 10-09-2026 23:57, Karthik Poosa wrote:
> This series adds CRI-specific temperature sensor handling to the Xe
> hwmon implementation.
>
> CRI platforms may report unavailable temperature sensors and support
> a variable number of VRAM temperature channels depending on platform
> configuration. This series adds the required sensor presence checks and
> uses platform-reported thermal configuration data to expose only valid
> temperature-related hwmon attributes.
>
> The series also corrects the telemetry group selection used for memory
> controller temperature reporting.
>
> v2:
>   - Address review comments from Sashiko, Badal and Raag.
>   - Enable IEEE 754 temperature decoding for MMIO temperature registers.
>    - Split sensor validity check into mailbox vs MMIO handling; add
>      is_temp_available() / is_temp_is_visible().
>   - Temporarily disable memory controller and PCIe temperatures on CRI.
>
> v3:
>    - Detect unavailable temperature sensors: rephrase a debug log.
>    - Use VRAM temperature sensor count from thermal config on CRI: address
>      review comments from sashiko-bot@kernel.org and Rodrigo.
>    - Decode CRI temperature registers as IEEE-754: reject temperatures that
>      overflow long on 32-bit systems.
>
> Karthik Poosa (5):
>    drm/xe/hwmon: Detect unavailable temperature sensors
>    drm/xe/hwmon: Use VRAM temperature sensor count from thermal config on
>      CRI
>    drm/xe/hwmon: Fix memory controller thermal data handling
>    drm/xe/hwmon: Decode CRI temperature registers as IEEE-754
>    drm/xe/hwmon: Disable memory controller and PCIe temperatures on CRI
>
>   drivers/gpu/drm/xe/xe_device_types.h |   4 +
>   drivers/gpu/drm/xe/xe_hwmon.c        | 322 ++++++++++++++++++++++-----
>   drivers/gpu/drm/xe/xe_pci.c          |   2 +
>   drivers/gpu/drm/xe/xe_pci_types.h    |   1 +
>   drivers/gpu/drm/xe/xe_pcode_api.h    |   1 +
>   5 files changed, 273 insertions(+), 57 deletions(-)

Next version of this patch series is at 
https://patchwork.freedesktop.org/series/174898/#rev2

