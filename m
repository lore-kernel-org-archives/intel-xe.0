Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D087810F9306
	for <intel-xe@archiver.kernel.org>; Tue, 31 Mar 2026 22:22:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AC2F10E1AA;
	Tue, 31 Mar 2026 22:22:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WgX/n23u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95C5010E1AA
 for <intel-xe@lists.freedesktop.org>; Tue, 31 Mar 2026 22:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774995730; x=1806531730;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ZQ1N6iChDUmclx+AlDLivC+zedxnJDx9xJRBiLHUKtY=;
 b=WgX/n23ueIfcul5gGP+v9/jpq/VOuoxi/2SVtYJYNiCKcc8/Lfvb+bki
 nWzQcTMz0cMRDzsCLc2SP4Y1folKMktVeZccDf9HK156vbaxG6O28Z3+q
 2gHH41QThTFDdng8b6csUx574j0ne4paZnMg0LgDDe8K56gM8zrjvzgEz
 aD4tF3d82Dy7TfngImTel+XDGROWGRVRhXP1bhD5huca1miy7M8jVeHSN
 vDMsnBChRMBfWn9qa35H8zJ1V0GmtvCUDEyO7IAcrqOH55aCIFiE4i95O
 ASRezcjq2ROdfSikHOmG9/dT0+of087TNlCCWGIMMAp3IPMo1aQScc0Ej A==;
