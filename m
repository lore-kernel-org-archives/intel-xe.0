Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DA09CD8C8E
	for <intel-xe@archiver.kernel.org>; Sat,  6 Jun 2026 11:18:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5817D10E21C;
	Sat,  6 Jun 2026 11:18:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dkW5bbiY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F31010E21C
 for <intel-xe@lists.freedesktop.org>; Sat,  6 Jun 2026 11:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780744721; x=1812280721;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=k15GDaGF/NtUuH5QEEXigQjHm0KnO0Pb6smJ1YL67Rw=;
 b=dkW5bbiY+5n9uy0Wz5eQQwVFTPNFBHOv8g0vDlwb6ejkFTJ0dxPDwTBc
 4/+kYUvUlbUJIkw2f8ted0fl5aPsNfeY70jYJhfmdZUG0tDdVJ/jceZT3
 7bYqtxv5jWbZhXE+KTLb/isRTbj9czOAkU8nzYyiKFMA6qFHv+9vII7od
 Ubc3oEi58eUiX4NJstt1HD1J2jr8V34pdnr6DH6b6HvQQ+/njW6X95+HS
 5jJjFjk1HL4+ZNb+vl6Nj32aMkWUQFKKknc3OxRqxFCGQLLGRZP2yW4E6
 KPDSm5/eBJzXYX/9O4JrBCMyTw+5DZ9gitYNqMwTPQstfV8oA/1tslobn w==;
X-CSE-ConnectionGUID: ncjqAKEHQWeEAgLwGQVvvg==
X-CSE-MsgGUID: /NW/HvlVSYy5kHfikLjU+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11808"; a="81466756"
X-IronPort-AV: E=Sophos;i="6.24,190,1774335600"; d="scan'208";a="81466756"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2026 04:18:41 -0700
X-CSE-ConnectionGUID: ADvgDSH+T+C34XPU6maSEA==
X-CSE-MsgGUID: au/KbqgpRbmjKUC608JZ3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,190,1774335600"; d="scan'208";a="248995658"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2026 04:18:41 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sat, 6 Jun 2026 04:18:40 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sat, 6 Jun 2026 04:18:40 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.30) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sat, 6 Jun 2026 04:18:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L9BZ3SdspHV9S9Ys/O36uaaLb4b+cMvNxovutwQQjHVr6MXcMEeVdTVPVbmOOhvbRJAZBAORsaYGUjAKZnOL/Tkms/G2PbZ/AFCHjszXdT5u7Y/ULcM1M/eR5rwD3qLVRIb+E8HhA9PGrsefEnjfDptUDNnUL9pRtZB9hVy38A4GA+nB6L9Z7+gAW0jMoc0RJu228k+jPHt6JT1TvLewOKryiEBYo9ruL6OnhnLj638gJL9WvafQ4hQ/xStIfVxjvEaJR0k3RHhyC8isqaVsFD49SToFOJZ/y6VVam/VT85t7HVKydI0wqdRYveIhrnqk9eZnwRwjrV+NCWLjbeM+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KpRuw8H2zjsRIwuoIMijIg2LnnXJkdIVTDAV2/rYQwQ=;
 b=EAIqxfi7mhSVmBtYTkF8A1xB7OAuRIdRUxwprmuahp8nu9EtQMjoxIWMpIvXPzVK8XXLF9cfwksLOVTzx8jlEkepD9nrr875ho0XgusopYQ8K2zCjQCrdq4iLVWA3Nc7DJoQGp7f3dO/p1+b2oF4hdmPc5E8dujzV2XV62RjvO8te1TrXCH1Ro+tr/6zsF0egRATuMXmI3P/XeoT0yJAsAXusqN/OOdbzMtbsI8lz7un3zMmCR5ETc6l/YatV7lHjA92C4MLLKwgqoftpy8y9/IKBxaY7nX//3ITfdWQVoLa8yRWt9fNkbArrAVq1Wn3M5RyZCF8Dodx18GKTXt70g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.11; Sat, 6 Jun 2026
 11:18:35 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0092.010; Sat, 6 Jun 2026
 11:18:34 +0000
Message-ID: <d0861102-2bd2-4010-90c3-fee01fe0f142@intel.com>
Date: Sat, 6 Jun 2026 13:18:30 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/12] drm/xe: Remove memirq status and source checks for
 engine interrupts
