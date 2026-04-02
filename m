Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1A4BD3943C
	for <intel-xe@archiver.kernel.org>; Thu,  2 Apr 2026 15:31:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7506F10E3C9;
	Thu,  2 Apr 2026 15:31:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L2wF5/13";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3E5810E3C9
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Apr 2026 15:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775143864; x=1806679864;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XihZjZX5dgUfoONL5Xl7EQj0NFnmLBVXCh+zYAadays=;
 b=L2wF5/134hioz8aU9moB6AiekVo2kqmUZm+KU9Vf2dD8EgMLZRy2fGoY
 UqJtc5J4aLyma4WYavI/IrB0O3QNnA5Dh7m1iZNMMnslDfdjEya6SyRDB
 rb01j2ceSt+9EveN8my/UXFe2uKUyzS68vuJiH3/tXNfKOdo0mA7Ofnxz
 OTqQmyvvmniRzuAtbaYHRM1+1gdJOCpz0veSg0rROyX0OYwPT0K3HrDQa
 ulOhVkfax6fSDJjZzH51P7XGHspZGKjgiNFLnJFxKP+pdnpM11I3ZCYFf
 4igRDHrzpC4j/KQOJAHeorRoB1l8WHjbDi6Gu5TWl38DJeFQLzH6Vn448 w==;
X-CSE-ConnectionGUID: nis4X+R2Qcy91C45/cK2vw==
X-CSE-MsgGUID: /E2PdGJ1R3iQ0nuzxomxKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="75925737"
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="75925737"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 08:31:04 -0700
X-CSE-ConnectionGUID: 5fO7R6A0RaCJd0JT5EpZhQ==
X-CSE-MsgGUID: kdpfe+ePQwiCJE/fbBjYQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="231406920"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 08:31:03 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 08:31:03 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 2 Apr 2026 08:31:03 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.71) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 08:31:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e52a5aX4X+E6B9RPAWqEeq78agaDVye5GcEuE2sYBqsVzrHlSVSoGJC6VHMp9c9lBhIDcTuCcm1bgprrz+916b33cnilAMPrazFYdl3DVJysAxD8DHWFdQ2iPEX36Q98fQDAutc+F1P4AhqOud133Q0d3130ucQ/QsPmD4VcmZjymg6iUKYLUTLCVGwMK8kpTppK9gf8Ifey/tbENNcjh+SN4Iqwc2x1aam+CUZC30lEPnrLOJuK/O8kXussc4H+kgkqnDVq69IuWPTnSopR7o+2zYxrb893+kb5zbWoZtwTh9AsnCrIiMPOidwLwt52BPQWu01f74/GApjew30YTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SAjkv52k70swGMu9Tyop/aqjK5ZY6CDbsFI24wLBQHQ=;
 b=E9MxO+d01eFubpFzo/7lmLzEDjyOtDODfFq46/zSI6MvjXnSEYlYB8yQyhnq5Z0leZQ8h65qR/snKqDseYEM9faHdmv/YsjQGpTltQ3CljrbJsGPXYeBftxvkhTJQ0ScJgt0mIfmCDRV6pHm292fDsE/0Kc5FsqekAjOcu2AgV6lE+28mHeuFSH+862d3jsYmV+W+B9pd61xJhnG89+G4WdZ3GeB9r8ONkS0clymzFzJ0ttQVWKMFrljw3XYTtmeqh2aKeyuoaLEp29i3D3X+phofWa6ctmfGWFcki7PGaIXj7cQfjtXztfb06sa5lLiBr+c5ZGMrqCBXmAwq5fnMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DS3PR11MB9796.namprd11.prod.outlook.com (2603:10b6:8:363::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.21; Thu, 2 Apr
 2026 15:30:58 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%3]) with mapi id 15.20.9769.018; Thu, 2 Apr 2026
 15:30:58 +0000
