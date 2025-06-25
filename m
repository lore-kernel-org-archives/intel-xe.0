Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32756C7EE2A
	for <intel-xe@archiver.kernel.org>; Wed, 25 Jun 2025 19:21:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E50F110E7DF;
	Wed, 25 Jun 2025 19:21:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WdfC8pD4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 711FB10E7DF
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Jun 2025 19:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750879301; x=1782415301;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ZGjN1v/RIGM/2VWCw3fo+tTeJ84KE7LNoHOy+WOio7Y=;
 b=WdfC8pD49GL6Q4bGw85wIv6zlWAAtR4jc/QgqH824wR7bHlWxsmn5Zbl
 vYyS4FcE9icLzGyq7FsaaquH6LAIV8+XDV6ElD6USFHQ4gvalHFxeHfdc
 cwDXHE8imisYRak56F2dmwCp8AG/E9fvYeM796SCqR7prd0r7ez4N7apR
 nOn/qPWfGhVsU3/QhDpMkhNpUXIpF/HPt5daON5r+EJr+Ew8a7mUgXs4A
 TW48u+xOeJD2f/xCrOLXQ8L75F+vMtDfVKVFxwl+L8Ewih0/+SP3lfOHT
 L8EC4ExjByk9kenRM5+atnG5ddSq4bJA1Pi8fk3wHV53BLlr/APaG+SWE w==;
X-CSE-ConnectionGUID: jkVMjlLMSQehX24yAhabEA==
X-CSE-MsgGUID: RFWSkXaKRcSSkXC5EnSOgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53304039"
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="53304039"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 12:21:41 -0700
X-CSE-ConnectionGUID: Z0mTIBUCTPOyRDcj6S/IQQ==
X-CSE-MsgGUID: I8stC40YS0KIXvMy3IYPdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="156694829"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 12:21:41 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 12:21:40 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 25 Jun 2025 12:21:40 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.79)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 12:21:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gA38onv1EhByh2NXD1vOTc+MpMBz6dbIMzhq9QYHKBF7Y0lNprMGKlnFc5Z5DssUpYynIQOmRtm56BIJ9uFsqkpmVPgNsGXSANA44dxM00BWm7At5LfFK4x1KCGZMUxQiR0VKsRxHkrrZAx92Z9Ei9yFL7RHkagp7sXG4EC2/+vUNkN8GoYy2qM8ctqASjELXAc3MubxM81GQEQSogkXokIOwuEDNzLi3rMkhaKlAR/T6LQdSv0euDiMac340GJgaq88HEKzsECVAhn4MP//CsEUAQtVnyEy6tcaiUBgHEHAjWDq1b1+BkQZuwUrEwGVrHmXwTaeTOx6HgYaaAec+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BM1mQbiZa23Q0gE1ahk+76dE7dVdpg9zr8kKlGhQS5M=;
 b=fQoWT+mlBwNVamKUDr1Zm2DI6Xq6CYpHE0Q8eLEUB+98k1mgyXEBpqQr12K+BeVtxKeU/+ZwD7AEUAaYUzY1/y9ameIWTTN6bEZl8/OyigT1Jgp5NbNgJWfgJEMVwlTVHl9oxGnHDwdAsua7HcW3FmlRKNx89TX1Wtyg45c51IQmRWv+Ifz7NlfPDMki5Y96u3N4GrX/e9WJ1w7kNrgTJ/NFl7vBnCPPjkiVp9b9OoBZz81vQUM2oKGpkuJmvUMGgWdsSXb21jys/t+K8uElFxj7QN9lDHTR5PA9ozgoZ379QVHcv7LM9cDnVgE2Xy10q3b7/p3xWR6u5hiXCklgmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH8PR11MB8037.namprd11.prod.outlook.com (2603:10b6:510:25d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Wed, 25 Jun
 2025 19:21:32 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8857.022; Wed, 25 Jun 2025
 19:21:32 +0000
Date: Wed, 25 Jun 2025 14:21:30 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 11/11] drm/xe: Rename xe_uc_init_hw to xe_uc_load_hw
Message-ID: <wvxl2mcfrxha24ssgsu5cvy4yadn2ftvkut3nu6fo6kljerzhx@mxvfa723bm3w>
References: <20250619104858.418440-13-dev@lankhorst.se>
 <20250619104858.418440-24-dev@lankhorst.se>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250619104858.418440-24-dev@lankhorst.se>
