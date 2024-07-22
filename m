Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C5EFC3DA5D
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jul 2024 20:57:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5274110E183;
	Mon, 22 Jul 2024 20:57:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nh73npZG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FE7F10E183
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jul 2024 20:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721681822; x=1753217822;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1M9Z1/5eZBiqduqtgN3Ax//9Qtb4N+uM4DWbhZFATXc=;
 b=nh73npZG38bEQ0bAmjD0NlTSFqFXOTUAziyvLCa0Lsl/p32sQ4lMZnab
 P408YL2VscyklD2RaeyNPkUSu8relZG5ZRSCMYsUGyqAUixLbEHHx7m74
 yCenFyTJvmPZ7CD9nWVc+PswqTuyHvcMHD8WDQLxZ4L/iFFBkvLOrh5fp
 2jZX5+0EUn+4W0koEsdN7holOYUNlPqw+vANjKXMsC43q2irHJ67B/92A
 ltZQponCVfYAnWIwR1ybzeMlGcVxtNOUzOYlDhi/uKoHf3r3D1mjW+7J9
 OdYbGSU0XXLerCpbkfb+ZzRuC8P9jh2podwNJk1TSphp0Bgv6LNTmQe25 w==;
X-CSE-ConnectionGUID: eRX/JbTqSna7PCRR9roiRQ==
X-CSE-MsgGUID: SrkblMsSSwSHl6nS2zvozg==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="41800779"
X-IronPort-AV: E=Sophos;i="6.09,229,1716274800"; d="scan'208";a="41800779"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 13:57:02 -0700
X-CSE-ConnectionGUID: evZDX584Qv6dlIJdLk1eVg==
X-CSE-MsgGUID: dtnEU4olQAKjQHmBwvyu5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,229,1716274800"; d="scan'208";a="52238981"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Jul 2024 13:57:02 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 22 Jul 2024 13:57:01 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 22 Jul 2024 13:57:01 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 22 Jul 2024 13:57:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eJNd9nofjIRbRZRryZA/BE6lWOEFj0WGiIturmzGGQ0C674Gv0ly8+eXcvD8v1Mu/hCHg1zNEp+Ub35DNTB40dhR1dHzC0DnbNR7I6MMoX+CzxZ3oM/fQ5jRxOkHTbB5g4L+RUoxlQl0i8ERyxeNXc3NN5h8bNXh18pPnrR/mLKKI2MWDH7v8n0VXax41zzsHCKPv9yJubZjKAiPFGolMPuMEkGx33Y/xmVzq2B1KI4X8cyfhvYZ8uAEVKato47gN34+KlkUwajjKaJdHoPUdpznOiJBZ3jzFCUJbsHkKj4MU7mHMXECIXMTsdUWLphVYuAwEwU3qWmCX5R2sZ7H5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1M9Z1/5eZBiqduqtgN3Ax//9Qtb4N+uM4DWbhZFATXc=;
 b=y7GHxoL1LEY0nyenNWdI0WzRdpqsW/QHVfDuN2vDocLvfBeIaB6Jo1qoHWHoP4k2YDgRulVIbHTka8y0PzoseDNLfhHbv8aNY/SOgjAlK4fOJ22Lqp/qoP0zoONSyd3lO2AP0hu2OTn7zjtWstU2x5rwvTYzER2I7nvMRjtB51/5TGIgdToPn1/KBh+a9Q4LKBHRx3ND9iK0WScsTJcPT+ytt2Wn2bLeCHN9Q8BqGt6M+UBpVbfJl54sFJY8YUAFUvkaJbVmssA7XjwBpIxtwK2QhvslkOCAT7IJQ6hz+W195TriymLNLZqM4pL9MzT9D0EYeubZG9Ywap6Vdnqh+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by MN0PR11MB6158.namprd11.prod.outlook.com (2603:10b6:208:3ca::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Mon, 22 Jul
 2024 20:56:56 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::2ca4:29ad:f305:6fc0]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::2ca4:29ad:f305:6fc0%5]) with mapi id 15.20.7784.016; Mon, 22 Jul 2024
 20:56:56 +0000
