Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D775FC6FA8E
	for <intel-xe@archiver.kernel.org>; Fri, 24 Feb 2023 18:05:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8FAF10E256;
	Fri, 24 Feb 2023 18:05:29 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76FA410E256
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Feb 2023 18:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677261927; x=1708797927;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=kpEbDMEsXHfV2lJGPTQs3dFmYkbfFFVgRIuDusoUE/w=;
 b=U0o5wrqoQRW7xTRwmTiqfWP4b/BAqSJ2sxP8iSnk3NEz0UVV+cnmkhS4
 GVGdgJcwk4lBQZQIjFE+UOEgQ4s++reRPvCZdbXldSLshYTxUllIO1PdZ
 EOfJGVjjmwks75xudRT2+vmQ1a4ZgYVjgztq45svVrk/mOqvdIhM10Byj
 5rZIQmjoy37EziMsi34z8H7Kf67kpTv3zX8LrLWHF98yBqqtk+Xn2rzeY
 /VGN0Dx+FwGm596a6CyM/R+1I/Lw58qbs7Vu6y/SWLrJWbvaJRdzzenDz
 2bEYaa4wzc1vY/9qvJepJojYBh5YhLLgqkfXKDs720gfyE8DcI+DAzYeV w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="335776225"
X-IronPort-AV: E=Sophos;i="5.97,325,1669104000"; d="scan'208";a="335776225"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2023 10:05:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="847020701"
X-IronPort-AV: E=Sophos;i="5.97,325,1669104000"; d="scan'208";a="847020701"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP; 24 Feb 2023 10:05:07 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 24 Feb 2023 10:05:07 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 24 Feb 2023 10:05:07 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 24 Feb 2023 10:05:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KaBZmYLAP6KwHI/m6mwYqHRx6BZQz5QLeyg5HqsH761ibNFPDGOTemWiN6Lyg1kuzV88zYOCf9YBCxrWkQorIGyHupc+Z28kZnxDp+/tq/FxjszdPV8qifsw3FKkkA8YoytpSFfFLpcG2Qay7APPMySZvHaiHDyfew/PlwCJ04dHwdWnzONGxoFwcD3u6EFQNXIC1JYuPZLavbOCBPk97eWIj9BNHfz7NJwcQAaty/+HictqSBw+mC0EuPHFlPpK1IUg9E5xP6JdFbdnu0tKfMZCYJKXKmy0QjgK6bEQYmbaKcxlpGF9SV/GMSuV43Otnh5/Zjq+5q1DTueTlFUxxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H9UgoqQwEHHtuzFyi1SBRRNCc81YlDpaq9IqnUNLEwg=;
 b=jEsbJzJlswDsggQkxHjNZMoCYe/ZewK5VyvAC7G6xKMEOgHdeH3PmwyGQM5NwxkSUpWtspaSy5+DTEAqDvx7O2wfYxBS6MaZrv++f8U+ZajyyMnQisXygM7jet8VjnvHGQVQq/y/xYY0pdjCB5ekKjMA1AwM0OazhFXlVNCWDWtpZRgsRIOBgK1jEZ9sgYOTOPtiIMtY1p4rLyuIj3WwnNfxRG3yaVHr0+5P5atZ9ZBy743AqM4tu98aPtO6jQwycFIZqU1OCROR94oxEU+527FBg1L5xkUIyP4mrbf5QHZALUX0+vd6S1/fZGxKd/r9Ln0SQUvVqje4HWbVCuo7Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB7341.namprd11.prod.outlook.com (2603:10b6:208:426::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.24; Fri, 24 Feb
 2023 18:05:05 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8%5]) with mapi id 15.20.6134.024; Fri, 24 Feb 2023
 18:05:05 +0000
