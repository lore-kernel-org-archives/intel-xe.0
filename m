Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BAAFC88E7F
	for <intel-xe@archiver.kernel.org>; Tue, 15 Sep 2026 15:30:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2086810E097;
	Tue, 15 Sep 2026 15:30:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CL57R00/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F6F110E097
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Sep 2026 15:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789486252; x=1821022252;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FLwQf9jpbdC/Odsv/BhZHlkNQxu+p9kY1w+wZ3x+pM8=;
 b=CL57R00/x+GmKqP0tTzHBYBhJ2vmgAvoFeuNKt2vPgOoVagymf6nVPgS
 9pYmdg0VG3T07sJQ28PhETzE1JldoiV6VNjYTD1KYetmhnsXNZSUd5yB0
 T9M/mOLOVAYwrCqD27U4jOhhwmVwF6L78usFRe5xLrmpEcKcjMn64DqzA
 9e88T5DqHc9RKGUsiOCJ9ib7HzlpAKFaabO3JQ+Ddpgx8jVkm5SSOLIww
 GT1gO8oW9WrTWzKwKMnECbm9R4DbQZq7m9fi4ehqKUna4S5qnCHehwHzX
 CobEz/8Jh6ysZYFFa5aTJ0sAbjBqbEJ9cj6ITyC9I39TPRArdDQ7D4VnF A==;
X-CSE-ConnectionGUID: hCezo38PQM28FMayYlRSjQ==
X-CSE-MsgGUID: /j/XZqwoRg6skc548bZ3OA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="101371110"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="101371110"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 08:30:51 -0700
X-CSE-ConnectionGUID: yJWlWcX0RJa1zE14M61bEQ==
X-CSE-MsgGUID: Kq8m77RRQ82ckGnfPyL8mQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="276573770"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 08:30:51 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 08:30:51 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 15 Sep 2026 08:30:51 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.30) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 08:30:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YMEANPYZe9Xj5C+P0shFh9iv13BdI8YjchRzofvmKUgOpimyP8Sf/pIBDyiU+Ml3HHBlc55nN/Xz2ULL/owngDWKhzNtyitiAYKugdK/+vOb4ju94xEKf9s/lTrqZYNOW5nZ7JsQO3ifatzdnygeuJDCReeYubat8aRitc5nkB2BldqTIaklBfipk2fp7JdIcYbukrZ1Wip/jphyqp3qsWlGGDReJHuijfd2AX1aOIg6P9UIKPyKipo9llfQjwisi6QKxQEHVx8f75nGpi5HUA+DRaTVvD+zKM/BK/VxtN3NA48oYNcfRQ/O4KuC79IKdGgui0lc7bcc3+herZcEgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rv3IwKcXqIaMGg9byaLN5uUnCHKJN1o9IgWiBtx8D/I=;
 b=VIt0ARp2QApS3vjVcju1vGFCdRBMNVCt6pD+40BVwbGUPbAr990dtFz9XgqbIw0MzJxHm+iB4H0P+58PFlOiBzT15taE4ytmnOn31ILgVeUl2bTCd4bFdifNzzo8Z/gVoN6/YfiUusV2UOP5pxXYnArNZjPecxPNLCW/oUf8EO76VynTHs2pp1urR7ZhsUAjl4iI5IVrudIoX4CeP8GQoX5q5JzVAU8/2x2V5D2mrSPYqU7UyDEoX8Cgmf9MZsq40K0QfQ5iNVTmCNHvsYPkbhVm6STkER2g9HVUB7TsFdEHqmTOVzOym9Gxn+HqvbdU7JrCaNg7L7JDjxIWmHJ32Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by IA3PR11MB9326.namprd11.prod.outlook.com (2603:10b6:208:57d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 15:30:42 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c%5]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 15:30:40 +0000
