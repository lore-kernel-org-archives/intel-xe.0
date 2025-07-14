Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2D6EC83F1A
	for <intel-xe@archiver.kernel.org>; Mon, 14 Jul 2025 20:55:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F3BB10E359;
	Mon, 14 Jul 2025 20:55:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OHV6bAN5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61D8910E359
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Jul 2025 20:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752526546; x=1784062546;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=NGm6AgSdUwXX8nOSNr2IwIis0kzNVldiXb4jtzpZ+i8=;
 b=OHV6bAN5KXi5HCdw3zHt17merP9PuHPSSiUPwt1Sb5hLhSQu57cqYi6l
 MDrEY0gzEL5JFBELsvbhhs1DXpp20aGUxeRmcStNWv9DstDwi0UAgUO77
 eRL4YeOJvaIke8KwSkvh7Cb9tV3kLNgMAWlQu3YuZaMZqqNN/8Fj993S5
 DUbdN5upXwto2eqnw4BTxjGC6R6VYAoJ8t46TG6iMRkUhVo3kzIkAWNAr
 MDx+Qbb66TBXyQ/4DNnWd2WcLe7gkkOfMoQIaq1y6NBVjhRnLz7pfgrtD
 xHSl2pdpDskBclFHkpbWNGKZIf9tWOuJhf2vAu6Pj6LE+a9fHb6hMehQi A==;
