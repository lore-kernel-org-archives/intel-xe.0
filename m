Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B622EC7EE2A
	for <intel-xe@archiver.kernel.org>; Wed, 25 Jun 2025 19:08:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A1B510E131;
	Wed, 25 Jun 2025 19:08:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UhwE2QRg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B56BC10E131
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Jun 2025 19:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750878482; x=1782414482;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=A+dT3/gGc2xHMG9FYFtSgOso6RBFRMZC+ZJDNdIWSdY=;
 b=UhwE2QRgBMmBqrMM/bfSmhRDNZpWaHyEw93o5mnyI6IQrpVT2dBAkofY
 VWT3TuB7UM+OjReww53HNsaNw9NFwJHHlvpbcKE4sgEW9Gwz+8usyzz3w
 0ATWeGGylhbmoDKVgzJEvNxn7FrARJkzLkUou71ViJLKgb9PDRjlbdiHb
 gHJPLax/PmfidJbViXWTJZcgBqShVfPHBl60Z7zfHsRuIGcjwyC0j/oU5
 ykEtK7dUWa54iZCsVHJgNTJ+FssgzBeqmli0MLFlcSiwASNpn+bUscVGO
 fax9BmS6yfETjvurcaN3SUVpGYb+OikykJXcxKyHZe3ZU2heshbca0wQG A==;
X-CSE-ConnectionGUID: n7MprQcnSUmHZ2ab5hd+7Q==
X-CSE-MsgGUID: 51kv8emMRbSrdaY5WBe2og==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="56964975"
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="56964975"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 12:08:02 -0700
X-CSE-ConnectionGUID: Wy265AAiRR67WpcRRQaW5A==
X-CSE-MsgGUID: JZH7iMLXRN6TkDXGPslN5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="152603052"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 12:08:01 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 12:08:00 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 25 Jun 2025 12:08:00 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.68) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 12:07:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pLr7UW7OQNzAhdbltor70qQqwI/qBrmjH10llmrCR/dxZ9O4eL8Szr5OnHkajzHeOJpJu/DmT1KHrEFXi15so4UB5rahFghkhuZWiBqXQ2fphiZ6wPEkzAJ6+uWHLFAclXK2rjIma8xUg3A84AZRAzhx6jEe1jiZ98FD5IE1MRZv3vASOiTEgK+xEGfnPuLkxsUbfXV8j+K5oSH3R/+L+lx15b2H27Q323a9LO2JUXoRGR2o4vwY5tE0xdIVly+nOqWODSkB4nAp/LAyE9E2eOzw4oQd47jWzGPRdEdPZQkkTk82Ke6g0APsqi6t5AW6FQ5X4nxJd2gWvhmy6ZKfaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T5XbwnOdzdrgMs4pdjXiG3oMBELDPUMZSkKMt40Cog4=;
 b=jdl3xxTz+xTbOLIsHNkJ2N08kA6UlrSFD77uCmUBdV/HplAZxVa8bgpNnZszCXP/yR8OaIkKtTK2pNISAn+mvLa2P7k8owYSem+TU8y1s15Z6AVh95vwxR3WWGPt+HJO7uTmQknW/m342k4+v66NL8VWoEx0584hOLYW9j5inQ4OeWL4YtBYJsCsobLpVsgGxD1Lfx9C8GBEcbKjDt1gwYwv2l98dZvXBrQ5ZDYxsw/djTMEOa3GoKkTUvx11s3tUJakhWhdFAWe5GMzOmLkdUL5jjqfjKW9B0APfo5t1/JbvsSoi4bj6osbg7f4DgbCRtIxlR+UxbfEy7Jx4V/bgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB6168.namprd11.prod.outlook.com (2603:10b6:8:ab::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Wed, 25 Jun
 2025 19:07:57 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8857.022; Wed, 25 Jun 2025
 19:07:57 +0000
Date: Wed, 25 Jun 2025 14:07:52 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
CC: <intel-xe@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH v4 04/11] drm/xe: Make it possible to read instance0 MCR
 registers after xe_gt_mcr_init_early
