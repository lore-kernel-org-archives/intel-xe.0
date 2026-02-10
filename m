Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E022EB2711
	for <intel-xe@archiver.kernel.org>; Tue, 10 Feb 2026 20:16:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12D6589128;
	Tue, 10 Feb 2026 20:16:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jjJId0im";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0D3289128
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Feb 2026 20:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770754591; x=1802290591;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=PcGQNsEOhwmqlCdcTmxX5RaPgV20A4qjOcS6VQ5r9dk=;
 b=jjJId0imc4Ul+lCpnnJSd9IdWkSBDTCimT3BCofOdrdZWVi4JXuje3hL
 UpzC1OUk2b8/03841PMTq75w9a+jS+BRzVecNRl3pRDV+ZqSSXSGfk7i4
 fH+//w9Kfb/bENwpk19Kuz5xQ82Lo4tFdxqqIQheWIMQogdmtWf+YKa0s
 +0CUkAV6cjRNy/c+YBDkBFugocDobXf0Sppmm6n4fJoaHPaqJzkEk9Yrk
 Inur8gUrztdj/aNLyQs5byDDXHaz1s6s05LV2ZO4ozYoIV3bGVRZJAYSY
 hcEVFtA5mxcFQOmoeDYzU+wMGyCHNaxnCx/nhqWA2iUOjplyyovU9oUO2 w==;
X-CSE-ConnectionGUID: DFpqZvt0TkCFgKs7R+59yA==
X-CSE-MsgGUID: 4IV7xpZ8RN243Hqog0ngvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="75739682"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208,217";a="75739682"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 12:16:30 -0800
X-CSE-ConnectionGUID: BeOCmaaVR46hOs94UzYENQ==
X-CSE-MsgGUID: J9XOe0k8Qk2MfYGd8RkyXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
 d="scan'208,217";a="234997907"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 12:16:30 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 10 Feb 2026 12:16:30 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 10 Feb 2026 12:16:29 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.35)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 10 Feb 2026 12:16:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RsWU+fS3va0Qy78u8EfVriXXJ1mmJNeD3WedtIdshpErsqbVNhS3Z2ZxBjsKE4D+/Fj80WHSauGsa4wwmzje4IX/BpDiO9QrCyDHJqRUEfxQWWXUhggJL653GxO1dcG5dIcmTZzpnjpEwr9lDsjez3JlFwJr4zWusOdb3fsAJzbQs8YoZ6SWX1GWVRh78hoF4FvHrqfYFYuVsGw/V9bzXv0jbTpA4EqyXyuBrkzvMmVucRlZO/yw3kQIPdZPcvgBwF3Pn1Zk4PlJweHXySltvnXuSjneaJa46wbfCrxeFc6E0iSo3Y5O10VOVQkXFeuy7jNquhTfK/rN1i4h21nkJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lEczYcABJ59xQBT6rMaDh02zCvh0n9UnRuCuvRNk3CA=;
 b=A8cConsCT+9GY5bynec2e1RPyZ6wEP4Wyt76foOgK7LpLwH8671zklRMYVouk5q55bbhEaATqie7LGMJOruLEjSpWJVeDUIrAEK850fiBvaaUUstiMqCdpwm+2+aUmpIZ9sGs/Y/CLrlTPjzq8b1Lze8pvEElwU+oqDWqO0KhR1WwwtH9qoxIPCLWASNa8CPQ+ycAjnElfCvYzn2azxCy2rsIUjl8DX1Syz6CQDvk6e8uwNsC8JoEWkZwPwdExk3/fx0DJZvoKwF0JTy1zZGn2owe2RHDsW6K2p3FnJUXQ9WlxXGK5WDPWwkiAygBoXxOvfPe4C2zg7JhKEyCvb40g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by SN7PR11MB7419.namprd11.prod.outlook.com (2603:10b6:806:34d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Tue, 10 Feb
 2026 20:16:23 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::4efd:8324:f06f:5b70]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::4efd:8324:f06f:5b70%6]) with mapi id 15.20.9587.013; Tue, 10 Feb 2026
 20:16:23 +0000
