Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4342C77B7C
	for <intel-xe@archiver.kernel.org>; Tue,  9 May 2023 05:23:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 833A610E22B;
	Tue,  9 May 2023 05:23:26 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 602B110E22B
 for <intel-xe@lists.freedesktop.org>; Tue,  9 May 2023 05:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683609805; x=1715145805;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=I1/ZmV3ySqRWJZFX4XXYjjz6vsIKtCqmVXznWHbFN6I=;
 b=TL8UZcO2xowTuAJQN9JvtJrSzWyjuzAZRdEvqLpItXYhqrZRX4wvxbZF
 A4uWph138gbTD7Bf8rXAKbovqgI766Nj2FVONCRTnPTQopRgzTOe9a6X3
 fPbBfNX/F0LIyU/04dqGAxIwKqGQkmEf8w+OK1eb8ku6h/hU06RQLQz2n
 CCFuGUGwJM9Rn2KiintxQY1/+pCXCHXrXKLX+hlSWUfpNxtkQS0ZL7OnA
 wXmRsewQgXblaGbL/K1A+gsqXL65QIrt4zlMbnDl7n7LrjaHRJjnYfUHU
 RiVHR2ReDmb+uaLI7ipFATmQlyQpijg+f7Y3YwKPjYiz7mGWECg2MLxBg w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="329433654"
X-IronPort-AV: E=Sophos;i="5.99,261,1677571200"; d="scan'208";a="329433654"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 22:23:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="692839129"
X-IronPort-AV: E=Sophos;i="5.99,261,1677571200"; d="scan'208";a="692839129"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP; 08 May 2023 22:23:24 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 8 May 2023 22:23:23 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 8 May 2023 22:23:23 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.105)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 8 May 2023 22:23:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jygRVifk8QJrMWRVaOJHU6MiggNDgqaWqNFRP+DMUdutTNB/lpNABuwKvyp8qBHxXHtod2+iLkmgu7hBzIoSRCmgDZy+dy/Ml4621L55q6tqihFiG7C6M4/Oy96dxrbkVGrNkq2Rn07whxRXJNjoi33pZ0+qwS7TKtpnxHin32apqqbyoxnvndiHdEhqzhrNFf4uR7zumaYTqX09CJyaDK/p9wZ4btz/QVRPXHFZ4Dh9vlpLbc31dTW1xXvOHhy48OF2cS3XHj3Hzj4mB4eMXvbqR7cdYu7UmgFOoWbl1n1u52tmCeGyHaHRvpoNyIk8mTN9awYKfAYH3Ki38cxg9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nv6HvbtrSbnp1zWFI0L2kCsXnsTdeEUGOssUI27ZnWA=;
 b=eG71MeRuFaF8vt21BMpBeaqX3wPqx21bSPlMaq0niWznVsaxhbghnFle7Lj5bBqmBJ+cRtfOA1rSFelAjyqXsQYk0ZFIlo+MKPoTT6hqglRyf4k57qLtFSK0+cFVYB/l7XbCDgLpoXw7qPeh5BBsUvwVlqFyIfW4r52HyOqIvp21ENO5UC7pHmax0acTUTbZvqjhDyCxLPwctoQzn8WHopIatG5KNCvwHBzBwzexOHt8QHu9oWCjMM1+OWu8H0DqisEuAmEX91rissTgCD1LLaY0Woxdnp+4TnRVLFkkKQvlIdrL52epX7mDF+ZgGLDAqd3A0SfXgfx2uViwyrxsBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by DM4PR11MB6017.namprd11.prod.outlook.com (2603:10b6:8:5c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Tue, 9 May
 2023 05:23:16 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::449e:6409:5bb1:912d]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::449e:6409:5bb1:912d%5]) with mapi id 15.20.6363.032; Tue, 9 May 2023
 05:23:16 +0000
