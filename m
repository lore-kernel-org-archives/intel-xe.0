Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E64D3C4332F
	for <intel-xe@archiver.kernel.org>; Fri,  3 Nov 2023 17:36:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9863A10EA45;
	Fri,  3 Nov 2023 17:36:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BCA110EA43
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Nov 2023 17:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699033002; x=1730569002;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1kOI+jBpNK/8UXCldJHp3AprfuvlZwj4FXsMKvDy15A=;
 b=T77+dSSmyPFj9WhDUU8HuHipXxiXue6v2a5qC+6OBMbb7Z6YsfNgwJ1f
 GXc9rFlnorWTVUJYxvzRrBaeCXpfd1EFLUH4RZ3AfLC3x1NDvgOMCOSrR
 GitgLhpOnmKOAHdjRbNiunNb/e2jgwevwQruoy8MPPv2GSWQlq6GN0a4p
 405vbZzNSsRq4l1hNxQ8zVYk6M4KtHmQxChvq14SREp5Z/5oY8d8HXT/d
 keDyV+EUAfuLf/494fkl2fJMrUA0xXjBQVTXCS+QjQLil7EMYUhbax9Hm
 QkQ4t4gVB+yDxwpMBQOWQ8dMMf2NswFZ5zxPgm8cc9MAdc9XqLPxpmwAy g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="387879683"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="387879683"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 10:36:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="738138455"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="738138455"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Nov 2023 10:36:39 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 3 Nov 2023 10:36:38 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 3 Nov 2023 10:36:38 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 3 Nov 2023 10:36:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lzs+8usRqGrftWajhcwi2N+jpZsj9Jo5Dhwv+lG/sDLCA9SFXzmGb2WIhSfgA1UqoXwcqkW5lT3Nc52YimiOckYxKeaY7mQCUFnM0KxyqlaKnrsEYDWLImiktH6Sv5shdykiZyQxP0BU1Sokzt+y5AOypJzzJB7BBIhF9BtCM5vIaFLOY2oZ5JESxO2ptS69ZqbkkE2/7ZOVG74ps0eAfZWk1EBY+5dOFbvZAFIurYQy4z1w5p06XSwPCevbp+FWUql9liiIQL5wugipsAoGl2ZGQdc9SvG/BzxzbAoepDSVyxuHE9i1Rpqu0sPiUuMUP+DGN4Z2BO18XcaTkiJx/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ieaF9Gl83t/mvqHV6PotUzFJ6z7Z7pHHzpt9o+No4B4=;
 b=D+WnIJqPXgnulIV/+LBJ4kP4JXHykx2UlspUGgAYLatZ1GIO5zyJ3Dw4MUPXHhgJJY4civzHduGPStAkq9TydIsvEp5aHMu9vnKkdqzksJKfhbqJYwSC2vv3yHATgKzT3c8DdhisxAdoeSFyvrsGQ7l78ArRW7n0E8eO4boCIqa+gIuR9EsK36xEHWWJpSLCm//uJ/ECFE0WYtPn3MCPi8i2IqbWmCUFi7gba9HGvgTTIXuSUGQPk6+qA1zxzd2r8wd1xXKrbD4yhEBZDHPyb4GwDcQ5y6xIU3mzFFINCUuWzPargXpb7asDAxryEPK88hncQsTw/K8/bdYKVIdh8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ2PR11MB8499.namprd11.prod.outlook.com (2603:10b6:a03:578::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.21; Fri, 3 Nov
 2023 17:36:34 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::dc77:69e0:a3bc:e3e]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::dc77:69e0:a3bc:e3e%6]) with mapi id 15.20.6954.021; Fri, 3 Nov 2023
 17:36:33 +0000
Date: Fri, 3 Nov 2023 13:36:30 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Carlos Santa <carlos.santa@intel.com>
Message-ID: <ZUUvnq1Hv3Tzx3D6@intel.com>
References: <20231026220127.3406918-1-carlos.santa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231026220127.3406918-1-carlos.santa@intel.com>
X-ClientProxiedBy: SJ2PR07CA0022.namprd07.prod.outlook.com
 (2603:10b6:a03:505::24) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ2PR11MB8499:EE_
