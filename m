Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C9F4C48260
	for <intel-xe@archiver.kernel.org>; Tue, 13 Feb 2024 22:28:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54CA410E249;
	Tue, 13 Feb 2024 22:28:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="efvgqcr0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B31B610E249
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Feb 2024 22:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707863293; x=1739399293;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9N2N6uVaI6YlqmX/hlwZXQTnROrUr5q9K7hyf0w/IEI=;
 b=efvgqcr0BvVb9kWo21PsT9Y0Sj+4SPkVmQ2Ay9VCSky6+GkxXEME4M4w
 pESjE9Pk0Cp2dyvNLF29p7baoQNsFgcbUJ5oWH4lhwKU8nyCsXvwMhVYU
 MhxPIxDGynNCQpHZhf/+gGfHMuBe0pTKnmeLzTTX+fsUoDDgwRim8r+8v
 y2jPhCY3w4pMzKH2prOrbGObDIC6wF23OndPw1bgTpkLLuoLz/QS+izUp
 CP5JEnM9SjwqGTL0mTrzxVL++lkIwLBvF0HEM2rzfdFRAJiRZjERn/i+o
 8rtpRwYp485RpkvO0YIysZUYXWOBFZVtJdUxVlEo2mX2QFW6EWodXL9Rn g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="1769478"
