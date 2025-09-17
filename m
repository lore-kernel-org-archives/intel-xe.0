Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52107CAC59A
	for <intel-xe@archiver.kernel.org>; Wed, 17 Sep 2025 17:11:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0450210E061;
	Wed, 17 Sep 2025 17:11:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kku3jP5P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB62210E061;
 Wed, 17 Sep 2025 17:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758129095; x=1789665095;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=0RAasjRkd7ZvC0KKie/EcHEyJu7YylOHsEiSoxDWFxU=;
 b=Kku3jP5PixphDX71Telpo1xGpbGVPgyzr0GZiTWp8SUw1ktWEtlvs7ci
 0JelFuN2Il5yPBI6xn+6mpVJuy/T87vuBic9QeOHvEwv8FG0fRobgmV6j
 U4dEmQbbXN2R5XJvFEu7rUDv/ZaJB6151eIWA6YKenV5JlVrnlmcUtrLb
 ZgvP4M6HlQ8UrYVel7scpYC7Wd2Fq3UUkgM7kAWOvTxT03TjlJfzj2FtY
 WMUzc6qCJQoRk9wdvYiiEk9bn7mfbwdFPRvl+uH2ic0bhd0WNqWezy2if
 eUfqbual2PzrmXo4aahSQlaXLO9Tz8DaAUhemKJOBOp5h31Gxrb8HS+Jd A==;
X-CSE-ConnectionGUID: e78DRH/pR2yumOAcrREVxQ==
X-CSE-MsgGUID: HaGEXZBSQJOgxMl4CRx9KQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="59486772"
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; d="scan'208";a="59486772"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 10:11:34 -0700
X-CSE-ConnectionGUID: 5AWW6XNET6uB+q93JtldYg==
X-CSE-MsgGUID: llOXWh0aQeWAspWFP9QOBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; d="scan'208";a="175709272"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 10:11:34 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 17 Sep 2025 10:11:33 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 17 Sep 2025 10:11:33 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.11) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 17 Sep 2025 10:11:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y9MLViyJFomOLDEjrP0j+UxZoWatxuUTQ/oBUQk7ei2/8wz+0LgPm7LDLPQsPQ/++WFLXKH51lkqF4M9s0KYdVE3CiRJEs5WF56ksuI8QGlLN8RDB4l1NeHt/BCl0phf1AFipMa1E16ZiF3Yi3mAoahJpDryPb3w1O/DlRzELWYs+Sjy9ozfDGPjU3Y/Xtfrp4FKu5svtbFOzcGGFjhcUKeqEnGkZFnTjc7SCGuaTzHllma+LffOInggWOzmkXA6IE1Ebbn7qn+COqqco6O8+nwXoFRzvI0a2DtjxQWMeYwnUBDl4qfRIurnuYvMEgG7jFtWHAnUnrDYW0PZEhdkog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EHzjWDaA5ELSfKXLL2bcb4w2fKWbbWcmfgG6SdJaT8I=;
 b=F88hk2q+zTYJdsa1gEiULvErp7P38S9CIrdM1FbWZy7E3/AfIFbaw5qPqnnHozEqSIzFUhJQQkamWiDqjygFwhme+2dkqtEbgGP+rriqtpQgVYaeBToMAetiJ9UiXLSmPH+c4Fxdx5BtA0WY8SAAfUChPGwrHl1ROZNw9KxPKJLjEV2k7UbexQ2QwJ8oHr2jFdQMx4aZSBdzCFieM3OPH3xh38agppg5yVhhA7Cjdd5HHvUOMplRdgy/M4HpvIDW9To5wXZ7jVFh8AdDtnGJXJE0ZncUpkFJn1bo2MstNUudPWcxD7g3AAOCyMUVnfVWoNbEe3rT4QKtX6lLkQi1Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH7PR11MB6007.namprd11.prod.outlook.com (2603:10b6:510:1e2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Wed, 17 Sep
 2025 17:11:12 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%5]) with mapi id 15.20.9115.022; Wed, 17 Sep 2025
 17:11:12 +0000
Date: Wed, 17 Sep 2025 10:11:09 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "i915-ci-infra@lists.freedesktop.org" <i915-ci-infra@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkJBVA==?= =?utf-8?Q?=3A?= failure for
 drm/xe/madvise: Fix ioctl argument check
