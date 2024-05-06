Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CCE5C4345F
	for <intel-xe@archiver.kernel.org>; Mon,  6 May 2024 05:06:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE7EF112B4F;
	Mon,  6 May 2024 05:06:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="byvvmepW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97A41112B4F
 for <intel-xe@lists.freedesktop.org>; Mon,  6 May 2024 05:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714972000; x=1746508000;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=sQJaLr1Lf+wX7Z7+BaTJ/EY0oa1y3CPiPyvKcfliSr8=;
 b=byvvmepWObv2wvjMKVeL+9Caid0+sEMqJ4HGSEFyT73mWjOfA72ZaQfa
 /3iaDRkd1AILKMA1QuMVb3e/rJXj0AzB3eFCWDR4KZaiq+NZDMKKSWKe4
 2Hu6rGyhdUZwzZ/5qpjNqnRXfm8w06iswD9c1kKlGSxoqKxnAUiHoYwNW
 w8l68qXCNOZ02e1I1+kwpqMpUwrwIGuPB6FtaHsBLPitx7A6CL63jeLsS
 MUHiNlT4Dy7Ofmj30g09xojCEoW4gPYi30qm69iSQVnoHNR8r+am3Qi6I
 wXkHVugqdtSNwDSio02OtpBGUw05m9Cej3/Z15E+Gw0DNeeU+PnIX3Hgv Q==;
X-CSE-ConnectionGUID: +OIhGFyKRbm1NiR1QA2+8g==
X-CSE-MsgGUID: 4xX3I0MSSo+r+fYYlm3suA==
X-IronPort-AV: E=McAfee;i="6600,9927,11064"; a="14517198"
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; d="scan'208";a="14517198"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2024 22:06:40 -0700
X-CSE-ConnectionGUID: R1Am60G/TGCSD3+24jyhwA==
X-CSE-MsgGUID: XXyBtQQcT9Cow6YvGaPdVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; d="scan'208";a="59241940"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 May 2024 22:06:39 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 5 May 2024 22:06:39 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 5 May 2024 22:06:39 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 5 May 2024 22:06:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OPDPJRXmfC8RDFjMbcG5ALPDScdLCPUInCo4g3t8o6/oxY0Ia4OcZErhIvB9wke3wFAqmEbchmOyf/4KLG2NkQqR4Yq4jQDMTHR0P2lTor7c8tfFIOwtn69FLSUwd7ijHPTBMOpyLpTUEVqOAF1jl2YiI8OGoUQwCTh+XUIqagxY0Qqn4/gCDXpCH4lH8fZm7Cel9ofPwdmJOWyHcPvSR5kdnHjZqjaSClKLYpfqP0OyRYfhRnwZVVQbQ76sTHnhsA/3NLEsz2+mdFDoN8YDPLfBAtRDfJUFJJ8K7YGt7sBLEUtoI4dX0UEIJdZOlkctIQn5e7epIkHHthiqOUzoVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aiO0e5thseh0bUi8gkqcPvFeXxSXLf83rWF60IPkr0w=;
 b=GbfaXoA1W9ylcJn409u6dcrgRFVHu8HKKnY6N/biicdI7Ok/hQXzt4gE2GraVWeYS/fmK+DAuoZmdszUItCfBGonHrpfOW44B1cZD150MgGs90QkzqZlVBN9fIzQPuqAxHD+SJRzEY0weFwzu8ip6pXB0zlxmSy7W2QI56jZgrFJO8uljtldWmTi12nrLNm7yUSJaYvqAZy1Tl6Ic7KCQmlH3hMfMueU5ZN3vJyWdMhtC2qbvNOD0YLHQ6fIwTAHUm+7uCmamGFfK2Tk6gAcjo4baZlf6XkJFC9fIql/vZ3w4iCj6YrK93BNu6DXm/G4UC62CO5la+qY8arVIevEyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by PH0PR11MB7635.namprd11.prod.outlook.com (2603:10b6:510:28e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41; Mon, 6 May
 2024 05:06:37 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93%3]) with mapi id 15.20.7544.041; Mon, 6 May 2024
 05:06:37 +0000
