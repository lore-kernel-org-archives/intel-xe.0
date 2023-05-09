Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A969C7EE22
	for <intel-xe@archiver.kernel.org>; Tue,  9 May 2023 06:33:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2158210E15A;
	Tue,  9 May 2023 06:33:51 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68CE310E15A
 for <intel-xe@lists.freedesktop.org>; Tue,  9 May 2023 06:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683614029; x=1715150029;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=JdwXA4yuuKMlFbRwVIaIeZZQoRK3jpKVJOiPFHQ2K3k=;
 b=nYM90ZmQnc9r545sC7UPGWpsLqCNoU40fUpYL6OrqWAWHF8zVZB+Xbfv
 LuBvQtaQtLobADMHD6T1qI8H08h3L9vpfm+HByll3ItXfzHfG2Jq5SDp6
 gHxWQmMdgV+X/gbEK6SxyzkThQncLqg0JOG18vMEE7X4OMGcmJP+FHlMP
 czbqHF3UQKkI2BPg4C62yEetIqSZdj5aLOwzW47x5xdzpY9IAZ47cxfx5
 fUjXCgRuk0qegOIlj1ES94Xnf0OqF2YCHm5k8uO0npXXjC8Tbk3vJPFNF
 bf7D8sEzVmf/1XLYBkgwvwYuvM5LkS5Wb+FfvzhrGZUw/58ySKqvXufC0 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="329441990"
X-IronPort-AV: E=Sophos;i="5.99,261,1677571200"; d="scan'208";a="329441990"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 23:33:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="649162634"
X-IronPort-AV: E=Sophos;i="5.99,261,1677571200"; d="scan'208";a="649162634"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP; 08 May 2023 23:33:34 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 8 May 2023 23:33:34 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 8 May 2023 23:33:34 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.49) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 8 May 2023 23:33:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=isBPzwJmW+ZuMgT8i3vCOUTjQZBXCPrU6ezUgFC5bxIme9+wcMbRJBPjr3WnIczy002ntpSisNT1018m7Q5FWXArxok/9Bvwx3fT+e1w00EHZJNMxnmlSTwrHGg2iP3p6ipaI8sDLsJrG06UDOqdSd7Gpqlkuh1fTq6wITTilDSxSRTFVJruU3nZekhngjVozrav0qgsw2P+ouoCvChP1gd1v9mx8gujARvREbg0b4MtFK8ERQjMd2Narg/FyKj1s9GXpnbDUb0UM/g6f0fT0trSIbALsGPQFje+Zm6cdw5QTKu/taefuF/0FRqNDR0EARUCU/zbfPAodNJmgRkgBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X+VORNDGDOX8h+p6wOVXnMLsRf38f3v52PBu2P88wZI=;
 b=f2ZUp1sgKkUB2BNVl8LcPIfjkui/LPQkP8qa55HhFFYxHik+XeEHy6hE1OH+r1UHG5W/kPi0eq2EYU7Af6lzpYeliCe3Qayy5cLysebExSzyQG1NgqNHUbJvHpK22M5ge3AsGFUCkIKesO19ME/LsK1OTaJnf5vvfGJ2TftsCSqH2VbN5BK9eQyPkx2tITWxxeTss65+A2iBm41FjmXeBTqN1wH4SWh60zwAAfgW/eh+YsY+htQNAoxDCOmh1C/xbOpLmG8m1Wq0H8qfUF2oMlw47ePq+NOUcqwF7ImTMNYO23PXTkVvcuabi6y22KD1MsKsAgzE+ydlbxguLolomw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by DS0PR11MB7384.namprd11.prod.outlook.com (2603:10b6:8:134::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Tue, 9 May
 2023 06:33:32 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::449e:6409:5bb1:912d]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::449e:6409:5bb1:912d%5]) with mapi id 15.20.6363.032; Tue, 9 May 2023
 06:33:25 +0000
