Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52C3DC7EE23
	for <intel-xe@archiver.kernel.org>; Fri, 24 Feb 2023 18:03:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B78010E256;
	Fri, 24 Feb 2023 18:03:38 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABF8F10E256
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Feb 2023 18:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677261816; x=1708797816;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=N+3r45O/VY/7bUMjE8Atcp+u2FvbeJPEFhzltvOnIxw=;
 b=d5eoAWVxSa3g1r9dvamU/FP1oOWRi22l1HLj9S/MYkgf61yTO8Cv8Od3
 WRQbQL8QGXkxW+ATfI7L7dvTvHGgmgA75371cKdONAP07VR7qvw9MJEU9
 tkzFI6QOBUje3afCNF2GTb5M3kbHXjQpTEnoZdJbScwV8Xu/kVdsOJKRg
 1fcEX1QzoRop3kdMwHMmr9EPjJ41PW7grGwvKFXKuM4zSEADaIN3YgakN
 hrN+aR0y8YeeS0DSptQg4VScmU5xV8aZj2e20Ar3r7QUPQtifIpuw294T
 GaHTYLTWUXxxRwFjgkslU9I06dPOaKPJOrP2frNpdQ3UajciNsE6IdMPp A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="335775372"
X-IronPort-AV: E=Sophos;i="5.97,325,1669104000"; d="scan'208";a="335775372"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2023 10:02:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="847020200"
X-IronPort-AV: E=Sophos;i="5.97,325,1669104000"; d="scan'208";a="847020200"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga005.jf.intel.com with ESMTP; 24 Feb 2023 10:02:45 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 24 Feb 2023 10:02:45 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 24 Feb 2023 10:02:44 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 24 Feb 2023 10:02:44 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.106)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 24 Feb 2023 10:02:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SJ2q/FncCahaod+ay6RRtw6LEu8RuUTV1g5SEzq2B/RP/bR6DXUUGO8XQAfIcwo6tH78GgxJTvx1ksgbXeCIBagary72CNfUe7/Ll9d/ly7FzcQEirjDt3b+RyQvb+gLJQP40IFahhtmbhMym4aqSpVwojaopLgdA+NtpH1Wj4XOPxUzOnBWi5K3Zaf1qbbk7mr8bOcSbMoiVD8O9DNeFBm41+aqh+t2YSX3eb/Un3Vv5Brz/GnC6vr6Pir2X0PFkPlUcXzNQJjOrAh4TTEBt/mblZozIWe77zyLmsVYYxSf9FH2auwh0p+BrOyrx4Od80KrgA7ckvEIu+ls3FCtVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ms2twVr5IqgOXAjcUE8zwmzzmf9JEKrK2pvDx0hk1Jo=;
 b=ef3w5CYfgoRsZapN8jrpfnTc0ykHZSXZUcb1ZJvsAXqUHkXZIb3wQhxpy1KkH+SKKFbpVRbxWXrqdcJwfG5k0BboQgyHW9GmvlNOnzvvARUoOLrX9YaDL7q7WNRSaAdBYy5NtS+xpWnCTJwyAVkVhMaeGL7jL+wYS+brXTWNjS0xTG2MDcrUcHXnxcWZC2juJboQsWVLkwTty6q8q78XE3h6SEvfGFk/YtpC92ivHvF18pig53nxjmrpAMeKkfUtpRXfFQUhjNkKemzUEMXaVP9JuVgAvXPf5/eTevkgvmtS1352Pm/ncoHFF56JW0lX/zeih5m9+ce3v2D1URP8MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 CY5PR11MB6209.namprd11.prod.outlook.com (2603:10b6:930:27::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6111.19; Fri, 24 Feb 2023 18:02:41 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::7333:f4b:7dbb:36b]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::7333:f4b:7dbb:36b%7]) with mapi id 15.20.6134.024; Fri, 24 Feb 2023
 18:02:41 +0000
Date: Fri, 24 Feb 2023 10:02:38 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <Y/j7vnYTDUJZFttP@mdroper-desk1.amr.corp.intel.com>
References: <20230217005226.106499-1-lucas.demarchi@intel.com>
 <20230217005226.106499-5-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230217005226.106499-5-lucas.demarchi@intel.com>
