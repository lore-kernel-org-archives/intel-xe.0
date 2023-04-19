Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99F8CC6FD18
	for <intel-xe@archiver.kernel.org>; Wed, 19 Apr 2023 14:27:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7202810E9D7;
	Wed, 19 Apr 2023 14:27:38 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14D1110E9D8
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Apr 2023 14:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681914457; x=1713450457;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=252blzn84NRfB4fmCxVcTmR/sk5f4gIeqlczhWhb0MU=;
 b=lxqgzqENISqqMOLIslbI+E8Hgrj7dc+VrsTMUFa/qawFZz9TTWUc91jY
 Bhsda0efv4fU4ICpwoyyZa4oVbZ8WVivmAS62egpyCm3rvy6qXaky6bj8
 Jpm8OtlIaskgAWrKiYmKpciV6YHas5r0iiYQkshBdE0E9Q9QOBMvRiGrN
 cMJ7XeAOtuTaca07q5qKwPkNkiaIp7nqKcNKDSbn7vCdPGeRapX8uP1jx
 kJLDtsNzrMRsyvgUMzkZcAExy2EpbwkIjo9BncpZ7iXgWe4YfJwem3TBo
 7v2F0/OURQzhMyVd5vWPwae+oRM7uz0DXtJUoDfIGtwn2OvU1NJF+xVZ9 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="408370126"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="408370126"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 07:27:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="641791609"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="641791609"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP; 19 Apr 2023 07:27:35 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 19 Apr 2023 07:27:34 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 19 Apr 2023 07:27:34 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.103)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 19 Apr 2023 07:27:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nyJpCv51UABuXHxr9TG6BV31MwcnJVfpOFpHp+46SiRwXyGUF81+coxriq+8yEiiVXH06Lx/dhgZMFKRMjR7u2fK8jYAtStVupnz8c029DqSsbJM38Oomb95TDiaKVULB3VoWBF+O3M8DGZ1mTWGUGqp2czN5t1bA0D0RImYTq/i/vIvNpFYPvvipdrJlA/r4yqj8Z4qaS1EbDEsRF2wWWJq4y/aqNcJI2OwV1q364VadnG+GmN3UqTrZDBL/f9YmhWO62kji6HNzv/sEv+1DF+Z6+ZYsCqylIuldmP20KxwXs+dhYVSPunc6S2MZoZvrs2pBylLfajAbRArEjiR7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tVIB0KYZhQqqQxxTlHFV0c+j4NjYnf6VvmDDv2QLiPE=;
 b=ZTiUmMOJ0z6r6lLHoAeW1/Y7bqt/adH6G2QIlXxAMUZ4wvNd80Bh0J+TzMzY292LCqF70+Ox64sgNkNHDX7P0/elZhxp9nAVJgsZ5DBcj5T0O47GFYopSBN+ZUTZu8kHZXG2R7Z5+cbnP95iI4z5v+rHcA6t4G0h4bWY4ZH73otB/jD1E/WySxd7zMnpwn6PBmsFvJAN2SVPtP9G/BUkrhOqCGYsLI7PBRK+WtIrXSaZcHrwS+umKwmDTWEEUPwHb1KOrrnpDKJ4ot7w4MV4Lx0Wqmn2aJs91F5460O9gYZtamuDwrBnLlMGo7ijM5fvfFCALfHho4G3xy1LU8I9dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 IA1PR11MB7941.namprd11.prod.outlook.com (2603:10b6:208:3ff::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Wed, 19 Apr
 2023 14:27:33 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%8]) with mapi id 15.20.6298.030; Wed, 19 Apr 2023
 14:27:32 +0000
