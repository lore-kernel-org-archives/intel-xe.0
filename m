Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A919ED3399B
	for <intel-xe@archiver.kernel.org>; Mon, 28 Oct 2024 15:51:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F1FC10E14F;
	Mon, 28 Oct 2024 15:51:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="COghou3P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C78B610E14F
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Oct 2024 15:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730130712; x=1761666712;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=FYr8SyP86bf9MIPl1ZrPa6Fu81mT5dsu70FJEJikmtg=;
 b=COghou3PZ6iZ+1mseB9kFhbGZuYXZ6lE5p9EJe2Z43Qsq8n2YEphx+kV
 TszwbWCq/Omqkes0ywqgkWyuYLRxw4ahILHQM/9EVHA5Vfz9J7Jad9mYS
 RA3ediOVM+kv/73QLGivM7v12Zdki2e5huJ0yuZuS2kYVt46PELWnxTcr
 yD8ssE6eGrlLovxyCG3pGYypiHrciMkB+D12fmI6roxsyculEfFt8A8YR
 6/30TQF6sabjvnuB0zFis9nCwNR+4YFfjJZqZZPsUrvGNcAMEwH/+WzV6
 LKo4yAHdg79jJxLl/yvkb8znQyp45MKqUpqmelew9oslKPThsxLFshQR+ Q==;
X-CSE-ConnectionGUID: tpyQ54cDTPyYi6JwTyRQ4w==
X-CSE-MsgGUID: G/I9EICqSPyYPCVfC+f8sg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29869706"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208,217";a="29869706"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2024 08:51:52 -0700
X-CSE-ConnectionGUID: lf/D5C9AS1uxY/40bwwzVQ==
X-CSE-MsgGUID: 3D9t13yBQgWynGjM1xHphw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; d="scan'208,217";a="82078878"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Oct 2024 08:51:51 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 28 Oct 2024 08:51:50 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 28 Oct 2024 08:51:50 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 28 Oct 2024 08:51:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tJ64w/j7m0/OpevJK8ElpkiaxRWUJgwl9Qiwh6T1wLBaJMx/EjnzuSF/HTOlmWbZVHYXZAZ3JBPc/O5lqf1G2oI1VmxvehrzoLfxWlYERYHrB8mWn4o0xQBCbvLmM+XTlJVMbEzd1plC8OraeekUdi2uUmP/4qJ7kF4iUmeQ35ORp7TOqadI9L2QBXpP25uAPjhlf1A/Q3BtKRLAPzJrTdZ+epcuonJ/RFaWOYIQKUDmPuP2b6uIEOiaxGVMmjTlv12pEuO4KKsyd4wH0hfjqljKxyF57gQQ5Dsxt0c6FnlP9/haNhxQrjSVhQOj+b+wrjUErMX/gEtmyP1HbxcSzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Kdiy4krJNLo1ORB5IgrxQr1+v98HbwFR5K3oSiu454=;
 b=vEpEBqvkhhQ6P8PoLGtXKomrxmKXO7K+qJM2ugccTiUIbAFSL+5y5DnpLHcKPiI6JgOxRzUJTBDVK7ppoFtQQbJPUIx5N/UEiUuLyVRe5ktcR1xt795iwTIuKZg1ty3vUeF6GP190nt3OLUvNqiGRGaYtoa4TJyFc8F+IVE2OBETKWQzIqJ/HZ4WhtAF6RA9j3/lEjSrqnh10G9m85zMQe1BLy3uyiIlVpV3tnMrUB3xqv6kUlog2zdCp4jzFml8I8+O0rrx4zRXqH7lSWGiC3ohNLl2ywitXqVJsD0RpDVBNG8rejRB56ia7zMX8/tMGio2waUBQpgSpS1THCVG1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by PH7PR11MB6356.namprd11.prod.outlook.com (2603:10b6:510:1fc::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.20; Mon, 28 Oct
 2024 15:51:46 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229%4]) with mapi id 15.20.8093.023; Mon, 28 Oct 2024
 15:51:46 +0000