Date: Mon, 8 May 2023 23:33:16 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
Message-ID: <ZFnpLMBkjSlu4HM/@nvishwa1-DESK>
References: <20230509052419.28430-1-niranjana.vishwanathapura@intel.com>
 <20230509052419.28430-2-niranjana.vishwanathapura@intel.com>
 <0a9ebdbf622ae83936ddb7960d86d9998249bba0.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0a9ebdbf622ae83936ddb7960d86d9998249bba0.camel@intel.com>
X-ClientProxiedBy: BY5PR17CA0048.namprd17.prod.outlook.com
 (2603:10b6:a03:167::25) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|DS0PR11MB7384:EE_
X-MS-Office365-Filtering-Correlation-Id: 37be14ba-dc95-4b97-6d10-08db50574aba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: flyGBtIPm6c2umKS6hyXHgf0hx/HpUCQWpS67ugGV9qCbqFTq8jKqozgqvW4dfjGODuN2/hLX1AI+yaXhObNb1XqMb1slFQcaY5Rc76HJFa+Z2CM1GlNK82r3CFxG5JKEnojrFMpNgM6WYiNsnRCCiyIVvEiS2QOPTiYdcxEsse7TuoMCm0Q3rVm8PZ3+HqTD7rKHjt6AyPKZuhJtsviOpAhTlBYjPKTfbAMy2Or4fYd86JWQxQTTqzwDUxde8XVe1RYuDEmDhzFulIne/jVAp/PVvV1ZBZyKhe97dLbC4NfKkFg/8D1jLMMWuuzcikyRLpNuWAv/oiACRWikpOP32xm3eHx2Vjic93g1wKtm+udLPF3fYkEYnqFr2PvrBPS5t0XO4ohOcc/fJL/TiiHJsmE4K02SYjd7ESYJOJ6KKNwFCE4wOlEDpwrbduX61bcYR0HgS0JWNsderS4CFPLOwgQKdu5EN8oNPTReFMJJ0a08klovnnlKTvHB6WpDOYLH5Vn0bisUqDw08NeIovdZ66Z8dGFY3BEvVnNFUZoswKJlchFsaVYsAKX9udVf3Jw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(396003)(136003)(346002)(366004)(376002)(39860400002)(451199021)(83380400001)(6486002)(54906003)(9686003)(6512007)(26005)(478600001)(6506007)(186003)(8676002)(41300700001)(4326008)(66946007)(66476007)(6636002)(6666004)(8936002)(66556008)(316002)(5660300002)(2906002)(6862004)(44832011)(86362001)(38100700002)(33716001)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?v7jPl1UhRha+h/M+iGKVkXWwdPtjZSXONIJJd+LFtpua56AhiI78U5ppD1?=
 =?iso-8859-1?Q?upGaMxnxcWqRYuiJi/QdCaJPXoN8bsbeM9w/SVD1NNZ3fC0N7M3fWj/oWo?=
 =?iso-8859-1?Q?bEAGkDHNKiog3D3EC2oUmTBfjy4v424ypMcNlGY8vnwU01ny4M7Iu32qN5?=
 =?iso-8859-1?Q?U3P2zzRco9+Q869XNlAjQdtsVp062Nj8T5xaztjwqytRlEOpBDXpGUqq2E?=
 =?iso-8859-1?Q?tS8W5XKYteFApYybh4Ic+uItlc50Y3mg6djzSOOvigBN+FEQwiLavRiaAd?=
 =?iso-8859-1?Q?8jYDXbLWHAwScyWKZV0iAGC74RsF8Hi4d1p7iB0HH1slzXGXlKzdQsTDSf?=
 =?iso-8859-1?Q?RntI3oarigIWyhaxCzI7Q6A8WZgSLEh52Fp/WUJKh35CO3L4SkkZryjbWg?=
 =?iso-8859-1?Q?j17Liecva0L+DyMK85GKpsVd0yRJJu0E7NilkqMtYS5baCIiSD6jfNkRI2?=
 =?iso-8859-1?Q?vmRrNnq0J5aDx22XuTrqZnC9b5ZBWWdQvN6e4O4VRUbogti/ZI3qTVxSmz?=
 =?iso-8859-1?Q?8rTIKpiZfkfUKai1lAJ6qyNBAiAXz918+z/aMDnDjmTVOJPDdx3bns2+nX?=
 =?iso-8859-1?Q?z5bHFQIG3mmTjgWe7pbG4gqD6Rlyte24mknVTO29EVubVw0nGUNXLdzh0o?=
 =?iso-8859-1?Q?7gAGxGu2M2wqtgFqwx5i9aFdO03I9IHCEKsFggSfAkoLBGAPvF01ENhuW2?=
 =?iso-8859-1?Q?PFh5ejrK2IZl3vh431w3NrPPMoGuRfxslF0wsQ35fOgCrGrdqN9CEV/0uP?=
 =?iso-8859-1?Q?B15ZcVvZ1GQbjGJeaWGMbnlBYqdV0YWeaijB52Qf97IAqk28puTl9Lz9ds?=
 =?iso-8859-1?Q?aS0NwBRAurLwCOCwW4vED8xOaTH/iX5YgauJo0jC7LtOysolrXctc1hQ6B?=
 =?iso-8859-1?Q?8jH718z1fWBmI416/2j3vm6dBGJBOkyZ9C3gSH/jQ06HAt0n4Cgv+lhEjg?=
 =?iso-8859-1?Q?a40BcQpm2if/uIW69n0pz37H16msCVnLwMZbrmx3Sxo+ktGq5yc36P4cBA?=
 =?iso-8859-1?Q?ICtQG/LTSOpdvhkr8mIGwaFgQLpMkjBlRLLDN8Ki63ni6o99sfote95bxp?=
 =?iso-8859-1?Q?hesjvEjKwQnL1tTSHRMhYTZ3GBpKLBv1qJJR78nMOPrusQLeNDHgsBI1xO?=
 =?iso-8859-1?Q?xuxSdBiVAcnJTEGFVPgSCf48etqDmW/WIJ3mrSIFtMfFX/yIzRebnpE7Nv?=
 =?iso-8859-1?Q?bmooJXXQ4kwyzAeracv+BOK+ynj2NsqO0GBhIPrRO8GhRjm/eYX+AnX2l/?=
 =?iso-8859-1?Q?fNFcYk+4dRaV+8GQ218am5/QUefnjrs+2rdoe9L8QfAoT6MutaMOphf0x2?=
 =?iso-8859-1?Q?dLWDBjHhinS8Xl/GsBwJUQCoDNr1WeNvhuw687Q1h/Rug7J8V8jgV4EVad?=
 =?iso-8859-1?Q?2EhYVgYoU8Io5/D4iqJHEyajNTp4kxsJX8QmV+Uen5ZBEw6gmJ48YVvrce?=
 =?iso-8859-1?Q?MPRT0tK8mcJW+avBi734YXMPLY5fQvHvglefWfRzVcc3YJmjdBcynjAxiw?=
 =?iso-8859-1?Q?S7LyZ/9TZQrtVFVEBs7BGA2kHqrLb8Ka3lL/LMqDnWc1mjXE8Fb4lZr0Un?=
 =?iso-8859-1?Q?TbBJdkpxIQwi2oV/d62sgEAzjjKXqgEC31AoZGWdku+87+m/znxo3MECAP?=
 =?iso-8859-1?Q?HwP3YXGn2VujjYCbdGTWegbW4e6hd+f39gZDAsUBb0n3QII4dhiGTSxze3?=
 =?iso-8859-1?Q?bKc0QylnJZ3hJezS6Mk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 37be14ba-dc95-4b97-6d10-08db50574aba
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 06:33:25.1982 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OOLNIOhZtGcFJhzACu+M2ewKi0Ua79XuDH7J4VJVWPrXqRZo+KYBEARIL5WjndBKBE0bipkQfilENdgaTNuskanCF57iB35fOjacoKF576yticoNinzcnbG3/zPqqsJb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7384
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: Handle -EDEADLK case in preempt
 worker
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, May 08, 2023 at 10:46:48PM -0700, Hellstrom, Thomas wrote:
>On Mon, 2023-05-08 at 22:24 -0700, Niranjana Vishwanathapura wrote:
>> With multiple active VMs, under memory pressure, it is possible that
>> ttm_bo_validate() run into -EDEADLK in ttm_mem_evict_wait_busy() and
>> return -ENOMEM.
>>
>> Until ttm properly handles locking in such scenarios, best thing the
>> driver can do is unwind the lock and retry.
>>
>> Update preempt worker to retry validating BOs with a timeout upon
>> -ENOMEM and while at it, apply the timeout for retries upon -EAGAIN
>> as well.
>>
>> Signed-off-by: Niranjana Vishwanathapura
>> <niranjana.vishwanathapura@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_vm.c | 25 ++++++++++++++++++++++---
>>  1 file changed, 22 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index 91576cec000d..d92c9f659ab3 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -10,6 +10,7 @@
>>  #include <drm/ttm/ttm_execbuf_util.h>
>>  #include <drm/ttm/ttm_tt.h>
>>  #include <drm/xe_drm.h>
>> +#include <linux/delay.h>
>>  #include <linux/kthread.h>
>>  #include <linux/mm.h>
>>  #include <linux/swap.h>
>> @@ -508,6 +509,8 @@ void xe_vm_unlock_dma_resv(struct xe_vm *vm,
>>                 kvfree(tv);
>>  }
>>  
>> +#define XE_VM_REBIND_RETRY_TIMEOUT_MS 1000
>> +
>>  static void preempt_rebind_work_func(struct work_struct *w)
>>  {
>>         struct xe_vm *vm = container_of(w, struct xe_vm,
>> preempt.rebind_work);
>> @@ -519,6 +522,7 @@ static void preempt_rebind_work_func(struct
>> work_struct *w)
>>         struct dma_fence *rebind_fence;
>>         unsigned int fence_count = 0;
>>         LIST_HEAD(preempt_fences);
>> +       ktime_t end = 0;
>>         int err;
>>         long wait;
>>         int __maybe_unused tries = 0;
>> @@ -633,9 +637,24 @@ static void preempt_rebind_work_func(struct
>> work_struct *w)
>>  out_unlock:
>>         xe_vm_unlock_dma_resv(vm, tv_onstack, tv, &ww, &objs);
>>  out_unlock_outer:
>> -       if (err == -EAGAIN) {
>> -               trace_xe_vm_rebind_worker_retry(vm);
>> -               goto retry;
>> +       /*
>> +        * With multiple active VMs, under memory pressure, it is
>> possible that
>> +        * ttm_bo_validate() run into -EDEADLK and in such case
>> returns -ENOMEM.
>> +        * Until ttm properly handles locking in such scenarios, best
>> thing the
>> +        * driver can do is retry with a timeout. Apply timeout for
>> retries upon
>> +        * -EAGAIN as well instead of indefinitely retrying. Killing
>> the VM or
>> +        * putting it in error state after timeout or other error
>> scenarios is
>> +        * still TBD.
>> +        */
>> +       if ((err == -EAGAIN) || (err == -ENOMEM)) {
>
>We should not timeout for userptr -EAGAIN, see previous mail.
>Otherwise LGTM.

Ok, will leave -EAGAIN as is.

Niranjana

>
>> +               ktime_t cur = ktime_get();
>> +
>> +               end = end ? : ktime_add_ms(cur,
>> XE_VM_REBIND_RETRY_TIMEOUT_MS);
>> +               if (ktime_before(cur, end)) {
>> +                       msleep(20);
>> +                       trace_xe_vm_rebind_worker_retry(vm);
>> +                       goto retry;
>> +               }
>>         }
>>         up_write(&vm->lock);
>>  
>
