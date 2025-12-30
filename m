Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5EC4EE498E
	for <intel-xe@archiver.kernel.org>; Tue, 30 Dec 2025 17:25:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AB5110E261;
	Tue, 30 Dec 2025 17:25:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XiBS6D7L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E0AB10E36E
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Dec 2025 17:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767115556; x=1798651556;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=NibVF+YAVuN9sIculW/Dec0n5WlqwGUreA2ku3hRQ/I=;
 b=XiBS6D7LMFWZlX/2C/TWNjQnnzNIPWGgx9cNhQoUHPaQVsDVia3ZcTYP
 K/HyqK/GhOlj2O8omXNSwdUbfMiqF1GuasTrye70RafIVKxTk0/GfdOnD
 rydev6wFOoCS8vFwKTJ/px/ecRLS7ToJIt1IbzaaEJW5KLCR+Ls5Xi8nW
 xE9v6QCgIlAoIbqI6YxNG7VYf6QPs8MLvyjl/je5QzEu44Tu9CrnP3BPp
 bsBF16tY3JVDQrp4AQs7fuhRH2+L1MOFzkpfBC2if6y8wh4N0pfwcPwM+
 Fic275YyXKKC5aWMzDs3PmEfXJoUDMce67pmOTvlFbo2PXLKIE6UkfWFw w==;
