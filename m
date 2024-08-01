Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE6DC3DA7F
	for <intel-xe@archiver.kernel.org>; Thu,  1 Aug 2024 10:08:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C9CA10E8E9;
	Thu,  1 Aug 2024 10:08:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XwJlsod3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B1E110E8E9
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Aug 2024 10:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722506909; x=1754042909;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yO95zDRCSa4I1f528m9gxHpDcTclPsr++FXZjYvc1GU=;
 b=XwJlsod3V9GUCIiLfgwLG8ltDu7PwElyefRZYCx8Ngy5/JAeB32zkDRo
 DqPdibaHqp+wXzYIej1KaG9UBXZaobmr+04mf5TofsxhMnSR6L8SOzmBZ
 QotKOPUtH6KBfZWZXvDLkOT+i8x7i9e4+YKWh8uGGdlv7StclLy1+rim9
 TiB27qe/mRGgUQgeyh9FOaL+h6TpBPRDk5N5emHsPoNJARuwg5jgPGwfx
 PAvKdVfs1ojSQmoXAOY0DYGj5lBVUotcVlwM7l4PrTE8SxL7hEd43brUD
 X40UYQPdWz5BR5JZSVs2ciNJ9eridNv8Q6eI3nS8PZLxu0fyniWn/mLDc Q==;
X-CSE-ConnectionGUID: nGdtS7JGShO9vyJF0SvMbQ==
X-CSE-MsgGUID: 6BV/nY1QSgOvrDO5H386VQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="20604843"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="20604843"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 03:08:15 -0700
X-CSE-ConnectionGUID: lGFDMh47QQGatHL5LF0M6Q==
X-CSE-MsgGUID: dlYqcFPaRPO6l6BZz0G5UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="54648457"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Aug 2024 03:08:15 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 03:08:15 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 03:08:14 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 1 Aug 2024 03:08:14 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 1 Aug 2024 03:08:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MEwKEIJFxZouhZyha7YJFoWbRARFoRXK5/CA0uNua6FZoo5gnrrnzezbs+dtNJVQDjOtrRjuX5/13XwVvEEUcTIXhq2nqcL4ZSF4/U1VzHgZYES4h+fdYV5qDG6XMp9RPB1kBGhDVolz3ssxioJ7ZrTAW4bG4GmaYdNgazrGPZgY29nwUoypYAhz0vjBjY9qbChzS5+EAerW0chgM859tTg1kWNZiDw6Lx13bJcGKwVSRpmGSeB59uykmso0rGVO0m9XKRMQSkuLCRL+CScJtYFFy6PHRMfYErci1HiyuGlWzq076QTs9lTbM6nKRa2U+IBL7v4ERSnEIoCT1pmboA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=20OT98T8v+PNs6UWaCQbIwPjRpzE61TeUHtE/JB9q7c=;
 b=P/upH/FA/89RKqT8f0qESJroLtVDILDogwK7qAzWbvb1iFdJL4H/OmFAz8AADUEN2mG4yiEogUDXbV/mazK88fj7MVMbVYfzrvjnQQwa7Ylrv74C93lyloVHwuzvFjAJVEq3yqTQknOlmzYngQxUQBseQcWHpuQWMFYobRTkZrmg2rS2ovUiMsEJc2LfSD2P7CtxSrss4CTKUM4vOq9Ifp8gW4TYw05qPSi8U3I/KltWlUXMhseHER6IdtlclVA+qPJ+y1VQLsPP0IqqN12AbgWk0qPi3lA4M8AWdkyncTWxXz7T8mWS0jHetq0li/RVxrSrzsZVWk5aCSKpoYkhZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by PH7PR11MB6606.namprd11.prod.outlook.com (2603:10b6:510:1b1::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23; Thu, 1 Aug
 2024 10:08:07 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%3]) with mapi id 15.20.7828.021; Thu, 1 Aug 2024
 10:08:07 +0000
Message-ID: <cfcf0bd5-6f45-4f82-9619-a5ca8dbc5e25@intel.com>
Date: Thu, 1 Aug 2024 15:37:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] drm/xe/xe_gt_idle: store powergate enable bits in
 gtidle
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <vinay.belgaumkar@intel.com>,
 <matthew.d.roper@intel.com>