Message-ID: <4cafc0fc-1dcd-4f84-adf3-26c9c7bcdfa0@intel.com>
Date: Mon, 22 Jul 2024 13:56:52 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [CI] drm/xe/guc: Enable w/a 14022293748 and 22019794406
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20240719230525.2444543-1-julia.filipchuk@intel.com>
 <x7gzb7lqcssrh72r2qqhgjrn2di6jsuqiyggcywt65ejvagahw@t3yivkvvbb2v>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <x7gzb7lqcssrh72r2qqhgjrn2di6jsuqiyggcywt65ejvagahw@t3yivkvvbb2v>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR01CA0005.prod.exchangelabs.com (2603:10b6:a02:80::18)
 To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|MN0PR11MB6158:EE_
X-MS-Office365-Filtering-Correlation-Id: 7370b722-fa5a-4648-9c88-08dcaa90d256
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M1JqTUVNeVoxU01sQWpwSGUvTDhuZ09IOXJHNVNmSDRYUTN3eXdnUmI2MmF1?=
 =?utf-8?B?UkJ2Tit0d2VlNy9mdTRvMjUzN2NidW1qd2FtZEcvckJmRE5OUERwbzVIUTZE?=
 =?utf-8?B?bkxodlpxSEgxWVdVZDFmclV3U2lMMFZoN3lMaGZNbC9TZFVDRWJJbU9VVU5h?=
 =?utf-8?B?MzNwRXk1TExrVWdQU3Fpek9tbk15MGVWbmdFNVBycElHL05qZU1PRSt5UFBk?=
 =?utf-8?B?eHd1RExTejVmRTU2QUo2OXpyajZGaUZMU1p2RW9yMy9wSGRmKy9aWE8rM2tx?=
 =?utf-8?B?bHF5K09TMjZhV0g2dGJxbFZ5Smp0a2xqTENTQkQ5UnRaOVBKdWk1aE5MQnNF?=
 =?utf-8?B?VkVUOXcxbUpST3VQUHY0U0JjL1JqNmdsemliN01IcDdTMnVGbWk1d2lwd3hV?=
 =?utf-8?B?M1NCMC90ZnFqTk5kZkkxQ1Nmek5nLzRrUVdUdGtieEFmbVoyNWVJNzBoUzNu?=
 =?utf-8?B?ZUlaYWxycnZLRVB1OVhMKzZjYXdSYk1PVkVGd1FmZ1ZERmttdk9zOGxmRUhh?=
 =?utf-8?B?eUQ0QlNud0IrNFgybGlwRWlGc0xpZk1jYkxXQ1JqaWR1ajIwb1ZqUEVQVWV4?=
 =?utf-8?B?L3F6RlJLd0NRd2pHUU5nS3dsV2ZlZlJVVWZnQy9RVHhvcStKeFg1aWVxK0oy?=
 =?utf-8?B?U2tEU2NFS2ZKNUZ3STRUK0piWGs0ZWNqcWsyVnJQRTNGK1FvYnB5ZkNaRHk3?=
 =?utf-8?B?cTdJN0JiOGFab2JzRjhxc3A5SGpkcDJ2c1lqbmJ6emFBTSs2UWhIRFdnME9p?=
 =?utf-8?B?eFE3NEtiNGltUDZlbHhadWo4RVNrZ1pGbXJOVk1BaFlZRmJ4ci8xK2lQWUUr?=
 =?utf-8?B?TkxMc0xGWVlsWVNpUzdHc29DU2wrdkFiam1zL0EvTEIwSFhyWldOd2V0QXZJ?=
 =?utf-8?B?Wkh1Z3ZUWDgrd29IYVJkMGZMa2xDUEs5WWVIdHJqazV5S1hxTDU1WVVUUVlx?=
 =?utf-8?B?RVZLRUlpNEovS3NMYkZDNlphQk93VHNsY2VJeE5pZktWdDdRWXBaelhwc0Vz?=
 =?utf-8?B?bTJKMnZwUld1WlpMRGJJUUhTZkJjSmFpZVVKR20zRGR3bnBkb0Vlay9xY1lz?=
 =?utf-8?B?dGhEN3pyM0sxMEkwdmV3ZEJBQ3JQU2dIOCtvNVBBOCtUNUlsVTZ1MzhjQzJ5?=
 =?utf-8?B?MXhGWWtPYTN5SWx1eXM4MFd5WEFHWDJQU2VyZExSeXp0dG5tTDFCeVhLK1JF?=
 =?utf-8?B?RzZqSEhTdTRKekpRVUF3QitlelJEVTdOYmxxKzhrcFdyRldzV0h6QlFWb1R3?=
 =?utf-8?B?RWdJYTlhMW56UWlTSUVNVDAvVXIxaThJTklnS1VPeGRaZVhvZmFVMUQ2N2tE?=
 =?utf-8?B?WWJJSzJ0RVd2cTVGeWxhMnpHNnpCaXplZjEzYkVkQmRlY29IbldNS1RNNnB6?=
 =?utf-8?B?VlZsRnBjcTRvN0d4TFAzS2hxVmZmdFMwU1dWeFlneVBlT2xESTYzOG80aDdM?=
 =?utf-8?B?cXBQZklKNW5hMkxHcWd3MXdWd2RyZE1ZaWlaTlBMZHN3a1Y4ZUVTMWE2QVJp?=
 =?utf-8?B?Y29uUU9tbnhLY2J1dnBuaUxDKzlwSXpMNDNWeWVObnRvOGt2R01jb0tSdUZ2?=
 =?utf-8?B?bkVaTTVMeHVSWHN6R01LcWttREZ2M1d3Q2xydU9wT2IyQmZycTBoVTZ6K3Vq?=
 =?utf-8?B?c3F6Wno2L3BuM1k0Si85bFdhNjlJVU85MktTV2QybmYwNmxLWk5pdm81ZkVi?=
 =?utf-8?B?NEZ5ZjduRFlOR2pTWjQxUkFMK21vMFczeGg4NGF3ME9DUFVKVXBEd3JPSmlG?=
 =?utf-8?B?NVJpMy9sT3hlUWphSmxXZTExb1B0QTJ2Nmdrb2dRdmxpa2hnckpFTUM5VlJs?=
 =?utf-8?B?Mm04ZmhnWXhqYWhJVmF6Zz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZndUTUpIa0plM2lOSHB5Q3ZQSXl3TlEzV1VBNWJkODJ4cFdkWmErbEsrWWIw?=
 =?utf-8?B?SzlRd0t4SURJOTlQcnBRUFlFbURyMjhJSTFpMXFQMG9Ya3k2cXBOYnJxK1My?=
 =?utf-8?B?Uy9WaXZ2NGoycU9GTy9ESXIvTVNzU05tMC9nN1lhRytoTUh6TGJ3S0s1bUVP?=
 =?utf-8?B?MGl4YnVHcTB4Y08yS0w1OUwrbWtHUEt6UVhVYnNoWk9oVjd1bEE5QXdsSVRU?=
 =?utf-8?B?czFiTnp1UksxQzhMS2d4WERmM01KQjlKWUoxMHBqZTY1aDh4b2FwR3FmMDhh?=
 =?utf-8?B?djh2czJEVWw0a0NZQlpaODlEQzlWK24wYnlpczdPSnJFcWxScmZGREhrUDJi?=
 =?utf-8?B?Umh4WklFVWZSQWhKN0IxMHVpVEZxcnBBUjUzMjl6Q1E3VnhqNGMxcHhWM1Fo?=
 =?utf-8?B?emNLNW9jRXFieVd3Y2tOT29ZcE54M1p3dWVzbEs4WjZ0eEh4T0hoN25DaTIr?=
 =?utf-8?B?S1FZNHFzU241WVpFUSsrS0xxZE9yTU5qekhzekNVYVJCeWsvY3ZrS3lsWHFZ?=
 =?utf-8?B?UW5reENJSmQ1aG9HR2c5QVhTOW1sUnFkRFVqY2xjejlSaURST0FPcnoxTkps?=
 =?utf-8?B?RGxPbzdlRW5pU0EydHFxbEd4U01tWEowYzFwS00xZC9OMVB3dXVzKytBWDln?=
 =?utf-8?B?eUZRejBjWVpqMVU3RWxBQUJYQzJjblFCV1UzbHpLRkpQaFYrcUlKeG9UUWxT?=
 =?utf-8?B?dVQ4R3VJV0VaMHNtT1JRR0ZEN0NrTmNXN2kxeC9zamJ2UVpiaG9KY1lJL05z?=
 =?utf-8?B?Zk0wT2hJR0RxWkYyWFpqaDhEdy9ybStDUlhmZGhDQXdtVFZBTmt1d1BlNHFD?=
 =?utf-8?B?TkljT05kYTEzV3E3ejBjdDJ2RHAxbk05ZTFVQkhic0x4YzJzRCtRWnNmb0VQ?=
 =?utf-8?B?eXMyS00xemFOREZ4eWVkQnZqREY1MDV0QjlITUJDODFNdVlVMGhjaUs4b2Qz?=
 =?utf-8?B?UDJpbUtIdXUwOE9ENnBQNFZuc2NEQ0FoaiswS3hwbjRsbExSSHhneTRVY2pG?=
 =?utf-8?B?K2Z0djh1ZDA1ZTIvYWdiaXErRUNlVWJDUitDaDlyaHRRMThwcDE3OGVndnpz?=
 =?utf-8?B?TE9XV3VVS1dGUW9INnpkcXNiNjkyK1NhQnpocmFrNHF4MDMwWW84ZHdSOWJ5?=
 =?utf-8?B?czBUZTRIbGpXQVA2SVgwb053a0oxUWYzVzB2UUhneUYzRmVZRnJJb2gyT0Nu?=
 =?utf-8?B?Z3lmSW9ZQkRyMzVwR3d3UGs3d3l3MnZSLzZ1SFd1djFaK25MdVJTTEdRUWNs?=
 =?utf-8?B?Z2VBVm5hdXpzWG84WUdXSE5SUXFvaGJaWjF0ZDA5MHZjQnA2NWF2c2EzWHBU?=
 =?utf-8?B?TTNqRmlmbi9CcThQbUg4R0tFZDlycjF1dldkSjBMLzNDYW9zTlpWeHpoSFc4?=
 =?utf-8?B?d0NnbXRtemdhMEF3OVNCVk5sRnZXbTFNRmVIa1p6bWlLRTlCbWZqdnV6bkZl?=
 =?utf-8?B?VkJyeXRJU010VU93d3ljb3ZDOGxybHF4N3NHZXZYWFByRGlwRnpLbjlSUFZS?=
 =?utf-8?B?Y2hCdHZ6alU1cnRITXoxWXdWMk51VWpsYmVhc1N6b05WT3BpWjdGNWVDNm9x?=
 =?utf-8?B?bjZJWlF3allZTWhJYmk1cFY4S3JZQkJCRVY3dnlSUGRZMmJEYlBuUVhFRXc2?=
 =?utf-8?B?eHNmaEFuUk9hcCtzalhjWjJvOUZNT3pMUmxIZGNITm1YeU9LSGRYOVdvUjFh?=
 =?utf-8?B?UXpyTGh0WmxyMzhRRkZWMEpSQ3pmZHBOR3p3am5jdEdMNUYxQnI5bE5iSEJR?=
 =?utf-8?B?TlI0c2tRWUdBTXpIVzdYblJPeldSSmJQYW5wTkVwR3U3RkZQQlF6bHpEQTJ0?=
 =?utf-8?B?cndIZDZicGJpeXRLQTE0Zktvb1B1Y2pSVkJFNVBWZ3ZUQVFCOHQ4N3dhMVRY?=
 =?utf-8?B?SVJGOXFuYlVMNyt3OXV5ZUQraUxIYm9yd05PNVpaQk5HL0VnWTZiQkx3QzRk?=
 =?utf-8?B?MmVaZE4xZ2FLUkdYMzdLZXNPb2ovZ01yUUI1blZXMUQ2djNNYXBGalJFUnZE?=
 =?utf-8?B?RmpheXhDTFBZa3hsTjhwQndWa0RiazhLdm05WHZ0NkJUdXZHRWpHT2V2b0po?=
 =?utf-8?B?czRlb3Jhc0gwSG1rczBrUk1wRjFrb1JWditOMGtGTWk1QXFxcy9IK3pRb0ZW?=
 =?utf-8?B?UXNCWmVnTU5MZ3d3ZVdqMmhzMWNING9Rd01iNGR4amMzMys1RDFOU0ZFZFFM?=
 =?utf-8?B?b3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7370b722-fa5a-4648-9c88-08dcaa90d256
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2024 20:56:56.2782 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b38MgzQ8YNJQTyGFTl6mf+WZIWay6Jx1Dz/4o2XytvvZqO4HsWeJkYBnIiuEGo8EfzhzDXcS1RJMEmDrz9RNd0G0bzS2F9x6Jm6RgvitQwI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6158
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


An "or" is the intended. Good catch and thank you for the check.
