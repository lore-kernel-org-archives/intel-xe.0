Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C932DC4167B
	for <intel-xe@archiver.kernel.org>; Tue,  5 Dec 2023 22:08:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D90F10E60C;
	Tue,  5 Dec 2023 22:08:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51FBA10E60C
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Dec 2023 22:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701814090; x=1733350090;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jjhSVCYIlxSkUESHxO/IPd9VvznXOt0Ykau5Xndk5dY=;
 b=GgX4sxXvXTLZ2Uqn5cjk2Us+eqaDcrHt+mVvhgjNk2Aqlwl0t+i1i5KV
 XGyPi4fdjvFBvPWpXSev6mRiSdRxZ4vRDD6BO5l+jbsylR91R7ncw9wa7
 sYXNHU4Qxc6Rg04jzfpeQY1liNKlaWrvbZemhc36HDqOztTKxqs0twF1o
 TUh8k68bhaghlKVRHOwLlk7zpPg7z/L6FXJJs+guwSsBN9HVx0TCu4NpR
 3GkvqpdvFS0mrKmful8R1ssmIKQdfFW1f9z64nn/83/71/Qq+odRuKPe2
 aaDa7HXFYEVzqPflGg9AmfV+iAZqJA/AVHEFyUkmMji3PHbXBEEvHltFb A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="393699162"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; d="scan'208";a="393699162"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 14:08:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="889090253"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; d="scan'208";a="889090253"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Dec 2023 14:08:09 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Dec 2023 14:08:09 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Dec 2023 14:08:08 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 5 Dec 2023 14:08:08 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 5 Dec 2023 14:08:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=laejqIm533DnFUtaCXwYj1qEjM3DkUFNtFTrIMjmUYFJUm/J7wUYtyo7IvY55qhhcbqDhAWbeEShq288PNXIYyHQ1PHgFKCf6FUvwzcdeCoUBONZitdwvY5LlpnAGHEPWWcC4c4HWNz/sk56xSec3wvybiRO83W6+kSY5jAuCUMP7wMFczM2QsEHnbZcBUq1ne7ouRskbIZTIfyk8X4newxN0tpnjG6LWz+Ke25oyB9jmKvVbUCFjpGHBjiFmDipfsIY5Xb8MwTHdddkL9KNeyMg/PpPlJxJ6Jiz+oX2IcNIwulGE/7ABDMDWgZX6TFFjPlDDTt89kNTne6gVVYpKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SBSvvV8gsaBqgfkYlZYEwtNSDTgtLPbCXj8aw/1b26U=;
 b=D2dnzHsFVcVp14QYntuTYacK+Z3GhEIrupTpG4f2XQMjC73DjjOiJmOrKutN3+zrbCvR4Nlkk2njZJOORNs5mdtn1ZADyDBzPKt5mTknaikni6lCNmRk7kyD4s/Lz6tbNh51Wusy5IuiMnPP/JUqp6Rgc45M5DeZZ2ilOQFRqc9CT7eYSMDzqqlfVeojoW0zsiZn5fLOcsw7kTKgtQ5uun3FcpJd4d/62AbA0HwuvTyh/Mgv01kNWbOi7H3F8nQ9MA92ZKBprqIvHjXFR9D+6jhEx9JpzfXV4oiCvAhR8aNJalaywxQ2GsoaWSpOLyAesYF6OczqM1EGAwJ+V+iKVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CY8PR11MB7922.namprd11.prod.outlook.com (2603:10b6:930:7b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Tue, 5 Dec
 2023 22:08:06 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7046.034; Tue, 5 Dec 2023
 22:08:05 +0000
Date: Tue, 5 Dec 2023 14:08:03 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
Message-ID: <20231205220803.GM1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231205085249.833836-1-tejas.upadhyay@intel.com>
 <20231205215546.GL1327160@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231205215546.GL1327160@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BY3PR03CA0028.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::33) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CY8PR11MB7922:EE_