X-CSE-ConnectionGUID: Fv7TbrzFTFCLAhGANgXevQ==
X-CSE-MsgGUID: 91jnJc4ARzmAOb8y2WljIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11657"; a="68869112"
X-IronPort-AV: E=Sophos;i="6.21,189,1763452800"; d="scan'208";a="68869112"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2025 09:25:55 -0800
X-CSE-ConnectionGUID: 8pEXsltXQ/GidsVntIoIsw==
X-CSE-MsgGUID: favSMMxaR2min3lLrAnPag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,189,1763452800"; d="scan'208";a="232337571"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2025 09:25:54 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 30 Dec 2025 09:25:54 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 30 Dec 2025 09:25:54 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.70) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 30 Dec 2025 09:25:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GQu40oc4LCrbIGtfkde5xcAATF+sES8NGgRSQY7ehcG2r4OgVaavVFy6dx4YvsRBETV85mOlIhl7P3FQw4Z97f+bobA7D1m5qREtypy1/vH5zImVfVoMlgKW3rYeCwEIifLIwzewDErqQIIEnsLCXAM3Ajj/mmmnMFURNr3W4jxlzSBPkyGjswyO4PPiroZxeRGifN1F1iHN4TInwm9IPLrOCRswGQeDQJUEhsXU5yWX11ko1G9KoHUbXvO/gNp2vAsZhyjWnNA6HCzXfreVC7wvoOMQ+zVLqDns9a1aLdS0RGCgyj0gpt4yXMAAPVZpoYl50R15ZibL5hD+hI4OHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FtgNkdl5qu0/nX7AQpQ7203KAUq2rUbExZgal9K7+FM=;
 b=tfBVg7GB3tOR1677gtXlvoZ36XCByxCf817D+JXYa54ZrmVsRawUAxgfOLz8suZjhEmm8jwK2BZUKeWcG7xEvVo7DmD49Pw1QYAYxdS+HQb9rIxG13iqFzEyzh/dKygo9ISQgDyDRQBiqG6Q/kCx0ocJE29nrtXEhw8QtwUMVWlkF45rPrjnQaaF6OxqKOP+v9gNo7EsJx9jVxiJZp00OWHL0C780rRXVvkc85xs5zzpowum2H4nWjWoUcGBGP/cN/TvLsAzq/rg2IdgO2ieDMMf3DRYqekby0uomO+vwrpVy8BJK7Wh9UXAufhUxT+2A/5+PXv242rGN4eZ7N7ZQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA0PR11MB7188.namprd11.prod.outlook.com (2603:10b6:208:440::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 30 Dec
 2025 17:25:47 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9456.013; Tue, 30 Dec 2025
 17:25:46 +0000
Date: Tue, 30 Dec 2025 09:25:44 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
CC: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Enable out of tree compile for Xe KMD
Message-ID: <20251230172544.GX4164497@mdroper-desk1.amr.corp.intel.com>
References: <20251224223046.2819609-2-umesh.nerlige.ramappa@intel.com>
 <b131c1d8e94335d679db480f1442b6836a6056e8@intel.com>
 <aVL0lwd7EBrARLvf@soc-5CG1426VCC.clients.intel.com>
 <c40c05e193f59b20896251cfcd69d67734658e57@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <c40c05e193f59b20896251cfcd69d67734658e57@intel.com>
X-ClientProxiedBy: BY5PR04CA0010.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::20) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA0PR11MB7188:EE_
X-MS-Office365-Filtering-Correlation-Id: e6bc1cb1-2126-4e0a-26d5-08de47c8780b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7142099003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EnV5a2Cca25uEKkCTXJZrirENqqNY4St+pBBwN4mIRCt5xVNNKimBHyJTtqO?=
 =?us-ascii?Q?d6ydk7xMquwd8GY7iVHKueZ6urPVONs+mZdiHjaExijziRCMJ2y8cBriZnGG?=
 =?us-ascii?Q?Oj0beGo4EXub9Igal9iwgaqgzxLxBi+Mg01N931wE5tEFijOV0AhsVFDPzOk?=
 =?us-ascii?Q?gnAhvxncIZOL+DHXF3QoZzJHj+5sMDG4xLCtCEHFLGmmejceeOEP87EXVJHX?=
 =?us-ascii?Q?nfepeTH/dFG7fklFyHMjKhqGxR79gLuJv/WA7cnwYo70ESEWOZmBHnIPZJ6M?=
 =?us-ascii?Q?rZ1n6IkfTSwwFCG3FhU3hmDsr6ljSdJhECmZm6m0KHSSFTpbWA5oB9yJirrE?=
 =?us-ascii?Q?7+gefWZNRx76SZTc3jhS0jer9CqgTZ4cw6u+xR6WZA9OlTxIf8g0Hnm1MP50?=
 =?us-ascii?Q?rrzQPnAjreBGBitzWZ/0KuoCDrWmjjGU+4aN3rF7oudbfvRUQb9Elm5kEE+A?=
 =?us-ascii?Q?NJ3B1CBIAGliVAxoTxcJSdNnNw8Z1fdiqvnlzJW2s7d7foJy7H1MgD1Zovde?=
 =?us-ascii?Q?p1Fi1q4nD2bnReKVVSOpfvd8tzBCirWpd+JkPFcNjwnaslcZvs2avwhwx+OD?=
 =?us-ascii?Q?ZsR5O/OjvUM/KnYykGXuUpWxImVgUTSnx34l7I1/ja4eisYzlHvkm2h6VhN1?=
 =?us-ascii?Q?RboxV35pgtOnIQ2h7ljGGiUlzRx2C2VX2st5CZEt2yY/wTPuamTQItecjtKP?=
 =?us-ascii?Q?s3KbupjAq/+6ZZrPKCzo+C/RJa9miHJKtZOKYhlplH9axOuOIbLezpWhPK5j?=
 =?us-ascii?Q?AmVYP3qB13SkyT7pUapmjYFqoUr8G+W6113PfkuHFHD8wQXpxyKaLLOtZrNl?=
 =?us-ascii?Q?jfzI5M1cEQstdtcWbF/ymnJ0m3HqxjqdDdl24LQTUkbsx0S7tEJIXt8IjGlk?=
 =?us-ascii?Q?aN4Goecoy0okDozmTZ3ogK0q7Bc4BegU7vtII5hmhP7CJ9uMYp0VWbB5D3kE?=
 =?us-ascii?Q?KcKprltyiGDLquSZ6kZT6+iMMB3gY0xsrpJayVnXWdXPk3t4ZuGANO86a7uJ?=
 =?us-ascii?Q?BlmBFtMS5hvcXeL6bGHN9ypCHLxp0T1NDzLVTY4CBwDFGU2BF6yU2btUxzPn?=
 =?us-ascii?Q?Bcp8sjkRZuiLLAEsjTBe3QxamsDN5TjHAQ/voimzq0LGFQrbgfq46IRzkLci?=
 =?us-ascii?Q?cFY3yF2e0vmAAXn2YyjH9Nu25dYZQwKhuIEGhwgtWgMlq50Gv2dA1KpJo2HE?=
 =?us-ascii?Q?4hhhci28JU8KTZc8hDSgpdxUTiUqGkmT4Bj5UQ50jKA9u0U6ZQxAEEFW7Tyv?=
 =?us-ascii?Q?ix9fioRNzl0N7+i14F7/HRIaWHftLo+vsX+Y/XWaMck2S8RQobppCjuwOHP0?=
 =?us-ascii?Q?YFH62oqYyZAQJNLcjhx41KTUQl48BQda88MqoaMPheNJGWCklJJWaC/ChbHY?=
 =?us-ascii?Q?QMFdp9eBX9khGYFr9Bydl/QUbEUQEK2kt0fmjCjlVGQ0eayAjtIXi4Zi3IvG?=
 =?us-ascii?Q?Vyx/eB+3n3SXUvzmQSUiHluuGp2t4XCaD2SDe8f5YM2E79lah/HiFw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7142099003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KONOsY4SRwR7+Fnk+cdmHdH5oP3YfauYHjWIXUDeveBjixmI3r20cPNwAOFJ?=
 =?us-ascii?Q?TJWh+xolhGyyTDpBwHeFJleGgBPTj0zynhEcXQQ4vTvQD2A6DPefHf7NvI2E?=
 =?us-ascii?Q?CwMYaoFrjj1v0e3OtKsN2gu2tkp6zNnfOYRfFt9Yr6UQ2SRqvI71QbraNGU9?=
 =?us-ascii?Q?TN4gMvAztJa65OV/w550TBBejcy9NKFTfmCAp85OGSyMMbqYrrNv3jZhbdn3?=
 =?us-ascii?Q?Q3XrhlrpixyKT/aybDATnjUDoQ8vqxJIFfwqvd5CleWOu4lhFOVbBzcA8uzj?=
 =?us-ascii?Q?18FDJ1Z7ICcii+YBveMUYlxohIi3Q5PQ2Mz1eQY6thjIbTH4VYSm07nKmKVA?=
 =?us-ascii?Q?ELu/YcOqYd1OAiGc3FKeQPWrPHfwrPpYcPypZzxxcBnwfWS87s1Gh9lA8MT/?=
 =?us-ascii?Q?QUEDL9MmS4jTdayUl0eYb04Mz2c6IUaAM6K/QkJVvUlWVeZxHeGNDB/n1KCj?=
 =?us-ascii?Q?SE2kZ9VYs5xol3gtX+1bBxJLsSShdRXXdyf0+MQOV8rordiHuf0rIeE8KdrD?=
 =?us-ascii?Q?jSvetDgwTvofn6M7Y2L/C5jbL9TIYr1xPZAYObkM6ctKvqlxBz1oZeyt4T9d?=
 =?us-ascii?Q?6ebhyiH/XUJAvDs8VcOLzTik/4PpPJ+woOIp7rrPCg67U5zAHwKXjlcVkV11?=
 =?us-ascii?Q?EWEiXhaXdne1hu4OukNREyPvNziQSC7BJflkPY9aQL5cDU8U+fYZS4PTXxU2?=
 =?us-ascii?Q?X9B53shGhMc2LkPBI/0V01tvwOXIavpr2RFQeUAzYchOhuhM6jcJnQU5TZPI?=
 =?us-ascii?Q?UHf/9Tz4zaWUlP9Yx7lRbxFfr5ThvUFL6cNarUfEpxHLXOrIy7RWFPD4lIXb?=
 =?us-ascii?Q?cl6ROukWM4qdnPpCIC9l6NdgKOrYq+qrlizAUSH95T0Zt8AJsN6Snq/sRlbI?=
 =?us-ascii?Q?LjV0bvArwiD0tYH+hM8i9EGY+JlQQDL5HkVhDfWYeINfP8q6xQdQ/GtwTyK7?=
 =?us-ascii?Q?ZAKmya265eldVsiJDdwiO7p5qzCIaPEYrnKqo+Nc0W9QlLKdI2/FJmyg1/8s?=
 =?us-ascii?Q?EUj8f+GGsyKhm35rwxHWNh3ogiJqpgz9+qhjN1/VbsndD68pmOUMphrLc9cR?=
 =?us-ascii?Q?/cEpxWCEPdyGBoQUtPN4d2WpxQWx2C561Ol5kA3xboLlxGUZ/4VGQiypHmB3?=
 =?us-ascii?Q?mOoe2A60vYD1tm3YWbHb63qvaFTkuUoprjWg2KeE9nM0rGHJ1/X4poyfGMWP?=
 =?us-ascii?Q?eOjjYCdyLo7g1Fz2NyuxbzdEXTAVHEuCQI5/yUgBi8dzsCsjUQN3ycugHifz?=
 =?us-ascii?Q?vfmfpTk96Po3rE5jZseqwWHaEffAFnhUpc6t5KgUey3UMFZQjyfF9kHCFUtw?=
 =?us-ascii?Q?S1JtYcN+SvD5POtge8LmACgg6zAhFqDsGIF4Lr/Sxippb/zT9/AVKEfexJO+?=
 =?us-ascii?Q?1yVmcrwFbc8Z2RZfuDxlkoN2JikTRNkQ3g6ylRR3JzOd2/esVmA2KsJo2urF?=
 =?us-ascii?Q?n9H81dti2B7z3krIWbsUhAGaMZZ5IoZDPMcbXEZHNgJscRzEVjBGssHCeu88?=
 =?us-ascii?Q?xUhkQb0fOzB3DM6QhCp7Y0eK9uPrG4pKpwmTb3j4vip+eUiF2kr7lc4AgFwA?=
 =?us-ascii?Q?YMSlv3Uxo5wkNNsymS48lI7wux/viPC1/4EJ2b9WTznbwGRyTJLnV3qVo04G?=
 =?us-ascii?Q?bbyLtIYpAX87ylpqZYsuZtzg73aB2OXkuBRWmtVwYlLb7dZj0GlkIV1DI4NA?=
 =?us-ascii?Q?jMdsc2Lw7SZCQcItco0f5X8i/CJGc8AkXQa3viayY+XiRneDDAXFRTh6kbMi?=
 =?us-ascii?Q?RzuTaW35aiTtCgFFEbV9iEMebNnhTK0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e6bc1cb1-2126-4e0a-26d5-08de47c8780b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2025 17:25:46.7927 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GYBY6oqTC/vFuI3Iggex2haZGZ7biUEXVTZCpFuK1jkGF7PGWsx4TmIrokd53/BsXQH2iFkzfNRZl8zPd32ZoAcUZcD4gP2auKjGksvN7D4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7188
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

