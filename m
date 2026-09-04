Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18290C624DE
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 08:53:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D04BA10F975;
	Fri,  4 Sep 2026 08:53:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PMGH8ZwJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C2E010F975
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 08:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788512000; x=1820048000;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4XnWJJCTCXFJtvXQKfyShHzRwCqk1knqDrVicDUJiEQ=;
 b=PMGH8ZwJKPiLeAgIWVE5+njWt7HKJFMwIGNgVzVuAlbune3la/990Z6Q
 kqTsuhb6G6gnvT1APGKbX7shDW/5uJFZBEA6NRH6QZ94I6RXqamYKBf9a
 hUgDEjA8Kn+rmhb8CmhEvbwZg86FhUnOmH9re+b8cXNFxDWvzoCH/BmjF
 jhqxGhiSunMbANP8leLiXNSdfnaieLHLAcXSnU0hu1ZJxAZGV/EG18ugv
 4f5romtVuYnY6IFbqWdVhyPM6HcRnaQgQ1WoM7H1nl+CQcMwAVq6WicT+
 fjLDFx8uA72qUdutue8vEyrAYq5p3HlnbgytVE9SNZXXAUjRsoFV+HsDo A==;
X-CSE-ConnectionGUID: YhmY/PJ3R4qTfMA4mpKHeg==
X-CSE-MsgGUID: 6gdhi5bKRauTKZwlk2hm8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="92707023"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="92707023"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 01:53:19 -0700
X-CSE-ConnectionGUID: cMNE23RxSGmUVZhaAz22jg==
X-CSE-MsgGUID: enB25ETASwyHgCl9oKUbcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="270520048"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 01:53:19 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 4 Sep 2026 01:53:18 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 4 Sep 2026 01:53:18 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.5) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 4 Sep 2026 01:53:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ncvyJKNk3pHpeNLTO+0213LzKv+iH+gkhnkE49mIGlcs6tlg7PfWWGGR3cp0bdGjBNUvXJHd2TOsrQb9BZJtdnY1WEa9GeJJLOd5Rkedy9rRrSfzenqpqCdg5TjBBXkmoUSMmkOOVX6TG/w0f2QhSNyfZfBJ1uXCxzE4gVbxPhuESLfmRqI/4+DhaQdEAGCbELFxwlBMHWRiyP8CcYb4BM8O5YjCzkAixxuiGPnUftGwWApEkxSE6Kc/ehRFGjL1a1SMM10/UJJlLFWZNv/+d0BZc7t4cf7rdkYIV6Ut70A2mZBIQ9eksTy2g19I+oHCJQ2Z81ar04MrpVqFejTffw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=geXyUpel3cNsv0YCcuGE0pLN2Zvmbxcxwpz+zDvuWYw=;
 b=JOpHaS7fRx75ywhgWqcCKeMYJFJQ3pk4UgqUAvSOjrFqXkXFBc+VvUwuCjl3CJkOu6vrMuAQ2mJQJINU6LhyuOKHTxi9ZXQq7enm0CsBT+WMhq/lXSEANEe7WhHhB38eVZxM7CV0rpEhIsfgfuQ8QFcpCyMuIsbfShWXYCwx6JX5plBnyE3ED9Xksao2J677tKg0Q9BvSwUO+Dh6b/pliq8p38py7KCK/Bqk20oAYSkBwhXJ/ojCDXbuTd+3d4tBQEhN88VzkJ+5p/G7a+my7kNABAqU2C3BWXcf9A6EKGxZFtTY8T5QAZB77ql9pBjVUoTbOLCGlj2G9GpYkOX7NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by MN0PR11MB6057.namprd11.prod.outlook.com
 (2603:10b6:208:375::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Fri, 4 Sep
 2026 08:53:15 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687%6]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 08:53:15 +0000
Message-ID: <78286916-40ee-4ec1-83b2-4d36678498ec@intel.com>
Date: Fri, 4 Sep 2026 14:23:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/guc: Guard page-fault ack with runtime PM check
To: Matthew Brost <matthew.brost@intel.com>, Varun Gupta
 <varun.gupta@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <stuart.summers@intel.com>,
 <szymon.markiewicz@intel.com>
