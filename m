Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6577BF428CB
	for <intel-xe@archiver.kernel.org>; Wed, 15 Apr 2026 19:47:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDDB510E18F;
	Wed, 15 Apr 2026 19:47:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hDu/dExb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B85610E18F
 for <Intel-xe@lists.freedesktop.org>; Wed, 15 Apr 2026 19:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776282452; x=1807818452;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/GHWyQ9SnLwii5I7veo8kBFu7rsfL/caTvEXHnDyd2g=;
 b=hDu/dExbi1Og4eMqlarAxhHZoehnz2FDaFzhKOfot3UkpF2u3vJJzWlX
 91RNJ4C9tVJT1fGkhF9ya3OYj+vyoxnmpjdHEiL1AACEdsy5ixCNjjU5j
 mP3Hms1ykogjBifIwylgWWPrPAbVeQz8L2m6yoTuchtnNWe5BZWIeyVEo
 4XPekDubmtaU7DB7zRElf55syeXD085nh543hej7TJ83AZBPEQcszx6Br
 cNBuq2ZdO0yvmJ+AMXQZui8T0AFK6L4g8oWZa0RhLhxEG0Uj6gXNjJumw
 wWkKBvMY8YhYJu1fUmHGhEpjvkp/eeNDmgswmWORE7IAHFL9aApuICQn4 g==;