To: Stuart Summers <stuart.summers@intel.com>
CC: <ilia.levi@intel.com>, <x.wang@intel.com>, <rodrigo.vivi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <alan.previn.teres.alexis@intel.com>
References: <20260605232108.674580-14-stuart.summers@intel.com>
 <20260605232108.674580-21-stuart.summers@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260605232108.674580-21-stuart.summers@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA3PEPF0000051B.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::676) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SA1PR11MB6991:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b013785-5778-4ffa-580b-08dec3bd58d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|22082099003|18002099003|6133799003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info: Cp79YIqLuSLV9vqHeqMZMibmYjvkTksWlkgfaLG5uS4sNRQ3fa5kasYsqIL/aCcl16tR4bgG8fBlVi9S18Be8e/wPkKnejXRyMP0MQvDuypSY4G5Qf7mBmzGOE9se0hRHIcgUMthvDAV1cmpGcg+6GE/kxZwiUfIwTbQYJdlLJc9xaObWsBzlSyOYhRUxRv2y4tC8nB5puy+qXOdJANNl/3J81oUQWtwwOAuh1BLF8RtdUN/EIJfqJkg8lOjeLdwIMCINh2N+xriFzZYWP1DV3NCgceVnSYvcqsjBJ+/NeVRKQZi0CDMFj+Qo2RZwvFSdemIBcahK6fkjurQuNajNTjIYkE5TUfzr/emmz2KsjdO8Y8aHW950gpfebpAbmGEdDA6I+pky/3p+4rLm3wz2Y44cleYzjN8yzUIXWLsbhhSTWM2MlNK2I4N/e0kbJJ6Q4sF9lsH/zb3dgeys4DTQRAEXC/b3d95flAKUVYQ1CGNWzxgd6bE6PmSf9zjm6dJXY8mOSd5nZD9k33TEGsoERM4v/SdorhU7SaVnCRYdL5EPb62xehk/rEPcVtrKH05+yO1V15EnvRFPj5wW8RyLBnq2hoIkT9YcYhO7lcJxZO3vuJBi/nABazmCNZ8CaBjtOTrkcZTBIYoId63Eo3sqcmMggBzHyn/GbYLMD3z2+dgLHyFZp85NsvcS7KqhaRR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(18002099003)(6133799003)(11063799006)(56012099006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ym9RYzA1QXN0SGYxQnN3SHptamZlQ3BISE5ZWWFiS2U4SXZHTFVMckZpcVdw?=
 =?utf-8?B?Wk83ZG1NSG0yTGZZYVFpMVN0aUUvN1R4cG9XK1lXdG0zVkRyMGZSc1pJN0U4?=
 =?utf-8?B?RnlxbEJOcTNFb3IxWHJIVi84S1V0Z3VLdFkyVVBnMjV5bFd1V3huZVpUMDky?=
 =?utf-8?B?alVaZVRoakNMRlMrTzZEakdFMkJmOU1hT09oVi9NNlR3ZFBUQzd5dGdDazVN?=
 =?utf-8?B?dUwrMnZmZ1BUeU9aN3pHQ3gwWHJNSXh1UHJpdHI0STBWMkt1MndiVlFyR3Ft?=
 =?utf-8?B?R3QzMjVqNmJrcGZEUnRkaXAwSVM1elF2bDlCZmZURHRkMWpGWExKNzZqU0h1?=
 =?utf-8?B?NytnWVNwWStnQTE3WE5id084N21XR0oxQWdaeHFQRzVKMDUvYVNsYTFscHlV?=
 =?utf-8?B?RWsyRGViWmtUTitiSTV1dkdtMm5MV1k1WHBBaktaRUVMNzZkem94SndmNUZH?=
 =?utf-8?B?OUVVQ3RQUmZ4MGxPcmFIRHpURUtodU81VSs4YURUc01iSlZNT25odzY2aTlw?=
 =?utf-8?B?SUNvYzhiVnZHTnJOeHFmSVJ3VHFDZWIzKzBxcjJ6cHRSQ1R5Tlp5TnhJaUNs?=
 =?utf-8?B?Y0twZUFqMGhhbUZORmNjSlJSY1RMMFJLS0lCQW1qdFV1RVoyQTduakxPVm8y?=
 =?utf-8?B?Mld3NWVFZG03eW1ZQktHd1IzNlZ1NGNuNmRhdEdtTVRhTU9wTmtXTEh1ZWFQ?=
 =?utf-8?B?Wjd4cEk4SEQwQ0RpZVhYSVdBL3IzN0NMcHl6c1FXRVZwaTVnNGxaZkVPZUpU?=
 =?utf-8?B?KzNuRFVXQWZTL2txVGJhUHFyNjBneU5vR2ZPaWIxRU1QNkVWczg1OUZ0TkZv?=
 =?utf-8?B?eXR6NXpVa056ZUlncTJEZDBIWWsxSnU3azQ3VGd5d3VJZjVISm91M1pIaUl0?=
 =?utf-8?B?U2lScUIyWVFYc3kwSVNqcy9Vejk0MVdVK0JRWEE2NWd2c20rQ0RkL3pOenBn?=
 =?utf-8?B?QWVoR0NyRXBlS1lKS2I1T0JUN2xydWNiQXRBV1h0azVFTVFad1crVFY2VUZj?=
 =?utf-8?B?LzJZUnlEd2VSeGJ5YnJZRmxVM0lLc1JHTHZ6aG9xa0lwbFFZRGpjTGh5ekhX?=
 =?utf-8?B?UFBEVkh0QjB5c29kT1VrQUhjMkpDTmE0NnhFYkRhbEkwUzF5ZzlHUFF6SDd1?=
 =?utf-8?B?RmlDMmhwdU5QdFlUUGVjUGxtL1FoZUk0ZDV3WUdSVkFJOGRKNWJ4NGh6UlJv?=
 =?utf-8?B?UzkrTklvaW1JaUxhcEhPTUc3SzQvVENvZUQ1N2dWRUZVY2kzajcrNmNWMkRT?=
 =?utf-8?B?dVRtMzVFcEtIaktCaS8yNWQyUXZ0by9CZzhzcXFzN1RZYnFacmVZbTl4dnNh?=
 =?utf-8?B?TlAvUkNyd3hzaTR0MmkwMHZ0UGpzZ1MvL211NXFKVTBzbloyTzRtVW4zYkM2?=
 =?utf-8?B?bzVYTitTTW8xYlcyMU9oKy9aSUVCemF6QWczN2tua1BMTEhrVFJVTkEwQkNr?=
 =?utf-8?B?SmhZY2pNeW9QWWgyWXhpY1NQZmpjcGR3ekJyQmlsRXZwSVVPaXk1UllXNlQ2?=
 =?utf-8?B?WHVvWk9lUE9pMldzazB4QmIyLzFQOHczQlNhVTdiY2FTOTJQa1EwZ0Q4VGV1?=
 =?utf-8?B?Ym16akJ5MjVsNk9KU0VxUDZjUU5pZFRyTXNpSk5OdVBqN3oxVUtpeXdLSGVD?=
 =?utf-8?B?S29FeWdTWXlaaTdrVlo4SmRTeFZnZ0FjNW1GSVBxdndvVnNXQ1M5U0ZwbzY2?=
 =?utf-8?B?ZHJJQ05UUk1OVGsxZ2NNem5iM2tYRzRkaVRvKzdMeXVRL1lrc25tdGZlQ3Zi?=
 =?utf-8?B?anh5NVVscS9IdEZaZEU4aytCQTV0K1QyanZjZnRSZytmQVRXWG1YYlN1OVZL?=
 =?utf-8?B?R20zTWY5V1U2cmdvTFp1cVFZZlBRUlVNbDFZT1Jzd05yYkdIN3ZBNU1UU0dH?=
 =?utf-8?B?NHJva3ppellxdWhDVFBrUlZua2Q0QkNLNE96SGxpY09ZNVpCakJzN1RiMW1G?=
 =?utf-8?B?d2ptdGgxY1Z3ZFZ6allMVUZMbkdxL2FZRGZpaU1GNzJzZittczlPdDNLWHpL?=
 =?utf-8?B?OTBNQW9JYUk0YTZONzJBUFZQcE4zVThzQUp0WCtwR2FhTktZQWVBZGZPcjh6?=
 =?utf-8?B?TjFVcEZJeEZDTEJ1ZHBvM0hiNjFGNzF5STZjSlgxR1c1bmhrYTl2UGo0dzAr?=
 =?utf-8?B?aStqckM2R0lVY0RLckNsTmlINEpzakRVc3kzZXpCa2V4NENsSUtBT0YwYkcy?=
 =?utf-8?B?UFVpeEpLZldaZW10dUpYM0k4UzI1MWNlbXV6d0lpcjdTN3VBOEVTdWZDTDJG?=
 =?utf-8?B?QkxhcmlDYVBJR01qSDlHbk9jTWU1M2JsQWM0TUN6K25PT1BoNXJoeUpocWJy?=
 =?utf-8?B?UlFXM1FiM3R2cXJyQ24wTmVOV2lXRjJhck5mMGJ1QmVQYTB2akpYU0d0eGpX?=
 =?utf-8?Q?nLiL3BwnWBK/JrNw=3D?=
X-Exchange-RoutingPolicyChecked: e0v9X1qiY8NHiGtJryKe/6lyK0pEzLdADfiJuQvOM4/4dw6j2pb0j4PWctqTrUdgAjQjLnrMT1gG/dNvmvF5BFT1c1FyLbkmVD89ZabRJM64ksg+BpXxz/+qtimYELy7r6mhZhLzKqeX5m95hkRU75gl4kXwPVf4LWHnyBeUx7vzkW1nrjgCCSyprqTgHvrIajsbX0/MhkbSinY40GdeepxudzrsXUId7XRHp9aFhYT49oP040XGyhrk9iEicwW7rKJEEO+4yGYkc+TlWq0BMxckCayKS4XFimV8KAINGAZ0uoHuRr5xEMV8BuxNweoB4l7Jckg3ejfOJfnd+jcXUg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b013785-5778-4ffa-580b-08dec3bd58d2
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2026 11:18:34.1062 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4ooiSKHCJg6FG+UMxB6q1I3weOEA9VBdylxLvn1hhQ2VbMwXgcEG+d3CSo0/oGZZ1rMZd1q5Wdo/kMRg++5JgQrcYhriiKU3wMZJaeN/3UI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6991
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



On 6/6/2026 1:21 AM, Stuart Summers wrote:
> For engine-specific, memory-based interrupts, hardware will not fill in
> the source and status offsets, assuming that software will utilize the
> vector ID to determine the destination for a particular interrupt.
> 
> GuC and VF based interrupts are still handled the same - explicitly
> checking these offsets.
> 
> Bspec: 62316
> 

no empty lines here
> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> Assisted-by: Copilot:claude-sonnet-4.6
> ---
>  drivers/gpu/drm/xe/xe_memirq.c | 26 ++++++++------------------
>  1 file changed, 8 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
> index 9dfe965cb46e..208f44436c66 100644
> --- a/drivers/gpu/drm/xe/xe_memirq.c
> +++ b/drivers/gpu/drm/xe/xe_memirq.c
> @@ -447,18 +447,18 @@ static void memirq_assume_received(struct xe_memirq *memirq, const char *source,
>  	memirq_debug(memirq, "ASSUME %s %s(%u)\n", source, status, offset);
>  }
>  
> -static void memirq_dispatch_engine(struct xe_memirq *memirq, struct iosys_map *status,
> +static void memirq_dispatch_engine(struct xe_memirq *memirq,
>  				   struct xe_hw_engine *hwe)
>  {
> -	memirq_debug(memirq, "STATUS %s %*ph\n", hwe->name, 16, status->vaddr);
> +	memirq_debug(memirq, "dispatching engine %s\n", hwe->name);
>  
>  	/*
> -	 * The programming note says to assume that GT_MI_USER_INTERRUPT is always
> -	 * set. Check and clear related status byte just for a debug.
> +	 * On MSI-X platforms hardware does not fill in the source and status
> +	 * fields for engine-based interrupts (only GuC and VF interrupts have
> +	 * a valid source/status). The dma-fence check for the fence completion
> +	 * is opportunistic, unconditionally pass MI_USER_INTERRUPT to issue
> +	 * that check.
>  	 */
> -	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG_MEMIRQ) &&
> -	    !memirq_received(memirq, status, ilog2(GT_MI_USER_INTERRUPT), hwe->name))
> -		memirq_assume_received(memirq, hwe->name, ilog2(GT_MI_USER_INTERRUPT), "USER");
>  	xe_hw_engine_handle_irq(hwe, GT_MI_USER_INTERRUPT);
>  }
>  
> @@ -499,17 +499,7 @@ static void memirq_dispatch_guc(struct xe_memirq *memirq, struct iosys_map *stat
>   */
>  void xe_memirq_hwe_handler(struct xe_memirq *memirq, struct xe_hw_engine *hwe)
>  {
> -	struct iosys_map source =
> -		IOSYS_MAP_INIT_OFFSET(&memirq->bo->vmap,
> -				      XE_MEMIRQ_SOURCE_OFFSET(hwe->irq_page));
> -
> -	if (memirq_received(memirq, &source, hwe->irq_offset, "SRC")) {
> -		struct iosys_map status =
> -			IOSYS_MAP_INIT_OFFSET(&memirq->bo->vmap,
> -					      XE_MEMIRQ_VECTOR_OFFSET(hwe->irq_page,
> -								      hwe->irq_offset));
> -		memirq_dispatch_engine(memirq, &status, hwe);
> -	}

maybe put the above new comment here (or update the kernel-doc) and call xe_hw_engine_handle_irq() directly?
then the !MSI-X || VF case will still have a status debug dump option available

> +	memirq_dispatch_engine(memirq, hwe);
>  }
>  
>  /**

