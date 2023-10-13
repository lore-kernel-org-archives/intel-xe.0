Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0F38CDB47E
	for <intel-xe@archiver.kernel.org>; Fri, 13 Oct 2023 22:36:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53EF210E077;
	Fri, 13 Oct 2023 22:36:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9700C10E071
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Oct 2023 22:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697236580; x=1728772580;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=AfpB6qAPNDdRL9qyQg2z8IJPiDr6kIGvo9kgdqUWEHo=;
 b=Ea6bjqdseWd7IOtrSgXzujco2cYDY5puzwiHMQAKp+dk5L/B6z2DZnNl
 NUOOCYWqOW1z1YUMU/lak28NJF3ciBwNeyPEwtUrRFFZHQsfMFg6ZMbuG
 /CI/cqdLjgMSvviwAJpYUoEnpZ1DQKsfm4M1qIAoZw7eMO7Z8QH7tfhp6
 w311/FF/V8JUrQepLMpwSPRIhqjFJur4MAnWEVv0fgjysp10RZIEJQngI
 G3oUfybqybWPRlpT8glS3uGiY1FFnKln2vR30JdcSarL3QyTfd577xLYz
 3DPKK6xamyFPYEVapnqx4nIBtdZyDK3HLAqEQ2ORdWhIFgYi5d13NFWVr g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="471511045"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; d="scan'208";a="471511045"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2023 15:36:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="754871810"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; d="scan'208";a="754871810"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Oct 2023 15:36:18 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 13 Oct 2023 15:36:19 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 13 Oct 2023 15:36:18 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 13 Oct 2023 15:36:18 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 13 Oct 2023 15:36:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ag4M0PxLuv6NEYcC6ftspvGpv7cXfYgL+6ZcscCqJ1gMLLWvFXpvx7mqDRUq2BZae6ckV0ImVbcQDVvNmtHVxsulGUyBBl09bF5aqtx71gowjbpBpCMTaY3CMjj60mtHMuIzpp+a60HV7xMTl4gcwAtBp3RH1G4Xcn5nGZR/+00rbPDKf2lP8resvQk1cUi8yFbXhR3WBWuSq4JWVvFN8jjek4AoHc99LOvRHwdSr4rTBPzo7HU7iyn7SMeTJc7ad6nps1lFVwkKWwQ4ltyRi8l1tj5D4cnNPHJCRoHd9RrJguIJkSe4p+KRrx0Y+z0zL3ymK9rHdL8ksZbEUNQnNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gbfw3pSALCs1W6rn9g4Oi5XlIZrHnxziwjclSr5JKME=;
 b=QYr3cpWmNlJmq7m92FCWPb2X6Q6DSwO5uAbe8KX0/6CYKpck5/WG860M0zAJk69Qjlv+viLRxhLPLG4e4dcuTog7lltAszFzdE1EcHyVnn0QHX+vFWU0ZyodbDPtifoe8nPHS9eHKnWyLAVSf+naflPqc834ct4iPjBEsFTXjUfKw+JSH5pIaAzV1tGiHcsjq8D/Ez2NE8OBHqyQqoA5TiMCtsHaVrEgIKogqEfccQ6RVzUL8BjIAcQ+q6Zb5emCqyZCvyhVF2Cp7ydBnyKhqwblzHqDRoOcf/UlHD3qazyoqfcZB7Jo/4QQd1biN39BM11QykVAK8kS2lzqmI1RJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH8PR11MB7024.namprd11.prod.outlook.com (2603:10b6:510:220::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.30; Fri, 13 Oct
 2023 22:36:16 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5%7]) with mapi id 15.20.6863.043; Fri, 13 Oct 2023
 22:36:16 +0000
Date: Fri, 13 Oct 2023 17:36:11 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <hu6awh3y7e3k7u6ubclwwlee5umm3srjcnz7lzgkgckabv2pt7@dklgqsjcxtb6>
References: <20231011174252.10427-1-bommithi.sakeena@intel.com>
 <87mswo2oap.fsf@intel.com>
 <gvcesx3btnumlf6eufzvdjl7u4zjbkdlvnutfz6gd2a4323zha@pmb63j73bnpk>
 <ZSmiq1PZsMWcFnXm@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZSmiq1PZsMWcFnXm@intel.com>
