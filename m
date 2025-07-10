Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8170C83F17
	for <intel-xe@archiver.kernel.org>; Thu, 10 Jul 2025 17:13:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D36110E930;
	Thu, 10 Jul 2025 17:13:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IdHi7ZXC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2552E10E930
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Jul 2025 17:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752167585; x=1783703585;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=lIZ5jxd+vZEnYqyvKDgyDVYrmwr206+cNoXntiXkq7g=;
 b=IdHi7ZXCLOi7uY+mZtMxEFMVH+TeoFPYCiEuoChO0nc7BXFNIREY1R8h
 TLbZH+irDznv8jtd+4wdUjC3ic3z3jGH6xKw8/thHD0v7xIZjZjuE3As5
 PGHdZDBtihbkiziwruwiQazLEvuB014/yzNZcGFEodwyW12d2LRj75pfZ
 eTw8ctPx69UQ3caf+RpGM1cJ+58pzaPSOrOHl1isbvbeE1D9lUZ4GQsp5
 JcMUEvtP9oXAOglmQ3Oh3n03dGUkZ2+ASp3JQjogQb6nGXysMenbnw9B1
 4hXHXkbBzAXVZlneCBfh7er6j+Kb3itn0rme0v89+sq4tNTm74/zRjPZy g==;
X-CSE-ConnectionGUID: hcgoSwLbT32dok1VNmdHaA==
X-CSE-MsgGUID: GgfiGo79SzyRAc+RWSLnmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="64714942"
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="64714942"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 10:13:04 -0700
X-CSE-ConnectionGUID: h6xd2FEnSYu61N8V00TWLw==
X-CSE-MsgGUID: L+JSYz9wQXubPxoDNfJiww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="156707056"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 10:13:03 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 10:13:02 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 10 Jul 2025 10:13:02 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.66) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 10:13:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QtnncVuUq4kddwpghU4uihCAagZdTTS0Lg7n9V0KIeRxyyEG0GH1kR1QuW4UW+vXJbGdlcglAA7g1k9Exxy8uQAg2mISLycB/+v42Ljwt5y+SHj08ugUaErF43Ex9SX1uxy6FQDg5jN88HCGsX+weh0+s7znarctkruG0R7hkq5dhqNoHbhF6O2+eh8oE/vhoSpWYHnNd+sKSVGcwoK5Br1pc+EULahXPnu9LdUu+6uAFu391HgKiWI5O7M9JL5PLUgpRt4On1EpadrNBmk6LUktgVSgce/Aj3hXtxyYUzwt4CKjzLiBXitXBrcabzuyWMH7gBvgwZD6eewDNWifUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b/EEQw1nFXc0uDbIqol4Vwjl492+5QSZXaDVdfvar9I=;
 b=gzmC1thvHTWZWHJxoouNMRDl16VuGABHYHTNWX3NA4F3/k3gQdr94Y2deUX2sj8Jd3J0iAUW1NiI9cknl9Xhwon6p05uXen4AAyvR4VRDfY1n9IfCph3w0TxE8iNDLu+Pv9uzkMaoHphKF2kcfpIvTnRsndVOFUj5fGZtaT0TH9yAmjZ0JS4BoXn4YDc+l51tpPTfl/TCAuBls3h5yR57/B7xU3Fojv5FzvoWBAYgK+95ZMtY4X7/WckMLhSuqqFIA9HLSjaPxOc4ekEuWqtAYWJUPkO0jhB3Al/VU3ZGDvIca2MS/BLc/NNMVuAtpIAfKXwtCSAyrj6+KuNRMPXzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by PH8PR11MB7968.namprd11.prod.outlook.com (2603:10b6:510:25f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Thu, 10 Jul
 2025 17:12:57 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8901.024; Thu, 10 Jul 2025
 17:12:57 +0000
Date: Thu, 10 Jul 2025 10:12:55 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <lucas.demarchi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <raag.jadav@intel.com>,
 <frank.scarbrough@intel.com>, <sk.anirban@intel.com>
Subject: Re: [PATCH v4 5/9] drm/xe/xe_survivability: Add support for Runtime
 survivability mode
Message-ID: <aG_0lw07ql_S2dib@unerlige-desk.amr.corp.intel.com>
References: <20250709112024.1053710-1-riana.tauro@intel.com>
 <20250709112024.1053710-6-riana.tauro@intel.com>
 <aG7-7Lqw79Y8azK1@unerlige-desk.amr.corp.intel.com>
 <e2880cff-fcc8-4c9c-9ff2-e446327fbcb8@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e2880cff-fcc8-4c9c-9ff2-e446327fbcb8@intel.com>
X-ClientProxiedBy: MW4PR03CA0268.namprd03.prod.outlook.com
 (2603:10b6:303:b4::33) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|PH8PR11MB7968:EE_
X-MS-Office365-Filtering-Correlation-Id: e7490064-3137-46d7-a2cc-08ddbfd5042d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Zi84UHBhaHROdUpOeWNpZVVEY0JZR3g3OU53RzVjNnFiRFNtU3ZHUGEzTzJp?=
 =?utf-8?B?ODNueDZXamNFWXlwVTllakphKzdnS0ZVK0Y1SGRIRXdZd3JBVmQ5YXJXdzFh?=
 =?utf-8?B?MjZyS1VwckFRTzVZeTAvL1c2eGtvcVhuaDFiUndzTitUcmxPQ2o3QlVEc2tP?=
 =?utf-8?B?R0xxTWJXb3BUVjFFa3hYc3B0K3JwQ1JFNlRiUVJQZnk3WG83cVFvcVVjYjVE?=
 =?utf-8?B?Vm9qTm1aUVFaVCtrdGVKcDdDNG1sWFBQNEJ3QTZ3NVN1Q0ZseFNxVkpCMDFo?=
 =?utf-8?B?TmxacUVOWUkxMUMwdnVxZkt1K0lHY0dzVTlVSWVuNCt0RDhMc2FLVjRYb3FJ?=
 =?utf-8?B?TkN2MVFXWmxUM2ZkUVVrc0wwMGZEdVJTL0JDc0VrTEdOYTdTQkpBanFYQXYw?=
 =?utf-8?B?UllBdVRjRzcrUzhTVWNId0IxWFJJM1U3d3ZiOVJZSDdkQTZRbVJXUGREdGdI?=
 =?utf-8?B?SUpsT3kycU0wM2xFNDcveFpPSDVzOXRRSWttcUo0M0FsVk50RkRIWlg1YzdM?=
 =?utf-8?B?cE94RFdUOUg3M2dTRGs4V3Y0YW1HeVZ4NEtnTktCUnNVT2U4dTYyNEdGRFlG?=
 =?utf-8?B?TXU3aVVlcStEWFZMZFNsY3lFZmNXanRrMUV3bGtNRExzcnV2MEJrdGlxZWR0?=
 =?utf-8?B?eVhranJBMzQ1MXFXY2FENjJXZG8zZ3VudTZmMXVNYU85SWZ4WXNZa09Rb0pm?=
 =?utf-8?B?QkJHdURVSnNUT1J5ZXlMZHdzME5aZStXNEV2Q3Z0Z091b015NlZITHIweDVY?=
 =?utf-8?B?ZlEwRzFPZEZ4K0UzTEtHNHRMMWRtdmJXMzVCZFZ4RmV2N0ZTZnhGRW1ZNVFl?=
 =?utf-8?B?bEFrdnU3endyQUhuMkNNa0RjU1RScVRreWw2c3dEdHlJeTZFbFJ6NkVIMjh2?=
 =?utf-8?B?aThiWFlXcU9mdzNFMEo1NDZCN0pPY2dKUW9hVCtZc0xMR2lld1Z1akJia0Q4?=
 =?utf-8?B?bFpBWitNd3hVUCtsbmJsUWZheVBRZ05weUg2elZjcEUyMm5WYkw0RTh4VkVL?=
 =?utf-8?B?RkZhUXo1Nm9FQWdHL1VGRFBWUUVyRDN3RVVqdlJLbm9CN0VnUUZGbmd6eGRD?=
 =?utf-8?B?M0xBVmJqYzBrY2Iwb3FCcFlrVFBZbE1BMy9QSEZQdzlZcEYwbTZydWpXYkox?=
 =?utf-8?B?OXRqT0txNXJuRFcyb2JGcEpUcXk3WFBvMDJsQmZVcGpGNkhYRUpRYVlsV2lh?=
 =?utf-8?B?T0RvbWJoS2ltOGczUVJXS3l0b2tEaUcrangrSVE1ZGZKZElEdmdFeG1pRXh0?=
 =?utf-8?B?SEJZdWd6U1FJOXRqaWFNbnpNL3dWUWZkWmtxbFlISUJWcktpWnFqRE1idTBB?=
 =?utf-8?B?SlNSN3pTL0tPam40TmFnc0RjeGdzWkVSSW96Vzc1NFg4a1ZUK3BoMHdvY0U3?=
 =?utf-8?B?b2JmNDM5QlQrUWpFREVqeFhwNEZ4UXE2a0JnWlZsZ0F6M1V4TW4rYW51emVl?=
 =?utf-8?B?THY0bXNPQWtCeEIvMGFxWm5oN1VEbkx2L29UM2VIZ3dwZUx0dTRLMHE2WXVX?=
 =?utf-8?B?R1dZQ0xpblRwTDlJWWUybUxKcFJObDhTdkh5YWw1RDBZcllXeFZYUWxRQ3hl?=
 =?utf-8?B?R0ZpZ3BFSFVRSkVjWWF4NVpqMmh6dGhtTm5RaEhWcUdSRHhJdHAvazNVWDZr?=
 =?utf-8?B?Y2tWaWNEZktjY1d0U241c2xSd21yZldFOXZOeFNTeXh1dXBBVjhpeXdYN2s4?=
 =?utf-8?B?SXo0ZDcreFFZZjhaVEszV2h5N2ZJR0pJM3E5SkhFSzl4NXcyd3VxOEprRUtn?=
 =?utf-8?B?Y0FpTWZvNHo2NXZ6WVN5akRQSTFoWWZYL1RYUXc1dVpFOVV3Y2Y4Tk8yNEdm?=
 =?utf-8?B?cDhYYzQzUEd5M1RFNmppTGMvN2tRV2c3ZThzMmpMTWlheTdMTWxwdkp4U3dH?=
 =?utf-8?B?WXA1T2NWeThGVyt1RzFGN0JPeVJuc0ErdndGSVQ2UWV6NlNZSTN1MGcrWUdr?=
 =?utf-8?Q?FP/w+xIAMno=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UnBNM0VYRE5VL0tQYkpXT29aOGZCYUoxZS9zbGRyWjlFaEpDSURHMENaWHo0?=
 =?utf-8?B?TVRoMEczZDk4ZlhPT3psNzJwVFh0ZlJBV1pEVVpmaHdDaTJQbTVLNUFBd2t1?=
 =?utf-8?B?dmo1d3U0V3RKajQzNzZQV0JYSXBLRCtja1pINFZLUjVTWUdOa0lVTlhlL1kx?=
 =?utf-8?B?alN3eUt6TnpRWjJ4cnNEU01ScFB2ZXBIekJMaUZGanhvUStYTG9NOGVjdldM?=
 =?utf-8?B?UlJRblhEVWlZZWlyK0hQNkZhMnQ2T3ZJZVNHaVpDTFNNT25aMjFaOXZhZUhi?=
 =?utf-8?B?QWxIYlN6czZrakhEMlVYb25QQ1BrRUFyU0NUaVluSzZnSk4zM3RjVzN5WmZz?=
 =?utf-8?B?aHFBV3NoNGx1WTlneHMvWEpGSzdBVkk0Z2d1RHpnN2NoZUNDSjBKcTBqU3Z4?=
 =?utf-8?B?TkliTC85NkJLaG1sVEdnd0J0eTJsYmNoNXBvc3VtYWJ6K1pFanpGa0VsSGs4?=
 =?utf-8?B?cGhJNkZUNjZMVElia3Zld2kvUkVjbHJ2bzlDRlIzN2FMRndnMDdIMWdGMzh6?=
 =?utf-8?B?WkpqYjh1YWk1NnFxTXZtWVVhL3dHY054S1FFajNRR1lNYUlZdzRJZXF1cXFz?=
 =?utf-8?B?KzhING1lOExiVXJJN3VUWk53RVN1Y3JDakdWemZjN1F3N3prMmE5bDFIb1RY?=
 =?utf-8?B?M25mRnhJVVNmN1B5N2YzWUQ5Y3prdm9ySG9QU0N2VUZCS20vb3NxcTZOamZJ?=
 =?utf-8?B?amcyVHhEOGZmSmZOUDZyKzlSMVdKSndHaGlLR3NZbjlUdmhOaUtacEhIbnY5?=
 =?utf-8?B?anFiRjBsOXhBNEZ2dmltaUxSQk9NZ1pXU0VwaU1aSnhCMFhzZDBReGltdHZN?=
 =?utf-8?B?QVFrZkhSR1ErOU5CZHlHVUNqcTA2UWQzajNqUVphMlNPT204ZHZRWjBrR2ND?=
 =?utf-8?B?NUcrSTVxU1NIRmRxUGhGODNUdzZsMXQ1K3JBb3ZxNkRVWWcyazZsRkZ0N3M0?=
 =?utf-8?B?ZTNuRFk2M1JJajRzUzVqczFLUmNPZElpbnBWcnpLQzYraHFNRFptTExlUFQ0?=
 =?utf-8?B?aW0yRmpxcHVUVnRIQVdnY2FWWjB4ZzFvVzVKQlB3OVE5bzNxOGRvU3VpUHVD?=
 =?utf-8?B?bC9yNTVMUGhuMmYycjNjZE1JS21yTzgzS2JGMHJMZlg5bzRrb0hzVklPNEJR?=
 =?utf-8?B?M3BzbzRReDZyTEFPMUZRUE9ZWHl2aExzcW91RXlzNVJlZ3BMc2Nwb3d0enRu?=
 =?utf-8?B?WERBeUtRSzF4dy9mcXJtM05IWVl2QjRCRzRTSitqRnA3bDB6T3k3R3FHVFJR?=
 =?utf-8?B?ZndHYlB3VlJlcHlOZTR5SDNVSDR3UUoyYWpXL1FKcUJGSms2ZzJ3V3I0Yyt0?=
 =?utf-8?B?UjAwZWg0aUo4TmcwUEhxRkxydHduNUljRXFHNmdYQk9PZ2hvUEUrT0Jwb1cv?=
 =?utf-8?B?N0VyREdwNzR6QTdQNkZCS1RlaEMrRTU0QWFSK1RsYS9EOHYweVBtMzZJbVFw?=
 =?utf-8?B?RENFWVR6Z3RhMG9QQ2ZrbmdtdVhML1hKRG1LN3NDMFE1bUswSFJmS1BsekNY?=
 =?utf-8?B?NG1hMVhPQitSQ2hUbUNUYUpaZW9YU2Zkc0JZODluSEhpVkR4UUlQblkxMDFx?=
 =?utf-8?B?MnJLYjNheS9Qb3d3ODdodnB3N3FQOHBuWXI4RzBBVTRjNUQzWnZxSzdJNWoz?=
 =?utf-8?B?Q1dDQWJ6Y081dnlaY3AwVDZJajJoM1RGLy9VcXJHeDFiNHd6NXBmUUd2MEJj?=
 =?utf-8?B?b3A4TFRQdGtEMlJDSjF0Q0FYWUFsa2Qyd0x1WFJFaE10QnV5UzZiQmZ3b25k?=
 =?utf-8?B?VEt2aW1jaENTL21YOG5uTGpweS81b2VaSHF0NXdPeDBkT2pKNTF1VjhaU3hk?=
 =?utf-8?B?WXVwNjdIZmI3akdjVGU4SWdndDN0SThCL1h0RlFPd0hxVHNQZzhMM3MvQ3o5?=
 =?utf-8?B?dFRWUVF5aTh0N3dGV0hXejFUYlA0Z0xUcU1UNXNJS0xIU2FFaFJSeVdmSkpa?=
 =?utf-8?B?YXFjTmxwTCs4RjZndTBoQndtWURURERRQ0RqbEh6K1liYjVLYndrZDQ3bE44?=
 =?utf-8?B?MHNJVEFqclY5a25CcHowMXQ1clhVZFlYSUo1WVYxdzhMWmh5Rm5ZVVZnRy91?=
 =?utf-8?B?SnY3OFZiNnc1Z0VENVd2Tkk1VTVHL2Nnb3RabHBmNGltRkVEWm12V2lhWnkw?=
 =?utf-8?B?dE1DRVlwcm93S3p1ZG4wTmFSNUN0QnZLNVMybExFWnI2OUlqYUVUcCsvUm9j?=
 =?utf-8?Q?pLoqOT+X7IXL4ChhC+5l5jc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e7490064-3137-46d7-a2cc-08ddbfd5042d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 17:12:57.7882 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QL8dV/6+nmZz+CoJ6KCp6EY+F+4nM0siuahdr8unN4choyDWe+jyTh/xBn0bbsqhn020vm+GQrc0QyP5ZKmUJNnuDPs63DorPvCrsB/NIu8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7968
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

On Thu, Jul 10, 2025 at 11:29:44AM +0530, Riana Tauro wrote:
>Hi Umesh
>
>On 7/10/2025 5:14 AM, Umesh Nerlige Ramappa wrote:
>>On Wed, Jul 09, 2025 at 04:50:17PM +0530, Riana Tauro wrote:
>>>Certain runtime firmware errors can cause the device to be in a unusable
>>>state requiring a firmware flash to restore normal operation.
>>>Runtime Survivability Mode indicates firmware flash is necessary by
>>>wedging the device and exposing survivability mode sysfs.
>>>
>>>The below sysfs is an indication that device is in survivability mode
>>>
>>>/sys/bus/pci/devices/<device>/survivability_mode
>>>
>>>Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>>---
>>>drivers/gpu/drm/xe/xe_survivability_mode.c    | 42 ++++++++++++++++++-
>>>drivers/gpu/drm/xe/xe_survivability_mode.h    |  1 +
>>>.../gpu/drm/xe/xe_survivability_mode_types.h  |  1 +
>>>3 files changed, 43 insertions(+), 1 deletion(-)
>>>
>>>diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c 
>>>b/drivers/gpu/ drm/xe/xe_survivability_mode.c
>>>index fefb027b1c84..ca1cfa13525a 100644
>>>--- a/drivers/gpu/drm/xe/xe_survivability_mode.c
>>>+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
>>>@@ -137,7 +137,8 @@ static ssize_t survivability_mode_show(struct 
>>>device *dev,
>>>    struct xe_survivability_info *info = survivability->info;
>>>    int index = 0, count = 0;
>>>
>>>-    count += sysfs_emit_at(buff, count, "Survivability mode type: 
>>>Boot\n");
>>>+    count += sysfs_emit_at(buff, count, "Survivability mode type: %s\n",
>>>+                   survivability->type ? "Runtime" : "Boot");
>>>
>>>    if (!check_boot_failure(xe))
>>>        return count;
>>>@@ -288,6 +289,45 @@ bool 
>>>xe_survivability_mode_is_requested(struct xe_device *xe)
>>>    return check_boot_failure(xe);
>>>}
>>>
>>>+/**
>>>+ * xe_survivability_mode_runtime_enable - Initialize and enable 
>>>runtime survivability mode
>>>+ * @xe: xe device instance
>>>+ *
>>>+ * Initialize survivability information and enable runtime 
>>>survivability mode.
>>>+ * Runtime survivability mode is enabled when certain errors 
>>>cause the device to be
>>>+ * in non-recoverable state. The device is declared wedged with 
>>>the appropriate
>>>+ * recovery method and survivability mode sysfs exposed to userspace
>>>+ *
>>>+ * Return: 0 if runtime survivability mode is enabled or not 
>>>requested, negative error
>>
>>is the "not requested" still applicable here?
>
>Copied it from boot survivability. Not applicable, will remove this
>
>>
>>
>>>+ * code otherwise.
>>>+ */
>>>+int xe_survivability_mode_runtime_enable(struct xe_device *xe)
>>>+{
>>>+    struct xe_survivability *survivability = &xe->survivability;
>>>+    struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>>>+    int ret;
>>>+
>>>+    if (!IS_DGFX(xe) || IS_SRIOV_VF(xe) || xe->info.platform < 
>>>XE_BATTLEMAGE) {
>>
>>Do you think this condition can be better handled with a 
>>has_runtime_survivability for platforms that support it?
>
>Was used once so added it here. Can be split out to a different function

Oh, not a different function. I mean a has_* property. More like entries 
defined in xe_pci_types.h under struct xe_graphics_desc.

Regards,
Umesh

>>
>>>+        dev_err(&pdev->dev, "Runtime Survivability Mode not 
>>>supported\n");
>>>+        return -EINVAL;
>>>+    }
>>>+
>>>+    ret = init_survivability_mode(xe);
>>>+    if (ret)
>>>+        return ret;
>>>+
>>>+    ret = create_survivability_sysfs(pdev);
>>>+    if (ret)
>>>+        dev_err(&pdev->dev, "Failed to create survivability mode 
>>>sysfs\n");
>>
>>You do not return ret in the above if condition. Is that intenational?
>
>yeah this is intentional. The device has to be wedged since it is not 
>usable on such errors even without the sysfs.
>
>Thanks
>Riana
>
>>
>>Regards,
>>Umesh
>>
>>>+
>>>+    survivability->type = XE_SURVIVABILITY_TYPE_RUNTIME;
>>>+    xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_VENDOR);
>>>+    xe_device_declare_wedged(xe);
>>>+
>>>+    dev_err(&pdev->dev, "Runtime Survivability mode enabled\n");
>>>+    return 0;
>>>+}
>>>+
>>>/**
>>> * xe_survivability_mode_boot_enable - Initialize and enable boot 
>>>survivability mode
>>> * @xe: xe device instance
>>>diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.h 
>>>b/drivers/gpu/ drm/xe/xe_survivability_mode.h
>>>index f6ee283ea5e8..1cc94226aa82 100644
>>>--- a/drivers/gpu/drm/xe/xe_survivability_mode.h
>>>+++ b/drivers/gpu/drm/xe/xe_survivability_mode.h
>>>@@ -11,6 +11,7 @@
>>>struct xe_device;
>>>
>>>int xe_survivability_mode_boot_enable(struct xe_device *xe);
>>>+int xe_survivability_mode_runtime_enable(struct xe_device *xe);
>>>bool xe_survivability_mode_is_boot_enabled(struct xe_device *xe);
>>>bool xe_survivability_mode_is_requested(struct xe_device *xe);
>>>
>>>diff --git a/drivers/gpu/drm/xe/xe_survivability_mode_types.h b/ 
>>>drivers/gpu/drm/xe/xe_survivability_mode_types.h
>>>index 5dce393498da..cd65a5d167c9 100644
>>>--- a/drivers/gpu/drm/xe/xe_survivability_mode_types.h
>>>+++ b/drivers/gpu/drm/xe/xe_survivability_mode_types.h
>>>@@ -11,6 +11,7 @@
>>>
>>>enum xe_survivability_type {
>>>    XE_SURVIVABILITY_TYPE_BOOT,
>>>+    XE_SURVIVABILITY_TYPE_RUNTIME,
>>>};
>>>
>>>struct xe_survivability_info {
>>>-- 
>>>2.47.1
>>>
>
>
