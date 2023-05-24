Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33E23C77B7C
	for <intel-xe@archiver.kernel.org>; Wed, 24 May 2023 07:07:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F347010E57D;
	Wed, 24 May 2023 07:07:31 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A0CC10E57D
 for <intel-xe@lists.freedesktop.org>; Wed, 24 May 2023 07:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684912051; x=1716448051;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=fx/r20wW6DsLoFj+ayjTni1ELtCV38g/hXFeZ0nDAr4=;
 b=XV0eEErXiBfUW7aqfyROprhrwMgE0CZRXL8wWMvW27O3udkuhEP26ARn
 ii6jUkWiDdyqOrPTe+9i9BeCIBKLnM3ZZvZmxwaufqvR+vxxYhoLY5CC8
 P2Gf2KyaODapZmXlVJRs1y/da1APCMoHwGTrG0xZ9MiEkxq+BNeN3H6Oo
 5vmbvchLAResBI+5oLyGCdAh96m6I49iBucdbvFSemHQuGkWx1LZRnI3e
 JVEeOpo94pwXnjRXPFVIJKuECaYryM/zuSWoXHVVKlbrfZphBUhRiD77D
 bT2DKBxEmIldjrnassAiGP7rE3Hh5OUYEGzuLRTHuJvtlzBy5djbX5Orf A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="352324320"
X-IronPort-AV: E=Sophos;i="6.00,188,1681196400"; d="scan'208";a="352324320"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 00:07:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="794068075"
X-IronPort-AV: E=Sophos;i="6.00,188,1681196400"; d="scan'208";a="794068075"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP; 24 May 2023 00:07:29 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 24 May 2023 00:07:29 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 24 May 2023 00:07:29 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 24 May 2023 00:07:29 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 24 May 2023 00:07:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lS/DuyBz5bKPKVflKZoBrGYm9TItfhtocQXT9T6ujrnJnz4hR+tsgUnk/T8rJ+qWsFUDKIIUqSHZCWoHagM2a6d48vPbgN/lXji+xZLR0lWq0FxnjZXuiWqzqh5bU0tNLoG/4kEUlR/GMHIwsHCXcHETQksw2twCuIjOwmg6fcQNCV/AX1qiqPWrm7H6kGk4oMOmS7s3BhYmNCNtorQWyl+KinPD3dZXSHCtzkXpz0DKBsKWapWWAk6m80/9WGuTQC54sOolODJb/fAvr+MK4QXTV+wdAjGcEC8yGY9EtquBAMukTG09RDijmZ/giO5QvDVqB2Ds5JFtA/cqzANeXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CPfMkBcU+jjmuJZCqmbSE5TZ+Dc4V3aoNCqM9Dnzmlw=;
 b=m+AzYTCxUAg48PD10OUdf4Hj02kbhRvbtO8xrA7gwmp0MFNzvipOckH93INPQo02GoQlHypzNwvAWhwlSyJsS8SBcGrDdfr6urdHRzzFtA+O+iU+a6lmnKoGfTc7Y7rMBor6vKfp6YblgM38KtQQDxV59tzVovM6b+IBJaMelkD8HvnbKV8mloSAFENVk3/1Clo2beq/PsjNawsXXpQmT+25iYPQqGw/0kO2LujC5+wl8cU5vj8H2LB3G2E1ecHqtozVxCVnorvcRNZda47l8eKC/QhzIl/N9hze9+9NAQk3qZRqNK1wd6C6PhSqN23N5cGRABQkwVid8b5f89+CtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by SA1PR11MB8326.namprd11.prod.outlook.com (2603:10b6:806:379::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Wed, 24 May
 2023 07:07:21 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::b4b1:f52b:901f:8c5d]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::b4b1:f52b:901f:8c5d%5]) with mapi id 15.20.6411.028; Wed, 24 May 2023
 07:07:21 +0000
