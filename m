Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA2DBC77B7C
	for <intel-xe@archiver.kernel.org>; Tue,  9 May 2023 05:21:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 844F910E22B;
	Tue,  9 May 2023 05:21:57 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A91010E22B
 for <intel-xe@lists.freedesktop.org>; Tue,  9 May 2023 05:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683609715; x=1715145715;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=EneMMoqgR6zQMYq9ruDkzgHAC1bKRYkSnf7acuE3MM8=;
 b=aHXl50vmn/nnGMHpTQMf1m1jhLZ21MJhwE5MPGHhuf7hicVIDZfB9SqF
 Ux7FmSqCbSnjEXM5Q0cvxGHvnAU8nZHpEUI2MZMa13kac0toltG/5YJpO
 dylO3UqZr9QZlxsDxXNqvpx6S10pMZWdKIAvdOlAANPT8agbXZI66h0xJ
 UdHDZMIdt08SePN/Lfxv21HIBklAOcHd6SKYq4m0AuieyptPuc617ccYF
 WNkxIjW5BqQlIHBUy5k9WmckfG+0fbsHnjpd9FQNONtJWPuF8NM6r70T1
 fjPd8/IfU8KllItcwdzdik41XvmaTS6i5D852A2vtWwU4nFgAaFH+UMdB w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="415376678"
X-IronPort-AV: E=Sophos;i="5.99,261,1677571200"; d="scan'208";a="415376678"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 22:21:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="763676203"
X-IronPort-AV: E=Sophos;i="5.99,261,1677571200"; d="scan'208";a="763676203"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga008.fm.intel.com with ESMTP; 08 May 2023 22:21:53 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 8 May 2023 22:21:53 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 8 May 2023 22:21:53 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.106)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 8 May 2023 22:21:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hE7kihN3OhndqjBg2nPehzn5W4xX6/vnreep0pkAhRal04MMK6G8ejFEjbWEY/sReXiHH2vP3gfHhxEUpCUd6KK2y1Ib5I6fxml1+2w9RyT0O8UkTckRRr0x4kAC2F3ebqMpASn4yK3L31Hc7l96y2R0sX+/hiN9TB/aGhGxI+08JnUBVGP5ARe1okIdhwifN+Va9BeYGL+tIfvux2hILj3gKTZ3u+2gLkUHs5m9LykAHkzuZAWCAutowyBON7b0CB2GppCkHcSwWW/S9Xy7RGN3+vpGPJI/gnCUVdQHt41e3VwrMm3sbtWUnnK8LXW9QCq2QP69ywiorIyX3UzYfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tAzO3uLU88eYYml50bV+CjWuvKA3yq9wirrNyExGVIs=;
 b=jbpOfWdesyhA0hmjltZg29f0orAAQKwCfBMbt61ik+V3AUDP5CwuqdgBkXaNbNFyTUBiT252C1TVvvokouBrLadhtYDnqhjTuyoOs8xjK0xf+eX3l1ecT2hj3DZqqWXeJH98oMMCaHFoJOr7uTXm79g2a9ZQNuSq6wm0g5xt43dXghenwzawwGf0kvDyO1lWe/VjSk8rOSek3nlOGp5lDz7TkBOXNwdeq4uVZ5XXDV74Yt2jToCE/+Ftg5PRbrWw0wla0g/XXoxZrqBhw56dmz9CghG/6QlbWNzKUQJWY2T5kDDJw+ieNAYG46mOnnLp2uD0khPJa8b27YubqDdCkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by DM4PR11MB6017.namprd11.prod.outlook.com (2603:10b6:8:5c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Tue, 9 May
 2023 05:21:50 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::449e:6409:5bb1:912d]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::449e:6409:5bb1:912d%5]) with mapi id 15.20.6363.032; Tue, 9 May 2023
 05:21:50 +0000
Date: Mon, 8 May 2023 22:21:47 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
Message-ID: <ZFnYa9coWyqriCEO@nvishwa1-DESK>
References: <20230508062730.1509-1-niranjana.vishwanathapura@intel.com>
 <2bf9e00bbcec0a4bfe0c4d4a194a3cd031fe6d42.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2bf9e00bbcec0a4bfe0c4d4a194a3cd031fe6d42.camel@intel.com>
