Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF6F4D5B154
	for <intel-xe@archiver.kernel.org>; Mon, 28 Oct 2024 22:00:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48FF010E081;
	Mon, 28 Oct 2024 22:00:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b9aw9eKz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98B4910E081
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Oct 2024 22:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730152801; x=1761688801;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XOjYcwNPVr2v4IPDA4MffEvf0Yg8/9IcKAm52YCSqqc=;
 b=b9aw9eKzYkgrEwTlO/piMThs/xGfb2pzRBLaUpBlfPQ+ZN+viqGk4uCW
 mPb2F+V8t6a1AWRVRS6TL7HeO5mRRe2A328Tc66soJ+eQjzgfi1mL9kQq
 rxIFqWqxBmnF/1tEohEtMt0mTRNv4IWXAvuUHMqXjvNpAcQxfn3Teu8pe
 T6p/YFuivQxRXTNl49tXnCKlFpmu0T6dZKjN/h4Ta5UC1FnFcbcxe5uFE
 nmAQBdcSCnnMNckW3J3R2e12FeXtrvRuFyoFINNyMlcurI4vQJ5ei0pcw
 mWIyrOyc+GtY1X9xmWJmvidjshLn2x5O8s/m/GeRr4Nok4EFnFVGPX+4y w==;
X-CSE-ConnectionGUID: fuV7A5EPQYORDq+mep8AVw==
X-CSE-MsgGUID: PhHlA2JSRrK9VpbJBbvoaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11239"; a="40347708"
X-IronPort-AV: E=Sophos;i="6.11,240,1725346800"; d="scan'208";a="40347708"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2024 15:00:00 -0700
X-CSE-ConnectionGUID: 3bVIldEhRs2sA4lDCRjxww==
X-CSE-MsgGUID: +N9o4+9DQEKI68mJOi+i/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,240,1725346800"; d="scan'208";a="105092858"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Oct 2024 15:00:00 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 28 Oct 2024 14:59:59 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 28 Oct 2024 14:59:59 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 28 Oct 2024 14:59:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g8bLtCX3f4YIm2XXOUH5CdsbSlCrgJPWQxafUhfRqiNUmJRzg0VI8P6U+cBdbSboiEL73FU/3n1jB8g2Jjo4MOLEgxWcv+yIeoYOM6T+BorssyoD9qujJRDGtEKlR9pll1TdVEr9lBAxlUs3xCdvnBf0f9fWycsCoEkg+KtuaZGueEcIwmF/NkUHqhKn9uCalKYoBSLnPz1viSMbjKpyW1ntUwEdiGxvv0fSYWYMvPG9DPVy79iFEUPwv+BNiu7X1KBCr+u/d1mVrYQxBVo1aYYacdTIvU6nxFwG+ImBxn1rWmv6xFJ1lmx5jDu/rmBhiePW19C9ZmhYAQsRrLUmSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FAXw/n6LOvRsAXQvgmmnsn9aCjIDYgMBTgJl2skrF+0=;
 b=Ji+XcL+dtR3eX0pQOruigTol5Z33mhDxtnPiSlkxAmNM/EYryivDcoPdLX1SbJIqH77bEIj2W8R3a/WiBP4Ksvo90U2bHrg1RPa1JMyp1xDC084Fj3+9n+uDjAPUbbKl0WDesMshnJpBdxU+oeduhcj8fs+3oQXvCOHHZdAJQBWQUPxiLmVEthR7EdWbzzzzVBNXQ0urIqOpm5gTUMk2h7bFXuDYRSp3VmoLXihX/1CeJIoQXNMTF4JMVAUZ9Ev1Ag+ZWXDWKQtDiQ+3ehuFWQfkxSujoymi60mmTu3eH/TiVgJNBFUMCUZpoytrIhbL7oHyGLbyxZ0CT16H6we2Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY5PR11MB6486.namprd11.prod.outlook.com (2603:10b6:930:32::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.24; Mon, 28 Oct
 2024 21:59:57 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8093.025; Mon, 28 Oct 2024
 21:59:57 +0000
Date: Mon, 28 Oct 2024 21:59:18 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>, Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: Re: [PATCH 2/3] drm/xe: Accumulate exec queue timestamp on destroy
Message-ID: <ZyAJNgDg6H4V7xAm@DUT025-TGLU.fm.intel.com>
References: <20241026170952.94670-2-lucas.demarchi@intel.com>
 <20241026170952.94670-4-lucas.demarchi@intel.com>
 <Zx/1BZ93nLSC1pFs@orsosgc001>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Zx/1BZ93nLSC1pFs@orsosgc001>
X-ClientProxiedBy: SJ0PR05CA0002.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::7) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY5PR11MB6486:EE_
X-MS-Office365-Filtering-Correlation-Id: b781a4e1-e3b1-4284-6abc-08dcf79bdc86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3zLy840ngjS3hcBFEjTv8Ewcj/S7q0pOQd4SCJ39jdDGTdxsg9qXvcQlWeQ4?=
 =?us-ascii?Q?quJ6iTnWtNRtky0gwijX+vLO56aNSa/F4LVDuZHEEGYNHroqmDDJRV5UFMxP?=
 =?us-ascii?Q?iRU5feXFDJpkjEVcPCKGtczrdu/bTnU+82do7cOnlfBCSIKoWbozT/EfK+yo?=
 =?us-ascii?Q?LOshRpl51/Dhi5deMsmf57SWMOV90EoVyrwvSBx5hGhgON7/7ULpw9RkBXq7?=
 =?us-ascii?Q?5xDPRQogR0vHEWak9at5sQ7eA2JHrUAaCtNR0z8eGJVng5+hnvmVXoAX1wLo?=
 =?us-ascii?Q?E2VtL69ZnZ3vT18veIsUDXc95BxOh2zDYGM3GulEhwpwY2kMpRNQQwBZ3eNI?=
 =?us-ascii?Q?wvdLI6FeRiYZn21ay9qdGkQnaQ3PfrlFHo+envFYnxFmTj/zwj7fz96HGWHy?=
 =?us-ascii?Q?vFJNTncZagGmLTxewSu+z5VPm7JoM948b+GwGFgT/dKUQd8961HIN5ERzMXt?=
 =?us-ascii?Q?0NczfQmsgpUAES8HUToAnf8tDB+UB2FIiRqKQ5RedgyiGS2KGaF/ZWmfUzy6?=
 =?us-ascii?Q?umMRLBd2UlFqpX2BamCR4qqvSw1JYlcmEVxHnG5PWr6ryVkfxIYyScVqqabJ?=
 =?us-ascii?Q?WQ10BRllCj5sAwzYUSnMoI9b6HvWF2A/XzGkV7K+OjL+9thkVCv1SFnCF+j5?=
 =?us-ascii?Q?7gndBLUbDeW1JbeL9L9KEhjfLzfKxb7KBZRBaDLU+PSwu3+mntin0v+ko3jE?=
 =?us-ascii?Q?liM5q9XOdUZNxyjMuYfP8Sbn3HbJNA5J7NP/Ft5nEBlt4KKBycq+T1N1yw5t?=
 =?us-ascii?Q?VLhpCqOAFj3zhBPDM6qRvbjNwoStR9snJMLkKP8PSSFGInukBDva5a/5VGKG?=
 =?us-ascii?Q?Us1uxJpBpB50KdgAJ6zWYsO7sVq+DjEIIlJRnxXiRSbya1lezmWcJ0PEfMZk?=
 =?us-ascii?Q?kLZ6Zm5mvwGKGLDq1xt6QwSR8wEsdFCATeF57X7L4gqcHWGg6Bm6KWUijte8?=
 =?us-ascii?Q?MheW1A2GXlTpPiWk6u60sBMjWCPY/riBKIO0cnDvBoD7XRTQUTHGlTXCRpk0?=
 =?us-ascii?Q?9jzI4rHW6YHEyNBoZO9vcHrf2eiNzZyquOVkh5kclI3Nb4remOyFP1L+rFfH?=
 =?us-ascii?Q?RazqFFjcZzjFjg6hiYYGz1vX8L7EWMnQzbjIddMxrkvvhHoMsBbKiJbUMDuJ?=
 =?us-ascii?Q?Bv8hwYCoYdvlehehUcRTLEb/sVwyg/AVRUcor0y99NHNtUuzA5SexI6+j8ns?=
 =?us-ascii?Q?O2t/oKRPpAcgXW73S2zdlG8NTIY1BeH5T9L4SJSlMeEshW4W7ikHJN2zoxGQ?=
 =?us-ascii?Q?N4ZxIPsSmirbSKVUvrvX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qggEJxSymJC2IX07Vfi6lrvfR2GKvNyPvMFRR99c+1Dg3oJ/6KCv3wvklcpK?=
 =?us-ascii?Q?6YzFdEHkpcBG87KH++GLtlsFbSc3NdREXgAk85GFggTjkGbzBaRpPSX0qIKt?=
 =?us-ascii?Q?FhCMZN9S/t8uaUaMNP0phrpMf/xhX8iVVdvNqC8w/KAj5Q+ejaN6FIBolVBB?=
 =?us-ascii?Q?wNvh7W7XytQ42rOYKMIx0MAc/FZi0iizgTdxl2PVRixHm6OXsMgmR9GZXGcg?=
 =?us-ascii?Q?44NM5Pn+iLMKKzF4jRk0fuHSfB5fhJ2mxCqVJfeEB/OX9SW/fIdRt2ynRG3+?=
 =?us-ascii?Q?wD4ptuARHv56NBeJF/MJcJ7O8iBtFgYIOh3OimL/FdruZmYThoToiNN/3RxW?=
 =?us-ascii?Q?Wrk+mxV4nh9EM2hE42+8jTKJk3Ld15KPCyw1JxNrkiJAsB53RUHOeVlvIr3Y?=
 =?us-ascii?Q?qiP80Xk47bVs2p0YCk8Th5c/qGreUY1PFvrBmOqLhS259tKhANjV7JYICN0q?=
 =?us-ascii?Q?OS2fq7MD/3qWFOqie9vQl+geCY8asxuBF3DAXExZ1TlmqFB0ZrQ37LDmPRn4?=
 =?us-ascii?Q?S97yj7uXuR3nOjAfLWmKztHaOIFkdekXsyBG5GkH8SLllgUpcff5wjOv9sou?=
 =?us-ascii?Q?uZTzfdRv2jFbFNbY1PCHElLTaJ5xZ820mKIoC8ilDDO0YAwMBZpjg4QZhC0r?=
 =?us-ascii?Q?whTCJCEluh7YfQNwQ7QA6proakY9n9hs0lq/rPx774HhN+N0GgjLHnLN7efd?=
 =?us-ascii?Q?cf0ZIvbsoUoKRZrtFsrx3+w3Jjj0LO/Dv3kBgcoIsmvmiGyW6EOtm16jLgk8?=
 =?us-ascii?Q?Fntaxj3LXz7frzS/eYg2MD5j0plMSxofkTuhX/vb9DIlLETKjGA2e7uKEMXf?=
 =?us-ascii?Q?PsN5Zw02ULjkWsrzEdnPC4lJ2pQSfQ02rC5NZpsAlfro3hnPzCklzVpf331j?=
 =?us-ascii?Q?LYPW3UmgQ6+1qMoiTtg26QGud09lysuJpFEHq9bMTrszHhU9gE3a1dFCsr/v?=
 =?us-ascii?Q?QgKc28gM/xvD9obPDuvaep07L9X4hwdaQ6TgFU6cYtv984I3zjU1Xm10zGNy?=
 =?us-ascii?Q?i+vJbrmqtVJnWJgOGyoCFlk7b50Rntq1NE9cM40gwdn8WkSZ3RGFCVutijgN?=
 =?us-ascii?Q?7Avc1+EYFp+qXDdOtLNfkY+x5iN8cCWb6ek4ZUsBz68uOdfGb5i1twl7qIHD?=
 =?us-ascii?Q?l5g4KIr+muubXbBtgNT/8XcdXPHkLTWpPjgJI5IT5sr5xYAq+c9uF9nN2/sJ?=
 =?us-ascii?Q?bcBgVMvE3XJEzF2pJ9kp9qZ9kWrEgPkr3OQRwVUwOrCdkMplIUUy8UXnPwq8?=
 =?us-ascii?Q?yn7ynDsI9ECh8lQvenXxNkQqcJti9jUKFfApAnqqamXrzWo60u4rERo9r0Lr?=
 =?us-ascii?Q?OHVLZeGEhgUHCWMKE61cjIu4pmEAwtJhnPK0l5WwFJOp/Y6UwJrmG0mNWXp/?=
 =?us-ascii?Q?qnXeKexfWczVjUYhC6FblVoV+piHUh1NA5fH8Pd49J/BFb9yuj2/GMl6GXkj?=
 =?us-ascii?Q?xq3Wvs+TQURLe5q2f0zIkIh+LWyETQcuiDN4H3ENW+zu5ou41aSYuuqh0ThI?=
 =?us-ascii?Q?zAbIivpn3CRM7QpRuKuLPtWYplsDEj0uyZUMhJb7dpu1o3Npj2aR5fI1Jo4Y?=
 =?us-ascii?Q?7IsVWeMZ/TILh4LriAX0uvzY0F0eVZ8ppcEYkHeHDWnJ7ve+vJdP1wwiTJE9?=
 =?us-ascii?Q?1A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b781a4e1-e3b1-4284-6abc-08dcf79bdc86
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 21:59:57.2819 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X9IwX0HoWcQhyqgDtPhRJDaxaUISOUmhjzL966A6cseAOmY7yVzArpLiS5BsdPWzV45b57VNxFc8IZgdqwHFIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6486
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