Message-ID: <104fcd4c-0655-4122-af6e-34e0198213e2@intel.com>
Date: Thu, 2 Apr 2026 17:30:52 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] drm/xe/mm: Add batch buffer allocation functions
 for xe_mem_pool manager
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Maarten Lankhorst <dev@lankhorst.se>
References: <20260401161528.1990499-1-satyanarayana.k.v.p@intel.com>
 <20260401161528.1990499-3-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260401161528.1990499-3-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VIZP296CA0009.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:2a1::9) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DS3PR11MB9796:EE_
X-MS-Office365-Filtering-Correlation-Id: 53c95602-d18c-4e09-eda0-08de90ccd683
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: h0Q4h/ln3rk0vvMr/HBJ8QGBvprS3YZtX+4hSNwI/teynUxZsro216g5muUktLYvhFllzVBWPk7g6AfP/+1trDBrJSUDW7PGN4ouv1e+X6e/ab3UUAzJTeL8/UYBQVWdkqB6vE+yzvuRjtLAecDI1zhMeMxuWEEG0AFl4K30E1OqQIR0TnoVPMaBLodY63cYk4tSTkSaycgWwuSOvIzyZg/Hrj2/Et/5tu5tBx1zY6b4KDCQTZit5H/DwITNPmq2FTAVr16m2IAZUUc2qgvrInTIcCxliHiKpn9Si/2xPpJmrF5WmbmoC0fVCZHdkqkg+shbmTpcZ5YZzjuyV7XypQPBzQhTQ3R6RexNUs/B3dFXjbET3p2ba5wy3a0K1nqI4NKEgv3GAbwFNkoPToF659rwwgKLv0D12w7WwJL8pX+3ntICITfpeL+WcTvnZmck7Gtm36owgm/cbuslD/FrB1WAgJx/KlPt/mAA7RbLy2dkIaQkioBAnDGkFxSauKbqbhw1CZ10EBNnypEOsUzELhS28zvDS97VJDsFb2ha1i8VKZTvj+xQxRaDdkkW2zxu1BVyGMwrVV5WwYOp+inBRmLjOadEwMh72rvjtLtc/bm6hasLvRshTu0oMrfNw4vOG2q9NcutG08krwX4aSzjaqz6Zi7Sui+Ve0f/fD9JABlLx1eqGVn7sLLdFlW2iEajAC2PGzBmHPpwwyQMBdNDz6u9jZSDNG8iLMpjS4L9FwA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bFRlemF0bmNENXZiS0hJTCtObTBHd1ZSQmo4V3h2VmRVZDBlSktFaEc0S0ZX?=
 =?utf-8?B?OVFXUTdtRXB3KzY0TXlLZTdFTWhOalRBNWVZRVFZTmJXLzVVWC8yZnZMSVpt?=
 =?utf-8?B?VlYvLzlLNzhsVmFXL3lydDA2RytuQ3AzL3RYSEtDZE9PckFmTTNxcXlHZXAr?=
 =?utf-8?B?TlB5UGlybEluUUhsYmU2d3VaWnorQVRZSklkK0hNc3NOcXNCVzcxYUlDUFNJ?=
 =?utf-8?B?UDV6QWx2Mm9CTnd6UXpWdVpnV0pRSmhlVEkzQ0ZtZVVjYm9aQUxZMWl2TTVC?=
 =?utf-8?B?VUthVmI2QnY4VDF6Z1NhM0l1M3dFbmlHblVVU1hFRDBqbHhyd3AycmJVaC9R?=
 =?utf-8?B?b1hKaGtGWDJqRno2UFBPZHQ2UDRGQStMSS8vU1Ywb0NnTjdET1k2MFptTGpr?=
 =?utf-8?B?VGhJYlYvclVMZ2sxQ0dhS0Vtc21veE5Id0NYLzFucGdVVHJmZ0EyZlhXeUtM?=
 =?utf-8?B?R1Ird1RIS0tnSUtTa1c1MXpiVWFzN1FXTmxaZTR6LzN6cXQvQTFIY1dpTmNU?=
 =?utf-8?B?NTdPQlpheHphcEc2VHFvVmlwc2lPTnBLN0RMdEJad1dIVzdQcnBrajFJOUZQ?=
 =?utf-8?B?RWFwSlp3WnVwTi9lL1ZDTGt1WlY3dDVwMHpnT2MxWVExMkIveWptQ0NDdWFF?=
 =?utf-8?B?blNjbWRMZzYzOUxDN3ZJMnhSQkVmdTZiTGpYV0k4bWNCUUE1ZmZsQUJjSEVJ?=
 =?utf-8?B?MUtacytOVlFpMWJBNlVvdWJaSlhMZGoyWk1YT0ErN3ZFMGRIbHlsRWdUekdB?=
 =?utf-8?B?U21wZWlWYzFiWWI3Qk80M0dxdk5meW4wUUxsRTNMMU5EZE55cHBUbWVPVFM3?=
 =?utf-8?B?RTI4dG9WeTFHVFJLbWt2Mk1yVWRPMk5GbkR6cTRsN290Y1YzcmU1T0pkY2cw?=
 =?utf-8?B?WERTUmtPNThDVE5UVXhKdXIyM0VtOHNjSGMwcndqY0daYVErbG8vWDNRTnkz?=
 =?utf-8?B?d1AwSHZMbXYvVWFBVkt3NnkzMTZVYmV6em85MHMzcDc5TVBvMUhxQ0FtelRN?=
 =?utf-8?B?cUxHN0tla3krVEhqQkZkeVhoa2YxVUp2NEZ5a3BtV1o0YUMxUlJ4UWRhMExW?=
 =?utf-8?B?ZnkzWWVFYnl6TUxZWmJIOXNPcUs2a0hXSFBKSFNnZW1DSmdOT1dheUFWekFy?=
 =?utf-8?B?aFI5Wkhkb0g3Y25mcDVGbVNSQXA0WktSYlVzS0Q1VHZIcWZhY1pOMjAzc3ZX?=
 =?utf-8?B?M295VitiL0Nya01pdHcrcGF4Mm1pSXd0dkY5bjNtZkJXbjQ4ZmFsZ2ZjazY3?=
 =?utf-8?B?RTg5dUE2b0hhWjBnRzFXd0RFRTZ0RDZYUlVPdHhZVDA2SDI2dWJTL0grWHpL?=
 =?utf-8?B?M2l1VFFiOG1sRFJoZHRSUUU4NGtjeC9BSEpPaENzbW1zZGgxK0FlbFBJOTlY?=
 =?utf-8?B?MzRqNTlRMjZIbml3UmM2NDlocFVRdHdRZnhZc0dSV2F3QnhjM3JUNEFYL3Yy?=
 =?utf-8?B?Vk1sZ1lHdmsxVUZwOWYrcmNrSG9LZkdob2IyblErN0lsY3pVamNnYURBOFNw?=
 =?utf-8?B?Q01hR0ErSmJiUjI0eWlBQmtua0lqNDRIbldBVUJ1elc4OXVJUmYrVU13eDlk?=
 =?utf-8?B?cEZFTUxwWWw1ZXR5YmptWTRDd2VZR0UrZHQ5a1ZOYjdFYkdIQkoxY1h4b1BZ?=
 =?utf-8?B?TjI5Z294SmY2dkU0NWJ6YlYvcmpMRHZUNUdYcWJ4RDhvQ1VZTTlZQU1xVVA1?=
 =?utf-8?B?TXBCbVBsbXJvcElqbXk5WjRselM3Z25xbzgzS29LemMzbVYzMjgyMFhPNkdk?=
 =?utf-8?B?OXNRT1pqckJCbHcrdnRTc0tZZFJGQlIzRzF3Nm5yY21HVmVBWXdxVVdCNzFo?=
 =?utf-8?B?eXg1QVBjeWZDN3lLcWM1UmhFYk82RWprRTE4RDNsSGJ6VGMxc2gyVVYxMUlo?=
 =?utf-8?B?N0dYYkxUOFBoaXdpRGtBeUlOY0hTdzl5MGVjRDZmZFY3cHBxcXN3b0ZINHRz?=
 =?utf-8?B?Z1RIVm8xZ2UwTGVNczlRb0FoNG13SGxCYmpwdUcyL2lDclRHT3VCQ08yakRv?=
 =?utf-8?B?Vjc0TXFSTHppM3RSTzVPVjdNbUNhY0JhWUNRbjZxdVF4RkJ2UkhKN040RE9J?=
 =?utf-8?B?SlJWSG9YQ2x1N1llcGNkNDRKcEJXNlhSS3h6Umh1U2tNZHFST1lOVWVRcjRi?=
 =?utf-8?B?TUFhZ2ZhNU44em11RnZ4OHNRd0pZUmMva0NHbmg1aUdBQ2l6NkM4MVN1Vzg0?=
 =?utf-8?B?QjhGeE5mMFRVOGxXeXlsWWYwQmJFY2dRZDdyUThVcmtFOGdqYjNvZEtRbDd5?=
 =?utf-8?B?alZ5bW5URkV5WXFmaUF0T0JMMkxMbFArYkdRalpSWjVKNkJ1eU1kVWNONHVJ?=
 =?utf-8?B?VmFRSUI0NzNzM29iRzVGb0l2and2TlRuWVkxNUM0Z3hwMzN2QjY4RkphdXAv?=
 =?utf-8?Q?1W65nBDTov+4gCBc=3D?=
