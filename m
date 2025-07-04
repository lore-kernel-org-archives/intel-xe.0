Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 065AAC8303D
	for <intel-xe@archiver.kernel.org>; Fri,  4 Jul 2025 12:17:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B958710EA11;
	Fri,  4 Jul 2025 12:17:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BhdL1cCT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E109610EA0C
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Jul 2025 12:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751631425; x=1783167425;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rsggIyeYWTKQX2JfXZ9gBcfXmUyQF338tf/qtK2a5vs=;
 b=BhdL1cCTqHVFtL0J5rac2E4gHy27271ffrXMIT+NHocue/hUzxBoRvIK
 vmONtfLdSyxYVeyb9UXYLm8bIUbIgWEpp6LS6XD4acUK99KvzAaI5U2xD
 hH/Hixaqmo2SNuQAzN1pGrWpG17UYLzC2JM78zOHXEjovAIdBv2QbdUuS
 ZVf0JcTYTB5Yb1uLpr6sHqv1vLHx9eDZQ75gnC68bENg3zPyV6GhmjH/v
 stOKxpBF43lBYa1vZuqj5CJ52/59kxxUTVD/6m6fECnj4ImdgNDB68loX
 mG7V1u6QmVUKZGVuaR/7JV1r35B2EE9sWt23hil6p1rVy66hq1pnAoNd8 A==;
X-CSE-ConnectionGUID: Pq5XEnzlReq0Fa7y/IJAGw==
X-CSE-MsgGUID: dZszTftLSsi2D6ojymPyoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="65315245"
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; d="scan'208";a="65315245"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 05:17:04 -0700
X-CSE-ConnectionGUID: vrGnwbagShepBMnfj2uCuQ==
X-CSE-MsgGUID: F8/U1Z12RfKhgvDygh+xdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; d="scan'208";a="154043310"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 05:17:04 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 4 Jul 2025 05:17:04 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 4 Jul 2025 05:17:04 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.76)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 4 Jul 2025 05:17:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bBOKuF1amVw6jzTZM3/cWd4FY1xbxlWLW9GzIgb3MMEGAKzUDzRC2Ga2SvlidoHcjSd9usllrwXs3GPf2g8RPgEOFfk0muutpl3p3rXBxuT2t/RYzDrnkIkOSMofSRcMakXwNdWWC6Fe6UuUHzzIMpSYqVUSwFt+Arf2HskbffnCrxbg/WXEtW02cSpy7FZ8v3zOou2C5AudGGmR4SF2wHL73tkfKbt5gCQaKN6Itz11PHnadE4I0s1BO9L0DBsKFwvulAUKspQ0sVNv09Zyxru05mcEq6e4FFYEHZLpdkdpNqXF+GJA19jkA05rzcFYg5qn+ht4GMSh1/F4JXkwrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RfmA5iBu074m6/cvt0whUY14teR3IxZ4Y0Ho6kZbYvA=;
 b=jOCWmms8VJHYN1dD43MJ1Hg21Jzy74KJZd/miMTWhntFNNQhfne7s941fx3kPkHQodJKTBTXX12sy9tZWSdVohCk1fuOdRnOikKYXyr3Ubaqy64DdDfHO8BYGZbpD7Zq3hg6scS95mnbnRCTvSIlPrbpAKRSGU4bVYs3TX4UhuOgYZcsq0dm2F/NY6fKM9ElTxX7QdZslfqoIy7bmDwtlbuxShuTQCTKWOwzhzQSurcdrqog0dAm1+sEgUYrnIoBJT3UwZxtUw2RMPuROJJrsIE+UWWR7rKQCIjJSnmHI2cTU1vFJJfgP7qJf5ytapq3fm8XVPqrmVn3lStl5eY8XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by MN2PR11MB4726.namprd11.prod.outlook.com (2603:10b6:208:269::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Fri, 4 Jul
 2025 12:16:34 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%4]) with mapi id 15.20.8880.030; Fri, 4 Jul 2025
 12:16:34 +0000
Message-ID: <6f14ba3e-7809-4feb-8b63-4361446d5c95@intel.com>
Date: Fri, 4 Jul 2025 17:46:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe: Expose fan control and voltage regulator
 information
To: Raag Jadav <raag.jadav@intel.com>, <lucas.demarchi@intel.com>,
 <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <riana.tauro@intel.com>
References: <20250704112305.2479800-1-raag.jadav@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20250704112305.2479800-1-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0034.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::8) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|MN2PR11MB4726:EE_
X-MS-Office365-Filtering-Correlation-Id: 101a70fc-170b-40c4-32df-08ddbaf49ddc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZXhZTFNUellJOXJOL2JZK3h5cWFRdjJ1VzcxOURNYUtZb0d5MHIxdkNvczJl?=
 =?utf-8?B?cUZiVmtQd0YzdWVPRFFZdmMrNUdVOGVSWkwwT1VjdUVZUXpqTkU0U3I2ZWtV?=
 =?utf-8?B?cVB1WENDZXQwby8zYThLS0lVRCtjOWdvQmNaWjdMUk1iM1ppOVBZckRDQWV3?=
 =?utf-8?B?bDZHbjRiRXBYVExsMklicXhnK3c3NXpXM3ZEcG9CRHRVU0hUYUc2dnpjaDRE?=
 =?utf-8?B?dXhISG84dnFZSzhnZ3ZvSTVCNWM1TWNzMnBwWG55VG14SVpXQzdDcTN4RE9H?=
 =?utf-8?B?OWRXZnZsWVZEdTVEaGlkdmFZK0FzS01mU0IxRXo2MlFObDF5aTZiclVUREVk?=
 =?utf-8?B?Umo4NUtTZHk5RTBvS3Jtdm1HUE1LL1UzZW5UWVJxSnBxU1FUemVCRGkwOGRE?=
 =?utf-8?B?bDVnUVR3cThjcWZrQkRNSU5PMlRkSmJ4akt3OGpFQXh5SWQ0OXBPMUJEeXVp?=
 =?utf-8?B?M0FtMGNwVCtRTFZBUnExNWZscWJtUzQxVnVrRU9hRzFVUWU4U3A0Y21ZdDhL?=
 =?utf-8?B?VldSRnl3amI2VmtvR2JTcFJvcldGc3MzRmtzYU54WU9VRlU1ckw0VENvODc0?=
 =?utf-8?B?YUZUUVRNelZEOVMrcThnNUJnd3FpQ2VUQ0tBV1ZKNWpSQSswcnpUdCtHT3pQ?=
 =?utf-8?B?MityOWpGZzBtajB1enZlOFl2aGQ2dUJZNGlNVm04UENvanBxZmV6eFU2aG55?=
 =?utf-8?B?ZWVjL002WVMyZ2hrN2lvZDhzQk9GcWQ2dm01VGhZYlRnVXdRZ3RqcklIN2Vs?=
 =?utf-8?B?Y2pWaGhMSDlpQ0Z1RXcyRnhSUkpqcHRhREFrYnVZZEIrRDFyNXZ0ckVUSE9E?=
 =?utf-8?B?YWtJU0I2dktkQ2pIZi9aZ3RhL09seHdZZHRqaUlNSExtODZrY0hUMVl2OXFl?=
 =?utf-8?B?NVJQL1cwc3FYNlRvaXBRNmtCMDZsMmdKbVd2RG0zK2hKZWxGQitCbFNKT1p6?=
 =?utf-8?B?UVN2NUVWUnpXcVVtRnNvNlRwRUJsQUZlSHhpWkZZYkNsdVV2QzZoUDBlK2tL?=
 =?utf-8?B?dEU5Q0w5WVkwMVdOcFgxM0duQlA4Q09CVWxHTDd5cE5HcElUS2ZBN0RWMms2?=
 =?utf-8?B?cHJSd3J1eVhEUE1uaUxvVUZwaXNPR3pQT0JQV2c5NDFlbFNBd3VGUXdPWXV3?=
 =?utf-8?B?Q1NXaTdvWE1VTURqNHNxb0tRSFdzb0NKaHk1SHFwSEtBVUhmd1l6dGVOUU9V?=
 =?utf-8?B?MFhRdUtXeHBlSXpURXhEL1k5VjNqN3k3UWxJRUwrS01xK2JyRlBJenpLNTRB?=
 =?utf-8?B?OC9RaTNhbDlUOGU4TjVUSjA2S0JveHZwaktNbEtmcFNlU3pybkx1ZmlBWkRq?=
 =?utf-8?B?cW9iMTBGZUZoK2ZtVHNYc0VudCt0eERIMWRvM1czWE1TMFcyaDNpMUR3b2Ey?=
 =?utf-8?B?NUJTOFJHWEhZNlVwY29Ldlo0RC91U0ZPV1dCYm9WeksxQThBSDM4RFBGR0lW?=
 =?utf-8?B?Q2ZiNGQ3K0l4NjIvUjdXN2F5RWJpSUZpMWYwMHkxbTgydkxJZGhOUWNaQlRq?=
 =?utf-8?B?NlVqeHR3OGZVWHJDZlZtdlYva3VhUzNhSFZ5MDIyQWZweDJqZ3hiQkZCdDBk?=
 =?utf-8?B?bG9QemZlcmNSTWZyUldqMm93dnFIL2ZLMTEyVnRNc2lQcHlDalRyZm5ObDZ3?=
 =?utf-8?B?c2pYZHlONnBnb096Rkk0T3AwTXRObFl4NVBYZGhUT1M4MWVtSXRnMC9BWCtx?=
 =?utf-8?B?L1h1V0h2c1grMFBXRUR2bk43V1JlTFJTZXVTMXZwREtybmN5OFdNYktneUxP?=
 =?utf-8?B?YitVMlYxb1JDYnY0UWlJWDNyVElIb0MvQnR6R1R2RHJWOE5lbUJUMlhNY0po?=
 =?utf-8?B?dkpLcnd3bHl4ZVpEM3ZKRm5RYzRYMkE5MWh6TTZhbmNnVEQ3djlwQkFMTVVi?=
 =?utf-8?B?UWlLeWQ2aFUzMG9JSWRtQnRwSFJ4M3JRSXVqejZJZTVRMVFLVUlUblBwTEtl?=
 =?utf-8?Q?FUJV2hM/N5o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dHVuVWRrUnZUOFhlZzYwK2QyUmdHM2ZTRVdyeVdSdWpOKzcrUEZmOTBGelpU?=
 =?utf-8?B?VDVqVHdlSVQxdFZOWUVyRGhTK3A0VWVPZDJVcXU0T21rOUh1MGpiU3Q3a1FG?=
 =?utf-8?B?V0R6THFFOFcxckFJTmpTdk9idldTT0Y2Z012Ym1Ycyt2KzNpeCtMR3N4Uk1u?=
 =?utf-8?B?ZmF4Sm93QUJMUStLTUJEZEN1TnJCY0xQeGphYXcxSDl0QmV2YnZ2eVFlU3Ey?=
 =?utf-8?B?WS9LejVkaitDWXRDdHRjSm5hbWNmL20xc1R5ZGNETy9RMlF0TE5oT1BSWU5K?=
 =?utf-8?B?OG53WnhTNEFrcHhXL285VmsxQU5qdWJxVU9HQnZScEx6WENHWndkblBzU3dM?=
 =?utf-8?B?dE93bytYZjhOZ0dMMnZkU0krT2hMdjV3eVF3Rkw1aWNNUW56OFYvVHVkUW1M?=
 =?utf-8?B?bDRTdVRTeWVhRWdIcGdodGluaWtneFlhbTlkMFVOYzRGL0FQT1MvZmZFdVM4?=
 =?utf-8?B?TjVOU09lTUZyeFFRWmFybXBhb3BicGZlMWtxY2I5bUVNSFdmZHoyaHBBWmFp?=
 =?utf-8?B?MExwN29hTUMyeHkrL0MzQlhvZUErTTY2V2Zkb0M4UGROQ1Vwenlpb2xiTWR1?=
 =?utf-8?B?Rk9OWFJZS0hKbVR3eG5jd2NqN29wL1NxMXRYRWt2R0djNXkwb1ZGb3BUSVVT?=
 =?utf-8?B?SmJDWGh3OHMyOWVKMlhJY21WdTgyTXJTVHY5eEJVZEpJUFZFQm5UM0hOWDFX?=
 =?utf-8?B?VDRLTHc0NldkMnZ5cTN5ZStrNDVxdFlkdmxhdDV2dVorbnBBSUxBdDhWUURR?=
 =?utf-8?B?czNrc2JiU3hzVXJRSFhBbUNaVFVLVUxycUQ3alFzVHU5ZjBGcUFRdFZwbE1p?=
 =?utf-8?B?YlJuTnIyRWFyUmsvOG1TNi90RkRPd3p4eE9EN0tNTDNydTRwSkpWZWJ4SVVr?=
 =?utf-8?B?SlBlZFY4TnpRSGw2MWt0SUJhTXptSi92Z3BPS2xHOWZTVGY3TjgwQ3BzdURG?=
 =?utf-8?B?eEZxWm81YkVGYndGdU5jZDJaSnJmV0hjaDVOdVpJTERPdjNjbmxubjJwWVJt?=
 =?utf-8?B?emowUVkzV2lOUmw2QTVGSGs5MG1XaFlwQ2k2WldWYUs2SzRJTG1oSHpQdW5r?=
 =?utf-8?B?eVZVb0dpNjRiSlp6ZUcrTmhVN3dCRVdGalpJSWQ3TlhzL09OOXptSzJEdmdx?=
 =?utf-8?B?ZUVEN2VWQTJTeFJtTUxuKzlsREFoSDd1UHZUYkxyQ3JKTHNxU0xYTjVVQlVh?=
 =?utf-8?B?RnhEQnNCREEyaTBtb1ZUdGdDanl6dWE4bGlkeDVjT0lvdFZpYzhwdGdMdTk1?=
 =?utf-8?B?RzNvQTJoSy82SzhCQW51R0Era3F3dUxWRE0rYXppRnVFK3pwUkJCOTVxSmgy?=
 =?utf-8?B?Mng4ZEZnL01vMzZCbGNVMHNmeTNBQ1JmOVh4QXRuZzlwaXY3UUlwTHlaK2E2?=
 =?utf-8?B?emFVMnJJbmFZRm9HYzIrclI2eGtVWEhWTjg4VU9JQ3lhVzZDNFQ4d1BkVEd6?=
 =?utf-8?B?Vyt3djhHdloya0p0UDNmWHJzbWxvRmVLSldsQ0lpa2xCMnI4V2JwYjgyRng4?=
 =?utf-8?B?V2c4dy9Oc2p0VUhOQnY5N1hCKzV2RTdpYVd4L2xlNnh3TWJROW5rd2dmRzlN?=
 =?utf-8?B?c1pnWUxlOWRReXRxcEwxczlaSjR2U2RQaFRmem5OUjdndk1xWkh6VmNlNVB6?=
 =?utf-8?B?Z1FiNVRESFFZcWFWeHV5NnhvTERZclRSNkdoTXBVdmZ6MXFaNDR3ajd4aUds?=
 =?utf-8?B?N3lKby9lL0dXdkpGOWdUZ1oyUndOSzl4NGsySFRYWFQvNnFldnoxOWY2OGdx?=
 =?utf-8?B?SjlmQjBjVFlGVjdOTUhaN0I0dEx0MHE1Y2pjNGpmTy9oQ3NMcktBbUdrSy9D?=
 =?utf-8?B?SlMxQjY3QitnYmdUd1JiQ2MyZm52b3pDM3ZuMmlXUTRWaUVjbC9aMmljQ2dl?=
 =?utf-8?B?bG9hZmlFd01ZR1JUTUQyc1NLbnRXcTlNU2oyWFk1R1lXSy9DU2s4VVBvY2F6?=
 =?utf-8?B?VlpOMmNIWFBjUHpUSmRkMTA1L2Y4K0FWZlE2bDlwWFphSnQ1NE80djNMQ0RR?=
 =?utf-8?B?bjVjMFQrSXp2WkZuTzhIaE5NZDRkanRMVU81bWVGZUJRcWhESUM5ckNYd3Y0?=
 =?utf-8?B?bUc3NlNYSllkQXdRNXQ0bmh1RHZYWGJuU1hDVmtrZ1pxVmM3b0RDWGRnSXd0?=
 =?utf-8?B?Y3hzVXpXbVFEcDZyZjR2aXJEcDFGak1XcG45WnFMWVF2QW9JMXhZdkM5am5H?=
 =?utf-8?B?VkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 101a70fc-170b-40c4-32df-08ddbaf49ddc
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 12:16:34.3715 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dld1Qz3wWydQl2l+IdBi+rpqQc5GfACHMGOnlWjut2LvhUlYysVUpGev66dAGSycjjj5I8AQdZ+vjig+hfm4IA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4726
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


