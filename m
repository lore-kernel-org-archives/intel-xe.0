Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 567B9C3DA7F
	for <intel-xe@archiver.kernel.org>; Wed,  7 Aug 2024 08:19:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20A9089F08;
	Wed,  7 Aug 2024 08:19:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aPfqMSk0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50FD189F08
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Aug 2024 08:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723018753; x=1754554753;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=emPkZ9cGePtx/PZpJ2cO7/aBiWa+vfUbOvm0IBJp8WE=;
 b=aPfqMSk0S8a7RY84YA6wRoZQWwjDW0SyZjpWoVrETIwdoOu+q5e9Wj2x
 /vEAlClo4SRlMP7MwTFyb6/eaLAEy4YRM4RdadvRJ/a3px7omRt+x0zsX
 VD2DTe6M3VviDakrZYFnHxD4tOu7A+DGLI76RNrem0E36vUfwJK9r5GtU
 QPZSUBnaP+wBrJieGv0Js0DNRdS2JzO+94IrRjy1k12TuOm/QeZbhhP++
 0rz5gL9nqoWmw6flnvjqLgN5fKQcuqGasdQufLEbbcEi2RbGFtahDAANA
 YsuJVxBppzi9BVi5mjojCKnbs7XdfXvP/msK0yv55luUbFXJ5+JOYj17H Q==;
X-CSE-ConnectionGUID: rKskh6WPQ+e2s62QkN3dLg==
X-CSE-MsgGUID: 6Ypb6e1lSAaAvMun4b9Cxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="21046876"
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; d="scan'208";a="21046876"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 01:19:12 -0700
X-CSE-ConnectionGUID: QGd7zE/4T9qOjoRS7gz78Q==
X-CSE-MsgGUID: JneqsQNMQpK4BewhT9hcsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; d="scan'208";a="57467258"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Aug 2024 01:19:08 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 7 Aug 2024 01:19:07 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 7 Aug 2024 01:19:07 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 7 Aug 2024 01:19:07 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 7 Aug 2024 01:19:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TiHI+kSYmTaFlfUPq6fSNykI6OgWzcfWKBaHFGTkvyZO29n977RG9/I53hUxnK+M5S42hPdsbYz0b8x7Jd6H+aBX4t0jYaoAPkJYlA1HVCVmneKmaGWMIlThjo3vNTRtUvVfXQaL1cHDemDT1FvGcD9aKy61gzSLRkVjuecvSOPHZqMe22OftFma+GuAa+QnXUf/fIvrlomai6z5ee7Xcuw4374MKK7+PTWzfInBwILAOp9BfTb/AIgwMdkRAdDcEdZJtw68A+walkpuz6GinaTycIwu1+wGhBceOaIxaFWRttd4qfhbFjmLOwixaTYzmH/kCF7Df/Lmg1bj61WfYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bILaTtEFuU9n8T5ni7sxSKKk0P3Eg6QGNr1+v8UQfu4=;
 b=YejaX/ISgy6EqSFD+ex1f3MV3Ku63XQQfptQwMOJMz518Yu91sl5WaQjVp4KL7SPV8Oy8xBCTrWLbZBickizIKf0lfQBFq+U982GC9Q67xytgb9UIRKJZpklyLNcBDjv3S8iOuder9YkQEFMZESIcI3MWz4dYGiLz5WYbazfz6t8AppgwhKInxG7z6rYc/6XrM+uiilitXwjoXByy+PFYGanHQCsqanq2xxdY1Mc1zDhHyj0e6KR8ACstbYKg2VCA6cq5fvpyCEtN0f4TcPE+HOirIRqC5WkMXVmUMXnYJAye9tySEgg+MtYq7K+hTY7OdDeESKv1duFIAxcvM+VSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 MW4PR11MB5935.namprd11.prod.outlook.com (2603:10b6:303:18a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Wed, 7 Aug
 2024 08:19:05 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347%5]) with mapi id 15.20.7828.023; Wed, 7 Aug 2024
 08:19:05 +0000
Message-ID: <683f673d-64fc-4714-b623-89332444a509@intel.com>
Date: Wed, 7 Aug 2024 10:19:00 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/gt: Add APIs for printing stats over debugfs
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>
References: <20240806194510.13044-1-nirmoy.das@intel.com>
 <2a369a01-a793-424f-8e14-7776462f213b@intel.com>
 <67783dc0-6e81-4e6b-923b-5012c212176d@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <67783dc0-6e81-4e6b-923b-5012c212176d@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ZR2P278CA0063.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:52::7) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|MW4PR11MB5935:EE_