Date: Fri, 24 Feb 2023 10:05:02 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <20230224180502.pcbhbtdiztuwzc2l@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230217005226.106499-1-lucas.demarchi@intel.com>
 <20230217005226.106499-5-lucas.demarchi@intel.com>
 <Y/j7vnYTDUJZFttP@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y/j7vnYTDUJZFttP@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ0PR03CA0102.namprd03.prod.outlook.com
 (2603:10b6:a03:333::17) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB7341:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d93e348-a392-4823-1b58-08db1691a82a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B9Eqo/Gr/TVUYZwxmMzxC847ynMltLESsVp7Dzgs7163pvFFJtO7Q9V+eow9n0FUmmgAMdaM6G6lukZebMQktaBcldlnWvU/m50rfvHsl/lN7uo+ElnDsB43vt9c+IM+zSD/Z6cBUJBdUoRM3mHVrMdRP0320OrT5hv4x2kwyu8XPv/VhpNwVKEWWNZ98UIh/uI4GR+mCBwyJxHC44iVqyQZm9f2wENhTj0UoeEFpYexP957+wZrfQdPz9Z/LWH4KGilsLn8NqiCidc7nSZVdX/22AkRbyIG7dN1S28CurF/wz0xSaY1gm7T70y9Htj+gQa1SuV5wo4Ht5djBykDXyjVj9Cwatt6PP7y4ihS2ZxkfIhfq26msbdqa/T3JSuinHdc1O1IgDss6Q7p3Ce6m9NhsmPME9vnQFEvv9Jzv9HLSnJpJE1VJalGQ5PVX0qdAYx1kBDU02ZBrDyBTVXioGyhgnbFsK9rVKqpHZH0iLBY60mlb80ElFd4pXK+fAGEUQwpw0i4lEpSolWXneedVsfzphFrnti3qYr/s5WXRdwY3oeTbXRUDgkwIrKGOYZ/RW5AoRBJjL5+GG8DLLiq6FYZigEqR07DGYDaRf9KxEC7iz9OHvCCHKNuNpd445F568mtcQAi+NP7zF59zXqhWw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(136003)(376002)(396003)(39860400002)(366004)(451199018)(66946007)(54906003)(66556008)(66476007)(6636002)(83380400001)(8936002)(1076003)(316002)(5660300002)(8676002)(41300700001)(6512007)(6666004)(4326008)(107886003)(6506007)(6862004)(9686003)(26005)(478600001)(6486002)(186003)(36756003)(2906002)(38100700002)(82960400001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?slnu78TUQX7BHsdqG+S92tqOFxeg7Nc/fErf3tcotMeNqCf9Kqasm9UcBU?=
 =?iso-8859-1?Q?e0htx5WzPARPYJzO3sReGHkjEMj+Lkhn2sfe2R4hUNnVIeTlgH4bzzSxub?=
 =?iso-8859-1?Q?OR2yHDzO2jThP7MEbQNlTlnnOsGIQi+BxuDukbfgIwPmRDBgfYSzkZlh7Y?=
 =?iso-8859-1?Q?gFJobk7XBcfk7rx6itzgjEH6EusM/7dL7J/wLPiFERqmk5QAYP297rQHQN?=
 =?iso-8859-1?Q?1wgO3E0g94lxdf9LnXTgIkXS3r21gGIPMq1MJAb9mdguppahRr1+GwO65M?=
 =?iso-8859-1?Q?5yrCksvBNohHlbDR8LnpI3oP43oN4qw97yL3jYBpct74T+RzVkuF2h4MMr?=
 =?iso-8859-1?Q?QJjVO3X6gtAm7H1i7j/38UkHm04lDXAJt0UGhNA80YgUGKnIoYuArGEeju?=
 =?iso-8859-1?Q?4D1XprkmGeQYm5QBcSNj5Hi4yyCVa2OByLU7id7sLNzcf8nlW3bE5rMh/J?=
 =?iso-8859-1?Q?btEyfOU4byV+gMYHbSUj77a8rpqcavxx0X+XiXnCiXDxF4yZD7WxcjoNLA?=
 =?iso-8859-1?Q?t4XvOwNI4VZ8G2gsIOPe9cFsTy4mj9a1x/MYrvhPJMKbMUZCTNaMFG1h1s?=
 =?iso-8859-1?Q?l3Ox6LqTEXwOVF5KCVEUUT4uQkcYOOdNlUhsgtydHNhse5KyeyuAWZnVly?=
 =?iso-8859-1?Q?nIT9Mw+1eQPLucI+W5ao4JGn2rFvIWtd3d/X4cPQbi493ZGYYSR1z2SIV5?=
 =?iso-8859-1?Q?62GUwRm5qnXp0AKdVU8lMPCsW4Bn0kvEdub0hwEauhfv3SRoFdI/SpxE66?=
 =?iso-8859-1?Q?DQL0Ic9dwr3j0GVabK4OF/LVu6EBcgsML2BUZUO6bC91HHfoH8RWw72brQ?=
 =?iso-8859-1?Q?uo7SF1pglwmbNnJAQXUXiLzi3Uc0h1Bku/EoRJi5SQak8NcdNDcuDuZ7wj?=
 =?iso-8859-1?Q?+C1HQwmGe0cpQ3gbnPsjzWT5fPYAucuJe/oDH3mPKndJfWdbhHrUEHaF0t?=
 =?iso-8859-1?Q?urz0pHmPDt8Wr1DZxMYU/DTq/s7MWssySbM9Kb+Xx87wj+KIwtrykaaWtu?=
 =?iso-8859-1?Q?TxQYEuFgBWDcLMVby/BD45GSi9wlEiBADfl7VemBMJC6f84RmZaYks8gN5?=
 =?iso-8859-1?Q?hxB3L+EqfjTI6TQtvYdgVfXKy19wHjYhpj7DyV0J2/wLOqU/Ea7OynE9FD?=
 =?iso-8859-1?Q?GvbPdKjZWU9OsZLEMie+cFUlWX1EgHicpc2BXqtqGYf7ZIJo69XlF8JX84?=
 =?iso-8859-1?Q?gVKBkMy51BuCm0EvfPe4GFzLgbWIP0vHZdwg5/m4JZhSd0pL9/aNcO5zcn?=
 =?iso-8859-1?Q?fOYTxT0FZk/0KNMqMzXfF7ceRZU3SFf/OE2TaxXcPz+EmNuANF6C1AzxhI?=
 =?iso-8859-1?Q?3HZ/rOPdy9tYZ+W4EEeyfOGuQCvf+752nQPBAiM1YqqFaPbfKw+YScukFm?=
 =?iso-8859-1?Q?IDMSbAsdJ+y9Zm+SoOoHPGCqfUYtL+cSEHUtWlC7crHmDeoXyRxCwF9Ln9?=
 =?iso-8859-1?Q?NPqTYSnahR3B95ihRmxhHtEZ1t3nYaQcjFn89YQutbafYAcQghS6ky7J4U?=
 =?iso-8859-1?Q?lTi5QriTdcJd/L8BnULeLgrAtImOgkuZEnUf6uEZCCpce3q0FTfaXJD7En?=
 =?iso-8859-1?Q?5eKXtmUODa8iLmXoVDoDR1PrPPJNULnW+mMXN5/j9M9V/DhZ9uGvOAcE8a?=
 =?iso-8859-1?Q?BrbuGNFT6TlHnCjO9n2FcvJ0XCSUdJjZ237pJC04mvU3sm+d8LljLNlQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d93e348-a392-4823-1b58-08db1691a82a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2023 18:05:05.2502 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m4cE9dVzbWiLeEVzlGnMhwehdANKyKPEhxf8UiONcdzLIiCWidOZdjvMLyvGNZmDQRmycECX2t+7l7JOguD3Hq9DZ13OIz8a8KFIZspX2B8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7341
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

On Fri, Feb 24, 2023 at 10:02:38AM -0800, Matt Roper wrote:
>On Thu, Feb 16, 2023 at 04:52:19PM -0800, Lucas De Marchi wrote:
>> Create regs/xe_engine_regs.h file with all the registers and bit
>> definitions used by the xe driver. Eventually the registers may be
>> defined in a different way and since xe doesn't supported below gen12,
>> the number of registers touched is much smaller, so create a new header.
>>
>> The definitions themselves are direct copy from the
>> gt/intel_engine_regs.h file, just sorting the registers by address.
>> Cleaning those up and adhering to a common coding style is left for
>> later.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/regs/xe_engine_regs.h | 98 ++++++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_execlist.c         |  2 +-
>>  drivers/gpu/drm/xe/xe_guc_ads.c          |  5 +-
>>  drivers/gpu/drm/xe/xe_hw_engine.c        |  2 +-
>>  drivers/gpu/drm/xe/xe_lrc.c              |  2 +-
>>  drivers/gpu/drm/xe/xe_mmio.c             |  2 +-
>>  drivers/gpu/drm/xe/xe_reg_sr.c           |  2 +-
>>  drivers/gpu/drm/xe/xe_reg_whitelist.c    |  2 +-
>>  drivers/gpu/drm/xe/xe_wa.c               |  2 +-
>>  9 files changed, 109 insertions(+), 8 deletions(-)
>>  create mode 100644 drivers/gpu/drm/xe/regs/xe_engine_regs.h
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>> new file mode 100644
>> index 000000000000..6dfa3cf2fd43
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>> @@ -0,0 +1,98 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_ENGINE_REGS_H_
>> +#define _XE_ENGINE_REGS_H_
>> +
>> +#include <asm/page.h>
>> +
>> +#include "i915_reg_defs.h"
>> +
>> +#define RING_TAIL(base)				_MMIO((base) + 0x30)
>> +
>> +#define RING_HEAD(base)				_MMIO((base) + 0x34)
>> +#define   HEAD_ADDR				0x001FFFFC
>> +
>> +#define RING_START(base)			_MMIO((base) + 0x38)
>> +
>> +#define RING_CTL(base)				_MMIO((base) + 0x3c)
>> +#define   RING_CTL_SIZE(size)			((size) - PAGE_SIZE) /* in bytes -> pages */
>> +#define   RING_CTL_SIZE(size)			((size) - PAGE_SIZE) /* in bytes -> pages */
>> +
>> +#define RING_PSMI_CTL(base)			_MMIO((base) + 0x50)
>> +#define   GEN8_RC_SEMA_IDLE_MSG_DISABLE			REG_BIT(12)
>> +#define   GEN12_WAIT_FOR_EVENT_POWER_DOWN_DISABLE	REG_BIT(7)
>> +
>> +#define RING_ACTHD_UDW(base)			_MMIO((base) + 0x5c)
>> +#define RING_DMA_FADD_UDW(base)			_MMIO((base) + 0x60)
>> +#define RING_IPEIR(base)			_MMIO((base) + 0x64)
>> +#define RING_IPEHR(base)			_MMIO((base) + 0x68)
>> +#define RING_ACTHD(base)			_MMIO((base) + 0x74)
>> +#define RING_DMA_FADD(base)			_MMIO((base) + 0x78)
>> +#define RING_HWS_PGA(base)			_MMIO((base) + 0x80)
>> +#define IPEIR(base)				_MMIO((base) + 0x88)
>> +#define IPEHR(base)				_MMIO((base) + 0x8c)
>> +#define RING_HWSTAM(base)			_MMIO((base) + 0x98)
>> +#define RING_MI_MODE(base)			_MMIO((base) + 0x9c)
>> +#define RING_NOPID(base)			_MMIO((base) + 0x94)
>> +
>> +#define RING_IMR(base)				_MMIO((base) + 0xa8)
>> +#define   RING_MAX_NONPRIV_SLOTS  12
>> +
>> +#define RING_EIR(base)				_MMIO((base) + 0xb0)
>> +#define RING_EMR(base)				_MMIO((base) + 0xb4)
>> +#define RING_ESR(base)				_MMIO((base) + 0xb8)
>> +#define RING_BBADDR(base)			_MMIO((base) + 0x140)
>> +#define RING_BBADDR_UDW(base)			_MMIO((base) + 0x168)
>> +#define RING_EXECLIST_STATUS_LO(base)		_MMIO((base) + 0x234)
>> +#define RING_EXECLIST_STATUS_HI(base)		_MMIO((base) + 0x234 + 4)
>> +
>> +#define RING_CONTEXT_CONTROL(base)		_MMIO((base) + 0x244)
>> +#define	  CTX_CTRL_INHIBIT_SYN_CTX_SWITCH	REG_BIT(3)
>> +#define	  CTX_CTRL_ENGINE_CTX_RESTORE_INHIBIT	REG_BIT(0)
>> +
>> +#define RING_MODE_GEN7(base)			_MMIO((base) + 0x29c)
>> +#define   GEN11_GFX_DISABLE_LEGACY_MODE		(1 << 3)
>> +
>> +#define RING_TIMESTAMP(base)			_MMIO((base) + 0x358)
>> +
>> +#define RING_TIMESTAMP_UDW(base)		_MMIO((base) + 0x358 + 4)
>> +#define   RING_VALID_MASK			0x00000001
>> +#define   RING_VALID				0x00000001
>> +#define   STOP_RING				REG_BIT(8)
>> +#define   TAIL_ADDR				0x001FFFF8
>> +
>> +#define RING_CTX_TIMESTAMP(base)		_MMIO((base) + 0x3a8)
>> +
>> +#define RING_FORCE_TO_NONPRIV(base, i)		_MMIO(((base) + 0x4d0) + (i) * 4)
>> +#define   RING_FORCE_TO_NONPRIV_DENY		REG_BIT(30)
>> +#define   RING_FORCE_TO_NONPRIV_ADDRESS_MASK	REG_GENMASK(25, 2)
>> +#define   RING_FORCE_TO_NONPRIV_ACCESS_RW	(0 << 28)
>> +#define   RING_FORCE_TO_NONPRIV_ACCESS_RD	(1 << 28)
>> +#define   RING_FORCE_TO_NONPRIV_ACCESS_WR	(2 << 28)
>> +#define   RING_FORCE_TO_NONPRIV_ACCESS_INVALID	(3 << 28)
>> +#define   RING_FORCE_TO_NONPRIV_ACCESS_MASK	(3 << 28)
>> +#define   RING_FORCE_TO_NONPRIV_RANGE_1		(0 << 0)
>> +#define   RING_FORCE_TO_NONPRIV_RANGE_4		(1 << 0)
>> +#define   RING_FORCE_TO_NONPRIV_RANGE_16	(2 << 0)
>> +#define   RING_FORCE_TO_NONPRIV_RANGE_64	(3 << 0)
>> +#define   RING_FORCE_TO_NONPRIV_RANGE_MASK	(3 << 0)
>> +#define   RING_FORCE_TO_NONPRIV_MASK_VALID	(RING_FORCE_TO_NONPRIV_RANGE_MASK | \
>> +						 RING_FORCE_TO_NONPRIV_ACCESS_MASK | \
>> +						 RING_FORCE_TO_NONPRIV_DENY)
>> +#define   RING_MAX_NONPRIV_SLOTS  12
>> +
>> +#define RING_EXECLIST_SQ_CONTENTS(base)		_MMIO((base) + 0x510)
>> +
>> +#define RING_EXECLIST_CONTROL(base)		_MMIO((base) + 0x550)
>> +#define	  EL_CTRL_LOAD				REG_BIT(0)
>> +
>> +#define VDBOX_CGCTL3F10(base)			_MMIO((base) + 0x3f10)
>> +#define   IECPUNIT_CLKGATE_DIS			REG_BIT(22)
>> +
>> +#define VDBOX_CGCTL3F18(base)			_MMIO((base) + 0x3f18)
>> +#define   ALNUNIT_CLKGATE_DIS			REG_BIT(13)
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
>> index 5633259482ed..af2fcf1c32f4 100644
>> --- a/drivers/gpu/drm/xe/xe_execlist.c
>> +++ b/drivers/gpu/drm/xe/xe_execlist.c
>> @@ -6,6 +6,7 @@
>>
>>  #include <drm/drm_managed.h>
>>
>> +#include "regs/xe_engine_regs.h"
>>  #include "xe_bo.h"
>>  #include "xe_device.h"
>>  #include "xe_engine.h"
>> @@ -18,7 +19,6 @@
>>  #include "xe_ring_ops_types.h"
>>  #include "xe_sched_job.h"
>>
>> -#include "gt/intel_engine_regs.h"
>>  #include "gt/intel_gpu_commands.h"
>>  #include "gt/intel_gt_regs.h"
>>  #include "gt/intel_lrc_reg.h"
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
>> index 1ea1b25e7170..bde094388a34 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
>> @@ -4,8 +4,11 @@
>>   */
>>  #include "xe_guc_ads.h"
>>
>> +#include "xe_guc_ads.h"
>> +
>
>This duplication looks like an accident?

yep

>
>Aside from that,
>
>Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

thanks

Lucas De Marchi