References: <20240801095305.1209046-1-riana.tauro@intel.com>
 <20240801095305.1209046-2-riana.tauro@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20240801095305.1209046-2-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0115.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::13) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|PH7PR11MB6606:EE_
X-MS-Office365-Filtering-Correlation-Id: d9ec4a09-bfe1-4a3f-0ee5-08dcb211d6fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cHFhYmFvZk84MktlQlJrMlNCVC9uOVNTd24zYkVvb29YWjZRZU5qQ1I0MDJq?=
 =?utf-8?B?alprQy85TDZVOE41eG41ajA1YWp5b1JvQWVTRHU0WmJZYmEzME9OendrQVgr?=
 =?utf-8?B?L1BaWHIvZ0oxM3lyNkxyVkNGWWpDL0xsTSs2cS96OTVpcktUMEhJMmYvZXYy?=
 =?utf-8?B?V3VnN3lsYWcvS0tOQnZxQlVmUUx6aVlER0xxd2ZobU95QjE3WHRWOUVyOGhz?=
 =?utf-8?B?YzVpejhFODYrUWozbWxPUnIrUFM4YnRyNnlJcUlnaGFhNVluVSswWG1RWHRG?=
 =?utf-8?B?RkJTSVc2Z1RJcVVNR1ZwRmgzT2RybSt6Wk9DZUJRRUt2T05abU00TDZhMi9n?=
 =?utf-8?B?dWxhNFpFUFMrSjdzczN1NmpZRks5cTl3d3ByMkZESUxnOTVpY3pKQWJHSGQr?=
 =?utf-8?B?aWFjbEF5RExjNkdvTnBJS3BBN0ZnMjVqKzErZUYwQmlGbUFUc0xnUUhmYllj?=
 =?utf-8?B?TVZwRDIrb2ZWNjJGNGhjYlRJcnR3a2ZYOFlMR1JRQ1ZOdkwvSE9UZDBzVWxN?=
 =?utf-8?B?VTg1M0tGcGZyUzRNdVBXQ0NLbjE0bnIzdW5MdE9yUWZkMTdqNlJXWkFzUDQv?=
 =?utf-8?B?Wm9MOEdCRU02NGhqNmtVaWlOMkpwNCswa1lad0YvVVhPZWtFWjlWN21EOFdK?=
 =?utf-8?B?cCsvNGY1R3JCZFBPM0Ewak8xZ0NBRzNoVTl2MWxRLzJveU8vV0NzWXlSaEow?=
 =?utf-8?B?dVQ3VFBUYjVvYTJBWUlDU3B3YlAzR05ROFBOcnBPQ2I1bXpUUzFJdjVNeElL?=
 =?utf-8?B?dFdwS2tGVEo4S2R2THJqVWRXMjBIZyt4bnN1TzJmMmQ2OTFCcERhTUs3RnVG?=
 =?utf-8?B?Z3Z4OURzVjVTMkEyTzl5ZDlGK0FPalBCbFQrVkFwZzNjdlZnczM4OWVoU3ZT?=
 =?utf-8?B?QTNSQzJyOFdsR0kyVWkxNFRwWUlEZ0FYZkFwMW9LNmczdkZoellTVWwxUEpI?=
 =?utf-8?B?QWFTQVpXYlRVV3UwaXgwNUNmcld6VHVjT2Exb0lMQTlxU2lSTmZHVE1RUnBz?=
 =?utf-8?B?N0krcDUvRkk1RFJ3QWM2aXpyL2RTeUxzS21rWm5SSHY5b0VzM3ZtMHJZOE5Q?=
 =?utf-8?B?VWZWaDNuQmFlMm1WOHpFTmVaQ1JGVmUwNWJsUFMvTjljOUx5dk40UTM5ZmNp?=
 =?utf-8?B?NHI5WXVieG5qTGdHT2hrZlFuZll5UlhJdTZnMkJFYncvUnhiOG4zSGYvUG40?=
 =?utf-8?B?WjJQVHB3WHVzUnZhcEREbWNSekk0bUR6UzlVaGFXMkE3dUc4T2NySkdWK3JI?=
 =?utf-8?B?bDYwc3FBOHAzak9kOG9yL3lwaGx5OFA0c2hCYWVITjEyUnFqTCt5QkQwSE1V?=
 =?utf-8?B?b2VkbSs2UzZ1cDA3LzhyNTZUSHZFMUVJU3Boa2pmeHU0OTNvdTN3RVB6V1Q3?=
 =?utf-8?B?RGJEdnF6Z1A1UlVnZlN5RFBHMk5vOTJ0L2NCa1M1YmNYaDRSSUh4cXhWWnZX?=
 =?utf-8?B?a2kyVEFtUXQ1MEtENmpiRW1sdVpqNEtiMUFrZ25EMTIzVEJ1aWFjdmNOSzlU?=
 =?utf-8?B?YjUydHJGYklId2ZZYzhjbE1aOGE0TmNhbEd1cG90TFM4eWNjMytXOFUrMXQ5?=
 =?utf-8?B?eVQ3Y1lUWWtrRThrc1I0ZHl1WURQWTRpMEwyZDdPaVFROHpqMjBiVTlnL0sy?=
 =?utf-8?B?MnJjZE1JWXBhbDVrcDE5VW9DQmljQmFLeDRyTGFVQXpJd2JscURxMzFGM2lj?=
 =?utf-8?B?Z01ubldlemNac1Y4SGdQUkhEaW1uUUc0cm9mcFREeVdTR2gyOWtvTUd0SEZL?=
 =?utf-8?B?ZCtrYS9IbmcyK0NTWW1paXNwUDkzWm9QOXZBcHZqekdnc0hsbmErZURPY2Uv?=
 =?utf-8?B?QnhKZ0hjV0VLQXF2ZWpwUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UGErWXltY0REV0lPTHcweGtyQmp2UzI3MC9EN2ROaERPbFZQR2w3SFV4THNV?=
 =?utf-8?B?a3UydWYxVDI2RzV0UnFIcDIweFIxR1E1QTN3TjRtcnhTU2k0MEoxUStnOGpI?=
 =?utf-8?B?WURJdysvSXc5ZWUyN0hPSFhBY0RVeFBnRUk0TFVLV1NYU2Y0d2xvQjlSeCtS?=
 =?utf-8?B?cVRodFdNRGpWVnZ2OGd1aW9yY2JNZ1JRZ2FGbHZlL2ZFMldyYXA5dXY2NXJE?=
 =?utf-8?B?NGlSTk5zdzdWS1d2S3RySDN0WTN6OGF1Q3d1b0RTc0JZNWVleHhmR0lTNFIx?=
 =?utf-8?B?YnBTcnJxaVUzaWZtSzFwZlpjOVg3UjUzMUIyN3BxWW9Pb08rbkE1dlZxV0Jw?=
 =?utf-8?B?ZjFMb25CVUY4bUpKZUpDQjBKRXhsSnVPVFJMU0FXcEtLQ3lFclhUUjJnRjV3?=
 =?utf-8?B?dXFwOUJ3YzFjNnFFOXk3OHF4UWRXcFZ0cjN6Zm1tbnQ0Z0l4UUhaRWFQOExF?=
 =?utf-8?B?YktSSU9sQWVPTk9SNklIWFV1MVh4Um1CWjJKeVJuTWZUMmdvR3hoU1daeTRF?=
 =?utf-8?B?UGpJYnhkRDhFNkZzUlhIeUdtbFlvYXIrelpoZ1lidmk3NVJOc0tRekZMdjJP?=
 =?utf-8?B?bC84TmlEa0lpdURZYVphUWVqd3pZR3o5SjRWRlVYOE9EUFB5cHJlbEZRd2dm?=
 =?utf-8?B?cUlqVTY1dkQwM3JNY1ZaTllCcXdaeE50R0ZjdlB6WlJnSWhyQ1ZHTzVoM0RQ?=
 =?utf-8?B?YjNGUS9Qa0RSYkdMTktwY25PQ2pPR05BcFBhTU1RK0FBK0pES2k4ZnZISHhw?=
 =?utf-8?B?QWlabnV0SFVoWkFnWVBwdEZXbDBoYUJiV3V5S0JuUWlBZUxqbzdKdzdpVVpW?=
 =?utf-8?B?QzFQMGUxS3JPMVJ1WkFBcUY5YWpVWmN4ZHVJQ3BBR2lKNytybDlSV1NvUU5w?=
 =?utf-8?B?MXpra1dMVU9IcFFFYjhVSlg4bHUwRnNMNXpxY0xRQ09UYkgvSlN2NWg3OUd4?=
 =?utf-8?B?SFNyNHZBOGo0VHlkM01xbjJCZzJnQVZIRUNsU3hraVJoQm9HNHpWWld5cE95?=
 =?utf-8?B?L21wQXVKcFhlSmQ4TExaWW95QVcxc2pvWDRCdXcwZzZWbHZtVm9Ud1VuL3JI?=
 =?utf-8?B?STgxOUVxVkN6cE53Y0xQWWdxaXZhQklpTDZQMlg4MW9MQi9xaWVLR04xVVNa?=
 =?utf-8?B?b1NDckF1MWx3WWlXM2hLbm1HbDVRNFh4TXZzUDNEcmw0akZ4M2xReHZzTlZX?=
 =?utf-8?B?dHcwUFU0N0FVL1R4aFV1bEJZSXdqNXh3SkhQbnVybzZOZ0kzQlU0WHppeXc0?=
 =?utf-8?B?WkhjeUxHT0x6QTExQ3VOVGlDSGQ1c25qelF5emM2MDkxU2FVa1J1RSttejI4?=
 =?utf-8?B?enFwSjB4QmhXWFFqVDFmM0o4SnA5dW5XUDZqcXg3VGdqaUtaVHBQeTFydURt?=
 =?utf-8?B?TGRENU5vMnNEcXFJUjFrOElZWmlabFZkSnJpbC9Db1M2MDlOeXlNM1ovZjVZ?=
 =?utf-8?B?V3IvRjZ1eUZYQzBlbk9pd0pQK1YwdkFiZm94STZsT29aRUR3TjZIK2RDSGFj?=
 =?utf-8?B?ZXRvSFNSZUQyeDNVMW1MUS9lZjBUaklhMXpjcWdGNUxOODBHV1c3b0xkcFY5?=
 =?utf-8?B?OXJHaEVWR1FYRWJDemZaNzJTOVR3VFY0b2JyejI5RHBya1g4R0dUSW9hS1Rx?=
 =?utf-8?B?T0RVRTZFKzlNRGJtc1AwVkpJYXJYeXRWLzl5UThCb01jajRtZFlBMXNCbXVJ?=
 =?utf-8?B?WVloUVVmZndrOVJLTi9nblpUajkrNUJEMnZqQ05qeUVCODUycFk3c1c4azZQ?=
 =?utf-8?B?WVpLZDg3TnNacm5RTWJIWDhsUEh0cTF4ZkVzb2g3L2NSc1RWYWtYbzlzM0xq?=
 =?utf-8?B?Y1NnUEQ5RStSSFdlMzJTQlZCOGNIYmpSMWxibHgrVW1zeldxcHptZFEveEdF?=
 =?utf-8?B?amdHS3JaT1BxZm5WVERkZERJNEJ0M2p5QWs2RmVhQVdLbmM2NktHWGhTTUxp?=
 =?utf-8?B?TFowOFJxQWl5eHNSNFdkYUFjeTBoTytPSUtFRHFDTVlTbnQ4Sk9FOStwdTh2?=
 =?utf-8?B?RzZIN1JqazA3WXpCOTFWQjdVSjZUSDgwVkJXMVRhOC94S2RYcXNYcWUyV2ht?=
 =?utf-8?B?YTZCRGYwazl0UytnaURCeDFaWEYvOHQ1L1hxbGl1VGoxaWQ5NXd1WE5aWU9n?=
 =?utf-8?Q?oyWz7pDXH3B4SMAIv8mywIy5g?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d9ec4a09-bfe1-4a3f-0ee5-08dcb211d6fc
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 10:08:07.3712 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MGx2lvhBEi58YFnokyJNr8QCrC4YdOP65H4eZo6iq2pFLp4OAE+GendUHPiYdTPj9h33d0Vvox0kINiqaWbtTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6606
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



