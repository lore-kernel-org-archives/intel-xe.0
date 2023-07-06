Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9A45EB64D9
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jul 2023 15:16:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7434010E431;
	Thu,  6 Jul 2023 15:16:49 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91B0310E431
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jul 2023 15:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688656607; x=1720192607;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=80KnSBrpwXuroPpx9wg42UynWTaF5Hcy3oilo3DDtuo=;
 b=UtivTS1r42bAAVEBM4ypWEJyFZ4KNztADaM/iCnNzJJ4Wh/eL/N1Zslw
 buqb0obG+uplPbsb446UYBXrmZavGAxEjfmzJ1RT3MvnhKRbqklq0Tlx7
 7XqF4lYZMTbFIo6bLBe7yM2+07DFX4/OJCwSZua/Cmz/LCMN/zf8q31Nx
 7sU0RBJbyScVymT/14ZBqUnDbBGvMxqC01ZfaDVRKVynpJ3nypLaxAlr0
 nC9ZB0F1cLjABS5MjuNlNkyeyOh4Pi5iLusU0LCEydVR58rIf1psxH/hJ
 BZUtJeF9xqh0eyzIP/7UZYKjXImKv98GDTao5o4TA9Ejqyup6rV3yPZmM g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="429669468"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; d="scan'208";a="429669468"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2023 08:16:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="893577242"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; d="scan'208";a="893577242"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP; 06 Jul 2023 08:16:18 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 6 Jul 2023 08:16:18 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 6 Jul 2023 08:16:18 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 6 Jul 2023 08:16:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Er5JWVOjHgEIYipJ2yNCbjxo+2aD6IjBZiSHzenoU7EN6j+ZYlee/FhXb73Jni4kMvgVUm7VJ02pD/jI5+QPKgzeqNE7aKXJkfHrUjLKr+FJLcxPQHPY+N5tmZHm3Yb86sU1RNK3uVQDuB83mJx5Pg6wR4XWhAp3NyqEXnJusJLJuZ9ZBB8tDLnhHahBsNq0MTJjuxFV9gWheYuQy7zZl7DqmPsqHczBTKI9xX6NBO9dukbasFt4DhJ5hTw9KkyjSlHfV2PbarMVe3ztX1vyNsWc7Vqg7RXCsSezuZ/h3EcZjVRlM0KRcYpqOyj8jRq/5/vwaOZ3k2xmzZfS3e1zKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vvawMy5OeqWrqGWx6Rkbg8i+Db0lkgPROpyc89HQWm4=;
 b=UF42nITsoMFkG8nx4wm++7oF/nf3S69sHY8AlcpDwSskhIq8Z86AXQrepL2CKBHsz1DW+/Z3pWZs0yvOfUMFvk7N/Oy14dSbS5FYTzMqcNxhan2kqGNXaDaV8Ck/rUExi70i1X8Si4hWWpUbrjmjTeNMT6876U+dtHJs+rlA0te3mAmXkX8C9dDXDo7wi3784AwxQOBXuv1eHxH1+8LRmYx91A4WLopCCKeKMg03fBHMSizjlNGhjC4zfd0JPgHAgpJd/qEQhZd/4urHfR1u04vf/mx2G3Vhs/Wtno2AhRw/v5xy+JRIqDtfyUS+jXQczVXd3ucq1NNI7KWVXCx4sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB7776.namprd11.prod.outlook.com (2603:10b6:208:3f9::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 15:16:15 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::c65d:c846:f197:3ca5]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::c65d:c846:f197:3ca5%4]) with mapi id 15.20.6565.019; Thu, 6 Jul 2023
 15:16:15 +0000
Date: Thu, 6 Jul 2023 15:15:35 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <ZKbal3xBVGfJyX+D@DUT025-TGLU.fm.intel.com>
References: <20230705160602.237213-9-matthew.auld@intel.com>
 <20230705160602.237213-12-matthew.auld@intel.com>
 <ZKY8Bgldf5j5K2KC@DUT025-TGLU.fm.intel.com>
 <b8ba02aa-b916-3e61-c197-47b14ce71d7d@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b8ba02aa-b916-3e61-c197-47b14ce71d7d@intel.com>
