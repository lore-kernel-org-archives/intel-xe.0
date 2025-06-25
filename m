Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 775ECC7EE2A
	for <intel-xe@archiver.kernel.org>; Wed, 25 Jun 2025 21:47:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E0E710E07A;
	Wed, 25 Jun 2025 21:47:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KK3d34le";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24BDD10E07A
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Jun 2025 21:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750888055; x=1782424055;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ntr15CVwqIPa08NrWA+h4L9UQmG6KMGoze726L4D73s=;
 b=KK3d34leKkYK+mbD98A0LBXW/iF5SUODmBekPx8VvFnhOtnF8V9RbYdW
 TFgNQOHEsbICnCf6uOvxSLAbGMhx5xO911VkMMM+bzcplaLttvhlqaHTy
 kSx9vf5e50XyDD6sO+KTVF9ZKbt0bVAGJEbDWfbgP+9158LpuYtA4Lk0b
 dNTMa3wYYVbdWd0rmwybtVosVQ6VngT2mHyUdcnSkZ5ds2G9kq1mNog/c
 fFZmooi9rNEErj39/a9ouOgWU6JVceesNaT30QU3CtJ8IoCiI+CwDRlF5
 4DGJXJdRGZjrFTix28dSdKb03c8VRYPBTIZGxZlfmY/KhgAA9XcVQS0ZA g==;
X-CSE-ConnectionGUID: 8SIx26INQD206rEu+I7k8g==
X-CSE-MsgGUID: K35k5hwMTIKHcqzi/+nqQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="64607276"
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="64607276"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 14:47:35 -0700
X-CSE-ConnectionGUID: NsjWY9GYQjqfS9Sk3aVT8Q==
X-CSE-MsgGUID: uUFp5GijRU2VLwNApzIsiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="152635441"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 14:47:34 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 14:47:33 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 25 Jun 2025 14:47:33 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.85)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 14:47:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IrJolHRSEdKB+7r03n7BzopmdJYiN7K6K3oZPLr49WigwNJBzfwtAzETkUO74xnrCAEuuB6J+XSAwXYNWB+lZvLHCbEhh5CapxBuR+JVv+Y9gNs3atBzY3hySMuxwmhMLYdNFP8hldzAWXS1CIfRlmz2Qx9TVGzgYn1cbJiWqg5tEfDOIpSdtUZFgqmVGIQ62X6P8/sXmmiBHdG5itTq+M2Z+yfNr7baGAAULqMTrvSVgFxSyUzVVW0eBKy5+LDv56f3PsydFcrgr6coDln1W+FVR9MWZzMAas3YJHuVwFZIJUSYM26lftb7J2p7pRaXOmt7C5rmVGRp3qjM+L78uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+iXVoJ5k/9+5utk1RkAgb0GAzDtxV7dhWWVH1GCwTik=;
 b=no6PY7cTAWmnG6rxnJ+scYlZyJKNxOtbcbMUtnBTHl8DXpPaVs6Zys9ITovVdsokdgS4IXiSnuBe93pTDv/h5NbOuOuBVxsuplyNPlERGKT/R+pDokM6bgX2S6SY+uEuNGxATwEFHCnLGJlddJm94vdH5+kzz4NoVevR2vaLSfAei8LGu5Q6f4+8qtisrQR4ddXMb/f3CZV1IzEvW4s5OPCqMlsBVwI3A/K0F8qLDoIjfRayBeuTWiWVmxX+qrnT/uf47MhfUO4UX2KOospFKacjw4MfRmjWgh2tuya2YS0NCguBXZ2EgbuiYu7Aky69HGb1oxolgHxc6jpUBXOhnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB7383.namprd11.prod.outlook.com (2603:10b6:8:133::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Wed, 25 Jun
 2025 21:47:30 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8857.022; Wed, 25 Jun 2025
 21:47:30 +0000
Date: Wed, 25 Jun 2025 16:47:28 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>, Matt Roper
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH v5 6/7] drm/xe/xelp: Implement Wa_16010904313
Message-ID: <o6dw26fxwlpnj7dxpbdt2r62662rbyamjb24dcnvzysf3jh2yi@rnragrribl6k>
References: <20250625153632.21220-1-tvrtko.ursulin@igalia.com>
 <20250625153632.21220-7-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250625153632.21220-7-tvrtko.ursulin@igalia.com>
