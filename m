Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65F5DD3C521
	for <intel-xe@archiver.kernel.org>; Thu, 17 Oct 2024 16:30:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C19510E877;
	Thu, 17 Oct 2024 16:30:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M4iClRLr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39AAE10E877
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Oct 2024 16:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729182610; x=1760718610;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=49OZ4BhpkPGs5MHIeRiPS7nhyc2X0O6jJyflEYqwlnU=;
 b=M4iClRLr2NckPxOVE+OTKtx2SDatQxwy8Ldz3H5tNOSAvo9jGsG93s+j
 Z77MeIx/r8vckrMDXf5szbg5+OB9QDRoA1yQsOBQy91OPfL/hRse/BOGo
 q9Q5StVzvar5h6qSh+tWi7kRBR5ZV/Z92Y+QOx06i8cTsadJbx7bP91UJ
 KBnp9hDV/pUezBDgRB5+PpCe0OIpQtne8l1qCsX2x8qUH7muCLkCOYGPa
 7obvbnJUFOjiO4YfnPmtZHdZ1ah0qTQEl4ze0WmOM8KlVf/TzQLI11sax
 QC4Ri70HjCpDAac78aEpgwwOsjF2PdBEH8rUNeLEJ0+wB9v9/QeQYZRcH Q==;
X-CSE-ConnectionGUID: qtNMyKeoQPGM9Ga0o8NM2g==
X-CSE-MsgGUID: t/ddXFesTrK9zyIMPVXptQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28779960"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="28779960"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 09:30:10 -0700
X-CSE-ConnectionGUID: oS0+n4hbQrqRwhDeQIoaXw==
X-CSE-MsgGUID: 3liUqe7FQpmwtJQa6RDDiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,211,1725346800"; d="scan'208";a="83245024"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Oct 2024 09:30:09 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 17 Oct 2024 09:30:09 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 17 Oct 2024 09:30:09 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 17 Oct 2024 09:30:09 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 17 Oct 2024 09:30:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=woq2cUDjdQNqgdqXFZ9Kz9qhf5v6qHDlQ/EaPdBd1K9OUVqyKs7dz8tpbVDnvtStslm+4h4nBWxGQ7IOTxdijA22wxW1lCe9EZeUWGhL4k/DkC/SQ+KegOzKRiP8tWA+egjopszzGZ34nu7MjkIDv6PAzBydWfGgJDFgUfGTeZ93/68Xrrq+NNi5d8jWOzXbgE4xgOWPkv5pDBvQ9NjRtyCQaIKLeX3XBP9qsFi6Rm683eqymbMxKV27oni0MFue9M/W8yeqCgdgkZ8V0H6FQeWm4pIwRNVcnpLcFv571Akbd6swYxbgncLYyeX7QzIG4Qi7+klryAcvN7bJ6yPfBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mNPm5RGcbq3zamrLbk8z9YnRth2TGlOmu757xdhlWP0=;
 b=NBizlrbJZANg7O2PAeaqFL/xQRPEgwpcK300UL+JxaPr2vAsHeNLQSKk7tgq49qTTsIVYk18tbbmXiXR8uaDa9h94E95F1BPT+6Umkf1MS+oUXNxxKomBk6mbRPcUL/GmbKSKxis6wPXJ9Ad2ey5TuN+65AT/oSdIDRb4K10tMvpCZqsvpNcIPq67cFmTbIctkTkSIfmcTOSQ/wG3UKSVhMFtd+NHz2p3ZvMCSsu/aVrKO6DjP81dCu165khg6qOTq+WbMiMe2AUBRKSWyFKv5U/aKu1yDtcx916yXF5hpGX7L+qC92nahofqLjdTCx4FaSPAl9uekJJn97i49QXNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by MW4PR11MB5910.namprd11.prod.outlook.com (2603:10b6:303:189::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Thu, 17 Oct
 2024 16:30:05 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%7]) with mapi id 15.20.8069.018; Thu, 17 Oct 2024
 16:30:05 +0000
