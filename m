Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51D03C7EE24
	for <intel-xe@archiver.kernel.org>; Fri, 18 Aug 2023 16:30:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D187F10E0A3;
	Fri, 18 Aug 2023 16:30:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9DA410E0A3
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Aug 2023 16:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692376255; x=1723912255;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5tCoiyryS+Hph8NrvHmY0EdLoQAxWkh/xUz4zCBaKiM=;
 b=krA5aieFklcjZ8HTsn37HeKPmOTeUIlPguLZLqTf8NjZ1upt9/ANXR4Z
 +QiuzQbNwMs+cBZPROzJlMU9gn2KC5psyPotflFb9S7uR6QOfHtWqUQVT
 uu6i3WIDyapmhrc4JVGoTwDPo2pIk9mXCKPbzKLu+eoZ15gr//imXPUxr
 suRwVdO2oQmA1khXcrIcJTDz8x6VTUpEYtH4ZXv35T4j9EM8tN/f5bBBP
 nYdlXmQMVLZdKX+qU38ohCJLKEfOJ3wNZ894mz1aHqY8SbrmR/iXw1S6v
 9459PLx/KGp7Cj6PDHd1SW9DfpTZ8VLg9ymNukUFfGR64GzrCF+G6B//E g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="352727886"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; d="scan'208";a="352727886"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2023 09:30:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="712063889"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; d="scan'208";a="712063889"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga006.jf.intel.com with ESMTP; 18 Aug 2023 09:30:48 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 18 Aug 2023 09:30:48 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 18 Aug 2023 09:30:47 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 18 Aug 2023 09:30:47 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.49) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 18 Aug 2023 09:30:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bMMPPCZYncXEiqj7VivQTjQaylzWBntMQqYJodWhLvFyKj+vuz3Rd9Jybba+6D1kuGfiwIAUbFMoFfCrX/J0tg1ESRKkGi0y49GEu61dNoO/ftzcgFSI+3Ob91ypFZ9oxRFiHFNmxPhtz4/Dl3lFxOUz5QPhQeQwI5G1Ma81rXMJtzBT0V0SBRwpUfo44gBIUvAoLCDSkb/4fQHIdf1kSH3UbowJ1NRGvxSmxDehmoyTGlw0KiFjmoeOoEG4GlZnaSDm8R+uf4g4JUuBWaxXjh99b4HiD7dq0+o5EKmiq9UtjF8TWL7zeBDAcsnBdYFz4OVb5ZA9y3g8WNuSLq6uPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EjjNyCczfd47SqWjAroiMDiDXzaxU9+/JcI0ibXWCRs=;
 b=A6rrmIzmCNDhkWZGGiyZoDSiS6TIYS1ofRsDKO1UC1dPNCVI7/ShDx9MUyGSZwy8IgLYCgILw3JEZixQvXmiC0yoCxNODAepqMuKxwCGQFEz6P6Qxfn8QrdysAUNuJE5SbZerLateMtLfwyfpDBBjBWp/+r5pG5J4SNl73pXC2V2tD4d3QyFQHtzerp8QQov076MhimPKxHOm77chsIQ6p8hq1XJuMc4s1T4SrKqae6806xXgt+eGlzm3wddAwRksj9BbQnSfTsozESoqNvS4vmq+QuJjxIS62v/edNIrCz/qIKRQtC0RqG8umLZj0mw5h1thLKF7VGDrNOF+qp/eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by LV2PR11MB5973.namprd11.prod.outlook.com (2603:10b6:408:14e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Fri, 18 Aug
 2023 16:30:45 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79%5]) with mapi id 15.20.6699.020; Fri, 18 Aug 2023
 16:30:45 +0000
Date: Fri, 18 Aug 2023 09:30:39 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Message-ID: <5l256rme734jqdkjr2ktkaxhwnhzmkkulm7cewojizttax3opb@7mdcpa2mrbo3>
References: <20230811160618.477297-1-lucas.demarchi@intel.com>
 <20230811160618.477297-4-lucas.demarchi@intel.com>
 <ZN1Naiw9LLTxVVLR@msatwood-mobl>
 <ogbz7rqkordg6ogfy4efgnboux47bcrahds6hyestku2f6hdzk@6cqh6le33vfw>
 <ZN8LlSjG8edNqKJi@bvivekan-mobl>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZN8LlSjG8edNqKJi@bvivekan-mobl>
