Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4F04CCA470
	for <intel-xe@archiver.kernel.org>; Tue,  7 Oct 2025 18:37:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53E6A10E0CB;
	Tue,  7 Oct 2025 18:37:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dx5ke84F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AF4810E0CB
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Oct 2025 18:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759862242; x=1791398242;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=DKYlHoaOMrwxAeWUQK1h+VyT2xkC3MgWa7i0yuqhmEo=;
 b=dx5ke84FoA/1E7MX39ZF6AvPcjBY67VU90L+XCpxTsj3p92xPIwYzvz7
 qBFTrdhKquoMyokIPRJgMC7vZrdZ0lu5uZ403kyiT+juPrQMq+UNgwTwv
 I4KZe2LC7hz7WAPMU7gr6buzxAOwi/WyAaZN6T17eG/Ts9XI94LOlu1px
 Iamgpgt6jKiOas3zLQNrajCc8IsUiSELa8LP0Lx+QCNiq6uk/d/U1cOlt
 5gBREA9hlHYS4yMR8Oxy6YEIXZjd6idPZ7i4PgAL+hGQfp35UpwWSqr15
 0nLvGiEJvbCSbTkSRsljVSMnDHNkKqHSMRKbzwRF+KVLpEyguSQoGGx0D A==;
X-CSE-ConnectionGUID: EZtdCs4PTj6wzYQ7euylSA==
X-CSE-MsgGUID: zHHGRDdWTAG8OyueJhFlfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="49606245"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="49606245"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 11:37:21 -0700
X-CSE-ConnectionGUID: kaREf5ImRJ6AC6P1H7rIUg==
X-CSE-MsgGUID: 9hqsdR3uR5uSXNQ00uZr4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="185376297"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 11:37:21 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 7 Oct 2025 11:37:20 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 7 Oct 2025 11:37:20 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.46) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 7 Oct 2025 11:37:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IRbBfzYBG3sxgrvocv0i8PzpL1PQsLr+5+frKlb9dXYiJb4x6qGfUmesw8gHIMjkKuS8ecpvSBQhp1utjDrSr7u+a9/AWflCV+6PU2n5kfCWgyttv0NH12FxrZBo2ThvtMCGqH7wAEm+127d5NQ8deGg6XVmwDacRLYQ3MyxOSxdJbL6/mgtDHYcSRYu0NS+HHonMKyYjcbYzfDf0TgWMVoVDGZN9TfLtMryIJnUw218tbv2Qu2b9LxM/rub3zQ0XlROnc9tE5gv4Ywf6dBN6RPlVImvaW5Ib0XQKP5n69mgQITcTsoOXN5oZcL3+nQsp9yB2B5RnxITcFFrpDEK2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FZ4EzATEwOauhzsigCePvy2/Qfd1Di9/hM0QwsVaZBU=;
 b=ofI8Z83xouVLuq1SPxh6jpDTXh+IVHsjkYS3fS1PlYP5JHMTgMI+NGbn579eXohnScOiIAFn9Pd4Z531JSj1RQnuk03X+V/wE1/bmSS9jXoDbOjhzkyRZcm5ySHP6lbg7Jz6vsnatfJTaGZAtvpAc61NWXw2UkfP3iolIhsa97lpHOTkcO/WizrIzagxoDvbPmDeMxlslaYP4Tju0TDg1bnrKKab7pC52oAaBJGrDVqRk1i3bl9/3aUSqxdhbf+kza/6WtbfY6diI/o2NvwDGqKqE1kVcXOUUOuVKY9mHOW4NkBCnKMY+/xRW4jymMzSbGw4i+08eUVLXshyoWYRKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN6PR11MB8103.namprd11.prod.outlook.com (2603:10b6:208:473::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Tue, 7 Oct
 2025 18:37:13 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9182.017; Tue, 7 Oct 2025
 18:37:13 +0000
Date: Tue, 7 Oct 2025 11:37:10 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "Lis, Tomasz" <tomasz.lis@intel.com>
Subject: Re: [PATCH] drm/xe/guc: Check CT enable state before deregistering
 exec queue
Message-ID: <aOVd1vor49g67mHt@lstrano-desk.jf.intel.com>
References: <20251004173033.2511250-2-shuicheng.lin@intel.com>
 <DM4PR11MB5456A079CF5E4276AE13580EEAE0A@DM4PR11MB5456.namprd11.prod.outlook.com>
 <aOUtP+15UGWK1YaB@lstrano-desk.jf.intel.com>
 <DM4PR11MB5456FBB99875139BBC207BA9EAE0A@DM4PR11MB5456.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DM4PR11MB5456FBB99875139BBC207BA9EAE0A@DM4PR11MB5456.namprd11.prod.outlook.com>
X-ClientProxiedBy: BY5PR16CA0030.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::43) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN6PR11MB8103:EE_
X-MS-Office365-Filtering-Correlation-Id: 68e60ac6-5160-46ce-64eb-08de05d08826
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cHR6OFBmNXRRSmwwejhWanBURHBlajM5aVVqWHpPZlZqUEt1T2RmVUNURWZ1?=
 =?utf-8?B?NkQvbUw2VUlBOTUwci9CcnF4SnY5VnBncURkM3E1T2xueDAzWnpIYTlJUlhJ?=
 =?utf-8?B?L1J3TjdMdXFoZG0xNkd4K0FqaG84RjZDWEQ2NGxUYi9qVjFKdDRNcHo3Z3Ji?=
 =?utf-8?B?a2RzRFlNZjBSaEpGNzIvYTZkYmd2MGlyc0E1bEt4TXdNMTFIMW9RMGlEM0Yr?=
 =?utf-8?B?UHo2eHU2QkphcVhhWCtMYkFBV21LMksxMUhwWnlNR09ZYkxMNTd5YXpmMEo0?=
 =?utf-8?B?SXc5WEVRaCt3cW94UldXV2dmb0taamxINkUveUNQVFNqb21tTzdlMGVkbDNr?=
 =?utf-8?B?NUZtZlJIeWxER09FT1ZNcXBLTDkvM3hDRHd6RGErVXBjcjcvaEFqSXpUdTJy?=
 =?utf-8?B?VjhLUmNjUmFJSWNhU0tDYzQyMzQrd1pEbEFFVXM4WHJBRXIraWFXL0ZjaGRD?=
 =?utf-8?B?eHF0ZVFnaktpSVRDQVdMbTJBN2hScDNOY3FPUHdJSlhyVjhiczRtbVdSVWk4?=
 =?utf-8?B?UE43TjdRdFNGWXRVSmRoeUszSDZLOVEwV2FPMkg4Y2ZTbU0rRU1vV09IVDhj?=
 =?utf-8?B?U2tWVXNMZmZjell4NjhXbDRuVTNSV2p2UTNSdk1LUmxiRThtaUltbFIyL1M0?=
 =?utf-8?B?WXA0YXZpM0Nsb3BZNVVsRWxuL2ZaK2FFcXRNSXZ6anRxejRSMDZyRENrZU1p?=
 =?utf-8?B?SmRNY1BDTnNMMEhoYTNWbnRIa25uQ0ttWjB5WFJzL1JIVEpIZzgzV003R0lD?=
 =?utf-8?B?eGVUVklJVnJyZ2k2RDNiRG4rTFVTTmpmektpTWZ4ZnZ4SlNUcWk0NXliVlpQ?=
 =?utf-8?B?VTBGOVFJVmdTRnQzbkVsOFZETit3ekxmRXZHZS9BZ3VkSDFScDJVbnB1OU9P?=
 =?utf-8?B?TGhtN2xyejhJV1dRYmVwWDJ2aTgyZjlBN0lRY2xjSWR2cjFxS3dJL01jZWZ0?=
 =?utf-8?B?ZzZleFFRYzRFMHE3blE5OGd1RFE4aldWdUNtV0lTUWEvckZ5WWVZMVlFUEp1?=
 =?utf-8?B?YTdGTGdvd2h5bFNHMlZzbDQvTFFsK3ZxenlGMnJuR0QzeE9lMms4c2lwRGFQ?=
 =?utf-8?B?NEFJbTJnVEtIRVBCcnhBSXNYUnpUNDA0Mi9PTUZMemhJRTV1WXNRa2RHSkJY?=
 =?utf-8?B?Y1RDS29FZHVBaG5hcjlNV3B2Rld4b2crK2QzL2g1Unp3ckw5azhuVGlveFQ2?=
 =?utf-8?B?RU5JMEY2VFA0M2grbU5rMlJ0NUVRWFNGeUxWeUJDUm1yeUgxa3FwWnFNN0N4?=
 =?utf-8?B?R3pQUzJOREdoQWFEYzNiVFI5RDIydVQrZ0F3bEtwMVlnTjFYblgvbEVISUl2?=
 =?utf-8?B?eUdaNGhWbWZ6YkNjWEp1bmxFeWFCc3VnaVJJbXJOdFQzV0QrcTY4eWpNZmRR?=
 =?utf-8?B?R3JiZ0ZzT0IreGJLWXdBWWg1R09ZNkxHRFFQSG5NMm5abWNKS3Q1QzFLZ1dj?=
 =?utf-8?B?OW1DWWF6UHhrRjFuaE5kNlFQVTJxaWJSbjgxTkl4WVF5bzhYSUFabEFZUnly?=
 =?utf-8?B?OVhQb001ek1qcU00dUNiaFRTUHJ6TzkvMVBnMHpLc1Jvc2VKb2kyN2YweEdD?=
 =?utf-8?B?UXFNR09pNU1sbWxrNk1sQ1R6NnJlNnZSUi9aSytuTE5LRS9kUmxpa2MxK2hx?=
 =?utf-8?B?MjNiZGFWYWJaOTBWcWhPYjFKS0M3NVcwaEJZUHEyYTBSK2QyS0pRbEladDlt?=
 =?utf-8?B?YTl3c1ZINHgvM3JsRS9iRkpjcE42Unl4WlA1VW1WYmtGeHJyVU44b09kNThU?=
 =?utf-8?B?bmFUTTdzTzRMSjdXTEY0ZWVNNkRPNlRqUmd5dmJna0NKQ21rejZXc3NQTDRY?=
 =?utf-8?B?UGJiQWdYNUtHeEZ2TWxrclFjMGdrRDZmYmxpbjFSWE1Fa0E3UUNmNzd4U2N1?=
 =?utf-8?B?eE85cXphakNMaHpEeHFxRTREVVNMbHNEOFpGRFN4VTliVWVQVjNSSVR3TFpP?=
 =?utf-8?Q?TzJ7aNe1vabznJbd0U4iOpZUSE1MzY0a?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aHRFb0dIb0UvOG1xV2MwSDRDTlBkb0Z4U1VvQ2R4SjZMVG03QUFKZzBTQk9F?=
 =?utf-8?B?MEpLZVE0dHhtTjdqclpkR0VkUGk1UHBKRjFVb1VmalBTWjFNVmRCL1d4N2dP?=
 =?utf-8?B?eGkxYXBxWmF4YithVjVJa3BDUk90QStSZGhucG5KazYwZFd3SUZpdGkyREUw?=
 =?utf-8?B?U21ueU5WTE84Nk9DVVBKZlFwVjhCbFlQMUpqRGp5VVE5VVlDakVPS250anI4?=
 =?utf-8?B?MnprV3VYa0dUeGc1cTVpSWFJQmtYVGpmcVJkek9Meis2d3hPcTU3aHgzeFl3?=
 =?utf-8?B?UEtKUUE0NlFBaXI3V2d2U0RvQ0xpNmlNaU44N1AzNC9hMW5EYUl1bmtuNy85?=
 =?utf-8?B?REtndDNIQW9Jc0Q5YVZobWtXeGUzSWJsb1pPS0cwVWN0WGcvNEtmMDhkcWpi?=
 =?utf-8?B?Vk5xb0Z2bGZWS1pZUVpIUUN3TzFWVGV6NE91djJYNEQxRG1nOTFIdFo2bldM?=
 =?utf-8?B?MnRZVjNOc3MvUVJBMnZzeTBEU1kzK25jTmNOYTJwVTdUQnZsdFpDUVlXaEpm?=
 =?utf-8?B?RHFua25JSlNuckMraGF4NkM2MUtPSmx6cHpkcGhOYS90UWhTb25kT0Z1ZW9h?=
 =?utf-8?B?eG8wNEZ0blFuMkxYZVlwNmhCZHEyNjBnYytSZU12aTQySlVaN1IvZTlnUmR2?=
 =?utf-8?B?eVNoWW1nc2J1ODMwWGZqRThobnYwT2dZcUNLcjRIR1p0MmEwS0kvNENLZitp?=
 =?utf-8?B?NkhTZ1dyUlorSkNWaE0wZXN4bmE5TnFuWTNhSmdiQmhCY3l5aXh1NHM3MXo0?=
 =?utf-8?B?ZDBDWWFFUVBxWGxGYmY0L3F4YVQ4SzlwdGxjb0tBT2pvS3FvOGtZbmhzeDVL?=
 =?utf-8?B?bjRzUHFTMjI1M2xrQXl3UGI4U3J1Q01OdnNGMkRWdmdHQ1gwMVU4Mmkrb0Nk?=
 =?utf-8?B?WkFIQkJyUVNmcVBTSml4QlVWanZCSDB5M2xsUkducTVJNXp0VC9EV2wyZHBZ?=
 =?utf-8?B?cXZEZzU2KzFhQlRCRVVwZVFNcmFJeVNYMGNTRTFHVjVNRnpRenBpbEZ4MGJa?=
 =?utf-8?B?YlUxeVcxQnlpZTQyWEFIbU9SRThlYzEveDl6eEZOcTFvTFhaejZRVE1TS3Z1?=
 =?utf-8?B?M2txRHh3cnFPb0Jaak1BclNSdjRMY3Y1Sm5RQ0lVbCtmU055MElGY25SaXpT?=
 =?utf-8?B?a1ZYVjd4QWhvS0NNQ3VReTdiNTJqSUNOTzRMRHRabThVTmNSeG03TEo4aUpu?=
 =?utf-8?B?MFpNVThPZ2E1ZDViNnIrTDl1TXBBSllYNEFPeG9jSjdkNGZ0ZzVqWGUwV2wv?=
 =?utf-8?B?cTQxZkJ0Q0JJT3VXWHVIVzZqZmd0NkI0ZDA0MVVWMVRhbFp6V29PQ1AwN1ZQ?=
 =?utf-8?B?MWdDdHNENUY1SXdPNHFNdmhqRVYvZEJDcE1YWEVrdWdXaGRyMXZ5UTJhWVNh?=
 =?utf-8?B?UWg4LzhiQ0NhYmlOQ2xXaTk2K1dMc2dhekVqL01KZURNSUQyaFRwMEhjbUpE?=
 =?utf-8?B?ZjFRQjk2UTIvVnpOS21ycndQeEZOVjNhSlhoLzJSUXRZamNnZk9uZko2MXoy?=
 =?utf-8?B?RkRlOVhpNkFlbXJ4UTN6RHRsQXZYbEhFcDRnK1J4aVhUZ1FqbGZseGhBcnpm?=
 =?utf-8?B?MkFkbjdQYit5alNZYXREOEFyRG0wNGRleDZ4ZWhVVlQwbFo2WlQxQzBCQTEz?=
 =?utf-8?B?aUtiVXhTbFF6OU1TdHlzVzRYdmNHMzZFdEFEKzhPZDhFWUFwZUtsL2xNNGZ3?=
 =?utf-8?B?c25ERXlMc0c2VDg3VWZVUGluaXdRanlUYnJZS3Qya01zcWI0RnFaa2xzVU9p?=
 =?utf-8?B?Q3g3Y3FGZitGNjNWZkVEeEJseTVjSmdrR0cySm5KRkZpS0UrakViK2Q1ZE9y?=
 =?utf-8?B?eVZtb0x4emttZWdBNDltTVJJdnNrRE84YTRIcVlodlJRYm1QdzNOa1VuSktw?=
 =?utf-8?B?UTRoRTZQZFBSNlJIOWFTRUZMUW5xZVpDMXlaVElzdE1zVHQyYmo2eEVZL29w?=
 =?utf-8?B?NlNpQ2ZUWUlpSnFQNEF6Umk1bjg1WkZtMVZjSGdIQ1o4bUs4RU9wV3FqUWR2?=
 =?utf-8?B?Q2laSnZKeEZmVzRjTkpPQWZMN1FuejlTQ3RwZnBaZHZhUTh5aWtHc2YybEtX?=
 =?utf-8?B?eUpWeUdId04reE0zRFZ2MGpqaFRrNWNSRzNWQWt6TDRISlV4OVBKWk12cFNp?=
 =?utf-8?B?TGJxcWE0ajhubjQ5WWRCcGpvRS95cUxEU3crZ2gwa3R5SCsxMEp5b001OHB4?=
 =?utf-8?B?OUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 68e60ac6-5160-46ce-64eb-08de05d08826
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 18:37:13.0600 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5xG19V49JJ8Rbhe1VNYqAKXkHxWE4Do0geE6tHRu01MeSDi4n7orZP1I9px+vrBGw5PVccUNW89EE8ZXHgVANg==
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