X-MS-Office365-Filtering-Correlation-Id: 584e8497-db7f-489c-f0e4-08dbf5dea846
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cpHUIrSt1urCHPkoyCgMIv8+mJjp0A/6QPR0una41/FHgg54GS+LMpO7o9r10epupmSJm9miADdltqPkcZ5j36P5zb7PvHU4rJcBx1bd5BqennNbskLeeAWzJXwfX7MezL1IJqJJHPzwj5DVvmmTgPLbxu5SdhjfNLLvh8jExkJLaCyiRcQ+HZCmHa4mW43rfmSp+xKgJEMEW1FwxQ1o/jTWHtLuL2aB32Y7Kb+KC/iYqxYvyz7qpBETaABhH9KKR/j4GI+ctFXuWRfSl/eX0PVv3nJw7iiibkQuuKLoxJ6vfabWDdlNvCNQOploAnYyTHwwhmK2NhSqwY3BJRlQ72aHVcNP2M69wzUf3DYlbhp467hikpp1XnpF5LNaX4294/Vmwo8YxOnYt/vtgCWXMSs/Nn0eTWyC9nSvOLh8LecHB/2i6NFGdNs+gSGvltIn7evKf500sgwZ3qnOzwudWyNNNphDSrVrtkRfazQu9rOlFXI2DePcdTDs9dhI+oX0Z6ccoTCVMN4OVv5vZIkmiyCGUgTrLHI/81fGbPLAwdQYPqVv4QuKGEoCdVI0wcVU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(376002)(396003)(366004)(346002)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(2906002)(33656002)(316002)(66556008)(6636002)(66476007)(6862004)(8676002)(86362001)(66946007)(8936002)(41300700001)(4326008)(5660300002)(38100700002)(82960400001)(6486002)(83380400001)(478600001)(26005)(1076003)(6512007)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pXcKr/c4JcyR2fj7rM8Ni9CRwpcHNaK4d+YDomgQZ5CV0EYTTVEq3yBR9ROo?=
 =?us-ascii?Q?bqT2qNphSeq4AWenHL5kplDQnvLFIRiOrMfkIa9yIfHtGbLFhb1yIIj6mb8f?=
 =?us-ascii?Q?Glx0JXMLGZy/jHeaLLNekSNqlh51gFDmbybgNDsSc6ElKf59gqULeN79/0Se?=
 =?us-ascii?Q?5BKnX1NbbuGyPR03fsrssXnhR8z1dv0p2ymzjs5a6lnSBV2HLtA2wpxhmm1Z?=
 =?us-ascii?Q?3O3vOwjS3/PH8i2MAIL0pt58exwBatk9VuFQgDyvUDsdOch0amchSaCsuzJ8?=
 =?us-ascii?Q?4FS3IUKWKUsXiTqlzPo0yZV8T+CaGOMK94FuI/BXI98xVcmk+vRqRJ3M0IWa?=
 =?us-ascii?Q?lWH0IHgcJJ154UGn+S7BClX0NWxYNPCGuknylc9JtPigiTI9pbVIcwwWVGe0?=
 =?us-ascii?Q?cSaWMjsgd2pZiIJJ/eLxtsYdho19q/f6c8TGNCIgtlrOEiW5tUKoE8Bs2k7/?=
 =?us-ascii?Q?RUJ3aA2jN3hrW9djqTPyTrvoNi+77S59IBpqpd18QABErHZQPeWS61X0gT90?=
 =?us-ascii?Q?JbGWmRq6CPW97+4g65D3xZcIZZKePVSwlWFnt5KT1HJeZvCmpzDSxlnZd21f?=
 =?us-ascii?Q?6DlOWpdvzc0RY7ILp/sTpXbJyPa1m+f/ag+sVrLDtxpaCDKWdlUMdGHF7f0H?=
 =?us-ascii?Q?w6oO+lBpZVsOTzNnNLoBBEVignCCPlal+G0gbILft/jw4fkhFay5jtINEWfK?=
 =?us-ascii?Q?BOILxxl1Gisv3xrjOhHuehvLkjSwnGhFbGPNPf1EOQU51q0JutyRo4vqHbiT?=
 =?us-ascii?Q?y94vjMurPWW8uoWgcGA+niaM2t+zWr/q8GJrxdC7OtrxzuN/hXX97slzcMlc?=
 =?us-ascii?Q?WYIw5HD0J31HIR/4REYxUFazwZHfK1JI7JVpSuTQh/DEhww1FwmOKPL6nkRu?=
 =?us-ascii?Q?4QKkrPc644oa3XAj90/H7cZm0AshRbsC+/cBP43NQBc+mR5+Fk8SF1t+HOFC?=
 =?us-ascii?Q?ZvTO7UPR0s4yWAsOHCd+ov055apCuAp9l8BJ8KAKzT6hUezlcqFT1Jz05mGo?=
 =?us-ascii?Q?HN3fOLrIWc8DtHlLsOJnFpUSASlghNoRSwwF/m5iPSAMTWBwN71E3JG7Hqvq?=
 =?us-ascii?Q?TjMm6C/jihRRL0VC82bAoWMk2zRYmncAJ3yUF4LU4K5jx2vOt1LjNlnZwIDr?=
 =?us-ascii?Q?WED7NRBK7UewHz0LN85QgJrhpCeQSoc9PHxPcZN+foA4mRFitA/2LHA2HA7M?=
 =?us-ascii?Q?gv9q9tyuzjg1Q0h5x9TA3oqBEeBdR5lhfenD9ZvWTsiCO4R8mIqHu9QZOJqg?=
 =?us-ascii?Q?27L4uBqLavieHPywZw7jrFiOxAS26cQaEhrO0mQ7wz+6oprPk9sdfORVMsh6?=
 =?us-ascii?Q?mzpAMUCVyYboATjB3uJHxJa8cRxhlgFanKhqPuJz3+KceYbDR7e/cGvhQP+L?=
 =?us-ascii?Q?U/7PdLviYgerAvZWRSz+AGH+VHant3F4x1mleO7a5DX2gv4C+RWAp8dBU/3L?=
 =?us-ascii?Q?57lDF0L6aj5Qs8qFN3nsnn7vFQZxDkiE5C1YBRwxvWqA7xv6Z0acCv3Xp7C8?=
 =?us-ascii?Q?aohhGSg8gXMKHlbzQOMLSUW/UYSTSNnJo5vl8EvwfydXNGXMZg/fANkWQdKu?=
 =?us-ascii?Q?ws55afiMDLRy1Q1tERRqz8nBp8/0tv60x4zc7TFR+18RizNlBILygORB4H/Y?=
 =?us-ascii?Q?NA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 584e8497-db7f-489c-f0e4-08dbf5dea846
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2023 22:08:05.9042 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /u6kAJ5kQIUvpWg2rNLv5r71V/ipt/ABBf9A/1iMngZ+96ovSgc54hanE1ssEfldrq2s5TQC0lkrY5PfCdMH0LGnc2/ClW48iL56y3iQtNs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7922
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V2] drm/xe/xe2: Add workaround 18032095049
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

