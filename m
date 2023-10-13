Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0629CDB47E
	for <intel-xe@archiver.kernel.org>; Fri, 13 Oct 2023 19:16:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66ED010E63A;
	Fri, 13 Oct 2023 19:16:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 351C410E63A
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Oct 2023 19:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697224574; x=1728760574;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=slzFWKFqdhEco0wN07gaeJ3lK4e5vpVX4NiebKgaieg=;
 b=c8qmsf+l3978KM25mHtpfSsHlY9+a6ZKhpz+2XFpbwtpikRnLBY0/gvK
 8O8YnUg1IrSnj33z4uIh3MjMTUO9LlH6NAfJX9bkMpbrwRx3GgEhsjmcx
 mg3CBPO2eOO7oyduIR9UaAY5gWwTkjyaICRAOsAoZrniIml7zqyE94+Fa
 7HPGiyNvt5l9VIBr+5aI4G/l03xXxlNk5ZaBOZKGmsik8O2H3T9Ozb/g4
 xhyhN6OaFEcEXcnlpONzNzOeTdINi2XH4Kv4oEz+wyzWrcPtqspg6ogVn
 Rny1pkv/aGBwmvpkwouEIQZD8ceLRY2poust2meo73RnZ3sIzErBllTE9 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="416303979"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; d="scan'208";a="416303979"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2023 12:16:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="1002062320"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; d="scan'208";a="1002062320"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Oct 2023 12:16:13 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 13 Oct 2023 12:16:13 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 13 Oct 2023 12:16:13 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 13 Oct 2023 12:16:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TP0QBW1seRIMb/S0dM1cGU5/U5w1ASrZ85m8tQASsRNIc6ONokRbyfhAFvJPzYH8mJ+brXhVLLYX3usGC60rLG2AhMQ03CmWIe3ALZKJMMRrPIJ9BkApS2LdR16VWGXU9A3EeOSAjhHP/MEmou0X1w7hfv+C/3NlznLZ5Th+3LllnAfXlKg4GZ76LfUKi/X8BPBx/VKF4K3wrG/pHrX1RNOoRvEKPvGTyqU8adBfR7WEDbj3nkJehmBN8XXrYVb1TyAzagQg+MqCNp4TXCOse52jt/sBpD4VSewFjLxAMahgVYr22jQlYskkwIb6r2sZ/B+OKeEouOBNR6QcPLPqZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QbsNBSh5oXWFe25UKqDqoANs5zUhzYbyQLQP63ZpAOw=;
 b=KgkCIFf8leMGwBTkFuJwh2uyGnjNf5jk8GMv4c2n0EtWlc1SgAegJz/Dl8lX0d/xq+1DbNV/CHXkY41i/svxiQAfR15P/6SuR87zCPtf8Ai4LykAYKbWmDzNAvMT0J0WGWGakS+emKo/drKsFfFreROROnxN5i/5T//07erLiv38ZCh2pnmkg36/bX0GVEAhTQvHthgh2d3zRK/juE/Lw/mUVWttwXrwxTj8YHQ1mjB4hMjyGGaPOQvwwK6Ih/A6YY9/VH0nD5eGeQzjxxCW3Ih3DvJOA7Bs56U9SiaRCRZZx/A1AzOZE4Hz4qm7fyEZXUD47K5Qs+W74YNXeLcjHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY8PR11MB7082.namprd11.prod.outlook.com (2603:10b6:930:52::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Fri, 13 Oct
 2023 19:16:11 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5%7]) with mapi id 15.20.6863.043; Fri, 13 Oct 2023
 19:16:11 +0000
Date: Fri, 13 Oct 2023 14:16:08 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <zrkmcwxfi34oatuk7qxlp5odp4mxdhpvcgmpkpstgbqlbzyobe@gmtrar2a6k2g>
References: <20230915223459.2964036-1-daniele.ceraolospurio@intel.com>
 <20230915223459.2964036-4-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230915223459.2964036-4-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: SJ0PR03CA0285.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::20) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY8PR11MB7082:EE_