Date: Thu, 17 Oct 2024 12:30:01 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Alex Zuo <alex.zuo@intel.com>, "Matthew
 Brost" <matthew.brost@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH v2] drm/xe: Log unreliable MMIO reads during forcewake
Message-ID: <ZxE7icJh-cH1ZxDV@intel.com>
References: <20241017034026.1525693-1-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241017034026.1525693-1-shuicheng.lin@intel.com>
X-ClientProxiedBy: MW4PR04CA0197.namprd04.prod.outlook.com
 (2603:10b6:303:86::22) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|MW4PR11MB5910:EE_
X-MS-Office365-Filtering-Correlation-Id: aa550700-9371-4094-1281-08dceec8f527
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LnS1iBUSOwCR7Fah8IkobMX/1nvcmnNen8WWiiJuy66/Zq9ku9R0rFwNdFSj?=
 =?us-ascii?Q?w1/cMEiIzPH6gTyNoQuiCcbx5tn2XSwumh9oro3n1Fte+pzUoGy8REexjad3?=
 =?us-ascii?Q?esFDr1BcvhBzxJNbjhN+vJBSoxIWKoriT3nMfjWpqPTem0SReLx8iSFbEn2Y?=
 =?us-ascii?Q?RUgim/BxnzWaHIoGF66ACPjXtAlgHha42FavrgWfVibQ0O9wBSKFpyz9xIRX?=
 =?us-ascii?Q?LZcWwjnFQtbsakMU4btoe002CeoWWWewNVxAwzT1p0s8DDZpoNytorHJ+a0x?=
 =?us-ascii?Q?vj/I+dfmAokHextlMkbBUtYuVXhDAmZU4IX5Ih+WDTlZO8j0PY1gjBfwaorW?=
 =?us-ascii?Q?Yrc4eFsoYsP+D0msTUVNVPDVFr6OYYZ6DEnKpYSZIpg3C9oXav1ulIae5YRK?=
 =?us-ascii?Q?seCrEws1qTTFLMTS0Rfmvw+7/FjVyUIzuf3vWHWynCaXNZb4sthwZvtkVQAV?=
 =?us-ascii?Q?U8mus1U9DtjTnUVUugdv5TuQLIwkRY30Wt9mFySb5olhTBKoeXNYtCw76ID7?=
 =?us-ascii?Q?xA3Ok2EeZqR/7LDw6CCrBBj5ZQRIDYLjvFHZ0vjoSEN4EfjOWAMj/asv2vym?=
 =?us-ascii?Q?YWt/PCD/KYVpVXKI/esonl3EVKoDOyw21sviKF6R5Am7AUWsPtGzL6zpA2Cq?=
 =?us-ascii?Q?trYoxL9oCtKWBXlduD8nyyaUgsm7717GbEqYC00rqD92t8flIrSiXVZ1Qh09?=
 =?us-ascii?Q?oT8ugD+PINvfPhTphhiSAPuh3DqzfmTe23waEIFgsS6tQ86HIkHvSZzvyxFC?=
 =?us-ascii?Q?A8vyi+3yBEBAWTbH2N8Pqu1meY6J7ZaKyixf+u58X7zyUcS4jI5QGVk/ePIt?=
 =?us-ascii?Q?8dTw3TrNHCLXAHLi6iSX7lGI/pSsqXpLSWNG4hP8lVh+QtaFqQIBaGyWDsL1?=
 =?us-ascii?Q?IJz6Oa930/4P0DzOzxE7oTozGZOLgHp1wd5CcNgps89t0HUuSTstoY3+Gs6c?=
 =?us-ascii?Q?GZoVoFBBUkk2QK6QY9bEFz9vgRifSxZmnBv7iCJnSImQft4lphRVOLSYB/Y3?=
 =?us-ascii?Q?AOxoRYvMR5XKP+wamIpFFNugIZCqTFpMImoZvhjWVNPq4H5TnxxfOzXiGo9K?=
 =?us-ascii?Q?dMDh7lZs55Qx0q820IV+dSwQvQvWhNiVbrsDK5vrv/qxBltf5gr5qWDxySuO?=
 =?us-ascii?Q?YBmV+0Wz06ryzP6oUhRijfOM7tMj7dzNINtN051Hi3yIviDobtFOMIxkbHUN?=
 =?us-ascii?Q?d+OCr6FseHILwGZfL9k8/AlJ+dUfdRPMBuHNIOTNjAquXiX+3TDYQp8z2Sw1?=
 =?us-ascii?Q?PFbr6NBQkRwqcT3yrI6Lg4UjFWKhBzbm4uedC7dd98fBFyKAIEQPKlPgcYjZ?=
 =?us-ascii?Q?SBU8wM51xoXPHcJ4GcxaNM9w?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Aio6DtsSiLsRQuNxHeND0Vq7mcPHHIWEwVctAhDoosA25rN3AYhQuPcztIAq?=
 =?us-ascii?Q?5UfxvkAm7Q9uraEyPmIObASiIz48p2/KfsZpiIoSKn7yaZpCioN8VF+TIueC?=
 =?us-ascii?Q?2qCtRJwc7quENKU+ph6PcRyzTxTL/m8kJ1xOfytefqZGVpPDdZYoXR4kPn2Q?=
 =?us-ascii?Q?gB1Nt7/eBAOIst2XnkSLBC5GIJdwPMuBsGB3v4jxqKM/75c2ooW27TsZN5Sd?=
 =?us-ascii?Q?6e4skocSOms0ljMJTunATY5mqyD09ZM0J1yvAj197ST/w8DMz9HirMb9mAYV?=
 =?us-ascii?Q?r58O3o4/f4RBDRgkDV3X0AYubYqdxdmyfL6Ndy9TWUBEoDx0YTRqY9htOUZT?=
 =?us-ascii?Q?cKO/y+Up0lP2Mfh6ep0Dml7sNKHYnXxtZ4Z1y6bYbjsPNRKt00RehPctV/wD?=
 =?us-ascii?Q?Au69D7I9MaS3/3PJ37nOueF35jJF/2nvAmkD23oa6wS0NkgAbsoIjF/1+OXI?=
 =?us-ascii?Q?QlG2v3VMlVbeUKg2fHHTTb7IEdjSYdUMFqJklMHnkaC/9JifMP+csPGyGQVh?=
 =?us-ascii?Q?co9vspCOi+zGC/tqYfMdDwkYMz34Qw7g/fbPAQe225QydAufPnIPW8FjHx3K?=
 =?us-ascii?Q?W7r1xEfBPhBwAfSJfu5hpjANIfiGmjzSg8gFd5SJ4ZHOaldsRdPrUMdNbdCL?=
 =?us-ascii?Q?N7Mhe8ei4TqSv332NYXom+stEo9nlHeh2+Nenu/vlIto5jUsNRCAxqqZysBV?=
 =?us-ascii?Q?l8QK8zqYSs7/iDcjIOXPZNkDpSvMudYbAeHTs21srXbauRf3ZvVabPwLIOEv?=
 =?us-ascii?Q?HMmqK2+9us5DT7u5081eEzwWI+Omkh6xM4fPfBnoCKjKFII1ADw2OOqSBuyy?=
 =?us-ascii?Q?GyG7Cvwdwnji9sosLiOvVC5J0PU0/lHBZV5JKby02XY36FPxsmoV9in8ysi1?=
 =?us-ascii?Q?mpK1p8Iam30OUhObnik/mtXxIbE19zsLTu9b+mZRbvg3OH50RfG7hUw2Uajo?=
 =?us-ascii?Q?qXUBMkBM/sKU0/aUFu8RSYEMRuMpqT7sNuyPZ0HyznR0WTwQNSne9f/StBVQ?=
 =?us-ascii?Q?hQa9loSVs+SEUYoCu7oe9CIqlnB6oDxUrK4Dia92ERHpWWpl6Eph0z9NWqy0?=
 =?us-ascii?Q?Nwv3WFPnoMDLkdy1UNEdKYZayIXAahvgD8FllvYFBcqsBMxCyk8j/dQ9mlyf?=
 =?us-ascii?Q?7vHfdfAdekZXVOWxCf/h4TtWdBwBZM5H4aNba53UpXuovcNAMsh5xXtJ4jhI?=
 =?us-ascii?Q?AQtLY7IEJrlbpEkSjtGQ26J5LEbzRWzAlGqy5uETKD/9B9svmEO0MWBtmUn7?=
 =?us-ascii?Q?W3eXo2eStvpE0T2ldxvkHd0aiaCXkiynwrnU+S7hELVLeUFIaj368wJm091u?=
 =?us-ascii?Q?P0YS72Ac2ZLwMFa7skWzPlw/8bC77aGRB2+Y2gOctSkUqyVxHiZtum9Kg0Jx?=
 =?us-ascii?Q?sKEKz4/lmcOBoTzM3KZfMEHcWruLsD71f+5EkuUTxqwDqAyDv+GEYmQeHjhQ?=
 =?us-ascii?Q?6WTssnMyItraruwgQyOVPl73uwLqbL+RztY7eyjFUE1YpTZRE6K73ctwNo9W?=
 =?us-ascii?Q?icSHttfX9BHBdhMsq/G+WTMCefJBHq4x4UpUCkQDpifXEH9PryXahxyfW+HX?=
 =?us-ascii?Q?f9Ebq5JP+yAfwY3FZ7F4IYEUb3saiwDp7fX+YRlbab/q8gfX53yplxZJHaK0?=
 =?us-ascii?Q?5A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aa550700-9371-4094-1281-08dceec8f527
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2024 16:30:05.6140 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZZY7iBQauIwQGtmop3eOXXFrDmRk6AVlbQAYaY8rnxcX7n2/vaO9NuwqXF9fBHRlXoe39cVPHlYIVWWM67prdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5910
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

