Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CCA0CCD193
	for <intel-xe@archiver.kernel.org>; Mon, 20 Oct 2025 19:30:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 399F410E4D4;
	Mon, 20 Oct 2025 19:30:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h532cZge";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2473310E4D4
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Oct 2025 19:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760988657; x=1792524657;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qaHdIJGskCJJgruzjT4Uc1YeF/8J6dDTcrhwc8aI3ZU=;
 b=h532cZgeA5DcYROdHcbvz17WSRpEaKoat+bOn9OsIl4S2/AddtUxofwG
 0pcPXeFLhQW5ic/7x1u5TjXVCcLgwBiGaxsCLX13UylgRCAiHsfjeeTJs
 kAepuZLGHSuL7uXsq53JoIqFTm4Wr8uAMG/r3lnwZiU1uIJuzbUsa52rO
 3jRlrYAbi1qqbh2pzPca3Q0KFzP7NypVE9Tq2n9ywAu+dblmzw1JviDsP
 qLEAvvMCEhaLyxC/dLJlXefEwAedLxoFTuvyW/+kdEPPbmuHL6lBPoCbv
 NKiGRJVeCa6vYVOb/gdG+veKjZi88HXGH3A4s8UpvJ7Vvs4wPHnH3xNxk w==;
X-CSE-ConnectionGUID: 6CsVtr0CSiaXtDnbOHCqiQ==
X-CSE-MsgGUID: X8c67H8NQ6G+Cg4BjODESg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73782393"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="73782393"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 12:30:57 -0700
X-CSE-ConnectionGUID: G95iq+LtRCCAeCH3yAaRWw==
X-CSE-MsgGUID: lQr9tArqRhu6e25SLGIG+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="183249944"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 12:30:57 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 12:30:56 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 20 Oct 2025 12:30:56 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.2) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 12:30:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jrZkAyroTMYNRKwZdifcfYVZ0NEoSUZvUTllqZDY15gf4lhbl1STmDCnxrk3WvklfoL9FXO69895cAnYiqlxmhuQNQYr/XwiZiicQTEaQ10X29qXNqGpkIfGIOgJIAlg1hyWsonOHgt2LVOrprikDymJntFfC9PjxWev7fk7gVX5krgl+zYmil20hUi7VjuhCqCaYpUL7nYLdr8DAN6avK4JKAKG6a/B8jnExjX9VoveoUVpnkAFKbEMjV0urE76TPBsvqpBXsHiudzqkxx7MkFx271au4PdKpR16zkefmgO8n6CdWkPGLaflQQxxmVBoY4xlBgpqTiOrwT0C3StrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aOg8mjFdkpy/KfAtmk703jH+DwHco3IWEB5eJ8NLNCo=;
 b=MvQS+eTH2s/6IYrs2x2Y5NKHA3bFhxz62N3klYZjCUIduvkwXSHoVBEVhjT8QMb48ipx1GsWI+iV8C4rmMGb2JyJfIdPZCYH/gDdxTZNyN7a9z76hKAHMecpx+vzbYnERnCMnn/oq/1aHn6Q16XuamFO4upR6PHrSsiSab+Ic/hxEo9SSQ8AvtEce2d1sTyt/rSW/WMRpgBvhKWsLX0aHEoc88q+JCG5xmd6QC/QoWnxOJ3hq77mUhJEFFrL7xU6BXTdyedJjcTuA23rgQN4kjvGXQhVKp6lRn0y/Ea/iaoekYOIa5JgLyQqLt9Ue9h1f1X3qmqNxK9LUv5dXKnRKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by PH7PR11MB7477.namprd11.prod.outlook.com (2603:10b6:510:279::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 19:30:54 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09%6]) with mapi id 15.20.9228.015; Mon, 20 Oct 2025
 19:30:53 +0000
Message-ID: <d9840b65-3f53-493a-ac99-fbdfe6a6c7be@intel.com>
Date: Mon, 20 Oct 2025 21:30:50 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] drm/xe/vf: Skip fixups on VF migration before
 getting GGTT info
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Satyanarayana K V P
 <satyanarayana.k.v.p@intel.com>
