Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1001ECD98CE
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jun 2026 03:09:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63AD510EC71;
	Thu, 11 Jun 2026 03:09:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UnOj2X4R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D684110EC71
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jun 2026 03:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781147382; x=1812683382;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=utxGIttphu5NPy5N/l1uQyPjOHHSj4tEtw447WiEo5g=;
 b=UnOj2X4Rzwn6Z1W6b+DfHvN3/Mlg8J2N+omkKYkAiBZ9XPgxUcA4GIVS
 ByCLzhCZInLBe77eYIxH/1U9bnVBYXNocI0ZIW6EsSTPQ/MCFPkQiMy3m
 2YKZD+G7taseJYV5jbz/VobjVXE6PLtzABifXP23Ykfn1FgE0R3JfYDh4
 rlcdwarzGwxEDNI/eLVRBXaHLltCR3SwbnI7UMu7+0sb5KlspLi914o2O
 rdReax4SbeexurA4m6VP27COEWu8vxOxp1UN7VulTjyz6Gr9gbj7laQ+r
 XMiSOaPpNEG1H+TvddEtvOHG30G3GfvPsw35Qglit8i56M8dcDUUoNDWk A==;
X-CSE-ConnectionGUID: vYvvgJ06TJmEqHHkwUKDNg==
X-CSE-MsgGUID: x6325AMhTsCEHVhP/CgI1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="93342734"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; d="scan'208";a="93342734"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 20:09:41 -0700
X-CSE-ConnectionGUID: ru8w+6x9Sl+ufl83j8f2qQ==
X-CSE-MsgGUID: fOxFeM1LSfOO+PyRHPjwOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; d="scan'208";a="251454707"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 20:09:41 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 10 Jun 2026 20:09:40 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 10 Jun 2026 20:09:40 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.67) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 10 Jun 2026 20:09:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gMLZHb2/qkUsM7VGculiXVUOPJ2wg30HQlhitvxHIZBLlZTp8/F646hvFRcjTXnrUK7lpoFihdt4zYqlyeP2OmUHWrCae5401FLZfFnltlaCdAIpjcTTSiPZqc71jWI0+FMImrGlL8GrZW1oDNfJ/OsEUNZL4NWja6sO4VnacuoURC6IUotSbHfrHolGG4egigYBRuj6GyxQFZUqcVsNzkObYA/77cBs0N0bjFIzmKC14BCBkSX5sYqVZoFNSEnYG02gzqtdj9q5cCgFUbye7xYU/zqTMnPoFOj4Tql7q9EDJZYETwHHroqU5Hrz78j6AkRwc+jzc915SUbViIMr1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C/N3rfWU0v3mdqq9jsQcnbQV0Mi7p7QdmPbS0FGUBCA=;
 b=l4noLGIO0DuKJmCg0DtbpGyQTLmASpQFotNjthf46cZdbyeCwwnsijnVr/dyO7xjgEuYIZHXA6qMxzvZkeZCxpxI1RbF6KIHYlyVIK556Wbl2FlWjnlcIi+5OeFa97RXl7y1WfP3T51JBd18SdfuZ+3K+zLniUHD4rrl979Mzno/hbKD0elnnFjmNLul+pLgwfzduljg6KzIccjoxUJbkV7kE8LSp3rdEPCrQKgxQm7xGPlDjiTDSyv4nbS7vPCItZ7YQjON2H5qH24dqKDcEUGgujWByH1bIXtTk62nuy1lZeuyrOpNVc9lDZ+05uMVhtjvr23M8PKcFFCfjVJ8Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by LVUPR11MB9565.namprd11.prod.outlook.com (2603:10b6:408:39e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Thu, 11 Jun
 2026 03:09:36 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0092.011; Thu, 11 Jun 2026
 03:09:36 +0000
Date: Wed, 10 Jun 2026 20:09:33 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Zongyao Bai <zongyao.bai@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <jia.yao@intel.com>
Subject: Re: [PATCH] drm/xe/forcewake: add delayed-release optimization
Message-ID: <aiom7bfet3CddhLq@gsse-cloud1.jf.intel.com>
References: <20260601213804.707256-1-zongyao.bai@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260601213804.707256-1-zongyao.bai@intel.com>
X-ClientProxiedBy: MW4PR04CA0366.namprd04.prod.outlook.com
 (2603:10b6:303:81::11) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|LVUPR11MB9565:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a0962c3-478b-44ba-278b-08dec766de1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: br26N1uinKdDOWICcqtiCDpCZpfVGB9zgUCc0Lu1lowgparjjcpbIRLDoK8ppLHAdiwuTSaNxeqoOy2CpDIppwUfc+3Ng+3nscsqJMjyBTXEICtLjFjtiUt05ADNTD700/ENp6W3M6NwtnHMWIakJJoUkrQ/G8RoW9d4VLQrYJ1ybP4oVML1yvOaVBuX6aN5bc0FZlgEdDZoBNMJsnjLUfbQraUmRi+AQURD0del0mqhoSi6Nx2Q5m/Ki2WxZUQPeg5ENBO871p237nsZsrK1FFwqLWBGux7EpEzOkgyBQPkzg3/2HbA2UVVoWj/kMB/55k3IhJf6K3A8FPAXQTcRDvxVhGtekCt7CaBcmweW4uaT+dVHwN4omLeqKFrak17vlkthIzJdaafz0Y16qB1lBdjnRCvKootHS1pBhbFL8TsnOarxeTf1sr6l61npSyitaNke0X0YeS6UVHRypW73D1Ov0lPCPDU3eHV69va2lYVOjd4wbKyVcxwU9iWYzfu+ryZd0dcKHs+3+ptdEVwyKgTGjXrgNHkoJ6vcsnwfmCpye9QqpsTLmSM9ZdkuUliPoW9ILQqaSrf3E62p5VslBxTaHpznd/D6RDbW8+iQSH5tz7d55Au7OB189dUVhTL48DhNhtAX5hfK6dFoIqCllcuhNbsetIcEE9g3g1vmH48zBCjTPfntkxQPfN+HKYb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(22082099003)(18002099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGQ0TnUybE41eWNuSzdjZGdXV3UxbzFHYUpQNmFRcmtVRUs3WEhkZVdlclRi?=
 =?utf-8?B?LytLRlRiQW5MMjMxWW0zc2xHTEFmUEUvUDF3SDNGSk1ObHFHTGRXL3g2U01z?=
 =?utf-8?B?Q2lJOHFWODRuVnZDU2pqTE9WaHNxVDRPb0N2V1lWU2VyNmFNSWRscXZ2NXNU?=
 =?utf-8?B?L3dod05BWGxnUnZQN0lJVm53Ny9KZFRpKzQ5cUMyM0NkTVA0SU05WUxVTWlZ?=
 =?utf-8?B?SlluMGMrRlhYNFNBbmxXK0ZMS3lNcU53TytvN2JtcCt1Wm9iNDIxSXR2a0tk?=
 =?utf-8?B?N0VFNG1Yb0dWU2VYTExhWCtHdnBFc2RLcUdIQjk5cUtVM0pNSHhoUlphMjU4?=
 =?utf-8?B?enlaeENqcG4rbnJQbXpsRVJWcDNJZWFKSENvYTZVcUtJZmFPcmg0RmpaRS9r?=
 =?utf-8?B?clRENEJ2Q0lwcjZOaGhhemNLeGM4blZ6WGpsakxTUVFVWDRNRkVKRXl6MG9O?=
 =?utf-8?B?YURLVjN0aHRLcXZrczlESVFVZ0xNTUh5WXRLQVF4VWplbXQyLzJKcmNGZ3pD?=
 =?utf-8?B?cVk0RmVVN2w5RjJQaXZSZVlDeWYxbGFFclpaSlZWQnF6SW1jeFhDbEdaZVg2?=
 =?utf-8?B?eUxkRjNwQnVqdjJRS2lwRE1kZmNYU0pzdVIwTVpMdDBTZ1JPWWFIS2dFeFZR?=
 =?utf-8?B?SHYrVFZCWEpnQitKUXVxbHJKRTduVmdTME02ZStZRVpHNW5UQUNkZTNHL1pP?=
 =?utf-8?B?L1NVNDVFY1hLMGxUNmUvVFNyWXRpNWs0NDQvNEVWdm5aZVhOajhlV01oR1Jm?=
 =?utf-8?B?ejR2R2Mra00zZ0NTQzBQVHZDR2tJMW1JQmdOUlJERlJobzU4QjlCOXVseWls?=
 =?utf-8?B?MW5zWHZKY0VQUTJRZktvWkMrdkFwU1lYUWJnK1M2TFlSbmtEOUQ0Um5pMEdX?=
 =?utf-8?B?ekw4VWgwZ2xaU2VYSksrMGo3dkY4RTBENWFoSWQ0ZEpxMmR1TUdkc0oyaE1m?=
 =?utf-8?B?R2o2NThXOFloeTY2WVZqRTZ1RFJEYW1yNnBMRjZidjNhNFhvYkpETGRhc2RG?=
 =?utf-8?B?Z3puc1BQYTdhamM4K3Q0ZEZheTkwVUdZckJSSEwxVXd6dEw3bjZWekJKWkk5?=
 =?utf-8?B?N3dOZWV0aGp2MEVaTEtRMml5d2E5b3Q3T3BGZWhJamNIUWtscDg3eHB2clNS?=
 =?utf-8?B?MWFncElDb2JtMWlsbkk3a2x5UzhsMTN4RkFLU0g2NkJvU3pJTCt1djA2Vksw?=
 =?utf-8?B?dHlhRU84Qk1XVGoweU9SVUxTVmpzNUZQMlp0cWpweDBQeWtrMUlkeDJVbTRS?=
 =?utf-8?B?VUliRUhWOHFKZHgyVkZKM2FIV2lpanBROVhhTlkwQmF2Ung1YWlxaFlDa0Zj?=
 =?utf-8?B?VTVWSlB6WWZuS21SKzNCR0c4RGFHaHZpUTdtczZYaHYxQVFCTkh1a0FsemZN?=
 =?utf-8?B?NnI5UDYwai9VTFh0aFVtbGJGVjQ4eEZyRVFKSzEvTEprTnRGZ0RVanJtSUd5?=
 =?utf-8?B?bXJXTFlzMC9VR21MaFNZb0dLeENJVmZSRWVJNWEreDYrSUlMbXJyakl2ZHBU?=
 =?utf-8?B?QVcyemdKMjBURkpmRytwTXcvTDhCQUZYSCtENktZS2NjeFNLeUpPSW9wc0ti?=
 =?utf-8?B?Umwrbm1lZHEzU1RxM2tjYTBDTmUrRG5mZXB3WmVWbFhydG4wRUxkYXE4NUtD?=
 =?utf-8?B?REIyU0h1K0RVWGJHRXFaN1ZmRW1NTXQwOGVjN3JGd1B1QXVBelZBTzJHWlV5?=
 =?utf-8?B?bVlQUXgvd2lmdjRJa1FOaG41aDdabHVFdW5LTVJVbDhtQjdaMDF4bFBWOWt2?=
 =?utf-8?B?cnlaU0RKYituUkhNNlZPTG42VWxId3ZCbkNIZE81ZnZ2SXBkZkVPd1BBclNh?=
 =?utf-8?B?enBScjhJVllENzBnR3VENGZ6TWdmMnU1aFM0cHpLOWc4YXkvSzZUNVo1WXc1?=
 =?utf-8?B?TUNITDBqSGdUd1B6TjBYNm1qeWg0LzNkN0lMTzBJQjdtRGxsN1hVZ0tlZFYz?=
 =?utf-8?B?ZXpPNmtWS2g0SlJVeG4wTzI5QktFbGo4YVFrMUpXa3N5Mit5UTVhQVZObDh0?=
 =?utf-8?B?amJaYjhwQzNRdVNONUhOaUYwWHY5dlJDYmlRazJlNytaa24zSTRkeVdHb0dT?=
 =?utf-8?B?YmNUTnR6NUcxc3pDSmtqSkFLdnJEVHArMzFiSnpDZm5uMkVtWEdGVko0a25a?=
 =?utf-8?B?cVJTNDlMVDNvRTdZODF4YXZrbDdBWWREbHduL0Q1a1llZHJLUFJPU1VzcVB1?=
 =?utf-8?B?cVROTEdFZmRObHhZN1lTR0RFQitmWS9NUEdjY1pHaXA5UGorUFhLMkc3QUFK?=
 =?utf-8?B?MTU4WTNRMlFTbFRKZlA5eVpMZlRvNEYwVWx1UFdzUFNYaVEydXlEeDFlclJO?=
 =?utf-8?B?dDAvTHA2UGpQRU14cG1uM3o5dmpCZ216NEhweURGWUw2MnJsbXVGWXBQbE5R?=
 =?utf-8?Q?UoLcuSNTJ1Jw/UL8=3D?=
X-Exchange-RoutingPolicyChecked: Uq05b+1y5K1wikyv8Glj37qt8sOPjqPDhms9boIh6Lz4u8skcBJREANxCPLqU/vdTZxBY2zr+b+d0z2EEvqNlG2kkkJpdcpMT2e5OqY/ZfMVNlbNFazJ6Jcg6fmqsswqSYPX6ePP+TwvVEdHUrz7MZBJgzS4BfcqoIS4djOCLokWZGmoXLY0vk8ChorKOCAMvpP0caC+84vHUx+351+2H4VcST03quvfJQ+S/wu/IrdqK02wt6rE+k6O6hsXqiIr+ZNIUvQjdKAw/0oWf1vp1YShggA96UBOSJAAvrQQ9m7unNNYEwhR6FRcAaghbn1jfttqA8yyxqSv504fL8R1Ag==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a0962c3-478b-44ba-278b-08dec766de1b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 03:09:36.2553 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fnmRSVC6r/cqSeQTwUoofl3Tm3syhl0dgFYWUq3+VVNgBZ14q1hduEKberm4eOprE6LVnhg7eq3H7ruw88LDVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR11MB9565
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

On Mon, Jun 01, 2026 at 09:38:04PM +0000, Zongyao Bai wrote:
> Add delayed-release optimization:
>     - Add domain sleep 200us after xe_force_wake_put()
>     - Skip MMIO wake in xe_force_wake_get() if domain still awake.
> Reduces frequent wake/sleep cycles for back-to-back operations.
> Examples of scenarios: zeDeviceGetGlobalTimestamps read by VTune, PTI
> 

I think this concept makes sense, as MMIO read operations are relatively
expensive in terms of time cost (perhaps ~5 µs). However, the downside
is increased power usage.

Should we make delayed release an optional call—for example,
xe_force_wake_put_delay—and only use it in specific critical paths? For
instance, we could limit its use to paths tied to Level Zero calls like
zeDeviceGetGlobalTimestamps.

This gets a bit tricky if xe_force_wake_put_delay is called and is not
the last reference, followed by xe_force_wake_put being the final
reference. However, it should be straightforward to track that an
delayed put was requested and have the final xe_force_wake_put issue the
delay.

> Signed-off-by: Zongyao Bai <zongyao.bai@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_force_wake.c       | 111 +++++++++++++++++------
>  drivers/gpu/drm/xe/xe_force_wake.h       |   4 +-
>  drivers/gpu/drm/xe/xe_force_wake_types.h |  11 +++
>  drivers/gpu/drm/xe/xe_gt.c               |   4 +-
>  4 files changed, 99 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
> index 197e2197bd0a..183a17fa6d68 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.c
> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
> @@ -6,15 +6,20 @@
>  #include "xe_force_wake.h"
>  
>  #include <drm/drm_util.h>
> +#include <linux/device.h>
> +#include <linux/hrtimer.h>
>  
>  #include "regs/xe_gt_regs.h"
>  #include "regs/xe_reg_defs.h"
> +#include "xe_device.h"
>  #include "xe_gt.h"
>  #include "xe_gt_printk.h"
>  #include "xe_mmio.h"
> +#include "xe_pm.h"
>  #include "xe_sriov.h"
>  
>  #define XE_FORCE_WAKE_ACK_TIMEOUT_MS	50
> +#define XE_FORCE_WAKE_HOLD_DELAY_US	200

How did you choose this value? It seems like it should be something
configurable via Kconfig or configfs.

>  
>  static const char *str_wake_sleep(bool wake)
>  {
> @@ -27,6 +32,8 @@ static void mark_domain_initialized(struct xe_force_wake *fw,
>  	fw->initialized_domains |= BIT(id);
>  }
>  
> +static enum hrtimer_restart xe_force_wake_domain_timer(struct hrtimer *timer);
> +
>  static void init_domain(struct xe_force_wake *fw,
>  			enum xe_force_wake_domain_id id,
>  			struct xe_reg reg, struct xe_reg ack)
> @@ -38,11 +45,29 @@ static void init_domain(struct xe_force_wake *fw,
>  	domain->reg_ack = ack;
>  	domain->val = FORCEWAKE_MT(FORCEWAKE_KERNEL);
>  	domain->mask = FORCEWAKE_MT_MASK(FORCEWAKE_KERNEL);
> +	domain->fw_back = fw;
> +	hrtimer_setup(&domain->timer, xe_force_wake_domain_timer,
> +		      CLOCK_MONOTONIC, HRTIMER_MODE_REL);
>  
>  	mark_domain_initialized(fw, id);
>  }
>  
> -void xe_force_wake_init_gt(struct xe_gt *gt, struct xe_force_wake *fw)
> +static void xe_force_wake_fini(void *arg)
> +{
> +	struct xe_force_wake *fw = arg;
> +	struct xe_gt *gt = fw->gt;
> +	struct xe_force_wake_domain *domain;
> +	unsigned int tmp;
> +
> +	for_each_fw_domain(domain, fw, tmp) {
> +		xe_gt_WARN(gt, domain->ref,
> +			   "Forcewake domain %d still referenced (%u) at teardown\n",
> +			   domain->id, domain->ref);

Is the warning above actually valid? It seems fairly normal for a fini
to race with a delayed fw put. I would drop this.

> +		hrtimer_cancel(&domain->timer);
> +	}
> +}
> +
> +int xe_force_wake_init_gt(struct xe_gt *gt, struct xe_force_wake *fw)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
>  
> @@ -58,6 +83,8 @@ void xe_force_wake_init_gt(struct xe_gt *gt, struct xe_force_wake *fw)
>  			    FORCEWAKE_GT,
>  			    FORCEWAKE_ACK_GT);
>  	}
> +
> +	return devm_add_action_or_reset(xe->drm.dev, xe_force_wake_fini, fw);
>  }
>  
>  void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
> @@ -142,10 +169,36 @@ static void domain_sleep(struct xe_gt *gt, struct xe_force_wake_domain *domain)
>  	__domain_ctl(gt, domain, false);
>  }
>  
> -static int domain_sleep_wait(struct xe_gt *gt,
> -			     struct xe_force_wake_domain *domain)
> +static enum hrtimer_restart xe_force_wake_domain_timer(struct hrtimer *timer)
>  {
> -	return __domain_wait(gt, domain, false);
> +	struct xe_force_wake_domain *domain =
> +		container_of(timer, struct xe_force_wake_domain, timer);
> +	struct xe_force_wake *fw = domain->fw_back;
> +	struct xe_gt *gt = fw->gt;
> +	unsigned long flags;
> +
> +	xe_gt_assert(gt, !xe_pm_runtime_suspended(gt_to_xe(gt)));
> +
> +	spin_lock_irqsave(&fw->lock, flags);

I'd use guard(spinlock_irqsave) here rather manually unlock this.
hrtimer_forward_now should be safe under fw->lock unless I'm missing
something.

> +
> +	if (!(fw->timer_domains & BIT(domain->id)) || domain->ref) {
> +		spin_unlock_irqrestore(&fw->lock, flags);
> +		return HRTIMER_NORESTART;
> +	}
> +	if (domain->timer_rearm) {
> +		domain->timer_rearm = false;
> +		spin_unlock_irqrestore(&fw->lock, flags);
> +		hrtimer_forward_now(timer,
> +				    ns_to_ktime(XE_FORCE_WAKE_HOLD_DELAY_US *
> +						NSEC_PER_USEC));
> +		return HRTIMER_RESTART;
> +	}
> +	fw->timer_domains &= ~BIT(domain->id);
> +	domain_sleep(gt, domain);
> +	fw->awake_domains &= ~BIT(domain->id);
> +	spin_unlock_irqrestore(&fw->lock, flags);
> +
> +	return HRTIMER_NORESTART;
>  }
>  
>  /**
> @@ -187,8 +240,13 @@ unsigned int __must_check xe_force_wake_get(struct xe_force_wake *fw,
>  	spin_lock_irqsave(&fw->lock, flags);
>  	for_each_fw_domain_masked(domain, ref_rqst, fw, tmp) {
>  		if (!domain->ref++) {
> -			awake_rqst |= BIT(domain->id);
> -			domain_wake(gt, domain);
> +			if (fw->awake_domains & BIT(domain->id)) {
> +				fw->timer_domains &= ~BIT(domain->id);
> +				hrtimer_try_to_cancel(&domain->timer);
> +			} else {
> +				awake_rqst |= BIT(domain->id);
> +				domain_wake(gt, domain);
> +			}
>  		}
>  		ref_incr |= BIT(domain->id);
>  	}
> @@ -213,27 +271,25 @@ unsigned int __must_check xe_force_wake_get(struct xe_force_wake *fw,
>  }
>  
>  /**
> - * xe_force_wake_put - Decrement the refcount and put domain to sleep if refcount becomes 0
> + * xe_force_wake_put - Decrement the refcount and arm the delayed-sleep timer
>   * @fw: Pointer to the force wake structure
>   * @fw_ref: return of xe_force_wake_get()
>   *
> - * This function reduces the reference counts for domains in fw_ref. If
> - * refcount for any of the specified domain reaches 0, it puts the domain to sleep
> - * and waits for acknowledgment for domain to sleep within 50 milisec timeout.
> - * Warns in case of timeout of ack from domain.
> + * This function reduces the reference counts for domains in fw_ref.  When a
> + * domain's refcount reaches 0 the sleep request is not issued immediately;
> + * instead a hrtimer is armed for XE_FORCE_WAKE_HOLD_DELAY_US so that a rapid
> + * xe_force_wake_get() can reuse the still-awake domain at zero MMIO cost.  On
> + * timer expiry, if the domain is still idle, the sleep request is written.
> + * Mirroring i915's fw_domains_put(), the deferred sleep is fire-and-forget:
> + * no sleep ACK is polled, since the next wake re-waits for the wake ACK.

Let's not mention the i915 in Xe code.

>   */
>  void xe_force_wake_put(struct xe_force_wake *fw, unsigned int fw_ref)
>  {
>  	struct xe_gt *gt = fw->gt;
>  	struct xe_force_wake_domain *domain;
> -	unsigned int tmp, sleep = 0;
> +	unsigned int tmp;
>  	unsigned long flags;
> -	int ack_fail = 0;
>  
> -	/*
> -	 * Avoid unnecessary lock and unlock when the function is called
> -	 * in error path of individual domains.
> -	 */

Why delete this comment?

>  	if (!fw_ref)
>  		return;
>  
> @@ -245,20 +301,19 @@ void xe_force_wake_put(struct xe_force_wake *fw, unsigned int fw_ref)
>  		xe_gt_assert(gt, domain->ref);
>  
>  		if (!--domain->ref) {
> -			sleep |= BIT(domain->id);
> -			domain_sleep(gt, domain);
> +			fw->timer_domains |= BIT(domain->id);
> +			if (hrtimer_callback_running(&domain->timer)) {
> +				domain->timer_rearm = true;
> +			} else {
> +				domain->timer_rearm = false;
> +				hrtimer_start(&domain->timer,
> +					      ns_to_ktime(XE_FORCE_WAKE_HOLD_DELAY_US *
> +							  NSEC_PER_USEC),
> +				      HRTIMER_MODE_REL);
> +			}
>  		}
>  	}
> -	for_each_fw_domain_masked(domain, sleep, fw, tmp) {
> -		if (domain_sleep_wait(gt, domain) == 0)
> -			fw->awake_domains &= ~BIT(domain->id);
> -		else
> -			ack_fail |= BIT(domain->id);
> -	}
>  	spin_unlock_irqrestore(&fw->lock, flags);
> -
> -	xe_gt_WARN(gt, ack_fail, "Forcewake domain%s %#x failed to acknowledge sleep request\n",
> -		   str_plural(hweight_long(ack_fail)), ack_fail);