X-CSE-ConnectionGUID: soYlsAUgROC6rq2EHdPh1Q==
X-CSE-MsgGUID: CGpEXen4SjGRfhGF+kzmYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="75740048"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="75740048"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 15:22:09 -0700
X-CSE-ConnectionGUID: nudjZQllQ0aQ+z+uw2v++g==
X-CSE-MsgGUID: 8nY6HC6QSMOrxacicVWhJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="230921685"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 15:22:09 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 31 Mar 2026 15:22:08 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 31 Mar 2026 15:22:08 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.35) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 31 Mar 2026 15:22:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PvQPf5g0Iv3iuqbfekB0EPwwbF3DRaxS6XQhpA3jv9uCphhvZlVxvcJ5jEZmGMTQWpw4fNLF5jkDkf9iL7efv7zC4R/g/ZN1J9OjSBsfb6XM8YNksHd8Vw8PQgqUNNRCZGJeReVzg2dcplFSSDAfLljyVlrRpyIOYXs1s9RTlpM4a9n/DHQyccN5q15iJx0z0gEERFiTtAqnPl8n8mxS+MwtiAIx49AUEUL41ru1uUeyW8sQfn+tZeeIcK8DTB7GY8nh2QqrMEZqDNUOBYo3Y6RXpZZMcw2IyOA9DOhEt5Ry0SX1CEtfhp8uadz+bnPGvS0ICAM1x/R1dagshDTdyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D3VF73IFz/gm3jlaZ0g5BRtA6TG1tHP4D9aSk9qCRhk=;
 b=dDHYbafAev1jnDEi5MUUtzLEkut1GZX05bqVEzSaaclLZ7LJjjv+iOGxjh9/QyNb04PAsXU5UKvF7yR4gtUDGwSNMHOYexL5415zWO/hTWhTQ9NbjfvfTHqpFR6QwHiHYJxqBF11zw9LpIwn/QcUG/mnlerbIQ5EUS7xQ+xG5A8WDE7FRmrSIMFO9yPwHzwJTpg4yJfXJKRReaCHVl7WbwJk+Yd8Go3wDMg/qo8m54zaitWnyU6JVS54vzR0337WMKdsvkmHTkKngqUCZQ6zaKnxRSHYvC7DIJ+9b4hj8NxD4qD7q53l9FJGIxawzMM99isW4Yx9HJjbVZ64RNL2+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH7PR11MB7552.namprd11.prod.outlook.com (2603:10b6:510:26a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.16; Tue, 31 Mar
 2026 22:22:06 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9769.014; Tue, 31 Mar 2026
 22:22:06 +0000
Date: Tue, 31 Mar 2026 15:22:03 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Nitin Gote <nitin.r.gote@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <tejas.upadhyay@intel.com>
Subject: Re: [PATCH] drm/xe: Add Wa_14026626235
Message-ID: <20260331222203.GE183713@mdroper-desk1.amr.corp.intel.com>
References: <20260327080719.2136248-2-nitin.r.gote@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260327080719.2136248-2-nitin.r.gote@intel.com>
X-ClientProxiedBy: BY5PR03CA0009.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::19) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH7PR11MB7552:EE_
X-MS-Office365-Filtering-Correlation-Id: b1280da2-c319-43ec-4df5-08de8f73f10b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: sGL6iGW2QhLfK1ZdBl1Tf//jX8TD5MRONcBN++TDoq9RLPOXPWsNCG9QJ7G+Uo+hph8+Xf4hUo0zKuLO6sLfy0NgbsoxkeX9JIUTkwQbXIAg9eEEoZ+HSf8TcIBPLhBdpQoUHOC5gPa7qJej+P9cmla00an8euSyxOw0JroBxVmh3qsQgy49NoswD+o9tulsfGvxoDUjx+0ZmQuRbvVeDB33jxgUU79IRvXbTjJn0vsjFdE9VYeod+TEBaffWrw61vfuoWjYeZ9sqe5KaVcpaeDeIl+S60zbFp716tovf3y6mXLAVNy33wuzVbogw0K7nwVWtek5TSRyqiwEuvwTmf+P0isUf/Uot1ckf5qMfhnMZbgQFBLxIwQMWOKItLtwR3wmalq71wAVKtjtTUzRbhI9Lynz+r0wuFNK8er7Ln7zwC77YdFgQFz5QvXsqK3ARJsaBC4cHl+JCtsZxICIkRQmdh1AEomIQq4MQSoerhlHL1hMXZWfyAHig7JkfuQVKiDVdXqI6zcASKMlhozSQgglrDR08c4jqOBROeodn2/Ku48YKIeLh0cOZe68xfI87aJwgVmg7hUkp+yg9X2opa7Z8h4lbB+5jCq8B7n54Q3SiV2kMwfM03VFBsmOF8uceEYQr/TDIxTUTe00EF/CAGmlli2Tg+GLIqWJQrPuEe8x0V8ocW1keLYW7RbK/68RfF7tj7HVZnIOP0TDDu6vmGt/4e3vttaxx2ksSqfQInM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?r9QdHYbrEyGrouc0BakhFx+5DXuCItwkAgxTVwLFx8aLxyi8ZiATCyqN7b0i?=
 =?us-ascii?Q?xR1faOxqJy6OQzFi6Nf6Cf4yDOdDQE9QSgBocNKA62ykcdzW6LkB+PymrWJ0?=
 =?us-ascii?Q?OEjydWhB7R5zodOvsqU1ZIVj2svsk0ka9USRyeoaRckY4c4bSGsoq5joeH4l?=
 =?us-ascii?Q?l6HkpGDGuuZevw7Htn8pWMURBVkddeO/dKwzXkS/mxuMQZGMra0e1YWEvO3O?=
 =?us-ascii?Q?Vrlf6nX2TU50k4YYvCGG0gHNPruCrYmGqtO7CAe0iZ7UBD7OI1/uQchBfb2D?=
 =?us-ascii?Q?78+PSQahiQEYrsKctIFFRqaWwgg6phlERElf0D4JghMTjAzlHSW163OAhjum?=
 =?us-ascii?Q?m2NQ8j/f90OfGA1L29fnkMoCpWe1Fmm8Scu65/MyzC6eBeA9dms5K7kWNULO?=
 =?us-ascii?Q?Dt5wIAZx+1Tu5fnNi5xsjoE4F9yePZdRWMErU2BuecUGxUy9s5wXe5AuM5Su?=
 =?us-ascii?Q?Z+AMtPz7XrYviywv8ngEzhme9AFvKFNtodQLIolYr2GRfyePsH58tmtavvYq?=
 =?us-ascii?Q?CdrEwXpYDKCJEkYdtvO479fEds2cs5+9XEKCPnnC8uwXqR2KJW3gF2A+Wejx?=
 =?us-ascii?Q?iQ8dt/nptdzEPMHMpaqtMA0dPgbnvT5bDEZDp2MYaoeDMalvLUJoXtJjFHev?=
 =?us-ascii?Q?MEvmGTyfh0vZn3IhmBY+OqnPGJku7cLwOx2JutLOgf+rUqIyIzYTxC7mWS/u?=
 =?us-ascii?Q?FuNl0UZV15IMOJOVC018wPHnkyiLZ21lygjNeWs3zz9z1A7s0PlNwDb/kQHJ?=
 =?us-ascii?Q?ZcD2IwJlGFQ/dzg/6rr3Wv0b/E92si3vYOG+GOpcNIHZm66GnUeuYc09tZKR?=
 =?us-ascii?Q?MUTR5vPKMoDFfbFsaUgAV0kKaPICR1wFiGklEPAjYHfLsYkKIIRezs5cxL4i?=
 =?us-ascii?Q?dEfmjhON9lByuwdzs1qU+qcjg3yXCZ1pdC4x7zon1t9d2jCWvXnA15iexdaD?=
 =?us-ascii?Q?8uhLO+qbHG87BmJsCKwl0U6P8wOkOotblSQsgLJ4FTkCCKtWkJSy0ruCUG2L?=
 =?us-ascii?Q?ibib8WFklqsDbrqJJSe6sEqb0jxHqFIkhIjNmtcDgGW+wC79mVKuQzyADlUt?=
 =?us-ascii?Q?XTftksqgh4ioMy/jZNPr2gj5bcWFws2EZSLnLMnBx4j4ydK3Glssf76PvFft?=
 =?us-ascii?Q?dxjYpop9AbZr8Un+B1IQekgXVmGvR21OsqSDidyO4vFBxJ8Z5vnjX8VRXWds?=
 =?us-ascii?Q?jqxOZUX/D8CGaSdwB5SvKagN2D7pqC5ix23WD+cZ5B9XYW21Xda2S6ZUh1ni?=
 =?us-ascii?Q?ePscs0xJnzAYUtSPi0nhkC1HMlIxvQuMc1QNaYS85FD0KTn/ZIcf7B5l/1XX?=
 =?us-ascii?Q?AEPDEfagBIvQZsZ4+jqcIxjP61U7mjEsRqOrJzGxIl887sANWJ0Zseay7aDI?=
 =?us-ascii?Q?ShQWA8U2U0nH/5+M4U/kOK6Amds0PmKYu+nZMxiqlcy0fYTCGsFmFw5Rdj8h?=
 =?us-ascii?Q?6J2gQUH+Vd1VZcXR0AgGThAP2eMJePIQCLcwKbU7t+mXshQAaWJeVKSxzW4K?=
 =?us-ascii?Q?ZXvNLCanGGtRm5IcmYBNnw53Yc9x2wOjHti4YS0hePXMUWqCwRMkeaguGQEA?=
 =?us-ascii?Q?APYK6KbWRdMP0AsWyXfbMj45F+ebnxmvZmUuZ4VvmyI9rcyRlPro3a5EgYan?=
 =?us-ascii?Q?RFwmo8IfA7lCxwWpMQcvkyBzS5OEzWQdIp272/6qtvrK91S5diY/P6GMjpd+?=
 =?us-ascii?Q?7Am31p6WsJEmgcsxqScQwSWeDvOTu2s2hemMZfHbhdmGcbM7SCkGh4M8um/I?=
 =?us-ascii?Q?0YKkdryybD8Rsr+udgsnTeryLOmiZmY=3D?=
