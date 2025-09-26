Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF3A8CAC5B8
	for <intel-xe@archiver.kernel.org>; Fri, 26 Sep 2025 22:03:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C24910E14A;
	Fri, 26 Sep 2025 22:03:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nDi3zQyw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D91710E14A
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Sep 2025 22:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758924216; x=1790460216;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qaEQOUKkm2FBBtqKpO9YybDP3PbV0uXUx7bbhzC0JZw=;
 b=nDi3zQywBT/xEIbEnUQQMSipQl9xdCLAjGiYNeApz9m7DfMwKTa/V70d
 az9eIQobM8HwsBBNylnB57AZ8NNyd4GHOfGwhylurCaY+g8QF+Xf3SxTd
 A5vCXTjL2bh5Z2rNh9XVV16I5wu3hf0IAuT7WfCjgv9lmY1tQv/Kn4Oca
 88896P7Hxi5OPZEDxEMev76jQziUNcDqvs8K9fxTlgEI7dArCP4pduDBd
 7VF11bo4G299oU5lAMB1mpQR8A2yQ6TWqOVjGQnhaSytMpcE4sMa6M7wu
 xQTsX55t/jALZRXEKXowmEpPZIRGnqJwifDWmKD87tqcGUiSBBQ4DSCBh A==;
X-CSE-ConnectionGUID: frFQkAc+RZe6ELIAtAvL1w==
X-CSE-MsgGUID: 0L85+FKATqGNXvZdgGklgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11565"; a="86706446"
X-IronPort-AV: E=Sophos;i="6.18,296,1751266800"; d="scan'208";a="86706446"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 15:03:35 -0700
X-CSE-ConnectionGUID: lfUKuMO1Ts6ICFilZi5uPw==
X-CSE-MsgGUID: DE/GRLnaRHu3qy5BkaXGPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,296,1751266800"; d="scan'208";a="181733530"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 15:03:30 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 15:03:28 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 26 Sep 2025 15:03:28 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.14) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 15:03:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hQYZpIHoIVspgV+G63q/G8uhWvbmB0EoW4qH7SZxoRBQCctVf7qmVXGONN8a1C4krNBbS/+SW3t17luYgSXJAeiR2M+ggpX3JPldMYReQXTswwPzUwpSyi0UQOBZElmPPxmy1TVMrxabBZuweEhybKXkPnZv9HAXVVXQ06SpwcnVl6uhyyVBTKKcA3c1wGHiZtp9c+gNQ/AcVc+cGPnYmHYTfo5CIHlGPMH2XpiBGgcyA37e9I9TAyVHJkir9/904epeFAw/sYZ9+WQSbfnKDfw5Qkx3QDY+IxhOtMlk0hbT00mCcGNRnkmAKqtxohrf3rVa4bdf20EloqcOqUUEfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LQprG0cW9AhW/Wi+umhmUxAqer8a7qj5mdDM+mIqbEg=;
 b=ZVeVbRt7GB8lJWGdxhjf2bWuCg4TAXi3Uj1KYF5LbDloVx/gVzV8ZKMzqQJwHklbRKduf+IgKN/8P5+VhC7lSFjAiMpILnDZ0elcV9189oV6x56C6Xxti2WQXtjzlHuf8Us15vebq+FJD8FyxqWIW7mrSCnDewjVSWsHSDHDktWFz9pe+gG2eYeLp7PldU3Inkm+ZUYz9uJ9cmkCyJ5offlKVtS/cXfdJHJ6xP9WgAt6wtWqLSJAtcphHRDWKfaLhDyZIzTPanryKBX+tvr7mO9rjMUkEK5zFjR5OKD/UveQJrWoZpg8O/ei+kFsT0Rqo9gjEImj0B7+oImi2aJirg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB6776.namprd11.prod.outlook.com (2603:10b6:806:263::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Fri, 26 Sep
 2025 22:03:20 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9160.008; Fri, 26 Sep 2025
 22:03:20 +0000
Date: Fri, 26 Sep 2025 17:03:18 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <fei.yang@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/1] drm/xe: TileAddrRange registers are deprecated.
Message-ID: <nicfkvrgzyugrdesyhd6bzkgcp5ysz45lwd4pkj74wrxg4772u@lssvyl5hod6m>
References: <20250926211000.318643-1-fei.yang@intel.com>
 <20250926211000.318643-2-fei.yang@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250926211000.318643-2-fei.yang@intel.com>
X-ClientProxiedBy: SJ0PR03CA0210.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::35) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB6776:EE_
X-MS-Office365-Filtering-Correlation-Id: aa94db5f-0512-4361-b61f-08ddfd488157
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ie4ZRGD60QiUyTSS678JQcj8JD6GTRNGQ6xPITeTQYVxMmMkLdKKCexJQmg9?=
 =?us-ascii?Q?lL5+JVRTMmZsiI0usca3N/Hl42PDLphQHEv6haijmVmjE7K84py7Dff6lfb8?=
 =?us-ascii?Q?U6MmDGRUe6BIJEQz2XHlCjDUjD8/D4zppFhVAZAbhQYp493qYuNXEcIxjdNG?=
 =?us-ascii?Q?ebu6/FjBYPJFXL2H5pYMyxz+UM/r1j2q7+ySUehhjwOdberxuqn3GUsFt+qJ?=
 =?us-ascii?Q?ViPLAb9qZWxvmjB9G8VLQR7mgGQDjcNtVR7MdIul2b04L8LOMYqeI9Zr1cFc?=
 =?us-ascii?Q?mTu/FW6e9N8X88aec/wYIA22aZYJWUo9OocV2oFFM21wnjDqnjASyXU1gB1O?=
 =?us-ascii?Q?qVImufoa5f4mCYHEovce0lU0mSJqfPW3Q5vml17A/9ATPgr5KvlGZJlOUk4i?=
 =?us-ascii?Q?Gz/r9nKGS/d2/7WbEHm/Ju929B30gWtDXezvTtHBDhOeZWk8ePRGkSZXQxMq?=
 =?us-ascii?Q?N9Whp0RtdNbDFMmNhjYgnbmXONrla1r3GFN+/kXx4Tq/kWTE8X0YBWKhrxJZ?=
 =?us-ascii?Q?wcNDtHZSiJ9Df3O/5ffpnVgy0tOkt++U2hiA0ulrtJmHuHyOK8Pb8FWFPt9O?=
 =?us-ascii?Q?kix5TfGmF6e6+tyiVVsI/sownugxQklA12mLwPg4BkLMa8OKpeJyvobf4SYN?=
 =?us-ascii?Q?qVan9zdUw/sVGY4hEAFqzsJBIjR7KvFazdLr9cHjSQuE0z/z5JmYVtp2YNRC?=
 =?us-ascii?Q?P8+xz+daSM+tcEBZThlwqrKEJpHxOPX1UB/OEElA+bHS7uzG0KUHARvjD/DH?=
 =?us-ascii?Q?B1ZqIDPmoqBGut0KXPhh/BKumJYZsvcW1HU87yKhgPpjIl6l8ODtJ2TOtw85?=
 =?us-ascii?Q?YX3IUATlKh+5qxXty1y3szgZpi39Kse7YXkf5ATGw0A25iLt5ZzQWBj8ZQbc?=
 =?us-ascii?Q?207FD+tjAzHUWrCyIzkY/aehntHRAVW5zqbIL5DEXdwbZhaS23XdiBaX+wNM?=
 =?us-ascii?Q?BUarq15H+oBysHJ/GIia8YWBIJJtZhFt9BREo4uATsUCvk5X9CfQgU89MsDC?=
 =?us-ascii?Q?b8NfdhTshI02TcfeP2o8Ag1FDQUgicV4BPmuBPzYuhGB5EpS4eM2YcU+iBmo?=
 =?us-ascii?Q?5U3U8KWAR8dSGQPdYAndIDyagc3AWSyoVodgLx3Kg5acsR2kHyaXYspUAF8f?=
 =?us-ascii?Q?87mW5EMjYw0NzqWOCHPvMatdxaCuKle2WArUvW4U+CXsFqmEfq7QVhgEwyuO?=
 =?us-ascii?Q?LST/4H2f7P0JFijYVAk3tlveHz+WWhqEBV8HCBqStJw9z7xUuFaSPRbqhv9q?=
 =?us-ascii?Q?OP/NF3az0Req6gtkQX0tlDzM08nQAbiuZRBdFxC+O79VV52TnyB69Q2zO+yi?=
 =?us-ascii?Q?Wu1A5TzAN01qeJ1ofY/KgIR+eri6EZ/RUqe3OndDD2xJXoyGsw3AsoK8aka2?=
 =?us-ascii?Q?k87KlfKMLtuFTGwVcoYLDrVIDInFYWEvfvwZpibPvKcHgmA1u1UlLNvjdna5?=
 =?us-ascii?Q?L3xBpaOQO90=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VIPhLOjRKMe51kFIaYhhYX3MYkvn57wZoQzNpjJT3ejR9aRSabinfIuKoFOf?=
 =?us-ascii?Q?hVIudqtGv7KgAxzXhztg6TuN+5dXOn3ESc/cSoC9rQw3jIx+oalSPiq3mTRU?=
 =?us-ascii?Q?QcUszWAZ2kHOHPD7SdHTg5uWXLEGGRaz6PhgBwcmiI7x/w7+X/i9jHR5aC/i?=
 =?us-ascii?Q?TUcjLU0lHIebuJQBZhoqK3/B21hAk4dPc5nGfg1qdPfRUO/gIh9VMrg//zxE?=
 =?us-ascii?Q?Uzlw2cqlGk3Ds4pJeKHojbaiPSDlxclBEuJJpem7lPJ6uEOxjRq5uRwxGYGu?=
 =?us-ascii?Q?B/VOcwAxux+JYOGtyTR29UxzAiStg18UeB3BLdRFp90u8/y41IGfmS6gAENu?=
 =?us-ascii?Q?hZphyLYWLFouM4Feu8QTFweHlRoqZ4wuDZRJzUhSQn6bUghoKCIPZiesm1Xh?=
 =?us-ascii?Q?pc5e5BwBjjAsKq80fs1hqM81QxI23F3iU+KJ1OOY8oB9FL6R6vY6bVpUAcwx?=
 =?us-ascii?Q?dD2ow6aeaj8eHGBrKmjeKiHLieKfARJxhElXx3oOfEWHN4UAgX3BonIODb8B?=
 =?us-ascii?Q?b1PLOYhk15+6mue7LSRoGHDwmmgSut8RL1wHtgICeOI2G4GNdUQWUtGFTvCR?=
 =?us-ascii?Q?r2baVvwzc/5DbJw/vY7zSM4fpffGrAuyOnOOooF8/2/GKMoQAYbFzofTo7M8?=
 =?us-ascii?Q?ZGXZaYLoYMhjV+uL6xI91QfZ7URghcxBsfMCfrrCy8FX/xdrBg5OdWu2mFYE?=
 =?us-ascii?Q?jtmHYlE/gzhOOndLSmmVlZtsVJCV5SyGpVOBYTEug7oXNrx/+xEXq8p6zJdc?=
 =?us-ascii?Q?YPLyUgBCeNB7a/aWPkuyzVFbAjjc0cmhTj61dNh2VNC3zQuQYMBNFj0xySJl?=
 =?us-ascii?Q?pCJIybO/FlePo/H9MFE8s99g34G2PlkaWqtsfPDn2b0oBKrGRslFCE+icHsU?=
 =?us-ascii?Q?nk27sOn6mz8ZffV+0V93h1DruIOyzbH2yzriOQzf7NlNAsNmpWYiXF72fRUa?=
 =?us-ascii?Q?ZCMPzs7ZV/BPZZ1FGzAC5/b3SZSjeG3zQkfPKpC1OtoIupDDbNu4lIo9Cisy?=
 =?us-ascii?Q?CZbBrTwgLHLKnJDs0qQ+dpR9leQmQtoGtom/ruSa9LrH/usWyg4fq3biXxQh?=
 =?us-ascii?Q?Mjw9EWAVJhtSleczbLLlgD2FjyP+psXWQhJMVPKE94p/791ex/tCTHfy85F4?=
 =?us-ascii?Q?Eg+51iyFRqVibSopiHvNKKbg6fZk3BX7PDNgyLuWkOXokbOZJLdDOBTuUsU+?=
 =?us-ascii?Q?Wc31gOYOx2oEI3aKXGq1KHRtdqtDBTr0uxqfIhvO/P4yKpDT8xZ/Doq9evt9?=
 =?us-ascii?Q?Tci6xhSIEB2MWYZnkn/bozlqZWUvuZHE2olQNyW6nhtAzDtfMr2k1aUzLprQ?=
 =?us-ascii?Q?T4oJNw+eD1VNth+k72MAusl8Nkjw4j8o3gtTlhfaCEB0+9J+j6LXtUETeyUe?=
 =?us-ascii?Q?vXiPzT03tEMdecMYeCb3ps0yyfFcbwsh6jSH7kSVZ1qXSWyk1jrKvGs1Aeg0?=
 =?us-ascii?Q?N/D+72mkjMr4oyHV303VRBGLc2Ybz0Sk39X7Exev8cdna/CbrHznd4sxcITc?=
 =?us-ascii?Q?LrH80lJiyttrMWFWv0BokbwPbc/8XuVkPPijvtKwXpwnHDGj4yROWuWo29QD?=
 =?us-ascii?Q?K+rKkImbu4g8+x3S+OJTRkq/TzbZbw2J5OCsKQtF3fT+OKv78lLDTIrfmA3/?=
 =?us-ascii?Q?8g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aa94db5f-0512-4361-b61f-08ddfd488157
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 22:03:20.7521 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kwHlObVi/yk+IqwvXctNdCM60/T5mrV0Gw+dFCyrQZmR02M6mnP+lyqFQ2sIrWII28//jwAdHsPW5ut05OtRZH0EFkwLMxgB7+69s7YioyA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6776
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

On Fri, Sep 26, 2025 at 02:09:59PM -0700, fei.yang@intel.com wrote:
>From: Fei Yang <fei.yang@intel.com>
>
>Replace it with Register_SGAddrRangeforTile which points to MMIO(0x1083a0).


I think we need some more context here... we have this tile register
that basically works for all discrete cards supported by xe. The
register we were using before was a per-gt register which means we'd add
the gt offset to it.  However we always call tile_vram_size() with the
primary_gt as argument. This is unneded complication, particularly
considering we will want to allow disabling GTs for testing purposes in
future[1].

 From bspec, it doesn't seem the previous register is actually
deprecated, it's just unneeded complication.

Bspec: 59353, 55528, 43880, 54991

[1] https://lore.kernel.org/intel-xe/20250925234628.2112163-24-matthew.d.roper@intel.com/T/#t



>
>Signed-off-by: Fei Yang <fei.yang@intel.com>
>---
> drivers/gpu/drm/xe/regs/xe_gt_regs.h | 2 ++
> drivers/gpu/drm/xe/xe_vram.c         | 2 +-
> 2 files changed, 3 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>index 06cb6b02ec64..89a44198ca9d 100644
>--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>@@ -99,6 +99,8 @@
> #define XEHP_FLAT_CCS_BASE_ADDR			XE_REG_MCR(0x4910)
> #define XEHP_FLAT_CCS_PTR			REG_GENMASK(31, 8)
>
>+#define XEHP_SG_TILE_ADDR_RANGE(_idx)		XE_REG(0x1083a0 + (_idx) * 4)

