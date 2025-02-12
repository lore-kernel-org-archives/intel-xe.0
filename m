Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 706E0C02198
	for <intel-xe@archiver.kernel.org>; Wed, 12 Feb 2025 05:45:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BB2310E7B0;
	Wed, 12 Feb 2025 05:45:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K3XPVQYg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 589B110E7B0
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Feb 2025 05:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739339149; x=1770875149;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=RqkspCxH5aj37jmd21lYUhydUtV9o4dCE5Tzu/UQw/o=;
 b=K3XPVQYgAWVB2bB59w1ZUQgHuOmOrSsInWG1C526YzKDfCMqhTG2QbKj
 prz45mxn7JKQgICIky9G9dxmTB1XeZjMw2muj3etQGJ3lansIowlXNUfU
 d3y8WFWW3Y0DzxHFCxhN+ezDA00bKfAS7E2c5eXuO0saXTLEScaEAEDpI
 WqfnfkYvdWCJpvVzfPLN6lRs65li1PNIKt9iImohbTTxPeSyasYCwX19K
 aM5b0aYlyzvYNr0yUVttnNP8D2SwLOD598+GzKv89AE0BkhCr2Zq9VqEM
 K+tPNSKEdScq0t+zdoj9OWgGGG4E/2lDzVg4NFZlChTzBeq6SLAHBmS0w g==;
X-CSE-ConnectionGUID: iHyPdrdETsqQ5fFNjYgL0g==
X-CSE-MsgGUID: ZVu2E+EgTQyNLA4acf3kkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="50623492"
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; d="scan'208";a="50623492"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 21:45:48 -0800
X-CSE-ConnectionGUID: mT4AGGpJS1WnxWSRE/ldMA==
X-CSE-MsgGUID: 0s187nCLTyuuWH9jP/3Ueg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; d="scan'208";a="117802253"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Feb 2025 21:45:48 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 11 Feb 2025 21:45:47 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 11 Feb 2025 21:45:47 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.49) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 11 Feb 2025 21:45:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gBTFIHqHUmzzRRCrQBYR0Ok2UJVdnEMbA40WKLJhUAF32/zPMSJyvTU8l47/8s28LrjqknGOhQplUuoGEtMcKV9xqziDDeVS8/WWOG8b0jyBzGcODU4YTGveYkPW3DjP7QQtv0zKVKTZXtBuPUA8UdCYXKlw/DNGMMJ4uApAw+n6fLmF3fgKcXALkBgM4HOcWqJ8tmWea5rOy9FUKIWIMk5jtNymn+zF6ALTLPERmCAiNXVTyQROipPh3ly8KYk4cB+DDTBmWQS2CMqmB2MEvPzA/REDgSBrC5D91Wo1PWJMleo0jyJFE7RImknqojNiGyi3XVHoWQDMrph7QaKF6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pVXywQLbjwDVcZB8UUiaXh3rOakSzkC5EnpJdYxErTI=;
 b=e6XrGgPpm75zTn3U8LQbB+Bhzvkli6wITrzzSUMmEWR8Kxz8/FXP1FKf9pSmpnbTjk+zoaBD3OJ/yvJewtLu9FYUlNYLlK3LNPn9Se+m/TONPBKh5TU/wz6amOuKIqiLzvfxPeVJhvTkqOYS04rabhfRa0cThQl2Ll7sxAUCk51NyoGGJXefAJRBtzwimE9MD9VjlAPpOzkfsKj4vYfBqnfAAzbVi4lV6BCJyxuL78o8D4or3D1/yZed4376+2ZyXyCqVJLMs+4AdES+PaXkUpHSRrwCm7x+KpnGlfH+EHA9itjUUVI3XmJBV5tbYxQWgfaZMCdXYPCoY1KcTnnJ4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CO1PR11MB5121.namprd11.prod.outlook.com (2603:10b6:303:98::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Wed, 12 Feb
 2025 05:45:44 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8445.008; Wed, 12 Feb 2025
 05:45:44 +0000
Date: Tue, 11 Feb 2025 23:45:38 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Francois Dugast
 <francois.dugast@intel.com>, Matthew Auld <matthew.auld@intel.com>, "Daniele
 Ceraolo Spurio" <daniele.ceraolospurio@intel.com>, Thomas
 =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v3 06/13] drm/xe: Add callback support for driver remove