Message-ID: <93f1a927-6cf9-495c-b277-2ff87d044c44@intel.com>
Date: Mon, 6 May 2024 10:36:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] drm/xe/xe2: Enable Indirect Ring State support for Xe2
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20240504233503.16095-1-niranjana.vishwanathapura@intel.com>
 <20240504233503.16095-5-niranjana.vishwanathapura@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240504233503.16095-5-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0251.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:21a::17) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|PH0PR11MB7635:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ef66c23-c95d-4d9a-520e-08dc6d8a4e74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VTJPQVZqNXVYd1BMT01OUjZqU1ROUWd0N0F6TDI4NWZIeWp3djVkalBCeHJh?=
 =?utf-8?B?VmFxM29uT2o0VFpkQUhpMFY0MFlPRUU2eW94UXhmbE1Da1JKZ0s3Sm5GT3BL?=
 =?utf-8?B?Q0VWTXpucU9ML3B1REpoSVZCUE5aOU9lU01hM2R3MUY0aHVGd2JGRmlIaXZu?=
 =?utf-8?B?dGUvdmgvbXJKeHJITGh1ck9tMXY4NlpQSW9Zc3FPUG13SlA3aHNBYk8vTStu?=
 =?utf-8?B?ZVhGdGNsSll6bXk1V3V5OElhc2s4RXhVWUxlM3h3RGMxc0t3bXp2RmN3ZkFD?=
 =?utf-8?B?b2g3dlJRL0R3Skc1Nk55d3lkQ0xibmpIRXJ1eUN5NjNYdDlRY01pWFNvandn?=
 =?utf-8?B?aG5xTjEzNFRUcEZXSmo1YllJS2FXbVZyT2hOelRWblFiTmZOM3JmR2UySFhL?=
 =?utf-8?B?TWQ5Y0hERDRiVy95cEExMVVHZTVHWk53V3lqNGwxUzFOYlN2ZG1Tc3VlSTdP?=
 =?utf-8?B?a3VJdjNEekk5MzF2NEVmT2dmWUpHaEw2Q09pQktVTXhKUkNVd1FObXdQd0gw?=
 =?utf-8?B?T29FSEgxWld1T0tzM3NpYUtwTnZ3YVZySGs4ekkrRWVYMlAvUWNaSXpXNXpq?=
 =?utf-8?B?NzdFSlBma21zRXQwZHVCTmt3ZWllbzQ4YjdrMkRoK1hHUXllaFZMbS8vbnhE?=
 =?utf-8?B?S3NXNFN5TEFyU1RaNjAyakdoQ0ZtbHE5czdmZTFzb2liZWY3TGdwY0hqNHJ6?=
 =?utf-8?B?azFLNjR5RTZjYWVCV3cxM0c1blFhaWJlYjNmVEtwUmZOWk9uam9DL3Uvc2VE?=
 =?utf-8?B?RUZNZENWSlZ3ak45TmRiTDdQRFFxVWlGUXBUMHlIY3BCQ3BBSVdMWENFNlUz?=
 =?utf-8?B?d21JUUtwN2xVcExkaGUwK0UzK1VHaGpDUmwyOGdxcTEySitGVXBFbm14WVFv?=
 =?utf-8?B?UWZsNHBOMUk3M1kvOVJabDlYTjdzcXo5cVdBTlZURVMrdkhrc3RMOEh1M015?=
 =?utf-8?B?WjZXMThvVUNNN0FUU0dPK3NudDhMcE5aWjRlNWdseUlYSW9IRHVrTnUraXpN?=
 =?utf-8?B?anp1NWdXd3gvVHdkMGszMjFVSVpKdm95T3l0NzBHZURiNWdQSkFDVmRRQitV?=
 =?utf-8?B?bWIwZDlFTlFDdEMxNUNCclo0eFpuYnhNMmx6ZFBUc2d2VUhVTzJEd0JRZU5I?=
 =?utf-8?B?MnIycVR6dGNBR0hIY3hUcDFQRmZRZFRTZWZ3bFJaNU5KSEg3MmZtT1NDM0xn?=
 =?utf-8?B?eERWZTMvZGltNW1xZVBJSndJd2VNUTlxNkxYT095Wmc4ZWNyejMzbmlnTTRH?=
 =?utf-8?B?Q0J4WGRUekhJWGx5MEYrblNMNG9kOVBWcjV1K0p6a0MrVEo5Y2MzWjNFVXNs?=
 =?utf-8?B?YVpQY1RWNFYrK1RrQ3dpcXNEOGp4aVdNREJHbjlIOStnQkh4NVFkTG1RQ3R6?=
 =?utf-8?B?Z0plaXNkanZqRzlIeTk2S0NORVNwZExlNkszUnZEZUZVQlBxa3JPWnZFK2t6?=
 =?utf-8?B?a01WcjZ0NXJzM1BNM2R5VjJTb1hOT3pmbTRnVjJvaThUQU5UV2NXbzBtZjV0?=
 =?utf-8?B?OG1jV2RCZW1VUlRSSXVKVDNhWG00elZaQVp1R2F2ZDdZVTVZSEpmeUc3eFVP?=
 =?utf-8?B?ZVB2Ui9qTTZNemVYQmFtSDZYNFdsNmdTWEtaSWUwK0Z6ZE15bkVxVmpySXJM?=
 =?utf-8?B?Y3RrNFVoSTNnaWpQNDlhVmdicHBJeUJSVEpSeVRSVDJFN1RGQmgrNVdiWnQy?=
 =?utf-8?B?YktDK1ZvSU4vR0xhUHlXR0NyV0hkTUVFMzRlNEhURGZBU0g3bHNsRUN3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVovWXpBVWQxMGhpSHh6SUFvakplZi9CeVo4NWVuTDBGQXFpV293YXlBL3FO?=
 =?utf-8?B?YlRxblMxaU9leHdaY2JZQlUrelorcFJxenlzVktJVmhsQzFYYTlTYkxHdklB?=
 =?utf-8?B?bjUzWVpQZjNTcmFodEVMWFJEMGhnVVJpZGlDeUVNSGZoVWVpZGZROUJxdnIr?=
 =?utf-8?B?NFZpTWYwTmR2T0U1bzdBdk55M3krLzdEeHR3Mm10S2RKam1EQ2pYU3lycml6?=
 =?utf-8?B?dlQyL0lsMndWaEtBRHhMRjhUQ3VxQllGRUhuVXdMSjFxQ2wyQ3F5MU4yV0M1?=
 =?utf-8?B?ZVRMMElUUll0N0diR1JEb2NMaVI1akdqTktIWWNVTHNYUXBuU2ZiaWN3K3N4?=
 =?utf-8?B?c3grdmIvWDRpWGg1VjlOTWFpeWcwS05ZVUJsL2RkRlNWdEVFcm5QTmpIaFM1?=
 =?utf-8?B?SHVhYk1IZjBBM3J5Q1d3OExpNWZKdGIyaE9aZmVoVUpMSEJ4cjE5eVhpODRj?=
 =?utf-8?B?bVQ5aGFIbWNUTzhtMVU4OGFlMlBJajRpZmhYdktLQzNDYmFEUWswUEFwQjM2?=
 =?utf-8?B?U2R6RXdwd1dQTmVoQUFIQUlDbFkrOXVIcFo2VDNlYjRjbGw3RzRXM0h1V0Ur?=
 =?utf-8?B?L1NjeWRkV1dEUnMyUXV1M3ovR3A3RzZCVEU0NnlXRk4weitRM0N3T0oyOFZV?=
 =?utf-8?B?TkdwYnZYaG4zSE5NcStlOFpINUFWOFNBYXVqUk95YnBkWFZNSndqMjhYUTNM?=
 =?utf-8?B?eS9NeXZha3JBVGJhZjc4ajB5VnpYOHlSaGZtQ1VOaDVEeSs0OTQ2TkdGWG1p?=
 =?utf-8?B?aHZXTE0yN1pDamRUc3B3RUxPRWMzTys1SWJzQTRrWVR1Rkx2RW44bkVBSHVO?=
 =?utf-8?B?RTZQbm4xcFJSRUt6cVBIMGQ0UWxDc3FWZEF5SFhjWm9IZTVHOURRbTFFOU51?=
 =?utf-8?B?ak9ZeEVXL3dsYXpOYkRWNmxFZ2NFUEdxQmVRdVA3VDQ0eDJhb1BYSnVvRlNq?=
 =?utf-8?B?U0R1ajF3eVAwOFZuaHVzcEZUTVRjNGhjc0RpMjcvazdqYklKWHRrNWhvWEkw?=
 =?utf-8?B?M0VEVG1Sa2RVSmJQQThUbytFZXZ1aHhjcVlxSi9rNU1jbzlIdGlOWmpyM3Ew?=
 =?utf-8?B?VTQyNjI5R3Rpc0VNQXpscGNHUGJjbUVtdjQzU2RJZFhXdlUxcVhSaFJCTy9K?=
 =?utf-8?B?ZTU2a2tZWDgvazJ3emxDenEvZ3RJTEJ3U1NZR3VQK2ZZRitKYmFuRWorVGVp?=
 =?utf-8?B?K2JrVnJQSWdVTXNNeGJEemlQN1hJb0xiRDczOXJndzNUcVQ0NDZaMU0rL2ZT?=
 =?utf-8?B?Y0dieVpad0V2VU90LzBZanhDOWRwL1lnRUEvTjZuK2ZIbXh6RnBGRXkzWHFh?=
 =?utf-8?B?OG1aQ0hLcndqK0ZTZGtaWERQRE9PM1JGSWJQcExXcDVzaVluNDdlbUQrQ1Mr?=
 =?utf-8?B?Q3o2c1RBYm5IYzhwSEsxV3F2UjN2MWpJZmpIS2hjWlRNVFpuNGxmZU1CdC84?=
 =?utf-8?B?Ym90UlR3eEJHVGN2M2diRTJhK1hNWDZPUTRNNnVkMzJnRW43Wk9UQ2xkdXA1?=
 =?utf-8?B?cVA4TDcwdjlrWkx5R1kxY3htajE2R01vd1NJZzVibjhIVWdMRTdyOTNucXR1?=
 =?utf-8?B?YkZXUmJDQlVxc1JWV2p5OFF3cWY5bU9sWmsvOW5yWVdsdmplMFNKaUh4QlVt?=
 =?utf-8?B?NzgzaDJ6N2RwK1VtYUVqaVdYVGFHcFlDZnM3WVdtbEI4dFdkZWpveGljSTNq?=
 =?utf-8?B?Y3ZKN1Jjc0RvY0NxV0pOUXBZZktUMVYvdktQTjFIRzd0UzdReGdXSHdLVVEv?=
 =?utf-8?B?Tk1VWTdGbTg2dGRlRVk3MEhPak80bnhsQTJIdUkvRzBWZXFGREdycGU4cjIy?=
 =?utf-8?B?N3R4NUVCWmVzcFFuZmpRZDgwYnJJeVhtY2JtSDlXd3U3Z3lTSk8zd25Uelpq?=
 =?utf-8?B?OVRjK1FpR0hLNFo4TjFWWGVwYVh1cml3WkFWZVFtN0ZLRVcvMDN1OHJTcDdB?=
 =?utf-8?B?ejlkOE9hUDJ5NFo3WWJSbXVEOVJlSXJRck8yaEJ3VEJPYVBvY2w4djVTOVFY?=
 =?utf-8?B?QXAwdjFvWDE5WVhTUUw3UkY3MWpDS1JXbENxSDZJR1JWNmdveTdMYklVSmlO?=
 =?utf-8?B?NUZ6cHppQ1VMZmlVSkxiY1BqcGRUYXh0RjcrTzd2TjZOdlo3NlBZQ0dyUGFZ?=
 =?utf-8?B?WE01clpMclFnU1NmVHFGdVJDMHlKakw3UVhpQ1VjWlBGS2x5RmYrZVZ1WGVC?=
 =?utf-8?B?NkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ef66c23-c95d-4d9a-520e-08dc6d8a4e74
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2024 05:06:37.2043 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YIwv2k2PiO4/xP27BsurWnAaGXC7JHByU7NFV56L/pySfa9ssjbB90Je+zSRoiigFRSMuyvJp+56C9lkZq7ulMz75TSuushew+qCHlNuYaQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7635
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


On 05-05-2024 05:05, Niranjana Vishwanathapura wrote:
> Indirect Ring State is the recommended mode for Xe2 platforms,
> enable it by default.
>
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pci.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 5bf94abf84cc..9f66c41067d3 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -164,6 +164,7 @@ static const struct xe_graphics_desc graphics_xelpg = {
>   	.dma_mask_size = 46, \
>   	.has_asid = 1, \
>   	.has_flat_ccs = 1, \
> +	.has_indirect_ring_state = true, \

LGTM.

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>


>   	.has_range_tlb_invalidation = 1, \
>   	.has_usm = 1, \
>   	.va_bits = 48, \
