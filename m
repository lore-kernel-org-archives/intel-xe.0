Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F56CC47DD9
	for <intel-xe@archiver.kernel.org>; Fri, 22 Mar 2024 19:40:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03C2010F06F;
	Fri, 22 Mar 2024 19:40:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mNHFAnIU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFFF810F06F
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Mar 2024 19:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711136399; x=1742672399;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=km4dsSdnXV62aHpphyInmHUiqLzybh+5iNHom/vULSQ=;
 b=mNHFAnIUhD0LQI8IPJ3eGbK38AV1bJCVJiXtn1SOJlViiNVAd/Fp1lLX
 SNgq7VAMjHg+8vgHp2uGMUCpkyxzIU1w8heHzqSSrSzuw5BqozF31iD1v
 u5Oc80N9UN0/xxsOPLWRVrzVK52FldcUXIkd09/sT5dSe4fxGETNujk+3
 A+CfqFBp9gOsW092TmtJMTIB7LVyaBJexXA1VpHl09kTrs0h7F3pLiQnc
 aYTqEqZchFDel6k2wghrcKq9tOTr9S8gZAEh7cYd4gqtnqgiko+/c3520
 DHGke2oYso87Iqy3EVmzUp+lQecgqhHLzsKKPspByyB5oSd1ULMRbyqes g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11021"; a="17595301"
X-IronPort-AV: E=Sophos;i="6.07,147,1708416000"; d="scan'208";a="17595301"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 12:39:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,147,1708416000"; d="scan'208";a="38139491"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Mar 2024 12:39:55 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 22 Mar 2024 12:39:54 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 22 Mar 2024 12:39:54 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 22 Mar 2024 12:39:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gBN6BsWD0Sxmi0/neMSPXTPkdWt9LVGwmSRoDP/dK7TFrEmxhQeqo2GjTI/iFbyrWlsSnX7tZoKkkDbWxjktJjZpOC6MngrMJmd4NOFgjLrHqMYib08E/S5zzRkJoz+SAfYs/J1g6RpEqevptU4WGDIEFt6NkRihara/2kOY+Tt6CEaFU/SDaj884DcIDmFpy7PIH6SmwD26PqZp7poakkx6hBzeZ1Sagdazw7y9GfGRpr84TIZhbe8NQmgGQx02hSMMgOy9tSPPhFNeO8ur2ZM+aUaaixBHUq6AOEjf5iA5UKXjD38pLEL8LIWc5tXnfFJXWYdQOL6GT5Dgg0sEhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OlVHk2Dpl91j92Bg6hw5BpDNEnoGxB+CyZzZF6qK+Pg=;
 b=Q8Oij2uy/82OHg6WjJ0J4VGaDvPlXE0tFluKzdbEKk7w9HG5H923Jn697JDkZuE8bFqD3+NNbskzQrHcWdLM0YUCZskcZMT4/SpUT5WHEynmbJStF1DSv5eTQsN/SuYbIYMSGGdgaoaMy+JlpC5rCaCuwlz8k6bjZSPZjBmwlliY/Humx5cYKVEXGK886ab1NiIfdaTURI4acZAl304QxW2p/p38MeI6rWJaNE8pti7ue3pj3xtf3vvFm5bePonpsej/ZsIMZlQAyTR+qrQH8ErUeAlYbE7Do1P5zVCqTFsczFirQUIMPTGTpFlPF3mdZG2cyuQQWkR1RJdQ0j6eag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by SA2PR11MB4778.namprd11.prod.outlook.com (2603:10b6:806:119::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.23; Fri, 22 Mar
 2024 19:39:53 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d%5]) with mapi id 15.20.7362.017; Fri, 22 Mar 2024
 19:39:53 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v4 02/30] drm/xe: Add ops_execute function which returns a
 fence
Thread-Topic: [PATCH v4 02/30] drm/xe: Add ops_execute function which returns
 a fence
Thread-Index: AQHacRanQPPItcHGAUmHxaGgsV+USbFD9TbggAAmIYCAACJTcA==
Date: Fri, 22 Mar 2024 19:39:52 +0000
Message-ID: <SA1PR11MB69911B9EFBD4BB94F2EBF77192312@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240308050806.577176-1-matthew.brost@intel.com>
 <20240308050806.577176-3-matthew.brost@intel.com>
 <SA1PR11MB69911B8FE510C66BEBA9F32D92312@SA1PR11MB6991.namprd11.prod.outlook.com>
 <Zf3Aa/22uOZyFs9q@DUT025-TGLU.fm.intel.com>