X-ClientProxiedBy: SJ0P220CA0024.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::32) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB7383:EE_
X-MS-Office365-Filtering-Correlation-Id: fe7a0a8e-c909-44e8-85d4-08ddb431e2a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6MPKIgYePMhCDYj3dEYW1kZNaxkr5LBEjJJQ+jVJucAA0QHSK4E2u5zU8nfq?=
 =?us-ascii?Q?mC5oGg5d7V8qpUhi0+QcmnybtR1GorezOaroYOAMTospayqHepW+nbF4WYFT?=
 =?us-ascii?Q?PqlZzqwxDCYBv490rK9dFQ2xjCRYmfewl1ME8joPLjYdztdwoj0nyRmImD2p?=
 =?us-ascii?Q?FVOA9X2vibloR7oPofttojvznK6HyWkDXUKQ+QdHsxcYthArcf5FlOo1voKg?=
 =?us-ascii?Q?6GRvrIulk2KoRZEAOb8Po8oknqiiBlxZaYNsq7bmVx8Rv50C80AIpJi+d06l?=
 =?us-ascii?Q?1WbvrgIjHTvsLKrfaZcgfX35Ow64CTglykEBJ0S0hrNhOVEEchU5QViHfOIR?=
 =?us-ascii?Q?gCiLsQjXrHyKbDSCAHF8xx/AWWBp9GJvRvDsr9sPa4bKAK6nVr0QinJ6fIQo?=
 =?us-ascii?Q?48e/wa04EK3UI0fTrSmrsHxi6LlJSNleyNPIa6zAPsDjaIctwpxExrdSNjEy?=
 =?us-ascii?Q?EtaPb/CCsuUCXcjFqmvU5xqoZt2UbP4dAxXRoRGrFxrG+BzdWmUDJMAS1lR2?=
 =?us-ascii?Q?DMb6TGxZD3Dm/37nKiq1xk2jXnWFudm/lN3y9l0OpAzUxwaNJKS8U54ldido?=
 =?us-ascii?Q?1AIuM686iF+5xtIsbPoMlByxhFleUJ7+pFuYCAC+/wR87Es099ulii15l7qM?=
 =?us-ascii?Q?3mOSIU17XxzLev091/xAlgqr+KqSemPAUtwMGrTlwBtZl+4IN7pV3WWaBt6h?=
 =?us-ascii?Q?wdqeuo5SBmQv++n5545LMXk+pMfQcHGze7iO0BKzjLgqeVtOAYKnH997idIe?=
 =?us-ascii?Q?hfy3XaEw+VzKysg2YnQ7fkIgwfTwEzJJFEAFEZikKY1cj5w7j6bjuUzhNnW4?=
 =?us-ascii?Q?4mPG3bvV5EmT2mTISkw6xPkl59JvRmsVNdlc/A37mQCv6YvnXrIgjORD74sd?=
 =?us-ascii?Q?6lUHpRaeLwySh642eUiebORQn5IXQI8oIFDTa/xsinLeSncz+zvW4COG/5G8?=
 =?us-ascii?Q?nQr7sTPhhhfFJ/SIs3UA3gVK+/2GRb6OjycZkKp16Jg0gedftdLaLf+lrc5g?=
 =?us-ascii?Q?LHrUcJwv/o1MiCbFFtNeD7hOfheKEMnlsJR52wzmcHuXnyKH2jhBveQ4a694?=
 =?us-ascii?Q?tCw3zGxGnfMTqittmSxNRVt/YzAQdbJ6ecFk1Y6jg+yyUOT5CIC0XCO29lzX?=
 =?us-ascii?Q?KpFP1IttE4HU6RFw/mO0LMLEk+LaT+E8ajYbi+2evEeidXLxlghCTRkcyr2p?=
 =?us-ascii?Q?I7dpf7XWi9itKqAgvNPXkhAcQvU90usX9LOW4w/mT9gJhVvwyYZZwmsbVint?=
 =?us-ascii?Q?6ZH7hp0smuDEPkKx2ijgFVQv4Tf5PCjM7fsSSViTFyxgwQaez4c07nBI2clm?=
 =?us-ascii?Q?WXlvf/CNYhpyYNCOn3yG73Y1MXzufBgTsGFnJyTROk6J12f6psRWosZ/lqws?=
 =?us-ascii?Q?CAaI5ge6J3YzoSUbQQL15/c09uF89wc8iVEquwnBVdiZMfhbyAFI5kVikS2T?=
 =?us-ascii?Q?RMGgZC4HK+Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?g8xJI1e3a5PH5rdpWioQr6SramRhyAwqDrE4FRJ4OoNgfFExMsXuqRYh6H37?=
 =?us-ascii?Q?PR44igee3IXtwh8oyH4Tho2u3NWY+t0ybUq0jC5VrbCQQmQ11W3YE2nyIbiI?=
 =?us-ascii?Q?kjfF2pKGGzKw8pTpBMlVBk5E3vLFQxxYeWaf0whu2HkvZ+ShJvqvMYtXbXYM?=
 =?us-ascii?Q?oTjBIpZQB/wk78ehic0pOmKcrETAKJZ+dkVXOmpKaIYD7o+ilB0Hp4rNvvBV?=
 =?us-ascii?Q?hhT5ZqqwrMHWX/6R084y2O2UGwyUZsVt/q879ItTSm9sS5wBs5rKXgDKtYAZ?=
 =?us-ascii?Q?jH/ZJMvqtJcr49FlYxj6jeRq7n29sqfoX/lU3mGY+AGFcuNVlZRQfsF+NuLK?=
 =?us-ascii?Q?5F4nOToA5eFYJyaAVDJF6RmapAlzYdecLa7Og2hMVHNB9EMKnSnSlZatoz7J?=
 =?us-ascii?Q?8z6FCPlfIT7HdGNo9Au6ZX37ceTC8NanaSao3lgfsijenUYnVo+/cuCd+qA+?=
 =?us-ascii?Q?3iMNbwBJzG76Gq25kH1igk41C+7XsOiVYzRz1b07uVb/yLMQySaN85kmiJ5U?=
 =?us-ascii?Q?rQU47DwHBNYNH4JvJyaIORiadYG1uXZFJhu9ZGjbBmJ5X8OsUiipHimTNLYs?=
 =?us-ascii?Q?kOvwU72EBUHYWZexB/7uoKPkomC1/kxJp5kiZrIMjy1yK82UsA2k1UdXgQeq?=
 =?us-ascii?Q?bhiJSU30Ww2NQ2zBahiR8E19bVDoPUzJLaNlAiVQJn4s1fg+2ghDjlwkCs2P?=
 =?us-ascii?Q?oHUnluEn2D4bDdjAK48bnXw0RkMRZHe+r4jNlvAMjtv2RGe3TNIDzcY6Ru6C?=
 =?us-ascii?Q?kq/iAtMaNGJNZ9/Z2a26qUtp/yMjGjMYs8gZKCjwALuv6Sd7VxKQBACo71BP?=
 =?us-ascii?Q?xfS++gS75rMqagiP6T5wUgAZjWDJYHig5+RnnQagSElmPSOOVcsSJdNuChm0?=
 =?us-ascii?Q?npSQ7Hw+aj0Ub49U3lzch2rJ6LN9Zu5qC2cCtwqQDhMzKNH4FnhDERdT3FnT?=
 =?us-ascii?Q?2sD/vmgyk4Y4taw3pZEXK/R4JUfQ1qS4BxSS9EqJ/NfJWGQnA5sZbeNYvCX1?=
 =?us-ascii?Q?8kH26MRuXbKV+09CP/Gou+sU2wTUkMNuHZpYwVBbHQptBTCEZgBgW8KEjkH3?=
 =?us-ascii?Q?QH8rgdgYzClbu2sa97p+iePn10hIlSMICzQf6utmbqspr7YSg2c2zZVdFP/G?=
 =?us-ascii?Q?FNw2so14Gpr5cnA12hYyBkrgwGHoShNQNw6esdSVc/g2chfM9TFqKxsz9Xsf?=
 =?us-ascii?Q?VIWjrDUIwN5F1DbzmDrohxv8j7WxR4O3Fq/bUOODH/JC1ZZbCPQjknlUpvp5?=
 =?us-ascii?Q?JV3i83P0OYKm+4jKrSpTOgJMFN2QqHG4fqfKfQtdQ8vfY6PEKpshp2qLD8Lf?=
 =?us-ascii?Q?kBOjW1Uzc08V84y58UU1rItlG1JxF024+0fD+FRUexZ84HLh1nVxi8uSf+hH?=
 =?us-ascii?Q?VnGcq0+G6+5NTh8k4OQ3tWBkswEcydMsEdss4RwYmCqdlaH3ScbGjyEXH3uG?=
 =?us-ascii?Q?w3AnIjeqEtWxFNVRnp6S2IhGD8GFZb6Irw6sWRXTwHH86SxH2WZj/9YcXVsK?=
 =?us-ascii?Q?JdCH7jI/aVbCvnjpgc9w9GSct7BLmdjYiYlse2XtEFPt49eV6ko5jqimB0El?=
 =?us-ascii?Q?hLJrXsVW16JyS2N+bB4srjCmAUF2sLjn1wdUBW0O904dglpHR3Yd3IAfEl2Y?=
 =?us-ascii?Q?Nw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fe7a0a8e-c909-44e8-85d4-08ddb431e2a1
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 21:47:30.7638 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Wcoqj9D1LdyW+3ywB9BFnV4UoHvwz1V1z7LpgSqRrKJVRxcw+rTeZIoMkAwATnuMtQRORj/GzN/Ul6MIyno9AanV/hysi6K3+tHLNOGCZM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7383
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