Date: Wed, 24 May 2023 12:37:10 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Message-ID: <ZG23ntZ0YxVF243S@bvivekan-mobl>
References: <20230523234026.195301-1-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20230523234026.195301-1-matthew.d.roper@intel.com>
X-ClientProxiedBy: PN3PR01CA0005.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:95::6) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|SA1PR11MB8326:EE_
X-MS-Office365-Filtering-Correlation-Id: 6945f3de-ec6c-4746-4b6d-08db5c25848c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t5KLrC4/YJGpk11lbboE5QS6m7cIvpVh0I/whIhSJ2nY/+ni6Iv4KPKT24Y2k13boDM4iRDx0s31HulotJnpGJDTcwwMghR+ViKekHKZCPB1ghKCgPIJ013fEGtJ92i/f6UeM6Lt/pD8JqYqY/Uq5M9aJnrzJMkLspw71zR0og/pLcT8uV4i8mFz0eMsAVeq3MavG/Boc7RB+Tzn00thn+tuEyMl6z/y8VhrGku5sW7fgqEznND/aqxs0sOmq214fvx31gg9XDIuCooi23Xq7O8cxKW5FojeVW0fSmKZAoMrk6ubS5/lbbqhzI6D7TAb1issZUD22k1i78/2qdQNDvpAaJ2AcDld9YiOkncVxm4WLCyaoaGxEsi+jGAwk3i2qbSeF2UD6lRU4H0ASH/z7eRuEPlSSgnSTq6LfgvBL5ZMeL8uKRcssLI5CY4qyz20+ZL4sbi/ezQOH20GC+wzX2rq3GQ5JS2uJ7mGVU3fz+7SbBLt1ScsvpxBoQ409BnEiQalFCl3wPeQllkJ3Uy+yYa+IbC6nRcCtn5GzXtLPIxcx3Wj9X+FkJ45q2jWLbOm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(376002)(346002)(39860400002)(396003)(136003)(366004)(451199021)(82960400001)(6506007)(6512007)(26005)(9686003)(186003)(53546011)(38100700002)(44832011)(83380400001)(2906002)(6486002)(41300700001)(316002)(6666004)(33716001)(478600001)(66556008)(66476007)(66946007)(86362001)(8676002)(8936002)(66899021)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a2c3Vi9RTllrV0YxQ0ZHY0tCSkhEN0J2OEtSbmxodmcyTFRJK2ZtZk4rcFEw?=
 =?utf-8?B?WGpDNEtZTGRWZlFmLzFmTTl3Yk1tNDAwTFZ2emtFWXRMVENKV1gzRFJVK2xL?=
 =?utf-8?B?WVRVTERRZUx2RWE0amJmdUtaQWNSR3ppYVN4UWc3R0xVTzhJTElOd1RZb2hq?=
 =?utf-8?B?NnFaODFMdmVUT2lISWVnL2FWbytiVUFQWTZwL3BmY3E0bWlJTk40Z25IaTNW?=
 =?utf-8?B?Tlh6d1hXSEZyY2JzVk9RRHRVQXNJSks0NU1DK3NZdmpnbWNoa3JsdGpsMDY1?=
 =?utf-8?B?c01ZTlJ2SUY2L2NhU0N1S05rczVoMlNrSkMva01MMnVEb2h2ZStvQU5SY2Iv?=
 =?utf-8?B?dnZ0TzB5elJsbERGSVFHWC8zekdCYzVxZ084akpvR2NMTTJIVjR3cUt4aEtY?=
 =?utf-8?B?UEJyVkgyc2V3a2w2ckJTNDFoazVKRmpSdnU4T3V0dW5GMktCK0dEcW9zZXc0?=
 =?utf-8?B?Smd4UjIrODd6bmY2RzBtZmJlMUFDNW1UV0hMTlF4dVlscVBjVTlJVVVEeHhX?=
 =?utf-8?B?NXhjazhSMUE1TkJEem9SYjgzWjYwaFNCejVOcGlsT3hYV0dRdkg0MVNTdk9w?=
 =?utf-8?B?WFUxNlNJblZZMkdzZ0JrYTN0SE1RbUJHMllpcWV6Mm55UDZxM2Y1NSsyUEJs?=
 =?utf-8?B?RUR6VGtIWVVqcWVLaWNHSlIwM1ovZlVRSkt0bXhlbkV0dTEwMHlVeFRNdnlP?=
 =?utf-8?B?YTFPNnU0TzIwVWthQ0l6MWcrWUNaWFBVMStPSXRLY2tnZFVSSXplRnJzZmg5?=
 =?utf-8?B?T0hkVWhRQ2tJOUdkWGZsRWs4T0JmVkFvUE5vMldOWlRNV3paWHFITlpWL2tL?=
 =?utf-8?B?WnhVUGNXUk9ySHpkRDFCdzVqaFRwMXJlT0xtMWxTSlQ1RG53N0NjOU1uMVg3?=
 =?utf-8?B?czh4UmtxMFVjZS82OGpjblJwcXA2TXRhZmJFamxDaTV3dG12aTNFVk5MTW00?=
 =?utf-8?B?RWkzeDhWbE9CdG85dWRBM2ZvNHZmK1FGdUx1RGkxMWJPYWdNTHQvcXVwQ3FN?=
 =?utf-8?B?WlRjZm9xTWJuRVVXYmFjeFhJd1RkVnZKSWJCdGN0WmtpMmtaVFFMMDlqRzNV?=
 =?utf-8?B?QVpvUWZtMHBWdGowVWZZOVNxV0FRNGpDdEkyL1h2RkpyWTVTU2l0cms4VFRa?=
 =?utf-8?B?SVJlczR2Sm1LNGlDMEpVdUhkUzlhZXNzcEdFVUJZUUtYVkgvWE9FSHB6bkN6?=
 =?utf-8?B?QmlITmdyZnpGT2hrQVJ5dTErRnl6bXhHa1BPUHdmSTJBOWY2V1BTZ2JtTFQ3?=
 =?utf-8?B?K2hKaDR3QkozRkRsZk9VS3o4NGlOWGJqb25SdVg5bEhYZTJ4d29yMXM5bmlD?=
 =?utf-8?B?T0VmTXhrT05ZL3dCdXJIdWxmL1ZoMDdGNWZ2MHZzeVdOTFBHTCt4NDJUZThz?=
 =?utf-8?B?eGd3OFl0QlNhK1dWRm02dC9ZNG9YQ1ZXZnFxRll3K0N0SmRqWk9PTmY4TzBG?=
 =?utf-8?B?WVcrbVhaZ2tzN05ZQlhWYVgrdk82bEJ4d2lCUUwxRDdYWC9Rb0VVRmZxL2Vr?=
 =?utf-8?B?WTdNaVczSVp3QUNIUzZYRXVQY051TjBZdTUzdUMvc1hPTDJuUDJLVlF5V0Fm?=
 =?utf-8?B?UXpWZDIycDF5U0MweFJ5ZkZwTWJHdEgzZHhaSHA0RWtKTUFVYzhNZ1dWMGxR?=
 =?utf-8?B?ZWZGVE5WWElqb0wzeXVIUG9zZS9OZ3NPL0ZVSFBSM0w3YzBmandDRDNHMFFH?=
 =?utf-8?B?dmo4WE5sTHh4ay83MEsxWVdNc3lXNCtObEV0bG1NeEJLemREaXk4Vk9EV1l6?=
 =?utf-8?B?YkFXY1d2Q1BiYnVxQ2JtVnVDS2J2bXkwSXFSVzBLMndFZmxDV3FYam1kU3hG?=
 =?utf-8?B?T1FSVHNRS3FUclQvVU4rOWpwVUlwclpzZ2hSSTJqQ2UzRmJsODg2SkhSZ05z?=
 =?utf-8?B?L2lOaCtmYlNnVzFuUnNwV1V4aFpPN0RaM0VlSVZvMS9aVjNlSEQwWG9jUU5k?=
 =?utf-8?B?ZjFIY3lMWGh5Sis2TjgzaWxKdndJQlR5UVl2MTZmNDFDdlRxK3ViSXh3Y3Jp?=
 =?utf-8?B?ZG81VjVzUDMzZEd1QkYzMjFlUXQyTDVvMDdNUXhrS25ObEhEZmpSd2h3VDlt?=
 =?utf-8?B?ZFZjcFNRMDhjTXF5MEE4QWV6UG02anpOUXlNbWFreWhMYStEMFkzekxUVkVY?=
 =?utf-8?B?S05HNE1vSjhSNFo1V1oxY3dHdGkxcTEvek9lSUpRKzg2ajltOVQyMnNHM3pG?=
 =?utf-8?Q?CDL4URAX2E0d8UPY6dsh5GM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6945f3de-ec6c-4746-4b6d-08db5c25848c
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 07:07:21.5123 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uxbzgRoB/uodbCfDCh0R02k4Z41GiNFJTI+GMJDPkzmyrrWMGU2W7IHvtgdNY4BZTG54H0dUG5Q3MYsm/NjnKbX5rNaPfc5OAqrUKfp30oTe6uZrSzMvhVQZWuZxfmP3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8326
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Add stepping support for GMD_ID
 platforms
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