Message-ID: <ilqhmnv6a2p2s5l2ge6anhiv4rx2rszcewfuhskf73xs5qlmbl@u43bwjn6pwdu>
References: <20250619104858.418440-13-dev@lankhorst.se>
 <20250619104858.418440-17-dev@lankhorst.se>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250619104858.418440-17-dev@lankhorst.se>
X-ClientProxiedBy: BL1PR13CA0175.namprd13.prod.outlook.com
 (2603:10b6:208:2bd::30) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB6168:EE_
X-MS-Office365-Filtering-Correlation-Id: f233f682-2e07-4327-cfc4-08ddb41b9875
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ipU6WPoSmVRKf2RIPgE1yF8meuY3AUSfcAqGSyJd90tknKI7cm0s5NiJjjQb?=
 =?us-ascii?Q?2EUlfdYztp6fsYMHyT/YLFz2uleuCVCeAeBjshgvndY4BIKEMgtQ9E0XYKCl?=
 =?us-ascii?Q?K79yDg99qcZNrUkeAdfyuJUr35jDDtku4gE1xtbcLDekMyJXifdWyAv++tST?=
 =?us-ascii?Q?Ttwu4KdLzqJ5PLX7Ocr+MQZw5tgl8+qKcDuMFFl4mmX8K2i7P8xiTGysNZsD?=
 =?us-ascii?Q?BTbxnXVSiFa2FWZME3fDUYAfobCIirbQ/y4AWhS4fc95jgPftIZDraRUMrvF?=
 =?us-ascii?Q?BmpFlxpf+n7s/VipVwKZGAWiwN+0vGefe2TqCaPYMqUL91igDtbD5QxV3zrN?=
 =?us-ascii?Q?mhML919NGi7Jq3SNy17FxKg936UJFqyZYR1VmP3AfPvioiVFcdlpntviit1N?=
 =?us-ascii?Q?MMTAyhmkG1EG1/Tk9Mb5dyIJPZVkzPNMoIIeX5iQUUjJlDLwsqTDXX6JMuF8?=
 =?us-ascii?Q?iQ0aJc5c5Mi+4CFxmgjmrgfSwSyG1WpdcH3+oHchILgNWqcJeNeDOI9JK/Ph?=
 =?us-ascii?Q?XDkIlCHACLbJQqisGZaREyHB5rG4f31zV3KwixG5uSLY2dPsLcd+BIQVsWrz?=
 =?us-ascii?Q?sP04WkF+1Dc5eMlGbvBBEQbwuChpSRitlWYyxCQTjUjuH2DowWNXzHHACOSQ?=
 =?us-ascii?Q?UXo5SJZNhOYKyXxxDHzQZln2K0XSS0RYH0yc4+jtjlpRUbEENZsA9tlhLPvK?=
 =?us-ascii?Q?2jlVsu76uS+loo2DpUuKvdlh7Fx9o0WjBBdvRaEcEd7w8j4OV/mDyhyYQ+wy?=
 =?us-ascii?Q?FIop0hceS8hjjbQQ+pychT/r9Q4GAQuH/QpT3YpxNFpmiz0pSA6CiKB3bkIP?=
 =?us-ascii?Q?5isPXRRX68N4J/FMAYb9QtQzTRCmRBQDhwUktt6EMtu9gAo81W5nVEc8M0qv?=
 =?us-ascii?Q?iftWH/hW6jeE+mBAuxtiT2LSt3EGSCjmHny9oQpzS/aVRDaFAX9e6qujqhtr?=
 =?us-ascii?Q?77Aaw9Go0azlyRONPZ3hEQCuFOR2bxsmqC4QdADTIxo30j7glDYwGkzy6rqT?=
 =?us-ascii?Q?ZoC20rR0Sa3fOzlMViLX3kWaejpaqSHKcx/EA8K7q67aa140CAUdPnyNsglB?=
 =?us-ascii?Q?XFuWdvHfY0n3J323dv0XCAjdKS1z2C5kK59ZNdkORcj5OgeFBYUgIQ5Bsrug?=
 =?us-ascii?Q?82U5P8DFjZfOk0Nix7bdc5nPwa3dEvtUkJBcsZ0/8zboQMKHhYinoFaNYuVM?=
 =?us-ascii?Q?6/VGW+84cRLhLQRHJnMzkSRq0S/WCTLFMe3KUu0kl5ZnyyI3od0+2W36fgdR?=
 =?us-ascii?Q?FCha2VzS851Pk9RZvLn0RzILDNql7uXLOxJ0rY7xdwzq9T/UZWJzMJ5RdM7p?=
 =?us-ascii?Q?65oxaV/Rvj65ovqSkaA0fcyDQt8vNl1Ib1bNiE0TziMcIKk5nBPHpAjEl7Ih?=
 =?us-ascii?Q?BabWLMX6heFtuSJjY+CDbb7Jf8pc1vAfTGLZie5GijIOxXD+CFWgAdbdTgQj?=
 =?us-ascii?Q?o03sjEF+yvo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fmX5AodOk58Xo0c+pfDvLcpztLMv2Dr2c3aOwMD4hyg9UnRmmoFtzGOCkwI3?=
 =?us-ascii?Q?wBv0bWrbES7T930xcSgbxE02Sj6FNvYmFqKkNlAV6AlqWEweAS3RjcYNokKb?=
 =?us-ascii?Q?qB3ge6Gfniv0Dv1y+tOWFp5jAgoHGc+v8YM+lpCRKMG3xFGmoXzIIcHFEicx?=
 =?us-ascii?Q?ObxSAZVfJ7cEEnh28hnKdq/0loLQiPx7MNruPjFePZaenUJfsEJk643pJxr1?=
 =?us-ascii?Q?v9+PQPTev4rHoLkcxi9+rIBmdinr0LPWmVffnrJv1Op483jjNSGFKbbfobfL?=
 =?us-ascii?Q?XWniYvW2lafq0NDQoOUIvNiyHPBi1iSvhT+iJzdvk8ZKsgjbx9KGqpJXdEvM?=
 =?us-ascii?Q?s5CTUm85mBIWV9rdVy8ZTean2kMP80izg1Sxqp8r2HVUH9KVw/haVHZw5d2O?=
 =?us-ascii?Q?c5sTzNFhA3P1neJb/Arg2VV6y6UiAO7xgSsoCkyG1kdyREM6Y4KLBRhZLSJs?=
 =?us-ascii?Q?QSgVeL3+AEmQgmmhOspPWUR/3sZGzZ2wOGOIKobbxM3lA/y2I7ehQZpHR50E?=
 =?us-ascii?Q?zlbcutFELylsrxHfUErfAFAzBiwXo/+XzCZD+OtoYnuftC9LLJJtR5JdIsjq?=
 =?us-ascii?Q?U2Z4voG7PkpJjYISotaEr0LBSO40MCurjBZi5E14ee16ujNgTz676MvXtjeM?=
 =?us-ascii?Q?YtvsrbZuryppGYIeGmdD0Drb0RV+fUal4VrKSPw6cHQjfF5XR5aMe4OWfUQD?=
 =?us-ascii?Q?STM5kTR+Qf/gRscl/8bM/UBiPU705MVX69b4pHpVv4FfkZc8+TlmwyOcH4aA?=
 =?us-ascii?Q?7NMOzmZolWIGsLs1lH0KTfRia0utCUYSMFqRIsyrUyKFW5WzSfE+EqOQ1m43?=
 =?us-ascii?Q?2Y8K5iIZrdm3Ivg3pUQbVY4b72KU4zNlakLL6UV+8w+1If64r5v3eDmm1BXd?=
 =?us-ascii?Q?s48ASzKX9Tra77LqjJ5LoJmYbmcUsgIz0cypSTI+ndpxHRivLpF/UTheyLXx?=
 =?us-ascii?Q?reWiH/EQGO05TIUia1YWEmZY6KcLImy+72cuSTmcCAs/TChpBSLxcb+R3MFb?=
 =?us-ascii?Q?gxpb3TyVq4Z0yPhBtLPQjLWp8YY8ZJGZDPkm7jAK1W9xZhN6+W82yu+v2NH3?=
 =?us-ascii?Q?42DZMvfustW5Mp6kCqWof8CkEbf7hBtqQyjrRWWcNlM3XtiEwLolvBXhn9Ud?=
 =?us-ascii?Q?1SsdBA9J8DryFyfRPNcelZwoyqepDYi1Z/TLzoD0X9uVY4q7M4KLqHONEjph?=
 =?us-ascii?Q?9xg4g2YtASQ7NK8qXGtT5RP/yFzjucUD+B3AeklIANFiblltT+AILsM7Bg5D?=
 =?us-ascii?Q?b5PIBHoiGeTZp3uvu4cV7fwSIoGQOyTIMDvOnaKo9yqGC5uj4I8xmG2aaX4I?=
 =?us-ascii?Q?AcAOolPMA94/v0xd5dgjnLo1glnX5S/ROGjYO5WPZISUsE6Jr7WykJmyu8QK?=
 =?us-ascii?Q?6bmiFmuLXDQw/8F5fYTsTCZHa7Zg2Cl7zZYGrv2zrzg/uOSlsjm5BGuRgNex?=
 =?us-ascii?Q?6d+0yoA4+46uZgf62Ws2xxxdo0IWYs6xWE452Icg/J8ZByE/newQJzvsXxHj?=
 =?us-ascii?Q?eOMceXs/BdEPanIvUq3vkH32GNKzhzqTwjK1KPDzV1P5G7Av34meQ2cmS55K?=
 =?us-ascii?Q?4JelkKSCW/8247ImOjluWYVgC3HU5c6fkKz6aUbXATmPe7x2wtbwrnqH9ELI?=
 =?us-ascii?Q?xQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f233f682-2e07-4327-cfc4-08ddb41b9875
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 19:07:57.3057 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G/vxL9YLPDq6XzEcFx09ABEZI2UJ+SgrONyyBQeZZk+v6A5HfdhLrB0oHyNsa6tEJ+gCUZoVtCE28o955NYJJ6ira8K3gAN8YTB1NajlzF8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6168
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

