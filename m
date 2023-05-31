Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 937FCC77B73
	for <intel-xe@archiver.kernel.org>; Wed, 31 May 2023 21:55:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 203B610E51C;
	Wed, 31 May 2023 21:55:28 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EA3110E518
 for <intel-xe@lists.freedesktop.org>; Wed, 31 May 2023 21:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685570126; x=1717106126;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=AnqyeBrfHonUbTsb0eVLIJw9KZvaGhSOq4uyU4Y3rFs=;
 b=N9+ozSHtphaZC2s97lXSMuOSP9BT9A/6SwCXlpJSfzTxDWSHnjYIUeMs
 MS2zmIzqGh8S9IoyPlug1g+WWLmDQ3KLhb8pXD6vzh5riyPMnNjWqxqHr
 5WqiawqGdCr+Ju0bX05KrMwJieD+uqXvfLH5pM+o8yDHckaB/v7DS8zCS
 rOZH07FN3uMm2oeszLm+Ce4AmNQDsx4ei5digAQm359yJN6K8bVauhthZ
 fflgl0uweVCYWrE2+XWAvRN9CrAQn5KmcwdD4vT1LMPnSWUUjoycMQ7Y4
 coIBbv5YxrcBIhjDF+Fja6uNe3DNwfys7Gyk2Sd2Mgwy9e2AOB4oFm4Qb g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="418872557"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="418872557"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 14:55:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="772149128"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="772149128"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP; 31 May 2023 14:55:24 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 31 May 2023 14:55:24 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 31 May 2023 14:55:23 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 31 May 2023 14:55:23 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 31 May 2023 14:55:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aQByoEMnI6nXKHbm2zyvJVq8FGLurVZOJEe3oVtQRDO/CQN1GKIcdWvDUjPKFi+M4C8yMX2Xrhw9nXRrlKrOrhKlvhs7rRbY3QQPE1e9bJyilyVOeNzAdx/fYTZBt3cCm3WedkOcMLKzYBBqMabZ/0Ff52rkA7VmRp4/qeVLJCazvlY3KyNtwRWPKhlqi5m5XcF1YAzPH7W6vQ+J3DVnAfUZVtEqyjjxbCnAs3NWN8ulm8pyBpE1C7fEqaO2Nfoplu6sqcgqByhKX6k20F0r+TAk/XTUq788deGP72G98SrrSiL+bt0j3zzC06yxxJv3hyc40OfLARcsFleEQIkE3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nkBmYPdaCeNq1bZGZtsodmw9QCr9WMYsmMOPmnfJg/M=;
 b=M/rJTckvExCE1khkyeun9g4eIlsahugF3oOo4G5gBg3sjqbhuKMb/dDnO7aV1FvAD9uQFfgBMEy/A4/mttgK9HwGr9NuJkbfQJMB5sxumb427AmGyg4bxHZwBmcyObIJ1QeeWYjGglU83L2OBAci8Cyc+xt54Tl3d7IIfsgop5jGVkAsP4noX3N7+q8Q9+D0oSKWp/XL6Mca8N7YyEp5QE5bSjO0vjEZ7l2eDv9eK/lu/82t6BbGAYPsHCR9Q0Z7B0dEnI4737W10AuKgKSDhS+Zlo5szXEbw0qG3QasQCxh3RASSqo2jiRfkPpeCJiyeGQZd3TLoMf/UOVzxH5QMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by SN7PR11MB6851.namprd11.prod.outlook.com (2603:10b6:806:2a3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.24; Wed, 31 May
 2023 21:55:10 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::7c95:635b:8059:9e68]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::7c95:635b:8059:9e68%4]) with mapi id 15.20.6455.020; Wed, 31 May 2023
 21:55:09 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230530211549.2632538-22-matthew.d.roper@intel.com>
References: <20230530211549.2632538-1-matthew.d.roper@intel.com>
 <20230530211549.2632538-22-matthew.d.roper@intel.com>
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Wed, 31 May 2023 18:55:05 -0300
Message-ID: <168557010517.1068887.8795252471989963135@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: SJ0PR03CA0171.namprd03.prod.outlook.com
 (2603:10b6:a03:338::26) To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|SN7PR11MB6851:EE_
X-MS-Office365-Filtering-Correlation-Id: f5080a3e-b8e5-47d6-0e8e-08db6221b3ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Bf/uHaPGhMew9WVSyiovkKl0V4ryDZDchcNk8R7NBrqpk/lNNuwlTHAIB+Q0gqmhA/ZL6/CEE0I2i9yY5FOCypEArUSUQzrMsfVswBDKNOv3x7XgKE8pkKyGuUaRJ+lpuSPWWecIecfSXUqZgdN5KVmVJ8uomfOi54XgbXZfGNPUSN7ZOIPa+9DTaTytQ/HaXpDjC7rN7zAvEfn0CrP9sY6ggHsXtWlMlsIZNktKYGU8OzYmNEU5HhU1TooulbEwx7wkCouap2JrdDxHnEMskwe8pfWZoV0FJrp52eif06VQmjKF9MWqbpMN2XZ9aexgYE/aDGIWNr94xzZnlnkaE//7ewZPRGSAtO7i+VLXo8ZQmxQRBG/LA0TNRDLmaVlaSF6ZN0zUANiE1+BVnpDG84pZPbDT2Holv8PmNzJfZKOxOu40h/bWLuJg/JGk0Dr/2gFv6hwiWnEe5X8artC7Wq+1sYKiznp+jQcTsMuHnghBE2dJCJ5K5GVOurs46SuP6O5jR+5nHtmKFmceIzX11DLjw10rkSW+6OSr+MhhGini6WJvIX0D7n75gFZ1n5t9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(366004)(39860400002)(136003)(396003)(376002)(346002)(451199021)(6666004)(30864003)(316002)(107886003)(2906002)(33716001)(6486002)(5660300002)(186003)(41300700001)(83380400001)(86362001)(8936002)(8676002)(478600001)(38100700002)(82960400001)(26005)(9686003)(6506007)(6512007)(4326008)(66899021)(66556008)(66946007)(66476007)(44832011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y3gxMms5bnQ2emd2L2lFZGdpRzh4NFBsRzJJbGN5Slh0bjdUNU9MaDZTSTVm?=
 =?utf-8?B?UFFXL05IYXNyeHB5Zjg2NXB4anJkdHlDYjhJL3lmRkdyMmxubWR0V0RmbTcz?=
 =?utf-8?B?M0t4ZkNhYXFoR3RjRDVoNW5KeldKVDNQU0hjVkdOQTVsYlRWcWhxMWEvWXR3?=
 =?utf-8?B?Z09ZenFlOVNRb3VyNVg3dTA1NXhYeUduNHZBVmdKZnJkdTQ5T1ErVzZwKzdC?=
 =?utf-8?B?OUx1blVvYlJVcEZJOVpCNHJOUzZGUW9KL3c2MSt1MlYweG9pNkJnWk9DTktZ?=
 =?utf-8?B?QzRZajhScjN2alRtTHBVQnJ5L2oyNDFYTktzRC9Mc0hEQjc3VWZzdTY0ZDA3?=
 =?utf-8?B?TlNaMy91R2RBeUNhMTMvRnlsWEF1VndHNUF2dWthazZzWkNUQk16RDZEVk8w?=
 =?utf-8?B?b3R3QXdYU3l2ZXA1ZlNQWUdHdXZObW9tQWxoMGh1QjE4a2Vxa0hXQmRjSFQx?=
 =?utf-8?B?SStVT05zYUwraERwRmtXWDVrV0k5TGYzRDRZMnkzRjEvQjVOeXozdFk3V2x4?=
 =?utf-8?B?TkJ3YkM0Uk9QS3ZxTjB1Tm5OcmZZb3J2V1ZjeDFHSGsrZnNZTE5oRkZ6aUgr?=
 =?utf-8?B?ckIvYlJFeE54dE0wM1lnTmlnUXd4b3U4MkRONmQ4S2FRM3EvUTBPeHAvZWFC?=
 =?utf-8?B?VS91YU9JLzk5L3Q0ZmFhTklBSHBYaE1QNFJiOWFGaUJ0R1pJeGo3Q25wa2hh?=
 =?utf-8?B?VmlzUXBoOUJCaGRTUFBPbjNVSUlvQlJjNTFtWmFiVUM1N1QwR2dGMk1LZjlN?=
 =?utf-8?B?c0Q2TWpzeXhKTFN6QU9ZYjRFRUJHR2tncnBSREhmZTRDREVIK1RjRkNmbGt3?=
 =?utf-8?B?akJ3T0hna3Qyd2syUEJTcGhpVTZEYUVET0Z4aDYvTE9vcGJKZTdBRTlTK1JO?=
 =?utf-8?B?Z0JTbU5DNDdYTGQrYzArWEV5NHBmajRHcDVQYnQ3TEp4aEJia2JnNmVpcUYr?=
 =?utf-8?B?ZVZZdUZZakNkc2Y3b0J4NnVOOWs0MGNyenhoajcxVEFGayt4OHExeHJTU3I0?=
 =?utf-8?B?L2Uzc1JycElIK24zZ3lQS0RzRlFHUGthMW8zY3FrMzBucHhkZVl4TVJwRzRm?=
 =?utf-8?B?Y2xWYmNwdzVQUWlacGtEU28xSEdXQjAzRjdPYkNDcVJiMEJVTmVzeFpVbFlH?=
 =?utf-8?B?eTFBUDhWU2FSRUI1UWlzYmR5SkozdDk3VEZFUDVwOS8ydUpWL21YRExVMGFB?=
 =?utf-8?B?cTM1UUQ2bmZmemRBUWtSN3hjY2ZsR2M1cjhGaXRHUkxZWFRXTmZWZkJ1UFB5?=
 =?utf-8?B?bjNIa2RMWUJTU2FhVm9ySkR6eU93K05TUERzT1dCd0JxVU43eVYwbisyNFFC?=
 =?utf-8?B?T2xmMkVFZjMrREhWWmNLZlRpOWs4cVJPMDRpOUxpVnFrZTQvQ1cwRklaaGVq?=
 =?utf-8?B?TVlKdTB4UUpsd3NiMDRCRlZFVG1NY0NQempQWS9QUkQwR016NFo5aGl4SG1D?=
 =?utf-8?B?SUdIeFprSEVudExzWWpON2VNQXlUQVJmc0ZLTkF1bHRQbUdkZ21RY241MzRk?=
 =?utf-8?B?a1g2ZEpSZFdFdjRTemlscVVGWStHWnlyL29ObS9Hc1RnUVFQdk1OUW1JMjZB?=
 =?utf-8?B?S2Uwc0hVRzN5VEFhYlRxT0g0SGVtanNVaVI1N1R3aHhuODJwNit1Zm5iaFpM?=
 =?utf-8?B?Ym9mM2pxUGRrUjl5dG4yZ2lUSGtJT0pFclhQeXJVam9mY2lkS0Zua0dJaW5R?=
 =?utf-8?B?ZkdNaHp1Z0t5eGNjRFh1bit2VE9SNGE3UkRCdk5QcXhSRHFYYWdHQWkvVmFJ?=
 =?utf-8?B?dDFpUXFBRlpkQUEybDRIK0lLQmY0NnhpZjN1VDVPTGt3V1ZJZ1RObU5WaHZx?=
 =?utf-8?B?NUo4VDV6UWNpdURZMnY5YjF4eU9hVnJLKzNoV2ZZQWdWMnFvUnhNaUpOWHNy?=
 =?utf-8?B?NS9ZRzVwRlFnbmp3TVR3N2dWTVJPaHE5anlPL1FZTkM5eEFhYlR1RkJyaTRG?=
 =?utf-8?B?cjVFN1JYcmtMYy8yaHVCV1ZsR3hrSDRIeFR4V1oyQ3AwL3NyanNaQXBnSGVB?=
 =?utf-8?B?U2lDNTBJTEJOcU1lR2MrR2RIZ2Y2RnRMQkoyQnRERFVWOVE1YU9zWXh1dkxi?=
 =?utf-8?B?dlpVTExNZVBMWU5tWnZlSXNkcEt1VFFuRlAyMnJUWjlMb1FpQWdrRmZ4QkEx?=
 =?utf-8?B?dDZNU1NKMFBxc0F6ZlJlZ2xCeVI5bjB5V0F1TE1pb0lQbUNnMUFyVkFxSTFI?=
 =?utf-8?B?WUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f5080a3e-b8e5-47d6-0e8e-08db6221b3ba
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2023 21:55:09.6447 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BfHanyCwuXRQDVMGgeFl/pz6ByaYm5ZucY2xQZtG5jgTsYqVfTYLz/ZqhKTaPN5RAWuqiGJLw7ftzzMp57aSrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6851
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 21/31] drm/xe: Interrupts are delivered
 per-tile, not per-GT
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
Cc: matthew.d.roper@intel.com, Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Quoting Matt Roper (2023-05-30 18:15:39-03:00)
>IRQ delivery and handling needs to be handled on a per-tile basis.  Note
>that this is true even for the "GT interrupts" relating to engines and
>GuCs --- the interrupts relating to both GTs get raised through a single
>set of registers in the tile's sgunit range.
>
>On true multi-tile platforms, interrupts on remote tiles are internally
>forwarded to the root tile; the first thing the top-level interrupt
>handler should do is consult the root tile's instance of
>DG1_MSTR_TILE_INTR to determine which tile(s) had interrupts.  This
>register is also responsible for enabling/disabling top-level reporting
>of any interrupts to the OS.  Although this register technically exists
>on all tiles, it should only be used on the root tile.
>
>The (mis)use of struct xe_gt as a target for MMIO operations in the
>driver makes the code somewhat confusing since we wind up needing a GT
>pointer to handle programming that's unrelated to the GT.  To mitigate
>this confusion, all of the xe_gt structures used solely as an MMIO
>target in interrupt code are renamed to 'mmio' so that it's clear that
>the structure being passed does not necessarily relate to any specific
>GT (primary or media) that we might be dealing with interrupts for.
>Reworking the driver's MMIO handling to not be dependent on xe_gt is
>planned as a future patch series.
>
>Note that GT initialization code currently calls xe_gt_irq_postinstall()
>in an attempt to enable the HWE interrupts for the GT being initialized.
>Unfortunately xe_gt_irq_postinstall() doesn't really match its name and
>does a bunch of other stuff unrelated to the GT interrupts (such as
>enabling the top-level device interrupts).  That will be addressed in
>future patches.
>
>v2:
> - Clarify commit message with explanation of why DG1_MSTR_TILE_INTR is
>   only used on the root tile, even though it's an sgunit register that
>   is technically present in each tile's MMIO space.  (Aravind)
> - Also clarify that the xe_gt used as a target for MMIO operations may
>   or may not relate to the GT we're dealing with for interrupts.
>   (Lucas)
>
>Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> drivers/gpu/drm/xe/xe_gt.c  |   2 +-
> drivers/gpu/drm/xe/xe_irq.c | 334 ++++++++++++++++++++----------------
> drivers/gpu/drm/xe/xe_irq.h |   4 +-
> 3 files changed, 187 insertions(+), 153 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>index f00b82e90106..071d4fbd3efc 100644
>--- a/drivers/gpu/drm/xe/xe_gt.c
>+++ b/drivers/gpu/drm/xe/xe_gt.c
>@@ -310,7 +310,7 @@ static int gt_fw_domain_init(struct xe_gt *gt)
>         gt->info.engine_mask =3D gt->info.__engine_mask;
>=20
>         /* Enables per hw engine IRQs */
>-        xe_gt_irq_postinstall(gt);
>+        xe_gt_irq_postinstall(gt_to_tile(gt));

Like noted in a previous patch for a similar situation, couldn't we potenti=
ally
be repeating this call for the same tile in the future for tiles with multi=
ple
gts?

If my concern is valid, I wonder if there are other cases I didn't catch be=
sides
those two in the overall series.

--
Gustavo Sousa

>=20
>         /* Rerun MCR init as we now have hw engine list */
>         xe_gt_mcr_init(gt);
>diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
>index 654c34a5b99a..ad2f73b2a031 100644
>--- a/drivers/gpu/drm/xe/xe_irq.c
>+++ b/drivers/gpu/drm/xe/xe_irq.c
>@@ -27,60 +27,66 @@
> #define IIR(offset)                                XE_REG(offset + 0x8)
> #define IER(offset)                                XE_REG(offset + 0xc)
>=20
>-static void assert_iir_is_zero(struct xe_gt *gt, struct xe_reg reg)
>+static void assert_iir_is_zero(struct xe_gt *mmio, struct xe_reg reg)
> {
>-        u32 val =3D xe_mmio_read32(gt, reg);
>+        u32 val =3D xe_mmio_read32(mmio, reg);
>=20
>         if (val =3D=3D 0)
>                 return;
>=20
>-        drm_WARN(&gt_to_xe(gt)->drm, 1,
>+        drm_WARN(&gt_to_xe(mmio)->drm, 1,
>                  "Interrupt register 0x%x is not zero: 0x%08x\n",
>                  reg.addr, val);
>-        xe_mmio_write32(gt, reg, 0xffffffff);
>-        xe_mmio_read32(gt, reg);
>-        xe_mmio_write32(gt, reg, 0xffffffff);
>-        xe_mmio_read32(gt, reg);
>+        xe_mmio_write32(mmio, reg, 0xffffffff);
>+        xe_mmio_read32(mmio, reg);
>+        xe_mmio_write32(mmio, reg, 0xffffffff);
>+        xe_mmio_read32(mmio, reg);
> }
>=20
> /*
>  * Unmask and enable the specified interrupts.  Does not check current st=
ate,
>  * so any bits not specified here will become masked and disabled.
>  */
>-static void unmask_and_enable(struct xe_gt *gt, u32 irqregs, u32 bits)
>+static void unmask_and_enable(struct xe_tile *tile, u32 irqregs, u32 bits=
)
> {
>+        struct xe_gt *mmio =3D tile->primary_gt;
>+
>         /*
>          * If we're just enabling an interrupt now, it shouldn't already
>          * be raised in the IIR.
>          */
>-        assert_iir_is_zero(gt, IIR(irqregs));
>+        assert_iir_is_zero(mmio, IIR(irqregs));
>=20
>-        xe_mmio_write32(gt, IER(irqregs), bits);
>-        xe_mmio_write32(gt, IMR(irqregs), ~bits);
>+        xe_mmio_write32(mmio, IER(irqregs), bits);
>+        xe_mmio_write32(mmio, IMR(irqregs), ~bits);
>=20
>         /* Posting read */
>-        xe_mmio_read32(gt, IMR(irqregs));
>+        xe_mmio_read32(mmio, IMR(irqregs));
> }
>=20
> /* Mask and disable all interrupts. */
>-static void mask_and_disable(struct xe_gt *gt, u32 irqregs)
>+static void mask_and_disable(struct xe_tile *tile, u32 irqregs)
> {
>-        xe_mmio_write32(gt, IMR(irqregs), ~0);
>+        struct xe_gt *mmio =3D tile->primary_gt;
>+
>+        xe_mmio_write32(mmio, IMR(irqregs), ~0);
>         /* Posting read */
>-        xe_mmio_read32(gt, IMR(irqregs));
>+        xe_mmio_read32(mmio, IMR(irqregs));
>=20
>-        xe_mmio_write32(gt, IER(irqregs), 0);
>+        xe_mmio_write32(mmio, IER(irqregs), 0);
>=20
>         /* IIR can theoretically queue up two events. Be paranoid. */
>-        xe_mmio_write32(gt, IIR(irqregs), ~0);
>-        xe_mmio_read32(gt, IIR(irqregs));
>-        xe_mmio_write32(gt, IIR(irqregs), ~0);
>-        xe_mmio_read32(gt, IIR(irqregs));
>+        xe_mmio_write32(mmio, IIR(irqregs), ~0);
>+        xe_mmio_read32(mmio, IIR(irqregs));
>+        xe_mmio_write32(mmio, IIR(irqregs), ~0);
>+        xe_mmio_read32(mmio, IIR(irqregs));
> }
>=20
>-static u32 xelp_intr_disable(struct xe_gt *gt)
>+static u32 xelp_intr_disable(struct xe_device *xe)
> {
>-        xe_mmio_write32(gt, GFX_MSTR_IRQ, 0);
>+        struct xe_gt *mmio =3D xe_root_mmio_gt(xe);
>+
>+        xe_mmio_write32(mmio, GFX_MSTR_IRQ, 0);
>=20
>         /*
>          * Now with master disabled, get a sample of level indications
>@@ -88,36 +94,41 @@ static u32 xelp_intr_disable(struct xe_gt *gt)
>          * New indications can and will light up during processing,
>          * and will generate new interrupt after enabling master.
>          */
>-        return xe_mmio_read32(gt, GFX_MSTR_IRQ);
>+        return xe_mmio_read32(mmio, GFX_MSTR_IRQ);
> }
>=20
> static u32
>-gu_misc_irq_ack(struct xe_gt *gt, const u32 master_ctl)
>+gu_misc_irq_ack(struct xe_device *xe, const u32 master_ctl)
> {
>+        struct xe_gt *mmio =3D xe_root_mmio_gt(xe);
>         u32 iir;
>=20
>         if (!(master_ctl & GU_MISC_IRQ))
>                 return 0;
>=20
>-        iir =3D xe_mmio_read32(gt, IIR(GU_MISC_IRQ_OFFSET));
>+        iir =3D xe_mmio_read32(mmio, IIR(GU_MISC_IRQ_OFFSET));
>         if (likely(iir))
>-                xe_mmio_write32(gt, IIR(GU_MISC_IRQ_OFFSET), iir);
>+                xe_mmio_write32(mmio, IIR(GU_MISC_IRQ_OFFSET), iir);
>=20
>         return iir;
> }
>=20
>-static inline void xelp_intr_enable(struct xe_gt *gt, bool stall)
>+static inline void xelp_intr_enable(struct xe_device *xe, bool stall)
> {
>-        xe_mmio_write32(gt, GFX_MSTR_IRQ, MASTER_IRQ);
>+        struct xe_gt *mmio =3D xe_root_mmio_gt(xe);
>+
>+        xe_mmio_write32(mmio, GFX_MSTR_IRQ, MASTER_IRQ);
>         if (stall)
>-                xe_mmio_read32(gt, GFX_MSTR_IRQ);
>+                xe_mmio_read32(mmio, GFX_MSTR_IRQ);
> }
>=20
>-static void gt_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
>+static void gt_irq_postinstall(struct xe_tile *tile)
> {
>+        struct xe_device *xe =3D tile_to_xe(tile);
>+        struct xe_gt *mmio =3D tile->primary_gt;
>         u32 irqs, dmask, smask;
>-        u32 ccs_mask =3D xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_=
COMPUTE);
>-        u32 bcs_mask =3D xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_=
COPY);
>+        u32 ccs_mask =3D xe_hw_engine_mask_per_class(tile->primary_gt, XE=
_ENGINE_CLASS_COMPUTE);
>+        u32 bcs_mask =3D xe_hw_engine_mask_per_class(tile->primary_gt, XE=
_ENGINE_CLASS_COPY);
>=20
>         if (xe_device_guc_submission_enabled(xe)) {
>                 irqs =3D GT_RENDER_USER_INTERRUPT |
>@@ -133,57 +144,57 @@ static void gt_irq_postinstall(struct xe_device *xe,=
 struct xe_gt *gt)
>         smask =3D irqs << 16;
>=20
>         /* Enable RCS, BCS, VCS and VECS class interrupts. */
>-        xe_mmio_write32(gt, RENDER_COPY_INTR_ENABLE, dmask);
>-        xe_mmio_write32(gt, VCS_VECS_INTR_ENABLE, dmask);
>+        xe_mmio_write32(mmio, RENDER_COPY_INTR_ENABLE, dmask);
>+        xe_mmio_write32(mmio, VCS_VECS_INTR_ENABLE, dmask);
>         if (ccs_mask)
>-                xe_mmio_write32(gt, CCS_RSVD_INTR_ENABLE, smask);
>+                xe_mmio_write32(mmio, CCS_RSVD_INTR_ENABLE, smask);
>=20
>         /* Unmask irqs on RCS, BCS, VCS and VECS engines. */
>-        xe_mmio_write32(gt, RCS0_RSVD_INTR_MASK, ~smask);
>-        xe_mmio_write32(gt, BCS_RSVD_INTR_MASK, ~smask);
>+        xe_mmio_write32(mmio, RCS0_RSVD_INTR_MASK, ~smask);
>+        xe_mmio_write32(mmio, BCS_RSVD_INTR_MASK, ~smask);
>         if (bcs_mask & (BIT(1)|BIT(2)))
>-                xe_mmio_write32(gt, XEHPC_BCS1_BCS2_INTR_MASK, ~dmask);
>+                xe_mmio_write32(mmio, XEHPC_BCS1_BCS2_INTR_MASK, ~dmask);
>         if (bcs_mask & (BIT(3)|BIT(4)))
>-                xe_mmio_write32(gt, XEHPC_BCS3_BCS4_INTR_MASK, ~dmask);
>+                xe_mmio_write32(mmio, XEHPC_BCS3_BCS4_INTR_MASK, ~dmask);
>         if (bcs_mask & (BIT(5)|BIT(6)))
>-                xe_mmio_write32(gt, XEHPC_BCS5_BCS6_INTR_MASK, ~dmask);
>+                xe_mmio_write32(mmio, XEHPC_BCS5_BCS6_INTR_MASK, ~dmask);
>         if (bcs_mask & (BIT(7)|BIT(8)))
>-                xe_mmio_write32(gt, XEHPC_BCS7_BCS8_INTR_MASK, ~dmask);
>-        xe_mmio_write32(gt, VCS0_VCS1_INTR_MASK, ~dmask);
>-        xe_mmio_write32(gt, VCS2_VCS3_INTR_MASK, ~dmask);
>-        xe_mmio_write32(gt, VECS0_VECS1_INTR_MASK, ~dmask);
>+                xe_mmio_write32(mmio, XEHPC_BCS7_BCS8_INTR_MASK, ~dmask);
>+        xe_mmio_write32(mmio, VCS0_VCS1_INTR_MASK, ~dmask);
>+        xe_mmio_write32(mmio, VCS2_VCS3_INTR_MASK, ~dmask);
>+        xe_mmio_write32(mmio, VECS0_VECS1_INTR_MASK, ~dmask);
>         if (ccs_mask & (BIT(0)|BIT(1)))
>-                xe_mmio_write32(gt, CCS0_CCS1_INTR_MASK, ~dmask);
>+                xe_mmio_write32(mmio, CCS0_CCS1_INTR_MASK, ~dmask);
>         if (ccs_mask & (BIT(2)|BIT(3)))
>-                xe_mmio_write32(gt,  CCS2_CCS3_INTR_MASK, ~dmask);
>+                xe_mmio_write32(mmio,  CCS2_CCS3_INTR_MASK, ~dmask);
>=20
>         /*
>          * RPS interrupts will get enabled/disabled on demand when RPS it=
self
>          * is enabled/disabled.
>          */
>         /* TODO: gt->pm_ier, gt->pm_imr */
>-        xe_mmio_write32(gt, GPM_WGBOXPERF_INTR_ENABLE, 0);
>-        xe_mmio_write32(gt, GPM_WGBOXPERF_INTR_MASK,  ~0);
>+        xe_mmio_write32(mmio, GPM_WGBOXPERF_INTR_ENABLE, 0);
>+        xe_mmio_write32(mmio, GPM_WGBOXPERF_INTR_MASK,  ~0);
>=20
>         /* Same thing for GuC interrupts */
>-        xe_mmio_write32(gt, GUC_SG_INTR_ENABLE, 0);
>-        xe_mmio_write32(gt, GUC_SG_INTR_MASK,  ~0);
>+        xe_mmio_write32(mmio, GUC_SG_INTR_ENABLE, 0);
>+        xe_mmio_write32(mmio, GUC_SG_INTR_MASK,  ~0);
> }
>=20
>-static void xelp_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
>+static void xelp_irq_postinstall(struct xe_device *xe, struct xe_tile *ti=
le)
> {
>         /* TODO: PCH */
>=20
>-        gt_irq_postinstall(xe, gt);
>+        gt_irq_postinstall(tile);
>=20
>-        unmask_and_enable(gt, GU_MISC_IRQ_OFFSET, GU_MISC_GSE);
>+        unmask_and_enable(tile, GU_MISC_IRQ_OFFSET, GU_MISC_GSE);
>=20
>-        xelp_intr_enable(gt, true);
>+        xelp_intr_enable(xe, true);
> }
>=20
> static u32
> gt_engine_identity(struct xe_device *xe,
>-                   struct xe_gt *gt,
>+                   struct xe_gt *mmio,
>                    const unsigned int bank,
>                    const unsigned int bit)
> {
>@@ -192,7 +203,7 @@ gt_engine_identity(struct xe_device *xe,
>=20
>         lockdep_assert_held(&xe->irq.lock);
>=20
>-        xe_mmio_write32(gt, IIR_REG_SELECTOR(bank), BIT(bit));
>+        xe_mmio_write32(mmio, IIR_REG_SELECTOR(bank), BIT(bit));
>=20
>         /*
>          * NB: Specs do not specify how long to spin wait,
>@@ -200,7 +211,7 @@ gt_engine_identity(struct xe_device *xe,
>          */
>         timeout_ts =3D (local_clock() >> 10) + 100;
>         do {
>-                ident =3D xe_mmio_read32(gt, INTR_IDENTITY_REG(bank));
>+                ident =3D xe_mmio_read32(mmio, INTR_IDENTITY_REG(bank));
>         } while (!(ident & INTR_DATA_VALID) &&
>                  !time_after32(local_clock() >> 10, timeout_ts));
>=20
>@@ -210,7 +221,7 @@ gt_engine_identity(struct xe_device *xe,
>                 return 0;
>         }
>=20
>-        xe_mmio_write32(gt, INTR_IDENTITY_REG(bank), INTR_DATA_VALID);
>+        xe_mmio_write32(mmio, INTR_IDENTITY_REG(bank), INTR_DATA_VALID);
>=20
>         return ident;
> }
>@@ -232,10 +243,32 @@ gt_other_irq_handler(struct xe_gt *gt, const u8 inst=
ance, const u16 iir)
>         }
> }
>=20
>-static void gt_irq_handler(struct xe_device *xe, struct xe_gt *gt,
>+static struct xe_gt *pick_engine_gt(struct xe_tile *tile,
>+                                    enum xe_engine_class class,
>+                                    unsigned int instance)
>+{
>+        struct xe_device *xe =3D tile_to_xe(tile);
>+
>+        if (MEDIA_VER(xe) < 13)
>+                return tile->primary_gt;
>+
>+        if (class =3D=3D XE_ENGINE_CLASS_VIDEO_DECODE ||
>+            class =3D=3D XE_ENGINE_CLASS_VIDEO_ENHANCE)
>+                return tile->media_gt;
>+
>+        if (class =3D=3D XE_ENGINE_CLASS_OTHER &&
>+            instance =3D=3D OTHER_MEDIA_GUC_INSTANCE)
>+                return tile->media_gt;
>+
>+        return tile->primary_gt;
>+}
>+
>+static void gt_irq_handler(struct xe_tile *tile,
>                            u32 master_ctl, long unsigned int *intr_dw,
>                            u32 *identity)
> {
>+        struct xe_device *xe =3D tile_to_xe(tile);
>+        struct xe_gt *mmio =3D tile->primary_gt;
>         unsigned int bank, bit;
>         u16 instance, intr_vec;
>         enum xe_engine_class class;
>@@ -247,27 +280,26 @@ static void gt_irq_handler(struct xe_device *xe, str=
uct xe_gt *gt,
>                 if (!(master_ctl & GT_DW_IRQ(bank)))
>                         continue;
>=20
>-                if (!xe_gt_is_media_type(gt)) {
>-                        intr_dw[bank] =3D
>-                                xe_mmio_read32(gt, GT_INTR_DW(bank));
>-                        for_each_set_bit(bit, intr_dw + bank, 32)
>-                                identity[bit] =3D gt_engine_identity(xe, =
gt,
>-                                                                   bank, =
bit);
>-                        xe_mmio_write32(gt, GT_INTR_DW(bank),
>-                                        intr_dw[bank]);
>-                }
>+                intr_dw[bank] =3D xe_mmio_read32(mmio, GT_INTR_DW(bank));
>+                for_each_set_bit(bit, intr_dw + bank, 32)
>+                        identity[bit] =3D gt_engine_identity(xe, mmio, ba=
nk, bit);
>+                xe_mmio_write32(mmio, GT_INTR_DW(bank), intr_dw[bank]);
>=20
>                 for_each_set_bit(bit, intr_dw + bank, 32) {
>+                        struct xe_gt *engine_gt;
>+
>                         class =3D INTR_ENGINE_CLASS(identity[bit]);
>                         instance =3D INTR_ENGINE_INSTANCE(identity[bit]);
>                         intr_vec =3D INTR_ENGINE_INTR(identity[bit]);
>=20
>+                        engine_gt =3D pick_engine_gt(tile, class, instanc=
e);
>+
>                         if (class =3D=3D XE_ENGINE_CLASS_OTHER) {
>-                                gt_other_irq_handler(gt, instance, intr_v=
ec);
>+                                gt_other_irq_handler(engine_gt, instance,=
 intr_vec);
>                                 continue;
>                         }
>=20
>-                        hwe =3D xe_gt_hw_engine(gt, class, instance, fals=
e);
>+                        hwe =3D xe_gt_hw_engine(engine_gt, class, instanc=
e, false);
>                         if (!hwe)
>                                 continue;
>=20
>@@ -285,24 +317,24 @@ static void gt_irq_handler(struct xe_device *xe, str=
uct xe_gt *gt,
> static irqreturn_t xelp_irq_handler(int irq, void *arg)
> {
>         struct xe_device *xe =3D arg;
>-        struct xe_gt *gt =3D xe_root_mmio_gt(xe);
>+        struct xe_tile *tile =3D xe_device_get_root_tile(xe);
>         u32 master_ctl, gu_misc_iir;
>         long unsigned int intr_dw[2];
>         u32 identity[32];
>=20
>-        master_ctl =3D xelp_intr_disable(gt);
>+        master_ctl =3D xelp_intr_disable(xe);
>         if (!master_ctl) {
>-                xelp_intr_enable(gt, false);
>+                xelp_intr_enable(xe, false);
>                 return IRQ_NONE;
>         }
>=20
>-        gt_irq_handler(xe, gt, master_ctl, intr_dw, identity);
>+        gt_irq_handler(tile, master_ctl, intr_dw, identity);
>=20
>         xe_display_irq_handler(xe, master_ctl);
>=20
>-        gu_misc_iir =3D gu_misc_irq_ack(gt, master_ctl);
>+        gu_misc_iir =3D gu_misc_irq_ack(xe, master_ctl);
>=20
>-        xelp_intr_enable(gt, false);
>+        xelp_intr_enable(xe, false);
>=20
>         xe_display_irq_enable(xe, gu_misc_iir);
>=20
>@@ -311,38 +343,38 @@ static irqreturn_t xelp_irq_handler(int irq, void *a=
rg)
>=20
> static u32 dg1_intr_disable(struct xe_device *xe)
> {
>-        struct xe_gt *gt =3D xe_root_mmio_gt(xe);
>+        struct xe_gt *mmio =3D xe_root_mmio_gt(xe);
>         u32 val;
>=20
>         /* First disable interrupts */
>-        xe_mmio_write32(gt, DG1_MSTR_TILE_INTR, 0);
>+        xe_mmio_write32(mmio, DG1_MSTR_TILE_INTR, 0);
>=20
>         /* Get the indication levels and ack the master unit */
>-        val =3D xe_mmio_read32(gt, DG1_MSTR_TILE_INTR);
>+        val =3D xe_mmio_read32(mmio, DG1_MSTR_TILE_INTR);
>         if (unlikely(!val))
>                 return 0;
>=20
>-        xe_mmio_write32(gt, DG1_MSTR_TILE_INTR, val);
>+        xe_mmio_write32(mmio, DG1_MSTR_TILE_INTR, val);
>=20
>         return val;
> }
>=20
> static void dg1_intr_enable(struct xe_device *xe, bool stall)
> {
>-        struct xe_gt *gt =3D xe_root_mmio_gt(xe);
>+        struct xe_gt *mmio =3D xe_root_mmio_gt(xe);
>=20
>-        xe_mmio_write32(gt, DG1_MSTR_TILE_INTR, DG1_MSTR_IRQ);
>+        xe_mmio_write32(mmio, DG1_MSTR_TILE_INTR, DG1_MSTR_IRQ);
>         if (stall)
>-                xe_mmio_read32(gt, DG1_MSTR_TILE_INTR);
>+                xe_mmio_read32(mmio, DG1_MSTR_TILE_INTR);
> }
>=20
>-static void dg1_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
>+static void dg1_irq_postinstall(struct xe_device *xe, struct xe_tile *til=
e)
> {
>-        gt_irq_postinstall(xe, gt);
>+        gt_irq_postinstall(tile);
>=20
>-        unmask_and_enable(gt, GU_MISC_IRQ_OFFSET, GU_MISC_GSE);
>+        unmask_and_enable(tile, GU_MISC_IRQ_OFFSET, GU_MISC_GSE);
>=20
>-        if (gt->info.id =3D=3D XE_GT0)
>+        if (tile->id =3D=3D 0)
>                 dg1_intr_enable(xe, true);
> }
>=20
>@@ -354,8 +386,8 @@ static void dg1_irq_postinstall(struct xe_device *xe, =
struct xe_gt *gt)
> static irqreturn_t dg1_irq_handler(int irq, void *arg)
> {
>         struct xe_device *xe =3D arg;
>-        struct xe_gt *gt;
>-        u32 master_tile_ctl, master_ctl =3D 0, tile0_master_ctl =3D 0, gu=
_misc_iir;
>+        struct xe_tile *tile;
>+        u32 master_tile_ctl, master_ctl =3D 0, gu_misc_iir =3D 0;
>         long unsigned int intr_dw[2];
>         u32 identity[32];
>         u8 id;
>@@ -368,12 +400,13 @@ static irqreturn_t dg1_irq_handler(int irq, void *ar=
g)
>                 return IRQ_NONE;
>         }
>=20
>-        for_each_gt(gt, xe, id) {
>-                if ((master_tile_ctl & DG1_MSTR_TILE(gt_to_tile(gt)->id))=
 =3D=3D 0)
>+        for_each_tile(tile, xe, id) {
>+                struct xe_gt *mmio =3D tile->primary_gt;
>+
>+                if ((master_tile_ctl & DG1_MSTR_TILE(tile->id)) =3D=3D 0)
>                         continue;
>=20
>-                if (!xe_gt_is_media_type(gt))
>-                        master_ctl =3D xe_mmio_read32(gt, GFX_MSTR_IRQ);
>+                master_ctl =3D xe_mmio_read32(mmio, GFX_MSTR_IRQ);
>=20
>                 /*
>                  * We might be in irq handler just when PCIe DPC is initi=
ated
>@@ -381,124 +414,125 @@ static irqreturn_t dg1_irq_handler(int irq, void *=
arg)
>                  * irq as device is inaccessible.
>                  */
>                 if (master_ctl =3D=3D REG_GENMASK(31, 0)) {
>-                        dev_dbg(gt_to_xe(gt)->drm.dev,
>+                        dev_dbg(tile_to_xe(tile)->drm.dev,
>                                 "Ignore this IRQ as device might be in DP=
C containment.\n");
>                         return IRQ_HANDLED;
>                 }
>=20
>-                if (!xe_gt_is_media_type(gt))
>-                        xe_mmio_write32(gt, GFX_MSTR_IRQ, master_ctl);
>-                gt_irq_handler(xe, gt, master_ctl, intr_dw, identity);
>+                xe_mmio_write32(mmio, GFX_MSTR_IRQ, master_ctl);
>+
>+                gt_irq_handler(tile, master_ctl, intr_dw, identity);
>=20
>                 /*
>-                 * Save primary tile's master interrupt register for disp=
lay
>-                 * processing below.
>+                 * Display interrupts (including display backlight operat=
ions
>+                 * that get reported as Gunit GSE) would only be hooked u=
p to
>+                 * the primary tile.
>                  */
>-                if (id =3D=3D 0)
>-                        tile0_master_ctl =3D master_ctl;
>+                if (id =3D=3D 0) {
>+                        xe_display_irq_handler(xe, master_ctl);
>+                        gu_misc_iir =3D gu_misc_irq_ack(xe, master_ctl);
>+                }
>         }
>=20
>-        xe_display_irq_handler(xe, tile0_master_ctl);
>-
>-        /* Gunit GSE interrupts can trigger display backlight operations =
*/
>-        gu_misc_iir =3D gu_misc_irq_ack(gt, tile0_master_ctl);
>-
>         dg1_intr_enable(xe, false);
>-
>         xe_display_irq_enable(xe, gu_misc_iir);
>=20
>         return IRQ_HANDLED;
> }
>=20
>-static void gt_irq_reset(struct xe_gt *gt)
>+static void gt_irq_reset(struct xe_tile *tile)
> {
>-        u32 ccs_mask =3D xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_=
COMPUTE);
>-        u32 bcs_mask =3D xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_=
COPY);
>+        struct xe_gt *mmio =3D tile->primary_gt;
>+
>+        u32 ccs_mask =3D xe_hw_engine_mask_per_class(tile->primary_gt,
>+                                                   XE_ENGINE_CLASS_COMPUT=
E);
>+        u32 bcs_mask =3D xe_hw_engine_mask_per_class(tile->primary_gt,
>+                                                   XE_ENGINE_CLASS_COPY);
>=20
>         /* Disable RCS, BCS, VCS and VECS class engines. */
>-        xe_mmio_write32(gt, RENDER_COPY_INTR_ENABLE,         0);
>-        xe_mmio_write32(gt, VCS_VECS_INTR_ENABLE,         0);
>+        xe_mmio_write32(mmio, RENDER_COPY_INTR_ENABLE, 0);
>+        xe_mmio_write32(mmio, VCS_VECS_INTR_ENABLE, 0);
>         if (ccs_mask)
>-                xe_mmio_write32(gt, CCS_RSVD_INTR_ENABLE, 0);
>+                xe_mmio_write32(mmio, CCS_RSVD_INTR_ENABLE, 0);
>=20
>         /* Restore masks irqs on RCS, BCS, VCS and VECS engines. */
>-        xe_mmio_write32(gt, RCS0_RSVD_INTR_MASK,        ~0);
>-        xe_mmio_write32(gt, BCS_RSVD_INTR_MASK,        ~0);
>+        xe_mmio_write32(mmio, RCS0_RSVD_INTR_MASK,        ~0);
>+        xe_mmio_write32(mmio, BCS_RSVD_INTR_MASK,        ~0);
>         if (bcs_mask & (BIT(1)|BIT(2)))
>-                xe_mmio_write32(gt, XEHPC_BCS1_BCS2_INTR_MASK, ~0);
>+                xe_mmio_write32(mmio, XEHPC_BCS1_BCS2_INTR_MASK, ~0);
>         if (bcs_mask & (BIT(3)|BIT(4)))
>-                xe_mmio_write32(gt, XEHPC_BCS3_BCS4_INTR_MASK, ~0);
>+                xe_mmio_write32(mmio, XEHPC_BCS3_BCS4_INTR_MASK, ~0);
>         if (bcs_mask & (BIT(5)|BIT(6)))
>-                xe_mmio_write32(gt, XEHPC_BCS5_BCS6_INTR_MASK, ~0);
>+                xe_mmio_write32(mmio, XEHPC_BCS5_BCS6_INTR_MASK, ~0);
>         if (bcs_mask & (BIT(7)|BIT(8)))
>-                xe_mmio_write32(gt, XEHPC_BCS7_BCS8_INTR_MASK, ~0);
>-        xe_mmio_write32(gt, VCS0_VCS1_INTR_MASK,        ~0);
>-        xe_mmio_write32(gt, VCS2_VCS3_INTR_MASK,        ~0);
>-        xe_mmio_write32(gt, VECS0_VECS1_INTR_MASK,        ~0);
>+                xe_mmio_write32(mmio, XEHPC_BCS7_BCS8_INTR_MASK, ~0);
>+        xe_mmio_write32(mmio, VCS0_VCS1_INTR_MASK,        ~0);
>+        xe_mmio_write32(mmio, VCS2_VCS3_INTR_MASK,        ~0);
>+        xe_mmio_write32(mmio, VECS0_VECS1_INTR_MASK,        ~0);
>         if (ccs_mask & (BIT(0)|BIT(1)))
>-                xe_mmio_write32(gt, CCS0_CCS1_INTR_MASK, ~0);
>+                xe_mmio_write32(mmio, CCS0_CCS1_INTR_MASK, ~0);
>         if (ccs_mask & (BIT(2)|BIT(3)))
>-                xe_mmio_write32(gt,  CCS2_CCS3_INTR_MASK, ~0);
>+                xe_mmio_write32(mmio,  CCS2_CCS3_INTR_MASK, ~0);
>=20
>-        xe_mmio_write32(gt, GPM_WGBOXPERF_INTR_ENABLE, 0);
>-        xe_mmio_write32(gt, GPM_WGBOXPERF_INTR_MASK,  ~0);
>-        xe_mmio_write32(gt, GUC_SG_INTR_ENABLE,         0);
>-        xe_mmio_write32(gt, GUC_SG_INTR_MASK,                ~0);
>+        xe_mmio_write32(mmio, GPM_WGBOXPERF_INTR_ENABLE, 0);
>+        xe_mmio_write32(mmio, GPM_WGBOXPERF_INTR_MASK,  ~0);
>+        xe_mmio_write32(mmio, GUC_SG_INTR_ENABLE,         0);
>+        xe_mmio_write32(mmio, GUC_SG_INTR_MASK,                ~0);
> }
>=20
>-static void xelp_irq_reset(struct xe_gt *gt)
>+static void xelp_irq_reset(struct xe_tile *tile)
> {
>-        xelp_intr_disable(gt);
>+        xelp_intr_disable(tile_to_xe(tile));
>=20
>-        gt_irq_reset(gt);
>+        gt_irq_reset(tile);
>=20
>-        mask_and_disable(gt, GU_MISC_IRQ_OFFSET);
>-        mask_and_disable(gt, PCU_IRQ_OFFSET);
>+        mask_and_disable(tile, GU_MISC_IRQ_OFFSET);
>+        mask_and_disable(tile, PCU_IRQ_OFFSET);
> }
>=20
>-static void dg1_irq_reset(struct xe_gt *gt)
>+static void dg1_irq_reset(struct xe_tile *tile)
> {
>-        if (gt->info.id =3D=3D 0)
>-                dg1_intr_disable(gt_to_xe(gt));
>+        if (tile->id =3D=3D 0)
>+                dg1_intr_disable(tile_to_xe(tile));
>=20
>-        gt_irq_reset(gt);
>+        gt_irq_reset(tile);
>=20
>-        mask_and_disable(gt, GU_MISC_IRQ_OFFSET);
>-        mask_and_disable(gt, PCU_IRQ_OFFSET);
>+        mask_and_disable(tile, GU_MISC_IRQ_OFFSET);
>+        mask_and_disable(tile, PCU_IRQ_OFFSET);
> }
>=20
> static void xe_irq_reset(struct xe_device *xe)
> {
>-        struct xe_gt *gt;
>+        struct xe_tile *tile;
>         u8 id;
>=20
>-        for_each_gt(gt, xe, id) {
>+        for_each_tile(tile, xe, id) {
>                 if (GRAPHICS_VERx100(xe) >=3D 1210)
>-                        dg1_irq_reset(gt);
>+                        dg1_irq_reset(tile);
>                 else
>-                        xelp_irq_reset(gt);
>+                        xelp_irq_reset(tile);
>         }
>=20
>         xe_display_irq_reset(xe);
> }
>=20
>-void xe_gt_irq_postinstall(struct xe_gt *gt)
>+void xe_gt_irq_postinstall(struct xe_tile *tile)
> {
>-        struct xe_device *xe =3D gt_to_xe(gt);
>+        struct xe_device *xe =3D tile_to_xe(tile);
>=20
>         if (GRAPHICS_VERx100(xe) >=3D 1210)
>-                dg1_irq_postinstall(xe, gt);
>+                dg1_irq_postinstall(xe, tile);
>         else
>-                xelp_irq_postinstall(xe, gt);
>+                xelp_irq_postinstall(xe, tile);
> }
>=20
> static void xe_irq_postinstall(struct xe_device *xe)
> {
>-        struct xe_gt *gt;
>+        struct xe_tile *tile;
>         u8 id;
>=20
>-        for_each_gt(gt, xe, id)
>-                xe_gt_irq_postinstall(gt);
>+        for_each_tile(tile, xe, id)
>+                xe_gt_irq_postinstall(tile);
>=20
>         xe_display_irq_postinstall(xe, xe_root_mmio_gt(xe));
> }
>diff --git a/drivers/gpu/drm/xe/xe_irq.h b/drivers/gpu/drm/xe/xe_irq.h
>index 34ecf22b32d3..69113c21e1cd 100644
>--- a/drivers/gpu/drm/xe/xe_irq.h
>+++ b/drivers/gpu/drm/xe/xe_irq.h
>@@ -7,10 +7,10 @@
> #define _XE_IRQ_H_
>=20
> struct xe_device;
>-struct xe_gt;
>+struct xe_tile;
>=20
> int xe_irq_install(struct xe_device *xe);
>-void xe_gt_irq_postinstall(struct xe_gt *gt);
>+void xe_gt_irq_postinstall(struct xe_tile *tile);
> void xe_irq_shutdown(struct xe_device *xe);
> void xe_irq_suspend(struct xe_device *xe);
> void xe_irq_resume(struct xe_device *xe);
>--=20
>2.40.1
>