X-ClientProxiedBy: BY3PR05CA0047.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::22) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH8PR11MB8037:EE_
X-MS-Office365-Filtering-Correlation-Id: b429c2a6-fb12-486e-c4b2-08ddb41d7e53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9W7+2YkXmk2rBKZ/a5054hofMX8aqWQKMR9Qbi3lwyv87AMVZT6c8SaA+Uv8?=
 =?us-ascii?Q?Rpa21evWkJp+s85PFtE1G3qnhXM99jncyZR6hmvr2y+02dOsa67gM2HrbMGt?=
 =?us-ascii?Q?G6es22A1Br+jp0Aqzh76epdvKiOkcISpKv+wqEh+Z8ix+c/mIo9cEIQ+z2AG?=
 =?us-ascii?Q?ESPmdkUOIJxc1EmUR7X0j56imt6DHfFZflOFz1jqjJ2+Pt2EgyGkuhoab6VF?=
 =?us-ascii?Q?cO0q41lgq1zAJfJdIky4Zpor1DGjlWE7lIH5KeGfWCdYpouWccM9sJdyHRsD?=
 =?us-ascii?Q?cvG3AGLS0KBcc57Y92hVljB8fYR+hsT/JnM3i8C5dNXsh448w2P/nAo8GGyL?=
 =?us-ascii?Q?ldJdjr/woJF4KA+CZ8cDi/zM9q7mPS36D5ac9A9pT0PNlFcKue9rLuiM4pIa?=
 =?us-ascii?Q?kULEfEqg7Cqlj4wrmXER4lnB1hNRWOmJtg7rqbbRmjIGuFjALKIzFOQyWz0b?=
 =?us-ascii?Q?AGU/BWh8SrA+5LdmNlMG1Ta2BAi1jt6rhsC00Tziz+0bnbCSLkDB+0X5Iucq?=
 =?us-ascii?Q?YXwKLrXU3CFCzd0ikB19wDt1JqzfAlxNyil+o44yfLpTXpbPi/rdkauC0KLb?=
 =?us-ascii?Q?HsbCS2Y8voa+JnHM3T251G8ZmscnMTbTiIGd1mFbsfrCFhEnLUCOTCuKVjus?=
 =?us-ascii?Q?BGYTIcoRGEiaJHXV8Vq8IGixxrfdKlG/6C2vuulpmlCmi25X8CYALstDbvnr?=
 =?us-ascii?Q?1oG0m5t0evFcygYui8kZO15+K7YWeY6la5W/n2vl1aoX4ZKvhPpDtWqJQecQ?=
 =?us-ascii?Q?3lH0x9eNFyCudRfp2qrOidzCVqrQIJWrQSWbW/cODD9Dvn8AcCBRu0yiil2K?=
 =?us-ascii?Q?C6PaxCbhfjnUZGmPAA9qYcp6jscvPyRNEdueILnZOue0JSQE5J4UFKB1x4fM?=
 =?us-ascii?Q?o/QIV8k2JXcfa1d/tCQ2YxUnRykYXtk0uLjTtkKgCYClsCoQVS4VtRMnwrGJ?=
 =?us-ascii?Q?QxqKe9FZFRgWTfTyMATIsdRHzoHwt5fhlO579Bk+mCN2IkTJvLRQK0sWtasI?=
 =?us-ascii?Q?a4q8HJmvCReQbJe8jPFcpn4wqrwDGzZX1D+AELL+f4EqlIMTuKmIb0qQKXxA?=
 =?us-ascii?Q?NQ1a70JQ5wpQ+6m0INxSgYmZOQmdSNcH51EDTTqe/IFmLNA7KlXJXrK4T3R/?=
 =?us-ascii?Q?zjHin/coozQK71zeEIBImHG46dXARsdrbKnr/rV+7I5aHZHsWRk/PeHuc8EU?=
 =?us-ascii?Q?6nZ4uhFO8QBS3MISFMA+3Oo9WYrBZYVYtLFeUUdqx9llkjxtd1LvP9qWrspb?=
 =?us-ascii?Q?h3lI7FsldPTu3L9WO26Cv0ZCnRP5eph+/K5X2gANVov2cjwPuw0ZcOmLhBuY?=
 =?us-ascii?Q?/C1nJfcNp0lmuLAQt0HgCaErUxE7kPyXMtFwAc6s4MErMFFSZCqDymm4zYU1?=
 =?us-ascii?Q?ayZ52jf0MMu3ffBGmTJkV23CFw/eotnVhUscGqt3nai4pvUKY2NjJ0QiainN?=
 =?us-ascii?Q?XACvCQ+vJpw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?61zx6l/iwFwqNmYfxfDSdpamFDmmm/voYmYuw7W/q0D3uHGHxhRjP8LFXQez?=
 =?us-ascii?Q?lMBLzcS2vcDJ0m8IpoUEIpHoeH4zQ8JRo/nEK879yBeOgbzieVvFDaCTYh1L?=
 =?us-ascii?Q?MpP0XmRo4rVfRUX2NrM34vkVssiyR5Dvh2xyxqU5tbLkYY5rfd8yf0oWn8jT?=
 =?us-ascii?Q?Amt87qgTMgidhNM0JAR4D/MMz++frGZOXfr3uvqMtSxU9WhnMSzkWyAUlUpy?=
 =?us-ascii?Q?Uh53Xo1qbKWT5PoLpSp1fkYXw8Nr8efIhvASkv0LDVszopMXp7iHd5ohORs+?=
 =?us-ascii?Q?se6vnU/RudcZfCqfuY5p0vQbQbrEAxtOfiAummKkyue9Ku7cAfRE6EZ+bnvt?=
 =?us-ascii?Q?z3Qgrjk/nw0sBYHg4a/HXuVjfUc8to1ZNH/ePE6ZuGhu2ugZpZTgGX9zH7+N?=
 =?us-ascii?Q?VwfHpl1EyaOt9++YQ4NsAAjCKEVqLn19dtuBXo1z5Z1JHwTeIqxf32P3N64s?=
 =?us-ascii?Q?1l4G9wXEu+zpFqxCqogmtPcQk0pTiBSLZJT1W0S993TYplSMlAmTsT39cgej?=
 =?us-ascii?Q?oRm6207r6Kh6hsDLZKuQ30hLmNyXdaZ14gg3eaH/Z0bBauT5AYzT7p9rwfkf?=
 =?us-ascii?Q?wGO8rp+OM8vQQ33iK5VUgH/S6a+fpxDRwRKXbDKPbuKAXHfKbGdmC/NY/WO6?=
 =?us-ascii?Q?oaoTwRWjfxdbsq1ThSF0qQ1m806fsHhHHTSqAZe8xyJET7yrF02H+gyOmpru?=
 =?us-ascii?Q?uMidM2/DtyToeIskwK0J3TgxMoSukyHGAgdLE+5XClDbW4+06aHN0MPCfJGs?=
 =?us-ascii?Q?rWJgKF9kUVXjB66r5FthqJabjBDY2zth6G7/opL40zavP55wEmf5LBdBNUQx?=
 =?us-ascii?Q?QA5F3ez3MdsMvNRCK7Ufd8l96zmNKCb0JY3TfnDxTMgBxsljoIarXBRdCL3Y?=
 =?us-ascii?Q?TadRYYk33aqT3QyJK8T9qvZjWGtn7lXRd+Dbwe8EhPpi1vR0ihtToChjMYfo?=
 =?us-ascii?Q?OF+mtsC0wflvFzHnr39widrjFsis/sYASJyCp9XmMr9g93iPfFTQQkRAxBE9?=
 =?us-ascii?Q?JtoxDR9v7X0kkbTAVASSF0FLFf2rkn1NtK6Tax2jGFj57cczBjpHOVTJUYMS?=
 =?us-ascii?Q?GH0kl2LRTVKtJtPeAa1BOlQ+IZwBbTGoq59ilvX4IHaxzCpDjc1W151yaN7p?=
 =?us-ascii?Q?W0ywx3W04ikXjax5vEiVLryxEHJxa9mO/i5SZMTZRiu91Bsv079bR2rTti8/?=
 =?us-ascii?Q?WHXSMvz0riRQUlZh/0FbaiThmgO5hrOtPo8vizFaZ0gXmUBJ5bIZNSkVZhAa?=
 =?us-ascii?Q?/oKGYPurEHcce8M9aqK1G20arh0xRrN7LmRo/FV9mSbuD9cMAobYJYk+uFY3?=
 =?us-ascii?Q?5go5ntBOgsuPC/f4eFrhG6UCbM4Nb4jeuClNCEswhUO5Im2cLTVwLbAjiKZB?=
 =?us-ascii?Q?pJwSqd31guMKhxMUTHhddoXNrzii9M6ve4zS4DZaB0XAfzCQNHY6k1DCi9dT?=
 =?us-ascii?Q?fxi/REBVwNKO74RqkfhMhaJsXAhGE6UuXSq5wxHo5q+OnpF7FZ3l65ItU5HJ?=
 =?us-ascii?Q?8vUrSMd6nqwcBEFW5DERaz2LpFRWcvl3sy8X4QXUvCUCAXv0QeyeTjnukbEQ?=
 =?us-ascii?Q?i4uns697rLiggVGbyqZghBkt3OZ9I8cnJtTwwpI+q1qQ0zoqXhU6V2rZAbFK?=
 =?us-ascii?Q?fg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b429c2a6-fb12-486e-c4b2-08ddb41d7e53
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 19:21:32.4985 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UxM6YRsQwfPEHz5D0mKWwKUIYv9dHyy9y7lSahSIu1eJfx7sGw3TCd42Afs8FfSTcwlo3LG1WjNrAQmr0u6F6Scy9pKodOcvkX37a3M2KSk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8037
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