On 04-07-2025 16:53, Raag Jadav wrote:
> Expose sysfs attributes for late binding features which provide information
> about their support, provisioning and bound version to the user.
>
> v2: s/late_bind_fan_info/lb_fan_control_info (Badal)
>      s/late_bind_vr_info/lb_voltage_regulator_info (Badal)
>      s/LATE_BINDING/PCODE_LATE_BINDING (Badal)
>      Add VERSION_MASK macros (Badal)
>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device_sysfs.c | 121 ++++++++++++++++++++++++++-
>   drivers/gpu/drm/xe/xe_pcode_api.h    |  15 ++++
>   2 files changed, 135 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
> index b9440f8c781e..8a1bb2b7c951 100644
> --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
> @@ -24,6 +24,15 @@
>    *
>    * vram_d3cold_threshold - Report/change vram used threshold(in MB) below
>    * which vram save/restore is permissible during runtime D3cold entry/exit.
> + *
> + * lb_fan_control_info - Fan control information of the device in comma
> + * separated format as ``<supported>,<provisioned>,<version>`` with optional
> + * ``<version>`` field which is available only if provisioned by late binding.
> + *
> + * lb_voltage_regulator_info - Voltage regulator information of the device in
> + * comma separated format as ``<supported>,<provisioned>,<version>`` with
> + * optional ``<version>`` field which is available only if provisioned by late
> + * binding.
>    */
>   
>   static ssize_t
> @@ -65,6 +74,110 @@ vram_d3cold_threshold_store(struct device *dev, struct device_attribute *attr,
>   
>   static DEVICE_ATTR_RW(vram_d3cold_threshold);
>   
> +static ssize_t
> +lb_fan_control_info_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
> +	struct xe_tile *root = xe_device_get_root_tile(xe);
> +	u32 cap, ver_low = FAN_TABLE, ver_high = FAN_TABLE;
> +	bool supported, provisioned;
> +	int ret, len = 0;
> +
> +	xe_pm_runtime_get(xe);
> +
> +	ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_CAPABILITY_STATUS, 0),
> +			    &cap, NULL);
> +	if (ret)
> +		goto out;
> +
> +	supported = REG_FIELD_GET(V1_FAN_SUPPORTED, cap);
> +	provisioned = REG_FIELD_GET(V1_FAN_PROVISIONED, cap);
> +
> +	if (provisioned) {
> +		ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_VERSION_LOW, 0),
> +				    &ver_low, NULL);
> +		if (ret)
> +			goto out;
> +
> +		ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_VERSION_HIGH, 0),
> +				    &ver_high, NULL);
> +		if (ret)
> +			goto out;
> +	}
> +
> +	len += sysfs_emit_at(buf, len, "%u", supported);
> +	len += sysfs_emit_at(buf, len, ",%u", provisioned);
> +
> +	if (provisioned)
> +		len += sysfs_emit_at(buf, len, ",%u.%u.%u.%u",
> +				     REG_FIELD_GET(MAJOR_VERSION_MASK, ver_low),
> +				     REG_FIELD_GET(MINOR_VERSION_MASK, ver_low),
> +				     REG_FIELD_GET(HOTFIX_VERSION_MASK, ver_high),
> +				     REG_FIELD_GET(BUILD_VERSION_MASK, ver_high));
> +
> +	len += sysfs_emit_at(buf, len, "\n");
> +out:
> +	xe_pm_runtime_put(xe);
> +
> +	return ret ?: len;
> +}
> +static DEVICE_ATTR_ADMIN_RO(lb_fan_control_info);
> +
> +static ssize_t
> +lb_voltage_regulator_info_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
> +	struct xe_tile *root = xe_device_get_root_tile(xe);
> +	u32 cap, ver_low = VR_CONFIG, ver_high = VR_CONFIG;
> +	bool supported, provisioned;
> +	int ret, len = 0;
> +
> +	xe_pm_runtime_get(xe);
> +
> +	ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_CAPABILITY_STATUS, 0),
> +			    &cap, NULL);
> +	if (ret)
> +		goto out;
> +
> +	supported = REG_FIELD_GET(VR_PARAMS_SUPPORTED, cap);
> +	provisioned = REG_FIELD_GET(VR_PARAMS_PROVISIONED, cap);
> +
> +	if (provisioned) {
> +		ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_VERSION_LOW, 0),
> +				    &ver_low, NULL);
> +		if (ret)
> +			goto out;
> +
> +		ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_VERSION_HIGH, 0),
> +				    &ver_high, NULL);
> +		if (ret)
> +			goto out;
> +	}
> +
> +	len += sysfs_emit_at(buf, len, "%u", supported);
> +	len += sysfs_emit_at(buf, len, ",%u", provisioned);
> +
> +	if (provisioned)
> +		len += sysfs_emit_at(buf, len, ",%u.%u.%u.%u",
> +				     REG_FIELD_GET(MAJOR_VERSION_MASK, ver_low),
> +				     REG_FIELD_GET(MINOR_VERSION_MASK, ver_low),
> +				     REG_FIELD_GET(HOTFIX_VERSION_MASK, ver_high),
> +				     REG_FIELD_GET(BUILD_VERSION_MASK, ver_high));
> +
> +	len += sysfs_emit_at(buf, len, "\n");
> +out:
> +	xe_pm_runtime_put(xe);
> +
> +	return ret ?: len;
> +}
> +static DEVICE_ATTR_ADMIN_RO(lb_voltage_regulator_info);
> +
> +static const struct attribute *late_bind_attrs[] = {
> +	&dev_attr_lb_fan_control_info.attr,
> +	&dev_attr_lb_voltage_regulator_info.attr,
> +	NULL
> +};
> +
>   /**
>    * DOC: PCIe Gen5 Limitations
>    *
> @@ -151,8 +264,10 @@ static void xe_device_sysfs_fini(void *arg)
>   	if (xe->d3cold.capable)
>   		sysfs_remove_file(&xe->drm.dev->kobj, &dev_attr_vram_d3cold_threshold.attr);
>   
> -	if (xe->info.platform == XE_BATTLEMAGE)
> +	if (xe->info.platform == XE_BATTLEMAGE) {
>   		sysfs_remove_files(&xe->drm.dev->kobj, auto_link_downgrade_attrs);
> +		sysfs_remove_files(&xe->drm.dev->kobj, late_bind_attrs);
> +	}
>   }
>   
>   int xe_device_sysfs_init(struct xe_device *xe)
> @@ -170,6 +285,10 @@ int xe_device_sysfs_init(struct xe_device *xe)
>   		ret = sysfs_create_files(&dev->kobj, auto_link_downgrade_attrs);
>   		if (ret)
>   			return ret;
> +
> +		ret = sysfs_create_files(&dev->kobj, late_bind_attrs);
> +		if (ret)
> +			return ret;
>   	}
>   
>   	return devm_add_action_or_reset(dev, xe_device_sysfs_fini, xe);
> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
> index 0befdea77db1..92bfcba51e19 100644
> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> @@ -50,6 +50,21 @@
>   #define	READ_PL_FROM_FW				0x1
>   #define	READ_PL_FROM_PCODE			0x0
>   
> +#define   PCODE_LATE_BINDING			0x5C
> +#define     GET_CAPABILITY_STATUS		0x0
> +#define       V1_FAN_SUPPORTED			REG_BIT(0)
> +#define       VR_PARAMS_SUPPORTED		REG_BIT(3)
> +#define       V1_FAN_PROVISIONED		REG_BIT(16)
> +#define       VR_PARAMS_PROVISIONED		REG_BIT(19)
> +#define     GET_VERSION_LOW			0x1
> +#define     GET_VERSION_HIGH			0x2
> +#define       MAJOR_VERSION_MASK		REG_GENMASK(31, 16)
> +#define       MINOR_VERSION_MASK		REG_GENMASK(15, 0)
> +#define       HOTFIX_VERSION_MASK		REG_GENMASK(31, 16)
> +#define       BUILD_VERSION_MASK		REG_GENMASK(15, 0)
> +#define       FAN_TABLE				1
> +#define       VR_CONFIG				2
> +

Looks good to me.
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>

>   #define   PCODE_FREQUENCY_CONFIG		0x6e
>   /* Frequency Config Sub Commands (param1) */
>   #define     PCODE_MBOX_FC_SC_READ_FUSED_P0	0x0
