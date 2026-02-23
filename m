Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8140EA4FC4
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 14:21:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A437710E3B9;
	Mon, 23 Feb 2026 14:21:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jlcXsOHv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A20510E3B9
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Feb 2026 14:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771856504; x=1803392504;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=z45NSmq5Iq8hB2blXIofZ1awIbDby1e45y9HFSnp/sU=;
 b=jlcXsOHvPni8pTvYPclbiageN2CeNvVzc1FQlc/27cYSjUXh91F96+FC
 +34MqRarmrfImMFuYyNfttXwkmEPfrBb4mGnUaI8QuI3H/Yvx7vRAqgPB
 o7BOuH0/aVRtWewJntK4g/riyf4OIaeX4k5MC2IsCxVxe2kLr456ihPUa
 8Y/MIYFsEBfkX7Pt72NrK9EprUNpabG9sSC27MOdQE+Bp5giJSvq2j6GR
 tF7puAXHv9mqjPsCpxGb8A+UEpLfgBWLhicWh4jbIBCqnD9Epn0mseUsi
 4TH0KuDbPoAMWriBcxOuhqQ3odx+KTqd4OLWDmEzOv/rjywMC4XSfYcvs g==;
X-CSE-ConnectionGUID: YvUc4wu3RsWBTsL+pHawAA==
X-CSE-MsgGUID: aVrY+PmARWKHW+CpkiABow==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="60426157"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="60426157"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 06:21:43 -0800
X-CSE-ConnectionGUID: T76Omt7QSz2dN4HQtJ3Vfw==
X-CSE-MsgGUID: h1h1RCXwTReMxQdzsvrt6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="213976718"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 06:21:43 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 06:21:42 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 06:21:42 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.70) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 06:21:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yRqIAGVDj7vRyJjzYiMn8wr5zNt4eszQMf8nfv8EfPbd4hlGTbgtKgNWSflNFV28IF8g1oo8T73QV9CWGkALZgMsfrkPw5GYYxxxiIGqZQs+KFSkOp4xWdBUX2fviBWd1ScUw6RjwtvMHg1GscNfT9oFXqY95vEB2W7SRdwDuI6bW5Y4BB5POYPz+Um273FRRqYQgvNxKTk9XDg+vSB1dYvDkQUaMq29Bv6/x1Lr4/McAwrEdW7ebTcwKbQizLmOMgGtQ2Gc2OfDrLnTSlmex5Nj80sVZWyyKVHSJ9PyLZwGIC8FTertT48OA3nib/tXon/vteK0PHJQ/7dsAKUDfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h2OyyHTj9Ww9wNX8wPX9+tZQgg0sDB4xeDe7AK3pL2o=;
 b=vY+j1fWYiNI9vnVo7UUyYsZGIGUKJrr1IIWZfB8wti5u9iAc/kD7jkI9/3V/AS3A6k6bNo43nuUv89JsYqRdY8FqfqG12Yr7v/jS4zqp9xrG4KfAApRVUdW8al/umZv8XmsENYs5v6bhmAlzaOHbbP8B8gd2BwoLGSsJZz2KdPt3EuwE5fXMzKv4Fc7whYLiBUuDJ/7aNBlXqRK+S7tvu01kmaW3+Yd55xWBS9T6JqG0U/UTjXqx1ujbeUkQX4raQrGQElTTE/1JZ+VR2NW/aGGdxzXLOGus6mJ6pILifNeXcAhqmT2ry4cAXSl6OUQBCCh6WWSNxqin9Vpwup69BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by SN7PR11MB7538.namprd11.prod.outlook.com (2603:10b6:806:32b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 14:21:40 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::44a4:1ecf:f303:d08f]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::44a4:1ecf:f303:d08f%4]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 14:21:40 +0000
Date: Mon, 23 Feb 2026 19:51:33 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 11/23] drm/xe: Consolidate workaround entries for
 Wa_14018471104
Message-ID: <aZxibWQZ-AfMkeyj@bvivekan-mob1>
References: <20260220-forupstream-wa_cleanup-v2-0-b12005a05af6@intel.com>
 <20260220-forupstream-wa_cleanup-v2-11-b12005a05af6@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20260220-forupstream-wa_cleanup-v2-11-b12005a05af6@intel.com>
