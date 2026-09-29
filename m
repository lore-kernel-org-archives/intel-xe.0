Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 330E8CA5FA1
	for <intel-xe@archiver.kernel.org>; Tue, 29 Sep 2026 06:34:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B72B010E9A2;
	Tue, 29 Sep 2026 06:34:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RE2/KlhF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8340110E9A2
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Sep 2026 06:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790663682; x=1822199682;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ND32qMI5JIOaCnqqVRVEixQy4FTGk0rwbmK3ysgrVik=;
 b=RE2/KlhFXYuy0T+ON4ct7w1tLsSRYtYje9F1noPbbbskS03ycYhgySLe
 H26iqMzxejV9WTOiDAdFuRGQcgxm/ENOKPvCQsnQNhn1rWNaz3W9t5ZIa
 sbm03tN0OcA9qF2ACBnUEom1Qus2l8YeIMjOJqW+ujSvBojmqh+NJAWm9
 +ldbEJ/ldXBPR27Bu0/O93p8+yGahFN19d1ZRMFWrSeWdH/Lv18dTzRFo
 GkRcfX3FL1zlTGkdJZR5jHUJ2o4ok5MrOb9BJqVaNmI/zqhxqpS1FlryL
 2vfXh5HPC5325/n7D0UxPWNGKDLKezuf8xg1WSMSGWAh0gXyfP0FMA7El w==;
X-CSE-ConnectionGUID: vA4kWputS0m4c6F0FLtvRQ==
X-CSE-MsgGUID: 2hSab3LwQaCu74XFH6Jrnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="116902950"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="116902950"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 23:34:41 -0700
X-CSE-ConnectionGUID: f5Xu+ebwRbOfgCllkVP8xQ==
X-CSE-MsgGUID: 0cRQXwzJQMyCH3pOfMmv2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="274826427"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 23:34:41 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 23:34:40 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 28 Sep 2026 23:34:40 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.52) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 23:34:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qxl5lRStTZKLmssMD3UkVk8Yte6qWxDUhyKKKkW7KLvt7mNUOe55PGTEnGVpqxOpZlj6gk6o5ucWW76x7LTiulhDvzmzWwAFwj/K5rbR0+fi6CVjzeURFVfObspdFM1+rmFeB1oSWvJknIowrZtGEmIn5n5fgMbyPrSW6yFjciEgBqIGEqxflmksDZhAXbAexEVw4Z+YX7PoZKX/1qp+T/FELcD26WFQEmvPXYfk59x0Mt3u+ktJ2JPmAQgUDwFpzC5oM/BDE+HzsaqnCAneozjCPuXkq46pfKoma0+JIJwVQ8QofCPmaGp3eidiFJYVml73KcQG6vvXJg4ZiXtYgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jb5AVmxlQbPaW5SVfu9uv229FjyhX1s0Ocr8f7qZqDQ=;
 b=wxyh0SVmJCnqENZwhJKdCQqWhlkEFdZefU8yKnZQboJWaxmRH835TMJLF6rdEDdeviK04+q9wvEfb1Gdzy+obeZv1vhFZ6cjLs1PL+OOEkyA0LSssIvTbL9ABrGE15w21DwI76P7Xx4qUX7WTPd5lCfTSi4xgSwm9D+5cHSeoyxqvVVq1bhomCVwbWM4NIGnbV1kpjtq33MSHQ3heLJLTIawytAk4waxi9xuiNwqU29AeL8/VcEG2lWrh4B8v1K4svD8OAj3aBbNJxVotn8rKmUpyYoY6eVJ/2uioDrqIwKWAziychWyle4MS+z8E0U3lRukhiDw7+PgiMScJC+Mig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by CH3PR11MB8657.namprd11.prod.outlook.com (2603:10b6:610:1ca::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.25; Tue, 29 Sep
 2026 06:34:38 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%4]) with mapi id 15.21.0451.014; Tue, 29 Sep 2026
 06:34:37 +0000
