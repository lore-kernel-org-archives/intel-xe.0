Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C731CC001B0
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jul 2023 16:39:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7695E10E49B;
	Wed, 26 Jul 2023 16:39:38 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D85610E49D
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jul 2023 16:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690389577; x=1721925577;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2sDbaQdkX2BpQkIxRyouoZ4cNWwqJDb/PJQxiUM0dX4=;
 b=Klle8oaIspQ/GkRIyNiyW+ZIhb3HCjQ61Sg/QRNAQH9s/dzITWqLNj13
 ZOpmuiiJW8coaCYV0l9vHxeCigp2M7DRvaBGmDVHjwrwZSF6P6wzN8DP4
 w/pI63jRMobaIXdio45TKQg78Q+SlJNYOmnDFe3ULP5S/Komp/RH/chbK
 UO1XxcsMa9GhPIhDWj55aCI6T9VG5fr2wca3DKIGSfm3GKDtT2Y9u5S5R
 uwkQRdB4OLXnkAgMlsHTEd9sCv/04+smmOAjgyCZ9y0wqj5UzA65xPBGr
 vj/hLt7MLJ9E0fPddn7oecKc1DSs81yiqqKmcplCmRfqdLmCcl8KjFVlP Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="399005109"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="399005109"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 09:39:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="850526703"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="850526703"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP; 26 Jul 2023 09:39:34 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 26 Jul 2023 09:39:36 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 26 Jul 2023 09:39:35 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 26 Jul 2023 09:39:35 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 26 Jul 2023 09:39:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bG/CVyMEhh6OFGTcAXodpbIqcmbKagPetW7oUZIw16pvODaboscJUSN7KcYCM4mTiJ6gql60uiHRCvZolLHovlhzQ3zFT6QNvX0OhqSFlulYUQs4kfb1tg50ZSV+CjXQ0Ca+itEGpTZ1/RuXDSX986Oq9MvdsC6zDnPs2b+jWfrwTUyVvP8g0AqpBa2zHloJNOTGjzGygbh0MXtTautY0eIvY1MTThFuWQPshMOG1LND+yNXhKxJ1kyQJ2TLr8dQmk1KybmI5e910uxw5Cdy1lzix40BjYoZo9IC5DrKPz/LhNdb2gGHM59YrqomWzmlR/NOH7zj8wJXUQEtRk1PBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F6Lo2ZgOSKi47Ze84enz0OJqk/dQQoowUrf0qfmTB/o=;
 b=OfEpmbPWKqtxz8Ein2BQHn6d/YlokfsABnkmZKyqvDpN9ey6RB2V/Cwue2nIGiUeedTQcxBuaDL6r9XEKM2/7/u29m5Hu6ozlTrZmdHrkJCXVi/vXe55gUMoRqOO5eI+7j4EKoav98eJAFF0/C1PIW8FfRCk7s2A1F5KmvN7/3RjiuEQ3B1E1cAYwz9pDNfTSjCpQaQPwHR0mOAJUu7cM/I69pAkboAXJZLHHJ78M7TJO+W+926MQ2YpeEJm1qipFjNTM9rPILJZ7dH6sUYtI9+8GFD0SSPHxUo+lDLEydnACm/yjmk8wCGx7YDNCXZhhGc7JOkrW4RhPDZACR9CBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 DS0PR11MB7998.namprd11.prod.outlook.com (2603:10b6:8:126::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6609.33; Wed, 26 Jul 2023 16:39:33 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41%5]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 16:39:33 +0000
Date: Wed, 26 Jul 2023 09:39:30 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230726163930.GM138014@mdroper-desk1.amr.corp.intel.com>
References: <20230726160708.3967790-1-lucas.demarchi@intel.com>
 <20230726160708.3967790-4-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230726160708.3967790-4-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR11CA0098.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::39) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|DS0PR11MB7998:EE_
