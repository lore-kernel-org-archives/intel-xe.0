Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8BADC77B75
	for <intel-xe@archiver.kernel.org>; Tue,  9 May 2023 05:23:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A964510E22B;
	Tue,  9 May 2023 05:23:58 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 873E810E22B
 for <intel-xe@lists.freedesktop.org>; Tue,  9 May 2023 05:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683609836; x=1715145836;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=uqa86oKlT0bFBHUM1M6oJevD16eYqOoz5uvUnbNjnAo=;
 b=AYBLMaHD3jQ7tC7Hpv447xuxXqVEMP3FwBlRYHK3HcnyfaAp55P+lFS7
 Y0fhA52q/Hw44KtnROzQQW4GEjyrWRafwS0pAF7MwKZu2a4cBg0FNH2E1
 uA0EEASlGj6CwJuqg9BkJYJ6srQu9hBNA5tbs3kISWy5wwsuIuUjhCSmU
 K6uEA2iYp8t1MPU8M2mPCr/+MYskp7DQsx71NiKyiGEvYmSBOrhcWbALI
 eJ0JXt46ycXI5kZwSf5tHJ+wcQ6Mqh9D9Szp4IaDfHdx3fe+7LlDnyAo+
 v6mz6NsSR2/hoBmwgcQRzScb8EynTwHn1saBRjb4sBuKW8sJvi67z18Iq Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="329433706"
X-IronPort-AV: E=Sophos;i="5.99,261,1677571200"; d="scan'208";a="329433706"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 22:23:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="692839172"
X-IronPort-AV: E=Sophos;i="5.99,261,1677571200"; d="scan'208";a="692839172"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP; 08 May 2023 22:23:55 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 8 May 2023 22:23:55 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 8 May 2023 22:23:55 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 8 May 2023 22:23:55 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.105)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 8 May 2023 22:23:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I1SX1QoYD1ndriAGP6m03XgfmJdZR/vNImvqLMGmq9cg0AOY56bZKX2WK8gep0g8JHmQma7OwYlN/yiX0LbBT3W1Nhkua50JrcDw9zFz9ihU69C5w9g3UA0f+7JEvLLh7zMh1eKQ7mAJ29gk5UHP9qwFMIJwUO5SQMOCeTZ4OkjDtYenn3BHandZwurZUTM89Nh1WLN1bmBGoSa+xeIXpDF0kREO1kJakMDSlJIwJ7uKfaA4aKBW/ACSPJryRgZl1Juv3zCzxT0v5xSF9IPFl+dSVHu5Y7tb2sH5qVSC6P9UFPgKNlI0zgQc0Q2DB4jaqr3qrFlokVicht9tovSihg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JaxYV2FWpoqpIN6JSNP3YWip6yXBzDyqJOsIW9Im1Zg=;
 b=eX6ySPz4QR9qIrX3Iiv7JX/ATosz0W/uR+SajEaJ7tYXrEgtMtbuw/nP/5nCx+wl00eVfUap31NIKgwCkTBOTXBVL6c0yfcZk/WdiDMuRa8qKPcfveR94QTweBWT9dgfvR/yuxS7uPANatyh+mL5mRwyeaQ2XchifP/WAU9cJYx5M36ig7Dpu627jjvSiy5y4yOPsQBABBy3VwUeUc9FzV2IsbbApuoY52kB0AwPgjF6Q8y5RyIVr/8OywoGaZOpJkOGcALf7w5Ae0vjVhvld1YZ1tmemxX/MG04oNxkNWnVOD7YklFPK+Zi+T8j1Zz81QDiY4T+CKUC8xrAJ/1qsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by DM4PR11MB6017.namprd11.prod.outlook.com (2603:10b6:8:5c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Tue, 9 May
 2023 05:23:48 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::449e:6409:5bb1:912d]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::449e:6409:5bb1:912d%5]) with mapi id 15.20.6363.032; Tue, 9 May 2023
 05:23:48 +0000
