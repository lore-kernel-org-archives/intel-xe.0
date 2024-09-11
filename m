Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BE4DEE49A0
	for <intel-xe@archiver.kernel.org>; Wed, 11 Sep 2024 13:11:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 967CD10EA0C;
	Wed, 11 Sep 2024 13:11:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n/CzeFZN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A56A10EA0C
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Sep 2024 13:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726060313; x=1757596313;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=CyyytmZSeM/x/reygfGluWeFsj8VUQld9NWtPoxZwqc=;
 b=n/CzeFZNfSQOIQr9x/v660+7/IQ5w7KYwyFo9tHc8hZKmLAEk8C7zgq8
 2K+Y/n8Y4iKJ+MCNhq8z9RYRD4UFJCojqaKDPILFAwCHp/d8y80//2Xse
 uqDO4es2vZYGSEzlMhM1M9As9iMj1G6R0sWwhHiyDPNXcl63etXxjXGY/
 0xoWIDtl31kjTaBvRL87XLsH/Wf64nNjMaGJ3hVqC/nxCtJGHSM+bKihq
 O/UjqbQ8y1gH7jD+S6KAYsjyr8aw0Bm4eoEnoKLhXKjjaFpdRWaMQCzcc
 aF8bRJajgDT8kTZQx8q0myxz2yfiEBOoxBNzPPjFdM40JC4iDACZFegG5 A==;
