Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06E48C4332F
	for <intel-xe@archiver.kernel.org>; Mon, 13 Nov 2023 13:54:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C75C410E37A;
	Mon, 13 Nov 2023 13:54:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C427E10E37B
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Nov 2023 13:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699883655; x=1731419655;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Lis4E/Vk93rL6Uer0ih4E57xQMaLy2/R+Ywh8qvmlG8=;
 b=N0c+unmr0N4iklpMoulWF162VM6Mn1CsEzWWrJJ3g/G5ruzBLBFp7YYH
 V5D9LPHmLjlEvkjifm0CoERo5eQnUywqjtbAYMhfsrfZJQNL//e/zXrLW
 0mnv5AsvA3G6VotuyGKwyV78wdCErcKxecxL+unnJ8PQAkKWji1j6vl/m
 BOArUy1A714z45Jczo0AFu1LHo+ddKU2Mlj3CSLPLqX52cha7JJs5HuJI
 dbrRkryWYbdbYcIWOYa+Uwnw13nX0FKrNBhm8tFF1/8MChZZwOQEbrgPA
 m+nmJ4NVCzluHLhBqVJo1HPoHPN67A5RTKoEeeu3rKgh5Q8rWZ7j3kTLh Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="369773824"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; d="scan'208";a="369773824"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2023 05:54:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="5654301"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Nov 2023 05:54:15 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 13 Nov 2023 05:54:15 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 13 Nov 2023 05:54:15 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 13 Nov 2023 05:54:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KXugVi2TW7FtQAhMyQIbYwtS4Rsp3EpoS1wtSy1qD5jo3ICbB0queTGKhvsXT4rZvgGS7a3wlU9HpeVzb1iyyao7Z2z837TXl67LyZKEJXt26BSpUgLbZk6IYE+PgEU0ORaz7g2U5YF7Suy+53QaG1IPEXfD7xMBJRvtEk6OfGkqom+4YcYhTxfbXBrzYaDSGdRgreh9rJzWmP+YQjohoGQob+CFmnJf04Qqe7OUjaIyPOGzArDprumOuA/sp2cVmzzOtfoPyVAor3sJ9NekP55f7T0McfRKgZgZdmfIcxsGzJwp2H1A68t+BUgxgRouFZUxXx5SclY4bWjwvK6Xow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IYNLGX97+Hf8k1SDd16bjASqeJ7CUSK8C7T3czhMU/g=;
 b=XeuyPQECpvvhpjhsperTYRc/ADStq90sGqQVH9SOA+Cd3pc2JsXgmMrG2HC0sWtohpSs9etXaWak76WNdixuR5FhtFgsStVxzFaxCLWvHySaGcdvHM7g980oNff8u2a0rP+R+VZDjuRobpU4mM7A/eL4Ba1sjp7PK3ZQOe+3Uhkd4GGA2bpWMPGpeEfQNyV5EEsDTSn3IplAo9GjwUCUqu3GPOmYj8mXrztQGGkCc010NARuWMnejJRScbxs37/3rKO2csyBSqT/UQcx656mcDWyUN+m4oKwHZQuMlROLq5ykZ/MBZpiSjyM/T+XCw7LnEddy4rDVS6otMg3bo1SNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB4885.namprd11.prod.outlook.com (2603:10b6:510:35::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Mon, 13 Nov
 2023 13:54:13 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.6977.028; Mon, 13 Nov 2023
 13:54:13 +0000
Date: Mon, 13 Nov 2023 08:54:09 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Koby Elbaz <kelbaz@habana.ai>
Message-ID: <ZVIqgV/YIosWwQFg@intel.com>
References: <20231022155727.717251-1-kelbaz@habana.ai>
 <20231022155727.717251-2-kelbaz@habana.ai>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231022155727.717251-2-kelbaz@habana.ai>
X-ClientProxiedBy: SJ0PR13CA0017.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::22) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB4885:EE_
X-MS-Office365-Filtering-Correlation-Id: c1ecbc75-b2a6-4af0-672a-08dbe4500487
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xnOoM2YiIdguudYtOr21+fYMBGjmNDO6dXqoeGGOVSliWZrUBs9KpulCfHm6g9jxpSRB3n5GUGgff7k+0bOm8FuLw+8akvqpZNopCGR1Jz7DULR/J37UPYpute7xZo8wojgl53RhzmSbUNtORxzH7XdfZ7XwdG6yWGJ3iQBBSj1+IMpPVD8goMmU3uBOvAAb028GiILNnCW61Qpz+i8rywlEz0uzxPjtk4gddFBQ2tKghE+TT8ai1Pt090CtQBGGMV2eHDvmK790ILeEt7t2MKNsnF3uteszl/al0MpsadEfsceDJVzRU2FPWjf/WXWjD9JFjs9h57yr+iJuQhV3zjKH/XEHEue8lZn9jJme6VjLi19dNRsUD500u5l3IYjHxpWHIzYBu+2Khg12SyLDsvLfVewfHvfCWoRKQ/Av2PYISjS5saDiVpY44KitAAtO7vI+HYtLqsyLC6Ov8Tx1AefqfgI5An9/aRfy3PhrGm7A0T0fMwcyOP/pzxTBRBxfCdx3QKkFNyUpzHZi/2PlfEBiO62kQAUq2NJyG1X7gSYb6DAMqBGWS0yZrklXBu/s
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(39860400002)(346002)(366004)(136003)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(2616005)(86362001)(2906002)(5660300002)(41300700001)(36756003)(82960400001)(44832011)(4326008)(8676002)(8936002)(26005)(6486002)(6512007)(6916009)(316002)(83380400001)(6506007)(6666004)(66946007)(66556008)(478600001)(66476007)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gkhF+h1euRiEK0w9383urqLnKN7Xnz7hIdtAqgzNCY1vGNoWzqmoO1Pd1M9C?=
 =?us-ascii?Q?p7/niaOd9PSIDv0I+wYjkSWYw6qjjk5SXi1x6/A1tFvEytbMqwAx6Dx7A8BT?=
 =?us-ascii?Q?ZYBXUF1vPCdIsbYjxehs0jReksE1MdIK28lAQS0m6d0OdEUzxwZyHytmdMYd?=
 =?us-ascii?Q?z48MmJNb+H4lIlL8rZ4iZCq3+NdFJY0Cen1tXYvzACVJmQmBPE/QQWNwh22A?=
 =?us-ascii?Q?cETYSqQNf0Kp87qi19uNbr89DKpO43tb4lrzvWXyGk2fn72ORN77l+XPKXQv?=
 =?us-ascii?Q?0t10fF1Z7Cj/6tqmtJfsKYNwUDWTZue4nHU0YlIY28z/aXWO/5nLSwa4cor4?=
 =?us-ascii?Q?g61AHF3azPA8tPd+OZHde4YZbJx5vf0k0ovWhdJBdz0/naFr0wtmAV9lH0pK?=
 =?us-ascii?Q?wMbG9MZKIGUU9bdJYLLt7WGqu9WMFYEyUlWOdFFuRb3uzUSB/veI8OKg4GqX?=
 =?us-ascii?Q?o9Coy3m4Yo2+tCRo7OwADS2qNCF+NbDtd/Dycc0tUYQo8SEppZ4OVRMDnfv5?=
 =?us-ascii?Q?7KZ7tf7XsFzrUFXCTihqnDyLsEIjHC0XuF4f7GFqrnBVxjYuxE+Oh9fFJxM8?=
 =?us-ascii?Q?wMQRSXZ3wEyWEbSP5gOFCOqOCBPw6mxxe/c2XdEjg2eKM/p0gsIt/SILvijX?=
 =?us-ascii?Q?4tT0FvY6ZHSDZ2OiqQcroLwgiNMb2ihy5n797jMQnmbIx42Fe8oMUfffKC/l?=
 =?us-ascii?Q?HaOPIhf3czztZC1wWIZ/7eMW+xiBlslGbNHHju3cxIL0uadM8albqmlxpLZq?=
 =?us-ascii?Q?pUqKQgvGF3WbzkIFc3EhAwU7EqkUjw+E4JKO+ejCLMVsMWAI1UkIEUkx9DBo?=
 =?us-ascii?Q?4v2eYl5D7G3kxVhXtcypLafce1D+C24QjiHyxgvSHh2qlpo8gfv9PnzQPQMT?=
 =?us-ascii?Q?EcYhIuh1IJ0W7wf/ZEPV3OQuCHMiNrtiu/GP5A7w/UX7Z8wytDCr4YoSEe9H?=
 =?us-ascii?Q?Km7sf9ARYx2Cfm2Wgqxk8zLSus1+8rJdK1upLVSvsxqPEvJRFZfIYwSO/EZn?=
 =?us-ascii?Q?MlYEn2s3ityMlME9fGb01IfDOG6lgP2JFkW4R+ldpf90u1+4VSDxoQN9t5Z8?=
 =?us-ascii?Q?GGjP+hfsTZwzLgL1IBlNJpZYZJRjPMoKYXNz9H47wKibDMDbcAcuKiTnH+Iu?=
 =?us-ascii?Q?rWi8bIIpJuhobNea5x7FWjcH96OfQ4lXPIpWxhlkgBL44hFeZa8bjQwxpf1v?=
 =?us-ascii?Q?qTJB7VLvxYf39y/gPzM978EsXgvoCtkQ4qEiVrOkBxdvi2yEgSO7q9fOaQno?=
 =?us-ascii?Q?xALyI3HRQpesjDX5uQj6Byx+q2ZkoXMTxsIYaAvO0R6xcdCLUYvkdE39IpSE?=
 =?us-ascii?Q?QIvtG3H35fIUXAN1kY8f2WafUbmhV+E29eAHURN5dyNykuAMq0tr2vUVgN7f?=
 =?us-ascii?Q?l+pY3S6j9MXM4r121fFstlglF0OEI2q9KSGjUtdZbB9Qt5WUMtlbydKWXczN?=
 =?us-ascii?Q?95+UTYg8LJI+Es9qDLMhIgJt8pyBZmMGbYFXYLV+qq+Nh+Z2n03miXB8B5tI?=
 =?us-ascii?Q?iTtL4zVDSpDJMoNVLvVbwbysoA9yMxFlX9kZ1duo4SQM7QAJeEwZ5ShaojTl?=
 =?us-ascii?Q?onbtZswOs0ao4zgAeqsCNLW3zzqxtYF4s2r9dVqS?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c1ecbc75-b2a6-4af0-672a-08dbe4500487
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 13:54:12.9506 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v31eS4gEb6ItIl/OtmoQL9uV0McBpdJHRhnVhrsCPc965ohpgHSOopF+f8fBOBIXxCIAYzdw4Zxwu3vBp4Zetw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4885
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 2/2] drm/xe: rename bypass_mtcfg to
 skip_mtcfg
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

