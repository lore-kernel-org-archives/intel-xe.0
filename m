Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E02C1C6FD19
	for <intel-xe@archiver.kernel.org>; Wed,  8 Mar 2023 21:46:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA9C110E723;
	Wed,  8 Mar 2023 21:46:51 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E40D410E721
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Mar 2023 21:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678312008; x=1709848008;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5M05CBAjddnxoAGy6l38bDhTMV6J8wXBM+OceV4Ziug=;
 b=QpB3YEG1KJINRAQ2fKUC5hkurGfvew7BxBxK7rE/GyfFm3iudVKDXi0Y
 /649QyLqSoU7JByXYZfYQIN3yC80SMzGm9s2RourNpCxelHEX8HXf2YBF
 ecHBI+XRw2T4f10o7tWTq4aB+AwTQI4jcPRwbC81TXTWRATbi8HivQrsv
 oWFzrldts9IojC/xhm4kWrmILGUEZI/gGZuIEBq3MMHFXC3htanRurKV/
 dA0Q1p6x0xcWcdP1wqizzDIn83cioUo5QZdNENUkUauqGSftQDduLdvHl
 6Qpw8VADWkdB7QgKhIsqXH/DKdNnRU7Q8h18Lrz5tXh7/3WApwM4cwX7c A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="316675248"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="316675248"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 13:46:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="851276784"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="851276784"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga005.jf.intel.com with ESMTP; 08 Mar 2023 13:46:48 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 8 Mar 2023 13:46:48 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 8 Mar 2023 13:46:47 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 8 Mar 2023 13:46:47 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 8 Mar 2023 13:46:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eArW2zlv/SsJILi8kX670xppQpFp+ejqk4tl7AygmBwTkHJUQAcUyQXQAgLpSRvscr93tl/n3h2Qfl4VRqKIXqK9++Ge6CIrfIeOeDK+LwBuHHM2+CWnzzN+0i67Zrv3ay7l6B8OrQWRbteLmhGzL8kw+wgMwCQg+sAvDGPf6y59GPIXs8NszbqhUHAJ5MHs0XEMrZrYbnU9E0SjyFHah2nYl9n6Ck/3d1Jn0qrHMuBaSkonSsh1mLmPko72thOmBIQBoO8KXWRc5j8HMmqaDSxqUnmAbziC4HfFRuTJXcMfAQF2CaS1SccsdwQnpkFfwxak6APQnkMmz67jEYgLaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s+bE3GPXGbLaS2UZjaslMr6QFV2WEN4Q4VcVp8UAnS8=;
 b=QgXrDzIgUxkeVdzMP9/L/rdB8R86KbVTR0SyN9AP0XP14HGJkPMN2FliZWTusu1XaN7fGfg8HLjjkBUkGwzqRtKtQTFfF6f40eb8CoTyoJIyrHEVAaDzaR4+RpBjeKfAtjoUzrm5kHL98ZqLDQxXy3u64kUGY40KrF1lLD+bc/Nzgv9ZlbU9E16nelPsTJ0b/iR7QdZj1Dx7SlCJsoLX1SNypWMZJkxaHqKXGaLAvhyTG0cZLpDuTVYMr2gi1isX3NCkW0c+us8ycr2lek56oS/714DP+Z00RxC+hq74KIV3AClNSmFwCPe9sauijzIMj7Z0gB2pHhxcaf8bDPvMHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SJ1PR11MB6154.namprd11.prod.outlook.com (2603:10b6:a03:45f::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6156.29; Wed, 8 Mar 2023 21:46:43 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%5]) with mapi id 15.20.6178.017; Wed, 8 Mar 2023
 21:46:43 +0000
