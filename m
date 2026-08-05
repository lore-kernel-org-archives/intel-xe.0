Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E12BC55ABA
	for <intel-xe@archiver.kernel.org>; Wed,  5 Aug 2026 12:14:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38B4010EE2B;
	Wed,  5 Aug 2026 12:14:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BBYy9zmI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B32F10EE2B
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Aug 2026 12:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785932049; x=1817468049;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=iIb11Lkt2KUt0URXDNQyCa3ClP3BXLvvVednBrjooJY=;
 b=BBYy9zmI0bED+wRkJTgb02czxdsqfGZUmS1EzN5hHfKdnMF5NA8kXV/1
 pKJhzsQLhbQ0bX+oesTD+FmqEYoMekzk0tvFyVbB3oK9g0t2lXn34E9VD
 XNEFqpZBBsoSVamd5yCACZzWQSVhM9lqSI6junmvwxYyP8nbWuoCTykj4
 MqeUVmoSlg5f7EklmxkpQuqljpnnKa1rYk+HrB6FBNoMtRVd33RGfqvSe
 oTyhNRIyI/HZTIEgRmjmvWEZZ3qrbKH0o0EiOjac8AqmIN56pMsOmLDbw
 +2QnCCz0AfKcIhlDHEsoDGw9SX4ywRXoH1IYkGTmTLXC+l3Py2O3ePbXE w==;
