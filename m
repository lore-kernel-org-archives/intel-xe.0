Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3901C4345F
	for <intel-xe@archiver.kernel.org>; Fri, 12 Apr 2024 17:07:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04B1B10F1D9;
	Fri, 12 Apr 2024 17:07:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FjnTEVff";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7071410F1D9
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Apr 2024 17:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712941642; x=1744477642;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=+IVbCgZKHiTrARXU7UWU3c0W20prB0Xn3/3oYLrXew0=;
 b=FjnTEVffnhIuiZgDNnyNngVsoDKZHOFvEex27Vv0zYtha+e3swh8i/gj
 yFygLkwmVzJxNQ6RfTyzbH8rBxgxMuhba8Ho55NYMwbsIBJfUnv+a5RJJ
 zZRgXjnB0AqIaNEQzyzd61Okcr8uzMyXi6lN5rL3Ktw7Hwe/M9Fezwsll
 a6fAWDU2IW26Gg6r9AiJMPx4cgV89zsL0tqs/HQfPZfHVahJilqUCTNTP
 MIVZ/ETlW943/OeZTYL8SvAtQcRkroYIM/1cOYYdyR5sEgyrMWeESNbF5
 DE1CURPKyxD0Y3CqS4j5t3uZERD9nP7LgX9i5iq4FWVxYePfXVrSAcMIs w==;
X-CSE-ConnectionGUID: AHi7FemORkygOchFtfLPhg==
X-CSE-MsgGUID: BLH65SHCRzKXDAZC3JLBCw==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="25863129"
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; d="scan'208,217";a="25863129"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 10:07:21 -0700
X-CSE-ConnectionGUID: 9vcbUYjNT/iDu1CRKo68PQ==
X-CSE-MsgGUID: RCTIzpjKSYijwM3fFvKgEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; d="scan'208,217";a="58706922"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Apr 2024 10:07:21 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Apr 2024 10:07:19 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Apr 2024 10:07:19 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 12 Apr 2024 10:07:19 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 12 Apr 2024 10:07:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kEFzRJE+Q5OycGG5dOJTkUbKWk2yy+JJm8mSuq0dGoOb5uK1GU3Z5Rf0gTe+nrW/uMMBO7KTddQB9HzPOJvXWUhLDDm/Zf73qqNL0Ui9tqN7hQQIgTK1T3KyI+xwFSG/oipPoJGHW4M3D5ZOY/PxTa0N+WSK490bFFv7/zfeNzpcEwvzy9e+MPEwG6cwhPfB2O9F2MTSqjElg/rJcM2NBsDRPPZtw/oszw8Kl8UHfQIsx2Zb27b2+i0chHR35GmvXDl8QiYhfM8JZOSMu29WtPANNVrCtuSo9SEGQQahj5qYFbLCdSCwroVZD6I8CgEk18EfGQXuEUKeKrMhh9Maqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3r3wBQn2hqYZ7cIoUty+CGoBg1A7hXJfHHH3Z+sJTqA=;
 b=aw3ASRLlWaUq8f8F06yO8rpQ6MFGOkMnh2gU2oqIKCx34EvTrThsNP5dQtZ64oLqQWBjzIJOEPw8uDAR19EFmw2mmWqZVreE5d+Nnw0QNvTn4HNj2LwHGlTniFlOMI76ifjilENuV8vU0ZYZgO6plFdFBfPZGPGKdQmod4meL9ZsXERhfFr6o9m1Jmhk4v6pTyPgghObBv3Aj67b9HLS8uI1OdLXxPIRbaaV6wWu9jy6QP3MRGf7MantKa/XK7NVROQRcVAgR3ufZyoD9mEyQm/xYmUv5KipTMjXJ/hgVb9/oa/0BkJV/0EvWFHpSt/yN6CH0wmVnKofkFLNFGxgew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by LV8PR11MB8723.namprd11.prod.outlook.com (2603:10b6:408:1f8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.26; Fri, 12 Apr
 2024 17:07:15 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93%3]) with mapi id 15.20.7472.025; Fri, 12 Apr 2024
 17:07:15 +0000
Content-Type: multipart/alternative;
 boundary="------------w2agRxqJ1LgGspsDPjI9NF5l"
