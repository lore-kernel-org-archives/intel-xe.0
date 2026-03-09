Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73421FCA17F
	for <intel-xe@archiver.kernel.org>; Mon,  9 Mar 2026 20:13:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 354B610E1D0;
	Mon,  9 Mar 2026 20:13:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W24xOD45";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C741010E1D0
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Mar 2026 20:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773087212; x=1804623212;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9Wb+PG9DOo8/ayc6Ba+0E6wbnimxYVXhzAm7QF1Hxy4=;
 b=W24xOD45ExvyOxNyHZKUs7/OzC8KM5Vv8H5waHzO+erwORMRV/0SR07g
 KfjVwWKoAZKKWhthgrKRHRwFeuLtVlPXuRstEnEYsCGWHNR94OnV52S+Q
 suYXf1Ecqnen4go8dLG3UeX2jjZhCvKYeSEtSukehFO73Igc+OKhxeZbB
 FeKtgRf26RSl5YfaUNVHnSbeqy5pZDpC7Ga92dtx317HYFGbY9CGe7yua
 Y7b0bDSTvXebWNIGYtLqtCP9Fvqp/Mkv/VfLXfCD7wAPWjCs6FZao1369
 pC3agnqPB/UXAjqYoshODdeTuZzgTI2HrA5PDm5CGNSFj6LfV+3eaVDPO g==;
X-CSE-ConnectionGUID: 3kg5O/dqQ4W3ZPkwTPVnxg==
X-CSE-MsgGUID: eUw8tU1TQOa0NUgzXp6pjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="74042363"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="74042363"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 13:13:32 -0700
X-CSE-ConnectionGUID: 10OmLfZfQq+o+0ks3oTi4w==
X-CSE-MsgGUID: Q359BPZiQva3VWSFRNlbbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="250333608"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 13:13:31 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 9 Mar 2026 13:13:30 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 9 Mar 2026 13:13:30 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.21) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 9 Mar 2026 13:13:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=icBxlH6Vys/gyjua0Vxp79/oRfJKIft2gabF8/n2XkioaKKOaPtuton6YXA18N3aljNmi13biyfG0gXFHLLj1hhx006WPrwY083pXQaHLdcvbcKyXiMxxciKwLIQSS9Z9NKDZprp12ma4QvcBBhR64fUm6Yzh2MXMtORi10Za4HSYDMNVGXw5rd65PViVNA6j9ZhxM6GIzb8mrO4ZOjlBZvE22HgBEPL1NyoJXAsGChKF/5swgaAHrelT5lLst1bfM36ANykzfLqF0CxhXwMJ2O1OlASqPHekATbxXHsDCexK/sNx1NQt0wLg/TdaYOc7yBTqFyKm9qQTPNalW7+fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mOaG9c2K7Urz5fQzms0BSsHC8QIpFbEZSQYm14dYy04=;
 b=DuLmi9uMGz3QdUjFlf3gBlKNplezExVpH7QrFowLp17rZog1UqxZde4PhHoEZma0ZQEcJcMeGPkmyGOKGRiD1vIfRcSkGMmH5LSChAsrtcf6KYWqZUwijtCsVvnAAfiKgZodwEn16kkpww37Ud6b+w9zwkmwYBRNNHCeQgSH8ZFur8pVnAtjCrXuHa50lDnbkKMTCa4rRsL1HKImDdAoxO3FNRHF29WIetTvuPKtG35wJnR+ZTeoebfMawA2/QQwzMny3wbZjjzE2EHWau3FykeJvAwJ04NQ4Ma9tpTVmQQm/Xh0KotZeLzYPO7n2SZmLO/6CEk1eF3b/nXgHSCASQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DS0PR11MB7357.namprd11.prod.outlook.com (2603:10b6:8:136::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Mon, 9 Mar
 2026 20:13:25 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9700.009; Mon, 9 Mar 2026
 20:13:25 +0000
Date: Mon, 9 Mar 2026 13:13:23 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 6/8] drm/xe/nvlp: Implement Wa_14026539277
Message-ID: <20260309201323.GY4694@mdroper-desk1.amr.corp.intel.com>
References: <20260309-extra-nvl-p-enabling-patches-v3-0-0416900dd498@intel.com>
 <20260309-extra-nvl-p-enabling-patches-v3-6-0416900dd498@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260309-extra-nvl-p-enabling-patches-v3-6-0416900dd498@intel.com>
