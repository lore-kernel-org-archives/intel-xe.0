Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2F08CD98CC
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jun 2026 14:14:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EDA910EF51;
	Thu, 11 Jun 2026 14:14:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FPBnxIpe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E574E10EF51
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jun 2026 14:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781187283; x=1812723283;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=7KcZ6R1u1a9DKPLTw5ZQNJP8GwLjKKkT470L8RoafyI=;
 b=FPBnxIpeKU+kz9bEYE1FP2NbM7bCduy5Eo9g2mxfHKkwLyivsh0wz1ho
 PQ3Bb1wLJv+fiH8f0lOVSbOgCmvQXK6ir7XVu4N2mSO78nerMeKz8hfDv
 dZrGij84TznXWhEhDD36wkzmc8NJOwPSfuTOiLylOb6PqEwPAy3n5wexR
 z8PBAIreMbbyOAIQkSEaDBPZef7SalfZxbg9JQR7lyXX88dz53uPlO8ic
 KnwxaB4mv4F4eyaYoqNylJkCcYGvxT6hnDuag7E81kBx3TR0X0XGgdVko
 FKDe4EjZ6cHb8TB7TM3xCeTeXg7uhuiD8sKyU5mAhCgGzpiNAXcqM8Gxv Q==;
X-CSE-ConnectionGUID: 4ZfhTcQ6SCyArNcXyQX8Hw==
X-CSE-MsgGUID: OqeUK+JBQFeXzzNxoEMe/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="92320736"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; d="scan'208";a="92320736"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 07:14:42 -0700
X-CSE-ConnectionGUID: C1Pu9FxuS6KN+DSYi7SdbA==
X-CSE-MsgGUID: 63qIbTfIS0expZDNmbpt4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; d="scan'208";a="276680018"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 07:14:43 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 11 Jun 2026 07:14:42 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 11 Jun 2026 07:14:42 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.41) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 11 Jun 2026 07:14:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R/tO8RVf2ZH/inYiF4mvHb59DufpgV1t3lP+KanX1ThKQ4uWkp4NnjhCf5jlaJkeviQMbEJK/m6lbCILsdltEoLCR0aXycgINSy+3aECYEzxh4jqN3oOwZm09lFyYucd5I6Q+hMNtJXD7XZqgqZM+DPcP3bgnjmRekSraF0sXICm4AtBX/x6Ix4hg/1NCP2zjNw9vkcSGQ/d3qXMJfkIv/G/0f8QkPW3rEOHXaZazFitDLAGaARma/Sibho+7b0KNQqESdH2h2V2JD+S+gxHnlTPKBOm+MpIQSYbZA7gCFum+13rkmxvsG8gy+BSgKWaAPWeTZhWKD33I/15gxoPqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PwsotfWpIYHhJmAk+nENwAjT/S5Ei3IxDxffwO99ss8=;
 b=M7wWy8/8Ve/u+PLiWMmwJfJHvLp8bTTtQKBwfC5f3eHZ1FZeO0k2cMVRbWomHCYW8pSC57p+CUyDNYK079GdCS8McFB/DtnbzE8HJurSdpTHKWhOWJqqYovec3pm31G6SWN6+OV3gF7JDtg5Da8OkxS8irQUhuQ+77JYSgPnU49XntdQFNj86Ncqk/PmO0E0OqhdOWwLzQeG4F2caUpZv/xOlIfkHpiCgOF3a7DP3b+lZp4odTtTSwxPOZFNgbvwE652/hpYeMmHRosN/TAun05nW8c1NO7BpfMt3iSQbVp/LiH77DQ+2Cr9T4gQ+j+zHC8AM/gOOgk0tLHChUQkrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by PH0PR11MB7633.namprd11.prod.outlook.com (2603:10b6:510:26c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 14:14:39 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.21.0092.011; Thu, 11 Jun 2026
 14:14:38 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: "Gote, Nitin R" <nitin.r.gote@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH] drm/xe/xe3: Apply Wa_16029380221 to media
In-Reply-To: <SA3PR11MB8118D6D70617E735B6D64BDFD0102@SA3PR11MB8118.namprd11.prod.outlook.com>
References: <20260529095306.443350-2-nitin.r.gote@intel.com>
 <87h5nqs7u8.fsf@intel.com>
 <SA3PR11MB8118D6D70617E735B6D64BDFD0102@SA3PR11MB8118.namprd11.prod.outlook.com>
