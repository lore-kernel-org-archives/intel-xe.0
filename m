Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6E6EEE0211
	for <intel-xe@archiver.kernel.org>; Wed, 13 Sep 2023 22:36:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DD4110E114;
	Wed, 13 Sep 2023 22:36:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D7B110E114
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Sep 2023 22:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694644613; x=1726180613;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YhWFn6UxRgaRxBArzMb51WoDJ0jrQY0l9bRlJGTCCiY=;
 b=kxOFXPwoVHqrG9TYA5mTve+CV7QDmclA84/Xq9Qy+xDo6jZ0qyFwtJub
 IwMhRIgNs37tAU4bMfFZoFOvWDbncvtotsaN+YbtdufxxqNDRSI/0Vs+y
 J0R/1U7Fs/mXd7V+613/i8kaH0IGX8oWjPM9JQhdtQ2dM8TGCGZ2wDuSu
 2J389PO3BCqSGnNewoualvcA8Vy6Yii4ockyOuLgMu3SqmryyTc1lP+/3
 nKOhxVYzPaoPnpBz4KJ10VZgoxMmcshZj0CA5favXN766eujEmZfXYQLA
 qpgEtq0+omc/8FqzPiMy431uu6qt43YKm1u6WvnwtLwqjzLqmL6lj6Z2A A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="381483699"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; d="scan'208";a="381483699"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 15:36:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="773651053"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; d="scan'208";a="773651053"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Sep 2023 15:36:52 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 13 Sep 2023 15:36:52 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 13 Sep 2023 15:36:52 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 13 Sep 2023 15:36:52 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 13 Sep 2023 15:36:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WwiHDY4SyDvFGA+mcpd1ExjDmmeamQxKdkH8L5k2l7HeY3jQViCyMSvFhS/12cveYxoTpMCqb2yasU+9gtwsDTfAvE6QX2n2qC2ozlUxdJgxqmgsTj0Y5kJiD3R1k4FiN3rTzHY5ImOdLnSG1WjUQ0IL2hXSkel2g/Mxg8nbYhBJEnFUD/BBu+/iFVjOxKSQGNaBRysyHCXMIdtVFzdRxYSi5PvkDS0yhfAf9POzUEU6Ff8zKa19v+ipej7Ozme4wqEAOFxGuvvLmYKh90yvd9bo6533/Ywa8Ni78ukWej6Vucen6Fk2R+qfX7boZiw83VTf500sPEocdYwnnhrvCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YlweSxgri6zoFWXCMq9gkfdasD1NywY6f1xoHjj1+A4=;
 b=ey6hoLbhSRkCydCihZxDm5HYHpMZuomQyp9m1Fytc6K4LIaM5pWsJEoyJNaU4k1eYiCinPg5cGfswo6sRTBgiuywunTHzgHfz1X6llBfJ5fHLrkwgtcb2f+ffQ8FcBgd8arKt878KWU+EjiRjuuZL6WG10FH/Denk9LEQ347cIBBFy21g48bG06qs7y/Uh9l5RT+A5G1t/nVUF/Naa+GK++J6o4lYEKOuoKAKr92i4rVhluVRY9OI6pdvbsNHA1fj+/4XdArlMyGdgNj6L++SdOQnPD3Ey8QON1St25NlGpk6k5/CH36+M3bw46JylUnOjXSWzhAgyXtfxw7MLf3QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by BL3PR11MB6484.namprd11.prod.outlook.com (2603:10b6:208:3bf::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.31; Wed, 13 Sep
 2023 22:36:47 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::25ea:ab9f:da46:2ce5]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::25ea:ab9f:da46:2ce5%4]) with mapi id 15.20.6792.019; Wed, 13 Sep 2023
 22:36:47 +0000
Date: Wed, 13 Sep 2023 15:36:37 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <ZQI5dVsxMgMaNSD2@nvishwa1-DESK>
References: <20230912235159.2111118-1-matthew.brost@intel.com>
 <20230912235159.2111118-2-matthew.brost@intel.com>
 <ZQIqzAEKoSPTuDeU@nvishwa1-DESK>
 <ZQIynNeRQLB5ZyBc@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZQIynNeRQLB5ZyBc@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: BY3PR05CA0036.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::11) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|BL3PR11MB6484:EE_