X-Exchange-RoutingPolicyChecked: LvcChz26fCnn2Wd382W/dWVzKqv8W75g6DUqLuI2zIvHB0yjgW3xFlr+9Y0XVdTmd/LlRbyvSwTTdcbYMFKfcFVsZK84yPHU3Yka9CGWeUEK46tcP65P73+yeIIDaGA6xdZnj8PqV9Ix/V7GbnXF5iXw6U4kKvmbyTtIMGB8qIXPtYnIbzoXqXtOMZAeHa1gNWr0QuNjpzpELIEE+Z0Rdvv40FN09t556oj1jaAPF9haegxfjsJOrP/c+Up4YJTSzwky25arTeD9XZUfuXVungYWpR6kRXQ0UnQsFFvVvwYPRjNwKys24mZcYRSpkIFXbK+TzOclbpxWWftLGsfEAg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 53c95602-d18c-4e09-eda0-08de90ccd683
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 15:30:58.2411 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6gK+QYRBDENC/aJDcVZye/u9P108wcv8bWZVPjoZf8m85L3Y9kwGlK1wKnzFc0WwXaIeCwkwu2UBPvcEb2d54dEu+gafUJodYFER4kZeY+k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR11MB9796
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



On 4/1/2026 6:15 PM, Satyanarayana K V P wrote:
> New APIs xe_pool_bb_alloc(), xe_pool_bb_insert() and
> xe_pool_bb_free() are created to manage allocations from the
> xe_mem_pool manager.

