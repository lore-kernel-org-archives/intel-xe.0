Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B959CCCD184
	for <intel-xe@archiver.kernel.org>; Tue, 21 Oct 2025 17:20:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74D7810E62C;
	Tue, 21 Oct 2025 17:20:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X7kaORKg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8999410E62C
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Oct 2025 17:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761067229; x=1792603229;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LqRxVjpbGceG8102VCXJq2LypNTzRl1yohrLMb9Eocs=;
 b=X7kaORKgVhLHIbSSjltkJm1GhEyq3Bw8TopBev8anVl7t0BvlnnTDRyP
 ksFswm7nEqU9xuvGPb8VWCkCBSFT7Or32RVHh9nsA/kmkt5AcYTMDyeaK
 ABQpD8MPs+LHpIjM0CYDfvvAc3vMkT0gTw+5ohka4Sw1SqrFou05DdDrm
 /AFZr7Yw0fH+v3Oa6H91iixfm/O+rHIxsNJ91Yn3Yo9NLTO4UoGqcN53i
 P6PJu/xbHB2ebUbcWQHICJK6A4B3Bv+eXxRPcoM9iDzXUxFZOFDew+EtN
 Mndlwr0JGh1M/6dHv5VuHpxFm7zKGtVM5RmJ9GO/z6P4zofNHk/hycGee Q==;
X-CSE-ConnectionGUID: 2HwM6oKuSL6bhqhxo+QAgA==
X-CSE-MsgGUID: NiIreedVSOyXS2RStXkGdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67066241"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="67066241"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 10:20:29 -0700
X-CSE-ConnectionGUID: iA6o6+8pS/eR2y68DKGVsA==
X-CSE-MsgGUID: lD/6eXrxTVOvzDtZUfYRRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="183349222"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 10:20:29 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 10:20:28 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 21 Oct 2025 10:20:28 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.18) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 10:20:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mztKxEKGdQJJuFHqGe88nIngdwN3qqqf2PjoyzIpFq72G1vKRCD0YcY0LkV7NYr9BHUIhz2KLAzUqSBvuclApsIGADiK7/J1UF8rB4ZAJbayBxgTsszCLBuK4HLmifW9sYgN4iO8CtWk6P/AHisrrUqdAlyXXFTTNuxlr5EX1fqDbAFhvtQWSixlUdLL7dHRX0vgrEMFWyOj3IxaBSiB0ftjOT8sK52LxHYRkas1E/JPu1lzzEAghXtMsEoo9bgXzJb5j+7nlyAMOWjC7DAwNWG5sWH3JIfie7yC9vhOjZKmG10x7E6LFrkju7Ao4zRiqWud5lKzkGxvI8ypa7OIsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1P7/ZeDgNuPJffr2HfYJdKWZkdwBRVJx+XNq5jLXxf8=;
 b=UYSlZLvutlmuEf7cr5XrzPKDA+u8tdQ2H20GoHgKN9YjV6L2uKhEtQvS7nuS9V9QJEIXJmwiJZnWDFNcDc3pT3HIJspBtJqlwIMiV4RdUIuXXGeozYjILBYun5c6YVAA6dA6tkmhy25dvW5s3IRef3KatyEfzHo/tPw4gMxMcCCgE2yCzFEbSbdFZ2kd5mBT86s6bdmo0Qes3Z6DP5lN4Xkz5vkd9DuzoJwZf0Kv71+JdcihKmDuiphYfAUNDaSv5dXJHCL1jpvfel05Z3CIlMKuwE7SyBmmLVvvgWbmRFrjEl2am5QFqZpSZUgQRY11qxa8dkCtXHGHHe1jCgvFEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by DM6PR11MB4563.namprd11.prod.outlook.com (2603:10b6:5:28e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Tue, 21 Oct
 2025 17:20:26 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09%6]) with mapi id 15.20.9228.015; Tue, 21 Oct 2025
 17:20:26 +0000
Message-ID: <f96a547c-48d5-4a15-9853-075ae48b8751@intel.com>
Date: Tue, 21 Oct 2025 19:20:22 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] drm/xe: Assert that VF will never use fixed
 placement of BOs
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Winiarski, Michal" <michal.winiarski@intel.com>, "Piorkowski, Piotr"
 <Piotr.Piorkowski@intel.com>, "Brost, Matthew" <matthew.brost@intel.com>, "K
 V P, Satyanarayana" <Satyanarayana.K.V.P@intel.com>
