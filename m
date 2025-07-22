Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52DEBC83F27
	for <intel-xe@archiver.kernel.org>; Tue, 22 Jul 2025 18:56:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E03FA10E6F2;
	Tue, 22 Jul 2025 18:56:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LnXqS0Vi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8A1110E6F2
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Jul 2025 18:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753210567; x=1784746567;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=JPQZVFPLyn0AwEY3HY4LpEUb+eqEclN5Yapl+d63H5A=;
 b=LnXqS0Vifh4dnIPvchO5KnIwhogXJ7AblvT4ad+T0teZYABjPFc1fAF5
 bCAsgWICfHSSPHfxOecdzAZqikU4vykL0jvU0W/GkmHgdF57kyxbi2MrS
 7wTRk7tx9LX/3h5d2XMh4H44IsNAkKQXu6kvSlgst8MVuJP+IShaafB4/
 aJxHr85lMkpaOTDXVBDJ6qABfMpYcG8pNI1jvg8bdQBWgJva4BSAkHMKC
 ZrbiwHN2QBp8+LtHg0NZF5wt0Sf670LlBciCO4BK0dQoLIjwdbq0guA1t
 PxeoGUf27/JSKxLW9ZAjbuKL5P5KptPoA66+Q230KDkvahISz+KmPhL7q w==;
X-CSE-ConnectionGUID: yLgwVhuNTxWpCEJh6IRVOg==
X-CSE-MsgGUID: OVsyEIV/RgGJjaB52W9zCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="54694837"
X-IronPort-AV: E=Sophos;i="6.16,332,1744095600"; d="scan'208";a="54694837"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 11:56:07 -0700
X-CSE-ConnectionGUID: cnGVJeouSEWP71/wEm9q6g==
X-CSE-MsgGUID: 62uzRYS4SbaZ3luAo4qdQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,332,1744095600"; d="scan'208";a="158888913"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 11:56:07 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 22 Jul 2025 11:56:06 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 22 Jul 2025 11:56:06 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.61)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 22 Jul 2025 11:56:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QrmiLWLKI8eMiN3560CHv97szYg2U1jcSRVGThKqlG+L4ZUfAxj+fcblSHn/eBLdLJiBaLzzz/bQ8CTwsp5cbIbhkP4/znoinjVaCjLNZ0pWMYGQjf/4cq9cX0h4c5Fmsie37w5QxYUrsh7lP1MsENjuZO38MM1rsm+CSPIQ4D3KkI5N4jfXpYJ+BNguzZ6E9YdgdpZy00XmrHWi/wWOuT1NDQWOc/vg0X76UBNlFgBhgifmKicWOtHpA8CBirmTL2KB1baeZcc/orF0CJ+uepenvo4UCTvARD1OjATa54j6IQOVv7rbPNt2z48nWB0qAJ5NfEkGkkrChvP9en3BCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JPQZVFPLyn0AwEY3HY4LpEUb+eqEclN5Yapl+d63H5A=;
 b=wooerCuVxAFgtGBbZzqYWmp8FzFiyIIpITi+mDnFd1zbqi8M/nA5ov06cA/IaGsEbiZc5zvnUddRG5mzrfM+xKRYm6GJthc9iyOL5fRJ0yVDR4XTwUAIXF3RnAfopDp/Fwd1W5K9rmLj6E3+IkFDJ85VT/3tWjdDe6ai3MDZu1yqnvzQmOfmfHaW9Rv78WfmcNZHYuFIx9Dn78Z7579tlPk4u1DY3f4Z9DJzshrWQiXghHWj4N2HrizRkqTUlNHc5EwCiBdyeOWotrbAG/KFmZJ0LDSL5HrsaSwG0BnExvyNjyoWzzlR7OzATEHpa2AZY3MRGqhQpdd5gkjA+/sgIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY8PR11MB7169.namprd11.prod.outlook.com (2603:10b6:930:90::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Tue, 22 Jul
 2025 18:56:05 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8943.029; Tue, 22 Jul 2025
 18:56:05 +0000
Date: Tue, 22 Jul 2025 15:55:59 -0300
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/4] drm/xe: Enable SR-IOV for ADL/ATSM
Message-ID: <6dllvbtnb4nj4mr2xurdekxxoqqru3qdegd5t7a7cze5n6mjpj@jszzsqatfpb3>
References: <20250722182618.30811-1-michal.wajdeczko@intel.com>
 <20250722182618.30811-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250722182618.30811-4-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR03CA0268.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::33) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY8PR11MB7169:EE_
