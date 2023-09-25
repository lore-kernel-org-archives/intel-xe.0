Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12D2ACE79A4
	for <intel-xe@archiver.kernel.org>; Mon, 25 Sep 2023 21:14:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCE5610E1CE;
	Mon, 25 Sep 2023 21:14:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F12C110E1CE
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Sep 2023 21:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695676472; x=1727212472;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+0V0YL1b9+iDG+jPOqtJtNidtfP1CI2LJBiS7VioRVM=;
 b=G1Cki+Syp0bUjjcHE8jvpH72l8XIoFJZpr/1dJypetXA5KyIIRyhRo3A
 j9cLzug3bMKEL0P9edgbNX0r+0NsydLWOk6pRVb9bkzd4qUTaE4+ADdFJ
 FmGGEUPlZilLMyOUupTnXfOr4Y2z6NJg+Yc0hSET5U4L5A/KNlfQeVv8U
 KepnqR8/MLB6u1woCvMPjlmjvfLxu34detkAI1iYjJKbl7CegtHlyu0Hf
 eIl9YmfuhVI6uxwE6kkZXggSGLYWlqlY7PJnE0Ahq3pKqnP2iix9uLKXq
 AtXrf6VP1xDJKQ51JHgx/qclhzC0oEOv76qrilMHhgrVioFG3wCDZLZ9S g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="371722397"
X-IronPort-AV: E=Sophos;i="6.03,176,1694761200"; d="scan'208";a="371722397"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 14:14:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="995549098"
X-IronPort-AV: E=Sophos;i="6.03,176,1694761200"; d="scan'208";a="995549098"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Sep 2023 14:14:30 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 25 Sep 2023 14:14:30 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 25 Sep 2023 14:14:30 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 25 Sep 2023 14:14:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SDytioRvqFhNww1TihXbakIyEoM3w3KMNt7IkJz5Mhi8dqRzE/8JZSEq+ngc3k2LmKJIU/E9NC8Nn5u58kfGrMBzkTs0hjGjr1XKHPqWyKQtiYY0Rc6gg/qQEqaX22sxTy3hrrJXk7Ie8ibpDvZiWqxpIo+7ljwGLOilHDjrpL9fOB4xf2HxN/v00UXGEwOfiyM5i0tmGUkDj1qDyN/NNHzXVnpugUO5HIKAbj6FD3RHlDvWae5+LzKfu6kqAJ6bRClOyA5QviO+f9rS+C+gDAIZuEaZfHIEs90FP1QOoVnWQBD+LZVA30hY8RthNS8XhMIs/SknK4cwZZLjPSWVnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0U/4UXPWQxI5dZ64j+0WSIVPxpZqe9Z/pxng9dwHGQg=;
 b=hUo+17oSgW4ZOWPBWatMw4lHrM8CaqGw1nvkjHZBLHJy6jrIno9EduUCjNnZHYm2sWvis8RtW6Pzbdq04R2/oqU8w6bpD7QUwfMCviLP49FrsdfytKnflWyM3la7afldSWtmRDJyUs4XA0JcpTeDw4GrfbQCTqdwhKIb21s2IvR70lqUmf7aQuH5kYmGClzQQPNY/JuaLvL1D0s/JgKyCXaSCzuIrzOkxExF++mCtTexjAp2u9CtWf1DlWPtoX43+MPkC1nX/7fF5vRdT/nRMAQU9nFLftD4XxlOWSYtnAzQcASMP3ywOsHLgxj1ephEpm9av61OzlFd0jIMd87nzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 PH0PR11MB5643.namprd11.prod.outlook.com (2603:10b6:510:d5::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6813.27; Mon, 25 Sep 2023 21:14:28 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66%4]) with mapi id 15.20.6768.029; Mon, 25 Sep 2023
 21:14:28 +0000
Date: Mon, 25 Sep 2023 14:14:25 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Shekhar Chauhan <shekhar.chauhan@intel.com>
Message-ID: <20230925211425.GW2706891@mdroper-desk1.amr.corp.intel.com>
References: <20230925160543.915217-1-shekhar.chauhan@intel.com>
 <20230925180125.GQ233750@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230925180125.GQ233750@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BY3PR03CA0019.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::24) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|PH0PR11MB5643:EE_
