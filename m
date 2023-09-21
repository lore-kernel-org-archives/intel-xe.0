Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDFACE7D0A2
	for <intel-xe@archiver.kernel.org>; Thu, 21 Sep 2023 18:38:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72EB910E16B;
	Thu, 21 Sep 2023 18:38:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9117810E16B
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Sep 2023 18:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695321515; x=1726857515;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=IE8BrOdcj8K34jrTwqkYLQEuySFWNmxWTazveoFs8OQ=;
 b=AZ6jOt5uz/9NKX9cekuT2b++85V4Ctc1AILxLDyk1tZjladW06XuXzSp
 psF2b9r5ocH5TquwQHAd4vGZR2DmCCOrRkn13vgQIje5FLRrnSjssTSUe
 pO8nLEsF4su92AgBByprtCaSt+/cPE0a5wzTM+iqB0jjt4Lw9rrwQFgkd
 W/LqoUM+qvs9tAxBk2t8damv1DAilVdeE5Fi+Yf3u7utQMuV2HRoDH01R
 k5KOPMZ4OADYG7wzK+nhAgA//9VAM297hXBgEcLs5xBLVRZwhzvb2dfYh
 IFdxvTDrBddJZ2EFEzpR3SWNZORutVSGVh1AI7D+1ZxZTGbS9/ksVuJEE g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="380528517"
X-IronPort-AV: E=Sophos;i="6.03,166,1694761200"; d="scan'208";a="380528517"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2023 11:34:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="837401265"
X-IronPort-AV: E=Sophos;i="6.03,166,1694761200"; d="scan'208";a="837401265"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Sep 2023 11:34:53 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 21 Sep 2023 11:34:53 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 21 Sep 2023 11:34:53 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.106)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 21 Sep 2023 11:34:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n4jLHrxuvIG+LFgRjj9dfdyXz6LRLLqhvoeUia7+9cE1iDYPRHEkpTEIHh0zPF1MxWAOKvNg2uGYPwlt6HL5aJ94B7MdFARiB0z7i1VM1kWb54UwmVnUraaw5KhKShnkQcoq8wxQsiMWfDRjxOS2ronsO4hJ6L1SQiIkhfOiewpjZDIvtVCMrcQ6gLqTfb0vIGBODcbSV4vNNilXSVOw7hngL6aAh+uRv0g5UCaWXRx9jcxGCGLdCPzHLmCjE8WVj8J7yqJbtrOFoBRxs+Axq5DxWpf6ET8NzJDzZEIybsCIg5yF17P2IoXgpdzshsM8y+p3AkMYpEzfQRMi1dsCIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rOSbUHFc7uokEtvoKyR6DvaY/qNZesXjNHBvt8k2Fxo=;
 b=ia3lvt71YNx/qheHabyLC+gyoZLUsYKrtDFHmZ5GKRG6tx0yzoT/oNtwIw18wxZc9ib4SzsOqZAFPYXUiRl1i3D9QFQICpnLyrUtHkAa0CnZV9G3jF+hRsKJ78PKFwGicR0/sijo12kkNhxgjD2+NAT9I/mAIHVEdovigApoLbLiqCrodH3W92MfGFEBlf9e+CITK2PkLIChdU7gDWcFfgNGah3dh1dFdhXDc4EVherPFTHzlS4MBSbV74/gFaw5FwwonwonqTWB8rlPA+Zqna0JEyYvNOOl0oTnWJnTGPFnfW++tNHYJruXQPftv8YR4tv89wNKImnwZlcPCrfNzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB5920.namprd11.prod.outlook.com (2603:10b6:a03:42e::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.19; Thu, 21 Sep
 2023 18:34:51 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b%3]) with mapi id 15.20.6792.026; Thu, 21 Sep 2023
 18:34:51 +0000
Date: Thu, 21 Sep 2023 18:33:43 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <ZQyMh9n3fVKbko/y@DUT025-TGLU.fm.intel.com>
References: <20230914204053.2220281-1-matthew.brost@intel.com>
 <20230914204053.2220281-7-matthew.brost@intel.com>
 <1dc697ff11630f2446bf1998485c444a6c49fcc0.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1dc697ff11630f2446bf1998485c444a6c49fcc0.camel@linux.intel.com>
