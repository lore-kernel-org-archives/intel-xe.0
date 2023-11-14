Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 517E7C4332F
	for <intel-xe@archiver.kernel.org>; Tue, 14 Nov 2023 13:44:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2716A10E443;
	Tue, 14 Nov 2023 13:44:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFEFB10E443
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Nov 2023 13:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699969488; x=1731505488;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+GdPbYGyjBLlmipZWvooCDjNCzoxi82sGK/RNlirOVo=;
 b=Ipw28U3SzcJP1TnUp1KtACToeZ8t8O0x+M5+dsA/9IEJnMFfex1oRPlf
 dig4/6GxtxAI24rH8CztKm97HBQj4hzwLl8uIXZDxgO2Y457qYAFQQrRV
 t//ZCXky6lzi0N8PMgPUmiGYlyJCzBnFCzchv4uxD5e1D1TbU2WSSyMbT
 U0JEkyB/dUOUeoiZlm0f38vqGBF2jb53kllfKgHuANZxLMx6sS4YGntpc
 fg0CLNcDhB2UT+MnQb702D6jh/g/Y0U9q8W+qfrtCMh2K7ON0lwMzM4Hf
 thME3rABRgNQVLv2oFeEVAcK6TVfpEvnHLnpbDHHUx2kd4Z0Z0IYQ8WEW w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="457149955"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="457149955"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 05:44:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="882058474"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="882058474"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2023 05:44:47 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 05:44:46 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 14 Nov 2023 05:44:46 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 14 Nov 2023 05:44:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=du5XxKlcmDmKnbryWLprwOu8Yk7Q2eiLLQ7Q+WHs80U3x28JUf9jf6rzFfOuiAxdt3nn0sJ164vwwOq1h93+7Z67wZF/q8Ha9pBJFFuw+CqImpjoFROQfxyeBYcgHsr4q2oREvX0vNtLwTRYlfIhXVR7ncKSxBWTQEwDrMwubvNINmD7i0GQ5D2+E0zQWdjkxqhmn6GCzw+UhqpZ6H+V0hZQ8hGPuzOyluy66zAwoA32X2TsaQLKpOk/G6pAaFwWrzNoP+T8rclQVKP146/lM1ntmsU3e0j2fSpAgWlYgMgu3EV6MbqYEGv1n35DrrM+WmcjcV2gcOWjYQbXCxh61g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RaQN4P+wSpNAFjyh7jDTj5CHVcyvtFrH6y1SlzXdco8=;
 b=LebMJAxFBc4dk7zDEt1N1MEATPfVVQcSawDdEzLAerxXSM5Mg6ZdpulmYRm2UqwdGhi7944PLork/WZaOTf69EWONjN29zopccKMaHU3o6QY5vqdeyFX6LwVZsxJACtuem2g/wRCNiaX6vh7LVpe1n1TdXW95lANq4XZqmkth+Fm6CH5Ppi33xQiOjF0kDJPMAaU28M8+mktyJohcCspMOptt5rFLc7KWfvVUOqXn68tR9bo+8NqbI5ayXlYzKERkDA54b3IR2C7tsnoiEG5YHdXysBklIIlezEXxgX0qTiWJx2ExjeFb74Qc3sw+cgLoQ2j6CgiNMUAsYXnMWhHpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS0PR11MB8072.namprd11.prod.outlook.com (2603:10b6:8:12f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.17; Tue, 14 Nov
 2023 13:44:45 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7002.015; Tue, 14 Nov 2023
 13:44:45 +0000
Date: Tue, 14 Nov 2023 08:44:41 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <ZVN5yf9uui/B7Tbg@intel.com>
References: <20231114133434.7-1-francois.dugast@intel.com>
 <20231114133434.7-4-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231114133434.7-4-francois.dugast@intel.com>
X-ClientProxiedBy: BY5PR03CA0010.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::20) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DS0PR11MB8072:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f807ee5-b254-4941-2a50-08dbe517dc67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L6OBT0hQM5MtgUatMgv0fc269Zyj5hJZWe8/1emowTaG1ImNuPB0+np8uhyKcvo6WLkFIWDKA+vZ5r2R+suuZEm7naB0VfQAGEY8eG+QJJs1vYVXOgTVAY/nGHWAiqIbEUoH+0CLqJ8Zral2Lgy6PkxuwkOcAu2vZ++EaLUsaZ2rQzcurVbB2g17b9rzhwiZ9mPg/ODXTk0dRAZ3wcADqlEvI49kj7p8cqnken3bWpzs4kkvgVd8EREQRHT3FCfaugBIcTX5RiLOUU01yES1zLQP84AnyyZ+nWcWDiLR1gagLPhsBggX/gkTNNt+Xc8zS1JmmATja9DPtm+9ABaSnmsMUqMEqRDmouu2ho3bzW1Wmmslbi6eTHgp/L932oExhCObGQAQjWLJ8lwMmNArUjaxz1ocUUoJ2ceN6b3RJK4DabwC0pmZ05uNX0ZOrGv8lF6NT4GMmtn5zlONxkAw1eBN+HGLJ7F9I06zILf08US0tB2NunAF7MKEUXUUGHBl9Hihrwm7o1q+fY82mapBtvJQDqd5wIPdBi+FMOQPC4+HHeRBy8FmF0N1pXHzQ1p/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(396003)(376002)(366004)(346002)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(86362001)(316002)(66946007)(36756003)(66556008)(66476007)(37006003)(6636002)(8676002)(6862004)(83380400001)(8936002)(4326008)(26005)(6666004)(2906002)(41300700001)(44832011)(6512007)(2616005)(5660300002)(6506007)(82960400001)(6486002)(478600001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1wZUY6o7qhmwiG2Wp9yE5uj6XcEkxXbGuLt8fCVfKyGI2Oy7ySazh9eOOlJA?=
 =?us-ascii?Q?VfWkMsoWlb61t3n0Gw6ZZ4p44VH0m8IVfLe7A0TifImx7BASxBCDnDAhM+QD?=
 =?us-ascii?Q?mTAOoBgpabVHAkLacawWgyvwxylibKYlxMgMgpkKGXxyim/6W9iWye8u82OF?=
 =?us-ascii?Q?TccjZtL/3IPofg9pQfPQqLXpFdQWBABDofxB1NzY2/94zxUWUpaj4C2F49CD?=
 =?us-ascii?Q?iUVJjyZKnIkAA0Zih69Lqxt6hcs08iTtYOgwTY+NInDGpAn4y2R+i6QvGH9T?=
 =?us-ascii?Q?X5OkxfVyIwBca1R1YAe6TzPMHHLH20FlvpOOw8e4M66ICLflBwDTVZ9ZOP2G?=
 =?us-ascii?Q?KNpoBmDIxQ4mpb6Ez6yWaVFNsyaC98u+8JhpyJR+0xOcdmPK/7bxfeqYTqlD?=
 =?us-ascii?Q?UUD+a/KWa3/mNsDg+R6OF/5xf1yUAsmpilHzJ1MVLuiSiM8WBxoKu9o9QpUj?=
 =?us-ascii?Q?sKAWq5uYmmesaEHQ78VRNWsHQMnrixFyoRuRneWt0CdwUjkooghF0Hb+hAgX?=
 =?us-ascii?Q?nBirCgh0CahbS+UBHDVOi29W8pIBtmzrkdIRUHS6IAGT0JbEriTILMTEU4tw?=
 =?us-ascii?Q?axwWO6cKVrlHwAVOiAyB9sSH9gyOIEomazSuCZYr1L7qyxea4We03JnNgAPC?=
 =?us-ascii?Q?qEt0gXylGaFPdj6OKHzcKjSxelm6T4W5I3r5XZ//pYcFyZQf8tx+3l+IRXrz?=
 =?us-ascii?Q?zOD83SDCO9GBow7KiV2GHPT6HIMPX/NhTpEAJCyKS5rAg7GA+mAE60dNPdIu?=
 =?us-ascii?Q?wKe0ah67xbUdYDN2q/hehMCC0xrB9bS+eJ01QnplwEli/U/h30s+Yfk/0ur5?=
 =?us-ascii?Q?LqvWQdB6O55+ofa2Z+v+X4zX955taLfw9iSZ1WVfZpxpMr0pZkfgxPRpAEYw?=
 =?us-ascii?Q?H8fFfd1v8pQ0+XSgJs7h7s+s2DF17yhLZNS55kkKYVS+mp9ThPi8o6ckTPHj?=
 =?us-ascii?Q?b5mTwC4gBCMDAIsKokx488J9IZm0f0za1HjMYPfyEMPNUPXsynaeVxNPPqck?=
 =?us-ascii?Q?bay6YvRZHYxdPTqSVzivoKREEbYtJQOeR/daz1cCDR/2xfANyXysZHphdQJH?=
 =?us-ascii?Q?pihvDNR9pujzwaJmgUtwrrKWy21FR+8voOcWzZI63Yz68IlRYGBM3tc2DQiO?=
 =?us-ascii?Q?HnV1u96xysgECI2nv8L1fo0k4h4An/eePJsN8xFFXvZJZdr4WdrIS7LNBWHU?=
 =?us-ascii?Q?oNkIuhBibWnHD9V8KfnbKbx9Mp/Kd5BlYNeFVx7+vhkgL72HEv/qJV/Pb54D?=
 =?us-ascii?Q?g4wusZGD6Ofyl85yUdOQ6iSzIVywxSo8TkvR3wFRAKHUHjGXWwi/pwCAmJ58?=
 =?us-ascii?Q?44RXAfnTrOAQTl+eMkjR6QYSsCXm/H/bOUWtfA8IG/6DBwpJjJIjHCUfCZXI?=
 =?us-ascii?Q?dyAN6mJeNWqhaFcmK/YZrVOjOagT86tzL+sV/Ehe44/hIM77wQJR6OdZN6rE?=
 =?us-ascii?Q?p1nzqW7F4xsN3U6LWdQgHNC3+rCnW0SGLJ1WuRIUPD4LzpFBxqs25Q6YzClF?=
 =?us-ascii?Q?xZ5XxdHLFDRwFOORouQYnxVOOD3v+aP5XMQzELFH9cGp+49S6SOY7TTb/f8N?=
 =?us-ascii?Q?TCuPMnuC/q+AKE5mfxuhn+fA437YZodHE1zGSr+YCyi9k/iyZTL6GYdTd8o1?=
 =?us-ascii?Q?qg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f807ee5-b254-4941-2a50-08dbe517dc67
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 13:44:45.1053 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EKsBEiYcOm5Te9BOJ2ID++wupxGFcdUeSyXUfqFgFB+0a4NNdlrsfY3X+Bjbkm7NULqj+5FgpfL4sbsCrVpwyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8072
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v1 3/8] drm/xe/uapi: Change rsvd to pad in
 struct drm_xe_class_instance
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

