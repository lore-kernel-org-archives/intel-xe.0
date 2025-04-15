Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B910DC369AB
	for <intel-xe@archiver.kernel.org>; Tue, 15 Apr 2025 07:29:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 675B010E07D;
	Tue, 15 Apr 2025 07:29:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RIcySlV4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AE6310E07D
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Apr 2025 07:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744702192; x=1776238192;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=eNdqBJPIVlwI/h+2rUFdCQho12USKxEwDW1iIC3acCA=;
 b=RIcySlV4Xa49HiLCP8F4YomwgfNXgGRQvj8Q9jnj8oXneW+N/caG3s8j
 PDdOFZpm8jeFeKnfji6Mnlh9CxgeCGSJIYzRIo3f9gTx6e/ykUom9WIHV
 zy7+OZdbWpkbbbCw348mrqTIjigumn/COoKnOFfSbnaP+JR2eTauBWLLQ
 EpVc1NZlvxpX7TS0YbZYiwfd7uh1SzHpXsaSmzjUB88VSPQi5rlXXAEEi
 WBgJcGI8t9LSIUR/DcVT415TYxewWiZmfyLCzxOQMZKXbSrxzjkS1jdy4
 pVchvXyn3HqtDWD1FflZS4F+fY8QmZz61xvHK8Uy9VMBCqMNoYNf7bbTz g==;
X-CSE-ConnectionGUID: PJraVDofRjK685lFxbTVOw==
X-CSE-MsgGUID: 0/NY7IJvTvebbRAd4FYkhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="57187791"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="57187791"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 00:29:51 -0700
X-CSE-ConnectionGUID: obYo6dEaTDWxJ03Q0mzf0A==
X-CSE-MsgGUID: 3NWs3NpSR3a43D8UqZy9Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="161014031"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 00:29:51 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 15 Apr 2025 00:29:50 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 15 Apr 2025 00:29:50 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 15 Apr 2025 00:29:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AtiydeaKOReIPQ4zHH1ZGZbZN702gtnm6B3cyufT/ItFJUjDMPMXXAFhiwwbBmo66DIXeesyb4D92Y/SRiwans8eGWWGCjGhxzBgP+yXczhtCv8jEUUb22WdgguJOCBKJT+zmsWNs9gLiSU/urKRD8tAkK/4ZnIuMFrGMdyzJSY8zxrL6aCxh9h6yBFxEh3KP4rJv5+zZklwd/Ic0Mx3SztJ3u58maBac49/dzrdB4sjBGMyjeX1sM8SUn7qBQEu0rt2CSP1xOhT8jxtq5f2AjVRxA2Osc4AvUwgcwPInteRcRHXRxyDAivAESJ/awb+pYZyieTQKxKVQCpQdy/SIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X36aUZxEt3zjq6FodSafo3JtoWwnZS3QkLC0mrwU8jw=;
 b=tPXjPHEdNmEtXA+1NUH326YtxtoGTlFzayfBpp7AYqHO4zGme6PCpmCZNJB687beIgv9mh9CpaU5QNiXwLfnpQhr3BCA3fB5yFHyP6W6RNVDz0ukQd1WHieGiRvHAM3kmmNKnH42XJCxaLGf2c6Y7Idd4Yd/vfaIlQ/0Lh9JqkDgajHm4CIJ3F4BswgQb2oPtiNeN450JPq0Obgg4qKoBa3UbR1CCXR9GsdNh/+w5zOEBZd28HDeFNckkTy2/DgmSTq8KiK0L+T/9J9MPv6G588bCI+n9y24lJzQq92HWnWzm3K78b97bSF+BMurbpXCBI71l2lwyWth90XtuGM5kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 IA1PR11MB6196.namprd11.prod.outlook.com (2603:10b6:208:3e8::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8632.35; Tue, 15 Apr 2025 07:29:29 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%6]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 07:29:29 +0000
