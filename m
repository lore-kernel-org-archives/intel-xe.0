Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0CE9C77B7F
	for <intel-xe@archiver.kernel.org>; Sat, 20 May 2023 04:56:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B1D910E120;
	Sat, 20 May 2023 04:56:34 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAB6210E120
 for <intel-xe@lists.freedesktop.org>; Sat, 20 May 2023 04:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684558592; x=1716094592;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=r+AfX89EjJQebZYDp6rD9hDgJHpnao4jWQahWn2yC9Y=;
 b=YTkw6UuYBeGqV1nd33aJKhWIqKJ997QWmcmvP9hDB9DIQ1ASnn5gRmx3
 8tmxUIe/A3416tBRP/3OK/WT39qrKBs1rQ2tQEeMS0pgH7gxjJpCCL1MH
 FrrtdKOlbmUwaOd5Umeb9bBbrlGCER9uv5xqTZ2RbxqEKzawa1x7l80Gr
 E7duH9jARyKqd/mLOEtfwP6Shp3iyH9KtEXeuFVw4zOfJJl8u89nqzJe5
 X3+9OZKZOI6f327020SLdVZoU8VIqw2PEcRoJoOxCqCxGygnWhMaBFYRp
 rkwIoW2pOkWX4K5QQx26FastEMXeDxYbxcXYymKeQJq/95qj4EhpTFMNj A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="351390545"
