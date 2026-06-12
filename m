Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1B8BCD98CE
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jun 2026 21:42:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67A8E10E110;
	Fri, 12 Jun 2026 21:42:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M0/u4DLG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5E5310E2C1
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jun 2026 21:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781300567; x=1812836567;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nKmjQcu9vxbqMwDGkYzhMkF5EG0C8eIn5lUluhme8OE=;
 b=M0/u4DLGv1iZYkaiAdT8bFLgq/i7kfVuVKDHuf5BrVoKr08UCxOpsVCb
 fs4lS54XbgznPorl8AtijPwad6tecDLB5Nvd1+zi/RJ9MR8cbuSQdRzmF
 0QTa84Hrds6GG9+SZtyyy97PCJkVuzfJ9EJf5Jt2uO4Ul6RFYEBpKf/Er
 lGbFB82LhdTrFJTLYHgb+NeGW7EJkT3jZqUnpPD9KbKrNaMFAGtWCfptr
 4TX0qxy5buHxTpUqboNJ3h1FjlhFwv4we734sqbmgGhDmGaO9wF0a9H+3
 Q+AGymXhDdofmQX5+ubrdzAGEseFzgMhJqlQ/SKhrjZuiQW6tbY16ZlI6 g==;
X-CSE-ConnectionGUID: bbqA6SzWTby3RR3LsSg1jg==
X-CSE-MsgGUID: 5ZgLXWczRYSIT8BdJs+hcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="85985545"
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; d="scan'208";a="85985545"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 14:42:46 -0700
X-CSE-ConnectionGUID: ahEZegZmRbaMZF3IBRVnDQ==
X-CSE-MsgGUID: 3Ns2iLdoSEijqzTQcmcRdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; d="scan'208";a="250840147"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 14:42:47 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 12 Jun 2026 14:42:45 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 12 Jun 2026 14:42:45 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.22) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 12 Jun 2026 14:42:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wBHtPYlNO/kbKf1h+WyJefCHFkwYtYiJDue+fq2v4jZprPbmeHAUeQ6El10msx3HtLeL09Ud0Yor1+V3jkK42SC/fmBwyAGrvK7a73y2WtaYoXDIxnq5tsc6soQBOQ8qhMPgog9n9RybjZLZa2DOU/0SrtOGprR3hPQB1Fo9UzYEdJfz5dgSPi+uwUVLrbQjgfculPhGYKVvBVtlVTc6MI2KpeGK75M9exfRc4fLYfSycI4nCdHqOwpQLmzpOMMN/3IckYyGaJOKnVnfGbAUHfCyTNM9oVGQ8pZyWYDDxMnKtJHAyyjIYgx0FUJQYmMFaH5ZveuV82Sjg8ea4PdYpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fORYq94fSIZBdnsfHLsWelIdexeppORse9cQ44a5kPk=;
 b=EubQS2ioqkjlZE6cewvmM0cs/vxJG5FFYZO6hthVFlJeSYvHrxfe8UokRUtyjNZhvRjbPGi0vf2Rcrb/9Axh8q34O3ea75zw82frvHjr1ivdU3PKu1O9nnRvjP6LD/a3wkuAtQFvtSMmDv02/5VZuBfldwuk1Inje8p4uAb1EXxpfLBC5RK5tItM4Y6xGUaqzY8kQORpjtaicpTbvyehSwOhliHn5neWf5qFaGXxbVAgPKT462Qognz1DF661kUWDzRJGqWQSHS48ZmDwo0LT2H1/f9n+N7Syug5SCQ54rY62hWfh0U6oxBgXyQPT6xX7yRHcnh8jrNFzhKkn3d40Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by PH8PR11MB7095.namprd11.prod.outlook.com (2603:10b6:510:215::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.15; Fri, 12 Jun
 2026 21:42:41 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 21:42:41 +0000
Date: Fri, 12 Jun 2026 14:42:39 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 3/9] drm/xe/rtp: Keep track of non-OA nonpriv slots
Message-ID: <aix9TzM13Uul7aV+@soc-5CG1426VCC.clients.intel.com>
References: <20260608223624.3711760-1-ashutosh.dixit@intel.com>
 <20260608223624.3711760-4-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260608223624.3711760-4-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR04CA0300.namprd04.prod.outlook.com
 (2603:10b6:303:89::35) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|PH8PR11MB7095:EE_
