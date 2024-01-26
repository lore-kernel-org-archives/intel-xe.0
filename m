Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92C05C47422
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jan 2024 18:14:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CAB010FCF8;
	Fri, 26 Jan 2024 18:14:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C3D410FCF8
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jan 2024 18:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706292862; x=1737828862;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=hFQPjVtEecWAvoPapj+jmxY0nCvE5jBOVlmSs75L95U=;
 b=Zh4ChMFw4RtnlXq7+3KRSSiyRWzpUC7kPkzmmqniKqK1ODbvTnBUKCnM
 dDtaEz9/PddAzslzetmLUU1GJo+ONSzj7yZQfQkpNLQQYosN4ZAESrAlH
 kHhSObPyRDMZFBffxrLRZCA585Y6LVxIwzPpMfNfXhUsn3j7Qcz38znJM
 vlAYX0ltZibLEf4Yt2phwuag3m4dxfXrHyTKkjUqoXPoUF5W1lB1aLYjz
 r+BmXwrr+ZqYVr6WNt8kC9kfSfRJYjCK5Ml1GEyoxzBOfNMCoxNK9V4uo
 UfbgBD/bYtWJrDE+KN3NI6/Chk7BzABZKkjtZW7NykwDlv3DFpf0OTsCT w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="2375060"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2375060"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 10:14:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2799709"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jan 2024 10:14:20 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Jan 2024 10:14:19 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 26 Jan 2024 10:14:19 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 26 Jan 2024 10:14:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ftb4QTOwTl+t5MwDwrctBqq14lveWTDPmuziOscgKYm/hnAJ+Sohx0xUdDScrNGsCfBzL4t+Afp61VT7o71A9r2cL3LPLoKdomveZrtYu52yYEViCnTQb6ck7ldcqhWrvfYtUB5E2HvU8RXPjTGxbMPsMlB+qMzkN604J2W92DQT09K9p420xwkyzrS0uLIDsSGJTpSBWbnxTYdPGL6b3S4lA/PP8f007pYGd3dCgaJzxG6mA4I/zdYDp/0n5HPOhFHAwt3SXBb950pqOaklwwVXJXWlUHP9PeafAlbVZkDBl0RaD1/OiTovu+kwXK0gkeBnBKoc0QZxNpAUvelwXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rluQhx/hMSCHnjzrnggRk7u+Hp0zNuWO5oECpLs/kmM=;
 b=hwDuLW4PSX8OtVS+ZD0CnScH52IS3trU0fhmhFthejhukrYbO4Z3GiBfZ0EKB44ARXQ/5lbVW+kCOku97KnQCV41OL4y5jT2R0MJVa43t/wNWzJ8xagWjClBQ58k5eMzLLG1dlXrYDxvHvPUCc4B5baJVsquBiU3SHxRTbsQQl+GKnojEX5vLblpKgD/zNyXicLZ3LqKZq2k9O/zUiXQ195zpKbLG3QaK3qSUYZrxTTDRu5qvsHuoK7qtFe+qsz6EOdyc/tGMUiaSZUu685WL9ObpTywnPnMUuRtTSt8pWwtPPE1peD0UXPT4PgvbOEcWVv4szdaKNsN41D0QFOo8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA1PR11MB7823.namprd11.prod.outlook.com (2603:10b6:208:3f3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.27; Fri, 26 Jan
 2024 18:14:17 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3%4]) with mapi id 15.20.7202.035; Fri, 26 Jan 2024
 18:14:17 +0000
Date: Fri, 26 Jan 2024 10:14:14 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>
Subject: Re: [PATCH] drm/xe/hwmon: Refactor xe hwmon
Message-ID: <20240126181414.GG5506@mdroper-desk1.amr.corp.intel.com>
References: <20240126074819.3851075-1-karthik.poosa@intel.com>
 <CY5PR11MB6211B12B8D0CB3D723E23B2F95792@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CY5PR11MB6211B12B8D0CB3D723E23B2F95792@CY5PR11MB6211.namprd11.prod.outlook.com>
