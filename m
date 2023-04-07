Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0566C6FD1D
	for <intel-xe@archiver.kernel.org>; Fri,  7 Apr 2023 22:33:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ECBE10E106;
	Fri,  7 Apr 2023 22:33:33 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4F2010E106
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Apr 2023 22:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680906811; x=1712442811;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Zo5eGVMZhF5rNZEgSdZ/wwfskGng5vgseRwc6qUNrkM=;
 b=V3UHuNKwx6e1KgZ1yszsRD3J6v2q/ulG7suef0zfVFpqTDpoVXefs9/k
 HZBngzy2cx7aCTlJ8xEuIlGUcn8tTuM2PJgm/p8wtt/VeXCf+MM9E81ov
 J/d0NiaFo9M5acIyQqB6bBs6dgPDgfUlMtXtHMZ/a7paTDoVvDwq87G8a
 vSe0UsvCqw4IJ8JhUDkazYRlquVFB+vgT6JymgiMMhNA4iaOfOpn+HLEP
 jFe5cxK9ZvrzFcZEm5r6Jabx6PhWUwC2pI/z0XPdD6aO8Uu0p0EoT3hQY
 JQfq4cOsSlXcRbYKRe5l6MPdzPXBzK+/DlARXbCVeWtRDEp0ZovWH4YVD g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="340566847"
