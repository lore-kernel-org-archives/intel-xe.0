Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84005C61DBD
	for <intel-xe@archiver.kernel.org>; Fri, 28 Aug 2026 19:46:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DF6A10E635;
	Fri, 28 Aug 2026 19:46:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AG5UfkPr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ABA810E4C6
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Aug 2026 19:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787946388; x=1819482388;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=8zGUJeTaX/4yvc+f46m5Sy4zFSX/bVCI5a8nPPWqWpA=;
 b=AG5UfkPrYAkOLgdy1uAEn2I40jMdxD3Z/BsUI18q0yFAfrsQDOGxruFr
 z9CXZMzZCMsrhCuZr+wayh22GMzBE+chQAuu7VuxE9eNqWmACWKon+ZjJ
 cA6kzHL7+uDv2PbnCEC+kGNGUeEkzlJHqdTo0LhIH5CFB1IgUmHDYwhz6
 YihRqdlSFvieZ1IRUwVqJwdPs71KPQ3eO0Br4epSs19FeEGmmHJNL1hES
 XRskicgBMh7dJEbiO0GRmOR6cDBQ2boY4lsFqJvPz6ELizC+t+I6GBdcs
 NvztBJZZ0TYOHV7nSZt1TCXN7MfZpP4Cgc8rlDq3yDzMX47z8sjXG9kt7 Q==;
X-CSE-ConnectionGUID: bTepfexoRtae4Ci6kuWUGQ==
X-CSE-MsgGUID: HZRYp4/rSByCU7X689vmWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11889"; a="105986501"
X-IronPort-AV: E=Sophos;i="6.25,249,1779174000"; d="scan'208";a="105986501"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 12:46:28 -0700
X-CSE-ConnectionGUID: +UGmUmqQQs6sMskGY99EVw==
X-CSE-MsgGUID: lrNa92zeS+2uVWAfbfUT+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,249,1779174000"; d="scan'208";a="262116562"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 12:46:27 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 28 Aug 2026 12:46:27 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 28 Aug 2026 12:46:27 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.54) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 28 Aug 2026 12:46:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n/FIWiRx7m74J5i4gkmYNTcHWKrkfZCyGxvUE+9pIs5Vds5b3NzJmlnE9bjWfwuOX4SgTsaKzZJ8bXCZerx1J+pYBscL6ZjvNmYlR6H2Frr9IlKH5Cfe2rY9FMDoRy9nMnnnaKZpXYg69cycAK3zOPkaTSTmS/PDK3AtzHQmK/Esgy7Z1NYIWC0PXo96G1KKrj5mAHGAYe3/eVSg02mhLfxbIZM4vhwqWIT55ud7tVbdERrnmX23RFPQo24RYOlY8OsEeUnfTbV1jnxmPrVdhok0Jdr6kJapSyQj/sOw15Vba0g7P9p0qGNoucEhZHEnJbbbwqXlkUWo0b6ppM5THg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dO1ylmgytk1ECGxswjKIsBM1ft9Nq2s39nNRD6BND0I=;
 b=R0jAyNLgY+Vei/q5OeMuPgNJvXbjulAzW+IK/iMtbwbCLIt63Q3gSKeKsDezMy6AndHGEKs9z6zM9UyXNgi0SRV9drNM6rCC4Z+TsBtVj2/7aH/3XnbvALBkrJ5jkbQsrPxFh7Fng+G67RZgmyuEuueqOnOgAwx5aGjibxjzkemGyonvc7yFgU+j3YFh/7j2IammMlsp39KlnAO2CYRmg5lf9T60G1/XmadWXgcdH+IDD8rHJfW75eW9vUvzSzmLKVBWAXkUm/nnxzDncuKed3Y7VE3LW55b3xbKDhYOALlR/HBp6cN3l5X9rYFwW4+38jU7Knp2VrrwmsUWQPsVCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM3PPFA69606334.namprd11.prod.outlook.com (2603:10b6:f:fc00::f42)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Fri, 28 Aug
 2026 19:46:24 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 19:46:24 +0000
Date: Fri, 28 Aug 2026 12:46:21 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 1/5] drm/xe/migrate: support 4K PTEs for identity map
Message-ID: <apHljQtQ+Ojgtw2P@gsse-cloud1.jf.intel.com>
References: <20260828151405.662533-7-matthew.auld@intel.com>
 <20260828151405.662533-8-matthew.auld@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260828151405.662533-8-matthew.auld@intel.com>