On Sun, Oct 22, 2023 at 06:57:27PM +0300, Koby Elbaz wrote:
> Per device, set this flag to access the MTCFG register or to skip it.
> This is done to standardise Xe driver naming if an access to any HW
> should be avoided.
> 
> Signed-off-by: Koby Elbaz <kelbaz@habana.ai>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
> Changes in v2:
> - Updated the flag 'bypass_mtcfg' to 'skip_mtcfg'
> 
>  drivers/gpu/drm/xe/xe_device_types.h | 4 ++--
>  drivers/gpu/drm/xe/xe_mmio.c         | 2 +-
>  drivers/gpu/drm/xe/xe_pci.c          | 4 ++--
>  3 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 29199671d9e8..834e4cffb27c 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -255,8 +255,8 @@ struct xe_device {
>  		u8 has_range_tlb_invalidation:1;
>  		/** @enable_display: display enabled */
>  		u8 enable_display:1;
> -		/** @bypass_mtcfg: Bypass Multi-Tile configuration from MTCFG register */
> -		u8 bypass_mtcfg:1;
> +		/** @skip_mtcfg: skip Multi-Tile configuration from MTCFG register */
> +		u8 skip_mtcfg:1;
>  		/** @skip_pcode: skip access to PCODE uC */
>  		u8 skip_pcode:1;
>  		/** @supports_mmio_ext: supports MMIO extension/s */
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index 0da4f75c07bf..d556a213a8a9 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -329,7 +329,7 @@ static void xe_mmio_probe_tiles(struct xe_device *xe)
>  	if (tile_count == 1)
>  		goto add_mmio_ext;
>  
> -	if (!xe->info.bypass_mtcfg) {
> +	if (!xe->info.skip_mtcfg) {
>  		mtcfg = xe_mmio_read64_2x32(gt, XEHP_MTCFG_ADDR);
>  		tile_count = REG_FIELD_GET(TILE_COUNT, mtcfg) + 1;
>  		if (tile_count < xe->info.tile_count) {
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 05b0aa9f2ab7..7d352b501d5c 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -60,7 +60,7 @@ struct xe_device_desc {
>  	u8 has_heci_gscfi:1;
>  
>  	u8 has_llc:1;
> -	u8 bypass_mtcfg:1;
> +	u8 skip_mtcfg:1;
>  	u8 skip_pcode:1;
>  	u8 supports_mmio_ext:1;
>  };
> @@ -578,7 +578,7 @@ static int xe_info_init(struct xe_device *xe,
>  	xe->info.graphics_name = graphics_desc->name;
>  	xe->info.media_name = media_desc ? media_desc->name : "none";
>  	xe->info.has_llc = desc->has_llc;
> -	xe->info.bypass_mtcfg = desc->bypass_mtcfg;
> +	xe->info.skip_mtcfg = desc->skip_mtcfg;
>  	xe->info.skip_pcode = desc->skip_pcode;
>  	xe->info.supports_mmio_ext = desc->supports_mmio_ext;
>  	xe->info.tile_mmio_ext_size = graphics_desc->tile_mmio_ext_size;
> -- 
> 2.34.1
> 
