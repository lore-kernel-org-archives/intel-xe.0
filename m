Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D4E2FF8875
	for <intel-xe@archiver.kernel.org>; Thu, 30 Apr 2026 14:16:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B58C010F372;
	Thu, 30 Apr 2026 14:16:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LZIpYlLP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E4EA10F009
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Apr 2026 14:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777558573; x=1809094573;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=V/NAYM22KjRcZmQj8VriWXDv4Tmud0d3/TCJhYhCftI=;
 b=LZIpYlLPoGdkbnYoAj5fv9WmiXGnivlG6LAzUA8j96aTlDDYs828caM6
 g3vgQ9SzgGTHNyk4qaGcdUIw9avBAi8PWiYndGUUrQ/o6sYCgcO81GHOo
 q/OHDMx994WtXqvSawGMiewUaq92zrM3tZHWxvLg59Cz11txiNXawvgIg
 nl+qFWAWoxEVjJ+wNJ/KrAll4lGtvXms0AON+qdXGdwARXriMXPLwg2oo
 R1N9Y3BQT5Cf7gy0l4qbElJaxCnZUL6GKUNyiDewxJ3Us0U1mW4bfX7Uo
 o7KJRZ+jv8u8aU3Z2HNrkt7BfHmO2N00ArERSIY4HmBmljJJfqGSkIMSQ Q==;
X-CSE-ConnectionGUID: 8uFviyXAQ3eZQGulrQ/l0A==
X-CSE-MsgGUID: PYnkfQZsQFWQiLRzIXObvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="88821083"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; d="scan'208";a="88821083"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 07:16:13 -0700
X-CSE-ConnectionGUID: L5IWk1+OTn2nhvKFomKppA==
X-CSE-MsgGUID: DTDgx595TZGN3KBzNmDRSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; d="scan'208";a="231467918"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 07:16:11 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 30 Apr 2026 07:16:11 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 30 Apr 2026 07:16:11 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.46) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 30 Apr 2026 07:16:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YSLWeJg9PfAxrEXpgLskHVeDEpBDF5M8ULw0z29I31Vq6mJKj/OOm4yKfGchWfmoJ3gF2syMsTjrk//zr/F+mXyUGXFi8/tfw/eMpZOoSgBLR756aLTc9wvmOlF3kZ9XH3zELLhWGD4FR9p1uJdGeu4kIaKJ6HLxqGn+hcAhYgWOI5zoo6W4mZjxLp/xqC/rY425XuUF0YLHWY68Z8aZUmCw/x1cI3Dn88rvJFzU68fdFJprtvPbpUfRnEZV3z4Q7CNScvN60jUGAvUsZl7OFABLHd1Wpx2Qoud5qZbkU+bo7p/uZxdlmjE5nPY/2mAKcLHE4reSRee4CBcODZTNsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/4JAV0SblmdTggFKxcTX6aaNk+uELRiJqPmuOar44Ys=;
 b=NXDwnIIGWtRiCQy+Bn6wp+v1LGlzoOCZuhkXYqbBmhHMlwRZybIAQWEzB9/yWHBTXebTluNsdlcutZz/vHitX07CQU5znU2+wK4P9UrGCqgLJUHnWfKqd96VfXrvk4KFSP78uL26ltn11irOGhdGEOfuOzGyhKUktHswzuVfU6Z9WDj1xrvNkviRETSKknrj9oAbnMg5ucdN4DqnDamLaiV2O3CdsCY9kpAgiVvrBL8rPKdAeRWXrF0GqzU7maq8fGKban32yvGhIc1hjo0MgIj1EGKIq0a0h4GclKZMxddPrp4g9YdQxwywQsKgUd60/gsI3HKWlJUUYb8HIs1bKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by CH2PR11MB8780.namprd11.prod.outlook.com (2603:10b6:610:284::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.12; Thu, 30 Apr
 2026 14:16:07 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%3]) with mapi id 15.20.9870.020; Thu, 30 Apr 2026
 14:16:07 +0000
