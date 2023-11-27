Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E97EC0755A
	for <intel-xe@archiver.kernel.org>; Mon, 27 Nov 2023 21:21:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A8EF10E161;
	Mon, 27 Nov 2023 21:21:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35B1510E161
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Nov 2023 21:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701120100; x=1732656100;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=E7SKAX2R2i084iQa2KlLaifsZ4GOXSuloamGHfjlYjs=;
 b=Naofw+8OUBlFKwx9LGn8Nm3dt44KEi58jtYouETNPedBfjsjlxYSAAYq
 SS6NExKVN9vvkQOa+UR4ShkCjAzC/IHarCW+kbWiiEQ8JuaRSa5wgZBZ/
 H+sqWxCl6IJtjKh0bCbBHam3OfA8l5zZq9iCWW+TkpXk98bXGgQBluDra
 yTF2wSVEaXmyPxhZLnNKhznaauZHP0jAQNdrPXXH/Ili4iHZDdmKNUSKd
 UfJL6g7zrSKR0f2SPKT+5Vfrl45qRtqQ/+D3oc59ZhqmHtO9/I+L/514Y
 rayvjw+9YyGv6uidSgSgyal4D5OO4NKxO7NBcPcGmGoh392Wj4Mwfi18B w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="389945028"
X-IronPort-AV: E=Sophos;i="6.04,232,1695711600"; d="scan'208";a="389945028"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 13:21:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,232,1695711600"; 
   d="scan'208";a="9905448"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Nov 2023 13:21:39 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 27 Nov 2023 13:21:38 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 27 Nov 2023 13:21:37 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 27 Nov 2023 13:21:37 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 27 Nov 2023 13:21:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=btLGJpet+qHKkCIym34Ds4DQaRyc5yQ0ihnYa5sLCaGLmyG9eKC2oAWIVN0ZvR+qMBRAs/TLqNG4vCfkjiUEPVP2fd/1ssxVHO7aZfmoab3pCZFzt1Hu7LLq3g4wDTSvQJSlK+kirdNKbHcwmxM1wM5Qtb+vP7DHOWypHYY7dF6h0jxDuZGtd6AljizTNKPR6RWoWFdUKGxV/oVf5LntnMrSfktEJGc+iOvKv1xuqX4cKfvRqTpoo3YWYsizZaC1yG12URoBjNBbTyVGob0IfJe4SvdgNFZ+i37PSPPyUfw9bqXK+EDQSjEdAWEJUWEziHrcmflyRAXkksTvc+hb4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uEroaZ7rN+Sp0gUm2elmwsF1d3nFc2jPuKBTBU9HZok=;
 b=JX4pF+uEPX3/LEpOj/BlNWMuz9F5/QiNgVVVuxElx6kYboDDe/ujcAdPzO/z0xbmyqabs6hdybdF3e1KFaKXFewHA7wL+/RVPZMQTLTc8t8ZqIfWZWU0pdj64jcqJpIRACSQ3r2/rlt/Uzb0ryDnRcOO/7UcpZbc3w55oe2Vpme4HAT+QA8xymSlKD5XGeG/NHmyt/e+4e9ighpnA4foyMhd+RRZKKv5kgVF+UpafIqfuIUHvZoP7gLNvmugsEMnS3k/EF3U1Pgv3yZHcf+Lhev9QeGZN8DMBupJOdmBuK+DMgTRlQdYia+4WHyqCdpFza+a/3F3pEV0L5jMynWA9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CY8PR11MB6937.namprd11.prod.outlook.com (2603:10b6:930:5b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Mon, 27 Nov
 2023 21:21:35 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7025.022; Mon, 27 Nov 2023
 21:21:34 +0000
Date: Mon, 27 Nov 2023 13:21:32 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
Message-ID: <20231127212132.GR1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231127190332.4099519-2-matthew.d.roper@intel.com>
 <170111756376.56286.12271139830516445230@gjsousa-mobl2>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <170111756376.56286.12271139830516445230@gjsousa-mobl2>
X-ClientProxiedBy: SJ0PR03CA0387.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::32) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CY8PR11MB6937:EE_
X-MS-Office365-Filtering-Correlation-Id: 110aeb25-4d2d-43d6-7dfa-08dbef8ed52f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N6M3iu44/eFkD4InxfDwUgDcsXZiKgL9cQHsLF6xAsZvGQnV9VK7G0pZzrMxvvrnNAdHNgJNqtcvdITNfs/KF7Um+XnYAkLnqbwBs1qEb2li7Ns+YeQFzC5SqI2Fu3MSG7byQqdFPgnTrBsuNSDCr/MVRa7Wz3SeI7KIzn43Z5Rc/i4cl33BCezl/w4oa/K8UErGprGGDX6OGR21qt0cAV4mkpuPd6Nb1H7AiHAbMCvIU2fOVQT3lrf1jySXZWmE90G6dXw8dUzds50ixZ2hTS3dVBaa8qfzwr5EBTufr7nKsXTD3W7Mtf5vhL99TBuKfZ0Mj/UW162uiWnSHmAKXg/4/Wm7x1LOGZ6/1UwTL8tpwr7Td/W+kV+Klsw7uVmoR8nGcGa+zeTgSrlq7A8YyG+eLyJ6wWlAkiiq3d5Jp66fGAccCoN45053xAzNDhqe3/Y6U5a+l/3UcxqAgx9zyESrjYLXFs2z8aXAhCfLARkcOMUrDmyx3hlaHQCxI35KP3D0aqCpWTY5eWSFzuwPdg2kiqd3Zt8bzUORfzZkgQQbEotVpO5t9FcvY0gjkby7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(136003)(376002)(346002)(39860400002)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(8676002)(6506007)(26005)(38100700002)(2906002)(4001150100001)(33656002)(41300700001)(86362001)(82960400001)(6512007)(5660300002)(83380400001)(1076003)(478600001)(8936002)(316002)(6486002)(66556008)(6636002)(66946007)(4326008)(66476007)(6862004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?t3yHjC+bbp+crR1g+eDlwSYJvfXQEFJ72KVzA3TPnJ5HVE1+94nFh8vaRfg9?=
 =?us-ascii?Q?OKE9rgEpMcVnvVoXv5KrIjRPf0WUbBguQbqGehoUEPgoxWJ5zSNIq4PHiHZB?=
 =?us-ascii?Q?LaYXx2bki2VX6/nWagaRiry5mAuUsLm0OavXqvHJRloTnXAqYO5xrpwYyse3?=
 =?us-ascii?Q?BQprx0Mz7VzvgPE33GOjkIRJH2TEa7MTdClgqwUWfcsgvAxtOxJmJE8YSaA2?=
 =?us-ascii?Q?GV+Me4WbwR/aI/5LLI49h2YUFa4oLVMrNoHgTaZA/bJTyhJJsvoXRAMnrlpX?=
 =?us-ascii?Q?GWJndaOVFXeyvap2CVOrFXlFblloxhX5hhzg6Tm1uHR0cZWLhYIqg1M4XIW+?=
 =?us-ascii?Q?zw6DxENwkitmUtN7gwASOHiFirV+4/Dkj7WUGeGyA4/swnq4LhLr79CWWjWG?=
 =?us-ascii?Q?r+nDfog4jbI84MHUMtUQfd/gBs7dPdH+zbDN/w6MHyg3elD/m3/MRnE3zlrY?=
 =?us-ascii?Q?DWjRJpS0pmOiOYQ6aFeWRggmr8uVL14e5r5hNuSgnUyTTj7XNPmRUBOe3+mY?=
 =?us-ascii?Q?JJ1vFsX0pQZCibrmWUUMFRxyyuJ+zyhOv5NLZSxwuXFtuHc9ka24U7KgvYeQ?=
 =?us-ascii?Q?Hkn8pw/svxsT/ZLjmfeFqiH9V8mit22vD776TcKh8jDFL/3fHTciZghog2/A?=
 =?us-ascii?Q?yfQT5s3qKSqa9uAYpcqVLCARJBrzpx7s553LWX8+dIPuOCnhJHzwc3lb1B9z?=
 =?us-ascii?Q?26YJ6DPM8S3ydRId4t8I9+6LvnxWKP+Y09uUskLelR0E7CR4APWTfA7eYge+?=
 =?us-ascii?Q?0KXsM4aKv4gdrkTRBabtmBKuP7ldjmWtoA0X7HqVEpKgAxs0Q901K++/2ES8?=
 =?us-ascii?Q?XNgWU8E2xLBSGILcqo/ROGG1W7vIDV3AiWhlDXQo4IKR0AmOTAp06I0IT1bt?=
 =?us-ascii?Q?c8VDgceN/xgxEg/oxNGBoxzIOIw4x0CQ1LguVEv8GKLuu2LvPYdnl44SvLeM?=
 =?us-ascii?Q?bhPBOevDmsDJSP8Sexz1IXKwYyAHDCAWF3FCQyE9Wgq4MkJVGXGYmrghvZx2?=
 =?us-ascii?Q?63vySmGjsEBDoYCaTwHPK+InInZaX/PIx5LL6+bb++unz5x3uvScNF9n1+7+?=
 =?us-ascii?Q?fQF0reFwiAPAwNXH1WWYJ/m4kwgdQQdU4xUUdfnQGeVHL8S2X/sQIVvadC1i?=
 =?us-ascii?Q?68IAJoXt5MVAocKTFG4vWdQDjqdGdxJkw253dYWqCN1wKRPSD3IM8oyEYmoU?=
 =?us-ascii?Q?Bmt7SN10f5Ahg+/IikI1YDrhUcDLBpthjMRvPM9jSbrQb3betr1dGiwMAVso?=
 =?us-ascii?Q?xvsL4rXMyzIFMOGn4qxNFNEPD6VyDGHy+GsSD0k4kO5EIPjOZbMqckv4ybZH?=
 =?us-ascii?Q?ShKWIVSNXuZGMaNN9ZQKZq670tKXvpXx2BfaJsiG+QGxL6kH1LfGjIPVGBrK?=
 =?us-ascii?Q?UDOHH548LiJiuBMG8PsPUBxj3np1QziLCGR3sLCSLnDYE3/uWQAj6qb9Hqxr?=
 =?us-ascii?Q?EQmkvWB7oU/6+eVozMp2iaZDxD4MGqL1TeimUm1IckQwouuEvNjHi77l0Yua?=
 =?us-ascii?Q?6inhY3MytdIlsENQkZF2XAFbxC75iLaR2HDAMRFRD7rNSVVwZjD/8iek0XB1?=
 =?us-ascii?Q?FoVvomVoY7lvQxIsX8ZAAMDgNOQroYKWlpXiHkT7MIjt9y4XxUxmGsmPgODz?=
 =?us-ascii?Q?jQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 110aeb25-4d2d-43d6-7dfa-08dbef8ed52f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2023 21:21:34.8305 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vu0rKwk4EMnMLR7D8JOP1P6o0OXH3mLrNAE6lZdETrnoha0Yn2L3nW655s8o1IULNibK6TPwbOz3cC9inaBX1lQPOX0yckgPx7YNeJPazQ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6937
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/dg2: Drop Wa_22014600077
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

On Mon, Nov 27, 2023 at 05:39:23PM -0300, Gustavo Sousa wrote:
> Quoting Matt Roper (2023-11-27 16:03:33-03:00)
> >The workaround database has been updated to drop this workaround for all
> >DG2 variants.
> >
> >Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> >---
> > drivers/gpu/drm/xe/xe_wa.c | 21 ---------------------
> > 1 file changed, 21 deletions(-)
> >
> >diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> >index 81ae0232146e..e0853ab30c00 100644
> >--- a/drivers/gpu/drm/xe/xe_wa.c
> >+++ b/drivers/gpu/drm/xe/xe_wa.c
> >@@ -522,27 +522,6 @@ static const struct xe_rtp_entry_sr engine_was[] = {
> >           XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN7,
> >                              DG2_DISABLE_ROUND_ENABLE_ALLOW_FOR_SSLA))
> >         },
> >-        { XE_RTP_NAME("22014600077"),
> >-          XE_RTP_RULES(SUBPLATFORM(DG2, G11), GRAPHICS_STEP(B0, FOREVER),
> >-                       ENGINE_CLASS(RENDER)),
> >-          XE_RTP_ACTIONS(SET(CACHE_MODE_SS,
> >-                             ENABLE_EU_COUNT_FOR_TDL_FLUSH,
> 
> ENABLE_EU_COUNT_FOR_TDL_FLUSH gets unused after this change. With the removal of
> its definition,
> 
> Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

Thanks.  Dropped the unused definition and pushed to drm-xe-next.


Matt

> 
> >-                             /*
> >-                              * Wa_14012342262 write-only reg, so skip
> >-                              * verification
> >-                              */
> >-                             .read_mask = 0))
> >-        },
> >-        { XE_RTP_NAME("22014600077"),
> >-          XE_RTP_RULES(SUBPLATFORM(DG2, G10), ENGINE_CLASS(RENDER)),
> >-          XE_RTP_ACTIONS(SET(CACHE_MODE_SS,
> >-                             ENABLE_EU_COUNT_FOR_TDL_FLUSH,
> >-                             /*
> >-                              * Wa_14012342262 write-only reg, so skip
> >-                              * verification
> >-                              */
> >-                             .read_mask = 0))
> >-        },
> >         { XE_RTP_NAME("14015150844"),
> >           XE_RTP_RULES(PLATFORM(DG2), FUNC(xe_rtp_match_first_render_or_compute)),
> >           XE_RTP_ACTIONS(SET(XEHP_HDC_CHICKEN0, DIS_ATOMIC_CHAINING_TYPED_WRITES,
> >-- 
> >2.41.0
> >

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
