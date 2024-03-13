Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79820C54E66
	for <intel-xe@archiver.kernel.org>; Wed, 13 Mar 2024 17:36:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B6FA10F4DD;
	Wed, 13 Mar 2024 17:36:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A6TgWwDw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46D9010F4DD
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Mar 2024 17:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710351366; x=1741887366;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XHT2FPTaJLleD8eLEgiuyh2o03gRnjgydsb3446IizY=;
 b=A6TgWwDwXnR0RZ5TZBMRLwRW+fWpdFm+H0bCDTvPFBCETV3ytH6ZDnec
 WY0AuDUg+lOjAaWdM8iRqjQLOvWIwtQ2abI9Hm6w+tjJvNlFDB8PpmdDy
 rOG4TOluF2WNG4ZNDtWAAjHl67RqgxPPLUCu57qgDVkIBgwvpbMxtKAnn
 sdhqV4gLkTfYkwoEpeIew3/IhZQ2p6eXjJ+E8cGigUuaf212F8ZrK0Sag
 uCJyM75KPiZlNF0pYbMWuoCUYOGqsCBwTIv0+CxBEpTHNj68XE8+KaDUJ
 XZorIX3pBdwY4CClS+mMVSFq4LsvY4nk3Yhwv3TCqGNnp3inayUaXQ00/ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="5742082"
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; 
   d="scan'208";a="5742082"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 10:36:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; d="scan'208";a="16457972"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Mar 2024 10:36:05 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Mar 2024 10:36:05 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Mar 2024 10:36:04 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 13 Mar 2024 10:36:04 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 13 Mar 2024 10:36:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MjadoD4JGFXRsv6s0ky5MYnC04GTH4QAzkuur5X77EhddbJg9JBpPdB09DPVT5/4gRxQdiCfU/Cod/jZFd4u49jKx+cMx5zFmeKMPUgLc0bumKbxQnAZV5qLn/CxDN3rLj9vXQ8gZAk7B8qKwRCFKnMHQQoGBQ48W9uxb1aRqbT1cKcA3JW2n2xO4Be21IHKG9ruYEIqt4okwPjtjt+QyX4LnDVy0LWNNnq5E7bGt7yzzwes9AeDMtcEdAAXxvbV84di2dl3oV2I6mSteV68DN7LB87kHHuNsK+HNwc3BQqUSzAJV24CguZffxyI38srqy0mlYDWfuUnDczeGfosNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CVEjkzAGhpsyGCYLx4tFMyA932TfQIPRKCOq8sCUkm0=;
 b=asE1Zk0L52mEZe1IzTLRBY4uxybfM8x/Idw5t98rX5eGZGP9d8KVc3Py3L11EjoUhqqNtvsIBMYxGjdoopB7WlYas66z0ClRGarXfEuA2Yw6y8v3JoowkiJwwWJWVm22SUcXz+S3vTjNiAD69IUT9M8KJyg9i171qXBXHloV+JdssExsNbYdp5NZ7kbLfzP0L+WJhGBMeobvZq+Rd+h8NX7sBDq4N34++qUPZT6FkuBE8DGMykYuEWIUikJoyLBXQVvbA0Dmvs9yGDG8RbQtxeToJvuzcfYwhzruE4meFJO1xrCJWJ//UxmGW/oRNk034ilZGS1WN9QAsVIG3qAy1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by SJ0PR11MB4864.namprd11.prod.outlook.com (2603:10b6:a03:2d4::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.20; Wed, 13 Mar
 2024 17:36:02 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::5144:aca9:5cd9:42bf]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::5144:aca9:5cd9:42bf%3]) with mapi id 15.20.7386.017; Wed, 13 Mar 2024
 17:36:02 +0000
Message-ID: <82932c4f-7781-49c1-b3df-f41d0925237e@intel.com>
Date: Wed, 13 Mar 2024 10:35:59 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Always check force_wake_get return code
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>, <intel-xe@lists.freedesktop.org>
CC: Tejas Upadhyay <tejas.upadhyay@intel.com>
References: <20240312194256.965685-1-daniele.ceraolospurio@intel.com>
 <87h6hasfbj.fsf@intel.com> <76b70dd3-794b-45a1-994a-020525954d9f@intel.com>
 <875xxqrxi1.fsf@intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <875xxqrxi1.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR02CA0005.namprd02.prod.outlook.com
 (2603:10b6:303:16d::14) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|SJ0PR11MB4864:EE_
