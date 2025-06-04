Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADA3FC5B543
	for <intel-xe@archiver.kernel.org>; Wed,  4 Jun 2025 18:54:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B6BA10E7B8;
	Wed,  4 Jun 2025 18:54:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dpmwUOuv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B35BD10E7EB
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Jun 2025 18:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749063266; x=1780599266;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=QNihCwGrvh7y3GnDtCIBZfButjCr1OiyGlbDyNGBBtY=;
 b=dpmwUOuvv09Cr42+GVWHL+jlEs0P2yxvE7twaH8qCjKsbKF+oGIcrg2c
 S9mtbKVUiH6sjiixulasHCFUIbaL7nHyjMADSiV3Ntjz1fN1e/c+1dGvp
 M7LAKtYs32FBibPyZ/xcq3qKr8v4mJlzus9Vv4CPQ43VR3jtVcLAwMEre
 5R+C6+QCadG40jO/53SKDFumzJr8FxdpDeTVlWGC1i+ozKA1pRUdh//LQ
 S2Ksc5fbTWyOo2v+6cKe+7+YiEdlVWjOI1bowBOxodWVxmRkbxO306Lx/
 QuxwC/OZaqYzYirCCa25OXzTQD1oCH6zWDrpLf5YUVne4Tqy9zKO0NZhg g==;
