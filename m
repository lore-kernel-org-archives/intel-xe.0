Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DD73EDE9AD
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 18:47:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31D3110E8C3;
	Tue, 10 Sep 2024 18:47:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lsyxdJwJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7B0810E8C3
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 18:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725994066; x=1757530066;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=X9Te2sX5cf5FbxVx3D68BYvw72OxwmGf6IDhRf5q2kI=;
 b=lsyxdJwJAWYYSdnzS1f/anyvT8hFBpMnM5Ul/FaWoIz9UWW+NAkImIuZ
 AfapyV0x70CSTutBeS/H7q8npoNatHebTbyOmz5QQ3vgck+LjAf5DUVHY
 NobyDjyPElM9IiAQMx69MkSDYCC6WtM1WVFcB/19ruPgWtDSV6G2hFIoe
 3WVgNSqHCz6w9GxeU1vKg012H/cNTOw8MjmVB+dfQd1SX2lXGPM5xu+XL
 7eB992dQq6WpWffpN51Bzgm559hNyarNDSlBGSNP+ollTqPIimHpI8CJ+
 GNUVVEGMi1SFtsYACmJMKzfVh5N0uicyNipi7uoLphlcBj3ZNZ2jxJYi3 Q==;
X-CSE-ConnectionGUID: OksLnTU/T5u6XXllzwrqrA==
X-CSE-MsgGUID: dnmfPZ/ZSh+j2hcL3SIY8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="36119647"
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="36119647"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 11:47:46 -0700
X-CSE-ConnectionGUID: YzOhFaigT2OYyYrTAq/PzA==
X-CSE-MsgGUID: V4HxHlh3SfCZcxYoAZeaTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="67136527"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Sep 2024 11:47:46 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 11:47:45 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Sep 2024 11:47:45 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 11:47:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M/nuE9Otfkgs5JJQZPi5M53+U0rzOOLljvFOLk6Cz+XvvTxeR6sEsv29qE/6oJto2IgvCzynT94aORf/JlGDDJx26bSdS1LitOOzCWW+XxTvYVltc2ZO0wFOrC0uymmbMHLwypLUlM/1JTC2MCsDWriRkIRYbX3OhIkkDZKM1fhT6nr+MPJqKJ0nx+rPfmt+lC7/wt/7mnxwbljwF/c30ij5JaIMqPnSjyGM6OOnZQC6KDpQhs/7SMFsjbUNkjWhNEyALRZNT5fjdJhaJyB57+b6jBFwtZyGocZzT/qdSRe+16dMjTNnL+X9ut5tILwXi+S5TcrVloSGaGDVjLWhzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/rMRM4IE7sS4Fg588uu5sI0Vklp2HGizmDeBfVqMfe4=;
 b=HG8q0zqT8cEAu9gbBV6UPvfN2RklQuEGzG4bviemw/rKzzRXtFPhFKPq4UD8X2uMH7x2Mxk731DUgiuZTUOGjGBwCNgIOdNFV8Kdc9VBHv0uWm+Whreuc6XwgD4SpUwOM3uR7YLuTd7vumcVtYwIUJ8lgPSnGRsZQbkWmW0aWVn9dOmBRjbeWQGUH7tI+/J3Y1P62jCm4Qj92qMSvokVFi2xMIE+AYPYfZyYl2K5p84y8mL5iLrSH+u1dUarnYVrEH2s3c/4wv/cxuy5bbvnIBmNW423sEUoeHulsRIMLyMVX7MTOAjEcaFNY1RMhVjTDBmvK/wI2zbXSE3iPoNOoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by CY5PR11MB6413.namprd11.prod.outlook.com (2603:10b6:930:37::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Tue, 10 Sep
 2024 18:47:42 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7918.024; Tue, 10 Sep 2024
 18:47:42 +0000
Date: Tue, 10 Sep 2024 14:47:37 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 37/43] drm/xe/sriov: Convert register access to use
 xe_mmio
Message-ID: <ZuCUSU3q2eEBTbAg@intel.com>
References: <20240907000748.2614020-45-matthew.d.roper@intel.com>
 <20240907000748.2614020-82-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240907000748.2614020-82-matthew.d.roper@intel.com>
