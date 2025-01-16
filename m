Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B96EC02180
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jan 2025 09:52:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33C8710E91D;
	Thu, 16 Jan 2025 09:52:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JXf5W6f5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AA1910E91D
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Jan 2025 09:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737021152; x=1768557152;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GwM8sC3iK/geTWu2N98m7526YddNd1I6n9cbFVpCgDs=;
 b=JXf5W6f5YIwyV8nJ8T+eQVGEBCltE79Xjg1OA8+oIEPE+5YNIw3KvBVA
 ZJ60070CEFGMhDH7Q11+QAbA3ahW4IbCtjEB6tLizkUbBGsy53U6mV9/t
 ZhZn/Ia6zqNJnGXRaIRkQbpLxfuz6Wu4iAupAewAXdYAuFladjOHTN7Fy
 WMBLBreOyfMcjt34C02BGdJYmriAWr8SrW3oYIilSfD3BSC62NbfZEXs2
 OLrVoNeD2WHnRRW7ozrTNbN3SBh0OQww/vdY8TwJCoO+mpmsYkSVXtXLZ
 JM0Wsddo8Lo0A3Ir73+VdnS9bG6uJjEmA/t7cqZRLlJ31SxvRteoKICGL Q==;
X-CSE-ConnectionGUID: OyM4UPKxRK2m1v487ih3ZQ==
X-CSE-MsgGUID: QPbZPddeRrWrLKTq5tnESg==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="37552763"
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; d="scan'208";a="37552763"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 01:52:32 -0800
X-CSE-ConnectionGUID: 6fA75yhXRAyQa2UZP1TY6g==
X-CSE-MsgGUID: 94AgT+nLTHCyvYHmWZn0pA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; d="scan'208";a="105254141"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Jan 2025 01:52:32 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 16 Jan 2025 01:52:31 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 16 Jan 2025 01:52:31 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 16 Jan 2025 01:52:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ELd03oyqhEHYtSOzK9rEmO3HecJtIQpzIkFvk/fxPvC0F0iStm67EuadbjjDCuG5sDbEMdKsUHqRxPzUlwAmoHyZ4gosNUD2zsSbaiVVBGNJJO33uZ00d30CvTvQ52ChujVOICrKV/2J15D//taERsT0lGpVBca07cF07WZdPWwPF8bLO2vo/PXuRsd/p6S1CuD0bDjRdJLPIkFeyVBuLqzI54HU4+3+3ZAtYpN8E/3nVBwopeNEkZZIanyT2MGhL078GAPuVXnPafJcBjJIeJJsR+vqVSi1ItRAxgxRYSkauSFNwR/EoqVaXeWQESxxdodWZxAmXobTaUHCjnBjjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aKiB6NfQsnxeU4PaCmtf/Neza12EdjGE8vtGhhgNJVo=;
 b=RoGBwQCFZKqhGVL0J/YA6TifeEfJXI9gP0rb8lI6G7lGmYX9BSHhjGL2u6yV0D/iycN9qREdfHp7IIt4/jKSM8IhlSt7fYwCR1aKkMqwgPoGWLAiGfT0p5EQY5P5kzTt4/OswM0d4ZArrofJGLy1G/U6gQ5qAwlesu9eVkmjAzCwra7Itb5qvHdJUf52INGizNZTPRA9XbrUsWnp+a8YZZp9VCIoV6qzD55J4SDdSMD+45+HTsO7RMTjgItJXUj8oYuu8zz8zJ/Y523tkXcoMMnPckrMckJxK0vdyVBzRPitN5d3HsTCLxuKyItaKkLkXb4/Fo8eRB8dyCIJEVATTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SJ2PR11MB8404.namprd11.prod.outlook.com (2603:10b6:a03:53f::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8356.16; Thu, 16 Jan 2025 09:52:29 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%3]) with mapi id 15.20.8356.010; Thu, 16 Jan 2025
 09:52:28 +0000