Message-ID: <3a78eb91-78bc-437e-b8e8-70332581717d@intel.com>
Date: Tue, 29 Sep 2026 12:04:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/12] drm/xe/pci: Report unknown GMDID versions using
 structured xe_log API
To: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <michal.wajdeczko@intel.com>
References: <20260928092114.1610203-1-dnyaneshwar.bhadane@intel.com>
 <20260928092114.1610203-10-dnyaneshwar.bhadane@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260928092114.1610203-10-dnyaneshwar.bhadane@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0150.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b9::8) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|CH3PR11MB8657:EE_
X-MS-Office365-Filtering-Correlation-Id: 53c6d052-3159-4d83-8083-08df1df3bbdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|4143699003|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: nHRaRs3+RjZUUAvJ9Im1pCodQfcG6wsmpWhiaeZnE0rPKUTZ19jHsj3ZTeVRihXLZQmT3yROVbFBP32qLH5EB4+G9W/cAU+wuWVrAansLS3iiXspBYreh4YSQaWvqiHda12bRgrya/ql/sJPHxc52b4jWW5/5ppceqJs+jAVv2FUDwg/ba98Amkr78pK9yESTTJoVxVTtej65m04w+5cI6Qnac9vnNgyKf/eVXXufjE3hw4mV3743rIjpKX0A0v6Q3hOa+E7c/7tKaNwtOU0bSTRBfWtAH0qp1LQX/EG5rfjf4+XoCj4fVBClkJomaTfmkbXtcaWUBRB00TBJ+S0fl+fbumlzfoo7xf7pFS3voTTk08p1z0qRphABQUWoI4Jdh7MXeUOM5htb8ns15rXrjVbFpdS4oYnq5Dz18geEoOqO+cJ9KxMwERMmfQYD4KPDKgaKZgtK+26AT31S0+zsCf3vg0pHHQOEqslMfFok2H4Lwtk//8evDfbwTGwyWOwaLAsl33wH1dTm9p+EUR4NYmK1vzSYLB8mTRiok41CkDG6H/8KIzmlOR3So542KzqRObhFMIhQfMxNxOykzijvN1Q66dMCuForDnBLXt9Srf9f2/OfZ95RrltapC+vwLWpv6uQjsZ2pTZstZ9oAIMztEqcJTEnKTPka2WRAZwdN0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(4143699003)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZnNncDhDMTh1dUsxb1FyWWQ4OUNEL0RVM1J3SmsyQzNEVGtGY3Y1WWExVS9h?=
 =?utf-8?B?YkExUVc4MDNDczhGTXlXRUJFKzJDbTdBZ3BGNC9MWWR0eVpiZmdVT09pNzAz?=
 =?utf-8?B?SndjQ1crNG44WWxXS2RxdmNZdVc4bEVCSTVVclhlVjRvQVRQZUxqeG9rVEIx?=
 =?utf-8?B?bURNV0hLNFBTSzRmZllBc09WeW05U0x3QzVXdmZva1BETkhzZlByUzduVVZl?=
 =?utf-8?B?Y3p5TDJVZ09GQzV6MGEra2JtODJ6V3hjTEZoazEwVjZtK2pTMnhqZ2lnRnVQ?=
 =?utf-8?B?U2U0dHN2VlBPY3lYQkUyazNrSmJmb1RwbUVhSnBkeHBvU2xLb0pDNXZFajkr?=
 =?utf-8?B?R1ZLOTQzMFYzODBZTUFzWmduSWljeHM2WG1ldDM2NXpGUjdZUnpibWhaZWFP?=
 =?utf-8?B?NkNoRzAwc2lZN1BHYk5XbHRwbGNmK2RJNDJCZnBJYVpFRWZJTXV3cFF2aWx4?=
 =?utf-8?B?N0JxTnE4TWxPaEZEV1dFNkhGZzR6eGMwOGJNNzBLdlFSQ2lRMENOb1YvMzRB?=
 =?utf-8?B?WWNNOGl6UHdEL0ZLRkNoSXN6Q2YySElsT21tSlNQb1RXd3RoeWRkenE4WWpI?=
 =?utf-8?B?Q2NoY215US9BZDRoUXoyc21GbWRjcnFMcHE4eGwxWjF0STlpTmZoc29kK2hN?=
 =?utf-8?B?Sk05U3pvbWVUVGsrekVZaVZjd3lFRURmWngwWkMzUWV0N1dONkJTZ0xlZm5H?=
 =?utf-8?B?Q2Zja0s1WnI1YU9RTS9xcHA4MXB2dUNCL0V3dFpQVlFEZnV2QnFPYlFtV0xw?=
 =?utf-8?B?OXp2OWxVK3V3SWEyQnpEN1JITEFpTHBQWEl3aVJTS3hTbzU2WmI2Snc1TWx3?=
 =?utf-8?B?d09UQjArNU9LVFNyZ0hVNGFaNEJwanRwRXp3eHBVUzN3ZGtWMTlhcmNPZFlu?=
 =?utf-8?B?WHlZMWZodTh0QSs3SVFJVVMyeUpmcjhiTTRWaHhFaHNlSHlNK2pIYzVUb1dQ?=
 =?utf-8?B?ODhLM0ZwZmhhd044bkFQaXdYeHBLRUsxek1PblE3MmNoUG9Ca0lpekF5UDRv?=
 =?utf-8?B?UC9hME5hS3NObzFwakFCendJdktoZy80Z2pTZk1ZV25qcXlkOCtuZEE5WHJq?=
 =?utf-8?B?QTMyUmZYNXE4ejcvTEU0VkxobU1Da0lJTTNFZS9zSUlyWC9KYU9PaFNmYUlF?=
 =?utf-8?B?M2ppNjJhZXVvaERnMTQ3STFtMjlvdis5ZEpsTzNlVVd0M29YOEZYU3FUWWZ2?=
 =?utf-8?B?VjVSK3A2VmZDR1lTSGxyVmJhbEJuRHFpdXl0RFFrQWJ0RzBCcHBSYTdKS3RL?=
 =?utf-8?B?MHI3eWJteGtEVUxrSGYrcmkrUURjY0NIWW10R1gwY1R6RGszYUVpVWVOcitT?=
 =?utf-8?B?YUVlcmd1UVp4aVcyNVBzNGxkZVRRcXBMbEpZOXRGaVdiZEpHMENpdjJwSTNU?=
 =?utf-8?B?Q044bUx3UE5LQ0JuaDR2bE1POXpkNHRtcHh3WGExUmNHemF6clRiRlIzUDh5?=
 =?utf-8?B?a2xNSzZ2RlpvQXdjbmhKTS9JMmZyTGlvOGtXanFUZytNR2lKRHM4Y21pSzVX?=
 =?utf-8?B?bVhBOEUvSzRqU3JLQ3ZSNWRybm9ETDhtNnZFZlBDbVJrM01DUW9MQXd3bEE5?=
 =?utf-8?B?S0dmNkp6Q3VLcDVCMUtWeFpOS2xNRWFhWmpWaW8zZUdPMkk4d1VlOUJtOWJR?=
 =?utf-8?B?QU5zaUY2bjFYRjRDcnFzd2RScVZaVG1CK3dFc1N5MTRwbTgrTXB5bnBLcUgy?=
 =?utf-8?B?ODdmSGExS3lyUkw2QW1HK0RqQmQ1MmVERnQ4VTA3L0orNWJ5WnVaSzY2TWJq?=
 =?utf-8?B?aGZGL3FWUmN6d1QyaC9FMzBIc2ljUlpqRWpWTGlMSUZ1Z2RIdjBzdThpMldl?=
 =?utf-8?B?RmJzYUpJSWNEc3F1S0FkWDVoMjB3YVkvMmd6aGU2eU9ZYVN3WEVOczhMc0tN?=
 =?utf-8?B?MnZhS3cvZ2ZTL0NOdTMyK0UvbjlOUWQzcUZmTGRlbkxYSUtuTVdRblE4SkhE?=
 =?utf-8?B?Z0drZHVhaW1XNm8wSWQ3VXJSalkxbkhnaHBnaW5SVjlWdHl4NUVJS01heVl6?=
 =?utf-8?B?S3lRaWdtYWxtZ0FtM0ovaFMrV1BKZ245S09PV3JyK09xR2l1OVJZQzlJTXcw?=
 =?utf-8?B?Rk1PMjdMYzZiZWY3alEzaVdLK05CbEJlcEVSSWlyVUhGb0JTLzRWUlVXWmRu?=
 =?utf-8?B?ZkF6OFlzWnQ1OXhBZ0dtcTlGS0l0d3VXb3gvZHUxczJLcVJoZzZvY0ZSTGEy?=
 =?utf-8?B?MlhaWW83UGEzUEsxQ3JKZUdVVFkybU9xaHNJamFadU9sUUNDYW5uZEtFNzdD?=
 =?utf-8?B?OTF2am9mMkVzWjZ4eFUyZXZaRzhXV3Byd3dQaUJ5ZjJpSnZRMlptLy9GUGtY?=
 =?utf-8?B?Z2ZFUHdldEdtVDZiamZMYWhJd3poanB3Q3YrTVQxbklCNVhTZi9xY3FoelZI?=
 =?utf-8?Q?sOMz0IDTfivyDj9k=3D?=
