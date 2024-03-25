Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A93DEC54E58
	for <intel-xe@archiver.kernel.org>; Mon, 25 Mar 2024 16:03:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6358C10E78D;
	Mon, 25 Mar 2024 16:03:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vv8VxplM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D27B810E78D
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Mar 2024 16:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711382620; x=1742918620;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=eP+cIfhdHoJVBAnkkPTW/c3mR4QbBX3nxRqgWUdUyfY=;
 b=Vv8VxplMw5OepGvUGVrsdEid/WGw12nd8NRrBrAk0o5sV81mHvQRSUwi
 1n7N6ZkyGuWu4Vcoxm2a4teRgFYn0VNuyis5rjtWQRZ6xCDvVIMmP82pM
 jYQ6q/M4HtC6gMyEaUd/gtzO+KhI+0od3jYMl0dmZV3AhQRt2L9ttTsNQ
 LD7vpFZDIq+5ETgtegtzpX5ZY4i/l1KARU52qpZyGAbQLfuY+IwPyjc31
 MWSngZf0ga3mDcxWEGBD947Ab9mTR4tyuckeXpZreWufhH1xbDOzFIrc9
 DaX1DD88eu7DruF/+K+xzsrMZvLXa+X42MMyeJ1Zglv8Ofol7t9waX5HZ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6576598"
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; 
   d="scan'208";a="6576598"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 09:03:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="53133896"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Mar 2024 09:03:40 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 25 Mar 2024 09:03:39 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 25 Mar 2024 09:03:39 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 25 Mar 2024 09:03:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jll0OU6ZGXS2FO0cIzsnuWUYykbWLaFH7YUH8tNPWSoAcb2JpUc517swdjAKj1aCfthhjkeBwTE7QWTaMM2B6V5v9eCnkOZ5ikzv8kLHnfI+e5s4H5q9Mhd4431vkjjAsH3+0nH1AtWMYst10KfvlqzJ7wtkKg+zWU796QjdCjM8ChdmbbBaKzfKPmSDN8VDxicElug3zxkz+QMM+5dC/A9W8dUYpLpqlhZm9aXEbv5FuzyyueLJY//cZXdN53o8Tu9oIUe9CE2zMpt7Ta8tutQg2LJ9TaFYJBqM2hhD6mVUYAlJFa2ajfmhMB+9QaDtGVKMNcIvMykpeSOBrgFldA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ihUTjxLGjimiphmo+8+N3BhE332a6ayhlmECLLRpPdQ=;
 b=Yhxk6lrlalfuFlF/nVJShgk3CuyGr94fT+waFnreXACtzVXGTZN7WMX0suZ6Np094kD+OMRM5Rz068rTUgIEibiLBJCmOMSS6Qw571c+io7qW1HiIqKJnrsN0mlHUG4EW1F6sMrHRa82ocCfexOE233QTsnwDyEZDeU2I8OLfcH5X8ACw84ZgaQ9/Um0CpQlJiEOboe3F/o0hq6/anQGNMafAYfreXnpZ0TezZLrMsN5enxMizS63EfhX9fESDQd4Ywbh0HOT0Nl8z2rusdP0ZMK45dPjJa5XFxXcJu8iZJ8Od8Il8ONFvXKypk6TWFCnUBbI1FW+ITZpWOyM3kbtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by DM4PR11MB7301.namprd11.prod.outlook.com (2603:10b6:8:10a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Mon, 25 Mar
 2024 16:03:27 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d%5]) with mapi id 15.20.7362.017; Mon, 25 Mar 2024
 16:03:27 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>
Subject: RE: [PATCH v4 06/30] drm/xe: Simplify VM bind IOCTL error handling
 and cleanup
Thread-Topic: [PATCH v4 06/30] drm/xe: Simplify VM bind IOCTL error handling
 and cleanup
Thread-Index: AQHacRad0aZp5Ft0T0WWqm3jNOAzVbFEbRVQ
Date: Mon, 25 Mar 2024 16:03:27 +0000
Message-ID: <SA1PR11MB69916B4E0EEF26DCADA88E6392362@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240308050806.577176-1-matthew.brost@intel.com>
 <20240308050806.577176-7-matthew.brost@intel.com>