Date: Mon, 8 May 2023 22:23:45 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <ZFnY4aV8osrrtgyr@nvishwa1-DESK>
References: <20230508062730.1509-1-niranjana.vishwanathapura@intel.com>
 <ZFmQQB/6TKJoOf7V@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZFmQQB/6TKJoOf7V@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: SJ0PR03CA0299.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::34) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|DM4PR11MB6017:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f7a3b76-ef6e-46ea-5b75-08db504d9111
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FfFo6IBmg1Ph8UL4TaoGRg4xyG4QxcScrIxUvvmZbqrbMge9l9lH77cH+CiuVf2HTFMjq22ZgAZ+ki1+wQqR03fjNMsxeI6rDICYiKOxC1sOKN6dAF2eiYuCpCgN+WV2uPVeZowpmZJPWeLcc3ZWIMu1AvFCXVF29HI2Tfu4fSeHoslh56HO389qIhOeMmj9loZIF8NmOehiPvDY9ocvL6VdVU/jijbPvFmDo7dByfR/X4q8r0PdkMgIFHFr2MNjBoBLWdfevgcnUn9rOLhPFs6Ka81U80HMHlO9gnwuum1IHVZkTxYUsSOi6J+rIZXnPcX5gILaZ0XL8Oa7MIhNiPAw+PB/yIa3cSCmY09up6cg8JsyRppIXZfzd7ZD99B1s4gd5kqDch4JiaV6211UdtzetW9W9JLvDV0Ztlpg5h1x4xUFnljDLYfaAlTorpZOC+yVo+BkN07WXsexBwfKOyG1izpFJNnYgDdJRDM8AI+GL9IGdVPlMGgHhLeGsrsAvUewdewmvG1Tzsej4ah0FXizmfVDvLvwBamtkBx1JUDqwf012YCtNLFAczvGRhhe
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(39860400002)(136003)(346002)(376002)(396003)(366004)(451199021)(2906002)(6862004)(41300700001)(478600001)(316002)(8676002)(8936002)(44832011)(6666004)(4326008)(66946007)(66476007)(5660300002)(66556008)(6636002)(6486002)(9686003)(6512007)(6506007)(26005)(186003)(33716001)(82960400001)(38100700002)(83380400001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?d4y8waA37i6QaL3MlFxbZsxOWUb8So9DdQFbCrMERSsez1Zso5Lo6AqvHEw6?=
 =?us-ascii?Q?LUgiqkIA+fTRkVxwlf9E4QT7F/q4HEN9Jy8ghFPYhEan3InAt+0WVqFCblZZ?=
 =?us-ascii?Q?h/TZVKVKmLJviYJUr/jg9aL85ANa3Gtwi/6+UNLnx1GOSDZqKYJQAvUeg22K?=
 =?us-ascii?Q?KTKcgb0MNa4RhaJLTojp9KljgfThrvacvxgieoRbxhfPV6Mepzc8VvpCfGP4?=
 =?us-ascii?Q?nFYRKNeQucyO58ioWm7YKJfsuVM/O8Gukay5pfZYfOQN1g8kALFgqHDKkRpI?=
 =?us-ascii?Q?otO7z3xtVyWXhOw9lwNY1+HgkVGRl6d6lELGddwpI6aMAosNQHfIBJdU1Exh?=
 =?us-ascii?Q?1NHjn6GhQXYg6m7Fm9ui9wvRhag0KBQcesn0px7D1d28L1coy2BXUlPBRdn6?=
 =?us-ascii?Q?jvmM5Q7D5FJlnow60PuEUuoeVYlLFN0jF9dyh9OxO7ZjXHOLdwKZV7RrA4x8?=
 =?us-ascii?Q?xyHVnkr68NGowyaGscHlADtPvKLSx96wADxyg2NFp5qPQlopSTz697prHhQ2?=
 =?us-ascii?Q?qssa4SIGD/51os3HOJ4EEjmqCs4QwlmdfUDpzmA3+v6rej9m/MDhyAPfbdUe?=
 =?us-ascii?Q?Um60gAGykyffABF5mKTQ/LnEGfi94HzzPeNH224fIZF1qdLUl+g/9EwIG35d?=
 =?us-ascii?Q?YSVkuNN1nI/Vof56orRzwAnpCAk59nDqCeiNuQuB0KRI9+hR87IiTrbebEGT?=
 =?us-ascii?Q?oB1HjOWIkr6J/1DcFf5q8qbOnh3LzwpmgpKc3cnjJlkJvo9TSHXDtnVd7zwK?=
 =?us-ascii?Q?i/D1ZjmvkSeVYyQ1rXf5F+su91p8ODMVVd7mE7fwF0Sp0oBcYXpV8CHV1lV1?=
 =?us-ascii?Q?pfVBcWWudWjlX73JKbBWt6kvnQN+9QsvtGaARa5ExBPM+HUMOYcZd3WzrqDD?=
 =?us-ascii?Q?u1q31D/xOCpAeTiD1TmgyC3Whu0sQNo+2R2SdtPqinUpEBIzs2LhLQf0ybic?=
 =?us-ascii?Q?MpYDWkFd7FeLWZdLPoDbfj4Wp3wRAvnZJ+aVJDETxuoJCc3Ryp73cPwLbgOT?=
 =?us-ascii?Q?ijPAaTXrnVQHj26SaguvoiaN5aBgtH6U+fL83xb/1/K8WiHQBLhbhLBDkpKx?=
 =?us-ascii?Q?7v50zXM7+yG/CzGq+CuMe9KUwjBkHeEjH137oIlU1pOrL+q4ClXW5fN8HZuT?=
 =?us-ascii?Q?8t9W0FcEDQAqul/BTkuWYolI45Frk530gmywVL/iXihWhV5rXip/+BPFsSF3?=
 =?us-ascii?Q?AMvYw/KQ4sKG15ZhBgJ311v6WQo7KUIH+wiNNShUzCrpYAdpaQCweTEV34HX?=
 =?us-ascii?Q?WJgEZhdoAiCzZI21YpB046v2pZwJ1phhflkhNIkCIugNwC/jqMaHeXDJY802?=
 =?us-ascii?Q?9BZRKvkibGus1kuY9i8XufbAoLKNQwVctMZr81zcZAmBINsCAg2H5j2TYTbA?=
 =?us-ascii?Q?c/jJ7AVofkesb1W8mVa8hB0jEhsqDGoQ3IsmyL4xGmu+hzhdCpA+fRegFgjt?=
 =?us-ascii?Q?vwDZHUuk+EB4/x5I1uwc4c4Z0yNISA84Gz+rQhdg4WRR83Gbn6oEZSkgcLgF?=
 =?us-ascii?Q?82HEYCL9vUlr25f2rZR8cDXyid2Sd5f9oYIrUq27kroc2BVepE1A+gyqU6EF?=
 =?us-ascii?Q?Oe/Pgd+6HIfR9AKVQD+SAESfhH141NJy2ETX8byX0DQ0yA8LJnjeqcUMJ9PN?=
 =?us-ascii?Q?nv24+6b8pfS6nIP4jRDtZRU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f7a3b76-ef6e-46ea-5b75-08db504d9111
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 05:23:48.1104 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3A9oKJ+dLLDsunmy0CLQf1GoRkFgOBQBZvWGhntXuU2rRhFuxwj7lAA8SSWVNYsnqAaydgJnNmhb8NXf9cnoQlin4STh1CzSCi97IfOMJNufQOZRr/WQvxYOYWIIp+Ol
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6017
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC] drm/xe: Handle -EDEADLK case in preempt worker
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
Cc: thomas.hellstrom@intel.com, intel-xe@lists.freedesktop.org,
 christian.koenig@amd.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, May 09, 2023 at 12:13:52AM +0000, Matthew Brost wrote:
>On Sun, May 07, 2023 at 11:27:30PM -0700, Niranjana Vishwanathapura wrote:
>> With multiple active VMs, under memory pressure, it is possible that
>> ttm_bo_validate() run into -EDEADLK in ttm_mem_evict_wait_busy() and
>> return -ENOMEM.
>>
>
>We have the same condition in exec IOCTL, let's do the solution that we
>on land here (preempt rebind worker) there (exec IOCTL).
>

Ok, will add.

Niranjana

>Matt
>
>> Until ttm properly handles locking in such scenarios, best thing the
>> driver can do is unwind the lock and retry.
>>
>> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_vm.c | 18 ++++++++++++++++++
>>  1 file changed, 18 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index 91576cec000d..df1214f00a06 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -10,6 +10,7 @@
>>  #include <drm/ttm/ttm_execbuf_util.h>
>>  #include <drm/ttm/ttm_tt.h>
>>  #include <drm/xe_drm.h>
>> +#include <linux/delay.h>
>>  #include <linux/kthread.h>
>>  #include <linux/mm.h>
>>  #include <linux/swap.h>
>> @@ -508,11 +509,15 @@ void xe_vm_unlock_dma_resv(struct xe_vm *vm,
>>  		kvfree(tv);
>>  }
>>
>> +#define XE_VM_REBIND_RETRY_TIMEOUT_MS 1000
>> +
>>  static void preempt_rebind_work_func(struct work_struct *w)
>>  {
>>  	struct xe_vm *vm = container_of(w, struct xe_vm, preempt.rebind_work);
>>  	struct xe_vma *vma;
>>  	struct ttm_validate_buffer tv_onstack[XE_ONSTACK_TV];
>> +	const ktime_t retry_end = ktime_add_ms(ktime_get(),
>> +					       XE_VM_REBIND_RETRY_TIMEOUT_MS);
>>  	struct ttm_validate_buffer *tv;
>>  	struct ww_acquire_ctx ww;
>>  	struct list_head objs;
>> @@ -637,6 +642,19 @@ static void preempt_rebind_work_func(struct work_struct *w)
>>  		trace_xe_vm_rebind_worker_retry(vm);
>>  		goto retry;
>>  	}
>> +
>> +	/*
>> +	 * With multiple active VMs, under memory pressure, it is possible that
>> +	 * ttm_bo_validate() run into -EDEADLK and in such case returns -ENOMEM.
>> +	 * Until ttm properly handles locking in such scenarios, best thing the
>> +	 * driver can do is retry with a timeout. Killing the VM or putting it
>> +	 * in error state after timeout or other error scenarios is still TBD.
>> +	 */
>> +	if ((err == -ENOMEM) && ktime_before(ktime_get(), retry_end)) {
>> +		msleep(20);
>> +		trace_xe_vm_rebind_worker_retry(vm);
>> +		goto retry;
>> +	}
>>  	up_write(&vm->lock);
>>
>>  	free_preempt_fences(&preempt_fences);
>> --
>> 2.21.0.rc0.32.g243a4c7e27
>>