References: <20260904080505.4159219-2-varun.gupta@intel.com>
 <apqBlUxnqRBJ9uBc@gsse-cloud1.jf.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <apqBlUxnqRBJ9uBc@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0209.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b0::8) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|MN0PR11MB6057:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cced3a6-80c0-4ecf-cfae-08df0a61f519
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|10067099003|56012099006|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: qjK91v6WymMXiOsVhHUKtmmZ5BqaU9iJc0A+6AG9f5Xnl6eKI3fjG6fzMI7Vzkj9qpQKm+Ec1UyfNOE0ScKqmwR16XktG7uS2nLBgH2Yd7ZdjNnwe6O1xYs+VP9znqD1up8xK/LTtniJpGB2PieE+tiSin14GgHQLhiYeV5Rqc+NK+YJ02UNa12JvzDITX1GUa6487WBC8K3k0aggBwDHUSmawhaSFKM3+YTbdzZX1XCI7mD/3uUp2xbJKptM/7Q3KAbbiN4YwJjiG9dn9FkXZilfVZ1n1rCwVZdqInAGW1xaVnmAr6DSf5J8Vq3pWIRQ29v3PQCHUqRJbGZw129nLQ8mwxC0qat1AUR2/NU+2EejuDa3ws5ta4dfVbftUPc7JQFxCiM9/19ToVtwRbn7PVvD/Pk3Jzcpl8BSLSOHcttKjrC7A6aOvaErAL/NsnnoAdUv/PZyV/ceE0mY1a3ySbssKZziHg5yDtcy5pnfJ7ODpQC5xz9QgG11pcPxEDSoIIDb4K8shFPMNh5W9CX4/hxu1BaDu9yUoi9FJjS3fdSIMoeMYi7+tnC/EQZdJqPAYc3vov41ArBW5iKnLAH4BgGdJd1x1pNTQ3ejgEWbx1GQrCIpoJzpfYFVx3q/VOD2HaFwnu+QreiWSbvkl2nuCrjjnNqpYCtpkmcCX2pqc8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(10067099003)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YklQR3I3MWtDUnNDSnhWRGp3c09hd3liRXRaUTcwcnVJamVNQ0dIZkNnSmJ1?=
 =?utf-8?B?eFNOaVZYeElPMm1JUWxEazA1WGdGVzdUNnB0aTJ4NHhNNkp3Tk5sM2ZJVnJq?=
 =?utf-8?B?YSthYkExZHhiUy8ySmxwQy9GZkpJK2ZpTU1QR1BzZk5jbFRGd2NQNzlwWGlM?=
 =?utf-8?B?M3lRckpCZmFiUnEySkpnTHhNZnQwc01iUmlsUS9hSHJ5THpoWEhmRWUwSWpU?=
 =?utf-8?B?b3RWZGZzaEpoejErZjVVczNTTmdxbXM4RXFYWlZDT3ppaXgxTk5ST0ZUS21K?=
 =?utf-8?B?NWJzczNPeEVaZHQ4STM2cVdwdHlKZXkzaS91VUd6MC9pcytsQldnZDhscHg5?=
 =?utf-8?B?dGFEREpFMFRYeEViQzhCOTI3c0oyb0cxaVd3eXZSaTNpdnRrcjNOWDFQQjJN?=
 =?utf-8?B?K3hyQm5wRzg2aEtLV2FaZUF1WGZseEpZZjFvQkFhWEdWZkJWemR3NENDNmNH?=
 =?utf-8?B?aEZ2U1k0d1ltK216QlBkVUFhS2FpRWlSNEpYcGRqbGE0LzVtU2tuY1JWd0Jo?=
 =?utf-8?B?bTVIWllJWEl4WkJkSEdVcUJITmZhb0szR3FnY0ZYVnZQb0piaHRpaFFTOTVp?=
 =?utf-8?B?MXMxVSsrNC9VTHgyZThid3pTaU0xWkVwN3BPa2xob0x5VW5adGFQaGdCSzg4?=
 =?utf-8?B?c2VDTWIzeUpMSjFBUDZaL3BEaHFLVFBDZG96bFNhODF3amh6ZHJ0eWZxTjFa?=
 =?utf-8?B?V0lFVmNXU2RBTGtKSWxRQ0ZzRWZJQTNqQi9iTStOazBqWTFpbjVRWk1ZRUI0?=
 =?utf-8?B?VGtZSGoxQlBibnMwTm1ySGVKaGpRL0ZSb0dnUmdReG4rWjgxN2hoaWhicHFu?=
 =?utf-8?B?aVp4QXpKc3FWWVRjQU1WNXA2Q0g5Vi9zbXFvbmhGTUNnaDdMN0NaRUY3ZERX?=
 =?utf-8?B?OFFhUis1QU1zSkpyWVJWMGhLUTlzZTB6bHJkMmRhWHRTcFZ1NTlZcDczTEx0?=
 =?utf-8?B?N2Z3UnhEcVJPYU0weVIwdmZSRU9tSzdWMVJuSmxxek9XaWc5WldCRDFESDd6?=
 =?utf-8?B?YVJNK2VEVlhYcVhIWU9SKzgxMzZVWVpnVjNOKzV1QitLUWhzZ2JTTTd3dEI3?=
 =?utf-8?B?cE8rbVgxTDRwN1BYTHRhdXB0TSticDUxMHQyQndGdE1WVk5FTzlWQVROK2tm?=
 =?utf-8?B?WmtVYWo3Y0t0OUxpdEdqRG1ENWdidmRkb29GWWZUVG5wVndUUUNXTzJ0dGpu?=
 =?utf-8?B?RGo5b1REbG5WNE4xTWZ4aWpJOUdHSmtONVdaVDlHUk1iNzJwWjByS1ZZVVVK?=
 =?utf-8?B?cTBHUE01ZDNNbzVOZTAwQlAwZmNidTMwUUtzWGMvR3k4cXhycHRyQ1oyQWNS?=
 =?utf-8?B?Q205QmxwZjJsV0xweGRiR2hrSmNOV2lINUIwdEdqR3BJQUh3S0VyMWJLcW00?=
 =?utf-8?B?bmxUT2xkbGJjdVNtMUVZODlBSVBmaC9PazhGSjBVbTFjK24rU1owYVI5ZGZr?=
 =?utf-8?B?QjJtYmY0NWpkU1FpRkxLb2xHSkcwQVc1NU1BdCtxa3JoSFZjVmN2bHYrTVVC?=
 =?utf-8?B?VHlxWVhHdUZxbDd1VjN4K1d6T0NxL2pOQzl2SE9YYWFTd3NzaE1LN0dZOWtn?=
 =?utf-8?B?ZWYzV3hSWG5FSkVvVGVBVHMzcXQyR2Fkb1htR3EwUWl2SFZNRDlWb2x3MnR5?=
 =?utf-8?B?OVBjSmg2bG5wbjJKazllREttaTJXMTdhRzVzSTdXMWo3alBsd2FvWkpVVDdv?=
 =?utf-8?B?VDlzNVdobTFxZTRhY3ArSnlydTRlYU9wdHN5RllVbXV4MTFIdXBSQ2JOZERC?=
 =?utf-8?B?WXU1c1JTN2hGYmJJbXhSeUk2MVVHa2N4dU1NQ1h1WUdZSmQwT1ZXQTN2ci9p?=
 =?utf-8?B?UmZkSGd5Kyt2OUdXeG10NHlaQlhWZWNKejdTVnhkVlM2aTl1NkM0aHpUUEQy?=
 =?utf-8?B?M2RpOWdEVndCL3QvbSt6aXpJdkVqV0pkeTFvay9semx2UVF2WjZWVUloWW8w?=
 =?utf-8?B?QThUMWFQK0JWYmZhbUpVRGtCU0VUNzFZR2tIQzcrdnkzaHFoSEdGZUpNU3pZ?=
 =?utf-8?B?T1NnRHo1RkJvNFNkbEd0bUpaYkp6bmNyYkNDa0ZidWJzZ2FjSi95NVlRb3R1?=
 =?utf-8?B?TUVIUCswNWQzb2ZkRlpVcHdVa1VmT29SN3g4M3ZQL2hoRkNmbzN2YUZDOHZR?=
 =?utf-8?B?eTlSTlIxb3N2SlRvTlRxTEZZemVJZi91NGMrUVdxMktaY1VLRkRueDVEdU9J?=
 =?utf-8?B?R1YzZktlQkc2R1dyN2ErZmhSK1Rva2tqL0l5ZkNZUE5lMnVFSnVyYm15YXJs?=
 =?utf-8?B?cWdHcm8xZDBYRjZkMnBDcWM0VjVzaTdXeW16ZGlmNXZqZitHNFpHMG9wTEhC?=
 =?utf-8?B?WWNVa2o1T1gwSHZJZW90VFpxTG04dG8wSFRWV0tQdkFrRkhjZ2tGcnBCWVJi?=
 =?utf-8?Q?CVxJNGuTcHEaNsUk=3D?=
