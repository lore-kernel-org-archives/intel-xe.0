Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EDEECDE00B
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jun 2026 00:06:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31EB610E2CA;
	Fri, 26 Jun 2026 00:06:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LLwn0TGe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 003DF10E2CA
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jun 2026 00:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782432377; x=1813968377;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+283Mwr0zUqan3ZP97BGiU+bQF53pbKJoJDP6+YP6n8=;
 b=LLwn0TGeXpKNlQoVOX6aOfNnPMu1wy7MjLWjdxUbAjNJSbOboiW36Lee
 Q7PmZfTAY9syb2Vrt17Ww9kpqiJZz5ec+ELr2vMGsiuF2UGXR2W5MQ6YO
 2i5iVGDNkXPKFSEqtYiGbCP5kQ4tpUdHPlF9ln/qQKDeswiOEhBjpctKl
 SmeweIGznOE5kWjifzVstUyHHHSVfwnluGWDBbsSpDgWQNGQKI4LUgtfc
 927d0LUAf6kOp/uw3bom8EiB2IvggaN+13s8L2uCasNfhPISbx6B4zBo3
 7Jj02gWN1IIK8KPTTzGJ1aPN6sPHHMyryPyppOzkROeLZ8KlaXhrDKfqE g==;
X-CSE-ConnectionGUID: nseP8hujQTS25psZWAhWkQ==
X-CSE-MsgGUID: 8MhFDT53T0CPoRVKqxRX+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="83231816"
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; d="scan'208";a="83231816"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2026 17:06:16 -0700
X-CSE-ConnectionGUID: iEV/tr/ARcyZQ+JUJLweWw==
X-CSE-MsgGUID: OAjEmb/yTgCozUw7i0Ygxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; d="scan'208";a="289263362"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2026 17:06:15 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 25 Jun 2026 17:06:15 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 25 Jun 2026 17:06:15 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.60) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 25 Jun 2026 17:06:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VlvStcCEsURgUYzMKqsu066Qu8rJupiarK2lc37KuRxitGkK9sx/pbz9+SK9mQsPBLWyFVd954WCRA+FL5L/qJS+6otc0LEttGnuNXRV0+EU6FQFiYRXdrbrplTG+2YuSI9X0IqwwtuiQcGfzZCqdP1cBmaXTGkbvF7W3gCKELXTR5w6ia1TC2iN4aevELVvm1hO5Tjmy4d2D+SOShUMvLzX+ph8DKg/nj8gdV5QeTd02SQtQU6v5kla0FyJwMDrtt2ghPx5AntpaHsjuDLaKJkaLizhSSFnUyhmfFZgc73WldeWrKBukV/x+IkUEHf7BpShAqdfJ3Zw69G7P4RU4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vJ7Qq3C2BOUjGO3oOHSOrNgQI8R7QI4YujMQwL3jeoM=;
 b=PpM8EfuCVzZibRM+SgRAch/hXvgANnXRLefx0LH8eO9lRPaKg7A/dmMj8FcSshE/jkpxY4VZIBDO/V8ex3q31UTdQHLxx2lZJkFDJcGedH4MKr/gS+LrziVOkmaAUvkYjL/LalBP8GHvOGr8IzipRbWlQULbEjx9Q4qdXIrpzr/Anhfvwx7yiiAxwPjpatFP1/0oi+gMfcRsF8ph0vk3na5pOKDWE1aPbC6mvDHbcGdmdQ2o0bcss+dYFP3CM5aZ8KDdFUCbzC8VlEnieviFQcAJ8NN0kINH2XBEHabbi5h5ZTa6eDyabPXKFqJ+n+O9oS+oydAdUPZ0vIl+WXdyxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4979.namprd11.prod.outlook.com (2603:10b6:303:99::16)
 by SA0PR11MB4591.namprd11.prod.outlook.com (2603:10b6:806:9c::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Fri, 26 Jun
 2026 00:06:13 +0000
Received: from CO1PR11MB4979.namprd11.prod.outlook.com
 ([fe80::ed0a:e4ab:fde6:edcc]) by CO1PR11MB4979.namprd11.prod.outlook.com
 ([fe80::ed0a:e4ab:fde6:edcc%2]) with mapi id 15.21.0159.014; Fri, 26 Jun 2026
 00:06:12 +0000
Message-ID: <997fcd13-eb94-4770-a3b2-4d2d633e2985@intel.com>
Date: Thu, 25 Jun 2026 17:06:12 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 05/10] drm/xe/exec_queue: Introduce
 xe_exec_queue_reinit()