Date: Wed, 19 Apr 2023 07:27:29 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Message-ID: <20230419142729.GV4085390@mdroper-desk1.amr.corp.intel.com>
References: <20230419082113.8758-1-balasubramani.vivekanandan@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230419082113.8758-1-balasubramani.vivekanandan@intel.com>
X-ClientProxiedBy: BYAPR01CA0033.prod.exchangelabs.com (2603:10b6:a02:80::46)
 To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|IA1PR11MB7941:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ccf2495-d20c-46fc-62c0-08db40e2364e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pOVof2zonOAHoxvKdGZ+pGOSUV9Z6yEJzrs8VqLOKpHWgfPYrYVACu/1RDDGE73qYZm8j6nPp0gbgf2RefLqtvbxUDxIbl/NrM7zpEUbrtn4ddaHkcdw83WHQ1dZc4nDKYH4TB5f8tnFmUjIbwkxmSIOebMB0l//ZmzjPXYiUZEAmxNeoVRqk77hI+cApU+uJCWvNAeUyPMrgLlXm2Kp+2codG3OR3M1GBgwRHGUjLNWt6hjHq+U3q+AvlsaR07o4KT89ygW8To5v9oppwZmdZVa0pouCVUsYNreKCrQwDw7Q6cz/5Y4GL2ObdKu4BjTj4HZ0RJfagqKFaTBHFhL8Im33tXl3Ah5067/ZhqounQESk/Qn3ikFLGcDCBRddLW8gwLEMcKx7IcRxpA57p8y0dBc76jBvk+6Uv+apA4nTIx6QSfvkZHX7FJn6PjMoMn+P4dyYgh43eSAwhFEs+dVC8Lr/w6bcIb2E3gjy3aIvG1N5mUctXqQ80B6iGEN1bvqRq8TwwjFQHDOxXHfV+aRfdZ0ySXAenhVCxazt4E4LScfjZl2f6Sj3doBwBwlZA+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(376002)(396003)(366004)(136003)(346002)(451199021)(186003)(4326008)(6636002)(316002)(66556008)(66946007)(66476007)(478600001)(6486002)(8936002)(6666004)(41300700001)(8676002)(5660300002)(6862004)(4744005)(82960400001)(2906002)(86362001)(33656002)(38100700002)(6512007)(26005)(1076003)(6506007)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0tCg+NbrIAEx0bQgZwdVisRDx00hUduRKtHKvh4oZ8Y8EIxg5/x0BlsUof+Y?=
 =?us-ascii?Q?9fTiKatOpoa5TG1QC0qHwnmFc3dQktCV4ZbV9oTxl74W3Lbj7T09N0acY7mv?=
 =?us-ascii?Q?aCJkCx9E4RT+geuagVgArO2vlQO38pA0+sIH3U7d/YLfAbufWQWPGA9WsgPQ?=
 =?us-ascii?Q?tjONbzWhTwUVhWdQUZxPM/zaESfwxGUzNXmS1GbsgKRcM0rzHTNe3QjRAdFv?=
 =?us-ascii?Q?uQNaCprbWf1qJHFOLuD42RVfXYqHcYhldW+3XiQqYFIu+RDUlted7kRpItdo?=
 =?us-ascii?Q?KxZrkKttgqx/0fYibhHsoIP/hAvmogQaTV6U8qZCJPJQGTwkDVmJlyzLSysk?=
 =?us-ascii?Q?5F9uGQs20SGX33b+mVbi7YxonUEwpxt0hNse6prypTG9oSwMKTrhxi7A2B3b?=
 =?us-ascii?Q?uunFgdvDHpTyuD+a2Wcx5bkJ1WRVLXU/jPK9EwrnvjmMPU4KK531FnL4j9ib?=
 =?us-ascii?Q?w6J1OLISeEDN/n4Z7O0+8AxvJiB8SrZ8wijmJUMZpaBtDA9QJ+PlvZBw3eo7?=
 =?us-ascii?Q?nJpQ0ys65hPT1Sa3QYrIsD8O255Cexbi41O/AG5TrSsGnObfXL9S2CuAGztM?=
 =?us-ascii?Q?T8ItfFzv4ludjdoNXwqJxqyXXDjuxLaFQMojtjuohpGgmKvxSQyZFB52rNKl?=
 =?us-ascii?Q?oxn3W4qZ/09/NC1V1KLBLLhenG6OX7dXQxoHDsH4vy8CGWcAO8jPbS/2KUxe?=
 =?us-ascii?Q?Ii8pAmzWrf7WuIazBDpz8EVKbC5Wgh/iifGUzDcIzaz84ACSZWHxBKpMVhMs?=
 =?us-ascii?Q?xchTrakrfOUUatXAbHaPL+bneTkkSYSdxyd67QdcaCDefFY+4NUKNT8/1GXR?=
 =?us-ascii?Q?iJB/gwiUhnw2rxAdHIOYIHLUkIeFPcV8cRjyDZZk+NgvDmn/AFDKVBq/N+2n?=
 =?us-ascii?Q?e9Cff7eXRN2VMXu0UBlG4Jotf2zXCVEkt9XwBY4WIGsCaRo0gAoX8Daq8GNo?=
 =?us-ascii?Q?anksNA7DpSPn+c6HQ1kN6KBmLOLidvsjSL4eXgmbUZ1mG0YLPVZl4VMdeE75?=
 =?us-ascii?Q?QwIWzAC/nuCGGYRWsr3Fi74D8VZUKBYkFeZuk6L5sD/X5n+Y2eS7vv4byZn7?=
 =?us-ascii?Q?56JBRhFBFdXqd7cETHT2WNJtC1yZC7jyc1RecErTrNdboq8DOqMhaPeilWGa?=
 =?us-ascii?Q?0txnd4XdEv2e67luSaS+G9t8eQjfVVHpSkqwJTi6KBkoNgIc9nBvcoRkuIxy?=
 =?us-ascii?Q?uisQk14nj1OaYTK9bXMfGDKvmcSEmwTcYfvfG5cEgGsuiv3NlYgStfXIzwf6?=
 =?us-ascii?Q?l1cr8krEi5wNcgbPsdSQLB2iEjdO2eAuGg+oB9t/OghmK9yih/PZkDNhIyTX?=
 =?us-ascii?Q?W9Zr0gXHpONIgWYZLej4jVDkdy4jx7jR/cCFUCSAbB0/M1eQwDbxJ1k5+95s?=
 =?us-ascii?Q?VFQ2mrveSJ5uOZ/j8OSAoT7Rb9w/gJGWNxk3fqg9J68NdVx6rdhS2EOuJCCa?=
 =?us-ascii?Q?W4V5uiE09PAh46GReJaWbdRnL0MQ2d4+VxP/pTxZXDISaTePr0RbGVM+qg1F?=
 =?us-ascii?Q?M1zvujA5Q6gQ6oNkTCp5JgNJnSdxSkaugzvB8MJls7myzlxsptyV4JNmOoES?=
 =?us-ascii?Q?HeBLTIp/nwi12lRtfp2z1ykewn4q3ac8vW631swUJayvKs0qo/LMZsx85H3h?=
 =?us-ascii?Q?iw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ccf2495-d20c-46fc-62c0-08db40e2364e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 14:27:32.3119 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 82qu6OilDCbdlJQ/cgaw1+urR4NbEMJKWaRi3Iaa0iBxTK8niMaxzaRTGVQYM59RwVXk4uQaFD5YFzt4KJosFFpQBa11xkB32V7n8i0+JCs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7941
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] fixup! drm/xe: Select graphics/media
 descriptors from GMD_ID
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

On Wed, Apr 19, 2023 at 01:51:13PM +0530, Balasubramani Vivekanandan wrote:
> Fixed a typo in the error print.
> 
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_pci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index c92faffc838c..19ead642442e 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -474,7 +474,7 @@ static void handle_gmdid(struct xe_device *xe,
>  		}
>  
>  		if (!xe->info.media_verx100) {
> -			drm_err(&xe->drm, "Hardware reports unknown graphics version %u.%02u\n",
> +			drm_err(&xe->drm, "Hardware reports unknown media version %u.%02u\n",
>  				ver / 100, ver % 100);
>  		}
>  	}
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
