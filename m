Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6E12C4828C
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jan 2024 17:30:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06F1A1132CB;
	Tue, 30 Jan 2024 17:30:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 786841133D7
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Jan 2024 17:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706635824; x=1738171824;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=BAA57Pwqo2R1ru2zPHzId1KUCleZ8aOsy5ytvgiZNc8=;
 b=Plz/QnqqJ8dO0VT+ohd8eVpguv4FRrIgbZp0Eja7ZswekyugGZbKszJk
 2sLs4B8zi2qq25YykafC5zyQAPVXjpXV9uhy3WZiCnxwV2BfvZDNernvp
 9EwlcbRj6U+JAW7jzKGdcJPzOmclUjlPEZfKft7X1akNcrh5uksbR6lQP
 6eWHttLRYL1nUGZiIA5PpheATywwyF27xN2m0IhzJ/Qj5+Zw+pzSdi6rP
 Iywzc+LtZnKISjbHQcO0OB3a1Mr3pZufBCcI3BQrAvqr9+fMugxWmPc8h
 PDE/4o8vYJSGAgMRGz98enw+IMYF7KGPp6z++0l4Uf3br9i6J18s8735k Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="434515042"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; d="scan'208";a="434515042"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2024 09:11:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="878515861"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; d="scan'208";a="878515861"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jan 2024 09:11:27 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Jan 2024 09:11:26 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Jan 2024 09:11:26 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 30 Jan 2024 09:11:26 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 30 Jan 2024 09:11:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cd3Bi9O4NR8eMuy6aTQpycR/k4vXI/gHYvNvIO4LkJakhgI17hpLFmM5EXJc9j6YgVh9C/QhIA7kEOJQFsI7XIvS9hZmSRlrAiAzKBzFDVHV+nt0ayF6ULa80X+nUIRQMhiS1CKiy+Hb/Z1C0ZGkPa6kjZWyk1XlzVVkkx/QxQxRstTW+MVrY5H6dzE+IyOjttbD9/+gKHRZ+naJkrHaFRV8CApO62j1UzvfAQb690hebAY6u11bxD1knWTvfhkAhjQwh1Z92E+V30ygYzlHGiCssdUNBzA0Oy4D3WuXeaff9C8KG7sBUPLZ6/nMamjeJGucB8yKi5x3W25s2GrwKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0CtSHJS0Ub30zzV8fz8OU2q2p8vUDn40rzTB/foctr0=;
 b=JSz7frSAc4lo15zDiaFSvWOKUUA8X/wxIVKhSCtaBZ1VjR9jiyWwTFr/q4KOAF4AuMBd0IBWXhMaDRESvx5yHhc6tzjup8v7lzLuEVrF3M6U2XKOkRqqCGLBM8PqkyVYuTmgpwBPEUSgj5SjlbyfMkGLgHbV6rlpTMueuygkAxS75HHt+AHXpmSlVib7l5sCMEJiqJrEH4vu4WQb6ZuQv1kKNopp99loGRcSLV7DxHd2WN4KUIEhLiDtqwtop55sFUZS2db6EQ0moVD1sZivDB8CYjXYa3pp48iVHGuZ+JbFLhav5HXltDuNc7ur8ind7Dqod2pD+EUsFAn0q9uJEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB6043.namprd11.prod.outlook.com (2603:10b6:8:62::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7249.22; Tue, 30 Jan 2024 17:11:23 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7228.028; Tue, 30 Jan 2024
 17:11:22 +0000
Date: Tue, 30 Jan 2024 17:11:00 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 2/5] drm/xe/ggtt: Use ioread64 to dereference ggtt::gsm
Message-ID: <ZbktpAoNbeApS+xy@DUT025-TGLU.fm.intel.com>
References: <20240117134048.165425-1-thomas.hellstrom@linux.intel.com>
 <20240117134048.165425-3-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240117134048.165425-3-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0243.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::8) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB6043:EE_
