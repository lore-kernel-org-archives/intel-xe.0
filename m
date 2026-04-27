Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E188EFF8868
	for <intel-xe@archiver.kernel.org>; Mon, 27 Apr 2026 16:47:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A530110E813;
	Mon, 27 Apr 2026 16:47:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m1SF8xaR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84F8810E813
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Apr 2026 16:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777308426; x=1808844426;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YGEb57BKOyFahb+DoudHBMLs8zdl5y+MClh2bFeyGOQ=;
 b=m1SF8xaRcooi5g8xx3kB8SFt70wyDAMtwnV1LZawQJ7TypbVE25AwquV
 DPIuyturGrH5LwNneAGZpdiEzFxHX9q3gR4enb7zL9IKr3xkRptqdZCyR
 gJ47Syr6ZBaUfbzTKavHE7kzrG2NJfG3XqRXypd+/UglOsrO9HMMJbwyz
 rGtdRB/oGxM9dO1GtH75bk1Y7v1z5b2jbYzzSMytMkQovW5O3LnTJr7hX
 9CHcmDiXT/EPRfr5k2x4yozfbJee0G8D6YEP+qyBLXoOFHXZoIpMzocck
 +M/EZbAlKwr2yTcrhbBzkytSN75dqwaXhT5MPjP06H+Dw3CJlwT86Lp+y g==;
X-CSE-ConnectionGUID: PgXIwueiTfCKvDb8UEh/LA==
X-CSE-MsgGUID: n+lkVYrxRFCS2W0thOcuLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="77909289"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="77909289"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 09:47:06 -0700
X-CSE-ConnectionGUID: fps7tV+QRI+7kjvGqe/uSA==
X-CSE-MsgGUID: GOXylbK6TcGkaMwRgtb1Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="238723527"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 09:47:05 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 27 Apr 2026 09:47:04 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 27 Apr 2026 09:47:04 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.6) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 27 Apr 2026 09:47:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f9d0raY34BH/qtHVyoUpF/zpIxl0ORehFLAu2znEQrzbFyFxx1YrfUU2XdWL1ki2coJ3GYpLq9qe24S14yfJkZiBC2SkWrst7PeHr08AktHAgOnXlrXryMXiZiQgjJ6D1bhrziI2s4eXsLCiKaWt79EVdMyf0qCF452uaRpnAC5Fs9L/BdmC2Ip7YWGfDPsDnCoYsxWVw3zr93YTlpgVd2PNl9UONQEbF8kzwXahqG90b/teqedZic3AJoAllWyAE8IUQNN4FiFb11LFAPnBiRVeE2INprG+EzFiBJEvbWGNtp7hrefYCCZ3awdG1WulYXgayy/LnuwEJK4HRI3gGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xS+GedGhn3N+pnJCkfdGGOyCUA5ewlag4YxYgHzqeAU=;
 b=c/MqR3WkGyuAkqPdLiJW0vU4/KZP6Ely8kK3IB8wzeJH840wTZQz/6XvxCxryddlbcA/NQ1hltCS5qDyczCOmqQ7s/EUmSRKi8WlaXJNUP96RyIsShVeYHgR5ctqrlJkgsgF3mviEuFawvAvK+sDyHPxBYOrBHswdmcF4jUwDiXP4Mklacu9GcHwQZzf1CIuoVvsYxko4XL0fGzYngp2JlO0s1tUHGT77OFAa2tUBRlz03d3MI4lVGrLsazA2QnYlbFSLr/r7O0qWOFb1ZDRtW2OMBdIktxjauEYuBjBxSJZRNh3xYXfj3/6+P/HvU/48drokuNwOod9uDfjaZsCBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA2PR11MB4972.namprd11.prod.outlook.com (2603:10b6:806:fb::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Mon, 27 Apr
 2026 16:47:01 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9870.013; Mon, 27 Apr 2026
 16:47:01 +0000
Date: Mon, 27 Apr 2026 09:46:59 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 01/10] drm/xe: Move CCS enablement to engine setup RTP
Message-ID: <20260427164659.GH2131374@mdroper-desk1.amr.corp.intel.com>
References: <20260424-engine-setup-v2-0-59cc620a25f1@intel.com>
 <20260424-engine-setup-v2-1-59cc620a25f1@intel.com>
 <DM4PR11MB545671AE0E0F142BC6959768EA362@DM4PR11MB5456.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <DM4PR11MB545671AE0E0F142BC6959768EA362@DM4PR11MB5456.namprd11.prod.outlook.com>