Date: Wed, 8 Mar 2023 13:46:41 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230308214641.GX1543793@mdroper-desk1.amr.corp.intel.com>
References: <20230307092446.1263266-1-lucas.demarchi@intel.com>
 <20230307092446.1263266-4-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230307092446.1263266-4-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR05CA0007.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::20) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SJ1PR11MB6154:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ddf860f-a3ae-4053-63b8-08db201e9bac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s7av8mAKRh8bTB6SzVOLP3Ag9DoEkLNbwhyu/Au+xgVrANXkWEKQN1BBVB2AAV0vyzb6HCQ43SuTdLWG8Uhd3Ct5AI8DohvotBdBT8yIIudAmmJu+563W45EIjuN2IcsJMhcyFO2dggH1Il80zOK08B+5yj+f+Xz9QxOHbmmAOWCPE9TZM4SYfkxuH7vdQ8uczxUZC2bc5g4/4sVJ+hv7NF0sj1tW6zDENOAlYPT1VLH9/HnzH8PhpMyEpDWx4r40/pbxQg6LzpqEnG6kEjxHScaH+JB3Bt8vsCePuTw9L+JomECAXtmySeobFWOaTyTikBdZ+Bz4Kl25G2bp/52OcdIm31+sldMt8ikyHDG0yVOjtu6MBKEmvCUV/S01xUkIodEP7YoighlghteokMqLYJOt6FZ8rBscIzEHsknDu+ps8YPqYnFCZj1wt7Nse3bkhXBwrKKxP8kU2m1KuClGTU+jOHkIgH0ojM9ZUfboVc+sbb9DzwTm/ldVzMq/j2TwUb7grZD1uxt4NClhliPCIu/ndWPKexy4NIyH5eQMBqmWOSO2Tp33wrYtl+VQmbXBY8vI4SQXb11nf1vYSsJ3g7+ilYYIl2hmawJ8uEUANgpKpBXSkxVQwcyN2bOwz+5Ei86n2a8fd5TS078Q+BWpA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(136003)(366004)(346002)(396003)(376002)(451199018)(26005)(1076003)(6512007)(6486002)(6506007)(33656002)(86362001)(83380400001)(82960400001)(38100700002)(186003)(66556008)(66946007)(66476007)(8676002)(41300700001)(4326008)(2906002)(6862004)(8936002)(5660300002)(478600001)(6636002)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZrKGs+iHBZrd/bLJkiJQG/AEfedxJdkzqwTKPbUBB/VzJngj08xIzEEgs7yk?=
 =?us-ascii?Q?uupu4VeMKoyOPwlyuS6mrZ3v5l7G6ZHALhUO6+201H1N5m9O9ceHyKYVyYq2?=
 =?us-ascii?Q?JJH7Vn5/UbddzeVHFuQCfpiAwwX+GcsrOrGwzpGdVvd81eupsdcOsHg1TEN5?=
 =?us-ascii?Q?V05cUbVEeUU0xjIKzoOq7CJLpHGtuhFPlHszD0jyM7IUAeJIBV1nB6F0W+Md?=
 =?us-ascii?Q?iHaEAyqb8SVuDNucOrTfvzronr37hih0E4L65/H/1czSpUiwVqGrWC8y1Mqe?=
 =?us-ascii?Q?wIrfOvMfTo3+Ebh0UqAZKkYvCHdsKnrPvfOoV7FpMZqlnu8jgSVZwufkwIq3?=
 =?us-ascii?Q?ZY8lvoUaIl2E/LM7uFdlCvVbx7CcQLwgOT7VDzylruJY56g8M78I6s9MdCCk?=
 =?us-ascii?Q?wLNMyazaTiygB330d7Smi3xTWbyPc11ShPNdWlCkc/bJSEq3w7yRMxWrAmaU?=
 =?us-ascii?Q?WMAx9RkmHT2Nyc/b48xxWofph0XwS42qjazKt7rPxc767iFk0D3BAh42KvCk?=
 =?us-ascii?Q?XmWXzatUZqBLODwBn7jQfowbfMGE+CWiI4CLwkL1wA4FGgwX22/gfQ/EG5Vo?=
 =?us-ascii?Q?QNRc2qQp7c15uo83UtSOxDVmFSiz7DY7VYdWZzSMstWPsiw9RKMoe09tzGum?=
 =?us-ascii?Q?FZH3HZ1YBjmy9uGPa1/a5qVO31DAIFjIrLBLoWoTmXKmRfHfXaE4y75gkMsN?=
 =?us-ascii?Q?vo/ItTBm2pYYi1Aqfr+/i6Kt8SSb5Hs/WGYrtPI99kH+WbX2bmo4P0RvqoRt?=
 =?us-ascii?Q?BdJY8sZMsvd9060jHZJvMXnkZkcgkHhGQdcTjTtKtrroBsVym3yD66lY2IVc?=
 =?us-ascii?Q?6d0vUFAe4EZphoMVsRPKIEhAdyYPNMcdSPRBFyXkdrJgjL1Qo65uBgwVzyp2?=
 =?us-ascii?Q?EHs6zbJfkklxOCOlun59oJOm60wV71ZbVc/QD1+/9Y+/nfUtRL6QZKaauhxr?=
 =?us-ascii?Q?RvwrYtQWb1kZlo/Jj8OCKBYi/ma1I11OzvsrCmvYbvy4aAaTD/5Lca3Hq8FN?=
 =?us-ascii?Q?/O8Mom7tzJT5alwGbN1+pN2eMAlQlGAOkoEE2ezSJKOXyhIliaapc65UgYP0?=
 =?us-ascii?Q?WyQ7RWOdD9oqSBPsdkMtSmQ/XWy2bTYrvc3RPv1mQCcY5qfGTP3fFDQNs4LQ?=
 =?us-ascii?Q?4BSA+OIR6YPHvBAmWJ44gcypt5jirIAIZfvPBEIrAnDavpw2LJDwJpT8poxO?=
 =?us-ascii?Q?Bg8urMK7XDFslOOGOfDyYrzEAyMdgSX/SymH7o4ZYQQYVooZsrxJccRHLWEF?=
 =?us-ascii?Q?TXmR73gPJ8iXhIGqeXxw37+B/DuNkjcFZC2UnQ4Q7EyJ7/+PtwjyiLbo3X1D?=
 =?us-ascii?Q?9QYjJbIAwXRgT9lF95WRwdGTCwfdSo7oURGoKM9J2AT8aEktvgb7K8/XLkXS?=
 =?us-ascii?Q?2nZjUe/f6klYWfHdhD6Gds8gSequyX00ow943GnGWrogEiqRl5BCBMlxeP76?=
 =?us-ascii?Q?NJ0eS7tNFIM60HP5W7Zz8OQxxtRH9wr76iVOl0agAGQ+2fLvDSZTPjYqbj9U?=
 =?us-ascii?Q?s1ta9ptgU6GMWJG//Xjy8xULpnKBvZi2h9F+Q1s2j3Atc93dTWbi5031MwRW?=
 =?us-ascii?Q?AVM00VZ0ZRxZhPemKxryZnHOOSlV/aCh5pCz0/WSa5YB77UgOtmOZqPwGF9r?=
 =?us-ascii?Q?+A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ddf860f-a3ae-4053-63b8-08db201e9bac
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 21:46:43.7962 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4G3d+Jo7mQlGw3J5hl8waDrqUUHopSHcDglDDMneptGRz0r9yoloRpZ+mrvC8k5hv0GKJ0DajYiN8tT9NdTn/a9X00InQaUJ4V6QhwZbn2Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6154
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 03/19] drm/xe: Constify
 xe_dss_mask_group_ffs()
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

