Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EFA9D277C9
	for <intel-xe@archiver.kernel.org>; Sat, 10 Jan 2026 00:16:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F121810E23C;
	Sat, 10 Jan 2026 00:16:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e49cDnIt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B13410E23C
 for <intel-xe@lists.freedesktop.org>; Sat, 10 Jan 2026 00:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768004187; x=1799540187;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9hQifsxTKfJV7jPvaFdK2czRUXyAYNE3SSQ7KRGw85Q=;
 b=e49cDnIthOhJYayO7BUswC0bv5Ud8AwwLHofwcReeqy1B+z42wB/UVco
 QMpEvok3npZJ87wQJKLgINsGxDuwatDS+SANiGf/B0v4Vylc2X3IarGRM
 UQebJ7kZ98wplObbPZwhMXQ7VB0wLJNVuA4bVl1z2YAkme/smu49hKGjc
 9HvbbZmXyZL+HoDtrfxxXyDtarXSIWVFyoXlm6GnaA8VXPLnfOaba7tAn
 kIcL1EdUctm67mRpscMxVJaZC3iikXkTLV8w7+UA3qQ0rbQ2iErJ4y6uy
 yTrP1reku9U9cA+ccu4lXSvJyhlpxnnEU1AN+zM8jtL/WPDXk+MjhST1e A==;
X-CSE-ConnectionGUID: A5mZxNAMRu6IdIQfkUTYXg==
X-CSE-MsgGUID: zo2gfEOOQLOm8a6KnfcgaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="68587089"
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; d="scan'208";a="68587089"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 16:16:27 -0800
X-CSE-ConnectionGUID: 5odpktBVTWK8n4eG+m5ffg==
X-CSE-MsgGUID: p5gQ+hEGTOqbsdQ7jOo1pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; d="scan'208";a="203601788"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 16:16:27 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 16:16:26 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 9 Jan 2026 16:16:26 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.11) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 16:16:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=voCsS84PoM8Q/lP51ipiceKENN69wY+1NuiM7oWkAkZoFYfaafEe4bV/fkkswp6aW72EbEoYM1bd3agRi2kk4NciqYM898nomLKUC/GyxViVZzuqlTU7Mjcd4lxaYeIiAig9ShkqgLj9mf65bpAyI8q8acrdohz9tQQ1LCMfgEOOCbqy4ZDXbKepg89XL12im8F9TvafuIdmRHegh0Zvj2oBqVtforTc6UuPO9HKUz6dJybvyBsT8JycLg2bcJHSmXpysAKRsiIxGw+lK0ZvjRMNcEh1ZDLFGIMjtf4KXS9YFADKxuA8mo6PJFqC2afKAQp10Sm/afqWCduQqHw+YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z/z9J2PCvm9izVVuORIGkC7ZC7DWOpkWTMkWtoSYfAo=;
 b=DS5SatpDURLnMMkqLwgYtOD7CrkQZXsGwoYYZDkGIRtRnWgh9SWxUtrYwr3oQGf6phCUgpaXRdpCOSf9poW6I9ahODzNsZna4OGQjcCgkdnWtSKowKTYqceigXuBdDptviKTU0kEcHU2GfdZyGgXDZ3IcpQbuuQ+hbaLJ44m561enhI/KQRosLlL3UPg6MdqmXfwgjuv0Cl6j0JeFBb9GRzGaaNwTG4yUdGqljWayZsteYM+BbLuCDQEleDzCY2tqzjem90MTm9XgGcUb1XD9KnO3wqaj5S1f6ajAZTfuEpuN1KkYEwRLkSNS7ecVmrjy4OkRXioqrNBQWAyJw423A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by CH3PR11MB8660.namprd11.prod.outlook.com (2603:10b6:610:1ce::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Sat, 10 Jan
 2026 00:16:22 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%7]) with mapi id 15.20.9499.003; Sat, 10 Jan 2026
 00:16:22 +0000
Date: Fri, 9 Jan 2026 16:16:18 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <badal.nilawar@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@intel.com>,
 <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <matthew.d.roper@intel.com>, <michael.j.ruhl@intel.com>,
 <paul.e.luse@intel.com>, <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
