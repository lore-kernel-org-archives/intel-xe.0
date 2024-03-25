Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA673C54E58
	for <intel-xe@archiver.kernel.org>; Mon, 25 Mar 2024 22:30:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACB4D10EB38;
	Mon, 25 Mar 2024 22:30:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KgPcSksV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E46310EB38
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Mar 2024 22:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711405855; x=1742941855;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DXAZVNHeFxhTZ1e5KcEj2tYvk8FauBw1Hbq7Z3xk2KA=;
 b=KgPcSksV4oaTuI/eEoYhsL5Qx9uZnz8f4M9HbTlGz2MDAQHe3GzZ6i7x
 E4NwAY1qVKBeghi2CQlpyWliI+k1+6w4ENjNB4M/mFK6sL3TNchcgM9YS
 lpgM7/Af/IS1rG7CHtFAfl4fm1Jqme42yYSr32rlrroMWS0YeT05BIfOr
 V7T2wzdmMneKyFGTp2jezobqbCTYQoS8/rUQj7Ur3vz/XB5Mz/F+4aQnl
 cglev1HSTE+3Y/Ftjnv7FNyGsj7huKE8hnbptrYfTUKBlZ0xyuoucBesX
 fO7s1CsObWnem/sYOYcFFR2uOLP+plVDtJVRV2YKNn9JTZ+VRGEUBtHV2 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="28913792"
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; d="scan'208";a="28913792"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 15:30:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; d="scan'208";a="16146942"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Mar 2024 15:30:55 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 25 Mar 2024 15:30:54 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 25 Mar 2024 15:30:53 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 25 Mar 2024 15:30:53 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 25 Mar 2024 15:30:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LwhwmTfj5IJVgAUvdnkMZeJyGjTISX89YfeMo+4ENPWCYEjhBBQK2refau/AgP0Effr5XMP2h1K7MMqWjVwOF3Y+tu23OUwnkE85ZEztXW0Z1DMaFRjPswqbKUWOWydUEGX5xZT3UYQ73vCHo+Q8hZZwb0tIFyxVD1Ket5skgnLDiPdbGl9kvGoSFmSNEabrfkG0DvzAd9DTTLUCFoJCz+qm/Ev8kDht1iBvHWb+EV7lGoXqox1WcKNot4HVyy/SnaPn1A+j7y1hwl+XpBw6Ds/s56J7OUgyeRoedSjdextwsRbnjY6h4mlqv/MCvqTIUx8BHxdS160K8dUcfcPJmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/T/aVMv7EewHxwyibUR+28o4ugJkIfIsEs9gmZ81XaA=;
 b=Oy6Y6KIHfa2rcahvtk0dLL0OjZU5swR+hBqf8SpIVTPC9Gw1T+cL8jPJbWRtdv48ftVmPbo97DER4pYMP9LWYX895jpCgs2mgfhQh17lkEQlZQldETqzleENJxjz48N7OC+elf7UM9yaIELhPMwxl6hGx6/QySqfRIICROr36ALLlCuQHtvl0pWoc76vPMax51KCF4ZnyMKgBkPA5nsUwKxNW8NxSWmPZPabGd3H6u+JyUWlI2cwvRXFYEv9xvnVWGyHa27Y6/ydAVlUDYBtObe/xNaHhWNqwTzz5RreXCyjNCi35AXsj8zEuqNW5pBV0Xq3dm5++YzO+fNWb1I+4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by IA0PR11MB7953.namprd11.prod.outlook.com (2603:10b6:208:40d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Mon, 25 Mar
 2024 22:30:52 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d%5]) with mapi id 15.20.7362.017; Mon, 25 Mar 2024
 22:30:52 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>
Subject: RE: [PATCH v4 16/30] drm/xe: Use ordered WQ for TLB invalidation
 fences
Thread-Topic: [PATCH v4 16/30] drm/xe: Use ordered WQ for TLB invalidation
 fences
Thread-Index: AQHacRaeSCe0WKIYK0eEyl0srFSwYLFJItJw
Date: Mon, 25 Mar 2024 22:30:51 +0000
Message-ID: <SA1PR11MB69911151ADB30C51C718B44892362@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240308050806.577176-1-matthew.brost@intel.com>
 <20240308050806.577176-17-matthew.brost@intel.com>
