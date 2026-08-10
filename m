Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 119CEC5AC82
	for <intel-xe@archiver.kernel.org>; Mon, 10 Aug 2026 07:52:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6EF810E1D9;
	Mon, 10 Aug 2026 07:52:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RUG0MZPP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 530FB10E485;
 Mon, 10 Aug 2026 07:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786348351; x=1817884351;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xLYguQgJTiyTQbjopSwRGnJTgnsnz5yP9YVQZxy1/KM=;
 b=RUG0MZPPQV8kckE51t4jDBUL+lsdxQ8KacTTJsAOskWdhEjqxTkmlvst
 ddkU8zCfB+bDXvPkePcDD7bnJb8hwwsxXKBevs2rKiWGacjuYSC5G5KHg
 n8MOl4jYTGOKFvf6FNweLQXGWtvVYYThNuU1Gtsd8ImEojm9lq3Q2eqwQ
 L9kKI3pDFQZ6g7WKGnKcuhfDybuyJ9VD4ZXFrIQtuJR7P+wt1cKhreU0N
 QhQgTNG8sg/QrVkws+Vw5kT5QCNpUkwLcpkageUeexGU6hDMorYgcKYDt
 MFn1h6RNHrq2KqyFWpn7d5VQvcgdHHypLDeMMv7O21CaSR4G8YgEvtibr g==;
