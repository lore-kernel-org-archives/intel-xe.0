Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61281C61D97
	for <intel-xe@archiver.kernel.org>; Wed, 22 Nov 2023 18:26:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F50C10E0DF;
	Wed, 22 Nov 2023 18:26:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 944B210E0E7
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Nov 2023 18:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700677589; x=1732213589;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=iRvcUqW9V5pBDloAMarD0d8HxtrBU17JjzHLImARXQw=;
 b=WmRVZMh0WtHOGyZCleJ6WjjZp2IGe+KoDFO0cvPV43CB2ICeRJ7TicUb
 sC8EBu3TrExK/eFfXTU4KoSEVtC0RVFr+8Vt3wxHuVe5pn6YMU4CDpIJu
 sIczKErvRj42iNrTuXo//RqNZQglXiYn9SzdF+PzBxAM9X7lMEV1X/NOZ
 fxfKMKji3bJTBAG6TFeehZ+L+GLNxnT7eDTeNouvAn4SsFrQp5tdF/YrJ
 7iq+2dA4vTn9XicyTP8k+DebjTaw6pkVTlxt8VOcPZMIuI6xTW+7gx88A
 BMI6m1ECJG8MRnHDOCRyS0Q7JYIkWzDy1Xn5AGhdncx59Fdn6uBMdJnnc A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="458617119"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; d="scan'208";a="458617119"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 10:26:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="1014377307"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; d="scan'208";a="1014377307"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Nov 2023 10:26:28 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 22 Nov 2023 10:26:18 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 22 Nov 2023 10:26:18 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 22 Nov 2023 10:25:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kiX6QGtxxMMMGWXn0dM4vTS7qReR8wYNIb6BO9fgUFUGgPTl21ZmmPruiGpeioGxPsHkJU4GmZmUC0nNQpzxFtUGUU6Am8nBmWOsknUB1dod6hjsNTutgAgpF/NuxXAX4Z/mHNkFkVxAMoWV7h7OrXCa2TXHyvXFkfT8DXcJZ5t68/5+uNnZLEWVYYZqqZg0S1D76Y/vQJ0RlExpIJYH1BiQCKRcI7QoswjbVqQxtAUj/b5ntoB3l73BZBfsy4zC4TsbR5rnGeE3XYeTdIMXq+m09cNaPdJAyFsuOx8sc2Qe4ELc6ZKIpyzTPbERPUabI1yqvb5+zhcUC1TkV2xnGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hZYvEdsyA+wcz6nh6NRnoDb1NX3udxu/6N+78P3DO2I=;
 b=SIvKGqpck4BXgCzybb+vneDFnnddlkI6sgLPABDdeoczfTK4BAgFBm3SAW96Idtw2N1FMn03Huq7V7zbp7DlggVWKcwJarrKrFubLJUBX7eKdvCkPM1wY/Scz15Cspn2wZBhtYCIRRTUiahQ9Ov9tIw9NcHR/K8W6tZx8I42IfeMmRuRcwnnENZeXXorlQ5vu79Jqy9EioAG05I71fIMs5jsrWTHGEmSVLnFyHBP7qQMyZEUaJ8DZwq1kVlXfGp2pYZVvu0Hv8ReNaI0xXtdbrVrV84086sepn5rcMMgxBbx7CP2MUnj+0GSEcIBIIeEvsvqCaB2qPdnIWDr7M3/Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CYYPR11MB8307.namprd11.prod.outlook.com (2603:10b6:930:ba::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.19; Wed, 22 Nov
 2023 18:25:16 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7025.017; Wed, 22 Nov 2023
 18:25:15 +0000
Date: Wed, 22 Nov 2023 10:25:13 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
Message-ID: <20231122182513.GK1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231122105854.3788939-1-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231122105854.3788939-1-tejas.upadhyay@intel.com>
X-ClientProxiedBy: BYAPR08CA0003.namprd08.prod.outlook.com
 (2603:10b6:a03:100::16) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CYYPR11MB8307:EE_
X-MS-Office365-Filtering-Correlation-Id: fee7be18-01ed-4902-d138-08dbeb885fb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +yei4FmYeSFEbQ3bvwunPb+2W6poFem657vJWAj8Xx0mNzhgdU0V4NHDNobHVP5hvzPhanyq5muF93TIRKI18FHclzscIUtUXTDwFoshZtLvaWQs2kNQW7+fwc/r2ioWmAINIM+0vdN7ctvLQYoAOiX3WXfJk12Y3lWK29bYk7k+d7B3g6uota9amY/HEBC8zG5SDWHf014VmKo5ge0SeWFiBm2lTnW5NkIDeiRTJOkObdFYNA93MlN1MSQeB+TZEoyS8gK1hX0uIKuTOl3CwXqtY2HC51NfwQpifYedfrl1vS/C9gcU7bYbrpCmGw5DMYNxsYfVTSSK4VYJY9zmZAbildR3gzXSUDWpUvBh37eppRev1R9D7P6AaqNsR1PS6fAYYUa3l/KJRSH38lCoDxdpdgL1RncBlHQiWFQx3bkdnZu/h2pkgMwtMNH6P6rRC/kzah+r1jhY5lbyJSbqySSL8bFX/Y5ctP1/aASy9YP/h9Dh/9H3rdcOrfveeyFnJSkLqmUuRNPD1I0YVSAec30UAKcKYBl01heYGIRKCt4aw9vgtGIHoIPw/MwoEN3P
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(396003)(376002)(136003)(366004)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(1076003)(26005)(8936002)(8676002)(5660300002)(6506007)(6862004)(4326008)(41300700001)(33656002)(2906002)(86362001)(66946007)(66556008)(6512007)(6636002)(66476007)(38100700002)(478600001)(6486002)(316002)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3E1w2tvJUt2zWmSRL/X3hajd4rtYgGXeUgiuqDbOXQ7WIHP4EYiA3pTVlcnQ?=
 =?us-ascii?Q?SuWIJjJ2+cO8bl8fDxaAXU1GYlUVnVPwvfEGIzDr99SiKLokkmWRSzf9Wi0j?=
 =?us-ascii?Q?PosPr9V90Z20eXnT/5x1bLqV3VgdF+l3pdw/qfjLncdDoxQPU2BOeBz5JEvN?=
 =?us-ascii?Q?1NxJFYPbumSJLlOAbJFyf8vbE3NJyh14MLoUnblkCMN30wYkQGYDrHMl5CFG?=
 =?us-ascii?Q?/6CgRGcYMV7hg8OaDn/BOPA8wkV5ax07UWp1obH1BqOIKz7jnr6t1RdovTC7?=
 =?us-ascii?Q?oge6RpBJ6Lg7w6XAn9/JxODHaT7aVU1ZPQxcql5/5KwhVOfHSkXuQH2yY/LF?=
 =?us-ascii?Q?mFLggZKbHhElFUTvKydX80gU+MjDkEAhKshkq880lMw23/Dq77mwhsH9FnQ3?=
 =?us-ascii?Q?ZcDiKCBy6iG0LmY1OSGevlznThe3LTjUSK7Lyd2dF5sml+XoDBEA+Vli6TII?=
 =?us-ascii?Q?kt8YilCb5oUpxgQVdaCOKdZzlWr4SMsfFgMdR4WmiTesHH6BvsQUS9cKf0Sb?=
 =?us-ascii?Q?ULS8XwtW4tIiar28p0eRn7dvvFLE+aydR8gBW649IgQL+rdzCkhGJKHQ7jsm?=
 =?us-ascii?Q?DxFePGeJgxKGGDqbxhu59AP31QcyWmAV+bjfKLLVi6joJw6f1lq2Zd5w6V1w?=
 =?us-ascii?Q?yQf8OmKuKTnz5gb+gdB7/Sh3YoIGExv0BIZgtTXhGOPylGu2LlRsWrLMGnfU?=
 =?us-ascii?Q?zW9Oaecv6IvGgqhDWNR9GMeoMmDfgILmsEH/kPpvIFELFPgYmrni4JeDWxFb?=
 =?us-ascii?Q?lW+I/CZzv3z21+/L6fCvscUQjdBW5Hf67IQmdiZcfvY5bgHHC5+KUPuSIP9s?=
 =?us-ascii?Q?9pe9QLxbKMhVwfOyYFeYoV3dMJNl5dNr+y2oBwHmmrIJyfpEqESibyEjed8m?=
 =?us-ascii?Q?jQQAJ2ROV8BZQ+67iDOY+YY8pUAN/th20c9s+XefXXEJh+WvGpBduDdPB4k7?=
 =?us-ascii?Q?GOhG+w2oXFJ7SgppF89B2+qQWpPrt2EH385ZaIW7ppyX0P+27W7jizbG0pYd?=
 =?us-ascii?Q?w9zSW6+IkIfgHjyr2qnGP/9UFJDI87kXlTbIRw0vtpLa1VWIWGtiV/0Y8OnA?=
 =?us-ascii?Q?9ZwlZZlvEcqcuhczv+L3ioorT/33rv6msDJoOy68nwVO7CI//qAN8NVViMuQ?=
 =?us-ascii?Q?96x2nKjV23W2mIL+ECttkjhQnTlwZk8auKYRU2nMdy/SOH4y1vv9eeA2d3aY?=
 =?us-ascii?Q?HQgcOxu2O4AtuWOUozYES44fioZhm1S9Pzixo/IGktnYNP9lzgcc6bz5aldp?=
 =?us-ascii?Q?9ymyRjRmuecjuF5l+ITumsbmjJU77viGZSBs0JxAPDWkpq8ex/XyC/odOQ7l?=
 =?us-ascii?Q?K8P0EyWZ3tafY/rMTGh7yyn8iSm5ZTTmqLG5frnzUQsZw0MQR8fm56/u381x?=
 =?us-ascii?Q?fxtSeYlUNvxMn1ItVnmvIrmgs1X12J1AroUHpRhQSulrLV65gpVd9xrSrQw9?=
 =?us-ascii?Q?i7d418q+1fsKriJ858VR4JegJiau8Rc3Bope9lXGjdJpSaSA5My1pS6y8LJu?=
 =?us-ascii?Q?TfTu8K82ztjfT9SrjFe9VlI5im9s1Rh+crz2ARj94sKI58n05iohJvDI1zax?=
 =?us-ascii?Q?tnoxtWPrHSk8HMXvDajJczzz+3TawBZfkUG3Ydi7LlmojWxhz8CU/kQ+1A7E?=
 =?us-ascii?Q?Zg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fee7be18-01ed-4902-d138-08dbeb885fb1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 18:25:15.7914 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e191UhMzLx9c8q3whXHJjpHFAtfy91gxSHs/oI2j0ouS9iE3Z4SG63Ae2VQPKPo8cBzUwYLK+aa+JZ2L6Vmu5Zv0i46kQK+QKqtLAm7TlZQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8307
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/xe2: Add workaround 16021867713
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

On Wed, Nov 22, 2023 at 04:28:54PM +0530, Tejas Upadhyay wrote:
> This workaround applies to Xe2_LPM as well
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

This workaround isn't finalized yet, although it looks like it's
trending to match what you've implemented below.  Assuming the
workaround eventually becomes official without any changes,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_wa.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 6572715dfc09..473f1d0bc14b 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -273,6 +273,15 @@ static const struct xe_rtp_entry_sr gt_was[] = {
>  			 SET(XEHPC_L3CLOS_MASK(3), ~0))
>  	},
>  
> +	/* Xe2_LPM */
> +
> +	{ XE_RTP_NAME("16021867713"),
> +	  XE_RTP_RULES(MEDIA_VERSION(2000),
> +		       ENGINE_CLASS(VIDEO_DECODE)),
> +	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F1C(0), MFXPIPE_CLKGATE_DIS)),
> +	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
> +	},
> +
>  	{}
>  };
>  
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
