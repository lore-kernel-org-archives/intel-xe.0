Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9D4DEDE9AB
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 18:07:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8053110E8C4;
	Tue, 10 Sep 2024 18:07:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UmaT/ZAW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34B2610E8C4
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 18:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725991659; x=1757527659;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=242YZH6DVwQKrruP8yvEBZo9kU51PWN+1IyXJZ7xVRQ=;
 b=UmaT/ZAWxHptSJ2NZ4YL7Azg3d9EmG18VWhW06B+cKNzGOh6uZDb4eY+
 P6aiT5JFnFT+8sh5rhv4hgUh+vcCkHII4LEY9heFTTdXRT4wbaL8yFc8y
 Fy5qBltDWhzWJe6RGikPKnTXL552hOtb2eUbaa8+p2PO2ikpDheF7CdSd
 D9ir/7/OjxvXYbCg3hRbXIoKdRZ0+L6HIyOu4iOkEj1NF0ZLYEUtjuGuw
 8582pxK7eoCO9GhNPfohEvslV4wZp/m6vi/1ll0vUb+tvw1Fs+OgufTYf
 3iPJ+CaJSWYgongA4iZW2BU62qYOwjxXLUiRWTCtfrYQms8i1USjPK0Br Q==;
X-CSE-ConnectionGUID: CeJUduqkTaOZ5YXRLuCcDA==
X-CSE-MsgGUID: kIUGFMdTRIiDzAbeJXL0LQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="28497068"
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="28497068"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 11:07:38 -0700
X-CSE-ConnectionGUID: jhKn3APFTymkFhB0u6nB6g==
X-CSE-MsgGUID: WPe+NDvJSjSNeY0+kYBtEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="72087303"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Sep 2024 11:07:39 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 11:07:38 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Sep 2024 11:07:38 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 11:07:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fA5FgeCSDpUbjycf57erDe1rV2TqpFMoMCYqoPZsFxl+sm3+0wUCQoTA/eSa/dlXCt4rpdFXr3OczASdJ7ctx3RKzw6Pl1sMEZ72UKZt43BbL8Dlc1b+oa1q20Vatca2usO5NwhuA7Qc4Ii//zGwZrLquBrgs1du1fB2+3y/E8CAqSj9n8w4ESY6Aw/RUrYb0lUYH0huqhg99yW2HxIXxH2Ytl5atubl02tXOrNf3+Aeh4iu7xhNodiPXqfoSVjf3tlIWReAJLtHKCucVnlvT0nl3nqvzE5+2gVCbmMhunsYJa6EtSNDtxESN3ExLPehoC9ozkMJky/sS+rg0xdHEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T+52FSt024W1O6j8lJ5cUzcKnYSvzCNKin9NCoecs5k=;
 b=OS+aZ3seQLN4zuAIKOeF4v9bH+yJq6wuFWgsLW39yIK5o8C0jntKJNV6Lj+59rJxmEqAgUpVwPamqqVHYpey0zfTfALR5aHGIrOhpA2r8Vz+EnwGPrQHoK0GTyiEzJWNsBwPzSWgkxLpJefCCmMw1wBAPdwsEPtgaU498/p6kJQgshdb+LaGCMexsu182kpdwEE0bBQFvWfTKxkSs03PartxTwyXxx4cKPYur27bplY+1DIibq7cfO6shIfv4NwXPQ3BDcdMeW9EjmE4jrnMR0iIimhpK7UZGUgVttSa16fOwcDlnS4VU/cGOGChd97+YSPHTgzJ2m3F8mQeNkE6Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by IA0PR11MB8379.namprd11.prod.outlook.com (2603:10b6:208:488::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25; Tue, 10 Sep
 2024 18:07:35 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7918.024; Tue, 10 Sep 2024
 18:07:35 +0000
Date: Tue, 10 Sep 2024 14:07:32 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 19/43] drm/xe/wa: Convert register access to use xe_mmio
Message-ID: <ZuCK5BpzcShySgMF@intel.com>
References: <20240907000748.2614020-45-matthew.d.roper@intel.com>
 <20240907000748.2614020-64-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240907000748.2614020-64-matthew.d.roper@intel.com>
X-ClientProxiedBy: MW4PR03CA0171.namprd03.prod.outlook.com
 (2603:10b6:303:8d::26) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|IA0PR11MB8379:EE_