On Wed, Jun 25, 2025 at 04:36:31PM +0100, Tvrtko Ursulin wrote:
>Add XeLP workaround 16010904313.
>
>The description calls for it to be emitted as the indirect context buffer
>workaround for render and compute, and from the workaround batch buffer
>for the other engines. Therefore we plug into the previously added
>respective top level emission functions.
>
>The actual command streamer programming sequence differs from what is
>described in the PRM, in that it assumes the listed LRCA offset was
>supposed to actually refer to the location of the CTX_TIMESTAMP register
>instead of LRCA + 0x180c (which is in GPR space). Latter appears to make
>more sense under the assumption that multiple writes are helping with
>restoring the CTX_TIMESTAMP register content from the saved context state.

humn... but i915, which is supposedly doing the right thing,
diverges from the PRM by using LRM + LRR + LRR. Here you are doing
something different from both. Does gputop show saner values after this?

>
>Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Matt Roper <matthew.d.roper@intel.com>
>---
> .../gpu/drm/xe/instructions/xe_mi_commands.h  |  1 +
> drivers/gpu/drm/xe/xe_lrc.c                   | 45 +++++++++++++++++++
> drivers/gpu/drm/xe/xe_wa_oob.rules            |  1 +
> 3 files changed, 47 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
>index e3f5e8bb3ebc..c47b290e0e9f 100644
>--- a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
>+++ b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
>@@ -65,6 +65,7 @@
>
> #define MI_LOAD_REGISTER_MEM		(__MI_INSTR(0x29) | XE_INSTR_NUM_DW(4))
> #define   MI_LRM_USE_GGTT		REG_BIT(22)
>+#define   MI_LRM_ASYNC			REG_BIT(21)
>
> #define MI_LOAD_REGISTER_REG		(__MI_INSTR(0x2a) | XE_INSTR_NUM_DW(3))
> #define   MI_LRR_DST_CS_MMIO		REG_BIT(19)
>diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>index d4f558a863eb..f86a09ed6848 100644
>--- a/drivers/gpu/drm/xe/xe_lrc.c
>+++ b/drivers/gpu/drm/xe/xe_lrc.c
>@@ -52,6 +52,11 @@ lrc_to_xe(struct xe_lrc *lrc)
> static bool
> gt_engine_needs_indirect_ctx(struct xe_gt *gt, enum xe_engine_class class)
> {
>+	if (XE_WA(gt, 16010904313) &&
>+	    (class == XE_ENGINE_CLASS_RENDER ||
>+	     class == XE_ENGINE_CLASS_COMPUTE))
>+		return true;
>+
> 	return false;
> }
>
>@@ -990,6 +995,44 @@ static ssize_t wa_bb_setup_utilization(struct xe_lrc *lrc, struct xe_hw_engine *
> 	return cmd - batch;
> }
>
>+static ssize_t
>+xelp_emit_timestamp_wa(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>+		       u32 *batch, size_t max_len)
>+{
>+	const u32 ts_addr = __xe_lrc_ctx_timestamp_ggtt_addr(lrc);
>+	u32 *cmd = batch;
>+
>+	if (!XE_WA(lrc->gt, 16010904313) ||
>+	    !(hwe->class == XE_ENGINE_CLASS_RENDER ||
>+	      hwe->class == XE_ENGINE_CLASS_COMPUTE ||
>+	      hwe->class == XE_ENGINE_CLASS_COPY ||
>+	      hwe->class == XE_ENGINE_CLASS_VIDEO_DECODE ||
>+	      hwe->class == XE_ENGINE_CLASS_VIDEO_ENHANCE))
>+		return 0;
>+
>+	if (xe_gt_WARN_ON(lrc->gt, max_len < 12))
>+		return -ENOSPC;
>+
>+	*cmd++ = MI_LOAD_REGISTER_MEM | MI_LRM_USE_GGTT | MI_LRI_LRM_CS_MMIO |
>+		 MI_LRM_ASYNC;
>+	*cmd++ = RING_CTX_TIMESTAMP(0).addr;
>+	*cmd++ = ts_addr;
>+	*cmd++ = 0;
>+
>+	*cmd++ = MI_LOAD_REGISTER_MEM | MI_LRM_USE_GGTT | MI_LRI_LRM_CS_MMIO |
>+		 MI_LRM_ASYNC;
>+	*cmd++ = RING_CTX_TIMESTAMP(0).addr;
>+	*cmd++ = ts_addr;
>+	*cmd++ = 0;
>+
>+	*cmd++ = MI_LOAD_REGISTER_MEM | MI_LRM_USE_GGTT | MI_LRI_LRM_CS_MMIO;
>+	*cmd++ = RING_CTX_TIMESTAMP(0).addr;
>+	*cmd++ = ts_addr;
>+	*cmd++ = 0;
>+
>+	return cmd - batch;
>+}
>+
> struct wa_bo_setup {
> 	ssize_t (*setup)(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
> 			 u32 *batch, size_t max_size);
>@@ -1061,6 +1104,7 @@ static void finish_wa_bo(struct xe_lrc *lrc,
> static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
> {
> 	static const struct wa_bo_setup funcs[] = {
>+		{ .setup = xelp_emit_timestamp_wa },
> 		{ .setup = wa_bb_setup_utilization },

I think there's a mix of names here. It seems it would be better to name
these like this:

static const struct bo_setup funcs[] = {
	{ .setup = bo_setup_timestamp_wa },
	{ .setup = bo_setup_utilization },
}


> 	};
> 	unsigned int offset = __xe_lrc_wa_bb_offset(lrc);
>@@ -1087,6 +1131,7 @@ static int
> setup_indirect_ctx(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
> {
> 	static struct wa_bo_setup rcs_funcs[] = {
>+		{ .setup = xelp_emit_timestamp_wa },
> 	};

here it would be:

  	static struct bo_setup rcs_funcs[] = {
		{ .setup = bo_setup_timestamp_wa },
  	};

or drop the bo_ prefix too and just use setup_xyz


Lucas De Marchi

> 	unsigned int offset, num_funcs, written = 0;
> 	struct wa_bo_setup *funcs = NULL;
>diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
>index 8c2aa48cb33a..51967489c564 100644
>--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
>+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
>@@ -1,4 +1,5 @@
> 1607983814	GRAPHICS_VERSION_RANGE(1200, 1210)
>+16010904313	GRAPHICS_VERSION_RANGE(1200, 1210)
> 22012773006	GRAPHICS_VERSION_RANGE(1200, 1250)
> 14014475959	GRAPHICS_VERSION_RANGE(1270, 1271), GRAPHICS_STEP(A0, B0)
> 		PLATFORM(DG2)
>-- 
>2.48.0
>