This deleted code for domain_sleep_wait / error probably needs to be in
xe_force_wake_domain_timer.

>  }
>  
>  const char *xe_force_wake_domain_to_str(enum xe_force_wake_domain_id id)
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
> index e2721f205d6c..19679b923dca 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.h
> +++ b/drivers/gpu/drm/xe/xe_force_wake.h
> @@ -11,8 +11,8 @@
>  
>  struct xe_gt;
>  
> -void xe_force_wake_init_gt(struct xe_gt *gt,
> -			   struct xe_force_wake *fw);
> +int xe_force_wake_init_gt(struct xe_gt *gt,
> +			  struct xe_force_wake *fw);
>  void xe_force_wake_init_engines(struct xe_gt *gt,
>  				struct xe_force_wake *fw);
>  unsigned int __must_check xe_force_wake_get(struct xe_force_wake *fw,
> diff --git a/drivers/gpu/drm/xe/xe_force_wake_types.h b/drivers/gpu/drm/xe/xe_force_wake_types.h
> index 14b7b86e801b..ee5675069fe0 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake_types.h
> +++ b/drivers/gpu/drm/xe/xe_force_wake_types.h
> @@ -6,6 +6,7 @@
>  #ifndef _XE_FORCE_WAKE_TYPES_H_
>  #define _XE_FORCE_WAKE_TYPES_H_
>  
> +#include <linux/hrtimer.h>
>  #include <linux/mutex.h>
>  #include <linux/types.h>
>  
> @@ -51,6 +52,8 @@ enum xe_force_wake_domains {
>  	XE_FORCEWAKE_ALL	= BIT(XE_FW_DOMAIN_ID_COUNT)
>  };
>  
> +struct xe_force_wake;
> +
>  /**
>   * struct xe_force_wake_domain - Xe force wake power domain
>   *
> @@ -82,6 +85,12 @@ struct xe_force_wake_domain {
>  	u32 mask;
>  	/** @ref: domain reference */
>  	u32 ref;
> +	/** @timer_rearm: put() ran while callback was in-flight; callback must restart timer */

Protected fw_back->lock.

> +	bool timer_rearm;

In general, I’d reorganize the layout so that structs are at the top of
xe_force_wake_domain, followed by u32 fields, and finally the bool
fields.

> +	/** @timer: hrtimer for delayed sleep request */
> +	struct hrtimer timer;
> +	/** @fw_back: back pointer to parent xe_force_wake */
> +	struct xe_force_wake *fw_back;
>  };
>  
>  /**
> @@ -101,6 +110,8 @@ struct xe_force_wake {
>  	spinlock_t lock;
>  	/** @awake_domains: mask of all domains awake */
>  	unsigned int awake_domains;
> +	/** @timer_domains: mask of domains with an outstanding delayed-sleep timer */
> +	unsigned int timer_domains;
>  	/** @initialized_domains: mask of all initialized domains */
>  	unsigned int initialized_domains;
>  	/** @domains: force wake domains */
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 783eb6d631b5..43a79698cd04 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -511,7 +511,9 @@ int xe_gt_init_early(struct xe_gt *gt)
>  
>  	xe_wa_process_gt_oob(gt);
>  
> -	xe_force_wake_init_gt(gt, gt_to_fw(gt));
> +	err = xe_force_wake_init_gt(gt, gt_to_fw(gt));
> +	if (err)
> +		return err;

I'd add newline here.

Matt

>  	spin_lock_init(&gt->global_invl_lock);
>  
>  	err = xe_gt_tlb_inval_init_early(gt);
> -- 
> 2.43.0
> 