X-MS-Office365-Filtering-Correlation-Id: c88a1207-acb2-4fa7-0a8d-08dcb6b999f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OFo4SEhVbm1rOVgwVVdGQUtGWW1tUjg3THBpanNmbzVxS2hVSjE3b0c4NGxK?=
 =?utf-8?B?NDRVVDFLQnJ0TmdmUW10MGhJeHJXN0FiYW9RSW01VDUzVEJiNEV1SUh2NlpX?=
 =?utf-8?B?Z2hZZXNjVlI0cGxZMlBvcmtlQVNtMENWUUc2Wld2VEhFVlFQdmllNnVLYzk2?=
 =?utf-8?B?eEU3cnc0a2p5bS90VDlLeEZpSUNpN1dQM01VNkRPM1hVamxCSGdsUVh3OEdD?=
 =?utf-8?B?bThheFVxV1RFMDRZdmU4SDhCd1RwRzFnaWtkOGdvL040bDFGZmEwdVpqZ3p3?=
 =?utf-8?B?UzRQWFZ6UHhrVitEYnVxWWFHWTd4NXY2NTJydWtLU1prWmFjUkdjbm5mbnN0?=
 =?utf-8?B?Tml2WWVaRmlMaXd1blhuUVIrSGtBYy96WWxicnhaVGVBZlp5bHhjbGVXZEZu?=
 =?utf-8?B?a1MvWFdpN2hURjBHL21oTHpQMDBjdjVtZkRzck5CYWNlT1lIQm9QaVJ0aTZt?=
 =?utf-8?B?M3BHOHhQdTZsQUdXazFFa09lSVMvUXYzbXRlTjIySGd6SmdGZ09Dc1c5V0p3?=
 =?utf-8?B?bWd5VE9jWFR6clB5MFZiSTRBd2xxOEhGWVpWUnNuVjBjWk8vazU3eUZpblRU?=
 =?utf-8?B?SWpHelFiVlNra1JVR0wxRUd2Z1NHNGFlZ2xMak1QSWIrQVp4Q1NDRjR6RFJz?=
 =?utf-8?B?QS9xNjdGdUxXZFM5UGhqT3J5VTNDVzhWd2ExU3hQM0dhQ3d5bVN6ZE40c0xI?=
 =?utf-8?B?NElqQ2xXWlZGcXlhZHFEd28zcG1xUkcvWHBUV2phVEpDU2xWNkM0Qm5ZYVRq?=
 =?utf-8?B?Y0hCWDVOVkhLbm5nanpGSG1wU3g0VnhXVzY5VDdVdCtURHQ5QUk0Sy9aZ3FO?=
 =?utf-8?B?Y0xrL1hzWGh4VHFQUVk5SlYrYWE0cVdtS3JLaEdpUE9CN05JSDM5T1FqcHJY?=
 =?utf-8?B?UmUrUmVaZ2ZGSUJzY2M0SmVha3V1UitzVXpDMFdHWW1jN2Y4c1BnTWdiYzRY?=
 =?utf-8?B?ZTBTQiswaktnbVZaUDBxWWI3R0tkV1pyYmF1MW9wa21mcjlQZSt6SCtIbWwy?=
 =?utf-8?B?V1R0VWFXZkhQZy93QVA1OGF4cnhqa1Y2ODZUR05ONFBWVk9hbEpzV3Z6Q01M?=
 =?utf-8?B?ZzdNNktLZzFuWHZjM080UkdZNmZsai9JN3RDZWlCLzg0aU1Qd2ppdVBKZzU2?=
 =?utf-8?B?eGJsYTRQdkd6RDhaNXpoRmNYRnRuNzZ0MlR1cU9XdUdCQ3Z2ckN0aHVSTnZE?=
 =?utf-8?B?Z1I3aCt5Mk9mSzZLYTZ6VVk0c0xpOEpyNFlPbHI1RDF6TGxIWmxTOE53TmFI?=
 =?utf-8?B?c2FueXUxZnpvVm54NTNIMVNpT2lDZnUyV3NiUmxCanJMamJ0VFVNZktqQjRq?=
 =?utf-8?B?aEllMnBHY2psbEFKbis0ZG5KN1lVZ05SL3hWYVcxZEhRZmZYbFBSNFBKazRm?=
 =?utf-8?B?NWloNlJuUlRpK1Vqd01pMDh5LytzNnJ6SUdUeENrU2lPdFVOamJyR25VUUVD?=
 =?utf-8?B?c2tpenArMUZvcVJJSnVNU3pGdUJPZTdVUVFaQTF2N2k3cnpWQ2NaczR0RGUx?=
 =?utf-8?B?UUJZM0dYcTdueVBrUTFmYitLcDNVcWt1blJvczlBVkJTZVVBeUQzQ1VuQXU3?=
 =?utf-8?B?QmFrZjJUK0R3SmI2TG5hSzdPSWY1cEhWMFN3Z25FbWVEVjlVRkdSTEJvMkRU?=
 =?utf-8?B?TURoMWVlQkFFQ0Z3d0ZJWVNuL3lEVk5EdkVGZ1ZCeWIyak9iVFh4VmpLQnN6?=
 =?utf-8?B?T3MrbDZXTURDeWQzVGdjb0Zpbkw3STF2MGNaRDJIN3ZlTjBnblEwazlQZElT?=
 =?utf-8?B?R2wzcjZHWVp5c0pVKytNNGVOYnZIc2N1eUxBU0I0My91RVZYeHNlNW1DTXEr?=
 =?utf-8?B?QjE3SXBZTWcremhKMEhhdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OE5nOGRWUzduS0FqNkdGQVJGdDJIRmlsSHNZRVRNUFZuZnZkZnZFNERIa21r?=
 =?utf-8?B?cnhuUlFCdkxBY0paeVJvckdncytReU1UKzczUGxuSWtUaUFWenJFZTFmMGRW?=
 =?utf-8?B?UFdGSWtSbjZMc09PTnpyN1RNbmNnYWtoM0RxdEJXMXNVUENQMW1RY1BSYWYw?=
 =?utf-8?B?Qi94REZwREVGeGNXWlA1U2VKUUNQR080RFBaVFNjTC9LRVJTSlJsMzlxWGdP?=
 =?utf-8?B?Mk1wdG9QdDY2ZVZYTVovelVML0ErY3VxS1EzWVdFYk5ydFA2YmZTRkE2SlBC?=
 =?utf-8?B?OVJrU2dQRDFLSVgySE80NUM1VlpYNGw5OHBWTXRCbFBBdFV3dlUrQzFKbjVF?=
 =?utf-8?B?TXRzS1hoRlJ6dzgxMlpsMzFxcGtMVThxRXFJeFVyM0dvU2h5VHl0V2tHYWhk?=
 =?utf-8?B?U1dQMU9maVRVMFU5MU1kdDdqZnZCdExNRXdjZDhIak05ZHFQK09hcTAwc1Zu?=
 =?utf-8?B?NTNJcm1xV2ZHUHN2TGNrRjFVRlcydisyT21nUUErRWJ1Y3pHc3dUYldDZThM?=
 =?utf-8?B?cW5UZnYwWVlEaFJnM1hwWEdkeHJWZ1F1dVYydHlpQWoyckVpTEFuRVJkQmYx?=
 =?utf-8?B?RExBRHdEVm93RGE1TDMySVRzTG9zanoxNEpCdzdQK3FkeURFMFYzQUhZeXVH?=
 =?utf-8?B?TmFsS2Z5TWxDRERZMk56T0xyNkRFakVXSjdHM0xIUXBRQmdIZDRHQ0NJMlVK?=
 =?utf-8?B?T1FhUUdMOW1nR1RLN2pHbzU2ejlnNDhHTEtZZ0d5eldtM3QwY1F0S3Y0T3c2?=
 =?utf-8?B?UnJMSDRwREoxeXBwRm5UT0JQRDdCeUZ6bURRV3VZRllFVGIyUFdQeWprUmZG?=
 =?utf-8?B?V3ErajQyV0xYTW9qOW9jdmlFejg0czZvZGpYa0FDc1pSYklXYXpFWjZOWGM5?=
 =?utf-8?B?blZxaXFnZlo3cmg0RTQxS0tRWlUveTNQcitOZERqaWJ1V1oxbUxhTVJ1bFE5?=
 =?utf-8?B?NHNmMkNkREhLSERGODEzVklOYlpJQlgxNm9oSCtXeXZFSHRhLzNYb1pQKzg0?=
 =?utf-8?B?Vk5aZnJqV2VsZkd6SSs0THQ3NWVZNHpxN3RzVC9qYU9LZGtJdklkSFhsQkpJ?=
 =?utf-8?B?RXV6U2hHZTc0emRtQ05YL0NJQ1lMd3JCbnBFd3VSQWFNOElqdUpzOENxR2Vw?=
 =?utf-8?B?ajVjRWpPRm0wRjBsTXN1dXljd0plYlI4NVdPTGM3SzI4SDE1N0YrU2tTWURB?=
 =?utf-8?B?c3ZBRnFPQmE4SnEyUzh4ZXN4b1hqQ0d4UGtPakY5U1U4WnIvWGgza1ZieFZy?=
 =?utf-8?B?VlVLRWFyMzBOR2pjalI3MFh3VXZETXR5WExtYlRCTmNlWFovSWhJSzdXNWdY?=
 =?utf-8?B?OHZESDNHT2FOZDJIZ3E2WU50bG1YUHBmS21Sb3oxWFRaZWtVdTdqQ0NYVm81?=
 =?utf-8?B?V3NkTXdiaThmZkpEazdmZU1mQUoyZFArdk1IcURTUE1UUkg1QW1ETFJvYWNK?=
 =?utf-8?B?REZFZmIwazUvN2Y4N2dhQU5rQlViSEVJbTdHNU5DUCtrQnd5WkxVVFF5bkI1?=
 =?utf-8?B?OWVVZDRIekdxZTdjeEp2bE9NekhlcVNmTE5HVEtlL3VRYjRhaGJpZzBmTGhr?=
 =?utf-8?B?WW5GSUlHM3dvWWxvcnJ1VEZpNUhNeTNoK0phT3d4TEdRczBkenhlY29IMzA0?=
 =?utf-8?B?d3JycEFaN0xwZHVTdkpaK25MWTdBYnZZWlNocVljaHpPaHdUaFpSSlBTdCtl?=
 =?utf-8?B?QUFnMktNRWhhZGx3aXdDb2VSZTZjM2grdDh5bW9aUms2QlJCd0d3VzN1TjhP?=
 =?utf-8?B?ZEpDSkRDSHdnQVV2dDkraGgwdTM3VUF3Smo3a3RZQ0RSa0puVUU1MkJBVVFO?=
 =?utf-8?B?V1QzUkdodzZ6UzJ1OVZXMUpqejVreTQ0anNmeHF2R1lIMlNuaHF1a0E1MHFy?=
 =?utf-8?B?eUtsMXlETm1pK3RZZHV0QlNITHlnTk5abW5vVXFLNHVMY090bi9KeXhKTlhl?=
 =?utf-8?B?QzZpWExPWWRWNFY5eldRUWdSWjF6eHpDYlJCK3o1Q3ZSY212U3JPbm9zZTZT?=
 =?utf-8?B?VnlWenpmVjZQcW0zK1NOeGtGREFxZi9neC91dk9DUmlVT0lHcU1RV2xwWXY2?=
 =?utf-8?B?MWdYSU5SdlNDTUxENXRRcUFuRjJORG1zMTNlckV0cnpCaVk0NmZwd29GK0RQ?=
 =?utf-8?Q?BAEwgTyr7AJofOjOlp2vq4Tk9?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c88a1207-acb2-4fa7-0a8d-08dcb6b999f4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2024 08:19:05.0353 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kYwpOxlbKvNNqJEHrATf88BJVqU3VsSZ28FtRjzdBStvLTkK3CbRhoOPco3HF9W12J2bezEuAoOkOJJQaQpxpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5935
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