X-IronPort-AV: E=Sophos;i="6.06,158,1705392000"; 
   d="scan'208";a="1769478"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 14:28:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,158,1705392000"; 
   d="scan'208";a="7591309"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Feb 2024 14:28:12 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 13 Feb 2024 14:28:11 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 13 Feb 2024 14:28:11 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 13 Feb 2024 14:28:11 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 13 Feb 2024 14:28:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JLapboyKs4iMDVKRlg+Q6vP1LppXzKm/g5ArLrlb3qZMnpMqqLrYe+AwQGslwLwd1ctzVIKZhTICKVu4vivH9r5ouEbBEwEQGWLyrnR1lLRccEc/3CKhZr97hjptcdFyeu+JEUrO8Mf8FDk4zPNhd523icPX1vcW4cI0TFP+VRmPm23UvSTsWuKXYiWKCOqOgIA7g48JIbLaZr6KgT4ZkW3VuQum9vPXTCYT01lFKequhNtXIgyvAETfdq/Fic9+klJ3E//XgNsJi1Hj6fzo5Gm2dO1wZj9lMpL/Aeh4gZOlFOWnePBOv9+X38za+vPoZt4vxm48/FH9M5QVIi6pTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4IVcWgg7oj4ZM3ReElWi5J5ulgAdaIy55CC3c777lf0=;
 b=n5as/+tAZCcNNcnfsAwjc1aAGpkrSx0fHe9eYYhzkpRmB0BX9Jwzq3+KQnlYWDMZ2PCFN2b3Z9DFFW3mW361kfGS4aHOMBcAggYsT/MAAV2rEaQlvhFqY2X8QvufkbhDvQOYi61IWlAJ13YuXRScYNSAop9B62RRWVLbQpQyTaBoD0RA9mbq44d53gDHVEqCPZBWGWhLHMxD/CbE9AZLmegYIc4J9fE88TcQqEQFDmy2XoEBzpYVqZzVLOqXnUJ0apT2E6OqwAsW3GU7GakxcsVNwx0YJRdpMDcqyff1mK0f18GGi2hqYG7NQ+chRkOxHgzDBRLqy5aObn4BI0kHKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ1PR11MB6154.namprd11.prod.outlook.com (2603:10b6:a03:45f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39; Tue, 13 Feb
 2024 22:28:05 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7270.036; Tue, 13 Feb 2024
 22:28:05 +0000
Date: Tue, 13 Feb 2024 17:28:02 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH 1/3] drm/xe: Allow vram bo allocations aligned to 64K
Message-ID: <Zcvs8gIiqOV2RHl0@intel.com>
References: <20240213212418.1309-1-michal.wajdeczko@intel.com>
 <20240213212418.1309-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240213212418.1309-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR05CA0012.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::25) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ1PR11MB6154:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a2601ab-0bb2-4ee1-641c-08dc2ce30c28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 37Pa0V85ZqzD6V4KZcpWJ+hvNIdpcMDCjl04XLHMYGSp5AgTWhwZ8Ayv6wLJTunk207Ws0cApsNbqbgpkuouEZsAMIiYpV680Zs6bMiqKj/MBC2rTKT6VF+ARjH4oB5+/g/9zO/LSWOGDxVJHkMY9JgvYnyb98Wn4oIohDjE8YpIWndaVpD87nIfK4hnPxRl6FDJtWx2T/K4iqYhGa8f1aFPCqA/avi5tw73uN9Sn3IYNTNaKcJTiJyxz3oagABwixLzabjn/tvXQ+mS/JQYA4o0TTuTPPs9Grocbo767MYOapkdhwmjvRiBJ3NlKzjs3jXp470ijIrwim40gWtMuE6N3aqnUNm6Fg3Y72PoAUZ+nJdMtoUwLgaGxmHc6CZChbuYLJs8Bbs+MwB7LWcWiYxXKqFN+Mgg6sK8ON9NZX6IPBv36YoES9q5fIpTpFwC2xAd4NRK/Y634PyWh/tfJHF0BujSgakbTtEsizs1jGjnuvdhd6iY6v9/OLfQW9DLyGl8cgQo0caFmTSNWynY4tKqmyi8T2bEaNBQEpH1JPdejn/Jc6ie2gCcxpzZEZPJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(376002)(346002)(136003)(396003)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(2906002)(5660300002)(44832011)(8936002)(4326008)(8676002)(6862004)(83380400001)(2616005)(86362001)(26005)(36756003)(38100700002)(82960400001)(66556008)(6506007)(316002)(66946007)(66476007)(6636002)(107886003)(37006003)(6666004)(6512007)(478600001)(6486002)(41300700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?t3KMLkMhmwh1UGndxuVqgz1JzgMEoVwTjhhmwHOvoYt/fjMmTR0m36QZYqow?=
 =?us-ascii?Q?MAOioxmUfOIeOgxS8ey28gzqcckdTYs6PvWwybur2cMaFeLfNriLXelVa52F?=
 =?us-ascii?Q?DS15VYa5Jrg3bYTfsp5pRui8NESm8jk1sOsXqP6uKq1q2JhaVUcMOWASyvch?=
 =?us-ascii?Q?58yMAE6KUFznLyQ+DQTS7aRi/GWFDHs7z2CGGcXwpIo9ZS2EabcOt9Bm0M5Y?=
 =?us-ascii?Q?+6g3vVxUUIzi2b6HzHw6cUlF2ZQcSI6ajoCIIG+DjwrPkhN6Ju8TIxgcWlgO?=
 =?us-ascii?Q?fRgYDZiGKJvSy7w3etHOMpkrFHS3bFapePxau51G137BPcDwwvmXVsKUMnTs?=
 =?us-ascii?Q?dLKmbgrrTTMrcfDNBqb6r8y1w2LPZ/5xw+2PKF0fEOXqy04EKqU6eFs97e0d?=
 =?us-ascii?Q?B/nD6qNXe0r0/lG8c44raG2iTEE8aVKVK7dz2W+UlqlSiAVyxHzeRkQegeBS?=
 =?us-ascii?Q?hnsHIS0ZpeC5b9u9qr9NmuyhQfG9ch3/kS6QLIZzfCK7nCuw4e5QgRbPTG89?=
 =?us-ascii?Q?pOHttQn43Bcd8OSNNrnRzKFB/2SCixHHFSggP68tmwionotFzWGuEyloo5XR?=
 =?us-ascii?Q?Iq8vTc5WhpYQeckXNVfgdzM6rYOHLDx7IkUXNZ6JkNs5tGnh//3u6RYMzD9J?=
 =?us-ascii?Q?UDIzHIn7WuAs6ceQ3b4assJs7tqnLfn0bRqpQ6E9eijq36DED1XKEBxiZnQK?=
 =?us-ascii?Q?BEhYD2n6UIkdJmggfqtxaofzmGXHA2ZXszH9QCEOqxFtCfWXF+inA8K0Epms?=
 =?us-ascii?Q?tXGdXg5CBGgrKJX+ElCPCh/ecCslA1DPKriHSmeJ5fuDZulWMRAno7V23tGk?=
 =?us-ascii?Q?p6hWcGppYXr+NQ7JIf23DyXaYB9xPs39fuZquVhsrQuAhmirWOLBzlQ3eR+d?=
 =?us-ascii?Q?b6lADuEs2C5ohrxznmzkDkePz5iU4AsUD/nzloHAAxR0VBm3M/MyAchM6ou3?=
 =?us-ascii?Q?5W14Ufv4ukK61bqdJLBBcFzG9oi2Zv2Qdr7j/TbWn10n6FdkADgR3yllABlO?=
 =?us-ascii?Q?OX47yb/OEunAeont1VbwC8Fg+NDabNSxQ1/5NAOEG0uXTTdlvrfgbNEgjqj2?=
 =?us-ascii?Q?08l35unLtD+0wlCkUMtuu8Lf016wH91yS3Sc7nSSghczptEA1i9fPPt3yEuO?=
 =?us-ascii?Q?KAiJpDtIMlkm3YrufeDT3Y2Qi8WBsxAJQuGFM9H1ILfaNvJ7MIauryyT0eHx?=
 =?us-ascii?Q?eEo03QxqVZxZhdieLeJ5kQHR4Pys2cc7TZBKuKzBmPEvTv8NydDt0xEly/0M?=
 =?us-ascii?Q?QCMc0u5rXeNH7WuGYNvzCI6C/NJUGRlM03CXi6SJbcyOQiAQCpSvf5MpaCAZ?=
 =?us-ascii?Q?zZtwLxLyPiemKbC/+rTIprwShr4AQqV8djT8lwPT4OU10arZYmkFlFURYEAb?=
 =?us-ascii?Q?cetlXB7tAgekUJgq/Ja5Ff7Q8P8bNeJOuz7yI5l86YqiC1VZL2xXeFZ1GXeb?=
 =?us-ascii?Q?WftsthyWn/pJ3KtUATy/lHkso6N3KT0Q8nrFMeG6/fDO4SnXYr/iyBZZp+Bs?=
 =?us-ascii?Q?+b1wHl9scO+5rFBOfIqFDrh5hfn63FPBPvmnQM/ioWEhPEJLfa1uCD7y0/pN?=
 =?us-ascii?Q?y1MqQA8cF1e4SLL6qlTIxNaqsiA1iVxl+8GwsCAE2hlV1GiUoYgOtmwx3w+B?=
 =?us-ascii?Q?sw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a2601ab-0bb2-4ee1-641c-08dc2ce30c28
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2024 22:28:05.5790 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4W7nh9UqGgNjMv6tuAPSn0uJBfX3zAHr1M68t4okfVC+VY8VYK1WiWRnHS+9Q3fBXNbJ0oCJO30qUhVcIpLd0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6154
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

On Tue, Feb 13, 2024 at 10:24:16PM +0100, Michal Wajdeczko wrote:
> While today we are getting vram allocations aligned to 64K as the
> XE_VRAM_FLAGS_NEED64K flag could be set, we shouldn't only rely on
> that flag and we should also allow caller to specify required 64K
> alignment explicitly.  Define new XE_BO_NEEDS_64K flag for that.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_bo.c | 3 ++-
>  drivers/gpu/drm/xe/xe_bo.h | 1 +
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index d6a193060cc0..9da8bf506ab0 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1256,7 +1256,8 @@ struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
>  
>  	if (flags & (XE_BO_CREATE_VRAM_MASK | XE_BO_CREATE_STOLEN_BIT) &&
>  	    !(flags & XE_BO_CREATE_IGNORE_MIN_PAGE_SIZE_BIT) &&
> -	    xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K) {
> +	    ((xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K) ||
> +	     (flags & XE_BO_NEEDS_64K))) {
>  		aligned_size = ALIGN(size, SZ_64K);
>  		if (type != ttm_bo_type_device)
>  			size = ALIGN(size, SZ_64K);
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index db4b2db6b073..657399b90429 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -45,6 +45,7 @@
>  #define XE_BO_PAGETABLE			BIT(12)
>  #define XE_BO_NEEDS_CPU_ACCESS		BIT(13)
>  #define XE_BO_NEEDS_UC			BIT(14)
> +#define XE_BO_NEEDS_64K			BIT(15)
>  /* this one is trigger internally only */
>  #define XE_BO_INTERNAL_TEST		BIT(30)
>  #define XE_BO_INTERNAL_64K		BIT(31)
> -- 
> 2.43.0
> 