On Tue, Dec 30, 2025 at 05:03:39PM +0200, Jani Nikula wrote:
> On Mon, 29 Dec 2025, Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com> wrote:
> > On Mon, Dec 29, 2025 at 11:10:56AM +0200, Jani Nikula wrote:
> >>On Wed, 24 Dec 2025, Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com> wrote:
> >>> When trying to build the xe module out of tree, the compile fails to
> >>> find the right trace header files and display paths.
> >>>
> >>> Both i915 and xe directories are copied to an out of tree location and
> >>> the usual commands to build an out of tree module must be used to build
> >>> xe.
> >>>
> >>> Based on the link below, modify the TRACE_INCLUDE_PATH to fix this.
> >>>
> >>> https://lwn.net/Articles/383362/
> >>>
> >>> In addition use relative path for display components in the Makefile
> >>
> >>Please don't do any of this.
> >>
> >>See include/trace/define_trace.h and the comment on TRACE_INCLUDE_PATH:
> >>
> >> * TRACE_INCLUDE_PATH if the path is something other than core kernel include/trace
> >> *     then this macro can define the path to use. Note, the path is relative to
> >> *     define_trace.h, not the file including it. Full path names for out of tree
> >> *     modules must be used.
> >>
> >>See also commit 4e6d7719bdc5 ("drm/i915: Use correct path to trace
> >>include").
> >>
> >>If you are doing some weird out-of-tree hacks, you need to keep them,
> >>well, out-of-tree.
> >
> > Out of tree build didn't work for me without these. Maybe I am missing 
> > something then. Will look into it.
> 
> No matter what, building an upstream in-tree driver out-of-tree is not
> much of a rationale for making changes upstream, is it?

From talking to Umesh offline yesterday, it sounds like "out-of-tree"
might have been a misleading term for what he was trying to do.  I
believe what he was actually attempting was:

  - install a pre-built deb/rpm package of drm-tip generated by our CI
    system
  - checkout drm-tip source at the same commit as the prebuilt binary
  - apply an additional Xe patch for testing
  - rebuild just xe.ko without rebuilding the entire kernel via:

        cd ${drmtipsrc}/drivers/gpu/drm/xe
        make -C /lib/modules/$drmtip/build M=$PWD

So his real goal was just to leverage the symbols+headers from the
pre-built CI package while building drm-tip's xe.ko in the hopes that he
could bypass the need to re-build the rest of the Linux kernel at the
same time.

But I don't think pointing "M=<path>" back at an in-tree location
(instead of a truly out-of-tree module) is something that most people do
and I'm not sure if it's really expected to work for in-tree drivers.


Matt

> 
> BR,
> Jani.
> 
> 
> >
> > Thanks,
> > Umesh
> >
> >>
> >>> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> >>> ---
> >>>  drivers/gpu/drm/i915/Makefile                      | 4 ++++
> >>>  drivers/gpu/drm/i915/display/intel_display_trace.h | 2 +-
> >>>  drivers/gpu/drm/i915/gvt/trace.h                   | 2 +-
> >>>  drivers/gpu/drm/i915/i915_trace.h                  | 2 +-
> >>>  drivers/gpu/drm/i915/intel_uncore_trace.h          | 2 +-
> >>>  drivers/gpu/drm/xe/Makefile                        | 6 +++---
> >>>  drivers/gpu/drm/xe/xe_trace.h                      | 2 +-
> >>>  drivers/gpu/drm/xe/xe_trace_bo.h                   | 2 +-
> >>>  drivers/gpu/drm/xe/xe_trace_guc.h                  | 2 +-
> >>>  drivers/gpu/drm/xe/xe_trace_lrc.h                  | 2 +-
> >>>  10 files changed, 15 insertions(+), 11 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> >>> index 4db24050edb0..13a910a005fa 100644
> >>> --- a/drivers/gpu/drm/i915/Makefile
> >>> +++ b/drivers/gpu/drm/i915/Makefile
> >>> @@ -374,6 +374,8 @@ i915-y += \
> >>>  	display/intel_vrr.o \
> >>>  	display/vlv_dsi.o \
> >>>  	display/vlv_dsi_pll.o
> >>> +subdir-ccflags-y += \
> >>> +	-I$(src)/display
> >>
> >>In particular, I do not want display/ added to header search path
> >>here. We're in the process of removing i915 includes of display headers,
> >>and this makes it harder to track them.
> >>
> >>BR,
> >>Jani.
> >>
> >>>
> >>>  i915-$(CONFIG_DRM_I915_DP_TUNNEL) += \
> >>>  	display/intel_dp_tunnel.o
> >>> @@ -419,6 +421,8 @@ i915-y += \
> >>>  i915-$(CONFIG_DRM_I915_GVT) += \
> >>>  	intel_gvt.o \
> >>>  	intel_gvt_mmio_table.o
> >>> +subdir-ccflags-$(CONFIG_DRM_I915_GVT) += \
> >>> +	-I$(src)/gvt
> >>>  include $(src)/gvt/Makefile
> >>>
> >>>  obj-$(CONFIG_DRM_I915) += i915.o
> >>> diff --git a/drivers/gpu/drm/i915/display/intel_display_trace.h b/drivers/gpu/drm/i915/display/intel_display_trace.h
> >>> index 27ebc32cb61a..aa43f2a5510a 100644
> >>> --- a/drivers/gpu/drm/i915/display/intel_display_trace.h
> >>> +++ b/drivers/gpu/drm/i915/display/intel_display_trace.h
> >>> @@ -853,6 +853,6 @@ TRACE_EVENT(intel_frontbuffer_flush,
> >>>  /* This part must be outside protection */
> >>>  #undef TRACE_INCLUDE_PATH
> >>>  #undef TRACE_INCLUDE_FILE
> >>> -#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/i915/display
> >>> +#define TRACE_INCLUDE_PATH .
> >>>  #define TRACE_INCLUDE_FILE intel_display_trace
> >>>  #include <trace/define_trace.h>
> >>> diff --git a/drivers/gpu/drm/i915/gvt/trace.h b/drivers/gpu/drm/i915/gvt/trace.h
> >>> index 63874d385c6f..235d51ee48ad 100644
> >>> --- a/drivers/gpu/drm/i915/gvt/trace.h
> >>> +++ b/drivers/gpu/drm/i915/gvt/trace.h
> >>> @@ -378,6 +378,6 @@ TRACE_EVENT(render_mmio,
> >>>  /* This part must be out of protection */
> >>>  #undef TRACE_INCLUDE_PATH
> >>>  #undef TRACE_INCLUDE_FILE
> >>> -#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/i915/gvt
> >>> +#define TRACE_INCLUDE_PATH .
> >>>  #define TRACE_INCLUDE_FILE trace
> >>>  #include <trace/define_trace.h>
> >>> diff --git a/drivers/gpu/drm/i915/i915_trace.h b/drivers/gpu/drm/i915/i915_trace.h
> >>> index 7ed41ce9b708..a074a5f542fc 100644
> >>> --- a/drivers/gpu/drm/i915/i915_trace.h
> >>> +++ b/drivers/gpu/drm/i915/i915_trace.h
> >>> @@ -721,6 +721,6 @@ DEFINE_EVENT(i915_context, i915_context_free,
> >>>  /* This part must be outside protection */
> >>>  #undef TRACE_INCLUDE_PATH
> >>>  #undef TRACE_INCLUDE_FILE
> >>> -#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/i915
> >>> +#define TRACE_INCLUDE_PATH .
> >>>  #define TRACE_INCLUDE_FILE i915_trace
> >>>  #include <trace/define_trace.h>
> >>> diff --git a/drivers/gpu/drm/i915/intel_uncore_trace.h b/drivers/gpu/drm/i915/intel_uncore_trace.h
> >>> index f13ff71edf2d..01219e97574b 100644
> >>> --- a/drivers/gpu/drm/i915/intel_uncore_trace.h
> >>> +++ b/drivers/gpu/drm/i915/intel_uncore_trace.h
> >>> @@ -44,6 +44,6 @@ TRACE_EVENT_CONDITION(i915_reg_rw,
> >>>  /* This part must be outside protection */
> >>>  #undef TRACE_INCLUDE_PATH
> >>>  #undef TRACE_INCLUDE_FILE
> >>> -#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/i915
> >>> +#define TRACE_INCLUDE_PATH .
> >>>  #define TRACE_INCLUDE_FILE intel_uncore_trace
> >>>  #include <trace/define_trace.h>
> >>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> >>> index a6749dd6a725..00aa4634f10b 100644
> >>> --- a/drivers/gpu/drm/xe/Makefile
> >>> +++ b/drivers/gpu/drm/xe/Makefile
> >>> @@ -201,16 +201,16 @@ endif
> >>>  subdir-ccflags-$(CONFIG_DRM_XE_DISPLAY) += \
> >>>  	-I$(src)/display/ext \
> >>>  	-I$(src)/compat-i915-headers \
> >>> -	-I$(srctree)/drivers/gpu/drm/i915/display/ \
> >>> +	-I$(src)/../i915/display/ \
> >>>  	-Ddrm_i915_private=xe_device
> >>>
> >>>  # Rule to build SOC code shared with i915
> >>> -$(obj)/i915-soc/%.o: $(srctree)/drivers/gpu/drm/i915/soc/%.c FORCE
> >>> +$(obj)/i915-soc/%.o: $(src)/../i915/soc/%.c FORCE
> >>>  	$(call cmd,force_checksrc)
> >>>  	$(call if_changed_rule,cc_o_c)
> >>>
> >>>  # Rule to build display code shared with i915
> >>> -$(obj)/i915-display/%.o: $(srctree)/drivers/gpu/drm/i915/display/%.c FORCE
> >>> +$(obj)/i915-display/%.o: $(src)/../i915/display/%.c FORCE
> >>>  	$(call cmd,force_checksrc)
> >>>  	$(call if_changed_rule,cc_o_c)
> >>>
> >>> diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
> >>> index 6d12fcc13f43..f3ef77e2bcda 100644
> >>> --- a/drivers/gpu/drm/xe/xe_trace.h
> >>> +++ b/drivers/gpu/drm/xe/xe_trace.h
> >>> @@ -515,6 +515,6 @@ TRACE_EVENT(xe_exec_queue_reach_max_job_count,
> >>>  /* This part must be outside protection */
> >>>  #undef TRACE_INCLUDE_PATH
> >>>  #undef TRACE_INCLUDE_FILE
> >>> -#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
> >>> +#define TRACE_INCLUDE_PATH .
> >>>  #define TRACE_INCLUDE_FILE xe_trace
> >>>  #include <trace/define_trace.h>
> >>> diff --git a/drivers/gpu/drm/xe/xe_trace_bo.h b/drivers/gpu/drm/xe/xe_trace_bo.h
> >>> index 86323cf3be2c..8a687dcf09ba 100644
> >>> --- a/drivers/gpu/drm/xe/xe_trace_bo.h
> >>> +++ b/drivers/gpu/drm/xe/xe_trace_bo.h
> >>> @@ -258,6 +258,6 @@ DEFINE_EVENT(xe_vm, xe_vm_ops_fail,
> >>>  /* This part must be outside protection */
> >>>  #undef TRACE_INCLUDE_PATH
> >>>  #undef TRACE_INCLUDE_FILE
> >>> -#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
> >>> +#define TRACE_INCLUDE_PATH .
> >>>  #define TRACE_INCLUDE_FILE xe_trace_bo
> >>>  #include <trace/define_trace.h>
> >>> diff --git a/drivers/gpu/drm/xe/xe_trace_guc.h b/drivers/gpu/drm/xe/xe_trace_guc.h
> >>> index 78949db9cfce..aac9eebd4815 100644
> >>> --- a/drivers/gpu/drm/xe/xe_trace_guc.h
> >>> +++ b/drivers/gpu/drm/xe/xe_trace_guc.h
> >>> @@ -154,6 +154,6 @@ TRACE_EVENT(xe_guc_engine_activity,
> >>>  /* This part must be outside protection */
> >>>  #undef TRACE_INCLUDE_PATH
> >>>  #undef TRACE_INCLUDE_FILE
> >>> -#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
> >>> +#define TRACE_INCLUDE_PATH .
> >>>  #define TRACE_INCLUDE_FILE xe_trace_guc
> >>>  #include <trace/define_trace.h>
> >>> diff --git a/drivers/gpu/drm/xe/xe_trace_lrc.h b/drivers/gpu/drm/xe/xe_trace_lrc.h
> >>> index d525cbee1e34..ada8f97a99e0 100644
> >>> --- a/drivers/gpu/drm/xe/xe_trace_lrc.h
> >>> +++ b/drivers/gpu/drm/xe/xe_trace_lrc.h
> >>> @@ -47,6 +47,6 @@ TRACE_EVENT(xe_lrc_update_timestamp,
> >>>  /* This part must be outside protection */
> >>>  #undef TRACE_INCLUDE_PATH
> >>>  #undef TRACE_INCLUDE_FILE
> >>> -#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
> >>> +#define TRACE_INCLUDE_PATH .
> >>>  #define TRACE_INCLUDE_FILE xe_trace_lrc
> >>>  #include <trace/define_trace.h>
> >>
> >>-- 
> >>Jani Nikula, Intel
> 
> -- 
> Jani Nikula, Intel

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
