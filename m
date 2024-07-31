Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 951CFC3DA49
	for <intel-xe@archiver.kernel.org>; Wed, 31 Jul 2024 01:34:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48E7410E050;
	Wed, 31 Jul 2024 01:34:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WpGpfPTh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3808F10E050
 for <intel-xe@lists.freedesktop.org>; Wed, 31 Jul 2024 01:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722389654; x=1753925654;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lyfFS4DxYU1XEe0ZEre+ZPVIpeO6HsvS5WsV5g6J/yU=;
 b=WpGpfPTh7u5ot5NaM/nRI70U+HOeiChXBDZlltiSbNju+GJFkBhmFwUn
 SnrKiSqe2CU8f2RC2FhjepYwVO+K0XH2O77lJjII/3c3oS1YM0RgnGbKT
 iSnGslJOkLBBtKD5VK6m9MvYAdv2Z+MmOv3Qtg06esRouyrJYVx7/HcD2
 PnclwCKPnwtQobxCt3F8QRPG1TD9MnyP66abHyQMgHeFLq3ygULuYRh5o
 G91C3US4N55KRYJoxGgGjtOR9gByX+FRr5gpoXahSHLrZdEsMLJ3ZOxhp
 sVQIkapRG+rUsinhkx8lugjIJTpMQfrxsbQzdz0yAu7/w26idr3u2uDmK g==;
X-CSE-ConnectionGUID: 83LwRsL1TlO3oCwlvJWJEQ==
X-CSE-MsgGUID: mgCvK3aWTcmLQLfnav0pYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="24109344"
X-IronPort-AV: E=Sophos;i="6.09,250,1716274800"; d="scan'208";a="24109344"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 18:34:12 -0700
X-CSE-ConnectionGUID: KRWp4kGJSPGlyRLF8/MGZQ==
X-CSE-MsgGUID: TxKLwxC8TOmceDP7fOGNIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,250,1716274800"; d="scan'208";a="54519650"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jul 2024 18:34:07 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 30 Jul 2024 18:34:04 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 30 Jul 2024 18:34:04 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 30 Jul 2024 18:34:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VTjjoatmDmg/A9nPt3VmFMkp4vY6MvokyrJVFmXMOTStlDKAEolpGEdak0NlwRLK2xFis4ew9E5b35GVJ1aalyfQf+FpektxgMUFUFuVbIrHY66YP5rqWPmSyxMP5G3S2Nspi6kFOf0YvB2rh/JJHnYpWVM6zUjzE6raDZIjekwRAnw5tCgQfBXmfjlOBUQN8JVJqDUsP4SxIc1yimzRTbxsIXLfhXfh9EClDLUirE8CGOJea9hs108E3nte7UbNbhqaI6HeKfNbvT0V9v/OoPTHt2Zrn9g74kwXj3aZk5u5cvIV8NapeYFIKTmijIl6791svZBC5+zLLAdfizf8MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y0k9sjMjyLsJ65U17B92CXJCH7bZP37tEKGLG/yzfQ4=;
 b=c7QcaiT09kNmgVAMLhzLqkOYp/MBsmpKzo1HWRYnSC8La/oOC0BXgfdNleUYhT+Fh7+aFmbnJe/wnmNHsZyjFfU8qrsQWz5oMFFIUCCImc6NSrzIzUmDSvoRxeqGbyKEAwDF/EKFDhDQctPi1w7jEwmSH3iEuLNQIhQrx/bLXqhuwRppsR3t39QrxUYDVlj622K0Ksm4873Werse3lmtiwHDJXhi9tb6bw3loCeN0JQ8I+XcNQy/7xzIzh7GTbBf4q0A1NNfQwKzJPzgtSyMWrhRw5l5xzlzVbV3jri6NkSf93ZTHqbiOgexHvptENrzaJcz2g5/eup2glNH5DaeYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN2PR11MB4712.namprd11.prod.outlook.com (2603:10b6:208:264::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Wed, 31 Jul
 2024 01:33:56 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7807.026; Wed, 31 Jul 2024
 01:33:56 +0000
Date: Wed, 31 Jul 2024 01:33:03 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 13/21] drm/xe/eudebug: Add UFENCE events with acks
Message-ID: <ZqmUT0TDY2Rsd6wp@DUT025-TGLU.fm.intel.com>
References: <20240726140818.54304-1-mika.kuoppala@linux.intel.com>
 <20240726140818.54304-14-mika.kuoppala@linux.intel.com>
 <ZqRB/aJGEiGWml+s@DUT025-TGLU.fm.intel.com>
 <87plqvt1p1.fsf@mkuoppal-desk>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87plqvt1p1.fsf@mkuoppal-desk>
X-ClientProxiedBy: BY3PR05CA0007.namprd05.prod.outlook.com
 (2603:10b6:a03:254::12) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN2PR11MB4712:EE_
