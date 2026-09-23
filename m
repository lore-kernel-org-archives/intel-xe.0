Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 835C8C98302
	for <intel-xe@archiver.kernel.org>; Wed, 23 Sep 2026 13:41:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B70010E8D1;
	Wed, 23 Sep 2026 13:41:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A8Hve98K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E923C10E8D1;
 Wed, 23 Sep 2026 13:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790170887; x=1821706887;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 in-reply-to:mime-version;
 bh=JYlwCdyKXel1Qx1lMsA4wRKvfSOXWf5HM0e3Xat3Dyc=;
 b=A8Hve98KQ8gqOdPK1s1rksYDCiVEFy+U5DrV/mSgpOpfykDs1ic5XOxB
 S2QFHOcRrv/g+MbB4jgHW96d759yu55zfU4EOGJ1sycH50TURFM7iBlbl
 hysmjhibbYvLLf61L861nvN/ccjajffsxik2rZaNuDDQ+8mAlHoCriz6K
 +xjFYLuEh+QG76Fwk9rLGr2F6jYIC9Ef20g9WuOxT5RGJRuObcZ2IDFqH
 /KTf120AR1iRP3Y+C2YhKXeg859IsETBXgwpE+J0EllLicY3xZMiOCTS3
 veJbuI6RffGx6pd/QMBwkHNQDdV9PfrNNSCqzJT1Bw2wZlnCO5YMbZNiF w==;
