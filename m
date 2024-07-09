Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA64BC2BD09
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jul 2024 20:38:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58AED10E078;
	Tue,  9 Jul 2024 20:38:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xcnkf/s9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99D5210E078
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jul 2024 20:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720557488; x=1752093488;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1I5goa8rypss70uZz74P4u4wpRcUlarcxIUbf6OguZ0=;
 b=Xcnkf/s9DSseYa7p5mkRctO0eNt1fnDzdJB2HRskbcIhxBDCbB1XnpMf
 yVEkRj9N3Kg49+X83GFmF9rrPYdV0IzALAcaGr4+TvKp88JthGqdk5bnC
 wD2wPJzrowFEPvd6Z0G5XKFdPfZF0f1wMBzzbnf/cBAoTOAYGhz0OxnrP
 LDy5jBUAluKBpug2LOxkqM9zyBOe1ZokmH0OhhLKJB6zWKgl5lmcUxpNS
 BZzQRGoXqMopXvu0hYTivamFsk5Sp+96CZhrxnOdCA34yaBLO47PUkA16
 TfpwoasGuImAnJ7LZCIV2ZwvYPuvlrZ5ylQzFwuuSgqOVCfqfMGMPi2UV Q==;
X-CSE-ConnectionGUID: 25mMqG0FTamhaJjMxBSfFg==
X-CSE-MsgGUID: pfY478vwT/yzU2gSGSkJIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="21715456"
X-IronPort-AV: E=Sophos;i="6.09,196,1716274800"; d="scan'208";a="21715456"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 13:38:07 -0700
X-CSE-ConnectionGUID: X4b67PmaRvmuPPgXHOWkXw==
X-CSE-MsgGUID: 4gFeRUIlQO2HHIFrBLfp/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,196,1716274800"; d="scan'208";a="52275267"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jul 2024 13:38:05 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 9 Jul 2024 13:38:04 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 9 Jul 2024 13:38:04 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 9 Jul 2024 13:38:04 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 9 Jul 2024 13:38:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U+MeLa3sLPI6BQ3Y6yU2Vr6oli8xAMnAl5XiYz+Y3mw/e4pZ28YewEkTqExUMTynCt2tYlzTB4qrkPH7dsQRyw4gbcZBQszE2h7xa1f8N6gP4vygkccZW1XAp1nK+5VCbyqnaUJw7Z7lgpZ1uePvokvvOsY2Ot/LZjttvzSjCaPMbtCOTeHpYfJPX2fvwRb2qfO2wJOfyrYUnpf7Dvke/+5Oo3ibvQFfIs0vPbQpmExwvV5hJH4DIi/7NeKpW+u0QJCFM8Ui9hNnFJngqaJzd1Jpd4kLKjIaTtmCrDVVwR1+g03ANSOaWEV9zOZ93BplB+s+Q13kDRpOQMmeD+d9Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dkAY2PMmdi4D40LUBCrih2eEEO3Rd7hg4QronnscsiE=;
 b=gHtaxH7tDUONf1dJV2HqzrVFCwrVKf9yOczq0icLToIQYyuckhx56KGNzIfvhWAQHXlLE9/lSo86M+PVIqPh6T5kmCctYv2hM48kusKwJtW+dcEQ+RTw9cjK1u60TLCdkuoWIjnUl7rsSj50kbA1iQcrcjJ86HcCXMGtuOVEJtUkilmafeYWkHhcYpsdKWdl5a05uOei9UZv3suaZFZYPwTAmnZ/6l5pNlvfiEdfCBpMjNPoGQzYNEzs1W+3d48+U9azsQaHezowcxTI2oJwhU4Uk+eOOXOSn4zo2OXoDXXpjWBBhwFklE3z3wnfL8aNZmhil8gTbbwevZJH7T9aFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by MW3PR11MB4698.namprd11.prod.outlook.com (2603:10b6:303:5a::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Tue, 9 Jul
 2024 20:38:02 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.7741.033; Tue, 9 Jul 2024
 20:38:02 +0000
Date: Tue, 9 Jul 2024 20:37:10 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/5] drm/xe: Add ref counting for xe_file
Message-ID: <Zo2fdoxSExq8NF12@DUT025-TGLU.fm.intel.com>
References: <20240708202103.3347869-1-umesh.nerlige.ramappa@intel.com>
 <20240708202103.3347869-3-umesh.nerlige.ramappa@intel.com>
 <5vo72c55ibxeyhyokdmr7ogilf25fo6jk7hht3vkc7ekkixgpl@tmdzibnr3mjz>
 <Zox1iBxWvN7GtG2Z@orsosgc001>
 <ZoyEO5sqdnuWzKH6@DUT025-TGLU.fm.intel.com>
 <mxnhwrka3iarajprb75wvsbeem3kxv4yxkxujqjgirkyghr3pv@i5cxlljd6j2j>
 <Zo1nYs4AA1Hp0QQH@orsosgc001>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Zo1nYs4AA1Hp0QQH@orsosgc001>
