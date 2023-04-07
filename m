Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E21F9C76196
	for <intel-xe@archiver.kernel.org>; Fri,  7 Apr 2023 22:36:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 755BA10E106;
	Fri,  7 Apr 2023 22:36:56 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B20BD10E106
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Apr 2023 22:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680907014; x=1712443014;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xVVb75OBoS2HESRVqKHgRpkgRD+4X0nqhGiNuXLIg+4=;
 b=UZ0QA9vnP/PevWd9K+Qu+gfF+ZPEVe0I7PstHzZ9twQpxdwDNGOILRv6
 Xk+mXP0gB+ner0DLN15VwlIPxWn8LnohhrnMJt3B8THjreqHPeUPoZ+5Y
 4tblz/PRFr4L6B8fLfskMY0x0P+YftNqGpMh0LGVPZDOKuogYYUyhZDGD
 vTV3zRJtHMSrewB253GyEN2dNgJVIc6WmqJRovdnScVf4Lp4YG7DcNI4S
 wSfG4o9CUp0dJxmvblAnHVt/MP6sA/uh5OHhuXfWMNHlmMwKPaD+/xJp5
 QSSKkQI81j7iilmkeqrBEOJoUW7oUWmLsDe4xbSqwwNnqkrNx0r/Pzc1U Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="408214591"
