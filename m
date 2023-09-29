Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02883E743EC
	for <intel-xe@archiver.kernel.org>; Fri, 29 Sep 2023 06:03:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71A6B10E6B2;
	Fri, 29 Sep 2023 06:03:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6E6F10E0E0
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Sep 2023 06:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695967421; x=1727503421;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ohrM6QKw0fdjASEuCrUdHenr8RVHwwPA46KAJ9ps9Lk=;
 b=JoN4pjoDtAoMEsgdlsN43ie2t8oYkc1fOplpkGDRTV3iuee2cm3XysqY
 nfPeb4eWeen8nl3ev/MImDzXxQfArpF5sI2UTD8C/UBkHdDmuwy1xXdzI
 djIykMgrQ8faSB2+4KkD86cLZNYYKVOKTXii1aYpg870uib0oiUSV9DqT
 HUCjIkV5HGmTGGnlQKX8N7VxlqsNYmBQqj5aqhVpxLnonA+nU6dNQS9Sp
 XaQVOOntPGVTXoGh7LFRUfOm7vyIPtqFtG5Bi+jRuk6E5RWk4VQclRULs
 p5o8q1mvyg2qAGNJ9ca+IiGkUs7oSHXH6GFbVB+yFMT7qcrnQLV7lFgoq g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="382143057"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; d="scan'208";a="382143057"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 23:03:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="743356150"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; d="scan'208";a="743356150"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Sep 2023 23:03:24 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 28 Sep 2023 23:03:23 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 28 Sep 2023 23:03:23 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.48) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 28 Sep 2023 23:03:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TC1O8wJCxiPYvTiEq6+kaZB4gs3Oa6lLVWzMnjeg5jSMjADFOtlUNGc4tl39k1P0M1NYd9L7K1SDf4Wa64DdIZUZjahfgI7CVRd4PbERn6KXivgpYN6cq7kwG4obdihbmsD4p1BNoF7q6AUmWsHDetmTXYYpnjW6E80XcFKNi5G98G+lufCSml9qMo2cx4BNQDHbkYzvkFHSDrhktJDvUG8KGvyk3Gio51C23IflsB7U9WEt8fjACGO6Rt8qiIfgneJQ84tC+nj3ZgoHeGGjNKzSIrtLBOybsuppwg1sObUKzMFGISiUyxwO/MfhK+l2cxcPBXgZrZLvJJlnBKN3fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qr8yPBHEUOHS/2ETKANXEiuDeg2ubpsg36ZLpLKW00g=;
 b=JJCu39tpdMvA81tBNz9QF6gh46HbsLXz1MWFJvmI6/mnKprSmnBmWdLJ2LWm1TCI8RtZK7qlEuTTfBWm/9alH6qhAMvY1Kc0/XmqqQ++LKVECe0IbnZSsF47SBHdZB4tBE20qVz7ilaTLYbuka02/v6WrKY2RZDjTmWFGThPxCJCJjQ5MTpKDCdYfJMIbh4cjDnURmTUq1iuYm/TGfyxllF95weW7N3iK6IzXdeDCfy8cK5AGkpkRb6B6Pe0C3j16Sf1UWCs+jnxFaRTClaCpz1YEIINWWfbiPwaWFIPWAq9lEWCDHb0CPl1ktKtdy2z/WuIiD7/zFFigMSsHyXdqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 DM6PR11MB4642.namprd11.prod.outlook.com (2603:10b6:5:2a2::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.26; Fri, 29 Sep 2023 06:03:20 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::c5ac:9134:7e53:b45c]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::c5ac:9134:7e53:b45c%7]) with mapi id 15.20.6838.024; Fri, 29 Sep 2023
 06:03:20 +0000
