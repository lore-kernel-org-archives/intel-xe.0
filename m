Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC408C98321
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 15:18:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FBCE10FB73;
	Fri, 25 Sep 2026 15:18:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZM8b95CQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC64610FB73
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Sep 2026 15:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790349519; x=1821885519;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=yhlV1aPGPmsrTgkaOfc7PRD23GD1ZYkSlZV9ja1fH+U=;
 b=ZM8b95CQ3vQHc8Xkyp1JEUYT1TqivDzspeiEcpmxvPKW0XHOFYIQGyvc
 VsA1YJptukOU+p7dCEE69jwIKlgpGeuVw6de3YIQCumSeqEHdeOqAwuc+
 KRstpDS0A3+5a7Lj3W8fNVwQsi2vYSsr8IIlyI6TpDoAZfxa8ahGyv3pk
 ym/+DfmgLLA0dH80N6SOCbUe2G65NmUuge1cpp26L8zAB0Bzu/w29OrYw
 AAmYYPEQLwc6xO8eyDZKCM6codS1yabQWoidPcSAsampwSF9n9qGEvX4r
 sM4HNy+XiIrsLv0KZE6jUlZUt9JgJ/nCqeDcL9u4bwPVCp9J1IQT5p8Vv Q==;
X-CSE-ConnectionGUID: /Y+ph0/tSpOHNsVo3Xp7Iw==
X-CSE-MsgGUID: /DbEnjVpRiageXSqhQrmKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="93854707"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; d="scan'208";a="93854707"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 08:18:39 -0700
X-CSE-ConnectionGUID: YfdBRnxbQJCV5TzcOo80fw==
X-CSE-MsgGUID: ht+aqt6+RZadPRJLLHhG/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; d="scan'208";a="273919308"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 08:18:39 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 08:18:37 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 25 Sep 2026 08:18:37 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.37) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 08:18:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TzUk4tDjJd2B2oJ57ZB7/D+PWuy2c6s3t8z7wFLbPrhLPJTs+aMJ6eWXVt2O40a/FnWsyAZbQlJNyJ4cC1AQebrQ+mzYPcaqSi0/p39jgrxkqEXspEVx9sLYg2GRMOdU3DE/0cncSVssMndmvAY7BmLntVFOCWbNkR1mcHQ2ircOzogUu7dm/lxtqcWBhWayKR74thW22kQBX0fImRMb5IesXXt22NocM0/FjJpnE5A0kxo98JD1rGv58Ipg0FyC4PVC//d57ggEozBA2Vy/+gu9rfUVqshn4itmCImoyrLUr3VDYD9aDKdwKDM9Z9Yae7jmOoEsohWjfyAy/QJfog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ae0P0v0VveCrcnMsVt6+ot6OXLbup7S/+EoSKYCK88Y=;
 b=oB060UKVvzQyvCUxy4KQ1A+lhFOVXD/gHpihelYWxPJ4uNRmrhNoLI9UKi6OWrY7oakBhSWZJlInnVSOjPrFui5pfE6lCFRS8cChKWw4tj5tZrQzl5WAAnUzPXvzrtRURjJeafQ3xzDBpcNgiHhHlLynaOVKfcKRyhcmQmfck3KTyBWgZtuA9YMEeDDjIm/JsAe4bFbOXLv9GdAGNj1RrKUL+MfJkU8KEbepIgjt3sHoCcOsQozRGuLYmGL2yMp7ISa+UhBzaSLcDxH6y10jFJwV0XrOcy8vL5zAxg0j2UWwI8DQIpZwcIOaJzOdah0uV2p1Y5OFB96Qod6ZfwwpUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA1PR11MB7199.namprd11.prod.outlook.com (2603:10b6:208:418::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 15:18:30 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%6]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 15:18:29 +0000
Date: Fri, 25 Sep 2026 08:18:27 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZVTEw6IGZhaWx1?= =?utf-8?Q?re?= for
 Revert "drm/xe: Set mask bits for CCS_MODE register"
Message-ID: <20260925151827.GI730887@mdroper-desk1.amr.corp.intel.com>
References: <20260924-ccs_mode_drop_mask-v1-1-5b2b35708b83@intel.com>
 <179033747331.206383.13068292788199069046@61270ab9df2a>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <179033747331.206383.13068292788199069046@61270ab9df2a>
