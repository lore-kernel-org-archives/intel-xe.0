Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E33D8C77B7F
	for <intel-xe@archiver.kernel.org>; Mon,  8 May 2023 12:50:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD25E10E27E;
	Mon,  8 May 2023 12:50:12 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5822610E27E
 for <intel-xe@lists.freedesktop.org>; Mon,  8 May 2023 12:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683550211; x=1715086211;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=a3vBRm2gZ7CDwlhXOGn1fN6LfuiEa8IFHMuzlW5wV0s=;
 b=gxp7E2DY2bh+ZJwsS7dd0b907ETBVFebFuzsM3SV54udx+h8murH48xM
 5Vvsrr6LWzYtP8mRPFuHOJ3GEaY8O88GsT576fDbmoz4ZZqkscXZBTGFz
 efL/2YDOpabKieXNhe75ovSXEAej8hTzw2Yg4qeUciFopsk2cdvwytAWx
 6CEI3NBKtyA8zPfq/oBCn4k1Fhgw71Hi5LANM7TuCQvz5HK6g7ID1N1Rp
 Ljz3G0QdkiXv2ZAcp1jEiIOEzBU4nXf9OOS0Wk5FoBSEPEUXIc+3kvxsG
 cHz+DcEruSapP52wyO+TKQiRbS2c9OH+CNjTqKpWCb8269H2duQUj0pnd A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="338856779"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="338856779"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 05:50:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="731282696"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="731282696"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga001.jf.intel.com with ESMTP; 08 May 2023 05:50:10 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 8 May 2023 05:50:09 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 8 May 2023 05:50:09 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.42) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 8 May 2023 05:50:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TvBUpRRbtfPvSa2gzdwLdeaI1VzEGrBOmNK0voDKEZ01KaHoHevGsgRE39bZgcfiJpk5EPX8gavJWh/o0MkSRovGb19KRmeRsKZ2nERWlYBbWiQ1aFalmuhOh21BCGesTqhd6Mga898QKxn1wMjq52q/KrvcMRpMMg9LfEmnhrsth0vwpdwgCQCXpYnKutk+BcciV/C1ygY3sNiu5yygtlZ4Mf9GmCNReKJp+Vk0wTZ2sL6P2mrkakgX4dvmGtbaoasZC7+jsrbevq3gZQ0NnYLsQIE4NckdZEKrYmm7CoEILH/Kf6TpBC6X9C8EuGnVXpMB8ugLKtpjuOw+/BwTNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FblUgKxiAL2dvzl9WBaiS1T33ypY0aw08r0bO3KJWSU=;
 b=jA/WV2CEKii6rtmD+o5Ij74UYorVshKfYYDIxUBBJS1P1UHHrKqCOla5vBvvOPZQUP9mPS4/hxMANJH/QC0JeqynLnd/AHBtHI2vLh36BbiT6KKxIDFJICWC+15d5S6sFSUKjyxfyuYVa8dbkVWey0hbq7ScgyI2FJAIelNPKLAEVfaI6rYrXnRAXu9Hkft+6etuDk6+c4sGmdFiF2Sfj+7CaVNBEd0IWw9o1nQkTGIooAL+baOdB9Fc330Wmj8SUCosMT68yLt09Hz919etCNa5Sic+EXG6hSccAXpGvFueayGJkOYKq/M4m/YbNidx4/Tnz0jGgZPcCKeYPA+8CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB6217.namprd11.prod.outlook.com (2603:10b6:208:3eb::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 12:50:07 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%4]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 12:50:07 +0000
Date: Mon, 8 May 2023 12:49:37 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
Message-ID: <ZFjv4dFp5B57mmNz@DUT025-TGLU.fm.intel.com>
References: <20230508062730.1509-1-niranjana.vishwanathapura@intel.com>
 <2bf9e00bbcec0a4bfe0c4d4a194a3cd031fe6d42.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2bf9e00bbcec0a4bfe0c4d4a194a3cd031fe6d42.camel@intel.com>