On 01-08-2024 15:23, Riana Tauro wrote:
> Have a copy of the value written to powergate enable
> register. No functional changes
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt_idle.c       | 18 ++++++++++--------
>   drivers/gpu/drm/xe/xe_gt_idle_types.h |  2 ++
>   2 files changed, 12 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
> index 67aba4140510..7188542aea43 100644
> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
> @@ -98,7 +98,7 @@ static u64 get_residency_ms(struct xe_gt_idle *gtidle, u64 cur_residency)
>   void xe_gt_idle_enable_pg(struct xe_gt *gt)
>   {
>   	struct xe_device *xe = gt_to_xe(gt);
> -	u32 pg_enable;
> +	struct xe_gt_idle *gtidle = &gt->gtidle;
>   	int i, j;
>   
>   	if (IS_SRIOV_VF(xe))
> @@ -110,12 +110,12 @@ void xe_gt_idle_enable_pg(struct xe_gt *gt)
>   
>   	xe_device_assert_mem_access(gt_to_xe(gt));
>   
> -	pg_enable = RENDER_POWERGATE_ENABLE | MEDIA_POWERGATE_ENABLE;
> +	gtidle->powergate_enable = RENDER_POWERGATE_ENABLE | MEDIA_POWERGATE_ENABLE;
Here I think we should have platform check. Like on MTL, LNL RPG 
applicable for only for GT (GT0) and Media PG is applicable only for 
Media GT (GT1) ?

Regards,
Badal
>   
>   	for (i = XE_HW_ENGINE_VCS0, j = 0; i <= XE_HW_ENGINE_VCS7; ++i, ++j) {
>   		if ((gt->info.engine_mask & BIT(i)))
> -			pg_enable |= (VDN_HCP_POWERGATE_ENABLE(j) |
> -				      VDN_MFXVDENC_POWERGATE_ENABLE(j));
> +			gtidle->powergate_enable |= (VDN_HCP_POWERGATE_ENABLE(j) |
> +						     VDN_MFXVDENC_POWERGATE_ENABLE(j));
>   	}
>   
>   	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
> @@ -128,20 +128,22 @@ void xe_gt_idle_enable_pg(struct xe_gt *gt)
>   		xe_mmio_write32(gt, RENDER_POWERGATE_IDLE_HYSTERESIS, 25);
>   	}
>   
> -	xe_mmio_write32(gt, POWERGATE_ENABLE, pg_enable);
> +	xe_mmio_write32(gt, POWERGATE_ENABLE, gtidle->powergate_enable);
>   	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
>   }
>   
>   void xe_gt_idle_disable_pg(struct xe_gt *gt)
>   {
> +	struct xe_gt_idle *gtidle = &gt->gtidle;
> +
>   	if (IS_SRIOV_VF(gt_to_xe(gt)))
>   		return;
>   
>   	xe_device_assert_mem_access(gt_to_xe(gt));
> -	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
> -
> -	xe_mmio_write32(gt, POWERGATE_ENABLE, 0);
> +	gtidle->powergate_enable = 0;
>   
> +	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
> +	xe_mmio_write32(gt, POWERGATE_ENABLE, gtidle->powergate_enable);
>   	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
>   }
>   
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle_types.h b/drivers/gpu/drm/xe/xe_gt_idle_types.h
> index f99b447534f3..7a8e63f2ebcc 100644
> --- a/drivers/gpu/drm/xe/xe_gt_idle_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_idle_types.h
> @@ -23,6 +23,8 @@ enum xe_gt_idle_state {
>   struct xe_gt_idle {
>   	/** @name: name */
>   	char name[16];
> +	/** powergate_enable: copy of powergate enable bits*/
> +	u32 powergate_enable;
>   	/** @residency_multiplier: residency multiplier in ns */
>   	u32 residency_multiplier;
>   	/** @cur_residency: raw driver copy of idle residency */