X-ClientProxiedBy: MW4PR03CA0086.namprd03.prod.outlook.com
 (2603:10b6:303:b6::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM3PPFA69606334:EE_
X-MS-Office365-Filtering-Correlation-Id: fe1eac03-1738-4e59-afc9-08df053d0aca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|10067099003|4143699003|11063799006|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: ZTFzjq5XZ6cGOBUEpJzdNpHPA2N7KVCdzPxFuTHLB3uf80Cinw5sx3Pzd0IPW41bOxKgTmgW+2vCwgkA+DQBzudzZ5wkaxiqhzcCS+bmzyp8VzBOHH4w/G/AtqC2ZevmWU8s/j+vaL3c+x8toao3RH6sUKfspWLntEdwReDXus5cHawHEmtlDcl51VzpBRldNfYnTbg1U4rhB/Vqh96souFVrds02IpGtQ6yXUOX4E0xWUdZpK+sen533Bat/0sjZXiXDAyHtz9OifuuRhj6Pq2tPeKV1YnuXLpx96ZkAsHbNtLoxWND6ZOhnLs91yzVKJMSXzjydJFQFyz6dcENtSelh0PV+TNa6x7Ih5PHPPKzwOp5Kops5hlVlRjwUCty5GY6bGn3eg1A1q2mG7j3Sgu/gqU4dUsae1zdO1ofd1IOGDzfkxfytnKHud+S4pVd96BPUmivZm6ngUBJ1aAw6gX8Z3FoSVQoAU1PDZj10J1y23dE3AMfQx+2pL+f8rfIPFTwkBLvC4mTVtXKzWSzdZyv/q9gXbvpGHiBex1F3qQga1NOUfVibuw9H1/nzjof8+bMu+KH4z+lGjXttwgoDSOMFZnoIMOoj6Yh6/I0PUUnwjI/Ro+lbRHkXwEPWUgi
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(10067099003)(4143699003)(11063799006)(18002099003)(22082099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?jVc8sW/4dEBvXssHV6NjtzZ5ThWoyj4OnRPMBFlTwq/F0r+HDHbM2tgqyN?=
 =?iso-8859-1?Q?4VyvtJPl6Qt+RxV9zaBoZQhvuVXv/0sJ3tjvhhbtXGkyXXZMGF7tRNmPNy?=
 =?iso-8859-1?Q?oRKEVCR50pErQQtv3X/xpdbOgqCSfIQIdw1IUkXHHlTrtastHwtLkbTZ9T?=
 =?iso-8859-1?Q?g+dtP4FsUslgpK3hWMFUAvM8sBj7By8F7sQl7ebdZGQ2EtAdQ8stLe5pCn?=
 =?iso-8859-1?Q?SKnZBBdl1184y2vTBRYHJkTAiZEgnC15KUYcB0IExMFt+ug4ceGLT0KaRZ?=
 =?iso-8859-1?Q?KNct5oFjoHBRvLhRUFQCefPANU1QIemVrpUgCOXzcrsTscrvaW+QU8wfyK?=
 =?iso-8859-1?Q?q5G9uJhRlGkz+IeomA2M7vN7QPNolhp8/WSxBTr7oVQ0fHMi+N8Yt0Cpa9?=
 =?iso-8859-1?Q?Ewp711j+xevZHDBRCj7cIuqMWGhmPpgmGwr1Ia7UJjxLnlx/D0psE/zWix?=
 =?iso-8859-1?Q?re6YBqa7PT3bfSnrKINvAnNaEOF5xgb+M9UApCwUKAEtIKlZm6yt9klZUu?=
 =?iso-8859-1?Q?Bouia1OGK9/h9et2H1HXwDopSiAN2naVXdmYipm+Uf19mbDloMDL7h/Etl?=
 =?iso-8859-1?Q?1Us269oOf7OSx4PeuAbjQglfJ6EjrvVBCE5spfezKf/oFr3y9J2jv893cX?=
 =?iso-8859-1?Q?nbX1HYD0dkyzg60zffh0t6y9wyhAQWpmnsEv+4+tFU7F9IfL1nHpWJmdB5?=
 =?iso-8859-1?Q?X4Pptnh0Yx/XUSmCFTk7q51dBMaXRQzt1OViSoYMgeB/w+TK6AS6VpmLjT?=
 =?iso-8859-1?Q?JL9BsYIZx9mBCjU+nK5nsnDpJEEeh2FPwskY9rl72pkO4qu7lIImIgHhZv?=
 =?iso-8859-1?Q?NYvO5ZvUwChYOSG/J1tKDoLJe7/i3gDgKxujnmvsdO68sQMNpYpAR9z6sq?=
 =?iso-8859-1?Q?hw6O7dr/M4atxxv+aGmOoU3RU4HMyDiFt3rlJHREUuVgEvFb1+pc4WwBwi?=
 =?iso-8859-1?Q?XKAYvmpqeOtTjZsg+OTV5QiiZllDhDj/knqEylCqrtVFpcg85bDFFl9srh?=
 =?iso-8859-1?Q?X9cMrb7YmL1QnZiZlOnaU84o6FBgMxevLnEwwa7pNMGkDjmDYNCjOcDtOV?=
 =?iso-8859-1?Q?4TjlZfkiY0RW6G6bCjzpA0FjKq5Pa3aXzIMZs+toijO2vLbX8DKJjaA6nm?=
 =?iso-8859-1?Q?TsHml2iXZEqBptBC0lSYOS3vdGrzb+cGAT3uKt5JVQ2fsz7Rrp27z8RzBH?=
 =?iso-8859-1?Q?ezurBdYWtjKyfWTRiAWTmbKNQtxOs9lVtv81NhKftwYh9sR1jOOzhRo8+y?=
 =?iso-8859-1?Q?2LAyH+eWG9v3HeeQp60r1mM2Sha1XU+DtHSvQEfJ5wXJlLTpA2oDPEydbC?=
 =?iso-8859-1?Q?eAc9J8eZEKozjTlIdXeneOqsi4Sy+ZL7PpDUu7W5vp5svNTpMsEUGfQzNp?=
 =?iso-8859-1?Q?zXZUWOY1fZN+cTWM5cOGYtDj0ChxkPNg2LbW4kILMuyQmXNv1eCRjzVDtv?=
 =?iso-8859-1?Q?/m1QoUmIqVBphrfyGYi4QPGfrv7ri6F7xlyqaRpAacq6aujqp4l/9RkF7P?=
 =?iso-8859-1?Q?pWxQIuBB75Tq1ou7c8aGx8wX6pEdEfUDYPawW42/NxZ62YAKngsytvlqed?=
 =?iso-8859-1?Q?LHTXCWR4cLjr8Zoa2aZFNDrKYksMCqAtMWzjZ8+xU4ABxAv0igEDt7pcLS?=
 =?iso-8859-1?Q?rb67z8Z6mkuMUBEccYrUfGdw+N0xM6g53oY8Vzy5I65Q+GQfkMmfUSq9YP?=
 =?iso-8859-1?Q?30nGMq4GG7o94Vg9UOrsioawuBCCmAwRejx4LxO8rXTF8Ci3dAPn7xd9iJ?=
 =?iso-8859-1?Q?l26UQqOHtirjnsL5v2DPu8FmR4AioQg+O+t9cQyBwk/uCzuB03/fGHXNZF?=
 =?iso-8859-1?Q?hVJOUIo3UFW+SO4NQeP0pcVX0IVpCAU=3D?=
X-Exchange-RoutingPolicyChecked: A1CJrCbgXibElwfQM/OydTVsdJcBgRMq86DW6dZV6aCwdXTIcmg13md8e4yRfzjpx8F3CuMeJMBtonqyoGEdQhZonJbwzHoVGoz8jgvFRJdr52E66bM1BXntHi3wxN2+t/xhcgeHThS6DO4FC8BKZDEvTuTIx3Jz1oftHcuCvNrad+SnoWBfv8etLDEClNxAtExIxDJFeaL0c5jY5xGi9VPbDyXPB11CUCrmIrPyK5QFmUh/vqvyhikg6El/cmFCAJCkYLydfBdId7AYGwFI5KjVQxmMCE+chHcKMPFWtZ26SgXxm+6Bg+cWdpaCgv2ePWkf0WL8IQeybju64g1jEg==
X-MS-Exchange-CrossTenant-Network-Message-Id: fe1eac03-1738-4e59-afc9-08df053d0aca
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 19:46:24.4047 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M80rfhfewGEp1wQClN3B50UQv050GbjZUQxHG/5upLN5RPoHsZRTZycJAYtThrLUtkH0PTHruRuNZ+P3QoWP4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFA69606334
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

On Fri, Aug 28, 2026 at 04:14:07PM +0100, Matthew Auld wrote:
> When VRAM limit (usable_size) is no longer 2M aligned (e.g. because flat
> CCS storage size rounds it down to 4K), we must map the tail of the
> identity mapping using 4K pages.
> 
> This removes the 2M alignment assert (which pops) and introduces a 4K
> fallback in the identity map programming loop to handle the last 2M
> chunk of usable VRAM.
> 
> Might be possible to skip backporting this. The assert that pops should
> be harmless and is only on debug builds plus only a stray write would
> hit CCS, which technically get mapped.
> 

This LGTM, better than what I had in mind. One question though.

> Assisted-by: Gemini:gemini-3.1-pro-preview
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_migrate.c | 57 +++++++++++++++++++++------------
>  1 file changed, 37 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 75b83687f1b5..0bf000d7c901 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -87,7 +87,7 @@ struct xe_migrate {
>  #define MAX_PREEMPTDISABLE_TRANSFER SZ_8M /* Around 1ms. */
>  #define MAX_CCS_LIMITED_TRANSFER SZ_4M /* XE_PAGE_SIZE * (FIELD_MAX(XE2_CCS_SIZE_MASK) + 1) */
>  #define NUM_KERNEL_PDE 15
> -#define NUM_PT_SLOTS 32
> +#define NUM_PT_SLOTS 48

Why this change? Can't we just steal more PTs from user-space VM binds?
Did testing show that this was actually a problem?

Also, in general, power-of-two values are preferred.

Eventually, we'll be able to drop the need for these PTs once CPU binds
land as well [1].

Not blocker.

Matt

[1] https://patchwork.freedesktop.org/series/149888/

>  #define LEVEL0_PAGE_TABLE_ENCODE_SIZE SZ_2M
>  #define MAX_NUM_PTE 512
>  #define IDENTITY_OFFSET 256ULL
> @@ -163,22 +163,20 @@ static u64 xe_migrate_vram_ofs(struct xe_device *xe, u64 addr, bool is_comp_pte)
>  }
>  
>  static void xe_migrate_program_identity(struct xe_device *xe, struct xe_vm *vm, struct xe_bo *bo,
> -					u64 map_ofs, u64 vram_offset, u16 pat_index, u64 pt_2m_ofs)
> +					u64 map_ofs, u64 vram_offset, u16 pat_index, u64 pt_2m_ofs,
> +					u64 pt_4k_ofs)
>  {
>  	struct xe_vram_region *vram = xe->mem.vram;
>  	resource_size_t dpa_base = xe_vram_region_dpa_base(vram);
>  	u64 pos, ofs, flags;
>  	u64 entry;
> -	/* XXX: Unclear if this should be usable_size? */
> -	u64 vram_limit = xe_vram_region_actual_physical_size(vram) + dpa_base;
> +	u64 vram_limit = xe_vram_region_usable_size(vram) + dpa_base;
>  	u32 level = 2;
>  
>  	ofs = map_ofs + XE_PAGE_SIZE * level + vram_offset * 8;
>  	flags = vm->pt_ops->pte_encode_addr(xe, 0, pat_index, level,
>  					    true, 0);
>  
> -	xe_assert(xe, IS_ALIGNED(xe_vram_region_usable_size(vram), SZ_2M));
> -
>  	/*
>  	 * Use 1GB pages when possible, last chunk always use 2M
>  	 * pages as mixing reserved memory (stolen, WOCPM) with a single
> @@ -196,8 +194,24 @@ static void xe_migrate_program_identity(struct xe_device *xe, struct xe_vm *vm,
>  							    true, 0);
>  
>  			for (ofs = pt_2m_ofs; pos < vram_limit;
> -			     pos += SZ_2M, ofs += 8)
> +			     pos += SZ_2M, ofs += 8) {
> +				if (pos + SZ_2M > vram_limit) {
> +					entry = vm->pt_ops->pde_encode_bo(bo, pt_4k_ofs);
> +					xe_map_wr(xe, &bo->vmap, ofs, u64, entry);
> +
> +					flags = vm->pt_ops->pte_encode_addr(xe, 0,
> +									    pat_index,
> +									    level - 2,
> +									    true, 0);
> +
> +					for (ofs = pt_4k_ofs; pos < vram_limit;
> +					     pos += SZ_4K, ofs += 8)
> +						xe_map_wr(xe, &bo->vmap, ofs, u64, pos | flags);
> +					break;
> +				}
> +
>  				xe_map_wr(xe, &bo->vmap, ofs, u64, pos | flags);
> +			}
>  			break;	/* Ensure pos == vram_limit assert correct */
>  		}
>  
> @@ -242,16 +256,17 @@ static void xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>  	u16 pat_index = xe_cache_pat_idx(xe, XE_CACHE_WB);
>  	u8 id = tile->id;
>  	u32 num_entries = NUM_PT_SLOTS, num_level = vm->pt_root[id]->level;
> -#define VRAM_IDENTITY_MAP_COUNT	2
> -	u32 num_setup = num_level + VRAM_IDENTITY_MAP_COUNT;
> -#undef VRAM_IDENTITY_MAP_COUNT
> +#define VRAM_IDENTITY_MAP_PT_COUNT	4
> +	u32 num_setup = num_level + VRAM_IDENTITY_MAP_PT_COUNT;
> +#undef VRAM_IDENTITY_MAP_PT_COUNT
>  	u32 map_ofs, level, i;
>  	struct xe_bo *bo = m->pt_bo, *batch = tile->mem.kernel_bb_pool->bo;
> -	u64 entry, pt29_ofs;
> +	u64 entry;
>  
> -	/* PT30 & PT31 reserved for 2M identity map */
> -	pt29_ofs = xe_bo_size(bo) - 3 * XE_PAGE_SIZE;
> -	entry = vm->pt_ops->pde_encode_bo(bo, pt29_ofs);
> +	/* PT44..PT47 reserved for 4K and 2M identity map */
> +	u64 l1_pt_ofs = xe_bo_size(bo) - 5 * XE_PAGE_SIZE;
> +
> +	entry = vm->pt_ops->pde_encode_bo(bo, l1_pt_ofs);
>  	xe_pt_write(xe, &vm->pt_root[id]->bo->vmap, 0, entry);
>  
>  	map_ofs = (num_entries - num_setup) * XE_PAGE_SIZE;
> @@ -347,11 +362,12 @@ static void xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>  
>  	/* Identity map the entire vram at 256GiB offset */
>  	if (IS_DGFX(xe)) {
> -		u64 pt30_ofs = xe_bo_size(bo) - 2 * XE_PAGE_SIZE;
> +		u64 pt46_ofs = xe_bo_size(bo) - 2 * XE_PAGE_SIZE;
>  		resource_size_t actual_phy_size = xe_vram_region_actual_physical_size(xe->mem.vram);
>  
> +		u64 pt44_ofs = xe_bo_size(bo) - 4 * XE_PAGE_SIZE;
>  		xe_migrate_program_identity(xe, vm, bo, map_ofs, IDENTITY_OFFSET,
> -					    pat_index, pt30_ofs);
> +					    pat_index, pt46_ofs, pt44_ofs);
>  		xe_assert(xe, actual_phy_size <= (MAX_NUM_PTE - IDENTITY_OFFSET) * SZ_1G);
>  
>  		/*
> @@ -362,12 +378,13 @@ static void xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>  			u16 comp_pat_index = xe_cache_pat_idx(xe, XE_CACHE_NONE_COMPRESSION);
>  			u64 vram_offset = IDENTITY_OFFSET +
>  				DIV_ROUND_UP_ULL(actual_phy_size, SZ_1G);
> -			u64 pt31_ofs = xe_bo_size(bo) - XE_PAGE_SIZE;
> +			u64 pt47_ofs = xe_bo_size(bo) - XE_PAGE_SIZE;
>  
>  			xe_assert(xe, actual_phy_size <= (MAX_NUM_PTE - IDENTITY_OFFSET -
>  							  IDENTITY_OFFSET / 2) * SZ_1G);
> +			u64 pt45_ofs = xe_bo_size(bo) - 3 * XE_PAGE_SIZE;
>  			xe_migrate_program_identity(xe, vm, bo, map_ofs, vram_offset,
> -						    comp_pat_index, pt31_ofs);
> +						    comp_pat_index, pt47_ofs, pt45_ofs);
>  		}
>  	}
>  
> @@ -381,8 +398,8 @@ static void xe_migrate_suballoc_manager_init(struct xe_migrate *m, u32 map_ofs)
>  	 * Example layout created above, with root level = 3:
>  	 * [PT0...PT7]: kernel PT's for copy/clear; 64 or 4KiB PTE's
>  	 * [PT8]: Kernel PT for VM_BIND, 4 KiB PTE's
> -	 * [PT9...PT26]: Userspace PT's for VM_BIND, 4 KiB PTE's
> -	 * [PT27 = PDE 0] [PT28 = PDE 1] [PT29 = PDE 2] [PT30 & PT31 = 2M vram identity map]
> +	 * [PT9...PT40]: Userspace PT's for VM_BIND, 4 KiB PTE's
> +	 * [PT41 = PDE 0] [PT44...PT47 = 4K and 2M vram identity maps]
>  	 *
>  	 * This makes the lowest part of the VM point to the pagetables.
>  	 * Hence the lowest 2M in the vm should point to itself, with a few writes
> -- 
> 2.55.0
> 
