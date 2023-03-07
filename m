Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05D62C678D5
	for <intel-xe@archiver.kernel.org>; Tue,  7 Mar 2023 16:03:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C37C210E107;
	Tue,  7 Mar 2023 16:03:24 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D8E510E107
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Mar 2023 16:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678205002; x=1709741002;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=1y1pU6n8riDHXTE1BECz9YyFa3dJGcRm1e7nppNLynY=;
 b=In9dQg47M1HP6T4Gc76XAfwDhMNuVVHSq31PYoz35JjqjN/kbm6Hupnt
 Mbl7DEs+6m4E01KN6F48jIk7wdWcVgBci8oAR6DCUyqZbHTEHi2532Btx
 IF+Ys7jFWPJz1q8Yn6taKmK0nTZbuW/xp0npMAMiSW5+0MYzmquI88Xdm
 U+/DLN1ryWhTq6WdO7NuyHYvPdA8fQMshdgdwK5+uZsQtgJw7CyehPD6f
 lvT1pJIW/NCnWY97U1cBgx7CcjS0RKNqEdoPaFzqGtpFNGl0WETpdC5L7
 EKZeIVTQJM3MpKnVU+AFXezkXcv7NtFkp8aQtnHtB8GKj8/yRnl9Mgg0S w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="337406301"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400"; d="scan'208";a="337406301"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 08:02:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="678985585"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400"; d="scan'208";a="678985585"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP; 07 Mar 2023 08:01:58 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 7 Mar 2023 08:01:57 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 7 Mar 2023 08:01:57 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 7 Mar 2023 08:01:57 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.103)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 7 Mar 2023 08:01:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CUBLOVKVb95rmOFprxkyEk8P17590NET/PvZkSzgoDFrY7Lhf88j0J3g6Spxxj4rYl65/JrRIQaakGOTFYGXhu7+72UO6dwmRfVKLxGmQvYuG85/r6ZoxU8C9mcHVx3bxnbriSJjgn8EVtUTpuET64iXTvLfCWEL2ewrQnWqaJS6ZcGU5I9BBUJsXgOQK9arH72q+tenab2sANLfC7lmVwlrCwcZ/6HXZzMFyqJtjhDuRN3s6k9EzO/MQ0pMM8+7PymsZfcaW2CaL/gwY7RWyzD49fkn700IsCTACne/qDeQ6pFRs7VJ7N6O/hn08KPdLHtixBX+Qjf4kkKueF9F4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KJTEHRl5zR45vMd7mIz4jKO0gw73ZFZlGIXHfAYGUGY=;
 b=Ws4bAOYx2K3uvi4FYx8zD9YpZkGsMq9v1joDxwrh8I4gYtpxijntkvUmBDfjQGhSs0suSb0lXLyeyMByNR6YieK74uW6rBcE4vFL9RaSaoQiHjVtgVwoYMbnpfxhyKwN3E/DoefUn5j9XIX7AbZI2KcMaY3nh21aeJ7t/xiHjxPI5s669mzcSKNp2RUkDJQCze6nobggeHtDhPZBPuCRVdwQbSpBc1FMrHzPPasrMoTVlECL4ITPKlnq4aCsYr7dDBq6ubC0jYivIfeGfYha363As2tgAn75L/l/tFoUKX7FKes24BtM3JDibHX/GY6kRvU9BDrpocnbO57JUu3GQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM5PR11MB1897.namprd11.prod.outlook.com (2603:10b6:3:112::9) by
 PH7PR11MB6883.namprd11.prod.outlook.com (2603:10b6:510:202::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Tue, 7 Mar
 2023 16:01:48 +0000
Received: from DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::5a34:2a91:9ea5:3e8f]) by DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::5a34:2a91:9ea5:3e8f%2]) with mapi id 15.20.6156.023; Tue, 7 Mar 2023
 16:01:48 +0000