On 23.05.2023 16:40, Matt Roper wrote:
> For platforms with GMD_ID registers, the IP stepping should be
> determined from the 'revid' field of those registers rather than from
> the PCI revid.
> 
> The hardware teams have indicated that they plan to keep the revid =>
> stepping mapping consistent across all GMD_ID platforms, with major
> steppings (A0, B0, C0, etc.) having revids that are multiples of 4, and
> minor steppings (A1, A2, A3, etc.) taking the intermediate values.  For
> now we'll trust that hardware follows through on this plan; if they have
> to change direction in the future (e.g., they wind up needing something
> like an "A4" that doesn't fit this scheme), we can add a GMD_ID-based
> lookup table when the time comes.
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  2 +-
>  drivers/gpu/drm/xe/xe_pci.c          | 20 +++++++++----
>  drivers/gpu/drm/xe/xe_step.c         | 45 +++++++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_step.h         |  5 +++-
>  drivers/gpu/drm/xe/xe_step_types.h   | 13 ++++----
>  5 files changed, 70 insertions(+), 15 deletions(-)

Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 4d87f1fe010d..e64e5c0733d6 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -24,7 +24,7 @@
>  #define GMD_ID					XE_REG(0xd8c)
>  #define   GMD_ID_ARCH_MASK			REG_GENMASK(31, 22)
>  #define   GMD_ID_RELEASE_MASK			REG_GENMASK(21, 14)
> -#define   GMD_ID_STEP				REG_GENMASK(5, 0)
> +#define   GMD_ID_REVID				REG_GENMASK(5, 0)
>  
>  #define FORCEWAKE_ACK_GT_MTL			XE_REG(0xdfc)
>  
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 2d0d50dcd396..0a8c4a707d05 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -459,11 +459,14 @@ static void handle_pre_gmdid(struct xe_device *xe,
>  static void handle_gmdid(struct xe_device *xe,
>  			 const struct xe_device_desc *desc,
>  			 const struct xe_graphics_desc **graphics,
> -			 const struct xe_media_desc **media)
> +			 const struct xe_media_desc **media,
> +			 u32 *graphics_revid,
> +			 u32 *media_revid)
>  {
>  	u32 ver;
>  
>  	ver = peek_gmdid(xe, GMD_ID.addr);
> +	*graphics_revid = REG_FIELD_GET(GMD_ID_REVID, ver);
>  	for (int i = 0; i < ARRAY_SIZE(graphics_ip_map); i++) {
>  		if (ver == graphics_ip_map[i].ver) {
>  			xe->info.graphics_verx100 = ver;
> @@ -479,6 +482,7 @@ static void handle_gmdid(struct xe_device *xe,
>  	}
>  
>  	ver = peek_gmdid(xe, GMD_ID.addr + 0x380000);
> +	*media_revid = REG_FIELD_GET(GMD_ID_REVID, ver);
>  	for (int i = 0; i < ARRAY_SIZE(media_ip_map); i++) {
>  		if (ver == media_ip_map[i].ver) {
>  			xe->info.media_verx100 = ver;
> @@ -501,6 +505,7 @@ static int xe_info_init(struct xe_device *xe,
>  {
>  	const struct xe_graphics_desc *graphics_desc = NULL;
>  	const struct xe_media_desc *media_desc = NULL;
> +	u32 graphics_gmdid_revid = 0, media_gmdid_revid = 0;
>  	struct xe_gt *gt;
>  	u8 id;
>  
> @@ -510,10 +515,16 @@ static int xe_info_init(struct xe_device *xe,
>  	 * ever be set at this point for platforms before GMD_ID. In that case
>  	 * the IP descriptions and versions are simply derived from that.
>  	 */
> -	if (desc->graphics)
> +	if (desc->graphics) {
>  		handle_pre_gmdid(xe, desc, &graphics_desc, &media_desc);
> -	else
> -		handle_gmdid(xe, desc, &graphics_desc, &media_desc);
> +		xe->info.step = xe_step_pre_gmdid_get(xe);
> +	} else {
> +		handle_gmdid(xe, desc, &graphics_desc, &media_desc,
> +			     &graphics_gmdid_revid, &media_gmdid_revid);
> +		xe->info.step = xe_step_gmdid_get(xe,
> +						  graphics_gmdid_revid,
> +						  media_gmdid_revid);
> +	}
>  
>  	/*
>  	 * If we couldn't detect the graphics IP, that's considered a fatal
> @@ -557,7 +568,6 @@ static int xe_info_init(struct xe_device *xe,
>  
>  	xe->info.subplatform = subplatform_desc ?
>  		subplatform_desc->subplatform : XE_SUBPLATFORM_NONE;
> -	xe->info.step = xe_step_get(xe);
>  
>  	for (id = 0; id < xe->info.tile_count; ++id) {
>  		gt = xe->gt + id;
> diff --git a/drivers/gpu/drm/xe/xe_step.c b/drivers/gpu/drm/xe/xe_step.c
> index a443d9bd7bbb..1baf79ba02ad 100644
> --- a/drivers/gpu/drm/xe/xe_step.c
> +++ b/drivers/gpu/drm/xe/xe_step.c
> @@ -107,7 +107,14 @@ static const int pvc_basedie_subids[] = {
>  
>  __diag_pop();
>  
> -struct xe_step_info xe_step_get(struct xe_device *xe)
> +/**
> + * xe_step_pre_gmdid_get - Determine IP steppings from PCI revid
> + * @xe: Xe device
> + *
> + * Convert the PCI revid into proper IP steppings.  This should only be
> + * used on platforms that do not have GMD_ID support.
> + */
> +struct xe_step_info xe_step_pre_gmdid_get(struct xe_device *xe)
>  {
>  	const struct xe_step_info *revids = NULL;
>  	struct xe_step_info step = {};
> @@ -198,6 +205,42 @@ struct xe_step_info xe_step_get(struct xe_device *xe)
>  	return step;
>  }
>  
> +/**
> + * xe_step_gmdid_get - Determine IP steppings from GMD_ID revid fields
> + * @xe: Xe device
> + * @graphics_gmdid_revid: value of graphics GMD_ID register's revid field
> + * @media_gmdid_revid: value of media GMD_ID register's revid field
> + *
> + * Convert the revid fields of the GMD_ID registers into proper IP steppings.
> + *
> + * GMD_ID revid values are currently expected to have consistent meanings on
> + * all platforms:  major steppings (A0, B0, etc.) are 4 apart, with minor
> + * steppings (A1, A2, etc.) taking the values in between.
> + */
> +struct xe_step_info xe_step_gmdid_get(struct xe_device *xe,
> +				      u32 graphics_gmdid_revid,
> +				      u32 media_gmdid_revid)
> +{
> +	struct xe_step_info step = {
> +		.graphics = STEP_A0 + graphics_gmdid_revid,
> +		.media = STEP_A0 + media_gmdid_revid,
> +	};
> +
> +	if (step.graphics >= STEP_FUTURE) {
> +		step.graphics = STEP_FUTURE;
> +		drm_dbg(&xe->drm, "Graphics GMD_ID revid value %d treated as future stepping\n",
> +			graphics_gmdid_revid);
> +	}
> +
> +	if (step.media >= STEP_FUTURE) {
> +		step.media = STEP_FUTURE;
> +		drm_dbg(&xe->drm, "Media GMD_ID revid value %d treated as future stepping\n",
> +			graphics_gmdid_revid);
> +	}
> +
> +	return step;
> +}
> +
>  #define STEP_NAME_CASE(name)	\
>  	case STEP_##name:	\
>  		return #name;
> diff --git a/drivers/gpu/drm/xe/xe_step.h b/drivers/gpu/drm/xe/xe_step.h
> index 0c596c8579fb..a384b640f2af 100644
> --- a/drivers/gpu/drm/xe/xe_step.h
> +++ b/drivers/gpu/drm/xe/xe_step.h
> @@ -12,7 +12,10 @@
>  
>  struct xe_device;
>  
> -struct xe_step_info xe_step_get(struct xe_device *xe);
> +struct xe_step_info xe_step_pre_gmdid_get(struct xe_device *xe);
> +struct xe_step_info xe_step_gmdid_get(struct xe_device *xe,
> +				      u32 graphics_gmdid_revid,
> +				      u32 media_gmdid_revid);
>  const char *xe_step_name(enum xe_step step);
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_step_types.h b/drivers/gpu/drm/xe/xe_step_types.h
> index b7859f9647ca..ccc9b4795e95 100644
> --- a/drivers/gpu/drm/xe/xe_step_types.h
> +++ b/drivers/gpu/drm/xe/xe_step_types.h
> @@ -21,21 +21,20 @@ struct xe_step_info {
>  	func(A0)			\
>  	func(A1)			\
>  	func(A2)			\
> +	func(A3)			\
>  	func(B0)			\
>  	func(B1)			\
>  	func(B2)			\
>  	func(B3)			\
>  	func(C0)			\
>  	func(C1)			\
> +	func(C2)			\
> +	func(C3)			\
>  	func(D0)			\
>  	func(D1)			\
> -	func(E0)			\
> -	func(F0)			\
> -	func(G0)			\
> -	func(H0)			\
> -	func(I0)			\
> -	func(I1)			\
> -	func(J0)
> +	func(D2)			\
> +	func(D3)			\
> +	func(E0)
>  
>  /*
>   * Symbolic steppings that do not match the hardware. These are valid both as gt
> -- 
> 2.40.1
> 