Message-ID: <51c2caef-23e7-4c1b-8365-6e0ff7e3d5b6@intel.com>
Date: Tue, 15 Apr 2025 12:59:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/guc: Fix out-of-bound while enabling engine
 activity stats
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
References: <20250414202347.1909-1-michal.wajdeczko@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20250414202347.1909-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0172.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::16) To IA0PR11MB7955.namprd11.prod.outlook.com
 (2603:10b6:208:3dd::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|IA1PR11MB6196:EE_
X-MS-Office365-Filtering-Correlation-Id: 54a0a6bd-5ae7-45f1-5298-08dd7bef41ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VGthVDJWQXZydGtlZ004UDJPT2xGczkxSXJTNjVRa2tDdVRWUGZhWEs4MTNL?=
 =?utf-8?B?ZldZdkljV283NmtIT1pSdFl0eTdTNW00UnViallwUUQvSGpWeXJhcG9YaUoz?=
 =?utf-8?B?T1p6bk1hY1AvQkpObVczTnlpY1VFcStiMkxBU3MxQWV0N2NNZXdUWDRWT2ZU?=
 =?utf-8?B?aThwTUt2emJKYnYvemJLZDFDL01OSVI5YTdDUTQ1QmxJODI5WjdxZGJUU200?=
 =?utf-8?B?ZU5McERROEZ1bWRIbFRRREtMalo4ZzIvbWVrSURKNm1JT21Ka0d1dFFCRFda?=
 =?utf-8?B?aldKWXdQWG50WVp6Z09SMmNINGtoZCtLb3czL0tVMmJkV0x2ZVBpWjIrUnI1?=
 =?utf-8?B?cEdvUjdTSmZvSlFKV2FXK1VaUWtKYzRJbjNrZUhDT3lNczhMbExDMFBqSnQz?=
 =?utf-8?B?aUJ6RW5yTDlZR2V4d1h3eXlORGM3QXU0N3RxWWtsY2RnSTFvNlFqNzFNWDQ5?=
 =?utf-8?B?ajhyMFM4OW0zR0JoQ1VaS1pyanVWY3U0UkhpNDNCb3I1ZHJOcTcxdlZHMzha?=
 =?utf-8?B?ZGJjUTZkTmJSRmZqdVVCTXB4NEpRUHQxYXpDaGp0aXZxc1NRNDdyUEY1NEFJ?=
 =?utf-8?B?MmpscEJaN016Y0k3Q3c2WHJISGZSMTZKWlB6R2dPVG9pYW9hbzhlVHByUTN2?=
 =?utf-8?B?cThxdDk5UzFKSVZqKzdBb3VuZ2xYdXlrTXUzNkFZVWpjQ1dNczRJWDFzVzNV?=
 =?utf-8?B?VDRVWGhuS2FSd21UeTlhcG9MWHg1cmtPSldaNURXcDBqTUZiVzJ1UmF0alVn?=
 =?utf-8?B?aEp0SjJnbFdqaS90cmJmb3VxY1FrUEQrdit1MkpET2lBdEpJa1NIRU9kL2tQ?=
 =?utf-8?B?WTdNRTVlelc1cS9ndHNzOEJTemZsTytvQ0tyL1pkMlVYSVhCVEdxTHZrSjRP?=
 =?utf-8?B?WENYa1kyb2U1QW55WEVqQlZMV3V4OWVxZkJRd2JWRWR3NWhWU0djVHcwNEc3?=
 =?utf-8?B?a3V2ejJMS0I4U3VTZTk5ZSs0Z01aNnB6bGZQa2piQU1OdEdQQjR2MlNkY2xO?=
 =?utf-8?B?ZlZ2OHkvbjJqYW5PSnV6SnE0eFpHYmpTZEZHM1hKK2Vlc1MwSUI1dHNiK2hN?=
 =?utf-8?B?bmwzM3pEd0F2ZEZaeVFtRzlIWjN0VW1BRXkrVEtIRmsydWFORFVFYzNhRGtZ?=
 =?utf-8?B?N0pBazlnVXhYRnc2cGZYNldjNS8xZVU2M05LblQ4UDFwOXk1VmVtb1lyNE5L?=
 =?utf-8?B?RTZ4RjUxQyt3N0ZRUFMzWTdCdmlGL1hRUjI0NkRFMFdVdW9nN2Jlc0wybitX?=
 =?utf-8?B?UXE1TTQxZTh6MGJldG5GeFJqWVdmbWd6RldKOG9ibFRlclVHWXF5cXJzcHZT?=
 =?utf-8?B?V1BEa3QvajZIVEErQmlXMVo4SEdLRGxQOUo3NENmNzRWaTFYblBtUDhHNTFU?=
 =?utf-8?B?MStrTlhIUXF1TEs0VlNBQVN2ZTlYdndIeHFKeUE2UnhEVEtNSjRBSkIveE15?=
 =?utf-8?B?dHFKNnk2eFNuSG9INE0vc24wckpVT1diVVl6NUU3S0oyVjZqTW04aFYyb0Ro?=
 =?utf-8?B?NEV0SWtvVlRPYnJFOWEvRHUvbGNpeUdoS1dFbVJXUTZLU0lUdGplYzdJZjhv?=
 =?utf-8?B?aTJiU3Q0Rzg2TkY2eDh0ZWNSVktWbThlUU1CT2RlRDZyVkovTEdza29odXha?=
 =?utf-8?B?cWhQRnZ4MGJ6WHhKcVlJclkwYkxSb1N0M09QbXZMU3U5cHdITGNha2RIM0hm?=
 =?utf-8?B?a1ZjYzRjNlpONHNZNUpnR3BkcWZzemd5ZFBDWGlKak5qSU9OUlVxYmtwNTNX?=
 =?utf-8?B?TlZMMDBvanIrLys5OTdUTlhxeTFRRVRvOU9Jc2p0ODN1c2NzekY3MTdNUFI1?=
 =?utf-8?B?M2duY2lPcGk5Wm9nVXA1cm84MjBkRnR1MDdjZTQrT05YV2xqQXJ1VXdFVjI1?=
 =?utf-8?B?K2hvT3VCNHdjM09PVllocmE4bVFnZkdIZFluN2x5bk9xODRYZCtPZm1XQnJj?=
 =?utf-8?Q?i44i0lHoAV4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NHcwL3hLL1hNVzMzSGFibkdkUWRyd2ZoRk9qZjUxOGxLN0xtK2R2bFphNjhV?=
 =?utf-8?B?eDl2YUw5VkQxUkRSTHV1NVVUUCtLLy9oMklHall6V3dBczltVnYxL3BDRjFv?=
 =?utf-8?B?TS90T0t2OHRBMzNSMXRLUXBoaVRkZlBRVTl2bjFhTUFQZi9CT2ZocS9ucW1C?=
 =?utf-8?B?ay9EaWkzdmY3SUp2bzY1U01wNkRvYnQ1aVBPQVZIYkZoT2I4R3lLVW1tZnVl?=
 =?utf-8?B?bXJjd3AyTFJKVEdYWERJTHVkeC9VMVpOWnhtTXBTK214a0dRK0R4WEthcUx2?=
 =?utf-8?B?a2k5eTIwSmlSQTZUeXhwRU9oVlRHbkRWbWhEcFZuaVYyWkRybjZmSUVwWW9o?=
 =?utf-8?B?L0Y1UHlQZFpHWnRMVHJ2bmFzQkJXMnovTlZSay9CNlhOaG5taUNPYy9BN3pX?=
 =?utf-8?B?RGJCSm8vSXp0UTlWWXFONGNwY1ZyS2ptdVpxNC9SeDRKVG9TWE83Tms5QVdY?=
 =?utf-8?B?ekhRK3hqdGNGV25hait6Z21jOVdjcXd0SFBIdnJsRzQyYjNIaE9XSG00KzRh?=
 =?utf-8?B?TVNqQk5Pa25BTEJSMHE4S0h4ZWprb1V2S3I4dEVQaUJ2NnF3RGxBOW5xQ0lj?=
 =?utf-8?B?Uk9CZVpLUWtBUERZeGFPR20rTXkrQ1RUQ1A3c0NYdFBwRERzR2xWK0I0YmhS?=
 =?utf-8?B?WWJ3Y3lUWTYzdTdoQnlBb2lNVStVVUVPMjlvWkNsRlY5U0xxUTAzajVDa3Na?=
 =?utf-8?B?RUNmbW8wS1cyWFByK0xUbkZQV2dqcjBnUEJWWTNDa29FSlY4aW5NUVVMMkg1?=
 =?utf-8?B?WkNOb0V0Tkt6bnBOYkNZYlg1WG9BSWo2djA0Y2R0ME5SblZUM3cwbStRN09R?=
 =?utf-8?B?MFBFUkEwc2tHUFA1anhXWThmZnNUblZRa21PQzVMNU9Wc2JHY2JjbEMzTnNm?=
 =?utf-8?B?eGhBQjBPV25kNExQZXc0alYyTm1LVVVwSDVnaCt4Q2tibmZZMWVzZURaWjRY?=
 =?utf-8?B?emtLcDR5bmlUYjJZNU9UZkNaTytQU1hCTnVRNXVXSGhnRk9ZWWF1VFRRQjhj?=
 =?utf-8?B?R2NwYUdISUs5SmFxNkZSRkhLN3VMNFJSM2ovNm1iU0JnYVhrZStSVThsSS9Q?=
 =?utf-8?B?aHlUc3J4d3ZoSEdPNXIwUFpQdWJFMFlKOVpEZ3d0NmFiZFRJa2RWV0pQVnpN?=
 =?utf-8?B?bWZBTGw1cmo2TTdmbnRqenB6WG9rbDkrRjgvelRSUmpNczdBWDJodXlUa0F4?=
 =?utf-8?B?V05GZG5rc0lVSG9SVW1vR1cxYytIdEpiWTFFSVFuWHoxZUROZ2lINWdndUhP?=
 =?utf-8?B?eDRYZVN2YUtzZlIwVGlXOFJqeTF2Q2VWOElRTXgxSVlZU2Y0NEpuMEd3VFho?=
 =?utf-8?B?ckIxSk0wOTMyY3gwODVmeDhEU0Y1TUVlbWxSSHdjSHlZLzZ1TG4vbndETkFm?=
 =?utf-8?B?enluSVhyWHBRZC9SdTRndkpOUHNpV2NRSXhYYS8xRG5vdGlMMVQyaEVSZWF1?=
 =?utf-8?B?QkdhUUtaSkNkQXRrTERuSmhld0duR0tyazR6MzNzU2g2ZWt1N0pJS2tuSGhK?=
 =?utf-8?B?ank5cGl1R0VUWkVobFloT0hRZFlxQlE2a3ljbXlQZVRBRFFGWDB1aVJnRHRs?=
 =?utf-8?B?RmJWa1l2VVZFQXVKeW5EemJyMVdFa3Q1SUJjVlJLanQwbUl5dHRodUQwZ0RF?=
 =?utf-8?B?b2dWUndnZmJxZ1JLYzJqKzdGSmZvWWozOEZ1cFBUNi9RYU1MNFI0by8vZm50?=
 =?utf-8?B?N3E5RnJFM2NYbGRXclRQSVExM0ZxS3N4WFVnMm5KbVVBOWt5VEdDSU9vcnJN?=
 =?utf-8?B?WkV2VUdMdUdQYWxqZnp0bndVQjY0ZHJ5YlM3NlAxSWV3V1ZudHBucVpMZ1du?=
 =?utf-8?B?UmJkcmp3SUJNYmVMTGRaQ0thdEVWeGNDNjRYYzB6WmZuVTl5TTFUMnlMSnBm?=
 =?utf-8?B?MVRDVG1nWTNpVitRWmhkRVRTeXFEcnNEcXpmSHFwWVRvaHUveTJuYmVHTUhE?=
 =?utf-8?B?WGNQdlpnU2ZVaERzNWVZUVEvU2cvdnRsZFlsY3BmRnpMOEQwdnVybTh5WGJ1?=
 =?utf-8?B?REcvaEhsNkdMS2xnSkp3S01tSklDaHVQZytJdTVDTUxTU2QwOWdTV0NXUkIw?=
 =?utf-8?B?NWVoVzhyTkViS3VtZXRvREg1d3pSV1RDc0NtdVR2SlBSOTNCL1AwM09sSU1t?=
 =?utf-8?Q?8P1LmLbIvTDv1GkVmCGi+w/V3?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 54a0a6bd-5ae7-45f1-5298-08dd7bef41ad
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7955.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 07:29:29.4677 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l9Qtn6GiMUXQk5QiU8mxvgWpN+jSAL4FSxkllUjdgL0MGDPkPoQz902YG6hrEqbw2hL46XTFcOJb4545ppdZ1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6196
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

Hi Michal

On 4/15/2025 1:53 AM, Michal Wajdeczko wrote:
> In the PF mode we allocate array of struct engine_activity_group
> that holds activity data split for the PF and all potential VFs.
> But while preparing data for use by VFs we ended with bad index.
> 
>   [ ] BUG: KASAN: slab-out-of-bounds in xe_guc_engine_activity_function_stats+0x41e/0x4f0 [xe]
>   [ ] Call Trace:
>   [ ]  <TASK>
>   [ ]  dump_stack_lvl+0x91/0xf0
>   [ ]  print_report+0xd1/0x680
>   [ ]  ? __virt_addr_valid+0x23a/0x440
>   [ ]  ? kasan_addr_to_slab+0xd/0xb0
>   [ ]  kasan_report+0xe7/0x130
>   [ ]  ? xe_guc_engine_activity_function_stats+0x41e/0x4f0 [xe]
>   [ ]  ? xe_guc_engine_activity_function_stats+0x41e/0x4f0 [xe]
>   [ ]  __asan_report_store8_noabort+0x17/0x30
>   [ ]  xe_guc_engine_activity_function_stats+0x41e/0x4f0 [xe]
>   [ ]  pf_engine_activity_stats+0x1b6/0x7f0 [xe]
>   [ ]  ? kobject_put+0x5f/0x470
>   [ ]  xe_pci_sriov_configure+0x28c9/0x3270 [xe]
>   [ ]  ? __pfx_dev_attr_store+0x10/0x10
>   [ ]  ? kstrtoull+0x3b/0x70
>   [ ]  ? __pfx___lock_acquire+0x10/0x10
>   [ ]  ? kstrtou16+0x65/0xf0
>   [ ]  sriov_numvfs_store+0x20c/0x400
>   [ ]  ? __pfx_sriov_numvfs_store+0x10/0x10
>   [ ]  ? __pfx__copy_from_iter+0x10/0x10
>   [ ]  ? __pfx_dev_attr_store+0x10/0x10
>   [ ]  dev_attr_store+0x3b/0x80
>   [ ]  ? sysfs_file_ops+0x135/0x190
> 
> Fixes: 2de3f38fbf89 ("drm/xe: Add support for per-function engine activity")
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> Cc: Riana Tauro <riana.tauro@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_engine_activity.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.c b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
> index b96fea78df8b..0fb48f8f05d8 100644
> --- a/drivers/gpu/drm/xe/xe_guc_engine_activity.c
> +++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
> @@ -304,6 +304,8 @@ static void engine_activity_set_cpu_ts(struct xe_guc *guc, unsigned int index)
>   	struct engine_activity_group *eag = &engine_activity->eag[index];
>   	int i, j;
>   
> +	xe_gt_assert(guc_to_gt(guc), index < engine_activity->num_activity_group);
This would happen only when num_vfs is greater than total_vfs since 
num_activity_group is total_vfs+1. enable_vfs has that check> +
>   	for (i = 0; i < GUC_MAX_ENGINE_CLASSES; i++)
>   		for (j = 0; j < GUC_MAX_INSTANCES_PER_CLASS; j++)
>   			eag->engine[i][j].last_cpu_ts = ktime_get();
> @@ -374,8 +376,9 @@ static int engine_activity_enable_function_stats(struct xe_guc *guc, int num_vfs
>   		return ret;
>   	}
>   
> -	for (i = 0; i < engine_activity->num_functions; i++)
> -		engine_activity_set_cpu_ts(guc, i + 1);
> +	/* skip PF as it was already setup */
> +	for (i = 1; i < engine_activity->num_functions; i++)
> +		engine_activity_set_cpu_ts(guc, i);
sorry, missed this when removing global.
Thanks for fixing this. Assert seems unnecessary

Reviewed-by: Riana Tauro <riana.tauro@intel.com>>
>   	return 0;
>   }