X-MS-Office365-Filtering-Correlation-Id: 6913b935-dadc-45e2-acb1-08dbcc20dc68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TZPPq8mCkqS5HhjTF8xl9/N4tsNdd21/qG6ZEA3Fb5NJ4tha0E9z0ZYjCDhFk9Bw/kKzvZsAACPinklzR7R2dProhmN4VknV4WXH8nuauEnnjYJ0BzSeauxL9gX1JgNUG5pZCBTfE+KB8EFNvFL+dmIu2GA64svWzWOnXuzdxphR7FRgwaI5028blKWL8YJQJNvvXitHZ0qYu1Yj5GPai5OpJVLdIfnY4Xlsi8t+L87jwDh3AsB6MC1+PV2LpR91wx8FhNUs9SnY8/e1e8Hn9Y4qVnH9fVc54eS6nu6tuA5qz9c6X0ufZotvD9nAt8AyFnYK3Y9ez/vzTmsVmzMFKblQx0dh70hiLeK99LI8RQ4b8UNnQP0RlmrkaFU0yOgfGl3iKCo/pRdJpE30Z5br+5/fITX2maz7fptW5xmsX6wusr4NSNEUoy5eEnzZk/8johR0Goj+dTtknWFM9Qg7xHprrOXE0z/qxzilH4WEHoemz3TKyIjBz7Q/7l+XpMl93Z3mCrhQ8DoFRYVQwkS2FAScHYaTFRI0Wzu00BaO3+mdcCZ5ky1ZumUh92UrqsPC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(396003)(39860400002)(136003)(346002)(366004)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(6666004)(9686003)(6512007)(6506007)(478600001)(6486002)(83380400001)(316002)(26005)(2906002)(33716001)(66946007)(41300700001)(66476007)(6862004)(4326008)(5660300002)(66556008)(8936002)(8676002)(6636002)(86362001)(38100700002)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?N93ipe4K51uPRJ6RA0zEIHv+h7QuG/gaxM55yfoK9AVi3MKsiG8C4rzedrah?=
 =?us-ascii?Q?7xKzWlV+BVMJGeU8U2jV4sD6X+Y/dQoxkQonYIO4ev366n3ZwUp30RxJmRfx?=
 =?us-ascii?Q?ZKc/tTb3Y/rlUU5u4yRKoGtp+21/sMIhvBoVuo2fNYIZ7u40DHw8jA0G0IkX?=
 =?us-ascii?Q?hlzWXjCqub9VukmK+To1e4t6a9SvlvosEvmRQ4Wv+lOKFEfBhWSf8A7Kh7am?=
 =?us-ascii?Q?8Temr8tYxFgLVXXjFP5PZXb4t8r/76FMpXqyCnHdbjsAjcQ2nRp227NEuiKl?=
 =?us-ascii?Q?OUe/XvIsbOJmJAgLsFa3XxrcSbJ+ob0xIQxHu9KEShpR6o9a52yX8BI99dhX?=
 =?us-ascii?Q?vC5XF2HvVZtAzhen60HW13ptAY4DFgzTnDECuDz1G9tQTUZS2ZnFNDcWHa4R?=
 =?us-ascii?Q?GyHYXd7lggEuD8UrooSunwz/Fm6CZxJrcv7XVVfnieuDFdS32PXWt9CrE8nx?=
 =?us-ascii?Q?b45L+nH13ewPPL4/41frWGSPcnXgoZ+GkYb+vLu9nGV8sIehdQFyS735kO6B?=
 =?us-ascii?Q?6dSoVnPJAqO3ZNqWrSh8nENB3kgB3dPUZsOHFtf8AIE1BNpHTMtsWFT4EeIU?=
 =?us-ascii?Q?zoNu2L40hp4k3yGwdTWANcNHt96zTVLFrx/E+TX+dW4IPdytTYlUPWecjVIe?=
 =?us-ascii?Q?l1EPbvP6LK2cbr0/uYybpfYUpHJuD6CkV+wGoMn4dDwh+4aS5KaPuqwctU16?=
 =?us-ascii?Q?n/zjQTKzytQbpWcHCaP3k5SnmdA20hgCkKx4Vldcalu8bgFelF/u1jx4o8JZ?=
 =?us-ascii?Q?0LQ5rPGXJtwSz+dJIVwRUaHdfdW2NvqYXc28OQCA3RM5jo8mU4SNcJbSeV1S?=
 =?us-ascii?Q?ZLb6WzU+MleFb6hiwFe+Pz+G05RdImindqYl0+qLQqiHSVEOy0XLEibJSk3V?=
 =?us-ascii?Q?4/y5E+p3u61hQ7DdWTcXEvs9GpeQWdn6aFxF7z71EQBf2SwqYI2iMjkZT/Nz?=
 =?us-ascii?Q?5LI3ZB983vp+ocqPz7wDx9Hp4gzikViYDcyulgk/O00aPc+x+14hq13zVHzB?=
 =?us-ascii?Q?MIcdRaAuTJlutMcQ3JjJnATPqIgvdjrM0NSaFRhR3nYDFEWpzGOdA4Hzbyc7?=
 =?us-ascii?Q?j8T2doPb2I2V8g+pQTGn71yg1mG+GKhav7eI5w3+qSyRFCkW5Digrx98PxgJ?=
 =?us-ascii?Q?9r+IkGktyTU/AiECwh1Rc+cMcNozZEt9qCNZjccuHBvZsCQYEkvSaG0SyjJQ?=
 =?us-ascii?Q?IulgkwbnOKj+DMkaz1tRRXoYW2+FHaPclpcWkIOPSN7oXxdem9nG3l44YUYM?=
 =?us-ascii?Q?g4uqD+nKT/uZDagiIT223uQNYZsR67rTaZKh8iVZy1ZvdW/NCN+QDZ8mLNxd?=
 =?us-ascii?Q?GglMJy++xyMQH3Na8t8BolN+GX5GXY3hXk1QS4QbBlh1dA7GG7ppcN7NPs92?=
 =?us-ascii?Q?xVfTS8TR22CtV7MYNYoQMkefK+UwrlbINOJuPZrOcfRbA8pI4EJBnsb3Ft5D?=
 =?us-ascii?Q?3ZWOF6WLem3nZ+8vqETjocdIdyBxGQEbw1j+QCvyDcr/TM4ZLW0U/IaAtJxJ?=
 =?us-ascii?Q?fw0F+TC6b5px3od9WCAixqyFKnLdDftzESJDQGkUYXTPjNQ8uMdO0uIZlu4X?=
 =?us-ascii?Q?YwPxNIbd23W2PsDwl5nK2QP6N9XK26D1+pAMueWrpzidKfvPd9DPlQDW/rnc?=
 =?us-ascii?Q?kA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6913b935-dadc-45e2-acb1-08dbcc20dc68
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2023 19:16:11.3860 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4HK0Yl4abyoF1pqP8ofNrhl2GBmfYgpLzkM0l4ajsilhuIjdJiohOBIn4NMLZnyYkK2C50G2C2OnKN0Tzc2IAMQsazHiWi0fsR6kyJ1eLwg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7082
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/4] drm/xe/huc: Don't re-auth HuC if it's
 already authenticated
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

