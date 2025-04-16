Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B670CC369BD
	for <intel-xe@archiver.kernel.org>; Wed, 16 Apr 2025 14:46:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54C6A10E270;
	Wed, 16 Apr 2025 14:46:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YD85VLiJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF71B10E270
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Apr 2025 14:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744814774; x=1776350774;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xivSgKky8Miav04/YWxZ6nvBxHABfhfgVkeVxWWztJU=;
 b=YD85VLiJF1KyoFOgd+qBMPzBb+qzipK+ut5PDTtI8cGNnnVnw4efU9hH
 KYsJfTXteYw45UTxdhFWqsqy+sFACwCYGlZxODCgwi7gWkZCEtqE7VUhz
 UIUnw93kqQq1eaavkNuekf5PvmNaIdC859OXfFTqgKiGsLEKF+3bn/dPC
 JpRrmeh+adJaxSLWrRLtU3HAGOWEEEkVyxJBSV/bz84c8CrA17cj8WLqa
 OlvbDkrvBgZUM92iwikmOU05+5/kwWETPhMDgOXmR6gyZaXdLk5avZ0En
 R07lf1LYbgiM6B20pf0gOmslwLUiSUcCwpSl/IVdiLzcXg+gbkUG3t+tU Q==;
X-CSE-ConnectionGUID: uMIJ/I9uTGicdFhGm8S3fw==
X-CSE-MsgGUID: UHhd8LF0Rx6k4+Ph3ZQEtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="45597448"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; d="scan'208";a="45597448"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 07:46:13 -0700
X-CSE-ConnectionGUID: pb1Di3zaT460+alZYYVSpA==
X-CSE-MsgGUID: WvC57Y+RRQibd/tu1uB+LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; d="scan'208";a="135490625"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 07:46:14 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 16 Apr 2025 07:46:12 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 16 Apr 2025 07:46:12 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 16 Apr 2025 07:46:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v9dXLBpD3YwwhSHF9rZuQco5QvBoS7RWxvwRNNo6mwzTjQWmi0IAjHf7B4UPH38kd8FWqPYzwcP2q58oCkF+TgWX1kAxMvFP08YGX17/7Cu/vYgfYNsAgMG/Fge2X3iIE88GKdg57nYx2ltsKQBCApMV38mDVL99AP+T0swmpywWPqyrFgTd19TYZdkuLUIer/XSfctJ4fV04NEW2AOrImhA6hk/21g1fejshkAhuEEEoK9/sK7/hZbZ+HWfON3a3rMLCXGgxgReXCPyRNX8ncCH2ZdJ0nMqZfJWCUrINz4raxg+NYtwRVpSmNCnYs/NEX66OLg2etETk4UWbYZgeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UVWzcNP/0BzOKDVF5OliC4J1AWLDWrKaeBZ8r+rNNoY=;
 b=rHxGIaehpIJ8QjJXFz3mOJM9Wqoezqb19mxuZDdlpDp8f10du5cbi4CE5XZbBTj7K0a9FXY3aT+DcqKRQj3lKR1MOQxM8iaIOo3q0jzlsxyLlBjQbHGvN+CkVck6hIAXSaSCdd5moY4GZVhvKfbdVE9AELNfyo4AUunXdtc4bZsBPCC7KJgccwjXfo/pefRbUW0Lgr3dmLJttibkgnvr9iEX0W5l8q4H7K6K3GeCvGROWtJ8kFmTfkvsHMjmPpmsBAxTlNzyV8crWgd8eRqfxSDrHrIPxPKYN9ZbJ2pw9R0J2Fcu0WZjlBAcKeRPPRsCip6pCGHHa+e0Eb75FvcfNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SA2PR11MB5130.namprd11.prod.outlook.com (2603:10b6:806:11d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.21; Wed, 16 Apr
 2025 14:45:56 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%4]) with mapi id 15.20.8655.022; Wed, 16 Apr 2025
 14:45:56 +0000
Message-ID: <83da2447-1242-4bb2-8039-ffd76d925c28@intel.com>
Date: Wed, 16 Apr 2025 20:15:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] drm/xe: Move xe_device_sysfs_init() to
 xe_pci_probe()