Message-ID: <c82e275f-f075-4c09-8552-8e978be33652@intel.com>
Date: Fri, 12 Apr 2024 22:37:09 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/7] drm/xe/pm: Capture errors and handle them
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240412080245.1044902-1-himal.prasad.ghimiray@intel.com>
 <20240412080245.1044902-8-himal.prasad.ghimiray@intel.com>
 <7ioxhkpm4jidj5m4hcc5jsatfk333d4sgso7o5bl2pqmq5xxyc@36dmyunxbviy>
 <5a419e94-cb1d-42d4-9584-29c842c7cca6@intel.com>
 <ub2u2jq47h5uy7zydrmoewdad644qf5eo6finfz4mfpwa4orm3@22uzbbikjtkw>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <ub2u2jq47h5uy7zydrmoewdad644qf5eo6finfz4mfpwa4orm3@22uzbbikjtkw>
X-ClientProxiedBy: BM1P287CA0019.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:40::30) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|LV8PR11MB8723:EE_
X-MS-Office365-Filtering-Correlation-Id: 6618d251-b8f8-4f60-5d08-08dc5b1300a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kvey8bMKiewB3WCzebNIt6ZYfbDYXUDQ32MHp3NooYp2Q8AvJXyKd0Pb1Y46yXaukAqfb3ZnNYYDER1K4opHf64S4gxbDlr14BFSPDkbrWAgaLZfeJIBukje2toZ2LL7u3Tw0CmgJX4YePYAy8iAzHX0MTt577ZkM73csmms/71B6mKDUnqMyl+eG5lFHCqs1mM5Z4phMSyiYpcWHOyLVikoRy9mIxcpjw3nx+ReKfi1sWusmdo/QXt5GDkRxGIdZEYtGWNQjyQ5o81nuCAlQ/3exCYATQi+L6M/rOUuX+IPiMn72o2ABFwkGUnH97rFZggH8YYpjpFyWGHXDVg5yVTW3yawmg9HlWaKCQucx8G6eXIxyvlm794DDVA4EMJNnHNSZownkZsX1I83kfkNBKODXrLYXQ3M5Zhgd69eMgMBkZiemfQHu7Ku6TvtQEqRyxumcijoOc81tvOWz7UBLMkBXTi2JLaj57rfihNVkBlC4/GAL4SkKH8u112zyJG01bUFWqGWThuTKdtlwqLQtVVOXZC7twjeiu4VocljrInB8bGohGSASg4LM0idcr0QxwZ7T35ZGsylWrZceunckrR38NDi3Y97/uXqEdH76f0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qm1Sa1liZ25nWUN3VTVrZ0tDRzFwMnB5OTd5Z0xjK0xxaTl3Nm1SZjA5eXZ1?=
 =?utf-8?B?S0tDSmZCZmZnMksxeEF0RnQxSUFLK0xKRS9xUXI3MFd4dTRVZnhLTkNKVU10?=
 =?utf-8?B?cWoyRWVZOHFuSzNTdmhJcldVSHg4ZlE3QXQxcEJ4U3Z4NWIyMUlOYjRjdWhG?=
 =?utf-8?B?bUhyUjhON2dBeTdrWVVaNEFlZFN0ZnFJd0V3bi9Kd1E4clVhaE5xa0ZsbG52?=
 =?utf-8?B?aFN6TjZ2RklDdGN6Tlg3dmxLSDREcHdDMlFhYThQd0NJdzgyTDF4ajRlZ1o3?=
 =?utf-8?B?L0VacHNpZTljNXR1MUpZK01Bd2tZVHlHckhsUUlRODlkSTQ4THo4WHQ2VTlL?=
 =?utf-8?B?aHRzd1YzMmk3Y2xhMzdtUGRuYXp2NXkxejZhamZWZWMxNzJLTi9qWWdGZXNi?=
 =?utf-8?B?YWxPMGZnM2NRVVBTNlFzZjBtRHQ5R09DS2pESHZkMjViM2Q0UmVBSk94bWtS?=
 =?utf-8?B?RkVTTHBKcUx0b1B4b2xzZGNucHVXUTFhWndia2R0cWhGdjJCNjA5UWhXZnJl?=
 =?utf-8?B?eUFIVHRkVDE1eUVOQnQva2ZDZXY2Nmg3UDFVeFFXTnJKSGtpTFF6SWFOU2s3?=
 =?utf-8?B?SWdMZkkvZ2QzNllQQjZ5cjVpMDhQYWVkampNLzFYaXBVT3BMbUw3VEFPMWZ4?=
 =?utf-8?B?d0UvcjQxMmNXSTJtZkUwNUFVNnc1dmx5MHh1d1BjeEZNOGJ2cjM5eGFmeFhG?=
 =?utf-8?B?OFlPazMvSlgyWTJlUGhCR0FhVGVwKzFUSit3Z2xtcmVENlNDeDI0bnRHRVBN?=
 =?utf-8?B?cHI0R0l1OXlVUWNtYk1ZZVVIcGVNUENtNDRtSG41dnF3VHdvalJMZW5FMXBG?=
 =?utf-8?B?SnlPN2Y4Y2hzcW0ycVI0Ri9EKzJpQllBQldhSFJ5ZzUwNUdMNXJybGxBOE5h?=
 =?utf-8?B?aDZ6TjRudzNVdFZxeWRzSjdRYnNKRjBaUW9uY1VjSlJhdm41cDhieWwyZFcw?=
 =?utf-8?B?ait4b1VlZjRMM0pxK24xU2l4V2J2YVo1NGR5UUJ2S3ZZc0Z1VFRLTndGNkpH?=
 =?utf-8?B?Rnd4ZnI4akk0MG4xdGdoT0R1d1kyem1raHZCNlc5RXZZKzFvRGpDZUFJOXpX?=
 =?utf-8?B?L010d0JmMFREdkIxQ2pMRzgvVXdqNVhnQkdtTHJrSUJWS014RTZOTnJ4bExR?=
 =?utf-8?B?VWhGNmxYdW5GZElkbHFHY1BrL2ZKdUYvUW5WM2JHVWIvNU1oTnlKTUsyOXpV?=
 =?utf-8?B?YTdSRWdoYzNqSTRGclhFRXZtZy9hRUNKeFhrNm5ZUkRMYUd4OWZ3NTlDUnp6?=
 =?utf-8?B?SWdWTTVUMTZSaGdXU3JWcnc1eUlwQzNJZDB5S0w1ZWJEQjNQeit5cGlQbzhu?=
 =?utf-8?B?dHJEQm1yU214b2VlVVdJN2k5SVdxM29sM3pnazA3TG9jODRCWDQzajN3NytB?=
 =?utf-8?B?SG03VXFaYk1JQVVQRGJ0eTNuRzJ3NjBpWU9VMFhrNDFqVThqYWg3SXVqTEFs?=
 =?utf-8?B?Z3lwNEhiUHYvYmtxMkZ2akF2RCtscHkwUVl4UG9HVVB2K0QvRkJCNDRJekhK?=
 =?utf-8?B?eVBacWhNelZ6R1ZDcDlhVEpxOEhFUVdZWnZMQkpaZEVLVnRiQXVJRmVWUVZN?=
 =?utf-8?B?RXlqNFExeDh4RE9OZ0lQeEZKNW1jcDl4dzU5N3UzYmNmS0QrVlFyZDJsMlF1?=
 =?utf-8?B?SnJDSnBZcnNqRnNVQ0pIWTNRbUtSS0ovakJWZzVPS0NId2RJQ2hHUHJmY1FO?=
 =?utf-8?B?dWZNMUVkbDEwNGFWc2Q5NHBTU1h5VUpNSkRaeUFnZFRFNVRBWTVmbndybUZI?=
 =?utf-8?B?cU1MRStCNy94bVBTNHdTVzhjRm1yT25RY3dQbjBIUm9YOThXUEtlU2NWYzAr?=
 =?utf-8?B?N0dpU1oxbXZqKzVycWxYUWxlTnlka1lXOTNOWEpHK1ZidHBCaTFWR29vb25y?=
 =?utf-8?B?TDNJQWswSVB0WjYySHBGMzEvaklqRkVjSGlkNHRMdlBXampDSERza3pOUGpr?=
 =?utf-8?B?MUNwODVjNUVIWE9lRm1RRUZBY2dGRmZKUXhxdzcvajN1MGE1aE11aHR5blJK?=
 =?utf-8?B?QjJMenlrWDFmUjIwREl5V3dLZml6SjNta2ozQVFGV1BWcGRMWllUNmNucnBm?=
 =?utf-8?B?TmRvZWhrUnhmYm9Md29ESVY2blFsdVV5ZkIvZitTNE9EL2hmY3JzTG91YXVJ?=
 =?utf-8?B?UnBkRDFqMzhVTU8yRWtySFNORzI1Y2V2eWp0RjI4RHFZUGREcHNoWWNnalZm?=
 =?utf-8?B?K0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6618d251-b8f8-4f60-5d08-08dc5b1300a2
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2024 17:07:15.6201 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1LwIbwe+M6VY1XNHqfEw0bcjsT3KECPoF5l9rSmUJ3eh800eEK1kgeoJkiE5bnwY3udw1IJVW0ASkxsaHemOUzNt/5OP/E5LPUphsVvuWJk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8723
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