X-MS-Office365-Filtering-Correlation-Id: 7142d7c1-52ea-4f4a-e89b-08ddc95168c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xPg8aAZNR35MKa5TWnwGPMjjGatld2hQh++XQzE2WBpm2CfKXA8f4YM1ZCTO?=
 =?us-ascii?Q?t4tWOzlcdRmRXkplwbrnl7rorhygNdNTWNdN29NhI12zL39KBxM++qe6K6DH?=
 =?us-ascii?Q?ziPn9h6M/p4DXLY3oGmR3RorQhB+9FQuI44objttnQ63U1VAamynY3ipq0Ju?=
 =?us-ascii?Q?7/YKkIclw8I6dyqFdOEgp4Vlho0eax1woKFpO0bfsHUp0fUPOZCReJ3qSA9X?=
 =?us-ascii?Q?jhUnGC6tgKhObAoho8+xQbWc8pBvuCtw/7h38TNon5iczfcpDkDRjd1ipgaF?=
 =?us-ascii?Q?udlAPRRmBEGR43LJ7f2B1AYmscYWln6mZFeH+/b/6/YuTVd/0YQhqD64H3ST?=
 =?us-ascii?Q?IrkHPGMN1KjqQBTLNpPp5QKGdSZgodiaoYf6BpekcVoDr/H+L28xyKB/9FxJ?=
 =?us-ascii?Q?kCApOxWKTq759iPWpKR6W6l9qa9bpdCyRUvJsI39v4nQFZ2rWW8KONEyeYA3?=
 =?us-ascii?Q?mXJksr9mtF2OLWZuf5evZOlCm8QQTtJpxbJixXyprsmcPVGcgxCT36poJmBK?=
 =?us-ascii?Q?KIyhjqtMggbJi1XsOuZOOaHUR/+HrwsD6PsT+iHn5VLRD/d5RBfwLf7RLqt1?=
 =?us-ascii?Q?78/x4plogNPJH7y8shIp9KtFXDbNcApkB68gmrkswMuR7SqXwCs42MtOX0Li?=
 =?us-ascii?Q?22pdp6EnjuvY1ouObhYcghKMlfXSodXT6C2BxKzPnmQ2/YYgt0zAS3LJtj8E?=
 =?us-ascii?Q?NzKf4ZqvBuWLu709cntJSyVPimurYVTnwLJQcw/Kwy5+EDaxqXO3kmFaGzyq?=
 =?us-ascii?Q?bMS0yRCo6XL+m5pqK+zJfLwdJa7TWnSLShK2g+kIdDrRJdjBaFBH2Mm0zzFX?=
 =?us-ascii?Q?7TTXPohopdEz0XUf993s6e+tj0UR3HR2E788ge+Pb9+TxLeT5YauoVbOngzG?=
 =?us-ascii?Q?Q/dE9nspiSRsXKoHdnVzenAhQaBNH3VMVyl6pyp84ncPlpq+u7zFhi8kw5Lr?=
 =?us-ascii?Q?BfLMpyAKwo3BKy4ISED+HOjUDzhP/5u4B3mffmHlzVVqwUhYPnbBtgue/XdX?=
 =?us-ascii?Q?lmRjJI7D+UTzkagpsq33xEs7EYJX/jlitzX2KAtE3BWtdKg7889z5l5aXQ6o?=
 =?us-ascii?Q?usk7hhlthq8rAOLnTW4qVqafaweGKzR1woGcq3wJVcYJG+hx809OHWQpPlE/?=
 =?us-ascii?Q?K4gWRGURwrZtA4eDqFWKvvjFdPA87fLDXMbLf8MjVR30PWJQkcZWnXhD8PpH?=
 =?us-ascii?Q?69ZKeZ+UeYe5KAXetwauW23I/++5O6TdJQa6IoJWAUmllrSCbbSS0iwpCQzC?=
 =?us-ascii?Q?3crEXAWkEJ0X+FwGKr5go6pOSFqxtp5FhkVs6I2xOluWc2bMAWztTfgdnGnx?=
 =?us-ascii?Q?du/8UPxAzc31MaPZkWsCR3pD6OxAPl6wnsSsdd4O812Et9rlbqQC2yf1ptFp?=
 =?us-ascii?Q?hslkOkNe8Lqe6JAh9sNg9xne1r8vqHiZtnbxgzxeJ3YRlv1yXZ8bx4U5ZxGM?=
 =?us-ascii?Q?mlnRQSP2VPo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Q2lhogtY5do2lC3Vp4+j05AkbD1xT6Vgt+MO8rut/Xc/9Huppv8Mw0X+D1+G?=
 =?us-ascii?Q?SdwmqMEE+xwbdqziLfDvBy3ZP20e5dV5c2331Z1YC3igRV/eCv8UGsO3XZG5?=
 =?us-ascii?Q?sTO+sOAUVgizTO4VQtJ/WkxpKFeutTRdvdSPzhoiYBNHz4gxzRhC79mEjwnB?=
 =?us-ascii?Q?eIwEQbt2xizVIinOCgdLGu/SsZjeVTvcdZbf5A9FbWcaNU3Boj1D9scGqpTw?=
 =?us-ascii?Q?cPlK5jyJPKCBPDdeJrHr/MAnmrtT8/6IaO+W6sYfocIAUddgo8xhepuRuE1P?=
 =?us-ascii?Q?aB5hZQ2qYgVZfMtIniyOKV57ntTKmMbEnIRMdiGNHIOivVFLlRGdf7k+Am39?=
 =?us-ascii?Q?EXpJnADqiFoXQajf1IBxcub2gmO9eY0BMYqi3t86c/IDnAgiRNjiiY/FSfEX?=
 =?us-ascii?Q?vpjIwJCZQiE9MbIyPDLArm4PS9XiMqspNa2W1yoqLAVO8ewuz8+go4TVgFUR?=
 =?us-ascii?Q?r5jZRWJ6NqOfj22kK2sCtRSaz2pCGglYuNaTQ2EXrCvZen6lAMHf1zx/jhWc?=
 =?us-ascii?Q?gTN0dBpeV90EzBuvyL7U8IpVkp/5Z0bWv6QN1rIdPcpkjIGS7BonNeDJU0yK?=
 =?us-ascii?Q?CS3Q9nPnJy0T4cAOnAAEZrkOSPZH/DJMK4vLm0FRIPcbUgi6Mplddza2jdMY?=
 =?us-ascii?Q?esgRCO8F5JeTDnr1gka227Q63PEFRQQtRmAw5xnQXB7v47GEGlW5EMq4FvuY?=
 =?us-ascii?Q?qK8NhmK9rFdZsglkDzLnJ2rMyp0lepHMfc3y4bbWmuDh2Y5SZTHGnLlVPdu9?=
 =?us-ascii?Q?2sopdqQb+txho4U31PkBLHCoy3uLgYBQI4cFsBv5tWqZpcArdUopq0jSntVR?=
 =?us-ascii?Q?RSRvj1BqxIE9jJ98bnUFBzed3X3du2j0hbA4H4ErRcQIqRhk1RAx5OZrt9Ax?=
 =?us-ascii?Q?tXBmiaeR7C8Ehddp7uVrNDN3tWOFkzF2xG8YSRkdURD0d3HkbSSR2lXwDhOo?=
 =?us-ascii?Q?ZBN3IDIxXVxIsGeswkpn96YVLVzFiVNXitR0wWRXsXp2waj6mzeTABJvaXx8?=
 =?us-ascii?Q?TGuXtH7ex+Qr8DyQ9SGLUGmL2DBha6YWRmC13UTMaOEdaqNhNETadgpnUtF+?=
 =?us-ascii?Q?l+RUINMKDhTm5fLgBdrSZydIAJJANS9IiychK9XytV5OS9ucx9Nvo3Job1vS?=
 =?us-ascii?Q?KBB3/ke9UA3/wwjDhRgrbG6c7J71j/XwGgEBOKFdNpVtR3JVDoKR9N4tRMcF?=
 =?us-ascii?Q?q/DXam21zxBtvaYWMXS+J0jdEKMWPkOWEWg7prO6V5xS0j9QBlIvSAuRTW8p?=
 =?us-ascii?Q?ZHabsyNbxW4sj17gHE0S+phajxsbVFXNIV1qXt9qE63AgJW87hZSrtk8dFsm?=
 =?us-ascii?Q?28CsxNIjnzNaEvgvlyK4LRKEy5qNZd5pXp2LPeBukPKUcy5CdmDuyJIflW3E?=
 =?us-ascii?Q?LThFbaQ7dQCQIv16Sd4G7wEDw/WLjatnYntg/3sn2ivhWQoT11l2kdsn/Vtl?=
 =?us-ascii?Q?OGNw6OnUAPCteAsN0irljtIs+zRdAwrMFX0pnmxe80fLHw6Mr6+9h4VkSh/p?=
 =?us-ascii?Q?NXZQBd193fNxukV/0Jz3IqC112YeMMYZQaDOcFYSXc2CrbXp8ix71zPQwk8R?=
 =?us-ascii?Q?vVphPxMD6UaRuaB04Xv4GnGq4lHVy5FC5kFKVvwghRaoEVquj7kV3878sheh?=
 =?us-ascii?Q?xQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7142d7c1-52ea-4f4a-e89b-08ddc95168c5
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 18:56:04.9899 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k6TyYiclQP0w9fz0r59owir3p7zJL1oZCJVqQIylWThtsxwKRHliHq+RjMsVD1iHausLejuq/5eKVzozMcfrvh++Z735Ib6MXWrIZJwnOxA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7169
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

On Tue, Jul 22, 2025 at 08:26:17PM +0200, Michal Wajdeczko wrote:
>We were already testing those two platforms for a while on our CI,
>but enabling flag (has_sriov) was only available on the topic branch
>and only for builds with CONFIG_DRM_XE_DEBUG config.
>
>Since those two platforms are guarded by the another enabling flag
>(require_force_probe) and we believe our SR-IOV support for them is
>at sufficient level to start enjoying the feature, turn on the
>SR-IOV enabling flag unconditionally.
>
>Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi
