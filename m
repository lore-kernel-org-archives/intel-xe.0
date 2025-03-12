Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 774C1C282EC
	for <intel-xe@archiver.kernel.org>; Wed, 12 Mar 2025 01:41:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11E2410E6A5;
	Wed, 12 Mar 2025 01:41:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AB2xyR6i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB3AF10E646
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Mar 2025 01:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741743673; x=1773279673;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hIkAZiTdoQYzEESw0ydueC9V/hQfzasIMHBnZb2eLsU=;
 b=AB2xyR6i1rUD6AJdlQWK1sqWMl+Xicpco0r/spFkPNknxCw9zA7ZHCTN
 IXQeiay1wz87fWolG7xZQ7ZMZpBYpytheY7d7uHkpVtLgUjHlUhqi/c6M
 XXJEI2kp/gvuskMhVqlMLMNJI/jOdT75HAuYnRmVWlF1U0yP4SKidL7yR
 2YmB4jKg77GRmgMKUjTsIK2csTzsGxYXbemkKS4ozB8ZNHywUajzan2l5
 i/MgqheDoehNW/ib8pzL80UjBgELk+MZrUsGIXzicNRX7RgXSFdBwN38T
 cWMNNKbvV3OJ8bk8fxPn9jmO8n60s5x1sKPX/oHw8YDna9aLOpiFCdUFs A==;
X-CSE-ConnectionGUID: v9yBxzHaSaec/kez+wwTsg==
X-CSE-MsgGUID: WQ1GzUDZTgavUMqEmIa1pQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="42939339"
X-IronPort-AV: E=Sophos;i="6.14,240,1736841600"; d="scan'208";a="42939339"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 18:41:13 -0700
X-CSE-ConnectionGUID: j19ccrMlROidzg+gU5LVog==
X-CSE-MsgGUID: 6lv8CqwASbSGgC1fzD2/LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,240,1736841600"; d="scan'208";a="121180080"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Mar 2025 18:41:13 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 11 Mar 2025 18:41:12 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 11 Mar 2025 18:41:12 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.49) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 11 Mar 2025 18:41:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mqPjUfy4TrjfiClfWlY4PVAe4l6cEULXiFqkpC8nIz8UMjABjciwAliR0ADt7mJeBv2CN3ofD4nI0ZJHRVsZYJfiib2r5phEiB9V0Fyzcrvjc1hQ2WhSAIFAEN0eQ8PW8lU924WxMJtMC9DOOd3khymdFH8qoJ9cZz776YX1IYXCNKUYJQGmOrHdeKHZksvzkJcZOv7d+gR3q9UgRj3oABo7W+2So/0TFCk/B7JPkccZZux3L+ayzD5cvMCP40JzdS+KETpztpMuOXFu3XJV9Y1OGmbZZLvwwT9qtEvflmVpFnLz3v+M6SpnoivesSn7IueDCw+4/kRxdTlSYgBHLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZtDgRqHBBK8U07/X7GNKhK71iLkghr1Hox8NfjvQalI=;
 b=l4jw5HpsqznyBHgOKT6PHiWh+EyBS6Xa8EQO612KMO0/9X6IM1ErJvnJak71s6bjk7L7wKbPLjJpOoqmr5nLfhuugCdL2AwXooRP+LMagX3knWAubo6xY5bwo/i+2xRwE5vR4aubyEPp5QzQ1CpbXyGezFXnrSGvL9iijnVSAEmC+L2ArkKWRCSjTmf97EXGAy1rngQ4vqRQZej50G+ENvFZYrl97Ee8UyWCHYCxWuHKxui3rtT5XsoBMl52NkhRqL5QMXt0X+yThl4nEe3U9X8egSnq940Hbn/rWdVXAQxrPmTZP/u3AY+5UumyJO2CRkP7IIRgaIearo2W30YUfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by PH7PR11MB8456.namprd11.prod.outlook.com (2603:10b6:510:2fe::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Wed, 12 Mar
 2025 01:41:10 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%3]) with mapi id 15.20.8511.026; Wed, 12 Mar 2025
 01:41:10 +0000