X-ClientProxiedBy: SJ0PR03CA0005.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::10) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DS0PR11MB7357:EE_
X-MS-Office365-Filtering-Correlation-Id: a4cc1cdd-95ab-4c4f-8573-08de7e18521a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: oq/SyRtUCg9EpYK2kcUG+UdNdlMkiCr88Iny/He1zAXEJDUxv0DKp4y5Ymd4Wly5Emrv0CIoBIaqnx4l9RSsIueLcNDwtLrXP5y/gFlJqtr5kyUMKGUSVw45qYdt2bWx4CTAG+pYhpZNZo5XIahPejzAn9AK8XM15L4UL/rqqu9F80aC2fiR8/VCZ3dNwzSLwzH6lJRPYCRG+PMnwOHuwLJ6ceIrzJAruYrAJETQwNnV1TsCO6P9yBsKyRoi9DjxJv7FH/eXC5LhS55ysdY2HIyVkjjJzMN+uOJPhpsMR+1dICMXa5tf1uPiBKnHFJM+OqoCN0eWAxAdV4cvPZ08ivD4l9+i7oUw/sjeFCEps9Zzepsp4oxF3ISe8075A+uwRg4h6l4jmmWcjBfd7KXvh8ZlyibJhRL1XkaexiW+5tm8qHb5kDjv+cIxLmLJmlTKMNZLIWl0ETZ+caUdYEterrL+pIOsuFl/cl7xcakSohfNBFh+Wz7+21ViTMOAAvJgdiGSoESHaQrBXW43AI2Skp1H0gsbGqbH+QTmZ25AhB4irTrNyQY5aLUpu4PxOWeznIWZkgRPC62dGrp772Rb8kI4m510jHv+FM7BoXd7L7g3b5/kNS/ulrHpXGhEoyemy92I9d2AnCavfQYxz3eWv7sLaQP/Zi0AuJ6pv4tQnkoocsHIC2/3Ac5V8PNezMwkA4K8OH1fYtxCIM9v3+j5R5Rlmp8g+2GM+Z9q28q82q8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jzTIJKXopTgQrze0fJuXojD0pjNiAcWbw40fDArmdUXw2dovSEZbGGb5Dgqa?=
 =?us-ascii?Q?leIWj11I9dxrozYNrAYpbv2uOhRcRhg9yjbbIz+D1jnlmWuNA2jgFJQj9OTC?=
 =?us-ascii?Q?72zaPpbvpnORBXSNCxuWvaWCfcma0GiqQ6tcs8iOXNfSNL5Ap+5yWu9szBUk?=
 =?us-ascii?Q?2E7pWSIfobZTEHnqZuDAb4UI+F/QvJqPclyVWOWJ5ciKDDXSuv9Rn8djQYg/?=
 =?us-ascii?Q?usgkuHdbvEOS/KWzuayIGSV/MTMLtcfZ7mLPU8KBBeho6o+lRvyAfC3Urqd9?=
 =?us-ascii?Q?cVGYxdB3Jh/dCUfSuy8wcoYVEtoDCwAUY45T+gvDWzFeOyL0rE4tPkToOlvs?=
 =?us-ascii?Q?uZdIxmJCRZzG0iQXjDWqamc9zFYP+qAmb4IAzFYdsseSefcX0TE5atXth47W?=
 =?us-ascii?Q?qGf70XS6YSrDSziHsb5EelMPtJC4Ygi8mp2vuj322zocE5G/Llo3/+ABSYWg?=
 =?us-ascii?Q?Y4wRCHL5iLde9vXezsSMFx6jzp21Z02VirSUqk7ExE/RMTF+JHK8XK9qosVQ?=
 =?us-ascii?Q?8UhR6GkrICZTEw+LBLTUlRXFhk8WdyPv3fXmnyE8+uQJyqurQDUlkfwigUpg?=
 =?us-ascii?Q?XJ4ml4Z9u4HbMZqdfuaGS/YttyGHNY2cy6tKl00hvoUnVKrJFEHNNwMEDsKJ?=
 =?us-ascii?Q?HFwznL0IKJZQs0BlFWqFAFez/SUWbVOSBKhSFbeX2opjqJ6s3X4RXnM3AdQ+?=
 =?us-ascii?Q?j4650FJ55RagA1ba6QHuIo3ZMYrpY0g70DQCjge66o1dzmwrOp77d1FRH5kx?=
 =?us-ascii?Q?3XnXLvJC1miZ9446WyIgdWX8bOeIMBySg6IDIkB/pR2jetRyPjygdirg50D6?=
 =?us-ascii?Q?1hkvWfRt/CrTz/RTfYrT2P5WYOWSbgqdsAvvU7feK+rsaop5MI7DDs/IiNWv?=
 =?us-ascii?Q?Sq8XEkVSKLcE7RpnFa8eggbgKhuF2MkVzMzRp4rc0jBurnHw+7F+ZNs0VImA?=
 =?us-ascii?Q?DK/ZwjBGmPKNl2IfKwwktU6Hb4s6S1BULK/JmYPXFYsrX8MwKQ0rYvSR8xJ/?=
 =?us-ascii?Q?8TMcX6Vmry+/0UtjL5qfkol910yRAzfXwcOw3LvcyfD29Fe7HN7iMSMQJyup?=
 =?us-ascii?Q?h9JBYZJYLCsU4AFKyhl0QQb4tgAX63uk3hrwzmtVH/sdGqGcsE0Cd3fKS57c?=
 =?us-ascii?Q?L7g+SUUDc8y8Xy6KQYfFATyvXubTXZP5InWtEA1p+OB365Zz7tRwJGEo/ilh?=
 =?us-ascii?Q?85GzL7HYd2aEMw++4/cso/aGGWK2YFjGJpOviPCorm8ioAuw/l4BtJ9io3dq?=
 =?us-ascii?Q?oCA8BM769JDq6UUCrqleOmIEVoZbEWBTg33Rq1Vsrjn2c6mWuIo8lcdxYOiV?=
 =?us-ascii?Q?YFwI22J81WezEFxBmb/FIxTzBOhM16IG1bYB/6+A+O3Mhhk02MQ58UaE3mJa?=
 =?us-ascii?Q?etpQ3xnuhkHZUcuR7Ya+/dDzKJlmC+f1/UP2qqRDjebm/gazKmV0/vT5wYlG?=
 =?us-ascii?Q?k9XdP7tDhxfe6SanFfUJ/e1KJqXWXMXtc5/mEKu1szJ/wWNuFnWAJbblEKCu?=
 =?us-ascii?Q?JvKBibyVI++TVa3jINZYqNNQbpdvkiBWPHflJZsFVqx3UBMyadDl374jWnL+?=
 =?us-ascii?Q?3M+8KNBMowHbIVHciCuN9hwkvsv66opqYvx8XTullQfW34aJZzPikWA+KdoE?=
 =?us-ascii?Q?Hg0/ZhgdApFYoUkl2gPcQ6HsW6J7f2DPUnNAnWQT7VzzBIQERbu3WudPe8UI?=
 =?us-ascii?Q?/gSNqndeY/DbLRmaYhYyTAGKowVjwkwoBSq6MrcklgBuDU6d5P71dYwMTYtT?=
 =?us-ascii?Q?DWtDxafJuEIz9KqV6/ItueszoPOKX9Q=3D?=