On Fri, Sep 15, 2023 at 03:34:57PM -0700, Daniele Ceraolo Spurio wrote:
>On newer platforms the HuC survives reset and stays authenticated, so no
>need to re-authenticate it.
>
>Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>Cc: John Harrison <John.C.Harrison@Intel.com>
>---
> drivers/gpu/drm/xe/xe_huc.c | 6 ++++++
> 1 file changed, 6 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
>index 700c43fe287b..d753d2eb8954 100644
>--- a/drivers/gpu/drm/xe/xe_huc.c
>+++ b/drivers/gpu/drm/xe/xe_huc.c
>@@ -214,6 +214,12 @@ int xe_huc_auth(struct xe_huc *huc)
>
> 	xe_assert(xe, !xe_uc_fw_is_running(&huc->fw));
>
>+	/* On newer platforms the HuC survives reset, so no need to re-auth */
>+	if (xe_mmio_read32(gt, HUC_KERNEL_LOAD_INFO) & HUC_LOAD_SUCCESSFUL) {

is this safe on the older platforms though? Assuming this works on other
platforms,

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>+		xe_uc_fw_change_status(&huc->fw, XE_UC_FIRMWARE_RUNNING);
>+		return 0;
>+	}
>+
> 	if (!xe_uc_fw_is_loaded(&huc->fw))
> 		return -ENOEXEC;
>
>-- 
>2.41.0
>
