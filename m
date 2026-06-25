Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33020CDE00B
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jun 2026 20:40:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E381110E29C;
	Thu, 25 Jun 2026 20:40:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cWLyiQIK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20E7E10E28B
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jun 2026 20:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782420044; x=1813956044;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ERpvC4ZLajQmFJy74/QEQi2u4uruYUWLs7vvtpy1Ma4=;
 b=cWLyiQIKaZhxkndPNnQP4XQBi9FepEVqRYwc/cQjDdDrY3L63qrrp6hu
 MOEjtiaqLYrWcmkWRdgK8dYcejLh7Jvd6Sy3mXNICg+o5HfWRV2y1GNe6
 PAsmvT3FxWyrt5rKhgEl/wVxOIZjSTQ/sR0MI9Rr3DGYv870UzovSbztZ
 o1+9OQSF0eVKIP8/XfyAe+5nNHXFcnuygKVZW0FlyzMWorOX6QK1eKfZt
 p1rOxgDIwzmBvgFF9gVv1ONd13gowPt+Fzzl1T7b3v2+DmEAdCgXhCSAB
 E8wzgf72nOX4GByOiJqleN52SWysIZg49MfMFGvGdYBa6564d+DyJIcHi w==;
X-CSE-ConnectionGUID: afBb28tnQYqQo3KVBsVCSQ==
X-CSE-MsgGUID: 1rQdIO0tREa3p8CWMy36bA==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="93805353"
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; d="scan'208";a="93805353"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2026 13:40:44 -0700
X-CSE-ConnectionGUID: 7iBanin1QW2O9h6d1s607g==
X-CSE-MsgGUID: JAL6OvxfTgOnZsq0kXGkGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; d="scan'208";a="251615473"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2026 13:40:43 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 25 Jun 2026 13:40:43 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 25 Jun 2026 13:40:43 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.5) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 25 Jun 2026 13:40:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rl4yECNtjujM3TP2V4h0TzgfX4X6umW+DelY9rcoPQa4ExW1cLmpX9jGJVB3+n0NS0VKs+YuTeFaYXTtHX64I9fVEkGipORbTesL9BNL17oElldw2KyqR/G8QRqFR1Dl02iV9L+Iqw2W0J1jaZm/6wSaeZZTVUpwiF/HMVSIPALNfcfScvZTUVOPuku4R4lOFLyckBdjnlHNhbVK/3RE4dGuPa1PlUSb+i4JmzmOQ5exge/Ojxc5Jhczj4uvOqGxuwlXnwP5AYPTwGjMhNrsAyOR654MtbngFaw637yditZqlBZCibVFAjtdqUfCHeqYEGdFqq7KC6vcajyeSUVlhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pJT+aD9th40JkHQzyczPWrcQaFK+pB0+sWYStgSN00M=;
 b=dDUGIq+DU0s1QX0pklgtZbq5y2xXOBHrpCw8PzuUY0gXd/qleji5GqfQfPN7P80z9kNGCvmUlRQ3OxGu2VY6tHfZEDj0f+YR7Z9IT25APo692l28jiZ3VB44zwj6HR2qkx2BlKUkZ/JGnQJkxHkMIXINz7TggQ1L6RBn6Wns5OW/aWP7WMOvX7ZITtIksqjP3Ltlfww4bk8Tgc55kRL6ytPm2WlZtbSxDIoxtut/iXNRpRzpZc2t+U3p9KA7Fa5Fl0BudaCZuY1oIQuIwNl1R8uFQlXzIKKGe8fhgmEHfU/TF/XcXJBj2RkbbFEKurFX9QHkESvp5d5FTm4/wYXoDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DM6PR11MB4657.namprd11.prod.outlook.com (2603:10b6:5:2a6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Thu, 25 Jun
 2026 20:40:41 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0159.016; Thu, 25 Jun 2026
 20:40:40 +0000
Message-ID: <47058937-f35e-4856-89ca-f1e2f5087f55@intel.com>
Date: Thu, 25 Jun 2026 22:40:35 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 08/10] drm/xe/vf: wire up NUM_PAGING_ENGINE_INSTANCES
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>, Matthew Auld
 <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
