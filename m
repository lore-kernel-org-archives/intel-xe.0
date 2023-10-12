Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D4A5CDB46E
	for <intel-xe@archiver.kernel.org>; Thu, 12 Oct 2023 19:30:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B92D10E54E;
	Thu, 12 Oct 2023 19:30:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F160810E54E
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Oct 2023 19:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697139047; x=1728675047;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Z66x1ZpoiLsh5aFVZfp6gSB6Ot/yYMNTRhGkbL26ZMY=;
 b=Iojh4n2+Pdp4qlOHUCnCtQaSZZrULBinFqOzzzyp+YrANFwdf7cXm8ON
 IHgkx8ZBdWwZpB5Uyw1lU6qIykR280k4cYIKtWuabl750GAagr2Z6UBnl
 gdcmI/nLRp5BQJL8DrhY0+1FZXnFxLFaKPrDDMJNWs927p69kHSvvhUxR
 /e9fjnY3fY5iwFGzbIGYbvL7iZMIy+wLLJJp/Y/iz+gWjRM/GjGyCUi/e
 k4xsjx7wxBrSIPaUv7sYRAqM0Zz4ZsiTBK+QfB+M0OK2pUPNu3AD10gy3
 jEBItDpfQ6nsEADjTReDVtAEE18u+fZzw6p9Rr+lNYDjOTzZBjhATYXQb w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="6575670"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="6575670"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 12:30:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="1085803056"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; d="scan'208";a="1085803056"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Oct 2023 12:30:46 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 12 Oct 2023 12:30:46 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 12 Oct 2023 12:30:45 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 12 Oct 2023 12:30:45 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 12 Oct 2023 12:30:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X5p/EE8z4woxUBeAZHOX/FGOWPfL+CUrJpG2bxRzQCUIkg/klnMhp9GNc4304W2IOtpi18mptK32sd2DXy3FIba1irdPfR4Wx1Ip+w6HlJsm2X+bnLHuPbtFfKaSqexMNgZGLe/SB9PnhDRBqKr13LqwMBV/h7fBRQfaboQAOlhjBA3jZ8NaBt4bzPDEtvFialQV3tewfi3RIG6Q/Ig6hQWEItIDaxdBS+CrKXuQqK8iaJgB1eTwZp80SjaCgStBVQOHrceW+gbi+MIViu1POuVsW/dI0PzUQlBUDtOoMRQu97M6fafHIz6LoEMEGinGCNNnS2k8JIyr3vDuoy6Okw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=poi1x4Ed9nMfVqCJFxbX+cORBE00btFzcyfrraD9ZH0=;
 b=XDplkt4sRG71omtKv06nT17sIYfWPPyj1jQKVl5b3qKbO3xSPxnuBqP59MN70nslmdvSxDlJLIqoZDV3viw+pWsP90NAnWqXNhk5X5ltRV/9aqgnqFJSzpIHpYw12ikMK5eqgUfxS5tLuSJ5kdVC+9d8oqJo8hNzcHI6MKEpvgAQ5biGNp7VZ47qqrZLYknWtM9rkJVRZZwTbkn6MaFrMZbZsoSayQIW8ED+edxvdhMpNgK96mTSmFt5HyhsCpdtXNJXY4LWG2CsMyzPKZNjPc242UTWCPlJDemA1hfJesdysndNk+TEGA5QGYa5h/LoTpjnNbgYhC1/Zjs6rmH+MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 PH0PR11MB4885.namprd11.prod.outlook.com (2603:10b6:510:35::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.38; Thu, 12 Oct 2023 19:30:43 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::f957:c15a:9c34:71db]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::f957:c15a:9c34:71db%3]) with mapi id 15.20.6863.043; Thu, 12 Oct 2023
 19:30:42 +0000
Date: Thu, 12 Oct 2023 12:30:40 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <20231012193040.GN21382@mdroper-desk1.amr.corp.intel.com>
References: <20231011230957.463381-8-matthew.d.roper@intel.com>
 <20231011230957.463381-13-matthew.d.roper@intel.com>
 <ZSd1clmlqgzNxqY7@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZSd1clmlqgzNxqY7@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: SJ0PR13CA0145.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::30) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|PH0PR11MB4885:EE_
