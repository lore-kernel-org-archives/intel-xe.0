Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7C1FCD98E1
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jun 2026 21:16:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A35C810E83E;
	Tue, 16 Jun 2026 21:16:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MdG5W5Ok";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EC3210E83E
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jun 2026 21:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781644580; x=1813180580;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wwxeT/PUsCyS0d+7onRBEChKuFKUnFywP8J0Gz5+5cM=;
 b=MdG5W5OkCZIeEzqa0mXnFbcbF5Z6mWro4uRDqAi8Wxk1FfRqfPG9Vgs+
 6e2Tr698XJOm+CaYdmvtPzDsXEqb6Jxm5RdCfZmkl75pFCho8Uz/IZdD/
 LTVPafOv/ZKfrc2gJOFHQMxM1vALqByuWpydmhm9XxWC04L23KEa0BhSc
 jv5kn3SVm1Bq2jkR/sTCJ4TKzvsyJlFxf/+gbI3Ir9flVFdgfy3zf1Qqh
 5c85C9QyOkSkZ8a+ZivUKUgUKXzKY3aqo8tXN//YLUMmSyOjKAC+w4a7s
 +7BZfOqLJFtcDnOLy+Za49EzseeYtEhEBFM8lhlSubNF0w6yoxp6QLAq0 w==;
