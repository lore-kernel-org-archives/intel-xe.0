Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71FDDCA9ED2
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 10:21:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 157CE10EFA4;
	Mon, 12 Oct 2026 10:21:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7673110EB97
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 10:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791800507; x=1823336507;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=/KRnnFig9T+Sh2u6zCZ5eQo/W2RB2lnUIjAtcdgC4gQ=;
 b=UlWe9r3bm+Un/j1t6+uycs1xMecy2vu/tXMjJYTLEWxIx4rnsK0heiEB
 0ISFxgTqa5CE9/I/5XIpD24iZqjAOdxl6F8w0bR7QoasKYV3NXko87rLG
 ohAPAEWQPhh7GLzrLE+KvPehdsrHnorALw+3q/2kmo+O9CKuFo2KRQBxl
 eSecMgOKRo1ulMYH1WDBdL3shmYVEAzIpzoZKJjxlFNZ/StQ8T5Gh7Mxf
 LoQy8kiRSYBYaulggEUf+5Ew4VuNZx1j7oZq2j4bVU+UrDY7lRtQYvLQS
 M2c++FxhQ0dY7IwVUSHirSQAsb4G/Wp1TMwKlv1/fSIGFISIPIWWCIgNK g==;
X-CSE-ConnectionGUID: HpOszkrdQMCeWDieujn40Q==
X-CSE-MsgGUID: EvkAmmVvR5G2LUuq13Q2sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="404796"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="404796"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 03:21:47 -0700
X-CSE-ConnectionGUID: KdwaDNhvRZ2PTUliRbOv4g==
X-CSE-MsgGUID: APCg6T+7S3WQKUuqZkdmVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="2609489"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 03:21:47 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 03:21:46 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 12 Oct 2026 03:21:46 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.3) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 03:21:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XzQMzjxLu5aB4HAxmdqfM1bILRPufrs9sk93ExH6T6iLnUczIT/W6JT1irUzRmjr3s3lSWN+MB/ThhC14IFDsUa7bvU44FpuwI2tdNnYCWitRIjer2nvzQMtShQxvu8WYO9x6khcv9HdB1rOrkbi2ULYQHDO/J2LZjo3fWWEaeCxO1RvY6vapPcGTYlJob2WPkTpmsxev+Hk4YfPTWfk4Nn8FGj6/nQ4UY8YV8IBFEGbWjcalDqakuvpiN/zNvu26K/I21Kz+pXXkqeagKW1nsxTbfWx8kDRhYvW5+RqvfkjdRR1+zZeriQzZTUn8cRTTjBCpRbfrENOiU2x5oes2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JP7lolgfOB5IPHofktkJsjAQreovjlc5suj5A44IUxk=;
 b=JFGHVHv05RK75sSCz7BKbcdOX6qk7d8JYgbnT7Xo12vmhW42ju5S46T94LB7e5Ed0wQ1GnPgtA+jZGBIjNZ8VJCIgXEvZ6vXow0asRHsW8EzBRylr9ZCt6pSZ3t3ERicGG7WtXcSXrHIh0/loXvvlF86AouCpf6lSB7Reu8F7aSWe3AKzRn/ZCj/dG1Vj5AHquD3e/CB6BaQFz3QRFweRf6Gym8dBUtEPFnYRRwW9RqrKKeJLOMoItU1hw9UlU0aTwmuIVjTwmZYQ389hC1OZEXIeo4/OAGfHNqe1LnS2e/gVcDKpwq8T/avHdiwoz8LHHgloWM0fBqs1JGpsSocNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by IA0PR11MB7791.namprd11.prod.outlook.com (2603:10b6:208:401::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Mon, 12 Oct
 2026 10:21:42 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0496.015; Mon, 12 Oct 2026
 10:21:42 +0000
Date: Mon, 12 Oct 2026 12:21:38 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v5 1/4] drm/xe/guc: Split GuC ID manager into usable and
 shareable pools
Message-ID: <20261012102138.j5hkc72lleb3lylo@intel.com>
References: <20261005085132.3720685-1-piotr.piorkowski@intel.com>
 <20261005085132.3720685-2-piotr.piorkowski@intel.com>
 <866ddae9-3df8-4bdc-a9bf-48efbb49135e@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <866ddae9-3df8-4bdc-a9bf-48efbb49135e@intel.com>