X-MS-Office365-Filtering-Correlation-Id: 09b24506-d038-40c4-ebac-08dc43840dc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HfKqNzQRm3MKar/A8HxtRjXTDrhUiRQGKC7/KBf3GQ40fmbMvt4H2UYH6HIV132DzAfCygsIg0RNKpvLhUP5owUJD19hOkfWw+S6Y7UPDcMuVLk0qqdG2o6+mT2UVIcx7SSh23f58Z9xW7FeZ2uXoM+/20gCNk9eth/84u7Eyj+kd23h48Pxm/tEg0lff1sSIXPnyMnQEOcp43l290rTC8zWTPa1NXupAsKmdaTKTltx1wMcj7gy9u/CPVU5fGzxSeluIXbbWmQ5UowURfKwwymieOc6E49sFzOoDVhba9lOLd2Z1Xr2wfdZCW5bRmkKLXGLuMfzHiEaBG6iNNc6Jb8PS504jWuoq57Xb+MSUtlYtCXWJiqgppcj4PHo+1btaOBehuibhpIzIf9QcneGAS+PYAX/lTQq6izAWEXtdj31zmp59POMF7V7B5ZSI0f/RkHo/IbwdvC4q/5MLX+VR+tzFwQN26gWRWVeH6EuogKkUOQI4JShV2SQZGxy7HMAvM816nthXEyiRLYUuT8dFcNh15/zRnQyZUpRIcEZC15O9OZkKSAqkprlWXVLl4zlnHRMnmChRhLhKCx0X5dsUj6E6xIcXlWYoG+yNghmvTiZonMwF5tMO7GYCyIxAAxotfPzpkuPku+K9JnAQZNrxL8Ypr/TCG09QnmgXHWv/Is=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWF1S2NNWXZ6dVFiUVhwYjBIZ1Q0VGlMVm5OV2dpeXFhc0I0MGpFZnNjSnAv?=
 =?utf-8?B?SjZBU3F6STM3RXBKWCs4OHNmdEprVjBsanoxN1ZqSEhQb3BhYWQ1TnRXQ0pW?=
 =?utf-8?B?WG5aNlNvTGxuK2lTbWxzY05VeE9FM05SZXRpL0ljUVZtdU5UMkpTdW5pbGNL?=
 =?utf-8?B?UmxPcklqZHlxbjV2WTkrcEJpUEdDRGxKemw2cGQrbjBsYjJST3RoaVkxL0tv?=
 =?utf-8?B?K3JUOUx6OVZ3dElPSGNEUVJDZDZQdjF1bno3VExwanNCYzZFNHlCNlNVdTY3?=
 =?utf-8?B?QVNRdW13d1Y3RkhLbU9wZ09uM0ZXMEdzaW0zbHhUbDNpUnVOMEdCNG1HZC9W?=
 =?utf-8?B?VTF2NVp6RVhEeUtrVXJuS0hIU1dDZ0tCT285MmY1djFxczEwb2RiUGtDcWMr?=
 =?utf-8?B?TGErd3ZwWFN2NnpDbURiMmVJenJHZ2dnSmNkV1JnYktsUDA1MERUU0pDZ3RW?=
 =?utf-8?B?S1ZWZ2EzNXFkdjY4WE11MWJnSkxTaFZwd3RkU0RVcVFYY1l3bDIrbWRyL2ZV?=
 =?utf-8?B?U293b2F3WjhqUXFIb1lLbEJRYXlEc1Zqai9wbXNUSHNMZEQrclFNTi9XTXc3?=
 =?utf-8?B?VExqd0ladUZXRXl4Um5aR29Ia2tCZHFmV1Q0US9iQzRwSU9PeEtabzJkekdO?=
 =?utf-8?B?ZXRabHN6SU54SHpWR3k2WStvazI5WkNYclF6V2N0aE5yVGExVDlJM0F3RmFR?=
 =?utf-8?B?VG4yYzJpdXhqUlF4OXJPZjFESHhDQ3AxcTRDYVhjelRMMkJ3cHRUbnlrQ2Fq?=
 =?utf-8?B?Z2l0b2gzUCt4Uy93S1BzUDV3b1lKTUNaQ0tWaGc1aXQveEZCbHdmZzFteDhH?=
 =?utf-8?B?QnJyL3pJOFFGazZNdTNyUitMYlFPQ3hYdk9lWkZwY0tISW1BdVM4YzJESFBH?=
 =?utf-8?B?S1pjTE1iV3ZURGZmUVlBc1dVbWV1VHE2eHZhM0JXZ3VDZWV2WXhycEtPb0FV?=
 =?utf-8?B?OFFwTno3RjBLTTVCakhMdHhiT2lNcDhQa1dJeHJ5RW1zSUxFUjFZODNHc2xu?=
 =?utf-8?B?YllnV3lzYk0wczR3VkZ5dWV1Q2VIcktyQzZSTzA4Mm11cFg4UkZ3RjVoc3hB?=
 =?utf-8?B?TFpRTTFHeG0zdlQ0c1lWZkNua010UjVHNHFQMzduRzV1eStabC9Zay93dHhE?=
 =?utf-8?B?RE51T3dxbGo1ZE9INW54K3p3SStsdkZ3NFdIQndGK2dQaFZTT0IvNm9tYXZV?=
 =?utf-8?B?ako3b2hIUG9XZXJnZlNaM3RXUjIvSmh6RVpBVUFmYlB4Lyt3RE9VcGdUMkdZ?=
 =?utf-8?B?RUswd1BBeFY3K1dRcGZiS1Y2WjQxVWhYUHRGb0RqOXYxbUh2MldZMEY0R3Nj?=
 =?utf-8?B?UzZBMVZmVU1ZYzFYdnAwTFJoOVNvY000Z1dqWEl1WHJ2Wm5yT1RNejBxd1V5?=
 =?utf-8?B?ZTZ5Y3FJclBGV0NQdXptK1pSOEVxY1lyb2txSGcvQXpZdG9BWkpQSXlqV21B?=
 =?utf-8?B?WjN3OW1UdzF4N1BtQktjaWU1dGZUN2hpM0FQNUJZdWEzYUlwZE1UTzFoa2Rt?=
 =?utf-8?B?NVhCQzg2cHJwUk9vQ0Zoc2JzOTlwUmNJNFVPSmJma0k2UGgxUnphNHNRMzRZ?=
 =?utf-8?B?NXUzT0dCMzhJMnZROGdORVlrbFh5ZGdPM2h2bmtldXQrSEtORXF2eHF5WWR5?=
 =?utf-8?B?eC9SUmViYXplQmxSNzJ4cGErYThCeVpGWlduVDRTM0JzUG1sTFFONUdqUEVF?=
 =?utf-8?B?TFhXU3N0VERwM05uRURmQkNCZTF6MUtRM3lDTS81Qy9qM3RnVXVVMCtYMm1q?=
 =?utf-8?B?VWI5eDVVSU1WUWw4YS9wTGpFNGRtaEFNOGF0M09YVGhNanpadDBlTWZ0bFV6?=
 =?utf-8?B?dEg1MkhlUGZBQ3M1NUJPYjU0UW83dWN3YTJHaXVwL05EWjA5ZmxHUTVWdVZx?=
 =?utf-8?B?Q1hjb1ZyZnpsc3YvUnRoS3VOU1hLSVRVeEVyZ0kvaFVFMHZyMU1XVGpuVDR6?=
 =?utf-8?B?TVlRUWRYR1ZGMEJwTk9rMlFuT1d3YldIMmpYRUhYUU1BZ3Qya05ValpKd2xr?=
 =?utf-8?B?aDNBRjcxS2VEVk9LbzVjS2dLV1NXVVJMTFlzcngybnFtanZJaTVnaDc5SlAy?=
 =?utf-8?B?bGNtRFFtendvR0tseklYc2JSNnExN1BBWjV6Rm5pdWdBbGNXRi91Y04xK1pQ?=
 =?utf-8?B?US8xMHZyTG1XVTZ6Z29OL3Vid0lPMlA3dXNpUEVrT2w0dlpMTGszVDJLUVBw?=
 =?utf-8?B?Nnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 09b24506-d038-40c4-ebac-08dc43840dc5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2024 17:36:02.7341 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CiAMdGJDitQg5NBHAikKJ4F8olKfDD3dVFOUwc4OLCpFhlzYN/dkCHG5L6UazBZwzalEPj2I9mvpEg/rwc9DJNWObmCq8dksyQ/nQon40y8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4864
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