X-CSE-ConnectionGUID: 1zagc4dSSm6Il+euIoQuVg==
X-CSE-MsgGUID: vxgMMQB3TbeJtCKvtwHwsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="86070936"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="86070936"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 14:16:20 -0700
X-CSE-ConnectionGUID: i/VKTbRvSuqZHWmi5Q0GAg==
X-CSE-MsgGUID: o5UIc650QdK+peBmzkv6Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="247759717"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 14:16:21 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 14:16:19 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 16 Jun 2026 14:16:19 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.45) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 14:16:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YePyWVgnaDF3zbkGbsC2JIIeerbiIcq6rC+92WbkPUA2B9TEvNWLKI38zQVObsYPdT9xVoKzdiYyEUqAHQHlBrayC/XjHpr3no2PS5MI5n8GGxfH7Nwj+ec6qeoyCqt5BCa++oJhGGJN2AWE/388G5/h44mDthT2Xd1Mbfn6B0iVrCbYibMUbbopyNiuQGXD8pX7ZwBG3tWkZ7SdOApIXAtfHE8HP5upbSj5XoS1cJKhUsHG6gEqTyUMzDnSCfFSyj+vVC6R15QbFlBrW/s1/xfKK4/LYoBbSEn7o/t+MhhN1U6zpIbp6OarG+h6mmvCrQHeSTeDh0ER7aqmJDKj5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O/NjiQ9lrBGTf+k1Uh/5jFGEUriHGi8R/qv3rjTSfho=;
 b=sKavbSL19Ap/JNdZTYBM5U+nRCsDgCjOfBAFd4sH3ntFP4L0xHH3IVAGEM3hfYHoAKg+QrLyJHbnpfIODy6WCYuLI7jF1ocB/7stwSEMeDUMA0yOuTxxmwrOlQl0QczZbfv7Jjkl++2GVdJmHgv94Hj4wBe6NF/baK7gRt7Pi31Df73ald9zIAOjD/GJlu1qom05+bYAM8ZtoHE4blDeBBOaiz1X5RnN664a1O81HZo3VAHJMnZw26Yoj72rzvshD2vHJWsh81uaAb9DB/fbh3l4TRnJvDpVmovkScpFpoMdHMsibiKaXe3zB7bEBOVBwYwQbo+q1sfBrOCzvPbjsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8284.namprd11.prod.outlook.com (2603:10b6:806:268::21)
 by SA3PR11MB7486.namprd11.prod.outlook.com (2603:10b6:806:314::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 21:16:13 +0000
Received: from SN7PR11MB8284.namprd11.prod.outlook.com
 ([fe80::65e5:898b:2231:bf65]) by SN7PR11MB8284.namprd11.prod.outlook.com
 ([fe80::65e5:898b:2231:bf65%4]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 21:16:13 +0000
Date: Tue, 16 Jun 2026 14:16:00 -0700
From: Violet Monti <violet.monti@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 9/9] drm/xe: Add tile_count to xe_probed_info
Message-ID: <ajG9ELT14WidcN4M@vmonti-desk>
References: <20260609-xe-probe-info-v1-0-21e83e188e60@intel.com>
 <20260609-xe-probe-info-v1-9-21e83e188e60@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260609-xe-probe-info-v1-9-21e83e188e60@intel.com>
X-ClientProxiedBy: SJ0PR13CA0189.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::14) To SN7PR11MB8284.namprd11.prod.outlook.com
 (2603:10b6:806:268::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8284:EE_|SA3PR11MB7486:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d10aafe-8c57-49a8-3030-08decbec7ede
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|3023799007|22082099003|18002099003|56012099006|11063799006|6133799003|4143699003;
X-Microsoft-Antispam-Message-Info: ibt7AfV983BaibCQIf+mX5Y7mORKrqICL9llQTedBfhCq78uPA/4Vz4Qlyrk/elIN8ePMaSzqaFv0wfVRwYWgDbyooDTazbDa1/t9OgNbyd7ZYKoHA7sirrHpSoglg5/WDY+GNyEMUnMeBqY0opf7u4WVSwJAAjm3MiOF7SQKEIPJB09SSXl5+CssEDl5OIygyF2GFTtbDZ0sgfClgdJFBGlubyHAWCVg0CqY6pLbjFH7p8JnP9hXThh25HNGYSI5jr7VPkeFu1YUDj1UNOyXTkqGQHRKGf2bYoFp6p1aInOhitnsnpSWTqKuZGV7/PHzCbgH3oOXjWvhbs45iPPpoGCzUk4OlMwanZe5yMwUgkBrjl3IL9ja0hHvR0SvNPygLsN5Mp7HnXqNbzxQRpX+BGWk8i2atliF9foPSQCa9b+GVltZqFsvZ+6FSDLr11OFfwQU4z4kPqNbV3BnQTerkW1OiTHTMrtVuTHsUX2HQHLcXHbMrCgkGWop8FYja5vfgC23s2LQcujSNQ57tfeRCQgsk9Jy/9Ri62CoDNBQC99ojMmEIrDDUAygp9ZCJo4c4LvX2FJ6wiekGOtGKCUhvxHkoaoNrUHxw0/aprloHKvibG5FicxA/gOXlrXc7WchUM57XuLfhDxD3moGO30/f4a1Ef388wdooI6Ps7oyjwGDpibByuLmR3tOSB/HyJX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8284.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(3023799007)(22082099003)(18002099003)(56012099006)(11063799006)(6133799003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/jT1UHzScSdjjS3Je0ZnMCkCTFFsrWaSbh7izqT+hgSAqgQBhhVcKLqb9GDr?=
 =?us-ascii?Q?mVHq+8nskP5NjYashggYqwyweJZhKr9kGWeoDmCutSMgWMnQXUJkvjc8/gdc?=
 =?us-ascii?Q?abVwwygPBqZapFJMRAeOuuFc8m5kK1APuZHQWTNSPOutYfS8TOKUu77+lALG?=
 =?us-ascii?Q?T+C3byE7KUZMJrIKqeucxui2qy+C3gyKK78rzNqGbDdNhmbs0en4aukDbuT2?=
 =?us-ascii?Q?FWN7nytbk21d2wnHpHCqlR1byz43VwY4Ml3oXrtB6tEQRnsLJItak+DgysOB?=
 =?us-ascii?Q?6dN9xsWIrI/c1eNd0YUtpCP6Dr2sGWUxJekRNLHzOBgr1BFEjaEuUzq5f1OP?=
 =?us-ascii?Q?t8M7D6ahQUiwzJbaJFEaKEPvRO+mggKl6kSytP2we5J7jyikLT/1/XJmwhDy?=
 =?us-ascii?Q?L5Q4lMYMzWRV+38H6uDSwyJySGSnw2mcGEm+Z6IOwAt9v9JfbCeqefGpD689?=
 =?us-ascii?Q?yMiNcy9VPzN4mQxkqymnAuF3rwh8OPw1WeP0iZpf3tiSerOxwxknnUmCPwvT?=
 =?us-ascii?Q?xLGTNSMfpkfdvboZYoiu4SN9Xtb0TZRry9ipN8LEllM86PSokzD48ZcRvd7Z?=
 =?us-ascii?Q?Rd4nTz4cI4UgsNcR9lsWZZrj/GXiUxJCDqsocxLzeTOJso8nEA9GyDRkvA5j?=
 =?us-ascii?Q?K6icYyOz975siMRAn+qrMhweNFQ0ACm9QIuVh9pqkRqumTq+finzMlhefkOD?=
 =?us-ascii?Q?gebhRHaHPBCuACXH1c+f/z+oHOj/ml3DN6Gt6AbNjeW0bfj4bald6c0V1YB1?=
 =?us-ascii?Q?J5vXylKxbnrKBsDa+dpfDau9V3xQbzhbhA8jOZ5rW/UDfCoJDy/Jzaywk1Py?=
 =?us-ascii?Q?h6FAGN0/8Ps5xGR59NI6UgBJvdWzuJrrXiSDKoUTAQsor0pFkdlI3jXLLf+f?=
 =?us-ascii?Q?mAqyT85RaHYHyk4fcemocCcqsSboAzF1Hz2FLtYSOz0F6eNpOlLV0t8dLG3O?=
 =?us-ascii?Q?sxHL/vSZ3UXgUED2jtgovJsQd7bngZrjz1iodCFnTIxtMNXhneIK/0NkgJ6e?=
 =?us-ascii?Q?ln+VCl4KtuiYEvMIdVB4h/fC69Sscf4+1e5RpJV/xtuJwpi4bvYISl+Y2eYl?=
 =?us-ascii?Q?uvT8Mlx4On+CK8dOR8ZDnjVkzNNEzXyRf30whvEUx6orjY4eKCi2naUm/5KZ?=
 =?us-ascii?Q?OqC/BDwJJNDxx2h24bvBPiqNsDEldKDGZj94vcsFDZueHgiCkJZcZZSQfbdu?=
 =?us-ascii?Q?k5TlN8pU+cVC9/KHLtjqzjIZ8fQkIPNtHzkQDaOAvjf+h/RraLdJcVmhRios?=
 =?us-ascii?Q?9ZmQBLpIqttfFNBvCHqnxJKEx2bX+FKv2lL5ELy50HKhw8R6oItM68bbVzmo?=
 =?us-ascii?Q?7vwcH9oORpmI21wx68kGlViTjHl3DtpXLGl/XngXSztAc42xNXlvAvuHlEEA?=
 =?us-ascii?Q?/Pnym7iJsDCYYL76pv6wVQFM/6ZFi5T3T6NMwRaYfymWvwGCiFYbNPJLzpWw?=
 =?us-ascii?Q?IERr3nmIjfTQUDSH22GHnzZg+xPw2UlngZZU+8kOi/ffxpzk2p59KXjUQ7Kq?=
 =?us-ascii?Q?z7ZBdRbPUePUHLhT4MVE/jkusehKke1OzqE4crJXVddDvcMUxpntcs5Oyv0s?=
 =?us-ascii?Q?9m1Fww5uNyuoZZzbh+ttVT8JF5SFCJQJlLhF5etSEmgx4MDjcfQxFj+1ztG4?=
 =?us-ascii?Q?Mu4kxgWBsglLMl8rMNUGeorPC1YaJSTR0GKGhgk9UHS26qkYdKLfI/st+4JY?=
 =?us-ascii?Q?rZe1XyIBvv1/ef0bSCW8x0C5hsWHY5fydu9p7BWI/2vIElumwbqFGkeeh3t6?=
 =?us-ascii?Q?t/ihbk7yag=3D=3D?=
X-Exchange-RoutingPolicyChecked: JINPEsdKlJptLrVVzWQvtMo0rd4EJ9j3iPa0Sw7qDhDrVRKo42V+pUD5HA+oxO7QvRfWn5HhgGkw2S0bpm/DZW1qD2ID+HyKKEQvz4kV6UYBkrd1e4/Y9PFITeMPR8/R4Xo1f7VC+cMO7qH3M6d57Ru9AjhxO9J6e1qdePpt7co6lBuOcT3rQc6itW3nGLp6QJSvFXWEGhzFi0P2XpF26sYF5AMhoa02QUO5gnT5QUfhn5UkZbUroXKDreMhY6ZH14Qjs/bjg0wFrAPfayQUxqW9F1V2XHk/VrTQAFPpyCl5zLG3QOIDlFYCDatC9rZ1jw3LOErI49KYbultddHGRg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d10aafe-8c57-49a8-3030-08decbec7ede
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8284.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 21:16:13.6272 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M1izBFL19LUfoST0Z0cPeIXQX/XD6aK4SnHdT7F2fxQslWc/ya8R6aZSdaW8hW42LRuZbusgWLBMRBocj8V0BA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7486
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

On Tue, Jun 09, 2026 at 05:17:41PM -0300, Gustavo Sousa wrote:
> On multi-tile platforms, we need to probe the hardware for the number
> of tiles that are present in the platform.  That means that we should
> do that as part of xe_probe_info() instead of xe_info_init().  Do
> that.
> 
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>

Reviewed-by: Violet Monti <violet.monti@intel.com>

> ---
>  drivers/gpu/drm/xe/tests/xe_pci.c | 11 ++---------
>  drivers/gpu/drm/xe/xe_pci.c       | 27 +++++++++++++--------------
>  2 files changed, 15 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
> index 31ec41aa997d..8df9029afcd3 100644
> --- a/drivers/gpu/drm/xe/tests/xe_pci.c
> +++ b/drivers/gpu/drm/xe/tests/xe_pci.c
> @@ -311,17 +311,13 @@ const void *xe_pci_id_gen_param(struct kunit *test, const void *prev, char *desc
>  }
>  EXPORT_SYMBOL_IF_KUNIT(xe_pci_id_gen_param);
>  
> -static void fake_xe_info_probe_tile_count(struct xe_device *xe,
> -					  const struct xe_device_desc *desc)
> -{
> -	xe->info.tile_count = 1 + desc->max_remote_tiles;
> -}
> -
>  static int fake_probe_info(struct xe_device *xe,
>  			   const struct xe_device_desc *desc,
>  			   struct xe_pci_fake_data *data,
>  			   struct xe_probed_info *probed_info)
>  {
> +	probed_info->tile_count = 1 + desc->max_remote_tiles;
> +
>  	if (!data || desc->pre_gmdid_graphics_ip) {
>  		probed_info->graphics_ip = desc->pre_gmdid_graphics_ip;
>  		probed_info->media_ip = desc->pre_gmdid_media_ip;
> @@ -382,9 +378,6 @@ int xe_pci_fake_device_init(struct xe_device *xe)
>  	xe->sriov.__mode = data && data->sriov_mode ?
>  			   data->sriov_mode : XE_SRIOV_MODE_NONE;
>  
> -	kunit_activate_static_stub(test, xe_info_probe_tile_count,
> -				   fake_xe_info_probe_tile_count);
> -
>  	err = fake_probe_info(xe, desc, data, &probed_info);
>  	if (err)
>  		return err;
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 6b2daad87316..1b5df4384689 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -728,6 +728,7 @@ static int handle_gmdid(struct xe_device *xe,
>  struct xe_probed_info {
>  	u16 devid;
>  	u8 revid;
> +	u8 tile_count;
>  	struct xe_step_info step;
>  	const struct xe_ip *graphics_ip;
>  	const struct xe_ip *media_ip;
> @@ -819,25 +820,21 @@ static int xe_info_init_early(struct xe_device *xe,
>  	return 0;
>  }
>  
> -/*
> - * Possibly override number of tile based on configuration register.
> - */
> -static void xe_info_probe_tile_count(struct xe_device *xe,
> -				     const struct xe_device_desc *desc)
> +static void xe_probe_tile_count(struct xe_device *xe,
> +				const struct xe_device_desc *desc,
> +				struct xe_probed_info *probed_info)
>  {
>  	struct xe_mmio *mmio;
>  	u8 tile_count;
>  	u32 mtcfg;
>  
> -	KUNIT_STATIC_STUB_REDIRECT(xe_info_probe_tile_count, xe, desc);
> -
> -	xe->info.tile_count = 1 + desc->max_remote_tiles;
> +	probed_info->tile_count = 1 + desc->max_remote_tiles;
>  
>  	/*
>  	 * Probe for tile count only for platforms that support multiple
>  	 * tiles.
>  	 */
> -	if (xe->info.tile_count == 1)
> +	if (probed_info->tile_count == 1)
>  		return;
>  
>  	mmio = xe_root_tile_mmio(xe);
> @@ -850,10 +847,10 @@ static void xe_info_probe_tile_count(struct xe_device *xe,
>  	mtcfg = xe_mmio_read32(mmio, XEHP_MTCFG_ADDR);
>  	tile_count = REG_FIELD_GET(TILE_COUNT, mtcfg) + 1;
>  
> -	if (tile_count < xe->info.tile_count) {
> +	if (tile_count < probed_info->tile_count) {
>  		drm_info(&xe->drm, "tile_count: %d, reduced_tile_count %d\n",
> -			 xe->info.tile_count, tile_count);
> -		xe->info.tile_count = tile_count;
> +			 probed_info->tile_count, tile_count);
> +		probed_info->tile_count = tile_count;
>  	}
>  }
>  
> @@ -975,6 +972,8 @@ static int xe_probe_info(struct xe_device *xe,
>  {
>  	int err;
>  
> +	xe_probe_tile_count(xe, desc, probed_info);
> +
>  	err = xe_probe_ips(xe, desc, probed_info);
>  	if (err)
>  		return err;
> @@ -1002,6 +1001,8 @@ static int xe_info_init(struct xe_device *xe,
>  
>  	graphics_ip = probed_info->graphics_ip;
>  	media_ip = probed_info->media_ip;
> +
> +	xe->info.tile_count = probed_info->tile_count;
>  	xe->info.step.basedie = probed_info->step.basedie;
>  	xe->info.step.graphics = probed_info->step.graphics;
>  	xe->info.step.media = probed_info->step.media;
> @@ -1037,8 +1038,6 @@ static int xe_info_init(struct xe_device *xe,
>  		xe->info.has_soc_remapper_telem = 0;
>  	}
>  
> -	xe_info_probe_tile_count(xe, desc);
> -
>  	for_each_remote_tile(tile, xe, id) {
>  		int err;
>  
> 
> -- 
> 2.53.0
> 

-- 
--
Violet Monti