Content-Type: multipart/alternative;
 boundary="------------wrAql0SaM2RTc3mxdV3sxyOh"
Message-ID: <21fd764b-8eb9-4364-8fff-107e0121fdc8@intel.com>
Date: Tue, 10 Feb 2026 21:16:19 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/4] drm/xe/vf: Avoid LRC being freed while applying
 fixups
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?UTF-8?Q?Micha=C5=82_Winiarski?=
 <michal.winiarski@intel.com>, =?UTF-8?Q?Micha=C5=82_Wajdeczko?=
 <michal.wajdeczko@intel.com>, =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?=
 <piotr.piorkowski@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>
References: <20260206145334.674679-1-tomasz.lis@intel.com>
 <20260206145334.674679-3-tomasz.lis@intel.com>
 <aYYpBk1h6Fpjy+yN@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <aYYpBk1h6Fpjy+yN@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: VI1PR09CA0165.eurprd09.prod.outlook.com
 (2603:10a6:800:120::19) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|SN7PR11MB7419:EE_
X-MS-Office365-Filtering-Correlation-Id: a3834caa-6cd6-4e66-212d-08de68e1430e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RlV3aXZ5Y2Y4K2tlaGIxUzdFTDBjb0s1TzVmeFJRYjBHZTY1WHR2all5UWI3?=
 =?utf-8?B?Y2FUdGRZTExpNUE5VHc3T2VaOEpwbXJtVWRkWGJ3STM3YkR3SjhBemJRRFVL?=
 =?utf-8?B?d0k4YlQzMEQzRm8wL2svMitPT210RUxZdlFoR1dFUXdMc2xxcVV3ZDlHMG9T?=
 =?utf-8?B?bWNqMnd1aWJZWEU2UDZSeU9hZHlPZjF0OWFKMUxtZlVKaEhZK1Y1QU5QaDBz?=
 =?utf-8?B?ODJCWmFiQ3RIVHNUS1AwRkRVN1BOcGhMaTcrVGRSbUdpWGl6dVpSaGZ4ZS9B?=
 =?utf-8?B?K2RLSS9iUXBkTm5TMVU0UjhlUHBvRk52Z3NVeko0eDB0aVA0TXMzNXEwWXI0?=
 =?utf-8?B?R3k4bHhqUDVuTTBjakRHQWFDTFZ1dm9vRGYrT3dTb0Ixb2ZveXo2RXZOZndu?=
 =?utf-8?B?dTIwTWZQa2ZIaUpSTnFuUjFuL2VFZG81VlNqWERSeFJpTjVMQnhKZHI0N0Fn?=
 =?utf-8?B?WmpvVU1TZEpnaTc3WjdhZXh4NlRNMFdWY0kycHNrL1JUUkRON3RrSWFudTNQ?=
 =?utf-8?B?QTQ4UWZqWGh1YU9MSWRWV3ZjdWNwTXBRVUZ6QSs3ZkZSeXVYNmtBM1dDdmUw?=
 =?utf-8?B?N2pIM0xUODhlak5lQXp1U043a0U5WU1TdVU0UmtBRS9TTzBnbUpIaUV2N2w5?=
 =?utf-8?B?RFFBNkRTWkJwcDdpT2N2U3UvYnVaTE5ScHhsUzRYcGpvbzE3YTNaL2NueW02?=
 =?utf-8?B?b1JCQkVIUnc4RlFNREtxektOVDdWR3RVM3M0bXBmanlqenJ0OVpBbWpMbnd4?=
 =?utf-8?B?aExhOHE0cXFRODlvb05yblRRRjVLVUZNcWk0ZXVyVVFDNWQ5R3Rnb0xMY0Yz?=
 =?utf-8?B?cFpXaER0NWxlSzVnVVgwSE5iKzF1T3l1YlFYdGVuVkVLSXl2amJOam55dXZy?=
 =?utf-8?B?T2lsQkp1T21aQVdGc1cvLzdNVmZhb3pFVWUybUtRREZPTjZpREdHNVFaZ0E2?=
 =?utf-8?B?VzM1SDFBK296Zko0R0htb2JoRlVGcyt0TDd1QzNLeS9PeXR0QzBMbVV4THpm?=
 =?utf-8?B?VVZtb0gyaUdRZDFreDNWQk4yQVdoR25zeE4rd0swQ2ZrQzNlV1ZzR3pidkJS?=
 =?utf-8?B?VnozaVNHRVZlSVBNdWpDY3BFRTd6OVIremZFSWczUG4xOThSdVNEWTVDdzBl?=
 =?utf-8?B?N21Kblh3bGJiOGVVblMrTjkxTTFLMENUTDNJVGhpaWV3dEQxeDFPRU01S1g1?=
 =?utf-8?B?MzcrSU1lTGZoQ2hzTUxRNXFRNi9qMFJSSlJxR1BZQXZmaGZLRzRTVlpYREcr?=
 =?utf-8?B?L3RVWm9BVlN1SnRlc1Q3dG45b1FWbmlGWXVnMjdCSFlrdnVKMEx0LzBWMGZG?=
 =?utf-8?B?YVdkcEFFYXdDUVMrQXdzeEF2YmNpQUp6YThFTDJ4M2xmWTlGVXlXalNKRmxz?=
 =?utf-8?B?cU9mcisrQmpTY0d6MkIzcnhDTmhzYk84bVBmcEtIekJ1NVB5VXk0SkhsWlhT?=
 =?utf-8?B?NWIrNS9DSkFlclBqVmUwQWxvUGRpVWgvZTE0MkpQejI4UXFyVWFXMlVzTHBq?=
 =?utf-8?B?dkJGUVpOSG9mUDNmOGh6MmE3YnhWU0wvcG4xMVdidGFOR1BRVTFOb2FsZVVY?=
 =?utf-8?B?c1JUdGNsMGpwTDI0OFJXa09tMnBLS3Rrc2NqdUFhS2h1ZVNFc1ZUOGxPV2VX?=
 =?utf-8?B?TDdYcTJNVjJ0OG82TCtNdWlyL3B1bjFPd2pjN3c3ZE1TamhhNnFiK0k4a2M4?=
 =?utf-8?B?NVdGZnFvNHFFY2RNV1d0ejY1ME04MlgvbjFZc1pLWVhSNExqd2dBdW1VNFlx?=
 =?utf-8?B?cGxleUhzbDBWbStWcksvUlB5SEF6U2tCZFFpU3FHN0h2WU5mZmNLK2NLZnhx?=
 =?utf-8?B?alpKT2tOdWVyQm5XdzRyZHBQRnFpK2dBVTdNRG02L1h6MloxclNHOExYWkpR?=
 =?utf-8?B?cnpjUTQ0aGM4VlZ1VzlaTTdKNVFibVdvY0dIWHUzYytUTFdCUlF0eGx2b0lD?=
 =?utf-8?B?OEJXMzhhU3NSdjQ0UmVlQy9NcUhZaDYrME9CMGRNaUpNSGRNN1kwWVJaamVN?=
 =?utf-8?B?ZVhydEpLeXNWVW1GL05mUDFFendabjdERUtCNkhqQURreFNjUjFSQW9Mb3hT?=
 =?utf-8?B?SFpnVTRHVkVVd0Fpa0trL09vaE5ZQm1IMEgrckdLR3ZndnBHbDl1bEd3MUFM?=
 =?utf-8?Q?LZHM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0MwbjJ6QWl4d2tFRVZEdWtVK1NFVmlGd1VyREVQMmpnclV0S3NTS0I4L3FH?=
 =?utf-8?B?VDQ5YjZDbm81WHhwcERveXZQS2JHQVNtWXZWbE43cnJpZDEzUzlHMUZuTnky?=
 =?utf-8?B?ZGIra2s4S2M1azlnc1EzUXErQ3NTTWNDZ3ZmYjdMUXl0bk41a3NVK2JQZmJY?=
 =?utf-8?B?aUd6VWxTWFNHaUlrdHM2SEIrcUMzWWZKZDA4czErdzRFcmFCWVl2K3l4Qnhk?=
 =?utf-8?B?ZkI1Mk5JM0NXcS9mZEJzRlpOeVFMTEZXV25MZXJhczIydUViR0MvZ3NKRDRU?=
 =?utf-8?B?ai9hZUN1aVJyd3VsbjlwQUtsRUdpQzVLTCttTkNDYTByUzhuOEQzOTZrL1Zt?=
 =?utf-8?B?STRSNnJTZnA3cXRqRVBPUUt2TkJpUzF6ZGd4OStQaFZuWGUzOXkwQVpKZnZ0?=
 =?utf-8?B?eVRLZmZnWVExSGkzb0hjaEF6YjRVN0VPSmpUUXJiLzl6WXhqTDdrL0ljdE9H?=
 =?utf-8?B?cXkzSUNvTm9VRVl2UlJxQjJKRUJDRmlTRVFFWUk2dmZScTJPT0h1ZU5oSzJ6?=
 =?utf-8?B?YUlyQWN5ek9abzJodUZTZzJ0U2tjb21sMUVPd2lXcG80NjVsNTJDRUJlYm12?=
 =?utf-8?B?TVdYTkM2OXhUSS9GSHM4S0ZTRG5qTWxiU3R1dm1kR2ZDdThMWU9uaXNCRGFq?=
 =?utf-8?B?bTFyUVUyZVgrbzFkWkI1L2NTY2xZN1lWVGhKcmk5RHN3YVU5R2JDM2NvNFdL?=
 =?utf-8?B?ckwyQnc0YmVvN2R3Q3E3ampnRDROT2wzdUZIdVFYUlorVmhmNWk3VkFBRS9L?=
 =?utf-8?B?VFZUVEVqMm9UWnpZOHVKYTVXSldoM2UyZDcvL2pPOTB1SnpFdnYrcGtKczNZ?=
 =?utf-8?B?ZWNNeW5EZEEvZ1A1VzM1MmdOQWxkSVBTdWZaZDdGRzlDb0tMckpNakYwN1ha?=
 =?utf-8?B?NnJlUVNSOVF3Nkd0TXFMbGtWVDF2bFdTUERSL25HcGRSZklTcTZ5Y0p5MXR4?=
 =?utf-8?B?MzlOZkZKTEZpOFh1bWVwcnNMZWh3YlF6QmRzSEVMaGpNV2hSMkx6Yi82eDcx?=
 =?utf-8?B?NUR4YVNLeFRFYWNuYzRNRGdKRmdpai96dVlkZGdzVUhUT2FBUHlmSmwvaDVV?=
 =?utf-8?B?WkdkMkg2T1V5R3hkWlBhRk5Ca0d1RDZzVnBXQmYySEtWMzcrSDh4ZE0xNzMv?=
 =?utf-8?B?ZUhQSW8rSTVLNjg2a2JSNzR1YUhMRzBHNXJ3WUNTc0ZkTlVqUElkZ2RMYllN?=
 =?utf-8?B?UWlmQUMrMVFyNnplU3ZsMTlPYzZKeVpva2t3M2laY3J6SVV0TWM5MkdxSFFp?=
 =?utf-8?B?VEthQXk3aE4wTkpFNy9sQzBtMVgrK0pWZ3RFaFFVUktXdXlUdHd4eDNWYUIz?=
 =?utf-8?B?OW9tTDBGVVpGMmVlQ0tnREpjQmtoNW4yWHYzM3Q1NmEwdDVWMmV4SWt4WVZB?=
 =?utf-8?B?NnBzTjNieDRuYVluWnl5ajR3bkY2OVA5R3BHamkvekRmSE40VUhCWEhSbVNh?=
 =?utf-8?B?c0RlN2dWbm1GQlIvRUR0ejR2MmE5YjNEa2tyNkF4TFlXQ1JIMVJUaUxPMGZy?=
 =?utf-8?B?RjNZODl5eXJ0dW5BUGh0NnZURWo5VVd1ZUpacVk4TUZHc1FrdnJ2eENrWHg4?=
 =?utf-8?B?OVg4cmlNV0ZGMStxMzduT29oa0xFSmVWdFZiOTE5VzhiUHNSRnU3eG1XNWFv?=
 =?utf-8?B?eGY2dmd6THk0TEhvRU16L1M5NTNFTzB5TG9EWEdjWnZUWVZLVmZNczJ5aEtp?=
 =?utf-8?B?ckpuZlg4T1k3bVpuMXFLRWMzcGNKMUx3eStlZ1pQTXJVWEN4ZmI2WHpaWEFl?=
 =?utf-8?B?aytIOERTYXpnZVhYQldGSWxhSmYyVHo4VFgzSEN2OWcvYklIOUJZZmhoRjhz?=
 =?utf-8?B?d3FrZGphUGpWek42YTJ2a3JTS3FQWlcvZ1hoZGRuNkdJaG5iZlQ3MnMyVVpx?=
 =?utf-8?B?d2EzWWRFUkRsUUJhNXpoVmg2M3BUQVhLQzNXdUR1U0ltZDFnYk9welVCd3FW?=
 =?utf-8?B?dnV1UjdkejNWSVFBZWUrQ2lFalUzS01iaDlmdlJucTF6bnhlVVNLbXBDNWM4?=
 =?utf-8?B?QXNFbWR4QmxMYnFVb3hiWXF0RVoydXFxbGgyTXlrNVc2b0RTUXdTTyt2dUlv?=
 =?utf-8?B?cmlzNWtDR21MOVg3NEVjTndiVUJ3S3MyWEZ6bHZTelhDbGg1UTdZZGtvcUtv?=
 =?utf-8?B?SmtwWENjOWRiZWxCcGY3WVlYMlFycUs5NHBwQ0dGNFRLT3Nta2k4R0RsdzZi?=
 =?utf-8?B?aElHZmI0ZUZkcDhHdmZmcEJWN3NiSzRXaWZxazBYN3VFTUJ6TVVsWjE1djFY?=
 =?utf-8?B?aFNrSGZTbFk2eHkxWGpsU2ZFYlV3MlJycTNEazUzZ2ZMVnV3dGVSVko1Nk5S?=
 =?utf-8?B?aGV3S0k3dy81NVFxcm93TGRsTGpNZDNuc1dGL0F1TGQ5WnBTSDk3UT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a3834caa-6cd6-4e66-212d-08de68e1430e
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 20:16:23.6801 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cjHDBNEQcr4MJ/TLOOebJorHaChOoFyS5DYpA2HWaqC1Xla8AGgTG1mPLPJSYXVbuDjmf/kk/k5KVZYPCITwRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7419
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

