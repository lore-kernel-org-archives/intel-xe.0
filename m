Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36381C9830D
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 11:31:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2E9410E814;
	Fri, 25 Sep 2026 11:31:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K2aX6HsS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C795C10E58D
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Sep 2026 11:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790335915; x=1821871915;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=GqWbV2zvslO8vrXeduYb0UcUBEuDUWZ+X8T49oJ7ODk=;
 b=K2aX6HsSVj4imYEldw+G0uPXgigkl+LyiRPhXkz4oc62WNyfTSpuioUD
 IXBfKq5h0SX/c9imi5Dpj0LO1DcfrhfwdPOAr1hfVkbo+wOp+CD2SqZJV
 YrKI04SN54os0nFFidMJW0gxBY1cm7byLEc7VgzfK3G8m/s5WoJ6Vy3EV
 GK1sB+VWtL5pYn9qa6ALcsOeg1slnocoZ5ri47vW+xM1LZ00SwnhpTarS
 dnopogiP9BD3hrCqrP+GHHASPqmPBYQENHMAiV66vyIdl5g3vOcvP52FF
 NMm/1jKxsbujsfQyFwn08q/JrcE3LqQhlUiibZ3OilvXKRmSuLSuqIv06 g==;
X-CSE-ConnectionGUID: JjtM/V9NTCmHiQtap/p5UA==
X-CSE-MsgGUID: zDxL89i/RJCeD6vFrRsmMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="100452763"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; d="scan'208";a="100452763"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 04:31:55 -0700
X-CSE-ConnectionGUID: em6G/BSRQnqSuzOpMQS/+Q==
X-CSE-MsgGUID: Jj5+tSOyToe9AiQhV2b+fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; d="scan'208";a="277477739"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 04:31:55 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 04:31:55 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 25 Sep 2026 04:31:55 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.60) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 04:31:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xDnE6MqkeO0hKtpk/BAdnV3Qk9xtnZSA9AEdiA7LwoXW5UMXQlC8Vjz6z99EH8Wb1l8H9wgA9LT1T91m810a8XIb51bqRQuiZmobcRsJ8fn//ahraFnADlRKgLHMPE8NJPlo4g75qZJQThUI8VWKWQBR3LAWXNZeGRHUnJliwUdaAKZVWNN05guQFcdtwxD+iQoe9rH5ZGknNLbLS+8vZ99ZiRHHCbiz8zeus7SvdY1W8dTwYX6KFkKCWomDlosMoaIUEvBMRTmLCWMJ/jcbvWhM9131Gj852m/elzLv6j3Xp7yVjUdclr3HcZje0jzAUsLGMO+AYPPB9OMibLf5bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kwtWmX6IZxmFc/Z31ju/CKaPt/bTB88pbM7QwMl50QQ=;
 b=uRfD2V/HmgHsipEiVVMK4/euNJZX/R2HN1bTHi5NYGuqaf9VwprZm1VSa3Ecv/guSO282uKeKTkr77YAtWDyziXcMt5C6+F46xwLwHwK563PHRjKJbIw3sVr9xyNl9p8vEJ4RdHB1xUxaIwjT4hJEQ/QHfIKldp9reT7CgyMA2iQ7157vTUGOrYxSsx6teRgdxcFtO2CTZBmamO1uYW2DrfExmIZw1qDM20R/DbErjvBQKntlPMm+yLxmVAki5HBNXJVBhDtOChQFTRk3IalbsOmTW8uUMB9oiT6q49DirjSw/pbS86ZWuTKN84nyM8MEtvtrUL3XzmZ0zb49z4WyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by SA1PR11MB8425.namprd11.prod.outlook.com (2603:10b6:806:385::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.19; Fri, 25 Sep
 2026 11:29:52 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::ccc3:3fd6:58f5:927]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::ccc3:3fd6:58f5:927%6]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 11:29:52 +0000
Message-ID: <d3520883-84b4-4b83-b7d6-9951075961db@intel.com>
Date: Fri, 25 Sep 2026 16:59:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] drm/xe/guc: Split GuC ID manager into usable and
 shareable pools
To: <intel-xe@lists.freedesktop.org>
References: <20260827105750.1248792-1-piotr.piorkowski@intel.com>
 <20260827105750.1248792-2-piotr.piorkowski@intel.com>