X-ClientProxiedBy: BYAPR08CA0050.namprd08.prod.outlook.com
 (2603:10b6:a03:117::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB7776:EE_
X-MS-Office365-Filtering-Correlation-Id: 21011743-7e6e-4cf1-402f-08db7e33f0b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZYxRbtCrusPsnWOH7P9sMCmXuHAMb2FWs3QUZjpNILo4AN6Z5FUjVR5aCUlv7v2H4h+wIF3x4bC4HwPheEF7C9n9MfcBAeLlD6GFXXRLCtgD5Sxyef+eE74L7NfbeG61uZHpj9z0TkUNbZOp0CHMtiz7sjJxeWb38yngc45Wth4xjV8kOsWNkJpKeZ6gC0EgD23SYjibtvJ2BxxrlrVt4X6X2bdj51h7rqNUDX7BxglQ2ZK5mvzbZ86qhbcmvDfQesTefLp41aVbdwYatZrucW8kcg9F4ZmaMPNjZPvnAKqnUqdwckFV+GDBYAIhyeDG8t+CqyrwXl1gzmVWPS/8n7XA16HpCOdDRQMp4+776VXYhqzFx4GnWxrrP5zEgCRYwMt/KMyoSI+G4TN4jbm87yBUqwXoeL7+V/qlep6hIM7JOdg0Rll8mwBbQYHPOjWNrr8Mt4nKaYldWQnkh9nMu/XVIoa7a48oEfrcxgp/oglRR0iNF9yFTX94OH4uiIAYqM+rlQbq/vmqmVPjks5i9VNxba3Qk/i/1xXPnjALT3L5YkvDQiiPf9E3jVylW1jIdgQzlD4n950vV3Iz7oee6abIMBKSeYL9j4K2u6FLi1M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(39860400002)(366004)(346002)(376002)(136003)(451199021)(83380400001)(82960400001)(38100700002)(86362001)(6512007)(6486002)(6666004)(6862004)(41300700001)(8676002)(5660300002)(8936002)(478600001)(44832011)(316002)(6636002)(2906002)(4326008)(66556008)(66476007)(66946007)(186003)(53546011)(66899021)(6506007)(107886003)(26005)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?4ChD7LzMXoNkGF22eE7J8eK3AczWhcCvqamtrFIGb+vVDvi29XrXLH9e5M?=
 =?iso-8859-1?Q?Dgo1Zw7IP5i5wcU7aG3Lj2LDvsRj/6+N8RGkicz9rzyBEDgn8UppQ2J6RJ?=
 =?iso-8859-1?Q?iZZ3hw5kpsvCFNaOW/GUnqF1gbz3Wc0fAbp/NhRVaDmNApB774eiEbXSTy?=
 =?iso-8859-1?Q?MUuWlvXfM7MYjhW47XiG13ptTB8/5pr9/fwuGcD6gi0FVMZtMuV6pUeyNY?=
 =?iso-8859-1?Q?IsoPzqPose5/GtELyZfNtUNeWxVSQ1Nc6R318BySQFF2Vs8pRpLSrr6sIr?=
 =?iso-8859-1?Q?kvHNk/S6xexCNBz9oDUAg5GkyYZSOhBVksH9flg0j+/8vygYTj6hA/ApF9?=
 =?iso-8859-1?Q?HCXPZd23WJlcrNLj+fXQsQfnyuR+VH+ySCdcqOLMjKqWyiNP91Ohkzywwn?=
 =?iso-8859-1?Q?Ms/M4jOcep+SsQrcD6o0hDZtsTdl6aOW6Qk6nUmONFxoLfens1Oow+nKdV?=
 =?iso-8859-1?Q?v6IcfIzgvmz6dJG923KrV+ST8MfVBfEWxnhQAkUsgVnmj8VhFG39j3XJVj?=
 =?iso-8859-1?Q?eBEVC5E7pcZilt5qEEk6kOdpL3/2GamORlXEIbxGR0VH4GODmF2j0zHMKH?=
 =?iso-8859-1?Q?CIEec22zEOV27EhWo5TTod1vzIpzpGI+7lw+uo7b7PUrObp9WmoxYIl8iP?=
 =?iso-8859-1?Q?TTtdZ3ctDNRbcHUOUUgjuIB+66p/o9Vki2+ThpgKbQa8yE4R8bo5Sr0Htc?=
 =?iso-8859-1?Q?opS7rFHOTf1kEeeCKBBoHYZOfwFm1+NR3511uaJat1QXgZN7+B0MydA1kN?=
 =?iso-8859-1?Q?bJkGrzO3AzZOvtwaJvkRFFBZ3rK0OeWx95V4QPieXNVHUcaZ1SLjAw4wi0?=
 =?iso-8859-1?Q?zvLfMwPCc5FyWaaM0/vAL+Dwv9PWiQmbKGbepD6XZvtoUz/tjX8OA5kSDy?=
 =?iso-8859-1?Q?R9ZBPGznOPjkNtLyQ8jB/vFHk+w2KG103dtHy5/SKgmh1ln2CRRoXSJ2eu?=
 =?iso-8859-1?Q?gLoJE5q5XGwHH9HWmQC9rwCHT1sZ7cMzJ4F0m/8QE4I4FTzkvfnrdk8tiH?=
 =?iso-8859-1?Q?1XTr5Qhi3bRsO9k4uVPqPWzQptBgHzza1qhoG8aq3qvXqME4pPDUhtc6wF?=
 =?iso-8859-1?Q?2+vsyp2z+RFkC718lLpSzvveWt7fd08OvWG++mE8YU438ZhMf+lQRgKvVo?=
 =?iso-8859-1?Q?uNlEuduG2YRcGf2ENyIsEn+HTR8lOerZ/lzHLK3gTpi6fikHXWSdf/yncO?=
 =?iso-8859-1?Q?bTlXPHVzXGRjpRdSgX7ZMQiHNGBOHMz4HJBnM3UwmJlT/xyKhNLNOSymll?=
 =?iso-8859-1?Q?SxZy5l4aiSP1vWtW2YfjGBfWUfB5efizuPT6Dj5bHs9n0T+PPziZaYtTfE?=
 =?iso-8859-1?Q?mRG7Zs8RNSuUULb2zrfe2htfuAX7IjqKDf+fO/lKSEcZSlZ/qszyapTqTq?=
 =?iso-8859-1?Q?humdolWQyX4HeSXMHoef0MT+Rn3hhqzDRg3H6tadXl+5LlR43NRls2q6Jo?=
 =?iso-8859-1?Q?vqlNSwM8KDeZn4p4HVNHlRtWXuvtM0s8pNdgOMhlljXPBKw87zakjUEi2z?=
 =?iso-8859-1?Q?cDPPEAdDSU1J1exAD6AU9bLoJEpRXW/2D23S3t2Ia1X2qsnHnwv3Jjharo?=
 =?iso-8859-1?Q?Ag9x6+VY6kPd9rEfmxgPR/SvlFwWZ8ybOwUtkdPKQu6lU9N07+TcOH1yiT?=
 =?iso-8859-1?Q?dY6RswKPUM+JA1EvNcMVbIqDa4yjAL8OwJWki+cQWoOyG91OK4YO3zfQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 21011743-7e6e-4cf1-402f-08db7e33f0b7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 15:16:15.1518 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mCcWTgo0ZybhV+a9Z7oAwtVq7nGg7AAU7BQ4r2R8pyx6rzLGFcWU0gP+PgQzoQzVWeLxB5TvLhTPcUd33xsjTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7776
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 3/7] drm/xe/tlb: increment next seqno
 after successful CT send
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

On Thu, Jul 06, 2023 at 10:42:37AM +0100, Matthew Auld wrote:
> On 06/07/2023 04:59, Matthew Brost wrote:
> > On Wed, Jul 05, 2023 at 05:06:06PM +0100, Matthew Auld wrote:
> > > If we are in the middle of a GT reset or similar the CT might be
> > > disabled, such that the CT send fails. However we already incremented
> > > gt->tlb_invalidation.seqno which might lead to warnings, since we
> > > effectively just skipped a seqno:
> > > 
> > >      0000:00:02.0: drm_WARN_ON(expected_seqno != msg[0])
> > > 
> > > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Cc: José Roberto de Souza <jose.souza@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 11 ++++++-----
> > >   1 file changed, 6 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > > index 2fcb477604e2..b38da572d268 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > > +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > > @@ -124,10 +124,6 @@ static int send_tlb_invalidation(struct xe_guc *guc,
> > >   		trace_xe_gt_tlb_invalidation_fence_send(fence);
> > >   	}
> > >   	action[1] = seqno;
> > > -	gt->tlb_invalidation.seqno = (gt->tlb_invalidation.seqno + 1) %
> > > -		TLB_INVALIDATION_SEQNO_MAX;
> > > -	if (!gt->tlb_invalidation.seqno)
> > > -		gt->tlb_invalidation.seqno = 1;
> > >   	ret = xe_guc_ct_send_locked(&guc->ct, action, len,
> > >   				    G2H_LEN_DW_TLB_INVALIDATE, 1);
> > >   	if (!ret && fence) {
> > > @@ -137,8 +133,13 @@ static int send_tlb_invalidation(struct xe_guc *guc,
> > >   					   &gt->tlb_invalidation.fence_tdr,
> > >   					   TLB_TIMEOUT);
> > >   	}
> > > -	if (!ret)
> > 
> > Do we now (after this entire series) have the another race where the
> > below warn could fire as the CT fast path executes before we update the
> > seqno value? Would it be better to just roll back the seqno on error?
> 
> Ohh, so we do the CT send, we process the g2h message double quick on the
> fast-path, before we even had a chance to add the fence to the list? I
> missed that. Maybe easiest is just to sample seqno_recv here under the lock,
> and signal the fence directly if the seqno was already written. Thanks for
> catching that.
>