X-Exchange-RoutingPolicyChecked: YXGnsMdifxZjfFED3X9qTFpt5UF4B2c4yiW6249FTHkCeTyDCXw7GlANXbXPVeFW4+MYWJeLa0VeUHRQQJbQwp0nU2Njw2JZF+RkRn2MiXugKhSalRlxgcinW+2p2qF03CnsffE/JuvX1E925WpMONJ3wrbQvcUIpcZcK04oIZLZjf4kGcEWPvhuwVsg3pGPMZtReThBsFnA5cskrVKqn5YKt9hLkNboP77aDYv9yV0AUZTNN7rAxQfMQvmAZd29WoWYVSjeDKz/NhQ8imOZe+PmR4qcxY+qOcLUf7NHK5i3OOUXSr0cFALNv6c5W23s40Jt8k1iX+/6ExIhKE4Yiw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 53c6d052-3159-4d83-8083-08df1df3bbdf
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 06:34:37.7684 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dnFyUKiUwM85TMQytQcLasKWISrUy2xL3j93wsE53wWeDfVgsK85SMe/Sd85NwwFMOMq39bFvo0tms95PQJmmsRv/XvLIBf+NF/oHKUMJgw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8657
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


On 28-09-2026 02:51 pm, Dnyaneshwar Bhadane wrote:
> Replace drm_err() with xe_log_err() using the REGS component tag when
> hardware reports unrecognized graphics or media IP versions during
> GMDID handling.
>
> Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
LGTM,
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pci.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 620f8a75086f..9089ded5fa44 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -719,8 +719,9 @@ static int handle_gmdid(struct xe_device *xe,
>   
>   	*graphics_ip = find_graphics_ip(ver);
>   	if (!*graphics_ip) {
> -		drm_err(&xe->drm, "Hardware reports unknown graphics version %u.%02u\n",
> -			ver / 100, ver % 100);
> +		xe_log_err(xe, REGS, -EINVAL,
> +			   "Hardware reports unknown graphics version %u.%02u\n",
> +			   ver / 100, ver % 100);
>   	}
>   
>   	ret = read_gmdid(xe, GMDID_MEDIA, &ver, media_revid);
> @@ -733,8 +734,9 @@ static int handle_gmdid(struct xe_device *xe,
>   
>   	*media_ip = find_media_ip(ver);
>   	if (!*media_ip) {
> -		drm_err(&xe->drm, "Hardware reports unknown media version %u.%02u\n",
> -			ver / 100, ver % 100);
> +		xe_log_err(xe, REGS, -EINVAL,
> +			   "Hardware reports unknown media version %u.%02u\n",
> +			   ver / 100, ver % 100);
>   	}
>   
>   	return 0;