Message-ID: <20250917171109.GB10167@mdroper-desk1.amr.corp.intel.com>
References: <20250911173139.1405878-2-shuicheng.lin@intel.com>
 <175761655082.327749.4386050153078504479@1538d3639d33>
 <DM4PR11MB545653FFCAA9733036BBDAB5EA17A@DM4PR11MB5456.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DM4PR11MB545653FFCAA9733036BBDAB5EA17A@DM4PR11MB5456.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0P220CA0022.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::33) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH7PR11MB6007:EE_
X-MS-Office365-Filtering-Correlation-Id: add9a499-ebab-47b8-118c-08ddf60d33ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|13003099007|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YjlOVzVrUlZhdFNBRGxxYUo1NDVuZVhEcDdpV0pIUGE2U3E5SEFHY1U1OS9j?=
 =?utf-8?B?N1VyTFFXQm9iMnl6dklFbmV6TnBtY0tKcmxvRDZWYmxPZjNPekpadkxOMUdM?=
 =?utf-8?B?VmFvZGY1WUFIRm50WnZOb3BVR1hvbXhiam5UU2Qrald5OGNqcS9hR1ZhMmFI?=
 =?utf-8?B?R1ExZjVpY2RDbDlXbkVPblBmVTQ0eHdESXJSMmxJY0NjNDhKUzZBRFJjdDYv?=
 =?utf-8?B?WWdNVkdoUXEyQWhWdHJlU2hzV2QrTjc0YmlJU1A1a24rRkV5OVM1V1pIQ1VO?=
 =?utf-8?B?NlRFZ1ZvSkxoaE0wWmZVb01WSHRnWFMxZUwrdGRVU2w2N01PRmxKUWlEV0Rm?=
 =?utf-8?B?bVIrQ2QrNXpsbWUzYVdjN043dk84cjhJYTV1VVFLa1hnOExhVmYrT2d4NWZJ?=
 =?utf-8?B?OTRJYWR2dDlnWkZHTjBoMnFVSlYrbmt4RWVZWHJoNlBqMC9YQkpBUlJ5VkEx?=
 =?utf-8?B?L3h3cWhIZjhsWjloKzhYOUxYblA4ajVuTlEwTEpOZWRacXlKL3ZUenhSSWNM?=
 =?utf-8?B?a3dJMFRWcHp3TW1qU0kwanRlOU1pMHBnOC9aS3UwTHJsU0pHSVlhNHVnSTY1?=
 =?utf-8?B?Ky9CMlJiemdjbVN5b1BuaGJ2bU8weVpDTFd1aHNNYmhGb0JzdUtIb0xyZVlN?=
 =?utf-8?B?aGdscUx1UnRiRHorOUZLZHNVUFdPZi9lQjJzNGRyM2JmMnFBcXRvYlJNMHlj?=
 =?utf-8?B?bEIzZnhLWEpGQzA1ZFFUTGpXNXZqWHVSbDUxNFpsR1lJd0ZhK3Bha0xuUDBJ?=
 =?utf-8?B?cSt2bThzOXVycWthM05xUmwvK0tmWDkvb0gzS1ZsK2ZNeW4xNms0WlJKYmRl?=
 =?utf-8?B?L0UyRGJoWkdGVTlrZk12eXQxaGcvUEFqU3BSWVVlZyswbG9iZldpcDd0Y0Va?=
 =?utf-8?B?UFIxWXhlTTF1N0N2UGppRFZIN2VwL3lMYVJjU2VyUXMvUEJSbzBOUUpCNzJB?=
 =?utf-8?B?MS9sSDVSMnpEb2s0Mmxyb0JaSHJwQThKbEtSMlA3OXBMY2Z1aTNZTkVwODM5?=
 =?utf-8?B?WlNhL1ZQN05KWGVGWEQyVFlXSVJ5K2xLU3Z3eCs5eUhjZWduMFlEZGpuV2Zt?=
 =?utf-8?B?UUhiSnV0b1pOd2FDbWVKajloTkRPS2JiNzA3Y0RYQ244WmZ1bVJVeFR4ZUpC?=
 =?utf-8?B?OW5VT2VJYnVJREd1Zi9nbm1hMEdLaTFOWmpRTHFKMGl2bkhiYmlKeXdCRUZU?=
 =?utf-8?B?bHRoY2UvdkpqeUF4WFMxeTRjUnJQdHVMR0dNemk1SmViVzc2ZVNIdmF4OEdp?=
 =?utf-8?B?enNZakxtRFFocitWa0hqUnV6amtoQmFRb0g2c0ZQcnQ0Y2c1NWxBZXduclJL?=
 =?utf-8?B?Qks4WnpqRUFzTnJXMGdXVGRyOHp5dHp0eXZLNFlJRGVyL3ZlR3JubFdLSWIw?=
 =?utf-8?B?enk3RE11NC90R1BiUXZwNkZZR2dlUml2SFpGblJDRW1oZk1Qb0xLMjhyd1Vu?=
 =?utf-8?B?cHRnQVM5dXdNU08rTXMwclRmUHpING1LaVN3SzczL0NIejhSRHM1anRqRkha?=
 =?utf-8?B?Rno3b2s2RjdTdFNpejVTSWJLbTUvOWxWRllwWTkvZUI5UUVLV04yMHVxTDhL?=
 =?utf-8?B?M3ZjS1drVmNUQ0VqVDZDQlc1eEdVQ2tsN3VPeXE2NkhUT1lLVEhpRHJrZ3Ns?=
 =?utf-8?B?V3NLTkdPZ1lKdDhKUFdtcDlzeHB2YWF6b053dGlWWFZNcGVMUzN5Z25PMEV5?=
 =?utf-8?B?dlU0Zm55UXpnandkczhYT0lVNVBONzlTdHlyS3FUMW5PeGZTQ1Q3MmNTUUFS?=
 =?utf-8?B?OVlwWDg1Y2M4UnlacTdoTGpicUhIeEFZREhtVTJFTkh2ZmpDWC94ZEZiVEpr?=
 =?utf-8?B?L3lBTzR2YkZsMjdIVEhKZkhSckJ3NHo0N01md1JHOFF2Q0NrQ0k3U3FueW5h?=
 =?utf-8?Q?nsbG1VLZB9Ovt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(13003099007)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0JicGVtVHBDQmJQYkFOUUlLSUtKK3VkQkcwY0krNm9oNUwwRDFCRzQ4Z1p1?=
 =?utf-8?B?SWczOVpjVnBwVk9sYUNyU0JSZDJJbGs3NUVNbmJNdE5mT1hYdlYrTWlWb2JZ?=
 =?utf-8?B?RGNCQkRySU9wci9DT01WZWpya1J5djhuYW5uUWdOUloyMnY2QXVBWWpVdWxQ?=
 =?utf-8?B?TzhweU9NUTVCK2FMZGpZNTJGb2RITGxNV3NyM01GSEc3SVZySzNydmE5OFlR?=
 =?utf-8?B?QUVjbHlBOVFqQkNsbzlyRUpRSFU2dlRKTDNmRlpOQVBoa2Z1blhydUlRWk1H?=
 =?utf-8?B?ait1bURxYXFHSGJDUmNFbG9VMWxUeVJyVHlBWTY1SlB6eDcrMW11VXNlaWwz?=
 =?utf-8?B?cDFaN3MvclZxTXgrb1RyNWpkUmZiVlFCM1h4K2lHU0NRUlhkQm12bUxmZzht?=
 =?utf-8?B?Q0tVUGhzNkYzQ2JTZmFPVSt3NFR2SVY2TzlPb0t2c2taanZRVU82V1lnRjQr?=
 =?utf-8?B?alp5amdYMS9ya0pZbG5kdDBqT0NkdXBLaEYyUjUzN0h6MHpRTGFnQXhzdUda?=
 =?utf-8?B?d1I2WktFOFZrR1M5UUZ3anlwbFRqNVJBSU9pYy85bmZSZk1wb3VOR2l5WXRo?=
 =?utf-8?B?TzFiYjBlck9rTUJleE9UN3BjbHByL3lCWVZheFVzbXBSUHBnbnhMMTMyWS80?=
 =?utf-8?B?RkNGcjYxUWk0azFiQ3NnSmM2bUhDMk5lTUZ2T3pEQmRhc29qVFU3aVBRVFVQ?=
 =?utf-8?B?UjJlZkpTeG45ZTJDV0FoWjdsQ1pIRGFnVW83RGt5NlA1N3RKZllib1VnVjJv?=
 =?utf-8?B?Y2drb20zS3Q2alRXVFU0emV5YURyNHg2ZU1HdDA2YTBBeU5VVk5UcHJlN2pZ?=
 =?utf-8?B?UjhzM1p3bitXQS9jR1QvY1RPY28wSUEwUHptU3VwK3JrZVRGR252cXNHM1VL?=
 =?utf-8?B?YTRGOUJjSzBtbGdLMGJ0OG1WU3UxUDNEMnFuN3F5SXNqdmlzTUQ0TGxJcU9m?=
 =?utf-8?B?aWU0akhrVFRzTzI3d1YwUUlRK3V5TTNmV2F6S2RjanUrdDdYdXR2dllrVW8r?=
 =?utf-8?B?WFNySUhEWWtycHhudDhET3FrSVNoWjZMUzQwTWRTUjF2TXdhZEtNZEFJSW1w?=
 =?utf-8?B?QmJka1hsQy9VcUhYdEpsNENwTTE3bXJYM3Q2MHpaQjl3QVJzZ3dGRGZrYWJG?=
 =?utf-8?B?NGVEWUVwQnp1eVYxbDJiTHlRL0ZITFloVngyOEZhREcxQ24rWUlrb2lWWkhT?=
 =?utf-8?B?VjdZakpnNW9GYTNTdGw0NEYvcGFmditsTUNRV0sxM1lGcGt4R2F3VVlZdlJn?=
 =?utf-8?B?VEJNcnBCaXc4bGxQNzczdWZTSVhpMEp6bWpKSytaLytub1V4SHlWK2IrMk4r?=
 =?utf-8?B?NGJlZzhhQVRNMVlONWtCeWRUdmpLSzFyaS9jYVprOFpWV3dOVnhOdHJyaVdN?=
 =?utf-8?B?TmI2OWY1aU5tUkRtSHBiRXpKVXRHWmNjd29FYmc3aE0renQ5VlJpd1plSFJh?=
 =?utf-8?B?ZVIzY2VKS1lDeGdVc2N6dU5OeWVsK0NTR01NbnRjU3dpZHJMRVNjNkludHlK?=
 =?utf-8?B?djdzcnJLeXpzVUZNREcrZ3Q4aFoyVVRDL1JjVVcwNnpCaGJ5eG1lYWt5QStp?=
 =?utf-8?B?OS9rblVjdUJTZ1BVemdjMU04WnpzN3pFYUU2V050Y1hWTEJtRmdGOHJWVnJ3?=
 =?utf-8?B?RXBrdW5lNUN6eDlxbStLemdLYkpTS04rZFYvZVhSK2xheTFSVmwwRUN3MklY?=
 =?utf-8?B?Y2E4cmxRWUVNZ1d3ZmJrMkYyVDRpdXRaeWxjYmZxZGplSjBJMTRXK09IOTN2?=
 =?utf-8?B?em1YeVkrRTRKOTcyY0dlaEtwazRxMHVBcEhPYVV1RGVPNk9JblNMRWt4TklO?=
 =?utf-8?B?aVJ2c0Q4cmM3YlNUTUVlOWNFS0lsVndSWnhCUUlmcllHQUNZRWZuK2dmd05L?=
 =?utf-8?B?L0N2Z1l1V1cvbG1PWTdXSVJXOGtRSlBMZmliaHdTdHBWbnJkaXFISXBCa3pR?=
 =?utf-8?B?QnA5MmpxcFVJeWxHTWhyTEd6c0kxQlQ0SzBqdUh5VUVyWGdNNFFYRS81Y1Bu?=
 =?utf-8?B?bWdTcFVvOEl4OE9Qd0tPa2JrMHVaYlFRQkJFbDJpcThZNzFUZ0VwSk84a2ND?=
 =?utf-8?B?bzVzTTUvWEVmczhVV2F5bkJXaWdPKzF2dGVMMkZwRHhvYlRkR0JJWHZpN1F1?=
 =?utf-8?B?bzZQTnUxU1pVaW5tdktBYitMdS95SkIrbENhbUtUQ05Vdk16SVlqalFnWkJ0?=
 =?utf-8?B?MFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: add9a499-ebab-47b8-118c-08ddf60d33ce
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 17:11:12.2248 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: saMu+gfeIBoUWDuIfP84AQVA1qQW/dgxOkxVGXeGAxISxGcCB4E6jtpbO/4XpF2jbHTcidbFARSNZ8hOIbnRFywRi0X++hDtEEmUqzWh/yI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6007
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

