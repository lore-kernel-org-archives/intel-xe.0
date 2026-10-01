Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 141A7CA5FCE
	for <intel-xe@archiver.kernel.org>; Thu,  1 Oct 2026 10:26:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE24F10F601;
	Thu,  1 Oct 2026 10:26:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aNVaXHIT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DB1510F601
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Oct 2026 10:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790850396; x=1822386396;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DvW9gcbbxIQPd6UVCrb4wBctMvTTYi+UHfBrYJwupu4=;
 b=aNVaXHITyYTODUtgzySmuFfZYb4B/K4fvfKv6X3ruJWlbKyOokZwHGlo
 LyT+jUCz7JJOeUShEYNfyEZ4jBUwuIfrwaoE8z2Pa8Bo70XAhMV1J2K3L
 4vf4wPYVXGBs51Aj0JNiHAbmf4Ycp+7smkB7TbrOjpfoV04njDjHZCkf3
 e69/RIOhWPZH6JQ8dXCHc5IAVcgW9tEe15XuGEqNkSJUTkxlnhYN9j+pT
 zVinb9y4SGvAixYzWA+fm0gUlie4xkcsisnBmaAlu7nw5cRcmm5UjFEq/
 S4BEAf8Xx2Ks9BKHVx+qN9QMVQsdVw9pvIyom9Jp1+/X1PIhfkaFuuExj w==;
X-CSE-ConnectionGUID: Gc9dzqhKRyK1+Ty4IgWTpg==
X-CSE-MsgGUID: LrOpTtd5SaWElK2PF9cLrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="91700325"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="91700325"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 03:26:36 -0700
X-CSE-ConnectionGUID: 0oUYyjLPRRWLG/nS51zPCQ==
X-CSE-MsgGUID: Yb4gftxZR8Ghem847ijcKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="275497443"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 03:26:36 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 03:26:35 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 1 Oct 2026 03:26:35 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.32) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 03:26:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H6ixuhTv8J4MdpqCqL+ZIqBqiDjqJ8ElHAuk4dCd+veFYPKT1CZptJG2KDSCHHH/TgBgHRb8UlLcVDgP40SULl4wBkKJ+9jOs/M6kbT8XXxNm29WRUQuKizCMNlBa+azdLXMq+1DxIY+ccVZOkx6+0n4SJUH7mhIK4obpjaBHUjvLbs1goCV6fxT3IPr7sNWGbTtT28Np/qOAcV1XMHOia3pqGgwwyaONhKC+Gvk7qW8BbFtJ8prddBhmgeGFukkrC9uivVuP/xU4aIx3Bl4W3x1/1TDK7hOHcAPEDf6FAljYI9A2/qwMLFsyqMjWyfvEAMS5xyi2ZEY9nxMM4EsjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CJQHRdxxzMMwFw/0DLLPZKqF74E84aZ+fDfw6Hy8xbI=;
 b=CvsuoXRhWJ0fYv0t9bHXQs7rMdDzs9FHIKM7YbWgbreySR+GEL6n/TWOcBrkTrWyvqLTvPN6as8PW265oYakv+/MpPz5MILCxoSIPDhwbBiWQoIC8BnqoAo2eHw8I09ErQNcOnkQAC+nAEzmBdr/D1uUXIo/qMITq+lxBso8cmg9afbOMs0x+8pZs55IN4lLrwpUS68yun/lMm29BIFXKYRAPgd+GeApmcV1fH3n5XLMtNov9yrAr/vR6v4Wn0H2W7pvzM9BHhEmxyA4cLF5+JUYD2g+MSsQQdkC9aRiHOFK54QeOPAyMJgH6/MssnpmnLhqj7sBXmnAvszJoIPDKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by DM4PR11MB6480.namprd11.prod.outlook.com
 (2603:10b6:8:8d::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Thu, 1 Oct
 2026 10:26:32 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::3a:cd0a:2af8:5837]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::3a:cd0a:2af8:5837%3]) with mapi id 15.21.0451.026; Thu, 1 Oct 2026
 10:26:32 +0000