To: Raag Jadav <raag.jadav@intel.com>
CC: <lucas.demarchi@intel.com>, <rodrigo.vivi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>
References: <20250403174742.1294227-1-raag.jadav@intel.com>
 <20250403174742.1294227-2-raag.jadav@intel.com>
 <6a2068b5-d86e-4e8d-9c41-f47cc322e394@intel.com>
 <7fb3fcf0-3dc1-4d98-af23-58c9e77a47d9@intel.com>
 <Z_-LLx2Qb-iAouGF@black.fi.intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <Z_-LLx2Qb-iAouGF@black.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MAXP287CA0022.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::29) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SA2PR11MB5130:EE_
X-MS-Office365-Filtering-Correlation-Id: 656c7899-027d-4f56-f273-08dd7cf564ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NGNDMk1qYnpwNld4ZnY4ZC9GdFR5NTMwcHdkOHllYmp3c1R0ZmJIZ3d0NjQ1?=
 =?utf-8?B?aEw1SUllM0lSTUhpL1podk5saWhPNStvMjFERjhoOVhQQ1dHWDA5dUVMWGlv?=
 =?utf-8?B?OXpmOUljT1Nmamg3RkFPQmxSU25DbFBLdkFjRVd4WGp1d2poZDYxZ2dVRnBT?=
 =?utf-8?B?c1g3NEtIWVVYQ3lGZmpXMGFGUkFTSjJCNUFrem51U2FIOG5YTm9aOWxsRXdi?=
 =?utf-8?B?YkpZRGVoUU1TQndzYWhMaCtSUmJ0RzFuVDJSSUd6NkhDT3RyOUVmaEd6N1Jo?=
 =?utf-8?B?T0hjejZvL0VDSzdrUloveElmYWc1MERtSll6eUN3ZlNFc0RLRGdMUWlzNitJ?=
 =?utf-8?B?UzBSUDRpWFN0LzZLQU5JQjZDa1pZclp0cGROS2NmcW5VbmEyalNlWVRueHpw?=
 =?utf-8?B?RlZYUlE2aHBMcHJod0tTWitLQjZUZVlRZ01wTWFTZHdBQzhtcEtHZytHb2dY?=
 =?utf-8?B?YjFqM1JTTFFEc0JSVDJjanAyRDUrVmpyTitmZGJCRXc2aDFTdmMrU2w1clJW?=
 =?utf-8?B?blR2dUpEVW0xV2tVbGxPa1JVdUdWenFVRGdPcmZCeHJLMkRUZ2ZVZkdacE92?=
 =?utf-8?B?cDJLNEJKZUs0MVhiZGNvT29IMkVWWUJ3bE9wdGRKaEZZM0FoZzdnTWlweW1s?=
 =?utf-8?B?WThpOWlFdU5iNDM0ZmQ1dVU0cWk3VjBLUUVWTFd0Ym4yVnAzVi95bU0xWkZz?=
 =?utf-8?B?dCtvaVh3aCt2SnlqS1VQdHRTRDk5RTVYc1h4aUxtVnpYdXZ4cXNLdGRzNE9o?=
 =?utf-8?B?eTZwMWZOZlNVN2Q0dnI0QkRobGVkL0Rkc1k5RlBLTlhIQmNPV0VqQVNjUTll?=
 =?utf-8?B?SkdSZHc3Q3dZTzgxRTdjcklRT0p6TVU5RXpuZ3lmcnF2clc2STBOaFVzQ1F6?=
 =?utf-8?B?ODN1MEVhM1p6MFpNWkFrdTB6NCtCS3VKTURkNTFENVF6VE01bW01UWtJdTR1?=
 =?utf-8?B?RC8rTkFMQ2kzZVFxQllBanVpMktsZiswS1FZNndObXhtV1VPcHp6bVp2ejEr?=
 =?utf-8?B?YmFaUlArQVRqTjNkdCtnNFNKR2ZUbnZtRUVrQlpDTDAxL25WQjl6UjdwbVdO?=
 =?utf-8?B?dGFqMUNsZHprcDIweFFyTStKcUljN0lIQnFydWJqM1I4VDFEUURDN2VGUzF3?=
 =?utf-8?B?UEF3UzcvWlFVZFVkZGpXV3JPbyttcUZBQjBobTFLMUxuVkVHN3V2blF0ZFJs?=
 =?utf-8?B?Z2g0dU5jckxQTTUyZGtmRVdHR3Q2bTVqRERBa2ZzVURnZmJPZGhoajdldmZK?=
 =?utf-8?B?UDZPajZqd0NtWUU0TExFTWVTZnRiVXphNE1wNTVIZkFhVU5iRlJQSVh0RTYz?=
 =?utf-8?B?UkhicXNraXlTcVBSRThWc25tM0E3OENnNFg2MEQwWmU1WjFpSFpMZm02bVdL?=
 =?utf-8?B?Y0tkUWtncjZoZUZqUE96bzY5YmZRbnViRE9YaGt3VjROL0l1TzZ0NG1IejRw?=
 =?utf-8?B?ZzByN0Y0ZkE4VVlXbTk1eUJiRURSSzI5RkdnUDdxOGxwMEJVYnRuSzMySEd2?=
 =?utf-8?B?VllHeHZCV0NwdlZUcXNoenNOdEFGbmg2NlJ1SkhYRTBoTFBuNnByTFMzZHNz?=
 =?utf-8?B?bHpncnFGREhzeGVsWStmNmNKTGVZaFM4dEFheGF5OFNWM3RmWWg5QUZGS3hz?=
 =?utf-8?B?K2pvcU9tNng3RFFvdHRTbnp5cTZvK1hJendDN2doSEorZkhFN1Q5Z002d1Zj?=
 =?utf-8?B?OXlGU2llcW4ySVZEcDh2NTA4QllGdDFTcVZZY2ZGTS8rWXhKWSs0K1U0RlZq?=
 =?utf-8?B?Z2Fubkc3bUxJVjhHVGo0ekdOVmNsSVJDeHFtSUlHcUl2Z3RXQ0xNUTd2V3Qx?=
 =?utf-8?B?WFZEVFA0cHZoSlZJb1M1clpLd05udklEQXE5dTBCejYzamlJU3ZqTDUxZ3V4?=
 =?utf-8?B?dE45bHRsTXJiYUx1QVVWbEVMVjRpNVFGS2VXN3JKc1dyd25RNTgvWURMaVE3?=
 =?utf-8?Q?gFhVIp9qZgM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ckRqL1hmdTVzRlUreGFsb3lrNFQ5OWpGVC9mWHMraGVmdkhiYUEydDE1d3dq?=
 =?utf-8?B?TE4wL0xRV0hpU3Z0RTZoUDdxaDAwTWd3bm1oYWxlY3ZIdDUyV0MzZllJd0Nh?=
 =?utf-8?B?a0NxT0hicEhXZHhPTVA0ZUZmSTlqM1pOcFRYSi9qYmN5bCsvT2Z0eFptSkFC?=
 =?utf-8?B?Z3FBOEprMlk2b1R5dUlDNlpBQjc1NFhFN3o1YW4zVTZzWlpNNlhYMDM2OGpD?=
 =?utf-8?B?YjU1TnVwS080U3BJYzdtR3cyaTFKUmNLdWNVUHVhNGlNMm5xbERzbmVkdjY2?=
 =?utf-8?B?cEd4MkROdk5PcnN0YnV1Q0JibnBYRHN6ZWdCd3FQbFFiM0EwdkxURTVXRHA2?=
 =?utf-8?B?MUZ2ZE1tKzlMR014VFhydlp1NTdVU1ZZanMrTlhjcHlMWDVwRWZMOXg5U1Ra?=
 =?utf-8?B?SWRLZXdVcXpkbVdpL0ZMSjd1d2RBWmpLZENPSUllSHNVM3U1ZE9yRjNsK0V3?=
 =?utf-8?B?blQ1dndmSGcxTVlmeHhYaytmQUVrU2U4aDBmQ0pTYWNDd3E1cWhpU1F5NGlX?=
 =?utf-8?B?NEErRE1wRkt4RDgyRjlqRmpZNDg2VkMrREVxYnhtLzNMeWQ4Wk1XTTd4dGhX?=
 =?utf-8?B?Q2graHlab2NOeVVYdHRoNFpaeDExd0QydDducHV4Q3VPYkJic3pFQU1yKzM3?=
 =?utf-8?B?V1h2MXB5T1ZQN2lCRC9rblZGR3BtVVlyQnZkbDN4YnNnWTZqSDBrd0g5T1g2?=
 =?utf-8?B?VzkzRG1FajljK3kzejdOVmQzOTlHSVUwSm1vd0pVN2hqNDNaTmF0QzMvMXk1?=
 =?utf-8?B?V0Fib0R0enUwWW1XNE16Um1iTTU2bXd6S3I0bHpPU0JRVUJaRXYwUTY3UVFL?=
 =?utf-8?B?RWUxajVLY2o4OGw5Q0NLUUQyc1RQYUcxWWxaSzhtUEE4OUQ3d2tTb3BNWUdQ?=
 =?utf-8?B?cEgzeGthM0t3bWNvTXNwdWJ5R3RJQ1hBVVRhazAxdGIwVW1PZkxWYkdXTHJX?=
 =?utf-8?B?eUJmaitRTnVwL1F0a2drcEx5dUgwNXNpbVN3SXpRUkxuVzVjSmVwWVpzMmZJ?=
 =?utf-8?B?QTh5R0FaMTczYzhENy9pNFU0UG5MdTFYd2dkbHdDL2NUa3JyODFIZjNPaSts?=
 =?utf-8?B?aW9SRU43YjVaNVRCRUo4S0lNenpyeWkzUGRGVVlxZy9YM203d3d6ZXViYjRs?=
 =?utf-8?B?RXhuTll1RHViWW5VK3F6clZyWkZSdUNuT3dDeWJmZHFrbUNqdGpIN284Z1Zq?=
 =?utf-8?B?ekd3ZUtqcmVHbEEwb0s5TVo3TGRCd3BkUGxqWVIrOHpZcTJCQjlvOEJCaHQv?=
 =?utf-8?B?T3JjYmxkbUFDa2lyVFh4T0dMZ0lGMTljMkFCdXJ5aC8yUTdocHY4am1oQ21u?=
 =?utf-8?B?Z2d4RzdCWXpvVWtzQ213cWM0bDB1aVpXdEc0WnZOZkZLSkJTSjdZcHE3YXJ6?=
 =?utf-8?B?QU9COVoyZnUybGhyeVZpR0lmcTN5UWRpL0s3ZXJ5cnkvcWIvcWo0SUZZT1hC?=
 =?utf-8?B?WmoweFJaWi9uMVdmcW81dDZHTXFkSm00c3RkaUdUaWp6SHZkZ0t0OWdNbVJS?=
 =?utf-8?B?OG5zdElnUXlrYkwyY2lwTGM0YVNhaXR4VmZreUlNeW9NU0JwWEs1c2dmbTZt?=
 =?utf-8?B?RDFDYksrTlMyY3hFRkI5K0Q1WFhNL2c1NkE0V0xLcjV5U1NQelBZaWc4RGVx?=
 =?utf-8?B?aEg4eCtnQkF6aTlRYis0OVAvNmo3OEdVMWdLeGhGOEFseisxbG1wYmF6Rllh?=
 =?utf-8?B?c3I0Wm9qdU1BZlFXNG9xWmFrVzdnQ1ZsVWdTSlhYYlJUZW1BeUR6dDkzamJI?=
 =?utf-8?B?WnQ2WlZIU2szRzJnbWFMb1RwaFRhMXl6ekdqdnBSU0ZtYTZHT0Z3ZFJOeHZk?=
 =?utf-8?B?QlFMT3pJaTlyREpLalNmVS90K0JPRjVUZ1VuUFhpMDdsWEY0UkFjMXBKWXZN?=
 =?utf-8?B?eGV6dWJYUmhVOXNZTmNzVnFRYU1MbGZJZjFGOEt0NUxzK1h1Tk1iSzdKQ2Ux?=
 =?utf-8?B?VG5FM0wvOC9aaEpxNjJ3WUVRdEpraVUyRmRySzJUMFBtZExGTlpDdlVlOWpM?=
 =?utf-8?B?Zm8xUzdPMXMvd0xSWFV0TGJaYjlucS9YQjlrZit5ZEpqemkwb05OTmhuQUZ6?=
 =?utf-8?B?cUFzRXJoZXBOMWdQck96a2piM1NyNDhETFhMdndZMno3QUl1eS8yU0p2SzhN?=
 =?utf-8?Q?YCplJ4k4z4K3rsnqJYfmFFetc?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 656c7899-027d-4f56-f273-08dd7cf564ac
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 14:45:55.9275 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /oNTQoqYP5MnGuNXYiJQUW/bZz4+X5MzkBmeONtew9hn3VB004KCT734JzrAN6dvY6jJxtllqSf18+hzrxLoPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5130
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