References: <20251020205808.1187308-1-tomasz.lis@intel.com>
 <20251020205808.1187308-4-tomasz.lis@intel.com>
 <8c9bf95c-e650-4035-a5a4-3c6b1d353851@intel.com>
 <f4e2aaf2-a4e5-497a-8b35-7044b29dc48a@intel.com>
 <e90a6fcc-ac9d-4707-ab10-6e57ed6a554d@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <e90a6fcc-ac9d-4707-ab10-6e57ed6a554d@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0502CA0012.eurprd05.prod.outlook.com
 (2603:10a6:803:1::25) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|DM6PR11MB4563:EE_
X-MS-Office365-Filtering-Correlation-Id: 2daa8ffd-a154-4fe6-dfa7-08de10c62057
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WE1JdWQ5T1FPVStYekhQQWNsNU5xczUrNk5pS1NBWmpVcGJ1cVBUcXNuNFFK?=
 =?utf-8?B?T1IzdEkvSHNCRUtRVFBVYk9Ga0NKeGJGMGxBMDNvNGhWYlNpQTFVN3VTdGpP?=
 =?utf-8?B?WXdvZTN4elVhYWtnakx6ZGFDakk0NUJaODVrZmlLU3hYVmlpYlRMTTRmY1Zi?=
 =?utf-8?B?L2JiOTVLMUtOaEs5VExRNGpkcmlpNlY4QmtFTG84NngzSDJVREl3VW1QOTY2?=
 =?utf-8?B?aU9Jc1AwaktCVkZGMDliUXpVMUV3eWErUEsza0NDaTk5by9zMW1jbUFzSXUz?=
 =?utf-8?B?d2NjUFJoN0dWUWMrNHVydXZXRzdjT20yRzBaU2NiZzhnRlZpS0M3U1g4VFBq?=
 =?utf-8?B?Y0F1NHE3SEhLUkx2VGJGTDFSQjZMSmlpUTh3NUQ1TU9JOG5aaUNPVHVuMjB1?=
 =?utf-8?B?UW1WeGxNYW5ER1hJT1hNdkdycXF6S0l1ZDFHQXIyeWR0cU5RNE9OY3E0UFFD?=
 =?utf-8?B?bDVjRGtKYWd1TVpYWUtzOWszdktSVTBTeFJUSFNxS3Nzd28ydGxCdkVuSWxG?=
 =?utf-8?B?MEdLT1hHNWNDNFNRaldyLzMvaFhjeXRlRG0xYTUybHJKUnlnVHZYM202cEoz?=
 =?utf-8?B?dGh4Y3daNmxKYjRJUzUwNVpxa0N6amlZZUZaTzNVMWdiSHdhWm9Lai9WMjJW?=
 =?utf-8?B?NDBxOGQ1aFpDbno2VDR6U3RzRHNDZzNkak5BdXVNMFExV21tVTRaMUw0TnYz?=
 =?utf-8?B?Smd5Sk9sZmdkOXVhNUk1Uis0ZDVvMlJkNEpoN2dlUFQzZk9nRTdqMVljWTB3?=
 =?utf-8?B?cXE4UTlOVmhvSSt4dlV3N1FXeTdqdk5oeWkvcmNtYlpsOW5JZ2F3dEUyZ0Jn?=
 =?utf-8?B?RDg1bk9mQ0tpWUljcjNFSnM2b0VFTCtrbEd3RE1pY05KamI1WjNqME4xdnVC?=
 =?utf-8?B?eDZOZmF1OTlYT1F3TDJoaXdYVkdXZTVzSC9yVnA4cEhuQ1lBUFhjaGEzc3NP?=
 =?utf-8?B?UFdqZEZWbmRhM09jMGJZNFRoRjF6NlFTNndVbm9KQmg4NnFKYlhuYzZGUHRT?=
 =?utf-8?B?YUhQejYzS1pYMjdITFhJU0doYlBocitZSXVjNHhMaTRia2svc0x5VCtLTnMw?=
 =?utf-8?B?akN3UmIxU0JvWXJ3ZkdIb1F1SklxUmlmSXVkTFN3ZEpHWHZaT1VxV2Z4NTl2?=
 =?utf-8?B?YzRtVm8ycVlCVVIvL2UxdEZqV3V3OXg5UDVEMjNmSlRzU1VKd1VYYXFldWs0?=
 =?utf-8?B?VzZRR0E5a25ENkdmMjNReTZTVUYrTFhoeEpKL0RNYkVKR3UyOXljQUJWQlBM?=
 =?utf-8?B?NFJKWUQ2THR1ZVF0MjRjbUI4U2JkU0tOTnlrK0xZbHRMZXhPcm91cGd0bXRM?=
 =?utf-8?B?ZVRjN0NlTU1IMDVwVEZhbldjMElvNGswMzFFWk5qbG9UZTZmckRyQkJBSjZ1?=
 =?utf-8?B?aDZ4Yng1YkNSSFlWU1h5bnRkRjFCS3VpMXFqZmpYNDl4cGZIT1NiLzhWVnQz?=
 =?utf-8?B?ekNrMGR2cnFoWDhUK0U5Syt2QVVEM1doTGtsMjNQazZyeHRJUUM4ejlVbHpQ?=
 =?utf-8?B?WlpsdElKbzBYVU8wQUY5ZTc0YXB2ZkxRZzNWVGVpSTJBVkVLSkxSd2tNeWxl?=
 =?utf-8?B?Mnc0ZTVLT0NkVTRSQzg2QWl4RnlhZzZXTk42THBSbkJFbGxTTGNHRTFjcmt2?=
 =?utf-8?B?NnNSNWJSQWQ5d2hFL3Q2dy9McTNRcFpTamZSZm9JTUd0dXA4WGhTdFZMVkxN?=
 =?utf-8?B?WFUxOHY5RWRtWUhOekVPSm8vL1dhVWhSU0VGcmFveXQvK0N5M01oZnJuUWdx?=
 =?utf-8?B?WGNVNCtKZHliMjdvZG5MdVZzUVBTaFR4eFYwQVdxeDhaeEhlWStZa01SRlVJ?=
 =?utf-8?B?UDQvT2I2ZS9KSmZpMi9OVW9KTzc0ZU5iWjhpc2VIbmc0NHdMMnNyM08xODgz?=
 =?utf-8?B?QlA2ZlZXWDhYbURHSmZPQjkySnZSb2kwbEdMNjRqTXM4VitUUWt0YmlZemlt?=
 =?utf-8?Q?sqFJBX20nOXCZERtXCaciZjuUXy/F4uS?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qm9OZE8rTUs3NGt2bUxRZ25XTnAwREpoQmJKU0diS2hsOGkycXdqNDUyMjdW?=
 =?utf-8?B?NmNvSjd2bGdTZm9Gd0w4eVg2Q1B4TmxrRml5a1Y4NkR5bzdVQmFsSCs1NGYx?=
 =?utf-8?B?enBRcHMzTTcwV05NT3U5dVg3aFBRK2xzNHdDYmtoOXNyMUJWczRnV1dUME5J?=
 =?utf-8?B?RUk1ZGJqMGZKc2swTnBiQlhINUZudzQxczBWNFZyWjltd0lGb2Q2Tms5aXVs?=
 =?utf-8?B?QUpQdXNaam5WQ2QvcFZCYXJZUkxiWHp5R2NqNktzRThwZFhHWDBtZlRjTmNT?=
 =?utf-8?B?RmxRZ3ZIVVNUZXRZWGJZdGZzUkEvcnU4T1NycXpxSkl5WjgwakJTYXQycVVZ?=
 =?utf-8?B?MTJSTXIvL0hlaG5wR2V5VXdhQUNLbTRoMVBkSUhHVkFscDZWY0x4UzNxc1Zx?=
 =?utf-8?B?UkszdUo5L2Jyb1d3TXRGaVJncmJ4aHREd25XUW5xNXBzVk1qalZSME1qbytr?=
 =?utf-8?B?b2VML1dpUnNHWWoydHZrbjVsTnVCbU1nbEw4M3dvYitXQy9xUFFkZVRtQ0FB?=
 =?utf-8?B?ck54VGtMdUhQNXQ5azR0K1lNVzhabE1Kd1FaL3JHblZ5MmxtR0kvWmdOS0pi?=
 =?utf-8?B?UDR1bk5GSFRmdUhFUUYzWXhPakwvajNldHovOE10dlArVWJDQ1RZMHJCMFRs?=
 =?utf-8?B?aEdtWjgvRHM4WEJNSHNzSmNQSzIwWCtNbmVLZlY5NXZhVjFIWjhPZ09JVkwv?=
 =?utf-8?B?TWl4dFNqL3pXWnROcUttcmxOa3o4Y25DYnpxMUY5dUw5MXliWkdLUmcvYmhv?=
 =?utf-8?B?MHpWNVJSaUQ1d2xaMlJwSXVUUWZWRUhNRmpPWDVKQ1VQejdWYUg4OFNnZHlj?=
 =?utf-8?B?TzdNSkRmd0wzbEx5OC9YVXRSb2JKcGZSSUpLeU1CWm40OVV6UHRLK3NNcGpn?=
 =?utf-8?B?VXdxcXVCYWhRMk5WbkI4d1ZabVdydmY0b3pvTHhXRi85cnFlcDJsSnYzZGNs?=
 =?utf-8?B?MWx1bis1N3BCU05BWVFBdTlVeFNtMnpLbEZoVXl6Q01GdUVWd3RVa0RBWjF5?=
 =?utf-8?B?ZUU4aysrZXpMQ0FIUFZlcW9zVkhjM3h5TmZkbjh3anpSV25yVXNIRmFwQjc0?=
 =?utf-8?B?ZGluMy96T1hndEs0SVhZZlNOdyt3OGF1WkV5TTlIdzN3SUNGSXlPb1BIMERY?=
 =?utf-8?B?eXpRcmZuY2g5UWNPTkFLQ1M0TmNHRFdFZy9QejdrV1hTby9RLytaOTd2cHU2?=
 =?utf-8?B?S0o4TnpwRXdoSHkyMDZ5dGN4UEYwM2g5NDRpdVEvdm04bGZMY0xoNmxlQS9H?=
 =?utf-8?B?aGIvVENqaTY0azgzbTVZd0dyRzBPVkVBUS9xd0c3V1RDQzJaeUJTMENNUmNO?=
 =?utf-8?B?NXRsV2Y4MW04aG1LWE94Q0ZkUWVabTEzOGFQOGRwVjhaZks2OFBsT050SmdB?=
 =?utf-8?B?bVIzeTBjNDgvUW5XMlRqRXVFNXZZU255QWlhWXk1R2ZzVjJjU3gvSXpzMEdF?=
 =?utf-8?B?a1lsVmxEd2V1TlI2MVY5dWIwRnZxbVpuNzdtanFCbE1KMlVFSmx4aVJMcEla?=
 =?utf-8?B?NzBCUTdTRStqcHk0allMUmVaZDFNR3RPWTNJMm5hN0ZIdXpkUStFWGlPK25z?=
 =?utf-8?B?Tlo1M0ROSEhOb0gvNVZ3WE9nZ1lCQlpiQ3lvREdjTk5yU2M1T2ROMHdHNlN5?=
 =?utf-8?B?NEV4RVVJQm5Id2xTN2dZOVFqaTgrZ0ZPdzhaNmNiaU4zb2Vkci9aKzZNSWl3?=
 =?utf-8?B?eEcyVjM5YVJiNGVMK2VCRkVWMVdPUFpkZDd4ZUxUaEt6T3laclV4WnppMWxS?=
 =?utf-8?B?Z3l3ZTcxR0poRjZzTUgxSW50QjlMOW00OGpIbnBuSDZ3ek5xNjJhczZ5L0xR?=
 =?utf-8?B?VkI5YmtqVnAzNkFINVlhNSs0RVhYVGVVbEFtenIwRVFUTXlnUW5Pdk5IQ0FV?=
 =?utf-8?B?L1paL3NwWnl6bWhvVGZ5VXBtTVFVOEZxeDcvYVpZODdldEtQVEJlWDhVODZJ?=
 =?utf-8?B?ZEtNYzFHTm9ESFR2L0lmdGc3Y3RlWnYxSnNkUUVXbm84SXRqVml3OFdCZmJq?=
 =?utf-8?B?SEZXQnRkUkJRNGdHSlFWc2VTV2xINytvYW1xMmE1M1laTVFtcUkvbE1iTFJQ?=
 =?utf-8?B?c1VyTVF0N1FJSnc0REtzZlVjRndlK3ZENnhTWURya1hCeFRWYjRwck42ajlJ?=
 =?utf-8?Q?JE/APdTAoOvPeChiO6wkbdnpz?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2daa8ffd-a154-4fe6-dfa7-08de10c62057
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 17:20:26.7317 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Li0GCzEo1pBoI4kDuW2kArB+01obqMKqcCgywmOMZZgrza6zEUk5Zj+YB12lQym9Vlb8mocCnM44pj4mJryDrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4563
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