X-ClientProxiedBy: DUZPR01CA0165.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::6) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|IA0PR11MB7791:EE_
X-MS-Office365-Filtering-Correlation-Id: 08cbda9e-695a-4208-482d-08df284a9be8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|261009223027099003|4143699003|11063799006|56012099006|5023799004|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: lPxN0jfiESr96Y/4lrt0wDu8DwwmbGP34/QgXAI38DEybQ0X5QFvhVkyiGY/DRmyiiDFB+FYtmcTO5sLRSvqO6RH/HpXdyNw6KzTMsfu+QB97H+4nf8cDhIm9zrDN1yrG8FD+6A+eX3mcCOEviDm/dqDEJCHchgwuidqeYd2rIi/J87TuS25RzVwP8XSY/Q/fb0YCpoiaL0UhbkXYzBhxIFdo9KKLWtEO+zMD6OQZVfF9sThfa8Q5eW45t/d7l3+wqwUg2Znam6PGitU2MetFTT3yQoWnaGcte/c3QuErkU21SHxX/643WvFiCrA2E1kM6YYAFbxvNfNQPOcbw2R92Rpps/jVnGGeqY5MVClqy3a8u7g6tcpVigyV3B/EcgVA/juSMu2YajeXDIo6QvhWMn4ZiQtqPLraKg2TnsoR550Btn+3zDlNqiJ79GTknEm2ia+qp2HsiH90XzIKEdBjjsAJjd+7/CtHnSeFnPLLYzFCdhDjvgb2So7EfAXVzVnEGxHR7n7UUsPvneA8k0vJ+ctkq4E7aGTbEm+/NsdD49IA0BPAOB763oBRtPKzfvyYU7d+/666V8mO1SCW2PTQkN9qqZ3EQUo3eaDuWQXdKeC/gx4ZLq5PIt9xQAz0ej/oiupSJIqjq4fcPH5it0s06s+2u8DLRpGwY+WLOAyt7A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(261009223027099003)(4143699003)(11063799006)(56012099006)(5023799004)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1ZobXhRZWgrb1NHOHBBTVJLd1BUTjkyRmJHYU10NkpyTDYwQmE4eEFFWkxF?=
 =?utf-8?B?REkxQzVDSU5kbk1YM21lNGlDS2xnVnc2SDJNODdoSENKR3hhYWtOQlNEL1dW?=
 =?utf-8?B?YWJJc3NCZGtYYUdZMUNWOGFSTnR5dmxKdUF1clZBaDcvNStyRXVKbUpZREor?=
 =?utf-8?B?cEJBSFBPTDRNZWN6REpiSmVsVjF4MWRlTTl4eVJqK3ZkMjhMNkh6b1RneFM3?=
 =?utf-8?B?M0FMTS9uWUt6NG5OM09MeU9JbEcxcWtxMTRiaGN0dytia3FpbmZtVDg4UVd6?=
 =?utf-8?B?cmZBSkxFRkFBZnVsNWdQMmNaZVdTaUkzWFZQK1pmbFdjWFJqVGcraEFhUXhR?=
 =?utf-8?B?WjFhREFhTWVyZ0lwRWNQbUJVMjIxdklhdGZ6VzN4V2U1MUhKRGMxVExaaHhW?=
 =?utf-8?B?dEtCZ1dncXRWQm13M2pidkVBQVg1Wi9zbTl6d0R2dG92Wk5GU1hpMlp6UEh3?=
 =?utf-8?B?aW53ZEQwaUR4N0ZqZFErM3ZaM1gyNjVOSllmV1BSWElQMkJSS2FjSXlGQi9p?=
 =?utf-8?B?aVZvYVI1NXorZXFoMmRmZWIzeGxFVUJ1SmhtR2NQUk4rbzFjNE1DalJ3SzVD?=
 =?utf-8?B?eXNYNmlCT0FhcGh3SWo5QjZlSlFkdmttUVR5UGJkeGdkNy92YVNnRThqTWgx?=
 =?utf-8?B?Qi9ud3NGbnFvcUs3ckJ3M2JudXdROWFRN1JDdkcza08vZHdmSlY2OGJEWGZk?=
 =?utf-8?B?MUFNZmdVa0R0dEF6RkVRR09JTXY0TGJaS1RreTlIN2FBS0FDZmRqZGM0T0w0?=
 =?utf-8?B?YjBMRFRrZFZTTGY2ZU82NmViMjc5SzVxR1NrQTcvd1JVdERuZWcrRGNER3pm?=
 =?utf-8?B?OWtodkNLZDIrK0ZVVGN3enFVQmg3WUlFSXVKU1pndVozS09LUVR3dEhIaTJr?=
 =?utf-8?B?M01INXlHc1dmd21jeTI0eFVha1NhUXJGZ1VFZitLQ2hrZWNOdWNja3VWVDFq?=
 =?utf-8?B?bXRKZWJTMlh3K3NlampQZ21QczJmcWMwOHhXNURsZ0x2dUhYdHZGdVNOby9r?=
 =?utf-8?B?SytkSFA0WFRSYmRwRk5aS2F6YWNEQ0IyRTdSOGhmWnM2RzFPalpKaW4ySFRo?=
 =?utf-8?B?N3llZ3A2MGdtdVRVY1NWaE4rUnVacGVXUStGSGE1dXZIT3RaTlBtVldTMEV4?=
 =?utf-8?B?Mlk5dy9vcGUwZ2JSME1SZUVteVpLU0tVV2U5dXdDN2x3Zm96NEYvYmxJUk9p?=
 =?utf-8?B?N3VPOWlMSDRucnZXVG1pQThleW9xQjJlNlAram9Rbk9jckkyQmJmRnZMZTFx?=
 =?utf-8?B?cnEwUXlKeFZtbFBpRnZWNkJJNlBuSm1IbW81S2JxTWRKMXFTQ1hTYXUrbEZh?=
 =?utf-8?B?ZjEweGQrY3h3TXZxeGhSTVVnZXBLSnVIUzkzeGQyM0RiaHVXajlhLzhQR1lL?=
 =?utf-8?B?VmRVVmY0SzRkM1M3eGt2eHdsRXl1M0hlaEtDQ2hVd21VZGFNS3hkV2djd2VB?=
 =?utf-8?B?SklRSldLSlBVMHp6UVBncnA4c3hWeGczVGtMYkpyVldzdDRyYnJZc2RCQ3Rl?=
 =?utf-8?B?TlY4MEd4QjIwWW1pUXBGSFpGR0x5MkQ5ZWVBVGxSQXN5bmhsZ0pCb05Lelp6?=
 =?utf-8?B?OVhmL2lPRmtlUGphM0FaMml6bTgrWXZrTFEwVzB2Njc2V3NBZzdPbTY0bitU?=
 =?utf-8?B?K293M1JjYnMzQlFLVE4wT2N0Q0phVEYzcHF3cmMxZHNielJoT3VKa0xIQUkv?=
 =?utf-8?B?YVlKTmFvM3NHWWg3OHBYRGdpeXlqazB4bXRFdHM1MzVDUVJJdHcza2Ridmd0?=
 =?utf-8?B?YWR3dW16dm5GdFdOcXlFM0hydXowWnpzeHlrRTdicTh6V1RYMUxNeWpha1p2?=
 =?utf-8?B?VjIrZTdMT3FoL0x2dUt6eTRpVUlEYmw4ZzhaaFFCVjN1bnBQcEtiTCs0bm9t?=
 =?utf-8?B?Z2VQRnRHUWJ5OGIwVzVGUGpyQnRERW9QV1ZUaG9Rb2t6TDhrWEJ1QUpXa3ps?=
 =?utf-8?B?d2JEcHYzK1M2T3hBNnBHcFBiRXdCV3RzSURnZzhOL3hEbVFraXkxeFlUdjBa?=
 =?utf-8?B?Si9vUHh2Y0c5Vk0yTjN2N0tUekFvZnNLcUd3TFQ1OVZhNFo4VnBSL0NmVHJv?=
 =?utf-8?B?eVo1aU9hWWw3WFdhNHRFV3VxdlB2VlJoL1VPY0RGaUFBY3FldHFSckVEM0E3?=
 =?utf-8?B?Z3U3VGtRdXFTOElUOUYxNUE1WHhYNk10RCtVZHFMTzY4SGRoZm5kcmQ2bFpv?=
 =?utf-8?B?TGt3VUU5WG93RzlLQ0MvcWJhWXlDdWFzQVZIczM5RlZQWldzRTlnZVZMeEEr?=
 =?utf-8?B?RW5ic05WMGNvVDcvNUh5ZWx6djR4OG02RFZUbU95eGtmZEhjejR6QkJPeDJM?=
 =?utf-8?B?TW42YjRIVjIvOGFvcFYvL0ttNVJWVmZNQWx5N3BqSkF3NjRSL0ZCaWp2V1ZQ?=
 =?utf-8?Q?EcBw5dPnsAkJld6Y=3D?=
