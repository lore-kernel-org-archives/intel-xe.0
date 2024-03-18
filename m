Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7724C54E58
	for <intel-xe@archiver.kernel.org>; Mon, 18 Mar 2024 14:38:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D0E610F7CC;
	Mon, 18 Mar 2024 14:38:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HALpcOU0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 619CA10F7CC
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Mar 2024 14:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710772729; x=1742308729;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gHE59LlW++qmuLFprCExTopug47gMN1w52u/kguuKz0=;
 b=HALpcOU0EhDtQ7w8W/MkUMg1eWslOpPOAM3IB0lC2e18nAOBRQr7pVr8
 aHnAEQ9e9pHxBJvkYSE3stse7grInT4Kg1yaXCdEZLVqGSC1ZijCS20r+
 u5aEmdvuy6LvY5Pl+U/T3EtnjDkcl4NzV14SANVwIE01Kn5ydQ0f5JfOo
 YyGYAg1guh5WqlY9HUAoDfFQT1BS75OeFF0V7HKDEpUDA49gh9ltdGDkq
 5mZt0kspyahrMtKmkDF3jCLVSTxaEDcNvGJunES27ZNnzyMaDdi2CxYA7
 5ilzOGh5Bp+EIoDoV/2/VJx7G941SDZqJE7FjE0Jn17AoMax9YT5zNsm5 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="6193523"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; 
   d="scan'208";a="6193523"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 07:38:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="13519872"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Mar 2024 07:38:49 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Mar 2024 07:38:48 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Mar 2024 07:38:47 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 18 Mar 2024 07:38:47 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 18 Mar 2024 07:38:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dppLhsXLR2oBSCGTOpaeQVXuA8Py/LPhmGYAoJkIl4XZivyvdnsm7B4KN2ZLdVQxb73jGn+hY4wufspDvf1X8CkAW1uVO1EjysW9a3znLU0lMzxzip49tpWJCmNE6xJrv53j5iMBNHbxqhsvE1msT+cGJXOybQd+zKd7FqiEbOHhBZ0CCiP/0TbyNe7w0vWvPTwEZFOibAiS9ngR5U1hjXXBVjgSrELfondIso1j4buMLIFtDcrd998Qucemq/qoX5ucNRHj8q1ZVo70/j1yvb/ssZKrhBFuV9o2DCFGzRWp5eTxUzQ+qXPuLxqLU8RAITCwxGmbsWUL7c+urNFKeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vgwCcHEOPXLOMunJco4eTa7iID7p7hjWgY05EuXMIiE=;
 b=RwGVpH6hA2uoaFY3knfqjWPOx81LNlW5OUDSiI2i6ZGY+lMvwIG9QGSUC4r23SbLlMN9KBda9dUG1OMZLifIKtE6k4iTstCm/KZOV8fslUW27OqxOZpLhAeJZAo+BfaXkpUxVR5iIVtSsCKupX6rD5CeGGvL5b5VgzXxZ+snhEK/Olp79FTI90L+fbWD+WYgcwat4IJL2Zp7Lc+HlwtqlhMNXqRekuCREXFLvbKHaZDAGADKsfnXJ+XTkerp7Yd4U+Bd/7YEY0eNwFxEWcvnL6nlqN/5cYgulJLBttg47iWl7LyY4E0Jmn+K2AMoY0yWchlf3vaVhpzkgID6TjFTaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB7465.namprd11.prod.outlook.com (2603:10b6:806:34e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.10; Mon, 18 Mar
 2024 14:38:43 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7409.010; Mon, 18 Mar 2024
 14:38:43 +0000
Date: Mon, 18 Mar 2024 09:38:36 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [PATCH] drm/xe/device: fix drm_WARN_ON() check
Message-ID: <n3ifwq53z4tiz3brimofvwx53ixetx7yzgdwtjtny6xtvi7jv2@lnwp3n3nmqpw>
References: <20240318113708.32938-2-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240318113708.32938-2-matthew.auld@intel.com>
X-ClientProxiedBy: BYAPR07CA0086.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::27) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB7465:EE_
X-MS-Office365-Filtering-Correlation-Id: 259f136e-6c9f-4f5d-2ba3-08dc47591c5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +Ax8TxzQjiWSOEy8bDR2vmQQWtYWDGrpNwqtcRuAm+wNF7A2Ql8VqW/i06uxk6F2n0Qw1WrCfkzyDNv15TUtRFCd7nFhm9c/yVGAQtJ4gGVvOK9X544sblGxHT2tsx35YXMVbxNuZv25Pnmtt+lTPlkgSjfw5fLeKu4UjSSwr34XbGTLXGfIhYxvq8MvQt1ZXGi1kOhAxouy0FqJhJMmJik6iJb11hjSPqon8iMSnEmf0ooP1MYePVUX3/bJscDDExfkS8IBixHjxwC6l1W4r4z0Hf0myHjRgC+gV6cWEu9U99blU5j/3b/RLm846p4ysmxpG3na3rLcf5i0OO7jKG4Tjp0lT5KKR/kXbf+XO6TZHtZwaUOBL5RQHPh/MoQqaRiOTtM5zWVRUIPm6S1ZnAqc0lbnPJ0jQcVbN/EdhG1fgoXB11M9uId8u49Q/dR5LADHaUt07dFKHmMkiGHkGmiD94R0kGylRosYZt3TZY5BH5MTrPOJWK6IcLddPRkUN5ZHCBLpOtNxaqAoiE/kJN6HOS8SLPvNEmIzdUrBIiuXWnP5IDHb1zSYLfvfHtixqvGrWz0Ja562oVJkCq5BJLE7qHAReBtZk5/8DsCBWzdpq2JIjmhrJDwI3IWrm/Y01PHFmeCKK7R0bUEmHrkeBAfyTVEaMuXlusX9wah4dVM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GwVXt6H0QBY/zjZyv1qDVEwKlh2QKqQXbR2yTM1YxEl+4nS82StuYp9ymGbY?=
 =?us-ascii?Q?h4KVGeDOcFWyXvD/FqZ3oLMxXCXhD+cOpWWXpVgxU2BEfE92WzX6okqttGD1?=
 =?us-ascii?Q?qN8mweSkrq1iY288uokxDFXYiD7GEsfbtDBMO2vVw41PcQkKiuHMSQf/fesr?=
 =?us-ascii?Q?EKK5TTaJq7MEzWknM72T2yD/jVazFdz1kBawJhU1xVWqgbcuw2jqwywZUH1r?=
 =?us-ascii?Q?MRJ4ZttIuHopPACBbbl8bNFtu+pNDKtPYKBIhrT48kUHYvF/GwPEtJWWPbOC?=
 =?us-ascii?Q?N1LshcPqAT93I6dop2MwrA+9x9pmlxekZJHva56lng4yYcJF9EqEB3IR3WlP?=
 =?us-ascii?Q?qNXth0Nluk6a35g4TB4Yk6cbDOHR2BU70nXmuFiuM+z31h70t3a+HrU+4v5L?=
 =?us-ascii?Q?0RJrCxMD6T9WpXewmx9zGpPngPIzx3kExDqQECOd6VhG+F0B76w6plEaXzW2?=
 =?us-ascii?Q?LHkdLn3bbk7SNIXbDmi459iHeNYv2qtcw34PFy4hlJR2sModYfvHRwLJs2/F?=
 =?us-ascii?Q?NfCyEO4BL56bXo69DScxYmK0lHNkzbi8biEBZjTHPs1X03bfXnggP7wrOLu0?=
 =?us-ascii?Q?4+NShKLFVW36d+JvCTdu6VXYA71qqB9Ch9nrNyUrSObP/aeIFcGhLVZ5/uo9?=
 =?us-ascii?Q?tbs+qI/rZ5iqm2eB6u5/qkEQ5oST9/R9OPfP6GS2RX02XQB6dlFj7iQ6OwFa?=
 =?us-ascii?Q?0AFrXENuhWUv8uq1skFL4pRQu1iwl9nFgPE3ZyMPOOOR0YHHa241LOroFEeK?=
 =?us-ascii?Q?kGxWHLq5xFKiO2TkvnDjf2JXJMwYHkYAnqPsm28sfEK7eKWiedr2s+jW8+UB?=
 =?us-ascii?Q?9QUaGRlgS1kZ8iC3fNgHUjynaHOH79dxjmdQojFwRie47w8fux8j/S+l8s7R?=
 =?us-ascii?Q?iYW2yqSK82Xi4cYz480uJCP94hRdRuezkUM176rux/luiY/bPN0G2nmfBMHq?=
 =?us-ascii?Q?V3Q5gl7T0jWS/MjMvvWxcwTbjXthpWbBytGRUHZCjyGKSbGf9B0YGOkhqgn/?=
 =?us-ascii?Q?2SXI06g7Q3GhDXOtkDh9ChRHZnyb1Gfh5L/t+4h2qwDlM+ArzOPcdNDLHZT9?=
 =?us-ascii?Q?H23ACJ+JHKp7T2oDY+sQpnF6ekELciNIVwBQQOgVtL9syB6gVNhd8i9lEbk3?=
 =?us-ascii?Q?1jQfGm7kT1WPETuA2Rvf/Ai9NoQM0BLFdFSUkHCwbygOpMhGjBqpxEnmJiTB?=
 =?us-ascii?Q?lp25lilKvyfKToAxFGTTgzwlz27tRw+r5pNh07zo6noYcF8OTB5UIFScKuN+?=
 =?us-ascii?Q?a2qn+Psm2wAvjUiP8jUUgX4pgHxDZ/KO6NsloJDduQ8XvJWGG6Oci4/qg/XT?=
 =?us-ascii?Q?hel4D+jQ6oxG7cxtthP+yUnax9xc6ur0t47Z8S49/JQLR+2liGA5iwsGLG3n?=
 =?us-ascii?Q?ghJL3ZR0BoOEDyBAPkDnYPqNDYQlsYMyJK9p/NgMNaDRn1ATgIqZ6v/zYYjn?=
 =?us-ascii?Q?JqYuQe1fpg4Fi+Ge9LSp/iiLShIxf7/5CZYBorOG6JwziNtsq2Sk4rWR017k?=
 =?us-ascii?Q?gEa7z/c5bsPxGfBxbsy+ng+ICPGwpYggCyFr9F1koGzpdyxzZUAFB3YyS19Z?=
 =?us-ascii?Q?Yfp9Z89e/hKhmxvhjt22kQIUmsb32Q0a3clSPQ7VrLGpRDrO+g4Y+ZKj13DM?=
 =?us-ascii?Q?/Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 259f136e-6c9f-4f5d-2ba3-08dc47591c5e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2024 14:38:43.4849 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l0tGS2ELGc7EltqZM9656GwxuTPKLwQbyvT4CNAONhxnCk4LQX0NCvQtLNz4/UhFv2p5tZQTW0gIqpEhES6LeqzyoLWSOZtQ/gZyzW3GOHQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7465
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

