Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 608F510AB822
	for <intel-xe@archiver.kernel.org>; Thu, 26 Mar 2026 21:19:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1174710E9C4;
	Thu, 26 Mar 2026 21:19:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hWK+wmQe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0B4410E9C4
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Mar 2026 21:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774559965; x=1806095965;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=HXxwz68Q1ePTm//Mb5BEiJs2U+MhZHhj/wfckTRcegI=;
 b=hWK+wmQeWLl+0+SVWVpZRqR5H1pT7iLspAFu7bzNC+ukoWsa6iOVieqe
 ft7Ou39LXZSgDtUmCD+3RVp48W2Q8b2G+RblHigzMQ+NwgOlmeU5YmV3d
 2q0FtRN+F72EI72IPA0hu3NFN6CMwxFYRlJDTHe+V3M65IyiV6qBD0J/m
 Yh7FPg1qPtEeWbYdMb/8j1AKfU146adUaJeiDgh5YKHgx3AYqi1HCHQC8
 p2Y5fq4eyFKpsZ2FkYmhkiLtFrj/1/QUUTFJhUvHq9qmbU4Lt5qbr7UHp
 e57DsGbTqimgB4f9yhmlhZPTulMBsgVrwtK35VfKGoI2y9FBj1mdGes1t Q==;
