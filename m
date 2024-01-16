Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BF4EC47077
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jan 2024 16:53:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 383CF10E552;
	Tue, 16 Jan 2024 16:53:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECC9910E032
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jan 2024 16:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705424017; x=1736960017;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=G4TqD0sLn+N3EtZfISSZfRwAFPbD1AIx4tuuLAl5aWI=;
 b=KCTMq/qJ8274CkI2RXfWJEaYmzuXoB2NbHeHzJDWJZIbWLXfJxvDIaFS
 et0mA4RK8emm9ftze5b4O+S0N31LbvEK+9SYzDnWt5oXft+aj3neoqF30
 s1VaVzYJcj53SbK6YaPRb8zcXTU5qgN+ctoS3vSmJL81YW4JGMmVLDNv0
 ueBXJlH08dFK+HI0s5766J9DWYgMRnazq0tPEW9mhL612D+jXH962fEVj
 XzTU6C7GwlCGGO3SmEHhmyCmJ0+lahG4ZRWWAJ2nBC9Kd8Vq0ROd+Rwc/
 m+SG4sovh4ggq+lseZRvkR+0X0XHmj6m824H+0htlqdzw5dCXUfR8y+WZ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="399585797"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; d="scan'208";a="399585797"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 08:53:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; d="scan'208";a="25866115"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Jan 2024 08:53:33 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Jan 2024 08:53:33 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Jan 2024 08:53:32 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 16 Jan 2024 08:53:32 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 16 Jan 2024 08:53:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jkozL3w+E5BrBsmCFB5WvNMUZa2F45KXuJs+DeaedMzImzzAwzNfG8JTAORfbQlAv6bXcXestNWYB6OCCUSqB+uUhwuAfX92UDrRZI65EqNAlrAkNISTBpFbzt4BpSHdVfe/lyJqNetNxxzSrxi+fzjlcUvuI6yUThJfgqmm8AKto9198lfhjLtS8/B2vu0/oOFdVfmtewXBQPMZmrpqwW/8Px7R0Cqo1x/mOMBqoNzY113XFvGYJAqeI0CVsrrZYf/8/SQPYYH6LsznUHD+Z78iYwj2vKXsxjuJR+hxHs4HgxJTqVRFmpX5OojIF3aB1PtQMSNx4R+B+R3boZsF7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DSolGOZ/F9dPeKZe9l5eqKG1e7AhjYKbPLpr49QsCjc=;
 b=HchmMAr7c7wa3Y5SBl6Jfz5zGUlbJoHKB1eel5Z4eF6H7h9iC7ZXcpkJsR7EcwHw6nNJzYkebUqkRQW3PfGbfA3s7TTkK/CGqF0AmL8/vjCm3D/+YT8rupmpy9w2Rb3iDNh2hJ5G58aYkykWkmqw44f5ETm77cco/JouuX0203vU2BrQ4r6V12JE18WgkrASZsHFsN0B7esqwU1xEYFuZyHvUXGhHPwyyH/LsayRMPoyrB91j1CdLfCDV5Cni31EBmV41muks2aBW27WJiEn2e5moUPLwSCCTZiP89b7+4/bw+kW2A6Z5vMLs5MMWWumkMj+mndrOt5lObA3/lnJ5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by IA1PR11MB7824.namprd11.prod.outlook.com (2603:10b6:208:3f9::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.21; Tue, 16 Jan
 2024 16:53:29 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::73d0:f907:41e4:4a34]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::73d0:f907:41e4:4a34%4]) with mapi id 15.20.7181.020; Tue, 16 Jan 2024
 16:53:29 +0000
Message-ID: <77f37778-d296-4b9f-8f7c-cafb048c407e@intel.com>
Date: Tue, 16 Jan 2024 08:53:25 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/xe/gsc: Initialize GSC proxy
Content-Language: en-US
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20240110004416.1127942-1-daniele.ceraolospurio@intel.com>
 <20240110004416.1127942-2-daniele.ceraolospurio@intel.com>
 <SN7PR11MB6750C8AA2962E4ED61D244DCE3732@SN7PR11MB6750.namprd11.prod.outlook.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <SN7PR11MB6750C8AA2962E4ED61D244DCE3732@SN7PR11MB6750.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0364.namprd04.prod.outlook.com
 (2603:10b6:303:81::9) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|IA1PR11MB7824:EE_
