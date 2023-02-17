Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE09AC636D6
	for <intel-xe@archiver.kernel.org>; Fri, 17 Feb 2023 22:08:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A54FF10E46B;
	Fri, 17 Feb 2023 22:08:49 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7D5510E46B
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Feb 2023 22:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676671728; x=1708207728;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=7NnWsCgeHmmXr30zHazWcm8uERnfSam/N+suurMTrE8=;
 b=DyMXv9XnxgoOeiTmlaBM+TKW5TtkTfNYjgn+mcQJ8Vr3qeHyOg5/BlDO
 FJqJ1VV9h5MpKq7T7gnpUOEGjcYlDpNzidLiuMSP5uZRWPceTbME6OMGY
 DGRkcLbjPswT5Bq6vStX8Eg88I80n58sZoTlbRbiT4wgPP15GWLRgLe2t
 l5AZeNH7hZ4I47si8IgrKofpzLCdzXZkkv+M3/fNHtApvOEx3K5xPAAAy
 rvAqNfyIiGX35oLSSj8nmAhDpqnDArgEl1Y5zuGx9fMk/1LjVWrxrrVDB
 ZdnAei9c3F/Cd3+4fkY4WzzdqUJBnOUJZXXNNl6kaKpmA5atUM/k9nw4z A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="334297706"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; d="scan'208";a="334297706"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2023 14:08:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="844715023"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; d="scan'208";a="844715023"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga005.jf.intel.com with ESMTP; 17 Feb 2023 14:08:38 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 17 Feb 2023 14:08:35 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 17 Feb 2023 14:08:35 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 17 Feb 2023 14:08:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EI079+fhjNGkdoeHXyV+5BZRRgvMumhynh9gy5sYJ9Xp4mr3utgKZmisygx6rmmlVP1VMDIyGwKaheOk3q1SYqc7gtQFHb5o7KhEvLQB4LwnLIQ0TkCmuo2OKz1OxSzzji114Kxi1NW4SN1y3LmimD5tl5EN9ixWBeKnEKRaH+O+8yKvQnrtXkn8DPUXkRdzXQk5MvPy5LwiOl4r1syKgo7QZNLLrg/gt6dV2j4bGPNcU+m2/nEW5jKyOnNkNDRRzLXQdMfHzFzgW2pFj22qdSFs1QDUl7Di6LmXrcSlDk+ZjMDruuSo5WPnQ86tfhKiHINZ1yfIoyQvN7UHDS5xoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X4ji2TvPz8iD1ijgnrQbRrSF8L2eqN8Farmzd4z9ZUA=;
 b=hA7ZqtxCzc83V2xcFoLlXiUUcYZzBXyWzf9VpT8yDKMMy3vq2WrLVnJpYsVNJI9FycU3GsiffjbH9+HhEQZ5A4/JA3xlt2v48gLlj2P0SCPqOf8Kink+sX3EGgICT3C6Sy0j6xge567R9ZlZ8EweyVk4uVEYc3kzqX7eREYGfN1u6njv9AQGAr5fE+tKh8V22nlD0w2ULNOsELHczahzktzl7+JLAznIysBMFQecX2DcMITbCzelniQfo4sQLVHWI6926RN/rjPwSaYKD3bPkwslCDt9Yg4YogrDcEZbltMPsbv5sFRq6aY/EfN/Q2YE25FhQZcH3tVf75O3gsGyXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BL1PR11MB5980.namprd11.prod.outlook.com (2603:10b6:208:387::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Fri, 17 Feb
 2023 22:08:32 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8%5]) with mapi id 15.20.6111.013; Fri, 17 Feb 2023
 22:08:31 +0000
Date: Fri, 17 Feb 2023 14:08:28 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <20230217220828.ktc62f7aab7mj4y7@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230217005226.106499-1-lucas.demarchi@intel.com>
 <20230217005226.106499-6-lucas.demarchi@intel.com>
 <Y+/hlh2LU0o8DMJs@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y+/hlh2LU0o8DMJs@intel.com>