In-Reply-To: <20240308050806.577176-7-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|DM4PR11MB7301:EE_
x-ms-office365-filtering-correlation-id: 76d266a3-de99-4873-6c2f-08dc4ce51ba8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: c9B+8VTdDouil1sTBoJlrvbTzlb2CHHpL7WjoTlvfqzpuDLIcd5DsRkmF1Zn0Ho57db0Hr8ARYrxQk2Mj6OaRz9gS3IPs0Q8LcGd6lIh08geLccDGhJteTGrmby+gTSeNdUc3d95yE7mAJAOw2bZYvJ0iGwrvDi5jbs9sAbmxu8DqyjwExNXLJK7MxmANWU53KXlrhUJ8Na5eR4j2E0pti68q0a6inW3phCCQ+9OjQfNPvh3J420XHvOtk1j007MrC+5YNFoAd6AIRGLaWPfmjigVGFrYnLkT7zLpG43S9+ruJCOG0uHVcMOIN5RoEe0ud1OgOFOQ1c+IkeLs3B8E0NTogrg84xKZ8bGMvkkrO/2WNimv/8LzQkG9Mnfxeqhr+aCoKCe6BpIk6thiaU4yLQ6Pt9rVKz4A68xkLX0i8EqWioha1ayjB0OMEbqHkF4kne6vPd52T1bub0TqXeN+v004Mm7UMwHXB8yLlC2mx8CE5MY9CWoY/XKFOO3BGweNA0G1Pr/v2y4Lw8c20zEiMP/jrpdkhbx1exunt/KiP4DUUoENd63UWJ3fasRKD5c+APZEER6mnFffQIWDU7xdEELCTWzCHdDFPuF+PTpplNr7o4coVdFzCvVsytwaP4UcX2hI/GMsH4L6wVlHXf9T0sd0zm25c+CuLlv1XgVksdJB3rBNin4an5vvRTPXkXb+kDODs586lgJSCQff+t4tNedm9HlS3y2pw6VdMg2tI0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?SRDLF+2hZ5PKxUpcQOTwKZMqzzpYKW/pqELL7ImEqMUQU0HDJmGThBqVEGh9?=
 =?us-ascii?Q?DgfaMoUC5JdZe3qOIIpoTuJ7iM93ypLrHBZd2YLAPbWGRCBBt0iGhQ4u3OC5?=
 =?us-ascii?Q?ZNl7X7K3YSUTkPT32oIs5wSpXtqrfr4SEyYavRGatm2GJdoViO+zIOKaDadI?=
 =?us-ascii?Q?EeWqjVJnqCbSZY0fUosNti5XXAu8uZI1wy3mX0bPcvFPWDqWbipcj3z2Wrih?=
 =?us-ascii?Q?ssC8EL2dN7c4TAHTzXd5n77FbFhqw+ntIggKgKFttlZ6zY0xnzX3+lYOg6Q+?=
 =?us-ascii?Q?xyRCkM+MfVbg1xR/3bhJQnH36sPkIf9h10qgnfb5rw9h6aXcTOQIoZe6i5ww?=
 =?us-ascii?Q?k9js+37v0Rrrop5oS4IK+aQOhgFCDhlnvWSJ2VHxEHiOUJ2qi865I0ADHH4l?=
 =?us-ascii?Q?qi1E50YoOtFj3YzXExQdapPjc+Lq1Ogx3+O9caNZ5HMj3Op4rSQwATp8cQQb?=
 =?us-ascii?Q?kDg1nHn5HCuehxTL+m/zVU9viR0pQpUDjXRm41gjBWFrLKa/cM3SfCrVyjZc?=
 =?us-ascii?Q?ikftSooiWFpUnjvl3fomCAKhxsxznANGNjeI74arll1RC6xjUWuCFlQwFWz4?=
 =?us-ascii?Q?O3hdjyK8EodqI/rr3oTaH7Pxc4lqPT3S0XA1vrkeI++fPUWPsJeNlePGaQSf?=
 =?us-ascii?Q?6GQ8ypr0vuaGpQnBRLSkfT6e9PkwE54xNnLj+CJ1NDbJadqjI69xLWxu/E9H?=
 =?us-ascii?Q?+P+DHsExSCITMRn7TREu4WlP+u4UUP9btVkmTGziAhxKXBHwlG5yOYJ6KCnU?=
 =?us-ascii?Q?h3J6UrQtNF8GP7yY2ndqqUowWTNaEX13c6lW9OcVbZBEuPC+txcMOzCy6LxD?=
 =?us-ascii?Q?4zrx/NXijaEmzHqG/0DLyTg/8f3Aymqv2Dw+vhSiFLGnsC88vLakPdC6y7d5?=
 =?us-ascii?Q?pDfebAwDl2GJerWdwqCPDExKLPrJarhRwG1EutknnnidR+QQ5hsElsDOivwl?=
 =?us-ascii?Q?bs9d7zsH4P/PSW7OKpMgolJ9/8tjxwk9dHYq2EGmCD6u8ornYr+kF6TwKvu2?=
 =?us-ascii?Q?P5VnpfDYYeS10nX8POaCkQjpo7b+x178gqJtvRLerHSom0+6HfNQWUWujUZX?=
 =?us-ascii?Q?tbrwf1qrh/cRbTyGxzPRD16YNWTlq3f5xfUrVura0zZoqobKOTC1FNGZm4+N?=
 =?us-ascii?Q?96Lfy++x/+t3Xa6bBSkt7J8xFC56ghOSyuoRUHvIBrxZge1XQCRJ5X/uAkNP?=
 =?us-ascii?Q?phW9hbTluLdCVaWuY61apqqcL/HQR1DJhSLKjhv0mrebRLvsDrr6nEPD7XlS?=
 =?us-ascii?Q?RU5z9l3FONMK8iLAmUSImi2qJkCKNu5pdP0rwtgoceVQxzJ5h5kFMgPpIl5C?=
 =?us-ascii?Q?55JTWTjS+dST+5vo0SoT0rvVvUcz6C3+2z+4/icW/sQS7u8ZJ2RRbfwIvIC/?=
 =?us-ascii?Q?rv1qPc2l7m914fe1+hRXRcZ4BaiSRx8jgksqfkmWiu+TY9OiAsAGh375KWis?=
 =?us-ascii?Q?L/qi4melUaGKA3XNqDMhv7akuiLqY4tmAl+oooX16h7JrZoZCsIkE/wFINR/?=
 =?us-ascii?Q?ZspzEBRNF3W67Q2TaS44mVkNym9f19TGZ9rVvnij0dxh77LMh5VnZRCc9Cr/?=
 =?us-ascii?Q?ftoG2e9PfxEUAtEgI9g=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76d266a3-de99-4873-6c2f-08dc4ce51ba8
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2024 16:03:27.4432 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tA4aLPpE/Zjj1a9uliilAHSNIrnVayPXQcWCE2PlwACno8NaTokMGaXEzMIPZhPG2JZir3VRz7Ih2T2i1ikkMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7301
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

