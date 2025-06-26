Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30630C7EE32
	for <intel-xe@archiver.kernel.org>; Thu, 26 Jun 2025 22:37:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCC0C10E913;
	Thu, 26 Jun 2025 22:37:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YrU5RccA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C85810E913
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Jun 2025 22:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750977445; x=1782513445;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nZuWvzqnyYwbtLYMKZfO16x5bzDM8Rw2FbI6cSzOqkw=;
 b=YrU5RccANcxh6K+elrSbCZvh9PYw5trMPwoCrKAf63RE0Px0y+rFTEZf
 YknVB1Ht70Ntq0HwR7JGq2mxv4FvJb71jjKkkoh3zdRPJl3tJJDeMQ2zI
 7vYzadYFRH8rdk6qoVl/+BNKfzAYQzePYM8EzHtpOZac9jcgHNJ4SfPuG
 8aF2QmUmsuMPFWALcJ+XmP5L3TDM5OtSoHp7s/kjqiE3qomHRWkBaPAVM
 7Ft0nyjlNc4th767q357tVpZhS39QoXAl7yRJAvrjgx92L8ST0B1Pcn71
 UH0igO/7eGD3ay0o4cGE718WaV4T6QMp11FH66bDTcPjRgSeLAkG0BH7z g==;
X-CSE-ConnectionGUID: ERiSq9tTS568cY0d180Dng==
X-CSE-MsgGUID: cywZ2JqoQUOf0mWCNnesYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="52408607"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; d="scan'208";a="52408607"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 15:37:24 -0700
X-CSE-ConnectionGUID: u+ASAkelRjS0koFvPTLtNw==
X-CSE-MsgGUID: 3mog+CimQOKpug/rzcRlSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; d="scan'208";a="158126978"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 15:37:24 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 15:37:23 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 26 Jun 2025 15:37:23 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.42)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 15:37:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G3srbvUZA7es1vkSZcK7Vr6uzRgurqRZ/8/AiT3/f9P60RSioPmAZOjOQMfCfqx/CjV8GvuMiBo43wzwRxVhERisdTab6f0QciJAyQU7ggSknixsfdxPVrbtDh3FJl65pJd2wVc2u7scwD6B4yFb+enKXk4iC/AyTPphjCwz7Zr8/VCR8bBVsn9AKtLh6g0ux6u78ELWgFfhBQo3ABtldQB9/VutXtsdUWDFtYMDmeMzI7lvrz1ufC6H4A36X/cJbfW6aooFchKgyaVHXcJDc4oUDGuwxwpQAo4popz0ItD+5ai/szxkitCv9qkS3qyIaHjngViYMYLcHKRkCB04WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kdASvnPwKSLC8Z7s19xXdmQ7XJ9b+vxfMPg484Wu98k=;
 b=K5MJVmforw3jvbhUWYU5EiZG16MI/C87Y9ah20d7JNybcTXk1hzaYWJEIiUv2EJo+5ZiEWKXNbi0CoJM21OTMSwOrUOaP1Eit1OnKIq4OTVIjXYY6TRAiVjdAptM8/PSRM68Ejwa1oiKsQnfq2ZGK8ZO2F1Ifpu7u2cB5IfOn9xWo2F9Us4+YCDkBsJ7grnJYvJxT1G1iHUnVK/Bi5JqEW8LbNFEvCREFLzvqbr2NGsCN0WtGlDXrq2tTf0hq0rGV8iynyRhLTj9ITN4QkqySgZh3tA+MkOEsFYAm4hDPUt8vPGpwbi9hM7KIZaQsIhP8j/gUfaNYnbA4XFhrNLKkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB6055.namprd11.prod.outlook.com (2603:10b6:510:1d3::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Thu, 26 Jun
 2025 22:37:13 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8857.022; Thu, 26 Jun 2025
 22:37:13 +0000
Date: Thu, 26 Jun 2025 17:37:10 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Atwood <matthew.s.atwood@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.d.roper@intel.com>,
 <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v4 3/5] drm/xe: Move Wa_15015404425 to use the new
 XE_DEVICE_WA macro