Message-ID: <fb9de556-4428-497b-afcf-3e3c5a4a65ec@intel.com>
Date: Thu, 1 Oct 2026 15:56:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] drm/xe: Drop RCU list handling for VRAM bad-page
 tracking, use mgr->lock
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <matthew.brost@intel.com>
References: <20261001094518.1493651-6-tejas.upadhyay@intel.com>
 <20261001094518.1493651-9-tejas.upadhyay@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20261001094518.1493651-9-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0155.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d7::17) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|DM4PR11MB6480:EE_
X-MS-Office365-Filtering-Correlation-Id: f01493a4-bd00-47ef-03ef-08df1fa67690
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|4143699003|11063799006|10067099003|56012099006|5023799004|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 6iYPlxWRi01xk1yJpMjwzUuO3U61q3WKsWS3ktoTBdvB1MZDnQQvaYxTmGPGt6vJHUYMRYlkzocW9BOxfSaZJAb5Rhl7J6vSBEUeKc9LEnjex5QQ08t03+DUaxc4386uwerVP9a4Wyx4LUVAMAZGvpMKKI5oI728OIOVF9cYIq4fDDUEYGdAm5KYFne1hhQuQt75m/96zW0+vOzjpV0rYBr13jBX9kZuoqs48dnrwYvOUzbjuzuOPiuY34NMntuCZ9Q26UJ9AOCa5fAHqTdLziMkjpgDy8hXYYxQUGykIaXoUSsfXpXCifLSYi08yZnIPmOUiICNMKcBPvfEcSWo5hYeJQthiyRXf7CVV01s5vNu2vk9xmmBOUsn/9Qxmf6COoygHtjSnpHpesUC9Itxa1cNoTlOFW664lE2qnjmVQXAKXzWiiwm9nSgdoSQtJwGrLGje+S3k8q7BHm1lhVcOw9eJvJwrt8QJA1AAvvKZQN4FQH33A2bKAAcgFJeTkyzjy3mkUAA+42G8miT20AbOcyhZi9FW9igd+Tf/iNp2ao++Bj90BiKa2gnt8F2cXTZLgLp5Muq8VI7kpc9c9676uK0HTKp3kWoCl0PNF8aaFOF9SAMhyrJw7USia3Y2dUXe1bNBCy9OHbKkeMR6nJb6UNlF1zmsyqoQSDGJGDgaSA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(4143699003)(11063799006)(10067099003)(56012099006)(5023799004)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0FxZmM2M1lacEQzSk5sTnlFd3JQRUtUMFMxZVFQMkIvUEZteDN2VUFDeUlw?=
 =?utf-8?B?TmZ5V3VzdTczMnpTbUk2OVp3ZDhNUGI3T08xYTVuTmt3OUR1RGh6WmcwM1Y0?=
 =?utf-8?B?cmtoV1JhVnAyT0R1NVJwRG5RQi9qWWJyNDVvdHFUQlJUSjluWnVqWEUyeXBq?=
 =?utf-8?B?MVpxU0Y0dDJJd1BMQkZZM0hkQVR6c1lPc010cXo3elMyN2J5UldZUDRxMTNm?=
 =?utf-8?B?UHFHOEhLS2R3RnBRQVRDQlJXWm9yWmhKN1haditidURWWHFGT2hOZFVHSENF?=
 =?utf-8?B?M203OFhvd3RrbDdnNGhVeWFsK2ZCUy93L1V6VE5ucnZqVVZxdHBJWlRJdisw?=
 =?utf-8?B?Qlh1UWMxQWV6dXh6aUE4NnVJL1dzWXpZVWp3OVBZWHJWZEpQcXAwZ0tyd0tC?=
 =?utf-8?B?UjJhM0hJWmlCaGZLTXBOZWpqc0NzMURoNjdpaHlGUWRsR3ExTzVGWjFFVWJj?=
 =?utf-8?B?RzZTZkkvMjBONU5TSDc5V3c4UG9iWWl0UDV3S2RwOXU0dyt1aVQ1ZkZsMjBu?=
 =?utf-8?B?NTlHUGhmd2RuM2R1VS8vemtFZFNVRUhVcGZIekFzeWFrUEJENU5wcEw4S0E2?=
 =?utf-8?B?a0FYQWxvRkQ5L3pmc0NTbGp5YTk2M0dnQUh4MlVJaUIwU2JXYkQrZmYxdm9N?=
 =?utf-8?B?V1l3TjlPSHQ3OHg4U2ljQlZWUnVvMFBOTWJQUmtCWUZ0THZSeDFZMVJ0WHpL?=
 =?utf-8?B?MWVrT0pNd21BVFk4d3BpYXJOUUNyeHNBS05pSGpXaUJaM3dkZyt4Sm5VRENk?=
 =?utf-8?B?M3NwejZaTFRkV01QWWk3QU1YNVZpRGJZU0RTeWY3REhTRE8zQk1JRkdSWG9U?=
 =?utf-8?B?Z0lraksrS2V5Q251RE1JZDN4MzhsU2thWmc3S2RkZ3Q2eUE1L245ZGJrRXlC?=
 =?utf-8?B?Z24vdkcvd3I1ZU0wblN5RXR2THdHT0pkemVwMXhRaE82dW9MNUlPcGEvMmdO?=
 =?utf-8?B?MTc1cE5ualFGcUhoNmRZQUxEdFpNRldXaUxmdCtxaE15VmdDRWczc3l6Z0RE?=
 =?utf-8?B?S2lpTEtGYmpYdDVUVVZvZXBUR2NWQnJhR0dWbFdxOGlPOXZMZ1JIMkJZTG9Y?=
 =?utf-8?B?SXk5bnh3Ym9LZmdueGpua3dXRUNSL0JBKzNWbURMVWMvcWZnbEVRSU9HdHIr?=
 =?utf-8?B?UUI3NUlCbTRPZVVyczJmblNmOVB5aEIvKzYveG9kNFY1VDFlY3RnVjlnRHhw?=
 =?utf-8?B?RHZHUlNqTFNma3FkK3FKTnZ0S3plUDZSNzc5MG84SURlc3M4RVJKekVvdUIy?=
 =?utf-8?B?UThGK3dHYXNjYW05QnREUXEvQlo0YVFFSFdFSDUralFWQW54bU0wdEI2Ritz?=
 =?utf-8?B?SU01RThjQVZkNG1Qb1ZaZUVoaVhqVUJJajBRcnlFZWlMQUx4QlVtaDhTNFlh?=
 =?utf-8?B?SDkwSFc4WkVYbHFpWXh4bXQ1T2RjZ3R6U3BGTTlVc1VuZWpVMTUyR0FnMERG?=
 =?utf-8?B?ZDlvb2E2Zm5wSENvZGJWd3p4cXZPOGljSmxqdE1LcnZZb3lZTW1Hdlp2Qm5t?=
 =?utf-8?B?Mlc4YnJocE02em14a0pCc1ZoUkw0RWhRdG0yVlRQN1piaTVWLzgrczdBNmgx?=
 =?utf-8?B?NXAzWmVWU2xkNG9UUVFjdXZrMEQrQ20zRnNEY1MxWmcxRVNOQUdVTXBxeUUx?=
 =?utf-8?B?NWw5OWRaUHF5QS92U09xc1dRSlk0WU0yRWgzMkkwY3VTaGo5OGxSSXRpUllG?=
 =?utf-8?B?cFZnY2xVeVVkeERBeDg3TUpFRUlUbjFkNGJOVUJMR2tpVTMrOURRaWQycHJi?=
 =?utf-8?B?V3FuRUNaeExRaWdoYXZjQTdHdjhpdyt3NGxNdmd6VVBrQkhyTmEyK3NlZjhC?=
 =?utf-8?B?QmkwTGszM0xYT05GMjM1VzlJSUt3TFoyWU4wallEcTE4NG9sck8xZmlYYlE1?=
 =?utf-8?B?VHR4bXFRQWZNQWR3NjY4UFRMUEMrRnZlV3dCUkRxK1h6YkxGc2ZWMHNaWlpB?=
 =?utf-8?B?WTVVcXRObk5DQ21zelNxcWhVc1ZTazV0QmpNaE1SV1Z3UGVJQXNjcTBYQVhH?=
 =?utf-8?B?RDQ3Q0lBM1ZJSDNmZWN2SEEvSllqZFRCcFN0UFF6Rlpnc1NSalhkcEJxaUJh?=
 =?utf-8?B?M2JQU29TRDAwUzJEM3NWSzlKL0dOTXBVQ0RUWmxyVnlsU0UyNkF6djc2Tmpq?=
 =?utf-8?B?NDZTU295WVZ2Z2l5Z0pOZCt1NGQ0RDVHS2wyUkZkb2NxRStaQW5VNHJFbnFz?=
 =?utf-8?B?bDlyUzBwWC9QZEt1R0lYMG9JOENCYWVIcnBIUWFqc29YU3BLVG41Q2Q1RDho?=
 =?utf-8?B?Z0NldGFYVjNUcHc5RjA1MmtNWldvay9IT01lRXB5MjFsV091SGhwTnE3TGxF?=
 =?utf-8?B?Q0t5dDk1KzFNbXdCS3NRVWlaNEFpbmJqbXREWDl6ekJxS2hLcWg5UGxmYTcr?=
 =?utf-8?Q?2hhZFzX2iqEDnEsg=3D?=
