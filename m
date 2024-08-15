Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A025C52D7D
	for <intel-xe@archiver.kernel.org>; Thu, 15 Aug 2024 13:57:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEC2F10E3FD;
	Thu, 15 Aug 2024 13:57:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Omg94PrL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B55BD10E3FD
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Aug 2024 13:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723730221; x=1755266221;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=AdnRJ/84h4GEmOC+uAX2qoPdvoUyRWHVgmqM0AyfqUQ=;
 b=Omg94PrLUIgLmrF8I5z8O5gY6Vr5nGx0uhL5p1fUbyvsH3+evPCE/7AI
 clq9OMDVZTesSrD/JV6a5ADBPNOKBtdz2jSphgvVcLSq8ToPlO2G3FN98
 G3fxWtJhyYKZxZuEXWo0GY6/TUBWTurhikTvl1bfyvKC59w9xZHg4Uxbc
 sgl1h+xtmTyej6gLb0B7vZ8Jms14WT14jV5LxAmYbaplvfRsthDnPkMgg
 mzqT8HCPF9P3oYuhDyTMQ2BwuXoOVDQl2zSa97d0Y451q7gw6uNHxz0sk
 uPn/ah8aq84uqyo+2fnRBRabkl2v3+TVfszmGjPCVQyyLbNbcxL7KvYqr A==;
X-CSE-ConnectionGUID: JZjdI8vVTtisgy3aje1efA==
X-CSE-MsgGUID: 9YHhBIU6Qp2N+czBL720fA==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="32618747"
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; d="scan'208";a="32618747"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 06:57:00 -0700
X-CSE-ConnectionGUID: cBMHLczrSPWOb61bSQPyLQ==
X-CSE-MsgGUID: ygnlxVjgRn2qnqhNuT3qKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; d="scan'208";a="82560215"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Aug 2024 06:57:00 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 15 Aug 2024 06:56:59 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 15 Aug 2024 06:56:59 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.44) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 15 Aug 2024 06:56:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DHwzaxZq/6emVYz6JZYqQdI5Q+Ts9QHy27JJBxA2UXUQbnbGgLGXAORupB+dXU2AHXfu/2Imc3wDMDj/MeKowLpU9wxxgY3kXLmJzAR3O8uTmAZOtyoG6Cxp3OHiOzi7SLaXrjjLcvTvF/9+AG2pNsfy+E9GOIedlEHrmLmFKuExudGMDksSp8JC9yDz4aPpkh2JRh5TqeiojOVsi1U/49Bm3Q72GjL/Hjwe4IZ4WxtcyQN1TgpdKK7n6ewoOT4n6uLEVGraJ+valDADfX8vwDKI3ED/PQOdtBd52Dz8JGdkY3gFp18wIyCAiX3H8tmwlQ64eoXXj+dpi3EP+Oc7/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ASXKhW1TYVdtdAZwRB2wWde7xMckN3l9SCUgmEAlABA=;
 b=i9VEI+dtoqoDTyHR5Tx8AB2fLWKAFT9/HVHj9CD5FtO8fIiSJIPTPzf/ACAHhpukrMgvnEmDhT3DAOTlRvQyM9bP+ZG1oWoErp+Ajg7Jc2c1hPFQo5rsaM9mcek6CGWKqDhJ1uqDGG1SXwGDdzgo5I+v90c0vIsz85JRMANS+OcjJ7duQMAnWzhl08taOa4kRoPYyuVCBWEevmDnmQ2+LJGJ/VDOMrOg049DM0sONcuu/i5CBTvU0rwJNQBHRY7S/lXgzvAZbamr/zXB56gAJ5bcGYPLMoiN0OkkrpGV1GWJUml/MEXCD6E+FOfrbE5PY7OCKTHxtspgMdIU69Y7Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB7562.namprd11.prod.outlook.com (2603:10b6:510:287::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.33; Thu, 15 Aug
 2024 13:56:57 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7875.016; Thu, 15 Aug 2024
 13:56:57 +0000
Date: Thu, 15 Aug 2024 08:56:52 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: Tejas Upadhyay <tejas.upadhyay@intel.com>,
 <intel-xe@lists.freedesktop.org>, Shekhar Chauhan
 <shekhar.chauhan@intel.com>, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH V2 1/3] drm/xe: Move enable host l2 VRAM post MCR init