X-CSE-ConnectionGUID: bc5XGJ+aTN62tzpeRi//7g==
X-CSE-MsgGUID: kMmrx4tpReSN3u9C4T6NuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="94842001"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="94842001"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 12:47:31 -0700
X-CSE-ConnectionGUID: ortvMKbjRt6g1l7EyrPhWw==
X-CSE-MsgGUID: CM09W3LyTc61+X5YkWqeaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="230366114"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 12:47:31 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 15 Apr 2026 12:47:31 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 15 Apr 2026 12:47:31 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.23)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 15 Apr 2026 12:47:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PF7nO3bjStR9twOXRClb4dnFLytrj96m7lXcgF+cWkndE9dkTtZrsEqGE6ZIDkbeoqfv35iAcdE/1Afh3P7N77DyCUpp86n0LVM9QeUddOy8l4KWinKYxYn8Nv3Td4CCk8lcRgHi6D4iBF6U2ShJdrTwQSP8NEZoDKLD0LVc9GOcUno5UmZClimngVbfaEwx7qp+cKkMaE0ZLE4mpe9a7+J5WHKzRbM7LFdn8A/HLx7ug5MaC4G1NYFSUVrzOSLusTmvRW/wNYDnu09Z5LY99xXKttlDL0Xt1bqocIWQ+Z4kuiIiyiLEl3+TnwAeWuck0mJ+nLzAW+7VElb+Sxn2Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pbFT/bgBwpsSz8JP1braQjzNr3uIhvJ8uAbveWalYzM=;
 b=hAKSNYoEGaEQ6f5e3yAen5ftQVwqlzpZ4xtSpGNedxkRV/hxoxe1eWG7wQQe7YEcwIEB9KZG91n8L6UYjwzgP3fXueLYj/mH74ZQJaqiHNYSxGqvcHhoXmh7ipSeBUBtJTUx/X7B8nsUla5ZdekL4t5isRDKgF5St61/qP94ODPrtHZKPxUSjceeJJ2GXMMBaX1ofFVmeUNgIU8BLnL0Pg7+qrHyV7U717qz0lRGGVyk7CdnqjnZAjm4GYs3Sm7k+OrUkkKwOC/+PN1hwLxtJm63J5R4aSYtx2H1BV0ELXeo1sasOD7lPgIJPFwnGEl+aSg7HShYHrZXeTTmsAP7sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DSSPR11MB9644.namprd11.prod.outlook.com (2603:10b6:8:374::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Wed, 15 Apr
 2026 19:47:28 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9818.017; Wed, 15 Apr 2026
 19:47:28 +0000
Date: Wed, 15 Apr 2026 12:47:26 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Clint Taylor <clinton.a.taylor@intel.com>
CC: <Intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Apply WA_14026810691 to engine
Message-ID: <20260415194726.GD755471@mdroper-desk1.amr.corp.intel.com>
References: <20260413200825.4054940-1-clinton.a.taylor@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260413200825.4054940-1-clinton.a.taylor@intel.com>
X-ClientProxiedBy: BYAPR06CA0056.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::33) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DSSPR11MB9644:EE_
X-MS-Office365-Filtering-Correlation-Id: 0be42f60-f49a-469c-20b9-08de9b27d329
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: On+KKJzolS0r9XV4U5XlSnNnZypYn63bMLKhmVT0ks3t7De8V+pgOXIADP69KuqXvaI1JWgRSkRz9V/R3XxsVsdKW8KG5nvC6Itq+OknumY9PP9VudNZFKbu/hRHBZdpwZKYDOmK2MB2Retk0aynnCZB0F/CNCh8xcbQQm53mT4ha99NcCTgJUsnjzNvwONrEaL87orGa+7dNXtvlIsHUODFkMUQVbCr98D17LtjfngBpLIJmVMnwh53HGxCw98YU5xIbDbkvNPNhLXlG9kAzPKw9nqPqCgcIWikTvxGeLcA8Sm2L1BIcJ80sFQLg25nHPoIdAVn3AGtOiyK8IZMPO7AJXGQMNFcuPE6eXLKDvoShXC5FQXwOgrXTWJjvX8iF/G1mjbMlRyP/auz/6f1/xmfgDhEct5WJUY1CsbCUml/Xtr1tfki181/AknwrzcPvh4nEN2KprjstpcmUz3KmyuR6TbrvTIg4jI+0cr2O6UDm3ofFot0Uc7P7jqi71P8hE3Y+lowwGInIuxfzOBz7EMVY/dz83Q7d0EvAOnMcXY8NZXfBmTR/9Aq3ZJbtogw9oaUwPfpKWywosz/m0HE7grTs+fVVZLRbIkpXDWKHtVujeea63G2h2TyXatKnbfZUTxoLu4CoIa38sG3aVPLayx7EqaZB8eTVY9TL9Ol/F7CgWZ6qwq7Ymml2nBfzK3XmhuGGDeIjp59BUd0BExEaesYYi8pMap5zmm/iaCXSh0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Xmd/6Yoa4LnQL1UVdbi8/gnDkedznJbDagZzVVdf3rIM0pJGBFCf9J6tIEii?=
 =?us-ascii?Q?kWKwUzjuwQOLhHY9J3wng0jbpbXKye/APHJY9QL4qR2ZYE+Od81c9tLGPH9t?=
 =?us-ascii?Q?xijimZ4iY3PuS8+Ce4CGFcw+3nT94BC17Zh5o6ApMxHswJ64rPMWHEGlgFh+?=
 =?us-ascii?Q?u3jKjVMuO65mDru8YHv0K7V/753PnvBotMk/aYIPynfiadNaGj6E3VHsquVw?=
 =?us-ascii?Q?j3dRWv+So3irzOFg8937ci01nKLPi4iL2rPknTh+1fimtEdnwjyWQsPmL6vt?=
 =?us-ascii?Q?pfI7OGLCcFLmYv7evMOW/gQ+XWy0EpGsCOTmIM97Xg3EpGa9mVlxun3rviWh?=
 =?us-ascii?Q?ByJRxhn5h5rda9XBuTXvfPQYrBrrKY52cByMH67Wz3cF4Hub0X5EBtcDlu0k?=
 =?us-ascii?Q?XEyAEpwCKdiKQ4r+2laLTUSbPS+HuvPCqZXsHnRALmRhqoo1PlwGaNjdaL9b?=
 =?us-ascii?Q?aaGMGtduj3xGXdJa7jRC8Jx1ixZxQtzIdnB/Jn09t3imfT9LN5+zo132RMpM?=
 =?us-ascii?Q?Y5bMwxr2esmu1vPkKN0Egsfp3eFzEJ9FQOZWolG6ETSMHGrR7lZlmOIXfW2j?=
 =?us-ascii?Q?EpF+mCo1iZCDuW9qgC+E180pDMWr9q0XP0l2Li4krdx2V0eay37cMNudvdQ7?=
 =?us-ascii?Q?IPDfVMIyoLTpwD9ZgKu1HNGWklzxsfeT5Ubcso9oIb5GK0jYbKKCRYJy1FUo?=
 =?us-ascii?Q?8JdAlXyAongcOBWOXzp44z4dMrGo5wFL2RHUsHyXpXYM/i4TBcITmFUCmVcq?=
 =?us-ascii?Q?vFMPCWuVC6Gz4PBG8/hHej+ytAQ9wnpE3W5DaHAYFykdcof7Ew/SRTYuSUqZ?=
 =?us-ascii?Q?XpoQDvld5LsGsWNp6A4YaxMKj465wE++08smxNbxvhiSOgWyYvh28fwXKXa+?=
 =?us-ascii?Q?NGiGZP+VxQDVY2KS5WuSv8ftWceGPv+WBHqdh82P9cwuurt1SsOO/iwW40q1?=
 =?us-ascii?Q?M5mdZDCUh6brBq6ILtxj0aT99B8ZXiKi2Kypqr6ZNaCInHzJoEiQggPrp+xC?=
 =?us-ascii?Q?jAkeCcXE7jDVWjHyvt6ZO9fLOGqmbonSfUEn/FaeJTvikOcMPBj9jC342Pqb?=
 =?us-ascii?Q?HQgqoZ5Xc/tQSM2/9J4H/2G5wMCFaJiCU8gH54SN4daffONnBdepRoj8NGlS?=
 =?us-ascii?Q?vvEA5rp8YWhqRAh02UxgfeDymx0bE6v+DfHHjIBsYVHsskw4sBKov0cObEvI?=
 =?us-ascii?Q?2ZmZChDUjtMt6JJwIsE9YsTKY1j2St6R4QKqt4NWecHxby25aoFQq+z1clQ9?=
 =?us-ascii?Q?Jdbrr0MpqD0INHdf4ddwQGatkU/s2kjqMywxRvKJwypOj+FEQUMpDDf6qLJr?=
 =?us-ascii?Q?B/6YupgwUnmlci6zkAFqqNeyJcgOC5enIkEq2rjJL3q7VsMN1ZOMJbv3XyYL?=
 =?us-ascii?Q?q91zCa/edhUA91RPJWEwlKeOpCm7xPr8YEkz4350PbEQJQUxOpFmyd8lfF2D?=
 =?us-ascii?Q?Kc2xuZK2YxXkhaGkDaIRK4BFda8cTAdkvPmiTZ3qBNLsfNGTUUOjevSNIsNU?=
 =?us-ascii?Q?qEWdvED7hsStWKFCvuLivx0iKxpxrF9f6rKIN3qH5sBvknNUmO/mXEfoX1U5?=
 =?us-ascii?Q?wrh/gn9gDpPBp2Ph/xLdeu8iA1nZ1BMx5mNUYC7ZiYcCr5tUATEXvUlyA/9R?=
 =?us-ascii?Q?U2rwbBgHPwlNzeNQO0bb9LoqRR798dNTEBsSz6Cks025oJOvuJW3WrvCxTg4?=
 =?us-ascii?Q?xqkjPaPKHyDUZKAhLFNy/zje/+V4+w9Gro0cG58aigIWiSereFLUJ61SQQbk?=
 =?us-ascii?Q?x63qaI7zxZjJT629WuRjSr13294VGUk=3D?=
