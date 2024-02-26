Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CA19C5478C
	for <intel-xe@archiver.kernel.org>; Mon, 26 Feb 2024 15:41:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 094A910E77B;
	Mon, 26 Feb 2024 15:41:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ex/NF29Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7E2410E780
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Feb 2024 15:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708962086; x=1740498086;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=400SgRF0nY7O566HIbVKQvI0EAj0x0YPVD1F4VhYmd4=;
 b=Ex/NF29QycxYyXjEY+Z4LMyBiw/m6XxgGlbTrt6+mjB93v9FwyusH58f
 cafVc0gMQPBC4TipgcLNzbBywJxWJaa/VMIhbIvZUPxe/XwSaPDlvJXwM
 Ad6epFO34bwpZ1QaIsClogAPKOKPHcZD1kc1UpBCK1fJY/GjsjxLGv65C
 E6jZ6Dy1v9f3uxaUnnKXMVIIfu0YSSoBxupAh83oLK+Qtnv6wMP9tPvpO
 pZ5DTcaOpKv+WDsV8bjwJV0JW+WlRetIOUkHQqSKYjwdL24yJSeyBbtjo
 J0Ris2kiv1y+StM07dfNN5r6/hMqweD5sAMwB8v1ZdVPz1SAQMnXrieFj Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="6199952"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="6199952"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 07:41:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="7244153"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Feb 2024 07:41:02 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 26 Feb 2024 07:41:00 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 26 Feb 2024 07:41:00 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 26 Feb 2024 07:40:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L52qmyJ4F2kiArdb6IFwJAYtEMWfXyDfpOEJY0QeZfNaWsj+Q1KTVe6quj3HgojFbd04/n2NE2pK4X5GfGKb5LYAaCCwOknvp1A2cDfPItRNgU7GsZKObV4l8lgT52frZhqUoqaIEbVbMtnpXJI6U7+4CMkP+yBtHWMvwgP9XfL34fqs7DQ48RKOtOpCp13n1ZbnT4ukBPta/9rkECFXzNfjvrINJJs6/6+cqn/Ng5BKxSxdSTNARSDI7iJSxRgJbkCWdI3IkHBN+XAXh23CpxHOmDTmDeHnaBRocytFgqA53dJgvTiMA3MeC7vsBy27pPEBCgP09zWJ2P9D1q2pyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=klWvuWf1g3rBoYHa4zsgNoZvws5g69q5ip5kmX7Jooo=;
 b=R1jQaO9zV1G85cGEWXTVp2xeJ7spkRqn99sjC4DOm2kiDRgWH3UvN8d0Vm1o97P3efq/LCwiK8ofKgwPrF9ylomdhYh36QOXsd2mTh6Hxd515w7B/agp/2C6M4UO1QjsDSh5t/P+7Spi00JnErrcSgSaJXpcXBhtVk07Ed6k6fabVUyv3Ue8P8Y+ai8WjAPRzKVvyZRFBcQoA5pGDCZ68PrQXFhVj/QH8VlY96jWoTTjwrT0E6q72jgvbHaJsu9U7KijpswtJDW4khpD7MR7HGharrpvSPGWMow9viv7oWnTWIYYfxRCtvjkBCCbCWSpxEvPyiF9zIRSy1fbCM4NPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB7119.namprd11.prod.outlook.com (2603:10b6:510:215::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.23; Mon, 26 Feb
 2024 15:40:58 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7339.022; Mon, 26 Feb 2024
 15:40:58 +0000
Date: Mon, 26 Feb 2024 15:40:24 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] drm/xe: Fix build error in xe_ggtt.c
Message-ID: <Zdyw6OT/SDir+3Op@DUT025-TGLU.fm.intel.com>
References: <20240225001448.81513-1-matthew.brost@intel.com>
 <98e9c8ea0f51cb308f02a1cf2ce61d06fd5bbc0a.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <98e9c8ea0f51cb308f02a1cf2ce61d06fd5bbc0a.camel@linux.intel.com>
X-ClientProxiedBy: BYAPR01CA0017.prod.exchangelabs.com (2603:10b6:a02:80::30)
 To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB7119:EE_
