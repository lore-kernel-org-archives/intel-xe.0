Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98253C83F1A
	for <intel-xe@archiver.kernel.org>; Thu, 17 Jul 2025 19:36:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 545BB10E165;
	Thu, 17 Jul 2025 19:36:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZChl4Jal";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C64E910E165
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Jul 2025 19:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752780976; x=1784316976;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ZzZ+JaYcan8P0y82nBcBEt6vjv3Qz1NOPbYAgJoJ3W8=;
 b=ZChl4JalOH63hLv2HdzycR1ZZxBivfCDW51qNowbzY/MtUm7NVPFck8G
 BWr3aj2Syae6DvP/UnK12/lS+32O8oUx7qFHnkMK6JAp7jHY2cYPcE/p+
 3/dF47qlCcsuJ6Yh7Z2KwZF7AriPHlI0bKyKG7o+h5eE2O1Jp+b/592sH
 dBr119zpEd2PITuskLDT2Qif2pvhrMtz9TosXxUpI5YdbGpeep6bUz9Ao
 bU7RFbezfR+Ro8uYrrGQu5GfGp6bxA3hmscCh4EPY6UVWzPuIyVl9ihSq
 EcOcLihKzUOmdQvR9CZQATOQ4KxPcslFuSlWg9hwuUefkKYUhUlKlCPBE A==;
X-CSE-ConnectionGUID: JntFJIQRTJyFdJrgJYtbnw==
X-CSE-MsgGUID: bL+4LjubTK2762Gsjk7Khw==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="57685230"
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; d="scan'208";a="57685230"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 12:36:16 -0700
X-CSE-ConnectionGUID: J2qYnXUCRkW9C1DtlZ9ckg==
X-CSE-MsgGUID: 7n04GdafSwe06QAjJ8p5uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; d="scan'208";a="157956300"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 12:36:16 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 17 Jul 2025 12:36:15 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 17 Jul 2025 12:36:15 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.67)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 17 Jul 2025 12:36:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vsfZgqalqQBvxsiQnGei7c1NgOwspB0mQ2D3pquIMF+r73dKuYJ+JkcYTbkOYSimfp9/PHrWjCRwZDmHN6zgQ4bRr4WV4mQp5O0vWP2U84jizHB9u7TqosUcOrQfApgq2oZBof++1sKfBy3i76929d3xFjuCdctOj6mo0OyDZY7Wq/lXBnodQ+j3UpiaQrJKhzFH9X1I3+g7B8o0etMIVqGVWttXF1BFw+BdXfIyvHBQDcHUHHBHd3++auq22tBo8uadZ55khz6srGVkrppwALB3BuhWLLpUsKSh3WPvaPqLSsx2i5EsmEWA4L2oCyVvw5DCngoEZ/NWcNozroJTHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LlYHLcKjpmQ+6g/Q7T3md9gbwVAR4v0kf9Is5ucxXvE=;
 b=DHOpKdZ4RJf4x9O1vXT9j1X63+LFyhpzIVZ//ROBogZLjtvSKLVZo1ugOM8COq1DkFniKCYaJF7dS2KLs5yyQ/tWDPBXja6y2prPLfTzPJL0aXPwusK1SVLz0SrGisBVJLD6UhFroOrb9jtdVrDorpo0pW4dpJ3aVnkQhnT8vU0Rs930ndj/pj7ByDp2/xZ6305RLi4jobpc/ArHd4rWm1wwcN2+dc6izKQe34Kph5AsEglYdFbY0n0yk6dTSJS8tt8FHcC1RFw89XxAMnp5SPE9G5rNuK4naAL204VLMDa2/P8yVDyGAnkbBjyiG8YfUK87wDOpiVZenky86SnyaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW3PR11MB4588.namprd11.prod.outlook.com (2603:10b6:303:54::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Thu, 17 Jul
 2025 19:35:41 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8922.037; Thu, 17 Jul 2025
 19:35:39 +0000
Date: Thu, 17 Jul 2025 16:35:35 -0300
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/5] drm/xe/configfs: Fix pci_dev reference leak
Message-ID: <xuvudm3qk2nrl3r333ktfjt5cbsxgwrhgw7vxtd22tsaofe65x@6ko5nushvz6i>
References: <20250717184825.851-1-michal.wajdeczko@intel.com>
 <20250717184825.851-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250717184825.851-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BY5PR20CA0006.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::19) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW3PR11MB4588:EE_