Hi Raag

On 4/16/2025 4:19 PM, Raag Jadav wrote:
> On Wed, Apr 16, 2025 at 03:34:43PM +0530, Riana Tauro wrote:
>> On 4/16/2025 1:25 PM, Riana Tauro wrote:
>>> Hi Raag
>>>
>>> On 4/3/2025 11:17 PM, Raag Jadav wrote:
>>>> Move xe_device_sysfs_init() to xe_pci_probe() so that we can expose
>>>> non-PM attributes as well.
>>>>
>>>> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_device_sysfs.c | 11 +++++++----
>>>>    drivers/gpu/drm/xe/xe_pci.c          |  6 ++++++
>>>>    drivers/gpu/drm/xe/xe_pm.c           |  5 -----
>>>>    3 files changed, 13 insertions(+), 9 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/
>>>> xe/xe_device_sysfs.c
>>>> index 7efbd4c52791..d4c73acea1cf 100644
>>>> --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
>>>> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
>>>> @@ -67,7 +67,8 @@ static void xe_device_sysfs_fini(void *arg)
>>>>    {
>>>>        struct xe_device *xe = arg;
>>>> -    sysfs_remove_file(&xe->drm.dev->kobj,
>>>> &dev_attr_vram_d3cold_threshold.attr);
>>>> +    if (xe->d3cold.capable)
>>>> +        sysfs_remove_file(&xe->drm.dev->kobj,
>>>> &dev_attr_vram_d3cold_threshold.attr);
>>>>    }
>>>>    int xe_device_sysfs_init(struct xe_device *xe)
>>>> @@ -75,9 +76,11 @@ int xe_device_sysfs_init(struct xe_device *xe)
>>>>        struct device *dev = xe->drm.dev;
>>>>        int ret;
>>>> -    ret = sysfs_create_file(&dev->kobj,
>>>> &dev_attr_vram_d3cold_threshold.attr);
>>>> -    if (ret)
>>>> -        return ret;
>>>> +    if (xe->d3cold.capable) {
>>>> +        ret = sysfs_create_file(&dev->kobj,
>>>> &dev_attr_vram_d3cold_threshold.attr);
>>>> +        if (ret)
>>>> +            return ret;
>>>> +    }
>>>>        return devm_add_action_or_reset(dev, xe_device_sysfs_fini, xe);
>>>>    }
>>>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>>>> index 58347fa91841..246682b2a2be 100644
>>>> --- a/drivers/gpu/drm/xe/xe_pci.c
>>>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>>>> @@ -18,6 +18,7 @@
>>>>    #include "display/xe_display.h"
>>>>    #include "regs/xe_gt_regs.h"
>>>>    #include "xe_device.h"
>>>> +#include "xe_device_sysfs.h"
>>>>    #include "xe_drv.h"
>>>>    #include "xe_gt.h"
>>>>    #include "xe_gt_sriov_vf.h"
>>>> @@ -864,6 +865,11 @@ static int xe_pci_probe(struct pci_dev *pdev,
>>>> const struct pci_device_id *ent)
>>>>        if (err)
>>>>            goto err_driver_cleanup;
>>>> +    /* We have PM related attributes, so do it after xe_pm_init(). */
>>>> +    err = xe_device_sysfs_init(xe);
>>> Layering doesn't seem right. This should in xe_device_probe.
>>> d3cold capable can be moved to pm_init_early and this to device_probe
> 
> Are you sure if we can use ttm_manager_type() in pm_init_early()?

you need only d3cold.capable to setup sysfs. This call is using only pci 
calls. So this should work

xe->d3cold.capable = xe_pm_pci_d3cold_capable(xe);

Thanks
Riana>
>> +    if (err)
>>
>> Also this should be a goto
>>
>> if (err)
>>   	goto err_driver_cleanup;
> 
> Sure.
> 
> Raag