On Thu, Jun 19, 2025 at 12:49:10PM +0200, Maarten Lankhorst wrote:
>It feels to me like load is closer to the intention than init_hw.
>
>It makes the init calls slightly less confusing to me. :)
>
>Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_gt.c | 6 +++---
> drivers/gpu/drm/xe/xe_uc.c | 6 +++---
> drivers/gpu/drm/xe/xe_uc.h | 2 +-
> 3 files changed, 7 insertions(+), 7 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>index 14761849390d8..d397df056e4cd 100644
>--- a/drivers/gpu/drm/xe/xe_gt.c
>+++ b/drivers/gpu/drm/xe/xe_gt.c
>@@ -573,7 +573,7 @@ static int gt_init_with_all_forcewake(struct xe_gt *gt)
> 		}
> 	}
>
>-	err = xe_uc_init_hw(&gt->uc);
>+	err = xe_uc_load_hw(&gt->uc);
> 	if (err)
> 		goto err_force_wake;
>
>@@ -738,7 +738,7 @@ static int vf_gt_restart(struct xe_gt *gt)
> 	if (err)
> 		return err;
>
>-	err = xe_uc_init_hw(&gt->uc);
>+	err = xe_uc_load_hw(&gt->uc);
> 	if (err)
> 		return err;
>
>@@ -776,7 +776,7 @@ static int do_gt_restart(struct xe_gt *gt)
> 	if (err)
> 		return err;
>
>-	err = xe_uc_init_hw(&gt->uc);
>+	err = xe_uc_load_hw(&gt->uc);
> 	if (err)
> 		return err;
>
>diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
>index 1b1441b234c92..d8ac194107c32 100644
>--- a/drivers/gpu/drm/xe/xe_uc.c
>+++ b/drivers/gpu/drm/xe/xe_uc.c
>@@ -144,7 +144,7 @@ int xe_uc_sanitize_reset(struct xe_uc *uc)
> 	return uc_reset(uc);
> }
>
>-static int vf_uc_init_hw(struct xe_uc *uc)
>+static int vf_uc_load_hw(struct xe_uc *uc)
> {
> 	int err;
>
>@@ -173,7 +173,7 @@ static int vf_uc_init_hw(struct xe_uc *uc)
>  * Should be called during driver load, after every GT reset, and after every
>  * suspend to reload / auth the firmwares.
>  */
>-int xe_uc_init_hw(struct xe_uc *uc)
>+int xe_uc_load_hw(struct xe_uc *uc)
> {
> 	int ret;
>
>@@ -182,7 +182,7 @@ int xe_uc_init_hw(struct xe_uc *uc)
> 		return 0;
>
> 	if (IS_SRIOV_VF(uc_to_xe(uc)))
>-		return vf_uc_init_hw(uc);
>+		return vf_uc_load_hw(uc);
>
> 	ret = xe_huc_upload(&uc->huc);
> 	if (ret)
>diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
>index 58ff3946a80ec..21c9306098cfd 100644
>--- a/drivers/gpu/drm/xe/xe_uc.h
>+++ b/drivers/gpu/drm/xe/xe_uc.h
>@@ -11,7 +11,7 @@ struct xe_uc;
> int xe_uc_init_noalloc(struct xe_uc *uc);
> int xe_uc_init(struct xe_uc *uc);
> int xe_uc_init_post_hwconfig(struct xe_uc *uc);
>-int xe_uc_init_hw(struct xe_uc *uc);
>+int xe_uc_load_hw(struct xe_uc *uc);
> void xe_uc_gucrc_disable(struct xe_uc *uc);
> int xe_uc_reset_prepare(struct xe_uc *uc);
> void xe_uc_stop_prepare(struct xe_uc *uc);
>-- 
>2.45.2
>
