Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3536CF513E4
	for <intel-xe@archiver.kernel.org>; Thu,  5 Mar 2026 22:07:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E805510E2E2;
	Thu,  5 Mar 2026 22:07:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a2M18wuo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4ADE10E2E2
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Mar 2026 22:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772748457; x=1804284457;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5HjNEhZ9TCqYOqKZ0OR3Boo4uSRDlNJ0ML47nVvkTKo=;
 b=a2M18wuo+Z4Jgq2NtU91yp6Apv9rBzqF1/i7PFYL1ZkxA1TX6g94HaEq
 +puJqMvEApXlPSRWPRT9lOYuu2z4cJj4ivQrCk/3gzVLAT4W8GbBjxL8B
 XQs7ve6gsHJpP47LI64SC4ZcsUQ/zdophk8icbliW9Cf69RmZK3mpm4Gx
 QGbOyEffG10JvvVjmlhbO6DfSVkP6tnJ9hS9XXMv6x39/GyjUR62LFROH
 kQU9TpX6LaA9mCmbTJwFohNi1F0CxLGnTQoyotF35IhZdB8n3KdlD3Kui
 Y3fqo7jFe9T+hEwYVGi6SZn3BOFkcUh5em2NZUqBQWSMfHwb18dmuhpfj w==;
X-CSE-ConnectionGUID: cOdEtCD0QC2lJKzKvM0uOw==
X-CSE-MsgGUID: gyn4XGQOTBeMpp0jrzMb4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73551164"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="73551164"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 14:07:37 -0800
X-CSE-ConnectionGUID: E5iRZHzgTV6uEFob+Z/b5w==
X-CSE-MsgGUID: blo1XownTJKrFeOJhAIo7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="256718288"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 14:07:36 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 14:07:35 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 5 Mar 2026 14:07:35 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.58) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 14:07:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nf4/xn8QXyv97B+gvqmWH+qR24r8eGZ4jvuz3c3zfCJGZEmBCi5EgnvUylc3VMHmSiMxXYeqcdlVT5kRCgyaho5dc2bh5e8u2VdqRieZNH3bXzqkXnGEgifX1SsUPdNyvu05nwKzzXZ//+xI2k31DF4hfx6u2RI4at0CTTnkvbyhpGf6+19rE5wCQbQ9ZOAZFVD6Eu0Jl1Mix4xVsaPM46o47Yuvp87VVHTCshXG4aVaTjy4MFXlnUmWtZz+UrWtPD+iJvMXnGuon9YmR8NstoWayiTfLBX9RxsH9zulsP2EvC5a2IoAc7Y2QXlIxa5Fp2vnk7ef3v4qisKqcYxTlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UpLyXtbwTROn3uKDDsoJwbQSji7fkr4KbmygwM2E1AU=;
 b=HFKnJTFn9BOfsb0SJQrZVslG0iQ4aW7/7kQXdSOC+9Ys5zedwP8mOzunWF5NY/Oe0WnlrxpUDOyaZJXt8JG1piLG0UJ0824CM9Tpr3n3rx6AajMiWM1OngmTkDobxavWRp6LawbEGIaCEvPtsG8amq/sZS+//2gSXtO+N2C5LrHX20IbEZytegGheAOpIYWaQ+6ZbbdOEv6o2zX0Dam6apDS3eTbrT6WQqvU/wbwIUcAn1nSrIA6uEPexa/TbbdnShmosJuLX4o5Voq4+aLV/8GHpMY4dnfrHnoGvfwJ01AL5XFHlNVUA/bDj6s5bdYkl18ROdsqhk2D4jxBoFXdRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CH3PR11MB8413.namprd11.prod.outlook.com (2603:10b6:610:170::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Thu, 5 Mar
 2026 22:07:32 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9678.017; Thu, 5 Mar 2026
 22:07:32 +0000
Date: Thu, 5 Mar 2026 14:07:30 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/7] drm/xe: Modify stepping info directly in
 xe_step_*_get()
