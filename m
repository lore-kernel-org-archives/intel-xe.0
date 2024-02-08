Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A9F1C4828F
	for <intel-xe@archiver.kernel.org>; Thu,  8 Feb 2024 21:13:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFD8210EDB1;
	Thu,  8 Feb 2024 21:13:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J9eyt1y4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6618110EDAE
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Feb 2024 21:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707426794; x=1738962794;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=dCDftqP7dKbsoonyqWO1H9ztirK2IrbA31q/bLeXUAs=;
 b=J9eyt1y4H5fUCnHLL2Bee+atWv848flqn/9Wm/44l3qVN6vTg6goxIie
 TRcBQchqstEJTuYwWon3PdnAG3ijQ7os/qzzQM+Ujl+IlA1mwzUdIMpUK
 33jIOogXFBpcx8jFPwcCJcC+fuJ8gObuO/B8Kf9N2b6k7WCwQe201JYaT
 GjLg51Koj4d/D0pDIfpHhxT+CUp2HCnyC3AbaKgyAqDXXv4hpblgtaVhH
 fQSWzMiS3b+Llu+dskJUpbaZSC/4z8z+NrAZUn0s9HyVmz7p9y4Gw1DSG
 jzZSB3MAC6VMzVY//24EBY1BdSyqk+BaW5ZGchKe7Cq+S1qT6D+Up2Mqe g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="436452083"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; d="scan'208";a="436452083"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 13:13:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="1740231"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Feb 2024 13:13:09 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 8 Feb 2024 13:13:08 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 8 Feb 2024 13:13:08 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 8 Feb 2024 13:13:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZkPYNbw2NYavDIKu7Ouln/pd6nYCvKVPKSEEYzWo4txZOSLa8gL0hXYLGymnsECsdmPnQMdJ/92TLGioM8qP3Mmld9sJqYzf2ufQyCo7n3NygU/LLmG/+243IvXFWy1Dqg8WFytw1Q/ij3BAU+yK94W7Fzum97Zqoc/6ElWuSxExUM4VvX+QH1ihVeDQFtiy7hFL1RUCLGUfZgvVkSGENRbTTp/InxcccVv4lVQAkMr4VrBy+2A68NQ3sNn+FlEwp8pds1QbYkIja313d1mjG/oHwJbpMNwepAaGPdkU1C/zVoyj6qEJDQ2lf3G+J/jkIVMxFQKbUzNinBh+M7s2Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LmuYGTh7R3WmG3CjD4/b5HweI7youKCA8KDOAWz7Vc4=;
 b=hDhx+zZvZNMdWM1dtvL04YDSSzPLppAXtGKXHTWSrxSf6jcsLSRxGmW99N8EbXkLbaiygcXJy8uKZ5ebWjRV92lBPU/989JIckEMP/zv1Z6QUsEcMan2HPUp83mu1H88QdnEGKvKaWp4DaRjWBPgVv9LyJXNBJmK7y91WxQgFTcVECK7xhBnt4GZ6YnlgSlKRUwsaByjwrJvwIi6RjoT8d1d3ZDXiFj8cQJV1asB14EUJNJNX0kepmhxVDRpth8LgTUZNRbIF/VuCwRA1zTG+3gKPKNOyfat31AC+V4SD2YLd1lJbywARTjeOVTImr3pNGO59fjfD6v70ibq5ha12A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY5PR11MB6090.namprd11.prod.outlook.com (2603:10b6:930:2e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.38; Thu, 8 Feb
 2024 21:13:06 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7249.037; Thu, 8 Feb 2024
 21:13:06 +0000
Date: Thu, 8 Feb 2024 15:13:02 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Dani Liberman <dliberman@habana.ai>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3] drm/xe/irq: allocate all possible msix interrupts
Message-ID: <x2x7ipeubyb4le3uy3cxuhqbx2woqwi6uh5lxzrll3jswddgnl@6owyixvogadx>
References: <20240124075058.2302235-1-dliberman@habana.ai>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240124075058.2302235-1-dliberman@habana.ai>
X-ClientProxiedBy: BYAPR07CA0068.namprd07.prod.outlook.com
 (2603:10b6:a03:60::45) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY5PR11MB6090:EE_
