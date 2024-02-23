Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE716C5478C
	for <intel-xe@archiver.kernel.org>; Fri, 23 Feb 2024 14:44:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7675710EC2D;
	Fri, 23 Feb 2024 14:44:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ut7dbqsU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CF2F10EC2F
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Feb 2024 14:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708699498; x=1740235498;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vG1D9SplxGlO8ZPCX0R+CJSLCFMqC15xpVfztG752qo=;
 b=Ut7dbqsURSp3brAp5V0MaMk49hi7mPLwI2eymLoSpJHsNIxzH5ByYOcj
 qEh2nyqfsX2Pa4TAjmMogm220SDJtMrHNC+6Cd/37DAMezOkdOhNEXyNG
 8T71mg9PoRQiTJ05yU+4TaU9OVnIq9zsDUDW+ghQ25O+zxdF/PpMMekJg
 t0PH6mi5+g2Pxv76Zh8w3i85KmCyA/VooekfHNBIcablBWiY9DorAIExi
 HM8jAl0ym/SzLPYd6c4MxKEWyrROM03UfTkdU2ZTgT4Xf8qokDjZm6aTG
 F4D1kxvUzm60eKOpqXpll/BeoZBo6w3tfkMW4tYEp85fxqosW+fqDsUkD Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="2883891"
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="2883891"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2024 06:44:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="6297506"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Feb 2024 06:44:58 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 23 Feb 2024 06:44:56 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 23 Feb 2024 06:44:56 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 23 Feb 2024 06:44:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DBDNDc92ouo4RIffgTBpcN7rEQs8vsVTJl5fBM/rj79bGiHqNCieYG0euxKcBbmJIE/J8cq4c/n8EAYy9EdBB44rPZXXXIC7silfsu74zWSw7pjTQdUiFve9ep/dwXuRv0wmpXL3flq7R1BFvX8lFxBeW842zXd0Zq3oMnNHG7XwNDNotZAlFys/Fwjzsp/b7y12319rvLVGwEk5ujaHcvNwpalTIsuH2JhYjUCb9r/z5NccPcHtrCaVZ5z6948WH80YjzE/2+NT8cASk8A504wS7LYrKF5wfdj9+LPZJ5TAQH/WRFy6oUjUCia+qqR3uncfNj5jR0Vt3wgQVW17Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bCIaSK8J4+E2b/C4/2hZNHFhDX85+zIoMFRqcn4aA90=;
 b=hHw/XTm0ujkaPKynX+TGhgOxpzDqFQU8p/pn+dbIIR3j7DNCU221c+TC82YRb8diW9HGs9uJwfZmnMf0PMHM04qlPBpUMSozkD38zJpeMUgwcO+gVFmmym2xcoEmbu4xt8TDbybEXJFttIwkb8YzbAqC7Tjl4PLzcl9xxjbXsHHY1GAOgjo6vEjBv6PJJkRedKlPX1XAPcLpI8wi+2hop1I6VmJW9tQ+gfJto8UwLKEtB9q3PCES0VdDoY9vlYxGMU4pzJwDpD/9P3UozDWuJ3TLnICS+HUs22k3pirgU4/cFAJr+/E1rzMY5jThzZsgy3AIqBbNimLHGtw7P/PJjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 SA1PR11MB8255.namprd11.prod.outlook.com (2603:10b6:806:252::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.10; Fri, 23 Feb
 2024 14:44:54 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::a8f5:a774:62a3:dd1e]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::a8f5:a774:62a3:dd1e%7]) with mapi id 15.20.7339.009; Fri, 23 Feb 2024
 14:44:53 +0000
Message-ID: <16fdaedc-ee09-44c1-a9c8-c0ff11632143@intel.com>
Date: Fri, 23 Feb 2024 15:44:50 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Remove unused 'create' parameter from queue
 property logic