X-CSE-ConnectionGUID: lfagBS+/TjS/ofH2D+qSfQ==
X-CSE-MsgGUID: Sd3Tv5IdSgK/RyUfXu1lHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="90318774"
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; d="scan'208";a="90318774"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2026 05:14:09 -0700
X-CSE-ConnectionGUID: j8qQcuXTRzWe0fLsho7hDA==
X-CSE-MsgGUID: I3hML3XxROuDH/9hO0chmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; d="scan'208";a="265633674"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2026 05:14:08 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 5 Aug 2026 05:14:08 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 5 Aug 2026 05:14:08 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.38) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 5 Aug 2026 05:14:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OXnef6u0Qoti6VuHge1oKEIUdfl1geLE3rPvFQJP7VhlPJY9E/DQHeTg+EvkZUjLsblXhkyKkuGzr+GzqfHSy9cCFD4zSpuk7S6pjB4lbYTKKxa1KNwpRM34KdrQV7aNgDof9GVTUn/KhZ+kDxazWnDsC+a27nLvCTmuj5y3yKihVimFCH3/Din/lwCAg/y+1bMc8ZVbhf9sBxUYZgjfPgDxHTXP3p/+/AENi6KBAjm8Ty4JWJ/vFMYTz1YwDQxIQFXckUNOZqRymN9ztW5eWprX4QIcPg+hJRei+Eu62vJheGRzgS3IaatGc9ttvdJ9GgFjw0BGlneKc4bziFu9LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ByAqIq/EJ6xODWh5WMn4aMworAGRBTJCZCxf9Z7h5t0=;
 b=UGSdxWRYDIlCkDGSRoDB3cCoX88mTKwGSEyr5H3jYapAu0qCVRTyvB3pnw090bnamvBbN1JA7jfzM8yJdIERIiubAF7MQVfBqab92PlR9NfoujrUlxKHv0icAbZJk8uy1Eq0Z69MxNFf423Hq84C8PhW8YvsdkDnfAyuW+acrrVnsc2LpXRIOKznFrOsKGOOWwZE98l2dY9StoeMa9FroBOFFpuGFCbY+ONeI5KWJm55+XSjfevGsvvLmjKSv7ti1i1ZO4rwKItTc0UZ3WKmcQQkA7Q6Y8QG9qzOwV5WBrhD57vttr6sOZCW8YLS7O2R0vA1zL0XZGywKLT58SXd9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DM6PR11MB4643.namprd11.prod.outlook.com (2603:10b6:5:2a6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Wed, 5 Aug
 2026 12:14:04 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0292.018; Wed, 5 Aug 2026
 12:14:04 +0000
Message-ID: <f9904ce7-4c29-4e2b-885b-f4eda23242b6@intel.com>
Date: Wed, 5 Aug 2026 14:14:01 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] drm/xe/tests: Add KUnit tests for VF provisioning
 error handling
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260728095026.2197333-6-satyanarayana.k.v.p@intel.com>
 <20260728095026.2197333-10-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260728095026.2197333-10-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2PEPF0000089F.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::65c) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DM6PR11MB4643:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c63871c-97df-4972-b5d5-08def2eb0a96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|6133799003|10067099003|11063799006|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: Uk7OsNLrIeekmTFbuqnggwEfyptWgJZ5rXBKvxzK3gXtFKDBDNYNBlG39plNImIS4ysp4PwBgw3pGDOian2T+CZ2UTv5R3px+ZU2UU0xNiBaiUSUKhir0Ioqko2kv7yMB3mfUkT8S5BoTTTdAfAzK8Fd7mmwanUpvI0z3ftzKq7EVU+2VlHj+hrYoO5geXkx0WvGmgScC+X55hB75hHTgSk5rh40PP+j9x8uD8rNiF6fz2USxpk0N2ZH7MeE4xp4OsGLOU799gVEau7Wp6E9A9Ps9mu02sG6gfLkFre6rzQY2DqIGzxF7ANL9a+j3Vdc6GwTFOyEvBAHh23cjXlY9sfeFrVzzZh+aY9Mjn9oxL8wYXq9XApNog476MhWvl8obNLSnjGd8wo6wE/IAi17hm+YsVQtX7ZOlXokXV6wwvb++9LVxqT709m+niO/i21707nYtpnYW84TqZnsiC4eRwpTj8fhH2YP7IVaV1Fkz+jvhsO3RIjydr1bt2GHCHXevf5Z7m9vpoEo7TDRmLUotaP4KfAkzKkLeLgut9DiJ+GmcfhwUdEok3HCSN8px+SUDLq6Rx7RvjeNh9yGP3OGs2HqdfoTm7MRRbFW2THfHiGKeyaa643Rai6KXe15Dr6kGH6/IYv3jTi21eCsr70g8ahdoYxcBDpvFBRhH4hh38E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(6133799003)(10067099003)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OVdzUURPa3F3S1o5SjQ2TzRsd2t5ZGJ5aTRlNUpXY3NQQytERUlzZE8wSGVM?=
 =?utf-8?B?QWRseUN2R0hyckU2andkRTdEUG5QYUZEQkczaEJhM2xDR2hlNWtYa0JyUlFO?=
 =?utf-8?B?a0dhaUR2RGRyWllUaDd0dk04OVc5aU5GajJ6cDFEd3p6THpKRnN3N0pWV2Fn?=
 =?utf-8?B?bkpWRzZCbVcxK2VoTmZRRTNHRlBXUlhXc2txMEo4SkhMVzNyQ0dlQ212RjRu?=
 =?utf-8?B?cnVBN0JxUFBrbnZ6SVM2N2xjZjlvYzJ3a1Z4WUJRNHRUR3FsOTBkK2FDajV6?=
 =?utf-8?B?cGNwQnYyL2RZc1VZL1Z1QzdXdGx3VjcrbUdrRHlVR1RnMFlQajZxTW1zTlRa?=
 =?utf-8?B?U25TczViZlhqRFExQzR1QysrU3lFOEM2NWFUd1FVQnFOUlJEN3YzMko2eSta?=
 =?utf-8?B?SjFJNnk2Rnl0MDVtNzhjN3UvQUh2M0U2UFBScGRUL2hNcEt4WS94bC9Md3Uy?=
 =?utf-8?B?dFFvTEtlSmxMbzNJRHlpRnZsUjhrQjBUd1BNT3J0enFFc1R2OURVMVJIcGRs?=
 =?utf-8?B?NVJVU2xMT1NqU3hYMHVuSFMyRDhjN1Flb2d2VEZJRDZrNXUwaVNxS1k5Ty9Z?=
 =?utf-8?B?ZE9MVU9GM2tYa0plTG1qUVBzOXZYMXhtcDNOQ21nY0tieVhnaHlmem16SEln?=
 =?utf-8?B?YVMvL1d1c1ZmL0IwZkplaDhnY3hZQWduV1pOcTNsdDNaOVdkNG9WeXJjTEdq?=
 =?utf-8?B?M1J5Tzh4YnJ6MGFhMnRva3I1bDdXanRDc1FuT2dTNnBSeGVkT2l4T2lURmFG?=
 =?utf-8?B?MFBiOWtCdTkzcTdZcDgxOHhpYVZJRnhZZUYyY3lCdENSSEFrT2dQdU1QTFNP?=
 =?utf-8?B?QzZJQlFPMDMxTUdFKzk5K294R05Iby9Bd1AyZXA4SWNVZyt2eUlpOHQ1QjM1?=
 =?utf-8?B?NFVZcEQxSDRBc1pLeW1Tb05IcHZ1Vi9tWmdyc3V3OE04aENucGhDVStMc1VP?=
 =?utf-8?B?Z01aSGh5MXJsb2Z3TUxMY0hjM1Nta2xjdVpQdHhkMEV0UHVqZ0pZbzFZcCtP?=
 =?utf-8?B?eWJBMVdqZnVpMGEwVVZYZTlyb1dybjJsTGZEdkdjUk9SUzNMZEMyeU55QUVx?=
 =?utf-8?B?a1k4QktYS2pCVVNOVzBEN1JQcFVEV1lmQ2xKbUx4a2c5KzZaeVJNZTBQVFpR?=
 =?utf-8?B?NERQY1BRMGZ2WHNKQWJFVWttd0JBbm1oZEdiUFRrY3VicG1Nc1Q0Uy9zQ2Jz?=
 =?utf-8?B?WXJGSlRXNFRLdDhFMFBua0xCR1VIay80VllwdHhjNFRHZzdRR0RDZEpPTDBx?=
 =?utf-8?B?Z2dlVEJQcTBhbDE0bFVtWktwaExOMDFJaVowMzBiL3pRRGpzVU1qRUJHclpy?=
 =?utf-8?B?Uy9JcUpqeEdsaWtMRDBHUjFMWWtDMERRVEVibjR0SVpVOGlEaC9aUzcxUXhC?=
 =?utf-8?B?Umd5RzdYRDMwNkhBUjdESTM3ZE91cVRLbmF3ZVNhRlhDRHh1cUt4aWQ1L0dF?=
 =?utf-8?B?dWx3ZGoyZkRIcEl2aDJzRmVhYkwwdGJWMzFJNlVVb2E5aExSb0N1NXV2NFNU?=
 =?utf-8?B?NlRqRnAyajkzM1J5ZjF2YStEb3BuV1NlR2wyQnJaUzRmdU5kVTVYeGFHMEpC?=
 =?utf-8?B?aG90Tm01WHpqTlVQcUt0Ti9PeUxickd4NHJBNC9aRm5PWUxuNlpydmQwRUdv?=
 =?utf-8?B?OTlOL0x6aGdRaW4wR1VIdy9qUm5BeUhWem43SGUrTHR0V3p3dUdiUCtPRXFH?=
 =?utf-8?B?ZEtZbVowbFR4eDR2emVMdnBtaHBhdmNQZnQ3SFI5K2lIWVdaaUh3ZEg2R3lT?=
 =?utf-8?B?c3E1cXJOcG5nYVppTHNQaTQyRWdNYnFraWF4YTFuRmFJNld1UWh6UllkS1lW?=
 =?utf-8?B?bkR1NituNjdJYWpZQTZSaXZDaFIvelZHTExiRFZsWktFMUFodjhSbWVoR0hx?=
 =?utf-8?B?MFZucm5QTnVRMmRTeTJZSEhCWlpvMmsvSXcwbDV3R3IvajFkMGlIWGpSU01F?=
 =?utf-8?B?VlY3Ynd3dWFEaW1xQUFtdTluSHdWV2Fmd1JkMVU2YVFrYXYxREdIaWdKb0hn?=
 =?utf-8?B?Y3ROR0t0dUM2c2tTMEtnMmNESFNTK293OHFSNHE4OFAza2UvcmJuUXl2MjV5?=
 =?utf-8?B?VDBpaUtWb3Zlc3VqeUJpTGxHUVVDYlNPOUlJY2FRdzhTajJYWWVKSnFPRXEr?=
 =?utf-8?B?YjYvWHRZREJVWmQrNnZ4SEZOV0tNdWNnQVZuaGExTmRqcEtFWTJaZE1iVi92?=
 =?utf-8?B?eURnek0xakJreUo5VnVxalBCZU5pYkpKa3loVFpzZ2dxZGhCYTBiTE9hb0Rx?=
 =?utf-8?B?L2tPakJBQkk1MzNDMkxpcXZTMEtaTi9QUXppM3FCZC95N05IRnRxWVNMYlEy?=
 =?utf-8?B?dk5jTE9ZNktGc1M1MjlnRGxTV0xSUEdKalBsMmJhUjJSY2o0UkEvOXdTcmNU?=
 =?utf-8?Q?Af94rRCVNdZ7JlJE=3D?=
