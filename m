Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1489C001DE
	for <intel-xe@archiver.kernel.org>; Fri, 11 Aug 2023 00:27:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C214A10E616;
	Fri, 11 Aug 2023 00:27:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2E0D10E616
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Aug 2023 00:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691713667; x=1723249667;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=q+yD1lyEf6vC0pTkcskPXnv96vd4ub8xRy0NuE4LSv4=;
 b=DyLAu5hXStGHTlufbJUZt6Yb49nxUZwHumT87ciEV6ZZxx9RI7+Gc421
 Z6T06YpdhWomXTge3sIK41B9FA7JvawjuREm+7CYzGXBZsEcxMc9WjXez
 KdrBOErew/kizJ7K1WfSF5a9Skc4Zj+xlTLwY2yVdUXuwh/BmyBW1uJdy
 /CZSXeg3RgWTggxd96+stFJG40w/CWa0RVXWPaVPYl7ky1ybpVA71uMgb
 233s+M/z7eaZwh6ZOU1JxYpLxo4uCokj87CytIWPaWF0KkJJQlT3hS2Tp
 sViYB8vCIgnS1/kiTGvMf8USM+096fH/sDWPmjiKU/r1BH4azc8u+ES3H w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="370461147"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; d="scan'208";a="370461147"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2023 17:27:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="761995649"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; d="scan'208";a="761995649"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga008.jf.intel.com with ESMTP; 10 Aug 2023 17:27:47 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 10 Aug 2023 17:27:46 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 10 Aug 2023 17:27:46 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 10 Aug 2023 17:27:46 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 10 Aug 2023 17:27:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lZDdi6MncFTLqOMGVcNCyE5gOKykrqTG7+La/RRvJC5oUef1/tg7R8EtKraWF2iM4OHRCUDdOy6KHUfsW9B+/5qZ3lQ7GC4Oy+GT4HdM4SpBxCc4h0ffzuPG/1vJVuplNN/RXgOrLFlT75St8mxVXb5DypDNSoHf2uc08jfvDe71U3AyGTWGj24UeCq8KTyOE1H5JddFY/HeST2EpYIl6rlq+bM9vaH48DgDqimbCTUB/oqDaX6k8FaHCUXzgVbLtol91w5Wpg2mG330av3BYkCWb+zKTAnOpQOvaciyqQMezwZsemGz3ko2vD6/8t6dnN9T60//JLb9bqFJyvpPRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lVTGVb6Z64NNxcZjUdkF1DEr5gc/VJMgnsuwXQn+pyk=;
 b=fzj6n0Zcy/H1LM8nNQFDqHBQwfooQUOSiVpQDy7RTSh9IaeNe5ceIkKdXSqwTjxT34oMyjKr7+uf49NaKfhTtUEGbrY8g2V9lne4zkGbLJT1Z02Ip4JpjeJ3DYJZ6NOWoXPK+NJHQHRs7hIF55Lu5vGrd60uyV5mcdeh6vDAAE42awgie7lS9u8MPKDLGwEiu5X9j2E7iHd/ZXpgtiGASYgHoRQXp2xco3rf593+wN5JxlslA/6AIQu83QswRDlvXtmDThFuRLDpmJBfllNQmyO0rLcZDeFXVjytYfGMTT//WdMa1NQqVdEWdox3p6RCqy4nHdaVdOKSUvSyuLWoKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SJ2PR11MB7519.namprd11.prod.outlook.com (2603:10b6:a03:4c0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Fri, 11 Aug
 2023 00:27:43 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41%5]) with mapi id 15.20.6652.029; Fri, 11 Aug 2023
 00:27:43 +0000