X-CSE-ConnectionGUID: LCwqptHhR9ydoQinoqlurQ==
X-CSE-MsgGUID: 6/ZcQ8EhSAeWuoyZw2HP4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="61781309"
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="61781309"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 11:54:25 -0700
X-CSE-ConnectionGUID: wKhWSFeZTgKnIeITjqhrbQ==
X-CSE-MsgGUID: Fy0y52avQgekUNhLx/U0KQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="145616680"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 11:54:25 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 4 Jun 2025 11:54:24 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 4 Jun 2025 11:54:24 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.87)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 4 Jun 2025 11:54:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XjBZkoaBy4gFfvkLTQwCV+rEzYWV2UkIbuk4iK51S6apWJIN3vmHU4fdBGBZJTIlGRFUHlentPD8Guz9ggtjRd7RA2eUbwPexZV2GGeHxwS+Y3YIDIwHX5tT0wihQKuoJJkZFGj9VxfdPGJAr5NZ0bLIDo699tfWDkA3x1N8e3qH3Twy5+yRvyW55e2SF4pAtm283lBpT8X6oqScWdFmW4tl/DVQkyuZJnDeGmTGiEuZZCmkKXT4KLAhVeja0ILZvOSlmYeS/XrKFWGb0UkqyczAbc1nzXfIgYccZsr15eUarx8TNGportipfg/eMEc3gaq0IBfo2fq8pZ8JfPuLcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uVzlGpNLCyoIXQrSWaAhRtSqZBxcbHeGfS46DlrE4Bw=;
 b=fm6fDSRZ6L8OlFZ2aOOF4ezsEnmDwzw3AL0XifJL4alZ6i+PJjHnhheJbDOLjS2nglDd8GZB8v0Y9hv+6h3IiBzAnbPZnMK6iNX8p9vdALR+3+qUXxB/CzqHxwFSBIMjKBsS0gaxz1hRUSQo42PswF4FgJD9ToHkOSPPRM8b5aGFF07O63Q6MEg4ymvH2fpMmFAja/WT1DdmzAmNLnpZdMc0YubiEQNlT/bUjEciGwmnv6pc8j1Z4hQVDiYzZUglkFH/OxcBktOjFvGBXmyAfWrLvJ6bi8SKKzDU/qQwC7KHS9yjUFts8VMApRd2G1TrLk/80dHRqtTO/C2YYkzgew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ2PR11MB8500.namprd11.prod.outlook.com (2603:10b6:a03:574::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Wed, 4 Jun
 2025 18:54:21 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.8813.018; Wed, 4 Jun 2025
 18:54:21 +0000
Date: Wed, 4 Jun 2025 11:54:19 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Shekhar Chauhan
 <shekhar.chauhan@intel.com>
Subject: Re: [PATCH v2 2/3] drm/xe/xe2_hpg: Add set of workarounds
Message-ID: <20250604185419.GG6239@mdroper-desk1.amr.corp.intel.com>
References: <20250604145236.1143122-1-dnyaneshwar.bhadane@intel.com>
 <20250604145236.1143122-3-dnyaneshwar.bhadane@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250604145236.1143122-3-dnyaneshwar.bhadane@intel.com>
X-ClientProxiedBy: SJ0PR03CA0192.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::17) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ2PR11MB8500:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ec254f2-295e-46b5-5a37-08dda3993766
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xoL7Z6+jlL4A10yudFjL8cwYu6x9VMfwBRxV36qUis7Vo0Dc+YyrvJwfPsqy?=
 =?us-ascii?Q?DsHCVTAE5aVzvkuo63OX7lMtekwR9EqVAWMt8K/0IJbo4KyqbqhElldQmps4?=
 =?us-ascii?Q?bvJzhMDdgWArpPEDsBUmneEYoH4Gy2FnX+GVIgfLNWRFRE+/NzATylSZ2w5p?=
 =?us-ascii?Q?yM1ohY7FNz4fkJvlyeaXnfW3zaxqqKYG6lmrUZ/sb87vC3aYX9M7jBaPReeI?=
 =?us-ascii?Q?DdlJaQ7MnTcAqeYH96vM1PzFj5XFeK3+3LIaGqe/hQ6eJjed4Zd8GzhspGhK?=
 =?us-ascii?Q?5EGHwH5h3VmbVMBje7sMtFOkaq71fx4/RmQm9WVKwhuD/G7u3RFax7DHYMvb?=
 =?us-ascii?Q?earE2LfsAm67ZhE1byABjvrmqXC/dbe1apxBgRyYdOUPcWHvWpAXGYfkSyl2?=
 =?us-ascii?Q?fqDrMxWZenM9nhlQoYIbnyDjfhE43klrN6sq1EJuwZhTsOpOAyna8vtyX8i6?=
 =?us-ascii?Q?rXf0HH6C90/dbBd3ARN80GtWe9anxPFaKQnabEd14IZOWVqCIrSqVnH9Kbdb?=
 =?us-ascii?Q?mNw6D1ySQyg18GXlx6emZbPc/YLME6k5z9pTs4wzj14ocLWdHQt0IksNme2X?=
 =?us-ascii?Q?oimwMbaBdYhmVO/ez3noXxa81ao02ngai8JyUB/7cAMDh7oiGNKq0YVJIpdY?=
 =?us-ascii?Q?/smUKg0KCy3c0nK0WeOV2RPw48TC5ni8a7dq95blPR0ZkbhpijHpP2t6l7SR?=
 =?us-ascii?Q?uOIA62zrHspHjd/V0WQZeYzfKiBG+g+cNR8YM+S9dmxMKLEy3IliifLFk5jp?=
 =?us-ascii?Q?jwmTclQXzPguUBhpz9apGogsERiQOKttIBv88rTEg7jWgdPPzz6yYbTk7JZ+?=
 =?us-ascii?Q?z2UbE5GdKh83nyMI7KJesJf67fvxdizWUbFHHBKhVqE/b/sHO/+gRa2OkjuA?=
 =?us-ascii?Q?7jIu9FeGTQCETR0yzjYv74C3nVzKoyJwkFvr0ptAYICRX5DPsB5w4yrPW+V5?=
 =?us-ascii?Q?TIXhQevMMe7DJGCGXgUUErvz1GKguC4neepI/syZ2k8V3ESh6Vq8XVdG11Qg?=
 =?us-ascii?Q?e5g68nd82DjrUd9yoJ3GMCGkNi1XBs0sImTClj3rvJ3/Vhd0GzqNIMRoc5dx?=
 =?us-ascii?Q?CbRjwDZBmxC/nt9Gy3o/pulyf+/UZNitw5C0zGUkkRIigQtVSV9BjGPbGfDY?=
 =?us-ascii?Q?CVKfRsoDfBeqjp0C2TQLMjzivrpUGKJrqxrgWfsTmCDOuHiQnF1zro9VJKpj?=
 =?us-ascii?Q?oYtJCM1Sq2WOLTyFbVixCekKrUE0llzj1CfXLYY0+X5FO2QuBlgxZMawnoyh?=
 =?us-ascii?Q?fsTUrH4VUQoS+AxtbNTEDRtOsBb9fS++Md4e1yNTuM5tYIZIcZNvZWWUG5qo?=
 =?us-ascii?Q?IAuKo0Q8eqnBcKR9FjNh8KB+IYpgbjw1u2AbFkBZZ2zspYYpdh3eEpWGsHpg?=
 =?us-ascii?Q?46RvyDlxZROfPt/5YTafoyRWpdyKTXe7+Lzzd8Aote2baNWxeYUvakS/h/Ev?=
 =?us-ascii?Q?9MWzbGqV/RE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?o61peTB0EE3sOB0IukUlrr+UctZ028Ja+U5CNaGgCst1SgQ2QlEJTNGjBGnS?=
 =?us-ascii?Q?rOwHmcSyVCFkCc5GOD14JsiEzdVqhrIBLBPjG9EmYSlWHj52L4Q4Ju3he6uy?=
 =?us-ascii?Q?xSLatHLpNT8n5RcgGsrIn3QY6T2UPsTlck9RICiZ3EWPPxjXCR71Mtj9knro?=
 =?us-ascii?Q?9WBvcX/E9/S/KxH1iUT2VrgS79vC2w25ke0/B1UB0j9spp3W7Ry0BNKPHCkn?=
 =?us-ascii?Q?Uz3sXWf+g3mWUK0+QF1a2jSS+Dd+wYhjHAhz6tLfNHHTr0Q7nAoUMCydDdNx?=
 =?us-ascii?Q?oTFlPyA05htLcCXHr6PXhP7ApX4mutnZ/Z+uIb7JfoPcJQJWRnrbOCdkJwAK?=
 =?us-ascii?Q?XpCBwHT7E8bdxHmUVeQweZ16ryFvFCTuD/DKugPPAnD22ZM8a2S6bnPlyMGw?=
 =?us-ascii?Q?aoV837aCp2fOWqmWfb6Wh2fHymMDd8BAyXZCcxCQ5k0TKoJQ0669KU3mFo8s?=
 =?us-ascii?Q?PWXQxYArPqpo5yyGk1J8/1lxu8Ujp33FovU4R+rdV9hvxFe8jeeiJJmYh3BV?=
 =?us-ascii?Q?HbmvtqtvI8MWOoWIHju78SNJRart2YQ7Lqj7mOVnmg+doTXegyoHeC7t30es?=
 =?us-ascii?Q?g/xAkW5RIc7i7pplqm2urv3S+75QGAjWcb0GejNDbRspLqt7Dur7Ow0vHVwp?=
 =?us-ascii?Q?UnUq0xe9HCJUN4Tq3iDNgdJ9Lbbz/OnnIUu6luct6yZCdBn6ZokLvt0o9mpF?=
 =?us-ascii?Q?C9x2nkWHSlZhDUlM+VpcDXV0Jrme889A5qZo5EPxfeVBWE/0tB5z2SvkUz+b?=
 =?us-ascii?Q?NQBfmxrCrYJK5Q+WDIJ+pQTNAw9ASh3e2RjrO6pq8EuEdAjZpARkZ3QFFjt1?=
 =?us-ascii?Q?5shNqoiqvHQERtu0wrpzOQ+90RZ/Uw5Ck16Z4qkkSgNTxnYrkaISloI9X1iw?=
 =?us-ascii?Q?3Wbu6w/e7F7d113GanbsN6fFT41fEVwrk3elbwYDk9rKnzv+VfFwm1vGy2/m?=
 =?us-ascii?Q?H2Fpm+NyyAbOVExZt5126QdcXERl0+zwsZK/uZsNu2bCvXTmQ74X2oHwcwYp?=
 =?us-ascii?Q?cD4F4tSjK3GvZyuskYR1XBb7ZmOEsu6Prw2ktPOJgd1Rq/ykYWzrFPOYaDO0?=
 =?us-ascii?Q?Bk1IWh9LWw8DnNPdhFlUsF2UuNigEfaeRDr9lAM5zOEMjjMFe8zng+al9BIk?=
 =?us-ascii?Q?G0Dk2i+AJx6a9tCpBgg++/Qj9pT3MFYDw6GuUPKJiOGHYHLNgbvlfdCcm8gh?=
 =?us-ascii?Q?B8+BDeZRZPHSyDVh+MLLRKxPfr50BHTxme7FxP6nT9go0nLugUvxe0CNkL8F?=
 =?us-ascii?Q?BcMalK9NDGLIrV4tndKVBH37ch/ki6C3u4o7WHk6egOG6HfIh0SUL2ErjICZ?=
 =?us-ascii?Q?LZ50b/wkpkLwvrNnsY9PMfL9P1adtPsjP/4qAmawgDiWUX2brJ/Bn7u/evZS?=
 =?us-ascii?Q?Kcrkjc7sPdFkLCrEWPRSJoci3LZVptIU5xL1nxDBlv8Ay47bU8MMNaefl7Gg?=
 =?us-ascii?Q?W3dpkUv9B19MDU6SDcR0idsB/R84c8VWdD2V51wQWBj1Nsf/qFRVFsvz0U1A?=
 =?us-ascii?Q?3QwoNITZPMYawGhxnLyn+BtQhkTA339w1j2UWRxF+H4CbaPE7nCs1SN2uUhC?=
 =?us-ascii?Q?+bAYZGKK+DXZtriwqqeFAHv/PfZDiUGMLGptkG6TU7J9EFvOAEkEP202Ysdc?=
 =?us-ascii?Q?gQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ec254f2-295e-46b5-5a37-08dda3993766
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 18:54:21.2731 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bphIxfkE2vOM8jfW+On/Fw5OHihaolecA7/GjP90HxmoGTcIXdMJGk5k+NiaGarNaBuEZtBW86emei2Lxab2D5ZviVHybd6t6+ccfjbE3vE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8500
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