Hi Matt,

This looks like a nice clean up to me. See one comment inline.

> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matt=
hew
> Brost
> Sent: Friday, March 8, 2024 12:08 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Brost, Matthew <matthew.brost@intel.com>
> Subject: [PATCH v4 06/30] drm/xe: Simplify VM bind IOCTL error handling a=
nd
> cleanup
>=20
> Clean up everything in VM bind IOCTL in 1 path for both errors and
> non-errors. Also move VM bind IOCTL cleanup from ops (also used by
> non-IOCTL binds) to the VM bind IOCTL.
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c       | 60 +++++---------------------------
>  drivers/gpu/drm/xe/xe_vm_types.h |  5 ---
>  2 files changed, 9 insertions(+), 56 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 0bb807c05d7b..dde777c807cf 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -769,8 +769,7 @@ static void xe_vm_populate_dummy_rebind(struct
> xe_vm *vm, struct xe_vma *vma)
>  }
>=20
>  static struct dma_fence *ops_execute(struct xe_vm *vm,
> -				     struct xe_vma_ops *vops,
> -				     bool cleanup);
> +				     struct xe_vma_ops *vops);
>=20
>  struct dma_fence *xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
>  {
> @@ -794,7 +793,7 @@ struct dma_fence *xe_vm_rebind(struct xe_vm *vm,
> bool rebind_worker)
>  			trace_xe_vma_rebind_exec(vma);
>=20
>  		xe_vm_populate_dummy_rebind(vm, vma);
> -		fence =3D ops_execute(vm, &vm->dummy_ops.vops, false);
> +		fence =3D ops_execute(vm, &vm->dummy_ops.vops);
>  		if (IS_ERR(fence))
>  			return fence;
>  	}
> @@ -2474,7 +2473,6 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm=
,
> struct xe_exec_queue *q,
>  	if (!last_op)
>  		return 0;
>=20
> -	last_op->ops =3D ops;
>  	if (last) {
>  		last_op->flags |=3D XE_VMA_OP_LAST;
>  		last_op->num_syncs =3D num_syncs;
> @@ -2643,25 +2641,6 @@ xe_vma_op_execute(struct xe_vm *vm, struct
> xe_vma_op *op)
>  	return fence;
>  }
>=20
> -static void xe_vma_op_cleanup(struct xe_vm *vm, struct xe_vma_op *op)
> -{
> -	bool last =3D op->flags & XE_VMA_OP_LAST;
> -
> -	if (last) {
> -		while (op->num_syncs--)
> -			xe_sync_entry_cleanup(&op->syncs[op->num_syncs]);
> -		kfree(op->syncs);
> -		if (op->q)
> -			xe_exec_queue_put(op->q);
> -	}
> -	if (!list_empty(&op->link))
> -		list_del(&op->link);
> -	if (op->ops)
> -		drm_gpuva_ops_free(&vm->gpuvm, op->ops);
> -	if (last)
> -		xe_vm_put(vm);
> -}
> -
>  static void xe_vma_op_unwind(struct xe_vm *vm, struct xe_vma_op *op,
>  			     bool post_commit, bool prev_post_commit,
>  			     bool next_post_commit)
> @@ -2738,8 +2717,6 @@ static void vm_bind_ioctl_ops_unwind(struct xe_vm
> *vm,
>  					 op->flags &
> XE_VMA_OP_PREV_COMMITTED,
>  					 op->flags &
> XE_VMA_OP_NEXT_COMMITTED);
>  		}
> -
> -		drm_gpuva_ops_free(&vm->gpuvm, __ops);
>  	}
>  }
>=20
> @@ -2818,8 +2795,7 @@ static int vm_bind_ioctl_ops_lock(struct drm_exec
> *exec,
>  }
>=20
>  static struct dma_fence *ops_execute(struct xe_vm *vm,
> -				     struct xe_vma_ops *vops,
> -				     bool cleanup)
> +				     struct xe_vma_ops *vops)
>  {
>  	struct xe_vma_op *op, *next;
>  	struct dma_fence *fence =3D NULL;
> @@ -2834,8 +2810,6 @@ static struct dma_fence *ops_execute(struct xe_vm
> *vm,
>  				 op->base.op, PTR_ERR(fence));
>  			fence =3D ERR_PTR(-ENOSPC);
>  		}
> -		if (cleanup)
> -			xe_vma_op_cleanup(vm, op);