X-Exchange-RoutingPolicyChecked: ua6u7he327Lp0SdNSDhShN7mzLh1UXIda5Q61TcuYlLhyuiviz+OttPt/3JBU7yzQ38aaEAnLYmylDCJJyud3JzBmf0DAoz001UhKSvEEK/AnjzX3fQFudIzHQc8fBmAFGiL2xE/qwntmaRLzf9qfpNhlCWOfe/Waz2cJEnb1m48ofCZ6HiJpJVP9tTLPRk+z18I1hVysEFhmcjuYIGYdcJEQhq9TrsJuzsv1/g+CVBUca/lhbT80AazTe7FLQBOYTvcM2taXGVuf/R3eaF7pIF/OZy6qDHzEAjkOAZP8igoZpW0EEZ/cPdaGtnveQQYoYos8Scd7Uk6g3ghWHP7eA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cced3a6-80c0-4ecf-cfae-08df0a61f519
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 08:53:15.1612 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /HULuUIesjjaZH3a7JZG0YLQuUhGbaNbNdOArm7zREuBueJcdTsTvAoDiajBcAekD4w3v/5B0t1lRH5/R/EV4yOpty7dLnJJh/q9obTbeII=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6057
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



On 04-09-2026 14:00, Matthew Brost wrote:
> On Fri, Sep 04, 2026 at 01:35:06PM +0530, Varun Gupta wrote:
>> During VM teardown, the VM's runtime PM reference is dropped
>> asynchronously, allowing the device to autosuspend while stale page
>> faults belonging to the now-dead VM are still queued. When the
>> page-fault worker later tries to ack one of these, it calls into
>> guc_ct_send_locked() on an already-suspended device, tripping:
>>
>>    Assertion `!xe_pm_runtime_suspended(xe)` failed!
>>    WARNING at xe_device.c:1267 xe_device_assert_mem_access+0x11c/0x140 [xe]
>>
>> A live VM/exec queue always holds a PM reference while it has
>> outstanding work, so if the device is suspended at ack time, the
>> owning context is already gone and the fault is stale.
>>
>> Take a runtime PM reference across the entire page-fault ack batch
>> preventing mid-batch suspends.
>>
>> v2:
>>   - Hold PM ref across the entire batch (begin/end) instead of per-ack.
>>     This prevents the device from autosuspending mid-batch, which would
>>     leave write_only acks written but the end flush skipped, and skip
>>     counter++, desyncing the cadence check.(Himal)
>>   - Add a comment explaining stale faults.(Himal)
>>
> 
> I'd guard the entire page fault fault handler with PM a ref rather than
> the ack part.
> 
> e.g. At the very top of xe_pagefault_queue_work:
> 
> guard(xe_pm_runtime)(xe);

