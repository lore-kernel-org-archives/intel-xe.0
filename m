Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B493FC77B73
	for <intel-xe@archiver.kernel.org>; Tue, 30 May 2023 17:05:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A38010E3C5;
	Tue, 30 May 2023 17:05:22 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A66AE10E3C5
 for <intel-xe@lists.freedesktop.org>; Tue, 30 May 2023 17:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685466321; x=1717002321;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=cmWpE229uIpkEtrosnj2iTf7noW5auQBsmrtAiz7VjM=;
 b=Cr/65lZ+B1XRTWFB5UgrySRv7KDTuc0VPcB5SZbLh7fxD7FXXU4CrB3X
 P9AP87m3aJmN8C8xEG0lj9yOCUJdWKHnoUb5gjgDeWGlTPqtj9rjPjHHE
 cGGP+KxPm/23Lp8repCdBvKCfzCY0Mzi/HK2AIo1cT5d5EQ1C9hdizYu8
 czwxYr0dqSCuDOy9/3eiydiEpoBp5yh5+DITmJ5UgHWVbjWpzvL702QHO
 GQ5hhKMqo2CDDYVgo11tqfMiIxKNBdJSnE9IrXZiQUO5FdmGOJwTflIWj
 YBwn0aAiAYIh2tonArSYqeZMl5QYcilt9U5UXSw+pRPjxEGaS4BhbcQau A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="358240895"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; d="scan'208";a="358240895"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 10:04:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="656944310"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; d="scan'208";a="656944310"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP; 30 May 2023 10:04:44 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 30 May 2023 10:04:43 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 30 May 2023 10:04:43 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 30 May 2023 10:04:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tu8kKj9xEd05HS2CafaBKVdU+u3EJF+dYImB+/JwCnncFgk2ZQ0OG+Fs8vg7x+lEdePfsXgtXqu+x60EkbfNJ7OByL0wI8Lg1dndiBRSUsPJ6Ov+0LqmwP6SrkZfBBoMCwLxUnDgUA22V+6hwMxz22G0lhb8jWDINJill8olXDf5gAGzBAG4YYlWFMtvC+vEvjjvvPeNfdwof1sfE4cH60OJmtNaD2wB2zFdZtiwSw+IuXbf4acYgCIu3Tk24iCf1Y3ABhxz7pCBXnFS2XAU0Jkmzox2bMyrGiUx4aCX8iN56Oe0db0+nlBKFgCbVYfIvknOfoKiN3M9sfyM7fWr4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aOe8fZG0hA95qC7S+muXDP/ZZiNFy9fZea8YUbmFtUs=;
 b=eMBHTOkfUGViDiN2tpAjmvUhmuGcltjU9hR8hkgd5OdaUzq9vrpbOpNchdnqbXRa2g4V4gDc6+TZkB6dyO2cow2MLERx7gkIIYHf2DLx4RUJhjSUxCPjWF3jqXjnBQhvHJ/iZVAySxWHMiZFGatv62Hn3FtX9wxj10v3YfjKLHIG7JrWtg9jAz1gEag7H6/FeNYN0RNsPyUbEzq+5SmwIhqqCnxAAI0gMOQt69rKpA8m3jTkX4Y6VXqT4rN5gKVpPn8W+zbZLGXZLVKfig3CEqSWa9UbrE7TzOhs7LkF+Y4uelxZJEKhUvkeElyHwni1/E/G+Szy8OqTYZjcdvnAnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 DM4PR11MB5485.namprd11.prod.outlook.com (2603:10b6:5:388::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.22; Tue, 30 May 2023 17:04:36 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%3]) with mapi id 15.20.6455.020; Tue, 30 May 2023
 17:04:36 +0000