X-MS-Office365-Filtering-Correlation-Id: 3faa265e-d459-4fbb-32ee-08dc16b3aa44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AokjlvTF7KrHjKOZx1bII5ap7ukFqU9eRJKrWaRIBdPvlXHcLcGRTwOcDTSrNLtVujN3tCFKc/tGI1EIKAz955t/e+RziYfBVsSIuGwrBUUVkemEod0POg1Cnp30fK5xOZTSB3WtKu192D4SfmxsToFHmUd6sOdA3bb0YUHYKL1go5OFpl9iwojKnUzGLD3dA358teVv/kCQkKQ3Dwj4Yzujg5pWeKub3nMPOXd2919MeB4eTVmTrzQ7drvyKbLCkdRTJCVRbLA7Vf3IFZrcsVQysCv1ig0olmOFYzJg1KtMarjJaH6t1TssX0V6dKpctlOZmvuMXMpoekPxfAkEZQW69poc3CcKqpYdpt9EyGG7ltoTS68A1flSM7kUdNkbAvKYF3Wn2VMeRP8fkED+M571Mhliz4hfN2nPuWwrq/PBHRdi0h5Yq0b6YEECfIhNDqsp6M2E75NsC6uVVEbrGfiX+S60D/BjZUzh4aS6X1ZvfmG55nofa8DauufYHMqHsltRd+OjdEYERpyraE/yk5LQ3Lbtr+72u8yDS9XhM5uoqri0vuoS3miCQuXStU6NZO25/RkoMYp80YYXfZ7YqZdHjCy9jIGJV6bcfeIEIAl5w34+nZrVXXL8zVmKWAFebfEW0+FKUq6AbEf+tGTSkQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(396003)(376002)(39860400002)(136003)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(31686004)(8676002)(478600001)(53546011)(5660300002)(6512007)(2906002)(2616005)(6666004)(66946007)(8936002)(66476007)(110136005)(316002)(107886003)(66556008)(26005)(6486002)(6506007)(30864003)(38100700002)(4326008)(83380400001)(41300700001)(86362001)(36756003)(31696002)(82960400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWtXN2plRDkxNnozTkU4aVhPMHdzemY4ZWJPZHgxdkFKTHZocHE5OGFwRHFz?=
 =?utf-8?B?VUo5QVB6NkVCcVhkeHNoOTdMc2lMRy8rUlZQWEFmRDJ4ckJBWnNkanlaQkN0?=
 =?utf-8?B?c3BFTzNIUi9PcHh2ZGtJc3ZuWTlocnlSdlJTOWdRWXJ2ZGpuQjIrVkdjRk1j?=
 =?utf-8?B?YWoxUzVnbXVvNGd1L3NaemJzZmMwNXdYVWtkMkxpbXErOUNFbGhWeWxPQ3JZ?=
 =?utf-8?B?TE1EMFlVM1ZVYlJveFFSSDVJMzFFUlFDNzB1SnZYWnV6emN1ZVpab0pocmF1?=
 =?utf-8?B?cXpZWkxCT1Vid3JrT05GV0V0K0prZG9wRzdLVWVkYXhKMVhtSmkwWHBndENw?=
 =?utf-8?B?MlczQ2NkanZsTjd5VUdLcVVCamcxNkNqL3MzUk9WbUsvSE00aHNTVUNwQmd5?=
 =?utf-8?B?QVRvUGFYRlh2SmsxbnB6NCtnWjh3bFJsV1JBS3cxQWJkYUxvcS82YkFBa2Jo?=
 =?utf-8?B?Tmdjc0RvRm9EaVF3T3pRdk9kbGIzZXMzSVZNNGk4M2cyYlRFN3RiSUxPUFdR?=
 =?utf-8?B?bUZQaHo0V01rRENQNjRISjRZVExpbUhSZ0FxaVFZU2c3d0R6UUo3RTVLWEFW?=
 =?utf-8?B?UU1PTWhvUHRDSjNxL2J4ekg1YnpnQmJ4N050WFZucmZRaHFsZWxnMWZnUGJ6?=
 =?utf-8?B?NW4zODFETGxUeFErUysvUUN2ZlN0Sm9kWG9LSVFKVDNrdDRVY1pKQWVMQUFJ?=
 =?utf-8?B?SU0wRFk1SjhuYi9TZ05BL3lCN3NRMXdWWVJpYkpyNnpkRHNoakdXN0kySkxm?=
 =?utf-8?B?dTBjaFhvajRYOU9GeDdkaVNSZW9SempNUXRBV1NxUDd6aWlNaUpXV3Y4M2tP?=
 =?utf-8?B?Ym1ZWit4U0dTSkZ2WVVpUkgwU21LemNFWkFLNVgyU0NFY3FPNXNQM3dkZ1hz?=
 =?utf-8?B?d2lGbi9OWm1obXk5dTNZS1U1ajlXUGtLVlM0Snd0WXNrMXZxVng1Y29aYytt?=
 =?utf-8?B?eUlhUHQrYm1xYTJOUHdYQkxFUTdTaXBsYitUR2lZMDY5TzMvWllQNXAxczRU?=
 =?utf-8?B?dFcxNXg5eUtmeXVGUTZ0K2hlQm5LY0JIR0NnU2RVWmJpaHNoeEhNMDV1M2FH?=
 =?utf-8?B?M0hFU2NEWGRpNE4yRmJHcHU5OXU1Sjh5UWFDdUIwRWs5a0c2bStkUndXakhn?=
 =?utf-8?B?cWgwQXR3U2dmQlBhMXdpNmRDTG5Vb08xT1RLNGhKcHZaRWQrVVBKa3JsdEhw?=
 =?utf-8?B?WGk0QXdBSnJPTmo1TGNlYzVGWTZMV0RlU1ZpWm53SWoxWmpXVjdlMUpxSUlI?=
 =?utf-8?B?bUVwWElMTVpxRDU5Y3dUY2Rza1Z0STY1SDBpZHAwTTc0aGNsdXBGcGJjVEo0?=
 =?utf-8?B?ZHBLbTVpbm1RZjhFeDZtYW9zeTNvSUdybi9xTGV6b3pEQ2gxVU1JOG1Cd3ZI?=
 =?utf-8?B?dE5vS1RiZUdOMG5NemxzYlFPeUxJZTNrWjZxNUluNWNLU3ZKYjNJbjNMV0ZD?=
 =?utf-8?B?bUtWcTdQeCtva2gvb21yaHpwS1BYRSs1TExNOExvTWQxcEVTQXVaekUwbytv?=
 =?utf-8?B?YmtleDdQdk85eXp4QlhPSUJZU0JHNkU5cHA3WUtrWVYvckZHVUVjdGF3UFdU?=
 =?utf-8?B?TkF2LzdtQkd2ZFZ0WVVjWXkxZjZvVkorN0xNNkxYZUtKaldPZk84dG0ydlFU?=
 =?utf-8?B?MXlCSXN0bGxsc2dXKzFTdWJSL0Z0RWpiSW9ObnQ1UlgxdjRLWDNwR0xZd3Rr?=
 =?utf-8?B?QUJ6OUlPV00zbDRJY0wvQU1SR1FOYXdoc1MxWUYxWFNRZDVPYW1yeUlPQi9M?=
 =?utf-8?B?V3NlQit1SjdHc0x1QWFINDR5cWhXVGU5bTVsWHBkN0NmdXBhYmFROUtPajE4?=
 =?utf-8?B?YmJVTU1LNTVzQ0VsY2pwK1hTZGNEb3UyMFFibFBFbnpET2E2RUVTRWdxNEk3?=
 =?utf-8?B?NmZuV1hGZHBzYy9ORlhMUU1GNWhaODJqeFlZd0puS1ZWR0hZZmQ3eDQwTkhm?=
 =?utf-8?B?cWN3TFIxTjBwaU5aV1d1cGVXQ2IyVHVOZjE5S3Z0bHVwUTJrQng1WHZLVzFh?=
 =?utf-8?B?U3ZDamwvL3RLR0NaMU1kS0dENFhyUFBXSTlaSFNXRUZsYXlxbzJ2WTNoakZ5?=
 =?utf-8?B?bVpGTXJYai9zdmR6RXhEbHVlbDA3YU56cndZTy9wOCt1NzVIMXprdkxhdXNa?=
 =?utf-8?B?V1BnM1grR2l3bVZrNXVIN1pnZ0U5Mm9Gd3RZZ0VrN05rRCtQL2FaY2lXMDB5?=
 =?utf-8?Q?TKPreshQS/73szixnj1s/kI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3faa265e-d459-4fbb-32ee-08dc16b3aa44
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2024 16:53:29.3355 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U+gcfnS57ac7vWGpmCQW93NAAVaQxVuOVHsW3qazWFy5efg9ZBqzQJOjXtNngX0K+Ux+jJYVxhXqt0XxQMiKu0Du88mJjKLGKPWCEJForKM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7824
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



On 1/15/2024 10:13 PM, Kandpal, Suraj wrote:
> I was under the impression that this patch series will introduce a function which
> Checks the running status of the firmware is it not so or is that going to be a part
> Another series.

The checkers should be all there, they're just not exposed outside of 
the gsc_proxy file because there is no user for them at the moment. Note 
that a big difference is that here we expect the caller to handle the PM 
refs (Xe in general is a lot more explicit about the PM handling).

>
>> Subject: [PATCH v2 1/2] drm/xe/gsc: Initialize GSC proxy
>>
>> The GSC uC needs to communicate with the CSME to perform certain
>> operations. Since the GSC can't perform this communication directly on
>> platforms where it is integrated in GT, the graphics driver needs to transfer the
>> messages from GSC to CSME and back. The proxy flow must be manually
>> started after the GSC is loaded to signal to GSC that we're ready to handle its
>> messages and allow it to query its init data from CSME.
>>
>> Note that the component must be removed before the pci_remove call
>> completes, so we can't use a drmm helper for it and we need to instead
> Also a typo here *drm helper

not a typo, the functions have 2 "m" in their names ;)

