Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 069B8C282DE
	for <intel-xe@archiver.kernel.org>; Mon, 10 Mar 2025 19:18:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90A3810E4CA;
	Mon, 10 Mar 2025 19:18:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OuxmVa9K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3705210E4CA
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Mar 2025 19:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741634326; x=1773170326;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Yy2BtJRyd3JLoGCw7lOP+64Nenzre2Jd0yelwBZcP5k=;
 b=OuxmVa9KY69wDVDbC4UoerZAqY1FX5C9oYA6eqtx/62M+jmZ3GeM8cGr
 oVWFs5mxo4+xt9zBagDpeUo+MtnwpZ3vj3m7Eo1yFb8qrX+Xxa0auWTRp
 JTsTiPivDvE4POX3JAtzLjFbsd+KUCZuC4t3cyv2tWLkDK3uLOuPHddP9
 zO+dfL7+cmB4GUuWfPgfoJid4veRv4C1MckFjxerDLAob0uuR09CpRbJb
 sdZt1iGjXAaiKwE4YLKM0VKL1JAoXTIbA17HYQgIFd8+L0cOLLIGT3v4T
 +74ry0ljkoQNyvNz2VmOSWDCCPeNZ8B0/V1Tyq22o+hTWu3fjT0Q/8N/n Q==;