On 3/13/2024 7:56 AM, Jani Nikula wrote:
> On Wed, 13 Mar 2024, Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com> wrote:
>> On 3/13/2024 1:31 AM, Jani Nikula wrote:
>>> On Tue, 12 Mar 2024, Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com> wrote:
>>>> diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
>>>> index d9aa815a5bc2..902c52d95a8a 100644
>>>> --- a/drivers/gpu/drm/xe/xe_gsc.c
>>>> +++ b/drivers/gpu/drm/xe/xe_gsc.c
>>>> @@ -287,7 +287,7 @@ static void gsc_work(struct work_struct *work)
>>>>    	spin_unlock_irq(&gsc->lock);
>>>>    
>>>>    	xe_pm_runtime_get(xe);
>>>> -	xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC);
>>>> +	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC));
>>> Up to the xe maintainers to decide, but I'm really not a fan of hiding
>>> functionality inside warn ons. My approach usually is, would it work if
>>> all the warns were removed? If yes, it's good. If not, maybe reconsider.
>> The code works even without the warns, they're only there so we know
>> that there was a forcewake issue if/when some other error crops up down
>> the line (which will be handled appropriately). There is nothing we can
>> do to actually handle the forcewake failure as it can only happen if the
>> HW is in a bad state.
> My point is, I personally prefer:
>
> 	ret = do_stuff():
>
> 	WARN_ON(ret);
>
> over:
>
> 	WARN_ON(do_stuff());
>
> because in the former do_stuff() stands out as something we actually
> want to do functionally, while in the latter the fact that we do
> anything at all is hidden inside the WARN_ON().
>
> I prefer WARN_ON()'s to only have stuff inside them that have no
> side-effects:
>
> 	WARN_ON(check_stuff_but_dont_do_stuff());

Got it, I do agree that it's generally cleaner that way.

>
> Again, not my call to make here, just musing on style. ;)

I actually copied what was done elsewhere in Xe with forcewake failures 
in unabortable paths and other similar checks. For consistency with 
what's already there, I'd prefer to keep it like it is.

Daniele

>
>
> BR,
> Jani.
>
>

