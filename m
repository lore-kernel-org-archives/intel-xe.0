Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAEB4C54E65
	for <intel-xe@archiver.kernel.org>; Wed, 21 May 2025 21:15:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9118D10E038;
	Wed, 21 May 2025 21:15:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BmZtfzf/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0889F10E731
 for <intel-xe@lists.freedesktop.org>; Wed, 21 May 2025 21:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747862113; x=1779398113;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Z9qD0Bf1W83Qy8X8ki5Lc+BoJdT/x0QnvqjiP96+HfA=;
 b=BmZtfzf/CAerwp3/zvWtJMTg2yx9VPZiNLQP/Nf4oVA1n8Udabiivo1m
 tMQ82bLwMZ9qCExpmJnMjCAfVIHnbWTthUihsOSnZ2DSFEF8LpBz240Py
 LpOtUVVAZvuoPDo5cg0QRdFhryLnkYRggNTLZcas1wCi/V/a3JY2qIBZw
 LBAkfxCmbkOtzUJrtATgtjdGtaZDUO9WLO/6+arhGVzHHTI9vAcAG26YD
 +kDiiRBq6tVsb5l1+N7CyBP+L0EgxMeOwv2nuoZOgcBfVjWvkcS3Tv1nY
 bfDAhE2ayPn6Nze38jGj1k6DFJH+qvHlA2JWOvUgpm2A+/WglPLSRs8l5 w==;
X-CSE-ConnectionGUID: hIwDTRykRZ2ujXL4EiSbog==
X-CSE-MsgGUID: Sc3fBRlJST2N6B1t20xqIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="49781737"
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; d="scan'208";a="49781737"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 14:15:13 -0700
X-CSE-ConnectionGUID: /2C0+rvBTQmjErVDXyLiYg==
X-CSE-MsgGUID: lgRLvj2VT6WGZSlH1r3Erw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; d="scan'208";a="171123180"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 14:15:13 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 21 May 2025 14:15:12 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 21 May 2025 14:15:12 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 21 May 2025 14:15:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GED4Am52n08Dk4afSNtjdDe5Qj3KaR7btPMNj6Njyz6e4ptqcAhw7Jzm4MIZGok9xiKFfgUJ6uU/b+5QhjWJ8OGtmki/wjFn6LokoqSZJN/XHGiL1KDmLkaoA0vEIKdMIP4oQUnwuxVedmicb3CQbOaGXBlXL5MesJPDN78OxAxCl5lrTkuFXyCJdMjxC/6MFme8RHCRZGqNBCpLqr7adVEVjh9P/EwRlxU/aNp69IZSjIjluZDORhj9TDN4DjJzTckNOz378Nc9QE6/so+Jl84pZUJ/kg6++bfdbd23SQHtO1l9SgbwlddpuKd5t6wc5yDCGulLapSq/gRKWveUHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ZNEclA4RRw3fFgYw28+LMwsktsNOV5ZE6OJpmjPnvo=;
 b=QUNyC950Bldp6pjoq/4IF8PUo+RVLDUN4J7Y19vJJp1yLEkwTyKZkmUioC5ScYPJSvi1THYLfo7WbouHSwwYvAFI679MenOHVH/JVPRfMgEfZNIam8nZdYJ86WRQHNwPPZeIOurjK/BEFrsvI3Z23IQ2Kn9khNLXumGuCDdfpLAd21FkZGPkZfHfPwjoGoUBwAxjOn6kys1PCTTycdysXCxWfmYx7XnOr4tMAKiVZVfMn8KKAU4w35SQfgCz2cNih0u08+Vlp7xok1lpKSRHiQKACg5xZBMAtRjXYjbZpyoT6lDpM5zJYnupLZYK8rBRqpw7IGszdPMSGnKxYFRqGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by PH8PR11MB7000.namprd11.prod.outlook.com (2603:10b6:510:220::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Wed, 21 May
 2025 21:15:09 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%7]) with mapi id 15.20.8746.030; Wed, 21 May 2025
 21:15:09 +0000