Subject: Re: [PATCH v3 5/6] drm/xe/sysctrl: Integrate System Controller into
 device
Message-ID: <aWGaUvte5dvs1Omq@soc-5CG1426VCC.clients.intel.com>
References: <20260108120548.1015154-8-anoop.c.vijay@intel.com>
 <20260108120548.1015154-13-anoop.c.vijay@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260108120548.1015154-13-anoop.c.vijay@intel.com>
X-ClientProxiedBy: MW4PR04CA0291.namprd04.prod.outlook.com
 (2603:10b6:303:89::26) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|CH3PR11MB8660:EE_
X-MS-Office365-Filtering-Correlation-Id: 8054b922-5691-49e6-089b-08de4fdd7bf4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?STQwWVA1ZG01RVFJaTFJblc5d213bHFrRzNWUGtjckV4SUszK0YwQ1dsanR0?=
 =?utf-8?B?aGJRblV2cjhRNEMwQ1kvOHhxcVBNMEhlcmtkTWhQSmp3bjlYL2M2Y2FKaUR6?=
 =?utf-8?B?N0E5bGJhSmYxd0tqaHFHWkYxQXJUUFR1UVM3N1ZwZUJWWDZZMUNFcm9RcVkz?=
 =?utf-8?B?ODZSMHZPK0VmblF2bmJKeVdIelNRVnhjWUh6eEVMb0NKTXBaRHFiSmRtWnNW?=
 =?utf-8?B?aTAwenJ1amd5Zk1aT3N4eE4wWWtIdmtpb2VKRFRtaWFsK2lYak1teFFnblJG?=
 =?utf-8?B?VDd6c3lFM3R3Zkc4OG9RTFU2YWZqaE4vTnNxSHZZazlRSUhNc3Bua1BmRVk0?=
 =?utf-8?B?MXFHWkxmSkFaUFJadUpSQm5ZMHFTM3BUelU1OWpuSmlXOFllaDZWK202UUN4?=
 =?utf-8?B?cWJUa3lPTWtiM0JuTTQyRGlrd2xJcHdQVUdBUlFWdklHaGhNOGpYYkh1Q0NU?=
 =?utf-8?B?dWlHMG94Ym5IUmpXQm9jR29zUjFxT0N6Z05pc2RyVkVQc2ZPN0Z5RmN5TFc0?=
 =?utf-8?B?UUYyQWRlV0t5dzc3am4zeWVDYXBUUnRDdnYveFkrZFllZjlZSm1FTkpWd2J0?=
 =?utf-8?B?c25FZEpPNHRWemhCMmJkby8xWXRVdCt1N3hyZGxXWE9lb29LdmZVbXVvSmIy?=
 =?utf-8?B?MUdVWUtOcW1td1VKZ0d0b21EcHZuZXJ1VHMwMG42YjllVjcxMkJ3QWRSMG52?=
 =?utf-8?B?OTVWYnQvRjN0NWVPbG9VZDdXUW5ESG1HOXlUQTVScDJvRmdHSlYvS2U3cWNO?=
 =?utf-8?B?Mi84TWJ5VHFtaDdiY0lJRlNRTFdPYXBmZEFtV0hyUWVLeGF2QzlXb3hZUmRR?=
 =?utf-8?B?cm5TaEZDVUk2MjJrQzZ4bTNXa0hGQjNYTWRQUjU5blAyL1p6VUtxMGhvRVhN?=
 =?utf-8?B?MGFJempCdGZQbm96eUtab0ZuOVFHQUVNVXJXMGE3NGdMTEprRUl6Zy9DVzV2?=
 =?utf-8?B?aHZ4MGY5bi9XRkttZlMwcVVaNlhyUlBVSktvMzBHdE9vZlhRSkZITHI0R3dr?=
 =?utf-8?B?UzZreEg5RHRQb2MwOW1nUTNPNzBIZ1B5Z00ydVA5Y0RONDNmZEZmazVzWkZJ?=
 =?utf-8?B?cTlUM2s5Nm9PZi91TEVIVGpBNjVOT0oxSUtEbEpKaE5LdTArdUtYUndCcFF5?=
 =?utf-8?B?enVidU14elpQdE1rTlBUaWtabzlMUFNNanJmdVZ4MjVlbURzWGI2bkMrLzhW?=
 =?utf-8?B?cExSeEZmZ3BYNVVvOTNJMy9mK2lBUVI4dDZvaWdpZU5scmZTcG4yVDdmL2VB?=
 =?utf-8?B?MDZCSzJuYUdwWURVOGo2SGVLQ3dscGE4WGNKMUxrQlJHZlZpbmZ1di9jaDUv?=
 =?utf-8?B?aHBpT3hGT2Z4S0lmVyttTnI2SDZQVDRlZkd1RmE4K0NKZVpDcUNGeU0rMk9C?=
 =?utf-8?B?azY2VWExZnpjR2tKM241SUZPSDN4NVNzdWNtdnEzemR6ZXhqMWJJYzNvdmxj?=
 =?utf-8?B?aUNnOHAzbmhKWm5Md3lZdVRLa3lFdG83M2Z5U01wYmNKYzE5TitqRERhd1hL?=
 =?utf-8?B?OXc3VWtPREpTRjJvOUphbGNEeHhaUTcxb003YmVMK3JtNGhpenhHdit3RXV5?=
 =?utf-8?B?UjdrMnJOcWx0N2lpVjZXNlZGOW9qQVI0QXIzUUZDeDdPUTF0djhUNCt4VGdQ?=
 =?utf-8?B?YmpFa1lSVk9DSmhaNzJ1SjFDUG5BY3pINXFHTXF4VHV6ejMxRnRuQWJvY3dP?=
 =?utf-8?B?eW0vQ3dTdGxWSGNaTi9mUjJiRFBmWUVxTzFDMlRrTU9IMDZJWlNqKzZDY00y?=
 =?utf-8?B?YWJGSHZXZmFEbnhkeUtKcWZMbEtpbjRSaStvdDFqenVvMWlqeGthMWNxcnJH?=
 =?utf-8?B?dU9uSEN2cDBIbVdqRWQ1MnQzbVBqS21DOVBSR2xCNVFvVktoT2FiOHBJSk84?=
 =?utf-8?B?UUszUFZqa05KN1E3dWNFTTBiU2hFTW9oY2M4VmZJRzcwWnRnbmtJTGRodENO?=
 =?utf-8?Q?Ek8EuXtZGEdV8yEXxJPk5RA3IhFWFzTM?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N3hyY1pkTEdUbkY3YWp5UjlKWWUxRE9BczN5ZUwyd3VubnpIZEo0WEIyRThC?=
 =?utf-8?B?Z3l1MHhvN0hEOGwvTmZlSjUzTGdzWHZGTGpEVWozajFXbFIrTjdBNWpsdWM5?=
 =?utf-8?B?eTZxWUFqZEY4OGswY3JZNm92Y0hRUC9kUkFMeDdUdTlId0l4QmV6OG1xZmlH?=
 =?utf-8?B?L1dQWTJHcThOeGJGK0tOTUlLMkxRMkxKanFKVFVKSXJXTWhOUWRTTnpic1dF?=
 =?utf-8?B?YXJJQWp0UjJHdWJvU20yRUZCMGEwTGQveTFPTU96MWRTdjBHYmdWcjUwYzhD?=
 =?utf-8?B?SitEMnExdnMvVzZpZmovNUpHTW45RFVuZmZaUFlZL3hGWVhIandLOUVZNUlT?=
 =?utf-8?B?cit3bE01NmtDYWt3RytXbGNMM1pGK3U1K2lKR3F0YnVoVGFYTGltaWs0SmRX?=
 =?utf-8?B?SzUwTWo5dGdBcVhMTE5VU2craC9xU0VBVFoybHc4cGVtVk9wS1JFa2lLckJM?=
 =?utf-8?B?MlJCS2Q3dWVPMU4weGtzVXZIcEVRQlI0Sk9qclRyaC9xMlRpNEtrVVE1QUhG?=
 =?utf-8?B?ck56QkkrdldQNU95NkszWWVsSmc4K3hEYkdNQWFDak1qSXN0UWJwcEh4N09O?=
 =?utf-8?B?N3JWa2tSVy9CYUsxbkVSckRSbHJsUFZMTkhzcTlYTW5UTmE1LzhOTnFiYVZs?=
 =?utf-8?B?MGdMZVJZMmVpWXNYSk5MMGVqMjBTdzZoSUhrMTIzOExwTUZGamdxU1M2WldL?=
 =?utf-8?B?N3JrVEZ5SW9NMHp0cUxGbGtjMDRKS0VPYUNjZk1KQ0dMMHM0ODBrSnh3bEZu?=
 =?utf-8?B?R0dwbzAvcjNIOEJ1c3dwc2FFVTdSNURVNXh2RVpGZWtsWm4xUzhXellNdHNH?=
 =?utf-8?B?ejQ5WlFqd2NDNlMyYnJ0em9ENXRIQm8zV2hyMVFEYk9la3EySFZKUkh3Ny9Y?=
 =?utf-8?B?Um9JVXdIMU9tc09hSHRsaDZpdjJPNGsrUEJFTEpBcTVrQXBHT1Z0OXRZZ2Vw?=
 =?utf-8?B?ZG90WHU2b3F4VTVXMzlqU3Y1bHM4TllSVkI0akg0ZGpXUUJQOGQwVlhsWGk1?=
 =?utf-8?B?bVNzVkVoZXBNUWFYZExIdFkvU2JzaUIzVjhYMCs3MjhEY29wSHdDeDVINC93?=
 =?utf-8?B?T0podURFRnRPS0tGR1ppWEpCM1BmK2tMZ3ZZVFRYU1RhS2hsY2tUSUpZK3VV?=
 =?utf-8?B?N0tabFFSa2V4T2x2K2hVWlpRYjRvVG9YNGVhdTVEcWpFNXJhMmZRZVR2WGp5?=
 =?utf-8?B?RmxyVVFWdDRQNmRRRGp1WDF2THl6NzIyc3FFbkVtcjhzT2xCbDhtZHk3RlRS?=
 =?utf-8?B?aEx4V29XSDhOMmtsek5JbCtoayszOWt3OTdYNGNaSUU2TXdBQTdUQTEvYlhw?=
 =?utf-8?B?dlBObzNVbWl5b09ydFRjd1pVSUp2RzRzZVdEVUROcWZzTS9DL28zUitpQ2tC?=
 =?utf-8?B?MGFtVVZPcEdsYVVOUDBQR2hjOU5ML1FISlpYTVVvRHd6YjMvU0FJZGVOd3lM?=
 =?utf-8?B?YTlRcnVyR1FweTI5NmdLclo0VTBjajFOUGs4WXl3MUoyeStJQzVXam5GNEt2?=
 =?utf-8?B?RVgvT0lrU0NQSkFhdDBBQ0p3WjVNRXRrWFJtc1cxZ2QwYkRRZzdKRUdCeHNs?=
 =?utf-8?B?L2d5dnMwRHB3djNjcFNWWnlzSkFrb1RHVmF0aUtDbjhhcGNyRkdBYUxLNGFy?=
 =?utf-8?B?d2Y2TjhtVXEwdU03REtGYVlFaEw3MlNUWkFhVWlPT01DOWxNTzJxUENGZkwr?=
 =?utf-8?B?RldqamlNMTVxMW9MT3JWN1grVXJ1a3FxRVpyZWdGMzNITktMTjVMdFRDc3pS?=
 =?utf-8?B?NGFDMXdNYUR3Z0RhbU1kOVBKZEt6WnpxMmd1S2JyVkhOdDdTZ0Rha005bFN4?=
 =?utf-8?B?WWVQaGFjaGhsN1dralZHcDJhTEo3SmtuaDRYRk9BNzhRWXZmejg1R2FTU1ZO?=
 =?utf-8?B?RFliSC90N1Fackhkbmg5YW0xcnpSVFRlZlY0YmszcTZVZlJGbGZnMmhHdE5w?=
 =?utf-8?B?c3VvWjUzTlAzcjZsVUxpWDdISC8rdzM0N1BxMDlmSEVTTVMrbHBaUnNFdS8v?=
 =?utf-8?B?R0twRU8vaDVZUDdSYUJNR3cwSW5Bd29ncEoyYkZZaDJjQjdlbVVWdE43Znpk?=
 =?utf-8?B?amhqd294V3lFbFZFYW5tSGp2Q24yVDhtaFRsSmM0YXNTMkVrMHF3Yld3UWI4?=
 =?utf-8?B?b0M0SVMxZUJZSEdjaG1sbG40ZXEyVVRHT0t4c0Z0aDcvRmMwVS80SXBFb205?=
 =?utf-8?B?byt6QVNoYTZ5YXpLSG9Jbjh1ZFdUUk9xSG1GMWJic0xYemd0YW1RLy83cFFD?=
 =?utf-8?B?YzdnQXRhMm9wdDNFUGJLcnF6MVRuRWI3RDB3R282dmdEYUpqTExGZ085OU5s?=
 =?utf-8?B?WS9Xa3gvZ3diaWswZEw5WWtZNlhiUnNQaXoxb0w4RnBzczVTMUtSV1NiRDRH?=
 =?utf-8?Q?8L4fEG3hTcHSLgMqmZih2CvYnPOurhIdW7/tq?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8054b922-5691-49e6-089b-08de4fdd7bf4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2026 00:16:22.0955 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tjGeEOAXngPNh+H5i8J+0R9McnLsFC18J0sKXuiZm94tlcZvVWFtvUpUd0MjFL2lhR9C0pa3lnkVb+FZYc41sVZ6QYJEx65G773UCsgF8KI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8660
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

