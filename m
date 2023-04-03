Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F7E3C76188
	for <intel-xe@archiver.kernel.org>; Mon,  3 Apr 2023 22:58:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64E5A10E1C8;
	Mon,  3 Apr 2023 22:58:21 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 997B910E1C8
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Apr 2023 22:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680562699; x=1712098699;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=QRdtLBad2Roj5OsMIpV/vF1kriZ3H0UvPXL6Z4p6M04=;
 b=ljnePqdanW4B0SQmnXkxn/RQ2fD65y1Q4xQHpHlGmANYthF/OdoiJ25d
 7vE/LEsIDozyMv5ZSJaFLMwxuSctnGqvAQTZPtl0td8gO/F/p2eK9esbO
 M+G0eiRwK4lxsxjotKwA9acO0Uc1es27eiAtx133IVVaX0cu4N3hXRHnj
 CLtEKRmWVgF+jmd8F1xX+NRH21sKVX2PkSynelxXKf5rogMt2jzgYvzex
 J8l1Yr8VPMVKMKziycfW0USJBIAfMhUOowbIf0raPOhrVwKApFGPOxJb+
 /+Ca0kcK7gFq+dj+kKt98VB2yPf6sTu4VFVyCqlRbNM8CIvmoZYgOpj30 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="343739073"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400"; d="scan'208";a="343739073"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 15:58:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="860369200"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400"; d="scan'208";a="860369200"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga005.jf.intel.com with ESMTP; 03 Apr 2023 15:58:18 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 3 Apr 2023 15:58:18 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 3 Apr 2023 15:58:18 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.105)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 3 Apr 2023 15:58:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aCzc+4YX0NmnqP26WdDkybVRCsmyOaRDTXh2e8tqz/KgZyJ4eLHtAZcsAq7lSAYt6+WiPlGwOd4PtPEm9YI8g/jzfF/QUQQ2OluzLILJxpNogUGIShjRWi03ug+j9IpQBIS25ARHAd/lEBTVX0VfqwFPFgBOac/C+N5bY9OiVZia7Rmy2qTbe0PTkpUFZ1B8AHW+JwiIvV8Xnb/Tl9shnSZmkrHcIw0S7vfKm85tVH7F7cFEIug/jAMkexjR6YF5iinRZoWY64tlZVMmUPlT6wSablDDmmWMFH40mY3Y3dORfk4o3Z8gHZBxp5hJfKVVNIUjSU4SV+sOiAHGv25j1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gk2iieQFoOaK36mG+WA01Vx6tUGhI3DCXJHXGDWiBsg=;
 b=hOtUUCcf4FTSgLqFpPgicpV9ATJoHkMMlrrHuX3DyqHo19NJBkuo5SJKAzNN6WAQJWy5fqVJFFq1RJjbTYzjS/w1keBYKiXYtVsIOEQlepzyjxpIQx7djPOPOMqpltESDxfkd003ocJLpIj+TDxa71Ghf+QuvW7sLf7+QthKmdN6DVl925+UGP3TlmYatumgSOK8D8aYzKtc7IEiJx9tmpVAxA1NJ6/h4LJAmDV/cToH2pT5M4uDi0Ar9xqPw38brn0ULt1snYQoVeFgcEsYB80UA+ZFUurXMqLXkgAeFGvob4uUpr3Ob+TqOyp6JeQbB3QIW/l3yMG+SHD9BUOuzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 DM4PR11MB7758.namprd11.prod.outlook.com (2603:10b6:8:101::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6254.33; Mon, 3 Apr 2023 22:58:15 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%8]) with mapi id 15.20.6254.033; Mon, 3 Apr 2023
 22:58:15 +0000
Date: Mon, 3 Apr 2023 15:58:11 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230403225811.GB4085390@mdroper-desk1.amr.corp.intel.com>
References: <20230401085151.1786204-1-lucas.demarchi@intel.com>
 <20230401085151.1786204-5-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230401085151.1786204-5-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0059.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::34) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|DM4PR11MB7758:EE_
