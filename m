Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EFEF10F995A
	for <intel-xe@archiver.kernel.org>; Wed,  8 Apr 2026 17:02:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1F1610E6AD;
	Wed,  8 Apr 2026 17:02:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WwdQd0no";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4112810E6AD
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Apr 2026 17:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775667733; x=1807203733;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DmB58U82Z4QyUJnoRG5Y8V2PRyOPSGEtQ4LWygjRKSU=;
 b=WwdQd0nohY80nlJCWUXuyBk7P8nDfv+5W34FgItLnMXVpCuBDsOMpcGj
 Ye252j9hSuneg/bn3wgvLIpxQPRi2PLAd6H9bkTgJW1YlYfIpK+42uH50
 HwZUs0mhYs3waZDfoICj0GQrxk+6tWbuzI5Hw9GtfmG4CsFSbHKPPIhOB
 R5ZPv6HPc/UVfCjczVkEKdfTTQz+tXI5i+914PeeNBChhVfO+vAbAdjmf
 WaVQaGyIeSkv0Pp8nrFKFR7jwBVNAN45gvJJzW44ZVQz5FM1CXyfumfyX
 pi7SBFe0wPNkDCzt9rdYKJXqJtzq87tv7kPDECwDEu8nQGUGOw/eoT2Vq A==;
