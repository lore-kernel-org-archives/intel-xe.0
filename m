Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D1BEC64ED8
	for <intel-xe@archiver.kernel.org>; Fri, 24 Feb 2023 20:25:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C0E510E26F;
	Fri, 24 Feb 2023 20:25:56 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B65910E26F
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Feb 2023 20:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677270353; x=1708806353;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=r1ogrrsDYfcy6ujjBv2qpvaMAZgQBRzY0Am1Qo6+VDc=;
 b=j5PPeD9vhF2mIhWJ0o0RkV8XI0o4zqZzlstdXckilxMGVzUsj7TN+xky
 OTenziO0+JEJGxQqNPgHaXPGQpQfG6F4tddDoIgcSYPiQLW21bAyuQC+P
 F8C6AHjmE9kyxlCiOsatl6A+VRANGuWiaPz5JygAlwI9bymKL4dViO6EH
 /wh29FjJ5FzaARUFyHrORjNdF2v1jW5RokPlICTsYXDreLrnYvm5W5tkt
 mzARI+hau7PAwkGW13JkLRHgu8scXNVCpV4HFDafqy9SGEdsfmzGvzYlI
 6STOMb+sSOFPFCs6ik1P72KIFf5A5+az45SPZ7B9lqMtMk+RZCtpi5v5t w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="313209855"
X-IronPort-AV: E=Sophos;i="5.97,325,1669104000"; d="scan'208";a="313209855"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2023 12:25:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="847057518"
X-IronPort-AV: E=Sophos;i="5.97,325,1669104000"; d="scan'208";a="847057518"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga005.jf.intel.com with ESMTP; 24 Feb 2023 12:25:52 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 24 Feb 2023 12:25:51 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 24 Feb 2023 12:25:51 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.46) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 24 Feb 2023 12:25:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BzwT18ZkpP5nua3h3FZLgw0zLSPuGmL8pex65i72LKRvYL5X4qo8qkF8oZ3OM/rnVySlUZJC7D/o7opGIbQgl9xLPtlh7lpfDGtL5nySwHsan5/1QKu5ucgQ9Ar4F7304yn20M2P/ocjxEXTW/rVu+1nZtkzPpm1bT3rUzFgsVv2frgfi4rci/c+DS/2N8wPVXknl3j+nwJYlvyFWRS2VKIvlUw/Z5y85BlnUhEe34zm6Kxk1/9gKYktjKEtYFC4aedArM2vKuy+BBM3GEBvDjnTzHNoMtRrsA5kodRw6VlWiadCRmHLeLHM/EqA77p52dgdUCyrqRCnicNCjI7hug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OKsbRswnr8e+SVi2oJtNsIj41Ep5nJ2yC69ASiKKbOw=;
 b=EtSM2gcqSt32i91AsOJl7CFLOzTo0ZKUrhtM8Npcwh+XbuV+OkdUt/bI1cLuNM5LbXeyRld3No7ch2d6C4ZeifG2K6c8cBeoXlv49CB/YA05v2wL6llydggM5TvuEcgvH+WFSfN/Q+3WcesbrqeZjBirhaajLdmtuQEBwx3jRRyZiYp1Qn1Zgnw3KT1utyg2m1HAgztOC3LKiCOCB6ovrANYdzOuXPH2L/Jk5UDIOhG/Jnn64hzYp4EJIUH27v1XvMEU2W811WFErwCJG5leC1ub5LbAqf+42d7HDKaVnl6U0XPSbUGeg0MWm1ilh+9JIk6Jj4ZHPRxf9mwRxh0eMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY8PR11MB6843.namprd11.prod.outlook.com (2603:10b6:930:60::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.24; Fri, 24 Feb
 2023 20:25:49 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8%5]) with mapi id 15.20.6134.024; Fri, 24 Feb 2023
 20:25:49 +0000
Date: Fri, 24 Feb 2023 12:25:47 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Message-ID: <20230224202547.zfsbspdjigtroyt6@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230217005226.106499-1-lucas.demarchi@intel.com>
 <20230217005226.106499-6-lucas.demarchi@intel.com>
 <Y/j8lmaf2b49It/M@mdroper-desk1.amr.corp.intel.com>
 <20230224182914.ytykgqzkp4o4ibcg@ldmartin-desk2.lan>
 <Y/kDHFFeDZY6blAt@mdroper-desk1.amr.corp.intel.com>
 <5996d61189ec584381319540402a66c03dfd840d.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5996d61189ec584381319540402a66c03dfd840d.camel@intel.com>