X-Exchange-RoutingPolicyChecked: B6Pd+miklNqZ4aTg341t36bJWKCc3FqgwvPvGlgQo56ajnKfkZNUT2/BrUwRWSWrs0YncCzBUBTNXwtZjjaCviVrSG0rW7fz70t0/EdNSsbjsb6QIWFCtULQhQbVzW+yTXFgXb6SfWRMi6cOo7XV77MTwAB6jJVjST6I4v24r797HRAtYinggIKTkaroFK7wyFZIXbwCia6hwz2av9ZufruhKTP226nDwlu86agp7cIW8Ue0bbtHzQ0gaQPg6dmkKFz3ZcOMQFbCv5dkiohYZy881ZSRkqVEFOnRbm8khKs6S7OTzVN/JC7Na4u8t+DnQJ47sRgS1LaMmW/e1uSZOQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c63871c-97df-4972-b5d5-08def2eb0a96
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 12:14:04.4648 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dq6Dp60AfLCM03DWYYyI6KtHJs14rUX0B6C0s2omEEQsShjFM9tM+bPFm6jMtYOtOwF75qNOmgfYtZvYvC8nk8fmkof6rshhZYJ/xo79RYo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4643
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



On 7/28/2026 11:50 AM, Satyanarayana K V P wrote:
> VF relies on the PF to provide a valid hardware configuration via GuC
> KLV responses. In unlikely event of PF malfunction or misconfiguration,
> a VF may receive incomplete, zero, or out-of-range values for its
> submission contexts, doorbells, VRAM or GGTT assignment.
> 
> Add KUnit test cases that use the xe_guc_mmio_send_recv() stub to inject
> bad KLV responses and verify that VF can survive without crashing for
> the invalid configuration data received.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
> V3 -> V4:
> - Changed stub function from guc_action_query_single_klv32() and
> guc_action_query_single_klv64() to xe_guc_mmio_send_recv() (Michal W).
> - Fixed review comments (Michal W).
> 
> V2 -> V3:
> - Renamed the test names. (Michal W).
> - Fixed review comments (Michal W).
> 
> V1 -> V2:
> - Renamed the test file (Michal W).
> - Fixed review comments (Michal W).
> ---
>  .../gpu/drm/xe/tests/xe_gt_sriov_vf_kunit.c   | 212 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c           |   4 +
>  2 files changed, 216 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/tests/xe_gt_sriov_vf_kunit.c
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_gt_sriov_vf_kunit.c b/drivers/gpu/drm/xe/tests/xe_gt_sriov_vf_kunit.c
> new file mode 100644
> index 000000000000..5444cad1eead
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/tests/xe_gt_sriov_vf_kunit.c
> @@ -0,0 +1,212 @@
> +// SPDX-License-Identifier: GPL-2.0 AND MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include <kunit/static_stub.h>
> +#include <kunit/test.h>
> +
> +#include "regs/xe_guc_regs.h"
> +#include "xe_device.h"
> +#include "xe_kunit_helpers.h"
> +#include "xe_pci_test.h"
> +#include "xe_guc.h"
> +
> +#define TEST_VRAM		SZ_8G
> +#define TEST_GGTT_SIZE		SZ_2G
> +#define TEST_CTXS		1024
> +#define TEST_DBS		128
> +#define TEST_GGTT_START	0xdeadbeef00aa00ccull