X-ClientProxiedBy: BYAPR07CA0087.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::28) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB6217:EE_
X-MS-Office365-Filtering-Correlation-Id: 1072df7c-5a66-4354-ac49-08db4fc2bffd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lP0SoO87Yqvw498RNKuZzPCW+a8CYyhVjbZwdPAI/qJati8TTPBDkqT1E/iFpYDrB/bOJ8s8EsYRlSd+uRkBiDfnME53Rb2PCJz0dmGeqvXJ76vM1ByTwC9OgRBKkhNzpMeLTo1mQmp+FAORD013ohhUhn5Mx+Qr8wqOy4wjnXo01hnCJUWiNMMTWtjAl0BYfg+SvqP0GXAdvz/oSXNzlx15xZvabNDdxMOtzvXz9KMAwMOuVJ9VZ7C7Uw0lYo6+sI6Kc/UkidsO3OZ0PS69Fp2wcepiSg30JNWT7kJCX83D5V9G7J69dF3GkKhz9m7Dal/pTUWn2ntVsZY1u3+pbtRfotaNETcRxHjwMHrvREkN6k4v2BRuQk8rQnYkjpavzd/+nSBqUZEyxGvRFu78ty3bNlDk3/dJHgYBImK5KikC7fJY0vBukgw5usFGI/6oC6+DzwGye/AcrHrmSpj5PSLEwHhjboH3MQ1NWCKBkloDMVPk0eUzYQKapawBo9bHnPYp8uWL+IhKfkEcDUXJqXRcOTIqIQbAQ+rCq07vixMHF6JoeJSvsjVfFI4479z+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(376002)(136003)(366004)(396003)(346002)(451199021)(86362001)(6666004)(316002)(54906003)(66556008)(66476007)(6636002)(4326008)(6486002)(66946007)(478600001)(5660300002)(8676002)(6862004)(44832011)(2906002)(8936002)(41300700001)(82960400001)(38100700002)(186003)(6506007)(6512007)(26005)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?qMirau1OshMx4OE/xEGcs+ptRIoRKV/k+80dUNI2kBoTB3zKVyk7+OZE2l?=
 =?iso-8859-1?Q?ft2uopQ2S337ErphOmr8NH5cMUcriQBF0g0NC0YT51PoQt8cFPZoiniNDQ?=
 =?iso-8859-1?Q?sJIXepnGAJj9HbTtz8He+WoeqB7OMkggwmgI3NuVsIA88DrH7CMKV+GSza?=
 =?iso-8859-1?Q?cLZZKQocfETFFRAXINa5W+P9Ff5QrO9Q6X+wsChGUzwF0MrfOPmIdOparp?=
 =?iso-8859-1?Q?972o2668CJet6ZeDeU2wtNvdKD7hhR0DBeh/sG0NHUI7NZb5faxIB7DtmX?=
 =?iso-8859-1?Q?zrBy6Qz+H2JktJEJMWHUDDN5pbJUN1M8xE+2iqoPWP2cyYaYtJNhtTvFMM?=
 =?iso-8859-1?Q?v8ETmGt5k6oBAE9oYNd4q6S7mZFeuSF7ARq/HQno3x88QfoTiMfi/k+ix1?=
 =?iso-8859-1?Q?Ql8XZoVTW++VGkF2LjmgxYD2CJsF0X2k9Wxcw4yAYpyvLIxCjoAKYBn+VN?=
 =?iso-8859-1?Q?y1FbGs6METxhozH2HTsuRGjyb9++otK1L7HYs38D4IfznmMjZieYt7Tr9m?=
 =?iso-8859-1?Q?oicUhqox1eEoCj2ftWnlrxEAejG7aval0lBwy+Y4FnNpBcbwy77npFb/s9?=
 =?iso-8859-1?Q?LWLWqh9dEWyovzEY5uLBo8yJSBlhQdGn9UQDa/b+hoJL9LTj6T3jV43B7m?=
 =?iso-8859-1?Q?CUSXtCQnGWP2rfsOI2WVUUoa1OPp2Myo+PzAlkFCT5xc1fe/AvrzwLVzD1?=
 =?iso-8859-1?Q?5QPYAHkl0htfK0EhQu8guMf924e261IYYPsbPgHS6HNrTMpqVX7zDvNx4t?=
 =?iso-8859-1?Q?rYXOlWdHQRnM/tBbE97DXPOBkedk+LVS4MtJd/cf4xzv7gbLYVZMa1HpUB?=
 =?iso-8859-1?Q?QcYvHxdv+QByAUhx5RQsrV+G1yMSBxljb29Ar+I/Bq8jYktS/OXbJc15xl?=
 =?iso-8859-1?Q?P/QtI5gAxZlg+5r1Skd1OYoshobaVksmuvf/Co/YlcFKQA3oLpE+oXVV7w?=
 =?iso-8859-1?Q?s1q1eqk/sfijdR2yNahnXGPPIBSamTqM0XZ4QtHzdOqwlOe/5Bz7JRMCAe?=
 =?iso-8859-1?Q?3YVXIrjFDv5vnxtgtCPgTDSuEflB7dWOwuemCUUG2fMppLW6RX60GoE8c0?=
 =?iso-8859-1?Q?3Z+7ruUNUQwoHUM9pC++0c3Aab3qVBKADik48kLNusT4KZx/VsfAxijWKu?=
 =?iso-8859-1?Q?1/pvAmkeRfW+rfcVuggHpBN9c/UmyRaNQa6Lcbva2XKNK5dBYtQBmPpPMS?=
 =?iso-8859-1?Q?NlgXpe/XIXDbkkP6TaXlHKpRUDEdyLtlEt42mHtHLC1fxRXZOSYzcmAZyc?=
 =?iso-8859-1?Q?cpadzHxQtnglFVcBRdhbImV5KQr0Ti830KGCD/nwBbwC1lOv7UubBpEwzm?=
 =?iso-8859-1?Q?bnG7kJ9004PNQKeKRFu/U3/3LGr6T8RT8h+ghEztiHYwZpqHKsUGwH1DW5?=
 =?iso-8859-1?Q?CqV04/YMZBUAavqDVuf//NPwoJhcEn2QBjLEJSIrOd49+H6dPuIBknW00f?=
 =?iso-8859-1?Q?25fovnpWj9HG9oCSfjstw5Chs6YC5VGfo6RErFvDO+fgVxsfoIH5Pq8bsW?=
 =?iso-8859-1?Q?+mHtn78CWR43yGt34dy+4AwQXc34AfUbFWrWoO583KBTRaK1BMdPrXAke/?=
 =?iso-8859-1?Q?sl7OlUGeEVi2yexYAoCs1KrjpbHmGQUxS//KUugZKZbf//cViK0zF1WkB7?=
 =?iso-8859-1?Q?1ddXzTkX/ZrA2qu3sg0RGGCJ4b+QNR8w/b/M5Q9gjAbfD6EDZmfT0qKA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1072df7c-5a66-4354-ac49-08db4fc2bffd
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 12:50:06.8514 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d2+55lPTSiJ9MJKPbA2jsAGcuvYmaiO4+KurIJ5nQHYLYAVGd/Pd1f02gkWju4eygT2inBiGr4ZbdWzg5XJTcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6217
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