X-CSE-ConnectionGUID: WJtnLF7UQkepdFdnIjWhGA==
X-CSE-MsgGUID: hjctKqoHS0arxwGQyI7d+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="80254225"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="80254225"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 10:02:12 -0700
X-CSE-ConnectionGUID: mxJFEFIdQc6lM57kEBKzeQ==
X-CSE-MsgGUID: AYnpmnV1TwWOclOkvorFXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="223761907"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 10:02:11 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 8 Apr 2026 10:02:10 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 8 Apr 2026 10:02:10 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.21) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 8 Apr 2026 10:02:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BjItKI1VyYtUZIqblOZQvqGz4nePXRkhg0gc1GdfLKsClJr7S6q9vQGqUtSdAtaQFCvfcAdYv8lGB+F0yPTGQ4zYg6R9JL7wxw2TV24vfbbyH9uVe5TM5QqjE+5GWWsy9Y+oi6FfPNuG6mqjaIdTwPbehEqnELf/HcjsGtZHSBXZnSBZbMVRf68e/HfYlQsnHgKhiwA1VRYsPr/DwL2G0iRsMGgIMpmMoTGrHVvI2kHXdJpujcTpS3N42/UixNoVGfGBc9Gzt/ySsfMfE03LDZzfl8cJKkGjG8d38250XKQOTvlrq6fPeEYA8gm3SZrMvH7kDfCLALdTv1INc9TFVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EAzJMLgPNPMhf4qCSVo7tamy0sTyVd9LSJhG34rN4So=;
 b=looC4FxfZgfZd/eyeDr0kfSx3+kPtWO9cFZDsCbQi8C999tW5yjg7i9EadEhFYyOKHTIWA69wgSGV9C4j0jbRmgzHhXykTvAHR/P7pGrATMv7AaY8ODOJtoOEJrea11J6sE2ylMa5hBSgg6YIRo+4AT7TO1v+ZkWpxsYLzwMKvRakBaW0h6K7eTZS6EUJrkxDz6Xl5NBeCmmDyRTQvfTq0kyYiKMb63NHk6XKM75A50cB2iWl1hvmVTFoMmoW/pcMYiIG21+rdRZYn0R9uf7OhbGKkDLTfPEi2IRbqO9pnh3O4k6T75YqPOfaqS92PCcLqbq16nMd1bLYePxa5wpIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by DS4PPF69154114F.namprd11.prod.outlook.com (2603:10b6:f:fc02::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Wed, 8 Apr
 2026 17:02:07 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9769.016; Wed, 8 Apr 2026
 17:02:07 +0000
Message-ID: <7248b00f-35f3-4753-976d-952f1c4873a6@intel.com>
Date: Wed, 8 Apr 2026 10:01:59 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Add support for NO_RESPONSE_BUSY in CTB
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>
References: <20260403204433.5765-1-michal.wajdeczko@intel.com>
 <6b5850d5-879f-4ea0-ad29-63ef0d8474d1@intel.com>
 <4d27ebeb-c27e-4253-8799-f939754d047b@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <4d27ebeb-c27e-4253-8799-f939754d047b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0102CA0063.eurprd01.prod.exchangelabs.com
 (2603:10a6:803::40) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|DS4PPF69154114F:EE_
X-MS-Office365-Filtering-Correlation-Id: f8adfa49-f298-4070-d7ad-08de959090d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: 12YLXgE4HEIagByjvw+PPL9WrsDN59dAWyoErqW5UXzk3ceBvz/5tHOeuJkVqasstXAJPM4Em+RhLs/ne0X+Qnrco2/aaNXSqMB+at9PG5pYssOGiRJxpJcapiXdSFBSpxlcm93Or6ZkIU0y5HeFjrlYttTJPtQKu9/svIma+HHbwuftcgB9seXwCt8JCJh4CgGm5R9vzzzOKBe9g256bE6zzN31GWhG5jztblnKuVOJ7NcPleyW3jOfEmv+M/Tnv7spTcVEa0ZjY+HC/QHi17XYFtJ4eJ4eRMznlykeMS4qVyHroor0X1nWkuW5+Ttm+lEvc/UaZFQQoyWd98okud39kAiM+ZOXon7aMXIJ/D1HUi7YAZQhwHfMctvkVPfq/+kI1W668QcACxX0nD/Ey86Mv0EFYs7rtt7WQeuj6viJX9lm8yweBzZ2QleuJx8OGth46C/m2lGCVqSzEa6lGFxBM2wDZPaLFPcc7E3ZM7BB1KsThv9cnoSNjlP3hjS17vPU4O4uS5jFfDfmgm0Fc/6o8ah4fNfH1BGVa8ryXkA1P9NV8sGtRcMlgmKC7J1akjRgb/p42p+F5jojZzy+5RBWZZoZvl6JX1ZGgI9xEkeGbbaz/jK3olGKrXFyedPOdxlhBhyh+wZ6dNPqxaTcEQBEWkN31vxH3Gno5KzRjGcoZJ8If1XGn+le7Mzty538
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MnJUQndJVWd4UitTK1dPOFc3aTloQkV5TW55elVhQVZxcTNnZDVQQldzTkdq?=
 =?utf-8?B?YzVXV1QySVIxd0pvREFBQ2J6UTRlUU92NDByUE9lOGYyOXNHOUorRlRxbnV0?=
 =?utf-8?B?SzNCYnBMQXh5U0YwdExlMjJKSXRMMW5OUXJkZHVEdCs1dTZuVmNmaUQ5N2pi?=
 =?utf-8?B?QjFQd05ocEx2S2NEejc2cDVpWHQyVEtxN0RZZkhZenVkNkpsS25NN2dPbkVx?=
 =?utf-8?B?M3ZRanlEZHMrTVFOaDBwZVFCUHgrNUdrbmJKSE1pUklFTkxITWp1M3UzYUdr?=
 =?utf-8?B?MFR0a1lLSGdTQS9vTisrMWsyK1JGRHYxWWZVbTRKUjZSOE03S041dWZxQXZP?=
 =?utf-8?B?alM4SVpJTlByMlFqOTdRWkVGMWUwYm1JcjBraWFnSTduVXZGbVIyczlLanMy?=
 =?utf-8?B?N1UxMWFzbFZRbjYzY2hRS05OUHRzc0F3dktEQ2hkMnBoOU4wbVUxOGNkSGhZ?=
 =?utf-8?B?dmZ2NDZyMVh2RjdxdFliY2dicDFsaDZseU5vZzhENHB0SzdKbkhTMHNtOXFI?=
 =?utf-8?B?SFZhKy95T29HcUdqSFE2QmNKd0JvRzhMdmNhWHloNHJUMG9aZlpwV2doVS9E?=
 =?utf-8?B?SE9iakVCMTY0bWtoM3VwUmZQaGNrY1VCMDhTd2t2UWpEbUpRWHFwMUZ1TVJC?=
 =?utf-8?B?ZzU4U3BxNmxWbFQ4dWR5N1l5TC94SUFmdyszY2lqMzl2RHFURkZKN1lSZ25H?=
 =?utf-8?B?Rm45N01hVUFhVkVoMkIzVk9ic1k5UndCVUcvK1NNU0Z3cDRyaFoyaExJNXBH?=
 =?utf-8?B?ays1WkhXYlZnOVBLRHNHb1JESnVkTUNaVDdobVFPRm90b1IyK3YwVGk5N0tx?=
 =?utf-8?B?ekJLc2xzZlJ2SktML0c0YytZWkx1cWRSdWZ4cEtiSkpuaEd6c3cxMXdRWU5F?=
 =?utf-8?B?bDdhM0Mrc1JwT3k2Qmd1ZExKc3BCbkpySkk1ZTJxQlhweDJvQWtPc3oxMElR?=
 =?utf-8?B?eHRJY0RHenp3N0FZQitKSTIyakpSU1pjQUo1ZWZtWm1EWXRVb3BMaUplNXRo?=
 =?utf-8?B?Y0sxY1dxY0thRy9SUG9xeDRqYVlrSk9qWHVxNjNtWWFMbDRNWlZOZGthNVpT?=
 =?utf-8?B?aDZhYmN0ejJhWlhVMmZhemdvT1U4dmFqRTVKRzIzM2FzRzFZME9WeXJEeDdC?=
 =?utf-8?B?UFhsd0FQWG5JUkxkcVZ4Ni9odEZMalFxdjh3d1BHVWU5aHBxM0RtTUNuU1RZ?=
 =?utf-8?B?ZTVRVU1BYjVUUHZyY3ZVc1FONS9EZmtRM0hwbDlpQVcwMklpVTQ0VDBWcStS?=
 =?utf-8?B?dUMvRTRodmpqQ1dvUUR4aStweTFRT1lRS1JsTkVQM0R1aXIyNHpNS1pBTHNZ?=
 =?utf-8?B?WkUxMUdlbzZqU1VOT3NIL3hoZWJieThOYUJoY3lHVEtzZ1dUMHJhazU2Ny8x?=
 =?utf-8?B?Skh5eVhINUFwT1Jvc050bWV6SnNOb0VHN09Kek9GR2RlZlZhdjE1Y0lzdHlj?=
 =?utf-8?B?UG1UNHVDYmxsSkQ2NXNON0VQU25OSTBybGhvemtBNkV3SExtU0dIaHZUYjlt?=
 =?utf-8?B?ZVZUcWErbGpGa0JFYTRxYlgwNG5oejk1amw2NVIxSHQ4VzdsSDZ1R3pPSE9w?=
 =?utf-8?B?bjE0YTFZTjk0cmRQUGZ3eVRPbkNYQWRmWHlzWnNmdjVvQ0pxSWh3eXFpNjZo?=
 =?utf-8?B?UzYrV2ZlSU5TcVoyNTNHdUFIeDBzN1NURFd3QmdKRnhHbHdhRC9hYXRmeVN2?=
 =?utf-8?B?QVFMb0NvMVJvZkFHREtXNWE2UkxyUHJHVFVZWEg1dVhjRVVxN05IZHUyMTdv?=
 =?utf-8?B?dHhyNTA2MTlBOW85L00xV0FyOElSMXNmMks3UGVhRHZrUkZIMGdMeFJFb1Qv?=
 =?utf-8?B?SWh1bGZ1SDBTcTVlVEkyMWxEVVQ2NHhRQnJWNDIzRUlGdVJJL3c1MGN0RTJm?=
 =?utf-8?B?WFo5OG5HOWE1d1ZPQ01SaUptdzJ5UW1RZmhYclhZMFd1c0dEc2x1RXRJRGxR?=
 =?utf-8?B?c3o3MjZET1h5eHV3dUdFUnBwYjRaV3NIeUFUVktZQlZvYTJ2S0xSZjhQMldo?=
 =?utf-8?B?cFZGTEliRncrUGtLQUtyS3V1NUVKVUZrTVZSdnBzVEUwS29ETGsvQytRL1M3?=
 =?utf-8?B?bW41YUFlSG4yNmtmMzJ4SkVPeVRNRURwWVoxUWxNY3lkZEovZnlmRVN6bEhi?=
 =?utf-8?B?aTFsMVI2YTFNbWhFZjk1VDFWeWtGdWJQYW5EMDg0M0pHVTlmby9ycXkxeWNa?=
 =?utf-8?B?bEF0cGk1Zjc1cCtPMzZCK2t6M1FXU2JlcFMraHdySWNVMllHaEFRMEdoc1hV?=
 =?utf-8?B?WDZaWU52U0J5M1k0UDdXZXRQS2dvS0xZemFoa3Era2tyVlZEcmxaTWRiOTZP?=
 =?utf-8?B?Mnd0NlBKSG9PaUQ4NGthdEJpWGdWNERORHZXSEw2WjV2YXlBcVh5N0tHajB6?=
 =?utf-8?Q?XJ68AWk0rLcJK43M=3D?=
X-Exchange-RoutingPolicyChecked: Nd7uj54hGcimyCKdZ7co7H6ez3oZ8NJK5X3CiW8/9H5Zcg/DvXAUGYaYJS44hh+KkpK0RuixC4G/+0N4akg0zYMUUXbHRFKLncKU/C0tzrscVMsp7IHFtZsarKHPbalbXSc0TPngvRYODynG1JmAFx2PWN9hGU1BEB+drjgKAqP4sjPZKZDYwhaxuqfmlA+Z+vL4NydjrHDN8MHpC/2hxPY+4G3ft5lYdgzR97ApfdgXVs1JVWasS1gg36p7MJxFer+WByhsxdEfETP02XyiYFrSNQGeu8wsAY4xGuVHwYVKXdZDkP/hNEGR4yhvLX9gl28LwrgabJ1JOfEG9T8H0g==
X-MS-Exchange-CrossTenant-Network-Message-Id: f8adfa49-f298-4070-d7ad-08de959090d2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 17:02:07.2364 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2kMnwV1XWGZmDSkVY6pdQnes6cmNZ4wNDlbN5dK++P9/w42KKDc5WR9SHc12OK04ahnJrmbX0YmXpGpMKzuGBsbKNdNfRets+9XvLVrW4Vo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF69154114F
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



On 4/8/2026 6:54 AM, Michal Wajdeczko wrote:
>
> On 4/8/2026 12:18 AM, Daniele Ceraolo Spurio wrote:
>>
>> On 4/3/2026 1:44 PM, Michal Wajdeczko wrote:
>>> We only have support for G2H NO_RESPONSE_BUSY messages over MMIO,
>>> but it turned out that GuC also uses that type of messages in CTB.
>>>
>>> The following error was recently observed on BMG after adding VGT
>>> policy updates to the GT restart sequence:
>>>
>>>    [] xe 0000:03:00.0: [drm] *ERROR* Tile0: GT1: G2H channel broken on read, type=3, reset required
>>>    [] xe 0000:03:00.0: [drm] *ERROR* Tile0: GT1: CT dequeue failed: -95
>>>    ...
>>>    [] xe 0000:03:00.0: [drm] *ERROR* Tile0: GT1: Timed out wait for G2H, fence 21965, action 5502, done no
>>>    [] xe 0000:03:00.0: [drm] PF: Tile0: GT1: Failed to push 1 policy KLV (-ETIME)
>>>    [] xe 0000:03:00.0: [drm] Tile0: GT1: { key 0x8004 : no value } # engine_group_config
>>>
>>> where type=3 was this unrecognized NO_RESPONSE_BUSY message.
>>>
>>> Note that GuC might send the real RESPONSE message right after
>>> the BUSY message, so we must be prepared to update our g2h_fence
>>> data twice before sender actually wakes up and clears the flags.
>>>
>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> ---
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>> Link: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164119v2/shard-bmg-9/igt@xe_exec_reset@gt-reset.html
>>> ---
>>>    drivers/gpu/drm/xe/xe_guc_ct.c | 29 +++++++++++++++++++++++++++--
>>>    1 file changed, 27 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>>> index a11cff7a20be..19305acb98e4 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>>> @@ -186,6 +186,7 @@ static void fast_req_track(struct xe_guc_ct *ct, u16 fence, u16 action) { }
>>>    struct g2h_fence {
>>>        u32 *response_buffer;
>>>        u32 seqno;
>>> +    /* fields below this point are setup based on the response */
>>>        u32 response_data;
>>>        u16 response_len;
>>>        u16 error;
>>> @@ -193,6 +194,7 @@ struct g2h_fence {
>>>        u16 reason;
>>>        bool cancel;
>>>        bool retry;
>>> +    bool wait;
>>>        bool fail;
>>>        bool done;
>>>    };
>>> @@ -204,6 +206,11 @@ static void g2h_fence_init(struct g2h_fence *g2h_fence, u32 *response_buffer)
>>>        g2h_fence->seqno = ~0x0;
>>>    }
>>>    +static void g2h_fence_void(struct g2h_fence *g2h_fence)
>> I'm not convinced that g2h_fence_void is the correct function name here. Maybe g2h_fence_clear_response or something like that?
> hmm, the 'g2h_fence' name itself is IMO also little questionable ;)
>
> note that everything in this struct is 'response' related, so that
> 'response' in clear_response() may also sound redundant or at least
> mislead about impact of the clear
>
> being non-native, below 'void' meanings were working for me:
>
> 	"(verb) to remove the legal force from an agreement or contract
> 	"(verb) discharge or drain away (water, gases, etc.)
>
> but if clear_response() is more welcomed, I can respin the patch