--------------wrAql0SaM2RTc3mxdV3sxyOh
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 2/6/2026 6:46 PM, Matthew Brost wrote:
> On Fri, Feb 06, 2026 at 03:53:32PM +0100, Tomasz Lis wrote:
>> There is a small but non-zero chance that fixups are running on
>> a context during teardown. The chances are decreased by starting
>> the teardown by releasing guc_id, but remain non-zero.
>> On the other hand the sync between fixups and context creation
>> drastically increases chance for such parallel teardown if
>> context creation fails.
>>
> I don't think this is possible as xe_exec_queue_contexts_hwsp_rebase is
> done under the submission_state.lock + being present in
> submission_state.exec_queue_lookup. The removal is done in q->ops->fini
> and the xe_lrc_put(s) should run after this step.
>
> This is weakly documented, and should be improved, but I don't see the
> problem. I am missing something here?

Even if we use q->ops->fini and then xe_lrc_put(s), this does not remove 
the possibility

that recovery will get the reference before freeing guc_id and continue 
using it while

LRC are getting freed on final put(). While we're protecting that by a 
lock in most places,

we're not doing it in exec queue creation error path.

If a VM is running low on resources, the post-migration recovery is 
definitely a place which

would quickly consume any remaining VRAM due to HW being stopped, so 
reaching the