X-ClientProxiedBy: SJ0PR13CA0158.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::13) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY8PR11MB6843:EE_
X-MS-Office365-Filtering-Correlation-Id: a5c5e0e6-4d8e-447f-3aa2-08db16a5513c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DqHcya0bjy8j1kuJy3Opm3LUKQdQtQFHcE4HDwgJ3awOpjNTAat2YPled58xIed1CRQmypTCkIHP+6VJejB/hmf9GhFn7lwvR2z4NtVT5hZhslkjzoKtdl0SN/UWDbaaIePZG550xpBPznDjqKq6S7NCD6c1Qukc8W5TvY82qpRL1+WcFAL4ryBdO++Ait7KofGGosRI0gZRDta33djo1OTpBcA9mWZ5eIKj6Oen51Qb9dVsVZ5VflkgAjtL/t0sVBTGnDwZksmhCJ2JWW1cEAmNa4Lf+sCFhEJFMO3gbw898V3v5INlvb2hY+c5B7THJll/6hKPZpHXvIj6j365ukRadc0T5eojC5qF6G5+KLAnWaAYdQAM+2esKsv8SjYlk7o3P8/C5CtT7BMvsQb1WhdJh38qHUZHD8+nmVBtnvNgcnaF0IRaD0VpY0OpJHrYWY5LxowOlLXy5Xa3xBY6+yg7NQSzJNdFllM8R0qZGaDV+DUTVyXLNYkBGdlmh5+cdmJt3x/SsQTXJTxLRMLgL+gZens09wEzpS2C2oxq0DIjMmMvHka4+szhqx1sbMoLZoH1FHTPayqA+0lbdyRVYWOV1xqxnMcYOrpTqSbUBSLcPMZU7mygRqNSECOnB3IZ/Wz15QGTGfXooP68bt6t9g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(376002)(136003)(396003)(346002)(39860400002)(451199018)(66899018)(36756003)(86362001)(478600001)(8676002)(66946007)(66556008)(4326008)(66476007)(5660300002)(41300700001)(6512007)(107886003)(9686003)(26005)(186003)(1076003)(6506007)(6486002)(38100700002)(83380400001)(8936002)(6636002)(316002)(54906003)(6862004)(2906002)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?QoQkdvyU7h5oBUvhzs3iDeksiWiNfVAn5gYJSuWAFa/ceLHITbdmwyocnQ?=
 =?iso-8859-1?Q?1PRt2e/d0vRmoxgv0xFs0U18P7iNGwRTkB7KTdANI1BC0GNw/C0DZea2Be?=
 =?iso-8859-1?Q?BdP9fZ5QiIYht4VB9SB9JgksL0ORjMyDl1isdE3w/Jqi2qop/b/wkhlCkN?=
 =?iso-8859-1?Q?r+GCmB5dWwx9vhndgtWy9OWao6lTT3SZ26azUG0pSkAzboKFnXkwFY0Y4n?=
 =?iso-8859-1?Q?KCb1ksAIzsRq9/6m8Nmrcb+tlJ+LrWolACspDyYBcRdg19rjHytny8aMg2?=
 =?iso-8859-1?Q?o22J5y6CPEOSP+84NLCrek2JdsKlBz/rv8AO4KeFQ8akIugA6EMTvPxXBG?=
 =?iso-8859-1?Q?Xlv4mWrFZoS9UnMqsUb9HCU0SFYaaxgG06dk7gKy3YKvJTFjNJaflWPB/H?=
 =?iso-8859-1?Q?RUQiOoP2gngB3I+FEDwfdrXTikO1aLJCKEObihkl+Lx1kLFYYPlXoJ2JVI?=
 =?iso-8859-1?Q?sPaj5KalD1DzkZquITPfWIWHumrCaYULspt3WhtibukVv8J2ufB1QRsxYf?=
 =?iso-8859-1?Q?uq/KzsU49VC6lmpDsG2lN+LQanJ8veHi0xwbh5RSxT+6V8bIqq6pKwwlLv?=
 =?iso-8859-1?Q?Ji3c/pVhAmWZ+qMLdzSZtzxR4V7/Rsqv2Fu/lh3B6O8t6LuD13ZU+EUNVv?=
 =?iso-8859-1?Q?lGF+ZJbiakUcCoeSAob/yY8SBlRssEwhMgyRzmccf0liMDix4ej9+m9Xd9?=
 =?iso-8859-1?Q?+PcBdbtDKSFt/AkvldsVOAcE3TkZZiFGOPCJHxqOT1giAi5AT1vdupT9uA?=
 =?iso-8859-1?Q?xT8ANS+0nlgdZ6c6HkQJeaiaXmxEU9x7LTsowcutiGKp83vI0zJGCetqOM?=
 =?iso-8859-1?Q?XzptPVbjC6RcNWIYQrFoC1qhhtB5XGZsb0KhbnF+rPT8uy87/9qPieKqqp?=
 =?iso-8859-1?Q?+eEqAQPklQz7fdvkMiCqSteh+15TCQGo0FWxUmRR8Z6zhwCjK53fkrqwyD?=
 =?iso-8859-1?Q?K9xkC9NJisxiL6/wi1yf1FM/5VXxU0+ACfMbcjrBl0y6MoTUhpZ27XnrH/?=
 =?iso-8859-1?Q?Xvj5QD4UxqsNvvjDG6rYmX3wMXAR2l1j+laMC2vUW+ZdVEuhSbcUnx76B9?=
 =?iso-8859-1?Q?IiK8PZsKG0QnOuVTS+4P/uz+PVSjjQ/oiifQ7S9ldxVtzZqfliN/d1L5q5?=
 =?iso-8859-1?Q?vdHqS8VnmPQlJQ9tCd7m6z0aOg0xC63Yr0v3pasA/yAQA2c+ZNz+kJ/psO?=
 =?iso-8859-1?Q?m5gNFtPcNtCr6AYll5FYYdcP2Zr2a7xRne1XQrLoQItLyty5jd+y8mBQPv?=
 =?iso-8859-1?Q?muvWNdMkxetSjgSat8L6rc5ylVMUwKVn2A6SiGUWti4SNBf/Hy3kEermlM?=
 =?iso-8859-1?Q?iTzLDd+T6Ne789bc3rpHEXWoaWH8qdWZ+SaeD4gLPyvrw9wRrTrsJDXWAo?=
 =?iso-8859-1?Q?1F7ms8hmKe4AY5IHKop++eSfaAYYbr3gCqcTpTDFIUnY5bqAvun0+kHHSN?=
 =?iso-8859-1?Q?Ws7xgELd9GPmIweG9vTeDszES8BMNoRo6Mk7SmLHxm+Ij31kgDyRclN8rG?=
 =?iso-8859-1?Q?aeVRwGsf34qq3UaizE2Xe68wEo7utp0f5ZesDNfMgmRdYSSvtrdU94zxVL?=
 =?iso-8859-1?Q?P7XzhrYCOd6Mu6PNJnyNw4N0c4TLmyoaQJAUATawHosrtsfwJA+S0VDmwG?=
 =?iso-8859-1?Q?3GXFxJx5hQTgicbT4npZLkrfIW4o2D6RWGB11G8zZ5LMSc7V43PBXpGw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a5c5e0e6-4d8e-447f-3aa2-08db16a5513c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2023 20:25:49.3404 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fXjkoK9j2nlaBUc/yTZ+52mTG9N8zN0++lK3PV/Ohnhm73Fhj81jSCUG6WjImxzUUoTOO66gM9m4eUr4M46s9fumdG14wVM1D0pkgrit4Vg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6843
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 05/11] drm/xe: Remove dependency on
 intel_gt_regs.h
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
Cc: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Lankhorst,
 Maarten" <maarten.lankhorst@intel.com>, "Auld,
 Matthew" <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Feb 24, 2023 at 07:47:04PM +0000, Rodrigo Vivi wrote:
>On Fri, 2023-02-24 at 10:34 -0800, Matt Roper wrote:
>> On Fri, Feb 24, 2023 at 10:29:14AM -0800, Lucas De Marchi wrote:
>> > On Fri, Feb 24, 2023 at 10:06:14AM -0800, Matt Roper wrote:
>> > > On Thu, Feb 16, 2023 at 04:52:20PM -0800, Lucas De Marchi wrote:
>> > > > Create regs/xe_gt_regs.h file with all the registers and bit
>> > > > definitions used by the xe driver. Eventually the registers may
>> > > > be
>> > > > defined in a different way and since xe doesn't supported below
>> > > > gen12,
>> > > > the number of registers touched is much smaller, so create a
>> > > > new header.
>> > > >
>> > > > The definitions themselves are direct copy from the
>> > > > gt/intel_gt_regs.h file, just sorting the registers by address.
>> > > > Cleaning those up and adhering to a common coding style is left
>> > > > for
>> > > > later.
>> > > >
>> > > > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> > > > ---
>> > > >  drivers/gpu/drm/i915/i915_reg_defs.h  |   2 +
>> > > >  drivers/gpu/drm/xe/regs/xe_gt_regs.h  | 287
>> > > > ++++++++++++++++++++++++++
>> > > >  drivers/gpu/drm/xe/xe_execlist.c      |   2 +-
>> > > >  drivers/gpu/drm/xe/xe_force_wake.c    |   3 +-
>> > > >  drivers/gpu/drm/xe/xe_ggtt.c          |   2 +-
>> > > >  drivers/gpu/drm/xe/xe_gt.c            |   3 +-
>> > > >  drivers/gpu/drm/xe/xe_gt_clock.c      |   2 +-
>> > > >  drivers/gpu/drm/xe/xe_gt_mcr.c        |   3 +-
>> > > >  drivers/gpu/drm/xe/xe_guc.c           |   2 +-
>> > > >  drivers/gpu/drm/xe/xe_guc_ads.c       |   4 +-
>> > > >  drivers/gpu/drm/xe/xe_guc_pc.c        |   2 +-
>> > > >  drivers/gpu/drm/xe/xe_hw_engine.c     |   2 +-
>> > > >  drivers/gpu/drm/xe/xe_irq.c           |   2 +-
>> > > >  drivers/gpu/drm/xe/xe_lrc.c           |   2 +-
>> > > >  drivers/gpu/drm/xe/xe_mmio.c          |   2 +-
>> > > >  drivers/gpu/drm/xe/xe_mocs.c          |   3 +-
>> > > >  drivers/gpu/drm/xe/xe_reg_sr.c        |   3 +-
>> > > >  drivers/gpu/drm/xe/xe_reg_whitelist.c |   3 +-
>> > > >  drivers/gpu/drm/xe/xe_ring_ops.c      |   2 +-
>> > > >  drivers/gpu/drm/xe/xe_tuning.c        |   3 +-
>> > > >  drivers/gpu/drm/xe/xe_wa.c            |   2 +-
>> > > >  21 files changed, 308 insertions(+), 28 deletions(-)
>> > > >  create mode 100644 drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> > > >
>> > > > diff --git a/drivers/gpu/drm/i915/i915_reg_defs.h
>> > > > b/drivers/gpu/drm/i915/i915_reg_defs.h
>> > > > index b5e06b6a9478..a6080c983a77 100644
>> > > > --- a/drivers/gpu/drm/i915/i915_reg_defs.h
>> > > > +++ b/drivers/gpu/drm/i915/i915_reg_defs.h
>> > > > @@ -136,6 +136,8 @@ typedef struct {
>> > > >         u32 reg;
>> > > >  } i915_mcr_reg_t;
>> > > >
>> > > > +#define MCR_REG(offset)        ((const i915_mcr_reg_t){ .reg =
>> > > > (offset) })
>> > >
>> > > Should there be a corresponding removal of this definition from
>> > > drivers/gpu/drm/i915/gt/intel_gt_regs.h ?
>> > >
>> > > Aside from that,
>> > >
>> > > Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
>> >
>> >
>> > good catch. I was trying not to change the i915 headers, but this
>> > one went unoticed while fixing the build.
>> >
>> > I wonder if this should be a separate patch to merge in
>> > drm-intel-next by itself. It's harmless though and we could keep it
>> > in the xe branch, as long as also removing from
>> > drivers/gpu/drm/i915/gt/intel_gt_regs.h
>> >
>> > Rodrigo / Matt, are you ok with this approach?
>
>yeap, anything touching outside xe needs a separated patch anyway.
>and I believe it can already be sent do intel-gfx, right?!

the problem is to depend on that patch. If we are rebasing the
drm-xe-next branch with a non-ff. Then we could simply have the patch
in both places and handle the conflict. If we are not rebasing, then
is it ok to have the patch in both places and deal with a possible
conflict in a merge (or backmerge if we are not yet in drm-next)?

Lucas De Marchi