Content-Language: en-US
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
In-Reply-To: <20260827105750.1248792-2-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI3PR02CA0013.apcprd02.prod.outlook.com
 (2603:1096:4:295::10) To LV3PR11MB8695.namprd11.prod.outlook.com
 (2603:10b6:408:211::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8695:EE_|SA1PR11MB8425:EE_
X-MS-Office365-Filtering-Correlation-Id: d5f2f496-9fec-4980-6f53-08df1af850b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|4143699003|6133799003|10067099003|56012099006|11063799006|5023799004|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: xIFdHUcippdJRQAW7ZyevnGiIV5GLsE5ogAi9H7uHZhIeNeVc2LU3r6aee6mGIkxNg6PA9wDT2sCqWSGy7pHYeJRfe7kmClHVu75U4zRPT3mcV9rYYpD8b2quUaZZnKMN1t5up0a4X04T0iqIT5yfkWj4JyQpQxTFXLHMuImkbOqzYmRjkCjvgJAMgZxOteUbJrPoUtS7D7wViM2R9s21azDxj+fVIag/ivmwzWryq+PwK+8mPYgyqrvHwSrwqyKcIxGANOh0XNtcfJ/VLM5MjsJhggnuooDWMGenivGsgz3VM64d26EsuEFrQjg7GAIuVb0hROLoHxnlLGh26NlAtLMB//rmYD0ER54FSynjOcOE9NdDGs5o5/GCqV2JNBmtNLdQQv2i5sjdVwVsUOcLrwItIB9bb6PJ1KQN1d4EFBB4NGpx49l9Z/P2I5mftNdGw9UZoLzw/diK+eKU3Dhve3GAfMILtZI71tUY2uDx90Ld2EZKyt0IcK3NjkweyMtwvazBdgGdah6yt3CSR/T4xHWStxCGkyg2Mp7yaI0chEt4+wC+Sdp8w7dNFKyNMMeH+LZaG9yXRfdCuc1GieJIGUdhAS1xQ0e4r5nPeYOhiJv/HI4yGFSuc8AoP71VYvDJXAHw+AXysmM1kmkeukqKOtzQgDiBOr1J0/4RMJHjT0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(4143699003)(6133799003)(10067099003)(56012099006)(11063799006)(5023799004)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QzVQTGNaeGlJaE5GTStqTklXRzNRTDVCb0diRDRKR0hmMmNPNUpkOFo0dFRv?=
 =?utf-8?B?TnJPRlRPNzNNR1VQOEVvMFNnQVE5dDhMYm5KY01jU3RsbU9nU2pYRFpHbjd3?=
 =?utf-8?B?c0lWRjlHUlgrSG1TNS8zNDlXditZVzVvWnNlVFhWNWJ3ZUZlOUdmWXkrME4v?=
 =?utf-8?B?bVQranlPSVI2OVJhZlJRc0lnN0RjakhqQk9GZW5OSGNPUTZJalFOTXo0ZHVG?=
 =?utf-8?B?NzZDbWxGcXpBdU9DUjZmclcvaThCS2xCRXpRd3hNZFVjRy9wbksvbjdubTJo?=
 =?utf-8?B?QXphMlJsdzRLN2tYWlJjZmVTRW9sMS9sYkpyQldyQ1AwRkpkdEk2czFaajhn?=
 =?utf-8?B?N29IWmlLV3g2d2pxV3czS3FjY29EQW0zNVo4MGpHOTQ4QVVqcHRFR3pKa3Zt?=
 =?utf-8?B?b0ZSU0x4VEw5WDljK1RkV1NHbkFLNmhucEh1aTZqSmk5SXNQNHh3WHhpS2Jo?=
 =?utf-8?B?ZHJ4U09nZjdHL2dJODFtQURmSlJpWi9UTGhyTHpOekFrMk53NVBDRzhML1ox?=
 =?utf-8?B?cDAwTVZzSW9JKy9VUXh3MUlwQXlzUDU4MVc5Rno5NkNyWGZPRy9yU2FGUmFJ?=
 =?utf-8?B?cE5JUTMrMW96OWRndnJDeGxYVkQ4YktEdkdudXJpL2xBMEt3dFdsTllSMVo4?=
 =?utf-8?B?OStqT0hCU25BQ1F1NVJHc05HbzZzUmxTZlJMdC8xbWoyeDZUNlVkUEhpTE1k?=
 =?utf-8?B?RG9zZlRKRWNmU2JjaFM1dlpFNTlvcnFIVkNBLzlBcjcyTDRGbS9mUm1Gc3Vm?=
 =?utf-8?B?Z0hIMkEvUGtTd2dwZ0l4TEh6ZW9mQ2xUOWtSMS91ZXBxeDBOUEJLQlhLYkhE?=
 =?utf-8?B?ODRoaEZxdmszT3ZlTmtuZFRyOCtaVWVjYkUzRWJwaGJ6cWM2YW43am9jTVV4?=
 =?utf-8?B?QlFuY3BEWm80TXdzeEU2YnZxem5Dc0NzZ2RhM3M1YlBoQ3dNNkhkZks0djFu?=
 =?utf-8?B?bFlOZVR1YUpVUjRNZklvRVBCTXZGQ0p5UTdGQkdWd254c1k4SnpsWHpRTkkv?=
 =?utf-8?B?c2pHMHZzQlVpdG5wZlJ3MjJDK1Y1Q0VDSWJ0TEJLNmVOdTlXTWtOTnVqZEJz?=
 =?utf-8?B?YjhsL0UxdnRSTkhBTHdUeHJQZFY1MklaOEpJY3JZTlN6OFVSRXRSeWU3cE95?=
 =?utf-8?B?bWRRSllXRy9RS3VpRTlyVzZpdVFKenFXSkVoSWhHbVk4YjdGb2dQL3pSTGhP?=
 =?utf-8?B?WnRLNGNMNEthUS9IRlBGQkNvWXRXb2JncjdkUTRiWWpmOTVKR1B0Smk0M3R3?=
 =?utf-8?B?Nm9ielhOYVVyRHBtekk1Q1B0Ry9MQldKazY0Q3k5WVBIeW1vTWtJcGd2bUhR?=
 =?utf-8?B?VWxCdUdpcFRFekw3MEFiWkQzbndlL1FKWlJ6STdXSCs5eVAzRmxEbnB2bjZ4?=
 =?utf-8?B?SlhlSVB0YUd2ditxem9LYXh6aEc0YktnMHpPL3ZPNGJiRXV1ejlEWHhhYUVN?=
 =?utf-8?B?Q2oySGFnVTVnUkhPRmN2azk0TjJPTjBQUEttODQ3SndDUDZVbHFzVkIyMUVz?=
 =?utf-8?B?T2Z4ek1UUFZOdWRCQXVkNmRRRW5GRzZueWdiYmNEMXFqbTlBaE5VVEl4dVJP?=
 =?utf-8?B?dlFRcjROV2pmQ2ZqdHB4YVRBcTBCRGNtY3dTU0Yyd0ZCSjV0aXk4ZHZIMFRT?=
 =?utf-8?B?OUF1dUhSZ0Vjblh4N2hqY0V2eFZlVmlVd2NmUlR5VGszK1ErRUhTZm1UN2VR?=
 =?utf-8?B?cUZac3YwbGlSM3pzeVptRFRpQmZXczBvMVh3bXJ4YmxXbHR0Tms2OHhjdmNB?=
 =?utf-8?B?NHZIYThwbDNhS2RwZU5QM0hXOW16L0hGRmlPTVgwdG1ORFdMYzMwcmQvOXFW?=
 =?utf-8?B?REdWVVRRSThjcTNpNFFHenA5ZDY5Z1QwMUhJR0VLWXRBdVlHUzQzRmxSeXRR?=
 =?utf-8?B?eHdKMXRMWGxqVU9VWWNRRHhpWXpzbWVWckYwNDhxSXdseExTUS9vRUpWRnUz?=
 =?utf-8?B?NGhkK05FblNxdlFOZjRjWEp2c2lPTW8wL3ZiMllKQmUxMnpnSjJXd1NxRjhO?=
 =?utf-8?B?bWZxSWtwOFR2UnVnRDh1TS9TbFVvYW45V2JXOXRDYmdhUUljaVNNdy9OYjUy?=
 =?utf-8?B?L2EvQjFoZEd4R0pnZXVWQVFnTFp5eXF2OGgxRDhkekJRcDVqZGtmZDI0a3N1?=
 =?utf-8?B?c2ZiSkVUa0VnbW1NVHozbWtKSE5kR3hQVzAxOEhxY1EwNmVOaWEzTmk5cXpa?=
 =?utf-8?B?RHVoa2xaNGlxcVR5N3BxNGFEL1M3KzJwalFSajRjMjZ3OENjRzIyTXUzTGly?=
 =?utf-8?B?aEV0MksvME1aU0M4SWxKWTRMaklwQk51ZENTcGpoUFJwMEFHdldUQVFmRHVW?=
 =?utf-8?B?c1BKTmdsTzdyVVRWZXBmTVplOUhYM0NLcktGUFFhcmkwaFVBcHNlMmx3WmQ5?=
 =?utf-8?Q?O2eLiXoQBj/nTW8k=3D?=
X-Exchange-RoutingPolicyChecked: lzO4jVWTo5MEKgTNSbUFTifwtNlb8/OYfIUuQR+G8xUtvf8ju9X9DdHISCK+NH/q9GkusDnXx2xYniP03lDLYgq5ROpvkvaAe9XCgP8b75TxNfpbfB370C1uobf5InU29GZSZMAEZE0TcKtO9qBbrnZLmOyYOwR5PWRi7laxnbuFZc9mTGDahaLAo6REmbcT/8+PaR+b/I9Ag0tu0vvaHm4VWlyFmOIn29vnmi41ieESg8yNcvOaMMwM/4+07l5AW0JVnirrOfFFaJ1z9onU5eivwBa4jTYQsBKfIX3wcMIDTDKJTAzBz7+sa7s/b2AKowqD6kEw2z+WDLTjf81cwQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: d5f2f496-9fec-4980-6f53-08df1af850b1
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 11:29:52.2178 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UUa7bC5fPw9zRT5d9nfyGHhPgD6NJQ9hxDL031WKF9K1mT7nFGT9/+9v8a0adgoNnCx4Ya1BRKQs0kCe+oP7GLireViWWwVOIMet3ee8XnE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8425
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


On 27-Aug-26 4:27 PM, Piórkowski, Piotr wrote:
> From: Piotr Piórkowski <piotr.piorkowski@intel.com>
>
> Modify the GuC identifier manager so that it distinguishes between
> usable GuC IDs allocated for GuC submissions, and shareable those that
> can be shared with VFs. Both pools are represented as a single bitmap
> and may overlap.
> Let's Replace the single-pool accounting model with separate usable and
> shareable pools, add helpers for pool accounting and limits, and update
> debug reporting.
>
> For now, let's keep the current allocation behaviour by mapping both pools
> onto the same GuC ID space. This prepares the ID manager for separate
> management of submission IDs and VF allocations in following changes.
>
> v2: Do not change how VF IDs are allocated in the legacy path (Sashiko)
>
> v3: Fix shareable spare quota accounting to include
>      PF-exclusive usable IDs.
>
> Assisted-by: Claude:claude-5-sonnet
> Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>   drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c |  57 +--
>   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |   2 +-
>   drivers/gpu/drm/xe/xe_guc_id_mgr.c            | 445 ++++++++++++++----
>   drivers/gpu/drm/xe/xe_guc_id_mgr.h            |  20 +-
>   drivers/gpu/drm/xe/xe_guc_types.h             |   8 +-
>   5 files changed, 410 insertions(+), 122 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
> index ee30a1939eb0..78d3de46b757 100644
> --- a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
> +++ b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
> @@ -24,8 +24,8 @@ static void bad_init(struct kunit *test)
>   {
>   	struct xe_guc_id_mgr *idm = test->priv;
>   
> -	KUNIT_EXPECT_EQ(test, -EINVAL, xe_guc_id_mgr_init(idm, 0));
> -	KUNIT_EXPECT_EQ(test, -ERANGE, xe_guc_id_mgr_init(idm, GUC_ID_MAX + 1));
> +	KUNIT_EXPECT_EQ(test, -EINVAL, idm_init(idm, 0, 0));
> +	KUNIT_EXPECT_EQ(test, -ERANGE, idm_init(idm, GUC_ID_MAX + 1, 0));
>   }
>   
>   static void no_init(struct kunit *test)
> @@ -43,12 +43,12 @@ static void init_fini(struct kunit *test)
>   {
>   	struct xe_guc_id_mgr *idm = test->priv;
>   
> -	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, -1));
> +	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, GUC_ID_MAX, 0));
>   	KUNIT_EXPECT_NOT_NULL(test, idm->bitmap);
> -	KUNIT_EXPECT_EQ(test, idm->total, GUC_ID_MAX);
> +	KUNIT_EXPECT_EQ(test, idm_total(idm), GUC_ID_MAX);
>   	__fini_idm(NULL, idm);
>   	KUNIT_EXPECT_NULL(test, idm->bitmap);
> -	KUNIT_EXPECT_EQ(test, idm->total, 0);
> +	KUNIT_EXPECT_EQ(test, idm_total(idm), 0);
>   }
>   
>   static void check_used(struct kunit *test)
> @@ -56,19 +56,19 @@ static void check_used(struct kunit *test)
>   	struct xe_guc_id_mgr *idm = test->priv;
>   	unsigned int n;
>   
> -	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, 2));
> +	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, 2, 0));
>   
>   	mutex_lock(idm_mutex(idm));
>   
> -	for (n = 0; n < idm->total; n++) {
> +	for (n = 0; n < idm_total(idm); n++) {
>   		kunit_info(test, "n=%u", n);
> -		KUNIT_EXPECT_EQ(test, idm->used, n);
> -		KUNIT_EXPECT_GE(test, idm_reserve_chunk_locked(idm, 1, 0), 0);
> -		KUNIT_EXPECT_EQ(test, idm->used, n + 1);
> +		KUNIT_EXPECT_EQ(test, bitmap_weight(idm->bitmap, idm_total(idm)), n);
> +		KUNIT_EXPECT_GE(test, xe_guc_id_mgr_reserve_usable_locked(idm, 1), 0);
> +		KUNIT_EXPECT_EQ(test, bitmap_weight(idm->bitmap, idm_total(idm)), n + 1);
>   	}
> -	KUNIT_EXPECT_EQ(test, idm->used, idm->total);
> -	idm_release_chunk_locked(idm, 0, idm->used);
> -	KUNIT_EXPECT_EQ(test, idm->used, 0);
> +	KUNIT_EXPECT_EQ(test, bitmap_weight(idm->bitmap, idm_total(idm)), idm_total(idm));
> +	idm_release_chunk_locked(idm, 0, idm_total(idm));
> +	KUNIT_EXPECT_EQ(test, bitmap_weight(idm->bitmap, idm_total(idm)), 0);
>   
>   	mutex_unlock(idm_mutex(idm));
>   }
> @@ -76,25 +76,12 @@ static void check_used(struct kunit *test)
>   static void check_quota(struct kunit *test)
>   {
>   	struct xe_guc_id_mgr *idm = test->priv;
> -	unsigned int n;
> -
> -	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, 2));
>   
> -	mutex_lock(idm_mutex(idm));
> +	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, 2, 0));
>   
> -	for (n = 0; n < idm->total - 1; n++) {
> -		kunit_info(test, "n=%u", n);
> -		KUNIT_EXPECT_EQ(test, idm_reserve_chunk_locked(idm, 1, idm->total), -EDQUOT);
> -		KUNIT_EXPECT_EQ(test, idm_reserve_chunk_locked(idm, 1, idm->total - n), -EDQUOT);
> -		KUNIT_EXPECT_EQ(test, idm_reserve_chunk_locked(idm, idm->total - n, 1), -EDQUOT);
> -		KUNIT_EXPECT_GE(test, idm_reserve_chunk_locked(idm, 1, 1), 0);
> -	}
> -	KUNIT_EXPECT_LE(test, 0, idm_reserve_chunk_locked(idm, 1, 0));
> -	KUNIT_EXPECT_EQ(test, idm->used, idm->total);
> -	idm_release_chunk_locked(idm, 0, idm->total);
> -	KUNIT_EXPECT_EQ(test, idm->used, 0);
> -
> -	mutex_unlock(idm_mutex(idm));
> +	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_usable(idm, 2), 0);
> +	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_usable(idm, 1), -ENOSPC);
> +	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_usable(idm, 0, 2), 0);
>   }
>   
>   static void check_all(struct kunit *test)
> @@ -102,14 +89,14 @@ static void check_all(struct kunit *test)
>   	struct xe_guc_id_mgr *idm = test->priv;
>   	unsigned int n;
>   
> -	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, -1));
> +	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, GUC_ID_MAX, 0));
>   
>   	mutex_lock(idm_mutex(idm));
>   
> -	for (n = 0; n < idm->total; n++)
> -		KUNIT_EXPECT_LE(test, 0, idm_reserve_chunk_locked(idm, 1, 0));
> -	KUNIT_EXPECT_EQ(test, idm->used, idm->total);
> -	for (n = 0; n < idm->total; n++)
> +	for (n = 0; n < idm_total(idm); n++)
> +		KUNIT_EXPECT_LE(test, 0, xe_guc_id_mgr_reserve_usable_locked(idm, 1));
> +	KUNIT_EXPECT_EQ(test, bitmap_weight(idm->bitmap, idm_total(idm)), idm_total(idm));
> +	for (n = 0; n < idm_total(idm); n++)
>   		idm_release_chunk_locked(idm, n, 1);
>   
>   	mutex_unlock(idm_mutex(idm));
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index be0a413ee17c..9445e5f32fe8 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -1182,7 +1182,7 @@ static u32 pf_estimate_fair_ctxs(struct xe_gt *gt, unsigned int num_vfs)
>   {
>   	struct xe_guc_id_mgr *idm = &gt->uc.guc.submission_state.idm;
>   	u32 spare = pf_get_spare_ctxs(gt);
> -	u32 fair = (idm->total - spare) / num_vfs;
> +	u32 fair = (xe_guc_id_mgr_max_usable(idm) - spare) / num_vfs;
>   	int ret;
>   
>   	for (; fair; --fair) {
> diff --git a/drivers/gpu/drm/xe/xe_guc_id_mgr.c b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
> index e845425d670b..2c181d280552 100644
> --- a/drivers/gpu/drm/xe/xe_guc_id_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
> @@ -34,6 +34,34 @@ static struct xe_device *idm_to_xe(struct xe_guc_id_mgr *idm)
>   
>   static void idm_print_locked(struct xe_guc_id_mgr *idm, struct drm_printer *p, int indent);
>   
> +static unsigned int idm_total(struct xe_guc_id_mgr *idm)
> +{
> +	if (idm->usable > GUC_ID_MAX - idm->shareable)
> +		return GUC_ID_MAX;
> +
> +	return idm->usable + idm->shareable;
> +}
> +
> +static unsigned int idm_shareable_start(struct xe_guc_id_mgr *idm)
> +{
> +	return idm_total(idm) - idm->shareable;
> +}
> +
> +static unsigned int idm_used_usable(struct xe_guc_id_mgr *idm)
> +{
> +	lockdep_assert_held(idm_mutex(idm));
> +
> +	return bitmap_weight(idm->bitmap, idm->usable);
> +}
> +
> +static unsigned int idm_used_shareable(struct xe_guc_id_mgr *idm)
> +{
> +	lockdep_assert_held(idm_mutex(idm));
> +
> +	return bitmap_weight(idm->bitmap, idm_total(idm)) -
> +	       bitmap_weight(idm->bitmap, idm_shareable_start(idm));
> +}
> +
>   static void __fini_idm(struct drm_device *drm, void *arg)
>   {
>   	struct xe_guc_id_mgr *idm = arg;
> @@ -41,25 +69,60 @@ static void __fini_idm(struct drm_device *drm, void *arg)
>   	mutex_lock(idm_mutex(idm));
>   
>   	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
> -		unsigned int weight = bitmap_weight(idm->bitmap, idm->total);
> +		unsigned int weight = bitmap_weight(idm->bitmap, idm_total(idm));
>   
>   		if (weight) {
>   			struct drm_printer p = xe_gt_info_printer(idm_to_gt(idm));
>   
>   			xe_gt_err(idm_to_gt(idm), "GUC ID manager unclean (%u/%u)\n",
> -				  weight, idm->total);
> +				  weight, idm_total(idm));
>   			idm_print_locked(idm, &p, 1);
>   		}
>   	}
>   
>   	bitmap_free(idm->bitmap);
>   	idm->bitmap = NULL;
> -	idm->total = 0;
> -	idm->used = 0;
> +	idm->usable = 0;
> +	idm->shareable = 0;
>   
>   	mutex_unlock(idm_mutex(idm));
>   }
>   
> +static int idm_init(struct xe_guc_id_mgr *idm, unsigned int usable, unsigned int shareable)
> +{
> +	bool overlap = usable > GUC_ID_MAX - shareable;
> +	unsigned int total;
> +	int ret;
> +
> +	if (!usable)
> +		return -EINVAL;
> +	if (usable > GUC_ID_MAX)
> +		return -ERANGE;
> +	if (shareable > GUC_ID_MAX)
> +		return -ERANGE;

nit: Can we write like this?
if (usable > GUC_ID_MAX || shareable > GUC_ID_MAX)
	return -ERANGE;

> +
> +	idm_assert(idm, !idm->bitmap);
> +	idm_assert(idm, usable <= GUC_ID_MAX);
> +	idm_assert(idm, shareable <= GUC_ID_MAX);
Do we still need these? We are already returning error above. So, this 
will never be executed.
> +	idm_assert(idm, !shareable || IS_SRIOV_PF(idm_to_xe(idm)));
> +	total = overlap ? GUC_ID_MAX : usable + shareable;
> +
> +	idm->bitmap = bitmap_zalloc(total, GFP_KERNEL);
> +	if (!idm->bitmap)
> +		return -ENOMEM;
> +
> +	idm->usable = usable;
> +	idm->shareable = shareable;
> +
> +	ret = drmm_add_action_or_reset(&idm_to_xe(idm)->drm, __fini_idm, idm);
> +	if (ret)
> +		return ret;
> +
> +	xe_gt_dbg(idm_to_gt(idm), "using %u GuC ID%s, %u GuC ID%s shareable with VFs\n",
> +		  idm->usable, str_plural(idm->usable), idm->shareable, str_plural(idm->shareable));
> +	return 0;
> +}
> +
>   /**
>    * xe_guc_id_mgr_init() - Initialize GuC context ID Manager.
>    * @idm: the &xe_guc_id_mgr to initialize
> @@ -68,19 +131,10 @@ static void __fini_idm(struct drm_device *drm, void *arg)
>    * The bare-metal or PF driver can pass ~0 as &limit to indicate that all
>    * context IDs supported by the GuC firmware are available for use.
>    *
> - * Only VF drivers will have to provide explicit number of context IDs
> - * that they can use.
> - *
>    * Return: 0 on success or a negative error code on failure.
>    */
>   int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm, unsigned int limit)
>   {
> -	int ret;
> -
> -	idm_assert(idm, !idm->bitmap);
> -	idm_assert(idm, !idm->total);
> -	idm_assert(idm, !idm->used);
> -
>   	if (limit == ~0)
>   		limit = GUC_ID_MAX;
>   	else if (limit > GUC_ID_MAX)
Do we need still need these checks here as these are already checked in 
idm_init()?
> @@ -88,70 +142,149 @@ int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm, unsigned int limit)
>   	else if (!limit)
>   		return -EINVAL;
>   
> -	idm->bitmap = bitmap_zalloc(limit, GFP_KERNEL);
> -	if (!idm->bitmap)
> -		return -ENOMEM;
> -	idm->total = limit;
> +	return idm_init(idm, limit, 0);
> +}
>   
> -	ret = drmm_add_action_or_reset(&idm_to_xe(idm)->drm, __fini_idm, idm);
> -	if (ret)
> -		return ret;
> +/**
> + * xe_guc_id_mgr_max_usable() - Get maximum number of usable GuC context IDs.
> + * @idm: the &xe_guc_id_mgr to query
> + *
> + * Return: maximum number of GuC context IDs that can be used by @idm for GuC submission.
> + */
> +unsigned int xe_guc_id_mgr_max_usable(struct xe_guc_id_mgr *idm)
> +{
> +	return idm->usable;
> +}
>   
> -	xe_gt_dbg(idm_to_gt(idm), "using %u GuC ID%s\n",
> -		  idm->total, str_plural(idm->total));
> -	return 0;
> +/**
> + * xe_guc_id_mgr_max_shareable() - Get maximum number of shareable GuC context IDs.
> + * @idm: the &xe_guc_id_mgr to query
> + *
> + * Return: maximum number of GuC context IDs that can be shared with VFs.
> + */
> +unsigned int xe_guc_id_mgr_max_shareable(struct xe_guc_id_mgr *idm)
> +{
> +	return idm->shareable;
>   }
>   
> -static unsigned int find_last_zero_area(unsigned long *bitmap,
> -					unsigned int total,
> -					unsigned int count)
> +static int idm_reserve_chunk_usable_locked(struct xe_guc_id_mgr *idm, unsigned int count)
> +{
> +	int id;
> +
> +	idm_assert(idm, count);
> +	lockdep_assert_held(idm_mutex(idm));
> +
> +	if (!idm->usable)
> +		return -ENODATA;
> +
> +	id = bitmap_find_next_zero_area(idm->bitmap, idm->usable, 0, count, 0);
> +	if (id >= idm->usable)
> +		return -ENOSPC;
> +
> +	bitmap_set(idm->bitmap, id, count);
> +
> +	return id;
> +}
> +
> +static unsigned int idm_find_last_zero_area_in_range(unsigned long *bitmap,
> +						     unsigned int range_start,
> +						     unsigned int range_end,
> +						     unsigned int count)
>   {
> -	unsigned int found = total;
> -	unsigned int rs, re, range;
> +	unsigned int found = range_end;
> +	unsigned int rs, re;
> +
> +	for_each_clear_bitrange(rs, re, bitmap, range_end) {
> +		unsigned int start = max(rs, range_start);
> +		unsigned int end = min(re, range_end);
> +		unsigned int range;
>   
> -	for_each_clear_bitrange(rs, re, bitmap, total) {
> -		range = re - rs;
> +		if (start >= end)
> +			continue;
> +
> +		range = end - start;
>   		if (range < count)
>   			continue;
> -		found = rs + (range - count);
> +
> +		found = start + (range - count);
>   	}
> +
>   	return found;
>   }
>   
> -static int idm_reserve_chunk_locked(struct xe_guc_id_mgr *idm,
> -				    unsigned int count, unsigned int retain)
> +static int idm_reserve_chunk_shareable_locked(struct xe_guc_id_mgr *idm, unsigned int count,
> +					      unsigned int spare)
>   {
> +	unsigned int shareable_start = idm_shareable_start(idm);
> +	unsigned int total = idm_total(idm);
>   	int id;
>   
>   	idm_assert(idm, count);
>   	lockdep_assert_held(idm_mutex(idm));
>   
> -	if (!idm->total)
> +	if (!idm->shareable)
>   		return -ENODATA;
>   
> -	if (retain) {
> +	if (shareable_start < idm->usable) {
>   		/*
> -		 * For IDs reservations (used on PF for VFs) we want to make
> -		 * sure there will be at least 'retain' available for the PF
> +		 * Spare is meaningful only for IDs that are shared between usable and
> +		 * shareable pools. For non-overlapping pools, shareable reservations do
> +		 * not reduce PF usable capacity, so there is nothing to retain.
>   		 */
> -		if (idm->used + count + retain > idm->total)
> +		id = idm_find_last_zero_area_in_range(idm->bitmap, shareable_start, total, count);
> +		if (id >= total)
> +			return -ENOSPC;
> +
> +		if (spare) {
> +			unsigned int used_usable = bitmap_weight(idm->bitmap, idm->usable);
> +			unsigned int overlap_start = max_t(int, id, shareable_start);
> +			unsigned int overlap_end = min(id + count, idm->usable);
> +			unsigned int need_overlap = overlap_end > overlap_start ?
> +						    overlap_end - overlap_start : 0;
> +
> +			if (used_usable + need_overlap + spare > idm->usable)
> +				return -EDQUOT;
> +		}
> +	} else {
> +		id = bitmap_find_next_zero_area(idm->bitmap, total, shareable_start, count, 0);
> +		if (id + count > total)
> +			return -ENOSPC;
> +		if (id < shareable_start)
> +			return -ENOSPC;

nit: Since we are returning same error can we combine these to a single 
if condition?

- Satya.

> +	}
> +
> +	bitmap_set(idm->bitmap, id, count);
> +
> +	return id;
> +}
> +
> +static int idm_reserve_chunk_locked(struct xe_guc_id_mgr *idm, unsigned int count,
> +				    unsigned int retain)
> +{
> +	unsigned int total = idm_total(idm);
> +	int id;
> +
> +	idm_assert(idm, count);
> +	lockdep_assert_held(idm_mutex(idm));
> +
> +	if (!total)
> +		return -ENODATA;
> +
> +	if (retain) {
> +		unsigned int used = bitmap_weight(idm->bitmap, total);
> +
> +		if (used + count + retain > total)
>   			return -EDQUOT;
> -		/*
> -		 * ... and we want to reserve highest IDs close to the end.
> -		 */
> -		id = find_last_zero_area(idm->bitmap, idm->total, count);
> +
> +		id = idm_find_last_zero_area_in_range(idm->bitmap, 0, total, count);
>   	} else {
> -		/*
> -		 * For regular IDs reservations (used by submission code)
> -		 * we start searching from the lower range of IDs.
> -		 */
> -		id = bitmap_find_next_zero_area(idm->bitmap, idm->total, 0, count, 0);
> +		id = bitmap_find_next_zero_area(idm->bitmap, total, 0, count, 0);
>   	}
> -	if (id >= idm->total)
> +
> +	if (id >= total)
>   		return -ENOSPC;
>   
>   	bitmap_set(idm->bitmap, id, count);
> -	idm->used += count;
>   
>   	return id;
>   }
> @@ -160,9 +293,8 @@ static void idm_release_chunk_locked(struct xe_guc_id_mgr *idm,
>   				     unsigned int start, unsigned int count)
>   {
>   	idm_assert(idm, count);
> -	idm_assert(idm, count <= idm->used);
> -	idm_assert(idm, start < idm->total);
> -	idm_assert(idm, start + count - 1 < idm->total);
> +	idm_assert(idm, start < idm_total(idm));
> +	idm_assert(idm, start + count - 1 < idm_total(idm));
>   	lockdep_assert_held(idm_mutex(idm));
>   
>   	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
> @@ -172,22 +304,61 @@ static void idm_release_chunk_locked(struct xe_guc_id_mgr *idm,
>   			idm_assert(idm, test_bit(start + n, idm->bitmap));
>   	}
>   	bitmap_clear(idm->bitmap, start, count);
> -	idm->used -= count;
> +}
> +
> +static int idm_release_chunk_in_range_locked(struct xe_guc_id_mgr *idm,
> +					     unsigned int start,
> +					     unsigned int count,
> +					     unsigned int range_start,
> +					     unsigned int range_end)
> +{
> +	lockdep_assert_held(idm_mutex(idm));
> +
> +	if (!count)
> +		return -EINVAL;
> +
> +	if (start < range_start || start >= range_end)
> +		return -ERANGE;
> +
> +	if (count > range_end - start)
> +		return -ERANGE;
> +
> +	idm_release_chunk_locked(idm, start, count);
> +
> +	return 0;
>   }
>   
>   /**
> - * xe_guc_id_mgr_reserve_locked() - Reserve one or more GuC context IDs.
> + * xe_guc_id_mgr_reserve_usable_locked() - Reserve one or more usable GuC context IDs.
>    * @idm: the &xe_guc_id_mgr
> - * @count: number of IDs to allocate (can't be 0)
> + * @count: number of usable GuC context IDs to reserve (can't be 0)
>    *
> - * This function is dedicated for the use by the GuC submission code,
> - * where submission lock is already taken.
> + * This function is dedicated for use by the GuC submission code when the
> + * submission lock is already held.
>    *
>    * Return: ID of allocated GuC context or a negative error code on failure.
>    */
> -int xe_guc_id_mgr_reserve_locked(struct xe_guc_id_mgr *idm, unsigned int count)
> +int xe_guc_id_mgr_reserve_usable_locked(struct xe_guc_id_mgr *idm, unsigned int count)
>   {
> -	return idm_reserve_chunk_locked(idm, count, 0);
> +	return idm_reserve_chunk_usable_locked(idm, count);
> +}
> +
> +/**
> + * xe_guc_id_mgr_reserve_shareable_locked() - Reserve one or more shareable GuC context IDs.
> + * @idm: the &xe_guc_id_mgr
> + * @count: number of shareable GuC context IDs to reserve (can't be 0)
> + * @spare: number of usable IDs to keep available for the PF
> + *
> + * This function is dedicated for use by the PF driver, which expects the
> + * reserved range of IDs to be contiguous. The function expects that the
> + * caller has already taken the lock.
> + *
> + * Return: ID of allocated GuC context or a negative error code on failure.
> + */
> +int xe_guc_id_mgr_reserve_shareable_locked(struct xe_guc_id_mgr *idm, unsigned int count,
> +					   unsigned int spare)
> +{
> +	return idm_reserve_chunk_shareable_locked(idm, count, spare);
>   }
>   
>   /**
> @@ -206,60 +377,175 @@ void xe_guc_id_mgr_release_locked(struct xe_guc_id_mgr *idm, unsigned int id,
>   }
>   
>   /**
> - * xe_guc_id_mgr_reserve() - Reserve a range of GuC context IDs.
> + * xe_guc_id_mgr_release_usable_locked() - Release one or more usable GuC context IDs.
>    * @idm: the &xe_guc_id_mgr
> - * @count: number of GuC context IDs to reserve (can't be 0)
> - * @retain: number of GuC context IDs to keep available (can't be 0)
> + * @id: the first usable GuC context ID to release
> + * @count: number of usable GuC context IDs to release
> + *
> + * This function is dedicated for use by the GuC submission code when the
> + * submission lock is already held.
>    *
> - * This function is dedicated for the use by the PF driver which expects that
> - * reserved range of IDs will be contiguous and that there will be at least
> - * &retain IDs still available for the PF after this reservation.
> + * Return: 0 on success, or a negative error code on failure.
> + */
> +int xe_guc_id_mgr_release_usable_locked(struct xe_guc_id_mgr *idm, unsigned int id,
> +					unsigned int count)
> +{
> +	return idm_release_chunk_in_range_locked(idm, id, count, 0, idm->usable);
> +}
> +
> +/**
> + * xe_guc_id_mgr_release_shareable_locked() - Release one or more shareable GuC context IDs.
> + * @idm: the &xe_guc_id_mgr
> + * @id: the first shareable GuC context ID to release
> + * @count: number of shareable GuC context IDs to release
> + *
> + * Return: 0 on success, or a negative error code on failure.
> + */
> +int xe_guc_id_mgr_release_shareable_locked(struct xe_guc_id_mgr *idm, unsigned int id,
> +					   unsigned int count)
> +{
> +	return idm_release_chunk_in_range_locked(idm, id, count,
> +						 idm_shareable_start(idm), idm_total(idm));
> +}
> +
> +/**
> + * xe_guc_id_mgr_reserve_usable() - Reserve one or more usable GuC context IDs.
> + * @idm: the &xe_guc_id_mgr
> + * @count: number of usable GuC context IDs to reserve (can't be 0)
> + *
> + * Return: ID of allocated GuC context or a negative error code on failure.
> + */
> +int xe_guc_id_mgr_reserve_usable(struct xe_guc_id_mgr *idm, unsigned int count)
> +{
> +	guard(mutex)(idm_mutex(idm));
> +
> +	idm_assert(idm, count);
> +
> +	return idm_reserve_chunk_usable_locked(idm, count);
> +}
> +
> +/**
> + * xe_guc_id_mgr_reserve_shareable() - Reserve one or more shareable GuC context IDs for VFs.
> + * @idm: the &xe_guc_id_mgr
> + * @count: number of shareable GuC context IDs to reserve (can't be 0)
> + * @spare: number of usable IDs to keep available for the PF
> + *
> + * This function is dedicated for use by the PF driver, which expects the
> + * reserved range of IDs to be contiguous.
>    *
>    * Return: starting ID of the allocated GuC context ID range or
>    *         a negative error code on failure.
>    */
> -int xe_guc_id_mgr_reserve(struct xe_guc_id_mgr *idm,
> -			  unsigned int count, unsigned int retain)
> +int xe_guc_id_mgr_reserve_shareable(struct xe_guc_id_mgr *idm, unsigned int count,
> +				    unsigned int spare)
> +{
> +	guard(mutex)(idm_mutex(idm));
> +
> +	idm_assert(idm, count);
> +
> +	return idm_reserve_chunk_shareable_locked(idm, count, spare);
> +}
> +
> +int xe_guc_id_mgr_reserve_locked(struct xe_guc_id_mgr *idm, unsigned int count)
> +{
> +	return idm_reserve_chunk_locked(idm, count, 0);
> +}
> +
> +int xe_guc_id_mgr_reserve(struct xe_guc_id_mgr *idm, unsigned int count,
> +			  unsigned int retain)
>   {
>   	int ret;
>   
>   	idm_assert(idm, count);
>   	idm_assert(idm, retain);
>   
> -	mutex_lock(idm_mutex(idm));
> +	guard(mutex)(idm_mutex(idm));
>   	ret = idm_reserve_chunk_locked(idm, count, retain);
> -	mutex_unlock(idm_mutex(idm));
>   
>   	return ret;
>   }
>   
>   /**
> - * xe_guc_id_mgr_release() - Release a range of GuC context IDs.
> + * xe_guc_id_mgr_release() - Release one or more GuC context IDs.
>    * @idm: the &xe_guc_id_mgr
> - * @start: the starting ID of GuC context range to release
> + * @start: the first GuC context ID to release
>    * @count: number of GuC context IDs to release
>    */
>   void xe_guc_id_mgr_release(struct xe_guc_id_mgr *idm,
>   			   unsigned int start, unsigned int count)
>   {
> -	mutex_lock(idm_mutex(idm));
> +	guard(mutex)(idm_mutex(idm));
> +
>   	idm_release_chunk_locked(idm, start, count);
> -	mutex_unlock(idm_mutex(idm));
>   }
>   
> -static void idm_print_locked(struct xe_guc_id_mgr *idm, struct drm_printer *p, int indent)
> +/**
> + * xe_guc_id_mgr_release_usable() - Release one or more usable GuC context IDs.
> + * @idm: the &xe_guc_id_mgr
> + * @id: the first usable GuC context ID to release
> + * @count: number of usable GuC context IDs to release
> + *
> + * Return: 0 on success, or a negative error code on failure.
> + */
> +int xe_guc_id_mgr_release_usable(struct xe_guc_id_mgr *idm, unsigned int id, unsigned int count)
> +{
> +	guard(mutex)(idm_mutex(idm));
> +
> +	return xe_guc_id_mgr_release_usable_locked(idm, id, count);
> +}
> +
> +/**
> + * xe_guc_id_mgr_release_shareable() - Release one or more shareable GuC context IDs.
> + * @idm: the &xe_guc_id_mgr
> + * @id: the first shareable GuC context ID to release
> + * @count: number of shareable GuC context IDs to release
> + *
> + * Return: 0 on success, or a negative error code on failure.
> + */
> +int xe_guc_id_mgr_release_shareable(struct xe_guc_id_mgr *idm, unsigned int id,
> +				    unsigned int count)
> +{
> +	guard(mutex)(idm_mutex(idm));
> +
> +	return xe_guc_id_mgr_release_shareable_locked(idm, id, count);
> +}
> +
> +static void idm_print_range_locked(struct xe_guc_id_mgr *idm,
> +				   struct drm_printer *p,
> +				   int indent,
> +				   const char *name,
> +				   unsigned int range_start,
> +				   unsigned int range_end,
> +				   unsigned int used)
>   {
>   	unsigned int rs, re;
>   
>   	lockdep_assert_held(idm_mutex(idm));
>   
> -	drm_printf_indent(p, indent, "total %u\n", idm->total);
> +	drm_printf_indent(p, indent, "%s used %u\n", name, used);
> +	for_each_set_bitrange(rs, re, idm->bitmap, range_end) {
> +		rs = max(rs, range_start);
> +		re = min(re, range_end);
> +
> +		if (rs < re)
> +			drm_printf_indent(p, indent, "%s range %u..%u (%u)\n",
> +					  name, rs, re - 1, re - rs);
> +	}
> +}
> +
> +static void idm_print_locked(struct xe_guc_id_mgr *idm, struct drm_printer *p, int indent)
> +{
> +	lockdep_assert_held(idm_mutex(idm));
> +
> +	drm_printf_indent(p, indent, "total %u\n", idm_total(idm));
>   	if (!idm->bitmap)
>   		return;
>   
> -	drm_printf_indent(p, indent, "used %u\n", idm->used);
> -	for_each_set_bitrange(rs, re, idm->bitmap, idm->total)
> -		drm_printf_indent(p, indent, "range %u..%u (%u)\n", rs, re - 1, re - rs);
> +	idm_print_range_locked(idm, p, indent, "usable", 0, idm->usable,
> +			       idm_used_usable(idm));
> +	idm_print_range_locked(idm, p, indent, "shareable",
> +			       idm_shareable_start(idm), idm_total(idm),
> +			       idm_used_shareable(idm));
>   }
>   
>   /**
> @@ -270,9 +556,8 @@ static void idm_print_locked(struct xe_guc_id_mgr *idm, struct drm_printer *p, i
>    */
>   void xe_guc_id_mgr_print(struct xe_guc_id_mgr *idm, struct drm_printer *p, int indent)
>   {
> -	mutex_lock(idm_mutex(idm));
> +	guard(mutex)(idm_mutex(idm));
>   	idm_print_locked(idm, p, indent);
> -	mutex_unlock(idm_mutex(idm));
>   }
>   
>   #if IS_BUILTIN(CONFIG_DRM_XE_KUNIT_TEST)
> diff --git a/drivers/gpu/drm/xe/xe_guc_id_mgr.h b/drivers/gpu/drm/xe/xe_guc_id_mgr.h
> index 368f8c80e4c7..209f99831f1b 100644
> --- a/drivers/gpu/drm/xe/xe_guc_id_mgr.h
> +++ b/drivers/gpu/drm/xe/xe_guc_id_mgr.h
> @@ -9,13 +9,29 @@
>   struct drm_printer;
>   struct xe_guc_id_mgr;
>   
> -int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm, unsigned int count);
> +int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm, unsigned int limit);
>   
> +unsigned int xe_guc_id_mgr_max_usable(struct xe_guc_id_mgr *idm);
> +unsigned int xe_guc_id_mgr_max_shareable(struct xe_guc_id_mgr *idm);
> +
> +int xe_guc_id_mgr_reserve_usable_locked(struct xe_guc_id_mgr *idm, unsigned int count);
> +int xe_guc_id_mgr_reserve_usable(struct xe_guc_id_mgr *idm, unsigned int count);
> +int xe_guc_id_mgr_reserve_shareable_locked(struct xe_guc_id_mgr *idm, unsigned int count,
> +					   unsigned int spare);
> +int xe_guc_id_mgr_reserve_shareable(struct xe_guc_id_mgr *idm, unsigned int count,
> +				    unsigned int spare);
>   int xe_guc_id_mgr_reserve_locked(struct xe_guc_id_mgr *idm, unsigned int count);
> +int xe_guc_id_mgr_reserve(struct xe_guc_id_mgr *idm, unsigned int count, unsigned int retain);
>   void xe_guc_id_mgr_release_locked(struct xe_guc_id_mgr *idm, unsigned int id, unsigned int count);
> +int xe_guc_id_mgr_release_usable_locked(struct xe_guc_id_mgr *idm, unsigned int id,
> +					unsigned int count);
> +int xe_guc_id_mgr_release_shareable_locked(struct xe_guc_id_mgr *idm, unsigned int id,
> +					   unsigned int count);
>   
> -int xe_guc_id_mgr_reserve(struct xe_guc_id_mgr *idm, unsigned int count, unsigned int retain);
>   void xe_guc_id_mgr_release(struct xe_guc_id_mgr *idm, unsigned int start, unsigned int count);
> +int xe_guc_id_mgr_release_usable(struct xe_guc_id_mgr *idm, unsigned int id, unsigned int count);
> +int xe_guc_id_mgr_release_shareable(struct xe_guc_id_mgr *idm, unsigned int id,
> +				    unsigned int count);
>   
>   void xe_guc_id_mgr_print(struct xe_guc_id_mgr *idm, struct drm_printer *p, int indent);
>   
> diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
> index 3dbcb1331690..6da43691e54c 100644
> --- a/drivers/gpu/drm/xe/xe_guc_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_types.h
> @@ -42,10 +42,10 @@ struct xe_guc_db_mgr {
>   struct xe_guc_id_mgr {
>   	/** @bitmap: bitmap to track allocated IDs */
>   	unsigned long *bitmap;
> -	/** @total: total number of IDs being managed */
> -	unsigned int total;
> -	/** @used: number of IDs currently in use */
> -	unsigned int used;
> +	/** @usable: number of IDs being managed for GuC submission */
> +	unsigned int usable;
> +	/** @shareable: number of IDs that can be shared with VFs */
> +	unsigned int shareable;
>   };
>   
>   /**
