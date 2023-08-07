Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5B99C001DE
	for <intel-xe@archiver.kernel.org>; Mon,  7 Aug 2023 22:15:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 397E510E390;
	Mon,  7 Aug 2023 22:15:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D1CA10E38F;
 Mon,  7 Aug 2023 22:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691446511; x=1722982511;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zmHS1ICQV7t7QEPZyeRv4Wjo7TGqk9+ao/kPrnrgGK8=;
 b=eBRU5Vp6Z1Qc3INa23CX8el5x64VQnqQ+3COfNQzh+0ILOC9whj7sFnp
 rXo+ooXXhb/u6vgaei2BBUdaL1+ElKd0/TNYGDw4j6tQh+A4SWewxL1Zf
 ZjfV9nWciLn4JdX6bCK0kRVxnadhZ6/Hka9XmbDDKdcxQ1UoRunVZgvcJ
 9vPvL/AjM97ffqtB+8vGU9mJGlgLC8rKf+gjbcuuIA9tYkOkj3oBgUQW2
 JEbJCko5+G1v2QLaJmM6djsupUUZL1nsZtrhudREW6HGd3Wu3LfNCZZtL
 MyCJCyLU0YfiK+puEtdDEEoi43X3+tbkB5pjvZ8YFcKxpd89MhG58SXWC A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="355601538"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; d="scan'208";a="355601538"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 15:15:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="904970027"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; d="scan'208";a="904970027"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga005.jf.intel.com with ESMTP; 07 Aug 2023 15:15:00 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 7 Aug 2023 15:15:00 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 7 Aug 2023 15:15:00 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 7 Aug 2023 15:15:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OeoObn8jJXAeSbtWXBEotIXu5+kPo6Wo5fPADLujmJGYK1Ax6PZokiBxEhvDAHiXBQ7TM+wIUqIobfUSXOMizFRhuRrp4BOFacBDVChinsq9LaNBUPXVs8SrLSp3O+RzJjPY1DCA6h/sMOM8IxcqBFZ1QVyvS3vASHVT+/BSRT5LNFferPEZclqcHrhjY00dYNTXAvRePfJNk7QfGVUu/v50raIhlX8Pyd5A9JEznbTbXBMZw3ybmu71MIHFyn5N+s57b9q25EaTSY6d1TQOKNR8WWFxpP0ruSgdf89BDjdcQ7GWoctxB2BuFGmMWh/WMZnrST38dIwkXbXbVNqbfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mYHyZNHx/Pz9q3vain6dJu1ZY/MqZaMy0dyd5WlZGgg=;
 b=hjc1+66BmevmSSyUmVn+OCa/fAttVySK1WfpQOjklleLWMzc8m4HFNSmc0RBcDiZHMoxMYUsA0k8EfraRboRfy0QgNL4rvBzT1Cb6wSS0JvGqIXFHFWhKIuyTt0Gqt1/uq6s6KZlitzZgBv3EGoQjD6/DZInJhq1ow1StLeHOXkHJtdRNFr4+xNUIrbTOQKV4KSr9fPX8Y4tKhc9muFjeIfT2LjysLdX/1FwaGy9VCZCeFPK7+wbM5Vp4mO11R6mEoQ7TFY4aZOcj6thojcskn059RpVvvW7f3yipAUgEbJdYYmIMmTJuwf2NyL3Oeus1e50qum7RA2dOxqOEy4OHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CO1PR11MB4849.namprd11.prod.outlook.com (2603:10b6:303:90::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Mon, 7 Aug
 2023 22:14:58 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6652.026; Mon, 7 Aug 2023
 22:14:57 +0000
Date: Mon, 7 Aug 2023 18:14:53 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <ZNFs3Y65lM1mbjth@intel.com>
References: <20230803220248.871666-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230803220248.871666-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR13CA0041.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::16) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CO1PR11MB4849:EE_
X-MS-Office365-Filtering-Correlation-Id: 64ddade7-9dc4-4b1d-dfad-08db9793bbe8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2zIiNYC0ytpdzfK4107l+p1j7uYY3ihw7GPFhd7zdyzm7nq2yKqzCvKvJYJLe8k+VZCDvx0ramgMOeG8e2N9S92CY032nVTh6EtEYydl2E9MyvVRXGhH3lFkH4dUJwkgkEUAuepE42iTaL3aAL1+8XS9P1FTc7C4CVwBH4GI79gk9/NBj+Y5Qe/Yy18Lat5reL5GJB2zJoTxs/BS+r7ums+3lrqdMkZKt4XKgVJ4IEgOqjDN4JaFS5FdC1D6COybPLAV2l6atqgjTUOaSKgZr6/tZ9SHjZMV4KS4nlxvbCKl1qBTRWWa+QSoJBqvBrY1RZR48Zb5Njv1s28fEvs24w9+OeVXpFB7IE05glXoglW9MPMpjtVR6JfrDqUQPd8Z9UjbPwgW18lp/UN5VASrvPwdmHPua7a/X5v+qrA67JAuRPAQHu0jW5TfConXyJuwTbHFW852oVlJakvB+eb9Tsa6HmTiFkM4Zil0D0Fql/fwcGn5UXJmHYRJB1pNjUH9qo6X7dljsJQiGnwo/dUHBuzh51Hcbs1ZQOUj+n/Swkk6U7k+ryZgWW1ztWTKYix0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(396003)(136003)(346002)(376002)(366004)(451199021)(186006)(1800799003)(2616005)(36756003)(6512007)(4326008)(6636002)(316002)(86362001)(478600001)(38100700002)(37006003)(6666004)(66946007)(6486002)(6506007)(66556008)(66476007)(450100002)(82960400001)(41300700001)(26005)(8936002)(6862004)(8676002)(2906002)(83380400001)(5660300002)(44832011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SqrJptAR4ts0kkYGs6pWWs3vfq767+Jtim5FV8mhs+WyO9via0KyhmearB+u?=
 =?us-ascii?Q?q38Ae4hN7Pi1+iyyE9XaPcCFM4nVef8F/4a7MyefDuWzh4U+p2Sq5efEpibh?=
 =?us-ascii?Q?AbU8HssaCh6VJAmCi71X69iLRbL8ynnV8UeufkzqD1GBWtk2znCjynQ2xkSX?=
 =?us-ascii?Q?cb+rDBi+zkFE0p2BfRt3NjV01stRJZFKj6oO1uD+n+tAV537bU+/pC9ZfuSF?=
 =?us-ascii?Q?ZMUEOmY7sVINvS89qN8ZgswSZL/JBoMoosiMEJ3GvYAz+Lw/X7NBo7O5htH9?=
 =?us-ascii?Q?N5iEfoRJ9c3WZWVwB9unPb2//Bqb/E0ylY3NEi9Qn6HLTFzPGF10lV8R9qVz?=
 =?us-ascii?Q?O2orANAa1THwHn22nJZi2Q1Jqe9pJNQHzaVE95vs8iZ0CZWJC7+kG6TSkSI7?=
 =?us-ascii?Q?FMOoQB21GMEOIzejb+M7DLD/QSeYgAzlgHBsBxs2gu3tFnqvVA0uXsnAxgrw?=
 =?us-ascii?Q?jMv7mUVvEyP3+11QIVU3beP7Dt2xFlMuXlbQjnKO9k7JoiLJ2+cTgNAPJQXo?=
 =?us-ascii?Q?FHOpUWD3QZUm/u+xSPPUziNKT7ma86/zTLqK+sFdo+zS5UmTv//4plDQ8Ojv?=
 =?us-ascii?Q?0GMn45rtapmXtlU7nCDvh/Qit5t3vdv4XR7QoqYNTRIl8tksLVF2UIuZuucq?=
 =?us-ascii?Q?3+5ylkQ/7+7BoK2U44ytueDajkXVZ8K5h6WH4GdycQdxaCn1/awC7PdRg4hC?=
 =?us-ascii?Q?MvsK02JlKBKY24d8sPbAKAI8Zon6wSVDBAS5YdNQ+HRqT/wJr7q3G1o/D094?=
 =?us-ascii?Q?lEITfY9GjTJ9RSGNJAiB7NkKect9DUXOxta4Xse/UfK5ZAIfWjRN6Sn0JfiF?=
 =?us-ascii?Q?m4kLBuwmbg4Ce2hwwyXFJv7E5H6M53CzvnabTtvU1bUVg3kcfIdtIdRZH9Gu?=
 =?us-ascii?Q?ietb1bSLJ6IhokRk0KyEuS37HA89FKuDq25hBocVGCxmDWchGbdjWEuqi075?=
 =?us-ascii?Q?4QNRgPak4aHS9r7L/lFhdt6hyFh0lX4ZPS1drZwzMQcV0YP0AjMZkJPcY7e/?=
 =?us-ascii?Q?jDnynfGkmdVlKLgyKGikRoVaVZDJe1HkTWTZgDN1Ug+Ivniu4BbYLOAthlOU?=
 =?us-ascii?Q?9hrNGglDolJIV5SX48p8bpI5ivZjS67/QN+TMLLvnvexW7Juxltf/vRRq7kA?=
 =?us-ascii?Q?a4dXZPK5BIFG+MrKzK9A4Q2cyY36PspGAS6ErmEGL7JFbWyCqgNQG5qV1ynS?=
 =?us-ascii?Q?X5lwipLCNa6oOn0q1Y4BmwvNI5K9rx0SjWeLAYfeosu6rkjE/pQP+vpkZ/P3?=
 =?us-ascii?Q?lAUzTgj5w+ylsHXwoNpd4jyK0YP+S6m+zIRtYp76kEBaBa6c71V+9umarppE?=
 =?us-ascii?Q?BEjXFZMZ7l15UDgvggQWl8OpXnlFuad2UhOKGToSKtlGf30PdOqKlR2KaAZP?=
 =?us-ascii?Q?hGkJ2co/eS+b25d5m386HBaQXtla6uK5Gg27mA9Hv9iedRRIaxY8Exvhg+RT?=
 =?us-ascii?Q?uHtMNI8FruigMl7LUKjDzpyVmU+uuNHWtxi3aq/aqjwJhwN66WbXwmL9yZtM?=
 =?us-ascii?Q?Mm8MuWpEQCvbv/3wt9+UCYgpzY8XWlBwBbaia3N0Ryt0SJwHT3EdlOSsE9/0?=
 =?us-ascii?Q?1WyEjyOVvEzSaIJTcu8jLF0QPZVbaCh+Fcxm84yNLlwEr8LR3zce098y6xqY?=
 =?us-ascii?Q?aQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 64ddade7-9dc4-4b1d-dfad-08db9793bbe8
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 22:14:57.4679 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /G/p2M6M75SdFn95zmKKeoEc4wfP0Wxt703phpf6ZGC4jgCzeI4RCymYpNTb1744RZNosvwxQH9feBbC/cQMFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4849
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH igt] tests/xe_debugfs: Skip test for tile
 count
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
Cc: igt-dev@lists.freedesktop.org, Matt Roper <matthew.d.roper@intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Aug 03, 2023 at 03:02:48PM -0700, Lucas De Marchi wrote:
> Once upon a time in xe, tile count and gt count were the same thing.
> This is not necessarily true anymore. Example: Meteor Lake has just
> one tile, but 2 GTs (one for graphics, one for media).
> 
> There's little value in comparing what the kernel exports via ioctl
> from what the kernel exports via debugfs. Just remove the test.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  tests/xe/xe_debugfs.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/tests/xe/xe_debugfs.c b/tests/xe/xe_debugfs.c
> index 5434d4645..e51d03661 100644
> --- a/tests/xe/xe_debugfs.c
> +++ b/tests/xe/xe_debugfs.c
> @@ -104,9 +104,6 @@ test_base(int fd, struct drm_xe_query_config *config)
>  
>  	igt_assert(igt_debugfs_search(fd, "info", reference));
>  
> -	sprintf(reference, "tile_count %lld", config->info[XE_QUERY_CONFIG_GT_COUNT]);
> -	igt_assert(igt_debugfs_search(fd, "info", reference));
> -
>  	switch (config->info[XE_QUERY_CONFIG_VA_BITS]) {
>  	case 48:
>  		val = 3;
> -- 
> 2.40.1
> 