On Wed, Sep 17, 2025 at 05:07:43PM +0000, Lin, Shuicheng wrote:
> Possible regressions
> 
>   *   igt@core_hotunplug@unbind-rebind:
>      *   bat-lnl-2: PASS<https://intel-gfx-ci.01.org/tree/intel-xe/xe-3727-6383690b59fb31f52a5932aab3a9963265e86fc8/bat-lnl-2/igt@core_hotunplug@unbind-rebind.html> -> ABORT<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154412v1/bat-lnl-2/igt@core_hotunplug@unbind-rebind.html>
> The failure log is due to circular locking depdendency, which is tracked by https://patchwork.freedesktop.org/series/154427/
> I confirm the issue is not related to my patch.
> Thanks.

Applied to drm-xe-next.  Thanks for the patch and review.


Matt

> 
> Best Regards
> Shuicheng
> 
> From: Patchwork <patchwork@emeril.freedesktop.org>
> Sent: Thursday, September 11, 2025 11:49 AM
> To: Lin, Shuicheng <shuicheng.lin@intel.com>
> Cc: intel-xe@lists.freedesktop.org
> Subject: ✗ Xe.CI.BAT: failure for drm/xe/madvise: Fix ioctl argument check
> 
> Patch Details
> Series:
> drm/xe/madvise: Fix ioctl argument check
> URL:
> https://patchwork.freedesktop.org/series/154412/
> State:
> failure
> Details:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154412v1/index.html
> CI Bug Log - changes from xe-3727-6383690b59fb31f52a5932aab3a9963265e86fc8_BAT -> xe-pw-154412v1_BAT
> Summary
> 
> FAILURE
> 
> Serious unknown changes coming with xe-pw-154412v1_BAT absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-154412v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org<mailto:I915-ci-infra@lists.freedesktop.org>) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> Participating hosts (11 -> 11)
> 
> No changes in participating hosts
> 
> Possible new issues
> 
> Here are the unknown changes that may have been introduced in xe-pw-154412v1_BAT:
> 
> IGT changes
> Possible regressions
> 
>   *   igt@core_hotunplug@unbind-rebind:
> 
>      *   bat-lnl-2: PASS<https://intel-gfx-ci.01.org/tree/intel-xe/xe-3727-6383690b59fb31f52a5932aab3a9963265e86fc8/bat-lnl-2/igt@core_hotunplug@unbind-rebind.html> -> ABORT<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154412v1/bat-lnl-2/igt@core_hotunplug@unbind-rebind.html>
> 
> Known issues
> 
> Here are the changes found in xe-pw-154412v1_BAT that come from known issues:
> 
> IGT changes
> Issues hit
> 
>   *   igt@kms_force_connector_basic@force-connector-state:
> 
>      *   bat-bmg-2: PASS<https://intel-gfx-ci.01.org/tree/intel-xe/xe-3727-6383690b59fb31f52a5932aab3a9963265e86fc8/bat-bmg-2/igt@kms_force_connector_basic@force-connector-state.html> -> ABORT<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154412v1/bat-bmg-2/igt@kms_force_connector_basic@force-connector-state.html> (Intel XE#5440<https://gitlab.freedesktop.org/drm/xe/kernel/issues/5440>)
> 
> Possible fixes
> 
>   *   igt@xe_vm@bind-execqueues-independent:
> 
>      *   {bat-ptl-1}: FAIL<https://intel-gfx-ci.01.org/tree/intel-xe/xe-3727-6383690b59fb31f52a5932aab3a9963265e86fc8/bat-ptl-1/igt@xe_vm@bind-execqueues-independent.html> (Intel XE#5783<https://gitlab.freedesktop.org/drm/xe/kernel/issues/5783>) -> PASS<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154412v1/bat-ptl-1/igt@xe_vm@bind-execqueues-independent.html>
> 
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> Build changes
> 
>   *   Linux: xe-3727-6383690b59fb31f52a5932aab3a9963265e86fc8 -> xe-pw-154412v1
> 
> IGT_8535: 8535
> xe-3727-6383690b59fb31f52a5932aab3a9963265e86fc8: 6383690b59fb31f52a5932aab3a9963265e86fc8
> xe-pw-154412v1: 154412v1

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