Message-ID: <d20481a3-5bd5-4a42-af7b-7b8d42613667@intel.com>
Date: Wed, 21 May 2025 14:15:06 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe: Introduce flag to indicate possible fault
 injection
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
References: <20250512161947.128-1-michal.wajdeczko@intel.com>
 <20250512161947.128-2-michal.wajdeczko@intel.com>
 <d03eda9b-d090-4ebc-901b-31916df24fbb@intel.com>
 <da6c2d88-d9d4-4f5d-aa5b-9a1513195fe9@intel.com>
 <6389f7ef-8041-486d-8234-d8a9cdb8cc5a@intel.com>
 <aa0cc6be-2af7-47b1-9be5-cfc660df9750@intel.com>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <aa0cc6be-2af7-47b1-9be5-cfc660df9750@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW3PR06CA0003.namprd06.prod.outlook.com
 (2603:10b6:303:2a::8) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|PH8PR11MB7000:EE_
X-MS-Office365-Filtering-Correlation-Id: 444b6a12-45b8-41ec-9708-08dd98ac90f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z1hnRnZMV2psbWRmcjJiSkNrbU1zODYyamxEZ2JOSEVOTlFPRlc1bHZGdFQ5?=
 =?utf-8?B?UnZEYmducXk1OVl4NVlmS1A3bWtyWUhyZnZZaTNYWk92d1QyY2tmaksrQmZy?=
 =?utf-8?B?Vm81eWQ4dCsxbytQNzRBOC9NSTlVT2ROZnFxVkU3SmZycGZUM0VVUXdUdk9K?=
 =?utf-8?B?Sjlldko0Yys4M3ljOHA0MENpUmtLNzNiNnMxREVvY3B6NDVxYUk2dHFPOUY4?=
 =?utf-8?B?V2Z2aDk2aCtRWEk3N1Jxc1FuQUdNMHQvRjhKL2VISkJnWDR0RjhnODRiRTBR?=
 =?utf-8?B?RC82UU1wL2NXVm5uaHJoNk53NWRsWkdUdnd6KzJUR2pLdnRjWktXSnB3MkR4?=
 =?utf-8?B?R1BXQXhKSkppdFN1Z0hld3ZEcWkwMmp5eFRHZ20ycVJqNnVUUWQ2dFZuYzVC?=
 =?utf-8?B?UC9XbG5BZlZIYVRUQnZwMFB5Zm1mR3VPMEtKRmhGenhqM0FpSzJFc3ZtMk5P?=
 =?utf-8?B?TmRtV3hjRmREWW45VWxDMlVxZjVnK3RVWXNTbGhuQVJRREkzNkhrTmhCZ3Q5?=
 =?utf-8?B?dU0vZkRXYzh4SVVJSlU3NGQ5R0p2RFpFRFZPL1Bma1kvSWdJdzludHV3T2tv?=
 =?utf-8?B?OFJOWjMrMmRnV1k2OE10Z2xZYWI1RlBZQUxhZXhsZFk2dU54aUpuSjJZWWNs?=
 =?utf-8?B?bmlrSkY3bkxhZ0UyRmRSeEdEcTAzZjJrbmp1NFFLK2w3RENXUzhYSEZ4QW5H?=
 =?utf-8?B?ajNSZ2FBejRDWHdEcXk3ejIvdmFTNGtEMXNOSm5LZWJkSGh6T0xhN2NETDlX?=
 =?utf-8?B?MERndDBTWnhOTkRnakZKeEZtZnJncGNWVEpUVmNISG9TM25SR0xCMW1MdG53?=
 =?utf-8?B?RTJ4aUpUMEhFSitWMGorMnVGeEUxa2Q0Q2g0TVh4Z0l1WjN0UHI5MFRMRUdq?=
 =?utf-8?B?U1FPRVZHM2ZsbElTSU1pL0Z0MjdOSXgyTkcyOERDdkVzdEJHbmxYUVk0VDdV?=
 =?utf-8?B?K24xeVB0YU1kc3c2REJFd2xYK0FmckVxRzlVOGl1b1k3UDBmczlSN0F4dkJk?=
 =?utf-8?B?SW5Eb3p4VzV3a3dPQ0k2VzZSVGszUGhrQ3huMnhaYU1KZHdJUlZ1bzhWdFll?=
 =?utf-8?B?d2g2Yy94L3pwRTZGbE5kZjVIOVF4SS90SVJvYUMxQmszSDNMUFJFTDZvUzRt?=
 =?utf-8?B?L2ZxMUNBeWM3amNrUWNzY2ZCQkF3S2UxNlIxUVRNdExOc0Y0OGdjeTNFa3U3?=
 =?utf-8?B?UFlRVU1mQVdsNk1pdU0yM2pHcXdJUFJCZEhwK3JsdDRjYmdSV2pIdE91bTl0?=
 =?utf-8?B?SHJkNDNlN3VxcUc3UkhuKzJTNUl3SFVMQmljTFFxVVI1UWJpZlJnRWpxUlhl?=
 =?utf-8?B?NldvMnAxTHZnZUpGV3Fhc0ViZCtWbGtWK0ltMVNYODl0L2RwTjJnQ2hPaldx?=
 =?utf-8?B?b3BWTFJnRGRhUWl6bFZXNnBGelJWM1l5S0oxdFNLWWcxWkFpMGxTUk5NcHgx?=
 =?utf-8?B?c0F5TnBqZ0VWTi9pTTEzOTVqanN1U1BFK2NrakNVeWJlS2NMUlZDek5EakZx?=
 =?utf-8?B?dFRZUVVwZE9mOHZvaXN4YjhLR1dQaVZLcUFJVXNaMkhjMXBjbXM3MDJHZlpv?=
 =?utf-8?B?aGFMVVkvTzZkRmdLZHY3dlhDdU16cjNaUld0RHppVTZCdE1GUnluSUNvV2ti?=
 =?utf-8?B?LzBrR1FMSjhjM0h1c2VPRTZGcUtPd1lMWk1QMWpJQ1RuSklJSG1LcC9QWUlQ?=
 =?utf-8?B?RUkyOHREbElaQVlYSCtROTg4N2FHUStka2dRUUJMZS9sVWRLOHFRZi85ZGRW?=
 =?utf-8?B?U1h6U2J6MEpUV3EwVDhLSExydmp4LzFhMXdKWXZxeEd0citSUWZPU0VQZkpw?=
 =?utf-8?B?ZG9pRWdtQWhWdU1lVkhMTnJ5WmFzQlFGQWhMamFoRXZ1cUxWV3MxZW9GY014?=
 =?utf-8?B?TU11MU5hY1JTVUlIL1BDVmJVdzZ2NzlPT0lFQ2NEWlM3a2pJckQ5MUY3cE1V?=
 =?utf-8?Q?+2DzmI1DrIc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Zys5cGZmM0Jsbm1qdmEzay9KYkRjYlZQMDJmTU40TXBta0c4SmNqOWkrbVhP?=
 =?utf-8?B?V2RUMDRWV1BBYzFWQ0pVNTQrcUFCcjNNWm9iTjgrRFBwR2FyT2hUdE0vdEE1?=
 =?utf-8?B?ZjVmdGJDR1N1RFhONER3NW1ydDhySzMwOUpXSUdlRXg5ak1xYXFsWkM3OERY?=
 =?utf-8?B?VEpTQWVLWW94T0tHZFE4VExUMWNYdHgraDBkc21RS00yc0YzclMvTE1hVy9t?=
 =?utf-8?B?b2RhZEc3L1FtSGZXWmZXekNlR2ZEL1FMUlB2UUdpR3ZIdEprZEFINVZURzBu?=
 =?utf-8?B?RmVJR1p4aUJ6RTNFSENyZ3UrZ1htTUx6cU5Edm1xNVJEalhsSU5sbTAyWkE4?=
 =?utf-8?B?RkpOV1J5eUJuQ09IVU43T1JHbjRmWWJBNWp5S3FkbklaV29sMjdveDMybXBF?=
 =?utf-8?B?TDUrYktDWmFLOWIwTHhtUGY5aHRQS1MwYU1sWVM5UUVUMndMQklkcmVWR1Nl?=
 =?utf-8?B?UlIxN3VmK3VrYmlQZTdoY0VCelVqMVlmR3NNMGdwdGQxVVBlZXNCczRxb2tj?=
 =?utf-8?B?L2U3VlBwQWVyeTVhVGJhd3RsbVBOSGZsQmlMSWJ3RVE4UEU5MWhTS3pDN1VF?=
 =?utf-8?B?TGFra0NWVGdEa2szTE1kNkZ4cnkyOTk2eHR5SkJaK3BUT2sxbHlLY29uZHNj?=
 =?utf-8?B?WmYvWERNTXFObEdWalBJWk9UNFRxcDBMZ1hjTEsrcXpFak9haXhCeVMwbjNi?=
 =?utf-8?B?Ukl4d3ZWbmY2M2VZYlFTR1dETFZaeHdUWUZoVndhU1NUQ05VK0NuU3dsUnln?=
 =?utf-8?B?bFpJSFEwMkN6RXg4bGdVZTJhNHludFFPdVJDVm1SczhId1ZCeE5leDB6aVdn?=
 =?utf-8?B?THhHMEFqU3Jodnd2bitDYzBkczAwL2p3RHZHUnVkWTVNMU1uTVBwdWRFSnEr?=
 =?utf-8?B?Yy9SSWlFcElxQVVCMFlkRHU2TlRvcGRnbDRQMThNNVRndDdKSmNnZ0tNZjBS?=
 =?utf-8?B?WXZ2UzZBa0pDZzgyK1pkTUZjcFlRenJPZXpaMC9YeHNzWjZsVEFWbThjVGYw?=
 =?utf-8?B?Z1J0TnRGMTlreE81TzdSZnJvdnAvSlFNaThUaTRqb3dBMlV4WG9jVS9yV1FT?=
 =?utf-8?B?UnV6V1ZkQUI4eld6OSsvTVJIU0FTeTBGaHZFWjRFZm5QWFBveWhCWGx3ZUw1?=
 =?utf-8?B?b2RNL1BQcWZLQUg4YlprdDRzRW12emZlVUIzK09oeGpQZG1WaHkyai96VDVr?=
 =?utf-8?B?U2k1dmtnVVdSdnBHME5WaXRoenFLVTNsLzl2aTZ3NnloVVl4cUxZbm9KNEJk?=
 =?utf-8?B?bWRZN0pNNkRFdXFUL2p5OTRIdTZGT283LzRKVjhyaCtJNzhCQVU3bm5sWXlY?=
 =?utf-8?B?SmdkMEtOVU1VMFhYZTVPeU9XQy9ET2J5L3ZmNlcyK0k2VEtHSXpFUmJvQitS?=
 =?utf-8?B?QVozWmF2UUFwY3Y5RHlJQXVYM0Yvc3VCR09oY0dHck1nUGJZR0NGdzU5dUFM?=
 =?utf-8?B?eVdHL1pNdGttTlAzVWhWRWFHUkNjREdmTUNiMnZvbThHMUI3Q1FIT1hzaU9o?=
 =?utf-8?B?NHF6NmdvNkFYaUovUlFneXZkOWJIODRiSWM3dStramxwUlZNYzh6QWtVYlIr?=
 =?utf-8?B?NkhPcW95WHkyaFd6b3ozL1dzaGhKSFZjVHBNaEhCOHpDMEd3d3dRL0NIYzk1?=
 =?utf-8?B?WHVtOFc3aVNxYjhEOXNJdWNueWd5MmhVbU9ydnNZQW53ZC9sUEUxRGVJQTN5?=
 =?utf-8?B?UCtYR000b3VLaUY2YkRlaWhycG1aUVVnWUpWeGErVE1sRW1JbDJ2cGZyYXNl?=
 =?utf-8?B?Szdxc3p5S3JWeTd0L3FEeENZVWdWaWdUNEVDMkVmUHEzMXdTMVRzaXdiKzd3?=
 =?utf-8?B?TWsvb2NDajc2Slhub2RzeEVCZ0srZGxuM0QrVXk3VTc1cS9MVFVkWldKdzJG?=
 =?utf-8?B?cTA2RGt2Ym9WbXNVSVhianFUcjJBN0llRk90TDcxTkNlTXJPZ0dVbkVoNjJT?=
 =?utf-8?B?TE9tQVBZeHdHRFcxVXN1eEMvcytyYkRMMlVtZ2lITUdOVHBUN1JCdXlqa1gv?=
 =?utf-8?B?SlVpckU1V2d1Uk1IcjBydmtmR0lBR2tKb1BEVitoZG9LY2J0ekpmdUdtZmwy?=
 =?utf-8?B?RlRJZmMyRk9DMERQT1NQZ2FjVlg5S2FWRXNOV0VSOXZqb1Q4QTFTOWFKU29l?=
 =?utf-8?B?RTBobnZONENKZTVPZEZvdnFFejVDVE9GZlZiZjZrQU1UTWd0RnZlR2NHc0VD?=
 =?utf-8?B?MEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 444b6a12-45b8-41ec-9708-08dd98ac90f8
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 21:15:09.2321 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wjpjRrWNVbYWILex26a8DDEKgLicJlQFdLmF3FB/1XFR78he8hIo5MDqgsIN80bHffW7kaoCb3Hmb81VrfEHxmNXVTww8FxQn+y9hrlWAn4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7000
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