X-ClientProxiedBy: BYAPR21CA0029.namprd21.prod.outlook.com
 (2603:10b6:a03:114::39) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BL1PR11MB5980:EE_
X-MS-Office365-Filtering-Correlation-Id: b134aff1-8e4c-4743-25a2-08db11338165
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9ames86rivlyBJel3Vz6SzZ9eDtaiwLTFoQNdsYkX2QDv/GulwpXGgfSg7ZQFuAXlqukD+XQQl7GsFQ4tj+e5IHsKzPlN+k+eG8mUBkvx7aZbX3wLKAb6IwPS50eZZQNufa+Bzl2ZAF5mE04N9FtUEHQLvfLNXuPRvdnuSZH+uviSF6+QsXDMvKSXPOfCIimIjY9ZlG2s35EX0SUmHoIqrn3C7hUnjiLII2BK31Sc7f79KTLO68gXWH/AdkXXOwsUeEFIxObWeyzKJcimVSXoeCZJSJnisi2OXmFm8Eyh2U3yHDeQlCU6tb7nYTbF0YN/E6qCjHNgJw84/yYHNXJBGlJv3wXyTl2SrhoyFvQp2edFHxriA0JEPPfoQp5QTNGtKTPmcvsT+ArlplPKStadCPusbpzntcjDqIaXjDN6D7Vr6sqW/NyTOJpPZ4tmixkHPDSyG11uM+TjMLdYHVBuEBH/FIop+E13x4awvQ68q5z+AoJbQS21qila0dMqhlEFkXnyZ6CNB5rwkE4ALaktepGsmNf8dRc+WJrcAHqHN4mtkTvGzxoTa+7Tlk08iDtRwPVOjZNTvMo2TCPk7eM+SdgIspA6xaOvwTwKWRUmmR20bCwJlU80+qbEcLyOs0A
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(346002)(396003)(136003)(39860400002)(376002)(451199018)(6636002)(316002)(478600001)(82960400001)(6486002)(54906003)(86362001)(38100700002)(36756003)(107886003)(83380400001)(1076003)(6666004)(186003)(9686003)(6506007)(26005)(6512007)(6862004)(41300700001)(2906002)(5660300002)(4326008)(8936002)(66946007)(66556008)(66476007)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?WBiYcDz3LRtRXUeFIUG8qW9CEGyGF4Bc9bA+c81optGNds/T721jjftT/j?=
 =?iso-8859-1?Q?2VHOz5AOLuLHk9/OHm6+dvJ9oBwB4Mtc1On7LIfJYewviCpcFAu7QuZNgR?=
 =?iso-8859-1?Q?xmgJvaPSyLYlqioArQtsEImJTPwNO4Hz0Zv2EU6Dl8+kh5gJTluT7/Nmhm?=
 =?iso-8859-1?Q?Y1LFZhyKA7olUOf9vJ99qfmV90O2c+xBGDsVga7xcADMswRmLDAAHx+QzH?=
 =?iso-8859-1?Q?UEE71E1t5AJN/zp12gnE4N0XP4/V6/NclPiCUpjkDZEQ4IoqmlgOnWUm/o?=
 =?iso-8859-1?Q?mElGc+Nl6mvNZqvXVqj/oePWse0+Sc9lhdQ6+dhaF3F6fbar0U9OstFwLZ?=
 =?iso-8859-1?Q?1TNQKQ3m9KyFl+gtQSiyVxBsHSOzrtQnuGE6mXX87q3Qzpfy+2EfJJWayy?=
 =?iso-8859-1?Q?QR862YjZ/Ti8cLEDXYZE2QYEluj32fc/E+L7UY9l8FCWplGZ3p/+HcBr3U?=
 =?iso-8859-1?Q?3Phwd2A89E66JKICL/O3CTH1QUdmKrixzsmzk9e22m8mocuaPdCAd6hIqX?=
 =?iso-8859-1?Q?pMkCoCG8dh+/O/e0fF14c1ISqwwYaNb3EfFgF6Ol+Q2iHqD8TxQntd2uTE?=
 =?iso-8859-1?Q?K03+Btw4b/AiX/R3ilG3cmVpi/7ae35rQbeO6c3uG6uuGPlNYpIDIDE+Nk?=
 =?iso-8859-1?Q?QM6pdiUpl4jIEoEcKUAujEUzX6N3YKn7Z51QKyFX4NLdngXgDy6Ip6Asd9?=
 =?iso-8859-1?Q?IizF/QiwfnF6dqksfBnRC2tTl47KYNLyQG2dQKAKfycB1EwgXq5rIEjoQW?=
 =?iso-8859-1?Q?oq+WtluX8kWfE1vOcAhDLtn+8JCEX7+WKDgcF03VYCMLE6mUnVu/49eshx?=
 =?iso-8859-1?Q?XTEwV76UGB6XCjKZdL/xUEiAg+gPxrTLMRrkHrI6jl26aWFC1Ukawf7PBn?=
 =?iso-8859-1?Q?gIhrBOlVtqjD7+aKE3290riSpF+bUOOabHXInAFwUKZEk8rbPQEya7eL7t?=
 =?iso-8859-1?Q?KIm+rIYgPI5uQXQLlHXczNxV463m+98Hk/s86c1EOlkYhZ0O6pyGxxOL+A?=
 =?iso-8859-1?Q?MpEv7wbAryGYaRuAaJUzXmyNlF42hBy3YalO75R7acHiaFY2IKxHfw0nhW?=
 =?iso-8859-1?Q?n365OABAxTYvLrYl+QMWMCRCuFv/htU4Bzlt68+FI5gtdx7/HxdTgZrKwQ?=
 =?iso-8859-1?Q?4UuoiSSNZxGThe2Lrt0ZfFg5CmZ3hwcM5bGLbZDNr6LpPCLAglfM3lG0oc?=
 =?iso-8859-1?Q?hN9X7oD/HXxC7H7dhvHwxGcSFJK8MXee+CGosqhqwyhGvjS8Qi7cMjFb67?=
 =?iso-8859-1?Q?Pm0YI2aC5lT2BREIFWjOUyRUzI+Ej66NKYH0+4G3M3d4S2e73NdpTz489S?=
 =?iso-8859-1?Q?pXmjlETp6vkIexRVTCNTa/wCds2rwaIBhAArwCLxg8+gLriwp0H6bfUTp+?=
 =?iso-8859-1?Q?fSXaI9b25pC1JNgZMtEbaLKEs4lliUc36Qpb6GTw+lWJ08PMvAbd5m55qR?=
 =?iso-8859-1?Q?hywO8CrKo6efDL/zxhVob66i9bJLg3eGed25TkBdyQozkEGfzTo5mBScwK?=
 =?iso-8859-1?Q?0miHdeAb2KBZ5WoLQYqhNnpFZ+v0zoII6IHedKPIc+LZ+2iOkxwHNdM8SJ?=
 =?iso-8859-1?Q?1GzAG9KLZ65vW9AJtyIZd3fwjDlLdEQhNheubjXdmhGjSrILEzWbArlGZF?=
 =?iso-8859-1?Q?9LvE7tp4OQrWYLHSqL5/IvEJ+QtmegQrlysMoAuMvKGEkVS3hAY+HIDA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b134aff1-8e4c-4743-25a2-08db11338165
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2023 22:08:31.7295 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yh76ACiJKSl1srD3dWhTPjP1ayQbrAaSLMmYmc9o7/IWw6dSN1644ftPuTkn5Cb7pSWPL36BGDRzti/f+2hJ8YDXcu/lsdXmSrTe7giDcic=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5980
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 05/11] drm/xe: Remove dependency on
 intel_gt_regs.h
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