X-MS-Office365-Filtering-Correlation-Id: d3da90c4-e8f9-462a-3bf3-08db8df6e444
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uFZQOiPbhzZkXDHMFcxfBw4xfXLgZPZ0L3RNPXzsxBagq50YvYXxoaeIbBzRYhnkdf/ldiPQrLG760xlevdIjBSRmP1ZosdQNps1CHeUybXeE5SpSEdr10dtSfXVaoybGYuO2d8BDthphnbAKR815okgE1fDbqNoGYPNnYQSz9n87nQbInmY6pjhwHN3W4pxyxsv6y6I6OyOuPS37FmcLVKxtsA2HTLSc2SYfrWaC7wJkcsVs4TomaFiDTQavlYTsjGW3e46BpXIkrr+nYVi20vGTN7R4b3mUC4+gV7h4wNtc4vFbiO5+Kt8ry4yRktgfZ1ecSe91BsCYp9qdRd80sBPTKI8Cp44Cekebwp3MybpMqJhT+CXuuICTbpurY/n8p1kYD5O490LOw+ZSHdrpvnQLsmC6ZY1c7tr+kTRIDb2pt5CvGBi0dmJZ7jo0V/27f7ygOQ0sZG0TCToEX+s8PE8Ni+qeBWGBkV3o4HjQtSY2R2X5Sh6ELbsNa5UzDi/jHnwynvZAqyjIu4c9wX4mvBCJ2cyVryR1cWTyulx8YIEKyQq+O2rPVmldWgOlaqL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(136003)(39860400002)(376002)(366004)(396003)(451199021)(86362001)(33656002)(82960400001)(478600001)(54906003)(2906002)(38100700002)(26005)(186003)(1076003)(6506007)(41300700001)(6862004)(5660300002)(6512007)(6486002)(316002)(66556008)(8676002)(83380400001)(4326008)(66476007)(6636002)(66946007)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?URgdndfTOwqkkGf+arA3Fq8mxx3pWGcQndw89VkmsU70p+/Pt5oPFzg8Esjp?=
 =?us-ascii?Q?RUkpesBIWYMQonauXl+b3Un2CZ0b9j+iimtIjWO4MRt3MHwjsaGEenSn5wZp?=
 =?us-ascii?Q?WwQM2+xS0l0VnOXnA+SCbEvT8kGwTqN4kZ32mahcExo018km4KTv2V3vVF56?=
 =?us-ascii?Q?A7GLJkplqbrvZ7YPcVFCrUEzAjewco9oP1otNwwY0zMeg0ot3hVTD3z8k7Te?=
 =?us-ascii?Q?CcvYjrWWN2cLTD5oChF7QNpcTEU5lhzqDywqHat5fq8Hx/3xa33h0gxWMPGo?=
 =?us-ascii?Q?0nSv24sMM16Anz+hy8S216MAWYOg/qCEs3LKBvEo6nGTER9r/5pjDtHT5UW8?=
 =?us-ascii?Q?7k3ccGALFA05mr8A64sdJoCvQcp/qg8cGuGUtIiOt2uF3vDu85MQTCoffuI2?=
 =?us-ascii?Q?pCgert7rHm84olseK1gi+VSDcwql6IWr/oX1Zz9CARWkaKoKGlhR9fiIvGiE?=
 =?us-ascii?Q?A0cfCrNNvuxr9EQMe5VMq16MGKveFSX0QQyQFtKEU2HrBSH11X9+sYR2EYox?=
 =?us-ascii?Q?el62ZtnpYdfWeNDP2dJkvqIJ5/TpE4N7mdsvnjIl578O5TsqdT7B28m626Hu?=
 =?us-ascii?Q?JaJfwK2QXq0ymP3jOPybt4L2C0lqbVi6O5aMhRZmEWNhso36+SxNxmulAolp?=
 =?us-ascii?Q?EFGgz5lMKJq/6KpwXanXH2lJnmqLeABlJkquLvaZjS2HwAbwIDBJ1NQ7EbA0?=
 =?us-ascii?Q?LCF2Tx/mu5JrQLDF3KmK7Q1pkDoscviYqMk5vGKC075IjZNR0S4X+gqE6itr?=
 =?us-ascii?Q?LFNzuO0RBe6Pg+k7EcIMMrq02fcxlmIE+3Hn259VQNCpPkdyuTv730rZCLlA?=
 =?us-ascii?Q?txl4FVnmEPB0+gqrZDh8MyS/lILf3fLVn6datv2iNaC0eUOdvH3uAGSqn7pr?=
 =?us-ascii?Q?FQEImMUJqnNhFOeQHK63RNVMxXIJWCKk2uClTuiOXWA9p60jlwh6ANuqHAIj?=
 =?us-ascii?Q?bn4ffbfY++1/2ZZizKYocpocyJB6K98FFalGSHABETvghKev0VUSiu0TiGKZ?=
 =?us-ascii?Q?rz/vi77sx+rO2baaSosqU6DUcv856PqXHUs+W5ZCacxaEVxHLiAnMuJkRadK?=
 =?us-ascii?Q?wV+y89vkl7tFJKqkFKaYG6Ox00G/EdnK1EjBJB8ssDmE8FT600TvpvgU0Ves?=
 =?us-ascii?Q?Y3h2V79aPzuT0NVEsgHNp3xFpAAJnFhEclWVhs1W7LEz/uEDLCL1aD4CtRD4?=
 =?us-ascii?Q?60BlX98hGJTJD+MiQ92HVrwAuAIY1ksM9GKI8hgzwhTo+67gTbyWrcVj81yx?=
 =?us-ascii?Q?jZojiGW+M7JoXYqKMcKUW74uSt/LIYS0/ypA2B0EfnwNFMAb5XflCtkYOdyR?=
 =?us-ascii?Q?GtNC0IRP/tRznqRrbkSJ6J1krMpI8u9iOwT6LdI8c5CUfBNbkaW8Twi+iOim?=
 =?us-ascii?Q?1YKZYUogxcRbV/1uTmnOSJB12Mb4UlLwIZdZTO6HMPgpU6p+n8tFoqlVFauU?=
 =?us-ascii?Q?cJsN1iJJ4v2tz13H0tWJbxt8P03pHWfJ9gqa+WjxnGj+p0EXqddIMzQeEf/i?=
 =?us-ascii?Q?eg7hZ9MBFkodJhCnOhq6tNZ00B6vZz5jGqywV7nadqvbWquKQrsudcxdRjvf?=
 =?us-ascii?Q?R+3Y9s0KXpF+deYaRW+ljxSayg8J0HscVub0Qi/rDFx81Hemn54DHqgMzgYr?=
 =?us-ascii?Q?VQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d3da90c4-e8f9-462a-3bf3-08db8df6e444
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 16:39:33.5800 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tlP0vFhWKv+Czn6JpneKhB8gR/2W5VPSb8nkDeclm5Hb2U96h4sfvUv3wlW6GbyZbtl7BxOW93gcdLUI2+k7BpifGYIdr9hyp/+HlBap4b8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7998
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 03/10] drm/xe: Fix checking for unset value
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
Cc: intel-xe@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Jul 26, 2023 at 09:07:01AM -0700, Lucas De Marchi wrote:
> Commit 0f885eced0a8 ("drm/xe: NULL binding implementation") introduced
> the NULL binding implementation, but left a case in which the out value
> is_vram is not set and the caller will use whatever was on stack.
> Eventually the is_vram out could be removed, but this should at least
> fix the current bug.
> 
> Fixes: 0f885eced0a8 ("drm/xe: NULL binding implementation")
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_pt.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index d4660520ac2c..d5a237b7c883 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -81,8 +81,10 @@ u64 xe_pde_encode(struct xe_bo *bo, u64 bo_offset,
>  static dma_addr_t vma_addr(struct xe_vma *vma, u64 offset,
>  			   size_t page_size, bool *is_vram)
>  {
> -	if (xe_vma_is_null(vma))
> +	if (xe_vma_is_null(vma)) {
> +		*is_vram = 0;
>  		return 0;
> +	}
>  
>  	if (xe_vma_is_userptr(vma)) {
>  		struct xe_res_cursor cur;
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
