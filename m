Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F6DDC7618D
	for <intel-xe@archiver.kernel.org>; Thu,  6 Apr 2023 00:17:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D02810EA98;
	Thu,  6 Apr 2023 00:17:02 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E35710EA98
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Apr 2023 00:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680740220; x=1712276220;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2vT8nm/HX+V73tIaOp0yL9xzqW5FQ7dUY3Zqs4tAKe0=;
 b=GiEPWQx2e6jJPcgtn681sVjs7ajdDal01MjrT4glDHgLwIsdw2wBrjUx
 7Vw6DOFK1hvQBEzhUl+MflrmdXMLaAMfmHus6IQIMdOL0jw+m99QfzD8k
 y2QFuvBPc9Xan7m7FbdIA18zNAuneYeTeSA8+mggn8c/f7U4LlBCRsl+J
 G1wN0zsCwyU/EZ53AZ0il5hRxWNG6b3dGDQdqWWBEZWlrJjmxjd3R6nRq
 HeoeM8KwU74WhdPZG2SCiI2hGUqstbA/ltGpwj0nZOOw3mKYP2CewKIff
 IiUzFLsLZWLnjLlOtB1P1qy+LlBcqMHgLpfThNzbGVg98dDJmau52rM9v Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="405384570"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; d="scan'208";a="405384570"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 17:16:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="1016670938"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; d="scan'208";a="1016670938"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga005.fm.intel.com with ESMTP; 05 Apr 2023 17:16:59 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 5 Apr 2023 17:16:58 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 5 Apr 2023 17:16:58 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 5 Apr 2023 17:16:58 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 5 Apr 2023 17:16:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RyRG55K4nJEABEt60nbB4Q3+NseuFMGbTHp//TCSPsAlbIqhXvzQRgP0iyLcwXYd8MUP+qx3Hb59uw/gfMPjhQg5LEt64MAjD/mQGY7o09gTnU2kxgY7kEgoucw/0WKYMUFImWj90ZV4Y39BjpZRYdgFaucbEuNQOrP+XXBhquBg20XPgahWAhiK2Z+U70W7rF6NgUuxtX2sDmFCXzso520I7PLtk0CIcMYh8cdMocQguaQIsWhnlp2xKJwUkGN8pTI1jJN131W4XKKq82fMw1ZQ60wb8iw0MIRzqcwlOSt/yk8RMhEFntMWBwZTml+f4786KT1Blzc55lr2SvHX9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vPEr/9pvkRQFbhuxXc4EwOoRUSSd1gephbRJ10Y4Gkk=;
 b=QgFignROcC+dusNJE1XY8la678H0l7LUOIrXK2CjokP8L9zLY5PbcTomEWGTou9hMoBkEwRF4aKw3/JRf9GJLdCojQply4lmPh1eARFILQ93mID/6ClykrBoDLExLE6hWIzVawmuyjyXfqbwwLdzYFcZ63o1t+7E64YKjvmJ0pMakcQ3w4QApoWSleNMUumLUfftCrUpptVgrrk5S+jOHNqg4RH1KSYx4IMxUpyd8oS1NuAtTnRzFokZQgJP23SHSwuhNWYF4/8ccbsitZTWvflwo1z6FT1FvBLERnV4AGZaqx9i67q41DD7i/JYLI17SHFLBcyVwlyQ2e8g/YhT+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ2PR11MB7504.namprd11.prod.outlook.com (2603:10b6:a03:4c5::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Thu, 6 Apr
 2023 00:16:56 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%6]) with mapi id 15.20.6277.030; Thu, 6 Apr 2023
 00:16:56 +0000
Date: Wed, 5 Apr 2023 17:16:53 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <20230406001653.savi37otqxhkybwq@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230403201702.996400-1-matthew.d.roper@intel.com>
 <20230403201702.996400-7-matthew.d.roper@intel.com>
 <20230405223602.kxmiilzaabjlmodk@ldmartin-desk2.lan>
 <20230405233047.GJ4085390@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230405233047.GJ4085390@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BYAPR08CA0007.namprd08.prod.outlook.com
 (2603:10b6:a03:100::20) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ2PR11MB7504:EE_