X-ClientProxiedBy: MW4P221CA0007.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::12) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|LV2PR11MB5973:EE_
X-MS-Office365-Filtering-Correlation-Id: 671a4eb6-b7e1-49a8-35d4-08dba00878bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lLK+rz9rwc1IQ/11Pg1FjOOEgeliNCdXTlwnZgoFAYslBN83Svz5qwYPQSqDVMNqLo5Bea53X/W2h079zvpEAaVTBGr5PeYO1Go7kVSDnyzdJxJJlJg2zW3WlhXWL4il2gDZrjtvPXm7PJM2M1wcts1rR3El1PdDdy4ZVZTskUln9LuGZaVenhXIWlQ535AkQV6JKUOuPrYa9I2CZa9qq/EWmQaae73dd3Pms7PCbG7KUepTSoWQT4w+l3mkTY8VMNNTVqoddavPRUHBLCNCK0Ya749zZKg4yYXeidQQJs1oLnppblfDRz/VcPTdH9SCYFiDtvlN0Aza1n4z0FZns0Ciu2AntlB1/zvxLw0i1LaUXVjx6QuqJ4jJglP2VMskwuup+N4Pdf0TVPqFEc7FPIgAwvt1LvyTR+BSoFCR038WnvrHkrPsVhmeuH/jlCLhQ4JOpZShfKWEQrvOEM96Zs1fp7fUmOglkVLQOEMf2RmDbao5p83V5X+t6kwgljiwCPRxB+Hw7oaoNf1TjgQrhgpuFpSFYF/1/lPBEt0/ss88z7HKU5LUd7rN94GQJcWX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(136003)(396003)(376002)(366004)(346002)(451199024)(1800799009)(186009)(83380400001)(66556008)(66946007)(38100700002)(82960400001)(316002)(6636002)(66476007)(478600001)(5660300002)(2906002)(41300700001)(8676002)(6862004)(4326008)(8936002)(6512007)(9686003)(6486002)(6666004)(6506007)(26005)(86362001)(33716001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nDN7V+/+ixRvcgiovtG0eYD6fLjzBMrLtIpTHFuoQnW1Wnlq6tipKam0SQGO?=
 =?us-ascii?Q?EBfcA/iOCMOxLt1RvI03Z+YUUICk0DxJ4IAF5FT4O7dVS05gT5gHXFFSTPQy?=
 =?us-ascii?Q?Yld75KUHVA3IOrCeGhQkYChDtRoBPPzM75tkx9WiTb8xDWeFv71Jkd6Nj+0N?=
 =?us-ascii?Q?NsoApjKml46knnStomZbc0RGDIh4hmBq66cmm9fshFmblmjsrhV+0Wh2PFVR?=
 =?us-ascii?Q?5hfVn+cLvqitVf2ZJccMDdiD04lGsROpp4q4zW2BaFrj9QcuexYSRO9aqzd0?=
 =?us-ascii?Q?59acpCLjAs/jQcQMYL5XHGyWaLq0cM3vFiRuBFvjyaQItlp5mvN/S/7CeH5i?=
 =?us-ascii?Q?GGfp0iWvgkUFswzOEkuE1DWjhTGOXyzu7GMfWvaemK/BW51onI7V3dpYqiIX?=
 =?us-ascii?Q?DkdsviB0oB4Dta16DSmAPtt0Y/rX2IYSAFwA8iCw7IUqqmneLpwsqskgugcD?=
 =?us-ascii?Q?9VJd6B7NiZrVImhi8WTx/c+YdxTQMmVjRii8dfv2sY58h++fjDd9CemRPAVt?=
 =?us-ascii?Q?+wBjdsqeGHGwvYv4f7MqWMVQL1ZpNrV1xXBU8C4Jh6na9z0GmVWSGghmZxy4?=
 =?us-ascii?Q?RWJa7Dl+jeqHwh33QVULhx0snh0G+1NQkybqG7/sZdC4Ydz+iys4gLpY7DxB?=
 =?us-ascii?Q?jJu4bScP1HqPLmPsR0tE64Jq3CnoFT9qyh8GtkvlNe7x1220M7ec5+u6WJ1B?=
 =?us-ascii?Q?D66oF2Z485Sk2ffdUk73Klc8ZE8qzVogiXRXS39O1aa+NI0kNYsR1i4LDKQ8?=
 =?us-ascii?Q?lrj6/rZODU6/R/dHi1fDCU9zkQkCT7TSP0twZjvg8FdlW1QPy24kwtfXS7L+?=
 =?us-ascii?Q?ntok7ul47koMScpzbrnyzI/QU5RSDX4PFwCzbiMW0btI+WuyH56cbN+yF+u0?=
 =?us-ascii?Q?MEl8OS0R2FijDc70ibx/JBIFH+bzL7OYAo8SUn0rQyYHhwzCx29KzbXWF5ij?=
 =?us-ascii?Q?BeaEsJ+ls/WOw18PehdO/ltWDHq1ZiHGZM1xNQF2TnsY4+vv61siid3DO/Zg?=
 =?us-ascii?Q?ugdKsib8Z2rnb3L7nmUWpeoCxZ1ZvwlhXJm6u6aUBLCDlaUrcAMlRUGXMVe3?=
 =?us-ascii?Q?n4zGkAMezHJgceSjZsDYyzYGORNZYwIo5JEoyHjnXY0GZtndcfHBWjK/Wjuu?=
 =?us-ascii?Q?xtSNIPYsbDzAFZ9aOwAzDykn0QHqMq1yXGQMUeuPW29fK9jfXnypOr9l/rl+?=
 =?us-ascii?Q?g7bppIf05LT6kilgFF1AbNBy1gpuabADf7aslVFH+H/fKQ8G6BtIBknMOre8?=
 =?us-ascii?Q?4AfCsmF5LubPj1DP4xUxdzPNKs+4Ha+sB8znEOCMp5jWRFljYFAKnn5B1od5?=
 =?us-ascii?Q?8TEDxvKkAxRcppymOOc6qvN/BcNj5DtHvPxM5O72ixK6qLC+uZXuSDI2WB/Q?=
 =?us-ascii?Q?DrM7Q7kmF9xp+YGQ0fwyZPvUIudwIv5rjvcn0RDw8nOQ0HiSGV9a1zh8qpdg?=
 =?us-ascii?Q?mtXLToX7CYRFcU19yD79ZG3VGNqVq7iXhKlslFSHTq09qGnv6kzmtLY7bTJO?=
 =?us-ascii?Q?/hNE1jIMutG3Ici3lfbOfqX6uqJYepIN7VOX63aYIpXwHEF2Gj83JHI+PCrN?=
 =?us-ascii?Q?saNUYj+v7d3LJnDRiNgvcPoTovytTwnTQSpDsvmr62wdrCHbLOD8OPdJ7nXr?=
 =?us-ascii?Q?fg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 671a4eb6-b7e1-49a8-35d4-08dba00878bc
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2023 16:30:45.0882 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ltpHQh2g7u6jAuYf+0B5m8RkXKjk1djaue5Zw4cwws0Mt7aSJykQAN4JvCU7Sm8iFcqyFPqUVwjNGDes2Z+mjTlFqK49wAS8/IcPND4UEjI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB5973
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 03/15] drm/xe/xe2: Add MCR register steering
 for primary GT
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
Cc: matthew.d.roper@intel.com, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Aug 18, 2023 at 11:41:33AM +0530, Balasubramani Vivekanandan wrote:
>On 17.08.2023 07:47, Lucas De Marchi wrote:
>> On Wed, Aug 16, 2023 at 03:27:54PM -0700, Matt Atwood wrote:
>> > On Fri, Aug 11, 2023 at 09:06:06AM -0700, Lucas De Marchi wrote:
>> > > From: Matt Roper <matthew.d.roper@intel.com>
>> > >
>> > > Xe2 uses the same steering control register and steering semaphore
>> > > register as MTL.  As with recent platforms, group/instance 0,0 is
>> > > sufficient to target a non-terminated instance for most classes of MCR
>> > > registers; the only types of ranges that need to consider platform
>> > > fusing to find a non-terminated instance are SLICE/DSS ranges and a new
>> > > SQIDI_PSMI type of range.
>> > >
>> > > Note that the range of valid bits in XE2_NODE_ENABLE_MASK may be reduced
>> > > for some Xe2 SKUs.  However the lowest bits are always valid and only
>> > > the lowest instance is obtained via __ffs(), so there's no need to
>> > > complicate the masking with extra platform/subplatform checks.
>> > >
>> > > Also note that Wa_14017387313 suggests skipping MCR lock acquisition
>> > > around GAM and GAMWKR registers to prevent MCR register accesses in an
>> > > interrupt handler from deadlocking when the steering semaphore is
>> > > already held outside the interrupt context.  At this time Xe never
>> > > issues MCR accesses from within an interrupt handler so the workaround
>> > > is not currently needed.
>> > >
>> > > Bspec: 71185
>> > > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>> > > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> > > ---
>> > >  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  1 +
>> > >  drivers/gpu/drm/xe/xe_gt_mcr.c       | 50 +++++++++++++++++++++++++++-
>> > >  drivers/gpu/drm/xe/xe_gt_types.h     |  1 +
>> > >  3 files changed, 51 insertions(+), 1 deletion(-)
>> > >
>> > > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> > > index ad7ae6a28caca..5bc6c7fa4759f 100644
>> > > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> > > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> > > @@ -145,6 +145,7 @@
>> > >  #define   EN_32B_ACCESS				REG_BIT(30)
>> > >
>> > >  #define	MIRROR_FUSE3				XE_REG(0x9118)
>> > > +#define   XE2_NODE_ENABLE_MASK			REG_GENMASK(31, 16)
>> > >  #define   L3BANK_PAIR_COUNT			4
>> > >  #define   L3BANK_MASK				REG_GENMASK(3, 0)
>> > >  /* on Xe_HP the same fuses indicates mslices instead of L3 banks */
>> > > diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
>> > > index 9eb7a6a1348d6..ef9f4044ca1fd 100644
>> > > --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
>> > > +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
>> > > @@ -181,6 +181,39 @@ static const struct xe_mmio_range dg2_implicit_steering_table[] = {
>> > >  	{},
>> > >  };
>> > >
>> > > +static const struct xe_mmio_range xe2lpg_dss_steering_table[] = {
>> > > +	{ 0x005200, 0x0052FF },         /* SLICE */
>> > > +	{ 0x005500, 0x007FFF },         /* SLICE */
>> > > +	{ 0x008140, 0x00815F },         /* SLICE (0x8140-0x814F), DSS (0x8150-0x815F) */
>> > > +	{ 0x0094D0, 0x00955F },         /* SLICE (0x94D0-0x951F), DSS (0x9520-0x955F) */
>> > > +	{ 0x009680, 0x0096FF },         /* DSS */
>> > > +	{ 0x00D800, 0x00D87F },         /* SLICE */
>> > > +	{ 0x00DC00, 0x00DCFF },         /* SLICE */
>> > > +	{ 0x00DE80, 0x00E8FF },         /* DSS (0xE000-0xE0FF reserved) */
>> > > +	{ 0x00E980, 0x00E9FF },         /* SLICE */
>> > > +	{ 0x013000, 0x0133FF },         /* DSS (0x13000-0x131FF), SLICE (0x13200-0x133FF) */
>> > > +	{},
>> > > +};
>> > > +
>> > > +static const struct xe_mmio_range xe2lpg_sqidi_psmi_steering_table[] = {
>> > > +	{ 0x000B00, 0x000BFF },
>> > > +	{ 0x001000, 0x001FFF },
>> > > +	{},
>> > > +};
>> > > +
>> > > +static const struct xe_mmio_range xe2lpg_instance0_steering_table[] = {
>> > > +	{ 0x004000, 0x004AFF },         /* GAM, rsvd, GAMWKR */
>> > 						^(4200->43FF reserved)
>>
>> This is intended so we have simpler ranges to lookup on every mcr
>> register access. Intention is to keep the table as small as possible
>> without causing issues.
>>
>> If it's reserved, there shouldn't be any access going on and we can
>> coalesce the range with the next ranges. Explicitely leaving out the
>> rsvd range would benefit debugging as it would automatically create a
>> warning when accessing such a register, but I'm not sure it's worth it.
>> Matt Roper, any thoughts?
>>
>> > > +	{ 0x008700, 0x0087FF },         /* SQIDI, MEMPIPE */
>> > 8700->87FF is SQIDI only, to include MEMPIPE entry extend to 887F.
>>
>> ack
>>
>> > > +	{ 0x00B000, 0x00B3FF },         /* NODE, L3BANK */
>> > > +	{ 0x00C800, 0x00CFFF },         /* GAM */
>> > > +	{ 0x00D880, 0x00D8FF },         /* NODE */
>> > > +	{ 0x00DD00, 0x00DDFF },         /* MEMPIPE */
>> > > +	{ 0x00E900, 0x00E97F },         /* MEMPIPE */
>> > > +	{ 0x00EF00, 0x00F4FF },         /* GAM, GAMWKR */
>> > GAM starts ate F000, EF00->EFFF is reserved.
>>
>> same reason as above, we don't care about the reserved "holes"
>
>I guess the above range was calculated without using project filter in
>the Bspec. After applying the filter for LunarLake, the range turns out
>to be
>
> {0x00F000, 0xFFFF}, /* GAM, GAMWKR */

ack. Or an older version of the table. I'm fixing this and double
checking the ranges for next version. Thanks

Lucas De Marchi