X-CSE-ConnectionGUID: NZRVR3N1RlOv4cfflfGd1g==
X-CSE-MsgGUID: vHzDZtVtRsa8DWjIgOK6Hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="1382471"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="1382471"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 06:41:27 -0700
X-CSE-ConnectionGUID: t88awWY6Q+KkjUfWoQP7Jg==
X-CSE-MsgGUID: dibV8BRlRqeePzSOIH7RzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; d="scan'208";a="299864456"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 06:41:26 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 23 Sep 2026 06:41:26 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 23 Sep 2026 06:41:26 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.46) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 23 Sep 2026 06:41:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AH7i90i3/sB5sfrwX49mJZ3/2hTEILRx6l0lDIE2WB2n7wDfCn+AMDXva3lt8IGmTNTKXvdkLX01ItUS8A4n4G1tg5lnxcnP9ZpBO7MxWoAgR0Q9wu2Xbrf4hswnCYG4NZvGCbxaT9BgDsvBUA65CAX55OWTpMGj1xKYqJYYj/oAQVJk44hSx+s7Nqn5jqApUhw1RkONJKdo4+Py1eWkUVsaotpEJ33AyrJLnXo7TbbzqgsTvLSznPsKF+6Rtv4kr+T3kaDV7T0+ujQi0kOIzoOTZ0CSsDwBue8211lUIMUv3o2sX53Cew6ljHRinW1HzLq4CWVY/Zdj5r1x7ZXmwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d0XAq8mI+YcJ0zZC83MTPz80shg/1dgajrU58EgCE5A=;
 b=p8oW7XoLKFxwVQUqj5TV4sg2irWmP9gGR8L4Uko4814jKxV2b+LbTHRZF25ZTLUTnf8f8FGQLmfaclcNMGo+x4oxqxLaPb0cVNmqRu9jQ7fNl/WQRwaYkQR16vYNfquFASOBMQG+A6TcyPcVCV2h/7Kw3HghiRHWvbWz8BQRBbn6IS+/2yvRZvhAlvz+xDkfRpP7ATVk9V5seBReNGSfjfsnJPQEdLv1O3Ly5nT0K9mbHIoL/Q9BPEpuHJv2t7tZx5T9HnORQes4S4gRHbKVd7iPsas9N+BMdojQGq66uUFNU0e6lg+N3Voiq0W+alVNgrmQKa0hOESTlBH4jPpwFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9273.namprd11.prod.outlook.com (2603:10b6:208:573::17)
 by DM4PR11MB7398.namprd11.prod.outlook.com (2603:10b6:8:102::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 13:41:23 +0000
Received: from IA3PR11MB9273.namprd11.prod.outlook.com
 ([fe80::31a4:58c:e3b5:43fa]) by IA3PR11MB9273.namprd11.prod.outlook.com
 ([fe80::31a4:58c:e3b5:43fa%6]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 13:41:21 +0000
Date: Wed, 23 Sep 2026 16:41:10 +0300
From: Imre Deak <imre.deak@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2] drm/{i915,xe}: add/move intel_opregion_suspend() to
 intel_display_driver_shutdown_late()
Message-ID: <arPW9j28hToJZK3B@ideak-desk.lan>
References: <a913a25a45ccf18159cbabb921111ae719b44d04.1790089118.git.jani.nikula@intel.com>
 <20260923125419.1755740-1-jani.nikula@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260923125419.1755740-1-jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
X-ClientProxiedBy: GV3P280CA0064.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:a::16) To IA3PR11MB9273.namprd11.prod.outlook.com
 (2603:10b6:208:573::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9273:EE_|DM4PR11MB7398:EE_
X-MS-Office365-Filtering-Correlation-Id: ad9fd8ce-63be-49af-5933-08df19785a7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|11063799006|56012099006|10067099003|22082099003|18002099003|4143699003;
X-Microsoft-Antispam-Message-Info: vWapch/q277zu95Hm/Ztyo9s/9o8Lkm3IUymKunGPMjbqoPXTRCsdt+3p9QjyzoNALXJygGvAfDNpZXRWBvuw9+8/2Ev4o7vbNrIU5OJSclSgDYLvnnj1PuYqvnDf7b+6Pd4VDRVahJk8C89ZM9KerhY1Mj7VNls/5wWzv1KC6Fg7LJIhTERB4LyVX71A5bSIdVsK+7NQTfDw/g22H1c36TRM7aqryEa1cCLodtkU5pg/XLTfUZyRRpy/l4bbX9M/yUygrcZR/bHCEzdUcwCOR2fVzf3wVAOUITSTZBRM00gDdHiQdY2T9wW7q6P64wOtc/dg5CCjAW+dXVphqJXBPAUUcYH+Yfg1mhCoN6JU2SN38OHz/qslNNn6ZcOJdbUswHYaW4QzCyKMCCHw+lVZhW7zzfBFR7KLGNmR1nMNpDBiQJt2SmqYmsAyTcjn1GTrrbVHW22Z6y5nUeVVoGZmSDTyJKXNDj0+R1OLKKQWsYizIJIb4ItQYzZXvz9je2GY8a7KphLeBg5Hq4jouVQDyq1Lc1EXH+geHvm8ZZsK1YhJboHVHIt/h/BZsqoQuu9KsyI3hneq9XoP57/BYSfDuhb+nApoEzKnLrigZufXoJKV90fMFVlzAP3XAsyIQfMeahj4wEWK3EuLlPpr76Fz7xLNQW7ydOPAJRla5Ojz44=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9273.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IWSKReoVNs5Zc1O4s+6iGX/ho6Ji3/PyaSWE0VNK2CleSN79cU30FTIWJdxy?=
 =?us-ascii?Q?2TxhWNPOXlNW23zSop64mtERzIb2/1Kf5P3f3/mfT2jYIweGJfRb497FSk81?=
 =?us-ascii?Q?6/2hLPSoqq1Wqjjh3r5LZBFwD+R1qYId4DN9dkOjQ6H29BUjRHANP9B/1wC7?=
 =?us-ascii?Q?H2cCg1wHM6zhzYPoWrGApUmA0dalyIAz5V/sSLSq6olmp69NV97MUn9N/CBq?=
 =?us-ascii?Q?4hG743vf1JqBVP1cnn32/hQ26e0VS8VDsAusTZKuekSLbkjGObhcO8pqJDWY?=
 =?us-ascii?Q?7s9sH0xvHFJUX8L2PlxWHv28IHNNmR+60DaSpNKOj/UQoG6mLV+Th80QmaQ4?=
 =?us-ascii?Q?iX8NJCd/Yvcz9msU/O+O75M3x15rF7+DBRBBagXAAfO/wPx6uG6e0slfG5M8?=
 =?us-ascii?Q?oyH8oESeQlDNgOfHr4t2LRtunFQKOPoGl8wVTt7aT9g0VP3piVRxxScjo4Ev?=
 =?us-ascii?Q?UOnFzbFZIYRmCjnZSTxvIs8WCvyB2cBoEf/x/lUAEohW0fw4lKX9DNUO/233?=
 =?us-ascii?Q?akb8gyZWvDkTeIv1SP5oozv3ncgfwBkLqcDDrgDkiX6DeAqhhsDWSlpQ4aw4?=
 =?us-ascii?Q?FqS1q3c6qFm66/pD5ASNEd06+zwUJK9RzG8EIPQEQgiX6901X+fl/0mXXW9B?=
 =?us-ascii?Q?qtEFnUoQCyNMdZEwqKz7FOwbzQXdwqMCK59HxNWMDDCln4mOBp2Du7ca/cf4?=
 =?us-ascii?Q?cy+cVYnzsHWLZ9vfXC0ljViju7L8+RTuvpkYWpLpurOEQxQ1C5VOZyC64p/B?=
 =?us-ascii?Q?vXCwEdiDjyG1e5Pp/3p03caX+3mJdM86lp+t5jbECxyIZLzrBGFK6gfOcVwJ?=
 =?us-ascii?Q?Nrp5AmDvUQf/r97HTQYv+Md6bY0hEZA9Wo9wQsyzFKC5CuJWjqsWooUgHDZV?=
 =?us-ascii?Q?XlwMAEbD9UADHdcSX04+57NAh1ostwJZFrTdlxTZmkTMxFBdbAWCxRheYZS7?=
 =?us-ascii?Q?z1hDeq5BCSk3AchrpaQmksJEJLEpI6OAg5xurYF9VrK3nAKXag2hnO67gyga?=
 =?us-ascii?Q?dedyUbVUtJN9etCb9MqhxjDDceLMxF0cX03UIWut/r+iBbA3KiqGn2ehqw4l?=
 =?us-ascii?Q?lYblOLh7SuB2snoDGcZH97f+IptVHWSD6uf5juabRYWRWQBiWDOLi5DONSvM?=
 =?us-ascii?Q?ss8ADyhQ6xsZzHOkxJmwdc4+k5ar8NRX9hGxpu+9SYbfq3fRcawj5730XtAx?=
 =?us-ascii?Q?+BWydzhTWrg+dJetadLwhnzc3LKDFLDlEv40bUeh7R9ATzJFlTZ2Amazn6dP?=
 =?us-ascii?Q?7gcTRRa2cBij5NPX8hP4eTrEeLJUDCForKVrxX0ek+uvKvE6b8gDoz5PuY/t?=
 =?us-ascii?Q?dOgqCFmYH4cADvr5/6ITL0XEhmCiRHkPpdoHqtu+flupYwVkD+HYHSqZyXpm?=
 =?us-ascii?Q?lcDZZQMIbtor8yVaekfHUKjgVME9hE/i93kRTR4q4jH0wAEw8vjGEeb/Wkbj?=
 =?us-ascii?Q?Mxabnr7jiGGcmaFarZ0y0CR7GqHSRNTSgXmrfjKADNmbE/stWzvfBuyW9I+N?=
 =?us-ascii?Q?RqwVsZGHARcVcOIw48mg5vfKlLuvVK080FJMYD8kAbDLA6JjYeLsW9Mzk1Hl?=
 =?us-ascii?Q?NLmMB5KtKEOc3l7YlY++t4whXvWRlAfVaane7TUVcvDUzwMeedqNy9x/L69T?=
 =?us-ascii?Q?NdC5eSHu0xWIDWg84KXJmADPEeJ71XfX0dO8lHoyO6+If+iCsU6boJj2vhZo?=
 =?us-ascii?Q?lxrErcWK+K1yIcgMh2WkVpG/+17Xj2xkx0tlQLzEuqTeGy5cLCa6jotv7N3u?=
 =?us-ascii?Q?Fh5274BBsg=3D=3D?=
X-Exchange-RoutingPolicyChecked: D5vRV6BubYAPd75l5cIjlvwI3+RNzhk21X6nZ+yFI/2THKJdl6oA2Ve7uzTHp6DO+MMWPzZNF76/qv5+Nf6nhzcYQF6WSXVf3XiwIr0lQuHx/Pb+p1AXmP+gu08rXBqIMGlgAFcoLgCwX1vAiqxGHPcgfrQi4Hoodm+Ty4bOv5fg9cGaVTftkgY7qimv0/O2fCs1kFo6uBNgI+eNqTulziCJPBEG5csd9BV5hioppBhGb6NE3/bZD/UBAHogd1kwJ/vbmMHAWhm0xpRbp0u+IUnNxlekI9oCRVNgw2mtGAKY/lBEFrUTHLYG1oOiAr2rg43JcDfWOHY6P3f23Apijw==
X-MS-Exchange-CrossTenant-Network-Message-Id: ad9fd8ce-63be-49af-5933-08df19785a7e
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9273.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 13:41:21.7591 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jJgX9o56YMs1ZKfe448flq+AwM0/2JgqHKPOvls/lTVxjPdo2lkRu6FbUPMOdVsjwYDAV6gaVXiSiXTdukOQ6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7398
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
Reply-To: imre.deak@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Sep 23, 2026 at 03:54:19PM +0300, Jani Nikula wrote:
> Add intel_opregion_suspend() to
> intel_display_driver_shutdown_late(). This unifies the behaviour with
> intel_display_driver_pm_suspend_late(), calling intel_opregion_suspend()
> with IRQs disabled.
> 
> For xe, this delays intel_opregion_suspend() until after IRQ and GT
> shutdown.
> 
> For i915, this starts calling intel_opregion_suspend() on shutdown.
> 
> v2: Move the call to intel_display_driver_shutdown_late() (Imre)
> 
> Cc: Imre Deak <imre.deak@intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Imre Deak <imre.deak@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_display_driver.c | 2 ++
>  drivers/gpu/drm/xe/display/xe_display.c             | 2 --
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.c b/drivers/gpu/drm/i915/display/intel_display_driver.c
> index abab457bce3a..f11cff0e1294 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_driver.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
> @@ -711,6 +711,8 @@ void intel_display_driver_shutdown_late(struct intel_display *display)
>  	if (!HAS_DISPLAY(display))
>  		return;
>  
> +	intel_opregion_suspend(display, PCI_D3cold);
> +
>  	/*
>  	 * The only requirement is to reboot with display DC states disabled,
>  	 * for now leaving all display power wells in the INIT power domain
> diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
> index b013ec00b75d..1e37b1c29bb1 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.c
> +++ b/drivers/gpu/drm/xe/display/xe_display.c
> @@ -176,8 +176,6 @@ void xe_display_shutdown(struct xe_device *xe)
>  		return;
>  
>  	intel_display_driver_shutdown(display);
> -
> -	intel_opregion_suspend(display, PCI_D3cold);
>  }
>  
>  void xe_display_shutdown_late(struct xe_device *xe)
> -- 
> 2.47.3
> 
