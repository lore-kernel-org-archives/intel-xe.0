Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30320CA0EFA
	for <intel-xe@archiver.kernel.org>; Sat, 23 Aug 2025 12:04:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4C6F10E0CB;
	Sat, 23 Aug 2025 12:04:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XwLmZaIJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F09010E0CB
 for <intel-xe@lists.freedesktop.org>; Sat, 23 Aug 2025 12:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755950640; x=1787486640;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=fo8DJKW0H1Sngz+rwpXDbkyXE7vg1n0qnLjgAXANDYI=;
 b=XwLmZaIJnOpUdh4p5mrRKpycG+1645kGzjUPd1rBv+2zK9kPkMBItyIT
 gQi9G9AErnd8eO2hnAvkCAKyWJql1xCf7jEQyo/5DqBHQ/kMEd80hvg3s
 0iGxqxycDW8vxkB+al+JUcd4jctArqh5a+gt4B99G7NawlYrEi4DSPrYZ
 zT3l8K5uyXac0tWU8N/89jB54HyPDJQPoRby3M6EsX1FR5ra5C4kgMk5K
 QUR9uYrYXCn1leaoTec83BUoNoZ1CnyMLoqG/6UJ+41u4kBnWh+YFP/cX
 LCYVnqqWl5Jq4g/zt3HV/7VByMc57jSRLWhhHEIlDZLkkCr3ol287x7lP A==;