On Thu, Jan 08, 2026 at 04:05:53AM -0800, Anoop, Vijay wrote:
>From: Anoop Vijay <anoop.c.vijay@intel.com>
>
>Add System Controller to the xe_device structure and wire
>up initialization during device probe.
>
>Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>---
> drivers/gpu/drm/xe/xe_device.c       | 5 +++++
> drivers/gpu/drm/xe/xe_device_types.h | 6 ++++++
> 2 files changed, 11 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>index f4741cbe4c45..e11339e10433 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -66,6 +66,7 @@
> #include "xe_survivability_mode.h"
> #include "xe_sriov.h"
> #include "xe_svm.h"
>+#include "xe_sysctrl.h"
> #include "xe_tile.h"
> #include "xe_ttm_stolen_mgr.h"
> #include "xe_ttm_sys_mgr.h"
>@@ -1027,6 +1028,10 @@ int xe_device_probe(struct xe_device *xe)
> 	if (err)
> 		goto err_unregister_display;
>
>+	err = xe_sysctrl_init(xe);
>+	if (err)
>+		goto err_unregister_display;
>+
> 	err = xe_device_sysfs_init(xe);
> 	if (err)
> 		goto err_unregister_display;
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>index a85be9ba175e..6295b2c35d4a 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -29,6 +29,7 @@
> #include "xe_sriov_vf_ccs_types.h"
> #include "xe_step_types.h"
> #include "xe_survivability_mode_types.h"
>+#include "xe_sysctrl_types.h"
> #include "xe_tile_sriov_vf_types.h"
> #include "xe_validation.h"
>
>@@ -340,6 +341,8 @@ struct xe_device {
> 		u8 has_soc_remapper_telem:1;
> 		/** @info.has_sriov: Supports SR-IOV */
> 		u8 has_sriov:1;
>+		/** @info.has_sysctrl: Supports System Controller */
>+		u8 has_sysctrl:1;
> 		/** @info.has_usm: Device has unified shared memory support */
> 		u8 has_usm:1;
> 		/** @info.has_64bit_timestamp: Device supports 64-bit timestamps */
>@@ -606,6 +609,9 @@ struct xe_device {
> 	/** @heci_gsc: graphics security controller */
> 	struct xe_heci_gsc heci_gsc;
>
>+	/** @sc: System Controller */
>+	struct xe_sysctrl sc;
>+
> 	/** @nvm: discrete graphics non-volatile memory */
> 	struct intel_dg_nvm_dev *nvm;
>
>-- 
>2.43.0
>
