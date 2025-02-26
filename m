Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 209E8C021B8
	for <intel-xe@archiver.kernel.org>; Wed, 26 Feb 2025 21:46:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C489910E2FA;
	Wed, 26 Feb 2025 21:46:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BwDawnvM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16B4D10E259
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Feb 2025 21:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740606400; x=1772142400;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=Lf/KK2eBBkuVPxR8xIaoGuVxdbqNCi6FZ7qF2XF5nhA=;
 b=BwDawnvMpI6iKGmsfHGXYQJmrKJxhl/tmOu5FxUoemkSQyrvr/IR2K2I
 U58581+27MdFWPMWDY1z+9VHrJ5NKvuK/ccw7ivlJwhboV0EmDcusCD0D
 dN7oG2Yc2OFbioxFz/BhaMH4m6k3F0fkynWEFqleyAWQ9WaM0B2sA4OW0
 8w73wIR5/cyu5j39t2MUg6DYdfurWrusdSBUDcJBxPjuSLDOTDbemiEjj
 13vj32zBSG/KQNOqhOxoX3eYGFIxF6idarKxLrOsrceHZokb0yD3NQh6o
 B3PuCUPluwii7FZuwT/SkKUnMuGFN6tKJjobgi/hKxwsQ5dcOF5sMBPCr A==;