Date: Tue, 30 May 2023 10:04:32 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
Message-ID: <20230530170432.GS10045@mdroper-desk1.amr.corp.intel.com>
References: <20230529150831.259733-1-gustavo.sousa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230529150831.259733-1-gustavo.sousa@intel.com>
X-ClientProxiedBy: BYAPR05CA0025.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::38) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|DM4PR11MB5485:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e071295-3512-426b-2f13-08db612ff209
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M90cBAOOn6o3WUOj1hImPSCXPu8V020rwUXXliA4j0Jtcot8V1dG7W6DqLI1facbuk7rYEOzn6oaUDzcPItCRu9udhrTsNygRca3Phj/CdeKXeUDhDHO3s6bA1MaE+8Wn0vhekeVH6wIw5Nwr0BZYyDrAGdq08WNL/sKBSGilTEkgpTaAc5YuptkfXx7i/zxYWozFhbUlxgSuKNgxu6KZEWY1InQjrWX+yT01doPAAytfIcaaIymD2l+GwfKywpaR8fli6r9Jb6+8w8e40d26zHFtY/zaFtVMx6VpoIKOrysOug6kCvSPMbmtcJ33pP9pEAbQNW5svYpvwFhVSZM83tKXgJ+ovz2J2mwrwOcqBgg9jZVFkL/FptPBV3XBe3JpKhPjv6CAIFjcGX+uDgT402by6BbnAUlIZVkvugfWotOLeESX3QUZZr3PYi48Ycr9bQddH7UCTyLOxYG6IK5UQDCTq2RuQ2Gh9wfgUeSs0rpLECWcwOSjg2ZqkFHxcDOEx40IqmesIv0ZHBwkmFw8iEgcrWHmlGaZtXpxCXy+50oc1fOPDHX+GETxANWVysX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(346002)(39860400002)(396003)(136003)(366004)(451199021)(478600001)(54906003)(6862004)(5660300002)(8936002)(33656002)(2906002)(8676002)(86362001)(6636002)(66476007)(4326008)(82960400001)(66556008)(66946007)(316002)(38100700002)(41300700001)(186003)(6506007)(1076003)(6512007)(26005)(83380400001)(107886003)(6486002)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ai67bZ201VokSj1+HqAtjHmGKEorBTt9q7T2QARgQSCsx4dX6wjIjiUHSUdV?=
 =?us-ascii?Q?9RydkO3ETmdocDrQDBUBJKYgdfD+9CgF6cPRV5UcoBA6OLKXY9sKpiFwCQby?=
 =?us-ascii?Q?lNYmp4DPMbyQdSeHaue7GgrnjSNKL1NWcegporIhMamup7C+3w9RoqOLA4Wq?=
 =?us-ascii?Q?N/IaHn1mHxim06IuCKcUtlHz7MXDohshH+kae7+s+Adl0St8V7tewjsddNol?=
 =?us-ascii?Q?HA7lUCps3ilgPw2FIjNQ1YhhO9/f4nFWVz55yS4sm0f1am2wbRex+VvXzvPQ?=
 =?us-ascii?Q?5D6u8hKV+rUvhIFD4TXGd0h0fy7nnFbs9wGLCXLWCrm5SNaTsQx/xvLqqVms?=
 =?us-ascii?Q?MeA4wmTyVmdnWvaO7r4jDaQD8BLhzLtYE7tK+6Tnr/AamdRQAB/XIg1KHXmP?=
 =?us-ascii?Q?X25ETLseDH+2xIW9JCLIbHnQKqnFMH9rjs57s6hTbqGAN5a87l4HklniFgoQ?=
 =?us-ascii?Q?5qhTcvo5bLSyFj32tcwQkoB2bJWlU/fo769xIX0hYJhNPkXSEGiMqczbpALB?=
 =?us-ascii?Q?4emevFGvL2bjtuk8JsMyJ50JgPNGZoPg400OQsn221ZbWIKrXl9sEA3/hT0v?=
 =?us-ascii?Q?M3AoNRY7dhXd4cEzAbV/7dK/nM2RRwM8nBRNCbs0qo+PQyfnVe9tg2A5OWpk?=
 =?us-ascii?Q?VGYuLXRIjcLB5G8SQKtqG5xUz1bDOBFJh5AEm4dKG4irxR0rUr8NPzRYVA3k?=
 =?us-ascii?Q?4wSyTpQ/R1LDwd9kIHPhNx1zMnxVv+h62zIqW8FSYngPxRPYogE4ZwzKeJUt?=
 =?us-ascii?Q?P3eRI+phdXMMCJ68PnZ8s0ylZCCbt/YmW/gv4qwYRrBnmD3n05f965ULerjN?=
 =?us-ascii?Q?WjUlzZTmSP1ZG0cirLliZjkjRZmjjTB/VnMOwLpo95kXX8QE9V+88cBBm/2t?=
 =?us-ascii?Q?rGHrTwJ4KrEWsK8DNA1Vc5xk2IP1WrZZ6DwjUdJC7ySXPhNMavu/g2LVsBh/?=
 =?us-ascii?Q?Cthcxf0xNY2hI3fqi13dd27YfQgK2YvG3fNLRbJtlp5vtFnQCBZVDS2wA1ut?=
 =?us-ascii?Q?xB8XXLWhG5sw2l+aV6SnCx3Sz5PaW11Zo9zelI2Kkqz1ywPO2XLftCDxLBlV?=
 =?us-ascii?Q?mw7DG8vxbiMBF8LlO7m+dwtGkw7TzJ8ImCjYwoZVp4P9D1Mgz4AhWc0P66b8?=
 =?us-ascii?Q?XEPIejeFDrb2n6HYf5eBRQnmpLQA+yK5hKct2L0Z+ne+OF65bmzTKDDk2LrX?=
 =?us-ascii?Q?I+uHLcAt/FZgXGD9rMgyG3gpH2+kqwJcYPUGhj6ZtNhPO/HJZ4wqAOS7CIju?=
 =?us-ascii?Q?cBs7nbn6EZz7MsVUrfNszWBFBrMbZHNHSQUT3jq3xq1S+KSJn/F0+TrrIDbv?=
 =?us-ascii?Q?6npPx5n5Y8fKhhg+Xt5m30MpRyP1Atpu4RDWC2gr36bp9byvTLLakak7uA5r?=
 =?us-ascii?Q?lqTf3oUzWBq0hGIpGSIYLxeKAkn8SGmUZgSWsL8U7tGyY5CjgLq+mnv47ATj?=
 =?us-ascii?Q?bZzBIwJ086N1bkCqmh/H1Cn9gbG29ivKCPMYzrZUcdQf48EUIEJuXYj+57nU?=
 =?us-ascii?Q?H5aN3CUJ5uF7pLanD26xcS6rc3+ZROG6HhIyXeyIB/9GL6Vh9ESuPq6phLnH?=
 =?us-ascii?Q?HNdK2hbCflydxw63aEM1wifCFF45duaquU8AZoHj04VDFzyxeAmnTPlUKj/u?=
 =?us-ascii?Q?kg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e071295-3512-426b-2f13-08db612ff209
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 17:04:35.7654 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1s8oCraiA73QY5HNqx4aVXfybHHRcDvjNl3OQyGWgsrJ6C4EaOg6Ld7af6S+eF6pagnO6fTs9YeqzrLAPYx1Xcas+F0Z58my+w+y7SwTf5Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5485
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Replace DRM_ERROR() with drm_err()
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, May 29, 2023 at 12:08:31PM -0300, Gustavo Sousa wrote:
> DRM_ERROR() has been deprecated in favor of pr_err(). However, we should
> prefer to use drm_err() whenever possible so we get device-specific
> output with the error message.
> 
> Adding an "xe" member to struct xe_reg_sr does not seem very
> justifiable, since the only as of now is to register a clean up function
> and, with this change, print error messages. So let's just add a
> parameter to xe_reg_sr_add().
> 
> v2:
>   - Prefer drm_err() over pr_err(). (Matt, Jani)
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Haridhar Kalvala <haridhar.kalvala@intel.com>
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_reg_sr.c | 14 ++++++++------
>  drivers/gpu/drm/xe/xe_reg_sr.h |  3 ++-
>  drivers/gpu/drm/xe/xe_rtp.c    |  2 +-
>  drivers/gpu/drm/xe/xe_vm.c     |  3 ++-
>  4 files changed, 13 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
> index 24d9c73ef279..02ba95223d7b 100644
> --- a/drivers/gpu/drm/xe/xe_reg_sr.c
> +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
> @@ -90,7 +90,8 @@ static void reg_sr_inc_error(struct xe_reg_sr *sr)
>  }
>  
>  int xe_reg_sr_add(struct xe_reg_sr *sr,
> -		  const struct xe_reg_sr_entry *e)
> +		  const struct xe_reg_sr_entry *e,
> +		  struct xe_device *xe)

