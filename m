Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED618F3C9A9
	for <intel-xe@archiver.kernel.org>; Wed, 25 Feb 2026 07:19:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF10C10E1DB;
	Wed, 25 Feb 2026 07:19:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PqD26eB1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C33110E1DB
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Feb 2026 07:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772003981; x=1803539981;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=0dWpNg3fvu1FmgXlN2fpHsiWMDxY6twaE62YXQ5cmX4=;
 b=PqD26eB1bbYwIcM2it3I/Fr0xHwvK+NavrgTzpQhYNtrQo4JRyGSNOpR
 MmdCJljWBfLjcOiDzcgdachMuAnsZDhRM9leh7TCkoYQkc1yW78VpC/tK
 0ofs0BYQwT0eN6nOpfuU4NCjK3JylM33eDGiv058+9PuKR/b53XPsRuMy
 rQJWKU0DbrnhOulTnb+IaK6WH+SXl1WVvp52PBu6WM9meKEhv3B1dDwYq
 umFSDfPb50PmqRCPTok5o7ZZ1YQnfyft66di8aURmM8pNSS6hE2N7qgzi
 FxRg6MFACT2hr8N75JVcmqS2rrJ+1+uhaxTVUQEK2ooL/A6eVDvjECWkf g==;
X-CSE-ConnectionGUID: WVhfPRVnQVKQn+lU70t9BA==
X-CSE-MsgGUID: tLWJVBoVRn+2Fw+DchvKwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="73210693"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="73210693"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 23:19:41 -0800
X-CSE-ConnectionGUID: SYnea+rmRZ65YdPWhXMFhg==
X-CSE-MsgGUID: idunxZjwSR+PAZcml0PS4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="215253741"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 23:19:41 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 23:19:40 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 24 Feb 2026 23:19:40 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.13) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 23:19:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FJMJERth1WlkUAM+f850iBrhSyqL0InXn7gl5axPjHa1sDX60nihF4E+MVvGIyLPYXKBoalYksEJcQn4orOI0wodh3IBEAZD70Xj4c+/Z1CMtaHSGHes91X6WHU2X7A8xgO7RqL/EOVvHIt+SRiEdT1yXAaHP58U3Q70XoLJsbvwbaVW8lZWBeoJf0wsQI4ANTWiko7anSMHTBI8462B6KZK80RKsnsUVXBGX75zhq3iXKne4CNofv/ErqEj93DjvEYVHHafNQqUvrf7AJ81mG0OqIZue0QmvpMsD1HVZb+IYrE8ctUenkwQhkMD28L+9g6oj3j3/2fnMXQQWTUQRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hM+9bz8TW4FeXX4CuU9mDh9aOI5kq3NID+2WLtaEjck=;
 b=E3DuzwghYaFoBWeeCSkPwu7W0UZkoefPELfbogogLT8m0hpfXRkvEoypDk+kU1kjAu3EbIg4cpWhbabg83iXupcnuw3ckoakmPesLpqk/k3+PGKaFCIOB4AoGrL40cGbgJNZSDcrvOgyoNOk6vxfrvhsx4SQ5eqN6tXJKFhwm0ODNgp+AvVvmY3aRZlsTzmkuk5D57Z7WAHf58tMh0qnWbz259k8sXb1Zr5DLELQk5uZcxb7fAyV8/vvE1Db6fHabissNwdxxbbj8V0q5DRvZ9bd0JCuR9fmlRFXYbZV+xjU2qZ39FcR7AcA1qjkaBvxIPw4pjh0eNa/UDbzZ2r5pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA3PR11MB9327.namprd11.prod.outlook.com (2603:10b6:208:57a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.15; Wed, 25 Feb
 2026 07:19:38 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 07:19:37 +0000
Date: Tue, 24 Feb 2026 23:19:35 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: "Nguyen, Brian3" <brian3.nguyen@intel.com>
CC: "Summers, Stuart" <stuart.summers@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>
Subject: Re: [PATCH 1/2] drm/xe: Skip over non leaf pte for PRL generation
Message-ID: <aZ6ih7RgkmrBGTj5@lstrano-desk.jf.intel.com>
References: <20260129082756.1096935-3-brian3.nguyen@intel.com>
 <be5e3d57544ece734dec2513ab4717e80b49adec.camel@intel.com>
 <aZzb5COhqfv/3SBF@lstrano-desk.jf.intel.com>
 <943064bb067941dd6883ebd60514bc147d346da6.camel@intel.com>
 <SA1PR11MB88390D32C4A1C2BDC6629BD3AA77A@SA1PR11MB8839.namprd11.prod.outlook.com>
 <aZ0Csw/3hh2Jv1/k@lstrano-desk.jf.intel.com>
 <aZ0G0lw+NCrP4bu0@lstrano-desk.jf.intel.com>
 <SA1PR11MB883971CC360573D5C2D96AFFAA75A@SA1PR11MB8839.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <SA1PR11MB883971CC360573D5C2D96AFFAA75A@SA1PR11MB8839.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW4PR04CA0192.namprd04.prod.outlook.com
 (2603:10b6:303:86::17) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA3PR11MB9327:EE_
X-MS-Office365-Filtering-Correlation-Id: f3d951b3-cf3b-43c9-c1c2-08de743e3bdb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M1NhTVhNOVdDZWRteVhMNEFJaWl5dHBoWHgraTQxalBwaVdKdjh2QTJkK2Fx?=
 =?utf-8?B?TWlVOHZZb1U3RVZUNjBmaWVBNWxneDJlSUw2N0M5UFVqVWYzS0xidnVUaDNJ?=
 =?utf-8?B?ZTE4c3ppWFp6OHFDdU9XSldyVVZlK28xcXJEL09KN3pjdmE5SGZxc3Y3OW1C?=
 =?utf-8?B?d3MzM0lxREFLdW4rUmMxWFRhalF2aDJMaUhDNTNZSFQxQkVKd3dMblQ3aGlR?=
 =?utf-8?B?L2EvcmVIcGdEZjNCS1JtVzFSVmd3dVpBb0tZdkFabEdmeHJFQUlyNXpWU0lB?=
 =?utf-8?B?QlNkU3lFaEhkMThiQ1pWOFpOZm11VCtyd0IxTHYrR1BnZlJNRUVEcEx5VnZ5?=
 =?utf-8?B?YlFtM2IwY1YvTnJoWjBlNktaazZtTHJRWnZZQ0ZTWU1SWWl1eHlDNXNlemRQ?=
 =?utf-8?B?akpPLzhjQXFlc3FhVm4wdm92SFZzdE9ibnhMR2F4MFY1Q3hDQnIzNkE2VFNG?=
 =?utf-8?B?a2pDMUNuR1NtZzVIYmo3WUZLVkoyRGxsdmp3WTRRaE4rUTdkenFvRktmWFhO?=
 =?utf-8?B?N2VsQ1Ruc0llYTlKSGVSRWlrVExITEJCR0toSXZyQXpGTytxUW9VSmRyb3Rs?=
 =?utf-8?B?OEkvLzcwK3VhOVFSMGM3cHB5STZXeDVDUXhsREMvQnR0bEdGMHl3REh6aWxW?=
 =?utf-8?B?MitvQnBpTkNuSjYwYWNTL2l1TENoc0F5U25mcjdJOWJ4REI3SUY3VlU0K2gz?=
 =?utf-8?B?QS9Hak9YSEZMT1h2ZktOWEdXRGhnYlcvOFhOT2JVRUtBUTBmOXBzcGtUQXgv?=
 =?utf-8?B?SGU2RmZjMEV2SDVITXROZVcrY0pJc0czSjJ1NUhqS3MvZUw5SHFlRGpUNkhE?=
 =?utf-8?B?UHNrditaOXdZZDZ2YjBBbGthUUx6RHlUR3NITVJQLzltb2J0TFNIaUZJS3Na?=
 =?utf-8?B?eEU1ZzV2SkQrZThqak9hT2NLZlk3QXMvdlJpMWF5TmN5aXBBcXB4K3hGZE1C?=
 =?utf-8?B?cnYzU2NvSVdWMi85Um1EcHlOY1hMSDBYclNOT2pPV0cxYXh3VkNYeks2UU5i?=
 =?utf-8?B?MXZINVlmMlRwbmg4KzZCbDdBYzI3a3BXbC9ub3VsbFZGSFJLUjlFWk52WUxH?=
 =?utf-8?B?SXY0bGdOZUdEMHM5QzBoYk1aRFVhRGx5ejJWb3ZweXRTVjZqTGFjdW16Z1ZI?=
 =?utf-8?B?QXVwWEZmckZFSk9QUGJjRjVpWlFsSUVHa2FZWk53OWdsd2xWR1NHdEQvaVIv?=
 =?utf-8?B?RDk0aFZkZ2VSZnpqZ2tJVUJuWWJ5Y0k3bHFpeHFqR1V2SVR4eUhuZTNrZUhK?=
 =?utf-8?B?OVhKNkxWQ1B0bmluT1dkNTNHbDZsbk5WcHNXbUF6WE9YM3VHQitRRi95YnBE?=
 =?utf-8?B?dThRQWpPSUhtSEFQbHJ2RHRnZVlQKzdsckJ6aERSRWZxMEdOcnBPWEt1ekor?=
 =?utf-8?B?MDV2dXlhT2xrbGlKQkVNZDIvWmZ0bzk3ZnV4L09aQTN6TGRucXcwbERFcENz?=
 =?utf-8?B?eVhIVUZZekg1QU9oSXJSS1FsdUVOSHBnZG9lZXo2QVdWbFkzWDZVeHhMVUhB?=
 =?utf-8?B?UjRLK1hJb0lkbXhJdnQvNnRzaU11MUtBdHYxOE9rRWN6YVIraG50ejI5WXp0?=
 =?utf-8?B?MVY5ZnYyRjlTaVViNklidGVXenlSbjVIZk9pNWxmY29YQnJjc0w1LzlMaFNT?=
 =?utf-8?B?M2s3RkpMMStoK1dDbzZVelBnOG1VQTUrd0Fha0ZNT2tSZGJnL3RWeHpnQzQ3?=
 =?utf-8?B?TW9ZVmp3dG4rY2RDa2RoRVhTR0JPTmVXS1dsNm16WWRyZFVrbng2ejFpMGV2?=
 =?utf-8?B?SE9vT1ZTd3B0MDFkeDFhcVBpRUxmdXQrMkJDYW1HSUdFOHlkczVTWW9tcTdN?=
 =?utf-8?B?OFkrL2Mvc2plQUtOSDdHZHNwa0lRY25zVU5tV0RIU1A1b21OZURvb0p0RnUr?=
 =?utf-8?B?M0Z2U2tzVVFCUnZyNlhhRlBJQ0J0dEVGazl5dlVqWVZxV1FMU29ZSGh4cDdh?=
 =?utf-8?B?Mnk1RVd0NCt4a2FmbDFqUmdjOEpVVU8zekdMQ3FpZFErWk9DenVIeGxaY3pO?=
 =?utf-8?B?K04rMW5xZnM4K2FjUDdUbk93eFE2KzNaSUNKTmZsaW1RM0Y1OU9kVkU1dWxX?=
 =?utf-8?B?UUdOYW9PbzlRUW05WHFsc2JEWE1vaXVybGFRMkl5NDJ4V1VnWnJMSHk3eS90?=
 =?utf-8?Q?1SRg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVBjVHhNY1pkUVBrNVlFZ3RFN0w5d3lBZkxxdjVyUFl3N3NpZFZWak1pRThV?=
 =?utf-8?B?Q1d6YXBoSHREQmQzKzg2ZThlWkF0RDVaNU1DSTdMUytlRElUMEovdEtja3lJ?=
 =?utf-8?B?UE53aW1MMDZoZ2RzUlpqNVA2Qlh4U0N4NlArc1h0czAvVXBXRndXaGgzbnJK?=
 =?utf-8?B?TGw5T21XcEp1SEVNMkhrYVdLaUJMQUJOYkFiaEY1dFBQb1d4dmZMWGdtQ2dP?=
 =?utf-8?B?cGI5eSttZlZoeU1DVldMZmU0bStKMHBhUjRjUHRYeVUwZ1hQaXZLSGlyM0xM?=
 =?utf-8?B?eDlXankyWDFidkIxR3BPdFltVUtHYmQ0VWVRTU5tNFVJNDFuUERTd1djYzVR?=
 =?utf-8?B?dDdFTHhIeTNJK3psd25aTTQwWFhpQ05tTXZ5NnMvVWZEUTlNN1JnV0FDSDJT?=
 =?utf-8?B?WFRqSUtIdkl6OE9SSHhyMjEzcTdQbDd1Z0NjaW5leW42bnR4anl0NE9PQ1Jq?=
 =?utf-8?B?YUdCNG96RFd1OVZvYVhselZpY3U4QzJQcGtiVk43QmxnNldBRWpQVEczUU9M?=
 =?utf-8?B?d2t0KytDd3oxQy9uTE1yQi9ZVUlwNHUxNjI4WktRdlBQVnRqQXJueGRQOTds?=
 =?utf-8?B?dk16YlRFcnpWTDFjQi8xbzVxbHlRYnNhd1Z3UWp0T0x0cnN5L05JeGF0NHlu?=
 =?utf-8?B?QlFVMU9hdHNnajFFL2E4MmtJMnBwVUdDWDFQaU9vN2RwVXBtc2VpdlBmdUdM?=
 =?utf-8?B?UHdEV0lJcGlrbVBjZkZTa0h4Z1VuNWhBVjB3Yzh0YThGcmM2OFFodzZBNVcw?=
 =?utf-8?B?Qlc3YmhHZTFuZW9VNm4wa1k3bDcvaDg3clJZTTNJYkE1YUNKM1RjR091MzZD?=
 =?utf-8?B?bjk4L05PSk0yWUhOcEQrdTBiTndqN05BT2lVSXVRL2NuelNOcnBTQURFWUNQ?=
 =?utf-8?B?V29VNjhldTBNYkFHZ29hK2h3SFZrbXR2ZWxzQU1aMjJPd1pjTE9yTlJYVk14?=
 =?utf-8?B?Y2VrWXl4ZnlRZ2tydHJ0NXY3SzlwZUc3YVg3K003ZkprdHlhNVJJOVhMQlhw?=
 =?utf-8?B?ZnZrR2RsMDBsZXpMZnp0cmRRbjVueENlbEF4aFJvcDI1K2o5T09FNzdSU1Zn?=
 =?utf-8?B?V2tMNGZhVG8vVUZSYlVNNVZQelI4bk5jQWg4SGZZN255OVRqMENla1ZoYmVL?=
 =?utf-8?B?YVp1OWQ3ekJPR3BzbUsrUHNHOStQTHMveUQ5TW5DdkxkQnp5aVc1RnErQUZs?=
 =?utf-8?B?bzk0SzljN0RMSkVDUWp0NFdST20vSTRXSU9saG1hdU5tSVNEVU9lOXZuSjlV?=
 =?utf-8?B?TmVMd2JZN1NEbGFVQmJPNUUwVXJweFd6UWpWa081dDFodVkvcmxuT3Q3L0c3?=
 =?utf-8?B?M3ZEVXNVQjZCYStKaUxLMk9raS80SzhCSlFobHU2RGNVMC9zV2ZITnpkR3BJ?=
 =?utf-8?B?czM5Z1dISjEzNDJFcFY4R1hPWjJEbzAzald1U3BBTjJWaEJRam45Y24wbEVS?=
 =?utf-8?B?QjlHdlBrS0FSdjlrQ1hYZ202aFdmdWxpdVRNYjRDRE42Y25TK2d5OFBsemJ4?=
 =?utf-8?B?NHVRbm9wQmdRZHNmWVhEZHpidmR5eW0rUjJEWGVsb1JkWGNGZkVXRU0yVkZw?=
 =?utf-8?B?b1NZaTlkZHVKc05TVnAreW5TNGlWcFFEeTNaZnVnYUVWZnkyNU5rSFVhaXBm?=
 =?utf-8?B?REx6SFRvemFramk5enUyZUFyQnVDOU0wbUlSODFvaWpJOFFiTm0vVHNOSjB5?=
 =?utf-8?B?WXpuR1o2a1N6Q21JODBidDZLVkpCT20wblo2Y0VIZzhaNkdGZ0RrZ1cvNWlw?=
 =?utf-8?B?OTI2WlBrc2UxMkdlQ2ZhZU9mZ2g2UTVYclBKZ1IwVVBGdUt0cnpjckxPSXdE?=
 =?utf-8?B?ZDdkM1hLYlhMQU9oY29rQ2p0T2M3K1E3UjNhbjJwTnp0OThIRlZkRGs4TUFv?=
 =?utf-8?B?RkVEbkNocEhNZm1XQjh3QkVGRmVWV0FSRXVxQk9xZXpGTEVscWVHWVZMVE9N?=
 =?utf-8?B?NFBscm5hSTd3S0Z6UEtVWCs5aWlXNzRlT29BWlBabmJiUVIxenlESmZqSFVZ?=
 =?utf-8?B?M0NQVE8vY0ltRG5jOUlScmhPNzZnUDVqZ3JLMkNXaEpsaDl4V1pQSG9hWjZV?=
 =?utf-8?B?VjFObFhZR05iWXd1K3REbkZHNjRrMGNUYVl3c0g2RE5wYllKYkFnN2RHT01W?=
 =?utf-8?B?ZnFiNmZaWjZJWEN4czlmMDlkTitlQ281UjFzNU16b1dPSGNLNWJNckhQempq?=
 =?utf-8?B?MEdYcnB3SWgzUmpHd1hHcnlTdnB3dG5MR0thS1hKeHNXY0M2L252c0psSms4?=
 =?utf-8?B?SVd4V1dDb2Z5TGRKWVlvVUQ3Lzk2emZjbm5PQytseVMwNmNZakhBRzVGank5?=
 =?utf-8?B?ekZVOTdSZmtqZW85cmptMUZUUG11QUVsUkoxcUxMaUZTVk1JeitONXpEZE1U?=
 =?utf-8?Q?WXz37U0cAiiCRLb0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f3d951b3-cf3b-43c9-c1c2-08de743e3bdb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 07:19:37.5211 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6tfvTfAVWhQx/FtIZGD4Mqqr9YSU4P6er2BaSYilT5X+2r5eSMgmkvRh+Uii2XbFzRvzNh6m+H08dh+IO+ksrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9327
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

On Tue, Feb 24, 2026 at 11:45:21PM -0700, Nguyen, Brian3 wrote:
> On Monday, February 23, 2026 6:03 PM, Nguyen, Brian3 wrote:
> > On Mon, Feb 23, 2026 at 05:45:23PM -0800, Matthew Brost wrote:
> > > On Mon, Feb 23, 2026 at 04:33:30PM -0700, Nguyen, Brian3 wrote:
> > > > On Monday, February 23, 2026 3:07 PM, Stuart Summers wrote:
> > > > > On Mon, 2026-02-23 at 14:59 -0800, Matthew Brost wrote:
> > > > > > On Mon, Feb 23, 2026 at 10:49:21PM +0000, Summers, Stuart wrote:
> > > > > > > On Thu, 2026-01-29 at 08:27 +0000, Brian Nguyen wrote:
> > > > > > > > The check using xe_child->base.children was insufficient in
> > > > > > > > determining if a pte was a leaf node. So explicitly check
> > > > > > > > for if a pte is a leaf through the bit checks.
> > > > > > > >
> > > > > > > > Fixes: b912138df299 ("drm/xe: Create page reclaim list on
> > > > > > > > unbind")
> > > > > >
> > > > > > Move the Fixes tag by other tags (Signed-off-by, Cc)
> > > > > >
> > > >
> > > > Got it, will move.
> > > >
> > > > > > > >
> > > > > > > > v2:
> > > > > > > >  - Remove old assert. (Matt R)
> > > > > > > >
> > > > > > > > Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
> > > > > > > > Cc: Matt Roper <matthew.d.roper@intel.com>
> > > > > > > > ---
> > > > > > > >  drivers/gpu/drm/xe/xe_pt.c | 13 ++++++++-----
> > > > > > > >  1 file changed, 8 insertions(+), 5 deletions(-)
> > > > > > > >
> > > > > > > > diff --git a/drivers/gpu/drm/xe/xe_pt.c
> > > > > > > > b/drivers/gpu/drm/xe/xe_pt.c index
> > > > > > > > 6703a7049227..b73a356d0fa1
> > > > > > > > 100644
> > > > > > > > --- a/drivers/gpu/drm/xe/xe_pt.c
> > > > > > > > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > > > > > > > @@ -1655,7 +1655,7 @@ static int
> > > > > > > > xe_pt_stage_unbind_entry(struct xe_ptw *parent, pgoff_t
> > > > > > > > offset,
> > > > > > > >
> > > > > > > >         XE_WARN_ON(!*child);
> > > > > > > >         XE_WARN_ON(!level);
> > > > > > > > -       /* Check for leaf node */
> > > > > > > > +       /* Optimistically check for leaf node, may not be
> > > > > > > > guaranteed
> > > > > > >
> > > > > > > I would keep the comments the same - we're still trying to
> > > > > > > check a leaf node here and we aren't really doing anything
> > > > > > > special. If we have questions, we can look at the commit
> > > > > > > history to determine what changed from your prior implementation.
> > > > > > >
> > > > > > > Or if you want documentation here, it's more interesting to me
> > > > > > > *why* we
> > > > > > > can't see this from the child alone than just the fact that we
> > > > > > > can't (which we can observe by the if condition).
> > > > > > >
> > > > > > > Also applies to the comment below too.
> > > > > > >
> > > >
> > > > Ahh got it. Let me reword the comments here with more details
> > > > depending on the changes we make in the comments below.
> > > >
> > > > > > > Thanks,
> > > > > > > Stuart
> > > > > > >
> > > > > > > > from children alone */
> > > > > > > >         if (xe_walk->prl &&
> > > > > > > > xe_page_reclaim_list_valid(xe_walk-
> > > > > > > > >prl)
> > > > > > > > &&
> > > > > > > >             (!xe_child->base.children || !xe_child-
> > > > > > > > > base.children[first])) {
> > > > > > > >                 struct iosys_map *leaf_map =
> > > > > > > > &xe_child->bo->vmap; @@ -1675,10 +1675,13 @@ static int
> > > > > > > > xe_pt_stage_unbind_entry(struct xe_ptw *parent, pgoff_t
> > > > > > > > offset,
> > > > > > > >                                 break;
> > > > > > > >                         }
> > > > > > > >
> > > > > > > > -                       /* Ensure it is a defined page */
> > > > > > > > -                       xe_tile_assert(xe_walk->tile,
> > > > > > > > -                                      xe_child->level == 0
> > > > > > > > ||
> > > > > > > > -                                      (pte & (XE_PTE_PS64 |
> > > > > > > > XE_PDE_PS_2M | XE_PDPE_PS_1G)));
> > > > > > > > +                       /*
> > > > > > > > +                        * The check for xe_pt's children is
> > > > > > > > insufficient to determine leaf.
> > > > > > > > +                        * If not leaf, break out and
> > > > > > > > +continue in
> > > > > > > > next page walk level.
> > > > > > > > +                        */
> > > > > > > > +                       if (xe_child->level > 0 &&
> > > > > > > > +                           !(pte & (XE_PTE_PS64 |
> > > > > > > > +XE_PDE_PS_2M |
> > > > > > > > XE_PDPE_PS_1G)))
> > > > > >
> > > > > > I don't think XE_PTE_PS64 needs to be checked here as that
> > > > > > should only be set at level 0.
> > > > >
> > > > > Oh that's a good catch. PS64 has a specific meaning within the PDE. Are we trying to check if this is > 4K basically?
> > > > >
> > > >
> > > > This was checking if one of the bits indicating that this is a leaf entry was raised and if not, skip adding this.
> > > > So, checking for if it’s a leaf PTE (which would have one of those bits raised), not necessarily if it is just > 4K.
> > > >
> > > > Previously I had thought to remove XE_PTE_PS64 since level == 0
> > > > covers the condition but just for clarity of checking all leaf PTE, I kept it with the assert and then kept it since I inverted condition in
> > this patch.
> > > > I'll remove XE_PTE_PS64 in next patch. Thanks.
> > > >
> > > > > Thanks,
> > > > > Stuart
> > > > >
> > > > > >
> > > > > > I agree we xe_child->base.children can be set at level > 0 but
> > > > > > now I'm thinking the outer if statement is wrong wrt to
> > > > > > 'xe_child->base.children[first]'. Couldn't
> > > > > > xe_child->base.children[first] be NULL when subsequent
> > > > > > xe_child->base.children[first + 1] be non-NULL?
> > > > > >
> > > >
> > > > I believe this was the issue I was running into with one of the test
> > > > cases. Having some sort of non-NULL subsequent child declared here
> > >
> > > Yes, but any check at outer level of individual children doesn't seem
> > > right.
> > >
> > > Let's give an example of a 6M unbind.
> > >
> > > Case 1:
> > > - children[0] == NULL (leaf)
> > > - children[1] == Valid (not a leaf)
> > > - children[2] == NULL (leaf)
> > >
> > > I believe you correct code correctly generate PRL for children[0],
> > > break on children[1], so children[3] is skipped. I don't think this is
> > > correct... On hitting children[1], I believe in addition to breaking
> > > the loop, you the PRL needs to be invalidated, right?
> > >
> 
> Yea... I see the issue. My intent at the time was to ensure that the xe_pt being
> read is a leaf entry by reading children. My thought was that if the 1st one read
> was a leaf PTE, then we could keep iterating until there wasn't a leaf anymore
> and handle it on next page walk, but that seems insufficient now for these
> interleaved leaf pte and nonleaf pt.
> 
> Still smacking my head at this trying to come up with a better solution, but
> current idea here is removing that children check from the outer if statement
> and adding the following inside of the for loop. Let me test to see if that is sufficient.
> 
> ```
> for (pgoff_t i = 0; i < count; i++) {
> 	if (xe_child->base.children && xe_child->base.children[first + i])
> 		continue;
> 	...
> }
> ```

Yes, I think something roughly like this.

See below, I confused myself shooting test cases from hip so unless I
type an implementation out I'll probably give further bad input...

> 
> This would allow for us to add all the leaf nodes and skip over the ones aren't accessed
> by the page walker until later. This would work for the issue I previously ran into
> mentioned later and case 2 but it wouldn't work for case 1.
> 
> - children[0] == NULL (leaf)
> - children[1] == Valid (not a leaf)
> - children[2] == NULL (leaf)
> 
> In this case, could we do something dumb like check to see if this not a leaf would
> be at the edge, based on the index with count and alignment?
> 
> If quick test results are good and no objections, I can try this as next patch to see...
> 
> > > Case 2:
> > > - children[0] == Valid (not a leaf)
> > > - children[1] == NULL (leaf)
> > > - children[2] == NULL (leaf)
> > >
> > > The entire PRL generation is skipped but the PRL is not invalidated
> > > which seems to be problem as leafs are skipped here.
> > >
> > > So I believe this entire logic needs a bit more rework than this patch
> > > alone.
> > >
> > > I believe the logic is roughly - at level 1 / 0 always walk all the
> > > PTEs in the PRL is valid, at level 1 if any non-2M pages are found
> > > invalidate the PRL if we are not going to desend further down (i.e.,
> > > we cover the entire 2M range).
> > >
> > > This fairly complicated, so I'd have to type this out + get on test
> > > machine to provide further advise here.
> > >
> > 
> > I can give you some test cases I suppose...
> > 
> 
> Thanks for the test case and examples. I did have a try with these to see
> the intended behavior here and everything worked out except the 2m mixed cases.
> 
> FYI, took a look again at the particular test case I was triggering an issue
> with the original assert: igt@xe_vm@large-split-binds-268435456,
> which performs
> BO[0] = alloc(256M+4K)
> bind(BO[0], aligned VA, 128M)
> bind(BO[0]+offset(128M), aligned VA + 128M, 128M+4K)
> unbind(aligned VA, 128M)
> unbind(aligned VA+128M, 128M+4K)
> 
> So there was an edge case here of what I believe is a page directory
> filled with 2M and a 4K page afterwards and num_entries of xe_pt was 65.
> 
> PD[64] = 2M PTE
> PD[65] = 2M PTE
> ...
> PD[127] = 2M PTE
> PD[128] = PT -> 4K PTE (Triggers assert, shouldn't be added as a PRL entry)
>     But can still proceed with PRL w/o invalidate because the next page walk
>     should proceed to the 4K page here.

Yes, I think we would descend if the unbind doesn’t completely cover the
2M region and there are other present PTEs in the region. I believe we'd
short circuit the decend if the 4K PTE was only PTE in region though...
I could be wrong though as it has been a while since I've run this code
tracing every step.

In some of my examples above, I was thinking that within a single VMA
you could have a 2M page and then 512 4K pages in the covered region,
depending on how the physical backing gets allocated. Hitting this case
is really difficult because of how DRM buddy works, but it is possible.

> 
> So
> - children[64] == NULL (leaf)
> - children[65] == NULL (leaf)
> ...
> - children[127] == NULL (leaf)
> - children[128] == VALID (not a leaf)
> 
> > - Test case A - 2M binds:
> > 
> > BO[0] = alloc(8M);
> > bind(BO[0], aligned VA, 8M);
> > unbind(aligned VA, 8M);	/* Get four 2M PRL */
> > 
> > - Test base B - 4k binds - Same as above but 4k
> > 
> > - Test case C - 2M mixed:
> > 
> > BO[0] = alloc(2M);
> > BO[1] = alloc(4K);
> > BO[2] = alloc(2M);
> > bind(BO[0], aligned VA, 2M);
> > bind(BO[1], aligned VA + 2M, 4K);
> > bind(BO[2], aligned VA + 4M, 2M);
> > unbind(aligned VA, 6M);	/* PRL should be invalid */
> > 
> 
> A bit confused why this would require the PRL to be invalidated?
> There should be 3 unbind ops with the 6M range each could
> target one entry here since 3 BO.

Ah, yes. We would get 3 unbind ops here. I was thinking we'd get one 6M
unbind op and the middle part we wouldn't decend but I was clearly
confusing myself... This case should actually work. 

> 
> Hopefully understood your direction here and ran the test case and saw the OPs
>  [drm:print_op [xe]] UNMAP: addr=0x0000000040000000, range=0x0000000000200000, keep=0
>  [drm:print_op [xe]] UNMAP: addr=0x0000000040200000, range=0x0000000000001000, keep=0
>  [drm:print_op [xe]] UNMAP: addr=0x0000000040400000, range=0x0000000000200000, keep=0
>  [drm:unbind_op_prepare [xe]] Preparing unbind, with range [40000000...401fffff)
>  [drm:xe_pt_stage_unbind_entry [xe]] PRL add entry: level=1 pte=0x20000001516004bb reclamation_size=9 prl_idx=0
>  [drm:xe_vm_dbg_print_entries [xe]] unbind: 1 entries to update
>  [drm:xe_vm_dbg_print_entries [xe]] 	0: Update level 1 at (0 + 1) [40000000...40200000) f:0
>  [drm:unbind_op_prepare [xe]] Preparing unbind, with range [40200000...40200fff)
>  [drm:xe_pt_stage_unbind_entry [xe]] PRL add entry: level=0 pte=0x200000015048c43b reclamation_size=0 prl_idx=1
>  [drm:xe_vm_dbg_print_entries [xe]] unbind: 1 entries to update
>  [drm:xe_vm_dbg_print_entries [xe]] 	0: Update level 1 at (1 + 1) [40200000...40400000) f:0
>  [drm:unbind_op_prepare [xe]] Preparing unbind, with range [40400000...405fffff)
>  [drm:xe_pt_stage_unbind_entry [xe]] PRL add entry: level=1 pte=0x20000001808004bb reclamation_size=9 prl_idx=2
>  [drm:xe_vm_dbg_print_entries [xe]] unbind: 1 entries to update
>  [drm:xe_vm_dbg_print_entries [xe]] 	0: Update level 4 at (0 + 1) [0...1000000000000) f:0
> 
> > - Test case C - 2M mixed:
> > 
> > BO[0] = alloc(4K);
> > BO[1] = alloc(2M);
> > BO[2] = alloc(2M);
> > bind(BO[0], aligned VA, 4k);
> > bind(BO[1], aligned VA + 2M, 2M);
> > bind(BO[2], aligned VA + 4M, 2M);	/* PRL should be invalid */
> > unbind(aligned VA, 6M);	/* PRL should be invalid */
> > 
> 

This one should work too.

Matt

> Same question as above. I'm guessing that we are trying to
> trigger that case with the non-leaf in the middle of the children,
> but I believe we must make one BO that has 2M PTEs and 
> scattered 4K PTEs for one of the 2M regions?
> 
> Brian
> 
> > - test case D - 2M, partial:
> > 
> > BO[0] = alloc(2M);
> > BO[1] = alloc(4k);
> > bind(BO[0], aligned VA, 2M);
> > bind(BO[1], aligned VA + 2M, 4k);
> > unbind(aligned VA, 2M + 4k);	/* Get one 2M PRL, one 4K PRL */
> > 
> > - test case E - 2M, partial:
> > 
> > BO[0] = alloc(4K);
> > BO[1] = alloc(2M);
> > bind(BO[0], aligned VA - 4K, 4K);
> > bind(BO[1], aligned VA, 2M);
> > unbind(aligned VA - 4K, 2M + 4K);	/* Get one 2M PRL, one 4K PRL */
> > 
> > - test case F - 1 GB, partial:
> > 
> > BO[0] = alloc(1G);
> > BO[1] = alloc(2M);
> > bind(BO[0], aligned VA, 1G);
> > bind(BO[1], aligned VA + 1G, 2M);
> > unbind(aligned VA, 1G + 2M); /* PRL should be invalid */
> > 
> > Matt
> > 
> > > Matt
> > >
> > > > with the xe_child->base.children[first] = NULL. But determining if
> > > > this PTE is a leaf entry would require us to iterate through all the
> > > > childrens I believe, which is why I had kept that check (xe_child->base.children[first] != NULL) as sort of an optimistic filter and had
> > this new inner if statement to ensure that these entries are leaf entries.
> > > >
> > > > So, what is your suggestion here?
> > > >
> > > > Thanks,
> > > > Brian
> > > >
> > > > > > Matt
> > > > > >
> > > > > > > > +                               break;
> > > > > > > >
> > > > > > > >                         /* An entry should be added for 64KB
> > > > > > > > but contigious 4K have XE_PTE_PS64 */
> > > > > > > >                         if (pte & XE_PTE_PS64)
> > > > > > >
> > > >
