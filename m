Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50749FEFB78
	for <intel-xe@archiver.kernel.org>; Fri, 27 Feb 2026 18:34:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0DDD10EBE3;
	Fri, 27 Feb 2026 18:34:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BctePLiw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10B0910EBE2
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Feb 2026 18:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772217268; x=1803753268;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=BkMxhQBdyfuvztOiRwkvbMNo3u9Rjp3d97kysTN5lg8=;
 b=BctePLiw3enOTZbTkdlbHmYzcK6CXklWv/T/trIzjYaOUIxE/k7Sk9li
 2/mCqVSRFNryriTviZg1jAMDLPlUHvTA1ZS/vbco7vkcuxaR8IImPJ2Ln
 bXy4vOC2VZvH+A0K4UrEERsD2WcNE4lVw2IS7GVqMeaTjM5c+SP0/fC+E
 jXyHCHM6uVNPd3ivOlDzIqRlXC3pG5rIb72IV8H8cpxtWfWvAfFuNqXwU
 Du0+W2oAxFr8OY5IZyxzlKymoqxm3bN80Ep49rcrAhGMWGD+QRpLap5tx
 VZy3Ap7DflprGGK1yVEg3g6ePfBaGrvPAgHJcGB4/agK7h5sINWAnxUp/ g==;