X-Exchange-RoutingPolicyChecked: 5IqXd7KOWibVW7DJTFYItL5VnirrnIpOCAIRRPsoO+IH6pqt+kWHE7bO5iHXLWAF8GiLwGHNhMPKTKtt/XIihB2bNug2sWNLRu+vJ1BxXJQnkumEd19tESuA75sDu9JLqYF8MvyR1CwBHmbwYMr5O+6TN8S0xu1me5WfcUdsQpFc3GVgtwtLlWmSae8/Mpv4TH8H7Aa8piUlmVKA4iF1xNppgXwXSCAXLmn5BHdZVCRSclFJkih5+FvArrHi3WCY/WCpO1Gi2rC8F6Ft4hatz4seOkTy8YUck957E9Jkv3/D3D9wiGIW7uVxh3Bt933eP2VsFjxPwOwGh8cn5ci1xg==
X-MS-Exchange-CrossTenant-Network-Message-Id: f01493a4-bd00-47ef-03ef-08df1fa67690
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 10:26:32.5378 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UhdAAxdUDHGj8l5OjplgjHtzWeacS2zjEaf1R/oZtOGEaEouRxX9o2v1YEBbj38K5OBg5/ZBLhgurXYHfJpz/mT4opF1TSwvppdcSzRazz0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6480
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