--------------w2agRxqJ1LgGspsDPjI9NF5l
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 12-04-2024 22:28, Lucas De Marchi wrote:
> On Fri, Apr 12, 2024 at 10:01:20PM +0530, Ghimiray, Himal Prasad wrote:
>>
>> On 12-04-2024 19:12, Lucas De Marchi wrote:
>>> On Fri, Apr 12, 2024 at 01:32:45PM +0530, Himal Prasad Ghimiray wrote:
>>>> xe_pm_init may encounter failures for various reasons, such as a 
>>>> failure
>>>> in initializing drmm_mutex, or when dealing with a d3cold-capable 
>>>> device
>>>> for vram_threshold sysfs creation and setting default threshold.
>>>> Presently, all these potential failures are disregarded.
>>>>
>>>> Move d3cold.lock initialization to xe_pm_init_early and cause driver
>>>> abort if mutex initialization has failed.
>>>>
>>>> Warn about failure to create and setting default threshold.
>>>>
>>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>>> ---
>>>> drivers/gpu/drm/xe/xe_device_sysfs.c | 12 ++++------
>>>> drivers/gpu/drm/xe/xe_device_sysfs.h |  2 +-
>>>> drivers/gpu/drm/xe/xe_pm.c           | 34 +++++++++++++++++++++++-----
>>>> drivers/gpu/drm/xe/xe_pm.h           |  2 +-
>>>> 4 files changed, 34 insertions(+), 16 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c 
>>>> b/drivers/gpu/drm/xe/xe_device_sysfs.c
>>>> index e47c8ad1bb17..21677b8cd977 100644
>>>> --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
>>>> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
>>>> @@ -76,18 +76,14 @@ static void xe_device_sysfs_fini(struct 
>>>> drm_device *drm, void *arg)
>>>>     sysfs_remove_file(&xe->drm.dev->kobj, 
>>>> &dev_attr_vram_d3cold_threshold.attr);
>>>> }
>>>>
>>>> -void xe_device_sysfs_init(struct xe_device *xe)
>>>> +int xe_device_sysfs_init(struct xe_device *xe)
>>>> {
>>>>     struct device *dev = xe->drm.dev;
>>>>     int ret;
>>>>
>>>>     ret = sysfs_create_file(&dev->kobj, 
>>>> &dev_attr_vram_d3cold_threshold.attr);
>>>> -    if (ret) {
>>>> -        drm_warn(&xe->drm, "Failed to create sysfs file\n");
>>>> -        return;
>>>> -    }
>>>> -
>>>> -    ret = drmm_add_action_or_reset(&xe->drm, xe_device_sysfs_fini, 
>>>> xe);
>>>>     if (ret)
>>>> -        drm_warn(&xe->drm, "Failed to add sysfs fini drm action\n");
>>>> +        return ret;
>>>> +
>>>> +    return drmm_add_action_or_reset(&xe->drm, 
>>>> xe_device_sysfs_fini, xe);
>>>> }
>>>> diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.h 
>>>> b/drivers/gpu/drm/xe/xe_device_sysfs.h
>>>> index 38b240684bee..f9e83d8bd2c7 100644
>>>> --- a/drivers/gpu/drm/xe/xe_device_sysfs.h
>>>> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.h
>>>> @@ -8,6 +8,6 @@
>>>>
>>>> struct xe_device;
>>>>
>>>> -void xe_device_sysfs_init(struct xe_device *xe);
>>>> +int xe_device_sysfs_init(struct xe_device *xe);
>>>>
>>>> #endif
>>>> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>>>> index f1fc83845c01..f4d9441720b4 100644
>>>> --- a/drivers/gpu/drm/xe/xe_pm.c
>>>> +++ b/drivers/gpu/drm/xe/xe_pm.c
>>>> @@ -208,10 +208,25 @@ static void xe_pm_runtime_init(struct 
>>>> xe_device *xe)
>>>>     pm_runtime_put(dev);
>>>> }
>>>>
>>>> -void xe_pm_init_early(struct xe_device *xe)
>>>> +int xe_pm_init_early(struct xe_device *xe)
>>>> {
>>>> +    int err;
>>>> +
>>>>     INIT_LIST_HEAD(&xe->mem_access.vram_userfault.list);
>>>> -    drmm_mutex_init(&xe->drm, &xe->mem_access.vram_userfault.lock);
>>>> +
>>>> +    err = drmm_mutex_init(&xe->drm, 
>>>> &xe->mem_access.vram_userfault.lock);
>>>> +    if (err)
>>>> +        return err;
>>>> +
>>>> +    /* Currently d3cold.lock will be used only with GuC */
>>>
>>> it's cheaper to just initialize it regardless so this can be simpler
>>>
>>> int xe_pm_init_early(struct xe_device *xe)
>>> {
>>>     int err;
>>>
>>>     INIT_LIST_HEAD(&xe->mem_access.vram_userfault.list);
>>>
>>>     if ((err = drmm_mutex_init(&xe->drm, 
>>> &xe->mem_access.vram_userfault.lock) ||
>>>         (err = drmm_mutex_init(&xe->drm, &xe->d3cold.lock)))
>>>         return err;
>> Looks clean. Will prefer using this.
>>>
>>>     return 0;
>>> }
>>>
>>> or keep the err assignment separate, doesn't matter much. But
>>> when we mix success and failure for a return-early style it makes
>>> it harder to read.
>>>
>>>>
>>>> /**
>>>> @@ -219,20 +234,27 @@ void xe_pm_init_early(struct xe_device *xe)
>>>>  * @xe: xe device instance
>>>>  *
>>>>  * This component is responsible for System and Device sleep states.
>>>> + *
>>>
>>> wrong line
>>>
>>>>  */
>>>> void xe_pm_init(struct xe_device *xe)
>>>> {
>>>> +    int err;
>>>> +
>>>>     /* For now suspend/resume is only allowed with GuC */
>>>>     if (!xe_device_uc_enabled(xe))
>>>>         return;
>>>>
>>>> -    drmm_mutex_init(&xe->drm, &xe->d3cold.lock);
>>>> -
>>>>     xe->d3cold.capable = xe_pm_pci_d3cold_capable(xe);
>>>>
>>>>     if (xe->d3cold.capable) {
>>>> -        xe_device_sysfs_init(xe);
>>>> -        xe_pm_set_vram_threshold(xe, DEFAULT_VRAM_THRESHOLD);
>>>> +        err = xe_device_sysfs_init(xe);
>>>
>>> apparently not because of this patch, but why do we call a function
>>> named xe_device_sysfs_init() iff xe->d3cold.capable? And from within
>>> xe_pm. That seems totally misplaced. +Rodrigo
>>>
>>>> +        if (err)
>>>> +            drm_warn(&xe->drm,
>>>> +                 "Sysfs create for user to set vram threshold 
>>>> failed\n");
>>>
>>> just warning?
>>
>> If I propagate xe_pm_int errors to xe_pci.c, it exhibits unexpected 
>> behavior. The PCI module throws errors as anticipated, but when I 
>> remove the xe module with "module -r xe", it doesn't properly clean 
>> up the "/sys/class/drm/card*" directory. Subsequently, upon 
>> reloading, it complains about existing sysfs entries and fails to 
>> load. This behavior aligns with the issue described in 
>> https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1352.
>
> Ok, it seems xe_pci.c is not ready yet to handle the propagated error.
> Please add a comment above and in the commit message about this, so we
> remember to fix it later when xe_pci.c is fixed.
>
> /*
>  * FIXME: Just warn on error for now since caller is not completely
>  * ready to handle the fallout.
>  */

Thanks for the input.

Since errors come up after the DRM device probing, there's currently no 
cleanup mechanism for the driver. Adding handling via xe_pci_remove() 
might sort out issues popping up post driver probe. I'll give it a try, 
and if it works out, I'll update the patch accordingly. Otherwise, I'll 
resort to adding warning messages and fixme notes for now.

>
> thanks
> Lucas De Marchi
--------------w2agRxqJ1LgGspsDPjI9NF5l
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 12-04-2024 22:28, Lucas De Marchi
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:ub2u2jq47h5uy7zydrmoewdad644qf5eo=
6finfz4mfpwa4orm3@22uzbbikjtkw">On
      Fri, Apr 12, 2024 at 10:01:20PM +0530, Ghimiray, Himal Prasad
      wrote:
      <br>
      <blockquote type=3D"cite">
        <br>
        On 12-04-2024 19:12, Lucas De Marchi wrote:
        <br>
        <blockquote type=3D"cite">On Fri, Apr 12, 2024 at 01:32:45PM
          +0530, Himal Prasad Ghimiray wrote:
          <br>
          <blockquote type=3D"cite">xe_pm_init may encounter failures for
            various reasons, such as a failure
            <br>
            in initializing drmm_mutex, or when dealing with a
            d3cold-capable device
            <br>
            for vram_threshold sysfs creation and setting default
            threshold.
            <br>
            Presently, all these potential failures are disregarded.
            <br>
            <br>
            Move d3cold.lock initialization to xe_pm_init_early and
            cause driver
            <br>
            abort if mutex initialization has failed.
            <br>
            <br>
            Warn about failure to create and setting default threshold.
            <br>
            <br>
            Cc: Lucas De Marchi <a class=3D"moz-txt-link-rfc2396E" href=3D"=
mailto:lucas.demarchi@intel.com">&lt;lucas.demarchi@intel.com&gt;</a>
            <br>
            Cc: Rodrigo Vivi <a class=3D"moz-txt-link-rfc2396E" href=3D"mai=
lto:rodrigo.vivi@intel.com">&lt;rodrigo.vivi@intel.com&gt;</a>
            <br>
            Signed-off-by: Himal Prasad Ghimiray
            <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:himal.prasad.=
ghimiray@intel.com">&lt;himal.prasad.ghimiray@intel.com&gt;</a>
            <br>
            ---
            <br>
            drivers/gpu/drm/xe/xe_device_sysfs.c | 12 ++++------
            <br>
            drivers/gpu/drm/xe/xe_device_sysfs.h |&nbsp; 2 +-
            <br>
            drivers/gpu/drm/xe/xe_pm.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; | 34
            +++++++++++++++++++++++-----
            <br>
            drivers/gpu/drm/xe/xe_pm.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 2 +-
            <br>
            4 files changed, 34 insertions(+), 16 deletions(-)
            <br>
            <br>
            diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c
            b/drivers/gpu/drm/xe/xe_device_sysfs.c
            <br>
            index e47c8ad1bb17..21677b8cd977 100644
            <br>
            --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
            <br>
            +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
            <br>
            @@ -76,18 +76,14 @@ static void xe_device_sysfs_fini(struct
            drm_device *drm, void *arg)
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;sysfs_remove_file(&amp;xe-&gt;drm.dev-&=
gt;kobj,
            &amp;dev_attr_vram_d3cold_threshold.attr);
            <br>
            }
            <br>
            <br>
            -void xe_device_sysfs_init(struct xe_device *xe)
            <br>
            +int xe_device_sysfs_init(struct xe_device *xe)
            <br>
            {
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;struct device *dev =3D xe-&gt;drm.dev;
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;int ret;
            <br>
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;ret =3D sysfs_create_file(&amp;dev-&gt;=
kobj,
            &amp;dev_attr_vram_d3cold_threshold.attr);
            <br>
            -&nbsp;&nbsp;&nbsp; if (ret) {
            <br>
            -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_warn(&amp;xe-&g=
t;drm, &quot;Failed to create sysfs
            file\n&quot;);
            <br>
            -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return;
            <br>
            -&nbsp;&nbsp;&nbsp; }
            <br>
            -
            <br>
            -&nbsp;&nbsp;&nbsp; ret =3D drmm_add_action_or_reset(&amp;xe-&g=
t;drm,
            xe_device_sysfs_fini, xe);
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;if (ret)
            <br>
            -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_warn(&amp;xe-&g=
t;drm, &quot;Failed to add sysfs fini
            drm action\n&quot;);
            <br>
            +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;
            <br>
            +
            <br>
            +&nbsp;&nbsp;&nbsp; return drmm_add_action_or_reset(&amp;xe-&gt=
;drm,
            xe_device_sysfs_fini, xe);
            <br>
            }
            <br>
            diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.h
            b/drivers/gpu/drm/xe/xe_device_sysfs.h
            <br>
            index 38b240684bee..f9e83d8bd2c7 100644
            <br>
            --- a/drivers/gpu/drm/xe/xe_device_sysfs.h
            <br>
            +++ b/drivers/gpu/drm/xe/xe_device_sysfs.h
            <br>
            @@ -8,6 +8,6 @@
            <br>
            <br>
            struct xe_device;
            <br>
            <br>
            -void xe_device_sysfs_init(struct xe_device *xe);
            <br>
            +int xe_device_sysfs_init(struct xe_device *xe);
            <br>
            <br>
            #endif
            <br>
            diff --git a/drivers/gpu/drm/xe/xe_pm.c
            b/drivers/gpu/drm/xe/xe_pm.c
            <br>
            index f1fc83845c01..f4d9441720b4 100644
            <br>
            --- a/drivers/gpu/drm/xe/xe_pm.c
            <br>
            +++ b/drivers/gpu/drm/xe/xe_pm.c
            <br>
            @@ -208,10 +208,25 @@ static void xe_pm_runtime_init(struct
            xe_device *xe)
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;pm_runtime_put(dev);
            <br>
            }
            <br>
            <br>
            -void xe_pm_init_early(struct xe_device *xe)
            <br>
            +int xe_pm_init_early(struct xe_device *xe)
            <br>
            {
            <br>
            +&nbsp;&nbsp;&nbsp; int err;
            <br>
            +
            <br>
&nbsp;&nbsp;&nbsp;&nbsp;INIT_LIST_HEAD(&amp;xe-&gt;mem_access.vram_userfaul=
t.list);
            <br>
            -&nbsp;&nbsp;&nbsp; drmm_mutex_init(&amp;xe-&gt;drm,
            &amp;xe-&gt;mem_access.vram_userfault.lock);
            <br>
            +
            <br>
            +&nbsp;&nbsp;&nbsp; err =3D drmm_mutex_init(&amp;xe-&gt;drm,
            &amp;xe-&gt;mem_access.vram_userfault.lock);
            <br>
            +&nbsp;&nbsp;&nbsp; if (err)
            <br>
            +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return err;
            <br>
            +
            <br>
            +&nbsp;&nbsp;&nbsp; /* Currently d3cold.lock will be used only =
with GuC */
            <br>
          </blockquote>
          <br>
          it's cheaper to just initialize it regardless so this can be
          simpler
          <br>
          <br>
          int xe_pm_init_early(struct xe_device *xe)
          <br>
          {
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;int err;
          <br>
          <br>
&nbsp;&nbsp;&nbsp;&nbsp;INIT_LIST_HEAD(&amp;xe-&gt;mem_access.vram_userfaul=
t.list);
          <br>
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;if ((err =3D drmm_mutex_init(&amp;xe-&gt;=
drm,
          &amp;xe-&gt;mem_access.vram_userfault.lock) ||
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (err =3D drmm_mutex_in=
it(&amp;xe-&gt;drm,
          &amp;xe-&gt;d3cold.lock)))
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return err;
          <br>
        </blockquote>
        Looks clean. Will prefer using this.
        <br>
        <blockquote type=3D"cite">
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;return 0;
          <br>
          }
          <br>
          <br>
          or keep the err assignment separate, doesn't matter much. But
          <br>
          when we mix success and failure for a return-early style it
          makes
          <br>
          it harder to read.
          <br>
          <br>
          <blockquote type=3D"cite">
            <br>
            /**
            <br>
            @@ -219,20 +234,27 @@ void xe_pm_init_early(struct xe_device
            *xe)
            <br>
            &nbsp;* @xe: xe device instance
            <br>
            &nbsp;*
            <br>
            &nbsp;* This component is responsible for System and Device sle=
ep
            states.
            <br>
            + *
            <br>
          </blockquote>
          <br>
          wrong line
          <br>
          <br>
          <blockquote type=3D"cite">&nbsp;*/
            <br>
            void xe_pm_init(struct xe_device *xe)
            <br>
            {
            <br>
            +&nbsp;&nbsp;&nbsp; int err;
            <br>
            +
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;/* For now suspend/resume is only allow=
ed with GuC */
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;if (!xe_device_uc_enabled(xe))
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return;
            <br>
            <br>
            -&nbsp;&nbsp;&nbsp; drmm_mutex_init(&amp;xe-&gt;drm,
            &amp;xe-&gt;d3cold.lock);
            <br>
            -
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;xe-&gt;d3cold.capable =3D xe_pm_pci_d3c=
old_capable(xe);
            <br>
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;if (xe-&gt;d3cold.capable) {
            <br>
            -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_device_sysfs_ini=
t(xe);
            <br>
            -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_pm_set_vram_thre=
shold(xe,
            DEFAULT_VRAM_THRESHOLD);
            <br>
            +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; err =3D xe_device_s=
ysfs_init(xe);
            <br>
          </blockquote>
          <br>
          apparently not because of this patch, but why do we call a
          function
          <br>
          named xe_device_sysfs_init() iff xe-&gt;d3cold.capable? And
          from within
          <br>
          xe_pm. That seems totally misplaced. +Rodrigo
          <br>
          <br>
          <blockquote type=3D"cite">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; if (err)
            <br>
            +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; drm_warn(&amp;xe-&gt;drm,
            <br>
            +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Sysfs create for user to set vram
            threshold failed\n&quot;);
            <br>
          </blockquote>
          <br>
          just warning?
          <br>
        </blockquote>
        <br>
        If I propagate xe_pm_int errors to xe_pci.c, it exhibits
        unexpected behavior. The PCI module throws errors as
        anticipated, but when I remove the xe module with &quot;module -r
        xe&quot;, it doesn't properly clean up the &quot;/sys/class/drm/car=
d*&quot;
        directory. Subsequently, upon reloading, it complains about
        existing sysfs entries and fails to load. This behavior aligns
        with the issue described in
        <a class=3D"moz-txt-link-freetext" href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/-/issues/1352">https://gitlab.freedesktop.org/drm/xe/k=
ernel/-/issues/1352</a>.
        <br>
      </blockquote>
      <br>
      Ok, it seems xe_pci.c is not ready yet to handle the propagated
      error.
      <br>
      Please add a comment above and in the commit message about this,
      so we
      <br>
      remember to fix it later when xe_pci.c is fixed.
      <br>
      <br>
      /*
      <br>
      &nbsp;* FIXME: Just warn on error for now since caller is not
      completely
      <br>
      &nbsp;* ready to handle the fallout.
      <br>
      &nbsp;*/
      <br>
    </blockquote>
    <p>Thanks for the input. <br>
    </p>
    <p style=3D"border: 0px solid rgb(227, 227, 227); box-sizing: border-bo=
x; --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0;=
 --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-=
scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ;=
 --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --t=
w-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --t=
w-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numer=
ic-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-of=
fset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-sha=
dow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 t=
ransparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightn=
ess: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ;=
 --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; -=
-tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscal=
e: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opac=
ity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; --tw-contain-size: =
; --tw-contain-layout: ; --tw-contain-paint: ; --tw-contain-style: ; margin=
: 0px 0px 1.25em; color: rgb(13, 13, 13); font-family: S=C3=B6hne, ui-sans-=
serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cant=
arell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial=
, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI=
 Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-style: n=
ormal; font-variant-ligatures: normal; font-variant-caps: normal; font-weig=
ht: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent=
: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-str=
oke-width: 0px; white-space: pre-wrap; background-color: rgb(255, 255, 255)=
; text-decoration-thickness: initial; text-decoration-style: initial; text-=
decoration-color: initial;">Since errors come up after the DRM device probi=
ng, there's currently no cleanup mechanism for the driver. Adding handling =
via xe_pci_remove() might sort out issues popping up post driver probe. I'l=
l give it a try, and if it works out, I'll update the patch accordingly. Ot=
herwise, I'll resort to adding warning messages and fixme notes for now.</p=
>
    <p></p>
    <blockquote type=3D"cite" cite=3D"mid:ub2u2jq47h5uy7zydrmoewdad644qf5eo=
6finfz4mfpwa4orm3@22uzbbikjtkw">
      <br>
      thanks
      <br>
      Lucas De Marchi
      <br>
    </blockquote>
  </body>
</html>

--------------w2agRxqJ1LgGspsDPjI9NF5l--
