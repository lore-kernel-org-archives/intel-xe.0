Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0F42E7717F
	for <intel-xe@archiver.kernel.org>; Fri, 13 Dec 2024 20:43:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73A9310E104;
	Fri, 13 Dec 2024 20:43:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fz10d60S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7625810E104
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Dec 2024 20:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734122638; x=1765658638;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=0wud4p3YZ4wjl0nBOJlygUoilR28/k1qGBuWBjI/nVc=;
 b=Fz10d60Sl/m0nMQfRA3/RX1yCzc4ReXyHhiUiFzUprOm7ez9gCL0jVkp
 Yk3FsmGsYw3gWE5O0DTLaGyPE8KUsLdCWOtweyzvsW591RHKDUl+Zyfqh
 WTY6gyzzspXt0UjMVeSnqPFkg3zCFO9rKEvv9jlyb47SUsO0ox3exfSh2
 3nYFlAjaZVqB8Nbq7gYjHY3totse3r1lZQaBOFqh26fC4qC6h8IyjsK98
 NdRIqTsfWv7y+4eCUVLH9XfXUl9j4wNAUUAaah0wVc7BHE73UWVIJzqKb
 VLXyF4LQS9AVbryvQwXKUzOgbeHC+6sNFFUjOZLyNy4TjI/+1PzjRCkKM g==;