X-MS-Office365-Filtering-Correlation-Id: 75ed6537-2a12-4e19-d13c-08dbcb59b96b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ABW/Qbg6yYBOcFqpkoQJB97tPFlDcxafrH7F+b8MUlErV5c2zuOMwdz9qcnmRYPIl4IZiJdBFhk5jdZ8Iojp7Qz4lHn9BhwinrpG/9EF2j0LuYg/jr742x2dy8BsMyDaXBCC3qLHeI6s5lLxB2qvfqzvWvbeuRKHwucv+tINWM9xTogPdgR62+oMeHsm+UqQIy0YALl3LtCW0wGtGU2r1j10DTTUDt7Sa0SA/ecWA03dHdCgr0SZcLKuQJw7K1yGq51i8L0HcpQjbkeEaUkPrONwIRv9Q5a5pYO1i9Ys2/jTIZD2fTDjEFdgQorgN8/4hkRbU39dBoVS1QwG2J2SsgbRYLvXg0xqaiZqI98DxhUl2ou49HqNGls3Pax8ZX8idLE9ytntbLqgFuFtrT+Pg3B4zlb1ll2crLaBJ5YAGfB5Uf8cq8Azik/uwe05fzILO6gVEjc1DG8Jqt01cognNQFjJ6pN0XLO3in85vhhbglVoW9tV7iLsPrqqIiOF7k8IwXRyHb4S0CGXHdmwazYfQgUNzS/jo2MPHxvLFbWv8QTKbzlprKxADFfvE6+wfUS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(39860400002)(346002)(376002)(396003)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(6636002)(6862004)(38100700002)(41300700001)(66556008)(478600001)(316002)(66946007)(66476007)(4326008)(6506007)(86362001)(2906002)(8676002)(83380400001)(6486002)(5660300002)(8936002)(82960400001)(26005)(33656002)(1076003)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7G79d+6PcIMuYXpEkA3EvEFRg9EreDkaOrQ145gM9GsU5wACI6cp3gvgpa0a?=
 =?us-ascii?Q?dAIMt6VsuusS6ZggG3dOxwc78UBeNYzjuy1sB0SV8PtZmU1oJAcnd1d8Q0UN?=
 =?us-ascii?Q?LqTLeuArhS6VKp4k8bUpfBgyyGsN3Y6xAAunLH11MxB3dM1lClObUe/N4f2a?=
 =?us-ascii?Q?JjVfnEb6K+fs4fLB7mWa49QJJpigJNsgeoE7vQBBp/ZuVZK9/z85Ca7ZJVjV?=
 =?us-ascii?Q?GbkEidPL8UQGkP3k4IQauxHhHlUTVhWN7Td4zo0/c5hU/yBGye/f41XBw8hz?=
 =?us-ascii?Q?zcBIReAeGzVKaraWZEZb1vZ8TWbP9lkecdLQPV2goZjWKqmB99pqZfAXAvmO?=
 =?us-ascii?Q?AjJTkWggjQfe8n2QF08P3m+Vp1HSjvJAZmWJruyHJNz8Qphahgq9Vgadp0fE?=
 =?us-ascii?Q?OWIid7IZnOXjAWCnYtp+2kclEA/n09YisgBWr2l1bhebmzfZlxTyeQsRXQ8z?=
 =?us-ascii?Q?JIuREsspWFIIfQIjAbJckSaa1J3iViIwq9URYKBFZTZMhPBWdV/H1k5nNjxz?=
 =?us-ascii?Q?ILCMyluZLM/ZR+RL6A71lE9STHm9KESNrTtydjZFzKgV1uE/SrP4QKyG+Vli?=
 =?us-ascii?Q?7O8KGWBBKXVaF+TbbsrQ5mWV6MxHhImhXXio4lpoYNSkle5YCnfGRGDPP5Xx?=
 =?us-ascii?Q?lh4mYPvy1AozUndhzzqIsXiZBjEccX4l+L76Ojx59p5vyXFY0XXOVp1mOSWn?=
 =?us-ascii?Q?r1znwUigiBhcS7ZKeYrq0HCGrWjRnbrefuaHj3FlTlnm7jcibkiJWckfFmgm?=
 =?us-ascii?Q?aMWyj7XZPQuUP3k+qLVW82O1Kbi+/kLzmPFjbxUmV3wCP7TLnZqQ2UriOquw?=
 =?us-ascii?Q?pFfTfeLXV8V1WexKYhUOKA0350vzKH4Tw+eVvpW8uyhqTxDuB/SiV3LK6jyy?=
 =?us-ascii?Q?oX3O7IS7ZI8RBklauNXenVjWEe199G16W4h2T+m8sqboo4cTRG/J97QWriSq?=
 =?us-ascii?Q?sfZnwzGeJHQjQSR4776TWDLebQP0LAFMVjeiByVtYa9KTE2+sDWPlghbcW7+?=
 =?us-ascii?Q?qpI1wW2DtHXVXsuzlPOZrDiFuOK6TzNT9BhlCwLE/BL5RPMewyOZE5g2q6Ki?=
 =?us-ascii?Q?lOvrumQiUiXSmyQkLyP/5ypdw/PgjKjL+JWlrJj1cM7rXwKIT6kpUmgmg+1T?=
 =?us-ascii?Q?G4I/Lz9lPfiOPL4TsGwZn3NUaZhKfuMT86Q1ySP4OkiwPYLV2TMk/Evp8b2B?=
 =?us-ascii?Q?WwqIBGbkpKf3XV30d5MKZhu+2v5Aue4cVvcYO6cWHWolrfEPwfsDbXdqF53Z?=
 =?us-ascii?Q?JJOZSVO8AKnN9b+E95wIRYU8ZJsjpViyfG9oD982m9P/ogF5UzAT6DUtcX3y?=
 =?us-ascii?Q?myD0EBiiQ7cea2Hr2BrqcoikOGCSl4ZlOurbDCgsEP6MENXBY6dHx57nHCVt?=
 =?us-ascii?Q?UHa4DH3na/gHAT0KeSNuJjd8FWbp0OT9tk+3c2yVQY9JuRtLM9Shx4U+f7kf?=
 =?us-ascii?Q?DmvsCDz8yC6+9NpGjnfw8pR0ei+D+qCQBnPKXOB/0eoN84EU8P6AixggbYjN?=
 =?us-ascii?Q?22hX2P9huctEE2wDz1Aszkxqc4W2h/cfbpEp325Eot7JWk+ZMWLhlvqtWTbH?=
 =?us-ascii?Q?GWS09dpPv9xqhyu6+PbqT2SHHvsnA5wKQ0Kt3q4D4vMGUBoQ37mxhlz7pCTF?=
 =?us-ascii?Q?SA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 75ed6537-2a12-4e19-d13c-08dbcb59b96b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2023 19:30:42.8190 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /fI4rwrDAxq1AimR39SOi+kD0ovpzVJFhXfWz506itDDrXXEOELcc3GkH+SaBNHLzy6qO8Giosk7W0Gja+SsPUcOO18Pib68/aS4Vys0+/o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4885
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 5/6] drm/xe/debugfs: Add dump of default
 LRCs' MI instructions
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