Content-Language: en-US
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20240223122311.7238-1-nirmoy.das@intel.com>
 <ZdinuD7bd_KTkz_m@intel.com>
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <ZdinuD7bd_KTkz_m@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0184.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::19) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|SA1PR11MB8255:EE_
X-MS-Office365-Filtering-Correlation-Id: 80b8d21d-32c1-4be4-639c-08dc347dff2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RVm2Ke8aRJd8YgHygbn40vNx9n8x0R3s/6wJ0ArzpFVqA3XAyhillXReshkyOXu+YXuIzvGfFf4gc5/AwM3To/kTyIhK4t2dqTelEWq71wJc3N+5FZzv6Hz6odHENC6y5hSXDObp0bAU1mEIkhOLYkTflxuB6tfZQJF5722X6lxTqTDEFVOeMs5ohER6QiYy/pkElIBcCxRTEgf04Yn6uiKjMW3ZI2VNae7riQ5IGbyoz65ljw51nqW6NK9Zy5K+EKu3/ild622QtzUw4dzi5MDiQbmdFouGGWMM0WQvLkX+bZgiCY5UQ+1C8UphNe4P2ovG0zcjFPL2ycQui1KKdq94dxah7tb2LZzUHmf8gFjgf37oCedjGOXs2Wn2svZK0uDMcioZuqgCZZwMrPHCA4XuPNE/Y2QFtwTwW+Ekfk0+TkgIngvnkDYb8Y7UqBTVaO27mfETad6/1B29y8Ytrz34Gho016ozVaD/z8cuP95wGPRtlfLAnJjTAv8dpCuH3Si4gKi1YAQEgwdz5GQw12Yy8LoGLyk3P/cDEc2xC6g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vk1aWjZ4cTFtYWwzc2l4Qjc3MzJJLzJEVDJySzRGVjFvRkhlWHJndEtYQWM4?=
 =?utf-8?B?MkhSZ0ozTGhDd2ZRZnBXQ3VWV3VYSmhBaWIrbS8vZ2dhY1ppYnpUbXprWGlW?=
 =?utf-8?B?UHF1aVRSUndNL0dlT0RUWDh4K2tHWGhraHRVeGpZNTBxcWptMjJOZkxNS3dP?=
 =?utf-8?B?bXpTa2ljUjJyRHlBTHdmc1dGSVQ2cFo4REszWDNtcC9IanpIWjA3S1IzS1Zu?=
 =?utf-8?B?dnRzYVdob1lXRHcxOEEwN0V6WkxwWHpnNE4vTFZ2NTUrWmFweWEzanVCQitq?=
 =?utf-8?B?Nm45ZUNITnBESUV5c29oUGhCV3hkc2RVZG4wT3RKa29nQzFFTHZ0Nzd5UjZj?=
 =?utf-8?B?cTVGRThIUmlzbkJ2YXpVQnhnYTNsclNUVFJJQ0tWdnhkVVpiY1NiN2kwTllU?=
 =?utf-8?B?NEtnb3ZZMWJEMlhlWlZPMWt0eWJvYlFLVXdYUjlWTEFHR0pGZXUwT2g2TnlB?=
 =?utf-8?B?cnh6akZ4aE15ZVpkdE42YmsvZk1jQTVQUWk1Y3owbllyUWRzKzk4bHJOVERR?=
 =?utf-8?B?Uk02UkJCQ3BpeUdPUmI0SW9FdUxuMi9vdUhaYjFXejcvS3BZUU11UmNleUpN?=
 =?utf-8?B?MEQ2QTU4Qzl0bUF4aHNWVjIwYlFEWVhXUEZTRFEzT2txK0FDblFQcGNzZmhY?=
 =?utf-8?B?NXpZYWZGbzJyMXJVY0ZuS0thZGRsUk85d0xUNkNQT3pZV2JIK1ZxMmpCaFFW?=
 =?utf-8?B?VWlVOEw1cE94TFlsUnlMbFdzaW15MytTVzFDRHZBcHVsK2ZmcVpZZ21qUmJ0?=
 =?utf-8?B?OWdxQjdtSFUrOFBlZ2psTUcyTjJXb1pEQzJqZGlrZnRGSmVEYXhUTlgvWmQ4?=
 =?utf-8?B?TFJrN0xXK2xmZGh1dkpwMHpubXl0b2NFSEQwRjBnSWRGakt2M1pjOVBCN1da?=
 =?utf-8?B?Tzc3UHEwY2pML3ZYYVBzd1IrNTJEU1I1VkNPUVVaRjl5S1gyNFp2TGtCTjha?=
 =?utf-8?B?b3BIWjdKYkYxeTcvR1ZBS2ZQS1l3d1lXTkp3OERpYUNFamtLY2c0MTR6bUFM?=
 =?utf-8?B?SXZjTEx4L1dHc3V2anVQMHRPa05yU1NwMFlVNG1tSEdhYkVsVzFBQmptS1Rv?=
 =?utf-8?B?MFd5U0hlUHdPTUZWd0w0cVl3azV6aE56Y2NxUDkvSFlXM2ZCeDUwbTdXaHFD?=
 =?utf-8?B?aE0vZUlEaE53SGFrTjBHVG4xL1lGMW05NGhFYnI5a2pab3RmbC9jcENEcXdZ?=
 =?utf-8?B?MkMyZUpFeklydGRjWGs4dVlqWE1zSXhIVTdFSitlZktuTDRiNHlqZW5SQTRP?=
 =?utf-8?B?K3c2M0RPOG4vOGFZRElKaVI2OTRZRGFPdkRSVXQrOFdueVQzSlMxL2Y3Uncx?=
 =?utf-8?B?d2dIaCtna3c4Q1BudEZQVzJHb2dja0hhdzZMMjRSRFRnR2R5elJuaXEwK2Nt?=
 =?utf-8?B?SXB4dDBDN3oyZG5rSmhoNWY4bTVOaUtraXZrNzN1c3F0a2xkRjMxOFFBT2pC?=
 =?utf-8?B?VVY4cUxaSWNjczhTSnNnVWZ0c2sxWUVvL2E5YnFrQ29QbzhBZ2cvSnJVcWl0?=
 =?utf-8?B?N2cwemsrand6akdXV1EvWUtPQS9YR2I0WU53bkx3eDMwb2xyVStKTHVPM3hB?=
 =?utf-8?B?ekwzcXI1R2tpMitTaGcvbzJKY1FtZGlZaVVWdmEwSk84ZEZXc1FUOFFhblRC?=
 =?utf-8?B?Sjh6OGNTL05uTjJYSDl4L2wyY3RkdnJOQTJkbVErd1A4OE9jQ0duZjZlTytM?=
 =?utf-8?B?Q1dtTEZQQkdZNkFNbUtQTXIwOWY3b2dvZkc4UDJwK1FIYldFNGp1ZnpNK3Vy?=
 =?utf-8?B?Wkdjbk1Wa0lCVis5eU1HbWJOM1VYM2hmQ01oWERYczRpZCtOSVRjek4yb3FY?=
 =?utf-8?B?WXZtNjZXNC9abjlyVkhlQkJHSHc0OHhFODFFam96VG1YdmZ5UGxFOGFBNXdm?=
 =?utf-8?B?UXEzdnhZZnVub0tEVXNJUU0rUlBQODRjdnR2ZVhBSFpZVERIVnhwL1Y3ZU51?=
 =?utf-8?B?ZkVENVhEb0J6MDdDbUI2Rm9FL1ZoNCtwOS81bC9oN1Y4YnBlWDRkTTFJOGF0?=
 =?utf-8?B?bFpQMlpRRFc3Wjk1U3hrNGlEd1FyQlE3NllXbWZLNUg0NjFROGoyNmVCWDZU?=
 =?utf-8?B?bFVjT2xxK2FwRyszYnpxNlVLVERQc2FqNm9VdEFHeGVTUGpCU1E2aUpHQnpi?=
 =?utf-8?Q?LsMLzvm9wqCAFJU6pR2zAfWMw?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 80b8d21d-32c1-4be4-639c-08dc347dff2a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2024 14:44:53.8705 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JG0OaZa1GMK/BZGKO6GOzvlU3Q5Xo5ZrQr4MFThLlKdtIJrmGjA5g0YJ9UYMA6UGMQv0Js86Y+Ir0/S2tlOluA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8255
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