X-MS-Office365-Filtering-Correlation-Id: eabf6fe1-0d0f-401f-3502-08db36343aec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c+hvaiYB2ReQ4kmvssF/8XHrPgncbZXG6fRHyQgJI5ImOmrPnERYb+9JL30zgLmb641Pv7l2zxWru24E30FfMuOUT9CRAOCux164Cfqtvj8qNWxWIUtWNz5oJHXVHBIrlAhDp+oBGuf8xyyjx4FHFdzMgsdTVm847RVa213QvoGzLk2Hh0MjwVaLgQ6Yv8ToIVnFKJ5Oj0EgYKyPogeYBzQ8HUHr4uOoGUjVciDwuW38IvmQeif1hVMdBy/UxWeqsg1n00p0DQwxSruqZAY0FuFsCBaPz5CKDrxiF0twItJob8JV5dnhEuiiPEPbasOBwy9BXFkzcepBS1VBg2A4FV42z7y/fUk+6dTBSYUk/9PJWteg28BdrGjG122Y3PtVpsHwXCGvRWCgzAkbKfNuEMA7YHkE4+FoWF61G3Aazec39n4XB5mfMCPM+e4wzit3CiwqDB2qFPGVy8Iaowep12lL7dxupfa5gAZr7mC3KvWH0yVWo9+nFDVPfazrupgwFcFLcw3frQkoEJ9UueCbO4A8AY+x7P0gWwesi2wI0osmQ0x7zX+mqU/CpO4Rfi/q
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(346002)(39860400002)(396003)(366004)(136003)(451199021)(83380400001)(6486002)(1076003)(316002)(478600001)(186003)(6512007)(26005)(6636002)(6506007)(9686003)(5660300002)(2906002)(38100700002)(36756003)(66476007)(4326008)(41300700001)(66946007)(86362001)(8676002)(82960400001)(6862004)(8936002)(66556008)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2VrfBPc2LPCDPd9a7Qhu6SRdyRX1tbWI9/HhpB+eoOAWSGbOR20uhHJUiLg4?=
 =?us-ascii?Q?8EyeBDrrvVAH07qRmyCYZFpyWIh0BQOgM34bKA3jHgDnF0vZwAQXaXd57Jib?=
 =?us-ascii?Q?tx5PYr1fqkVvQqoaOBEeCx3IGrIr2OzF7U9LNGD8+sCXG20b/s9UgaxvAY2/?=
 =?us-ascii?Q?U2YEOtdCOpdQMzaaStJjgii83YDcbJ9fMCj0nbhFUqtf0S/eDWlHkJkaAq4N?=
 =?us-ascii?Q?7MMppI+Df4QRYhdZhFXHKKa8rEHUHqQ87mWcZHNwc+6H/HwfPAPSGiHGhFfp?=
 =?us-ascii?Q?eu9h3oY9yCjFhw+/PEJk+uq4fwbbAKWoY+4dQo7QgU9bozAhKLfG+gCGSgTW?=
 =?us-ascii?Q?TzS+Uq5LVGRa3jjZyt+YGcDSzMYYC/jpaarAL/erdEjH3SoTcaoBxCQnnv7/?=
 =?us-ascii?Q?a0DGP6NHznSs8ymPrthI3CHiLJ1C2Fi5lerU6jOFiHYV01B7U2eb4fZmA9tp?=
 =?us-ascii?Q?tBm0IKlMNu5Hb5eoB32YBJYJrX6dee6YcJcMGs9RLn6RJD8sfAPTi1zSvNdj?=
 =?us-ascii?Q?lB8FKcwczK84xPBxeRfVobr4K9WK0shfLaCEo66oF4wbGQqDzC0fRTiR15TW?=
 =?us-ascii?Q?nya4q0yVU+fhN1tOGNSw1AMt/cVS3TdJ2v6TAR79u1S9yZKEMGRuiCdWAbuG?=
 =?us-ascii?Q?dEvZ/qZbUzdaLxg0eiaLEKP2wY9IFwXY/mhAWTnYZBX6kdTVDAMVv8m99DKW?=
 =?us-ascii?Q?IhVUY8/g+fBY6uTi/fH3//Wvevqm3IftAGqyBlcXiDjVcLx1TrEvtePHT+Sk?=
 =?us-ascii?Q?YBCuBFN5ekCrpBqyFoIaexkJGHB4b0S2WAvHIGga7KTdGoQ0S5me4dJxPXRH?=
 =?us-ascii?Q?av8usJBrDql2x34kGAkXE+PyZafhTyYPoYyXfFJ1rdOVrjclgN1djhiHaVK+?=
 =?us-ascii?Q?3zgBkY7CsKirbbBybhDFVrTJPgApvu6/7WNGGn7Ozq4P0znVghe582VqZxtr?=
 =?us-ascii?Q?6nJ6YONSx3E2xrp6EMN8QMiej9X/KxhGNx/Pfv69OplPNQKQHIHzYuoFXLX+?=
 =?us-ascii?Q?LaYZPG+UTJXOivIZ+J2T9BB7vRIbehOjIdCmnW4LPVCqKaokUvBOPeHwOqzC?=
 =?us-ascii?Q?xX9se8IgVLmgpOICKG7/+Z53rqDnSQa++f9w+YbYogNKLhki9EOp794kYLCS?=
 =?us-ascii?Q?BHTtQoz7FNmXe6wjjUO35WrcHfY3rFyhs6Slvl76H1H5035vyGqZS1iWD8zt?=
 =?us-ascii?Q?npt+qoHsiGT3ch/jJ1R6F/g/GxSWrrrbI3K+YrJcxHXvsQzWZ9OeiYzvQVqY?=
 =?us-ascii?Q?5crvVIXDz52z6XPGi/Ewe0aya4hJXr33x9Mseh49rjRBwEqnZZeqExxy404G?=
 =?us-ascii?Q?b5R8O2kpT9jc3y9uiQ8cdCg+gwAwXjvHvm62KsqrKajEIBCEbsh4n69fldr+?=
 =?us-ascii?Q?chCDk1ntVvJklseIdZT98WZJa6dPrE9+L7Olvx2KGkZ/Id8TjXxf2CC7tfTF?=
 =?us-ascii?Q?94rwQo220mZtBU7uVyul+0lahBfMDtHveCg9Ue4FDkcZyiUMPkFLqN8YhGIL?=
 =?us-ascii?Q?DleN8uoWLCnRG8+xP94wuky6l7/lKHzY411tTvvIjzIgCEeXe2SZy4Syn6ks?=
 =?us-ascii?Q?yc9IPdays+GcY1+gFBNtHgetOyLsslcK1UEmVLDXGOAeQjKXqdFoNL48Dsqb?=
 =?us-ascii?Q?NA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eabf6fe1-0d0f-401f-3502-08db36343aec
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2023 00:16:55.9959 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X9K+clx5ZXjyRuVkIn8uGGNwZlUvPIxprl8s9TIDc0AjQu4ju1re/1zzwVyThFrh3Invba4UDjWfPutKsq+nAtz7/Qfd47FQVOp3drG4wIs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7504
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 6/6] drm/xe: Select graphics/media
 descriptors from GMD_ID
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