On 8/6/2024 11:45 PM, Michal Wajdeczko wrote:
>
> On 06.08.2024 22:08, Nirmoy Das wrote:
>> Looks like send this bit prematurely:
>>
>> On 8/6/2024 9:45 PM, Nirmoy Das wrote:
>>> Add skeleton APIs for recording and printing various stats over
>>> debugfs. This currently only added counter types stats which is backed
>>> by atomic_t and wrapped with CONFIG_DRM_XE_STATS so this can be disabled
>>> on production system.
>>>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/Kconfig.debug   | 11 +++++++++++
>>>    drivers/gpu/drm/xe/Makefile        |  2 ++
>>>    drivers/gpu/drm/xe/xe_gt_debugfs.c |  4 ++++
>>>    drivers/gpu/drm/xe/xe_gt_stats.c   | 30 +++++++++++++++++++++++++++++
>>>    drivers/gpu/drm/xe/xe_gt_stats.h   | 31 ++++++++++++++++++++++++++++++
>>>    drivers/gpu/drm/xe/xe_gt_types.h   |  7 +++++++
>>>    6 files changed, 85 insertions(+)
>>>    create mode 100644 drivers/gpu/drm/xe/xe_gt_stats.c
>>>    create mode 100644 drivers/gpu/drm/xe/xe_gt_stats.h
>>>
>>> diff --git a/drivers/gpu/drm/xe/Kconfig.debug
>>> b/drivers/gpu/drm/xe/Kconfig.debug
>>> index bc177368af6c..4db6d707c1af 100644
>>> --- a/drivers/gpu/drm/xe/Kconfig.debug
>>> +++ b/drivers/gpu/drm/xe/Kconfig.debug
>>> @@ -94,3 +94,14 @@ config DRM_XE_USERPTR_INVAL_INJECT
>>>           Recomended for driver developers only.
>>>         If in doubt, say "N".
>>> +
>>> +config DRM_XE_STATS
>>> +    bool "Enable XE statistics"
>>> +    default n
>>> +    help
>>> +      Choose this option to enable support for collecting and
>>> +      displaying XE statistics as debugfs.
>>> +
>>> +      Recommended for driver developers only.
>>> +
>>> +      If in doubt, say "N".
>>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>>> index 1ff9602a52f6..b0bbb248f644 100644
>>> --- a/drivers/gpu/drm/xe/Makefile
>>> +++ b/drivers/gpu/drm/xe/Makefile
>>> @@ -143,6 +143,8 @@ xe-$(CONFIG_PCI_IOV) += \
>>>        xe_pci_sriov.o \
>>>        xe_sriov_pf.o
>>>    +xe-$(CONFIG_DRM_XE_STATS) += xe_gt_stats.o
>>> +
>>>    # include helpers for tests even when XE is built-in
>>>    ifdef CONFIG_DRM_XE_KUNIT_TEST
>>>    xe-y += tests/xe_kunit_helpers.o
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c
>>> b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>>> index 5e7fd937917a..3765c04919dc 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
>>> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>>> @@ -17,6 +17,7 @@
>>>    #include "xe_gt_mcr.h"
>>>    #include "xe_gt_sriov_pf_debugfs.h"
>>>    #include "xe_gt_sriov_vf_debugfs.h"
>>> +#include "xe_gt_stats.h"
>>>    #include "xe_gt_topology.h"
>>>    #include "xe_hw_engine.h"
>>>    #include "xe_lrc.h"
>>> @@ -286,6 +287,9 @@ static const struct drm_info_list debugfs_list[] = {
>>>        {"default_lrc_bcs", .show = xe_gt_debugfs_simple_show, .data =
>>> bcs_default_lrc},
>>>        {"default_lrc_vcs", .show = xe_gt_debugfs_simple_show, .data =
>>> vcs_default_lrc},
>>>        {"default_lrc_vecs", .show = xe_gt_debugfs_simple_show, .data =
>>> vecs_default_lrc},
>>> +#if IS_ENABLED(CONFIG_DRM_XE_STATS)
>>> +    {"stats", .show = xe_gt_debugfs_simple_show, .data =
>>> xe_gt_stats_print_info},
>>> +#endif
>>>    };
>>>      void xe_gt_debugfs_register(struct xe_gt *gt)
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c
>>> b/drivers/gpu/drm/xe/xe_gt_stats.c
>>> new file mode 100644
>>> index 000000000000..cc69d748e8f6
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/xe/xe_gt_stats.c
>>> @@ -0,0 +1,30 @@
>>> +// SPDX-License-Identifier: MIT
>>> +/*
>>> + * Copyright © 2024 Intel Corporation
>>> + */
>>> +
>>> +#include <linux/atomic.h>
>>> +
>>> +#include "xe_gt.h"
>>> +#include "xe_gt_stats.h"
>>> +
>>> +#ifdef CONFIG_DRM_XE_STATS
> doc is also missing here


