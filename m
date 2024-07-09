Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A133C2BD09
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jul 2024 14:32:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D77A110E099;
	Tue,  9 Jul 2024 14:32:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fxiAgyVM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 667C210E099
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jul 2024 14:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720535525; x=1752071525;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WL0KkrAqICDqmRIhJvbxAHNxoYoD6+rydHjy+NAIy6Q=;
 b=fxiAgyVMJjtGa2rYlVxn0ndNYPsHnPVNbOTabCE4GWpqOFoDcUCxbzX1
 gAyQJ0sllcspsyZxy8ME536J2hHvCt+XnUeoBCC6LBT+eIppHMADKW8j4
 hPKXdQ8+3HS/Tva7psHtaAaEYqM9Y5/5vPpYqjw62eHWBVH17OYvrWoJc
 Whu+oG7Dol/v0haIyHmfUN8Jn5P3Uvj9tMSdI971U8xrw8xixlOYYWzx0
 DgeNK+KP1MVyeWr6bF8MGX5LBtJXlrAlfmWZNOHoyt3E/QzIDvTmEQHgW
 rde1hFcBUtPlT4jG63IeeQQmdRvDgdWaVv9Jj3MCShFbD3MAGlEdyjYoZ w==;
X-CSE-ConnectionGUID: LjNoOCMAQRO5CHR+atqbrw==
X-CSE-MsgGUID: jhwug/5HQwCPSngcjuOpwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="28399636"
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; d="scan'208";a="28399636"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 07:32:04 -0700
X-CSE-ConnectionGUID: 6eZa6mynRNynhDMjE63OFg==
X-CSE-MsgGUID: Bb5PS4ZlQ0KS+Dk+J+O2ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; d="scan'208";a="48598247"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jul 2024 07:32:03 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 9 Jul 2024 07:32:03 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 9 Jul 2024 07:32:03 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 9 Jul 2024 07:32:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d6LqCav95tCLp+V9TKRiR0jeHVlCZAz/yh1vYJgQ3jO2hOUUi7HFgg8vOZfyWfjsGePyAqznb7jS5LUwL78iOorXWL0GUaUEsbbYfBzMiPlK9anjtiI9Whzi1YUILECqz4X5UbHDU+8scTR4gYkwTrCFdufzTZbdKInlLwNEsoa1hthB5gTp04GBSK4NcjWJBp+UMt21dIwNp7UrEhgy1oMSLuF/rHNXMQpzenSSdYJRxUKn5gxKe2Ls9jrupOzsg+BJljjFi87NXMRbO1Z/vKfP7P3vDQTzKlvgxiVoHNqlBugmgSn5HCR1oib0pPJfZeVEj07erZ7d9bftkcJtZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aYIm/rrW6keMu/vErEDG1rc+0b0XWjR4BTUfAX1sZoc=;
 b=BWfXdkXq5rm+MhWiQCLh6dp/Ah35gyL6odFdVUszmafzpz7j5OAlyNHYRp9RUm0lQtRi43wzhFLgLaHoEEVoRT8MFcZoxr0/J+JyKdrlrq4Ti7zW/t+RYPrIXr8AnECVqbjQRot4ShtRMBFew/eywBhaFEg1/MmdswE/EEbs1a5YdX2RbEP+MLP8wcEZszOgL1oysfmHxNbWR8JYMgI3FKdAnlKOrxn0r1lt6NJSfkba/X2sU6QQKTjt6ZqrMzw2B3VUUdR+TMV6T9NPwlLPkxAaxNg6OD+HICuk0a2/8bTQhuBV9/8ft8DeWqlypAxZHWTf2BI0EmOWOcKqAodK0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB6544.namprd11.prod.outlook.com (2603:10b6:8:d0::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7741.35; Tue, 9 Jul 2024 14:31:51 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7741.033; Tue, 9 Jul 2024
 14:31:51 +0000
Date: Tue, 9 Jul 2024 09:31:50 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 <intel-xe@lists.freedesktop.org>, Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH] drm/xe/xe2lpg: Extend workaround 14021402888
Message-ID: <wvb5dwk2sf3xehrhztw4algxxswufu77e6vcrwv6gdmzrggocb@tgvmk36rpnos>
References: <20240703090754.1323647-1-krishnaiah.bommu@intel.com>
 <20240703135400.GA2905419@mdroper-desk1.amr.corp.intel.com>
 <vxgd7tn7r2p7k2penw5vozkmmxuhbmardzmuqzielljbdwkmgz@b7elr65a4sxu>
 <20240708174054.GN2906448@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240708174054.GN2906448@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: MW4PR04CA0185.namprd04.prod.outlook.com
 (2603:10b6:303:86::10) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB6544:EE_