I think we traditionally try to keep the device pointer as the first
parameter in the list.  It looks a bit strange to have it here at the
end.

>  {
>  	unsigned long idx = e->reg.addr;
>  	struct xe_reg_sr_entry *pentry = xa_load(&sr->xa, idx);
> @@ -123,11 +124,12 @@ int xe_reg_sr_add(struct xe_reg_sr *sr,
>  	return 0;
>  
>  fail:
> -	DRM_ERROR("Discarding save-restore reg %04lx (clear: %08x, set: %08x, masked: %s, mcr: %s): ret=%d\n",
> -		  idx, e->clr_bits, e->set_bits,
> -		  str_yes_no(e->reg.masked),
> -		  str_yes_no(e->reg.mcr),
> -		  ret);
> +	drm_err(&xe->drm,
> +		"Discarding save-restore reg %04lx (clear: %08x, set: %08x, masked: %s, mcr: %s): ret=%d\n",
> +		idx, e->clr_bits, e->set_bits,
> +		str_yes_no(e->reg.masked),
> +		str_yes_no(e->reg.mcr),
> +		ret);
>  	reg_sr_inc_error(sr);
>  
>  	return ret;
> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.h b/drivers/gpu/drm/xe/xe_reg_sr.h
> index 0bfe66ea29bf..3e337f174ae3 100644
> --- a/drivers/gpu/drm/xe/xe_reg_sr.h
> +++ b/drivers/gpu/drm/xe/xe_reg_sr.h
> @@ -19,7 +19,8 @@ struct drm_printer;
>  int xe_reg_sr_init(struct xe_reg_sr *sr, const char *name, struct xe_device *xe);
>  void xe_reg_sr_dump(struct xe_reg_sr *sr, struct drm_printer *p);
>  
> -int xe_reg_sr_add(struct xe_reg_sr *sr, const struct xe_reg_sr_entry *e);
> +int xe_reg_sr_add(struct xe_reg_sr *sr, const struct xe_reg_sr_entry *e,
> +		  struct xe_device *xe);
>  void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt);
>  void xe_reg_sr_apply_whitelist(struct xe_reg_sr *sr, u32 mmio_base,
>  			       struct xe_gt *gt);
> diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
> index 43a86358efb6..93067f4fd480 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.c
> +++ b/drivers/gpu/drm/xe/xe_rtp.c
> @@ -122,7 +122,7 @@ static void rtp_add_sr_entry(const struct xe_rtp_action *action,
>  	};
>  
>  	sr_entry.reg.addr += mmio_base;
> -	xe_reg_sr_add(sr, &sr_entry);
> +	xe_reg_sr_add(sr, &sr_entry, gt_to_xe(gt));

If we have a GT here, then it may be best to pass that down and use
xe_gt_err() above instead.  That will include extra GT identification
output that makes debugging easier when running on a platform that has
more than one GT.


Matt

>  }
>  
>  static bool rtp_process_one_sr(const struct xe_rtp_entry_sr *entry,
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index f73e08b60670..bf4a2732447b 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -7,6 +7,7 @@
>  
>  #include <linux/dma-fence-array.h>
>  
> +#include <drm/drm_print.h>
>  #include <drm/ttm/ttm_execbuf_util.h>
>  #include <drm/ttm/ttm_tt.h>
>  #include <drm/xe_drm.h>
> @@ -3035,7 +3036,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  	}
>  
>  	if (XE_IOCTL_ERR(xe, xe_vm_is_closed(vm))) {
> -		DRM_ERROR("VM closed while we began looking up?\n");
> +		drm_err(&xe->drm, "VM closed while we began looking up?\n");
>  		err = -ENOENT;
>  		goto put_vm;
>  	}
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
