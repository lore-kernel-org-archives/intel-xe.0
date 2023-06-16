Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBFC8EB64D7
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jun 2023 15:10:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3B3810E64B;
	Fri, 16 Jun 2023 15:10:14 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 880FD10E64B
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jun 2023 15:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686928212; x=1718464212;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=nbaUsvWUujoi/lAw86xVgMReslOBCmUu/vyGoQdk8yo=;
 b=dygxTch9ce1uX4wh+T4SYcEPN7GwPUYZhQvSw/O2u5wywFpxjzGOquWw
 7YAGzGdXRxeMSx3YBZI9cr91rrTogNchzCTlaj5+o7jiOMAs8RPCFr979
 Z+jl+Z2lJi3I1aYQmTKLWNs3cSEwrUVYuDOZUiYKNBJB9z81jvgRGih0o
 2A5Qzv5QUqnGJrnYALzlJFvCzbNmknIwniYZa5qsHblZfob74SR+dr/3R
 VvqJ5FbiMgw96z9Tt4+jjOi9n6IOzX4+KQQxYlhPoQxFahmCvFK0dFqtD
 IUH/Sg56w8YghE/fEvb4mPe/8/qiwCi7RtrmqBp9bahZdGA6lfWmPrwsI A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="348942492"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; d="scan'208";a="348942492"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2023 08:10:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="707132363"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; d="scan'208";a="707132363"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga007.jf.intel.com with ESMTP; 16 Jun 2023 08:10:09 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 16 Jun 2023 08:10:09 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 16 Jun 2023 08:10:09 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.105)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 16 Jun 2023 08:10:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R4vKseXbKzD0l38FMznES/pDRGFNhh4KYMJvf/wTHlyk88TGp/o6AcJ3q/0OVRq1aiMtm4GjaqO2sEPQtnTNTDctphdsYP3q48af+EIkiyEJSNwXbV31ezo5y4t0Oekc+oyZ4hEzA4rw512GTADBlIGbhT5M/V4tb3tkMlToMCfKZcGYAabgn8iY48oXpxwV81yNnd0gUMTWpUdg3atR1pzIBaGN8XOPvU2rjxZwzOTK/IVJ81GhXuek69cWWJvjPvu5ChMjXqoFUI+rqNA8LZ1pUrYRhCt1YhbLdGme96c9+c1SpgNoI8bxmbcSTeDibShQ0JsWEtPZQhHAt3Bu8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q26TmU5O80O2VJcfLJ7q4rb81r99UWmmbdYV/cQ365A=;
 b=hh3JXpXOkCRP3BoHNH6xfh4BAdGKK4nJ29OisBlLMoMTZfivQwAkQ4fdi1wysxvmdj8EiHlYGydQCbVQ8eOMEK+B4Si/hMjtKoSBRkEBahJipaXqtKFkmJ+i86Mg9qBY6m9yHmMgIFWfL7P5zcyEQQfg1HjVJtU7P454YtXNrDWHDuEqPNgE3Rdvd/EE2VfGj0mg+sLCtUtskuFsrxFhXwDVhEZYSSWF0djPd2Wshs6Xiqh+D99s4gxF4bNKrTFwce5BrIRK0WBDQ5+REBZXD/kGdsDqpMrIYuMwMf8dHR3lzwRUli22WTDdRunQ0cdhdao66cIaiR75C3+rvpOTqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB4911.namprd11.prod.outlook.com (2603:10b6:a03:2ad::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.29; Fri, 16 Jun
 2023 15:10:08 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%5]) with mapi id 15.20.6477.037; Fri, 16 Jun 2023
 15:10:07 +0000