X-MS-Office365-Filtering-Correlation-Id: a0cfb20b-f2e1-4c2a-4f39-08dec8cb8784
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|22082099003|18002099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: R9P2zXJlbW9nKeoN7RIPyrJPqopYeIxmUu+OqPgx9HkmzCuOb8zA44xXYsN9uw4JdDfopzB2q6ZMalQiUOoZ5c32RCp93O95VcA8vwoxMDxWa3IbLvN2BUn/u7yU3p7vAcqdaDS9Hnq28us6vTu+V5dzuuXzaOovLZy08PEVLwMEJngf1fIlUXyBXC8QdSmrm1KNXLomHPSUBrx/0ayVVdrbmE7xHdwOn+SX/N7W8UQsWf4uY2MzT1uxt552QjI03YOaDS3lhdGLEkX9cWJzXhL2dvaPsunH7qFzxverRLl/d2XFEnwoc9Id0kIEIwtl6uvu7KekzGmbyyOeyMRiRxqcYdflHmDrQZML9o9JxIkNwPYqM1rCndKZrSSztbABGaHTsglX5xGSdN9QZhDJleAApM0GS6884N4hxR4PS6NWWTfdV4F33xjIkpnunD4SrHR/unGP7EU9bzH/V/huzjY+xCHiwUq+ox24hSr8y2zani98nhTHuLx1m9wRdfNQAUE7IieNXUMIzYtXeOhIWTN1bMcl+1XqzvVHL2t1P+QyowHmnZxtVodXcW2wzggLh+EntHFkEVyeHxdnR2D+50O6V8sOS6tFZ11CaO0Vvhu315ezGwOgeajEU/ARXwIA/292i0PqAsPtuwF0tjsKqc15aksiyElUAarxFaVvgEq3Ifp2y79cTslcuyhY/WLk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(22082099003)(18002099003)(4143699003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0FvbS9GLzNTenhEYTJSMDM5akdIb2E2ZnlJTENneXlZaVJSQVhMbVZqcGUx?=
 =?utf-8?B?Z0pxc21McmNKMFowaW52WW01bEIxVDNaV2w1aXJJenlvOVVlNFIvTFFCbDVi?=
 =?utf-8?B?NEduczNiZ3VzYnNpbzFoUkRRRmhnKzhiei92U3dobWpNc2wzYVFiSGxQZEhP?=
 =?utf-8?B?akRPaFpyMUtFamFTdVkrYTVvNVdHUzc0QitsbktLTStXUzBGN0NRTHp5V29u?=
 =?utf-8?B?UkJjOFdIQys3SzNsNSt6N1YxbzdNMngzcFNobXRwaFEvZkNjMUt3eVNLdEZT?=
 =?utf-8?B?SktqRmNkd3FXTDgvSldoV21iWTVKci95SUlZaFNNWFpxSzI3ZW5qT0VDcXIy?=
 =?utf-8?B?V0dRcDV6UE9sb0hZVHlSbVpPT3V1TGxTVlhBdWdXeEF6MU00eUdZcGcwVFM1?=
 =?utf-8?B?WERLV3ZKVEYrN1ZZVjhPMGxHVUNEMmNYeERkR1RrdzR1WXJLdlpyNEJDekkv?=
 =?utf-8?B?UWozM2RqMnJCQ2cwTVNFZy93YjZrRWlrWml3UWtKaWU4S2FhYm84RjBmcnc1?=
 =?utf-8?B?VG8wOW1uQmthbUg5OXRxT0l5NU9GbTl5V3BiMjkvUnMxSTZCbmlDTHkrQ1ZP?=
 =?utf-8?B?SGluNGhyYldYTzF1TnBVZjBNY2ZvRGFlcUZKMHBCcGhCWWg2eklUakZtYmVK?=
 =?utf-8?B?MGdCQjloVHIxYVErWTArMDhSSjY4NFEwM1lXOElNbkxLelRoRncybWxQMU9G?=
 =?utf-8?B?UE1CcHNmTlFvWjYvREc1bFN0QThLaGRkQTkvcmJIY01veVozVTJJdWlGTmNv?=
 =?utf-8?B?S0FkZll0NENNeXZacWoxSDVIZENIOXpWV3plVUZINk1zaEkrdTVDWkdJenRo?=
 =?utf-8?B?SGJvTGhYUUFYck5KQWRCbW5GczZlbXhrSEFrMXBUeFNhdGhpSWJLUGlCMGlV?=
 =?utf-8?B?eXNwUHR3SXQ1bFRPemJCU2NLeHhlbW5JbFJFdHRKaHNVVnBXbGU4VkkxWnVD?=
 =?utf-8?B?N3JLZ3A4bEk3QkF4SmdVNnlqRkJpUkZSd0RONVM4cDFMbHpHZDZTVFpGUXVz?=
 =?utf-8?B?OUdqUGJnYVRSRVlNWmZzRUY0UkZQSzJuV2lrU3NIY1JlR1lOdEd2eWQ3clds?=
 =?utf-8?B?ckxCVjNsYWVveE9KcENGVkg3U05PRU5rZXJRZC9VeTNDdEVmc1h2SjZhVzds?=
 =?utf-8?B?ZVJBeTRmckNJQURhTWpzQnpJMHZWd1hkYXpLOUpHY05Xc1VJY0FLcFc0UFRr?=
 =?utf-8?B?dzQycld4eE8zMUhhZGpSSTlwbnBESEhRTzdJRmNMQWFxaVhjdUdkUUhEZURq?=
 =?utf-8?B?REJTSEd4dGM5QlViSnA2NW1lNXg2UHZmR1gvS2VvWVlqSEFGRFYyblloSFRa?=
 =?utf-8?B?U0hvSmZ1UlFLdUkvZTlBSm1xYnpBRE9rK1hIQzBFOVJ0dDRvdjJreEVpL1h2?=
 =?utf-8?B?Vlp2akNaK1ZHUUladTNFby9QRHFHZlh2L2FJM0ZPTUFmSUxIL2xkNmR0SGQ5?=
 =?utf-8?B?cFk1SEtrREZxVVJuc1NnclBkM1hCa3NiMWRZdDUvdWpvZjJ0RUdXZHR3U0lZ?=
 =?utf-8?B?R1lUbDhtdmN6NmhwYVlyQS8xRkRiTmtkM2JYVFpCSEhLQlo1aHZpQnY1TzF1?=
 =?utf-8?B?WEd2cm5iL2QydCsyQzRBZDdoYzJrbVh2MjdTR0RBWlVKVm1vZTdqZWpJUDg1?=
 =?utf-8?B?ZEZ3TUdzUE9zRWRQOW05ZmlJS0pKTmdZL1RMT2NhbGZKNTRPYTJvR0p1NnhE?=
 =?utf-8?B?UnBVYVBCTVNoWnorSU90d1ZLdmtEcGVnaW1xM04wb2pxdnU4djlvbmROUTEr?=
 =?utf-8?B?cDFEWGRTZm1jRzYweU5HQWhQU1hNRFdBNEtmVTZIMTgyQnJUcXlwbUwyRytL?=
 =?utf-8?B?c3U1UG56T09hSUxqVUhoMkdDRXpqT09zRHRJcDEzSVpXVkkzTldpZjJpdmdR?=
 =?utf-8?B?RnliQmdWTy9sMUlsMHQ0d2QwNmhKRVdhK0t6aUZRSEwvVTF3NmdVV0djNFZU?=
 =?utf-8?B?RjhnSllhTVlIWjZUL2srTnVDUXVhZGhLbUtVN05pRkhYMFBGcThnVEtQSm1L?=
 =?utf-8?B?SFkvYXY2N2haeTRQMDFFSTI1U0hybVR5VW14QnRTYUEzZTVTL0xOTjhONEFz?=
 =?utf-8?B?U3JnenJUaWRsTEVkVHpOSStXQlBWbWdTR1ZadFRvc01Pb0ZMZDR6dTl0bjZ6?=
 =?utf-8?B?aXZDQU9KTmpkbUFLYkVFd0UxNmxSeEhvMWxBd0U1dHovL21zL3FqL3BkM3h6?=
 =?utf-8?B?THI1S3NaSmo4RzJLRlBBTUgvU2hZaCtCOXlLVG1KODVteGpvK08xM2sxYS90?=
 =?utf-8?B?K2tjUHBHSWE4MGhBNzYrUnBGNVByY0VaSkVWbmxwUTk1azV2ZXdNOXVnNS9h?=
 =?utf-8?B?bXFKQlNnUWFvcndPSFF0TkNUWWpTUGx4eFA2SzlqVTBNR015Z1lQT2ttSXdo?=
 =?utf-8?Q?w4zf9v7zg4RfzuRI=3D?=
X-Exchange-RoutingPolicyChecked: pNKD3xFVFYehgBhsrbDg24kkx42E/dSg4tNJHTqQfizN488eiiD+DQa+R2978NrGkD0/7ujT99tC5eLMegRz8Ni5kpqCsPB0LL87QxfCoIkZrRgAAXRRPv6bj9L+Qk0HvHabeczuFRtfSgpSX+487rL4tR94ldUw4+6hc5ZzpmUC4/t47zKKdR2oM5y91avrgedfwzLuxyV/IKbZjwYVlHA4CTj9XHbJbht+wMQFiWWjNJ/GFepbbBOV4rBoq/DS1C9sFTAO8bSknc3QMtw3jS8OMhLjTwe0+g+0rIOYBx3GflzEbaDwVFgK+PO4+ncibWAp2eDimtYeuxdE9cpIBw==
X-MS-Exchange-CrossTenant-Network-Message-Id: a0cfb20b-f2e1-4c2a-4f39-08dec8cb8784
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 21:42:41.2087 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IvlxThPQstdrd6BL9UuoxaPnyLJ5RAe3NOnow+RcoTD65UQHAty/dxuHOilT2qstfvLIgu5Twb6JYwBjshHY1XXXL1RHbILpkrT+8D+KS2A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7095
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

On Mon, Jun 08, 2026 at 03:36:18PM -0700, Ashutosh Dixit wrote:
>In order to dynamically whitelist/dewhitelist OA registers on OA stream
>open/close, we need to keep track of nonpriv slots occupied by non-OA
>register whitelists.
>
>v2: Introduce hwe->nonpriv_slot (Umesh)

Please revert to v1 since the way I imagined, it would break the future 
patches.

With the revert to v1, this is

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>


>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>---
> drivers/gpu/drm/xe/xe_hw_engine_types.h | 4 ++++
> drivers/gpu/drm/xe/xe_reg_whitelist.c   | 8 ++++++--
> 2 files changed, 10 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
>index 84c097da9b6f2..11fa6d5f2f680 100644
>--- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
>+++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
>@@ -138,6 +138,10 @@ struct xe_hw_engine {
> 	 * @oa_sr: oa nonpriv whitelist registers, changed on oa stream open/close
> 	 */
> 	struct xe_reg_sr oa_sr;
>+	/**
>+	 * @nonpriv_slot: Next available nonpriv slot
>+	 */
>+	u32 nonpriv_slot;
> 	/**
> 	 * @reg_lrc: LRC workaround registers
> 	 */
>diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>index 6d642c2f6fd76..571a8e6909422 100644
>--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
>+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>@@ -161,7 +161,7 @@ static const struct xe_rtp_table_sr oa_whitelist = XE_RTP_TABLE_SR(
> 	},
> );
>
>-static void whitelist_apply_to_hwe(struct xe_hw_engine *hwe)
>+static int whitelist_apply_to_hwe(struct xe_hw_engine *hwe)
> {
> 	struct xe_reg_sr *sr = &hwe->reg_whitelist;
> 	struct xe_reg_sr_entry *entry;
>@@ -193,6 +193,9 @@ static void whitelist_apply_to_hwe(struct xe_hw_engine *hwe)
>
> 		slot++;
> 	}
>+
>+	hwe->nonpriv_slot = slot;
>+	return slot;
> }
>
> /**
>@@ -206,9 +209,10 @@ static void whitelist_apply_to_hwe(struct xe_hw_engine *hwe)
> void xe_reg_whitelist_process_engine(struct xe_hw_engine *hwe)
> {
> 	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(hwe);
>+	int first_oa_slot;
>
> 	xe_rtp_process_to_sr(&ctx, &register_whitelist, &hwe->reg_whitelist, false);
>-	whitelist_apply_to_hwe(hwe);
>+	first_oa_slot = whitelist_apply_to_hwe(hwe);
>
> 	xe_rtp_process_to_sr(&ctx, &oa_whitelist, &hwe->oa_whitelist, false);
> }
>-- 
>2.54.0
>