X-IronPort-AV: E=Sophos;i="5.98,328,1673942400"; d="scan'208";a="408214591"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2023 15:36:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="1017389832"
X-IronPort-AV: E=Sophos;i="5.98,328,1673942400"; d="scan'208";a="1017389832"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP; 07 Apr 2023 15:36:53 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 7 Apr 2023 15:36:52 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 7 Apr 2023 15:36:52 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 7 Apr 2023 15:36:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KDTyssMcmUVnUsTW2yHyx+8TCWyvUCxezOBgPzF3nCu/OkGyUyJ9bQkNqkjI8ajvVNkBA/rHN7zRj2ndksA78MvdBdyiRGR8NGpzB9zNC5mcu+7/F5pFlFT/YZ+Dw1WGm+yGuRZSaff7uHGkNG7HclsFVI/mve9s5uulUTbSHmy8J+WqcDOtfupvwEloRgaJUi8QTefGLCtjmaiWXjcxU/Yqie0DwFZoVOTjEPA44cPGDL3nnf/eKJDA/DGY+7dl/9ePadpMjDjouWDOTQkh2TLZQciGRfCmOY2tyPMex9jU/5/g6pd5mDFBRpyW5pc/NR/UEUjjOv3C5bMl23n/0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DwalwPh/dHR98wxpSlsNItP59Ny5GNOhVloLTW+mIy8=;
 b=I0WrQnruhyGKBBVqX/MrKXdoRzuBax1fvPRpe7Wcmbokr3l5PB1TZ1MUaBUTLPTp3csaib1IFLIeaAWKSL7JtXB7ZZ1+3jK6huNVVHjDTut0xfsi1wVfqqMoxjjokEfwndTnr4lnSuacSuw5+UtPKk6op8AIUl7JCSbo92uDoqSadY5OKYX6HAIW243eRGiMF6p6Qr+cNYhyH9IpUQKGockv5Z9qq4eqttHkvC03w7nOvR+r/YAneRZpy8248/F25R1H+qarImsIK6bi3a5IywI25ZeCpUlx2Fbh2Gcs3FxGvil294AmTjKi33jf6r0KsqxJ4JMlBztV9nphbRPCgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB6940.namprd11.prod.outlook.com (2603:10b6:930:58::17)
 by SA1PR11MB6663.namprd11.prod.outlook.com (2603:10b6:806:257::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.33; Fri, 7 Apr
 2023 22:36:50 +0000
Received: from CY8PR11MB6940.namprd11.prod.outlook.com
 ([fe80::69f8:7f28:f29:2876]) by CY8PR11MB6940.namprd11.prod.outlook.com
 ([fe80::69f8:7f28:f29:2876%9]) with mapi id 15.20.6254.030; Fri, 7 Apr 2023
 22:36:50 +0000
From: "Chang, Yu bruce" <yu.bruce.chang@intel.com>
To: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>
Thread-Topic: drm/xe: Fix memory use after free
Thread-Index: AQHZaaFxUnBel0y2Mk248xQRqXfeEQ==
Date: Fri, 7 Apr 2023 22:36:50 +0000
Message-ID: <CY8PR11MB6940AA5317F3420E9BF23167C3969@CY8PR11MB6940.namprd11.prod.outlook.com>
References: <mailman.11033.1680902204.925.intel-xe@lists.freedesktop.org>
 <CY8PR11MB69405E2F7676808F46E8E20CC3969@CY8PR11MB6940.namprd11.prod.outlook.com>
In-Reply-To: <CY8PR11MB69405E2F7676808F46E8E20CC3969@CY8PR11MB6940.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB6940:EE_|SA1PR11MB6663:EE_
x-ms-office365-filtering-correlation-id: f8c12557-cf39-4628-43e4-08db37b89436
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tXBSQgR+OXY50gp4CpIgKEOsyQLJr0R7jjQLl2tPXZo2hDkO+UGV6gma6q9ZMGccocA4uCebRTvY+2IVmtf+V7L9e96o3WZQmIqw7QOwzunTViN+FYu9wW7P+gELf+yJ2IhZCGoRXiIqS3JhKjbT3d6vG4wiS+rSyN3efTRRw4uWevs+l/6Of5VVu3h7tLV8ms7UHqQ8TLr7tqUzf3yTgXoEpspbSwrcS2LDeBLemzYg9b30/cphG/DMA/c9ZL1Hq8hKuYa4SnbXpg7KxhwnbvEsCxqDXP2uSm/IYtL8DzBtlJhzDCfkIGfuGEXszHi65AkabsLi5qiupB57CSubvnUbj7Yd4hcMGXOkcZij+I4sdMzev/XopxSUVmlQacqrTwtstzvGkEfaPf1tQX/wCbeiQ1h4uV2xM331MkgVp/gjFqnS2RHnu/VoeoHTAUCotpFNlhMlB1xJEVsYNwj51araNBW7ejsbHfK4I1yfoeZ7sDU0SO8LXoleo/ISQNAZyrYU/I7zGw+godTkPu1vVkolw3sOP5+SnwDfunPogvL/jeL9n+n45Qw/rz3zh3tTZW37FU/1LIpa+RL7m/c5UZxZocUHB6uRtCISdNyozn+A+fEF+bG/CQ11r8WUyms+
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB6940.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(346002)(39860400002)(136003)(376002)(366004)(451199021)(316002)(107886003)(478600001)(6636002)(54906003)(186003)(122000001)(41300700001)(64756008)(76116006)(82960400001)(2940100002)(33656002)(9686003)(26005)(6506007)(7696005)(71200400001)(8676002)(66556008)(66476007)(66946007)(4326008)(2906002)(5660300002)(38100700002)(55016003)(66446008)(38070700005)(86362001)(83380400001)(52536014)(6862004)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?FkYxAZdn+aLDs4oLmuk8Ivv+aJ40F7YiO1igha/cM3qMZPvcHEdZN184II4q?=
 =?us-ascii?Q?HiiGcEbl5xWbv3v3iCDfuvFr6PH3jOc1zXhJ9SDdZ+1YHMKcUwA/81pGUei4?=
 =?us-ascii?Q?qmvX1cgoEsZD1GexW4ei6LO6+IU/JcOaIBGOyCMDniqw+R9pZygmsV2EwxEI?=
 =?us-ascii?Q?RYrU0vhbbJGoJLLUN9AbRcDzipYgQmUwKObOHkP9ZgjchxP81RmJqsk7m7jq?=
 =?us-ascii?Q?P4nBnHje0dp7ucgSE7WSn8VlLSdnep+j+FwEwP1L40xH9F4BsJP8I0FJePjA?=
 =?us-ascii?Q?cLyYuSx/rlQ4rP7CXd2/Qmg2cAfJYp+U9+vUUjfrUidJKSR4P76Dd8RD1fMW?=
 =?us-ascii?Q?mivCvZXaWrxkD5bRPsYbWQPmwRf9WiavkP0G/0U32VJCuyxYqIruSjn1Q9U8?=
 =?us-ascii?Q?ZhqvURIkEIcYbbsLrv+mPSweBVQYYPo3Qu9EXTzNNCsJrVzP2YimpBIp38Sz?=
 =?us-ascii?Q?szdv292+hCzmTQ3gJFXb/elGp2cOZz2Yzt5EekTgrLC4D94gFRZgfakusodp?=
 =?us-ascii?Q?vWRAsvFcr4jLqBW9nzxOAZTL4AnL/6vak/wb6nqIQ8QfgVDk+3h9NpM7cOX7?=
 =?us-ascii?Q?KOx51na0Ast8ergcCxuM0VWawY1Bg8lUNB9LxAnkV7jlQuueGvR8DlLezfqY?=
 =?us-ascii?Q?GCSlFustZ7HFeL4/JOHx5JEvlyzfjyQ5KTxb0gBZfV816YZePbjUcIlbaqSr?=
 =?us-ascii?Q?PPv8gD6AqsokkJ2bC0wpXjNgAvhgTCl4H65wreVnh0Tkq+gtJwX96Zz68FgZ?=
 =?us-ascii?Q?8NsahEej+ehng9ua8VQ2+3iYekzPJa43saAjp8aJhVhDyBmN9J+LTBAe+BAc?=
 =?us-ascii?Q?KLTgKNmajxZvGuoo9Alr0o40HcoFjtt42BA7NrJx2l1r8mu/QBXKkoYz4L/f?=
 =?us-ascii?Q?Fi04ndmU05WNzPdCfdwhiRUlNS+rRhd0ufr/MVZnfx5PbGsxP1fVjkcE0+yC?=
 =?us-ascii?Q?yD5LEmx7FFrICiF7d4cyOqLr78JM3uemqQKP7UPmVuTQ4IogWyUFiPQlKhMz?=
 =?us-ascii?Q?1XzI4vxmKidAhZu6swOb6PgpQXbpS0aP23ndPeDel/iKyYk4EJEkKnFlEnIW?=
 =?us-ascii?Q?w7fYIHrnjlem84GQ+kdId7HRvSaTqXTnFIWLoZdoH6kX62lal+1Nu0of5RUR?=
 =?us-ascii?Q?2L8q228rNVcR/KlZm2mIaI6jAdtNjTybS5dW5RMFLz6aT7yLvusT8Bl8p4Pa?=
 =?us-ascii?Q?QobZvyeA41+uUG8yy+QEvIrie7/Aso5JRN+I7ZlIuG8VjCu044l8UI3gzslk?=
 =?us-ascii?Q?AL5qpducgDJ868BgsX7EicKzSZ9uCVD2tj6N43t0wBunHIyXARf1Lbo2CFtR?=
 =?us-ascii?Q?iKzQZMgI7d3bLcNSP/2p3o9UtkUt8BnCIadaAYk4+tYCdSqm6mZmabvYtna9?=
 =?us-ascii?Q?j5q9UxZbL9pB3YeZYb8VObzw7HnN4Rq5JA3OsUTRP/nK/hbbTpd9HfqEdYmU?=
 =?us-ascii?Q?guuxu09GzwIMvtPyZn5syninB3MXsJutOEp9JRSvdiB/aPznBBhm4DHCwUCX?=
 =?us-ascii?Q?cIM97fjLUK8Ks9MAMTXFrqgnmRz5jr4bJS53CPmc/1i1MRZCROs036uy5P0a?=
 =?us-ascii?Q?nbhoEc0qU09i39N2QaqSTqacZ0011CDJw2gsX7XN?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB6940.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8c12557-cf39-4628-43e4-08db37b89436
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2023 22:36:50.2860 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Nf2A4ULkGI2IKsjP+4nBFBM87e5/TOfFHOiWg0d4QIDMblEzE+llnpk+LJ28E4FzYYLfpUTdN+Ax/w71mP5vU8QpDzPFVmY0/Z6zZ6EFiHk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6663
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] drm/xe: Fix memory use after free
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
Cc: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