X-MS-Office365-Filtering-Correlation-Id: 609ce53c-0bc1-4fd9-347d-08dc36e153a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H4FbMMoS0Uc/J3ApoLlJ7F1q9vIZnpJnF3PPnSdNn1V275UABqHJj79lFYj5lmn6o5BrFt0RU+RTJFDBiNfpMC5I4IXtM4lHFSxfp5J8IfEIJH2ARYoRK6Erm+B/0bB9Rt1fPz3Rcvb/BzecHjJL4RfINfsj0uAx8adLMkLnz+TJCXr03KIeqtJo9rJzrjKgFsYdV/Kbxoj1HPsPTEfemjVa9gFvsWHOW/YMRd+CPZ9pGMf0BYxsDUC5Ms0frqBBFrKUJup+NtY5G1GjJ22jZsvu6gjtjrPxM/fBv+tAna4Rj5UCL7KP2WkNoZLfIzLzR436OThjhbeVWvYub1uQ2j1ZjB5RwWiWpOKNBg5ifR4z9Hl5WUbOM2q16afa0EA5ZnMtoMSmk+qQ/Ys8Ue3zeJm+z6DmDNnO2IqR1ipna4Iy3ZLJMLNkp/jKXOYvQBnFhDsPvYaw9sjVdShBbKk3vOrDGJu9jkEl6VvvfwmNJDe/V2CJthw92xNQ3kIOketQGyHE6rqEfGFUQuO61W+BN1aFKKICVYpdzhBePlQHEhNDuzTbkwsal6H9yoPcixPbkt8oQmR7YUvkTBbgEL3jCjZxcYQpopCdX6QPImH/WQug5u3ZRmIIlFUgEHeU4wUk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?PYhJQLdYWaWcmlMoec1NRNoEhF2ajPm2zsFQaz8oNfm/IWkZMf5EanY3Gi?=
 =?iso-8859-1?Q?ie4MK2egOAqmIjJkAjSeicvIkxrOy3dSuQcO8LmHZMVfzZIwB9XaySNWJn?=
 =?iso-8859-1?Q?EEN5e3qFafHw6bFybFA7MIfqL17R4CGe7wBWK4AmUrmX8oWRYEJe06iFOe?=
 =?iso-8859-1?Q?9xz/KsXybA4RbL7HaeumeozJPiWclmrpLDgdK9XCRRnGb0/sTqkYkNuCXY?=
 =?iso-8859-1?Q?b0Uyx4Dm/8z9E3s6s6+ai1eUDPycrLtPdWNDT/OkvO7WOQnKrDlngR5phF?=
 =?iso-8859-1?Q?BoAkecY/H0X0qFcgzcBkrpWL2hHpimeQ/TgZGTKm3CzzIZTWGL/IR6p0jz?=
 =?iso-8859-1?Q?dnk0mxMRcDbcNStxymDiMDRx5ZIoaf+BsOTMlXc2ypqgUNxCkT932DtLqe?=
 =?iso-8859-1?Q?Lh83UX89+Ho5ZZtJCEokQal8D2GbDEpel/Tcg9FS61FyyKRwz1yR9kZvsb?=
 =?iso-8859-1?Q?sxdPeB5rUlzZZkxO6ob8mned3mf/ftD6JA3hNUXki94c+/9aOcON1fJM3R?=
 =?iso-8859-1?Q?yNye3XtX+aG9aRiXoi3awZi2fACcE6oOnA48MhKEWmXRstpDTcynDJhEAU?=
 =?iso-8859-1?Q?lvWa/PHF9EJNpEwJFJiRrQ7kay3nlK2uKF4UXciA+0dI6sBo0fkMR3JTkw?=
 =?iso-8859-1?Q?XI9cM0s4cywoGDMGGh1njYqLtPyxZhIVS+hqe2u47RIGbCJAq99WX3ES0s?=
 =?iso-8859-1?Q?xhmtrHoUTR2RIWh/3NUZR9opuOOHywPC2TuiqpAUrpTI2IBgo1h6fTgPLm?=
 =?iso-8859-1?Q?6Nd4IKJt/TF1I0ZY/6QE3B7DOLhDDQbk8MskpXj15WI8whq4Wj5IsAsv07?=
 =?iso-8859-1?Q?k6izgswuwnkyXGkfo9jKj2U4hxr+dhweLaJz59DVs3GEF68+pbZ6KdMBVL?=
 =?iso-8859-1?Q?JtT+dp4DnSGdpaqoIgUSJbvdbq8GlJkgVkFP3+ziw2Lxm9jtglP3YE6HQu?=
 =?iso-8859-1?Q?5ZRKQrW4twVp3FXKMjHsI+hnybsdiON1WeV7NkT/gbRDh5/WyJ9wy/gdNm?=
 =?iso-8859-1?Q?rU4VD/f6nUwWD7ooOGq9kQYaxU8atW9iYnUazYSbbHfyGJKQlTlhdOGU34?=
 =?iso-8859-1?Q?ELib8doehdgt9rgEevqHfcjdMJFQHW+7UVbMUZi7S38nThT0vYabyHJ+Qw?=
 =?iso-8859-1?Q?k/fguMQQ6plpjYh3bOBVsAXqFMOr16RWZ7NcD6DCpbh53n669kamc8Xyej?=
 =?iso-8859-1?Q?YorDdXH+00ceCnPe7n35MTAaDb3febkk2XRaZOXzAm0ASjDH6BdQHMRiv4?=
 =?iso-8859-1?Q?O7x44RtG2R0h2BgYPE2g6UPmHcqlSa0tR/45VqVbtwU/3LpIF5wAiZF8KA?=
 =?iso-8859-1?Q?B57LKKFqd9x3c65Kkb7mMVTrLwvHX5BJq67mGruL4hRyrz2B2QEBH26+r7?=
 =?iso-8859-1?Q?LbLjD8JqcTlKffb+//Rd268afmmDUVOCDvpeWddHgqADk69EFUvTXhDoCh?=
 =?iso-8859-1?Q?a1/3vvDc23yF2dKca7wLwOGMOMZoifACbz8YFj4y0NCyFIjd2Kv7HcCdfr?=
 =?iso-8859-1?Q?eMVVG4fju7+iiKDLfQH0If/ZQy7LqA/9zJh/CjSxwIbKZv+UXfZhygYrg+?=
 =?iso-8859-1?Q?j4H5Re+GXwC0EpD9z8rgLeA9IMal7hK9FDxHuAwM2VJcm4oc4fK1LelBwe?=
 =?iso-8859-1?Q?cmcvFyMTbZYwzhhMKjUlgnObYKPMgARrI1cuG5fHArDZg3o1clE9+59Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 609ce53c-0bc1-4fd9-347d-08dc36e153a5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 15:40:57.9692 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mc9P2DQDvQ9B7rHMD4e1dPXsMGo6p407XELoyyzT90qAEPJZCteJJF5iSL6aLkxywSZEWPkyTfSMhy6lO6ejyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7119
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