if those are generic "allocations" from the pool, then don't call them BB

> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Maarten Lankhorst <dev@lankhorst.se>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> 
> ---
> V2 -> V3:
> - Renamed xe_mm_suballoc to xe_mem_pool.
> 
> V1 -> V2:
> - Renamed xe_drm_mm to xe_mm_suballoc (Thomas)
> - Removed memset from xe_drm_mm_bb_insert() (Matt).
> ---
>  drivers/gpu/drm/xe/xe_bb.c | 58 ++++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_bb.h |  6 ++++
>  2 files changed, 64 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
> index b896b6f6615c..26e2430c0dc1 100644
> --- a/drivers/gpu/drm/xe/xe_bb.c
> +++ b/drivers/gpu/drm/xe/xe_bb.c
> @@ -10,6 +10,7 @@
>  #include "xe_device_types.h"
>  #include "xe_exec_queue_types.h"
>  #include "xe_gt.h"
> +#include "xe_mem_pool.h"
>  #include "xe_sa.h"
>  #include "xe_sched_job.h"
>  #include "xe_vm_types.h"
> @@ -172,3 +173,60 @@ void xe_bb_free(struct xe_bb *bb, struct dma_fence *fence)
>  	xe_sa_bo_free(bb->bo, fence);
>  	kfree(bb);
>  }

