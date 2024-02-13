Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E941C48260
	for <intel-xe@archiver.kernel.org>; Tue, 13 Feb 2024 21:29:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27DD110E4E7;
	Tue, 13 Feb 2024 21:29:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C+XRRt3F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00F9E10E393
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Feb 2024 21:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707859743; x=1739395743;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=BKx0ksJSHLEKErKpTkaHJkuhfQQUlNEy+YRR6axOCb8=;
 b=C+XRRt3F+9iemY2usj2HWUlHUB6dNR/VB/d/Sl7Wi16IfdTXUGSbecpT
 28gvvDHFMxM2OmLPEMFc/pK/wAfAaakTDzPpUci5iZtMkl+Xw5xVpCDeW
 gV4vXpFWkwl9Ih1JDgHF+6d43Qyu23g5QugzmSYMVr5O55TGcGq07wX82
 BizM/vZp2UptjmBO1VKgaQZvVSqAy1BgAHrmnHRec4oRP4ECJU8+JXEXF
 qtmfBLjNBWSL+sYU2dr+xkPZ9+rlr18Cxv55zqnN9AKD4LwOLuuy3b0JE
 MRK+hI6zuEJCXwwNllxAQcUs7TH1eN0mBhzl7idBzRUKib6H6aplinhz1 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="2036598"
X-IronPort-AV: E=Sophos;i="6.06,158,1705392000"; 
   d="scan'208";a="2036598"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 13:29:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="935458711"
X-IronPort-AV: E=Sophos;i="6.06,158,1705392000"; d="scan'208";a="935458711"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Feb 2024 13:29:02 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 13 Feb 2024 13:29:02 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 13 Feb 2024 13:29:01 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 13 Feb 2024 13:29:01 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 13 Feb 2024 13:29:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nY1kQ+HVJHDMmBqTSkgSA9zQ5Hr5rWPluYM7sWDso47cjb4zbb4Z0OwPD7LGim511nhlrSynVIXizDwRLsP6eLRmDY3f3tfdwjm1HFoqm5KBRkn4cGSdrtwOjtOyjLj/idOnfxSIvYUbWbOulXzNZjjoUnnjK6DEEAkAYCWuHrCYCkzI10plI/SLYErbrY3trzwjnwKQYDO6CFTJWbgcINBeAcJcwXLMo7TkvfrlefTpgcM5qp//0n5l+rhmb+QzQCn1e691PQXbswDv1QMVo+42UqWImgFJjDz6ooI9Uo6TaYTPOm/ZHjQgMZ0+S/JygbZDI6/dmn7irhFwfTSMzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1SS+o+HDNDILD73c8DGN2gTWUqH7UnVH0TkwfBcRCfA=;
 b=apUBFscICg0yg1iawBQospKH0yo7z9USFhqJVAXFggOnQ/fWioUIhmye5v62GS3of2vxfBv27q+XOLocE38KPlVjtCq/qOVfAfWpVn4/pY1AUXafoBnsa0ZnqHLE01vo04jazbRWsiSwBjjZSiIpUz27f5SJFaDI+vhbmVNJ+WO5/KXCQu1J8dMCuQ2DfaI3dtWLJ57cX05InvH8fO+/G8n6sYRXzpF6KS6SpdcLtPcqgku+HGIHcEk2z9q/Lhnj4gVcxTcaMY7daV76Qv6j0IxBc9KS2yDD/WQqxczPcF0mhqoN+r6nLevoMg4oDXr/4tYIeOOmgX55UeD2GbBdaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS0PR11MB7849.namprd11.prod.outlook.com (2603:10b6:8:fd::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39; Tue, 13 Feb
 2024 21:28:59 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7270.036; Tue, 13 Feb 2024
 21:28:59 +0000
Date: Tue, 13 Feb 2024 16:28:55 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
CC: <intel-xe@lists.freedesktop.org>, John Harrison
 <John.C.Harrison@intel.com>, Francois Dugast <francois.dugast@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH v2 2/2] drm/xe: Extend uAPI to query HuC micro-controler
 firmware version
Message-ID: <ZcvfF5lxLmF7BlVK@intel.com>
References: <20240208183539.185095-1-jose.souza@intel.com>
 <20240208183539.185095-2-jose.souza@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240208183539.185095-2-jose.souza@intel.com>
X-ClientProxiedBy: SJ0PR05CA0095.namprd05.prod.outlook.com
 (2603:10b6:a03:334::10) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DS0PR11MB7849:EE_
X-MS-Office365-Filtering-Correlation-Id: cdbfe57e-c652-43ef-bf4a-08dc2cdaca8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AWf/vPwqNvw7CXWqIiHEqWXM1k3dt4iQooqoNtk8U5xo9keM8dN4Of7BqVJPw+ubndM7uCbmSSdLFdJ3spgKcwcHDnfoVsmIG38a5OcrvXL4I/X2EZ6jXrgt+/Hjyb3hz4ESocB7bY0m9LYHYB20i/Obzg96mcw9LLwfP33kNE1BOmbxbNjvY7nFqrhFmlsCZ1Iu/OIS60DbZgyfOJ/fb0e16aRJeC+GMYIBaU+vhpi6GcYRRlydV31bUxV9Vn6o7yAbGlqSAmU5+NCdWx5NQghAXEdAxwKwdMk1ONtgJld1Qxz3C3yYTyCzvrcd8GyTVkt09WL9LUsOEYie+ZyQoskVd8902hEuUTxMimCFWOlUJ0M3jUmNudl7BejFci8UHmA78yVgIhlGfHL6CoOg4e6af4Hk0duJRTgGqP5Cd15K3L9on1BM33eRwocM+2g/Kdz3YghhOeRtZ7ooQJEqQs79S/kukfZSTP7iBLBiW3fq7qEsH3KFvuBj0s+SlhG9bcdgh/B3o0xBbHUEJl8acNnWL0P4cZcxvviq3hQ58kerqXdT6EAf1Fyj/uU69k5J
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(39860400002)(366004)(346002)(376002)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(8936002)(8676002)(66556008)(44832011)(66476007)(66946007)(5660300002)(2906002)(4326008)(6862004)(107886003)(36756003)(83380400001)(86362001)(82960400001)(38100700002)(316002)(478600001)(37006003)(6636002)(54906003)(6512007)(6506007)(6666004)(6486002)(2616005)(26005)(41300700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?JF7ZRoz6DTcIQ5YGn/Jfo730cPi35eTgHdT2BldoMemxjOiRws0rgt8aey?=
 =?iso-8859-1?Q?Lu2BLOF6CeU+6Fci2tGb7n6eovERZbhlnqXkTjKlw6JqGEf67x9vfSvZ1o?=
 =?iso-8859-1?Q?2Z+LAzSJ/ECwV1duD5cXY/Uw/IYw8B0qefy+YQ2dCwuIK+dJtCkyW/D010?=
 =?iso-8859-1?Q?iBZBdLlzL3RzvaMheI9cqRoy9fsXPcBraN1HoWouW8XxeQdHC+8xGo+/SQ?=
 =?iso-8859-1?Q?Nb+rnBUXerA1GS4HulIhOcd2fBqliOQrfo26AsxNYqqJpaLnKItldHLUnO?=
 =?iso-8859-1?Q?oNV8V3hf+5T/9AvVuDgZt9zNsfNl+9JP73EGL05rU5mzeSvseO0MLcObsz?=
 =?iso-8859-1?Q?Roy/LsD6zYIWrnwS1EcsH8Kvj9f87Jm0DNQs2e0nFsDqFjtAF0vwEIgqJx?=
 =?iso-8859-1?Q?xXE0MBa2LYFosZtMJVW6ytQUiUOdHUuRb3bfQMQgVoX4JnM/x+aCA3PtaA?=
 =?iso-8859-1?Q?I7SyQkRr2PlUPKS8dkcYgy2vuclBj7GAzb2wM7hnYfWjKWgsESogE7Omj8?=
 =?iso-8859-1?Q?zpIR882trzmZgsOP7JKwQ5aNHGhtD7N3TpZN8stBJOh2C6oF8eyNrgHoaK?=
 =?iso-8859-1?Q?u8CtWV/16lbdGd/AiDwxue2sPo3tlbYULGVGnbMzRqMA+sFCER25uklazO?=
 =?iso-8859-1?Q?utxgcSUryAcAsh168qlQQUhYu24Z6TbqGlnRq1YuKsHklKsVbPUIJnDTvC?=
 =?iso-8859-1?Q?uFX5wMO7eC3cZwIqEtsjTMyphUxW3xJS1B5u4wcOzUiuTO9ixshXAHerGa?=
 =?iso-8859-1?Q?aNVaiKsLpmCuHHXyApNIk56GgZDn9+9tOCnBJ+vcWhL4XdkEaH5MGZP5jD?=
 =?iso-8859-1?Q?08tcS+karBDYTsEqdOdu7L/YygiWNjO4PNhZr31NC2DiVtugpQzh3tX8qG?=
 =?iso-8859-1?Q?tJMbpl3lrJBo4bX+/oTe8hwcIPx0repQBwNYrMG/i0fwFcz1S62lH+Eqlp?=
 =?iso-8859-1?Q?SZLQcdEY+nyMoUTrzYX25UGoYDnJtz5s8nDI89F2MCiktVu2Y5NOgLt7OD?=
 =?iso-8859-1?Q?ZZ45q7Z2dyOoW/AVgvoXw6bYDJ9VNeApiZpv93Upl6f8d6K5fJW/zhwwQa?=
 =?iso-8859-1?Q?i/AmQn21Bu7+DZcrHtv3ub8wG/IEVFt7Wc6j0LRsoHQ36uCWrvmpzJH9Gl?=
 =?iso-8859-1?Q?OhWnjZjf9h6KmTjz5oxDTyTvl1C7061Yjdndu6k8ErorL67lq3GV6gxGuJ?=
 =?iso-8859-1?Q?WgxlXuYkTc8470iyaSc5cXwvpAa8sweTQTz/Msc84/XI1f5D8xaqRk44sY?=
 =?iso-8859-1?Q?LIDsE6/vUQhDX8Wa22dqQlZgsYXnQ+d9wjoqStVD0XdXBE/oGV9X7Rl777?=
 =?iso-8859-1?Q?fRq4Ap0kzmS90EqCj/7qsvpoMghyg0swoLI/JSST29iAnx621VgDWwtTR7?=
 =?iso-8859-1?Q?VVzl5Yk+Bro0w9SAZ3/Xi5URn+Z5sp48y7eRDA7oKIhK8Hy+TYZPZ4Fz/S?=
 =?iso-8859-1?Q?Qd/m8XCikiL17sgbGP0+QwMMqggyBwZPtAcBP0Tt73iMiUV3P77yJszr63?=
 =?iso-8859-1?Q?vY93mGMPWcyAxBMmIXqOXGeC/nfm6NgRCbP67KyaWETfhOi+Ki7IXkLI5F?=
 =?iso-8859-1?Q?RN3c1ZRZk6IOaPOrr//qN9olH71ple/fsgVgaXA66s90STBsNJYAEyh5ST?=
 =?iso-8859-1?Q?CZKtImM+vLZwZ3duOE3exe+JCjAEHR8pTUeRggMn/GuLubimDXu46+pg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cdbfe57e-c652-43ef-bf4a-08dc2cdaca8c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2024 21:28:59.5520 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8DKFT84Uf5R2Ha01oqjBwsBSTw3D4xPfsSaV5Bj0OVuoOPR8wehhRRH0Pd6paFl4TAhRG7uybj6ILsWeaZnGCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7849
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

On Thu, Feb 08, 2024 at 10:35:39AM -0800, José Roberto de Souza wrote:
> From: Francois Dugast <francois.dugast@intel.com>
> 
> The infrastructure to query GuC firmware version is already in place. It
> is extended with a new micro-controller type to query the HuC firmware
> version. It can be used from user space to know if HuC is running.
> 
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>

to merge this we need to wait for the media to be ready and using this.
But for the patch itself:

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_query.c | 38 +++++++++++++++++++++++++++++++----
>  include/uapi/drm/xe_drm.h     |  1 +
>  2 files changed, 35 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index 92bb06c0586eb..7855d04e032f2 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -544,14 +544,44 @@ query_uc_fw_version(struct xe_device *xe, struct drm_xe_device_query *query)
>  		version = &guc->fw.versions.found[XE_UC_FW_VER_COMPATIBILITY];
>  		break;
>  	}
> +	case XE_QUERY_UC_TYPE_HUC: {
> +		struct xe_gt *media_gt = NULL;
> +		struct xe_huc *huc;
> +
> +		if (MEDIA_VER(xe) >= 13) {
> +			struct xe_tile *tile;
> +			u8 gt_id;
> +
> +			for_each_tile(tile, xe, gt_id) {
> +				if (tile->media_gt) {
> +					media_gt = tile->media_gt;
> +					break;
> +				}
> +			}
> +		} else {
> +			media_gt = xe->tiles[0].primary_gt;
> +		}
> +
> +		if (!media_gt)
> +			break;
> +
> +		huc = &media_gt->uc.huc;
> +		if (huc->fw.status == XE_UC_FIRMWARE_RUNNING)
> +			version = &huc->fw.versions.found[XE_UC_FW_VER_RELEASE];
> +		break;
> +	}
>  	default:
>  		return -EINVAL;
>  	}
>  
> -	resp.branch_ver = 0;
> -	resp.major_ver = version->major;
> -	resp.minor_ver = version->minor;
> -	resp.patch_ver = version->patch;
> +	if (version) {
> +		resp.branch_ver = 0;
> +		resp.major_ver = version->major;
> +		resp.minor_ver = version->minor;
> +		resp.patch_ver = version->patch;
> +	} else {
> +		return -ENODEV;
> +	}
>  
>  	if (copy_to_user(query_ptr, &resp, size))
>  		return -EFAULT;
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 0819959a52227..03d12b8f33744 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -583,6 +583,7 @@ struct drm_xe_query_engine_cycles {
>  struct drm_xe_query_uc_fw_version {
>  	/** @uc_type: The micro-controller type to query firmware version */
>  #define XE_QUERY_UC_TYPE_GUC_SUBMISSION 0
> +#define XE_QUERY_UC_TYPE_HUC 1
>  	__u16 uc_type;
>  
>  	/** @pad: MBZ */
> -- 
> 2.43.0
> 