On 2/23/2024 3:12 PM, Rodrigo Vivi wrote:
> On Fri, Feb 23, 2024 at 01:23:11PM +0100, Nirmoy Das wrote:
>> The 'create' parameter in exec_queue_user_extensions was always true.
>> This commit removes the dead parameter and all the relevant dead code.
> I'm afraid that you need to rebase now that I just push the removal
> of some of these functions.
>
> But with that rebased you can already resend it using
>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Resent, thanks!

Nirmoy

>
>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_exec_queue.c | 56 +++++++++---------------------
>>   1 file changed, 16 insertions(+), 40 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>> index 4bb8f897bf15..969c82d20e79 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>> @@ -31,7 +31,7 @@ enum xe_exec_queue_sched_prop {
>>   };
>>   
>>   static int exec_queue_user_extensions(struct xe_device *xe, struct xe_exec_queue *q,
>> -				      u64 extensions, int ext_number, bool create);
>> +				      u64 extensions, int ext_number);
>>   
>>   static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
>>   						   struct xe_vm *vm,
>> @@ -79,7 +79,7 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
>>   		 * may set q->usm, must come before xe_lrc_init(),
>>   		 * may overwrite q->sched_props, must come before q->ops->init()
>>   		 */
>> -		err = exec_queue_user_extensions(xe, q, extensions, 0, true);
>> +		err = exec_queue_user_extensions(xe, q, extensions, 0);
>>   		if (err) {
>>   			kfree(q);
>>   			return ERR_PTR(err);
>> @@ -268,7 +268,7 @@ xe_exec_queue_device_get_max_priority(struct xe_device *xe)
>>   }
>>   
>>   static int exec_queue_set_priority(struct xe_device *xe, struct xe_exec_queue *q,
>> -				   u64 value, bool create)
>> +				   u64 value)
>>   {
>>   	if (XE_IOCTL_DBG(xe, value > XE_EXEC_QUEUE_PRIORITY_HIGH))
>>   		return -EINVAL;
>> @@ -276,9 +276,6 @@ static int exec_queue_set_priority(struct xe_device *xe, struct xe_exec_queue *q
>>   	if (XE_IOCTL_DBG(xe, value > xe_exec_queue_device_get_max_priority(xe)))
>>   		return -EPERM;
>>   
>> -	if (!create)
>> -		return q->ops->set_priority(q, value);
>> -
>>   	q->sched_props.priority = value;
>>   	return 0;
>>   }
>> @@ -336,7 +333,7 @@ xe_exec_queue_get_prop_minmax(struct xe_hw_engine_class_intf *eclass,
>>   }
>>   
>>   static int exec_queue_set_timeslice(struct xe_device *xe, struct xe_exec_queue *q,
>> -				    u64 value, bool create)
>> +				    u64 value)
>>   {
>>   	u32 min = 0, max = 0;
>>   
>> @@ -347,16 +344,12 @@ static int exec_queue_set_timeslice(struct xe_device *xe, struct xe_exec_queue *
>>   	    !xe_hw_engine_timeout_in_range(value, min, max))
>>   		return -EINVAL;
>>   
>> -	if (!create)
>> -		return q->ops->set_timeslice(q, value);
>> -
>>   	q->sched_props.timeslice_us = value;
>>   	return 0;
>>   }
>>   
>>   static int exec_queue_set_preemption_timeout(struct xe_device *xe,
>> -					     struct xe_exec_queue *q, u64 value,
>> -					     bool create)
>> +					     struct xe_exec_queue *q, u64 value)
>>   {
>>   	u32 min = 0, max = 0;
>>   
>> @@ -367,21 +360,15 @@ static int exec_queue_set_preemption_timeout(struct xe_device *xe,
>>   	    !xe_hw_engine_timeout_in_range(value, min, max))
>>   		return -EINVAL;
>>   
>> -	if (!create)
>> -		return q->ops->set_preempt_timeout(q, value);
>> -
>>   	q->sched_props.preempt_timeout_us = value;
>>   	return 0;
>>   }
>>   
>>   static int exec_queue_set_job_timeout(struct xe_device *xe, struct xe_exec_queue *q,
>> -				      u64 value, bool create)
>> +				      u64 value)
>>   {
>>   	u32 min = 0, max = 0;
>>   
>> -	if (XE_IOCTL_DBG(xe, !create))
>> -		return -EINVAL;
>> -
>>   	xe_exec_queue_get_prop_minmax(q->hwe->eclass,
>>   				      XE_EXEC_QUEUE_JOB_TIMEOUT, &min, &max);
>>   
>> @@ -395,11 +382,8 @@ static int exec_queue_set_job_timeout(struct xe_device *xe, struct xe_exec_queue
>>   }
>>   
>>   static int exec_queue_set_acc_trigger(struct xe_device *xe, struct xe_exec_queue *q,
>> -				      u64 value, bool create)
>> +				      u64 value)
>>   {
>> -	if (XE_IOCTL_DBG(xe, !create))
>> -		return -EINVAL;
>> -
>>   	if (XE_IOCTL_DBG(xe, !xe->info.has_usm))
>>   		return -EINVAL;
>>   
>> @@ -409,11 +393,8 @@ static int exec_queue_set_acc_trigger(struct xe_device *xe, struct xe_exec_queue
>>   }
>>   
>>   static int exec_queue_set_acc_notify(struct xe_device *xe, struct xe_exec_queue *q,
>> -				     u64 value, bool create)
>> +				     u64 value)
>>   {
>> -	if (XE_IOCTL_DBG(xe, !create))
>> -		return -EINVAL;
>> -
>>   	if (XE_IOCTL_DBG(xe, !xe->info.has_usm))
>>   		return -EINVAL;
>>   
>> @@ -423,11 +404,8 @@ static int exec_queue_set_acc_notify(struct xe_device *xe, struct xe_exec_queue
>>   }
>>   
>>   static int exec_queue_set_acc_granularity(struct xe_device *xe, struct xe_exec_queue *q,
>> -					  u64 value, bool create)
>> +					  u64 value)
>>   {
>> -	if (XE_IOCTL_DBG(xe, !create))
>> -		return -EINVAL;
>> -
>>   	if (XE_IOCTL_DBG(xe, !xe->info.has_usm))
>>   		return -EINVAL;
>>   
>> @@ -441,7 +419,7 @@ static int exec_queue_set_acc_granularity(struct xe_device *xe, struct xe_exec_q
>>   
>>   typedef int (*xe_exec_queue_set_property_fn)(struct xe_device *xe,
>>   					     struct xe_exec_queue *q,
>> -					     u64 value, bool create);
>> +					     u64 value);
>>   
>>   static const xe_exec_queue_set_property_fn exec_queue_set_property_funcs[] = {
>>   	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY] = exec_queue_set_priority,
>> @@ -455,8 +433,7 @@ static const xe_exec_queue_set_property_fn exec_queue_set_property_funcs[] = {
>>   
>>   static int exec_queue_user_ext_set_property(struct xe_device *xe,
>>   					    struct xe_exec_queue *q,
>> -					    u64 extension,
>> -					    bool create)
>> +					    u64 extension)
>>   {
>>   	u64 __user *address = u64_to_user_ptr(extension);
>>   	struct drm_xe_ext_set_property ext;
>> @@ -476,13 +453,12 @@ static int exec_queue_user_ext_set_property(struct xe_device *xe,
>>   	if (!exec_queue_set_property_funcs[idx])
>>   		return -EINVAL;
>>   
>> -	return exec_queue_set_property_funcs[idx](xe, q, ext.value,  create);
>> +	return exec_queue_set_property_funcs[idx](xe, q, ext.value);
>>   }
>>   
>>   typedef int (*xe_exec_queue_user_extension_fn)(struct xe_device *xe,
>>   					       struct xe_exec_queue *q,
>> -					       u64 extension,
>> -					       bool create);
>> +					       u64 extension);
>>   
>>   static const xe_exec_queue_set_property_fn exec_queue_user_extension_funcs[] = {
>>   	[DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY] = exec_queue_user_ext_set_property,
>> @@ -490,7 +466,7 @@ static const xe_exec_queue_set_property_fn exec_queue_user_extension_funcs[] = {
>>   
>>   #define MAX_USER_EXTENSIONS	16
>>   static int exec_queue_user_extensions(struct xe_device *xe, struct xe_exec_queue *q,
>> -				      u64 extensions, int ext_number, bool create)
>> +				      u64 extensions, int ext_number)
>>   {
>>   	u64 __user *address = u64_to_user_ptr(extensions);
>>   	struct drm_xe_user_extension ext;
>> @@ -511,13 +487,13 @@ static int exec_queue_user_extensions(struct xe_device *xe, struct xe_exec_queue
>>   
>>   	idx = array_index_nospec(ext.name,
>>   				 ARRAY_SIZE(exec_queue_user_extension_funcs));
>> -	err = exec_queue_user_extension_funcs[idx](xe, q, extensions, create);
>> +	err = exec_queue_user_extension_funcs[idx](xe, q, extensions);
>>   	if (XE_IOCTL_DBG(xe, err))
>>   		return err;
>>   
>>   	if (ext.next_extension)
>>   		return exec_queue_user_extensions(xe, q, ext.next_extension,
>> -					      ++ext_number, create);
>> +						  ++ext_number);
>>   
>>   	return 0;
>>   }
>> -- 
>> 2.42.0
>>