X-ClientProxiedBy: BYAPR02CA0033.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::46) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB5920:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c78e5cc-f6e9-4e51-8daf-08dbbad170ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RpknRAlFsfKnmYEZdnicQmUOZJZvK+E0kn9lmAyq2zKbmeAds5wJsCmw3zjYDro3Stl8bhmoyIcR7oiobV2nEiw9SsmMNrmAsYHo0R64SQ1L0juSj5fg7onKxAv6bS8zVV/54RX+R3bl3siwjMaFIXUhtAhg2bjNuklDC8LhcsM4NxMaawJIkVIEpLSLteXyV5IqKsazJIfec+Hmh90O4FaIkdXzNZ6AI0FjCbZgJT+6jzt0mqHArd796+phY98gpEXo5N7NqcPtqa4agW0vFFa+cNoF6yWAOooWq2k2pWZwjUNQFGDbL5fd/Sq+lRDI++JpTWwE/aLOylxP7qdNFHVxEB7CA1Zx/kRwBicorxT1a9wqbozH/LWz9TQ8nWSP5qy82deO7jhX0QfTQohKp2U2/v4flwKp1jcUvVof4wTd1//77WBp8YhXd0RUgxwq28x6sblXgYuSFWkFpXNm53tOQWUTo7MdIRfF43SGOQMEgDDC9eQmPz/sqCNkyH0B7peO8jY3SqvUq+5OaDTea+LOucOkhYq1TV9nuXliV4QhCGhzk0HstntG8GlNCGmk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(346002)(136003)(376002)(366004)(1800799009)(186009)(451199024)(478600001)(8936002)(2906002)(44832011)(83380400001)(26005)(6512007)(6916009)(6506007)(66574015)(316002)(41300700001)(6486002)(66946007)(5660300002)(66556008)(8676002)(6666004)(4326008)(66476007)(86362001)(38100700002)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?WR/qcZftj168+jooim28IEfi2q3VLCL5/UfdAzgiY1Q0Wpr6lh8cxPgZzd?=
 =?iso-8859-1?Q?X3qp2QgyLOkB8GOKPVfedukhwFWIENv+oaXsn2F5q29nh9kQ7eabfMiXsl?=
 =?iso-8859-1?Q?q5QuGTXUKoZmuWRFCik8XqPPwqip6a/7z8qZ+AV9KqxEIUqpmxwgc1xniR?=
 =?iso-8859-1?Q?OtlB5/MWaqw/Tl3YAiXgHxmk5bljbv1w3H93c9q5L8tw7C2uG4YY2eu9u6?=
 =?iso-8859-1?Q?lJzEysvEHvW5F/s8Q1tK7mQkqwycZ3i2eQSbi2UsEsodNw2/TzLU1c/nXq?=
 =?iso-8859-1?Q?F3oEAbPym2tvyhMwO20tc/mrcHcTMAKpm2dNVZjONo+UM6/VLQQvUHOJu/?=
 =?iso-8859-1?Q?2OIeVo8IbSL9InDPIp4jUmfrfFteBZGg/P54ZmQdS9bwKTlUoSemzRPHnX?=
 =?iso-8859-1?Q?0SDAM1j80/Ty0vUKcEMLap30DAb/bCtM59GBzqwSNKhdO1h9Lll/z4TE6b?=
 =?iso-8859-1?Q?XTqDOjwx5jAkTPM5vIJhRgKkvQV5SbBvbgQD/j65A7YAA6Z8TTa1IGLqrc?=
 =?iso-8859-1?Q?dm4Y5wBgYpxjnMg43eMPCWD2xqm5DYgGH+/XkpRrynOHeKYqFg5M7KhpnA?=
 =?iso-8859-1?Q?jXbw/DTn9h/2Npw8qSxp/V74Hqytwn95cSjNV/i/hGr1qVM04CTeBtA17h?=
 =?iso-8859-1?Q?k/UXmSlMyjnbU37hNdxqhzW1q/l6lNKY3NSqe4TdXbwxh2iYv3nfPZHQf1?=
 =?iso-8859-1?Q?wfCcDo5ShTjlBFJZaMm6kQAsx5ODAZB04BXrmlKFXBOppeLvY0u32CpnpL?=
 =?iso-8859-1?Q?8JNHYqsWQAU3/udXXZ+JSl5ELMvIFJnBdo/iWBJ23JrtSh93IUE8p+XDOD?=
 =?iso-8859-1?Q?R+maagnCLLaLWgc0DBiCKTYzsTvW2Qd2S8tG7X8BSKPx+1/3qTFU2etAcu?=
 =?iso-8859-1?Q?GpBGZ63ptz30/uIkx3MKJ1kvl2tm+/D3lAJQg5xrDd2lIkxOa+B8MnYU5K?=
 =?iso-8859-1?Q?O3v/0qot8U1jIJM1thx4eqVpWpjq+iGCdebh84+5Q8LBV/yhjD8QGjdrWG?=
 =?iso-8859-1?Q?7Vzz19d1K7vN1dLY02BjAcRQRgcy7a24s6dMIV/LyzbH13ltk3jM1MHazR?=
 =?iso-8859-1?Q?FdPa5+ooHjR6kBYbP96rsmQlgZD+BRnqiwfjSYIJ8wOm88HMjkcFxD9Uqn?=
 =?iso-8859-1?Q?vkJKA/+FFgkM5KM4uzKtqdehKssWSM9Fr46gB3yzLnstUKMJmAFTIVzy6q?=
 =?iso-8859-1?Q?wXqGZWs/U1XDZM6FJJHr6Sqjc2WNjb/9NItEISXSkQEME8WicUP6nN6cts?=
 =?iso-8859-1?Q?KPkd4JQIg0xwZhR1lOJ/ns+QatvAF8QLhl5sN/r64C0Vc2AqTnsl1T0cM9?=
 =?iso-8859-1?Q?wHisosnLvws5BoTg/ArA1DBaUoW1qt4CD3jsuqJ0HkWuAJQ6g5m8DvZAIn?=
 =?iso-8859-1?Q?56qWCFjI8+T4lXIcClVFf3LlWJy+I+7Ina5TYAuM62Ugu2EZtOZFCSsBYL?=
 =?iso-8859-1?Q?N8luBzN0nK3hAQZiaRyao9FgFu1cI8EhvS9kGLlSN/BHN8pfSF6k4fuhcW?=
 =?iso-8859-1?Q?yqNH1CeFzt//JEw30leW+FfaDoola96Rd/D5/7pr+1ezhbJ/WiurxzRfjV?=
 =?iso-8859-1?Q?vb0C1ABcOpCzPnQhc9Rg3FzRrMT31qIIh5IbQC155BskdH6W1i6c9KhleX?=
 =?iso-8859-1?Q?aPtxkxS+V9zpArswnxzhPTNNe8hyeqw0Ae2EM0MbvTEnGPSr+W81XvHQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c78e5cc-f6e9-4e51-8daf-08dbbad170ef
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2023 18:34:50.9973 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HYc6dkX6iXq6n6wQnjMQpFjxRZFrhcpwR8RJCpcwcFromOnD7mG0SyRkAeAic02QTcTTqtkWutWP/StQ8xE/ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5920
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 6/6] drm/xe: Allow num_batch_buffer == 0 in
 exec IOCTL
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Sep 21, 2023 at 11:42:43AM +0200, Thomas Hellström wrote:
> Hi, Matthew,
> 
> On Thu, 2023-09-14 at 13:40 -0700, Matthew Brost wrote:
> > The idea being out-syncs can signal indicating all previous
> > operations
> > on the exec queue are complete. An example use case of this would be
> > support for implementing vkQueueWaitForIdle easily.
> > 
> > v2: Don't add last_fence for VM's that do not support dma fences
> 
> Question here: Since we seem to need to add some special-casing for the
> last patches here, and it seems to me that UMD could easily keep track
> of the last out-fence, did we get a request for this from UMD?
>