X-MS-Office365-Filtering-Correlation-Id: d509540b-0174-4773-3367-08db3496e815
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +SveS6Sn/CF4AMrHsxF76xa3JzyfjuUyUZATIxoD2SD8Hen8kruSBIGXI8cJf25Ul2KnXOVGNlknEWDJjDXSIJcmk3IRl4cSuzIajU26pQPTaKD4s8MYJgfT5/9xks7YpxwlcZBTw9/QsbOW6zZTuLkSiwiGxiGHdHgbEdD3LpsFPvTP4gNBJ7MI5YWsRgEMgIhg/lbKJHWQr3UYSCadIGcCY2l2RykZK/xJaJiK85Jm65OoNgPgk3IT+BIh9hQUhPkCBs7+q9p6pF69mjJVf6XlMQ0AViFaMr3SQRgLdRWw/QiUiEOQYr9qzZs0eWu1gwbd2sbZpr1Glt3niVlgNkzpKPNYN6vLJrvD6f3GFUjdK3AsiJ/6MjIMqY82tLKiJLzrujMeOJu6FcHeDRjfJgpQQqOVHTsdNfVWMFIjCHH2V0iz7pBSn/DTZ/fOll7Pd0FebBzbSeKFym+L/DytvuP9AgG7DtYBjVHEc9mK/x/IINLBGZP3NY6tPGgAz8Z89NNYq75AoW4oQxKLQpanQGfvyKtRg4uw1aw1RUO7aUMCoHHxeQwVCsRZAQE1B9oZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(396003)(136003)(346002)(366004)(376002)(451199021)(86362001)(33656002)(2906002)(6486002)(83380400001)(186003)(26005)(1076003)(6666004)(6506007)(6512007)(8676002)(4326008)(66476007)(316002)(66556008)(478600001)(66946007)(41300700001)(38100700002)(5660300002)(82960400001)(8936002)(6636002)(6862004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4bX0D2IlNEmVV55YrMWH6CKzu6lYBG7cbqqDuwtqQnaL+p8zw0nwcj5zFfAK?=
 =?us-ascii?Q?0PCvMNbZ5jsw0gwIiGnAK6mYwKOfr6NIb7LpLU5zjAfMUCBpn4v5CPo2hQM8?=
 =?us-ascii?Q?Qe5RBdU1f5xYRaeJjW9bC3uG/izFUHzYuVlZiqgDk0XEu3+Tx6GbQUICIXwZ?=
 =?us-ascii?Q?hm4wZqnVNdEJ4Z0HN5+qVvLd1c0B7B1ZessJMheWFMGCdfUaZCOmY3EIArR5?=
 =?us-ascii?Q?RKRXwz7Gpa7UOEcQRFEdgmu1ERFiu22Yb8ea+qjBKL+RL9AoauNyk6D8fOCV?=
 =?us-ascii?Q?+RE19ORcoSokeYpDZNXcPCla9gpMbS/o0hmJJPsl6fCUMcRPSR2l+IYS0w38?=
 =?us-ascii?Q?0zF+C2R2voO2xRlG2k/yfvHYb6uSsc3fE+IWiHeqhJXUtU/5ZJz1sffpmzk2?=
 =?us-ascii?Q?c6InaH/P1RNzw40ZyUcewwZcpYbm3QfImRrYIigER7r+HoYfxt1GxfycaOLz?=
 =?us-ascii?Q?3O57hOpmvMVYqSFV3/s09g61KVEGYl34EzFf+OPDnKoq8XD6J7JTUdffcUAm?=
 =?us-ascii?Q?GUs9gP1mqYcC1pMmjFX0k/8Sjf/yrcGIC7o7J389nRYec6+0vNSFVNDQxVFc?=
 =?us-ascii?Q?8MC0Zoc416VkHEfkdjmUQV+kktMXER8o7kGEzocSV7NkWeneWzP0g8DCh1zM?=
 =?us-ascii?Q?u1O4a4I93OmRkwQJPOkeUxIvcYyYyO8sL6F0taW7e0phumeniywKL3bnRK1V?=
 =?us-ascii?Q?HuCNd0S1I/I9X5ME+FqjVMQnU4et+84jW0uZit5KF6GwDLAg7i6sC2FH3ueG?=
 =?us-ascii?Q?QGrMKl50UKI25q7yi5yOQytgx6U0qub8r0GplI4Jk+vL/C/5lJzj/4/f7BWL?=
 =?us-ascii?Q?uRseZAsqP6iGMe+/DnRDsECOJ657vXzLgiFpDpmiC8bcwLqCuYat/6wJQjnU?=
 =?us-ascii?Q?kCLY32hrQJ0S2ZT6puv1tAGqWyVUS0V9uhWZ/IzqglQzMjdDjLd0+3Zqw2Q3?=
 =?us-ascii?Q?L6uLdNsZbarsEcxxXT28H0KHOv7ZCs+zjpZldeemcdLXOl00axWWVNAf4XM8?=
 =?us-ascii?Q?4XKPuO22bx1kXM7345TFvbk7hCr3bzQjgzfwsCcECOqQ0RWEVjYn4hBXMaYr?=
 =?us-ascii?Q?s0huywgcBCM37oSlkAr6Xg6x4qvAJlD0SzfiEXEw9USvnPt07dPyMCbgo0MC?=
 =?us-ascii?Q?ouee9/IlUXZvtoz+J9WE/c9TGB7SZJWlC2y0ycDJgi9N3CS6BNmeimSjBSz3?=
 =?us-ascii?Q?Z5nLBQUmrP8EM9L6aX0VyNQCGLVZmQfLz91oyXBDGUmFYTfwk3f6kDz6K5PO?=
 =?us-ascii?Q?x+SR+YQhzCtpsAJLh2wiQQAbXBlsp0aPP+oEDnxYdWq/q/btXOS/5XlFpdoC?=
 =?us-ascii?Q?KyEcPR8aY6tE6kVSrscmNz53SXvuwwv1gvVeqgdyf2DlqBNnm2aY6c+QG9YD?=
 =?us-ascii?Q?WNnwA1pMkUJuDN75ez0KnRWBhYHLMoJG4pUDCkGkBEN8Sw2Q5xzzosJnVWBE?=
 =?us-ascii?Q?O05i75jefLLtrlpAv/68z8nJYgQ3dyLkU5Bj145TEr30aJAmzF3bolp2moJz?=
 =?us-ascii?Q?kFLqOKAoqJ0iLdmFCbYlz+8iNi/uERFWJgejVowyvqrWmv6yo7OSnFeF+3KZ?=
 =?us-ascii?Q?BhoPjwl08HNQowKFAtnflTGl6Y3uYHjiUnhkW9R3b5ZFIXSLINeO6d+538tv?=
 =?us-ascii?Q?aA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d509540b-0174-4773-3367-08db3496e815
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2023 22:58:14.8199 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a8c+sp6hdxxo588ppjZsPdtXDaWMeZsp7mIoVoci3eT8K0S+oX4Nw2Y+5LRTaReIPJtT4vjt4uv3AIdrGSYBw5O9P9SGdWQQIkB9EFlD77c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7758
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 4/7] drm/xe: Generalize fake device
 creation
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
Cc: =?utf-8?Q?Micha=C5=82?= Winiarski <michal@hardline.pl>,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Sat, Apr 01, 2023 at 01:51:48AM -0700, Lucas De Marchi wrote:
> Instead of requiring tests to initialize a fake device an keep it in
> sync with xe_pci.c when it's platform-dependent, export a function from
> xe_pci.c to be used and piggy back on the device info creation. For
> simpler tests that don't need any specific platform and just need a fake
> xe device to pass around, xe_pci_fake_device_init_any() can be used.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