On 01-10-2026 15:15, Tejas Upadhyay wrote:
> queued_pages and offlined_pages were mutated with list_add_rcu()/
> list_del_rcu()/kfree_rcu(), but the only lockless consumer was the
> vram_bad_pages debugfs show function. Every other reader and writer
> already runs under mgr->lock, so the RCU protection bought nothing
> but complexity and a rcu_head field on every tracked entry.
> 
> Convert all list operations to plain list_add()/list_del()/kfree(),
> including the retry helper added by the ghost-ownership fix, and
> have vram_bad_pages_show() take mgr->lock instead of rcu_read_lock()
> so list traversal is always serialized against mutation.
> 
> Fixes: 7737f819e9f1 ("drm/xe/vram: Add VRAM page offline fault handler")
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       | 26 +++++++++++-----------
>   drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h |  2 --
>   2 files changed, 13 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> index ed79e4c6ba1a..7211ab5f66e9 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -243,9 +243,9 @@ static void xe_ttm_vram_retry_queued_pages(struct xe_ttm_vram_mgr *mgr)
>   			continue;
>   		}
>   		--mgr->n_queued_pages;
> -		list_del_rcu(&pos->queued_link);
> +		list_del(&pos->queued_link);
>   		++mgr->n_offlined_pages;
> -		list_add_rcu(&pos->offlined_link, &mgr->offlined_pages);
> +		list_add(&pos->offlined_link, &mgr->offlined_pages);
>   	}
>   }
>   
> @@ -394,17 +394,17 @@ static void xe_ttm_vram_free_bad_pages(struct xe_ttm_vram_mgr *mgr)
>   	struct xe_ttm_vram_offline_resource *pos, *n;
>   
>   	list_for_each_entry_safe(pos, n, &mgr->offlined_pages, offlined_link) {
> -		list_del_rcu(&pos->offlined_link);
> +		list_del(&pos->offlined_link);
>   		xe_ttm_vram_buddy_free(mgr, &pos->blocks, pos->used_visible_size);
>   		--mgr->n_offlined_pages;
> -		kfree_rcu(pos, rcu);
> +		kfree(pos);
>   	}
>   	list_for_each_entry_safe(pos, n, &mgr->queued_pages, queued_link) {
> -		list_del_rcu(&pos->queued_link);
> +		list_del(&pos->queued_link);
>   		/* queued entries have no buddy reservation yet */
>   		xe_ttm_vram_buddy_free(mgr, &pos->blocks, 0);
>   		--mgr->n_queued_pages;
> -		kfree_rcu(pos, rcu);
> +		kfree(pos);
>   	}
>   }
>   
> @@ -823,7 +823,7 @@ static int xe_ttm_vram_reserve_page_at_addr(struct xe_device *xe, u64 addr,
>   			}
>   			/* Queue free(to-be-purged) pages */
>   			++vram_mgr->n_queued_pages;
> -			list_add_rcu(&nentry->queued_link, &vram_mgr->queued_pages);
> +			list_add(&nentry->queued_link, &vram_mgr->queued_pages);
>   		} else {
>   			/* Immediately offline unoccupied pages */
>   			/* Queue free(to-be-reserved) pages */
> @@ -837,11 +837,11 @@ static int xe_ttm_vram_reserve_page_at_addr(struct xe_device *xe, u64 addr,
>   					"Page at addr:0x%llx still busy (%d), deferring reservation\n",
>   					addr, ret);
>   				++vram_mgr->n_queued_pages;
> -				list_add_rcu(&nentry->queued_link, &vram_mgr->queued_pages);
> +				list_add(&nentry->queued_link, &vram_mgr->queued_pages);
>   				return 0;
>   			}
>   			++vram_mgr->n_offlined_pages;
> -			list_add_rcu(&nentry->offlined_link, &vram_mgr->offlined_pages);
> +			list_add(&nentry->offlined_link, &vram_mgr->offlined_pages);
>   			return ret;
>   		}
>   	}
> @@ -1045,16 +1045,16 @@ static int vram_bad_pages_show(struct seq_file *m, void *unused)
>   			continue;
>   		mgr = to_xe_ttm_vram_mgr(man);
>   
> -		rcu_read_lock();
> +		mutex_lock(&mgr->lock);
>   
> -		list_for_each_entry_rcu(pos, &mgr->offlined_pages, offlined_link) {
> +		list_for_each_entry(pos, &mgr->offlined_pages, offlined_link) {
>   			u64 pfn;
>   
>   			pfn = (pos->addr + vr->dpa_base) >> PAGE_SHIFT;
>   			seq_printf(m, "0x%016llx : 0x%016lx : R\n", pfn, PAGE_SIZE);
>   		}
>   
> -		list_for_each_entry_rcu(pos, &mgr->queued_pages, queued_link) {
> +		list_for_each_entry(pos, &mgr->queued_pages, queued_link) {
>   			u64 pfn;
>   
>   			pfn = (pos->addr + vr->dpa_base) >> PAGE_SHIFT;
> @@ -1062,7 +1062,7 @@ static int vram_bad_pages_show(struct seq_file *m, void *unused)
>   				   pfn, PAGE_SIZE, pos->status ? 'F' : 'P');
>   		}
>   
> -		rcu_read_unlock();
> +		mutex_unlock(&mgr->lock);
>   	}
>   
>   	return 0;
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
> index 95a427e3b0a7..ef7e4c87a7bb 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
> @@ -81,8 +81,6 @@ struct xe_ttm_vram_offline_resource {
>   	u64 addr;
>   	/** @status: buddy reservation status */
>   	enum xe_page_reserve_status status;
> -	/** @rcu: RCU head for deferred freeing */
> -	struct rcu_head rcu;

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

>   };
>   
>   #endif