Message-ID: <5563c2c4-670c-4db9-a500-c21cc9a10aa0@intel.com>
Date: Thu, 30 Apr 2026 16:16:00 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/24] drm/xe/eudebug_test: Introduce xe_eudebug wa kunit
 test
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <simona.vetter@ffwll.ch>, <matthew.brost@intel.com>,
 <christian.koenig@amd.com>, <thomas.hellstrom@linux.intel.com>,
 <joonas.lahtinen@linux.intel.com>, <gustavo.sousa@intel.com>,
 <jan.maslak@intel.com>, <dominik.karol.piatkowski@intel.com>,
 <rodrigo.vivi@intel.com>, <andrzej.hajda@intel.com>,
 <matthew.auld@intel.com>, <maciej.patelczyk@intel.com>,
 <gwan-gyeong.mun@intel.com>, Christoph Manszewski
 <christoph.manszewski@intel.com>
References: <20260430105121.712843-1-mika.kuoppala@linux.intel.com>
 <20260430105121.712843-17-mika.kuoppala@linux.intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260430105121.712843-17-mika.kuoppala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZPR01CA0283.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::17) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|CH2PR11MB8780:EE_
X-MS-Office365-Filtering-Correlation-Id: 92445fe4-bd66-48f7-29e9-08dea6c3050b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: R8qJ0+1RTO6wiI6mlV/bEJ6grXDYg7NUroA9eLtikJ/ZWUBTu5qM06r7sUupCfx99UfVYOx1HExFnc4ARb4VWGqOc5ZlsGilp1f7L8sGGtSaxhDCZVrtFemv4ck4Rj/RBW4rpg9lbgMMZm30G1arUZGKuJM8fkV0DzRJ/aFJ0WnwO59iZ+26xHfMjrqZLIholmguBz2ZCHFhlEnRV8v16i1covIy15P7yK82IjC1ARP4YA8dg4vsQK51jduIousuOVg3nt4NnWp2RpiXbMBfNQAezwuo+ekDaJyYppQLsd29unvpqWxJPnq/mEnXkMHfBGm1HxQtOUws9d4b7KPou8xTbFk+ZOR+Pw8VoR8TntMtnpjCXVruM92XdGZBbyvTfsj+nYLR5eGriD1n477Vmmcti494nZAr8BdZHlnTzJBdaynrq6GtBjjmEvu05bn1BVX1+bnbYsIXMr1uLo2E+8EJAbwj8E+HoOyth4JOVNUrTOxPSjoJhBRMFB8SXKp5D06+FKP7WoJ4bUlUYAkS6piBShJCw+uhUhxiEYxs14jJ9DZuvkVx70rY5hRGRt1OWbjIuP7vGQLpaHxDzzYAcuaRSZmzwGlaGUoLuhfOnrkUshOUFh3kD6DtX/6XKpG53KaJcQP8k0IhPafCqS8qRZbee65l3yyuTB/HZ1Vshhr2IkavstPyq2i6IA7cw6jYs07/tA6CuQpRndqrf4DB9Mw2PT+F8raXXJNKQ2MNasS3HWGSkK386t720MN+IFBG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QW13K3lGVUdaVFhXbmliN3krVWNQQkU1bFRSQzRjNmY1aDJCSVN6aVhUWWdt?=
 =?utf-8?B?KzBrUXpyR3F6KzhON2ZEZ1haSk5Mem5UaW5Ha3lhcWRaYmFKaWpzeVNYYTdo?=
 =?utf-8?B?c2FNMVMvWmFaSW40NTkwTnpqTVlsb3JETWE3VGdLaGp1M0Q0bkdIZVpIczYy?=
 =?utf-8?B?TS93RllFUTZRSGkyelhDdGRBSVNXMFRMU0YwUDdFUC8zYmpBVTB2SXFQZG55?=
 =?utf-8?B?SkRQMEdOZEJRMkM4ZnVra3BCYkM4di9MeDVIWVZvV0VJM1ZUcWhiNFRwSjdG?=
 =?utf-8?B?eHozMzlSRllKNnBpUFdCcWV4anp2SVZXNjB0c2lKYXIwNjNXcmsycStYUXJQ?=
 =?utf-8?B?cG1DSGtZWFFHeWJaRDdoMGVrOGE5eTlQMlBSamh0NGhTY0s3UlVwUXlPd1Jh?=
 =?utf-8?B?bG9yc1lzUEJja0FvajNpc2s1R3Uyb1VjQ2FCV2dOaDJ4RUIzMlQycVlMbFdT?=
 =?utf-8?B?VDdKTy9YelQvUURnWXJxRVZFUGx6UHc5cEU2emxNMDhEY2czOTAxand0NUlp?=
 =?utf-8?B?TTkwcnhrNlFzU2w3SGRRa2g1V2xUampYVStkZTZUWjJva3lQNjdGbU5sVEpX?=
 =?utf-8?B?dmdMUE1MT2hENUszWitVK1hlcEE0VW1OSzFTSjVzZnB1Q29FMTl3eWxrdHI0?=
 =?utf-8?B?NmhnOUhEU0ZzVGZ1NHNqWk96QmdzTEpIOGxHYVhzeEhZRFowRVkyemc0dEx3?=
 =?utf-8?B?S1hnbTU2MDdnTEJqY2VjQVZLMU9GYVE5bURlSUJHSFhZMUcrcmxQbEpzMUM3?=
 =?utf-8?B?UDlnZ3I5L2s3VWpQdjRSWUVMZFZEclZtdCthQUJ6d1NVUURRRDlIRU9OcnNZ?=
 =?utf-8?B?QWZuU0FWa2lYbmkxZFIzMUJMNXF6cVpPV3dmVHZncFNSZlUxek5UaEVYb2Jy?=
 =?utf-8?B?ajlFTWVsVkJySGcrWE45bEtLRk1SQmFQK2ZsZTBacnE3Z2M0UVp2LzU3dE5E?=
 =?utf-8?B?dnYvVmx4Tk1CLzB5d3lsdlJXZ2JPVUhIZG8wSWg1aU1BUjNPaEpXR0NyRk4y?=
 =?utf-8?B?QnQ4MG1lR3N1NjRGYTBZRjF3Ynk5dVlQdm9uYks5UmpNNzZjSUlCL1d4RStB?=
 =?utf-8?B?SHVpbXJYTk91YStYU3BSVkQ1R3RPOURnVUJUbGRUMGlzdjg1bmhDcXBiOG8x?=
 =?utf-8?B?a3ZwSFBFL00rN1ZGT2htVjhsNXNObE9yYlJGSHU3TGZ1UkVnblNpVTJPaDJL?=
 =?utf-8?B?QThPWVFiNFRBbWQ5bHBuYjJvLzFkbC9PUXBWdDBhaXZyWVNBQjVRd0RkVEky?=
 =?utf-8?B?diszTzVlVmdEeGM1YWU3c2JYV0ljd1FuMFp5VGU3Q2pPam8zdEdwV3A1cVFD?=
 =?utf-8?B?WDZwSHRzYjY3Rk9wQnMrb2Q0TEtmYnFnRnlHck8rbm5jR05KMHZPY1BQREtD?=
 =?utf-8?B?dTlmTWNNUDQ0RGdvcm10eFhHQnRnK2NwcmJUcFV4RnJaNktqVkFMN0JkRGFn?=
 =?utf-8?B?WkdseURXVjcxNk1UNU5GN1hhaTVabEVRaUplendlRlVjeHRnOVJhdDRVR09v?=
 =?utf-8?B?djVJRExVcmhpQVJyRVJoUDdWUFBCcU0vNlpubkJxMWxxR3BKdVp1djhXVXQw?=
 =?utf-8?B?RkRNQnpDaGFmTHY2bmRKT1Ava1NuTlVpck9UZFRQcysvb091aDNzMjV4Zmo4?=
 =?utf-8?B?R0ZiYW5IdWJXMFNsblErSDNrdjM1OTBwSzJlSVpnWHlGQlNWTWlEZnl2UmNx?=
 =?utf-8?B?VTl6OTcrZUFyckE5aTlwVmE2S2E0Y0RhTWtYZDRnKy90VWtrcGRyZ3JVUEsr?=
 =?utf-8?B?U0dzWlBVcThRWG54V3A2WU02Sjkyd2Nnb2ZzQlcxb1pIUFhJMXRLZHFIbVVs?=
 =?utf-8?B?b0UrK3lpVFBzbXZmaXBNNG5oTTFRU2JWWWdCOEh0Ymx0MTV3eDhSRGZ1OUhL?=
 =?utf-8?B?S0hVQU9VOWtlKzhXUDlEM1BTSHVsaWVBbTd3endNa1RCWEY1eGVFY1hZTTlq?=
 =?utf-8?B?TVdFOHNNN1YrOVl3d2ZOaGc0azJWZE83cjBjNnpOSWg2QnpRNXJRL0svenRk?=
 =?utf-8?B?ampVUUoydHdPZ3JSQ2tMTzZpa0VYc1g3eUdHby8wWWlJY2d4K2NPTHhuaHN6?=
 =?utf-8?B?R0VRcFppMXBpc0ZFZDZuRjJnS0FEeTBNaE1FZVdQZ2tnZ1BIUFpiUWIxWjh2?=
 =?utf-8?B?YStxYVBFV1RzYmF5aTFjZThrS2RuOWx4dVFaRXI1STdObWZ1T0t5Mkx3RENu?=
 =?utf-8?B?SlF1TkJNa285TEZyMDhlMmxaSXN2YnFZY0pGZ1d6RHBId2JkS3l2QVU5Zm9n?=
 =?utf-8?B?cElySm4ya3JQZmF0Wmp2eWNKZjdLZ2lDcVlFRWdEUi83bDZwYmdLSGtmZk96?=
 =?utf-8?B?OEl5cjJEalNkSU9NWXIyU1lNbmZtSitBMFVyU2RFWjVlTUs1Tzk2TmpiSEFi?=
 =?utf-8?Q?ThoBwMFQfJtovPS8=3D?=