X-ClientProxiedBy: MW4PR03CA0051.namprd03.prod.outlook.com
 (2603:10b6:303:8e::26) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|CY5PR11MB6413:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ef7e3bb-712a-4f72-22db-08dcd1c90c14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yEktRKZG12ACdVqDoDVKPlKbnGiI78N3ihGT907pINhPP+R/xb44iZ4YhEIE?=
 =?us-ascii?Q?0+TNwgLLikCW3gyvpN2NitwPa++1SjoHdDGz7E5dHFy4GKa3Bdt8hNDxvvSR?=
 =?us-ascii?Q?3f/W3WMpO/FP2FiTdyKKUG+FKNTS7EPq8PpHztD7i7rrxI0TDN9OV+lDz3eI?=
 =?us-ascii?Q?lH4ZMlYrFl6MLUwllEjtf8exs0Yo8PX490zpwZNfWo0moDy3x5cSnQx80jwF?=
 =?us-ascii?Q?MgShx8oHlVdb6mRPx8pWnxKVQNELY4+LLyPkgHjueq6rR3hCoYztfY0ZHupa?=
 =?us-ascii?Q?FLKyaODMKCbBJ1AyywwIdZd4UeCdKj5BHsHvmsG+79nR2+izAn3eLGI06n48?=
 =?us-ascii?Q?5vBFwUJkX5ITCJZbMgp/s2LvQpCJM343zlMZ2Ae6guHEIfNT88WPMsK7DBDg?=
 =?us-ascii?Q?A3CfzQqva+Hn4bWSNNleEUnZDOhLtKRORBON0jVFtbpCi/yh2Bv7f2hsrhHA?=
 =?us-ascii?Q?dvPdRdvrlW4fEvj7/j2zIvkYKq1Ni+PWCj8Emc6vkbqvtqSkOLUS6X3NagbP?=
 =?us-ascii?Q?EBnGuK6nUdY78dMqTxtzYApHQYRgovp1PkL6IiUqfzki5A/TrNoKXfBTpEg3?=
 =?us-ascii?Q?smbUpeJFWhQAuFAOv9wmK2LrOGeZ5IysQ6SNQu3PWdrJ+TLYWt9cDoPfCzmV?=
 =?us-ascii?Q?Vtg14VU9g2mTs090W/KdbNaITAGcpYQoqCqXG9bnnVT3DWRpe+yb+9e+dGuh?=
 =?us-ascii?Q?Gjt2lJMARqGQvDN8jGmlLU3sr97xFT1uEBWhu/sPdoMmnDJhIL/qt3xOc+3Q?=
 =?us-ascii?Q?TKu7qVZJjKt5uFVi6J/T1c1EB6yn25/o8npuDIDP2wiuEmcbblrGcpJvPU+H?=
 =?us-ascii?Q?l8M0fVMh4d5r73whnZ7MLf3K1ZWIQXZ8GJcyNXFxwPbNfYBn4V9eFCkiJIax?=
 =?us-ascii?Q?VK2if2InXmCcPvcHrb6beWHJeopeJi8bETuVtce3fkT1VZB8l4UbFtk3xTuF?=
 =?us-ascii?Q?nyWt8IIWsmX4uu9jBCWIWhU9Ipj+ax7u2ubcJ7OldHy0btBU0MyxJPDVmNVS?=
 =?us-ascii?Q?STe3acxKtXPiZ8puDXY649L6klREwbJ0TN52Yy+qdzaiXYBPIUNLnIP/Td84?=
 =?us-ascii?Q?2LVLA3IAEzaPzaBvutedPH4MlhQJHgkj1rMGf7bROM+oXAl3j1I7mcBFTP6I?=
 =?us-ascii?Q?xavfnAW6XChFLMAA4+4kvRYPd9bBHF0sqNaG7t97Qxh/jv68EqIDciN9pKmj?=
 =?us-ascii?Q?a8jrZtnynCCHedXb6BQ59AuPh6MdGcEw2yEzzzmw7tKAYSZBPvqzdbXn3VYH?=
 =?us-ascii?Q?VjfzR4ZXcRqoiHuOU4M7Qxhno3SxF3pIQvK4Xxp//lcagtEcGrvTR1q1SVWv?=
 =?us-ascii?Q?yIrwupk8qic0xhvZJ4iqhu5hR6OUFxysE298l2jT9OKSMw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OEms2foMP4KvsBQTUk8UUatviuscAu9OfNK8uU7VnhpffXF1rTpaBj2f0sYJ?=
 =?us-ascii?Q?JVA6+o5JIZ3z/c0RjfIGqKLTGL11ywwtV6P5Y3BPBpWmacs8ieYjGSgjxv6w?=
 =?us-ascii?Q?DXIUMYmCtOQNsO86n/mfcAS6u9TxW5s4GFqZZVgLC3w+DOXmWZ8oOWMKVnQP?=
 =?us-ascii?Q?l+F0Jnd5OIgVh+iD05N1oJ/iyu3MPf0Dv/TQM7lizcFTQN8udiiiihybnybn?=
 =?us-ascii?Q?cZbDNktyqmB/nXijp/JP5lkb+it6pVnjWSuRnRWlmPLUE3e+HvzptEQl1XVe?=
 =?us-ascii?Q?NPV0TfbAL9jI4SW8FPaNl+4VegmFdIp30ppTICPQpefXZ5eHXP2awLo5p98O?=
 =?us-ascii?Q?F1f5lrqE6yYWXpfzB5Y/q6cptYwTW3ThjHpokp2S/jJULnXL7f6oxXARubou?=
 =?us-ascii?Q?3XiI7rkzsZDOQw0xQjmgn5NQQqpSs5RfATT4r+Y2+brlHlA9bKRWEcfC6I1H?=
 =?us-ascii?Q?RXoTAd7BMDAmayTx8NH5tgFAViCvP+GlDaDic76p6/VLvpm2STJUsNOABzLD?=
 =?us-ascii?Q?IvdGjjXBp1V9ZItCbqKO/lpjAiKzvfnxJqDcTbjvCzr3KaCNqQDE7jfhsgVe?=
 =?us-ascii?Q?pWJ+0GabkDHSDbTSVgzbab25I+fsvVYW+Eeg5ONAX143XuBi7t3t6T9Fm2D6?=
 =?us-ascii?Q?QlS664AD6YGS7JyhwfyeVg7zvJoGcG0PWLLJxlw/Q36preOzdAumwSD87MZY?=
 =?us-ascii?Q?moKBCAUNHhoCMFbcEZIzL1oKppXeWnMvAy7E6wKd+IjMtyCXZN+1sTfL0U4R?=
 =?us-ascii?Q?GHY02XI0cFrHnfrjxsX2XnYXb8f77eOTnutIzqhE7IXlfiuZsgN3RBzfSGVs?=
 =?us-ascii?Q?rFin2mIwaCetkLC4x7057u6K817Dty57E7BDcv1f9RH+/h+RKNw/WtZXbnxX?=
 =?us-ascii?Q?90BSyHw8yyNE8cJYtEQRn3b4+QLmcHNgMu1G10I7jM81vz2o8e0H69e6auvY?=
 =?us-ascii?Q?G6cDrvcftExQ4B2Ds8B/+m0753Pyb9cDiDG7sBnB1vujymldiQesZ+RAp72r?=
 =?us-ascii?Q?eZR741UUJXpvLV51gbyLmZYMcZmCcgNF7q1i9SvObWmcWVjyiipYmksL5ABO?=
 =?us-ascii?Q?fuLWkn3l2NazvWwlkh9KZlYkC7QSnVK1A870Z4Kjnv0RJ1v84QYJ/Rpy3Zt5?=
 =?us-ascii?Q?PlGEJSBaE/o8pfcagdZ5vrAaqaii1/EL9xrTyYLKo3ROXJ6QAE2qIEkW0M6a?=
 =?us-ascii?Q?lwb8mkYEecI3+HQwVUP5KT4QMwuLrdjaZPEJKVjOz1kt2iQznEX2T/JyyN3P?=
 =?us-ascii?Q?yWy/8IKtRzRPNzw1mcPRCs1+XB6F38/8+gT4N89rHvok2+wNlJcbpQ6B7ioc?=
 =?us-ascii?Q?6nWVjUzd4w+V1MmirjeW3teB9eqoVQy6l61Ss3m3oqm+dmNwmoKeV8TYPBHq?=
 =?us-ascii?Q?5O2lJga4NW/pkrjJD+sM/KngLUU4Jfu7EmKEKtLvMl/SrDRts7p3EYSLuOzd?=
 =?us-ascii?Q?27F1ckyaZhwmLP1g1opnH8qA5/k3gUbeJoS4Xcs80apHmdk+V/U4IsZ52snR?=
 =?us-ascii?Q?E324CcCmBbEI13YXpnZlmNpBYb+5d8yoyPksNsu6Gn1g1XZlp2Fh1SNSHhcz?=
 =?us-ascii?Q?TKkFTw2I17YmILPbE2WJcyGvgXmeg8fNcr9XVy/OcihEYxpSSP8RUOojOjRI?=
 =?us-ascii?Q?hA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ef7e3bb-712a-4f72-22db-08dcd1c90c14
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 18:47:42.1397 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8w2cy4jV92ps+hwsmQsgtMBz3iVvMPzDINBELnpy5mZY0n7rnXnTIpWhDJTRneL5vFIMiyXniLIFMqWL+BHFQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6413
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