On Thu, Oct 12, 2023 at 04:26:26AM +0000, Matthew Brost wrote:
> On Wed, Oct 11, 2023 at 04:10:03PM -0700, Matt Roper wrote:
> > For non-RCS engines, nearly all of the LRC state is composed of MI
> > instructions (specifically MI_LOAD_REGISTER_IMM).  Providing a dump
> > interface allows us to verify that the context image layout matches
> > what's documented in the bspec, and also allows us to check whether LRC
> > workarounds are being properly captured by the default state we record
> > at startup.
> > 
> > For now, the non-MI instructions found in the RCS and CCS engines will
> > dump as "unknown;" parsing of those will be added in a follow-up patch.
> > 
> > Bspec: 64993
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > ---
> >  .../gpu/drm/xe/instructions/xe_inst_defs.h    |  1 +
> >  .../gpu/drm/xe/instructions/xe_mi_commands.h  |  3 +
> >  drivers/gpu/drm/xe/xe_gt_debugfs.c            | 41 +++++++++
> >  drivers/gpu/drm/xe/xe_lrc.c                   | 84 +++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_lrc.h                   |  5 ++
> >  5 files changed, 134 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/instructions/xe_inst_defs.h b/drivers/gpu/drm/xe/instructions/xe_inst_defs.h
> > index c992ad767f08..d665a7e21f3b 100644
> > --- a/drivers/gpu/drm/xe/instructions/xe_inst_defs.h
> > +++ b/drivers/gpu/drm/xe/instructions/xe_inst_defs.h
> > @@ -15,6 +15,7 @@
> >   */
> >  #define XE_INST_CMD_TYPE		GENMASK(31, 29)
> >  #define   XE_INST_MI			REG_FIELD_PREP(XE_INST_CMD_TYPE, 0x0)
> > +#define   XE_INST_GFXPIPE		REG_FIELD_PREP(XE_INST_CMD_TYPE, 0x3)
> >  
> >  /*
> >   * Most (but not all) instructions have a "length" field in the instruction
> > diff --git a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> > index 4a37b2b86b40..8cd1fc0e4f17 100644
> > --- a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> > +++ b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> > @@ -30,6 +30,9 @@
> >  #define   MI_ARB_DISABLE		0x0
> >  
> >  #define MI_BATCH_BUFFER_END		__MI_INST(0xA)
> > +#define MI_TOPOLOGY_FILTER		__MI_INST(0xD)
> > +#define MI_FORCE_WAKEUP			__MI_INST(0x1D)
> > +
> >  #define MI_STORE_DATA_IMM		__MI_INST(0x20)
> >  #define   MI_SDI_GGTT			REG_BIT(22)
> >  #define   MI_SDI_LEN_DW			GENMASK(9, 0)
> > diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > index cd6d28c7b923..e2483cb7721a 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > @@ -15,6 +15,7 @@
> >  #include "xe_gt_mcr.h"
> >  #include "xe_gt_topology.h"
> >  #include "xe_hw_engine.h"
> > +#include "xe_lrc.h"
> >  #include "xe_macros.h"
> >  #include "xe_pat.h"
> >  #include "xe_reg_sr.h"
> > @@ -149,6 +150,41 @@ static int pat(struct seq_file *m, void *data)
> >  	return 0;
> >  }
> >  
> > +static int rcs_default_lrc(struct seq_file *m, void *data) {
> > +	struct drm_printer p = drm_seq_file_printer(m);
> > +
> > +	xe_lrc_dump_default(&p, node_to_gt(m->private), XE_ENGINE_CLASS_RENDER);
> > +	return 0;
> > +}
> > +
> > +static int ccs_default_lrc(struct seq_file *m, void *data) {
> > +	struct drm_printer p = drm_seq_file_printer(m);
> > +
> > +	xe_lrc_dump_default(&p, node_to_gt(m->private), XE_ENGINE_CLASS_COMPUTE);
> > +	return 0;
> > +}
> > +
> > +static int bcs_default_lrc(struct seq_file *m, void *data) {
> > +	struct drm_printer p = drm_seq_file_printer(m);
> > +
> > +	xe_lrc_dump_default(&p, node_to_gt(m->private), XE_ENGINE_CLASS_COPY);
> > +	return 0;
> > +}
> > +
> > +static int vcs_default_lrc(struct seq_file *m, void *data) {
> > +	struct drm_printer p = drm_seq_file_printer(m);
> > +
> > +	xe_lrc_dump_default(&p, node_to_gt(m->private), XE_ENGINE_CLASS_VIDEO_DECODE);
> > +	return 0;
> > +}
> > +
> > +static int vecs_default_lrc(struct seq_file *m, void *data) {
> > +	struct drm_printer p = drm_seq_file_printer(m);
> > +
> > +	xe_lrc_dump_default(&p, node_to_gt(m->private), XE_ENGINE_CLASS_VIDEO_ENHANCE);
> > +	return 0;
> > +}
> > +
> >  static const struct drm_info_list debugfs_list[] = {
> >  	{"hw_engines", hw_engines, 0},
> >  	{"force_reset", force_reset, 0},
> > @@ -159,6 +195,11 @@ static const struct drm_info_list debugfs_list[] = {
> >  	{"register-save-restore", register_save_restore, 0},
> >  	{"workarounds", workarounds, 0},
> >  	{"pat", pat, 0},
> > +	{"default_lrc_rcs", rcs_default_lrc},
> > +	{"default_lrc_ccs", ccs_default_lrc},
> > +	{"default_lrc_bcs", bcs_default_lrc},
> > +	{"default_lrc_vcs", vcs_default_lrc},
> > +	{"default_lrc_vecs", vecs_default_lrc},
> >  };
> >  
> >  void xe_gt_debugfs_register(struct xe_gt *gt)
> > diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> > index a04867131839..825b229212ae 100644
> > --- a/drivers/gpu/drm/xe/xe_lrc.c
> > +++ b/drivers/gpu/drm/xe/xe_lrc.c
> > @@ -6,6 +6,7 @@
> >  #include "xe_lrc.h"
> >  
> >  #include "instructions/xe_mi_commands.h"
> > +#include "instructions/xe_gfxpipe_commands.h"
> >  #include "regs/xe_engine_regs.h"
> >  #include "regs/xe_gpu_commands.h"
> >  #include "regs/xe_gt_regs.h"
> > @@ -903,3 +904,86 @@ struct iosys_map xe_lrc_parallel_map(struct xe_lrc *lrc)
> >  {
> >  	return __xe_lrc_parallel_map(lrc);
> >  }
> > +
> > +static int instr_dw(u32 cmd_header)
> > +{
> > +	/* Most instructions have the # of dwords (minus 2) in 7:0 */
> > +	return REG_FIELD_GET(XE_INST_LEN_MASK, cmd_header) + 2;
> > +}
> > +
> > +static int dump_mi_command(struct drm_printer *p,
> > +			   struct xe_gt *gt,
> > +			   u32 *dw,
> > +			   int remaining_dw)
> > +{
> > +	u32 numdw = instr_dw(*dw);
> > +	u32 opcode = REG_FIELD_GET(MI_OPCODE, *dw);
> > +
> > +	switch (*dw & MI_OPCODE) {
> 
> Drive by comment, 'switch (opcode)'.

That will change the meaning a bit.  Right now the case statements are
matching against the shifted opcodes values that are also used elsewhere
in the driver (e.g., MI_LOAD_REGISTER_IMM = (0x22 << 23), whereas local
'opcode' only holds the unshifted opcode (i.e., 0x22).


Matt

> 
> Matt
> 
> > +	case MI_NOOP:
> > +		int num_noop = 1;
> > +		while (num_noop < remaining_dw &&
> > +		       (*(++dw) & REG_GENMASK(31, 23)) == MI_NOOP)
> > +			num_noop++;
> > +		drm_printf(p, "MI_NOOP (%d dwords)\n", num_noop);
> > +		return num_noop;
> > +
> > +	case MI_LOAD_REGISTER_IMM:
> > +		drm_printf(p, "MI_LOAD_REGISTER_IMM: %d regs\n", (numdw - 1) / 2);
> > +		for (int i = 1; i < numdw; i += 2)
> > +			drm_printf(p, " - %#6x = %#010x\n", dw[i], dw[i + 1]);
> > +		return numdw;
> > +
> > +	case MI_TOPOLOGY_FILTER:
> > +		drm_printf(p, "MI_TOPOLOGY_FILTER\n");
> > +		return 1;
> > +
> > +	case MI_FORCE_WAKEUP:
> > +		drm_printf(p, "MI_FORCE_WAKEUP\n");
> > +		return numdw;
> > +
> > +	case MI_BATCH_BUFFER_END:
> > +		drm_printf(p, "MI_BATCH_BUFFER_END\n");
> > +		return 0;
> > +
> > +	default:
> > +		drm_printf(p, "unknown MI opcode %#x, likely %d dwords\n",
> > +			   opcode, numdw);
> > +		return numdw;
> > +	}
> > +}
> > +
> > +void xe_lrc_dump_default(struct drm_printer *p,
> > +			 struct xe_gt *gt,
> > +			 enum xe_engine_class hwe_class)
> > +{
> > +	u32 *dw;
> > +	int remaining_dw, num_dw;
> > +
> > +	if (!gt->default_lrc[hwe_class]) {
> > +		drm_printf(p, "No default LRC for class %d\n", hwe_class);
> > +		return;
> > +	}
> > +
> > +	/* First page of LRC is a ppHWSP */
> > +	dw = gt->default_lrc[hwe_class] + LRC_PPHWSP_SIZE;
> > +	remaining_dw = (xe_lrc_size(gt_to_xe(gt), hwe_class) - LRC_PPHWSP_SIZE) / 4;
> > +
> > +	while (remaining_dw) {
> > +		if ((*dw & XE_INST_CMD_TYPE) == XE_INST_MI) {
> > +			num_dw = dump_mi_command(p, gt, dw, remaining_dw);
> > +		} else {
> > +			num_dw = min(instr_dw(*dw), remaining_dw);
> > +			drm_printf(p, "Unknown instr <%#x> of type %#x, likely %d dwords\n",
> > +				   *dw, REG_FIELD_GET(XE_INST_CMD_TYPE, *dw),
> > +				   num_dw);
> > +		}
> > +
> > +		/* 0 is returned on MI_BATCH_BUFFER_END */
> > +		if (num_dw == 0)
> > +			break;
> > +
> > +		dw += num_dw;
> > +		remaining_dw -= num_dw;
> > +	}
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> > index 3a6e8fc5a837..a7056eda5e0c 100644
> > --- a/drivers/gpu/drm/xe/xe_lrc.h
> > +++ b/drivers/gpu/drm/xe/xe_lrc.h
> > @@ -7,6 +7,7 @@
> >  
> >  #include "xe_lrc_types.h"
> >  
> > +struct drm_printer;
> >  struct xe_device;
> >  struct xe_exec_queue;
> >  enum xe_engine_class;
> > @@ -47,4 +48,8 @@ struct iosys_map xe_lrc_parallel_map(struct xe_lrc *lrc);
> >  
> >  size_t xe_lrc_skip_size(struct xe_device *xe);
> >  
> > +void xe_lrc_dump_default(struct drm_printer *p,
> > +			 struct xe_gt *gt,
> > +			 enum xe_engine_class);
> > +
> >  #endif
> > -- 
> > 2.41.0
> > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