On Thu, Oct 17, 2024 at 03:40:26AM +0000, Shuicheng Lin wrote:
> In some cases, when the driver attempts to read an MMIO register,
> the hardware may return 0xFFFFFFFF. The current force wake path
> code treats this as a valid response, as it only checks the BIT.
> However, 0xFFFFFFFF should be considered an invalid value, indicating
> a potential issue. To address this, we should add a log entry to
> highlight this condition.
> 
> v2 (Matt Brost):
>   - set ret value (-EIO) to kick the error to upper layers
> 
> Suggested-by: Alex Zuo <alex.zuo@intel.com>
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_force_wake.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
> index a64c14757c84..49ceb16e82e4 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.c
> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
> @@ -115,10 +115,15 @@ static int __domain_wait(struct xe_gt *gt, struct xe_force_wake_domain *domain,
>  			     XE_FORCE_WAKE_ACK_TIMEOUT_MS * USEC_PER_MSEC,
>  			     &value, true);
>  	if (ret)
> -		xe_gt_notice(gt, "Force wake domain %d failed to ack %s (%pe) reg[%#x] = %#x\n",
> -			     domain->id, str_wake_sleep(wake), ERR_PTR(ret),
> -			     domain->reg_ack.addr, value);
> -
> +		xe_gt_err(gt, "Force wake domain %d failed to ack %s (%pe) reg[%#x] = %#x\n",

Nothing in the commit message talks about this promotion from notice to error.
Please do that in the commit message. After all an error is indeed returned below anyway
when we are here.
Or do this in a separate patch.

> +			  domain->id, str_wake_sleep(wake), ERR_PTR(ret),
> +			  domain->reg_ack.addr, value);
> +	if (value == ~0) {
> +		xe_gt_err(gt,
> +			  "Force wake domain %d: %s. MMIO unreliable (forcewake register returns 0xFFFFFFFF)!\n",
> +			  domain->id, str_wake_sleep(wake));
> +		ret = -EIO;
> +	}
>  	return ret;
>  }
>  
> -- 
> 2.25.1
> 