X-MS-Office365-Filtering-Correlation-Id: 93d8a76b-3629-4458-fff4-08dcb100d7db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Zj12+l+G9/LL7w8whDsg8g6C79Dml0a68DHHrr+H0AG91OUFwJC7C1y+cly7?=
 =?us-ascii?Q?H/OD8uGknY4m1kAj+k/DiifwJ8tECm1tfwAX5TztXLQcG2ngPhTwjBY7CX7S?=
 =?us-ascii?Q?l2PlTY3f528RaxmW0fKsDc4pMyu/0TupQWLghG52Tw52ege8AZFJWeuA7gt+?=
 =?us-ascii?Q?XoohJlR2zSTKlXM6a3q1fia1MrESD9gfJVfPyqT/sOBKlI1jkdC3khr8roH0?=
 =?us-ascii?Q?nW95slwKn/4CBsOVqC1dq20pGQ6EqK7IqQD9Tk0ZZLqvzM40jjOb9tTDYuv9?=
 =?us-ascii?Q?JIA8nMNRa8ncc5WvkCyKtM8sS4r3iiR9r0zvygEx0LGr0qw/vBVEO68pCvV+?=
 =?us-ascii?Q?4j1OlcmGEEJjki0ojtKjp+dG+06hkP56vulrRHjUYHdgoM27w5Tk1qLL+bht?=
 =?us-ascii?Q?NamqhdEO6MTHHe72SPB/W2Et/GbcntVQhKl+cRhwYVhNkZyYxkJPXhVeBOJy?=
 =?us-ascii?Q?OqwsPnBrkvsKXjDXeVfSqH/92GrrwJfENwxAcRmuDPmw/dga5wF+NmJkTm4f?=
 =?us-ascii?Q?hcADcQqEQyefTMvWp6cgvf3oR+fA5wqIh+HoC1cpxz6f92eTiyktncC5Q63J?=
 =?us-ascii?Q?Kh+T1zVvZmlqndzigfNbiy6oYkQku4Is9SOgcmG7IbTV4uz7yCcjNCy7kEwR?=
 =?us-ascii?Q?FFU9y2h0yINmZkV8R0aQDHqq1OaDbZbke5Fdn302O75yOE/NBJG3/1TXmU2W?=
 =?us-ascii?Q?B6Z96OIqUzYwyRqqhTjWZgU9LSVdGrqPYmV2TxF0OvN9gf+IiVt58CnAix/m?=
 =?us-ascii?Q?JeC9JsFA21r1jmawL7ChIFyW516ApADc+8Bo4yHBvcvchkZn55x1n6QSFqHz?=
 =?us-ascii?Q?I63NEH9rxuTEOLFbjY13c5DCMectOHnMZztEXn4WiJHMFUpy9olWpnidCju5?=
 =?us-ascii?Q?kN1xBYxROWVEQNHpNyQQukaz1esorBm/hqXl+d8Uc4yNt2z/UQGEqgLXDZLx?=
 =?us-ascii?Q?RQcjTzEck5hea/M3j5/FoxZryR0Y912S2MKi5ZQ6npHfzKd5SO234Ywa6kT/?=
 =?us-ascii?Q?9rh6g+Ix+SH0DhpymoXMK8PeupauZjBx7Z81fH9ID3Hjsr/z+K597eBFrkId?=
 =?us-ascii?Q?0qrkiZob01syXo3J2emYahYzwn6d0t0Pt8fj5Del7PtSm+UxiZdGgfb/5uY7?=
 =?us-ascii?Q?kIf+rheKm4NDNOdT30VVU9R/eymYFPZ5wSWU6uXB4RWeMMputbPdWy0sk4DH?=
 =?us-ascii?Q?vEFqOBKHCcrjsBhG+n8uDvlP9C6oy6fzxywHBK7EgcJjpJj1jqN+W613HvG7?=
 =?us-ascii?Q?Pyd4lOupaD6XUcydnCSp0CWIYlF6+SDbKXbI8P28cofRHw/v4Tn1tPnR1K5V?=
 =?us-ascii?Q?re+lTjo+pCUoPZ7nqHJG+tLSG1fh997JoZ2rOw0wum9DxA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0Aanr08BciYAPNPxfVw+eas/q451YxtU6/AaInYEGf4rNbEp87DsiUUfYOjb?=
 =?us-ascii?Q?LNjojkB4HfAMYdOdfzmkWTX9CkyA+4JIOmj+1nfCRLXYmwAm6pj5LUInJl/t?=
 =?us-ascii?Q?tVNFVECp8mQI5vniC+J4UciX3OkOIONJWkt3o7VtiMoSDGQ6FRHaK1oKhWts?=
 =?us-ascii?Q?vpBXwgoISMI/NJ6z4U06Mr1f/75yQMSC+6soyQiBxEYZqclE12yKUkvRV9fv?=
 =?us-ascii?Q?IcM+VuOJjuFlrkqqrrCrjlwfba8GQcpgdZ1LywaU/fgJznw6UD7PSp+45Dk3?=
 =?us-ascii?Q?3M13h4ELWZVPrB65KWgwt5H/2WkvLE31kiYE6z8QKmShV3DBdwjn3RFq/UcR?=
 =?us-ascii?Q?lId8SKm7r6pcEUZD9R1nv1eGJ3c2LWqJsxfqLgszHsYBpjZMUgvGSqf2fu8y?=
 =?us-ascii?Q?/tAJX4KYz05zu3G++kfTywdyIegCtVsOr8QhaYQzpiEpwzxMmBj7D87dnUsV?=
 =?us-ascii?Q?8DnFgLA5Gsg9CzZT8k142tvPkqltx4acydJyj/R3rJ9dT953qlkelmFjbGrt?=
 =?us-ascii?Q?ZiFQnJBsl72t7gYFKwUPH/NwCjc/wvt8jvg99Tio8etbzd7KbwWU/eRnGPDq?=
 =?us-ascii?Q?4QL4p1A90Nrf1yL4zyAKlbuaE6+hQy3RC3opllStoLJrQyPqR8nJARuCUUWb?=
 =?us-ascii?Q?H1saDyfBpEunETlqlCbcwVYRf/ENwZWJVci8OthM6UVw8Iapyo0FyR0rNC4m?=
 =?us-ascii?Q?n91DCYVaJ2+7caMLRxV1pWJgYAYFpKM78AFlks9PnIA6KCoGLLC7b3r6Uwuu?=
 =?us-ascii?Q?prhn2GrRDg//BkviKyJoNLpn451u6UzNGY+Z/F01s3SS4zOYUCfn4PDxR0pP?=
 =?us-ascii?Q?UWKvcvchfyHAmMljoXbBr3VXImOwzPIDWXnHHmEnOahf0f5nMK5THwcaen+4?=
 =?us-ascii?Q?A1XaUwNSNQQvQK345OV/YBmiwsOgkkXrD8cjfI46m0CO6iiCldbsMza7Pmoo?=
 =?us-ascii?Q?8ZXLUBC4tUXqnxg/xt8RrTvcJMTvmL4DwMSOE62yQ0aIIM4Lck96h5vkfS9M?=
 =?us-ascii?Q?EsGkyqyhDAnpQUqnn4HolUBk8/VTN2Pti/lUQ69HcxG4VXwKyx62CAL/1cbK?=
 =?us-ascii?Q?DdQolE9PnNMFpjjPNAcDuf1OWmGxUPvqIlvfi0O89E9y6OxE0NLW/V9kXbcO?=
 =?us-ascii?Q?vB0nx1GjpTnblxVVYdyPezUzOpiccN5qbrPxHuqTxYZHI9J/YQ2mxn6Glsz8?=
 =?us-ascii?Q?fwfc4ljwNSUtZK8emwibnmrdV66J+OqC3zRnMw9TDfNDIN73zeGiRGuGFKAC?=
 =?us-ascii?Q?I48fnEjLGHgjWwox/AkNuPh36D8gkw84XGIUICWQwwl7ZzyjqOlIA6craX+z?=
 =?us-ascii?Q?j7ivVdhrwqWWweukYbXx/hK8TOCl2VdpIkpWr06St3BbiXJ5YzUbOsds/YD/?=
 =?us-ascii?Q?RG06h1ZVVQlCy+QWe9WmE5muMF7/TfioScASYrhF/ewKOUr67mAL5llx1QbF?=
 =?us-ascii?Q?h32APGBgbJB1cBkUkwIoxmwe/b4LHaVOPWpQ8Ou0sfO1zdr5mFBH/2Seyv7P?=
 =?us-ascii?Q?8kaTrA33BUXUUIhHobeCAwdlCCfkbUInr2oDwr3oF/yESFJxZHzGCagXZN8F?=
 =?us-ascii?Q?4K6Abf8Fzk4oAVvXHrizEV8lZ/IlwRPtiNQKK5bHJF2bfRcb659G9x52Jd5X?=
 =?us-ascii?Q?+Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 93d8a76b-3629-4458-fff4-08dcb100d7db
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 01:33:56.0483 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oMjT9fvdkv5w9TTahnafLbJzg6l8Hs+peJ5Hpse16Ao2IlQlzflotZ4z0WIWFNFBPP3Hr/NBNkJwnUy2GNCXrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4712
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

