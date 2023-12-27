Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C8B6C46CD2
	for <intel-xe@archiver.kernel.org>; Wed, 27 Dec 2023 15:23:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F167F10E0BE;
	Wed, 27 Dec 2023 15:23:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03DF610E0BE
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Dec 2023 15:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703690595; x=1735226595;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=r0gGVHJj6B2fHLJKcLaDEpCGPlvTY9FON+ZBpyb8kFw=;
 b=j49LNRri4PwG3tYUETdfKaIWirui1EfkLkvs3jZdNDdavl17cbSopuZ2
 /6rL2zXYWL9IsfhJm5yT+Un/smhyuDJr4Wvr+44xPBMjRIAtJR5T0meB6
 x124Jay0IuesNfy0bP2U3PoinPeH8dkUZL/sZvlC+3HHZE7DYwBE3Aca0
 DRR7BAT6ccJm10qFtI1CB7Q9/lcOJQVa+f8dUs3kqbdAt01kToMzqixPz
 JJvpjtkntrtBNDGzXMKyIZvpfFGXLYvHNSlrWyHteX1vQh6smtK7byrzz
 8jfUt7wYi/I970dRmXI+EgA/Idg2E/FqYzJWJ6o434+0okqISOlqON5gz w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="3742151"
X-IronPort-AV: E=Sophos;i="6.04,309,1695711600"; 
   d="scan'208";a="3742151"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Dec 2023 07:23:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,309,1695711600"; d="scan'208";a="26594073"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Dec 2023 07:23:13 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 27 Dec 2023 07:23:12 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 27 Dec 2023 07:23:12 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 27 Dec 2023 07:23:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QGROgkwMGtuKLtnAXUtKSTY2QRtJv2bKliAxJpLtq3YApznKe/ZN2WgbgGc5VuHMhdJNvD0CFhTDGHd71bwaf6F2VxA2upXZXgqa3+35oNOlZNB2IMHxl2z39k0uMMciqRlOmjOXyftfBbUBegv65bpSgZSTPi6tq6QCPzcsnb6tdYHiWrnZrGAFNuic6AVSn79+oaYFXhbqbpmYcAmWz2W6HEXy1pVQ2x87EzGpbTREye3k5AViJLY3W26Zeii8/cHyxut6pbh7eAaQTy3aeFB3A+D3sn6H+BunTwtfdCFU/CTt8M1mgxJRp0VoOhXBZ6BXkApgJGUdVmAr/yUqww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zFmKpATGiNbPVRGgbQekn22FvFI1j3llGsJxYfHXO4c=;
 b=C85CzsrzxaIp9UNaJExJ/0roHhaUfKmnnxyg3FvGrykZq4TBEPyZ53ISulPdGvRGGAE8oUWDVKzUCXszBTSvgxhzQeow26uQ5/13cpWCP4KkjByhD6Lu8t31MNtudZ1NPDPgqhTmv6HShou5ppt22JWluoReEjF6JBa5xzB2bJhYA+xyk1YfDXzjH1cPOnxrn7WRU1TLK3bjMQQCc5sYNWagaqBqjqGERmieI0sUndFJOLuZJGY/OXtsNrbWJtV5aP4MLMFJdeyA7JO299V2dtCEYws1HGFjo9D5WJkVqDQiTaAOMxox9uLOBtzcNpEupCkgCipvHs5FrkFhRe7mDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by CY8PR11MB7314.namprd11.prod.outlook.com (2603:10b6:930:9d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.19; Wed, 27 Dec
 2023 15:23:10 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::51c3:59ea:6d4:8bc0]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::51c3:59ea:6d4:8bc0%4]) with mapi id 15.20.7113.027; Wed, 27 Dec 2023
 15:23:10 +0000
Message-ID: <3add9cb6-2a79-48ad-99ea-97162688a776@intel.com>
Date: Wed, 27 Dec 2023 20:53:03 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/debugfs: Make sysfs gt force reset synchronous
Content-Language: en-US
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>, "Poosa, Karthik"
 <karthik.poosa@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