We'll need to make some updates to the fake device init once GMD_ID
support lands (since the platform won't be directly hooked up to all the
graphics/media feature flags at that point).  But no need to worry about
that right now.


Matt

> ---
>  drivers/gpu/drm/xe/tests/xe_pci.c      | 47 ++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/tests/xe_pci_test.h | 16 +++++++++
>  drivers/gpu/drm/xe/xe_pci.c            |  2 +-
>  3 files changed, 64 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
> index 643bddb35214..cc65ac5657b3 100644
> --- a/drivers/gpu/drm/xe/tests/xe_pci.c
> +++ b/drivers/gpu/drm/xe/tests/xe_pci.c
> @@ -8,6 +8,7 @@
>  #include "tests/xe_test.h"
>  
>  #include <kunit/test.h>
> +#include <kunit/visibility.h>
>  
>  struct kunit_test_data {
>  	int ndevs;
> @@ -60,3 +61,49 @@ int xe_call_for_each_device(xe_device_fn xe_fn)
>  
>  	return ret;
>  }
> +
> +int xe_pci_fake_device_init(struct xe_device *xe, enum xe_platform platform,
> +			    enum xe_subplatform subplatform)
> +{
> +	const struct pci_device_id *ent = pciidlist;
> +	const struct xe_device_desc *desc;
> +	const struct xe_subplatform_desc *subplatform_desc;
> +
> +	if (platform == XE_TEST_PLATFORM_ANY) {
> +		desc = (const void *)ent->driver_data;
> +		subplatform_desc = NULL;
> +		goto done;
> +	}
> +
> +	for (ent = pciidlist; ent->device; ent++) {
> +		desc = (const void *)ent->driver_data;
> +		if (desc->platform == platform)
> +			break;
> +	}
> +
> +	if (!ent->device)
> +		return -ENODEV;
> +
> +	if (subplatform == XE_TEST_SUBPLATFORM_ANY) {
> +		subplatform_desc = desc->subplatforms;
> +		goto done;
> +	}
> +
> +	for (subplatform_desc = desc->subplatforms;
> +	     subplatform_desc && subplatform_desc->subplatform;
> +	     subplatform_desc++)
> +		if (subplatform_desc->subplatform == subplatform)
> +			break;
> +
> +	if (subplatform == XE_SUBPLATFORM_NONE && subplatform_desc)
> +		return -ENODEV;
> +
> +	if (subplatform != XE_SUBPLATFORM_NONE && !subplatform_desc)
> +		return -ENODEV;
> +
> +done:
> +	xe_info_init(xe, desc, subplatform_desc);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_IF_KUNIT(xe_pci_fake_device_init);
> diff --git a/drivers/gpu/drm/xe/tests/xe_pci_test.h b/drivers/gpu/drm/xe/tests/xe_pci_test.h
> index de65d8c9ccb5..43294e8c62bb 100644
> --- a/drivers/gpu/drm/xe/tests/xe_pci_test.h
> +++ b/drivers/gpu/drm/xe/tests/xe_pci_test.h
> @@ -6,10 +6,26 @@
>  #ifndef _XE_PCI_TEST_H_
>  #define _XE_PCI_TEST_H_
>  
> +#include "xe_platform_types.h"
> +
>  struct xe_device;
>  
> +/*
> + * Some defines just for clarity: these mean the test doesn't care about what
> + * platform it will get since it doesn't depend on any platform-specific bits
> + */
> +#define XE_TEST_PLATFORM_ANY	XE_PLATFORM_UNINITIALIZED
> +#define XE_TEST_SUBPLATFORM_ANY	XE_SUBPLATFORM_UNINITIALIZED
> +
>  typedef int (*xe_device_fn)(struct xe_device *);
>  
>  int xe_call_for_each_device(xe_device_fn xe_fn);
>  
> +int xe_pci_fake_device_init(struct xe_device *xe, enum xe_platform platform,
> +			    enum xe_subplatform subplatform);
> +
> +#define xe_pci_fake_device_init_any(xe__)					\
> +	xe_pci_fake_device_init(xe__, XE_TEST_PLATFORM_ANY,			\
> +				XE_TEST_SUBPLATFORM_ANY)
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 302f7f588da1..21ae5e6f8fe5 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -429,7 +429,7 @@ static void xe_pci_remove(struct pci_dev *pdev)
>  
>  static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  {
> -	const struct xe_device_desc *desc = (void *)ent->driver_data;
> +	const struct xe_device_desc *desc = (const void *)ent->driver_data;
>  	const struct xe_subplatform_desc *subplatform_desc;
>  	struct xe_device *xe;
>  	int err;
> -- 
> 2.39.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
