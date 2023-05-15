Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96B5EC77B75
	for <intel-xe@archiver.kernel.org>; Mon, 15 May 2023 13:06:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72A6310E1CD;
	Mon, 15 May 2023 13:06:30 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BEEC10E1CD
 for <intel-xe@lists.freedesktop.org>; Mon, 15 May 2023 13:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684155989; x=1715691989;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=HA8IOZu8g/tZGV5TvIdiE0JiQ7cM9jYDS4wtnqPc/pA=;
 b=SdqX3NJGIn3yrd/jUa6g0IFrAF/w765YX5xEA3P6aOmhHwpWwxXAAkiV
 6F1IILKSWcnvwG4ddsMQjJDbePoFHqdQZJUxhcHaojB+cGJNL77tvCYo2
 dYqD5boQoTa4Prko8BX+IfA2x+xAavsnDyvy2wsAVzsJEBtUqbkitT6LP
 55IWGi0YLdzrDt6uqIJ8cHIOsps97LY1SNHX7NalPX39Xh5y7AOoQfZHx
 bEEtlF6u1oj8LXWN7+0MabW0Z9leao0jvEGoWVCU8hXdoRsDA9KHM631H
 MUmnZVjimQLyjbIbwnu6S2ZcqyaeheRbs8ZD7l5oJBxxg69oXjHQbGGbT g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="331563599"