On Fri, Sep 06, 2024 at 05:08:26PM -0700, Matt Roper wrote:
> Stop using GT pointers for register access.
> 

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf.c         | 6 +++---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c | 6 +++---
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c         | 4 ++--
>  drivers/gpu/drm/xe/xe_sriov.c               | 2 +-
>  4 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> index 919d960165d5..065a9878f8e9 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> @@ -74,7 +74,7 @@ static bool pf_needs_enable_ggtt_guest_update(struct xe_device *xe)
>  
>  static void pf_enable_ggtt_guest_update(struct xe_gt *gt)
>  {
> -	xe_mmio_write32(gt, VIRTUAL_CTRL_REG, GUEST_GTT_UPDATE_EN);
> +	xe_mmio_write32(&gt->mmio, VIRTUAL_CTRL_REG, GUEST_GTT_UPDATE_EN);
>  }
>  
>  /**
> @@ -116,13 +116,13 @@ static void pf_clear_vf_scratch_regs(struct xe_gt *gt, unsigned int vfid)
>  		count = MED_VF_SW_FLAG_COUNT;
>  		for (n = 0; n < count; n++) {
>  			scratch = xe_reg_vf_to_pf(MED_VF_SW_FLAG(n), vfid, stride);
> -			xe_mmio_write32(gt, scratch, 0);
> +			xe_mmio_write32(&gt->mmio, scratch, 0);
>  		}
>  	} else {
>  		count = VF_SW_FLAG_COUNT;
>  		for (n = 0; n < count; n++) {
>  			scratch = xe_reg_vf_to_pf(VF_SW_FLAG(n), vfid, stride);
> -			xe_mmio_write32(gt, scratch, 0);
> +			xe_mmio_write32(&gt->mmio, scratch, 0);
>  		}
>  	}
>  }
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
> index 0e23b7ea4f3e..924e75b94aec 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
> @@ -237,7 +237,7 @@ static void read_many(struct xe_gt *gt, unsigned int count,
>  		      const struct xe_reg *regs, u32 *values)
>  {
>  	while (count--)
> -		*values++ = xe_mmio_read32(gt, *regs++);
> +		*values++ = xe_mmio_read32(&gt->mmio, *regs++);
>  }
>  
>  static void pf_prepare_runtime_info(struct xe_gt *gt)
> @@ -402,7 +402,7 @@ static int pf_service_runtime_query(struct xe_gt *gt, u32 start, u32 limit,
>  
>  	for (i = 0; i < count; ++i, ++data) {
>  		addr = runtime->regs[start + i].addr;
> -		data->offset = xe_mmio_adjusted_addr(gt, addr);
> +		data->offset = xe_mmio_adjusted_addr(&gt->mmio, addr);
>  		data->value = runtime->values[start + i];
>  	}
>  
> @@ -513,7 +513,7 @@ int xe_gt_sriov_pf_service_print_runtime(struct xe_gt *gt, struct drm_printer *p
>  
>  	for (; size--; regs++, values++) {
>  		drm_printf(p, "reg[%#x] = %#x\n",
> -			   xe_mmio_adjusted_addr(gt, regs->addr), *values);
> +			   xe_mmio_adjusted_addr(&gt->mmio, regs->addr), *values);
>  	}
>  
>  	return 0;
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 4ebc82e607af..d3baba50f085 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -881,7 +881,7 @@ static struct vf_runtime_reg *vf_lookup_reg(struct xe_gt *gt, u32 addr)
>   */
>  u32 xe_gt_sriov_vf_read32(struct xe_gt *gt, struct xe_reg reg)
>  {
> -	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
> +	u32 addr = xe_mmio_adjusted_addr(&gt->mmio, reg.addr);
>  	struct vf_runtime_reg *rr;
>  
>  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> @@ -917,7 +917,7 @@ u32 xe_gt_sriov_vf_read32(struct xe_gt *gt, struct xe_reg reg)
>   */
>  void xe_gt_sriov_vf_write32(struct xe_gt *gt, struct xe_reg reg, u32 val)
>  {
> -	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
> +	u32 addr = xe_mmio_adjusted_addr(&gt->mmio, reg.addr);
>  
>  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>  	xe_gt_assert(gt, !reg.vf);
> diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
> index 5a1d65e4f19f..69a066ef20c0 100644
> --- a/drivers/gpu/drm/xe/xe_sriov.c
> +++ b/drivers/gpu/drm/xe/xe_sriov.c
> @@ -35,7 +35,7 @@ const char *xe_sriov_mode_to_string(enum xe_sriov_mode mode)
>  
>  static bool test_is_vf(struct xe_device *xe)
>  {
> -	u32 value = xe_mmio_read32(xe_root_mmio_gt(xe), VF_CAP_REG);
> +	u32 value = xe_mmio_read32(xe_root_tile_mmio(xe), VF_CAP_REG);
>  
>  	return value & VF_CAP;
>  }
> -- 
> 2.45.2
> 