X-Exchange-RoutingPolicyChecked: J0wjAkpm5g2Cs42ZL9a3ufO0BKHM6xJ998M9s+LdH6u8cy3DpPfQHJqrxStvRkZiwUprtOc3nh3nZCRfV4IYIefduMBOonVTp4GnMuZ6IjZpsgj86KMJA9PFwRsmSLthwlAq3+agaikvd1NYzmIskhZwg4cYri/qzE7+m9D3vkwh6VxX3+9EwfB6dP9Ng5I2J4yZDo8Jgjva1aZ+bf9eHBuImUdatNKMTfvAUDpzCm0Xn8smOJpUJSKNBmjbEmrQoCbay+buR5DlpRtiLF6ufOK+U2bbTrHWRRRZk/tnkyUkJ+91lUoiDP/XC6bkpsJEwXhqw9P8zvRcCSRg4HbPmA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 92445fe4-bd66-48f7-29e9-08dea6c3050b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 14:16:06.9662 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vC7eqvrJ/C2jqmPpuYlHmfynEeV41ry8VlAzarwOFkxwKLf0xterBKL3o7gc503a2DhUuq/8OPaoTn5tpFYCQIA532R7OYkYC3YwoQN2A/A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8780
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

Hi Mika,

few nits below...

nit: maybe title should be:

	drm/xe/tests: Introduce eudebug live tests