On Mon, May 08, 2023 at 09:25:04AM +0000, Hellstrom, Thomas wrote:
> On Sun, 2023-05-07 at 23:27 -0700, Niranjana Vishwanathapura wrote:
> > With multiple active VMs, under memory pressure, it is possible that
> > ttm_bo_validate() run into -EDEADLK in ttm_mem_evict_wait_busy() and
> > return -ENOMEM.
> > 
> > Until ttm properly handles locking in such scenarios, best thing the
> > driver can do is unwind the lock and retry.
> > 
> > Signed-off-by: Niranjana Vishwanathapura
> > <niranjana.vishwanathapura@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_vm.c | 18 ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 91576cec000d..df1214f00a06 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -10,6 +10,7 @@
> >  #include <drm/ttm/ttm_execbuf_util.h>
> >  #include <drm/ttm/ttm_tt.h>
> >  #include <drm/xe_drm.h>
> > +#include <linux/delay.h>
> >  #include <linux/kthread.h>
> >  #include <linux/mm.h>
> >  #include <linux/swap.h>
> > @@ -508,11 +509,15 @@ void xe_vm_unlock_dma_resv(struct xe_vm *vm,
> >                 kvfree(tv);
> >  }
> >  
> > +#define XE_VM_REBIND_RETRY_TIMEOUT_MS 1000
> > +
> >  static void preempt_rebind_work_func(struct work_struct *w)
> >  {
> >         struct xe_vm *vm = container_of(w, struct xe_vm,
> > preempt.rebind_work);
> >         struct xe_vma *vma;
> >         struct ttm_validate_buffer tv_onstack[XE_ONSTACK_TV];
> > +       const ktime_t retry_end = ktime_add_ms(ktime_get(),
> > +                                             
> > XE_VM_REBIND_RETRY_TIMEOUT_MS);
> 
> The preempt_rebind worker may actually take considerable time if stuck
> on locks. Could we do the retry_end calculation at the time of the
> first affected retry?
> 

I like this idea as well.

Matt

> /Thomas
> 
> 
> >         struct ttm_validate_buffer *tv;
> >         struct ww_acquire_ctx ww;
> >         struct list_head objs;
> > @@ -637,6 +642,19 @@ static void preempt_rebind_work_func(struct
> > work_struct *w)
> >                 trace_xe_vm_rebind_worker_retry(vm);
> >                 goto retry;
> >         }
> > +
> > +       /*
> > +        * With multiple active VMs, under memory pressure, it is
> > possible that
> > +        * ttm_bo_validate() run into -EDEADLK and in such case
> > returns -ENOMEM.
> > +        * Until ttm properly handles locking in such scenarios, best
> > thing the
> > +        * driver can do is retry with a timeout. Killing the VM or
> > putting it
> > +        * in error state after timeout or other error scenarios is
> > still TBD.
> > +        */
> > +       if ((err == -ENOMEM) && ktime_before(ktime_get(), retry_end))
> > {
> > +               msleep(20);
> > +               trace_xe_vm_rebind_worker_retry(vm);
> > +               goto retry;
> > +       }
> >         up_write(&vm->lock);
> >  
> >         free_preempt_fences(&preempt_fences);
> 