Yep, that is a race is the later patches, in particular this snippet, right?

 	ret = xe_guc_ct_send_locked(&guc->ct, action, len,
 				    G2H_LEN_DW_TLB_INVALIDATE, 1);
 	if (!ret && fence) {
+		spin_lock_irq(&gt->tlb_invalidation.pending_lock);
 		fence->invalidation_time = ktime_get();
-		if (queue_work)
+		list_add_tail(&fence->link,
+			      &gt->tlb_invalidation.pending_fences);
+
+		if (list_is_singular(&gt->tlb_invalidation.pending_fences))
 			queue_delayed_work(system_wq,
 					   &gt->tlb_invalidation.fence_tdr,
 					   TLB_TIMEOUT);
+
+		spin_unlock_irq(&gt->tlb_invalidation.pending_lock);
+	} else if (ret < 0 && fence) {
+		trace_xe_gt_tlb_invalidation_fence_signal(fence);
+		dma_fence_signal(&fence->base);
+		dma_fence_put(&fence->base);
 	}

So before the list_add_tail we should check the recv seqno and possibly
signal the fence? That makes sense to me. 
 
> I don't think there is any race with updating tlb_invalidation.seqno, the
> receiver side only considers the seqno_recv. So not sure it matters where we
> increment tlb_invalidation.seqno so long as we are under ct->lock and
> ideally don't leave it incremented on error for the next user. I can do the
> roll back instead if your prefer?
>

Right, so this patch itself is actually fine. It patch #7 as discussed
above that needs a fix.

Ok, with that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> > 
> > Matt
> > 
> > > +	if (!ret) {
> > > +		gt->tlb_invalidation.seqno = (gt->tlb_invalidation.seqno + 1) %
> > > +			TLB_INVALIDATION_SEQNO_MAX;
> > > +		if (!gt->tlb_invalidation.seqno)
> > > +			gt->tlb_invalidation.seqno = 1;
> > >   		ret = seqno;
> > > +	}
> > >   	if (ret < 0 && fence)
> > >   		invalidation_fence_signal(fence);
> > >   	mutex_unlock(&guc->ct.lock);
> > > -- 
> > > 2.41.0
> > > 