error path is more likely in this situation.


Lets see if the idea of late LRC fixups pans out, maybe this discussion 
won't be relevant.

-Tomasz

> Matt
>
>> Prevent LRC teardown in parallel with fixups by getting a reference.
>>
>> Signed-off-by: Tomasz Lis<tomasz.lis@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_exec_queue.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>> index 42849be46166..e9396ad3390a 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>> @@ -1669,10 +1669,11 @@ int xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q, void *scratch)
>>   		lrc = READ_ONCE(q->lrc[i]);
>>   		if (!lrc)
>>   			continue;
>> -
>> +		xe_lrc_get(lrc);
>>   		xe_lrc_update_memirq_regs_with_address(lrc, q->hwe, scratch);
>>   		xe_lrc_update_hwctx_regs_with_address(lrc);
>>   		err = xe_lrc_setup_wa_bb_with_scratch(lrc, q->hwe, scratch);
>> +		xe_lrc_put(lrc);
>>   		if (err)
>>   			break;
>>   	}
>> -- 
>> 2.25.1
>>
--------------wrAql0SaM2RTc3mxdV3sxyOh
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2/6/2026 6:46 PM, Matthew Brost
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:aYYpBk1h6Fpjy+yN@lstrano-desk.jf.intel.com">
      <pre wrap="" class="moz-quote-pre">On Fri, Feb 06, 2026 at 03:53:32PM +0100, Tomasz Lis wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">There is a small but non-zero chance that fixups are running on