Message-ID: <7049c014-1877-4ad9-b757-7aa592ed3aea@intel.com>
Date: Tue, 11 Mar 2025 18:41:08 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/xe: Apply Wa_16023105232
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>
References: <20250310185552.352350-1-vinay.belgaumkar@intel.com>
 <20250311213303.GA1439735@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20250311213303.GA1439735@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR16CA0019.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::32) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|PH7PR11MB8456:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bcc8e90-7b35-458b-ae40-08dd6106f73e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cHR2M1FnYTNSZ3lITmRtOU5kYzZPanhzUjgvalhYQkV0eE1BMm9DaDB0OFZS?=
 =?utf-8?B?bXBucklmYkUyMTJ6TXZSeDVFSHJycUdFNzIzcGxCdTk3Y3BTNFF0cVFRV1lG?=
 =?utf-8?B?NlVUa3VybzhjcStmWUU4UE1LY0VvQUxnZWhXeTBRc09ZTjcrbzAyemNqM1Rn?=
 =?utf-8?B?WUl0LzRTdk1XNHk3aDBvV1RxclRyb2h0RGw5YnBpR0RWUWZhSE1jTDkyUURW?=
 =?utf-8?B?bENaNzRtUm5yKzZUb2tSM0lHaFhTMVNrSUlyRFowem5ZZjVGMXVONjcwUUtS?=
 =?utf-8?B?cDlXY3EybE81MjkxeW03MXpCYVNJQmFiKzQvR1RCZHlZYVpFNnlIZjBxeEs0?=
 =?utf-8?B?L3owU1NxandMOHJ5YkRnei95bnBtdzRnTkpKZktFdWNDZVN0TEdTTTZHZmhD?=
 =?utf-8?B?Z0hYM1VLczgyS2lmYVlvV0RvV0c3NW4yUWZsSmZ6VC90UWxoMGZadlF0NWxy?=
 =?utf-8?B?bmJxR3hXN3JTbWVwOEkxRWhyNGhDczd5eHduK0tCY1ZJNVEwa041NXc2ZWlt?=
 =?utf-8?B?REYvNzlKUEo0Yk5tdVMxUE5WMmVGL1ZZNGJDT0FOOUowTERuVWFBd29VZ0FS?=
 =?utf-8?B?SWRFYllwb21LWHhNUHNQNDh5OTF6akt3d29tcGF0a2RzVURmMFJBZ2d3WXdC?=
 =?utf-8?B?MXYrV0JPZ0lZYnJOaFI5cVl2TllncVordVBsR1lzWlVSR0ZZZ2JqdVRPWVdI?=
 =?utf-8?B?eFBFSCtaTXIraEc5bWtyamFvekdwSjhIQWp6QnIrdjNobUxBeGhYRmVlMTBu?=
 =?utf-8?B?QlEzWldZS3VLcTNsS05neG0wSVZMem5SbmFma3JvbjRuWHRMWUNHL2tPUk5s?=
 =?utf-8?B?M2N3L1J2RDdzOURwa20rL3pFUW14NklrelE0Z3pqMi9EM1pIY0o1elpnQkU0?=
 =?utf-8?B?Wi9tcWJxK25uYjZiWXlJa0hNZ0hlUjJIZUlDeGhKdWdxMkt4OUYwNzBmay9K?=
 =?utf-8?B?aCtlVVJRYkEvVDd0Z2NsRThwVXova1ZCcEEweFljR0NIdXFORS9KZkVGdndS?=
 =?utf-8?B?SzJwRzA0RWxWRW9QYnhQTG1sQStxUHhJVVhLVWErZUxHMStkbkQxQTd4TmVF?=
 =?utf-8?B?UVNRTkw4Ui81Smx5ZC92eXplUFNHKzVZeUUzdEYwS0dWcER6d2VYUlhUUDhH?=
 =?utf-8?B?NlRFdlJiWmVZWTZJR2RoVzRjMHFpbkNiRXZ2ci9WVmpSbExhdzBLVXdBWS9G?=
 =?utf-8?B?ZWlIVlQwMmJNY3B4RzFkS01oU0hWSFpHUGU3c2orckMzcUZ1eUxvdjk0d2pY?=
 =?utf-8?B?b3ZLVkpFTW1LcnRFVndzVllTVFluNmxnZDdzdmhMazN4UUpQc2Q3bHhzRVVJ?=
 =?utf-8?B?WDZkNVRybCthYW14NkcwdnRXNkNBUlJoVS9YVXF5c1oxV3pLdEdGWTY3M0VL?=
 =?utf-8?B?NFBwRXdrTmdZSGIyc0xCUGkwL1AwUENYTzN0ZmtCZVB1cVQ5alNKWWtkbXhl?=
 =?utf-8?B?N3dIMUtQaVZpbXFTdGlUeGdUcWE4RkNKWXh0aklTWmNqTGQ5aDFyUEZoK1ZB?=
 =?utf-8?B?MlBJNXdzeHJIRmdmL0poMjh6TVJ1alk4NFI2N2k3cW1kck95T3VRR2ZaK0h6?=
 =?utf-8?B?dmtUSnZiN1hzUEQ1MlI2eGY5ZGluQmVPdEdvMklkRU8vWUdHT3lTYWloWGR1?=
 =?utf-8?B?bCttT3dXdTBSRStjaDRFQ1VCclEwNEVIb0xYbjJnWUFCcnBUZWtUR21pWkta?=
 =?utf-8?B?amFQTVZsSkYzT0ZjdTg3UEk1K2QzZzNYK1RBcWRMM1ExUDBMelN2bUJIUHF4?=
 =?utf-8?B?V0wyTldWYXlKZVprZDBpTFBSY3g0WlovMHJNZWN0SXRYbDlTV3UxQnJCb3dO?=
 =?utf-8?B?TkpLYmJEVlBzV0FMRzNQVlNKQm8zcTgwdUJpb1dxWDNheFBiRk1iaWM3WFcy?=
 =?utf-8?Q?54SMgslZxu8d5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QzB5ajgwaE1VaWRBUEwrbFF1OVNwOUF6Zm9YamdHeHN3NHVLeEV6emRJckFr?=
 =?utf-8?B?U2g3LzRtYXVjVWxZNHFKYXE5ZEZCRHVlaVA2TjlFeWk3RmR5dXdjV2hPaSt1?=
 =?utf-8?B?THlaaVFHY3pLcEVUVjBZRm5SR3hLTFdOeU9LbG1STEpyblFGd3dhOWJ3VW1m?=
 =?utf-8?B?REJQbUNHREFZZWZNZEN2TVpNVVc5KzZzL2dGcE1LcGNWTktwTHhhSzl6akxY?=
 =?utf-8?B?cG5CNzlPYnM4WklrU1RNTEN3NmhrOFdTamN6bHNSVDdDMWRXYnBSTUVxR290?=
 =?utf-8?B?K0NDd1JrZU1WMG9zdWkwVlR6aVVOYXVCQ1F0bng5dmRvUm9PWVkzYzV5RzRC?=
 =?utf-8?B?Rk1kVVFFRzlZVlhuK3ZNZWRPdmVtaG5Zd3A0R0FOYXMwQUxVWExZVU1ENlVj?=
 =?utf-8?B?MXNodm9QR29lRURsbnNUZU5SbklVSWJnc3ZNTnJrWWlOcXh4czhIMllwSDEy?=
 =?utf-8?B?dUJOc2NYZ0tvNzFId0cwK3JzWWtXbWxyK0hNdTZyQW03WUFUWVZCZjUySUtW?=
 =?utf-8?B?bFpjZnJhdUFHMXEzLzRtTzRWRTBPcTQ5VUgrSGFCdU9Dc1h6d3VtSEJEd3FJ?=
 =?utf-8?B?VStXTWRjZEYrQ0Y3aDArOXlLN1BNYVl5eVdCbEczZVpiUlpnemVUTmdMSGtt?=
 =?utf-8?B?aWtkY3RzbEgyc1llSmJPckdGcHZkV2dwcm8vT3JiWWVpc2hZdzk5WXlZM2ZD?=
 =?utf-8?B?WEVTQ2g3VlEydkRlQXBRYXM2eFFSNkpNd3NSdU5qaXF6UFJBY1pwOStwMFBr?=
 =?utf-8?B?bGFJWDhYd2JjRHZoVHA5Ni9MSzZFZkxlYVdqU1E5ZDZKMnkrSXU3TlFHV05o?=
 =?utf-8?B?Y1QyNldpYnRzUnp0WDhIMFpSR1lsbldvc2pGbS83cVlKaEdEd2JjYi9tQkt0?=
 =?utf-8?B?NU4yTEVyKzljK3Q2NmhxdXVSNDVBTFFaSENONW1HK1ZqTU5nYWVzeWNWSFdN?=
 =?utf-8?B?TVFsNG9CY2VORW9JYlJDQTJ4RlpNRTdYelpLb1psdTZNaWZxdFZmWFFNY3I1?=
 =?utf-8?B?dk9WeGk5LzFpV3FPR3d2bE5WYlFkQ21ZZUc5TTFhMm5zaDJIUWZPeXNNblBK?=
 =?utf-8?B?cHFtNTdBdG9qMlIwVVd6UDYyTkp0WXZvbnMwSWRJdWg1UHUxbEJpRFZyUlI3?=
 =?utf-8?B?RFpxWXlYdHNaalYwNVJLL1JCbDlpTWIrcmJ3UG1RTTA0dkQxYnZKa3VyS2RV?=
 =?utf-8?B?Zzl6UzRpMEVLdk9EZ3hKM0tkdGRVWERYdEkyOGtmaWdGWCtkMXNLVldrZGsv?=
 =?utf-8?B?ckplVHBtbUlLMDBjZTdZZm9aTVNJVEx1ckhxQzBYdWNqWFpUZWZ6TnJza2VI?=
 =?utf-8?B?T3lyeGEwOTNGTEI0NXk1clVVNlFNWEFxSFpUd3krM2VoNUpKbWNJTjhqTG5y?=
 =?utf-8?B?dkh5dkM1bnFDNmNJb3YwOXBKaDIwbEhDNFZnYmgzdkg1TkFsRWVlOE90Q3hR?=
 =?utf-8?B?dzVsWlBqQ2pMazhpS0dRM0s2S3c4S1pvUkJjVFoyUmtCbkVvY21GdGUycUhX?=
 =?utf-8?B?RmRiK1lmdDZlVU9Cblc3eUJCUUh5YVArKzdDTDIwSlFQa3I4YnljRU1URHlu?=
 =?utf-8?B?dlFWeTNZQStJY3BORXJ4NnJVT1ZoVzRaeWVxeHM1YlVXbUM1SCtlc0JGaVpO?=
 =?utf-8?B?NVkyZk5lT0RDdUNPZC9LRENxSlJhMUlBNU9NWE1OM2dRNmx4RFJLUUJXcnFZ?=
 =?utf-8?B?SmJ0TGVBaGJpM0JKZi9waFY5SWx1MGRQKzNDZ0d3V0ptMmY1QU42SVAyTTBn?=
 =?utf-8?B?bmVRTDZwOFV3UEs4TUtmZmFIWmM1eTdhWnU2OHp6VjRUbU9LdGR2NEJLZm9H?=
 =?utf-8?B?di94QkM0MUJvb3VWR3M2NlVlUnlOUVA5L3IxT1J6dXY0UmFKOS8zTDh3Y0lR?=
 =?utf-8?B?MktySzVLK1dhd3RSQzlVMjVMS25FRUtlWnNXckphUXBPRWpucE9zOFltdm1F?=
 =?utf-8?B?cmhXK2piM0RiMmtLV2tjUFZsM3NXNWFvdVFCWUhTclBUZlE5S21JYmxJQWJi?=
 =?utf-8?B?YUNTTHdqcVBZYzRxdG5SdVJkMEcyKzczNmxUclNnbUJxeDRObllrMGk2YWti?=
 =?utf-8?B?R3hCL0hkOU9KWURBN1k2WllIM3VNVkFDd2xSUEJYbm1mTTROTmdiYW9nd0Ew?=
 =?utf-8?B?NG0rbHgyWkw1eEFTMUR5eVhvTlN1ODVlWFE2RkR1M1o5TXc4MFNPUTdYZWZY?=
 =?utf-8?B?Z1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bcc8e90-7b35-458b-ae40-08dd6106f73e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 01:41:10.4118 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AnQeN6QDmXhofBkvycREcaOR7LcTz1OxfDhJDveuFRTfxwlz+w7ftgHyOYweXnLSENo378Id35oZGlNbUG3DuH/NsRVVwhY002wTKkGhSe0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8456
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