On 5/15/2025 3:25 AM, Michal Wajdeczko wrote:
> On 14.05.2025 23:05, John Harrison wrote:
>> On 5/12/2025 1:20 PM, Michal Wajdeczko wrote:
>>> On 12.05.2025 20:36, John Harrison wrote:
>>>> On 5/12/2025 9:19 AM, Michal Wajdeczko wrote:
>>>>> When running some fault injection tests the driver might generate
>>>>> a lot of error logs which might unnecessary stress our CI systems.
>>>>>
>>>>> Introduce a flag exposed in debugfs that can be used by the fault
>>>>> injection tests to give the driver a hint to suppress non-essential
>>>>> error logs or dumps that might be otherwise generated.
>>>> Why use debugfs?
>>> because IMO it's more tailored solution, as actually we just want some
>>> flag to control level of diagnostics generated by the driver on error,
>>> and as you already mentioned, modparam likely would be not accepted
>> Tailored to what? It is certainly not tailored to testing module load
>> because debugfs does not exist until module load is completed. And a lot
>> of the fault injection tests are testing the error paths during load.
>> debugfs will simply not work at all for those.
> ouch, my bad, I guess I was (too tired and) too much focused on the
> scenarios that injects errors at runtime that I fully missed the
> limitations of the probe time
>
>>>> The whole point of the fault injection test is that it
>>>> replaces an existing function with something that just returns an error
>>>> code. Seems the perfect way to have a function which is simply "return
>>>> 0;" in normal usage but modified by the injection test to return an
>>>> error code when a test is running. Which is what the original patch was
>>>> doing. That way everything is self contained, there are no extraneous
>>>> interfaces in unrelated subsystems.
>>> while at the first look this idea might solve the problem of controlling
>>> the diagnostics level, the issue is that it would require exposing from
>>> the driver either a dummy state function or promoting an existing
>>> diagnostic function to be a fault-injectable. in both cases such
>> As opposed to requiring an entire new debugfs interface? A single
>> exposed function seems simpler to me.
> it's still one new entry, regardless it's added to the debugfs or
> fault-injection framework
>
> and IMO using/controlling the flag using debugfs is much simpler and
> cleaner than whole configuration using fault-injection framework
>
>>> functions would then require configuration steps where any of advanced
>>> fault-injection parameters will never be fully explored (like
>>> probability, space) so this again sounds like overshooting
>> I have no idea what you mean by this. What configuration do you need for
>> a function which is literally just 'return true/false'? You can do
>> whatever fancy fault injection test you like. That is totally
>> independent of nobbling one 'is_fault_injection_acitve()' function to
>> prevent excess debug spam during any and every fault injection test.
> compare configuration steps using fault injection framework:
>
> $ FAILTYPE=fail_function
> $ FAILFUNC=is_fault_injection_active
>
> $ echo > /sys/kernel/debug/$FAILTYPE/inject
> $ echo $FAILFUNC > /sys/kernel/debug/$FAILTYPE/inject
> $ printf %#x -19 > /sys/kernel/debug/$FAILTYPE/$FAILFUNC/retval
>
> $ echo N > /sys/kernel/debug/$FAILTYPE/task-filter
> $ echo 10 > /sys/kernel/debug/$FAILTYPE/probability
> $ echo 0 > /sys/kernel/debug/$FAILTYPE/interval
> $ echo -1 > /sys/kernel/debug/$FAILTYPE/times
> $ echo 0 > /sys/kernel/debug/$FAILTYPE/space
> $ echo 1 > /sys/kernel/debug/$FAILTYPE/verbose
>
> with the same done over debugfs:
>
> $ echo Y > /sys/kernel/debug/dri/0000:00:02.0/is_fault_injection_active
Except that the interface is only used by fault injection tests. It is 
never done by a user manually hacking around with sysfs files. It is 
done by the IGT fault injection test which already has everything coded 
up as a helper function. So it is just a one line change in the test. 
Which is the only place that ever needs to do it.