Will resend with docs for public functions.

>
>>> +void xe_gt_stats_incr(struct xe_gt *gt, enum xe_gt_counter_stats id,
>>> int incr)
>>> +{
> what if id = STATS_NUM ?
>
>>> +    atomic_add(incr, &gt->stats.counters[id]);
>>> +}
>>> +
>>> +static const char *const stat_description[] = {
>>> +};
>>> +
> and here


Agreed, I should add boundary checks.

>
>>> +int xe_gt_stats_print_info(struct xe_gt *gt, struct drm_printer *p)
>>> +{
>>> +    enum xe_gt_counter_stats id;
>>> +
>>> +    for (id = 0; id < XE_GT_COUNTER_STATS_NUM; ++id)
>>> +        drm_printf(p, "%s: %d\n", stat_description[id],
>>> +               atomic_read(&gt->stats.counters[id]));
>>> +
>>> +    return 0;
>>> +}
>>> +#endif
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_stats.h
>>> b/drivers/gpu/drm/xe/xe_gt_stats.h
>>> new file mode 100644
>>> index 000000000000..e83155ab1fdb
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/xe/xe_gt_stats.h
>>> @@ -0,0 +1,31 @@
>>> +/* SPDX-License-Identifier: MIT */
>>> +/*
>>> + * Copyright © 2024 Intel Corporation
>>> + */
>>> +
>>> +#ifndef _XE_GT_STATS_H_
>>> +#define _XE_GT_STATS_H_
>>> +
>>> +#include <drm/drm_print.h>
>>> +
>>> +struct xe_gt;
>>> +//struct drm_printer;
>> Forgot to remove this.
> actually this forward decl should stay (instead of the full #include above)


Ok, I think in that case I have to move the include to the .c file.

>
>>
>>> +
>>> +enum xe_gt_counter_stats {
> nit: this file is "xe_gt_stats" so type name should follow it:
>
> 	enum xe_gt_stats_id {
>
> same with enumerator names:
>
> 	XE_GT_STATS_ID_TLB_INVAL,
>
>>> +    XE_GT_COUNTER_STATS_NUM,
> hmm, if you really want to count stat ids using this last enumerator
> then make sure that functions that accepts such enum will not accept
> this NUM as index and maybe name it slightly differently than regular IDs:
>
> 	__XE_GT_STATS_NUM_IDS,


I will adjust this series with above suggestions.

>
>
>>> +};
>>> +
>>> +#ifdef CONFIG_DRM_XE_STATS
>>> +int xe_gt_stats_print_info(struct xe_gt *gt, struct drm_printer *p);
>>> +void xe_gt_stats_incr(struct xe_gt *gt, enum xe_gt_counter_stats
>>> stat, int incr);
>>> +#else
>>> +int xe_gt_stats_print_info(struct xe_gt *gt, struct drm_printer *p)
>>> +{
>>> +}
>>> +
>>> +void xe_gt_stats_incr(struct xe_gt *gt, enum xe_gt_counter_stats
>>> stat, int incr)
>>> +{
>>> +}
>>> +
>>> +#endif /* CONFIG_DRM_XE_STATS */
>>> +#endif /* _XE_GT_STATS_H_ */
> IIRC we don't use comments on closing guards


I will recheck and remove if so.


Thanks,

Nirmoy

>
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h
>>> b/drivers/gpu/drm/xe/xe_gt_types.h
>>> index 631928258d71..0ded57b56628 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
>>> @@ -10,6 +10,7 @@
>>>    #include "xe_gt_idle_types.h"
>>>    #include "xe_gt_sriov_pf_types.h"
>>>    #include "xe_gt_sriov_vf_types.h"
>>> +#include "xe_gt_stats.h"
>>>    #include "xe_hw_engine_types.h"
>>>    #include "xe_hw_fence_types.h"
>>>    #include "xe_oa.h"
>>> @@ -133,6 +134,12 @@ struct xe_gt {
>>>            u8 has_indirect_ring_state:1;
>>>        } info;
>>>    +#if IS_ENABLED(CONFIG_DRM_XE_STATS)
>>> +    struct {
>>> +        atomic_t counters[XE_GT_COUNTER_STATS_NUM];
>>> +    } stats;
>>> +#endif
>> I forgot to  add doc here. I will wait for reviews and resend with docs.
>>
>>
>> Regards,
>>
>> Nirmoy
>>
>>> +
>>>        /**
>>>         * @mmio: mmio info for GT.  All GTs within a tile share the same
>>>         * register space, but have their own copy of GSI registers at a
