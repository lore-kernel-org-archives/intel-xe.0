Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1672C001E0
	for <intel-xe@archiver.kernel.org>; Tue,  8 Aug 2023 21:46:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89B1510E054;
	Tue,  8 Aug 2023 21:46:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB5A610E054
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Aug 2023 21:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691531204; x=1723067204;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=0l/TJukC8XfqN4V+k370XTKh7FNJWXoA378pI2500wg=;
 b=ds5IUg7zF3J/g5loFXzrY++q4k6C9Pvbc7o4ieh9AES4+hgceW0qxL0P
 1kbHedxuag51pD2E32QvdWErChoNUeI2VlfyEXUhW/LTCNCQJ1Rk8eP6h
 CHlsmiYY5jQVEyTrsvAT5JPm4YMIDvvRop6ZRNlE2szJXsVK3ij/BV4A8
 il3FK+rruev1SSmz9i6URahx8W3UWy0WYv6x6UngLCF5blrsJIUMk9wjM
 eUbZu30Zj8ZMEvf9r4r3ynmV+TiaarzpP9uzWb6jnmdhFSeofRB/SyTJj
 pyY4LBBJ9e8iRgv7Q3ybGeMhG8GWgGfKI2YPwIjKr6jnlUEDf8/Cf5aMI w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="434841133"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; d="scan'208";a="434841133"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 14:46:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="725114054"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; d="scan'208";a="725114054"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga007.jf.intel.com with ESMTP; 08 Aug 2023 14:46:39 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 8 Aug 2023 14:46:39 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 8 Aug 2023 14:46:39 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 8 Aug 2023 14:46:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rr1ilGZvImQavJKEqmnAy8ndtUbwQMRmC/knTDIZUADVxXHkDxUDTfunwWpf4g1gyABtWakGIrTYRIXP72QjmtPJtgoPAlOGbhi7YionttMF4mJPZEIn3uj0EpV48f8cStcYFALwh2iHTUMJL6V170fUx4qvp50BeflVzMUmqm/N/i+8P9QbHuTuUzegxzMsum3EadBPnnndOpZnBE4+iE6tZgfAx34mhOpz8DYK45JztbtH9ocgM9A0rwq2GIBUReO6iAPASLk4lBRiP7/SpASVwlPrMoba6Fg9o8ezUZvlV8DWqMO5YGHiYjK5O41qVs+quCEsj1kBTrrCqCO4jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y83NTeck+i+cYUU1VzC3G+3QVs6iwdlPHnCrwiK3tLk=;
 b=BiPvaGJMnlgo7HCeADWfou13xVKN4LNJ5vJj1+4Au++WteRibCSyNXapPdMTZbqUsjo24S5LuPBGTTK7YN7vKYDcp16sgKnc91h3che1fHYvEdUZOwl+6nP826DWriUz5Ld/bsCDOALQQ6sZqRKk6rGQWE5HDNGvD/RIr6PYqme+NsLhMNOk6kh8DvTJ+8/gRTov+jJo6kXEBXoPyyezeV/h7AROQfUs9Pcnt8odFkahOGPH4+N8u/xj66+iLtiLVNuG6HYFjzmS8qJHhcr4HVdwxVG7aFeEc9R0B5DWqUr29FKYwQDbGasFvOIBeeN9KT8yjipeJi4EXer1zdda3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA0PR11MB7837.namprd11.prod.outlook.com (2603:10b6:208:406::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 21:46:37 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79%4]) with mapi id 15.20.6652.026; Tue, 8 Aug 2023
 21:46:37 +0000