why all of this is in xe_bo.c and not in xe_mem_pool.c ?

> +
> +/**
> + * xe_pool_bb_alloc() - Allocate a new batch buffer structure for drm_mm

xe_mem_pool_alloc_node() - Allocate new sub-allocation node for use in xe_mem_pool

> + *
> + * Allocates a new xe_pool_bb structure for use with xe_pool memory
> + * management.
> + *
> + * Returns: Batch buffer structure or an ERR_PTR(-ENOMEM).
> + */
> +struct xe_mem_pool_bb *xe_pool_bb_alloc(void)
> +{
> +	struct xe_mem_pool_bb *bb = kzalloc_obj(*bb);
> +
> +	if (!bb)
> +		return ERR_PTR(-ENOMEM);
> +
> +	return bb;
> +}
> +
> +/**
> + * xe_pool_bb_insert() - Initialize a batch buffer and insert a hole

xe_mem_pool_insert_node(pool, node)

> + * @bb: Batch buffer structure to initialize
> + * @bb_pool: drm_mm manager to allocate from
> + * @dwords: Number of dwords to be allocated

why not bytes?

> + *
> + * Initializes the batch buffer by allocating memory from the specified
> + * drm_mm manager.

drm_mm ?

> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +int xe_pool_bb_insert(struct xe_mem_pool_bb *bb,
> +		      struct xe_mem_pool_manager *bb_pool, u32 dwords)
> +{
> +	int err;
> +
> +	err = xe_mem_pool_insert_node(bb_pool, &bb->node, 4 * dwords);

this magic 4 is sizeof(u32)

> +	if (err)
> +		return err;
> +
> +	bb->cs = xe_mem_pool_manager_cpu_addr(bb_pool) + bb->node.start;
> +	bb->len = 0;
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_pool_bb_free() - Free a batch buffer allocated with drm_mm
> + * @bb: Batch buffer structure to free
> + */
> +void xe_pool_bb_free(struct xe_mem_pool_bb *bb)
> +{
> +	if (!bb)
> +		return;
> +
> +	xe_mem_pool_remove_node(&bb->node);
> +	kfree(bb);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_bb.h b/drivers/gpu/drm/xe/xe_bb.h
> index 231870b24c2f..638d8fc53f1a 100644
> --- a/drivers/gpu/drm/xe/xe_bb.h
> +++ b/drivers/gpu/drm/xe/xe_bb.h
> @@ -12,6 +12,8 @@ struct dma_fence;
>  
>  struct xe_gt;
>  struct xe_exec_queue;
> +struct xe_mem_pool_bb;
> +struct xe_mem_pool_manager;
>  struct xe_sa_manager;
>  struct xe_sched_job;
>  
> @@ -24,5 +26,9 @@ struct xe_sched_job *xe_bb_create_migration_job(struct xe_exec_queue *q,
>  						struct xe_bb *bb, u64 batch_ofs,
>  						u32 second_idx);
>  void xe_bb_free(struct xe_bb *bb, struct dma_fence *fence);
> +struct xe_mem_pool_bb *xe_pool_bb_alloc(void);
> +int xe_pool_bb_insert(struct xe_mem_pool_bb *bb,
> +		      struct xe_mem_pool_manager *bb_pool, u32 dwords);
> +void xe_pool_bb_free(struct xe_mem_pool_bb *bb);

wrong .h ?

>  
>  #endif