X-MS-Office365-Filtering-Correlation-Id: b8c21781-d902-44b7-010d-08dc21b67bc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BRv5JHMHTDMxU9JJwjLxhtDntk5sX8RtnFuol81b6Vy71cqLXUltxFBJZCRxr4q2l5oXH6kNe8s3bQ3SbO8v8GBPBebtAQ6352nhJM13G04aUjXn5RL6oxdNo8xBjeg8fT41irdpPdKF74pKZR4ih0C2bJIN+1O/eojs4Sgwd1flg/bFfp2Dnz0gPOP0HPtAY4w3YbEEGE9bmfGdnch7caMPx/lMedhj/ZwwqAjiFs8YvGF5nAjebd614oK5OYPVh+iIzi095fX7NdTOFD6KjL9QvCgNlC3O3FhxDhloNnTv31Tpvw+dWcXDQ8BcODyUJ8/CALm5t3YYRkKn+pouvvlMsTqtPWMD7B8MfWFW30mFLMHy43MkamIpdwyoP7L94wFId14aknJH1oMBUBcLkf2h5BcdPyz/2ggzqu2/lWO2WHhDqwDMzN45X47UdSe1XyfPyCR/Zjqa+xVBmnT5TQV9NGIY9MFf9+sha6ZFO71u5Iz1vSQU6Egk1QJ0bIaN4XrRqkFkekKLYMXl/zRK3IqGkGUTNnuw/H+orRNi8IuEWyQZclMHEQ70CYQKXl4sIXY6iwjb/MMaPvBMB8mw6/0vmAFyWjsryld9TY9u7R7eoxeDLDurQAH0RNQwqrR6rpskc8mjecBDueGITT/nzw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(136003)(39860400002)(376002)(396003)(230173577357003)(230273577357003)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(82960400001)(38100700002)(83380400001)(2906002)(26005)(66574015)(5660300002)(6512007)(6666004)(6506007)(44832011)(478600001)(6486002)(86362001)(41300700001)(8936002)(6916009)(4326008)(8676002)(316002)(66476007)(66556008)(66946007)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?b8nT8CBvTNL0NIXC3Ssknj/F7vzt1y3nMNey7gbcHs1fXH3eYm72ysdphc?=
 =?iso-8859-1?Q?tmovRNkANFwEtk8ww6PQtbOgDds2ngbg6nr0W3FliwA0uchW+j+pmOc90w?=
 =?iso-8859-1?Q?37xhdlbixBPWTV2jXk2iojmjSt2HqEk3hYDw8cTGOkllbwd27MLS0x3jL2?=
 =?iso-8859-1?Q?DYZUyES6v+TPxJRNWu1yLhwg7Zhpt9J8x5/3nGnrf+52URckFKm05kOyl+?=
 =?iso-8859-1?Q?9YMJP5YB3TvCe9pCEuj3sUvAXBjNRzLJwVMPCMM4Dxr2gHNF2AiWChBqI4?=
 =?iso-8859-1?Q?Rw592xp5y9vabmpUUOnG9E0UOGSjLhLF4/vb3EjAkJsyz3G9o2aX2cs+YU?=
 =?iso-8859-1?Q?XicOxnLKmI6Ai7RtKU8Wbju52NVEzR5l3AsEQuEVGq+qkie6Uf0ycUv+qj?=
 =?iso-8859-1?Q?EbxP6wV7KkLSYdQd9EQ7itZrXlCxULqntsWSX0UbKLR3q4Iii4GRfIbKEf?=
 =?iso-8859-1?Q?D2fyeLViLyN9e+b9BBtglHmz3Ki3KnW4tpQ56GJXOrP/KvnAI3BVaK31Lg?=
 =?iso-8859-1?Q?+0MCpaTPzqSml3jTKHdEJ8qQWt9u+6cB6xB0rMmRwF6aejSfelC79y9aVx?=
 =?iso-8859-1?Q?6UKvCxWOQlckRpi21cahYWP2/qQCGF4k3hJUGowDHz8nur276jrjHbQwsM?=
 =?iso-8859-1?Q?u4hG0LwyUEiMzz5f4qeA03KtLeXt45iumQMaz7r5VunyrN/t01YPqpl23X?=
 =?iso-8859-1?Q?dxK3ikHdfRy11Lf7EF+0o1Ck0jcqLWCbkjVV1RN7BjpthnZDRFKMpStSnT?=
 =?iso-8859-1?Q?zNcBVJjAx8mDki1qX0Q5cRQVKYShkxVp3GiOJ93lC4o30XeG7phUT4XyH/?=
 =?iso-8859-1?Q?b0QahA+/IOfR8kpH4/Db1UTtYTphY+ZblEMCYSa/bhbabIhu8AaV5IoYjL?=
 =?iso-8859-1?Q?mujnpqgcOPfAta9L8p7ijqCTZa6xDDqGi5DWcWhTX27WaDceZ1nJg6c0Vq?=
 =?iso-8859-1?Q?ilYUGOBpecSUmq8PiMcEUf6EVXQm6zXG+IyhUoRFni3R1lm1Aq1gyTmZbd?=
 =?iso-8859-1?Q?Nfj1vpKqXo938v+15WrcCQllZCAWGtp40TsSKATt7Qg+RTEcNyTzGBDkvy?=
 =?iso-8859-1?Q?JN88Jqdjdh8yweH/w20iYwXoTXU7YBEiIg9wEwRzXhr4gWr4GWeVU9JCu7?=
 =?iso-8859-1?Q?bBfKxJOh7ROBzk17huIw1SBbW/ToRRMLGoic00XJZeYcy1WoakaWO0wd/i?=
 =?iso-8859-1?Q?wrIJzSNOrni6Xah6eiM5IzB2gwAtdOhZnA9sdRzWz6drMON09A2xhJLiK3?=
 =?iso-8859-1?Q?GaU7qJDGq9fcy5CDx5U9WpQOgjNTKGVOfJIKsk0Z15u0t5XcyxbjQLsG8b?=
 =?iso-8859-1?Q?6eXyLE6848gPQgZG1GlenjB4HPsg2+9DbbSKj9IUQxe4Injx8t4wYPp74b?=
 =?iso-8859-1?Q?Inlez/XAJPDgdHEF+Bo+1f1ADA6p+QTdl16lzIypTkcOltunovbCFy3Drk?=
 =?iso-8859-1?Q?RoG4Av+VBeWWmRl41z3GhhELUiw83rrFWzF+cbf1UYFQEepv2qAlTFPTGy?=
 =?iso-8859-1?Q?Gb2IpjFkbNMwUJyxbFf6vbdmesE3rBggftp0sJBZHIHx0Fp/MK1p/MJ51o?=
 =?iso-8859-1?Q?mRNaQfji8lxilmn9N8EoCPkRRJXImfHZV7PIHoJr+2ak0BOn/yucppPGCp?=
 =?iso-8859-1?Q?Bu36aEVwQwiaDQ22kJZVCX440tFsvfIOAZyGO7kDPiRyd6BSaSfr9shA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b8c21781-d902-44b7-010d-08dc21b67bc1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2024 17:11:22.5016 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KqIsWGRlfU624MqmNK9MFwxR6iOq6TBgJxD3JFL2AXqSSc/VakyGRic3xdVXdmGsGuc8ZooUsc/z3Lz7sVXQrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6043
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Jan 17, 2024 at 02:40:45PM +0100, Thomas Hellström wrote:
> The pointer is an __iomem pointer.
> Silence the sparse warning.
> 
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