X-ClientProxiedBy: SJ0PR03CA0372.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::17) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH8PR11MB7024:EE_
X-MS-Office365-Filtering-Correlation-Id: 74d5b84a-3476-424a-9ae6-08dbcc3ccf87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yYkDTGBv9VivvA6uDgcdEI0+iolrI7J/FjdIb741WFc+9Tt7ocfTmObB6VFzmBweYQvDsxLgu2CnaDCWBUxjFJEL9Z+n6RTxar8z2a0pGl7LYS6cinecTrugdq4CEjMzQB5yQLLFIj4ArwdbL5phGGXcLNTdKLGXGFesbkWqGU9ku/HHFEqS+PVVo7l5tIIwR08IvBUyyajKbLyQerMy/KwaLk0dVp+FhB2aguWXaJ5gHWboO2NMWEwgDfrumZi0iYlFLRHxRw+behAzCLQHHbLueRAIUIsTFxd+pkWUzKm2ttZxv5fWJKncGnHpETiFjvRzI8u8TXpOnjWIGE1YPZvLxXbfD60A4CpAZCiSD6u1fSDILzP4KZVdEadFjmNmdP2DY+/op4ugSSaU74bO+ff78OhI76+9IzlCwQcD4kg0N2QkqoCHQkHcceDoxRaQU9OOYJ/bTLqRxysTvszGJ1rp7FCaQYhKPMuIeFHw046YZV5wwojthgtC8Pq2opvIQ8G5ImaxMi0RHrLDKTw2AfHrmfnWJ1wCp/ltB/R7s75BEgfcGYmdMKqIpDPvNBVy
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(376002)(346002)(396003)(39860400002)(136003)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(6486002)(4326008)(6862004)(30864003)(66476007)(6636002)(316002)(66946007)(5660300002)(41300700001)(66556008)(478600001)(2906002)(8676002)(8936002)(6666004)(6506007)(6512007)(9686003)(86362001)(26005)(38100700002)(83380400001)(33716001)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?dGSjIpCQ3AlNCdFbRHnXNU4ljKBXd0ZUPngMKoPBi/LXfGk/X1ZjO9r/0Z?=
 =?iso-8859-1?Q?4HJJIX41QayoTeyXcjnE+DtGJS3cQqFu7JIf8C+uKNfIvJC85Mzr6YeR0E?=
 =?iso-8859-1?Q?d+NI4tU5Fhe7dZn8e97gRAO4xraoYVc4yP2pOO0Kcxhob4P2TYFZDUSqds?=
 =?iso-8859-1?Q?dRL6XO8m3HlVuNlZoTsVkEnyD1wi3EzFW3EckhVKmznlLtKP1D+Nm4E8qX?=
 =?iso-8859-1?Q?3U0WPhztTM82n2ya5Oe8DFVDsEUor5064bnmofscVXm5MhAKsYTSmCm9th?=
 =?iso-8859-1?Q?4CU2s/Ih6yfA9XkWBhV48G4Mhd+HcOFSKmJz463E4aEVWbH4GgrAPTBb9f?=
 =?iso-8859-1?Q?gwRJDo8RAqDCbv7Ltgg9yl2g8HVfQNoCMZX2yEleJIiON1Rgy8nsPVqfJD?=
 =?iso-8859-1?Q?Nrd4H0mOdKZm8hPMMS1vc9/+EUfnUCcIWi7Lx9OPc6OgBNAfrqYI2HuuDA?=
 =?iso-8859-1?Q?vPByxKSm3jFQg4Mls+SZjdwhjqnPBqHC0tBAiulQrYP9HD7YElcK1SO6x4?=
 =?iso-8859-1?Q?Nfcy4Um0JwAbp71m18fUOt6KxcXKstjKaVxTM8EDt8b38c4VoZtQh3iG+t?=
 =?iso-8859-1?Q?f+1GJpCYe0f2nVzmwiaQtkPH1yuF1RQLttP9u2eqXXQUbOs10AKiE4XDHR?=
 =?iso-8859-1?Q?ZHxJA89RriVRBC7leA+H2Lhkoklxfcw/urMVsva/qc/m07Lle1o62lnvFO?=
 =?iso-8859-1?Q?PokrEDg/uHSxGMcLhQxf40s2ehxGAuGmZm1yeUjRSR0579rCERwe8TmiQH?=
 =?iso-8859-1?Q?wdidedBpVSspUAgZt/sKlkcg8xFMB5QV3vOJ3hzewsUOdLT+HJlv1RjwP3?=
 =?iso-8859-1?Q?9KpZpjvoMVWqJsEJ16yL3GEPC3dZyyziDXPRB6h3wyPubcsWV7M2khqt4T?=
 =?iso-8859-1?Q?hYSjzUoevu8qb8x8fnyFEqh51BT8QWdPvXj+UD+mpX8Cdp6H0s5j8ZOC/i?=
 =?iso-8859-1?Q?kZe0TpwhVv7t3KhGLGpydZPz7FG2R7pHAFHiuxj2kh9OQ8BOgrp18+F3+2?=
 =?iso-8859-1?Q?CiIVptQQVhTLd3UjbfYyTWPkC3IapBziDSgJy7/zJhyeqMKYfMZhEkGUBL?=
 =?iso-8859-1?Q?J7EAKDbl/16zPa0XOpsDQXdh15X+AOY+zQVAu6B1Ofb0rL9LLF5RVz/u/6?=
 =?iso-8859-1?Q?a498ATXiZLvRyI3QQ/BRB+Iz/HWUTGAUBtPFntJ5znzeWcotmDwzgdFkNm?=
 =?iso-8859-1?Q?vmLT93r7meydT2zWCx+P2d29nbRYYqrD3xuWPQdG6Be/5e1Wb+MGOH0Jyj?=
 =?iso-8859-1?Q?wmT5NSDW/eT7bpBCr/d5120JCemMD+1RHVBDm+rZluJB7T2+5J0cJrFiCw?=
 =?iso-8859-1?Q?VJZ3dmNSFoqWcXvq+k51bdxCssbhOIcC4KTBs96DR0k67QGEM3HYw3Nupg?=
 =?iso-8859-1?Q?19+vobVHyLBRLK1qaJTpxMb29LQLFsQj0qYX9ND5m4rsE3xPj557DJLSR6?=
 =?iso-8859-1?Q?TJlNX5c2ca833rZJUn43jj90/Nr9vsI+7w2IDk40UdtRB3/gDMKllfkRLF?=
 =?iso-8859-1?Q?7Obr23uIJYKVg5KNbcGOGwWdasEL4FQUDPAuDfBs1IICYOmsSvez85y5ke?=
 =?iso-8859-1?Q?El2AanTrKuO8AaRknFk7ToHy2iYocLQq2KXrQ9Nf6dxMKUhq8KoFELgFO2?=
 =?iso-8859-1?Q?yjiEbOV4Amnrx35/bJGkrpgBoa96vCRtWtAQEO3GoMspen5bjJHWaZVQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 74d5b84a-3476-424a-9ae6-08dbcc3ccf87
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2023 22:36:15.7288 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A+GZD+iynrSvkZgINX5IxqDNA7PIgq9aSDLBdNej3pzFs7aALcxCUo9hIxaD9dlKAydKYrEYBewsRcwFEW+D5E1hUEit0vpWdvJd5feNoJw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7024
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Encapsulate all the module parameters
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

