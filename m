Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 752AED1624F
	for <intel-xe@archiver.kernel.org>; Mon, 14 Oct 2024 12:10:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3653E10E44A;
	Mon, 14 Oct 2024 12:10:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H/XJ+xfs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FD9010E44A
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Oct 2024 12:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728907831; x=1760443831;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xDsNeFTbESR4c+rA3jXRgJHZTy1gvKwi/4EYkIX71T0=;
 b=H/XJ+xfssFve31ATuH+3jV1x1iV2z8Cx0JgJeREu/0XQUFvpTtI3y6zb
 5kO56XgoQZJCatBEqSxKVrYkwTYDPX9ZE2GA4YjqGLqzhhbu4GAxtMhMx
 53qXciVNPfU2o6jVrtp/wKVwZhVIGeM2PIYR65Vuric9/riJOVlZwlB+W
 oUG49mWAdvm8OsfCM+BQOeu3UHM4U9unaEURKvYyCi+VaOzcg/UBrDGOc
 7M7fXyy87+AEHQmdseNT2w1rlFG56FlI1EOSKx8Zpq4K1sgTlZIKY15jV
 A9yXoeYyj7DOH4216OiADcAzppcZcGCS2PqxjBJxoT1Xb/Eelybm1Jq+8 w==;
X-CSE-ConnectionGUID: 5GdGR2w2TMmGWeauy8rfAg==
X-CSE-MsgGUID: oojosTDfTei0zXH7qbZhfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="32169780"
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; d="scan'208";a="32169780"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2024 05:10:26 -0700
X-CSE-ConnectionGUID: j7IDu0wBTsuFiHlvIyZhQA==
X-CSE-MsgGUID: rXEfi/qhRhGvwGTt2L/YPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; d="scan'208";a="77739777"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Oct 2024 05:10:26 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 14 Oct 2024 05:10:25 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 14 Oct 2024 05:10:25 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.46) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 14 Oct 2024 05:10:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=depEjpZfntQSf7Z0PysxCwo0JDa5cJCTqIBf4FzzzIVShK9Fy/cp6kmIavmBp9zar4XYCWeMWnQHtcRzZLEQVtXH6XLxJwUrKV21ROOt3KjaKavDA024OUBkflVx9j3CXkYz5CDJJzhhqjFhE+DjPW7/8lMUIAt9ghsZDIz9azuE+peGSZ81UHCmi6bLcqhp6uaXUiNn3rtDgoOIkV2BmnkV08Z7MRWoVZ5o2IujliDuLQkSzduFyXxrIbA5f8+Ox93R+ibmv0bdtRTZlwwZH5nxqohMJVSqi7QdPKPriddCaCMVrgpKV37vkzJ+RcnhBURttVm9PqOvnVBGfFBicw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7kK6aI7+nNbikEaz51SdZ2pjVZuEHODYyHGcWSDW6QU=;
 b=JeMH6NKCzI8QwpDNmFv6/KnH6emm6+YoYrj9MsuDfA2rCqxpzxWTletwCi4Ee1HysJZWHyvFobI3gsxbgsCAfNE116hSSY9lJUM9cUdHiS6pmxE50JtXxur/+MSonpJHea3FtBKanRuDFDOYcbFS9eNahDfCVI8LkYfMMLTznbqqAyQolaf4Ka695gNr/SJCmKW5upbdsEwHhDBL58JSb0GSTqEfadn6I/kn5tioamKL2beOoF1Vd3PbH3i18jjWu4Ew4SyxW4cJClCUbe96uHGbtcfwuQflBIXGIagyfz0DICaWqHB063oIZvYaDxogSe/VQSHuEEzYZ1CCz3wAXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by LV2PR11MB5999.namprd11.prod.outlook.com (2603:10b6:408:17d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.22; Mon, 14 Oct
 2024 12:10:23 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%6]) with mapi id 15.20.8048.020; Mon, 14 Oct 2024
 12:10:23 +0000