X-CSE-ConnectionGUID: /mrgXSTQTguOZjR/wDnlQg==
X-CSE-MsgGUID: bPr2YrjgR9Ccgpg7gagEvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="69605066"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="69605066"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2025 05:04:00 -0700
X-CSE-ConnectionGUID: QgKPlDpkTn++v2SQ1URJ5A==
X-CSE-MsgGUID: 6qLtRQ8VQ9mALCTIBMU8Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="168810305"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2025 05:04:00 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sat, 23 Aug 2025 05:03:59 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Sat, 23 Aug 2025 05:03:59 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.67)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sat, 23 Aug 2025 05:03:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BKqQSN6q+e/tZiOM6iU3WM/r8pDt1YgLRpX93ylxgHacJZyQI0B1pOuAgt8+nei7v3gjBdTgdzscziXB59FPEw3GvvOxCDwQF8j/z29v6VnL4hHGi2o0WfIQk2fhnlFB6XFLDRdnsdqTTDsfbkYSM1ah8f6ZNBi4WYCK6Ma8e/ka/WikDQECP2QFzu+l5ETTJV9hHBKheCnpTFWuZrfRzh2bMG36pcyEjIx+JxhSAYCwWFB8hh3/yMu1bkIZBMoCIN3Ba7o24ve6XpB5zMy/yTrMXUnBPP8hfE7HPuNEac8D62ZgqV6tJRA9wsjpHzBdwzVMEVZn3Po1HvQaKlFAeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V6fLfacXac1lfOJBz8Mfj8kuku+ew1rNisfbiR71PE0=;
 b=jaMsBNmneqBpAF21X8zB7n77L6Xuphn20Q0E9sTOQIqnecp96Nvc/eRxUocFz3eeGCkCi2Buw9YAeAYX9oWp28fKTwTsqStne8KeFwrO45xT9F7WQoabFg+D9Vsdzx1Ft7S/RX8wOTGMmE+Z+fcKbA+Yu5UyYOgdy98aAXHyNxgfuS7m4GBq7OErACZ/rjwYGmgAjSk+Ohw7UTqhDyDHd8kVKjEjiByJ0ECuPSWI/ntAL1wawoZAKE5LphFerkzYJI7rD8pPdhpH/iGaynWgbYeQpZYlYXLaARw2WhWzxjSly2JwSZp/Xk4TKi9xLje5JcLUnQx/ltuWv3Mz5FPOpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ1PR11MB6084.namprd11.prod.outlook.com (2603:10b6:a03:489::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Sat, 23 Aug
 2025 12:03:56 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9052.019; Sat, 23 Aug 2025
 12:03:56 +0000
Date: Sat, 23 Aug 2025 07:03:54 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Move device sysfs init to before GT init
Message-ID: <kpu6il2eekughidlmn7hattrlgw6yts44u2b5pg2nlqbmohnhn@vvkonxxtxhoo>
References: <20250822182828.107965-1-stuart.summers@intel.com>
 <e84715afbb2a388756ffaf650129e578890658cb.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e84715afbb2a388756ffaf650129e578890658cb.camel@intel.com>
X-ClientProxiedBy: SJ0PR13CA0209.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::34) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ1PR11MB6084:EE_
X-MS-Office365-Filtering-Correlation-Id: d439ea19-e016-4a89-9c23-08dde23d22f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|27256017;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?6Cgq7IVE6Ipcnr964emiI42PuW5IesnxBe7WiQnCf++OBT/YHJzSqIoTXD?=
 =?iso-8859-1?Q?0Z3Gq1BLmq5xlIOYqIMU2h/h3xeceChYhJ+EMP7Rzt6niKTY2txiOhjf8a?=
 =?iso-8859-1?Q?f3wODQe/ye1JuZQKW6VA5go+zE76aL2//uiiy6Cc7v+Bn9hAvZnT0kC0fT?=
 =?iso-8859-1?Q?zaE+WEXLjzxYqBoHI+Pjr63oYbTGmgH9fGdlKRDPnYu7QqgF0bP2MKrrL0?=
 =?iso-8859-1?Q?Y2j0NJA24cFzA9AR7oVhrVnMo6VEtBNhMmrFFZeGC1eCoA3jah7zqFyhYq?=
 =?iso-8859-1?Q?STb1e5KaDz7WZwE9Hda+maK718gO6w5eW/03OPeiWGnfjuVDesnOX2c17y?=
 =?iso-8859-1?Q?4ZQ8dXPVT0haB/KFmueN3BOTxxu3hbqeB5Fp11/5mljMNasRR3X6Uz2kAa?=
 =?iso-8859-1?Q?PeyYK1CuoA1Ka/9SQSl/h2pfq6Ejd6VhIyCet9S2pmOfGrP65IG+mLZZK/?=
 =?iso-8859-1?Q?QGygqOQxOfCBRieinOSsG/tdLa00X911b8GpYNIZO8MKm5pw4ieXM500pj?=
 =?iso-8859-1?Q?ty0YaU2iKiQvi5yHsp3+4jYD3oRp58OXFYxQTRs5I0aYDAi34izFnex12R?=
 =?iso-8859-1?Q?BOVq1ypJUrWs9TvPsCe4VNupytTLul461rAwEcQ8c9YUIMj4X8ERkci4L5?=
 =?iso-8859-1?Q?9rDv/EyWH1fobLth84sOz7Koe99Vnx4apRHSjla+eXKCvKh9g2/e+fL51i?=
 =?iso-8859-1?Q?/BwpH7ZXnUpw8O6oZE8msZAtvHHfMMWBLX9Tywq0hEmnjvWMOZkM95x+gK?=
 =?iso-8859-1?Q?c9h57pAbzOZ0hdaWrJ5JMtn9zeg6G+SXquHhHYcikn9eAjztDyV5V1VMTl?=
 =?iso-8859-1?Q?g3scOJMR+Pyt+7ubgcZlGuOrSI20hlLvEnVt6pwOnTc+6+VCSb6Ncw6ytT?=
 =?iso-8859-1?Q?1TFtO9Fi8nQ9Qw15Keio3RMKZuSwq6BbGHVQYJNvhHZMfO1bycHsH9Rqfy?=
 =?iso-8859-1?Q?LNMj5ZmAp/ZcJ2YJi6lOhNqe/UL0yGPhgZtxflSlxq6y1Yd4kf2tD2sEwL?=
 =?iso-8859-1?Q?cF0hO9pZqYPuU3K3FDBn1MLJK6S9r5V2UHhKW2iJAdpXjTzdQfXcmR8Ii+?=
 =?iso-8859-1?Q?LC+Vr8RhIPGxezRzNnb6Z6ocRNCZQTiJtmnjrqZtFUmVLBZ1Bs89+Ap0xC?=
 =?iso-8859-1?Q?2BNSQwJMbDuvVu2k8yWOHHvEbkxk452njlpPhsL63gqXV0spkMnN7aotbg?=
 =?iso-8859-1?Q?AVo9CzuPuXK4RTbvRyCuyfjZRLCnkl2Ab2RPXF5hrrYpmQZj2/aLWgtb9j?=
 =?iso-8859-1?Q?PC+ov8U1KSyCVLD/7yh7ckf7uyuRl2a5TSzXG9SGUHrMzyUrPje1EmyubN?=
 =?iso-8859-1?Q?N7O06eMmrky0EiRBMehZySPk5ULyVhguYdjJFxs8aLMixXA05H+AuYHkau?=
 =?iso-8859-1?Q?zbBJEsdnxT5G/wGpSobkLVPk9tnPXM/THFI0SbSC/blCmAAoasKg+Jbzae?=
 =?iso-8859-1?Q?HpYv1Ak+KmSXsQyKV7wqltEoFN6MMdM8d5AfKLZQCzcNwGU/NT+YON1Rf5?=
 =?iso-8859-1?Q?JJgy1A5eAoa6ZWaD9+lABHBMV9bLMMytP5n24SWZeyiA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(27256017); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?TUXj5t7UnuotTP6eSOBr2oYHschPCMzxbzdi9RXh+vNZ3jgcHH5UfDHBpW?=
 =?iso-8859-1?Q?/MM+/Ny0+zMtNj8ReasJlfhfYyVGxfJ5nCaVZk2TH3Few2L8PJJbOBcZ3j?=
 =?iso-8859-1?Q?icnFc1C/mZG20hbf+TMBFfxqXz2+0xWRdou0WDVc5Zqm9+M0HWy8J1d9fZ?=
 =?iso-8859-1?Q?bDcEDYtGR+LYoMtzARgMR7aNEAq8pKyHcHnw4PYMm6wBoUex6KnQo0nn0B?=
 =?iso-8859-1?Q?MOAbox5oAABvmQ/Y96PAkrfVfhU2GN41iCi3KXAknyRWp6u0CapKH6/+EW?=
 =?iso-8859-1?Q?rgyF7EA9II+HfKEOpZcnCWgwcls5uTip1QgX+mnclzguPccHDh7XWBvTuq?=
 =?iso-8859-1?Q?jBiCvPHLU+G7db9FojxEvVh2WA6gr3688ttA/dAIDpAUZH7f2sAClQ4ODe?=
 =?iso-8859-1?Q?vTpFhF+gIMwQQljYNtfqOq4j9/zpYg0r4cLRtqRVV4jtQER4SkH5Qv45JO?=
 =?iso-8859-1?Q?I9eA7FdTZfzUb+Bq/0SY/Uxlqxq4Xd5M8MNgPJbVzDNc5rM4tKRsCYnepC?=
 =?iso-8859-1?Q?8utL59hVUpnyIXpi2SN2hNYZbY/g2SLLB/z04SMQ9WJ9dXruhnbZzdLfep?=
 =?iso-8859-1?Q?f5EYflJ3i3+pCrxHMCYkfINSlSCQGheP+IH6nJPvP5JrlXuH96Fjxed4lp?=
 =?iso-8859-1?Q?HEoTOnEtswlNaOHv3TaNh7IqAT268yh+qbtG/ek6976L0GKuM1uBrr58JL?=
 =?iso-8859-1?Q?zoO+3fQ+XRunQgk7ojiBJaEyyuDAjwOcKWe/gDvO0Xmjn1XTuQa8J/1Wzo?=
 =?iso-8859-1?Q?Wfz8MfHA+QzpLTh1VDoKh0StalZEOba+brLZsjOrlXJh06frYSZMJ5yWgS?=
 =?iso-8859-1?Q?R/5pyJKfq654bRAzShSxtluhUpR2n4Ewq5zU11P3muk/GRv6pfBSDTWM88?=
 =?iso-8859-1?Q?P94N9Wwh9Y89QZsxA2jegC2HoeYneiEZ3Fvo01BAzgpOfnhUUqSw4NQc66?=
 =?iso-8859-1?Q?uMg+XNxMvdMFEGGeKnVaT1AI1oJz+5zcBs1sMgLlrqdthHBETX2azCjtvx?=
 =?iso-8859-1?Q?X4UG0ptLOmu9XpQ9prsgh+B2n/p76eoHz61YMaQc84sLCd80KYLdnwdR/2?=
 =?iso-8859-1?Q?Drg7tbp1gecD4gyMMVjnmsm2ZH9z9RQFb2eXJGNDJFQ28nezoLLnvVNWYw?=
 =?iso-8859-1?Q?mrj7w0Jn0L9+4LK59PNaG9Dlg3aNRL5sgnv44RO8AKjb3q9SbbIWaIICh5?=
 =?iso-8859-1?Q?UOPnqeKa7VbQQRP9TXtSNsnaQuW3YxmlHyZYeQ8W0K4zwVE4PNirDGYRvl?=
 =?iso-8859-1?Q?poi7M5q4tm2AaprZks5I6iirmI2pkDNCbkzR9aDz/HL2WtAPNem7zYxCyH?=
 =?iso-8859-1?Q?wCaMHMiL5dK4Y9LZ4YjaVimAztDgZImRMXe31JbLLydL0SLRNnsWVJutHf?=
 =?iso-8859-1?Q?8Fl4W3gwQYUd3XMt3wKYlMGUpfkt5boA2cbgX6ZCzSujiHAWuj3f0MteoN?=
 =?iso-8859-1?Q?0k+7hZmNW/ZTu4t7Kt0IgsIuNGIoTJIxf+eFN4rojuv8SNjnIkr3erkYIi?=
 =?iso-8859-1?Q?k0GmK0BfZJOBiKHuL1w8qvW4pDhGlcKRfXJ7BKnF3IPKXhktFN8Xs0O5cb?=
 =?iso-8859-1?Q?0hNooRy8r+3fEBI/xh3YTsuyEHpx91ikstYMxlwT4FI94YPIGXekjDV1nw?=
 =?iso-8859-1?Q?2NSgALxYlKC8azTSMrxIjxliv+llvIxAT4NHkHHYE2fUDRtIVPgcJUwA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d439ea19-e016-4a89-9c23-08dde23d22f6
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2025 12:03:56.5373 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BEDJkdHDyU6kIV2vBuPI4oANvVWSJAKF9B/YU6hycWLFnt6u+gpXJGEc1UP+ETs1ZhgE/VXy/qeo3fC/sg8piRabO90CiBhB2oG7BDHOo/M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6084
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

On Fri, Aug 22, 2025 at 06:56:53PM +0000, Stuart Summers wrote:
>I apologize for the noise here... please ignore this review. I think
>this was an issue of ordering in another series I'm debugging. I'll
>report back if it seems like something we want to pursue.

if it is, then make sure next version has the goto fixed.

...

>> diff --git a/drivers/gpu/drm/xe/xe_device.c
>> b/drivers/gpu/drm/xe/xe_device.c
>> index 3e0402dff423..f57007faa024 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -876,6 +876,10 @@ int xe_device_probe(struct xe_device *xe)
>>         if (err)
>>                 return err;
>>  
>> +       err = xe_device_sysfs_init(xe);
>> +       if (err)
>> +               goto err_unregister_display;

this is not what we want to do at this point. It should only be for
after the xe_display_register(xe) call.

Lucas De Marchi