On Wed, Jun 04, 2025 at 08:22:35PM +0530, Dnyaneshwar Bhadane wrote:
> From: Shekhar Chauhan <shekhar.chauhan@intel.com>
> 
> Add set of workarounds for xe2_hpg.
> 
> -v2: Fix xe2_hpg GMD version for some workarounds.
> 
> Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
> Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_wa.c         | 55 +++++++++++++++++++++---------
>  drivers/gpu/drm/xe/xe_wa_oob.rules |  4 +--
>  2 files changed, 40 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 67196baa4249..2c0e0adc5904 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -489,8 +489,8 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  	  XE_RTP_RULES(GRAPHICS_VERSION(2004), FUNC(xe_rtp_match_first_render_or_compute)),
>  	  XE_RTP_ACTIONS(SET(ROW_CHICKEN3, XE2_EUPEND_CHK_FLUSH_DIS))
>  	},
> -	{ XE_RTP_NAME("18034896535, 16021540221"), /* 16021540221: GRAPHICS_STEP(A0, B0) */
> -	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2004),
> +	{ XE_RTP_NAME("16021540221"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0),

Breaking out 20.01/20.02 into a separate entry farther down is good
since it keeps the LPG and HPG handling separate, and also avoids
blindly applying this 20.03 which doesn't exist today, but could
potentially show up in the future.  

However is there actually a benefit to splitting 16021540221 (a-step
only) and 18034896535 (all steppings) into separate entries given that
the two workarounds have the same actions?  I think breaking it out like
this will actually cause a warning if run on an A-step platform since
we'll have two entries trying to update the same bits of the same
register (see compatible_entries() in xe_reg_sr.c).

>  		       FUNC(xe_rtp_match_first_render_or_compute)),
>  	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4, DISABLE_TDL_PUSH))
>  	},
> @@ -507,6 +507,10 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  	  XE_RTP_RULES(GRAPHICS_VERSION(2004), FUNC(xe_rtp_match_first_render_or_compute)),
>  	  XE_RTP_ACTIONS(SET(ROW_CHICKEN, EARLY_EOT_DIS))
>  	},
> +	{ XE_RTP_NAME("18034896535"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2004), FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4, DISABLE_TDL_PUSH))
> +	},
>  	/*
>  	 * These two workarounds are the same, just applying to different
>  	 * engines.  Although Wa_18032095049 (for the RCS) isn't required on
> @@ -533,31 +537,38 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  	/* Xe2_HPG */
>  
>  	{ XE_RTP_NAME("16018712365"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION(2001), FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
> +		       FUNC(xe_rtp_match_first_render_or_compute)),
>  	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW, XE2_ALLOC_DPA_STARVE_FIX_DIS))
>  	},
>  	{ XE_RTP_NAME("16018737384"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION(2001), FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED),
> +		       FUNC(xe_rtp_match_first_render_or_compute)),
>  	  XE_RTP_ACTIONS(SET(ROW_CHICKEN, EARLY_EOT_DIS))
>  	},