Message-ID: <0e7661f0-b2f3-45d1-a460-fbb86798f13b@intel.com>
Date: Thu, 16 Jan 2025 15:22:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] drm/xe: Initialize mei-gsc and vsec in
 survivability mode
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <aravind.iddamsetty@intel.com>, <jani.nikula@linux.intel.com>,
 <matthew.d.roper@intel.com>, <alexander.usyskin@intel.com>
References: <20250108103959.1219312-1-riana.tauro@intel.com>
 <20250108103959.1219312-4-riana.tauro@intel.com> <Z4E8IuZy64CN2j3m@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <Z4E8IuZy64CN2j3m@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0226.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:eb::9) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SJ2PR11MB8404:EE_
X-MS-Office365-Filtering-Correlation-Id: ef549d3c-cf0e-40e3-b8fc-08dd36137d16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eEpZRk5yZm9YN1NUUnJKcHBUc1hLNTF3TENZYm14Z0NLRWVDdUtyNXdSVUFQ?=
 =?utf-8?B?QmZSOElHRzZHLzdGNCtxNE9FM2c4ZTNrZFZqdmNDY0ZrdzJCR3YybWthcWxo?=
 =?utf-8?B?eXhiRWszd1JyTllZQ3g4TXpkbVJCaTR0V1lDeDh5MTRENDRuUUc3L3hndjJ0?=
 =?utf-8?B?MFJvZHVuaGJnL3pXQlErdFB1dTQ1M2Z1RFlwTzVxbUh3MUF3YTRidTluTXZS?=
 =?utf-8?B?eDBwaGZuSng5R09aQ20vRUVTZHl3ZXNsMW05YkZWNFg3NVlnSFhkRTlQSUg4?=
 =?utf-8?B?VkgyN2tHanhVWVpDb2RjVlBwYlJZSUY0bG9YNGRTZWhXcC9pNUZ1RUp6OWxT?=
 =?utf-8?B?TWxEckVVUFp4elJZbC9teTJqTGFxTk1uQzlYa0FJY0xFMXhVTmM0NUh6dHI3?=
 =?utf-8?B?Wm5UMDR6emlaUUtVMmZSUDlQakVJalpKTFBlUHVxaEg1MVZCWEVVajhGRURR?=
 =?utf-8?B?azBLaEJSSXBOZGREaXRXRU85Y3g1anMwNlM3VEdmVlBrN0ZZMjBWbVVIeE9S?=
 =?utf-8?B?TWFsa2twRjl6d1NYdTZiZXVBOFlGbHlzZ0wvMldNcXh2WVBtT1g0MVU0K0pQ?=
 =?utf-8?B?dlp6SHR0dk9RcUtJZzNRYWNXSFdBcy9jRGNqTUhHaGtuOVBjVDU4WjBRVWRa?=
 =?utf-8?B?YW5EYUkwWDdzUlZRaEloY0NQaDgwV2xGcWo2YmFXOEtLd0ZFNUdmckRrRmp3?=
 =?utf-8?B?eWRuekRqRHRSUFRjKzkwNERzZ2JKUGRQM0hjYlVtMjdBUHJOS1hKMy83VXE5?=
 =?utf-8?B?RE9zS1VtMTRLaHV1SWtwSklnRWhJTFVqZlp3WXdFaEMyOC9hbUlYam9yY2JB?=
 =?utf-8?B?eU9Jb3hWT3lQRUxZWkJ3WjJDY3hIcEY5bUtmKzhRaDBUZjdLaEsrNk5GK01Q?=
 =?utf-8?B?OEZFS0RKYjhJY3kxVEFvai9XZlc2SG80NVdjcWlTTkFQbTVaSUM1cCtmMldT?=
 =?utf-8?B?TEdtKzVVWElpMW5MWE16TkdmZ1J0VWpYRzFuN0cxcFc0WGVWVXNmMHB5SldR?=
 =?utf-8?B?MWtnMzY1QU0xKzhyUUtVOTVtOGx2emgwZWJudWtENDV0aUkrS1VOZDVPdkNi?=
 =?utf-8?B?WlhjaEY2clBLZzVDbWhiZThXS2puYytwWlRaUXpvREQ0aXRhc1lpQ0pSZHdX?=
 =?utf-8?B?Q1ZLM1NDSlo1a1NhVFB2OHdlcWhxQmVsc1ZYaEUxbTlENHQ0L0Fwb3lvUHlJ?=
 =?utf-8?B?ellKbnV6OGZpUHptMEg2aWRFL0ZQSGo3SkVzYXp0YXV0K2RLdDFodFdOTVVV?=
 =?utf-8?B?NXZKckVaTHRpcFFpVWZ3Zmxrb1dVWEN0Nkh5OFpVWlcwRnptUnoxRFZ3L2Yz?=
 =?utf-8?B?WXJpeUdQQkxEQ1AvQ2xLU2dZd1VFcWxvU3pBY0tOVVVoRGJmeGlFc2lpdlhP?=
 =?utf-8?B?ZEpnbW40OVRTQjYvam96Slo3emk5b0RWdFpIblcrandtemxhRmR3NXB5N3Vu?=
 =?utf-8?B?SUV2SWdaVi9qK2diRTNqZ1RlalJobEZyS2NEQUdJejF1SzJnRjFZTnlpQ1pC?=
 =?utf-8?B?VUttS2MyYlJtYnZleUFQejkxbEpxTVZCZFZCYTAyQW1GU3BBMnlGY00rUm5k?=
 =?utf-8?B?bGJ1RjIveFRCRzZuWUhPTjFqUjhDNVRkY05TRG9uQURFa2cydmRJRjh3b3E3?=
 =?utf-8?B?MnljSXFpMWxEM3QxeUpyU0U2REIvMGEwUWNHNmV2R0dWcWJNYkxyZW51SFVJ?=
 =?utf-8?B?RnJZSFRlbk95L0h2RW5RZHVYUHNTelV6akdnRXdFaEwrUm1FMTNqTG05dU5V?=
 =?utf-8?B?SDR5by9YZURxSGdWV0pzNmNXRUlNUkMzb3Y1djNhUjlBcDN6bHMvNDhndVBr?=
 =?utf-8?B?aTdNUFBlb1B5d3hPYUttNmxMNnl2U2JrTkhBdEFIWk4zNGtaakpxeEQ1NjNz?=
 =?utf-8?Q?qmV+9sVk0bHBa?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmd6MG1TQk5BWWJYQnZHdEVvS2NHMWpLc1lBSkZmeUJxLzJGYWVFazVuRnJE?=
 =?utf-8?B?M21rSmtONGRHbzlMQkMrdklIT2hSVjZaUUk0OElVckE1bHFCUVJGLzJoY0JL?=
 =?utf-8?B?Tkp2S1pXNUtIZmdnUDJ3NnE5ZmMvSFQzS1haRjFJeFJsTWhtZmc0cmNDa2hQ?=
 =?utf-8?B?a2JMSnF6TkY4eVZaalB6elZodmNtOWUyOWc0UXRSVVFGOTlwbFV1Q016ZktJ?=
 =?utf-8?B?dlFxVlM5eTkrV2x1VzlleWozdlorQWFzUm4vSVhYUlhzTE5KbElGeVR2OHh0?=
 =?utf-8?B?MHFJb0doaHNyQ2Q4Zk5sdFlHM21FSTRzNmtyM3YrcmdEUVkzOWZtLy9HVW9D?=
 =?utf-8?B?TGhXWjFuMXFIZDdJcUNOSWpJTnpHaXJ4ODFjejJycVpuS2xKak9sY1RmOUxy?=
 =?utf-8?B?Uzg1QXpiclhnU01JWXN3WDNKeUdvbGErK2tpMGRiMFVVK0RvV2FHMTAzeGxx?=
 =?utf-8?B?dkhUZUYrd24xMmIyK2hrbjV5TEJ1ZUJUNG51UUN5d25kdVl2UGthRkVuTmVv?=
 =?utf-8?B?WUxIYmFmbkJCUHpEWWRLVCtCd3pYRHBzbWhWWjNGeWRWc09UZ1BxNGdUdG5G?=
 =?utf-8?B?UzEwQkNvNlVnK3dHYnBXZFhUczIxQ3ZEL2ZuQTZTQzRETUg2b3p5dTQzcUoy?=
 =?utf-8?B?WjB5KzNJYVgwUWtMTU5mZWRsWTk1NFFsd0dtb1JhUitJQkRuVkdVbVg4VWo0?=
 =?utf-8?B?aGRyZEtHbUNZOWtTdUFDR0U1cWV0U2NIVDVHMU1yanF5aFU3czhxYTdSOUVm?=
 =?utf-8?B?cy9jeUxIeFRIeGpHaFgwNW55bmVqRDlKdktldTVnZGI3LyswaCtNb1NmYXcz?=
 =?utf-8?B?M0xuNDRXY080TDJsSjV0WndabWxzNEdDTUx0QzQ5ekxRQWt1RjlvUDk1OFl0?=
 =?utf-8?B?M05HSHpQeFdBRWc4L1dIRkVEWUtsWHQ2MzFUaTdNaVQ3ODZ6MFRtREpjc1VP?=
 =?utf-8?B?VGxxalZLd0lHQVdIc29qTGk2VGJSd3JNUFVSOHhtS3kxdU1Zb2JZMTkrT252?=
 =?utf-8?B?elhFQjBEQ1lQdGl2QVhkZHduMGgyNlBmbW1WeGQ3RzljTUptdkgyWHRKZkgw?=
 =?utf-8?B?TnhvMTQ1Zk5sM1VuMmo3MGFmb2dYK2tyR09FVHlRNWlCQktWT1BoZXE5NFdo?=
 =?utf-8?B?emdHWUlLV1Q2eFhjWmI3Uk9EUlFxWEdBcHFXNGkyQkpHSlNtL3diWUx4SFZK?=
 =?utf-8?B?VzBoRm84VFVzMktXdllsaFE4MXAwZ2RqVXM1S0wwZVZtSEROcXVvZFl0TmRm?=
 =?utf-8?B?WVY4QncwMCtYQitPdU8yYjg5SGEza2RVbzJOMm5TcmNWS2tJWThJdE9YeUF1?=
 =?utf-8?B?bERLQTBMSHlNTlh2RkFGTTdJYmdNTDFUOG9DQ0FkRUxLZXN2NE5pVnRmUnhy?=
 =?utf-8?B?dU5SOFdHWStHRGhKK0dEbE5KOFVKdTV2QkNSb0Z5QXAvb3B1QmtzRzVUYVRX?=
 =?utf-8?B?d3pyUU1ZZGlSalRIQXlQK2FBVnl2K2x1Vnd4Kzkzd1BXRlVvamc1dlN2MjYr?=
 =?utf-8?B?TFJzTUFud2IxcE1BTGFyUERCcEJJbXlHOEpTbmt5VTJ4aVAwSVpJZ1NPV0tq?=
 =?utf-8?B?R0NhU1VIaTdseGxPVHpqUkdxVEpVL1FtbjhzYWZVVFN6TXNsTDZPUjYyVllR?=
 =?utf-8?B?dTJLWERMSkk0azJ4bnFoT2lSSFZOOVBncVV0NllqdWdNNGkzRmdhelY4b1Zp?=
 =?utf-8?B?bjN2UHEzYjhUUXVhaGhBc0hBT3I1ZGhJN2Y3UGlkQzl3U29iWGwySU5UZHg3?=
 =?utf-8?B?QXh4ejYvcXk1TGY5dHIyUW1mTHA4WS9rV2xUcnp4NUFWS3RKVjhHcE9iOGNC?=
 =?utf-8?B?Q21INnZOL0tmeThWcjdGTUVlTjVxaG1CeTE1TWIwRi9BWkl3V093SWpWejRI?=
 =?utf-8?B?c1NEVEk4K3VZMFRlenJEd0Mwc3I2OWtXOC93QTgwWk5vK2FBbVluZjBBQVBZ?=
 =?utf-8?B?L3Mra1JVdHllSU94SWZsdHRsOWs5VU52djMzNnByU3JZcmN0TDJPNUtGSXF6?=
 =?utf-8?B?RFdCRDdsTVZVTUlvcXJxR1ZtaGVDMGE1QnlWVWlKZmRYaGpsN3BBa0dYNzd2?=
 =?utf-8?B?RVVZdC9xOWtNMllnQnBORE1PSEJnTnB4MlRtUWo5Nkkra2ZDUnNpOUhZbm1Q?=
 =?utf-8?Q?uhFgkT9hfKtxlfcJ9GhkhZ/An?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ef549d3c-cf0e-40e3-b8fc-08dd36137d16
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2025 09:52:28.8505 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xS/noor4GSbPPhf+Gr2PW2NOkyv9fe5XRO/BpUcNqU0c7N/HLe6sfPj4NJLxYj/JFmPe0UK+x+Vk+KgOirjVqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8404
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



