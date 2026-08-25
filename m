Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6329CC61DB4
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 10:06:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F47710E601;
	Tue, 25 Aug 2026 10:06:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EHJcBPx+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA6C210E182
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Aug 2026 10:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787652402; x=1819188402;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Twbq6HwsFIcMddft62YHRYgjSjeQ4IloljFPTwAsjJ4=;
 b=EHJcBPx+960W9xwZjkNRyIY+5pb85C2UHizaRhc+PLrgSacxSyop2kuq
 IsRQZx0hkQ9gd/ctn55mTivAlSx/nu6cnL8FFEqJb9MMoepDH1sXehMqs
 V5nZuzA14yO3nOX6rL7VzqMyjKoVoYoSfijUHW5XeIgwEWnWoB4BHtioC
 dpDZJS4OMc6yLnxZ2Qu219McwHvseyPpyUWTUutLLAAtrngQbjd/iKp9S
 NGxwvpqRmZzfeXyDzqXLON0lr5ltockABzkUQuA3M0N2gIA13eaC23y6F
 HzNVR11jdIPfrlvgbBjxAFNKsESOpXNT/f40d2pCDek0BVqNhIkm6wll8 A==;
X-CSE-ConnectionGUID: UOTnNfQqQKSlxZLXEBBiFQ==
X-CSE-MsgGUID: yw8UpPsbRi6ToGOP/WGJAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="88133243"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="88133243"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 03:06:42 -0700
X-CSE-ConnectionGUID: Ijf9vV3QTA2aQqYRzWT1OA==
X-CSE-MsgGUID: kKxeKTkWTuKmMmjZV6JQkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="265937702"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 03:06:41 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 25 Aug 2026 03:06:41 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 25 Aug 2026 03:06:40 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.24) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 25 Aug 2026 03:06:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aF1b4grhpaIs3pLKhYMUGZ6RHk3zpyTg6rfIfX8uCrw7F8K/crHiVpH/IeNaW8a/MXxSO42CBjuwASHMtpT/1oK0raab7PhzqUfLlPRW3pqeiSY4XZGCFX5tbB/5w+NRZN0jYawKD7an92FVi2+qJY2Wp3XLeS9QE+KXaNMWOYObhJmdTHSNUX6N/qKYYMOjfem1uVCS6E1DSjKikCox6P5ncPguyISLQfvz6eUX9YjDpLwHXv5iEAiHfZXncAGnys1J6/Daosi0OXBPznEFPFCmTzL4NS5Jo76i4t49kej1lduAS+KShA2RNoXg1lywkr0nsDaPrIQltAiP8FoEqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DK7x2ZQAuEeHsgDeWxnJsa2ujbfZ7nXH/0sinOwWf78=;
 b=VVAax+MidMW71ruWzMhJPnQNkHP9e7x+BYVWYW+JF/gds3YDflGTGfSA7F4EGIYMCeC6scwKEBF4XHVT86VgEx+fo2Ec4ABKdJzt+7fhRHkSh8fg0TPe3KTaACKKngm4oZcfMpR5pS2AJmBNfaoGxBHXTYTjGaDeOuaNHPYXVPByc9qr9lb5n2nUaoIZceqmTAHJNplQTvxJ/ulxU1BkW+wE1VxaEorx+dvCojvaS36Crp4kAXI82srbI402dXwxb1+wgMKeUQulM2eMZoju2QTWFCizA2YzLEHiluuCQ/DOKa/kM8wc7H5CHRjIPHJEum+1hM3QizMK7RSYJfZQ6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB6195.namprd11.prod.outlook.com (2603:10b6:208:3e9::8)
 by IA4PR11MB9417.namprd11.prod.outlook.com (2603:10b6:208:569::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.7; Tue, 25 Aug
 2026 10:06:38 +0000
Received: from IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391]) by IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391%3]) with mapi id 15.21.0360.005; Tue, 25 Aug 2026
 10:06:38 +0000
Message-ID: <a1c9ead7-b3f3-4bfd-9840-df36f3e85d99@intel.com>
Date: Tue, 25 Aug 2026 12:06:32 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 09/10] drm/xe/pci: Introduce PCIe Function Level Reset
To: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <rodrigo.vivi@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <riana.tauro@intel.com>,
 <michal.wajdeczko@intel.com>, <matthew.d.roper@intel.com>,
 <michal.winiarski@intel.com>, <matthew.auld@intel.com>, <dev@lankhorst.se>,
 <jani.nikula@intel.com>, <lukas@wunner.de>,
 <daniele.ceraolospurio@intel.com>, <badal.nilawar@intel.com>