On 10/21/2025 5:04 PM, Michal Wajdeczko wrote:
>
> On 10/21/2025 12:48 AM, Lis, Tomasz wrote:
>> On 10/20/2025 11:59 PM, Wajdeczko, Michal wrote:
>>> On 10/20/2025 10:58 PM, Tomasz Lis wrote:
>>>> Most BOs do not care at which offset they will be accessed within
>>>> GGTT or PPGTT. The few which do care, should be only created
>>>> on PF, and mapped within GGTT. On VFs, mapping at fixed offset
>>>> would be problematic, as each VF is granted access to a range of
>>>> GGTT address space.
>>> it's not a matter of being "problematic" but this is just prohibited
>>> as there is no assumption which GGTT range will be assigned to the VF
>> will update to "prohibited". though that's a simplification. Fixed is not the same as constant.
>>>> So, since fixed addresses of GGTT mapping can only be used on PF,
>>>> we can add an assert which makes sure no attempt of fixed placement
>>>> will happen for a driver probed on a VF.
>>>>
>>>> The assert will also ensure that VF migration can be properly
>>>> performed without a need for special handling of the fixed placement
>>>> addresses.
>>> this last sentence can be dropped
>> will drop, though I can't say I agree.
>>>> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_bo.c | 6 ++++++
>>>>    1 file changed, 6 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>>>> index 7b6502081873..8e826a4aa574 100644
>>>> --- a/drivers/gpu/drm/xe/xe_bo.c
>>>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>>>> @@ -2259,6 +2259,12 @@ static int __xe_bo_fixed_placement(struct xe_device *xe,
>>>>        struct ttm_place *place = bo->placements;
>>>>        u32 vram_flag, vram_stolen_flags;
>>>>    +    /*
>>>> +     * to allow fixed placement in GGTT of a VF, post-migration fixups
>>>> +     * would have to include shifting the page ranges
>>> it's not about implementation of fixups, this is just not allowed
>> "not allowed" is not an explanation. That is clear from the assert itself. The comment is here to tell why.
>>
>> Having only a range of addresses is not enough of an explanation, as then we could still have fixed offset which was computed so that it conforms to the range limits. Fixed does not mean hard-coded. For such computed fixed offsets, the explanation in comment is correct.
> any of your "valid computed placement" will have to take into account the VF's base/size anyway
>
> and since this "base" cannot be guaranteed to be stable across the VF life, those computations that expects or use this absolute "fixed" final placement are illegal regardless of any missing "migration-fixups" implementation
>
> OTOH the relative offset of one BO to other BO, will be satisfied after migration without any special work
>
> so still I'm not sure how above comment might help

Right, relative to BOs or to GGTT range bounds. They will get updated 
correctly, mostly. But then such BO stores invalid "fixed" offset, at 
which it is no longer mapped.

-Tomasz

>> -Tomasz
>>
>>>> +     */
>>>> +    xe_assert(xe, !IS_SRIOV_VF(xe) || !(bo->flags & XE_BO_FLAG_GGTT));
>>> but the assert is fine, so with commit/comment updated,
>>>
>>> Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>
>>>> +
>>>>        if (flags & (XE_BO_FLAG_USER | XE_BO_FLAG_SYSTEM))
>>>>            return -EINVAL;
>>>>    
