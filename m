Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54A66E7717D
	for <intel-xe@archiver.kernel.org>; Thu, 12 Dec 2024 03:10:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 219B310E059;
	Thu, 12 Dec 2024 03:10:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ik/G2IJE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B488010E059
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Dec 2024 03:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733973032; x=1765509032;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=X7kKXQE8XiCf6zUX/xrcG+U1L6JojD1uQwMcxNz0vuc=;
 b=Ik/G2IJEJ2f7O5eF6BYF/Hb1aC7yCWyyo3rWdrCmMZQZceuM74Evd9Uz
 njSNmTpQ58+ha0aKoiAMWij1H/b1QVuSVOAv7tRSHhEleYFycmUKEYWzG
 ew9x8zwb40/gZVuHQbrEGC8nnLfQn1vHidILpF8TgEoPmlKdSAkquFs3M
 hu4JXzGkI2RfN+K7bjgCrTIsp/sNEye+he01u4dB+vWHyHcb3zj5MbC36
 FvyY0282I83OPvMNGtb6VKC1SDAVXqqUgq09M8fSkknZnt+3JXWcOEIyt
 pcW1nJaaEyPzYCwLr8dl8Jj3aVaT5oiKSnEWEOGX293sorJf1eGtChenP A==;
X-CSE-ConnectionGUID: SlGSYHRAQKunuHE0+1E7oA==
X-CSE-MsgGUID: Li9BwechTDuEm/vIqOWKUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="45387579"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="45387579"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 19:10:31 -0800
X-CSE-ConnectionGUID: DxvIkjHrQ6eT5JHJfTDqMw==
X-CSE-MsgGUID: uPImPvoTTwqyrg3nX3CsAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; d="scan'208";a="95838295"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2024 19:10:31 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Dec 2024 19:10:30 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Dec 2024 19:10:30 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Dec 2024 19:10:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tB8bnaHSWTNkfK6DN5bsAN6eJwxqv7uANohSZnYo6OkMVDmSiKvthiFJ5nEaraYQohW6IrS2yL6HjIiPEwp0i9sz6GzEBDBFzzIrqgdA3IaC31GoXtUJBlb2RaLIQ5OqMsxxHXghJysPHDQ3+s0wCyfRPc8+HDrsCA7rmCTxpN/+JkNCQal3U772rnP9F9cB4+3FXTRiTZn1KpNj+dQGDrhi5+rc2/xwSnpzZbvLKTeb31KXac1e8gwYW/1MFlTexdTRdGa4X+wjHYctEttzdmqZu6iduqcLUTQOmMlZWpjsXJYTKm3b+AyIgUsi/e8v+x6azVDyxAFIxq8mUYOO8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P+k56a58szjuwXvUiF7dA7HZLTlqZ5NHjiI4KaRCrfE=;
 b=KJRX5A3qQoNdIokUMr29dtJN8Z78NjIzRzJTynnKx4nYN8GLxSyPPhyvVlkvK90L0+Wgns0mDynGEpJ3GLv0Yyxs1iuVTmHxnn1YGArINte7IwiCEDuFIEgLzLcSk3PSrahVljEW46z5gLgwb67djn+hA8IqdWAHgxCwAyKbJwN0zQHwP2LUhG5jyg21xEc6nHYih4+YzcCCtDtjuBJSGFpvDqeO7uIzOYdsQZWD8w+GRebwPheeZVPBjq9T4i2/ObDIgK5rsxHBkm2hzBUg6FbnnnKMvcxZJ1tQvZ2HEEL8RLGib3MLVUhv5+GkHys64gwkmB8kd+rm17R1aattwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by CY8PR11MB7779.namprd11.prod.outlook.com (2603:10b6:930:77::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Thu, 12 Dec
 2024 03:10:00 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%6]) with mapi id 15.20.8230.016; Thu, 12 Dec 2024
 03:10:00 +0000
Date: Wed, 11 Dec 2024 19:10:42 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 05/13] drm/xe/sa: Improve error message on init failure
Message-ID: <Z1pUMvssoDz7gmjQ@lstrano-desk.jf.intel.com>
References: <20241212010141.389-1-michal.wajdeczko@intel.com>
 <20241212010141.389-6-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241212010141.389-6-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BY5PR17CA0045.namprd17.prod.outlook.com
 (2603:10b6:a03:167::22) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|CY8PR11MB7779:EE_