Content-Type: multipart/alternative;
 boundary="------------q8JPuniyTVOznUwkJLbqBjV0"
Message-ID: <c2e7ea27-3c71-43cb-bae1-4edeeec3eb8f@intel.com>
Date: Mon, 28 Oct 2024 16:51:42 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] PF: Add support for VF scheduling priority
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20241023231152.1815-1-michal.wajdeczko@intel.com>
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
Content-Language: en-US
In-Reply-To: <20241023231152.1815-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: WA1P291CA0016.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::27) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|PH7PR11MB6356:EE_
X-MS-Office365-Filtering-Correlation-Id: ee82e183-f284-4dce-b2f7-08dcf7686d1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TUFKaE9hcERpL3BhYWZZK3I4NjhPbHZJVlI5QXdhWG9VMG1WaTYybFA1a1pp?=
 =?utf-8?B?cHEvcmJNZXBuTU1pamg4enFjekNvRlRnc1RZTTlFZStzSXBFVnV1MkZxQVJQ?=
 =?utf-8?B?UVJpTVJQejM5cENyU2RJa1QwWGZmVHhKWW9leWZyTHRnajM0dm9Jem5ENHBQ?=
 =?utf-8?B?dWxQSjd5dEJ2TmhyV2gwa1V0YUFObTA5enVyRzlTRkRZeEdQN05SZjNraVQ3?=
 =?utf-8?B?ZmViOEdsZ0ZZYktjaFRqenRoZ2NCWVZ3UXVtN0NXZTF1VWhiek81aE1mL1JR?=
 =?utf-8?B?TWJwOGxJc0FxR2VQRzViN0hzdk9rdmxpdXJlWUwrdGI4S3pVR1BjYnRUREdN?=
 =?utf-8?B?a0tmN3RsZ29FbHhOUmVFeS81TGt6T21VdXo1TlNPeXhtcWZtdWp1dmtZSG05?=
 =?utf-8?B?ZHhFVW1HYk9tK3lad29zUkRBU0FqV2Fwenk5QXpBRERTMUJVRFpyckhQZXNu?=
 =?utf-8?B?aFl4UzMxeE5xbUdFenhBcWtldkRFVEV0SjJWczVhNzJsSG0zMGhHOE5lcHZK?=
 =?utf-8?B?RThiNnI2S3lJQXd4TkdrRVBJdW5YY2U2bWtNeG13WWtMcDlGLzlwTTFKRG9z?=
 =?utf-8?B?bmI0SkxiaXhJTnNZZTVPKzNmU0N3S09wM0hFU3BpaDFqSGlOa2UyNWJHYjZa?=
 =?utf-8?B?eWErT2tDUjdWY0s3Nm9VSXBRNDBIb3FYWnd2TUtabm5MRFRuRWtCTVhUS0Nv?=
 =?utf-8?B?Yks0NTE1OGJpMGxqQkxVNGgzN0F1VWlDUlpEcEtvYVpVUnBvQk5ZT2QvbUlO?=
 =?utf-8?B?SWhwWE1rcDU4Y01oQWM4dTJSMnVkKzBtVk9BRnJYVDFnVkpnN2k1SUNTVFJ4?=
 =?utf-8?B?RHVMTVdZYjMzdWFRUEZFUTNSN21yWUNVRW9QZXNRcUxYeitIZHZNK3I0ZU5T?=
 =?utf-8?B?OGNQSTJaUGRzNmIzYTFvaWhUbnM0aEIvMGpHTHdadmo0V1J5aWNlcFdiZkY1?=
 =?utf-8?B?TjROWnlMUk85MXBScllRK09qUnQrRTllVGZCWjJ6SC8wR2FCSEFDa3gxaC9Q?=
 =?utf-8?B?T01YeHFuS1A2dmc4Q3UwVkVabzJqN1VFbFllYUVBbEIyRDR3YVo3ZHd3T3V6?=
 =?utf-8?B?dW5peW1zNVJQOW9kRHFzdjJmSkRvbEs3YVdQOG8rWkNtRFJnU3JnUVhwL3ZB?=
 =?utf-8?B?eGk1bkJ5cjYyZWI3dnVDQ250T2FjWm0rbjVhaDloQXVyak81a0tVNENpYTFz?=
 =?utf-8?B?NmN3Z3NITW40aE05aS9ydkQvMlRGQW1IMklSV2hYeTVOZkdUT1JUVSt6eTlE?=
 =?utf-8?B?M3o0QXpXM3JXUGp4TzZQN01KQXltbVBremxSVmpvcjVsT2JtUjZtNXFybmc1?=
 =?utf-8?B?a3RmNTdzczFqaC81OWxzSDVJTWo4UDNYNDNDaHNIWTc4dVJpcUp5VVJnZE1W?=
 =?utf-8?B?Q3VFNTNGbVhEZmRuR29WcytJU0x6a00yMDRzaktad2ZUWDZQdW4xZnpCaFF5?=
 =?utf-8?B?M3JlaUNTelg0MEFHcEJHOGRrdVhxWGZjazZwZHdSQTRUNEt1Sm9hcGxXRGdz?=
 =?utf-8?B?YldFVk1WYkZlYkpFYjlicHBGTE41SDFPTWdZeU80Y0h1Mys5TWwyNm5PWkpp?=
 =?utf-8?B?WDZNNFJrYktOSWxSOHF3eVY4OGZ4OWhLSHZKZ0RodHBvaVY5TzhNaGgraS9Z?=
 =?utf-8?B?U0NOd3hqektYSHFsVkZaTFlOOEd6UjFYWE1CcUU2bm9BQWZUaU8xL1phSjZB?=
 =?utf-8?B?c04zSU9WdUZGWGU2eGJ1a0RyS0xZUFBOTGtnaWpneTVoclJxemxESnBKREMz?=
 =?utf-8?Q?oOfT3rBnNHGnawH1uEAv+Lz1sX6y2R3KwuKKHVG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bDJGendWZW9oVy9oSjMzR0dsNzdST203cXdiN2t3VUdLd3BhUDRUVjhYMjRP?=
 =?utf-8?B?VG9CNmpvWUM1L0trUktGSHhkUk16NHgzZHJqNDNTSExSdGlOb0xMRnpzcTFq?=
 =?utf-8?B?cTRVaE5jdzlsMGNkcHBaUVBZSE5pV09DM0pocTAzRmcxNVBtZ045QndWWFBU?=
 =?utf-8?B?U3FGbkQ4bzdwNkVwRG1NbExkT0x6UzdCazczWGFFTk9sTmhOZmc0K1FFK2Qx?=
 =?utf-8?B?Z2FpZHhWY2pYMnVIYUk1Qmc4MjloSXpRRHFPV2JROHZxak5Uai9PdSs0Y1dM?=
 =?utf-8?B?ak9ZSkQ4QkFJUWgzV0RtRmtHMjVYaFVLb0RldWwvWmowUENqZWpxOU9zMDh5?=
 =?utf-8?B?SUI2UWJVWTJoZEs1cTdTdDZBbm5FZEY0cU9tRWxTeU50UnI4NW1RQi9hNnhC?=
 =?utf-8?B?UlBCbVl3cjdlWXJodnhPbDhVS0x2NW56bFFSU0loNUZXREw2TGFTQVI2MDJw?=
 =?utf-8?B?aEp6bDBhVlpCMzlNcnRaS2RTUVcxd0FkR2ZMNXFiVVJKRkFIT2ZRUldiSHVJ?=
 =?utf-8?B?MEdWQm5pTGtMSmdCazFKbUhoNDlwbkwvdlNoMVg4RWd3YjlmY0RIZ2ZOdTR0?=
 =?utf-8?B?VUFtRDltQ0RnUDI4N0o0SUZ2QnlFZDNXUlRxUHEwSlVEZE9rUi9QRndqMnRB?=
 =?utf-8?B?NE5YeHY0Q2Z3RWRUZVhsODdCMSs5dHZiRHhwT29aQi9rODBuaHVjVDIxbmRs?=
 =?utf-8?B?Y2JCaWxqVUFOTkk1dnNuK3pVem5MWW5jTm5SM0VuS1orbzBxOWUrdUpTSW1n?=
 =?utf-8?B?SzhPRHV3M3VXaEpMSDBuYmJpUnhGYUZXUmZDQUFzM0RlSEdNbFJwOE84T2pE?=
 =?utf-8?B?YmZOc2lYZXZ3NzYrL1RZeWhoekRKa2QzWGptbFA3V2lMNFNlMTZJTFlaZmJ6?=
 =?utf-8?B?SGc5K2F2ejJoWTg5NTRTSUZBa2NwNWhhOGlnQml1YjJYVUQ0cU13Y1VjbmRU?=
 =?utf-8?B?ZGRuM1JkZnNXVExNWGFhOVRNTWE1d3l0M1doZkdpSlQxdDg5ZlBtTU5HL3FK?=
 =?utf-8?B?VVhhM1llcUZ1UWFGSitDNlhxSDlPVGhEZTlNQUp3ckN2VEtTcTRZQXVpNlBG?=
 =?utf-8?B?dmgySnVvZlVQdWh5NzhKanJ6aWtWd2J1bk53aW9RQ3RpUXl0SmFXeGp5MTEw?=
 =?utf-8?B?TlZWdzZzYVZFemwrL3ZHcUhIRGRWVk0zdUdWOG1Tc0tqZWt4ZVUzbnQxQkJ6?=
 =?utf-8?B?ZjJ1Yk1lYXRXR1ByMFhaZks0VEpIOU1Yc01zakNvTVZkL1o3cVcxNHRjMHNZ?=
 =?utf-8?B?ek5BYnhCTldDNUszbEdjajkzQzlxYTg3NStLa0tpRUV5K3luWGQrUUtjb3lz?=
 =?utf-8?B?a3B0ZVlNT1dRR2ExSExnVFl2SElGL0tyN2UvYTIyNWthZFhvbUxoRVFtSEts?=
 =?utf-8?B?Y0JxWWJBcCtNRVViVzhZbDBZS1JyQTNJWXlNU0J1M0g5a0tWL3FYQjZDQ29t?=
 =?utf-8?B?R0RQcTV0N2d1d1JoMUt3SENuSmhCeFRJaTZWbTJ5Q1hvWEJrUmJSTmtUMTNO?=
 =?utf-8?B?Y0VhNEIrTlZKdmZKM1ZRQVJSY2xyV3JwTEZkRkZNaHh0eXJ1OG1Fc2p3N2ZR?=
 =?utf-8?B?NlF4N2dudFJhYlRhRGZxa3JxcFNPMElYK2tiWmphd2xOcmNHZW1jeVpUSkVH?=
 =?utf-8?B?WHpHd1d5Wml6SFZjRjhiL2JXc0pjbkNHcGN3S0xrYzVmSWxRZ1BjNEswd2Iw?=
 =?utf-8?B?RUVOVVhJSDJFRVBxSjR6TFdVQ00vQlR1dWpaNmx3emZ4bkNHdDd4ZWhBblVC?=
 =?utf-8?B?aTM2MjIvTWs2bWR0bStIWlhzY2ZBcU0ycHdOWEdleWZqYzdHaDE0RHZrcHFy?=
 =?utf-8?B?K01YbHBPKzJTdE40MExLRnhmZmxQQjgvRDJjQUZKWEZoSzdDd3B0NlRTK2Vv?=
 =?utf-8?B?Y0NxdFh4OUwzcllRNFhpQkY4U2xRZUQxMGVFWVl2R054L2FpaTNoTnpZbXdX?=
 =?utf-8?B?Z1E2T2FNenFHdlZCTFExclREQTYvdlJiRE1ncnRHU1h4R2wrdENqSXBoQk8r?=
 =?utf-8?B?MlZzazhWZlZUM0RvN2dibW5FcmcvUHI5TkdEczN0dkE2UStUMFhlaUxya0Uw?=
 =?utf-8?B?cEdscTZoRHlQd080TmljSGkzVXl2K01uNzVsL1hVWldFdnlDNlZnSWtYTU4z?=
 =?utf-8?B?TWlZQUJPTEVIeFVadGpUbHpjaXZBSDRUbG5OVkJjR0pRQ3YyK2NBMnRNOFFC?=
 =?utf-8?B?Ymc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ee82e183-f284-4dce-b2f7-08dcf7686d1d
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 15:51:46.1098 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1iOGvXmbVZj3tnokPgYw+bNJxu7asC6wQHVtfeG49Ezg7LGN6fuoTZHgFqG25f94L68Mszwue40JXvjGcb2/8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6356
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