To: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <rodrigo.vivi@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <riana.tauro@intel.com>,
 <michal.wajdeczko@intel.com>, <matthew.d.roper@intel.com>,
 <michal.winiarski@intel.com>, <matthew.auld@intel.com>, <dev@lankhorst.se>,
 <jani.nikula@intel.com>, <lukasz.laguna@intel.com>, <zhanjun.dong@intel.com>, 
 <lukas@wunner.de>, <badal.nilawar@intel.com>
References: <20260603101814.916948-1-raag.jadav@intel.com>
 <20260603101814.916948-6-raag.jadav@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20260603101814.916948-6-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0141.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::26) To CO1PR11MB4979.namprd11.prod.outlook.com
 (2603:10b6:303:99::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4979:EE_|SA0PR11MB4591:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a309f4d-28ac-44d8-5af5-08ded316bbd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|18002099003|22082099003|11063799006|4143699003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: d0229jB1k7j+YypAHtOKt+88UBIqnMRHKXQOz1Cu17KuxRh3ruZDkDSHj9QC1WiYlUKUH6EIPqG8e/fu7m0vdDxvNVz6egFrZOqtTX8vh+UGSMi2mw5Ssq2cWTzZVcFsjjoICxZRIX3GyJjSlrWzDNsFWDhLf0HZMd/IvB1AcbqszFUWV3afYPvj9aK3p6rfi9nWAHZ/RnGB3jIZ3GgGGZTk51v0rv6M4WrIsBWXSxlo6QmFwWth65NMKX++Jfpk5VmkoLoRocwaFN3rJs8Y348p+dTDmSYC8Sn7mvrNgv1JhEOfGN3e6xUcUpfiON/+E3RNbIr7TGuhHYPsxGqoFVUekzWZwuzUGeGYsQJPqylZoCP1NvOA0eFzETKIkb8Sao2Y3La32n3i+FR75xgjurjU82sIYYLIZuYw9MkPWBSjAzp7QG9Q0jj9iEtohvEzUtuPsxHtKrPNZWSvWE/+6CbxSLbfGZOs0F7PW+ldscu/BNDCl6a7nkqNV4haUYxJcwVqhjxo6AMg+J4WYkKzZp4raBJ5fESyIrDZ2d7m6J58R9jmeBeoigQhlNjy/lZcQQ/vs0aVo2nVcWOSye71yMboJzD5PDry5FCyx5rNsuYMsiTEuE/0Nx3c0q82IJ+5tDKJV6bTqH8NxRDOO0hgWP+osQqwAV4MMKCHR0Z8zUI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eVJtTy9ySFNteDVuMVloNEN2MVZUdkcyRWdhRlNDS0txRHhOSTRZRTRqWG5l?=
 =?utf-8?B?N2ROd21jZG5GbUNMZUVCWUdMMzJKQU1SNlRQQkJYQU9Qc1Z0VURFOVhGMzJ1?=
 =?utf-8?B?S3NtTEdRRmR2cytVbW9UMFUxYzVZdE5FYjBQMjJSYncxdTNOdzhLV0ZzQzky?=
 =?utf-8?B?S2tXNjVIREs0cnVrWlFIMGx3Wmw0VmFYVFl5c1hING5rN2FDTkMveUFCaGpD?=
 =?utf-8?B?MnZFekdnYlNpQTlmVzB3UkJndjBjN1pHcmhzdHVmSElObXJrYU5YVVh0Y0s4?=
 =?utf-8?B?NjF2Q3N0cWZnaE4rcUhGSEFNY1NZOGd2NnJxV0k5U2UwUFVkQWUxNERDdU9x?=
 =?utf-8?B?ekwrQ2V1ck9oNjVSR0NYUGdmaHdxVXhjU0kzMHpYMzBmMlFkQUpYT3BMTzg4?=
 =?utf-8?B?cVJCdDB6SnJ1WHhSWERWWVBCVjBOU2t4T2VVN2dydDlBTGRtYTlSdGx6eW5T?=
 =?utf-8?B?S05DVFphQTlxbHJNZWUvZ1NHUjV6N3ExWmxpcEw1Kzgyci9sSTNUOEJLcThQ?=
 =?utf-8?B?WEJ3Q1Z3RDk4azBwRU5mMVg3YUFLOU5hMjUveS9DcUpjZFRLOWU1V1hFN1lp?=
 =?utf-8?B?WjhidzhPVXZtRlhSRFUwTFJXdWFITjJzTlNTZ05VOVRteFVPZ1JSaGtFZVJ4?=
 =?utf-8?B?NEhHQ3dpYS9UekdXS2hHN2lacUozYUF5dlBBbVB0Z2lrczdibTFzWW1LaEdP?=
 =?utf-8?B?M1dDcGNlTS8xckdDRDA2WlE3bW1rMmhicnZxQUE2NndXdUx5WWhEcGtPdHRj?=
 =?utf-8?B?ZXFiSnkxU3hDL0NRZWNaZ3RMVktEQ2xBNXJNZWppUlFxaUh5YmtXRWNlT2dr?=
 =?utf-8?B?QVg1blFYUlVUdjRnKzUzajc1QVY3MnI0aXZiTVlGZkF2QTlwcUw2VkFuZU1D?=
 =?utf-8?B?Z3ZkUUpFOFBFa0tScU9YV1RjUlZkQmZraENkSy9yNjZKeHZhMnhIbDJvTWxt?=
 =?utf-8?B?OUE3ZzlZOEdlSEl6UXdSSWM4eXIzZ21MQnVDc1lUMWFJbW5ZVlpNSndUenMx?=
 =?utf-8?B?dzFNQlRERWozM2tlQmhIZGJieWNnVmpaTkdreHdQMlVocWlYVElkNGl5bU5F?=
 =?utf-8?B?V1N2NGt5aHVKbWZER2p3ZEh2cmx3anZIQlpwTE1UUm5EK1RoNmF4Rms1eWJK?=
 =?utf-8?B?RVR2aDl2cFpOYWpxWmRSbENoUXh0L200eU41UFgrOFNxenpZdGh0Vlhad2pR?=
 =?utf-8?B?TXJQWlI5bzY0OXNOMnc2UXJxRFJhMW4yU0lmUTB2bG9VUDcwMG1GYVROSE0v?=
 =?utf-8?B?a3NFMUxmUXkwWGl2Y3JOb3NjaXAzdG5wWEVCaTVFSHdsRWtlTlljTGpVYXVW?=
 =?utf-8?B?LzhVd1NQYkpoMWgycFNha01zSUNETmR4ZEVSSXdOekFBVU5pSnZrKzgvSHMz?=
 =?utf-8?B?cFZEb0ZWNUhmNHFhbFFuMHo4MWFiYWY3cExNZVFaVWlKMTRrUFkwTW45bmcx?=
 =?utf-8?B?Yno5ZU84cEJXeFBwNHZDdTNCS2ZQSjMrN09FQ2hhM25abHltaVNpeEJGazFt?=
 =?utf-8?B?b2ZXRHlmRFVHK2Q0bjYyTVRtVG5zYkVVRkVYamlIZE1BYzNMNklZaTBMNlhM?=
 =?utf-8?B?YXNYZ0E0aFZmdGpMMnR6NVdUYUtvSVEyejY2UVpKcEhSSGRaYXRHcWhQOXdn?=
 =?utf-8?B?TVVPVDI0UHlMeEtKMnZ6V3ZnSVhHZEduSVVlVlNIdDBVS0FtejhaNHBjdjRo?=
 =?utf-8?B?WjIrcTNUSDlBeDMxRG92a0lxeC9mZHFoOU11a3puaW9tZHlGb1BGditndW03?=
 =?utf-8?B?alZ2TSswRFNSY0czcW8xY3VjOGh4djE3bW1sVmp3cnRWZllJV3JKSWZGL2h3?=
 =?utf-8?B?T2dxZ3RqMHNGMWlqWW1nMk9HeGVVaUdpTEVpNEdpUWxXR3UySDl4enZ1SkRt?=
 =?utf-8?B?bmJ3NXhPYlBJdjFqTWNZVXZQWnY1ZnpzZVFIWWM1cGJ3engrZkRLVTIzRU9p?=
 =?utf-8?B?K2pjaWNvTFlwMVUxKzBXS09lVTRnRU9kUjVCb01TU3BTbWZZL2dXUk5QVW81?=
 =?utf-8?B?aXpDczN2Yi9ZSmFWR3grOWt3ZlAzbTVQRUdiU0VHT1V2K0g5OVM1M3VreDdT?=
 =?utf-8?B?UHN1dzlHd2xYN2dPd1FUd0s2N1pwVkJPYXhKeW5aMkIwUWQ0WGxaaFdPbzJR?=
 =?utf-8?B?QUcvS0lPV3F5eWRlY3dnVWI0cFlXYmprNGxPT0pOejNXSExKbUVyWExWUkd6?=
 =?utf-8?B?ZWQzbGQrcnk3RG5HT2gvS0pQSjJBMkJIdGtFRllKRUtNVm9meVBoQXBQWldN?=
 =?utf-8?B?ZG1SNzVReGVjQUdIT0RyQWEwVEl2Y0d0ek83ajZUL2tkY0V0ZHJOQUFoRmV3?=
 =?utf-8?B?WUhjdTF0ZngxaW44UkpBdlVYK1YrTCs1K2dyUG9YQnJzNHNFMy9sYzM5S3pz?=
 =?utf-8?Q?p2Ov4uMLBRZt8GKw=3D?=
X-Exchange-RoutingPolicyChecked: Y76QhYvTW4R/9KRcU679s0nU/RC85pMzKB4wljYiEJdhkeuRu01vMiIwyIYiEZAv9HXoaneZ4+71XKYDbqp/9zYr/XxwbsucTLkz5m1Fl07QYvTnMd1HZKZp3hv5CB0NM1VvI589pCD0NgdtPazDASGkK8xdbDy8kK0mp4531O3jer6JHsBuvbJ3n3DkzoZsUftwGQXFt2vd2S0UfaVElOrNMKEixvTwtHBM/yIyzVK5NJM3ZP722Ypo+b4HUUkqwpRFocPmVHfEYD9q98pnuAvCGfQtISXhHpCVg6zCW6dcVTHMp069lkHeJj1gb5qOysC6hYMfyhL3H+dnMTPgiA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a309f4d-28ac-44d8-5af5-08ded316bbd3
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 00:06:12.8899 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vL3iCw7+R/MakdjeNrmIfzCu/W74ZNvjmMS9P4HB0vx+NqdinZk3ZkS+1rp7qBGn+dkPJthaT+VtqMcznnNJP8HnPEakFfV2bW3Rm2E4/FE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4591
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



On 6/3/2026 3:17 AM, Raag Jadav wrote:
> In preparation of usecases which require re-initializing exec queue
> after PCIe FLR, introduce xe_exec_queue_reinit() helper. All the exec
> queue LCRs already exist but the context is lost on PCIe FLR and needs
> re-initialization.
>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> Tested-by: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
> v2: Re-initialize migrate context (Matthew Brost)
> v6: Add IS_DGFX() and EXEC_QUEUE_FLAG_KERNEL asserts (Daniele)
> ---
>   drivers/gpu/drm/xe/xe_exec_queue.c | 42 +++++++++++++++++++++++++++---
>   drivers/gpu/drm/xe/xe_exec_queue.h |  1 +
>   drivers/gpu/drm/xe/xe_lrc.c        | 17 ++++++++++++
>   drivers/gpu/drm/xe/xe_lrc.h        |  2 ++
>   4 files changed, 58 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 1b5ca3ce578a..91b241a7ab24 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -335,9 +335,8 @@ static void __xe_exec_queue_fini(struct xe_exec_queue *q)
>   		xe_lrc_put(q->lrc[i]);
>   }
>   
> -static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
> +static u32 xe_lrc_init_flags(struct xe_exec_queue *q, u32 exec_queue_flags)
>   {
> -	int i, err;
>   	u32 flags = 0;
>   
>   	/*
> @@ -360,6 +359,13 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
>   	if (q->flags & EXEC_QUEUE_FLAG_DISABLE_STATE_CACHE_PERF_FIX)
>   		flags |= XE_LRC_DISABLE_STATE_CACHE_PERF_FIX;
>   
> +	return flags;
> +}
> +
> +static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
> +{
> +	int i, err;
> +
>   	err = q->ops->init(q);
>   	if (err)
>   		return err;
> @@ -383,8 +389,8 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
>   
>   			marker = xe_gt_sriov_vf_wait_valid_ggtt(q->gt);
>   
> -			lrc = xe_lrc_create(q->hwe, q->vm, q->replay_state,
> -					    xe_lrc_ring_size(), q->msix_vec, flags);
> +			lrc = xe_lrc_create(q->hwe, q->vm, q->replay_state, xe_lrc_ring_size(),
> +					    q->msix_vec, xe_lrc_init_flags(q, exec_queue_flags));
>   			if (IS_ERR(lrc)) {
>   				err = PTR_ERR(lrc);
>   				goto err_lrc;
> @@ -406,6 +412,34 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
>   	return err;
>   }
>   
> +/**
> + * xe_exec_queue_reinit() - Re-initialize exec queue
> + * @q: exec queue to re-initialize
> + *
> + * Returns: 0 on success, negative error code otherwise.
> + */
> +int xe_exec_queue_reinit(struct xe_exec_queue *q)
> +{
> +	int i, err;
> +
> +	/* TODO: Re-initialize GSC and PXP queues */
> +	xe_assert(gt_to_xe(q->gt), IS_DGFX(gt_to_xe(q->gt)));
You can use xe_gt_assert here. Also, note that us not supporting GSC and 
PXP on discrete is a choice, not a generic requirement, so IMO for 
PXP/GSC checking it'd be better to add:

xe_gt_assert(q->gt, !xe_uc_fw_is_loadable(&gt->uc.gsc.fw));

xe_gt_assert(q->gt, !xe_pxp_is_enabled(gt_to_xe(q->gt)->pxp));


> +	/* Re-initialization only allowed for kernel queues */
> +	xe_assert(gt_to_xe(q->gt), q->flags & EXEC_QUEUE_FLAG_KERNEL);
> +
> +	/* Re-initialize submission backend */
> +	q->ops->reinit_kernel(q);

Thinking about it, the xe_sched_reinit() call from patch 2 could be 
moved here since that's not back-end specific.
I won't ask you to re-spin just for this, so I'm ok with it being 
considered as a follow-up, but if you need to do a re-spin anyway it 
might be worth doing it now.

> +
> +	for (i = 0; i < q->width; i++) {
> +		err = xe_lrc_reinit(q->lrc[i], q->hwe, q->vm, q->replay_state,
> +				    q->msix_vec, xe_lrc_init_flags(q, q->flags));
> +		if (err)
> +			return err;
> +	}
> +
> +	return 0;
> +}
> +
>   /**
>    * xe_exec_queue_create() - Create an exec queue
>    * @xe: Xe device
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
> index a82d99bd77bc..445867d4da26 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
> @@ -34,6 +34,7 @@ struct xe_exec_queue *xe_exec_queue_create_bind(struct xe_device *xe,
>   void xe_exec_queue_fini(struct xe_exec_queue *q);
>   void xe_exec_queue_destroy(struct kref *ref);
>   void xe_exec_queue_assign_name(struct xe_exec_queue *q, u32 instance);
> +int xe_exec_queue_reinit(struct xe_exec_queue *q);
>   
>   static inline struct xe_exec_queue *
>   xe_exec_queue_get_unless_zero(struct xe_exec_queue *q)
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index a4292a11391d..c425269893fe 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -1629,6 +1629,23 @@ static int xe_lrc_ctx_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct
>   	return err;
>   }
>   
> +/**
> + * xe_lrc_reinit() - Re-initialize LRC
> + * @lrc: Pointer to the LRC
> + * @hwe: Hardware Engine
> + * @vm: The VM (address space)
> + * @replay_state: GPU hang replay state
> + * @msix_vec: MSI-X interrupt vector (for platforms that support it)
> + * @init_flags: LRC initialization flags
> + *
> + * Returns: 0 on success, negative error code otherwise.
> + */
> +int xe_lrc_reinit(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct xe_vm *vm,
> +		  void *replay_state, u16 msix_vec, u32 init_flags)
> +{
> +	return xe_lrc_ctx_init(lrc, hwe, vm, replay_state, msix_vec, init_flags);

nit: I wonder if it 'd just be easier to just export xe_lrc_ctx_init 
instead of creating xe_lrc_reinit. Not a blocker, so with the asserts fixed:

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> +}
> +
>   static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct xe_vm *vm,
>   		       void *replay_state, u32 ring_size, u16 msix_vec, u32 init_flags)
>   {
> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> index 0a3a611391ee..333b11f739ea 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.h
> +++ b/drivers/gpu/drm/xe/xe_lrc.h
> @@ -56,6 +56,8 @@ struct xe_lrc_snapshot {
>   
>   struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
>   			     void *replay_state, u32 ring_size, u16 msix_vec, u32 flags);
> +int xe_lrc_reinit(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct xe_vm *vm,
> +		  void *replay_state, u16 msix_vec, u32 init_flags);
>   void xe_lrc_destroy(struct kref *ref);
>   
>   /**