References: <20260611161634.506476-12-matthew.auld@intel.com>
 <20260611161634.506476-20-matthew.auld@intel.com>
 <b67be657-cfd7-4dbb-ac4d-734ef6214b6f@intel.com>
 <172ca7a0-4860-4aa3-b0c2-9afb788d6613@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <172ca7a0-4860-4aa3-b0c2-9afb788d6613@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VIVP296CA0124.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:358::11) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DM6PR11MB4657:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b0356d7-38d0-4a3b-4123-08ded2fa04e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|18002099003|22082099003|11063799006|4143699003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: S8X85NSSy7M4UOar+T/K42E7ddUOCaM4mIkpZG18TkpGNgJDYdEqAbJhb5NXNnkQ8LZsYKgUSS1hRd4s4X5cCjVsKQu5SuYjVR9GX1A5/QGpOeDxgh2fCzgenMIwyNO87CvztpS9qQAnoWW+mKTUYwD1oqK84HzhT0AEBnLg/+ZDA7wPMb+qguBqnusjGN2eP/B8ij5l/qkhdPWQlej6wIITVTuN8H/mGYdGiV49Z6rjaL2BeVLs5XJ2ibtdhmgbM/87wlZcFsjuOS9MOvlUt3i5ghBz7ZEaVsQdcJA0ZYT0eWPuvr+CdxgklL0pg6KLp8Bh6bNfHpRyu5OZ/47B2aozI4rQdSulV4KfwLAgDE5KyGIhd9lxY7hnB8VDo9U6Sb6NfZzQm+iE/p+43f4dj5qnhXHeml3Tzz1Q9uw1WQ01YnFy1zPRFD7Pn2VooYUvnqYowO00PUmjZ1tV5AP2B6cHOWnmLq2YUhuchfpzkpJeM2FzAwSYAWEr47oc+x/ZJmtp9I73oW+ypx8Mx9WO5tciidDRWKfaKl6YY4KnZDDXH+TL1PeyRWjAQH/KSBNGGMei4SvCqjXcWmlMQ8V/Cqs4/YBK6Qjd6xh54/GgtWMXRy9Znor5Z+8/KLzX0Tv5NpKqERApXmDUe/BmsVbq0xNv+IHKoZkBHahfTBeTsCk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q1REK0grcjcrYW52MFpSQUduUitrOS9mOVNLZzliL1BUaVhFbHVWMVhYTGdC?=
 =?utf-8?B?c2R0dzArUTNHRExQTDE0TFdteDRUTkk1TDZoNlJPMHdiMVBNSkVCUUY0S1R0?=
 =?utf-8?B?WVlIWEYzUE9MQy9ESGhrVjF2UHlIS2paZ2lMRHJXbEo0UkZrQVRFSE5PV2t4?=
 =?utf-8?B?MCtFVFRVWVkvR0hDM1pGeUdieWk2OSs0bUZkc2J0dkpsNG5YR0hndHpHanBF?=
 =?utf-8?B?YVhZamxYN2dBS3hBY3N5N1VTUDYzNVgyeWZSSmdMV3haSFhRa3VPSWpnUnVR?=
 =?utf-8?B?cnF4WVBMYzNTU3laMHBhVmpJZWZDOWJoaTlRd1lZT05XakUzVGtRdWZWWi9L?=
 =?utf-8?B?dU16YUZiS2liY0NrbWo3Wm9QbkZpSnFFd29qOTFlUnJVcWhWWHBUZ0R6eEJz?=
 =?utf-8?B?cngrT2NFR1JIUG4yaVE0UU1JQlFjTzBUak9NUEkxWDkxalFaeUl4LzFUWHYr?=
 =?utf-8?B?T013bUViTFR1SitYcVQ4cUlZS2x0OHdnRFpxZHdnZ2NQVldLQTdSQlRuZE4w?=
 =?utf-8?B?dUNDRjVsaEUzZDNkWlBRRDhwbnhUZUdsakxGUy9TV2Yxc2ZlMXJJZWpSQlJ5?=
 =?utf-8?B?L29PSEpyOXk5ZENHbzJlUFEvUXhvV0Y0aFJVWithMW8vNU9uK2dZM2FCUkFy?=
 =?utf-8?B?THNia0c5d1QzbzV6Rm9qWks5b2t0clpBem1GNXZienQ0bk1pZkFOQXVjZXlD?=
 =?utf-8?B?R2dpVGxqYWpjcERIcFlJQ2htMGt3TWYyOGQ2ZSt1N3pPUWZZRHo4bndlTjZM?=
 =?utf-8?B?dk12c2xkczJuWnlCWW8xbmZNOUQwbUYrL3hDMU5XNU1DakdBUGpCWStXSFd3?=
 =?utf-8?B?VzdSQW5rN1BIWDJYL0F0UFFmcGRkb3VHVjE1d2E4KzNrbUgxTk9tNjZBM1k5?=
 =?utf-8?B?ejg4QkdCbGJESWhQWmlvZXFkMEZNSWZEa3haMmRvK2RRb2xxMjc4U3Irbzdx?=
 =?utf-8?B?eW95Szh4ek5Kb2QyVFJFNTNuZWF4Rk1UM0tEdzVzaDhXMzl5MENnL3lLYmJZ?=
 =?utf-8?B?T1lqdXk5L1BNT1R5OWdaWnM0SjlLbE9XMUtoVmJnUURWQjRub3Z0MVBsV0ln?=
 =?utf-8?B?TjFkbFNRVDhJNE56OXRoT1ZXWTAyVitrT294Y1FwUE9ReFZ4aGs5ZGtwUER6?=
 =?utf-8?B?OXM5UUNydUtUNWtzbmJCRWZVVW1GTkE4dU93SDNFTFd1N3JqOHQ3ZE1hWU83?=
 =?utf-8?B?cWgxYkRuaXBnK3pEbDV5VnRpcmg1SU1aeW1TSE9DREhrK0tDNzVFZjlGSXZY?=
 =?utf-8?B?eW8yZVFtWVAzeGQwajJrUFArN29WKzZIZk42aFpOWXUzYUZGdXN3OVhjQWpH?=
 =?utf-8?B?U2dReDZOMjIvVFltZHRsQ1EvdzZiaEFWcW9UaWlXS3V2WE1MNlZaRkdrZDRn?=
 =?utf-8?B?UEZHaUFoWUxJZi9wVHUyU1RWZTErMTc2OGMzcFo3UWlzV3UzWlArclBrSkJX?=
 =?utf-8?B?QzlLQWo5Znl6RHVyMUd1dSs2QnBvMUprMzNsODlPb1I4RjdNbVRGSnlqQ3BS?=
 =?utf-8?B?dDNqbGRHdGFVRzUrVy80NjNnQzdpNjlNNkVKSHE3TlRvNk93Unp2cm1IT0x4?=
 =?utf-8?B?dUxNanlBV21OZjRBWmJ4Z1BBQ1kwT2xmODY3eStiQXNpaVpwcWJlRGJYWHJT?=
 =?utf-8?B?RlBSN2pobll2U3c2MDlqcFNVaThZWW0waUNURHp1RjFnUWl1SWdZeHpJMDha?=
 =?utf-8?B?UG1YWjQxNHVlYXR6ZHU5WU52YXRyMzEzRnphMFd3YVhNN1E0dUh2SFQzb2FH?=
 =?utf-8?B?Q1llbVc3STZWWGdDODg5NnZPWEI4N2JjUWw1WHRUQjcvS2Z5ek0xYUNCR0h0?=
 =?utf-8?B?L1ZEVTd6emhtUmtZYk8wZHRtek1rUUVQR1dBL21hWmpuNllOeUlNSC85M1hM?=
 =?utf-8?B?K0E3czA3UWl6ODFqQ29ieis3dndnSjNyc1VBV1ZRNFF0dFFLV21KMyt2S3Z1?=
 =?utf-8?B?Z2N1ZFRIb0tKT0MrOVA1eGE4a2lTWVlXd0NMbCtsYXRFTVlBT3Q2MXRZeG1I?=
 =?utf-8?B?MEFmQW4zZnlGSzFZZkZFN2V0c1hUOGZqejg5WXAreHFaanBHc3VtdHBMaVd2?=
 =?utf-8?B?WWNZVXlkT2htaTUrQld2clVDc0VVd2FrNC93dW5nM21FV2lNR3paaG1TUnpo?=
 =?utf-8?B?aG1uUmlqSm4vODhDS3IvbThkZDQyK052czB6eXJtOWsva1ZlSld0MkJSbXFG?=
 =?utf-8?B?VVRqMDk1eVY4UlJya2UrSDgyYVhxRTBUVUFqcXh4VFRKK3FsQlNCdzFhdWtt?=
 =?utf-8?B?ZXcwKzI3cHpwYW12a25aT1NxWFhyQkJpb2NWaHBVR1MwbHc2RkQ1Yi9IQ2xQ?=
 =?utf-8?B?dzhwRXdEZEQ0cGJzaGRIK3lQY1ZnYUVxaXFUWUFhWW9tdGRUVWVUVUFpMW4y?=
 =?utf-8?Q?6MH2QgEvbU3pRfXY=3D?=