Message-ID: <9eae52ab-fe51-487b-9db3-6c05c4a58d20@intel.com>
Date: Mon, 14 Oct 2024 17:40:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/xe/guc/ct: Improve g2h request handling during
 async gt reset
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <john.c.harrison@intel.com>, <rodrigo.vivi@intel.com>,
 <matthew.auld@intel.com>
References: <20241009105645.1416588-1-badal.nilawar@intel.com>
 <20241009105645.1416588-2-badal.nilawar@intel.com>
 <Zwhc5V5aQDSbhBWN@DUT025-TGLU.fm.intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <Zwhc5V5aQDSbhBWN@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0031.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::18) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|LV2PR11MB5999:EE_
X-MS-Office365-Filtering-Correlation-Id: cdef314c-f9e6-4df1-9bdd-08dcec492dde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MWJwZ0F4ZHRhcGVCWEl1NjQ2SCtEaEhNZTMzc09CcFoyeWRpa0NON2Q1TGo2?=
 =?utf-8?B?Zlg2ZUZ0UDV2K0xuREd5UTF6dENjUDNhdnN2QTI2bzh4ckRBNzlLcFlhUisv?=
 =?utf-8?B?TEptOHlNaDBXUnRhdzBnUHBHZXBNanVDR25wdzdpaWpDaU9kK3dKMXFGZUI0?=
 =?utf-8?B?ejFadC9pVzI4RHVtY2szUlpJYzhXcXhTMFZ1SHZ3aGt2SUxUdVZRWmxKWmZk?=
 =?utf-8?B?ZkxLbVZ5Z0c1elJONmVVMjltYW5YeHRLTzBBamtrQlRWZjZCWjZ3UDVSdzUz?=
 =?utf-8?B?WS9ldDZTZUI5SVBUWnBicVJqc1M5S25iOCtRbEdKTS8wejV2UGViTFk0U2RW?=
 =?utf-8?B?SUg1NjVhUUFlTi9VY2ZFRG40VmFxdk9ydjZhOTdwVEZyNTJEbGd4U1BWcHhM?=
 =?utf-8?B?cG42Y2JScFRCcWViS3N0VkZSUkw0aTBYVGtpTFVkUUVtOUlMWDJZWU9tTVVN?=
 =?utf-8?B?MlNtb2NqYkcrVVdPMTdVZXZNK25Nd0NNTHRVWUlzSVA1cDJlM3BuRG8xRnRs?=
 =?utf-8?B?NDVJbWhudm5QYmorYmhHTkpVbzFDYWpnYTVUd0VhK01melQxRENPdk5yMmhy?=
 =?utf-8?B?WXZPWW9YSTROeU44cExVbjVxTnljMlh0OU5xa2Flc2VPbW1wZEowd0xHRTUw?=
 =?utf-8?B?QzgwTktBVFhKbXVmd3NCUVJkQnUrTmxSbW5EcktmQ293cU5WNEEvTEJEMGZR?=
 =?utf-8?B?U05iTkc4VEx5aitTU2MrcUhoVWNUYVY1L2FlUzZLOXVGMjZpbkUwZWVlakZz?=
 =?utf-8?B?SWtqbmlKajlybUhnWmJVK0J2VGdaR3FCZkpPRlhrM3FXQjkwNW05eGMycVFO?=
 =?utf-8?B?RVdMdTJQTExHUWhxaTRTV0paeG01QmNZbGl1OTBMdXZHbVBnRkh6UGt5bnJn?=
 =?utf-8?B?K212c05qYmpxMW9TZ2xCS21wZytweHRkY1FQSkszN3pPWjQ0YzBpWWRTNkk2?=
 =?utf-8?B?UzhhYmJIRVVUcHl2c1VGR0xaOEp2ZTRuMG12dnk0QTAvM0JnZzRCbytNZnVq?=
 =?utf-8?B?NjBMcnNUMEdwUXRJVU54QlpFTE1ZQk5wUG95UUk3MU5lMXIzc05ualR1aEVh?=
 =?utf-8?B?VHlEbC9uZG5idTRBOVp6Rm8wNnJjVGRKOUNIaDlqVWVObzdocGlWc1l1Q3pE?=
 =?utf-8?B?Z1ZPWDZqOExLdWJVM1RzdE1KRklhaVBBNW1jZmVTUFVwdUdWUTdVSWxnKzUr?=
 =?utf-8?B?VE1VWXlQdS9FTDludlBFRWRIRnZZSW83aTZiQWlleDhlejVONDRWWkg5OGUz?=
 =?utf-8?B?aVRuS0ErU3JkcFVoZGJZaEl0UTJ3M2NVaDJia2d6LzJVYlZUYnVSMWRRdTBX?=
 =?utf-8?B?bEF5dkk1Tk01OFI3bHdFMU1JenNXQ21xSEl6SG1tdkxQbnREMlgwVTlySmsv?=
 =?utf-8?B?UUJhSjUzN09paFJvY1JyS2grT3hXUmtKUjAvRnExQUhzcDlyUW1QYklpenlC?=
 =?utf-8?B?TkpMS0F2ZGYzQ1FhWndCZ3kwei9mSXlwUEkrWmRveENESHlpYnFXL0pWd1pK?=
 =?utf-8?B?UUVPS05UMk5CYmZWQUFIcmdDd0w3YkZlUzFsWE0zSnBNNytYdTd2aUJxZ0x3?=
 =?utf-8?B?TzduL2pGdWtITTkzVGlFdFgvNkVUNzg3Q0xUcy8rNllTVFQ4a1Z5aEpYSE5S?=
 =?utf-8?B?NkNOejN4R0Z0bk9Vb25ESlJVVkFCbkFFSHE1M2pxZ0JrbHVQcCs5Q0RsR0Q1?=
 =?utf-8?B?RXN5NW4xZkVhVmFWb3djSVZQNjN5VmI2ZnM4ZFZXWU14K2djVjNZd0lnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVR1SklEWFVIRWRhME42b01zNFlwK2lLb2V3cE9VOUVrZjRRZ1RkWGVMT2JU?=
 =?utf-8?B?dW5KKzVmVDVBQ3JUS2pteHQ0REgwRTBtNWE1RVhMemdpWHd5RmEyVzNaV1NJ?=
 =?utf-8?B?bEVrVTVCSkNTVGU1WEFFejNtLzQ3eXBtU1MydDBJR2VGWDVMTjg0Z1orUSsv?=
 =?utf-8?B?Z0FaTW9wZ1hSM1RJdE5nSFU2bTJkdHZhb0k1RE9xUWYraEVNT2hSVkJsL0VM?=
 =?utf-8?B?MDdJTjErVlhFNUlzbVA1UkFIQW80aGpSQkZJVTJGNkxSSjZ4WE9ObFo4VHRj?=
 =?utf-8?B?d05EUnFyM3BrRWhIMEZCYmdiYU5vamZWck9BZjFpU3ptOVZkUmFVLzVoNXMw?=
 =?utf-8?B?d2dnNE1HT2puN3JDaGJHSVpOUThaSzZoSjBiSjFPd1pJTHp2Rlh0aFlDV1l6?=
 =?utf-8?B?YjM1QkQ2c3ovbGlGNHUwd2VuMVZML2ZWY0t6bTVOTUVNMzVkM2pBOFJIYzhU?=
 =?utf-8?B?MVlJM1daNExnbVVHME5DU0JGSVE4VVp0VDVMMlNCd3VRSDNnRjZnV2IxOFBP?=
 =?utf-8?B?M3BlOXdJVC9xbGRTKzdMVE95TGFKcWszWEYxRzROWTQvV0poS1ptMDE5Z25U?=
 =?utf-8?B?Um8rWUZMaWVMbDEweTFKVnBWK2xXRmV6TFBhUHp0S3J0T05CZWxrbzdXYkFU?=
 =?utf-8?B?YUlnNi9LbEhzajhVa0V4RDBBL3p5RFB2OWF6R0R5LzNYMUYxcldPMFU0cWh5?=
 =?utf-8?B?cU0yZ2dYVFNVeGpJdkI2Wmh2VTNTS29pNlZ1OGR6MkRYbTkxRlYzc2lJeDg1?=
 =?utf-8?B?SU1PWDE0YmJTaUE5STl1S0tUNmZIVFAwMmxiL001cUNJaFR5VmlMVTk3ZHd2?=
 =?utf-8?B?QTlTVU95YThXUzlHK3dMaUdWelhkQmtHalZycHdXR1ZIUFJEa0ZORFN6SWtC?=
 =?utf-8?B?VDE4NWdyTFlUQ1NNZStwazdVQ0RQRjgzL1EzbXBrS0k0RTFsK0d4YkJCYi9D?=
 =?utf-8?B?ZFJUN1AvUGZsQlZHaFFmT1FDTjROek5yM3hlbnFPSlVZSmxWcW9RKzVwMm0v?=
 =?utf-8?B?cUtnN3RXVU9qQ3VwSVZuY2ZrVDNMZ1grVTErbEJSVG9jejAxUndvazR3ZkRE?=
 =?utf-8?B?NlZ5K3M5TC9Bb1ZHVC9qaGlqT0x4dnR6b05hM2pHNVUzZTk1aThlY1EzQXM1?=
 =?utf-8?B?V0tuTGlIRlllL0JCeEplQTJlWkZmT1U3QWZOYmxvQUUrckJwRTI5VGQyVFZI?=
 =?utf-8?B?a0QzNHhRcTloRFh3blBGRmw2N1Y2QVdKS01NR3R3bFE1UjFKODMwYVNUK2VK?=
 =?utf-8?B?Ry9qcVBKZjRWSEZyOGdXYXFSZkJhYUNNYzJNYlg0NWQwdHpxYm5xOURYcTlp?=
 =?utf-8?B?N2M0V0RDT2tPTUt6eWV5R1VQd2NhdzFaSkxoZloyQUFOYzM5UzU0dGdYUnVZ?=
 =?utf-8?B?S0lwdWlramUwWS9ZVU90SjhNSktFbkdQSkJyVjFmRkRMZzlWWFRQeGdhZEF5?=
 =?utf-8?B?Q2MwdWxseW9pNnVtYW96MHJnRmFzWWRzQ09vS1NhbEp5dTUzdDhZOGZjWDZC?=
 =?utf-8?B?V2xSSkxWSDBzUG8wOHYxcWFRY2pvMkpQNVpDR2JzNEJ4dE9zUHpqRnlzN1pw?=
 =?utf-8?B?a1NnbDZROXRkT0xaTVpobnpJeVFXY2ZwRGZnVTJONncvYmlvckZucTV5MkdB?=
 =?utf-8?B?cGlGVWU0eGNmRm0zeE9iWlM4WHVsOW5ORjgwTzE0L2l2eHJUK3Q1Vm93UDdS?=
 =?utf-8?B?NFc0OW5Ca01wYi8vcjZOQjFQT3BWWWJEbFNBYTBCTEZDMWRvWDNjeUxwVm1q?=
 =?utf-8?B?UlNvVENvdCtLRjZoclFwU2NrN2hNSlY1bXVGbjNMWVZyMGVkSDU1aEFCb1Jv?=
 =?utf-8?B?MWNPMGNueDhGcm0zUmVTeTA5TXpPeGJWeE1XZk9pRC9lZE9YRVFaWjg2T0lY?=
 =?utf-8?B?UEZtU0ZDalhacHNwSERONU04TlVtYTI3MGsvcGlIMkVkdUxzU29GQnhyaWpy?=
 =?utf-8?B?c3dTUC9va1lMTGpMT0RKWHd3Nkx4cjZTeVA0SUF6MEhzUkVUTlVId3NuN0tR?=
 =?utf-8?B?MnE1ejlGKzdQbnFDRkc1Rit3RzNqVWF4VjFRdVNEcGdlYjIraXBaekFRenFo?=
 =?utf-8?B?ZDEyUXdrVzhTczJHMi9NMGNFMFlUNWJmVHdRaXBCZHNqSzVKTDNPa29sZmNp?=
 =?utf-8?B?TkpoOEhGYmdmQS9OZ1ZIVyt2WWxhdm5RUVpPQ2lINGNDTitwMVgyemdBYkJS?=
 =?utf-8?B?OEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cdef314c-f9e6-4df1-9bdd-08dcec492dde
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2024 12:10:22.9743 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8VS31CdcFHQhNSA+6ksmbUFtQj9eK5VJDtiIaHWl5Mdsb5MLCdfN4zsUy277xdPFPd5R0MtjFgYJvVp2KBAzkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB5999
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

