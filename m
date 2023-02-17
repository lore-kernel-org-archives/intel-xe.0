Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13267C05027
	for <intel-xe@archiver.kernel.org>; Fri, 17 Feb 2023 22:22:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8B2D10E1F8;
	Fri, 17 Feb 2023 22:22:40 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CE9210E1F8
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Feb 2023 22:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676672558; x=1708208558;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=EqKUH1AccwdfPfnrDAcMkH+DjsE2JBV6PLIK78V+F3c=;
 b=hWn082YBtO13qqYmAhZUaC4XCQzykPsnxnXrAPcS8AUcM0lmKwv5Ywv3
 YqoKoVuEZcNLWH3Wdvc5gRf0aEJrmTDJmXU/wq9JVkFT+p582/d+VFeup
 fxuOyAT0NhEvLHi4SdKOeOa351OIXKAWod/uJDhfCbnmWJ6Ags54qofcA
 z9J6QOYhJvxFFQuV6+0SgBcLknBHjrnR2B0xIlAeOlvX4xFU8XoKjiOe/
 yAADoughXuJ2vdkOkwkeVvqZVUzv15x2sADqXK+NZQDyxKtyHAzxH9TGX
 jLY4CUko+QoRVH885Gh/jloM74v7nffNhQQkZakADXIOQm06SdfAMhli3 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="332109914"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; d="scan'208";a="332109914"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2023 14:22:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="999592717"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; d="scan'208";a="999592717"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga005.fm.intel.com with ESMTP; 17 Feb 2023 14:22:37 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 17 Feb 2023 14:22:37 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 17 Feb 2023 14:22:37 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 17 Feb 2023 14:22:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=InYwqYa2RgHPRYNXJQQX/LvBrNOI5oD8dtDLJhjDDZOGec1u5lg0iIIW+JCNAfeHmXNlvwTgS/hHDPudsyukEsHwupU9H1tIy/9xaroMBCR1aGEH/pPuaK0F3UknnrPtkMoqtVXoVkbaePIve3oCikA1x3c4pkPl0oAQWyX20BWed7wp9DvpQgd9khoiAlZF7FTCj/5xmA9RePMtmIeNAQV4YOK+U1smhPLWOUHDYKhGg9o/41lfkw5YJuedlN2JMCIR1yh2+P+4tLF4e+AY5vxn9QRK/lykR3AJOsVwOhTwYF6RVVtLVNh/Q/ArafAA2UGcHZk0y21SI3E5bKk+kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1/9KxKDW2WO0qT4U1w1MLYBRXHilgYXUSIZpNieYw0g=;
 b=Z5DxdSCFkR9iBl7biusznQvSRYfqoOtIopaZtXQyBKM2Gr683K8/WfoB/r2EcEpeCz91rIDXbx61zulbCvB/YI7ux9a/ELd+hrNp+jY68cOHjeLdOhnPZxnbxkTU3XnVEfRD21NfmBVBOOcdTYD18VJ8oqlhhvZGRMieCrrnJj/VVYWpn1wPgHg0NX1peTYYsImjJPAWtY5XgRLiih0DDlU3vC8TovYS/7oQzFSEupfCf7AWZkPETeJQJORv4vv+OKnNZto/WZiDEIRiHkOXNRiAwbH5ASe69AsbEJKSpH1zU7SPwTJqZE+8kRtof8tMTh1ugweh14LuAq9CBAdcmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW3PR11MB4618.namprd11.prod.outlook.com (2603:10b6:303:5f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.15; Fri, 17 Feb
 2023 22:22:34 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8%5]) with mapi id 15.20.6111.013; Fri, 17 Feb 2023
 22:22:34 +0000
Date: Fri, 17 Feb 2023 14:22:30 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <20230217222230.l7ssyylivr2c75bx@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230217005226.106499-1-lucas.demarchi@intel.com>
 <20230217005226.106499-9-lucas.demarchi@intel.com>
 <Y+/jICXsAkeW0Onw@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y+/jICXsAkeW0Onw@intel.com>
