Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D773C021A9
	for <intel-xe@archiver.kernel.org>; Mon, 17 Feb 2025 17:03:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 062FF10E55B;
	Mon, 17 Feb 2025 17:03:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="joFiAsKm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC67910E54D
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Feb 2025 17:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739811813; x=1771347813;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=OK6MQHMQ88nTJr3CmjdaMkBghFf1aVDnLloe7WmDHI8=;
 b=joFiAsKmxeFlC+nyLxdqhMdSzVQX14uce932o9W7Btit7Hf9BCZVElt8
 s0C1M/mvyjlYpCbhHQ+2Qhy8nf6kC1AEwh/wdaJH3OemCv1EsloRqMWQu
 jJmatPubTDz4JmWD+Tee73WoXZQ7tYP4SJJOBmUXeF+2GYZFmw92Euep7
 kYAg7qa4TZfJuXqfmHJbcxikuxqcI+XkI0Jen43XvOjvVApBvIb8oxZwM
 A30VD+IoWKRxp8A11L4gQ/7IyKNz8b4nM7oyd2HYdw2Np7BwwRwo9NE8g
 lQnn4w0AsfnVT/Emlx1xOHK3a+jd011diNpoG5weI7Gf6jGSzIrJ3KJHu A==;
X-CSE-ConnectionGUID: Yzls73y6TueyfXVPs+FExA==
X-CSE-MsgGUID: ifsl4BhQSZm6rtOlmdtoYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="40359324"
X-IronPort-AV: E=Sophos;i="6.13,293,1732608000"; d="scan'208";a="40359324"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2025 09:03:33 -0800
X-CSE-ConnectionGUID: E/XDqqfITWOznFqTIkfrSw==
X-CSE-MsgGUID: sFYNYP1oSqayi00+Wtq6FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,293,1732608000"; d="scan'208";a="114690588"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2025 09:03:32 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Mon, 17 Feb 2025 09:03:31 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 17 Feb 2025 09:03:31 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 17 Feb 2025 09:03:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gHJDp2i4wL7gjH8hFYXRZVTjwnTQgjaxoVgXNU+ybhGJruhQ8+PXYZJAs7gpBiOJuiouEYtD4S02fM+SgEfojPhWk4ZZUMgB/bBpOykjgDVTAXFdduopqUzPpUplCU/mwDScwhQgT0e7cwQOzBL4wP/TQDy7VzGZxxqH2yum4iUhT6Kn7ekupABaF+Vri+wiLDBFpsdBEjwKSMVWpXXA/h0I/qQMVn3F4uMVlb9k8Ycz/n+bub/KYzVsEK9xb/8WLuQhgCc8Q4bEdgo7VbCxFIo1hKZOqEqNLVGrONd7twRsrqCz0aNQ9omIYIMZCD1KUUohu400qLSMOaTaHsLBIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O0P8FLRmq7wRsRakvgYF/24RPFLiFcV0u54w0wTdDaw=;
 b=VDObnLZbnp4QBK2eVEHAzwdRNJtwWvP4kGzjjd/9T1EQ7M6mx9ok9UA99aUfvFe8Lzb3e3UtQ1lFjLLuggqGbaHadgyX4dLOCFZXKzmmgE/LsmpO3p8tAR4+L1Mx6WYWxzgZfIInmjcHPqBqAe4tk/3E1VEfFIklnjQgUMI0AoD2/suofLxzYhJZN3/M6OU14cmyDeAb6bxZAS9j7aycImd6yVF/fqnfnINfZ4aRfQn0FoKFPVBFFQbAtxx9sKNkeBcfebBUXRcKEXe7B69EXt3eBd7rSAyTn2U4oM2W+bzzqpCo8P/vxNQIudC/TiuaWEfTy7mJDJF7EJZsUulLOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7SPRMB0046.namprd11.prod.outlook.com (2603:10b6:510:1f6::20)
 by DM4PR11MB6359.namprd11.prod.outlook.com (2603:10b6:8:b9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Mon, 17 Feb
 2025 17:03:28 +0000
Received: from PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc]) by PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc%4]) with mapi id 15.20.8422.015; Mon, 17 Feb 2025
 17:03:28 +0000
Date: Mon, 17 Feb 2025 12:03:24 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 6/9] drm/xe: Move survivability entirely to xe_pci
Message-ID: <Z7Nr3PkV6VEFn3Pt@intel.com>
References: <20250214212313.1767562-1-lucas.demarchi@intel.com>
 <20250214212313.1767562-7-lucas.demarchi@intel.com>
 <f9217dfb-4f68-41ac-83bd-9b0a95e7bbd6@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <f9217dfb-4f68-41ac-83bd-9b0a95e7bbd6@intel.com>
