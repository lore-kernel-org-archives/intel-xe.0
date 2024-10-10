Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7460ACF0437
	for <intel-xe@archiver.kernel.org>; Thu, 10 Oct 2024 04:08:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 453DC10E085;
	Thu, 10 Oct 2024 04:08:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jabN+tbI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 487D010E085
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Oct 2024 04:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728533302; x=1760069302;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9xw1QwkBnY+p31JF2t7xdVxOBMuRDeRzC8q4J5wMzT4=;
 b=jabN+tbIIdvrLt3+99eODDGMj147OgC1KpyqAtxJByb1BR24poaN18WL
 OqNJwIPtI63GxXK6n7v2cmRa6yj4FYbQe7FDmjW652mj3AJt6TvDK2wXb
 3Oakfr30XFfJW9mZysLN8PN5RGE8gX+TEDQ8MySRuNca9UFunQVD+iIdm
 E4GUZ6Nnx2LmVURpwINvP6CFa5bjFdfNyGyT1+mv44oqDBwxHfL9BfX4A
 w0ODFyzkgpDZRmjPbnPP53uGu4F6yAUR2o004YdYeAJlk885GZyCKHZvt
 SVEImOg+5jpQ+XnfiobYWrrfH5zPCoW6zmvXVz4nYW0YvC2ztxMbuPAmK Q==;
X-CSE-ConnectionGUID: uwegefc5SXyoE5MTh/XIsw==
X-CSE-MsgGUID: 8GDmswNPTL6uT4gONgyxTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="27681043"
X-IronPort-AV: E=Sophos;i="6.11,191,1725346800"; d="scan'208";a="27681043"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 21:08:21 -0700
X-CSE-ConnectionGUID: +s96s1L8QbCDDhVtnQd9Dg==
X-CSE-MsgGUID: krxirgSBS9Gwy05lgoq5IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,191,1725346800"; d="scan'208";a="76935353"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Oct 2024 21:08:20 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 9 Oct 2024 21:08:19 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 9 Oct 2024 21:08:19 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 9 Oct 2024 21:08:19 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.42) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 9 Oct 2024 21:08:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RiyBOJ1Tc3T3DEakSofPBbT/pEBjfifE5FiSrZtCpFh9Izkt+AS3uTVUT6NtJlXvmUUxqCTr0VB3SheDXuKTqnPeS454Cr0ViiXWgP6TYNcCrHsWbaBspzrr+AABzvqEboNpu9jszZAi5jV0ovics7Z9JNq8Gs6yAIMGW6luP+vlWy8IL3tz715PAsGca2gAav59XTsORyS+PneYwbbiwuKpdw4CCJ/x/JT6YyYk6etE/2kjrom07tDWhtdy73xsiX301mv6s/I945NHIyOx/oyCTw/JF5NazfASOZ2j9JV4g6EKdt2HD66GbavIXfpNZW1OpsxqPTFIXbD06L0d/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JiSiiVkLgm0KN4Lt6BpDhs4UYZVBLnRXp3GaRuLCnvY=;
 b=FDnwTBJIYgi412cGPMMFXi9b2WIdZJY1kGpjzgQdgMmj/PdIoMhEuyZEKDRDLaMCdYAHWziNPrcbI+dNsmm8UA90P6cDmwwGGbg8iQPsQjwZB3oTBP1o2ARNIqq8CIwK4qfeY0cqQd0QdPH2OuyfbDE6CuChjtJ1YzDDympSBgRUv2tIBRDIy9aeM2V6wFdmr3EkLSV6eGlBm4GOwZFXuROMvQ3tL1lplnyUXGEdcZWiW37/aQMD1kbI3GkPNNSQGgmi2mpS5PfzBfq17OfoJTHJJT0rMEuNSbjbo4zvSTJWWpMRcCTvvTgVtD4GoO9JUtjZlWVZStylmsKRGR1iVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Thu, 10 Oct
 2024 04:08:17 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8026.020; Thu, 10 Oct 2024
 04:08:17 +0000