X-ClientProxiedBy: SJ2P220CA0007.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5da::13) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA1PR11MB7199:EE_
X-MS-Office365-Filtering-Correlation-Id: 8169af7c-7278-4fea-6a55-08df1b1840b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|4143699003|56012099006|11063799006|5023799004|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: Djqh5fx41vgBtsWjY7zoms/tssWrFxYWA7EDnie808MpSTo94BdSLdHXRK3aBP8sW2OegrU30qcRs0whylzad5/X9YTPrYLyEbFZ97hyiAt43t6PpWRcAn3NLBe2bghPSVqhxR1n5EJqvcfYvnwQoVG8KcoFlYuGgQOiIq4TN80VJgkEytJJNlUlOUc+LlYwT0Au9NI50eX42WuUiWo16UK6A2V7RlpTkQ8JJrJ//H6VmWlsNWUaPsq7iIOBnQtp0ryp4BFOTlhWMgocoQAujSqXsj+6GwWQVgwXKv93H3DW9KcCl+8jkfcBXxkkwr4OQEwh0Wjm6hqTqtpmO037vXM7qIjb2bqMEtdtU4kk7m61QZIY3OcsAxHx5oPmbGoZyLIDBeU2jBROWa49ZSUeJzPum9BExep0WIRvbzbUOHwDd09/z047FIxjzFXHaJ1Zoyvy+dM1SBI8d2JXrGi26DRI7E+wuRLKUIECcc9okxs1FriDTCxjpWYbCd9HBlJ3FmtAGLgy49aaJgRq0ZhNWu8vLPvGRV5/5vi2Cu1uiF3ProZ/uISVaPx1PdoNCX6K58o1g1NzYAmqTgoIakhEVydSAc+67gqP1B5DrM1UoBQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(4143699003)(56012099006)(11063799006)(5023799004)(10067099003)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iQHT90f6FG0pqa4zTMSrzptbQW5pY0lnkCN/mdnmlfy6Qoyzngy9pcHYCza1?=
 =?us-ascii?Q?3Cr0ih0qdddYc8iC+/x601eBvGNXkDab+ExWNTVJ5XquY6GoyDDgUdAMX3wU?=
 =?us-ascii?Q?p0rLCBODsT5+pmKVZSCBwV98noXCrZnCJKlqyU8op2K9oDd467Sw4LeAfhqD?=
 =?us-ascii?Q?kLSTS7/5+H6KB8zhbyWipil0c6rgOx2LpzHM7vfdLf+vDQSeNfZ1B6Jkw928?=
 =?us-ascii?Q?EcCwElYtoE9Jgx6+EFs/jmhaGyWA4ALg/rV5WOAbiP9GxZ8S3yhog5Ea7Ji8?=
 =?us-ascii?Q?dLPcUTVIDREw8UdtKY9fZFfaVweQteD3Wkq+l96uQoq4y9CtLtF1fnEojsoZ?=
 =?us-ascii?Q?287g6q41ykCwDWvnVYu0NmNx+oVaZCG0c4rknt8kcUs3cNV6Kl4j7H7+LhFI?=
 =?us-ascii?Q?u38SZ1RBUY12cCk0LaqB4IqoO1hSRzpoZoeTr402twXAtf20esXx0QsGONVk?=
 =?us-ascii?Q?33TEZyUKlB7B26QCZQNJDiEyGxJVE4Id7okk6CCQpzLHDofOqXestauvFMmn?=
 =?us-ascii?Q?lONT0k0H6P7pFh9mWah4ZOHl7QkV72gPWU0npy9FeUMV/xOX007Kd1buz/6l?=
 =?us-ascii?Q?SEbi3tleL7XL252e3+6Pn+bwotCsHJJhY/NkIzuewk2RhiroQTyePSCkqemH?=
 =?us-ascii?Q?bsA9c+bRnDjlEo7CBLBUbmG4pCRblmAwxCtzB6fqvCwekht93w4ruFB7NfTo?=
 =?us-ascii?Q?hgm4vW0n+fquFFTlGuH6NYCOXAFw75opU5mcr6EnR63wvCMiKmK3Pr46uTGA?=
 =?us-ascii?Q?n8zPuSwsXv9irzsg8uZz8q/Myqu8CUtI3YluFGpYsJwuOA+01DHHxwtbSSYf?=
 =?us-ascii?Q?RyHk66kKik13Ukn+55FYs06413Om5vrZoA0Sd8zLGyxXeRikUL1Ts6zjk8hP?=
 =?us-ascii?Q?WuLh9dN2AAEgeGXn2muExBWafOt1diQyq+CL2XaV8XI+xoa2n0LvhrXG+nhb?=
 =?us-ascii?Q?6vdHHIfdKuzkwZgv/MPp2jNEYKvHOvOfIF5LkS0F5kGyJ9eCuyaHviGJ0sYg?=
 =?us-ascii?Q?jPoBatzuDp9DPiSDw5kYYEujV7hp0IGALYwPoLEMVFHqbJnKVBHYimqr32Qr?=
 =?us-ascii?Q?kD/OdKY6Fq0Y+81iE6H5y86zKfOxM+bzMD3CsnrN8S20SbnGpdRkBj0IL9Kp?=
 =?us-ascii?Q?lDhsSf20pnO0TQbTnK40XIYBkV2ZqtBR1NtgQ3b4oFJW/Zjh9vtoc7v2Xols?=
 =?us-ascii?Q?+jyUtYvbDeGwUdAHLcwgFZsv+GB4fNX5S2AwtJLgwGngv7mQ/zXZqThwBjNF?=
 =?us-ascii?Q?/CV/zb8KH1nurFut3qcEGHHjMz+nz5HdQ8UzQlS+NNf1zQ9429VIDyW8jhej?=
 =?us-ascii?Q?xMtzqVWYszD+XbUXRVx8zRjoaCUnp1uzlEAxkcSifPSKWryBnSrJHm1fPR/A?=
 =?us-ascii?Q?yvj0Mf4DiItLUaQNNmwqiSE6NV38D+mVMe/u2TAkLkaSTF4n5/Ff/VvqX01n?=
 =?us-ascii?Q?1bf4g3SgG5T5NPmv17LvBDAZ754qHSFYMuvAIupsjK0pnwPz26yEbbk+bTX0?=
 =?us-ascii?Q?xVcMN65MKh3qaUcjmwb03Fa+aRh5ulO0g2PhT+PkFTnN1C467p2hx6z/KZv4?=
 =?us-ascii?Q?1Dr8EjyfbhBHWwSyXZkdFn+D0vVTCXZ9yXnlINVSiqmpElaTPyczPtfJekIF?=
 =?us-ascii?Q?9ALQGK9J0zj2pkZINkQVJpLxSLY33IlW+089t84DqoCZbm3cU1BkLzg6tY/V?=
 =?us-ascii?Q?5iGWxQvFk0+W2hVjYXsIkk0jhyjv5Csa7JJNaHPqJKkiBCgrpJvbrF+4/Ycz?=
 =?us-ascii?Q?hwOxORoEIgeztP+XHv6sol94CAMSEgs=3D?=