On Tue, Mar 07, 2023 at 01:24:30AM -0800, Lucas De Marchi wrote:
> Due to how xe_dss_mask_t is implemented, the type is a pointer. Since
> this is only used for looking up the bits, make it const so it can be
> used together with a const gt passed around.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt_topology.c | 2 +-
>  drivers/gpu/drm/xe/xe_gt_topology.h | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
> index 2123f84be336..967f2349c67a 100644
> --- a/drivers/gpu/drm/xe/xe_gt_topology.c
> +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
> @@ -109,7 +109,7 @@ xe_gt_topology_dump(struct xe_gt *gt, struct drm_printer *p)
>   * groupsize and groupnum are non-zero.
>   */
>  unsigned int
> -xe_dss_mask_group_ffs(xe_dss_mask_t mask, int groupsize, int groupnum)
> +xe_dss_mask_group_ffs(const xe_dss_mask_t mask, int groupsize, int groupnum)
>  {
>  	return find_next_bit(mask, XE_MAX_DSS_FUSE_BITS, groupnum * groupsize);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.h b/drivers/gpu/drm/xe/xe_gt_topology.h
> index b2540dc266f2..2375f005e0c8 100644
> --- a/drivers/gpu/drm/xe/xe_gt_topology.h
> +++ b/drivers/gpu/drm/xe/xe_gt_topology.h
> @@ -15,6 +15,6 @@ void xe_gt_topology_init(struct xe_gt *gt);
>  void xe_gt_topology_dump(struct xe_gt *gt, struct drm_printer *p);
>  
>  unsigned int
> -xe_dss_mask_group_ffs(xe_dss_mask_t mask, int groupsize, int groupnum);
> +xe_dss_mask_group_ffs(const xe_dss_mask_t mask, int groupsize, int groupnum);
>  
>  #endif /* _XE_GT_TOPOLOGY_H_ */
> -- 
> 2.39.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
