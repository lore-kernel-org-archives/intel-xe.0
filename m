Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EC24C52D7C
	for <intel-xe@archiver.kernel.org>; Fri, 23 Aug 2024 14:30:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1D0F10E5A5;
	Fri, 23 Aug 2024 14:30:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JORRwUEm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8237510E5A5
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Aug 2024 14:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724423410; x=1755959410;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=sEjlDYYrGBD0YEPv/O4/u4udVFF+mg5nBywUkaROzzI=;
 b=JORRwUEmIvJ4AOb0mdKb+QiUfi/g7xwJNeOfIZmlwkA2GyfpZ+WqH1CI
 kzGDLyvCw3QSX2ngkqS+5ihu9IvrcFg7SIcGJA0rTnF/an7WIEpPFH6ww
 f7RVCgssd4SYTmy8q/DqpQNqX8ejlxQ1GiDPckeuPXeE39RJ4+2XSmpdI
 DadYHz+iNey4J7B/ixYfMiv22wz4Qmly4L7PqrLrbrjLX2mNUmsCaI0jB
 DZJaJykM5kDIO/g82PxFQsLkDaPKFABn6izxzcHynCo5Dcn1okx5FETAq
 rdZ2qAR0btKW5JTEhJPl/4xycettAMg7YrEttbA8nqGYvS7P/sCYn9nma g==;
X-CSE-ConnectionGUID: 866zyWH0Sn+3KBvB6oIpGg==
X-CSE-MsgGUID: Chcc4qm6RSqR63kHoLzIzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="23062700"
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; d="scan'208";a="23062700"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 07:30:08 -0700
X-CSE-ConnectionGUID: Tp9/IKbXSSmVJ50wTRiQfw==
X-CSE-MsgGUID: n0ljwuQySQ2XcNRdxYijGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; d="scan'208";a="66131316"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Aug 2024 07:30:08 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 23 Aug 2024 07:30:07 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 23 Aug 2024 07:30:07 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 23 Aug 2024 07:30:07 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 23 Aug 2024 07:30:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iMcoptWX7jZ4TuRQ4QIH4jtt1lvi/pMZih2vzyuPJHZ8utGrCT8lf5e1pHd05SP5gff6QBF6BQjkXXSNorSzL8ozTDBRsTZc/1ne7KD16qgAY+3Un+dls2hR+WRXgT2Uo73cC2J5/mNBYcIeGg6DjG1lUFmTbSrBH/DhQ/9tZMSEaRwjp+Z+QznZJrri7Z7kkeaoTutJr35RyDxP97pAjrxqfUb7y6vKTGbUjlD0ZAMw9YvJ2WjhW+BcrmoTgI8deD5jDBFziB/cg4BFNgVd+N114/7zBX3dtbLYvfcUZlI/dqbaqYMhnJyqSKn/eDvhLyZbhoiyjFSRgYtlxGRyuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bx3G6woS8SnXsL4NfiUh0hfQfaCRDxim8JNNLeUxEsY=;
 b=a2sFCpyGXi/gXo9ZiT5CNJVfzJ4H3T1AtFHbZf1cDAmqXLnmPTCaDUAGB6pArNU8gQs7vixaLS+3g+m/CoWAHNtGFmtnGLoFX+KscF0473KnSU9+C/b9GsDWetEpREF7LFVoiodA9iahjNj8IAGeiJO50TYS9TqHwQqf/blFoBgydMtQsWH6ycImBvczPfLBYuRfal+Ebu6u+aw3SxFdDsfYq2r8xhY0/xoQNfbXpQnsCq9//ovC4jiGzjVlEg3zZUqsgI6aZHaxNtF3UvIl7fxDY2LjTen6qCC8LmGByNTE6RJNCS/E0NAVUC71uzdcPN+j7b8ECjaVMPAaiS2/0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by CH3PR11MB8708.namprd11.prod.outlook.com (2603:10b6:610:1be::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Fri, 23 Aug
 2024 14:30:04 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7897.014; Fri, 23 Aug 2024
 14:30:04 +0000