On 4/30/2026 12:51 PM, Mika Kuoppala wrote:
> From: Christoph Manszewski <christoph.manszewski@intel.com>
> 
> Introduce kunit test for eudebug. For now it checks the dynamic
> application of WAs.
> 
> v2: adapt to removal of call_for_each_device (Mika)
> v3: s/FW_RENDER/FORCEWAKE_ALL (Mika)
> 
> Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/tests/xe_eudebug.c       | 183 ++++++++++++++++++++

nit: while we are still inconsistent in file naming,
maybe we should follow some rules and

- use _kunit file suffix for pure KUnit tests
- use _test file suffix for our live tests (not strictly kunit)

see https://docs.kernel.org/dev-tools/kunit/style.html#test-file-and-module-names

>  drivers/gpu/drm/xe/tests/xe_live_test_mod.c |   5 +
>  drivers/gpu/drm/xe/xe_eudebug.c             |   4 +
>  3 files changed, 192 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/tests/xe_eudebug.c
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_eudebug.c b/drivers/gpu/drm/xe/tests/xe_eudebug.c
> new file mode 100644
> index 000000000000..f839fb292b9b
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/tests/xe_eudebug.c
> @@ -0,0 +1,183 @@
> +// SPDX-License-Identifier: GPL-2.0 AND MIT
> +/*
> + * Copyright © 2024 Intel Corporation

nit: 2026

> + */
> +
> +#include <kunit/visibility.h>
> +
> +#include "regs/xe_gt_regs.h"
> +#include "regs/xe_engine_regs.h"
> +
> +#include "xe_force_wake.h"
> +#include "xe_gt_mcr.h"
> +#include "xe_mmio.h"
> +
> +#include "tests/xe_kunit_helpers.h"
> +#include "tests/xe_pci_test.h"
> +#include "tests/xe_test.h"
> +
> +#undef XE_REG_MCR
> +#define XE_REG_MCR(r_, ...)	((const struct xe_reg_mcr){					\
> +				 .__reg = XE_REG_INITIALIZER(r_,  ##__VA_ARGS__, .mcr = 1)	\
> +				 })
> +
> +static const char *reg_to_str(struct xe_reg reg)
> +{
> +	if (reg.raw == TD_CTL.__reg.raw)
> +		return "TD_CTL";
> +	else if (reg.raw == CS_DEBUG_MODE2(RENDER_RING_BASE).raw)
> +		return "CS_DEBUG_MODE2";
> +	else if (reg.raw == ROW_CHICKEN.__reg.raw)
> +		return "ROW_CHICKEN";
> +	else if (reg.raw == ROW_CHICKEN2.__reg.raw)
> +		return "ROW_CHICKEN2";
> +	else if (reg.raw == ROW_CHICKEN3.__reg.raw)
> +		return "ROW_CHICKEN3";
> +	else
> +		return "UNKNOWN REG";
> +}
> +
> +static u32 get_reg_mask(struct xe_device *xe, struct xe_reg reg)
> +{
> +	struct kunit *test = kunit_get_current_test();
> +	u32 val = 0;
> +
> +	if (reg.raw == TD_CTL.__reg.raw) {
> +		val = TD_CTL_BREAKPOINT_ENABLE |
> +		      TD_CTL_FORCE_THREAD_BREAKPOINT_ENABLE |
> +		      TD_CTL_FEH_AND_FEE_ENABLE;
> +
> +		if (GRAPHICS_VERx100(xe) >= 1250)
> +			val |= TD_CTL_GLOBAL_DEBUG_ENABLE;
> +
> +	} else if (reg.raw == CS_DEBUG_MODE2(RENDER_RING_BASE).raw) {
> +		val = GLOBAL_DEBUG_ENABLE;
> +	} else if (reg.raw == ROW_CHICKEN.__reg.raw) {
> +		val = STALL_DOP_GATING_DISABLE;
> +	} else if (reg.raw == ROW_CHICKEN2.__reg.raw) {
> +		val = XEHPC_DISABLE_BTB;
> +	} else if (reg.raw == ROW_CHICKEN3.__reg.raw) {
> +		val = XE2_EUPEND_CHK_FLUSH_DIS;
> +	} else {
> +		kunit_warn(test, "Invalid register selection: %u\n", reg.raw);

nit: use KUNIT_FAIL(kunit_get_current_test(), "...");

> +	}
> +
> +	return val;
> +}
> +
> +static u32 get_reg_expected(struct xe_device *xe, struct xe_reg reg, bool enable_eudebug)
> +{
> +	u32 reg_mask = get_reg_mask(xe, reg);
> +	u32 reg_bits = 0;
> +
> +	if (enable_eudebug || reg.raw == ROW_CHICKEN3.__reg.raw)
> +		reg_bits = reg_mask;
> +	else
> +		reg_bits = 0;
> +
> +	return reg_bits;
> +}
> +
> +static void check_reg(struct xe_gt *gt, bool enable_eudebug, struct xe_reg reg)
> +{
> +	struct kunit *test = kunit_get_current_test();

nit: as this testcase function, why not pass test as a param?

> +	struct xe_device *xe = gt_to_xe(gt);
> +	u32 reg_bits_expected = get_reg_expected(xe, reg, enable_eudebug);
> +	u32 reg_mask = get_reg_mask(xe, reg);
> +	u32 reg_bits = 0;
> +
> +	if (reg.mcr)
> +		reg_bits = xe_gt_mcr_unicast_read_any(gt, (struct xe_reg_mcr){.__reg = reg});
> +	else
> +		reg_bits = xe_mmio_read32(&gt->mmio, reg);
> +
> +	reg_bits &= reg_mask;
> +
> +	kunit_printk(KERN_DEBUG, test, "%s bits: expected == 0x%x; actual == 0x%x\n",
> +		     reg_to_str(reg), reg_bits_expected, reg_bits);

nit: is this message really useful?
if bits are different then below EXPECT macro will print them anyway

> +	KUNIT_EXPECT_EQ_MSG(test, reg_bits_expected, reg_bits,
> +			    "Invalid bits set for %s\n", reg_to_str(reg));
> +}
> +
> +static void __check_regs(struct xe_gt *gt, bool enable_eudebug)