X-ClientProxiedBy: SJ0PR13CA0132.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::17) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|DM4PR11MB6017:EE_
X-MS-Office365-Filtering-Correlation-Id: 342dd486-d8e2-4666-b08a-08db504d4ad4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N1Rm27It6CUndDKW6XgR1PSaOFuFQ8Okia0vxGjwkyi2dwFjHo9eCcUVD4rz62HHn9OvnezzEfhWi7cH9HT1314UKsZd4yuL2uhLmUj/Ye15Y05lTnvmC+HGV04p8ZHtWOe7gimbImXgSwllOGVEtWkQqtSraERDm0R7ZlHrvuFsCUvCBOUVWMY5xkkW1RlFJuG8xRxZpkL5HntjKHqb3ilsYfhV0zfT3G2G2J9GZVIFJEktAoai693UK6xj6Q5YGaRVltYv2gJKUIWrTDJHONuNZMdu7Jc2qTHEGfNgyeMQHfNu5J2nAQG3xxZ1k3cTeOYHs43k+Z6Zjjql9c9/gHZQ0tLOqc+9dfp0CcuaUE2R01/q2sM4+mrxle8O6fGfSZ4y7GPpn4qi/A1RDn5/c40QIxmwS539VXJXJRZ+Kkp3lRSFeLNUXapUDzYcA8uLNx/MeVTe5QkQb4rxkqwYKkLgoGbIJKvHR9WeG18lfNrEP/qCukhwjkNivFQuCGRa/9B4Ekm5VyWcy/qRtKPqdssbG3xKK/RlA2fqu3aROFyH6UAsMJ+srBP6bS2A2/Y7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(39860400002)(136003)(346002)(376002)(396003)(366004)(451199021)(2906002)(54906003)(6862004)(41300700001)(478600001)(316002)(8676002)(8936002)(44832011)(6666004)(4326008)(66946007)(66476007)(5660300002)(66556008)(6636002)(6486002)(9686003)(6512007)(6506007)(26005)(186003)(33716001)(82960400001)(38100700002)(83380400001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Y30GnnsWW45MS3gY7QwnKOIlzRXlqwVuMCZXAPyRuKiE4njsqdremF1Jnj?=
 =?iso-8859-1?Q?8gbiuWobcnd3f3tKYvSJtc/ioDrX6U3dZ1OE1xbJQ9Ivg5fqDUzEjskU+b?=
 =?iso-8859-1?Q?Cyc06FofOI4xzkezPIc1vOg0Y2ywV+O8UYPNwPUniDfz5rcBEIKBavGaKJ?=
 =?iso-8859-1?Q?YaSPcem/m4h3cLmNdLkZKLBi2tkRSjpSR81ZV9WQx4yljy/HyvPr7h0NLw?=
 =?iso-8859-1?Q?kEhbbM2qLeSq4gQ/n6s5rXhvANEiA/Vd519THLct4CmEmN7HUBJzESeNRc?=
 =?iso-8859-1?Q?e+2MLEct4iQ2ocVmmjgNo6NxZO7bOFrn1jpSsyx4eEJwyWyHn6pNGLiOXU?=
 =?iso-8859-1?Q?blY2PGOt/M9r7/oscNTjsMyASByqWU3uE5rhkvBt7PJdRWXw2WXfOvA55i?=
 =?iso-8859-1?Q?stfrCRDn3Gycn1qer85115egV/KdX/TVyQvlbJSB5evfSues1xzLeKTPXj?=
 =?iso-8859-1?Q?k74rz8GBKDN2viGfIx797kk1TzaK6wTX0WpaorFktsvZnNv/aQcSVmmxO+?=
 =?iso-8859-1?Q?zhTZQh4wBMUWQ3TDFK3XIKq4dJE2r5of2uoSns2cbC+2wr0NUK9BXAtEgI?=
 =?iso-8859-1?Q?zFqwpVTn/qGgofXxhbEbBW3L8LmSJKP+Y4XOZNfsFm9Djp+zYmQFfCEdB1?=
 =?iso-8859-1?Q?qkjAJDc8tCAqbq6XTPFL/3TIYYEab4Z297bDnqoIBsfdlbAHSrzTFYg4dE?=
 =?iso-8859-1?Q?iDGtnHBlzDx1h9w9l6btk6MfNbOg6GgyGosg45JcvXrOUVdg2leyAaWUBn?=
 =?iso-8859-1?Q?jLHgJZ2LGT/M32RSudnV0mrPzuaXNXPeGlSx/z7GnORXR17vNCgR8I0K22?=
 =?iso-8859-1?Q?aN7JGceaFQxS1m8Wza/WR9s8NvEjaHevu65bdBuIMx4dSa3mMypLbQh/R4?=
 =?iso-8859-1?Q?ojkyqV1mp1jhst+QxNKIBXTvAU+S0wNrFwTCNSzHFoLTkpXCg3Fw/bDpoO?=
 =?iso-8859-1?Q?k5X0LsL5S4RTfkxf9dxuI/q5jFLOeVBhqb16OULW+cKgBqVJT/DG7jsYY2?=
 =?iso-8859-1?Q?7caUgrLpggsDrDtzX8BDwSDk6jrTWj9PqKLUnkV8H9fYBi29NQdXzx0eHR?=
 =?iso-8859-1?Q?C+quk4BJ3rpTKBcHadyu9QQ9MUlPTnjGJB1i5+0tRHNmt/4aHhFtik/brb?=
 =?iso-8859-1?Q?7QnX+qua1b+rQa14JQNEVH/3x6e6y4hBV/VfttZu7ABIm+hgglmPyfhzPh?=
 =?iso-8859-1?Q?zZekmT3ZFFksNcM802AkaOsReRjLSbHF71Wg/0ia2zMF/l/a/40ZibueXx?=
 =?iso-8859-1?Q?wKRwmhcUGTYNG3E1uIpksAeg58IVwk513CCdAlB7kVg6pO+OHFnxB8mJyO?=
 =?iso-8859-1?Q?wnFRVjKiTDHxNbLzqHa1oIDdxkGwRkX+do/G7oBuTBxHQwepzlwFzW4ETk?=
 =?iso-8859-1?Q?1GlSb0Jc5gHae1+AwO+BMUk9/WHe/JvGZOb4nQqnny3KVILiKtx50GAWCO?=
 =?iso-8859-1?Q?+iP6aFiHZqM3CPwz7ScU/GMYXH5cmiLlHFJMzIiAZ3IgEJ7gO2n8B7ZPSx?=
 =?iso-8859-1?Q?VJU07xpiqT0NVmq23UFjj583UOnHaB92LNWclmcjQ8aN19c8j2lWblojh7?=
 =?iso-8859-1?Q?28mekP/YjL+nThLQ3VA8IDC/oMPuZER0XmpzgccdVtWLxH3BOC8tWe0EhZ?=
 =?iso-8859-1?Q?/zBs0a/VIWda/GOFHApwip7bSHJBHxLtUSs72u4P5lk91ssjANmhvDwWAV?=
 =?iso-8859-1?Q?sjUKhziMyykpJcYLFnI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 342dd486-d8e2-4666-b08a-08db504d4ad4
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 05:21:50.2790 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d731YfA2hGWHP/e/QijpSDuotHZd3sAT0amXQUfOt5o6Kf2eQaHYxdExHgH7X7Iw+W+UcqZ2SXnTUmwawNDx6hSKWUhJZZVinaMJXJR2QHbw68J9SkRjZUz4Fj/ZgbS2
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, May 08, 2023 at 02:25:04AM -0700, Hellstrom, Thomas wrote:
>On Sun, 2023-05-07 at 23:27 -0700, Niranjana Vishwanathapura wrote:
>> With multiple active VMs, under memory pressure, it is possible that
>> ttm_bo_validate() run into -EDEADLK in ttm_mem_evict_wait_busy() and
>> return -ENOMEM.
>>
>> Until ttm properly handles locking in such scenarios, best thing the
>> driver can do is unwind the lock and retry.
>>
>> Signed-off-by: Niranjana Vishwanathapura
>> <niranjana.vishwanathapura@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_vm.c | 18 ++++++++++++++++++
>>  1 file changed, 18 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index 91576cec000d..df1214f00a06 100644
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
>> @@ -508,11 +509,15 @@ void xe_vm_unlock_dma_resv(struct xe_vm *vm,
>>                 kvfree(tv);
>>  }
>>  
>> +#define XE_VM_REBIND_RETRY_TIMEOUT_MS 1000
>> +
>>  static void preempt_rebind_work_func(struct work_struct *w)
>>  {
>>         struct xe_vm *vm = container_of(w, struct xe_vm,
>> preempt.rebind_work);
>>         struct xe_vma *vma;
>>         struct ttm_validate_buffer tv_onstack[XE_ONSTACK_TV];
>> +       const ktime_t retry_end = ktime_add_ms(ktime_get(),
>> +                                             
>> XE_VM_REBIND_RETRY_TIMEOUT_MS);
>
>The preempt_rebind worker may actually take considerable time if stuck
>on locks. Could we do the retry_end calculation at the time of the
>first affected retry?
>

Ok thanks, will do.

Niranjana

>/Thomas
>
>
>>         struct ttm_validate_buffer *tv;
>>         struct ww_acquire_ctx ww;
>>         struct list_head objs;
>> @@ -637,6 +642,19 @@ static void preempt_rebind_work_func(struct
>> work_struct *w)
>>                 trace_xe_vm_rebind_worker_retry(vm);
>>                 goto retry;
>>         }
>> +
>> +       /*
>> +        * With multiple active VMs, under memory pressure, it is
>> possible that
>> +        * ttm_bo_validate() run into -EDEADLK and in such case
>> returns -ENOMEM.
>> +        * Until ttm properly handles locking in such scenarios, best
>> thing the
>> +        * driver can do is retry with a timeout. Killing the VM or
>> putting it
>> +        * in error state after timeout or other error scenarios is
>> still TBD.
>> +        */
>> +       if ((err == -ENOMEM) && ktime_before(ktime_get(), retry_end))
>> {
>> +               msleep(20);
>> +               trace_xe_vm_rebind_worker_retry(vm);
>> +               goto retry;
>> +       }
>>         up_write(&vm->lock);
>>  
>>         free_preempt_fences(&preempt_fences);
>