X-MS-Office365-Filtering-Correlation-Id: 669dd1f6-2504-4064-9ea2-08dc28eabeab
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b/ZZpaQpOiKvuxSOKRJarJgpab+yPds18tfE9cHW3r4yfALfj076RAvuzIYQw/0UW2RRHggPCxcaTKQO9AGapw/G0+Oq8HKUtayVppKVwoucAbbKqAA/XQzCP6YbqOOIAEE6W8r9wqY2iMjO7j/07afPlxKiM19HinZdMMhrHvvaMxv4MOcfxosDeSH9iJlEbxA6s50+sg8luft880REybMQ66V7oDU1bXfYeP7i3ezEWnv928auAaky18LLNF8sCppB4rFVkbk45Q+5Q390GPSkMC2yKJp+8y7brwDuPXX8oSxANphQbj8Z4r5deYuFRCCJn8SGkrc2NpaU5tYDFy6/KLPeJnS6PiYHXf5TVuw0Rg2kngcjVG+NEnBpIv6a+RR0fj/kUlVEA1014XDsZKcga2MDfo1oy/bUOEw5UoLDTR9nsTGy/QmqDHm7WNqVnZK6I5Xdt+wAIQz07I7XnVh1bQ31hfpZvCQLLJ7y6+KJCuGqez8WkuRlFfRrHbm2M6yobpnr1GzO2PNJU2AJypIuR/dOqH8qSHrApncr9F63OpXc9FnNaUKDPYq6bzuB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(39860400002)(396003)(136003)(366004)(346002)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(2906002)(5660300002)(41300700001)(33716001)(83380400001)(26005)(38100700002)(86362001)(478600001)(66476007)(6512007)(9686003)(6916009)(66556008)(66946007)(8676002)(6666004)(6506007)(82960400001)(6486002)(8936002)(316002)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PjqpEoQjefcyEYT+NJiHjqKVXdwNb44RYtE1X3slYzB8jOrGVhvkNeMkPN5P?=
 =?us-ascii?Q?bf9rvhG6q3s/HbCQn/i1ryrHFRlE+uDp8+okCgVMDNxg4Td24CI0NQwBSQyY?=
 =?us-ascii?Q?QVZiXSavKOmAgt2Fqi/+65Y5/0YOBGsEaqZU/5rchopVJWQuEZPqyOMP4gW4?=
 =?us-ascii?Q?fnmtrqAMR0UiD8Lwa6doVvb57WTZkLC+wWRzkYEJU+ak7yoPISB3u2iSoH5W?=
 =?us-ascii?Q?VN8Fk9RcT1GavO2GuV130VvyQXFmm88Q3B20NkaDE4Jf1PnxAjeZGJ7QMydw?=
 =?us-ascii?Q?77GqOFHHAxetHe4VD1tNSuOB2cbBVs1XWggTWTT2qMGREjbcpw/N8J5WoB0Y?=
 =?us-ascii?Q?Y2zg2Mb4GukDkbrpgI5KBcfgZk4I+04iytCDXmzo9CZqQTwB5BDdcbQsm646?=
 =?us-ascii?Q?qwxPCwWjyUm7wDm7uY6WxdxYhJ6Jw1zVdh3UY4iaZ/GkFC6MAIyxlvtT/LEj?=
 =?us-ascii?Q?rIjCWPx5BcZBAM3jty0sug5DQQXKLuJ6QHBpi0EpKN+QGJQyLw9bfES6k22t?=
 =?us-ascii?Q?YLayMwOgEdQlLQwSrOljMzNjnNjfPXL4ZZCG18pCbAmQsdofOa945sKzBENH?=
 =?us-ascii?Q?kzAKlNUfBUjdMsMcPPsHxD2pK02d7LSPxHgcl+U0JgkIPMjzvVJXw3sJs1J0?=
 =?us-ascii?Q?K3N98gkHQXIvoYnIHjzEmrDhbWTuV636nsBInAzn9XkkqVGNBG8imvaOe3tK?=
 =?us-ascii?Q?gkIxlHndU9XAWp9HkA+H4FvKW4zDxLOUz/YmVri32j6LyJVKDsZ/PGeJOjWN?=
 =?us-ascii?Q?8StkT4ypXNG1b/5cSWTovXDEUzU0VTX6CI+g9xiVqxuMnaCHnqjAIi2ENBks?=
 =?us-ascii?Q?vhPJ/V9F/CZ92bU5OQS6gMu1hvgh/mudhabOGJbrVjQC4nVY5AXvh0wthUqR?=
 =?us-ascii?Q?uY0nLq8xTCDcPUdk2x4Luvv+ajDWj4KUqg3/UXhLCF36SaxKlKzMvnhnsBFN?=
 =?us-ascii?Q?N6wF9ANz2X2CoFw6f46upcqclrXVSX8KnVdM2Xu7N6YsC8QtqDffmLUD3aCa?=
 =?us-ascii?Q?lNRY/sYxU4DeqDTjf11Dmr8XG0Dnp7TfVck1n8xByA1mjII5Xmjx/OqVT6Ha?=
 =?us-ascii?Q?6jFfsg+Kty5lZuDPljFNCPaCcBP8xLA9TtGkEK+SpVziQveB7PGnQQ5NCsLs?=
 =?us-ascii?Q?RN3l+815J1szYnwA0Gf8b6lgf2EJlOehH3QtjZXPNU9eXH0NapnxEsdYxmcp?=
 =?us-ascii?Q?NrvclY+lL3SDt4pdyYiPFxRfGrjV28BW16TCMaiCENh4BzJRsAg4lanlTDpC?=
 =?us-ascii?Q?jNz53OIE3mj0wZ3fWo8TSsB3Zz1D3zJkC20gq0617MearvnC2SZaBAdzHSR0?=
 =?us-ascii?Q?vcp3BUCqBhTZjHjdnlaxwcbTWj/NTV6MqlBhGjXhglQKRDMYzXtSyd6YTq6u?=
 =?us-ascii?Q?YWT/drPZ4NAGPugnocJ16EcOKAO6m2/nXCIuy0ytq8jFC2oTc3R12zowrqZm?=
 =?us-ascii?Q?fsEiuebdu/CVYoADSP1sp6uPdPqjI5VbP9kvxBzS7SJeSwvRtQ0qr8nV+LZC?=
 =?us-ascii?Q?x+K66y0S5Q5mY97EqfB73NtajU3CP8yayynY86dZHduQ0ehu9jZEz7TRJ6l+?=
 =?us-ascii?Q?AFcStpNTR19hy/QRGt9zjHYlB+WJfXjWB6XFfgsZ15EyKXRlOBYgrWH1vvb+?=
 =?us-ascii?Q?uQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 669dd1f6-2504-4064-9ea2-08dc28eabeab
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2024 21:13:06.7671 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ANGzbwZU7LwiBtKmIrfr5neQngJz+abdBywraRH/xVM7gKJa39XsVboVG+BswcKgsR1vv4q/LKhly7Qo/pFjdX25HSf6cIzx4hnLOLLBbQM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6090
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

