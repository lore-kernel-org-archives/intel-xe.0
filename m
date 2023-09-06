Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAE9FEE14C1
	for <intel-xe@archiver.kernel.org>; Wed,  6 Sep 2023 18:05:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B206110E6D4;
	Wed,  6 Sep 2023 18:05:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73EBC10E6D4
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Sep 2023 18:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694023530; x=1725559530;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=hXqoTJGIAvw/dRfDTURPOO0bjewagP/62YWxcCw+fjA=;
 b=QTjNmUflqkoRpIW206VRmlkxncRqxBiLSXv+MdEMWvkppWc90QHFMwdd
 N+poVAiWsb+NptTVXAUtHaR4hopFBd1WMsfxltDgw3iUkAFGPDfi71M2L
 3RcccjVULT9O/0gGJGC2vRQ3tVYQJYS4oh3aY6KLGBvrLDb4G/GvgfoEF
 7xY99p4A5AqKZfgBp1MMm1oOv3W+ul7QpcEtzTXYNXnU5NGbOTKp0JAWp
 O3gBOGcFoRqgs8RJIfckOy5RtXbGFNfCajRtIkqTUVNCtEnoIY419qL2T
 gSsqogsTND99FtCzeVyemu/d4wPB0dKq592f4CAuYHv5jYUsXKd8ru/Bj A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="357452215"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; d="scan'208";a="357452215"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2023 11:05:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="770871397"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; d="scan'208";a="770871397"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Sep 2023 11:05:09 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 6 Sep 2023 11:05:08 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 6 Sep 2023 11:05:07 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 6 Sep 2023 11:05:07 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 6 Sep 2023 11:05:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nmYQ2MoxX5Cm0uzdLLzX7dH770GF6k/26mYmbh81VlavyB6q7FaAR5hxSN5VwHHDeO//4D+4L68tdi291U4KJtw8YNxYBh6OMqV0kaiPIORUWnDmAAjck6N+GFLMmMvTnf4a/M+zwsYM97/tm8wisGuXv+iEJEMORBlhWbTj3XxWpA2mo1kFdltDU4omt8SZPcZoQEcQjGnZ+cuige64kFBmara0iJnNdTtDUyiQzjKp+4t+q3DhSmo8tiL3pY279P23enfwzgLEjNyHiCNuZXyy9awxEnEhLYab9NtX1imuzjMPuRVOKG6InAlHO8b5petKNyOfS/at1duFguxzNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TsYNkIza3ZWzbZImQ8kh4LqvuoAGEXVqTpKeWrTjZIc=;
 b=frAyzqKfQ/jdCVI3qMZmvrpKmPRb/lbEbgHBZWbZQ1d8qs2/ewxXf70gR4fP9rIrbBtt1Dfcd7/Ww8CzgQexoOdfGsNzzoa6DSjcmN+BwNxoLsYuJT6EjwaBZhpkpRBjJOonzgBJSOfZGI5vsKghD4ujpp0cnJ2VQvUxec1ozgPczbtQfrBauHqoqREKEWdxNUszILPjfc0bpFgPgiP9byNZRu8fCTz+3ENrMFzOCSoxd30UFDVlz1Z67GB1mee5Us+GlPd8OZHCiZFi4zR63tAAgw2Ch8KcsOGirBv2noRTtqhWxUKOb339Sy6xrhrHOFPfM+HN/eqIgxbUMGSryQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 CH3PR11MB7252.namprd11.prod.outlook.com (2603:10b6:610:144::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Wed, 6 Sep
 2023 18:05:00 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66%4]) with mapi id 15.20.6745.030; Wed, 6 Sep 2023
 18:05:00 +0000
Date: Wed, 6 Sep 2023 11:04:57 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Message-ID: <20230906180457.GF2706891@mdroper-desk1.amr.corp.intel.com>
References: <20230906060400.4144425-1-balasubramani.vivekanandan@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230906060400.4144425-1-balasubramani.vivekanandan@intel.com>
X-ClientProxiedBy: SJ0PR05CA0098.namprd05.prod.outlook.com
 (2603:10b6:a03:334::13) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|CH3PR11MB7252:EE_