X-MS-Office365-Filtering-Correlation-Id: 8add1db5-957c-41d8-a939-08dca023df9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?imaJYoLUeZC62R3TuL52WfS67UR0/tb5jLjYgeoMHnc3JT0crsIsjiKCNymv?=
 =?us-ascii?Q?ulbw3M6Ouu9c6G6WPEJKlwdfRn093AzWYS+vuhqYCFAzLLbHLhjk8T6zt0HD?=
 =?us-ascii?Q?djdXfFnqGi5nnvZBHPR2BhpiSEfFqk0FJTIJm8GudFya1MB66dz2YOK/7CgG?=
 =?us-ascii?Q?Nq5NXJE9S8A2vsVvX9EWTlGqIA1Za6utOGTmUadjMUfsUNSw7n+nt7ipW+Sl?=
 =?us-ascii?Q?xA44mh4V07YVKO4A71CLkzOoU0Pi3SwAx/c4+1cl66LJNpHfCeKOOacyBSr6?=
 =?us-ascii?Q?IIME0Kv0FvKL2HA5cqJPrwLqKi9vdNL8ievPKt87BNnreLtWMKI2Nue/lDNC?=
 =?us-ascii?Q?9HZDAOAgTco1+c9dzPXx0qQTWAT4rmEUbbT0jp9UbL0Rlj6Mi2XYwngM3lPx?=
 =?us-ascii?Q?UrDCefRIeNTPY3pZhZXRT0CmJqTdD++rW76zA2VW1a/EoCa5VQq4d525yqHL?=
 =?us-ascii?Q?qN+QYX5YV4Qz/0HZeRJv0hvgHzbIFlF0qgTx5xiDEed++hWDgFdl2JcJmBfY?=
 =?us-ascii?Q?K8999gG1hOr4S/A9hXIQOWkTijdibEj1YFrwwVZYEf1ZNHh+kk5RWZPtUsEP?=
 =?us-ascii?Q?JMbasSFwfPnWmi8mDrSaFfY0o8N9rZ/H5X3M3x6BH5PnBTs3e9A/dkQfAnRQ?=
 =?us-ascii?Q?vkRldBnm9yJj6yrK/B4rpDQnsgdugdqtan1X7xgY4rp3ltY4bKoAHYpm7KCV?=
 =?us-ascii?Q?D2iI/kBNfHCgVqbMjItx1Ceu0kz/UGsm92ZmGpc2j5oEJd6BYs1lsJBWUdZO?=
 =?us-ascii?Q?wLsS8+aPpNNhT6n59oHmJqmhkV+S8VVYnc4AxXCFWkSSmS8UBYu9wr5QoOrn?=
 =?us-ascii?Q?dw93swAE2j1Lmpa26ImCJSMTSte+lX/qJHoF2XLUtudT2Gxk1lrYEocDb7Xd?=
 =?us-ascii?Q?52+Csg7+FtujCEHytmUWmdgh711hv0ScClgmhkiYKxyuDW5cqg9SClk7VJMz?=
 =?us-ascii?Q?W1FwqJBv8dxjZ/PIWnkfv3622tK+01RpfyV0BzJO7vLpvIHenqm+j9n+PyR8?=
 =?us-ascii?Q?8EvoHJE1rhSQu5A4GfBUeA7kPFg3jNy7DsRBnok2GeBMV7KEF4ZwDFgm8tZp?=
 =?us-ascii?Q?HCv7EC5YWVok54+yoMHSS0JMIi+7aGN4ljnJk2+2diHn4gS65fOAqotEKzYw?=
 =?us-ascii?Q?BKB5vmsFqBH2wv6qmokVQX9QiYeA61LErvQkhohpG+R+5qMaeAGyLGmho6sD?=
 =?us-ascii?Q?UJ7l4quNEneeRiu8TDQMgemckXZ9mSW8w1FuF34rTbqabe/z0DfzQ43gGF5I?=
 =?us-ascii?Q?iA6rY/ZXtf8ZGKfiulI6C8oaZ7sqf+vdn+OhBOMD7JHctQhstncB0wHUn8Sj?=
 =?us-ascii?Q?icYWEYVoZp6R//pJ1aI8szHWI3L++OUAbuhfjsH/TeAEDw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wz31R7qk+A7OvimDTKwK9/5HL+O1pdizlagMccUPDOwTXG9TlTJ9VQDrq3Fr?=
 =?us-ascii?Q?ze8+rzx3VO/YW4K6LECcEvhhX2WPLRzoB8zo0cbrTDSlrRJFAKNfp6anz6jd?=
 =?us-ascii?Q?ZqjemPVm2e+xoJ/2AKUHAMfIiibRjwynCrTOti8s2Lk3atOiVQXtOxba2fjl?=
 =?us-ascii?Q?cp+6D9mcnPP+73zTrdvi2mjhSlqgDTOJ9uyS+ThxfF210kNI85FtFZc2uEjW?=
 =?us-ascii?Q?q4apbovvwfmhn5pE7yh8KZVFrpqVii8Z9BkW+rSotgA//3AhHNwxEX+bUj62?=
 =?us-ascii?Q?g5OwWpz5eUZSCB8HlqDJLH5Guo9//3OEnARflTNca7M4iQUlHq1aGe8Vvro3?=
 =?us-ascii?Q?VCgfTsanT4ErTPYAJY5fco8rPEjTUrHMmE+BoZonCS1oc/E94bULx9P4fFPg?=
 =?us-ascii?Q?BXMLaCkJNq6RPr90w4i3aLMnsJ+c1eEoVGdejRxtt2eKsmtnGX95Y4IkY6AA?=
 =?us-ascii?Q?468KRo5TrOQcR64OI8WIVUwf2pvTX8HWFktJrQFv2fazYUueEPWiPHx4LCF3?=
 =?us-ascii?Q?pNEbUHSDkuRr+NSRcn75tvwpsc+MF0ZLdsT7WWg0p5lNO+Rb4XNOA6db4Sj+?=
 =?us-ascii?Q?/XSZo7FpwDY7OTL49BKksQKa5nMFPy2EVhqbAqGno2jkQI9t4VmdWmjH7e4E?=
 =?us-ascii?Q?7qPfiQhGi0Bcgn3LG5u4DYpJkq/9TOEnUTSWOXk3VAOxI28OUK8nRV84SW4K?=
 =?us-ascii?Q?EtCydDr+IYLm8VGO4X0++arJVwtLifKp9+M/xL9fjrGs4B/6PaTaZFazjBW0?=
 =?us-ascii?Q?6HWfZC2AdfhG6dziGicA3HUUfrGe7VHg5ydbwRfyrgVGFCyZRIrgCsyQIrFw?=
 =?us-ascii?Q?fGgHuYOAKoNONWhf2JTrRb/TSbse8LpaTTfy0q+wPcQfFR1zTH9LHzhQ/z2R?=
 =?us-ascii?Q?ZuYv6vAsUZApf8H9Q6gZiyqACpR073MQ3bSQWyX19Urrn7hfFxOugOjxpvTd?=
 =?us-ascii?Q?XREjYrg1gSgfuz3n2AWBkdBvdWP2KC6KDBm35B82l6CLZeSyhDypTADT0rg1?=
 =?us-ascii?Q?sgbAiEj/4I6zLyL+dHStVN6GmqfT9yT3DOpGKqGl3Cm8CAjVbTPlhA7oTSDf?=
 =?us-ascii?Q?0xmJzDrQcPWdI5szyc1gp8AFUXswzhxs478RNN5xNj7rXF90xhUNtOJ603qp?=
 =?us-ascii?Q?JdRTtHK4iyB9BmnSRs1Ga5bhkRB+TXzfFkk66JGF9HK7nmB4mOz4kuEqqj+k?=
 =?us-ascii?Q?X/RmnUR1ggByQwFEl2oDM59yyEl+RKsTgdJ5D2y7wXaLig7a/3MsmNPSwKdI?=
 =?us-ascii?Q?IuUqXG8SMtL2HQesMzmWMxhfLyG494NEa39l+wdPbJ0OD0CexzhVpCscq2P1?=
 =?us-ascii?Q?RgJgg6ANQWsvc5L92foycjVCLU4Gx7zfwsyXsR2DJO9pf/kjvKZhvuwEoP4C?=
 =?us-ascii?Q?ax1t3efNtuUFoYx4R4aRd8kFdj/0UAQ4hdkjrOXLV7I3SfEzvMgzdVJn5hzC?=
 =?us-ascii?Q?pEe2P8Y94BnvymTxgUvUR9aZupwyf3SX96xs9Vl0Gp7vQ+/DW8j0csqdL/aJ?=
 =?us-ascii?Q?bfHHnpxINS1YJ71wAkeyee6Qd9KpzgpNumADGcn3ndBvbMTVD6TTQf1wI8df?=
 =?us-ascii?Q?mhkjLoufBp2++8FOZxPYc5wKlziu3Jjnxb8Zp5fGArlqHLy2WmpbeBEtvgGS?=
 =?us-ascii?Q?7A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8add1db5-957c-41d8-a939-08dca023df9b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 14:31:51.7838 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EsJ/jdxhaRLk/GHjrzBlkMEiomLQoSCCb0IVp9etxQcn6283u0H9CzFPi0t8NkAM6Tx0454hg859UYqwUqxxpQJnqETozzq0+OZHGAdvtbk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6544
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