I believe this was a discussion between in Faith, Danilo, and Dave I
picked up on. vkQueueWaitForIdle is implemented in user space via a
dummy BB or bind I believe but since the ask was for the KMD to allow a
zero number of binds / execs to implement this.

> What happens if this zero-batch-buffer job has a number of unmet
> dependencies? Will the next job on the queue wait for those
> dependencies to be met?
>

Hmm, that is a gap. If zero-batch-buffer job has unmet dependencies it
may signal immediately.

Maybe for now we return -EINVAL if num_binds / num_exec == 0 with
in-syncs?

If we want to support this the easiest way would be a NOP job in the
queue.

> If patch 4 fixes a bug, Could we make 5 and 6 a separate series?
> 

Yes. Rodrigo is including 1-4 in his uAPI change series anyways. Will
repost 5-6 in a new series once his series is merged.

Matt

> Thanks,
> /Thomas
> 
> 
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_exec.c             | 22 +++++++++++++++++++---
> >  drivers/gpu/drm/xe/xe_exec_queue.c       |  5 ++++-
> >  drivers/gpu/drm/xe/xe_exec_queue_types.h |  5 +++--
> >  drivers/gpu/drm/xe/xe_sync.c             |  5 ++++-
> >  drivers/gpu/drm/xe/xe_sync.h             |  2 +-
> >  drivers/gpu/drm/xe/xe_vm.c               |  2 +-
> >  6 files changed, 32 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_exec.c
> > b/drivers/gpu/drm/xe/xe_exec.c
> > index 28e84a0bbeb0..4666f5b145f7 100644
> > --- a/drivers/gpu/drm/xe/xe_exec.c
> > +++ b/drivers/gpu/drm/xe/xe_exec.c
> > @@ -161,7 +161,8 @@ int xe_exec_ioctl(struct drm_device *dev, void
> > *data, struct drm_file *file)
> >         if (XE_IOCTL_DBG(xe, q->flags & EXEC_QUEUE_FLAG_VM))
> >                 return -EINVAL;
> >  
> > -       if (XE_IOCTL_DBG(xe, q->width != args->num_batch_buffer))
> > +       if (XE_IOCTL_DBG(xe, args->num_batch_buffer &&
> > +                        q->width != args->num_batch_buffer))
> >                 return -EINVAL;
> >  
> >         if (XE_IOCTL_DBG(xe, q->flags & EXEC_QUEUE_FLAG_BANNED)) {
> > @@ -182,12 +183,13 @@ int xe_exec_ioctl(struct drm_device *dev, void
> > *data, struct drm_file *file)
> >         for (i = 0; i < args->num_syncs; i++) {
> >                 err = xe_sync_entry_parse(xe, xef,
> > &syncs[num_syncs++],
> >                                           &syncs_user[i], true,
> > -                                         xe_vm_no_dma_fences(vm));
> > +                                         xe_vm_no_dma_fences(vm),
> > +                                         !args->num_batch_buffer);
> >                 if (err)
> >                         goto err_syncs;
> >         }
> >  
> > -       if (xe_exec_queue_is_parallel(q)) {
> > +       if (args->num_batch_buffer && xe_exec_queue_is_parallel(q)) {
> >                 err = __copy_from_user(addresses, addresses_user,
> > sizeof(u64) *
> >                                        q->width);
> >                 if (err) {
> > @@ -234,6 +236,18 @@ int xe_exec_ioctl(struct drm_device *dev, void
> > *data, struct drm_file *file)
> >                 goto err_exec;
> >         }
> >  
> > +       if (!args->num_batch_buffer) {
> > +               if (!xe_vm_no_dma_fences(vm)) {
> > +                       struct dma_fence *fence =
> > +                               xe_exec_queue_last_fence_get(q, vm);
> > +
> > +                       for (i = 0; i < num_syncs; i++)
> > +                               xe_sync_entry_signal(&syncs[i], NULL,
> > fence);
> > +               }
> > +
> > +               goto err_exec;
> > +       }
> > +
> >         if (xe_exec_queue_is_lr(q) && xe_exec_queue_ring_full(q)) {
> >                 err = -EWOULDBLOCK;
> >                 goto err_exec;
> > @@ -327,6 +341,8 @@ int xe_exec_ioctl(struct drm_device *dev, void
> > *data, struct drm_file *file)
> >  
> >         if (xe_exec_queue_is_lr(q))
> >                 q->ring_ops->emit_job(job);
> > +       if (!xe_vm_no_dma_fences(vm))
> > +               xe_exec_queue_last_fence_set(q, vm, &job-
> > >drm.s_fence->finished);
> >         xe_sched_job_push(job);
> >         xe_vm_reactivate_rebind(vm);
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c
> > b/drivers/gpu/drm/xe/xe_exec_queue.c
> > index 8722ab6ba00a..9fe91f66f776 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > @@ -964,7 +964,10 @@ int xe_exec_queue_set_property_ioctl(struct
> > drm_device *dev, void *data,
> >  static void xe_exec_queue_last_fence_lockdep_assert(struct
> > xe_exec_queue *q,
> >                                                     struct xe_vm *vm)
> >  {
> > -       lockdep_assert_held_write(&vm->lock);
> > +       if (q->flags & EXEC_QUEUE_FLAG_VM)
> > +               lockdep_assert_held_write(&vm->lock);
> > +       else
> > +               xe_vm_assert_held(vm);
> >  }
> >  
> >  /**
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > index 71ed8d22a8a1..9648b2bbabc9 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > @@ -53,8 +53,9 @@ struct xe_exec_queue {
> >         struct xe_hw_fence_irq *fence_irq;
> >  
> >         /**
> > -        * @last_fence: last fence on engine, protected by vm->lock
> > in write
> > -        * mode if bind engine
> > +        * @last_fence: last fence on exec queue, protected by vm-
> > >lock in write
> > +        * mode if bind exec queue, protected by dma resv lock if
> > non-bind exec
> > +        * queue
> >          */
> >         struct dma_fence *last_fence;
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_sync.c
> > b/drivers/gpu/drm/xe/xe_sync.c
> > index 73ef259aa387..2461e7d4814c 100644
> > --- a/drivers/gpu/drm/xe/xe_sync.c
> > +++ b/drivers/gpu/drm/xe/xe_sync.c
> > @@ -100,7 +100,7 @@ static void user_fence_cb(struct dma_fence
> > *fence, struct dma_fence_cb *cb)
> >  int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
> >                         struct xe_sync_entry *sync,
> >                         struct drm_xe_sync __user *sync_user,
> > -                       bool exec, bool no_dma_fences)
> > +                       bool exec, bool no_dma_fences, bool exec_nop)
> >  {
> >         struct drm_xe_sync sync_in;
> >         int err;
> > @@ -171,6 +171,9 @@ int xe_sync_entry_parse(struct xe_device *xe,
> > struct xe_file *xef,
> >                 break;
> >  
> >         case DRM_XE_SYNC_USER_FENCE:
> > +               if (XE_IOCTL_DBG(xe, exec_nop))
> > +                       return -EOPNOTSUPP;
> > +
> >                 if (XE_IOCTL_DBG(xe, !signal))
> >                         return -EOPNOTSUPP;
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_sync.h
> > b/drivers/gpu/drm/xe/xe_sync.h
> > index 30958ddc4cdc..98f02bb34637 100644
> > --- a/drivers/gpu/drm/xe/xe_sync.h
> > +++ b/drivers/gpu/drm/xe/xe_sync.h
> > @@ -15,7 +15,7 @@ struct xe_sched_job;
> >  int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
> >                         struct xe_sync_entry *sync,
> >                         struct drm_xe_sync __user *sync_user,
> > -                       bool exec, bool compute_mode);
> > +                       bool exec, bool compute_mode, bool exec_nop);
> >  int xe_sync_entry_wait(struct xe_sync_entry *sync);
> >  int xe_sync_entry_add_deps(struct xe_sync_entry *sync,
> >                            struct xe_sched_job *job);
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 0e2f3ab453ea..c2526950cf60 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -2916,7 +2916,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev,
> > void *data, struct drm_file *file)
> >         for (num_syncs = 0; num_syncs < args->num_syncs; num_syncs++)
> > {
> >                 err = xe_sync_entry_parse(xe, xef, &syncs[num_syncs],
> >                                           &syncs_user[num_syncs],
> > false,
> > -                                         xe_vm_no_dma_fences(vm));
> > +                                         xe_vm_no_dma_fences(vm),
> > false);
> >                 if (err)
> >                         goto free_syncs;
> >         }
> 
