Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA0B0C4167B
	for <intel-xe@archiver.kernel.org>; Mon, 27 Nov 2023 21:14:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF6C310E3FE;
	Mon, 27 Nov 2023 21:14:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78FB110E3FA
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Nov 2023 21:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701119661; x=1732655661;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4BxgjODa/vlY7/V7rSUJ+84UzWnZyIUQjvaW2XQ47x4=;
 b=Wpe45bYYjekC28mFxDgsPIij9zF0HDBODS+e/RHwpwfS2p5fYqKy1/aY
 6lg40gAvre3pzz2tZJcBCq979KAS0xIj2Ez5bVNH80887wFxoK04HllmF
 ttZDELWE0xcAzokLRwY9c+TB0uqnCtCFMVI+Bqxz5kR+SJFQYX23U7LfT
 ghG8Sw2lkhJRsMq/THky/BjdoDBrq3700Bc/1ESzHKl0qEagK09y7ZSg4
 pTYRdSW/EWk34kiyppBAo3yYd6qioqi6lWvKFf0CmIJZwDiyRGv50IeSK
 hmslpi6J6lB20fChqgJIdquKrBvdjBtIeocHHBDiqQQmEsuJffVqH7KT3 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="6042736"
X-IronPort-AV: E=Sophos;i="6.04,232,1695711600"; 
   d="scan'208";a="6042736"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 13:14:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="797356800"