X-Exchange-RoutingPolicyChecked: uoCp8Dq6olfOhXKdyn3m3gXeXIgs4OpqC45AmPG5gH23thBhP2YyPMN1g6UKMYs6eTAsOEp1m2+W2EFmIP/jh/t+sYIOS3YtU/N3HxOipPPU91/n+oTnGctVVgGoYWhfEHrXWb0f6JfYFUqXiGm577U4ylvIKCvBKjJcxKYdSEax6L36dlDURy3JB8u5J0zqLbPNOxOhCQF0drxQEf/as4nyIhzBwpWgvKrR+0BIEijdlbL1JW9Lt4Js5YM2ycO62VAQWi39xbFIkBEyvrElCvJMBLXlNbk91STR0Qjv7tjhefoQFrAQsiJsaAeh44Q+zcfsOBo3OHfGFRhKZQxrlA==
X-MS-Exchange-CrossTenant-Network-Message-Id: b1280da2-c319-43ec-4df5-08de8f73f10b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 22:22:06.2284 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sn971hPnUtVrAO8Q7tST8KOybiKYZoHD1I4yut2M5a18/fY/egLFEpCjuv6x0+ZN7uFT4zhshmOguiDXXEE1YDLi+FxK75S4n2f6di/EPg8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7552
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