X-MS-Office365-Filtering-Correlation-Id: 708e1113-034f-4b40-512c-08ddc5691c52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EEWthOwdr4/p5qwVn5P6KoVmeSin+eG1M6WJBs9LrP7VpmZspL9uaxYJJKMG?=
 =?us-ascii?Q?Oj/+QdMCN7JaMsQE7Lsi5FgUFRm4MSlalz3fVQt3rpPEQ7WNJbGNToLsGEWP?=
 =?us-ascii?Q?/GUvW7XobHu7wpcv8UpkXKOb5MzyDZ5zoknaDgS+QPsiGHggwgh3ybM3F7rC?=
 =?us-ascii?Q?QA5DRzXLeiWAHSrnsWYym7E0oKOTIHQujRltDlYNS1k978EFEiYQ/PpEmwom?=
 =?us-ascii?Q?mcKtoK18TWHW7BH5RD70d3epT/hd2MtN1JDILfHeDlwh59xB+DA3A0dJEpbm?=
 =?us-ascii?Q?ybyW9li39CvB8reNxaMHNVDfh7lkVs6eU7KsIEMucigz4srT/EPafX4qghaK?=
 =?us-ascii?Q?DAySLu18eEULiUa6OUSUtqEHdl4iw5XpRPmI8Rlo37iEzRHOXlQXQd3uZsG7?=
 =?us-ascii?Q?/CPPh0WqF1RGjV46AOAb+2cJeny9oxJ7Cg5hqpcDSHofGZqBGLVTjcS/08Q2?=
 =?us-ascii?Q?Kktc5fyMmaZqHX61ZCdEF0r37uF2+TOvkM9pmHamaPiYxmRFEtX1Bq8zdlPC?=
 =?us-ascii?Q?Pm+Jw5A1GJvqtzsbYYZocZ8GJydyCo5SMZdGjBOFhMQ/1YyizSrsCHzX897m?=
 =?us-ascii?Q?Ckzdt5lzFxYFFS6tnSbgp371WF81QWi+0euSykToA3UOruDOC7nQX9jpnTmx?=
 =?us-ascii?Q?Ygpny5GOe8jmwjoO2OdMXfyvpJPDr5CvitMRYkWkZ2PZI5yXuB5cANyMN81c?=
 =?us-ascii?Q?CNTImn2xVobPozMwhrIedzhBWBmMhHGHSsExiwWUV8uRBVCPJv+dk3TClJxt?=
 =?us-ascii?Q?pkuj95gdGv8BaXemK5A2LJFiJhCRN15YroA8unf4QZO0FgXPzvWm+1K4gcho?=
 =?us-ascii?Q?XONUS8gYwk3vIaZz0p9ymBEaMjlnzno3PJQ7dgUduIAw3lTTajHAvB18W9MG?=
 =?us-ascii?Q?URTTWP1MWLtmokhNF90BaprXm+P0mA/qrSuk0Uumz3KI8W3Z8s9DCfR1BEsz?=
 =?us-ascii?Q?3yhQnEaATuDlJ9cnJ1XzFgBpOjIZRV5bhLgueCbkAv1xGhZgcopPMYZ9a0uQ?=
 =?us-ascii?Q?Aq3VJ39d1esAQzBULvBW7n0dDd3ktGdmHxsgXDT41gj8t5V+gA9sjMAtzpWS?=
 =?us-ascii?Q?1rxdYsZUYdrFw0JaEJjqJMwnNdFlRLu+Jr0zzk/5w8BvpJXfbAsmOtRKGOCn?=
 =?us-ascii?Q?fkWtOMqvZQSlQgCKPVFlAZPGcD8DmXN6tbMW3qJtrbqHrcAwHrw9T8AQGoUe?=
 =?us-ascii?Q?cljsKpjgc+QSmlcBmWe2YSTIY+jXRloZbfrFxOk9z9Lxo+JKFbvybPBjhVhN?=
 =?us-ascii?Q?ZnQvRCFGLukfcZ45XB+Kw65Q0CiLJ+TwEMgRoJJKoCOvmFo/gbQOTPzxLOPD?=
 =?us-ascii?Q?XUpD8TauH0dshDieQpXPFd3lNwROzM6GCWxwEgC9kBKieP0572yRFOt5+FLc?=
 =?us-ascii?Q?C3LkbxPuFagFPckjbvwQvDQVUhQYTK3z+IHFZ8DgtnBM/kh0DBsZDLYxGu2x?=
 =?us-ascii?Q?IAzUxT3U4uM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?A1R1/8H/+c5lAv3OiYGX2foc8RFlEF6XkA+TEfSfp1R/C6UBEl9y3jhzFZat?=
 =?us-ascii?Q?xHAyXU5idPdIQ09EK9gSvwF02fhPTv/TvIJ52XpdL03jlPS9uhk5mrjo9X4i?=
 =?us-ascii?Q?huxU2PKFE8AxUTnG7Z3ngpE0h/i6aUQTQIu6etCCnB/oNqE3fSQRfbcgVjRF?=
 =?us-ascii?Q?v6C6Nrqz0npldRYbh86Setr6rG0QEGS9fQN+1Y9dWV7g/vxEonK3Z8+bJDIb?=
 =?us-ascii?Q?k762UlbeZUXIunxV17JYDnWUT8qA3K/P7y64pG4Rp2bo1+mqqJnTP6QKE/28?=
 =?us-ascii?Q?GRNCVgfG8F++aNSBcrd9bGv5Pdmy8P+/C5SROo6lwoX8dP+/bNT6GTVewOtA?=
 =?us-ascii?Q?Q/Ezgzmd9LY7P1kmyFaEM/UfxDL9vIb7f8JzXwopwZloXu3orejfIr3XQk2h?=
 =?us-ascii?Q?lyMGgp3uCTDgTR6L5gJ8uwCh4aIRBCp94OV3lC/dx1mAYwh44bwMm3ov9rX/?=
 =?us-ascii?Q?XLzrHXX6ORw6tX/QF7WBZ0QEUrfYxbbfd0Gmer7fgN303JEh9RuWEmZAa3gF?=
 =?us-ascii?Q?XvlFyOTcjmz81xdfoOxguLfJTpJZb4tkTejNgPjzLw1m7CQNjSV+lPeDbb8U?=
 =?us-ascii?Q?nZBklsO/6urKL3CoGoh7ld55/c0aR7byQ3E8jOG7ML9hRV5BzWLkHF7CzF7/?=
 =?us-ascii?Q?y3DODsG8LRRQR/cDIkkOZxhOA+iyhkT/Tjxa7hP/xY4+a3HuOYgNJUQQOHX8?=
 =?us-ascii?Q?fRZSxScZZ01lDz/0wXHTHIZpJLeZbPIM7G7cdQGGgXrE3YgVqozXj3kqG8MO?=
 =?us-ascii?Q?EIFa4eHkrmBporyyz74qEc+xJ4/oJ64fJtKUlItbNOqiwTa2+saBpdxyuC8T?=
 =?us-ascii?Q?xLohWrhzJOU95bHg5Szs79nK+Au2MRtuV+LAJ0rgGI0k3cHzjcMoAjt016WO?=
 =?us-ascii?Q?uDjEGqCy5izh/0KNT2nVZ0J0ZwzJDP7Xe2Xqt4GIIdK5UtoJOyNw2CqNh8Oz?=
 =?us-ascii?Q?eWKJaLIa/e20UpD1p9+6PSTl9JovRkbnjF6/rO64w5Z9gTvH8qxGn/G0cg6v?=
 =?us-ascii?Q?Ln8AelyCVYkvLErmpXP5avO7CfhmcdRdv/Xh/vs32CXy9eW2pJGEu/4oGt2O?=
 =?us-ascii?Q?PzO9sdlQybPeA61FRkgrlThh4349nHHtL/Uyub/EVnsHV/4BJG/6YB1Ar0A+?=
 =?us-ascii?Q?MKGVpsRTpBlHtSy2+avPkJnnwf6BoIiNOHbsE4P28Wu21zmSYbl0AG9j+M7H?=
 =?us-ascii?Q?I9PaJ5wHn5dtsoCb3QYs6UtHsSdX6OWDWuOw/5iv2RHbvtxJsAc7wCmU4l/h?=
 =?us-ascii?Q?CGqANKoAwUpJuU6zsDUQ2fxVLHUGG5rxUVSOxj8HWfknI5jAds9S47nDFRXR?=
 =?us-ascii?Q?qJh2cfyorjeifc8wdSLOxAwUfqPV0K02GvnbrUuGrHk5CvRLIKveqRJzb9oK?=
 =?us-ascii?Q?UypVeQt1uIkxIlcp6e5gkZY/avYfLQ4CnaA/LWAVq6BnAaSCQq0NLY58+cIx?=
 =?us-ascii?Q?/8WWfDj+cup3Rgy+5DPnx2PExXLR2jZobrg7ez8dd8RPTi4aEvH1BYjEe35h?=
 =?us-ascii?Q?KTE8aJLrv6WSxQJO+IRmgfA+uLNHXqnpKascXrWgPlW8K9k3c4dU0wF5xgGl?=
 =?us-ascii?Q?h1pV1DpuOkna3mLrTM1fQK1hErR5xmipKGiPNnW5m2YJ3BWgIQoDVOvKadsN?=
 =?us-ascii?Q?Ag=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 708e1113-034f-4b40-512c-08ddc5691c52
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 19:35:39.6647 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FNstpFw6MEuCKx3kjCBnFhcPbXryltJcG17ccXAZgCJmPAzTGAuiVA4f4eJNVOs80GC7OQB/yro0WZy2ZBzlsc/0eo/R17xt5G+c2amXoQY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4588
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

On Thu, Jul 17, 2025 at 08:48:21PM +0200, Michal Wajdeczko wrote:
>We are using pci_get_domain_bus_and_slot() function to verify if
>the given config directory name matches any existing PCI device,
>but we missed to call matching pci_dev_put() to release reference.
>
>While around, also change error code in case of no device match,
>to make it more specific than generic formatting error.
>
>Fixes: 16280ded45fb ("drm/xe: Add configfs to enable survivability mode")
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_configfs.c | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
>index 8ec1ff1e4e80..e9b46a2d0019 100644
>--- a/drivers/gpu/drm/xe/xe_configfs.c
>+++ b/drivers/gpu/drm/xe/xe_configfs.c
>@@ -267,7 +267,8 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
>
> 	pdev = pci_get_domain_bus_and_slot(domain, bus, PCI_DEVFN(slot, function));
> 	if (!pdev)
>-		return ERR_PTR(-EINVAL);
>+		return ERR_PTR(-ENODEV);
>+	pci_dev_put(pdev);
>
> 	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
> 	if (!dev)
>-- 
>2.47.1
>