X-ClientProxiedBy: BYAPR06CA0016.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::29) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA1PR11MB7823:EE_
X-MS-Office365-Filtering-Correlation-Id: 171568e8-6114-4919-9c07-08dc1e9a9bf8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tR3uiXOMg4+akZYcTU9nu1vjHMXmrkfdO7IXzeqqk6V8V98+uzUjmBlw0wVaxeMeY7GE2B/t4j72zZKfSCdhkaxaNdFMDBXFNb8MspcU1NENi6fy5uNF1ie/JkQtRpqXfXOG6SVVuhOThH6XaiaWyVOnlw/e4QS2bK3AVYswRG1kaQqvzPiDeubk/NWLLRdW7fsuaEDOaWawEGVWo/+YiqzfoxtYs9S3FrF+v/38JSJRywatl9pcFlb8oD9ARNeM1bRvYQuP4ZJjvXqyg44NUqFccU1i0TJbDU7W7qax0bFMcgaZau2mABjEhiwvrBSDnv0prdV6esPMwTuS3xbqIOwbS1G2nN7BZ5QtTgx3X4/y5NT76mbPtxwojBxmlLz4QqA2SWE7LwW9KK7u92rgfbBkf0tYJh/G3C0djSJygtQLJCVwronwHwofSW4l3pwMLEuSgW7xTLzeeYtaEw8GAzctcmNGm4G3GVtVJ/XiHSIEOcOPvRR0Z6RmmZvF34cKFj/p5w0sHsJIBxJS4TukUwpB87XP6uZu+mYq+EeLJ8zsy8Hig/sjo94OrbVG6Noe
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(346002)(39860400002)(376002)(136003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(66946007)(66556008)(5660300002)(8936002)(66476007)(8676002)(6862004)(4326008)(2906002)(33656002)(316002)(86362001)(54906003)(6486002)(83380400001)(6512007)(82960400001)(38100700002)(53546011)(478600001)(6666004)(6506007)(6636002)(107886003)(41300700001)(26005)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LHMIWj/dmUdaZeH/9xy5wt/x4HOQEhRmPZHbMexHJcp3/OiqMCMqfOr4sY2w?=
 =?us-ascii?Q?NxPZ2X8qS7tLjEE9tPbATkkCmQ0tTpYAgd5rXcd64gTGv11jeToRsJaTM+ZS?=
 =?us-ascii?Q?8rz6Et855nLPsAciDzFaqTb61b7xcFmLnDGy4t3bvftsSbaCmmH6vxWNCgyK?=
 =?us-ascii?Q?f3paeBu92Wnz1AxyGTlQjH7vbUJA7lHqqd4bofahw55LbLVqo+nLvSec1oaV?=
 =?us-ascii?Q?GSeGhdJK314MBdx/i3mBcXlhV/QlmLru2GxzLHa1ImsnbSw0TQ/Ee9PHSmec?=
 =?us-ascii?Q?Vzez8OpkvFY56HlOgaH0VWO52uS4PnUYNkLdhJ9RW3RO5eAHVYRwPF75JI2Y?=
 =?us-ascii?Q?U5rLtlyox5l+c9P2IIbDdm5idbLvRpaE5LaAKWBpQ+ovzECuhowikAEYaP9t?=
 =?us-ascii?Q?gNzC2PkHK4ruwJ8ZraLl9cQ3tTVh+J9iFXK4we5kltfdXXGUjefkeaZwywdt?=
 =?us-ascii?Q?gA3zD9UbEgUK9htPOGNZHBn6NpUMNqFSUIgnv9J2KA+5Aj+8QReDLAhOUOuN?=
 =?us-ascii?Q?/1WdJpb8SHtHJzm6JTqd3I+7j6XKiP0YtyERExZnahk/Wr6qHo0Fw23KKQ0A?=
 =?us-ascii?Q?4rnjhhC6y/ev2gFL7Iw2nmrNDdfKn07Mov1YswbtMEYAJjhQrRs+CiCSYeeI?=
 =?us-ascii?Q?cfjSo2PJu5O92p+C8SEAScabREH+nxMx6rhsoG9UNqsRSLkiss/YkbQPcqFL?=
 =?us-ascii?Q?z51LeMrKDqOGgyNOJX8VUs/fJF3gbnVvG5yKlkTVAdW55/2Y6MTNh5w1805l?=
 =?us-ascii?Q?GyeyBk+FAlHhPAJVaS0tLegjDl8G2SWu8SH4ySZ4Vwxa969BnLPcuazS8eod?=
 =?us-ascii?Q?eebbJf9q2OcVHIm1xZQy3yRBqECI8u5bASo32nY5vKi3LkbJVmxdOOPx7D/e?=
 =?us-ascii?Q?rfWN5/lT2gp+LckbkGzEoJ6Sfo77XEyB9icF8v39R6jiTPYuzi0EDK5qir9z?=
 =?us-ascii?Q?EBCIcHM0VdqXdVm3ZrzRqGy9TqlEI1mkIPT6N2Dv3l0NtWoC/z8Llzx84Ub4?=
 =?us-ascii?Q?naoiP8GF4nJtu55tC27uiJk1LtDTPy4PspVVPZq/DNf38XqVCWnATvZw03xj?=
 =?us-ascii?Q?YZJBnsIMl08juZeTq8rVjZH8Om+5xEnjonEgbn0lW0xUt+0s5w2YdNqmh4Nw?=
 =?us-ascii?Q?8PMkDTIn//d3lDYAY9T5OFaPY9L2A/5HKv0Atf0PI556u1sIe4sLVHrxmZPN?=
 =?us-ascii?Q?aJM+TM0j1Lac2LH1nQdFFyZ2BNdraSu3t9XTgT3sO8rX7NWTfyJfWllh7lE3?=
 =?us-ascii?Q?pWVekSolySH36KFEP7kco9y/BgdM0HPKNMTxBGp++YXwYosFqnKzrcOePlSV?=
 =?us-ascii?Q?mR0qh3l/SvEmzEVdxjqr3BrPQEVg5sX1H9s9KFJh51btwi4jafBVqsIU2z5y?=
 =?us-ascii?Q?wahj7QdtXlwtkxQi2U80y9oF0prfeTx8yTBHdWYogECjmxPyJaG9nCb0Dz1W?=
 =?us-ascii?Q?8Bs3I6Et7cF2KpMOApnL5f0TVkHv57VVv+tOJgAsR96d9Xt9Q/KnAXNqNZvO?=
 =?us-ascii?Q?QaiOJS+c1tyBQtAYnl9MaF54dUVGuywZGUbUMKK5HtnmrxYF8aSqO5O4yyBW?=
 =?us-ascii?Q?zfH/kDViPugvcN9gmp4xxRWuZbKe0b2rOlDQIMsB3ZsUd9SsYhYACdjDSiuj?=
 =?us-ascii?Q?Aw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 171568e8-6114-4919-9c07-08dc1e9a9bf8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2024 18:14:17.1483 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: puXH63heZMPTOzlvh+Ta999tFlA/hAqbRUx85CzK4U6DiH4hxGkbmAOFGTSTp1gHMg1ZPUnjIGQFUM55ClVqfjraMwGhm8Lp+bifz1vMBTY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7823
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
Cc: "Poosa, Karthik" <karthik.poosa@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Jan 26, 2024 at 05:11:37AM -0800, Gupta, Anshuman wrote:
> 
> 
> > -----Original Message-----
> > From: Poosa, Karthik <karthik.poosa@intel.com>
> > Sent: Friday, January 26, 2024 1:18 PM
> > To: intel-xe@lists.freedesktop.org
> > Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; Nilawar, Badal
> > <badal.nilawar@intel.com>; Roper, Matthew D
> > <matthew.d.roper@intel.com>; Poosa, Karthik <karthik.poosa@intel.com>
> > Subject: [PATCH] drm/xe/hwmon: Refactor xe hwmon
> > 
> > Check latest platform first in xe_hwmon_get_reg.
> > Move PVC registers to xe_mchbar_regs.h.
> > 
> > Fixes: fb1b70607f73 ("drm/xe/hwmon: Expose power attributes")
> > Suggested-by: Matt Roper <matthew.d.roper@intel.com>
> > Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> > ---
> >  drivers/gpu/drm/xe/regs/xe_gt_regs.h     |  6 ------
> >  drivers/gpu/drm/xe/regs/xe_mchbar_regs.h |  6 ++++++
> >  drivers/gpu/drm/xe/xe_hwmon.c            | 24 ++++++++++++------------
> >  3 files changed, 18 insertions(+), 18 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > index cd27480f6486..15ac2d284d48 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > @@ -490,10 +490,4 @@
> >  #define   GT_CS_MASTER_ERROR_INTERRUPT		REG_BIT(3)
> >  #define   GT_RENDER_USER_INTERRUPT		REG_BIT(0)
> > 
> > -#define PVC_GT0_PACKAGE_ENERGY_STATUS		XE_REG(0x281004)
> > -#define PVC_GT0_PACKAGE_RAPL_LIMIT		XE_REG(0x281008)
> > -#define PVC_GT0_PACKAGE_POWER_SKU_UNIT
> > 	XE_REG(0x281068)
> > -#define PVC_GT0_PLATFORM_ENERGY_STATUS
> > 	XE_REG(0x28106c)
> > -#define PVC_GT0_PACKAGE_POWER_SKU		XE_REG(0x281080)
> > -
> >  #endif
> > diff --git a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> > b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> > index 519dd1067a19..97652b4297ff 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> > @@ -41,4 +41,10 @@
> >  #define   PKG_PWR_LIM_1_TIME_X			REG_GENMASK(23,
> > 22)
> >  #define   PKG_PWR_LIM_1_TIME_Y			REG_GENMASK(21,
> > 17)
> > 
> > +#define PVC_GT0_PACKAGE_ENERGY_STATUS           XE_REG(0x281004)
> > +#define PVC_GT0_PACKAGE_RAPL_LIMIT              XE_REG(0x281008)
> > +#define PVC_GT0_PACKAGE_POWER_SKU_UNIT          XE_REG(0x281068)
> > +#define PVC_GT0_PLATFORM_ENERGY_STATUS          XE_REG(0x28106c)
> > +#define PVC_GT0_PACKAGE_POWER_SKU               XE_REG(0x281080)
> Above are pcode specific register, IMO it is better to create a 
> regs/xe_pcode.h header.
> @Roper, Matthew D what is your opinion here ?