References: <20251016120511.856792-1-tomasz.lis@intel.com>
 <20251016120511.856792-4-tomasz.lis@intel.com>
 <d3d9ae10-5128-47cf-8c6f-3aa9ec9f0202@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <d3d9ae10-5128-47cf-8c6f-3aa9ec9f0202@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0017.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:15::8) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|PH7PR11MB7477:EE_
X-MS-Office365-Filtering-Correlation-Id: f6ddf645-bd1f-4ae0-dc7f-08de100f2f49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WndzSG5wbEJxTXlnNWJWN0dnWkxZNkVoRU5DNEFRT1EvTWtCUkVpYzY4QTVo?=
 =?utf-8?B?ajRoM2ZlcnZPRjNCbTRJaCtCenFSMnU2QkxoaEx0eS8remNjQjI1YTA1Rjhj?=
 =?utf-8?B?eG1OYXRQSUNiQ3V3TlNZYUE2bXZESW1rWEY2YUFyTXNKbU1ZamwzR2F6VGNk?=
 =?utf-8?B?YzN1T0ZzYXpIaVNXcVlvL2xxN0cxT0NzYmR2TmlQV2RzVHVoTnBYSkJodnRr?=
 =?utf-8?B?REdmUnR6MmpkNEw5RUFmMjFFMVNIRVVnTWdsYmFuSWx3ckdVVWg4ejF5ejR4?=
 =?utf-8?B?YVdsNlluQVVFK0tmUm1ocUpOZ2tMdWFqYU1tVnNUVzJ1UGJTRWMwYXJ0c0Vh?=
 =?utf-8?B?bjI1WTZxMVZtTmRDbFZzSTBHSUNZL0lKajBIVGNoK2lneTRRYS9jbHl0dU1D?=
 =?utf-8?B?SmphazB3bVltNWNXaWEvNmN2TVoxVmdWYldEdzVXdGtrcGRLTFVCRGdDVGpo?=
 =?utf-8?B?dkNiOHFBcDRZZFVLUy8vb2EzT1BKcG5VYllzT2NvM2JpU1I4UC94MmxoS1NW?=
 =?utf-8?B?N0l0TUZmOGJzSTZka05sT3VVZlhOMDV6UWFPejJXdkhDeGRzN285K3dNTzhX?=
 =?utf-8?B?VDhEdFJWb24zQ1E2L1dKT3NmNXQwRVc2TlY0VHNUNEhHa3FTaVJNWDlnZTlM?=
 =?utf-8?B?TmZkUUUyRWdJVlN0ZUhGbVFjQ2JOV04zN1lyNTRkbEtLVEZpaitRdmFXeU1M?=
 =?utf-8?B?bFQ2UnFINVFJdlEwSFpLQ1RIa3BSTldPL1J4UkVRRzR1TGg0dzlLeCtLK0Jv?=
 =?utf-8?B?c2U2azljblNUNjlpczB4S0UyUEMzdkpZSUM1RlhmQnpoZjFvNUpYOEhsTkda?=
 =?utf-8?B?clQ3cElSa250RVZ4Ulh2aG42eG5JWk82NU8waysyOWZpdisrVTBEZ2dKZkl5?=
 =?utf-8?B?eFBrUVk3YnArblBwRmhlbnBtWWxKVHBmb1QreDJzMzhIemxOVUdXUHlmSzFv?=
 =?utf-8?B?ME5EMWgrYkZQOWdoYm9HZ1BES0RGM296QkxzT2dWUnpGZHJtNlhmNzVoNGg4?=
 =?utf-8?B?TjFWdUN4SjB0TGlCcXZoSnNyMWRCejRZNm5mRDZWM3VnMXptWGVnOGpjNVVt?=
 =?utf-8?B?VUk0VVYyNHAzVmlrTGlXSWlMbENmdndHemJMancwU29KMXhYMXU1SHNkYzJT?=
 =?utf-8?B?eDBPZzNFUFBkS2dKaVBISCtRajJlUWg2MUNLbHBTZXVheHVRNDRMMDRTMDZq?=
 =?utf-8?B?WnZxVmtFV0J2dTRxeGZtU3ppRmdCcHRvMTZ0QnVzNnBVWnkwMk1ETE1leXpp?=
 =?utf-8?B?NU9kdHZsUTF5WXpaZmdDdy96RW9zL2JRMFJHbi8xZzdzZ1gwZVptMWI2czVh?=
 =?utf-8?B?VHFOMHlOblRZNCtvN2hZeHVueTU4YzYxZGtlYUpzalQ0VWhKNkNha1JnUStG?=
 =?utf-8?B?OUxGdmlOcjNGWlNuRjRMaC9KM3cxY0hzNTRjVnNUQlU2eHVJbkN4S05MR09z?=
 =?utf-8?B?dHd1N2NmNTNzclJRWVlHRjhmUjJHWDZQSS8vL3hhbTg2OUlXSVBZRjJVTUc0?=
 =?utf-8?B?SXFZN1VrVTZadkxiK1R0ZzdmSDhRUFZFelV6N3dTSzNlTnFiV3M3aUhyMXhr?=
 =?utf-8?B?TEJhbmlpNU5pYWdkaU9FVDQyVCtwY1FYMmh1Z2tRWTRLTFZ1MXRnRkxqT3Rs?=
 =?utf-8?B?akM4ODV6WVJtWVBLY25VZ3R4LzhLTlgrS01veVVVVTBZSnhxYnh1L3NJaGVj?=
 =?utf-8?B?UEFDbFFBRUxDeEg3UlI1QlRhY3BCc05FWHM1dDEvbzh2UkZOLy9ub1cxUDJC?=
 =?utf-8?B?VnRxU1RUWksrVElQK2ZnWjBYd3NZT2Y5L3hLazQ0ejRHMHo2UHAvYTdPbFVu?=
 =?utf-8?B?NzRDYUtNNURta0ZDMVJJRVBpdjN4OFF5a3l5ekNhRS9TRnNVM1BWbk9MMGtu?=
 =?utf-8?B?U0l5T1FKOXFQb3JEcmZFN01uT2xwVFdabGZBNDFNTCtpMjZydnlmNVdaa2JZ?=
 =?utf-8?Q?1GxQn7Kz56GoGwvy/5+mYKyz0TcBpcma?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2R3alZtMndJU0EycVVLUEM5Ynl4aEdDdmI1REpuYTZBSXo3UjY5Zmlwcjdz?=
 =?utf-8?B?eCtYeSsrempPYTJsL3dyZlp6eDZvYnd4cEVpYTFyZ2lBSEpLU0VlbFJGdnp1?=
 =?utf-8?B?TUN5a0tVVkZKaENOR2YzNHNZbTBhZk1yREUrallValR1WVByaFRDalNlLzlF?=
 =?utf-8?B?RFRKYUlleGdHTnloKzJtTDhoOWF5b3JTQUpoN0t1bmdycEgrZTVIM3lQRGQr?=
 =?utf-8?B?eW9ENk5NVzJlTG00bWVNcS9kWDhuNXZ4dFN5Q29hcWZlMVJOQ0REcG4rYU1m?=
 =?utf-8?B?K2lJVDdZOGI4SStXb2xzQU0yRVFOeXFCMFR2ZWdEUWcwR1F3YS80ZzRLZklz?=
 =?utf-8?B?ZDBwK2M1RktBSE9OcTIzbDJRdXZSUkNmby93bU5oN082b2MxanNaQXE1MW5s?=
 =?utf-8?B?SDJ3N2wrRXdibHlPTFpiTFJ1WGNVVFlTTXd6YUEyVzQ1SFN3Ylp4VnFMMG5p?=
 =?utf-8?B?TFV6alVlL3NxN1Y3b24zTWFienNDK2VtUHRzWTFFaTJ5U1BMUnFTU0VMSWxY?=
 =?utf-8?B?d1VrVUxaMGxmWXRVYVc5M095WFRlcHZYNUlXMHZibGlRbmljT010K1I0eXQ1?=
 =?utf-8?B?MkFmVGJUYVROeEttMG10WXJSb1lCU2V6REZ5aWNwVm84M1diVkVxaU5nd3Zm?=
 =?utf-8?B?eVBTR2tEVlFDRXEySHN1RlI2RDBpaHJPejZMbFlyVXJDdEFHUFRaaVU2bkF0?=
 =?utf-8?B?MUswQktNUTRDYWJyWWd0ZUYrcXV4WDlHbUhPTGRpZHdWUklkTmlkSnJxUS9j?=
 =?utf-8?B?WjZRZzRtNUpnL3UyR29kdktXdjkwMlFBTHVTWTNMcHFtUW05YjBHbmxzS1gx?=
 =?utf-8?B?djhNRWhlK082Y2k0OTVHU0VTT3c1Yk9FTEI0dVlMWkx3TDRQdkd2NEVHNXA5?=
 =?utf-8?B?N2xlWS9JK0IxOGhRUUNzY3N3MXVNRzNDbVBFOHhpaXlMb0JaNGNHNlZqR3FS?=
 =?utf-8?B?c0MvUTRqVEUvalJQd2tyUW5Eb3dIV25Bc0NqOWRUQ1pkYlQwRFdpL3NNL3ZO?=
 =?utf-8?B?ZjIzQkdvRm5Vdlh6SEs5N1o5Yi82NndFdTZxM3FZOEozU0ZUM0NpeUpTTkIr?=
 =?utf-8?B?QXBlSVdsT0RCZ29zMXhRR3AxeEx3dy9ocW1adS9SamF0RmtGTlRpdlV3ZnhQ?=
 =?utf-8?B?RERING5qdmdENjI4V1liWmV0SUlnWFI5eENWVkJ6eEJZZkFSakgxM3JpVnhu?=
 =?utf-8?B?eDY5QmZ2NnIva2Z2QWNGczVqajhUa1J4UDlmekJiRFhNN2swa1BCRUtDaVNZ?=
 =?utf-8?B?SEhMNFh1T2NNM3BCd1Q1SXEyeWRTQWdPMUd2dWMyalUydVBjLzZZcitYaGxL?=
 =?utf-8?B?SVZQVkdGT0ExZmtNMDZoK3B5MlRSSlU3TWtLbFdwRGZ3U2hsV08xVENxOTZp?=
 =?utf-8?B?UzZhUGZtRlRuRm0yWXZBbDlCdXcvWmRkU2c4bCtWTDhPME9QcXR2TWxzZ09y?=
 =?utf-8?B?Wk1WdFJiWnhPZWt6YWhNVDlMd1VkRHI4bHJNWWpsRmtGQWF5NHR3cjlUU29G?=
 =?utf-8?B?SG5sMXJtOFJLYWZhTWQxVVQvOFdYWkxlQ282ZVZWWlZZanVqbE9PTDRhQTV1?=
 =?utf-8?B?TGRKMlNPdnZpbnFpcWx4S3BackQ4eGNPMy91TWRhUnFqNXUzaTAwNXgvbXJ2?=
 =?utf-8?B?Nk1CNENralg5ZjI3a3l1c1B1d3E4ckQwUSt5T0dHYkxKK2lMT1VVc1dBZGto?=
 =?utf-8?B?aDczTGFSVGd0dTZPTnNwZ1VwbElLQndORjRjZ1lUK0VSWDZSd3JGKzR3MlVn?=
 =?utf-8?B?S2VZbnNNQUc2WlZKenpXaC8rc01hOUV3Y2hkMk51dFM1c3JpeHdxa3VTUUdw?=
 =?utf-8?B?ZzVWRkhjeU83ejFodGtQOTBaVDA1WitRWUxSTS9yUE53VDRSVmUrMUNmaU8x?=
 =?utf-8?B?UVFBY1ozd2Z1MEt3UlQ3alYzRFVVak5qdUI1bzcrYzVYMU4wTjJIRlFreDBL?=
 =?utf-8?B?WjJsazZKcGFWbk1XTVpaT2Z1WnNNaTUvOFpLZTY2MkFDVHpCOUsyY3FBWnhP?=
 =?utf-8?B?QnExU0tsS1RiMDZOUU1vRmtabUUvMlkzU2Vma1RVcFRYb2ZMUk53S01LTndR?=
 =?utf-8?B?VXh4VUZab1dhMktQTDJCTlRSbVdNNVZFUU9xUjBiVytEb1paNWtKU2dEaEhW?=
 =?utf-8?Q?pZUHgeCHfEyAsIuxGT+ZwuPC+?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f6ddf645-bd1f-4ae0-dc7f-08de100f2f49
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 19:30:53.9136 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gAWyz40BY4rtSeTKCM3fdI5TYo5xQP72O/GtRpWyOix1Wlt8KsbUTguZxqSTa4QG/y+x2wrW5+uscBLn1ZI1dA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7477
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


