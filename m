Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60B2FCD128A
	for <intel-xe@archiver.kernel.org>; Wed, 10 Apr 2024 12:08:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00B3010E02B;
	Wed, 10 Apr 2024 12:08:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BX2zXT2Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EC9A10E02B
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Apr 2024 12:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712750912; x=1744286912;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ZgOXxf53szkb+yJAaYDmVL0sphFgCc8eeFXFDs4q62s=;
 b=BX2zXT2Yeu5wjcTGlw4qy42Yvy/MOinVWbUF2L4ngwRcT3Qs6UzCCLjx
 x4LGhKPAN3NeUcSlK6x/BVdDLKxR3B+xxi0/fwm/0WiqvbhTAWnKUItFZ
 V0dkjpA4Y55IpJOpR0JlRUQOPUi9Z9EsZrrbuN5UaMIu4a2drTrYFCE3n
 b0XO+PojAiWoB9XuVbelqqdoURWT63xkTeZw2B3vCtOtXybxeAygBDl3L
 DxhnFkmlC92ncNUlzj6w7ux9uaXJtx6m5bpJOQf8fDzLPgwghzWlsgyOj
 PUjfRbpUQJS9hr/KfvT6b4/c5e1yY+K42kMwa+QqMyNbZFbHzkOEPK5Sk A==;
X-CSE-ConnectionGUID: Zfxf7sUkRkOOiak7So5gyg==
X-CSE-MsgGUID: 97tZoUh9RUSxQbHdBa0raQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="19257357"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="19257357"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 05:08:31 -0700
X-CSE-ConnectionGUID: h5Yh0oisSfKZHgUanCdrvQ==
X-CSE-MsgGUID: KBzKT5UVR9q3yfMmh/5tvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="20555665"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Apr 2024 05:08:31 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 10 Apr 2024 05:08:30 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 10 Apr 2024 05:08:30 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 10 Apr 2024 05:08:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JU+iK39IUC9P3pjreNFSsNexf8jcCOSIIVff4mM48Vk1MtEZypE4VvaKHq23SXmZud2Qixg2gnW5ssJ5ncqEyLFWG+zGKeQaNZdVMzGficPFpovYXOsHs4MbK+4xJ7nH5JdPmjUPXxHNA8VQ7fb1HNR+TVGhDOL+BK1hsyQI1upFLQJWuXg5i20sJYke9ziLYKQiq7QCQO3153rufAflxlN3vEt3qCkvdtyDl2Mxk5fTgC2P0asDWNFkYkMV88EUXNZVmYVO9J9uZdls5PHrN0rSu5KumK1+oh3PA68qaO0dtDsoBU0Rb7Ward4ODbVvUbT81pvbcRh2tDi+54u0Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/t2qiETg/96wa8yKg/AQitm1iMlvLPpZKETK07LLdGw=;
 b=ceTWth/24Bzl5PlKWZn6Q7LhF0/1A30s0+eWzGb5pixK4Lsbzmt7ClAZUEx51H4th1EbAZ/7fQifLrhwdhuYPBGcXTQZAjauZKIyb48LmQMmBjTFlh52qKQ/LpHNquuxYyuLg6K9lenoomRZyoRNpm4H5xxuIFDP2++ZRXhCAd1DVnVM3EbIiLY9s9bU9h2VP1fCMsiGKWv37xlsZqJm/0fOTSGcX+64MgtBL0Et4PzhLvLc294ZaJ3zLK8RBywKAKp3wR88xy0Bqk9+l8ASkZ+Lc2DiCY4hwofHFSmRcOA3Ay3lUbyBDyu7NhavR1UDwEgS8ZINWxNLx51Ovy/8+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 MW6PR11MB8391.namprd11.prod.outlook.com (2603:10b6:303:243::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25; Wed, 10 Apr
 2024 12:08:25 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::301e:5fa8:50a3:3824]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::301e:5fa8:50a3:3824%3]) with mapi id 15.20.7430.045; Wed, 10 Apr 2024
 12:08:25 +0000