Date: Tue, 8 Aug 2023 15:46:34 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <j54sygdcoyhp2ojvwq3xcuqsf5523r7uccwgeuhxs4twxeaqb3@73f43tiexsvv>
References: <20230807173446.2039-1-michal.wajdeczko@intel.com>
 <vrhcmrdcsrd4pw4mgwcrbrmdinoh2ce3uu7ebrabpqcc7kjjll@2aor4ajoytf4>
 <87y1ilshhn.fsf@intel.com>
 <uc5h46hdu34kr5yrng7jpn4o5fobs5z5ttkfqshqzqg3i4lyfc@ecqj62tyqw5o>
 <39ed0d5d-c3f2-f0aa-47c9-ff244965ac68@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <39ed0d5d-c3f2-f0aa-47c9-ff244965ac68@intel.com>
X-ClientProxiedBy: MW3PR05CA0004.namprd05.prod.outlook.com
 (2603:10b6:303:2b::9) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA0PR11MB7837:EE_
X-MS-Office365-Filtering-Correlation-Id: 6297d48b-8ff0-4d5c-e66b-08db9858f0da
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aCoJOfk3BtbirnoqT54c3DOXfA/b7eZzwM6DaWmEBWLTTJXnB3vPAfTB+0xzpFNzjcbpIZClpLxQsyGZnj81hCyD0gRAUERS5WDHADeH7lUdXmVD0Kq+Ib49rkrMH/izmUZbqR3ZLmNb+EJCv8QIbmASOfKRXcDMo/OuPEM1QVBypRxjalGSfa4B9pdb6j1I7mq8P96MH2bNi+n5F+RlOgmxbzRKMRbzM1A9leDnfpfeyIJCBFLx24Rky17Dn8u0St8Q+lwHZEWAD88UWCAFsgNc/SHkgIodYUYDk0J3MwA1a1x32QR4vjnCJhD4cRrtJuJ80IzHrASdHLHdMtAAiUTlq/VMkmlGRm0JbXodOU+arw7sKh4kBHaZKIKRKX4JaJZg76vklYF8IrELRFS1qHWNmdxyagHF/OemXzHvTshpq9B8uNfcwBsZTlrl+5IvxeDvaoWYMHGdIlrRTpLt1u9KjHjHG0sxVojLyVJ62Sb7pUs5DHHT7RXE6Zzx+b5he+n6cz7xgPeezkKnJ4bm17cKeJqfbEp7hg5Pfm4+DHc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(346002)(366004)(136003)(39860400002)(396003)(376002)(1800799003)(451199021)(186006)(83380400001)(2906002)(5660300002)(54906003)(6666004)(6486002)(66556008)(66946007)(66476007)(6512007)(9686003)(82960400001)(4326008)(6636002)(33716001)(316002)(41300700001)(38100700002)(86362001)(107886003)(6862004)(8676002)(8936002)(26005)(6506007)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?4d/7Ty2lec8GqQldiackrD0BX1JMZl1zeFAemdkDtjJHBWiylhms9Dbw5Z?=
 =?iso-8859-1?Q?dia4dYUNp4QBrqICLxKngVuK1dV+yZHhlnHz315ePoLXCWptzQ1Gww/FpO?=
 =?iso-8859-1?Q?0culKzwPN/5sXzIRmGrpU+QJ9TyZim/KTBjKjs5iMJG0EAOlG0PpwSJ8zJ?=
 =?iso-8859-1?Q?ZIZVL3EcqoM9qDYoUjC+l7SEvMz3EKDQXd9EACiRUEtJEAeyMnEalELBnT?=
 =?iso-8859-1?Q?mX8FH7RhUECcGpBFJyPKAPRczijY/jYvvHsQh7sKj8MvruSKX64yDXbSGQ?=
 =?iso-8859-1?Q?DCNXQSG7A2v1kBs2Nsgke3UEkajz8czNB0WAOP0tkldrcj8OUZVGDgy+a5?=
 =?iso-8859-1?Q?BH10q8mXyHJPqKf3BckgQf+RozkYVpdK6UJ5X+gNSccBCsS3OrSDsYsr/R?=
 =?iso-8859-1?Q?NjZ5Lc3nzN9qNPN5HG4qKMgnzitKYADjaAR7stu6ppFocyzuRaQaF2h/3X?=
 =?iso-8859-1?Q?R3Q2E57+FUDD25cwd31HJ1d5rCmpi2uzGkB3gsMw/OjpQe1b2PaWrnOr2I?=
 =?iso-8859-1?Q?q5hyJWwMP0rphL9jv9KQtYqd2ZbEDkt4rwegsP/toAc02y3LrILvjCRyRR?=
 =?iso-8859-1?Q?rYa7Hz+LvT1o+Crw3MdatboLzeUgZPAd1rbCjjcjqRajlcxvuOl8cyWq+m?=
 =?iso-8859-1?Q?K5/pkKy+BTkmlPCmaE2BeHET2tJvLlJvaHc9fVs38ygyeN9cHe2gutqNb0?=
 =?iso-8859-1?Q?5KYBfdzIuE076b43Stztlbm4f+ar1tuBHenxBx4BKVK/e62Tajb0X8TdMv?=
 =?iso-8859-1?Q?nhk+GcCdOsw0ZxDIP0XMeL3EhfwTMMKHINSGfDHEdbnv3j3Amrg6B6P4RE?=
 =?iso-8859-1?Q?4YJHjJyljYJJitYcAOGw3SXwa827g0vGetrY3AVF+MlTgzn0g35QXwW6vh?=
 =?iso-8859-1?Q?IaKPopBNbWEkhj41WoOGdQ4EjUnDtxl8GRgNBRwQz8GUv/X2nLHHbOPSRt?=
 =?iso-8859-1?Q?+NPUVWm8uE4aCc4DTDhOYfZGUolIuvj1RWFpJpjX4Qz02U6n1QLd+zh7ha?=
 =?iso-8859-1?Q?bf+XDmais6SANQZRrbQD5s1lh7UJW+m9lV98IRHs53lxPI9ykNHVzoICkz?=
 =?iso-8859-1?Q?OpmNNL4PFxdir0b8gwv0Yxt9JmqT+w8/4vGY23T/9dsHLDJUR/pPy2vY+j?=
 =?iso-8859-1?Q?cRPnYf8+DK2DCS3ETqYpmm6+5xU69u9Nmtc/RFlgLd0MuzAWN8du6jYCqN?=
 =?iso-8859-1?Q?EbHPMJGAFQAai8PD5qqIFMS+A7dQYwCbwACUhV8Jd7fEIuaGwygpdsqlQs?=
 =?iso-8859-1?Q?tX44oioDIxMsg84uGNwmnmoCYxt6Je0FoOH3FYiVJkZX63oMLhM8M12XZ6?=
 =?iso-8859-1?Q?7XVyl+kwllDoBfr6ZHsZcZyx4FB0cFVvcQkkiIXD9sZ5u56mxBanq7Xg3v?=
 =?iso-8859-1?Q?Mg4Q+RrLdPvLWKIrfLRWCTFT2bESoJntTKaDrc/by6B0NyoCJU0Z3Dw1Mb?=
 =?iso-8859-1?Q?9fKhMv0uA/9KoySS5JSl3AglVp5iWHAR4YXezLBVf9Chv85Zbs1KI5Lt3F?=
 =?iso-8859-1?Q?N8oCFSsHvA5odh3JU/nVPaucqXXkocuur9UF11M6j899obgARdHVkedUJ0?=
 =?iso-8859-1?Q?v7F4ZjGhfJZToohj0AN1qZwIyKdEotPfWrVYEItQ0VY+LkYFazhg5jxcEt?=
 =?iso-8859-1?Q?wGYEqYJJs+OJqTbeS8lUwiY1WU9+hmcqqOnkD+GW77eBySow5/FxXwNg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6297d48b-8ff0-4d5c-e66b-08db9858f0da
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 21:46:37.1319 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sZVnSw2p7d9qUA/lzL9vKiBDKCuVDKmt7zAR4je5OPLp+kURr+Q98e1eeUKj5o+TyLa0mjLGbhzcmyvKG18epEpUDIkSG+rXbn4ql0IMypc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7837
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Introduce xe_ASSERT macros
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
Cc: Jani Nikula <jani.nikula@intel.com>, intel-xe@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Aug 08, 2023 at 08:37:52PM +0200, Michal Wajdeczko wrote:
>
>
>On 08.08.2023 18:28, Lucas De Marchi wrote:
>> On Tue, Aug 08, 2023 at 06:04:20PM +0300, Jani Nikula wrote:
>>> On Tue, 08 Aug 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>>>> On Mon, Aug 07, 2023 at 07:34:46PM +0200, Michal Wajdeczko wrote:
>>>>> As we are moving away from the controversial XE_BUG_ON macro,
>>>>> relying just on WARN_ON or drm_err does not cover the cases
>>>>> where we want to annotate functions with additional detailed
>>>>> debug checks to assert that all prerequisites are satisfied,
>>>>> without paying footprint or performance penalty on non-debug
>>>>> builds, where all misuses introduced during code integration
>>>>> were already fixed.
>>>>>
>>>>> Introduce family of xe_ASSERT macros that try to follow classic
>>>>> assert() utility and can be compiled out on non-debug builds.
>>>>>
>>>>> Macros are based on drm_WARN, but unlikely to origin, disallow
>>>>> use in expressions since we will compile that code out.
>>>>>
>>>>> As we are operating on the xe pointers, we can print additional
>>>>> information about the device, like tile or GT identifier, that
>>>>> is not available from generic WARN report:
>>>>>
>>>>> [ ] xe 0000:00:02.0: [drm] Assertion `true == false` failed!
>>>>>    platform: 1 subplatform: 1
>>>>>    graphics: Xe_LP 12.0 step B0
>>>>>    media: Xe_M 12.0 step B0
>>>>>    display: enabled step D0
>>>>>    tile: 0 VRAM 0 B
>>>>>    GT: 0 type 1
>>>>>
>>>>> [ ] xe 0000:b3:00.0: [drm] Assertion `true == false` failed!
>>>>>    platform: 7 subplatform: 3
>>>>>    graphics: Xe_HPG 12.55 step A1
>>>>>    media: Xe_HPM 12.55 step A1
>>>>>    display: disabled step **
>>>>>    tile: 0 VRAM 14.0 GiB
>>>>>    GT: 0 type 1
>>>>>
>>>>> [ ] WARNING: CPU: 0 PID: 2687 at drivers/gpu/drm/xe/xe_device.c:281
>>>>> xe_device_probe+0x374/0x520 [xe]
>>>>> [ ] RIP: 0010:xe_device_probe+0x374/0x520 [xe]
>>>>> [ ] Call Trace:
>>>>> [ ]  ? __warn+0x7b/0x160
>>>>> [ ]  ? xe_device_probe+0x374/0x520 [xe]
>>>>> [ ]  ? report_bug+0x1c3/0x1d0
>>>>> [ ]  ? handle_bug+0x42/0x70
>>>>> [ ]  ? exc_invalid_op+0x14/0x70
>>>>> [ ]  ? asm_exc_invalid_op+0x16/0x20
>>>>> [ ]  ? xe_device_probe+0x374/0x520 [xe]
>>>>> [ ]  ? xe_device_probe+0x374/0x520 [xe]
>>>>> [ ]  xe_pci_probe+0x6e3/0x950 [xe]
>>>>> [ ]  ? lockdep_hardirqs_on+0xc7/0x140
>>>>> [ ]  pci_device_probe+0x9e/0x160
>>>>> [ ]  really_probe+0x19d/0x400
>>>>>
>>>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>>> Cc: Oded Gabbay <ogabbay@kernel.org>
>>>>> Cc: Jani Nikula <jani.nikula@intel.com>
>>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>>> ---
>>>>> drivers/gpu/drm/xe/xe_assert.h | 160 +++++++++++++++++++++++++++++++++
>>>>> 1 file changed, 160 insertions(+)
>>>>> create mode 100644 drivers/gpu/drm/xe/xe_assert.h
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_assert.h
>>>>> b/drivers/gpu/drm/xe/xe_assert.h
>>>>> new file mode 100644
>>>>> index 000000000000..7ea295b7091c
>>>>> --- /dev/null
>>>>> +++ b/drivers/gpu/drm/xe/xe_assert.h
>>>>> @@ -0,0 +1,160 @@
>>>>> +/* SPDX-License-Identifier: MIT */
>>>>> +/*
>>>>> + * Copyright © 2023 Intel Corporation
>>>>> + */
>>>>> +
>>>>> +#ifndef __XE_ASSERT_H__
>>>>> +#define __XE_ASSERT_H__
>>>>> +
>>>>> +#include <linux/string_helpers.h>
>>>>> +#include <drm/drm_print.h>
>>>>> +#include "xe_device_types.h"
>>>>> +#include "xe_step.h"
>>>>> +
>>>>> +/**
>>>>> + * DOC: Xe ASSERTs
>>>>> + *
>>>>> + * While Xe driver aims to be simpler than legacy i915 driver it is
>>>>> still
>>>>> + * complex enough that some changes introduced while adding new
>>>>> functionality
>>>>> + * could break the existing code.
>>>>> + *
>>>>> + * Adding &drm_WARN or &drm_err to catch unwanted programming usage
>>>>> could lead
>>>>> + * to undesired increased driver footprint and may impact
>>>>> production driver
>>>>> + * performance as this additional code will be always present.
>>>>> + *
>>>>> + * To allow annotate functions with additional detailed debug
>>>>> checks to assert
>>>>> + * that all prerequisites are satisfied, without worrying about
>>>>> footprint or
>>>>> + * performance penalty on production builds where all potential
>>>>> misuses
>>>>> + * introduced during code integration were already fixed, we
>>>>> introduce family
>>>>> + * of ASSERT macros that try to follow classic assert() utility and
>>>>> can be
>>>>> + * compiled out on non-debug builds:
>>>>> + *
>>>>> + *  * &xe_ASSERT
>>>>
>>>> pass by comment, not really checking anything else here... Why are we
>>>> mixing upper/lower case? It's perfectly fine to use XE_ as the namespace
>>>> like is done for other macros.
>
>note that while this functionality is implemented as a macro, due to
>necessary inside magic to obtain file/line, from the usage POV it tries
>to mimic inline function, so using all upper case, as for simple value
>macro, seems incorrect
>
>>>
>>> I think it comes from drm_WARN,
>
>yes, it was following drm_WARN() name pattern (and it uses WARN inside)
>
>>> but yeah, could be XE_ASSERT.
>
>quote from [1] "It's a matter of taste, but the SHOUTING UPPERCASE has
>been argued to be less readable than lowercase."
>
>so if you really don't want to mix cases then maybe it should be all
>lower case:
>
> - xe_assert()
> - xe_tile_assert()
> - xe_gt_assert()

these look fine

>
>[1]
>https://cgit.freedesktop.org/drm/drm-tip/commit/include/drm/drm_print.h?id=fb6c7ab8718eb2543695d77ad8302ff81e8e1e32
>
>>
>> yeah... I think copying that would be like perpetuating a mistake.
>
>not sure if that was a mistake, rather nice try to avoid clash with
>drm_warn() that was providing different functionality

then I'd say it's a double mistake... how am I supposed to know what to
use wrt drm_warn() vs drm_WARN()?

>
>but since there is no global ASSERT that we follow, we can name it all
>lowercase like e.g. lockdep_assert_held()

sounds good to me

Lucas De Marchi

>
>Michal
>
>>
>> Lucas De Marchi
>>
>>>
>>>>
>>>> Lucas De Marchi
>>>
>>> -- 
>>> Jani Nikula, Intel Open Source Graphics Center