X-MS-Office365-Filtering-Correlation-Id: 52954a71-0b59-4a49-69c4-08dbbe0c670a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lx7utNsLlYNiTLnbSEuNiaRjKnoqV1Sdwl8ZrirtPUea1qRJ7Ul8M3++XtfE+CmYlegXCtnIOVTXnGIDmZ0Pv6AKn1gCQSckad65G93kZ6Nq4696GJehRR12S+cgEbr5FrQHhfHy2XZsjUu1VP0x5ZXHiiCSOHKxXkUBYtJYKbjivdNc6mgoGOH9qvYK8hjzIjngc2XGVVqNlaIwWjHN7YEzXre0tTQWlPJr7gzeCpY5NYGBwufscK6c5BOufpj6EeaQOZ1jhAe7+Bb8SHI5IO7Vms2iE24Tqz1IDH74nEiXxpWYOagxg0R9Mx/WJz0JBfGknZof+TEP4K9dlFz0OcM9JwBNATtXIxOLpxHzStI2srVl1dxy8paFdODPAUhV3EOtrjyMqkon/lQg+YGXV6D53fZe5P38e/IKlqaNKqiMs8foOEzlvF3VUJUsOvcpJgryC01h1kM76+CT58OUOeBIvXl0sB/jPHxv/QAXXge1WXM+1rx6EtItxzUrGhnSTW2hUA4SVN9GfgFosoX3pCAk5MZkRFcaujp4nhprcf1/U0vTr6BLztDaKTq+Qq3f
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(376002)(366004)(39860400002)(396003)(230922051799003)(186009)(451199024)(1800799009)(5660300002)(26005)(83380400001)(1076003)(8936002)(8676002)(66556008)(316002)(41300700001)(66946007)(6636002)(66476007)(478600001)(6862004)(2906002)(6486002)(6666004)(6512007)(6506007)(4326008)(33656002)(82960400001)(38100700002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LSsWNDFfZZosmiceMMpMGAfdY0gYvmJt3QP/sk+G5ncnxHkkxJjlzytOFHqC?=
 =?us-ascii?Q?Iz4O+oKn2j5pp7Fguub31H4FX7+XrR/GvzQwpP9PFHpzofIkc0NeZJCkeoND?=
 =?us-ascii?Q?cUAsRS/7NyXFHHQmE+anqDRdFiRhQwHaL0eGS+BQG4PDmKM8lq3TaATumZbu?=
 =?us-ascii?Q?coKjaHX3X0AsgOzIEhS1iGRbgzD3em9Z86KaQ4HU2+wBrNO/fT+8VLSYnnnp?=
 =?us-ascii?Q?qQrLaA4Y5/7AvrjzysTsPkrfKkifU/KTD3OiwvEdS9ZuK6BF67DnH+/R7g7b?=
 =?us-ascii?Q?skcPGIkdVdeT6AQ/CFyj0w3gSk474WIVfwBTQDKN7fRA5f87E4XJnQsBReue?=
 =?us-ascii?Q?uNYdvZYebCtpaw3J+U38o3Nyhqc1BtBOPHy3fWf5K1ISa+2qsAeBB+Vt/vND?=
 =?us-ascii?Q?3Pjx5z0bn92uXh+Tlt27wuQeufO0DrPpghkPgc+L8WqS3ZX0j/2+LQvKTCgi?=
 =?us-ascii?Q?MwYwhsOKl/ub9Pwvg0BezH2IfaZad8rtzYvCDMU24jbPvFrkCN3ekhXENOvN?=
 =?us-ascii?Q?a72XDtqCOAsdMhNxUnX722xMYlMueNSZF5TMpSyeGydNIa1+ZutU4lJW2oJw?=
 =?us-ascii?Q?wGINkvIsBwqtmH5W9hn5F974wXJtX7FXYsoUC6KbWugsnkEu1ayRJrrUuHMX?=
 =?us-ascii?Q?7wqXHXdkPBs92Ks2hYojR+3gOL8B5H++PzyRZK1MTMYPK6mLycDBeyejfm6S?=
 =?us-ascii?Q?GPfp0VOZaKiJDzMphpq8SwnMD9oiDd/qwRNTJkvJi74LIF12twBBPZ+NPIw7?=
 =?us-ascii?Q?1bXdxi0rAczuFr9+340zq5IqLQVGgEXMpeQikr0zPvOWxsd3DTmBlkavDbww?=
 =?us-ascii?Q?gLGyMuLO9zFN+FsYCFlzlMyknMDyQqHfEdDxGfQbOt/QZSzh8PBahwgftX7A?=
 =?us-ascii?Q?KeFwl1JHd674pd3IhGCC89iZibXR3djC+50mfEhWM1BdMTYfeR1w3SurR3pX?=
 =?us-ascii?Q?JkXXttpn5r0W9hQoGsuuiy/M4dIwYGhw0XhRcx4RQy/H8wgtEt1EfdYfypuY?=
 =?us-ascii?Q?bTwdmmkQXfFCXGbkAdRdagi0NSJhsv2CTZnXZabxn48S0wY8YteZBZ9va0wL?=
 =?us-ascii?Q?6ECX60kliWFmiQ2vZqEAzN1CRjz5cUJC2qT3fea/IkxpF4bOwEJOVc9BCBx0?=
 =?us-ascii?Q?aOErHs4VLa6UC7Q8OyUMCc1tWdFvYhanrUmpnhNFxwOq/YcHMGKSpgaXcpGx?=
 =?us-ascii?Q?iFNlY24GWJ9NwH5OU1SPzjQkHoJ5ZDWCQ+TZJ/Zh5EK509dQctX9lZBgoUg1?=
 =?us-ascii?Q?kyqqGfXX9RfM77eHAR9czXJZFzDpJCoYVqJbXyIu1IKuZ74CZKBrLJ9OkZMd?=
 =?us-ascii?Q?6+03S7htGNaVXhESMwHBWOLgwosET87VJG4dhZeHZhsKsBI4AT7IUdb0Psco?=
 =?us-ascii?Q?jFTArg1ZuIlVQvgGObGfwEMJTdhemPscrkGq40aaKGZ2Y7BV63H9ExxzHIJO?=
 =?us-ascii?Q?k0CTZ8D76vqA793D4g18+SNxCv6IzqkmRMt8PibtSTAN29m/Ok6e8OH24jtF?=
 =?us-ascii?Q?5TWtcxA+QEAoYVIyJAlXLFU1gfX369Gr2aWdllO/MKZ7yclzgvEoQpeIA7tO?=
 =?us-ascii?Q?smzH8Xop4J294XnDPGWi/AQYnk53sYou45oazgIJgwFA5KpeOUqnZThMs0TN?=
 =?us-ascii?Q?bQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 52954a71-0b59-4a49-69c4-08dbbe0c670a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2023 21:14:28.1833 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nYBvO1te4RvHSvLVfC0bdZEi/DSehFA3WJNcC5jqI62LhorRYe8ugnfyn1K71MFfrho/4cX9peaTzf05BqYrWGSUygI/eWD9xbj1f9DWJrk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5643
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Add Wa_18028616096
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

On Mon, Sep 25, 2023 at 11:01:25AM -0700, Matt Roper wrote:
> On Mon, Sep 25, 2023 at 09:35:43PM +0530, Shekhar Chauhan wrote:
> > Drop UGM per set fragment threshold to 3
> > 
> > BSpec: 54833
> > Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
> 
> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

...and pushed to drm-xe-next.  Thanks for the patch.


Matt

> 
> > ---
> >  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  1 +
> >  drivers/gpu/drm/xe/xe_wa.c           | 10 ++++++++++
> >  2 files changed, 11 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > index e13fbbdf6929..3a4c9bcf793f 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > @@ -347,6 +347,7 @@
> >  #define   FORCE_1_SUB_MESSAGE_PER_FRAGMENT	REG_BIT(15)
> >  
> >  #define LSC_CHICKEN_BIT_0_UDW			XE_REG_MCR(0xe7c8 + 4)
> > +#define   UGM_FRAGMENT_THRESHOLD_TO_3		REG_BIT(58 - 32)
> >  #define   DIS_CHAIN_2XSIMD8			REG_BIT(55 - 32)
> >  #define   FORCE_SLM_FENCE_SCOPE_TO_TILE		REG_BIT(42 - 32)
> >  #define   FORCE_UGM_FENCE_SCOPE_TO_TILE		REG_BIT(41 - 32)
> > diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> > index d84e67a9af07..1450af6cab34 100644
> > --- a/drivers/gpu/drm/xe/xe_wa.c
> > +++ b/drivers/gpu/drm/xe/xe_wa.c
> > @@ -374,6 +374,16 @@ static const struct xe_rtp_entry_sr engine_was[] = {
> >  	  XE_RTP_ACTIONS(SET(FF_SLICE_CS_CHICKEN2,
> >  			     PERF_FIX_BALANCING_CFE_DISABLE))
> >  	},
> > +	{ XE_RTP_NAME("18028616096"),
> > +	  XE_RTP_RULES(SUBPLATFORM(DG2, G10),
> > +		       FUNC(xe_rtp_match_first_render_or_compute)),
> > +	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW, UGM_FRAGMENT_THRESHOLD_TO_3))
> > +	},
> > +	{ XE_RTP_NAME("18028616096"),
> > +	  XE_RTP_RULES(SUBPLATFORM(DG2, G12),
> > +		       FUNC(xe_rtp_match_first_render_or_compute)),
> > +	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW, UGM_FRAGMENT_THRESHOLD_TO_3))
> > +	},
> >  	{ XE_RTP_NAME("16011620976, 22015475538"),
> >  	  XE_RTP_RULES(PLATFORM(DG2),
> >  		       FUNC(xe_rtp_match_first_render_or_compute)),
> > -- 
> > 2.34.1
> > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