On Tue, Nov 14, 2023 at 01:34:29PM +0000, Francois Dugast wrote:
> Change rsvd to pad in struct drm_xe_class_instance to prevent the field
> from being used in future.
> 
> v2: Change from fixup to regular commit because this touches the
>     uAPI (Francois Dugast)
> 
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_query.c | 5 ++++-
>  include/uapi/drm/xe_drm.h     | 3 ++-
>  2 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index 565a716302bb..48befd9f0812 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -215,7 +215,10 @@ static int query_engines(struct xe_device *xe,
>  				xe_to_user_engine_class[hwe->class];
>  			hw_engine_info[i].engine_instance =
>  				hwe->logical_instance;
> -			hw_engine_info[i++].gt_id = gt->info.id;
> +			hw_engine_info[i].gt_id = gt->info.id;
> +			hw_engine_info[i].pad = 0;
> +
> +			i++;
>  		}
>  
>  	if (copy_to_user(query_ptr, hw_engine_info, size)) {
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index f6346a8351e4..a8d351c9fa7c 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -141,7 +141,8 @@ struct drm_xe_engine_class_instance {
>  
>  	__u16 engine_instance;
>  	__u16 gt_id;
> -	__u16 rsvd;
> +	/** @pad: MBZ */
> +	__u16 pad;
>  };
>  
>  /**
> -- 
> 2.34.1
> 
