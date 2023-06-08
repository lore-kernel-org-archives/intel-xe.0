Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01C30C7EE25
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jun 2023 07:16:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3A0A10E5A8;
	Thu,  8 Jun 2023 07:16:41 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA5C710E595
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jun 2023 07:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686208599; x=1717744599;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IQpVB8WN9RLA0X7ZnORlEBobjbjTcX4gXeGZFycnOXA=;
 b=TCjrYjmV/q/RnWG0c7CBV/9CCUrffddrrlN2wdfgu5IgiGC2QSV/+g9S
 RQKEPKKXTLb4Ep+AeRF6i1xTKla/nP7BFaw0ln6X2+04gIOYJ7IMMniYY
 DogmZFSxnBwkuz/aorCmCmPk+muP4dC43QH7gg+wDwX1N/5DgGb+IJQFP
 i6dohJRTTQd2P0PXkVoeI2u9jNDz2xTgd4yFPrMNCV311D6sZzJvJ0TRI
 fe0+5dmpPfJ5W+48TWCm2TW/nplMMsVdHTBGTpPfGMYTFuHWZXvN0zp4Q
 0RjTnTWOIvlFvRXuB9Bro9Aog17VHBIkHzF/13/h9n+zL3ddpV3NEy6i4 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="346848242"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; d="scan'208";a="346848242"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2023 00:16:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="739584707"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; d="scan'208";a="739584707"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga008.jf.intel.com with ESMTP; 08 Jun 2023 00:16:36 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 8 Jun 2023 00:16:36 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 8 Jun 2023 00:16:36 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.106)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 8 Jun 2023 00:16:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CqrOYzeYY9KKtswrGGTqkraIqoqOITtu8U06S5XsPLDBUEhQ/wwZdWdLupXckJlY5GZqKRVERFRX9r8/YpsLa+g4pBoXUO2eTZ4lg7X4mP3YYP8hGficO/tQ6W1ViS17TdcoRjmt1WpVOj8USFDjSwr92Wk+INepGrUABU/yJM1PUK64zMy+4ChZPTq6Fjsit6JTNBsJbNw80REzmagMmHKN4oZlnKeGUstVW8ReeKvRrHdZYf0uarWHqXafWzpeZ349a8blPN3QQ3itZRja6wLFMYIpXT60HgZ00UEQSPaLcZJ7A82rO49EWWPWA2Uloadzaro6GhNYT5Skcks7DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ryj0sAV1mwP4PeESPDUKFCxnfYQQz4Ybq6THX5lkbu8=;
 b=CfuyNVTZ6chTKuCW6RG4Mt4TnKFbCle/5Wq+O8S++p3s7UHD2mHImR7aZHzK+83nfzTjIwOtsOK32GPaUgXdmoVSLDyhqDOfAIEop+SMtklciqjeDbGqd/3V/332p95Vc0LF2KtkNcYGZ8POdsVbwe1lemhz65AiAo8wfNTLtOvJDrZZis3DFK/uRul1nusV02YPpBkvzh9GKJQuCCy1yvrLO3z4T6OiWRj4owafDke/u1pbHiUUCTiCoVa/rz709mKxztMy3tEJvsmi5ys7q9ub4MU+XAnWMTUnuNgjuL/HFpJHgDE5vh9Oww+RFaHdaNQz6xDm4smxN7lqo/wORg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by CH3PR11MB8156.namprd11.prod.outlook.com (2603:10b6:610:165::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Thu, 8 Jun
 2023 07:16:29 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::3fa8:dede:a9ab:fc5]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::3fa8:dede:a9ab:fc5%6]) with mapi id 15.20.6477.016; Thu, 8 Jun 2023
 07:16:27 +0000