X-ClientProxiedBy: MA5PR01CA0109.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d1::15) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|SN7PR11MB7538:EE_
X-MS-Office365-Filtering-Correlation-Id: e410880b-7568-4474-5cff-08de72e6dc6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WjJ3ZEJKdVpLWkJiYVhaR29Wb21hUjUrNnBLaDBEWE9IM3FTaHdlMjd1MTNw?=
 =?utf-8?B?VDEyRXp6RysrUlptUEtySlFBQkdGaVo4QkFNM3FzRDhwOUVDdHd2ci9HbWF6?=
 =?utf-8?B?Rjd5Z2Qzc3YwRGVYR1F4cjNCTFEvTzBuSThnS3pqNHREdThZNHJObGNsUGdr?=
 =?utf-8?B?N0Z6eis1b2txYkFDbk9JUjREdE5BUHUwZWhqV2V5WFladU9vZ3VsVGQ0ZXhQ?=
 =?utf-8?B?SCtVNlQwRTZtd1UxRWE3aXU1UDRNTDI3WTgwR1lnREFZOTNVRllRa3BWcDd5?=
 =?utf-8?B?Z3hzRUJzam5qWHdseFAzZWpmZDUzUHFxRW5yTEVMNksrUVd5cFc5M3JtRGY0?=
 =?utf-8?B?VG1LNEpxT2I0ZkxEVGZBTHA3S0NQMkFIOEJ3b1lNSEUxWEFFVSsxQUpIVUJh?=
 =?utf-8?B?UDNoenZBeTg3ejhuV1lBcTJsWjhIRHJHRXBZREwwaUlXaXJMWEpTUXdja01I?=
 =?utf-8?B?ZlF2THJ1eWM5YURYS0ZqNG9rOXFySmtPTnZtMWVOL1dLYklmOXdoY1NxRGhW?=
 =?utf-8?B?cExsakliL3h5MXF6cDc4VjNVbS9tUU85WlJPbEV5U3BNNTBIOXBuV1Y2L2x3?=
 =?utf-8?B?aTFndWlySlIyYWpuTnB4NXp4cE5yb0xKMEFsdEF4ejQyVHhiYXg0YUlmL21G?=
 =?utf-8?B?K1BFZEVRNDNSME1nQ1FTZUh1U05tdk14T0ZPVFdDSjJpSURqTkp2U3F6MmdN?=
 =?utf-8?B?OUNwSndocldLNFlBOXErbndtdExPQWJJOWZXTlczL2JLM0ViNU1oVXFvd0Jr?=
 =?utf-8?B?R3ZxbU1IWTdpS0ZGZDBrd2o2bDg3b3pXYWdELzhucXBSamgxeTJyNytQb25u?=
 =?utf-8?B?MU5nR2tGZmkzQ3BoNFVybWxDc2ZMK00zY2grNnN3M1VFR00rSExSVENOQUVw?=
 =?utf-8?B?RU1DMVphVGdMRmxmV2FhSWRpNHExTXFqUHhKcWloS3hlWkRDbzRNc0dNeS8x?=
 =?utf-8?B?dlhROTVibXV1d2xTYitGTFpWK05vRlZFTkltM0hPM0k4ajNhN2dpbThETWEz?=
 =?utf-8?B?cmtLTXk0cVd3cGo1czZpOWdDSFRLWmk1SzJUWm13VlhpclUybVlESFFHMXJo?=
 =?utf-8?B?c0hxOU1naE9VZzJlNnRaajdLMjhYN2UrMURteXlpcWhMdjBiaE5aQ3EvUVVR?=
 =?utf-8?B?akxTUmlIdTFsSm5HT0tldTAwRXR4bkdrTEdwZUQ5ZTVnR3YvNCtQMlN0TmZp?=
 =?utf-8?B?VnFaMk9IVDVWeCs4cnlDNHFMZldDZ0JCU2hCVmoyREJ6VHVNZVI1T3lJVmZj?=
 =?utf-8?B?RDdkem9yVDBiZXkva3pYam0vamhaQkNNZlF4V1ZYMFhqMUw2Sjh4alh0MmVm?=
 =?utf-8?B?RldOakZxU0pzMVFtWTdmVmo0QUIzR1F5VFNiZFhWOTQvWmptL0dOc3h5TEVr?=
 =?utf-8?B?RkRlVjk5cjFXOWMrWnBzQVJVeUJpUmhpKzVvaStFZVhLZXdiNi9sd1Q4bmYv?=
 =?utf-8?B?RHBSNFJVSnlSWGlkYkhwck1ROExuUzJDbmFER3Uyak9UOHVnL2VxenE3TEpk?=
 =?utf-8?B?eTh6RFowTzFYS3cxeE5FdVJoUTdFaUhuRWNONmlXYWpDNXArbXpZR250RXo5?=
 =?utf-8?B?anNOek1HZC9aTFBGZUJ3RWhhMmlYMVVTbkY0V1E0U1NUWXF0ZDFlbXBLM1VU?=
 =?utf-8?B?MUtmK1NJSGdabHlQbXNmbWx1SWl6cklGWkR3Ky9LZHU4Qjl4elVZSmdVMFgx?=
 =?utf-8?B?d0o5S0gyTmozM0xBTVRndldjZzE1NEFTSDFVSkZnMkx4Nmd6QVROcGxwOTBw?=
 =?utf-8?B?LzlmT2o1Q1BVcVJoWkx1eXZ2V1dtckthMVVtbEtleGFCcDcwZTByVDFzOThk?=
 =?utf-8?B?Mm1lRGlOL1ZQT3lZSkJtUEVnZ3JUZEFlNklqdVdSZjY4MTc2L3ByWEVLUkdp?=
 =?utf-8?B?RHpQY1JlOXhqRktOcFZUNFVCN1RBNzQ0QUd3OFRmRDFCdHNydm9zdm82cjBC?=
 =?utf-8?B?NVBsclF3L2ZFNWJMNnZGQkR6SUEzOEdyOHh1ZTFnWTBlQ0hUaWhoWkdlcjhs?=
 =?utf-8?B?TnUwY0NOWEFEL2xkc2FacUhGOHVkbUhHVVg4NS9mdzlHQlllTUdxV1pyN0FS?=
 =?utf-8?B?VjhCbFhKS2dVSDEwcHlRcXQxcjhXREk3ak0yZGljS2ZEck41aWYxczUrSzlm?=
 =?utf-8?Q?S6HI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?THo0Y2EvTVhYNWthalVEQWRrN1RhNVc5d0diY0NNQkFKa0lyRE9XeExSb21L?=
 =?utf-8?B?d1hBWmN5d2dmTTZuNXJCRFNIYkk0d1kyM0pndWp1cnJ5YWpwdXhrM2hxaDVJ?=
 =?utf-8?B?UVlzVWJ6RUR0SWxqaG5VcW9SRFNxdGNNSkh2aGpvdzBXeE1OYW44V3RaeVVC?=
 =?utf-8?B?L3FDTUJVN095L3BRa2V6S0NSNStwSVJPRlhCNFl6NWxRNVpvODBkeXVybkhi?=
 =?utf-8?B?NU1adlk2OSt4eUd5Y2ZXYThSMnZFK1ZyNW1MVnNyYXh2cnNLNUFwMWJuWFM1?=
 =?utf-8?B?enF4bHp5dUppeVdvSmZaTWZ3cnNMajNzd09tcUJISWNFd1Q4REdLNHliOGQ2?=
 =?utf-8?B?d2Y4dDQweHEvZ0svVHZqR0hweDVYSEJLK0hsWm0yeXZQaUdKQ2R1Ui9zUVJB?=
 =?utf-8?B?RTlOSVNyTFlwTEhQbEx5cWxUUDhnWEthS1J0a3pPSHc5S2JwZjh0dWtVZmY2?=
 =?utf-8?B?ZnZyZFVJZWdqRlpPVjhEalF5TmE0NWo0RkhtVzkydmt2c3RzZGp6emFVUU1Q?=
 =?utf-8?B?UXV0dVFVZTNsOWJVS3QybHJBaXJYY1E3bGhDcmdSeHdwNEVOUXd3QVloWSs0?=
 =?utf-8?B?bkM1Wm9ySTZIM0trT3FlbHNZUkUzVi9YenpmVFFuOXErYk0zbGtoTTdMYWV0?=
 =?utf-8?B?Y1NHNXdTUUlnOVRrSFpDU1VLZmY5RmxlYjFOLzRjYUs5UVJyd21UVjZOcWwx?=
 =?utf-8?B?VXVwMXczOFFGUjhRbzQ0NFhlVHloV21Bb29OQXB5SXhrQzNibm9la0lJdGl0?=
 =?utf-8?B?RXhNQjdPNHE4SXdNQTBLS2dQMEt5SHZNZVo5RThjMndXOXM2Vzd5TVdwQW1Y?=
 =?utf-8?B?a2ZWNWtnV0Q4N29nUURpSWZIUTJnRGFJcWRMQ2pSclFyU3BsYTVhUmhuRTdU?=
 =?utf-8?B?b09MaFU1bXp3bHlUR08xL2ZhSUgxVUhsNWdhUnlMbGlQdFJ3UXpzOURGbDlQ?=
 =?utf-8?B?S3ZOUFVlTEZQRkVyb3ZLb2V3YnpXZG9PRUlnT3BtdTVuempFaWQrT2haRGxB?=
 =?utf-8?B?YTVYRXk4bHZmcXlUV3IwSThVUENmMXpuL2YyMzl6M3VrVVNTSVdJTDdtcDF1?=
 =?utf-8?B?Tm0za1hpRlprNVpXbHIwVkNHMHB0eHJ5bUx0RGxIQlhhekt0TjRBUDFEZnNs?=
 =?utf-8?B?NFZmd29KL094QmYyamhuZDBnLy9sV1N4VmxuaHZFR0VQcEZwTCtielMrSkhD?=
 =?utf-8?B?Z0VaVzIwT29Yb0lrTmNxQ0lCVmVmbVNLR0RSSjlCSlMrL24xN29wblh2UVgy?=
 =?utf-8?B?b2dNanJOc1BjL1ZEclZaRGtPaDRLc1RiRFZkaHdIRS9vV3Y4dzJnQVpYRmk2?=
 =?utf-8?B?dkZ6K2Y4R1JKdFdGUDVyVmU1WDBkNU5mbEVUaE9ucGpTaC9FUG1ZMWlHWFVD?=
 =?utf-8?B?bHpON2YwUFZKV1F4bDk5dE5iZFJyaGFYcGZaTGd3aEVuTjhuYzZMaDlrdzVJ?=
 =?utf-8?B?aWNTZGhVamFPWmFXbytvS2J0dlBjSG5wUGNheTg5cm5md2tBV3R3QW1MYmdQ?=
 =?utf-8?B?T25TenB1ajVBRmVVKys1L1J3VmhIYkczNzI4WVk0THROM0YzcE5BVGR3MzNm?=
 =?utf-8?B?VGQ3VGJjSiszZEk2bDZaM3l0R2lOWnBXeXkvOEdBUzBSSnZIZ2t0T1FYQmRX?=
 =?utf-8?B?V3lSby83WHRSRGIxaS9tazY4czF0ZjRVVEduY3A2UHdWWHFCQ045QWN1WGtw?=
 =?utf-8?B?d01PaGNKR1ZBWGJrSWNRTU5SQ3VzVHc4cnljQ0w1Rjl2UTE4ODdBVlFSR1Iy?=
 =?utf-8?B?TmVXR3hrSHpzMW53T0JzN0pFRFl0ZTZzTXZ2N2N3dm1CU0M5dTA2TFFONHRi?=
 =?utf-8?B?S1FVNDFETlBvWE9iT1o4cWhxRW9WYkhXZmZWUUxxTXBGWjR5SFNuaTJsYnpi?=
 =?utf-8?B?bVlVQzdMOFI3cGZXbWR1dkFhUzU2Y1FCVU93SUx1encwVGw4OS91Q1ZyYk5C?=
 =?utf-8?B?KzdjVUIzWTFnTlFWOUcvdmFySFNBS2VuRXZ6OEJkUWNsVW1VcVJiaEVOL3ZY?=
 =?utf-8?B?RWk5bzhaYytMdlFKL0hveXFneEdBQ3g4b1J4ZkNjUW1xekRRUm04VHVBaWFM?=
 =?utf-8?B?RTdSeWUzTU1GcTErSFVuUUhzSWRoRDFTWmhSZFQ2a2d5NnRXRG1lSWx6b3Jp?=
 =?utf-8?B?b3RjcXRBYTNuRU9xSWpMZ0twWjZxWDVkNFFENll0QUF1TEQ0RU8vTStLb09Y?=
 =?utf-8?B?V2JiaVF1T1JleFViNFRNWHRITDdIdURESXdndmZOUmo2bG82djkzZ2s3dGxR?=
 =?utf-8?B?QmpxdUtIb28rSER4Qll4bVFmYU5BeE41eTJHY0d5MFY2SWYvSWNpRjFhZzY2?=
 =?utf-8?B?OWxIU0lhb3hENGZTYXRmY2Y4M0I0VVRkTU1TdXBQNUVWdkxDQ2Z2Mk5OVTgx?=
 =?utf-8?Q?RUOHNxnahmlqlNTnO3axhNjSKMdNriupld1e9?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e410880b-7568-4474-5cff-08de72e6dc6b
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 14:21:40.3147 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: URyPEPNHHqqkLcsm/PYYUbjjCJzOnZWbeYEtCctigcBYWz8sT0lgzAeeENe6cVMZCl5yk81YoNT3rRkZX4azIU0av04Viy93J00Lbyg9vRT6gRC3qAkbQmb/Y2j2j+kk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7538
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