X-CSE-ConnectionGUID: Ah2CqtQTSdqSrUWbtrmU6Q==
X-CSE-MsgGUID: jDfree4QQ4u2Csax4/tCOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11870"; a="97452651"
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; d="scan'208";a="97452651"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2026 00:52:29 -0700
X-CSE-ConnectionGUID: qZxhE62DQwab1+k0by9low==
X-CSE-MsgGUID: PeTADqRISwqPR0rysRQDXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; d="scan'208";a="292890234"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2026 00:52:23 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 10 Aug 2026 00:52:20 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 10 Aug 2026 00:52:20 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.47) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 10 Aug 2026 00:52:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OFlBR7rQNxAZrwBo/GKSC1nglfXCXi/qR4VcEUp+cbNOIyhRi9LUo/MdIi9qGHRGCyG6r9IfSRBOcMNyY26ofrSHY+9Q+GmHbB0KT4QOkq4ELL1Kyy97yYpo/X+c3Ypvc97MqMzPUjORNz2mLZESY3MFD7gk6zfrxQDtIVmhwrTqyg9NyGp5kULLw/nwllTmT35K5W20sC1MxhP4yuJB5pXsOW43JVKfrgodV4w9aU9uiw8wvtmGsMi4qRheTCmtz0PF4lSVwVzlLYAFA1H4a0fjSFZe9E/dWDvci9ZZEoORGE0J6n1g/t6aks+rTO6Zz/2uLqghXgRMky07shYTFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U/U3dQNgZFjLQ78VQs+nnPw1bIM9NdtnHIVMMCEa+1Y=;
 b=rM912B4ZRddKkzZITHwtemP6RNhC6rTXHomML5/0JFrRpd+prBWV8J3mHA+DgQqOHhTRHhY79ExWz5bEri8D3Nxs2thAKXOVi1VA25F0gBYjJXZivBUG1JvFzkPorLfCqhi3e7LVZyb+E/CVe/m/Q3V10LktWrJLGqtooyPAE/Lm/jDe1bTeyRTQWiHv2R+SmT997MScgJfNb5yKPinhX1ZyTQhQ1QoHE5TWn8ME69mrwunUiJzcoW5JAa9Gvj8a7yBfuQ6J76laHnns1EttVqPP6FjqLm46qgIZd/NYeHhhNAqatljZseZQfFW8qXcND5RJyHLybPCSjTHVc49H1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB7554.namprd11.prod.outlook.com (2603:10b6:806:315::9)
 by DS7PR11MB8828.namprd11.prod.outlook.com (2603:10b6:8:257::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 07:52:10 +0000
Received: from SA3PR11MB7554.namprd11.prod.outlook.com
 ([fe80::3ec0:2280:db82:d67b]) by SA3PR11MB7554.namprd11.prod.outlook.com
 ([fe80::3ec0:2280:db82:d67b%5]) with mapi id 15.21.0292.024; Mon, 10 Aug 2026
 07:52:10 +0000
Message-ID: <9d6931a5-5917-409d-891f-b85137f42933@intel.com>
Date: Mon, 10 Aug 2026 13:22:03 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/14] drm/i915/dp: Add a wrapper to check frl/tmds
 downstream constraints
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "alexander.kaplan@sms-medipool.de" <alexander.kaplan@sms-medipool.de>
References: <20260730105226.2731341-1-ankit.k.nautiyal@intel.com>
 <20260730105226.2731341-7-ankit.k.nautiyal@intel.com>
 <DS4PPFE901A304F27F70C793A494504597FE3D52@DS4PPFE901A304F.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <DS4PPFE901A304F27F70C793A494504597FE3D52@DS4PPFE901A304F.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0236.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f4::10) To SA3PR11MB7554.namprd11.prod.outlook.com
 (2603:10b6:806:315::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB7554:EE_|DS7PR11MB8828:EE_
X-MS-Office365-Filtering-Correlation-Id: 42692144-828b-482d-2cf0-08def6b44846
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|22082099003|18002099003|11063799006|5023799004|56012099006|3023799007|6133799003|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info: Bph5cO8n0lbT2bYipTznmAWuOixLNKKcrjp+1/qG38K1oar7VFpLr4xuv9fIU8dRZOqDTb8iTtT+xWh/gCkSf4KeYwX6wfwgN1gxovas9HiHYylXu5F6Xp7xCStDnbMHLF6Hbwg3RZA2OTFXyaeQ18gCsLesgyO0FPVK3kGDG9Wb9VCqjnDSlCOwLnxC8STRuTtCOj4fl1SjKPJz8o9jk38cL/zfE1bz36/nMCwIlJbcNgWdu3vztk9YjdjPRG6Qy1IHEHDDR3uS5nI+Jo16UVdGdw3LOB6voCWb9HQ+mwdHH1199y3TfP6fclIGrtdFho4q9TsMuKAI7mxVilNkMzHVtrqsW76RPy8pFoUSzt5ODcOAaNNhbZXltZb8bvH6fMgc7WHmn6/wAjv5/uV06N9qkVV4IH4++y2p2C/XltWBq6REvSmkfqfJNTlh4ZS0KC7ZtwocDWXaZtILbw2NK3YtJGWkOglHkRMCIHgvdehN8Db6QGkPCatVHQvzBrt75qWNFpPTabmBBvUpV1cPFXJ+mp1LXRw+/25Gy9SSdKtdqUpLXBzh0vWAAM++4pdiVCaOTfTBkkUkouU9ByBU7Ff7n2L0pGIzIyUlAHu/ERY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB7554.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(22082099003)(18002099003)(11063799006)(5023799004)(56012099006)(3023799007)(6133799003)(4143699003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NmtiMUdpVDlaVjVPajVqUW5Ca0ZrcDhmS05MdWZqRlBGN0V3WnRIaHBiREkw?=
 =?utf-8?B?ZEFQa3E4eU5QT1JvWWxESEFvZ2VlbnNmYndMQk1pTzNXdUFraHl0ZjN1YmU3?=
 =?utf-8?B?VGpENnZWNkJkVS9mV3d4SEJHTzNTQVVCcGx1YkxQWHgyOWlvQi9TVW16c0d6?=
 =?utf-8?B?M3F0bG9aRHBQK2l0bStxY3BNS1hYci9zY21EYkhPdUhTc2FJTjJXWnFRTEFP?=
 =?utf-8?B?SVZTaWFIM2gvT0VjOHhyQXdUTkhxSlMyTWpqTmFRbWZINWR2MVRYZTFoSjBx?=
 =?utf-8?B?a00vOFNuQVZDazBwVCt0SFQyZmpxZUl4QzJFdFhVOVV4Y3VOakw5MWNFbmlC?=
 =?utf-8?B?TTdQL3VzTmZVSHlvQTV4VU5NTW85a1Q2a3hsaGJWSmxGYmUyVldlTUxXR1dp?=
 =?utf-8?B?V2dIMXFjaGZ6ZDhML1hKUURFZkgrTTMxU3FPU3hCTVpaamNxZVNmOWJzYWpm?=
 =?utf-8?B?OS9lVE1aTFBRZ0NhellTYWkwaDVVUXJxTmRiVll6a254MS9rMUpsdnlNWXpr?=
 =?utf-8?B?dmYzV3Q1cEpyQVlWVUJueFBhbDdFN21ERVN4aU5FbTF2NFE2dVVJMEpQaWFn?=
 =?utf-8?B?SWQ3UzdBS1FDcFVxYkdsSWhPNmdnblduR0JXK0JEUkkrWDUwR3pza3V0RHp2?=
 =?utf-8?B?dVA2MStRZFRXc3FKem84ejUrNUFaZlBDWFd2UUdCZnljSUxMWXJkSSttRElz?=
 =?utf-8?B?STF6MzhkRlJtQUU1Smpxb3hETHBmK3RWQ0Y2b3E4MklPbldTQkNyK1BYWFBN?=
 =?utf-8?B?MjVUUjdGK2l4ZElyWnI5dklvNlZoTWhSYjhRRVAxMlNzYzU4NmFtMkpkY2lK?=
 =?utf-8?B?QXNTWVZMeDVldGhBVUxtZVh4d2dNenljbkhOYjlsRzlOTklMMThEdUZINTlX?=
 =?utf-8?B?MDlhQ1lLY3lMV3FsTEhPOUpSTU8zRWN4TGVyZ2ZwSmJqaU4vU3VoSWVraEVX?=
 =?utf-8?B?SXRXeGIzN3lLQi8zNEYrN21KZ0pqMGRCR0JlMlFyWXR1NUY0MTA5em13dGdp?=
 =?utf-8?B?SlVlQnJlTFZ3R1RuQStER2gwLzFBMm44YjUraHdWL1NvNHltbjR0Y3FXUlVP?=
 =?utf-8?B?ZmprMnRBaWt3djFIY3UvU3JLUDhKYXNCODNaRUpEODNWelM4UDhZUWpQOFJC?=
 =?utf-8?B?Zm5ZWVhYQjVqYVdpMzNZd2xaYW8vU0lTd0h0SG5PL28zWTdqY3hSVStDQlZk?=
 =?utf-8?B?RVpTaTh2UlovQW5yQjF4OEwxaXpKUTRvbEdTSkFuTjVqaThIOVR1UHBoZnIx?=
 =?utf-8?B?eTRCM2JTVE4wc0JzZXZuZWxkdnU1bFRXanVNclpaLzhVeXEzMVdVLysrb0dv?=
 =?utf-8?B?a3lIRFBzOEdSMElpeVhRWjF2WDBac3RYNW50aVFlM3graW9SK0ZtVldrcG94?=
 =?utf-8?B?NkNoNHdoT1NpcWREUjlTRzc4WGlEL3BqTmVDS1o4NVFBOEFDbkFKRnhHUnJn?=
 =?utf-8?B?YzkrekRXSHdXNjVLaGE2Y045alptUktKSUViNHJneExwQjZvbm9COUN4QlVm?=
 =?utf-8?B?WGVScTcyM2NadDVLR1poUnRHWURSNXBTT2pmekZsMGw1aWRLMytlV1gyeGFL?=
 =?utf-8?B?UlYrcnZjMTlFSEJZaDJXckpITTFDWTJtL1lPQTNNMzZ3Q0V2cHNzdEUzaTJQ?=
 =?utf-8?B?ekgxcmdyRFRpY0tlT0dkZHUzekdrSHoveWhSTjl1QjRGK0ZlNjRuaXFDMUxQ?=
 =?utf-8?B?MDc3Ym9GQ0RVWXFDSk9kTkp0bU9peXlPazNDUnFhTWY3QmpydG84b2F1eEV6?=
 =?utf-8?B?QW5qYWIrWmp3Ti8reGhBeGVidUF6cE9zMDFiY2NtTlBhL09VKzVHem44MUUx?=
 =?utf-8?B?ZGFpK21GMGdxQXpOYUh5MWkra21ic3VORitvdUJucUs3VEtFL1R2aFhETkQ0?=
 =?utf-8?B?SGVVOTNkbEdOODdXbHI1SE90TlQzYWh3K2REZmZxOTlVb2d5c2NZczgrdFla?=
 =?utf-8?B?cWJRazYzLzR0YkZTTGczSVB1VjEyZmtKTTNxSXpKSkIwNnhTK2pjRE5SUWhV?=
 =?utf-8?B?NkdCc2srYk1RL2NNYmp3WDRlQTJjRWVZUFNpZmhGbGFQeTJySVI3cXdLcEF6?=
 =?utf-8?B?aVhoVWxFWXRTMnNxazROV1U0SVZWSWIzNmR4dWh5bDRuemx6V3NyMUNGRjYw?=
 =?utf-8?B?V1NrTmwwVVd2N3laSHcyVlIydzVOWnNJUVJXOGloZm9tVlBqTU9OTDlXQTNx?=
 =?utf-8?B?aDBoZzdRc1BWNUJpUS80SGZQYndDT1kxR1cyczlld2poVUhVZDNYRWpsYy9C?=
 =?utf-8?B?NEJZNnVCWTN1TXFuQUp0REphWWF1YU1PSzA3bmNqZE92RVhuNnNiQzRkRnRM?=
 =?utf-8?B?YzQzcEdudjNPSGhjUW1KMTFlN1d4ZHllcm5uMVBuU3Q3NVRxNjZYaVBOOWpy?=
 =?utf-8?Q?m3wecq6qBsoCeZEs=3D?=
X-Exchange-RoutingPolicyChecked: dVFMQJU37rhoILBjgZwI7Ex7JXitALnT3D0whSyx/+k/xRKq7iK59LyQ3N1B6sCj5j0tmmKpfwpDtpADnrgdyS7beS272FnZSV8omg9y8yzSiRE8zxHFWQjlSuDIWe5pL1ZhEYN66GOPc6nKgx/p6uUbg/KQOajj1GlJ2WNRqUNT6tfVzMBeHSN0oa4mSa8XDX1Mnpu877hu2IBNzqwh9ZlZQTdODUN7uB6szKm6WOC5G99ZOOKNznhY0SUELDVd+TK2r2AUWS2Nkf86JED4dYaJbXO0qPalKTDLqedwfP2n7mpDw/PlC7JFQLZSbAX7vBXRXHcKKg9a+MwFAmgRMA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 42692144-828b-482d-2cf0-08def6b44846
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB7554.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 07:52:10.3940 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TRSpcRGVeIb6TgLlxOfCeb9p8MVYNWAcgP/h3PQdUGnp0IeS7ONLjH6oaYJj8GBC2OV2Wam1yBgkuSxbeBNwsj2uPh1YO2oqxemXVWPo8N8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8828
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


On 8/3/2026 10:50 AM, Kandpal, Suraj wrote:
>> Subject: [PATCH 06/14] drm/i915/dp: Add a wrapper to check frl/tmds
>> downstream constraints
>>
>> Add a wrapper function to check dp_downstream clock/bandwidth constraints.
>> Based on whether the sink supports FRL/TMDS the wrapper calls the
>> appropriate FRL/TMDS functions.
>>
>> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>> ---
>>   drivers/gpu/drm/i915/display/intel_dp.c | 36 ++++++++++++++++++-------
>>   1 file changed, 26 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
>> b/drivers/gpu/drm/i915/display/intel_dp.c
>> index eb76e6b6d616..6bf42128a81d 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dp.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
>> @@ -1206,6 +1206,28 @@ intel_dp_frl_bw_valid(struct intel_dp *intel_dp, int
>> target_clock,
>>   	return MODE_OK;
>>   }
>>
>> +static bool
>> +intel_dp_pcon_sink_support_frl(struct intel_dp *intel_dp) {
>> +	return intel_dp->dfp.pcon_max_frl_bw &&
>> +		intel_dp_hdmi_sink_max_frl(intel_dp);
>> +}
>> +
>> +static enum drm_mode_status
>> +intel_dp_hdmi_bw_valid(struct intel_dp *intel_dp,
>> +		       int target_clock, int bpc,
>> +		       enum intel_output_format sink_format,
>> +		       bool respect_downstream_limits) {
>> +	if (intel_dp_pcon_sink_support_frl(intel_dp))
>> +		return intel_dp_frl_bw_valid(intel_dp, target_clock, bpc,
>> +					     sink_format,
>> +					     respect_downstream_limits);
>> +
>> +	return intel_dp_tmds_clock_valid(intel_dp, target_clock, bpc,
>> sink_format,
>> +					 respect_downstream_limits);
>> +}
>> +
>>   static enum drm_mode_status
>>   intel_dp_mode_valid_downstream(struct intel_connector *connector,
>>   			       const struct drm_display_mode *mode, @@ -
>> 1213,20 +1235,14 @@ intel_dp_mode_valid_downstream(struct
>> intel_connector *connector,
>>   			       enum intel_output_format sink_format)  {
>>   	struct intel_dp *intel_dp = intel_attached_dp(connector);
>> +	int bpc = 8; /* Assume 8bpc for the DP++/HDMI/DVI TMDS/FRL bw
>> check */
>>
>> -	/* If PCON supports FRL MODE, check FRL bandwidth constraints */
>> -	if (intel_dp->dfp.pcon_max_frl_bw &&
>> intel_dp_hdmi_sink_max_frl(intel_dp)) {
>> -		/* Assume 8bpc for the HDMI2.1 FRL BW check */
>> -		return intel_dp_frl_bw_valid(intel_dp, target_clock, 8,
>> sink_format, true);
>> -	}
>> -
>> -	if (intel_dp->dfp.max_dotclock &&
>> +	if (!intel_dp_hdmi_sink_max_frl(intel_dp) &&
>> +	    intel_dp->dfp.max_dotclock &&
>>   	    target_clock > intel_dp->dfp.max_dotclock)
>>   		return MODE_CLOCK_HIGH;
> Does this change maybe belong inside dp_tmds_clock_valid ?

This change indeed incorrect.

The 'dfp.maxdotclock' tracks the 'maximum pixel rate for analog VGA 
DFP'. So we should not have this check at all.

Basically we are checking:

VGA : dfp.max_dotclock

HDMI:

  - TMDS : dfp.min/max tmds clock and related stuff

  - FRL: dfp.pcon_max_frl_bw and related stuff.

So I will remove the FRL related checks from here.


In some specific case, if there is a hardware where the dfp.maxdotclock 
is set even for FRL capable sinks, then perhaps we might need some more 
check.

However, such specific case need to be handled separately.


Thanks for pointing this out!

Regards,

Ankit


>
> Regards,
> Suraj Kandpal
>
>> -	/* Assume 8bpc for the DP++/HDMI/DVI TMDS clock check */
>> -	return intel_dp_tmds_clock_valid(intel_dp, target_clock,
>> -					 8, sink_format, true);
>> +	return intel_dp_hdmi_bw_valid(intel_dp, target_clock, bpc,
>> +sink_format, true);
>>   }
>>
>>   static enum drm_mode_status
>> --
>> 2.50.1