On Fri, Feb 17, 2023 at 03:20:38PM -0500, Rodrigo Vivi wrote:
>On Thu, Feb 16, 2023 at 04:52:20PM -0800, Lucas De Marchi wrote:
>> Create regs/xe_gt_regs.h file with all the registers and bit
>> definitions used by the xe driver. Eventually the registers may be
>> defined in a different way and since xe doesn't supported below gen12,
>> the number of registers touched is much smaller, so create a new header.
>>
>> The definitions themselves are direct copy from the
>> gt/intel_gt_regs.h file, just sorting the registers by address.
>> Cleaning those up and adhering to a common coding style is left for
>> later.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/i915/i915_reg_defs.h  |   2 +
>>  drivers/gpu/drm/xe/regs/xe_gt_regs.h  | 287 ++++++++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_execlist.c      |   2 +-
>>  drivers/gpu/drm/xe/xe_force_wake.c    |   3 +-
>>  drivers/gpu/drm/xe/xe_ggtt.c          |   2 +-
>>  drivers/gpu/drm/xe/xe_gt.c            |   3 +-
>>  drivers/gpu/drm/xe/xe_gt_clock.c      |   2 +-
>>  drivers/gpu/drm/xe/xe_gt_mcr.c        |   3 +-
>>  drivers/gpu/drm/xe/xe_guc.c           |   2 +-
>>  drivers/gpu/drm/xe/xe_guc_ads.c       |   4 +-
>>  drivers/gpu/drm/xe/xe_guc_pc.c        |   2 +-
>>  drivers/gpu/drm/xe/xe_hw_engine.c     |   2 +-
>>  drivers/gpu/drm/xe/xe_irq.c           |   2 +-
>>  drivers/gpu/drm/xe/xe_lrc.c           |   2 +-
>>  drivers/gpu/drm/xe/xe_mmio.c          |   2 +-
>>  drivers/gpu/drm/xe/xe_mocs.c          |   3 +-
>>  drivers/gpu/drm/xe/xe_reg_sr.c        |   3 +-
>>  drivers/gpu/drm/xe/xe_reg_whitelist.c |   3 +-
>>  drivers/gpu/drm/xe/xe_ring_ops.c      |   2 +-
>>  drivers/gpu/drm/xe/xe_tuning.c        |   3 +-
>>  drivers/gpu/drm/xe/xe_wa.c            |   2 +-
>>  21 files changed, 308 insertions(+), 28 deletions(-)
>>  create mode 100644 drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>
>> diff --git a/drivers/gpu/drm/i915/i915_reg_defs.h b/drivers/gpu/drm/i915/i915_reg_defs.h
>> index b5e06b6a9478..a6080c983a77 100644
>> --- a/drivers/gpu/drm/i915/i915_reg_defs.h
>> +++ b/drivers/gpu/drm/i915/i915_reg_defs.h
>> @@ -136,6 +136,8 @@ typedef struct {
>>  	u32 reg;
>>  } i915_mcr_reg_t;
>>
>> +#define MCR_REG(offset)	((const i915_mcr_reg_t){ .reg = (offset) })
>> +
>>  #define INVALID_MMIO_REG _MMIO(0)
>>
>>  /*
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> new file mode 100644
>> index 000000000000..da40133252fb
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> @@ -0,0 +1,287 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_GT_REGS_H_
>> +#define _XE_GT_REGS_H_
>> +
>> +#include "i915_reg_defs.h"
>> +
>> +/* RPM unit config (Gen8+) */
>> +#define RPM_CONFIG0				_MMIO(0xd00)
>> +#define   GEN11_RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_SHIFT	3
>
>https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/215
>https://lore.kernel.org/all/Y9hw0sSC58B32yPg@mdroper-desk1.amr.corp.intel.com/
>
>Matt has asked us to get rid of the GEN stuff...
>I believe this is a great opportunity, although I believe it is not
>a blocker and could be done later.

I have that issue assigned to me so I don't forget. However I'd separate
the rather manual movement here from any cleanup. It's too easy to land
regressions because of a typo while converting coding style together
with a big code move like this. From the commit message:

	The definitions themselves are direct copy from the
	gt/intel_gt_regs.h file, just sorting the registers by address.
	Cleaning those up and adhering to a common coding style is left for
	later.

  
thanks
Lucas De Marchi