On 20.02.2026 09:27, Matt Roper wrote:
> Wa_14018471104 applies to all graphics versions from 20.01 through 20.04
> (inclusive).  Consolidate the two RTP entries into a single range-based
> entry.
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_wa.c | 14 +++++---------
>  1 file changed, 5 insertions(+), 9 deletions(-)

LGTM.

Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Regards,
Bala 

> 
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 4809166ba8ec69fc913fe2ca0103fe54e345dd14..9119ca9ba1031d9180b44c13a702e1bb04fd0ca6 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -358,6 +358,11 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  		       FUNC(xe_rtp_match_first_render_or_compute)),
>  	  XE_RTP_ACTIONS(SET(ROW_CHICKEN3, XE2_EUPEND_CHK_FLUSH_DIS))
>  	},
> +	{ XE_RTP_NAME("14018471104"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2004),
> +		       FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW, ENABLE_SMP_LD_RENDER_SURFACE_CONTROL))
> +	},
>  
>  	/* TGL */
>  
> @@ -500,10 +505,6 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  		       FUNC(xe_rtp_match_first_render_or_compute)),
>  	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4, DISABLE_TDL_PUSH))
>  	},
> -	{ XE_RTP_NAME("14018471104"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION(2004), FUNC(xe_rtp_match_first_render_or_compute)),
> -	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW, ENABLE_SMP_LD_RENDER_SURFACE_CONTROL))
> -	},
>  	/*
>  	 * These two workarounds are the same, just applying to different
>  	 * engines.  Although Wa_18032095049 (for the RCS) isn't required on
> @@ -545,11 +546,6 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  		       FUNC(xe_rtp_match_first_render_or_compute)),
>  	  XE_RTP_ACTIONS(SET(ROW_CHICKEN, EARLY_EOT_DIS))
>  	},
> -	{ XE_RTP_NAME("14018471104"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
> -		       FUNC(xe_rtp_match_first_render_or_compute)),
> -	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW, ENABLE_SMP_LD_RENDER_SURFACE_CONTROL))
> -	},
>  	/*
>  	 * Although this workaround isn't required for the RCS, disabling these
>  	 * reports has no impact for our driver or the GuC, so we go ahead and
> 
> -- 
> 2.53.0
> 