On Mon, Jul 08, 2024 at 10:42:11AM GMT, Matt Roper wrote:
>On Mon, Jul 08, 2024 at 12:30:19PM -0500, Lucas De Marchi wrote:
>> On Wed, Jul 03, 2024 at 06:54:00AM GMT, Matt Roper wrote:
>> > On Wed, Jul 03, 2024 at 02:37:54PM +0530, Bommu Krishnaiah wrote:
>> > > workaround 14021402888 also applies to Xe2_LPG.
>> > > Replicate the existing entry to one specific for Xe2_LPG.
>> > >
>> > > Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
>> > > Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
>> > > Cc: Matt Roper <matthew.d.roper@intel.com>
>> > > Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> >
>> > Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
>> >
>> > > ---
>> > >  drivers/gpu/drm/xe/xe_wa.c | 4 ++++
>> > >  1 file changed, 4 insertions(+)
>> > >
>> > > diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
>> > > index c7bf0862b231..91737d7a483d 100644
>> > > --- a/drivers/gpu/drm/xe/xe_wa.c
>> > > +++ b/drivers/gpu/drm/xe/xe_wa.c
>> > > @@ -486,6 +486,10 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>> > >  	  XE_RTP_RULES(GRAPHICS_VERSION(2004), FUNC(xe_rtp_match_first_render_or_compute)),
>> > >  	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, SLM_WMTP_RESTORE))
>> > >  	},
>> > > +	{ XE_RTP_NAME("14021402888"),
>> > > +	  XE_RTP_RULES(GRAPHICS_VERSION(2004), ENGINE_CLASS(RENDER)),
>> > > +	  XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN7, CLEAR_OPTIMIZATION_DISABLE))
>>
>> since the action is exactly the same as for GRAPHICS_VERSION(2001),
>> maybe we should prefer to a) add this one here, with an OR to also apply
>> in GRAPHICS_VERSION(2001) and then remove the one in the bottom of the
>> array that are 2001-only. Thoughts?
>
>We didn't have "OR" capability until a week or two ago, so the pattern
>until now has been to create distinct entries for non-contiguous IP
>versions.  I figure we shouldn't switch styles for just one specific
>workaround, so probably best to keep distinct entries on this specific
>workaround.  But as a follow-up we can decide whether we want to
>mass-convert all of the shared Xe2_{LPG,HPG} workarounds to a new format
>at once.  I think the options are:
>
> * Consolidate with OR's (might be less readable, especially if the list
>   of affected platforms expands in the future?)
> * Switch to [2001..2004] ranges (would need to audit those entries if
>   a new platform shows up with 2002 or 2003 in the future).
> * Keep it as is for now and only consolidate once we're a major IP
>   generation farther down the road.

Fair enough. Applied to drm-xe-next.

thanks
Lucas De Marchi

>
>
>Matt
>
>>
>> Lucas De Marchi
>>
>>
>>
>> > > +	},
>> > >
>> > >  	/* Xe2_HPG */
>> > >
>> > > --
>> > > 2.25.1
>> > >
>> >
>> > --
>> > Matt Roper
>> > Graphics Software Engineer
>> > Linux GPU Platform Enablement
>> > Intel Corporation
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