X-MS-Office365-Filtering-Correlation-Id: eee39c59-0e1f-492f-a974-08dbb4a9e9d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JZeRdv+izj9bTi4gZNZNFOWVzi8HcnTqsWtqfrnRTxazZAivyfi/ljKC2p0BRlicy3w61Kg/HZCOXjeMKPXa73VmKtO5lTfqarEm2nWVuPxEd7+c4K9QyD4uiIAwPIIlJ8pxIhGJyuVrCyq2yl3P9674JhYJ7eIQYONHoOnGdK5XQHye726lguI7oPwhh2W1JNir8kBiZGfZddmpq8YdXa/H8UvrUlhNh7Ue0mHa5g9vAelbQEAI/DaeHHnKNC0ejY0zo6nb70hJNEF193uSmIQVFEkY3FmvmZ2J/55ofHUKz7k/FNLlIvZLGRoebXz5o6Boog3gBt9Ii8vL97DCM9EzLxfenZlB+HE1jzo0X2N5+GVY9ioaUsaIf6gX25rYu50PxieM7iUVj5FG2J/kRzoKAQ0tOK9qnPA60ivcmiqtxVwygCTdBZzbZaDJUBefK3KJCKjyR4GAVF35yAiiCfQymdfua8geF2toh5mHIjmEmUCYER36QbP0pDvLLT2G4L6+mPK7zbDas5ZxLQ5tH3EbMhkXrXoJLlzTCX9PIyfoLhl0w7gnaulS4O0g7Du+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(376002)(346002)(366004)(136003)(39860400002)(451199024)(186009)(1800799009)(6512007)(83380400001)(9686003)(86362001)(38100700002)(82960400001)(6506007)(6486002)(26005)(478600001)(6666004)(2906002)(8936002)(316002)(66476007)(8676002)(4326008)(44832011)(41300700001)(66946007)(6636002)(5660300002)(66556008)(6862004)(33716001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?F3yJWCeJbCefnqzPlzp0fkoTm8E/XzImFApCri72e5b2m9DCiMPqjiaZWBP2?=
 =?us-ascii?Q?7vQcp1KqUBY/adf7LbMtgCeU+OeRijVAXp7BazZEfeXrTsmBUtU6iGk2Eipk?=
 =?us-ascii?Q?WMo1igP2BGkVNmQlC6GX5Vk1CpkLssZg0+gssoqSMyMiDFUIQi/Lzuzi7nxb?=
 =?us-ascii?Q?izqnDcUro449O0y93w01WLscnWZolZBzS99wgPd7Xhb+gPN6PrTk3MH3HKqi?=
 =?us-ascii?Q?oBEG6b+gLU6EwgM1mXiJL33t3LpZlEsmljwxfns73qm3G8n7UMox0IWjz66c?=
 =?us-ascii?Q?b/+4wEDLDGfrDEwNVwLtlnxEv36IEHVQ06b9dvKimE7xl4hWfYEiZ9CoyBJV?=
 =?us-ascii?Q?zInyvECVSG6EnNlh+OlTfiHHNwwkJBw133WzlDqIldSobgQNE4lzmWDVhn2/?=
 =?us-ascii?Q?GNv3jfyL5zjSrtjKGYVD+NIfVzG15ee3eQRxW/UGYpFuTAEMoZ9HVUx5n5Bu?=
 =?us-ascii?Q?+TtrC29W5x5dwoVL8rhOXfCuPqR48uMc9sR79r79UDihUVxuPrOLDX6S92Li?=
 =?us-ascii?Q?7z4BoCQbyj2DCYj/A1CB6LYWFn3I0UXkk68u973MsNUYhaobVuQvhx/l2CPN?=
 =?us-ascii?Q?A4OAOnmIjc6Kd9n0ZDBbqZio6X1NFrrVcaXc8uDBhPpmxNfH1u2AJiI6mhDY?=
 =?us-ascii?Q?dVTd4gMLbTu2iDR/cw5PdXJz4uvKAx3C/V9lcqRIko2c60W2xVq2x5SXhfgo?=
 =?us-ascii?Q?ZjozQ4mU8R5DzosdGttdMvisqfKlwVvTrCyOYOpIkcUAHWBrzLmasq09ZMiW?=
 =?us-ascii?Q?Bc0PEKq82YhoEI/3U0zEDlK+5aFYc2oKqPso8kRBWOOuLo4wKqNRgIEoA4cm?=
 =?us-ascii?Q?j2Phs+5vaj9+cYvt9QCx3WiCE5etlCU1NqCIus2SYkUGoWS/45ZEeCxy+C43?=
 =?us-ascii?Q?nLDKRyi3zZzcv7sx75HeGvnxk2RHG6p/u+rK72uceAjXGDMkSSxYAGP7Uj3p?=
 =?us-ascii?Q?/Fwds4aLGfhcJeTo6LRIKAuCvLoNtSYq5ZQCv0OgJOiUN+x+dvEXTse2b0FD?=
 =?us-ascii?Q?cLf+UoTXQJyQdyAkyiXBTuyOQblQOv9SFcmyhByuGBUIg+h5vGCTecpiv7JN?=
 =?us-ascii?Q?/HAATWNy0tCR7duwhVQwnxCkn2HYBYkIF6wWzTrft6ael04ZRuyahSXxTiiO?=
 =?us-ascii?Q?f54xAIJqhsq2cTElSvvmUOjG3s78KuaAfGgrcmUCkRugxLc8uvUo8JoU9kuP?=
 =?us-ascii?Q?z848JzGgYn9FVC1YLIIhjBq35oma2Lxp6BESw+cd2YraN9Le9N33uuOsP9kM?=
 =?us-ascii?Q?lT7cDKEKuheIQ31tdA+yM+hYVOCr//jZ53NygNjE+7bGYsKkUtyQKrtFvDd9?=
 =?us-ascii?Q?s5m9vJaKH2IctZ9qIQQRBgQm32h6ZIhOGWIWGKovUcgA/BY0CniMIqXQE8C2?=
 =?us-ascii?Q?vHIHZOmYJmsAgEIXa8QBAMCsrl6YOUPOi0BP7gfVvXh0CEp/iD4R+xBFCML9?=
 =?us-ascii?Q?CN4vRlBKRMtV8d4D+f2Mh+MmEMrGWYAdkIFROGht7g75XOoty6VAnDIGxkp/?=
 =?us-ascii?Q?GTng6nkZO/VH2QhtjL68yltTL8VB7bpLOJhf6S77OKi5oXgP/di7bbIwxJb8?=
 =?us-ascii?Q?s5HX1BcmQ0Ddt1K7ncrMr0l7XfG7JTZemEsep4Hmq9q+9MNehSJrKVCmqQdi?=
 =?us-ascii?Q?y8PvPArYTmQvOD41Izjyv98=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eee39c59-0e1f-492f-a974-08dbb4a9e9d0
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 22:36:46.9696 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hT0UnOYQjzTHS1YhJxthFfpi1isChcbLb7WJI4T2EhlDLSJERbIJXRIJJripB0cVClfpkDJHs7+iAH4IC0G2ND8msdxSwuRGBq5J4E5rsKmpCXAWsEwlKs6IrgfspfgX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6484
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: Deprecate
 XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE implementation
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

On Wed, Sep 13, 2023 at 10:07:24PM +0000, Matthew Brost wrote:
>On Wed, Sep 13, 2023 at 02:34:04PM -0700, Niranjana Vishwanathapura wrote:
>> On Tue, Sep 12, 2023 at 04:51:58PM -0700, Matthew Brost wrote:
>> > We are going to remove XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE from the
>> > uAPI, deprecate the implementation first by making
>> > XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE a NOP.
>> >
>>
>> So, only make it creation time parameter, right?
>> May be mention that in the commit text here?
>>
>
>What? This was a creation time parameter that had to had match the VM
>setting, now it is a NOP.

I meant setting it based on what mode VM is in.
Basically, I think the commit text should mention why this change
is being done.

>
>> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>> > ---
>> > drivers/gpu/drm/xe/xe_exec_queue.c       | 57 ++++++------------------
>> > drivers/gpu/drm/xe/xe_exec_queue_types.h |  6 +--
>> > 2 files changed, 16 insertions(+), 47 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>> > index 6725157d8c1d..ac392bcf7bc8 100644
>> > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>> > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>> > @@ -323,39 +323,6 @@ static int exec_queue_set_preemption_timeout(struct xe_device *xe,
>> > static int exec_queue_set_compute_mode(struct xe_device *xe, struct xe_exec_queue *q,
>> > 				       u64 value, bool create)
>> > {
>> > -	if (XE_IOCTL_DBG(xe, !create))
>> > -		return -EINVAL;
>> > -
>> > -	if (XE_IOCTL_DBG(xe, q->flags & EXEC_QUEUE_FLAG_COMPUTE_MODE))
>> > -		return -EINVAL;
>> > -
>> > -	if (XE_IOCTL_DBG(xe, q->flags & EXEC_QUEUE_FLAG_VM))
>> > -		return -EINVAL;
>> > -
>> > -	if (value) {
>> > -		struct xe_vm *vm = q->vm;
>> > -		int err;
>> > -
>> > -		if (XE_IOCTL_DBG(xe, xe_vm_in_fault_mode(vm)))
>> > -			return -EOPNOTSUPP;
>> > -
>> > -		if (XE_IOCTL_DBG(xe, !xe_vm_in_compute_mode(vm)))
>> > -			return -EOPNOTSUPP;
>> > -
>> > -		if (XE_IOCTL_DBG(xe, q->width != 1))
>> > -			return -EINVAL;
>> > -
>> > -		q->compute.context = dma_fence_context_alloc(1);
>> > -		spin_lock_init(&q->compute.lock);
>> > -
>> > -		err = xe_vm_add_compute_exec_queue(vm, q);
>> > -		if (XE_IOCTL_DBG(xe, err))
>> > -			return err;
>> > -
>> > -		q->flags |= EXEC_QUEUE_FLAG_COMPUTE_MODE;
>> > -		q->flags &= ~EXEC_QUEUE_FLAG_PERSISTENT;
>> > -	}
>> > -
>> > 	return 0;
>> > }
>> >
>> > @@ -365,7 +332,7 @@ static int exec_queue_set_persistence(struct xe_device *xe, struct xe_exec_queue
>> > 	if (XE_IOCTL_DBG(xe, !create))
>> > 		return -EINVAL;
>> >
>> > -	if (XE_IOCTL_DBG(xe, q->flags & EXEC_QUEUE_FLAG_COMPUTE_MODE))
>> > +	if (XE_IOCTL_DBG(xe, xe_vm_in_compute_mode(q->vm)))
>> > 		return -EINVAL;
>> >
>> > 	if (value)
>> > @@ -742,18 +709,21 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>> > 		xe_vm_put(vm);
>> > 		if (IS_ERR(q))
>> > 			return PTR_ERR(q);
>> > +
>> > +		if (xe_vm_in_compute_mode(vm)) {
>> > +			q->compute.context = dma_fence_context_alloc(1);
>> > +			spin_lock_init(&q->compute.lock);
>> > +
>> > +			err = xe_vm_add_compute_exec_queue(vm, q);
>> > +			if (XE_IOCTL_DBG(xe, err))
>> > +				goto put_exec_queue;
>>
>> Don't we need the below checks here?
>>
>> if (XE_IOCTL_DBG(xe, xe_vm_in_fault_mode(vm)))
>>        return -EOPNOTSUPP;
>>
>
>No. If xe_vm_in_compute_mode is true, xe_vm_in_fault_mode must be false.
>

Yah, makes sense.

>> if (XE_IOCTL_DBG(xe, q->width != 1))
>>        return -EINVAL;
>>
>
>This check was stale, parallel engines should in compute mode now.
>

Looks like we have an IGT gap then.
Should we keep it until we fill validation gap?

>> > +		}
>> > 	}
>> >
>> > 	if (args->extensions) {
>> > 		err = exec_queue_user_extensions(xe, q, args->extensions, 0, true);
>> > 		if (XE_IOCTL_DBG(xe, err))
>> > -			goto put_exec_queue;
>> > -	}
>> > -
>> > -	if (XE_IOCTL_DBG(xe, q->vm && xe_vm_in_compute_mode(q->vm) !=
>> > -			 !!(q->flags & EXEC_QUEUE_FLAG_COMPUTE_MODE))) {
>> > -		err = -EOPNOTSUPP;
>> > -		goto put_exec_queue;
>> > +			goto kill_exec_queue;
>> > 	}
>> >
>> > 	q->persistent.xef = xef;
>> > @@ -762,14 +732,15 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>> > 	err = xa_alloc(&xef->exec_queue.xa, &id, q, xa_limit_32b, GFP_KERNEL);
>> > 	mutex_unlock(&xef->exec_queue.lock);
>> > 	if (err)
>> > -		goto put_exec_queue;
>> > +		goto kill_exec_queue;
>> >
>> > 	args->exec_queue_id = id;
>> >
>> > 	return 0;
>> >
>> > -put_exec_queue:
>> > +kill_exec_queue:
>> > 	xe_exec_queue_kill(q);
>> > +put_exec_queue:
>> > 	xe_exec_queue_put(q);
>>
>> Not directly related to this patch, but now that I am looking at it, probably
>> the function exec_queue_kill_compute() should be renamed to
>> xe_vm_remove_compute_exec_queue() and move it to xe_vm.c?
>>
>
>Yea exec_queue_kill_compute should be cleaned up. Can do in a follow up.
>

Ok.

Niranjana

>Matt
>
>> Niranjana
>>
>> > 	return err;
>> > }
>> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> > index 347d28442701..f73b9e80b25a 100644
>> > --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> > +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> > @@ -60,12 +60,10 @@ struct xe_exec_queue {
>> > #define EXEC_QUEUE_FLAG_PERMANENT		BIT(2)
>> > /* queue keeps running pending jobs after destroy ioctl */
>> > #define EXEC_QUEUE_FLAG_PERSISTENT		BIT(3)
>> > -/* queue for use with compute VMs */
>> > -#define EXEC_QUEUE_FLAG_COMPUTE_MODE		BIT(4)
>> > /* for VM jobs. Caller needs to hold rpm ref when creating queue with this flag */
>> > -#define EXEC_QUEUE_FLAG_VM			BIT(5)
>> > +#define EXEC_QUEUE_FLAG_VM			BIT(4)
>> > /* child of VM queue for multi-tile VM jobs */
>> > -#define EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD	BIT(6)
>> > +#define EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD	BIT(5)
>> >
>> > 	/**
>> > 	 * @flags: flags for this exec queue, should statically setup aside from ban
>> > --
>> > 2.34.1
>> >