Date: Thu, 11 Jun 2026 11:14:34 -0300
Message-ID: <87se6tmaet.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0P220CA0008.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::17) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|PH0PR11MB7633:EE_
X-MS-Office365-Filtering-Correlation-Id: 2321ba63-ca3c-4992-6ef1-08dec7c3c5ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|18002099003|22082099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: F1ssoAzPhyGQUF6p02hGFCVV7VjTX1PlNtLxnaxogeP0a8IHbPQwCeHvKtWhkeSf7FPNXheVXbRRc2ydztodXqV8pzs7FzXc6aZoNjUycj/LCHoj0gNUR+C3Vx0cIM4Lxhr2z2DmOdg8Reuz2CgfNp0xofWMYj0vE213fKDGQhDWshri9IqUxGl+k/gQ8scompGA/e6ALYtUVIizbsNuIvgygNItUoSuM2hswqSyz/ZV1n02UsTdv3cBw/rSpAOKfcnFOBM9pvWVU4pnOZsPrWQxG9c3PmLm209eSB4N6EY0Kl2rLzeZNrwNWM9xy3zsVLdsyiVk4Md1R3CyVP3N49Bh46K8j/7+iPXEcwyx3IWQTHjNvTScXOTlIOoNlLkEkm8Y+bUNbf7hMhNEf2u8JvdC7Pr+kVxw5vTOSxiZrsR5EVArQfgbbItty6sLhUfxvn9zPZbCROH2NQOyol84wl8CM6kd00PzgV7E0a+ejqqmyNT+DUEqkn4xmJ7whnxH5p29oR1jCYsP5HHrlnXannnxOv7GdfI6ePcIRiCONvaq2N16kODO/I8+W/bneG0nEkwNnd8b182JZt24Juo28AKfziwST0qSNSmB6THJJrJ2Kqq2eRBuEeIk1E7AYITFz9pV+HHAKdD5cKmbloqEyntXzaeIqDQeL0ojnHk5pCSVVBnaU37qDsernOIYTi4e
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?G7XmYDrybqiRGcTg+Unx+ZHINCLsp4soOAFuBKB25hqeLGiP1gqWSeFRzzy+?=
 =?us-ascii?Q?9x7HLzUasExl7Dcn6G9cxEXTu4dpdVLgJrQKHn+7oR108ggubdznjQDMTim5?=
 =?us-ascii?Q?96/bb5U/nHGMcRbrlbAx0FlbiMNOHHzVuLbYE4ku4XiAjDQoLMBYlnYwJcir?=
 =?us-ascii?Q?Ty/fbHXMGiUbgVjxqD49Twr6L5+GfBnYaea0PPrYXq7cEpoVBher3WuXeAdO?=
 =?us-ascii?Q?HuT/kxOZ4ZMqsMJ+3TWjiMPqN8jV1EQxVIclnQG8rzyTG/k36qUsFLyQpEBU?=
 =?us-ascii?Q?GtFTRY87E/SbX9kL1Po99MXOtILc6hfynPGIlv9cjtvwpYG3z8CHeyoe6jol?=
 =?us-ascii?Q?2Kq3JPo7RMeBKUnBRWGmNB+r3T8jfPlRMlwqj/y9yctdift92/V9iBkvVbgb?=
 =?us-ascii?Q?Ui8UjmPPns/QAGwclqOMIiVWllyVjt8cHgcYjTYW0ZBbmiq9qVKVsgVNvxM6?=
 =?us-ascii?Q?3twDrTaZrF/DVqNV/xnrGZ231Qji1wmFNJJu1BF7u9d0381Ea8rE8FafvDAk?=
 =?us-ascii?Q?twC5AYHCyIHiKbYQhtB9U/44STrjcpDYCLdSGVtvuAoACByWWidkvWkaT6Gx?=
 =?us-ascii?Q?rhoDNvwOYw4Wabnpcvuzw6pXzfcQSAhTD6P6dRC4JiwCf7ERG7Z9BAuB2tRW?=
 =?us-ascii?Q?hUfKOoZ0F1bYMdIjd9t4jtCGWYZN/iG1GbvX5SOBI0mepO+QWu6SPG8p331c?=
 =?us-ascii?Q?vG3vig1ropvPeFTj14SgDahKyAIsYx1Gl/qxiiX2skn+ZDLwY64U54gScqIb?=
 =?us-ascii?Q?pskHReAAirRXJDQWL+2A7/+XSOBKBCenIC6rV8zF2oB2990/5nWCFvfDk3F+?=
 =?us-ascii?Q?RGAsTTqaa/qiWO1xfecvdSf+nbUdN03dBkQesk0OOtryus5gau3U2qOF4xd4?=
 =?us-ascii?Q?gQd9CTqxj9rIgB5bfk7ydvNQGAnHEd8lsAZ8IRi4pWBYxRvbj8rjm4AHxd4v?=
 =?us-ascii?Q?DAcElGvcmg+2e9P8vX+H7DH2uGAe2KdB5FmvC7WodKvAOetztx3MG69348bt?=
 =?us-ascii?Q?cH/9flP7i8wUavvFiZYIbmCY/cZYGTxbG/4R668YKRKrtcL7QbdxmBC1JrNn?=
 =?us-ascii?Q?Iow8RFDOKrjzQHpbDLah66IgH9zQ6rBdxH2JkKnWh8PZUA2lxeDyf5SaksQq?=
 =?us-ascii?Q?41OvPbl5HSwN4JwHC1dHQiIHdZG7d7qxbBFUK/KBvUsZYcEqMSvZBTqJyEol?=
 =?us-ascii?Q?oznO/kDuslmfTtfVjCEfJ/cJMno4pA/5+ubyAg3hPggSn4Z4v/REUErXSrSH?=
 =?us-ascii?Q?lzhsG3p5XBDeH3r/iOHLSpH+SNX+066qBVyUUih/nSaOmZ9s2DwU1N630UWu?=
 =?us-ascii?Q?W3VFUdA+8JobfpupkmoKupi5BUjMVwKgFjSAyVYI+In8Sr1iypPvo4OkuqK7?=
 =?us-ascii?Q?3iaw0VF09IjXdWvk2c/qqFbenZ7zMD1HWL8/ByhKIvff82uOUHgjxzio6NTz?=
 =?us-ascii?Q?y+qzK2kKgVdpWHVdJWYM+8fM9zXIENJj4b2vZ0iCg+PQlDr3iqh1/hCCYpyh?=
 =?us-ascii?Q?Vgm7n/IiondFgTYgVImhlR0mYtB4RiRoeyPI6nHmHgAQqaZdUJq3VjR82hgd?=
 =?us-ascii?Q?AKxfCOCoZL5sE7qcoP1mqJSVasaGyL0l9z5NpI5wNJTKMnLmrRUGBtk3Oh9i?=
 =?us-ascii?Q?Oy0K6+OJfhImwkLZ/I1ItzAAXAF8HzeP7IkNz7PbiHsGBdwOdOKyWZurkysz?=
 =?us-ascii?Q?G6x/XgyS0yPzLjBmHKXdo0My5dBtVwD44tFWy9qVcbQrL5aPV1IJuuOHENZv?=
 =?us-ascii?Q?ta7EVC/w8Q=3D=3D?=
