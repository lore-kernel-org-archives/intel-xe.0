Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E7CDC0218D
	for <intel-xe@archiver.kernel.org>; Wed, 29 Jan 2025 18:30:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D2D710E16D;
	Wed, 29 Jan 2025 18:30:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EHMYvRYe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FDA410E16D
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Jan 2025 18:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738175441; x=1769711441;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1IPAVZTvTB3aW4ikLigoiCLZtuGrbVJ5slZ8GP92Z8Y=;
 b=EHMYvRYe+QrYNLh6tq3g333mZaKCdNSJiiUnV7oA0BFnyyIbmDhVL18h
 aSHXBWWI1Cp84Fo8oVsye4hnygxS7H/LuXoy/TdMMUD4zyvVSj5sCLax5
 7Z5VoZvHw5jbXDMk7yEXE6fhqKWtu9ezpdxYkG0jTQDWD2eI9RxVeAiSz
 /l0VposVd9k0zhnmlbWy5lG13Cxx60eMvnLIbsNrP33M9z+QeMHmmpM2d
 C1/yDxT4cvDRPUmix1PlSlBmVfnyOLmstweA+Gn254bIt9zSMFsfP/Mpd
 XcIL+YEARel8hHbi70UjwGMWquoIdyVu+ie2CTFntzMj38cVC1lGm89Dc g==;
X-CSE-ConnectionGUID: DaW9IcsLRaiikUdyweJRSA==
X-CSE-MsgGUID: FYraeFqOQq2NNkMg6kIQ1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="56243762"
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; d="scan'208";a="56243762"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 10:30:39 -0800
X-CSE-ConnectionGUID: UugmOqgqRaCULIrnwMX49Q==
X-CSE-MsgGUID: Ku8njxInS6GIy7Jf+6rHbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="113115997"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Jan 2025 10:30:40 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 29 Jan 2025 10:30:38 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 29 Jan 2025 10:30:38 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 29 Jan 2025 10:30:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NW4ancMwbOuhd6R2yjYA7Vv1fegYvM8qtcUHV2h0IPMgupuBsihpHMtXOSxV7wsU+m7hBpWwJOP13ymCFv4lbm4FXLu28Bi7M2TbyhGt6pB624hXMsXyOfbn7llr3lH0UHYzWUiAKfkUb6hghgCW87apilDAnx55uXK5wQkoQKX2h8sTSV+fCRIb3JyOlW0aPFfw2bWqFKmQ1uUG6VdBrYNbbGveHCwE3M5Br8mAuQV/n9PA45RFs6DjjPdGfMKfEWuDbGrDAYW3ouh9CJttGNUUXJ3mGyZSqK0oQxpFHPXEVZ67M2ougVIe0wjB4YicCswPZZTs03oh7orkaj9Gzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aOR3SPWyk1TekP3tWp2YgSArDkOd1E+2myX4YGxmshM=;
 b=goF/JPXh9vHb3/Hb4Y0GKgU7HWVyFcY3mLI/XrJbxbjjdQc4uuWAnHkS9stI5PiVr425Yv0kwxPcITGGKNnvW7kmSUyQ3TQsYd16jTkntiivFVYcxK4A+wdE5Zc5w+KG5wglS9UVY10J2elXsCCzU86zP1OKkqlVB27Y7BeFWJy42IlWj1rig8E/aRnhbfYP4rfER0qqarzX9m2ngLZddzX+2S1U7CTlVGM7uhCgihTpFTJ+O9C9Zp+5FUJe5WX/CFNLnxouE7NwxOMf41C7AyCpxBnF7M2SYfouuzqtc0IDx4xkPbm+DHXS2OSvHdm8zrfQsfLu1sgaPLXOVDDSoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MN2PR11MB4648.namprd11.prod.outlook.com (2603:10b6:208:26f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.17; Wed, 29 Jan
 2025 18:30:31 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8377.021; Wed, 29 Jan 2025
 18:30:31 +0000
Date: Wed, 29 Jan 2025 12:30:28 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>, Matt Roper
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH 3/5] drm/xe/gen12: L3 recommended hashing mask
Message-ID: <uyje2ytdlfmkitygqjqo4lobspearzzwt4edkeetpupngrckcl@oy4ebrtn23yt>
References: <20250129155627.93827-1-tvrtko.ursulin@igalia.com>
 <20250129155627.93827-4-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250129155627.93827-4-tvrtko.ursulin@igalia.com>
