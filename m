Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95398C98302
	for <intel-xe@archiver.kernel.org>; Tue, 22 Sep 2026 22:21:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 520B710E775;
	Tue, 22 Sep 2026 22:21:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FxFXmG+Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84AE310E769
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Sep 2026 22:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790115697; x=1821651697;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Pn210D+iSINYD/b9rBQzHweutUxWQloiv2OrJ7c6M/k=;
 b=FxFXmG+ZS8BlSi/H6HvnoLFE/BJw++kbdeO1CvxY4/XbMJY+pYBbYtJD
 fzVClrXMauxL3LwexrErRQ1i32kzGgIH96FHcy182MRycLXXcH+nM/V67
 lbd6D9XFoEwijvscjFXY5ktecsJaz2C/ik2MQPLJgsIC8eb54SboukkSZ
 GIYD+2VoF6Yu/CCtv+N+X3OQMMezmf0GlBggy8iTabW8q8ZxC8xyPChNW
 DeF+Qa20iyh36aym6+vkN9nMWcMZIB8MbxS6mngne6pDIOyy2BA2CMcpd
 rLHDkttn9qzfCnHLIvNwMWnMmZmX1lEKf/IdIH+Xt0jFsB2fkrvhkpOkg g==;
X-CSE-ConnectionGUID: l35Qm+ztR8mQmosoClcqCQ==
X-CSE-MsgGUID: r0Wza8+uSLqizUa6LiF/Bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="89681117"
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; d="scan'208";a="89681117"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 15:21:36 -0700
X-CSE-ConnectionGUID: cfrqgwGYQQGG0N4U+aEG3g==
X-CSE-MsgGUID: h2/PTj6dSoyXgbMLA+UkSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; d="scan'208";a="271907001"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 15:21:35 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 15:21:35 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 22 Sep 2026 15:21:35 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.52) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 15:21:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GuxuNAJyPfUoisXIg08gsaivJvOgUvRtXcOdp7DfKFn4TqK3P3a42YJQAeSWvNqdm2GJZwUsRbqzPr4q2sjNnUdR/v+XsRrsgqURk7flGxzyFu+73955Q3E3N3SLoe5WS/0+Rcfq11c4BrGaOr7hcxsT6i7Whm6IM3ApmaRy0uRBjA0Mf4W9X3m60KkEq3WE3hty0Q/kH5y/mZotnY6GhZA7cGyRDaB6WrHiFFA+KsL0lamnMDf+XZG1kf/WvrOVcGqWmcnrhMyVcvsMvNwGUsyvHXnOF++SMCnn88jBEbxc7VWBXj87SnsswPpMnWmOtIZtv4THMnbzCp/9+YnidQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=35OJrbMezIAc8VAXyYBhLzhekrffmTxI6697tzAwlR4=;
 b=toZ5RIVuWVa1fIQsCIcEhgfjppdTh95beakDON7WYcJjSMyt7PoGEj+5DKbJDZzrsDIAkiwE8L+nH/ppXn127HIwJ14w+AwpwmmgGB6DWujFMdLzSPB0qDVqQvmHU1rw5FS7GVA/uwfmdhBQy3P5pS1QLDs7w2WP4w2sM+Pd48nDIu8MXP031a7cqBvWVJ0RecQkyKD/5rLmfAQBmmJpgCbo3Z1TUXuJERX6ofhcQmlYHK55xBigaQ0klbKcXq2f/ewtxJBEGLmhTupZAfG1S+Pwk6NxDgvpvqqj/9ArclaZN7YFbeLyqOq530eu3HRdhPAqvz6djcv2X/XA+1YIvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by PH7PR11MB7050.namprd11.prod.outlook.com (2603:10b6:510:20d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Tue, 22 Sep
 2026 22:21:32 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0451.014; Tue, 22 Sep 2026
 22:21:32 +0000
Date: Tue, 22 Sep 2026 18:21:21 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Violet Monti <violet.monti@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matt Atwood <matthew.s.atwood@intel.com>
Subject: Re: [PATCH] drm/xe/ptl: Add a new PTL PCI ID
Message-ID: <arL_YfVMnFsqzzjm@intel.com>
References: <20260922165607.129560-2-violet.monti@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260922165607.129560-2-violet.monti@intel.com>
X-ClientProxiedBy: SI2P153CA0035.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::14) To CH3PR11MB7180.namprd11.prod.outlook.com
 (2603:10b6:610:148::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|PH7PR11MB7050:EE_
X-MS-Office365-Filtering-Correlation-Id: 269833f0-4032-4498-221d-08df18f7dab3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: LaKlZjjnxC/DSKbh0pXoIA8N9UlgfFQoDO4HJ7Vgof/CqVI5Van4mPYUuXhCpv0LCza26B1jrk5v3pxULB17LpFxfLahsfwXAwzubobGjvBJxHkyg5K5j6Ie88G6CE8m35KnSWBNFmxyZb4TIYtjX0yX8f6d5nI08jAjawOOP8Vq2bodNIIqYj4WeqsuT6heTEizL9fBY0xg09Kmov8OQxOOdCSm2aLEo9ijLFLcwQeGht2j+xYDxYne2TOLsK/2KYRbTBjVoodcrMZwfmsYpZ21JiLdPMJmnL+bJWM0Mpubk77stVE+cBl6nqACV0LjXLtsPboJtmzxObqs+8sNqCm/Xa8QN1mssLAd/DVmaFo345BgedtbDOTPUO9EnwOyOLexGBSqOFc2dsHw+oAvFA39moepXEb/Xx5tjwZmc91laqy8VS3vVSj8cLKUUtkrI1eVeahjhSBsdB+Fch3Y/KcZWe/TyrqvCDuJ0RwNb1UtL1dfOPaiZjp2l8O3o9hHmvDpGQeIUXILQtPaRXiV42KLuVBN+W/M3Hk6n4Pgppg3VpZ6w+5WCfzCrj+EKrfFBRw3pM36vYaaHel/gDDbESO1uddLsSwFiz8IGKghiCPXwgpe/zpCfFGWAAXx+LjVuQt/vnKJa/Pgq5F7kfv5tKsb4/SyEZgt+BTODi1SLVQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Z9A5dUuKZKOmPFULJvKuX8clNtXIZmwtImbx4MmJUuiFaRAIg3S36hiezCoa?=
 =?us-ascii?Q?BgpsVZsetpg45gyvNOV0zr33gpTgp9Nm6DXzh1BG0t/rLZ8XruBOCTTMoeYN?=
 =?us-ascii?Q?chcU2XeBYGm+KTuNfFlI9/rTmnfExjjdkRYIJQUqXMxxgeSviRR8H2MMMi0A?=
 =?us-ascii?Q?9pi1I5wSZ6tV5L/Kkahv+RXhzOB9HuMvIySabn0lrEdQRR+J2422tefw8zSR?=
 =?us-ascii?Q?JcBOgHI8iSno92EUT5R7rIDAhLLw4wSCjghmfGM+A1jrAsml1vgmSl4wAuM7?=
 =?us-ascii?Q?x1mll+Br69QJJwlwupjw40E7EMWo0wcSLRK7hs6McLxP9nccbaWuc3+HeW1x?=
 =?us-ascii?Q?3UZxo17mnUXpSQXN48rILeeoniYFaP6Udxh0qbgTAPOqzZrD79ZV+NRQVHOm?=
 =?us-ascii?Q?/Hbmn4ysQHPyrPyzbA/Lznzgt4DCEun9iakn9VXAN2J9EcNTZ0cds4ApjDRQ?=
 =?us-ascii?Q?BWZFISmNcUZq4mRKZTmdtDlaBrBybAhe++9fpcXzGz2t+QbmnD0RFSPq2dzh?=
 =?us-ascii?Q?oe1v+T5tHaEkKJ3WY5Na0nMdOkgZHCm/AZYE+Dbl8HdnATqaJGyw/NMUDk0T?=
 =?us-ascii?Q?xtsfDFq63DlX4/FROWhzra0rTjZ6es8xQCM1VWiyWICH1uZmy/UtrP1xIjW8?=
 =?us-ascii?Q?5C+6RfGELVi7uSI9iecnBctyt8iWCDxvhimOjqcArLy0PKqrtfDVcKy90zhd?=
 =?us-ascii?Q?+T23o2J+mR1iu0JNSTcWJTRLVvqpOzhBPFQAZKjWnpk9kQqM+A/gv4gXpZii?=
 =?us-ascii?Q?thr2whSVm2JWO+8vOr3L3lJwHahLGdxUWkgsrbJbjxAcBZmp3uXHF2cjWcIv?=
 =?us-ascii?Q?jmtfh21+FaOW1l1jAMGlMF0DrWyArNPs0UnqjRIt7tzKxvTDlLgiqpr8qLka?=
 =?us-ascii?Q?cDViPVcnadCSXhBkH2qFSAcLm5xxL0gALJvLPQ9ImcDqHF+1o65GmEyL09DP?=
 =?us-ascii?Q?jJ/baJ/7MVvNib5LArz14v77ShXICn9zyeR1uvk40hS3pEJqvOJTHQ+fMyoc?=
 =?us-ascii?Q?IFdiU5U9mU7gmUMn6xjOAgKf6HYNppw6zvVAyz2ujgGqiipnjBHlTXYgPCfg?=
 =?us-ascii?Q?xl3FQBUbZJOnm6OqzEt9TFFWQfGMiyKPvIPbVgnqAz1s+D3CjK2pVR7Qropk?=
 =?us-ascii?Q?kQAtJAB4XclTaRRbL6cJsLaMzaghyw9zXpBk+m6tJGdsqh/UL8+f5rGv3QQS?=
 =?us-ascii?Q?paUXs5TQJ0A18Lq9EfXq+luHGAjZmYvvJWikdsGcO+ZJM+zkSUaswwkirtwR?=
 =?us-ascii?Q?pzc2JyqLy+4AuXEYSBJ5IIw0+XJqo12WQ8+3105wgY12znTsC1KpRuBGzXpn?=
 =?us-ascii?Q?zTJNBCDp6nhP7fO9X3s8wjRy+nPlHiHm6W8zvxSekCwCqZ8PmCxkBWq3B7j1?=
 =?us-ascii?Q?qAHDoYyvwTludY0VO65E72+5reb93SqGTxHbhJavspjmuVbktRgszKGVNFRg?=
 =?us-ascii?Q?M1YUty03jKuOjLkahjtdSXc2GTfnKiEE8nlB9gJhlcOR3CBC3zPtnGELbt6F?=
 =?us-ascii?Q?Junge21UXzdSLD7YtDNuE/5q+C286oXvjw6VfRedwx4D5ZvfLSUh5xzAJMc6?=
 =?us-ascii?Q?TALYvbt6zjCE3qXTgTDNv4cgsdcH0qdzToWQCJkb2NVQmcdVxstz01d9e1NW?=
 =?us-ascii?Q?wYWNSS25ay4pf/7UjeJ8+R7N/kYFUbQy/nSDu80KqKSmjFcIe23wGWfnh3DF?=
 =?us-ascii?Q?1k3AjoM62bBTErO13WTwWUas/x/rgcxuksuAsXEHUGJnwPWjtc0nDXslMNtP?=
 =?us-ascii?Q?MWBViwpJBmNjuL7GQeqHro/xWyK7B4g=3D?=
X-Exchange-RoutingPolicyChecked: PASLIrj6EVcRbaA0mb9T2Pr3IOzPEryKJJHJWGto3XLc70EPkgvChrN5OPmGArf9qr1wBfSiyaQBkIZJpBLKJLhjU1EJRgl3+PNJqwRfBs35Tuh+NiutbHpTuxQtC8WvIixDWufXAqGz2bTui4UmK9Oj74XSjHou6KCGsLvzWk9hmSL738OZO9aSuVYagsw3vnEsxGo3Djq2CxEOHXKrour4iL7wFYwCGTysz7RAXXJ/16w0LE9XV97ToeOSeTNafHQB/feDHeBqYZiL9WgtjJjw4LD4PWvOhDl4DUr3ioep07A3wBi3jTqtOngNyKZi2lxDGSLZ79BHqQbjT+eIaw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 269833f0-4032-4498-221d-08df18f7dab3
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 22:21:32.6483 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yumtLe+KroXNn0rY1zujcFN6VcE1NmbWamxVuEMraPRMy5AueNmPn0znSblQO5740E4dU2H8Zo2cF+PlNUVNMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7050
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Sep 22, 2026 at 09:56:08AM -0700, Violet Monti wrote:
> A new PCI ID for PTL.
> 
> Bspec: 72574
> 
> Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
> Signed-off-by: Violet Monti <violet.monti@intel.com>

I honestly believe it would be better and faster if you had just reviewed
the version that Matt sent yesterday instead of resending it.

> ---
>  include/drm/intel/pciids.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/drm/intel/pciids.h b/include/drm/intel/pciids.h
> index dff389b56eb3..32c88a690ad8 100644
> --- a/include/drm/intel/pciids.h
> +++ b/include/drm/intel/pciids.h
> @@ -880,6 +880,7 @@
>  	MACRO__(0xB08F, ## __VA_ARGS__), \
>  	MACRO__(0xB090, ## __VA_ARGS__), \
>  	MACRO__(0xB0A0, ## __VA_ARGS__), \
> +	MACRO__(0xB0A1, ## __VA_ARGS__), \
>  	MACRO__(0xB0B0, ## __VA_ARGS__)
>  
>  /* WCL */
> -- 
> 2.43.0
> 
