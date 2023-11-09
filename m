Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3969CC4332F
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 21:07:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1F6510E90D;
	Thu,  9 Nov 2023 21:07:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DE6310E90D
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Nov 2023 21:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699564022; x=1731100022;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=G6On/zHLYFa2hEN+LEfMiLwJF39nkwjVJiuHPB4cgEQ=;
 b=OwrFtmBU4lLe5mOzCCxTcvxtfUfKcAoJBEqElScnEllhRyzH9h/I8Rag
 7uzZY0Ux8GCGe3jaLbemUosl/awDqRFBeVBLSRRW8oH94hu4A/5Ob6h70
 UDPTAafe9vQCx+Qr99Pk8DzoUHeFTq6xHp7X8q8MnAVLFxh5ZYrr9mzdO
 dgIoihleuW18iVi3ewL6sKekPFfDbwKgh1a+ulbhMeIjRUdwIeXtAW4Jg
 L3TWz0xAdaM5s1UhXa20wDYldaMxmIwDsvQDwVTIsPLJyNAourYMpcNiI
 un4JvHw5gvGRZhj1g1dFNa+BEhVBm9rCZHzIpnjSWzaopqP68fAwgbibm A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="369409566"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; d="scan'208";a="369409566"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 13:07:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="907259436"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; d="scan'208";a="907259436"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Nov 2023 13:07:01 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 9 Nov 2023 13:07:00 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 9 Nov 2023 13:07:00 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 9 Nov 2023 13:07:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E4nO3mqCA4lP2/oUBgZX4vEpuUZSyAeUTToujiZE2LFuS7/rY3zfdAOf3RG+6COCI7FLGgdDDh8qPTEqtmivRpijQe/l6eNiVwDhY8+JH+8SxjMD3WyACJiPnkX/QM8E17zBMlbib6xKpm4/JD9Q3zlFXLWvN4JOG3xu4zSyN/iChaVomLTJn+5asaKhsihU2ylZwcWqlcj5i1PqmXQ3z5vLi+LU0iGdHi+eE+j9GyFxiEkUbF6m3k5V4XHokh+p92nZwa/PIW+b6LwCGV3J4pX45mxBWFvysEJZCgJG3uoXEiMzyK7lZWQqtCYH219NYY7mhgd7uHnlqr5j6feL0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TyEyizzK2et6Iidi8GKepD2A6UVzKVHNzrIEg5Sl96o=;
 b=fiaiCHx3AmT/6e/v6W4FbZytZv7EZkzcQzVK0NBTXnUFBFqdv5tGohBCtAZIh/iIhasffwjAOpi+R1Hte8tNVjMh1/f0sFvsvz91XF0ykUEyHC2rw44TPGvwyA+PecrExi+dr6g04F7MidUKN/9R7qaENvrAKSuU899hIj7JYAk29eRGapgH1ZCtKNXENMLW6iAoNusK54p9R+gKtmm87AEJqkz6x6l2PQ/4yT/wmJqfV5ivqWKZmnNLmLqLJ3Ydbletpc7nAzD2nxtQZoPSEKxW4fzqdUCfj9JA4LrzxDzGX5+aj8nIza9HKUGCb2BRuPLi5NmQ4QCq7KcnL2x4hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BL1PR11MB5543.namprd11.prod.outlook.com (2603:10b6:208:317::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.18; Thu, 9 Nov
 2023 21:06:58 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777%7]) with mapi id 15.20.6954.028; Thu, 9 Nov 2023
 21:06:58 +0000
Date: Thu, 9 Nov 2023 14:06:05 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Dafna Hirschfeld <dhirschfeld@habana.ai>
Message-ID: <ZUznTeQRjfU+bBgF@DUT025-TGLU.fm.intel.com>
References: <20231107052603.124361-1-matthew.brost@intel.com>
 <20231107052603.124361-2-matthew.brost@intel.com>
 <lsvqioo7quhjuhgxigl4f4oqti7wshxdgciwivyygm2zrd2q2p@cyyuidovinuo>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <lsvqioo7quhjuhgxigl4f4oqti7wshxdgciwivyygm2zrd2q2p@cyyuidovinuo>
X-ClientProxiedBy: BYAPR02CA0065.namprd02.prod.outlook.com
 (2603:10b6:a03:54::42) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BL1PR11MB5543:EE_