Message-ID: <i77nyyt32dszv2ft7puqmgxopfczi6lftzgna36xhrkwpb5u7n@eljm2wlqsxbg>
References: <20250207221945.2878241-1-lucas.demarchi@intel.com>
 <20250207221945.2878241-7-lucas.demarchi@intel.com>
 <Z6o6WpGqz_B0bj3W@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z6o6WpGqz_B0bj3W@intel.com>
X-ClientProxiedBy: MW4PR04CA0353.namprd04.prod.outlook.com
 (2603:10b6:303:8a::28) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CO1PR11MB5121:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e6385aa-b43b-4a25-87ee-08dd4b287de4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?udlRo8Gr5JXQSqPsz8/Nq5Ed1RCuXbIHGZBj6s/4+u4HvccaGXCmpsTbgr?=
 =?iso-8859-1?Q?++pwLoYE15Hl74kPVVwqh6unMnCcI1sX9i17PtoVxXGaCiUNHcDE+kiMKY?=
 =?iso-8859-1?Q?ChOVM9FIyWGzogT9Z1YcmeIzZh06+J3DOUcsGVCJHBSNs1liaGgmcYapyD?=
 =?iso-8859-1?Q?03jEhtv9B/XX+6ne+IxGcPQLf86p14NNI9MDUrsIR+f0vuqF/VdCY3yk3X?=
 =?iso-8859-1?Q?wDlczEi/kFVlRqAZkJ6UsF/1+vs7FFSDDPOYPUk3N5vylXvnTuENSgCDFA?=
 =?iso-8859-1?Q?jo6y7JSIqn8+Blf1OrkHzQIdx0xzc0tNKsSYLKSNqEum2g3DE69671ylYJ?=
 =?iso-8859-1?Q?pZ3nQcuBJ+TqrgaxaGJX39Gi3gEoBcNd2RnBKZINMQ4KwSrBjMDAFzh2SG?=
 =?iso-8859-1?Q?7x3gjiq91QBN7qDhgn2mvKdr5jYBMuKC6EYOFFd799eaOV/JTbGetQrlh1?=
 =?iso-8859-1?Q?Nc9fay9z127yJFWcc7+3sWUPSxpmbst/fXSfe1GO1uAQM07nZWT6TUPAI3?=
 =?iso-8859-1?Q?VQq7WO+4tMrQ4r7ElGxijA3bWl2sdx3lEeIxrugat26tj79arCGFtfVzIC?=
 =?iso-8859-1?Q?MqKZtleoMmX0qe5Pjai/HlJp/TB0qyWueNbDypg1zY9TLpPUGktMehdVIj?=
 =?iso-8859-1?Q?saddjNe2MnRGOi7M0YiyBI6hwlrdi5BwYq1EkvJO68VLXDS9wwhNq2vkmo?=
 =?iso-8859-1?Q?D8LHS0NwqCKHmo7QCsCtca0yRF5+4cIrXXFy3MFXpIGl4Di7BJR4RCi7GR?=
 =?iso-8859-1?Q?GJR+inkmHOBWDQnZG7jP6kjrvgPmOp1KCAcef6AgKzKTIGDKQqYxcWVBXP?=
 =?iso-8859-1?Q?sVnrtvk5250fO1rIq7vQuHsWb/hJFd64nchRDNOlkC7iC3ppNbMD70xZnQ?=
 =?iso-8859-1?Q?EZaX71J1m5C8apwXwZyXDj440t98tQuNbgbXt5MdznANHQYJAGbB1GQSxM?=
 =?iso-8859-1?Q?dIFtzlQJKffryU44Bx8QpZXIXl2A1YtRS+FhDkiOF+7avsQkNTsAj0tL2e?=
 =?iso-8859-1?Q?EkBjzucek+zGqjOmEDYHLPbgIMzLRHZa16w8y3/77yZqxXXXPAj79tJZ/Q?=
 =?iso-8859-1?Q?D59MtcOynVj1h8wZ+9FPBjtexRwKmxfnBVka0et/gEamBzctxePeKTVTCp?=
 =?iso-8859-1?Q?Z4eUErNjh/eEJ1JO38qWn7fQxNcuo/BiY5UjnC8R4PkEzuWSZfZSHsOygo?=
 =?iso-8859-1?Q?vC4fP38FGDBPoASr1Wqk8PxvDp/vR0BAClrIIkVAmB7riLU1B4c6w7elTW?=
 =?iso-8859-1?Q?FiBkgVQGrvHlwC2578+/qXjFvp2/XaGD7JEyzrtvE2IpONTckmlhC3S04A?=
 =?iso-8859-1?Q?Wtgj05SlJq+kZLfOTE7DFmz4CwUKX25AR0zGfUTdhDb98JZGJ0nNghcHcC?=
 =?iso-8859-1?Q?Nzk8oUjiUONWJ0KFA6Avd6QGG0o8QmLdJssHd/JMshjD5RHreGEeo2YyCE?=
 =?iso-8859-1?Q?cIBp/X5GPsSP0RI2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?HXEwzCY6vnpN2Jo8vphBb10lWVNlTCzeK0lKvbWJwfvnMkcm6ZSxXvCRNR?=
 =?iso-8859-1?Q?UTolHyRe7qRi/fgnmXkrbAGRoVyhraHDgMtyPyLgoBAtkduo07Q2Gp9N1z?=
 =?iso-8859-1?Q?EI+K92hrf3l2Zdpt1Kjch/JO1mBle7yRo1wW1ROyghEuvVwQTCph+oMmeW?=
 =?iso-8859-1?Q?a2hvenomXZm5nogKE9m9I5UsE5Qrbh1JrtOe07dlmrEho9B+WpdLKmoBop?=
 =?iso-8859-1?Q?HaPId1OXNf8MeTJvh9g3YzNZLIdfH0CMxuJ0oAFE58GBjj7+fOD7gd+EaI?=
 =?iso-8859-1?Q?XPHr2zbmXAptfeeZlnUl9vNfczmDmVm2UEb8Bh0ed/M6HjawCgFkU5ljei?=
 =?iso-8859-1?Q?hcJT7GWBOsgr3PpitZU9tg3JlM1r38WZwgajknB8jGtfQ9sbe2872Onabh?=
 =?iso-8859-1?Q?tRMCADzhYJLCL+krliW/XKCrqqXE/o4rHgrcYqrtVnXqci+iFPopnGC7lp?=
 =?iso-8859-1?Q?/Q06tV8d0rfZT/sRtpFamfIE/NQpvgZqMxH9nelK3NEMkviivt7+MWYX6J?=
 =?iso-8859-1?Q?WJaszCp/gekI8Gr3Kh4Kze7JxSF8fU1kFH2I8gu4N0jlH5DqaX0dia5LG3?=
 =?iso-8859-1?Q?Q0qNrwiQeFeYnZgO2c/1OyMRjDSLtM7GH4FcLnLORcdo4/NH69pnRSfexM?=
 =?iso-8859-1?Q?F75bAA+ooIl27DBdRoFcdh8MjsP3c3rsvpjc1An2hcwtjd2lzA2hRjJbc9?=
 =?iso-8859-1?Q?x1z97kbzJXEgBQovwCZFTuJfbQ3MFOf8z5rPjOIkFu2pHqxhl4xpMS4p94?=
 =?iso-8859-1?Q?vOf4ZHjKEiQXFWFnmLW0g3wgCY34fNyBjwGlONkhm9z85Ez1Hzmhfv56BM?=
 =?iso-8859-1?Q?Cn/L3cmQuVl0JMvrIMLRlmNW+Af8uD82UhtOYlpNrOnOU8Cy9GGtmTFxeg?=
 =?iso-8859-1?Q?Hjy8YlXkF5q/RkgeKFKoqoS3bV+l5pdkhxeNrMj6fW1FqDZyXT2WuC1VI4?=
 =?iso-8859-1?Q?Iwqss+16KDIS/YDXtRn8d+Xwo2R0IapKI2dPKlXbYgrQx1r1ansr4q/Qna?=
 =?iso-8859-1?Q?HM0AwVEKIgUhMo569LT51AYxOsJdOSf1450x1jGTZlkvjahQuComH7M076?=
 =?iso-8859-1?Q?cGBPt576/6cbMwUcW5sdNTyqxwYfvqAGZEJoYch40Ma7ACU0T/hTCuJ+Vm?=
 =?iso-8859-1?Q?wRbeE9t1k91nh/aC56HJRQSQojDpY7lrmXHZ0I5Y+s29xQ7n04X+IofyR7?=
 =?iso-8859-1?Q?vHlZlQkI5VnNj/SplaE/dgEmOBoM6UH00lA+SYYyTkBM96YYHVJEDrq5ZZ?=
 =?iso-8859-1?Q?Vgf4h+CkfT57UJvOK/FesdzCPVNG4gatLPP3xAxHJ1wCJN5so8i7Qj8geY?=
 =?iso-8859-1?Q?d0AOPydm1+CKzCi//57pd1R5QSZ3KByleJlJtPltamUKuFkTAbMtz1OXVX?=
 =?iso-8859-1?Q?cwEaioX3UKodtccntipu9NDXC5c8my0zFMY2p4Bb59SaMuF8+pRMjaEtNp?=
 =?iso-8859-1?Q?ZVYejfinrqJF2KXUTLqBNgqpHSIlv8zfmwxyrspyJYpf3aQdLQjDAyPtSg?=
 =?iso-8859-1?Q?6kEaGSaeAog/+6e/K9zpnAYiluZ4GDVhKF8+7UjtHwOw8tDCn+HGDBCMT8?=
 =?iso-8859-1?Q?89EGs9iZXcwLJ6EltX/3iRVsPkQWpHvFI39iGF+xR1Jp9lVaks14/mzjdT?=
 =?iso-8859-1?Q?fW47JSIFE1R9ps2jXllAz1h/65PwGKlFinMcc2ytwLf7zVsknas3whGg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e6385aa-b43b-4a25-87ee-08dd4b287de4
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 05:45:44.1685 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q07tVX2qVtY8wwf+TKLHuKsX+IInf5uA7C0bnOI4Lvl2u2wy8dUcLhVmeaA7jHQPaP1VPfVJEYgLUx0Xq6aUsWyzYD9UTqIntRwjvQupKZU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5121
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

