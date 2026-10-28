Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AACB5606A31A
	for <intel-xe@archiver.kernel.org>; Wed, 28 Oct 2026 18:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AVG5YwTu
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 714A310E20E;
	Wed, 28 Oct 2026 18:53:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2226F10FE0A
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Oct 2026 18:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793213615; x=1824749615;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=ugmn6CeeGggimRVz0z1t2H4YqnTayTBiUxRdO+3tEDY=;
 b=AVG5YwTu+NTFpHHABUCslK8llfICi6T1nro1BjqeGtfNvtMTZVCRlztf
 LtTH5zXq8vc8+W02hYZljjw0Q/fzzhM1U45OMMtq5IZxa7ff5G6tUfgsC
 db1rSLS4eSqu4fhP+tZp7FHKcf+X7fwB88mU2XFUwaIUaZhw2GJEIdkIx
 6iKc87ERys54f32FGhd5dPDKen3hvDGnXA1YKXmP/0EoJsd6stSFG2GQN
 QkCepxLZe+qvX4MlaYURO4rNXyhN+00c36NjhhZuSsKSAM0Lok80pMlze
 gv4TZV0Dd64PFM+hRd5RyPS4Zv2CNms3kOUqayLWvo7ZDMuM0tDDK5+kj A==;
X-CSE-ConnectionGUID: toeLUWsxT/+nFNwvsy4K0g==
X-CSE-MsgGUID: GM7fsntaS+KsYe2TqfFoBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1961541"
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="1961541"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 11:53:35 -0700
X-CSE-ConnectionGUID: 4jSQlZDTQhqLYUOJLjvy+g==
X-CSE-MsgGUID: BkpKnGzDQVKZskg/bPHIQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="6686564"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 11:53:35 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 28 Oct 2026 11:53:34 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 28 Oct 2026 11:53:34 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.68) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 28 Oct 2026 11:53:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gWprqTxe21YC2np+mXcGMKNa9mV5jIBRQPnJtF40goc8O43Q4IRC/ZC4oPSuw9aj6xGKfKqseOpLR0xmdE40EyIHEN3dr3ox7W9Rz3gOpw0peSpSGLM1EZIdnmucxeM6ovfrA/J+exSGwpuPue8z8T91cqbEv2s+qQMmns9FhkIOj1+88JLngcfzB48ta8GN8FqtsEWYDAFjr0mpn8ZP32g3aC+iwEKRTcjuU0pbpvJCfH8DGPBMRcfzyZyK3lzb4v/Hsh+6WGvr0fnrlvn9YbryR+lNf6dfxn7rd+3aCw/zby0hoFS2GXjBWnRYA/0fNxTsOPg6/4Yj6P8VXpctjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iWSwMVGFnd9yI8eqLm0j6cg2pfklTiUjZVjFeu/cXGA=;
 b=wtqnzc72fFZx+PUI6IDlFF8sgTJ1pLWb8+uEPN2zFOjeolR6N73bVuxADLes1wccZY3Pc53GPn95ksTbrzsLjtUD53MheX3nrggwta8bDoVxbVhT5zIcy9J8WRIqdsom55mBcjonNCBGoySWq6RacfgkI3YZIRJ3ypqGitSSYBmdbI3ZNrXTY2/OOT94Wjpsh+ZMqoSaWPYOfIvoqNIxT/epS2QT3u/+l2qNGfmvM59mpALVaYFBTRrmTsA8PJJ2H9Q7c+kwfWGKFWwCwoFEgJZRtjBmNQnDnio1K8SzQdWp100h9JLf1UkGJFDA2P6fhPXXxhwPLS2HBqkzcLUeiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5095.namprd11.prod.outlook.com (2603:10b6:510:3b::14)
 by MW6PR11MB8368.namprd11.prod.outlook.com (2603:10b6:303:246::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Wed, 28 Oct
 2026 18:53:31 +0000
Received: from PH0PR11MB5095.namprd11.prod.outlook.com
 ([fe80::770b:7229:68c0:5ded]) by PH0PR11MB5095.namprd11.prod.outlook.com
 ([fe80::770b:7229:68c0:5ded%3]) with mapi id 15.21.0569.007; Wed, 28 Oct 2026
 18:53:31 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Pallavi Mishra <pallavi.mishra@intel.com>,
 <intel-xe@lists.freedesktop.org>, <matthew.d.roper@intel.com>
Subject: Re: [PATCH] drm/xe: Store GMD_ID subunit during GT init
In-Reply-To: <20261028020554.390714-1-pallavi.mishra@intel.com>
References: <20261028020554.390714-1-pallavi.mishra@intel.com>
Date: Wed, 28 Oct 2026 15:53:26 -0300
Message-ID: <87ecd9mzbt.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0333.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::8) To PH0PR11MB5095.namprd11.prod.outlook.com
 (2603:10b6:510:3b::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5095:EE_|MW6PR11MB8368:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ff378eb-3355-4c21-e0dc-08df3524c28c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|261028144727099003|261021121427099003|56012099006|11063799006|261022105027099003|261009223027099003|261022075727099003|261026140227099003|261026121527099003|10067099003|261021123027099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: mjgju9RVginkco5ESwkrrmlg67nbxeOXDphZQtRTR1E1POWJcMASDt2dB8R35zgDGc4cy9gAseWbObmPF6q8wA87KvZNiUx0fDvys0pWcrQv0qkLZMYeeO789gXxaoRzKXiJ9+2UnJL/Kh4h+MlvVC0Cmi6t4RemA5Io067Hu/pO+ZfeiA+afJt4pjb4x59vgZO+zwVC2gRQoc1+ztfbfYigELxU3sRmwOpAu1Zta9TXv8d0h9nf7BHIj9ybrilg7v0VSUInKaGtnH6ozkcgy6M42gcAT9UuZnK36kEDuzFP92uYAkX3tPqYNECE3MFXtQLQaeqkdY+61jHlcVrzM1LqoYVhbXwXF92mkSz9FptHH6bVn8aB3wKc6/NtnH9yIJYdawfBNhwqajLjEkIATVui96myB90SKp1IfsgM/+Ke9cLQrd7gjsGhsz2iRu6ep9Q1JXnqXKV5c4xSczBi9/0QNveKqxP16rUZXb6oMyN4qIEliASx2M5Kb8KztSipZVxpswCRPHQurFtc6JbEX2l+LblObxQ8hB2/33KLVsjEmu4vU7YltmW3f7j2BbDIo2aIbbi8ZZwakqBeWKryWuuDas7u6EUeH7KFXbMKWslReRLDFxzLCLeRHptGqiXRCKSF8oqMX4Vo3BYddfGeV7hR6XqI9zIRrhyaQ+aDNv4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5095.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(261028144727099003)(261021121427099003)(56012099006)(11063799006)(261022105027099003)(261009223027099003)(261022075727099003)(261026140227099003)(261026121527099003)(10067099003)(261021123027099003)(22082099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RJ/Tt9e0nymZwBg1//NeYXgWJXCEMhJt6GHfz78kA3OtU35o1/DCgcF5zq/J?=
 =?us-ascii?Q?E+xl/ih5tIsKHI+IvdsXELqoHjyemXbREfpgYd0DgcGMhKJsT8h9ZWx2bRt6?=
 =?us-ascii?Q?RHHp6H291o7tUf8ZHd3insdY1Ie3lN9jOTLf5Pwrjh07Hot5qENfqQkjIY5r?=
 =?us-ascii?Q?WKvQ886VIvCRdlm5FGaY5UK7u9xlvgjv+YI8XSrl2VLQTDy9rIe9341X5Nnv?=
 =?us-ascii?Q?Wvb49abqvJWWodLOdSSm5KltQQ7s/t7pbnvoKOdbfZLUm9DwS53JvbRvvtAL?=
 =?us-ascii?Q?qfO4baUu/T0K0hC//YRWFcr+MwT5/JsOlNXQ5HlNXzdPBH5009oBCi9/w9mo?=
 =?us-ascii?Q?ZNOfmTLQ5G0Kxzm64zY8Z+mXafL1urQL7hB1xPoSBbTgRlCzvUC0KWcLgC7o?=
 =?us-ascii?Q?cn2BlKJf3fG3dZNeoXt9Eix4RoB44GxzLzjJWeEWGf6J0n9M7NqdnmLYJpZR?=
 =?us-ascii?Q?vXs4R+UijFyYKNC5pijBbR49p0p9wGvWGwvmbK36XtxCEq6FroNnn4F/Mmkp?=
 =?us-ascii?Q?B9f9H1argmp5YFCnEXoTQxa+s/378zXdukZuwPpKJOqOT7ItleNARCHZw10/?=
 =?us-ascii?Q?6gRUCdzjsacYHp2W964rb0QW84WUCwhO3LeqlbZdqpZcfoRek3gVWfYEuKrZ?=
 =?us-ascii?Q?Tu6RDNwq/G90P4uAskiO6lbfO80SLfft8lEXD2wRMALdhMCbLpVDjmEyN8Oe?=
 =?us-ascii?Q?w/+2RcoqR5l2ooTdIkjcHSeqINktL4snFSqnydUoxzGlhQx0GnL/FUWYqfQx?=
 =?us-ascii?Q?0u4DD49tVy3e3vQEIY4sYD6FjWguJeZtJ049tYJWyyfy0EdUelchbG1/1vpk?=
 =?us-ascii?Q?PPobyP7sWyUOzSu0xCcC9FV7wC3CmXesta0989Mq/ux68ggD+trRx8tbmmwj?=
 =?us-ascii?Q?cvC/9Vtcu50eu9OmycSPiHVeNC0ZUxtlZRXdDg5XgfNw8Gwz0mS5NVenEJ/f?=
 =?us-ascii?Q?aXT2TR8O/ICmYecrsVEl+P5ycBRV5S5pMm2IdbqCfD8+Kzx6jDfRa6cwauux?=
 =?us-ascii?Q?5WtGKg3g69NyO4a8NN40n5KsoE1bnbYjdr0V/0Q4qwD0kG9vb28c6qQb+dEv?=
 =?us-ascii?Q?schR7gSMJbXQvq3LPkA7LIawWugNoSL3FbUZ3fmkWqzBhXyLR5vN18Vzp9LK?=
 =?us-ascii?Q?jntVDw12ROFNah06Du2XdD17j9KWAwbOzRVohQke/fUtQIhZDvAtvmKVP4/d?=
 =?us-ascii?Q?BFf0dncOEC8wHrVBtVUAGwOerE5HmWbJcWBpWJ4X1viY5UAmlqwHoTbCrufr?=
 =?us-ascii?Q?oF2Phu4P1Mt8KfqOTa/YFPbz54Hqpf5TuGykBxzcsWbHn4inLvDjHCnDTtLg?=
 =?us-ascii?Q?2t1PDmIjBCiUssR3bONUuZ4+V3Qa7fKKr3pEfwbnl08xb7ViPuPKB09tPgmh?=
 =?us-ascii?Q?whnndlG2+JNsfuBdY0IPvQ52OSJ8zai5dTmqsikdnr8uLkMpVr2d22DYrZJ4?=
 =?us-ascii?Q?IKA8w2XCajImjZsBMU0L6GQkiuF2QUDWnp8DdNYCshVqV0P0YtE6d2TDwebd?=
 =?us-ascii?Q?0kMT+3kdM4PlQ/9TNmxwacANlsyc3B+BIy9EQMBKesRwbO8Ydu52KLsfqaKD?=
 =?us-ascii?Q?HT6BOximpLryqI5ckAHudLRFeJMTWn610eYAoQ8ioErYEBng5Bb3Hl6vKl6y?=
 =?us-ascii?Q?H6SVX5hr8oSjpNLNMxuXm2TDiN1lijfbBL7hlxHDjfdgyQr2oAhSU8BnHcV9?=
 =?us-ascii?Q?mrXxlTvDudegUxI9JwPMlAALENjiDX+xGBs+0gGehfp7erL3UPM0aowhXjTv?=
 =?us-ascii?Q?qfZ1P44I8w=3D=3D?=
X-Exchange-RoutingPolicyChecked: czSfbPevKFOisUlOx96cHisFimFk9LsQ+MSfSaB1IRUNvGp0w6Q3fSsxyOacjm+PR8Uqi8wzMKTUS3Bmt7NTAJyZCS4399PXUFTGlx7zbnRLRFEevrfCM9KadGvs4dqNqkVkkh4aAwSeJICAqrJPSyhbXCRpdLS/wihyRyJYzkNBdH8QtTaDzG31yzPiUHzcOgBnZdcH1b/cGrJ+zAFRWRAfU7Hotq4WPuRP3NE2NVxpNiIdim7KWSxGH3I5N6mwxQ4xjDm+R5o3+lMUY3BCGJIJendL7YJqgFBOI33jeeMEWKWpdPK0MTe/xlftomOpGo/rDY4aM2RvvTrQZoDuIQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ff378eb-3355-4c21-e0dc-08df3524c28c
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5095.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 18:53:31.1702 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7z97xa5zmdptXPa4Pee9FWDkOTqq11YPbsNrWb9L2D1TvG6NJBFFb1srnrsm/3tiEnOUF+MRhvR3/TkUI2UuTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8368
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Pallavi Mishra <pallavi.mishra@intel.com> writes:

> Read GMD_ID during GT forcewake initialization and store both the
> full GMD_ID value and the subip field in gt->info.
> Keeping the field in gt->info provides a common source for
> future users and avoids additional GMD_ID reads.
>
> Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.c       | 20 ++++++++++++++------
>  drivers/gpu/drm/xe/xe_gt_types.h |  2 ++
>  drivers/gpu/drm/xe/xe_guc.c      | 12 +++++-------
>  3 files changed, 21 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 60d35ada2853..39ae7105aaa0 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -564,6 +564,18 @@ static void dump_pat_on_error(struct xe_gt *gt)
>  	xe_pat_dump(gt, &p);
>  }
>  
> +/*
> + * Store GMD_ID and sub-IP before GuC upload. Main GAMCTRL consumes the stored
> + * subunit field during upload.
> + */
> +static void xe_gt_read_gmdid(struct xe_gt *gt)
> +{
> +	u32 gmdid = xe_mmio_read32(&gt->mmio, GMD_ID);
> +
> +	gt->info.gmdid = gmdid;
> +	gt->info.subip = REG_FIELD_GET(GMD_ID_SUBIP_FLAG_MASK, gmdid);

Why do we want to store a subip field? Shouldn't we simply use
REG_FIELD_GET(GMD_ID_SUBIP_FLAG_MASK, gt->info.gmdid) when needed
instead of adding another field to the struct?

Furthermore, there is some exceptional use case for the "subip" bits on
media version 35, but for other IPs they are tagged as reserved.  As
such, I think we should limit ourselves to treat those bits as "subip"
info only where it makes sense (i.e. the current approach inside
xe_guc_using_main_gamctrl_queues()).

--
Gustavo Sousa

> +}
> +
>  static int gt_init_with_gt_forcewake(struct xe_gt *gt)
>  {
>  	int err;
> @@ -572,6 +584,8 @@ static int gt_init_with_gt_forcewake(struct xe_gt *gt)
>  	if (!fw_ref.domains)
>  		return -ETIMEDOUT;
>  
> +	xe_gt_read_gmdid(gt);
> +
>  	err = xe_uc_init(&gt->uc);
>  	if (err)
>  		return err;
> @@ -610,12 +624,6 @@ static int gt_init_with_gt_forcewake(struct xe_gt *gt)
>  	if (err)
>  		return err;
>  
> -	/*
> -	 * Stash hardware-reported version.  Since this register does not exist
> -	 * on pre-MTL platforms, reading it there will (correctly) return 0.
> -	 */
> -	gt->info.gmdid = xe_mmio_read32(&gt->mmio, GMD_ID);
> -
>  	if (GRAPHICS_VER(gt_to_xe(gt)) >= 20 && xe_gt_is_main_type(gt))
>  		gt->info.has_wmtp_disabled = !!(xe_mmio_read32(&gt->mmio, XEHP_FUSE4) &
>  			CFEG_WMTP_DISABLE);
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index c00a7c171f80..c67fb0d512b0 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -153,6 +153,8 @@ struct xe_gt {
>  		u64 engine_mask;
>  		/** @info.gmdid: raw GMD_ID value from hardware */
>  		u32 gmdid;
> +		/** @info.subip: GMD_ID subunit field */
> +		u8 subip;
>  		/**
>  		 * @info.multi_queue_engine_class_mask: Bitmask of engine classes with
>  		 * multi queue support enabled.
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index b1f4e132fa0c..37d72ce1d589 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -1864,18 +1864,16 @@ bool xe_guc_using_main_gamctrl_queues(struct xe_guc *guc)
>  	/*
>  	 * For Xe3p media gt (35), the GuC and the CS subunits may be still Xe3
>  	 * that lacks the Main GAMCTRL support. Reserved bits from the GMD_ID
> -	 * inform the IP version of the subunits.
> +	 * inform the IP version of the subunits. That field is captured once
> +	 * at GT init and stored in gt->info.subip.
>  	 */
>  	if (xe_gt_is_media_type(gt) && MEDIA_VER(gt_to_xe(gt)) == 35) {
> -		u32 val = xe_mmio_read32(&gt->mmio, GMD_ID);
> -		u32 subip = REG_FIELD_GET(GMD_ID_SUBIP_FLAG_MASK, val);
> -
> -		if (!subip)
> +		if (!gt->info.subip)
>  			return true;
>  
> -		xe_gt_WARN(gt, subip != 1,
> +		xe_gt_WARN(gt, gt->info.subip != 1,
>  			   "GMD_ID has unknown value in the SUBIP_FLAG field - 0x%x\n",
> -			   subip);
> +			   gt->info.subip);
>  
>  		return false;
>  	}
> -- 
> 2.43.0