X-ClientProxiedBy: BYAPR21CA0013.namprd21.prod.outlook.com
 (2603:10b6:a03:114::23) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|MW3PR11MB4698:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a719e32-5098-4d4b-0d28-08dca05706de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+RhXQ/79oU16R5rLHXL450BXvyVauwHRVgpHVMjfoQjjBnwb9zbYsi0XnRPL?=
 =?us-ascii?Q?/lTW4ZDm5r/Bs4M7Z89aNMG26GpijEJxssVoGYRTLblht1mBEYmlVaITOomx?=
 =?us-ascii?Q?YXRg6Mjw1nZacg01uD7hD+a6ym5+oafRwIfgulfX8dgoYt4/XJeNgQ3Si3Nv?=
 =?us-ascii?Q?/QRfDkjwlkD1WMe+lE3AW9t8TLMj1lXL76X6F+z+ydKqLunQr5UECwnagSWf?=
 =?us-ascii?Q?a9U7BSOFK1ANuYkBqxVFLbuBmARbt+tQUfq7zCX5jraSXal1WfkOLvpfvE+6?=
 =?us-ascii?Q?X0kkJ2JMhvLfAEqpyuKmPVsxpkOzHt23rmIr1kmjYPJsXkZVkNZVduOzKzpK?=
 =?us-ascii?Q?/977OUIc4EnmV/o15feWAnQe15xUT9u/r1qZfJf0KSf6+J/9HNcpfGE/tCSe?=
 =?us-ascii?Q?VPvR2ORCwGJwBq4L3iuk3YoFOa14ggCWl2jw9m7OYLMYn0RwOjSZQ7wgOcYr?=
 =?us-ascii?Q?8/pK9RywXukR5AhAD0aR2bsFXsTl2s1R+mHOtwCkZsnPIs4xFqqK4NS8B0/4?=
 =?us-ascii?Q?vhU1gakrilmkX/ABjkDserTIL52B4Ha+jPKuFBQNi1pHYqsaIYspYUrR0usb?=
 =?us-ascii?Q?/xEz4btl++zLM+ro+p/6jqbTHAQgVZh+h2ytrMD8Od1lDaCeGhkxJkjzGJ3J?=
 =?us-ascii?Q?DqaHJm7VPso7SJD7iK96rbkUEQ/ZChmt6/iwpgruLrUNV73DcbOjaKbLLqaw?=
 =?us-ascii?Q?f6BGH1aE45tIgDXoVulDNH3/IBOnbclJxm4ch8rF8Y29I/vw8YlB2Gy9NHwB?=
 =?us-ascii?Q?TDJLMOWYvm7fc3PVKLGtCJK6TCBMyG67OVGpY+Tz5Y2RFZLQCijyobhzRR/A?=
 =?us-ascii?Q?oZP1WxNvbrTCmmE11G092CDYleqWEHrn9UI8Q5N3UOEAqCmbxaFZjD6h1STr?=
 =?us-ascii?Q?CEzdMtdl6jtPuPmz7ZO//bAikrgoZODyvNevsnfkHVC6RBUKfx9GS/uYb2Vb?=
 =?us-ascii?Q?CW7wwPKPzmk5fkMlcrog5faC0wvUueH1Q4vCo7XkCQ7tSR4pCqAJmn9n9rIB?=
 =?us-ascii?Q?6RZ468JVL0GF/tsLa9Gwg2pRH9bE2hPUFWxUNs0am1GLAQMuzsbATctnJxI3?=
 =?us-ascii?Q?1N0WX0LOevUmzxBDoPuZzlvCLDm6D42ILDY88RezTCEHRMhedrJ8CIZYlChn?=
 =?us-ascii?Q?V2x2CAJmyom/693CxMxaM4b9V0KiaHTry192Y/lB5uFlQv4FsX/sLNObHQXs?=
 =?us-ascii?Q?57sbP4ewn2RM3c6JPVZBHtqXfEQV20FH35H0JRayPhMou3md00wZB20gzQ7u?=
 =?us-ascii?Q?xGA0dtzc+UeJqiSLRSQh5vFta7w6/K37way0uvDSwNUbjV1vIzbRFVvtxVBx?=
 =?us-ascii?Q?NjhWhHflPc45n5wjRvr0JthxOVH43k44/PwsnW+9oVONIg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WeEL9WMw1J/rcvxBUE7BJolktg/4UYeJaF9qYKQzoshSamjGR6sX0/EB1G5l?=
 =?us-ascii?Q?TqPKQ1jXDpL3OlqbszCRffuDUhEePidPkrlK7D02V9ldsVfH8Psi9k9Q1GV0?=
 =?us-ascii?Q?EyKzN05nz+dSP6qmcZA20CxG/wdT3Dowd9F+nhXFNSaMKWK8EksKhKvuDEL9?=
 =?us-ascii?Q?bTO4SSuvnattH/b9456gvv4D0LrLXNzHJ8z7Tms/EuWzLAqHL+wMPp7JFmTz?=
 =?us-ascii?Q?+dMxea4K9/2JMT/7RutgzvKItAaLqftzjTv9/moTyRZDXpR9833baTEpmb6v?=
 =?us-ascii?Q?0TK3lojjoYjshzzi9zNW7Ik/X6yOZBhYw5IGr2uvw9gds7ba0vnMFD+8ytpf?=
 =?us-ascii?Q?J69UIuXfrc0SCOFBKCjjCn8lmf3qcDvyPg6Tz1G+MbXTlOZyOst81I5CPSLD?=
 =?us-ascii?Q?o9HIbvjDp8kLGiFFKZuUZ9KJglUwkR0xuX0VGo405SHeLuRGTzDeiO9tppBI?=
 =?us-ascii?Q?WS8dZLCctEsU0kvXmwUwFYkpMjEVt0at3w4z69GoJsrL1kuEiQ0sQ2iRtml4?=
 =?us-ascii?Q?p4AbekO/oDf97IHYkA99toSpN3FmTSSKjycCrdcd3VQTMoBNJW7Py8BoSGkp?=
 =?us-ascii?Q?t/JPCFlsMw6eyXQli4HZO7fjAhG+aLFI5ezdeEMnMhIQ5rpCIzbu0TsPumx+?=
 =?us-ascii?Q?pV5ksGdhQ/bkzRj3G/+ErZU2+rJ3Ge0K3Z5rqwtODyl3Ep1Gq0+wxpDQlR1U?=
 =?us-ascii?Q?Kxh1op+lMoPa1hl1sklFKCsYSk1WM0om4fkkgN4ePDbWAU1RZ6RUOoAer/bp?=
 =?us-ascii?Q?6iuNZWglEZ0bpPp3PVKJNgAwS/9avF2KtJAkroHi97X88PfuMeRZX1m5c0Wf?=
 =?us-ascii?Q?ZXeZ/3iGpwV5MfvgNSWcrbfdi9LdlhbvYAg+XlOiJNq0MrpC44vKSizfr2vv?=
 =?us-ascii?Q?9+9V9p74BtK3emZ/Nwp1SNBz5IsE5GTE+MQKUqnXZXcZZMJUHgHNZTWgT+Zo?=
 =?us-ascii?Q?XMTrif6fPkr7U+0n81r59nhU81WnYoCYUCAWutUEQg3T4bwtSpdmhJ9VGwpM?=
 =?us-ascii?Q?NlBRlJWBGIyXHSX0Bav5Sjr4uRwyr1hNCGeH0tDtpLpaPHezZJS/ZqzXrGiY?=
 =?us-ascii?Q?vg9ZTOOapac3r/dJx4E74WhDlVM/41a94Hxla6Qj5TsJQfo0tH0uIh7s8DFI?=
 =?us-ascii?Q?oQsPaJ1ypygHlentuEbioeXe9FURON7ang6mLr6cLDWVV29v5F/DwmIy9yp8?=
 =?us-ascii?Q?ni9RmZjaNMbtcW0MYRSx+ZNSsCru5dMfd2p+3O90gebbqmZi87S3FN+QP9o1?=
 =?us-ascii?Q?hjno6ybYwhvyB8BzD166WtWmJtcMdEoK+sk7hGbx/6VLe2sn/CBB8PJkqal9?=
 =?us-ascii?Q?hTxLYZy9nVDl1wi7KZH4vxB1gHa7qh2fk0zQIPvuZ0LQO5BuqelY4fbxMUJL?=
 =?us-ascii?Q?+rWlFCMUuBTzK6UDdUgJue7YVAhX+YqOIBwfpwJWlVggYJH20Rs8n3VuJd6c?=
 =?us-ascii?Q?ilJRjAFH+x/jHXAvwz4q52363yBim7h5pNCAo0H/8ogOdwQHD8CLyeNMOB2f?=
 =?us-ascii?Q?0Yo3q5db7n9m6vOcjo4zlcQEqJXjqH2tXrY/VpL3n3Ssvwu/7ZZi17cKrV6o?=
 =?us-ascii?Q?oCo9G6IepiZm5UGeTf/psfq9edlGb0h7dr407o9LMuTKqy21kP0oDn1zBA7Q?=
 =?us-ascii?Q?Mw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a719e32-5098-4d4b-0d28-08dca05706de
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 20:38:01.9270 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gXx8pkX1Ab/ZrCf3FbzEZABgx3LbaAXZae+DwpK2DrunGTMdRHLpuKPWWfwNcoi5ceqyEgAok6SG7tk3I6+PhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4698
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

