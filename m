Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A4D2C47DDB
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jan 2024 16:37:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2191610E7EB;
	Tue, 23 Jan 2024 16:37:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B66AE10E796
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Jan 2024 16:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706027858; x=1737563858;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kqApgw9zvJvj3p+1c2aLFpIuFdjwDU3NfEWGgOazMog=;
 b=HWZeCH82rjiArKxNk1DVNndfjfbivUvgirAz8mWAlR+SkynX8vaapT0z
 FLLKlH/8V8ZZ0fxnTtf2b4uW+rsp1uM53b8Q37PtXoFM4SAGUr0seTnP1
 rXL+0lyGw3U9YkqSjKOhlk27ev+Nr2KcqYakVyT2QRgeJ3FlcGOiNrc0z
 /R5Uu7hCmrRmXuwqijFMypx1m6f9EXiz0W98MpjC4IJIPgmsj8CxAIt+S
 7q+q+Nd8TKT841WEO10ExEqZNGvBN68sgJd6Cm1X3/vbSLoLqjLkl10eb
 geK5kEjQtM27/cLDZo8ocBe40z+iWq7jkGQkSOt0xLa00/b59H+NUIiml w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="391996288"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; d="scan'208";a="391996288"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 08:37:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="959186946"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; d="scan'208";a="959186946"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Jan 2024 08:37:38 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Jan 2024 08:37:37 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Jan 2024 08:37:37 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Jan 2024 08:37:37 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Jan 2024 08:37:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jBVX/Qb6vf3qq5Ma9ZD03z6yVej5YVr084jZq8URGt3MdN6yAuIkasfmEgQW4F6V8SDdeC25f6yRzRwLb31DEBNB1csHovmL5iNMkbIjtEUAue6U+ygzuIiG8ir37PF2PFpMhlQlQJS6bV2hLHBy3YTwmlDK2arcThLAVo3gQRfRV+RGTDY2ZzB70qPmK5xWl6iakDAviLW9TYruw9F+KMcDewliRpdylayifEX6zfwWPKJOKSOsUOyTkWWMKUy24hJzK1u9NQCCYjaq6JJpKGRzg3IwCGDpohfG7pnS8P88y31ShWSb1ZIihrpGK9m9x+g+X3cYWHtRYVJtDJd/SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AJLlwQgJodH+5xxFSaK37HXFGoVAh7Ln1x9T3ZoCQUA=;
 b=O1/O7uH4aEl17vTtki0Mj3XDN6n9XCnfv3IjZBwdavEl2r5TnP+9+9H+M1wXKRbkH1ptxTrQ7VqeEaIfGcjoi8oMXJaoKL27M48po4rdXMCVRrqQp4Sykhgoein8BmZKAVrPIFh41n54v6iR4hT+EG+g86Vm9GUn651JPlwqzYYKJuM0SXEzak26fPDPVCvA6HA9BGTr3EPBHaRCTwiFsZ4bNEv7/x2qBPREcb1SYnA88pXWrqswLOwecfQEtMKUufw5ix3XZduCBAnF0BVEJ04Wt5var1YmwiKklVZnRMQGEqMLrU4LuyQ6Q7vTGdPcDKhYe9lQESRcmR9YbyA/bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB7470.namprd11.prod.outlook.com (2603:10b6:510:288::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.34; Tue, 23 Jan
 2024 16:37:35 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7202.035; Tue, 23 Jan 2024
 16:37:34 +0000
Date: Tue, 23 Jan 2024 10:37:32 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Dani Liberman <dliberman@habana.ai>
Subject: Re: [PATCH v2] drm/xe/irq: allocate all possible msix interrupts
Message-ID: <fxq47vgjlyhjeijm26ftw37zzcza4ai4jwgxtvuekpe4t2y2z5@dxhsegrvwkul>
References: <20240121090214.2072923-1-dliberman@habana.ai>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240121090214.2072923-1-dliberman@habana.ai>
X-ClientProxiedBy: BYAPR05CA0079.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::20) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB7470:EE_
X-MS-Office365-Filtering-Correlation-Id: 11c13644-0d65-4d34-b1e1-08dc1c3199f1
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1O4h0/300bUfj73Yrs49ZKakUl+JNKYcTm56Gijuh3qUk+16ovi+BLKe7zUnhE+OKqMkxp4Cd6Ajivi9CC+NruCUGXovWH5Afuay9ojKfJIa6x2yOsoyq60/byi0nlM8J7SZpKBS5Up8NmH5mvwuTLABXdCZX7qH3wKpd1LwMnZPsQU8K6mc5UrKvD4J9YS/ItZiNxoibaRqgjHS7W9ZIPcgh6JXSsDsklZf5D6tn8wO0TBInenhM+7jpe1kem/OFnsKSZDLAc9FRf9UdntHoG0yuOt+qGZ/DjwfeR6CfHaez1gsosGQ8qx2mDXStiT2uZRIV+KFLqhXJeO4XWgGpSd9GsF7DMmkJhJBxcheeHcN/73BN6vipyZr5XcAI0F3z//hEK5HxHROHOYuN565Efpkdze0DqcxMXDL9cbLTgucq7f87jB5kx0XzUJQPgD8EpWI0G7t/QmL0Cf1dBHRQ3r3mNOlIziyktmhW1hUB5F/6KZ8gaSPxvC/SKi+gX6n/NtREzCuM4v72+/rRkvzwHInXvzt+YOVrLhHizNA6Voh9yce/s4RK5bJk9c+JwV5Sdm+gH+JBMniMH5hD/xN5FaE+YaPpCiMjThY4SPTwLmR3N+9VlxCnHf7vB4Kss7L
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(376002)(366004)(39860400002)(136003)(346002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(26005)(6506007)(9686003)(6512007)(5660300002)(83380400001)(8936002)(478600001)(2906002)(33716001)(41300700001)(66476007)(4326008)(8676002)(6916009)(66946007)(66556008)(316002)(6486002)(38100700002)(86362001)(82960400001)(66899024)(27256008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?y6mzV9ozk+tlS/Acs+4m1QhRoAuk+fLi42xZ0T4o9AsxsAT2uYW6LvFRMo+y?=
 =?us-ascii?Q?tQdqIhnOqOlc+294nohXA0mY58mjW3M1yS8wqCQKTdC5xXNGKn/f/lrXjZqK?=
 =?us-ascii?Q?Qcfqx9pczi1uMwoetcqrTYiYbA8XfASvkN9F7+7oNWpMZKRaeGLeNNtrWjvQ?=
 =?us-ascii?Q?xd4G7QkI37CGfT81IW47zs+tyRk4nK8j7cLEGIrGaK8cMKxf+5TGm4pxOykd?=
 =?us-ascii?Q?w9gqxU7A8blBawaIKA+8KFEU6FDit262rFKIDB8beRB70k2AW+UHTAv9EytT?=
 =?us-ascii?Q?Edwy/yBQKU1FnnyzehoMmU7Ai8i+aQH4eD7Eo4ogKT3nYjxu+uZTlH5RYImC?=
 =?us-ascii?Q?mb9UTVDrsW/6UAYQk7y65sk5tUrCrdouQh2/7FERh8YR5FeIqrn6RhhRnuhM?=
 =?us-ascii?Q?Th+fsyFxzEkSuG7LL3oAwK5bUGeW1gQu1mLZ5qJIGufeYHMHQs4rv+a8KQJd?=
 =?us-ascii?Q?rYhWMx6idJO88Ml1GJc0nOwQuPc4Srre45tHrMRo3liitoiJ+wxEW7lO9g9b?=
 =?us-ascii?Q?QPTNwnZu1XcCQLB/I2eDgTjehYqEmO3TfDlVfsVG5BJI/X51Q+15jHJ4KcjK?=
 =?us-ascii?Q?5meEZY5WI7ogwRr5NTx2WV5JlEIZKKYOpGf8L/AZ2I7vwC8x4HAcl78M2U0M?=
 =?us-ascii?Q?jlXGiQsMJ6sx4CIsi61q1NFtmh7hY8dikq53KZI/3HWyYSACzkHoeL4Rsc0p?=
 =?us-ascii?Q?kIgxX78xQWpSimT6tc4lW/17+a62NXNfRVf8VbEw3/XgGOGLtvrS/UyBsVgn?=
 =?us-ascii?Q?xBGqfjePdFmFW3/Qb4+WoDcuPmaWokHBzcGKJ7AzPA1pMiFSTvNdXJSHYyDH?=
 =?us-ascii?Q?OrmZvnvkqLHeWAYLEkJ7qe/wAxZ/fptciKg7nH01CuvWbOxVVAztP/YI6PCI?=
 =?us-ascii?Q?A63OKgWwmdNQAsDLURKMAwTKNjcSz82hUXMB+3EdAmv1cPdfGpLv5m750gRC?=
 =?us-ascii?Q?gWng0QWtjFB88elzn0jJ1EOWQc5b3WedJsvRuG/Yo/pM41K3rQpEhEP2XO2n?=
 =?us-ascii?Q?Cn+EgaIVMszuuFRjnw1rViixOo0SGstTOLkN8XHuE0Q7xHLVajoJRAudS2Ix?=
 =?us-ascii?Q?S9SpjoPHYP6E86TNzZExI7/O/gDGkTcnk2/vvK+OZapzJWixO6+wabUUMaUX?=
 =?us-ascii?Q?dDtPgQ7kNqFfnQbI+4q94MNNtFbfexTfkzyVJozk+uF20OWlN+jBfApQY/vP?=
 =?us-ascii?Q?Ju/Kb0CTtXPr8zlpLHrGwdpo8hQ7thXl37uBwjZG0vVbwBWJXtXdJRyeVCIB?=
 =?us-ascii?Q?04SdTvTP368xdunoXczYJNlQs9J4Pij3w9bdDDnuKBJ2ZTkall75deNMaxzE?=
 =?us-ascii?Q?KpccQ66nLgLb49QKoGwGvSAqVrDRGDUEIqyArlvYQv1hiABM7kyhmmYLmAaH?=
 =?us-ascii?Q?yYv3oxbXXaSWt9ogaOzVUXvGaYhN+HTvPTzI45SQpcQ61XjSgh3T8pkSIEgL?=
 =?us-ascii?Q?9SPFP+EycNJwWCyqs9c8g1KHjEUnhy1G76BGICFRSQ90Ng5NmFAuCYXdMw90?=
 =?us-ascii?Q?AGWaZnFRO6q+fO1hz1ECyDi9QySxUCRlCMwnfoPRhBUJZ1hWRl9KGiHoVW3R?=
 =?us-ascii?Q?FC8WzLQWTWqOPa5HGNRtZ9F/vkTiMSF2YzLm4RtBj922sLqCrmZXy7m7L0A2?=
 =?us-ascii?Q?1A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 11c13644-0d65-4d34-b1e1-08dc1c3199f1
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2024 16:37:34.3664 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3hsaCOcQE3MVVkV7NzylNwFtSaoBM10ZgxVn05PC7ILm+9AwXgHh9q5nFWT4U77tS/VsFXimAhkneW10cLyEub06qqFt1/hZZwdvV2qrx6o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7470
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

On Sun, Jan 21, 2024 at 11:02:14AM +0200, Dani Liberman wrote:
>If platform supports MSIX, driver needs to allocate all possible
>interrupts.
>
>v2:
>  - drop msix_cap and use the api return code instead.
>  - fix commit message.
>
>Cc: Ohad Sharabi <osharabi@habana.ai>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Dani Liberman <dliberman@habana.ai>
>---
> drivers/gpu/drm/xe/xe_irq.c | 15 +++++++++++++--
> 1 file changed, 13 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
>index 907c8ff0fa21..7a23d25c1062 100644
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
>+	nvec = pci_msix_vec_count(pdev);

 From docs:
	Additionally there are APIs to provide the number of supported MSI or MSI-X
	vectors: pci_msi_vec_count() and pci_msix_vec_count().  In general these
	should be avoided in favor of letting pci_alloc_irq_vectors() cap the
	number of vectors.  If you have a legitimate special use case for the count
	of vectors we might have to revisit that decision and add a
	pci_nr_irq_vectors() helper that handles MSI and MSI-X transparently.



>+	if (nvec <= 0) {
>+		if (nvec == -EINVAL) {
>+			/* MSIX capability is not supported in the device, using MSI */
>+			nvec = 1;
>+		} else {
>+			drm_err(&xe->drm, "MSIX: Failed getting count\n");
>+			return nvec;
>+		}
>+	}
>+
>+	err = pci_alloc_irq_vectors(pdev, nvec, nvec, PCI_IRQ_MSI | PCI_IRQ_MSIX);

these are just possible flags, so what you did above was for nothing? 

If platform doesn't support MSIX and we pass e.g. 16, we will still have
just 1 allocated. So, as I said in the other version, this is just a
maximum the **driver** wants to deal with. Still not clear why we need
this rather than just pass a value for max that covers all the
platforms.

Lucas De Marchi

> 	if (err < 0) {
> 		drm_err(&xe->drm, "MSI/MSIX: Failed to enable support %d\n", err);
> 		return err;
>-- 
>2.34.1
>