X-ClientProxiedBy: BY3PR10CA0022.namprd10.prod.outlook.com
 (2603:10b6:a03:255::27) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|CY5PR11MB6209:EE_
X-MS-Office365-Filtering-Correlation-Id: a2db8e1a-7b00-4f67-a76d-08db16915239
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OQtzV7MticsW0wx4JiOKbVlPNPo1T0yUV2/7TM8gKZKeTTJmmXaSWSkn8vcM24Ko9xT1UqYypp8t3HhOkkNS4koEkKP7SauGH+Ums/jitIsPIelGvKacjrFN3nfCnEWClzqTUZlagdsYS9g3b+C4jdJGRBojffmhnWKEG/PDb4VVgxuS+7JATXN2NWrqCAL2nFYspEyEbEQ6VGviGOVxtetYnmZJ246F1KFEDBQ/Bn3Eg2nPFX+bg4Kh88GDRw0EtCkLZL37E0MGXcJhcuatVL7wO+B9/HbsOdYO3e+OBnh3rmGvkbKOAoI+9z5VSCfIc94i3I09N+JUvM9/K4ETdar2mp7rLAR+9abdA2krtuQtJlWuPNhXrlu8FqgbXkOcUKhFujpXIUS+VCmZiiQWd9/9cZQg0iz8qHZueWJSR6hpPco9BhEcQOoE6lu6R/dfSFAMHENOE50ilacY/uRHs4mVFDbs/fgkJtyc7k0Q94zGyiJ8JHzskXh+ItLu+xdvP611QdFA4mjWAXl8wYag19nbJ31gVZItvtOnO0A2CZJ/rNB+9XIieTE1JOUidm26pF7JxbXoVN4j9n3x6gn0pwqCQ/hP1mXzzQXYYA7IwZa39WByOM9PGrlhLJYPfRNPIjnGEmkML35+km4yeLuK4Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(396003)(39860400002)(366004)(376002)(136003)(451199018)(86362001)(6486002)(54906003)(316002)(66556008)(107886003)(6636002)(83380400001)(4326008)(8676002)(66476007)(8936002)(66946007)(6666004)(6506007)(41300700001)(6862004)(186003)(478600001)(6512007)(26005)(82960400001)(2906002)(38100700002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?T8ypqONXW2mzJF4t9l+oYwY2RDdjyrNoWDZzS9cpdxUizZyFU+3PLBmA3Z?=
 =?iso-8859-1?Q?8eo5CU0lt5SjhGBDLna8Vu7DEu4/L1pO0405vREw9S3TTFHrvddPdSaWWb?=
 =?iso-8859-1?Q?2gMAwroqHQqvagqFPVsrti5LhAcL8FYQlgacUYnJHFVVzBOXbi2SJDobiv?=
 =?iso-8859-1?Q?alc7KwG7xhVt3EXU2zpYQRBgmR15hUGOFqOWFlxODml9YRkrJ8J/APMHaD?=
 =?iso-8859-1?Q?LOFQMhPNnGyanTRm9++nON/H8h4qmcCVzxN5y5KP2MJpDRei2ufMI3ZUPu?=
 =?iso-8859-1?Q?ojpr2lT44psRXmjB6W5K3eN9R7/TrWja+uwJWu8PH0qqqKamZadNs/9BYJ?=
 =?iso-8859-1?Q?8Rg9+XCl3Y5viA2Fb9avMstbjIkLtSnKDj4kq+qutk6eMeT3JtUOP9ZeJ7?=
 =?iso-8859-1?Q?lwCUHomz7/k7+nwYuLwZz/xou7TzXa2nxOfBJbFp13QK+RhPY3dzXOo+dC?=
 =?iso-8859-1?Q?lIZmB0nboAE2e+8eKmPd3o5YG0/La2JiznyWBWnv5pJnYbORBTtgC7+0GN?=
 =?iso-8859-1?Q?ZNDMC6f+gEJg08nKofI18KZvksAXV2dfQYIda1vVNrQC2e+WgpeE157E3z?=
 =?iso-8859-1?Q?5Zyptb45Onz2c3SD5hRO4OldTj0VB4zNfLC5c5/eCiU+DptBYOU1LSbrko?=
 =?iso-8859-1?Q?JMXY2Lt6HN4QDVtEpzhQjwwWPU/B10UnRjbXZL8RfL1qff9XsKtd6A3m22?=
 =?iso-8859-1?Q?XXLdlbQiV8is9rOgaHs1WEeA7XQWP/2vjwGDKJCndMTiwjA4lkW5QyYjMs?=
 =?iso-8859-1?Q?yGcXgpo9lK8g1Qr0uLiQIkP0alRvR0QpIGYQ5aPHDcspFdbRYSKrdsP9De?=
 =?iso-8859-1?Q?LwOQplLA7vBRbNeDjKlPxBAI/G4rQdkBfwwBdwzcnBKFkNm4vCvmyjfPMe?=
 =?iso-8859-1?Q?HEr1DYwZ7KbaNGaWAnC2uA/eu73FKefq4qllkze6iI914Qth+NoiQHJ6/g?=
 =?iso-8859-1?Q?nprDCDc+guSYyafIXIf56s+m3hiN0Ng516w568kV9EgqLQ0t1TqeLWVKSE?=
 =?iso-8859-1?Q?KGxdkaYT8t706o6PfBqsH1CCSX0CCTR5JO9rWoMFWFYJvqJfAd31sJWKpx?=
 =?iso-8859-1?Q?ZH5veRoAaRQ8RmEKqkneJn033iZmDN4dcYbFHdHLX6C7Uq6ZBN7Qm0fyr1?=
 =?iso-8859-1?Q?29pGfoYvzw+CZbG/ED/3WyEe8GOySben75AzGn1GfQB3eFoIT0i6SITg4L?=
 =?iso-8859-1?Q?2a04JklWLdSO6WQLJqAbdiwl9HbOa4hNWnLVnoPMNw6gYIi86j4zTkt7Tb?=
 =?iso-8859-1?Q?fzESB9FcDapfnlPmNrLHSQGOQP0u2Uux8VCEvGle4GeJa0w/DhAZAm+46z?=
 =?iso-8859-1?Q?vLffaPEbrwJIZzOjXfykciv5Oc+NtWtJb8eyqfje5omqCjjTQ2CD0Yidnx?=
 =?iso-8859-1?Q?q+Ii+/1ESArssFtirv+GXxR9p1papUp1u03+InFCYBvQlDklPWnii2IWXb?=
 =?iso-8859-1?Q?2lraQrF59VP0d4819T3oNTaFAcZVDQm5x0l8OGIImbcxIrd2PjmztNTsQf?=
 =?iso-8859-1?Q?YR/k8Ypy05iyMc091fYY/jS9pa9dslFlxHrRM5LaBf+sppYc//m8/tujbk?=
 =?iso-8859-1?Q?W8ArrBIelISv711liJ08TGHTI4WoqDHR2XnZEXSb1MSV75OBH1ylAdTP4o?=
 =?iso-8859-1?Q?e3mKD2a4V4rP0ZTV2K9HoVerJS4m+eRlgyIPeMJcml54fPktahKDUhrg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a2db8e1a-7b00-4f67-a76d-08db16915239
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2023 18:02:41.0512 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a+b7QLyUUTv+jNWC+f1FT0ZOxsTdZa2zLZcMtaVqfop7nFDGUHcsCCBAvkLlVxKxBH9/6QsBmDetSIx5S7tRnomROygLK9AUgWayrfxPQpc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6209
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 04/11] drm/xe: Remove dependency on
 intel_engine_regs.h
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