In-Reply-To: <Zf3Aa/22uOZyFs9q@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|SA2PR11MB4778:EE_
x-ms-office365-filtering-correlation-id: 6ff686f3-6e43-48f0-677a-08dc4aa7d860
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xuo8fQyHwdQQESi2LA2lyV8bOQsW7Qe3U2CnT8Dbqik3eOynnbcHNtGbZ38duBFuhMksjBTjs4O42V9C2a24piKdY0SCZXvz8n+2oJV+hJCdJsxaQMWjbvuIcj9Raq8i2Go5JAod2EErGGLM27w6as1YDdKXSZDchuny0YMqdvn69IHcKh/jlbfFrvRkbiZoH4aUjFRluf15sQ4TqwI85klKWlzFjNfeee3FNFQXC/RKnlv0L7BR+uR814Qk3MlVRWTcek2I09xVrlTRsw97RJjtc9rUIpToSnEOllfkbJNNQKBEc3Ui7Y3XQmRHGxdt4jy0JleGTp3QUhAvTticc4gqx1bwHjCWTZ7yrW1/CF+grM1NTk1tseq+pYr90ZBTerBgA/LOTGORKKmKGf0ezf1LSFXcbGUHj0WhYCuK6Y8noNIUfHZ1IKoE1HSQdKja3IHX8Uj37a647UtV6iSdVWiBE/ZlDWN/egzFCF03C4s3/7N/f4Fspjd05EppDVe77QTQIFN0RNgNHhjQ8T1JHpCQCD5+YoJPqSf1Ml3UPxF6Jl90WJujo6CUDmH1N5LWldc1hqfUnW2r07QWGMzAh1MYTwjEMnddx2zdROuaCwtexQ5iMKaP2VGdgDRXJtbeaFFvfI94qH4An7+CBnVMMIGYBWrMMOocK4tqz0QSmVj0OF7hJlNRjHA9ewgfAQYISuxJJIGuDDBrNb1CUrLXUw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?AuiKI1yhVf44jwaNZrB4bd1/j2+49NCqVhTnZq4Sl9DK82LrdhZtQQGlB+qg?=
 =?us-ascii?Q?hNCQpInL+FoC8BygYbB+t2oQw1zwu4wGdYSk1pOdQMYU+XOzBC4KsCWDe5SC?=
 =?us-ascii?Q?1fkFbKjk2GWF+WYJLYEvruQcVjuMFFyxF/myA7n2CgkMGGhTZWL66gfxbGcY?=
 =?us-ascii?Q?lVJZXcbwjWL16F+Q3b9kwwQlcJzwDF3MQriFq/V0avkn0KwfmX5lzm4Ni9Hp?=
 =?us-ascii?Q?3GsK18L9T3ABJGZ5JIyfNiHzDfDScByidpZOsETDPciNf/7PJYfJaWvs1CPF?=
 =?us-ascii?Q?tGAI8oLdVlNOxTNFikEsbOegk08PNpy1IBSkH0i7zGO+cYARZDUl+n9Bl9zs?=
 =?us-ascii?Q?/RHTfIXJedLQRKX/qaNkg1PFjV4Op4Uu0bltv2BL/279I2BQK4Eu3jUoOXnk?=
 =?us-ascii?Q?v7hK6M3PmOoeF8XATJZTsZy7mI4ySX7OZygqDkQUyKCpI/4gnpWJePsqYhOZ?=
 =?us-ascii?Q?sxZv0P65M2iUkI4vjSJmG3HjTIs3i6usd29ubfP2hgTKYcm3wwHV5ktiPwTs?=
 =?us-ascii?Q?uZ22UAIgkL7ZX77qVpnD5B8frqanQ6W0Bl8QCXJuSpctXQbPCjNL1FzD7+Jw?=
 =?us-ascii?Q?UtKGW+DX2e+Wn2v1ThA/2PCt30bSBPSAgpdUiqJRCchJvlGcgoK9+3nVysL/?=
 =?us-ascii?Q?VII7VCX0o52+mkX8sWn/+7PbmkbyVHaFq9XsIBZdafF2fUS35HFJRlczQERT?=
 =?us-ascii?Q?vu+UF2QaEZeOg5qYJcYjQN46+KzJL5Vwkd1SYuN80Rjs3hSy0o4OJmlOwsEl?=
 =?us-ascii?Q?wewZbOfaOeBT36YnjNHud52d/qTdMZZUlrDnBqwrG4Z2CjMfFBvbicWb6BBd?=
 =?us-ascii?Q?vo5+cvwfLNiw5vRLFffvU0pg5uXN/Sxd/Hre4KujjgJk14io3T0mIl7FiqIA?=
 =?us-ascii?Q?/lLOgRPvE+cjgpQp2WaII/kPnlnaBWdSKjstk9btTtDqnEzzpGZW7nf0eCvR?=
 =?us-ascii?Q?KXI9km+GiAZcCO0pdhcYAyaXMP7DvqTaeQd7h3xTiwLT3fWwNVuSx8T2uSy3?=
 =?us-ascii?Q?CFXbMElp8UilTGzPBi4Ea9JY3dOVOVnRJEONK3/rw9JkllEOZd8OSg1U7Zjr?=
 =?us-ascii?Q?cReHrEdHxnxsXkyRkdK4tg24zASmnT2zVedgrqIBd21RuAhMDM0z9ilQ+dJm?=
 =?us-ascii?Q?GFPPwClEaJPbsuKcKSyrb55TBblLriToze286tpzYZqJFigY5cs+2hYvtQOG?=
 =?us-ascii?Q?9haIRqJF/Sr4VHZHb0Z4CALQke1dUrMQpCR/+2oZ/eT6E8RAwq+dTMV+weHQ?=
 =?us-ascii?Q?OusJ5XUR3Fbkj3j+nUnJG6fqY29oKPaTp1dpFcIlp7Ul6zZu2Qmmo+iGqWa5?=
 =?us-ascii?Q?mbscxVsvf6jVcyZb+roRhyPp57odhDmIByfz8vXwgWDpqMvtS/pJrADw/UPO?=
 =?us-ascii?Q?QAGrUnNHMVG2Kzahv7ohGvBgeB6oHdwHmySsFq35Pk3J7V8rHt3le4RX4O8Q?=
 =?us-ascii?Q?6QQ7zAEWgxUeNGDl2I4QFPRchbcDrXHnUamYLvtAdP9v4UED3NSWdMCPXa2L?=
 =?us-ascii?Q?8lZDi6/VbeAMJhfIWz3/SKR9o/SQwA4yHyM3Ktej5NmI2zFaJoW2Pi976CMM?=
 =?us-ascii?Q?cW0tR8AZ3t7+E3brbSI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ff686f3-6e43-48f0-677a-08dc4aa7d860
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Mar 2024 19:39:52.3505 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u7DHi0enZribU+2pDCGJwAYu4BSl47t2cjpnyjc9baZgPzkF6bmijszkRA9dxhrG2djtgO7tSJfiJGSF/KyY0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4778
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



