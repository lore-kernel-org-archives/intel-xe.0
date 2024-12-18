Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 125D1E77184
	for <intel-xe@archiver.kernel.org>; Wed, 18 Dec 2024 03:04:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBE8010E637;
	Wed, 18 Dec 2024 03:04:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qxwhk/nG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA6A910E637
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Dec 2024 03:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734491056; x=1766027056;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/GXuc/SrDNPPG7x6StPuNgtSKxV1E5kWjOoqIH4tSG0=;
 b=Qxwhk/nG6R3shT43EUp1sabNgphdyIA4k0j+kKRTJfBFWMn9/MImoTpX
 nYmwnfdt/p7W9gl/UmjIvMdDIi7mvjqjPvOUaAopz5rYBmSdPrcEDKED0
 YEGaSq1n+n4nlaxEhE5W8Xa3UMzYWegt5tRMjeqEFOheTk/g5cWO0pI8w
 GsPYDZSbNGbD3V0pNJaoKOOfKugJlnUpZHbWxDU0hvh/ebXDEWEoRKSxH
 KPZuwxk4d/N/zRtA/faElJLA3F+D4eoihkiuCJno96pV/MWEOv0GiynG8
 Y+Xq0BdF/9Ab8IkacztjcUxVrZnjJcVy+ZezWTMhq+9bcKJOVm7AEPCR2 Q==;
X-CSE-ConnectionGUID: K3nLDWMbQ8WwVeyckPPt3g==
X-CSE-MsgGUID: dFptnvVsReqN4AxJKDJGPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="22538037"
X-IronPort-AV: E=Sophos;i="6.12,243,1728975600"; d="scan'208";a="22538037"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 19:04:15 -0800
X-CSE-ConnectionGUID: CZIvB4CFTpKJ5mXtuJ+zHQ==
X-CSE-MsgGUID: ZLx2OrLxT7u3RWMmH6rVOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,243,1728975600"; d="scan'208";a="97584448"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Dec 2024 19:04:15 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 17 Dec 2024 19:04:14 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 17 Dec 2024 19:04:14 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 17 Dec 2024 19:04:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D+dlPoW+52ryipP8t1ayuOGQPbqtVaIo+TfpFp+zPn3YvvQK3cC3dlm3AyMp0oT1gbCfpXL91AJYiuwT3O87T1qkJb1shy8jumxq07DPsvKmspcLH7SdwsQP+WqugB0LEM/SDxDD7NplqBAkkTM4HOIcx/o1KEzUo6qAotzhXsH24SX/A4LwiywX3/fP+9LzkM+2LtQXhOUmy1+Mt+wbY7yypGfTWX9r1mP1fGL5hunwOp6InUkbbJ/2gwg/33vhtG5MPQhj9o//Em3WsAGTH7hoIDIO/P2YobKFUkbCbmK6HyXHw4TztexA0gwiwBkpoWO+Wixb5gBydH1cTw2MAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MA1AqynAVH9645hVHjyRUwyT+vL1c2v0W9hOQ1es3Eg=;
 b=p1DgFA5aRryFUM6eXmEzrZNdHsRf0D/HF8TY82bojHGS1+8OLFHj+RO4ObN6txNlf1jYY7BzwgguMXKloyqtwaMsuFo6V/6X2z6r4AuzlNGj+j84QzTAPRXf/w3+G31mibt4ZwVIg7EhekoYuqEQJtubfLDLedvTEu1ufhTxyKsl0WCr2SZmtWBErefHudVJdjDhBahPBf/eKodhKsAu6uRCodD0FQYKb1AW3eISr1f32LV7LvOvNR/9o2oiOvENnKmSImLeOd33VuGYPqud0CvtUf/qBCoItusk6oaMEo+kRYZFG7QKlr4ScEFwprpKDt1TJcIdfck/ZdawahQGOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB7119.namprd11.prod.outlook.com (2603:10b6:510:215::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Wed, 18 Dec
 2024 03:03:58 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8251.015; Wed, 18 Dec 2024
 03:03:58 +0000
Date: Tue, 17 Dec 2024 19:04:41 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Oak Zeng <oak.zeng@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <Thomas.Hellstrom@linux.intel.com>,
 <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 2/3] drm/xe: Print vm flags in xe_vm trace print