References: <20231227083204.3982491-1-karthik.poosa@intel.com>
 <CY5PR11MB6211A31CBBD708FFEDBDCF06959FA@CY5PR11MB6211.namprd11.prod.outlook.com>
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <CY5PR11MB6211A31CBBD708FFEDBDCF06959FA@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0147.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:c8::12) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|CY8PR11MB7314:EE_
X-MS-Office365-Filtering-Correlation-Id: d036c9e6-2190-40d7-1b58-08dc06efbbe4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vmiVRyfZ2bqwqQsO5VbtUCkcpDywkcG6+A6qxfbpsLx2Is8RvF8DkAHpCpHLnxGmIIPJPwczFyLVtj2QK7qAT/QSLgBqFBzLuopKof1Bpfcj0JgSYK6WCckdCVvA8Sc4VROPR10U5uqNLqv058e4A5UJttYv6hQBl3Qx+DBCTy8Fm0fpJZDjcl0/KaE11iq6WDK98pYnSNbKY3k19Q+fliSya/aKNAlbk84T5C7IkHsT1j6RIWJkGBSKBggPXLPs7CD6uoYWsGBOVfGZGcrL015/mJmGC7yNiTYxAupoepcrmJBTziJmoxbWduc7MrZvOT5YlXSNjpMtigbMVIWWKLSaV5uU9XkFbsoGfiUMZR/6CkHqxIsEaoxE6CHOmiNKw+UN44Rnh3ZEkOTL9x2uQSpzqI6b2B28H9yMOslrs5Z5JxhwObAi8+KXb6ngco/tPzj/ddstedkbrbdpck4g9yM3k0t2vv9084z3PymNhVuhFrhorAaEvQssRqaJNkr+AVgMrccRfO9290mO/1chCUqMW9sXdjkJCLesnc8Z/oAqJ9SY9O35SAZCCsC6hPKQsFrKUy24tGEnbWqJxeNp8E3imjSxteRwzf6O+V2FXyfQnFK9a9twSC4sgu37BODGhVQcnIxP4vhgvh5SiUXcgQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(346002)(39860400002)(136003)(376002)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(478600001)(6666004)(2616005)(82960400001)(6506007)(53546011)(66556008)(6512007)(110136005)(31696002)(86362001)(66476007)(36756003)(54906003)(66946007)(316002)(41300700001)(6486002)(31686004)(8936002)(8676002)(83380400001)(38100700002)(2906002)(4326008)(107886003)(5660300002)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bkxYUzlyVE8vRVFBbGN2MU40Nk9NZnBDVFQ3YlUvTzdZbHNIWE1teG1DUC9L?=
 =?utf-8?B?eGlwVGpJMmxvYlo2QUhaWHZsRzdYNTV1ZCtPVXlYVzdEMTUwMWx0T1hDUXlB?=
 =?utf-8?B?R3dWVThmb21HVGRkQzNwUWRBcktSTUxIQTM5ejJ3M0Y3ZVRrclR4NnhvZEpx?=
 =?utf-8?B?b2FuOTJRNkY1NS9hRmJnMlhoek9IdGt5c0h2MjJoaklPcmQ2d0dBZGY1TEJB?=
 =?utf-8?B?aDFRSmJuY0trandQWHdxWFVzSkFFUlI0THBRNGxpdXp1NGpqVEF1NGFWT0pQ?=
 =?utf-8?B?N203a0dabDFXVlRVT29YRW5iWmpuUlN6N3VSREVDZUZHZGh3SDFkRGkrSXNS?=
 =?utf-8?B?bTIvb0IxL1Zvc3ByUlBMN0hPUmhIa2I2Z1AreVBmd1A2Nlp1OFVrc0pYMExS?=
 =?utf-8?B?dVlJQzE4eTR6NkFGdHhvSGdWRHVRa3NvQTM0dmFUZHRQVERTWWd4M3FVZkZC?=
 =?utf-8?B?Z2xZL1crbERXVkYyaWg0RnlPMkRVM3pwV1J3WnRxTFhkQVhzMyt0Yk5DTWhR?=
 =?utf-8?B?bDZPRDBSVER4cnYydldic2tESjkrTVNpcUtGOTY4WkRMUzNWTW9wdkp3YTcy?=
 =?utf-8?B?QjRqKzFFSU4wMHdTYU5acmFRUWQxUFRNaXRvTzhEVGJWak5UVGVFN3UybFNj?=
 =?utf-8?B?eXFpNFZvejlSWXRVN1VEMnQxbCtES0pYQ0h5bDBVc1hiQXBPRnBzRzEydFhY?=
 =?utf-8?B?Vkdtcml1M0cwWEExbWExcHppOHlOZHZqMy9kL0RNNmFhWEdiV1ZkTFY5N3Zy?=
 =?utf-8?B?YmlkTFRyc2NvRXB3UlNrRThJWWc1QWZYZkFHTmQ2SFVOQjJIaE5xVHJOczd0?=
 =?utf-8?B?WjFlWFJWMS9wRDV0Tzh6bkY5WENoa084T0J2dGFkNy9DSTd2TDVwM1hONTNY?=
 =?utf-8?B?aG8wVm55R3FrcGZ4T1Q5VHJjcjNJRU9KNHJWU1J2eUlWK3Q1OCtwM0ZNeU9P?=
 =?utf-8?B?ZkpyVHZYYndIOHNpV2R1Wk43UEFkUy9WNG9DTitXb1plNDdvUDluYWpxdkoy?=
 =?utf-8?B?RXBUVnJaU1lYbGs3c21oUm0vYjdCSlE2bTJHTGc3cW53VlB3VWllY2xuUmJr?=
 =?utf-8?B?OGtrUHJ3TE8wTWRFSHZVc3I5dnNpakNsQzQ1Ti8zWVBobTh2Slc3OEVLUktM?=
 =?utf-8?B?cFdUSThOb0pSYUlTWVNlSGttMW9ZSVg0ZDdrekdPbjV6V1NaYnIwb0UzTk1Z?=
 =?utf-8?B?TjM0ZUtOUmxjZWRtK0JuY0IvbFZYWGtwNUdjTTgwOWtucHIzSU9ZV05zNGhv?=
 =?utf-8?B?V2g2eUhEdk8zUjdqaVJxUGdiSnYzeXAreGtqTkNaRktxVmNocURiZkxXYnJs?=
 =?utf-8?B?b1lycmNhRDNmeEVjMmtzSXpnTklKZGpJN3VOOHh3ZUYyM3pLbzRkMTRUeVFK?=
 =?utf-8?B?N295QjZEM1NEOUJoZE1MRjRnK1c5YytCUjJNUC96L1J3Q0JmWklnb1pIWmUx?=
 =?utf-8?B?MmVveEl4VXB1SGovblo5Sm94WFNjTDg1MWpkeG5LNk8xUFVrRkxINDZFQXRF?=
 =?utf-8?B?TlY2T3c0Yngyd0pBaVhVK1B3V3dmWGszMUxOL0VqUXphTzJ4U1RWRzZJTUdL?=
 =?utf-8?B?T1M0MVVsM05mNXpXc2txYnUrdy9BQ1g1WEIyK3YrT2FXWHk0V1ZTUVJSeXha?=
 =?utf-8?B?SFNwN2FoWEsrNVNzdEtsNDl6ZGVFQmpUUUgrZG8wY0piR1lkZHhEUE43aFNU?=
 =?utf-8?B?NVNYcW5HQkNvL01KYTViMkNSTHU4TEt0OGtHeFRhUit0dDJaQk42dGMwMjV0?=
 =?utf-8?B?dk1LUjFqVW9xUjJZNnF6T2FxYy90aDlOOWtYaDJlSnFLVWFoUnErV2FwV1Iw?=
 =?utf-8?B?bnBLdGt6UEZaaGQvSWJDSTFXcnUzRDNTNHJOZkhHRm9QZmV5dWR2b0pYTzRH?=
 =?utf-8?B?U215MzhDc241U3IvQ0dnbnExREhud3B4cEswSzV5dEM0ekNJVCtJRFZCcFUy?=
 =?utf-8?B?cWlrS04zRVFYMjl2Q210V01OdDBHNXdvcUJDRlVUV3JIU3VWVFNLZWoyUHRH?=
 =?utf-8?B?MnFuaFNPQmtzcHZpVDIwQ2xlRG1raGxDMWFwcUErM2ZsMm51dCt0eVZVYjdB?=
 =?utf-8?B?MHdubjhYUXFvZExCZW9vallxTHo5ZDNKb1E4MXdGVkpqZDJGemI4ZEZTTEJ6?=
 =?utf-8?B?RjlXWkxqT3ZyKzBXdndjejAzSlNzeHhkK2tWNzAvdU9RejZDNGZZcUR6aTVB?=
 =?utf-8?B?d3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d036c9e6-2190-40d7-1b58-08dc06efbbe4
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2023 15:23:10.1971 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tJNAPvAudM/IqNmyluI+9qISOsxoZLOc6mMs6c0xrKTgpmOOWWi03SaPQRCNf8aPqwIm1vJvzWuvRRgXKM4Udg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7314
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
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 27-12-2023 16:06, Gupta, Anshuman wrote:
> 
> 
>> -----Original Message-----
>> From: Poosa, Karthik <karthik.poosa@intel.com>
>> Sent: Wednesday, December 27, 2023 2:02 PM
>> To: intel-xe@lists.freedesktop.org
>> Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; Nilawar, Badal
>> <badal.nilawar@intel.com>; Brost, Matthew <matthew.brost@intel.com>;
>> Vivi, Rodrigo <rodrigo.vivi@intel.com>; Poosa, Karthik
>> <karthik.poosa@intel.com>
>> Subject: [PATCH] drm/xe/debugfs: Make sysfs gt force reset synchronous
>>
>> Wait for gt reset to complete before returning from force_reset sysfs call.
>> Without this igt test freq_reset_multiple fails sporadically in case xe_guc_pc is
>> not started.
>>
>> v2:
>> - Changed wait for completion to interruptible (Anshuman).
>> - Moved timeout to xe_gt.h (Anshuman).
>> - Created a debugfs for updating timeout (Rodrigo).
>>
>> Testcase: igt@xe_guc_pc@freq_reset_multiple
>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt.c         |  2 ++
>>   drivers/gpu/drm/xe/xe_gt_debugfs.c | 12 ++++++++++++
>>   drivers/gpu/drm/xe/xe_gt_types.h   |  6 ++++++
>>   3 files changed, 20 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c index
>> 3af2adec1295..47abb9336c58 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -65,6 +65,7 @@ struct xe_gt *xe_gt_alloc(struct xe_tile *tile)
>>
>>   	gt->tile = tile;
>>   	gt->ordered_wq = alloc_ordered_workqueue("gt-ordered-wq", 0);
>> +	init_completion(&gt->reset_done);
>>
>>   	return gt;
>>   }
>> @@ -633,6 +634,7 @@ static int gt_reset(struct xe_gt *gt)
>>   	xe_device_mem_access_put(gt_to_xe(gt));
>>   	XE_WARN_ON(err);
>>
>> +	complete(&gt->reset_done);
>>   	xe_gt_info(gt, "reset done\n");
>>
>>   	return 0;
>> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c
>> b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>> index c4b67cf09f8f..fbda886c8a95 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>> @@ -58,8 +58,16 @@ static int hw_engines(struct seq_file *m, void *data)
>> static int force_reset(struct seq_file *m, void *data)  {
>>   	struct xe_gt *gt = node_to_gt(m->private);
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +	long ret;
>>
>>   	xe_gt_reset_async(gt);
>> +	ret = wait_for_completion_interruptible_timeout(&gt->reset_done,
>> +
> This would defeat the purpose of xe_gt_reset_async(), as this will make force_reset
> synchronous , I think we need wait_for_completion_interruptible_timeout in  xe_gt_freq sysfs
> before reading the guc pc frequency.
> Something like below.
> guc_pc_freq_ready()
> {
> 	wait_for_completion_interruptible_timeout()
> }
Then how force_reset debugfs should be handled then? I am seeing only 2 
possible ways, if reset is in progress 1. Do nothing or 2. Wait for 
completion and then initiate reset.

For freq sysfs entries I agree we should wait for guc pc is ready.

Regards,
Badal
> 
> Thanks,
> Anshuman Gupta.
> 						msecs_to_jiffies(gt-
>>> reset_timeout_ms));
>> +	if (ret <= 0) {
>> +		drm_err(&xe->drm, "gt reset timed out/interrputed, ret
>> %ld\n", ret);
>> +		return -ETIMEDOUT;
>> +	}
>>
>>   	return 0;
>>   }
>> @@ -225,6 +233,10 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
>>   		return;
>>   	}
>>
>> +	/* set a default timeout */
>> +	gt->reset_timeout_ms = 1000;
>> +	debugfs_create_u32("gt_reset_timeout_ms", 0600, root,
>> +					&gt->reset_timeout_ms);
>>   	/*
>>   	 * Allocate local copy as we need to pass in the GT to the debugfs
>>   	 * entry and drm_debugfs_create_files just references the
>> drm_info_list diff --git a/drivers/gpu/drm/xe/xe_gt_types.h
>> b/drivers/gpu/drm/xe/xe_gt_types.h
>> index f74684660475..824cefde20d2 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_types.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
>> @@ -358,6 +358,12 @@ struct xe_gt {
>>   		/** @oob: bitmap with active OOB workaroudns */
>>   		unsigned long *oob;
>>   	} wa_active;
>> +
>> +	/** @reset_done : completion for GT reset */
>> +	struct completion reset_done;
>> +
>> +	/** @gt_reset_timeout_ms : gt reset timeout in ms */
>> +	u32 reset_timeout_ms;
>>   };
>>
>>   #endif
>> --
>> 2.25.1
> 