X-CSE-ConnectionGUID: MrySkGlpQuGs3hPaVR1N1A==
X-CSE-MsgGUID: bVV8lKKeRe+QabCpYvtx2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="41325990"
X-IronPort-AV: E=Sophos;i="6.13,318,1732608000"; d="scan'208";a="41325990"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 13:46:40 -0800
X-CSE-ConnectionGUID: ZEo7dGyPSeuXwzBkBo1OLg==
X-CSE-MsgGUID: xPCBjs4HQsyQ8/OXiiiRMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,318,1732608000"; d="scan'208";a="121938849"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 13:46:39 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 26 Feb 2025 13:46:38 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 26 Feb 2025 13:46:38 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 26 Feb 2025 13:46:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zEqs1r6cqI1QWONdC5Up4VqOV7sjqBw2tlffZMbvwGUlvR1GA0FHqFoLPeHaiVgbX71oNGkDyT+azSOBNDsTltTeiZ/ulSaDiOrimom9FDkHVkJABO/I3kSbrjnPdhquMpuP0g0O6q0Pd5hMCPHaqlTN7dfwjERF9/Dnrj5hIRFzeqzusW5RSzAyT2F1effgJQ2DzH3fQT9re/jnZUXiyCR6gnJh8MGwMq1H3MMDof+JNL4fAy9EEWKNCVgp0b1ppKB6o2BtfSimQAojpZ1NuPWlJxAoaENHM/m71LqMUMt/bJ7XefTS3RCy9VJR/M0nRKcfWOWsKxCIRXhm0b2qgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Em6DXCLsOHK7KWbejsHBdIA8AXV/pzu9yTU9w7MTlA=;
 b=PraufJ2WVvEpT3DXlLsbVwfyXojlSpA3nqd9VjZXHptG2qYC2oMoQ8ifaGi8U7E+DOUoaarAEIWOCWWGSaFOyn7UUn/FwREeaoLZ/OoQu9Ut+MjjsY+8UKRa+QCp4hcU73JmAcP/p1SeRyqK4YNFq3BC/6MMRb7Wa5OdEqLKPDZiljQKMwyiETJtvFSDL8f6aYEwyYW6etVNblBWH6b5UM+cXF9P2ho6ijAbmSKT/6PFjFa82u7R9QNo0pD2PJdRGrEaIKzFDurfha8x2+pu6wAd2AiCydpT6cxAsRA7U7MKPX1rSsDQO6gPoHyiUatK3Vq0iu8HMKsbjSvkdD6Vsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH8PR11MB6925.namprd11.prod.outlook.com (2603:10b6:510:227::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Wed, 26 Feb
 2025 21:46:33 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8466.016; Wed, 26 Feb 2025
 21:46:33 +0000
Date: Wed, 26 Feb 2025 13:46:31 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw=?= =?utf-8?Q?=3A?= failure for
 drm/xe: Eliminate usage of TIMESTAMP_OVERRIDE
Message-ID: <20250226214631.GE5109@mdroper-desk1.amr.corp.intel.com>
References: <20250225224908.1671554-2-matthew.d.roper@intel.com>
 <174053697318.2172308.7135936144805731888@b555e5b46a47>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <174053697318.2172308.7135936144805731888@b555e5b46a47>
X-ClientProxiedBy: SJ0PR03CA0266.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::31) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH8PR11MB6925:EE_
X-MS-Office365-Filtering-Correlation-Id: d2e27dbd-1a0b-4b14-4585-08dd56af0960
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iBcaSMxubu+yM2K6zuILm3mrf8QPp1x4ixJxawJ3ko7A18GWfx6G0IaNxb5o?=
 =?us-ascii?Q?d1WHMC7dIfCTLjCTqSb+qtDulWk6JP5uqk8UZO8Ma9hmblJTq54vaV+vfuGw?=
 =?us-ascii?Q?iB04WQhI4xknEN0doN5kL5v+k8tbA3ehqy+BBQBwgIIsfROZcEv6tokVi1PY?=
 =?us-ascii?Q?jvaEUsdam/cVEj2Z91EuQHAWdDf9z2epffpU5dFt5GDWdg616E7VuT2SVozK?=
 =?us-ascii?Q?vDUFIUpB9OJ/SlTCo/XZ5A7BENsP4PObBw0KZSV5zhpkkNnJpi30kwdUo7p1?=
 =?us-ascii?Q?9jhfY6qrAizD3yKdE2dcpCJrzcxHfzFoCCcb6NMyULmOD0I3JDwIPn/mnM1C?=
 =?us-ascii?Q?omX5MY37RVFwZ0rZtKx6hHkXz+kQklZ8zA17yPasww49mq+tKJ7VknByTnO9?=
 =?us-ascii?Q?QC4Iu5JPv+YKEv3DkeKLVtOvznIAIIm9gNbwS1jUzb8caNfBXqzcK1qs39+A?=
 =?us-ascii?Q?cGY3TALO0gihJCincSoWAeS6ZOHGutuEXfqR9UH5seBhY5BM3WRhDb8hwvqf?=
 =?us-ascii?Q?7BldGxpoFBBdzt4qFy3uy/fiUsV1OkPd+w8n2w/HhL0yVU8z5m4a4ha/J2OR?=
 =?us-ascii?Q?8OV5QKh9JtYSqTKgbFAljn0KGFu9T1s4Rva1WNcZ5031QmuAOFYKNypill8/?=
 =?us-ascii?Q?aUsRifeSxntZW0ymx+0N+w6rU8MtrdzBHt9qqtkKe6cCL7daQUzHWX0x/T7R?=
 =?us-ascii?Q?2nqPLF3p/eZgGLU9wO8L61cbTjpZWgHGiMjGD4Da0N+78ZDHM7McrOQYg5s6?=
 =?us-ascii?Q?be7Q5SqqUVmvLBGiw5rxd+VJmYfczCAx6c8gkfRFW65GxtdhEDRfcYQ5mMPI?=
 =?us-ascii?Q?8dclkxjiVhobr6nFEhYYqDChaGMtcLDsWHVLokSaAT/I96F10QSNXMBiQk3Z?=
 =?us-ascii?Q?0jFU/Bzq5FrudPhEevWdMK0ZG2XRXjCb988yLbEMWy8Swd1znjeel9SIvpDM?=
 =?us-ascii?Q?ETiOWCqss/hAeFefyTke/kRtmwXs210720kcq538D3QDMCmjBLoAHTGD973p?=
 =?us-ascii?Q?0Imk6tOre6xL+p7UuuSU+BrvYSzKqDR061dkoHv8WX4av35zU9Sf4Tlykfwi?=
 =?us-ascii?Q?/6GbcoS7+ajnrQpKU1opGbrNbtOHN/cr2Kv9qvP1ayRN/41CKUX4y20kcAbS?=
 =?us-ascii?Q?etkO0g6Ggq0xuQBVGYq+5wtBmlsPAHPYkAxul+uMTSu5zVLj/yFS6ESGO0Wt?=
 =?us-ascii?Q?JAIaQzlV4YOhHMRG165qwMH9lf/rSQCmsoUWnEzwj5XUBHEO6y3xOqGbA4hF?=
 =?us-ascii?Q?vVgVsn1LrgQgtMnwtmgNtSuBZ0rMV5MI3lI6WW15RsmBK//Z4x+KvjeqHeGa?=
 =?us-ascii?Q?jxvvUIz6kq8Y1xP+D/S5uuFQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3IQycRywdbUPKk/MVwTKBUXmLyOXQM3OMV27ByrcjaoLGeMdJ9QGtNaCnU67?=
 =?us-ascii?Q?NqrDOnu+F8mp76ZPvOI3V2rO3euYPa+nbG/VFgrbaa2bO42ttPSH1CDJQ9sF?=
 =?us-ascii?Q?15pzm92pSdoa4WPtALjfvsS3b8q1MOlP/SJE55tRzRufIDBXh1mEhFCaGUM4?=
 =?us-ascii?Q?StZTWvJMEJGb7286XObI55O8L4JFlOWx/rc/mCLkJ6SgHlg78mKKrtf0cTF9?=
 =?us-ascii?Q?S8+NNgwaqlaEGWZJzzLPLT0WiqlyurefQPdb1Sj0AQ3C5h7tTViZ22Q2pJXN?=
 =?us-ascii?Q?/vz6xHhatiT+emHZeOSmbvV2OMCJWQk59D3yhT5UrxbwCFGt86lvVQDmXcQh?=
 =?us-ascii?Q?ThfKwPh5xkworP8BaNJk0ysleFPhyGycJs6SXu4koN5VC6fxZTwq7UypGFsy?=
 =?us-ascii?Q?LDKaVM5GFqG9KdSdFPOggD6G80W2y/O3eVGuQz6NKGr142lBCsF2zX05Sfue?=
 =?us-ascii?Q?DuUDoju4CKWIr5Lqn47ajQo6TWmEHnAMeD6WxFcrEKYCo3SEbZXgSXzjHwsQ?=
 =?us-ascii?Q?m1juiZqMZLjM9dbgRwnO/Pc7p5VgXLgIP+sBUb0hHHEkQCc+FwZRLINOIMLA?=
 =?us-ascii?Q?4KP9NwwLpzghdOSkNpONWIs9gRtlUI5HH/GjgFsd0NHkj5WHyxz0JojKTBVP?=
 =?us-ascii?Q?20Q2X9eaduMeNMOGNKeq7HoM/rCLra9+EmN0a1QNRnowHFrXPOgT8H+Pt4Mf?=
 =?us-ascii?Q?ySHZEt3WULmnrx5bcdvhpOimLO1bVAi1NsJKci1vNlyjnmL2M3GVHP/EcDxF?=
 =?us-ascii?Q?a3SdjpAX5+2bpdkbc8eMp+Iq/ZPppWdwJHfP0cXaG+iXd9ZlypgYqGFHjHKa?=
 =?us-ascii?Q?nIY0D8MG89IuEkZ4TUWkIIvfqV1WiF0F1Fcgxun5c978busq4B1gg3GhmGnD?=
 =?us-ascii?Q?OBM8AE8BkfcrT5mLrbxV+C2XhjY7bKzWj/qSsGP/1E+mASIcRzLzOkFgvrRJ?=
 =?us-ascii?Q?aM0viv6yh1JhTpbQXytCxtX7OOvgb+e9Bm2O4Lb1nB2IQcHEKmbxCxvCIRva?=
 =?us-ascii?Q?Dr7h+TKIbX/HK5HFggTXddQcC5yq9D9XgSmbz+Ya9CT15Z+wVktMDgVtqbqo?=
 =?us-ascii?Q?PX3y4AGQtfc4wxhAW3SoqylsU3+T7wa+MTtXnHPbz+Rt6a3V4KRqaCCGJUZy?=
 =?us-ascii?Q?eIBJH24rJ4fAkF/4ij/qSMspMdsEKto4AOqlRbTHMHawn20JS6tWp0iK4C3P?=
 =?us-ascii?Q?0pNz1LKtQZvqimIYifXoVqWq3z7Xjytgnpt3JghaKW66eO3SneQ+iaombUAH?=
 =?us-ascii?Q?4GwWRVZ3RxsLtA5l4tbRdjSMXgsuUjGaS0PEXioBVtixkME/NfHdkZ4buQTB?=
 =?us-ascii?Q?N4vnmhe/eIvMFTxTNIyyattaO+CWbNqyADuNb0DknODCBkbFdtzVatM8Gt7L?=
 =?us-ascii?Q?0VkqNxTIUMa/vTdM1ZaQzDq5fwlx67FPt95jKlTPsp5BQGR+cWoOWZtw/N0m?=
 =?us-ascii?Q?PAE214IUqqVMvmy5hvXBd2TN1K8ZGq+wuh3qhpcGUD6SqQzlvBMW+ebuA9Aj?=
 =?us-ascii?Q?5Mr/enhUXazmQnxSGO41dPhu7NCLbP+y1xdBviNag43rH5nJZ+4yguuoDSM6?=
 =?us-ascii?Q?oBvY1GAGR37WydNVxBKOf7Y3KHqwPd61zfmMLHBHKgCZpinxEoFGMBQzQg5r?=
 =?us-ascii?Q?KQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d2e27dbd-1a0b-4b14-4585-08dd56af0960
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 21:46:33.5408 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9P1eyfeMYuB8mmfr90Nj1IaO93z72NQ012ewEvAK1cKacGkZbTVkLDcpeISNlEtk0hFLUh5pacg9/gtX1QOcLe4YMWpIlTWWfD0THs4UFwY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6925
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