On Thu, Feb 16, 2023 at 04:52:19PM -0800, Lucas De Marchi wrote:
> Create regs/xe_engine_regs.h file with all the registers and bit
> definitions used by the xe driver. Eventually the registers may be
> defined in a different way and since xe doesn't supported below gen12,
> the number of registers touched is much smaller, so create a new header.
> 
> The definitions themselves are direct copy from the
> gt/intel_engine_regs.h file, just sorting the registers by address.
> Cleaning those up and adhering to a common coding style is left for
> later.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_engine_regs.h | 98 ++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_execlist.c         |  2 +-
>  drivers/gpu/drm/xe/xe_guc_ads.c          |  5 +-
>  drivers/gpu/drm/xe/xe_hw_engine.c        |  2 +-
>  drivers/gpu/drm/xe/xe_lrc.c              |  2 +-
>  drivers/gpu/drm/xe/xe_mmio.c             |  2 +-
>  drivers/gpu/drm/xe/xe_reg_sr.c           |  2 +-
>  drivers/gpu/drm/xe/xe_reg_whitelist.c    |  2 +-
>  drivers/gpu/drm/xe/xe_wa.c               |  2 +-
>  9 files changed, 109 insertions(+), 8 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/regs/xe_engine_regs.h
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> new file mode 100644
> index 000000000000..6dfa3cf2fd43
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> @@ -0,0 +1,98 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_ENGINE_REGS_H_
> +#define _XE_ENGINE_REGS_H_
> +
> +#include <asm/page.h>
> +
> +#include "i915_reg_defs.h"
> +
> +#define RING_TAIL(base)				_MMIO((base) + 0x30)
> +
> +#define RING_HEAD(base)				_MMIO((base) + 0x34)
> +#define   HEAD_ADDR				0x001FFFFC
> +
> +#define RING_START(base)			_MMIO((base) + 0x38)
> +
> +#define RING_CTL(base)				_MMIO((base) + 0x3c)
> +#define   RING_CTL_SIZE(size)			((size) - PAGE_SIZE) /* in bytes -> pages */
> +#define   RING_CTL_SIZE(size)			((size) - PAGE_SIZE) /* in bytes -> pages */
> +
> +#define RING_PSMI_CTL(base)			_MMIO((base) + 0x50)
> +#define   GEN8_RC_SEMA_IDLE_MSG_DISABLE			REG_BIT(12)
> +#define   GEN12_WAIT_FOR_EVENT_POWER_DOWN_DISABLE	REG_BIT(7)
> +
> +#define RING_ACTHD_UDW(base)			_MMIO((base) + 0x5c)
> +#define RING_DMA_FADD_UDW(base)			_MMIO((base) + 0x60)
> +#define RING_IPEIR(base)			_MMIO((base) + 0x64)
> +#define RING_IPEHR(base)			_MMIO((base) + 0x68)
> +#define RING_ACTHD(base)			_MMIO((base) + 0x74)
> +#define RING_DMA_FADD(base)			_MMIO((base) + 0x78)
> +#define RING_HWS_PGA(base)			_MMIO((base) + 0x80)
> +#define IPEIR(base)				_MMIO((base) + 0x88)
> +#define IPEHR(base)				_MMIO((base) + 0x8c)
> +#define RING_HWSTAM(base)			_MMIO((base) + 0x98)
> +#define RING_MI_MODE(base)			_MMIO((base) + 0x9c)
> +#define RING_NOPID(base)			_MMIO((base) + 0x94)
> +
> +#define RING_IMR(base)				_MMIO((base) + 0xa8)
> +#define   RING_MAX_NONPRIV_SLOTS  12
> +
> +#define RING_EIR(base)				_MMIO((base) + 0xb0)
> +#define RING_EMR(base)				_MMIO((base) + 0xb4)
> +#define RING_ESR(base)				_MMIO((base) + 0xb8)
> +#define RING_BBADDR(base)			_MMIO((base) + 0x140)
> +#define RING_BBADDR_UDW(base)			_MMIO((base) + 0x168)
> +#define RING_EXECLIST_STATUS_LO(base)		_MMIO((base) + 0x234)
> +#define RING_EXECLIST_STATUS_HI(base)		_MMIO((base) + 0x234 + 4)
> +
> +#define RING_CONTEXT_CONTROL(base)		_MMIO((base) + 0x244)
> +#define	  CTX_CTRL_INHIBIT_SYN_CTX_SWITCH	REG_BIT(3)
> +#define	  CTX_CTRL_ENGINE_CTX_RESTORE_INHIBIT	REG_BIT(0)
> +
> +#define RING_MODE_GEN7(base)			_MMIO((base) + 0x29c)
> +#define   GEN11_GFX_DISABLE_LEGACY_MODE		(1 << 3)
> +
> +#define RING_TIMESTAMP(base)			_MMIO((base) + 0x358)
> +
> +#define RING_TIMESTAMP_UDW(base)		_MMIO((base) + 0x358 + 4)
> +#define   RING_VALID_MASK			0x00000001
> +#define   RING_VALID				0x00000001
> +#define   STOP_RING				REG_BIT(8)
> +#define   TAIL_ADDR				0x001FFFF8
> +
> +#define RING_CTX_TIMESTAMP(base)		_MMIO((base) + 0x3a8)
> +
> +#define RING_FORCE_TO_NONPRIV(base, i)		_MMIO(((base) + 0x4d0) + (i) * 4)
> +#define   RING_FORCE_TO_NONPRIV_DENY		REG_BIT(30)
> +#define   RING_FORCE_TO_NONPRIV_ADDRESS_MASK	REG_GENMASK(25, 2)
> +#define   RING_FORCE_TO_NONPRIV_ACCESS_RW	(0 << 28)
> +#define   RING_FORCE_TO_NONPRIV_ACCESS_RD	(1 << 28)
> +#define   RING_FORCE_TO_NONPRIV_ACCESS_WR	(2 << 28)
> +#define   RING_FORCE_TO_NONPRIV_ACCESS_INVALID	(3 << 28)
> +#define   RING_FORCE_TO_NONPRIV_ACCESS_MASK	(3 << 28)
> +#define   RING_FORCE_TO_NONPRIV_RANGE_1		(0 << 0)
> +#define   RING_FORCE_TO_NONPRIV_RANGE_4		(1 << 0)
> +#define   RING_FORCE_TO_NONPRIV_RANGE_16	(2 << 0)
> +#define   RING_FORCE_TO_NONPRIV_RANGE_64	(3 << 0)
> +#define   RING_FORCE_TO_NONPRIV_RANGE_MASK	(3 << 0)
> +#define   RING_FORCE_TO_NONPRIV_MASK_VALID	(RING_FORCE_TO_NONPRIV_RANGE_MASK | \
> +						 RING_FORCE_TO_NONPRIV_ACCESS_MASK | \
> +						 RING_FORCE_TO_NONPRIV_DENY)
> +#define   RING_MAX_NONPRIV_SLOTS  12
> +
> +#define RING_EXECLIST_SQ_CONTENTS(base)		_MMIO((base) + 0x510)
> +
> +#define RING_EXECLIST_CONTROL(base)		_MMIO((base) + 0x550)
> +#define	  EL_CTRL_LOAD				REG_BIT(0)
> +
> +#define VDBOX_CGCTL3F10(base)			_MMIO((base) + 0x3f10)
> +#define   IECPUNIT_CLKGATE_DIS			REG_BIT(22)
> +
> +#define VDBOX_CGCTL3F18(base)			_MMIO((base) + 0x3f18)
> +#define   ALNUNIT_CLKGATE_DIS			REG_BIT(13)
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
> index 5633259482ed..af2fcf1c32f4 100644
> --- a/drivers/gpu/drm/xe/xe_execlist.c
> +++ b/drivers/gpu/drm/xe/xe_execlist.c
> @@ -6,6 +6,7 @@
>  
>  #include <drm/drm_managed.h>
>  
> +#include "regs/xe_engine_regs.h"
>  #include "xe_bo.h"
>  #include "xe_device.h"
>  #include "xe_engine.h"
> @@ -18,7 +19,6 @@
>  #include "xe_ring_ops_types.h"
>  #include "xe_sched_job.h"
>  
> -#include "gt/intel_engine_regs.h"
>  #include "gt/intel_gpu_commands.h"
>  #include "gt/intel_gt_regs.h"
>  #include "gt/intel_lrc_reg.h"
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index 1ea1b25e7170..bde094388a34 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -4,8 +4,11 @@
>   */
>  #include "xe_guc_ads.h"
>  
> +#include "xe_guc_ads.h"
> +

