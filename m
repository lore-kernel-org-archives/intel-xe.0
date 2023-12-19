Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9826C41535
	for <intel-xe@archiver.kernel.org>; Tue, 19 Dec 2023 11:05:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5575C10E453;
	Tue, 19 Dec 2023 11:05:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E05D610E453
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Dec 2023 11:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702983906; x=1734519906;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=X1/A+3uezBCLb/0Mm0sqj6qbHbXO3/swZ0WmrNWiqiY=;
 b=TDVIqGQsj1IMOuihpPqGEVZF+uLea6/BG86vxLlM/954tuIlH1EfBvuv
 gOu5nab7EpJSRgR8YVUdAf0ynsrrBXblJTETp8ygHYWdKUhSif8sZ6D8x
 uOmwqcJ46i9FLG4yjrHt4bwh0AYHSe1Zh8ABDzXekGRsl8zCK63Wey2g2
 ByHMcuaCgRbOYDg9HKV9bi3CyLVjAIQ6H3CbQTcXR3CB1kaflYONTaxjB
 mHEYJB1/iPEQLCx+3sRWry2/LreUtBHLHIWTIHAI9Qmj16o2xztfLndZ9
 09pGAmiftuXBWxtoYShaONR1xwTGQ1v9tv7DKxggmVbqyo44TXTtaSTie A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="398427325"
X-IronPort-AV: E=Sophos;i="6.04,288,1695711600"; d="scan'208";a="398427325"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2023 03:05:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="919592577"
X-IronPort-AV: E=Sophos;i="6.04,288,1695711600"; d="scan'208";a="919592577"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Dec 2023 03:05:05 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Dec 2023 03:05:05 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Dec 2023 03:05:04 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 19 Dec 2023 03:05:04 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 19 Dec 2023 03:05:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TsbzP5eWlyRTWGFFKHUe5Puq4f/Fn+zabJ6t51y1h8KeVqJ+In0+8duEkzA3EVBgQqQ90GuUbzqKyOl++Ckar6sJ5UK+5l9pZrVh1F6VprefgzrfV80LBSkaV6NJpwYMyCbalnOYhQKmT16TewEYObvKdlkD8Cn8bXma0+cIY588NGdtBmERciuBlf7JXmTkrSn8N/MAEOn96B9BI+iGBiTeku9LbLc/X6v/vuehRtao/IAuMLRvpGlBcagPxeYS2JzRCVX+jeJ1QRCv3jAMl9AOuAE9Kprsd+1g/RZtBkLcNALjeTCvvPbR+8SDCydFJblR7hPT56YiHTpacAe5aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8vcYcltVWTKn4rqn+KJ7AlPczJNB/iwNvFjp3WvuZLw=;
 b=RWRRFvSsuoBArgDkPR4x87Q4PZHcm+QunWGSQQ7HDTxMBC+Jh+/JvX8XY4OAgMoaeNuycw6L76TA2bm3jHXWJ9z8yPHyzo83e1J6Bpg834OljW3v2Hp+ws7BZrW91/OuwPORGxx5SysSNj7oNWd20ehahYm+VpYTiP8M4dznwKWCnYK3DePczVHLk4rTUM7HJwd1hUCIeNZ1zz3uhsDdh1lXe9nbk9AQrIXaXuAaWkd2l2rUUOtVhhNRzuuvHFBbwkYm7Nps/bFQ5XSJaR2ewkUe9Nhr1rFPV6hogObp+ovFP56yEk+7dub7hduB4f+38YiAsShYO56cw182g5KRlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 DM4PR11MB5501.namprd11.prod.outlook.com (2603:10b6:5:388::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7091.38; Tue, 19 Dec 2023 11:05:02 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2eaa:4647:7ac0:eb52]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2eaa:4647:7ac0:eb52%4]) with mapi id 15.20.7091.034; Tue, 19 Dec 2023
 11:05:02 +0000
Message-ID: <3f5e1966-2a34-4ccb-bb33-601617d8a3d0@intel.com>
Date: Tue, 19 Dec 2023 16:34:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/xe: Add base balance sysfs attributes
To: Jani Nikula <jani.nikula@linux.intel.com>, <intel-xe@lists.freedesktop.org>
References: <20231219100711.645011-1-sujaritha.sundaresan@intel.com>
 <20231219100711.645011-2-sujaritha.sundaresan@intel.com>
 <87plz2tqdu.fsf@intel.com>