a context during teardown. The chances are decreased by starting
the teardown by releasing guc_id, but remain non-zero.
On the other hand the sync between fixups and context creation
drastically increases chance for such parallel teardown if
context creation fails.

</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I don't think this is possible as xe_exec_queue_contexts_hwsp_rebase is
done under the submission_state.lock + being present in
submission_state.exec_queue_lookup. The removal is done in q-&gt;ops-&gt;fini
and the xe_lrc_put(s) should run after this step.

This is weakly documented, and should be improved, but I don't see the
problem. I am missing something here?</pre>
    </blockquote>
    <p>Even if we use&nbsp;<span style="white-space: pre-wrap">q-&gt;ops-&gt;fini and then </span><span style="white-space: pre-wrap">xe_lrc_put(s), this does not remove the possibility</span></p>
    <p><span style="white-space: pre-wrap">that recovery will get the reference before freeing guc_id and continue using it while</span></p>
    <p><span style="white-space: pre-wrap">LRC are getting freed on final put(). While we're protecting that by a lock in most places,</span></p>
    <p>we're not doing it in exec queue creation error path.</p>
    <p>If a VM is running low on resources, the post-migration recovery
      is definitely a place which</p>
    <p>would quickly consume any remaining VRAM due to HW being stopped,
      so reaching the</p>
    <p>error path is more likely in this situation.</p>
    <p><br>
    </p>
    <p>Lets see if the idea of late LRC fixups pans out, maybe this
      discussion won't be relevant.</p>
    <p>-Tomasz</p>
    <blockquote type="cite" cite="mid:aYYpBk1h6Fpjy+yN@lstrano-desk.jf.intel.com">
      <pre wrap="" class="moz-quote-pre">Matt

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Prevent LRC teardown in parallel with fixups by getting a reference.

Signed-off-by: Tomasz Lis <a class="moz-txt-link-rfc2396E" href="mailto:tomasz.lis@intel.com">&lt;tomasz.lis@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 42849be46166..e9396ad3390a 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -1669,10 +1669,11 @@ int xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q, void *scratch)
 		lrc = READ_ONCE(q-&gt;lrc[i]);
 		if (!lrc)
 			continue;
-
+		xe_lrc_get(lrc);
 		xe_lrc_update_memirq_regs_with_address(lrc, q-&gt;hwe, scratch);
 		xe_lrc_update_hwctx_regs_with_address(lrc);
 		err = xe_lrc_setup_wa_bb_with_scratch(lrc, q-&gt;hwe, scratch);
+		xe_lrc_put(lrc);
 		if (err)
 			break;
 	}
-- 
2.25.1

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------wrAql0SaM2RTc3mxdV3sxyOh--