Message-ID: <016c5366-f14a-4e47-8588-c8f9724a5704@intel.com>
Date: Wed, 10 Apr 2024 17:38:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [CI 2/2] drm/xe: re-order lmem init check and wait for
 initialization to complete
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>
References: <20240328060257.3690986-1-riana.tauro@intel.com>
 <20240328060257.3690986-3-riana.tauro@intel.com> <ZhRlfCMWT-YkuVB0@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <ZhRlfCMWT-YkuVB0@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0106.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::21) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|MW6PR11MB8391:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QWuasv2i4rIPrtesNP3QwHOe6fu70u7qmYYsFrvwkcppyyRZWHOP0gnqvfiGa/3A6LRImaW/+PVtvmok8hWfT7bl9NaJHSFLEENEog17RbGsd/FOgXkvmiCGrqTOaXrhVT1iONpKl9kylACgf/qt5+okza7Ce3up1nGE55hegRnoySr84G7aLbnQZbOLkpkBrxGgRkVAHtvCV3+ybT6Wv1wEM0FRzWbdLTYXvZq1mICCLR77gzMBkwKyFN4P3WzO1XVrxkDnNWv7sbv44IsqdT8NRhTAXV9mNpXKs6vuhvZsI8XEwy8bU54xiIplnCl03LKfSaxTpoxrNc9O45+Yzo6fMKhW0rEGLRucxflkm+quVsZe4BwhdUQnxcHWLTGVFIXMSxuG2vp9snSPKWs0/rzoYdQV7dYORSm+9tTODg8T1jSNlrjexiDiJvhB1N2x4slifxGlxjxBTZyYg87fFw280ytAIUkADk6OENwmVHQ1Ec/azdgZfdWW4xEFMKf3vfU9NbF3bYm0uZyx81eD1nyb24wb3pe41gy6PVYdQ+49MZYkhAFsl/GMr6kizfxw5wAcfXNYDGToNFZmtjWWKqg+1/39o6WrzMs6P6Tahyb/C2HdzaGnN9GUvW/0VXakxJCV7jynDy+qji18Yuu3jtoJNNdFyy/0iJKSEQa9kR0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0d1WUF2SzEzcVBQUEJYT2M5OGRCT0lJVFkvLzJJYk41dFhkdHNHS2tyQ1hl?=
 =?utf-8?B?eDdIcUtuem10SXNDRTJTcHIrclZGV0JVQTR2Sk1OcllDcWJlNG1SY3k5OFBn?=
 =?utf-8?B?RTBxNEpwVkJTd1dzNEhYaEk3ZVNER0s5OVpBaTM2d0p3T0RRUUFuN3pwRWdQ?=
 =?utf-8?B?aXVON1MvYXJKUzBwNDV1NndmNUxwWnh6RDNGcVY3L1gvVzUzbFNBMGZMTVdk?=
 =?utf-8?B?TUhmN2s5V3JnSmdYbFhxKzRmSjR0eXF4SkN0cmRvTzlRbFlpL2ovS0RIeDJz?=
 =?utf-8?B?U1kzeXJLUmxsemhta05yeHJtdlljQThrcnZoa2N1YkxtcEV6NGllRm9uWTlh?=
 =?utf-8?B?YVBPK2hkZWlUVXhmS1MwUUtFOTJQWHpnS0R4cmdRRnQvZm1jaUR6THdTMUVs?=
 =?utf-8?B?T3dMWFNOeWVmMmlncUpCeFZWM2t6LzM2QzJBYy9sU2dUWmNFQ1ZlTzlXcERv?=
 =?utf-8?B?aC9GOS85a2FTc0lCcWIrMnF4czQzTnlNekRvUjFaaFJzR0tvT3E1UFYwVFIx?=
 =?utf-8?B?UjdZSk1VSUNxK3dEdjdlVkxFa2trY0hCMnRveUhTMFVVRXpPMERiZnBHOEJh?=
 =?utf-8?B?RFdCcnY1WlZGaFZLaXBhS041SUxSaEdkSUNwOGVkbEQ3V2ZCTXhQWXR6a0hB?=
 =?utf-8?B?OHlVbFQyTWNEd3lMTUZIcU95MFlybWl6THcyRHBRdllpdmtYdTVpdWtaNSty?=
 =?utf-8?B?bmszdHRyMEtzMkNVb2tnQ25aWklxT0h3R25Pd215OTYzck9RUWZJNXcyd3d5?=
 =?utf-8?B?bFB6Uk1DT2wvNW54Y2txeHRENkJZbUQ3L0dacXF1ZDV0V2dxWmI5SnZIMy8v?=
 =?utf-8?B?WGVuZ2FRWHJXMU9EdVZwdFU5ZG1NbVk3T21aQXIzQkl0Q3VKUWNCOWE4Yk5z?=
 =?utf-8?B?Y1BrOFJDd0RHcUFaWW1tbDNFYTg0LzBzY1Yyd1lzc2xNTmZvQzBjdUNqWS9D?=
 =?utf-8?B?UUZ1clkzTWwySytHSDI0T3BWVVhJZU5MRHdBazkxbzUxYW8vaExhUFhOakpk?=
 =?utf-8?B?N004TzY2ZkJqZzJJRENkd3NzbmpCSkpDQ0dFVXFlT3hUUkNySVhmbDdmbWI5?=
 =?utf-8?B?U3BVaGN1enpxTUZlQW1GVEh0bXpFY2JkY2cyM2FyamZCQjZidVhkMVR6MUln?=
 =?utf-8?B?SktlVUR6aWVNSkhCZnl0dk9JZGNqWkZCTkplOXFLM2hsbVlPbmVQN3o1c3lt?=
 =?utf-8?B?MmVEbm5ySG1tdXBUT2V5K2hRRHpHbnBiOG9neEpmZjhuYTA1OEoxSjlxd3Y4?=
 =?utf-8?B?L1RVWUM4UTZRbzdHdEtHYVFhRDQ0bVNhb28yd0dHeUJsTVc4MEU3U29rQm9u?=
 =?utf-8?B?R29DSXZDdXRkODk0M0ZrNjcwd3oyT0xvRDdQeFJhT1VXTGZGdTNkd2N1Zm16?=
 =?utf-8?B?R3BlREZQVDgyT1ViYlF4U282YUN5QVNwVGFqVFA1cC9JRWhpNkpnaG5QZGFh?=
 =?utf-8?B?V0dteTZFMlJuc1RPUWdseVRIbVQxQTMyUjN0cGxHWCs4WGVSTjI2SG5ldnFM?=
 =?utf-8?B?aDdPN3d6eGlONktJVXJNb1Bha29Vb3IwWk45aHhIMWVoMXVDUnhEd0hQeVlr?=
 =?utf-8?B?b0M1UkJEMS9wWFh2cE80VmVlVlk0eGhacnRxVDkwdTh5WnJwRzBZRDFRL0Fk?=
 =?utf-8?B?U3IrUmNSZkxoc1JOaUo4MWRlR20xVXFZRzBhL3FVbnNpSXJtemtwc2wvdVhi?=
 =?utf-8?B?dFBZRmpLWW81RUppVnlSNi8zQkJLWVVNWUlnV0o5UWZjb1FDNTVpQnZSYm5h?=
 =?utf-8?B?cmNqaGFSRk1odDNLbSt2R1VlUGZmN0JKZkJ4a3VxaHpmU3JPVSt0ODlxOGZW?=
 =?utf-8?B?NGJITFZWVGZrWmpkVGJWVUZnS2JWcDJNeUg2ZU84SFRyd0wrQmtzQUVCWHVW?=
 =?utf-8?B?NHNVOEVZYndrdzZxQmFCb3FucmhoMklNeUFNMU5OdDFnMTRmZDNKeS8yRzFK?=
 =?utf-8?B?UkJqUWFmTXFjUFdJTEw1ejVySXJKWDUybmZvUEwvdkM2eTMyR2JhaWhONk5S?=
 =?utf-8?B?SGo3RU0wSWpWTnFudGc4MitVTjkvTzJ3QUpoUFo3N2drWFVzdE5NakxFR0dn?=
 =?utf-8?B?WUFhUDhreG5jUEtCYlBsOXgxY21vTTJuRUVUdUgrZUppNUV0QlpxUURWRlFR?=
 =?utf-8?Q?nSulkhf9gLjMNhLliJmCQH68u?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 26af64f9-9126-4695-d1dc-08dc5956ecee
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 12:08:25.8256 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mFAACSZBoJd80JrGWQA+w9Bn73VzCoLsIt+ojuW45kIEe3YaR7I36Ycm5Z0mC1a0CxwkWEZkCP3GsgmC1d2ucQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8391
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



