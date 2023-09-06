Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6987BEE14C3
	for <intel-xe@archiver.kernel.org>; Wed,  6 Sep 2023 19:50:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1845110E081;
	Wed,  6 Sep 2023 19:50:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF06210E081
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Sep 2023 19:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694029852; x=1725565852;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Q4cqfWhkDJPI7md4PRK7F7jt6tkYTRCwv+e9s+wZBp8=;
 b=RXBq/DJp7mhG/qnGmvchBYOmloJ62FYFA261PVX226vwV8buyy0FND91
 nPP/B/s8kcC5qY+1p+ruz4LeTt7s5U/RFXmRQ4mtPqBssfC+LQYl5j2R3
 3L3T8veDjy7q1QA6mrnETWYHx3yKhOqeuYS6YcVO8Bkbz/YI8Rm7F+pie
 GS3GIRjxmVBxNGAdLJSwDdOfwWo+TQYWkGTSSIsXCKQVA0x7JQM/ShvW/
 B7zB0oOuGTOdxGoUlrCxfsUD0XwlLoDt1frhsdhfO9vvtb5+JVPe/Squ1
 JoJWKQdkW8Vq9qKieHEXIwddaXSMREyA1X4XjvFo3GxsXky94sLfddnwM g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="376069128"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; d="scan'208";a="376069128"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2023 12:50:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="718403161"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; d="scan'208";a="718403161"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Sep 2023 12:50:35 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 6 Sep 2023 12:50:35 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 6 Sep 2023 12:50:35 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.104)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 6 Sep 2023 12:50:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oIu9P5l3wNmZde2ryDATMIYak9U83Ux5TGPMbUYjpHw8piJ7QoY2RAmpm84y6i3+6LFRWiDDZ+S0R79imCU9qbfTKs7mvJmBmFMow0Sy8VDlFeG6PA+IYBJIU6T/8AQWt+7DlNDNw9+F1GMRTbVhmtqZ5mOQ23N/9ttdF9JBft70G+avHLQq1NOfhJryE0zImPiR50bm865ZmTAAxNdue/ZTi7sCJ790gBB+helCk2JGf0pq9Ieggd34MqmgbvsUdoxxJZg4LIUXm7Ixo2n32tGKLtJsbNjM3BgHxB7hdQNaIl+KIakc+mQjV2QHGwl2oBfyWcnXc22E1O98Gagc6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WrqhhD+FGA44kHLU3gT8ERrrTMashBQOZXND+2kcGzY=;
 b=Z2jJXBXie7ml4aUpch0nPwGvpOeibR5/uKgEA24GXCd/WsaOwy8fLwbADfFMfSe1do4sp8Y7+1fpN4N6uizoGnuHYkQchrd0EJeEv8rrPixwH3rFKG/AJrLu3gHqJlRLzOT5pwdm4LD80un26PnvHC/9G9IdCFdXzjc09Y04tDhgYx43tIgx1g9ZREu4BERDhC/D5IoqUXNuENP22CH8zwOGlrD8AKy5FVXyOSHNiOkZ4MxOH2YhkjQk+/ox1X/VhKkr7lYzD7QCYknWb8L2Ayv3Eai/CWijbnmKd3XJ9iOpXuFfMP10yPo5u4Sv1DUPGfAgCxMKym9ZW4/p09ZgIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SA0PR11MB4589.namprd11.prod.outlook.com (2603:10b6:806:9a::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6745.35; Wed, 6 Sep 2023 19:50:22 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66%4]) with mapi id 15.20.6745.030; Wed, 6 Sep 2023
 19:50:22 +0000
Date: Wed, 6 Sep 2023 12:50:20 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230906195020.GH2706891@mdroper-desk1.amr.corp.intel.com>
References: <20230906193009.1912129-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230906193009.1912129-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: BY3PR05CA0006.namprd05.prod.outlook.com
 (2603:10b6:a03:254::11) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SA0PR11MB4589:EE_