Message-ID: <mlk224v6t7tacolkmqp6mu4yp4dhxxm4ldjjtv2qi5nakmr6ft@77vuqledlvy6>
References: <20250625200751.205166-1-matthew.s.atwood@intel.com>
 <20250625200751.205166-4-matthew.s.atwood@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250625200751.205166-4-matthew.s.atwood@intel.com>
X-ClientProxiedBy: BYAPR01CA0046.prod.exchangelabs.com (2603:10b6:a03:94::23)
 To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB6055:EE_
X-MS-Office365-Filtering-Correlation-Id: 46d8f222-b677-4496-c869-08ddb501feb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iVw4txlSR9ES5f/8NktYk8ooB6G6C0R2o7tUERj5KXj6hroZx57fzC+/vHMp?=
 =?us-ascii?Q?R1pcc7xkZZb5ucLr4drTkv8PEKlY91qwpdpwXz/TJ3+XxVzPlmhTs7Ig6yxf?=
 =?us-ascii?Q?y+Kf/lNKfzWkrQWXb/te+Kg29gCIdV0GktQXB+ysAPMmNhqyxXdJj/hDEm7S?=
 =?us-ascii?Q?AocJsBVDjRHkqtW+rIXQKUrvVAHwIS5/qc1vfpp1wNOsDMvO42hcghBUKBVG?=
 =?us-ascii?Q?UdaWZqd2N+Lm3cETIo/zRg7vhCPzf8NVzVYXkoNJV2yPwQtEhBS2lYHpTZMY?=
 =?us-ascii?Q?BL/8bi5nQdZLwcfI2J4DeUFc8TZ17sleHragXj6LC5UxWV4CBIbNDhm1p/Y/?=
 =?us-ascii?Q?jP439pRojs6YUZI9id3X+Riu86vDwwRc9mz6+PRO83BsM/JLSK8DGOgcd2HO?=
 =?us-ascii?Q?jlahvngVZtnxHyHHdRBcYey3Pb1AyfnwNATvrxdxnDcItdKBPkBELYEYNpK9?=
 =?us-ascii?Q?HyPCerv1ismHb/K3tuveTf/wdy/i13wmUP0WDZAvavcSBNl3z95mZRcs/nmb?=
 =?us-ascii?Q?N/pcNZIu2WIgmfRoPtgRjWWjCufZDMUMMU7ksUv069HJl6P0zUzYDKkKBjC/?=
 =?us-ascii?Q?ZLmWosKCYUsTH/mn0vv7+yQrlVqUF/UxPDWCWfIyUZzyqMEa80NuG0188MMw?=
 =?us-ascii?Q?Rq1SpWHghPsEZiIdgah37E7D7B7PRTs5oH3tol5Hzx5bzkVkXCDZ3wk9VJSn?=
 =?us-ascii?Q?/c1lnH7JgAxwjfreIqnVOKmGtTpBoAaWrdz4iS8K1aQ4bsh4FibqcmqCCkHn?=
 =?us-ascii?Q?1IDfQw4of330lCuNI2E6nziJSp3G/Onjecy89A1eVEVsAVBzL+0j+vOf42US?=
 =?us-ascii?Q?cHAOLugWqmnkAB07l4n1nOh0GAUdA3BtTfmhr+5v1pU7Kc1sLDBCgDvz20y1?=
 =?us-ascii?Q?s/Ft973xbt+6mQwtlT8S7gQMjciCqYNyMRFwVEy3o+KI4rkwhWTH+Kkxhzk8?=
 =?us-ascii?Q?CO4b83FAeX9LDy2g4Fcm33jrZaoso1VfBjI0LgK+w9q8LvmEskBHC5tOh5Xo?=
 =?us-ascii?Q?V/Er+zZJq9rXbtsIzYnQwBp1HUw8lMbgg1a/Yssk6Mxi3n1//AUuAWwK5CEl?=
 =?us-ascii?Q?ci/FGTdmOso+0uoEZ0y5R8gIKNVqXcGizkin3E5+DRB7eF0Z0zKMCR7EAdZP?=
 =?us-ascii?Q?W4PLtx39YUX/9q/nb6N62wkqpPR5jpFdNY2XdY2m0iFR69dR3Z2fNSGgYacU?=
 =?us-ascii?Q?YdncaCp+zbauyqhwOBI3035hcZ8/Kf3jgd/U5VLXbGGJcx0P8ZafOvqDlnQ2?=
 =?us-ascii?Q?RNCEwFNTWT7gbvNJCw88DPOtOiet/ZQM393gTGn2Nm6Y7Rd0NhAQYEkpQrgw?=
 =?us-ascii?Q?0AZ6gKuNPfKlj+K39T+26GV7VKPxrW7sxJVEZmbZz2MtbLlf3h/IhW/l6tpk?=
 =?us-ascii?Q?14oG4XLZfLEVALhD0oNBZ8PX/uJkwdxUxddcBOVvS3Mk391k/t+CdldaHSdE?=
 =?us-ascii?Q?buv5EYiroFg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lain+Cx/8yW6QhJF/ia9Moje7V5C6YH9bFH5j/FNTKhAhVHu6jeFk9HahEqS?=
 =?us-ascii?Q?6+phvTFb3XBnrtFty4KqKoSyPb93pWBgSDMdN9xhlVgL8BBKWGTVHMufOg93?=
 =?us-ascii?Q?AcAhMuAEa4VCJpmTv2dQEAaCk1A03sAkFeTnB5dXNbYYa4atJvwSAdDMlZ8e?=
 =?us-ascii?Q?m3fz04/7WJ3Lg27RaY1oMxKjSXjFjmuw41KuhRdEvnEussRr9zIyDmOnKNhR?=
 =?us-ascii?Q?/+G4GFy8YCxNMH/lV9exdyWtdwBw9aSiEjIJJLJKjBZGAC4WbJRxxssZs9jO?=
 =?us-ascii?Q?sFJv1IDLiiWTBhK2a036ohndnYGVTTc07Xam+a8w4phCFzNS77SiZiUikz3N?=
 =?us-ascii?Q?7hDFAiDYbhlGwqXQo6BuRfN5RWg8264IIPb59vI0OIXeCVewGVauO1zF7rq1?=
 =?us-ascii?Q?DVDlnXi8v8+taGCdgwKwKnEDr9OHZVbI4RsMMDSS4NdiPTq7yjD619ldRBrC?=
 =?us-ascii?Q?vmGJLwfYZnU5dkX2YN3/iBuv0lH80YcMaG/J6S5a/51aymF4uMyN+BEc40B2?=
 =?us-ascii?Q?ljq7hseRme/f3dBM1d6bk+77hlhcDpdVFhEBzCbZ9AjK2tFctd+SePsD78UN?=
 =?us-ascii?Q?loMzxK5xOb3UO93iWGGG+8NIrunucDvjAblYSqvFmaUV8W1tOqtXnqPrDKda?=
 =?us-ascii?Q?YlAQulFGjwkUVSBeb2Gk6yMpuewCWaZm4//ZwbQ6qnnMPROn9ZS2ExdQTojx?=
 =?us-ascii?Q?1nMO7mum8S7wwLO1F+2XI18QCCKy+gY5HRcanZ5UPjGE0q0YrRm3JPYaBY0l?=
 =?us-ascii?Q?wX1Ms1UGMYwzczf+zPENqGg3Pd0wlF+gSV1PsXTkSXhprbaBegutXXH+bX+6?=
 =?us-ascii?Q?abZqcj41EZ0i1R9mGZllS/EIBpCpem5Z9ywb4qtkVY4O/5DckcABc22fuCt0?=
 =?us-ascii?Q?GXw63y8lm+BRvLhs+iD4+voRv2p+tQKFn2c1wDAhHLwzb7FEzwd4qz/+flq6?=
 =?us-ascii?Q?wfsExlhjVofPudOosT+QaVbpnMk/v8AwyvPVLdF6KOqkMzWYUvDwbvWIvrny?=
 =?us-ascii?Q?r5PCKNmzsGYdCY5DnkoqvVlNi+Sb+3mB0pDB4ieJAX2GFcQmIN5kJS+WLXjU?=
 =?us-ascii?Q?5V157B8G+m2B1mi1yQZWFwoxN6s0EpNz3QRQsAtFep1dGWSEKuQQWFFvQQZd?=
 =?us-ascii?Q?i3N8m7YIfcazaRDFE7P0/ej89+ILCz5vhGufJlFPq72i2rGlBBH6XS8UU06a?=
 =?us-ascii?Q?Es8Cfzj3EKeJ/btJ/an70z1gu9+IGU/YyCjUFWx22aSLPPU1ajuRMv4GhQo1?=
 =?us-ascii?Q?4Os2smlyLqBuKSpFM42yzUzp/Xivv20psMUOB6F/8CdVfECPm5qBNryUpxdb?=
 =?us-ascii?Q?Fs8Jgv+JBD6LAoAK57WemZGvmrymQgY2wn/LASfgOBGu7Bg3GRf12Buc9Do+?=
 =?us-ascii?Q?THgfBrk7AmVmnn5D8Y602PKwja8zaAo+75K0/3NCrQmRZKaZwL9LdhfydwoX?=
 =?us-ascii?Q?TP6G4/Wj6lFdpG77xkFLLinc2qYIF8jtTb2JI49ttzwfUzg6IjkZvZ9yDcG5?=
 =?us-ascii?Q?Gaj5ji1ZN8NPo5IOjbLqbpyyRPVh6G4/Y6wUOxwsb6eNsFP8G1FAe1QU/Atk?=
 =?us-ascii?Q?Trzeafc3q+ExWtDLmFQ3KQVBl+egOrFzI1MQiWLwiEjxvIq+6z1/MH9C8w5D?=
 =?us-ascii?Q?VQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 46d8f222-b677-4496-c869-08ddb501feb0
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 22:37:13.1434 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JWGQaE9D5YMet/T+X4uMygK+KAuMPmKd1u9GWIzMaSwZLaIKHbPfP5uJjGw7Wtx//PJ2tY5MuX3yfwtisj4hVhpnac2MuHx+1PwoROA+4Gw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6055
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