Now with this cleanup code removed, do you still want to loop all the ops i=
n the list when xe_vma_op_execute failed with error? Should we break and re=
turn earlier in this case?

Oak

>  	}
>=20
>  	return fence;
> @@ -2858,7 +2832,7 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm
> *vm,
>  		if (err)
>  			goto unlock;
>=20
> -		fence =3D ops_execute(vm, vops, true);
> +		fence =3D ops_execute(vm, vops);
>  		if (IS_ERR(fence)) {
>  			err =3D PTR_ERR(fence);
>  			/* FIXME: Killing VM rather than proper error handling */
> @@ -3211,30 +3185,14 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void
> *data, struct drm_file *file)
>  		goto unwind_ops;
>  	}
>=20
> -	xe_vm_get(vm);
> -	if (q)
> -		xe_exec_queue_get(q);
> -
>  	err =3D vm_bind_ioctl_ops_execute(vm, &vops);
>=20
> -	up_write(&vm->lock);
> -
> -	if (q)
> -		xe_exec_queue_put(q);
> -	xe_vm_put(vm);
> -
> -	for (i =3D 0; bos && i < args->num_binds; ++i)
> -		xe_bo_put(bos[i]);
> -
> -	kvfree(bos);
> -	kvfree(ops);
> -	if (args->num_binds > 1)
> -		kvfree(bind_ops);
> -
> -	return err;
> -
>  unwind_ops:
> -	vm_bind_ioctl_ops_unwind(vm, ops, args->num_binds);
> +	if (err && err !=3D -ENODATA)
> +		vm_bind_ioctl_ops_unwind(vm, ops, args->num_binds);
> +	for (i =3D args->num_binds - 1; i >=3D 0; --i)
> +		if (ops[i])
> +			drm_gpuva_ops_free(&vm->gpuvm, ops[i]);
>  free_syncs:
>  	if (err =3D=3D -ENODATA)
>  		err =3D vm_bind_ioctl_signal_fences(vm, q, syncs, num_syncs);
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> b/drivers/gpu/drm/xe/xe_vm_types.h
> index 7ef9e632154a..f097fe318a74 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -181,11 +181,6 @@ enum xe_vma_op_flags {
>  struct xe_vma_op {
>  	/** @base: GPUVA base operation */
>  	struct drm_gpuva_op base;
> -	/**
> -	 * @ops: GPUVA ops, when set call drm_gpuva_ops_free after this
> -	 * operations is processed
> -	 */
> -	struct drm_gpuva_ops *ops;
>  	/** @q: exec queue for this operation */
>  	struct xe_exec_queue *q;
>  	/**
> --
> 2.34.1