X-MS-Office365-Filtering-Correlation-Id: 462da973-2fcb-4fc1-20f2-08dd1a5a770d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ONotjOyiwsubvRImvgFdzk51y7/bwaUiOU1phjnhRB4X8gzlAP03yx2fioMw?=
 =?us-ascii?Q?Z2JL7RtfuWPKp9e+2QZHQreyUOllFjt2uQPrNk/prMHIBdGI3wqhXuyLpFk2?=
 =?us-ascii?Q?SeI5VZhZ8aZJNzCNLw/99ICI0GTq/o6fQgYKqD+d35ZW31Q0fKDIoFHiTn5B?=
 =?us-ascii?Q?R1H0wC+IcDLqZ/5H1elOslzz5LZR5BXZHsS8zZc7UzKwoYRGTDBoYJDU1YWw?=
 =?us-ascii?Q?Nv6JsyL5ljMT0xggSVbke0/VtwzgYSAoTil2l95ow4YQCBPdNqNo07wEs6nE?=
 =?us-ascii?Q?MPJJFatu8QXrHGVjWl+DU22Tgru5XKKyHXIuMn12KiKHUkx6QR2+kgwi1/xL?=
 =?us-ascii?Q?Xr4TP2mmF7Z8hU9dQwqKiXrDsSkUAjfeuzes9r6sbuBg20Z3cJkhplqyeZp5?=
 =?us-ascii?Q?yUNVGqDDgLdNwoLPt1p5ON4YvY43fkSQOg22lNmhupGb8dKuhRJGLKbCx/rp?=
 =?us-ascii?Q?6hf1BrpgUDJpfrLxENtur/s0XnYvmD1VxvZJlWsyBM8IFZ+9HC7bFyiPCfRG?=
 =?us-ascii?Q?vC6HVbTRn2aPvfpeA7Ke2vtuj1OnXyd3C39Xefe00f5pXQb1CBRqEWQUVPfX?=
 =?us-ascii?Q?QIFNPKusUkLKB3QsTGV3HIcnBOPjbvRNQT/UQwquql7rXlB4jKJLbPpYzjcB?=
 =?us-ascii?Q?Xj8v+et4neC2W1fr23988CvgHRrLMnZ29CHgznUT14ctoHc9J0sNSikieWdJ?=
 =?us-ascii?Q?/HmE9jyh1FyGWRWHYfMQ2arNua3YYqrLLVDw+hISKn/nKm4Ag9V3JssFerwn?=
 =?us-ascii?Q?/9aYRAnefdArAhxoxQaQSrE38JPz4/GRiipHukR0NzfpS0XZXIAROF0VNiKD?=
 =?us-ascii?Q?PlC4/UEKC5KavWeNWmGH5zxH7wfEAb7y2B54Wv2j9Vaum6Tdd0DWQ3USoBnr?=
 =?us-ascii?Q?uEJeJuUevuw5okEsreW6Q2+qYmMsabRC+uiQlRY1hDcrfA0mfPNWbrlZZH6e?=
 =?us-ascii?Q?wI7WiWqF1abTjDMiNuCOe0lgNvHxoNzhM+jzPdJUB2HVyZ+q2C9/6T1I/RU0?=
 =?us-ascii?Q?Wlm20+QFxaL5nj7TrfKPWhPD/RNyIbe68kmxHao4AzQxKUiXm2IrmNJTh6cR?=
 =?us-ascii?Q?r8Clz3YB0lSTYKbI/RgAvDJXP0bvQCODzAL9U79wzdqshGmincjnaLut0Xra?=
 =?us-ascii?Q?EJ8WNeoP/vXrx6VP+sk4jJAjmraTsXHSWFx2I40URXb1WPgxdf8HPVaun0dH?=
 =?us-ascii?Q?37KKChrZpe4rHE0u0dLLpg50+UxdC1tLNuayzNzxoDioAl7lfRABtRIF2MD9?=
 =?us-ascii?Q?wbqRk4bo7J/6DZEKQhnxkjbH4LT+yAo9pXOaD4LF+t0id8LZRc4SFfgiV2nu?=
 =?us-ascii?Q?StKp8HLtxH97DcCCVq8yd4QNQR0LQrIEjFHk2dEKdR3G9g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?P6mzJHZ2HJc+hfXn8IEMOHEimNqp0jc7In8yhkbc8eHdnA4pq00LjoFwrxzK?=
 =?us-ascii?Q?OfjwIEJuQRSRcT73u2N/0/teTPVHyEqDhcweoCyt9iPMPeMycuw5hahaiEnh?=
 =?us-ascii?Q?KpxKy0R9XexXCbcPi+wJmNWBsVMx4Db6jMuJIF8JCLz/IqHVARFXNcs2ew6K?=
 =?us-ascii?Q?yWMyOq+yD9DMZzavLux/msvwxPQmA50VL8of2EUQhERw7bnkRSFQaO+V7blL?=
 =?us-ascii?Q?uRXN9kqUOoeHpHQWaMbyJNUgXeqWI/dUASUD59gHsxlOGoHzz0TjOhKgl2Oo?=
 =?us-ascii?Q?zqlBnPeY7qljonialmP/EVaDftyKMadkGRLBonN339+zeF00HOEIkogux/qh?=
 =?us-ascii?Q?n5BdH4E0ErAlBe1Xd3C95sREYUPpdmb5shBVEUBT8fNxqhJmZw9WlvYwTWBG?=
 =?us-ascii?Q?N9W3AuR8kHX0bQpSg7oZkPHcQQt5SgFoAvqzbGHmJd1CL0up/rceJoMtMhbR?=
 =?us-ascii?Q?+ZaLoYlNc2TQ1YRgSfxIEwl/5mbl2QeWj9LRZGFO5mo80NT0qed5stcw6Io+?=
 =?us-ascii?Q?yszN6o7UbnO2hUf+BsNhMyueT5RtI9gwRIo+b/zHpRjEfWwKa59bl5JENeSR?=
 =?us-ascii?Q?azFZd492cQK+6tgrL+yvltz3Kq9kKa33/b9FpB/oHDpCuFo3gp11y85YqHYB?=
 =?us-ascii?Q?e+/M3CGZAp/r1A1hLdAvCjZ9zq5b3cjkG2PmHoF+FteSdIDKGxCoks6mfH3j?=
 =?us-ascii?Q?g7TOfsm9m6RgPSX6JjuBNXShE0e3P7D3Nu9pYlfJOSa2MWRi4ycVaE6+iHVQ?=
 =?us-ascii?Q?+mYXZGWf9UAY9o67NZL575OlXtOFCo2pKoYUag6kyPNtrB10NLzocS2jtc0l?=
 =?us-ascii?Q?iX1cOAghn2ybS4/Z7m8ThY/+ydti4kCyA2Bf0U2nNchU1LNPkYOL7rF0poPQ?=
 =?us-ascii?Q?5SzBcvzmqGVfkw+nGC8DgW60TBWDIJY8e6LzLO0YjT410fAKY2zaiZCcziCN?=
 =?us-ascii?Q?TcW5jTDlYkMlU3s44iIOzUiRh5Uo1emPDLtXOhgo/y7jkUafUPpoGL0DmU/W?=
 =?us-ascii?Q?0L9nBQQxAjf+JvBIRuc8DalW6oHieUDdHZCnauvVHl3PxVFlm+13JZAdRVmb?=
 =?us-ascii?Q?s2yH/4yuszZEgBIimEeR13HtF+OZ3wadRlI3MNgBTE5STsK9ReVn8H6bZ4/0?=
 =?us-ascii?Q?0x0VmpgN8+umw+Cq8OLACwYxBx1iv3ofg9Nvhgel1pjJADAciDe0pze5R+ls?=
 =?us-ascii?Q?lyZMCTN2h6L7fQDTZkyGTZUSACcIVBaKjJhhvkN9nUeQh/NBShBIH1Znvxiz?=
 =?us-ascii?Q?2HHmNpk/wTmoEkG9rNiZd0V43HeK+LPotDcVPkdEDFSipUQwoB7h/iZpSjQ3?=
 =?us-ascii?Q?sz39EhLhB4HN8jjP5W9zXvQICsPC/xRR/p9LmfcvCe/ZfmwefwFyGce2VEJf?=
 =?us-ascii?Q?EWLvr36GrAKqGNm+BuKNJudEcY6XLvjr/fSnJbgnLMfTebmX0gLti7MdWedq?=
 =?us-ascii?Q?lkSLFcsRdZUT7PPu8dmjY24AxbwKIgyWwdOEr0XLh86Ale4dk05DISJGmhTE?=
 =?us-ascii?Q?/RO1efN0hzAOa73smG+SE+aN6GTpRLApBXFSTFplY6IK9qailLN4oLs5oT1t?=
 =?us-ascii?Q?c7LGHnJAyz9WHUHGoyRlvnAkyrHJbbpNo6AGxQOjeynNgKar6KxgtdcBYgae?=
 =?us-ascii?Q?lQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 462da973-2fcb-4fc1-20f2-08dd1a5a770d
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 03:10:00.5605 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7/HHsaaZWMz6nHbzrRLYczg/f51nE7pUE6KbtGlqjUWMxi+7aI5oX1FQvP70pDt8kZOVLSLoRrim46/j+pFsRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7779
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

On Thu, Dec 12, 2024 at 02:01:33AM +0100, Michal Wajdeczko wrote:
> Instead of raw errno value we can print friendly error code and
> also print size of the buffer object that we fail to prepare.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_sa.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
> index b990bd8a49fd..94d22371af84 100644
> --- a/drivers/gpu/drm/xe/xe_sa.c
> +++ b/drivers/gpu/drm/xe/xe_sa.c
> @@ -50,8 +50,8 @@ struct xe_sa_manager *xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32
>  					  XE_BO_FLAG_GGTT |
>  					  XE_BO_FLAG_GGTT_INVALIDATE);
>  	if (IS_ERR(bo)) {
> -		drm_err(&xe->drm, "failed to allocate bo for sa manager: %ld\n",
> -			PTR_ERR(bo));
> +		drm_err(&xe->drm, "Failed to prepare %uKiB BO for SA manager (%pe)\n",
> +			size / SZ_1K, bo);
>  		return ERR_CAST(bo);
>  	}
>  	sa_manager->bo = bo;
> -- 
> 2.47.1
> 