Date: Wed, 9 Oct 2024 23:08:12 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>, Szymon Morek
 <szymon.morek@intel.com>, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH 1/3] drm/xe/query: Increase timestamp width
Message-ID: <kramaztywikxqhtzc5e3o27w7u4eannpkjocejdgvu5siatgea@6nb5lkrgur3u>
References: <20241010034847.389734-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20241010034847.389734-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW4PR04CA0362.namprd04.prod.outlook.com
 (2603:10b6:303:81::7) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ1PR11MB6204:EE_
X-MS-Office365-Filtering-Correlation-Id: 362fe4f6-bf4e-4710-2808-08dce8e12b16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DicW9S14bMhSC3u6g9wlnq5e65PFLF8Xt/wSmWHexoi7u2vZYKuo5DnnigNV?=
 =?us-ascii?Q?eHG/FrS81n8Df9OxtO57FpjJYa1EYAKytPaPiu59pjb9htyE/TxqcPluQ4LP?=
 =?us-ascii?Q?QC+AAVpmpTDaUSQDuiEHp53Wp/1/h0ltqQAT72NECVjfoNQAYTokQPSSuufs?=
 =?us-ascii?Q?FJhjEzArf6amfELxoczxCwpbWtZw+s7sWWyeC5j94+bJuJxqKGSfx059PdfQ?=
 =?us-ascii?Q?kLcViRgtr7sjZnnSYQbru80qtMyIxNvI3KP7u++2Tgkbxqd60GMnIp8lQBTc?=
 =?us-ascii?Q?m7sGQFKMa562+zgSDEA0qcGh326//LEjjHic0gYWfQvb7rxqFWcR39pvI42N?=
 =?us-ascii?Q?UNtaKfcOdhXyoAqoccf9bOn2hpwf+txrXEVwinOjNXNTh+jpjqnojhfUHhCt?=
 =?us-ascii?Q?q9yyuhGhOysEuLnSHRo//awIUGS101Ug/0zqExRAC4gJ+X+1tLbl8u3ZIGWO?=
 =?us-ascii?Q?45ChKqegmAc/j5Jj1TE9exiyBeLSxdIVyR9ltJFA7S+1ZRLifthrLh9vUgsJ?=
 =?us-ascii?Q?HXMCJgl3ZbU57nGrOh4Xzh2Lr0BQ5lydCCTm+7TZoYyMI583gkFWIi7uDRkz?=
 =?us-ascii?Q?n5BMr656gSg4aVg3OkJZR1Oxv9z5xZU4kpOu3OZ/8LR3CGMf4gysFfDnyVXA?=
 =?us-ascii?Q?Ew+pf6rxaEJxnJR7AOAf+9j0xuS+JSnb+LgYn1KaoLz7Zzcjb2Ayk7KWPpYc?=
 =?us-ascii?Q?LGotRiSTTTT8Rmz+qfTjEMtiJamwdUDtOqu6D73mWH3w7BkFkO6wK0rneuwz?=
 =?us-ascii?Q?GZ2wk3Ub1pEIDc7IxmJu8S8ABwQ5hfshHTY2g2uP1uRcrdFO8N5XS7xcAusG?=
 =?us-ascii?Q?2KcmC50lDy6HtcE7FZbjkgh9CriKRHQlf1Q1w45rZmeeBF40m/+xHqWxux58?=
 =?us-ascii?Q?T9Ihv10JVeel+ShahxR7bbjVVqRbQ1RwO7ULnDbg/eQMM9RnLUY2BwcAnK83?=
 =?us-ascii?Q?tignSfSf703XgEJlfbuUyvZgW1ZnjZChggf6YVZMgsgv6BGPIz++g12wNdhd?=
 =?us-ascii?Q?u0QeEJqKY48wJa0H8xMtqhcbuM+rUMoY5ILCKhRJiqQdg/sYl/1BkPUxIaYO?=
 =?us-ascii?Q?x+lAqWeBniwKCPodMBC+L6EQTdp3uLbqBkhdY/rrgukyex99TpMfQcgNEfjr?=
 =?us-ascii?Q?pUNWWKQLcduLPg6PUGGRre22a1qIXzQA+9mUKi+ncw2iqDVhBuKsun0RNgag?=
 =?us-ascii?Q?cfW26FP4K/BzxN+3kJCTS3kv/XBiOaYTKk3LWvzYDFz5r6pVBJj+ToBEyUTs?=
 =?us-ascii?Q?b4ya7aEK71LZdefk6oirC4+ohazGXuk6CZFD0YDGiA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?k9voea6EEe3OQ0AUquNxb9+zXtQUu0iHcqvNoLq324wgS5dlJj3QVhUMg0qr?=
 =?us-ascii?Q?++cHl56BgbMjxll+i5d3+wMnaz64JYwiisnw4cWqxeD1U1EOD9DmXUAH1plj?=
 =?us-ascii?Q?M2v74xABhzPoNUD2v1tQSjU1LJSE20948llDwFsp84Lwbm3Te8h0B9HPMlqG?=
 =?us-ascii?Q?/f48geO5/RCcKJ10knRTZ9kT8DNvyC9zgxOknjMhyaIMxdEoEI0Ym6ZtSa4Y?=
 =?us-ascii?Q?IqNniFsQT52vhUhYbwuyzU5dKOw3+TCXTmcXwI4n72YjW97LGlyL866MjIGV?=
 =?us-ascii?Q?pDr1OpGR1wZONEBcK2kfJ5uqr28QnIk+nEzxfALl/PB7JUWFNWPoNWhcNHnR?=
 =?us-ascii?Q?LJtIV4usShtRdnmKIS/PVvbSaMNF42d1hRDrn4jvKnVtrpQ2ZDOnDzhuDMnL?=
 =?us-ascii?Q?pkk6mORTZPSLS0AcsosGC+61rO4wU6pU4ok8iwLWsU16ERMPRH5+cdt+NzVj?=
 =?us-ascii?Q?6d47nEFQvS3YPneRrGarec8wzT4MG8SZFsXdwK8vPgjYAgcp5UqYalZ2/Ua9?=
 =?us-ascii?Q?m9VoGqlKoLqzitHpZ6LxlEzAT31lm7Ag2YldTWcAZ1WgYuXbBpBrk3dglAWz?=
 =?us-ascii?Q?0CWNELvSUiWz+jJHBubzp8VGuElx90B9xwUvnK/Eagq7ypgcN92dnegTFhMH?=
 =?us-ascii?Q?PYjgAg/8A8NlfbuAYgHZAA+3bGsdUbHHmwnKOKzNOsQT+aFgwDYRpQEl+rVa?=
 =?us-ascii?Q?erZ4/MGs6m+x2S+qS8VHsc17zAfWiieyOqudU4WPz8IlwGA6X/JBcekWVIr2?=
 =?us-ascii?Q?/8CLtIgpxNUrKcI8zj0lGPKDGvs98tipBB0RMbV72Hr7sWtFzNqB/wdTc9rz?=
 =?us-ascii?Q?49TTtvt/iPk08w4leXzkGqnq2pAxQp7fE4u9aqCKt2l1QnjHAxcJKRPkYykR?=
 =?us-ascii?Q?DZxkEEX47XnGkhuaq5sECgK657utknJt1cgd068MfOaKylbTbvCGLhgQ6/r0?=
 =?us-ascii?Q?nFzhbgQf/LJ/1omVEAQ8lKLgqV82ju1iffjGZAhhtulQLkvvU/D/H4LXvq2B?=
 =?us-ascii?Q?pfO9XmDhipW6leLNb1s1zogozM2Uunk4HbTo1GO9ROiaJAsRx0h3/XKAooae?=
 =?us-ascii?Q?PkRf6DcsxlOdMZQ5rdh28Dc8NJ57jbjk64724JosR1zHZCyOXfwOI3dzsrxm?=
 =?us-ascii?Q?qOvdyFDsgMKa4GYRPSzOEK7kHnrsTJuP3JSoOo67OJK00ghhuc01kornFB9d?=
 =?us-ascii?Q?UtHzo7+TUcelV3N5J7jwVCnBptJc/imkC1LiZBuDKBch4bir8ISWhTzxtMzP?=
 =?us-ascii?Q?pg0djDNgasryslrGMe4B/ixpkRBUs1Ub5vRhE2CjmdvdUEs35Zpcm25nGEOl?=
 =?us-ascii?Q?3P5erjCcPLz8NclV552L9XDUa+vj9cXAb/pNs7ro+y4HALFVNPFcG65GPjYB?=
 =?us-ascii?Q?KZDKs8qypKo1CgqDJbN5hyXR/MhXblu0NbY9056ZT8rmSIy3YKyE1s8Wp9Ch?=
 =?us-ascii?Q?k0/bH8HcQe5D9rxvuk/ipkbhLW/VvVNZKsl5ScVn5qKIZMI0b+BWph/Zgivd?=
 =?us-ascii?Q?fNm5pJROce4/E0lEbjuZekpMszNMIZRs6nV+/Slu7wzTvTeOiTwGO6P9Vb+d?=
 =?us-ascii?Q?lQ1tElKvOGrAbMy2KTrvObioi/N7kf59lXpk0fc13lfXb1sVPBdB02TiAefD?=
 =?us-ascii?Q?PQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 362fe4f6-bf4e-4710-2808-08dce8e12b16
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 04:08:16.9705 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3TXpcLCbEyy3piup+7DKkWIRPsFUg1AZjcxfM+rMF3WkAoXOSaX2uvvA3BigszjT/agJBJco5ZZ4OPS1p+3z94FbJ1C//ijVHKcoHmm2QZg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6204
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