This duplication looks like an accident?

Aside from that,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

>  #include <drm/drm_managed.h>
>  
> +#include "regs/xe_engine_regs.h"
>  #include "xe_bo.h"
>  #include "xe_gt.h"
>  #include "xe_guc.h"
> @@ -16,9 +19,9 @@
>  #include "xe_mmio.h"
>  #include "xe_platform_types.h"
>  
> -#include "gt/intel_engine_regs.h"
>  #include "gt/intel_gt_regs.h"
>  
> +
>  /* Slack of a few additional entries per engine */
>  #define ADS_REGSET_EXTRA_MAX	8
>  
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index edc59d9b124f..ce5d6641499f 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -6,6 +6,7 @@
>  
>  #include <drm/drm_managed.h>
>  
> +#include "regs/xe_engine_regs.h"
>  #include "xe_bo.h"
>  #include "xe_device.h"
>  #include "xe_execlist.h"
> @@ -20,7 +21,6 @@
>  #include "xe_sched_job.h"
>  #include "xe_wa.h"
>  
> -#include "gt/intel_engine_regs.h"
>  #include "gt/intel_gt_regs.h"
>  #include "i915_reg.h"
>  
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 45503c39240a..60ffe3f80c59 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -4,6 +4,7 @@
>   */
>  #include "xe_lrc.h"
>  
> +#include "regs/xe_engine_regs.h"
>  #include "xe_bo.h"
>  #include "xe_device.h"
>  #include "xe_engine_types.h"
> @@ -12,7 +13,6 @@
>  #include "xe_map.h"
>  #include "xe_vm.h"
>  
> -#include "gt/intel_engine_regs.h"
>  #include "gt/intel_gpu_commands.h"
>  #include "gt/intel_gt_regs.h"
>  #include "gt/intel_lrc_reg.h"
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index 57788afe206e..892008dcbaf4 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -7,13 +7,13 @@
>  #include <drm/drm_managed.h>
>  #include <drm/xe_drm.h>
>  
> +#include "regs/xe_engine_regs.h"
>  #include "xe_device.h"
>  #include "xe_gt.h"
>  #include "xe_gt_mcr.h"
>  #include "xe_macros.h"
>  #include "xe_module.h"
>  
> -#include "gt/intel_engine_regs.h"
>  #include "gt/intel_gt_regs.h"
>  #include "i915_reg.h"
>  
> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
> index dc96d0e48688..bd3b64ad9c26 100644
> --- a/drivers/gpu/drm/xe/xe_reg_sr.c
> +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
> @@ -11,6 +11,7 @@
>  #include <drm/drm_managed.h>
>  #include <drm/drm_print.h>
>  
> +#include "regs/xe_engine_regs.h"
>  #include "xe_device_types.h"
>  #include "xe_force_wake.h"
>  #include "xe_gt.h"
> @@ -19,7 +20,6 @@
>  #include "xe_mmio.h"
>  #include "xe_rtp_types.h"
>  
> -#include "gt/intel_engine_regs.h"
>  #include "gt/intel_gt_regs.h"
>  
>  #define XE_REG_SR_GROW_STEP_DEFAULT	16
> diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
> index 3951460307e2..e2f3f374b856 100644
> --- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
> +++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
> @@ -4,11 +4,11 @@
>   */
>  #include "xe_reg_whitelist.h"
>  
> +#include "regs/xe_engine_regs.h"
>  #include "xe_gt_types.h"
>  #include "xe_platform_types.h"
>  #include "xe_rtp.h"
>  
> -#include "gt/intel_engine_regs.h"
>  #include "gt/intel_gt_regs.h"
>  
>  #undef _MMIO
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 9d2e4555091c..92065341c001 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -7,6 +7,7 @@
>  
>  #include <linux/compiler_types.h>
>  
> +#include "regs/xe_engine_regs.h"
>  #include "xe_device_types.h"
>  #include "xe_force_wake.h"
>  #include "xe_gt.h"
> @@ -16,7 +17,6 @@
>  #include "xe_rtp.h"
>  #include "xe_step.h"
>  
> -#include "gt/intel_engine_regs.h"
>  #include "gt/intel_gt_regs.h"
>  #include "i915_reg.h"
>  
> -- 
> 2.39.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