On Tue, Dec 05, 2023 at 01:55:49PM -0800, Matt Roper wrote:
> On Tue, Dec 05, 2023 at 02:22:49PM +0530, Tejas Upadhyay wrote:
> > This workaround applies to graphics 20.04 A0 step and on
> > render engine.
> > 
> > Workaround has three parts :
> > 1. Pipe flush before MI_ATOMIC - This part isn't relevant to Xe
> >    (at least not right now) since we don't use MI_ATOMIC anywhere
> >    in the kernel mode driver.
> > 2. Memory-based interrupt masking - Memory-based interrupt processing
> >    isn't supported on physical functions, only virtual functions,
> >    according to bspec 60352. So this is probably only relevant once
> >    SRIOV support lands in the driver.
> > 3. Disabling CSB/timestamp updates to the ghwsp and pphwsp - Workaround
> >    is added by this change.
> > 
> > V2(MattR):
> >   - Mention detail in commit message
> >   - Reorder bit define
> >   - Improve bit naming
> >   - Remove workaround part which isnt relevant
> > 
> > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > ---
> >  drivers/gpu/drm/xe/regs/xe_engine_regs.h | 6 ++++++
> >  drivers/gpu/drm/xe/xe_wa.c               | 6 ++++++
> >  2 files changed, 12 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> > index 444ff9b83bb1..ecdbc04a2d91 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> > @@ -40,6 +40,7 @@
> >  #define RING_NOPID(base)			XE_REG((base) + 0x94)
> >  
> >  #define RING_IMR(base)				XE_REG((base) + 0xa8)
> > +
> >  #define   RING_MAX_NONPRIV_SLOTS  12
> 
> Unintended change?  Even though RING_MAX_NONPRIV_SLOTS doesn't seem to
> belong here at all (it's defined twice in the header, probably due to a
> conflict resolution mistake at some point), but that should be cleaned
> up independently in a separate patch.
> 
> Aside from that,
> 
> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

Actually, scratch that...one remaining item below.

> 
> >  
> >  #define RING_EIR(base)				XE_REG((base) + 0xb0)
> > @@ -47,6 +48,11 @@
> >  #define RING_ESR(base)				XE_REG((base) + 0xb8)
> >  
> >  #define RING_CMD_CCTL(base)			XE_REG((base) + 0xc4, XE_REG_OPTION_MASKED)
> > +
> > +#define CSFE_CHICKEN1_REG(base)			XE_REG((base) + 0xd4, XE_REG_OPTION_MASKED)
> > +#define   GHWSP_CSB_REPORT_DIS			REG_BIT(15)
> > +#define   PPHWSP_CSB_AND_TIMESTAMP_REPORT_DIS	REG_BIT(14)
> > +
> >  /*
> >   * CMD_CCTL read/write fields take a MOCS value and _not_ a table index.
> >   * The lsb of each can be considered a separate enabling bit for encryption.
> > diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> > index 63bd4bb1af03..4389ce3548dd 100644
> > --- a/drivers/gpu/drm/xe/xe_wa.c
> > +++ b/drivers/gpu/drm/xe/xe_wa.c
> > @@ -596,6 +596,12 @@ static const struct xe_rtp_entry_sr engine_was[] = {
> >  	  XE_RTP_RULES(GRAPHICS_VERSION(2004), FUNC(xe_rtp_match_first_render_or_compute)),
> >  	  XE_RTP_ACTIONS(SET(ROW_CHICKEN, EARLY_EOT_DIS))
> >  	},
> > +	{ XE_RTP_NAME("18032095049"),
> > +	  XE_RTP_RULES(GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0), ENGINE_CLASS(RENDER)),
> > +	  XE_RTP_ACTIONS(SET(CSFE_CHICKEN1_REG(0),

We either need to add XE_RTP_ACTION_FLAG(ENGINE_BASE) to apply this to
the engine base, or pass RENDER_RING_BASE as the parameter here.  Using
the action flag is probably best since it can potentially allow us to
combine this record with the other similar workaround; see comments on
the patch for Wa_16021639441.


Matt

> > +			     GHWSP_CSB_REPORT_DIS |
> > +			     PPHWSP_CSB_AND_TIMESTAMP_REPORT_DIS))
> > +	},
> >  
> >  	{}
> >  };
> > -- 
> > 2.25.1
> > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