Moving the control to debugfs/configfs is splitting the functionality 
across multiple unrelated subsystems. Doing it via the existing 
injection interface keeps everything together within a single subsystem.

>
> and while we know this will not work during the probe time, since on the
> driver side it's still a single bool flag, we can try to control its
> initial value using configfs, and while it would require few more steps
> it still be simpler/shorter than above fault-injection steps
Which is just adding more and more complication to something which does 
not need it.

>
>>> IMO instead of adding more and more functions as "fault-injectable" and
>>> marking them then as 100% fail, we should try to find more atomic points
>>> of failure (like no memory, no GGTT space, no VRAM, dead FW, broken FW
>>> comm, lost MMIO) and then take advantage of the framework that would
>>> inject faults all over with some randomness or deterministic and
>>> potentially overlapping with each other. this would allow to write more
>>> generic test that will list existing "injectable" functions, without a
>>> need to hardcoding them in the test, where clearly our dummy state
>>> function or diagnostic function wont fit and will require again special
>>> handling
>> I'm not sure if you are arguing for a re-write of the fault injection
>> framework in the kernel as a whole or just complaining that our IGT
> our IGT approach and usage
>
>> implementation is sub-optimal? But if you look at the corresponding IGT
>> patch, the code to nobble the 'is_injection_active()' function is
>> trivial - it just re-uses code that already exits for nobbling the test
>> target functions. So it is just one extra call at the start of each
>> test. There is no complexity or fragile hard-coding. And it does not
>> matter what fault injection test is going to be run - how complex or
>> trivial.
> but even if we say that we just reuse the existing code, since it was
> primary designed for different purposes, IMO we still are using wrong
> tools as there are more appropriate solutions to control a flag inside
> the driver (like debugfs and configfs)
They are appropriate for controlling general purpose settings that are 
of generic use. They are not appropriate for controlling something that 
is specific to another subsystem which already has a perfectly usable 
and trivial mechanism for adding that control.