On Tue, Oct 07, 2025 at 11:59:30AM -0600, Lin, Shuicheng wrote:
> On Tue, Oct 7, 2025 8:10 AM Matthew Brost wrote:
> > On Tue, Oct 07, 2025 at 08:59:25AM -0600, Lin, Shuicheng wrote:
> > > Hi all,
> > > Could you please help me review it? Thanks in advance.
> > >
> > > Best Regards
> > > Shuicheng
> > >
> > > On Sat, Oct 4, 2025 10:31 AM Shuicheng Lin wrote:
> > > > In normal operation, a registered exec queue is disabled and
> > > > deregistered through the GuC, and freed only after the GuC confirms
> > > > completion. However, if the driver is forced to unbind while the
> > > > exec queue is still running, the user may call exec_destroy() after
> > > > the GuC has already been stopped and CT communication disabled.
> > > >
> > > > In this case, the driver cannot receive a response from the GuC,
> > > > preventing proper cleanup of exec queue resources. Fix this by
> > > > directly releasing the resources when CT is disabled.
> > > >
> > > > Here is the failure dmesg log:
> > > > "
> > > > [  468.089581] ---[ end trace 0000000000000000 ]--- [  468.089608]
> > > > pci
> > > > 0000:03:00.0: [drm] *ERROR* GT0: GUC ID manager unclean (1/65535)
> > > > [  468.090558] pci 0000:03:00.0: [drm] GT0:     total 65535
> > > > [  468.090562] pci 0000:03:00.0: [drm] GT0:     used 1
> > > > [  468.090564] pci 0000:03:00.0: [drm] GT0:     range 1..1 (1)
> > > > [  468.092716] ------------[ cut here ]------------ [  468.092719] WARNING:
> > > > CPU: 14 PID: 4775 at drivers/gpu/drm/xe/xe_ttm_vram_mgr.c:298
> > > > ttm_vram_mgr_fini+0xf8/0x130 [xe] "
> > > >
> > > > Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_guc_submit.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > index 53024eb5670b..9d33f63d972b 100644
> > > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > @@ -1489,7 +1489,7 @@ static void
> > > > __guc_exec_queue_process_msg_cleanup(struct xe_sched_msg *msg)
> > > >  	xe_gt_assert(guc_to_gt(guc), !(q->flags &
> > > > EXEC_QUEUE_FLAG_PERMANENT));
> > > >  	trace_xe_exec_queue_cleanup_entity(q);
> > > >
> > > > -	if (exec_queue_registered(q))
> > > > +	if (exec_queue_registered(q) && xe_guc_ct_enabled(&guc->ct))
> > 
> > Checking the CT here is not the correct approach — this is a state that can
> > change at any time. For example, the CT may go down and come back during
> > VF migration. If you race with that state change, the GuC will hold references
> > to the queue, and things will quickly go sideways.
> > 
> > I think what you need here is a driver unbinding check. Do we wedge the
> > device during unbind? If so, you could do something like:
> > 
> > if (exec_queue_registered(q) && !xe_device_wedged(xe))
> > 
> > Show more lines If we don’t wedge the device, we’ll need some xe_device-
> > level function to indicate that the driver is being unbound.
> 
> wedged flag won't be set during unbind process.  How about "gt->uc.guc.submission_state.enabled" set in xe_gt_sanitize()? I guess no since it is like xe_guc_ct_enabled().

xe_guc_ct_enabled state can change in quite a few places, I think
uc.guc.submission_state.enabled is bit more restrictive.

> How about xe_uc_fw_is_running(), or we should not rely on the guc state, as it may be changed later?

I think either of those would likely work. It shouldn't be possible to
enter a scheduler work queue in normal operation where either of those
is clear (i.e., I believe this is only possible if the driver is
unloading / unbinding or we have wedged the device).

> You prefer to add a new variable like "xe->unbound", and check the bind state here, right?
> Thanks. 

This might be better (?), a bit of a bikeshed and I'm personally fine
with either. Other might have a stonger preference than myself though.

Matt

> 
> Shuicheng
> 
> > 
> > Matt
> > 
> > > >  		disable_scheduling_deregister(guc, q);
> > > >  	else
> > > >  		__guc_exec_queue_destroy(guc, q);
> > > > --
> > > > 2.49.0
> > >