X-ClientProxiedBy: SJ0PR03CA0098.namprd03.prod.outlook.com
 (2603:10b6:a03:333::13) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW3PR11MB4618:EE_
X-MS-Office365-Filtering-Correlation-Id: 89af2526-49f5-4c26-3959-08db11357788
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Of5JPKhs/vp4za36wPnvvnZE+Ttjk7Bo7g9du91m+2okSC+fWnBb7DRU4paAuQjMezx3p8lGQEzA82CXcPbxgL0eJq3bFF5cbwaG96n2XUXXHVwg/1NoR+lx+tFElMvxyYyz8XlXtcLTLJ2qNCwg8miDC8URSo8+zDDrbME/TDiwMbZMjtEyIFeher6EWGWuLGrdDEOS2tBZq6/gHUiU5/KhfAur2U9yg8HVumDn2Fpg1xhUuWcbNnQSzZC3d7jJBMLBYaxDYwDfdHK5DApz2+AkqKWp+BKzdmZKme8hfzqJ3egYrY8VIc2CjpX3GRi2IfXBjZXuabZEfSRNxfKyn1sWK0jY/Yj/Si18VWF+xnwA/43oCZ5XdkBwmD34Dw6CkrcRKs+yvfw7FYRZTe4C5Z15eXdb+82NZGTbAlmrypJ6Ef2PV+CkZt9IiWoz2uXDQgMOm0+MAdQnaA2F4gIlw5XvuNLv+5tFZ9X+zQfuLVY0AZ/TeeJBuQva+ZKrcDI/Lptjqkj5xmEC1iR52loeJRNdMfyaygY5nBEI0RvJRh/OVmH08AmwaqbN82NKmye8/GYapFXiGEB95VWuJb2q5RgrFwugM3xGO8pRYztUtBIfEo/g32T26uengHt6PTd979enZ4NOlJKvR/g/BiQ6xA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(366004)(346002)(39860400002)(136003)(376002)(451199018)(107886003)(8936002)(186003)(2906002)(6506007)(82960400001)(1076003)(26005)(38100700002)(6666004)(9686003)(6512007)(54906003)(316002)(6636002)(6862004)(478600001)(41300700001)(83380400001)(86362001)(66946007)(4326008)(8676002)(66476007)(66556008)(5660300002)(30864003)(6486002)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Sa4LdPwKipTe5OKsBx7tYHGeGn5bWL1GaNRTwhjaoyUHC9qJwQi2RMazF9?=
 =?iso-8859-1?Q?c2qQFEaN6hw+fUh3J1D5lBubhaSrHG7/6uBjR2h9k9Eva9tbZQhwbMqoqV?=
 =?iso-8859-1?Q?Rg3sQxOzFjiCqn62aBJqrRoH57vHmkOvbxRAYw5oObhkqRDn2o24EVfSST?=
 =?iso-8859-1?Q?RYfEFRuHr2Gqe+mgfDUEYbn1XXKUECX6DJXMHrbJQSMEVmajdcV+NlPCz5?=
 =?iso-8859-1?Q?3BQpgEevW1aMwhTRl1Kt9sl+JbTyVnmW3IdrSGuyRktUacn+9OAeBy7yTI?=
 =?iso-8859-1?Q?wU6VCbW5AOslQRrQqxLVQ0ASNfYu/nDdvKKf17T4VBtRUauZRcPCxCWYnK?=
 =?iso-8859-1?Q?WolRdYojHTvyFmdJjMDvAR08zTbrmAegmemGxpmhpvXLkxZxdbfXUbTKDS?=
 =?iso-8859-1?Q?zY7I3D7MB4G6AGOdZY3q72s+SVe/FPVp9+CJBik2WPn59jbjPOuXT1J9hv?=
 =?iso-8859-1?Q?RbvWzRQ1CB1ob8YGmfEZt/uXezVwwg2nOsbWy/coki4tthYyEqtn0kCzS5?=
 =?iso-8859-1?Q?1BQG6xOcefsNVJi7wQWZFMjXua9PbQZ5XDDfIeLQNeITH1+aLTow+hKJ5g?=
 =?iso-8859-1?Q?n8/AddZrt4TJHMwFYrnDB9uWUnT9Z1hxiud/pGeOnvq/X4DOBLjvrMKAWt?=
 =?iso-8859-1?Q?UavSY8MO6RNpdJ7ubvs86R2lMjkdgwJdl/Lvoavq8Az4Py7N7afqxgyoG4?=
 =?iso-8859-1?Q?p4luFP9W0XH4zgbtsTSJCh1H3tnSimPH3cP9K9bj00FtkHkRaWqGkKv8JR?=
 =?iso-8859-1?Q?SlBtIPAtPiI0xZYgAmp9xREORiDIEv4TsrR4folbu8DhgIH2WHMiiOmr2A?=
 =?iso-8859-1?Q?sUNBcbEdLw7Z16CRkX69no2gF1CCLBZnSq/bz3mktg6hgFlcnxeyNXTpAx?=
 =?iso-8859-1?Q?17aJ1LYuzK0OU/JE3tod+hKpDketBIBSV/GJlfCoANykoIMcH48f3vuHEs?=
 =?iso-8859-1?Q?pWHHjMArihlAT+bb3fPglL8+0UmzCqq2Os3X3ubOS7oOBXKDiOYwrwOELm?=
 =?iso-8859-1?Q?8FQxlpy8tjIqa0ujhH6dfGDfWsBULgCDVlKUnqAwBJP9i91kkjPnrp0xPC?=
 =?iso-8859-1?Q?+gdK8nyYlWSAYLJ7qLrE59H1McJ+Xe7CABGX4WDgnfJk1b/V9YNYDCN9EO?=
 =?iso-8859-1?Q?+HgXDYl0dd6han3rFP+nYKVecmNOltH0UMw0vVixDhTZ0C3FcNEJklIg7y?=
 =?iso-8859-1?Q?iu0NUgER68QKfsddB4YBTlhgWQFysgz/rcHhmxawz0UWTEaG0WYt1zSCnx?=
 =?iso-8859-1?Q?Xp5ReJxgZTiDWWejpt4M5H6qMcf59xBjYodnDoJQPsnVW0iCTPB0wIba3i?=
 =?iso-8859-1?Q?WP3g9KnMSMRHtsFC2xLNrC9CqsTY1YCyLufwfKzxZ159prttEK8fDx+/Io?=
 =?iso-8859-1?Q?NyfonZ3TcG2+A5om/6Zj/v5es2RrMViyzESV/z1R9cT/6Z0BN3McQzek2O?=
 =?iso-8859-1?Q?5lc5Rfef3tzKN/otmbMBqJcgIrCZQwBrOool17jc+9td9exrhA+i2A957e?=
 =?iso-8859-1?Q?sjRNFFvqKXQ8MLGVMaforCeRGHFovrLegixrH3GGLQQnFJk3sOoRxh6QTS?=
 =?iso-8859-1?Q?5UHGMQmlwTUwPeDiqqNCqJDo34ixUNqFKPYhhtmyNfXDYEaJhN4jEYedfh?=
 =?iso-8859-1?Q?FHfmecsIOw5Q5NUFgU804VjxU1aflHnPIBugjGSZlvFGlH8aRtHg3h5w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 89af2526-49f5-4c26-3959-08db11357788
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2023 22:22:34.1599 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9KfpCP3Znwwe5/prv7eaA0zxOULDWYYyY8XlmJADnd5T/92A/Wtg51Q7ADv65EoxJWY9qVTjUfF4Xnsh27YaU4VI0G8dGadwn1BIVvmFgtg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4618
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 08/11] drm/xe: Remove dependency on
 i915_reg.h
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
Cc: intel-xe@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Feb 17, 2023 at 03:27:12PM -0500, Rodrigo Vivi wrote:
>On Thu, Feb 16, 2023 at 04:52:23PM -0800, Lucas De Marchi wrote:
>> Copy the macros used by xe in i915_reg.h to regs/xe_regs.h. A minimal
>> cleanup is done while copying so they adhere minimally to the coding
>> style.  Further reordering and cleaning is left for later.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/regs/xe_regs.h      | 111 +++++++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_execlist.c       |   3 +-
>>  drivers/gpu/drm/xe/xe_ggtt.c           |   3 +-
>>  drivers/gpu/drm/xe/xe_gt_clock.c       |   3 +-
>>  drivers/gpu/drm/xe/xe_guc_pc.c         |   3 +-
>>  drivers/gpu/drm/xe/xe_hw_engine.c      |   3 +-
>>  drivers/gpu/drm/xe/xe_irq.c            |   3 +-
>>  drivers/gpu/drm/xe/xe_lrc.c            |   3 +-
>>  drivers/gpu/drm/xe/xe_mmio.c           |   3 +-
>>  drivers/gpu/drm/xe/xe_pci.c            |   3 +-
>>  drivers/gpu/drm/xe/xe_ring_ops.c       |   3 +-
>>  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c |   3 +-
>>  drivers/gpu/drm/xe/xe_wa.c             |   3 +-
>>  13 files changed, 123 insertions(+), 24 deletions(-)
>>  create mode 100644 drivers/gpu/drm/xe/regs/xe_regs.h
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
>> new file mode 100644
>> index 000000000000..53f1ed54fb1c
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
>> @@ -0,0 +1,111 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +#ifndef _XE_REGS_H_
>> +#define _XE_REGS_H_
>> +
>> +#include "i915_reg_defs.h"
>> +
>> +#define GU_CNTL					_MMIO(0x101010)
>> +#define   LMEM_INIT				REG_BIT(7)
>> +
>> +#define RENDER_RING_BASE			0x02000
>> +#define BSD_RING_BASE				0x04000
>> +#define GEN6_BSD_RING_BASE			0x12000
>> +#define GEN8_BSD2_RING_BASE			0x1c000
>> +#define GEN11_BSD_RING_BASE			0x1c0000
>> +#define GEN11_BSD2_RING_BASE			0x1c4000
>> +#define GEN11_BSD3_RING_BASE			0x1d0000
>> +#define GEN11_BSD4_RING_BASE			0x1d4000
>> +#define XEHP_BSD5_RING_BASE			0x1e0000
>> +#define XEHP_BSD6_RING_BASE			0x1e4000
>> +#define XEHP_BSD7_RING_BASE			0x1f0000
>> +#define XEHP_BSD8_RING_BASE			0x1f4000
>> +#define VEBOX_RING_BASE				0x1a000
>> +#define GEN11_VEBOX_RING_BASE			0x1c8000
>> +#define GEN11_VEBOX2_RING_BASE			0x1d8000
>> +#define XEHP_VEBOX3_RING_BASE			0x1e8000
>> +#define XEHP_VEBOX4_RING_BASE			0x1f8000
>> +#define GEN12_COMPUTE0_RING_BASE		0x1a000
>> +#define GEN12_COMPUTE1_RING_BASE		0x1c000
>> +#define GEN12_COMPUTE2_RING_BASE		0x1e000
>> +#define GEN12_COMPUTE3_RING_BASE		0x26000
>> +#define BLT_RING_BASE				0x22000
>> +#define XEHPC_BCS1_RING_BASE			0x3e0000
>> +#define XEHPC_BCS2_RING_BASE			0x3e2000
>> +#define XEHPC_BCS3_RING_BASE			0x3e4000
>> +#define XEHPC_BCS4_RING_BASE			0x3e6000
>> +#define XEHPC_BCS5_RING_BASE			0x3e8000
>> +#define XEHPC_BCS6_RING_BASE			0x3ea000
>> +#define XEHPC_BCS7_RING_BASE			0x3ec000
>> +#define XEHPC_BCS8_RING_BASE			0x3ee000
>> +#define   GT_WAIT_SEMAPHORE_INTERRUPT		REG_BIT(11)
>> +#define   GT_CONTEXT_SWITCH_INTERRUPT		(1 <<  8)
>> +#define   GT_RENDER_PIPECTL_NOTIFY_INTERRUPT	(1 <<  4)
>> +#define   GT_CS_MASTER_ERROR_INTERRUPT		REG_BIT(3)
>> +#define   GT_RENDER_USER_INTERRUPT		(1 <<  0)
>> +
>> +#define GEN7_FF_THREAD_MODE			_MMIO(0x20a0)
>> +#define   GEN12_FF_TESSELATION_DOP_GATE_DISABLE BIT(19)
>> +
>> +#define PVC_RP_STATE_CAP			_MMIO(0x281014)
>> +#define MTL_RP_STATE_CAP			_MMIO(0x138000)
>> +
>> +#define MTL_MEDIAP_STATE_CAP			_MMIO(0x138020)
>> +#define   MTL_RP0_CAP_MASK			REG_GENMASK(8, 0)
>> +#define   MTL_RPN_CAP_MASK			REG_GENMASK(24, 16)
>> +
>> +#define MTL_GT_RPE_FREQUENCY			_MMIO(0x13800c)
>> +#define MTL_MPE_FREQUENCY			_MMIO(0x13802c)
>> +#define   MTL_RPE_MASK				REG_GENMASK(8, 0)
>> +
>> +#define TRANSCODER_A_OFFSET			0x60000
>> +#define TRANSCODER_B_OFFSET			0x61000
>> +#define TRANSCODER_C_OFFSET			0x62000
>> +#define TRANSCODER_D_OFFSET			0x63000
>> +#define TRANSCODER_DSI0_OFFSET			0x6b000
>> +#define TRANSCODER_DSI1_OFFSET			0x6b800
>> +#define PIPE_A_OFFSET				0x70000
>> +#define PIPE_B_OFFSET				0x71000
>> +#define PIPE_C_OFFSET				0x72000
>> +#define PIPE_D_OFFSET				0x73000
>> +#define PIPE_DSI0_OFFSET			0x7b000
>> +#define PIPE_DSI1_OFFSET			0x7b800
>> +
>> +#define GEN8_PCU_ISR				_MMIO(0x444e0)
>> +#define GEN8_PCU_IMR				_MMIO(0x444e4)
>> +#define GEN8_PCU_IIR				_MMIO(0x444e8)
>> +#define GEN8_PCU_IER				_MMIO(0x444ec)
>> +
>> +#define GEN11_GU_MISC_ISR			_MMIO(0x444f0)
>> +#define GEN11_GU_MISC_IMR			_MMIO(0x444f4)
>> +#define GEN11_GU_MISC_IIR			_MMIO(0x444f8)
>> +#define GEN11_GU_MISC_IER			_MMIO(0x444fc)
>> +#define   GEN11_GU_MISC_GSE			(1 << 27)
>> +
>> +#define GEN11_GFX_MSTR_IRQ			_MMIO(0x190010)
>> +#define   GEN11_MASTER_IRQ			(1 << 31)
>> +#define   GEN11_GU_MISC_IRQ			(1 << 29)
>> +#define   GEN11_DISPLAY_IRQ			(1 << 16)
>> +#define   GEN11_GT_DW_IRQ(x)			(1 << (x))
>> +
>> +#define DG1_MSTR_TILE_INTR			_MMIO(0x190008)
>> +#define   DG1_MSTR_IRQ				REG_BIT(31)
>> +#define   DG1_MSTR_TILE(t)			REG_BIT(t)
>> +
>> +#define GEN9_TIMESTAMP_OVERRIDE					_MMIO(0x44074)
>> +#define   GEN9_TIMESTAMP_OVERRIDE_US_COUNTER_DIVIDER_SHIFT	0
>> +#define   GEN9_TIMESTAMP_OVERRIDE_US_COUNTER_DIVIDER_MASK	0x3ff
>> +#define   GEN9_TIMESTAMP_OVERRIDE_US_COUNTER_DENOMINATOR_SHIFT	12
>> +#define   GEN9_TIMESTAMP_OVERRIDE_US_COUNTER_DENOMINATOR_MASK	(0xf << 12)
>> +
>> +#define GGC					_MMIO(0x108040)
>> +#define   GMS_MASK				REG_GENMASK(15, 8)
>> +#define   GGMS_MASK				REG_GENMASK(7, 6)
>
>one of the things that I'm always confused is with these REG_{BIT,GENMASK,FIELD_PREP}.
>Why can't we simply use the regular "non-REG_" versions like every other driver
>(aside of i915 of course).

it was some time ago, I didn't remember exactly and was guessing it was
because GENMASK returns a long, while our registers are 32bits.
Indeed, commit 09b434d4f6d2 ("drm/i915: introduce REG_BIT() and
REG_GENMASK() to define register contents"):

	We define the above as wrappers to BIT() and GENMASK() respectively to
	force u32 type to go with our register size, and to add compile time
	checks on the bit numbers.

we may revisit that and maybe generalize GENMASK32/BIT32 that guarantees a
u32 type is returned.

Lucas De Marchi


>
>> +
>> +#define GEN12_GSMBASE				_MMIO(0x108100)
>> +#define GEN12_DSMBASE				_MMIO(0x1080C0)
>> +#define   GEN12_BDSM_MASK			REG_GENMASK64(63, 20)
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
>> index c3c52bdc70b1..ad097918b496 100644
>> --- a/drivers/gpu/drm/xe/xe_execlist.c
>> +++ b/drivers/gpu/drm/xe/xe_execlist.c
>> @@ -10,6 +10,7 @@
>>  #include "regs/xe_lrc_regs.h"
>>  #include "regs/xe_gpu_commands.h"
>>  #include "regs/xe_gt_regs.h"
>> +#include "regs/xe_regs.h"
>>  #include "xe_bo.h"
>>  #include "xe_device.h"
>>  #include "xe_engine.h"
>> @@ -22,8 +23,6 @@
>>  #include "xe_ring_ops_types.h"
>>  #include "xe_sched_job.h"
>>
>> -#include "i915_reg.h"
>> -
>>  #define XE_EXECLIST_HANG_LIMIT 1
>>
>>  #define GEN11_SW_CTX_ID_SHIFT 37
>> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
>> index 2c9b2175c5bb..6674297fa25e 100644
>> --- a/drivers/gpu/drm/xe/xe_ggtt.c
>> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
>> @@ -10,6 +10,7 @@
>>  #include <drm/i915_drm.h>
>>
>>  #include "regs/xe_gt_regs.h"
>> +#include "regs/xe_regs.h"
>>  #include "xe_bo.h"
>>  #include "xe_device.h"
>>  #include "xe_gt.h"
>> @@ -18,8 +19,6 @@
>>  #include "xe_mmio.h"
>>  #include "xe_wopcm.h"
>>
>> -#include "i915_reg.h"
>> -
>>  /* FIXME: Common file, preferably auto-gen */
>>  #define MTL_GGTT_PTE_PAT0	BIT_ULL(52)
>>  #define MTL_GGTT_PTE_PAT1	BIT_ULL(53)
>> diff --git a/drivers/gpu/drm/xe/xe_gt_clock.c b/drivers/gpu/drm/xe/xe_gt_clock.c
>> index e9aa7c5452af..cbf9c96c142c 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_clock.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_clock.c
>> @@ -5,13 +5,12 @@
>>  #include "xe_gt_clock.h"
>>
>>  #include "regs/xe_gt_regs.h"
>> +#include "regs/xe_regs.h"
>>  #include "xe_device.h"
>>  #include "xe_gt.h"
>>  #include "xe_macros.h"
>>  #include "xe_mmio.h"
>>
>> -#include "i915_reg.h"
>> -
>>  static u32 read_reference_ts_freq(struct xe_gt *gt)
>>  {
>>  	u32 ts_override = xe_mmio_read32(gt, GEN9_TIMESTAMP_OVERRIDE.reg);
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
>> index f7aaf4826f00..0df82defa7e4 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>> @@ -9,6 +9,7 @@
>>  #include <drm/drm_managed.h>
>>
>>  #include "regs/xe_gt_regs.h"
>> +#include "regs/xe_regs.h"
>>  #include "xe_bo.h"
>>  #include "xe_device.h"
>>  #include "xe_gt.h"
>> @@ -19,8 +20,6 @@
>>  #include "xe_mmio.h"
>>  #include "xe_pcode.h"
>>
>> -#include "i915_reg.h"
>> -#include "i915_reg_defs.h"
>>  #include "intel_mchbar_regs.h"
>>
>>  /* For GEN6_RP_STATE_CAP.reg to be merged when the definition moves to Xe */
>> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
>> index caae4f897644..2b49ccba0ce9 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
>> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>> @@ -8,6 +8,7 @@
>>
>>  #include "regs/xe_engine_regs.h"
>>  #include "regs/xe_gt_regs.h"
>> +#include "regs/xe_regs.h"
>>  #include "xe_bo.h"
>>  #include "xe_device.h"
>>  #include "xe_execlist.h"
>> @@ -22,8 +23,6 @@
>>  #include "xe_sched_job.h"
>>  #include "xe_wa.h"
>>
>> -#include "i915_reg.h"
>> -
>>  #define MAX_MMIO_BASES 3
>>  struct engine_info {
>>  	const char *name;
>> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
>> index d7756c14b4e2..f4f84a16dd83 100644
>> --- a/drivers/gpu/drm/xe/xe_irq.c
>> +++ b/drivers/gpu/drm/xe/xe_irq.c
>> @@ -9,6 +9,7 @@
>>  #include <drm/drm_managed.h>
>>
>>  #include "regs/xe_gt_regs.h"
>> +#include "regs/xe_regs.h"
>>  #include "xe_device.h"
>>  #include "xe_display.h"
>>  #include "xe_drv.h"
>> @@ -17,8 +18,6 @@
>>  #include "xe_hw_engine.h"
>>  #include "xe_mmio.h"
>>
>> -#include "i915_reg.h"
>> -
>>  static void gen3_assert_iir_is_zero(struct xe_gt *gt, i915_reg_t reg)
>>  {
>>  	u32 val = xe_mmio_read32(gt, reg.reg);
>> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>> index c1df76c2cf78..261eabaae369 100644
>> --- a/drivers/gpu/drm/xe/xe_lrc.c
>> +++ b/drivers/gpu/drm/xe/xe_lrc.c
>> @@ -8,6 +8,7 @@
>>  #include "regs/xe_lrc_regs.h"
>>  #include "regs/xe_gpu_commands.h"
>>  #include "regs/xe_gt_regs.h"
>> +#include "regs/xe_regs.h"
>>  #include "xe_bo.h"
>>  #include "xe_device.h"
>>  #include "xe_engine_types.h"
>> @@ -16,8 +17,6 @@
>>  #include "xe_map.h"
>>  #include "xe_vm.h"
>>
>> -#include "i915_reg.h"
>> -
>>  #define GEN8_CTX_VALID				(1 << 0)
>>  #define GEN8_CTX_L3LLC_COHERENT			(1 << 5)
>>  #define GEN8_CTX_PRIVILEGE			(1 << 8)
>> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>> index d0cd9e920d34..262d33e59d26 100644
>> --- a/drivers/gpu/drm/xe/xe_mmio.c
>> +++ b/drivers/gpu/drm/xe/xe_mmio.c
>> @@ -9,14 +9,13 @@
>>
>>  #include "regs/xe_engine_regs.h"
>>  #include "regs/xe_gt_regs.h"
>> +#include "regs/xe_regs.h"
>>  #include "xe_device.h"
>>  #include "xe_gt.h"
>>  #include "xe_gt_mcr.h"
>>  #include "xe_macros.h"
>>  #include "xe_module.h"
>>
>> -#include "i915_reg.h"
>> -
>>  #define XEHP_MTCFG_ADDR		_MMIO(0x101800)
>>  #define TILE_COUNT		REG_GENMASK(15, 8)
>>  #define GEN12_LMEM_BAR		2
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index b0e5c402190c..4ecde7c2e619 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -13,6 +13,7 @@
>>  #include <drm/drm_drv.h>
>>  #include <drm/xe_pciids.h>
>>
>> +#include "regs/xe_regs.h"
>>  #include "xe_device.h"
>>  #include "xe_drv.h"
>>  #include "xe_macros.h"
>> @@ -20,8 +21,6 @@
>>  #include "xe_pm.h"
>>  #include "xe_step.h"
>>
>> -#include "i915_reg.h"
>> -
>>  #define DEV_INFO_FOR_EACH_FLAG(func) \
>>  	func(require_force_probe); \
>>  	func(is_dgfx); \
>> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
>> index 104f96658e1f..ba3bde117af1 100644
>> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
>> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
>> @@ -7,6 +7,7 @@
>>  #include "regs/xe_lrc_regs.h"
>>  #include "regs/xe_gpu_commands.h"
>>  #include "regs/xe_gt_regs.h"
>> +#include "regs/xe_regs.h"
>>  #include "xe_engine_types.h"
>>  #include "xe_gt.h"
>>  #include "xe_lrc.h"
>> @@ -14,8 +15,6 @@
>>  #include "xe_sched_job.h"
>>  #include "xe_vm_types.h"
>>
>> -#include "i915_reg.h"
>> -
>>  static u32 preparser_disable(bool state)
>>  {
>>  	return MI_ARB_CHECK | BIT(8) | state;
>> diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>> index 1c3783becefd..19828e003283 100644
>> --- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>> +++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>> @@ -11,8 +11,7 @@
>>  #include <drm/ttm/ttm_placement.h>
>>  #include <drm/ttm/ttm_range_manager.h>
>>
>> -#include "../i915/i915_reg.h"
>> -
>> +#include "regs/xe_regs.h"
>>  #include "xe_bo.h"
>>  #include "xe_device.h"
>>  #include "xe_gt.h"
>> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
>> index 155cfd1dcc50..df72b15dfeb0 100644
>> --- a/drivers/gpu/drm/xe/xe_wa.c
>> +++ b/drivers/gpu/drm/xe/xe_wa.c
>> @@ -9,6 +9,7 @@
>>
>>  #include "regs/xe_engine_regs.h"
>>  #include "regs/xe_gt_regs.h"
>> +#include "regs/xe_regs.h"
>>  #include "xe_device_types.h"
>>  #include "xe_force_wake.h"
>>  #include "xe_gt.h"
>> @@ -18,8 +19,6 @@
>>  #include "xe_rtp.h"
>>  #include "xe_step.h"
>>
>> -#include "i915_reg.h"
>> -
>>  /**
>>   * DOC: Hardware workarounds
>>   *
>> --
>> 2.39.0
>>