Date: Fri, 23 Aug 2024 10:30:00 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH] drm/xe/lnl: Drop force_probe requirement
Message-ID: <Zsic6M0jOt_nzzXi@intel.com>
References: <20240822224615.793540-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240822224615.793540-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW4P220CA0020.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::25) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|CH3PR11MB8708:EE_
X-MS-Office365-Filtering-Correlation-Id: 19cb77a1-230f-4c9d-d60d-08dcc380142a
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?6WeH418kC8c+QKMuGwjNRW1TmRDs9QnmbK5PFtc9y//cx7+4XMnbjByaE/?=
 =?iso-8859-1?Q?xgbfRw9tqRqL5DdU/ahAM9rS4jRNgzxSLk/knc37eqTUMeiXbJoqVp/+Ov?=
 =?iso-8859-1?Q?yExMcWYfkr3/L/kpEBEUFB7ZvWA0RhqylVKLicz557OzSSnaE7Vks1nP2c?=
 =?iso-8859-1?Q?LqON0x3nrgY6IyfLVHo4utn6qZuDmwcIU491gWvA2RlvH6YDXHhLzsWPeU?=
 =?iso-8859-1?Q?qi4cKjDD7S2NH63c8HvT8WF7hXt9GRzMwRfz1RfahKZ5Ya0NvLV8xXenG/?=
 =?iso-8859-1?Q?A9HOZTBXLIYJWETLysSsKWEoR3kjeI4MaxSsjgCZl0lD35+4+VGgQgGcIT?=
 =?iso-8859-1?Q?LOASzmJNuLJhaWEKsW2BH01NVYA8A6gGOvXgQwq9r0RhWlE6MeekDM+snF?=
 =?iso-8859-1?Q?tZM3Bd6BzoOAzQpwrnyKtOatVD/Q+J2dWfady5FkE56ADyVfWcLnKJVxMt?=
 =?iso-8859-1?Q?6nMPBinTeb5E+TbnhW9ShIExg3bb+2CbQKklxbpZuV2gt5fq9AwBzIKhgM?=
 =?iso-8859-1?Q?mPTmBTdo+hYKEIF+0u4z2hpKaT4GB/nZJ5xx2jI377jZWfq6ICJ1asILot?=
 =?iso-8859-1?Q?uC2iNxWSCwqgxuG8iIAhHcDENwUZU5JAfIoG/ARhU1a8/S9EDSnKPSFEKL?=
 =?iso-8859-1?Q?IRuHW8IONAfAwx5VQNR/9MGJLyEN4fnZlcsbmMoFdYsi7N/eK+Hm/AkkK9?=
 =?iso-8859-1?Q?xgzk1cqwBTP7NXRM4jWHD4PBULQOqzEOf8Wv2CM8xMpW3THQXVRweKqgEl?=
 =?iso-8859-1?Q?p+D4IlfYCU1THpJLfKhG21YQJ3MnaSBzf3EFOq29m6UB1QA1QrBlG5+l6A?=
 =?iso-8859-1?Q?o4WTLy/4foGKEhr5Bgt50y9qCEMsXRMLrZ2b21h1rlLIXMjYg4oqX3senl?=
 =?iso-8859-1?Q?v12fsdwi1PTQRGvAM47Bt80l/AAOablK8tPMxl7j2oJ2joo64w1/6HlzOf?=
 =?iso-8859-1?Q?9IttJ1Ihxx3Ww7yPLGNwM+OM/RDaHzbS6iWrI78DF3WlHAghBmwWgTaGCL?=
 =?iso-8859-1?Q?aDsug548yNocACcgHNhf/RDMpePJi8UPrdaiUZzjEj/qBuB5uMjMvYGG9z?=
 =?iso-8859-1?Q?bh+wERPYqDT83LWJlZdb85KfmqCj9TwEWUQtNoj6X5Sqq9+GRXbuEkL19H?=
 =?iso-8859-1?Q?YU5TlWXBI75fwcVRLI0izcdmtQkRrcX8VraqHZVazX5Sb9dwjtPlLE8M4G?=
 =?iso-8859-1?Q?uVnM+mm1W0Y2K17BO+aAFz7WkVBRmhwOUMZAb5cqAQ9OngCNYQRfZk+AZy?=
 =?iso-8859-1?Q?zHR+Z1PsrjZwBxyQxOf3asU9BszyrbC2sBjMkkeKLYXt8vt7IGrcS1Sf9M?=
 =?iso-8859-1?Q?CzoO7b5xA7OU9TN+Sd0fK2k2qpRCflnQdXHHJjCxo8hOxHag8G+tFF+Sqg?=
 =?iso-8859-1?Q?3CN5UXnWvX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?dq6qqqMtRW1/VvBnFsTCV+DRGjN+TyLs+HyHcGdzARgKSh9QzXs+CnTdhZ?=
 =?iso-8859-1?Q?ZgMWaMeuJeM875YFHjJFq/mBKU8QOMjltoCxmBEYWF7KkKIHyOiBLF+qTy?=
 =?iso-8859-1?Q?hfpGoo66VArd0th5P6s0aFWVeqSF9rqnItKldQUHnf/zEI+dA3dYghL4DZ?=
 =?iso-8859-1?Q?WSpbF6qk7tro+PrrY9SZPVYsgdDmLw6qWGBgcMhC00pZgBsxtAIZkQmVWw?=
 =?iso-8859-1?Q?mVB1a4nimZYwpNwfC0edgCCJzP8vOmSKTwjZXT+s/MWUC0cNfDZ5OLnfcr?=
 =?iso-8859-1?Q?pzIfWoybZ86VrPIXvaTVMCw2/ppBtOUlpP9XLlO7Kdqp+5wZe+PribJmaO?=
 =?iso-8859-1?Q?dE8A6k5DR6dmlQk8h5lyWwOmyit8/HBJdiS5mKwlncYDAyz3savzk6u2cU?=
 =?iso-8859-1?Q?zRym6YSKfMwP8qxzfv6SwYeqX2ZhiXff8guPpWv+381rj3wLECtKnxn+r2?=
 =?iso-8859-1?Q?JFBE/t0o6No9mt/lbdEu8/s2OTLh6KKzAdyYmZu0Bw7fOlIBdaMKduCWY9?=
 =?iso-8859-1?Q?BwCQuOR+SBIsaAqDLjr5pSZ88xp87+CIQwnBLL0cm2dce6gQzVZEuNADCg?=
 =?iso-8859-1?Q?BeCQkGuyGVoc8ig9kvv5xpdAawB/Q5YrcfW/1dUeGZ/sxNYvO3GFX8mY9P?=
 =?iso-8859-1?Q?ho2TdxlNOfAt+k7fsBZqOA2KIzWX7vK4eomMrWFk6UPbOp47UhZaNVkBvi?=
 =?iso-8859-1?Q?C660zPnAhymIjQ29e5BSpTer/9007pduoDJlfF3O/P85cUuEF0/r/5KfyR?=
 =?iso-8859-1?Q?1Kp+r4EEMzegSbkDCzDmosebCWhbKD/UIFNxddU2y+oXR/1QhiFMD8HUgB?=
 =?iso-8859-1?Q?adxdjpV6oqkymerCRQErbaEVtynAN/+4ABHsUprwGAx42hNb9DGiygH/ja?=
 =?iso-8859-1?Q?y+Xy2BDJY6YV3bqSweA5zP1GDIPM1QTHEhik6re8im/kr0SiE2v7aiZhaE?=
 =?iso-8859-1?Q?G3yYsUO7FMSkry18JEcRyXtXMsrUL4AR0Uo6gShB+N+jfwa6Xq/snql+a9?=
 =?iso-8859-1?Q?kfxVVd+K0H2ZSRqv9nAYgjZ4l31B6yrHVnbSIcNSQ+V8GbDppznOO35At1?=
 =?iso-8859-1?Q?+zHjFwpnqVUKYPjwaFoMMt1PZklcStrxqOy42A4onXwHdGWSGYHfEIXy9R?=
 =?iso-8859-1?Q?ew0qNfYURXMlKUhByBaP3DeDhBdrc1tnLcs64WnD7bWbghkM8RhdaLepe7?=
 =?iso-8859-1?Q?/Hs/weLgG5Goskr3B9Tm3w7ZPE/KDXOuDEJTmEV7Stj1zBZfjflbxPSctu?=
 =?iso-8859-1?Q?XRaqZ70R1EEiXpCZtONwos8iiPX71zeWf+xwMAUCzX23p9UQZ/V4YEp42X?=
 =?iso-8859-1?Q?+NGopXDCbJ9CXbe/Rsg1qu/S2XLvfyymx90yOu37AuaHw0OnBZgu46qya6?=
 =?iso-8859-1?Q?u6q5b5O1hYLpRSzCs2IG4f09r1ktOqzTziPbtJGAnaECbmS8AVS//ujjWc?=
 =?iso-8859-1?Q?2yxuqEoxWfPTyOIO7AwBAhQbhhfpo7nxWmyuAmJ6YuZQogSzDzwadbqY6K?=
 =?iso-8859-1?Q?Mlk4oqETU5m9Qw4m0gfoK4IXdrsVXH2bzAJ8akC4TDcTwmAgDWNG1D5tn5?=
 =?iso-8859-1?Q?o9wu97t41X28bYrjMw12ws5MOjNFFwwPhZqwuAZxbnAruCIc/9G+P8o5ux?=
 =?iso-8859-1?Q?kXRdjU7busoOEh4w2if8c9P0Pcwv3ZBrDwm1RfB9hC7vV5z9O3bl9q/w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 19cb77a1-230f-4c9d-d60d-08dcc380142a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 14:30:04.3567 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S+8A/6WcCUrbY4y3742EKn0UtzdlO1CQzh/uMnY5xwHcKvPTyyo953xc5s115ULqFimc/r+wmYlypnbQKkkr8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8708
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

On Thu, Aug 22, 2024 at 03:46:15PM -0700, Lucas De Marchi wrote:
> Lunar Lake has been usable for a while in a desktop setup. Bugs are
> sporadically showing up in CI, but being promptly fixed. Nothing very
> concerning.
> 
> All the uapi changes related to fundamental platform usage have been
> finalized.
> 
> Remove the force_probe requirement and enable the platform by default.
> 
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
> 
> Last concerning bug[1] should now be fixed since [2] is merged. Mesa CI
> was hitting it frequently, which was badly impacting their execution.
> 
> [1] https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1705
> [2] https://lore.kernel.org/intel-xe/20240821193842.352557-1-rodrigo.vivi@intel.com/T/#t
> 
> We should probably wait a few more days for this forward-looking patch
> before merging it though.
> 
>  drivers/gpu/drm/xe/xe_pci.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 0c2342988650..fa57996f9c37 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -342,7 +342,6 @@ static const struct xe_device_desc mtl_desc = {
>  static const struct xe_device_desc lnl_desc = {
>  	PLATFORM(LUNARLAKE),
>  	.has_display = true,
> -	.require_force_probe = true,
>  };
>  
>  static const struct xe_device_desc bmg_desc = {
> -- 
> 2.43.0
> 