On 10/17/2025 12:20 AM, Michal Wajdeczko wrote:
>
> On 10/16/2025 2:05 PM, Tomasz Lis wrote:
>> The GuC RESFIX state should be achievable only after a successful
>> handshake. If VF KMD has no GGTT configuration yet and we still got
>> into RESFIX state, then either we're dealing with unclean initial
>> state due to unusual actions before probe, or the migration
>> happened while xe init (started by probe) was running.
>>
>> In 1st case (VF migration before probe), we should just skip migration.
>> Init procedure will ensure exit from RESFIX state as it starts GuC
>> handshake with a reset.
>>
>> In 2nd case (VF migration during xe init), the migration procedure
>> should execute normally if GGTT configuration was already acquired
>> from GuC, and can be skipped if it was not acquired.
> we initiate recovery as part of the MEMIRQ handling
>
> but to get MEMIRQ interrupt from the GuC we need to setup it first
> to setup MEMIRQ vector we need to obtain GGTT data from GuC
> only the we can register this MEMIRQ vector in GuC
>
> so valid GGTT data seems to be hard prerequisite for this scenario
>
> thus vf_ggtt_queried() should be always true, no?

True. Patch makes little sense. Will discard.

-Tomasz

>
>> This solution will avoid crashes due to the VF migration running
>> on non-initialized xe sub-structures. But it is not enough to allow
>> fully reliable migration during driver probe. In particular, the
>> situation where the probe might not end successfully, is:
>>
>> * The VF is paused and migrated after GuC reset (vf_bootstrap) but
>> before config is acquired (vf_query_config). In such case, GuC may
>> remain in RESFIX state, leading to timeouting requests.
>>
>> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> index 34c68de6e2f3..bb0b71a47125 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> @@ -1149,6 +1149,12 @@ void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p)
>>   		   pf_version->major, pf_version->minor);
>>   }
>>   
>> +static bool vf_ggtt_queried(struct xe_tile *tile)
>> +{
>> +	guard(mutex)(&tile->mem.ggtt->lock);
>> +	return xe_tile_sriov_vf_ggtt(tile) != 0;
>> +}
>> +
>>   static bool vf_post_migration_shutdown(struct xe_gt *gt)
>>   {
>>   	struct xe_device *xe = gt_to_xe(gt);
>> @@ -1260,6 +1266,11 @@ static void vf_post_migration_recovery(struct xe_gt *gt)
>>   	xe_gt_sriov_dbg(gt, "migration recovery in progress\n");
>>   
>>   	xe_pm_runtime_get(xe);
>> +
>> +	/* If during init and before GGTT configuration, skip the procedure. */
>> +	if (!vf_ggtt_queried(gt_to_tile(gt)))
>> +		goto skip;
>> +
>>   	retry = vf_post_migration_shutdown(gt);
>>   	if (retry)
>>   		goto queue;
>> @@ -1282,6 +1293,7 @@ static void vf_post_migration_recovery(struct xe_gt *gt)
>>   
>>   	vf_post_migration_kickstart(gt);
>>   
>> +skip:
>>   	xe_pm_runtime_put(xe);
>>   	xe_gt_sriov_notice(gt, "migration recovery ended\n");
>>   	return;