On 1/10/2025 8:56 PM, Rodrigo Vivi wrote:
> On Wed, Jan 08, 2025 at 04:09:59PM +0530, Riana Tauro wrote:
>> Initialize mei-gsc in survivability mode and disable HECI
>> interrupts. Also initialize vsec in survivability mode
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_heci_gsc.c           | 3 ++-
>>   drivers/gpu/drm/xe/xe_survivability_mode.c | 7 +++++++
>>   2 files changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_heci_gsc.c b/drivers/gpu/drm/xe/xe_heci_gsc.c
>> index d765bfd3636b..06dc78d3a812 100644
>> --- a/drivers/gpu/drm/xe/xe_heci_gsc.c
>> +++ b/drivers/gpu/drm/xe/xe_heci_gsc.c
>> @@ -12,6 +12,7 @@
>>   #include "xe_drv.h"
>>   #include "xe_heci_gsc.h"
>>   #include "xe_platform_types.h"
>> +#include "xe_survivability_mode.h"
>>   
>>   #define GSC_BAR_LENGTH  0x00000FFC
>>   
>> @@ -200,7 +201,7 @@ void xe_heci_gsc_init(struct xe_device *xe)
>>   		return;
>>   	}
>>   
>> -	if (!def->use_polling) {
>> +	if (!def->use_polling && !xe_survivability_mode_enabled(xe)) {
> 
> perhaps this could be avoided by adding a new argument to the
> function? It gets strange that in this path we came from that component
> and we need to peek back there...
> 
> otoh I know that sometimes these calls with true/false in arguments
> can lead to confusion... and this is done really only once or twice
> during probe, so not so hard feelings here...
yeah that is the reason i used the function here. One of my previous 
patch, had got review comments against using boolean in arguments

Yeah this gets checked once during probe.

Thanks,
Riana
> 
> up to you:
> 
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
>>   		ret = heci_gsc_irq_setup(xe);
>>   		if (ret)
>>   			goto fail;
>> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
>> index 4a978c7018c9..39ab898193a1 100644
>> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
>> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
>> @@ -13,8 +13,10 @@
>>   
>>   #include "xe_device.h"
>>   #include "xe_gt.h"
>> +#include "xe_heci_gsc.h"
>>   #include "xe_mmio.h"
>>   #include "xe_pcode_api.h"
>> +#include "xe_vsec.h"
>>   
>>   #define MAX_SCRATCH_MMIO 8
>>   
>> @@ -152,6 +154,10 @@ static void enable_survivability_mode(struct xe_device *xe)
>>   		drm_warn(&xe->drm, "Failed to create survivability sysfs files\n");
>>   		return;
>>   	}
>> +
>> +	xe_heci_gsc_init(xe);
>> +
>> +	xe_vsec_init(xe);
>>   }
>>   
>>   /**
>> @@ -203,6 +209,7 @@ void xe_survivability_mode_remove(struct xe_device *xe)
>>   	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>>   
>>   	sysfs_remove_file(&xe->drm.dev->kobj, &dev_attr_survivability_mode.attr);
>> +	xe_heci_gsc_fini(xe);
>>   	kfree(survivability->info);
>>   	pci_set_drvdata(pdev, NULL);
>>   }
>> -- 
>> 2.47.1
>>

