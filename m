Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B89B3C982C4
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 13:22:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7161610E0FA;
	Wed, 16 Sep 2026 13:22:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iOrWnjY3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DAF310E0FA;
 Wed, 16 Sep 2026 13:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789564937; x=1821100937;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jZpyx/0P2oishcM0el3IQdL/eb4oKGMcNYiDzv2XeiE=;
 b=iOrWnjY34tOwAbmxgkqPK7OC7wDZLvfRAT1p+wRqiv0hI900Yqzzptit
 xGezUvJ6npsx2JnvfUvu/jiBA59iefoYGl1iLaOMNg7C+OCpWPBPuQgSR
 1Z3RAHaGGhlr49sEokzxqNlLNDsFQfTBqT+gA89J+uzAQMNjVqd9MPZkK
 e4i1l8MXKVd/IKvM0RXXj0cOliIDteMrmoaAIP8mfLaqjZuPsMyUIiItB
 jJmopNy2pzx0AGv5VTNWHnsSvJJrhYUd4pkp8Qb6URT/PIQmcJzmd3O9d
 nn2EwMFAaC8WisD6K6r2RfMGc16DCKpS/Fn7DWLb8mCNhiewelCGEIJA7 w==;
X-CSE-ConnectionGUID: Evbbp+zqQMyCRxa4F7m//Q==
X-CSE-MsgGUID: VfZmamPGRCWsET8zXVfO2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89959500"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="89959500"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 06:22:16 -0700
X-CSE-ConnectionGUID: T/s472npR3ariF76ANgw+A==
X-CSE-MsgGUID: E8+ttz9PSmeW627XiJ68EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="311627022"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 06:22:16 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 06:22:14 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 16 Sep 2026 06:22:14 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.11) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 06:22:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pZJRWDCFBODBwSvjrkHH1m4WUt2R93N+dlHKoyMVZYiRLrArL00Th6HECtPkp5E83F6b65SzcqUj/0Nn8QNFmI0TvwPvAenUb2jGs7bK2GMeNn3FyyyhXVcChj0Z5eEjjfoHPAHCdILhCiTm8+XE5LumiJYidM6mONjh//8MQKBFmVzuBzVSc6EN5ygg3okKZ2szaGUuEI2wkrBndftQEZu704Iu0JFwUI3Hl9Dh+FegNRM5WPlvVUr2Sxe42kW2T4rcBLphn0KQqYQ7Se7PIXeeNXKh7mN1iSnnn014NVwpzzSyE31xsEM1kBVuPBB6Cgg6TH5OGx+/ciOsMi4BuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9XaGvM0GOWtRY9yQZyu0o7OzgmnWp1Yihw34tCAiOI4=;
 b=vEGvr19YdlBF9bzq6kePZEjKlAKcPSQMb5xwhWo+mPCEvFVqJDGCZoI6+0HNK7lFe/xcG0EhcViI9k954/0LkFWHKQ96jUd2bBGra3jwwJZM3Hhd0yNHT/ACrOxFu5/NvQhvoc8WOnVV+UR+4T0lDsTczxUesNVqxz0usYxYE0Hva/rLCW+DHA3Y2rkvhhYOBMqSG/mY088HOikF807SZPmHy7jAruRtYxpCdgg1YHl5PatjgasW8ybLIIR6PgywlkznYGBJKecnitfVnvdTtND5UcfqCvlSlwE5JOo4UPS4FKEUQ4OzIUl+vSX0rhviaooeaGC+dT7obFwVs4u0gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by SA3PR11MB7534.namprd11.prod.outlook.com (2603:10b6:806:305::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Wed, 16 Sep
 2026 13:22:11 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0406.007; Wed, 16 Sep 2026
 13:22:11 +0000
Message-ID: <dc3cc526-44cf-47d9-b45c-7fa63c42d9d7@intel.com>
Date: Wed, 16 Sep 2026 18:52:03 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/13] drm/i915: Give up on DSB/flip queue if we fail
 to allocate the color DSB buffer
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>
References: <20260909161730.12969-1-ville.syrjala@linux.intel.com>
 <20260909161730.12969-2-ville.syrjala@linux.intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260909161730.12969-2-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0298.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21e::8) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|SA3PR11MB7534:EE_