X-ClientProxiedBy: MW2PR16CA0038.namprd16.prod.outlook.com
 (2603:10b6:907:1::15) To PH7SPRMB0046.namprd11.prod.outlook.com
 (2603:10b6:510:1f6::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7SPRMB0046:EE_|DM4PR11MB6359:EE_
X-MS-Office365-Filtering-Correlation-Id: 61012d85-1b97-4fe9-6ed1-08dd4f74ffb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NO4rW53F/lldzqfjLBoIPFyf5JClv4G/cnVIjyU6XSDcMIYWcOzXqyHUoKLf?=
 =?us-ascii?Q?DEGU2dHB6YxkipHq8MCP08HViI0+BrEmmuTPjVXYHXrDVjg88FwE+CD3ly11?=
 =?us-ascii?Q?+HlHszM8McQ2gX1EHJnEhqC5j9hmHcYYELoOsJ4REe30mUPExgtZKnlhGIWG?=
 =?us-ascii?Q?HrMB/eowRmuSokUElFqpZv2MQ39Kh8Zt7xdABVlxM+TsantwLfHEcQ0w76Gs?=
 =?us-ascii?Q?yTKYW5JFBhxcUqIrhMuu1ENjbwXbYL67C7z6mBZIV6YnLvkgthcTs2dYP8Wl?=
 =?us-ascii?Q?vXr1yZZnnWFZOLnrdYNoojDAu8RgoiWGPBle5QnQ39IH8c3i4+6MUcSJ4usv?=
 =?us-ascii?Q?GgPNwpZI1zp2+oHZ4OHuyX5VEyRu+xtxKljeS1XdrTzkdPx+wxf35cVWm9jp?=
 =?us-ascii?Q?hvVRw3z1qLwJnOGGnkVy5W4d3lLRy9XAmwdkQ6CrpR/URKgdvRjBgg7I/KT4?=
 =?us-ascii?Q?Sudc1GqkCBRd/HE1MHBUbCv3PEvWWmWN5p0hiC5pIpZO+hQRSt7pvwVXuGiy?=
 =?us-ascii?Q?+kbPytqKcSDO63NX1mQ/aF3SAjHd1G8hzgFVfxXrOWZ39D4ciOJ7Tg0s9wfS?=
 =?us-ascii?Q?aQu/XXGiqWOasHI++RLCqiVh+3GYPW/FqxtI1dppEqS+fbVtb3c457MymgE0?=
 =?us-ascii?Q?j2l/IgpnUjNt5H6G4x8L5I7aIZd2CK0ICmoZpKKy8ZxDRHA7QMlG5KSqHsxI?=
 =?us-ascii?Q?e+YWxx8wWivq+m2Z/DUgVetJDWxOJM36OYqRRvzDSAdo/YBoPs8dXat+S91v?=
 =?us-ascii?Q?NsIo/8bsis5Gchoskr29x7bmEtGknSnp0+WgCX4NhcRrWPIeCG9Gr2PTWtSO?=
 =?us-ascii?Q?h6b+Mcl5UqlPVT19Ie2fxcwC3uMlgudfnbtsjQIhKyhiOJxibUY3M1PaFVWU?=
 =?us-ascii?Q?gRpP3HG57DnuNfzGdY6yTmHwRmJTPcO+yKL93xVNFxz3tlaqza9vXFlbhUf9?=
 =?us-ascii?Q?ZRN61FCtgPsrk49vfRnFhxwK4LJXE37LuBCuGEzfUhmXQIqpT7jfMdmBHyCL?=
 =?us-ascii?Q?XtH6Y8UEatAkRoD+JGmZeq8SDBrnHhH3Wp3f89WXAVr5Q1mODnjLq3P4iEKR?=
 =?us-ascii?Q?nCCE/THb5CXh0wqbFX9+empwdWvEgI8IwWKx6yoNL/1pEIY/j5IU412rhKAz?=
 =?us-ascii?Q?5FnHVah+IyM9NN8f+PJtMx9pkhfcf1cOxaLJHq5U22gRbtWmSD+giZMZul8l?=
 =?us-ascii?Q?i63EUzg6FDAUaLt6kLzUcAW0HiTIFAn59k69NYeL4p4F1oY3HrA7YrrKCfj5?=
 =?us-ascii?Q?o/o2gP1ZaiBpIuyX0FSTd9hUtnKGKfXpPIbaCDOFyKlGVLQLHGHjusJgQBmb?=
 =?us-ascii?Q?4Hfz0moCabFUUKcAUQgPVZwK/RlWFdJUka1A6Gk7rd+jgwEBEBPOsidCPjNr?=
 =?us-ascii?Q?f8Q6akE9NmxRqMBq7XrK0UM4+WTU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7SPRMB0046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+06n61zIJaaQtpgb6xQ91DqP7NfwZ9FHNGIZDLpL0ebXVWzn6UYn5AK/2RKW?=
 =?us-ascii?Q?MjwGqwlHy2XRLotBwMTCn3lTnPoUQJ3cQ0Wrk93/WGNCEcZ2GMYOU/kHvRIG?=
 =?us-ascii?Q?6QEkm6PbttH5Q3Di0YfeRiCeIr3/bo3wfJ6dRqyhlV3VOhpoJMqyYu2fjYq6?=
 =?us-ascii?Q?9VANPOzUO+KvwgEsIcROHL0pSwNj9dGGAEmw0DQ8JkmzCYy7feFCbV8nTtzk?=
 =?us-ascii?Q?EAdQZGjcZr1r8qxS7lr++n/GjZX7hyt2H+aqoTq1K0jggLauK68nE8kBbKgf?=
 =?us-ascii?Q?X9WIw6YGGlUCjfPEPyTIP2UqSJLmrcPMbLfx3FSdlHQrbVHksiqGG4oZAOL1?=
 =?us-ascii?Q?+LhEc/4cJ2XBPG7Q/1mxWF6QZueY4ySE6ceyWgFQQ6infMdSd60Lp7/QuLN7?=
 =?us-ascii?Q?MxqyZYeYCJOhwquM0qndkY73XegFxNC3kv/MS2JGuj0/3JTje7GMjLWvC5jt?=
 =?us-ascii?Q?KaA0BUePTYZlnt+OsKczOk7I7F5Z585b3+sdZuOGnLTpLUbamxwrDSdowcEi?=
 =?us-ascii?Q?vdPeP/8uGauYjw+rhtHzJotg5bHmkRhnnzAu8bTLinBjrJ/u5k49ATbr/JFt?=
 =?us-ascii?Q?8yZ7jZnSRhsQ0z+1v7saqi6wZ3zpd4JunCMc/KkQWY71xGNGtSaIuhBc+CI6?=
 =?us-ascii?Q?8KZZMpYIaKDyE6qRinv3d+r4iq9rqVBv+uXqIJxHE8V6Kfo0w7utlyHEldsR?=
 =?us-ascii?Q?ok/cAfS7iDVcNTKC4voKs0OPCYzpUilNdZYbnqBfwrv0oHbZiZhlFxLylx4e?=
 =?us-ascii?Q?NiNGeUxIkzhAyhPvacYGkxQ8+0DJ6zql9JxBzA5IqfuhDLsjjXv5wA2WCuxq?=
 =?us-ascii?Q?bSQPCh+oFz7yjwO2oOnBfKdCAXFw+gF2cAOKAzZIbpdfyFHzyj1reS9TZzwg?=
 =?us-ascii?Q?jL9wIejGhjX9TaN2llf3grAWXuPeuIxm2DEgsAg09iI/JV+5A4fx/MS9oph0?=
 =?us-ascii?Q?QRaIfsddpZ/JZpApc0UhvfMGU3obnPoynBeLkuKR+Z+LdV0+8ONjksuRxUdm?=
 =?us-ascii?Q?KtfzjFlmLG6HCQfts1lXY+9cgVoYQx3zX6yJxfDwTpdgkcZ/DZAB0GX8Uutg?=
 =?us-ascii?Q?hbD5CeP6l+WZOaPR/Em80RiI4nPni9pUvBtnpBIpe8be57QOlwnKRM7J+Js6?=
 =?us-ascii?Q?TaouQUXe3oivnSPU2/QF/1iwVxbriPqfX3iSCxAiFtkCmqjsuhzKUkq/6H9K?=
 =?us-ascii?Q?aKTQPxQLSKG6JxloJEFEB2jcKyO/UZxztIfVAuLcu3lFFVSoh4vspJVJfRbC?=
 =?us-ascii?Q?pNKU5FbsonOM+ipZBQ5Gq6YKOmX2qAvZeXUeMxxQO9diI7wKbmR6gyykebsy?=
 =?us-ascii?Q?TanjfWvVFQBfTB9J2FdLlSKipRcAXPiYWsJfL/fEXhceg28oNvAYTYd6k6+j?=
 =?us-ascii?Q?krPeb4TBAleHCYx5AKzw63eKq694r8pB1mghx1GvjYmu6uV8bP2VGLQl1ady?=
 =?us-ascii?Q?LlCLzK3T1m2nhe5WLi2CGgjFJdzhdEBQgTxCdxF0Nd0wO/G6cvqwAK3WlSKa?=
 =?us-ascii?Q?Jv90HFgbKF/UY6HhOFj1iBpJa9f13rUn2L62vO8KcMiOPrxvM040ATsEtqSc?=
 =?us-ascii?Q?NUWWlOzw4NNq1OcpNyq0ZtholhZeRv8CA712MUew77NRbKKv1aqEkX0uj6r2?=
 =?us-ascii?Q?Fw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 61012d85-1b97-4fe9-6ed1-08dd4f74ffb3
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2025 17:03:28.3704 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oz7NBQaN2xgQUv4LWCpIdvT4HJjgsCKj/vaFauUqtmWZhg0NvXuiYbO8kiCuQQrAubmfH05q3QUBZ0OD2FVGcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6359
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

On Mon, Feb 17, 2025 at 10:56:22AM +0530, Riana Tauro wrote:
> 
> 
> On 2/15/2025 2:53 AM, Lucas De Marchi wrote:
> > There's an odd split between xe_pci.c and xe_device.c wrt
> > xe_survivability: it's initialized by xe_device, but then finalized by
> > xe_pci. Move it entirely to the outer layer, xe_pci, so it controls
> > the flow entirely.
> Hi Lucas
> 
> device_probe_early has other init calls that return error. And since this
> occurs only when pcode probe fails, added it there.

Well, you added to the right place considering that we wanted that
when pcode tells us to enter this mode with that BOOT_STATUS, but
I honestly like the expansion of the survivability mode to the other
errors coming out of the device_early_probe...

It will be easier when we add the module parameter to extend that even
further.

> 
> I hadn't added the fini in the devm_action because of the pci_set_drvdata.
> 
> As, the remove function is moved to devm_action. IMO it would be better
> if survivability_init stays in the err condition of pcode probe because if
> someone decides to move pcode_probe to some other function, it would be
> intuitive to move this too
> 
> Thanks
> Riana
> > 
> > This also allows to stop ignoring some of the errors. E.g.: if there's
> > an -ENOMEM, it shouldn't continue as if it survivability had been
> > enabled.
> > 
> > One change worth mentioning is that if "wait for lmem" fails, it will
> > also check the pcode status to decide if it should enter or not in
> > survivability mode, which it was not doing before. The bit from pcode
> > for that decision should remain the same after lmem failed
> > initialization, so it should be fine.
> > 
> > Cc: Riana Tauro <riana.tauro@intel.com>
> > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_device.c             |  7 +--
> >   drivers/gpu/drm/xe/xe_heci_gsc.c           |  2 +-
> >   drivers/gpu/drm/xe/xe_pci.c                | 16 ++---
> >   drivers/gpu/drm/xe/xe_survivability_mode.c | 73 +++++++++++-----------
> >   drivers/gpu/drm/xe/xe_survivability_mode.h |  5 +-
> >   5 files changed, 48 insertions(+), 55 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > index d88c0fddf0680..782ad564d0ba4 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -53,7 +53,6 @@
> >   #include "xe_pxp.h"
> >   #include "xe_query.h"
> >   #include "xe_sriov.h"
> > -#include "xe_survivability_mode.h"
> >   #include "xe_tile.h"
> >   #include "xe_ttm_stolen_mgr.h"
> >   #include "xe_ttm_sys_mgr.h"
> > @@ -695,12 +694,8 @@ int xe_device_probe_early(struct xe_device *xe)
> >   	update_device_info(xe);
> >   	err = xe_pcode_probe_early(xe);
> > -	if (err) {
> > -		if (xe_survivability_mode_required(xe))
> > -			xe_survivability_mode_init(xe);
> > -
> > +	if (err)
> >   		return err;
> > -	}
> >   	err = wait_for_lmem_ready(xe);
> >   	if (err)
> > diff --git a/drivers/gpu/drm/xe/xe_heci_gsc.c b/drivers/gpu/drm/xe/xe_heci_gsc.c
> > index 06dc78d3a8123..992ee47abcdb7 100644
> > --- a/drivers/gpu/drm/xe/xe_heci_gsc.c
> > +++ b/drivers/gpu/drm/xe/xe_heci_gsc.c
> > @@ -201,7 +201,7 @@ void xe_heci_gsc_init(struct xe_device *xe)
> >   		return;
> >   	}
> > -	if (!def->use_polling && !xe_survivability_mode_enabled(xe)) {
> > +	if (!def->use_polling && !xe_survivability_mode_is_enabled(xe)) {
> >   		ret = heci_gsc_irq_setup(xe);
> >   		if (ret)
> >   			goto fail;
> > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > index 447eacb355d7c..c18c58447d9fe 100644
> > --- a/drivers/gpu/drm/xe/xe_pci.c
> > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > @@ -775,8 +775,8 @@ static void xe_pci_remove(struct pci_dev *pdev)
> >   	if (IS_SRIOV_PF(xe))
> >   		xe_pci_sriov_configure(pdev, 0);
> > -	if (xe_survivability_mode_enabled(xe))
> > -		return xe_survivability_mode_remove(xe);
> > +	if (xe_survivability_mode_is_enabled(xe))
> > +		return;
> >   	xe_device_remove(xe);
> >   	xe_pm_runtime_fini(xe);
> > @@ -851,13 +851,13 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> >   	err = xe_device_probe_early(xe);
> >   	/*
> > -	 * In Boot Survivability mode, no drm card is exposed
> > -	 * and driver is loaded with bare minimum to allow
> > -	 * for firmware to be flashed through mei. Return
> > -	 * success if survivability mode is enabled.
> > +	 * In Boot Survivability mode, no drm card is exposed and driver is
> > +	 * loaded with bare minimum to allow for firmware to be flashed through
> > +	 * mei. Return success if survivability mode is enabled.
> >   	 */
> >   	if (err) {
> > -		if (xe_survivability_mode_enabled(xe))
> > +		if (xe_survivability_mode_required(xe) &&
> > +		    xe_survivability_mode_enable(xe))
> >   			return 0;
> >   		return err;
> > @@ -951,7 +951,7 @@ static int xe_pci_suspend(struct device *dev)
> >   	struct xe_device *xe = pdev_to_xe_device(pdev);
> >   	int err;
> > -	if (xe_survivability_mode_enabled(xe))
> > +	if (xe_survivability_mode_is_enabled(xe))
> >   		return -EBUSY;
> >   	err = xe_pm_suspend(xe);
> > diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
> > index 04a341606a7c5..7ba02e085b5b1 100644
> > --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
> > +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
> > @@ -127,40 +127,54 @@ static ssize_t survivability_mode_show(struct device *dev,
> >   static DEVICE_ATTR_ADMIN_RO(survivability_mode);
> > -static void enable_survivability_mode(struct pci_dev *pdev)
> > +static void xe_survivability_mode_fini(void *arg)
> > +{
> > +	struct xe_device *xe = arg;
> > +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> > +	struct device *dev = &pdev->dev;
> > +
> > +	sysfs_remove_file(&dev->kobj, &dev_attr_survivability_mode.attr);
> > +	xe_heci_gsc_fini(xe);
> > +}
> > +
> > +static int enable_survivability_mode(struct pci_dev *pdev)
> >   {
> >   	struct device *dev = &pdev->dev;
> >   	struct xe_device *xe = pdev_to_xe_device(pdev);
> >   	struct xe_survivability *survivability = &xe->survivability;
> >   	int ret = 0;
> > -	/* set survivability mode */
> > -	survivability->mode = true;
> > -	dev_info(dev, "In Survivability Mode\n");
> > -
> >   	/* create survivability mode sysfs */
> >   	ret = sysfs_create_file(&dev->kobj, &dev_attr_survivability_mode.attr);
> >   	if (ret) {
> >   		dev_warn(dev, "Failed to create survivability sysfs files\n");
> > -		return;
> > +		return ret;
> >   	}
> > +	ret = devm_add_action_or_reset(xe->drm.dev,
> > +				       xe_survivability_mode_fini, xe);
> > +	if (ret)
> > +		return ret;
> > +
> >   	xe_heci_gsc_init(xe);
> >   	xe_vsec_init(xe);
> > +
> > +	survivability->mode = true;
> > +	dev_err(dev, "In Survivability Mode\n");
> > +
> > +	return 0;
> >   }
> >   /**
> > - * xe_survivability_mode_enabled - check if survivability mode is enabled
> > + * xe_survivability_mode_is_enabled - check if survivability mode is enabled
> >    * @xe: xe device instance
> >    *
> >    * Returns true if in survivability mode, false otherwise
> >    */
> > -bool xe_survivability_mode_enabled(struct xe_device *xe)
> > +bool xe_survivability_mode_is_enabled(struct xe_device *xe)
> >   {
> > -	struct xe_survivability *survivability = &xe->survivability;
> > -
> > -	return survivability->mode;
> > +	return xe->survivability.mode;
> >   }
> >   /**
> > @@ -183,34 +197,19 @@ bool xe_survivability_mode_required(struct xe_device *xe)
> >   	data = xe_mmio_read32(mmio, PCODE_SCRATCH(0));
> >   	survivability->boot_status = REG_FIELD_GET(BOOT_STATUS, data);
> > -	return (survivability->boot_status == NON_CRITICAL_FAILURE ||
> > -		survivability->boot_status == CRITICAL_FAILURE);
> > +	return survivability->boot_status == NON_CRITICAL_FAILURE ||
> > +		survivability->boot_status == CRITICAL_FAILURE;
> >   }
> >   /**
> > - * xe_survivability_mode_remove - remove survivability mode
> > + * xe_survivability_mode_enable - Initialize and enable the survivability mode
> >    * @xe: xe device instance
> >    *
> > - * clean up sysfs entries of survivability mode
> > - */
> > -void xe_survivability_mode_remove(struct xe_device *xe)
> > -{
> > -	struct xe_survivability *survivability = &xe->survivability;
> > -	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> > -	struct device *dev = &pdev->dev;
> > -
> > -	sysfs_remove_file(&dev->kobj, &dev_attr_survivability_mode.attr);
> > -	xe_heci_gsc_fini(xe);
> > -	kfree(survivability->info);
> > -}
> > -
> > -/**
> > - * xe_survivability_mode_init - Initialize the survivability mode
> > - * @xe: xe device instance
> > + * Initialize survivability information and enable survivability mode
> >    *
> > - * Initializes survivability information and enables survivability mode
> > + * Return: 0 for success, negative error code otherwise.
> >    */
> > -void xe_survivability_mode_init(struct xe_device *xe)
> > +int xe_survivability_mode_enable(struct xe_device *xe)
> >   {
> >   	struct xe_survivability *survivability = &xe->survivability;
> >   	struct xe_survivability_info *info;
> > @@ -218,9 +217,10 @@ void xe_survivability_mode_init(struct xe_device *xe)
> >   	survivability->size = MAX_SCRATCH_MMIO;
> > -	info = kcalloc(survivability->size, sizeof(*info), GFP_KERNEL);
> > +	info = devm_kcalloc(xe->drm.dev, survivability->size, sizeof(*info),
> > +			    GFP_KERNEL);
> >   	if (!info)
> > -		return;
> > +		return -ENOMEM;
> >   	survivability->info = info;
> > @@ -229,9 +229,8 @@ void xe_survivability_mode_init(struct xe_device *xe)
> >   	/* Only log debug information and exit if it is a critical failure */
> >   	if (survivability->boot_status == CRITICAL_FAILURE) {
> >   		log_survivability_info(pdev);
> > -		kfree(survivability->info);
> > -		return;
> > +		return -ENXIO;
> >   	}
> > -	enable_survivability_mode(pdev);
> > +	return enable_survivability_mode(pdev);
> >   }
> > diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.h b/drivers/gpu/drm/xe/xe_survivability_mode.h
> > index f530507a22c62..f4df5f9025ce8 100644
> > --- a/drivers/gpu/drm/xe/xe_survivability_mode.h
> > +++ b/drivers/gpu/drm/xe/xe_survivability_mode.h
> > @@ -10,9 +10,8 @@
> >   struct xe_device;
> > -void xe_survivability_mode_init(struct xe_device *xe);
> > -void xe_survivability_mode_remove(struct xe_device *xe);
> > -bool xe_survivability_mode_enabled(struct xe_device *xe);
> > +int xe_survivability_mode_enable(struct xe_device *xe);
> > +bool xe_survivability_mode_is_enabled(struct xe_device *xe);
> >   bool xe_survivability_mode_required(struct xe_device *xe);
> >   #endif /* _XE_SURVIVABILITY_MODE_H_ */
> 