X-Exchange-RoutingPolicyChecked: dvV5+qXn4ZuBMWDlTLl40GP54xH8sxaOaT4F25Rw/Qm7xXUUE4sxzEihNWfK6uScsipJ6HY+BQs+ZAhlvAjLBilOZrDff6Y36YbzVeWjdsCnJ0XPLaEam10H1dw1DllX44r3ajGbHqIqyyQ7dFDe2HKhqww+cWhpHM1yOzINXyQm9N+22N2WAXqUJvhufAvuW8QGKqbhh7SUY9bQk/rxRMHPEV/yvYDd1Zc8jipYlfi3mPaoaeGvvFbHu0yItcvmz/W2v1CS1mY4F1RRM6hNw2Aua4kYnIylAJ2n6Thz+dogXoxL0i19J4N4Ymtn6iEvSvVKslQJlRma3hAraJBu0Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 08cbda9e-695a-4208-482d-08df284a9be8
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 10:21:42.2335 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PCCPg4e338ppQA1B/2GfSgYCOvlAH8k6Pk1Dz/nXYL39rdKWtc2Ukvmc3eZETgK9xq1bpWTW2IZU/RNVsnIio1OOxKYlZKze/GwzMVC48us=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7791
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

K V P, Satyanarayana <satyanarayana.k.v.p@intel.com> wrote on wto [2026-paź-06 14:05:43 +0530]:
> 
> On 05-Oct-26 2:21 PM, Piórkowski, Piotr wrote:
> > From: Piotr Piórkowski <piotr.piorkowski@intel.com>
> > 
> > Modify the GuC identifier manager so that it distinguishes between
> > usable GuC IDs allocated for GuC submissions, and shareable those that
> > can be shared with VFs. Both pools are represented as a single bitmap
> > and may overlap.
> > Let's Replace the single-pool accounting model with separate usable and
> > shareable pools, add helpers for pool accounting and limits, and update
> > debug reporting.
> > 
> > For now, let's keep the current allocation behaviour by mapping both pools
> > onto the same GuC ID space. This prepares the ID manager for separate
> > management of submission IDs and VF allocations in following changes.
> > 
> > v2: Do not change how VF IDs are allocated in the legacy path (Sashiko)
> > 
> > v3: Fix shareable spare quota accounting to include
> >      PF-exclusive usable IDs.
> > 
> > v4: Do not apply spare quota to VF-exclusive shareable IDs (Sashiko)
> >      Drop redundant checks and asserts (Satya)
> > 
> > Assisted-by: Claude:claude-5-sonnet
> > Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > ---
> >   drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c |  57 +--
> >   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |   2 +-
> >   drivers/gpu/drm/xe/xe_guc_id_mgr.c            | 443 ++++++++++++++----
> >   drivers/gpu/drm/xe/xe_guc_id_mgr.h            |  20 +-
> >   drivers/gpu/drm/xe/xe_guc_types.h             |   8 +-
> >   5 files changed, 405 insertions(+), 125 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
> > index ee30a1939eb0e..78d3de46b7572 100644
> > --- a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
> > +++ b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
> > @@ -24,8 +24,8 @@ static void bad_init(struct kunit *test)
> >   {
> >   	struct xe_guc_id_mgr *idm = test->priv;
> > -	KUNIT_EXPECT_EQ(test, -EINVAL, xe_guc_id_mgr_init(idm, 0));
> > -	KUNIT_EXPECT_EQ(test, -ERANGE, xe_guc_id_mgr_init(idm, GUC_ID_MAX + 1));
> > +	KUNIT_EXPECT_EQ(test, -EINVAL, idm_init(idm, 0, 0));
> > +	KUNIT_EXPECT_EQ(test, -ERANGE, idm_init(idm, GUC_ID_MAX + 1, 0));
> >   }
> >   static void no_init(struct kunit *test)
> > @@ -43,12 +43,12 @@ static void init_fini(struct kunit *test)
> >   {
> >   	struct xe_guc_id_mgr *idm = test->priv;
> > -	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, -1));
> > +	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, GUC_ID_MAX, 0));
> >   	KUNIT_EXPECT_NOT_NULL(test, idm->bitmap);
> > -	KUNIT_EXPECT_EQ(test, idm->total, GUC_ID_MAX);
> > +	KUNIT_EXPECT_EQ(test, idm_total(idm), GUC_ID_MAX);
> >   	__fini_idm(NULL, idm);
> >   	KUNIT_EXPECT_NULL(test, idm->bitmap);
> > -	KUNIT_EXPECT_EQ(test, idm->total, 0);
> > +	KUNIT_EXPECT_EQ(test, idm_total(idm), 0);
> >   }
> >   static void check_used(struct kunit *test)
> > @@ -56,19 +56,19 @@ static void check_used(struct kunit *test)
> >   	struct xe_guc_id_mgr *idm = test->priv;
> >   	unsigned int n;
> > -	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, 2));
> > +	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, 2, 0));
> >   	mutex_lock(idm_mutex(idm));
> > -	for (n = 0; n < idm->total; n++) {
> > +	for (n = 0; n < idm_total(idm); n++) {
> >   		kunit_info(test, "n=%u", n);
> > -		KUNIT_EXPECT_EQ(test, idm->used, n);
> > -		KUNIT_EXPECT_GE(test, idm_reserve_chunk_locked(idm, 1, 0), 0);
> > -		KUNIT_EXPECT_EQ(test, idm->used, n + 1);
> > +		KUNIT_EXPECT_EQ(test, bitmap_weight(idm->bitmap, idm_total(idm)), n);
> > +		KUNIT_EXPECT_GE(test, xe_guc_id_mgr_reserve_usable_locked(idm, 1), 0);
> > +		KUNIT_EXPECT_EQ(test, bitmap_weight(idm->bitmap, idm_total(idm)), n + 1);
> >   	}
> > -	KUNIT_EXPECT_EQ(test, idm->used, idm->total);
> > -	idm_release_chunk_locked(idm, 0, idm->used);
> > -	KUNIT_EXPECT_EQ(test, idm->used, 0);
> > +	KUNIT_EXPECT_EQ(test, bitmap_weight(idm->bitmap, idm_total(idm)), idm_total(idm));
> > +	idm_release_chunk_locked(idm, 0, idm_total(idm));
> > +	KUNIT_EXPECT_EQ(test, bitmap_weight(idm->bitmap, idm_total(idm)), 0);
> >   	mutex_unlock(idm_mutex(idm));
> >   }
> > @@ -76,25 +76,12 @@ static void check_used(struct kunit *test)
> >   static void check_quota(struct kunit *test)
> >   {
> >   	struct xe_guc_id_mgr *idm = test->priv;
> > -	unsigned int n;
> > -
> > -	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, 2));
> > -	mutex_lock(idm_mutex(idm));
> > +	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, 2, 0));
> > -	for (n = 0; n < idm->total - 1; n++) {
> > -		kunit_info(test, "n=%u", n);
> > -		KUNIT_EXPECT_EQ(test, idm_reserve_chunk_locked(idm, 1, idm->total), -EDQUOT);
> > -		KUNIT_EXPECT_EQ(test, idm_reserve_chunk_locked(idm, 1, idm->total - n), -EDQUOT);
> > -		KUNIT_EXPECT_EQ(test, idm_reserve_chunk_locked(idm, idm->total - n, 1), -EDQUOT);
> > -		KUNIT_EXPECT_GE(test, idm_reserve_chunk_locked(idm, 1, 1), 0);
> > -	}
> > -	KUNIT_EXPECT_LE(test, 0, idm_reserve_chunk_locked(idm, 1, 0));
> > -	KUNIT_EXPECT_EQ(test, idm->used, idm->total);
> > -	idm_release_chunk_locked(idm, 0, idm->total);
> > -	KUNIT_EXPECT_EQ(test, idm->used, 0);
> > -
> > -	mutex_unlock(idm_mutex(idm));
> > +	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_usable(idm, 2), 0);
> > +	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_usable(idm, 1), -ENOSPC);
> > +	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_usable(idm, 0, 2), 0);
> >   }
> >   static void check_all(struct kunit *test)
> > @@ -102,14 +89,14 @@ static void check_all(struct kunit *test)
> >   	struct xe_guc_id_mgr *idm = test->priv;
> >   	unsigned int n;
> > -	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, -1));
> > +	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, GUC_ID_MAX, 0));
> >   	mutex_lock(idm_mutex(idm));
> > -	for (n = 0; n < idm->total; n++)
> > -		KUNIT_EXPECT_LE(test, 0, idm_reserve_chunk_locked(idm, 1, 0));
> > -	KUNIT_EXPECT_EQ(test, idm->used, idm->total);
> > -	for (n = 0; n < idm->total; n++)
> > +	for (n = 0; n < idm_total(idm); n++)
> > +		KUNIT_EXPECT_LE(test, 0, xe_guc_id_mgr_reserve_usable_locked(idm, 1));
> > +	KUNIT_EXPECT_EQ(test, bitmap_weight(idm->bitmap, idm_total(idm)), idm_total(idm));
> > +	for (n = 0; n < idm_total(idm); n++)
> >   		idm_release_chunk_locked(idm, n, 1);
> >   	mutex_unlock(idm_mutex(idm));
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> > index 6947aeed458ed..de1ac58e31412 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> > @@ -1182,7 +1182,7 @@ static u32 pf_estimate_fair_ctxs(struct xe_gt *gt, unsigned int num_vfs)
> >   {
> >   	struct xe_guc_id_mgr *idm = &gt->uc.guc.submission_state.idm;
> >   	u32 spare = pf_get_spare_ctxs(gt);
> > -	u32 fair = (idm->total - spare) / num_vfs;
> > +	u32 fair = (xe_guc_id_mgr_max_usable(idm) - spare) / num_vfs;
> >   	int ret;
> >   	for (; fair; --fair) {
> > diff --git a/drivers/gpu/drm/xe/xe_guc_id_mgr.c b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
> > index e845425d670be..8f90a5337fe4c 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_id_mgr.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
> > @@ -34,6 +34,34 @@ static struct xe_device *idm_to_xe(struct xe_guc_id_mgr *idm)
> >   static void idm_print_locked(struct xe_guc_id_mgr *idm, struct drm_printer *p, int indent);
> > +static unsigned int idm_total(struct xe_guc_id_mgr *idm)
> > +{
> > +	if (idm->usable > GUC_ID_MAX - idm->shareable)
> > +		return GUC_ID_MAX;
> > +
> > +	return idm->usable + idm->shareable;
> > +}
> > +
> > +static unsigned int idm_shareable_start(struct xe_guc_id_mgr *idm)
> > +{
> > +	return idm_total(idm) - idm->shareable;
> > +}
> > +
> > +static unsigned int idm_used_usable(struct xe_guc_id_mgr *idm)
> > +{
> > +	lockdep_assert_held(idm_mutex(idm));
> > +
> > +	return bitmap_weight(idm->bitmap, idm->usable);
> > +}
> > +
> > +static unsigned int idm_used_shareable(struct xe_guc_id_mgr *idm)
> > +{
> > +	lockdep_assert_held(idm_mutex(idm));
> > +
> > +	return bitmap_weight(idm->bitmap, idm_total(idm)) -
> > +	       bitmap_weight(idm->bitmap, idm_shareable_start(idm));
> > +}
> > +
> >   static void __fini_idm(struct drm_device *drm, void *arg)
> >   {
> >   	struct xe_guc_id_mgr *idm = arg;
> > @@ -41,25 +69,56 @@ static void __fini_idm(struct drm_device *drm, void *arg)
> >   	mutex_lock(idm_mutex(idm));
> >   	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
> > -		unsigned int weight = bitmap_weight(idm->bitmap, idm->total);
> > +		unsigned int weight = bitmap_weight(idm->bitmap, idm_total(idm));
> >   		if (weight) {
> >   			struct drm_printer p = xe_gt_info_printer(idm_to_gt(idm));
> >   			xe_gt_err(idm_to_gt(idm), "GUC ID manager unclean (%u/%u)\n",
> > -				  weight, idm->total);
> > +				  weight, idm_total(idm));
> >   			idm_print_locked(idm, &p, 1);
> >   		}
> >   	}
> >   	bitmap_free(idm->bitmap);
> >   	idm->bitmap = NULL;
> > -	idm->total = 0;
> > -	idm->used = 0;
> > +	idm->usable = 0;
> > +	idm->shareable = 0;
> >   	mutex_unlock(idm_mutex(idm));
> >   }
> > +static int idm_init(struct xe_guc_id_mgr *idm, unsigned int usable, unsigned int shareable)
> > +{
> > +	bool overlap = usable > GUC_ID_MAX - shareable;
> > +	unsigned int total;
> > +	int ret;
> > +
> > +	if (!usable)
> > +		return -EINVAL;
> > +	if (usable > GUC_ID_MAX || shareable > GUC_ID_MAX)
> > +		return -ERANGE;
> > +
> > +	idm_assert(idm, !idm->bitmap);
> > +	idm_assert(idm, !shareable || IS_SRIOV_PF(idm_to_xe(idm)));
> > +	total = overlap ? GUC_ID_MAX : usable + shareable;
> > +
> > +	idm->bitmap = bitmap_zalloc(total, GFP_KERNEL);
> > +	if (!idm->bitmap)
> > +		return -ENOMEM;
> > +
> > +	idm->usable = usable;
> > +	idm->shareable = shareable;
> > +
> > +	ret = drmm_add_action_or_reset(&idm_to_xe(idm)->drm, __fini_idm, idm);
> > +	if (ret)
> > +		return ret;
> > +
> > +	xe_gt_dbg(idm_to_gt(idm), "using %u GuC ID%s, %u GuC ID%s shareable with VFs\n",
> > +		  idm->usable, str_plural(idm->usable), idm->shareable, str_plural(idm->shareable));
> > +	return 0;
> > +}
> > +
> >   /**
> >    * xe_guc_id_mgr_init() - Initialize GuC context ID Manager.
> >    * @idm: the &xe_guc_id_mgr to initialize
> > @@ -68,90 +127,156 @@ static void __fini_idm(struct drm_device *drm, void *arg)
> >    * The bare-metal or PF driver can pass ~0 as &limit to indicate that all
> >    * context IDs supported by the GuC firmware are available for use.
> >    *
> > - * Only VF drivers will have to provide explicit number of context IDs
> > - * that they can use.
> > - *
> >    * Return: 0 on success or a negative error code on failure.
> >    */
> >   int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm, unsigned int limit)
> >   {
> > -	int ret;
> > -
> > -	idm_assert(idm, !idm->bitmap);
> > -	idm_assert(idm, !idm->total);
> > -	idm_assert(idm, !idm->used);
> > -
> >   	if (limit == ~0)
> >   		limit = GUC_ID_MAX;
> > -	else if (limit > GUC_ID_MAX)
> > -		return -ERANGE;
> > -	else if (!limit)
> > -		return -EINVAL;
> > -	idm->bitmap = bitmap_zalloc(limit, GFP_KERNEL);
> > -	if (!idm->bitmap)
> > -		return -ENOMEM;
> > -	idm->total = limit;
> > +	return idm_init(idm, limit, 0);
> > +}
> > -	ret = drmm_add_action_or_reset(&idm_to_xe(idm)->drm, __fini_idm, idm);
> > -	if (ret)
> > -		return ret;
> > +/**
> > + * xe_guc_id_mgr_max_usable() - Get maximum number of usable GuC context IDs.
> > + * @idm: the &xe_guc_id_mgr to query
> > + *
> > + * Return: maximum number of GuC context IDs that can be used by @idm for GuC submission.
> > + */
> > +unsigned int xe_guc_id_mgr_max_usable(struct xe_guc_id_mgr *idm)
> > +{
> > +	return idm->usable;
> > +}
> > -	xe_gt_dbg(idm_to_gt(idm), "using %u GuC ID%s\n",
> > -		  idm->total, str_plural(idm->total));
> > -	return 0;
> > +/**
> > + * xe_guc_id_mgr_max_shareable() - Get maximum number of shareable GuC context IDs.
> > + * @idm: the &xe_guc_id_mgr to query
> > + *
> > + * Return: maximum number of GuC context IDs that can be shared with VFs.
> > + */
> > +unsigned int xe_guc_id_mgr_max_shareable(struct xe_guc_id_mgr *idm)
> > +{
> > +	return idm->shareable;
> >   }
> > -static unsigned int find_last_zero_area(unsigned long *bitmap,
> > -					unsigned int total,
> > -					unsigned int count)
> > +static int idm_reserve_chunk_usable_locked(struct xe_guc_id_mgr *idm, unsigned int count)
> > +{
> > +	int id;
> > +
> > +	idm_assert(idm, count);
> > +	lockdep_assert_held(idm_mutex(idm));
> > +
> > +	if (!idm->usable)
> > +		return -ENODATA;
> > +
> > +	id = bitmap_find_next_zero_area(idm->bitmap, idm->usable, 0, count, 0);
> > +	if (id >= idm->usable)
> > +		return -ENOSPC;
> > +
> > +	bitmap_set(idm->bitmap, id, count);
> > +
> > +	return id;
> > +}
> > +
> > +static unsigned int idm_find_last_zero_area_in_range(unsigned long *bitmap,
> > +						     unsigned int range_start,
> > +						     unsigned int range_end,
> > +						     unsigned int count)
> >   {
> > -	unsigned int found = total;
> > -	unsigned int rs, re, range;
> > +	unsigned int found = range_end;
> > +	unsigned int rs, re;
> > +
> > +	for_each_clear_bitrange(rs, re, bitmap, range_end) {
> > +		unsigned int start = max(rs, range_start);
> > +		unsigned int end = min(re, range_end);
> > +		unsigned int range;
> > -	for_each_clear_bitrange(rs, re, bitmap, total) {
> > -		range = re - rs;
> > +		if (start >= end)
> > +			continue;
> > +
> > +		range = end - start;
> >   		if (range < count)
> >   			continue;
> > -		found = rs + (range - count);
> > +
> > +		found = start + (range - count);
> >   	}
> > +
> >   	return found;
> >   }
> > -static int idm_reserve_chunk_locked(struct xe_guc_id_mgr *idm,
> > -				    unsigned int count, unsigned int retain)
> > +static int idm_reserve_chunk_shareable_locked(struct xe_guc_id_mgr *idm, unsigned int count,
> > +					      unsigned int spare)
> >   {
> > +	unsigned int shareable_start = idm_shareable_start(idm);
> > +	unsigned int total = idm_total(idm);
> >   	int id;
> >   	idm_assert(idm, count);
> >   	lockdep_assert_held(idm_mutex(idm));
> > -	if (!idm->total)
> > +	if (!idm->shareable)
> >   		return -ENODATA;
> > -	if (retain) {
> > +	if (shareable_start < idm->usable) {
> >   		/*
> > -		 * For IDs reservations (used on PF for VFs) we want to make
> > -		 * sure there will be at least 'retain' available for the PF
> > +		 * Spare is meaningful only for IDs that are shared between usable and
> > +		 * shareable pools. For non-overlapping pools, shareable reservations do
> > +		 * not reduce PF usable capacity, so there is nothing to retain.
> >   		 */
> > -		if (idm->used + count + retain > idm->total)
> > -			return -EDQUOT;
> > +		id = idm_find_last_zero_area_in_range(idm->bitmap, shareable_start, total, count);
> > +		if (id >= total)
> > +			return -ENOSPC;
> > +
> >   		/*
> > -		 * ... and we want to reserve highest IDs close to the end.
> > +		 * Only IDs taken from the overlapping part reduce PF usable capacity,
> > +		 * so a chunk located entirely in the VF-exclusive part is never limited
> > +		 * by the spare.
> >   		 */
> > -		id = find_last_zero_area(idm->bitmap, idm->total, count);
> > +		if (spare && id < idm->usable) {
> > +			unsigned int used_usable = bitmap_weight(idm->bitmap, idm->usable);
> > +			unsigned int need_overlap = min(id + count, idm->usable) - id;
> > +
> > +			if (used_usable + need_overlap + spare > idm->usable)
> > +				return -EDQUOT;
> Can we write a helper to check these limits and return error?

For -EDQUOT, yes: the shareable (overlap) path and the legacy retain
path use the same "used + count + spare > limit" rule, so I'll add a
small idm_check_quota() helper and use it in both places.

For -ENOSPC I'd rather not add a helper. Both bitmap_find_next_zero_area()
and idm_find_last_zero_area_in_range() return the end of the range on
failure, so the duplication is just structural. In v5 I'll restructure
idm_reserve_chunk_shareable_locked() so it does the lookup in the
if/else and runs a single "if (id >= total) return -ENOSPC" check
afterwards, the same way idm_reserve_chunk_locked() already does.

Thanks for the review!

> > +		}
> >   	} else {
> > -		/*
> > -		 * For regular IDs reservations (used by submission code)
> > -		 * we start searching from the lower range of IDs.
> > -		 */
> > -		id = bitmap_find_next_zero_area(idm->bitmap, idm->total, 0, count, 0);
> > +		id = bitmap_find_next_zero_area(idm->bitmap, total, shareable_start, count, 0);
> > +		if (id + count > total)
> > +			return -ENOSPC;
> Same as above.
> > +	}
> > +
> > +	bitmap_set(idm->bitmap, id, count);
> > +
> > +	return id;
> > +}
> > +
> > +static int idm_reserve_chunk_locked(struct xe_guc_id_mgr *idm, unsigned int count,
> > +				    unsigned int retain)
> > +{
> > +	unsigned int total = idm_total(idm);
> > +	int id;
> > +
> > +	idm_assert(idm, count);
> > +	lockdep_assert_held(idm_mutex(idm));
> > +
> > +	if (!total)
> > +		return -ENODATA;
> > +
> > +	if (retain) {
> > +		unsigned int used = bitmap_weight(idm->bitmap, total);
> > +
> > +		if (used + count + retain > total)
> > +			return -EDQUOT;
> Same as above.
> > +
> > +		id = idm_find_last_zero_area_in_range(idm->bitmap, 0, total, count);
> > +	} else {
> > +		id = bitmap_find_next_zero_area(idm->bitmap, total, 0, count, 0);
> >   	}
> > -	if (id >= idm->total)
> > +
> > +	if (id >= total)
> >   		return -ENOSPC;
> 
> Same as above.
> 
> Otherwise LGTM.
> 
> -Satya.
> 
> >   	bitmap_set(idm->bitmap, id, count);
> > -	idm->used += count;
> >   	return id;
> >   }
> > @@ -160,9 +285,8 @@ static void idm_release_chunk_locked(struct xe_guc_id_mgr *idm,
> >   				     unsigned int start, unsigned int count)
> >   {
> >   	idm_assert(idm, count);
> > -	idm_assert(idm, count <= idm->used);
> > -	idm_assert(idm, start < idm->total);
> > -	idm_assert(idm, start + count - 1 < idm->total);
> > +	idm_assert(idm, start < idm_total(idm));
> > +	idm_assert(idm, start + count - 1 < idm_total(idm));
> >   	lockdep_assert_held(idm_mutex(idm));
> >   	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
> > @@ -172,22 +296,61 @@ static void idm_release_chunk_locked(struct xe_guc_id_mgr *idm,
> >   			idm_assert(idm, test_bit(start + n, idm->bitmap));
> >   	}
> >   	bitmap_clear(idm->bitmap, start, count);
> > -	idm->used -= count;
> > +}
> > +
> > +static int idm_release_chunk_in_range_locked(struct xe_guc_id_mgr *idm,
> > +					     unsigned int start,
> > +					     unsigned int count,
> > +					     unsigned int range_start,
> > +					     unsigned int range_end)
> > +{
> > +	lockdep_assert_held(idm_mutex(idm));
> > +
> > +	if (!count)
> > +		return -EINVAL;
> > +
> > +	if (start < range_start || start >= range_end)
> > +		return -ERANGE;
> > +
> > +	if (count > range_end - start)
> > +		return -ERANGE;
> > +
> > +	idm_release_chunk_locked(idm, start, count);
> > +
> > +	return 0;
> >   }
> >   /**
> > - * xe_guc_id_mgr_reserve_locked() - Reserve one or more GuC context IDs.
> > + * xe_guc_id_mgr_reserve_usable_locked() - Reserve one or more usable GuC context IDs.
> >    * @idm: the &xe_guc_id_mgr
> > - * @count: number of IDs to allocate (can't be 0)
> > + * @count: number of usable GuC context IDs to reserve (can't be 0)
> >    *
> > - * This function is dedicated for the use by the GuC submission code,
> > - * where submission lock is already taken.
> > + * This function is dedicated for use by the GuC submission code when the
> > + * submission lock is already held.
> >    *
> >    * Return: ID of allocated GuC context or a negative error code on failure.
> >    */
> > -int xe_guc_id_mgr_reserve_locked(struct xe_guc_id_mgr *idm, unsigned int count)
> > +int xe_guc_id_mgr_reserve_usable_locked(struct xe_guc_id_mgr *idm, unsigned int count)
> >   {
> > -	return idm_reserve_chunk_locked(idm, count, 0);
> > +	return idm_reserve_chunk_usable_locked(idm, count);
> > +}
> > +
> > +/**
> > + * xe_guc_id_mgr_reserve_shareable_locked() - Reserve one or more shareable GuC context IDs.
> > + * @idm: the &xe_guc_id_mgr
> > + * @count: number of shareable GuC context IDs to reserve (can't be 0)
> > + * @spare: number of usable IDs to keep available for the PF
> > + *
> > + * This function is dedicated for use by the PF driver, which expects the
> > + * reserved range of IDs to be contiguous. The function expects that the
> > + * caller has already taken the lock.
> > + *
> > + * Return: ID of allocated GuC context or a negative error code on failure.
> > + */
> > +int xe_guc_id_mgr_reserve_shareable_locked(struct xe_guc_id_mgr *idm, unsigned int count,
> > +					   unsigned int spare)
> > +{
> > +	return idm_reserve_chunk_shareable_locked(idm, count, spare);
> >   }
> >   /**
> > @@ -206,60 +369,175 @@ void xe_guc_id_mgr_release_locked(struct xe_guc_id_mgr *idm, unsigned int id,
> >   }
> >   /**
> > - * xe_guc_id_mgr_reserve() - Reserve a range of GuC context IDs.
> > + * xe_guc_id_mgr_release_usable_locked() - Release one or more usable GuC context IDs.
> > + * @idm: the &xe_guc_id_mgr
> > + * @id: the first usable GuC context ID to release
> > + * @count: number of usable GuC context IDs to release
> > + *
> > + * This function is dedicated for use by the GuC submission code when the
> > + * submission lock is already held.
> > + *
> > + * Return: 0 on success, or a negative error code on failure.
> > + */
> > +int xe_guc_id_mgr_release_usable_locked(struct xe_guc_id_mgr *idm, unsigned int id,
> > +					unsigned int count)
> > +{
> > +	return idm_release_chunk_in_range_locked(idm, id, count, 0, idm->usable);
> > +}
> > +
> > +/**
> > + * xe_guc_id_mgr_release_shareable_locked() - Release one or more shareable GuC context IDs.
> >    * @idm: the &xe_guc_id_mgr
> > - * @count: number of GuC context IDs to reserve (can't be 0)
> > - * @retain: number of GuC context IDs to keep available (can't be 0)
> > + * @id: the first shareable GuC context ID to release
> > + * @count: number of shareable GuC context IDs to release
> >    *
> > - * This function is dedicated for the use by the PF driver which expects that
> > - * reserved range of IDs will be contiguous and that there will be at least
> > - * &retain IDs still available for the PF after this reservation.
> > + * Return: 0 on success, or a negative error code on failure.
> > + */
> > +int xe_guc_id_mgr_release_shareable_locked(struct xe_guc_id_mgr *idm, unsigned int id,
> > +					   unsigned int count)
> > +{
> > +	return idm_release_chunk_in_range_locked(idm, id, count,
> > +						 idm_shareable_start(idm), idm_total(idm));
> > +}
> > +
> > +/**
> > + * xe_guc_id_mgr_reserve_usable() - Reserve one or more usable GuC context IDs.
> > + * @idm: the &xe_guc_id_mgr
> > + * @count: number of usable GuC context IDs to reserve (can't be 0)
> > + *
> > + * Return: ID of allocated GuC context or a negative error code on failure.
> > + */
> > +int xe_guc_id_mgr_reserve_usable(struct xe_guc_id_mgr *idm, unsigned int count)
> > +{
> > +	guard(mutex)(idm_mutex(idm));
> > +
> > +	idm_assert(idm, count);
> > +
> > +	return idm_reserve_chunk_usable_locked(idm, count);
> > +}
> > +
> > +/**
> > + * xe_guc_id_mgr_reserve_shareable() - Reserve one or more shareable GuC context IDs for VFs.
> > + * @idm: the &xe_guc_id_mgr
> > + * @count: number of shareable GuC context IDs to reserve (can't be 0)
> > + * @spare: number of usable IDs to keep available for the PF
> > + *
> > + * This function is dedicated for use by the PF driver, which expects the
> > + * reserved range of IDs to be contiguous.
> >    *
> >    * Return: starting ID of the allocated GuC context ID range or
> >    *         a negative error code on failure.
> >    */
> > -int xe_guc_id_mgr_reserve(struct xe_guc_id_mgr *idm,
> > -			  unsigned int count, unsigned int retain)
> > +int xe_guc_id_mgr_reserve_shareable(struct xe_guc_id_mgr *idm, unsigned int count,
> > +				    unsigned int spare)
> > +{
> > +	guard(mutex)(idm_mutex(idm));
> > +
> > +	idm_assert(idm, count);
> > +
> > +	return idm_reserve_chunk_shareable_locked(idm, count, spare);
> > +}
> > +
> > +int xe_guc_id_mgr_reserve_locked(struct xe_guc_id_mgr *idm, unsigned int count)
> > +{
> > +	return idm_reserve_chunk_locked(idm, count, 0);
> > +}
> > +
> > +int xe_guc_id_mgr_reserve(struct xe_guc_id_mgr *idm, unsigned int count,
> > +			  unsigned int retain)
> >   {
> >   	int ret;
> >   	idm_assert(idm, count);
> >   	idm_assert(idm, retain);
> > -	mutex_lock(idm_mutex(idm));
> > +	guard(mutex)(idm_mutex(idm));
> >   	ret = idm_reserve_chunk_locked(idm, count, retain);
> > -	mutex_unlock(idm_mutex(idm));
> >   	return ret;
> >   }
> >   /**
> > - * xe_guc_id_mgr_release() - Release a range of GuC context IDs.
> > + * xe_guc_id_mgr_release() - Release one or more GuC context IDs.
> >    * @idm: the &xe_guc_id_mgr
> > - * @start: the starting ID of GuC context range to release
> > + * @start: the first GuC context ID to release
> >    * @count: number of GuC context IDs to release
> >    */
> >   void xe_guc_id_mgr_release(struct xe_guc_id_mgr *idm,
> >   			   unsigned int start, unsigned int count)
> >   {
> > -	mutex_lock(idm_mutex(idm));
> > +	guard(mutex)(idm_mutex(idm));
> > +
> >   	idm_release_chunk_locked(idm, start, count);
> > -	mutex_unlock(idm_mutex(idm));
> >   }
> > -static void idm_print_locked(struct xe_guc_id_mgr *idm, struct drm_printer *p, int indent)
> > +/**
> > + * xe_guc_id_mgr_release_usable() - Release one or more usable GuC context IDs.
> > + * @idm: the &xe_guc_id_mgr
> > + * @id: the first usable GuC context ID to release
> > + * @count: number of usable GuC context IDs to release
> > + *
> > + * Return: 0 on success, or a negative error code on failure.
> > + */
> > +int xe_guc_id_mgr_release_usable(struct xe_guc_id_mgr *idm, unsigned int id, unsigned int count)
> > +{
> > +	guard(mutex)(idm_mutex(idm));
> > +
> > +	return xe_guc_id_mgr_release_usable_locked(idm, id, count);
> > +}
> > +
> > +/**
> > + * xe_guc_id_mgr_release_shareable() - Release one or more shareable GuC context IDs.
> > + * @idm: the &xe_guc_id_mgr
> > + * @id: the first shareable GuC context ID to release
> > + * @count: number of shareable GuC context IDs to release
> > + *
> > + * Return: 0 on success, or a negative error code on failure.
> > + */
> > +int xe_guc_id_mgr_release_shareable(struct xe_guc_id_mgr *idm, unsigned int id,
> > +				    unsigned int count)
> > +{
> > +	guard(mutex)(idm_mutex(idm));
> > +
> > +	return xe_guc_id_mgr_release_shareable_locked(idm, id, count);
> > +}
> > +
> > +static void idm_print_range_locked(struct xe_guc_id_mgr *idm,
> > +				   struct drm_printer *p,
> > +				   int indent,
> > +				   const char *name,
> > +				   unsigned int range_start,
> > +				   unsigned int range_end,
> > +				   unsigned int used)
> >   {
> >   	unsigned int rs, re;
> >   	lockdep_assert_held(idm_mutex(idm));
> > -	drm_printf_indent(p, indent, "total %u\n", idm->total);
> > +	drm_printf_indent(p, indent, "%s used %u\n", name, used);
> > +	for_each_set_bitrange(rs, re, idm->bitmap, range_end) {
> > +		rs = max(rs, range_start);
> > +		re = min(re, range_end);
> > +
> > +		if (rs < re)
> > +			drm_printf_indent(p, indent, "%s range %u..%u (%u)\n",
> > +					  name, rs, re - 1, re - rs);
> > +	}
> > +}
> > +
> > +static void idm_print_locked(struct xe_guc_id_mgr *idm, struct drm_printer *p, int indent)
> > +{
> > +	lockdep_assert_held(idm_mutex(idm));
> > +
> > +	drm_printf_indent(p, indent, "total %u\n", idm_total(idm));
> >   	if (!idm->bitmap)
> >   		return;
> > -	drm_printf_indent(p, indent, "used %u\n", idm->used);
> > -	for_each_set_bitrange(rs, re, idm->bitmap, idm->total)
> > -		drm_printf_indent(p, indent, "range %u..%u (%u)\n", rs, re - 1, re - rs);
> > +	idm_print_range_locked(idm, p, indent, "usable", 0, idm->usable,
> > +			       idm_used_usable(idm));
> > +	idm_print_range_locked(idm, p, indent, "shareable",
> > +			       idm_shareable_start(idm), idm_total(idm),
> > +			       idm_used_shareable(idm));
> >   }
> >   /**
> > @@ -270,9 +548,8 @@ static void idm_print_locked(struct xe_guc_id_mgr *idm, struct drm_printer *p, i
> >    */
> >   void xe_guc_id_mgr_print(struct xe_guc_id_mgr *idm, struct drm_printer *p, int indent)
> >   {
> > -	mutex_lock(idm_mutex(idm));
> > +	guard(mutex)(idm_mutex(idm));
> >   	idm_print_locked(idm, p, indent);
> > -	mutex_unlock(idm_mutex(idm));
> >   }
> >   #if IS_BUILTIN(CONFIG_DRM_XE_KUNIT_TEST)
> > diff --git a/drivers/gpu/drm/xe/xe_guc_id_mgr.h b/drivers/gpu/drm/xe/xe_guc_id_mgr.h
> > index 368f8c80e4c7d..209f99831f1b4 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_id_mgr.h
> > +++ b/drivers/gpu/drm/xe/xe_guc_id_mgr.h
> > @@ -9,13 +9,29 @@
> >   struct drm_printer;
> >   struct xe_guc_id_mgr;
> > -int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm, unsigned int count);
> > +int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm, unsigned int limit);
> > +unsigned int xe_guc_id_mgr_max_usable(struct xe_guc_id_mgr *idm);
> > +unsigned int xe_guc_id_mgr_max_shareable(struct xe_guc_id_mgr *idm);
> > +
> > +int xe_guc_id_mgr_reserve_usable_locked(struct xe_guc_id_mgr *idm, unsigned int count);
> > +int xe_guc_id_mgr_reserve_usable(struct xe_guc_id_mgr *idm, unsigned int count);
> > +int xe_guc_id_mgr_reserve_shareable_locked(struct xe_guc_id_mgr *idm, unsigned int count,
> > +					   unsigned int spare);
> > +int xe_guc_id_mgr_reserve_shareable(struct xe_guc_id_mgr *idm, unsigned int count,
> > +				    unsigned int spare);
> >   int xe_guc_id_mgr_reserve_locked(struct xe_guc_id_mgr *idm, unsigned int count);
> > +int xe_guc_id_mgr_reserve(struct xe_guc_id_mgr *idm, unsigned int count, unsigned int retain);
> >   void xe_guc_id_mgr_release_locked(struct xe_guc_id_mgr *idm, unsigned int id, unsigned int count);
> > +int xe_guc_id_mgr_release_usable_locked(struct xe_guc_id_mgr *idm, unsigned int id,
> > +					unsigned int count);
> > +int xe_guc_id_mgr_release_shareable_locked(struct xe_guc_id_mgr *idm, unsigned int id,
> > +					   unsigned int count);
> > -int xe_guc_id_mgr_reserve(struct xe_guc_id_mgr *idm, unsigned int count, unsigned int retain);
> >   void xe_guc_id_mgr_release(struct xe_guc_id_mgr *idm, unsigned int start, unsigned int count);
> > +int xe_guc_id_mgr_release_usable(struct xe_guc_id_mgr *idm, unsigned int id, unsigned int count);
> > +int xe_guc_id_mgr_release_shareable(struct xe_guc_id_mgr *idm, unsigned int id,
> > +				    unsigned int count);
> >   void xe_guc_id_mgr_print(struct xe_guc_id_mgr *idm, struct drm_printer *p, int indent);
> > diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
> > index 3dbcb1331690e..6da43691e54c5 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_types.h
> > +++ b/drivers/gpu/drm/xe/xe_guc_types.h
> > @@ -42,10 +42,10 @@ struct xe_guc_db_mgr {
> >   struct xe_guc_id_mgr {
> >   	/** @bitmap: bitmap to track allocated IDs */
> >   	unsigned long *bitmap;
> > -	/** @total: total number of IDs being managed */
> > -	unsigned int total;
> > -	/** @used: number of IDs currently in use */
> > -	unsigned int used;
> > +	/** @usable: number of IDs being managed for GuC submission */
> > +	unsigned int usable;
> > +	/** @shareable: number of IDs that can be shared with VFs */
> > +	unsigned int shareable;
> >   };
> >   /**

-- 
