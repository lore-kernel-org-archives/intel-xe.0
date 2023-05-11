Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8521CC77B7C
	for <intel-xe@archiver.kernel.org>; Thu, 11 May 2023 21:10:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5437910E0EE;
	Thu, 11 May 2023 21:10:45 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4CFB10E0EE
 for <intel-xe@lists.freedesktop.org>; Thu, 11 May 2023 21:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683839442; x=1715375442;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=326H+vYunq8PveSUsUU108rAolc6wKg2Ph6FwrsvasU=;
 b=TovcQCTaD9BDjSUZr3epJzb0d2FsS1m1wxCXIJWDr738Ch0t2g5HwB4H
 FKnVZsjrDb9VKzLsLZkUnnuUvaxKj1lkLZOK3Kt4UybAb9EsBjAMthbLl
 uX6HtIM//5t3EWYFbWyOF5j+12vq5ImnrdxZt9NQ85xslRUtenu3HAoiL
 RfsY1CHqWuah+Q8mUsmiHGYD+cnSEF8Fgwl7xfp1UyhxWaGT8cdobKlBi
 nuEmLMcrXvTDgSE1PMTF/wORd3Bds5s02EL1wFE/1MSZNEYwksVTXkfql
 2DBSNjQ8q3ehOqMlwRSoAQBHdSGQFEXstQBMOyWYUV4AFCnpJUAX1ggo4 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="378769566"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; d="scan'208";a="378769566"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 14:10:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="1029792078"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; d="scan'208";a="1029792078"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga005.fm.intel.com with ESMTP; 11 May 2023 14:10:42 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 11 May 2023 14:10:41 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 11 May 2023 14:10:41 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.109)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 11 May 2023 14:10:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M/S0fwQHUSzuw0Q0ReiuX70W5skLUXE4hJfpkFal2PafLs2LVPeVD7y5gRHL8+H99uXH9DKXQf2VKP13npAEqUXVBqEiXEpK59qmUGtI5g52q5ZWmnGhN4iiBcms4+mGwJqgR728/AxSfoPz5X2wssCu9mCcQRKDdyTnSvb0G028TsrI2KiIavoEO1ahiKcEJYRpu0ad/cJ48P4VHx56ohS9Ft7x6Ugbi2tLegaixCA/A+GUijd9nK8iHOZApN+dQ+l9P80MHaLhV37q2ZosDAXEGO5DLHS3S+QI88Wm0xiM8RqAHLGkJXgfatAvhhcZmSBLdPkMH1dptnHTWSaW7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m35kMJDJHcOVGbbvhvvQ1geJCV9Xw1r1ur5BkAgnXK0=;
 b=iG3TV36DYaSr9OSIIKuRSMzlhKrUKGwEcWAonyTPehAA62ZOKoRCGbeO1GEoy3cdx7Oy61+mIhde98KZanLsmjG3p0JxdkLY55xsspuh05pQRJqYQcXO8OM+vVAB1apfk3UyeBQtWNOzc9K2WBO9tVxq2km21JcDA+CGH+onCB2r08ZFsGxaZ9+F+KrDhUCITDpnXLQrCRcZzcvzvDgtoQFkvRxcnXxRK+TnnaqYiKv2WILSWI7cFinrezCeDjgveX9UhkBZHa1F1VEEiUlTLEORG72hjrcrIVgEf5VgGSqUM4WFaE4UOycGphqPQJVPNKLuZrYpwVvowMsi3bU0Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN2PR11MB4239.namprd11.prod.outlook.com (2603:10b6:208:192::20)
 by DM4PR11MB7256.namprd11.prod.outlook.com (2603:10b6:8:10c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.20; Thu, 11 May
 2023 21:10:34 +0000
Received: from MN2PR11MB4239.namprd11.prod.outlook.com
 ([fe80::e585:1863:208d:7e7b]) by MN2PR11MB4239.namprd11.prod.outlook.com
 ([fe80::e585:1863:208d:7e7b%4]) with mapi id 15.20.6387.019; Thu, 11 May 2023
 21:10:33 +0000
Date: Thu, 11 May 2023 14:10:24 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Message-ID: <ZF1ZwM2Aw/s3drRU@msatwood-mobl>
References: <20230511034722.1929038-1-matthew.d.roper@intel.com>
 <20230511034722.1929038-4-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20230511034722.1929038-4-matthew.d.roper@intel.com>
X-ClientProxiedBy: BY3PR05CA0027.namprd05.prod.outlook.com
 (2603:10b6:a03:254::32) To MN2PR11MB4239.namprd11.prod.outlook.com
 (2603:10b6:208:192::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR11MB4239:EE_|DM4PR11MB7256:EE_
X-MS-Office365-Filtering-Correlation-Id: 28812872-2fad-424b-9ce9-08db52642883
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cn9d7w3JJp/23EFXtuZTz1oqCjfuHYBkg2CfeVPpikXFCMU2sOAUlVaXMjx28h9+H0enTyYPflxxPn9JIVixDOLSkW97nkgwq1JjUGTXjWFTiQSADAeWoBspkKQ0cJFRhqdl8Sf3qgy6wHavt38k7p02lfHgpJw/6Qdtlvb36hNTzRjAqRorJUANAOShzbxXieEWssu/ktV9tgoH+iON7x463Dam2P6/lvovTMHdZ3oa4C7+Df/sEZfAXvcbRgrlyF/2oabQ+EYGqIIXANWCrwx9BSSmB4ZT0nCWVtvx4YciuSj9SL+inh5GYVUYQ2LqHzfnlogkBN2dDefdiAPiTXEsnIryhdSU9JvOyx+B/NIBxeSlSQLF5r7fXt01t5hVf+rtJPwcR05/gDjjwICLY+zRqMdIhhmDnhJsAhxUDWTVPXUS6ps4cBf+enCE2Oxk6aPH5kemWzBVm15V8agidCcUcZsk+x4xm703AGt6B0424E4ZPITVBan91yQaw3FSkOqjVWNM7B15LCb1v4qtUKRY+MLcTCKIBoVigu9H0IojVL5MZDu10sqyu7Il7uBw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4239.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(366004)(396003)(376002)(346002)(136003)(39860400002)(451199021)(186003)(26005)(6512007)(2906002)(41300700001)(6506007)(66556008)(4326008)(316002)(9686003)(66476007)(82960400001)(38100700002)(83380400001)(86362001)(8676002)(8936002)(5660300002)(478600001)(6666004)(33716001)(66946007)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UnFYdFpzSVlrQWRYTmhlcHIzUDZvejNNb0lld2U0b1pnenR3QVIxSGNBbFJz?=
 =?utf-8?B?S2FLKzUyVU5Fc0M5V3hVcUZCTVBhSnBCd1FRbWJmcEdUWTB0UzJIb1YydC9W?=
 =?utf-8?B?UnUwaU95cmNKVWoyRjc4eGZ0ckVTdzBieSttNkdzUHBoYy9KdE1ad2hpRjdh?=
 =?utf-8?B?OGtGdlRMRWhhS1J3d0xtb0w4VDhRSy9WYXIwZG1kZEk2NDF5bTIrU3RYOEFU?=
 =?utf-8?B?MUlpQUROSEcxZHJ6dElOcytqd0VnbUpybXNpeXJXMTNLK0NmeGIyMWpQdmh4?=
 =?utf-8?B?UkpWQTRIdUJJUVlVYno5VmY1bUdJRGZkQjhXMExFZmdKMFFRVWpNRjlRUmMw?=
 =?utf-8?B?NEhUeGJtcUxwdDQ0VTNISVF5bXpIZnpFSFo4dU54MTM1NnFYQ1B5VTNCNFpX?=
 =?utf-8?B?Y3ZxNnVBNkN1Z2J3em5PYjJZVWtJVkllWXhEbFRpZitzL05RQi9RUEEyMFNU?=
 =?utf-8?B?V1ZYaVhpcFd0MkxHT0dleG5GTEV6V003UUlXSW9hb0tsY05HbzlSNzRocGVP?=
 =?utf-8?B?UzJWbnRIOFNPMnZrNVdkcGVoaXpkelBTdW1UME0zcjV5b1dqZVdaMUVQTU9l?=
 =?utf-8?B?MmZFSWlUNm14TWx0b0IwT2NScHJCRjROWmxsODh5TFB6MmJWZWRtNXdVcEJk?=
 =?utf-8?B?NXJ6TUxDSmRQN001dXZjSmJoL0kwa2Flcm9ETTZ3U2J5VG4vTUQ4TDZEYlk4?=
 =?utf-8?B?SFJ0eDNvMnlncDdJLzZRMi9pWlp1bU5qSFIzSG1jOWNCeTVsZGdiM25OdEE4?=
 =?utf-8?B?ekpQS2hZeG5lamtWbWFGQ0Q4M3ljSnFvTEhoSmJnSTRQV1hqUW9iU0JSQmdl?=
 =?utf-8?B?Tk1wd1pzbENYOXdveW1qZFh5bnpLV2UyRDNYVEtkcE9laVlNQm5JTjByUUxj?=
 =?utf-8?B?Q0dJY1hjdWFUT0VRM0lYT2NSaWQ0WWluWEd0NkZTdUlFWTVLV1d2ekZWUGNV?=
 =?utf-8?B?am4vVzByQ3B2dGtrbWJ2bkdNcFNCeHJsSERrS3F3OUpRakszaVN2SHBQbVRL?=
 =?utf-8?B?ckJ4M2g3QU9WVDJuaTFIWFk0WmcwejgwdTdTZTBHNGYzV3lFU2R1ZVh5ZUpI?=
 =?utf-8?B?U28vRzlRRC9jbDhwWlhxbEtNanBpK2ZmV0ZQTHYxcTdCd2dwZFlEdDZjUjE2?=
 =?utf-8?B?djBjRkx4N3Z6RE5KNE1kVzk4ei9OTHBtTm1wTm1QSVpQYUhubmJDU0phSWg5?=
 =?utf-8?B?M0x2c0VYNHJjSDEwck9iSU44bHJmOEZUM0c3dEh4eVI5bmZsZjBIZllnaDRK?=
 =?utf-8?B?eGZMN3JSUUpCZFBmTGlEU1FpRW1jd25kMVcrQmdMUjFDQ3dPeXlMM2hwdVZP?=
 =?utf-8?B?VGZWUG5VcDJPckdNeGJUYmNBek52SHdDaFhWRWF1d0J1MkFReDBYZkJET2k0?=
 =?utf-8?B?Y29tcnY1am0yWUFqczh3R1NHL1YrcGZpYmJFeEphYzk3WjU5SEZQWWFZTjNP?=
 =?utf-8?B?UzJxY2g3eENhd2FOY3FMekZubUtydEwzeTAvazZ2cFBmMGhQYkxrU2tsdnZZ?=
 =?utf-8?B?RCtINWNuZVlVd2lBZHJidWU5WmNIMVFiQlVZN0xmWldrNm8zc0hFNWJwblJq?=
 =?utf-8?B?d1B4VXV2bXRSN0wySGtEck8xOUJlUEdzZWVTZmZ1S25Md2V5bGs5QWdDR1pR?=
 =?utf-8?B?c09vODEvKzJwWkYrUk44SVArUWpEU1FrSlR2V0FLUzkwa2JXS3VZaFhxU2lz?=
 =?utf-8?B?VEJJNGx4U2R3RThEbnJNcngzcEJwMDBnWU9GdzB5M2lvZnBlTlowV3pJUGpE?=
 =?utf-8?B?L2F2R1FJem42dXp4a2NDRVZSbjZjMGkyRGMyNmM2WUFXQnBsaVUxSUFkcHFL?=
 =?utf-8?B?aU1kNHcrbE9vd1l2SkJxUGdHa3hqdnZxc0dHRE52dGxKVmhsNTdncTNKR2hZ?=
 =?utf-8?B?VENKMDFnVmozMmRNL0U5T1BEYkZrd0JrbEN1SWtFTm9xWGNGZkNKWnhsTHEw?=
 =?utf-8?B?Vlp3c2toRHNTYm52VkpVR0N4amZOd3NIWS9SeFNIZVZKb2JNVFgyclFJbmRr?=
 =?utf-8?B?VHJXTXorbzdMdEVIOVBVUDI2bkg4eE5qK2FTNUxpNW13QUhiQTBvZGpEWkdB?=
 =?utf-8?B?bk9aN29yMG93T1ByS0ppRTdaQzlPUW14UjlmVTNlYTRGWnNiMWtRdk4rV2JW?=
 =?utf-8?B?dVBaRTFiMW9GUnRQdWZwVkhHQkg3c1FTMXZ1SVgwQVJleEZLUDM5eWRaaSs3?=
 =?utf-8?B?dWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 28812872-2fad-424b-9ce9-08db52642883
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4239.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 21:10:33.8508 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DjI4s6mt9zjgY30pVx0y3VokDrjXnAouJ6iNzUDHIdXBpxMzyhneRIOACdlOfCKEgqlQ0JSgp2oebP7ehdrWnIyvN9sKBCdHqGx7vZMHKNg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7256
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 03/26] drm/xe: Add backpointer from gt to tile
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, May 10, 2023 at 08:46:59PM -0700, Matt Roper wrote:
> Rather than a backpointer to the xe_device, a GT should have a
> backpointer to its tile (which can then be used to lookup the device if
> necessary).
> 
> The gt_to_xe() helper macro (which moves from xe_gt.h to xe_gt_types.h)
> can and should still be used to jump directly from an xe_gt to
> xe_device.
> 
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bb.c                  |  2 +-
>  drivers/gpu/drm/xe/xe_gt.h                  |  5 -----
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |  4 ++--
>  drivers/gpu/drm/xe/xe_gt_types.h            | 14 ++++++++++++--
>  drivers/gpu/drm/xe/xe_mocs.c                | 14 +++++++-------
>  drivers/gpu/drm/xe/xe_pci.c                 | 11 +++++++----
>  drivers/gpu/drm/xe/xe_pt.c                  |  2 +-
>  7 files changed, 30 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
> index 3deb2d55f421..bf7c94b769d7 100644
> --- a/drivers/gpu/drm/xe/xe_bb.c
> +++ b/drivers/gpu/drm/xe/xe_bb.c
> @@ -16,7 +16,7 @@
>  
>  static int bb_prefetch(struct xe_gt *gt)
>  {
> -	struct xe_device *xe = gt->xe;
> +	struct xe_device *xe = gt_to_xe(gt);
>  
>  	if (GRAPHICS_VERx100(xe) >= 1250 && !xe_gt_is_media_type(gt))
>  		/*
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index 086369f7ee6d..f4e98f499b36 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -49,11 +49,6 @@ static inline bool xe_gt_is_media_type(struct xe_gt *gt)
>  	return gt->info.type == XE_GT_TYPE_MEDIA;
>  }
>  
> -#define gt_to_xe(gt__)								\
> -	_Generic(gt__,								\
> -		 const struct xe_gt *: (const struct xe_device *)((gt__)->xe),	\
> -		 struct xe_gt *: (gt__)->xe)
> -
>  static inline bool xe_gt_is_usm_hwe(struct xe_gt *gt, struct xe_hw_engine *hwe)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> index c815a42e2cdb..c9e8825c02aa 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> @@ -322,8 +322,8 @@ int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  		TLB_INVALIDATION_SEQNO_MAX;
>  	if (!expected_seqno)
>  		expected_seqno = 1;
> -	if (drm_WARN_ON(&gt->xe->drm, expected_seqno != msg[0])) {
> -		drm_err(&gt->xe->drm, "TLB expected_seqno(%d) != msg(%u)\n",
> +	if (drm_WARN_ON(&gt_to_xe(gt)->drm, expected_seqno != msg[0])) {
> +		drm_err(&gt_to_xe(gt)->drm, "TLB expected_seqno(%d) != msg(%u)\n",
>  			expected_seqno, msg[0]);
>  	}
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index e0ed4508269b..c4376d50786b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -76,6 +76,16 @@ enum xe_steering_type {
>  	NUM_STEERING_TYPES
>  };
>  
> +#define gt_to_tile(gt__)							\
> +	_Generic(gt__,								\
> +		 const struct xe_gt *: (const struct xe_tile *)((gt__)->tile),	\
> +		 struct xe_gt *: (gt__)->tile)
> +
> +#define gt_to_xe(gt__)										\
> +	_Generic(gt__,										\
> +		 const struct xe_gt *: (const struct xe_device *)(gt_to_tile(gt__)->xe),	\
> +		 struct xe_gt *: gt_to_tile(gt__)->xe)
> +
>  /**
>   * struct xe_gt - A "Graphics Technology" unit of the GPU
>   *
> @@ -90,8 +100,8 @@ enum xe_steering_type {
>   * within a tile.
>   */
>  struct xe_gt {
> -	/** @xe: backpointer to XE device */
> -	struct xe_device *xe;
> +	/** @tile: Backpointer to GT's tile */
> +	struct xe_tile *tile;
>  
>  	/** @info: GT info */
>  	struct {
> diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
> index 817afd301d52..d57fbf16a3ef 100644
> --- a/drivers/gpu/drm/xe/xe_mocs.c
> +++ b/drivers/gpu/drm/xe/xe_mocs.c
> @@ -471,7 +471,7 @@ static void __init_mocs_table(struct xe_gt *gt,
>  	unsigned int i;
>  	u32 mocs;
>  
> -	mocs_dbg(&gt->xe->drm, "entries:%d\n", info->n_entries);
> +	mocs_dbg(&gt_to_xe(gt)->drm, "entries:%d\n", info->n_entries);
>  	drm_WARN_ONCE(&xe->drm, !info->unused_entries_index,
>  		      "Unused entries index should have been defined\n");
>  	for (i = 0;
> @@ -479,7 +479,7 @@ static void __init_mocs_table(struct xe_gt *gt,
>  	     i++) {
>  		struct xe_reg reg = XE_REG(addr + i * 4);
>  
> -		mocs_dbg(&gt->xe->drm, "%d 0x%x 0x%x\n", i, reg.addr, mocs);
> +		mocs_dbg(&gt_to_xe(gt)->drm, "%d 0x%x 0x%x\n", i, reg.addr, mocs);
>  		xe_mmio_write32(gt, reg, mocs);
>  	}
>  }
> @@ -508,13 +508,13 @@ static void init_l3cc_table(struct xe_gt *gt,
>  	unsigned int i;
>  	u32 l3cc;
>  
> -	mocs_dbg(&gt->xe->drm, "entries:%d\n", info->n_entries);
> +	mocs_dbg(&gt_to_xe(gt)->drm, "entries:%d\n", info->n_entries);
>  	for (i = 0;
>  	     i < (info->n_entries + 1) / 2 ?
>  	     (l3cc = l3cc_combine(get_entry_l3cc(info, 2 * i),
>  				  get_entry_l3cc(info, 2 * i + 1))), 1 : 0;
>  	     i++) {
> -		mocs_dbg(&gt->xe->drm, "%d 0x%x 0x%x\n", i, LNCFCMOCS(i).addr,
> +		mocs_dbg(&gt_to_xe(gt)->drm, "%d 0x%x 0x%x\n", i, LNCFCMOCS(i).addr,
>  			 l3cc);
>  		xe_mmio_write32(gt, LNCFCMOCS(i), l3cc);
>  	}
> @@ -524,7 +524,7 @@ void xe_mocs_init_early(struct xe_gt *gt)
>  {
>  	struct xe_mocs_info table;
>  
> -	get_mocs_settings(gt->xe, &table);
> +	get_mocs_settings(gt_to_xe(gt), &table);
>  	gt->mocs.uc_index = table.uc_index;
>  	gt->mocs.wb_index = table.wb_index;
>  }
> @@ -537,8 +537,8 @@ void xe_mocs_init(struct xe_gt *gt)
>  	/*
>  	 * LLC and eDRAM control values are not applicable to dgfx
>  	 */
> -	flags = get_mocs_settings(gt->xe, &table);
> -	mocs_dbg(&gt->xe->drm, "flag:0x%x\n", flags);
> +	flags = get_mocs_settings(gt_to_xe(gt), &table);
> +	mocs_dbg(&gt_to_xe(gt)->drm, "flag:0x%x\n", flags);
>  
>  	if (flags & HAS_GLOBAL_MOCS)
>  		__init_mocs_table(gt, &table, GLOBAL_MOCS(0).addr);
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index e79b16d8bf7f..87c328106aca 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -471,6 +471,7 @@ static int xe_info_init(struct xe_device *xe,
>  {
>  	const struct xe_graphics_desc *graphics_desc = NULL;
>  	const struct xe_media_desc *media_desc = NULL;
> +	struct xe_tile *tile;
>  	struct xe_gt *gt;
>  	u8 id;
>  
> @@ -525,13 +526,15 @@ static int xe_info_init(struct xe_device *xe,
>  	xe->info.step = xe_step_get(xe);
>  
>  	for (id = 0; id < xe->info.tile_count; ++id) {
> -		xe->tiles[id].xe = xe;
> -		xe->tiles[id].id = id;
> +		tile = &xe->tiles[id];
> +		tile->xe = xe;
> +		tile->id = id;
>  
> -		gt = &xe->tiles[id].primary_gt;
> +		gt = &tile->primary_gt;
>  		gt->info.id = id;
> -		gt->xe = xe;
> +		gt->tile = tile;
>  
> +		gt->info.id = id;
>  		if (id == 0) {
>  			gt->info.type = XE_GT_TYPE_MAIN;
>  			gt->info.vram_id = id;
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index f15282996c3b..61126cefe0b5 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -695,7 +695,7 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
>  		 * TODO: Suballocate the pt bo to avoid wasting a lot of
>  		 * memory.
>  		 */
> -		if (GRAPHICS_VERx100(xe_walk->gt->xe) >= 1250 && level == 1 &&
> +		if (GRAPHICS_VERx100(gt_to_xe(xe_walk->gt)) >= 1250 && level == 1 &&
>  		    covers && xe_pt_scan_64K(addr, next, xe_walk)) {
>  			walk->shifts = xe_compact_pt_shifts;
>  			flags |= XE_PDE_64K;
> -- 
> 2.40.0
> 