X-MS-Office365-Filtering-Correlation-Id: 35a7b8af-f805-4298-2f34-08dcd1c372e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RAQPYy1aKLdMIDqLAaRP7QdqcYQnqEy+L8gpHiWkpa3SO/xNQS5WroJ9uvPj?=
 =?us-ascii?Q?L+eJWJ6iAdfBrRSQCsfcVEbJ+TZ8RkZmhx0WoLGnr30CZD3LwtlV5kC8A1yZ?=
 =?us-ascii?Q?y26+YoImqhCyMFdlQO55I6v+MJVrSWvxBT6BWQDuvEA1UprNBUMd2S1V+wuU?=
 =?us-ascii?Q?MYjPa9BwgpUGXbjJ7WjXijRLLo82lLAtfPRY8cRDvXjxde51EFv74eTVkZdj?=
 =?us-ascii?Q?j5st80y9w9YGaLFULbVp0ECTcip755TYBqVMhidFpx3NHG/VAmHgVNQnH2d9?=
 =?us-ascii?Q?G0S/8JJGcOWhRq/f3ieroyOtLl1R/EOeYuAMmmkzcspBDY5gNXWeXlQVOlhb?=
 =?us-ascii?Q?tJ/e3UHmfOWIIDB9UncDUo3UdjscnQoK0n+SCvqX/3zYgil09TLSvNFku9E6?=
 =?us-ascii?Q?DPlpB169iuk3jn1nMTMK3mFaU17y+WWJ6HQfgaGAcreAzbuzAVo1voU1TbyT?=
 =?us-ascii?Q?hM5MK0XB9cl1HR+UBf/nyqu9lHsNrKFRRkSOXwih86L26UzyHzYt7264h28i?=
 =?us-ascii?Q?RIDQ9AnRSmUAsHqiFAXtBpsO/LJ0/NtSfd8E++sRCfyQ9hNdHrVoZL0SeCBY?=
 =?us-ascii?Q?AvJjMk7enTu2fnHOuFwjqjY0ZDecK1c1FdOk1QpCeKYARCcIy8BnAr+YtZkW?=
 =?us-ascii?Q?t396/WrO/s8li+PK2SSqtL1yg+dCVdyNRXOdY8sl9W/Ve1jx/fGiQcO41fMy?=
 =?us-ascii?Q?ocstoL0jy9rVmOPDXsa/TBrZXfXjsaGxnK+NBEfSNA5zd192zzp1dixuyxRZ?=
 =?us-ascii?Q?6KM59fKQEo3J/vussSToChG0Ti8yMQGp2jiSx4b/r0VjMhztTVcygl55sOwg?=
 =?us-ascii?Q?1tvxXE+DnBZ7jnGyENjJO5OBPGBwZANVa6RtLIadSQcyxxiypZYSOcP80IBh?=
 =?us-ascii?Q?KLM7Uq9Tlzrk9Ffp4NZlOpCpKud3ZJN29JbDIEFn+t0kIEz4FOyZFnp43IBS?=
 =?us-ascii?Q?4MFTCZ3m8LvkcLa7ggHKplxJALHNMQK1xZ3p1f51Bo2goW3sf+n5FgCFtrjP?=
 =?us-ascii?Q?gUC3Sm9wNIuXP+961XowYDQfhFdMetRDamq0rUozMDVNvZCpRYBZSRr/zr/J?=
 =?us-ascii?Q?+24oEf3wpdlauMEy9fj+VU2XKBdUwVVf5H0OAaCgZz/EnFugtAhA1tcT0uyX?=
 =?us-ascii?Q?zAuaDlh1BZthCvo64l80QQyRTdmFnmJBjXUG7iAcXg84Sdv68EhP5jNSJ9SV?=
 =?us-ascii?Q?i/qa2q8mtVyvyQzK7Ld5wyNQ7h8+2rmnoZ2q2HWu0v4HpDQNyo/liRD8ymBi?=
 =?us-ascii?Q?S+uWK+9lm7Sme+9AnqtyIsL9WDWHsb9XkqDsJEVU58/LE7DAn6cqaD37fX2b?=
 =?us-ascii?Q?/ytK6fv7zPgjGNTNAs6OCnxRKmCpUHERmjd9HfDE21RWXg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?e/oQ4iZHFVDjoHlDRjaAWdDLb7NVutilqTqRomXU5M/S9Q6y+66Ti9ZdSKZq?=
 =?us-ascii?Q?LRmzZcYWUnLGV7arz93iCCKc8fHW9MzZCw/69ODLzAcJenp/S30g2BJV1q85?=
 =?us-ascii?Q?0OVgZ6VYVaEGeXjQElhu7ws08V8/G2fYo6FK1BWNv+NjE6vJzcWQOrfmZWOt?=
 =?us-ascii?Q?FCY2btI3ho/SG7SdIxdHj/lBInANJu4AbbeExY6ppVTyK7UenqtZxZf1hTw2?=
 =?us-ascii?Q?mEtOThKhf8I+l6W5X9PFi7dlVKO4SoPYjz3uH1lrRSvP8mvpTDdn0MSR8Hpw?=
 =?us-ascii?Q?HOw7bm800vCr82QGh1B6gUqQOzb4IwuH6lfd2IY3TSArtI6TzFHpFf0cfcF4?=
 =?us-ascii?Q?AKuk3DOBmHpjCSYUMh9M7vF07diceLkKLisLxLcOYcQTZ8u5jZslLhJ/6Ekm?=
 =?us-ascii?Q?FqOcuabtbQ+LMvx15JDFzVfb4ZZnfhBGbZkCPiDTd0m82Rpf/FZJjUwx3ybU?=
 =?us-ascii?Q?EzIEBg1yO99KlFeDDIf5J/ue8GRiROmtAaPk9PnpF1IFc9RgXSl9vfK5gzWI?=
 =?us-ascii?Q?XiA/5/6v1tI7t8Rn7vxAnmPbiZ5Yn+AhOhexLv2DvyCmOctmUIUcmZVwTgTo?=
 =?us-ascii?Q?Rz7eOEzGeCsI5cDDFAKcFYQfLDfZ/dB+IhG9sai9mOWIpzIxfhdUJctAkh3s?=
 =?us-ascii?Q?BCtJYJpn36PxfWb2Us8IsA6bOcUi81Pu0Q0+RXIvcLZkDfRbaOqCZtgMoXd6?=
 =?us-ascii?Q?XbYbINmobwXbkzXGSilV8XXQv8oDrfO0za6/YDjZsR5yaVaCtXa/fflXTDt5?=
 =?us-ascii?Q?ajIhqpMFvF2Q8WsyOqIrTTutW6yKhFHgbMTEBvHX0Wx0XT05vAkT/GjbthPA?=
 =?us-ascii?Q?8D7uVPKXD/jcUg8q6sVVIVpqM8GVVx/6ze0hkOhaeWXJNl2GV8AAyAHHTcjd?=
 =?us-ascii?Q?tjN/qTr6KTTBvazgaigWDJRryGDj9fcxajkFEyJkE83Edv5G7/B0Smq7gdmc?=
 =?us-ascii?Q?/elDCMdgFdrlvddhmveYQsDfPt7J8+Lko5iXZdhX15L2KPaOHQsYfUPb2dZy?=
 =?us-ascii?Q?Pk/UC5xjFpXyGeakZisOeMOlvPdIo/zUFKFmRUwB3sBSat0YM9TfXEjDO8m+?=
 =?us-ascii?Q?JlXy3u/zwMLv9qcPYZ8y+W+d6yQgwMd9QN3v2FTyjyTHKfYm+rmL3yGcyO6t?=
 =?us-ascii?Q?s0/HN6esVi59YytV/w4MqYOzC/Gmc8BO8ywjCyeiKuLJAIoNc7ZzaSMpaeLZ?=
 =?us-ascii?Q?2uBZo3TzV2kbkfBF3YPQwCdvJHJccm1kMN4xC8TkEREMP5xNUM5PY7Yxp3oz?=
 =?us-ascii?Q?P9Aa0ROURScMUjUt7KGFWU5XZ52MVPjKbSZwMw0zNm/N4MvYz9VRW8VEddMQ?=
 =?us-ascii?Q?psQ9s+ouqD/nFjPeAhGtkWZBH0GsV2f4fEoq+J22Jst/Pw5wFJsQ4KJwk2Bn?=
 =?us-ascii?Q?IZvv10Z8icGVnusTFOiZ2cbI3SnLgyyXz4A7lkKm8MsTRS6Onqped2en7ile?=
 =?us-ascii?Q?iMyC1D0gW2Ifb4MxZegeBlUAiWWVA4futHD93GZRByUu/DbEC6dfi3ZWd1YF?=
 =?us-ascii?Q?S6f0C1297vdx1o5IctDcrzFa8XWui0UsegRttbtqWVqMq8wUVtG2Cmkmjk2Y?=
 =?us-ascii?Q?EOcnuQZ5NOqAUfjpHHovDqwn59uMm5J5EVRg4IcaHXcNuE49KHOmmC3S+Crh?=
 =?us-ascii?Q?7Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 35a7b8af-f805-4298-2f34-08dcd1c372e0
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 18:07:35.9340 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eUA1shUQQ8bEAiMNlpD5fkgH9D76kDmV3j2rluCKo3u0mBOTNEtmGlGoKO60/4yFJVrs+5rrCDiL866W90QM3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8379
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

On Fri, Sep 06, 2024 at 05:08:08PM -0700, Matt Roper wrote:
> Stop using GT pointers for register access.
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_wa.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 28b7f95b6c2f..d8a5a85e9ebd 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -883,11 +883,11 @@ void xe_wa_dump(struct xe_gt *gt, struct drm_printer *p)
>   */
>  void xe_wa_apply_tile_workarounds(struct xe_tile *tile)
>  {
> -	struct xe_gt *mmio = tile->primary_gt;
> +	struct xe_mmio *mmio = &tile->mmio;
>  
>  	if (IS_SRIOV_VF(tile->xe))
>  		return;
>  
> -	if (XE_WA(mmio, 22010954014))
> +	if (XE_WA(tile->primary_gt, 22010954014))

this got my head spining... but blame on old xe_gt *mmio

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

>  		xe_mmio_rmw32(mmio, XEHP_CLOCK_GATE_DIS, 0, SGSI_SIDECLK_DIS);
>  }
> -- 
> 2.45.2
> 