X-Exchange-RoutingPolicyChecked: W85CreKZ2ulsvKeodD/G+FHKcLZ627qZNFm6k4gKJzhHL3FRzgkpUGgIiDH6NYomqmeWgffp8wUZrhcRB2gNGWXXdm3FDPWBX5HSeMSXRFOaYsoy1Ws5wzrlms+ZGlWM0CdCzpFA5DYrrLyGzKVvm7VgTgSl7TYJiwxzXS7QSO3r8Vw+PRvWNqpS/FFSVqs2iXMBRT+gPIGbCy4TT4FuT0/MQsDcnrlV7S7sQ2qzHI5rf49m4OKs860t+6OuF7IBZvYRaauMEYax1IShTqQRuc8YyuBHNfWRxJPh9yvD1a10bQLA1fzt+7U1yd8xGo92LmNyCpJgYLr6wZmShlSgsw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0be42f60-f49a-469c-20b9-08de9b27d329
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 19:47:28.3557 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1lEzp/vxmBvDQdk+cw2AKhnzDp0CFMHzTzFtw2Jc3vcHGBYKxFLUZJ3pMRKq6IbKolGeXmSmvjstnGXV4E5OIxPHySVAx14Ad65Y0OzUosE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSSPR11MB9644
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

On Mon, Apr 13, 2026 at 01:08:25PM -0700, Clint Taylor wrote:
> Apply engine tuning WA_14026810691 starting with IP: Xe3p_LPG

The code changes look good, but I don't think we should refer to
"WA_14026810691" in the subject and commit message for something that
isn't actually a workaround and doesn't have an entry in the workaround
database by that name.  If you suggest an alternate wording, I can just
make the changes while applying the patch; no need to re-submit and
trigger another CI cycle.


Matt

> 
> v2: move to xe tunings (MattR)
> Signed-off-by: Clint Taylor <clinton.a.taylor@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 3 +++
>  drivers/gpu/drm/xe/xe_tuning.c       | 5 +++++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index aa267c2f6162..6a16ac1aca96 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -536,6 +536,9 @@
>  #define   SLM_WMTP_RESTORE			REG_BIT(11)
>  #define   RES_CHK_SPR_DIS			REG_BIT(6)
>  
> +#define TDL_TSL_CHICKEN2			XE_REG_MCR(0xe4cc, XE_REG_OPTION_MASKED)
> +#define   TILEY_LOCALID				REG_BIT(2)
> +
>  #define ROW_CHICKEN				XE_REG_MCR(0xe4f0, XE_REG_OPTION_MASKED)
>  #define   UGM_BACKUP_MODE			REG_BIT(13)
>  #define   MDQ_ARBITRATION_MODE			REG_BIT(12)
> diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
> index f8de6a4bf189..39423d5fabcc 100644
> --- a/drivers/gpu/drm/xe/xe_tuning.c
> +++ b/drivers/gpu/drm/xe/xe_tuning.c
> @@ -124,6 +124,11 @@ static const struct xe_rtp_entry_sr engine_tunings[] = {
>  			     GHWSP_CSB_REPORT_DIS,
>  			     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
>  	},
> +	{ XE_RTP_NAME("Tuning: TileY 2x2 Walk"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3510, XE_RTP_END_VERSION_UNDEFINED),
> +		       FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN2, TILEY_LOCALID))
> +	},
>  };
>  
>  static const struct xe_rtp_entry_sr lrc_tunings[] = {
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