X-MS-Office365-Filtering-Correlation-Id: 6972e516-45ea-47e4-78e7-08dbdc936c2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oDdkvSyWMdn6rFV0VXrQyti3eJuovBHSV4HDtcEZxaLnW8pkY+1eA7WFqU9bl6UG9zHT9v9wEOMIuDu3C14IPKjY8c/9YZV3WCI4lw7MFV4I9FsAaZCipDdzNrhwGxbSeQreJbE+58FEfpThytIh3oXsylEDlrS5QMPn2oGTVV2xg0EzIoB0ukSf3y6MweduWEvPyxlrTzXOb6b6auMb5E4rmZt9uFswrJQ/4uAkNSo4aPxRZ0cPxBtKTeTqOZkLYxXHvxoOJVe7/HDZ2YsD52pnL1bu4jB/qHzFSj9OzGbpL5u19HHzKSsGap8s7MthWptxQAEYwtccCH48si8AGk+TXBnCmO6/d3HkdXlce0KnWbpBbRbheZupkpm2MJ5xtZG5k+qmqjS7kjHgTlTt5Id7BsmZl5cPEFQ8qH2IshUbsuUMKqs6ILgnPAQ2gXXFW7gKPSGb9uVvi0isQQGvcU+EOn6Eu+kcIussNCRQ3gNDLoNFd3INb/K/bVoZvYOnORL7maCMmgDTBTKZEWa212vTbdT639VLe2+kVtkan7ApfqiUCwQKTitCgMRwYNkBL0qcUOnIWZSrMIwbnrvbm7/gY2imhlL+JhIM8uwGW5GN7csoz9QWNWx8fRaA67EJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(366004)(376002)(346002)(396003)(230922051799003)(230173577357003)(230273577357003)(451199024)(64100799003)(186009)(1800799009)(2906002)(8936002)(4326008)(6862004)(8676002)(44832011)(5660300002)(82960400001)(41300700001)(36756003)(86362001)(478600001)(26005)(6486002)(2616005)(37006003)(6512007)(6506007)(6636002)(83380400001)(66946007)(66476007)(66556008)(316002)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mVd6qs1/nw8W2CrAcpxuuUpfzhoBSGpCOe3O4J1bUP7hvQFrQVeJfBqAaHGD?=
 =?us-ascii?Q?R7Qi6BSI68wekkrws5Vez1qPPagxBELzYlO/RtdNKwCVCb5Wp+CJzQREr2g5?=
 =?us-ascii?Q?EtXe0zroSVkSdeCVeLBxkODPzGjGGxIGDQ95ycdBDiLaYgE4Bj6GB4mrtaaK?=
 =?us-ascii?Q?1/U99fJs2RWTFlJHsGssGTyzaeJtEc4ufV4dlKoOI4Tab2Fqi/kMAcl9HB+2?=
 =?us-ascii?Q?oZdksd4w5XOKTHmgfoJAeiSb8Mzju8y5IjcOcE9mxjFu2FKKVJAl0hFvy6Tv?=
 =?us-ascii?Q?DywxnPH4MQWQv5+xO9O61iObyfs9unpKfIJopJZNbzkWgyE/cFe9uZuYbphT?=
 =?us-ascii?Q?mM7+5RHb9nk3rOgZVhl6x/Zja0Cc8/edZvFRv2WmdHeEc4v9lppXiKCRGTvq?=
 =?us-ascii?Q?JAu6SP6COLc3FoIftQH19mM64CXwoARXpKlW7Rfd28XYiilTP19rkCshDoZV?=
 =?us-ascii?Q?CjFHH/3ZftT6udjoeVo4/4Dmo8Gxiso3NmXR3UXN4oA6T2roenvKZwjKVvSx?=
 =?us-ascii?Q?uNWHk9Ye/7mnFFoGrPNffAqikipP6+kEymcPSCJyVQV8kNxxVu1JHImsKLeJ?=
 =?us-ascii?Q?LbOwSrp6Nfe00oj6LKmJO7i4Gx5dedOwSKM4XDuLVHJ+hDrJUvMbKRWQ1+Da?=
 =?us-ascii?Q?PwMoydQxQgBS5BRAEEXOok7xsRoSy2NzV22EPLH32h+hFezaGSUVPTab3421?=
 =?us-ascii?Q?GWijlj36mScGLNeIFcWZQ4hZQZGqYd4Inzj7Cgl4Tyip6LR2BveG7jXyVDGy?=
 =?us-ascii?Q?BSmNHyGObfWBwyxpO2uLt5xJcOl1/RB9tIu6I7KMXwAYD8uOfXZ4TwPbmnxO?=
 =?us-ascii?Q?m1mVzhrBe5tzUd++VTLawIEaQQtH7bW28+wK41wCPiP2mGgooP6xASOZO/Ys?=
 =?us-ascii?Q?FFLOLAvFVz+qVA3o4q8nxIIejQc/rsvHQp704g2Ck6cuLNjKFHHFoHk/5+xn?=
 =?us-ascii?Q?ljp2WuDsGTErzD2Z3XO/BtebMHHrdc9BNvqaYCzdS6nERyxSsrpxamQQNjVJ?=
 =?us-ascii?Q?jvTqiVKWSkY1VgVRq73pyqM4kiqqduDDju1gcOxt/iMk8pj89nODqYU54YRN?=
 =?us-ascii?Q?dW4u5ppgZ8sh03TTm0CV9YtnIP1kjzPk4v0iW6agMo595dsbxSrHYhw6Mqqx?=
 =?us-ascii?Q?6B43pagnNoFg2T1QWPXcHMkI23bbLzknq9pNBd1k4RQEavAczTgK56FMitPx?=
 =?us-ascii?Q?OZ2HAD8BeMdan7q0ifZZnZQ3ED9l3uApMQdf/NqHMwlmfJ7HL9Vohe25/sn3?=
 =?us-ascii?Q?6+9PGVy1xYRnOrW5b+GhX9fVpD7a4eNjg0aAh3seSQgU60BMdzb4OKAA90eD?=
 =?us-ascii?Q?Me2yuC9BX2FCud/QpGTKjTPfDdgsccUJ/wZjjOdqBFw+Vg8h2kTzymAPKk7F?=
 =?us-ascii?Q?frYIM9i/UJBglvuCER0faj9ATr9Z3PByatwEve5GO6A9JMBfJlSh7hEy4itS?=
 =?us-ascii?Q?7jnkLOSBUfmxrlLwGPrL86fcIXCDLdBzxJ1z51+Ar78RatwiUs1J1IzapDLW?=
 =?us-ascii?Q?TtwsA8Be4wNOpWrGAcbGY51ITKNj0tqQtWWhyTa7Sns+4OhyVZ8rfeRQTrqC?=
 =?us-ascii?Q?1qWFHucd6Ts4c3bvHZ26GnGZKsxmFpIVSe/ZccIN?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6972e516-45ea-47e4-78e7-08dbdc936c2b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2023 17:36:33.8408 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hvgYrQCAXx9sOLjh6VFOrQymVa2drU72reeKX/r1o+L/I3MizwzFNnDgfk4LENEM5KJWBF2+IKyPi1N+TVt+QQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8499
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] drm/xe: stringify the argument to avoid potential
 vulnerability
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