Message-ID: <20260305220730.GP4694@mdroper-desk1.amr.corp.intel.com>
References: <20260305-extra-nvl-p-enabling-patches-v1-0-5020d5289dea@intel.com>
 <20260305-extra-nvl-p-enabling-patches-v1-1-5020d5289dea@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260305-extra-nvl-p-enabling-patches-v1-1-5020d5289dea@intel.com>
X-ClientProxiedBy: SJ0PR13CA0018.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::23) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CH3PR11MB8413:EE_
X-MS-Office365-Filtering-Correlation-Id: fa6e52c6-6f10-4f67-0cc8-08de7b039981
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: DsT4J40cr8WH0Ecbu9KsltM0lZAZDvna8X7WPHsEqjYicVgx+LaSKcqfyY5r4Bd5nJwwmHl8QXZeowfCdQnLHRJHGYl4EKe3Nj/GFWwLbJ7d0T54nZsXLwlY+qXk7fmX9mppAU8P3b4hGJMQkEnBY/IYTGOx4ezVD2BB5b23ZUZ4BpAlHR8x2ERdXdxJ+QoQXWoKJ+yhTfwJp9h3HE/lacBiQkh1idBOOXkHn/+XZYSNVGGeNvO+zQqYfVfsFr9bUFoiXlsBz6VbmWLmU2+x+JlHF4JXKr/PNzLXsGR4lqN8GS6ZZXlXDAA6OjoxHt+TNQeZP2TULQdVmo/uZNpyFRKd3ar6tdK5XacH2XYqTDMrw+8L9juXJJAeglLEuww2EujNMPOEnH95vBMEeYH25Rbwymn+gN4XqWRLbdqyL7iEYCMfE2XbCzxbQLiBogmiRz8TC4x8YPkXUl4vntZKPPlfUFxgeiknb/wGDcAfvP07uxwfh82pXbLjXYtdW0KjI+zVaB00OEtLAS76uKW0RzilW5IA2OGv1Xx8Hh1tcd2ghG81cz+mrcnR3gmfYJKq1SYR73XFAupabLudU2xrd6txUJuoG1X7+ZkvFl+UUMpnOBT6YLcmdSKRrnDcTl7ZmW4IV71NjlMScjeVTa5Y0zrA0JphbMrMpoVOqa2Ibo5vvhHxLwsvyaQSL6ZiQNUOqRfr1Kk03eLvaHPE4EPnjIhJVW/xga1mvhcp6kc+qKw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+sEZkSHhtx1Z9j6tCfOGVF4VDs4UKIKOt9/WsmSmtIvcbq72jppwG7HABwah?=
 =?us-ascii?Q?ndskiOr6Ux8LY5RGIMNCDt/GmnWPceMyOoTVVVjtKlrrJM1tN/sUnwiUK9oV?=
 =?us-ascii?Q?PCnNNpF5Qqr2zv/y5sDOxOohmFWiTTO5gZNYBRe6hlIpvi/pKHizCAYdMqoy?=
 =?us-ascii?Q?Rp7yzk0gL6qKKQO7R3ESt//T19DJUp1mkN1ZNIZ/4mjq00rgTMpIE/GReMOH?=
 =?us-ascii?Q?hxbSOlzK8B+iwysICez/FueW0V+IBogcBcTOYS2QDPYPbhWDIoH2i7S2t+bw?=
 =?us-ascii?Q?n6Op9sHzO4eoNpygT66CSBpn8xYzcoUHDLjcpdblmnVAHPAbPXxq8pca85z4?=
 =?us-ascii?Q?Tu3aI9kpbdchqqP3IqugoSt2yGxdwTArh2d0xU1N4AVnaMuJ6Aa7lfUMWN01?=
 =?us-ascii?Q?okOAW6LkCXX+jlUBsj68O69p6Ed4EdXitwlmjzNKiCeApnd/MFDULZWw0km+?=
 =?us-ascii?Q?Bj1JXjDo0Y8/pr/9zqQ8ds3KEB3Kbgwyk/QWzZXHyauBdDFiuZXtN0vHYuKV?=
 =?us-ascii?Q?kW0pwA1/52M0mnrYOMKl/p2BVj9GfJImrh31I0kQ+g7fRjUs3ZPGr7hz2naw?=
 =?us-ascii?Q?XiCiMUGWzYWN37j2uzAxnwP9jhGEmPL6W/7CoeDFxFCOBPssC6oqdMiUADER?=
 =?us-ascii?Q?km1ljmyfmY9WPUorBh587K4mpT7nMaTlXBSyfAU93wBoVioKSdITa/OjGL5w?=
 =?us-ascii?Q?Oe15GkotCVuZX29jMLd//IrZgkxx8JNpU0P8aJaLI1mc9SXOtIlY0Vy0g3XD?=
 =?us-ascii?Q?Z+cYp9pBPXV9mj+1vorqlNH+qv/yS6NQHpWQLeBEMzPVCzKMuuPOB8pETAZu?=
 =?us-ascii?Q?rcEH9es6G6Gui8H5Ehna3ioIpYBnpqMuHPjPxtb/ydDyjK5QI8MGUybMy1JM?=
 =?us-ascii?Q?A3sLeXFFrofJKaexw/qMyzv6GC11jwHGyVCgYl1VRMJ6ZtN8Um+abEqBrDJR?=
 =?us-ascii?Q?ope8Z4pVHMwDGlJBxzHxfGD0Thf9APRehcV9ss7NORGsRIODX+FMh9aeFQYi?=
 =?us-ascii?Q?wcUNn9TE2SH3ovb6f4LZ/mGPqSQmyrw4Pk6hfSRKv2FLb9xrO+Dt6mVUvk2O?=
 =?us-ascii?Q?+fkkEO1HNAR2Dx1P7ZjTuxjz4gn3rHdbX9AMg7rlrIgVrbTBjsUdXRQK5+5S?=
 =?us-ascii?Q?HXO11tJOdsv8/jf1BmW/1SV48DX9Eyj6wLtfvKU7TgNK3C8n3BtOW62+BZ56?=
 =?us-ascii?Q?bxLhHMW1ofxjPW8/osPZySKBfybQm05b6lc3QvfScDDT7V2WvxzaP9iZ+y/+?=
 =?us-ascii?Q?Mxt3kJWlX048fASnkeE2vOH2/+BbU4s43Qyret80jrynYDjn6Bm/6bF0551O?=
 =?us-ascii?Q?OcMkqTogiRf/1RHaFPjTbRgjDEBpkmt9NAUBbPofIzIw0+Ci7iZCqnZUvmtI?=
 =?us-ascii?Q?A3xZSAfNwysqzbhWsReZMA/C+f30JVp4MdazIFPOgHVUfbrUj/32LwV5N/uO?=
 =?us-ascii?Q?hMx+e5VahoA8v+lp88syT4bjArXJFSlaOR8c+K1GcAGDMUDqqcEwYBQ+Q1kN?=
 =?us-ascii?Q?veaI1jaatHN+eETDJp0gYmvmEO6Ckf8OAd6VJ3U/UlUkwN26ssJSzJ8GXpi+?=
 =?us-ascii?Q?cn1hkgFP5Cax53ZRLnuwrW+Mc+B2Tn/bqhK4JxXYTGJvKkunQiQfeEp8cAba?=
 =?us-ascii?Q?qVLKep3X4ke4O4kxdItN3F/RQWxt0jOih2uJlrRhz4veK/oELylN5JsR7eFa?=
 =?us-ascii?Q?Aa86xaPR3M7RFCGDbQAfm1IBVQ4vMWlmHwy+XfOQUQ1/+2ylk6K2aM5eeguG?=
 =?us-ascii?Q?d6h5rTdgo47M0IWiDs3LQ8vMxjmuBCo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fa6e52c6-6f10-4f67-0cc8-08de7b039981
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 22:07:32.5612 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KtDOm9FwwU6A3RJXJy5SYY9qM10CxtmU1mbewe7n0OqvQrkmq1UiskwXsQKC+N1QhT2IJrASlXxC4V5iaCHInpA5UoLwWvfMmXPb3PiFVLs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8413
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