Please also remove the now unused register to avoid it being used by
mistake in future.

With commit message change + the register removal here
this is Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>+
> #define WM_CHICKEN3				XE_REG_MCR(0x5588, XE_REG_OPTION_MASKED)
> #define   HIZ_PLANE_COMPRESSION_DIS		REG_BIT(10)
>
>diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
>index b44ebf50fedb..74cc04412abc 100644
>--- a/drivers/gpu/drm/xe/xe_vram.c
>+++ b/drivers/gpu/drm/xe/xe_vram.c
>@@ -255,7 +255,7 @@ static int tile_vram_size(struct xe_tile *tile, u64 *vram_size,
> 		*tile_size = pci_resource_len(to_pci_dev(xe->drm.dev), LMEM_BAR);
> 		*tile_offset = 0;
> 	} else {
>-		reg = xe_gt_mcr_unicast_read_any(gt, XEHP_TILE_ADDR_RANGE(gt->info.id));
>+		reg = xe_mmio_read32(&tile->mmio, XEHP_SG_TILE_ADDR_RANGE(tile->id));
> 		*tile_size = (u64)REG_FIELD_GET(GENMASK(14, 8), reg) * SZ_1G;
> 		*tile_offset = (u64)REG_FIELD_GET(GENMASK(7, 1), reg) * SZ_1G;
> 	}
>-- 
>2.43.0
>