X-Exchange-RoutingPolicyChecked: LUP0wAoE7FdglnBQIHfvMgPmc7PiLppwOdwl8sK+uoaT/owr3swKP/h5S6WpG49bDrGxP4P3L5bV7AJI4dRMpzsvX5CPlXAeSdKHyHs7trrMb6uPUrc5fLpBd7psZ6hXu/rvWy18HstU2RZkpFM4xGAyj6zxIlSw05P+cH0xslzBh6glpDODAyNSj4r6Ioye1bF+18cd88UgLiZhvWDTUgTw2oD6/T+jEklXsAOTmZxo4IaB1+TyMWqAN7r1s62WLje81phL1x0TginjKlYKpZK8intY5trhWrIGgTVN+oFQ629lqDQflyf1MIik+2P68fKaf0mJoCh9bKfe7X617A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b0356d7-38d0-4a3b-4123-08ded2fa04e4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 20:40:40.1370 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VBpS1cA2xSfsrGKUC9cKWVGI9O9yrCtEq+agng+D5QXVOUl5jVSVD5Ss1ocg16QLZUYDJsU6et8tWdFdwHTs76nrcRmR2eZqu5Bhq5xtEO0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4657
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



On 6/23/2026 7:50 PM, Daniele Ceraolo Spurio wrote:
> 
> 
> On 6/23/2026 9:28 AM, Michal Wajdeczko wrote:
>>
>> On 6/11/2026 6:16 PM, Matthew Auld wrote:
>>> When host PF writes the logical configuration for the GUC PAGING engine,
>>> the VF is meant to query it, and mirror it. Size of N means we have
>>> paging logical index range [0, N-1], with N fewer normal copy engines.
>>>
>>> Agreement is that PF will only spawn PAGING engines on NVL-S+, so this
>>> should be zero on older platforms, where we should simply fall back to
>>> the old behaviour.
>>>
>>> v2 (Sashiko):
>>>    - We can't call use the guc_has_paging_engine() this early in the VF
>>>      code. With that just unconditionally do the query, if the GuC is new
>>>      enough and take the value as-is. With that drop the -1 special case and
>>>      just let the upper layers figure out the rest.
>>> v3:
>>>    - Also update xe_guc_klv_key_to_string. (Michal)
>>>    - Add kernel-doc for xe_gt_sriov_vf_paging_engines(), plus other
>>>      tweaks. (Michal)
>>>    - Update with final GuC version.
>>> v4:
>>>    - Just fallback to manual reserve when vf reported paging engines is
>>>      zero. Will revisit in the future.
>>>
>>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>>> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
>>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/abi/guc_klvs_abi.h     |  9 +++++
>>>   drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 47 +++++++++++++++++++++++
>>>   drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |  1 +
>>>   drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |  4 ++
>>>   drivers/gpu/drm/xe/xe_guc_klv_helpers.c   |  2 +
>>>   drivers/gpu/drm/xe/xe_hw_engine.c         | 30 ++++++++++++++-
>>>   6 files changed, 91 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>>> index 644f5a4226d7..753c049d2fc8 100644
>>> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>>> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>>> @@ -52,6 +52,12 @@
>>>    * _`GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE` : 0x3001
>>>    *      Tells the driver whether scheduler groups are enabled or not.
>>>    *      Requires GuC ABI 1.26+
>>> + *
>>> + * _`GUC_KLV_GLOBAL_CFG_NUM_PAGING_ENGINE_INSTANCES` : 0x3003
>>> + *      Tells the driver the paging engine configuration.
>>> + *      Paging engine logical instances are guaranteed to be dense starting at
>>> + *      index 0.
>>> + *      Requires GuC ABI 1.36+
>>>    */
>>>     #define GUC_KLV_GLOBAL_CFG_GMD_ID_KEY            0x3000u
>>> @@ -60,6 +66,9 @@
>>>   #define GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE_KEY    0x3001u
>>>   #define GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE_LEN    1u
>>>   +#define GUC_KLV_GLOBAL_CFG_NUM_PAGING_ENGINE_INSTANCES_KEY    0x3003u
>>> +#define GUC_KLV_GLOBAL_CFG_NUM_PAGING_ENGINE_INSTANCES_LEN    1u
>>> +
>>>   /**
>>>    * DOC: GuC Self Config KLVs
>>>    *
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>>> index 0cd9d77f3351..0a11e63f470b 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>>> @@ -658,6 +658,33 @@ static int vf_cache_sched_groups_status(struct xe_gt *gt)
>>>       return 0;
>>>   }
>>>   +static int vf_cache_num_paging_engines(struct xe_gt *gt)
>>> +{
>>> +    struct xe_guc *guc = &gt->uc.guc;
>>> +    struct xe_uc_fw_version guc_version;
>>> +    u32 value = 0;
>>> +    int err;
>>> +
>>> +    xe_gt_sriov_vf_guc_versions(gt, NULL, &guc_version);
>>> +
>>> +    if (MAKE_GUC_VER_STRUCT(guc_version) < MAKE_GUC_VER(1, 36, 0))
>>> +        return 0;
>>> +
>>> +    err = guc_action_query_single_klv32(guc, GUC_KLV_GLOBAL_CFG_NUM_PAGING_ENGINE_INSTANCES_KEY,
>>> +                        &value);
>>> +    if (unlikely(err)) {
>>> +        xe_gt_sriov_err(gt,
>>> +                "Failed to obtain the number of paging instances (%pe)\n",
>>> +                ERR_PTR(err));
>>> +        return err;
>>> +    }
>>> +
>>> +    gt->sriov.vf.runtime.num_paging_engine_instances = value;
>>> +
>>> +    xe_gt_sriov_dbg(gt, "num_paging_engines %u\n", value);
>>> +    return err;
>>     return 0;
>>
>>> +}
>>> +
>>>   /**
>>>    * xe_gt_sriov_vf_query_config - Query SR-IOV config data over MMIO.
>>>    * @gt: the &xe_gt
>>> @@ -694,6 +721,10 @@ int xe_gt_sriov_vf_query_config(struct xe_gt *gt)
>>>       if (has_gmdid(xe))
>>>           vf_cache_gmdid(gt);
>>>   +    err = vf_cache_num_paging_engines(gt);
>>> +    if (unlikely(err))
>>> +        return err;
>>> +
>>>       return 0;
>>>   }
>>>   @@ -731,6 +762,22 @@ u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt)
>>>       return gt->sriov.vf.self_config.num_ctxs;
>>>   }
>>>   +/**
>>> + * xe_gt_sriov_vf_paging_engines - Query the number of paging engine instances
>> nit: we don't do any query here
>>> + * @gt: the &xe_gt
>>> + *
>>> + * This function is for VF use only.
>>> + *
>>> + * Return: number of GuC paging engine instances configured by the PF.
>>> + */
>>> +u32 xe_gt_sriov_vf_paging_engines(struct xe_gt *gt)
>>> +{
>>> +    xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>>> +    xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
>>> +
>>> +    return gt->sriov.vf.runtime.num_paging_engine_instances;
>>> +}
>>> +
>>>   static int relay_action_handshake(struct xe_gt *gt, u32 *major, u32 *minor)
>>>   {
>>>       u32 request[VF2PF_HANDSHAKE_REQUEST_MSG_LEN] = {
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>>> index 79878f21b1da..d171a8242a34 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>>> @@ -31,6 +31,7 @@ u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
>>>   u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt);
>>>   u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt);
>>>   bool xe_gt_sriov_vf_sched_groups_enabled(struct xe_gt *gt);
>>> +u32 xe_gt_sriov_vf_paging_engines(struct xe_gt *gt);
>>>     u32 xe_gt_sriov_vf_read32(struct xe_gt *gt, struct xe_reg reg);
>>>   void xe_gt_sriov_vf_write32(struct xe_gt *gt, struct xe_reg reg, u32 val);
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>>> index 80562ffadb16..21cb9bc1a341 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>>> @@ -40,6 +40,10 @@ struct xe_gt_sriov_vf_runtime {
>>>           /** @regs.value: register value. */
>>>           u32 value;
>>>       } *regs;
>>> +    /**
>>> +     * @num_paging_engine_instances: number of configured paging engines.
>>> +     */
>>> +    u32 num_paging_engine_instances;
>> nit: can we move this up near .uses_sched_groups
>>
>>>   };
>>>     /**
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
>>> index 97600edda837..be992b8da9a1 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
>>> @@ -24,6 +24,8 @@ const char *xe_guc_klv_key_to_string(u16 key)
>>>       /* GuC Global Config KLVs */
>>>       case GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE_KEY:
>>>           return "group_scheduling_available";
>>> +    case GUC_KLV_GLOBAL_CFG_NUM_PAGING_ENGINE_INSTANCES_KEY:
>>> +        return "num_paging_engine_instances";
>>>       /* VGT POLICY keys */
>>>       case GUC_KLV_VGT_POLICY_SCHED_IF_IDLE_KEY:
>>>           return "sched_if_idle";
>>> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
>>> index 4d7cb8b54b4b..1227b9e66fd6 100644
>>> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
>>> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>>> @@ -650,7 +650,7 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
>>>       return err;
>>>   }
>>>   -static void hw_engine_setup_logical_and_paging_mapping(struct xe_gt *gt)
>>> +static int hw_engine_setup_logical_and_paging_mapping(struct xe_gt *gt)
>>>   {
>>>       struct xe_device *xe = gt_to_xe(gt);
>>>       unsigned int num_copy_engines = 0, num_paging_engines = 0;
>>> @@ -667,6 +667,27 @@ static void hw_engine_setup_logical_and_paging_mapping(struct xe_gt *gt)
>>>       if (num_copy_engines && xe->info.has_usm)
>>>           num_paging_engines = 1;
>>>   +    if (IS_SRIOV_VF(xe)) {
>> maybe:
>>
>>     if (IS_SRIOV_VF(xe) && xe->info.platform >= XE_NOVALAKE_S) {
>> or
>>     if (IS_SRIOV_VF(xe) && xe_uses_paging_class(xe)) {
>>
>>> +        u32 vf_num_paging_engines;
>>> +
>>> +        /*
>>> +         * PF could in theory reserve multiple paging engines, which
>>> +         * internally the submission/scheduling backend can load balance
>>> +         * from. Not something we currently expect, but we are at the
>>> +         * mercy of the PF, so we just need try our best to mirror the
>>> +         * paging configuration.
>>> +         */
>>> +        vf_num_paging_engines = xe_gt_sriov_vf_paging_engines(gt);
>>> +        if (vf_num_paging_engines) {
>>> +            /* This should only be non-zero on NVL-S+ */
>>> +            xe_gt_assert(gt, xe->info.platform >= XE_NOVALAKE_S);

missed this one: I'm not sure we should use assert here:
it's not our fault after all, but it's misbehaving PF,
so either we silently live with that or abort

>>> +            num_paging_engines = vf_num_paging_engines;
>>> +        }
>> hmm, so what should we do if vf_num_paging_engines is actually 0 on NVL-S+?
>>
>> can it be due to GuC FW being older that 1.36 on NVL-S+?
>> can PF skip programming paging class on NVL-S+?
> 
> PF can indeed skip programming the paging class and that is a valid (although currently unexpected) scenario.
> 
>>
>> maybe 0 on NVL-S+ is a good reason to abort the probe?
> 
> The expectation from the GuC side is that if PF has reserved a paging engine then VF must match it, but if PF hasn't reserved a paging engine then VF is free to reserve a BCS to do paging.

but then this paging engine on VF side will not be a paging CLASS, as the rest of the code may assume
or it doesn't matter for the VF?

> 
>>
>>> +    }
>>> +
>>> +    if (xe_gt_WARN_ON(gt, num_paging_engines > num_copy_engines))
>>> +        return -EINVAL;
>>> +
>>>       reserved_logical_bcs_start = num_copy_engines - num_paging_engines;
>>>         /* FIXME: Doing a simple logical mapping that works for most hardware */
>>> @@ -688,6 +709,8 @@ static void hw_engine_setup_logical_and_paging_mapping(struct xe_gt *gt)
>>>               }
>>>           }
>>>       }
>>> +
>>> +    return 0;
>>>   }
>>>     static void read_media_fuses(struct xe_gt *gt)
>>> @@ -906,7 +929,10 @@ int xe_hw_engines_init(struct xe_gt *gt)
>>>               return err;
>>>       }
>>>   -    hw_engine_setup_logical_and_paging_mapping(gt);
>>> +    err = hw_engine_setup_logical_and_paging_mapping(gt);
>>> +    if (err)
>>> +        return err;
>>> +
>>>       err = xe_hw_engine_setup_groups(gt);
>>>       if (err)
>>>           return err;
> 