Date: Thu, 10 Aug 2023 17:27:40 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <20230811002740.GB3375865@mdroper-desk1.amr.corp.intel.com>
References: <20230809180515.2083-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230809180515.2083-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR13CA0230.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::25) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SJ2PR11MB7519:EE_
X-MS-Office365-Filtering-Correlation-Id: b81cbf68-d016-4955-e8cb-08db9a01c734
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RIdF662TuRbDPQNQrbAdIKL5fHqzAE3YOpI8yFyXbr1HSMHH+wGP0sQGBHaaaNy/Yh7BBLRRvhibisvWzvIhob5mAnt2+FWXgwV6NiAEfYD/eobyew7xyvW2L3NkTs29G+WZH/yj0Myt05e/ADk9mZz2jgRuytuya0QR79KySdNJaPKI11Bm1BEt5wLwOjXW2HvcbJS9FNUqHWsu4VGRppwkMBGsYjXcPbxSCP23OzWzRwUj6JvfKcSo7OT2Y7YAbHEy6t35901bWTfteT6M0+dbcGF9sFfmY8pu53Vh+wyo3baaDiGO+WjyHlZnvQHpFctnL0ofUzInJlonyilqebGu7jVZ39X0tEjplkc2PGn59u7UvlK2D4cjN9TJEHJ4Vm0CxIFe3T2v+Wpd04EAk/vR7ySsKLBSw+B6j9aiyNmtiFtYxqDwu8xkVZZVU/gwJh6pXfJFdilxzbq8hxk6sUsN9VdCzbpmT+w+U3j1VkefWJqR8x7BqgZDiuMXme/DfalLg2VCz/WzOmCucWfM1/nZUoO3UkpaUx1toIhVIudhkd7uHtfFoQzMfM4t3rOT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(39860400002)(136003)(346002)(366004)(376002)(1800799006)(451199021)(186006)(6862004)(8676002)(54906003)(8936002)(86362001)(33656002)(6486002)(66476007)(316002)(6512007)(1076003)(6506007)(2906002)(478600001)(26005)(107886003)(38100700002)(82960400001)(41300700001)(4326008)(6636002)(83380400001)(66556008)(66946007)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?AbCNiCaQ14hppnRxJ38WHK39oHUU3vMBQnTZEEMYRBQJ2A2mfdZnhVW2pK?=
 =?iso-8859-1?Q?BnKb21sSG7TWaN0mVVNJxFu/1Rz10zN12TaBypl9drK/DW5HDzoJ1STrc0?=
 =?iso-8859-1?Q?X+SGsqGrq5KY8ElyCoMzOg8HFz0j+//5V8MlPOIDHwgD3l8+eAqC6oZJc1?=
 =?iso-8859-1?Q?hgJPjUBndAzflIGMg/UryaBkK8KcpzPrE4wsIzpfarWhlAhEYCb9p7LOxB?=
 =?iso-8859-1?Q?RXMVB10wTcxjqy+G4aDppaFIOsClHm6mdWMUMu27oEVRATu3RXaICmQaQS?=
 =?iso-8859-1?Q?bFS3zZrrGX1uGGJQN8Ee7itn3WTRKKqYM8psdAxAw0D6Zs+Tz4PHdyIMGD?=
 =?iso-8859-1?Q?XqW6fRoSeu39WdGltOqlPdUMT5J7fnj4EfWOSuHNL8OkZRx+4pRqlR7WQf?=
 =?iso-8859-1?Q?OEMS3WDJ5/XGfHONweFxL27c6n4fuCA25qetzSyTPQeuc2bV4hJYUWSPtr?=
 =?iso-8859-1?Q?UJJ8OcLkHHpmy3VfEI4QmXl9SFmt56FbGHnx0i/NZVHHWafI3Gh4kN59N8?=
 =?iso-8859-1?Q?REUTehJuiDyU15hA2zWFWRCE7SBMXCkm6TgH2jRgW2kyWL4SWFgG0L51OV?=
 =?iso-8859-1?Q?qwe6ONmXrbmCD+Wmle4aXc202FY0wok7ywrd9MTO4M3JTujdTS+sHfdasm?=
 =?iso-8859-1?Q?PR0EAhD4U/OFOflhhwLGzZ8UwVHDdgt5lEE7QrxhnQMQhMJrV9MpGFHYDV?=
 =?iso-8859-1?Q?aHdrg3vsFxyiM+dbOC6yn3Ks4C05zXp/6o7tUYV/fz46AIgouXFXMEM5zS?=
 =?iso-8859-1?Q?MxdbwY8T4WuxISThJWrdr7DJt9Gs1DzCaI0O+6J1dlC10YBBfztcg0G3SU?=
 =?iso-8859-1?Q?BLu7Kal64keERH/NWva7P6I5XnUcsYaaCScSPZghr7wkKUMD/4NieDYEFo?=
 =?iso-8859-1?Q?iVQVj0DxbUjzwaulU7lRWJgjZ0EAoXW+KOk/SnY8RlNQP72KtFZrKH5K8v?=
 =?iso-8859-1?Q?knQiMsrwzTZxAndoY5Bz1L6dTOF+2DMMFwS+2Fl8YV6sf70sZxpsW8HVGT?=
 =?iso-8859-1?Q?5if06dy5lDiomqBrra4v3IIpOmXc8Um44mdcLYr94OobWeQ27g+Xr93N8L?=
 =?iso-8859-1?Q?KNtzr5pS1p0NSPjDhbpj5XV/H2ZnOZA7lKJngPF8iVR4+iiw6IRmqa6w83?=
 =?iso-8859-1?Q?DCV08CpKpMSqQuCEcOCoUF4hjCeIyk6qyB7x4wumCaypWwmb8QgDjOE3jN?=
 =?iso-8859-1?Q?Ipva+Ki4XNO9jHfCTxl36cyCYts0xzbjRMklxUhUW24K/6JRhPIBQ9cQXA?=
 =?iso-8859-1?Q?Ucz40B4upMQvfb77EzTaikuzKMquLF3YDxFEP3o4D0m4F2qIDxPaQW+bUu?=
 =?iso-8859-1?Q?xfnczmMLI5p64HL591SfUTiI9BXMqBBte6HCmOsnfT9ijnu3KeNjjCkE8z?=
 =?iso-8859-1?Q?BdTEnRPF5w/KwiqhLGbTBdyt+sSy28YVIYSHuubUCmxWEulTEAsTHRbTos?=
 =?iso-8859-1?Q?waz3IkcPrPgCi4MPZnVRhvS3e5cx25i/kzZwrT95M+Cz8dtITWhdSEwvp9?=
 =?iso-8859-1?Q?VoILNI6voGHJMvS3MV2hdwM5516Vk754/wcz+/nlmB+iVc8s0H82eFijzu?=
 =?iso-8859-1?Q?BjvFywsVxMAytT6sEbSBDMWxJnrhO4MXxmhx7njJpPnDxt3Hs30K/NVS2H?=
 =?iso-8859-1?Q?Uz0/vVgrPLDRN6b5E4stxkwyqlBzhRpXbYX6yKleiXuAFmPAFdkXKdQw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b81cbf68-d016-4955-e8cb-08db9a01c734
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2023 00:27:43.3895 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PW89VgbwDjhshoQsxk0tw5RvrSG+5AvbeqLU9tqztmwPQs8pqV5r0gJdmxgE6Zyi3BsNXLzNYklXMuXahWX5aHgQLjbv/5v0Td0lA4fqWV0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7519
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2] drm/xe: Introduce Xe assert macros
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