X-IronPort-AV: E=Sophos;i="6.00,178,1681196400"; d="scan'208";a="351390545"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 21:56:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="767830582"
X-IronPort-AV: E=Sophos;i="6.00,178,1681196400"; d="scan'208";a="767830582"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga008.fm.intel.com with ESMTP; 19 May 2023 21:56:23 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 19 May 2023 21:56:23 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 19 May 2023 21:56:23 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 19 May 2023 21:56:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GF2oQyVGo07BZtn0/+M9NtqVsHRzrIS996VVm7hHIcqGAorUZ2BEgM4aHuqXISb6YY4PmFgmuGjZ8lj1Mw3hTE2Rrk9Xc7J3lLt4/+R2w+voD1+ULmitwx0JvlLGvFW4F40ZwJEOk5iuItv/KP1Q7LmtiSDzxy4sXVYBHZ7kYhf35QoamgtQy31yIeRzLj+gAbDA0+dPxvq39KfS3hVj2E/5XOf+T+alR8P6V10g/3la9ntOCTtPNIUOCgK6EVnv0VYZibOu6E+Dc7PP91AxargnK26CSpy6c00defD37O6Kd50W2t6iKDu8o7n1/DOMPd3U/YIvip/addcRqnsVrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cuodCwl6X0hgdDebEr7TnIWGBXqYq+npN3GrcC3V2kY=;
 b=jPh1Qz2WDOuAgZ0krl0HOHAtaXJrg3EDiR+kAacWnLhkIs33Jz888t13r0/y9g6k68ZguP0b4M17DWdYCgtOL0ZQGLl6NUR9OfP6rR7fU8nZmyUFeumAYkcw7Agy17apdTWXCIeISsEa94SXuF6VMUoWSl8v3FW2gqh3cWchz3ZCKnl8x9VflomW4VuugRaHDVa15hsgpBLrwR7B6C1bexi340z9WDOo0+daa72Mmq3PSAygw+HxVt4puhgtpVWKZH9Bok9F43pQSeleLLVqkZl7xL6wou2tTopx6RatJonUoNR5LVCS/tvXyN97Ww19hwx0dBuwHVGE6uJRvBbpUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB7087.namprd11.prod.outlook.com (2603:10b6:806:2b5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19; Sat, 20 May
 2023 04:56:21 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6411.021; Sat, 20 May 2023
 04:56:21 +0000
Date: Fri, 19 May 2023 21:56:17 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
Message-ID: <fpimmilnelp2fggtc4vtpezkh6fcrb2qjof3icwlizpskyebgs@xrd73kyqdkpt>
X-Patchwork-Hint: comment
References: <20230519194802.578182-1-gustavo.sousa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230519194802.578182-1-gustavo.sousa@intel.com>
X-ClientProxiedBy: BYAPR01CA0060.prod.exchangelabs.com (2603:10b6:a03:94::37)
 To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB7087:EE_
X-MS-Office365-Filtering-Correlation-Id: 825df2b3-8a33-4e7e-8b5f-08db58ee8d5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yTFSJzWHCkBTnsvdvyRFoOM9vwualHYQygJowNdEKN9av0zf1v9q8xDcJPWeRPzHiLQpYzvrd7bSGKpYfRvn3iMkHFF7jTHcSzfBCu8QPYK9GmhW2ZzTnMP4fzKAB0/Os75bBKPVuUmDh6/2EDmjRB+D7Abzr6xqMWNCLjZz+xjM98/1bLe5E9EOro1kPkr45EY/qddZzoEBY1pBMm+hVkktTo8TadnSqX3pG2qSjeAdsmd12w408DF6mOrNWS38filFNyfw+6ShDQnFuX6hs59Qy3V5iSANEiNMK/+owD3Ir6tSUCdQ1nbih5IlnTlmR9yPiDfFL87TTWWCTX5UcWdl7eD8CHPrGV15HbdNlzHDl6+bedk5PU8VFDNGF5RNseEbkEx0KbvdxEgfDJcRUfHEGhI91fvA51rKusNmVgma/YWKjwD8ZcpOLiYIdFQC0Dn0ZFwJ5/BOu3OJ5zBthd/k+FRg3Gp2DU+ZBLC4Zr4Fs6qh4ofcqQhLP8SO6qlqa4ktgFLw+TbUmytk5Iz5T7J/Pn2FKKUHcMoHRJf1P5MrnZh9lb+880PvxiHVTdwA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(136003)(376002)(346002)(396003)(39860400002)(366004)(451199021)(26005)(6512007)(9686003)(6506007)(86362001)(83380400001)(82960400001)(186003)(33716001)(38100700002)(6486002)(5660300002)(6636002)(2906002)(316002)(8676002)(4326008)(8936002)(6862004)(41300700001)(478600001)(66556008)(66476007)(66946007)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/RBkIsf7PxLLxhlaJUWGABTCan4rcWqsDQ2qJGL2pZ1faEKb6029aJgtX1Dw?=
 =?us-ascii?Q?VwfJb4VEcZ2DBcahiJpQsbTDP5BkMUI6CUywMJIIhoC6STyJuAV8sQKwXONo?=
 =?us-ascii?Q?mZng6xTQteknaQ2ZUJ3hDyolf+P76R4lHH+7J6ZBGDPCghXTH0HQzF4V3ypu?=
 =?us-ascii?Q?Ke7g7Z4gEw5Hk7Bv5Nv0lFBLapoC9rqP+s85AdZKfhka/zU56D3lNgAIrJRh?=
 =?us-ascii?Q?QgUHVNmO17C/Y14dRdarmkYbwGwYEmxXlxm2ODZLQScXqM6iU2trWngZD1eo?=
 =?us-ascii?Q?O/wBSyiMfEhCLx2h0fcTn+19xal0Ni4454+fQ2e4UcONUOAZWMm8+adow9tT?=
 =?us-ascii?Q?bJhZJw1wnUL7R9DBLl7gkAKjKHR4syHv4k0vY0MLgVZKKK9HA5LHv9u5D2S5?=
 =?us-ascii?Q?RTO5AT8AGikG6tSzKSfUkeEujQh8cbUskQwUjA8Et8BAoXbdeoXO0A33RxwS?=
 =?us-ascii?Q?JaRCqwYnWsLIU22W5GmdsrIfI1uQS31+G3teYfftPUi0fbBpMI7h4lRwAt82?=
 =?us-ascii?Q?o3PUkBZMcoDZSdafBAoKcxUBBWXkf2UmwrxjiTYjdCK5e5EboLUhC2HhlICC?=
 =?us-ascii?Q?utqxGchVEBDgpz+071WTrpv+eQ5s72HqirMBNx5sx4dJ58XCLdEi7A/fj6UO?=
 =?us-ascii?Q?AL2vFEexM+IJUzi43YoMYQuz3XdRPsizXvDCoCInVeBC51fPXV/uO4OarSyP?=
 =?us-ascii?Q?bjacrhpHm6YqzMLb+VIhrpEc9k4BCLvnsfIcDMuk/QzDzsC/wA//5w3RGi4r?=
 =?us-ascii?Q?m+9EgV/4AaMSDpF5dGqL05EkEthO80GDHUctwd9FDiwxh6K7oHGo4H7XRy3+?=
 =?us-ascii?Q?ufiKr5aY2KBy900+Lztie4wSmIo6LaBZCPcUW6QBIEqc30s8pX6iAu/crFqO?=
 =?us-ascii?Q?qy1aQICA60NyPfpPmIEHcYnk7fLzBOjWImTV8xnkrzclcZ7rVAHq6SOIvffx?=
 =?us-ascii?Q?NU85QjB2utileqwrorpvJnxEz4ICxX0jk3syvcUXo+nvocbV7AA2wDGBjbgH?=
 =?us-ascii?Q?JAeOr0TX+eb8D/CVnbgg0glCRn7dGe4qGNzfHGF53XuIya/UlwAOGexNp2pk?=
 =?us-ascii?Q?azpzWkn4+gqlflnRkVjmXwnYsZwCRnkQcF64GWU91HmJ8BA3vN+l3+Q1f7iZ?=
 =?us-ascii?Q?nspAAm4QG7GLh0ap42DDtBZ5qe8MHnCawfpkFU7pnSoYjiCxGlfrBN/HHG0i?=
 =?us-ascii?Q?kBQSbWjx2N27Gkn7cISE9QBEptChhm9tpN2sfEOt/j6EFUOeNMuWFpMXBtRK?=
 =?us-ascii?Q?dpApAAdxlpr8yb12SMfxgfOQsbh8cmJMV58b38jQNj0BtFrTLM2x/HZtIujH?=
 =?us-ascii?Q?1H5Dxjp1oXLTfsLacs+L93QHbUjihZWw2u77ypfdoc7ajKIE8J8gl8FAqBiw?=
 =?us-ascii?Q?UWjvo8xojt+wgOUusRCTfHTVOivHfckMHA+p0LdYdx3N30GQNeIAsjZfGlZ8?=
 =?us-ascii?Q?C0369k+BJDPiBobDSQvP16wph9rH13+pcaFPDX2jElFk44KRSNvEK/XBSudf?=
 =?us-ascii?Q?XLxFtO6ses2wNn5T7ueBIbltg0Yrgf3CwvaiGyj2BANir47tv4iWuHzy6D8T?=
 =?us-ascii?Q?Vxyj0NdBNXF9JuRkStgh7hOGD6s9Xl82haGgUi3cN+XfrCLKmPxN48/+bYlD?=
 =?us-ascii?Q?Ow=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 825df2b3-8a33-4e7e-8b5f-08db58ee8d5f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2023 04:56:20.5327 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XGyEwrSljH+oN3NxBUnMYcygO06JpNp9IB5ws/LmhyHs3jYHL+Yb5skx+LLuUsUsigQUhJCXGcQwGIv8l2bQ3p5O/DwDlwYuSfX81rRzXmk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7087
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Do not forget to drm_dev_put() in
 xe_pci_probe():
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

On Fri, May 19, 2023 at 04:48:02PM -0300, Gustavo Sousa wrote:
>We should also call drm_dev_put() when calling xe_device_probe().

I guess you meant:

drm_dev_put() should also be called if xe_device_probe() fails.


>
>Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>


Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_pci.c | 26 ++++++++++++++------------
> 1 file changed, 14 insertions(+), 12 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index e789a50a1310..2d0d50dcd396 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -639,10 +639,8 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> 	subplatform_desc = find_subplatform(xe, desc);
>
> 	err = xe_info_init(xe, desc, subplatform_desc);
>-	if (err) {
>-		drm_dev_put(&xe->drm);
>-		return err;
>-	}
>+	if (err)
>+		goto err_drm_put;
>
> 	xe_display_info_init(xe);
>
>@@ -668,10 +666,8 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>
> 	pci_set_drvdata(pdev, xe);
> 	err = pci_enable_device(pdev);
>-	if (err) {
>-		drm_dev_put(&xe->drm);
>-		return err;
>-	}
>+	if (err)
>+		goto err_drm_put;
>
> 	pci_set_master(pdev);
>
>@@ -679,14 +675,20 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> 		drm_dbg(&xe->drm, "can't enable MSI");
>
> 	err = xe_device_probe(xe);
>-	if (err) {
>-		pci_disable_device(pdev);
>-		return err;
>-	}
>+	if (err)
>+		goto err_pci_disable;
>
> 	xe_pm_runtime_init(xe);
>
> 	return 0;
>+
>+err_pci_disable:
>+	pci_disable_device(pdev);
>+
>+err_drm_put:
>+	drm_dev_put(&xe->drm);
>+
>+	return err;
> }
>
> static void xe_pci_shutdown(struct pci_dev *pdev)
>-- 
>2.40.1
>