X-IronPort-AV: E=Sophos;i="5.98,328,1673942400"; d="scan'208";a="340566847"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2023 15:33:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="637837923"
X-IronPort-AV: E=Sophos;i="5.98,328,1673942400"; d="scan'208";a="637837923"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP; 07 Apr 2023 15:33:30 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 7 Apr 2023 15:33:30 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 7 Apr 2023 15:33:30 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 7 Apr 2023 15:33:30 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 7 Apr 2023 15:33:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c3OOKE7ymS4yXKJNypHt/L8suEqiJJlr+amhfSD5/YLWhJhev6PCvTk5q0Fq8qx3czbG9yYbfiMUXM4B0R7BZaTLttgevzPHCAeNHHbe1bdvtBmq6dE5yYRnwKikAlSx1kkPFLRlRS1a0IbSeLKmC1bbs2791aLhOF3PKwakQMNamEAch0tZnPEG9FzrKoSp0AZ/tuOE42X7xpoHKzigWo/Om3pKzWyW02l0qjcdfpct3eLc4QCxGvQgd+NHhxKMK/UIGknAHZjyfU7s5jfNywJMSZbMMvE4d5/kgt9TE5kQgoWnGxT1dxn+TOXE8PDNfAxB6tvI3RuTxO/vGMPnKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rtbj8Ttrv0RtwZwhqRT2dVSTdIR5PAwiwJSebghWhYU=;
 b=ijk3mo0CXmNAKsvoUaieJHy0AAGrH8v8qV2GHbZvldO4lYJA7+69MlTpPCRlrI7kt91ucMOLHc0qKdMsUDlvdQ5s9TDCfP1hBulS6FXHeFwyShi+5frZbjeUnLW221OVglPOJydP5Ry+/tJNZOw372koh/oJwWBnogX45vG6xcpFtwtJCnjocIraCEYhYo041CrY32LlloYwY0Nzx46ABYdxiuHfBsrqijBKtlCkWOkHD7Wz5kXvS3h5WPXnoGoGBl0muudtZYlf9P7mDJ6oOaS0am6GDSCBln93wqzTjezDNdfymvnc1Lvg24/GVU/mQK81X0LLBF12DA3qGYI5zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB6940.namprd11.prod.outlook.com (2603:10b6:930:58::17)
 by CH0PR11MB5329.namprd11.prod.outlook.com (2603:10b6:610:bc::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.34; Fri, 7 Apr
 2023 22:33:27 +0000
Received: from CY8PR11MB6940.namprd11.prod.outlook.com
 ([fe80::69f8:7f28:f29:2876]) by CY8PR11MB6940.namprd11.prod.outlook.com
 ([fe80::69f8:7f28:f29:2876%9]) with mapi id 15.20.6254.030; Fri, 7 Apr 2023
 22:33:27 +0000
From: "Chang, Yu bruce" <yu.bruce.chang@intel.com>
To: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>
Thread-Topic: [Intel-xe] [PATCH] drm/xe: Fix memory use after free
Thread-Index: AQHZaaD4b528KUQIR0OkTWwQK7rEgg==
Date: Fri, 7 Apr 2023 22:33:27 +0000
Message-ID: <CY8PR11MB69405E2F7676808F46E8E20CC3969@CY8PR11MB6940.namprd11.prod.outlook.com>
References: <mailman.11033.1680902204.925.intel-xe@lists.freedesktop.org>
In-Reply-To: <mailman.11033.1680902204.925.intel-xe@lists.freedesktop.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB6940:EE_|CH0PR11MB5329:EE_
x-ms-office365-filtering-correlation-id: 031dae28-9e93-4de3-50cd-08db37b81b23
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: G1lPXlkAob15QsPUTwt/ObOigBpMptcipWkRKtZ8tRYM3IXoI685uR3XPWu5am24YfYcMz+qZlJ5ZhwH3iyARM4BvxrMGfe2x0HMCWWeKVTAAD7cSLONgTCEnlo32RX4jwcyBAB0dU0hT1lQ3JIVpkKOOWvYmKSvUkFg0xBV3eWQNbThiKYGQgytytIu1kFy0ToG9bPEBWoMy7VwVfhiH1cCyfIzzJx/MJXRoRyOidBg8Iv8kL5EYxxZvbD7bx0/G7DvGHESP9tHOmz8PcI17u0NQ2jsxQ/6jinK8bL/+O78aLqz5QsrnO0ldvlLy5gYTvvmQojXuozPZGEdysRYqZW3wbp9qv43YL3tzqJ7i2F6rZDInlxYSSLa2gKOBUu3JBd1XznIlKNWKCAoNAwicpiOEzTQvhYDREf6vL1bhlLOQ05ly7ltc/y7RVLfOpNEP0g6fM5ZBVtmrO39ZiPq4Ko069SnvPCsFGhFYj6DS2IPuRE/S82P9XjVrb3OimW6tl6elHtJLM+MS5+pjSPmD0b8KY1IS5SCpSyRPM6OB66gx/+YWAfDobgTdZoglUJ0IlvN5va9ruRMlt43BxXyG3ieLHymFLywzLvSIrytw7JR19MJe3CdUWbNFV4QoqF0
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB6940.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(376002)(366004)(346002)(136003)(396003)(451199021)(71200400001)(86362001)(52536014)(8936002)(6862004)(38070700005)(7696005)(4326008)(55016003)(478600001)(33656002)(41300700001)(66446008)(76116006)(66946007)(64756008)(66476007)(8676002)(66556008)(26005)(6636002)(54906003)(316002)(107886003)(83380400001)(6506007)(186003)(9686003)(38100700002)(2906002)(82960400001)(5660300002)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?iQK7+xOsdn/wKolPyNlEmzwje5I3sbdhk1GJR0hIL8aCe4HjG0Hbmre4fWaf?=
 =?us-ascii?Q?Ki7jBhD9O3+yAEhN2e+wLwWGSorpylxBy+0+VCylLQfE+XTeHnwRALRupiwU?=
 =?us-ascii?Q?pc7kub8kUAtLAlGXnJ36kroI8JcjSxsLpPO4A3MsgTX2YMX9hwzRzA/cxGTY?=
 =?us-ascii?Q?udm4S9MLCYUurgKVjeR3eUa8GWOZqNt0fINzl4f1R7BGcK6erLrTgTNBN5ZV?=
 =?us-ascii?Q?c7iZgrQUriodug4UOzqDgu62hy/v2OsJh6rCzzXynuBvGXkIo8hZ4hKb7/Nt?=
 =?us-ascii?Q?OK5ghCJNfEQh8HFzqfG3Cl9dzL/Fi8CGBYviRYH/8nlhB9NYb0uX6LbCmOkJ?=
 =?us-ascii?Q?I/u9mLBWbw242yyX1AZFlmBGUP4PDIcCyxeWYuSgNt8GwlAE1YMjgW9JCCsJ?=
 =?us-ascii?Q?1z5RlT0gt5uNMLTCeadG21HMqsDHdKgIX8xSZ1CddBcpRp5yGLDyxfAXmVVz?=
 =?us-ascii?Q?kpjhqavBuoWSVY7sCzp7g/nnrxU+6Zsly0/LeuwX4Gc+tDrIwsqBd7Gb4kgx?=
 =?us-ascii?Q?VvVm/mpgFBcMh8WOqfciuEIyXiCLKfY32245zcFRd1bTBj3o5wUwJiRlv4at?=
 =?us-ascii?Q?WpfsqlQuHZj+71pb9kI7cKsqQYlRH1w/L6I2nnPkOF05UUrRjJ2XBvwbQ0dr?=
 =?us-ascii?Q?FJlxb5MsNgY8ewwEzyCpJIxEkIDqJcPPHTaUmEgRZZFdC7vLG0Xhzy7cS3EV?=
 =?us-ascii?Q?FO5aFjrfho5QenM5a8XNwoVpXETfdVycJTVzhj6BTxosjfNVVWIBQrqiTdsM?=
 =?us-ascii?Q?OdyhHevwOo2FHcrFlQMws8oyDzxKEMLRhCwz1cnjAD4FXtfZs6Uhnqee1oDh?=
 =?us-ascii?Q?vzdEH0ApTv7Wd/UdKUaLJELTX3z0rIpRZ/jpykMyryWIAxF2bUu8IZ0QGoCH?=
 =?us-ascii?Q?sfjS4SVKusLdefIKRrx6z7PrqMoz544BOz5ZLVsN+IoJtiVJrjmgt/v2UxPb?=
 =?us-ascii?Q?WDLW5d7RPYk9Bd/B2ImI1cBhBKjJq46sY2Iwuk/6vWANCor+cFcjZzWS6x77?=
 =?us-ascii?Q?0q+DLu3Vmvve2j51p02f5RmDLnE4KhfUdOiXRoN9K6uCvbsxdGQjldl0IlBX?=
 =?us-ascii?Q?BlEWO3ehwjKaXFotEwNCqiYGAEhhuB9LLGijMfRJ7BUgZryqtd83cIFh6IDc?=
 =?us-ascii?Q?ErTxWfbOhKxLML8Ke7JWe47HRU2lq1criG9gy3YxlIvzZvfr0Bpr1ZxsJKo5?=
 =?us-ascii?Q?Hj8+IZl2VVqKRNtxER3DXBE/6eH7CET+O6iN4Q/hN5lsXq9MrH5WRnr3zxSo?=
 =?us-ascii?Q?JB7ElmFcAz/RaVGpazeZH7FLOb5V29Cn39KKdbfLI7NUeQPn2sOpyRIeRCAo?=
 =?us-ascii?Q?ngEsEEv/mHjt8Rh5KKCCR5i6BUbezUIGx7XEJXuYgzmIXahhmTe+YX3rYKon?=
 =?us-ascii?Q?rPEeUmWHRyPk3HJz72CIQbmnC+UucSMv4ZecajCIG4w7oDLVOsaLynmhf90Y?=
 =?us-ascii?Q?iD1nFo3Lx92nkYCK/Bzc7TzuO8j3MvCqSQptfVvFX5UzfbXPXICZFpjUDyXx?=
 =?us-ascii?Q?L9bug/KRqOSBoZk5g129B/0aQ9dwQ7kwzFTgpI6sWmi2GgHr1vo2f5/Wj9Hc?=
 =?us-ascii?Q?hpSh7D7xiRDhqOsB6muLTmx5/O0PjATzXLxYHO/E?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB6940.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 031dae28-9e93-4de3-50cd-08db37b81b23
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2023 22:33:27.1659 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yqpiKlqcNvz9oDaviqeyRviYYLVaMbwXtGQiMVqWJD1+P4yxOQ4jT8MDF0jTsPXZKAJeD679f+totadv72vNPf5xXFWgHYq1NWB2UCauDKc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5329
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Fix memory use after free
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

So, the original issue is due to the race that the sender can see the g2h_f=
ence.done
get set and leave the stack before the wq wake_up call.

Now the wq is global, but since there is a unique condition check, the chan=
ge
looks good to me.

Reviewed-by: Bruce Chang <yu.bruce.chang@intel.com>

> Date: Fri,  7 Apr 2023 14:12:31 -0700
> From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> To: intel-xe@lists.freedesktop.org
> Cc: matthew.brost@intel.com,	matthew.d.roper@intel.com
> Subject: [Intel-xe] [PATCH] drm/xe: Fix memory use after free
> Message-ID:
> 	<20230407211231.10137-1-niranjana.vishwanathapura@intel.com>
>=20
> The wait_event_timeout() on g2h_fence.wq which is declared on
> stack can return before the wake_up() gets called, resulting in a
> stack out of bound access when wake_up() accesses the g2h_fene.wq.
>=20
> Do not declare g2h_fence related wait_queue_head_t on stack.
>=20
> Fixes the below KASAN BUG and associated kernel crashes.
>=20
> BUG: KASAN: stack-out-of-bounds in do_raw_spin_lock+0x6f/0x1e0
> Read of size 4 at addr ffff88826252f4ac by task kworker/u128:5/467
>=20
> CPU: 25 PID: 467 Comm: kworker/u128:5 Tainted: G  U 6.3.0-rc4-xe #1
> Workqueue: events_unbound g2h_worker_func [xe]
> Call Trace:
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
>=20
> Signed-off-by: Niranjana Vishwanathapura
> <niranjana.vishwanathapura@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c       | 7 +++----
>  drivers/gpu/drm/xe/xe_guc_ct_types.h | 2 ++
>  2 files changed, 5 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c
> b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 5e00b75d3ca2..9055ff133a7c 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -23,7 +23,6 @@
>=20
>  /* Used when a CT send wants to block and / or receive data */
>  struct g2h_fence {
> -	wait_queue_head_t wq;
>  	u32 *response_buffer;
>  	u32 seqno;
>  	u16 response_len;
> @@ -142,6 +141,7 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
>  	ct->fence_context =3D dma_fence_context_alloc(1);
>  	INIT_WORK(&ct->g2h_worker, g2h_worker_func);
>  	init_waitqueue_head(&ct->wq);
> +	init_waitqueue_head(&ct->g2h_fence_wq);
>=20
>  	primelockdep(ct);
>=20
> @@ -484,7 +484,6 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct,
> const u32 *action,
>  			void *ptr;
>=20
>  			g2h_fence->seqno =3D (ct->fence_seqno++ & 0xffff);
> -			init_waitqueue_head(&g2h_fence->wq);
>  			ptr =3D xa_store(&ct->fence_lookup,
>  				       g2h_fence->seqno,
>  				       g2h_fence, GFP_ATOMIC);
> @@ -709,7 +708,7 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct,
> const u32 *action, u32 len,
>  		return ret;
>  	}
>=20
> -	ret =3D wait_event_timeout(g2h_fence.wq, g2h_fence.done, HZ);
> +	ret =3D wait_event_timeout(ct->g2h_fence_wq, g2h_fence.done, HZ);
>  	if (!ret) {
>  		drm_err(&xe->drm, "Timed out wait for G2H, fence %u,
> action %04x",
>  			g2h_fence.seqno, action[0]);
> @@ -801,7 +800,7 @@ static int parse_g2h_response(struct xe_guc_ct *ct,
> u32 *msg, u32 len)
>  	g2h_fence->done =3D true;
>  	smp_mb();
>=20
> -	wake_up(&g2h_fence->wq);
> +	wake_up_all(&ct->g2h_fence_wq);
>=20
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
>=20
