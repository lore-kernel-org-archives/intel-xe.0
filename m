Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50051C072A2
	for <intel-xe@archiver.kernel.org>; Wed, 15 Nov 2023 22:29:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2220010E285;
	Wed, 15 Nov 2023 22:29:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AE6F10E283
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Nov 2023 22:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700087340; x=1731623340;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=sfftB0ZKCMZo1EzEjGqEEdqErCrAMuvqHUC3YsTak9c=;
 b=H8QnLt9a+f0Eq8pAvDi+1gutIbrd77+ivtL7TejGDyguz2zhdaegfw2n
 T2fYo9UAyWBZUQ2bQYJDf/SzcuOApK8kOg3WO0otbgXkJHhdoH5egljMq
 ZE2f8yFZZmDQPe2ZiQr/kJqSIiEjduZ3mdTD+3+A+TcytEbH2Vsd/INMX
 biLAKZBXNnaFWXH3xpZtb5wdWQyiPgi+R3IJVv5QUGDdaAdP/2Q/lwBei
 sFCgM8zfxCLNYgKRXFqR+rCpT0LjkQuyT75d9rrn0fovbDdu2NhhYb9//
 2GXzsvob+5cBXUKxrWPloL2T7LMZW8sOxc4tBJzawfOuib1VsfgCprjPX A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="394886376"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; d="scan'208";a="394886376"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 14:28:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="1096583335"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; d="scan'208";a="1096583335"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Nov 2023 14:28:58 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 15 Nov 2023 14:28:57 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 15 Nov 2023 14:28:57 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 15 Nov 2023 14:28:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fjIQIYFv8IoVHI/9dRWKROfwDdm93RR2AfbrYR8j15/lvtvMiPdro2OUGfR+P3iXJdqFGb2FYKfERMHDGHK6E4Zx6e8/IyxBHDOZk1WCiLw2hVEhrxWB2sRJTU4s2F/+MskCHeaDUjFsaUKzqEbQjjJB6OvLNEGYUcbpTz9qbJZD/kZdLZFcStjxTuHtJNfzIB1Uzqc2tVnDpSy9BhlRXSpbQzXvBK0r2R7weUMWQ/LqfZVlnUxazJ+FKxTmI+Jd06/G10i2XZJcdNS3dHwjWCZoM7yIZxgfZA3GA9b/dz7svWjQsr5J9KG2ZmSYtZSuEO/D8hYg/KSPuYGCbLDGsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+XVHmaBcK6ab69hf08pBtZyVR75yJARq4xQVwBTr5YM=;
 b=dkfwI1EWO38IUU5hncE5dc/kYdTM2F+JscfnKz7RTXpdCqQXmBBPZm9PGVAuxhCEb1C6U+2zeScVkS6ch0ITgH10DbCHjCHS67jwkkPyXrc9CKxphuAuaTMq8eI00XvWx+8eKFpy2/Nj119aFDSvO0uFIdcMPgEPwmnqvZAtEweLYVQMzwe6pJ5oHe6hBP7Q6Q97EOLxDghZb5JF2/IbSb2Huw8dej007pshQhJdR1P8qEgC9xbHoUuTrStABcGgTJGMO3qk0lbfSlYUr+9YA259LuyHybIdLyVsxkvbzopsaen2xWMqAlFMyaES0o+wmZFIb+UwlM18IA6+l0aqsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by LV2PR11MB5999.namprd11.prod.outlook.com (2603:10b6:408:17d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.18; Wed, 15 Nov
 2023 22:28:54 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7002.015; Wed, 15 Nov 2023
 22:28:53 +0000
Date: Wed, 15 Nov 2023 14:28:51 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
Message-ID: <20231115222851.GR1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231114130231.2299661-1-michal.winiarski@intel.com>
 <20231114130231.2299661-15-michal.winiarski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231114130231.2299661-15-michal.winiarski@intel.com>
X-ClientProxiedBy: SJ0PR05CA0034.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::9) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|LV2PR11MB5999:EE_
X-MS-Office365-Filtering-Correlation-Id: 332ddf44-b600-4109-95e6-08dbe62a3fb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mt7vdqKEMYFOBJ/6IT8OxWD4tC76Zd/eqYVkuRAFKw0nNBQVyWS1/PrVrmYrssKqqLwMaP+EtaKifJI2f4w1VJMR6K602I+2V3QuuzALkRA3qdyVZvbkY53cSntcyTViPWMsRTnft3FsD4besWl8Yeq1YV74dhg0AtxyLXA37BFGgv2I86e7+1B2+BlTe4NDSwrwpBYZ8wZ4JN/Hmd1r53fX/xi6KGNFot0kId/KGwc4UFZWyLenu7YM2eRypLD0BETyFWq40KQVqeyMFgpDAXGhXVFIBxI/rjiQEkYkD0dg3KrvmwnXaLrHumfA7eQEzLE2C7ecgV477hVnxincN7ZU326fMYpHgOcX10ce0VxkylIT1RTKX050IFjiEuzkxuSvyWGnieT1/mpFfGUWvGE8BMg5ab5aw+yCQCm0Nk5UGnM5fPhup1fYUYC5y9tKGXAs65uBRPVjW3YceJWPtiTUcFhySjQXdScyLLXUJVApJDkNU/YwsadAms9PlRUyaW4MTzBwR6YB8m18g0o4YLoND8DF4aWDukT0lPnG1kE8DoE8tGaHg/8BXFVRG6k3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(136003)(376002)(366004)(396003)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(6506007)(6862004)(8676002)(8936002)(4326008)(66476007)(6486002)(66556008)(6636002)(316002)(66946007)(86362001)(83380400001)(478600001)(82960400001)(26005)(6512007)(1076003)(54906003)(33656002)(2906002)(5660300002)(41300700001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWx4WXVieC9NKzBaQTBHa2Yzdk9XRWh4dW0ydW1NVFFFUTVESmNQb0hrUndx?=
 =?utf-8?B?dmcyUUxWcCt2bXNOa0xiTVpDZ1R6Z2kxNG80MFoydHRhTG5mVzNKVDhDZHox?=
 =?utf-8?B?NCs3eVV1cFhoSkxVZTkrSUIzSUlOdEh6MW84bTRzQWFyZUhaSS9FUFcyZE9x?=
 =?utf-8?B?WmIwR1FsaldyTDVjRnZwN1F1ZmxGeTd4dTREK3Q5K2k5SHhsb3JiY3o0L2hJ?=
 =?utf-8?B?czk2TDB5U3dRNE5MWG1YYXpETmNzUnRjajhsc1FsclRSTCtuWjdRTCtQMzl6?=
 =?utf-8?B?M1h4bGx3cXZ3ZGg5VlIzczVXeldaeTdOeW1YT2k4VDhHbUhjNlo4QnhYWFNH?=
 =?utf-8?B?Z3BLZ1FadGFxbVVjalNmeU9aTHFPODFvUE9EU2Y4QnRMTWEyS24xNWVxN0pL?=
 =?utf-8?B?cUZxMzhwenlaZjhLSkk5Q1lOOWYzQ0VGRFJKcWc1UDA1T20xQXNvZTlMcnQw?=
 =?utf-8?B?dHdLNzVVWmwxSml3eXpFcnczM2F4azEvTENUWWR6Ulg1ZFc5NkNBUjM3K1Fu?=
 =?utf-8?B?RXdCeU1yeU8vRDBJZi9iR0ZXUkxoa1g5ck5OWm1TYnE2enk2WXNLUUVGNk9P?=
 =?utf-8?B?ZUlMQmVIaGlmUmtRWGdxRGpRSUkwUTdsanRkU3ZPZTNZK2VjU05YNTBra0ZU?=
 =?utf-8?B?NmNtczg0MmZrVy9YOUtIL2hDYnY5Sy81K1JKZnpOVkNMYkVmT2dPNlBoVmhi?=
 =?utf-8?B?M0RyeThKVVpZVklrVUJaZHpDUklpUUVETnA4YUp3Y1JmK01vYzFvR1AwaGdi?=
 =?utf-8?B?M3hhYlJCZ0ZxN1ZXOUovVUU2UkVZVVhlR25aUnZ1S0hoa3p5dXBCekV6ZVNo?=
 =?utf-8?B?ZmRVWHFpaS9DZDdLQ2NKb0JrUkcvZUhaNEZSVDJDRzZvczk5NC9xbWQxVmI5?=
 =?utf-8?B?clRublg3Q1lGM2lCa05QNE02VWw3a3prd29VRlBVUHNDSHgxNGZyaGlwandl?=
 =?utf-8?B?OUJESU0zU2ZRemtFdUswbjlYNi81WnRjYjk4cmR5SEVGYTUrZjZvWFZWK2po?=
 =?utf-8?B?N2hKN21QUkFTZ09NYThpb1ZYdHlGRlBtNHlHYUpURHJhSndPbVV4UkNTQlZF?=
 =?utf-8?B?VW9ZNk9BYXFvK2VUS252cGZqMVBHVFk1U3NpVnowa2xPbldTQlVXT3VObGx1?=
 =?utf-8?B?VEt2Wm82MVRacG90dSs0aEQ1YkhqNnIyWk1FTEcrTVFWemJRVCtDaDlqM0pt?=
 =?utf-8?B?U1JZTy9PdEhIQ0RQUlZsd0hKK3p2c0YwblMxSWVEcmc0RHZ2Mm1VcUlCY0J5?=
 =?utf-8?B?bTJVU1JTWkljVkQxeHBLUkVseVFOR1RnTXh1YVVRZS85VERqVGtKUEc4TGti?=
 =?utf-8?B?M2svVUVJVzVGWHR3QVlKMmJ5K2xHY3lUdWZHcW9SbU8xK0tRQUJ3U09kNDhO?=
 =?utf-8?B?Qk4wdm9rSGdCY3JwZCtIWEY0NWs3UXZOeC9oNGpCd1NGdm40SnBkeDlhWFBK?=
 =?utf-8?B?RW9kbm5SMXZBWEE2V3hkSTBiWFg1QTJmT054R082T2xDbVNXT2NJeFZOYTF6?=
 =?utf-8?B?MTNjbmtYdWtEcFl2d1YyRWpXSTBNZjJSSGZqb0w5UnJWeTVoMVJXRCtzdFkr?=
 =?utf-8?B?cE5uQjJWN1JDSVppSDdSb3UrV01pUEZKTUZxL0xacnZ3YVo4ajBFYjRsdmE0?=
 =?utf-8?B?d3ppa1NpZ3E3NHdnbFF2VGFqZmZYbkVoTkNpbFFpRGtEUXFTTU01cUw1UmhQ?=
 =?utf-8?B?YkNXYk9taTU3R3Z1eGVMeGNJanBpOVZyN09XRFk5T0kxc1JsM2RpY3lnalE5?=
 =?utf-8?B?Z3hpcy9aVkx6RTd2d2JDWmFqTTRxdUhFSVJLOVR2Tzk2L0N0VHdMR1pmNlBh?=
 =?utf-8?B?ODRpMzlmY3JJT3Y4dnZKRUpXbjVxMzNuTUdSNXdZbGF3d1diMDEyWkFSSFlJ?=
 =?utf-8?B?N1VNdFlpdEdGbmxGSnJ2dUE3eUlPOXVnRG1FK1hnT1VOSzFHUTZkYU54a0R6?=
 =?utf-8?B?NzhTbWx2Zzl3cHZrb1gyblBFWEdDbTdmNWhKeFZZMDVNd050UC9wOEZySjVv?=
 =?utf-8?B?S2NYbjgvRjdEWXhXVzlQNERyeHkrL2gwd2JBK2tFLzhvKytVTktZWlZ5anpX?=
 =?utf-8?B?ZXBQb2Z1SG1pWHR5VHBEYTdQVjIycHlueDAyaTNjZEhGYmsreWRvUUZVQ09n?=
 =?utf-8?B?bktURlR6blVSMjdZUXQ3MDFyVVdLVzk4VnhOdWtzcHpSSFROYzhoYStsSVBT?=
 =?utf-8?B?NGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 332ddf44-b600-4109-95e6-08dbe62a3fb4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2023 22:28:53.6359 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aH70H8qQalPSwRV54jphfcPDFxZQ7OIwuSmLVVx7k72GCMJTYO9NPB21aOOxdMtEqtWSZ1ENGIu+2AnfWujfsyYfXn8QHMrIN3VAzHjqVlQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB5999
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 14/20] drm/xe/uc: Split xe_uc_fw_init
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Nov 14, 2023 at 02:02:25PM +0100, Michał Winiarski wrote:
> The function does a driver specific "request firmware" step that
> includes validating the input, followed by wrapping the firmware binary
> into a buffer object. Split it into smaller parts.
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_uc_fw.c | 82 +++++++++++++++++++++++++++--------
>  1 file changed, 63 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index 3032c4f148d48..df46751fb5959 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -524,14 +524,11 @@ static int parse_headers(struct xe_uc_fw *uc_fw, const struct firmware *fw)
>  	return 0;
>  }
>  
> -int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
> +static int uc_fw_request(struct xe_uc_fw *uc_fw, const struct firmware **firmware_p)
>  {
>  	struct xe_device *xe = uc_fw_to_xe(uc_fw);
> -	struct xe_gt *gt = uc_fw_to_gt(uc_fw);
> -	struct xe_tile *tile = gt_to_tile(gt);
>  	struct device *dev = xe->drm.dev;
>  	const struct firmware *fw = NULL;
> -	struct xe_bo *obj;
>  	int err;
>  
>  	/*
> @@ -575,10 +572,41 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
>  	if (err)
>  		goto fail;
>  
> -	obj = xe_bo_create_from_data(xe, tile, fw->data, fw->size,
> +	*firmware_p = fw;
> +
> +	return 0;
> +
> +fail:
> +	xe_uc_fw_change_status(uc_fw, err == -ENOENT ?
> +			       XE_UC_FIRMWARE_MISSING :
> +			       XE_UC_FIRMWARE_ERROR);
> +
> +	drm_notice(&xe->drm, "%s firmware %s: fetch failed with error %d\n",
> +		   xe_uc_fw_type_repr(uc_fw->type), uc_fw->path, err);
> +	drm_info(&xe->drm, "%s firmware(s) can be downloaded from %s\n",
> +		 xe_uc_fw_type_repr(uc_fw->type), XE_UC_FIRMWARE_URL);
> +
> +	release_firmware(fw);		/* OK even if fw is NULL */
> +
> +	return err;
> +}
> +
> +static void uc_fw_release(const struct firmware *fw)
> +{
> +	release_firmware(fw);
> +}
> +
> +static int uc_fw_copy(struct xe_uc_fw *uc_fw, const void *data, size_t size, u32 flags)
> +{
> +	struct xe_device *xe = uc_fw_to_xe(uc_fw);
> +	struct xe_gt *gt = uc_fw_to_gt(uc_fw);
> +	struct xe_tile *tile = gt_to_tile(gt);
> +	struct xe_bo *obj;
> +	int err;
> +
> +	obj = xe_bo_create_from_data(xe, tile, data, size,
>  				     ttm_bo_type_kernel,
> -				     XE_BO_CREATE_VRAM_IF_DGFX(tile) |
> -				     XE_BO_CREATE_GGTT_BIT);
> +				     flags);
>  	if (IS_ERR(obj)) {
>  		drm_notice(&xe->drm, "%s firmware %s: failed to create / populate bo",
>  			   xe_uc_fw_type_repr(uc_fw->type), uc_fw->path);
> @@ -587,28 +615,44 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
>  	}
>  
>  	uc_fw->bo = obj;
> -	uc_fw->size = fw->size;
> -	xe_uc_fw_change_status(uc_fw, XE_UC_FIRMWARE_AVAILABLE);
> +	uc_fw->size = size;
>  
> -	release_firmware(fw);
> +	xe_uc_fw_change_status(uc_fw, XE_UC_FIRMWARE_AVAILABLE);
>  
>  	err = drmm_add_action_or_reset(&xe->drm, uc_fw_fini, uc_fw);
>  	if (err)
> -		return err;
> +		goto fail;
>  
>  	return 0;
>  
>  fail:
> -	xe_uc_fw_change_status(uc_fw, err == -ENOENT ?
> -			       XE_UC_FIRMWARE_MISSING :
> -			       XE_UC_FIRMWARE_ERROR);
> -
> -	drm_notice(&xe->drm, "%s firmware %s: fetch failed with error %d\n",
> +	xe_uc_fw_change_status(uc_fw, XE_UC_FIRMWARE_ERROR);
> +	drm_notice(&xe->drm, "%s firmware %s: copy failed with error %d\n",
>  		   xe_uc_fw_type_repr(uc_fw->type), uc_fw->path, err);
> -	drm_info(&xe->drm, "%s firmware(s) can be downloaded from %s\n",
> -		 xe_uc_fw_type_repr(uc_fw->type), XE_UC_FIRMWARE_URL);
>  
> -	release_firmware(fw);		/* OK even if fw is NULL */
> +	return err;
> +}
> +
> +int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
> +{
> +	const struct firmware *fw = NULL;
> +	struct xe_gt *gt = uc_fw_to_gt(uc_fw);
> +	struct xe_tile *tile = gt_to_tile(gt);
> +	int err;
> +
> +	err = uc_fw_request(uc_fw, &fw);
> +	if (err)
> +		return err;
> +
> +	/* no error and no firmware means nothing to copy */
> +	if (!fw)
> +		return 0;
> +
> +	err = uc_fw_copy(uc_fw, fw->data, fw->size,
> +			 XE_BO_CREATE_VRAM_IF_DGFX(tile) | XE_BO_CREATE_GGTT_BIT);
> +
> +	uc_fw_release(fw);
> +
>  	return err;
>  }
>  
> -- 
> 2.42.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