References: <20260821112436.545405-1-raag.jadav@intel.com>
 <20260821112436.545405-10-raag.jadav@intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20260821112436.545405-10-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIXP296CA0006.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:2a9::13) To IA1PR11MB6195.namprd11.prod.outlook.com
 (2603:10b6:208:3e9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6195:EE_|IA4PR11MB9417:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e4da3c2-fb88-4a25-8e2e-08df02908d37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|22082099003|18002099003|5023799004|11063799006|56012099006|3023799007|6133799003|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info: 4V0tviKfoxxTiq4Tj6vCWb+QEn51B7zGh6cmt2GF5OeF+xxeMIY5v/edWL5IUelyWYtFY3wfPZ8XnOsycEELbwjnhL2fw/45pc9UloVC4F3lSF9rU1VbATXN7EhoBoaCLeAarLVLuMJOdTDJhWzwcIfPR6mBrErah29oSHKnEcLFE8ZzNo6/w1E3h8bCF+qpknU8M+FwDopEwQEU1cUUMDBlhNC/kFtffwSKaR9+lv3Cpud2XYNvls8YeHJ6Xa5Xf9bOWhxFPTiUlFdV73c6l2+eoyn1bAuOsoOZddAyrRNCI8kitWL4gBWrztjl/Cj65QbVwcoCkCtXhCc86Mt0okhTL4vIERgtgVO/hA/ovAur3sRFpajkesI9dug9FcK376Uf57aHaieLToRVcq1ZC/NtsN6jYhsM6v4LkTz3eHpiwPs7Rj4JrnSAd1ioL0xq5DdVU8vzekOaRX81MY9wlnHSD3PocMhit8EKsbZfM64qvXd5aOpG7YWDTRInmiNme9t/XsHbHZU5geHfx6cfPX3vTtRXUB9k+O2zrLjjp+iACm6glLhcgF9EjZXiMNAqoY7VfRmLmzKeoMsZsMRQJYmjFNyCekFJH4U7m2S3doXi64Xt5qDZYvZteQMOy7RoeHHQXKFWl9dILu6ksqOBpuB1343V0aIl5Rr1gcmqxkk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6195.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(22082099003)(18002099003)(5023799004)(11063799006)(56012099006)(3023799007)(6133799003)(4143699003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c2xVVEpJa1VZa2V3WUR6dGhMQTUzWXhkK3VXRWc4Nm5MQnVpanVVN29tMHAv?=
 =?utf-8?B?U2F4S2N1Y0o1bjd5Z2xDN1ZraStBQnpUTTNaNkpvT1NvUjE1Smt3MlYxcldF?=
 =?utf-8?B?NzlzcFQxMnlvSnRncE1sWURTMFBBOWRZTjNrOFVZT21seUV5OVNWNXBaa0I0?=
 =?utf-8?B?bHNnckgxQTAwTi9xTzRTVmtiNzcweVdaelRBNEdGNGVUUWRvaEwvSW1keUZD?=
 =?utf-8?B?MGp4WnJOU283cU10cjhULzNBZWVCUjNJNmxpRnp0Z3F5c1NjSkhrZXdNNVoz?=
 =?utf-8?B?VUJuYnY4dmlwaC9PUjhLaXpFdmIrWjZxWko2a3N1UjdTbXFPS0RJNGVCY3Fl?=
 =?utf-8?B?VWtkSzVnSS8yVDN3SEVydjRsV2g0SFZYSCtkdlRMMW1nUCtNdVUwTXc2L0s1?=
 =?utf-8?B?cWFzd1hjSGljQldBdlhGK0dEKzdyMG96VW1ZVDV0dFNVOTI3THN1NTlFb3BO?=
 =?utf-8?B?SGozczZ0Tk1IUDN4SHRKamZEc2QwRkxmRmFnWkxlTzVUL0x5NjEwaHVWZzBv?=
 =?utf-8?B?TTY1WU00aHAwZlgwV0pqQytjRkI1WXk3S3hyZCtBSUxXSHk4ZTNJVWxGT3Ry?=
 =?utf-8?B?U1Uvd2hoZkIwaExlZ0FsU05nTTFuMlhoVzl2d1NsWXBFN08zN1R6VHUzV2JP?=
 =?utf-8?B?UEsrOGlvZG81M1QxVDgzZTROZTVCZzhuY0RGM0Z3RFhCV1VaUGdENmdCWkRE?=
 =?utf-8?B?NmV2NXdBN0lLODZUWVR5NlE3azZEYi9nU2hmYWkrOTJtUmxLNTlJKzV5dnNz?=
 =?utf-8?B?Yi91am1RS0tPQXdDczVlbUdETTRFNGhDNzRnc2g0aDFjckpCMzIyMFZDNmVD?=
 =?utf-8?B?NGtzbVJZR3FJcHJLejRjQWdlR0dsbGhHM1c5UERNa25zRmxEdGREakJRRkNk?=
 =?utf-8?B?RUR2WGFEMHoyODd5WlQyZjZreW93d0NENEd0TC9PcHlZVEROVldjelZWU1lh?=
 =?utf-8?B?QkVabGtHNkpQWFFBWk9BQW5qT1pQVVVyd0xJK045YXhvUTMvTGlkd0JuQzZB?=
 =?utf-8?B?dHIwNW81MzlsTUxlekJxZXZGdGE2RkRLcE5TT0N4VFRGOHhFZ2pVeDJwTHdX?=
 =?utf-8?B?KzREbSs3TXJmZTBzNVYvWnZwcTFTR2hFYndJVlZTaFZwSVFGOHVlaFl5SFNT?=
 =?utf-8?B?ekpWQVlrdnlVYmhYaFR0MnFpNFFxb3p6NlNneWpKU1kxclFiODFBTnpoZjNs?=
 =?utf-8?B?MXZiMVhWYWZSTm5SbkdkU2JuTmJ6V3VFb2laMWQyQ3RTcnIvTVcxV2YwWDBE?=
 =?utf-8?B?eFRmV3N6K3hxZExGeEphdkFUWklRY0FOUUlBYnFod0lEMDE3aUhnMkJUVW9M?=
 =?utf-8?B?UWRhbE14MEQrL1NnQ0JNQ3pzakFZdUVUMjA2QWdiUGFXZkdjN1pXYTRQZEtv?=
 =?utf-8?B?KzY3dWFuNWdSWEdwR0d6aHlOelgxdzVDdE85aE9LMzJVbjQ5UXNQajVTMW9G?=
 =?utf-8?B?R0tWV3VmM2ZmWGFDSTRZTlRUYitaNXc4QTBLZVNLa29CcXNxUHhKUXVZL0RB?=
 =?utf-8?B?NHRLVkRwdjRmb1BKOXA1T1hPSGZ4WWMySVRCd2VjSUNUa2Vab0dJeDhIT2I2?=
 =?utf-8?B?aUhKeUF2RTZQdUV1bWpnRHM2ZnVXUzVCdzlWRXd0MWFXcnZGSVo5TmxHQTlm?=
 =?utf-8?B?clV4THBtMXFybEUxVHd1dXI4bnh1ekV0cmJnUVdTZXZIS1FTRW5FcUdtdW5h?=
 =?utf-8?B?d2JyVmlGWWlsZ0ZsZzQ4ZnN2T2JrWEN4aCtSREs3MUJkM3krVnJHdXgzbDZY?=
 =?utf-8?B?VzB1TzZWcnM4WnFhdGRjQVVKbTNHK2hxUUlBTnFiR1VVTnpjNHNiTmYrS1Fw?=
 =?utf-8?B?eGswRXFOWGNDTDFuVkk3R1B4cHNCR2ZwWEdTZXJoVDIrUEtvLzdWM3FiL3Z6?=
 =?utf-8?B?VjZkSUtFWGxGZUd3MjR5c1JSSGc3aU9lbFJGOGc1U0RIY3dzSk14NmdncnVo?=
 =?utf-8?B?eDVkaGdDaWs4MXE3YzB1WEtIK2ErT1F2cG1xbHBGYXlEcGZiNE5id0w5NDRq?=
 =?utf-8?B?N2p2d21qU2FmcXFhTHpKTXB5d1ZGbXpCK2hHb200ZERoMlB5cXZHTWIyd0w4?=
 =?utf-8?B?UEZFaUpIeFFkZDdIYUF4SktVQVhDcFpVVkdsbXllU0Uxd2IrU09BNkw3Nkl4?=
 =?utf-8?B?UkovRFN1dXA5QTVGajJybjlMaVR1S1pvK1cwa09HOXF3Vm9LclZOYlYvT211?=
 =?utf-8?B?SlVobXR0ekpOeHZTUDF4U0h5UWlPbFhRQ1lSTENCWm1LU2wyS0t6Mk1KdE5R?=
 =?utf-8?B?RU1TaWhqUUVVR0tJcFdKOTBad29hNUszWFdKYU9GbjcwYWRkRHNQUUdJeDll?=
 =?utf-8?B?ZzVOdFFyZkp5T2lLckdqZk5qeDRyeVcrM1hEYUphd25IQjk0MEdBQT09?=
X-Exchange-RoutingPolicyChecked: vdsCQ0QKTH5UDYAzOufbuI9DR5JZRZH+3vYbUz7pzFaNVklQETZptTAi9oFBb2pDgjyMGkZ3W+LSUmhmFRCKAbnXy04sv9JY0Zf1TfHdW4WERc3yWmRlfl3auvqvA8YCvyTtby7r8+7rrZHUEGeW1Ty6W9McPkBNGA8xs3NeXGs8xgFjgXhhcH6c2SxbCGQx80gDZIX2OddNag9+u7JrirjAL1oevIXx/Kh/ScPKV0zQAPgDCjnDS5Calfxg1FtcWuTU/r7BAZzvQO8mAFSvIZW7xJ4kWlyGOUj8BMy+pnzGX3iT4rQZgVjddOpixoT7J4sggDG14emgN77mpbO5gQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e4da3c2-fb88-4a25-8e2e-08df02908d37
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6195.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 10:06:37.9408 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L9B7ffQ3V6M2YBkohrEU7xv19kQTem3GNnqzvlkirL95/vXKwE7CP3F2XuDEEM6Zsx2i0w/JKdm5kGIN6YehtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9417
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


On 8/21/2026 13:23, Raag Jadav wrote:
> With bare minimum pieces in place, we can finally introduce PCIe Function
> Level Reset (FLR) support which re-initializes hardware state without the
> need for reloading the driver from userspace. All VRAM contents are lost
> along with hardware state and driver takes care of recreating the required
> kernel bos as part of re-initialization, but user still needs to recreate
> user bos and reload context after PCIe FLR.
>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> Tested-by: Lukasz Laguna <lukasz.laguna@intel.com>
> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   v2: Spell out Function Level Reset (Jani)
>   v5: Prevent PM ref leak for wedged device (Matthew Brost)
>   v6: Add PCIe FLR documentation (Daniele)
>   v7: Refine PCIe FLR documentation (Daniele)
>       Introduce xe_pci_reset_skip() helper (Lukasz)
>   v9: Add 'Xe' prefix to document title (Rodrigo)
> v10: Update documentation to include PCI Error Handling (Lukasz)
>       Maintain wedged reference on FLR failure (Lukasz)
> ---
>   drivers/gpu/drm/xe/xe_device_types.h |   3 +
>   drivers/gpu/drm/xe/xe_pci_error.c    | 128 +++++++++++++++++++++++++++
>   2 files changed, 131 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 7be3f15bf7a0..8cbb5b747710 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -518,6 +518,9 @@ struct xe_device {
>   	/** @pxp: Encapsulate Protected Xe Path support */
>   	struct xe_pxp *pxp;
>   
> +	/** @flr_prepared: Prepared for function-reset */
> +	bool flr_prepared;
> +
>   	/** @needs_flr_on_fini: requests function-reset on fini */
>   	bool needs_flr_on_fini;
>   
> diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
> index 48466d726eae..81c4e55fae8f 100644
> --- a/drivers/gpu/drm/xe/xe_pci_error.c
> +++ b/drivers/gpu/drm/xe/xe_pci_error.c
> @@ -12,8 +12,55 @@
>   #include "xe_pm.h"
>   #include "xe_printk.h"
>   #include "xe_ras.h"
> +#include "xe_sriov_pf_helpers.h"
>   #include "xe_survivability_mode.h"
>   
> +/**
> + * DOC: Xe PCI Error Handling
> + *
> + * Xe driver registers PCI callbacks which are called by PCI core in case of
> + * bus errors or resets.
> + *
> + * Currently both Function Level Reset (FLR) and bus error handling callbacks are
> + * supported. Both wipe the VRAM and resets the state of all the hardware units.
> + * Therefore, the contents of all exec queues and BOs in VRAM are lost, and the
> + * hardware needs a full re-initialization. The way Xe driver handles it, is
> + * pretty much similar to system suspend/resume flow with a few notable exceptions.
> + *
> + * Prepare phase:
> + *
> + * - Temporarily wedge the device to prevent userspace access
> + * - Kill exec queues which signals all fences and frees in-flight jobs
> + * - Stop the scheduler and all submissions to GuC
> + * - The fact that FLR is needed is because hardware could be in corrupted state
> + *   and access unreliable, so skip memory eviction due to untrustworthy VRAM
> + *   contents
> + * - Remove all memory mappings since VRAM contents will be lost
> + *
> + * Re-initialization phase:
> + *
> + * - Recreate kernel BOs due to skipped memory eviction in prepare phase
> + * - Restore kernel queues which were killed in prepare phase
> + * - Reload all uC firmwares
> + * - Bring up all hardware units
> + * - Unwedge the device to allow userspace access
> + *
> + * Since VRAM contents are lost, the user is expected to recreate user memory
> + * and reload context.
> + *
> + * TODO: Reuse FLR callbacks for bus error handling.
> + *
> + * Current implementation is only limited to re-initializing GT. This needs to
> + * be extended for a lot of components listed below.
> + *
> + * - Proper re-initialization of GSC and PXP for integrated platforms
> + * - SR-IOV cases which need PF and VF synchronization
> + * - Re-initialization of all child devices registered by Xe
> + * - Prepare existing xe_device_wedged() users for temporary wedging
> + * - MM corner cases
> + * - Display
> + */
> +
>   static void prepare_device_for_reset(struct pci_dev *pdev)
>   {
>   	struct xe_device *xe = pdev_to_xe_device(pdev);
> @@ -142,9 +189,90 @@ static void xe_pci_error_resume(struct pci_dev *pdev)
>   	xe_device_wedged_put(xe);
>   }
>   
> +static inline bool xe_pci_reset_skip(struct xe_device *xe)
> +{
> +	return !IS_DGFX(xe) || IS_SRIOV_VF(xe) || xe_sriov_pf_num_vfs(xe) || xe->info.probe_display;
> +}
> +
> +static void xe_pci_reset_prepare(struct pci_dev *pdev)
> +{
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +	int err;
> +
> +	err = xe_pci_reset_skip(xe);
> +	if (err) {
> +		xe_err(xe, "PCIe FLR not supported\n");
> +		goto wedge;

Looks like we always take the reference, so can't we do it at the top of 
this function and only return here?

Lukasz

> +	}
> +
> +	err = xe_device_wedged(xe);
> +	if (err)
> +		xe_err(xe, "PCIe FLR failed, device in unexpected state\n");
> +
> +wedge:
> +	/* Wedge the device to prevent userspace access but don't send the event yet */
> +	xe_device_wedged_get(xe);
> +	if (err)
> +		return;
> +
> +	/*
> +	 * The hardware could be in corrupted state and access unreliable, but we try to
> +	 * update data structures and cleanup any pending work to avoid side effects during
> +	 * PCIe FLR. This will be similar to system suspend flow but without eviction.
> +	 */
> +	err = xe_device_suspend(xe, true);
> +	if (err) {
> +		xe_err(xe, "Failed to prepare for PCIe FLR\n");
> +		return;
> +	}
> +
> +	xe->flr_prepared = true;
> +	xe_info(xe, "Prepared for PCIe FLR\n");
> +}
> +
> +static void xe_pci_reset_done(struct pci_dev *pdev)
> +{
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +	int err;
> +
> +	err = xe_pci_reset_skip(xe);
> +	if (err)
> +		goto out;
> +
> +	if (!xe->flr_prepared)
> +		goto out;
> +
> +	/* Unprepare early in case we fail */
> +	xe->flr_prepared = false;
> +
> +	/*
> +	 * We already have the data structures intact, so try to re-initialize the device.
> +	 * This will be similar to system resume flow, except we'll also need to recreate
> +	 * kernel bos and restore kernel queues.
> +	 */
> +	err = xe_device_resume(xe, true);
> +	if (err) {
> +		xe_err(xe, "Re-initialization failed\n");
> +		goto out;
> +	}
> +
> +	/* Unwedge to allow userspace access */
> +	xe_device_wedged_put(xe);
> +	xe_info(xe, "Re-initialization success\n");
> +
> +	return;
> +out:
> +	/* Most likely the device is unusable and there's nothing we can do about it */
> +	xe_device_declare_wedged(xe);
> +	/* Drop local reference */
> +	xe_device_wedged_put(xe);
> +}
> +
>   const struct pci_error_handlers xe_pci_error_handlers = {
>   	.error_detected	= xe_pci_error_detected,
>   	.mmio_enabled	= xe_pci_error_mmio_enabled,
>   	.slot_reset	= xe_pci_error_slot_reset,
>   	.resume		= xe_pci_error_resume,
> +	.reset_prepare	= xe_pci_reset_prepare,
> +	.reset_done	= xe_pci_reset_done,
>   };
