Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D424C3DA64
	for <intel-xe@archiver.kernel.org>; Tue,  6 Aug 2024 11:59:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07FFE10E0A2;
	Tue,  6 Aug 2024 11:59:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="axZxorm5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B327D10E037
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Aug 2024 11:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722945563; x=1754481563;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xGCKFAvFmcWqX/9o4u84yM66WExpn0ksRgV7SO7T3Ho=;
 b=axZxorm5LX+eypqHX2uzlHlAvOZcoqFbGq8a9ytJMCICTwfN/4aqOHZO
 u4sKWMf+5qo2GLNhIMnNDiwEvTLSdQxRMpyum8Hov91M8Qyix+3fk4Ymk
 SdIkAL/rZ4Q8hXfQDU/4sTQ7j0Fm9iybSejq4uRKoKafV68u/h8BnD+1a
 tRmihJMfFyEnuG+0bhdHhIgWrQuptkpt9vYj3lppWuV6C2rF2Adk8oZyJ
 muG2u+95QDzlVSotDyQLMs5cbUrpNZSiae5UcxifndeRTblHxKb8goeq5
 I+bvgXtpiGwSczpc5wE8RykO9WLHa+XLCDuN+gzRqcr/y7s1ZpW6z0tR9 Q==;
X-CSE-ConnectionGUID: wM4bJhMDTnuqJ68HmbV2mQ==
X-CSE-MsgGUID: /hnfnITUSyiW00fcp+55Qw==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="20532865"
X-IronPort-AV: E=Sophos;i="6.09,267,1716274800"; d="scan'208";a="20532865"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2024 04:59:22 -0700
X-CSE-ConnectionGUID: qbe+MvvmQHqXSsc51l/9Nw==
X-CSE-MsgGUID: ilWUdMRfTPGamvodR86rhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,267,1716274800"; d="scan'208";a="79751758"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Aug 2024 04:59:21 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 6 Aug 2024 04:59:21 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 6 Aug 2024 04:59:21 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 6 Aug 2024 04:59:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kvoppWQ0e+aNR+FzLhjwKG87BMk7vwR5TRenPvRKsGF4/rxJlMhLmnqgugxYitP6NhbHcme9JVtrkboGvAP61YatjL7Yt4Zxuy74y/EAKkYkv0XNLqWcF6ZTF1+pI820FKF+wffn3Rd0CaLKfaB3gfztDCUNU3EwrqUshy56lQnNSZYbJLUDKaxA0XW3A2CuENp0oM80AxLyFnv7PicSzwh9oZPNZ0mXCvarYNRc4dsoIYEveIW3n9Q7fILRrIqA167uA+3Mq6kHk1ktlUAKWOYixxto6ThntEZmqkQ3M6DTHTcpD2Pc9oTbqD3uKBVdupgHj/njLjE6A+ALH4KvQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rq/tB/4/4UtHIlerHi6l7sATnCnpHDytu2NL1pD3x4M=;
 b=cvcgaHhS4Xaerk9IwisVIN816ni5jz69gW8I//4ErpMCB+fD0TBJ87fH8POSOoDETNrCn7vwaOnVNzruZ9PtO6Ea5CqGAI3UKxixwaQzhX+YJlVoHdl/WKpe485OSRWosJ1lMEeqqEYmRiBFKWthcGP3AwM5/Sdh6lKjpnt/bZ9M8WG2wFi/nwf7Ue9eyHh5tzSFBHrymM+KM+UcFrfcp/sjh4uS3c/HLBsbMdp+oYfq6yYw4TVhNWrMtjCU5msavdLVqK1Z+JfBh1rXuq0GMK3Y1H8CHh2wMPdThNiBX7hQbU24ONy0/GukhQuKcaAtF0FGGRNpARNNwDw/F9PX4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by CY8PR11MB7268.namprd11.prod.outlook.com (2603:10b6:930:9b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Tue, 6 Aug
 2024 11:59:13 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%3]) with mapi id 15.20.7828.023; Tue, 6 Aug 2024
 11:59:13 +0000