On Wed, Jun 25, 2025 at 01:07:48PM -0700, Matt Atwood wrote:
>Move Wa_15015404425 to use the new implemented OOB macro XE_DEVICE_WA()
>
>v2: rename from SoC to Device
>
>Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
>---
> drivers/gpu/drm/xe/xe_device_wa_oob.rules |  1 +
> drivers/gpu/drm/xe/xe_mmio.c              | 10 +++++-----
> 2 files changed, 6 insertions(+), 5 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_device_wa_oob.rules b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
>index e69de29bb2d1..b7d12ea4d65c 100644
>--- a/drivers/gpu/drm/xe/xe_device_wa_oob.rules
>+++ b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
>@@ -0,0 +1 @@
>+15015404425     PLATFORM(LUNARLAKE)

I was wondering how you'd match a "device" WA. It seems the only thing
we can use is PLATFORM. Maybe we should error out if a match that
doesn't make sense is used?

>diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>index 7357458bc0d2..8226b220940f 100644
>--- a/drivers/gpu/drm/xe/xe_mmio.c
>+++ b/drivers/gpu/drm/xe/xe_mmio.c
>@@ -22,6 +22,9 @@
> #include "xe_macros.h"
> #include "xe_sriov.h"
> #include "xe_trace.h"
>+#include "xe_wa.h"
>+
>+#include "generated/xe_device_wa_oob.h"
>
> static void tiles_fini(void *arg)
> {
>@@ -163,9 +166,6 @@ static void mmio_flush_pending_writes(struct xe_mmio *mmio)
> #define DUMMY_REG_OFFSET	0x130030
> 	int i;
>
>-	if (mmio->tile->xe->info.platform != XE_LUNARLAKE)
>-		return;
>-
> 	/* 4 dummy writes */
> 	for (i = 0; i < 4; i++)
> 		writel(0, mmio->regs + DUMMY_REG_OFFSET);
>@@ -176,8 +176,8 @@ u8 xe_mmio_read8(struct xe_mmio *mmio, struct xe_reg reg)
> 	u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
> 	u8 val;
>
>-	/* Wa_15015404425 */
>-	mmio_flush_pending_writes(mmio);
>+	if (XE_DEVICE_WA(mmio->tile->xe, 15015404425))
>+		mmio_flush_pending_writes(mmio);

why move the check. There are 2 other calls mmio_flush_pending_writes()
that are now not protected: see the read16 and read32 impl.

Lucas De Marchi

>
> 	val = readb(mmio->regs + addr);
> 	trace_xe_reg_rw(mmio, false, addr, val, sizeof(val));
>-- 
>2.49.0
>