nit: maybe this function should be split into two:

- first that returns register
- second that runs tests on it?

> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +
> +	if (GRAPHICS_VERx100(xe) >= 1200)
> +		check_reg(gt, enable_eudebug, TD_CTL.__reg);
> +
> +	if (GRAPHICS_VERx100(xe) >= 1250 && GRAPHICS_VERx100(xe) <= 1274)
> +		check_reg(gt, enable_eudebug, ROW_CHICKEN.__reg);
> +
> +	if (xe->info.platform == XE_PVC)
> +		check_reg(gt, enable_eudebug, ROW_CHICKEN2.__reg);
> +
> +	if (GRAPHICS_VERx100(xe) >= 2000 && GRAPHICS_VERx100(xe) <= 2004)
> +		check_reg(gt, enable_eudebug, ROW_CHICKEN3.__reg);


> +}
> +
> +static void check_regs(struct xe_device *xe, bool enable_eudebug)
> +{
> +	struct kunit *test = kunit_get_current_test();
> +	struct xe_gt *gt;
> +	unsigned int fw_ref;
> +	u8 id;
> +
> +	kunit_printk(KERN_DEBUG, test, "Check regs for eudebug %s\n",
> +		     enable_eudebug ? "enabled" : "disabled");
> +
> +	xe_pm_runtime_get(xe);

nit: no need to take extra rpm, our live test helper takes care of it

> +	for_each_gt(gt, xe, id) {
> +		if (xe_gt_is_media_type(gt))
> +			continue;
> +
> +		/* XXX: Figure out per platform proper domain */
> +		fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +		KUNIT_ASSERT_TRUE_MSG(test, fw_ref, "Forcewake failed.\n");
> +
> +		__check_regs(gt, enable_eudebug);
> +
> +		xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +	}
> +	xe_pm_runtime_put(xe);
> +}
> +
> +static int toggle_reg_value(struct xe_device *xe)
> +{
> +	struct kunit *test = kunit_get_current_test();
> +	bool enable_eudebug = xe_eudebug_is_enabled(xe);
> +
> +	kunit_printk(KERN_DEBUG, test, "Test eudebug WAs for graphics version: %u\n",
> +		     GRAPHICS_VERx100(xe));

nit: if GFX version is so important for EUDEBUG then maybe this
message should be part of the custom test_init()?

static int xe_eudebug_test_init(test)
{
	struct xe_device *xe;

	xe_kunit_helper_xe_device_live_test_init(test);

	xe = test->priv;
	kunit_info(test, "running on graphics version: %u", GRAPHICS_VERx100(xe));
	return 0;
}


> +
> +	check_regs(xe, enable_eudebug);
> +
> +	xe_eudebug_enable(xe, !enable_eudebug);
> +	check_regs(xe, !enable_eudebug);
> +
> +	xe_eudebug_enable(xe, enable_eudebug);
> +	check_regs(xe, enable_eudebug);
> +
> +	return 0;
> +}
> +
> +static void xe_eudebug_toggle_reg_kunit(struct kunit *test)