My confusion with the wording was around the fact that normally once you 
void a contract you can't re-use it, it's done.

>
> other candidates to consider:
>
> 	g2h_fence_reinit()
> 	g2h_fence_reset()
> 	g2h_fence_prepare()
> 	g2h_fence_empty()

I considered suggensting reinit, but we keep the seqno and the buffer so 
it isn't a full reinit. g2h_fence_reset might be ok.

>
>>> +{
>>> +    memset_after(g2h_fence, 0, seqno);
>>> +}
>>> +
>>>    static void g2h_fence_cancel(struct g2h_fence *g2h_fence)
>>>    {
>>>        g2h_fence->cancel = true;
>>> @@ -1331,6 +1338,7 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
>>>        /* READ_ONCEs pairs with WRITE_ONCEs in parse_g2h_response
>>>         * and g2h_fence_cancel.
>>>         */
>>> +wait_again:
>>>        ret = wait_event_timeout(ct->g2h_fence_wq, READ_ONCE(g2h_fence.done), HZ);
>>>        if (!ret) {
>>>            LNL_FLUSH_WORK(&ct->g2h_worker);
>>> @@ -1356,6 +1364,12 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
>>>            return -ETIME;
>>>        }
>>>    +    if (g2h_fence.wait) {
>>> +        xe_gt_dbg(gt, "H2G action %#x busy...\n", action[0]);
>>> +        g2h_fence_void(&g2h_fence);
>>> +        mutex_unlock(&ct->lock);
>>> +        goto wait_again;
>>> +    }
>>>        if (g2h_fence.retry) {
>>>            xe_gt_dbg(gt, "H2G action %#x retrying: reason %#x\n",
>>>                  action[0], g2h_fence.reason);
>>> @@ -1508,7 +1522,12 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
>>>            return -EPROTO;
>>>        }
>>>    -    g2h_fence = xa_erase(&ct->fence_lookup, fence);
>>> +    /* don't erase as we still expect a final response with the same fence */
>>> +    if (type == GUC_HXG_TYPE_NO_RESPONSE_BUSY)
>>> +        g2h_fence = xa_load(&ct->fence_lookup, fence);
>>> +    else
>>> +        g2h_fence = xa_erase(&ct->fence_lookup, fence);
>>> +
>>>        if (unlikely(!g2h_fence)) {
>> if we hit this error with a NO_RESPONSE_BUSY we'll release the memory with the fence still in the xa, which seems wrong.
> but NULL here would mean that the fence wasn't in the xa already

D'oh, that's true. My bad.

>
> it had to be either removed during earlier processing of some other
> non-BUSY G2H message with the same fence or it was removed by the
> caller due to a timeout or ... the incoming fence is completely unexpected
>
> and IMO we are not quite good in handling this last case and after
> xe_gt_warn() we might release space that was never reserved by us
>
> but that's not related to this patch
>
>>>            /* Don't tear down channel, as send could've timed out */
>>>            /* CT_DEAD(ct, NULL, PARSE_G2H_UNKNOWN); */
>>> @@ -1518,6 +1537,7 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
>>>        }
>>>          xe_gt_assert(gt, fence == g2h_fence->seqno);
>>> +    g2h_fence_void(g2h_fence);
>> Is this here because we might be parsing the G2H with the actual response before the waiter has had time to process the initial BUSY response? It might be worth adding a comment to explain that.
> yes, and it's already mentioned in the commit message:
>
> " Note that GuC might send the real RESPONSE message right after
> " the BUSY message, so we must be prepared to update our g2h_fence
> " data twice before sender actually wakes up and clears the flags.

sure, but in-code it isn't immediately clear that this is there to cover 
for that case, hence why IMO a comment would help.

Daniele

>
>> Daniele
>>
>>>          if (type == GUC_HXG_TYPE_RESPONSE_FAILURE) {
>>>            g2h_fence->fail = true;
>>> @@ -1526,6 +1546,9 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
>>>        } else if (type == GUC_HXG_TYPE_NO_RESPONSE_RETRY) {
>>>            g2h_fence->retry = true;
>>>            g2h_fence->reason = FIELD_GET(GUC_HXG_RETRY_MSG_0_REASON, hxg[0]);
>>> +    } else if (type == GUC_HXG_TYPE_NO_RESPONSE_BUSY) {
>>> +        g2h_fence->wait = true;
>>> +        g2h_fence->reason = FIELD_GET(GUC_HXG_BUSY_MSG_0_COUNTER, hxg[0]);
>>>        } else if (g2h_fence->response_buffer) {
>>>            g2h_fence->response_len = hxg_len;
>>>            memcpy(g2h_fence->response_buffer, hxg, hxg_len * sizeof(u32));
>>> @@ -1533,7 +1556,8 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
>>>            g2h_fence->response_data = FIELD_GET(GUC_HXG_RESPONSE_MSG_0_DATA0, hxg[0]);
>>>        }
>>>    -    g2h_release_space(ct, GUC_CTB_HXG_MSG_MAX_LEN);
>>> +    if (!g2h_fence->wait)
>>> +        g2h_release_space(ct, GUC_CTB_HXG_MSG_MAX_LEN);
>>>          /* WRITE_ONCE pairs with READ_ONCEs in guc_ct_send_recv. */
>>>        WRITE_ONCE(g2h_fence->done, true);
>>> @@ -1570,6 +1594,7 @@ static int parse_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>>>        case GUC_HXG_TYPE_RESPONSE_SUCCESS:
>>>        case GUC_HXG_TYPE_RESPONSE_FAILURE:
>>>        case GUC_HXG_TYPE_NO_RESPONSE_RETRY:
>>> +    case GUC_HXG_TYPE_NO_RESPONSE_BUSY:
>>>            ret = parse_g2h_response(ct, msg, len);
>>>            break;
>>>        default:

