Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 930AED3C92A
	for <intel-xe@archiver.kernel.org>; Sun, 20 Oct 2024 18:17:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 463D210E021;
	Sun, 20 Oct 2024 18:17:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ixquOHvN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95FA110E021
 for <intel-xe@lists.freedesktop.org>; Sun, 20 Oct 2024 18:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729448240; x=1760984240;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zHPdHuSMJJWjpq+lxJV5J1bRQ2204DDXz6owjxA7QuU=;
 b=ixquOHvNgkVGaQunmbxMcQZ/R1N7g5+UbC4rkU9TQPZIqBql8UeMvncE
 476PmBDF2bSe2xqN3BucekSijnAljdKXb+VLLtmF+EM1ZAN+0TKe6/RVp
 jTN+P48E8Hj4dr7NBtDi0FtFukVE3MLObsnuAB0/r8nCnce+4Ib7fOAha
 aHxSRn4DDNLk6Zyc6bpb/RfMn+jQHTTZ11pzeAiiibFI54223P9Ijt8i4
 GpzoHWlx/4ep/8yXKtdBKl5uLW2n28YqmjVnidSlJYyNMVjxwysS2Pmtq
 Bqs9794ZMuXdwfFhubEaps4y+G9/yJY+oShEsrhY8tucJfMSHNku9yVLI g==;
X-CSE-ConnectionGUID: wTgugD4oRcS/plKd6SQxYw==
X-CSE-MsgGUID: vmPM/jR2SV239zOGUnnlZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29044652"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="29044652"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2024 11:17:20 -0700
X-CSE-ConnectionGUID: WFgLozUaRv2NDLEETVOdHg==
X-CSE-MsgGUID: aL9fKENCTRi2YbYVWNMfGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,219,1725346800"; d="scan'208";a="79333606"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Oct 2024 11:17:20 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 20 Oct 2024 11:17:19 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 20 Oct 2024 11:17:19 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 20 Oct 2024 11:17:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MDYPsgfynYLttdismOi6sxf3wpDQxOuvSgrfWn4PAG+vvrZ7jfKZQap3iiggQ1qXw0ahmlrGL2uDH3EtR7pN3kCsVxEHNAFc5OzQNcl5z0tRNfFq63WKOpfA1aAvGTA+HiWHVoqZmFUrgSVOCBEhxw2BUjp+5bOy7nU1IsyEJ5+k/62OOGBAY9HfALJ1TFcDSp4CpQ/GWCfNyL41ssm28DgBB8xbUFTi6Z2xzVX8YS53JxBRIrRaVzE+h8tB2hB0t2YAouHX0G84qypGlT5RSFUjWRmaugeIuwktlVWIFm1vpV1OP8Ng+e8A3c9hgfd7HMYvqYtiM6eoDgPoM3hEyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M0JvqEX4/0JG9Xh/3A/8ubvsG8A3RnQfhbHSCvHWz1g=;
 b=OlYq0HAKtUM/9hcJfnYqLdQIOzK0j/oeRSN9OrGXvXCfLyj1zIMk/hlxzRJnMJv6etfHp9u4kaw8QYSusTYUIOuZra+2uxHfV/3ZbBBBF2LD9TrBIVdsm6B2PB5bAOr1xX9MUA+cAyYSiLVNNauogOeKOLV40BbppsfQa28VP4X21XKFEYkEYlxn2Xi8YrsAcJpcWX+NtRE3rO2W81AludANIWEam/PTcOcRovVQXVA2f/l9qHXP7Rqn9SGjtZ8gFz/mQ7VznILMF2vvfltbLKw8vLiQM+fU2FUcyRLtR3q9XWrNZCZVx+oBERKGrlgv9KQNDKxaCZGyx+DMD8zI3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by DS7PR11MB7929.namprd11.prod.outlook.com (2603:10b6:8:e5::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8069.26; Sun, 20 Oct 2024 18:17:17 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%3]) with mapi id 15.20.8069.024; Sun, 20 Oct 2024
 18:17:17 +0000
Date: Sun, 20 Oct 2024 18:16:16 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Maciej Patelczyk <maciej.patelczyk@intel.com>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>
Subject: Re: [PATCH 12/18] drm/xe/eudebug: implement userptr_vma access
Message-ID: <ZxVI8IpkcgAq7PRx@DUT025-TGLU.fm.intel.com>
References: <20241001144306.1991001-1-mika.kuoppala@linux.intel.com>
 <20241001144306.1991001-13-mika.kuoppala@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241001144306.1991001-13-mika.kuoppala@linux.intel.com>
X-ClientProxiedBy: BYAPR07CA0065.namprd07.prod.outlook.com
 (2603:10b6:a03:60::42) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|DS7PR11MB7929:EE_
X-MS-Office365-Filtering-Correlation-Id: bcf40c76-2d77-47f7-6839-08dcf1336e26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eoO3+NiIOZG3GfGcwoI7Y0ZXySGJDlybj1ytcptT9iTC76FST8/cCW1Vi+qv?=
 =?us-ascii?Q?k1Hv3ioyDQymKoqvdRqHm59IV1sGP3Dt10wt0RZOoCtma0GWIvjLJ/F+qYG6?=
 =?us-ascii?Q?9Qy2fUTDIoFM33F6RDbqsCdu/5f8gepClAvoFICsSPdtKOukkmuquAHUVB6f?=
 =?us-ascii?Q?lN1lrOF+QgEcgfDLdqxIxxnErUY0V0tpBHEjm79btt0dmfTH2Y9VSauFXr1/?=
 =?us-ascii?Q?7BOebI0h0Mu6Iymc3WPFGP5s76BPSgDJllphzWjhEGNFA6uNuEdKzEBVkouC?=
 =?us-ascii?Q?I1f98b64E8yFYxAB1iOE1HjgArb906UEIV5CYgASxeUDLVQLpdvkqIJe3d2c?=
 =?us-ascii?Q?UUzuFJbYpQ5JEUCMh+NAt4UN0WA/kOxWTzgs6gp6OL6Hc6La4LZYlQvmRRvY?=
 =?us-ascii?Q?ZsZmy7S+/cp8ZJkPlkcNg/iNlmaAFKbvVNa4/ZuWJMBej7Dwy52m5X5zBxz6?=
 =?us-ascii?Q?gvircg7UJ/9fQlFTbAqsliBOl+9XY9n4KcfPza3SxeZlpm12GW1YVhJ9uuyK?=
 =?us-ascii?Q?cKUbq816uQuUebyd8s5Ndswd8Ig05JVZ1QMCNM4p4AHFk+YlAof7bfsj81qi?=
 =?us-ascii?Q?YkAOBjz5dM2qv++D38Ta49h3qBh09Fmgwsgm/2GRRO5EydkgrpAfbp+0OtHo?=
 =?us-ascii?Q?mVVZNa5MRgRIG0SbJlMR7kIPynnYKS5M2OXhrXaU9//detozO49XuZG6Z4u9?=
 =?us-ascii?Q?7Mga3U+T6ar9nkrFGR7bEqnQIYLN1gh2He2us+PXd5TdLZ+SrBu7BYdBd2ko?=
 =?us-ascii?Q?i77Qk92PTUisBtdUj1DJeorOgSzmZ9+YK/rWKJIMSErvJAM/V/6JBjyPtJ2g?=
 =?us-ascii?Q?5d/lMNliDk2R77yE7Y0oQW8x6mo748wpKkxMmFk3kFY0+WJNSXDSW/xWKkrq?=
 =?us-ascii?Q?lt3qSZ2PVpFYl3OF2Wty22rXVwr+TYYoyFwdOo6OnmCqxmKCyWk3xQFSFrdM?=
 =?us-ascii?Q?Xw31cMNcWu2p8YL6G6d6S2Q3hcgZbrSNrhQ7FsHwep7L7hlBvcGai92E/eUC?=
 =?us-ascii?Q?4NtuC9QuGU0Ld3wpSR0ep+BLqjMj7g3zVbRUQbslLTnlSGupMRwFygkpMGwg?=
 =?us-ascii?Q?g+Xxvvq2yZLQ2EDpmgsZcY4LXIO7FY5l3zMtoQwlco5UuU8SrPgjqyAz0zWf?=
 =?us-ascii?Q?O5Z2ZlNEZMsyyGxaqAvnHSnnyeTYUuK109oA23XVEw93KPsCy08AsU/PgKVr?=
 =?us-ascii?Q?suu/kPdk4inPtv1hpaTyuUMgmLbViRmcaq6Sj1HbjXEwgdRMxwiDs4ibiAsN?=
 =?us-ascii?Q?u6WWo/v/geUzriSVxTb4IAoZ+450cN3G3/9bS11ZGURi4ClyivS8mCwaIzNm?=
 =?us-ascii?Q?7VcTthvlGluLR4dFUM4lg/iz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7+sj2f5sz2HsYz5xVXBIflrH6TNbFUDH5I/9Vhh5mvEQCJgwih1NwrR3b11V?=
 =?us-ascii?Q?MCIOf898Bu8T0US+0+TDXhLQttrVhtkvBVZnqXEGzVycrOxdHyKKlGF9izr+?=
 =?us-ascii?Q?2cW0fyEUTvF4TDtwARyEk1/OrflFvSSwyZ4SdLOyRI3PDGHq5BRliwedD/yC?=
 =?us-ascii?Q?5QKhSYtF+3TiSuU0uwAe0f4TZk0x3ZgIFmDt15jFUAKpJPz+Vqqn5Yq80YJW?=
 =?us-ascii?Q?5pVGDjnJM9dfxX3yOU8nhLEsOrW2vaJuIZmAsUn96qBf9vnMTg4jMfQrpua2?=
 =?us-ascii?Q?Nz7shOrmCe8X1bjdbqe0y/TfopM/t8pGjLu/6qghP8Gtx2KqRN9UQKShUg46?=
 =?us-ascii?Q?ND2RWCbqNOLivHkZrP2gXkdT5EAXALtERYrGc+fsZx6BZl9Lao2xnREf5okO?=
 =?us-ascii?Q?5xwF08zdIkSbRvmDkNdDiM7cCtmdo1GftZbZ/RFYMdtjQ1qD83JPCLcJOJAR?=
 =?us-ascii?Q?6AYOTViEqnz8pELBJSTUIZUnRtOcg5+6HK+ob4X/ervMaM0urRHRfo0rTnVe?=
 =?us-ascii?Q?vJUwK6ymYvoY79Fh8X9ZtSanOuXQ3+hhvuNieSs5nPcgb0cCT+6Xy/4gzgbr?=
 =?us-ascii?Q?89Dag4m1LkpaspKyB5ptLOotb+iSy6FlFLhBj5execnAdNR6wnouHwr5vGA0?=
 =?us-ascii?Q?1ooIs0vkbfEuo/MwevF7ow3NNuLbEVdvUtfPVvARUsdsPmLKo6taP05ED/RV?=
 =?us-ascii?Q?1L+R4kfoAyPMWT6WQ/OHM/yhYuME3xGnqByDVudwAR7OyPFlElbLWZT9bSh6?=
 =?us-ascii?Q?Dh1gwfUm9J5LGld7NnEPWQOA+rzD9+wkFktc9usPDLn9eCa4ESgWfnPBzMw7?=
 =?us-ascii?Q?wl4sYynOExU1RYEW9FL6QxWaIOy9/I/oIxo2eibISq6g1SbPpKorKRN3Q87m?=
 =?us-ascii?Q?yVc/5nWywAWvTKS8plzr+EE3i1jdObrjI8XDVyFGR41FW7jq5Ant1ODkFmX/?=
 =?us-ascii?Q?KOqIRL5/rmgDr1uFdTgDXsQ514pOZZf8XLrod+vn9pkks1fUfP7MhnF8wY+u?=
 =?us-ascii?Q?+JiwxJdK7BYV3MO9D0/e2QMxoKZTgbALI1L+aO+InFFmv2JH9cJxU0ucK5nr?=
 =?us-ascii?Q?avbmZij0VuBHZds5KVqxBSwRwZz8XcGwzklLZu94ihz5gUWQD6Qxn7+7CkQT?=
 =?us-ascii?Q?nBtKqpKGAG6HQPC9+4P+2q6s0BA0OAwRw1GuHscPiB+3eoi3LZWkSIZ7WtDM?=
 =?us-ascii?Q?2GNgWNyfurwmKpB+2KcXrMYZfLeesu6m5mWAXdTyLjx4BbHBAl8z53qQdqy3?=
 =?us-ascii?Q?qG4IhPcp63olJXXOI3C8J11z23DVtUS1AFL5J9q5Ct/NZ+34OBQCNY3JB6D2?=
 =?us-ascii?Q?jhHrH2j9rbNx+K0m5wbCyQi7xgkUTPBZpL70ylo2ca3gJrpEYGLemnisymq4?=
 =?us-ascii?Q?yUT+vJI4DEwPLOE44es1g6sSifBkjJ2nXWXgw+eQ/+gig8zTSZl3Dio0vr2W?=
 =?us-ascii?Q?CNQuIoV1sulcb3FeSiNPWdXZYZzsRSKQug0dN7HeLUcE2fu/uW8EnJEWV0O4?=
 =?us-ascii?Q?LxxsNokLqE3FRcVAzAxe8oeD6IE/hON+Hup33dDqm5UqhkJuQXVKhFcp1yiD?=
 =?us-ascii?Q?qpDVK9WiOltg9PUrSz9fJZk86bZv/p9zJfT8ONFoxkLLtbyVHkY6t/yuTzsl?=
 =?us-ascii?Q?mA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bcf40c76-2d77-47f7-6839-08dcf1336e26
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2024 18:17:17.4672 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hGu1iKwW94IOhWNFoYhRRKBk+36Owwr+7SAB6hDuSFuQyy4T/hmznq9rm0Rua1vxwJ5olfMGPXxpm+ZKwFMzww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7929
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

On Tue, Oct 01, 2024 at 05:43:00PM +0300, Mika Kuoppala wrote:
> From: Andrzej Hajda <andrzej.hajda@intel.com>
> 
> Debugger needs to read/write program's vmas including userptr_vma.
> Since hmm_range_fault is used to pin userptr vmas, it is possible
> to map those vmas from debugger context.
> 
> v2: pin pages vs notifier, move to vm.c (Matthew)
> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_eudebug.c |  2 +-
>  drivers/gpu/drm/xe/xe_vm.c      | 47 +++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_vm.h      |  3 +++
>  3 files changed, 51 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
> index edad6d533d0b..b09d7414cfe3 100644
> --- a/drivers/gpu/drm/xe/xe_eudebug.c
> +++ b/drivers/gpu/drm/xe/xe_eudebug.c
> @@ -3023,7 +3023,7 @@ static int xe_eudebug_vma_access(struct xe_vma *vma, u64 offset,
>  		return ret;
>  	}
>  
> -	return -EINVAL;
> +	return xe_uvma_access(to_userptr_vma(vma), offset, buf, bytes, write);
>  }
>  
>  static int xe_eudebug_vm_access(struct xe_vm *vm, u64 offset,
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index a836dfc5a86f..5f891e76993b 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3421,3 +3421,50 @@ void xe_vm_snapshot_free(struct xe_vm_snapshot *snap)
>  	}
>  	kvfree(snap);
>  }
> +
> +int xe_uvma_access(struct xe_userptr_vma *uvma, u64 offset,
> +		   void *buf, u64 len, bool write)
> +{

Maybe dump question but are we overthinking this here?

Can we just use kthread_use_mm, copy_to_user, copy_from_user?

If not then my previous comments still apply here.

Matt

> +	struct xe_vm *vm = xe_vma_vm(&uvma->vma);
> +	struct xe_userptr *up = &uvma->userptr;
> +	struct xe_res_cursor cur = {};
> +	int cur_len, ret = 0;
> +
> +	while (true) {
> +		down_read(&vm->userptr.notifier_lock);
> +		if (!xe_vma_userptr_check_repin(uvma))
> +			break;
> +
> +		spin_lock(&vm->userptr.invalidated_lock);
> +		list_del_init(&uvma->userptr.invalidate_link);
> +		spin_unlock(&vm->userptr.invalidated_lock);
> +
> +		up_read(&vm->userptr.notifier_lock);
> +		ret = xe_vma_userptr_pin_pages(uvma);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (!up->sg) {
> +		ret = -EINVAL;
> +		goto out_unlock_notifier;
> +	}
> +
> +	for (xe_res_first_sg(up->sg, offset, len, &cur); cur.remaining;
> +	     xe_res_next(&cur, cur_len)) {
> +		void *ptr = kmap_local_page(sg_page(cur.sgl)) + cur.start;
> +
> +		cur_len = min(cur.size, cur.remaining);
> +		if (write)
> +			memcpy(ptr, buf, cur_len);
> +		else
> +			memcpy(buf, ptr, cur_len);
> +		kunmap_local(ptr);
> +		buf += cur_len;
> +	}
> +	ret = len;
> +
> +out_unlock_notifier:
> +	up_read(&vm->userptr.notifier_lock);
> +	return ret;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index c864dba35e1d..99b9a9b011de 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -281,3 +281,6 @@ struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm);
>  void xe_vm_snapshot_capture_delayed(struct xe_vm_snapshot *snap);
>  void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_printer *p);
>  void xe_vm_snapshot_free(struct xe_vm_snapshot *snap);
> +
> +int xe_uvma_access(struct xe_userptr_vma *uvma, u64 offset,
> +		   void *buf, u64 len, bool write);
> -- 
> 2.34.1
> 
