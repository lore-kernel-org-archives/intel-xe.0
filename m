Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1008C83F12
	for <intel-xe@archiver.kernel.org>; Mon, 28 Aug 2023 22:34:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5249D10E360;
	Mon, 28 Aug 2023 22:34:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D37410E360
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Aug 2023 22:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693262081; x=1724798081;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sdFaPVBMrC1dF6izcur4knhRmUXGcRsV1WgzxrSPE0E=;
 b=ZmDhRsqMg38swKmTCb1oUZJCpbGiLDHwtQKk1zJHI8OZnQLyVpENzxX4
 LzUQe8MFQ+9gx2SD1OLHwfGDw7FGa/v3xqXrIQAr8PF+Xx13WzA/ZFylG
 LThrplb2PR/eg1S79KWp3Yznwhtku4A/SS+QDA/qTFoYx8AgrrTDiqBZ/
 Am24/kpuYDdGusBgtSmlL9uXRuAh02UE0+4ti4TcWspNJjxXDVyPuaIC8
 otccZPvAUIeafYYYNT3D8NCneovUU6yCGJhpVusVPCyZ4nW+avfRDcCXK
 3NCQtqry+Ghp0d0tFBMKFc3BauEr9YwV44VCZNh8dEVL2Igt4qL7//dXO A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="355548190"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; d="scan'208";a="355548190"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2023 15:34:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="803875365"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; d="scan'208";a="803875365"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga008.fm.intel.com with ESMTP; 28 Aug 2023 15:34:41 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 28 Aug 2023 15:34:40 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 28 Aug 2023 15:34:40 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 28 Aug 2023 15:34:40 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.105)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 28 Aug 2023 15:34:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PzFBMNm1IXWg0PbqfCvuGuxNzBwel+i3k5veImAsDTONgIy6Cc4Eu4ZyO3r9u1CQRa/wjqDPlPHxfoyysmIkWDSLCpb2u5S4lT2dteFusdokTstcU6epJ7J5w2+LnMUzLiue/1Fcxs4EGD0WrUUJQGo2AJbDB5Si1bi78Yhq85jtgAiN3wTfvEnxkEh4mtWQv0ga18w7whGb/kF7Ln3qxhDg1Lype4NP/q3pXChaWDfbbjx7eOoZjEMRMPjMAsu3H/wa6ad74z7S9kwtjzJ4Ix71mjD2U9CflJKjRYBRost82FDV3Ignz6PkQws0lvzkTNm2X22+udT0lViA2ZChLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l6zlv7FGdhCdkUxywOM6ORn0xiQWkf/Ze40jfutNMtU=;
 b=KxQ3aL6UjcG2ZlFNh8BDya6q+iv7eB+c29e1y+lmn42UpL7SgxQh1ZVzSwZ148KK2b7pDROG73By7W2CsOxxZ1ihgx7m/zAxyRLKjY0bl7RR5ogIMHGeFF0FazMTCue0tW5ddWYqqUil0o2j0vN+bLDDUnoal7nFjrSMto+Zj85fETP/e1PuZ7BTCmd0WiNyCZ3nLkBXPheWecsXNJ72yiSuZHStkaXl+9EDHaBk5xy6UqpU/IozZf3Pn4q10ncfaOiaXsUQkUWgJYwc07YqLam+6xneO+gjsY+wc2GJIuifvpWS5ZkH7s+4QtUEIbN0dTnkcsQgWmVaOu0CPfatbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB6940.namprd11.prod.outlook.com (2603:10b6:930:58::17)
 by IA1PR11MB8173.namprd11.prod.outlook.com (2603:10b6:208:44e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Mon, 28 Aug
 2023 22:34:38 +0000
Received: from CY8PR11MB6940.namprd11.prod.outlook.com
 ([fe80::e8ca:2e48:a644:5e18]) by CY8PR11MB6940.namprd11.prod.outlook.com
 ([fe80::e8ca:2e48:a644:5e18%7]) with mapi id 15.20.6699.035; Mon, 28 Aug 2023
 22:34:37 +0000
From: "Chang, Yu bruce" <yu.bruce.chang@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
Thread-Topic: [PATCH] drm/xe: Enable scratch page when page fault is enabled
Thread-Index: AQHZ17JKD93JZooVqE2n7PDAlCiU37AAGoWAgAAwHmA=
Date: Mon, 28 Aug 2023 22:34:36 +0000
Message-ID: <CY8PR11MB69408A18DEF63B22D8FD0AEAC3E0A@CY8PR11MB6940.namprd11.prod.outlook.com>
References: <20230826001412.6949-1-yu.bruce.chang@intel.com>
 <ZOzz6eMcc+ou494X@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZOzz6eMcc+ou494X@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB6940:EE_|IA1PR11MB8173:EE_
x-ms-office365-filtering-correlation-id: 6863c449-482e-43fd-09ee-08dba816f5d4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gSNhixFIFLREfVGbDR9Dd3QOWWZk1GINqhaw4lYzsAyXSjlpXT4z4MilIpqORiC7QRuuvMDAL43kkZFwi3nx4f5QBsmuOELnJFai9B6klOmHS1nv4RrVjRHjIPI+w9KIWfucPJNbbb5WBPfdT8s2X5km8v+iIqJj6hNnsocmxdjsXqqDKFwZPFTrfKPgZNEbNFSIgAudnU2hP9wziduXD6CPpKQijsltNbEjLDJEdAsJSdqlVPsk4GPV5+4RZBR2wETOvK3PCOp1+fCEkGjGTjJ0SDvaAH4Vo2kUrTRcH3EcWWauCAdWjnRMp0xallJHXmiesU2We2+VitOwwanaPtza+CptLq5QDoN+T3lNiFumq85Dm7iEniAJYId6RXiem5+4hIMRj2q+Uwexab/5tX2zChneimU4FB4LKRsvmhsRKXhkhENY4Euc4ZWQxrLzd+dov433qZXEfIq1b7yzC/ZaOXnFZ9ojvus2hkPh0HTwAEUzs+P/AxEohWr7ARCwUxCEANIqg45kvwSs2TlqfhZjHSfRwZ5E120itzmHoDrYXJGEFQtVfxptWaLT4RF0XoATW6YpPgWT7wn6uK0GxKiKu9ZE558j8xuDXCUAenvygUn5Rk7GGFD+lhx+CAC8
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB6940.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(136003)(366004)(346002)(39860400002)(1800799009)(186009)(451199024)(478600001)(83380400001)(122000001)(26005)(107886003)(9686003)(7696005)(53546011)(6506007)(71200400001)(55016003)(86362001)(33656002)(82960400001)(6636002)(2906002)(52536014)(6862004)(316002)(66476007)(38100700002)(8676002)(4326008)(38070700005)(5660300002)(64756008)(76116006)(66446008)(41300700001)(54906003)(8936002)(66946007)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?PR0SgGP5hpcZn2m2+KssZkJcFWDLQgfdmHSBHvTz7KnxDDkrggQqkcHFxiAl?=
 =?us-ascii?Q?VLaRMG1qvxqNjAjcdzq3TGXcfzUOTd5ccc4NKVZoxEACGQXKc72M8TLEUYVw?=
 =?us-ascii?Q?4xLPU/PyAkPcEEk7imPfx9wdzCd6uL7TwYB0Jkf//r0VwKXdvTih4x0yjKEp?=
 =?us-ascii?Q?oSuteOOjI2DwZ+LMFYNk6X0Gpha5jVHG/sGSU7GBdz9LIihfGOn935PTAdiq?=
 =?us-ascii?Q?aIK1sdjiPtObnkfWKpJlESKy4GYGVJJSABUNCAa81XhIsI6nk43G38QpNr9E?=
 =?us-ascii?Q?vR19WU0AJ+p6Z0HHYmZHslUK61MeiWYI5vCaWjjX/ZCQrNrKSO4eO+zOrOpZ?=
 =?us-ascii?Q?vzGXdjTTAkn7wD4i3ZtMv/nriYu6ikvTmNK5vh8yZaT72HgGiHh7pshtQV99?=
 =?us-ascii?Q?EJVdyyo9kVvRyywTKxPX/aQeH3+baKrcnH851tzeUG/j1X6WmZoKRNDjfW5N?=
 =?us-ascii?Q?O+eCDofrxhfDfkGBlOIei/sl8vCdcDFMo4K05Ox71su7FLkUOc1vXTCvr7y2?=
 =?us-ascii?Q?CM6PQDnlBHCTfiaqiEbnn7zVYJKyHVs9HjJwS2iDDg5rviHr6NIoC7pxWzgp?=
 =?us-ascii?Q?wdpgLlFydUEZbj8lAH3iw7GmiJUby6hftUsFP+SlKK/3ZgtJyYyfcJZxd/Yd?=
 =?us-ascii?Q?IHiASz59+AlfDVlmjfQ18AkuaVa8UGJtcRLSSEooWpYfQJ6XZxK0o3mv2IVa?=
 =?us-ascii?Q?mP1nHnAjAvVTghwTLo7NCvIyaZrI6pYdCIhWYkmbHP2Zd1urjLHFMIFpyrtO?=
 =?us-ascii?Q?6P7FfLIAl/dIgv3v4LfJx/MP+hpULygtXsHgNzlTEB6uSuqbhBeLfGkpfv0M?=
 =?us-ascii?Q?ksvjfb2r0C+7QGIOjJaYMZjssufXEgLAOcPzuDc7BCSgvedcIsc49sDDgthb?=
 =?us-ascii?Q?tuMo1ytGmROo5hBOtI5Yi/SJm3Ku/D4wD29ozIwrnUtLbyJ87fyjiPiOY72G?=
 =?us-ascii?Q?mYU8GCVFHGEY/yYNC6naEcHmDHK8FKm3MAGS/ZesMF33Lhvw7g/jwMh3dJ9D?=
 =?us-ascii?Q?xoYCqvsplegyihjDSiE+l5uDBdee6QV3UHqwGQMk4XvopheTh51OCWubJgcd?=
 =?us-ascii?Q?OnV3PpSwilOpqZ6VkygmkWJzNFjd7ExHZwXYd6KdnU6RI7UGgF/Ifmnnv0aJ?=
 =?us-ascii?Q?+hY9oUhMpt00MEpBSv77xFFBEbMBYUEkTJT1TteP2sEeEXZyj6PM1xJ4KAen?=
 =?us-ascii?Q?52QxqurOpmekc3feAr/qJ7cOdspSz+FoQ87OrNOeebbXwutlZpOAsZrVvto5?=
 =?us-ascii?Q?Il31TdUZe8JRuOtRof8cCDFx1gnhJpP+EN/JGGaPsLXVp8OKWGNYD6sSCSPs?=
 =?us-ascii?Q?shJtAsTAYLTeibNVebomSWBVctYNNIJOqMx5/jBuTivtqWDyKtRbWL5BnCA/?=
 =?us-ascii?Q?oj91vaJTegF3h9zS8nmpMBU0P10X2ooRW9iGhtvfkJDsDOFJ1u2v7gNaTBY5?=
 =?us-ascii?Q?nR92JH5QrvYgCbz1rJx08gm4vD/PyA2sKAKIJGqRl7SR0F2V+gmVcPUKCdvK?=
 =?us-ascii?Q?rGmUR/kvcrkbNW1QFeu/UBqtMPVnw8QfN21PmPNHG8Twxco8ZJ5wbWMC0EJ9?=
 =?us-ascii?Q?Ra4oSFmxQwTeC+sXkZlKEt7kpLM+aP8zib4oK+J9?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB6940.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6863c449-482e-43fd-09ee-08dba816f5d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2023 22:34:36.9543 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1RwsCdQwWpSkGxzjtsepksCKangL7Sh6wlfHUcT4mKgIjxq6fhjSrv4y+iGgsUz/QWVaC/4WpvhuTa/XiZi4zhGLzL4wPJeO9ijuaiYZUTA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8173
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Enable scratch page when page fault
 is enabled
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
Cc: "Summers, Stuart" <stuart.summers@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Brost, Matthew <matthew.brost@intel.com>
> Sent: Monday, August 28, 2023 12:22 PM
> To: Chang, Yu bruce <yu.bruce.chang@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Zeng, Oak <oak.zeng@intel.com>; Welty=
,
> Brian <brian.welty@intel.com>; Vishwanathapura, Niranjana
> <niranjana.vishwanathapura@intel.com>; Summers, Stuart
> <stuart.summers@intel.com>
> Subject: Re: [PATCH] drm/xe: Enable scratch page when page fault is enabl=
ed
>=20
> On Sat, Aug 26, 2023 at 12:14:12AM +0000, Chang, Bruce wrote:
> > i915 can use scratch page even when page fault is enabled, this patch
> > is trying to port this feature over.
> >
>=20
> I think we need to ask why do we support this before merging this.
> Because the i915 does this is not a valid answer. Please explain why a UM=
D needs
> this feature.
>=20
Sure, mainly for EU debugger support and any potential prefetch WA.

Will add this in the commit comment.

> > The current i915 solution changes page table directly which may be
> > hard to make to upstream, so a more complex solution is needed to
> > apply to the current Xe framework if following the existing i915 soluti=
on.
> >
> > This patch is trying to make the minimum impact to the existing
> > driver, but still enable the scratch page support.
> >
> > So, the idea is to bind a scratch vma if the page fault is from an
> > invalid access. This patch is taking advantage of null pte at this
> > point, we may introduce a special vma for scratch vma if needed.
> > After the bind, the user app can continue to run without causing a
> > fatal failure or reset and stop.
> >
> > In case the app will bind this scratch vma to a valid address, it will
> > fail the bind, this patch will handle the failre and unbind the scrach
> > vma[s], so that the user binding will be retried to the valid address.
> >
> > This patch only kicks in when there is a failure for both page fault
> > and bind, so it should has no impact to the exiating code path. On
> > another hand, it uses actual page tables instead of special scratch
> > page tables, so it enables potential not to invalidate TLBs when doing
> > unbind if all upper layer page tables are still being used.
> >
> > tested on new scratch igt tests which will be sent out for review.
> >
> > Cc: Oak Zeng <oak.zeng@intel.com>
> > Cc: Brian Welty <brian.welty@intel.com>
> > Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> > Cc: Stuart Summers <stuart.summers@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt_pagefault.c |  9 ++++--
> >  drivers/gpu/drm/xe/xe_vm.c           | 48 +++++++++++++++++++++++-----
> >  drivers/gpu/drm/xe/xe_vm.h           |  2 ++
> >  3 files changed, 49 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > index b6f781b3d9d7..524b38df3d7a 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > @@ -137,8 +137,13 @@ static int handle_pagefault(struct xe_gt *gt, stru=
ct
> pagefault *pf)
> >  	write_locked =3D true;
> >  	vma =3D lookup_vma(vm, pf->page_addr);
> >  	if (!vma) {
> > -		ret =3D -EINVAL;
> > -		goto unlock_vm;
> > +		if (vm->flags & XE_VM_FLAG_SCRATCH_PAGE)
> > +			vma =3D xe_bind_scratch_vma(vm, pf->page_addr,
> SZ_64K);
>=20
> I think this would be better.
>=20
> s/xe_bind_scratch_vma/xe_vm_create_scratch_vma
>=20
Will make the change.

>=20
> > +
> > +		if (!vma) {
> > +			ret =3D -EINVAL;
> > +			goto unlock_vm;
> > +		}
> >  	}
> >
> >  	if (!xe_vma_is_userptr(vma) || !xe_vma_userptr_check_repin(vma)) {
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 389ac5ba8ddf..4c3d5d781b58 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -1262,7 +1262,8 @@ struct xe_vm *xe_vm_create(struct xe_device *xe,
> u32 flags)
> >  		}
> >  	}
> >
> > -	if (flags & XE_VM_FLAG_SCRATCH_PAGE) {
> > +	if (flags & XE_VM_FLAG_SCRATCH_PAGE &&
> > +	    (!(flags & XE_VM_FLAG_FAULT_MODE))) {
> >  		for_each_tile(tile, xe, id) {
> >  			if (!vm->pt_root[id])
> >  				continue;
> > @@ -1998,10 +1999,6 @@ int xe_vm_create_ioctl(struct drm_device *dev,
> void *data,
> >  	if (XE_IOCTL_DBG(xe, args->flags & ~ALL_DRM_XE_VM_CREATE_FLAGS))
> >  		return -EINVAL;
> >
> > -	if (XE_IOCTL_DBG(xe, args->flags &
> DRM_XE_VM_CREATE_SCRATCH_PAGE &&
> > -			 args->flags & DRM_XE_VM_CREATE_FAULT_MODE))
> > -		return -EINVAL;
> > -
> >  	if (XE_IOCTL_DBG(xe, args->flags &
> DRM_XE_VM_CREATE_COMPUTE_MODE &&
> >  			 args->flags & DRM_XE_VM_CREATE_FAULT_MODE))
> >  		return -EINVAL;
> > @@ -2783,6 +2780,39 @@ static int __xe_vma_op_execute(struct xe_vm *vm,
> struct xe_vma *vma,
> >  	return err;
> >  }
> >
> > +struct xe_vma *xe_bind_scratch_vma(struct xe_vm *vm, u64 addr, u64
> > +size) {
>=20
> Nit, the size argument really isn't needed.
>=20
Sure, can hard code it.

> > +	struct xe_vma *vma =3D 0;
> > +
> > +	if (!vm->size)
>=20
> xe_vm_is_closed_or_banned rather than vm->size check.
>=20
> > +		return 0;
>=20
> Probably a ERR_PTR with correct return codes.
>=20
Will add this error check.

> > +
> > +	vma =3D xe_vma_create(vm, NULL, 0, addr, addr + size - 1, false, true=
, 0);
> > +	if (!vma)
> > +		return 0;
> > +	xe_vm_insert_vma(vm, vma);
> > +
>=20
> Need to check the return of xe_vm_insert_vma, also probably WARN on this =
as it
> shouldn't ever fail.
>=20
Will change it

> > +	/* fault will handle the bind */
> > +
> > +	return vma;
> > +}
> > +
> > +int xe_unbind_scratch_vma(struct xe_vm *vm, u64 addr, u64 range) {
> > +	struct xe_vma *vma;
> > +
> > +	vma =3D xe_vm_find_overlapping_vma(vm, addr, range);
> > +	if (!vma)
> > +		return -ENXIO;
> > +
> > +	if (xe_vma_is_null(vma)) {
> > +		prep_vma_destroy(vm, vma, true);
> > +		xe_vm_unbind(vm, vma, NULL, NULL, 0, NULL, true, false);
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> >  static int xe_vma_op_execute(struct xe_vm *vm, struct xe_vma_op *op)
> > {
> >  	int ret =3D 0;
> > @@ -3205,7 +3235,6 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void
> *data, struct drm_file *file)
> >  	err =3D vm_bind_ioctl_check_args(xe, args, &bind_ops, &async);
> >  	if (err)
> >  		return err;
> > -
>=20
> Not related.
>=20
> >  	if (args->exec_queue_id) {
> >  		q =3D xe_exec_queue_lookup(xef, args->exec_queue_id);
> >  		if (XE_IOCTL_DBG(xe, !q)) {
> > @@ -3352,10 +3381,13 @@ int xe_vm_bind_ioctl(struct drm_device *dev, vo=
id
> *data, struct drm_file *file)
> >  		u64 range =3D bind_ops[i].range;
> >  		u64 addr =3D bind_ops[i].addr;
> >  		u32 op =3D bind_ops[i].op;
> > -
> > +retry:
> >  		err =3D vm_bind_ioctl_lookup_vma(vm, bos[i], addr, range, op);
> > -		if (err)
> > +		if (err) {
> > +			if (!xe_unbind_scratch_vma(vm, addr, range))
> > +				goto retry;
> >  			goto free_syncs;
> > +		}
>=20
> You don't need this change, GPUVA handles all of this (e.g. it will creat=
e ops to
> unbind the old VMA, bind the new one).
>=20
> Matt
>=20

I was also concerned about this change. Good to know GPUVA can help here! T=
hen
the change will be a lot more cleaner.

Thanks!
Bruce

> >  	}
> >
> >  	for (i =3D 0; i < args->num_binds; ++i) { diff --git
> > a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h index
> > 6de6e3edb24a..6447bed427b1 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.h
> > +++ b/drivers/gpu/drm/xe/xe_vm.h
> > @@ -212,6 +212,8 @@ int xe_vma_userptr_pin_pages(struct xe_vma *vma);
> >
> >  int xe_vma_userptr_check_repin(struct xe_vma *vma);
> >
> > +struct xe_vma *xe_bind_scratch_vma(struct xe_vm *vm, u64 addr, u64
> > +size);
> > +
> >  /*
> >   * XE_ONSTACK_TV is used to size the tv_onstack array that is input
> >   * to xe_vm_lock_dma_resv() and xe_vm_unlock_dma_resv().
> > --
> > 2.25.1
> >