Message-ID: <d9e614d6-5a3a-fff0-5f8c-c57a610a7b0b@intel.com>
Date: Thu, 8 Jun 2023 12:46:18 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
To: Matt Roper <matthew.d.roper@intel.com>
References: <20230524060020.2054682-1-riana.tauro@intel.com>
 <20230607223539.GO5433@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20230607223539.GO5433@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN0PR01CA0011.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4f::16) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|CH3PR11MB8156:EE_
X-MS-Office365-Filtering-Correlation-Id: 20797c25-2ab8-4f83-1eec-08db67f04655
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9qc9CrIOiIGaYdfPTdV7LJzIyjUKr2OiEnH5Lppj2ll1kZ/1t4cSvcFgW7NDSd+rpZgBG1RWkgM6Rg8kP7kIp6YrJJv7fKjAoytTkD9BWzbKshzenJeg56ty+QX7T1O4vZ1++v4dcU49ttEZy9NtF/B3cwtaxy2+bTeVuyt6DzU6NWMDL2NjQdDNt5ndwT/bepNpqvgmV+k2E7gNdBsDbQLllVxp3u+xoB2e2pxvBV7/hZmE2rZT3nYPTgJOWu2gRoaC1xETVwYvnZ7+kQm8WrLuksw4wPIfS7QBMs/Is/3CjVmvrfz7J9exzu7OmzvDo+Hq+rTTuG3ogNJkb0yFSYXCjll+5rBhBlthb2NEz2yZvzLkx85+phTsyLN0NBHA+eZD+0DEnXhpCeJtwogSfjY+aI58m/1rWVfqmbQ1LXXo5k69eptMuqgz8j6NaY7ZGl8uN0lm3BXyzUlxFrGHirepRmj6BTyUKo7Hwb4oREeTCwPR2stDzUNwcCs/L3s1ahqeBcxYK7d+YLcxWXKdFctJN/P3UhtR4l1ZU0MJe8b97d3kmCUb3r8Zh1UJW1U3ptp6lbxBIGXKl3+9Em+VNELi2Fk7FqRtbW/9hjRNdqqC7aZKPxgeqHF31uwFQSsGB6Wu86uQ6j0kKHa+KImbQC1+sZq1cSvhCaUewPUXblI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(136003)(366004)(396003)(39860400002)(376002)(451199021)(8676002)(6862004)(107886003)(37006003)(8936002)(478600001)(6666004)(5660300002)(41300700001)(6486002)(316002)(26005)(44832011)(186003)(31686004)(6506007)(66556008)(66946007)(6512007)(53546011)(4326008)(66476007)(6636002)(2616005)(83380400001)(2906002)(30864003)(38100700002)(82960400001)(31696002)(86362001)(36756003)(21314003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?akdhK0VSNWRLOTIvRC9vbGI5MmhQRTRJYm5TeEE0eTlmS1RHY0t0UGlMdmdx?=
 =?utf-8?B?bFZlN3EyZENqcGxGS244d2tvN2JhZGQzT2RsM2lnOW5hbnc4Q1l3dDdsK3NB?=
 =?utf-8?B?TWgrOHBoZDRjZEpQcFlmNVZUQ0gwd0pSM0QxR2hoSkRHUVpCWnRja0N2QjQ4?=
 =?utf-8?B?L0d2eUNraTdrRU1rNDV3a05pcFRjVXpLMTdONlV1T3RZVGRYZFNHM21pMXB2?=
 =?utf-8?B?VlRPRnB0dHZabmpBeUI4OWJESkgrQnpYK2xCVE54WTB4b3lJMUQyWTVRcHpi?=
 =?utf-8?B?Yy9nSlZHQU5CVUgzNE9sRU1MOEV2Qk5TSnNmZFBRYTlqYUFOeVVwc2d4MFV6?=
 =?utf-8?B?VEphZXowZ3AvZHVrYmVJTnRxU0VtMU1EQVBQRlVzTmRJUUlCeVFaVWlzdy85?=
 =?utf-8?B?U25KV1psQ0xsckFiN2ovU0xyM212R0N4bEVxbTAzS3RjSGkyZjNTUURnZ3dj?=
 =?utf-8?B?MnF2WFduOVdoVmdGeW5vZXp3UUdiSVV3a2Vzdkloa3A2SjJlT2d1N0lMcmN5?=
 =?utf-8?B?ZlVkRm1XbWlhcmM1UVRPVWZNcEh3Q1dCRnovOEdvcjNLZ1kzZ2ZVMU9JR2pD?=
 =?utf-8?B?MUp5K0JaZEFyZHMvcExyNjRNQVRMQmdjY2VDQ2hjUHBLRm5LQndsWVFiN2xz?=
 =?utf-8?B?ZmNqNkhpUlZhVk1waGZwbzdVeGRuVURBRkttMVZ2blo3MjFseDZQL0ZpNFMx?=
 =?utf-8?B?ejYxZTc0b2g4MUlsaEtNNUU1dFRMQzJTY2ljM1JOVmxnaVBCNTNrWFdseUVO?=
 =?utf-8?B?dUR0UlFmUDBtaDY5UkJaQ2xYUytiSXNSajNHUFB4Z2hYS1dVM2VrYkRRSTdr?=
 =?utf-8?B?UzhOVWNLUTdOKzd6ckhPWHhvYXlST1daOFlkdlVWaEMybTMyYTJHTUhXMEtY?=
 =?utf-8?B?Q1dwcy9nZWl0aTVLNVF1ZGtWTjlDNEcrOUJzT1p1K0tUTk5VMlVvT2pQNUZF?=
 =?utf-8?B?K1VZOUtKdHdIbFNjS2U4UGo1cXR3dXdPVkhmVGRyWlRhTCtPMk5ZU3VPVjBo?=
 =?utf-8?B?R0huWkxwQ1FSNVlHdVNRWE9SMU83Z053bXpsVjJhZ245ZTB5QXp0N1NaM2tr?=
 =?utf-8?B?ZjkzcHRyekhsRFFsSUgwUG1LekEyOURLY1d3YWpQYmNxSGt4aXd6cVhMb3ZL?=
 =?utf-8?B?UlZPait2NXRuQitpbFl3aS9mRkEzQmM4d3kzQW5nMUlwZFZBc2hXWjV6amhl?=
 =?utf-8?B?UUxzcnA2eU1Da0ZrdGc3UUpaZndpaThxcDlESzBRYTNnYlIvOFk3b1hHM2Fy?=
 =?utf-8?B?V05OOStBYUdOczJXR3RMWGIrK1MzcXRES0NGTzBsTVRCcm5TOGRlWTdXd0xz?=
 =?utf-8?B?ZlRnbGRHODhWR2ZUSGI5aGhLWWhqMnZLTHRBdlg0R3NHcTI0cFZsU0N0Ry9p?=
 =?utf-8?B?VllHK29uVWFSQUIwQ1o3QUQ0VG1lYVNudTJuejdOek03QnlpODBXUDMwRXVy?=
 =?utf-8?B?Y3NjTGxza2lTRUVVaXl0b0YvOE9EYVp1dlJyZG94aHlGM3pGZ2xpOWNUdFlr?=
 =?utf-8?B?TmRqVGtodlQ5QzdCakFVSHJ2QlJabkJ3OWl1QlIxNHFxV2JCbnlyNjFkSm1F?=
 =?utf-8?B?bWFjd3RDc2RLc3FCVEhLK2F2RFZTZnJ2Y25FUW5EQlJBVVVBeTZwbnhnR2FQ?=
 =?utf-8?B?eWFaZjRTVEMrcHJoK3ZWRW1pL0dhck40WUFvSU5hU3MwZW5GVzBpcFAycDF2?=
 =?utf-8?B?b1JNbWtTZVFJTHpoQlp1MHBvZUphWDE3Zno3dlgwK29ETXVIQW5UK0tuQUdw?=
 =?utf-8?B?Unhac3lCUmhnNE1CTlZDcVY0S2lHWUNnbXBiYVJ0ak1VdDljcDdJWHN6OTJT?=
 =?utf-8?B?elBDSkhHUlNBVFdlM3U2VmRnUlpFRzZhOVFJTEx6blVFM2dkRDNJeHRZcTBL?=
 =?utf-8?B?cFpJdDZXKzNlbE41ZmlxajVVck43MjcvemJqNjByd3A2Ym9sbUQrYkY1elpG?=
 =?utf-8?B?dHZrL3BCTzUwbG5udFFueWROWU9SeUFSMXFnTmFOZUdBYmdxdldKNmx3T1FB?=
 =?utf-8?B?U3d4c3FweWI1KzlSUGQ4d0xxVThvUjkvQVJ5OHdja09wZElkZTBwbWgrZUYv?=
 =?utf-8?B?TnRSdDcyV1ZoWVVxdE14WndmQTlNMlAvRlFkbnFmanN4bHRLQ1R2M2F1bzZX?=
 =?utf-8?Q?f+nnwzyfVZmbA0kpGEJSr/5YX?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 20797c25-2ab8-4f83-1eec-08db67f04655
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2023 07:16:27.6142 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N15FsTzI8SufZ9a/FSrwARDDZrDu4y+cZ5LZQwBzfKMLJpMnVng7iditTPouEPWDOn+PdvBSLjElns63YUV/nA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8156
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: add a new sysfs directory for gtidle
 properties
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
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Matt

On 6/8/2023 4:05 AM, Matt Roper wrote:
> On Wed, May 24, 2023 at 11:30:20AM +0530, Riana Tauro wrote:
>> Add a new sysfs directory under devices/gt#/ called gtidle
>> to contain idle properties of GT such as name, idle_status,
>> idle_residency_ms
> 
> What's the userspace consumer for this uapi?  We don't have any uapi
> like this in i915 do we?
> 
idle_residency and idle_status are generic names for rc6, mc6.

userspace consumer for rc6_residency in i915 are powertop, turbostat

Thanks
Riana

> 
> Matt
> 
> 
>>
>> v2:
>>      - abstract using function pointers (Anshuman)
>>      - use device_attr (Badal)
>>      - move rc functions to guc_pc
>>      - change name to gt_idle (Rodrigo)
>>
>> v3:
>>      - return error for drmm_add_action_or_reset
>>      - replace file and functions with gt_idle prefix
>>        to gt_idle_sysfs (Himal)
>>      - use enum for gt idle state
>>      - move multiplier to gt idle and initialize (Anshuman)
>>      - correct doc annotation (Rodrigo)
>>      - remove return variable
>>      - use kobj_gt instead of new gtidle kobj
>>      - move residency_ms to gtidle file
>>      - retain xe_guc_pc prefix for functions in guc_rc file (Michal)
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> ---
>>   drivers/gpu/drm/xe/Makefile                 |   1 +
>>   drivers/gpu/drm/xe/xe_gt.c                  |   5 +
>>   drivers/gpu/drm/xe/xe_gt_idle_sysfs.c       | 157 ++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_gt_idle_sysfs.h       |  13 ++
>>   drivers/gpu/drm/xe/xe_gt_idle_sysfs_types.h |  38 +++++
>>   drivers/gpu/drm/xe/xe_gt_types.h            |   4 +
>>   drivers/gpu/drm/xe/xe_guc_pc.c              |  46 +++---
>>   drivers/gpu/drm/xe/xe_guc_pc.h              |   2 +
>>   8 files changed, 237 insertions(+), 29 deletions(-)
>>   create mode 100644 drivers/gpu/drm/xe/xe_gt_idle_sysfs.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_gt_idle_sysfs.h
>>   create mode 100644 drivers/gpu/drm/xe/xe_gt_idle_sysfs_types.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index cd1614b68734..84f0985054fa 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -45,6 +45,7 @@ xe-y += xe_bb.o \
>>   	xe_gt.o \
>>   	xe_gt_clock.o \
>>   	xe_gt_debugfs.o \
>> +	xe_gt_idle_sysfs.o \
>>   	xe_gt_mcr.o \
>>   	xe_gt_pagefault.o \
>>   	xe_gt_sysfs.o \
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index 80d42c7c7cfa..eb1e1e3d2d71 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -18,6 +18,7 @@
>>   #include "xe_force_wake.h"
>>   #include "xe_ggtt.h"
>>   #include "xe_gt_clock.h"
>> +#include "xe_gt_idle_sysfs.h"
>>   #include "xe_gt_mcr.h"
>>   #include "xe_gt_pagefault.h"
>>   #include "xe_gt_printk.h"
>> @@ -383,6 +384,10 @@ static int gt_fw_domain_init(struct xe_gt *gt)
>>   	if (err)
>>   		goto err_force_wake;
>>   
>> +	err = xe_gt_idle_sysfs_init(&gt->gtidle);
>> +	if (err)
>> +		goto err_force_wake;
>> +
>>   	/* XXX: Fake that we pull the engine mask from hwconfig blob */
>>   	gt->info.engine_mask = gt->info.__engine_mask;
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_gt_idle_sysfs.c b/drivers/gpu/drm/xe/xe_gt_idle_sysfs.c
>> new file mode 100644
>> index 000000000000..b7de53287f6b
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_gt_idle_sysfs.c
>> @@ -0,0 +1,157 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#include <drm/drm_managed.h>
>> +
>> +#include "xe_device.h"
>> +#include "xe_gt.h"
>> +#include "xe_gt_idle_sysfs.h"
>> +#include "xe_gt_sysfs.h"
>> +#include "xe_guc_pc.h"
>> +
>> +/**
>> + * DOC: Xe GT Idle
>> + *
>> + * Provides sysfs entries for idle properties of GT
>> + *
>> + * device/gt#/gtidle/name - name of the state
>> + * device/gt#/gtidle/idle_residency_ms - Provides residency of the idle state in ms
>> + * device/gt#/gtidle/idle_status - Provides current idle state
>> + */
>> +
>> +static struct xe_gt_idle *dev_to_gtidle(struct device *dev)
>> +{
>> +	struct kobject *kobj = &dev->kobj;
>> +
>> +	return &kobj_to_gt(kobj->parent)->gtidle;
>> +}
>> +
>> +static struct xe_gt *gtidle_to_gt(struct xe_gt_idle *gtidle)
>> +{
>> +	return container_of(gtidle, struct xe_gt, gtidle);
>> +}
>> +
>> +static struct xe_guc_pc *gtidle_to_pc(struct xe_gt_idle *gtidle)
>> +{
>> +	return &gtidle_to_gt(gtidle)->uc.guc.pc;
>> +}
>> +
>> +static const char *gt_idle_state_to_string(enum xe_gt_idle_state state)
>> +{
>> +	switch (state) {
>> +	case GT_IDLE_RC0:
>> +		return "rc0";
>> +	case GT_IDLE_RC6:
>> +		return "rc6";
>> +	default:
>> +		return "unknown";
>> +	}
>> +}
>> +
>> +static u64 get_residency_ms(struct xe_gt_idle *gtidle, u64 cur_residency)
>> +{
>> +	u64 delta, overflow_residency, prev_residency;
>> +
>> +	overflow_residency = BIT_ULL(32);
>> +	/*
>> +	 * Counter wrap handling
>> +	 * Store previous hw counter values for counter wrap-around handling
>> +	 * Relying on sufficient frequency of queries otherwise counters can still wrap.
>> +	 */
>> +	prev_residency = gtidle->prev_residency;
>> +	gtidle->prev_residency = cur_residency;
>> +
>> +	/* delta */
>> +	if (cur_residency >= prev_residency)
>> +		delta = cur_residency - prev_residency;
>> +	else
>> +		delta = cur_residency + (overflow_residency - prev_residency);
>> +
>> +	/* Add delta to extended raw driver copy of idle residency */
>> +	cur_residency = gtidle->cur_residency + delta;
>> +	gtidle->cur_residency = cur_residency;
>> +
>> +	/* residency multiplier in ns, convert to ms */
>> +	return mul_u64_u32_div(cur_residency, gtidle->residency_multiplier, 1e6);
>> +}
>> +
>> +static ssize_t name_show(struct device *dev,
>> +			 struct device_attribute *attr, char *buff)
>> +{
>> +	struct xe_gt_idle *gtidle = dev_to_gtidle(dev);
>> +
>> +	return sysfs_emit(buff, gtidle->name);
>> +}
>> +static DEVICE_ATTR_RO(name);
>> +
>> +static ssize_t idle_status_show(struct device *dev,
>> +				struct device_attribute *attr, char *buff)
>> +{
>> +	struct xe_gt_idle *gtidle = dev_to_gtidle(dev);
>> +	struct xe_guc_pc *pc = gtidle_to_pc(gtidle);
>> +	enum xe_gt_idle_state state;
>> +
>> +	state = gtidle->idle_status(pc);
>> +
>> +	return sysfs_emit(buff, "%s\n", gt_idle_state_to_string(state));
>> +}
>> +static DEVICE_ATTR_RO(idle_status);
>> +
>> +static ssize_t idle_residency_ms_show(struct device *dev,
>> +				      struct device_attribute *attr, char *buff)
>> +{
>> +	struct xe_gt_idle *gtidle = dev_to_gtidle(dev);
>> +	struct xe_guc_pc *pc = gtidle_to_pc(gtidle);
>> +	u64 residency;
>> +
>> +	residency = gtidle->idle_residency(pc);
>> +	return sysfs_emit(buff, "%llu\n", get_residency_ms(gtidle, residency));
>> +}
>> +static DEVICE_ATTR_RO(idle_residency_ms);
>> +
>> +static const struct attribute *gt_idle_attrs[] = {
>> +	&dev_attr_name.attr,
>> +	&dev_attr_idle_status.attr,
>> +	&dev_attr_idle_residency_ms.attr,
>> +	NULL,
>> +};
>> +
>> +static void gt_idle_sysfs_fini(struct drm_device *drm, void *arg)
>> +{
>> +	struct kobject *kobj = arg;
>> +
>> +	sysfs_remove_files(kobj, gt_idle_attrs);
>> +	kobject_put(kobj);
>> +}
>> +
>> +int xe_gt_idle_sysfs_init(struct xe_gt_idle *gtidle)
>> +{
>> +	struct xe_gt *gt = gtidle_to_gt(gtidle);
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +	struct kobject *kobj;
>> +	int err;
>> +
>> +	kobj = kobject_create_and_add("gtidle", gt->sysfs);
>> +	if (!kobj)
>> +		return -ENOMEM;
>> +
>> +	sprintf(gtidle->name, "gt%d-rc\n", gt->info.id);
>> +	/* Multiplier for  RC6 Residency counter in units of 1.28us */
>> +	gtidle->residency_multiplier = 1280;
>> +	gtidle->idle_residency = xe_guc_pc_rc6_residency;
>> +	gtidle->idle_status = xe_guc_pc_rc_status;
>> +
>> +	err = sysfs_create_files(kobj, gt_idle_attrs);
>> +	if (err) {
>> +		kobject_put(kobj);
>> +		return err;
>> +	}
>> +
>> +	err = drmm_add_action_or_reset(&xe->drm, gt_idle_sysfs_fini, kobj);
>> +	if (err)
>> +		return err;
>> +
>> +	return 0;
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_gt_idle_sysfs.h b/drivers/gpu/drm/xe/xe_gt_idle_sysfs.h
>> new file mode 100644
>> index 000000000000..a654561fda19
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_gt_idle_sysfs.h
>> @@ -0,0 +1,13 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_GT_IDLE_SYSFS_H_
>> +#define _XE_GT_IDLE_SYSFS_H_
>> +
>> +#include "xe_gt_idle_sysfs_types.h"
>> +
>> +int xe_gt_idle_sysfs_init(struct xe_gt_idle *gtidle);
>> +
>> +#endif /* _XE_GT_IDLE_SYSFS_H_ */
>> diff --git a/drivers/gpu/drm/xe/xe_gt_idle_sysfs_types.h b/drivers/gpu/drm/xe/xe_gt_idle_sysfs_types.h
>> new file mode 100644
>> index 000000000000..b9cfb37aae75
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_gt_idle_sysfs_types.h
>> @@ -0,0 +1,38 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_GT_IDLE_SYSFS_TYPES_H_
>> +#define _XE_GT_IDLE_SYSFS_TYPES_H_
>> +
>> +#include <linux/types.h>
>> +
>> +struct xe_guc_pc;
>> +
>> +/* States of GT Idle */
>> +enum xe_gt_idle_state {
>> +	GT_IDLE_RC0,
>> +	GT_IDLE_RC6,
>> +	GT_IDLE_UNKNOWN,
>> +};
>> +
>> +/**
>> + * struct xe_gt_idle - A struct that contains idle properties based of gt
>> + */
>> +struct xe_gt_idle {
>> +	/** @name: name */
>> +	char name[16];
>> +	/** @residency_multiplier: residency multiplier in ns */
>> +	u32 residency_multiplier;
>> +	/** @cur_residency: raw driver copy of idle residency */
>> +	u64 cur_residency;
>> +	/** @prev_residency: previous residency counter */
>> +	u64 prev_residency;
>> +	/** @idle_status: get the current idle state */
>> +	enum xe_gt_idle_state (*idle_status)(struct xe_guc_pc *pc);
>> +	/** @idle_residency: get idle residency counter */
>> +	u64 (*idle_residency)(struct xe_guc_pc *pc);
>> +};
>> +
>> +#endif /* _XE_GT_IDLE_SYSFS_TYPES_H_ */
>> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
>> index 7c47d67aa8be..8dec660f5fc6 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_types.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
>> @@ -7,6 +7,7 @@
>>   #define _XE_GT_TYPES_H_
>>   
>>   #include "xe_force_wake_types.h"
>> +#include "xe_gt_idle_sysfs_types.h"
>>   #include "xe_hw_engine_types.h"
>>   #include "xe_hw_fence_types.h"
>>   #include "xe_reg_sr_types.h"
>> @@ -287,6 +288,9 @@ struct xe_gt {
>>   	/** @uc: micro controllers on the GT */
>>   	struct xe_uc uc;
>>   
>> +	/** @gtidle: idle properties of GT */
>> +	struct xe_gt_idle gtidle;
>> +
>>   	/** @engine_ops: submission backend engine operations */
>>   	const struct xe_engine_ops *engine_ops;
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
>> index e799faa1c6b8..31c56a0dc210 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>> @@ -76,12 +76,7 @@
>>    *
>>    * Render-C states is also a GuC PC feature that is now enabled in Xe for
>>    * all platforms.
>> - * Xe's GuC PC provides a sysfs API for Render-C States:
>>    *
>> - * device/gt#/rc* *read-only* files:
>> - * - rc_status: Provide the actual immediate status of Render-C: (rc0 or rc6)
>> - * - rc6_residency: Provide the rc6_residency counter in units of 1.28 uSec.
>> - *                  Prone to overflows.
>>    */
>>   
>>   static struct xe_guc *
>> @@ -580,10 +575,12 @@ static ssize_t freq_max_store(struct device *dev, struct device_attribute *attr,
>>   }
>>   static DEVICE_ATTR_RW(freq_max);
>>   
>> -static ssize_t rc_status_show(struct device *dev,
>> -			      struct device_attribute *attr, char *buff)
>> +/**
>> + * xe_guc_pc_rc_status - get the current Render C state
>> + * @pc - XE_GuC_PC instance
>> + */
>> +enum xe_gt_idle_state xe_guc_pc_rc_status(struct xe_guc_pc *pc)
>>   {
>> -	struct xe_guc_pc *pc = dev_to_pc(dev);
>>   	struct xe_gt *gt = pc_to_gt(pc);
>>   	u32 reg;
>>   
>> @@ -593,37 +590,30 @@ static ssize_t rc_status_show(struct device *dev,
>>   
>>   	switch (REG_FIELD_GET(RCN_MASK, reg)) {
>>   	case GT_RC6:
>> -		return sysfs_emit(buff, "rc6\n");
>> +		return GT_IDLE_RC6;
>>   	case GT_RC0:
>> -		return sysfs_emit(buff, "rc0\n");
>> +		return GT_IDLE_RC0;
>>   	default:
>> -		return -ENOENT;
>> +		return GT_IDLE_UNKNOWN;
>>   	}
>>   }
>> -static DEVICE_ATTR_RO(rc_status);
>>   
>> -static ssize_t rc6_residency_show(struct device *dev,
>> -				  struct device_attribute *attr, char *buff)
>> +/**
>> + * xe_guc_pc_rc6_residency - rc6 residency counter
>> + * @pc - Xe_GuC_PC instance
>> + */
>> +u64 xe_guc_pc_rc6_residency(struct xe_guc_pc *pc)
>>   {
>> -	struct xe_guc_pc *pc = dev_to_pc(dev);
>>   	struct xe_gt *gt = pc_to_gt(pc);
>> -	u32 reg;
>> -	ssize_t ret;
>> +	u64 reg;
>>   
>> -	xe_device_mem_access_get(pc_to_xe(pc));
>> -	ret = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>> -	if (ret)
>> -		goto out;
>> +	xe_device_mem_access_get(gt_to_xe(gt));
>>   
>>   	reg = xe_mmio_read32(gt, GT_GFX_RC6);
>> -	ret = sysfs_emit(buff, "%u\n", reg);
>>   
>> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>> -out:
>> -	xe_device_mem_access_put(pc_to_xe(pc));
>> -	return ret;
>> +	xe_device_mem_access_put(gt_to_xe(gt));
>> +	return reg;
>>   }
>> -static DEVICE_ATTR_RO(rc6_residency);
>>   
>>   static const struct attribute *pc_attrs[] = {
>>   	&dev_attr_freq_act.attr,
>> @@ -633,8 +623,6 @@ static const struct attribute *pc_attrs[] = {
>>   	&dev_attr_freq_rpn.attr,
>>   	&dev_attr_freq_min.attr,
>>   	&dev_attr_freq_max.attr,
>> -	&dev_attr_rc_status.attr,
>> -	&dev_attr_rc6_residency.attr,
>>   	NULL
>>   };
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
>> index da29e4934868..976179dbc9a8 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
>> @@ -12,4 +12,6 @@ int xe_guc_pc_init(struct xe_guc_pc *pc);
>>   int xe_guc_pc_start(struct xe_guc_pc *pc);
>>   int xe_guc_pc_stop(struct xe_guc_pc *pc);
>>   
>> +enum xe_gt_idle_state xe_guc_pc_rc_status(struct xe_guc_pc *pc);
>> +u64 xe_guc_pc_rc6_residency(struct xe_guc_pc *pc);
>>   #endif /* _XE_GUC_PC_H_ */
>> -- 
>> 2.40.0
>>
> 