On 4/9/2024 3:15 AM, Rodrigo Vivi wrote:
> On Thu, Mar 28, 2024 at 11:32:57AM +0530, Riana Tauro wrote:
>> Lmem init check should be done only after pcode initialization
>> status is complete. Move lmem init check after pcode status
>> check. Also wait for a short while after pcode status check
>> to allow completion of the task.
>>
>> Failing to do so, can lead to aborting the module load
>> leaving the system unusable. Wait until the lmem initialization
>> is complete within a timeout (60s) or till the user aborts.
>>
>> v2: use bool as return type
>>      re-order the code comment (Rodrigo)
>>      add comment for deferring probe (Himal)
> 
> unfortunately this doesn't apply cleanly anymore.
> Could you please send another version? And wet try to merge it quickly next time.
Hi Rodrigo

Sorry, delayed in asking for the merge. The function name changed.
Resent the patch series after rebase

Thanks
Riana
> 
> Sorry,
> Rodrigo.
> 
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Reviewed-by: Himal Prasad Ghimiray<himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_device.c | 62 +++++++++++++++++++++++++++++++++-
>>   drivers/gpu/drm/xe/xe_mmio.c   | 29 ----------------
>>   2 files changed, 61 insertions(+), 30 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index 69d05e610f03..be60fa5c05fc 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -413,12 +413,68 @@ static int xe_set_dma_info(struct xe_device *xe)
>>   	return err;
>>   }
>>   
>> +static bool verify_lmem_ready(struct xe_gt *gt)
>> +{
>> +	u32 val = xe_mmio_read32(gt, GU_CNTL) & LMEM_INIT;
>> +
>> +	return !!val;
>> +}
>> +
>> +static int wait_for_lmem_ready(struct xe_device *xe)
>> +{
>> +	struct xe_gt *gt = xe_root_mmio_gt(xe);
>> +	unsigned long timeout, start;
>> +
>> +	if (!IS_DGFX(xe))
>> +		return 0;
>> +
>> +	if (IS_SRIOV_VF(xe))
>> +		return 0;
>> +
>> +	if (verify_lmem_ready(gt))
>> +		return 0;
>> +
>> +	drm_dbg(&xe->drm, "Waiting for lmem initialization\n");
>> +
>> +	start = jiffies;
>> +	timeout = start + msecs_to_jiffies(60 * 1000); /* 60 sec! */
>> +
>> +	do {
>> +		if (signal_pending(current))
>> +			return -EINTR;
>> +
>> +		/*
>> +		 * The boot firmware initializes local memory and
>> +		 * assesses its health. If memory training fails,
>> +		 * the punit will have been instructed to keep the GT powered
>> +		 * down.we won't be able to communicate with it
>> +		 *
>> +		 * If the status check is done before punit updates the register,
>> +		 * it can lead to the system being unusable.
>> +		 * use a timeout and defer the probe to prevent this.
>> +		 */
>> +		if (time_after(jiffies, timeout)) {
>> +			drm_dbg(&xe->drm, "lmem not initialized by firmware\n");
>> +			return -EPROBE_DEFER;
>> +		}
>> +
>> +		msleep(20);
>> +
>> +	} while (!verify_lmem_ready(gt));
>> +
>> +	drm_dbg(&xe->drm, "lmem ready after %ums",
>> +		jiffies_to_msecs(jiffies - start));
>> +
>> +	return 0;
>> +}
>> +
>>   /**
>>    * xe_device_probe_early: Device early probe
>>    * @xe: xe device instance
>>    *
>>    * Initialize MMIO resources that don't require any
>> - * knowledge about tile count. Also initialize pcode
>> + * knowledge about tile count. Also initialize pcode and
>> + * check vram initialization on root tile.
>>    *
>>    * Return: 0 on success, error code on failure
>>    */
>> @@ -438,6 +494,10 @@ int xe_device_probe_early(struct xe_device *xe)
>>   	if (err)
>>   		return err;
>>   
>> +	err = wait_for_lmem_ready(xe);
>> +	if (err)
>> +		return err;
>> +
>>   	return 0;
>>   }
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>> index 1de9de4f94b6..06d507998d3c 100644
>> --- a/drivers/gpu/drm/xe/xe_mmio.c
>> +++ b/drivers/gpu/drm/xe/xe_mmio.c
>> @@ -360,30 +360,6 @@ static void mmio_fini(struct drm_device *drm, void *arg)
>>   		iounmap(xe->mem.vram.mapping);
>>   }
>>   
>> -static int xe_verify_lmem_ready(struct xe_device *xe)
>> -{
>> -	struct xe_gt *gt = xe_root_mmio_gt(xe);
>> -
>> -	if (!IS_DGFX(xe))
>> -		return 0;
>> -
>> -	if (IS_SRIOV_VF(xe))
>> -		return 0;
>> -
>> -	/*
>> -	 * The boot firmware initializes local memory and assesses its health.
>> -	 * If memory training fails, the punit will have been instructed to
>> -	 * keep the GT powered down; we won't be able to communicate with it
>> -	 * and we should not continue with driver initialization.
>> -	 */
>> -	if (!(xe_mmio_read32(gt, GU_CNTL) & LMEM_INIT)) {
>> -		drm_err(&xe->drm, "VRAM not initialized by firmware\n");
>> -		return -ENODEV;
>> -	}
>> -
>> -	return 0;
>> -}
>> -
>>   int xe_mmio_init(struct xe_device *xe)
>>   {
>>   	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>> @@ -407,16 +383,11 @@ int xe_mmio_init(struct xe_device *xe)
>>   int xe_mmio_root_tile_init(struct xe_device *xe)
>>   {
>>   	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
>> -	int err;
>>   
>>   	/* Setup first tile; other tiles (if present) will be setup later. */
>>   	root_tile->mmio.size = SZ_16M;
>>   	root_tile->mmio.regs = xe->mmio.regs;
>>   
>> -	err = xe_verify_lmem_ready(xe);
>> -	if (err)
>> -		return err;
>> -
>>   	return 0;
>>   }
>>   
>> -- 
>> 2.40.0
>>