X-Exchange-RoutingPolicyChecked: iEwIAiZLOYx+5+fFDzkMaiOITvEBAMFntpuHkNIM8h0IBCWk/6/RFG90BwgnBz3Mc+oC7AjV7O7jNe8GsfZcEMGRvmhOvkIxbpSCeo2IqDL1RSNS+s36f3WDJMeikcZvzLAlKUOLgY1vXReiiWnOmaLWTUerRFd5ZDPE3O1hqRJy0DldZc/PJi+6NpKjV45elXvZSrGicZZI9OkcgXmZdDVLIp/wbvIXV2wBq856bc9QjLNuU2ypgo5nI6eeGvEMvAb5l4KVpAUrs4wCjJVqp5iUlQaFdamZY2wIoTSw7Lg9/QPH3uB62s13lGlwguQneTiocQe+bVmnQqSGOMJdkw==
X-MS-Exchange-CrossTenant-Network-Message-Id: a4cc1cdd-95ab-4c4f-8573-08de7e18521a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 20:13:25.6288 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kDECKnBiux3FP/3jlR9odK+xUfY1VQ0bLcnrJHie8Cyh97o/Jo7KB1ia16gQxJJzjXYFUEPszZQNHUon9rc7poGd4NdQtIR33hgQqWfW7wk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7357
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