--------------q8JPuniyTVOznUwkJLbqBjV0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/24/2024 01:11, Michal Wajdeczko wrote:
> Michal Wajdeczko (5):
>    drm/xe/guc: Add VF_CFG_SCHED_PRIORITY_KEY KLV definition
>    drm/xe/guc: Add VF_CFG_SCHED_PRIORITY to KLV helper
>    drm/xe/pf: Add functions to configure VF scheduling priority
>    drm/xe/pf: Allow to control scheduling priority using debugfs
>    drm/xe/pf: Adjust scheduling priority based on policy change
>
>   drivers/gpu/drm/xe/abi/guc_klvs_abi.h         | 13 ++++
>   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    | 76 +++++++++++++++++++
>   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h    |  3 +
>   .../gpu/drm/xe/xe_gt_sriov_pf_config_types.h  |  2 +
>   drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c   |  5 ++
>   drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c    | 25 +++++-
>   drivers/gpu/drm/xe/xe_guc_klv_helpers.c       |  2 +
>   7 files changed, 123 insertions(+), 3 deletions(-)

One nit in KLV documentation, but overall all looks good. For the series:
Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com 
<mailto:lukasz.laguna@intel.com>>
--------------q8JPuniyTVOznUwkJLbqBjV0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 10/24/2024 01:11, Michal Wajdeczko
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20241023231152.1815-1-michal.wajdeczko@intel.com">
      <pre wrap="" class="moz-quote-pre">Michal Wajdeczko (5):
  drm/xe/guc: Add VF_CFG_SCHED_PRIORITY_KEY KLV definition
  drm/xe/guc: Add VF_CFG_SCHED_PRIORITY to KLV helper
  drm/xe/pf: Add functions to configure VF scheduling priority
  drm/xe/pf: Allow to control scheduling priority using debugfs
  drm/xe/pf: Adjust scheduling priority based on policy change

 drivers/gpu/drm/xe/abi/guc_klvs_abi.h         | 13 ++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    | 76 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h    |  3 +
 .../gpu/drm/xe/xe_gt_sriov_pf_config_types.h  |  2 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c   |  5 ++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c    | 25 +++++-
 drivers/gpu/drm/xe/xe_guc_klv_helpers.c       |  2 +
 7 files changed, 123 insertions(+), 3 deletions(-)
</pre>
    </blockquote>
    <br>
    One nit in KLV documentation, but overall all looks good. For the
    series:<br>
    <span lang="en-US">Reviewed-by: </span><span lang="pl">L</span><span lang="en-US">ukasz </span><span lang="pl">L</span><span lang="en-US">aguna &lt;</span><a href="mailto:lukasz.laguna@intel.com"><span lang="en-US">lukasz.laguna@intel.com</span></a><span lang="en-US">&gt;</span><span style="white-space: pre-wrap">

</span>
  </body>
</html>

--------------q8JPuniyTVOznUwkJLbqBjV0--
