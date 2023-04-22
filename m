Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA100C77B61
	for <intel-xe@archiver.kernel.org>; Sat, 22 Apr 2023 00:29:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D56A10E06E;
	Sat, 22 Apr 2023 00:29:14 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 081A410E06E
 for <intel-xe@lists.freedesktop.org>; Sat, 22 Apr 2023 00:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682123353; x=1713659353;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UXSwJkOuC6dofH6QPkHm1TIjUVoDzTiWLWwgFWW6Too=;
 b=dPzA3kTpMxrHqny0+SHcmgVXIVwyDGQckIXoCISNwUfFYzxZSNhwEMRc
 f6m2wBceLfhwnPLJ2drk47bS9uXDqCDQS6KsjqbetgGlyIfu6ArTvLK7J
 tzo1q/SxIcZLlc0Cvhn5j8+fQPeAjRd+76IgFVDqMknvD9IGY3AJvW91O
 SrO0iXugNoriI0jZb2hz3D6aD7QGXJOhxW94h2sj0WDiCONMaXggnT1co
 dQEKGF2PWzq4OihBT1n8MnqKloIzPKXbwSVvhrk/KCr6u3hIxfTunMIVn
 GosMVQVdLQlfUGjpuWPNFOFV4OTCvr8DY+RrIZ1DJWu18Yur1hVbhIjOG A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="348022683"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; d="scan'208";a="348022683"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 17:29:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="725023419"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; d="scan'208";a="725023419"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga001.jf.intel.com with ESMTP; 21 Apr 2023 17:29:12 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 21 Apr 2023 17:29:11 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 21 Apr 2023 17:29:11 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 21 Apr 2023 17:29:11 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 21 Apr 2023 17:29:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QrralgATritshQgGtGzGi1iyHXIq5UtF798FMrTKrGn5oEVOvcdlRQByBmKNUxkZ8V/AKEPcvZPkKni2bayHfK/cAGn54JsH1rE8Yad3ZCPxc2ZxN2c8xD+iCAMGL/7sikqllhxYgL3I9mcmhLf2iIGRIepwzF5R1CmMEFLmW439xSCGwy1rOBob5d54CRhiAAkXXHZUrX9TO4a4ntjligmn4+0bgOJvBhZHWpyF9IkUjPLjeWjgr+Q9aSg/J1cHndLcbnhlrV2dCjqZd6PCRJjd4Lw6m+rB/KvUL+zu6NYf0K+woeXVX7kkwYKhgLC2twg1X7b4UDJQbi3Rkah6NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pcWULFQTOqQA4k2pJ+VteGLqFy6VtEaQ1ZNLmXbZUYU=;
 b=cpFGdYmH3rokOAnb5U8OcEo3yoh8qHsEmZHPjQQP4ITXSz4zMsqWX4rQtUuAyI1H5nMDwTO9kZy1wjhIy8xgSXJ0WlFF8z16cSxjNyLhKsF/LfYhxhf92Jsl/yNIGl/aPR8Tz6LxOWIJcUTvMV/LrfabuKsuRh4Y4XpxbFRSZo36Gm4ySfBSMQmTEB6OLfj2b70tb2lbtlP2jurXEQF9ZJJx6WkdRYU6YLkssZ1i8r52R1K2vA5K+h5i1AD/4rChhd4H+LYQ2EsQYrVwXItnQry/iI6oMlLUPAgNYa/9w/vkmMzHrWtDFx4rg/REbCxFYn5S4y8rBOjLMFal12P+dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 CH0PR11MB5459.namprd11.prod.outlook.com (2603:10b6:610:d2::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.22; Sat, 22 Apr 2023 00:29:09 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%8]) with mapi id 15.20.6298.030; Sat, 22 Apr 2023
 00:29:09 +0000
Date: Fri, 21 Apr 2023 17:29:06 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230422002906.GU4085390@mdroper-desk1.amr.corp.intel.com>
References: <20230421223258.128781-1-lucas.demarchi@intel.com>
 <20230421223258.128781-12-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230421223258.128781-12-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR07CA0060.namprd07.prod.outlook.com
 (2603:10b6:a03:60::37) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|CH0PR11MB5459:EE_