X-MS-Office365-Filtering-Correlation-Id: 23cb3a90-f468-496b-59c9-08dbaf03c989
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: esAMtFBDqH9L+MZEnwO/CJGVw97xdgL8ETDO6iISoSIRsx0ZshATY/My20qJIL0lWbFCXMVO6JZ2aGER9AvRfQpSEnctm4xXyAjnAOSHml15mQ3SSjDM+szN28xfWbx4uL14XIz62HGQEUFeQjxrXjRUnSIAI+dc8C7zzsOWOkCcfrPVyluH132GW4VbGaVCizDe+BSmkLgPBP5UtMQ5z7ucFnfpwD/4ojA6f8XwzJcdS1EPuubU5yoivUfvzS/h/bl5H7CsSQsjUtgl5vJzaCjGhxAObWUBjq1o5TsxEGnh2KsW81Er/QPhN9MCYE4BYXXi51eGLND5Ey+QEG5tAfDiqVzHejFdd6T7EnaTZkkqwNYT5oDjv8p6hoWSpwGVR/ePbPhWkamvn55nW+RzvQ5OycKR+uWyIrrdGbpuGQ32EHCBzkZd3v4nCCidQc+VTIRI5Zfh/OrODuyotLpjJJzDRzeFFKiR1qzy1OwUCgUTyG69SkhSppqufqTGEKvXRfCP+IAip2C83TBP8jt9wWlwKHz0uJJJdD84F5YzDIrnSrnNxERcNjFpJ5pYtN+3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(346002)(136003)(376002)(396003)(451199024)(186009)(1800799009)(478600001)(6666004)(6506007)(6512007)(6486002)(316002)(6636002)(6862004)(8676002)(4326008)(8936002)(26005)(5660300002)(41300700001)(1076003)(2906002)(82960400001)(33656002)(66476007)(66946007)(38100700002)(66556008)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nPeBNxzKXgxsiZBx7X9DNTy2fw66cdPv/Et693hgOBiMl/dKzktmdRMaMZjv?=
 =?us-ascii?Q?2MbjUMBcpg1X/aa0ZDMXmTKRKh8J4xOVzFROWNEaKPS+RRuPzRpdvbzs2dyA?=
 =?us-ascii?Q?jb6xrWf6zQQYVA4xEt8egds6L7EbFZBqjvYKxCJS9i88yXFjKEHGuUkvZzAu?=
 =?us-ascii?Q?Vr41oAIBKp0Ttc4lXpmZ6lAAtjaCSa5pm6JDOugFWJ4x98LpgGLi/eG7G4r4?=
 =?us-ascii?Q?BwnZ+LAeldg4+dcx4NeAcHRzb56tvevYB+bkPFjBfZPpbIqf9TGDLsoK1HIe?=
 =?us-ascii?Q?u7fBHLrQM1Ra1cqlCXT8Fe0eT5om1yvy3e1DD4vHe+NeTV7f6D8FsyNvrjj2?=
 =?us-ascii?Q?hsscJjUwI6rt/N7HrSs1Nt0MFyB3XlthOscbFFiPkqncsb3eZRvi7/jY1uyV?=
 =?us-ascii?Q?0nrauzpWlwtmCldqgzzBlJhUIpjAlfe3DfZ6Mh08/5sfoz1MxxzhmxnfuPQe?=
 =?us-ascii?Q?QQhdCOky6nNFx88ltzhkzeR7awOImSETfArNK+LXgRcWAH1t5yVvAVtj5Mll?=
 =?us-ascii?Q?/LpoRBI4+9n0Ts9vaYbhpe79pdozGllbP88hz1yS7jh4u6EpJ4asK1iRWyS+?=
 =?us-ascii?Q?fP6FEwmA9tccU4ksNbuxDzX59oO1lWV8x+jmUZevQazo6k43muej/3Qgb0IQ?=
 =?us-ascii?Q?8Ckg+MQZXfQHwmO10L6q7AJIjViwBb0uBYnJWo9UhvaRO97jCS+lXzeL3FUe?=
 =?us-ascii?Q?227c9fsymHXuDVRGlS6uriPEXRVCjS+8knaU3qajckNzkRgkq0dc7k4B3jgM?=
 =?us-ascii?Q?sQLnwuYpX3IPGrO4L3p8IBBu/Xj0M531YnSKkMXkQhYMZaGlJ1PRha8ux1mP?=
 =?us-ascii?Q?qVDzDr6KZmbhQBRt8ymKoPK3t5R6BpGDukVVrKFcTrFVexSPYN72Njq7RbaM?=
 =?us-ascii?Q?p7wDsjMZSnFrUCvXkTvRRBhfBQYQab3sc35//am9Bdq+jaTak8WkxX0U6+IJ?=
 =?us-ascii?Q?XtLa05d8f72Cqri97oLLidXLZxhly8v8mnUnaT0dVD6Sw0oQJ8Hv1iI7hOEF?=
 =?us-ascii?Q?QUWw2miHa8vmPFSZN0Dd1fx8qrwURmres3LgdVAMSWzg3eRc+hBu72qkPrQK?=
 =?us-ascii?Q?8ilrMpZzjMnbrch+atUcsXeeNzAiu/ebPN/gNlqAjfefgV9yJ0Nl2xWGbsqW?=
 =?us-ascii?Q?Z/2eMrSgF7KhYlaWPef0fCKqAXMRQaHQ7aacrFmszx1Sz/uEbAIoZCl9sWYe?=
 =?us-ascii?Q?HAxTD6jv7d56VfF4z/L59vvcxKTHcw09tDGbK81wq4es7rqg9vkLi6Cahb0T?=
 =?us-ascii?Q?fexEP/rxYTNmzVskZYLn8pAJWiD/LkuAR/51sB06cuk7sdbfhGFsPiEDUHkj?=
 =?us-ascii?Q?5BMyIxlN7XswZ1Igy5COqtuo0rRcSGKrxtp8BMluQ+dsMHKYish8KdroaroM?=
 =?us-ascii?Q?P8mggGFISizMtADbWfrzgGPDdr0+4374ojj8+XzO1RQcPm7NMNoJHPoZe988?=
 =?us-ascii?Q?mDYoZ3tPnOtZFrMXI2Kx62FnyjiuQQvJ0Tub38yGNCQMBclvIfFrau7h0bhF?=
 =?us-ascii?Q?OvO06g7VuXE/78nvokKZS09BHezVNCoPYD2LF91puAnSSMbph1D0Rat2VRYl?=
 =?us-ascii?Q?EKEU0mvFZxGQXiAcLoNbQI1rjSkmFupbHbJSSKGevxxQDUGmDMejCW26AK6D?=
 =?us-ascii?Q?yg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 23cb3a90-f468-496b-59c9-08dbaf03c989
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 18:05:00.5825 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zb94EA9AJy5C+I8U5skbIi29n7plhljuHSEDGy5EaqGY62yfo3wl1bwas0AMZoCuyeDhn49880ccCzmGumWuFKQbJWZPaF1yv3F+uDXBHn0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7252
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/display: Print display ip version
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

On Wed, Sep 06, 2023 at 11:34:00AM +0530, Balasubramani Vivekanandan wrote:
> Print display ip version during module load
> 
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pci.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 60f3474844e2..fc01544346d5 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -844,6 +844,11 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  		str_yes_no(xe->info.enable_display),
>  		xe->info.dma_mask_size, xe->info.tile_count);
>  
> +	if (xe->info.enable_display)
> +		drm_dbg(&xe->drm, "Display: %d.%02d\n",
> +			xe->info.display_runtime.ip.ver,
> +			xe->info.display_runtime.ip.rel);
> +

Rather than printing the display version here, it might be better to
call intel_display_device_info_print() somewhere appropriate which will
dump not only the IP version, but also the relevant feature flags.


Matt

>  	drm_dbg(&xe->drm, "Stepping = (G:%s, M:%s, D:%s, B:%s)\n",
>  		xe_step_name(xe->info.step.graphics),
>  		xe_step_name(xe->info.step.media),
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