On 3/11/2025 2:33 PM, Matt Roper wrote:
> On Mon, Mar 10, 2025 at 11:55:52AM -0700, Vinay Belgaumkar wrote:
>> The WA requires KMD to disable DOP clock gating during a semaphore
>> wait and also ensure that idle delay for every CS is lower than the
>> idle wait time in the PWRCTX_MAXCNT register. Default values for these
>> registers already comply with this restriction.
> I'm not sure about the default value statement here.  For 0xD00, the
> default value is already correct for Xe3, but it is _not_ correct for
> Xe2.  For the delay values, the default for MAXCNT is ~6us, but there's
> no default value documented for IDLEDLY, so we can't really say whether
> it will be higher or lower by default (and it may even vary by platform,
> SKU, or firmware version).
>
>> v2: Store timestamp_base in gt info and other comments (Daniele)
>> v3: Skip WA check for VF
>>
>> Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>>   drivers/gpu/drm/xe/regs/xe_engine_regs.h |  2 ++
>>   drivers/gpu/drm/xe/xe_gt_clock.c         | 38 +++++++++++++++++++++---
>>   drivers/gpu/drm/xe/xe_gt_types.h         |  2 ++
>>   drivers/gpu/drm/xe/xe_hw_engine.c        | 31 +++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_wa_oob.rules       |  2 ++
>>   5 files changed, 71 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>> index 4f372dc2cb89..067468c62adb 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>> @@ -130,6 +130,8 @@
>>   #define RING_EXECLIST_STATUS_LO(base)		XE_REG((base) + 0x234)
>>   #define RING_EXECLIST_STATUS_HI(base)		XE_REG((base) + 0x234 + 4)
>>   
>> +#define RING_IDLEDLY(base)			XE_REG((base) + 0x23C)
> Nitpick: for consistency with other definitions we should use lowercase
> hex (0x23c).
ok.
>
>> +
>>   #define RING_CONTEXT_CONTROL(base)		XE_REG((base) + 0x244, XE_REG_OPTION_MASKED)
>>   #define	  CTX_CTRL_PXP_ENABLE			REG_BIT(10)
>>   #define	  CTX_CTRL_OAC_CONTEXT_ENABLE		REG_BIT(8)
>> diff --git a/drivers/gpu/drm/xe/xe_gt_clock.c b/drivers/gpu/drm/xe/xe_gt_clock.c
>> index 2a958c92d8ea..0394292e777e 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_clock.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_clock.c
>> @@ -16,12 +16,13 @@
>>   #include "xe_macros.h"
>>   #include "xe_mmio.h"
>>   
>> +#define f19_2_mhz	19200000
>> +#define f24_mhz		24000000
>> +#define f25_mhz		25000000
>> +#define f38_4_mhz	38400000
>> +
>>   static u32 get_crystal_clock_freq(u32 rpm_config_reg)
>>   {
>> -	const u32 f19_2_mhz = 19200000;
>> -	const u32 f24_mhz = 24000000;
>> -	const u32 f25_mhz = 25000000;
>> -	const u32 f38_4_mhz = 38400000;
>>   	u32 crystal_clock = REG_FIELD_GET(RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_MASK,
>>   					  rpm_config_reg);
>>   
>> @@ -40,10 +41,37 @@ static u32 get_crystal_clock_freq(u32 rpm_config_reg)
>>   	}
>>   }
>>   
>> +/**
>> + * xe_gt_timestamp_base - Return the GT timestamp base
>> + *
>> + * @crystal_clock_freq: clock freq from 0xd00 register
>> + * Returns: rounded down time in nsec
>> + */
>> +static u32 xe_gt_timestamp_base(u32 crystal_clock_freq)
>> +{
>> +	const u32 ts_base_83 = 83333;
>> +	const u32 ts_base_52 = 52083;
>> +	const u32 ts_base_80 = 80000;
>> +
>> +	switch (crystal_clock_freq) {
>> +	case f24_mhz:
>> +		return DIV_ROUND_CLOSEST(ts_base_83, 1000);
>> +	case f19_2_mhz:
>> +	case f38_4_mhz:
>> +		return DIV_ROUND_CLOSEST(ts_base_52, 1000);
>> +	case f25_mhz:
>> +		return DIV_ROUND_CLOSEST(ts_base_80, 1000);
> Do we want to truncate these values down to full nanoseconds here?  It
> seems like that might cause a small amount of unnecessary rounding error
> when we later use the value in multiplication.  Maybe it would be better
> to leave this in picoseconds for now, and only convert to nanoseconds
> later after we're done doing the math?
ok.
>
>> +	default:
>> +		XE_WARN_ON("NOT_POSSIBLE");
>> +		return 0;
>> +	}
>> +}
>> +
>>   int xe_gt_clock_init(struct xe_gt *gt)
>>   {
>>   	u32 c0 = xe_mmio_read32(&gt->mmio, RPM_CONFIG0);
>>   	u32 freq = 0;
>> +	u32 timestamp_base = 0;
>>   
>>   	/*
>>   	 * CTC_MODE[0] = 1 is definitely not supported for Xe2 and later
>> @@ -59,6 +87,7 @@ int xe_gt_clock_init(struct xe_gt *gt)
>>   		xe_gt_warn(gt, "CTC_MODE[0] is set; this is unexpected and undocumented\n");
>>   
>>   	freq = get_crystal_clock_freq(c0);
>> +	timestamp_base = xe_gt_timestamp_base(freq);
> Would it be simpler to combine these two functions that both read from
> 0xd00 into a single call that returns both values from the table on
> bspec 72056?  E.g.,
>
>          read_crystal_clock(c0, &freq, &gt->info.timestamp_base);
ok, makes sense.
>
>>   
>>   	/*
>>   	 * Now figure out how the command stream's timestamp
>> @@ -68,6 +97,7 @@ int xe_gt_clock_init(struct xe_gt *gt)
>>   	freq >>= 3 - REG_FIELD_GET(RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK, c0);
>>   
>>   	gt->info.reference_clock = freq;
>> +	gt->info.timestamp_base = timestamp_base;
>>   	return 0;
>>   }
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
>> index e3cfb026ac88..7def0959da35 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_types.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
>> @@ -121,6 +121,8 @@ struct xe_gt {
>>   		enum xe_gt_type type;
>>   		/** @info.reference_clock: clock frequency */
>>   		u32 reference_clock;
>> +		/** @info.timestamp_base: GT timestamp base */
>> +		u32 timestamp_base;
>>   		/**
>>   		 * @info.engine_mask: mask of engines present on GT. Some of
>>   		 * them may be reserved in runtime and not available for user.
>> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
>> index 223b95de388c..47dfc403b71d 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
>> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>> @@ -8,7 +8,9 @@
>>   #include <linux/nospec.h>
>>   
>>   #include <drm/drm_managed.h>
>> +#include <drm/drm_print.h>
>>   #include <uapi/drm/xe_drm.h>
>> +#include <generated/xe_wa_oob.h>
>>   
>>   #include "regs/xe_engine_regs.h"
>>   #include "regs/xe_gt_regs.h"
>> @@ -21,6 +23,7 @@
>>   #include "xe_gsc.h"
>>   #include "xe_gt.h"
>>   #include "xe_gt_ccs_mode.h"
>> +#include "xe_gt_clock.h"
>>   #include "xe_gt_printk.h"
>>   #include "xe_gt_mcr.h"
>>   #include "xe_gt_topology.h"
>> @@ -458,6 +461,12 @@ hw_engine_setup_default_state(struct xe_hw_engine *hwe)
>>   		  XE_RTP_ACTIONS(SET(CSFE_CHICKEN1(0), CS_PRIORITY_MEM_READ,
>>   				     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
>>   		},
>> +		{ XE_RTP_NAME("Disable DOP clk gating"),
>> +		  XE_RTP_RULES(MEDIA_VERSION_RANGE(1301, 3000), OR,
>> +			       GRAPHICS_VERSION_RANGE(2001, 3001)),
>> +		  XE_RTP_ACTIONS(SET(RING_PSMI_CTL(0), RC_SEMA_IDLE_MSG_DISABLE,
>> +				     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
>> +		},
> Since this is part of an actual workaround we should put this in xe_wa.c
> rather than here.  Also, this is only needed on Xe2 platforms; on Xe3
> the register already has the necessary value as long as we don't touch
> it.
Ok, will move it. The recommendation was to set it in Xe3 as well (event 
though default is 1), to maintain consistency.
>
>>   	};
>>   
>>   	xe_rtp_process_to_sr(&ctx, engine_entries, ARRAY_SIZE(engine_entries), &hwe->reg_sr);
>> @@ -564,6 +573,24 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
>>   	xe_reg_whitelist_process_engine(hwe);
>>   }
>>   
>> +static void check_wa_16023105232(struct xe_gt *gt, struct xe_hw_engine *hwe)
> "check" makes me think this is going to be a function that returns
> true/false and has no side effects, but that's not the case here.  It
> would be better to name this function for the action it's actually
> taking, e.g., "adjust_idledly" or "set_idledy_lower_than_maxcnt."  Also
> we should just be able to pass just the hwe as a parameter since we can
> obtain the GT from that.
ok.
>
>
>> +{
>> +	u32 idledly, maxcnt;
>> +	u32 idledly_units_ns = 8 * gt->info.timestamp_base;
>> +	u32 maxcnt_units_ns = 640;
>> +
>> +	if (XE_WA(gt, 16023105232)) {
>> +		idledly = xe_mmio_read32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base));
>> +		maxcnt = xe_mmio_read32(&gt->mmio, RING_PWRCTX_MAXCNT(hwe->mmio_base));
>> +
>> +		if (drm_WARN_ON(&gt_to_xe(gt)->drm,
> We can use xe_gt_WARN_ON() for better GT-specific output.  But why do we
> need a warning at all?  This is basically what this workaround is asking
> us to do --- reprogram IDLEDLY such that its value is lower than
> MAXCNT's --- so I'd expect there to be legitimate cases where this isn't
> true before we apply the workaround, otherwise they wouldn't have needed
> to create the workaround.
The idledly is expected to be 0 and untouched in most platforms. If 
somebody programs this during boot, they should know about this 
restriction. The WARN will flag it up as such.
>
>> +				(idledly * idledly_units_ns) >= (maxcnt * maxcnt_units_ns))) {
>> +			xe_mmio_write32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base),
>> +					((maxcnt - 1) * maxcnt_units_ns) / idledly_units_ns);
>> +		}
>> +	}
>> +}
>> +
>>   static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
>>   			  enum xe_hw_engine_id id)
>>   {
>> @@ -604,6 +631,10 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
>>   	if (xe->info.has_usm && hwe->class == XE_ENGINE_CLASS_COPY)
>>   		gt->usm.reserved_bcs_instance = hwe->instance;
>>   
>> +	/* Ensure IDLEDLY is lower than MAXCNT */
>> +	if (!IS_SRIOV_VF(xe))
>> +		check_wa_16023105232(gt, hwe);
> As noted above, we can adjust the name of the function to indicate what
> it actually does, and we can also move the XE_WA check to here:
>
>          if (XE_WA(gt, 16023105232))
>                  adjust_idledly(hwe);
>
> I believe the not-VF check should already be handled by the XE_WA check.

ok.

Thanks,

Vinay.

>
>
> Matt
>
>> +
>>   	return devm_add_action_or_reset(xe->drm.dev, hw_engine_fini, hwe);
>>   
>>   err_hwsp:
>> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
>> index e0c5fa460487..0c738af24f7c 100644
>> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
>> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
>> @@ -53,3 +53,5 @@ no_media_l3	MEDIA_VERSION(3000)
>>   		GRAPHICS_VERSION_RANGE(1270, 1274)
>>   1508761755	GRAPHICS_VERSION(1255)
>>   		GRAPHICS_VERSION(1260), GRAPHICS_STEP(A0, B0)
>> +16023105232	GRAPHICS_VERSION_RANGE(2001, 3001)
>> +		MEDIA_VERSION_RANGE(1301, 3000)
>> -- 
>> 2.38.1
>>