On Mon, Mar 09, 2026 at 05:07:34PM -0300, Gustavo Sousa wrote:
> Implement the KMD part of Wa_14026539277, which applies to NVL-P A0.
> The KMD implementation is just one component of the workaround, which
> also depends on Pcode to implement its part in order to be complete.
> 
> v2:
>   - Add FUNC(xe_rtp_match_not_sriov_vf) to skip applying the workaround
>     to SRIOV VFs. (Matt)
> v3:
>   - Make Wa_14026539277 a device workaround instead of a GT workaround.
>     (Matt)
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h      |  4 ++++
>  drivers/gpu/drm/xe/xe_device_wa_oob.rules |  1 +
>  drivers/gpu/drm/xe/xe_gt.c                | 27 +++++++++++++++++++++++++++
>  3 files changed, 32 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 66ddad767ad4..a83cafbe03fd 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -452,6 +452,10 @@
>  
>  #define XEHPC_L3CLOS_MASK(i)			XE_REG_MCR(0xb194 + (i) * 8)
>  
> +#define L2COMPUTESIDECTRL			XE_REG_MCR(0xb1c0)
> +#define   CECTRL				REG_GENMASK(2, 1)
> +#define   CECTRL_CENODATA_ALWAYS		REG_FIELD_PREP(CECTRL, 0x0)
> +
>  #define XE2_GLOBAL_INVAL			XE_REG(0xb404)
>  
>  #define XE2LPM_L3SQCREG2			XE_REG_MCR(0xb604)
> diff --git a/drivers/gpu/drm/xe/xe_device_wa_oob.rules b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
> index 55ba01bc8f38..7a1d1f9072b1 100644
> --- a/drivers/gpu/drm/xe/xe_device_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
> @@ -3,3 +3,4 @@
>  		PLATFORM(PANTHERLAKE)
>  22019338487_display	PLATFORM(LUNARLAKE)
>  14022085890	SUBPLATFORM(BATTLEMAGE, G21)
> +14026539277	PLATFORM(NOVALAKE_P), PLATFORM_STEP(A0, B0), FUNC(xe_rtp_match_not_sriov_vf)
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index f3bb856aad2a..bbb2fb86d3cd 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -10,6 +10,7 @@
>  #include <drm/drm_managed.h>
>  #include <uapi/drm/xe_drm.h>
>  
> +#include <generated/xe_device_wa_oob.h>
>  #include <generated/xe_wa_oob.h>
>  
>  #include "instructions/xe_alu_commands.h"
> @@ -451,6 +452,23 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
>  	return err;
>  }
>  
> +static void wa_14026539277(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	u32 val;
> +
> +	if (!XE_DEVICE_WA(xe, 14026539277))
> +		return;
> +
> +	if (!xe_gt_is_main_type(gt))
> +		return;
> +
> +	val = xe_gt_mcr_unicast_read_any(gt, L2COMPUTESIDECTRL);
> +	val &= ~CECTRL;
> +	val |= CECTRL_CENODATA_ALWAYS;
> +	xe_gt_mcr_multicast_write(gt, L2COMPUTESIDECTRL, val);
> +}
> +
>  int xe_gt_init_early(struct xe_gt *gt)
>  {
>  	int err;
> @@ -576,6 +594,15 @@ static int gt_init_with_gt_forcewake(struct xe_gt *gt)
>  	 */
>  	gt->info.gmdid = xe_mmio_read32(&gt->mmio, GMD_ID);
>  
> +	/*
> +	 * Wa_14026539277 can't be implemented as a regular GT workaround (i.e.
> +	 * as an entry in gt_was[]) for two reasons: it is actually a device
> +	 * workaround that happens to involve programming a GT register; and it
> +	 * needs to be applied early to avoid getting the hardware in a bad
> +	 * state before we have a chance to do the necessary programming.
> +	 */
> +	wa_14026539277(gt);
> +
>  	return 0;
>  }
>  
> 
> -- 
> 2.52.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