This patch itself LGTM but wondering if we need also need a fixup for
the below code?

 73 void xe_ggtt_set_pte(struct xe_ggtt *ggtt, u64 addr, u64 pte)
 74 {
 75         xe_tile_assert(ggtt->tile, !(addr & XE_PTE_MASK));
 76         xe_tile_assert(ggtt->tile, addr < ggtt->size);
 77
 78         writeq(pte, &ggtt->gsm[addr >> XE_PTE_SHIFT]);
 79 }

With:
s/writeq(pte, &ggtt->gsm[addr >> XE_PTE_SHIFT])/iowrite64(pte, gtt->gsm + (addr >> XE_PTE_SHIFT)/ 

Anyways as I said this patch LGTM, with that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_ggtt.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 6fdf830678b3..305f414b9b65 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -307,11 +307,11 @@ void xe_ggtt_printk(struct xe_ggtt *ggtt, const char *prefix)
>  		unsigned int i = addr / XE_PAGE_SIZE;
>  
>  		xe_tile_assert(ggtt->tile, addr <= U32_MAX);
> -		if (ggtt->gsm[i] == scratch_pte)
> +		if (ioread64(ggtt->gsm + i) == scratch_pte)
>  			continue;
>  
>  		printk("%s    ggtt[0x%08x] = 0x%016llx",
> -		       prefix, (u32)addr, ggtt->gsm[i]);
> +		       prefix, (u32)addr, ioread64(ggtt->gsm + i));
>  	}
>  }
>  
> -- 
> 2.43.0
> 