X-CSE-ConnectionGUID: YkG10zSQRPS+jQhI7u7w+Q==
X-CSE-MsgGUID: sRfRUW10TkKQCDZ7LZOfwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24398844"
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; d="scan'208,217";a="24398844"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 06:11:52 -0700
X-CSE-ConnectionGUID: +n+ALChrTwSFMJfNIAdXHQ==
X-CSE-MsgGUID: UEJgzzdRRnmDg0U9ibP8rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
 d="scan'208,217";a="104827844"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Sep 2024 06:11:50 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Sep 2024 06:11:49 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Sep 2024 06:11:49 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Sep 2024 06:11:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NouxjP5sUfG/c3EQn87KsG0CW1xnI0g8cMboHN6hz/Nyzhjnwf0GVv48OVFqnZ5uQAjBt3S12k35Rc9SpfbvzvbqPA4YUBJhz20F4ZvYfmaUt6JlMK+UktKFlJqGNE5dxBu0LX5iMT2vwAavpo944MeGHI5Z2HoB5sAbdIaw9vgVxze6ApG3cuTggaWB98g+Jgd0EGY9irhVp6q7N8snji67uR0xKYhMV7OQvObudoPtiMnFOllRfITpBXa3YpuFf/BuuYp+lPYrd4+GAFL8VL5wWrosYSmTcDJAXpIzpRrEpciiTTC0vyIhdNeYHjQKcgeRlDx+4V/cbjqqmpgWvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wC6l4PlgkiF95Ju+JIsHthp14UQ1DTsZ7fVmjNhagZc=;
 b=RiahGgdLWB4lFjdZebdI8YLGzr1LljQlqsvTrQYO7S5Zo3HUer53dWBQAWphcq6GWTRPMe9XbFd+qQTP5sAQbhHcL+HCcrSsKtlR1s0LxJ3p4SGvdC6tfUiNMtGpLOlGGLSsqe60KW4TTrA8pR8VBEstq+nv/hlgd3ADzgSQ1vaQvHqS9llnMFE7AclsG04PYN069gzYxZiBt3ul4BgeLpLwURvTJQ0ymzl7seTsW8hnBs2OfpwUV79ZC7YQlI04MB91W9RIN6F4YnlOm8Zb56RtsuwQ57C6eRZ5Z53EmtW99RuRZoifkzOO8RKQfY0kvW/zV/HTLfLKjdvnylYO5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3238.namprd11.prod.outlook.com (2603:10b6:a03:7e::30)
 by PH7PR11MB5941.namprd11.prod.outlook.com (2603:10b6:510:13d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Wed, 11 Sep
 2024 13:11:44 +0000
Received: from BYAPR11MB3238.namprd11.prod.outlook.com
 ([fe80::ba3:e9e3:27c2:bd03]) by BYAPR11MB3238.namprd11.prod.outlook.com
 ([fe80::ba3:e9e3:27c2:bd03%7]) with mapi id 15.20.7939.022; Wed, 11 Sep 2024
 13:11:44 +0000
Content-Type: multipart/alternative;
 boundary="------------pWOCtPjVOM49ojSGk3GL0Ie5"
Message-ID: <570df84e-44b3-42ec-8ad5-313865ed585a@intel.com>
Date: Wed, 11 Sep 2024 18:41:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/pciid: Add new PCI id for ARL
To: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20240911092657.2348978-1-dnyaneshwar.bhadane@intel.com>
Content-Language: en-US
From: "Pottumuttu, Sai Teja" <sai.teja.pottumuttu@intel.com>
In-Reply-To: <20240911092657.2348978-1-dnyaneshwar.bhadane@intel.com>
X-ClientProxiedBy: MA0PR01CA0107.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::15) To BYAPR11MB3238.namprd11.prod.outlook.com
 (2603:10b6:a03:7e::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3238:EE_|PH7PR11MB5941:EE_
X-MS-Office365-Filtering-Correlation-Id: d69de13c-062d-46f0-4748-08dcd2634852
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bTNJTXFYbzl3U09oUkFLUDQ3bWE0NTdQTGY4VmIrYjk5R2R5eVRNZFhhOWhz?=
 =?utf-8?B?WVpXQmNkSXZVY0VKYWN6aE1qQmtnWU4vWFpZMnQ5QkN2cDBUNllDZ2ozSUE2?=
 =?utf-8?B?OU14cXlhREljRFE5TkswYTdXTXNDNUlYOXNLQnNEeXRIUzR3R0pXUFFTNTg4?=
 =?utf-8?B?cjczdVRFb2ppQUN6VWEySDJlbzVVdW1hT2NQbDJRc1JNeWVYTnZWb3ZScmxH?=
 =?utf-8?B?N29hMGRLWDBtNnA4ZUpTRDl1M2d0TGlXTHoxYXdFZ3ZtVDI0NlZZcGg0OXAw?=
 =?utf-8?B?dVpoTk4yZVM2UlY3eTJkZnR0bG5Na05idWdRMWc3cXNmRnZXdG9RTU43d3pK?=
 =?utf-8?B?eGd2c1FpRUJkZVhYSDl0OWlQNUtxQTc5VkFWR2c5dXV2OU5PQ2poMXRKa3ZQ?=
 =?utf-8?B?a0g1Z1NzNVZTNTZ2cXZHRFpQYjJPdGNrbEx1NWNBMjJuUUk1U2wvV1hZNWRR?=
 =?utf-8?B?eTE2bVRNK1ZJTzFuRStTZlpYM3pNMHAzMjY2SDJiVVFGdzZreHI0akdSMUU4?=
 =?utf-8?B?RGtkSjhUMWxud0pYeSthalZzbkNYTTh4cFdJeUlwYXZNamx2bVZCMnZpbEFk?=
 =?utf-8?B?NCt3TVVDN2VaNEgxRkJ0M1VuOEp0Q1FYMVFjSGEzK1l6Nm1VZ2J3WnNLR0VT?=
 =?utf-8?B?OHZuOXVyZEVaWWp1VmsxZWFPZWZxdjRJN0ZGamhCVHljVWc5N2FqTm9BNnJt?=
 =?utf-8?B?L05LVTZHcUFMdWFiUFJDMldtVlpLQ0loUnRuYm04Q1pSdnIwKzdwelArcmpT?=
 =?utf-8?B?akNHamVpcko5K2RLUU5TMUJGQldHbk5RMm1rVkNtM0JQcmQzQk1jWkJrc1ZS?=
 =?utf-8?B?dU9ZVTBMN3J5bXY1aG1TRlFzQWc0NFFjRzlCVnYvbndqaW00Zy9wUXVqRjk2?=
 =?utf-8?B?Ukt4aU9pVXkyblZHR2ZHTWlwVlRTQjJML2R1RlZtdGV5Mjd4bkgwbmYyQjJX?=
 =?utf-8?B?QlZJZjR6c3VkVm9FU3lWYTQ2YkhSV3d3K2lKVzhENnpWbmc3WlVEcTRneGdG?=
 =?utf-8?B?U25zREg2RWtqU25WbkwyUG9YT1NHNytPNSttL3JSdEhXMi9oVFBDVjc3Rlo4?=
 =?utf-8?B?UDRKZllVeEVNbHV1cXloUjhHMzcyb3QzdmF6R2VnVlExc2REeGhpU2FUUHkz?=
 =?utf-8?B?NUYrK05lbEh1dHN1L1NBV1NSNjVPVi96TXZ3Nk54am5OVmdVMDZkVW9pWVBD?=
 =?utf-8?B?ajQ3eXBVY0Zrb3RLS2ZONFhmUU9aNGp3RXpqOTNOaExtTWI5ZjJ2N2ZUYVBG?=
 =?utf-8?B?ZlBHM3ZiUDhZdVErK21ObkZCcVhXMkcrR0JRc3pNZEtJREpVakZHT2FRTllq?=
 =?utf-8?B?Y0VNTzJqVHFtRTBNTXFYQjNTT21sTU43UU9rUlBlZmtnaUx0VHB5a3YvTU1T?=
 =?utf-8?B?YmNVYmlhRVhjLzFLem91WjMzcWU5c2QxcVd5bnRPck1tbUdsNEptaDNPU21m?=
 =?utf-8?B?b1VubWkxbHFKdjB5UDBXVDBONmhzZ1FxdEgvVmtxQjdFS1R5OS9uZEpmY2dO?=
 =?utf-8?B?UEJTWXdWVzhKaEkwd1pqWnlVNmRzYTUzK1F1dkxEK3VQdnR2QTVpaFZMTXBC?=
 =?utf-8?B?SzYzZHZ4eEVPa3VkZW9ZV3NWOEc3b2F6Mll5dkVxQm9UelI5Z1hLeEVWem1j?=
 =?utf-8?B?YlB2T1BTUUtLTWVIdHR3UW45SXRYU1BFbHhiaFZOYWRsaGhQQXJWOUNab21F?=
 =?utf-8?B?MDdsbW51WHVQSHJQZWVuNG5qamJROGUvWlQ5cFJMVCt5eXI1U2hhay82djNr?=
 =?utf-8?B?cXdBYmtIdEdzdjBYdnNBeDA0OWVGMktITy93RnRpUHBDNllSRDBIcm9BTjFT?=
 =?utf-8?B?Vm5CUHNZdkMxcGdOS0EzQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3238.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?djU5MTlKalRZRWN5bFNNVk9xYWZKSDdZMjdBUzhoRFR0eHd4bm1xNjkrODVH?=
 =?utf-8?B?dzR5cVYvUmlnY1REUzJwaERZOXZMQUxzQ2hhV01mQTZPV1hJTHB6TEFqR3RC?=
 =?utf-8?B?T2NPY1d2NmZua0xwTDRGeHdwZnJtWkUvT3N2cGdOMisyM1BDdHBsTzRMQVQ3?=
 =?utf-8?B?M0IrQnBjUnI4NWdqNGJGYTgreDJmSm9kQXBoYWNCZXlRWHRnU00rd08wVUNh?=
 =?utf-8?B?SFVQVkpMWGZ0RGZnZklvK001ck1HdW1TVUFxTnhaZVh1TS9XaUNBb0xzcUlx?=
 =?utf-8?B?L3ZIQitnTTZrNTdOQlAwTW80UHhyUHNnbmRsL1RjcS9zVzU2Yit6dmErUEpO?=
 =?utf-8?B?MXVrVXFUL3BMeGloVG5ZVkRBN012b0RUbGtPVTBZdThFMUtwV1dFR0lCaVlX?=
 =?utf-8?B?T1U2d1NBVVVTZDVIVVlMalY3dDNWZk5aMTZjVlpQN2NjT2FGSVZQWGU4L3ht?=
 =?utf-8?B?TUt1TkJ2b2ZGSjBVZVlrcnl6ZTF2SVZQZXpJTmtnaGdQUWtSVTVoQnVRRjVR?=
 =?utf-8?B?dlVMdFEyamVMeUVHOUNKUkNHRWRyTW5admU5RmVYaGNYa2k5OW0yRW9lSEww?=
 =?utf-8?B?bCtvVGtpdHNoQWhmcjBGYUhycW9sRDYzQkN3eVQ1N0VOdDVNbVBjaEJvTkI5?=
 =?utf-8?B?dUZwT2xUbkN6TXI1OGhOYkVKaGlxajZlYVJYSUZ4bmVwSHV4VCtUSTlJcEFC?=
 =?utf-8?B?aThLTUl6VktyaXE4WmZFcFUrT1RXUy9lMlNta2ZZQkk1SkYxOEF0ck8yMTlK?=
 =?utf-8?B?b1prNXE2NFJzdTh1S3pJUFFIZmR0bWtLdFFzbGQ3UjVuSXNjYTZQNURKN3Bz?=
 =?utf-8?B?WUZaQ25iVVB2SnlGcDN0cVY1OUlpTHpkZzhjQXk4WEhZcW5CSkdGamp6aXRE?=
 =?utf-8?B?akdLcXp1ajAxT0Fic29VZEp1dngyNGc5ZzJkTWhBK3FBMG5BaFRiVStFZmVu?=
 =?utf-8?B?QzdFNlRmbzU1MDByNXdGTWo3MXYxRnllRFV3aDgwRklZRkQzaEwxaFpVTWFv?=
 =?utf-8?B?NXpKZTRXSXpiRkMwV3lrL0ZZRnJndDQyRGxaMWdyKzVFWUd0c3VDYmRlYWd6?=
 =?utf-8?B?WTNwNjZhN1dTR3lmV0NFZCt2bC9iYkhWMitzZE44VkNXL1hVdXJPaHdxQzJ4?=
 =?utf-8?B?RWMvOEJmZTN1TmFFUm1xc2gzY1p2bmkvRlQxWkxMRHNBZmxvanBiWmJOQkJa?=
 =?utf-8?B?dWFwTnN3ckRWWVp2SlJQUnBkVGl5eG9XeXdNR2liWDhFQVJtckdZdkUvYmIx?=
 =?utf-8?B?QnN1Y0N4LzljS1lhQmdCa2lnUmliWStIWVhwblVZbFlSbzNhQWxEWjVXSDhi?=
 =?utf-8?B?U0dIWjJoTWRoR1lNTVhtK1hxQmpkTm1KZjJ5SFpDL25vcWtWcU1pdGp0UlZz?=
 =?utf-8?B?VzAvUVhtcmtyRmZrazNxRXc3N2JoRjRhYVU1OXJwU3FuVHZib3BzUzZOS282?=
 =?utf-8?B?V3htL1ludWwzZEdtVVJqeXk2UzR2bTM3L1YrM2ROS0pHV0hmYWZOV25ITzMw?=
 =?utf-8?B?WjBxdkh5dHVXSmQzMVRmMXFxRDRaVzUwczV1bFRFUFVHWU5BaDBOa1lCd3pp?=
 =?utf-8?B?dkpWR1lwVW5QY1l0bzZvajFuUU5aTDY1VUlxcC8yUzZHM0RBZzdqMVA2TFpa?=
 =?utf-8?B?ZVhqcFhPU0JQVUZQbnI0VVlBblNPRzBaMGt6bStsNys2WWtGNFdtdkpHZmw0?=
 =?utf-8?B?aUhhTG4vWFpYT1poV0R6Q2NkOWFuQ0Z6b3dQZGFsaG1XZklvdzlITGc4anNN?=
 =?utf-8?B?R3dLcmloSlZOTVhLUkVjQ1BkdWZBNWxWTks2T3phYU5yNnd0ZVNEZnI1YWNh?=
 =?utf-8?B?WGhkbmxzeDJPcHIrMTVuWXpOazE5SkhubXZqVFhpdGpDNUQwcVVxeDM1UjlI?=
 =?utf-8?B?L29nZnhqRE1GNXZSYXcxWnE4ODN3TktBdDlteFUzMk5TU2x6VGlWMTNwY0ps?=
 =?utf-8?B?cXd1VmNwSDFzSzBwVHcyYTMrMWlVTzVUenhHa3Y5RFk0aUVzdDlHblFDUTFo?=
 =?utf-8?B?M1VqeWd3d3RDdS9VMjgrZU8rL0ZJeFg2VXYyM2tJeGkwYlovQlhOSnI4SHVj?=
 =?utf-8?B?bUoxWGZYN1NZVzUybHh2N3Mwd1cyZnB4c2FUbEhpampaSU1oN0hicDNHSDgw?=
 =?utf-8?B?RTBMV1JRK1lpQ1NuU0FwU0MwcU5KL3p0aGxVWHJNcjliYUxKZitsZmRQMjda?=
 =?utf-8?B?aFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d69de13c-062d-46f0-4748-08dcd2634852
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3238.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 13:11:44.1574 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oj8zcVIFMSj71xaO7C9Qk39BMEardflS4kL9resR/JdSuqeINYCJF5ht0juEdeHp3qGabAjxicaheJ2uZ7c017t1g/WSREsgkTnPnzlsIoE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5941
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

--------------pWOCtPjVOM49ojSGk3GL0Ie5
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 11-09-2024 14:56, Dnyaneshwar Bhadane wrote:
> Add new PCI id for ARL platform.
>
> Signed-off-by: Dnyaneshwar Bhadane<dnyaneshwar.bhadane@intel.com>
> ---
>   include/drm/intel/xe_pciids.h | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/include/drm/intel/xe_pciids.h b/include/drm/intel/xe_pciids.h
> index 79001afa7d27d..5758924a5b4ca 100644
> --- a/include/drm/intel/xe_pciids.h
> +++ b/include/drm/intel/xe_pciids.h
> @@ -181,7 +181,8 @@
>   	MACRO__(0x7D41, ## __VA_ARGS__),	\
>   	MACRO__(0x7D51, ## __VA_ARGS__),        \
>   	MACRO__(0x7D67, ## __VA_ARGS__),	\
> -	MACRO__(0x7DD1, ## __VA_ARGS__)
> +	MACRO__(0x7DD1, ## __VA_ARGS__),	\
> +	MACRO__(0xB650, ## __VA_ARGS__)
This should be 0xB640
>   
>   /* MTL */
>   #define XE_MTL_IDS(MACRO__, ...)		\

Thank You
Sai Teja

--------------pWOCtPjVOM49ojSGk3GL0Ie5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 11-09-2024 14:56, Dnyaneshwar
      Bhadane wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20240911092657.2348978-1-dnyaneshwar.bhadane@intel.com">
      <pre class="moz-quote-pre" wrap="">Add new PCI id for ARL platform.

Signed-off-by: Dnyaneshwar Bhadane <a class="moz-txt-link-rfc2396E" href="mailto:dnyaneshwar.bhadane@intel.com">&lt;dnyaneshwar.bhadane@intel.com&gt;</a>
---
 include/drm/intel/xe_pciids.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/drm/intel/xe_pciids.h b/include/drm/intel/xe_pciids.h
index 79001afa7d27d..5758924a5b4ca 100644
--- a/include/drm/intel/xe_pciids.h
+++ b/include/drm/intel/xe_pciids.h
@@ -181,7 +181,8 @@
 	MACRO__(0x7D41, ## __VA_ARGS__),	\
 	MACRO__(0x7D51, ## __VA_ARGS__),        \
 	MACRO__(0x7D67, ## __VA_ARGS__),	\
-	MACRO__(0x7DD1, ## __VA_ARGS__)
+	MACRO__(0x7DD1, ## __VA_ARGS__),	\
+	MACRO__(0xB650, ## __VA_ARGS__)</pre>
    </blockquote>
    This should be 0xB640<br>
    <blockquote type="cite" cite="mid:20240911092657.2348978-1-dnyaneshwar.bhadane@intel.com">
      <pre class="moz-quote-pre" wrap="">
 
 /* MTL */
 #define XE_MTL_IDS(MACRO__, ...)		\</pre>
    </blockquote>
    <p>Thank You<br>
      Sai Teja<span style="white-space: pre-wrap">
</span></p>
  </body>
</html>

--------------pWOCtPjVOM49ojSGk3GL0Ie5--