hmm, currently our GGTT is up to 4GB (32b)
why choosing the test (workable) GGTT start value that huge?

> +
> +struct config {
> +	u32 orig;
> +	u32 query;
> +	int expected_ret;
> +	const char *name;
> +} vf_ctx_testcase[] = {
> +	{TEST_CTXS,	TEST_CTXS,		0,		"same",		},
> +	{0,		0,			-ENODATA,	"none",		},
> +	{0,		GUC_ID_MAX + 1,		-EPROTO,	"overflow",	},
> +	{TEST_CTXS,	0,			-EREMCHG,	"lost",		},
> +	{TEST_CTXS,	TEST_CTXS / 2,		-EREMCHG,	"reduced",	},
> +	{TEST_CTXS,	TEST_CTXS * 2,		-EREMCHG,	"increased",	},
> +}, vf_db_testcase[] = {
> +	{TEST_DBS,	TEST_DBS,		0,		"same",		},
> +	{0,		0,			-ENODATA,	"none",		},
> +	{0,		GUC_NUM_DOORBELLS + 1,	-EPROTO,	"overflow",	},
> +	{TEST_DBS,	0,			-EREMCHG,	"lost",		},
> +	{TEST_DBS,	TEST_DBS / 2,		-EREMCHG,	"reduced",	},
> +	{TEST_DBS,	GUC_NUM_DOORBELLS - 1,	-EREMCHG,	"increased",	},
> +};
> +
> +struct config_vram {
> +	u64 orig;
> +	u64 query;
> +	int expected_ret;
> +	const char *name;
> +} vf_vram_testcase[] = {
> +	{TEST_VRAM,	TEST_VRAM,		0,		"same",		},
> +	{0,		0,			-ENODATA,	"none",		},
> +	{TEST_VRAM / 2,	TEST_VRAM + SZ_1G,	-EREMCHG,	"overflow",	},
> +	{TEST_VRAM / 2,	0,			-EREMCHG,	"lost",		},
> +	{TEST_VRAM / 2,	TEST_VRAM / 4,		-EREMCHG,	"reduced",	},
> +	{TEST_VRAM / 2,	TEST_VRAM,		-EREMCHG,	"increased",	},

what about unaligned (non-2M) sizes?

> +};
> +
> +struct config_ggtt {
> +	u64 start_orig;
> +	u64 start_query;
> +	u64 size_orig;
> +	u64 size_query;
> +	int expected_ret;
> +	const char *name;
> +} vf_ggtt_testcase[] = {
> +	{TEST_GGTT_START,	TEST_GGTT_START,	TEST_GGTT_SIZE,
> +		TEST_GGTT_SIZE,		0,		"same",		},
> +	{0,			0,			0,
> +		0,			-ENODATA,	"none",		},
> +	{TEST_GGTT_START,	TEST_GGTT_START,	TEST_GGTT_SIZE,
> +		TEST_GGTT_SIZE + SZ_1G, -EREMCHG,	"overflow",	},
> +	{TEST_GGTT_START,	TEST_GGTT_START,	TEST_GGTT_SIZE,
> +		0,			-ENODATA,	"lost",		},
> +	{TEST_GGTT_START,	TEST_GGTT_START,	TEST_GGTT_SIZE,
> +		TEST_GGTT_SIZE - SZ_1M,	-EREMCHG,	"reduced",	},
> +	{TEST_GGTT_START,	TEST_GGTT_START,	TEST_GGTT_SIZE,
> +		TEST_GGTT_SIZE + SZ_1M,	-EREMCHG,	"increased",	},

what about unaligned (non-4K) base/size?

> +};
> +
> +KUNIT_ARRAY_PARAM_DESC(ctx_testcase, vf_ctx_testcase, name);
> +KUNIT_ARRAY_PARAM_DESC(db_testcase, vf_db_testcase, name);
> +KUNIT_ARRAY_PARAM_DESC(vram_testcase, vf_vram_testcase, name);
> +KUNIT_ARRAY_PARAM_DESC(ggtt_testcase, vf_ggtt_testcase, name);
> +
> +static int xe_guc_mmio_send_recv_stub(struct xe_guc *guc, const u32 *request,
> +				      u32 len, u32  *response_buf)
> +{
> +	struct kunit *test = kunit_get_current_test();
> +	const struct config_vram *c_vram;
> +	const struct config_ggtt *c_ggtt;
> +	const struct config *c;

maybe it would be safer/cleaner to have separate stubs for each config type?

then each test will activate proper stub (instead of activating this combo in init)

> +
> +	if ((request[0] & 0xffff) != GUC_ACTION_VF2GUC_QUERY_SINGLE_KLV)
> +		return -EINVAL;
> +
> +	switch (request[1]) {
> +	case GUC_KLV_VF_CFG_NUM_CONTEXTS_KEY:
> +		c = test->param_value;
> +		response_buf[0] = sizeof(u32) / sizeof(u32);
> +		response_buf[1] = c->query;
> +		break;
> +
> +	case GUC_KLV_VF_CFG_NUM_DOORBELLS_KEY:
> +		c = test->param_value;
> +		response_buf[0] = sizeof(u32) / sizeof(u32);
> +		response_buf[1] = c->query;
> +		break;
> +
> +	case GUC_KLV_VF_CFG_LMEM_SIZE_KEY:
> +		c_vram = test->param_value;
> +		response_buf[0] = sizeof(u64) / sizeof(u32);
> +		response_buf[1] = c_vram->query & 0xffffffff;
> +		response_buf[2] = (c_vram->query >> 32) & 0xffffffff;
> +		break;
> +
> +	case GUC_KLV_VF_CFG_GGTT_START_KEY:
> +		c_ggtt = test->param_value;
> +		response_buf[0] = sizeof(u64) / sizeof(u32);
> +		response_buf[1] = c_ggtt->start_query & 0xffffffff;
> +		response_buf[2] = (c_ggtt->start_query >> 32) & 0xffffffff;
> +		break;
> +
> +	case GUC_KLV_VF_CFG_GGTT_SIZE_KEY:
> +		c_ggtt = test->param_value;
> +		response_buf[0] = sizeof(u64) / sizeof(u32);
> +		response_buf[1] = c_ggtt->size_query & 0xffffffff;
> +		response_buf[2] = (c_ggtt->size_query >> 32) & 0xffffffff;
> +		break;
> +
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static void test_ctxs(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +	const struct config *c = test->param_value;
> +
> +	gt->sriov.vf.self_config.num_ctxs = c->orig;
> +	KUNIT_EXPECT_EQ(test, vf_get_ctxs_cfg(gt), c->expected_ret);
> +}
> +
> +static void test_dbs(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +	const struct config *c = test->param_value;
> +
> +	gt->sriov.vf.self_config.num_dbs = c->orig;
> +	KUNIT_EXPECT_EQ(test, vf_get_dbs_cfg(gt), c->expected_ret);
> +}
> +
> +static void test_vram(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +	const struct config_vram *c = test->param_value;
> +
> +	gt->tile->sriov.vf.self_config.lmem_size = c->orig;
> +	KUNIT_EXPECT_EQ(test, vf_get_lmem_info(gt), c->expected_ret);
> +}
> +
> +static void test_ggtt_size(struct kunit *test)

test_ggtt ?

> +{
> +	const struct config_ggtt *c = test->param_value;
> +	struct xe_gt *gt = test->priv;
> +
> +	gt->tile->sriov.vf.self_config.ggtt_base = c->start_orig;
> +	gt->tile->sriov.vf.self_config.ggtt_size = c->size_orig;
> +	KUNIT_EXPECT_EQ(test, vf_get_ggtt_info(gt), c->expected_ret);
> +}
> +
> +static int vf_gt_config_test_init(struct kunit *test)
> +{
> +	struct xe_pci_fake_data fake = {
> +		.sriov_mode = XE_SRIOV_MODE_VF,
> +		.platform = XE_BATTLEMAGE, /* any random DGFX platform with SR-IOV */
> +		.subplatform = XE_SUBPLATFORM_NONE,
> +		.graphics_verx100 = 2001,
> +	};
> +	struct xe_device *xe;
> +	struct xe_gt *gt;
> +
> +	test->priv = &fake;
> +	xe_kunit_helper_xe_device_test_init(test);
> +
> +	xe = test->priv;
> +	KUNIT_ASSERT_TRUE(test, IS_SRIOV_VF(xe));
> +	KUNIT_ASSERT_TRUE(test, IS_DGFX(xe));
> +
> +	gt = xe_root_mmio_gt(xe);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, gt);
> +	test->priv = gt;
> +
> +	kunit_activate_static_stub(test, xe_guc_mmio_send_recv, xe_guc_mmio_send_recv_stub);
> +	return 0;
> +}
> +
> +static struct kunit_case vf_gt_config_test_cases[] = {
> +	KUNIT_CASE_PARAM(test_ctxs, ctx_testcase_gen_params),
> +	KUNIT_CASE_PARAM(test_dbs, db_testcase_gen_params),
> +	KUNIT_CASE_PARAM(test_vram, vram_testcase_gen_params),
> +	KUNIT_CASE_PARAM(test_ggtt_size, ggtt_testcase_gen_params),

also, what about adding test cases that will also inject GuC MMIO communication errors?
and/or return too short/too long KLV?

> +	{}
> +};
> +
> +static struct kunit_suite vf_gt_config_suite = {
> +	.name = "vf_gt_config",
> +	.test_cases = vf_gt_config_test_cases,
> +	.init = vf_gt_config_test_init,
> +};
> +
> +kunit_test_suite(vf_gt_config_suite);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 69e531be15ed..dd06b23d7a9d 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -1661,3 +1661,7 @@ int xe_gt_sriov_vf_wait_valid_ggtt(struct xe_gt *gt)
>  
>  	return atomic_read(&gt->sriov.vf.migration.fixups_complete_count);
>  }
> +
> +#if IS_BUILTIN(CONFIG_DRM_XE_KUNIT_TEST)
> +#include "tests/xe_gt_sriov_vf_kunit.c"
> +#endif