X-MS-Office365-Filtering-Correlation-Id: 518f653d-e9ff-4742-42cc-08dbaf1281db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tzd04CWTUiZFXCoQ9fcRGrLtMgfWBPpa5JDyyODQnmqaGSGFK6nE9kBzYH9YMlDy//6LoOSkKTxodyMicr3DWEzFd/Xnw+60RJdkOA9TRMklrlsCRc1IEf6Ha7eZW3yyUekmLQk3p8Tfh0dNk9I8AgOTeOMxgAP6u1y+oHbPMGI8cQ2t9O3ro2hwEp8jxk4Ou92ZfeIaY0LG0u9X7AwxSlCBV4C2aEnuGhyhE1p7QTeB+lphCkaStWTHDQ7BZfLynJ2DS9P5wX/DdL0yHrlE/hteb4BUurW3jGxpOxfTMmMfC4HwItq9GfHEyTA5MGquQLPeIx/F+Vc99wgXi091sxf+jVowpGBvngDWk/CUAlMhxJVe0DZUWBzYM0vSyUgDUmQep/MCGYnQRsGg9YTIVLqXbq0XS8O0OxoCRjVUH/3Wv2ll2gXZJI89fsj2cgjDISxEteAd4LrJouaBaPHOnezxsca1jCOOfaFVIdgb00UUcY9i0/Ymp/xZrmvkLd6d9uYdsnKCdmvAvnXVHllUybNH/rK0ZwcdB8nhN4I+ySQnrjEh5baoY8HGpylcC2XH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(396003)(39860400002)(346002)(136003)(186009)(1800799009)(451199024)(82960400001)(6506007)(6486002)(33656002)(86362001)(38100700002)(26005)(2906002)(6512007)(478600001)(83380400001)(1076003)(41300700001)(8936002)(8676002)(6862004)(5660300002)(4326008)(66476007)(66946007)(6636002)(316002)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Qltjqmw1ke0mpiRJ/MpAybw3WZ2izifAqwFTDAcou8waxajGbcoZXVsMQeCl?=
 =?us-ascii?Q?oITxyhoVVOqSghmUeA7NCQlyr8UR4ZEciVc6eUr2zlBjRhqpXFW7Ty6YURZp?=
 =?us-ascii?Q?AjBZUWzP1IIA+w7wVcIQnzKqPxVKMrQ7lwgvisAn+BibW//6zCBh15+7En6O?=
 =?us-ascii?Q?ps3QwD3h4Mvi9LdmhR2TqgeD1CpjOGgXTQrq6XTWsunCdYCZPC8CFvjHqQtK?=
 =?us-ascii?Q?+ZIpl6yt1GSlFwOGMsvA21oHczP4zXGj48/Ffi9VPMA0rwVk0Op5B4CvIrkh?=
 =?us-ascii?Q?w6CvoG3OExLPKS8P2Mea2I1CxY+yEXEIraN6TlcFzyw9RCtgBFC1z2Ne8rIu?=
 =?us-ascii?Q?GIWKJbHjhh9rgTEEqkwOsW6tUV+riP3zA6/F3tJVpgl4Z4hT3o8uFnFYbsfc?=
 =?us-ascii?Q?0E5wm4tg+MZgA6gld9EqpKrny7Nq2ZUBmYHkng73RYU0/bL5WzbN3wc4G2gX?=
 =?us-ascii?Q?BxKvchwlIr67yUaYWK1br2g97oKEhnbsmbLp1jmlK2+oCwcBlk7FPkMCfYFf?=
 =?us-ascii?Q?sHT7LMWmxhOT9p2N2Cm9JHnyWaljNRc37boi5VPMSM+v1X3AfJ3uES3KK79Q?=
 =?us-ascii?Q?U9nIUNR3Om1akRkIeNFmveW4uNxdod3pLpwaJnbHVN58MMhLbo2Jka8jbOTc?=
 =?us-ascii?Q?mgnjjR1Gpe9vELc2lKDp32mLK/aUuSYIi9UfQJVmyaq4jrF+17mPzO6WGtUv?=
 =?us-ascii?Q?z2VKBoAoxBHH/7LxVdIEYMJbtlubJgB5cGasnshUN7a8tOBybSeAgERfCFTJ?=
 =?us-ascii?Q?xNSpZfyoctHkWaOqgMmLdRHaz8eItBT5iQNssSnleGmWdWmE3OV4TfbnPl02?=
 =?us-ascii?Q?9FaPCr+wR9mdp88c5DVk1hXB45xPc5asvVszVdK3CsDd7bl3cZ/e3FmlDsTS?=
 =?us-ascii?Q?+/tzxcQ7MJNoVD7qBzmRptOowtVPCaTJjzpQi+pMlD6WCcSKNb1SDfLDGwww?=
 =?us-ascii?Q?O1st7RURvrAYmQ2UdZuj/wv4OQC3C/22Lddge0ZbcElxDBIK7DfSzbkrVlvT?=
 =?us-ascii?Q?M1ImIz4rI/Dz6DcZ762Z2kPnAw8RXZKc5VvZOOcJbxDzeR0XYeDcW0OHDfAn?=
 =?us-ascii?Q?eU9qRi0b3UQghbUEgYjNO7c6ymAcEaQuelryMt5RPFaQdY77D9o0k6w/Va3X?=
 =?us-ascii?Q?Et1rwblz8gh+7SdE5XCv0U2RwHnBH3dd7EoJuo9Hajx4Vhv7yPtI+wK4cx1i?=
 =?us-ascii?Q?up+MuVWfxxHKQ+KC/03dDJMpPH/ivgPC5rgv6zFcZcIIplV13r7TdNvlh+2v?=
 =?us-ascii?Q?3GqYmLQDrfG/+5gD3+b8wo17eeb6wbCHDtFdeFtnwi/Cfle2ud4qdj4Hb6uk?=
 =?us-ascii?Q?XGumhYe3OWtwKxReo8pFgkLDShZXPFZbZLzXugKRDokP8bc8Wlr/4CjR9uW3?=
 =?us-ascii?Q?2gxNT+HtRHl4Co99pQafMRjdMTdkQZNqnEgJBn44z8PbY6xxLRvW22Zn8B+1?=
 =?us-ascii?Q?J+obBkpaJuPvF5knrbGgMupabdlFzWP0oUbESe4bqJ2BATdyVZinkSSu38s9?=
 =?us-ascii?Q?+P53mp1RdF8xiuPQMRe/VopsiKMN6VuJGcZevSN66bxNTOV8OCLsHLCaA/CM?=
 =?us-ascii?Q?WQxjRUGApU6jhOLoqxOyNyhmsDpXdu0/EFDjfdmrisCWYOD65olwysf/BzyL?=
 =?us-ascii?Q?ag=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 518f653d-e9ff-4742-42cc-08dbaf1281db
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 19:50:22.7731 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oIH6VYGUaP4JDihJ+neeEZp6vZ3N/RZ/bqIW9MapLPFFVE7TtR4o4srDVZG9uWBzP2TOHghSWk08VJPtqnZJsGomz72P/2/zi5cULifhqeY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4589
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/pat: Use 0 instead of space on error
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

On Wed, Sep 06, 2023 at 12:30:09PM -0700, Lucas De Marchi wrote:
> Use 0 in format string instead of space so it shows as
> 
> 	[drm] *ERROR* Missing PAT table for platform with graphics version 20.04!
> 
> instead of
> 
> 	[drm] *ERROR* Missing PAT table for platform with graphics version 20. 4!
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_pat.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index b56a65779d26..71e0e047fff3 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -107,7 +107,7 @@ void xe_pat_init(struct xe_gt *gt)
>  		 * raise an error rather than trying to silently inherit the
>  		 * most recent platform's behavior.
>  		 */
> -		drm_err(&xe->drm, "Missing PAT table for platform with graphics version %d.%2d!\n",
> +		drm_err(&xe->drm, "Missing PAT table for platform with graphics version %d.%02d!\n",
>  			GRAPHICS_VER(xe), GRAPHICS_VERx100(xe) % 100);
>  	}
>  }
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