On Wed, Aug 09, 2023 at 08:05:15PM +0200, Michal Wajdeczko wrote:
> As we are moving away from the controversial XE_BUG_ON macro,
> relying just on WARN_ON or drm_err does not cover the cases
> where we want to annotate functions with additional detailed
> debug checks to assert that all prerequisites are satisfied,
> without paying footprint or performance penalty on non-debug
> builds, where all misuses introduced during code integration
> were already fixed.
> 
> Introduce family of Xe assert macros that try to follow classic
> assert() utility and can be compiled out on non-debug builds.
> 
> Macros are based on drm_WARN, but unlikely to origin, disallow
> use in expressions since we will compile that code out.
> 
> As we are operating on the xe pointers, we can print additional
> information about the device, like tile or GT identifier, that
> is not available from generic WARN report:
> 
> [ ] xe 0000:00:02.0: [drm] Assertion `true == false` failed!
>     platform: 1 subplatform: 1
>     graphics: Xe_LP 12.0 step B0

Really minor nit, but I'd print versions as "%u.%02u" so that we always
get two digits after the dot.  Othewise we might cause more confusion
where people forget that "12.3" != "12.30."


Matt

>     media: Xe_M 12.0 step B0
>     display: enabled step D0
>     tile: 0 VRAM 0 B
>     GT: 0 type 1
> 
> [ ] xe 0000:b3:00.0: [drm] Assertion `true == false` failed!
>     platform: 7 subplatform: 3
>     graphics: Xe_HPG 12.55 step A1
>     media: Xe_HPM 12.55 step A1
>     display: disabled step **
>     tile: 0 VRAM 14.0 GiB
>     GT: 0 type 1
> 
> [ ] WARNING: CPU: 0 PID: 2687 at drivers/gpu/drm/xe/xe_device.c:281 xe_device_probe+0x374/0x520 [xe]
> [ ] RIP: 0010:xe_device_probe+0x374/0x520 [xe]
> [ ] Call Trace:
> [ ]  ? __warn+0x7b/0x160
> [ ]  ? xe_device_probe+0x374/0x520 [xe]
> [ ]  ? report_bug+0x1c3/0x1d0
> [ ]  ? handle_bug+0x42/0x70
> [ ]  ? exc_invalid_op+0x14/0x70
> [ ]  ? asm_exc_invalid_op+0x16/0x20
> [ ]  ? xe_device_probe+0x374/0x520 [xe]
> [ ]  ? xe_device_probe+0x374/0x520 [xe]
> [ ]  xe_pci_probe+0x6e3/0x950 [xe]
> [ ]  ? lockdep_hardirqs_on+0xc7/0x140
> [ ]  pci_device_probe+0x9e/0x160
> [ ]  really_probe+0x19d/0x400
> 
> v2: use lowercase names
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Oded Gabbay <ogabbay@kernel.org>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_assert.h | 175 +++++++++++++++++++++++++++++++++
>  1 file changed, 175 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_assert.h
> 
> diff --git a/drivers/gpu/drm/xe/xe_assert.h b/drivers/gpu/drm/xe/xe_assert.h
> new file mode 100644
> index 000000000000..4977d9fd3dab
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_assert.h
> @@ -0,0 +1,175 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef __XE_ASSERT_H__
> +#define __XE_ASSERT_H__
> +
> +#include <linux/string_helpers.h>
> +#include <drm/drm_print.h>
> +#include "xe_device_types.h"
> +#include "xe_step.h"
> +
> +/**
> + * DOC: Xe ASSERTs
> + *
> + * While Xe driver aims to be simpler than legacy i915 driver it is still
> + * complex enough that some changes introduced while adding new functionality
> + * could break the existing code.
> + *
> + * Adding &drm_WARN or &drm_err to catch unwanted programming usage could lead
> + * to undesired increased driver footprint and may impact production driver
> + * performance as this additional code will be always present.
> + *
> + * To allow annotate functions with additional detailed debug checks to assert
> + * that all prerequisites are satisfied, without worrying about footprint or
> + * performance penalty on production builds where all potential misuses
> + * introduced during code integration were already fixed, we introduce family
> + * of Xe assert macros that try to follow classic assert() utility:
> + *
> + *  * &xe_assert
> + *  * &xe_tile_assert
> + *  * &xe_gt_assert
> + *
> + * These macros are implemented on top of &drm_WARN, but unlikely to the origin,
> + * warning is triggered when provided condition is false. Additionally all above
> + * assert macros cannot be used in expressions or as a condition, since
> + * underlying code will be compiled out on non-debug builds.
> + *
> + * Note that these macros are not intended for use to cover known gaps in the
> + * implementation; for such cases use regular &drm_WARN or &drm_err and provide
> + * valid safe fallback.
> + *
> + * Also in cases where performance or footprint is not an issue, developers
> + * should continue to use the regular &drm_WARN or &drm_err to ensure that bug
> + * reports from production builds will contain meagningful diagnostics data.
> + *
> + * Below code shows how asserts could help in debug to catch unplanned use::
> + *
> + *	static void one_igfx(struct xe_device *xe)
> + *	{
> + *		xe_assert(xe, xe->info.is_dgfx == false);
> + *		xe_assert(xe, xe->info.tile_count == 1);
> + *	}
> + *
> + *	static void two_dgfx(struct xe_device *xe)
> + *	{
> + *		xe_assert(xe, xe->info.is_dgfx);
> + *		xe_assert(xe, xe->info.tile_count == 2);
> + *	}
> + *
> + *	void foo(struct xe_device *xe)
> + *	{
> + *		if (xe->info.dgfx)
> + *			return two_dgfx(xe);
> + *		return one_igfx(xe);
> + *	}
> + *
> + *	void bar(struct xe_device *xe)
> + *	{
> + *		if (drm_WARN_ON(xe->drm, xe->info.tile_count > 2))
> + *			return;
> + *
> + *		if (xe->info.tile_count == 2)
> + *			return two_dgfx(xe);
> + *		return one_igfx(xe);
> + *	}
> + */
> +
> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> +#define __xe_assert_msg(xe, condition, msg, arg...) ({						\
> +	(void)drm_WARN(&(xe)->drm, !(condition), "[" DRM_NAME "] Assertion `%s` failed!\n" msg,	\
> +		       __stringify(condition), ## arg);						\
> +})
> +#else
> +#define __xe_assert_msg(xe, condition, msg, arg...) ({						\
> +	typecheck(struct xe_device *, xe);							\
> +	BUILD_BUG_ON_INVALID(condition);							\
> +})
> +#endif
> +
> +/**
> + * xe_assert - warn if condition is false when debugging.
> + * @xe: the &struct xe_device pointer to which &condition applies
> + * @condition: condition to check
> + *
> + * xe_assert() uses &drm_WARN to emit a warning and print additional information
> + * that could be read from the &xe pointer if provided &condition is false.
> + *
> + * Contrary to &drm_WARN, xe_assert() is effective only on debug builds
> + * (&CONFIG_DRM_XE_DEBUG must be enabled) and cannot be used in expressions
> + * or as a condition.
> + *
> + * See `Xe ASSERTs`_ for general usage guidelines.
> + */
> +#define xe_assert(xe, condition) xe_assert_msg((xe), condition, "")
> +#define xe_assert_msg(xe, condition, msg, arg...) ({						\
> +	struct xe_device *__xe = (xe);								\
> +	__xe_assert_msg(__xe, condition,							\
> +			"platform: %d subplatform: %d\n"					\
> +			"graphics: %s %u.%u step %s\n"						\
> +			"media: %s %u.%u step %s\n"						\
> +			"display: %s step %s\n"							\
> +			msg,									\
> +			__xe->info.platform, __xe->info.subplatform,				\
> +			__xe->info.graphics_name,						\
> +			__xe->info.graphics_verx100 / 100,					\
> +			__xe->info.graphics_verx100 % 100,					\
> +			xe_step_name(__xe->info.step.graphics),					\
> +			__xe->info.media_name,							\
> +			__xe->info.media_verx100 / 100,						\
> +			__xe->info.media_verx100 % 100,						\
> +			xe_step_name(__xe->info.step.media),					\
> +			str_enabled_disabled(__xe->info.enable_display),			\
> +			xe_step_name(__xe->info.step.display),					\
> +			## arg);								\
> +})
> +
> +/**
> + * xe_tile_assert - warn if condition is false when debugging.
> + * @tile: the &struct xe_tile pointer to which &condition applies
> + * @condition: condition to check
> + *
> + * xe_tile_assert() uses &drm_WARN to emit a warning and print additional
> + * information that could be read from the &tile pointer if provided &condition
> + * is false.
> + *
> + * Contrary to &drm_WARN, xe_tile_assert() is effective only on debug builds
> + * (&CONFIG_DRM_XE_DEBUG must be enabled) and cannot be used in expressions
> + * or as a condition.
> + *
> + * See `Xe ASSERTs`_ for general usage guidelines.
> + */
> +#define xe_tile_assert(tile, condition) xe_tile_assert_msg((tile), condition, "")
> +#define xe_tile_assert_msg(tile, condition, msg, arg...) ({					\
> +	struct xe_tile *__tile = (tile);							\
> +	char __buf[10];										\
> +	xe_assert_msg(tile_to_xe(__tile), condition, "tile: %u VRAM %s\n" msg,			\
> +		      __tile->id, ({ string_get_size(__tile->mem.vram.actual_physical_size, 1,	\
> +				     STRING_UNITS_2, __buf, sizeof(__buf)); __buf; }), ## arg);	\
> +})
> +
> +/**
> + * xe_gt_assert - warn if condition is false when debugging.
> + * @gt: the &struct xe_gt pointer to which &condition applies
> + * @condition: condition to check
> + *
> + * xe_gt_assert() uses &drm_WARN to emit a warning and print additional
> + * information that could be safetely read from the &gt pointer if provided
> + * &condition is false.
> + *
> + * Contrary to &drm_WARN, xe_gt_assert() is effective only on debug builds
> + * (&CONFIG_DRM_XE_DEBUG must be enabled) and cannot be used in expressions
> + * or as a condition.
> + *
> + * See `Xe ASSERTs`_ for general usage guidelines.
> + */
> +#define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
> +#define xe_gt_assert_msg(gt, condition, msg, arg...) ({						\
> +	struct xe_gt *__gt = (gt);								\
> +	xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,			\
> +			   __gt->info.id, __gt->info.type, ## arg);				\
> +})
> +
> +#endif /* __XE_ASSERT_H__ */
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