X-Exchange-RoutingPolicyChecked: gyukYYnsyLTesYvsPv8HOCTEyx2ZvuUddLLVODW+Bvxky9tOhyYIEjqzTkR9qvEEipby+EdBdv7T8OYAVhPin2zRZlYzpNW5q0j/h/OtOqAyQAW0uGZYWVwvkJB9vCrPiRiYXb5l57Vq3cYdAxDXtqoSo4kpWw7sSntt5gmwVE944w7cuH5XvvddtLvaZxitzM2LUmoF2WJTZlnbcLUw7MnwdrbMX9PIdrIg8/U/y9aEw0Bu2472ZE08+XmVC3PFPdnqoGqoW+shdt9F2au41+bwZBs1zz5+QiVUWfq4+bS1ry9aZEcPhLJWa/vhvLo5H2YAFvXRicd6qT1vGeQwMQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2321ba63-ca3c-4992-6ef1-08dec7c3c5ec
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 14:14:38.8650 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mb+r9ET+IVBEjD7BTS5j6QsZdBCsY2fHqUbfRzT2A8tiKnmRIfKIn8lC9Vf5+yLQZKirP8Wag006M9id/cjMyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7633
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

"Gote, Nitin R" <nitin.r.gote@intel.com> writes:

> Hi,
>
>> -----Original Message-----
>> From: Sousa, Gustavo <gustavo.sousa@intel.com>
>> Sent: Friday, May 29, 2026 6:15 PM
>> To: Gote, Nitin R <nitin.r.gote@intel.com>; intel-xe@lists.freedesktop.org
>> Cc: Gote, Nitin R <nitin.r.gote@intel.com>; Roper, Matthew D
>> <matthew.d.roper@intel.com>
>> Subject: Re: [PATCH] drm/xe/xe3: Apply Wa_16029380221 to media
>> 
>> Nitin Gote <nitin.r.gote@intel.com> writes:
>> 
>> > Apply Wa_16029380221 to Xe3p_LPM.
>> >
>> > The Xe3p_LPM media page walker is hard-wired NonCoherent and cannot
>> > observe CPU:WB cached page table data. Force page tables to CPU:WC by
>> > clearing has_cached_pt when MEDIA_VERSION(3500) is detected.
>> >
>> > Cc: Matt Roper <matthew.d.roper@intel.com>
>> > Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
>> > ---
>> >  drivers/gpu/drm/xe/xe_device.c     | 9 +++++++++
>> >  drivers/gpu/drm/xe/xe_wa_oob.rules | 1 +
>> >  2 files changed, 10 insertions(+)
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_device.c
>> > b/drivers/gpu/drm/xe/xe_device.c index d224861b6f6f..8a6f494e11d5
>> > 100644
>> > --- a/drivers/gpu/drm/xe/xe_device.c
>> > +++ b/drivers/gpu/drm/xe/xe_device.c
>> > @@ -948,6 +948,15 @@ int xe_device_probe(struct xe_device *xe)
>> >  			return err;
>> >  	}
>> >
>> > +	/*
>> > +	 * Wa_16029380221: Xe3p_LPM media page walker is hard-wired
>> > +	 * NonCoherent, so page tables must use CPU:WC (uncached) to
>> > +	 * be visible to the media engine regardless of stepping.

The info about what IP and stepping Wa_16029380221 applies to is already
present in xe_wa_oob.rules, so repeating it here is a bit redundant.  I
would drop this comment entirely, but if you still would like to keep
it, I would only say something along the lines of

  Wa_16029380221: The affected GT will always use non-coherent access to
  page tables, so we must do uncached writes from the CPU.

>> > +	 */
>> > +	for_each_gt(gt, xe, id)
>> > +		if (XE_GT_WA(gt, 16029380221))
>> > +			xe->info.has_cached_pt = false;
>> > +
>> 
>> This will also disable the feature for the primary GT. Do we really want/need that?
>
> Yes. On NVL-P both GTs are on the same tile (max_gt_per_tile = 2) and share the same page
> Table, xe_lrc_set_ppgtt() programs vm->pt_root[tile->id] into the LRC for both GTs. 
> Looks like a single BO can only have one caching mode, so WC must win for the NonCoherent media walker.
>
>> 
>> I wonder if we should change this setting to be a per-GT one instead of global to
>> the device.  Perhaps one problem would be page tables shared between media
>> and primary GT.  Is that a possibility?
>> 
>
> Page tables are allocated per-tile (xe_pt_create(vm, tile, ...)), not per-GT. 
> As of now, I see there's no mechanism to give the same PT BO different caching per GT.
> And Yes, they are always shared on the same tile.

Thanks for the explanation!

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>
> - Nitin
>
>> --
>> Gustavo Sousa
>> 
>> >  	for_each_tile(tile, xe, id) {
>> >  		err = xe_ggtt_init_early(tile->mem.ggtt);
>> >  		if (err)
>> > diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules
>> > b/drivers/gpu/drm/xe/xe_wa_oob.rules
>> > index f8a185103b80..9027365f0043 100644
>> > --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
>> > +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
>> > @@ -65,3 +65,4 @@
>> >
>> >  14025883347	MEDIA_VERSION_RANGE(1301, 3503)
>> >  		GRAPHICS_VERSION_RANGE(2004, 3005)
>> > +16029380221	MEDIA_VERSION(3500)
>> > --
>> > 2.50.1