Content-Language: en-US
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
In-Reply-To: <87plz2tqdu.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0089.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9a::7) To DM8PR11MB5653.namprd11.prod.outlook.com
 (2603:10b6:8:25::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5653:EE_|DM4PR11MB5501:EE_
X-MS-Office365-Filtering-Correlation-Id: beeb5344-7584-4790-5ac2-08dc0082594d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R6G/ZuziCRDoLIj0tNRyG+JOcMZWC3+pfBR7N1oUovZzkiH325NmOP4sIB4K/wblxL1565/4C1GRWFe5V/arFdKbGCycL2CDt6httEVDlKbZxd/C1C0dn3ZI30LqKA4t4UaMzqjhdw+qyD9ZjakbxzHMIuiOzix2/3QxqX0PznjUQualTbg37WrykJ9pfgPWs1NvU420NPMTi6C0GzjycYv2JXBJjeIcngRXVp7hx7l/jBM59lEjVkn2nxzXB7MJN10tlby5BFzoJ+/tg43TcEnFIKB35CRcvUT4SSYv/KQjZRRQyqPmwy9hff7OKBNzVGNI7EyYAlO37E6REx7+4WgkdNhAFPpkA5O7zPgzVrgUYnHVkFpxE223uxNUVXja/e/38t2RlyCatZFutECrALBT39Z4xTTuKJ8tMQe+Vi6+E0u3muTPFFFcltfum2yMIKgQW/1PYXwknatWySy6GfZLm75nh5njFL309OpS/8OerIFGUBBZXuif+bNajMmPcVOhxMMK7HXTc4lHD57pZKOTUAx7L6o8XHZQUTQK75kaMKWqJoHWgFFj4hfE3+L2vtLagTcMyZ0sAGCP4VW0qgNZS0GgCaf+osk6ccO3JIJG6ZxhpnFSbo6qU0nfY8AuQj0rVQv4q0ljDI9EcnBLQA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5653.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(39860400002)(396003)(136003)(366004)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(83380400001)(2616005)(6512007)(26005)(38100700002)(5660300002)(8936002)(8676002)(4326008)(316002)(2906002)(6486002)(478600001)(6506007)(41300700001)(53546011)(6666004)(66946007)(66476007)(66556008)(82960400001)(36756003)(86362001)(31696002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RzBWMFhUcmpXdE1yb3ZuWk5sdlNmRXl0Zmh6QjRLVStnSTl3ZzBycWhCRzJy?=
 =?utf-8?B?TkltUFdmMUVHNW8xR0h2eTBRTDQ4L2E2cU5ESUJwSEx5WWFwVFdMeGlHRHE1?=
 =?utf-8?B?VFMwN040NStEZWwvb0xoaWxRZDgzWnBvc2JPSHB1YzcwcVBDVnE0QmdRNDVW?=
 =?utf-8?B?d3F6YmVhT1hsc2gvM0xRNy83eFo3dXhGR3BuR1ZEWHJiemgrU0ZlRm16dWFh?=
 =?utf-8?B?SVlwc1IzY1BtY1ZRMnFSVm42MDAwcTR1RC96YUpSTldMRWpHbGhGdVRvL0oy?=
 =?utf-8?B?ajhzZUlvUUFOV05QcFo4V1hDZXZWa0RHMklDa3FDbVF0QjA3R2EzY3Y3UUx4?=
 =?utf-8?B?eVhQYnhDN3RLQXdPcGtTN1BYOEtJQVFDT3FacElLbEJ0YXU2SmF6VnlNTVcw?=
 =?utf-8?B?VWo4NWFUS1liRklOZExyRDZ6MHBTWWpWaDgzRGtJWGJycFhsalhRSzAwbUZI?=
 =?utf-8?B?NW1ycWtnZ1ZyZzZUUkh5ZDVWdzRJNmtNMGg1bk1ieVZIUEhrMUdtZjAxczVj?=
 =?utf-8?B?SlZNejdNb0lnZDlKdzExQktRanE3YnIwMk1sOTRVUnQzYVZpVm04VkwzVGJy?=
 =?utf-8?B?RlZpNklqRTQxM3ZmUEZVenBwZFNVVGJiQ3JQNW1tQ1JaZllMRGdGaUoyRTFr?=
 =?utf-8?B?QWxUTHNVUFM0akxDcUpMU21zcFdQVzdkeDlnOXJELzE5bTcwdzhVdmx5emtQ?=
 =?utf-8?B?RDN6MW11SWt3MGR3TzQ0MExGdmNzUGhmMXd0K0JVaG5Dd1cvS2NQelV0Ymdh?=
 =?utf-8?B?VHpSbjJ1VGx3RkNJcFV6UGRWcjRlYmZZRTc4TWdJdHpOdDVzd2NKaEJtL294?=
 =?utf-8?B?bFQwNU13LzVHTVczRmJHVU5MNlRMR1lRSDVaU21wSDlmaVEwbkNsWXZNcjdt?=
 =?utf-8?B?TG92dFp1bnJKUWhFN3FrNnlzbER4MGpjaFExcFR0Y01mbmpFVG9YV0VnRGNn?=
 =?utf-8?B?ajRSRnI2anFQSHhjUUNaeTJKVWxhVWJBT2JTKzU1VlZJSE5IU09xNVZveFRk?=
 =?utf-8?B?YWI4MmhyZ3hBZkUvU2JVcy84Q21McURzeC9SN0FzRzcycnNYN2p5UGlycTBO?=
 =?utf-8?B?ZzlKQkFTL1dtbTNLeDdtcHlVVXh0VmZ1Rzl6cjNZSzNicU9ldEhLc0UvcW15?=
 =?utf-8?B?eUZ5M21FMUFhWlEyM1RxYis5TzYwdnFBLzZFWEtTemgwT3FKajBzd3JyekZX?=
 =?utf-8?B?akRYMWliSklJOHZRbkVuS2JvbzFNb29OYzBlbVFKaW9IM1hzNy9ETnkybko2?=
 =?utf-8?B?bEw2OFBQNzZ4Z0R5bXRUWkoyOWNUT01lc0p4V2RKN3daSVhvTGlLc002U2dm?=
 =?utf-8?B?VFVSakYzNnViRW90d1lTZ0FSSDNIUU8vcnlWR25UYU1oWjR0dk1ib1VLbktF?=
 =?utf-8?B?VFJXT2FnUGdVMEJZTWt4TnNKTURzTHEyM24wVnJQS0c2QmVQQzErdlh1cWZB?=
 =?utf-8?B?TFFtbFBoSjJ5d2RRMk95UnFSSjNmQk9zbG1kODgyNHhMTVhnWkRDQVRUbmRJ?=
 =?utf-8?B?cERDWmppOU5KWlhwYVc0dUs4K0FXUCtDMmxKQjlFcnVoT1VLNnY1cWhnMDd2?=
 =?utf-8?B?VzRWcWZqLzhHalZydjlRSmtCNkhoRVFNTWpOVnp3UXFKN3BhelQ3Q1hxeFdq?=
 =?utf-8?B?VG1UQVQ5OFg3cGZsR2w2RXA1S0JzbXc3NmxSK2Zab1pmVlVSTUNWL3lGKzVT?=
 =?utf-8?B?bHBpSHUxVThZR2tGK283akxIQk5WYitHZDdDUDZwTU5NTXo1d2VEVjcrRXBU?=
 =?utf-8?B?Q3VxWCtZaldzd0E1RjBiM1RIdmxQaXlNVllQanRWbWgxU0hJNnhJWVpQK0d2?=
 =?utf-8?B?NnBWNFBwVzBoZjBLU2l6NXRPbGJPcnRJVjg1Zjh3cjBkU3ZmZWFaZFBrM1cr?=
 =?utf-8?B?bTQ1Y1BBeEhPMEh0SkJtajBzV0FlRFBhY3NkUm96Y3NEYU83dThGU1F3U0E0?=
 =?utf-8?B?K1BlTUk0dms3T3FBN3pJeFN2a3VRcmQ3MzgzMFE2QU1pb29SUU5JeEUwZUE2?=
 =?utf-8?B?YmU1SEFPVGZzTVpCdFc4R1d3cDhTbVBTYjhrNXlYRWdDaVlXb0hPR1dkQ2V2?=
 =?utf-8?B?OE9mMlltZnZyc0ZmczkwVnRNRUI5UFpJL3BXM0JOYlFYOEhTZkF1SExWOUV2?=
 =?utf-8?B?UVJuenRyS21uTjFkdnI0NldXV1ZHeTVmQkYwYlN1K1FxVEZUOU5WdXRaZ3Jl?=
 =?utf-8?Q?+4OHpFnypOhTDtDh+PAZBN4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: beeb5344-7584-4790-5ac2-08dc0082594d
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2023 11:05:02.7286 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lf+TkAJoNK7+utsDAswQ++tUY5wUyK1SAEamxJY85JBBF101rnCBDBvsZ+uQE0YTYl8LfqtOBq2M/2hKGthNUSiFHLqXp0mDtfbawrSCUyM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5501
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
Cc: rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 12/19/2023 4:23 PM, Jani Nikula wrote:
> On Tue, 19 Dec 2023, Sujaritha Sundaresan <sujaritha.sundaresan@intel.com> wrote:
>> Add sysfs attributes for base balance in gt.
>>
>> device/tile#gt#/freq0/balance
>> 			|- base_freq_factor
>> 			|- base_freq_factor.scale
>> 			|- base_rp0_freq
>> 			|- base_rpn_freq
>>
>> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
>> ---
>>   drivers/gpu/drm/xe/Makefile              |   1 +
>>   drivers/gpu/drm/xe/xe_gt_balance_sysfs.c | 181 +++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_gt_balance_sysfs.h |  17 +++
>>   drivers/gpu/drm/xe/xe_gt_freq.c          |   3 +
>>   drivers/gpu/drm/xe/xe_pcode_api.h        |   5 +
>>   5 files changed, 207 insertions(+)
>>   create mode 100644 drivers/gpu/drm/xe/xe_gt_balance_sysfs.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_gt_balance_sysfs.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index 53bd2a8ba1ae..64bfd3d6eab4 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -87,6 +87,7 @@ xe-y += xe_bb.o \
>>   	xe_gt_mcr.o \
>>   	xe_gt_pagefault.o \
>>   	xe_gt_sysfs.o \
>> +	xe_gt_balance_sysfs.o \
> See the comment in the Makefile.
>
> # Please keep these build lists sorted!
>
>>   	xe_gt_throttle_sysfs.o \
>>   	xe_gt_tlb_invalidation.o \
>>   	xe_gt_topology.o \
>> diff --git a/drivers/gpu/drm/xe/xe_gt_balance_sysfs.c b/drivers/gpu/drm/xe/xe_gt_balance_sysfs.c
>> new file mode 100644
>> index 000000000000..054b90ca128d
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_gt_balance_sysfs.c
>> @@ -0,0 +1,181 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#include <drm/drm_managed.h>
>> +
>> +#include <regs/xe_reg_defs.h>
> <> is for "system" headers in the top level include directory. Not for
> local headers with relative paths.
>
>> +#include "xe_device.h"
>> +#include "xe_gt.h"
>> +#include "xe_gt_balance_sysfs.h"
>> +#include "xe_gt_sysfs.h"
>> +#include "xe_pcode.h"
>> +#include "xe_pcode_api.h"
>> +#include "xe_mmio.h"
> Please keep include lists sorted.
>
>> +
>> +/**
>> + * DOC: Xe GT Balance
>> + *
>> + * Provides sysfs entries for balance frequency in GT
>> + *
>> + * device/tile#/gt#/freq0/balance/base_freq_factor - Base frequency factor
>> + * device/tile#/gt#/freq0/balance/base_freq_factor.scale - Base frequency factor scale
>> + * device/tile#/gt#/freq0/balance/base_rp0_freq - Base Render Performance 0 level frequency
>> + * device/tile#//gt#/freq0/balance/base_rpn_freq - Base Render Performance N level frequency
>> + */
>> +
>> +#define GT_FREQUENCY_MULTIPLIER	50
>> +
>> +#define U8_8_VAL_MASK           0xffff
>> +#define U8_8_SCALE_TO_VALUE     "0.00390625"
>> +
>> +static struct xe_gt *
>> +dev_to_gt(struct device *dev)
>> +{
>> +	return kobj_to_gt(dev->kobj.parent);
>> +}
>> +
>> +static ssize_t freq_factor_scale_show(struct device *dev,
>> +				      struct device_attribute *attr,
>> +				      char *buff)
> Just buf is customary everywhere, not buff.

Hi Jani,

Will fix all of the above.

Thanks,

Suja

>
>> +{
>> +	return sysfs_emit(buff, "%s\n", U8_8_SCALE_TO_VALUE);
>> +}
>> +
>> +static ssize_t base_freq_factor_show(struct device *dev,
>> +				     struct device_attribute *attr,
>> +				     char *buff)
>> +{
>> +	struct xe_gt *gt = dev_to_gt(dev);
>> +	u32 val, mbox;
>> +	int err;
>> +
>> +	mbox = REG_FIELD_PREP(PCODE_MB_COMMAND, PCODE_QOS_MULTIPLIER_GET)
>> +		| REG_FIELD_PREP(PCODE_MB_PARAM1, PCODE_MBOX_DOMAIN_CHIPLET)
>> +		| REG_FIELD_PREP(PCODE_MB_PARAM2, PCODE_MBOX_DOMAIN_BASE);
>> +
>> +	err = xe_pcode_read(gt, mbox, &val, NULL);
>> +	if (err)
>> +		return err;
>> +
>> +	val &= U8_8_VAL_MASK;
>> +
>> +	return sysfs_emit(buff, "%u\n", val);
>> +}
>> +
>> +static ssize_t base_freq_factor_store(struct device *dev,
>> +				      struct device_attribute *attr,
>> +				      const char *buff, size_t count)
>> +{
>> +	struct xe_gt *gt = dev_to_gt(dev);
>> +	u32 val, mbox;
>> +	int err;
>> +
>> +	err = kstrtou32(buff, 0, &val);
>> +	if (err)
>> +		return err;
>> +
>> +	if (val > U8_8_VAL_MASK)
>> +		return -EINVAL;
>> +
>> +	mbox = REG_FIELD_PREP(PCODE_MB_COMMAND, PCODE_QOS_MULTIPLIER_SET)
>> +		| REG_FIELD_PREP(PCODE_MB_PARAM1, PCODE_MBOX_DOMAIN_CHIPLET)
>> +		| REG_FIELD_PREP(PCODE_MB_PARAM2, PCODE_MBOX_DOMAIN_BASE);
>> +
>> +	err = xe_pcode_write(gt, mbox, val);
>> +	if (err)
>> +		return err;
>> +
>> +	return count;
>> +}
>> +static DEVICE_ATTR_RW(base_freq_factor);
>> +static struct device_attribute dev_attr_base_freq_factor_scale =
>> +	__ATTR(base_freq_factor.scale, 0444, freq_factor_scale_show, NULL);
>> +
>> +static ssize_t base_rp0_freq_show(struct device *dev, struct device_attribute *attr,
>> +				  char *buff)
>> +{
>> +	struct xe_gt *gt = dev_to_gt(dev);
>> +	u32 val, mbox;
>> +	int err;
>> +
>> +	mbox = REG_FIELD_PREP(PCODE_MB_COMMAND, PCODE_FREQUENCY_CONFIG)
>> +		| REG_FIELD_PREP(PCODE_MB_PARAM1, PCODE_MBOX_FC_SC_READ_FUSED_P0)
>> +		| REG_FIELD_PREP(PCODE_MB_PARAM2, PCODE_MBOX_DOMAIN_BASE);
>> +
>> +	err = xe_pcode_read(gt, mbox, &val, NULL);
>> +	if (err)
>> +		return err;
>> +
>> +	/* data_out - Fused P0 for domain ID in units of 50 MHz */
>> +	val *= GT_FREQUENCY_MULTIPLIER;
>> +
>> +	return sysfs_emit(buff, "%u\n", val);
>> +}
>> +static DEVICE_ATTR_RO(base_rp0_freq);
>> +
>> +static ssize_t base_rpn_freq_show(struct device *dev, struct device_attribute *attr,
>> +				  char *buff)
>> +{
>> +	struct xe_gt *gt = dev_to_gt(dev);
>> +	u32 val, mbox;
>> +	int err;
>> +
>> +	mbox = REG_FIELD_PREP(PCODE_MB_COMMAND, PCODE_FREQUENCY_CONFIG)
>> +		| REG_FIELD_PREP(PCODE_MB_PARAM1, PCODE_MBOX_FC_SC_READ_FUSED_PN)
>> +		| REG_FIELD_PREP(PCODE_MB_PARAM2, PCODE_MBOX_DOMAIN_BASE);
>> +
>> +	err = xe_pcode_read(gt, mbox, &val, NULL);
>> +	if (err)
>> +		return err;
>> +
>> +	/* data_out - Fused Pn for domain ID in units of 50 MHz */
>> +	val *= GT_FREQUENCY_MULTIPLIER;
>> +
>> +	return sysfs_emit(buff, "%u\n", val);
>> +}
>> +static DEVICE_ATTR_RO(base_rpn_freq);
>> +
>> +static struct attribute *balance_attrs[] = {
>> +	&dev_attr_base_freq_factor.attr,
>> +	&dev_attr_base_freq_factor_scale.attr,
>> +	&dev_attr_base_rp0_freq.attr,
>> +	&dev_attr_base_rpn_freq.attr,
>> +	NULL
>> +};
>> +
>> +static const struct attribute_group balance_group_attrs = {
>> +	.name = "balance",
>> +	.attrs = balance_attrs,
>> +};
>> +
>> +static void gt_balance_sysfs_fini(struct drm_device *drm, void *arg)
>> +{
>> +	struct xe_gt *gt = arg;
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +
>> +	if (xe->info.platform == XE_PVC)
>> +		sysfs_remove_group(gt->freq, &balance_group_attrs);
>> +}
>> +
>> +void xe_gt_balance_sysfs_init(struct xe_gt *gt)
>> +{
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +	int err;
>> +
>> +	if (xe->info.platform == XE_PVC) {
>> +		err = sysfs_create_group(gt->freq, &balance_group_attrs);
>> +		if (err) {
>> +			drm_warn(&xe->drm, "failed to register throttle sysfs, err: %d\n", err);
>> +			return;
>> +		}
>> +	}
>> +
>> +	err = drmm_add_action_or_reset(&xe->drm, gt_balance_sysfs_fini, gt);
>> +	if (err) {
>> +		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
>> +			 __func__, err);
>> +		sysfs_remove_group(gt->freq, &balance_group_attrs);
>> +	}
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_gt_balance_sysfs.h b/drivers/gpu/drm/xe/xe_gt_balance_sysfs.h
>> new file mode 100644
>> index 000000000000..39cec5223cf3
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_gt_balance_sysfs.h
>> @@ -0,0 +1,17 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_GT_BALANCE_SYSFS_H_
>> +#define _XE_GT_BALANCE_SYSFS_H_
>> +
>> +#include <drm/drm_managed.h>
>> +
>> +#include "xe_device.h"
>> +#include "xe_gt.h"
>> +
>> +void xe_gt_balance_sysfs_init(struct xe_gt *gt);
>> +
>> +#endif /* _XE_GT_BALANCE_SYSFS_H_ */
>> +
>> diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
>> index 08eabcafe7bc..5b0e4fc402ec 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_freq.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_freq.c
>> @@ -13,6 +13,7 @@
>>   
>>   #include "xe_device_types.h"
>>   #include "xe_gt_sysfs.h"
>> +#include "xe_gt_balance_sysfs.h"
>>   #include "xe_gt_throttle_sysfs.h"
>>   #include "xe_guc_pc.h"
>>   
>> @@ -215,5 +216,7 @@ void xe_gt_freq_init(struct xe_gt *gt)
>>   		drm_warn(&xe->drm,  "failed to add freq attrs to %s, err: %d\n",
>>   			 kobject_name(gt->freq), err);
>>   
>> +	xe_gt_balance_sysfs_init(gt);
>> +
>>   	xe_gt_throttle_sysfs_init(gt);
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
>> index 4076a4e9daf3..87213b52df4a 100644
>> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
>> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
>> @@ -49,6 +49,11 @@
>>   /* PCODE_MBOX_DOMAIN_* - mailbox domain IDs */
>>   /* PCODE_FREQUENCY_CONFIG param2 */
>>   #define     PCODE_MBOX_DOMAIN_HBM		0x2
>> +#define     PCODE_MBOX_DOMAIN_CHIPLET		0x6
>> +#define     PCODE_MBOX_DOMAIN_BASE		0x8
>> +#define   PCODE_QOS_MULTIPLIER_SET		0x67
>> +/* See PCODE_MBOX_DOMAIN_* - mailbox domain IDs - param1 and 2 */
>> +#define   PCODE_QOS_MULTIPLIER_GET		0x66
>>   
>>   struct pcode_err_decode {
>>   	int errno;