On Mon, Mar 18, 2024 at 11:37:09AM +0000, Matthew Auld wrote:
>Here XE_MAX_TILES_PER_DEVICE is the gt array size, therefore the gt
>index should always be less than.

I went through the history and the bug seems propagated in different
forms since the initial commit. So this probably deserves

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")


Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>
>Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>Cc: Nirmoy Das <nirmoy.das@intel.com>
>---
> drivers/gpu/drm/xe/xe_device.h | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
>index 14be34d9f543..6b32f09a4c89 100644
>--- a/drivers/gpu/drm/xe/xe_device.h
>+++ b/drivers/gpu/drm/xe/xe_device.h
>@@ -79,7 +79,7 @@ static inline struct xe_gt *xe_device_get_gt(struct xe_device *xe, u8 gt_id)
> 	if (MEDIA_VER(xe) >= 13) {
> 		gt = xe_tile_get_gt(root_tile, gt_id);
> 	} else {
>-		if (drm_WARN_ON(&xe->drm, gt_id > XE_MAX_TILES_PER_DEVICE))
>+		if (drm_WARN_ON(&xe->drm, gt_id >= XE_MAX_TILES_PER_DEVICE))
> 			gt_id = 0;
>
> 		gt = xe->tiles[gt_id].primary_gt;
>-- 
>2.44.0
>