+1
> 
> Matt
> 
>> Fixes: f289f7807119 ("drm/xe: Add xe_guc_pagefault layer")
>> Reported-by: Szymon Markiewicz <szymon.markiewicz@intel.com>
>> Signed-off-by: Varun Gupta <varun.gupta@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_pagefault.c | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pagefault.c b/drivers/gpu/drm/xe/xe_guc_pagefault.c
>> index 8f8210a732e9..9c9cd6e056fb 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pagefault.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_pagefault.c
>> @@ -9,12 +9,21 @@
>>   #include "xe_guc_pagefault.h"
>>   #include "xe_pagefault.h"
>>   #include "xe_pagefault_types.h"
>> +#include "xe_pm.h"
>>   
>>   #define XE_GUC_PAGEFAULT_FLUSH_PERIOD	BIT(4)	/* Sixteen */
>>   
>>   static void guc_ack_fault_begin(void *private)
>>   {
>>   	struct xe_guc *guc = private;
>> +	struct xe_device *xe = guc_to_xe(guc);
>> +
>> +	/*
>> +	 * Live VMs hold a PM ref, so faults during suspend are stale.
>> +	 * Hold a PM ref across the entire batch to safely drain them
>> +	 * and prevent mid-batch autosuspend from desyncing CT flushes.
>> +	 */
>> +	xe_pm_runtime_get(xe);
>>   
>>   	xe_guc_ct_lock(&guc->ct);
>>   
>> @@ -62,10 +71,13 @@ static void guc_ack_fault(struct xe_pagefault *pf, int err)
>>   static void guc_ack_fault_end(void *private)
>>   {
>>   	struct xe_guc *guc = private;
>> +	struct xe_device *xe = guc_to_xe(guc);
>>   
>>   	if ((guc->pagefault_ack_counter & (XE_GUC_PAGEFAULT_FLUSH_PERIOD - 1)) != 1)
>>   		xe_guc_ct_send_flush(&guc->ct);
>>   	xe_guc_ct_unlock(&guc->ct);
>> +
>> +	xe_pm_runtime_put(xe);
>>   }
>>   
>>   static const struct xe_pagefault_ops guc_pagefault_ops = {
>> -- 
>> 2.43.0
>>

