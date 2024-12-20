Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5E66E7718A
	for <intel-xe@archiver.kernel.org>; Fri, 20 Dec 2024 10:06:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F6D910EF52;
	Fri, 20 Dec 2024 10:06:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LH28DMpE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A843910EF52
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Dec 2024 10:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734689160; x=1766225160;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=eJpBNd69nn8CGc9aKNCj5N+q8u4dIrftK5qw7WNxi4U=;
 b=LH28DMpEHpCx6MZv86ATruaNpKet7UEM7vJ9kZieGJaxqgRoBJcmj51j
 uDM7c/xyxDjV00bnrbD0N7V6DFKRURcsvAC6YagQSrPvk7EMVyQllAhb/
 ubxvhBxhu0IkrjDvnFGu5/WmKMyIGRNuUSjut0zjiHakI7GUYTXhnsYC5
 rsHfqRVkIeFYfsBZrOZ7O//oUn1PNZboVabShS2ahXcdsatsZaql1vibM
 ko6MAqXmAFTVway6H1HtHS2CTNdT4knSanr2NpWjhx6tmNz2seezKA2Av
 s5LerpTMDSOV4B7u63NkAr09X9WCGUgR65yrZWTjd7mDhvJwlxjSbtamc Q==;
X-CSE-ConnectionGUID: IPoyeqZzTMC0UmzgY9Ntkg==
X-CSE-MsgGUID: 9nytPzeGTUeDFBzZyjFxgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="46615459"
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; d="scan'208,217";a="46615459"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 02:05:58 -0800
X-CSE-ConnectionGUID: Ps+lUHviQnCg9j2mWb4V7A==
X-CSE-MsgGUID: 6QXAyOhRQ+uh5CWJqRbjTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208,217";a="99294311"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Dec 2024 02:05:57 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 20 Dec 2024 02:05:56 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 20 Dec 2024 02:05:56 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 20 Dec 2024 02:05:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ptxc+JbLofGrVdzzU0XRI5QFp7YVl9yMRFD3TNx+ldWAAgxG6vAw657oIFSg2Vq9PhUmQgLXV7jl7Bbg+BLj2aRsOhDqYQyDcvpI61wlugJWaTkfR73Jc0higd7f1oCowA6a5ykZ83lxx/TkYYYQygqgoPqnE1yHuhgYKU8x3ASBPwrWZIA40thTfo6HxePW8dAPsVbWzVZGvRNU6pTRWNmimpckhQQYTNUSWqr+O1NLei3Dl3hKU3oQDnYTpHV8sJxNTaBNXmq+OPpqR8J5PiK3LbWkC6iHCpfQ8CcPagErqrwJSlAGeF9RmTq1XVUCerwUTgNBIDBo/d0mxfrBVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VmWkZWqZ1GpebFiS6coyHCsA2hBhGQLby3h5lmrNII8=;
 b=isspQDwfBwwwxP4nwus4LLG6qyY8/1xP5YAiWTh0dk2ZTj7WhOnKsFXTLYt5nnUxesBJNNR5/xvFXkF0pecOvGop5kswI9Xpf3UZSMUGZoQaLq/H5NiAnapkUrhen67t4Bt+hnCwCOYk7OaXEjGc4/wo6nO6AQrVuyKl9Wuu4rrNhD2cRZ8fYM0MUjsP8OeJsERlqQ+sUpey6/hn1GQLJgtZzUJNOFRPsqPUO+d4LJh4ckh2mMggqz0l9cU7rhNx8C3GWk4o8B5fQ+nyGQhUDxFv5PfC4peTBiw+X/p7hHwwvQG9C0vYNaftGcA92+P6dv3x/NgAm9BPkukyNbPhKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6864.namprd11.prod.outlook.com (2603:10b6:303:21b::16)
 by DS0PR11MB8052.namprd11.prod.outlook.com (2603:10b6:8:122::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Fri, 20 Dec
 2024 10:05:37 +0000
Received: from MW4PR11MB6864.namprd11.prod.outlook.com
 ([fe80::6f1c:5fd9:a37f:82d6]) by MW4PR11MB6864.namprd11.prod.outlook.com
 ([fe80::6f1c:5fd9:a37f:82d6%4]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 10:05:37 +0000
Content-Type: multipart/alternative;
 boundary="------------fvfBMSkBfi3WH0Ru0BBe0fSY"
Message-ID: <142f4ce2-b857-4ae9-b1c0-324e12dab86c@intel.com>
Date: Fri, 20 Dec 2024 11:05:33 +0100
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciBkcm0veGU6IGFk?=
 =?UTF-8?Q?ding_wait_helper_for_gt_async_reset_=28rev4=29?=
To: <intel-xe@lists.freedesktop.org>
References: <20241211111727.1481476-1-maciej.patelczyk@intel.com>
 <173446499334.3958402.13327303528541837445@b555e5b46a47>
Content-Language: en-US
From: Maciej Patelczyk <maciej.patelczyk@intel.com>
In-Reply-To: <173446499334.3958402.13327303528541837445@b555e5b46a47>
X-ClientProxiedBy: DU2PR04CA0228.eurprd04.prod.outlook.com
 (2603:10a6:10:2b1::23) To MW4PR11MB6864.namprd11.prod.outlook.com
 (2603:10b6:303:21b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6864:EE_|DS0PR11MB8052:EE_
X-MS-Office365-Filtering-Correlation-Id: bacf2d93-be99-4cea-161a-08dd20ddd984
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bnFJY2F2bC9kcGVuT1BjT2FQRFR6MGFtRHI2cUxCaUcrSVdzcG9SU1JKUk84?=
 =?utf-8?B?QzQvd1RhbkJsQ3FJVHQvREpLOG1oZUdTcWM0M3psTW8ra3B6aldqR3RITHpR?=
 =?utf-8?B?N2hkL2pOZ3NkeXpDWTNuKytvdEszTjFIc2pQTG1RSEJEenFBeHJXb2MrL0hl?=
 =?utf-8?B?NDBGdlZjL3ZHdmVrdjhvV24weWFaYVlxcXVUbVFWWkhNcFdCSldLK1RBTFBu?=
 =?utf-8?B?cS9KVUdjWDBCdEZVRXFhZzRHeFRMbHpiczZ3QTFuQksyTFhWVEYyeWlUdC8v?=
 =?utf-8?B?KzJiS3QzM09Ob2QzRWt3MlpNQmFLOTZTQlh5QkVrbUVyUGQ2dlJndFRyTDNB?=
 =?utf-8?B?YXlZNkFHMWN5K2NmR2RyRC8zcWl2Y25VWTM5eFJUbGQ1UUFBNllaU3VjYWFV?=
 =?utf-8?B?ZGFPUWx1b2VPSS9sY1kvMFRESDlENk5xSHJDSkpDRHl2VGIvYSs0Z3dKMjlo?=
 =?utf-8?B?dXNEZm04K1Q0QVpNQ084aXVUclJEa25uWlZmN2RVdDZFeFJPbFJXdUdKWm95?=
 =?utf-8?B?SHIrZCtUbGJDYmV6ODhST2RPdzVjTHRPMnZlSlBpb2hiSHNVWkpLbG1Vdndu?=
 =?utf-8?B?WFpKdnFPOFpSZDN1YmRVMGNNQVI0cHV3MTVJQTQvaDV5a2tGZTNDUVhmam9s?=
 =?utf-8?B?MTBHWDdlRTB2ekJOelplaklTclM0V2xadkNGMEFFTHE4TUpvK2tLci9jdTFm?=
 =?utf-8?B?UWpZZER6N3FZTEowNEIrNUd0cXJtZ0taa3pEQnZCL2JsUmpjbmY5ZGtFdTUy?=
 =?utf-8?B?bXh4b1lGRHp3VkJxQjQwVVFxYmlWTXhiK21LeWtRS2V4empSMGhLd01GUCtY?=
 =?utf-8?B?L28wZ2EzV2hpWjFaVUsrQVBSbDFpSjF0TGZHdjVkTWpKVDhpWmgzbE9xL2sv?=
 =?utf-8?B?NzJsQldBZ05FTmh0VktoTVJLZDhSbmVQYzNpNE9rcmVtcGV5Smh0TE1UaGpo?=
 =?utf-8?B?SmJ2d3pRQnBoSkF5N3V3T09sQVluVklPR2dodnEzY2UyZ1EySk9qZWJ4V2g1?=
 =?utf-8?B?M2p4c1FiVGF4VFE0aUY5d013SlVsQ3pqLzZsZk9JMTdqZ0wreDRMNk5uT2FF?=
 =?utf-8?B?ZW5vblVxSUhJcnAvb04zOWZHVFFTS0llbHV4MlowQVRlcE95UXIvK0ViY0RR?=
 =?utf-8?B?MFNZQURESFl5eXdHMkpzUFh4RlBpOWhMV2M3ZUNZdzFYOVVzaUNoQUJUUFJ4?=
 =?utf-8?B?TnIzWUdmOXVaSXJMdVlWSitCRTZKNy9QcTZuUjFYYjdwVWkrajE2VFRUKzdP?=
 =?utf-8?B?ZlBBeDdPUDdOOUlRZlg1bXU1cC9CV2xCMlYrWmYzY1Z1aGpKKzNrSmYzYVo4?=
 =?utf-8?B?ZXdWMm5qQnZ4eUdGWVY5OXRIaERIa3o4RDZWYnkrMWwzT081Z0pjdndaZDNS?=
 =?utf-8?B?c1VNbXdJOUYzcHFrQ2x2WW9TYXFFRVYvYUNHUzhMWnZHMmU2REM4cjBONnhm?=
 =?utf-8?B?RjBJNXFKZXhqd1FHYkZ1MSt0QnUwUmhQaWljcERtZlh2WXNPMlhhYk5LUlhI?=
 =?utf-8?B?Mk5DayswcEdIZ0dZREJyT3hraFdRMmNlWFloOU1uZExTV1RhUWJORHJYWjRp?=
 =?utf-8?B?cXNQUGVjNjFwVnEwcllPdWRmaWlDc0NUeUVITzErZkt0K0dyaTBwNzRFdnNZ?=
 =?utf-8?B?WGxvampLbDRjbERrczhvQUgzNDZGRjF0VTNkbE52V20vRkpsYTV4dE5RVkF4?=
 =?utf-8?B?eFZmQWNyVkJ4ZDU1WGRzMGtYZExHM0xCbDFVOUo2N1prUUtFL0E0bTRIWGpE?=
 =?utf-8?B?OVcrbEo3RDc0bzgvbmVjci8vMUkzeUZoM2JTVjdTeEMwbjFTdXA0SzNvRUpY?=
 =?utf-8?B?UjREbkdWMzBnMjJnZHlqQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6864.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SnN6VTBmZEJsVkwrN3p3SGMxYW5GWnpETi9xSkNsbzhiNUxRS01qUWFaSTdx?=
 =?utf-8?B?bW51NUtJNnVJdlBOcWorVGJka0M3bnNlSmcrNXp1bFdCQjYvY0ZHYlZOSVM0?=
 =?utf-8?B?RDl5OHdIU1dweXBzVnZiS2lhU3RZcFBSWjAxNFNzc0JHendsckk2SFZ3eVYw?=
 =?utf-8?B?UVYvN1NGYjY4NGIxT3B1UEF3TlBMOXlxc21uR3ptUDhEd0ZialRqYjVWNU5X?=
 =?utf-8?B?Vjc1ejVwSG9lYldHaWFxZTkxaFkwaHlZVWQ4VFpZVG42clZkdE1waWNlN0VT?=
 =?utf-8?B?c2pFN2hrQXN3UzNTUEhMU2tpU0VETWJoVFpOVDhVNjFHeFU1NTlPSkJIMENH?=
 =?utf-8?B?TjFqcWhlZi9TSzlCanBxZk9RNTBoVFd0YzJtcWxVbDNqdTA1ZjVEbG5WcERJ?=
 =?utf-8?B?WDRNWkRNRlM5N3YxSlF6MEMyeVJXRVFBcHltTEVxTmJrN0oyN3dGbmtyaW9E?=
 =?utf-8?B?VmVNYkY5VnBWT0JUUTdKN3JQU3l0b3QzQ01oL1Z0cEZRM1ZSbmZUamJZWi9Q?=
 =?utf-8?B?K3V3cXpJT3lscHdjUG9YVndjM0hUZ2NKRlBjTjRtM1RZQzhyNUlXMStoTW5n?=
 =?utf-8?B?WEtBMVZCdnduVUJOMitsNG5qRFpWbW1hYTVoS2NVZUR2V3ZwY2sxK0dPa2J5?=
 =?utf-8?B?R0FiVGYzWHV1dFY5ejFRVkRsd0NFbE01ZklVbXI0b0V0bXNGSllSanMvVktv?=
 =?utf-8?B?VXZuSFd2SmhEdGI5TWlnc3BwNitKdlJ3dUJ3eVdTYzBOVWhCR21pMTVaL3Ru?=
 =?utf-8?B?YVRjK3JyMlcxV1ZwZDM1Q3liaHlqUklQTUl2SkUvek9GQVF0TnBPR3FCSTh1?=
 =?utf-8?B?NXpCRXNRdmJnTDQ2eUd1Qlpsdk40WWpxZVkrSE9PMG5UY0tZMGtQLytnaWRr?=
 =?utf-8?B?cGFhY3FhNkFuaUlOS1dQbTNpOTlEK0xRS2RFQU1RVCt0VHB3blVzb2VsNGFC?=
 =?utf-8?B?ZFFuVEtvd3NmdXg5aVlIUnpBWVZSTlhMRjAxS0FvanBQRDA4ZU9kK0JMbjM3?=
 =?utf-8?B?UEZqNlpadkZYMElSaEtLWGlmeTluK1hZbXFGQnFrVW5SRkhvU2xWbnpnUDFx?=
 =?utf-8?B?Mm9CRUlKYXptODZjTW1BaHdZSWNwS0lvOG9pWmpQaURtaHdRd1Q4QjJlbHB5?=
 =?utf-8?B?TDE2MGJ0eUFkTG9jVTc5VFNBRHpkN2pTdXN1Z1h2VjMyVkthNy83TXQ0bzFV?=
 =?utf-8?B?RU1BcTlrRGxHZkUrTG1nYnJlWHlrNmZCOUdHejkyOVovb2haTG1TczFIb1dk?=
 =?utf-8?B?Q1lwSnl2VUp4NjlnWXlGVzl2OW12QTBQaEVJQU5nenFpVGR6eG14STFNakp0?=
 =?utf-8?B?SlFYQzE5TmE5QUtKWFRlemgwc01BeGx0TyttdUxUZk42ek9KMHhxb0JXUEpR?=
 =?utf-8?B?b0taS1YyMXlVWTdtUFBZYzF2UEJzbjJrNzNYb2JJQzdLSFZJMXJveEtGTjlj?=
 =?utf-8?B?TDk1V3hadUxGaFg1bXVTdVc3OEE0QnpTbXBFMEduSjRackJIVzA3Nm9yTE9Z?=
 =?utf-8?B?ejdzV1RNSXo0Yy9rSHFSTDlRK0ZmOVp2eEEwTFRyRmlEVkdyWFNhd1dZMEhU?=
 =?utf-8?B?cTZpKzJ5T3l3L2NNVHVldFV3WkpVV2FKQWg3V0h4eXpxTzFUUXEwZ3E3bERT?=
 =?utf-8?B?MllhOFFSTWRZRnNWa1FOam5jMnFBTU1OcGZIaHNlTHRpSmxRWUl3SHh5T0U4?=
 =?utf-8?B?d3JvRmREOUV2d0tXbVFQM2tuNTB5ZHZPY09VT0grSDlQbUY0dFZWNlZMMGRo?=
 =?utf-8?B?YlpsUDB2Nllid1k1WGZmK3pmRW5IU3djS3J6OW9LdFVYTXpud2t0V0ZuZ3pF?=
 =?utf-8?B?OFZLbkM2VEhYK1o2MWhVMzlRejlIUGE5R2swTXpMeEFWeEVGSDdIZWdQQVA2?=
 =?utf-8?B?VHlJV045WGVjRVp2WDdqam1lQWtuMll4ZVdIV1p3aSt3K3JPVW9Xelh6djRU?=
 =?utf-8?B?Sm16eUdQUktaOVd1bVlBd0VhK1pHakxNb1VxaVV1aEFYV2ZOTzBZanY3Nk1H?=
 =?utf-8?B?aENxcHNQTnQwdlEyT2E1TzJaSThmc1phOHYvL1FEblEwNnBNN0dYWUZyUi9w?=
 =?utf-8?B?czhEV24rdUlqZkdQQWpxOXQrcVB5MjNsZU1qSTdKeGhzcE13Q2MzZ3BmL09S?=
 =?utf-8?B?MmJrT1poMUVJMDdOMUEzcS82SjByNEFJUnVZZWpLUllQN1d3SWFQaGhLOU9Q?=
 =?utf-8?B?cXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bacf2d93-be99-4cea-161a-08dd20ddd984
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6864.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 10:05:37.0739 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jxp2tT/2x29q926+2Pxcld4bM+3IsLP2fblH+/z8a7NW5fLq+eVZjSn7/RQlus2LTlmy95g55/w0swBxuF6n47cgoemEJTJ09rRJJG4RqIk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8052
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

--------------fvfBMSkBfi3WH0Ru0BBe0fSY
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 17.12.2024 20:49, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	drm/xe: adding wait helper for gt async reset (rev4)
> *URL:* 	https://patchwork.freedesktop.org/series/142300/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/index.html
>
>
>   CI Bug Log - changes from
>   xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da_full ->
>   xe-pw-142300v4_full
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with xe-pw-142300v4_full absolutely 
> need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-142300v4_full, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
>
>     Participating hosts (4 -> 4)
>
> No changes in participating hosts
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> xe-pw-142300v4_full:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>  *
>
>     igt@kms_flip@2x-flip-vs-rmfb@bc-hdmi-a6-dp4:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-dg2-464/igt@kms_flip@2x-flip-vs-rmfb@bc-hdmi-a6-dp4.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-dg2-434/igt@kms_flip@2x-flip-vs-rmfb@bc-hdmi-a6-dp4.html>
>         +2 other tests incomplete
>  *
>
>     igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-dp2-hdmi-a3:
>
>       o shard-bmg: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-5/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-dp2-hdmi-a3.html>
>         +1 other test incomplete
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2:
>
>       o shard-bmg: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2.html>
>  *
>
>     igt@kms_flip@modeset-vs-vblank-race-interruptible:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-lnl-1/igt@kms_flip@modeset-vs-vblank-race-interruptible.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-lnl-4/igt@kms_flip@modeset-vs-vblank-race-interruptible.html>
>         +1 other test fail
>  *
>
>     igt@kms_plane_alpha_blend@alpha-basic:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-bmg-5/igt@kms_plane_alpha_blend@alpha-basic.html>
>         -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-1/igt@kms_plane_alpha_blend@alpha-basic.html>
>  *
>
>     igt@kms_rotation_crc@sprite-rotation-180:
>
>       o shard-lnl: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-lnl-8/igt@kms_rotation_crc@sprite-rotation-180.html>
>  *
>
>     igt@xe_drm_fdinfo@virtual-utilization-single-idle:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-adlp-3/igt@xe_drm_fdinfo@virtual-utilization-single-idle.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-adlp-9/igt@xe_drm_fdinfo@virtual-utilization-single-idle.html>
>  *
>
>     igt@xe_exec_fault_mode@many-bindexecqueue-rebind-prefetch:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-bmg-5/igt@xe_exec_fault_mode@many-bindexecqueue-rebind-prefetch.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-1/igt@xe_exec_fault_mode@many-bindexecqueue-rebind-prefetch.html>
>  *
>
>     igt@xe_pm@s2idle-basic:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-bmg-5/igt@xe_pm@s2idle-basic.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-1/igt@xe_pm@s2idle-basic.html>
>
Looking at the results I don't think they are related.

Especially that the only change is for compute.

Maciej





>     Known issues
>
> Here are the changes found in xe-pw-142300v4_full that come from known 
> issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@kms_async_flips@alternate-sync-async-flip:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip.html>
>         (Intel XE#827
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/827>) +1
>         other test fail
>  *
>
>     igt@kms_async_flips@async-flip-with-page-flip-events:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events.html>
>         (Intel XE#324
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) +3
>         other tests dmesg-warn
>  *
>
>     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-lnl-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html>
>         (Intel XE#911
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/911>) +3
>         other tests fail
>  *
>
>     igt@kms_async_flips@crc:
>
>       o shard-dg2-set2: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-dg2-435/igt@kms_async_flips@crc.html>
>         (Intel XE#3781
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3781>) +1
>         other test incomplete
>  *
>
>     igt@kms_async_flips@crc-atomic@pipe-a-dp-2:
>
>       o shard-bmg: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-7/igt@kms_async_flips@crc-atomic@pipe-a-dp-2.html>
>         (Intel XE#3781
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3781>) +1
>         other test incomplete
>  *
>
>     igt@kms_async_flips@invalid-async-flip:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-3/igt@kms_async_flips@invalid-async-flip.html>
>         (Intel XE#873
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/873>)
>  *
>
>     igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-adlp-2/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-adlp-6/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html>
>         (Intel XE#1426
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426>) +1
>         other test fail
>  *
>
>     igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-lnl-5/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-lnl-7/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html>
>         (Intel XE#1426
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426>) +1
>         other test fail
>  *
>
>     igt@kms_big_fb@linear-64bpp-rotate-0:
>
>       o shard-lnl: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-lnl-3/igt@kms_big_fb@linear-64bpp-rotate-0.html>
>         (Intel XE#1725
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1725>)
>  *
>
>     igt@kms_big_fb@x-tiled-8bpp-rotate-90:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-lnl-8/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html>
>         (Intel XE#1407
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407>)
>  *
>
>     igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html>
>         (Intel XE#1231
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231>)
>  *
>
>     igt@kms_big_fb@y-tiled-16bpp-rotate-90:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-lnl-8/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +4
>         other tests skip
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +8
>         other tests skip
>  *
>
>     igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +5
>         other tests skip
>  *
>
>     igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-dg2-435/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html>
>         (Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) +1
>         other test skip
>  *
>
>     igt@kms_bw@linear-tiling-3-displays-3840x2160p:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-7/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html>
>         (Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) +2
>         other tests skip
>  *
>
>     igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-dg2-435/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html>
>         (Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +69
>         other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html>
>         (Intel XE#2907
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907>)
>  *
>
>     igt@kms_ccs@crc-primary-basic-y-tiled-ccs:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-7/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html>
>         (Intel XE#2887
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +6
>         other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2:
>
>       o shard-bmg: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2.html>
>         (Intel XE#3862
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862>)
>  *
>
>     igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html>
>         (Intel XE#3442
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442>)
>  *
>
>     igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html>
>         (Intel XE#3432
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432>)
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html>
>         (Intel XE#1727
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> /
>         Intel XE#3113
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113>)
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html>
>         (Intel XE#1727
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>)
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4.html>
>         (Intel XE#3124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124>)
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-6:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-6.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-6.html>
>         (Intel XE#1727
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> /
>         Intel XE#3113
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113>)
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +19
>         other tests skip
>  *
>
>     igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-lnl-3/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs.html>
>         (Intel XE#2887
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +2
>         other tests skip
>  *
>
>     igt@kms_chamelium_color@gamma:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-3/igt@kms_chamelium_color@gamma.html>
>         (Intel XE#2325
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325>)
>  *
>
>     igt@kms_chamelium_edid@hdmi-mode-timings:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-dg2-464/igt@kms_chamelium_edid@hdmi-mode-timings.html>
>         (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +7
>         other tests skip
>  *
>
>     igt@kms_chamelium_hpd@common-hpd-after-suspend:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-7/igt@kms_chamelium_hpd@common-hpd-after-suspend.html>
>         (Intel XE#2252
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252>) +3
>         other tests skip
>  *
>
>     igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-lnl-6/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html>
>         (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +1
>         other test skip
>  *
>
>     igt@kms_content_protection@content-type-change:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-dg2-435/igt@kms_content_protection@content-type-change.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +4
>         other tests skip
>  *
>
>     igt@kms_cursor_crc@cursor-offscreen-max-size:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-max-size.html>
>         (Intel XE#2320
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320>)
>  *
>
>     igt@kms_cursor_crc@cursor-rapid-movement-64x21:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-lnl-8/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html>
>         (Intel XE#1424
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424>) +1
>         other test skip
>  *
>
>     igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-lnl-8/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html>
>         (Intel XE#309
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/309>) +2
>         other tests skip
>  *
>
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html>
>         (Intel XE#2286
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286>)
>  *
>
>     igt@kms_cursor_legacy@cursora-vs-flipa-toggle:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-adlp-8/igt@kms_cursor_legacy@cursora-vs-flipa-toggle.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-adlp-3/igt@kms_cursor_legacy@cursora-vs-flipa-toggle.html>
>         (Intel XE#2953
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953> /
>         Intel XE#3086
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086>)
>  *
>
>     igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html>
>         (Intel XE#2291
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291>)
>  *
>
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-dg2-435/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html>
>         (Intel XE#323
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/323>)
>  *
>
>     igt@kms_dirtyfb@psr-dirtyfb-ioctl:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-7/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html>
>         (Intel XE#1508
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508>)
>  *
>
>     igt@kms_display_modes@mst-extended-mode-negative:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-3/igt@kms_display_modes@mst-extended-mode-negative.html>
>         (Intel XE#2323
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2323>)
>  *
>
>     igt@kms_dsc@dsc-with-bpc-formats:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-lnl-6/igt@kms_dsc@dsc-with-bpc-formats.html>
>         (Intel XE#2244
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244>)
>  *
>
>     igt@kms_dsc@dsc-with-output-formats:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-6/igt@kms_dsc@dsc-with-output-formats.html>
>         (Intel XE#2244
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244>)
>  *
>
>     igt@kms_feature_discovery@chamelium:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-3/igt@kms_feature_discovery@chamelium.html>
>         (Intel XE#2372
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372>)
>  *
>
>     igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-lnl-3/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html>
>         (Intel XE#1421
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421>) +1
>         other test skip
>  *
>
>     igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html>
>         (Intel XE#2882
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882>)
>  *
>
>     igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html>
>         (Intel XE#3321
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321>)
>  *
>
>     igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:
>
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html>
>         (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) +4
>         other tests fail
>  *
>
>     igt@kms_flip@2x-plain-flip-ts-check-interruptible:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html>
>         (Intel XE#2316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316>)
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank-interruptible:
>
>       o shard-bmg: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html>
>         (Intel XE#2882
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html>
>         (Intel XE#1401
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401> /
>         Intel XE#1745
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html>
>         (Intel XE#1401
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html>
>         (Intel XE#2293
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293> /
>         Intel XE#2380
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html>
>         (Intel XE#2293
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html>
>         (Intel XE#1397
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397> /
>         Intel XE#1745
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745>) +1
>         other test skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode.html>
>         (Intel XE#1397
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397>) +1
>         other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html>
>         (Intel XE#2311
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>) +8
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html>
>         (Intel XE#656
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) +10
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +16
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
>
>       o shard-bmg: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html>
>         (Intel XE#2333
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333>) +5
>         other tests fail
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-tiling-y:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-tiling-y.html>
>         (Intel XE#2352
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +2
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html>
>         (Intel XE#2313
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>) +7
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@plane-fbc-rte:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-7/igt@kms_frontbuffer_tracking@plane-fbc-rte.html>
>         (Intel XE#2350
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350>)
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html>
>         (Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +18
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) +7
>         other tests skip
>  *
>
>     igt@kms_hdr@brightness-with-hdr:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html>
>         (Intel XE#3374
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374> /
>         Intel XE#3544
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544>)
>  *
>
>     igt@kms_joiner@basic-big-joiner:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-dg2-464/igt@kms_joiner@basic-big-joiner.html>
>         (Intel XE#346
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/346>)
>  *
>
>     igt@kms_panel_fitting@legacy:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-7/igt@kms_panel_fitting@legacy.html>
>         (Intel XE#2486
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486>)
>  *
>
>     igt@kms_plane_lowres@tiling-y:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-6/igt@kms_plane_lowres@tiling-y.html>
>         (Intel XE#2393
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393>)
>  *
>
>     igt@kms_plane_lowres@tiling-yf:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-lnl-3/igt@kms_plane_lowres@tiling-yf.html>
>         (Intel XE#599
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/599>)
>  *
>
>     igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-dg2-464/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html>
>         (Intel XE#2763
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +1
>         other test skip
>  *
>
>     igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-dg2-464/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html>
>         (Intel XE#2763
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763>) +2
>         other tests skip
>  *
>
>     igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b.html>
>         (Intel XE#2763
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763>) +4
>         other tests skip
>  *
>
>     igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-lnl-3/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html>
>         (Intel XE#2763
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763>) +7
>         other tests skip
>  *
>
>     igt@kms_pm_backlight@brightness-with-dpms:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-dg2-435/igt@kms_pm_backlight@brightness-with-dpms.html>
>         (Intel XE#2938
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938>)
>  *
>
>     igt@kms_pm_dc@deep-pkgc:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-dg2-464/igt@kms_pm_dc@deep-pkgc.html>
>         (Intel XE#908
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/908>)
>  *
>
>     igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-dg2-464/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html>
>         (Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +4
>         other tests skip
>  *
>
>     igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-lnl-6/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html>
>         (Intel XE#2893
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893>)
>  *
>
>     igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-7/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html>
>         (Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +2
>         other tests skip
>  *
>
>     igt@kms_psr2_su@page_flip-xrgb8888:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-dg2-435/igt@kms_psr2_su@page_flip-xrgb8888.html>
>         (Intel XE#1122
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122>)
>  *
>
>     igt@kms_psr@fbc-psr-primary-page-flip:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-3/igt@kms_psr@fbc-psr-primary-page-flip.html>
>         (Intel XE#2234
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234> /
>         Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850>) +4
>         other tests skip
>  *
>
>     igt@kms_psr@fbc-psr2-no-drrs:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-dg2-464/igt@kms_psr@fbc-psr2-no-drrs.html>
>         (Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850> /
>         Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +6
>         other tests skip
>  *
>
>     igt@kms_rotation_crc@primary-rotation-270:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-dg2-435/igt@kms_rotation_crc@primary-rotation-270.html>
>         (Intel XE#3414
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414>) +1
>         other test skip
>  *
>
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html>
>         (Intel XE#2330
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330>)
>  *
>
>     igt@kms_rotation_crc@sprite-rotation-270:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-lnl-3/igt@kms_rotation_crc@sprite-rotation-270.html>
>         (Intel XE#3414
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414>)
>  *
>
>     igt@kms_tv_load_detect@load-detect:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-3/igt@kms_tv_load_detect@load-detect.html>
>         (Intel XE#2450
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450>)
>  *
>
>     igt@kms_vblank@ts-continuation-suspend@pipe-d-dp-2:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-bmg-4/igt@kms_vblank@ts-continuation-suspend@pipe-d-dp-2.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-8/igt@kms_vblank@ts-continuation-suspend@pipe-d-dp-2.html>
>         (Intel XE#3864
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3864>)
>  *
>
>     igt@kms_vrr@cmrr:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-dg2-435/igt@kms_vrr@cmrr.html>
>         (Intel XE#2168
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168>)
>  *
>
>     igt@kms_vrr@seamless-rr-switch-virtual:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-7/igt@kms_vrr@seamless-rr-switch-virtual.html>
>         (Intel XE#1499
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499>)
>  *
>
>     igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-lnl-6/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html>
>         (Intel XE#1091
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091> /
>         Intel XE#2849
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849>)
>  *
>
>     igt@xe_ccs@suspend-resume:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-dg2-435/igt@xe_ccs@suspend-resume.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-dg2-433/igt@xe_ccs@suspend-resume.html>
>         (Intel XE#1616
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616>)
>  *
>
>     igt@xe_compute_preempt@compute-preempt-many:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-dg2-435/igt@xe_compute_preempt@compute-preempt-many.html>
>         (Intel XE#1280
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +1
>         other test skip
>  *
>
>     igt@xe_copy_basic@mem-set-linear-0xfffe:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0xfffe.html>
>         (Intel XE#1126
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126>)
>  *
>
>     igt@xe_eudebug@read-metadata:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-7/igt@xe_eudebug@read-metadata.html>
>         (Intel XE#2905
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905>) +3
>         other tests skip
>  *
>
>     igt@xe_eudebug_online@interrupt-other-debuggable:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-dg2-464/igt@xe_eudebug_online@interrupt-other-debuggable.html>
>         (Intel XE#2905
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905>) +5
>         other tests skip
>  *
>
>     igt@xe_evict@evict-beng-large-cm:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-lnl-6/igt@xe_evict@evict-beng-large-cm.html>
>         (Intel XE#688
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>) +3
>         other tests skip
>  *
>
>     igt@xe_evict@evict-beng-mixed-many-threads-small:
>
>       o shard-bmg: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-3/igt@xe_evict@evict-beng-mixed-many-threads-small.html>
>         (Intel XE#1473
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>)
>  *
>
>     igt@xe_evict@evict-mixed-many-threads-large:
>
>       o shard-dg2-set2: NOTRUN -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-large.html>
>         (Intel XE#1473
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>)
>  *
>
>     igt@xe_exec_basic@multigpu-no-exec-basic:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-lnl-3/igt@xe_exec_basic@multigpu-no-exec-basic.html>
>         (Intel XE#1392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) +1
>         other test skip
>  *
>
>     igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-3/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html>
>         (Intel XE#2322
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322>) +2
>         other tests skip
>  *
>
>     igt@xe_exec_fault_mode@twice-userptr-prefetch:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-dg2-435/igt@xe_exec_fault_mode@twice-userptr-prefetch.html>
>         (Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +14
>         other tests skip
>  *
>
>     igt@xe_exec_sip_eudebug@breakpoint-writesip:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-lnl-3/igt@xe_exec_sip_eudebug@breakpoint-writesip.html>
>         (Intel XE#2905
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905>) +2
>         other tests skip
>  *
>
>     igt@xe_live_ktest@xe_dma_buf:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-bmg-6/igt@xe_live_ktest@xe_dma_buf.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-6/igt@xe_live_ktest@xe_dma_buf.html>
>         (Intel XE#1192
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192>)
>  *
>
>     igt@xe_live_ktest@xe_eudebug:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-lnl-3/igt@xe_live_ktest@xe_eudebug.html>
>         (Intel XE#2833
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833>)
>  *
>
>     igt@xe_live_ktest@xe_migrate:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-lnl-2/igt@xe_live_ktest@xe_migrate.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-lnl-3/igt@xe_live_ktest@xe_migrate.html>
>         (Intel XE#1192
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192>)
>  *
>
>     igt@xe_mmap@small-bar:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-dg2-464/igt@xe_mmap@small-bar.html>
>         (Intel XE#512
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/512>)
>  *
>
>     igt@xe_oa@polling-small-buf:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-dg2-464/igt@xe_oa@polling-small-buf.html>
>         (Intel XE#2541
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541> /
>         Intel XE#3573
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573>) +4
>         other tests skip
>  *
>
>     igt@xe_pm@d3cold-mmap-vram:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-7/igt@xe_pm@d3cold-mmap-vram.html>
>         (Intel XE#2284
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284>) +1
>         other test skip
>  *
>
>     igt@xe_pm@s3-vm-bind-unbind-all:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-bmg-7/igt@xe_pm@s3-vm-bind-unbind-all.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-2/igt@xe_pm@s3-vm-bind-unbind-all.html>
>         (Intel XE#569
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/569>)
>  *
>
>     igt@xe_query@multigpu-query-config:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-3/igt@xe_query@multigpu-query-config.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +1
>         other test skip
>  *
>
>     igt@xe_query@multigpu-query-mem-usage:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-dg2-464/igt@xe_query@multigpu-query-mem-usage.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +2
>         other tests skip
>  *
>
>     igt@xe_wedged@basic-wedged:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-adlp-8/igt@xe_wedged@basic-wedged.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-adlp-3/igt@xe_wedged@basic-wedged.html>
>         (Intel XE#3086
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086>)
>
>
>         Possible fixes
>
>  *
>
>     igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-1:
>
>       o shard-adlp: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-adlp-9/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-1.html>
>         (Intel XE#1033
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> /
>         Intel XE#1727
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-1.html>
>  *
>
>     igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-hdmi-a-1:
>
>       o shard-adlp: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-adlp-9/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-hdmi-a-1.html>
>         (Intel XE#1033
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> /
>         Intel XE#1727
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> /
>         Intel XE#3818
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3818>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-hdmi-a-1.html>
>  *
>
>     igt@kms_atomic_transition@plane-all-transition-nonblocking:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-lnl-3/igt@kms_atomic_transition@plane-all-transition-nonblocking.html>
>         (Intel XE#1426
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-lnl-3/igt@kms_atomic_transition@plane-all-transition-nonblocking.html>
>         +1 other test pass
>  *
>
>     igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-dp-2:
>
>       o shard-bmg: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-dp-2.html>
>         (Intel XE#3862
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-dp-2.html>
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
>
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html>
>         (Intel XE#1727
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html>
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4:
>
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4.html>
>         (Intel XE#1727
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> /
>         Intel XE#3113
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4.html>
>  *
>
>     igt@kms_cursor_crc@cursor-alpha-transparent@pipe-a-dp-2:
>
>       o shard-bmg: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-bmg-2/igt@kms_cursor_crc@cursor-alpha-transparent@pipe-a-dp-2.html>
>         (Intel XE#877
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/877>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-1/igt@kms_cursor_crc@cursor-alpha-transparent@pipe-a-dp-2.html>
>         +3 other tests pass
>  *
>
>     igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html>
>         (Intel XE#3321
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html>
>         +1 other test pass
>  *
>
>     igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4:
>
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html>
>         (Intel XE#3321
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html>
>  *
>
>     igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html>
>         (Intel XE#2882
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html>
>         +1 other test pass
>  *
>
>     igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-dp2-hdmi-a3:
>
>       o shard-bmg: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-bmg-7/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-dp2-hdmi-a3.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-5/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-dp2-hdmi-a3.html>
>         +1 other test pass
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4:
>
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html>
>         (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html>
>         +2 other tests pass
>  *
>
>     igt@kms_flip@flip-vs-suspend-interruptible:
>
>       o shard-adlp: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible.html>
>         (Intel XE#2953
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953> /
>         Intel XE#3086
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-adlp-9/igt@kms_flip@flip-vs-suspend-interruptible.html>
>         +3 other tests pass
>  *
>
>     igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-2:
>
>       o shard-bmg: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-bmg-7/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-2.html>
>         (Intel XE#3663
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3663>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-2.html>
>  *
>
>     igt@kms_plane@plane-panning-bottom-right-suspend:
>
>       o shard-bmg: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-bmg-2/igt@kms_plane@plane-panning-bottom-right-suspend.html>
>         (Intel XE#1035
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-7/igt@kms_plane@plane-panning-bottom-right-suspend.html>
>         +1 other test pass
>  *
>
>     igt@kms_pm_rpm@system-suspend-modeset:
>
>       o shard-bmg: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-bmg-6/igt@kms_pm_rpm@system-suspend-modeset.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-6/igt@kms_pm_rpm@system-suspend-modeset.html>
>  *
>
>     igt@kms_setmode@basic:
>
>       o shard-adlp: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-adlp-8/igt@kms_setmode@basic.html>
>         (Intel XE#1033
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> /
>         Intel XE#1727
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-adlp-3/igt@kms_setmode@basic.html>
>         +1 other test pass
>  *
>
>     igt@kms_universal_plane@cursor-fb-leak:
>
>       o shard-adlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-adlp-3/igt@kms_universal_plane@cursor-fb-leak.html>
>         (Intel XE#771
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/771> /
>         Intel XE#899
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/899>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak.html>
>  *
>
>     igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1:
>
>       o shard-adlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-adlp-3/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html>
>         (Intel XE#899
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/899>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html>
>  *
>
>     igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-3:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-bmg-4/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-3.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-8/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-3.html>
>         +2 other tests pass
>  *
>
>     igt@xe_ccs@suspend-resume:
>
>       o shard-lnl: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-lnl-1/igt@xe_ccs@suspend-resume.html>
>         (Intel XE#1616
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616> /
>         Intel XE#2771
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2771>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-lnl-8/igt@xe_ccs@suspend-resume.html>
>  *
>
>     igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-system-system:
>
>       o shard-lnl: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-lnl-1/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-system-system.html>
>         (Intel XE#2771
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2771>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-lnl-8/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-system-system.html>
>  *
>
>     igt@xe_evict@evict-beng-mixed-many-threads-large:
>
>       o shard-dg2-set2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-dg2-433/igt@xe_evict@evict-beng-mixed-many-threads-large.html>
>         (Intel XE#1473
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-dg2-464/igt@xe_evict@evict-beng-mixed-many-threads-large.html>
>  *
>
>     igt@xe_evict@evict-beng-mixed-many-threads-small:
>
>       o shard-dg2-set2: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-dg2-433/igt@xe_evict@evict-beng-mixed-many-threads-small.html>
>         (Intel XE#1473
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473> /
>         Intel XE#402
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/402>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many-threads-small.html>
>  *
>
>     igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr:
>
>       o shard-adlp: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-adlp-9/igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr.html>
>         (Intel XE#1033
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> /
>         Intel XE#1727
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-adlp-2/igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr.html>
>  *
>
>     igt@xe_exec_threads@threads-hang-userptr-invalidate:
>
>       o shard-bmg: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-bmg-2/igt@xe_exec_threads@threads-hang-userptr-invalidate.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-3/igt@xe_exec_threads@threads-hang-userptr-invalidate.html>
>  *
>
>     igt@xe_pm@s4-exec-after:
>
>       o shard-lnl: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-lnl-2/igt@xe_pm@s4-exec-after.html>
>         (Intel XE#1358
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358> /
>         Intel XE#1607
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-lnl-6/igt@xe_pm@s4-exec-after.html>
>  *
>
>     igt@xe_pm@s4-mocs:
>
>       o shard-lnl: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-lnl-2/igt@xe_pm@s4-mocs.html>
>         (Intel XE#1794
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-lnl-3/igt@xe_pm@s4-mocs.html>
>  *
>
>     igt@xe_pm_residency@cpg-basic:
>
>       o shard-adlp: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-adlp-8/igt@xe_pm_residency@cpg-basic.html>
>         (Intel XE#3086
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-adlp-9/igt@xe_pm_residency@cpg-basic.html>
>         +4 other tests pass
>
>
>         Warnings
>
>  *
>
>     igt@kms_async_flips@alternate-sync-async-flip-atomic:
>
>       o shard-adlp: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-adlp-9/igt@kms_async_flips@alternate-sync-async-flip-atomic.html>
>         (Intel XE#1033
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> /
>         Intel XE#1727
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> /
>         Intel XE#3818
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3818>) ->
>         DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip-atomic.html>
>         (Intel XE#3818
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3818>)
>  *
>
>     igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-hdmi-a-1:
>
>       o shard-adlp: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-adlp-9/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-hdmi-a-1.html>
>         (Intel XE#1033
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> /
>         Intel XE#1727
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>) ->
>         DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-hdmi-a-1.html>
>         (Intel XE#3818
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3818>)
>  *
>
>     igt@kms_big_fb@y-tiled-8bpp-rotate-0:
>
>       o shard-adlp: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-adlp-8/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html>
>         (Intel XE#3086
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086>) ->
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-adlp-9/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html>
>         (Intel XE#1874
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874>)
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
>
>       o shard-adlp: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html>
>         (Intel XE#1033
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> /
>         Intel XE#1727
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> /
>         Intel XE#402
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/402>) ->
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html>
>         (Intel XE#1231
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231>)
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>
>       o shard-adlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html>
>         (Intel XE#1231
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231>) ->
>         DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html>
>         (Intel XE#324
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>)
>  *
>
>     igt@kms_flip@flip-vs-suspend-interruptible@a-dp2:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-bmg-1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp2.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-8/igt@kms_flip@flip-vs-suspend-interruptible@a-dp2.html>
>         (Intel XE#2597
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:
>
>       o shard-adlp: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html>
>         (Intel XE#1033
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> /
>         Intel XE#1727
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>) ->
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html>
>         (Intel XE#1861
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861>)
>  *
>
>     igt@kms_vblank@ts-continuation-suspend:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-bmg-4/igt@kms_vblank@ts-continuation-suspend.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-8/igt@kms_vblank@ts-continuation-suspend.html>
>         (Intel XE#3864
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3864>)
>  *
>
>     igt@xe_evict@evict-beng-threads-large:
>
>       o shard-bmg: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-bmg-5/igt@xe_evict@evict-beng-threads-large.html>
>         (Intel XE#1473
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>) ->
>         TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-1/igt@xe_evict@evict-beng-threads-large.html>
>         (Intel XE#1473
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>)
>  *
>
>     igt@xe_evict@evict-mixed-threads-large:
>
>       o shard-bmg: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-bmg-2/igt@xe_evict@evict-mixed-threads-large.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-3/igt@xe_evict@evict-mixed-threads-large.html>
>         (Intel XE#1473
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>)
>
>
>     Build changes
>
>   * Linux: xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da ->
>     xe-pw-142300v4
>
> IGT_8159: 2a4c77dc47a59032c8cecd61cb0a5546a2828897 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da: 
> dc611f7bf8f6d604ba2148508eb076767629a1da
> xe-pw-142300v4: 142300v4
>
--------------fvfBMSkBfi3WH0Ru0BBe0fSY
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 17.12.2024 20:49, Patchwork wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:173446499334.3958402.13327303528541837445@b555e5b46a47">
      
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">td { padding: 2pt; }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>drm/xe: adding wait helper for gt async reset (rev4)</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a href="https://patchwork.freedesktop.org/series/142300/" moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/142300/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/index.html" moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from
        xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da_full -&gt;
        xe-pw-142300v4_full</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with xe-pw-142300v4_full
        absolutely need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in xe-pw-142300v4_full, please notify your bug team
        (<a class="moz-txt-link-abbreviated" href="mailto:I915-ci-infra@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <h2>Participating hosts (4 -&gt; 4)</h2>
      <p>No changes in participating hosts</p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        xe-pw-142300v4_full:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>
          <p>igt@kms_flip@2x-flip-vs-rmfb@bc-hdmi-a6-dp4:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-dg2-464/igt@kms_flip@2x-flip-vs-rmfb@bc-hdmi-a6-dp4.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-dg2-434/igt@kms_flip@2x-flip-vs-rmfb@bc-hdmi-a6-dp4.html" moz-do-not-send="true">INCOMPLETE</a> +2 other tests
              incomplete</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-dp2-hdmi-a3:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-5/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-dp2-hdmi-a3.html" moz-do-not-send="true">INCOMPLETE</a> +1 other test
              incomplete</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2.html" moz-do-not-send="true">FAIL</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@modeset-vs-vblank-race-interruptible:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-lnl-1/igt@kms_flip@modeset-vs-vblank-race-interruptible.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-lnl-4/igt@kms_flip@modeset-vs-vblank-race-interruptible.html" moz-do-not-send="true">FAIL</a> +1 other test fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_alpha_blend@alpha-basic:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-bmg-5/igt@kms_plane_alpha_blend@alpha-basic.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-1/igt@kms_plane_alpha_blend@alpha-basic.html" moz-do-not-send="true">TIMEOUT</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@sprite-rotation-180:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-lnl-8/igt@kms_rotation_crc@sprite-rotation-180.html" moz-do-not-send="true">INCOMPLETE</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_drm_fdinfo@virtual-utilization-single-idle:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-adlp-3/igt@xe_drm_fdinfo@virtual-utilization-single-idle.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-adlp-9/igt@xe_drm_fdinfo@virtual-utilization-single-idle.html" moz-do-not-send="true">FAIL</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@many-bindexecqueue-rebind-prefetch:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-bmg-5/igt@xe_exec_fault_mode@many-bindexecqueue-rebind-prefetch.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-1/igt@xe_exec_fault_mode@many-bindexecqueue-rebind-prefetch.html" moz-do-not-send="true">INCOMPLETE</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s2idle-basic:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-bmg-5/igt@xe_pm@s2idle-basic.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-1/igt@xe_pm@s2idle-basic.html" moz-do-not-send="true">DMESG-WARN</a></li>
          </ul>
        </li>
      </ul>
    </blockquote>
    <p>Looking at the results I don't think they are related.</p>
    <p>Especially that the only change is for compute.</p>
    <p>Maciej<br>
    </p>
    <p><br>
    </p>
    <p><br>
    </p>
    <p><br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:173446499334.3958402.13327303528541837445@b555e5b46a47">
      <h2>Known issues</h2>
      <p>Here are the changes found in xe-pw-142300v4_full that come
        from known issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@kms_async_flips@alternate-sync-async-flip:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/827" moz-do-not-send="true">Intel XE#827</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@async-flip-with-page-flip-events:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324" moz-do-not-send="true">Intel XE#324</a>) +3 other tests
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-lnl-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/911" moz-do-not-send="true">Intel XE#911</a>) +3 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@crc:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-dg2-435/igt@kms_async_flips@crc.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3781" moz-do-not-send="true">Intel XE#3781</a>) +1 other test
              incomplete</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@crc-atomic@pipe-a-dp-2:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-7/igt@kms_async_flips@crc-atomic@pipe-a-dp-2.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3781" moz-do-not-send="true">Intel XE#3781</a>) +1 other test
              incomplete</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@invalid-async-flip:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-3/igt@kms_async_flips@invalid-async-flip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873" moz-do-not-send="true">Intel XE#873</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-adlp-2/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-adlp-6/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426" moz-do-not-send="true">Intel XE#1426</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-lnl-5/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-lnl-7/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426" moz-do-not-send="true">Intel XE#1426</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@linear-64bpp-rotate-0:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-lnl-3/igt@kms_big_fb@linear-64bpp-rotate-0.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1725" moz-do-not-send="true">Intel XE#1725</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-lnl-8/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407" moz-do-not-send="true">Intel XE#1407</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231" moz-do-not-send="true">Intel XE#1231</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-16bpp-rotate-90:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-lnl-8/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send="true">Intel XE#1124</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send="true">Intel XE#1124</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send="true">Intel XE#1124</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-dg2-435/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367" moz-do-not-send="true">Intel XE#367</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-3-displays-3840x2160p:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-7/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367" moz-do-not-send="true">Intel XE#367</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-dg2-435/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787" moz-do-not-send="true">Intel XE#787</a>) +69 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907" moz-do-not-send="true">Intel XE#2907</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-basic-y-tiled-ccs:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-7/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887" moz-do-not-send="true">Intel XE#2887</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862" moz-do-not-send="true">Intel XE#3862</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442" moz-do-not-send="true">Intel XE#3442</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432" moz-do-not-send="true">Intel XE#3432</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727" moz-do-not-send="true">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113" moz-do-not-send="true">Intel XE#3113</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727" moz-do-not-send="true">Intel XE#1727</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124" moz-do-not-send="true">Intel XE#3124</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-6.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-6.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727" moz-do-not-send="true">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113" moz-do-not-send="true">Intel XE#3113</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787" moz-do-not-send="true">Intel XE#787</a>) +19 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-lnl-3/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887" moz-do-not-send="true">Intel XE#2887</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@gamma:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-3/igt@kms_chamelium_color@gamma.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325" moz-do-not-send="true">Intel XE#2325</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_edid@hdmi-mode-timings:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-dg2-464/igt@kms_chamelium_edid@hdmi-mode-timings.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373" moz-do-not-send="true">Intel XE#373</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-7/igt@kms_chamelium_hpd@common-hpd-after-suspend.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252" moz-do-not-send="true">Intel XE#2252</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-lnl-6/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373" moz-do-not-send="true">Intel XE#373</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@content-type-change:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-dg2-435/igt@kms_content_protection@content-type-change.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-offscreen-max-size:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-max-size.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320" moz-do-not-send="true">Intel XE#2320</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-rapid-movement-64x21:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-lnl-8/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424" moz-do-not-send="true">Intel XE#1424</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-lnl-8/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309" moz-do-not-send="true">Intel XE#309</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286" moz-do-not-send="true">Intel XE#2286</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursora-vs-flipa-toggle:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-adlp-8/igt@kms_cursor_legacy@cursora-vs-flipa-toggle.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-adlp-3/igt@kms_cursor_legacy@cursora-vs-flipa-toggle.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953" moz-do-not-send="true">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086" moz-do-not-send="true">Intel XE#3086</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291" moz-do-not-send="true">Intel XE#2291</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-dg2-435/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323" moz-do-not-send="true">Intel XE#323</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-7/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508" moz-do-not-send="true">Intel XE#1508</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_display_modes@mst-extended-mode-negative:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-3/igt@kms_display_modes@mst-extended-mode-negative.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2323" moz-do-not-send="true">Intel XE#2323</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-with-bpc-formats:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-lnl-6/igt@kms_dsc@dsc-with-bpc-formats.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244" moz-do-not-send="true">Intel XE#2244</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-with-output-formats:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-6/igt@kms_dsc@dsc-with-output-formats.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244" moz-do-not-send="true">Intel XE#2244</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@chamelium:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-3/igt@kms_feature_discovery@chamelium.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372" moz-do-not-send="true">Intel XE#2372</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-lnl-3/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421" moz-do-not-send="true">Intel XE#1421</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882" moz-do-not-send="true">Intel XE#2882</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321" moz-do-not-send="true">Intel XE#3321</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301" moz-do-not-send="true">Intel XE#301</a>) +4 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316" moz-do-not-send="true">Intel XE#2316</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882" moz-do-not-send="true">Intel XE#2882</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401" moz-do-not-send="true">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745" moz-do-not-send="true">Intel XE#1745</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401" moz-do-not-send="true">Intel XE#1401</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293" moz-do-not-send="true">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380" moz-do-not-send="true">Intel XE#2380</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293" moz-do-not-send="true">Intel XE#2293</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397" moz-do-not-send="true">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745" moz-do-not-send="true">Intel XE#1745</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397" moz-do-not-send="true">Intel XE#1397</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311" moz-do-not-send="true">Intel XE#2311</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656" moz-do-not-send="true">Intel XE#656</a>) +10 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651" moz-do-not-send="true">Intel XE#651</a>) +16 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333" moz-do-not-send="true">Intel XE#2333</a>) +5 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-tiling-y.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352" moz-do-not-send="true">Intel XE#2352</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651" moz-do-not-send="true">Intel XE#651</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313" moz-do-not-send="true">Intel XE#2313</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-7/igt@kms_frontbuffer_tracking@plane-fbc-rte.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350" moz-do-not-send="true">Intel XE#2350</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653" moz-do-not-send="true">Intel XE#653</a>) +18 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312" moz-do-not-send="true">Intel XE#2312</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@brightness-with-hdr:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374" moz-do-not-send="true">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544" moz-do-not-send="true">Intel XE#3544</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@basic-big-joiner:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-dg2-464/igt@kms_joiner@basic-big-joiner.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346" moz-do-not-send="true">Intel XE#346</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_panel_fitting@legacy:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-7/igt@kms_panel_fitting@legacy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486" moz-do-not-send="true">Intel XE#2486</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_lowres@tiling-y:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-6/igt@kms_plane_lowres@tiling-y.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393" moz-do-not-send="true">Intel XE#2393</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_lowres@tiling-yf:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-lnl-3/igt@kms_plane_lowres@tiling-yf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599" moz-do-not-send="true">Intel XE#599</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-dg2-464/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763" moz-do-not-send="true">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-dg2-464/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763" moz-do-not-send="true">Intel XE#2763</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763" moz-do-not-send="true">Intel XE#2763</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-lnl-3/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763" moz-do-not-send="true">Intel XE#2763</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_backlight@brightness-with-dpms:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-dg2-435/igt@kms_pm_backlight@brightness-with-dpms.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938" moz-do-not-send="true">Intel XE#2938</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@deep-pkgc:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-dg2-464/igt@kms_pm_dc@deep-pkgc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908" moz-do-not-send="true">Intel XE#908</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-dg2-464/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489" moz-do-not-send="true">Intel XE#1489</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-lnl-6/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893" moz-do-not-send="true">Intel XE#2893</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-7/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489" moz-do-not-send="true">Intel XE#1489</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-dg2-435/igt@kms_psr2_su@page_flip-xrgb8888.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122" moz-do-not-send="true">Intel XE#1122</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr-primary-page-flip:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-3/igt@kms_psr@fbc-psr-primary-page-flip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234" moz-do-not-send="true">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850" moz-do-not-send="true">Intel XE#2850</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr2-no-drrs:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-dg2-464/igt@kms_psr@fbc-psr2-no-drrs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850" moz-do-not-send="true">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929" moz-do-not-send="true">Intel XE#929</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-rotation-270:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-dg2-435/igt@kms_rotation_crc@primary-rotation-270.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414" moz-do-not-send="true">Intel XE#3414</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330" moz-do-not-send="true">Intel XE#2330</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@sprite-rotation-270:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-lnl-3/igt@kms_rotation_crc@sprite-rotation-270.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414" moz-do-not-send="true">Intel XE#3414</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_tv_load_detect@load-detect:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-3/igt@kms_tv_load_detect@load-detect.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450" moz-do-not-send="true">Intel XE#2450</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@ts-continuation-suspend@pipe-d-dp-2:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-bmg-4/igt@kms_vblank@ts-continuation-suspend@pipe-d-dp-2.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-8/igt@kms_vblank@ts-continuation-suspend@pipe-d-dp-2.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3864" moz-do-not-send="true">Intel XE#3864</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@cmrr:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-dg2-435/igt@kms_vrr@cmrr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168" moz-do-not-send="true">Intel XE#2168</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-7/igt@kms_vrr@seamless-rr-switch-virtual.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499" moz-do-not-send="true">Intel XE#1499</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-lnl-6/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091" moz-do-not-send="true">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849" moz-do-not-send="true">Intel XE#2849</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_ccs@suspend-resume:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-dg2-435/igt@xe_ccs@suspend-resume.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-dg2-433/igt@xe_ccs@suspend-resume.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616" moz-do-not-send="true">Intel XE#1616</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_compute_preempt@compute-preempt-many:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-dg2-435/igt@xe_compute_preempt@compute-preempt-many.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280" moz-do-not-send="true">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0xfffe.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126" moz-do-not-send="true">Intel XE#1126</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug@read-metadata:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-7/igt@xe_eudebug@read-metadata.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905" moz-do-not-send="true">Intel XE#2905</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug_online@interrupt-other-debuggable:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-dg2-464/igt@xe_eudebug_online@interrupt-other-debuggable.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905" moz-do-not-send="true">Intel XE#2905</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-beng-large-cm:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-lnl-6/igt@xe_evict@evict-beng-large-cm.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688" moz-do-not-send="true">Intel XE#688</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-3/igt@xe_evict@evict-beng-mixed-many-threads-small.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473" moz-do-not-send="true">Intel XE#1473</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-mixed-many-threads-large:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-large.html" moz-do-not-send="true">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473" moz-do-not-send="true">Intel XE#1473</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-no-exec-basic:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-lnl-3/igt@xe_exec_basic@multigpu-no-exec-basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392" moz-do-not-send="true">Intel XE#1392</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-3/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322" moz-do-not-send="true">Intel XE#2322</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@twice-userptr-prefetch:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-dg2-435/igt@xe_exec_fault_mode@twice-userptr-prefetch.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288" moz-do-not-send="true">Intel XE#288</a>) +14 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_sip_eudebug@breakpoint-writesip:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-lnl-3/igt@xe_exec_sip_eudebug@breakpoint-writesip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905" moz-do-not-send="true">Intel XE#2905</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_live_ktest@xe_dma_buf:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-bmg-6/igt@xe_live_ktest@xe_dma_buf.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-6/igt@xe_live_ktest@xe_dma_buf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192" moz-do-not-send="true">Intel XE#1192</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_live_ktest@xe_eudebug:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-lnl-3/igt@xe_live_ktest@xe_eudebug.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833" moz-do-not-send="true">Intel XE#2833</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_live_ktest@xe_migrate:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-lnl-2/igt@xe_live_ktest@xe_migrate.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-lnl-3/igt@xe_live_ktest@xe_migrate.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192" moz-do-not-send="true">Intel XE#1192</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_mmap@small-bar:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-dg2-464/igt@xe_mmap@small-bar.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512" moz-do-not-send="true">Intel XE#512</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_oa@polling-small-buf:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-dg2-464/igt@xe_oa@polling-small-buf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541" moz-do-not-send="true">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573" moz-do-not-send="true">Intel XE#3573</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@d3cold-mmap-vram:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-7/igt@xe_pm@d3cold-mmap-vram.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284" moz-do-not-send="true">Intel XE#2284</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s3-vm-bind-unbind-all:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-bmg-7/igt@xe_pm@s3-vm-bind-unbind-all.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-2/igt@xe_pm@s3-vm-bind-unbind-all.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569" moz-do-not-send="true">Intel XE#569</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-config:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-3/igt@xe_query@multigpu-query-config.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944" moz-do-not-send="true">Intel XE#944</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-mem-usage:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-dg2-464/igt@xe_query@multigpu-query-mem-usage.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944" moz-do-not-send="true">Intel XE#944</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_wedged@basic-wedged:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-adlp-8/igt@xe_wedged@basic-wedged.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-adlp-3/igt@xe_wedged@basic-wedged.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086" moz-do-not-send="true">Intel XE#3086</a>)</li>
          </ul>
        </li>
      </ul>
      <h4>Possible fixes</h4>
      <ul>
        <li>
          <p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-1:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-adlp-9/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-1.html" moz-do-not-send="true">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033" moz-do-not-send="true">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727" moz-do-not-send="true">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-1.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-hdmi-a-1:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-adlp-9/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-hdmi-a-1.html" moz-do-not-send="true">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033" moz-do-not-send="true">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727" moz-do-not-send="true">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3818" moz-do-not-send="true">Intel XE#3818</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-hdmi-a-1.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_transition@plane-all-transition-nonblocking:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-lnl-3/igt@kms_atomic_transition@plane-all-transition-nonblocking.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426" moz-do-not-send="true">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-lnl-3/igt@kms_atomic_transition@plane-all-transition-nonblocking.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-dp-2:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-dp-2.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862" moz-do-not-send="true">Intel XE#3862</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-dp-2.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727" moz-do-not-send="true">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727" moz-do-not-send="true">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113" moz-do-not-send="true">Intel XE#3113</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-alpha-transparent@pipe-a-dp-2:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-bmg-2/igt@kms_cursor_crc@cursor-alpha-transparent@pipe-a-dp-2.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877" moz-do-not-send="true">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-1/igt@kms_cursor_crc@cursor-alpha-transparent@pipe-a-dp-2.html" moz-do-not-send="true">PASS</a> +3 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321" moz-do-not-send="true">Intel XE#3321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321" moz-do-not-send="true">Intel XE#3321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882" moz-do-not-send="true">Intel XE#2882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-dp2-hdmi-a3:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-bmg-7/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-dp2-hdmi-a3.html" moz-do-not-send="true">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-5/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-dp2-hdmi-a3.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301" moz-do-not-send="true">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html" moz-do-not-send="true">PASS</a> +2 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953" moz-do-not-send="true">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086" moz-do-not-send="true">Intel XE#3086</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-adlp-9/igt@kms_flip@flip-vs-suspend-interruptible.html" moz-do-not-send="true">PASS</a> +3 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-2:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-bmg-7/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-2.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3663" moz-do-not-send="true">Intel XE#3663</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-2.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-bmg-2/igt@kms_plane@plane-panning-bottom-right-suspend.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035" moz-do-not-send="true">Intel XE#1035</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-7/igt@kms_plane@plane-panning-bottom-right-suspend.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@system-suspend-modeset:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-bmg-6/igt@kms_pm_rpm@system-suspend-modeset.html" moz-do-not-send="true">DMESG-FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-6/igt@kms_pm_rpm@system-suspend-modeset.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_setmode@basic:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-adlp-8/igt@kms_setmode@basic.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033" moz-do-not-send="true">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727" moz-do-not-send="true">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-adlp-3/igt@kms_setmode@basic.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_universal_plane@cursor-fb-leak:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-adlp-3/igt@kms_universal_plane@cursor-fb-leak.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771" moz-do-not-send="true">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899" moz-do-not-send="true">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-adlp-3/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899" moz-do-not-send="true">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-3:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-bmg-4/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-3.html" moz-do-not-send="true">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-8/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-3.html" moz-do-not-send="true">PASS</a> +2 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_ccs@suspend-resume:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-lnl-1/igt@xe_ccs@suspend-resume.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616" moz-do-not-send="true">Intel XE#1616</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2771" moz-do-not-send="true">Intel XE#2771</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-lnl-8/igt@xe_ccs@suspend-resume.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-system-system:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-lnl-1/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-system-system.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2771" moz-do-not-send="true">Intel XE#2771</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-lnl-8/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-system-system.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-beng-mixed-many-threads-large:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-dg2-433/igt@xe_evict@evict-beng-mixed-many-threads-large.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473" moz-do-not-send="true">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-dg2-464/igt@xe_evict@evict-beng-mixed-many-threads-large.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-dg2-433/igt@xe_evict@evict-beng-mixed-many-threads-small.html" moz-do-not-send="true">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473" moz-do-not-send="true">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402" moz-do-not-send="true">Intel XE#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many-threads-small.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-adlp-9/igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr.html" moz-do-not-send="true">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033" moz-do-not-send="true">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727" moz-do-not-send="true">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-adlp-2/igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_threads@threads-hang-userptr-invalidate:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-bmg-2/igt@xe_exec_threads@threads-hang-userptr-invalidate.html" moz-do-not-send="true">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-3/igt@xe_exec_threads@threads-hang-userptr-invalidate.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-exec-after:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-lnl-2/igt@xe_pm@s4-exec-after.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358" moz-do-not-send="true">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607" moz-do-not-send="true">Intel XE#1607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-lnl-6/igt@xe_pm@s4-exec-after.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-mocs:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-lnl-2/igt@xe_pm@s4-mocs.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794" moz-do-not-send="true">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-lnl-3/igt@xe_pm@s4-mocs.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm_residency@cpg-basic:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-adlp-8/igt@xe_pm_residency@cpg-basic.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086" moz-do-not-send="true">Intel XE#3086</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-adlp-9/igt@xe_pm_residency@cpg-basic.html" moz-do-not-send="true">PASS</a> +4 other tests pass</li>
          </ul>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>
          <p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-adlp-9/igt@kms_async_flips@alternate-sync-async-flip-atomic.html" moz-do-not-send="true">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033" moz-do-not-send="true">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727" moz-do-not-send="true">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3818" moz-do-not-send="true">Intel XE#3818</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip-atomic.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3818" moz-do-not-send="true">Intel XE#3818</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-hdmi-a-1:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-adlp-9/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-hdmi-a-1.html" moz-do-not-send="true">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033" moz-do-not-send="true">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727" moz-do-not-send="true">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-hdmi-a-1.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3818" moz-do-not-send="true">Intel XE#3818</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-8bpp-rotate-0:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-adlp-8/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html" moz-do-not-send="true">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086" moz-do-not-send="true">Intel XE#3086</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-adlp-9/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874" moz-do-not-send="true">Intel XE#1874</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html" moz-do-not-send="true">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033" moz-do-not-send="true">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727" moz-do-not-send="true">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402" moz-do-not-send="true">Intel XE#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231" moz-do-not-send="true">Intel XE#1231</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231" moz-do-not-send="true">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html" moz-do-not-send="true">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324" moz-do-not-send="true">Intel XE#324</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp2:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-bmg-1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp2.html" moz-do-not-send="true">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-8/igt@kms_flip@flip-vs-suspend-interruptible@a-dp2.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597" moz-do-not-send="true">Intel XE#2597</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html" moz-do-not-send="true">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033" moz-do-not-send="true">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727" moz-do-not-send="true">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861" moz-do-not-send="true">Intel XE#1861</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@ts-continuation-suspend:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-bmg-4/igt@kms_vblank@ts-continuation-suspend.html" moz-do-not-send="true">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-8/igt@kms_vblank@ts-continuation-suspend.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3864" moz-do-not-send="true">Intel XE#3864</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-beng-threads-large:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-bmg-5/igt@xe_evict@evict-beng-threads-large.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473" moz-do-not-send="true">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-1/igt@xe_evict@evict-beng-threads-large.html" moz-do-not-send="true">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473" moz-do-not-send="true">Intel XE#1473</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-mixed-threads-large:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da/shard-bmg-2/igt@xe_evict@evict-mixed-threads-large.html" moz-do-not-send="true">DMESG-FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v4/shard-bmg-3/igt@xe_evict@evict-mixed-threads-large.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473" moz-do-not-send="true">Intel XE#1473</a>)</li>
          </ul>
        </li>
      </ul>
      <h2>Build changes</h2>
      <ul>
        <li>Linux: xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da
          -&gt; xe-pw-142300v4</li>
      </ul>
      <p>IGT_8159: 2a4c77dc47a59032c8cecd61cb0a5546a2828897 @
        <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</a><br>
        xe-2389-dc611f7bf8f6d604ba2148508eb076767629a1da:
        dc611f7bf8f6d604ba2148508eb076767629a1da<br>
        xe-pw-142300v4: 142300v4</p>
    </blockquote>
  </body>
</html>

--------------fvfBMSkBfi3WH0Ru0BBe0fSY--