On Fri, Mar 27, 2026 at 01:37:20PM +0530, Nitin Gote wrote:
> Wa_14026626235 requires two changes for graphics version 35.10:
> 
> 1. Clear bit 6 (9th on state change mode) of PSS_CHICKEN (0x7044) via
>    an LRC workaround applied per render context.
> 
> 2. Disable preemption for the render engine by setting the GuC
>    preemption timeout to 0. This prevents the HW from halting in the
>    middle of a 3DPRIMITIVE command and inserting a flush.

Are you sure this is what the workaround is asking for?  There are
various hardware chicken bits that specifically disable various levels
of preemption in hardware; I think that's what we're supposed to be
doing here (it seems like an oversight that they forgot to give the
specific register(s) for that in the workaround database details).

It sounds like the concern here is about preemption happening in the
middle of a 3DPRIMITIVE instruction, which I believe is referred to as
either "object-level preemption" or "mid-command preemption."  Allowing
coarser-grained preemption such as "command-level preemption" (aka
"mid-batch preemption") and such should be fine based on my
understanding.

I believe it's also possible for userspace to suppress preemption over
critical regions by placing MI_ARB_ON_OFF instructions in their
batchbuffers, so the current workaround description is leaving things
a bit ambiguous about exactly who is responsible for this step, or
exactly what the expectations are.


Matt

> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
>  drivers/gpu/drm/xe/xe_guc_submit.c   | 8 ++++++++
>  drivers/gpu/drm/xe/xe_wa.c           | 4 ++++
>  drivers/gpu/drm/xe/xe_wa_oob.rules   | 1 +
>  4 files changed, 14 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 4ebaa0888a43..db45d7908ebb 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -167,6 +167,7 @@
>  
>  #define XEHP_PSS_CHICKEN			XE_REG_MCR(0x7044, XE_REG_OPTION_MASKED)
>  #define   FLSH_IGNORES_PSD			REG_BIT(10)
> +#define   PSS_CHICKEN_9TH_ON_STATE_CHANGE	REG_BIT(6)
>  #define   FD_END_COLLECT			REG_BIT(5)
>  
>  #define SC_INSTDONE				XE_REG(0x7100)
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index a145234f662b..d2bb574d422b 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -12,6 +12,8 @@
>  
>  #include <drm/drm_managed.h>
>  
> +#include <generated/xe_wa_oob.h>
> +
>  #include "abi/guc_actions_abi.h"
>  #include "abi/guc_actions_slpc_abi.h"
>  #include "abi/guc_klvs_abi.h"
> @@ -44,6 +46,7 @@
>  #include "xe_trace.h"
>  #include "xe_uc_fw.h"
>  #include "xe_vm.h"
> +#include "xe_wa.h"
>  
>  #define XE_GUC_EXEC_QUEUE_CGP_CONTEXT_ERROR_LEN		6
>  
> @@ -531,6 +534,11 @@ static void init_policies(struct xe_guc *guc, struct xe_exec_queue *q)
>  	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q) &&
>  		     !xe_exec_queue_is_multi_queue_secondary(q));
>  
> +	/* Wa_14026626235: Disable preemption for render engine */
> +	if (q->class == XE_ENGINE_CLASS_RENDER &&
> +	    XE_GT_WA(q->gt, 14026626235))
> +		preempt_timeout_us = 0;
> +
>  	if (q->flags & EXEC_QUEUE_FLAG_LOW_LATENCY)
>  		slpc_exec_queue_freq_req |= SLPC_CTX_FREQ_REQ_IS_COMPUTE;
>  
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 546296f0220b..fe9ca153b33d 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -789,6 +789,10 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
>  		       ENGINE_CLASS(RENDER)),
>  	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_1, DIS_CLIP_NEGATIVE_BOUNDING_BOX))
>  	},
> +	{ XE_RTP_NAME("14026626235"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(3510), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(CLR(XEHP_PSS_CHICKEN, PSS_CHICKEN_9TH_ON_STATE_CHANGE))
> +	},
>  };
>  
>  static __maybe_unused const struct xe_rtp_entry oob_was[] = {
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 80b54b195f20..3f2582568171 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -58,3 +58,4 @@
>  
>  14025883347	MEDIA_VERSION_RANGE(1301, 3503)
>  		GRAPHICS_VERSION_RANGE(2004, 3005)
> +14026626235	GRAPHICS_VERSION(3510)
> -- 
> 2.50.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