On Thu, Jun 19, 2025 at 12:49:03PM +0200, Maarten Lankhorst wrote:
>After mcr_init_early, we need to be able to do VRAM and CCS probing
>without hwconfig probe. Fortunately the relevant registers are all
>instance 0, which fortunately means no dependencies on further initialization
>is required.
>
>Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
>[mlankhorst: Fix british spelling]

^ not sure what you mean here, but should probably be gone from commit
message.


>Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>



Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_gt_mcr.c   | 47 ++++++++++++++++++--------------
> drivers/gpu/drm/xe/xe_gt_types.h |  2 ++
> 2 files changed, 29 insertions(+), 20 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
>index d4d9730f0d2c7..64a2f0d6aaf95 100644
>--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
>+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
>@@ -420,12 +420,6 @@ static void init_steering_sqidi_psmi(struct xe_gt *gt)
> 	gt->steering[SQIDI_PSMI].instance_target = select & 0x1;
> }
>
>-static void init_steering_inst0(struct xe_gt *gt)
>-{
>-	gt->steering[INSTANCE0].group_target = 0;	/* unused */
>-	gt->steering[INSTANCE0].instance_target = 0;	/* unused */
>-}
>-
> static const struct {
> 	const char *name;
> 	void (*init)(struct xe_gt *gt);
>@@ -436,7 +430,7 @@ static const struct {
> 	[DSS] =		{ "DSS",	init_steering_dss },
> 	[OADDRM] =	{ "OADDRM / GPMXMT", init_steering_oaddrm },
> 	[SQIDI_PSMI] =  { "SQIDI_PSMI", init_steering_sqidi_psmi },
>-	[INSTANCE0] =	{ "INSTANCE 0",	init_steering_inst0 },
>+	[INSTANCE0] =	{ "INSTANCE 0",	NULL },
> 	[IMPLICIT_STEERING] = { "IMPLICIT", NULL },
> };
>
>@@ -446,25 +440,17 @@ static const struct {
>  *
>  * Perform early software only initialization of the MCR lock to allow
>  * the synchronization on accessing the STEER_SEMAPHORE register and
>- * use the xe_gt_mcr_multicast_write() function.
>+ * use the xe_gt_mcr_multicast_write() function, plus the minimum
>+ * safe MCR registers required for VRAM/CCS probing.
>  */
> void xe_gt_mcr_init_early(struct xe_gt *gt)
> {
>+	struct xe_device *xe = gt_to_xe(gt);
>+
> 	BUILD_BUG_ON(IMPLICIT_STEERING + 1 != NUM_STEERING_TYPES);
> 	BUILD_BUG_ON(ARRAY_SIZE(xe_steering_types) != NUM_STEERING_TYPES);
>
> 	spin_lock_init(&gt->mcr_lock);
>-}
>-
>-/**
>- * xe_gt_mcr_init - Normal initialization of the MCR support
>- * @gt: GT structure
>- *
>- * Perform normal initialization of the MCR for all usages.
>- */
>-void xe_gt_mcr_init(struct xe_gt *gt)
>-{
>-	struct xe_device *xe = gt_to_xe(gt);
>
> 	if (IS_SRIOV_VF(xe))
> 		return;
>@@ -505,10 +491,27 @@ void xe_gt_mcr_init(struct xe_gt *gt)
> 		}
> 	}
>
>+	/* Mark instance 0 as initialized, we need this early for VRAM and CCS probe. */
>+	gt->steering[INSTANCE0].initialized = true;
>+}
>+
>+/**
>+ * xe_gt_mcr_init - Normal initialization of the MCR support
>+ * @gt: GT structure
>+ *
>+ * Perform normal initialization of the MCR for all usages.
>+ */
>+void xe_gt_mcr_init(struct xe_gt *gt)
>+{
>+	if (IS_SRIOV_VF(gt_to_xe(gt)))
>+		return;
>+
> 	/* Select non-terminated steering target for each type */
>-	for (int i = 0; i < NUM_STEERING_TYPES; i++)
>+	for (int i = 0; i < NUM_STEERING_TYPES; i++) {
>+		gt->steering[i].initialized = true;
> 		if (gt->steering[i].ranges && xe_steering_types[i].init)
> 			xe_steering_types[i].init(gt);
>+	}
> }
>
> /**
>@@ -570,6 +573,10 @@ bool xe_gt_mcr_get_nonterminated_steering(struct xe_gt *gt,
>
> 		for (int i = 0; gt->steering[type].ranges[i].end > 0; i++) {
> 			if (xe_mmio_in_range(&gt->mmio, &gt->steering[type].ranges[i], reg)) {
>+				drm_WARN(&gt_to_xe(gt)->drm, !gt->steering[type].initialized,
>+					 "Uninitialized usage of MCR register %s/%#x\n",
>+					 xe_steering_types[type].name, reg.addr);
>+
> 				*group = gt->steering[type].group_target;
> 				*instance = gt->steering[type].instance_target;
> 				return true;
>diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
>index 7def0959da35d..96344c6047260 100644
>--- a/drivers/gpu/drm/xe/xe_gt_types.h
>+++ b/drivers/gpu/drm/xe/xe_gt_types.h
>@@ -377,6 +377,8 @@ struct xe_gt {
> 		u16 group_target;
> 		/** @steering.instance_target: instance to steer accesses to */
> 		u16 instance_target;
>+		/** @steering.initialized: Whether this steering range is initialized */
>+		bool initialized;
> 	} steering[NUM_STEERING_TYPES];
>
> 	/**
>-- 
>2.45.2
>
