Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72BADCCF9F8
	for <intel-xe@archiver.kernel.org>; Fri, 31 Oct 2025 19:33:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3711710E08B;
	Fri, 31 Oct 2025 19:33:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="it8efAq4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E955510E08B
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Oct 2025 19:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761939237; x=1793475237;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=JWKdQ/kIMCrUHxctcnUft6lBTcIDtkW0qIe407eYP/Q=;
 b=it8efAq4jOtt7k5Q/U/N5NBbtfqwbuIaVI+xzkjAu/IaAG6zPx86oPiL
 dXM/0gyU2hig3/nek5POFb+IQXR7/vtbmke3BNKs+LZG1O3xbl+8iXlJW
 otPDgPOdLBdJza5eWw9zAdo2OQoFrZHXnoXxp1FXk81q7KiLicbFlcj5I
 xH+sRWYw0oXU+DC3pos37z2X5Lt8859uxE6h9LpCLZ9JRp8PFrYiVVqMA
 KL/OCTixjYh1KSAi0Pxb47aPROv8QPrl8tRD/CgcC+evvXuNxbI3Pl8un
 JrTucqnpqJf8OmqEwrnindLnROFjUsJ2/10DqNhwYjibldKavA8pULR4O g==;
X-CSE-ConnectionGUID: OD/BFKJVQlmVGI12IQ7Q0g==
X-CSE-MsgGUID: cIUmBS1/QiOw5KMNqAzm7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64037379"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="64037379"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 12:31:29 -0700
X-CSE-ConnectionGUID: 3+Jb0ZdkTVyJf6R3mXBZag==
X-CSE-MsgGUID: L7eJkq1VSoOWGkcZsmJI4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="191458602"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 12:31:29 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 31 Oct 2025 12:31:29 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 31 Oct 2025 12:31:29 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.41)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 31 Oct 2025 12:31:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hepEbBq/QaJpX+VaA+0ESSXVl8Se6Wh62mrWf6srsTkihFvKutWQlErdm+Ll4c4u2vpwW79aFXAsBrflr9W/MieIJkAYP5Na2Z5j7fn8Wd6CORt5oCa5OQs6SLdGbNWx3PZWg9WveBlQnBki/B1hFnZXSV9/O2DYjSvUwL2CsMatDZU6iQ6pUlPppwtdbhb27I04Bv/SzFxE60ZdtaY15awdL44+O1xyDMwPZPyHXomGWe0cBZxIIzLSMWIteV3clP4e+lr3JSlz5V1pQ6SIAKp6MUl4Ip6IVIpcq3h5hQZI8Tvni3c1a3K9OsfNSUq0pS3YfWmX2j/wgy7noVRthg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xgpehWgBPZO5+cLtboCveYUBNq8v34YbAgu9pFquUA0=;
 b=kso11zwmbfx4jOAuNO9QLghZyhOqfxTsmx21gjcOi7TJK/DQOumtdV+ScIMA25ZlQT4/kgIlvAzsyPUqC3Fgh4z0s/QG+QSrJlTgAVUG/ozlkZplDDBxwg/3jrUhfIIdowsvjhW9nq+DgNt6/xoWxbVORaeablW+A4ywgCqtWnSb0IG7DvbAJKRn0/PFob9++MY/9+IXyXIKOiHakpL5Owr41WL4apJT15sSEPb9YucuiQ0Q+oi/Op5oqNpBHW0D4IQgsyEI+20gaPydDlozTDyYcflodldeaFfmrElk83Dc3ggqfzHbC5DFg4MDO37KRwMUYbtRY7gv/Gb5tcOwRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB4901.namprd11.prod.outlook.com (2603:10b6:510:3a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Fri, 31 Oct
 2025 19:31:27 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9253.017; Fri, 31 Oct 2025
 19:31:27 +0000
Date: Fri, 31 Oct 2025 12:31:24 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 02/16] drm/xe/multi_queue: Add user interface for multi
 queue support