X-MS-Office365-Filtering-Correlation-Id: 09279857-50f7-4885-fb2f-08df13f583c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|4143699003|56012099006|11063799006|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info: SoX3VNBbxd7A5IANiUspoTvtqG00K0YBLiWu/lI4k1S0zvVUn5YqIfuw5zdiPKhkOoJZ4YKsSRx6qT+1teGJUoe9G8aFo/5JT8JEuMqHfq2GRXlV+F5UKeFxzPof/ul1EPNDbzspmiXwzevOsU7eG8wNnN7SopwL49ghOS1J6WLEjyIJOmKlLU8ZwPInyMpp88V4PPfWM1U1Fab7hI4fi5m5MxNIgzdT6IPA+xBBCZlsddWvQ+wPHJuKBKau6NmlUOIPdJcHxlHujfRFoJRhRznfzVSsGHgSQqTMfsqHkg/CprpOWQ57YvUQ4WyLunsOpTbuiXJfaGFArTQicNYcxlACd3FFLZeUftEBb2T0ZF9YRj0ZjOqx8usS1jRESehuuDYSdGpignp+VCVbWht9UNSQ4ELyXBAWJ5aLyuocWS8FDYz2rRWTcfnQgpr14edSWrbKVDl6y98QmYEPgKIGLRO765EddkP2e4XWHM/gxtYzy7V1AcMMPmkWbxoQakkIc3IaIlKrSzwnRp+1aIuuIQ5gwSifJWB2fntbYNAXjYcqGDfdUK1AIz8Jt8NRSM1sezsC+9UthopDViaQe4tRZGs8XQakY8C1xaCrzGW2rs0jQFoCV9IAf59NaP9b+KjZoGsGBos1rxnMyYOG/ybUSeHmCEJjJ+BZdx3uBLefWgo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TDNBYzhTOExHQ1FHSHppL2JtUG5vMVRWWGNCM2ZtREpYNytLT1U5b1M2N3JH?=
 =?utf-8?B?SlllVWkwV0pIZitCMzF6NG1oZkduY0lxdmpzdy83M28yYWVnUVFmcVFaZ3B2?=
 =?utf-8?B?WXRLTXMwRG9lb1EyS1p3L295UDg5RlkrSk5Od2xpa0FMbnI1MkpidEJPQldz?=
 =?utf-8?B?MzdiRzdrY1FXUXM1WU1CbWZ3Q2hzWTBGdk9WcUIwbXZENis2dGI5ay9SdG5W?=
 =?utf-8?B?WGlqU21NL2hQZVdNcHBRWXlZWVlDZFF3WFZUSWUwbHZwVFBrbjk4TWdOdHk0?=
 =?utf-8?B?Z1ArMEhYbS85ZVJrMktRMXhwNnNoSjF4bXE3OFg3Q0Y0bVNKVnU5eDlxSFh6?=
 =?utf-8?B?QjBsTnF3am1OVE83NXBGMzNxbElCUG9hdjM1VkI2Y2NyUzYrUW16cStwcXhD?=
 =?utf-8?B?Sk9DNkpEc3YvRXVRNGZLMEFNcXE2cjBhR0hsZVhPbnk1UW9ocDZEa3ZENHJ5?=
 =?utf-8?B?UWhFdEgzUHhiZS94WTNXbjRNNUx3c01KVjhvYjVQdEZScTBwaS9DaG5OeVN0?=
 =?utf-8?B?MHdkeXNEdkxXa1QrSTg0SnNqNmJrcGtUVkNvS2Ntc1kyWTl5VXNURjJmTUMv?=
 =?utf-8?B?Ky9adVl3UzdHZFFuOFRycGJyYWpXbnZyS3piZTgwYTBjSjRKWEdIRzNFeDFk?=
 =?utf-8?B?YWpLejhmWE82aGRTSzZDM1B5Rm1kMC93REJaZlVmMmRGdXdJenFLYmpPaDNU?=
 =?utf-8?B?MmFlTENZMVRGd0pTMnlOYVFNalZKbVQ4aDFWeHViS3phZUZwY2lWeERFNC9k?=
 =?utf-8?B?N0xsOWg5ZVZaYTBSb0QwcHVpOVVnTUNHbk1lVnFBK0lKYXE1REhvVWo1ODB3?=
 =?utf-8?B?MnJEV09mYkdlYVY3dXgwczZ2TzRvRVJ5OVJRdkpsZE5KZUFxU2dNRDBRT3du?=
 =?utf-8?B?MURGOUFCSUpZN1MrSkxYcXVOaEtBS3I3Z2cxOGRXemtrckdiYWtlaHJWSDNF?=
 =?utf-8?B?Q1MyUnlCc3QyNE1BTktYS3Eyc1lVYlJUMEZhWEpFYThFdUppZS9mQWZvSHc3?=
 =?utf-8?B?UlRlWDhHenZYY2U1K25mWEtwOU5CUkZIMGVkVE5DRnJRc3diNk9iSER6blVY?=
 =?utf-8?B?b2orRjByQmlNRzA1eTgzRHBObU1wL1hvbno2MkFwQi8xVnhDKzR5dTFBWGVs?=
 =?utf-8?B?Y3QweDcvcWkzMndTTGtaYTlSRFNTL3NHakVtTlZCb3FVT2p1WHdzdkc3QnNK?=
 =?utf-8?B?aXpMSDI4QTRMdUtSVDhCbDNJMkVFVk5NaTNXOHkxaTNtL0xTcTl3c3JlZUlZ?=
 =?utf-8?B?SWdOR3grM3lXMzkyR3JWR29DaThmb1ZUWCsydHgzQURBdlpLcGRFalVRMU14?=
 =?utf-8?B?YjcvdUdYQ0JhZC9pNW1wT2xhUVdZTWJFZFRRUUhxT2xRTkRFNzU2Nko2Yi9Q?=
 =?utf-8?B?K0w2bGRSZmRTbFhROHpqRWpsY0F2SDJRS0hja2xyRzZOeDBGaTdqOUVpWGov?=
 =?utf-8?B?Wk5JNTBnNk9pYXR6NHFxdzdQc1RSMERBY2JVbVdVcVJvUS9CemZhT1EvWTdW?=
 =?utf-8?B?cmRySmdQcDZZSVBuaXNFUXBIeis4Z0xoNXBXdlFLNG9YQU53eUNIdVJyK2JG?=
 =?utf-8?B?dk9MV2kzbGdWNHpXVStaQmNXQzZaWTdrQzJzUUg2ajVkS2FhRzZVK29DOTRs?=
 =?utf-8?B?RnNMRDdGdUw0NmVlSEpST0Z4a3IrdFJUNitpaU00b1d4TTVZeGYwUzVNZVQy?=
 =?utf-8?B?K1kzcDQ0b3JFYWRybXZWbzJyZDg0ckhZNnVoR1o1VkZPbE9ob0NreUhnWW1Q?=
 =?utf-8?B?cWNLTGNINS9jK055enZVMXlJblFXLzdUU0VGVzBuT09ubWM3dTYwejFUSEZy?=
 =?utf-8?B?VVZCQnBFa1lBVWJBWVYydWVrRkZscVF6VklYcXNwTDZsaGVZY3g2bGczdko2?=
 =?utf-8?B?SXQzNFdhNGJRZ0QzQWJ3K1VWem02eEozVUFqYmxJd0Rna1JmR210V09SWHIr?=
 =?utf-8?B?cTF2VXhrK1NHOTY0cVZHbXgzenBqMkZNVW9EM0RWRFRnWWtHK2IxTUsxS2ZC?=
 =?utf-8?B?Zi8xVU0ybVZ3eDNXSnN2ejFOakUxM3VMc3AwYmYrT1pBeVhNTE5adGdYOGx3?=
 =?utf-8?B?eTJROThuc0U5RVR2MjhFREpGRUQ1V3VUVWhXeW02MVdVU2dTdjFPUzZDT0My?=
 =?utf-8?B?dnE2c1o1MmtLUEFwdDRncVBVS2puZ1RqUEljRnVIQXE1NWxDM21jcjVmTzZF?=
 =?utf-8?B?ZXJGeVc3d1ZFeU1pNVVUSGx5UU9kUExXSDNZM0xMUVZJZ0RkWllFY1pHaXlI?=
 =?utf-8?B?bSs4NmFQMmFVdEFSdC8ybXhlQVo3RUtESTYxZFZkYU91V0FXQTFWWEFLQXFi?=
 =?utf-8?B?MExSL2ZORVg2VHFucVZ0eEl2U1BKOGNrMm9Kc204ejYxYTRLVlhEMjBOYXJx?=
 =?utf-8?Q?tdbsFx5Wewg2aYvk=3D?=