> -----Original Message-----
> From: Brost, Matthew <matthew.brost@intel.com>
> Sent: Friday, March 22, 2024 1:31 PM
> To: Zeng, Oak <oak.zeng@intel.com>
> Cc: intel-xe@lists.freedesktop.org
> Subject: Re: [PATCH v4 02/30] drm/xe: Add ops_execute function which retu=
rns a
> fence
>=20
> On Fri, Mar 22, 2024 at 10:11:41AM -0600, Zeng, Oak wrote:
> >
> >
> > > -----Original Message-----
> > > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> Matthew
> > > Brost
> > > Sent: Friday, March 8, 2024 12:08 AM
> > > To: intel-xe@lists.freedesktop.org
> > > Cc: Brost, Matthew <matthew.brost@intel.com>
> > > Subject: [PATCH v4 02/30] drm/xe: Add ops_execute function which retu=
rns a
> > > fence
> > >
> > > Add ops_execute function which returns a fence. This will be helpful =
to
> > > initiate all binds (VM bind IOCTL, rebinds in exec IOCTL, rebinds in
> > > preempt rebind worker, and rebinds in pagefaults) via a gpuva ops lis=
t.
> > > Returning a fence is needed in various paths.
> > >
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_vm.c | 211 +++++++++++++++++++----------------=
--
> > >  1 file changed, 111 insertions(+), 100 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > > index 3b5dc6de07f7..fb73afcab3b7 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > @@ -1789,16 +1789,17 @@ find_ufence_get(struct xe_sync_entry *syncs,
> u32
> > > num_syncs)
> > >  	return NULL;
> > >  }
> > >
> > > -static int __xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma,
> > > -			struct xe_exec_queue *q, struct xe_sync_entry *syncs,
> > > -			u32 num_syncs, bool immediate, bool first_op,
> > > -			bool last_op)
> > > +static struct dma_fence *
> > > +xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma, struct
> xe_exec_queue *q,
> > > +	   struct xe_bo *bo, struct xe_sync_entry *syncs, u32 num_syncs,
> > > +	   bool immediate, bool first_op, bool last_op)
> > >  {
> > >  	struct dma_fence *fence;
> > >  	struct xe_exec_queue *wait_exec_queue =3D to_wait_exec_queue(vm,
> > > q);
> > >  	struct xe_user_fence *ufence;
> > >
> > >  	xe_vm_assert_held(vm);
> > > +	xe_bo_assert_held(bo);
> > >
> > >  	ufence =3D find_ufence_get(syncs, num_syncs);
> > >  	if (vma->ufence && ufence)
> > > @@ -1810,7 +1811,7 @@ static int __xe_vm_bind(struct xe_vm *vm, struc=
t
> > > xe_vma *vma,
> > >  		fence =3D xe_vm_bind_vma(vma, q, syncs, num_syncs, first_op,
> > >  				       last_op);
> > >  		if (IS_ERR(fence))
> > > -			return PTR_ERR(fence);
> > > +			return fence;
> > >  	} else {
> > >  		int i;
> > >
> > > @@ -1825,26 +1826,14 @@ static int __xe_vm_bind(struct xe_vm *vm, str=
uct
> > > xe_vma *vma,
> > >
> > >  	if (last_op)
> > >  		xe_exec_queue_last_fence_set(wait_exec_queue, vm, fence);
> > > -	dma_fence_put(fence);
> > > -
> > > -	return 0;
> > > -}
> > > -
> > > -static int xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma, struct
> > > xe_exec_queue *q,
> > > -		      struct xe_bo *bo, struct xe_sync_entry *syncs,
> > > -		      u32 num_syncs, bool immediate, bool first_op,
> > > -		      bool last_op)
> > > -{
> > > -	xe_vm_assert_held(vm);
> > > -	xe_bo_assert_held(bo);
> > >
> > > -	return __xe_vm_bind(vm, vma, q, syncs, num_syncs, immediate,
> > > first_op,
> > > -			    last_op);
> > > +	return fence;
> > >  }
> > >
> > > -static int xe_vm_unbind(struct xe_vm *vm, struct xe_vma *vma,
> > > -			struct xe_exec_queue *q, struct xe_sync_entry *syncs,
> > > -			u32 num_syncs, bool first_op, bool last_op)
> > > +static struct dma_fence *
> > > +xe_vm_unbind(struct xe_vm *vm, struct xe_vma *vma,
> > > +	     struct xe_exec_queue *q, struct xe_sync_entry *syncs,
> > > +	     u32 num_syncs, bool first_op, bool last_op)
> > >  {
> > >  	struct dma_fence *fence;
> > >  	struct xe_exec_queue *wait_exec_queue =3D to_wait_exec_queue(vm,
> > > q);
> > > @@ -1854,14 +1843,13 @@ static int xe_vm_unbind(struct xe_vm *vm, str=
uct
> > > xe_vma *vma,
> > >
> > >  	fence =3D xe_vm_unbind_vma(vma, q, syncs, num_syncs, first_op,
> > > last_op);
> > >  	if (IS_ERR(fence))
> > > -		return PTR_ERR(fence);
> > > +		return fence;
> > >
> > >  	xe_vma_destroy(vma, fence);
> > >  	if (last_op)
> > >  		xe_exec_queue_last_fence_set(wait_exec_queue, vm, fence);
> > > -	dma_fence_put(fence);
> > >
> > > -	return 0;
> > > +	return fence;
> > >  }
> > >
> > >  #define ALL_DRM_XE_VM_CREATE_FLAGS
> > > (DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE | \
> > > @@ -2004,10 +1992,11 @@ static const u32 region_to_mem_type[] =3D {
> > >  	XE_PL_VRAM1,
> > >  };
> > >
> > > -static int xe_vm_prefetch(struct xe_vm *vm, struct xe_vma *vma,
> > > -			  struct xe_exec_queue *q, u32 region,
> > > -			  struct xe_sync_entry *syncs, u32 num_syncs,
> > > -			  bool first_op, bool last_op)
> > > +static struct dma_fence *
> > > +xe_vm_prefetch(struct xe_vm *vm, struct xe_vma *vma,
> > > +	       struct xe_exec_queue *q, u32 region,
> > > +	       struct xe_sync_entry *syncs, u32 num_syncs,
> > > +	       bool first_op, bool last_op)
> > >  {
> > >  	struct xe_exec_queue *wait_exec_queue =3D to_wait_exec_queue(vm,
> > > q);
> > >  	int err;
> > > @@ -2017,27 +2006,24 @@ static int xe_vm_prefetch(struct xe_vm *vm,
> struct
> > > xe_vma *vma,
> > >  	if (!xe_vma_has_no_bo(vma)) {
> > >  		err =3D xe_bo_migrate(xe_vma_bo(vma),
> > > region_to_mem_type[region]);
> > >  		if (err)
> > > -			return err;
> > > +			return ERR_PTR(err);
> > >  	}
> > >
> > >  	if (vma->tile_mask !=3D (vma->tile_present & ~vma->usm.tile_invalid=
ated))
> > > {
> > >  		return xe_vm_bind(vm, vma, q, xe_vma_bo(vma), syncs,
> > > num_syncs,
> > >  				  true, first_op, last_op);
> > >  	} else {
> > > +		struct dma_fence *fence =3D
> > > +			xe_exec_queue_last_fence_get(wait_exec_queue, vm);
> > >  		int i;
> > >
> > >  		/* Nothing to do, signal fences now */
> > >  		if (last_op) {
> > > -			for (i =3D 0; i < num_syncs; i++) {
> > > -				struct dma_fence *fence =3D
> > > -
> > > 	xe_exec_queue_last_fence_get(wait_exec_queue, vm);
> > > -
> > > +			for (i =3D 0; i < num_syncs; i++)
> > >  				xe_sync_entry_signal(&syncs[i], NULL, fence);
> > > -				dma_fence_put(fence);
> > > -			}
> > >  		}
> > >
> > > -		return 0;
> > > +		return fence;
> > >  	}
> > >  }
> > >
> > > @@ -2484,10 +2470,10 @@ static int vm_bind_ioctl_ops_parse(struct xe_=
vm
> > > *vm, struct xe_exec_queue *q,
> > >  	return 0;
> > >  }
> > >
> > > -static int op_execute(struct xe_vm *vm, struct xe_vma *vma,
> > > -		      struct xe_vma_op *op)
> > > +static struct dma_fence *op_execute(struct xe_vm *vm, struct xe_vma
> *vma,
> > > +				    struct xe_vma_op *op)
> > >  {
> > > -	int err;
> > > +	struct dma_fence *fence =3D NULL;
> > >
> > >  	lockdep_assert_held_write(&vm->lock);
> > >  	xe_vm_assert_held(vm);
> > > @@ -2495,11 +2481,11 @@ static int op_execute(struct xe_vm *vm, struc=
t
> > > xe_vma *vma,
> > >
> > >  	switch (op->base.op) {
> > >  	case DRM_GPUVA_OP_MAP:
> > > -		err =3D xe_vm_bind(vm, vma, op->q, xe_vma_bo(vma),
> > > -				 op->syncs, op->num_syncs,
> > > -				 !xe_vm_in_fault_mode(vm),
> > > -				 op->flags & XE_VMA_OP_FIRST,
> > > -				 op->flags & XE_VMA_OP_LAST);
> > > +		fence =3D xe_vm_bind(vm, vma, op->q, xe_vma_bo(vma),
> > > +				   op->syncs, op->num_syncs,
> > > +				   !xe_vm_in_fault_mode(vm),
> > > +				   op->flags & XE_VMA_OP_FIRST,
> > > +				   op->flags & XE_VMA_OP_LAST);
> > >  		break;
> > >  	case DRM_GPUVA_OP_REMAP:
> > >  	{
> > > @@ -2509,37 +2495,39 @@ static int op_execute(struct xe_vm *vm, struc=
t
> > > xe_vma *vma,
> > >  		if (!op->remap.unmap_done) {
> > >  			if (prev || next)
> > >  				vma->gpuva.flags |=3D XE_VMA_FIRST_REBIND;
> > > -			err =3D xe_vm_unbind(vm, vma, op->q, op->syncs,
> > > -					   op->num_syncs,
> > > -					   op->flags & XE_VMA_OP_FIRST,
> > > -					   op->flags & XE_VMA_OP_LAST &&
> > > -					   !prev && !next);
> > > -			if (err)
> > > +			fence =3D xe_vm_unbind(vm, vma, op->q, op->syncs,
> > > +					     op->num_syncs,
> > > +					     op->flags & XE_VMA_OP_FIRST,
> > > +					     op->flags & XE_VMA_OP_LAST &&
> > > +					     !prev && !next);
> > > +			if (IS_ERR(fence))
> > >  				break;
> > >  			op->remap.unmap_done =3D true;
> > >  		}
> > >
> > >  		if (prev) {
> > >  			op->remap.prev->gpuva.flags |=3D XE_VMA_LAST_REBIND;
> > > -			err =3D xe_vm_bind(vm, op->remap.prev, op->q,
> > > -					 xe_vma_bo(op->remap.prev), op->syncs,
> > > -					 op->num_syncs, true, false,
> > > -					 op->flags & XE_VMA_OP_LAST
> > > && !next);
> > > +			dma_fence_put(fence);
> >
> >
> > So you drop the previous fence. I assume in later operation, we will ne=
ed to
> wait dma-fence for the previous operation to complete. Is it safe to only=
 wait for
> the last fence? Shouldn't we wait all the fences, such as chain the fence=
s in some
> way?
> >
>=20
> All fences on single xe_exec_queue are should ordered (e.g if the last
> completes all fences prior are also complete).

Ok, if all fences are ordered, this code make sense to me.

>=20
> Techincally this is broken on tip and at this point in the series too as
> we mix job fences and tlb invalidation fences on single xe_exec_queue.
> This series gets around to fix this once we convert an IOCTL into single
> bind job. So this patch while not perfect is regressing anything working
> toward 100% correctness.
>=20
> > > +			fence =3D xe_vm_bind(vm, op->remap.prev, op->q,
> > > +					   xe_vma_bo(op->remap.prev), op-
> > > >syncs,
> > > +					   op->num_syncs, true, false,
> > > +					   op->flags & XE_VMA_OP_LAST
> > > && !next);
> > >  			op->remap.prev->gpuva.flags &=3D
> > > ~XE_VMA_LAST_REBIND;
> > > -			if (err)
> > > +			if (IS_ERR(fence))
> > >  				break;
> > >  			op->remap.prev =3D NULL;
> > >  		}
> > >
> > >  		if (next) {
> > >  			op->remap.next->gpuva.flags |=3D XE_VMA_LAST_REBIND;
> > > -			err =3D xe_vm_bind(vm, op->remap.next, op->q,
> > > -					 xe_vma_bo(op->remap.next),
> > > -					 op->syncs, op->num_syncs,
> > > -					 true, false,
> > > -					 op->flags & XE_VMA_OP_LAST);
> > > +			dma_fence_put(fence);
> >
> >
> > Same comment as above
>=20
> Same answer.
>=20
> > > +			fence =3D xe_vm_bind(vm, op->remap.next, op->q,
> > > +					   xe_vma_bo(op->remap.next),
> > > +					   op->syncs, op->num_syncs,
> > > +					   true, false,
> > > +					   op->flags & XE_VMA_OP_LAST);
> > >  			op->remap.next->gpuva.flags &=3D
> > > ~XE_VMA_LAST_REBIND;
> > > -			if (err)
> > > +			if (IS_ERR(fence))
> > >  				break;
> > >  			op->remap.next =3D NULL;
> > >  		}
> > > @@ -2547,34 +2535,36 @@ static int op_execute(struct xe_vm *vm, struc=
t
> > > xe_vma *vma,
> > >  		break;
> > >  	}
> > >  	case DRM_GPUVA_OP_UNMAP:
> > > -		err =3D xe_vm_unbind(vm, vma, op->q, op->syncs,
> > > -				   op->num_syncs, op->flags &
> > > XE_VMA_OP_FIRST,
> > > -				   op->flags & XE_VMA_OP_LAST);
> > > +		fence =3D xe_vm_unbind(vm, vma, op->q, op->syncs,
> > > +				     op->num_syncs, op->flags &
> > > XE_VMA_OP_FIRST,
> > > +				     op->flags & XE_VMA_OP_LAST);
> > >  		break;
> > >  	case DRM_GPUVA_OP_PREFETCH:
> > > -		err =3D xe_vm_prefetch(vm, vma, op->q, op->prefetch.region,
> > > -				     op->syncs, op->num_syncs,
> > > -				     op->flags & XE_VMA_OP_FIRST,
> > > -				     op->flags & XE_VMA_OP_LAST);
> > > +		fence =3D xe_vm_prefetch(vm, vma, op->q, op->prefetch.region,
> > > +				       op->syncs, op->num_syncs,
> > > +				       op->flags & XE_VMA_OP_FIRST,
> > > +				       op->flags & XE_VMA_OP_LAST);
> > >  		break;
> > >  	default:
> > >  		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
> > >  	}
> > >
> > > -	if (err)
> > > +	if (IS_ERR(fence))
> > >  		trace_xe_vma_fail(vma);
> > >
> > > -	return err;
> > > +	return fence;
> > >  }
> > >
> > > -static int __xe_vma_op_execute(struct xe_vm *vm, struct xe_vma *vma,
> > > -			       struct xe_vma_op *op)
> > > +static struct dma_fence *
> > > +__xe_vma_op_execute(struct xe_vm *vm, struct xe_vma *vma,
> > > +		    struct xe_vma_op *op)
> > >  {
> > > +	struct dma_fence *fence;
> > >  	int err;
> > >
> > >  retry_userptr:
> > > -	err =3D op_execute(vm, vma, op);
> > > -	if (err =3D=3D -EAGAIN) {
> > > +	fence =3D op_execute(vm, vma, op);
> > > +	if (IS_ERR(fence) && PTR_ERR(fence) =3D=3D -EAGAIN) {
> > >  		lockdep_assert_held_write(&vm->lock);
> > >
> > >  		if (op->base.op =3D=3D DRM_GPUVA_OP_REMAP) {
> > > @@ -2591,22 +2581,24 @@ static int __xe_vma_op_execute(struct xe_vm
> *vm,
> > > struct xe_vma *vma,
> > >  			if (!err)
> > >  				goto retry_userptr;
> > >
> > > +			fence =3D ERR_PTR(err);
> > >  			trace_xe_vma_fail(vma);
> > >  		}
> > >  	}
> > >
> > > -	return err;
> > > +	return fence;
> > >  }
> > >
> > > -static int xe_vma_op_execute(struct xe_vm *vm, struct xe_vma_op *op)
> > > +static struct dma_fence *
> > > +xe_vma_op_execute(struct xe_vm *vm, struct xe_vma_op *op)
> > >  {
> > > -	int ret =3D 0;
> > > +	struct dma_fence *fence =3D ERR_PTR(-ENOMEM);
> > >
> > >  	lockdep_assert_held_write(&vm->lock);
> > >
> > >  	switch (op->base.op) {
> > >  	case DRM_GPUVA_OP_MAP:
> > > -		ret =3D __xe_vma_op_execute(vm, op->map.vma, op);
> > > +		fence =3D __xe_vma_op_execute(vm, op->map.vma, op);
> > >  		break;
> > >  	case DRM_GPUVA_OP_REMAP:
> > >  	{
> > > @@ -2619,23 +2611,23 @@ static int xe_vma_op_execute(struct xe_vm *vm=
,
> > > struct xe_vma_op *op)
> > >  		else
> > >  			vma =3D op->remap.next;
> > >
> > > -		ret =3D __xe_vma_op_execute(vm, vma, op);
> > > +		fence =3D __xe_vma_op_execute(vm, vma, op);
> > >  		break;
> > >  	}
> > >  	case DRM_GPUVA_OP_UNMAP:
> > > -		ret =3D __xe_vma_op_execute(vm, gpuva_to_vma(op-
> > > >base.unmap.va),
> > > -					  op);
> > > +		fence =3D __xe_vma_op_execute(vm, gpuva_to_vma(op-
> > > >base.unmap.va),
> > > +					    op);
> > >  		break;
> > >  	case DRM_GPUVA_OP_PREFETCH:
> > > -		ret =3D __xe_vma_op_execute(vm,
> > > -					  gpuva_to_vma(op->base.prefetch.va),
> > > -					  op);
> > > +		fence =3D __xe_vma_op_execute(vm,
> > > +					    gpuva_to_vma(op->base.prefetch.va),
> > > +					    op);
> > >  		break;
> > >  	default:
> > >  		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
> > >  	}
> > >
> > > -	return ret;
> > > +	return fence;
> > >  }
> > >
> > >  static void xe_vma_op_cleanup(struct xe_vm *vm, struct xe_vma_op *op=
)
> > > @@ -2803,11 +2795,35 @@ static int vm_bind_ioctl_ops_lock(struct
> drm_exec
> > > *exec,
> > >  	return 0;
> > >  }
> > >
> > > +static struct dma_fence *ops_execute(struct xe_vm *vm,
> > > +				     struct list_head *ops_list,
> > > +				     bool cleanup)
> > > +{
> > > +	struct xe_vma_op *op, *next;
> > > +	struct dma_fence *fence =3D NULL;
> > > +
> > > +	list_for_each_entry_safe(op, next, ops_list, link) {
> > > +		if (!IS_ERR(fence)) {
> > > +			dma_fence_put(fence);
> > > +			fence =3D xe_vma_op_execute(vm, op);
> >
> > So you only return the fence of the last operation. In the later on cod=
es, do you
> use fence to wait for *all* operations to finish?
> >
>=20
> Same answer as above, all fences on exec_queue should be ordered.
>=20
> > > +		}
> > > +		if (IS_ERR(fence)) {
> > > +			drm_warn(&vm->xe->drm, "VM op(%d) failed with %ld",
> > > +				 op->base.op, PTR_ERR(fence));
> > > +			fence =3D ERR_PTR(-ENOSPC);
> >
> > So even if there is error, you don't break the loop. Is it to perform t=
he cleanup
> below?
> >
> > Once error happen for one operation, you seem to print the same error
> message for all the rest operations....because fence =3D xe_vma_op_execut=
e(vm,
> op) is not called anymore after the first error
> >
>=20
> Yes.

Is this problematic though? Lets say you have 2 ops in the list and op_exec=
ute failed with op1. You will print as below:

VM op1 failed with xxx
VM op1 failed with xxx


Oak

>=20
> Matt
>=20
> >
> > Oak
> >
> > > +		}
> > > +		if (cleanup)
> > > +			xe_vma_op_cleanup(vm, op);
> > > +	}
> > > +
> > > +	return fence;
> > > +}
> > > +
> > >  static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
> > >  				     struct list_head *ops_list)
> > >  {
> > >  	struct drm_exec exec;
> > > -	struct xe_vma_op *op, *next;
> > > +	struct dma_fence *fence;
> > >  	int err;
> > >
> > >  	lockdep_assert_held_write(&vm->lock);
> > > @@ -2820,19 +2836,14 @@ static int vm_bind_ioctl_ops_execute(struct
> xe_vm
> > > *vm,
> > >  		if (err)
> > >  			goto unlock;
> > >
> > > -		list_for_each_entry_safe(op, next, ops_list, link) {
> > > -			err =3D xe_vma_op_execute(vm, op);
> > > -			if (err) {
> > > -				drm_warn(&vm->xe->drm, "VM op(%d) failed
> > > with %d",
> > > -					 op->base.op, err);
> > > -				/*
> > > -				 * FIXME: Killing VM rather than proper error
> > > handling
> > > -				 */
> > > -				xe_vm_kill(vm, false);
> > > -				err =3D -ENOSPC;
> > > -				goto unlock;
> > > -			}
> > > -			xe_vma_op_cleanup(vm, op);
> > > +		fence =3D ops_execute(vm, ops_list, true);
> > > +		if (IS_ERR(fence)) {
> > > +			err =3D PTR_ERR(fence);
> > > +			/* FIXME: Killing VM rather than proper error handling */
> > > +			xe_vm_kill(vm, false);
> > > +			goto unlock;
> > > +		} else {
> > > +			dma_fence_put(fence);
> > >  		}
> > >  	}
> > >
> > > --
> > > 2.34.1
> >