Since this one is now a "from now on" special case, we also need to
remove the other copy of this workaround farther down in the Xe2_LPG
section.  Otherwise we'll wind up with two entries trying to apply the
same workaround on 20.04 which will cause a warning (it looks like CI
saw this too).


Matt

>  	{ XE_RTP_NAME("14019988906"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION(2001), FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
> +		       FUNC(xe_rtp_match_first_render_or_compute)),
>  	  XE_RTP_ACTIONS(SET(XEHP_PSS_CHICKEN, FLSH_IGNORES_PSD))
>  	},
>  	{ XE_RTP_NAME("14019877138"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION(2001), FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
> +		       FUNC(xe_rtp_match_first_render_or_compute)),
>  	  XE_RTP_ACTIONS(SET(XEHP_PSS_CHICKEN, FD_END_COLLECT))
>  	},
>  	{ XE_RTP_NAME("14020338487"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION(2001), FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
> +		       FUNC(xe_rtp_match_first_render_or_compute)),
>  	  XE_RTP_ACTIONS(SET(ROW_CHICKEN3, XE2_EUPEND_CHK_FLUSH_DIS))
>  	},
>  	{ XE_RTP_NAME("18032247524"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION(2001), FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
> +		       FUNC(xe_rtp_match_first_render_or_compute)),
>  	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0, SEQUENTIAL_ACCESS_UPGRADE_DISABLE))
>  	},
>  	{ XE_RTP_NAME("14018471104"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION(2001), FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
> +		       FUNC(xe_rtp_match_first_render_or_compute)),
>  	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW, ENABLE_SMP_LD_RENDER_SURFACE_CONTROL))
>  	},
>  	/*
> @@ -566,7 +577,7 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  	 * apply this to all engines for simplicity.
>  	 */
>  	{ XE_RTP_NAME("16021639441"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION(2001)),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002)),
>  	  XE_RTP_ACTIONS(SET(CSFE_CHICKEN1(0),
>  			     GHWSP_CSB_REPORT_DIS |
>  			     PPHWSP_CSB_AND_TIMESTAMP_REPORT_DIS,
> @@ -578,13 +589,19 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0, WR_REQ_CHAINING_DIS))
>  	},
>  	{ XE_RTP_NAME("14021402888"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002), ENGINE_CLASS(RENDER)),
>  	  XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN7, CLEAR_OPTIMIZATION_DISABLE))
>  	},
> -	{ XE_RTP_NAME("14021821874"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION(2001), FUNC(xe_rtp_match_first_render_or_compute)),
> +	{ XE_RTP_NAME("14021821874, 14022954250"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
> +		       FUNC(xe_rtp_match_first_render_or_compute)),
>  	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, STK_ID_RESTRICT))
>  	},
> +	{ XE_RTP_NAME("18034896535"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
> +		       FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4, DISABLE_TDL_PUSH))
> +	},
>  
>  	/* Xe2_LPM */
>  
> @@ -774,7 +791,7 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
>  	  XE_RTP_ACTIONS(SET(INSTPM(RENDER_RING_BASE), ENABLE_SEMAPHORE_POLL_BIT))
>  	},
>  	{ XE_RTP_NAME("18033852989"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2004), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2004), ENGINE_CLASS(RENDER)),
>  	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN1, DISABLE_BOTTOM_CLIP_RECTANGLE_TEST))
>  	},
>  	{ XE_RTP_NAME("14021567978"),
> @@ -807,7 +824,7 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
>  	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_1, DIS_SF_ROUND_NEAREST_EVEN))
>  	},
>  	{ XE_RTP_NAME("14019386621"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002), ENGINE_CLASS(RENDER)),
>  	  XE_RTP_ACTIONS(SET(VF_SCRATCHPAD, XE2_VFG_TED_CREDIT_INTERFACE_DISABLE))
>  	},
>  	{ XE_RTP_NAME("14020756599"),
> @@ -824,13 +841,17 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
>  			     DIS_AUTOSTRIP))
>  	},
>  	{ XE_RTP_NAME("15016589081"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002), ENGINE_CLASS(RENDER)),
>  	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_1, DIS_CLIP_NEGATIVE_BOUNDING_BOX))
>  	},
>  	{ XE_RTP_NAME("22021007897"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002), ENGINE_CLASS(RENDER)),
>  	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN4, SBE_PUSH_CONSTANT_BEHIND_FIX_ENABLE))
>  	},
> +	{ XE_RTP_NAME("18033852989"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN1, DISABLE_BOTTOM_CLIP_RECTANGLE_TEST))
> +	},
>  
>  	/* Xe3_LPG */
>  	{ XE_RTP_NAME("14021490052"),
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 9efc5accd43d..425cb401c276 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -30,10 +30,10 @@
>  		GRAPHICS_VERSION(2004)
>  13011645652	GRAPHICS_VERSION(2004)
>  		GRAPHICS_VERSION(3001)
> -14022293748	GRAPHICS_VERSION(2001)
> +14022293748	GRAPHICS_VERSION_RANGE(2001, 2002)
>  		GRAPHICS_VERSION(2004)
>  		GRAPHICS_VERSION_RANGE(3000, 3001)
> -22019794406	GRAPHICS_VERSION(2001)
> +22019794406	GRAPHICS_VERSION_RANGE(2001, 2002)
>  		GRAPHICS_VERSION(2004)
>  		GRAPHICS_VERSION_RANGE(3000, 3001)
>  22019338487	MEDIA_VERSION(2000)
> -- 
> 2.34.1
> 
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