X-ClientProxiedBy: BY5PR04CA0023.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::33) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA2PR11MB4972:EE_
X-MS-Office365-Filtering-Correlation-Id: cf7dc1ff-1d39-4820-ff66-08dea47c9ab3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: LJsiEtdobZTYJinX1MLszk02rhvYejCdwilFhEtup9H0wJm64uf2fDFX9NIjLn1LlgFddjMb2AMkV4DmeGYT8u79AmyLwjGVmdEHXj6vlbxF9XHoY2MJ2S6EJZ4Fwlo6j/95R7oXRwCHOkA786SovVMjBAl7GlE3N0xSRVajhQOxrhe60SPOOBoa0zKd6SNCUZ9RaTfj6FSzCvoe8aeoWsnvGclMlM0dMsJiK2jcwPnrC2nrTGqy5A8nnH1+kMT2JymcWMyHFCjNoSot4zFE9nHxjCx286GngHE+NArCYpELryokpxxkM1JFShjTVokqk9Mu8KhTqCs3MjSDDZXpbqtwnvnU8fSyk9noNUAQldrARGoEGiZy7y0FH+QOyLOmJR1TvcjBs6mSIJ0it1077YW83hHzUPe1pQjd1z6FnBYqrzz5fme0qEbZzsPSSGBt7hIyQ4nyjtX6+3vFkWqD0rx0nxqrBi+eBijrb2fLBE/6Ddrt3FQVpfeBMgWCSOoYFgKBar52c+efjwmwK/mncmkS4qN/xHBUXdvFI5QtR0/iPnFRHfKhinfJEA8HLkH6zthFM5ltdn3ml41zUINrP24/Sf6rOMbsDR2La270nSH07z7PJll/D2ZK57+M1QzrJxrDaax/CkZ5b/Ovnf77irIfIJe3JHZeXYIfFToe1BdqbTAQKsYJWYr6jLkfGs6kpo34/C10KzoKvpzBdoz4WglroXR8abuzIKadBdESRUc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MOtTbtbyjEpjg+m/nO+jqZqAnxVkO0O1k/198SaumpgZWQo9i93izVQFUfJj?=
 =?us-ascii?Q?t73Lh7AYn75ooEWPcmuLRfO3Tr+ZrdsZZ2dk9Xdctt8/dnTw4BfGL/SRjRUH?=
 =?us-ascii?Q?hSNYwqc101nC/jWCuzzXV4jR9rifj+nTnG9CU6Cm2AYMnWFEtpovYY4vLQz/?=
 =?us-ascii?Q?VkOIU+pEQls4RiZeeeu/w7zMI2UCJyMg7HjI0tKeO80RjqiqF/OxGdFVNmgX?=
 =?us-ascii?Q?VaBkNYTFE7ZD5kQMw/PZpriAQPEy3DQiBb3gCpfRiK/9BswmHK3N+Lz28iDM?=
 =?us-ascii?Q?iF9viqd0777OiRmwPiaGeloPZApORW9WKQcizQ2vrCX+yq/Ms1oB1zqnNfrJ?=
 =?us-ascii?Q?Tmij5LfFzIZUZ/n6vZ/gXq7M+1pBzRHLWacH9gVHdXQx7RDJbiGS2bidevNm?=
 =?us-ascii?Q?mfO34gWYE45TCGbNm9jN0Krm82sdws4ahd32NZL06qwXX9LVcVivx7vxfAs/?=
 =?us-ascii?Q?YE4y7SX5pkv9EgCQOxUPtza34TEvW+7vfIYEtNMfQ4b2+nXcKV4ENZgn4wty?=
 =?us-ascii?Q?+b7GhGkR2D1bIBKGQpRwJL1IzX0q9Qwz9sJFHw169tV8SHWJ2Ojz0t/o9IMt?=
 =?us-ascii?Q?J35ZFngTZ6K1RgrMKwv4HAJkOltKLBuesbCH6AtQA9TirQXKEYQXR5ifqf43?=
 =?us-ascii?Q?rd16Lfn7fpPT0/CTR8jcQvCfBZ5bMN4qQW0/KdTSLIUx6YHY5JwMPjsG5aF5?=
 =?us-ascii?Q?35cf0E8pj8DdoJ5CqGzUlQ+T/MW5uHAOD0oHvXiw87/4NtYzV4atyC/59otl?=
 =?us-ascii?Q?+rHYYSJVF5V9aWth6dinduYfkKFntkZwWRbAagpYAWDR0ryN9wU9c7PzPsUa?=
 =?us-ascii?Q?wCAJ2YgEYHpMZUrpO/975gzOkCi0MH2fCuLpK/PuMs/EXnWkgnUrKQO2TMfH?=
 =?us-ascii?Q?1RO9Y1grd95IfTrAtqklqYE6dbe3qi0TdtRiNFLZ5a/o56IjjkHxyVhxIrA+?=
 =?us-ascii?Q?JrG7x4oB13YUvEFa59a/lALgQnM0ljOmRv5sZ4xlwZTOwwndKAqCCERpDwAb?=
 =?us-ascii?Q?7upHJ1UECynUFOl4pmCP0t9/ED7Pd5vSYccrhuq6l2SagjqCT0gkuXU7Xo6W?=
 =?us-ascii?Q?xqme2yi2nMPdCTO6gEjd+qrtqFGHeeAmuVkgUr+uvrM1Qch/ViAUYSX2TaUo?=
 =?us-ascii?Q?Ov5dJaIVJnwz4pocov3VcUJyz2Vzf9LFbb7FNfKZEvJ7D0BCbdkpEjUrGM2e?=
 =?us-ascii?Q?B3EAbX65LblnTcNyGCObFFmFz35D7Cm4aVXjPC9mYsCxGQtvqm6uKV8GU8+r?=
 =?us-ascii?Q?fgS7kw74EPvJFxoZb1Mg8BdAnw8EYGqyhuXrcmxfLi0Ll8jJkRpAiPiQsx0h?=
 =?us-ascii?Q?pOqhszWpLsObUPAXQpDhsbZqwahLJBHMDbB9eIZ8wqW75JVfjaCrFzzT48QS?=
 =?us-ascii?Q?SxSjSWmyKGqKjOnjTYj+wB5uYXr3XbXS592ohctU7OQoboabNwxj9SP3ohWv?=
 =?us-ascii?Q?/fcutT3yemLiGz2tUWnHAffAt1i8ZzGQT8WOREemefgazqMbsFCu2WkKyFrG?=
 =?us-ascii?Q?rWQM3RytUKCvgk23035iuRHhDtmC3g97DLb7f0zeZ+umOY6+oLZvfNCe7aYx?=
 =?us-ascii?Q?+XiK/O+QHP0nnSz0weD2Qv/AMMyQSY6fsURKav/Cfh+kiPy3eM50UzifMs13?=
 =?us-ascii?Q?g5upKBqrrSjuGI7WhI3AkEU0chHhORQGzMvA+tE5H694JJ0RVJUXD91qlhWB?=
 =?us-ascii?Q?RGgXdZ+RlsPttYx1cdBcLJEK9OP4t5otlDgbzXurkNgzmHLRUuRyFjoOP3Nx?=
 =?us-ascii?Q?TIkvDxOuwHlkQlylmOmEchNn3+aglss=3D?=