Message-ID: <b57ef7fc-999e-4622-bdef-5cf6c1ca3391@intel.com>
Date: Tue, 6 Aug 2024 17:29:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] drm/xe/xe_gt_idle: add debugfs entry for
 powergating info
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <vinay.belgaumkar@intel.com>,
 <matthew.d.roper@intel.com>
References: <20240801095305.1209046-1-riana.tauro@intel.com>
 <20240801095305.1209046-3-riana.tauro@intel.com>
 <8f3bb44d-fdd7-45ae-8b46-2a41fb5ed45d@intel.com>
 <bd7dfd17-0052-4176-8977-5b2b3bacbfad@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <bd7dfd17-0052-4176-8977-5b2b3bacbfad@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0109.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::8) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|CY8PR11MB7268:EE_
X-MS-Office365-Filtering-Correlation-Id: afe254b7-62b7-474d-a4d0-08dcb60f3055
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dFZMbHd5WW1TR29nNmdSc0hXc0ZLWjM2YnA5a0pJbU02TlJ1SDZ5OFBMVjFr?=
 =?utf-8?B?c3M4bTRyUjBFci9Nb0tYWHByY0hqRmIvSU56eDJldVhpQkYydTFCb2VZamF6?=
 =?utf-8?B?QUFYVFQ3aDJzWkJ5eSsxWk5QancwOC9iYzI1a0hmSWdONWw0QTN6cGw3TFVv?=
 =?utf-8?B?TGI5TzVzMGJLc3J6UkhiSW51N29ycmdGZW1QS2JOdWRJaG4xV2NwZG1aQmRw?=
 =?utf-8?B?RU5MQXBoWFRsNHE3SUxYcWIzTlNpbG12MnRyVWNkaEFUbDdCZkRNbjJkSTRh?=
 =?utf-8?B?QVU0QitwZDVubmZjWk1Vcm9LNHBNM3diZFpZallmNXNCS1ovVk9sRjUvbU40?=
 =?utf-8?B?d3phd3V0VlJSQkZNbUdaMytUL0sxSklGbnI2UXhoN1FPNGNEb0lCMnRsYTMv?=
 =?utf-8?B?VWkwM3cyNFQ0OU5URG1YdFZhMktuVk50ZjFibDNHR2o3MDYzbWRTM1Jpa2VC?=
 =?utf-8?B?QVl0OHhQcUVjc1YyZUlXbDlwb25kWmwvR2RGWXZkYVZPczg4bllTaWZwck0x?=
 =?utf-8?B?NDRiR0NjSzdPVkFtTE1nTG8rdCs3ZzVzWEtYb2xLNjNvNEtFSUcybDdkUUlF?=
 =?utf-8?B?NytlZ2lrRjhFM2p1aUYxZnZnZXIySXhkVHorVFhqQWM1UmUybmdJdU0vRXQ3?=
 =?utf-8?B?a0ZtallpMHl5ZGhDZjhUQ0tCMUI5eEd2Zmp2M0hLVTBEL1l5KzNoYnFpZ1JY?=
 =?utf-8?B?QmtaUnNicHlwMTVtWlZnellUVVRXdWdEUWJDOGFQL1BnODdRMGg5WFlvbFZs?=
 =?utf-8?B?R2h1cm9SQWVTYVg1cDlMdlhhZUJMRVg5ZzNreDcvcGo4SWdKTmg1d0V0VHh4?=
 =?utf-8?B?YWMrTi9xUi9KYTFWVTBTSUdYNnU5YVdQcGxLd1Vpb1BDMHE3VW4zUk4rMFJ2?=
 =?utf-8?B?UGNoOTQrYnBmZjlOalFoOXhLN1lBVzBzZHpLT2ZJdVZFb21UUzVDOFJocG5j?=
 =?utf-8?B?TXBPU1BVMzFFc1FUbXpRQWJzRnF6b2JKUVJGN29HNEY2dWtuWk5INWd3ajlt?=
 =?utf-8?B?QlNJNC9JTWNkK3RsbzlkNkIxSXYzZXNlczRjTFBlR1EvQUp2R0hnN1VtZWFX?=
 =?utf-8?B?S2dITDZJQjdEWmtRMWp5VkIzaTNVZjhGNXk0MFJBQUQvWTJRbW42eUtVaHBR?=
 =?utf-8?B?dGt1NS9nOFRJQXp2OHYvcTJSZU80SDI4elN1TEZIQmE0TFdiNUh5SHE3Mnh3?=
 =?utf-8?B?RHJ3dEFadW00bnJ5dlI4bGZPWDkyb1hmKytlS1lCV3V2MlpvU3FZRmhvSkc1?=
 =?utf-8?B?YW04dHBXZFRJV01oV050UTcxQVpjZGhSS3pXakJ3dlRxTzNiTUlwNUtGZ09F?=
 =?utf-8?B?RDFxMHVld05uQkhUQ0p3Z0VMN09Db3dxMmNYRW9zMW4wUEJXYjBkMkxDWU14?=
 =?utf-8?B?R1UvMXdCRWwyemdoVzFwejVwQ2E2SlU1SXB6M3RjcWdyT05ocHZYVU1BdDFL?=
 =?utf-8?B?RVBvQU92VWpqWTBzVVIwUXpBRmZYekZRSmd0VkpOOFJiNC92OUIva29sZUJQ?=
 =?utf-8?B?MVRmSk8vNDNzQ1phRldrYW5vTlRNeEpGNmxjTDlEeThEdnpLSWxFL3Q0VVJL?=
 =?utf-8?B?ZUNtaWZ6TnhQZ0RBdjB3NmNvN3Z3V3cxejV5M05OSUhRT0Mrckc4YzhMWWFU?=
 =?utf-8?B?Njc0dURjVGxXQjM4MlJJNExnYlRnV0hYVE9YUTgzeVNrMWdJa2RCV2dFWlJJ?=
 =?utf-8?B?QUVGMFhzM01aTTJOaFR2ZTNRcDkxZVJEamczZUxvT1pTZjd3dXYyS0xESFdG?=
 =?utf-8?Q?uMt5hUnxh7m3XHJNpc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXZHZkFyeHNmSlN6Ky85S0Jobnd3RlY5d0toVjlMS3VLNkYzdkFhQkkxN1ZP?=
 =?utf-8?B?Z3pva3ZpcEFDeE8zdmRINjJrTytVS244b3N0NDlUUFdZZDc1VjN4TDJxak9r?=
 =?utf-8?B?aVJmQmNxc2lMandKVUVsK3l1UTg1ZGpOYWhxUXE1NlB4SlNaZDFhY3RoZ3hN?=
 =?utf-8?B?b1ROV0JjU3pFVm9POWszbTdrTjkzNm1kNExDVVA1czFRbGZTWGVySjcyV3dO?=
 =?utf-8?B?bzBQTVplaW1uVUYyZ0ROQW5SaGw5V25Ca2pjNkxxcnI2clI0VU9mYmpnNU1v?=
 =?utf-8?B?d2c3U2gzN3NjOFBjUjMzM0VoNHF6eUNMYy9zYlplSHArWHI2NmorN3FQYlFj?=
 =?utf-8?B?ejJsMkdtaG5sM0pNK1h2YnU0MnNTbGJkaTNQUEpQWUFtK2NWQ0N2UnU2b1JW?=
 =?utf-8?B?bkNQUERVN0UxaDh4NUg1SUhlSzNvTEVaY1hNVzlzU0ZhOFBFY213OTlZbkNw?=
 =?utf-8?B?OEd4WjBDOWJ0emo0RXJYZUlJaXJKSVdCZTRHVEx1QVA4UjlxUll6aG9CMENF?=
 =?utf-8?B?aGJtV2orSkdXWEFjOVhqWkVHWHhHZktwZjhlYi9ya2owakpFKy9UOWJDOVpk?=
 =?utf-8?B?U204aFhyQUtLeDdKRTFacE5NWkp5eWtkQXQ3ejc1M2s0T01CVGFrMFVRTGxB?=
 =?utf-8?B?V29ZalFiWjZvUW5OeG5nSzM4YlM1NmFMMFI3UkZ3OWVDY0lzVXJYR3R2eXRt?=
 =?utf-8?B?VWZ4bWFzd3hTd0hSdms0Z2JsMDdBVmNhTEJid0dqckxPTlUrSGJmUzdhblZG?=
 =?utf-8?B?UG5ZdGVueG5IN0Z4bFJOam04NXRNRE5wNkVuNC9JL0d5NlNwcWlndmRkanBh?=
 =?utf-8?B?c2YrZ1lxZS9YZ25naUNXTGowUi9jQmFBM3B0VEYwdEpMQVU5aU4yQ0tWY2Zn?=
 =?utf-8?B?ZTQrbWp0MnNtNEs5NVlKQXp1SFdMcDkyQkJiNVRvK1I1ZFlkUm1MaWY5RUdW?=
 =?utf-8?B?QnhBOFArRnExUEpVM3hEdWFrVGpDZjZVZ0N1Um1PS1FFeXZRVXlXcm03QWoz?=
 =?utf-8?B?YzlOcW9SbS9jNDRxYUNVbFBIVjY4emhhTHByaW4zaUlHYmhxYUk4ZTRsQmY5?=
 =?utf-8?B?aFR4YjN2TFhFUC8rZDNIYS9vbmZPcjVIYXAyVkRJV2R2Zm5iR3V2dnFHakM3?=
 =?utf-8?B?eWFZbjFwTWhFWlJVL1FlTGdGOUd1OXJ0QzdCTXd5YmxVRmdNbnR2UEFHbUhW?=
 =?utf-8?B?ZG9mcmZFcWVacC9pWHJFT2FsUDFjL0RpRkQzR3N2MDVhcjFpTHRXSStxUGZF?=
 =?utf-8?B?Z1ZsWVlsVDZVSmNwR0lUS2dMWFEwdEoyQWZWd01jeVJkbmEyQmtUaDRxTHJ5?=
 =?utf-8?B?MnN3U0VUZkpqeWdhREs3dkYwTkdWWmVRckkzWmJFV1g1dXNNa2FaME8wWTY4?=
 =?utf-8?B?RlJhNkNwaFIySEEzaGErZFVadVYrcjJCVnpOS0VhN0RSaFN5Tk1GUEpreGxj?=
 =?utf-8?B?OGsrZDFvRkRNNUVJNWZ6aHNud3NveWVMaG1MRTJDQTg2SWp3UGYrZGtSRk42?=
 =?utf-8?B?TGhQdXZjK2orZHF6QTFRWWM3bXNQSWFMWENhR3JIaGdXTVZUZWhOS2FqUGlU?=
 =?utf-8?B?amZWWE9aL3dtakgxK3Y5b2k0TjVYazV5S2twK280R1J3b0xNMHFsRERxSGhl?=
 =?utf-8?B?S0RBaGtnbkc5T2pnTzRLeTJKc3R3YXpiWjZkSW05NkQ4dStQWmJ0V3pyQ0lN?=
 =?utf-8?B?OTlDcVphdU5qOTllQkhqVHM0TGJIQ0hJUlVHZTJsSzRRUE9YUU1kREtieUlR?=
 =?utf-8?B?TFFrS1UyUzVGTHMzRmt5SG5LcktWTG55WVE5RXZ3V05haDNuZnozem9adVI2?=
 =?utf-8?B?NkdCTjcwby9JR2NjR0FZc1BWTDYxbUNhRnhUZXhoR0p6S0FpYWY0TjQ0REt2?=
 =?utf-8?B?Tmd5ZU5zSk11Yk15QkdyTTZWcUZ1V2RSMkJMYlI0TDZyNk5MRGF2VklxWmo2?=
 =?utf-8?B?dzF3dHY3UThIU3U1eG1Ydm5ZWTVDSzE1dTJaemtTNXE0dW5kQ0wyZFBxcTNP?=
 =?utf-8?B?amtQSWMrN2F2WTJ4U25LY0VoejROY1lPRUhkQXMrMmFWckJOOW5lT2o5Wm43?=
 =?utf-8?B?cDgxUUxBMTJ4ek82VWdoNXVGVFN6SlE5SUxiWVNrOWVVNTBTSTg2MnY2TXgy?=
 =?utf-8?B?bDUzWm1IRkN3UkhBR2JzMUZsOHdLa0s0QzFKdWFnQVV4TFVHdnNoN2ZFK0FR?=
 =?utf-8?B?MkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: afe254b7-62b7-474d-a4d0-08dcb60f3055
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2024 11:59:13.4659 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kyhh7ZLX0K9UevQcqneZqTtQfTaiQy2tZYUOev1C8n7C8IEnsDA6lBFHQw5ds4EF9lJmx3N4iZz7jo0LLv2yUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7268
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