Daniele

>
> Regards,
> Suraj Kandpal
>> perform the cleanup as part of the removal flow.
>>
>> v2: add function documentation, more targeted memory clear, clearer logs
>> and variable names (Alan)
>>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>> Cc: Suraj Kandpal <suraj.kandpal@intel.com>
>> ---
>>   drivers/gpu/drm/xe/Makefile                   |   1 +
>>   .../gpu/drm/xe/abi/gsc_proxy_commands_abi.h   |  44 ++
>>   drivers/gpu/drm/xe/xe_device.c                |  22 +-
>>   drivers/gpu/drm/xe/xe_gsc.c                   |  52 +-
>>   drivers/gpu/drm/xe/xe_gsc.h                   |   1 +
>>   drivers/gpu/drm/xe/xe_gsc_proxy.c             | 468 ++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_gsc_proxy.h             |  17 +
>>   drivers/gpu/drm/xe/xe_gsc_submit.c            |  13 +
>>   drivers/gpu/drm/xe/xe_gsc_submit.h            |   1 +
>>   drivers/gpu/drm/xe/xe_gsc_types.h             |  23 +
>>   drivers/gpu/drm/xe/xe_gt.c                    |  13 +
>>   drivers/gpu/drm/xe/xe_gt.h                    |   1 +
>>   drivers/gpu/drm/xe/xe_uc.c                    |  14 +
>>   drivers/gpu/drm/xe/xe_uc.h                    |   1 +
>>   14 files changed, 658 insertions(+), 13 deletions(-)  create mode 100644
>> drivers/gpu/drm/xe/abi/gsc_proxy_commands_abi.h
>>   create mode 100644 drivers/gpu/drm/xe/xe_gsc_proxy.c  create mode
>> 100644 drivers/gpu/drm/xe/xe_gsc_proxy.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile index
>> 6952da8979ea..d8dd43bb34b0 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -77,6 +77,7 @@ xe-y += xe_bb.o \
>>   	xe_ggtt.o \
>>   	xe_gpu_scheduler.o \
>>   	xe_gsc.o \
>> +	xe_gsc_proxy.o \
>>   	xe_gsc_submit.o \
>>   	xe_gt.o \
>>   	xe_gt_ccs_mode.o \
>> diff --git a/drivers/gpu/drm/xe/abi/gsc_proxy_commands_abi.h
>> b/drivers/gpu/drm/xe/abi/gsc_proxy_commands_abi.h
>> new file mode 100644
>> index 000000000000..80bbf06a3eb8
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/abi/gsc_proxy_commands_abi.h
>> @@ -0,0 +1,44 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#ifndef _ABI_GSC_PROXY_COMMANDS_ABI_H
>> +#define _ABI_GSC_PROXY_COMMANDS_ABI_H
>> +
>> +#include <linux/types.h>
>> +
>> +/* Heci client ID for proxy commands */ #define HECI_MEADDRESS_PROXY 10
>> +
>> +/* FW-defined proxy header */
>> +struct xe_gsc_proxy_header {
>> +	/*
>> +	 * hdr:
>> +	 * Bits 0-7: type of the proxy message (see enum xe_gsc_proxy_type)
>> +	 * Bits 8-15: rsvd
>> +	 * Bits 16-31: length in bytes of the payload following the proxy
>> header
>> +	 */
>> +	u32 hdr;
>> +#define GSC_PROXY_TYPE		 GENMASK(7, 0)
>> +#define GSC_PROXY_PAYLOAD_LENGTH GENMASK(31, 16)
>> +
>> +	u32 source;		/* Source of the Proxy message */
>> +	u32 destination;	/* Destination of the Proxy message */
>> +#define GSC_PROXY_ADDRESSING_KMD  0x10000 #define
>> +GSC_PROXY_ADDRESSING_GSC  0x20000 #define
>> GSC_PROXY_ADDRESSING_CSME
>> +0x30000
>> +
>> +	u32 status;		/* Command status */
>> +} __packed;
>> +
>> +/* FW-defined proxy types */
>> +enum xe_gsc_proxy_type {
>> +	GSC_PROXY_MSG_TYPE_PROXY_INVALID = 0,
>> +	GSC_PROXY_MSG_TYPE_PROXY_QUERY = 1,
>> +	GSC_PROXY_MSG_TYPE_PROXY_PAYLOAD = 2,
>> +	GSC_PROXY_MSG_TYPE_PROXY_END = 3,
>> +	GSC_PROXY_MSG_TYPE_PROXY_NOTIFICATION = 4, };
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index 004e65544e8d..7e1d39488472 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -26,6 +26,7 @@
>>   #include "xe_exec_queue.h"
>>   #include "xe_exec.h"
>>   #include "xe_ggtt.h"
>> +#include "xe_gsc_proxy.h"
>>   #include "xe_gt.h"
>>   #include "xe_gt_mcr.h"
>>   #include "xe_irq.h"
>> @@ -434,6 +435,7 @@ int xe_device_probe(struct xe_device *xe)
>>   	struct xe_tile *tile;
>>   	struct xe_gt *gt;
>>   	int err;
>> +	u8 last_gt;
>>   	u8 id;
>>
>>   	xe_pat_init_early(xe);
>> @@ -521,16 +523,18 @@ int xe_device_probe(struct xe_device *xe)
>>   		goto err_irq_shutdown;
>>
>>   	for_each_gt(gt, xe, id) {
>> +		last_gt = id;
>> +
>>   		err = xe_gt_init(gt);
>>   		if (err)
>> -			goto err_irq_shutdown;
>> +			goto err_fini_gt;
>>   	}
>>
>>   	xe_heci_gsc_init(xe);
>>
>>   	err = xe_display_init(xe);
>>   	if (err)
>> -		goto err_irq_shutdown;
>> +		goto err_fini_gt;
>>
>>   	err = drm_dev_register(&xe->drm, 0);
>>   	if (err)
>> @@ -551,6 +555,14 @@ int xe_device_probe(struct xe_device *xe)
>>   err_fini_display:
>>   	xe_display_driver_remove(xe);
>>
>> +err_fini_gt:
>> +	for_each_gt(gt, xe, id) {
>> +		if (id < last_gt)
>> +			xe_gt_remove(gt);
>> +		else
>> +			break;
>> +	}
>> +
>>   err_irq_shutdown:
>>   	xe_irq_shutdown(xe);
>>   err:
>> @@ -568,12 +580,18 @@ static void xe_device_remove_display(struct
>> xe_device *xe)
>>
>>   void xe_device_remove(struct xe_device *xe)  {
>> +	struct xe_gt *gt;
>> +	u8 id;
>> +
>>   	xe_device_remove_display(xe);
>>
>>   	xe_display_fini(xe);
>>
>>   	xe_heci_gsc_fini(xe);
>>
>> +	for_each_gt(gt, xe, id)
>> +		xe_gt_remove(gt);
>> +
>>   	xe_irq_shutdown(xe);
>>   }
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c index
>> a8a895cf4b44..b19e3f676a10 100644
>> --- a/drivers/gpu/drm/xe/xe_gsc.c
>> +++ b/drivers/gpu/drm/xe/xe_gsc.c
>> @@ -13,6 +13,7 @@
>>   #include "xe_bo.h"
>>   #include "xe_device.h"
>>   #include "xe_exec_queue.h"
>> +#include "xe_gsc_proxy.h"
>>   #include "xe_gsc_submit.h"
>>   #include "xe_gt.h"
>>   #include "xe_gt_printk.h"
>> @@ -242,8 +243,31 @@ static int gsc_upload(struct xe_gsc *gsc)
>>   	if (err)
>>   		return err;
>>
>> +	return 0;
>> +}
>> +
>> +static int gsc_upload_and_init(struct xe_gsc *gsc) {
>> +	struct xe_gt *gt = gsc_to_gt(gsc);
>> +	int ret;
>> +
>> +	ret = gsc_upload(gsc);
>> +	if (ret)
>> +		return ret;
>> +
>> +	xe_uc_fw_change_status(&gsc->fw,
>> XE_UC_FIRMWARE_TRANSFERRED);
>>   	xe_gt_dbg(gt, "GSC FW async load completed\n");
>>
>> +	/* HuC auth failure is not fatal */
>> +	if (xe_huc_is_authenticated(&gt->uc.huc, XE_HUC_AUTH_VIA_GUC))
>> +		xe_huc_auth(&gt->uc.huc, XE_HUC_AUTH_VIA_GSC);
>> +
>> +	ret = xe_gsc_proxy_start(gsc);
>> +	if (ret)
>> +		return ret;
>> +
>> +	xe_gt_dbg(gt, "GSC proxy init completed\n");
>> +
>>   	return 0;
>>   }
>>
>> @@ -257,19 +281,12 @@ static void gsc_work(struct work_struct *work)
>>   	xe_device_mem_access_get(xe);
>>   	xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC);
>>
>> -	ret = gsc_upload(gsc);
>> -	if (ret && ret != -EEXIST) {
>> +	ret = gsc_upload_and_init(gsc);
>> +	if (ret && ret != -EEXIST)
>>   		xe_uc_fw_change_status(&gsc->fw,
>> XE_UC_FIRMWARE_LOAD_FAIL);
>> -		goto out;
>> -	}
>> -
>> -	xe_uc_fw_change_status(&gsc->fw,
>> XE_UC_FIRMWARE_TRANSFERRED);
>> -
>> -	/* HuC auth failure is not fatal */
>> -	if (xe_huc_is_authenticated(&gt->uc.huc, XE_HUC_AUTH_VIA_GUC))
>> -		xe_huc_auth(&gt->uc.huc, XE_HUC_AUTH_VIA_GSC);
>> +	else
>> +		xe_uc_fw_change_status(&gsc->fw,
>> XE_UC_FIRMWARE_RUNNING);
>>
>> -out:
>>   	xe_force_wake_put(gt_to_fw(gt), XE_FW_GSC);
>>   	xe_device_mem_access_put(xe);
>>   }
>> @@ -302,6 +319,10 @@ int xe_gsc_init(struct xe_gsc *gsc)
>>   	else if (ret)
>>   		goto out;
>>
>> +	ret = xe_gsc_proxy_init(gsc);
>> +	if (ret && ret != -ENODEV)
>> +		goto out;
>> +
>>   	return 0;
>>
>>   out:
>> @@ -410,6 +431,15 @@ void xe_gsc_wait_for_worker_completion(struct
>> xe_gsc *gsc)
>>   		flush_work(&gsc->work);
>>   }
>>
>> +/**
>> + * xe_gsc_remove() - Clean up the GSC structures before driver removal
>> + * @gsc: the GSC uC
>> + */
>> +void xe_gsc_remove(struct xe_gsc *gsc)
>> +{
>> +	xe_gsc_proxy_remove(gsc);
>> +}
>> +
>>   /*
>>    * wa_14015076503: if the GSC FW is loaded, we need to alert it before doing
>> a
>>    * GSC engine reset by writing a notification bit in the GS1 register and then
>> diff --git a/drivers/gpu/drm/xe/xe_gsc.h b/drivers/gpu/drm/xe/xe_gsc.h index
>> bc1ef7f31ea2..c6fb32e3fd79 100644
>> --- a/drivers/gpu/drm/xe/xe_gsc.h
>> +++ b/drivers/gpu/drm/xe/xe_gsc.h
>> @@ -14,6 +14,7 @@ int xe_gsc_init(struct xe_gsc *gsc);  int
>> xe_gsc_init_post_hwconfig(struct xe_gsc *gsc);  void
>> xe_gsc_wait_for_worker_completion(struct xe_gsc *gsc);  void
>> xe_gsc_load_start(struct xe_gsc *gsc);
>> +void xe_gsc_remove(struct xe_gsc *gsc);
>>
>>   void xe_gsc_wa_14015076503(struct xe_gt *gt, bool prep);
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gsc_proxy.c
>> b/drivers/gpu/drm/xe/xe_gsc_proxy.c
>> new file mode 100644
>> index 000000000000..86353c5a81cd
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_gsc_proxy.c
>> @@ -0,0 +1,468 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#include "xe_gsc_proxy.h"
>> +
>> +#include <linux/component.h>
>> +#include <linux/delay.h>
>> +
>> +#include <drm/drm_managed.h>
>> +#include <drm/i915_component.h>
>> +#include <drm/i915_gsc_proxy_mei_interface.h>
>> +
>> +#include "abi/gsc_proxy_commands_abi.h"
>> +#include "regs/xe_gsc_regs.h"
>> +#include "xe_bo.h"
>> +#include "xe_gsc.h"
>> +#include "xe_gsc_submit.h"
>> +#include "xe_gt.h"
>> +#include "xe_gt_printk.h"
>> +#include "xe_map.h"
>> +#include "xe_mmio.h"
>> +
>> +/*
>> + * GSC proxy:
>> + * The GSC uC needs to communicate with the CSME to perform certain
>> operations.
>> + * Since the GSC can't perform this communication directly on platforms
>> +where it
>> + * is integrated in GT, the graphics driver needs to transfer the
>> +messages from
>> + * GSC to CSME and back. The proxy flow must be manually started after
>> +the GSC
>> + * is loaded to signal to GSC that we're ready to handle its messages
>> +and allow
>> + * it to query its init data from CSME; GSC will then trigger an HECI2
>> +interrupt
>> + * if it needs to send messages to CSME again.
>> + * The proxy flow is as follow:
>> + * 1 - Xe submits a request to GSC asking for the message to CSME
>> + * 2 - GSC replies with the proxy header + payload for CSME
>> + * 3 - Xe sends the reply from GSC as-is to CSME via the mei proxy
>> +component
>> + * 4 - CSME replies with the proxy header + payload for GSC
>> + * 5 - Xe submits a request to GSC with the reply from CSME
>> + * 6 - GSC replies either with a new header + payload (same as step 2, so we
>> + *     restart from there) or with an end message.
>> + */
>> +
>> +/*
>> + * The component should load quite quickly in most cases, but it could
>> +take
>> + * a bit. Using a very big timeout just to cover the worst case
>> +scenario  */ #define GSC_PROXY_INIT_TIMEOUT_MS 20000
>> +
>> +/* shorthand define for code compactness */ #define PROXY_HDR_SIZE
>> +(sizeof(struct xe_gsc_proxy_header))
>> +
>> +/* the protocol supports up to 32K in each direction */ #define
>> +GSC_PROXY_BUFFER_SIZE SZ_32K #define GSC_PROXY_CHANNEL_SIZE
>> +(GSC_PROXY_BUFFER_SIZE * 2)
>> +
>> +static struct xe_gt *
>> +gsc_to_gt(struct xe_gsc *gsc)
>> +{
>> +	return container_of(gsc, struct xe_gt, uc.gsc); }
>> +
>> +static inline struct xe_device *kdev_to_xe(struct device *kdev) {
>> +	return dev_get_drvdata(kdev);
>> +}
>> +
>> +static bool gsc_proxy_init_done(struct xe_gsc *gsc) {
>> +	struct xe_gt *gt = gsc_to_gt(gsc);
>> +	u32 fwsts1 = xe_mmio_read32(gt,
>> HECI_FWSTS1(MTL_GSC_HECI1_BASE));
>> +
>> +	return REG_FIELD_GET(HECI1_FWSTS1_CURRENT_STATE, fwsts1) ==
>> +	       HECI1_FWSTS1_PROXY_STATE_NORMAL; }
>> +
>> +static int proxy_send_to_csme(struct xe_gsc *gsc, u32 size) {
>> +	struct xe_gt *gt = gsc_to_gt(gsc);
>> +	struct i915_gsc_proxy_component *comp = gsc->proxy.component;
>> +	int ret;
>> +
>> +	ret = comp->ops->send(comp->mei_dev, gsc->proxy.to_csme, size);
>> +	if (ret < 0) {
>> +		xe_gt_err(gt, "Failed to send CSME proxy message\n");
>> +		return ret;
>> +	}
>> +
>> +	ret = comp->ops->recv(comp->mei_dev, gsc->proxy.from_csme,
>> GSC_PROXY_BUFFER_SIZE);
>> +	if (ret < 0) {
>> +		xe_gt_err(gt, "Failed to receive CSME proxy message\n");
>> +		return ret;
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +static int proxy_send_to_gsc(struct xe_gsc *gsc, u32 size) {
>> +	struct xe_gt *gt = gsc_to_gt(gsc);
>> +	u64 addr_in = xe_bo_ggtt_addr(gsc->proxy.bo);
>> +	u64 addr_out = addr_in + GSC_PROXY_BUFFER_SIZE;
>> +	int err;
>> +
>> +	/* the message must contain at least the gsc and proxy headers */
>> +	if (size > GSC_PROXY_BUFFER_SIZE) {
>> +		xe_gt_err(gt, "Invalid GSC proxy message size: %u\n", size);
>> +		return -EINVAL;
>> +	}
>> +
>> +	err = xe_gsc_pkt_submit_kernel(gsc, addr_in, size,
>> +				       addr_out, GSC_PROXY_BUFFER_SIZE);
>> +	if (err) {
>> +		xe_gt_err(gt, "Failed to submit gsc proxy rq (%pe)\n",
>> ERR_PTR(err));
>> +		return err;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int validate_proxy_header(struct xe_gsc_proxy_header *header,
>> +				 u32 source, u32 dest, u32 max_size) {
>> +	u32 type = FIELD_GET(GSC_PROXY_TYPE, header->hdr);
>> +	u32 length = FIELD_GET(GSC_PROXY_PAYLOAD_LENGTH, header-
>>> hdr);
>> +
>> +	if (header->destination != dest || header->source != source)
>> +		return -ENOEXEC;
>> +
>> +	if (length + PROXY_HDR_SIZE > max_size)
>> +		return -E2BIG;
>> +
>> +	switch (type) {
>> +	case GSC_PROXY_MSG_TYPE_PROXY_PAYLOAD:
>> +		if (length > 0)
>> +			break;
>> +		fallthrough;
>> +	case GSC_PROXY_MSG_TYPE_PROXY_INVALID:
>> +		return -EIO;
>> +	default:
>> +		break;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +#define proxy_header_wr(xe_, map_, offset_, field_, val_) \
>> +	xe_map_wr_field(xe_, map_, offset_, struct xe_gsc_proxy_header,
>> +field_, val_)
>> +
>> +#define proxy_header_rd(xe_, map_, offset_, field_) \
>> +	xe_map_rd_field(xe_, map_, offset_, struct xe_gsc_proxy_header,
>> +field_)
>> +
>> +static u32 emit_proxy_header(struct xe_device *xe, struct iosys_map
>> +*map, u32 offset) {
>> +	xe_map_memset(xe, map, offset, 0, PROXY_HDR_SIZE);
>> +
>> +	proxy_header_wr(xe, map, offset, hdr,
>> +			FIELD_PREP(GSC_PROXY_TYPE,
>> GSC_PROXY_MSG_TYPE_PROXY_QUERY) |
>> +			FIELD_PREP(GSC_PROXY_PAYLOAD_LENGTH, 0));
>> +
>> +	proxy_header_wr(xe, map, offset, source,
>> GSC_PROXY_ADDRESSING_KMD);
>> +	proxy_header_wr(xe, map, offset, destination,
>> GSC_PROXY_ADDRESSING_GSC);
>> +	proxy_header_wr(xe, map, offset, status, 0);
>> +
>> +	return offset + PROXY_HDR_SIZE;
>> +}
>> +
>> +static int proxy_query(struct xe_gsc *gsc) {
>> +	struct xe_gt *gt = gsc_to_gt(gsc);
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +	struct xe_gsc_proxy_header *to_csme_hdr = gsc->proxy.to_csme;
>> +	void *to_csme_payload = gsc->proxy.to_csme + PROXY_HDR_SIZE;
>> +	u32 wr_offset;
>> +	u32 reply_offset;
>> +	u32 size;
>> +	int ret;
>> +
>> +	wr_offset = xe_gsc_emit_header(xe, &gsc->proxy.to_gsc, 0,
>> +				       HECI_MEADDRESS_PROXY, 0,
>> PROXY_HDR_SIZE);
>> +	wr_offset = emit_proxy_header(xe, &gsc->proxy.to_gsc, wr_offset);
>> +
>> +	size = wr_offset;
>> +
>> +	while (1) {
>> +		/*
>> +		 * Poison the GSC response header space to make sure we
>> don't
>> +		 * read a stale reply.
>> +		 */
>> +		xe_gsc_poison_header(xe, &gsc->proxy.from_gsc, 0);
>> +
>> +		/* send proxy message to GSC */
>> +		ret = proxy_send_to_gsc(gsc, size);
>> +		if (ret)
>> +			goto proxy_error;
>> +
>> +		/* check the reply from GSC */
>> +		ret = xe_gsc_read_out_header(xe, &gsc->proxy.from_gsc, 0,
>> +					     PROXY_HDR_SIZE, &reply_offset);
>> +		if (ret) {
>> +			xe_gt_err(gt, "Invalid gsc header in proxy reply
>> (%pe)\n",
>> +				  ERR_PTR(ret));
>> +			goto proxy_error;
>> +		}
>> +
>> +		/* copy the proxy header reply from GSC */
>> +		xe_map_memcpy_from(xe, to_csme_hdr, &gsc-
>>> proxy.from_gsc,
>> +				   reply_offset, PROXY_HDR_SIZE);
>> +
>> +		/* stop if this was the last message */
>> +		if (FIELD_GET(GSC_PROXY_TYPE, to_csme_hdr->hdr) ==
>> GSC_PROXY_MSG_TYPE_PROXY_END)
>> +			break;
>> +
>> +		/* make sure the GSC-to-CSME proxy header is sane */
>> +		ret = validate_proxy_header(to_csme_hdr,
>> +					    GSC_PROXY_ADDRESSING_GSC,
>> +					    GSC_PROXY_ADDRESSING_CSME,
>> +					    GSC_PROXY_BUFFER_SIZE -
>> reply_offset);
>> +		if (ret) {
>> +			xe_gt_err(gt, "invalid GSC to CSME proxy header!
>> (%pe)\n",
>> +				  ERR_PTR(ret));
>> +			goto proxy_error;
>> +		}
>> +
>> +		/* copy the rest of the message */
>> +		size = FIELD_GET(GSC_PROXY_PAYLOAD_LENGTH,
>> to_csme_hdr->hdr);
>> +		xe_map_memcpy_from(xe, to_csme_payload, &gsc-
>>> proxy.from_gsc,
>> +				   reply_offset + PROXY_HDR_SIZE, size);
>> +
>> +		/* send the GSC message to the CSME */
>> +		ret = proxy_send_to_csme(gsc, size + PROXY_HDR_SIZE);
>> +		if (ret < 0)
>> +			goto proxy_error;
>> +
>> +		/* reply size from CSME, including the proxy header */
>> +		size = ret;
>> +		if (size < PROXY_HDR_SIZE) {
>> +			xe_gt_err(gt, "CSME to GSC proxy msg too small:
>> 0x%x\n", size);
>> +			ret = -EPROTO;
>> +			goto proxy_error;
>> +		}
>> +
>> +		/* make sure the CSME-to-GSC proxy header is sane */
>> +		ret = validate_proxy_header(gsc->proxy.from_csme,
>> +					    GSC_PROXY_ADDRESSING_CSME,
>> +					    GSC_PROXY_ADDRESSING_GSC,
>> +					    GSC_PROXY_BUFFER_SIZE -
>> reply_offset);
>> +		if (ret) {
>> +			xe_gt_err(gt, "invalid CSME to GSC proxy header!
>> %d\n", ret);
>> +			goto proxy_error;
>> +		}
>> +
>> +		/* Emit a new header for sending the reply to the GSC */
>> +		wr_offset = xe_gsc_emit_header(xe, &gsc->proxy.to_gsc, 0,
>> +					       HECI_MEADDRESS_PROXY, 0, size);
>> +
>> +		/* copy the CSME reply and update the total msg size to
>> include the GSC header */
>> +		xe_map_memcpy_to(xe, &gsc->proxy.to_gsc, wr_offset,
>> +gsc->proxy.from_csme, size);
>> +
>> +		size += wr_offset;
>> +	}
>> +
>> +proxy_error:
>> +	return ret < 0 ? ret : 0;
>> +}
>> +
>> +static int gsc_proxy_request_handler(struct xe_gsc *gsc) {
>> +	struct xe_gt *gt = gsc_to_gt(gsc);
>> +	int slept;
>> +	int err;
>> +
>> +	if (!gsc->proxy.component_added)
>> +		return -ENODEV;
>> +
>> +	/* when GSC is loaded, we can queue this before the component is
>> bound */
>> +	for (slept = 0; slept < GSC_PROXY_INIT_TIMEOUT_MS; slept += 100) {
>> +		if (gsc->proxy.component)
>> +			break;
>> +
>> +		msleep(100);
>> +	}
>> +
>> +	mutex_lock(&gsc->proxy.mutex);
>> +	if (!gsc->proxy.component) {
>> +		xe_gt_err(gt, "GSC proxy component not bound!\n");
>> +		err = -EIO;
>> +	} else {
>> +		err = proxy_query(gsc);
>> +	}
>> +	mutex_unlock(&gsc->proxy.mutex);
>> +	return err;
>> +}
>> +
>> +static int xe_gsc_proxy_component_bind(struct device *xe_kdev,
>> +				       struct device *mei_kdev, void *data) {
>> +	struct xe_device *xe = kdev_to_xe(xe_kdev);
>> +	struct xe_gt *gt = xe->tiles[0].media_gt;
>> +	struct xe_gsc *gsc = &gt->uc.gsc;
>> +
>> +	mutex_lock(&gsc->proxy.mutex);
>> +	gsc->proxy.component = data;
>> +	gsc->proxy.component->mei_dev = mei_kdev;
>> +	mutex_unlock(&gsc->proxy.mutex);
>> +
>> +	return 0;
>> +}
>> +
>> +static void xe_gsc_proxy_component_unbind(struct device *xe_kdev,
>> +					  struct device *mei_kdev, void *data)
>> {
>> +	struct xe_device *xe = kdev_to_xe(xe_kdev);
>> +	struct xe_gt *gt = xe->tiles[0].media_gt;
>> +	struct xe_gsc *gsc = &gt->uc.gsc;
>> +
>> +	xe_gsc_wait_for_worker_completion(gsc);
>> +
>> +	mutex_lock(&gsc->proxy.mutex);
>> +	gsc->proxy.component = NULL;
>> +	mutex_unlock(&gsc->proxy.mutex);
>> +}
>> +
>> +static const struct component_ops xe_gsc_proxy_component_ops = {
>> +	.bind   = xe_gsc_proxy_component_bind,
>> +	.unbind = xe_gsc_proxy_component_unbind, };
>> +
>> +static void proxy_channel_free(struct drm_device *drm, void *arg) {
>> +	struct xe_gsc *gsc = arg;
>> +
>> +	if (!gsc->proxy.bo)
>> +		return;
>> +
>> +	if (gsc->proxy.to_csme) {
>> +		kfree(gsc->proxy.to_csme);
>> +		gsc->proxy.to_csme = NULL;
>> +		gsc->proxy.from_csme = NULL;
>> +	}
>> +
>> +	if (gsc->proxy.bo) {
>> +		iosys_map_clear(&gsc->proxy.to_gsc);
>> +		iosys_map_clear(&gsc->proxy.from_gsc);
>> +		xe_bo_unpin_map_no_vm(gsc->proxy.bo);
>> +		gsc->proxy.bo = NULL;
>> +	}
>> +}
>> +
>> +static int proxy_channel_alloc(struct xe_gsc *gsc) {
>> +	struct xe_gt *gt = gsc_to_gt(gsc);
>> +	struct xe_tile *tile = gt_to_tile(gt);
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +	struct xe_bo *bo;
>> +	void *csme;
>> +	int err;
>> +
>> +	csme = kzalloc(GSC_PROXY_CHANNEL_SIZE, GFP_KERNEL);
>> +	if (!csme)
>> +		return -ENOMEM;
>> +
>> +	bo = xe_bo_create_pin_map(xe, tile, NULL,
>> GSC_PROXY_CHANNEL_SIZE,
>> +				  ttm_bo_type_kernel,
>> +				  XE_BO_CREATE_SYSTEM_BIT |
>> +				  XE_BO_CREATE_GGTT_BIT);
>> +	if (IS_ERR(bo)) {
>> +		kfree(csme);
>> +		return PTR_ERR(bo);
>> +	}
>> +
>> +	gsc->proxy.bo = bo;
>> +	gsc->proxy.to_gsc = IOSYS_MAP_INIT_OFFSET(&bo->vmap, 0);
>> +	gsc->proxy.from_gsc = IOSYS_MAP_INIT_OFFSET(&bo->vmap,
>> GSC_PROXY_BUFFER_SIZE);
>> +	gsc->proxy.to_csme = csme;
>> +	gsc->proxy.from_csme = csme + GSC_PROXY_BUFFER_SIZE;
>> +
>> +	err = drmm_add_action_or_reset(&xe->drm, proxy_channel_free,
>> gsc);
>> +	if (err)
>> +		return err;
>> +
>> +	return 0;
>> +}
>> +
>> +/**
>> + * xe_gsc_proxy_init() - init objects and MEI component required by GSC
>> +proxy
>> + * @gsc: the GSC uC
>> + *
>> + * Return: 0 if the initialization was successful, a negative errno otherwise.
>> + */
>> +int xe_gsc_proxy_init(struct xe_gsc *gsc) {
>> +	int err;
>> +	struct xe_gt *gt = gsc_to_gt(gsc);
>> +	struct xe_tile *tile = gt_to_tile(gt);
>> +	struct xe_device *xe = tile_to_xe(tile);
>> +
>> +	mutex_init(&gsc->proxy.mutex);
>> +
>> +	if (!IS_ENABLED(CONFIG_INTEL_MEI_GSC_PROXY)) {
>> +		xe_gt_info(gt, "can't init GSC proxy due to missing mei
>> component\n");
>> +		return -ENODEV;
>> +	}
>> +
>> +	/* no multi-tile devices with this feature yet */
>> +	if (tile->id > 0) {
>> +		xe_gt_err(gt, "unexpected GSC proxy init on tile %u\n", tile-
>>> id);
>> +		return -EINVAL;
>> +	}
>> +
>> +	err = proxy_channel_alloc(gsc);
>> +	if (err)
>> +		return err;
>> +
>> +	err = component_add_typed(xe->drm.dev,
>> &xe_gsc_proxy_component_ops,
>> +				  I915_COMPONENT_GSC_PROXY);
>> +	if (err < 0) {
>> +		xe_gt_err(gt, "Failed to add GSC_PROXY component (%pe)\n",
>> ERR_PTR(err));
>> +		return err;
>> +	}
>> +
>> +	gsc->proxy.component_added = true;
>> +
>> +	/* the component must be removed before unload, so can't use drmm
>> for
>> +cleanup */
>> +
>> +	return 0;
>> +}
>> +
>> +/**
>> + * xe_gsc_proxy_remove() - remove the GSC proxy MEI component
>> + * @gsc: the GSC uC
>> + */
>> +void xe_gsc_proxy_remove(struct xe_gsc *gsc) {
>> +	struct xe_gt *gt = gsc_to_gt(gsc);
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +
>> +	if (gsc->proxy.component_added) {
>> +		component_del(xe->drm.dev,
>> &xe_gsc_proxy_component_ops);
>> +		gsc->proxy.component_added = false;
>> +	}
>> +}
>> +
>> +/**
>> + * xe_gsc_proxy_start() - start the proxy by submitting the first
>> +request
>> + * @gsc: the GSC uC
>> + *
>> + * Return: 0 if the proxy are now enabled, a negative errno otherwise.
>> + */
>> +int xe_gsc_proxy_start(struct xe_gsc *gsc) {
>> +	int err;
>> +
>> +	/*
>> +	 * The handling of the first proxy request must be manually triggered
>> to
>> +	 * notify the GSC that we're ready to support the proxy flow.
>> +	 */
>> +	err = gsc_proxy_request_handler(gsc);
>> +	if (err)
>> +		return err;
>> +
>> +	if (!gsc_proxy_init_done(gsc)) {
>> +		xe_gt_err(gsc_to_gt(gsc), "GSC FW reports proxy init not
>> completed\n");
>> +		return -EIO;
>> +	}
>> +
>> +	return 0;
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_gsc_proxy.h
>> b/drivers/gpu/drm/xe/xe_gsc_proxy.h
>> new file mode 100644
>> index 000000000000..5dc6321efbaf
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_gsc_proxy.h
>> @@ -0,0 +1,17 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_GSC_PROXY_H_
>> +#define _XE_GSC_PROXY_H_
>> +
>> +#include <linux/types.h>
>> +
>> +struct xe_gsc;
>> +
>> +int xe_gsc_proxy_init(struct xe_gsc *gsc); void
>> +xe_gsc_proxy_remove(struct xe_gsc *gsc); int xe_gsc_proxy_start(struct
>> +xe_gsc *gsc);
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/xe/xe_gsc_submit.c
>> b/drivers/gpu/drm/xe/xe_gsc_submit.c
>> index 8c5381e5913f..9ecc1ead6844 100644
>> --- a/drivers/gpu/drm/xe/xe_gsc_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_gsc_submit.c
>> @@ -5,6 +5,8 @@
>>
>>   #include "xe_gsc_submit.h"
>>
>> +#include <linux/poison.h>
>> +
>>   #include "abi/gsc_command_header_abi.h"
>>   #include "xe_bb.h"
>>   #include "xe_exec_queue.h"
>> @@ -68,6 +70,17 @@ u32 xe_gsc_emit_header(struct xe_device *xe, struct
>> iosys_map *map, u32 offset,
>>   	return offset + GSC_HDR_SIZE;
>>   };
>>
>> +/**
>> + * xe_gsc_poison_header - poison the MTL GSC header in memory
>> + * @xe: the Xe device
>> + * @map: the iosys map to write to
>> + * @offset: offset from the start of the map at which the header
>> +resides  */ void xe_gsc_poison_header(struct xe_device *xe, struct
>> +iosys_map *map, u32 offset) {
>> +	xe_map_memset(xe, map, offset, POISON_FREE, GSC_HDR_SIZE); };
>> +
>>   /**
>>    * xe_gsc_check_and_update_pending - check the pending bit and update the
>> input
>>    * header with the retry handle from the output header diff --git
>> a/drivers/gpu/drm/xe/xe_gsc_submit.h
>> b/drivers/gpu/drm/xe/xe_gsc_submit.h
>> index 0801da5d446a..1939855031a6 100644
>> --- a/drivers/gpu/drm/xe/xe_gsc_submit.h
>> +++ b/drivers/gpu/drm/xe/xe_gsc_submit.h
>> @@ -14,6 +14,7 @@ struct xe_gsc;
>>
>>   u32 xe_gsc_emit_header(struct xe_device *xe, struct iosys_map *map, u32
>> offset,
>>   		       u8 heci_client_id, u64 host_session_id, u32 payload_size);
>> +void xe_gsc_poison_header(struct xe_device *xe, struct iosys_map *map,
>> +u32 offset);
>>
>>   bool xe_gsc_check_and_update_pending(struct xe_device *xe,
>>   				     struct iosys_map *in, u32 offset_in, diff --
>> git a/drivers/gpu/drm/xe/xe_gsc_types.h
>> b/drivers/gpu/drm/xe/xe_gsc_types.h
>> index 57fefd66a7ea..805f26be4e9b 100644
>> --- a/drivers/gpu/drm/xe/xe_gsc_types.h
>> +++ b/drivers/gpu/drm/xe/xe_gsc_types.h
>> @@ -6,12 +6,16 @@
>>   #ifndef _XE_GSC_TYPES_H_
>>   #define _XE_GSC_TYPES_H_
>>
>> +#include <linux/iosys-map.h>
>> +#include <linux/mutex.h>
>> +#include <linux/types.h>
>>   #include <linux/workqueue.h>
>>
>>   #include "xe_uc_fw_types.h"
>>
>>   struct xe_bo;
>>   struct xe_exec_queue;
>> +struct i915_gsc_proxy_component;
>>
>>   /**
>>    * struct xe_gsc - GSC
>> @@ -34,6 +38,25 @@ struct xe_gsc {
>>
>>   	/** @work: delayed load and proxy handling work */
>>   	struct work_struct work;
>> +
>> +	struct {
>> +		/** @component: struct for communication with mei
>> component */
>> +		struct i915_gsc_proxy_component *component;
>> +		/** @mutex: protects the component binding and usage */
>> +		struct mutex mutex;
>> +		/** @component_added: whether the component has been
>> added */
>> +		bool component_added;
>> +		/** @bo: object to store message to and from the GSC */
>> +		struct xe_bo *bo;
>> +		/** @to_gsc: map of the memory used to send messages to
>> the GSC */
>> +		struct iosys_map to_gsc;
>> +		/** @from_gsc: map of the memory used to recv messages
>> from the GSC */
>> +		struct iosys_map from_gsc;
>> +		/** @to_csme: pointer to the memory used to send messages
>> to CSME */
>> +		void *to_csme;
>> +		/** @from_csme: pointer to the memory used to recv
>> messages from CSME */
>> +		void *from_csme;
>> +	} proxy;
>>   };
>>
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c index
>> 3af2adec1295..b4c021e98606 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -78,6 +78,19 @@ void xe_gt_sanitize(struct xe_gt *gt)
>>   	gt->uc.guc.submission_state.enabled = false;  }
>>
>> +/**
>> + * xe_gt_remove() - Clean up the GT structures before driver removal
>> + * @uc: the GT object
>> + *
>> + * This function should only act on objects/structures that must be
>> +cleaned
>> + * before the driver removal callback is complete and therefore can't
>> +be
>> + * deferred to a drmm action.
>> + */
>> +void xe_gt_remove(struct xe_gt *gt)
>> +{
>> +	xe_uc_remove(&gt->uc);
>> +}
>> +
>>   static void gt_fini(struct drm_device *drm, void *arg)  {
>>   	struct xe_gt *gt = arg;
>> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h index
>> 4486e083f5ef..c1675bd44cf6 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.h
>> +++ b/drivers/gpu/drm/xe/xe_gt.h
>> @@ -41,6 +41,7 @@ int xe_gt_suspend(struct xe_gt *gt);  int
>> xe_gt_resume(struct xe_gt *gt);  void xe_gt_reset_async(struct xe_gt *gt);
>> void xe_gt_sanitize(struct xe_gt *gt);
>> +void xe_gt_remove(struct xe_gt *gt);
>>
>>   /**
>>    * xe_gt_any_hw_engine_by_reset_domain - scan the list of engines and
>> return the diff --git a/drivers/gpu/drm/xe/xe_uc.c
>> b/drivers/gpu/drm/xe/xe_uc.c index 4408ea1751e7..8f37a809525f 100644
>> --- a/drivers/gpu/drm/xe/xe_uc.c
>> +++ b/drivers/gpu/drm/xe/xe_uc.c
>> @@ -7,6 +7,7 @@
>>
>>   #include "xe_device.h"
>>   #include "xe_gsc.h"
>> +#include "xe_gsc_proxy.h"
>>   #include "xe_gt.h"
>>   #include "xe_guc.h"
>>   #include "xe_guc_db_mgr.h"
>> @@ -261,3 +262,16 @@ int xe_uc_suspend(struct xe_uc *uc)
>>
>>   	return xe_guc_suspend(&uc->guc);
>>   }
>> +
>> +/**
>> + * xe_uc_remove() - Clean up the UC structures before driver removal
>> + * @uc: the UC object
>> + *
>> + * This function should only act on objects/structures that must be
>> +cleaned
>> + * before the driver removal callback is complete and therefore can't
>> +be
>> + * deferred to a drmm action.
>> + */
>> +void xe_uc_remove(struct xe_uc *uc)
>> +{
>> +	xe_gsc_remove(&uc->gsc);
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h index
>> 5d5110c0c834..e4d4e3c99f0e 100644
>> --- a/drivers/gpu/drm/xe/xe_uc.h
>> +++ b/drivers/gpu/drm/xe/xe_uc.h
>> @@ -20,5 +20,6 @@ int xe_uc_stop(struct xe_uc *uc);  int xe_uc_start(struct
>> xe_uc *uc);  int xe_uc_suspend(struct xe_uc *uc);  int
>> xe_uc_sanitize_reset(struct xe_uc *uc);
>> +void xe_uc_remove(struct xe_uc *uc);
>>
>>   #endif
>> --
>> 2.43.0