nit: no need to add 'xe_eudebug' prefix as this test case is
already in 'xe_eudebug' suite

nit: this '_kunit' suffix seems unnecessary
see https://docs.kernel.org/dev-tools/kunit/style.html#test-cases

> +{
> +	struct xe_device *xe = test->priv;
> +
> +	toggle_reg_value(xe);
> +}
> +
> +static struct kunit_case xe_eudebug_tests[] = {
> +	KUNIT_CASE_PARAM(xe_eudebug_toggle_reg_kunit,
> +			 xe_pci_live_device_gen_param),
> +	{}
> +};
> +
> +VISIBLE_IF_KUNIT
> +struct kunit_suite xe_eudebug_test_suite = {
> +	.name = "xe_eudebug",
> +	.test_cases = xe_eudebug_tests,
> +	.init = xe_kunit_helper_xe_device_live_test_init,
> +};
> +EXPORT_SYMBOL_IF_KUNIT(xe_eudebug_test_suite);
> diff --git a/drivers/gpu/drm/xe/tests/xe_live_test_mod.c b/drivers/gpu/drm/xe/tests/xe_live_test_mod.c
> index c55e46f1ae92..dc83bb6a892d 100644
> --- a/drivers/gpu/drm/xe/tests/xe_live_test_mod.c
> +++ b/drivers/gpu/drm/xe/tests/xe_live_test_mod.c
> @@ -19,6 +19,11 @@ kunit_test_suite(xe_migrate_test_suite);
>  kunit_test_suite(xe_mocs_test_suite);
>  kunit_test_suite(xe_guc_g2g_test_suite);
>  
> +#if IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)
> +extern struct kunit_suite xe_eudebug_test_suite;
> +kunit_test_suite(xe_eudebug_test_suite);
> +#endif
> +
>  MODULE_AUTHOR("Intel Corporation");
>  MODULE_LICENSE("GPL");
>  MODULE_DESCRIPTION("xe live kunit tests");
> diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
> index 2566b55f9c47..f5547c756b31 100644
> --- a/drivers/gpu/drm/xe/xe_eudebug.c
> +++ b/drivers/gpu/drm/xe/xe_eudebug.c
> @@ -2242,3 +2242,7 @@ int xe_eudebug_connect_ioctl(struct drm_device *dev,
>  
>  	return xe_eudebug_connect(xe, file, param);
>  }
> +
> +#if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
> +#include "tests/xe_eudebug.c"
> +#endif