On Mon, Feb 10, 2025 at 12:41:46PM -0500, Rodrigo Vivi wrote:
>On Fri, Feb 07, 2025 at 02:19:38PM -0800, Lucas De Marchi wrote:
>> xe device probe uses devm cleanup in most places. However there are a
>> few that are not possible: when the driver interacts with other
>
>"few cases where this is not possible" ?!
>
>> subsystems that require the cleanup to happen before the device being
>> removed from the bus. One example is the component_* APIs used by
>> xe_gsc_proxy and display.
>>
>> Add a callback-based remove so the exception don't make the probe
>> use multiple error handling styles.
>>
>> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_device.c               | 59 ++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_device.h               |  4 ++
>>  drivers/gpu/drm/xe/xe_device_remove_action.h | 24 ++++++++
>>  drivers/gpu/drm/xe/xe_device_types.h         | 15 +++++
>>  drivers/gpu/drm/xe/xe_pci.c                  |  4 +-
>>  5 files changed, 105 insertions(+), 1 deletion(-)
>>  create mode 100644 drivers/gpu/drm/xe/xe_device_remove_action.h
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index 90275531653fe..5fc4e696262f9 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -747,6 +747,9 @@ int xe_device_probe(struct xe_device *xe)
>>  	u8 last_gt;
>>  	u8 id;
>>
>> +	xe->probing = true;
>> +	INIT_LIST_HEAD(&xe->remove_action_list);
>> +
>>  	xe_pat_init_early(xe);
>>
>>  	err = xe_sriov_init(xe);
>> @@ -892,6 +895,8 @@ int xe_device_probe(struct xe_device *xe)
>>
>>  	xe_vsec_init(xe);
>>
>> +	xe->probing = false;
>> +
>>  	return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
>>
>>  err_fini_display:
>> @@ -911,6 +916,58 @@ int xe_device_probe(struct xe_device *xe)
>>  	return err;
>>  }
>>
>> +/**
>> + * xe_device_call_remove_actions - Call the remove actions
>> + * @xe: xe device instance
>> + *
>> + * This is only to be used by xe_pci and xe_device to call the remove actions
>> + * while removing the driver or handling probe failures.
>> + */
>> +void xe_device_call_remove_actions(struct xe_device *xe)
>> +{
>> +	struct xe_device_remove_action *ra;
>> +
>> +	list_for_each_entry(ra, &xe->remove_action_list, node)
>> +		ra->remove(ra);
>> +
>> +	xe->probing = false;
>> +}
>> +
>> +/**
>> + * xe_device_add_remove_action - Add an action to run on driver removal
>> + * @xe: xe device instance
>> + * @ra: pointer to the object embedded into the object to cleanup
>> + * @remove: function to execute. The @ra is passed as argument
>> + *
>> + * Example:
>> + *
>> + * .. code-block:: c
>> + *
>> + *	static void foo_remove(struct xe_device_remove_action *ra)
>> + *	{
>> + *		struct xe_foo *foo = container_of(ra, struct xe_foo, remove_action);
>> + *		...
>> + *	}
>> + *
>> + *	int xe_foo_init(struct xe_foo *foo)
>> + *	{
>> + *		...
>> + *		xe_device_add_remove_action(xe, &foo->remove_action, foo_remove);
>> + *		...
>> + *		return 0;
>> + *	};
>
>Although the cover letter mention that this should be the exception, the
>documentation here doesn't make that so clear.
>
>I believe we should be more clear on what cases this structure is aiming
>and some basic rules on when to go here instead of devm or drmm.

ok.. I went back to double check the cases in which this is really
really needed and the only one is apparently the handling with
component driver: devres is currently not handling well the devres group
removal while all resources are removed.  I have a patch for that, but
I think I will have to do it in parallel to what's being done here.

CI uncovered one more issue since xe_display_fini() may also do
component_del() in ADL-P... I will move this patch to be the first one,
fixup the xe_display part and re-submit.  In parallel I'm submitting the
improvements in drivers/base/{component,devres}.c to the relevant mailing
list.

>
>And probably even keep that comment where it is used with the GSC code.
>
>But other than that, the code and the approach looks good to me.

thanks
Lucas De Marchi

>
>> + */
>> +void xe_device_add_remove_action(struct xe_device *xe,
>> +				 struct xe_device_remove_action *ra,
>> +				 void (*remove)(struct xe_device_remove_action *ra))
>> +{
>> +	drm_WARN_ON(&xe->drm, !xe->probing);
>> +
>> +	INIT_LIST_HEAD(&ra->node);
>> +	ra->remove = remove;
>> +	list_add(&ra->node, &xe->remove_action_list);
>> +}
>> +
>>  static void xe_device_remove_display(struct xe_device *xe)
>>  {
>>  	xe_display_unregister(xe);
>> @@ -934,6 +991,8 @@ void xe_device_remove(struct xe_device *xe)
>>
>>  	for_each_gt(gt, xe, id)
>>  		xe_gt_remove(gt);
>> +
>> +	xe_device_call_remove_actions(xe);
>>  }
>>
>>  void xe_device_shutdown(struct xe_device *xe)
>> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
>> index fc3c2af3fb7fd..3fecf865957b0 100644
>> --- a/drivers/gpu/drm/xe/xe_device.h
>> +++ b/drivers/gpu/drm/xe/xe_device.h
>> @@ -45,6 +45,10 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
>>  				   const struct pci_device_id *ent);
>>  int xe_device_probe_early(struct xe_device *xe);
>>  int xe_device_probe(struct xe_device *xe);
>> +void xe_device_add_remove_action(struct xe_device *xe,
>> +				 struct xe_device_remove_action *ra,
>> +				 void (*remove)(struct xe_device_remove_action *ra));
>> +void xe_device_call_remove_actions(struct xe_device *xe);
>>  void xe_device_remove(struct xe_device *xe);
>>  void xe_device_shutdown(struct xe_device *xe);
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device_remove_action.h b/drivers/gpu/drm/xe/xe_device_remove_action.h
>> new file mode 100644
>> index 0000000000000..e0322c4660dda
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_device_remove_action.h
>> @@ -0,0 +1,24 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_DEVICE_REMOVE_ACTION_H_
>> +#define _XE_DEVICE_REMOVE_ACTION_H_
>> +
>> +#include <linux/list.h>
>> +
>> +/**
>> + * struct xe_device_remove_action - Action item to run on driver removal
>> + *
>> + * This should be used like a list_head, embeding it into structures of the
>> + * individual parts being initialized. Once the remove action is ready to be
>> + * added, call xe_device_add_remove_action() to initialize and use this struct.
>> + */
>> +struct xe_device_remove_action {
>> +	/* private: */
>> +	struct list_head node;
>> +	void (*remove)(struct xe_device_remove_action *ra);
>> +};
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index c0e886bac1831..4c902e0cb4ba9 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -13,6 +13,7 @@
>>  #include <drm/ttm/ttm_device.h>
>>
>>  #include "xe_devcoredump_types.h"
>> +#include "xe_device_remove_action.h"
>>  #include "xe_heci_gsc.h"
>>  #include "xe_lmtt_types.h"
>>  #include "xe_memirq_types.h"
>> @@ -428,6 +429,20 @@ struct xe_device {
>>  	/** @tiles: device tiles */
>>  	struct xe_tile tiles[XE_MAX_TILES_PER_DEVICE];
>>
>> +	/**
>> +	 * @remove_action_list: list of actions to execute on device remove.
>> +	 * Use xe_device_add_remove_action() for that. Actions can only be added
>> +	 * during probe and are executed during the call from PCI subsystem to
>> +	 * remove the driver from the device.
>> +	 */
>> +	struct list_head remove_action_list;
>> +
>> +	/**
>> +	 * @probing: cover the section in which @remove_action_list can be used
>> +	 * to post cleaning actions
>> +	 */
>> +	bool probing;
>> +
>>  	/**
>>  	 * @mem_access: keep track of memory access in the device, possibly
>>  	 * triggering additional actions when they occur.
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index 6a8e82aff3853..70b697fde5b96 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -905,8 +905,10 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>>  		return err;
>>
>>  	err = xe_device_probe(xe);
>> -	if (err)
>> +	if (err) {
>> +		xe_device_call_remove_actions(xe);
>>  		return err;
>> +	}
>>
>>  	err = xe_pm_init(xe);
>>  	if (err)
>> --
>> 2.48.1
>>