X-Exchange-RoutingPolicyChecked: Zg8gvX/VBPys7JX/9JdvuCihP1SrHqBNjfLuNXQFMEOx8y/48hwRKMi8kiQfkx58jpLragvVQwCUAXkm+PoqUjFMpn2VYv8wKX3aYXNolkK4Q0iIh9stKuF301D268SJF0wwFFncFUOGM0vfxdMrdkhpxRIxMrm7wR1i5PBFZYyQJpeH0Z5bZB7y0CjIfYa8BE/cGNAe8MIBECdWe/v8E7JRBaE/4NhWlDMvGLg4b2g/8hP8BshoXncu4YNdzPbtkVrPLKVi1+ydSsZ/n7WD7zsHAJRs8EMQTWdO/CNLrA/1zOTXu3jxKDka2ulcz/33c1fgK3x1jNVl1T1uyNWEgQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: cf7dc1ff-1d39-4820-ff66-08dea47c9ab3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 16:47:01.3905 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qUHM8wVINHifj9lJPlxD8pyGMJqY2UMcvvfvLbo38EmaEjCktYplqY1YjXVS5geA0aGUhNpoPxT+nn6FX9JUMJs5ca43XiE/5zunMYS1s5s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4972
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

On Mon, Apr 27, 2026 at 09:30:10AM -0700, Lin, Shuicheng wrote:
> On Fri, Apr 24, 2026 1:48 PM Matt Roper wrote:
> > Most register programming for engine setup happens via RTP tables in
> > hw_engine_setup_default_state().  Move the programming of RCU_MODE[0]
> > which enables the platform's CCS engine(s) there.  This both makes the code
> > more consistent (other RCU_MODE register programming is already
> > happening in this RTP table) and improves debuggability (since RTP contents
> > and checks of their correct programming are exposed via debugfs).  It also
> > helps consolidate the regular driver initialization paths with the vestigial and
> > currently unused execlist (i.e., non-GuC) initialization.
> > 
> > With the original programming, the RCU_MODE register (which is a single
> > global register, not a per-engine register) was getting re-programmed with the
> > same value during the initialization of each CCS engine.  When moved to the
> > RTP table, we use the xe_rtp_match_first_render_or_compute
> > match function so that it will just be programmed once, while doing the
> > initialization for the first RCS/CCS engine, which avoids the redundant and
> > unnecessary repetition.
> > 
> > We can also safely drop the explicit addition of RCU_MODE from the GuC ADS
> > save-restore list now since all registers programmed via RTP tables are
> > automatically added to the GuC's list.
> > 
> > v2:
> >  - Only enable CCS engines on Xe_HP and later.  Even though Xe_LP
> >    platforms technically have a CCS engine, it's never been enabled on
> >    i915 or Xe due to other issues on these old platforms.
> > 
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_execlist.c  |  4 ----
> >  drivers/gpu/drm/xe/xe_guc_ads.c   |  1 -
> >  drivers/gpu/drm/xe/xe_hw_engine.c | 11 +++++------
> >  3 files changed, 5 insertions(+), 11 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_execlist.c
> > b/drivers/gpu/drm/xe/xe_execlist.c
> > index 1f8d358e60fd..026a1ec0c868 100644
> > --- a/drivers/gpu/drm/xe/xe_execlist.c
> > +++ b/drivers/gpu/drm/xe/xe_execlist.c
> > @@ -59,10 +59,6 @@ static void __start_lrc(struct xe_hw_engine *hwe,
> > struct xe_lrc *lrc,
> >  		lrc_desc |= FIELD_PREP(SW_CTX_ID, ctx_id);
> >  	}
> > 
> > -	if (hwe->class == XE_ENGINE_CLASS_COMPUTE)
> > -		xe_mmio_write32(mmio, RCU_MODE,
> > -
> > 	REG_MASKED_FIELD_ENABLE(RCU_MODE_CCS_ENABLE));
> > -
> >  	xe_lrc_write_ctx_reg(lrc, CTX_RING_TAIL, lrc->ring.tail);
> >  	lrc->ring.old_tail = lrc->ring.tail;
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c
> > b/drivers/gpu/drm/xe/xe_guc_ads.c index 92c6981fe220..d0497d9f43a2
> > 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> > @@ -748,7 +748,6 @@ static unsigned int guc_mmio_regset_write(struct
> > xe_guc_ads *ads,
> >  		{ .reg = RING_MODE(hwe->mmio_base),
> > 	},
> >  		{ .reg = RING_HWS_PGA(hwe->mmio_base),
> > 	},
> >  		{ .reg = RING_IMR(hwe->mmio_base),			},
> > -		{ .reg = RCU_MODE, .skip = hwe != hwe_rcs_reset_domain
> > 	},
> >  		{ .reg = CCS_MODE,
> >  		  .skip = hwe != hwe_rcs_reset_domain
> > || !xe_gt_ccs_mode_enabled(hwe->gt) },
> >  	};
> > diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c
> > b/drivers/gpu/drm/xe/xe_hw_engine.c
> > index 2f9c1c063f16..74f29025dd6c 100644
> > --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> > +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> > @@ -325,14 +325,8 @@ u32 xe_hw_engine_mmio_read32(struct
> > xe_hw_engine *hwe, struct xe_reg reg)
> > 
> >  void xe_hw_engine_enable_ring(struct xe_hw_engine *hwe)  {
> > -	u32 ccs_mask =
> > -		xe_hw_engine_mask_per_class(hwe->gt,
> > XE_ENGINE_CLASS_COMPUTE);
> >  	u32 ring_mode =
> > REG_MASKED_FIELD_ENABLE(GFX_DISABLE_LEGACY_MODE);
> > 
> > -	if (hwe->class == XE_ENGINE_CLASS_COMPUTE && ccs_mask)
> > -		xe_mmio_write32(&hwe->gt->mmio, RCU_MODE,
> > -
> > 	REG_MASKED_FIELD_ENABLE(RCU_MODE_CCS_ENABLE));
> > -
> >  	xe_hw_engine_mmio_write32(hwe, RING_HWSTAM(0), ~0x0);
> >  	xe_hw_engine_mmio_write32(hwe, RING_HWS_PGA(0),
> >  				  xe_bo_ggtt_addr(hwe->hwsp));
> > @@ -465,6 +459,11 @@ hw_engine_setup_default_state(struct
> > xe_hw_engine *hwe)
> >  		  XE_RTP_ACTIONS(SET(CSFE_CHICKEN1(0),
> > CS_PRIORITY_MEM_READ,
> >  				     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
> >  		},
> > +		{ XE_RTP_NAME("Enable CCS Engine(s)"),
> > +		  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1255,
> > XE_RTP_END_VERSION_UNDEFINED),
> > +			       FUNC(xe_rtp_match_first_render_or_compute)),
> 
> If ccs is disabled by configfs, will there be any side effect to program it?

That should be okay; the goal of configfs is to prevent the KMD from
actively working with the engine or exposing it to userspace.  Letting
the hardware itself consider the engine enabled should be fine since
that's no different from the RCS/BCS/VCS/etc engines that the hardware
always considers enabled, even if we choose to not work with them in the
KMD.


Matt

> 
> Other code LGTM.
> 
> Shuicheng
> 
> > +		  XE_RTP_ACTIONS(SET(RCU_MODE,
> > RCU_MODE_CCS_ENABLE))
> > +		},
> >  		/* Use Fixed slice CCS mode */
> >  		{ XE_RTP_NAME("RCU_MODE_FIXED_SLICE_CCS_MODE"),
> > 
> > XE_RTP_RULES(FUNC(xe_hw_engine_match_fixed_cslice_mode)),
> > 
> > --
> > 2.53.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