Date: Tue, 7 Mar 2023 21:31:37 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Message-ID: <ZAdf4eGqwBMPFZFO@bvivekan-mobl>
References: <20230306223651.2428170-1-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20230306223651.2428170-1-matthew.d.roper@intel.com>
X-ClientProxiedBy: PN3PR01CA0105.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::9) To DM5PR11MB1897.namprd11.prod.outlook.com
 (2603:10b6:3:112::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR11MB1897:EE_|PH7PR11MB6883:EE_
X-MS-Office365-Filtering-Correlation-Id: 52d79594-4181-4d01-a3d1-08db1f254174
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jJFIsk11oMDt7/Uj9ANle8BQvzui9eQ454gMPB3g+HlhbgBjSHpw14RO5Nx8UVrV4Y1uVpJNPQIVV4Vn6Qw6tJOuv+UMwqet7dWV+Nymvq8tnfieUNqlX+Wu0YHWxLkbiQTjY8WSXUqhPYX+jF7nJGNbQs4qxGTntF1HokMGi492fxs9czPQ4+2wL08FjbCwKjq5T7KjLs9u3pXIlQEv0ye54S810RSynbyXn1JYJV0bqRzHZFHbvWqgjMxZZrkOJ6jHXuUHzpfqie/pailzx5kmDvmHoFWUza71ZKo5uwC+TWO8qu5q6yrXEakYJ+PVHdqqsKH1iKSeRtrLs73+tN1+7FCG1fCWtu3iDnkdavCofxuWWOwwNyTl6wPnsjWdbi40NTFK4mk5/bHyvacNfB+Pu8Qq+bO6BUNa38puNMnDmaFRggu+jXMo/1Osz+TwPx3nN5Ao9JJiqeqlL5GWlS4IF1fB9Y69K2U2LVxIEfaSRaidWZSO3ckTWPy3nqnQPdzt2mBKA8y3Q1z9FN5lMwdCL9HP9KWzr5VS2tv0Y+i8U0jcYKcyqH8k4OUbrFVwFzzGVEbGJ5oIXchupCZroIwpzYs7citDm54qh9LxXsuNWteW1xsO9qq8DO9MgABaKppUP/P04BEiUmEX1PWg2A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1897.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(7916004)(376002)(396003)(366004)(346002)(136003)(39860400002)(451199018)(8936002)(5660300002)(41300700001)(66476007)(66556008)(66946007)(44832011)(8676002)(2906002)(316002)(478600001)(6666004)(26005)(6486002)(6506007)(6512007)(53546011)(33716001)(186003)(82960400001)(86362001)(83380400001)(38100700002)(9686003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UHVSM1hFR1ZCNVg2MFRBWjdXT1hzV3NoOXBYWU9KN2dxci9TRWZFRGF4M3Z1?=
 =?utf-8?B?bi9EMW5lWml1V2EzMzlDUmxnWFhSclVQUkpjR1gzaTdCVWdOTFhrZVl6MVlq?=
 =?utf-8?B?dzl6U3l0VHI0QkFQdjl3UTBVZVJ1dG5Ld2pYNS8waCsyQy96THg1UXNNNDJN?=
 =?utf-8?B?SURsUUJtM0FFYm80ekxkYlN2ZDI1VmxOdXQ5VXBiRS9yZXp6WEJLWjZnMXE4?=
 =?utf-8?B?bXh0MHpjWXBwSTAwSllocElwVDJPM1ZxV1kvUmRobVVIN0JkSHNha1BTWnZS?=
 =?utf-8?B?SmFybU9yUXpMQzVHSy85YWRPY0c4ZnlYVXhKZUpqNDdmZG04RDR2TFQyU2ts?=
 =?utf-8?B?Yk9Ta2YxSVYyMDJWcTRwbWZUL055T0djaGkxNU53RlJ1OW5INE1GL3YxY0VQ?=
 =?utf-8?B?cUN1QzdhTDhXbHVTUGx1a25KdmRJUmpURUNvaS9lUVNlVUVjMUJDVGJjKzVW?=
 =?utf-8?B?Y1JyMFRhRjN0RHlnQmtpVVprMTkvdk1VQVp0YWFDWmJQdjgzTnZvdnNkTHk4?=
 =?utf-8?B?bm9QSVVCVjZpUklNSEV6aE1CU2hrZkk0QTZQSmJ0Y2FGWkdqWk4xbEZsNDV0?=
 =?utf-8?B?cTZmd0lTVlBSU2tmS2I3UWtPZjI0a28ycCtTdEZld1BUeWV0bW5ISWlaenpK?=
 =?utf-8?B?TWNtWUZtcEc2TFlyckVGNG9Cb1JJT1RuN0VqT1dLMWxnWUYyZmtTeDR1akpw?=
 =?utf-8?B?dTRsZzF3MDlyR2VCTWVSNUJwUmRkNGVhcm1mNzZxSVA4czdBZFNBWHVKNll6?=
 =?utf-8?B?NGE0OUtaMUxsdmFKZko4WWhXeERmcHpCanBhYVp4d1I1R3BGTVk0M0ZkN2pH?=
 =?utf-8?B?SXZ2aXRKR240R0tCRjc2ODIyZEFQbDFoSXJTNUJ2NlpCL2lYME5tZnIvV2RS?=
 =?utf-8?B?VVEzc3k4MkhqWDFhajQ4UEkvWHJCVG1CVFFML09pRVBVWXE2TXk2YjNwcUVG?=
 =?utf-8?B?VlNDbDdmdEV1MndpYzQyb2xqREpZUUZkRklZZG10aE5SMldRTmxwZHhLTTN4?=
 =?utf-8?B?ZElWYmhNSXNSZUd1UGRQaFJjaWV5RGZmMmlHZTF0dDNOUitRMmVQOXJ2TEZq?=
 =?utf-8?B?M2hMRjM5elk2UEFNRmZtY1ZKaU1uS0g4bnNpL001MHlQNTdmWUNUbGwydXVs?=
 =?utf-8?B?aWFmOEsvNnZ4Uml1cWZVV2xLSGtlZ1ozVDl5QndqNUNrd0hZbzNsOTVPSDk3?=
 =?utf-8?B?TkhVUXFoRlZEcUFqNlRNMjg5OUlOL1o0UDZVTUdXTEVEV01EUms5NVpaWmIy?=
 =?utf-8?B?YzdtU1JUYzltVlVNdU5kVVJEY2UvRUhtUGd6R3Q1QktSUis2VG9GZlhxMVY4?=
 =?utf-8?B?WjRFdmdhNDFNYWRkVitValR0UGtId3VGM0VEc2ROZmYzWEphdWFqWXVPK0Z0?=
 =?utf-8?B?bE1vV2tDNXVrbktrRkF1bDk2blJmOXlVQXhHdHU2Z1h0eTRxQjJ5emtXcnps?=
 =?utf-8?B?T2FGbkJ2bGFRT3hDT2dheWgzcVhaYkprL0JCUWRKM0NuU3Q2MUY2eTd0Wm91?=
 =?utf-8?B?NWpxTTFEOFB0cHQwZjFjZmlmZksrZy9WdGtaRlhqLzhQM2VrQVZqU0hpZHFx?=
 =?utf-8?B?OFh0ekJkakdlMktpZlMrS1Q5bFJYaXhrY0kxaWVrcVdjWnB4ZEgzamRWYU1Q?=
 =?utf-8?B?WnExaER3bmxyTDc4SlQvdlFNbjhFMUJqeE9GZjZPOUp1QTluR2dibVUwKzJj?=
 =?utf-8?B?NThzM3NibW5ZcU1UU3VGT3EzSnQzTTlxZVFFRCtvWStMQUpYemx6cElLZGFQ?=
 =?utf-8?B?RUJuTHo3bXlTTEl4Z2Z2TDJ0YmJqUklmaHIzYlpjZHg0aWRQS3E1NmU5WVVl?=
 =?utf-8?B?VDg1L0xseDdBOUxWb3Q1RHlZaFJZRFV2WU9kVzRZd2FGc1hxY3JKK3ZaTW4y?=
 =?utf-8?B?Qkg5blYydDhHMTM2K21YK3lDV2s3Yk1Fckk3eXdGaXZlaU1IZFZFb0wxNEEx?=
 =?utf-8?B?VEllak52K0FRWWw1T3ZmVWk1L3dKKzl0Kzl2TDl4clVSYnp3QWhZeHRMa1hm?=
 =?utf-8?B?VUROd1ppWmRZVGlBNWFiWVMzMHhvMG04UHpHczltSW1aakh0aHhPTHR2bThL?=
 =?utf-8?B?VDc2Zjl1bm5WVWg0YTBNNlZGSnFid1ZmR2NXKzgvaTd6WDNYMXdTM3lFQmZo?=
 =?utf-8?B?WWxQcGpuS284cmJnMk9kd2xQZVlBOUZ4aWxNQjliSGd4S1RjVGZlRUtKalBR?=
 =?utf-8?Q?gl7JWKpD9CNVfOO+sSoD+FGuXMIu4jlnEOl6HBwLgisK?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 52d79594-4181-4d01-a3d1-08db1f254174
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1897.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 16:01:47.9690 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hPPuiFJyVWNdRB1zcH4yHrpPMnHS6uDdIkhZyYCAHsnaUV6waDCZraKETasm0VJIZwyU167ir7ZXdlXNiqB0LHO7et/qvisdTHSGzPTpXdtc2DpWuvxJnklCufypU7Gd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6883
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: Separate engine fuse handling
 into dedicated functions
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

On 06.03.2023 14:36, Matt Roper wrote:
> The single function to handle fuse registers for all types of engines is
> becoming a bit long and hard to follow (and we haven't even added the
> compute engines yet).  Let's split it into dedicated functions for each
> engine class.
> 
> v2:
>  - Add note about BCS0 always being present.  (Bala)
>  - Add forcewake assertion to read_copy_fuses.  (Bala)
> 
> Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_hw_engine.c | 35 +++++++++++++++++++------------
>  1 file changed, 22 insertions(+), 13 deletions(-)

Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index b035e2fa6744..ac00693ba0b2 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -369,29 +369,29 @@ static void hw_engine_setup_logical_mapping(struct xe_gt *gt)
>  	}
>  }
>  
> -static void read_fuses(struct xe_gt *gt)
> +static void read_media_fuses(struct xe_gt *gt)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
>  	u32 media_fuse;
>  	u16 vdbox_mask;
>  	u16 vebox_mask;
> -	u32 bcs_mask;
>  	int i, j;
>  
>  	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
>  
> +	media_fuse = xe_mmio_read32(gt, GEN11_GT_VEBOX_VDBOX_DISABLE.reg);
> +
>  	/*
> -	 * FIXME: Hack job, thinking we should have table of vfuncs for each
> -	 * class which picks the correct vfunc based on IP version.
> +	 * Pre-Xe_HP platforms had register bits representing absent engines,
> +	 * whereas Xe_HP and beyond have bits representing present engines.
> +	 * Invert the polarity on old platforms so that we can use common
> +	 * handling below.
>  	 */
> -
> -	media_fuse = xe_mmio_read32(gt, GEN11_GT_VEBOX_VDBOX_DISABLE.reg);
>  	if (GRAPHICS_VERx100(xe) < 1250)
>  		media_fuse = ~media_fuse;
>  
> -	vdbox_mask = media_fuse & GEN11_GT_VDBOX_DISABLE_MASK;
> -	vebox_mask = (media_fuse & GEN11_GT_VEBOX_DISABLE_MASK) >>
> -		      GEN11_GT_VEBOX_DISABLE_SHIFT;
> +	vdbox_mask = REG_FIELD_GET(GEN11_GT_VDBOX_DISABLE_MASK, media_fuse);
> +	vebox_mask = REG_FIELD_GET(GEN11_GT_VEBOX_DISABLE_MASK, media_fuse);
>  
>  	for (i = XE_HW_ENGINE_VCS0, j = 0; i <= XE_HW_ENGINE_VCS7; ++i, ++j) {
>  		if (!(gt->info.engine_mask & BIT(i)))
> @@ -412,11 +412,20 @@ static void read_fuses(struct xe_gt *gt)
>  			drm_info(&xe->drm, "vecs%u fused off\n", j);
>  		}
>  	}
> +}
> +
> +static void read_copy_fuses(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	u32 bcs_mask;
> +
> +	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
>  
>  	bcs_mask = xe_mmio_read32(gt, GEN10_MIRROR_FUSE3.reg);
>  	bcs_mask = REG_FIELD_GET(GEN12_MEML3_EN_MASK, bcs_mask);
>  
> -	for (i = XE_HW_ENGINE_BCS1, j = 0; i <= XE_HW_ENGINE_BCS8; ++i, ++j) {
> +	/* BCS0 is always present; only BCS1-BCS8 may be fused off */
> +	for (int i = XE_HW_ENGINE_BCS1, j = 0; i <= XE_HW_ENGINE_BCS8; ++i, ++j) {
>  		if (!(gt->info.engine_mask & BIT(i)))
>  			continue;
>  
> @@ -425,15 +434,15 @@ static void read_fuses(struct xe_gt *gt)
>  			drm_info(&xe->drm, "bcs%u fused off\n", j);
>  		}
>  	}
> -
> -	/* TODO: compute engines */
>  }
>  
>  int xe_hw_engines_init_early(struct xe_gt *gt)
>  {
>  	int i;
>  
> -	read_fuses(gt);
> +	read_media_fuses(gt);
> +	read_copy_fuses(gt);
> +	/* TODO: compute engines */
>  
>  	for (i = 0; i < ARRAY_SIZE(gt->hw_engines); i++)
>  		hw_engine_init_early(gt, &gt->hw_engines[i], i);
> -- 
> 2.39.2
> 