On Tue, Jul 30, 2024 at 05:05:30PM +0300, Mika Kuoppala wrote:
> Matthew Brost <matthew.brost@intel.com> writes:
> 
> > On Fri, Jul 26, 2024 at 05:08:10PM +0300, Mika Kuoppala wrote:
> >> When vma is in place, debugger needs to intercept before
> >> userspace proceeds with the workload. For example to install
> >> a breakpoint in a eu shader.
> >> 
> >> Attach debugger in xe_user_fence, send UFENCE event
> >> and stall normal user fence signal path to yield if
> >> there is debugger attached to ufence.
> >> 
> >> When ack (ioctl) is received for the corresponding seqno,
> >> signal ufence.
> >> 
> >> v2: ufence worker in own workqueue
> >> 
> >
> > Not a complete review again, just a couple of quick comments.
> >
> >> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> >> ---
> >>  drivers/gpu/drm/xe/xe_eudebug.c       | 239 +++++++++++++++++++++++++-
> >>  drivers/gpu/drm/xe/xe_eudebug.h       |   6 +
> >>  drivers/gpu/drm/xe/xe_eudebug_types.h |  12 ++
> >>  drivers/gpu/drm/xe/xe_exec.c          |   2 +-
> >>  drivers/gpu/drm/xe/xe_sync.c          |  49 ++++--
> >>  drivers/gpu/drm/xe/xe_sync.h          |   8 +-
> >>  drivers/gpu/drm/xe/xe_sync_types.h    |  26 ++-
> >>  drivers/gpu/drm/xe/xe_vm.c            |   4 +-
> >>  include/uapi/drm/xe_drm_eudebug.h     |  15 +-
> >>  9 files changed, 333 insertions(+), 28 deletions(-)
> >> 
> >> diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
> >> index 8f0e6a56a65e..5dcb7c9464e9 100644
> >> --- a/drivers/gpu/drm/xe/xe_eudebug.c
> >> +++ b/drivers/gpu/drm/xe/xe_eudebug.c
> >> @@ -35,6 +35,7 @@
> >>  #include "xe_vm.h"
> >>  #include "xe_wa.h"
> >>  #include "xe_force_wake.h"
> >> +#include "xe_sync.h"
> >>  
> >>  /*
> >>   * If there is no detected event read by userspace, during this period, assume
> >> @@ -240,11 +241,115 @@ static void xe_eudebug_free(struct kref *ref)
> >>  	kfree_rcu(d, rcu);
> >>  }
> >>  
> >> -static void xe_eudebug_put(struct xe_eudebug *d)
> >> +void xe_eudebug_put(struct xe_eudebug *d)
> >>  {
> >>  	kref_put(&d->ref, xe_eudebug_free);
> >>  }
> >>  
> >> +struct xe_eudebug_ack {
> >> +	struct rb_node rb_node;
> >> +	u64 seqno;
> >
> > Here we have a seqno but then an RB tree for search which is a bit
> > incongruent. Let me explain, seqno typically mean something which
> > signals sequentially in order. But then you have RB tree for searching,
> > if everything signaled in order a list would be sufficient.
> >
> > So without looking too much I think we want one of two things.
> >
> > 1. seqno + list
> > 2. key + rb tree
> >
> > Make sense?
> >
> > Kinda a nit but naming matters in this case as a name implies in-order
> > vs out-of-order signaling.
> 
> This is the seqno of event that was associated with ufence. If userspace
> does multiple binds with ufences, it can then pinpoint, with ack ioctl,
> the particular bind it wants to be released, with this seqno.
> 
> And userspace can ack out of sequence. As it can potentially
> receive events out of sequence.
>
> Would it help if it would be event_seqno instead of just seqno?

If userspace can ack out of sequence, I'd rename it 'event_id'.

So s/events.seqno/events.id too.

Does that work?

Matt

> 
> -Mika
> 
> >
> > Matt
> >
> >> +	u64 ts_insert;
> >> +	struct xe_user_fence *ufence;
> >> +};
> >> +
> >> +#define fetch_ack(x) rb_entry(x, struct xe_eudebug_ack, rb_node)
> >> +
> >> +static int compare_ack(const u64 a, const u64 b)
> >> +{
> >> +	if (a < b)
> >> +		return -1;
> >> +	else if (a > b)
> >> +		return 1;
> >> +
> >> +	return 0;
> >> +}
> >> +
> >> +static int ack_insert_cmp(struct rb_node * const node,
> >> +			  const struct rb_node * const p)
> >> +{
> >> +	return compare_ack(fetch_ack(node)->seqno,
> >> +			   fetch_ack(p)->seqno);
> >> +}
> >> +
> >> +static int ack_lookup_cmp(const void * const key,
> >> +			  const struct rb_node * const node)
> >> +{
> >> +	return compare_ack(*(const u64 *)key,
> >> +			   fetch_ack(node)->seqno);
> >> +}
> >> +
> >> +static struct xe_eudebug_ack *remove_ack(struct xe_eudebug *d, u64 seqno)
> >> +{
> >> +	struct rb_root * const root = &d->acks.tree;
> >> +	struct rb_node *node;
> >> +
> >> +	spin_lock(&d->acks.lock);
> >> +	node = rb_find(&seqno, root, ack_lookup_cmp);
> >> +	if (node)
> >> +		rb_erase(node, root);
> >> +	spin_unlock(&d->acks.lock);
> >> +
> >> +	if (!node)
> >> +		return NULL;
> >> +
> >> +	return rb_entry_safe(node, struct xe_eudebug_ack, rb_node);
> >> +}
> >> +
> >> +static void ufence_signal_worker(struct work_struct *w)
> >> +{
> >> +	struct xe_user_fence * const ufence =
> >> +		container_of(w, struct xe_user_fence, eudebug.worker);
> >> +
> >> +	if (READ_ONCE(ufence->signalled))
> >> +		xe_sync_ufence_signal(ufence);
> >> +
> >> +	xe_sync_ufence_put(ufence);
> >> +}
> >> +
> >> +static void kick_ufence_worker(struct xe_user_fence *f)
> >> +{
> >> +	INIT_WORK(&f->eudebug.worker, ufence_signal_worker);
> >> +	queue_work(f->xe->eudebug.ordered_wq, &f->eudebug.worker);
> >> +}
> >> +
> >> +static void handle_ack(struct xe_eudebug *d, struct xe_eudebug_ack *ack,
> >> +		       bool on_disconnect)
> >> +{
> >> +	struct xe_user_fence *f = ack->ufence;
> >> +	u64 signaller_ack, signalled_by;
> >> +
> >> +	signaller_ack = cmpxchg64(&f->eudebug.signalled_seqno, 0, ack->seqno);
> >> +	signalled_by = f->eudebug.signalled_seqno;
> >> +
> >> +	if (!signaller_ack)
> >> +		kick_ufence_worker(f);
> >> +	else
> >> +		xe_sync_ufence_put(f);
> >> +
> >> +	eu_dbg(d, "ACK: seqno=%llu: %ssignalled by %s (%llu) (held %lluus)",
> >> +	       ack->seqno, signaller_ack ? "already " : "",
> >> +	       on_disconnect ? "disconnect" : "debugger",
> >> +	       signalled_by,
> >> +	       ktime_us_delta(ktime_get(), ack->ts_insert));
> >> +
> >> +	kfree(ack);
> >> +}
> >> +
> >> +static void release_acks(struct xe_eudebug *d)
> >> +{
> >> +	struct xe_eudebug_ack *ack, *n;
> >> +	struct rb_root root;
> >> +
> >> +	spin_lock(&d->acks.lock);
> >> +	root = d->acks.tree;
> >> +	d->acks.tree = RB_ROOT;
> >> +	spin_unlock(&d->acks.lock);
> >> +
> >> +	rbtree_postorder_for_each_entry_safe(ack, n, &root, rb_node)
> >> +		handle_ack(d, ack, true);
> >> +}
> >> +
> >>  static struct task_struct *find_get_target(const pid_t nr)
> >>  {
> >>  	struct task_struct *task;
> >> @@ -328,6 +433,8 @@ static bool xe_eudebug_detach(struct xe_device *xe,
> >>  
> >>  	eu_dbg(d, "session %lld detached with %d", d->session, err);
> >>  
> >> +	release_acks(d);
> >> +
> >>  	/* Our ref with the connection_link */
> >>  	xe_eudebug_put(d);
> >>  
> >> @@ -428,7 +535,7 @@ static struct task_struct *find_task_get(struct xe_file *xef)
> >>  	return task;
> >>  }
> >>  
> >> -static struct xe_eudebug *
> >> +struct xe_eudebug *
> >>  xe_eudebug_get(struct xe_file *xef)
> >>  {
> >>  	struct task_struct *task;
> >> @@ -889,6 +996,44 @@ static long xe_eudebug_read_event(struct xe_eudebug *d,
> >>  	return ret;
> >>  }
> >>  
> >> +static long
> >> +xe_eudebug_ack_event_ioctl(struct xe_eudebug *d,
> >> +			   const unsigned int cmd,
> >> +			   const u64 arg)
> >> +{
> >> +	struct drm_xe_eudebug_ack_event __user * const user_ptr =
> >> +		u64_to_user_ptr(arg);
> >> +	struct drm_xe_eudebug_ack_event user_arg;
> >> +	struct xe_eudebug_ack *ack;
> >> +	struct xe_device *xe = d->xe;
> >> +
> >> +	if (XE_IOCTL_DBG(xe, _IOC_SIZE(cmd) < sizeof(user_arg)))
> >> +		return -EINVAL;
> >> +
> >> +	/* Userland write */
> >> +	if (XE_IOCTL_DBG(xe, !(_IOC_DIR(cmd) & _IOC_WRITE)))
> >> +		return -EINVAL;
> >> +
> >> +	if (XE_IOCTL_DBG(xe, copy_from_user(&user_arg,
> >> +					    user_ptr,
> >> +					    sizeof(user_arg))))
> >> +		return -EFAULT;
> >> +
> >> +	if (XE_IOCTL_DBG(xe, user_arg.flags))
> >> +		return -EINVAL;
> >> +
> >> +	if (XE_IOCTL_DBG(xe, xe_eudebug_detached(d)))
> >> +		return -ENOTCONN;
> >> +
> >> +	ack = remove_ack(d, user_arg.seqno);
> >> +	if (XE_IOCTL_DBG(xe, !ack))
> >> +		return -EINVAL;
> >> +
> >> +	handle_ack(d, ack, false);
> >> +
> >> +	return 0;
> >> +}
> >> +
> >>  static int do_eu_control(struct xe_eudebug *d,
> >>  			 const struct drm_xe_eudebug_eu_control * const arg,
> >>  			 struct drm_xe_eudebug_eu_control __user * const user_ptr)
> >> @@ -1070,7 +1215,10 @@ static long xe_eudebug_ioctl(struct file *file,
> >>  		ret = xe_eudebug_eu_control(d, arg);
> >>  		eu_dbg(d, "ioctl cmd=EU_CONTROL ret=%ld\n", ret);
> >>  		break;
> >> -
> >> +	case DRM_XE_EUDEBUG_IOCTL_ACK_EVENT:
> >> +		ret = xe_eudebug_ack_event_ioctl(d, cmd, arg);
> >> +		eu_dbg(d, "ioctl cmd=EVENT_ACK ret=%ld\n", ret);
> >> +		break;
> >>  	default:
> >>  		ret = -EINVAL;
> >>  	}
> >> @@ -1759,6 +1907,9 @@ xe_eudebug_connect(struct xe_device *xe,
> >>  	INIT_KFIFO(d->events.fifo);
> >>  	INIT_WORK(&d->discovery_work, discovery_work_fn);
> >>  
> >> +	spin_lock_init(&d->acks.lock);
> >> +	d->acks.tree = RB_ROOT;
> >> +
> >>  	d->res = xe_eudebug_resources_alloc();
> >>  	if (IS_ERR(d->res)) {
> >>  		err = PTR_ERR(d->res);
> >> @@ -2337,6 +2488,70 @@ static int vm_bind_op(struct xe_eudebug *d, struct xe_vm *vm,
> >>  	return 0;
> >>  }
> >>  
> >> +static int xe_eudebug_track_ufence(struct xe_eudebug *d,
> >> +				   struct xe_user_fence *f,
> >> +				   u64 seqno)
> >> +{
> >> +	struct xe_eudebug_ack *ack;
> >> +	struct rb_node *old;
> >> +
> >> +	ack = kzalloc(sizeof(*ack), GFP_KERNEL);
> >> +	if (!ack)
> >> +		return -ENOMEM;
> >> +
> >> +	ack->seqno = seqno;
> >> +	ack->ts_insert = ktime_get();
> >> +
> >> +	spin_lock(&d->acks.lock);
> >> +	old = rb_find_add(&ack->rb_node,
> >> +			  &d->acks.tree, ack_insert_cmp);
> >> +	if (!old) {
> >> +		kref_get(&f->refcount);
> >> +		ack->ufence = f;
> >> +	}
> >> +	spin_unlock(&d->acks.lock);
> >> +
> >> +	if (old) {
> >> +		eu_dbg(d, "ACK: seqno=%llu: already exists", seqno);
> >> +		kfree(ack);
> >> +		return -EEXIST;
> >> +	}
> >> +
> >> +	eu_dbg(d, "ACK: seqno=%llu: tracking started", seqno);
> >> +
> >> +	return 0;
> >> +}
> >> +
> >> +static int vm_bind_ufence_event(struct xe_eudebug *d,
> >> +				struct xe_user_fence *ufence)
> >> +{
> >> +	struct xe_eudebug_event *event;
> >> +	struct xe_eudebug_event_vm_bind_ufence *e;
> >> +	const u32 sz = sizeof(*e);
> >> +	const u32 flags = DRM_XE_EUDEBUG_EVENT_CREATE |
> >> +		DRM_XE_EUDEBUG_EVENT_NEED_ACK;
> >> +	u64 seqno;
> >> +	int ret;
> >> +
> >> +	seqno = atomic_long_inc_return(&d->events.seqno);
> >> +
> >> +	event = xe_eudebug_create_event(d, DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE,
> >> +					seqno, flags, sz, GFP_KERNEL);
> >> +	if (!event)
> >> +		return -ENOMEM;
> >> +
> >> +	e = cast_event(e, event);
> >> +
> >> +	write_member(struct drm_xe_eudebug_event_vm_bind_ufence,
> >> +		     e, vm_bind_ref_seqno, ufence->eudebug.bind_ref_seqno);
> >> +
> >> +	ret = xe_eudebug_track_ufence(d, ufence, seqno);
> >> +	if (!ret)
> >> +		ret = xe_eudebug_queue_event(d, event);
> >> +
> >> +	return ret;
> >> +}
> >> +
> >>  void xe_eudebug_vm_bind_start(struct xe_vm *vm)
> >>  {
> >>  	struct xe_eudebug *d;
> >> @@ -2507,6 +2722,24 @@ void xe_eudebug_vm_bind_end(struct xe_vm *vm, bool has_ufence, int bind_err)
> >>  		xe_eudebug_put(d);
> >>  }
> >>  
> >> +int xe_eudebug_vm_bind_ufence(struct xe_user_fence *ufence)
> >> +{
> >> +	struct xe_eudebug *d;
> >> +	int err;
> >> +
> >> +	d = ufence->eudebug.debugger;
> >> +	if (!d || xe_eudebug_detached(d))
> >> +		return -ENOTCONN;
> >> +
> >> +	err = vm_bind_ufence_event(d, ufence);
> >> +	if (err) {
> >> +		eu_err(d, "error %d on %s", err, __func__);
> >> +		xe_eudebug_disconnect(d, err);
> >> +	}
> >> +
> >> +	return 0;
> >> +}
> >> +
> >>  static int discover_client(struct xe_eudebug *d, struct xe_file *xef)
> >>  {
> >>  	struct xe_exec_queue *q;
> >> diff --git a/drivers/gpu/drm/xe/xe_eudebug.h b/drivers/gpu/drm/xe/xe_eudebug.h
> >> index 2cab90773b21..3de54802a6ca 100644
> >> --- a/drivers/gpu/drm/xe/xe_eudebug.h
> >> +++ b/drivers/gpu/drm/xe/xe_eudebug.h
> >> @@ -15,6 +15,7 @@ struct xe_vm;
> >>  struct xe_vma;
> >>  struct xe_exec_queue;
> >>  struct xe_hw_engine;
> >> +struct xe_user_fence;
> >>  
> >>  int xe_eudebug_connect_ioctl(struct drm_device *dev,
> >>  			     void *data,
> >> @@ -38,4 +39,9 @@ void xe_eudebug_vm_bind_start(struct xe_vm *vm);
> >>  void xe_eudebug_vm_bind_op_add(struct xe_vm *vm, u32 op, u64 addr, u64 range);
> >>  void xe_eudebug_vm_bind_end(struct xe_vm *vm, bool has_ufence, int err);
> >>  
> >> +int xe_eudebug_vm_bind_ufence(struct xe_user_fence *ufence);
> >> +
> >> +struct xe_eudebug *xe_eudebug_get(struct xe_file *xef);
> >> +void xe_eudebug_put(struct xe_eudebug *d);
> >> +
> >>  #endif
> >> diff --git a/drivers/gpu/drm/xe/xe_eudebug_types.h b/drivers/gpu/drm/xe/xe_eudebug_types.h
> >> index 1ffe33f15409..a32c51416b5f 100644
> >> --- a/drivers/gpu/drm/xe/xe_eudebug_types.h
> >> +++ b/drivers/gpu/drm/xe/xe_eudebug_types.h
> >> @@ -86,6 +86,7 @@ struct xe_eudebug_eu_control_ops {
> >>  	int (*stopped)(struct xe_eudebug *e, struct xe_exec_queue *q,
> >>  		       struct xe_lrc *lrc, u8 *bitmap, unsigned int bitmap_size);
> >>  };
> >> +
> >>  /**
> >>   * struct xe_eudebug - Top level struct for eudebug: the connection
> >>   */
> >> @@ -149,6 +150,12 @@ struct xe_eudebug {
> >>  		atomic_long_t seqno;
> >>  	} events;
> >>  
> >> +	/* user fences tracked by this debugger */
> >> +	struct {
> >> +		spinlock_t lock;
> >> +		struct rb_root tree;
> >> +	} acks;
> >> +
> >>  	/** @ops operations for eu_control */
> >>  	struct xe_eudebug_eu_control_ops *ops;
> >>  };
> >> @@ -286,4 +293,9 @@ struct xe_eudebug_event_vm_bind_op {
> >>  	u64 range; /* Zero for unmap all ? */
> >>  };
> >>  
> >> +struct xe_eudebug_event_vm_bind_ufence {
> >> +	struct xe_eudebug_event base;
> >> +	u64 vm_bind_ref_seqno;
> >> +};
> >> +
> >>  #endif
> >> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> >> index f36980aa26e6..400cb576f3b9 100644
> >> --- a/drivers/gpu/drm/xe/xe_exec.c
> >> +++ b/drivers/gpu/drm/xe/xe_exec.c
> >> @@ -157,7 +157,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> >>  	vm = q->vm;
> >>  
> >>  	for (num_syncs = 0; num_syncs < args->num_syncs; num_syncs++) {
> >> -		err = xe_sync_entry_parse(xe, xef, &syncs[num_syncs],
> >> +		err = xe_sync_entry_parse(xe, xef, vm, &syncs[num_syncs],
> >>  					  &syncs_user[num_syncs], SYNC_PARSE_FLAG_EXEC |
> >>  					  (xe_vm_in_lr_mode(vm) ?
> >>  					   SYNC_PARSE_FLAG_LR_MODE : 0));
> >> diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
> >> index 533246f42256..52d56bfdf932 100644
> >> --- a/drivers/gpu/drm/xe/xe_sync.c
> >> +++ b/drivers/gpu/drm/xe/xe_sync.c
> >> @@ -18,17 +18,7 @@
> >>  #include "xe_exec_queue.h"
> >>  #include "xe_macros.h"
> >>  #include "xe_sched_job_types.h"
> >> -
> >> -struct xe_user_fence {
> >> -	struct xe_device *xe;
> >> -	struct kref refcount;
> >> -	struct dma_fence_cb cb;
> >> -	struct work_struct worker;
> >> -	struct mm_struct *mm;
> >> -	u64 __user *addr;
> >> -	u64 value;
> >> -	int signalled;
> >> -};
> >> +#include "xe_eudebug.h"
> >>  
> >>  static void user_fence_destroy(struct kref *kref)
> >>  {
> >> @@ -36,6 +26,10 @@ static void user_fence_destroy(struct kref *kref)
> >>  						 refcount);
> >>  
> >>  	mmdrop(ufence->mm);
> >> +
> >> +	if (ufence->eudebug.debugger)
> >> +		xe_eudebug_put(ufence->eudebug.debugger);
> >> +
> >>  	kfree(ufence);
> >>  }
> >>  
> >> @@ -49,7 +43,10 @@ static void user_fence_put(struct xe_user_fence *ufence)
> >>  	kref_put(&ufence->refcount, user_fence_destroy);
> >>  }
> >>  
> >> -static struct xe_user_fence *user_fence_create(struct xe_device *xe, u64 addr,
> >> +static struct xe_user_fence *user_fence_create(struct xe_device *xe,
> >> +					       struct xe_file *xef,
> >> +					       struct xe_vm *vm,
> >> +					       u64 addr,
> >>  					       u64 value)
> >>  {
> >>  	struct xe_user_fence *ufence;
> >> @@ -58,7 +55,7 @@ static struct xe_user_fence *user_fence_create(struct xe_device *xe, u64 addr,
> >>  	if (!access_ok(ptr, sizeof(ptr)))
> >>  		return ERR_PTR(-EFAULT);
> >>  
> >> -	ufence = kmalloc(sizeof(*ufence), GFP_KERNEL);
> >> +	ufence = kzalloc(sizeof(*ufence), GFP_KERNEL);
> >>  	if (!ufence)
> >>  		return ERR_PTR(-ENOMEM);
> >>  
> >> @@ -69,12 +66,17 @@ static struct xe_user_fence *user_fence_create(struct xe_device *xe, u64 addr,
> >>  	ufence->mm = current->mm;
> >>  	mmgrab(ufence->mm);
> >>  
> >> +	if (vm->eudebug_bind.ref) {
> >> +		ufence->eudebug.debugger = xe_eudebug_get(xef);
> >> +		ufence->eudebug.bind_ref_seqno = vm->eudebug_bind.ref;
> >> +	}
> >> +
> >>  	return ufence;
> >>  }
> >>  
> >> -static void user_fence_worker(struct work_struct *w)
> >> +void xe_sync_ufence_signal(struct xe_user_fence *ufence)
> >>  {
> >> -	struct xe_user_fence *ufence = container_of(w, struct xe_user_fence, worker);
> >> +	XE_WARN_ON(!ufence->signalled);
> >>  
> >>  	if (mmget_not_zero(ufence->mm)) {
> >>  		kthread_use_mm(ufence->mm);
> >> @@ -85,7 +87,20 @@ static void user_fence_worker(struct work_struct *w)
> >>  	}
> >>  
> >>  	wake_up_all(&ufence->xe->ufence_wq);
> >> +}
> >> +
> >> +static void user_fence_worker(struct work_struct *w)
> >> +{
> >> +	struct xe_user_fence *ufence = container_of(w, struct xe_user_fence, worker);
> >> +	int ret;
> >> +
> >>  	WRITE_ONCE(ufence->signalled, 1);
> >> +
> >> +	/* Lets see if debugger wants to track this */
> >> +	ret = xe_eudebug_vm_bind_ufence(ufence);
> >> +	if (ret)
> >> +		xe_sync_ufence_signal(ufence);
> >> +
> >>  	user_fence_put(ufence);
> >>  }
> >>  
> >> @@ -104,6 +119,7 @@ static void user_fence_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
> >>  }
> >>  
> >>  int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
> >> +			struct xe_vm *vm,
> >>  			struct xe_sync_entry *sync,
> >>  			struct drm_xe_sync __user *sync_user,
> >>  			unsigned int flags)
> >> @@ -185,7 +201,8 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
> >>  		if (exec) {
> >>  			sync->addr = sync_in.addr;
> >>  		} else {
> >> -			sync->ufence = user_fence_create(xe, sync_in.addr,
> >> +			sync->ufence = user_fence_create(xe, xef, vm,
> >> +							 sync_in.addr,
> >>  							 sync_in.timeline_value);
> >>  			if (XE_IOCTL_DBG(xe, IS_ERR(sync->ufence)))
> >>  				return PTR_ERR(sync->ufence);
> >> diff --git a/drivers/gpu/drm/xe/xe_sync.h b/drivers/gpu/drm/xe/xe_sync.h
> >> index 256ffc1e54dc..f5bec2b1b4f6 100644
> >> --- a/drivers/gpu/drm/xe/xe_sync.h
> >> +++ b/drivers/gpu/drm/xe/xe_sync.h
> >> @@ -9,8 +9,12 @@
> >>  #include "xe_sync_types.h"
> >>  
> >>  struct xe_device;
> >> -struct xe_exec_queue;
> >>  struct xe_file;
> >> +struct xe_exec_queue;
> >> +struct drm_syncobj;
> >> +struct dma_fence;
> >> +struct dma_fence_chain;
> >> +struct drm_xe_sync;
> >>  struct xe_sched_job;
> >>  struct xe_vm;
> >>  
> >> @@ -19,6 +23,7 @@ struct xe_vm;
> >>  #define SYNC_PARSE_FLAG_DISALLOW_USER_FENCE	BIT(2)
> >>  
> >>  int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
> >> +			struct xe_vm *vm,
> >>  			struct xe_sync_entry *sync,
> >>  			struct drm_xe_sync __user *sync_user,
> >>  			unsigned int flags);
> >> @@ -40,5 +45,6 @@ struct xe_user_fence *__xe_sync_ufence_get(struct xe_user_fence *ufence);
> >>  struct xe_user_fence *xe_sync_ufence_get(struct xe_sync_entry *sync);
> >>  void xe_sync_ufence_put(struct xe_user_fence *ufence);
> >>  int xe_sync_ufence_get_status(struct xe_user_fence *ufence);
> >> +void xe_sync_ufence_signal(struct xe_user_fence *ufence);
> >>  
> >>  #endif
> >> diff --git a/drivers/gpu/drm/xe/xe_sync_types.h b/drivers/gpu/drm/xe/xe_sync_types.h
> >> index 30ac3f51993b..907c601a6d8c 100644
> >> --- a/drivers/gpu/drm/xe/xe_sync_types.h
> >> +++ b/drivers/gpu/drm/xe/xe_sync_types.h
> >> @@ -7,12 +7,28 @@
> >>  #define _XE_SYNC_TYPES_H_
> >>  
> >>  #include <linux/types.h>
> >> +#include <linux/spinlock.h>
> >> +#include <linux/kref.h>
> >> +#include <linux/dma-fence-array.h>
> >>  
> >> -struct drm_syncobj;
> >> -struct dma_fence;
> >> -struct dma_fence_chain;
> >> -struct drm_xe_sync;
> >> -struct user_fence;
> >> +struct xe_eudebug;
> >> +
> >> +struct xe_user_fence {
> >> +	struct xe_device *xe;
> >> +	struct kref refcount;
> >> +	struct dma_fence_cb cb;
> >> +	struct work_struct worker;
> >> +	struct mm_struct *mm;
> >> +	u64 __user *addr;
> >> +	u64 value;
> >> +	int signalled;
> >> +	struct {
> >> +		struct xe_eudebug *debugger;
> >> +		u64 bind_ref_seqno;
> >> +		u64 signalled_seqno;
> >> +		struct work_struct worker;
> >> +	} eudebug;
> >> +};
> >>  
> >>  struct xe_sync_entry {
> >>  	struct drm_syncobj *syncobj;
> >> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> >> index 657a54b74eea..b117a892e386 100644
> >> --- a/drivers/gpu/drm/xe/xe_vm.c
> >> +++ b/drivers/gpu/drm/xe/xe_vm.c
> >> @@ -3049,9 +3049,11 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> >>  		}
> >>  	}
> >>  
> >> +	xe_eudebug_vm_bind_start(vm);
> >> +
> >>  	syncs_user = u64_to_user_ptr(args->syncs);
> >>  	for (num_syncs = 0; num_syncs < args->num_syncs; num_syncs++) {
> >> -		err = xe_sync_entry_parse(xe, xef, &syncs[num_syncs],
> >> +		err = xe_sync_entry_parse(xe, xef, vm, &syncs[num_syncs],
> >>  					  &syncs_user[num_syncs],
> >>  					  (xe_vm_in_lr_mode(vm) ?
> >>  					   SYNC_PARSE_FLAG_LR_MODE : 0) |
> >> diff --git a/include/uapi/drm/xe_drm_eudebug.h b/include/uapi/drm/xe_drm_eudebug.h
> >> index 789c8aa81c09..1875192e92bd 100644
> >> --- a/include/uapi/drm/xe_drm_eudebug.h
> >> +++ b/include/uapi/drm/xe_drm_eudebug.h
> >> @@ -17,6 +17,7 @@ extern "C" {
> >>   */
> >>  #define DRM_XE_EUDEBUG_IOCTL_READ_EVENT		_IO('j', 0x0)
> >>  #define DRM_XE_EUDEBUG_IOCTL_EU_CONTROL		_IOWR('j', 0x2, struct drm_xe_eudebug_eu_control)
> >> +#define DRM_XE_EUDEBUG_IOCTL_ACK_EVENT		_IOW('j', 0x4, struct drm_xe_eudebug_ack_event)
> >>  
> >>  /* XXX: Document events to match their internal counterparts when moved to xe_drm.h */
> >>  struct drm_xe_eudebug_event {
> >> @@ -31,7 +32,8 @@ struct drm_xe_eudebug_event {
> >>  #define DRM_XE_EUDEBUG_EVENT_EU_ATTENTION	5
> >>  #define DRM_XE_EUDEBUG_EVENT_VM_BIND		6
> >>  #define DRM_XE_EUDEBUG_EVENT_VM_BIND_OP		7
> >> -#define DRM_XE_EUDEBUG_EVENT_MAX_EVENT		DRM_XE_EUDEBUG_EVENT_VM_BIND_OP
> >> +#define DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE	8
> >> +#define DRM_XE_EUDEBUG_EVENT_MAX_EVENT		DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE
> >>  
> >>  	__u16 flags;
> >>  #define DRM_XE_EUDEBUG_EVENT_CREATE		(1 << 0)
> >> @@ -158,6 +160,17 @@ struct drm_xe_eudebug_event_vm_bind_op {
> >>  	__u64 range; /* XXX: Zero for unmap all? */
> >>  };
> >>  
> >> +struct drm_xe_eudebug_event_vm_bind_ufence {
> >> +	struct drm_xe_eudebug_event base;
> >> +	__u64 vm_bind_ref_seqno; /* *_event_vm_bind.base.seqno */
> >> +};
> >> +
> >> +struct drm_xe_eudebug_ack_event {
> >> +	__u32 type;
> >> +	__u32 flags; /* MBZ */
> >> +	__u64 seqno;
> >> +};
> >> +
> >>  #if defined(__cplusplus)
> >>  }
> >>  #endif
> >> -- 
> >> 2.34.1
> >> 