Message-ID: <ifjhigf2uly4t66lhj2cf4ew4nmdgr72kgbrb4tqkx4hq7qls7@oiifk7dxjji6>
References: <20240814095614.909774-1-tejas.upadhyay@intel.com>
 <20240814095614.909774-2-tejas.upadhyay@intel.com>
 <xwmsqnf33e2itfsgcmy6csqd7wos7hcixfy3oyr7jcxqknmvab@wv2qijzrkql2>
 <20240814192345.GI5774@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240814192345.GI5774@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: MW4PR03CA0172.namprd03.prod.outlook.com
 (2603:10b6:303:8d::27) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB7562:EE_
X-MS-Office365-Filtering-Correlation-Id: d8157a9f-6e73-4a8d-796d-08dcbd322074
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?siJvZHwSDQ3eYf8tXaR2hmq7LKAfGYv+gAr8do56Tno4nQlpsM8X+AxcPZJb?=
 =?us-ascii?Q?vR6H7vJCQDzsy8QLdQt4vO/dZ/tHmJwax1nzzVSPUk0EQdCUj199ws5Mz7C4?=
 =?us-ascii?Q?QbenXKlBJlU15haSWbG0JAA7Rwxp+XxuXPSWVp4/j4HTbJrGSeuokqfPJxrL?=
 =?us-ascii?Q?KWWs4M1qtJNqY0Ze1rBGh5Rz5/nwoUHBLh5y7sackiiEBeX8Pyql+a7+nZ2N?=
 =?us-ascii?Q?hEKRp4XsHOpNuOkKFDbWe0Xc7SwiQyVZWIYwCPcWjvKmy8Nrniaw98LJoPNd?=
 =?us-ascii?Q?7F8jmhcTELSwfmu1mSCS2ecqgRgXmzkREKQ9s38SYuGYiOIlFNToqqbTZXKQ?=
 =?us-ascii?Q?DequtJ4VYfFxCtfQmNwV0bKosFYgLGIyPHZxjGQd675Fi8O+yAp5nzkulg6S?=
 =?us-ascii?Q?ii3wVb5DVeoELCy0CAY7hK4bP+0qxVEWTcAtmLDlBdC094PEgZfepZ+uclFU?=
 =?us-ascii?Q?SnZoBp0WgVawQE+YBxXd4W5e9C48dVi+jHND6FZKMF+Q1V8YMToT48XTzx69?=
 =?us-ascii?Q?py4MMIj3LdK4b0dp3zMOxo2x6MZhMX+WzPNBo8CrbXMY4Qi/O0nqKKmM4WPI?=
 =?us-ascii?Q?fLTikcX2B0NPYn1w4dX7/1MU4dVHQ9GJHHFylqwjSyhQYvSrrW+3nEcTXmVw?=
 =?us-ascii?Q?Z59SRke+/hZWewtqGmEIMrSOnFWFqWz1btDGy0dEXAHdCZptTCW/ZzZ+CUeB?=
 =?us-ascii?Q?CvA8PBVfbJW6AxFRqNPNpSjezgsfBNgNGaTF8UOACfp5K19ORIWj4P+vNZaE?=
 =?us-ascii?Q?wXFs92xpdPaRGOAi+PnVKGKmaO/Y19WNR5WCf12Us8IYNpTbAM2NGBXFjw3C?=
 =?us-ascii?Q?7wZ/6pqYoQbNII7WvaneZdzPXA2xuWmciBIXr1vsAUHehy06ajcQSViDrztv?=
 =?us-ascii?Q?FmMHYWYxM/aeT6XVwJxr+vectBzdyIlLlX3IPA0A58NUvLFZ0BDu8Pad5vog?=
 =?us-ascii?Q?lq3jGx6o2EyzejRjXhvOc1qR5pIHEiCliKFaWz+gO+lUzHmGMbyCaKioyb/c?=
 =?us-ascii?Q?HQ+D4XbgQblH3l7QFwiVos8O93b8PIsZxK0AxdFaeVAPfGdzXMYUhIcp3VaF?=
 =?us-ascii?Q?5Lx52Pchz4TCtTxHGVv2FK8BGZlcph4HvSI9y+vCKiwqvzEsBWgL8RCseeDI?=
 =?us-ascii?Q?WmoYV0NAKf1E33t3kVBdXRUUYSIU53H4EeOzQfBzm9D5hIY1vom7AhtGHm8t?=
 =?us-ascii?Q?k9Q/NO65ZxYp2YvjivtYwMg0LBLufOSzwu9N8FKNiyaBXo4NrZy+7U9t8zNM?=
 =?us-ascii?Q?KZZWOywxEdRsK5XH+F6+zGsk8PYryxPaFzplNhHYmEq4zVAm90EjXZu0zkpK?=
 =?us-ascii?Q?ogzq9XcGM6vRbMdVV2ZCnvLFlt2oRrA/whLrSxMB6wrSgQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QDkNjl0eHC0DcGCqsFTvsEMZXMWf2cVqNE4wmS3Gn/PfjemdbUY/+K0cdqSH?=
 =?us-ascii?Q?0EuO5cUXdeCF9sZfZmiWpuSUyqx5XXq43q7uenVHkmdgVy1IDXtga02Eb62j?=
 =?us-ascii?Q?cyBWKIgxeL8vVvy2cQio+Gf28EeYyCMQGi8jiR2x9sguTDLzkfldmXbPCRld?=
 =?us-ascii?Q?NrrH3wU36P99Tw57d9kjos13ssaOYGAQ2FhCOpb+0vHC5lvCzmjWuxyQoEDZ?=
 =?us-ascii?Q?mlnqVLLOXWYX5KsCdqtaDYTHvFzqz3jF51pBp3j/FRt8ii05IMipd/Z0CAC1?=
 =?us-ascii?Q?wlYCG/Ay8D8yVtYChPKeb4qTj/PFEpahwc0yh9yqeffGIhqpxQdIJN2HmPy6?=
 =?us-ascii?Q?xNIcdp0G3zz10SKZShRnSrbo4N/KIRXe8ip4O9gruyktwhIf3lG9f7eMxN4O?=
 =?us-ascii?Q?4s7TyKRUXB9nQdeeGKDd4SPQUEv0ua/G0r7ZaC3LLAt8F5c1jQQ/M5uxUJtP?=
 =?us-ascii?Q?Zq952tUM+4rZWRdoM7Odb4jNCKm9MACyFhNVRUepiqFEDbY1+XQuOF7Zd7LJ?=
 =?us-ascii?Q?Par4gDz4MznOpmp3m+zu4ZzjZX/H4tgnEvxbvSRE1rJtTBmPJ6pqvZUw+Yrq?=
 =?us-ascii?Q?sQYwoQOT38LrOfH9nvdjdcOrLNi3ukiwY/2KFe1Amv9WcVXLNhX5xcUB4qy3?=
 =?us-ascii?Q?eqR0pUvYF8Mc6n6bKSDeiLv5ds6PtxfVJbYanBeahzf2mqPkGZcuoxQiNOEL?=
 =?us-ascii?Q?5ud0iN1n38LaEC8NPxXfFV0jMqmi394RH1DLIyoTzo9lpSxTlK1HBmHET0jG?=
 =?us-ascii?Q?vtoZD10NlnMKUid11AimoPwzANrQNpqi+zZ1D7PPNU+hvtotvqqZkdOXez/R?=
 =?us-ascii?Q?ItaiTBkxeIBea6Eua5sbkvgWsLaNAzg6cAIyuU34mNrAC5N2V29KTBlgV6Ch?=
 =?us-ascii?Q?au7v9Vn5u7/3x5fu2YZyOK8DeXmSmABr6fMoeimuVf81+Jh1owJdrugE8OeL?=
 =?us-ascii?Q?RDNd2it+2N5Y6nnhoDtSoGvF5Zk/5LonYws2zIWuNWcIYW4waxnfMUhGOts2?=
 =?us-ascii?Q?/eBWRfiG8G0N0uNUZcT5HDd9sun3K06W2Xoy5hElHiLoGQJIdWZ02iERb1qT?=
 =?us-ascii?Q?cjynXuEWztkCAwzJAlqe01Lz93AumWWuQJ6OAlzaYvpmwRZ6R3NPP/2W9BCc?=
 =?us-ascii?Q?XJycShtzG/4ngdAUszry1Bh9UE35oYE0woYymfdEf5eXxpdMGov3Gh3cLRCm?=
 =?us-ascii?Q?H5gSK61Aa2fx7mhkRkYQvgGREVWLmrV1b5+RAac0AidDsav1LHobItCTZC3W?=
 =?us-ascii?Q?hqN6CA2jm/j7H/dJknEnuM8pO2wZY/UZvt/Q1+h0FiXaHB9dqqOXL6kdLe4+?=
 =?us-ascii?Q?tOeTvrK1CUQ9vLs7KUmm8UJ6x/xsMjnKAnJUr5QLWVU8R82lICWhGmSwEl5u?=
 =?us-ascii?Q?u4VZpB+vwgRCm1vlzlIy6GK2bNF4eXJuomm+VX26l0UAWdLBeUFkINHLmB1j?=
 =?us-ascii?Q?PA8AxD+Vk9wcI1xDn0OIV/rZhcLxExgfpad4UrNjKMALC3J8iEMbOEze1Mf5?=
 =?us-ascii?Q?TqkWbqRt2xT7bMLz6SB8dJZMKvqfH5cWh5gn/lY+zBEFPMO6crk3O/8OQivf?=
 =?us-ascii?Q?qOPUgv6qTccYQ5PPEkaUAvm1jR744sWqOoOHSx1nb7l5RXbLBJtB3RareMmO?=
 =?us-ascii?Q?KQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d8157a9f-6e73-4a8d-796d-08dcbd322074
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2024 13:56:57.2004 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zyYRUyXkb7X4XmcUtuap8DStbURVE/xpMuKZSRbhfElPtDmDkhsGYWC5+A5eDjbZfyT1jsH/9qqmqng75v0ANM79aCZBI5k6l6QyveWjn+E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7562
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

