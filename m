Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94D07C282DE
	for <intel-xe@archiver.kernel.org>; Mon, 10 Mar 2025 17:33:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AA7310E00A;
	Mon, 10 Mar 2025 17:33:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MeFaAOgg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE65110E00A
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Mar 2025 17:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741628037; x=1773164037;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4UCgXwi/gf5lYmORXJ7qtrwJihFpE02pcuZtKFBUhiY=;
 b=MeFaAOgg0UJ9WdG/FkLK58bw8goZ/Z7xutQDRo+h5n33/flngmJkY+qp
 XuRUIi7RpkaXog+G4NvKRsrLR6obwBtU3cHNJSRQmhUgpE6oMQ3QId3MN
 fxuDYnZOzhDZZei5Sd0F91RG8D11qjZJAiXkyIMoZ3G5KNHM6xatYtSf8
 7PB23rb2E81k/Ze/CItqpldLWb5m+VMg+hM57AXt6pwfVMcYMtMMYqzll
 77ldAnfb9DkEU+nxgcKQhfv+AIw/DxGWBjGC6pacRecSCAjRmoZzVYL3O
 7rEGTcYK206uuYnoXb/hqzsLx+Ph7xS3UDD65wyvy+rRCZybKy+v2eUn/ g==;
X-CSE-ConnectionGUID: XOFy90LcR3yx3l+e3vQAqA==
X-CSE-MsgGUID: LJcwxcGBS9ihDR7dkWrqLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="41803772"
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; d="scan'208";a="41803772"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 10:33:57 -0700
X-CSE-ConnectionGUID: M/HmJ/I3S5extHbQ7kHf4A==
X-CSE-MsgGUID: BHoB+m1qQPuUgdsdLQEgkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; d="scan'208";a="119890124"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Mar 2025 10:33:57 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 10 Mar 2025 10:33:56 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 10 Mar 2025 10:33:56 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Mar 2025 10:33:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MZuG4O4H9uUAokVU0I5vf866MvEvTUshvUeb9TLLNXeH26WzP5aPpOC27UBASVqDPKOkPLJo6LxP3EjWQaUssr5PiBuEWuaPVOwRoxZ9QIQ8IYxiVFR24I83PXJlpEWxt/iEWv+3xrcoXJOU77RXebWThLFz+BXSDHNe8LD2zpHgutp1XVQYBL+eIW0sRrhPBU/2iSjz6CIHnV+lZz2rOBWzgxF/4sGQOLiAoPkCfyanckWS8PMEJsHHoL+OCza+X1Trsc8eESJxB3ZAzHCQANnD8XFjlr0GzisihyM1YC6BXH1C/dgzUlCmY7RLPuMDxZIXbWkMA3jf0tT/7o0Vdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W3JstulsQMZPKs0cb8Y3ZMRdDJ5prA1rKftLxv0dykw=;
 b=PI72rsQ8YkLUghNZEqEx33khNwzF5fbl+BbkDTyXGr1/beWim54Ba6zFjLMkbnHBciyW9kPXAhrn2THu2CICnsMuPIi4mSI0s56tyZ9EPoiCialv2aAJqmy+oFKFnI070IJIdI4UV7syPANftmudb5ZuNO8QIrHUHtSgnxkylNFy9Djtc+VR8+ZuW8CVvABam/VMKXCUp30pe9zBQ6cBOam1/xK0qGJJT4oPtWHaqj/bHlL5IqC60cexhWl3gomtX9359VDTOGo1uHcqXCZ6a94cvFh1fM0u+W6Jvz91+vv3aJ6QE+h4u5lW5sM33ebocgl8l8bU1Oso6RWpvK9Ukg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8427.namprd11.prod.outlook.com (2603:10b6:806:373::19)
 by MW5PR11MB5931.namprd11.prod.outlook.com (2603:10b6:303:198::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Mon, 10 Mar
 2025 17:33:25 +0000
Received: from SA1PR11MB8427.namprd11.prod.outlook.com
 ([fe80::b156:b61b:d462:b781]) by SA1PR11MB8427.namprd11.prod.outlook.com
 ([fe80::b156:b61b:d462:b781%4]) with mapi id 15.20.8511.025; Mon, 10 Mar 2025
 17:33:25 +0000
Date: Mon, 10 Mar 2025 13:33:21 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
CC: "Wang, X" <x.wang@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: remove redundant check in xe_vm_create_ioctl()
Message-ID: <Z88iYX5u38A-hl8p@intel.com>
References: <20250303004942.951699-1-x.wang@intel.com>
 <SJ1PR11MB6204E2A69594960A4A7AA43981C92@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <SJ1PR11MB6204E2A69594960A4A7AA43981C92@SJ1PR11MB6204.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW2PR2101CA0029.namprd21.prod.outlook.com
 (2603:10b6:302:1::42) To SA1PR11MB8427.namprd11.prod.outlook.com
 (2603:10b6:806:373::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8427:EE_|MW5PR11MB5931:EE_
X-MS-Office365-Filtering-Correlation-Id: fc6b3374-8ebe-47d5-5248-08dd5ff9a94e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Uv3+ZIaFeswhZpm++6m9M/I2iwrkxQk4JT3FoFsC56/nRqH+7OVnQ9znfBX7?=
 =?us-ascii?Q?/M4kPVr9jn7AAJFra1Wno73dVSaqKc8ODDewlOCotlNqNbS9bd6q7VOQx/EH?=
 =?us-ascii?Q?hx+8mrSB10iyW+AU1pnI37azpuR9hyTGU/tFe5Nwu6LQV2kbzQQdTtSTrPgP?=
 =?us-ascii?Q?uh7zDtHsNO/xZL6B/p+u7wZ9B1Vm+YrenrZb8/ZqRM7x41cP3QRvf1KMynsr?=
 =?us-ascii?Q?5/jJXV23Od9K6o7Z6YsdmVgvGwOlhnyOuSyR//2LFfEEl7IGQao2jbA56d5e?=
 =?us-ascii?Q?jbjucbCu3ElBYDnAjTkFcap2pbH9koB6y0yBc3zVAFcGoiC/pyOLAvnCvish?=
 =?us-ascii?Q?s7iN7lYXnAoS+LEp8o30QZqtyO3sWe4qY5oOxaeFTt2/OWX0jGm8VG7IZGVv?=
 =?us-ascii?Q?9b1GK72LyebS698q08G1WxGU9olfUQwAt70fgogWebRRK30SfV5QBbXEKU2R?=
 =?us-ascii?Q?d7KqR9ue+m4vcYTdIpAoDMmVmOyh/RBfz7V2yK5/OLJW+U4mSxpPaI1Qc5vI?=
 =?us-ascii?Q?MoYEXHM4Tazq599eOOYKxpAokFV1aE96tBN9XxNxJv8/UevT3mh3JNjffd//?=
 =?us-ascii?Q?vhNiWprkYKOajVvr00FkiVoTBIQGRKTzY39qrhs+EAyYwjp9pJPGP9/8PCXh?=
 =?us-ascii?Q?pU3Q30TwPnACux+cXl/fZqEB6leHr0kCjLK8x5y0K4rPGg4a8lJTBOVCzWHb?=
 =?us-ascii?Q?osg3Pq4g4lN02SMeEGhzFz5VN0Nyx+Zc7jOz67yHmoJesstBGFQuSDjpBcTz?=
 =?us-ascii?Q?Jcm2wl+cllXvQ2zL67dVOU+OPEDG/YhaivuUHKd5m5S512eaoDjCt8YIMjDS?=
 =?us-ascii?Q?dwDpEnov9WuUeSK80CMPsMvLtafXq6A8mZUGJLi8HQd6Gi6zdAiWzjFdu3F2?=
 =?us-ascii?Q?DDq2KjQWggNQpusrMqxrXIuVu2ZBbGmkvaeSIcDJWFey+GMN1wfS/KNM0W0j?=
 =?us-ascii?Q?0LbbYUV1IAnkBlggxUeoxBFrBsdp+U8JvgIwyr5qzaBeedXdvKPvKQh6BjGr?=
 =?us-ascii?Q?MU3ZM4WcpArxUSDToNpLD2BHe+OTlYwh9j6Grjel0HrexLBB/bIbdimXvsv2?=
 =?us-ascii?Q?iPGfeGfECfXDhe4DF3QVIUNOIDezWq/a1gFeDT7EJiK7RErTotwbMpiipwUT?=
 =?us-ascii?Q?/iHitNRdFJXqr1UUHsXU9FhPtS6Zk5FcG3NX2bZwfezD9pcBkxAv9V0yM8UZ?=
 =?us-ascii?Q?BVn/mk6F8CZSvpzTWmt8YiJ+Vlk46/EszqTPuGclb/w16PIk37bQ/rwEhK0V?=
 =?us-ascii?Q?nGfEB324hk8h/d04nB+PlVm7JIwej3vwIpla9Z+DhkHF0HmGFiFu9fFXHrlz?=
 =?us-ascii?Q?NKpW5WvSEPf6BNB90ExiVRkY3LDiNWyyNhlMHG+1PptmVlga1xuiMgZOZikf?=
 =?us-ascii?Q?3FM3zjtrMl9vMkg3Hb5FEn9/2L9H?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8427.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bGuqOQlX9Rhf7Az3TJfLgovlxz7VkadyRiz+QI6v/gFIBypD8eWbxuwZ5YAb?=
 =?us-ascii?Q?W1+LNEHpo+Jg9Ax98iGtdC215vE+SMgfv7nOe5ciNf9EBW7Z5M8KSuj7ul3p?=
 =?us-ascii?Q?0cdNoLj+BlLKxf6/+F6hLyuG6rVnkvtvwxFwSlJ7ZsxFk2K1+8IWy3G2/3Y/?=
 =?us-ascii?Q?fWb6NPIyMtpKah62iErCBZNPLfL5udmd8dZGaUy8dKH31gANOztaLY0uXOVu?=
 =?us-ascii?Q?IH0xSjHFfAYrApa1L3OxWCWpiGiXEhsjTifG6SyiFkOIZPuutfYalvZFKQOd?=
 =?us-ascii?Q?RyY9nAPvBbjl/oW+gedF34HHRHhiyipRZtTdiOMAAhK0W9FUyD+f2Y3eaGex?=
 =?us-ascii?Q?QDfj7VFy6BKjA3Wil3YVeTA06+PiWB01Veb4MlfAVKmX9xmClRiguW8Jcvzm?=
 =?us-ascii?Q?Z2+iUj6iri/43yEufEk2G01FsCxIZUpjPVcU9Upiykz16wezgbD0v9OErmEN?=
 =?us-ascii?Q?t/MATnUg2iIdzCNus7VROZlvTRLYVf4JwmL3XIalMuSHFf5mo2VKVzrw/zgO?=
 =?us-ascii?Q?hvmFp1+VR7lTabR4dbMso+xviXJTJdXxy6+G5fEvkN4H1N2xopuZuC6lRmyo?=
 =?us-ascii?Q?BATRzmHrjb4I1vzxqE19mUaUt6QXcCVBczh+/ca///GmYE69LC2lzCgVybL+?=
 =?us-ascii?Q?Nz8ltgetKiCl/Y53g3w/PFDfRSh7akwnAcAOvdMzJXG/glZ4cWkJjs7W2tY2?=
 =?us-ascii?Q?iXvfhGOjG0vV9qACMyB69DKS8S8Wl8XX3tX7uyRH8Zxlo1VmyymgWdb2M5DD?=
 =?us-ascii?Q?lhrEAD4LjRuhK11W/EL+O9us1+dMz66fTUWyMrOyRyc7yWZmCWjzOMbcPfe/?=
 =?us-ascii?Q?2+WtGWwCHkNqbVLfyGGB6+L8AQtyJMJ/yuqiPoz5VsXawjQ8BJ60K3bryEJd?=
 =?us-ascii?Q?K4vEf80gAcBvIVCcLnuy3AonJ+/QlfpC2ElA2q+i7Z1QwuKkHHfjwUX9uUOo?=
 =?us-ascii?Q?GmnC5kVEW1eHaX7kgZPfMDARslaD8kaQHTsJJQgeKsTK8ORAsVBtx9pyDYzK?=
 =?us-ascii?Q?bvqeS0my29R1Js0J72IeE7ZwuVj9wjhvSACr9RM7sdzuwpJXb1HCgXRp5uYn?=
 =?us-ascii?Q?n7sJD3ncGaHyJsYevyBU5wEc6tuaxcos9LPBwFqrky1+B1sAR/YTLnK9fhc9?=
 =?us-ascii?Q?WA0PUvabESJhSl/9Mfp1AnbE7c+7bENsHQydKFEWpT9FCavsqlB9c9nPvYqy?=
 =?us-ascii?Q?Wb210xg8bCaVJ7ddK1/fZpRRqx6oekpp8fj3JJQLnSmI7iMhbNdSxCPFqZep?=
 =?us-ascii?Q?fB8heQZByHpX8gNiGDZxXVNtf7JCzVYhGcwNR+oLvcPOE5/xXOP7gZVzq3Oh?=
 =?us-ascii?Q?+YeXUjkIVqARUVE798ew645+keMBo3N10+/q25i+g6McFjJ730QTqgMh1zq8?=
 =?us-ascii?Q?CXzVpTilNwYrrAE3uuZTxJgRnksraARUKgKefCVd8bTcuo2l+xKfiNFc7zXj?=
 =?us-ascii?Q?7fy/nmtOq/cLNXtqbzcrZU1fXHSnwDrQ1HzlAz6qQei5mliTVtUJq16vpQVr?=
 =?us-ascii?Q?CpkRuTVs8Dd4ErKmjQhG33kP/wGEMhlERdIVkmk/P6MApTD/h6u1R9IO/4PS?=
 =?us-ascii?Q?qD1AZ1Xw0AjVCaTDgDgp6qkQ8DkV6+UYo5wDxqxCYDTEpVYZVMHtrY1D3B7y?=
 =?us-ascii?Q?Kg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fc6b3374-8ebe-47d5-5248-08dd5ff9a94e
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8427.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 17:33:25.0496 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mHlWyXB7+2Mms9nrgF0uPVqgtH6lN2549+MQfRv3FLywBiB1S70SewCXtDceg8zqo85KSAXx26CMtVgGe91fEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5931
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

On Mon, Mar 03, 2025 at 06:03:00AM +0000, Upadhyay, Tejas wrote:
> 
> 
> > -----Original Message-----
> > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Xin
> > Wang
> > Sent: Monday, March 3, 2025 6:20 AM
> > To: intel-xe@lists.freedesktop.org
> > Cc: Wang, X <x.wang@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>
> > Subject: [PATCH] drm/xe: remove redundant check in xe_vm_create_ioctl()
> > 
> > The check for args->extensions is repeated twice in xe_vm_create_ioctl().
> > This commit removes the redundant check to streamline the code.
> 
> Fixes tag?

Fixes: 7224788f6756 ("drm/xe: Kill XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS extension")

My Bad... sorry.

pushed with the tag to drm-xe-next

Thanks for the patch and review

> 
> > 
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Signed-off-by: Xin Wang <x.wang@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_vm.c | 3 ---
> >  1 file changed, 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c index
> > 996000f2424e..eb76f6854b2f 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -1798,9 +1798,6 @@ int xe_vm_create_ioctl(struct drm_device *dev,
> > void *data,
> >  			 args->flags &
> > DRM_XE_VM_CREATE_FLAG_FAULT_MODE))
> >  		return -EINVAL;
> > 
> > -	if (XE_IOCTL_DBG(xe, args->extensions))
> > -		return -EINVAL;
> > -
> 
> LGTM,
> Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> 
> >  	if (args->flags & DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE)
> >  		flags |= XE_VM_FLAG_SCRATCH_PAGE;
> >  	if (args->flags & DRM_XE_VM_CREATE_FLAG_LR_MODE)
> > --
> > 2.43.0
> 
