Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0B59109C049
	for <intel-xe@archiver.kernel.org>; Wed, 25 Mar 2026 17:13:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B334D10E160;
	Wed, 25 Mar 2026 17:13:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="itSoQ1zF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD84810E160
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Mar 2026 17:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774458786; x=1805994786;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=j04ZWoVLFTB3Fe4SOw1GuVD7bzw3IrVQzZpNu5X3YRg=;
 b=itSoQ1zFEdpQvQJh57XXmj1J/T3bfK0EBkFKa/Hj4xAUa3dru3C37R81
 LKtj6lrqJ4bQaD42J0gwexgotakVm1KLEkwb7Er93MJt1jxXa2YPoqBns
 9AjR4zVvHeFNgdWhQ4G1OrhqJs2B1Bn6c8s1dvNLFtcX5j3zonP4qC99d
 zNnDSQST3QqPKOSG6fyw5CGl4nj09hq5OnN2GXH4IWAZ/Qg/xIStS3PIr
 MClbT5BkOaDtuLR6Qi75mm7aqZ1toPYFRjC4UlQLChstij+1PySNUXbIR
 yKx+++vBeB32nMRfBjYjX3MGvfXoMjtq5C5R9q/I3Tf17t3Ykw/QKut2V w==;
X-CSE-ConnectionGUID: 74Xl8nOzSQiQKLNgXKQAwg==
X-CSE-MsgGUID: 92bVE5S2Tx2W05OrQgcj6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75466484"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="75466484"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 10:13:04 -0700
X-CSE-ConnectionGUID: JVdNgCI0TYiCf5CAtN42GA==
X-CSE-MsgGUID: SkzKK9vOTrGTe1BnCNta6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="224694997"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 10:13:04 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Mar 2026 10:13:02 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 25 Mar 2026 10:13:02 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.50)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Mar 2026 10:13:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hdUUVYsrPZuEgH/z3UFTi/SNEL6FeO8tSKqVdelVtW/ZfayFu+eK3/x2xCzgr6Drq+AcPASzL6+BJ9rx1m8z18qgMhHB/w7lRYtj3KiMS0fT8OnQFy0q1nGHN/7/vFymgv+Q/dSKTTklodOHW320iN6rewm90ixug9rjBrb/Y97DTQpzYnUgluAbRJmUfBSN6A3qCHZZb0Mv9EifNUznxPd77vIFSSCJcoT1XYvYWNXo5cNlXjW4zCL4zVg1ySdA9AhO9WluwZ8Lxlq6Sli3dEhIgpTCkFE4T4hbKKkv4S/hPb5+Iu82n/Jc1J2Mgy5l8A64UO9OMxCH51HIHP5/hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jspmPv2d9IOIUh56d7cJMK/d8xwsR76KCzIT7i3ad2k=;
 b=P2k83XFyV9RykOsuq3MQeATYLoQZrRwnN0kd1E8tWEHD/eexBbdCt+r+6ZebVCDk2PaybHT9eICgf7+c7M29oZiGkAe9iXS5oz3KZYWaBh7NfMu1sz2fmH9bu0ZE2uJcy5Lom0U4IaaNTCl4hHkVvuQm/B2MkX4OxbF52RKc5H4SKX5I8APqDYCjD5YaXBLfN6dVBEzHjLtmpVgeuewsEShhXMXwn1iMux0BM24iFYMb+eWZ8Twap1+3WqjF9NrxxjBpjdIGGri+bkV6Q2XdeDf886MOzKnlRNZrN2IAX2C74YLAzWGSk9xGVXOsPBjhX8DRVK8GYuLuuo+dC3ZdGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by MN6PR11MB8103.namprd11.prod.outlook.com (2603:10b6:208:473::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 17:12:51 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.20.9745.012; Wed, 25 Mar 2026
 17:12:51 +0000
Date: Wed, 25 Mar 2026 10:12:48 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <badal.nilawar@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@intel.com>,
 <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <matthew.d.roper@intel.com>, <michael.j.ruhl@intel.com>,
 <paul.e.luse@intel.com>, <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
Subject: Re: [PATCH v12 4/7] drm/xe/xe_sysctrl: Add System Controller
 initialization support
Message-ID: <acQXkNAorUC7EtnH@soc-5CG1426VCC.clients.intel.com>
References: <20260325120030.510480-9-anoop.c.vijay@intel.com>
 <20260325120030.510480-13-anoop.c.vijay@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260325120030.510480-13-anoop.c.vijay@intel.com>
X-ClientProxiedBy: MW4PR04CA0057.namprd04.prod.outlook.com
 (2603:10b6:303:6a::32) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|MN6PR11MB8103:EE_
X-MS-Office365-Filtering-Correlation-Id: 36c2af19-f29a-4e3c-b5b4-08de8a91bec0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: VOzKKgTasjLbe9NLlucuCwTb/oJoUjoNpDcJ0jj1inclMIhBaYs++k8Lybr2zDrUS9qA9Azow0apASnuCqPGmPBA5MHDJmtaPcTohYCZKbEzihUWZ0oYfrnI75Sv6IMuWrQ9xcpKFTsp056JltsiqSjYYp4h+m4zFAwm89jiFD6fAGKl19E4ewJTikwJ8YGk0MlEKB8o8c4UWIV4HnentIkbz8XCifTpzxqglapxjvltt8MrUj0fHS4IGqEwwVDC5lTngYIEyHbqb6ddmS3+K2L7DA8VNSpgWTxF3/d1t1kasaFMV4HJQtmOJ+Si9D5Br+UnYs+2vz0IY0++C1QZOumngmZteOd1rKj3FIo8LFf3CYhxPilT73KaCv1cwFaFEAAnQBQxAr1xJoQWO3t9wHdQHdyZOFnyp+xGjio2Y2AcHnHhXpBjfDGiB5A30b4AxC+uufcT8S72agbX+ddazE4DSwMYUiwdI1fjH9GmI6RzpYmIWjj7KNzQ61ySx4jfsGWlEOP9RRthW+WKgZGIrhdaWFe8ls2+jlA8Chn9p+tpHYYociBBq4d4wVUq4PCOjDVAeLeRzt95PurNihZj50jntOf5DBl7dI8oMeM96uyhPEjGMcYJOU5lFuqcGc4t+h7Ye6Y1WbyHUem6QkpCIc5xNldCSEAN0JGhOegrmVBZvfLgsy+/rm6RVJDeeEEl
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WVFCUHNlKzUwQkRKbGxET0xnVlQydVQ1VldyMXg2cVRTS21qZzdtOHl0dVFo?=
 =?utf-8?B?SVFrSDQzT1NvR0tuUC9BZDlnWENhOEpiVGlERm01dE9uQmJPS0psTGxaVnk3?=
 =?utf-8?B?d1pKSEVxZCtFNU9SWk9YakQ3Q2xSOE0wVGJsZmxRcTV1K21zSDY5S2NGQ2ZU?=
 =?utf-8?B?UElOSlJtN3p0c2pMWHNZWC9FMmUzczkyZElTS21HNXFOMXJhTEdQTllyNkVV?=
 =?utf-8?B?RUZhUGdtdDZybHhFbUNsM2NxRytoSTFPcGhEa3MyRXc0cHNqVXlYOFFucDlO?=
 =?utf-8?B?Rk5WOW03bW0yS2xMQmgzRDVPRzVxcG9IN0FMWTFKS1Q4Y0U1amQ0ZTExNXdZ?=
 =?utf-8?B?ajFwcWt5cGx3WFZFYktKc1A1cEZobzhOcm1lUUZEZWtsOWhIQ1Y3QnNrbExu?=
 =?utf-8?B?QmMwVk1uNkg4UjVhUTl3TWhtNC9PUEtkT3FNM1Z5bkZBZXphdWhjM0JDWmtX?=
 =?utf-8?B?THpXRi82ODQ1QXlXT1hKY01iY3ZxOVYxMTFUUHlRTUIyVFE0a2RDUUtoeVlW?=
 =?utf-8?B?b1U5aEoyRG5sdzM4a1Q2Q054S0N3bHR5WWU4VkRVMkN0QU5TV1hVNDc5bDJ5?=
 =?utf-8?B?d00yMUFHb095UzFUOUo0TGxCSitwa1o4MFkwN1RwV2NyQWhCbmVzYkJSdTVK?=
 =?utf-8?B?ZE94SEpJd1pkbGt3SE5JVlRDTVdZVmZHZjU0c2RVWkFneWZFVEJSeURXclUw?=
 =?utf-8?B?WDB3cElZbkVqeU5mNlErVWVYMXpuSkxnS3FCTDdxN3ZYSEFCTy9rcWM0dU0r?=
 =?utf-8?B?VlBmYndDU0l5b1VUQUhVU2JOV01LaU94bThkWEV2Y05zR0hieW5KZFNDSXZS?=
 =?utf-8?B?ZVg5aGhVSDFoYUFqdzByWFlpcUNsOGlEKzFZamxxcVp2bkNFSzVTTzRyVnVD?=
 =?utf-8?B?TzZhUTJVS08zaDZ3aGhtN3o5a3JIYmg4NHVEOWttdk1TZk5vZThNWlhkZ3M2?=
 =?utf-8?B?WlowQzNsNTRxaVBWRTk1a0FWcWJ6WGQ1ZzNZKzhQeDJoZUtlQkZDcWlFM2g0?=
 =?utf-8?B?ZkIwUlpNdWNWTVRGQUVDeTg5M0o0d0Y5dGhzLzR1c0Q1NHFpbnd3NHdhZXMv?=
 =?utf-8?B?dkx6ZmlxWUI5dEd6aDRyR0N2TVlkaS9ZNnRnMEYwTVhIUHgxUTNDaVNvKzBr?=
 =?utf-8?B?L1l1YWNtNnRMS0xVOGI5TU10VGJsUlJVaHgrNC9tdE80cHhqdXNzTkdSTnVZ?=
 =?utf-8?B?b0xoNndHUWRNQWQwRlpRd1RGQ1RxS05lZTlicnBJSVozVUxKUjBnYUF2Q2dr?=
 =?utf-8?B?VFRmQnVzZlRLUitlcXMybjJ1eG93ZUMwSEJWbnd6ZVE1S20zWW9GSHFUalJQ?=
 =?utf-8?B?bEhCWlJPWWQ3MTNNN0p1SnBzSUd6Q2VXc21mc0ZWTko4bHExaWozT0JHM0Mx?=
 =?utf-8?B?QzJXMlBqR0VpQmRYeEdwUk5QYjlaay9NN3FhYkRWa3NlTjh3WUk0ZlFkc083?=
 =?utf-8?B?NCttcEJhZnkxcE8rODE1bGVFZ2hKUE16WldCUDcwWjhaa01hRmR4UG9UVzB1?=
 =?utf-8?B?bVVTajhJL1VMRnkzTzNmWkhCaHBINDhkbWNLMzRpQkE2cUZBd2pFeHIwR2d3?=
 =?utf-8?B?SDNYV2RSdmR5RThGalBpUzd0M2VWOWhYNnR5akdFRjQ0b1FadTh1S21kcEtF?=
 =?utf-8?B?TGMwR0xNblIzQ1IwMG8wNUIzU20xT0pHTUwzOXNPSEp6WDF4WXpWZlZYT0VU?=
 =?utf-8?B?dDQ5OTJ4UjNPbERJa28vM3F0VW5MRlRteGMyVmdyWmg4NXFVcDhNKzhrd0Uw?=
 =?utf-8?B?dWNwZDFpMFZzdDZDV0g2NjlrMklweXA4YVl2bkxiMEVuZEtFMG4zSVpTR2kw?=
 =?utf-8?B?Y2V6azFQaXFUc3VOTkZpWHFKWDJhdzlSZ2o5TmliS2g0MG91UTVTUzJoeUZX?=
 =?utf-8?B?cjZjUXdDdVZOcnBzbXlyc0s5a0NNTmE5YmZqUkc3Y293blZxalFCRCtlbjVZ?=
 =?utf-8?B?MEZqYXBzT0QwK2ZVbGMrVDdQMk04dUlpV0pIczkzbGpxZkYvUTRILzZ3MkZI?=
 =?utf-8?B?QmFueXE3RWE4U3NwU1dKamRnMGV5d3VIOHY1MXJPcHhrdU94ajJLaFpCUkts?=
 =?utf-8?B?VGIwaG1xQzRxZ2ZmV1gzMUFBYzVSQXJlMExOOXFrZTR3NEFvemVSYUZvWUpn?=
 =?utf-8?B?bnlzOGtNVzNSdUZOcm1tVDVCOHJwdzljNHg0cUlVZEx3djJQRGtIRGNFLzhi?=
 =?utf-8?B?eW1ZNGgrNHhyZXRUQWFBL3MzclhrRDBjQjg3bklYT2lqU3RpMmh1WEFjUmhH?=
 =?utf-8?B?dTBLVDhkWFNkYitqNGMwaG1uWTZQUG1yRVlHOXJLdWhGanRxdW02THcyOUxE?=
 =?utf-8?B?WmhOcllqNGFPbHBXb1lvRkxMcmgzODY3NXpKOVV2TEpWZjYwQ3AyTFZPVmtU?=
 =?utf-8?Q?6dXju5d2d4nJB1080uVh5M+6BmCMovMTHlsol?=
X-Exchange-RoutingPolicyChecked: AKYtdGD4OR92bnB6/6NhfkLMLhYFyvV/zZrJq9dtVx76Nzxyv5oZ3ufZkn5HZNFKpwJoF/SFPxNeybAh7MyFjXl4gaWaM9pbr5VBUFILUiExQK/0Z+kcO0OSEpCauyTNGKCOgtT02rUTJYHXHQRQsFvWy9DRki4ed13UHl70azZUrjk+IZv/ONBCGnx4CKd9wuCAFXT9b2Tw0hpBZRSUM73TxMrL3QfIfOFvdhxW6CaqPtfzQkQRKMwQ4LFV5AFxODVVf/F+qEx+/YE3iAGG8dS8YdM0l9vGUNaaqoI6oRJLBge8/N2vu/U0smOJdKGAg1SspNoWIy3cL1f+iTDkfQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 36c2af19-f29a-4e3c-b5b4-08de8a91bec0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 17:12:51.0348 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LCUzXK7sQa1L0IisYHRnlJTqsogGg2NNWVM7ILI5Q9D/vGOJtd8W/0xjMoolyJNxSxmquTEv3HUXuHSrM8RUZZ+/jhP9LHqvyx8Xt1Phajo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8103
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

On Wed, Mar 25, 2026 at 05:00:31AM -0700, Anoop, Vijay wrote:
>From: Anoop Vijay <anoop.c.vijay@intel.com>
>
>Add initialization and cleanup infrastructure for System Controller
>subsystem and integrate it into xe device probe path.
>
>During initialization, platform support is checked via has_sysctrl
>capability flag and the mailbox region is configured through SoC
>remapper interface.
>
>Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
>Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>---
>v8: (Matt, Michal, Shuicheng)
>- Fixed include order
>- Added VF check
>- Converted runtime checks to assertions
>- Added sc_to_xe() helper
>- Fixed kernel-doc syntax
>
>v10: (Riana, Anshuman)
>- Updated sysctrl documentation
>- Cleaned up commit message
>- Fixed mutex lifetime management
>---
> drivers/gpu/drm/xe/Makefile     |  1 +
> drivers/gpu/drm/xe/xe_device.c  |  5 ++
> drivers/gpu/drm/xe/xe_sysctrl.c | 82 +++++++++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_sysctrl.h | 21 +++++++++
> 4 files changed, 109 insertions(+)
> create mode 100644 drivers/gpu/drm/xe/xe_sysctrl.c
> create mode 100644 drivers/gpu/drm/xe/xe_sysctrl.h
>
>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>index 49de1c22a469..b2d44e7169dd 100644
>--- a/drivers/gpu/drm/xe/Makefile
>+++ b/drivers/gpu/drm/xe/Makefile
>@@ -123,6 +123,7 @@ xe-y += xe_bb.o \
> 	xe_step.o \
> 	xe_survivability_mode.o \
> 	xe_sync.o \
>+	xe_sysctrl.o \
> 	xe_tile.o \
> 	xe_tile_sysfs.o \
> 	xe_tlb_inval.o \
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>index c8e91ff464a7..6df85a240f83 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -65,6 +65,7 @@
> #include "xe_survivability_mode.h"
> #include "xe_sriov.h"
> #include "xe_svm.h"
>+#include "xe_sysctrl.h"
> #include "xe_tile.h"
> #include "xe_ttm_stolen_mgr.h"
> #include "xe_ttm_sys_mgr.h"
>@@ -985,6 +986,10 @@ int xe_device_probe(struct xe_device *xe)
> 	if (err)
> 		goto err_unregister_display;
>
>+	err = xe_sysctrl_init(xe);
>+	if (err)
>+		goto err_unregister_display;
>+
> 	err = xe_device_sysfs_init(xe);
> 	if (err)
> 		goto err_unregister_display;
>diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/xe_sysctrl.c
>new file mode 100644
>index 000000000000..fd23f345d8c7
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_sysctrl.c
>@@ -0,0 +1,82 @@
>+// SPDX-License-Identifier: MIT
>+/*
>+ * Copyright © 2026 Intel Corporation
>+ */
>+
>+#include <linux/device.h>
>+#include <linux/mutex.h>
>+
>+#include <drm/drm_managed.h>
>+
>+#include "regs/xe_sysctrl_regs.h"
>+#include "xe_assert.h"
>+#include "xe_device.h"
>+#include "xe_mmio.h"
>+#include "xe_printk.h"
>+#include "xe_soc_remapper.h"
>+#include "xe_sriov.h"
>+#include "xe_sysctrl.h"
>+#include "xe_sysctrl_mailbox.h"
>+#include "xe_sysctrl_types.h"
>+
>+/**
>+ * DOC: System Controller (sysctrl)
>+ *
>+ * System Controller (sysctrl) is a firmware-managed entity on Intel dGPUs
>+ * responsible for selected low-level platform management functions.
>+ * Communication between driver and System Controller is performed
>+ * via a mailbox interface, enabling command and response exchange.
>+ *
>+ * This module provides initialization and support code for interacting
>+ * with System Controller through the mailbox interface.
>+ */
>+static void sysctrl_fini(void *arg)
>+{
>+	struct xe_device *xe = arg;
>+
>+	xe->soc_remapper.set_sysctrl_region(xe, 0);
>+}
>+
>+/**
>+ * xe_sysctrl_init() - Initialize System Controller subsystem
>+ * @xe: xe device instance
>+ *
>+ * Entry point for System Controller initialization, called from xe_device_probe.
>+ * This function checks platform support and initializes the system controller.
>+ *
>+ * Return: 0 on success, error code on failure
>+ */
>+int xe_sysctrl_init(struct xe_device *xe)
>+{
>+	struct xe_tile *tile = xe_device_get_root_tile(xe);
>+	struct xe_sysctrl *sc = &xe->sc;
>+	int ret;
>+
>+	if (!xe->info.has_sysctrl)
>+		return 0;
>+
>+	if (IS_SRIOV_VF(xe))
>+		return 0;
>+
>+	xe_assert(xe, xe->soc_remapper.set_sysctrl_region);

Ashutosh pointed out that this is failing for other platforms that do 
not support SoC remapper. Let's change this assert back to how it was 
here - 
https://patchwork.freedesktop.org/patch/701662/?series=159554&rev=7

if the function pointer is NULL, just error out.

Thanks,
Umesh


>+
>+	xe->soc_remapper.set_sysctrl_region(xe, SYSCTRL_MAILBOX_INDEX);
>+
>+	ret = devm_add_action_or_reset(xe->drm.dev, sysctrl_fini, xe);
>+	if (ret)
>+		return ret;
>+
>+	sc->mmio = devm_kzalloc(xe->drm.dev, sizeof(*sc->mmio), GFP_KERNEL);
>+	if (!sc->mmio)
>+		return -ENOMEM;
>+
>+	xe_mmio_init(sc->mmio, tile, tile->mmio.regs, tile->mmio.regs_size);
>+	sc->mmio->adj_offset = SYSCTRL_BASE;
>+	sc->mmio->adj_limit = U32_MAX;
>+
>+	ret = devm_mutex_init(xe->drm.dev, &sc->cmd_lock);
>+	if (ret)
>+		return ret;
>+
>+	return 0;
>+}
>diff --git a/drivers/gpu/drm/xe/xe_sysctrl.h b/drivers/gpu/drm/xe/xe_sysctrl.h
>new file mode 100644
>index 000000000000..d5d8735038ae
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_sysctrl.h
>@@ -0,0 +1,21 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2026 Intel Corporation
>+ */
>+
>+#ifndef _XE_SYSCTRL_H_
>+#define _XE_SYSCTRL_H_
>+
>+#include <linux/container_of.h>
>+
>+#include "xe_device_types.h"
>+#include "xe_sysctrl_types.h"
>+
>+static inline struct xe_device *sc_to_xe(struct xe_sysctrl *sc)
>+{
>+	return container_of(sc, struct xe_device, sc);
>+}
>+
>+int xe_sysctrl_init(struct xe_device *xe);
>+
>+#endif
>-- 
>2.43.0
>