Hi Matt,

Thanks for review comments.

On 11-10-2024 04:31, Matthew Brost wrote:
> On Wed, Oct 09, 2024 at 04:26:43PM +0530, Badal Nilawar wrote:
>> It is possible that a g2h request may be cancelled while waiting for a
>> response due to an asynchronous gt reset. This commit ensures that in
>> such cases, caller will be notified by returning -ECANCELED.
>>
>> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Cc: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_ct.c | 16 ++++++++++++++++
>>   1 file changed, 16 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>> index c7673f56d413..b93b2821e4e8 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>> @@ -512,6 +512,9 @@ void xe_guc_ct_stop(struct xe_guc_ct *ct)
>>   {
>>   	xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_STOPPED);
>>   	stop_g2h_handler(ct);
>> +
>> +	/* Notify callers that CT stopped and G2H requests are cancelled */
>> +	wake_up_all(&ct->g2h_fence_wq);
>>   }
>>   
>>   static bool h2g_has_room(struct xe_guc_ct *ct, u32 cmd_len)
>> @@ -1018,6 +1021,19 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
>>   
>>   	ret = wait_event_timeout(ct->g2h_fence_wq, g2h_fence.done, HZ);
> 
> Better would be abort the wait here if a GT reset is queue'd or in
> progess. We do this a lot in the xe_guc_submit.c - see any of the
> wait_event functions in that file. We likely should normalize this a bit
> with proper layering but basically the flow should be:
> 
> - Any wait_event_* are OR'd with a queued or in progess GT reset