Message-ID: <79b83824-f794-443a-bfdc-77ce600c693e@intel.com>
Date: Tue, 15 Sep 2026 08:30:38 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] drm/xe: Poll GT for C6 before D3
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Badal Nilawar <badal.nilawar@intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20260915071145.2866414-1-vinay.belgaumkar@intel.com>
 <aqkI4JLyM-FS4s1i@black.igk.intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <aqkI4JLyM-FS4s1i@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0281.namprd04.prod.outlook.com
 (2603:10b6:303:89::16) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|IA3PR11MB9326:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f6590c0-ec78-4218-1252-08df133e4c68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|10067099003|6133799003|4143699003|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: /NOKFg53XJOGLoF8W7ZH/mqiIMA/YHVT42/GeMO9gI7r+EuCV0CF/lFwX0WIgojB/Xi77G4hsYywWqPDRWHzb66v1CIPq93CLzKDThGYJejIbrqPfOBaywMV8QrgXS6lmlePn4+ULbDuoqDsT5bXi86JeaivY4CN9jUOK0A+GO2JTV5diqxuj3A9qLinLgwX0DID0vxWuBDXCd4PKjLNDaT2XzmXBN7cndkqu+6LUg0VLhDAHRZyYqvVd+e0h23ffPNHCFPN4SdAIlasaH8FJbHfgE8iI5PTQtvMvOd80+sC5GEg6VkTMWDmp+685Euri6hlpT3DdjebLBIBpekxSNp6MOwFdS4W8+oQ5tXqy3dxUVyeLnGbwo5E69Hw95fh3FyAQH9yYFfSSFOc6hBOfZvNkVtJKVqjThGok+iLIHHhiWz/CVf9/s9CThoiiYvhiapCdQKzu+s+Zt9KKMYiMsGjOHEqBCJWbayrXZTtjR69pn8dvxsTHnQrvhkhGqM1DKFVwhWh+zI+bTC4ma2GGW5xwxDVdKHka121DLqd1njUgRHHWL73KhtAYu7UndDjy1X0a7x69Z8IXEyMl52KsHnMKr33FYOcPwWEHhzhfPVIYASS4uch6EntYk+g2M2+0PVQ6lIT1ruA0b26/jkY/fwlkal8gz2rwj0+JE//I9Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(10067099003)(6133799003)(4143699003)(18002099003)(22082099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RDBac2diUXhYUzZGcjY3MlZFSVJLUzJnM1Z4RlJ6cG5EemtiaFExcjVkRW5W?=
 =?utf-8?B?dC84ekFsZlJ0V2hxTHdIUXlSaVRKMDdPSFlZTmdYZTlMK3l6aWQ3UnZtenBn?=
 =?utf-8?B?YUxMdWtLT29wZG53QldmUU92UFFJbHY1aFh6RmlPWGZwVGtlTnBjUFpIdGg3?=
 =?utf-8?B?d214aGczd2luK3R0K2V2MzRmWkdHYjUvMk83RUgrdlpFcmZtMmQwc2R3VEZo?=
 =?utf-8?B?TGdGbUZNZk9zRHJrdkptbGpwVXBRUHFLeDJJQkwrVDRBLzZYMVJ6aEtuYS9P?=
 =?utf-8?B?T09GMlJrNXpVRkdMUVN5VngyWEgwSklnckd6VFZYTHorK00xTWRnN2N2UjIy?=
 =?utf-8?B?WjgzeGJUVnRKS2JsQUlPWWowRlVQV3pQRTFaUFJCdUg1dnZIM3g2dVkvOXZX?=
 =?utf-8?B?d1hrMkkzNDllUE8vNS84alRVWFM0SEdpTTQ5OEJtWDU4aThEek1naERGcU9a?=
 =?utf-8?B?TEg2cWhjRTJEOFNNZHdOSENJNjhNMWV6T000eUZaOEtPeWYzVEo4L2xZWHBO?=
 =?utf-8?B?b0Y3aWpNRkJxcFovYkd6di9xNVNCVlBNZHcvWVVRSEpENjQ0bXNEcGFqd2xS?=
 =?utf-8?B?bTVPNytxeDFtMHlPZXdtZjlZaG1CZVg4QllSeURDSjhDWSt1SnB2K0tRQmF1?=
 =?utf-8?B?aTM4QUlKa0J0UFZOaHBZY3BhMy9xZzhnR25GdGJWYnp1Yys2SUlwQ1RmU2tH?=
 =?utf-8?B?NGdqd1RsVVAzR2dzejI2S0NVR2l4UmdiTHBDWTIwSEk0Slcvb1ZWL1RSd0Ew?=
 =?utf-8?B?Ry96R1hjOE9Yb2Q4elpzQkt1V0hyNk5zNjljTHJBQUozdURkaCttOHR3K1dG?=
 =?utf-8?B?K1BvS016V1VndDRJcGRvS2FiM3FsMW9aTFJVOVFZMlQwcS9nVjhEUHpzd3B0?=
 =?utf-8?B?TWMzVnJua2pqbEJoeGFoNkx0ZldXR3V2bWZNNVM0bmxsakZ2WU91NXNtRGRn?=
 =?utf-8?B?UlNmQWYvQmZ4anFkN3hESmszc3lrL3NjOG1BNHNPdGs0NHh2Q2JuV1ExaDJw?=
 =?utf-8?B?T0tHMTRhOWtxcEFRRFo5a1MrL3M5aDY3SDJUS0ErYysyUjlLR09VYjhRSGl6?=
 =?utf-8?B?TXU2WHdaVEZ3M29LNXF1T0VuMDFTSVZ6bVlHcmNoQVlwZUgwUTlMRy9IUlE3?=
 =?utf-8?B?anVFd0d5MFNnNElUSEJxYndFV093WlpQblk0N1RrNjA3ZEVJZXRVV1VTUWhh?=
 =?utf-8?B?Zlk1dXY5WXZyeExTejQyRUY1NVkzdXowS3NxZnlzcW80TXpFMW5aZnlleTJS?=
 =?utf-8?B?Z2ROQXNZYTFSbjVKYTJCdCt4NFBrTXcrc25EWlptYTk2dElaYTZrbmpaYmNG?=
 =?utf-8?B?OXNpNVZBVFVTVlhUL1lSWkxkbUdaYUZlR2c1MC9jam0wRS9QdmoxTThEb0Zm?=
 =?utf-8?B?UUpUSkNNeEhHUlJ6NmNxSndGL3U2ck8xUjYxaFJvMGo3Y3d1d1ZvN21jckcw?=
 =?utf-8?B?aWd4MytENmhHUjdrUGhwcng0V3ptR1NxWXVqR1RpcDFSdzl2M2t1Q0hPN1Y5?=
 =?utf-8?B?M3dOZ1ZPOG9oMFRhOXN1eWlrQ0RudHpmNURydDc3RDNKeGd5UXBXRmZSSVRt?=
 =?utf-8?B?allXREp5ckxFek55R1QySXlBNHBWRjJKUjhPSU95bjZVYUR3V2YrUjdGV2lV?=
 =?utf-8?B?RWdGaWt1aWxjbGNQSUE2ekRNaEhXbUJMUk1BZm9DcnlNM0s3N20yOWZFRmhp?=
 =?utf-8?B?MXJrTVhaUjZQQUFVRDJDMlE1c0hHMGl1QkxOZmdnbktyRlp4akdlQnFYWFdw?=
 =?utf-8?B?alQyNlk4SEhwS1p3VVA1Ym1wVlM5alZxV0ZGVHdWdFNPT2VUY0ovMUMzSUFD?=
 =?utf-8?B?TVlOa1VzZ080NXlJb3FxWE5aTFV6aDRzL21wYXJOVldZbmZXRFhIU0ZMZWZZ?=
 =?utf-8?B?bi9FZW9iNVhoM1U5YmN2ekM3Myt3UzVJWXNwS1U5eUFSWTJLZEkyRW5OakVq?=
 =?utf-8?B?djVCMDNNM0hLL1kzOEVqall0NXVHcGhEZjdqS2lmWGVid3lCVmFYeUJOQjFS?=
 =?utf-8?B?NjJhSDArT2V0eGN2c1JDbzRYdE9TMjEzbWg3S2k5MWs4M25NUTFGcmR0aTRk?=
 =?utf-8?B?WUNxSGZrWHM5QWZGM09vL0IwVGpaLzl0N0FMOGJFUHNUY0RQczIyeWkzOFBk?=
 =?utf-8?B?engvU3hRNkV4TlFmeWFndzVxWEQ5U3BPNWZOSnpVSFczM3JnbkF2WGpaNmRD?=
 =?utf-8?B?RGp3NHROa0tvZW0vNXlTOG15SWpxMFB2UEQzZ1Rhc2hTR3ZNYUI2Q0RpTjlM?=
 =?utf-8?B?RWpRU0Z6b3QrRldVWFo4T25wcFhsYk1tdm50aWwzNFlDSk42NWhFQXd4VDFr?=
 =?utf-8?B?czdXM2dKakp6emJpN1p4WVRVWG1DNTZLbThIZ2JnWmlMVGxNY1lmUHpoSmRR?=
 =?utf-8?Q?7wRoTNJImHaR2IT0=3D?=