X-CSE-ConnectionGUID: 2PiqBR2zSNSlF/p5Gg6F+Q==
X-CSE-MsgGUID: wYgJ2zyJRG6hHrwkj3Rr+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="73415308"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="73415308"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 10:34:28 -0800
X-CSE-ConnectionGUID: 9l2iuXTzSgqV4WCmq5OdPQ==
X-CSE-MsgGUID: w0cRgre0RvapHGDJW6CRxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="221114141"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 10:32:26 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Feb 2026 10:32:24 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 27 Feb 2026 10:32:24 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.31) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Feb 2026 10:32:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U08Ydc1olEGifHjPhXZ37RWFeOKSuWgWIdQLfnE2yWTVHuWD+7uvAwhAhfMLrRKdGmzTruL6vyU+7NfnnTcO4za6W/PwFXInc/ucwqI3T1alrdIpkFaQRQwwhsNoF4cHges87Gj5hkGN1OYoRMkUMlS1VZgCCLCNAeISFHuvoJE0njZpkFlgNjngjQXIaFbU6ZHswHPGPyPNCGWQBBibx8ykD6Xrz12O9ryuFgEFbg1CTXV4dLSvVx+VCGxwk7OkKbolKHs/Jng5O1LI2OSfa0hs2r++WCrSRvqEEmOrt10RjQx/XuJPoThdswPi9PE7H2yDOMKvEPN8OnPyrUogBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZgjmK0MjF28ZF/OD2eNOYvENsupBtTUDUhEGCXotFyo=;
 b=Y6PwSLdUoMdQkVoAPHqt4Up811QhNeGGCznbUlH/KjVqfGN5TB0/vhKuDolHbYF9fCIB1UFQzufor5VALth2Y8E1vuLeRwbiiTf2JiDiTKgD+NLZ9WG2ms+DjBSrVPBRVOKLsJpVd0lSGdKQZwkBKSKiYQXohalJKeuNUNYBjz1TrXnbprzLYkQl5HA6xyonruET2vCzXsGr3XR7f2qyIu/76hMpBw+0qlRH9bMfLEr/LKL2nAFgkEbSOycsR1K7c8zkmwxkyv9pBEpLDp8uo91AOn6AyXc57s1BBsZH3jcpnrDtZ6wykTA8Ad/YLIWZMNqN/zoYhv6Rvx8bpdjyJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO1PR11MB5026.namprd11.prod.outlook.com (2603:10b6:303:9c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.16; Fri, 27 Feb
 2026 18:32:22 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 18:32:22 +0000
Date: Fri, 27 Feb 2026 10:32:19 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <riana.tauro@intel.com>,
 <michal.wajdeczko@intel.com>, <matthew.d.roper@intel.com>,
 <michal.winiarski@intel.com>, <matthew.auld@intel.com>,
 <maarten@lankhorst.se>
Subject: Re: [PATCH v2 8/9] drm/xe/migrate: Introduce xe_migrate_reinit()
Message-ID: <aaHjM/uWgWRufcTi@lstrano-desk.jf.intel.com>
References: <20260227170049.3418863-1-raag.jadav@intel.com>
 <20260227170049.3418863-9-raag.jadav@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260227170049.3418863-9-raag.jadav@intel.com>
X-ClientProxiedBy: SJ0PR03CA0137.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO1PR11MB5026:EE_
X-MS-Office365-Filtering-Correlation-Id: a058834b-17bf-4c97-747e-08de762e8c08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 1AwxuTPkumHlGlUms3rOYuzGFnopaOAY72hSChAkFUrq6uaH54hV3dJ1tXzoOTOSmOBrVEUd4+VRzRXDW+V+lzIzL23eO6/UFdHEWw2hSm+9FAezXA87qrcZnpjJazfaLuO8ZcQJGj1E57HbFHL1daWkvKeewP/DRvCUxnVJmThWMp2J/BbQHpgEXOiA7Ui7ZUpDmQwFN9XGGrLYjg7Oqya1SK6VFBuhmGoWgO++e1tbx/ZB9RoN4kGE6Yb9GKHvOpJCcFIGOGtSt4/ClA/seuWkljJ5Qrc4djQ3Ucs/ALIomalyKxlt0vDBYLNF1l9OcDiYVaJDhU44O9GhweT6cwKqhurbqTAo2zTy99YxK34h7/7m7nMQ8qtyF+AiJGkMLwvHAEqngPcGiyq7/GzJWj/9xSFSu17ffbFs5NWXwVPfbdo/bVmfKco6dntBQ5up0vUYeCwy5mMxEL+yskJbW2NNxLLoLXdHAZmn7cksLadaDP6yMQ1jQAPc6hBvojJOhCwhIcDTvmrIusijXCLKkpc07ZgSolp3m3Zhj9sidYNKqLwivafar4NBzVmjntfWa0/ouVDXPD2t1pq3j6f1SabsgGBcLSfScwAL0JwfwRua1cfGt37vkYxvnYwJDmdBhRjkBgWyy9ViZnp8zLY831gqjhsDEGOC7Z9qAOI4x/sOod2ctzstDPgeVT52seTRv3XGU7khD69LtlGGME8jUX5JitoX+/5ryridjtgem8U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TzYramVGUTZJc25uN2E4YVlTNmsvNllJb3FYTS9mRnlETFFXVlNtS3V4Rm1u?=
 =?utf-8?B?YnZla0lPazU2OThIalpraUpMKzNSdDNyZmVybUMxU09qRHllbnVkTzhMNGJN?=
 =?utf-8?B?WkNTTnNnTzg1cEJmUEE0L3NUcUFWTWpGU2NCUzJJMEJqckRPQlFmNGxneFFZ?=
 =?utf-8?B?ckZ2K2o2ZDhjeXAvUjBCWndRSEVIeGR0K091RWdIWmRTMDAzNVd0THMzWXNM?=
 =?utf-8?B?WjRFSWpRc1ZzdW9oR29rOXdCcHJTT01nemQyQ241cjRFTHNIM0MwNS9DRkRt?=
 =?utf-8?B?TWl0K2FUelhuTHJuY2VWMzZRRGV2SmxMWTV3R1JuN2RmUG9qbnA5ZGJ4NnhU?=
 =?utf-8?B?ejR0L1VqMGV0alBTL0F3SlN6UGlpNm9wdUkzTWNrZjVpMkEyUlhpaWIyZkpD?=
 =?utf-8?B?aDkvZ1QvcTZyZjd2MXM3VVh0T1FrdWxxcXJQL2ZmbmR6VnlVaVg2RlZOTi9N?=
 =?utf-8?B?S2RIYUNHWFh0ZXlWbUlJcDJrUk9SV2NIVEpUbTBmNlVVL3UvdVEyQkppeUxa?=
 =?utf-8?B?bS9QcFNidVhqL0NSSTZFam9UaGF4RHJIRDlSL1FzRmpOc1ZxdStDTVZPeC80?=
 =?utf-8?B?YXBUZ2JiSTNnSWhZa3orSFZjM0dsWFluWUNXWFV4NEJHWnpFc2xleVhGMnZm?=
 =?utf-8?B?NG5CelVBbGp2WjNwSzZ4cVlmMUs3WnZiNXZQU0NqMzl3UzlEU3Y3alpYTzNp?=
 =?utf-8?B?dDFiWWJMYkdHMUZWQkNIWENBT3dhY1NjaU42RUF2Z3BWSktiakNxczM4NXE0?=
 =?utf-8?B?b3FCdGQzQWRybXhydjNXSGhIV3htV012S3phaU5mVXcxRzByekRoRk5Gd3l6?=
 =?utf-8?B?Tm5ySDdnd0ttbnNsWlRoYzFDOXhPUHpyOVRDbnUrZmt5UVFTdjNwUDIxTm83?=
 =?utf-8?B?dENFSGFHdnJ5YVhRVFZwVUo3c1FUYWNiZXBabDdxelZRcXBId1YxeHRVVjVs?=
 =?utf-8?B?YlloN25yQjAxYUY4RnZVcmwzeHRLaTcreDZNM2Jua3lnUDJaTmQxQTJHVkdD?=
 =?utf-8?B?dk4wMS84clBuRWUvYzE4QWxzYzVGRTE5Rm1FZ0FHWEI2ejlLdXJjOGVPNVlG?=
 =?utf-8?B?WGV1anpNR1E0UW12MFBpMkR2UmxoVGJJK1Fld2NlS0t2MmU4Q3VXaWFqeVp3?=
 =?utf-8?B?MVFNb3J0M3ZITEZ0NzJrWXA4MC8zR0NRa1ZWT2JZTFp6ZmZ5KzFISE1Jcisr?=
 =?utf-8?B?MG9ncU9hS3NaTElOdVY2VUVaODZvMG1QWTlqMjNaRVJZUkw1aUVvbVhwSnpv?=
 =?utf-8?B?VkoyTUNTc3Z0a2hXZnBFR2hJaGV6ODJWWk8raDhhRmRmUDlYVHRGbVpsdHk3?=
 =?utf-8?B?RTNhUzdXWlRQak9qTzV6Nzh5SEh0VFVGOXdMdGJhMzNkd0FYa2dqZ1RoUE5Y?=
 =?utf-8?B?RGk4RVkvZ0dGMVZacHpUWWFmWnJKeUtuTHJ5Wi9BYVFlMUdlc2lRYjRHTkhG?=
 =?utf-8?B?bURkUmU1UjNNRThBT29wY0NPY0FFcXNHeXNUQTZCNVlkendPa1VLU21VMzNj?=
 =?utf-8?B?K0tOOUY5WXB0S0ZxdzBmNDZWbGhWcmVMQk1JVXBFZHhya29WaGtSOFc5UHFz?=
 =?utf-8?B?aTdVU3QxTEd1Q1QrL0FoTDhmNWNWdkd4aC9aMFJIYWxhRVVacU8zbm91U1kw?=
 =?utf-8?B?ZVdNcG5oRFRUVzJ6ZHlEcXp5N0ZidE9kRTRwMmNUcXJacUEvbEpsdlJQbkR5?=
 =?utf-8?B?TFkreC9ZcVJJTTlaVnJENGd1NDlHY3k0NGl0VWpkeHg5RVFtenR5WFM3YmZR?=
 =?utf-8?B?Slg1cUluNVFjTWxtWHVqbVAwYThrbGowQW5FdzY5eDc5SHVLa2pMVi9WeVJZ?=
 =?utf-8?B?N0UybEsyaFB3cS9iRFp4djBYYWJEQ0cxeGpjNUg1TTd3Um13bklkREUrT0ZJ?=
 =?utf-8?B?NFF5TjY1L1A3VTdaSVRRellxZ1RWR0UvL3BQREdIb1FhOUlPMTRpZzY2VDBt?=
 =?utf-8?B?cUQ3dWp0MjFpckdURFZqdkYvd0xsN05lTVFmbVVweXFMVFFRU241UDQ3R1JB?=
 =?utf-8?B?bzQ4QkIxWFRtK3MrdVdjVXZZVStwK2RBMi9qWnphVUMrN1dWanEwNWV3dUdu?=
 =?utf-8?B?SmJ4eUdnY2NPMWFMNGUxQU56Q3lpRjZUKzJJMC9HNTlxZkpNVDIya3dRenFQ?=
 =?utf-8?B?ZFlhcEluQm5xUGp3bUlDTVY5Tmx6YXR5MFYrODlBb3p5VXNBU0thaURQSWF5?=
 =?utf-8?B?YnB3RVhiRE1XTy9qK1gzUzIxRm40QXlDTGxoQmw2UThkdldLUnlRN2FaSDQ3?=
 =?utf-8?B?ZjVqZ2pTYjlsRjdNbWxrYThRWEVRYWpXcDRwSURTc25DRkdJTm9EMnNxc3Ns?=
 =?utf-8?B?YSt1WlNLTGlaMVdiNzJzb21JVEphTUFpb2x3NThNSGxHY0VpWTh4V1FaQWNh?=
 =?utf-8?Q?bHYbciMLNdyeEJhA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a058834b-17bf-4c97-747e-08de762e8c08
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 18:32:22.5295 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dpjoq9zpboNPUXEgW4pyYMLCP9cLFzA7NP3w/EO3dUoQyvAyds1MkJ2eaYI5KCuKiI5D+tXkicnaCqDCKCoBuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5026
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

On Fri, Feb 27, 2026 at 10:30:48PM +0530, Raag Jadav wrote:
> In preparation of usecases which require re-initializing migrate context
> after PCIe FLR, introduce xe_migrate_reinit() helper. Migrate exec queue
> and pt_bo already exist in migrate structure but since their contents live
> on VRAM, they are lost on PCIe FLR and need re-initialization.
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
> v2: Re-initialize migrate context (Matthew Brost)
> ---
>  drivers/gpu/drm/xe/xe_gt.c      | 10 +++++
>  drivers/gpu/drm/xe/xe_migrate.c | 65 +++++++++++++++++++++++++--------
>  drivers/gpu/drm/xe/xe_migrate.h |  1 +
>  3 files changed, 61 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index ff4a4e769fb1..ab34312830e3 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -966,6 +966,16 @@ void xe_gt_flr_prepare(struct xe_gt *gt)
>   */
>  int xe_gt_flr_done(struct xe_gt *gt)
>  {
> +	int err;
> +
> +	if (xe_gt_is_main_type(gt)) {
> +		struct xe_tile *tile = gt_to_tile(gt);
> +
> +		err = xe_migrate_reinit(tile->migrate);

I think there is work ahead for future platforms where multiple tiles
point to the same migrate object, so we’ll need to keep an eye on that.
Perhaps calling xe_migrate_reinit twice is harmless too.

Anyways the patch looks correct.

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> +		if (err)
> +			return err;
> +	}
> +
>  	return xe_uc_flr_done(&gt->uc);
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 333af7b57ae9..f4a2ad3ce601 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -184,19 +184,11 @@ static void xe_migrate_program_identity(struct xe_device *xe, struct xe_vm *vm,
>  	xe_assert(xe, pos == vram_limit);
>  }
>  
> -static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
> -				 struct xe_vm *vm, struct drm_exec *exec)
> +static int xe_migrate_pt_bo_alloc(struct xe_tile *tile, struct xe_migrate *m,
> +				  struct xe_vm *vm, struct drm_exec *exec)
>  {
> -	struct xe_device *xe = tile_to_xe(tile);
> -	u16 pat_index = xe->pat.idx[XE_CACHE_WB];
> -	u8 id = tile->id;
> -	u32 num_entries = NUM_PT_SLOTS, num_level = vm->pt_root[id]->level;
> -#define VRAM_IDENTITY_MAP_COUNT	2
> -	u32 num_setup = num_level + VRAM_IDENTITY_MAP_COUNT;
> -#undef VRAM_IDENTITY_MAP_COUNT
> -	u32 map_ofs, level, i;
>  	struct xe_bo *bo, *batch = tile->mem.kernel_bb_pool->bo;
> -	u64 entry, pt29_ofs;
> +	u32 num_entries = NUM_PT_SLOTS;
>  
>  	/* Can't bump NUM_PT_SLOTS too high */
>  	BUILD_BUG_ON(NUM_PT_SLOTS > SZ_2M/XE_PAGE_SIZE);
> @@ -216,6 +208,24 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>  	if (IS_ERR(bo))
>  		return PTR_ERR(bo);
>  
> +	m->pt_bo = bo;
> +	return 0;
> +}
> +
> +static void xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
> +				  struct xe_vm *vm, u32 *ofs)
> +{
> +	struct xe_device *xe = tile_to_xe(tile);
> +	u16 pat_index = xe->pat.idx[XE_CACHE_WB];
> +	u8 id = tile->id;
> +	u32 num_entries = NUM_PT_SLOTS, num_level = vm->pt_root[id]->level;
> +#define VRAM_IDENTITY_MAP_COUNT	2
> +	u32 num_setup = num_level + VRAM_IDENTITY_MAP_COUNT;
> +#undef VRAM_IDENTITY_MAP_COUNT
> +	u32 map_ofs, level, i;
> +	struct xe_bo *bo = m->pt_bo, *batch = tile->mem.kernel_bb_pool->bo;
> +	u64 entry, pt29_ofs;
> +
>  	/* PT30 & PT31 reserved for 2M identity map */
>  	pt29_ofs = xe_bo_size(bo) - 3 * XE_PAGE_SIZE;
>  	entry = vm->pt_ops->pde_encode_bo(bo, pt29_ofs);
> @@ -338,6 +348,12 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>  		}
>  	}
>  
> +	if (ofs)
> +		*ofs = map_ofs;
> +}
> +
> +static void xe_migrate_suballoc_manager_init(struct xe_migrate *m, u32 map_ofs)
> +{
>  	/*
>  	 * Example layout created above, with root level = 3:
>  	 * [PT0...PT7]: kernel PT's for copy/clear; 64 or 4KiB PTE's
> @@ -363,9 +379,6 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>  	drm_suballoc_manager_init(&m->vm_update_sa,
>  				  (size_t)(map_ofs / XE_PAGE_SIZE - NUM_KERNEL_PDE) *
>  				  NUM_VMUSA_UNIT_PER_PAGE, 0);
> -
> -	m->pt_bo = bo;
> -	return 0;
>  }
>  
>  /*
> @@ -416,12 +429,22 @@ static int xe_migrate_lock_prepare_vm(struct xe_tile *tile, struct xe_migrate *m
>  	struct xe_device *xe = tile_to_xe(tile);
>  	struct xe_validation_ctx ctx;
>  	struct drm_exec exec;
> +	u32 map_ofs;
>  	int err = 0;
>  
>  	xe_validation_guard(&ctx, &xe->val, &exec, (struct xe_val_flags) {}, err) {
>  		err = xe_vm_drm_exec_lock(vm, &exec);
> +		if (err)
> +			return err;
> +
>  		drm_exec_retry_on_contention(&exec);
> -		err = xe_migrate_prepare_vm(tile, m, vm, &exec);
> +
> +		err = xe_migrate_pt_bo_alloc(tile, m, vm, &exec);
> +		if (err)
> +			return err;
> +
> +		xe_migrate_prepare_vm(tile, m, vm, &map_ofs);
> +		xe_migrate_suballoc_manager_init(m, map_ofs);
>  		drm_exec_retry_on_contention(&exec);
>  		xe_validation_retry_on_oom(&ctx, &err);
>  	}
> @@ -429,6 +452,18 @@ static int xe_migrate_lock_prepare_vm(struct xe_tile *tile, struct xe_migrate *m
>  	return err;
>  }
>  
> +/**
> + * xe_migrate_reinit() - Re-initialize a migrate context
> + * @m: The migration context
> + *
> + * Returns: 0 on success, negative error code otherwise.
> + */
> +int xe_migrate_reinit(struct xe_migrate *m)
> +{
> +	xe_migrate_prepare_vm(m->tile, m, m->q->vm, NULL);
> +	return xe_exec_queue_reinit(m->q);
> +}
> +
>  /**
>   * xe_migrate_init() - Initialize a migrate context
>   * @m: The migration context
> diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
> index 1522afb37dcf..fffbcab8b2e3 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.h
> +++ b/drivers/gpu/drm/xe/xe_migrate.h
> @@ -112,6 +112,7 @@ struct xe_migrate_pt_update {
>  
>  struct xe_migrate *xe_migrate_alloc(struct xe_tile *tile);
>  int xe_migrate_init(struct xe_migrate *m);
> +int xe_migrate_reinit(struct xe_migrate *m);
>  
>  struct dma_fence *xe_migrate_to_vram(struct xe_migrate *m,
>  				     unsigned long npages,
> -- 
> 2.43.0
> 