Message-ID: <b85295d5-e5c9-39de-16e4-10a10f91de0f@intel.com>
Date: Fri, 29 Sep 2023 11:33:10 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: Riana Tauro <riana.tauro@intel.com>
References: <20230926144120.334009-1-sujaritha.sundaresan@intel.com>
 <20230926144120.334009-3-sujaritha.sundaresan@intel.com>
 <ZRMVda8E+xLJbDJp@intel.com> <5325c63c-07cb-8395-e95a-25d86febe29c@intel.com>
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
In-Reply-To: <5325c63c-07cb-8395-e95a-25d86febe29c@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0198.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e9::7) To DM8PR11MB5653.namprd11.prod.outlook.com
 (2603:10b6:8:25::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5653:EE_|DM6PR11MB4642:EE_
X-MS-Office365-Filtering-Correlation-Id: c238fb21-982b-4f25-61b5-08dbc0b1c7b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0WpfJcpBffdSsA/pVz3MaK1oWnWN/flMkMlVf3e8ALGJZSbLSbnNIND1O7Y9RPYgC76K/xumw34f3qJ4U8DBNEx3feZ+e6ZpVitfRikr3aZV5n0k4cr/a9roSX6O5gjohKzdkiVCCBScnH2SRMaCrq4NQ2ruzX+1M4BA2fnjGoDFAlNCBLgAQBSNBywFx9bbAfbNTihYWU2otm/ul+2TOb18/Fb8IkBeG4ebVFoN6KPdHoAaivQ+8KnDz/gW/m8PssiYAJ4NZ3eTMz5S42aI9IFf/DFPvhOskDksoUOIlo/gcgrNmzGWAXnjGnqgHZ1b/uP/0VnCiiOAn+CK6ZFFH9FQ5F9F5aH9986Jq4tKCHgZpSJN20/RcnxL+qRasjY0/yE8Su3os29fr7IQZxyyt+fcDZIcKNvWPIaRSW6n43Odz3S0mGGriKlIDedNSFyVLDFdjvzVl05RoklA9DuNmpvEU9ODiAJ4+F8z7MmXr5Wz4mm/5ACvxUnQQoD9kjdJG+YnHfEfPS7PKAiPUbrUs5EBD7BQHYuXqVykx9pRSN9ixUh+nmNp6lW++rlBOMyuimUes8M8nRnNzy0Uz+fThaA8B//L6f1i8uikv7omyHGeWkD02deT5u4++UmnGcadczh1cun/d65+bj4GLidnWQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5653.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(136003)(376002)(396003)(346002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(6506007)(31686004)(6486002)(478600001)(83380400001)(8936002)(8676002)(6862004)(4326008)(2906002)(5660300002)(30864003)(2616005)(38100700002)(82960400001)(107886003)(6666004)(26005)(36756003)(316002)(53546011)(31696002)(86362001)(66946007)(66556008)(66476007)(6636002)(37006003)(41300700001)(6512007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2FDYWQ2NCtwdTY0c2I5Z0lxRTNTUjN4bk1wbkNIaEV3eDNhNlRjSkhPSnlW?=
 =?utf-8?B?UmZtQkJMeVNoMWwySGE1dFpWUnZDcGhwVlNpb1BSZENyWDg1b1BUbllSOFFY?=
 =?utf-8?B?V2xCNDl5N3FQVE5LV0xxc0hQb2ZyQTZsYzBzeUdBRjk0dm1qRVRhQVpmQmhi?=
 =?utf-8?B?SFhpdEIyM2lsSExuSWNSeHBVZUQyVkJnc3lUZE1mTzlGUXF4K3NXNUpKbW5G?=
 =?utf-8?B?c0hURkZ2OG9ULzdCWVlXTXBVRlNzUEVUVU1xSUQ4WWY2UGZHN0M2eVEvRkp2?=
 =?utf-8?B?NnRUMEVEZVN5ZkNhUlNldmdqQ1NVRkRmM1FuakxYeWU0KzU1U0hSaDlKdlk5?=
 =?utf-8?B?d2gvalNoc3dmYmlzaHE3Vyt5czNnamVPZWxVYWdUNGhkc2NFcnpmZTNUdGl2?=
 =?utf-8?B?VEpDRWpSNW1JaVh1emJ2WHJGK2llUk55dFVRNEVpUWpzTU5YU1hFMUpQVjhp?=
 =?utf-8?B?WnFpWUFYM21TS2NKWG1TSTBSOENJL29ZRXJrYWtNd1M1Q3hvbkZ3Y0hBMVN5?=
 =?utf-8?B?OVN2a2VSSU5JbVpNRzl6N2Fvdk9URzBJd3lzQzluNTZjaXRobnZZSWFWKzZY?=
 =?utf-8?B?cllJY3RqdkN0RHlxZUJ4VmZvUHBVUkltSFp6WnYvMGgyNWVtOGFmNjVRczUr?=
 =?utf-8?B?TmpCeEdMM0MzN0hxR05HQVByMzNPMVBIVjF0UFFNcHJGU1dLUjlTYVR5M3Za?=
 =?utf-8?B?aDQ0akp0UmVzZE45eWtveEVMeVMvdVFBZmtmTTlSRWdLTEx4MVFobTVMTGpO?=
 =?utf-8?B?Zi9Pa3Y4SFNaZUdnUWNxTTVzdzFSOFoyRFpVc1Z4MmZweElERDZYU3RaZ1li?=
 =?utf-8?B?a3djNUlkZkx6dXNjV0hPQXJ1V3A3NUNuUjFDUWdtNnY0dHdrdDAyckplVVZp?=
 =?utf-8?B?NW9YTWZkeitsRllUK1V0bVhYS29iQTloV3pkSFROaG5KZ3lJSVJUTUx6TEc1?=
 =?utf-8?B?OStXMUJIRkdRMy9XQlEwNDYzTnVCN01xdkFKa0ZhUVc3emttbi9ibWJXSTZk?=
 =?utf-8?B?QmtyZlNGc2ovTzN2bThIYWl1d1dTZU1seG15MFUzaE00OUNmbitmbGlaVUEw?=
 =?utf-8?B?WUhWRTE2OG9RdlJmcHRWR3p3Z1FDZDc3SnRwaVE4TGxPWEpCZkh2K3d3SVo0?=
 =?utf-8?B?NEJsK0c2T1hkMmJUYzNrY0pkaTRwUWVJa0x6VWUveDJmS0lxanF0MDAwM01y?=
 =?utf-8?B?WDZ3UnY4aXd1RnpHMUlOaTNqSDRMZkJKRVROcDVuM1M2MU9QZlBGRFUxMWo0?=
 =?utf-8?B?d0dFcXdBWVlWYzhsZlFtUzV4MzdhaUNBSHpiYVVrZzN2bEJqY1Fxb3J1Z1Qv?=
 =?utf-8?B?ckNLeUhCMXdHQ0NEbW5pTDJzeE9qcXQ4ZTJNOVhraXJaanBGRWtwNWdRVFZi?=
 =?utf-8?B?TlNQRXUrWEVIYWIxRmF3eWFPdHQ5ZDlZVW44YnJuV2dXc0toemhnVytDYlBn?=
 =?utf-8?B?SmpncjNOZUVwV0gyRm1JV2k0ejdUYW9NcWtyMGVDYjVreUhVZlIyWHk4cldl?=
 =?utf-8?B?Z2xiSDFjZlNPaVRvNVZrTE1SMS9ndXc5YkFLYXBDN2ZSbU82YUkwenB4VDll?=
 =?utf-8?B?Y1BpTk12Y0J5Vk9xL0VITGZVNythcHJvcW80ck1XdmY3dXFqT0ZCOHM0UGQr?=
 =?utf-8?B?MnJmVE1KWjJxUklKalp6c25wMjRDaVg2S0FkV3hSR2o4enFsUjMxcE5VTWZ5?=
 =?utf-8?B?TXQzeEpZSUJOd1dOTHRyL2M3STZuZWUza2ZUTTNkVW5kYXpIdEZpOUxmaFRT?=
 =?utf-8?B?V0tNQ291amkxOGFmTDVSa05lRFg3YThDZDNaQTRxUmgwQmw3LzFzTGp0eHVD?=
 =?utf-8?B?Vld0WE5xYnYzS00xMHpaOUI2SkQzMjZEenFjbEdaNzZ2M1VPSU8wNnVDWEs3?=
 =?utf-8?B?dlQyS0pQbXVRVDIzNVZNbm05SnhLR0t3ZFQvMzhlQlRXZGRlWmI2MUxYb3RS?=
 =?utf-8?B?c2JRbTkxSmEzZmFFSk1IZkY5OE91U3crU29oV1QyeDVUajFqVHNOTm9kL0NX?=
 =?utf-8?B?cE9iQnhuUHU4M3hwb3gxb3FJN2ZtOUZpVnVyN1h6NUlCN2FWaVBVODZYdklN?=
 =?utf-8?B?MGJvQ1IrMU9XeXBnWFphTjZySzN0TXEyY1N1OHdYblg5T241TE83QzJrM0Ex?=
 =?utf-8?B?U0xQTE1jWFMxVms4UDZWUFNaRk1nTVBMQ0pES1NUcVZySU1qSzFSVi9nTUkv?=
 =?utf-8?Q?iFqRuc5s9gq+BwD+TTYv3Uc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c238fb21-982b-4f25-61b5-08dbc0b1c7b3
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2023 06:03:19.8585 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OhuMHVpoSbjAmNwuhxUJYIl/Z3MyoiHn/WFElmc/Bmb+YGwc77BOCq6Pb6rC+k0HypvIlWF9ZGyqQTNg9rc0HtD3AD45gSItCE1zrycA6BY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4642
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 2/2] drm/xe: Add base performance and vram
 frequency sysfs attributes
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 9/29/2023 11:09 AM, Riana Tauro wrote:
> Hi Suja
>
> Could you add the folder structure in commit message
>
> On 9/26/2023 11:01 PM, Rodrigo Vivi wrote:
>> On Tue, Sep 26, 2023 at 08:11:20PM +0530, Sujaritha Sundaresan wrote:
>>> This patch adds base performace attributes as well as vram frequency
>>> attributes.
>>
> %/performace/performance
Sure will do.
>> Is vram freq tied to the gt or tied to the tile?
>>
>>>
>>> v2: Create a separate performance directory for attributes.
>>>
>>> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/Makefile           |   1 +
>>>   drivers/gpu/drm/xe/xe_gt_freq_sysfs.c | 218 
>>> ++++++++++++++++++++++++++
>>>   drivers/gpu/drm/xe/xe_gt_freq_sysfs.h |  16 ++
>>>   drivers/gpu/drm/xe/xe_gt_sysfs.c      |   3 +
>>>   drivers/gpu/drm/xe/xe_pcode_api.h     |  19 +++
>>>   5 files changed, 257 insertions(+)
>>>   create mode 100644 drivers/gpu/drm/xe/xe_gt_freq_sysfs.c
>>>   create mode 100644 drivers/gpu/drm/xe/xe_gt_freq_sysfs.h
>>>
>>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>>> index b1681d1416eb..bdd9922d3db5 100644
>>> --- a/drivers/gpu/drm/xe/Makefile
>>> +++ b/drivers/gpu/drm/xe/Makefile
>>> @@ -60,6 +60,7 @@ xe-y += xe_bb.o \
>>>       xe_gt.o \
>>>       xe_gt_clock.o \
>>>       xe_gt_debugfs.o \
>>> +    xe_gt_freq_sysfs.o \
>>>       xe_gt_idle_sysfs.o \
>>>       xe_gt_mcr.o \
>>>       xe_gt_pagefault.o \
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_freq_sysfs.c 
>>> b/drivers/gpu/drm/xe/xe_gt_freq_sysfs.c
> There are few attributes under tile, few under gt.
> Should this have a common name instead of gt prefix?
Yes I'm planning on changing that. gt seems like a misnomer is this case.
>>> new file mode 100644
>>> index 000000000000..6017d09eeca2
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/xe/xe_gt_freq_sysfs.c
>>> @@ -0,0 +1,218 @@
>>> +// SPDX-License-Identifier: MIT
>>> +/*
>>> + * Copyright © 2023 Intel Corporation
>>> + */
>>> +
>>> +#include <drm/drm_managed.h>
>>> +
>>> +#include <regs/xe_gt_regs.h>
>>> +#include "xe_device.h"
>>> +#include "xe_gt.h"
>>> +#include "xe_gt_freq_sysfs.h"
>>> +#include "xe_gt_sysfs.h"
>>> +#include "xe_pcode.h"
>>> +#include "xe_pcode_api.h"
>>> +
>>> +#define GT_FREQUENCY_MULTIPLIER    50
>>> +
>>> +#define U8_8_VAL_MASK           0xffff
>>> +#define U8_8_SCALE_TO_VALUE     "0.00390625"
>>> +
>>> +static ssize_t freq_factor_scale_show(struct device *dev,
>>> +                      struct device_attribute *attr,
>>> +                      char *buff)
>>> +{
>>> +    return sysfs_emit(buff, "%s\n", U8_8_SCALE_TO_VALUE);
>>> +}
>>> +
>>> +static ssize_t base_freq_factor_show(struct device *dev,
>>> +                     struct device_attribute *attr,
>>> +                     char *buff)
>>> +{
>>> +    struct kobject *kobj = &dev->kobj;
>>> +    struct xe_gt *gt = kobj_to_gt(kobj);
>>> +    u32 val;
>>> +    int err;
>>> +
>>> +    err = xe_gt_pcode_read(gt, PVC_PCODE_QOS_MULTIPLIER_GET,
>>> +                PCODE_MBOX_DOMAIN_CHIPLET,
>>> +                PCODE_MBOX_DOMAIN_BASE, &val);
>>> +    if (err)
>>> +        return err;
>>> +
>>> +    val &= U8_8_VAL_MASK;
>>> +
>>> +    return sysfs_emit(buff, "%u\n", val);
>>> +}
>>> +
>>> +static ssize_t base_freq_factor_store(struct device *dev,
>>> +                      struct device_attribute *attr,
>>> +                      const char *buff, size_t count)
>>> +{
>>> +    struct kobject *kobj = &dev->kobj;
>>> +    struct xe_gt *gt = kobj_to_gt(kobj);
>>> +    u32 val;
>>> +    int err;
>>> +
>>> +    err = kstrtou32(buff, 0, &val);
>>> +    if (err)
>>> +        return err;
>>> +
>>> +    if (val > U8_8_VAL_MASK)
>>> +        return -EINVAL;
>>> +
>>> +    err = xe_gt_pcode_write(gt, PVC_PCODE_QOS_MULTIPLIER_SET,
>>> +                PCODE_MBOX_DOMAIN_CHIPLET,
>>> +                PCODE_MBOX_DOMAIN_BASE, val);
>>> +    if (err)
>>> +        return err;
>>> +
>>> +    return count;
>>> +}
>>> +
>>> +static DEVICE_ATTR_RW(base_freq_factor);
>>> +static struct device_attribute dev_attr_base_freq_factor_scale =
>>> +    __ATTR(base_freq_factor.scale, 0444, freq_factor_scale_show, 
>>> NULL);
>>> +
>>> +
>>> +static ssize_t base_freq_rp0_show(struct device *dev, struct 
>>> device_attribute *attr,
>>> +                  char *buff)
>>> +{
>>> +    struct kobject *kobj = &dev->kobj;
>>> +    struct xe_gt *gt = kobj_to_gt(kobj);
>>> +    u32 val;
>>> +    int err;
>>> +
>>> +    err = xe_gt_pcode_read(gt, XEHP_PCODE_FREQUENCY_CONFIG,
>>> +                PCODE_MBOX_FC_SC_READ_FUSED_P0,
>>> +                PCODE_MBOX_DOMAIN_BASE, &val);
>>> +    if (err)
>>> +        return err;
>>> +
>>> +    /* data_out - Fused P0 for domain ID in units of 50 MHz */
>>> +    val *= GT_FREQUENCY_MULTIPLIER;
>>> +
>>> +    return sysfs_emit(buff, "%u\n", val);
>>> +}
>>> +static DEVICE_ATTR_RO(base_freq_rp0);
>>> +
>>> +static ssize_t base_freq_rpn_show(struct device *dev, struct 
>>> device_attribute *attr,
>>> +                  char *buff)
>>> +{
>>> +    struct kobject *kobj = &dev->kobj;
>>> +    struct xe_gt *gt = kobj_to_gt(kobj);
>>> +    u32 val;
>>> +    int err;
>>> +
>>> +    err = xe_gt_pcode_read(gt, XEHP_PCODE_FREQUENCY_CONFIG,
>>> +                PCODE_MBOX_FC_SC_READ_FUSED_PN,
>>> +                PCODE_MBOX_DOMAIN_BASE, &val);
>>> +    if (err)
>>> +        return err;
>>> +
>>> +    /* data_out - Fused Pn for domain ID in units of 50 MHz */
>>> +    val *= GT_FREQUENCY_MULTIPLIER;
>>> +
>>> +    return sysfs_emit(buff, "%u\n", val);
>>> +}
>>> +static DEVICE_ATTR_RO(base_freq_rpn);
>>> +
>>> +static const struct attribute *perf_power_attrs[] = {
>>> +    &dev_attr_base_freq_factor.attr,
>>> +    &dev_attr_base_freq_factor_scale.attr,
>>> +    &dev_attr_base_freq_rp0.attr,
>>> +    &dev_attr_base_freq_rpn.attr,
>>> +    NULL
>>> +};
>>> +
>>> +static ssize_t freq_vram_rp0_show(struct device *dev, struct 
>>> device_attribute *attr,
>>> +                  char *buff)
>>> +{
>>> +    struct kobject *kobj = &dev->kobj;
>>> +    struct xe_gt *gt = kobj_to_gt(kobj);
>>> +    u32 val;
>>> +    int err;
>>> +
>>> +    err = xe_gt_pcode_read(gt, XEHP_PCODE_FREQUENCY_CONFIG,
>>> +                PCODE_MBOX_FC_SC_READ_FUSED_P0,
>>> +                PCODE_MBOX_DOMAIN_HBM, &val);
>>> +    if (err)
>>> +        return err;
>>> +
>>> +    /* data_out - Fused P0 for domain ID in units of 50 MHz */
>>> +    val *= GT_FREQUENCY_MULTIPLIER;
>>> +
>>> +    return sysfs_emit(buff, "%u\n", val);
>>> +}
>>> +static DEVICE_ATTR_RO(freq_vram_rp0);
>>> +
>>> +static ssize_t freq_vram_rpn_show(struct device *dev, struct 
>>> device_attribute *attr,
>>> +                  char *buff)
>>> +{
>>> +    struct kobject *kobj = &dev->kobj;
>>> +    struct xe_gt *gt = kobj_to_gt(kobj);
>>> +    u32 val;
>>> +    int err;
>>> +
>>> +    err = xe_gt_pcode_read(gt, XEHP_PCODE_FREQUENCY_CONFIG,
>>> +                PCODE_MBOX_FC_SC_READ_FUSED_PN,
>>> +                PCODE_MBOX_DOMAIN_HBM, &val);
>>> +    if (err)
>>> +        return err;
>>> +
>>> +    /* data_out - Fused P0 for domain ID in units of 50 MHz */
>>> +    val *= GT_FREQUENCY_MULTIPLIER;
>>> +
>>> +    return sysfs_emit(buff, "%u\n", val);
>>> +}
>>> +static DEVICE_ATTR_RO(freq_vram_rpn);
>>> +
>>> +static const struct attribute *vram_freq_attrs[] = {
>>> +    &dev_attr_freq_vram_rp0.attr,
>>> +    &dev_attr_freq_vram_rpn.attr,
>>> +    NULL
>>> +};
>>> +
>>> +static void gt_freq_sysfs_fini(struct drm_device *drm, void *arg)
>>> +{
>>> +    struct kobject *kobj = arg;
>>> +
>>> +    sysfs_remove_files(kobj, perf_power_attrs);
>>> +    kobject_put(kobj);
>>> +}
>>> +
>>> +void xe_gt_freq_sysfs_init(struct xe_gt *gt)
>>> +{
>>> +    struct xe_tile *tile = gt_to_tile(gt);
>>> +    struct xe_device *xe = gt_to_xe(gt);
>>> +    struct kobject *kobj;
>>> +    int err;
>>> +
>>> +    kobj = kobject_create_and_add("performance", gt->sysfs);
>>> +    if (!kobj) {
>>> +        drm_warn(&xe->drm, "%s failed, err: %d\n", __func__, -ENOMEM);
>>> +        return;
>>> +    }
>>> +
>>> +    err = sysfs_create_files(kobj, perf_power_attrs);
>>> +    if (err) {
>>> +        kobject_put(kobj);
>>> +        drm_warn(&xe->drm, "failed to register performance power 
>>> sysfs, err: %d\n", err);
>>> +        return;
>>> +    }
>>> +
>>> +    if (xe->info.platform == XE_PVC) {
>>> +        err = sysfs_create_files(tile->sysfs, vram_freq_attrs);
>>> +        if (err) {
>>> +            kobject_put(kobj);
>>> +            drm_warn(&xe->drm, "failed to register vram freq sysfs, 
>>> err: %d\n", err);
>>> +            return;
>>> +        }
>>> +
>>> +    }
> I'm seeing PVC prefix for perf_power_attrs above but you have added 
> vram_freq_attrs under pvc. Shouldn't it be the other way?
No. technically vram is expected to work only for PVC. But I should 
change the name for the perf attrs to an agnostic one.
>>> +
>>> +    err = drmm_add_action_or_reset(&xe->drm, gt_freq_sysfs_fini, 
>>> kobj);
>>> +    if (err)
>>> +        drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, 
>>> err: %d\n",
>>> +             __func__, err);
>>> +}
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_freq_sysfs.h 
>>> b/drivers/gpu/drm/xe/xe_gt_freq_sysfs.h
>>> new file mode 100644
>>> index 000000000000..7b76c4670632
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/xe/xe_gt_freq_sysfs.h
>>> @@ -0,0 +1,16 @@
>>> +/* SPDX-License-Identifier: MIT */
>>> +/*
>>> + * Copyright © 2023 Intel Corporation
>>> + */
>>> +
>>> +#ifndef _XE_GT_FREQ_SYSFS_H_
>>> +#define _XE_GT_FREQ_SYSFS_H_
>>> +
>>> +#include <drm/drm_managed.h>
>>> +
>>> +#include "xe_device.h"
>>> +#include "xe_gt.h"
>>> +
>>> +void xe_gt_freq_sysfs_init(struct xe_gt *gt);
>>> +
>>> +#endif /* _XE_GT_FREQ_SYSFS_H_ */
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.c 
>>> b/drivers/gpu/drm/xe/xe_gt_sysfs.c
>>> index c69d2e8a0fe1..3b6316ce10ed 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_sysfs.c
>>> +++ b/drivers/gpu/drm/xe/xe_gt_sysfs.c
>>> @@ -11,6 +11,7 @@
>>>   #include <drm/drm_managed.h>
>>>     #include "xe_gt.h"
>>> +#include "xe_gt_freq_sysfs.h"
>>>     static void xe_gt_sysfs_kobj_release(struct kobject *kobj)
>>>   {
>>> @@ -52,6 +53,8 @@ void xe_gt_sysfs_init(struct xe_gt *gt)
>>>         gt->sysfs = &kg->base;
>>>   +    xe_gt_freq_sysfs_init(gt);
>>> +
>>>       err = drmm_add_action_or_reset(&xe->drm, gt_sysfs_fini, gt);
>>>       if (err) {
>>>           drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, 
>>> err: %d\n",
>>> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h 
>>> b/drivers/gpu/drm/xe/xe_pcode_api.h
>>> index 837ff7c71280..da4114bfaa7a 100644
>>> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
>>> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
>>> @@ -30,6 +30,25 @@
>>>   #define   PCODE_READ_MIN_FREQ_TABLE    0x9
>>>   #define   PCODE_FREQ_RING_RATIO_SHIFT    16
>>>   +#define   XEHP_PCODE_FREQUENCY_CONFIG            0x6e    /* xehp, 
>>> pvc */
>>> +/* XEHP_PCODE_FREQUENCY_CONFIG sub-commands (param1) */
>>> +#define     PCODE_MBOX_FC_SC_READ_FUSED_P0        0x0
>>> +#define     PCODE_MBOX_FC_SC_READ_FUSED_PN        0x1
>>> +/* PCODE_MBOX_DOMAIN_* - mailbox domain IDs */
>>> +/* XEHP_PCODE_FREQUENCY_CONFIG param2 */
>>> +#define     PCODE_MBOX_DOMAIN_NONE            0x0
>>> +#define     PCODE_MBOX_DOMAIN_GT            0x1
>>> +#define     PCODE_MBOX_DOMAIN_HBM            0x2
>>> +#define     PCODE_MBOX_DOMAIN_MEDIAFF            0x3
>>> +#define     PCODE_MBOX_DOMAIN_MEDIA_SAMPLER        0x4
>>> +#define     PCODE_MBOX_DOMAIN_SYSTOLIC_ARRAY        0x5
>>> +#define     PCODE_MBOX_DOMAIN_CHIPLET            0x6
>>> +#define     PCODE_MBOX_DOMAIN_BASE_CHIPLET_LINK        0x7
>>> +#define     PCODE_MBOX_DOMAIN_BASE            0x8
>>> +#define   PVC_PCODE_QOS_MULTIPLIER_SET            0x67
> Add only the mailboxes that are being used.
>
> Thanks
> Riana Tauro
Sure.
>>> +/* See PCODE_MBOX_DOMAIN_* - mailbox domain IDs - param1 and 2 */
>>> +#define   PVC_PCODE_QOS_MULTIPLIER_GET            0x66
>>> +
>>>   /* PCODE Init */
>>>   #define   DGFX_PCODE_STATUS        0x7E
>>>   #define     DGFX_GET_INIT_STATUS    0x0
>>> -- 
>>> 2.25.1
>>>