Agreed; modern platforms don't mirror the MCH BAR into our gttmmadr
register space anymore, so this header isn't the right place to put it
either.  A new pcode-specific register header sounds good to me.


Matt

> Thanks,
> Anshuman Gupta.
> > +
> >  #endif /* _XE_MCHBAR_REGS_H_ */
> > diff --git a/drivers/gpu/drm/xe/xe_hwmon.c
> > b/drivers/gpu/drm/xe/xe_hwmon.c index 89c6f7f84b5a..c19a0daf7fd7
> > 100644
> > --- a/drivers/gpu/drm/xe/xe_hwmon.c
> > +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> > @@ -77,32 +77,32 @@ static u32 xe_hwmon_get_reg(struct xe_hwmon
> > *hwmon, enum xe_hwmon_reg hwmon_reg)
> > 
> >  	switch (hwmon_reg) {
> >  	case REG_PKG_RAPL_LIMIT:
> > -		if (xe->info.platform == XE_DG2)
> > -			reg = PCU_CR_PACKAGE_RAPL_LIMIT;
> > -		else if (xe->info.platform == XE_PVC)
> > +		if (xe->info.platform == XE_PVC)
> >  			reg = PVC_GT0_PACKAGE_RAPL_LIMIT;
> > +		else if (xe->info.platform == XE_DG2)
> > +			reg = PCU_CR_PACKAGE_RAPL_LIMIT;
> >  		break;
> >  	case REG_PKG_POWER_SKU:
> > -		if (xe->info.platform == XE_DG2)
> > -			reg = PCU_CR_PACKAGE_POWER_SKU;
> > -		else if (xe->info.platform == XE_PVC)
> > +		if (xe->info.platform == XE_PVC)
> >  			reg = PVC_GT0_PACKAGE_POWER_SKU;
> > +		else if (xe->info.platform == XE_DG2)
> > +			reg = PCU_CR_PACKAGE_POWER_SKU;
> >  		break;
> >  	case REG_PKG_POWER_SKU_UNIT:
> > -		if (xe->info.platform == XE_DG2)
> > -			reg = PCU_CR_PACKAGE_POWER_SKU_UNIT;
> > -		else if (xe->info.platform == XE_PVC)
> > +		if (xe->info.platform == XE_PVC)
> >  			reg = PVC_GT0_PACKAGE_POWER_SKU_UNIT;
> > +		else if (xe->info.platform == XE_DG2)
> > +			reg = PCU_CR_PACKAGE_POWER_SKU_UNIT;
> >  		break;
> >  	case REG_GT_PERF_STATUS:
> >  		if (xe->info.platform == XE_DG2)
> >  			reg = GT_PERF_STATUS;
> >  		break;
> >  	case REG_PKG_ENERGY_STATUS:
> > -		if (xe->info.platform == XE_DG2)
> > -			reg = PCU_CR_PACKAGE_ENERGY_STATUS;
> > -		else if (xe->info.platform == XE_PVC)
> > +		if (xe->info.platform == XE_PVC)
> >  			reg = PVC_GT0_PLATFORM_ENERGY_STATUS;
> > +		else if (xe->info.platform == XE_DG2)
> > +			reg = PCU_CR_PACKAGE_ENERGY_STATUS;
> >  		break;
> >  	default:
> >  		drm_warn(&xe->drm, "Unknown xe hwmon reg id: %d\n",
> > hwmon_reg);
> > --
> > 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