In-Reply-To: <20240308050806.577176-17-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|IA0PR11MB7953:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Bs7hQ8dHQSpwp77Dk8ctZkvz3X78ntae1xQeDfarm1hmtvdXtebVZ4YOgq5cLv+lRPwGEuknktf+pOo3211rwIWkA/nEY9PbTOJyO6OfTEAbzDWbMSG5Q8BvbChkkqmu3eGqh3DKQWTFnkG8ceRNNTfqXPDcWSlNhXk2DKvQ0j3z65nwr5ftju8nUbGwrph3e+JJzU2dBL3HHyZXrppd19vRSfRQhXR9EvAOAC6QMRbC5nB3/7m+lZ+PdqZ7lVRD5OxzlizLZDWCMIJI8EbcrcCHf5Ckjd7dSPgofyPUTHo5klO34zmNNWaXqRGh5DtFfm5vpGqcXnQy5zabo5FPDsOI2CEUwVnvX0oLp1OIbnApYpANEjaxsCZNQlySnSuXqZhGsYE+G9H8j2i6gWaVaH701tU9XTPWOQM4/xzwEJnKwHtv6hn1fevAY8oixRFb/p2T3iDC8EImbbTt8hhrtdU1FAIT16yqEZIYrFKFuuUVfs5uR7IoEMWDgom5rl8Oay+VMZ+mhxiY+wd8vMxqly09AJHgIjwLvg1fYAABMZTJk5YyazcXjzXWU2NAuMMHh+QRrkGetdd4JXCnISnV5edXtK4mYGvjfZv81rXuk5Iw0TnIWQl2d0vBhLVJbDXy6abhKLz32nndq1AIT+hiWAgys+P9ixbvBLb1X/cXrBI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?9Hhqny4rNMErgsWiwcsjoFLnoh5nQBH7sn96hIo47oOdQzGVeurSjygsgwzM?=
 =?us-ascii?Q?RbeAN0RXa4zH796sdEeK6Yxjv1tQbocgx8rlKhhgty1fiwEagQEuWMJqhZDF?=
 =?us-ascii?Q?clT+wHtFZbSw5+i1Lw+0fZD4v6yFxQ9+nD1P2zmN9YSjA9bySiJsWrxIFhSB?=
 =?us-ascii?Q?stAgOVCQLzmJG1QIOR1eio/GzDNOUJbRcTv2GHtXQnEpndOWOfiTwa/w0rtw?=
 =?us-ascii?Q?Ky5Q9wBtr9JWtKzoHKlunikX4VGPyZcZaA1anQPz1UkG3H37xPuu+rXAe3n7?=
 =?us-ascii?Q?sLiJ7rRTkAas4v/hOg21tIQtiL3YPm76BsxR3nqi9gEhbLti7z+oOpq/WzZW?=
 =?us-ascii?Q?qSJzmHVjV/P6NNq3KS+ukDhrby1JBZvyeYTHfTrcUzqwwH3qGp9R4RmD4U5M?=
 =?us-ascii?Q?utNHpR+ryXcLlL6GLgwlTl7D8pCh9WfCV+vK1+IGLhll6AJ2se6kL8Uc82Hx?=
 =?us-ascii?Q?4UIeuAaYiqRFBISzcOMOTpvDYmyyviwJ+3ART+KjLAPvIdYmaQIMBNE7AA3O?=
 =?us-ascii?Q?S1thphOoAt0NbKm+gN1McAi4djj7mS3IEa9IIievLTUCy1gZLPQDrTzDtazN?=
 =?us-ascii?Q?pQoIHTrFPKFIS17mJaumHx6Q3RLTglEuGGddSB23DC9QSWoko9/5XnocGtlj?=
 =?us-ascii?Q?ZZ+ss1UTCW/NxoIV4OZ4nxX8qlgjty14kJF0jANF9+DwgrsJdIQj3QWinF6b?=
 =?us-ascii?Q?2zF1SmGRjvQs9BvuO4aR9tBiv/JJsv/Cv5MSPJ423b21NfKqmiS+HE4quHbl?=
 =?us-ascii?Q?QTSN/RzuNgz6RBC6iXs/+1uvi4Q7xuiit20pJxROsahAQqi91xqqZFaV5IFO?=
 =?us-ascii?Q?T5HSdNxJAlrFzM2YJ5jBfBA7pW5xbPtTSBLR10mTPO9DiwcCoYGIKj75FUea?=
 =?us-ascii?Q?3HCfPNGwsrWQUHi5CWvxR06X+Ot6U4EL6MVtXbWT+UDJ2411szBf78KsiLPn?=
 =?us-ascii?Q?d856FSjw+PiMdgoOl+c+YoUdMte7HdqilCTt9D0JqPmxjxLjNbWAPVpMQG+k?=
 =?us-ascii?Q?+FS9WRldobK78VFpWkQHNeDcXQcT99lhK6ynUoO1qCB39vYTEDZTtUrN/MvC?=
 =?us-ascii?Q?uVxVEY5rx2Li4udequImlk0HsiujKbhCO56VJRTzJ8tm9KFqRzGqGJEaGKDU?=
 =?us-ascii?Q?5g5GKHNehwQeWQB2RXF+CXd8YLSrc79CuLZ9pV78167kv+IRjXP8JwSjNYgW?=
 =?us-ascii?Q?HokIKNvnMhtp1JlGi4NLBfIdQySx+r98RxmFII+z7B89c1pKmnbJckOkHm3Z?=
 =?us-ascii?Q?p31+c8awaRlJxWDw2k/a27Qcs1Y5FKuQysnrzM5D8qj9yizBO1llGWDtU6Ks?=
 =?us-ascii?Q?KbQORsGp9NnUwVawLcPXdxThn6szKPKZtWVJpvJvZi6du6YYIbDsv1ITTdZA?=
 =?us-ascii?Q?yN1XcVGsoVN7lhTvQa3fisKQbOl/CZEzuTtV9nC/EGmS9rum8SHSJ6iGbEL6?=
 =?us-ascii?Q?wQc+FUikVXbRM0so2F9/ATKxNPYgJ6tkbVi1glw1+Kg6GNYVEkiuh+gRbfwF?=
 =?us-ascii?Q?sWMVMeDtYowN3VOGbvD/hnSzFFpcUlXoxLtYXMUurVMmFQ0a8/9o1VH+Zd+z?=
 =?us-ascii?Q?IHstKjJRJzcfob5HFzgsOEK+Z7vzR7yR8ailcmvc?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e3cd558-e377-453a-5337-08dc4d1b3a7a
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2024 22:30:52.0000 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LE43Jcpn7mEt//Z8pOosF/cp63bNRiB6vUlEQYG1pHHoP2JylqNHKalJhiM5NRPgjfUZZi12Bzx6F2w0qXL5ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7953
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
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matt=
hew
> Brost
> Sent: Friday, March 8, 2024 12:08 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Brost, Matthew <matthew.brost@intel.com>
> Subject: [PATCH v4 16/30] drm/xe: Use ordered WQ for TLB invalidation fen=
ces
>=20
> TLB invalidation fences need to be ordered within an exec queue and if
> an unordered WQ is used TLB invalidation fences could be reordered. Use
> an ordered WQ to fix this.


The code change below makes sense to me. But I think we should improve the =
description. I think we need to explain what need to be in order and why. A=
s I understand it, we need things to be in below order (just an example):
1)Gpu page table update (such as invalidate certain page table)
2)Invalidate tlb entries for above page table entries
3)Notify/call back to user fence to let user know above vm_unbind is comple=
te.

Obviously 1) and 2) can't be re-ordered, because 2) should be triggered by =
1). But 2) and 3) can be reordered if we use unordered WQ - why we want to =
use ordered wq here.

Simply saying TLB invalidation fences need to be ordered is too simple, at =
least it is hard for me to understand. Better to improve it.

Thanks,
Oak

>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 110d6917089b..a878e2217c7f 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -1107,7 +1107,7 @@ static void invalidation_fence_cb(struct dma_fence
> *fence,
>=20
>  	trace_xe_gt_tlb_invalidation_fence_cb(&ifence->base);
>  	if (!ifence->fence->error) {
> -		queue_work(system_wq, &ifence->work);
> +		queue_work(ifence->gt->ordered_wq, &ifence->work);
>  	} else {
>  		ifence->base.base.error =3D ifence->fence->error;
>  		dma_fence_signal(&ifence->base.base);
> --
> 2.34.1