X-MS-Office365-Filtering-Correlation-Id: da126f9a-e25d-468a-2c40-08dbe167cf5d
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: El/BQiUSbl8ucU2f+qj5v5Q/FGnVjrtBbM0GxUbAkIu0VMZzda1fGq1m/49uz0T+Ln2VVtgx1OHmt5S/lwgEBpsevhoRugp3lgfglQoJcyWcJjiMaUOjYwL+byQnZZgYpq41Bmh8XOH7VPv87mwFvp33MhverrZS1CHQhByNtB6XyQ308OeuQHbaASKgNBwDvslX3N/yeuI2GFIO+IdftyEP2uU+nR0xRnPye1p2+enowbECPl6P8GnP4xlzvN91tQfl9h8f3VIWpx0tTzHoPQLcgrEg0qCgfJ1xG1EVlVnAPnrcvVgIe5B+lSpETpNwmyxldQ1bYs5GN7fI0XDvYOFj9T5qK5LdXa3gk2eWJTPvuH8e700Zu+tr63+DkDCJet9qtlpPEyfUwuFe5Udb4RuZsIkf+Ey2lTPvn3Sbv+kTjvFpu0LuiQWToT8qbw6GRB2xGjIAt9ZnRlGqUYPiuBVfQwQom86Gu3r14F7ni7QRHd2LU3Jsqu3NUvbUNLfBE/xbbl7YoboXPu8H7GmF+ql2R2Ja6KLbAfFtH1UAuXn25MDRBPbmgaGsf2DFOmE+Pc90n2DfM2j1RzcitE6mG4ijj5mYWcyufDzKbMSmo+U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(136003)(396003)(346002)(39860400002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(2906002)(5660300002)(44832011)(41300700001)(8676002)(8936002)(4326008)(316002)(66476007)(66946007)(6486002)(66556008)(6916009)(6512007)(83380400001)(53546011)(478600001)(6506007)(38100700002)(86362001)(6666004)(26005)(82960400001)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0JzwqaKpHYgnzsIdHjMgYZX8iLK68hYk/pfdNynoKX1cq+suOExOWbpjHell?=
 =?us-ascii?Q?XkpiN7Odq2IKRVwYNOilFifJlkqr8D/rXOlWcXGwoeCOgZw6sEo7sApS92Ue?=
 =?us-ascii?Q?QZv77jyGtGSxiTQX2+8qEdbsQXY5WD3Jz/rpd/jx4z5NqZIN1Ur6o/2i24Ws?=
 =?us-ascii?Q?r1i3tO2XQuyYn5GHgTSzLbBgBLeM3EzABAP1sSGsJ25G4TUmbzJJWSbeg1rp?=
 =?us-ascii?Q?Ewn6PAYM5jp8SA4DV45KNGFbeBUFBTklNLVH79lt+XRexqiWEErAnUjkjzEd?=
 =?us-ascii?Q?mohdhB24zOs+HpTqES0SuO5k2euxZO68OY0XI4vszLCobneP4oHfo7ecV2K4?=
 =?us-ascii?Q?5pkQJzknE4LqIhWNO+eJ4b1oPlY3NlsOHNI3hcA8XmIiT56s8IN+DBAiMl4f?=
 =?us-ascii?Q?/FcU8qVuzv4KrCpdZKdgsNung7IRHVpHiY/6pCslxNrhE7GU97XxUYy2LZFi?=
 =?us-ascii?Q?YYx8PuQoON/316ugrLa0+xOJKvdANYTDr6aYwalYxkOjoxQq2nAIIImZohPA?=
 =?us-ascii?Q?Kv2fCS0OiNNQkUjS8DxH91AMiOOMqasAQyVs0MytCEpjeK/SuiEnOoUekiAT?=
 =?us-ascii?Q?hZG2xGaiVvEbU1Lx/pbss/uvQdNAm758Fehex/qZe3PfYdpJVwB1OQ8wYhld?=
 =?us-ascii?Q?h218NubAS1VRbD4MB5c+rZjaRK7W+SqBln3oz4hJ9Jc+sIPKt508YW+67vWX?=
 =?us-ascii?Q?ItX/8b6fnGz0FfnJKZrFii7jS9i/jj0SRowKvfx861M+moIFs4JTkwgZrpdS?=
 =?us-ascii?Q?oMJ/oaalUTRMwyp3L8UpngPXoxTg6o5Z3GSTGm6STDBTBjj39PA+dw1zkO7c?=
 =?us-ascii?Q?czuLEHwQCeJ72JdaZ6q6G/JKitYxzCRxYS2dAbQFYOKRVzacG4MccgYgz9J/?=
 =?us-ascii?Q?Jcu2yuctykqZbuZc2JSb7GQsRCMvKvIEHwdr8vkKbg1FD7SImLyjdI0nwK2N?=
 =?us-ascii?Q?VD/Bg4lVT3EkMKYQksNOLgATrsslFm/Z/5CekQUuBzYXX+4Tvnr4jBhi6BEa?=
 =?us-ascii?Q?MtXtZMr43usyEjLpbQi6gIaXG8nWHrdky2B0z1VJeVMZvqY2rx8RYJBJhU6c?=
 =?us-ascii?Q?SRzEkRBE976Pg14veDj9KHEtxVElnppVKpgcauABmn9cvzxmo0/+6hwi9Y0r?=
 =?us-ascii?Q?jdFmoB7L/cMKMp9QSEOqNO+97luSw9pGFCizLJF7sy0hc/XYqnQkXAhVdOsv?=
 =?us-ascii?Q?PdyJyoReac9WFzfoyZOONGv4joTD92g4FlSO4OJJRcX3ep2CQggMJstSu15m?=
 =?us-ascii?Q?Ps3NLtdtXOR5fqxaGgHHosaVlSMHc/+lXP7Ec/kaAnU7f21yn91qo1pnbKsy?=
 =?us-ascii?Q?Q6PBjD7QW8ZgUZh2YfWTRyjFApGwSeoQqNx/JzYD8iAIKUsTWtuQqh3LE7DV?=
 =?us-ascii?Q?gogbJEiC5J7TMbgJZkYraVO4VRej67OR/qGMtlUCrsVFiFTaarzVxzu4ILnY?=
 =?us-ascii?Q?+Tq0gItLwpceDJSGh2jvG0uLN+DPORt22GqflcO7qEB/YeqDjHiEDFJpqAHl?=
 =?us-ascii?Q?3gYdoSBSVej6ovfNsXVtRh9oJHsMwjz68RQcxvJXUTI86Dwa/bSbLBwEdrdG?=
 =?us-ascii?Q?/Zn+mKSD4ZbOF0A05LXl/fVBHX6j30HMk++3epK5RdFUtov/TAuOrAxf1bPs?=
 =?us-ascii?Q?Ig=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: da126f9a-e25d-468a-2c40-08dbe167cf5d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2023 21:06:58.1412 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zyx6czI7BV1my42D2+9Oi6imqJWLBBrX75BIzES7IeI1o53XA71t7xgt7XilqnfHxtMWdmzv+K9mQxWjSslcmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5543
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 01/27] drm/xe: Allow num_binds == 0 in VM
 bind IOCTL
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