X-MS-Office365-Filtering-Correlation-Id: 5730ca1d-bbf5-4fc1-5436-08db42c8968a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cVBgnDZQF8UoPtKLMp+P+SAbJirGBUXLTYfoy2oSJdPVcZv85wVJasGWqYbwmIE6IlnhPpoKNrQsVsK1GeiZO+IlX/47//g+duHYZmB1hbGzYC3q/gVkQ3mpaQ2QnYQwu81SG9WJNM6prhUNu24Sh6OyIN59hESZXFbt79PlxbtdZFKe26LifFnuQlhRlQfODxbDmo+XMiAN98iyrkYXk2lRmCnpSHe/yKEtaxVb4tFeurysMkd9B8LchQ6S5XiXAfkAlqC1rIDyk9K/HdWo68vEJRuxyCki9GGDrJXNx6pQ5qEyB3gR1Bp3lcats4QVUzOujBQKyXHB4mL1+NXx7pMBy4J7ZtxNu/Ia+E8Kk6GWpaU2aMbi4wl612GCsFEzWodYtuwKEJt0Uhr2HMD6q+lmlz3jpCIVVQFTs0b65Kn9ATnsAVdjKNV6pP/pCBxtbyIpLvCrrRq6JnEGMPsDVW30uPqItpwLjqU0QUhP3zJSBD7uNrln+jYSw9Xx5ilWU2359mW9rtlMVzy5cIQA2iEUjg1PvIsDC1Dc26Hf6+I27f+B5V8t3/g3hCSYnhOq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(346002)(136003)(376002)(366004)(39860400002)(451199021)(186003)(6506007)(26005)(6512007)(1076003)(6486002)(6666004)(38100700002)(6862004)(5660300002)(41300700001)(66946007)(66556008)(6636002)(4326008)(8676002)(8936002)(66476007)(54906003)(82960400001)(478600001)(2906002)(316002)(86362001)(83380400001)(33656002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wb7YkfcWUdBhaVEzCajI9YNDMfO5v2cXaRxl1aBSSEnutrEkuucDG2QZfmFD?=
 =?us-ascii?Q?GT2fkw3geM80cYCerJdlnrFIWGYwbMmAUg+IsyWFgKWHeNs1GDIMRd0vaYPA?=
 =?us-ascii?Q?V1OdzbUbEFg6X1VRW42MmdQcBb4SsF+J4hdWXxbEl9BmNQH0jn6mx+K9ZsPs?=
 =?us-ascii?Q?R6fcKGQ/I8OJllRxOXplAF+vG1aOECjEmIhBGBskLgM/0ravF1VYfpMv/IrN?=
 =?us-ascii?Q?EptUOyV1ndt0uFsTW6YJWUuI4fDClFyU7EXkmOLAIL9qUxtOmAGfSFRaNx6h?=
 =?us-ascii?Q?oXp/2f+n1KAqh7UCNya7KkwvY+gOfF2I5/uyagqiwv5LcRNoUwZeghA317xb?=
 =?us-ascii?Q?u+zxoq8cHPpCOMls0RVn5f24cNbQyy+4FhzoQrmdPb0sS1q3JOSJk7XHbGZZ?=
 =?us-ascii?Q?RESxbUx3ZLvYidJ0vQMlzxW5dXk/3aVioTXp1Ztq5ZL3owloz8Xr/B+J3hMW?=
 =?us-ascii?Q?HpNEwgpMbgzxI3zuY42lWGMm6lYrRnq3zWPv8x5aMSAWC/VpmtF3xR6kiGb1?=
 =?us-ascii?Q?H3cKjSmKvmBAeDl7UdlyR1sIwAMXEAK/yGz/WOsXoIg8yX3/e56IMFgNuG2s?=
 =?us-ascii?Q?dGzqoNsP8Kyh5iAlv5mK0MVFzCXPEtXl0iqRyYx64OtM9WzSj6wdSevwLw6l?=
 =?us-ascii?Q?dgE5lxSzqwTb4rkYaU9Hxv0NrMfTjI6ZM2VGYXDk4SEhuhsek0pcnIS8dTTJ?=
 =?us-ascii?Q?Q+5rlq8jU7oGJcQ/41OS9goLIsJ7uXeWNJnBMInCbn0Y5OrZRfKCVtUBPuNB?=
 =?us-ascii?Q?mzgsU+eB6op8Ixlcv+cXlQw2mWvYTJ6U9MIBvzgXXunKfduuShOWRuOA3f4M?=
 =?us-ascii?Q?eLqf0tEhuVMzAK9QCjOn60z+N/j+RQhe4Xa36oLDW3PhFIP83ph/TqooCgwU?=
 =?us-ascii?Q?E7zesGkqeLcQC+x9+RzrMCYQF05Sfydg+wVea+mjUx87gt3ZGrM1rQyzSgMn?=
 =?us-ascii?Q?79InjQ7zrUk5rt3zO3YfvG/rS3HD5mFCsBcC7taLUyEQws41FCSISkCsPMvW?=
 =?us-ascii?Q?b2TGiqDRx8C3GCi5SVUMTKZjc+c6SmHtk6IVnOkz4zDBL4HdGmyi2Jf9ly+W?=
 =?us-ascii?Q?fbM7PON8405MMCX5A86hXfF/AFU2bODp4CZyqp91DktpU4kCjDUq9V6a9bpv?=
 =?us-ascii?Q?6/qeMkUssrgQKXW1K+TTY3hz1gN/YOddcAJBOxgd70WXYnFb86nhUtVgxKyJ?=
 =?us-ascii?Q?AbE36ZCktJ8tKNOqZuXGA1mQAL4HzHHCAsWtllxtQ1H3ZtnBpHRl3JK2CbIj?=
 =?us-ascii?Q?5mIziHcO+TxN/lBI7yECY/be/O5ebY8AJTfBJ6Xvc4aHFQJDcOYplF7/K0MJ?=
 =?us-ascii?Q?+eZGEz0O4Z153YB+m17akLcts/+o7sK89zVuS0nQSoZ+1uloCjPbaCtnaW9/?=
 =?us-ascii?Q?+DZRePILDUQfGC0GXdjWxAgx9GBiN7jE/9Aykr8YACTRtcWbgFLZWk1iSg4v?=
 =?us-ascii?Q?7B3Qa/h/52/6Ap2vZvk7ycxYiCBkaygn8F26fVPr9tE4ci9ZIOD80rgmseVW?=
 =?us-ascii?Q?VT4R6ZW/91eJuZMHJ4Rnki4rJSs5nmez7GrJs9D2i0MOLYeXq2plQD8sF+e2?=
 =?us-ascii?Q?nkjQWDaKI6rfF5oSD5TZJD5NH/XWNcxC9CzU416FVApqsbNLWIP5I5muAmJW?=
 =?us-ascii?Q?1A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5730ca1d-bbf5-4fc1-5436-08db42c8968a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2023 00:29:09.2735 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ljaa23a8kkp3/aq04baPUNmen3mtEuDzl7I/kDTjMPy5f27x1JbNnrt67BHYpKSzZrpDQydRwPFE3lXDFmAWw/+5EKsuTYrtJMbt5wdEJu8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5459
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 11/17] drm/xe: Clarify register types on
 PAT programming
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

On Fri, Apr 21, 2023 at 03:32:52PM -0700, Lucas De Marchi wrote:
> Clarify a few things related to the PAT programming, particularly on
> MTL:
> 
> 	- The register type doesn't change depending on the GT - what
> 	  happens is that media GT writes to other set of registers that
> 	  are not MCR
> 	- Remove "UNICAST": otherwise it's confusing why it's not using
> 	  MCR registers with the unicast function variant
> 
> Also, there isn't much reason to keep those parts as macros: promote
> them to proper functions and let the compiler inline if it sees fit.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_pat.c | 35 ++++++++++++++++++++---------------
>  1 file changed, 20 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index c2faf0931649..fcf6ae2c92cc 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -62,31 +62,36 @@ static const u32 mtl_pat_table[] = {
>  	[4] = MTL_PAT_0_WB | MTL_3_COH_2W,
>  };
>  
> -#define PROGRAM_PAT_UNICAST(gt, table) do { \
> -	for (int i = 0; i < ARRAY_SIZE(table); i++) \
> -		xe_mmio_write32(gt, _PAT_INDEX(i), table[i]); \
> -} while (0)
> +static void program_pat(struct xe_gt *gt, const u32 table[], int n_entries)
> +{
> +	for (int i = 0; i < n_entries; i++)
> +		xe_mmio_write32(gt, _PAT_INDEX(i), table[i]);
> +}
>  
> -#define PROGRAM_PAT_MCR(gt, table) do { \
> -	for (int i = 0; i < ARRAY_SIZE(table); i++) \
> -		xe_gt_mcr_multicast_write(gt, MCR_REG(_PAT_INDEX(i)), table[i]); \
> -} while (0)
> +static void program_pat_mcr(struct xe_gt *gt, const u32 table[], int n_entries)
> +{
> +	for (int i = 0; i < n_entries; i++)
> +		xe_gt_mcr_multicast_write(gt, MCR_REG(_PAT_INDEX(i)), table[i]);
> +}
>  
>  void xe_pat_init(struct xe_gt *gt)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
>  
>  	if (xe->info.platform == XE_METEORLAKE) {
> +		/*
> +		 * SAMedia register offsets are adjusted by the write methods
> +		 * and they target registers that are not MCR, while for normal
> +		 * GT they are MCR
> +		 */
>  		if (xe_gt_is_media_type(gt))
> -			PROGRAM_PAT_UNICAST(gt, mtl_pat_table);
> +			program_pat(gt, mtl_pat_table, ARRAY_SIZE(mtl_pat_table));
>  		else
> -			PROGRAM_PAT_MCR(gt, mtl_pat_table);
> -	} else if (xe->info.platform == XE_PVC) {
> -		PROGRAM_PAT_MCR(gt, pvc_pat_table);
> -	} else if (xe->info.platform == XE_DG2) {
> -		PROGRAM_PAT_MCR(gt, pvc_pat_table);
> +			program_pat_mcr(gt, mtl_pat_table, ARRAY_SIZE(mtl_pat_table));
> +	} else if (xe->info.platform == XE_PVC || xe->info.platform == XE_DG2) {
> +		program_pat_mcr(gt, pvc_pat_table, ARRAY_SIZE(pvc_pat_table));
>  	} else if (GRAPHICS_VERx100(xe) <= 1210) {
> -		PROGRAM_PAT_UNICAST(gt, tgl_pat_table);
> +		program_pat(gt, tgl_pat_table, ARRAY_SIZE(tgl_pat_table));
>  	} else {
>  		/*
>  		 * Going forward we expect to need new PAT settings for most
> -- 
> 2.39.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