Date: Mon, 8 May 2023 22:23:12 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <ZFnYwKb5M0xuuhwJ@nvishwa1-DESK>
References: <20230508062730.1509-1-niranjana.vishwanathapura@intel.com>
 <ZFl5Cp4qc0AXQgD3@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZFl5Cp4qc0AXQgD3@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: SJ0PR03CA0230.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::25) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|DM4PR11MB6017:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bd1034b-eb13-4773-343b-08db504d7de5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4CEx1VspSw4dmYd9GKU2X8zNyLR4P5QaPd0RcP+rBlV89Vzb+009lgZTV6+KtoJcpFh4fhpAn41RsPdbWJI07bGJyd3EeGOTanH7HSh/6xuOuqsdZR+530YaT5tow1P5cTjhGn+OiLsrYFsTEH2dcM3lw/eUVrgRN4bWLny8+SObkFB02bYuZC8ALzExp20SrAhbQJ1qHdMON8A0ce8DE/V/dRvISpVv8QbNEbx/Hg/bbgG6V3bw7J5ijtHZnW4FCCXIsPDY6HNFmrd2WlV1vFG+MNszn9jEzfz2iJjhuiQEd6gQ7pHPGp2OiHQYwoxtIrc0nckTcksZwY1gEoJD9hp3d0yrEOLoZi9bekdfcS8zJSduHOkDr4kDKNQ9F3R6Q9lrcT3TEzvPeWzqSlZrzRx08JFxLAGjPSpIXLwtSi1AjsWn0L7PxnIl2X+DQol9bBWM5QktQkpH/8TTUGdjRMXHg/Bx/IOlsDtojRZdkJYcv/NU1ZVgjenex3B2AVDHziClkQE4z09kUSCsapxC+dZBMbX6CrgaheRRfyUdRbR2Gr+F6JZTzxSbEmsAoS+p
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(39860400002)(136003)(346002)(376002)(396003)(366004)(451199021)(2906002)(6862004)(41300700001)(478600001)(316002)(8676002)(8936002)(44832011)(6666004)(4326008)(66946007)(66476007)(5660300002)(66556008)(6636002)(6486002)(9686003)(6512007)(6506007)(26005)(186003)(33716001)(82960400001)(38100700002)(83380400001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3ilsLoGlwxsD2KwN2MW3NLIoJyHZoqadIUkaT+TPGU+KJpnpzP6h1pi7T8S8?=
 =?us-ascii?Q?fTZYJH7DN6Oo/Xo2XAqnE+ZAlfSruwN+vevAxS7GuNph+l3JBNSq74ZRS8HB?=
 =?us-ascii?Q?bcM6GqDxx5rCY5c+OcOrqtwuDlpK0CqrCYtfF+md+q1gQApLAtpOWAo7vtW3?=
 =?us-ascii?Q?vDJQq5rU8CnQNTv6eo56vqvarsgq4rokDDuTO78UV/c/TE0j4uDds07JD8QV?=
 =?us-ascii?Q?1biYsXzhODzusbkI1hODCoyLmCxp57jVH3RddwKaJcYWkJkHw4KP/PDCRPc1?=
 =?us-ascii?Q?ORMydv8tKv8p6MQmC7FSeLPlHLkBLVGmAuJ2sN6Ju0q9i5405pPj/V1uiTZt?=
 =?us-ascii?Q?wnDuztGANWNj6BNzF65FM7Lvo2RfEhMPUDL//h6YZRgK5uyK5lj/XfUsWwJv?=
 =?us-ascii?Q?ZvpWFiMUfi7Kx2fjKmL5uv1Lcj+vlGTIazbATiSWQEjlHRrkx2GqEbD1+XyZ?=
 =?us-ascii?Q?ctAaX6Ki5Z58qOl1ElsCpK7ekk7r2KCxmRX8XJQY6pcdApwcYFzPeTRpSCpZ?=
 =?us-ascii?Q?6z9X19x8AcHOs5qCpBDk1vOHuFg7ZoVku8i7P7cYocyi9YqWjvSDLwOf3443?=
 =?us-ascii?Q?K0orJjORm65DB8LbnKqZ9uYgHxXxHmMgttyT18up3izUHx/5LLk7hNwaQPZb?=
 =?us-ascii?Q?FjjsfBxKP/x3+KlC46rj2WZwizUGho+j2h1izskpkzwpvTGOmcmjFlPKqYb+?=
 =?us-ascii?Q?gp+KG8nCrSpOAAkLv3czEmmFyBqpjkLjpxQ+ah6BM1KZYfYQnBc+UZ32MlBG?=
 =?us-ascii?Q?GgAEwURUgiqe72xa3NbF+wugCYazjc6THLgob4igaJDZFEKjSAw9R7M54MvK?=
 =?us-ascii?Q?T9XXgEBoGVnEEubWEzU0MmuLb0h1Gu4xlARRZ05n0N+jA+bri5W3biwunYhI?=
 =?us-ascii?Q?+lmpPHs//tdYBxAkzirNO+YQ77DLGNmps2YbXi+znQlBrHiQozd9CeHTxbj0?=
 =?us-ascii?Q?QXPEiXFi1MJRkeV1Qg90S6m7doLLi6KJNqvxmheT8QBRfpP///Jk6Hovwnio?=
 =?us-ascii?Q?o+jLYmJu1um0Vtfy+9XjTx9+B5M09Ncrgtet9afJOnI1Um56smmaluAwajyR?=
 =?us-ascii?Q?s3BFbvLm6BypwKdbFfmcKB+CA/EkBgB9/nPlESUitPdn5GSl8YtD0P740hN4?=
 =?us-ascii?Q?M8VKqg0MTGTohCcotSrp2Zdk6M6GZOQNhFL1jl6Qj/WlGHyeMZyeBuWC81Us?=
 =?us-ascii?Q?PcC1RrfedjVUGCvEIBV71Vvdp64exlXq8MKNmn8SqrBBCa3T5CSswzR4C/Xs?=
 =?us-ascii?Q?uChX8f5qpYwfJsaI3F7ti67lFLIVMcy/kBexriz+Fym2zhw05J+/QUkXdWn+?=
 =?us-ascii?Q?MfsQNLsueIxkMiAVqps6CBBbWg0B1yKGdO8ncZDiv2Yiszivm+VO70wmtGTi?=
 =?us-ascii?Q?UiA7OE50vm8Qs3KdU3CLVcMZR5NcF/m1mIkC81tYwZ89Jx2NK2/Pzyi1IJIT?=
 =?us-ascii?Q?fhWk8h+FP5aLZfVaqG9uxkQEi8h2JhwF4WhWUMDcb2OzMpxiLxgMfYwXoPOE?=
 =?us-ascii?Q?q8PsxcH6hsnv3B3GwyD+xDaWFnEZg16V47ZAmGB+YjFLLKTbKCWp6f2kKhyi?=
 =?us-ascii?Q?1paxUwi/bKhanw0ZKPgPpMYLsKYxVJxUpOlpRHpTC+u8PCFDAHLmO6kdvvC9?=
 =?us-ascii?Q?ig3R7GoaOUrcGCJR3FHfgDw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bd1034b-eb13-4773-343b-08db504d7de5
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 05:23:16.0667 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1OzpKlPhTVmBESl9YKSSHE+t9OG/ZtYJtAlhDUnROn/KvRy3Drbag1PIwwaJ+TKB26XLQvNn4qG9CIc3W5RYRVxsHLCm3lS/2Y4ko90RCALy+poIPXfaRm0agxIyovE3
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

On Mon, May 08, 2023 at 10:34:50PM +0000, Matthew Brost wrote:
>On Sun, May 07, 2023 at 11:27:30PM -0700, Niranjana Vishwanathapura wrote:
>> With multiple active VMs, under memory pressure, it is possible that
>> ttm_bo_validate() run into -EDEADLK in ttm_mem_evict_wait_busy() and
>> return -ENOMEM.
>>
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
>
>I'd combine this timer with the userptr case too (-EAGAIN) above as that
>can livelock too, hopefully Thomas agrees? Let's get his opinion on this
>too.
>

Ok thanks, Yah, probably not a good idea to indefinitely retry.
Will apply retry timeout for -EAGAIN also.

Niranjana

>Matt
>
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