X-Exchange-RoutingPolicyChecked: QE/G7PiMrMipjB39NTe2T89PWTliD0cum1Ylz20aB6HtmEzYGrwBrPrplxR8AMIGGHK8wjCHyGIDmiRC452poff5u5tKiBP/6S1XXQepgPbRkQkHJx2xaBNWUMwxiClY7HlmWbuYWKiBeywyhq7xv5nOQLANe+Xv2kXZ2b5nQPu/V1jnlUuAtizP2NZdDHMZZ/JCPFbuBbdND9GfPRuJDnSLxoMq1g1dXmKgY5FrC+VSN2Ste6zSYv/NJPgDDLcNWKvfOR5yX7KdUdEnhspKaLYGZekRqid6UY1k9g4NIJUfUM/yJ/DBo5lXKCJgom+Je4yow7xLGJlYIQ9KyqdfFQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8169af7c-7278-4fea-6a55-08df1b1840b5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 15:18:29.2789 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sb6Y6keBETAsASebHkyTBjDiKbwNKRA4HRW1GM4A6XLXva5+pPzvQX5ec/irbsiEuJJtszx/q4/wXo+w8V7EPNra46ua/GnH9jAGCVBiUKE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7199
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

On Fri, Sep 25, 2026 at 11:57:53AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Revert "drm/xe: Set mask bits for CCS_MODE register"
> URL   : https://patchwork.freedesktop.org/series/174948/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-5823-2ac16c180109b3f1ed00e7a2c4459eaacfc80371_FULL -> xe-pw-174948v1_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-174948v1_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-174948v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (3 -> 3)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-174948v1_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_rotation_crc@sprite-rotation-180:
>     - shard-bmg:          NOTRUN -> [INCOMPLETE][1]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-bmg-1/igt@kms_rotation_crc@sprite-rotation-180.html

Looks like CI lost connection to the device during a display test.  Not
related to the GT programming change here.

Applied to drm-xe-next.  Thanks Daniel for the review.


Matt

> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-174948v1_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@intel_hwmon@hwmon-write:
>     - shard-bmg:          NOTRUN -> [FAIL][2] ([Intel XE#8583])
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-bmg-3/igt@intel_hwmon@hwmon-write.html
> 
>   * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
>     - shard-ptl:          NOTRUN -> [SKIP][3] ([Intel XE#3157])
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-ptl-2/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
> 
>   * igt@kms_async_flips@alternate-sync-async-flip-atomic:
>     - shard-lnl:          [PASS][4] -> [FAIL][5] ([Intel XE#3718] / [Intel XE#7265])
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5823-2ac16c180109b3f1ed00e7a2c4459eaacfc80371/shard-lnl-5/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-lnl-3/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
> 
>   * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-edp-1:
>     - shard-lnl:          [PASS][6] -> [FAIL][7] ([Intel XE#7265])
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5823-2ac16c180109b3f1ed00e7a2c4459eaacfc80371/shard-lnl-5/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-edp-1.html
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-lnl-3/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-edp-1.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
>     - shard-bmg:          [PASS][8] -> [FAIL][9] ([Intel XE#8098]) +1 other test fail
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5823-2ac16c180109b3f1ed00e7a2c4459eaacfc80371/shard-bmg-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-bmg-9/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>     - shard-ptl:          NOTRUN -> [SKIP][10] ([Intel XE#6925])
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-ptl-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@linear-8bpp-rotate-270:
>     - shard-ptl:          NOTRUN -> [SKIP][11] ([Intel XE#5901]) +2 other tests skip
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-ptl-2/igt@kms_big_fb@linear-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-ptl:          NOTRUN -> [SKIP][12] ([Intel XE#7085])
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-ptl-4/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@x-tiled-addfb:
>     - shard-ptl:          NOTRUN -> [SKIP][13] ([Intel XE#5850])
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-ptl-2/igt@kms_big_fb@x-tiled-addfb.html
> 
>   * igt@kms_big_fb@x-tiled-addfb-size-overflow:
>     - shard-ptl:          NOTRUN -> [SKIP][14] ([Intel XE#5855])
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-ptl-1/igt@kms_big_fb@x-tiled-addfb-size-overflow.html
> 
>   * igt@kms_big_fb@y-tiled-8bpp-rotate-0:
>     - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#1124]) +2 other tests skip
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-bmg-3/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
>     - shard-ptl:          NOTRUN -> [SKIP][16] ([Intel XE#5808]) +24 other tests skip
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-ptl-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
>     - shard-ptl:          NOTRUN -> [SKIP][17] ([Intel XE#5851])
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-ptl-2/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p:
>     - shard-ptl:          NOTRUN -> [SKIP][18] ([Intel XE#7679]) +3 other tests skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-ptl-4/igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p.html
> 
>   * igt@kms_bw@linear-tiling-3-displays-target-2560x1440p:
>     - shard-ptl:          NOTRUN -> [SKIP][19] ([Intel XE#367]) +2 other tests skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-ptl-6/igt@kms_bw@linear-tiling-3-displays-target-2560x1440p.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:
>     - shard-ptl:          NOTRUN -> [SKIP][20] ([Intel XE#5822]) +21 other tests skip
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-ptl-4/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:
>     - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2652]) +8 other tests skip
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-bmg-1/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-hdmi-a-3:
>     - shard-bmg:          NOTRUN -> [INCOMPLETE][22] ([Intel XE#7084] / [Intel XE#8150])
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-hdmi-a-3.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#3432])
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_chamelium_audio@dp-audio:
>     - shard-ptl:          NOTRUN -> [SKIP][24] ([Intel XE#2252]) +8 other tests skip
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-ptl-3/igt@kms_chamelium_audio@dp-audio.html
> 
>   * igt@kms_chamelium_color@gamma:
>     - shard-ptl:          NOTRUN -> [SKIP][25] ([Intel XE#5824]) +1 other test skip
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-ptl-2/igt@kms_chamelium_color@gamma.html
> 
>   * igt@kms_chamelium_color_pipeline@plane-lut3d-green-only:
>     - shard-ptl:          NOTRUN -> [SKIP][26] ([Intel XE#8391]) +6 other tests skip
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-ptl-2/igt@kms_chamelium_color_pipeline@plane-lut3d-green-only.html
> 
>   * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim@pipe-c-plane-1:
>     - shard-ptl:          NOTRUN -> [FAIL][27] ([Intel XE#9333]) +25 other tests fail
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-ptl-6/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim@pipe-c-plane-1.html
> 
>   * igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-a-plane-3:
>     - shard-ptl:          NOTRUN -> [SKIP][28] ([Intel XE#6969]) +15 other tests skip
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-ptl-3/igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-a-plane-3.html
> 
>   * igt@kms_content_protection@atomic-dpms-hdcp14:
>     - shard-ptl:          NOTRUN -> [SKIP][29] ([Intel XE#7642])
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-ptl-2/igt@kms_content_protection@atomic-dpms-hdcp14.html
> 
>   * igt@kms_content_protection@dp-mst-type-0-suspend-resume:
>     - shard-ptl:          NOTRUN -> [SKIP][30] ([Intel XE#6974])
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-ptl-3/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-64x21:
>     - shard-ptl:          NOTRUN -> [SKIP][31] ([Intel XE#5900]) +6 other tests skip
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-ptl-6/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-512x170:
>     - shard-ptl:          NOTRUN -> [SKIP][32] ([Intel XE#5846]) +1 other test skip
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-ptl-2/igt@kms_cursor_crc@cursor-sliding-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-max-size:
>     - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2320])
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-bmg-10/igt@kms_cursor_crc@cursor-sliding-max-size.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
>     - shard-ptl:          NOTRUN -> [SKIP][34] ([Intel XE#5962]) +1 other test skip
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-ptl-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
>     - shard-ptl:          NOTRUN -> [SKIP][35] ([Intel XE#5962] / [Intel XE#7343]) +3 other tests skip
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-ptl-2/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
>     - shard-ptl:          NOTRUN -> [SKIP][36] ([Intel XE#6035])
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-ptl-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
> 
>   * igt@kms_dp_linktrain_fallback@dsc-fallback:
>     - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#4331] / [Intel XE#7227])
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-bmg-1/igt@kms_dp_linktrain_fallback@dsc-fallback.html
> 
>   * igt@kms_dsc@dsc-with-bpc-formats:
>     - shard-ptl:          NOTRUN -> [SKIP][38] ([Intel XE#5907]) +3 other tests skip
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-ptl-2/igt@kms_dsc@dsc-with-bpc-formats.html
> 
>   * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
>     - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#4422] / [Intel XE#7442])
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-bmg-3/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html
> 
>   * igt@kms_fbcon_fbt@psr-suspend:
>     - shard-ptl:          [PASS][40] -> [ABORT][41] ([Intel XE#9362]) +3 other tests abort
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5823-2ac16c180109b3f1ed00e7a2c4459eaacfc80371/shard-ptl-7/igt@kms_fbcon_fbt@psr-suspend.html
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-ptl-7/igt@kms_fbcon_fbt@psr-suspend.html
> 
>   * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
>     - shard-bmg:          [PASS][42] -> [FAIL][43] ([Intel XE#3098]) +1 other test fail
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5823-2ac16c180109b3f1ed00e7a2c4459eaacfc80371/shard-bmg-6/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-bmg-10/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
> 
>   * igt@kms_flip@2x-nonexisting-fb:
>     - shard-ptl:          NOTRUN -> [SKIP][44] ([Intel XE#2316]) +6 other tests skip
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-ptl-4/igt@kms_flip@2x-nonexisting-fb.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
>     - shard-lnl:          [PASS][45] -> [FAIL][46] ([Intel XE#301])
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5823-2ac16c180109b3f1ed00e7a2c4459eaacfc80371/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
>     - shard-ptl:          NOTRUN -> [SKIP][47] ([Intel XE#5828]) +3 other tests skip
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-ptl-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
>     - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#7178] / [Intel XE#7351]) +1 other test skip
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-bmg-10/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
>     - shard-ptl:          NOTRUN -> [SKIP][49] ([Intel XE#7178]) +6 other tests skip
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-ptl-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html
> 
>   * igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-spr-indfb-onoff:
>     - shard-ptl:          NOTRUN -> [SKIP][50] ([Intel XE#6312]) +20 other tests skip
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-ptl-2/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-spr-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:
>     - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#4141]) +1 other test skip
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt:
>     - shard-ptl:          NOTRUN -> [SKIP][52] ([Intel XE#5800] / [Intel XE#6312]) +17 other tests skip
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-ptl-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render:
>     - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#2311]) +7 other tests skip
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-mmap-wc:
>     - shard-ptl:          NOTRUN -> [SKIP][54] ([Intel XE#7061] / [Intel XE#7356]) +7 other tests skip
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-ptl-1/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-mmap-wc:
>     - shard-ptl:          NOTRUN -> [SKIP][55] ([Intel XE#7061]) +6 other tests skip
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-ptl-5/igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-mmap-wc:
>     - shard-ptl:          NOTRUN -> [SKIP][56] ([Intel XE#7865]) +34 other tests skip
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-ptl-1/igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
>     - shard-ptl:          NOTRUN -> [SKIP][57] ([Intel XE#5812]) +119 other tests skip
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-ptl-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
>     - shard-ptl:          NOTRUN -> [SKIP][58] ([Intel XE#5865] / [Intel XE#7399])
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-ptl-2/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-onoff:
>     - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#2313]) +7 other tests skip
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y:
>     - shard-ptl:          NOTRUN -> [SKIP][60] ([Intel XE#7399])
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-ptl-4/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.html
> 
>   * igt@kms_hdmi_audio_bw@audio-bw-hblank80:
>     - shard-ptl:          NOTRUN -> [SKIP][61] ([Intel XE#9312]) +1 other test skip
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-ptl-4/igt@kms_hdmi_audio_bw@audio-bw-hblank80.html
> 
>   * igt@kms_hdr@static-toggle:
>     - shard-ptl:          NOTRUN -> [SKIP][62] ([Intel XE#5917] / [Intel XE#6174])
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-ptl-6/igt@kms_hdr@static-toggle.html
> 
>   * igt@kms_joiner@invalid-modeset-big-joiner:
>     - shard-ptl:          NOTRUN -> [SKIP][63] ([Intel XE#6901])
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-ptl-2/igt@kms_joiner@invalid-modeset-big-joiner.html
> 
>   * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
>     - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#6911] / [Intel XE#7466])
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-bmg-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
> 
>   * igt@kms_joiner@invalid-modeset-ultra-joiner:
>     - shard-ptl:          NOTRUN -> [SKIP][65] ([Intel XE#6900])
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-ptl-6/igt@kms_joiner@invalid-modeset-ultra-joiner.html
> 
>   * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
>     - shard-ptl:          NOTRUN -> [SKIP][66] ([Intel XE#6912]) +1 other test skip
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-ptl-6/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping:
>     - shard-ptl:          NOTRUN -> [SKIP][67] ([Intel XE#7283]) +5 other tests skip
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-ptl-2/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping.html
> 
>   * igt@kms_plane_lowres@tiling-y:
>     - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#2393])
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-bmg-3/igt@kms_plane_lowres@tiling-y.html
> 
>   * igt@kms_plane_multiple@2x-tiling-yf:
>     - shard-ptl:          NOTRUN -> [SKIP][69] ([Intel XE#4596] / [Intel XE#5854]) +1 other test skip
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-ptl-4/igt@kms_plane_multiple@2x-tiling-yf.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b:
>     - shard-ptl:          NOTRUN -> [SKIP][70] ([Intel XE#6886]) +9 other tests skip
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-ptl-2/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b.html
> 
>   * igt@kms_pm_backlight@fade-with-dpms:
>     - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#7376] / [Intel XE#7760] / [Intel XE#870])
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-bmg-1/igt@kms_pm_backlight@fade-with-dpms.html
> 
>   * igt@kms_pm_dc@dc3co-vpb-simulation:
>     - shard-ptl:          NOTRUN -> [SKIP][72] ([Intel XE#8395] / [Intel XE#8396]) +1 other test skip
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-ptl-8/igt@kms_pm_dc@dc3co-vpb-simulation.html
> 
>   * igt@kms_pm_dc@dc3co-vpb-simulation@psr2-yuv420:
>     - shard-ptl:          NOTRUN -> [SKIP][73] ([Intel XE#8396]) +1 other test skip
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-ptl-8/igt@kms_pm_dc@dc3co-vpb-simulation@psr2-yuv420.html
> 
>   * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf:
>     - shard-ptl:          NOTRUN -> [SKIP][74] ([Intel XE#7304]) +4 other tests skip
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-ptl-1/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1:
>     - shard-ptl:          NOTRUN -> [SKIP][75] ([Intel XE#5858]) +2 other tests skip
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-ptl-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
>     - shard-ptl:          NOTRUN -> [SKIP][76] ([Intel XE#5858] / [Intel XE#7304]) +5 other tests skip
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-ptl-4/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html
> 
>   * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
>     - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#1489])
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-bmg-3/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr2_su@page_flip-xrgb8888:
>     - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#2387] / [Intel XE#7429])
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-bmg-3/igt@kms_psr2_su@page_flip-xrgb8888.html
> 
>   * igt@kms_psr@fbc-pr-cursor-plane-move:
>     - shard-ptl:          NOTRUN -> [SKIP][79] ([Intel XE#1406]) +5 other tests skip
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-ptl-3/igt@kms_psr@fbc-pr-cursor-plane-move.html
> 
>   * igt@kms_psr@fbc-psr2-sprite-plane-move:
>     - shard-ptl:          NOTRUN -> [SKIP][80] ([Intel XE#1406] / [Intel XE#5835]) +5 other tests skip
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-ptl-6/igt@kms_psr@fbc-psr2-sprite-plane-move.html
> 
>   * igt@kms_psr@psr-basic:
>     - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#2234] / [Intel XE#2850])
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-bmg-1/igt@kms_psr@psr-basic.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
>     - shard-ptl:          NOTRUN -> [SKIP][82] ([Intel XE#5821]) +3 other tests skip
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-ptl-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
>     - shard-ptl:          NOTRUN -> [SKIP][83] ([Intel XE#5813])
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-ptl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
> 
>   * igt@kms_setmode@clone-exclusive-crtc:
>     - shard-ptl:          NOTRUN -> [SKIP][84] ([Intel XE#5910])
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-ptl-3/igt@kms_setmode@clone-exclusive-crtc.html
> 
>   * igt@kms_sharpness_filter@filter-suspend@pipe-a-edp-1-suspend:
>     - shard-ptl:          NOTRUN -> [ABORT][85] ([Intel XE#9362]) +1 other test abort
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-ptl-5/igt@kms_sharpness_filter@filter-suspend@pipe-a-edp-1-suspend.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-ptl:          NOTRUN -> [SKIP][86] ([Intel XE#5848])
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-ptl-3/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@kms_tv_load_detect@load-detect:
>     - shard-ptl:          NOTRUN -> [SKIP][87] ([Intel XE#5857])
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-ptl-6/igt@kms_tv_load_detect@load-detect.html
> 
>   * igt@kms_vrr@seamless-rr-switch-vrr:
>     - shard-ptl:          NOTRUN -> [SKIP][88] ([Intel XE#5948] / [Intel XE#9277])
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-ptl-3/igt@kms_vrr@seamless-rr-switch-vrr.html
> 
>   * igt@sriov_basic@pf-unbind-with-vf-probed:
>     - shard-bmg:          NOTRUN -> [ABORT][89] ([Intel XE#8868])
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-bmg-3/igt@sriov_basic@pf-unbind-with-vf-probed.html
> 
>   * igt@xe_compute_preempt@compute-preempt-many-vram-evict:
>     - shard-ptl:          NOTRUN -> [SKIP][90] ([Intel XE#5191])
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-ptl-2/igt@xe_compute_preempt@compute-preempt-many-vram-evict.html
> 
>   * igt@xe_evict@evict-cm-threads-small-multi-vm:
>     - shard-ptl:          NOTRUN -> [SKIP][91] ([Intel XE#5764]) +17 other tests skip
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-ptl-2/igt@xe_evict@evict-cm-threads-small-multi-vm.html
> 
>   * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd:
>     - shard-ptl:          NOTRUN -> [SKIP][92] ([Intel XE#6144]) +1 other test skip
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-ptl-6/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd.html
> 
>   * igt@xe_exec_balancer@many-virtual-userptr-rebind:
>     - shard-ptl:          NOTRUN -> [SKIP][93] ([Intel XE#7482]) +29 other tests skip
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-ptl-3/igt@xe_exec_balancer@many-virtual-userptr-rebind.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:
>     - shard-bmg:          NOTRUN -> [SKIP][94] ([Intel XE#2322] / [Intel XE#7372]) +1 other test skip
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-userptr:
>     - shard-ptl:          NOTRUN -> [SKIP][95] ([Intel XE#5575] / [Intel XE#7484]) +10 other tests skip
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-ptl-2/igt@xe_exec_basic@multigpu-no-exec-userptr.html
> 
>   * igt@xe_exec_fault_mode@atomic-many:
>     - shard-bmg:          [PASS][96] -> [FAIL][97] ([Intel XE#8578])
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5823-2ac16c180109b3f1ed00e7a2c4459eaacfc80371/shard-bmg-1/igt@xe_exec_fault_mode@atomic-many.html
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-bmg-5/igt@xe_exec_fault_mode@atomic-many.html
> 
>   * igt@xe_exec_fault_mode@many-multi-queue-userptr-rebind:
>     - shard-ptl:          NOTRUN -> [SKIP][98] ([Intel XE#8374]) +19 other tests skip
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-ptl-2/igt@xe_exec_fault_mode@many-multi-queue-userptr-rebind.html
> 
>   * igt@xe_exec_fault_mode@once-multi-queue-imm:
>     - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#8374]) +1 other test skip
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-bmg-1/igt@xe_exec_fault_mode@once-multi-queue-imm.html
> 
>   * igt@xe_exec_multi_queue@few-execs-basic-smem:
>     - shard-ptl:          NOTRUN -> [SKIP][100] ([Intel XE#8364]) +39 other tests skip
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-ptl-3/igt@xe_exec_multi_queue@few-execs-basic-smem.html
> 
>   * igt@xe_exec_multi_queue@two-queues-priority-smem:
>     - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#8364]) +3 other tests skip
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-bmg-1/igt@xe_exec_multi_queue@two-queues-priority-smem.html
> 
>   * igt@xe_exec_reset@cm-multi-queue-gt-reset:
>     - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#8369])
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-bmg-3/igt@xe_exec_reset@cm-multi-queue-gt-reset.html
> 
>   * igt@xe_exec_reset@gt-reset-fault-injection:
>     - shard-ptl:          NOTRUN -> [DMESG-WARN][103] ([Intel XE#9130])
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-ptl-2/igt@xe_exec_reset@gt-reset-fault-injection.html
> 
>   * igt@xe_exec_reset@multi-queue-gt-reset:
>     - shard-ptl:          NOTRUN -> [SKIP][104] ([Intel XE#8369]) +2 other tests skip
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-ptl-4/igt@xe_exec_reset@multi-queue-gt-reset.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate-race:
>     - shard-bmg:          NOTRUN -> [SKIP][105] ([Intel XE#8378])
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-bmg-3/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate-race.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-shared-vm-rebind:
>     - shard-ptl:          NOTRUN -> [SKIP][106] ([Intel XE#8378]) +11 other tests skip
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-ptl-1/igt@xe_exec_threads@threads-multi-queue-shared-vm-rebind.html
> 
>   * igt@xe_fault_injection@inject-fault-probe-function-guc_wait_ucode:
>     - shard-bmg:          [PASS][107] -> [ABORT][108] ([Intel XE#8007])
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5823-2ac16c180109b3f1ed00e7a2c4459eaacfc80371/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-guc_wait_ucode.html
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-guc_wait_ucode.html
> 
>   * igt@xe_gpgpu_fill@offset-4x4:
>     - shard-ptl:          NOTRUN -> [SKIP][109] ([Intel XE#7954])
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-ptl-3/igt@xe_gpgpu_fill@offset-4x4.html
> 
>   * igt@xe_mmap@pci-membarrier:
>     - shard-ptl:          NOTRUN -> [SKIP][110] ([Intel XE#5100] / [Intel XE#7408]) +1 other test skip
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-ptl-2/igt@xe_mmap@pci-membarrier.html
> 
>   * igt@xe_multigpu_svm@mgpu-coherency-fail-basic:
>     - shard-bmg:          NOTRUN -> [SKIP][111] ([Intel XE#6964])
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-bmg-3/igt@xe_multigpu_svm@mgpu-coherency-fail-basic.html
> 
>   * igt@xe_multigpu_svm@mgpu-pagefault-basic:
>     - shard-ptl:          NOTRUN -> [SKIP][112] ([Intel XE#6964]) +3 other tests skip
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-ptl-1/igt@xe_multigpu_svm@mgpu-pagefault-basic.html
> 
>   * igt@xe_pat@pat-sw-hw-compare:
>     - shard-ptl:          NOTRUN -> [FAIL][113] ([Intel XE#7695])
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-ptl-4/igt@xe_pat@pat-sw-hw-compare.html
> 
>   * igt@xe_pat@xa-app-transient-media-on:
>     - shard-ptl:          NOTRUN -> [SKIP][114] ([Intel XE#7590])
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-ptl-2/igt@xe_pat@xa-app-transient-media-on.html
> 
>   * igt@xe_pm@d3cold-mocs:
>     - shard-ptl:          NOTRUN -> [SKIP][115] ([Intel XE#5741]) +2 other tests skip
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-ptl-6/igt@xe_pm@d3cold-mocs.html
> 
>   * igt@xe_pm@d3hot-mmap-vram:
>     - shard-ptl:          NOTRUN -> [SKIP][116] ([Intel XE#5834])
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-ptl-4/igt@xe_pm@d3hot-mmap-vram.html
> 
>   * igt@xe_pm@s3-mocs:
>     - shard-ptl:          NOTRUN -> [SKIP][117] ([Intel XE#6867]) +2 other tests skip
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-ptl-1/igt@xe_pm@s3-mocs.html
> 
>   * igt@xe_pm@s4-basic-exec:
>     - shard-lnl:          [PASS][118] -> [ABORT][119] ([Intel XE#9362]) +1 other test abort
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5823-2ac16c180109b3f1ed00e7a2c4459eaacfc80371/shard-lnl-5/igt@xe_pm@s4-basic-exec.html
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-lnl-7/igt@xe_pm@s4-basic-exec.html
> 
>   * igt@xe_query@multigpu-query-invalid-size:
>     - shard-ptl:          NOTRUN -> [SKIP][120] ([Intel XE#6019]) +1 other test skip
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-ptl-2/igt@xe_query@multigpu-query-invalid-size.html
> 
>   * igt@xe_survivability@i2c-functionality:
>     - shard-ptl:          NOTRUN -> [SKIP][121] ([Intel XE#8415] / [Intel XE#8432])
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-ptl-2/igt@xe_survivability@i2c-functionality.html
> 
>   * igt@xe_vm@overcommit-fault-vram-lr-no-overcommit:
>     - shard-ptl:          NOTRUN -> [SKIP][122] ([Intel XE#7892])
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-ptl-1/igt@xe_vm@overcommit-fault-vram-lr-no-overcommit.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_async_flips@async-flip-suspend-resume:
>     - shard-bmg:          [ABORT][123] ([Intel XE#9399] / [Intel XE#9409]) -> [PASS][124]
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5823-2ac16c180109b3f1ed00e7a2c4459eaacfc80371/shard-bmg-5/igt@kms_async_flips@async-flip-suspend-resume.html
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-bmg-1/igt@kms_async_flips@async-flip-suspend-resume.html
> 
>   * igt@kms_async_flips@async-flip-suspend-resume@pipe-b-hdmi-a-3:
>     - shard-bmg:          [ABORT][125] ([Intel XE#9409]) -> [PASS][126]
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5823-2ac16c180109b3f1ed00e7a2c4459eaacfc80371/shard-bmg-5/igt@kms_async_flips@async-flip-suspend-resume@pipe-b-hdmi-a-3.html
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-bmg-1/igt@kms_async_flips@async-flip-suspend-resume@pipe-b-hdmi-a-3.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2:
>     - shard-bmg:          [INCOMPLETE][127] ([Intel XE#7084] / [Intel XE#8150]) -> [PASS][128]
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5823-2ac16c180109b3f1ed00e7a2c4459eaacfc80371/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2.html
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2.html
> 
>   * igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1:
>     - shard-ptl:          [ABORT][129] ([Intel XE#9362]) -> [PASS][130] +11 other tests pass
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5823-2ac16c180109b3f1ed00e7a2c4459eaacfc80371/shard-ptl-5/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-ptl-1/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
>     - shard-lnl:          [FAIL][131] ([Intel XE#301]) -> [PASS][132] +1 other test pass
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5823-2ac16c180109b3f1ed00e7a2c4459eaacfc80371/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible:
>     - shard-bmg:          [DMESG-WARN][133] ([Intel XE#9365]) -> [PASS][134] +2 other tests pass
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5823-2ac16c180109b3f1ed00e7a2c4459eaacfc80371/shard-bmg-8/igt@kms_flip@flip-vs-suspend-interruptible.html
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-bmg-8/igt@kms_flip@flip-vs-suspend-interruptible.html
> 
>   * igt@kms_plane@plane-panning-bottom-right-suspend:
>     - shard-ptl:          [ABORT][135] ([Intel XE#9363]) -> [PASS][136] +1 other test pass
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5823-2ac16c180109b3f1ed00e7a2c4459eaacfc80371/shard-ptl-5/igt@kms_plane@plane-panning-bottom-right-suspend.html
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-ptl-3/igt@kms_plane@plane-panning-bottom-right-suspend.html
> 
>   * igt@xe_gt_freq@freq_suspend:
>     - shard-bmg:          [ABORT][137] ([Intel XE#9362]) -> [PASS][138]
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5823-2ac16c180109b3f1ed00e7a2c4459eaacfc80371/shard-bmg-9/igt@xe_gt_freq@freq_suspend.html
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/shard-bmg-3/igt@xe_gt_freq@freq_suspend.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
>   [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
>   [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
>   [Intel XE#3157]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3157
>   [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
>   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>   [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
>   [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
>   [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
>   [Intel XE#5100]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100
>   [Intel XE#5191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5191
>   [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
>   [Intel XE#5741]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5741
>   [Intel XE#5764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764
>   [Intel XE#5800]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800
>   [Intel XE#5808]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808
>   [Intel XE#5812]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812
>   [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
>   [Intel XE#5821]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5821
>   [Intel XE#5822]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822
>   [Intel XE#5824]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5824
>   [Intel XE#5828]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5828
>   [Intel XE#5834]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5834
>   [Intel XE#5835]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5835
>   [Intel XE#5846]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5846
>   [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
>   [Intel XE#5850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5850
>   [Intel XE#5851]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5851
>   [Intel XE#5854]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5854
>   [Intel XE#5855]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5855
>   [Intel XE#5857]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5857
>   [Intel XE#5858]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5858
>   [Intel XE#5865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5865
>   [Intel XE#5900]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5900
>   [Intel XE#5901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5901
>   [Intel XE#5907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907
>   [Intel XE#5910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5910
>   [Intel XE#5917]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5917
>   [Intel XE#5948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5948
>   [Intel XE#5962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962
>   [Intel XE#6019]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6019
>   [Intel XE#6035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035
>   [Intel XE#6144]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6144
>   [Intel XE#6174]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6174
>   [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
>   [Intel XE#6867]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6867
>   [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
>   [Intel XE#6900]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6900
>   [Intel XE#6901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901
>   [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
>   [Intel XE#6912]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912
>   [Intel XE#6925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6925
>   [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
>   [Intel XE#6969]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969
>   [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
>   [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
>   [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
>   [Intel XE#7085]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
>   [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
>   [Intel XE#7227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7227
>   [Intel XE#7265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7265
>   [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
>   [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
>   [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
>   [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
>   [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
>   [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
>   [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
>   [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
>   [Intel XE#7408]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7408
>   [Intel XE#7429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429
>   [Intel XE#7442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442
>   [Intel XE#7466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7466
>   [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
>   [Intel XE#7484]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484
>   [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
>   [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
>   [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
>   [Intel XE#7695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695
>   [Intel XE#7760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760
>   [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
>   [Intel XE#7892]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7892
>   [Intel XE#7954]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7954
>   [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
>   [Intel XE#8098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8098
>   [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
>   [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
>   [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
>   [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
>   [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
>   [Intel XE#8391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8391
>   [Intel XE#8395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395
>   [Intel XE#8396]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396
>   [Intel XE#8415]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8415
>   [Intel XE#8432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8432
>   [Intel XE#8578]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8578
>   [Intel XE#8583]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8583
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#8868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8868
>   [Intel XE#9130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9130
>   [Intel XE#9277]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9277
>   [Intel XE#9312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9312
>   [Intel XE#9333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9333
>   [Intel XE#9362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362
>   [Intel XE#9363]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9363
>   [Intel XE#9365]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9365
>   [Intel XE#9399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9399
>   [Intel XE#9409]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9409
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-5823-2ac16c180109b3f1ed00e7a2c4459eaacfc80371 -> xe-pw-174948v1
> 
>   IGT_9112: 8d3284b5ae16ca1aef353dfaffb6c0896ceacc19 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-5823-2ac16c180109b3f1ed00e7a2c4459eaacfc80371: 2ac16c180109b3f1ed00e7a2c4459eaacfc80371
>   xe-pw-174948v1: 174948v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174948v1/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