Date: Fri, 16 Jun 2023 15:09:33 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <ZIx7LTnLvPm83uR1@DUT025-TGLU.fm.intel.com>
References: <20230616095504.17084-1-thomas.hellstrom@linux.intel.com>
 <20230616095504.17084-2-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230616095504.17084-2-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0081.namprd03.prod.outlook.com
 (2603:10b6:a03:331::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB4911:EE_
X-MS-Office365-Filtering-Correlation-Id: 7680276a-92ef-4ce4-bcc3-08db6e7bc563
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OmhUQb3QjbrUh3ik+6vg2N9nXYXW7Jrcvge5loVHzLsB2dq/TZz15LTPFdJNb1MBndKlgYvNZTgIQUVh8S4YOCvq0mo/t1HHuJcw59Tjd239XzSjCDe3TCELdcn08rLYFaJUi+WmQVARl2H4haUjYFbD9mZ6SodwsEDi+jLlmVlYYcmMfZAwJmqgRXrpmB6Xtm8xA33Kaq6IwT3zcmAlp/fYFd+4YENg64al7f7YB2GxDjGNr9VEU0dx3WMDkiXvNDAb1DESBBd6VxEwd0S9vflAi8nCzVcX1y5XRb1L+QNIdwn8mDMXoUdVcB3WtFr5BPpjH6jRNNCatt1EtVYcTd/S3IVJMEN5HDW4i4EYuTbX3RA0CGBbHn6S5ECTecz+bIu5EO3zspRbiWHpSz7gJhfCook1niMX9bH7ou9SJiOgek7RHC9vCECxMJWYqRx2HdJfnFce5NNUKtNVJr0oy9t6bT2Tn9sAbNOroutY4yDAuvvrUH9RI2rnNBh3LHAkMmGAeMB2H7oQTYgH320nWpzudL0D5b+E3qGM4Pj1wSn0ACa/qAHTJ5NRcXjmJqG3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(136003)(346002)(376002)(396003)(366004)(451199021)(5660300002)(8936002)(41300700001)(6486002)(8676002)(316002)(6666004)(6506007)(4744005)(6512007)(26005)(186003)(86362001)(478600001)(4326008)(66556008)(6916009)(66476007)(66946007)(44832011)(83380400001)(2906002)(66574015)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?V6NGSwC+YLvkBCbKniX+oWq8sJBkWxot4BztrdY9YxshqfkEFmaVLjVJUK?=
 =?iso-8859-1?Q?opmPO9kzstuznisF4a13GUihMV9q5zXJDjuSg0mtCjylpa/lu8xAqvo2vY?=
 =?iso-8859-1?Q?5Kc5WOG5bXgQRTXFfZhEmQFDBwkKqnBR2M5V1T97CDlHpDu9CZROKkSC5m?=
 =?iso-8859-1?Q?1nLgNEeojrUDwZ/YYz8fSQBwFd92bjxSin12UoGSkdWCJ/iDfygpFjQEJt?=
 =?iso-8859-1?Q?jgXM3iv/5Mqq+dXVbrUlCDB+p5b9k0gxU/cXp9tFmodnObpBinP6g4jAZS?=
 =?iso-8859-1?Q?7CjADX42I/QssTq6MbSp0Gthsik57H5dDS+kG7D5+UKpAFd1y2ouhgMHV0?=
 =?iso-8859-1?Q?g8Ch6Rg+qvUJXgNlMvy/n6R4krxpQcNYZax5++3c0sl0CK4WJuoIiI4BM+?=
 =?iso-8859-1?Q?QqlYN6NB/KmMZkG+4n1BVk/SkkTsifcs1xx0x3mJ62c8TI5cEdIS2QyhrU?=
 =?iso-8859-1?Q?+Sj8VU3EwW7BfcDBVu6l222bfNU1DgRXF1x/BEY5qbiZG5T7CGQJQi6nDA?=
 =?iso-8859-1?Q?uDxwGku3CaPrdAZeprY3rrtyYw2GJWsWjD9GC3b/ZhWNIaeqZ975FuY7Ky?=
 =?iso-8859-1?Q?4MGBTAcFxror632jQWc/y7moIoCHQcoSNSgBo239BQTsJ219B0KZ90WNnn?=
 =?iso-8859-1?Q?OyRvX+kBwCCWi3AjRA15yCB9gtm+lpkkPMwVxbkPUi8PXPha4RgmUOn62J?=
 =?iso-8859-1?Q?jL8qs6A5POW1v7/UX6VZusKQ9gIfZsRcfXgo4xd9x/zWWqdIEnl/qg9aJQ?=
 =?iso-8859-1?Q?Ta6Z67U6nuZQu0IDSQ5PFScQLIAj/WcWtywBO6zOpplGsUDsyUVSl3n5Oy?=
 =?iso-8859-1?Q?RlSV+B2mgn0L3cRdth93kseBaATIYYUobFLkcm219ywi7aUZKXjIXlUZgS?=
 =?iso-8859-1?Q?2+4GHqYSmQip5pqNTZHKSEAo+iHnWQ/eI2ipvktDNhBkuAVWo442+O944X?=
 =?iso-8859-1?Q?KvD0wwikHTtJZNJn45CN1dxl9m/rCGAr2qq4yKcbiXj4mF5IXkkPu4CAU/?=
 =?iso-8859-1?Q?O36YtfY8NSjEw8qC8KR4U2gz/CRYih4u/PiVXLLlRmhbK0iVlcpJ9YvzCD?=
 =?iso-8859-1?Q?H/cX6LC3NgsH2GOOOCkb9OvHs5DGDje7OCTeN55YtEkEGk2pHlWsZ8Ru//?=
 =?iso-8859-1?Q?60/tKwdYy+7QoVn6CAUHsozNSc6it2HsgzGPenxj1do0EokzHdk1ujnOYD?=
 =?iso-8859-1?Q?8j5ZdxFlM9kZ7UPr1300YyTqbhccyUTRKnZ02H7JO5osak2O+9T0XRmvYi?=
 =?iso-8859-1?Q?w83Z72/mqEqTIGR4mLxzGkkshGNytwI3NH4/OKaki02rhWWR4H+ux/fYvu?=
 =?iso-8859-1?Q?INgm6c6QME+xVAdYm/U3wf0GzjOnSWmNQ8w5+MEAoTfSoBDhdtXMbUbTr4?=
 =?iso-8859-1?Q?i0Iw8gC2XiIb8UjdwwvYF1nQpgLBusiVCrwfEcvvRMAbdE1HpYvhkvjPXx?=
 =?iso-8859-1?Q?ptZDpvdUIZ2vq3J1k87m6HQhsgPvGS8VoqYSGL0cSJxe4MeCBkYwoRZGCa?=
 =?iso-8859-1?Q?IQgLSns7BcNVHdArRrJFMFcDsCNs2k/XgSrZAsrP/WNxTrm/NncrrDVRwJ?=
 =?iso-8859-1?Q?4eS3W47k0TzqEFFOlNLKnigbH9P+Mp0NuRhe3SHs7E9S2Nxn0ChY0mue0j?=
 =?iso-8859-1?Q?7iOO18uCrSQpGnxWQMTzkvnEVq0jJumHhCp8XTbMcnvGti0dI6XqY97w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7680276a-92ef-4ce4-bcc3-08db6e7bc563
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 15:10:07.7774 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2w4N7Jt8Nzbv2seJLqTX8AWK2cxCI8VHocwJ0KHg+MknnsyWAWRFjLEZFAKe8Sfmdxm86jCBwh/SjbFdY6pHOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4911
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/6] drm/xe/bo: Don't limit the TT manager to
 half of system memory
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

On Fri, Jun 16, 2023 at 11:54:59AM +0200, Thomas Hellström wrote:
> TTM enforces this limit a page-allocation time, swapping out TT memory
> if needed.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_ttm_sys_mgr.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
> index 3e1fa0c832ca..961bbc29dcdf 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
> @@ -106,8 +106,6 @@ int xe_ttm_sys_mgr_init(struct xe_device *xe)
>  
>  	si_meminfo(&si);
>  	gtt_size = (u64)si.totalram * si.mem_unit;
> -	/* TTM limits allocation of all TTM devices by 50% of system memory */
> -	gtt_size /= 2;

While we are here, s/gtt_size/sys_size? Can be done in follow up /
different patch.

This patch LGTM. With that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

>  
>  	man->use_tt = true;
>  	man->func = &xe_ttm_sys_mgr_func;
> -- 
> 2.40.1
> 