X-IronPort-AV: E=Sophos;i="6.04,232,1695711600"; d="scan'208";a="797356800"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Nov 2023 13:14:19 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 27 Nov 2023 13:14:19 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 27 Nov 2023 13:14:19 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 27 Nov 2023 13:14:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IBBE03I/LodrV4/dpsMmQkT1i3C761lV/qPG2B+bwv+OsMpEadLrQ30JgS0XeBU546pp/IRYby97vb0J33nmlD1Lekci1ZJmH9huVl9Q38BBEJ4K91Q7psEof4/wcYdGWoGTskjRYBMNQed9OMO1ThI/PzUOK0/iEwgTJW0zJEo0HPpRc0i79dAwhRQ21dO8uwF8ZPYRlS7S8yOwge8S6vrj0CGY5noAPvbGDUEC/ZMfWCIYJ1+jGGEz6w1glzaRejaczd6DTLf6QTTrQ+H/JrscG+197NXJO7hF5+1EOiOKRL5cc2CL8Q7bEoBMTtybzCNZSvqvi56HLRVGLHu6Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7HAM/YcrqUkvtny6uNXRXETyMebct+bieZ5nYyWqXdk=;
 b=CzAvtgMW2wXQ+Krh1g+YTptS03aiPLHnvYh/4baFRpp6S4DIIIK5aBX5kvAPOTwRsSrtf210IQCYllVyloT4RMtQuoRy/ubm63IwKFxRbGetYnmMjvR2TE2IO7NxdsIAhEC4eA3csXhVCZgOIZjUzOv6KnBsAdKO0AQSJHb0Mm9/daAgZabXEyRuWfbrfpMGR9PaQceSCNyED17il5LjGREL2mLWiDTzuFDtgASQ7rMUBb90IJJFo3+gNQutgZKHXXh/oOmTNWJERriHq925Vcrmb4ZEneQowj3L+9nJU3mAwGCMk1LGwbdha2jinm62j5pJkZlhhK7oi1haGRw6sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SN7PR11MB6749.namprd11.prod.outlook.com (2603:10b6:806:267::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Mon, 27 Nov
 2023 21:14:16 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7025.022; Mon, 27 Nov 2023
 21:14:16 +0000
Date: Mon, 27 Nov 2023 13:14:14 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
Message-ID: <20231127211414.GI5757@mdroper-desk1.amr.corp.intel.com>
References: <20231127190332.4099519-2-matthew.d.roper@intel.com>
 <170111756376.56286.12271139830516445230@gjsousa-mobl2>
 <170111790033.56286.5224946588476203069@gjsousa-mobl2>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <170111790033.56286.5224946588476203069@gjsousa-mobl2>
X-ClientProxiedBy: BY5PR20CA0024.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::37) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SN7PR11MB6749:EE_
X-MS-Office365-Filtering-Correlation-Id: 68e7f911-c2f7-4df3-7c3a-08dbef8dd026
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xb5XmjlygyMhVBwuZa5hA3FH2QTd6HFHqfSKt8VKnUIlMZJ+5mP+nRSbZXbr8XmqpW+I24DL+VK7jyqfhqX3NZckQ4jgLBdtOKGIXcJxoIzucCTeLWS2ZPKYSJHEqPN4CGaezLRI4QfSYbRu8SQaspgUqd3R2Hl0rVtiEutdjSPMd+IjFP+gUExMz82e60PSyPIw/XFz5pbcBvs24LDj0fbtF+PpsIR1OFRdpqvLD0bPCNvjAq6XOBrBxzxLEl7vcthGHAX7cdCWoeKsBc1ASR8EKCEkU6s796Bv2FyE6R1WdtQxxBiUhiwh8/RQFNUWEo8GD02GxzjgCrXbcagauondeo476p3MWrj/Jr4SmL/GEcCyizpq/54PkWU0VlEj3qO1getN97Ez+lHUikfxWMlpbbE+P4Z5t6XBeZytGqeWMaetrRC5lq3T5cOH6J6Ac/C1E+qSQO5iSvFXCUK4RAzM6YVBF2Up7jHIH7VGa2iIpjZOpvXMezQP6OVTOUeiBXdcHEcxq86X3DgKLpWb97pgUmbvMrHcYjMbePj3E2rUbzVLHdIAwWVAgHQ96nPB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(346002)(396003)(136003)(376002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(8676002)(4326008)(6862004)(8936002)(6512007)(6506007)(6636002)(66556008)(66946007)(66476007)(316002)(6486002)(478600001)(33656002)(38100700002)(41300700001)(1076003)(4001150100001)(86362001)(26005)(2906002)(83380400001)(82960400001)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aK0rhpLzq2GMulJeLkEAyhckOcB8qIRB+QF7NOh/Mvv1KE82KAmfBGzAonIG?=
 =?us-ascii?Q?UuoogyJzqfXpiXL4VvLgtkbd8qYexML8Eq836NcQUjhh0MRVN0a4YX/nsRkh?=
 =?us-ascii?Q?Yk7cjzR/KNLyZyURu9pkKlNLvFcSFf7+FoZiUUQIEUGzfnip1vxFgjV+ZUtS?=
 =?us-ascii?Q?tUVWtW1s8FaYFy5XKGDvAu5a/bj/1ODr4iO0P4lEezn7/YXb86dKBJbvYuko?=
 =?us-ascii?Q?8zLc/SwQwg7ZUMo9O1KD35TqXEkWp3h4mYE2J0GHRtfE+7+CQYonI5yZ3VNw?=
 =?us-ascii?Q?nQGqipQxF0cyfKbtgwkRgP5VS6rDXBnZpzHqhPUP2G8ipDnmgFxdOqXrMKtj?=
 =?us-ascii?Q?OkbzTFBjLdCEyqTxHRFPOGBpxsh+OOmuiAKOHNNIMIN1eUfN1c45ltDYvbPj?=
 =?us-ascii?Q?8OIW6cW7JNQN2b/V0yw4zY2rP79JpqngWOjD4852scJcO+FFVq8nQ/It40/Q?=
 =?us-ascii?Q?Bq1T5yVVjySYyKGNB2tAUOrBf/nDhKW+2YQGwRIhXbSco3BuSntmyfRz9wcY?=
 =?us-ascii?Q?ox3Giryq2QzTUZEQGlj1HvQaxAFLmiPJ8X0sqmMJSvSBY0BL2hSmjotq5XFQ?=
 =?us-ascii?Q?kkkRNhkkSa1eg++PhwJoj9JppEo5gxiXLx8sffa3iFeTXX+TB2NYcPbHka50?=
 =?us-ascii?Q?9WfEHX7cwhpTg7Zd69djRbHA2p/t5iDMfyxdPtS4xSDUiBrZWfP2HdV0cEd0?=
 =?us-ascii?Q?EjMy9yGi7am1AlGYUZcXFqOzIpzgIosFLlrOJqKN5DKJ3b54S6/hOEI2wexQ?=
 =?us-ascii?Q?daZmfvpFsnP0TSch7HxkHICbEKED14ZD4xpbfCQkVtHaw2yvG7LhPQ0imkeC?=
 =?us-ascii?Q?Y7Ae9ylWI6uiOQnfrsJErNnLIs9QKYTmTSdCTxbOaWsGlzrsUtTkhvKtWjeD?=
 =?us-ascii?Q?KwycNntutxNO8zTA70JqlUK8N2HBYpEKr8AWxL5u6+nJZHydd40rL5r2ucjE?=
 =?us-ascii?Q?p7xHx04QvZZpWLurM2851JX1TCNqFluU0qjmfQ1wLcZjTxKujvQtiESamyeu?=
 =?us-ascii?Q?t0o1DI8jybLoYX3FW0JwQ3vW3cXufEvi8zDysb/g6oeFl88mwp8Qm4oK0Gun?=
 =?us-ascii?Q?8lfoR/ee+FfMJtJnv1NL/1MuikuSlrg0R7dCXFR2V1fFmvSAJzDOvY4gLdkW?=
 =?us-ascii?Q?R40lAULraLQ87RFWj6uXB8uKA/ZV+or4bxAANZq+a7ecyR58hZfGZWlDWnqe?=
 =?us-ascii?Q?JoGigZSv+bjLKhK6Gc96lf+vLOx4dmN8QzGNuou7zkSY7wFc8Q1FchAhiN0U?=
 =?us-ascii?Q?xI1J2O2x7moszmqYjtdmjVYC8cYtyzag0by6Ox/pHYolr6scqBp1YmPWMI5s?=
 =?us-ascii?Q?2M+qCENA6sPCzgN0ncTX5+2eLmBjUf9Yjl5IxQYdIPFGZrWMamxbW0geKxKX?=
 =?us-ascii?Q?2CLmtDR3d+fKOFnFBhTkrTdqP/qsNbV5BAptpZqHI6UFltwbwpkep1EyDQvk?=
 =?us-ascii?Q?4SFonQmM3FfIIwGf5gBFj/BbLp6HHRaUyxbp4esRGf92VqJr/Jd2Fy+/k26N?=
 =?us-ascii?Q?B9qfZEVF5MMk/VdKj3c1A2PGs2G3LBXDp6bdpK4JbAlDSkB8NG6htxRwTGfw?=
 =?us-ascii?Q?UnbQVk/CmWREHZuNmv17UkGlvAkTufBfdoXkknEhvf8upDOfZpziZ2PBHNvv?=
 =?us-ascii?Q?ZA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 68e7f911-c2f7-4df3-7c3a-08dbef8dd026
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2023 21:14:16.5900 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: utZFx2xWiPVGoI1EuecmZK3P1FH2z2iNIWaUPebtv3TYiLBTAKtu7knoDnhimJK4F7fneMAa/y1n9oUUemn/0IE6DlltYq3MzdFjqR+OlBQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6749
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

On Mon, Nov 27, 2023 at 05:45:00PM -0300, Gustavo Sousa wrote:
> Quoting Gustavo Sousa (2023-11-27 17:39:23-03:00)
> >Quoting Matt Roper (2023-11-27 16:03:33-03:00)
> >>The workaround database has been updated to drop this workaround for all
> >>DG2 variants.
> >>
> >>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> >>---
> >> drivers/gpu/drm/xe/xe_wa.c | 21 ---------------------
> >> 1 file changed, 21 deletions(-)
> >>
> >>diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> >>index 81ae0232146e..e0853ab30c00 100644
> >>--- a/drivers/gpu/drm/xe/xe_wa.c
> >>+++ b/drivers/gpu/drm/xe/xe_wa.c
> >>@@ -522,27 +522,6 @@ static const struct xe_rtp_entry_sr engine_was[] = {
> >>           XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN7,
> >>                              DG2_DISABLE_ROUND_ENABLE_ALLOW_FOR_SSLA))
> >>         },
> >>-        { XE_RTP_NAME("22014600077"),
> >>-          XE_RTP_RULES(SUBPLATFORM(DG2, G11), GRAPHICS_STEP(B0, FOREVER),
> >>-                       ENGINE_CLASS(RENDER)),
> >>-          XE_RTP_ACTIONS(SET(CACHE_MODE_SS,
> >>-                             ENABLE_EU_COUNT_FOR_TDL_FLUSH,
> >
> >ENABLE_EU_COUNT_FOR_TDL_FLUSH gets unused after this change. With the removal of
> 
> Hm, after reviewing the i915 version of this patch... Looks like we are missing
> some workarounds from Xe_LPG?

Not really; we're just intentionally not implementing pre-production
workarounds on Xe for pre-Xe2 platforms.  We'll be removing those A-step
workarounds for MTL from i915 pretty soon as well.


Matt

> 
> --
> Gustavo Sousa
> 
> >its definition,
> >
> >Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
> >
> >>-                             /*
> >>-                              * Wa_14012342262 write-only reg, so skip
> >>-                              * verification
> >>-                              */
> >>-                             .read_mask = 0))
> >>-        },
> >>-        { XE_RTP_NAME("22014600077"),
> >>-          XE_RTP_RULES(SUBPLATFORM(DG2, G10), ENGINE_CLASS(RENDER)),
> >>-          XE_RTP_ACTIONS(SET(CACHE_MODE_SS,
> >>-                             ENABLE_EU_COUNT_FOR_TDL_FLUSH,
> >>-                             /*
> >>-                              * Wa_14012342262 write-only reg, so skip
> >>-                              * verification
> >>-                              */
> >>-                             .read_mask = 0))
> >>-        },
> >>         { XE_RTP_NAME("14015150844"),
> >>           XE_RTP_RULES(PLATFORM(DG2), FUNC(xe_rtp_match_first_render_or_compute)),
> >>           XE_RTP_ACTIONS(SET(XEHP_HDC_CHICKEN0, DIS_ATOMIC_CHAINING_TYPED_WRITES,
> >>-- 
> >>2.41.0
> >>

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
