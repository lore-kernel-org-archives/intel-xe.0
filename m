Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90B83C47077
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jan 2024 23:14:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D4B110E0C6;
	Tue, 16 Jan 2024 23:14:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAEE610E0C6
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jan 2024 23:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705446842; x=1736982842;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=US+qdKB9Ec1whzE9qDGtTSb/wfjq+K06pHQhbAi7Cp0=;
 b=h/OrR1DMPeA5edUJvflHZbhOCH/0KCt9BeB6zADGEEHhG7sn7LGgiuQV
 7YnrpF+c7VIgn7/ziWZsX6UKv4DwPOrSYqneQEf6+oHUaXLcmU70siHNb
 IR0+DREqad/uZRLIgyM7vWR3rCqHtoeOVbJ6TFgGWiGplb2UcxDQ2jx9T
 l/3nqvmwSeSl2Xjtf/0vEKrUCbNo+YasAuBEKs8eGYOz+YIb11uZ0rj09
 WAmmBLWoUlVnuYOG2vkjhNF7MTZ//w7VZxmKUH5e8ZPYh2ulmZ5oWA6j8
 IK7UPBexPc/aHRHEWWa1dkbEg6iABKkH6eTbfOy+OgTrtU/JAU438dDC0 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="7405252"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="7405252"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 15:13:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="784297306"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; d="scan'208";a="784297306"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Jan 2024 15:13:58 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Jan 2024 15:13:58 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 16 Jan 2024 15:13:58 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 16 Jan 2024 15:13:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wb03JyS4ZcLogja78kmkqI8611d828WilDEbZ55BbEcLxMleYTlEvAdPpWJp2ghZQl5UYeI7tAMhszKr7Hdk7kudJizR+g4VZM7QhbUmMRjZSn4fpxj3EKqV5dMohnNSINDKtRETlI+Rujd127VJr1ubgyuVRfOvBi3kQ3YHT+sRnC8+xgfmzjD7YBXEh5s6sFFWGAJHkrX/RIXpYHW7n3U8xxbjbdjFq5BA3BqnZeZx4LbPQze3QFSFV4SO3Qs76j0/u39k7KUTaIT6bc77EXH5X/wZWapxXvVRqKqqHtNHy/RI6tbGyxlGDDph7BySkgMymR02Xpn3rRLOaHBheg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5rdTioHsZHVml4xmWig9YsiJD8DyZ86NWkkwv14Nlgk=;
 b=VWKqhw67/1+HPAxMT6JtUchGfci9vbb6bpMz3D+UM6d8RAA1dgNGRA4lYOjX6nZJRp8ZPZays2aI+OQ17BCVZamGSUDgWi9t547FFw1XWFFKCdYSHMtylszj27Wwd8VAHJzYFu6VX0mlO9J5jRyKOHDwperrdznefEsDSB1yh95uqF2EniQa6nkXtZ7vOIEyp2/YMgrbkIZ4Qq32U7z6+7/gy3+KFD4ZO+K7iBD1yPJy/K3R7dt60l7iANg7ItkaJEHdx47F8C7esTIt/QYzLAchnszvAGno9IQ0ZrqlLcETrsDcJFT74KcZruoa4umGbO/FKGXKcj7hvcE3zVMsDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by LV3PR11MB8508.namprd11.prod.outlook.com (2603:10b6:408:1b4::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.23; Tue, 16 Jan
 2024 23:13:56 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7202.020; Tue, 16 Jan 2024
 23:13:56 +0000
Date: Tue, 16 Jan 2024 17:13:54 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Dani Liberman <dliberman@habana.ai>
Subject: Re: [PATCH] drm/xe/irq: allocate all possible msix interrupts
Message-ID: <hbmo7n4bzph5umwvza76svxb4uzo7pc534szbmen4u74wqbwc6@3swn4vsn4mfb>
References: <20240116130736.1678104-1-dliberman@habana.ai>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240116130736.1678104-1-dliberman@habana.ai>
X-ClientProxiedBy: SJ0PR05CA0207.namprd05.prod.outlook.com
 (2603:10b6:a03:330::32) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|LV3PR11MB8508:EE_
X-MS-Office365-Filtering-Correlation-Id: 30e32e6d-83a5-4286-99d9-08dc16e8d03c
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zlLZjVhKOEFESwZDJvKMKkrcd2ALwqwpfcBAcg+A9zIOY2Y1xW5L03v2/TiEzFkdj8SaPIqPFLVJWnk01/gk/PfvwmWdLklUasEuRwcLxfAHA27jI2xY20P4JxPsCvdQBeRN7+8CnK81ZsW0BurLsxDx6rlkDsiAUdUywmGFFlOaZDlV/h3+aNhcQ2n89yA8EQ5EL+pLD4cLd8J1MQAGn4CrFkUVE9c/0UOR5j4thfzoOuK/yu3tYN2iVu5ngfrjdJ5iI15IMF3H3p4J68hFdn1EpHq24CpQxvGQr1olqq7si7MdGNx3+i+BMw9CIEGLVhplyrq6q8lP/kpMRHyZ98K7atcHlcn5Ur/3+i337Kr8i0CvJIcI4sJoQwfC4CYpsPFqx7Wk5/+8FDqyoL5I9/MWmVqE5gy39XAR71ZC/obWYCCtRcTf1JBLjqaHfZcwSzQMjYWAysgDCd4cqmvruxDAeoDGY5cQwbWs8mD1zrg/nTUrE4AsYdk41cqYEE7GvLCO4eOgaJwH8BYbLj0eGOKfCu1uDCRZIAD5gJpQOakN6T2cK00upPrmaaQJlCQu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(346002)(396003)(136003)(366004)(39860400002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(33716001)(86362001)(316002)(4326008)(6916009)(66556008)(66946007)(66476007)(8676002)(8936002)(478600001)(2906002)(38100700002)(26005)(6512007)(6506007)(41300700001)(83380400001)(5660300002)(9686003)(82960400001)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+g9YcGqEqqzc11YS2v+IOyjVSLCh5Nfx75ZRRmMFBaNNZTYyb3LcGqym2bCd?=
 =?us-ascii?Q?/WOGTWj4YiSWebBpBvyEPBUCMxw3JHhpKh+kRa2/yHMALn6KfFgcxrbTf6ml?=
 =?us-ascii?Q?XeSMc1DLMpZ0I35PzpsKmYIOZNA1uiyJfw6/64VYW0BFg4YFrSPj66D5qkZw?=
 =?us-ascii?Q?N7k2KTQWOqu6do0OKRLBADhcL+Oo59KcTm4Vg84dBnkLkZTwOj+ExUzxpj/W?=
 =?us-ascii?Q?IFBDcEhAzgbJHY2xWaZ6uzdPkVRRDI8igxJRiD0QXZGorypfJ8bvalz5HOo5?=
 =?us-ascii?Q?iQBcFMt1QIDi7VYc4FtH/SuGG8osnumPxcVzFl9gkEoH+0KClCHlrEIkUo+v?=
 =?us-ascii?Q?4o10FsnvbjtWASGx7uzKlD5hw71w4KO6E9JqHZ1RHv+llG1lpgFdymiTSHmG?=
 =?us-ascii?Q?zPYBD1/2Bn0xlpRPe+wuUIcswImG1p7Xk6TPMHhTV8n5q4ag49FhQwVwNIOk?=
 =?us-ascii?Q?L2DljENNK3J01l05eoNkrbevZD7Qi5ql5LHlLIYfBA7+Au5m8Bzm2DCB7/rV?=
 =?us-ascii?Q?9lpuKVfo5fjT1nLQ7oNrdADszeIBjw4njzS+AmWNu3OSzhDvODm2tcyPP44F?=
 =?us-ascii?Q?fK+tAbHGzDRNdaKzTTe+eAOobilz0KG9kc8eT/e/WaSFdsqwKEcQbVevbzr4?=
 =?us-ascii?Q?pcfLScDXG//+kvV8OCzZ250wuWjblDJhTPrMS4y41xDJzgT8RsxTnYYoPula?=
 =?us-ascii?Q?dH4qY9NhTTg1g5svaMdJ00iu6JWW66Lve3vAt7Xjx99uDBP8y48tkdc3MvPT?=
 =?us-ascii?Q?Br+3brtW3T39mht2j8Lhstr0uH8pxfHXJn2KlV6TXi/b8jNUTdoFW5zJtKcG?=
 =?us-ascii?Q?wMRzVovR0VnkNtnebbnY90GMP+zHc2FYg2+YaILa7YpXN1mgYg6ohLi5x/W4?=
 =?us-ascii?Q?WjPZ06uQKOR9qvCAh9lCGop9a4UCZNzLw4G12GgcIskEG1+0ri86XVtKNZvF?=
 =?us-ascii?Q?vNCWHFYrub99vq9KmsyLCmEldagOoiJO12VrI4+Lz2IjPbmZAWlgzfTJvYss?=
 =?us-ascii?Q?N7kwDBh3EF2ClT/Lr/4UtJlTIjYdcpCbtsQZXdJ48+hnGzeYjMDhoXHJXDGS?=
 =?us-ascii?Q?an9unpfLA+/Kd9PFQnTNyZk9ZO7up/JcrywrB4tolBb4VuYaY7iaaWcWXYfk?=
 =?us-ascii?Q?+djZ7Bz2E4Hqjxul4pHzHe6nSt3L4D2RlHH5IGdOoTBM1J8cNGA+90EJSQyI?=
 =?us-ascii?Q?ToH3aXha94zy2+YJK58LQtrmBDsAv5HxLl0ajKgqowZFJL1FKfQLtUFQ4aTw?=
 =?us-ascii?Q?hEn9iEjEinAeROWJsQeXKzJA7ngMMGoyxu5tK9xC32IU/mKC4i0mIFJf+Lbw?=
 =?us-ascii?Q?sbZ6UEeGJobQQfbExrZDX/XbIhOvzno8NkI+he3931q9GldNBzDuksUn0fCz?=
 =?us-ascii?Q?fFvuOId2uUdmuZ7b57ppSWlzPGeTg+ANzg9i+MpzHUhXT7Dr4mmcF8csjheo?=
 =?us-ascii?Q?mLEDA6DjuLkVc7wfAnn/UTzLH51Xtl1OJV19S/11cpRb/6I8+fzQJTMvQQZf?=
 =?us-ascii?Q?p3iN4cOFKcNPfrylxyMJJx+G/E/w9w272Pr7ajXNbghkPL2kuie44VfKmBD4?=
 =?us-ascii?Q?XzQmR1L+xLzy/qEqc8TIQ+eOzcHl13PnmR0oNtax8672vdtsXGhJwI0XVVFg?=
 =?us-ascii?Q?Lg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 30e32e6d-83a5-4286-99d9-08dc16e8d03c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2024 23:13:56.3308 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uP6Mdbo3q6R06EOFHYJBQ6wuar3lQ7gUhtf9kUwKyFNSqaPsAzfb2czEBw9NUFUHAQJACcbBZo/PxORgF9UpcBXO/DgR50dn3QWFoPU9RnM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8508
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Jan 16, 2024 at 03:07:36PM +0200, Dani Liberman wrote:
>For future platforms which will support msix, need to allocate all
			    ^^^^^

I think this is too broad. IMO better rephrased as:

"If platform supports MSIX, driver needs to allocate all possible
interrupts".

>possible interrupts.
>
>Signed-off-by: Dani Liberman <dliberman@habana.ai>
>Cc: Ohad Sharabi <osharabi@habana.ai>
>---
> drivers/gpu/drm/xe/xe_irq.c | 15 +++++++++++++--
> 1 file changed, 13 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
>index 907c8ff0fa21..62722809a01d 100644
>--- a/drivers/gpu/drm/xe/xe_irq.c
>+++ b/drivers/gpu/drm/xe/xe_irq.c
>@@ -662,7 +662,7 @@ int xe_irq_install(struct xe_device *xe)
> {
> 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> 	irq_handler_t irq_handler;
>-	int err, irq;
>+	int err, irq, nvec;
>
> 	irq_handler = xe_irq_handler(xe);
> 	if (!irq_handler) {
>@@ -672,7 +672,18 @@ int xe_irq_install(struct xe_device *xe)
>
> 	xe_irq_reset(xe);
>
>-	err = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_MSI | PCI_IRQ_MSIX);
>+	if (pdev->msix_cap) {
>+		nvec = pci_msix_vec_count(pdev);

 From Documentation/PCI/msi-howto.rst:
	The following old APIs to enable and disable MSI or MSI-X interrupts should
	not be used in new code::

	  pci_enable_msi()              /* deprecated */
	  pci_disable_msi()             /* deprecated */
	  pci_enable_msix_range()       /* deprecated */
	  pci_enable_msix_exact()       /* deprecated */
	  pci_disable_msix()            /* deprecated */

	Additionally there are APIs to provide the number of supported MSI or MSI-X
	vectors: pci_msi_vec_count() and pci_msix_vec_count().  In general these
	should be avoided in favor of letting pci_alloc_irq_vectors() cap the
	number of vectors.  If you have a legitimate special use case for the count
	of vectors we might have to revisit that decision and add a
	pci_nr_irq_vectors() helper that handles MSI and MSI-X transparently.


 From pci_alloc_irq_vectors() documentation
it seems you only want to pass something other than 1 to
max_vecs?

>+		if (nvec <= 0) {
>+			drm_err(&xe->drm, "MSIX: Failed getting count\n");
>+			return -EINVAL;

error doesn't seem very appropriate here. Only reason I see for this
failing after checking msix_cap would be if kernel was built without
CONFIG_PCI_MSI, which would then be ENOSYS.

Lucas De Marchi

>+		}
>+	} else {
>+		/* device supports only msi */
>+		nvec = 1;
>+	}
>+
>+	err = pci_alloc_irq_vectors(pdev, nvec, nvec, PCI_IRQ_MSI | PCI_IRQ_MSIX);
> 	if (err < 0) {
> 		drm_err(&xe->drm, "MSI/MSIX: Failed to enable support %d\n", err);
> 		return err;
>-- 
>2.34.1
>
