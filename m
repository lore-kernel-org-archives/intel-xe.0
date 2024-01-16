Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 692DBC47077
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jan 2024 22:41:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33A9710E0EF;
	Tue, 16 Jan 2024 22:41:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D13D10E601
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jan 2024 22:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705444872; x=1736980872;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1hwZ2zZ+zmnztC7/KlaD+QJoD2sDwl1F8hMuZ04Sluw=;
 b=cB91j32LZgloqx2eam+f28DvZ6fv+43fkv6y6is0ufwIN9k3gpHXD79F
 6r2Kiojuy928dnII1r7sAdW6/CjAv67rupbtacqPkBGXowkP6v86svkUj
 l/crVtZAwl4TJxxRsA6IA+6DKNgNkVqULxJPPQtkBX+4cPpYfClra2eqV
 wnIcnucLL6Q8q5nq78LKNtec9w7hayT5q+sdzJ8Kf1cFMgxMYfPhcsIvh
 OSGYVlU3guSvyg5Lznh2u5ypTK5Z5hmYqdLb6OlwnkMnZz9tP5nAbH2lt
 vuhix5S+OpHxB0DF8uS6QlbHGP7EVPgCOB0qWNcs6e9fZGXwx1I4kyaYt A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="390461923"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; d="scan'208";a="390461923"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 14:41:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="874626800"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; d="scan'208";a="874626800"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Jan 2024 14:41:11 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Jan 2024 14:41:10 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 16 Jan 2024 14:41:10 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 16 Jan 2024 14:41:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WykqkkMknon11wS7j6PNJnu5SAm9nIsJAhVaWGQNIuii54/MbUVgffDLWsVvJKoRog0U8Gp6vG7CtvbkDo+uhUD2S34/fMyRYhIa/amW886994+cs8QbmtmBTa9tBhg1oY6oQk3F63fDeJrx7Ghu8chdNJ+LYdP3Qc4afZMzNe+PHP+UKDMPfvEs315ZhvL8c/EDg4O+6bZoj8iAPINEXVxR/5535aj1sJ3falokOPjFdZp4Fu4YlasRpUjPjGvPOce0BejJZsIELCSSG7FiM2Ik0aVIrB9wAZgEZLdY++FbKPaIYR80eTDsSj1AV7qRgkonFsZ3s7/jEI4TYlbLyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KMA0jNwEinY7IpImR1j0I6enfWfr564HH9Y5q3/yPEQ=;
 b=QVu6VV2x5p6wsqN6k1HAzaMM772lb2egOQcH9am1ThUCPrS70krPvuwosinBTpzWfSNg+u2yOV/wW/8xxdDocvcMXXdwq0LbDtpU7VDrQ+lP9yFy5iup429X/+lQpN5y/JgxYXdc++zwL+LCbt6HZtIDwsXmAMEx8n/qlK/9xJzduB7sUa60RPQP5tvLYgt2HTCSMeDD94+KC5hHrgu567cMOqyWg32mIlq7QcYamsiSGPog7moK2+NqDPOFGD6DPXR0jUyQ02MEC1lwclb9hsW/2cvSfrxDJ9Fclj+NTWg8rtHZRnKg28eF+8k/AhdUMFJCKG7/ibt50u1rKecSzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DM4PR11MB5407.namprd11.prod.outlook.com (2603:10b6:5:396::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.23; Tue, 16 Jan
 2024 22:41:04 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3%4]) with mapi id 15.20.7181.015; Tue, 16 Jan 2024
 22:41:04 +0000
Date: Tue, 16 Jan 2024 14:41:02 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: <fei.yang@intel.com>
Subject: Re: [PATCH v3 1/1] drm/xe: correct the calculation of remaining size
Message-ID: <20240116224102.GB5549@mdroper-desk1.amr.corp.intel.com>
References: <20240116223709.652585-1-fei.yang@intel.com>
 <20240116223709.652585-2-fei.yang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240116223709.652585-2-fei.yang@intel.com>
X-ClientProxiedBy: SJ0PR05CA0028.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::33) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DM4PR11MB5407:EE_
X-MS-Office365-Filtering-Correlation-Id: ef400671-c258-467c-d072-08dc16e438ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8PVL81YgotXGRj1LQ8c8t0p//XG+l2md1nsSU0+0qpJZYUZehciiquXuNE9lxEsgNoprnjjQv58OpHz8NFWgd0C938Fcdf90btEMGqqy0cHoxvr5OvTOJ4SI95BJK8tndZ8ZRkaPOGWGgRJbXarIbKGSp8InXQl6wXYfIRkAJjuAk669cI+j/FabNr8eiQCScPM1Y1uCy6Ta6yEAMnn16EeWdB2jARj8hLNvBkqeKaL2cb7XQk+CBlFbbNY6l/mgB6jAXR7962F9P2sU3YE5HH/FfrISpfXUKxIW7ld5JZaCOIaQtrm27IyvFSM2fpZRwr1nsdmLr4w7j+yxGsLaA6i752bfFLCoKgSsHHsZO1D30wIHPv6houMZjNW0W1WGlNVFtrFOwin57YYaFSxKoRNKLBE+a9kBQJJvEEzGefOYvlIMlpDye7t+KcXgX8FtbfjJJyAE/Dc4GfGj6zkvafHIAodvvENqlVi78LYoe56WFLkSHrNxl5cRq+nwaOUDQJcQqPudIS5iMJhqk5qwwHtscQUUhV2fbl/1D6QZRvHvJrsc13BtRJ/NK3alm8kj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(366004)(396003)(376002)(136003)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(2906002)(5660300002)(41300700001)(38100700002)(86362001)(33656002)(82960400001)(6486002)(6512007)(6636002)(66946007)(66476007)(316002)(478600001)(6506007)(66556008)(83380400001)(4326008)(8676002)(34206002)(8936002)(1076003)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0bZoVEFnmL1kFhcHCtTdGirFGSGgt4UlNP2Do1/JMKkrGxG3zeX+N5tjxltI?=
 =?us-ascii?Q?gP0szOVdOelPTrPLxuElSnqyvZnijIhnDf5SeoWRI8M/GjRuhDk3GIGjw3Hl?=
 =?us-ascii?Q?3uISoWJNMh5UbK4x4vmWegpRNgVsawvdxw2KuGCOp1xFhgSDgc15Mci2kvsw?=
 =?us-ascii?Q?QZ1E0jNzyI3vSh8gQ43UZWmQegZfgFb38onVURsJZIfBRAcuFbFuRXtOxUyE?=
 =?us-ascii?Q?pMauuJlxcvwQHymfsdHcqR9/Q/djBhZc956CUN3ZVie7bLugRgA7CUx5Vpt7?=
 =?us-ascii?Q?MjlP2B2ivleql3HPnFb48IZgyCV7cRH2YRdhJvtFaTisyjJIeI6hLbmZHTjA?=
 =?us-ascii?Q?snIvrKr1eJaPiO9xAKH4kLz95zjwVxqhVW3I+nDdirSzhoOhZKKGrob1LyVe?=
 =?us-ascii?Q?SA+sLWdRpGi5lYY+JaZEYXbLEmS+xy1iDfcZRxqhz+rlpCP76cjGttiXipsq?=
 =?us-ascii?Q?Nhd3YOsYG+UMVMu9av07QfvJ4/JjYqMRv4gj9app6h+CFOcE7kL0VEjJFlQb?=
 =?us-ascii?Q?A4w97n/u30W7UJGI/DR/GMeAIJJMuFOJq22OgA/wTNsYsiQd9Lt/YyBeLnEX?=
 =?us-ascii?Q?mF6aRaSAaYjCdM/ldokoPGKaCcfVs97IhBYbByUKuNe0T1O4AydmHg+1KTb3?=
 =?us-ascii?Q?8UzSd0Fsx0R98wUmToIG+3eHqdm1MjNAV3PJRH5Re94vdR70Bo1ieUC4GMH1?=
 =?us-ascii?Q?nJrFNl+vBaN/Q8HKN9uTW9dFn7CtSRzxzQZj2tpCskvRxpye8/FhD6P7YJQW?=
 =?us-ascii?Q?ZLiuuNrnhxNeWwA5Tb+YVj0ui3/cfcsbdvYWXqcj4iVit6G23+Ms6ncPMb4N?=
 =?us-ascii?Q?5Gww/2rlfdDd90lvLdyOwTOLK8xuq+0otsJaRUsi51vUl4OA2OTxUyeKzRZf?=
 =?us-ascii?Q?GiLTVpw3LN1gulBOPPrj3JbcR+zpqGBwEfsRjIPOZQM5eJY5a72pgiP/2JVo?=
 =?us-ascii?Q?T3DQfoMKW2czdbqwq1Umnj6CSNf7WBOJQls3fQ+2Jch+n6MpnPs8qbIrnFl1?=
 =?us-ascii?Q?2f+ZrdfWyRnR31Nc4bcDDHTdoWQ8b69QrQp8KOm5dD3+sdwy9MV+j91JBDOp?=
 =?us-ascii?Q?zavbHOipwDLHqsJOYBzRt7sLeCOAZ4x5gvfWYNqx36SmH/JRxK+jjLHKds5J?=
 =?us-ascii?Q?Wul0+oMnQTTAyX2dfPHSQ+iBs/Y+MrX2z1+rutj7f1oLGpB5Wr/LAHDMklZy?=
 =?us-ascii?Q?njxCHon2D0TQVXxtX+xLpO81ZxecGdQZ0oL30Z53llzuVadoJiXQmSWwrmV2?=
 =?us-ascii?Q?zrdNoLASmXE5L5+J2E/xf9/tuPzdQ+1dXqOg/OTsSXbUntSLLSmpGWdWs4vX?=
 =?us-ascii?Q?kCQEAz4oeQNEEUqDTYr2P6LfV1QZ3lrvfeIsbJ4cmtVVsx1skQUVv2dxFBz6?=
 =?us-ascii?Q?teJLeE75VuG+nARTm5n4FGZv+QVYyvEYYYMde0aiQvjZMuBRkWPRbRsOpFCe?=
 =?us-ascii?Q?ZlH+5Z8MLvsxppXLFDci8rS71FsGq19UXwFUTs8re7v7jrp9cHaDE9Ki58SG?=
 =?us-ascii?Q?0U7oLVfj19XCOiPSyMcyVPyGZwA/dRg4HfLvjhamyWlEh1NFux1CioaLXimw?=
 =?us-ascii?Q?JpkF2EGRGkyUpjXijn3oRdOZnCo+DBRpd0Zdgu8kk1qXoI85A+UIds/p//TQ?=
 =?us-ascii?Q?sg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ef400671-c258-467c-d072-08dc16e438ca
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2024 22:41:04.2097 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7il7rdUxLsssRAh32SZErKGzcIPpjbpSu0PqWuDr0HwfXbLr5W667nnDx5xuMRc8vOdSVAYcB+DLGcbND42VUvCdQofD8aEoNuZMEPS9xj4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5407
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Jan 16, 2024 at 02:37:09PM -0800, fei.yang@intel.com wrote:
> From: Fei Yang <fei.yang@intel.com>
> 
> In function write_pgtable, the calculation of chunk in the do-while
> loop is wrong, we should always compare against remaining size instead
> of the total size update->qwords.
> 
> Signed-off-by: Fei Yang <fei.yang@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_migrate.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 44725f978f3e..d5392cbbdb49 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -1116,7 +1116,7 @@ static void write_pgtable(struct xe_tile *tile, struct xe_bb *bb, u64 ppgtt_ofs,
>  	do {
>  		u64 addr = ppgtt_ofs + ofs * 8;
>  
> -		chunk = min(update->qwords, MAX_PTE_PER_SDI);
> +		chunk = min(size, MAX_PTE_PER_SDI);
>  
>  		/* Ensure populatefn can do memset64 by aligning bb->cs */
>  		if (!(bb->len & 1))
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