So, the original issue is due to the race that the sender can see the
g2h_fence.done get set and leave the stack before the wq wake_up call.

Now the wq is global, but since there is a unique condition check, the chan=
ge
looks good to me.

Reviewed-by: Bruce Chang <yu.bruce.chang@intel.com>

> Date: Fri,  7 Apr 2023 14:12:31 -0700
> From: Niranjana Vishwanathapura
<niranjana.vishwanathapura@intel.com>
> To: intel-xe@lists.freedesktop.org
> Cc: matthew.brost@intel.com,	matthew.d.roper@intel.com
> Subject: [Intel-xe] [PATCH] drm/xe: Fix memory use after free
> Message-ID:
> 	<20230407211231.10137-1-niranjana.vishwanathapura@intel.com>
>
> The wait_event_timeout() on g2h_fence.wq which is declared on stack
> can return before the wake_up() gets called, resulting in a stack out
> of bound access when wake_up() accesses the g2h_fene.wq.
>
> Do not declare g2h_fence related wait_queue_head_t on stack.
>
> Fixes the below KASAN BUG and associated kernel crashes.
>
> BUG: KASAN: stack-out-of-bounds in do_raw_spin_lock+0x6f/0x1e0 Read
of
> size 4 at addr ffff88826252f4ac by task kworker/u128:5/467
>
> CPU: 25 PID: 467 Comm: kworker/u128:5 Tainted: G  U 6.3.0-rc4-xe #1
> Workqueue: events_unbound g2h_worker_func [xe] Call Trace:
>  <TASK>
>  dump_stack_lvl+0x64/0xb0
>  print_report+0xc2/0x600
>  kasan_report+0x96/0xc0
>  do_raw_spin_lock+0x6f/0x1e0
>  _raw_spin_lock_irqsave+0x47/0x60
>  __wake_up_common_lock+0xc0/0x150
>  dequeue_one_g2h+0x20f/0x6a0 [xe]
>  g2h_worker_func+0xa9/0x180 [xe]
>  process_one_work+0x527/0x990
>  worker_thread+0x2d1/0x640
>  kthread+0x174/0x1b0
>  ret_from_fork+0x29/0x50
>  </TASK>
>
> Signed-off-by: Niranjana Vishwanathapura
> <niranjana.vishwanathapura@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c       | 7 +++----
>  drivers/gpu/drm/xe/xe_guc_ct_types.h | 2 ++
>  2 files changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c
> b/drivers/gpu/drm/xe/xe_guc_ct.c index 5e00b75d3ca2..9055ff133a7c
> 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -23,7 +23,6 @@
>
>  /* Used when a CT send wants to block and / or receive data */
> struct g2h_fence {
> -	wait_queue_head_t wq;
>  	u32 *response_buffer;
>  	u32 seqno;
>  	u16 response_len;
> @@ -142,6 +141,7 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
>  	ct->fence_context =3D dma_fence_context_alloc(1);
>  	INIT_WORK(&ct->g2h_worker, g2h_worker_func);
>  	init_waitqueue_head(&ct->wq);
> +	init_waitqueue_head(&ct->g2h_fence_wq);
>
>  	primelockdep(ct);
>
> @@ -484,7 +484,6 @@ static int __guc_ct_send_locked(struct xe_guc_ct
> *ct, const u32 *action,
>  			void *ptr;
>
>  			g2h_fence->seqno =3D (ct->fence_seqno++ & 0xffff);
> -			init_waitqueue_head(&g2h_fence->wq);
>  			ptr =3D xa_store(&ct->fence_lookup,
>  				       g2h_fence->seqno,
>  				       g2h_fence, GFP_ATOMIC);
> @@ -709,7 +708,7 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct,
> const u32 *action, u32 len,
>  		return ret;
>  	}
>
> -	ret =3D wait_event_timeout(g2h_fence.wq, g2h_fence.done, HZ);
> +	ret =3D wait_event_timeout(ct->g2h_fence_wq, g2h_fence.done, HZ);
>  	if (!ret) {
>  		drm_err(&xe->drm, "Timed out wait for G2H, fence %u,
action %04x",
>  			g2h_fence.seqno, action[0]);
> @@ -801,7 +800,7 @@ static int parse_g2h_response(struct xe_guc_ct
> *ct,
> u32 *msg, u32 len)
>  	g2h_fence->done =3D true;
>  	smp_mb();
>
> -	wake_up(&g2h_fence->wq);
> +	wake_up_all(&ct->g2h_fence_wq);
>
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct_types.h
> b/drivers/gpu/drm/xe/xe_guc_ct_types.h
> index e0f9063e9b65..fd27dacf00c5 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ct_types.h
> @@ -74,6 +74,8 @@ struct xe_guc_ct {
>  	struct xarray fence_lookup;
>  	/** @wq: wait queue used for reliable CT sends and freeing G2H
> credits */
>  	wait_queue_head_t wq;
> +	/** @g2h_fence_wq: wait queue used for G2H fencing */
> +	wait_queue_head_t g2h_fence_wq;
>  #ifdef XE_GUC_CT_SELFTEST
>  	/** @suppress_irq_handler: force flow control to sender */
>  	bool suppress_irq_handler;
> --
> 2.21.0.rc0.32.g243a4c7e27
>