On Mon, Oct 28, 2024 at 01:33:09PM -0700, Umesh Nerlige Ramappa wrote:
> On Sat, Oct 26, 2024 at 12:08:47PM -0500, Lucas De Marchi wrote:
> > When the exec queue is destroyed, there's a race between a query to the
> > fdinfo and the exec queue value being updated: after the destroy ioctl,
> > if the fdinfo is queried before a call to guc_exec_queue_free_job(),
> > the wrong utilization is reported: it's not accumulated on the query
> > since the queue was removed from the array, and the value wasn't updated
> > yet by the free_job().
> > 
> > Explicitly accumulate the engine utilization so the right value is
> > visible after the ioctl return.
> > 
> > Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2667
> > Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_exec_queue.c | 8 ++++++++
> > 1 file changed, 8 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> > index d098d2dd1b2d..b15ca84b2422 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > @@ -829,6 +829,14 @@ int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
> > 
> > 	xe_exec_queue_kill(q);
> > 
> > +	/*
> > +	 * After killing and destroying the exec queue, make sure userspace has
> > +	 * an updated view of the run ticks, regardless if this was the last
> > +	 * ref: since the exec queue is removed from xef->exec_queue.xa, a
> > +	 * query to fdinfo after this returns could not account for this load.
> > +	 */
> > +	xe_exec_queue_update_run_ticks(q);
> > +
> 
> At this point we may/may-not have the updated LRC timestamp.
> 
> fwiu, xe_exec_queue_kill() is an async call. It will queue a work that will
> disable guc scheduling on the context. Once guc notifies KMD that scheduling
> is disabled on this context, KMD knows for sure that the context has
> switched out and the lrc timestamp is updated for this context. It may work
> well for contexts that switch frequently and may not work for contexts that
> seldom switch or never destroy their exec queue.
> 
> I still believe calling it from job free is the right thing to do. As for
> the ~120 Hz updates, these are just memory updates, so not sure if it's a
> huge performance impact.
> 

I agree with Umesh here - unsure why it is a big deal to update the
busyness in free_job.

Also the timestamp counters can wrap and if they are sampled frequently
enough a wrap will be missed.

Matt

> If the ftrace is getting filed up, we could throttle that.
> 
> Thanks,
> Umesh
> 
> > 	trace_xe_exec_queue_close(q);
> > 	xe_exec_queue_put(q);
> > 
> > -- 
> > 2.47.0
> > 