X-Exchange-RoutingPolicyChecked: 0oAp7pnDHZQJKDDtS1XvTMhBbHMTymLtD5+6hbPnVUvimzaVBwEMc2Akar2tXFv7MCjDROsk2aeSY8i8dZi/veCe/KBDdNWUIQ1j0IvEBOInYzD7qo4JvH7/xBDn8U3KARXQOHRWvohTI5WpSSVXgFXiREKPekWWVKwn3AAS2gV8zoTOk4/cfdc8fvxpQ+4UKAtoDs/h649scIhvE3SHKeuabpmupefF9I6rvGv2h5EXgTCkw3AdoVcX23wvquPaNcaYawZFhp4oIbVwfvrvgxwqe7GGgJZIRIlhiuL0GkVrlQS8YNL4gvXWUF6SAlb2OGVMsFMWQAqtvmLlfMkp5A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 09279857-50f7-4885-fb2f-08df13f583c5
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 13:22:11.1759 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HI5YaCDvTewZ7xRbqo2YMHgnQLy+JfIl44nH0z7HI6xseCvGOGbK6pfqNn2A39o/I4naxmrL8nhQd/K8X+YE0UxZQvzEolM1oqQzHtrIcng=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7534
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



On 9/9/2026 9:47 PM, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> We don't have a codepath that does the color LUT update via
> MMIO while writing the double buffered registers via DSB/flip queue.
> So if we fail to allocate the DSB buffer for the LUT update we have
> to fall back to a full MMIO based update. Make it so.
> 
> If we hit this with the current code then the entire LUT update
> is simply skipped. After the fix the entire update, including
> the LUT, will happen.
>

Does it need a fixes tag?

Either way, LGTM.

Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>


> v2: Keep the use_dsb check in intel_crtc_needs_vblank_work()
>      for the case when we need a color update but we have no
>      LUTs, and thus we can end up doing the update via the DSB
>      with intel_color_uses_dsb()==false
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_color.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
> index 87ced9f6ff40..26e92221fa19 100644
> --- a/drivers/gpu/drm/i915/display/intel_color.c
> +++ b/drivers/gpu/drm/i915/display/intel_color.c
> @@ -2028,8 +2028,11 @@ void intel_color_prepare_commit(struct intel_atomic_state *state,
>   	else
>   		crtc_state->dsb_color = intel_dsb_prepare(state, crtc, INTEL_DSB_1, 1024);
>   
> -	if (!intel_color_uses_dsb(crtc_state))
> +	if (!intel_color_uses_dsb(crtc_state)) {
> +		crtc_state->use_flipq = false;
> +		crtc_state->use_dsb = false;
>   		return;
> +	}
>   
>   	display->color.funcs->load_luts(crtc_state);
>   