Message-ID: <Z2I7ycwlr+pIeC5n@lstrano-desk.jf.intel.com>
References: <20241217231420.2361302-1-oak.zeng@intel.com>
 <20241217231420.2361302-3-oak.zeng@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241217231420.2361302-3-oak.zeng@intel.com>
X-ClientProxiedBy: MW3PR05CA0029.namprd05.prod.outlook.com
 (2603:10b6:303:2b::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB7119:EE_
X-MS-Office365-Filtering-Correlation-Id: 03accac1-005a-424e-2ea5-08dd1f109d7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nYWfhWtRZxMZMdw2c8d1ngUVPGah7ziwy4Me2zVuJmC2hlfRKWRIrjwPvKP5?=
 =?us-ascii?Q?7qjl1jn2GrmzIUH75CUsDs+PfolnzHihHehaoUMGpBkROA3t89hUUU2KLR+Z?=
 =?us-ascii?Q?YmPkM/j3A2Wac3Cb9qe6XHERpY86RClzRZUkp5qgjQ7m5Mbv7ZZjuS4j7k+M?=
 =?us-ascii?Q?8Q7ffDyA+9VprpaUJr/LFkQJLtBmReTDp+RO0VMEgwOCXSBCRv53Lmwem+jq?=
 =?us-ascii?Q?SB14Q00HtrlsP1tA8NTp6gTUAxf9s9hQUsayG6KU9wUB7ucDf7GE2aBcg2YJ?=
 =?us-ascii?Q?gAJs47yQJT3rS1+aQTMVPK1OVlKvqc4DwBe7cQM77tZg8bNoOLDAzpT3vcjU?=
 =?us-ascii?Q?VbxzB0tLoE5ZRfT6iZS/5qdjHfhAzJOQJukyZjy8RO2ZPvoGkH+eDbtvZrEG?=
 =?us-ascii?Q?7tGfrFEOy8zfj1J9JiipM8tVA0sP4Ev79UpyCSLIsHpeGqLnIXgsfL+p0rrU?=
 =?us-ascii?Q?BAaUzeIHgF/vvDpNswTeszsAuMWDV0alfgG3z6McUB8zmH68aFutK61xapQO?=
 =?us-ascii?Q?CNMWVelHg2lJXGPk+JXw/utFHsDUn3fl9LWjeb/YoBYrsdBUvjg9hKyKaMpJ?=
 =?us-ascii?Q?E0vffWC1HIUjd+wWt0piX40dde6upLU5LBmdS9SCW/pJOCR52YclFTsSYX17?=
 =?us-ascii?Q?Saz4kEuLfOBOpDVl2MPjhrKJWTKyrZ4p3HEtH+RcfCsd9969D/z2LGaGVC6v?=
 =?us-ascii?Q?b9DdnPUDFJJZUXrhGPUtrP13poBt6lao2U2l7RO2VB67wNSFSlyAIXaSidDR?=
 =?us-ascii?Q?QpzNaQ0out6HeKTvQa4mf9N/LNXWAT/BlHDyHueHLzqJivwuAL2eamY9Wk8e?=
 =?us-ascii?Q?1IacVjLt8WXT0B1IZmXogY9VatXsPxWzpB7aoDEWprepROXuNQCEF6eYrafa?=
 =?us-ascii?Q?nCqa8c071OKVrQR8I11Y9WK+XGTRmHpRF52rRBEIfMbdPY5hc295IA4PL/4N?=
 =?us-ascii?Q?ewRlti7mg1NzBc/WjY7/DTeOTdcnduWNp2tCvN7lV6YOG4EqtgX1pDMlR/Eq?=
 =?us-ascii?Q?uvxEqJ8dOI3dfL+FWxX0fHF/5xHAgP3gWkMFVVO1pbiFCzS+G7lJ9+TAwLfp?=
 =?us-ascii?Q?oxeFmDaUX+0bQp1+0YDig6hjae07x4GBJOTPeKKWacYmb5cNPaUpRa8opYL5?=
 =?us-ascii?Q?J+cfxngwGKv5uKuzFJYSdqgcHWiUL6/PwTrwZLJVWdzRMx2B+txqHqPW3CCp?=
 =?us-ascii?Q?S6Yls6DAl+R2MJYj9qeUtDOOPzZ9ZjfPa7Uinm51aV2+cbVnPyVR9nDRBQwe?=
 =?us-ascii?Q?IHWsOcRA/BhZp1BPF+8v4BVK1FctLiB84Il13wS8rDu597ZaNYw+YzCHiZYX?=
 =?us-ascii?Q?taGIHupXTZwCdQiBXYaDVEwXzVUiUhO//tC8JLbWozDGf5O1nrfRdopB7F5e?=
 =?us-ascii?Q?YgSdRvGbru7L6544E/P/UP6DDhp+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tzZVbks3k8kRH8rOJ8XYXs/vgF2wlyISVU8CvXj+7UmXMAokj6Ko/AxSiSdi?=
 =?us-ascii?Q?mdNoiowDe7irsFKxY4+8Edl5mneVAK1aji52puoV5EchtYWLcToyZPcP5lp5?=
 =?us-ascii?Q?81GJUsnOVXmoiQBh5uUZGz1gmCVsWwRUyF5MjxjgeWZheUQBeIzANOqjtVZp?=
 =?us-ascii?Q?C6Yw56gTpEGL/cH6XljVZB4+W2+xnYSXs692gFsfYFsPZ+A5IMleJi2HQY/T?=
 =?us-ascii?Q?jT/uyqdaYFN+z3x0psRhJVae1J2/dWX/DptzJcCM4SHDpDXyaC9odwuBYwbr?=
 =?us-ascii?Q?5T19JlEIfk4IQmjoJuyBrdQv+a1N5oyuautPeCfoniE7paT6yqBq9y6wMk1d?=
 =?us-ascii?Q?o1w8/Por3eAIbe84r95rcnlyfp5oqawL0I4TJ2hbuAcysKYjkoxh+voQbUzG?=
 =?us-ascii?Q?uERM+MVBjZJQ06kf1fueIRZNYWQPYCuyIxIHo9An6BBjjgTH2qchiU7IoRri?=
 =?us-ascii?Q?bZlcL8bXUv+Y7Ztr2tnTbTbCmUQD/stMmBQSp3mkWI/sHfRhL8HS+8dLFtwS?=
 =?us-ascii?Q?legUcAdwKucPPCCtnOEYzC/aUqAFAMBjyAuZV9qbdlJSTGMwjxaQ1HTJcxpL?=
 =?us-ascii?Q?GkqMaqJ0GgnTZzNsityJ5xZQtdS9CcHp/RY2daYbhElARBHSrKrptMzlciYf?=
 =?us-ascii?Q?OXsKy/Eyu8u9RyXxjOR7l4FS9V0txd6or9YQrDDpWwWGnwAn4BDvsvdpi7Qw?=
 =?us-ascii?Q?V8TepzVxB2Z91fwN/pDrlEFxZMTdn43ZZ69RkDS5Qv+jiCIh3uqAIFJFiZ+j?=
 =?us-ascii?Q?fYHKQ8qEa9r2IisPEACJJ3A1QNn7BiQhpZ/5Q3Eic2eQc+TOzQlbdNsbkl6b?=
 =?us-ascii?Q?e53GS1+Of/NcNSIRpTQ0A+9q58MJFAGOHX8qp1unFY7XM2OZX1GSb9OROgE0?=
 =?us-ascii?Q?mcBp4mbJg2q8vi4zN2xLVRy4STIaift6XnK313QkgXA/1v8kyZz/sanw7+7p?=
 =?us-ascii?Q?NKmKxXAjiJUrH2yf/mLoyNePDgLz7RDEqYbSdANwSYtfwGJaPCA2AGiXmmc0?=
 =?us-ascii?Q?eEighPjgV8cbXuP5Es7Bvh6oIO3o4AMuLv5Wk4e8OOb32HyjqSQanoUwBIHI?=
 =?us-ascii?Q?ILYBvbiuUwoo+tR/MiitMlDYpVK+j1zVGB73whcXato/59u3SOxupJwp5/pK?=
 =?us-ascii?Q?ZYU5G+gpjdPlNlB81p9zCl8P0wMlNNJ+cuhpiXjF2rLafRfbPdE2peGLTz99?=
 =?us-ascii?Q?tohuOAJUO2VanfLmD9lLtKQerCkvkYfV6esXLSBdFlwo8m+fHLMimcrGdmF2?=
 =?us-ascii?Q?e6rvEFX9MgFbxFvBMHIfdltliqWCRa9m6dc6nhHm+Tu2UtY1YWU/VqNItu10?=
 =?us-ascii?Q?D7Mf44zSNCIhX/hkYI16MusZQ72IGuUPY0l9G8o2rEm5SOvpceADXgVvV5h0?=
 =?us-ascii?Q?Y6WyxNko3Yb25Owys75zkhc5SXUwan7AouMqRoCdc1RZ8kZ1FOrsParOJIFx?=
 =?us-ascii?Q?C8210Vt7XGDqLh5K1Gmsguny2k4+crePR3Y3zYy2ekL02Fpt6qTb3jrl1rAR?=
 =?us-ascii?Q?E1vWkgXKyotlMEUJuU/zb5u2c9XYaejKbunv76wg9epuDqgWODOk4h0u2jLG?=
 =?us-ascii?Q?tGpeB9yFK0n+kyErT7YbJPBT83FWQlOtFfK5KzeSlxkQzIFbByHGpkkzl7j6?=
 =?us-ascii?Q?aw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 03accac1-005a-424e-2ea5-08dd1f109d7b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 03:03:58.0221 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p91yF9LaXRR4/Tu8o/g2RfWQalMOsnhdV8toQNLG4uMzDV9zeW/lSgGqaIbego4EQN/u0WdUjuj1hMXF78s4Yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7119
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

On Tue, Dec 17, 2024 at 06:14:19PM -0500, Oak Zeng wrote:
> Print vm flags in xe_vm trace print.
> 

I was told we should try to have better commit messages. Maybe add why
this useful. e.g., Flags help diagnosis the VM mode of operation.

> Signed-off-by: Oak Zeng <oak.zeng@intel.com>

With a better commit message:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_trace_bo.h | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_trace_bo.h b/drivers/gpu/drm/xe/xe_trace_bo.h
> index 53807f2ef4808..a46f7cfd92c6f 100644
> --- a/drivers/gpu/drm/xe/xe_trace_bo.h
> +++ b/drivers/gpu/drm/xe/xe_trace_bo.h
> @@ -190,16 +190,19 @@ DECLARE_EVENT_CLASS(xe_vm,
>  			     __string(dev, __dev_name_vm(vm))
>  			     __field(struct xe_vm *, vm)
>  			     __field(u32, asid)
> +			     __field(u32, flags)
>  			     ),
>  
>  		    TP_fast_assign(
>  			   __assign_str(dev);
>  			   __entry->vm = vm;
>  			   __entry->asid = vm->usm.asid;
> +			   __entry->flags = vm->flags;
>  			   ),
>  
> -		    TP_printk("dev=%s, vm=%p, asid=0x%05x", __get_str(dev),
> -			      __entry->vm, __entry->asid)
> +		    TP_printk("dev=%s, vm=%p, asid=0x%05x, vm flags=0x%05x",
> +			      __get_str(dev), __entry->vm, __entry->asid,
> +			      __entry->flags)
>  );
>  
>  DEFINE_EVENT(xe_vm, xe_vm_kill,
> -- 
> 2.26.3
> 