X-CSE-ConnectionGUID: 00kb2n+KT5eFvY9Uf551pw==
X-CSE-MsgGUID: YC2xj2EaS4aZK9irmUFTtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="86251720"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="86251720"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 14:19:24 -0700
X-CSE-ConnectionGUID: B6hjTYBZS2Kf6MnmalZ8Rw==
X-CSE-MsgGUID: pJLTXUUVTNOuhGfZ/HOkDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="220263898"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 14:19:24 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Mar 2026 14:19:24 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 26 Mar 2026 14:19:24 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.60) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Mar 2026 14:19:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UotWUEbZnB33mJJZxeSn0hHekF590GRsG36cBKK7DYiYDgZRsaL9fx1Fv6bUUA89+mfHGCVQwEvAhH4o9QDRx6TB0kSfihmM0bjOQ7gSVuL1+6eG5KqNT9oXZQ+HGLddiC4l4RbXcqyvA3qNXotUrCbF2w7OACI1S9/nD+odEgwKlD30Sx5tkJPX3FakyOLuYFQGYWpb7emx1VvhyfHytM+Ub5m/CWyN5a8VvlJQ+0/Boj4nJcR6dwP+xY9tOwS/j2dGhJZIYFr32eQORrIjPbpY/3ZRdnyQx8moak0faOdAzX+e6+7eZWoP0FKcbtYUjl6pkdY+rUDnMprHgMLsow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pBiJxe7WmOEMiXcecbGzjq/+6mH7dsaYM1ti5U1cPCE=;
 b=Ey8AG119TJpHeK90wCKvKufz5+N0OmxmcMgLP6di2cJUHbUYGuJgFmZrf10pSYVcGI47MnXaPE0dlb3gdGPCLM+zIPULOc8QR2S/PMGIKD8TFGkOd8qUltPzbrLnI0eHeo3YbduzDizybQp/vRMW3TL+ead324YGcJ+eEGnDFnhXh38pVEBzpz5AD5OmVHVZZNX6B+tt6B9CuteFgE/PckT8Fh9W9BNvozRs9mEpkgr2ZyI7gRMgCaDT1McglMTgD3hQQf4JcR26qtTy98nCOySHZaZ5Cmnq978zNKjLhE9okoyOtzB3jBr4fpG7nH7QYyGGRsXfPbpSFwHlQRVEnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6519.namprd11.prod.outlook.com (2603:10b6:8:d1::5) by
 SJ0PR11MB5791.namprd11.prod.outlook.com (2603:10b6:a03:423::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.22; Thu, 26 Mar
 2026 21:19:21 +0000
Received: from DS0PR11MB6519.namprd11.prod.outlook.com
 ([fe80::c336:8ed1:4b09:4414]) by DS0PR11MB6519.namprd11.prod.outlook.com
 ([fe80::c336:8ed1:4b09:4414%3]) with mapi id 15.20.9745.019; Thu, 26 Mar 2026
 21:19:21 +0000
Date: Thu, 26 Mar 2026 14:19:18 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>,
 <matthew.auld@intel.com>, <himal.prasad.ghimiray@intel.com>,
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH v2] drm/xe: Drop all mappings for wedged device
Message-ID: <acWi1gL2SI+KLWgP@gsse-cloud1.jf.intel.com>
References: <20260326132816.739363-1-raag.jadav@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260326132816.739363-1-raag.jadav@intel.com>
X-ClientProxiedBy: SJ0PR05CA0158.namprd05.prod.outlook.com
 (2603:10b6:a03:339::13) To DS0PR11MB6519.namprd11.prod.outlook.com
 (2603:10b6:8:d1::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6519:EE_|SJ0PR11MB5791:EE_
X-MS-Office365-Filtering-Correlation-Id: efa7fcda-84ea-4502-d1a6-08de8b7d58c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: UAO47HRtW4EVx4aCWqfvs/GcYWmaiz7ud23AobtjFoAa6mgdh8BiPezarHkOWchMbizjPWzj34TbDdD5UEwIoCdBmxL0/UdvuCQvO1LOuCbM6E3sgRa4ICBbDWKOSDMJzbFe5D2NcWMWzyuH0cDYizm1nUgwQ+NFFprfv+mgY55c1iZRKvHgF5cYCP1jTPN7MELLVJTLQuCx4c9ahSwePk2tMzMUEQxF3OYKMEwBroO8uIfmRESCtxjwdrrgKiquALnF7Dv8z05SNReXBPMFCdhW9+ux851qIpIue/ir0EespsMR3isYNpQyJWnTGcHYhTRH2j0KJkPZZUYyjO9uBpGYONTJ98XScqQluF17hHcRDyj2c0VBWwa39JX3W1nMWVOq7hKQACiXA/YQV/h7Ske4QfH1vpgok/agvogYbaEAale8wWLAUCCp3e62IULhB+zGqw6K08Z1aTg+aBLHVTwm5rzLa+uI4VANX0sQHpa12i6bMth7W5HRpuXbVUqec42TTgUjMR1r5PgAdmktnP7+fWYY2pMDu5CcJh3vblpTQ89NUfurzoan8cEAQ35Um+0KHfSZeNEYIMN+8lPflHI2cfd12lUbOEjGGlTH2f6EIfhTXqcHQT+k2imyZ2TtTY7afp8zpGdUo/KGdjI7kXCI1t4X9b07CkgQm4b1aVSYPDvQmxf5YAuwKtvfWHtrDgbPRFTxNhwSpF3cOddSRyP4Ac4BPtU1WAeLAxN9f0E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6519.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VUFtWnlLbUJyRmZ6RnpFSUppWGlndlBOYmRSRDlhdTlCU1lBUEF3bFpwNlZP?=
 =?utf-8?B?Z2dwRzBsN0ZlY0F1ZmlUVTgrejBxSUZtNXNKcTNUVXhhc0w4MzEvYVBFWkl5?=
 =?utf-8?B?TXZXcFFrRFFQdTRTaTFZZFR5aWZNTndxVm5lVjh6RlZ3Sy9OZndyQ09ROGI4?=
 =?utf-8?B?Rm4yRTZsWDNpcUVKOFpkWWNrRGxqU0dGUnNoMSsxdG5BSUxqV1lOQnhFMU5r?=
 =?utf-8?B?NkE3WVByZTVteStCS0tXZXUxd1pMRWhlNGVzWmh0cDd1WDVtVmJDTlpCSkpC?=
 =?utf-8?B?L2VIbkJtL1o0WWZ1aDViTXN4VXNUUXk0U3QybVVheGcwRHhQMi9pakIwLzFh?=
 =?utf-8?B?RHNtaW4zV1F4amZkeTZuRkhhRkdYMjlIelJmN0tTUkk3Uzk4VTB1RDVBZllS?=
 =?utf-8?B?QkZmUlhBMy9OK2lhaTQxQmZ1MG5ZazlnVHV0ZUdWVHBHZ3djQzRISTlFK09Y?=
 =?utf-8?B?c3ZjOXlRTlRsV1I4UEM2eHRjcjZJcjI4SzVqeDkrVnd0bDhWUHdXRlcycTEw?=
 =?utf-8?B?NjBXRjBWdE0vWEd1Z0U0US8vZ1lvSlJUUHBpaXFlY2tPNTJTMDF5aEdaMUh6?=
 =?utf-8?B?NlRYZFNwTWVaMUp2WjJsNUIwRUE5U0VVV2JaK29oK0NENjFVRU81dXdqcFhy?=
 =?utf-8?B?YkNEdUsySXBwdFp3cXhYQ1VSUmlNdzNwMXpWa2t1a1ZRYmZGVzlMYzZ4VExL?=
 =?utf-8?B?Wjk1bnNTS1BRVk1UVW9HK2hHblUwSEZjcmljYS9mMEZGKzNCTmlTcU1zT3Ju?=
 =?utf-8?B?di9LUlZXc3lVSkRwUFdEdU9Nc2JaMUNYaVpzdnQyY0FNRzlHS1FJVWIrWTU0?=
 =?utf-8?B?NGJHbXJyY1lWdUVVR1F2NDBjaXU4REtiaVhtdnRUWGszUTZHMXhDM3pGZmFq?=
 =?utf-8?B?ZFBpTXpSRXRiRkVoY0ZFcmxtVHFaZUNnWWJIc0NMWU04L1lnUGZabm42NXcx?=
 =?utf-8?B?RkxwM2F4M3ZoVFNLWStDWDFGSTljNmVrZGRSUkpuUmRXeDU5M2VvMVJTdVov?=
 =?utf-8?B?a2ZKQ2pNOVc5Y3V3V1kvMTNPTG5XMlgvdVZGaDN3T1VGNzFSVW1TV1pGSTJh?=
 =?utf-8?B?N3JVWDI4WUJVQUdNTmhwOStCaC9XVHQrMzZyS0pvSkF3b0dkNkx1UVJqSVlt?=
 =?utf-8?B?clhKNUtmb1hTV2ZnWXF5dVM4RGtCODFBNTZnZHl0MnVYbjB4b3E1S3ZKaFo2?=
 =?utf-8?B?WkNmSU9Gd0lDeFlkKzhuNi8xODBzV0sreDBacFAyQVIyTnFxRXAydHZuSGRK?=
 =?utf-8?B?QjFRY2UxcCtja2FueGlqRVRwTFRqRWJ1dGJ6YkVLdXpuNlBEdlQyY1BEQTQy?=
 =?utf-8?B?QWQ1L0RMZkRmTGc4eE5pYS9VOGlZMjhSNWxnYlVFZ0RjTnV3d3M5SmJ2UWRO?=
 =?utf-8?B?YnZ1K3BZMGl5cEVXMjBuRHBuMFBkVVg1VFJKbDBVUCtFZ25xN1pVVnlPNXEx?=
 =?utf-8?B?ZERGY3ZLMUdOakNVWVJYZ1NvTWcvd2NNZUV5V3JDbnZsdDAzaDNZZXkxdEdp?=
 =?utf-8?B?Rit6UkMyMnV6dmtFa2FRK25nc3VQazBuVUt3SWVjTzNvOGlDUCtLdllpQ3lz?=
 =?utf-8?B?WE1xRnVFZlFPWExwZWhPWVV4VlFOaTNOKy8rK3NFWUV2VFBKeVBSVXVmUS9T?=
 =?utf-8?B?bEQ1cHlQcjdCdVlDT3pHTndydFF3VnBBVSttbC82OWhiR1hadTZ5QllPRENG?=
 =?utf-8?B?NCt6U3BjSlpRS0NYMk14WFhLWkxUQnZjeWZMSGhTMVdUZkYvOFRIaXNuOEZK?=
 =?utf-8?B?Smc3U0hzVEtkNDA4dlBHZCtuRjNyRmpxMmZGR0F4V0RmRG5tRS9iR3EvY0Y3?=
 =?utf-8?B?V1JmaytvRnJJNlVMNzIwTkZEYkpmN0F4OTA5N2lmMnBNaXk0OURjOVNjMi95?=
 =?utf-8?B?M2pKQkUzRmNXRlNXSVRLamFhNHNjTmF3SllxWXhPajlpajBHdEVkS2JwVjE1?=
 =?utf-8?B?TUd0bHV0Z2ZBZ2tScURTVzVqdi8rWktaQ0RPN29Pcm1sdVpET2hlQ3VXR1JJ?=
 =?utf-8?B?Z1FySm04bFN0Tm1JRjQyZzU5S2I1K1ZiZkhvZmJLZE5NeU1PeVdKMWdWTkhX?=
 =?utf-8?B?ZkdydWhhSG5MVktUeENPcjV4enhJSzFjYUl6dnlYLzBNcUoyZGxHcEVNejdz?=
 =?utf-8?B?U1BaUlZEZXdCRy9xQVR0WDgvT3NDamZvQjVwMVZLeUVpWTc0dSs0c0prRzJl?=
 =?utf-8?B?UHVvRGJOVGJWZnYrWGFBL1JBRWZNTHUvRXNZcXdoYTl0WUptRmdjWEhIRjNw?=
 =?utf-8?B?Vnp0cnZRYysyWFdlcVJtcis5MzZpRlh1MEdPVEk4QldvMFlnTkdQYlVNdTBy?=
 =?utf-8?B?U2xvWTA2QjN4cEh5MTBqN3dEYWNKeVNWUTV6cFd6ZmdlN0dyTnJ5ZWQ5WTh3?=
 =?utf-8?Q?8T0+oriW2Eb55kO4=3D?=
X-Exchange-RoutingPolicyChecked: YHtdMFyl8weKoCIJ6kvPB1B3kw5SKderBTrr+e7w1ykroLIZN+Holx5jwcxVyaRt2izVhXu23LN5ayiMEGmxfmPjIoBQvD44O43CxC8Mg4a3yRYmyuIng9IzXJJk33yJKk91WElDgrWoZV2nQinWxd+hfCn2E8nxWM3k1G4f4OuNEQjUzHe3qc+kmH9T7b/Lqjhdrvkbe1MHh/siggdL9akyAiQB4PRz7ycee69OXv2xMaO5PaOMUtRv2Uk3eXM6bliy+7JaHRPZd4tujEZepMBms342MQTYpVRQOv5nfevSNbgu8IfR+/k7y5Zg2+FInv6f37K36J4hF2S7nnEEgw==
X-MS-Exchange-CrossTenant-Network-Message-Id: efa7fcda-84ea-4502-d1a6-08de8b7d58c5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6519.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 21:19:21.1873 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 88nGwcr4xlnH7OJwShzXQMzmAEo+B0GfQrnARDf4Y62+J86pQQbQUulvlB92V4ZlNB9TVGrHBZd7yRHygQB3wQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5791
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

On Thu, Mar 26, 2026 at 06:58:16PM +0530, Raag Jadav wrote:
> As per uapi documentation[1], the prerequisite for wedged device is to
> drop all memory mappings. Follow it.
> 
> [1] Documentation/gpu/drm-uapi.rst
> 
> v2: Also drop CPU mappings (Matthew Auld)
> 
> Fixes: 7bc00751f877 ("drm/xe: Use device wedged event")
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo_evict.c | 8 +++++++-
>  drivers/gpu/drm/xe/xe_bo_evict.h | 1 +
>  drivers/gpu/drm/xe/xe_device.c   | 5 +++++
>  3 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo_evict.c b/drivers/gpu/drm/xe/xe_bo_evict.c
> index 7661fca7f278..f741cda50b2d 100644
> --- a/drivers/gpu/drm/xe/xe_bo_evict.c
> +++ b/drivers/gpu/drm/xe/xe_bo_evict.c
> @@ -270,7 +270,13 @@ int xe_bo_restore_late(struct xe_device *xe)
>  	return ret;
>  }
>  
> -static void xe_bo_pci_dev_remove_pinned(struct xe_device *xe)
> +/**
> + * xe_bo_pci_dev_remove_pinned() - Unmap external bos
> + * @xe: xe device
> + *
> + * Drop dma mappings of all external pinned bos.
> + */
> +void xe_bo_pci_dev_remove_pinned(struct xe_device *xe)
>  {
>  	struct xe_tile *tile;
>  	unsigned int id;
> diff --git a/drivers/gpu/drm/xe/xe_bo_evict.h b/drivers/gpu/drm/xe/xe_bo_evict.h
> index e8385cb7f5e9..6ce27e272780 100644
> --- a/drivers/gpu/drm/xe/xe_bo_evict.h
> +++ b/drivers/gpu/drm/xe/xe_bo_evict.h
> @@ -15,6 +15,7 @@ void xe_bo_notifier_unprepare_all_pinned(struct xe_device *xe);
>  int xe_bo_restore_early(struct xe_device *xe);
>  int xe_bo_restore_late(struct xe_device *xe);
>  
> +void xe_bo_pci_dev_remove_pinned(struct xe_device *xe);
>  void xe_bo_pci_dev_remove_all(struct xe_device *xe);
>  
>  int xe_bo_pinned_init(struct xe_device *xe);
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index b17d4a878686..4c0097f3aefb 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -1347,6 +1347,11 @@ void xe_device_declare_wedged(struct xe_device *xe)
>  	for_each_gt(gt, xe, id)
>  		xe_gt_declare_wedged(gt);
>  
> +	/* Drop dma mappings of external bos */
> +	xe_bo_pci_dev_remove_pinned(xe);

Do we even need the part above? unmap_mapping_range() should drop all
DMA mappings for the device being wedged, right? In other words, the device
should no longer be able to access system memory or other devices’ memory
via PCIe P2P. I'm not 100% sure about this, though.

Matt

> +	/* Drop all CPU mappings pointing to this device */
> +	unmap_mapping_range(xe->drm.anon_inode->i_mapping, 0, 0, 1);
> +
>  	if (xe_device_wedged(xe)) {
>  		/*
>  		 * XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET is intended for debugging
> -- 
> 2.43.0
> 