X-CSE-ConnectionGUID: YKmsuNBeRz6NjWukypEigA==
X-CSE-MsgGUID: mMUabOhGS96PVff/ShPsrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11285"; a="45277681"
X-IronPort-AV: E=Sophos;i="6.12,232,1728975600"; d="scan'208";a="45277681"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 12:43:57 -0800
X-CSE-ConnectionGUID: 2cUJE6zhTO2UkMFWkrGh7A==
X-CSE-MsgGUID: kO9QRAy9QPqSdjfq1XhXtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,232,1728975600"; d="scan'208";a="96386491"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Dec 2024 12:43:57 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 13 Dec 2024 12:43:56 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 13 Dec 2024 12:43:56 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 13 Dec 2024 12:43:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vuGZVlTaWNcfpQ8zUusCXqsnolZpQObibAxR6jvqqsFdDmXHKIWTfsSzOafiZUXzEskLL7E3kYFCip/INI7xa0JawHKstwn6U06zJ4ZKHoIdLw85hNDm8lJT0WDrHhjlo3A372A6mxRyEkC3mtI8f7KZ/Tp7cNj3BM+FLrfRvkEYnTypK+NZZoSpDyVW/JIlQKwbFs1TARU/JhV0Nq+4rZQlnnj6hrCCPLg3KwyYuSGrEmbbMMqT6V+o73ZiFyrAU+sTMdndWPkfmaJajMTgYWra3KpE4huvXsPePdaWn+fNAl2Ns/xpF+g++yTVKitEzepcC0E/2M4AatYgYDVb2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m0oOAffIWUvYI9hQ45Al1UsgEZUzmYHXWZ9jqahOenQ=;
 b=dxiVDjoJ5giq68ffvESKL82dSKb+E6Tl5Z78HnPboD6mf7/GSemnUfdUim/b38OqoJ/z11tTtjAbDJxiXila7YEAnWbv7Lvm+PRDce+JlCEcCjJJMapTh+oyfqn1L8l4Ooze1XtPiTkkgVRO5P6uXOEcmraqTcBINO2Sfc1blxHrlXLrxiGHV5QllLO7SM2giwc63rUZO6UfRhbQGAsKkDRbT6R/CR8wXugCdha5ezcLfQYS6aest8vy2CTq4nEWoVi7CBOgQ1LLHTaKOXrSZvMuMgL/FXQCgqRU3/shBvGdQ0TxyKNlC07rI6Dw1iwTf/asx4LYQsAIdRGuWAdvOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by CH3PR11MB8518.namprd11.prod.outlook.com (2603:10b6:610:1b8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.19; Fri, 13 Dec
 2024 20:43:08 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8251.015; Fri, 13 Dec 2024
 20:43:08 +0000
Date: Fri, 13 Dec 2024 15:43:04 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <matthew.d.roper@intel.com>, <aravind.iddamsetty@intel.com>
Subject: Re: [PATCH 1/2] RFC drm/xe: Add functions and sysfs for boot
 survivability
Message-ID: <Z1ycWEYbI745oiBb@intel.com>
References: <20241212054945.1091894-1-riana.tauro@intel.com>
 <20241212054945.1091894-2-riana.tauro@intel.com>
 <Z1tqV9UpBeG_fITD@intel.com>
 <ccd408ab-ede9-43d5-bde0-0e8e989b332c@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ccd408ab-ede9-43d5-bde0-0e8e989b332c@intel.com>
X-ClientProxiedBy: MW4PR04CA0342.namprd04.prod.outlook.com
 (2603:10b6:303:8a::17) To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|CH3PR11MB8518:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a70d2f2-70f1-472f-4686-08dd1bb6c070
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?amtmUmVoZ3dNcUlLZDlhYnpaZFo5Zk1WYkN5eWsxdmxiVDcyYkh4aXBQSThv?=
 =?utf-8?B?NXZZWXNSNkhBQm84aTdvT2R5a3lrNUZJZUtmV1hFWnRMRWUwOXNGcVFEQVNC?=
 =?utf-8?B?YU9PYUQxcFJ3d2U5akVLeUphVDc5ZDVnd0V0bXJrNy9CVHFOL3NXaHBPdVFx?=
 =?utf-8?B?QlZtbUZkdFpjME8yKzRoVkdzb25pRzlmZnl2K2tKOEdOOWRVUXY5YTNoMlVs?=
 =?utf-8?B?bHZjMXJmbnNoZlc0T1pvWWphbkVCMjRGUjdWK1JKMzZyenJ3YktHM0dna3FM?=
 =?utf-8?B?VU5GZ3ZZdVYrZnp6U1VvRDFNM280alVBWDlKOXpPendaZGhGWm5STTREQmE1?=
 =?utf-8?B?N1prbE8zK3ViU3N1K2tqQ29yN3phTk5wU3J4QTl3MHZZdkJUWjRmUk1tMzBR?=
 =?utf-8?B?Y3JmK3dyaitCQjMyUDRSQmtvM054T1RVY3JZMm9CdFhjcFFtbUlpTldFN3Rr?=
 =?utf-8?B?UWVvcDBUL2lzbHhvZGhBMnM3T2R3QjhqVU9pNDZncWpjU2dJU0NuVXZOTHgx?=
 =?utf-8?B?YXZxclIwWkhyam45YXcrc1orNWx2YWFRYVdDWU8yYjBIQVR2WXpONXJjNkI2?=
 =?utf-8?B?UjVGdGFhNWF0WkFNTkxKMHdmZnZVL29scm1aU3dGZnp6NktOZk9KZmp4VmRD?=
 =?utf-8?B?bHEvdUU4bE02R1FPc1pIcG83cUl3Z01ZN0wxZnl5ZUY0UVh5VHJSOTFtVW5p?=
 =?utf-8?B?aFR4eks4TGNsWnFaaTFNbDFuekJQdlJFWk1sUnlCOEVwd3Ava1h6bVlUdlVo?=
 =?utf-8?B?Zkk4aVMvbXFSRHRLZFZpREM1MHNObHJTc0svL01xelIwQjd2QzlTYWZSZUJq?=
 =?utf-8?B?LzVzRVdRdS9DNG84VVhEZ0loM0JxV2JpYTA1a1dXcGYzc3QrM1BicUgzdU1v?=
 =?utf-8?B?TDNkbUxqMGlKaWdScXNYTk9oNUYyNkdObXRGdEdwUDFuQ2p0VVExcUpUT3NM?=
 =?utf-8?B?REhPR3N1bUsxeldkeDVmRDZwUFNrNytUUEJGb01XT2pxSnlrWE9OazJZckx3?=
 =?utf-8?B?TzY2UzVXTER2UkxER2hpejg5a3RjOXpuOUN4T0F6d1FtZzg0bEMwMHpuQTU3?=
 =?utf-8?B?VnU1QzQ2VDRpY0Y5UXU4MWlveDZwQ2ZKQ3NpRExyNGF3K1g5LzRVS3FCMXRX?=
 =?utf-8?B?aWZKSE5FMVVUTDVxaEh1TTZtOWFBY3Z0Y25yTFZnM0cvY1pjaTBDbXB5UzB4?=
 =?utf-8?B?dHppcjVrdWh1cThlNmpVTmtKSEZyd0xsR0VLNGlpNVBIUEFIZjVhNUJjc1lN?=
 =?utf-8?B?T2NLdzVhRzVoVWJSQ0pLcGl0N0dRVmpESmRuMll5VS9Hb1Z1emFwZVYwWVdB?=
 =?utf-8?B?LytvWUVnOUxOTHNMWk5zZllOc3BuMERpbnFPZ1pBcnh0ZGNQLzNXS1VHSjdu?=
 =?utf-8?B?S28wZkdJRCtYRkFpMHpub3N4ZXRGZUlRKzFDcVpIajBSQjRqcHl1UjZIbmVU?=
 =?utf-8?B?Y1lERlppOTd6NEk1VGxvNVZmenc1MGhPQVpmWnhiM0JsUHY0UDZTZnJSZGNj?=
 =?utf-8?B?ZkF1ODJJMSs3bVhKTzgvcC9kK2lrMmVYWnJrWmlaYzVENnNIdFVkZkIrSnVQ?=
 =?utf-8?B?eTRCYXpxQmJyUWhma2xLMU01bzBKQUxaV3pPZlpFQUlBdnhmQWhUbHNTR29V?=
 =?utf-8?B?R3kxeVZJK2ZibEhaeFFTMHR0eDJBZkV5ZklUQWxtdGM2NlZCMWY3b2MvU1Av?=
 =?utf-8?B?aE42amQ2VzlhWlZYY0luNzNtdXVDU01qVzdnRmkyZFhlRUZHaDBvaFcyUytC?=
 =?utf-8?B?dDBtZEJnODJURXpRWnNVVUQweFZGOGJrZUNjcVhwVk80aWNJeExIZGNoeWdQ?=
 =?utf-8?B?K2hEZ0ZRc0gzUnFEUWU1aVh4MzdEQUhSTm5jek9kbVhFdFpEZzR5VkVzN1hS?=
 =?utf-8?Q?TWoarxxWcqtoZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ekJGSHcxV0oxM0dlQXJjRS94dFQ0SW40ZWk1RnRsMTFBc3BML1YzU3VIL2VV?=
 =?utf-8?B?UEpBalBXQWtsbGRiNXFXQ0J0d1FwdTNKdE5jRjFuQnYvQllicUQyR0tpQTND?=
 =?utf-8?B?eXNXR3o5RHhRaGozOWNhbUdXSGZIOXlUelVVL2dIalVTY1g4c3ZjRUd3M3l1?=
 =?utf-8?B?bjdzVDRyTVhGRHlVazA1RTc1RDU0cFlTRG5HVXBkRFcwZnVCL3hiaUVWMkpR?=
 =?utf-8?B?YXEwSXl0RllNVG9FMCtZKzJaZThkaHltOEdYS2VRMzZLWlZqeGVBQ2RlcWFL?=
 =?utf-8?B?aS9ONENhVjdybWZYQUNVYXRJVkk3eHU4N3k2OUpLcnh5U0luRVEyblBZYmtu?=
 =?utf-8?B?UHkxVktVYkMxU1paTmZIZTRKOUlGWXhzVEw3aFR6cXJ0MjduYUxQK2QrZXls?=
 =?utf-8?B?Q0xOZDhtWm14cGZBbDNwU1QvQ0R0Yll2dFRnQjRYQzdKVnFpZU5EV1J4eE5X?=
 =?utf-8?B?cFVCSk5OZ1cyeTRtVjkrWGZWK1E2NnNmallsWEtYSndJZllrSThYYTFmVXRN?=
 =?utf-8?B?eHBsbytuSnJOZjgrYmY3THVsUVBIaHJXL0NZWElJT2RRVmxVQVhIKzEzclcz?=
 =?utf-8?B?SHV4d1pHSWY4YUsxYUdhYldpbnV6UHVvWncvTElqakRnWFM1KzNnVzlkQ2Nt?=
 =?utf-8?B?dlJJMlF1eldpQlI4Vk9BRmdLM3ZjcTVQNmpPREl0TnNJM2QzSCszYXNIdkgr?=
 =?utf-8?B?ZDhYNVFYQmlrUFJxeW11S09PWC8rS2RSOHNWL0R1YjNISnB0SlpZSGZhajdm?=
 =?utf-8?B?Mk1Kc0RkaG41Z3B6SHBzK2l2Y3pjejlpWU5XQjJFNlVTRHFuRENtcGpieWYw?=
 =?utf-8?B?elJhdHlyWkM1WWJNQ0xuOUhjdGY5bmUwL1pJL1hNK1RMNElLeGZObjc1UGpr?=
 =?utf-8?B?Q25OZ1habmFDcm1nVllCZ3l4M0FJK244cmFzTURraWJtbVZxaEx3R0xncmNI?=
 =?utf-8?B?ZFN5TWZzL1RuM3N3RzQ0ZnBUd2FneHhZU3U5MTJSY0ZEbkwvV081SGszQ2Q0?=
 =?utf-8?B?UzJraDJoSjh3SWxNWUZBK1hNcjhBL2QvamorOXBTODBOclg5TUtJcDhNcWgy?=
 =?utf-8?B?VllnNnFIUmsvbmpFTUpGUWN4OHBmcUhzOFBIQkZpSXRaclFVMnNkZ3ZkWlNH?=
 =?utf-8?B?Q0RnSlkwOC81N2RIeEpETjUrY0NsWmZteXBaVTMydlFweW1EQ0w0ZkYvK0xL?=
 =?utf-8?B?N1Z3UFZnb1BScmFJbEppUVhCdzA4WllCbEVSTVVGY29RT1F3R1pmYTNiZm82?=
 =?utf-8?B?dWdYN0hUMWtPR1N6aHQ2K2Z1ZmJhMWsrRFYxc25GN0JhR3Z4QmFXM0UxVkRY?=
 =?utf-8?B?Z3I5OGxiMFNhbzYvSUhnaHR4MG5Dc0gzOW4yRWFzVnhmUW5CSms4MnVZa2Qr?=
 =?utf-8?B?NSttZWdVTGFnVDNENFZJZk1Fbk9yYnhZQXQ3OTFUOXRLeENLRCsxNEc2LzhN?=
 =?utf-8?B?TG5pdTVTVWljVzZPSWxPQnhjdDh5eFFIUGl6a2xEVUJwcFNRQ24wOFlWZjMv?=
 =?utf-8?B?WTlUamIwS2xBU0I1dGlPSXh5clpndzROd1FoK2laRlcrdlV4TWkzTW5kdldY?=
 =?utf-8?B?bnRpU0ZjYnNUSEF2elg0MWQvd2lYM1gzeVgrczZKalA0bEtsaUQrWFVWQ2Ra?=
 =?utf-8?B?UVk5TVZMMlRsbUxJblc2NC9NTitDeVBOS1FVbHovRzc3SElrV0Y0cDRWVGFI?=
 =?utf-8?B?cnFQZFhhRlc5OEVPd1Q5Ui9SZjZOMktKK21va0FvTWUrSjZCeWdHWmY0WDhr?=
 =?utf-8?B?UlJ4MjN6VWVLb3FwNE92L2ZjaGpmUnNNc0JmQ3JmS2VZME1VSkJaSEJsZFpy?=
 =?utf-8?B?Y0pjVU1ZZTR1RDFzUUFjMmYzbi9sYm1kNUZhNXB6UEQ3SXM4SHlteEFvYnho?=
 =?utf-8?B?bURuRlZDSmE3cEZmZ2hUWXpReTZtM2xGSjNNQXhybUpWKzRRYnZHQ1Nycy9E?=
 =?utf-8?B?WWpNc0VicExLcHg1bnhIelZDU0dTVzNLTWszZzR0dUR1YVFiNmViVXpwdHhP?=
 =?utf-8?B?VXJML0JNdlRpMzZKc0VadFNSVUZFM0NTVjArUDZ1ZmpTM0VDcHF6c3QvTm1K?=
 =?utf-8?B?MUx5d0ZzWElTczd3ekplUHVKQXBodDZmeEFtQXZyTGxrZTY0NllJUEtEcjJK?=
 =?utf-8?B?aUJ4QmpGUDlZWWlvTkl1Tk9jdTF0Y0FOcUFrN2JEdWVZYmZWTHRqaS8wOGRh?=
 =?utf-8?B?dnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a70d2f2-70f1-472f-4686-08dd1bb6c070
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2024 20:43:08.5788 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iXlic0GBEgPiQKvLU0qL50QhojIgv1b9Wgt2s61KVgC2eWxeaI1C719Y4a8mcKB6xHjSy7Azu8YvkomvMykAeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8518
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

On Fri, Dec 13, 2024 at 01:34:23PM +0530, Riana Tauro wrote:
> Hi Rodrigo
> 
> Thank you for the review comments.
> 
> On 12/13/2024 4:27 AM, Rodrigo Vivi wrote:
> > On Thu, Dec 12, 2024 at 11:19:44AM +0530, Riana Tauro wrote:
> > > Boot Survivability is a software based workflow for recovering a system
> > > in a failed boot state. Here system recoverability is concerned with
> > > recovering the firmware responsible for boot.
> > > 
> > > This is implemented by loading the driver with bare minimum (no drm card)
> > > to allow the firmware to be flashed through mei/gsc and collect telemetry.
> > > The driver's probe flow is modified such that it enters survivability mode
> > > when pcode initialization is incomplete and boot status denotes a failure.
> > > In this mode, drm card is not exposed and PCI sysfs is used to indicate
> > > survivability mode and provide additional information required for debug
> > > 
> > > This patch adds initialization functions and exposes admin
> > > readable sysfs entries
> > > 
> > > The new sysfs will have the below layout
> > > 
> > > 	/sys/bus/.../bdf
> > > 		     ├── survivability_info
> > >                   ├── survivability_mode
> > 
> > Let's make only one file and get all the info inside the survivability_mode
> > one.
> Then any application using this will have to parse value?
> 
> Oh you meant, the presence of the file will indicate the mode and contents
> will give the required information. Okay will modify this
> > 
> > > 
> > > Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/Makefile                   |   1 +
> > >   drivers/gpu/drm/xe/xe_device_types.h          |   4 +
> > >   drivers/gpu/drm/xe/xe_pcode_api.h             |  14 ++
> > >   drivers/gpu/drm/xe/xe_survivability_mode.c    | 225 ++++++++++++++++++
> > >   drivers/gpu/drm/xe/xe_survivability_mode.h    |  17 ++
> > >   .../gpu/drm/xe/xe_survivability_mode_types.h  |  35 +++
> > >   6 files changed, 296 insertions(+)
> > >   create mode 100644 drivers/gpu/drm/xe/xe_survivability_mode.c
> > >   create mode 100644 drivers/gpu/drm/xe/xe_survivability_mode.h
> > >   create mode 100644 drivers/gpu/drm/xe/xe_survivability_mode_types.h
> > > 
> > > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > > index 7730e0596299..dc60512a5c47 100644
> > > --- a/drivers/gpu/drm/xe/Makefile
> > > +++ b/drivers/gpu/drm/xe/Makefile
> > > @@ -95,6 +95,7 @@ xe-y += xe_bb.o \
> > >   	xe_sa.o \
> > >   	xe_sched_job.o \
> > >   	xe_step.o \
> > > +	xe_survivability_mode.o \
> > >   	xe_sync.o \
> > >   	xe_tile.o \
> > >   	xe_tile_sysfs.o \
> > > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > > index 1373a222f5a5..79bd0bd94e9c 100644
> > > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > > @@ -21,6 +21,7 @@
> > >   #include "xe_pt_types.h"
> > >   #include "xe_sriov_types.h"
> > >   #include "xe_step_types.h"
> > > +#include "xe_survivability_mode_types.h"
> > >   #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> > >   #define TEST_VM_OPS_ERROR
> > > @@ -341,6 +342,9 @@ struct xe_device {
> > >   		u8 skip_pcode:1;
> > >   	} info;
> > > +	/** @survivability: survivability information for device */
> > > +	struct xe_survivability survivability;
> > > +
> > >   	/** @irq: device interrupt state */
> > >   	struct {
> > >   		/** @irq.lock: lock for processing irq's on this device */
> > > diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
> > > index f153ce96f69a..4e373b8199ca 100644
> > > --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> > > +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> > > @@ -49,6 +49,20 @@
> > >   /* Domain IDs (param2) */
> > >   #define     PCODE_MBOX_DOMAIN_HBM		0x2
> > > +#define PCODE_SCRATCH_ADDR(x)		XE_REG(0x138320 + ((x) * 4))
> > > +/* PCODE_SCRATCH0 */
> > > +#define   AUXINFO_REG_OFFSET		REG_GENMASK(17, 15)
> > > +#define   OVERFLOW_REG_OFFSET		REG_GENMASK(14, 12)
> > > +#define   HISTORY_TRACKING		REG_BIT(11)
> > > +#define   OVERFLOW_SUPPORT		REG_BIT(10)
> > > +#define   AUXINFO_SUPPORT		REG_BIT(9)
> > > +#define   BOOT_STATUS			REG_GENMASK(3, 1)
> > > +#define      CRITICAL_FAILURE		4
> > > +#define      NON_CRITICAL_FAILURE	7
> > > +
> > > +/* Auxillary info bits */
> > > +#define   AUXINFO_HISTORY_OFFSET	REG_GENMASK(31, 29)
> > > +
> > >   struct pcode_err_decode {
> > >   	int errno;
> > >   	const char *str;
> > > diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
> > > new file mode 100644
> > > index 000000000000..7e36989efd68
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
> > > @@ -0,0 +1,225 @@
> > > +// SPDX-License-Identifier: MIT
> > > +/*
> > > + * Copyright © 2024 Intel Corporation
> > > + */
> > > +
> > > +#include <drm/drm_managed.h>
> > 
> > this include moves together the linux group below,
> > on top of it...
> > 
> > > +
> > > +#include "xe_survivability_mode_types.h"
> > > +#include "xe_survivability_mode.h"
> > > +
> > > +#include <linux/kobject.h>
> > > +#include <linux/pci.h>
> > > +#include <linux/sysfs.h>
> > > +
> > > +#include "xe_device.h"
> > > +#include "xe_gt.h"
> > > +#include "xe_mmio.h"
> > > +#include "xe_pcode_api.h"
> > > +
> > > +#define MAX_SCRATCH_MMIO 8
> > > +
> > > +/**
> > > + * DOC: Xe Boot Survivability
> > > + *
> > > + * Boot Survivability is a software based workflow for recovering a system in a failed boot state
> > > + * Here system recoverability is concerned with recovering the firmware responsible for boot.
> > > + *
> > > + * This is implemented by loading the driver with bare minimum (no drm card) to allow the firmware
> > > + * to be flashed through mei and collect telemetry. The driver's probe flow is modified
> > > + * such that it enters survivability mode when pcode initialization is incomplete and boot status
> > > + * denotes a failure. In this mode, drm card is not exposed and PCI sysfs is used to indicate the
> > > + * survivability mode and provide additional information required for debug
> > > + *
> > > + * Xe KMD exposes below admin-only readable sysfs in survivability mode
> > > + *
> > > + * device/survivability_mode: Indicates driver is in survivability mode
> > 
> > We need to make in a way that the presence of the file itself is the indication
> > of the survivability_mode.  No file, no survivability_mode. No survivability_mode, no file.
> > 
> > Which I believe your code is already doing this below...
> > 
> > > + * device/survivability_info: Provides additional information on why the driver entered
> > > + *			      survivability mode.
> > > + *
> > > + *			      Capability Information - Provides boot status
> > > + *			      Postcode Information   - Provides information about the failure
> > > + *			      Overflow Information   - Provides history of previous failures
> > > + *			      Auxillary Information  - Certain failures may have information in
> > > + *						       addition to postcode information
> > 
> > then this move into the single file...
> > 
> > > + *
> > > + * TODO: Notify mei about survivability mode
> > > + */
> > > +
> > > +static void set_survivability_info(struct xe_device *xe, struct xe_survivability_info *info,
> > > +				   int id, char *name)
> > > +{
> > > +	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
> > > +
> > > +	strscpy(info[id].name, name, sizeof(info[id].name));
> > > +	info[id].reg = PCODE_SCRATCH_ADDR(id).raw;
> > > +	info[id].value = xe_mmio_read32(mmio, PCODE_SCRATCH_ADDR(id));
> > > +
> > > +	drm_info(&xe->drm, "%s: 0x%x - 0x%x\n", info[id].name,
> > > +		 info[id].reg, info[id].value);
> > > +}
> > > +
> > > +static int fill_survivability_info(struct xe_device *xe)
> > > +{
> > > +	struct xe_survivability *survivability = &xe->survivability;
> > > +	struct xe_survivability_info *info = survivability->info;
> > > +	u32 capability_info;
> > > +	int id = 0;
> > > +
> > > +	drm_info(&xe->drm, "Survivability Mode Information\n");
> > 
> > no need for the drm_info here
> Added a prefix here to indicate the below information is related to
> Survivability
> 
> Otherwise it will only display as below in case of Critical failure.
> Critical failure currently doesn't enter into the survivability mode
> and will not have sysfs.

Indeed. for the critical error we print dmesg, do-not create the sysfs
and fail probe. Perhaps that deserves a separate function?

> 
> 
> [ 4708.689214] xe <bdf>: [drm] Capability Info: <value>
> [ 4708.689221] xe <bdf>: [drm] Postcode Info: <value>
> [ 4708.689226] xe <bdf>: [drm] Overflow Info: <value>
> [ 4708.689230] xe <bdf>: [drm] Auxiliary Info 0: <value>
> 
> Will remove if not required or add the function name.
> 
> Thanks,
> Riana Tauro
> > 
> > > +	set_survivability_info(xe, info, id, "Capability Info");
> > > +	capability_info = info[id].value;
> > > +
> > > +	if (capability_info & HISTORY_TRACKING) {
> > > +		id++;
> > > +		set_survivability_info(xe, info, id, "Postcode Info");
> > > +
> > > +		if (capability_info & OVERFLOW_SUPPORT) {
> > > +			id = REG_FIELD_GET(OVERFLOW_REG_OFFSET, capability_info);
> > > +			/* ID should be within MAX_SCRATCH_MMIO */
> > > +			if (id >= MAX_SCRATCH_MMIO)
> > > +				return -EINVAL;
> > > +			set_survivability_info(xe, info, id, "Overflow Info");
> > > +		}
> > > +	}
> > > +
> > > +	if (capability_info & AUXINFO_SUPPORT) {
> > > +		u32 aux_info;
> > > +		int index = 0;
> > > +		char name[NAME_MAX];
> > > +
> > > +		id = REG_FIELD_GET(AUXINFO_REG_OFFSET, capability_info);
> > > +		if (id >= MAX_SCRATCH_MMIO)
> > > +			return -EINVAL;
> > > +
> > > +		snprintf(name, NAME_MAX, "Auxiliary Info %d", index);
> > > +		set_survivability_info(xe, info, id, name);
> > > +		aux_info = info[id].value;
> > > +
> > > +		while ((id = REG_FIELD_GET(AUXINFO_HISTORY_OFFSET, aux_info)) &&
> > > +		       (id < MAX_SCRATCH_MMIO)) {
> > > +			index++;
> > > +			snprintf(name, NAME_MAX, "Prev Auxiliary Info %d", index);
> > > +			set_survivability_info(xe, info, id, name);
> > > +			aux_info = info[id].value;
> > > +		}
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static ssize_t survivability_info_show(struct device *dev,
> > > +				       struct device_attribute *attr, char *buff)
> > > +{
> > > +	struct pci_dev *pdev = to_pci_dev(dev);
> > > +	struct xe_device *xe = pdev_to_xe_device(pdev);
> > > +	struct xe_survivability *survivability = &xe->survivability;
> > > +	struct xe_survivability_info *info = survivability->info;
> > > +	int index = 0, count = 0;
> > > +
> > > +	for (index = 0; index < MAX_SCRATCH_MMIO; index++) {
> > > +		if (info[index].reg)
> > > +			count += sysfs_emit_at(buff, count, "%s: 0x%x - 0x%x\n", info[index].name,
> > > +					       info[index].reg, info[index].value);
> > > +	}
> > > +
> > > +	return count;
> > > +}
> > > +
> > > +static DEVICE_ATTR_ADMIN_RO(survivability_info);
> > > +
> > > +static ssize_t survivability_mode_show(struct device *dev,
> > > +				       struct device_attribute *attr, char *buff)
> > > +{
> > > +	struct pci_dev *pdev = to_pci_dev(dev);
> > > +	struct xe_device *xe = pdev_to_xe_device(pdev);
> > > +	struct xe_survivability *survivability = &xe->survivability;
> > > +
> > > +	return sysfs_emit(buff, "%d\n", survivability->mode);
> > > +}
> > > +
> > > +static DEVICE_ATTR_ADMIN_RO(survivability_mode);
> > > +
> > > +static const struct attribute *survivability_attrs[] = {
> > > +	&dev_attr_survivability_mode.attr,
> > > +	&dev_attr_survivability_info.attr,
> > > +	NULL,
> > > +};
> > > +
> > > +/**
> > > + * xe_survivability_mode_required- checks if survivability mode is required
> > > + * @xe: xe device instance
> > > + *
> > > + * This function reads the boot status of the capability register and
> > > + * checks if it is required to enter boot survivability mode.
> > > + *
> > > + * Return: true if survivability mode required, false otherwise
> > > + */
> > > +bool xe_survivability_mode_required(struct xe_device *xe)
> > > +{
> > > +	struct xe_survivability *survivability = &xe->survivability;
> > > +	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
> > > +	u32 data;
> > > +
> > > +	data = xe_mmio_read32(mmio, PCODE_SCRATCH_ADDR(0));
> > > +	survivability->boot_status = REG_FIELD_GET(BOOT_STATUS, data);
> > > +
> > > +	return (survivability->boot_status == NON_CRITICAL_FAILURE ||
> > > +		survivability->boot_status == CRITICAL_FAILURE);
> > > +}
> > > +
> > > +/**
> > > + * xe_survivability_mode_remove - remove survivability mode
> > > + * @xe: xe device instance
> > > + *
> > > + * clean up sysfs entries of survivability mode
> > > + */
> > > +void xe_survivability_mode_remove(struct xe_device *xe)
> > > +{
> > > +	sysfs_remove_files(&xe->drm.dev->kobj, survivability_attrs);
> > > +}
> > > +
> > > +/**
> > > + * xe_survivability_mode_init - Initialize the survivability mode
> > > + * @xe: xe device instance
> > > + *
> > > + * Initializes the sysfs and required actions to enter survivability mode
> > > + */
> > > +void xe_survivability_mode_init(struct xe_device *xe)
> > > +{
> > > +	struct xe_survivability *survivability = &xe->survivability;
> > > +	struct xe_survivability_info *info;
> > > +	struct device *dev = xe->drm.dev;
> > > +	int ret = 0;
> > > +
> > > +	survivability->size = MAX_SCRATCH_MMIO;
> > > +
> > > +	info = drmm_kcalloc(&xe->drm, survivability->size, sizeof(*info), GFP_KERNEL);
> > > +	if (!info) {
> > > +		drm_warn(&xe->drm, "%s failed, err: %d\n", __func__, -ENOMEM);
> > > +		return;
> > > +	}
> > > +
> > > +	survivability->info = info;
> > > +
> > > +	ret = fill_survivability_info(xe);
> > > +	if (ret)
> > > +		drm_warn(&xe->drm, "%s failed, err: %d\n", __func__, ret);
> > > +
> > > +	/* Only log debug information and exit if it is a critical failure */
> > > +	if (survivability->boot_status == CRITICAL_FAILURE)
> > > +		return;
> > > +
> > > +	/* set survivability mode */
> > > +	survivability->mode = true;
> > > +
> > > +	drm_info(&xe->drm, "In Survivability Mode\n");
> > 
> > this one is good!
> > 
> > > +
> > > +	ret = sysfs_create_files(&dev->kobj, survivability_attrs);
> > > +	if (ret) {
> > > +		drm_warn(&xe->drm, "Failed to create survivability sysfs files\n");
> > > +		return;
> > > +	}
> > > +
> > > +	/* TODO: Pass Survivability Mode notification to required child drivers */
> > > +}
> > > diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.h b/drivers/gpu/drm/xe/xe_survivability_mode.h
> > > new file mode 100644
> > > index 000000000000..0d5c325322a2
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/xe/xe_survivability_mode.h
> > > @@ -0,0 +1,17 @@
> > > +/* SPDX-License-Identifier: MIT */
> > > +/*
> > > + * Copyright © 2024 Intel Corporation
> > > + */
> > > +
> > > +#ifndef _XE_SURVIVABILITY_MODE_H_
> > > +#define _XE_SURVIVABILITY_MODE_H_
> > > +
> > > +#include <linux/types.h>
> > > +
> > > +struct xe_device;
> > > +
> > > +void xe_survivability_mode_init(struct xe_device *xe);
> > > +void xe_survivability_mode_remove(struct xe_device *xe);
> > > +bool xe_survivability_mode_required(struct xe_device *xe);
> > > +
> > > +#endif /* _XE_SURVIVABILITY_MODE_H_ */
> > > diff --git a/drivers/gpu/drm/xe/xe_survivability_mode_types.h b/drivers/gpu/drm/xe/xe_survivability_mode_types.h
> > > new file mode 100644
> > > index 000000000000..f9dbb6d80692
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/xe/xe_survivability_mode_types.h
> > > @@ -0,0 +1,35 @@
> > > +/* SPDX-License-Identifier: MIT */
> > > +/*
> > > + * Copyright © 2024 Intel Corporation
> > > + */
> > > +
> > > +#ifndef _XE_SURVIVABILITY_MODE_TYPES_H_
> > > +#define _XE_SURVIVABILITY_MODE_TYPES_H_
> > > +
> > > +#include <linux/limits.h>
> > > +#include <linux/types.h>
> > > +
> > > +struct xe_survivability_info {
> > > +	char name[NAME_MAX];
> > > +	u32 reg;
> > > +	u32 value;
> > > +};
> > > +
> > > +/**
> > > + * struct xe_survivability: Contains survivability mode information
> > > + */
> > > +struct xe_survivability {
> > > +	/** @info: struct that holds survivability info from scratch registers */
> > > +	struct xe_survivability_info *info;
> > > +
> > > +	/** @size: number of scratch registers */
> > > +	u32 size;
> > > +
> > > +	/** @boot_status: indicates critical/non critical boot failure */
> > > +	u8 boot_status;
> > > +
> > > +	/** mode: boolean to indicate survivability mode */
> > > +	bool mode;
> > > +};
> > > +
> > > +#endif /* _XE_SURVIVABILITY_MODE_TYPES_H_ */
> > > -- 
> > > 2.47.1
> > > 
> 