Message-ID: <aQUOjCwmhFKsR1tD@lstrano-desk.jf.intel.com>
References: <20251031182936.1882062-1-niranjana.vishwanathapura@intel.com>
 <20251031182936.1882062-3-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251031182936.1882062-3-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: SJ0PR05CA0209.namprd05.prod.outlook.com
 (2603:10b6:a03:330::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB4901:EE_
X-MS-Office365-Filtering-Correlation-Id: 383f1959-c521-4a11-967b-08de18b4158d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?alZVaFFYL3czc0o0dE9Wc3I1N05JeFVNTHlHRXZROG1zdVhLdVlUTDFEZ1Fz?=
 =?utf-8?B?c0NVTUVvWTBKd2c1ZHJwOEpwWDZ1YmFzYWNTUGNJaXlja1VwWjJQV29EamFn?=
 =?utf-8?B?KzdXcGh5ZVJkS21JZHRVajFhQ0lyRE5kR1FaK1pzNXhHZ3AyOEMwSHQ4a2p2?=
 =?utf-8?B?czFJM1hHcjBQb3E3N3RVaUJwN3RJVGFncFpLWDhmYWZuOUFhdzBUTG13OHhn?=
 =?utf-8?B?b2Z5RUlZaGQ5ZTJtWnJEVEhrRFFwN0t1QW1ZNm5jSVp2dW9EbDhjZUQrNjR1?=
 =?utf-8?B?cWs4MjR6ZXR6UWVXL2djMzNaWHJSYkk0M255eXFkSWNxaUcwVWJFYnE4WHhH?=
 =?utf-8?B?ajVlUStpNExIcjQ0c2piSzJnYWhKaHVqWnltZHp3L1JHWGxCQXRYNThaSzJL?=
 =?utf-8?B?OVVYSGswTUg0SmFjbkdwc29tYmk4M0ZNSE5QUXNLZjlMZVZjazFOdElXUlp3?=
 =?utf-8?B?RkUzK3Q5eFozNlN3M056UlJaZXV0T2s1WGoxZzJaYndudG9od25mV1ZobHkz?=
 =?utf-8?B?T1hjZXJZMnV1cE5Vd3BiTG9ramRhL0hseWVUbUFQQTA2WDFDODY3MkZGaTFi?=
 =?utf-8?B?djZndTJzdkJWcGNDRXQyd1owOWVISmVQZm9maVBrYXVUcTY5ZUJtMUowaGhK?=
 =?utf-8?B?cWJmclpNeW9CZEtYYTlZZ0RXY2Y2T1U2bDd5Mlgwc2M4dW1PNFNFWXF4R3I4?=
 =?utf-8?B?ZURzQ1p1ZlI1UHRxR1dJeElEM2JMWnN2alRNWm9PVUJETVZSZUt5amowNXJF?=
 =?utf-8?B?eTJMTEs1ODQ3NThwR2tBcEszV0lHc1dTc1lscVI3SHVpc0JoUSt3cHRRdUNT?=
 =?utf-8?B?K2JOZzRjUEFOYlR5ekt6d1dIanAxMDY3QktISklwMlg4U1lDRC9WZ1Z5cmJB?=
 =?utf-8?B?ckMxK2E3Rk5IeU1iYVZEbVAvSW9nWDlIVFJCOUkzdzNndEE5T1lDbU02MEw2?=
 =?utf-8?B?SXV5c2tGRW8zMmJ0NGJxMGxzMURoaThKblRFUHJBaytzVSs1WFo5amNTazFz?=
 =?utf-8?B?SU5HcUcxNmN2UXc3aHYrY1lkQUppaWZvcEgwZkZSMnFCZkpSQlhPQ1VrQkhJ?=
 =?utf-8?B?M1lRblhPR2VwWHlRQktUbmxGZnZOUHBYaFpNM21Tc2dxcDUrSjIxVVB4elhL?=
 =?utf-8?B?ZGd6bHY4TWgveTIvNEJkOUFNV1NsZ0hUTnBvbGw1Smd0ZVZnMnpHWE1yRFNM?=
 =?utf-8?B?RFRzL2t4b2x1M1FZUjJEc05XaFBPbHhkTzZtcmxRc0Rvd1AzWDZpMnV4WXVI?=
 =?utf-8?B?bGkra3BxTGFRODBJOGM1NlJxcTVVK3JGdCtnZndNNmdMYTR3N21aenhlU0dI?=
 =?utf-8?B?Y1ZubXQ3ZEFEY25GVWZERmx5Q1FEVmg3VVlOOTJ4NSthMUl3bU1yNjRNdTJz?=
 =?utf-8?B?UFcxaFAvVzBoVFB5ZklpWmNTdm14T1JnRU9zQnNwWXVpWG4yNFJoWDRVYW9M?=
 =?utf-8?B?UmM2UTJrNjBSc2pLZnhKWXpydEx4V0VSb1BlU1VEaUVGUy92SEZONnFsbC9G?=
 =?utf-8?B?Ky9QeUJVWXlHS09sdTdLcXpCVWthdFZJRGVubkNBc1hmaXZjQzJMeC9MeDA0?=
 =?utf-8?B?MmVENlpnN0RZakdwSm9ZOU8wenV5Wm1Kd2J0UmJ2T2dSN0szY0hyUUlta0dv?=
 =?utf-8?B?WWdpTEIwd094UVNQSE5yRStxdXdLaFhGSUl0TEhXVmRqYndXMlU1U01FUlJl?=
 =?utf-8?B?YVAvVVNNdHVyUmwwb1JtdXhUd3NqRURac0J2Q01EUzk5aTVHN3lXNHpnTUdE?=
 =?utf-8?B?U0hmVFgzSkxsN085SHhIWHMwSWI0MWRicTVxUUtyaUxBbVNKUkE2UTNLZG9G?=
 =?utf-8?B?bFNCSEpqRHNBZXFqU1V4MXViY0ZzSVY4Q0F2WEJZZUd0U0hWMmFuc2dObEdr?=
 =?utf-8?B?NHptNnhGdGpLOXZXYXNicHlKVW8rSFdoRzdoL0o3MkcvY1pYb2FzN0E1UWc4?=
 =?utf-8?Q?LC0DokAJx2HA3yvkZppt5g5xZ1WY4cqs?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?am4zVXNGV1M5YytyUzk1RUI1L29yS3VpRHg2a2NGTVV3VEJqNlZnSldlRnE3?=
 =?utf-8?B?QitvV2NCbDlhVkJtMUQzRHp2N2Y2SjAzSHdIS0NVZVl0MldpSU1mTzlDQ2lW?=
 =?utf-8?B?b0FYb21rUGxSc3ZxVVd0VklQYUhmZytCRWtYQmFmdVQ0Y3dhMG1hT3ltLytV?=
 =?utf-8?B?VkxhSWljRm9nL056OUllSnVqZWFUWnA5Qy9Ud3FhRjBXdm5lamdDTmliVC9O?=
 =?utf-8?B?NFRobFQ5Y1VuczlzOFFadUtoUzhrRUdiUVNrYkJtN1lUWGZpNWpCejhxTnlm?=
 =?utf-8?B?cnFqRWx1NUFlaXVEK1hLOUo4THp2cy9hS3prVmdGTlZPQU1jZ0NjVE8yZ0V0?=
 =?utf-8?B?b0Nld2NFVVdsYit5QnhodnZGdDgxV3JnMGJubGh1L0ZvUTBlc1hBWENhQUQ2?=
 =?utf-8?B?MkFtYzVqRmlBWFNwVTRNQ0g0aWdJc2NRVDZNd3lYYnFGeUJhY0xjaUw4d0Ru?=
 =?utf-8?B?dHJ6N0lJelRGdS9FajBDY2o4RklNYkZsZXdzMGFqak9Dc2wzMysvM1F5dWhJ?=
 =?utf-8?B?OHhmbWNua2JTRGV3Vkd6Q050YlVrMVZMNzdBWDZKaUNtb2NEMk1uQysvNmlz?=
 =?utf-8?B?MjdBSU5mZjYzSVRkUGxlYkxPVFdHK1EyQjF6V2hTUVYwQzRMaHZTTWxnd09Z?=
 =?utf-8?B?RHZmZngydlo1ZzFKMW9YK0dKU0ZNVHBoWmd4WXRuOHRUcHZGaG9WZ2kvUjB6?=
 =?utf-8?B?RUFtMkFjajJIamdyVWh5T28xVFU2aGZCVUZiZFAvZ2tKMDRGaXlwS2xVb2lU?=
 =?utf-8?B?bENJSmpkMEY4UnR3UVk2VUREbUNiNVlpekNVZ2QxZGFkQmVzYkxoZWRGbkY1?=
 =?utf-8?B?ZDFuaGxTeHRyK1RpdXlDRFVUdUdYUFEzNnFBWi84clNRWWpwQkZpUGM5b0wz?=
 =?utf-8?B?MkNmMENxNy9nVzM2bXFFeGkwSnZOS1pMbEU2cUtwQ3RxdjlzNy90VnhFMzVN?=
 =?utf-8?B?eHJZSW8xZS9VTUJZaUxBVUhFWnY3Q0w3Q21OaTEycHhGWmVraUliT0syYzNL?=
 =?utf-8?B?Q1NBVE0zVk4zc0lTZGgza0xqSGJOZGRSdnpwb05HcVd1V3dXc1lCREFMdGRj?=
 =?utf-8?B?NXF6L0lrOGFjWjIyVU4xSktIT0w4NnloZFFOdjVsb21oVDg2eGx5MmU2cG5M?=
 =?utf-8?B?UnhHc0cvNkZueHYrRnlQWUI4dFRqK0UyMkZIZ0kyWng4N1V2VFFpbE9KWHhL?=
 =?utf-8?B?dnZEK2JWbFZWenhOYThaMFRtRFkrQStDMHZER3ExZjdScnJRKzRmZWN4RjI4?=
 =?utf-8?B?eTk4UXA3N1E3QUprOWtBdlNvSnhhNTQ0L2ZtQThZcXZmd2N1NmtuNzgyZFJC?=
 =?utf-8?B?TE5BMU5xcTBJclhuSlRBQWlZaHJRUVZmb0t1THgrbmUzQ0x4ZGRiTHp3cmFZ?=
 =?utf-8?B?YTVtVWlYQy9PeHJIdWRRMlRsNml5UmlTWGhkRW51K2JYTi9QVnJTTU5qRjN2?=
 =?utf-8?B?ZXJCM0dESGJhSmVuMHVSVTlrR2NRZ0hQZ2RaWDZyOHZDZWNnOVlJbzFXbVB6?=
 =?utf-8?B?ZGhWaEVZTk9pUTJJdENNcDRaUElCWnAyVGprNUUvOS9ibW5Mc3ZPeDMrY0VW?=
 =?utf-8?B?SEVSQi9RTjBFQXJXa2gzNW9lWUd4Yk5Vek5ScjBWNXhGYjBZN3NXRWlGZHN5?=
 =?utf-8?B?OXhsaGpsQXIxRjZsc2hTV3Z3b3hTaHBIWGtFaVB2U2Q0TGhKRThJak9yaUJt?=
 =?utf-8?B?aUFOb1lPREVyalhpU3VwcHdaejBNSzNvTEJKbndsWGk3cjRiSC9pZE1mN04y?=
 =?utf-8?B?T2ZFVmN2SDBlOUdvN3RhZFRZN0FqZ2hCSzFMQmxiMDNCbUppRkFhUlhVTnlQ?=
 =?utf-8?B?RDJDUmRVT0p0c0JGMUU2ZExSV01rdEppVTg3TEo3NmFjU3NzZEFDTUtzNmY0?=
 =?utf-8?B?dVQvM0xOSUdkRkpFQ2VFOWpnZW1WQWQ5UHRwcUZCTzg4dmcwRUVTUys4MjMy?=
 =?utf-8?B?WWpENUhNMU5wWmpKL3NsVkNzeFhJUHRxYy9qSCtmRDdBVFBoZkFlZS9tZXl0?=
 =?utf-8?B?cWh1YlNpWXBoSm1CRVNoK3ZiNkNBRyt0cnFaSDVGUFhaTktsNW5PeERHR2hU?=
 =?utf-8?B?K3lJSDIxZHl5Y2lzbmtaZlFKeHdRcDFuam9SejFyQW5WcjUxcUg1WHlqdmg4?=
 =?utf-8?B?bWdLc1o5bWR4dzJnOGw3M2N5STVnQllDTnhHM0FUbjJFSkhMVE5CbE8zenh2?=
 =?utf-8?B?RXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 383f1959-c521-4a11-967b-08de18b4158d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 19:31:27.1531 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BXY66Hwunljjun/gKHwXALPsNbW/mWBWI6ane7UlNTUq/YWKfv8gPobz5pfRkyaoAQjBMQjYS7oMLgs9IxH00g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4901
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

On Fri, Oct 31, 2025 at 11:29:22AM -0700, Niranjana Vishwanathapura wrote:
> Multi Queue is a new mode of execution supported by the compute and
> blitter copy command streamers (CCS and BCS, respectively). It is an
> enhancement of the existing hardware architecture and leverages the
> same submission model. It enables support for efficient, parallel
> execution of multiple queues within a single context. All the queues
> of a group must use the same address space (VM).
> 
> The new DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE execution queue
> property supports creating a multi queue group and adding queues to
> a queue group. All queues of a multi queue group share the same
> context.
> 
> A exec queue create ioctl call with above property specified with value
> DRM_XE_SUPER_GROUP_CREATE will create a new multi queue group with the
> queue being created as the primary queue (aka q0) of the group. To add
> secondary queues to the group, they need to be created with the above
> property with id of the primary queue as the value. The properties of
> the primary queue (like priority, timeslice) applies to the whole group.
> So, these properties can't be set for secondary queues of a group.
> 
> Once destroyed, the secondary queues of a multi queue group can't be
> replaced. However, they can be dynamically added to the group up to a
> total of 64 queues per group. Once the primary queue is destroyed,
> secondary queues can't be added to the queue group.
> 
> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c       | 191 ++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_exec_queue.h       |  47 ++++++
>  drivers/gpu/drm/xe/xe_exec_queue_types.h |  30 ++++
>  include/uapi/drm/xe_drm.h                |   8 +
>  4 files changed, 274 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 1b57d7c2cc94..86404a7c9fe4 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -12,6 +12,7 @@
>  #include <drm/drm_file.h>
>  #include <uapi/drm/xe_drm.h>
>  
> +#include "xe_bo.h"
>  #include "xe_dep_scheduler.h"
>  #include "xe_device.h"
>  #include "xe_gt.h"
> @@ -62,6 +63,32 @@ enum xe_exec_queue_sched_prop {
>  static int exec_queue_user_extensions(struct xe_device *xe, struct xe_exec_queue *q,
>  				      u64 extensions, int ext_number);
>  
> +static void xe_exec_queue_group_cleanup(struct xe_exec_queue *q)
> +{
> +	struct xe_exec_queue_group *group = q->multi_queue.group;
> +	struct xe_lrc *lrc;
> +	unsigned long idx;
> +
> +	if (xe_exec_queue_is_multi_queue_secondary(q)) {
> +		xe_exec_queue_put(xe_exec_queue_multi_queue_primary(q));
> +		return;
> +	}
> +
> +	if (!group)
> +		return;
> +
> +	/* Primary queue cleanup */
> +	mutex_lock(&group->lock);

I don't think you need the group->lock here. Xarrays have their own
internal locking.

We do use mutexes around xarrays in Xe, but that's to protect the object
reference—not the xarray itself.

For example, we follow this pattern:

lock();
obj = xa_find();
if (obj)
	xe_obj_get(obj);
unlock();

Similarly, we apply a lock on the removal side. This prevents the object
from being removed and a reference being dropped in parallel with a
lookup (i.e., it avoids a use-after-free).

We don’t always use this pattern correctly—some of that is legacy code
we haven’t cleaned up yet—but we should.

In your case, you're not protecting any object references (i.e., there's
no lookup function involved), as far as I can tell. So there's no need
for a lock here.

Matt

> +	xa_for_each(&group->xa, idx, lrc)
> +		xe_lrc_put(lrc);
> +	mutex_unlock(&group->lock);
> +
> +	xa_destroy(&group->xa);
> +	mutex_destroy(&group->lock);
> +	xe_bo_unpin_map_no_vm(group->cgp_bo);
> +	kfree(group);
> +}
> +
>  static void __xe_exec_queue_free(struct xe_exec_queue *q)
>  {
>  	int i;
> @@ -72,6 +99,10 @@ static void __xe_exec_queue_free(struct xe_exec_queue *q)
>  
>  	if (xe_exec_queue_uses_pxp(q))
>  		xe_pxp_exec_queue_remove(gt_to_xe(q->gt)->pxp, q);
> +
> +	if (xe_exec_queue_is_multi_queue(q))
> +		xe_exec_queue_group_cleanup(q);
> +
>  	if (q->vm)
>  		xe_vm_put(q->vm);
>  
> @@ -549,6 +580,148 @@ exec_queue_set_pxp_type(struct xe_device *xe, struct xe_exec_queue *q, u64 value
>  	return xe_pxp_exec_queue_set_type(xe->pxp, q, DRM_XE_PXP_TYPE_HWDRM);
>  }
>  
> +static int xe_exec_queue_group_init(struct xe_device *xe, struct xe_exec_queue *q)
> +{
> +	struct xe_tile *tile = gt_to_tile(q->gt);
> +	struct xe_exec_queue_group *group;
> +	struct xe_bo *bo;
> +
> +	group = kzalloc(sizeof(*group), GFP_KERNEL);
> +	if (!group)
> +		return -ENOMEM;
> +
> +	bo = xe_bo_create_pin_map_novm(xe, tile, SZ_4K, ttm_bo_type_kernel,
> +				       XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> +				       XE_BO_FLAG_GGTT, false);
> +	if (IS_ERR(bo)) {
> +		drm_err(&xe->drm, "CGP bo allocation for queue group failed: %ld\n",
> +			PTR_ERR(bo));
> +		kfree(group);
> +		return PTR_ERR(bo);
> +	}
> +
> +	xe_map_memset(xe, &bo->vmap, 0, 0, SZ_4K);
> +
> +	group->primary = q;
> +	group->cgp_bo = bo;
> +	xa_init_flags(&group->xa, XA_FLAGS_ALLOC1);
> +	mutex_init(&group->lock);
> +	mutex_init(&group->list_lock);
> +	q->multi_queue.group = group;
> +
> +	return 0;
> +}
> +
> +static inline bool xe_exec_queue_supports_multi_queue(struct xe_exec_queue *q)
> +{
> +	return q->gt->info.multi_queue_enable_mask & BIT(q->class);
> +}
> +
> +static int xe_exec_queue_group_validate(struct xe_device *xe, struct xe_exec_queue *q,
> +					u32 primary_id)
> +{
> +	struct xe_exec_queue_group *group;
> +	struct xe_exec_queue *primary;
> +	int ret;
> +
> +	primary = xe_exec_queue_lookup(q->vm->xef, primary_id);
> +	if (XE_IOCTL_DBG(xe, !primary))
> +		return -ENOENT;
> +
> +	if (XE_IOCTL_DBG(xe, !xe_exec_queue_is_multi_queue_primary(primary)) ||
> +	    XE_IOCTL_DBG(xe, q->vm != primary->vm) ||
> +	    XE_IOCTL_DBG(xe, q->logical_mask != primary->logical_mask)) {
> +		ret = -EINVAL;
> +		goto put_primary;
> +	}
> +
> +	group = primary->multi_queue.group;
> +	q->multi_queue.valid = true;
> +	q->multi_queue.group = group;
> +
> +	return 0;
> +put_primary:
> +	xe_exec_queue_put(primary);
> +	return ret;
> +}
> +
> +#define XE_MAX_GROUP_SIZE	64
> +static int xe_exec_queue_group_add(struct xe_device *xe, struct xe_exec_queue *q)
> +{
> +	struct xe_exec_queue_group *group = q->multi_queue.group;
> +	u32 pos;
> +	int err;
> +
> +	if (!xe_exec_queue_is_multi_queue_secondary(q))
> +		return 0;
> +
> +	mutex_lock(&group->lock);
> +	err = xa_alloc(&group->xa, &pos, xe_lrc_get(q->lrc[0]),
> +		       XA_LIMIT(1, XE_MAX_GROUP_SIZE - 1), GFP_KERNEL);
> +	if (XE_IOCTL_DBG(xe, err)) {
> +		xe_lrc_put(q->lrc[0]);
> +		mutex_unlock(&group->lock);
> +
> +		/* It is invalid if queue group limit is exceeded */
> +		if (err == -EBUSY)
> +			err = -EINVAL;
> +
> +		return err;
> +	}
> +
> +	q->multi_queue.pos = pos;
> +	mutex_unlock(&group->lock);
> +
> +	return 0;
> +}
> +
> +static void xe_exec_queue_group_delete(struct xe_exec_queue *q)
> +{
> +	struct xe_exec_queue_group *group = q->multi_queue.group;
> +	struct xe_lrc *lrc;
> +
> +	if (!xe_exec_queue_is_multi_queue_secondary(q))
> +		return;
> +
> +	mutex_lock(&group->lock);
> +	lrc = xa_erase(&group->xa, q->multi_queue.pos);
> +	if (lrc)
> +		xe_lrc_put(lrc);
> +	mutex_unlock(&group->lock);
> +}
> +
> +static int exec_queue_set_multi_group(struct xe_device *xe, struct xe_exec_queue *q,
> +				      u64 value)
> +{
> +	if (XE_IOCTL_DBG(xe, !xe_exec_queue_supports_multi_queue(q)))
> +		return -ENODEV;
> +
> +	if (XE_IOCTL_DBG(xe, !xe_device_uc_enabled(xe)))
> +		return -EOPNOTSUPP;
> +
> +	if (XE_IOCTL_DBG(xe, xe_exec_queue_is_parallel(q)))
> +		return -EINVAL;
> +
> +	if (XE_IOCTL_DBG(xe, xe_exec_queue_is_multi_queue(q)))
> +		return -EINVAL;
> +
> +	if (value & DRM_XE_MULTI_GROUP_CREATE) {
> +		if (XE_IOCTL_DBG(xe, value & ~DRM_XE_MULTI_GROUP_CREATE))
> +			return -EINVAL;
> +
> +		q->multi_queue.valid = true;
> +		q->multi_queue.is_primary = true;
> +		q->multi_queue.pos = 0;
> +		return 0;
> +	}
> +
> +	/* While adding secondary queues, the upper 32 bits must be 0 */
> +	if (XE_IOCTL_DBG(xe, value & (~0ull << 32)))
> +		return -EINVAL;
> +
> +	return xe_exec_queue_group_validate(xe, q, value);
> +}
> +
>  typedef int (*xe_exec_queue_set_property_fn)(struct xe_device *xe,
>  					     struct xe_exec_queue *q,
>  					     u64 value);
> @@ -557,6 +730,7 @@ static const xe_exec_queue_set_property_fn exec_queue_set_property_funcs[] = {
>  	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY] = exec_queue_set_priority,
>  	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE] = exec_queue_set_timeslice,
>  	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE] = exec_queue_set_pxp_type,
> +	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP] = exec_queue_set_multi_group,
>  };
>  
>  static int exec_queue_user_ext_set_property(struct xe_device *xe,
> @@ -577,7 +751,8 @@ static int exec_queue_user_ext_set_property(struct xe_device *xe,
>  	    XE_IOCTL_DBG(xe, ext.pad) ||
>  	    XE_IOCTL_DBG(xe, ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY &&
>  			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE &&
> -			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE))
> +			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE &&
> +			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP))
>  		return -EINVAL;
>  
>  	idx = array_index_nospec(ext.property, ARRAY_SIZE(exec_queue_set_property_funcs));
> @@ -626,6 +801,12 @@ static int exec_queue_user_extensions(struct xe_device *xe, struct xe_exec_queue
>  		return exec_queue_user_extensions(xe, q, ext.next_extension,
>  						  ++ext_number);
>  
> +	if (xe_exec_queue_is_multi_queue_primary(q)) {
> +		err = xe_exec_queue_group_init(xe, q);
> +		if (XE_IOCTL_DBG(xe, err))
> +			return err;
> +	}
> +
>  	return 0;
>  }
>  
> @@ -780,12 +961,16 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>  		if (IS_ERR(q))
>  			return PTR_ERR(q);
>  
> +		err = xe_exec_queue_group_add(xe, q);
> +		if (XE_IOCTL_DBG(xe, err))
> +			goto put_exec_queue;
> +
>  		if (xe_vm_in_preempt_fence_mode(vm)) {
>  			q->lr.context = dma_fence_context_alloc(1);
>  
>  			err = xe_vm_add_compute_exec_queue(vm, q);
>  			if (XE_IOCTL_DBG(xe, err))
> -				goto put_exec_queue;
> +				goto delete_queue_group;
>  		}
>  
>  		if (q->vm && q->hwe->hw_engine_group) {
> @@ -808,6 +993,8 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>  
>  kill_exec_queue:
>  	xe_exec_queue_kill(q);
> +delete_queue_group:
> +	xe_exec_queue_group_delete(q);
>  put_exec_queue:
>  	xe_exec_queue_put(q);
>  	return err;
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
> index a4dfbe858bda..8cd6487018fa 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
> @@ -62,6 +62,53 @@ static inline bool xe_exec_queue_uses_pxp(struct xe_exec_queue *q)
>  	return q->pxp.type;
>  }
>  
> +/**
> + * xe_exec_queue_is_multi_queue() - Whether an exec_queue is part of a queue group.
> + * @q: The exec_queue
> + *
> + * Return: True if the exec_queue is part of a queue group, false otherwise.
> + */
> +static inline bool xe_exec_queue_is_multi_queue(struct xe_exec_queue *q)
> +{
> +	return q->multi_queue.valid;
> +}
> +
> +/**
> + * xe_exec_queue_is_multi_queue_primary() - Whether an exec_queue is primary queue
> + * of a multi queue group.
> + * @q: The exec_queue
> + *
> + * Return: True if @q is primary queue of a queue group, false otherwise.
> + */
> +static inline bool xe_exec_queue_is_multi_queue_primary(struct xe_exec_queue *q)
> +{
> +	return q->multi_queue.is_primary;
> +}
> +
> +/**
> + * xe_exec_queue_is_multi_queue_secondary() - Whether an exec_queue is secondary queue
> + * of a multi queue group.
> + * @q: The exec_queue
> + *
> + * Return: True if @q is secondary queue of a queue group, false otherwise.
> + */
> +static inline bool xe_exec_queue_is_multi_queue_secondary(struct xe_exec_queue *q)
> +{
> +	return xe_exec_queue_is_multi_queue(q) && !q->multi_queue.is_primary;
> +}
> +
> +/**
> + * xe_exec_queue_multi_queue_primary() - Get multi queue group's primary queue
> + * @q: The exec_queue
> + *
> + * If @q belongs to a multi queue group, then the primary queue of the group will
> + * be returned. Otherwise, @q will be returned.
> + */
> +static inline struct xe_exec_queue *xe_exec_queue_multi_queue_primary(struct xe_exec_queue *q)
> +{
> +	return xe_exec_queue_is_multi_queue(q) ? q->multi_queue.group->primary : q;
> +}
> +
>  bool xe_exec_queue_is_lr(struct xe_exec_queue *q);
>  
>  bool xe_exec_queue_is_idle(struct xe_exec_queue *q);
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index c8807268ec6c..3856776df5c4 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -31,6 +31,24 @@ enum xe_exec_queue_priority {
>  	XE_EXEC_QUEUE_PRIORITY_COUNT
>  };
>  
> +/**
> + * struct xe_exec_queue_group - Execution multi queue group
> + *
> + * Contains multi queue group information.
> + */
> +struct xe_exec_queue_group {
> +	/** @primary: Primary queue of this group */
> +	struct xe_exec_queue *primary;
> +	/** @lock: Queue group update lock */
> +	struct mutex lock;
> +	/** @cgp_bo: BO for the Context Group Page */
> +	struct xe_bo *cgp_bo;
> +	/** @xa: xarray to store LRCs */
> +	struct xarray xa;
> +	/** @list_lock: Secondary queue list lock */
> +	struct mutex list_lock;
> +};
> +
>  /**
>   * struct xe_exec_queue - Execution queue
>   *
> @@ -110,6 +128,18 @@ struct xe_exec_queue {
>  		struct xe_guc_exec_queue *guc;
>  	};
>  
> +	/** @multi_queue: Multi queue information */
> +	struct {
> +		/** @multi_queue.group: Queue group information */
> +		struct xe_exec_queue_group *group;
> +		/** @multi_queue.pos: Position of queue within the multi-queue group */
> +		u8 pos;
> +		/** @multi_queue.valid: Queue belongs to a multi queue group */
> +		u8 valid:1;
> +		/** @multi_queue.is_primary: Is primary queue (Q0) of the group */
> +		u8 is_primary:1;
> +	} multi_queue;
> +
>  	/** @sched_props: scheduling properties */
>  	struct {
>  		/** @sched_props.timeslice_us: timeslice period in micro-seconds */
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 47853659a705..d903b3a55ec1 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -1252,6 +1252,12 @@ struct drm_xe_vm_bind {
>   *    Given that going into a power-saving state kills PXP HWDRM sessions,
>   *    runtime PM will be blocked while queues of this type are alive.
>   *    All PXP queues will be killed if a PXP invalidation event occurs.
> + *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP - Create a multi-queue group
> + *    or add secondary queues to a multi-queue group.
> + *    If the extension's 'value' field has %DRM_XE_MULTI_GROUP_CREATE flag set,
> + *    then a new multi-queue group is created with this queue as the primary queue
> + *    (Q0). Otherwise, the queue gets added to the multi-queue group whose primary
> + *    queue id is specified in the 'value' field.
>   *
>   * The example below shows how to use @drm_xe_exec_queue_create to create
>   * a simple exec_queue (no parallel submission) of class
> @@ -1292,6 +1298,8 @@ struct drm_xe_exec_queue_create {
>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE		2
> +#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP		3
> +#define     DRM_XE_MULTI_GROUP_CREATE				(1ull << 63)
>  	/** @extensions: Pointer to the first extension struct, if any */
>  	__u64 extensions;
>  
> -- 
> 2.43.0
> 