>
>>>> Unless you are wanting a more generic 'test_in_progress' function that
>>>> is not specific to fault injection, then using debugfs seems like an
>>>> unnecessary complication.
>>> yes, more generic approach is always better, and with debugfs/flag
>>> approach it would likely enable us to suppress some dumps while doing
>>> some CAT tests or live kunit negative GuC tests
>> Except when generic means unusable because it is not available yet (see
>> above about module load testing). And kunit tests already have an
>> infrastructure and API all of their own for controlling how executing is
>> done during the test. Not sure what you mean by CAT tests?
> something like igt@xe_exec_reset@cat-error
What does that have to do with this? It should not be possible to 
generate a CT_DEAD failure in the cat-error test. It should not be 
possible to generate a CT_DEAD failure with anything other than a 
selftest/injection test that deliberately breaks the internal workings 
of the driver. A cat-error is a user generatable error. As such it 
should never hit an internal error path in the KMD.

John.

>
>> John.
>>
>>>> John.
>>>>
>>>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>>> Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
>>>>> Cc: John Harrison <john.c.harrison@intel.com>
>>>>> ---
>>>>>     drivers/gpu/drm/xe/xe_debugfs.c      |  5 +++++
>>>>>     drivers/gpu/drm/xe/xe_device.h       | 12 ++++++++++++
>>>>>     drivers/gpu/drm/xe/xe_device_types.h |  9 +++++++++
>>>>>     3 files changed, 26 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/
>>>>> xe_debugfs.c
>>>>> index d0503959a8ed..0567a57597d3 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_debugfs.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
>>>>> @@ -235,4 +235,9 @@ void xe_debugfs_register(struct xe_device *xe)
>>>>>         xe_pxp_debugfs_register(xe->pxp);
>>>>>           fault_create_debugfs_attr("fail_gt_reset", root,
>>>>> &gt_reset_failure);
>>>>> +
>>>>> +#if IS_ENABLED(CONFIG_FAULT_INJECTION)
>>>>> +    debugfs_create_bool("fault_injection_in_progress", 0600, root,
>>>>> +                &xe->fault_injection_in_progress);
>>>>> +#endif
>>>>>     }
>>>>> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/
>>>>> xe_device.h
>>>>> index 0bc3bc8e6803..ea25d8161050 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_device.h
>>>>> +++ b/drivers/gpu/drm/xe/xe_device.h
>>>>> @@ -209,4 +209,16 @@ void xe_file_put(struct xe_file *xef);
>>>>>     #define LNL_FLUSH_WORK(wrk__) \
>>>>>         flush_work(wrk__)
>>>>>     +#if IS_ENABLED(CONFIG_FAULT_INJECTION)
>>>>> +static inline bool xe_fault_injection_in_progress(struct xe_device
>>>>> *xe)
>>>>> +{
>>>>> +    return xe->fault_injection_in_progress;
>>>>> +}
>>>>> +#else
>>>>> +static inline bool xe_fault_injection_in_progress(struct xe_device
>>>>> *xe)
>>>>> +{
>>>>> +    return false;
>>>>> +}
>>>>> +#endif
>>>>> +
>>>>>     #endif
>>>>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/
>>>>> xe/xe_device_types.h
>>>>> index 06c65dace026..513a811a3121 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>>>>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>>>>> @@ -578,6 +578,15 @@ struct xe_device {
>>>>>         u8 vm_inject_error_position;
>>>>>     #endif
>>>>>     +#if IS_ENABLED(CONFIG_FAULT_INJECTION)
>>>>> +    /**
>>>>> +     * @fault_injection_in_progress: flag used by the fault injection
>>>>> +     * tests to allow the driver to suppress non-essential error dumps
>>>>> +     * that might be otherwise generated due to an injected fault.
>>>>> +     */
>>>>> +    bool fault_injection_in_progress;
>>>>> +#endif
>>>>> +
>>>>>         /* private: */
>>>>>       #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)