On Thu, Mar 05, 2026 at 09:02:28AM -0300, Gustavo Sousa wrote:
> In an upcoming change, we will add a member to struct xe_step_info to
> represent the platform-level stepping.  As such, we should stop assigning
> the value returned by functions xe_step_pre_gmdid_get() and
> xe_step_gmdid_get() directly to xe->info.step.
> 
> Since there are no other users for those functions, let's simply update
> them to modify xe->info.step directly.
> 
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_pci.c  |  6 ++---
>  drivers/gpu/drm/xe/xe_step.c | 52 +++++++++++++++++++++++++-------------------
>  drivers/gpu/drm/xe/xe_step.h |  8 +++----
>  3 files changed, 36 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 29f976e66848..72d4131e9775 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -914,7 +914,7 @@ static int xe_info_init(struct xe_device *xe,
>  	if (desc->pre_gmdid_graphics_ip) {
>  		graphics_ip = desc->pre_gmdid_graphics_ip;
>  		media_ip = desc->pre_gmdid_media_ip;
> -		xe->info.step = xe_step_pre_gmdid_get(xe);
> +		xe_step_pre_gmdid_get(xe);
>  	} else {
>  		xe_assert(xe, !desc->pre_gmdid_media_ip);
>  		ret = handle_gmdid(xe, &graphics_ip, &media_ip,
> @@ -922,9 +922,7 @@ static int xe_info_init(struct xe_device *xe,
>  		if (ret)
>  			return ret;
>  
> -		xe->info.step = xe_step_gmdid_get(xe,
> -						  graphics_gmdid_revid,
> -						  media_gmdid_revid);
> +		xe_step_gmdid_get(xe, graphics_gmdid_revid, media_gmdid_revid);
>  	}
>  
>  	/*
> diff --git a/drivers/gpu/drm/xe/xe_step.c b/drivers/gpu/drm/xe/xe_step.c
> index 2860986f82f7..064b604b5b94 100644
> --- a/drivers/gpu/drm/xe/xe_step.c
> +++ b/drivers/gpu/drm/xe/xe_step.c
> @@ -115,15 +115,17 @@ __diag_pop();
>   * Convert the PCI revid into proper IP steppings.  This should only be
>   * used on platforms that do not have GMD_ID support.
>   */
> -struct xe_step_info xe_step_pre_gmdid_get(struct xe_device *xe)
> +void xe_step_pre_gmdid_get(struct xe_device *xe)
>  {
>  	const struct xe_step_info *revids = NULL;
> -	struct xe_step_info step = {};
>  	u16 revid = xe->info.revid;
>  	int size = 0;
>  	const int *basedie_info = NULL;
>  	int basedie_size = 0;
>  	int baseid = 0;
> +	u8 graphics = STEP_NONE;
> +	u8 media = STEP_NONE;
> +	u8 basedie = STEP_NONE;
>  
>  	if (xe->info.platform == XE_PVC) {
>  		baseid = FIELD_GET(GENMASK(5, 3), xe->info.revid);
> @@ -166,10 +168,12 @@ struct xe_step_info xe_step_pre_gmdid_get(struct xe_device *xe)
>  
>  	/* Not using the stepping scheme for the platform yet. */
>  	if (!revids)
> -		return step;
> +		goto done;
>  
>  	if (revid < size && revids[revid].graphics != STEP_NONE) {
> -		step = revids[revid];
> +		graphics = revids[revid].graphics;
> +		media = revids[revid].media;
> +		basedie = revids[revid].basedie;
>  	} else {
>  		drm_warn(&xe->drm, "Unknown revid 0x%02x\n", revid);
>  
> @@ -187,25 +191,30 @@ struct xe_step_info xe_step_pre_gmdid_get(struct xe_device *xe)
>  		if (revid < size) {
>  			drm_dbg(&xe->drm, "Using steppings for revid 0x%02x\n",
>  				revid);
> -			step = revids[revid];
> +			graphics = revids[revid].graphics;
> +			media = revids[revid].media;
> +			basedie = revids[revid].basedie;
>  		} else {
>  			drm_dbg(&xe->drm, "Using future steppings\n");
> -			step.graphics = STEP_FUTURE;
> +			graphics = STEP_FUTURE;
>  		}
>  	}
>  
> -	drm_WARN_ON(&xe->drm, step.graphics == STEP_NONE);
> +	drm_WARN_ON(&xe->drm, graphics == STEP_NONE);
>  
>  	if (basedie_info && basedie_size) {
>  		if (baseid < basedie_size && basedie_info[baseid] != STEP_NONE) {
> -			step.basedie = basedie_info[baseid];
> +			basedie = basedie_info[baseid];
>  		} else {
>  			drm_warn(&xe->drm, "Unknown baseid 0x%02x\n", baseid);
> -			step.basedie = STEP_FUTURE;
> +			basedie = STEP_FUTURE;
>  		}
>  	}
>  
> -	return step;
> +done:
> +	xe->info.step.graphics = graphics;
> +	xe->info.step.media = media;
> +	xe->info.step.basedie = basedie;
>  }
>  
>  /**
> @@ -220,28 +229,27 @@ struct xe_step_info xe_step_pre_gmdid_get(struct xe_device *xe)
>   * all platforms:  major steppings (A0, B0, etc.) are 4 apart, with minor
>   * steppings (A1, A2, etc.) taking the values in between.
>   */
> -struct xe_step_info xe_step_gmdid_get(struct xe_device *xe,
> -				      u32 graphics_gmdid_revid,
> -				      u32 media_gmdid_revid)
> +void xe_step_gmdid_get(struct xe_device *xe,
> +		       u32 graphics_gmdid_revid,
> +		       u32 media_gmdid_revid)
>  {
> -	struct xe_step_info step = {
> -		.graphics = STEP_A0 + graphics_gmdid_revid,
> -		.media = STEP_A0 + media_gmdid_revid,
> -	};
> +	u8 graphics = STEP_A0 + graphics_gmdid_revid;
> +	u8 media = STEP_A0 + media_gmdid_revid;
>  
> -	if (step.graphics >= STEP_FUTURE) {
> -		step.graphics = STEP_FUTURE;
> +	if (graphics >= STEP_FUTURE) {
> +		graphics = STEP_FUTURE;
>  		drm_dbg(&xe->drm, "Graphics GMD_ID revid value %d treated as future stepping\n",
>  			graphics_gmdid_revid);
>  	}
>  
> -	if (step.media >= STEP_FUTURE) {
> -		step.media = STEP_FUTURE;
> +	if (media >= STEP_FUTURE) {
> +		media = STEP_FUTURE;
>  		drm_dbg(&xe->drm, "Media GMD_ID revid value %d treated as future stepping\n",
>  			media_gmdid_revid);
>  	}
>  
> -	return step;
> +	xe->info.step.graphics = graphics;
> +	xe->info.step.media = media;
>  }
>  
>  #define STEP_NAME_CASE(name)	\
> diff --git a/drivers/gpu/drm/xe/xe_step.h b/drivers/gpu/drm/xe/xe_step.h
> index 686cb59200c2..6febb7fac476 100644
> --- a/drivers/gpu/drm/xe/xe_step.h
> +++ b/drivers/gpu/drm/xe/xe_step.h
> @@ -12,10 +12,10 @@
>  
>  struct xe_device;
>  
> -struct xe_step_info xe_step_pre_gmdid_get(struct xe_device *xe);
> -struct xe_step_info xe_step_gmdid_get(struct xe_device *xe,
> -				      u32 graphics_gmdid_revid,
> -				      u32 media_gmdid_revid);
> +void xe_step_pre_gmdid_get(struct xe_device *xe);
> +void xe_step_gmdid_get(struct xe_device *xe,
> +		       u32 graphics_gmdid_revid,
> +		       u32 media_gmdid_revid);
>  static inline u32 xe_step_to_gmdid(enum xe_step step) { return step - STEP_A0; }
>  
>  const char *xe_step_name(enum xe_step step);
> 
> -- 
> 2.52.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