On Wed, Jan 24, 2024 at 09:50:58AM +0200, Dani Liberman wrote:
>If platform supports MSIX, driver needs to allocate all possible
>interrupts.
>
>v2:
>  - drop msix_cap and use the api return code instead.
>  - fix commit message.
>
>v3:
>  - pass specific type in irq flags.
>
>Cc: Ohad Sharabi <osharabi@habana.ai>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Dani Liberman <dliberman@habana.ai>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_irq.c | 17 +++++++++++++++--
> 1 file changed, 15 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
>index 2fd8cc26fc9f..d9e23aae9e7a 100644
>--- a/drivers/gpu/drm/xe/xe_irq.c
>+++ b/drivers/gpu/drm/xe/xe_irq.c
>@@ -683,8 +683,9 @@ static void irq_uninstall(struct drm_device *drm, void *arg)
> int xe_irq_install(struct xe_device *xe)
> {
> 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>+	unsigned int irq_flags = PCI_IRQ_MSIX;
> 	irq_handler_t irq_handler;
>-	int err, irq;
>+	int err, irq, nvec;
>
> 	irq_handler = xe_irq_handler(xe);
> 	if (!irq_handler) {
>@@ -694,7 +695,19 @@ int xe_irq_install(struct xe_device *xe)
>
> 	xe_irq_reset(xe);
>
>-	err = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_MSI | PCI_IRQ_MSIX);
>+	nvec = pci_msix_vec_count(pdev);
>+	if (nvec <= 0) {
>+		if (nvec == -EINVAL) {
>+			/* MSIX capability is not supported in the device, using MSI */
>+			irq_flags = PCI_IRQ_MSI;
>+			nvec = 1;
>+		} else {
>+			drm_err(&xe->drm, "MSIX: Failed getting count\n");
>+			return nvec;
>+		}
>+	}
>+
>+	err = pci_alloc_irq_vectors(pdev, nvec, nvec, irq_flags);
> 	if (err < 0) {
> 		drm_err(&xe->drm, "MSI/MSIX: Failed to enable support %d\n", err);
> 		return err;
>-- 
>2.34.1
>