X-IronPort-AV: E=Sophos;i="5.99,276,1677571200"; d="scan'208";a="331563599"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2023 06:06:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="700958920"
X-IronPort-AV: E=Sophos;i="5.99,276,1677571200"; d="scan'208";a="700958920"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga002.jf.intel.com with ESMTP; 15 May 2023 06:06:25 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 15 May 2023 06:06:24 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 15 May 2023 06:06:24 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 15 May 2023 06:06:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iA64/bZyH1RzlSYfeMVrp0ARXbwLIUMtJZFSKCepb1bYGLpKb9jg3T43wfPJ2igd3yj3akudKhtQgqdAx5YwhRSppyx7lBQFxdqJJ5cdp5evkGaA+AbrX4KJ2kJcQHCCbLriwcoRvv7sM7YNbSALTMYuPUDzGvF5NRjrlC7oJ0eOPetwL51hD/DuB+7hrsvoUkjKYgGHkB2kSTR66tzzAngMxGeitdMbeECnLR65JfCKk0xAJ8i5XrDNfFzuibuM/qARyW0l8xC2DI0LirANbSn3nCJfL3o2XQ1UaL4Rrnrurq0b48QWXO8hFq18OT0KPl3KsHbn26/nbNUnapRF3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5TrmWwrR4pvUFCPC5dOLcwiQSuHnZVIvwNLLZe+YdA0=;
 b=XEg+e0yzesDoDA5/mL/BYjzZ9noRperZn1Caz5MbYrFKWE3NkGi/+IGQzpNH59MzC8vCBZK3Pn0dTSebndgdsTsSTogrAn9fiQrUBFaoLL99+qCEw/0rjrs0XZXKKBIK8cu9nGdrbrQqfT+N6YA0RCKF2fr6UHcTNlJio6rJrE9+kxcqtpW8ssWPMoBHGJ3eE4GA7HKzcKL/rGlwLCbk5oPUD2Yby7kLfupYQ+SOOfSATRFBTb4R1MwaD1Cv39wflk6BCP+e5TFW/PKbmdjVEdE+GwQfrFaYOGOEkQCy6/VlX6FS/xFb7JCMRsas1Rxe9+81D+zL3Qie6JzomVpZJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB5024.namprd11.prod.outlook.com (2603:10b6:a03:2dd::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Mon, 15 May
 2023 13:06:22 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6387.030; Mon, 15 May 2023
 13:06:22 +0000
Date: Mon, 15 May 2023 06:06:20 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Message-ID: <kfbbmo5fbj4ybrdjjqddf2hsnhzhxlbo6pj7oafinb2qvxk6e3@djt2qeqroqt4>
X-Patchwork-Hint: comment
References: <20230513062632.3258063-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230513062632.3258063-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR05CA0007.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::20) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB5024:EE_
X-MS-Office365-Filtering-Correlation-Id: 86ee76c7-bee8-44fe-1f3f-08db55452e32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2of/DKp0J9olz6ClP++MS/wXSavXBtbjfe3uUQRl3Lfrq0FF672IEHdKMDTMmw89G8JQken8PvbRIk3MK8uVGv5SpnAvWeK28wwTpKnl0ldaa3Z8zslfUeYYEZpXBBcz2T0z3Ph6k/Vanvg2CmjssaaayQafM3DFjGy8igCgomHdglL4mJuEaary3Y+9Dh02th90nTJ6fr6szHXUb85qLI6q0u+YuKxPcgNTEa5/3HBn5GWufAP8E6540MJ+7JSFmv5PEzoMovJQYZXyiHFL2IAz6arNaqq61tRo5yEsjxtDixBzxnPm4oCbLXTqT9XfV/PwPoJTPCGtbrfZQ3XFyjRJzFU0cNR6uXP/X6m831uOmjhaIMac7ItU8Ll9MAoxbz3UscdcCG6xkupK54QP1ND/guxfHsI+yCVnJ4+q14YzlJEKw0M8URDjN5KtnUoscIu1z+PE+H0ZC9q0zIgk55Q9gT2u7hWimGnHPsLfC70FYjqaxroseXm86XyAI8Urkby4DxkMOkybkzTQ61Aa2ZCmqxqvfmm9MDd52R8i530jeacqS5X7w5zAORGnj06Q
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(366004)(39860400002)(346002)(136003)(396003)(376002)(451199021)(86362001)(186003)(33716001)(2906002)(6512007)(9686003)(6506007)(26005)(83380400001)(6486002)(478600001)(8936002)(8676002)(4744005)(5660300002)(82960400001)(316002)(6916009)(41300700001)(66556008)(66946007)(38100700002)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BqSgJPAXaP/5mZOV0g/rasRFyGlgkTrelfGETYs/GRhHeIQ9BsVKEmGi0t8T?=
 =?us-ascii?Q?+DJH5vtnBgfzNBIIOPoRFNp6obp5h3pfrETl5IFJbaxhk858XarLfc/Fd4/L?=
 =?us-ascii?Q?2qjnGRmuRRqaQqKvm5zoIzFJmBNFNiJhBZOZpFUKcQmA3JES6+/78r5Vra7t?=
 =?us-ascii?Q?2NT0gfP+WhmzMN4eXQehJN0+5RJYIk2nAGp0Ux6nYPNw1uAK0hhadazSaPNz?=
 =?us-ascii?Q?yNRnBPkQeta5WHx4UU9RA+W2TGEovGf6q2LKqfPf7b1OTI795kBsQv8DlYqP?=
 =?us-ascii?Q?K9WAApaFhB28vElq/uKL5Fr+1EXipxG3toVbeENFSKOEVoHjb4PiGOLBJn5/?=
 =?us-ascii?Q?BWhc75wQEuaVXd13NRk5z10ocpal627wBMOKPiPo3NsoUzMpxL7TeZRfk5tR?=
 =?us-ascii?Q?vFsv5cV6KwfD5l7/LDG03RIzqDuqzWBB+5nv/XJlN5He2mxomAc0RV2rwASt?=
 =?us-ascii?Q?I6uiDi1vair8SdUl4CrcpauZ9fUFzEUH/osRPJN/wn2+00hKlCJXhVes2FMO?=
 =?us-ascii?Q?aa7VdiqQLjW39Yva9ITWCb9XSy7NlwXRBy2wgM9yjugvPQ4ewHOBH49hARg4?=
 =?us-ascii?Q?q12I/7PZFyIx1ADNxyEoU2saL0eaG50CpdJDZKWiGrxIYHXBnEWtrSMd5cuw?=
 =?us-ascii?Q?Jl3oiwxb2epEsbatDWXV18SMDTfRGTNNYTfI9l5RmHeaG8XIROm87zHbHPzr?=
 =?us-ascii?Q?AHMWpu7cFYpIOkpOedZEJPl9IDe71ngVw880uaoTPERsQqEAnxMpaT79ptcy?=
 =?us-ascii?Q?bsx2NIsaN3plVyo4eIosujccrkeT7NBzloTuWK/MiLCjd5REDSIU6tMt7UNp?=
 =?us-ascii?Q?rXlSkBi15DWaAcF7QRBdre4OovrK/lUjv2KngvX7Lz2ky+IyzWMae5eVeex2?=
 =?us-ascii?Q?tZQhPFvpqpOEP/f+yUK8fDR0/r8v2BpJ9xxnGB3aFYDheaWBxU7Fr9jpMUBC?=
 =?us-ascii?Q?PEsSswoGmxcckT0zDpnCgEJHJtgIb6mjh5SRppt+gIk5rdL8IrhBeqa5guaO?=
 =?us-ascii?Q?qgjtI3clqoz1IkwhIe2EJaN1/CTrIdVwTh1XLM/xsKlawHwkH9wogxwykXiI?=
 =?us-ascii?Q?dwE3/4+XhB3uHi2jgJ6T5BoYQgdf+z7F3Hgrm1eL9fQQ3tAxV+BUVB6BGECV?=
 =?us-ascii?Q?injtIaraOwW2a0TDE5mEvSu5xxXtqc/fZH3AY/rLS0UGFCSKzLomJ/NorpcQ?=
 =?us-ascii?Q?lAqdzfi7/6rAYUBmvtYpQERJtGJCyOuS+15LI5jiC9+cuSjb/fbP0sIyqgAh?=
 =?us-ascii?Q?nrvN7gt2ed73uSOB7shYnuFCAwDAJc8pzTP8mTsd4z+I2SYV2fuEJnQf53qT?=
 =?us-ascii?Q?qxL3vGZ4RUcoVBoGKLpo0CLCZ244XxA/rKBUa6W6qyH6yOXb/+pAyDBZtsrn?=
 =?us-ascii?Q?aOlHW0Wdr2Ca4y/Uih3a9ft6kYuu+0q9e1M42GkMgGr2Kqn00czSR/qHY+/U?=
 =?us-ascii?Q?XT0Z4PjLkcWg+Pnf0G7yvh3LmYcosBf8j0VP9n1bj+57EajftzEtsjoQNC2P?=
 =?us-ascii?Q?zkqFTTdpZPryZ0dcp7I5PpJuXqFSFNkfC9eMQksPaToSnd7bVAvfJkuhVL5K?=
 =?us-ascii?Q?oDdnHvSLLH46cucP63D0Hpe9F5zFSjOlgHfoqTCUBKtTWpOMvkvLnN/6Ufoj?=
 =?us-ascii?Q?DA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 86ee76c7-bee8-44fe-1f3f-08db55452e32
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2023 13:06:22.0991 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vJD2wDV7DU1fFdpJAl5mAyGzQiYkP6m1tY2R3eI87tr201B+XfJb3cPJCgOD7o7EOpx/Du5x0TT7rdhs4FWm80EJoQjfGXj5JWIMsqEbp4o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5024
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] fixup! drm/xe/display: Consider has_display
 to enable it
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

On Fri, May 12, 2023 at 11:26:32PM -0700, Lucas De Marchi wrote:
>It should check CONFIG_DRM_XE_DISPLAY not the non-existent
>CONFIG_DRM_DISPLAY. Thanks Christopher Snowhill for finding the bug.
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>


fixup already applied

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_pci.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index 18d58d916fff..03bd74f5347e 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -538,7 +538,7 @@ static int xe_info_init(struct xe_device *xe,
> 	xe->info.has_range_tlb_invalidation = graphics_desc->has_range_tlb_invalidation;
> 	xe->info.has_link_copy_engine = graphics_desc->has_link_copy_engine;
>
>-	xe->info.enable_display = IS_ENABLED(CONFIG_DRM_DISPLAY) && \
>+	xe->info.enable_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) && \
> 				  enable_display && \
> 				  desc->has_display;
> 	/*
>-- 
>2.40.1
>