On Mon, Feb 26, 2024 at 10:05:58AM +0100, Thomas Hellström wrote:
> On Sat, 2024-02-24 at 16:14 -0800, Matthew Brost wrote:
> > Need to include io-64-nonatomic-lo-hi.h for writeq function.
> 
> As I understand it, the choice of header here determines the dword
> write order on 32-bit systems that don't have an atomic writeq(),
> 
> So is writing the low dword first the correct order in this case?
> Perhaps add a motivation in the commit message?
> 

"Cleanup some layering in GGTT" removed xe_mmio.h from xe_gt.c and that
file includes linux/io-64-nonatomic-lo-hi.h. Perhaps it is better just
to include xe_mmio.h again in xe_gt.c?

Matt

> /Thomas
> 
> 
> > 
> > Fixes: 3121fed0c51b drm/xe: ("Cleanup some layering in GGTT")
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes:
> > https://lore.kernel.org/oe-kbuild-all/202402241903.R5J8hKVI-lkp@intel.com/
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_ggtt.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_ggtt.c
> > b/drivers/gpu/drm/xe/xe_ggtt.c
> > index 5d46958e3144..717d0e76277a 100644
> > --- a/drivers/gpu/drm/xe/xe_ggtt.c
> > +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> > @@ -5,6 +5,7 @@
> >  
> >  #include "xe_ggtt.h"
> >  
> > +#include <linux/io-64-nonatomic-lo-hi.h>
> >  #include <linux/sizes.h>
> >  
> >  #include <drm/drm_managed.h>
> 