X-CSE-ConnectionGUID: h8oeMQiaQnOLkVDnv2b7qg==
X-CSE-MsgGUID: spSkymIbT1SJbXAEWYrrKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="46558744"
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; d="scan'208";a="46558744"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 12:18:45 -0700
X-CSE-ConnectionGUID: LgsWKMbjR0ifiDMhXrTv4Q==
X-CSE-MsgGUID: CzRBfbTDR8qaXJ5Raodzww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; d="scan'208";a="124685539"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 12:18:45 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Mon, 10 Mar 2025 12:18:44 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 10 Mar 2025 12:18:44 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Mar 2025 12:18:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SCAxmgmrEzt+jhPni0TldsONzmcz7QPUQ6LXKO55HvP16hlqNoL+gwtscEaklrABmzDit6uVtzVR38R7vCTq0EtFINEmPIbYW9ci6LPQ47g9HIviIB5RgtGs62Re5h5PruTMomPYW5oS0RsjBg/una/0oCaQUSRVwzkcNnBg5yFvB8C/TboFIXoabm3hhOZ3C9QWOmxItb6C2hU9u37HLgc8MpoAZW5pIYM+gmZOQutiI3qzWZSXQMtCIMcwdgw7raUMHvqXCIJoY4RYCwuRBjc0U/ZEVl+19RBTCzziFCFEXO6WyKCoY13YV/Rba8s7gENQzypzkMPve+vtaU5gZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SAhovCxtI4GLvJKEfArI7fxdC+TsBo1Z9vu+XmG7mug=;
 b=ksTPl8EVkqEq4AxySk2uOOenN5LZYRjfcVnK7xuk74FWQvhYXL1buXz8sy/i4MZUYuB+/hwYT8JmHhcLHrHOjznDb86AhQRp3cqtUy3etaOV09vtaQzR8wHSt9xM6NjPY5O2wZ37KEPidGZJg6v4yvcSBWVmiUobH9SL3BDFJryd3gvXyM1wroIQDRYpTgNCS06X4n+Ateyq682MNQ63lQGD7taH/g7b4ecfSsHIkmdncEtrfUNeCLnBYl0tiLRpYwy9HxE4UKvfmoDdDJCFfGMKtS6A3s+GHgqDonIUJN7VFoeWaZdOP2n5PCaKoYdMGiN4dKzXToqGGQlyMHXWdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ2PR11MB8539.namprd11.prod.outlook.com (2603:10b6:a03:56e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Mon, 10 Mar
 2025 19:18:41 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8511.026; Mon, 10 Mar 2025
 19:18:41 +0000
Date: Mon, 10 Mar 2025 12:19:49 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>,
 <oak.zeng@intel.com>
Subject: Re: [RFC 03/12] drm/xe/svm: Helper to add tile masks to svm ranges
Message-ID: <Z887VQswA/FNaBYX@lstrano-desk.jf.intel.com>
References: <20250310124341.1819568-1-himal.prasad.ghimiray@intel.com>
 <20250310124341.1819568-4-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250310124341.1819568-4-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW3PR06CA0006.namprd06.prod.outlook.com
 (2603:10b6:303:2a::11) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ2PR11MB8539:EE_
X-MS-Office365-Filtering-Correlation-Id: cefeb821-d5a7-4979-efb5-08dd60085e52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Nqc5mZNMnNOQ+by9LekYLGhhrSTpC6RuTCVA1aXWrTsg5ggSIHckuAHJkRjw?=
 =?us-ascii?Q?jFoW66GDovUh0utI2Xjmx9g/ydaryGY1tu5/kLyY5OVKIE/ccL/gkeFfPKpZ?=
 =?us-ascii?Q?GU5M0Ag8Ut9nqW+GwoUqHE7l7N9Dpt10uEUMCjsx34foj+SSY5rffPVaOcsb?=
 =?us-ascii?Q?exvdN4rPCQWyUYhSPjYS5/9dJh0NelxQPsatmAknL6rrUcGJrZd3QsMiwe0V?=
 =?us-ascii?Q?KDr3yxj43WHTrD+exqeTugZ8hAGl+xP0KQxtBZBGioJN0hy5K8DkJ41xjjXY?=
 =?us-ascii?Q?59/vmd5tSatnDTzsjpqrv2tViDvUS+K15qtYesRjE/fsM7Q4vCMJkHjISmiR?=
 =?us-ascii?Q?UzHP4peBwNBnb7BRXA5Rymmyxo/PLrDAeknIlU6mL3FS70Mk/eO0OgIS/OSO?=
 =?us-ascii?Q?gHG3Twn9x+1brC5hmgdumkwaK0JfxVltBRZ4F0GJuVumELEof4gbZMDEBDzO?=
 =?us-ascii?Q?bzVAIVtB7wZQpdYyY4B6oXl3PQiak5ZIjyjE04hSJJoEVvxSxqRgOg3bUsr2?=
 =?us-ascii?Q?m9yMVnRU7YtHAd9L01LdnS9H1Vgs/hgDVhcv2+5+RfqnEeNC1dVF3EVCxWzO?=
 =?us-ascii?Q?ms2ULSJSdWPjwUuCL1TibY7ydk6yxEuwcDra9h0oKg6e9uTcCf55YKg0A3na?=
 =?us-ascii?Q?L3ycIQemsGNt0YjsqfkUV3LifG2ZhNzZkSnYxmqyTeyyvMfkvLPnbT4hzDNm?=
 =?us-ascii?Q?lY9xq2AHlcwVkKbre3SrUTSkYobWpokBcLEC2Od+vGY4O8xiv71VpkF8nGAO?=
 =?us-ascii?Q?Jpe/SCvtQyg0YyoL81etDZMN1xVvphAC0qx2LLP9ktLKMOA1k0QsrLh3Wc/j?=
 =?us-ascii?Q?HEYKcQNHc3WWjQnNFwm3JVQciIy1V2v5nAZJn8c3cbk9uOGBrDVxPkPbOMtj?=
 =?us-ascii?Q?voDJoZhweg8oHRhGzT/5UJ9vVA/5YkQW0vHfQsBEDxCXcM8xCdzezBwHJRta?=
 =?us-ascii?Q?slyAheK3+JRGMSvWQRC2i7j3s6hop41EdPhaTjpHNfO1dI8F2H4yUBslJHTy?=
 =?us-ascii?Q?2lD77QPIVKpAmwDFMExJfnzlgmLonLngTLbjbYZpTDbxhCOBC5zMyLOIq/v9?=
 =?us-ascii?Q?palluT0FIoZw7zdQ8fJeerFhboSsOqODOCUPjnlUqs7sUeWVwl+Sw1Na3Yg2?=
 =?us-ascii?Q?GzgTlm+l0/Mt+0kcSA0nFWMvgYyu/ZkAQcy6T2gFdMKjRflFtONj3G+34kie?=
 =?us-ascii?Q?TmoEfr9HWMiBWxDcrY+0JDFPAFDpmslCjRnLrZS79IoHc2glAv8fD7/B7WGF?=
 =?us-ascii?Q?0PeVCinhZlUpMR3mg/wyss6Skr06pdlRIOi/WRCryTDWPOnHh0Oh3MB6Fivz?=
 =?us-ascii?Q?sOAsSXihQKXpBM9ijO8VIje43kWUDARg5HsNVdvTvDbQp8/co4Nys/K9GuXA?=
 =?us-ascii?Q?17EXZfWRfzGf+BdobwtmOkE+oyuD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?V5hQ5HEPiQcZO/RIjxAseEw3zqdg5AT5PVeTVzw6KtreOFumid+0d/VB0hjN?=
 =?us-ascii?Q?tXcHDCVu5ggPGrWOQB1Vrj5xqoTuZoaHCeznETzD6AAvwSbWunifk9v8bjKS?=
 =?us-ascii?Q?i4wUih0DiMfncxnUACm9U6QdavCAlInlT2H0sQ3zPtQRDeRwrutWh4IBTImO?=
 =?us-ascii?Q?WgYbqWooWdKnVMDipmc4Wvxuzp1w2Z/HSKNYTc/MuYmdm/udV//aF2aqyyk9?=
 =?us-ascii?Q?clwd6gW3ZNwmlQ9Fsuyr1/aYexeqh7XqYFTC64/L6eWF4i/bby19UH2cAekD?=
 =?us-ascii?Q?FbtwbvRtyrtYqDY7GS64DtJq+o+TBb09cVu1hELD/qgQaBL/FjcXe+wD/JLz?=
 =?us-ascii?Q?4RY7xMmdck7pFRgYbYomZ7PLKuUyzKvZIDqKsvOJU9ptUQK8zq9TRQZesCmi?=
 =?us-ascii?Q?lUiCzwZRFz15KR7rpSY1hfyX5FCfDjEO3TagNK6vKkQCFy43XcEscPy/TFZB?=
 =?us-ascii?Q?mZZSY+jPlsHZGEa4qVc83QS79qY/Gd/RGvgM3387fPMI1Wf8devdhFC8+2bj?=
 =?us-ascii?Q?JYmTpdydC3Ev9xLcos14Os6z89zP0Xax3MYU1qPNlaE9Bpc+BiZm3Z3zu6fG?=
 =?us-ascii?Q?rXWFc0/0B6W/n/EO8vE7q8ytcW9Xg8R4FI8Wt4RMu/st5Io6OQE9pCsXjffZ?=
 =?us-ascii?Q?2z1IbvMl8XTZSt1+AlFCli26RDOYrZIRzpBtJ1KOrZZSgP2BPX4UjmQMeZXj?=
 =?us-ascii?Q?NCBKhztDsrauAuQkl3mDBFdj3b9rDS9I3JP1RTTKTGXXkAGL239vpNPUA8ow?=
 =?us-ascii?Q?6SlK9txuSEykLwp/fFvFpDyyRssveCMxXH0NGCFHLfJ7yjfzSVaNQ+4vEnln?=
 =?us-ascii?Q?WsDJmNa4MH7kSwBI64RlueBLPYqBZrE/B0+X7tqPdphF2bj/Nt1bJWyla8xL?=
 =?us-ascii?Q?IdEo5tCpdyjM2/a5ffv4nAQrBqsv7rtack20p1fnVBsKnYe9KDMUMwQeLmkO?=
 =?us-ascii?Q?FMUat6ZoaJKhSqB0lBjiTPNSCP7CjcBJXcSK5MFgYBXDNQOAGZ22aziv4cNb?=
 =?us-ascii?Q?ac1t0FAEJDHWxGDv5H4bnvUMhjGfBtNgnSvkRoOGMvSZj+21JOCRCLcvEdNj?=
 =?us-ascii?Q?7JAJj3T7V8LzOeJoPUDTkxmIBaQHR5DzIasfaq7c3trJL6k1atU72/eTH7Gw?=
 =?us-ascii?Q?obgqSnFs6BmxyPe3hmAfY6NCneZHoUFU+kfU3setzOq3I/K21A3R8YNK1EX7?=
 =?us-ascii?Q?i5CwiU6RSVFT14LrvEp0Qvyb6XDtyYYXCN1EvzgA/MZPlFnLHtmGa4yBEzoo?=
 =?us-ascii?Q?xvCgkYkmSXwHGyhV1e8CEPPMIUsRJeZ7MPOtYK6As+ohH2P+Ltd52Cos364N?=
 =?us-ascii?Q?WcHREyKklX40+1thNNWAFhnrYFlfqv0Y8rNhenMnVBR1lIAhPF7uSBYn3CmK?=
 =?us-ascii?Q?dHBlwxBGXCsVDMecr7DFjoEYqvOHPFQ0oiOX7kJahRpAZyKgq57xVrnYxgLH?=
 =?us-ascii?Q?Viy+TxZbpISmjvZZLaHHqMcHHjLYKIDyUAuX9cW5nB4M5HQqdL542o7u6Wis?=
 =?us-ascii?Q?HiinVrEDDPHhhJuBiq0i8okyDp07bFc+LOKAcET+L+GX0cyMiIEr5lMk1cX4?=
 =?us-ascii?Q?CUxgYqYLw6v7V9Zk6js7ntKb6VVJXZI/VL3BfZpzk3OzmIBz9iA5xeWYYPDK?=
 =?us-ascii?Q?fw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cefeb821-d5a7-4979-efb5-08dd60085e52
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 19:18:41.7289 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jOJUL/HnV1qooctsSzv9RUSNSPOcpDCofns7NB55nD4MllB+s79p7XTa9Dua8x5cYJOyIx9P66Bx9GiB5y4FcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8539
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

On Mon, Mar 10, 2025 at 06:13:32PM +0530, Himal Prasad Ghimiray wrote:
> Introduce a helper to add tile mask of binding present and invalidated
> for the range. Add a lockdep_assert to ensure it is protected by GPU SVM
> notifier lock.
> 
> Suggested-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pt.c | 19 ++++++++++++++-----
>  1 file changed, 14 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index ffaf0d02dc7d..cf7a6ba2aec8 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -2178,6 +2178,16 @@ static void unbind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
>  	}
>  }
>  
> +static void range_present_and_invalidated_tile(struct xe_vm *vm,
> +					       struct xe_svm_range *range,
> +					       u8 tile_id)
> +{
> +	lockdep_assert_held(&vm->svm.gpusvm.notifier_lock);
> +
> +	range->tile_present |= BIT(tile_id);
> +	range->tile_invalidated &= ~BIT(tile_id);
> +}
> +
>  static void op_commit(struct xe_vm *vm,
>  		      struct xe_tile *tile,
>  		      struct xe_vm_pgtable_update_ops *pt_update_ops,
> @@ -2232,12 +2242,11 @@ static void op_commit(struct xe_vm *vm,
>  	}
>  	case DRM_GPUVA_OP_DRIVER:
>  	{
> -		if (op->subop == XE_VMA_SUBOP_MAP_RANGE) {
> -			op->map_range.range->tile_present |= BIT(tile->id);
> -			op->map_range.range->tile_invalidated &= ~BIT(tile->id);
> -		} else if (op->subop == XE_VMA_SUBOP_UNMAP_RANGE) {
> +		if (op->subop == XE_VMA_SUBOP_MAP_RANGE)
> +			range_present_and_invalidated_tile(vm, op->map_range.range, tile->id);
> +		else if (op->subop == XE_VMA_SUBOP_UNMAP_RANGE)
>  			op->unmap_range.range->tile_present &= ~BIT(tile->id);
> -		}
> +
>  		break;
>  	}
>  	default:
> -- 
> 2.34.1
> 