On Wed, Feb 26, 2025 at 02:29:33AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe: Eliminate usage of TIMESTAMP_OVERRIDE
> URL   : https://patchwork.freedesktop.org/series/145437/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-2711-c7988865b658d56bcfaac76b7d72cc59435565eb_full -> xe-pw-145437v1_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-145437v1_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-145437v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-145437v1_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][1]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145437v1/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html

Skip because the monitor doesn't support 6bpc output.  Unrelated to this
patch.

> 
>   
> #### Warnings ####
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
>     - shard-dg2-set2:     [DMESG-WARN][2] ([Intel XE#4330]) -> [DMESG-WARN][3] +1 other test dmesg-warn
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2711-c7988865b658d56bcfaac76b7d72cc59435565eb/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145437v1/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html

<4> [319.697183] done.

This seems to be something that happens sporadically when general driver
debug messages sneak in between these two calls in
kernel/power/process.c during system resume:

        pr_info("Restarting tasks ... ");
        ...
        pr_cont("done.\n");

Since those two prints were supposed to be on the same line, the
continuation seems to be coming out with "warn" level (at least at the
point CI reads it from syslog).


Patch applied to drm-xe-next.  Thanks Lucas for the review.


Matt

> 
>   
> New tests
> ---------
> 
>   New tests have been introduced between xe-2711-c7988865b658d56bcfaac76b7d72cc59435565eb_full and xe-pw-145437v1_full:
> 
> ### New IGT tests (42) ###
> 
>   * igt@kms_async_flips@test-time-stamp@pipe-c-dp-4:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.18] s
> 
>   * igt@kms_async_flips@test-time-stamp@pipe-d-dp-4:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.18] s
> 
>   * igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-c-hdmi-a-2:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-d-hdmi-a-2:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-dp-4:
>     - Statuses : 1 pass(s)
>     - Exec time: [4.64] s
> 
>   * igt@kms_flip@absolute-wf_vblank@c-dp4:
>     - Statuses : 1 pass(s)
>     - Exec time: [4.08] s
> 
>   * igt@kms_flip@blocking-absolute-wf_vblank@c-dp4:
>     - Statuses : 1 pass(s)
>     - Exec time: [4.05] s
> 
>   * igt@kms_flip@blocking-absolute-wf_vblank@d-dp4:
>     - Statuses : 1 pass(s)
>     - Exec time: [4.08] s
> 
>   * igt@kms_flip@bo-too-big-interruptible@c-dp4:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.21] s
> 
>   * igt@kms_flip@bo-too-big-interruptible@d-dp4:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.19] s
> 
>   * igt@kms_flip@dpms-off-confusion-interruptible@c-dp4:
>     - Statuses : 1 pass(s)
>     - Exec time: [3.96] s
> 
>   * igt@kms_flip@dpms-off-confusion-interruptible@d-dp4:
>     - Statuses : 1 pass(s)
>     - Exec time: [3.96] s
> 
>   * igt@kms_flip@dpms-off-confusion@c-dp4:
>     - Statuses : 1 pass(s)
>     - Exec time: [3.99] s
> 
>   * igt@kms_flip@dpms-off-confusion@d-dp4:
>     - Statuses : 1 pass(s)
>     - Exec time: [3.99] s
> 
>   * igt@kms_flip@dpms-vs-vblank-race-interruptible@c-dp4:
>     - Statuses : 1 pass(s)
>     - Exec time: [1.77] s
> 
>   * igt@kms_flip@dpms-vs-vblank-race-interruptible@d-dp4:
>     - Statuses : 1 pass(s)
>     - Exec time: [1.82] s
> 
>   * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-dp4:
>     - Statuses : 1 pass(s)
>     - Exec time: [4.32] s
> 
>   * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@d-dp4:
>     - Statuses : 1 pass(s)
>     - Exec time: [4.31] s
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp4:
>     - Statuses : 1 pass(s)
>     - Exec time: [3.96] s
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4:
>     - Statuses : 1 pass(s)
>     - Exec time: [3.96] s
> 
>   * igt@kms_flip@flip-vs-panning-interruptible@c-dp4:
>     - Statuses : 1 pass(s)
>     - Exec time: [3.99] s
> 
>   * igt@kms_flip@flip-vs-panning-interruptible@d-dp4:
>     - Statuses : 1 pass(s)
>     - Exec time: [3.98] s
> 
>   * igt@kms_flip@flip-vs-panning-vs-hang@d-dp4:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.76] s
> 
>   * igt@kms_flip@flip-vs-rmfb@c-dp4:
>     - Statuses : 1 pass(s)
>     - Exec time: [3.97] s
> 
>   * igt@kms_flip@flip-vs-rmfb@d-dp4:
>     - Statuses : 1 dmesg-warn(s)
>     - Exec time: [3.97] s
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@c-dp4:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.94] s
> 
>   * igt@kms_flip@flip-vs-suspend@c-dp4:
>     - Statuses : 1 incomplete(s)
>     - Exec time: [2.94] s
> 
>   * igt@kms_flip@modeset-vs-vblank-race-interruptible@c-dp4:
>     - Statuses : 1 pass(s)
>     - Exec time: [1.84] s
> 
>   * igt@kms_flip@modeset-vs-vblank-race@c-dp4:
>     - Statuses : 1 pass(s)
>     - Exec time: [1.84] s
> 
>   * igt@kms_flip@nonexisting-fb-interruptible@c-dp4:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.21] s
> 
>   * igt@kms_flip@nonexisting-fb@c-dp4:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.24] s
> 
>   * igt@kms_flip@plain-flip-fb-recreate@c-dp4:
>     - Statuses : 1 pass(s)
>     - Exec time: [4.29] s
> 
>   * igt@kms_flip@plain-flip-ts-check-interruptible@c-dp4:
>     - Statuses : 1 pass(s)
>     - Exec time: [4.24] s
> 
>   * igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset@c-dp4:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.71] s
> 
>   * igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset@d-dp4:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.69] s
> 
>   * igt@kms_flip@wf_vblank-ts-check-interruptible@c-dp4:
>     - Statuses : 1 pass(s)
>     - Exec time: [4.34] s
> 
>   * igt@kms_flip@wf_vblank-ts-check-interruptible@d-dp4:
>     - Statuses : 1 pass(s)
>     - Exec time: [4.34] s
> 
>   * igt@kms_hdr@invalid-metadata-sizes@pipe-a-dp-4:
>     - Statuses : 1 dmesg-warn(s)
>     - Exec time: [0.00] s
> 
>   * igt@kms_plane_multiple@tiling-x@pipe-c-dp-4:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.88] s
> 
>   * igt@kms_plane_multiple@tiling-x@pipe-d-dp-4:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.91] s
> 
>   * igt@kms_plane_scaling@invalid-num-scalers@pipe-c-dp-4-invalid-num-scalers:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.02] s
> 
>   * igt@kms_plane_scaling@invalid-num-scalers@pipe-d-dp-4-invalid-num-scalers:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.02] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-145437v1_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-dp-2-4-rc-ccs-cc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][4] ([Intel XE#2550] / [Intel XE#3767]) +15 other tests skip
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145437v1/shard-dg2-432/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-dp-2-4-rc-ccs-cc.html
> 
>   * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
>     - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#1124])
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145437v1/shard-bmg-6/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html
> 
>   * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
>     - shard-bmg:          [PASS][6] -> [SKIP][7] ([Intel XE#2314] / [Intel XE#2894])
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2711-c7988865b658d56bcfaac76b7d72cc59435565eb/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145437v1/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
>     - shard-bmg:          [PASS][8] -> [INCOMPLETE][9] ([Intel XE#3862]) +1 other test incomplete
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2711-c7988865b658d56bcfaac76b7d72cc59435565eb/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145437v1/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#3432])
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145437v1/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][11] ([Intel XE#4330]) +16 other tests dmesg-warn
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145437v1/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][12] ([Intel XE#787]) +158 other tests skip
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145437v1/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#455] / [Intel XE#787]) +29 other tests skip
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145437v1/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     [PASS][14] -> [INCOMPLETE][15] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) +1 other test incomplete
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2711-c7988865b658d56bcfaac76b7d72cc59435565eb/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145437v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_chamelium_audio@hdmi-audio:
>     - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2252])
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145437v1/shard-bmg-6/igt@kms_chamelium_audio@hdmi-audio.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#373])
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145437v1/shard-dg2-463/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html
> 
>   * igt@kms_color@ctm-blue-to-red:
>     - shard-bmg:          [PASS][18] -> [DMESG-WARN][19] ([Intel XE#4330]) +6 other tests dmesg-warn
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2711-c7988865b658d56bcfaac76b7d72cc59435565eb/shard-bmg-6/igt@kms_color@ctm-blue-to-red.html
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145437v1/shard-bmg-7/igt@kms_color@ctm-blue-to-red.html
> 
>   * igt@kms_content_protection@srm@pipe-a-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][20] ([Intel XE#1178])
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145437v1/shard-dg2-433/igt@kms_content_protection@srm@pipe-a-dp-4.html
> 
>   * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
>     - shard-bmg:          [PASS][21] -> [SKIP][22] ([Intel XE#2291])
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2711-c7988865b658d56bcfaac76b7d72cc59435565eb/shard-bmg-1/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145437v1/shard-bmg-6/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
>     - shard-dg2-set2:     [PASS][23] -> [SKIP][24] ([Intel XE#309]) +5 other tests skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2711-c7988865b658d56bcfaac76b7d72cc59435565eb/shard-dg2-435/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145437v1/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html
> 
>   * igt@kms_feature_discovery@display-2x:
>     - shard-dg2-set2:     [PASS][25] -> [SKIP][26] ([Intel XE#702])
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2711-c7988865b658d56bcfaac76b7d72cc59435565eb/shard-dg2-435/igt@kms_feature_discovery@display-2x.html
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145437v1/shard-dg2-464/igt@kms_feature_discovery@display-2x.html
> 
>   * igt@kms_flip@2x-blocking-absolute-wf_vblank:
>     - shard-dg2-set2:     [PASS][27] -> [SKIP][28] ([Intel XE#310]) +8 other tests skip
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2711-c7988865b658d56bcfaac76b7d72cc59435565eb/shard-dg2-432/igt@kms_flip@2x-blocking-absolute-wf_vblank.html
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145437v1/shard-dg2-464/igt@kms_flip@2x-blocking-absolute-wf_vblank.html
> 
>   * igt@kms_flip@2x-flip-vs-panning-vs-hang:
>     - shard-bmg:          [PASS][29] -> [SKIP][30] ([Intel XE#2316]) +5 other tests skip
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2711-c7988865b658d56bcfaac76b7d72cc59435565eb/shard-bmg-1/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145437v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
> 
>   * igt@kms_flip@flip-vs-rmfb@d-hdmi-a3:
>     - shard-bmg:          NOTRUN -> [DMESG-WARN][31] ([Intel XE#4330]) +5 other tests dmesg-warn
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145437v1/shard-bmg-1/igt@kms_flip@flip-vs-rmfb@d-hdmi-a3.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible:
>     - shard-adlp:         [PASS][32] -> [DMESG-WARN][33] ([Intel XE#2953]) +1 other test dmesg-warn
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2711-c7988865b658d56bcfaac76b7d72cc59435565eb/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible.html
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145437v1/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible.html
> 
>   * igt@kms_flip@flip-vs-suspend@c-dp4 (NEW):
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][34] ([Intel XE#2049] / [Intel XE#2597])
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145437v1/shard-dg2-433/igt@kms_flip@flip-vs-suspend@c-dp4.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
>     - shard-dg2-set2:     [PASS][35] -> [DMESG-WARN][36] ([Intel XE#4330]) +5 other tests dmesg-warn
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2711-c7988865b658d56bcfaac76b7d72cc59435565eb/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145437v1/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:
>     - shard-adlp:         [PASS][37] -> [DMESG-FAIL][38] ([Intel XE#4330])
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2711-c7988865b658d56bcfaac76b7d72cc59435565eb/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145437v1/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
>     - shard-dg2-set2:     [PASS][39] -> [SKIP][40] ([Intel XE#656]) +3 other tests skip
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2711-c7988865b658d56bcfaac76b7d72cc59435565eb/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145437v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#653]) +1 other test skip
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145437v1/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html
> 
>   * igt@kms_plane_scaling@2x-scaler-multi-pipe:
>     - shard-bmg:          [PASS][42] -> [SKIP][43] ([Intel XE#2571])
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2711-c7988865b658d56bcfaac76b7d72cc59435565eb/shard-bmg-1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145437v1/shard-bmg-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-d:
>     - shard-bmg:          [PASS][44] -> [DMESG-WARN][45] ([Intel XE#2566] / [Intel XE#4330]) +1 other test dmesg-warn
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2711-c7988865b658d56bcfaac76b7d72cc59435565eb/shard-bmg-4/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-d.html
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145437v1/shard-bmg-1/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-d.html
>     - shard-dg2-set2:     [PASS][46] -> [DMESG-WARN][47] ([Intel XE#2566] / [Intel XE#4330]) +1 other test dmesg-warn
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2711-c7988865b658d56bcfaac76b7d72cc59435565eb/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-d.html
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145437v1/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-d.html
> 
>   * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
>     - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#1489])
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145437v1/shard-bmg-6/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr@pr-cursor-plane-onoff:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#2850] / [Intel XE#929])
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145437v1/shard-dg2-463/igt@kms_psr@pr-cursor-plane-onoff.html
> 
>   * igt@kms_setmode@basic-clone-single-crtc:
>     - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#1435])
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145437v1/shard-bmg-6/igt@kms_setmode@basic-clone-single-crtc.html
> 
>   * igt@kms_setmode@clone-exclusive-crtc:
>     - shard-dg2-set2:     [PASS][51] -> [SKIP][52] ([Intel XE#455])
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2711-c7988865b658d56bcfaac76b7d72cc59435565eb/shard-dg2-432/igt@kms_setmode@clone-exclusive-crtc.html
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145437v1/shard-dg2-464/igt@kms_setmode@clone-exclusive-crtc.html
> 
>   * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
>     - shard-dg2-set2:     [PASS][53] -> [SKIP][54] ([Intel XE#1392]) +6 other tests skip
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2711-c7988865b658d56bcfaac76b7d72cc59435565eb/shard-dg2-434/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145437v1/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
> 
>   * igt@xe_peer2peer@write:
>     - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#2427])
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145437v1/shard-bmg-6/igt@xe_peer2peer@write.html
> 
>   * igt@xe_pm@s4-vm-bind-prefetch:
>     - shard-bmg:          NOTRUN -> [ABORT][56] ([Intel XE#4268])
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145437v1/shard-bmg-6/igt@xe_pm@s4-vm-bind-prefetch.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
>     - shard-dg2-set2:     [SKIP][57] ([Intel XE#2191]) -> [PASS][58] +1 other test pass
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2711-c7988865b658d56bcfaac76b7d72cc59435565eb/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145437v1/shard-dg2-434/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
>     - shard-bmg:          [SKIP][59] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][60]
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2711-c7988865b658d56bcfaac76b7d72cc59435565eb/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145437v1/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:
>     - shard-dg2-set2:     [INCOMPLETE][61] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) -> [PASS][62] +1 other test pass
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2711-c7988865b658d56bcfaac76b7d72cc59435565eb/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145437v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
>     - shard-bmg:          [SKIP][63] ([Intel XE#2291]) -> [PASS][64] +4 other tests pass
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2711-c7988865b658d56bcfaac76b7d72cc59435565eb/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145437v1/shard-bmg-7/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
>     - shard-dg2-set2:     [SKIP][65] ([Intel XE#309]) -> [PASS][66] +4 other tests pass
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2711-c7988865b658d56bcfaac76b7d72cc59435565eb/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145437v1/shard-dg2-434/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
>     - shard-bmg:          [DMESG-WARN][67] ([Intel XE#877]) -> [PASS][68]
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2711-c7988865b658d56bcfaac76b7d72cc59435565eb/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145437v1/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
> 
>   * igt@kms_feature_discovery@display-2x:
>     - shard-bmg:          [SKIP][69] ([Intel XE#2373]) -> [PASS][70]
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2711-c7988865b658d56bcfaac76b7d72cc59435565eb/shard-bmg-6/igt@kms_feature_discovery@display-2x.html
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145437v1/shard-bmg-8/igt@kms_feature_discovery@display-2x.html
> 
>   * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
>     - shard-dg2-set2:     [SKIP][71] ([Intel XE#310]) -> [PASS][72] +3 other tests pass
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2711-c7988865b658d56bcfaac76b7d72cc59435565eb/shard-dg2-464/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145437v1/shard-dg2-433/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html
> 
>   * igt@kms_flip@2x-flip-vs-dpms:
>     - shard-dg2-set2:     [DMESG-WARN][73] ([Intel XE#2955]) -> [PASS][74]
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2711-c7988865b658d56bcfaac76b7d72cc59435565eb/shard-dg2-432/igt@kms_flip@2x-flip-vs-dpms.html
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145437v1/shard-dg2-433/igt@kms_flip@2x-flip-vs-dpms.html
> 
>   * igt@kms_flip@2x-nonexisting-fb:
>     - shard-bmg:          [SKIP][75] ([Intel XE#2316]) -> [PASS][76] +3 other tests pass
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2711-c7988865b658d56bcfaac76b7d72cc59435565eb/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145437v1/shard-bmg-8/igt@kms_flip@2x-nonexisting-fb.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6:
>     - shard-dg2-set2:     [FAIL][77] ([Intel XE#301]) -> [PASS][78] +2 other tests pass
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2711-c7988865b658d56bcfaac76b7d72cc59435565eb/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145437v1/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html
> 
>   * igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a3:
>     - shard-bmg:          [FAIL][79] ([Intel XE#2882]) -> [PASS][80] +1 other test pass
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2711-c7988865b658d56bcfaac76b7d72cc59435565eb/shard-bmg-6/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a3.html
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145437v1/shard-bmg-6/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a3.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:
>     - shard-adlp:         [DMESG-FAIL][81] ([Intel XE#4330]) -> [PASS][82] +1 other test pass
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2711-c7988865b658d56bcfaac76b7d72cc59435565eb/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145437v1/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:
>     - shard-dg2-set2:     [SKIP][83] ([Intel XE#656]) -> [PASS][84] +10 other tests pass
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2711-c7988865b658d56bcfaac76b7d72cc59435565eb/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145437v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html
> 
>   * igt@kms_joiner@basic-force-big-joiner:
>     - shard-dg2-set2:     [SKIP][85] ([Intel XE#4328]) -> [PASS][86]
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2711-c7988865b658d56bcfaac76b7d72cc59435565eb/shard-dg2-464/igt@kms_joiner@basic-force-big-joiner.html
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145437v1/shard-dg2-432/igt@kms_joiner@basic-force-big-joiner.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak:
>     - shard-adlp:         [FAIL][87] ([Intel XE#771] / [Intel XE#899]) -> [PASS][88]
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2711-c7988865b658d56bcfaac76b7d72cc59435565eb/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak.html
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145437v1/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1:
>     - shard-adlp:         [FAIL][89] ([Intel XE#899]) -> [PASS][90]
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2711-c7988865b658d56bcfaac76b7d72cc59435565eb/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145437v1/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_vblank@query-forked@pipe-d-dp-2:
>     - shard-bmg:          [DMESG-WARN][91] ([Intel XE#4330]) -> [PASS][92] +10 other tests pass
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2711-c7988865b658d56bcfaac76b7d72cc59435565eb/shard-bmg-4/igt@kms_vblank@query-forked@pipe-d-dp-2.html
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145437v1/shard-bmg-1/igt@kms_vblank@query-forked@pipe-d-dp-2.html
> 
>   * igt@kms_vblank@wait-idle@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     [DMESG-WARN][93] ([Intel XE#4330]) -> [PASS][94] +5 other tests pass
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2711-c7988865b658d56bcfaac76b7d72cc59435565eb/shard-dg2-464/igt@kms_vblank@wait-idle@pipe-d-hdmi-a-6.html
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145437v1/shard-dg2-433/igt@kms_vblank@wait-idle@pipe-d-hdmi-a-6.html
> 
>   * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:
>     - shard-dg2-set2:     [SKIP][95] ([Intel XE#1392]) -> [PASS][96] +6 other tests pass
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2711-c7988865b658d56bcfaac76b7d72cc59435565eb/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145437v1/shard-dg2-435/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html
> 
>   * igt@xe_pm@s3-basic:
>     - shard-dg2-set2:     [DMESG-WARN][97] ([Intel XE#4330] / [Intel XE#569]) -> [PASS][98]
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2711-c7988865b658d56bcfaac76b7d72cc59435565eb/shard-dg2-432/igt@xe_pm@s3-basic.html
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145437v1/shard-dg2-433/igt@xe_pm@s3-basic.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][99] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][100] ([Intel XE#787]) +6 other tests skip
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2711-c7988865b658d56bcfaac76b7d72cc59435565eb/shard-dg2-464/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145437v1/shard-dg2-434/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][101] ([Intel XE#787]) -> [SKIP][102] ([Intel XE#455] / [Intel XE#787]) +6 other tests skip
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2711-c7988865b658d56bcfaac76b7d72cc59435565eb/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6.html
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145437v1/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_color@ctm-max@pipe-d-hdmi-a-3:
>     - shard-bmg:          [DMESG-WARN][103] ([Intel XE#4330]) -> [DMESG-WARN][104] ([Intel XE#4330] / [Intel XE#877]) +1 other test dmesg-warn
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2711-c7988865b658d56bcfaac76b7d72cc59435565eb/shard-bmg-5/igt@kms_color@ctm-max@pipe-d-hdmi-a-3.html
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145437v1/shard-bmg-5/igt@kms_color@ctm-max@pipe-d-hdmi-a-3.html
> 
>   * igt@kms_content_protection@atomic-dpms:
>     - shard-dg2-set2:     [FAIL][105] ([Intel XE#1178]) -> [SKIP][106] ([Intel XE#455])
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2711-c7988865b658d56bcfaac76b7d72cc59435565eb/shard-dg2-435/igt@kms_content_protection@atomic-dpms.html
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145437v1/shard-dg2-464/igt@kms_content_protection@atomic-dpms.html
>     - shard-bmg:          [FAIL][107] ([Intel XE#1178]) -> [SKIP][108] ([Intel XE#2341])
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2711-c7988865b658d56bcfaac76b7d72cc59435565eb/shard-bmg-1/igt@kms_content_protection@atomic-dpms.html
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145437v1/shard-bmg-6/igt@kms_content_protection@atomic-dpms.html
> 
>   * igt@kms_content_protection@srm:
>     - shard-dg2-set2:     [DMESG-FAIL][109] ([Intel XE#4330]) -> [FAIL][110] ([Intel XE#1178])
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2711-c7988865b658d56bcfaac76b7d72cc59435565eb/shard-dg2-432/igt@kms_content_protection@srm.html
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145437v1/shard-dg2-433/igt@kms_content_protection@srm.html
> 
>   * igt@kms_content_protection@uevent:
>     - shard-dg2-set2:     [FAIL][111] ([Intel XE#1188]) -> [SKIP][112] ([Intel XE#455])
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2711-c7988865b658d56bcfaac76b7d72cc59435565eb/shard-dg2-463/igt@kms_content_protection@uevent.html
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145437v1/shard-dg2-464/igt@kms_content_protection@uevent.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
>     - shard-dg2-set2:     [SKIP][113] ([Intel XE#309]) -> [DMESG-WARN][114] ([Intel XE#4330]) +1 other test dmesg-warn
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2711-c7988865b658d56bcfaac76b7d72cc59435565eb/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145437v1/shard-dg2-432/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
>     - shard-dg2-set2:     [SKIP][115] ([Intel XE#455]) -> [DMESG-WARN][116] ([Intel XE#4330])
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2711-c7988865b658d56bcfaac76b7d72cc59435565eb/shard-dg2-464/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145437v1/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
> 
>   * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:
>     - shard-bmg:          [SKIP][117] ([Intel XE#2316]) -> [DMESG-WARN][118] ([Intel XE#2955]) +1 other test dmesg-warn
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2711-c7988865b658d56bcfaac76b7d72cc59435565eb/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145437v1/shard-bmg-1/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html
> 
>   * igt@kms_flip@2x-flip-vs-panning:
>     - shard-bmg:          [INCOMPLETE][119] ([Intel XE#2049]) -> [SKIP][120] ([Intel XE#2316])
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2711-c7988865b658d56bcfaac76b7d72cc59435565eb/shard-bmg-1/igt@kms_flip@2x-flip-vs-panning.html
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145437v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-panning.html
> 
>   * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
>     - shard-dg2-set2:     [SKIP][121] ([Intel XE#310]) -> [DMESG-WARN][122] ([Intel XE#4330])
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2711-c7988865b658d56bcfaac76b7d72cc59435565eb/shard-dg2-464/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145437v1/shard-dg2-432/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
> 
>   * igt@kms_flip@flip-vs-rmfb:
>     - shard-bmg:          [DMESG-WARN][123] ([Intel XE#2955] / [Intel XE#4330]) -> [DMESG-WARN][124] ([Intel XE#2955])
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2711-c7988865b658d56bcfaac76b7d72cc59435565eb/shard-bmg-4/igt@kms_flip@flip-vs-rmfb.html
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145437v1/shard-bmg-1/igt@kms_flip@flip-vs-rmfb.html
> 
>   * igt@kms_flip@flip-vs-suspend:
>     - shard-bmg:          [DMESG-WARN][125] ([Intel XE#2955]) -> [INCOMPLETE][126] ([Intel XE#2049] / [Intel XE#2597])
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2711-c7988865b658d56bcfaac76b7d72cc59435565eb/shard-bmg-5/igt@kms_flip@flip-vs-suspend.html
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145437v1/shard-bmg-8/igt@kms_flip@flip-vs-suspend.html
>     - shard-dg2-set2:     [DMESG-WARN][127] ([Intel XE#2955]) -> [INCOMPLETE][128] ([Intel XE#2049] / [Intel XE#2597])
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2711-c7988865b658d56bcfaac76b7d72cc59435565eb/shard-dg2-464/igt@kms_flip@flip-vs-suspend.html
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145437v1/shard-dg2-433/igt@kms_flip@flip-vs-suspend.html
> 
>   * igt@kms_flip@flip-vs-suspend@d-hdmi-a3:
>     - shard-bmg:          [DMESG-WARN][129] ([Intel XE#4330]) -> [INCOMPLETE][130] ([Intel XE#2049] / [Intel XE#2597])
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2711-c7988865b658d56bcfaac76b7d72cc59435565eb/shard-bmg-5/igt@kms_flip@flip-vs-suspend@d-hdmi-a3.html
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145437v1/shard-bmg-8/igt@kms_flip@flip-vs-suspend@d-hdmi-a3.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
>     - shard-dg2-set2:     [SKIP][131] ([Intel XE#656]) -> [SKIP][132] ([Intel XE#651]) +14 other tests skip
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2711-c7988865b658d56bcfaac76b7d72cc59435565eb/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145437v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
>     - shard-bmg:          [SKIP][133] ([Intel XE#2312]) -> [SKIP][134] ([Intel XE#2311]) +9 other tests skip
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2711-c7988865b658d56bcfaac76b7d72cc59435565eb/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145437v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
>     - shard-bmg:          [SKIP][135] ([Intel XE#2311]) -> [SKIP][136] ([Intel XE#2312]) +10 other tests skip
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2711-c7988865b658d56bcfaac76b7d72cc59435565eb/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145437v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:
>     - shard-bmg:          [SKIP][137] ([Intel XE#2312]) -> [SKIP][138] ([Intel XE#4141]) +3 other tests skip
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2711-c7988865b658d56bcfaac76b7d72cc59435565eb/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145437v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt:
>     - shard-bmg:          [SKIP][139] ([Intel XE#4141]) -> [SKIP][140] ([Intel XE#2312]) +3 other tests skip
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2711-c7988865b658d56bcfaac76b7d72cc59435565eb/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145437v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:
>     - shard-dg2-set2:     [SKIP][141] ([Intel XE#651]) -> [SKIP][142] ([Intel XE#656]) +13 other tests skip
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2711-c7988865b658d56bcfaac76b7d72cc59435565eb/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145437v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt:
>     - shard-bmg:          [SKIP][143] ([Intel XE#2313]) -> [SKIP][144] ([Intel XE#2312]) +11 other tests skip
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2711-c7988865b658d56bcfaac76b7d72cc59435565eb/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145437v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
>     - shard-bmg:          [SKIP][145] ([Intel XE#2312]) -> [SKIP][146] ([Intel XE#2313]) +9 other tests skip
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2711-c7988865b658d56bcfaac76b7d72cc59435565eb/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145437v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:
>     - shard-dg2-set2:     [SKIP][147] ([Intel XE#653]) -> [SKIP][148] ([Intel XE#656]) +13 other tests skip
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2711-c7988865b658d56bcfaac76b7d72cc59435565eb/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145437v1/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
>     - shard-dg2-set2:     [SKIP][149] ([Intel XE#656]) -> [SKIP][150] ([Intel XE#653]) +14 other tests skip
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2711-c7988865b658d56bcfaac76b7d72cc59435565eb/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145437v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_pm_rpm@modeset-stress-extra-wait:
>     - shard-dg2-set2:     [DMESG-WARN][151] -> [DMESG-WARN][152] ([Intel XE#4330])
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2711-c7988865b658d56bcfaac76b7d72cc59435565eb/shard-dg2-464/igt@kms_pm_rpm@modeset-stress-extra-wait.html
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145437v1/shard-dg2-433/igt@kms_pm_rpm@modeset-stress-extra-wait.html
> 
>   * igt@kms_setmode@invalid-clone-single-crtc-stealing:
>     - shard-bmg:          [SKIP][153] ([Intel XE#1435]) -> [DMESG-WARN][154] ([Intel XE#4330])
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2711-c7988865b658d56bcfaac76b7d72cc59435565eb/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145437v1/shard-bmg-1/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-bmg:          [FAIL][155] ([Intel XE#1729]) -> [SKIP][156] ([Intel XE#2426])
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2711-c7988865b658d56bcfaac76b7d72cc59435565eb/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145437v1/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@xe_pm@s4-vm-bind-prefetch:
>     - shard-dg2-set2:     [INCOMPLETE][157] -> [ABORT][158] ([Intel XE#4268])
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2711-c7988865b658d56bcfaac76b7d72cc59435565eb/shard-dg2-435/igt@xe_pm@s4-vm-bind-prefetch.html
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145437v1/shard-dg2-464/igt@xe_pm@s4-vm-bind-prefetch.html
> 
>   * igt@xe_pm@s4-vm-bind-unbind-all:
>     - shard-bmg:          [ABORT][159] ([Intel XE#4054]) -> [ABORT][160] ([Intel XE#4268])
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2711-c7988865b658d56bcfaac76b7d72cc59435565eb/shard-bmg-7/igt@xe_pm@s4-vm-bind-unbind-all.html
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145437v1/shard-bmg-2/igt@xe_pm@s4-vm-bind-unbind-all.html
> 
>   * igt@xe_pm@s4-vm-bind-userptr:
>     - shard-adlp:         [ABORT][161] ([Intel XE#4054]) -> [ABORT][162] ([Intel XE#4268])
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2711-c7988865b658d56bcfaac76b7d72cc59435565eb/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.html
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145437v1/shard-adlp-2/igt@xe_pm@s4-vm-bind-userptr.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
>   [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
>   [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
>   [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
>   [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
>   [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
>   [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
>   [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>   [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
>   [Intel XE#2550]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2550
>   [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
>   [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
>   [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
>   [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
>   [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
>   [Intel XE#2955]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2955
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
>   [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
>   [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
>   [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#3767]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
>   [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
>   [Intel XE#4054]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4054
>   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>   [Intel XE#4268]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4268
>   [Intel XE#4328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4328
>   [Intel XE#4330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330
>   [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#702]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
>   [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
>   [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-2711-c7988865b658d56bcfaac76b7d72cc59435565eb -> xe-pw-145437v1
> 
>   IGT_8247: 8247
>   xe-2711-c7988865b658d56bcfaac76b7d72cc59435565eb: c7988865b658d56bcfaac76b7d72cc59435565eb
>   xe-pw-145437v1: 145437v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145437v1/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