On Tue, Jul 09, 2024 at 09:37:54AM -0700, Umesh Nerlige Ramappa wrote:
> On Tue, Jul 09, 2024 at 10:11:47AM -0500, Lucas De Marchi wrote:
> > On Tue, Jul 09, 2024 at 12:28:43AM GMT, Matthew Brost wrote:
> > > On Mon, Jul 08, 2024 at 04:26:00PM -0700, Umesh Nerlige Ramappa wrote:
> > > > On Mon, Jul 08, 2024 at 05:52:00PM -0500, Lucas De Marchi wrote:
> > > > > On Mon, Jul 08, 2024 at 01:21:00PM GMT, Umesh Nerlige Ramappa wrote:
> > > > > > Add ref counting for xe_file.
> > > > > >
> > > > > > Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> > > > > > ---
> > > > > > drivers/gpu/drm/xe/xe_device.c       |  7 +++++--
> > > > > > drivers/gpu/drm/xe/xe_device.h       | 12 ++++++++++++
> > > > > > drivers/gpu/drm/xe/xe_device_types.h |  3 +++
> > > > > > 3 files changed, 20 insertions(+), 2 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > > > > > index babb697652d5..e6eacf1bcce0 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_device.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_device.c
> > > > > > @@ -87,11 +87,14 @@ static int xe_file_open(struct drm_device *dev, struct drm_file *file)
> > > > > > 	spin_unlock(&xe->clients.lock);
> > > > > >
> > > > > > 	file->driver_priv = xef;
> > > > > > +	kref_init(&xef->refcount);
> > > > > > +
> > > > > > 	return 0;
> > > > > > }
> > > > > >
> > > > > > -static void xe_file_destroy(struct xe_file *xef)
> > > > > > +void xe_file_destroy(struct kref *ref)
> > > > > 
> > > > > why do you export this?  I don't think anybody should be calling
> > > > > xe_file_destroy() directly and this function being executed should only
> > > > > be the outcome of kref being 0. Also, if it's exported, it shouldn't
> > > > > really have struct kref as argument, but rather a struct xe_file
> > > > > 
> > > > > 
> > > > > > {
> > > > > > +	struct xe_file *xef = container_of(ref, struct xe_file, refcount);
> > > > > > 	struct xe_device *xe = xef->xe;
> > > > > > 	struct xe_vm *vm;
> > > > > > 	unsigned long idx;
> > > > > > @@ -130,7 +133,7 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
> > > > > > 		xe_exec_queue_put(q);
> > > > > > 	}
> > > > > >
> > > > > > -	xe_file_destroy(xef);
> > > > > > +	xe_file_put(xef);
> > > > > > }
> > > > > >
> > > > > > static const struct drm_ioctl_desc xe_ioctls[] = {
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> > > > > > index bb07f5669dbb..2a8b370b1fda 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_device.h
> > > > > > +++ b/drivers/gpu/drm/xe/xe_device.h
> > > > > > @@ -169,5 +169,17 @@ static inline bool xe_device_wedged(struct xe_device *xe)
> > > > > > }
> > > > > >
> > > > > > void xe_device_declare_wedged(struct xe_device *xe);
> > > > > > +void xe_file_destroy(struct kref *ref);
> > > > > > +
> > > > > > +static inline struct xe_file *xe_file_get(struct xe_file *xef)
> > > > > > +{
> > > > > > +	kref_get(&xef->refcount);
> > > > > > +	return xef;
> > > > > > +}
> > > > > > +
> > > > > > +static inline void xe_file_put(struct xe_file *xef)
> > > > > 
> > > > > I think if you just make this non-inline, passing file_destroy and
> > > > > leave it in the same place, it should work.
> > > > 
> > > > the put is called from xe_exec_queue.c and xe_vm.c also, so passing the
> > > > destroy may not work.
> > > > 
> > > > Based on the patterns below, xe_file_put/xe_file_get will need to be moved
> > > > to xe_device.c and then exported. It looks cleaner, hoping that'w what you
> > > > mean.
> > > > 
> > > > In xe_device.h:
> > > > 
> > > > void xe_file_put(struct xe_file *xef);
> > > > struct xe_file *xe_file_get(struct xe_file *xef);
> > 
> > yes
> 
> ok, posted v2 with this change.
> 
> > 
> > > > 
> > > 
> > > My opinion is the way you have it is correct.
> > > 
> > > Most of Xe is coded this way...
> > > 
> > > mbrost@lstrano-desk:xe$ grep _get\( *.h | grep inline
> > > xe_bo.h:static inline struct xe_bo *xe_bo_get(struct xe_bo *bo)
> > > xe_device.h:static inline struct xe_file *xe_file_get(struct xe_file *xef)
> > > xe_exec_queue.h:static inline struct xe_exec_queue *xe_exec_queue_get(struct xe_exec_queue *q)
> > > xe_lrc.h:static inline struct xe_lrc *xe_lrc_get(struct xe_lrc *lrc)
> > > xe_sched_job.h:static inline struct xe_sched_job *xe_sched_job_get(struct xe_sched_job *job)
> > > xe_vm.h:static inline struct xe_vm *xe_vm_get(struct xe_vm *vm)
> > > 
> > > I'm kinda confused by what Lucas is suggesting.
> > 
> > just don't make xe_file_destroy() non-static, which would basically
> > ignore the refcounting. xe_file_destroy() should rather be local to the
> > .c implementing xe_file_put().
> > 
> 
> In the above instances from grep, most of the destroy helpers are indeed
> exported. Those might need to be changed as per this review comment.
> 

This really just bikeshedding, I prefer static inlines so these being
exported to make get/put as fast as possible. Perhaps this doesn't even
matter with how compilers work these days (e.g. even if exported
functions they get inlined by the compiler?). I don't care enough so
push back though.

I do agree we should be uniform in this though. Maybe the maintainers
set a policy and we follow that everywhere in Xe?

Matt


> Thanks,
> Umesh
> > 
> > Lucas De Marchi