X-ClientProxiedBy: MW4PR03CA0339.namprd03.prod.outlook.com
 (2603:10b6:303:dc::14) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MN2PR11MB4648:EE_
X-MS-Office365-Filtering-Correlation-Id: dc107c79-5e0f-4dbe-997c-08dd409302ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?L+eHxvuggBiLOhyo4+mhZvqM5Cp8e2xZcrrH21YG9Uo/+bIwM69Bw/HMm9Cj?=
 =?us-ascii?Q?3/377t5wWk8FOaRjUY2AJdtu5BvQaQ71YaedTBnshImoIwSssWA3+Y+MkLJQ?=
 =?us-ascii?Q?Jvpay8kH0VPQJu33w6Sg9TWnduZpFOEhGlCH94Kdnc6UQkJ6c+7cwI2yki1y?=
 =?us-ascii?Q?lrDP+D79xLLjlc69WIwhGEBmF/rHiFsCGzvWBTf3ub/hGMG85IxdSP0tIYWh?=
 =?us-ascii?Q?UZjg6BJ8/1q7AGbzT90oKBrFFwlV2g6SrraopPlNTlitVBf1L5UbNVyfQDi7?=
 =?us-ascii?Q?ADaSXAZfnlS/sQG67OcUL10ywVtLVw0YMPSsktphPYu7Z920ZXyyDyDIkV5/?=
 =?us-ascii?Q?Q8olUQPuYWRpTfYULEZHH+e2D1EfNbZbGOH2X125Yd461SdPNeiWrAUCMbMx?=
 =?us-ascii?Q?9hafpabWZAiDk115JS0JbWeY8zrYypGhJWRlOZ0V1+68thW/TVtPXAbXPZ9W?=
 =?us-ascii?Q?6dBrbVMZJS1zmeZMLd8e4Xh5Tu1x/MVwNXux+B+mXIzdkk/s23zONlqB/jaF?=
 =?us-ascii?Q?gjzQvvsQRZzI1Otq2OKjn7PCJwEU00HMGFjJwW0v1vyIx5GZWrn+vhMSH3Oh?=
 =?us-ascii?Q?JK5fsJ928CWZKqCoWF3XEmXkjEspgse+hNagifA6wpTgzq8tJHVQPICHxxDi?=
 =?us-ascii?Q?bmS9BocZQSwZe/kpEYM6WHjojGP21+6bR4kwfK72inmv0SQsQJxA360idEdr?=
 =?us-ascii?Q?K8heqZAzfitjOlym2Nho/nuvQtNLfOWy3jipgOeLGzOW4RTR9IKUcK9Zq2xA?=
 =?us-ascii?Q?45NQnTL0bQU9no/T3QjMPzvHfikAGC7SsGzHN+MSp+H3a/T1JLNPG4hczlMc?=
 =?us-ascii?Q?oTzbWyv/6F35KFTHJxXrk+w54C5n4VJ2IfLwUyj1txnDjA3qIlpYQ70cXzEu?=
 =?us-ascii?Q?UPsR1gjQeCkwetHHDoxyKLR7OTjJ1moW56OOQeJ8jnIy+ZoR+nU3IyRTz31u?=
 =?us-ascii?Q?CPMc9pew+Y4HqheWxVlRQZKP+wYP6n2ibyjxjMn3trYrvOVrQS6I79gygtEa?=
 =?us-ascii?Q?Uz0Y8YPZ/Jssjl51YQ8MDFIjYjZls4EnaZ39pG21kb/beb6WO2iE9gV5Eysq?=
 =?us-ascii?Q?hSWxT+dSZ34H1KMiAF/llQSAL6B63l5X4tKoEw8wNGvGMM6JDK2RYFy1Kd71?=
 =?us-ascii?Q?Cqnrz/jL5SBA+DeJJMpya/FMxGncKe8KB6nFwd3Bq/Z6CU6Dp/lbt7wzT3sP?=
 =?us-ascii?Q?VgXj8P2oEoK3udn9wxA6I32BY8m6DGYSZjaMs+IvxkYAivlREuQcU1kgZQPi?=
 =?us-ascii?Q?CuuF92VEppwzot0w/sB+6KTIUisnjyDW38Pln8mcrP6Cj3FbrespeotWBHQF?=
 =?us-ascii?Q?VHmTh+OiLYETyS6pIW+vV7NYeCP/+qlSVdEs2ipRXWEwdOvlVXiGqELp9GWX?=
 =?us-ascii?Q?FgNvPfDXW+pEziwciiT2QLONUYji?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rPkoXPUeQwyHu0Ci2eJd9t2AagJjFmLpJjyFyLNydMPNlsvWRM/yMth6Efnr?=
 =?us-ascii?Q?RPzS7RTFHEsGbeuueHOvgansWRagqjXsyzdNlCftcDKXzYt2TrVTrl4GaakX?=
 =?us-ascii?Q?L5hiAJPT9c4pn5ZBrcAE9kM0ZxDh6S+sI4un62QLX324gXSah9f4yRIuqj6R?=
 =?us-ascii?Q?mHY1WoJTGm8a1ZN4Fm80AIBLahvIM4RAoWyckIRiGBBP91vUNKyPy503ysJy?=
 =?us-ascii?Q?k4IBh+eeMgrFzm5eBxHaAZEnOkPdEQDVB+sjW85xC8/67MrXrCb0oOBRoQ5o?=
 =?us-ascii?Q?psuAnCQH/m9eNwvo4OxAEVsFSE6fa9fF3x7zoiOGMlyTzt5BzMw+ETMD/4/0?=
 =?us-ascii?Q?f4KZvuDSQT/yDBl+g+OJSYuv6YuoStSj34LMmWWzXL4SQnlVRlM1d40KYDpl?=
 =?us-ascii?Q?gvK7ZXW8BRwLcr1RhCV/0Iki9x9bBMqX6kU2Ab8BBbGH5sBtBrgc9enF+8Vf?=
 =?us-ascii?Q?rMeiD6t8AZP5ePvNACSjPWjHXLyyJP/NtD4/W0dNYnkpbXIQvUXZoklaOE9E?=
 =?us-ascii?Q?s0gyHbBlrhOz6aBwZrd+XRO91uRa5yqpeLxlC0SI4HwVZMfbeCgk517J90cO?=
 =?us-ascii?Q?B8TXnMdxyx4sXMspsrWO1vgLSzN6Ucdr3uEIHp1Y/GRtJ1hyYaF54FEI+tQw?=
 =?us-ascii?Q?8AuaF+bUZATyNyRX9gE2IR4kf5YsPfGi+AKYY3CLl3QoVC1vVn0uYqm9u6lN?=
 =?us-ascii?Q?n47xAl9nSoM1hlRKCW1Fz/yRCdlSC0rM2JyxrV2bbXQnA5pHlyB5meXQAgnW?=
 =?us-ascii?Q?a9HV1i7bCUHoEOycPLHRu9NG4kfHM8FN+fHmT/rJbWry3YEp5ASaNRA/+J4Y?=
 =?us-ascii?Q?NB3H/X2yZoedmFOREP+WFJwYikEYP1HvwZ+H3fQUXZWnPBP8iWr1Z60UwZxH?=
 =?us-ascii?Q?wJeTJftwAt1t0krLmLNghQBVP6ViXzZ1CLRuOl89q4CNPT0x9kkMFRFfZmmM?=
 =?us-ascii?Q?YmFKxqcPYW+pdR9XCqd+9GA7wctkFwz8GVpUiioFnevsymW0iRHNbyt3msUT?=
 =?us-ascii?Q?4f7SFJ3Cu6OhpT+0Zh3XCyFojEVjbWLKWtu9WH6TB2ucjfBJ9oF/j6wAlFua?=
 =?us-ascii?Q?DUKdBpOt9mokBFc7lBtMUXkZ9SRwTPBQxc5YvGOGYyDJhzUfXUJg199VyAuF?=
 =?us-ascii?Q?a2qjf9X4ioyZFm7u9Xk+mE2mCsjgT/ez62SgusMMiSXrwUQEUujrnXlRlvmP?=
 =?us-ascii?Q?W7xuc5/RKfNJJwgK+RFjckAoFXCDlyl1vqN8NwTJsFXyEQX5dF0AoIVUYIPm?=
 =?us-ascii?Q?nN4acBoW6RNJmglklsiWAFvQ1DZ5iTEhhigCHDT1mZeRg/puZY3twbc1QgOU?=
 =?us-ascii?Q?SV0sPGC+UhOHjUySeBR1T5w7bKiuID41g8MIHbfDsm7bz0b3FwsuvPf+ukS9?=
 =?us-ascii?Q?mzu30Muj7GGdf5djK/2xWdxhPxVs3EdSsMcAmxPWHer7JNP3Idxw3I8SOV0w?=
 =?us-ascii?Q?iBgf3cF8nEALHoQA2DzUez68Iuw4O7NG2sCqQ7I5CoWIKTbdsIy7E2GsehC8?=
 =?us-ascii?Q?HX7t95Q0M1GPHaV4VSar7Zz5OpNAgp5p9yDBABbZEdSyZtFQb789f9oTdrmp?=
 =?us-ascii?Q?biHQuwHwLwXm0Ew6NFqSfd97fzdRuSVZMVbd7JCdHdluBjWunjF57Z+XIwAc?=
 =?us-ascii?Q?EQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dc107c79-5e0f-4dbe-997c-08dd409302ca
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2025 18:30:30.9618 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V0lQUS2fbDoFcyIBv4POuRr8jCW0R66UOQ5Sbys2eRT05FVcEjeDZhPxjgFfNvCZmTzY40muDc9Q9YCqUFEpv1VLUhOVNq4pkrROOduECQQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4648
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