On 01-08-2024 18:46, Riana Tauro wrote:
> 
> 
> On 8/1/2024 3:33 PM, Nilawar, Badal wrote:
>>
>>
>> On 01-08-2024 15:23, Riana Tauro wrote:
>>> Coarse Powergating is a power saving technique where Render and Media
>>> can be power-gated independently irrespective of the rest of the GT.
>>>
>>> For debug purposes, it is useful to expose the powergating information.
>>>
>>> v2: move to debugfs
>>>      add details to commit message
>>>      add per-slice status for media
>>>      define reg bits in descending order (Matt Roper)
>>>
>>> v3: fix return statement
>>>      fix kernel-doc
>>>      use loop for media slices
>>>      use helper function for status (Michal)
>>>
>>> v4: add pg prefix
>>>      do not wake GT if in C6 (Badal)
>>>
>>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/regs/xe_gt_regs.h |  8 +++
>>>   drivers/gpu/drm/xe/xe_gt_debugfs.c   | 13 ++++
>>>   drivers/gpu/drm/xe/xe_gt_idle.c      | 91 ++++++++++++++++++++++++++++
>>>   drivers/gpu/drm/xe/xe_gt_idle.h      |  2 +
>>>   4 files changed, 114 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h 
>>> b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>> index 3b87f95f9ecf..279d862c306a 100644
>>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>> @@ -337,6 +337,14 @@
>>>   #define   CTC_SOURCE_DIVIDE_LOGIC        REG_BIT(0)
>>>   #define FORCEWAKE_RENDER            XE_REG(0xa278)
>>> +
>>> +#define POWERGATE_DOMAIN_STATUS            XE_REG(0xa2a0)
>>> +#define   MEDIA_SLICE3_AWAKE_STATUS        REG_BIT(4)
>>> +#define   MEDIA_SLICE2_AWAKE_STATUS        REG_BIT(3)
>>> +#define   MEDIA_SLICE1_AWAKE_STATUS        REG_BIT(2)
>>> +#define   RENDER_AWAKE_STATUS            REG_BIT(1)
>>> +#define   MEDIA_SLICE0_AWAKE_STATUS        REG_BIT(0)
>>> +
>>>   #define FORCEWAKE_MEDIA_VDBOX(n)        XE_REG(0xa540 + (n) * 4)
>>>   #define FORCEWAKE_MEDIA_VEBOX(n)        XE_REG(0xa560 + (n) * 4)
>>>   #define FORCEWAKE_GSC                XE_REG(0xa618)
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c 
>>> b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>>> index 5e7fd937917a..47e3a1ca2394 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
>>> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>>> @@ -15,6 +15,7 @@
>>>   #include "xe_ggtt.h"
>>>   #include "xe_gt.h"
>>>   #include "xe_gt_mcr.h"
>>> +#include "xe_gt_idle.h"
>>>   #include "xe_gt_sriov_pf_debugfs.h"
>>>   #include "xe_gt_sriov_vf_debugfs.h"
>>>   #include "xe_gt_topology.h"
>>> @@ -107,6 +108,17 @@ static int hw_engines(struct xe_gt *gt, struct 
>>> drm_printer *p)
>>>       return 0;
>>>   }
>>> +static int powergate_info(struct xe_gt *gt, struct drm_printer *p)
>>> +{
>>> +    int ret;
>>> +
>>> +    xe_pm_runtime_get(gt_to_xe(gt));
>> In suspend resume path I am seeing PG disabled and enabled. Will it 
>> cause any race while this debugfs entry is being exercised?
> 
> I checked the suspend cases and the enable_pg is called before the 
> print.  
Ok.
But there might be a case where we check the idle_status and see
>   C6 but before dumping it might be in C0, reporting wrong status
Yes this can happen. The commit message indicates that the intention is 
to view the PG status regardless of the GT status. Therefore, it doesn’t 
make sense to force wake the GT when it is in C6.
However, if you believe we should always wake the GT regardless of its 
state to check the PG status feel free to do that change and rephrase 
the commit message accordingly.

Regards,
Badal
> 
>>> +    ret = xe_gt_idle_pg_print(gt, p);
>>> +    xe_pm_runtime_put(gt_to_xe(gt));
>>> +
>>> +    return ret;
>>> +}
>>> +
>>>   static int force_reset(struct xe_gt *gt, struct drm_printer *p)
>>>   {
>>>       xe_pm_runtime_get(gt_to_xe(gt));
>>> @@ -277,6 +289,7 @@ static const struct drm_info_list debugfs_list[] = {
>>>       {"topology", .show = xe_gt_debugfs_simple_show, .data = topology},
>>>       {"steering", .show = xe_gt_debugfs_simple_show, .data = steering},
>>>       {"ggtt", .show = xe_gt_debugfs_simple_show, .data = ggtt},
>>> +    {"powergate_info", .show = xe_gt_debugfs_simple_show, .data = 
>>> powergate_info},
>>>       {"register-save-restore", .show = xe_gt_debugfs_simple_show, 
>>> .data = register_save_restore},
>>>       {"workarounds", .show = xe_gt_debugfs_simple_show, .data = 
>>> workarounds},
>>>       {"pat", .show = xe_gt_debugfs_simple_show, .data = pat},
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c 
>>> b/drivers/gpu/drm/xe/xe_gt_idle.c
>>> index 7188542aea43..2ab0eaafa7d7 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
>>> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
>>> @@ -53,6 +53,11 @@ pc_to_xe(struct xe_guc_pc *pc)
>>>       return gt_to_xe(gt);
>>>   }
>>> +static inline const char *str_up_down(bool v)
>>> +{
>>> +    return v ? "up" : "down";
>>> +}
>>> +
>>>   static const char *gt_idle_state_to_string(enum xe_gt_idle_state 
>>> state)
>>>   {
>>>       switch (state) {
>>> @@ -147,6 +152,92 @@ void xe_gt_idle_disable_pg(struct xe_gt *gt)
>>>       XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
>>>   }
>>> +/**
>>> + * xe_gt_idle_pg_print - Xe powergating info
>>> + * @gt: GT object
>>> + * @p: drm_printer.
>>> + *
>>> + * This function prints the powergating information
>>> + *
>>> + * Return: 0 on success, negative error code otherwise
>>> + */
>>> +int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p)
>>> +{
>>> +    struct xe_gt_idle *gtidle = &gt->gtidle;
>>> +    struct xe_device *xe = gt_to_xe(gt);
>>> +    enum xe_gt_idle_state state;
>>> +    u32 pg_enabled, pg_status = 0;
>>> +    u32 vcs_mask, vecs_mask;
>>> +    int err, n;
>>> +    /*
>>> +     * Media Slices
>>> +     *
>>> +     * Slice 0: VCS0, VCS1, VECS0
>>> +     * Slice 1: VCS2, VCS3, VECS1
>>> +     * Slice 2: VCS4, VCS5, VECS2
>>> +     * Slice 3: VCS6, VCS7, VECS3
>>> +     */
>>> +    static const struct {
>>> +        u64 engines;
>>> +        u32 status_bit;
>>> +    } media_slices[] = {
>>> +        {(BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VCS1) |
>>> +          BIT(XE_HW_ENGINE_VECS0)), MEDIA_SLICE0_AWAKE_STATUS},
>>> +
>>> +        {(BIT(XE_HW_ENGINE_VCS2) | BIT(XE_HW_ENGINE_VCS3) |
>>> +           BIT(XE_HW_ENGINE_VECS1)), MEDIA_SLICE1_AWAKE_STATUS},
>>> +
>>> +        {(BIT(XE_HW_ENGINE_VCS4) | BIT(XE_HW_ENGINE_VCS5) |
>>> +           BIT(XE_HW_ENGINE_VECS2)), MEDIA_SLICE2_AWAKE_STATUS},
>>> +
>>> +        {(BIT(XE_HW_ENGINE_VCS6) | BIT(XE_HW_ENGINE_VCS7) |
>>> +           BIT(XE_HW_ENGINE_VECS3)), MEDIA_SLICE3_AWAKE_STATUS},
>>> +    };
>>> +
>>> +    if (xe->info.platform == XE_PVC) {
>>> +        drm_printf(p, "Power Gating not supported\n");
>>> +        return 0;
>>> +    }
>>> +
>>> +    state = gtidle->idle_status(gtidle_to_pc(gtidle));
>>> +    pg_enabled = gtidle->powergate_enable;
>>> +
>>> +    /* Do not wake the GT to read powergating status */
>>> +    if (state != GT_IDLE_C6) {
>> How about if (pg_enabled && state != GT_IDLE_C6) ?
> Always enabled so would be unnecessary check
If gt_resume fails the PG will not be reenabled.
>>> +        err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>>> +        if (err)
I still think we should do force_wake_put here.
Check the discussion here. 
https://patchwork.freedesktop.org/patch/596760/?series=134121&rev=4
>>> +            return err;
>>> +
>>> +        pg_enabled = xe_mmio_read32(gt, POWERGATE_ENABLE);
>> Is this needed?
> can remove this
Ok

Regards,
Badal
> 
> Thanks,
> Riana
>>
>> Regards,
>> Badal
>>> +        pg_status = xe_mmio_read32(gt, POWERGATE_DOMAIN_STATUS);
>>> +
>>> +        XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
>>> +    }
>>> +
>>> +    if (gt->info.engine_mask & XE_HW_ENGINE_RCS_MASK) {
>>> +        drm_printf(p, "Render Power Gating Enabled: %s\n",
>>> +               str_yes_no(pg_enabled & RENDER_POWERGATE_ENABLE));
>>> +
>>> +        drm_printf(p, "Render Power Gate Status: %s\n",
>>> +               str_up_down(pg_status & RENDER_AWAKE_STATUS));
>>> +    }
>>> +
>>> +    vcs_mask = xe_hw_engine_mask_per_class(gt, 
>>> XE_ENGINE_CLASS_VIDEO_DECODE);
>>> +    vecs_mask = xe_hw_engine_mask_per_class(gt, 
>>> XE_ENGINE_CLASS_VIDEO_ENHANCE);
>>> +
>>> +    /* Print media CPG status only if media is present */
>>> +    if (vcs_mask || vecs_mask) {
>>> +        drm_printf(p, "Media Power Gating Enabled: %s\n",
>>> +               str_yes_no(pg_enabled & MEDIA_POWERGATE_ENABLE));
>>> +
>>> +        for (n = 0; n < ARRAY_SIZE(media_slices); n++)
>>> +            if (gt->info.engine_mask & media_slices[n].engines)
>>> +                drm_printf(p, "Media Slice%d Power Gate Status: 
>>> %s\n", n,
>>> +                       str_up_down(pg_status & 
>>> media_slices[n].status_bit));
>>> +    }
>>> +    return 0;
>>> +}
>>> +
>>>   static ssize_t name_show(struct device *dev,
>>>                struct device_attribute *attr, char *buff)
>>>   {
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.h 
>>> b/drivers/gpu/drm/xe/xe_gt_idle.h
>>> index 554447b5d46d..4455a6501cb0 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_idle.h
>>> +++ b/drivers/gpu/drm/xe/xe_gt_idle.h
>>> @@ -8,6 +8,7 @@
>>>   #include "xe_gt_idle_types.h"
>>> +struct drm_printer;
>>>   struct xe_gt;
>>>   int xe_gt_idle_init(struct xe_gt_idle *gtidle);
>>> @@ -15,5 +16,6 @@ void xe_gt_idle_enable_c6(struct xe_gt *gt);
>>>   void xe_gt_idle_disable_c6(struct xe_gt *gt);
>>>   void xe_gt_idle_enable_pg(struct xe_gt *gt);
>>>   void xe_gt_idle_disable_pg(struct xe_gt *gt);
>>> +int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p);
>>>   #endif /* _XE_GT_IDLE_H_ */