On Wed, Nov 08, 2023 at 12:55:35PM +0200, Dafna Hirschfeld wrote:
> On 06.11.2023 21:25, Matthew Brost wrote:
> > The idea being out-syncs can signal indicating all previous operations
> > on the bind queue are complete. An example use case of this would be
> > support for implementing vkQueueWaitForIdle easily.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_vm.c | 30 ++++++++++++++++++------------
> > 1 file changed, 18 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index d26c90f0d702..403444ff3856 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -2850,7 +2850,6 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
> > 	int i;
> > 
> > 	if (XE_IOCTL_DBG(xe, args->extensions) ||
> > -	    XE_IOCTL_DBG(xe, !args->num_binds) ||
> > 	    XE_IOCTL_DBG(xe, args->num_binds > MAX_BINDS))
> > 		return -EINVAL;
> > 
> > @@ -2977,7 +2976,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> > 			goto put_exec_queue;
> > 		}
> > 
> > -		if (XE_IOCTL_DBG(xe, async !=
> > +		if (XE_IOCTL_DBG(xe, args->num_binds && async !=
> > 				 !!(q->flags & EXEC_QUEUE_FLAG_VM_ASYNC))) {
> > 			err = -EINVAL;
> > 			goto put_exec_queue;
> > @@ -2991,7 +2990,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> > 	}
> > 
> > 	if (!args->exec_queue_id) {
> > -		if (XE_IOCTL_DBG(xe, async !=
> > +		if (XE_IOCTL_DBG(xe, args->num_binds && async !=
> > 				 !!(vm->flags & XE_VM_FLAG_ASYNC_DEFAULT))) {
> > 			err = -EINVAL;
> > 			goto put_vm;
> > @@ -3028,16 +3027,18 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> > 		}
> > 	}
> > 
> > -	bos = kzalloc(sizeof(*bos) * args->num_binds, GFP_KERNEL);
> > -	if (!bos) {
> > -		err = -ENOMEM;
> > -		goto release_vm_lock;
> > -	}
> > +	if (args->num_binds) {
> > +		bos = kzalloc(sizeof(*bos) * args->num_binds, GFP_KERNEL);
> > +		if (!bos) {
> > +			err = -ENOMEM;
> > +			goto release_vm_lock;
> > +		}
> > 
> > -	ops = kzalloc(sizeof(*ops) * args->num_binds, GFP_KERNEL);
> > -	if (!ops) {
> > -		err = -ENOMEM;
> > -		goto release_vm_lock;
> > +		ops = kzalloc(sizeof(*ops) * args->num_binds, GFP_KERNEL);
> > +		if (!ops) {
> > +			err = -ENOMEM;
> > +			goto release_vm_lock;
> > +		}
> > 	}
> > 
> > 	for (i = 0; i < args->num_binds; ++i) {
> > @@ -3092,6 +3093,11 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> > 			goto free_syncs;
> > 	}
> > 
> > +	if (!args->num_binds) {
> > +		err = -ENODATA;
> > +		goto free_syncs;
> if args->num_binds = 0 is valid, then it might be confusing to indicate it with err = -ENODATA,

-ENODATA gets concerted to 0 at the end of xe_vm_bind_ioctl. Internally
-ENODATA indicates to signal out-fences. 

> Also , it is invalid if both args->num_binds and args->num_syncs are 0 right? if so maybe
> add XE_IOCTL_DBG for that,

It is not invalid rather just a odd use case.

Matt

> 
> Thanks,
> Dafna
> 
> > +	}
> > +
> > 	for (i = 0; i < args->num_binds; ++i) {
> > 		u64 range = bind_ops[i].range;
> > 		u64 addr = bind_ops[i].addr;
> > -- 
> > 2.34.1
> > 