On Wed, Jan 29, 2025 at 03:56:25PM +0000, Tvrtko Ursulin wrote:
>According to the i915 codebase xe missed to set the recommended
>performance tuning for L3 hashing which is applicable to all legacy Gen12
>platforms. Lets add it.
>
>Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>References: c46c5fb725be ("drm/i915/gen12: Apply recommended L3 hashing mask")
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Matt Roper <matthew.d.roper@intel.com>
>---
>I could not find the reference to this in the public docs, including
>confirmation whether 0xb004 even exists on for example TGL. Then for ADL I
>don't see that PRMs have been made public at all.

leaving this part to confirm later. Matt Roper may remember better and
chime in.

>---
> drivers/gpu/drm/xe/regs/xe_gt_regs.h | 3 +++
> drivers/gpu/drm/xe/xe_tuning.c       | 6 ++++++
> 2 files changed, 9 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>index 096859072396..909638b18557 100644
>--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>@@ -366,6 +366,9 @@
> #define   XEHPC_OVRLSCCC			REG_BIT(0)
>
> /* L3 Cache Control */
>+#define GEN8_GARBCNTL                          XE_REG(0xb004)

mind the commit 0bc519d20ffa ("drm/xe: Remove GEN[0-9]*_ prefixes")
GEN<x> prefixes/suffixes are not here on purpose.
When we refer to GEN12, it's XELP, or simply drop the prefix when it's
not needed.