X-Exchange-RoutingPolicyChecked: f7/YCoj6k4OZXYQrbuaq/QPZv/FJOTtFIHdv2Nkvo84Cn9ooPIgJPa4awIwgNUa4G5EcmyIT8AgbPS37+dVC5yGxdTkfjFORXjue9z+PsRORRZHd94rN+nYUa7YhHIWPsr/tKeAu3lkfnokvKJevVAPCalGcIB6FPDnZ5rd3JKFEX2cqij0dg2RheXe6T69TB/gW2AHB2th7ATMVZuQsp93hg4ZZ6O6QqwngUSFNcWgI9d3fzYQAGnxyyIzL078WMSMJLA63+aeEtvMyOYzK0k4VQ+sRyvdbo0Mo8S/YDyAztWaI/71gl/lH/jlDNW4iAhSpw3jD0fDQ70UCJKilWw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f6590c0-ec78-4218-1252-08df133e4c68
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 15:30:40.3651 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Jw56akTDYfT0lLFt78Amear6bQAkAmYLlrifMJyq05vFDvN0ZWOIvUDU44Ni5ufl7BqumIv7/1aTZo49Yg7qi4j0ydCh+Dw8z/xbSzcq0k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9326
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


On 9/15/2026 1:59 AM, Raag Jadav wrote:
> On Tue, Sep 15, 2026 at 12:11:45AM -0700, Vinay Belgaumkar wrote:
>> Ensure GT C6 state before D3 transition in runtime suspend flow.
>> This avoids the scenario where GT is being accessed after D3 state
>> is programmed. If the check for C6 fails, resume the device so it is
>> not stuck in an intermediate state.
>>
>> v2: Force resume when we cancel suspend due to C6 check (Sashiko)
>> v3: Abort the suspend properly when idle check fails (Sashiko)
>> v4: Only check for C6 during suspend (Rodrigo). Have check in
>> xe_pci_runtime_suspend() instead of xe_pci_suspend().
>>
>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt_idle.c | 36 +++++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_gt_idle.h |  1 +
>>   drivers/gpu/drm/xe/xe_pci.c     | 13 +++++++++++-
>>   drivers/gpu/drm/xe/xe_pm.c      | 21 +++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_pm.h      |  1 +
>>   5 files changed, 71 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
>> index c208d7563e36..8242feede1dd 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
>> @@ -8,10 +8,12 @@
>>   #include <drm/drm_managed.h>
>>   
>>   #include <generated/xe_wa_oob.h>
>> +#include <linux/iopoll.h>
>>   #include "xe_force_wake.h"
>>   #include "xe_device.h"
>>   #include "xe_gt.h"
>>   #include "xe_gt_idle.h"
>> +#include "xe_gt_printk.h"
>>   #include "xe_gt_sysfs.h"
>>   #include "xe_guc_pc.h"
>>   #include "regs/xe_gt_regs.h"
>> @@ -451,3 +453,37 @@ int xe_gt_idle_disable_c6(struct xe_gt *gt)
>>   
>>   	return 0;
>>   }
>> +
>> +static int wait_for_gt_c6_state(struct xe_gt *gt, u32 timeout_ms)
>> +{
>> +	struct xe_guc_pc *pc = &gt->uc.guc.pc;
>> +	enum xe_gt_idle_state state;
>> +
>> +	return poll_timeout_us(state = gt->gtidle.idle_status(pc),
>> +			       state == GT_IDLE_C6,
>> +			       20,
>> +			       timeout_ms * USEC_PER_MSEC,
>> +			       false);
>> +}
>> +
>> +/**
>> + * xe_gt_idle_wait_for_c6 - Poll for GT C6
>> + * @gt: GT object
>> + * @timeout_ms: wait time in ms
>> + *
>> + * This function waits for GT to enter C6.
>> + *
>> + * Return: 0 on success, -EAGAIN otherwise
>> + */
>> +int xe_gt_idle_wait_for_c6(struct xe_gt *gt, u32 timeout_ms)
>> +{
>> +	if (IS_SRIOV_VF(gt_to_xe(gt)))
>> +		return 0;
>> +
>> +	if (wait_for_gt_c6_state(gt, timeout_ms)) {
>> +		xe_gt_dbg(gt, "GT is not in C6\n");
>> +		return -EAGAIN;
>> +	}
>> +
>> +	return 0;
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.h b/drivers/gpu/drm/xe/xe_gt_idle.h
>> index 9c34a155e102..2c8e9adf4a68 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_idle.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_idle.h
>> @@ -18,5 +18,6 @@ void xe_gt_idle_enable_pg(struct xe_gt *gt);
>>   void xe_gt_idle_disable_pg(struct xe_gt *gt);
>>   int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p);
>>   u64 xe_gt_idle_residency_msec(struct xe_gt_idle *gtidle);
>> +int xe_gt_idle_wait_for_c6(struct xe_gt *gt, u32 timeout_ms);
>>   
>>   #endif /* _XE_GT_IDLE_H_ */
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index ab4da1d9a9f1..379795ac5e7b 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -1381,7 +1381,7 @@ static int xe_pci_runtime_suspend(struct device *dev)
>>   {
>>   	struct pci_dev *pdev = to_pci_dev(dev);
>>   	struct xe_device *xe = pdev_to_xe_device(pdev);
>> -	int err;
>> +	int err, ret;
>>   
>>   	/*
>>   	 * We hold an additional reference to the runtime PM to keep PF in D0
>> @@ -1396,6 +1396,17 @@ static int xe_pci_runtime_suspend(struct device *dev)
>>   	if (err)
>>   		return err;
>>   
>> +	err = xe_pm_check_device_idle(xe);
> Considering driver has no control over C state here, is there a guarantee
> that GT will remain in C6 after this point?

I don't think we can guarantee that. The issue we are trying to avoid is 
to program D3 while GT is up(through some other component). This check 
reduces the likelihood of that scenario.

Thanks,

Vinay.

>
> Raag
>
>> +	if (err) {
>> +		drm_dbg(&xe->drm, "Resuming - Device idle check failed!");
>> +		ret = xe_pm_runtime_resume(xe);
>> +		if (ret) {
>> +			drm_err(&xe->drm, "Resume failed after suspend was canceled");
>> +			return ret;
>> +		}
>> +		return err;
>> +	}
>> +
>>   	pci_save_state(pdev);
>>   
>>   	if (xe->d3cold.allowed) {
>> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>> index f517bf453b54..678afd7a1d08 100644
>> --- a/drivers/gpu/drm/xe/xe_pm.c
>> +++ b/drivers/gpu/drm/xe/xe_pm.c
>> @@ -1030,6 +1030,27 @@ void xe_pm_d3cold_allowed_toggle(struct xe_device *xe)
>>   	mutex_unlock(&xe->d3cold.lock);
>>   }
>>   
>> +/**
>> + * xe_pm_check_device_idle() - Check if all GTs are idle.
>> + * @xe: xe device instance
>> + *
>> + * One of the ways to do this is to check for GT C6 state. This check
>> + * will fail if some component is holding a forcewake, for example.
>> + *
>> + * Return: 0 on success, -EAGAIN on failure
>> + */
>> +int xe_pm_check_device_idle(struct xe_device *xe)
>> +{
>> +	struct xe_gt *gt;
>> +	u8 id;
>> +
>> +	for_each_gt(gt, xe, id)
>> +		if (xe_gt_idle_wait_for_c6(gt, 200))
>> +			return -EAGAIN;
>> +
>> +	return 0;
>> +}
>> +
>>   /**
>>    * xe_pm_module_init() - Perform xe_pm specific module initialization.
>>    *
>> diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
>> index 6d5ab09cb769..a4fdc9c5cb10 100644
>> --- a/drivers/gpu/drm/xe/xe_pm.h
>> +++ b/drivers/gpu/drm/xe/xe_pm.h
>> @@ -36,6 +36,7 @@ void xe_pm_d3cold_allowed_toggle(struct xe_device *xe);
>>   bool xe_rpm_reclaim_safe(const struct xe_device *xe);
>>   struct task_struct *xe_pm_read_callback_task(struct xe_device *xe);
>>   int xe_pm_block_on_suspend(struct xe_device *xe);
>> +int xe_pm_check_device_idle(struct xe_device *xe);
>>   void xe_pm_might_block_on_suspend(void);
>>   int xe_pm_module_init(void);
>>   
>> -- 
>> 2.38.1
>>