On Wed, Apr 05, 2023 at 04:30:47PM -0700, Matt Roper wrote:
>On Wed, Apr 05, 2023 at 03:36:02PM -0700, Lucas De Marchi wrote:
>> On Mon, Apr 03, 2023 at 01:17:02PM -0700, Matt Roper wrote:
>> > Hook up dummy graphics_desc and media_desc structures on platforms that
>> > use GMD_ID.  When such a platform is probed, the IP version will be read
>> > from the hardware's GMD_ID registers and that version number will be
>> > used to select a graphics/media descriptor with the appropriate settings
>> > for the detected IP.
>> >
>> > If a GMD_ID platform reports a graphics version the driver does not
>> > recognize and support, device probe will be aborted.  If an unrecognized
>> > media version is reported the device probe will leave media
>> > uninitialized and continue.
>> >
>> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>> > ---
>> > drivers/gpu/drm/xe/regs/xe_gt_regs.h |   6 +
>> > drivers/gpu/drm/xe/xe_pci.c          | 161 +++++++++++++++++++++------
>> > 2 files changed, 136 insertions(+), 31 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> > index f45251df5715..2d265dbb7651 100644
>> > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> > @@ -22,6 +22,12 @@
>> > #define FORCEWAKE_ACK_MEDIA_VDBOX_GEN11(n)	_MMIO(0xd50 + (n) * 4)
>> > #define FORCEWAKE_ACK_MEDIA_VEBOX_GEN11(n)	_MMIO(0xd70 + (n) * 4)
>> > #define FORCEWAKE_ACK_RENDER_GEN9		_MMIO(0xd84)
>> > +
>> > +#define GMD_ID					_MMIO(0xd8c)
>> > +#define   GMD_ID_ARCH_MASK			REG_GENMASK(31, 22)
>> > +#define   GMD_ID_RELEASE_MASK			REG_GENMASK(21, 14)
>> > +#define   GMD_ID_STEP				REG_GENMASK(5, 0)
>> > +
>> > #define FORCEWAKE_ACK_GT_MTL			_MMIO(0xdfc)
>> >
>> > #define GEN9_LNCFCMOCS(i)			_MMIO(0xb020 + (i) * 4)	/* L3 Cache Control */
>> > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> > index d634e781858a..62685b14257b 100644
>> > --- a/drivers/gpu/drm/xe/xe_pci.c
>> > +++ b/drivers/gpu/drm/xe/xe_pci.c
>> > @@ -15,6 +15,7 @@
>> > #include <drm/xe_pciids.h>
>> >
>> > #include "regs/xe_regs.h"
>> > +#include "regs/xe_gt_regs.h"
>> > #include "xe_device.h"
>> > #include "xe_display.h"
>> > #include "xe_drv.h"
>> > @@ -99,6 +100,14 @@ __diag_ignore_all("-Woverride-init", "Allow field overrides in table");
>> >
>> > #define NOP(x)	x
>> >
>> > +static const struct xe_graphics_desc graphics_gmdid = {
>> > +	/*
>> > +	 * Unset graphics version implies GMD_ID support; driver will read
>> > +	 * the IP version from hardware and then select a more appropriate
>> > +	 * graphics descriptor.
>> > +	 */
>> > +};
>> > +
>> > static const struct xe_graphics_desc graphics_xelp = {
>> > 	.ver = 12,
>> > 	.rel = 0,
>> > @@ -164,9 +173,6 @@ static const struct xe_graphics_desc graphics_xehpc = {
>> > };
>> >
>> > static const struct xe_graphics_desc graphics_xelpg = {
>> > -	.ver = 12,
>> > -	.rel = 70,
>> > -
>>
>> can we change the logic so we leave the version here?  While reading the
>> rest of the driver it will be horrible not to have in the source code
>> the reference about the IP version.
>
>The 'switch' in handle_gmdid() provides the number(s) that we consider
>to be a match for any of these structures going forward; is that not
>enough?  Note that putting something like 12.70 here gives an incomplete

maybe... It seems we will need to hop a few indirections to get this
answered.

>picture since 12.71 is is also a match (and there could be more numbers
>we associate with it in the future too).
>
>If handle_gmdid()'s numbers aren't clear enough, I could just put a
>comment here listing what numbers we expect to match to this structure?

let's keep it without comments and see if it's too hard. We can add the
comment later if we need it.

thanks
Lucas De Marchi