Registers here are sorted by address, so it should be before
XEHPC_LNCFMISCCFGREG0



>+#define   GEN12_BUS_HASH_CTL_BIT_EXC           REG_BIT(7)
>+
> #define LNCFCMOCS_REG_COUNT			32
> #define XELP_LNCFCMOCS(i)			XE_REG(0xb020 + (i) * 4)
> #define XEHP_LNCFCMOCS(i)			XE_REG_MCR(0xb020 + (i) * 4)
>diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
>index 9e7ec36dbd47..b21a59578ba3 100644
>--- a/drivers/gpu/drm/xe/xe_tuning.c
>+++ b/drivers/gpu/drm/xe/xe_tuning.c
>@@ -107,6 +107,12 @@ static const struct xe_rtp_entry_sr lrc_tunings[] = {
> 						FF_MODE2_TDS_TIMER_128))
> 	},
>
>+	{ XE_RTP_NAME("Tuning: L3 Hashing Mask"),
>+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1254),

50..55 are made up in sw... I believe it's safe at this point to just use
GRAPHICS_VERSION_RANGE(1200, 1250)

Lucas De Marchi

>+		       FUNC(xe_rtp_match_first_render_or_compute)),
>+	  XE_RTP_ACTIONS(CLR(GEN8_GARBCNTL, GEN12_BUS_HASH_CTL_BIT_EXC))
>+	},
>+
> 	/* DG2 */
>
> 	{ XE_RTP_NAME("Tuning: L3 cache"),
>-- 
>2.48.0
>