On Fri, Oct 13, 2023 at 04:03:55PM -0400, Rodrigo Vivi wrote:
>On Thu, Oct 12, 2023 at 09:08:41AM -0500, Lucas De Marchi wrote:
>> On Thu, Oct 12, 2023 at 12:16:46PM +0300, Jani Nikula wrote:
>> > On Wed, 11 Oct 2023, Bommithi Sakeena <bommithi.sakeena@intel.com> wrote:
>> > > Encapsulate all the module paramters in one single global struct
>> > > variable inside the new xe_modparam.h.
>> > >
>> > > Cc: Jani Nikula <jani.nikula@linux.intel.com>
>> > > Signed-off-by: Bommithi Sakeena <bommithi.sakeena@intel.com>
>> > > ---
>> > >  drivers/gpu/drm/xe/xe_device.c   |  4 ++--
>> > >  drivers/gpu/drm/xe/xe_display.c  |  6 +++---
>> > >  drivers/gpu/drm/xe/xe_guc_log.c  |  4 ++--
>> > >  drivers/gpu/drm/xe/xe_mmio.c     |  4 ++--
>> > >  drivers/gpu/drm/xe/xe_modparam.h | 23 +++++++++++++++++++++++
>> > >  drivers/gpu/drm/xe/xe_module.c   | 32 +++++++++++++++-----------------
>> > >  drivers/gpu/drm/xe/xe_pci.c      |  8 ++++----
>> > >  drivers/gpu/drm/xe/xe_uc_fw.c    |  8 ++++----
>> > >  8 files changed, 55 insertions(+), 34 deletions(-)
>> > >  create mode 100644 drivers/gpu/drm/xe/xe_modparam.h
>> > >
>> > > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> > > index ef42c33e3055..0cf908089483 100644
>> > > --- a/drivers/gpu/drm/xe/xe_device.c
>> > > +++ b/drivers/gpu/drm/xe/xe_device.c
>> > > @@ -25,7 +25,7 @@
>> > >  #include "xe_gt.h"
>> > >  #include "xe_irq.h"
>> > >  #include "xe_mmio.h"
>> > > -#include "xe_module.h"
>> > > +#include "xe_modparam.h"
>> > >  #include "xe_pat.h"
>> > >  #include "xe_pcode.h"
>> > >  #include "xe_pm.h"
>> > > @@ -224,7 +224,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
>> > >
>> > >  	xe->info.devid = pdev->device;
>> > >  	xe->info.revid = pdev->revision;
>> > > -	xe->info.force_execlist = force_execlist;
>> > > +	xe->info.force_execlist = xe_mod_param.force_execlist;
>> > >
>> > >  	spin_lock_init(&xe->irq.lock);
>> > >
>> > > diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
>> > > index 391f08c1caca..0b55037c1da1 100644
>> > > --- a/drivers/gpu/drm/xe/xe_display.c
>> > > +++ b/drivers/gpu/drm/xe/xe_display.c
>> > > @@ -27,7 +27,7 @@
>> > >  #include "intel_hdcp.h"
>> > >  #include "intel_hotplug.h"
>> > >  #include "intel_opregion.h"
>> > > -#include "xe_module.h"
>> > > +#include "xe_modparam.h"
>> > >
>> > >  /* Xe device functions */
>> > >
>> > > @@ -45,7 +45,7 @@ static bool has_display(struct xe_device *xe)
>> > >   */
>> > >  bool xe_display_driver_probe_defer(struct pci_dev *pdev)
>> > >  {
>> > > -	if (!enable_display)
>> > > +	if (!xe_mod_param.enable_display)
>> > >  		return 0;
>> > >
>> > >  	return intel_display_driver_probe_defer(pdev);
>> > > @@ -69,7 +69,7 @@ static void xe_display_last_close(struct drm_device *dev)
>> > >   */
>> > >  void xe_display_driver_set_hooks(struct drm_driver *driver)
>> > >  {
>> > > -	if (!enable_display)
>> > > +	if (!xe_mod_param.enable_display)
>> > >  		return;
>> > >
>> > >  	driver->driver_features |= DRIVER_MODESET | DRIVER_ATOMIC;
>> > > diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
>> > > index 45c60a9c631c..111ca5433c69 100644
>> > > --- a/drivers/gpu/drm/xe/xe_guc_log.c
>> > > +++ b/drivers/gpu/drm/xe/xe_guc_log.c
>> > > @@ -10,7 +10,7 @@
>> > >  #include "xe_bo.h"
>> > >  #include "xe_gt.h"
>> > >  #include "xe_map.h"
>> > > -#include "xe_module.h"
>> > > +#include "xe_modparam.h"
>> > >
>> > >  static struct xe_gt *
>> > >  log_to_gt(struct xe_guc_log *log)
>> > > @@ -100,7 +100,7 @@ int xe_guc_log_init(struct xe_guc_log *log)
>> > >
>> > >  	xe_map_memset(xe, &bo->vmap, 0, 0, guc_log_size());
>> > >  	log->bo = bo;
>> > > -	log->level = xe_guc_log_level;
>> > > +	log->level = xe_mod_param.xe_guc_log_level;
>> > >
>> > >  	err = drmm_add_action_or_reset(&xe->drm, guc_log_fini, log);
>> > >  	if (err)
>> > > diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>> > > index e4cf9bfec422..717fcdcb5c7d 100644
>> > > --- a/drivers/gpu/drm/xe/xe_mmio.c
>> > > +++ b/drivers/gpu/drm/xe/xe_mmio.c
>> > > @@ -18,7 +18,7 @@
>> > >  #include "xe_gt.h"
>> > >  #include "xe_gt_mcr.h"
>> > >  #include "xe_macros.h"
>> > > -#include "xe_module.h"
>> > > +#include "xe_modparam.h"
>> > >
>> > >  #define XEHP_MTCFG_ADDR		XE_REG(0x101800)
>> > >  #define TILE_COUNT		REG_GENMASK(15, 8)
>> > > @@ -73,7 +73,7 @@ _resize_bar(struct xe_device *xe, int resno, resource_size_t size)
>> > >   */
>> > >  static void xe_resize_vram_bar(struct xe_device *xe)
>> > >  {
>> > > -	u64 force_vram_bar_size = xe_force_vram_bar_size;
>> > > +	u64 force_vram_bar_size = xe_mod_param.xe_force_vram_bar_size;
>> > >  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>> > >  	struct pci_bus *root = pdev->bus;
>> > >  	resource_size_t current_size;
>> > > diff --git a/drivers/gpu/drm/xe/xe_modparam.h b/drivers/gpu/drm/xe/xe_modparam.h
>> > > new file mode 100644
>> > > index 000000000000..efa246616d3f
>> > > --- /dev/null
>> > > +++ b/drivers/gpu/drm/xe/xe_modparam.h
>> > > @@ -0,0 +1,23 @@
>> > > +/* SPDX-License-Identifier: MIT */
>> > > +/*
>> > > + * Copyright © 2023 Intel Corporation
>> > > + */
>> > > +
>> > > +#ifndef _XE_MODPARAM_H_
>> > > +#define _XE_MODPARAM_H_
>> > > +
>> > > +#include <linux/types.h>
>> > > +
>> > > +/* Module modprobe variables */
>> > > +struct xe_module_parameters {
>> > > +	bool force_execlist;
>> > > +	bool enable_display;
>> > > +	u32 xe_force_vram_bar_size;
>> > > +	int xe_guc_log_level;
>> > > +	char *xe_guc_firmware_path;
>> > > +	char *xe_huc_firmware_path;
>> > > +	char *xe_param_force_probe;
>> >
>> > xe_mod_param.xe_param_force_probe is unnecesary tautology.
>> >
>> > > +};
>> > > +extern struct xe_module_parameters xe_mod_param;
>> >
>> > To me this is half-baked. Either keep all of it in xe_module.[ch] or
>> > move all of it to xe_modparam.[ch], but please don't add a xe_modparam.h
>> > that has an extern for something in xe_module.c.
>>
>> any reason not to just keep using xe_module.h and have a `struct
>> xe_modparam` inside? I don't think we need a separate .h and .c
>> files just for the module parameters... xe_module.[ch] are small enough
>> to absorb that.
>
>agreed
>
>>
>> >
>> > Please also aim for some naming consistency. File xe_modparam.h, struct
>> > xe_module_parameters, variable xe_mod_param. Choose one, and stick with
>> > it.
>>
>> agreed
>
>hmm... how to keep consistency here?
>
>considering it is inside xe_module.h a good name for the struct is
>struct xe_module_parameters
>or
>struct xe_module_params
>for shorten...
>
>but then to follow the consistency with the rest of xe, the variable
>would be something like
>
>struct xe_module_params module_params;
>
>but this is exported symbol, so it should be good (mandatory?) to have
>the "xe_" prefix in it.
>
>It looks like the way to go then is:
>
>struct xe_module_params xe_module_params;
>
>Will any compiler out there complain on this?

No... why whould they? But... the struct and var don't have to be named
following the header. Just like we declare e.g. struct xe_tile, struct
xe_mem_region, etc in xe_device.h. What we shouldn't do is to use
xe_modparam, xe_module_param, xe_module_params, in different places.

so, IMO:

xe_module.h
	struct xe_modparam {
		bool force_execlist;
		bool enable_display;
		u32 force_vram_bar_size;
		int guc_log_level;
		char *guc_firmware_path;
		char *huc_firmware_path;
		char *force_probe;
	};

	extern struct xe_modparam xe_modparam;

xe_module.c
	struct xe_modparam xe_modparam;

Lucas De Marchi

>
>>
>> Lucas De Marchi
>>
>> >
>> > BR,
>> > Jani.
>> >
>> >
>> > > +
>> > > +#endif
>> > > diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
>> > > index 7194595e7f31..31ed68fcd087 100644
>> > > --- a/drivers/gpu/drm/xe/xe_module.c
>> > > +++ b/drivers/gpu/drm/xe/xe_module.c
>> > > @@ -3,46 +3,44 @@
>> > >   * Copyright © 2021 Intel Corporation
>> > >   */
>> > >
>> > > -#include "xe_module.h"
>> > > -
>> > >  #include <linux/init.h>
>> > >  #include <linux/module.h>
>> > >
>> > >  #include "xe_drv.h"
>> > >  #include "xe_hw_fence.h"
>> > > -#include "xe_module.h"
>> > > +#include "xe_modparam.h"
>> > >  #include "xe_pci.h"
>> > >  #include "xe_pmu.h"
>> > >  #include "xe_sched_job.h"
>> > >
>> > > -bool force_execlist = false;
>> > > -module_param_named_unsafe(force_execlist, force_execlist, bool, 0444);
>> > > +struct xe_module_parameters xe_mod_param = {
>> > > +	.enable_display = true,
>> > > +	.xe_guc_log_level = 5,
>> > > +	.xe_param_force_probe = CONFIG_DRM_XE_FORCE_PROBE,
>> > > +	/* the rest are 0 by default */
>> > > +};
>> > > +
>> > > +module_param_named_unsafe(force_execlist, xe_mod_param.force_execlist, bool, 0444);
>> > >  MODULE_PARM_DESC(force_execlist, "Force Execlist submission");
>> > >
>> > > -bool enable_display = true;
>> > > -module_param_named(enable_display, enable_display, bool, 0444);
>> > > +module_param_named(enable_display, xe_mod_param.enable_display, bool, 0444);
>> > >  MODULE_PARM_DESC(enable_display, "Enable display");
>> > >
>> > > -u32 xe_force_vram_bar_size;
>> > > -module_param_named(vram_bar_size, xe_force_vram_bar_size, uint, 0600);
>> > > +module_param_named(vram_bar_size, xe_mod_param.xe_force_vram_bar_size, uint, 0600);
>> > >  MODULE_PARM_DESC(vram_bar_size, "Set the vram bar size(in MiB)");
>> > >
>> > > -int xe_guc_log_level = 5;
>> > > -module_param_named(guc_log_level, xe_guc_log_level, int, 0600);
>> > > +module_param_named(guc_log_level, xe_mod_param.xe_guc_log_level, int, 0600);
>> > >  MODULE_PARM_DESC(guc_log_level, "GuC firmware logging level (0=disable, 1..5=enable with verbosity min..max)");
>> > >
>> > > -char *xe_guc_firmware_path;
>> > > -module_param_named_unsafe(guc_firmware_path, xe_guc_firmware_path, charp, 0400);
>> > > +module_param_named_unsafe(guc_firmware_path, xe_mod_param.xe_guc_firmware_path, charp, 0400);
>> > >  MODULE_PARM_DESC(guc_firmware_path,
>> > >  		 "GuC firmware path to use instead of the default one");
>> > >
>> > > -char *xe_huc_firmware_path;
>> > > -module_param_named_unsafe(huc_firmware_path, xe_huc_firmware_path, charp, 0400);
>> > > +module_param_named_unsafe(huc_firmware_path, xe_mod_param.xe_huc_firmware_path, charp, 0400);
>> > >  MODULE_PARM_DESC(huc_firmware_path,
>> > >  		 "HuC firmware path to use instead of the default one - empty string disables");
>> > >
>> > > -char *xe_param_force_probe = CONFIG_DRM_XE_FORCE_PROBE;
>> > > -module_param_named_unsafe(force_probe, xe_param_force_probe, charp, 0400);
>> > > +module_param_named_unsafe(force_probe, xe_mod_param.xe_param_force_probe, charp, 0400);
>> > >  MODULE_PARM_DESC(force_probe,
>> > >  		 "Force probe options for specified devices. See CONFIG_DRM_XE_FORCE_PROBE for details.");
>> > >
>> > > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> > > index 99ccee07f8cd..29bcf7565741 100644
>> > > --- a/drivers/gpu/drm/xe/xe_pci.c
>> > > +++ b/drivers/gpu/drm/xe/xe_pci.c
>> > > @@ -21,7 +21,7 @@
>> > >  #include "xe_drv.h"
>> > >  #include "xe_gt.h"
>> > >  #include "xe_macros.h"
>> > > -#include "xe_module.h"
>> > > +#include "xe_modparam.h"
>> > >  #include "xe_pci_types.h"
>> > >  #include "xe_pm.h"
>> > >  #include "xe_step.h"
>> > > @@ -414,12 +414,12 @@ static bool device_id_in_list(u16 device_id, const char *devices, bool negative)
>> > >
>> > >  static bool id_forced(u16 device_id)
>> > >  {
>> > > -	return device_id_in_list(device_id, xe_param_force_probe, false);
>> > > +	return device_id_in_list(device_id, xe_mod_param.xe_param_force_probe, false);
>> > >  }
>> > >
>> > >  static bool id_blocked(u16 device_id)
>> > >  {
>> > > -	return device_id_in_list(device_id, xe_param_force_probe, true);
>> > > +	return device_id_in_list(device_id, xe_mod_param.xe_param_force_probe, true);
>> > >  }
>> > >
>> > >  static const struct xe_subplatform_desc *
>> > > @@ -587,7 +587,7 @@ static int xe_info_init(struct xe_device *xe,
>> > >  	xe->info.has_range_tlb_invalidation = graphics_desc->has_range_tlb_invalidation;
>> > >
>> > >  	xe->info.enable_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
>> > > -				  enable_display &&
>> > > +				  xe_mod_param.enable_display &&
>> > >  				  desc->has_display;
>> > >  	/*
>> > >  	 * All platforms have at least one primary GT.  Any platform with media
>> > > diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
>> > > index 138960138872..854e4ba027e1 100644
>> > > --- a/drivers/gpu/drm/xe/xe_uc_fw.c
>> > > +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>> > > @@ -15,7 +15,7 @@
>> > >  #include "xe_gt.h"
>> > >  #include "xe_map.h"
>> > >  #include "xe_mmio.h"
>> > > -#include "xe_module.h"
>> > > +#include "xe_modparam.h"
>> > >  #include "xe_uc_fw.h"
>> > >
>> > >  /*
>> > > @@ -219,11 +219,11 @@ uc_fw_override(struct xe_uc_fw *uc_fw)
>> > >  	/* empty string disables, but it's not allowed for GuC */
>> > >  	switch (uc_fw->type) {
>> > >  	case XE_UC_FW_TYPE_GUC:
>> > > -		if (xe_guc_firmware_path && *xe_guc_firmware_path)
>> > > -			path_override = xe_guc_firmware_path;
>> > > +		if (xe_mod_param.xe_guc_firmware_path && xe_mod_param.xe_guc_firmware_path)
>> > > +			path_override = xe_mod_param.xe_guc_firmware_path;
>> > >  		break;
>> > >  	case XE_UC_FW_TYPE_HUC:
>> > > -		path_override = xe_huc_firmware_path;
>> > > +		path_override = xe_mod_param.xe_huc_firmware_path;
>> > >  		break;
>> > >  	default:
>> > >  		break;
>> >
>> > --
>> > Jani Nikula, Intel