In xe_guc_submit.c to check if reset queued/progress we check guc 
submission is stopped xe_guc_read_stopped(). Are you suggesting to use 
xe_guc_read_stopped instead of checking ct->state?

Or we should do like this?

ret = wait_event_timeout(ct->g2h_fence_wq, g2h_fence.done || ct->state 
== XE_GUC_CT_STATE_STOPPED, HZ);

> 
> - After wait_event_* signals check for OR condition, handle gracefully
>    via an error code kicking it to upper layers

Agree.

> 
> - All upper layers need to cope with H2G failing or use *_no_fail
>    versions the H2G functions. The *_no_fail versions are untested as I
>    coded those 2.5 years ago in Xe and don't have user of those functions

Ok.

> 
> - Queuing a GT reset wakes up all waiters

How should we do this. After queening GT reset or during GT reset CT 
communication will still be there. Especially during gt start we do 
guc_pc_start there xe_guc_send_recv is used for SLPC check.

> 
> - Upon completion of GT reset the OR condition is cleared

Ok. Condition will be cleared once CT is enabled.

Regards,
Badal

> 
> Matt
> 
>>   
>> +	/*
>> +	 * It is possible that the g2h request may be cancelled while waiting for a response due
>> +	 * to an asynchronous gt reset. In such cases, return -ECANCELED.
>> +	 */
>> +	mutex_lock(&ct->lock);
>> +	if (ct->state == XE_GUC_CT_STATE_STOPPED) {
>> +		xe_gt_dbg(gt, "H2G action %#x canceled as GT reset is in progress\n",
>> +			  action[0]);
>> +		mutex_unlock(&ct->lock);
>> +		return -ECANCELED;
>> +	}
>> +	mutex_unlock(&ct->lock);
>> +
>>   	/*
>>   	 * Ensure we serialize with completion side to prevent UAF with fence going out of scope on
>>   	 * the stack, since we have no clue if it will fire after the timeout before we can erase
>> -- 
>> 2.34.1
>>