On Thu, Oct 26, 2023 at 03:01:27PM -0700, Carlos Santa wrote:
> This error gets printed inside a sandbox with warnings turned on.
> 
> /mnt/host/source/src/third_party/kernel/v5.15/drivers/
> gpu/drm/xe/xe_gt_idle_sysfs.c:87:26: error: format string is
> not a string literal (potentially insecure) [-Werror,-Wformat-security]
>         return sysfs_emit(buff, gtidle->name);
>                                 ^~~~~~~~~~~~
> /mnt/host/source/src/third_party/kernel/v5.15/drivers/
> gpu/drm/xe/xe_gt_idle_sysfs.c:87:26: note: treat the string
> as an argument to avoid this
>         return sysfs_emit(buff, gtidle->name);
>                                 ^
>                                 "%s",
> 1 error generated.
> 
> CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Carlos Santa <carlos.santa@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

and pushed. thanks for the patch

> ---
>  drivers/gpu/drm/xe/xe_gt_idle_sysfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle_sysfs.c b/drivers/gpu/drm/xe/xe_gt_idle_sysfs.c
> index 7238e96a116c..8df9840811cd 100644
> --- a/drivers/gpu/drm/xe/xe_gt_idle_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_idle_sysfs.c
> @@ -85,7 +85,7 @@ static ssize_t name_show(struct device *dev,
>  {
>  	struct xe_gt_idle *gtidle = dev_to_gtidle(dev);
>  
> -	return sysfs_emit(buff, gtidle->name);
> +	return sysfs_emit(buff, "%s\n", gtidle->name);
>  }
>  static DEVICE_ATTR_RO(name);
>  
> -- 
> 2.25.1
> 