X-CSE-ConnectionGUID: oVMdf5s/QZuMz2cOAtdgDg==
X-CSE-MsgGUID: 8xHCW0ZTTTm33BKDEqZclg==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="77268488"
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; d="scan'208";a="77268488"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 13:55:46 -0700
X-CSE-ConnectionGUID: HzcXcUDPSVaPfpbbImfJBQ==
X-CSE-MsgGUID: HeAJ2BDER1enV3zvDPBLrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; d="scan'208";a="161045757"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 13:55:45 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 14 Jul 2025 13:55:45 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 14 Jul 2025 13:55:45 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.78) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 14 Jul 2025 13:55:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QqLAk7DxdyD30xYOWH/1Uc9JDsf7JBsIK+ecWiEMRQeTsXq0wnURkeK1cHf92wbnqLVcblxxVpX2MB3BopZx3Bp0c1U/4E0ZId/ngDL2eAPoimSfLO/bcWSSz1YEbrqhmgvfXrbECcvUlkscUZvey3g1teDTnq+ppQ1bpb87Nl1+Ijuq//EvlFlFqdeQKERakyiECx07JKodTehcPCfTK/j5UzC+m9G4KqoHdBpri5+UxVjWjZo0pUVoUiNDLrzA7hcGxZdoG1AZELqoi44mLOf8rpszBxjAgK088RCjWGilHmt7vqoxRYUeS4QvBwHoh1bMDM8D+6aRbfd4tTyYRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NGm6AgSdUwXX8nOSNr2IwIis0kzNVldiXb4jtzpZ+i8=;
 b=PG6YjXfAu3Aelr6KyN2dc+LaqxHyMhyLqQxBpXhcvR7A1fkK88a3MxkDMvpE9sfqbuSPzyNmbO7bz5JjauDFexqTmlyHPg57Bnh/3MjUL4iyyzYhgU7DRJMWW4+tTvFKidQGA5FdDkZqDNufS5i468106X0XfgAPp4jwMnZyMRa1RU6o19A4TpErmoYKTDPpfMNYqpmTPlhYHbwRqhvgRW/VA2NUkfsL/QUOWxFBwPkVJwhi8jEhL+xycb2xCKIBpQgHAZII9v/ihvabaRlXtuzAHCPoQ6PNLgTRZNWN9vg0XYmQHJSfSrLobzbPSpogbHdoOkqDXIim9z/84iLpMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA2PR11MB5196.namprd11.prod.outlook.com (2603:10b6:806:119::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Mon, 14 Jul
 2025 20:55:41 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8922.028; Mon, 14 Jul 2025
 20:55:41 +0000
Date: Mon, 14 Jul 2025 15:55:39 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH v2 0/7] drm/xe: LRC refactors
Message-ID: <v2jpi2vjjgjdtry2rw4dot6fivstgng36ddowz2x4nxkfwlgik@6ti4a7rhxgrp>
References: <20250710-lrc-refactors-v2-0-a5e2ca03f6bd@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250710-lrc-refactors-v2-0-a5e2ca03f6bd@intel.com>
X-ClientProxiedBy: BYAPR11CA0107.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::48) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA2PR11MB5196:EE_
X-MS-Office365-Filtering-Correlation-Id: ef9c8022-1869-4454-63cb-08ddc318cb70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?AY7N6TqcDybdAV0VsSvEs88N4pgwJHQgwO/gFnDCgXXX+sZCjk+MRqmcO6MH?=
 =?us-ascii?Q?vDjKwfibrQ67yZpHRtFnyx8POiZx1r7g+Yp/bIPsUKUANgl1cvgS0H1Tl1Aw?=
 =?us-ascii?Q?c/ZvlHVcuRc/t/y+71uixrIF6Vc3wPCvdQ4Yog/+RGvF9QPeM8GJTmksPIYF?=
 =?us-ascii?Q?JFSMwNDq8+4itF6Nva8/D/4eadttU3ccF92ISCbqiixo6gA7x4G8WeiK5FP4?=
 =?us-ascii?Q?ExK1KrhVcACWP0oxNON9wO2bbWo0f8l1LF4rhRCYeLohyzsz8jwPLmE+4TB5?=
 =?us-ascii?Q?gjA0hUeOoADTxmI9pJbtA+uD02P3LCIu/k9ZPw/HRm8cDhj1pE4Fs+gIWEkd?=
 =?us-ascii?Q?vRz+V/0xQrMWDJKzfdNv4rCO6idsYhQRS68N5xROuUnK454Os2rLn7ctUCQt?=
 =?us-ascii?Q?DWZTyaheblKS4/fDuHCQA2DSQLYM3AW1rhDfPHISm/Qw16cAdpPy83APwhL/?=
 =?us-ascii?Q?z0AoInCWa684c6Yq89J/OsqMO4IaRZN2dgnV1ebNgNvDSmNMT4iCskjsNuP+?=
 =?us-ascii?Q?qR6nxwvtZd1uYJt1S/v/spcyad8b1x3Fx0TBWpmg7h0tJG/ORrji+tPvdIzB?=
 =?us-ascii?Q?GnrSvrCTcXn1lZznw9hfg+RYRS452FtFiS/Js/GD+BZU/Pk7zui7RTeev7uu?=
 =?us-ascii?Q?B3Gq+6D1M6ylllYF+zvJR0AdQckowmwL0CUs41Q1RWlukjB5J96wJJ8zCs2O?=
 =?us-ascii?Q?/0ziF2J1s0CrLTSugewGjeINxS8A8LJuJ+lmga3Tixey8mSNJ7l9XZ/v/FGa?=
 =?us-ascii?Q?5Jv1V0XmDZj0ejR0qV3diatmgjbhh5cBTi10ajZJmrfNzcYtnIaoGfiIMusW?=
 =?us-ascii?Q?R/nl/IRYLoNizPuEhFJbdyq6PuoE3z2OnUdaivNJxXkgX6/d7XKN09rgg9v/?=
 =?us-ascii?Q?YMDy9WsEfepBGRoEFpMzqPQzd3XivzKctPghxMJj9dqlM8p7TKiPEmScFidM?=
 =?us-ascii?Q?V7AbXMK4eemMOpK4vAlThdzeIQ5peXUZz3c1KOvpRX5EMuVqUDKUCIcKMoz7?=
 =?us-ascii?Q?qh+rhBqOyo+Ls6E858fg43DzNLfrApIdVjTBlsSM1MMAoKiRHN6i5Txqw0q+?=
 =?us-ascii?Q?0ygO82QKpaUdJ61ri4lqy3YnvFTHcT+PWIQlz/6Y1YfxeUe7HcbdHsii9YoS?=
 =?us-ascii?Q?p/xHny6ow6UzUz59RTGOvHnxat2IOVhXUzRtGVK2Q/i9hZofdp+WSV7kzgzQ?=
 =?us-ascii?Q?bl4jpfgkItPSocYyRd3YLLnKY3osu8mG/IcmXUIS3GJotBGqKfDplqbFevJD?=
 =?us-ascii?Q?JO5HY38aj8bgX0g/n1iARaic12nu+/8x0kXUJCknO517IMlg19D+tP+vK/II?=
 =?us-ascii?Q?CnKZV8ssWkaQ8ba4QwBnZByU/riLi0jIxvtpOf88UzHHBVxDl+YBvzw21Rfw?=
 =?us-ascii?Q?OhSKzrh3UZWLEF5L76v8kX/vXlsmjEe5IK5vIrKB2e9mRsdF5LF6wn9cqs1+?=
 =?us-ascii?Q?fbWcp3GxbS4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OQh9VI+kda3JmBmrYl8XR53JSalYE2jpZGNY6p2pr0HkWltyBejjSMe8Qfo6?=
 =?us-ascii?Q?sXpiivQ2Eo5ZVbBBMmKEwyK9dbVGh3RewcfzGXyPkUhGReDS1RMQa1m2yk7z?=
 =?us-ascii?Q?r5E/0eYIf0OMh0GQOqxLB2iKrCFDQFR8KC7bDdZkgnqjlUE/F+pgqQ2iU6q6?=
 =?us-ascii?Q?o7sEkpnGSPBpJBy2Efop9mCGaA08bMW1sZ6/zmUrTiehics/wBYhq23LuQUv?=
 =?us-ascii?Q?Tva+SGiIGOCFZgUCR0+16v1ljOtobQO7pHHUMOKGxUD30T+MScw9hnvbn20E?=
 =?us-ascii?Q?5Vj9xRAuvnZdB4QHG7OAGwkYY13ggoX8NHZS40wCFEwFzeqx5Eic5ryGrRiB?=
 =?us-ascii?Q?e4NvTRLRLp1GKYLaUDoIVqmr+mHFzfyWqPoK7sch4m4y5Oq6MaCljnFCWOt7?=
 =?us-ascii?Q?UP0q7f3QNAY05SJJCOlEhjLm6hzH/trUIMGZS2SIeCVOeqO1FYoq3Ffmt0qq?=
 =?us-ascii?Q?kQ3sd7Uz8Jt+OK1I/CYF49t1xSwJQPVYfZJnwGa+JstwdxgQGaTMdwm0m1Xs?=
 =?us-ascii?Q?R4qoLFW8rP1Q9N67xhex3jvc1evvEj7+iUaKq5d6PMk+Hx/lVJVGQd2iE+Sr?=
 =?us-ascii?Q?U8satPaiEXvlH+lHWw2AgHmme3luWyrQS83U6uaRn6V/KXi8bgFxYQadvdW3?=
 =?us-ascii?Q?oTea0Zsr+dsDxposNl1P21zcLggedsQLXNYnM3sedNMdrAYZt+TXj2I0YIHS?=
 =?us-ascii?Q?leXCOv+C5ENmEXdikQs57Q+/f6WDRW5glIRqZbWyNeNd9dXB/3EfQ0mC0NM9?=
 =?us-ascii?Q?HWPGuckoqmekb66a+0+LEeKO5ncK+phKrOJytu+iOQ1sZm8VeiYCKQoDzGUJ?=
 =?us-ascii?Q?pP3XW8XDP5nzo3XZO0LQJDBGixAqIxjgba1YvCwFCJ1w/xHGwxzeyHJYasUp?=
 =?us-ascii?Q?OpUCcjRzKzupDGguDxLwOMhYXofjsovdLkgKfI7h6/K4P7sXVTHFHcnqFG/J?=
 =?us-ascii?Q?r+kwmcO26qawm3pdg/g040Cp69p1hAO0b4SJM7K8kpoubiuDYX8fCkMKaxNN?=
 =?us-ascii?Q?nL6+SlOdYCUgEzsP7fkW5c4K8Amx5PWpFapV8SFryQYBRaZ+E+8ptY6F/G/1?=
 =?us-ascii?Q?mIJzZeFOhJWZTFoCi+hImU6xMmyiDd9MUPS5pH0bEhMUgtmvREE/Gx2cNScr?=
 =?us-ascii?Q?ZDORDX/res9n3pJv3Z2WVfdMtbmsB/fH2mb+3JROhb0a9xjctboLd+pBWbp5?=
 =?us-ascii?Q?mRiemgFM7XjEiNuJ5W5rnlvHMeQugKEY0h2Y7xaYIU/DMjEW4O6JXLwMs9WN?=
 =?us-ascii?Q?6w8MFxzs1ZmghE56Zdlh+qro/IaUtx/0+B4PVHahMQdKmVieJPy3aNrPsaNj?=
 =?us-ascii?Q?OmtJOyKj8UMW+UnuHV568fg6Z06VDq8Cl2u4G8d57LPOBLCDWyr3WtXeJynS?=
 =?us-ascii?Q?vLQulF09QnCVctZryw32AyykmQocI/rpxUW+F6znQsdLjFUVRhMelRA4kChg?=
 =?us-ascii?Q?6ckDVmhsUX1+unB47umJcMpV9WJVoJM2HlK7A2xsAi4WEWS+zKlyWmVToeg2?=
 =?us-ascii?Q?dHmE4nYewD8ICgMyoTgIGKs5TOoXwSkZABOWsegUJKqqY9K3lUZ2OMHMqHu3?=
 =?us-ascii?Q?IPKDJPhMtNnl2j0OQ0bP2WdfFa21735mhmRxQtJ5XeST4NEfZ2xLSIoZRqsX?=
 =?us-ascii?Q?eQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ef9c8022-1869-4454-63cb-08ddc318cb70
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 20:55:41.8074 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UFT9FvIz+Arj59AxlOUu6wfZh46htPsJWD8FS5qCLhd4StuEp+6uYaWtn6ScArjQjinAAttOk7EQZF10KCmJ5lXWerzJZu6LdHGNgj3Ms3M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5196
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

On Thu, Jul 10, 2025 at 01:33:45PM -0700, Lucas De Marchi wrote:
>A few refactors while investigating the LRC corruption that
>were happening before commit 3d85ab36bcb ("Revert "drm/xe/xe2: Enable
>Indirect Ring State support for Xe2"").
>
>They probably conflict with some other refactors by Tvrtko from
>https://lore.kernel.org/all/20250703082059.61597-1-tvrtko.ursulin@igalia.com/
>
>I'm reviewing that one and will figure out the conflicts. I already got
>one of those cleanups from another series and added here on top.
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>---
>
>People in Cc received this v2 a couple days ago. I just noticed while
>looking for CI results that I forgot the mailing list :-/.
>Sending again.

Applied to drm-xe-next. Thanks for the reviews.

Lucas De Marchi