On Wed, Oct 09, 2024 at 08:48:45PM -0700, Lucas De Marchi wrote:
>Starting with Xe2 the timestamp is a full 64 bit counter, contrary to
>the 36 bit that was available before. Although 36 should be sufficient
>for any reasonable delta calculation (for Xe2, of about 30min), it's
>surprising to userspace to get sommething truncated. Also if the
>timestamp being compared to is coming from the GPU and the application
>is not careful enough to apply the width there, a delta calculation
>would be wrong.
>
>Extend it to full 64-bits for non-media engines starting with Xe2.
>
>Bspec: 60411
>Cc: Szymon Morek <szymon.morek@intel.com>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> drivers/gpu/drm/xe/xe_query.c | 6 +++++-
> 1 file changed, 5 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
>index 158629971eab3..a1f4cc25bea68 100644
>--- a/drivers/gpu/drm/xe/xe_query.c
>+++ b/drivers/gpu/drm/xe/xe_query.c
>@@ -164,7 +164,11 @@ query_engine_cycles(struct xe_device *xe,
> 			  cpu_clock);
>
> 	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>-	resp.width = 36;
>+
>+	if (!xe_gt_is_media_type(gt) && GRAPHICS_VER(xe) >= 20)

I sent this to follow the spec to the letter, but I'm thinking the spec
is not tagged correctly here.... the counter is the same, replicated to
all engines. It doesn't make sense to be different in the media gt.

In fact, testing on LNL:

$ sudo ./build/tools/intel_reg read 0x2358 0x235c 0x1c0358 0x1c035c
Opened device: /dev/dri/card0
                                     (0x00002358): 0x52d026c7
                                     (0x0000235c): 0x00000062
                                     (0x001c0358): 0x52d027b3
                                     (0x001c035c): 0x00000062

So... the upper word returns the same thing for both rcs and vcs and
it's > 36b.

+Matt Roper as he understand the spec tagging. Maybe I read it wrong.

It would be good if we don't have to differentiate the width based on
gt.


Lucas De Marchi

>+		resp.width = 64;
>+	else
>+		resp.width = 36;
>
> 	/* Only write to the output fields of user query */
> 	if (put_user(resp.cpu_timestamp, &query_ptr->cpu_timestamp))
>-- 
>2.46.2
>