On Wed, Aug 14, 2024 at 12:23:45PM GMT, Matt Roper wrote:
>On Wed, Aug 14, 2024 at 11:34:21AM -0500, Lucas De Marchi wrote:
>> On Wed, Aug 14, 2024 at 03:26:12PM GMT, Tejas Upadhyay wrote:
>> > enable host l2 VRAM is reading MCR register thus
>> > should be moved after MCR init is done.
>>
>> This commit message skips a lot of the details on what was discussed in
>> the other thread. Let's improve it and for future please be more verbose
>> in your commit messages. Suggestion:
>>
>> 	xe_gt_enable_host_l2_vram() is reading the XE2_GAMREQSTRM_CTRL register
>> 	that is currently missing the MCR annotation. However, just adding the
>> 	annotation doesn't work as this function is called before MCR handling
>> 	is initialized in xe_gt_mcr_init().
>>
>> 	xe_gt_enable_host_l2_vram() is used to implement WA 16023588340 that
>> 	needs to be done as early as possible during initialization in order
>> 	to be effective since the MMIO writes impact it. In the failure
>> 	scenario, driver would simply not be able to bind sucesfully.
>>
>> 	Moving xe_gt_enable_host_l2_vram() later, after MCR initialization is
>> 	done, only incurs a few additional HW accesses, particularly when
>> 	loading GuC for hwconfig. Binding/unbinding the driver 100 times in
>> 	BMG still works so it should be ok to start handling the WA a little
>> 	bit later. This is sufficient to allow adding the MCR annotation to
>> 	XE2_GAMREQSTRM_CTRL.
>>
>> >
>> > V2(Matt):
>> > - Reword commit message
>> > V1(Lucas):
>> > - Reorder patch and reorder flow of L2 VRAM enable
>> >
>> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>>
>> Matt Roper / Matthew Auld, do the paragraphs above capture
>> correctly the discussion we had in the previous version?
>
>Yeah, that expanded description looks good to me.  With that,
>
>        Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

pushed to drm-xe-next, thanks

Lucas De Marchi
