Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42E0CC02193
	for <intel-xe@archiver.kernel.org>; Tue,  4 Feb 2025 20:14:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 090F510E075;
	Tue,  4 Feb 2025 20:14:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X6GsElcm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAB5410E075
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Feb 2025 20:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738700047; x=1770236047;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=gBQ2a4NOQ87CznR2Gim+NUpNLCQ4Q/3Cu3sLQdAvxog=;
 b=X6GsElcmD7CjVCYpmHY/Ir09qdwmlVocUG8nUFL1BQwSnj6XnfxSC/V0
 a0K/AgRzKpV/BK3988XAZlXTR4qutOB1lvK8K0NBRtRRV/sFe26LWNUQt
 IoDikR3QAu9FRn4cVPHLTJDzWKivMmg/K1VaO+8cYk3CCrGPqA+jBLKQy
 BWikqfEdB6MBYijnacYoFijZ9TuQjTonRnXFTaKt5lZYdLY547psqJCnj
 u3BS6kZTXv5mZq783aq1wYoh0VmgSUsRzem1zblkake7iuEYRdHVqnTi9
 Y7n/j6848dFGjGEq2MgvCdbQZWkDCYdhVikUHB+47jhTi35XBAjfSjDau w==;
X-CSE-ConnectionGUID: nr7TjmrnQ1OFt09JWcDnCA==
X-CSE-MsgGUID: 9H2Yr2OSRFOUnGF0LGhW9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="42994669"
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; d="scan'208";a="42994669"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 12:14:06 -0800
X-CSE-ConnectionGUID: 4tv/bTJsSX6FZ24h7s/bqQ==
X-CSE-MsgGUID: 4V5jEm6kT5K6m4oRvOi4kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="111137483"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Feb 2025 12:14:06 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 4 Feb 2025 12:14:05 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 4 Feb 2025 12:14:05 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.49) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 4 Feb 2025 12:14:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M9olW/PaEZFHDXKUhHd+kripjDoqSW7HChdilAXoPdzcAbUThHccNzbqoKxY34WpKM5OHvPkf8Q9zkBpR1Y8byd/KHcjgWHeWfPrrHVvYJ3vIZjqgCh436rLB+/YWCUdC+Cd+IbhbnPu/D6pmvo8hKW7t50AuJAyHOEZE2j7aA7GmFMsLPViB07Alb6rgF9BZjPqm2ik/XR2bKU4Mc5ChnFh4wBy4n8qjGQO6PRJVrl2ABm5Nz6HChaztGkN1IQZCgk4BZV2XGBpi+9Yo3I6jEbm1FiQHq/11G3Q3jfG6g2g4LvfltBN9AiosFqw4S/2rTqDl9B8hRhlTPO5hvMvKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Naw7T5AiRqK9JuF0aMYQ2v7bJyZ7IEIGFPIxfWllZRA=;
 b=V/W4ENa5pVx2a3QVMFW++gGkEn9pw+gaTC7KfRXsr9CDxFH6CUXt4XFeNrqjZN6VxVCCY3wnRCnFdkNXMRS7i/Cjb/bHCN9WIlkMQt2r4f9mYDwgdOEYHYIAYLt9v3ndzQO8naGFmEMjuD0Fd3DvDzJFE2Tv7aAnfnrDzZy4/i0bj9UaF2oaqEqvF5BP4hAaAvhFhJvitE/tj5ogMAjyQaD9stIHgRa7f969m0a56bKVzmZAr0mMmaTJgNM6fVnRomd0eSn8BpjtaXMy+zSnMeNPTzg4ztr60DujH8ZOavdIWxt1Rs5rW2edUn+XrPsTqGhZy9EmjX4nPTktqRQKLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA0PR11MB7693.namprd11.prod.outlook.com (2603:10b6:208:401::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.23; Tue, 4 Feb
 2025 20:14:02 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8398.021; Tue, 4 Feb 2025
 20:14:01 +0000
Date: Tue, 4 Feb 2025 14:13:58 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>, =?utf-8?Q?Micha=C5=82?= Winiarski
 <michal.winiarski@intel.com>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH 3/3] drm/xe/client: Skip drm-total-cycles if unable to
 read timestamp
Message-ID: <dlawvvg26dolbcqdky3mkbqke4euaon4q2nvcjl4fit6jxshhb@vgzmhe6us5qt>
References: <20250204180522.2327214-1-marcin.bernatowicz@linux.intel.com>
 <20250204180522.2327214-4-marcin.bernatowicz@linux.intel.com>
 <15799e7d-1259-4a87-831b-1b6ceb8fee1a@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <15799e7d-1259-4a87-831b-1b6ceb8fee1a@intel.com>
X-ClientProxiedBy: MW4PR03CA0117.namprd03.prod.outlook.com
 (2603:10b6:303:b7::32) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA0PR11MB7693:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e70b512-f3ee-4dfc-6f9d-08dd455876fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Zjk0MUhDOGlKNzdmWXBvM24zV1ZXMGtyK1lmems2RTRJcDBOOGFjM3IweUIr?=
 =?utf-8?B?ZVhtL1V1c0tkbU5yU2VZcnlYQ2RYNkt6STVvWGhKZ2xyczErYU03T3dtNVJp?=
 =?utf-8?B?N0UrR0ZLcnErT2lrT0tZTm5RN2JzUUk3NEFyZFhUaUcvOUVvWnN1dnhLcFRP?=
 =?utf-8?B?dU8ybEx2UTAyWkJ2M1ptNUcwMEFKR0t1dnVFYjV5cTAzMmF1dU9yRlQwdkZr?=
 =?utf-8?B?SWdteHdWYVZkWE4ra09TbCtTcysyQmFsTjhoTE41a3VyaWRVQWhEMkZyNWhC?=
 =?utf-8?B?YnFqNTdvc3d1WE42U0JGNEhrLzQvT2tzZDFZZWUyNHo4WEx1cTNnNGJyckRk?=
 =?utf-8?B?NzZaakZZVytGMU5UMDFjTXhLQ05iYm9YVUdkZWRYZXNtM0I4VEpRSktzUGNi?=
 =?utf-8?B?UlExOUQ1Nk9NcUhYdmZZMjJhYk9wT085OStFcnlBWVVwc0o1YVBUREN0UXow?=
 =?utf-8?B?czBncGxFOGx4M2I5RTdLY0hZYjRTbkdLS0tXM1ZTUVFPR3NvM041K3Znd2FX?=
 =?utf-8?B?R0hvcjdSL1grY3o0eGk2RmZxeFpWcVU5NHp0elhoTzVadGh4MjZUd2ZvMmM2?=
 =?utf-8?B?RXdydndMSHhUVnRFU1R5SlNFL0grRURNaWRHSkRjTHFiNStuVlJyRWRWdmU5?=
 =?utf-8?B?TlYyZWxnWGRWSXZwYStwc2dhQldlT2ZaeGJkcWFWMEdYUnUrR0dFcHF0ckxI?=
 =?utf-8?B?em1tOWVhd1J6d2QrUHBkZ1cxT1dacVBOTkd0QkJCamV4ZCtRc3pyTHRvRDNX?=
 =?utf-8?B?dzV5eFRaNW9qNDJ4bjV6LzZyRXV1Mm1WUkZuOWQ5WnVBT0hlTUdySG8rQWw0?=
 =?utf-8?B?RUpoWVhSVlZkelRsdmdubndqWnQwSnJyczI2M1A1bC8xYlU1UUE4bWt4aVMw?=
 =?utf-8?B?TUxyK05CSndvT3R3Sncveng0MmhJT2VzY2xPUEc1U2tyK3VLc3VKd09jRGs1?=
 =?utf-8?B?OTZYUFhPL2NoTlJMYW9pTU5xT3NPdG9iVzFEbHJMOGZpOW91N0FuSUtrdk9P?=
 =?utf-8?B?dHVIc1pydW1IQUxsNkIwY3dYS2lDcFVkbkVOa2s1c3J6L09iYUJGb3lyUGJB?=
 =?utf-8?B?Y1BCeXBJYlJhbnVpWWNXRkVuSlhsaG9jNW56NzI4R2tja21LakRXU1lMSEFn?=
 =?utf-8?B?V1NJZ253TC83eXVxQkh2VzEzVXZIRlJDN0RsbjYyVGFHcFg4SlVibmZ6c3cw?=
 =?utf-8?B?VWxra0lSb2FEb0pTTHhVMkthNHgwMzRJQTVQQ2VTWjFlZDdMMklNNENpNWQx?=
 =?utf-8?B?eGRYMklOTnBHQmFWTWpnNGZFR01XdWNYZVlFSmo3V2NGbUV6RXg3TEU2VUdy?=
 =?utf-8?B?QVExRVhFdVBObHF3akdwK3RwcG1wMTMzdCtqTE9Mdm5nWTFkcUVhaTZsRDZY?=
 =?utf-8?B?Wkxxb21iNFdWc0V4ZlYvdWgyY0ROZEJXN1BHUmZ0R1BiRVRzVEpiMUR5ckRi?=
 =?utf-8?B?S0FsRHQ0UjF2QTUyUlBvQ0hkSHhZWHJxb3FwaDdmME5NZ2lkeGNnL3Vabiti?=
 =?utf-8?B?SmRFTTFlQzZZYldVZUljdE11bG5XQy9XcGJaelhLMlRJQ0hkUkZqY09hN0p4?=
 =?utf-8?B?WGs1ckd5aXE1bHYxQnpXSERLVms5R0tHYVR6VlFRMEU5SDY0NlRReVNndXNP?=
 =?utf-8?B?QlpKcTIrZnBLOCtzQ1VsR1IwUGltaTN1VE0wTHk3S3AzWkhVenlZRSt5YkVI?=
 =?utf-8?B?RmNnYVBLNkpxeG5kMGJtZkZ1dTQwelNvTDBHbVdYaHZsNDBkSDYrVEliTzZM?=
 =?utf-8?B?NU1NUEVGYWQ2a1d2cGtqbGd2QVFxL2NHT2lnM3dFR3VwdEk1RGN2VURYaWxt?=
 =?utf-8?B?REJUaVVYeURVTTZZazlqZm5wZVovL2ZVTnhueCtIeC9tRys1eWJpeEpKQXZD?=
 =?utf-8?Q?IZcyix0p7bp3m?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TFZ5ZFk3VzhHREd1WkxhSWtzZzE5MUpXVE9iR1E1emRkSDB4RXZsVDcwOWw3?=
 =?utf-8?B?azFmaHd5cFBMcEVxNnZIbGIrTEQwbDM3S2lsOUZ3djBzSHFpK21CRlhjSFVZ?=
 =?utf-8?B?UnZFVXZkRG1TMHorWitNR3U4NmVnNFVmU0RLNmVHQWNSeU1NWXdFNnRoTGRR?=
 =?utf-8?B?VGJFcDlPbDJTV2QxTSs4OXZ1Z05HYXQ1Zkc2R3lmdTk1eHh6VkRzL0lqMThR?=
 =?utf-8?B?K3didFg3V1BPanhxUVB1cnViZVMvMGdCRTVRWS92ZU9nUGZXVWVBY0lTTGk2?=
 =?utf-8?B?dGJ3ME92RnBFcGora2hpL2dMMWNrYWlwa1prYlFzV1hIRC8zU2h0VUU0YXgz?=
 =?utf-8?B?V3Y0eU0xR0MrMXZRZUZmTC9QelRRb3QyOWtEOUlZQ0VqaWpGOXRoVThCTjVK?=
 =?utf-8?B?VXVWWHNVVithODFSc3lydzZzTVRmdm4zcXFFMnpPdzYwSWIyL2pSTHRvbjBS?=
 =?utf-8?B?SGl2UnBabjV0SXBzaDJPc0p1OWlaejROUk1xR284VHFSWlQ1OGpaTFJyQXIx?=
 =?utf-8?B?S3psNUkwTU9pV1ZWMGpLOUhhRkN2TnptMkQ1bjhTR1VpNW1uRFcyby9JcE43?=
 =?utf-8?B?RllSRTE2aWhtdk5mb0JSR0hkRmRZbFZHVEVaTHp1R3J0dkF5ZUs5Q2VFQzR0?=
 =?utf-8?B?dGRXWHQzKytPTWJMS21RUmNHak52bVB0OEZ3T0V5OWRlNkFVNFNKR2pPTXFT?=
 =?utf-8?B?VSs3aHA3TUw1YVB1Q0JXYTRKMFVoVTJuWlVnT0l4aUNRd1g5RDJ0LysxMXZx?=
 =?utf-8?B?MjNQREZncGNlZEgxQ3M1UzloZndackI1N1gyNTVRRUpOdldRZTdYbzNBclZQ?=
 =?utf-8?B?YUs1cXVKTnllRHhtYnBnV0N0TzdJajJiUWJjQkM0SThoc0FlUHFtYUZnY3VN?=
 =?utf-8?B?TmRrUmExUGd3ZW1iNEpOZ1JjQTlPQlNVbzFWTy9vTVp1ZzM3WUMzcDdsL3do?=
 =?utf-8?B?ckZ0VHdCZ1p1UXBxVkFuUFdtbU1vaWlsN1k0THFzNFFGYjZ4ZUtsZlQ2ZGlW?=
 =?utf-8?B?Ujc5WVhNNVNxTVZGTGdzNG9zTVBhM3ozOTNxT0xKamo3N3dVNkVtbXQ5dVd4?=
 =?utf-8?B?UHBCdjNCM3AvYjdNWlhud0w5Wml1QmhMTHA0bnR4aXdTRVFzbU5QWGloeUtj?=
 =?utf-8?B?bmw2Y0oyMi9FdkZTUTByckxiNFN4WWZsUlJBWnRjdGZlTEVzdjV6MGN6S3B2?=
 =?utf-8?B?ZnpuL3BsblFFQ1Q2YjRzd08zc0UxWm1KV2o0Ujc2enNuR0xPbTRmc0RHTkRR?=
 =?utf-8?B?a3FnZlIvblJtY0pudzFJYWlTK0tRTHhJL05BTmZsTnlpd01QQlFjZG9TNzNh?=
 =?utf-8?B?ejhoSEVnRzBKZk1Ob0dWenJ5TFRpSGRsSml5V3pFb2JhcGZTY2V5NW8wUk5n?=
 =?utf-8?B?THlQTkE1TzJ2SmN2TDFHOU02anQxd2RaMjZPS1JiUG9pdFJyeTFXczRQeklE?=
 =?utf-8?B?QmNvckZRWE13L3lidDlKZFBwM3YvcGFUVDJrWjVBOUdDanc2V1NoZVc2RFpz?=
 =?utf-8?B?WTVMaHAvU2Jhb21aWGlzWEZSMlBuL1RsMDlxTmVpeXdLL1dJSmpVVy9XZTBO?=
 =?utf-8?B?TjIxUy9JeDZheUVNb2RPSmV3dTB4MTZvb0tnWlBIaFlBa0pMbXJJdUJmenBj?=
 =?utf-8?B?V1VZZm80NDNVaGhJNDZFWUJHci9GTllkamJLZDZjWnozT09YTDB2ZWVvUkZx?=
 =?utf-8?B?WXNtTHA3MWpraDlxL0dtcTV2QmJFYWQzMSt5UGdXcEo1OGN2RVIrVks4QVhs?=
 =?utf-8?B?VGtESmtqS0tyekFkZlZjVTQ1cmRVVUYvcU1tZUtSMzVwSm5LQ0I0VC9VRkVE?=
 =?utf-8?B?eFlBY3dPeFNKSkdKTncyYXBpQ1Q1d09xbkRwL1IycE4yMER4Sm5GalhEcGRD?=
 =?utf-8?B?MzVkQm90Ni8raTdWcnZvZlRSNWczbmNab1dIbTJRcWxBWldYdkZiWlRXTUN2?=
 =?utf-8?B?bTFWQ1RUM3dYVW1jUnpPWFQrSXhLQm12SmVvQVlMUUdCYi9QNzJtaXdndkt3?=
 =?utf-8?B?Mkx1dmlKUnliVkQ4ZkVyL21HN3VtTVBoeXVQRW5TeDU1MjlYV0FtTUNxdURU?=
 =?utf-8?B?N3ZUalNmdUtBdFEzUUptcU5WS2w2TkNQbEhhWEZaRlc3Wk4yNVBLUzNwYjA0?=
 =?utf-8?B?UDdoeERoS1NCbU1mRFM4ZlgveEJ6cDhDVldPRXhMNzJSb21GRXZCSS9ERU90?=
 =?utf-8?B?Unc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e70b512-f3ee-4dfc-6f9d-08dd455876fa
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 20:14:01.3689 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fN1+ILlGckof6LkXFO13svuRgGlfkLMe8V15OVn3WaOqGSNxvJ8eM5AIUOcZBbWy4jrQIazecp5Rh7/c3iXfoFGFDE1EmnX4Ld5iOHNjfcA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7693
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

On Tue, Feb 04, 2025 at 07:56:03PM +0100, Michal Wajdeczko wrote:
>
>
>On 04.02.2025 19:05, Marcin Bernatowicz wrote:
>> Ensure show_run_ticks() only prints drm-total-cycles when timestamp
>> retrieval succeeds.
>>
>> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Michał Winiarski <michal.winiarski@intel.com>
>> Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_drm_client.c | 9 ++++++---
>>  1 file changed, 6 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
>> index 63f30b6df70b..e5c4f342380e 100644
>> --- a/drivers/gpu/drm/xe/xe_drm_client.c
>> +++ b/drivers/gpu/drm/xe/xe_drm_client.c
>> @@ -323,6 +323,7 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
>>  	struct xe_exec_queue *q;
>>  	u64 gpu_timestamp;
>>  	unsigned int fw_ref;
>> +	int err;
>>
>>  	/*
>>  	 * Wait for any exec queue going away: their cycles will get updated on
>> @@ -350,7 +351,7 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
>>  	}
>>  	mutex_unlock(&xef->exec_queue.lock);
>>
>> -	gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
>> +	err = xe_hw_engine_read_timestamp(hwe, &gpu_timestamp);
>
>can't we just check for !IS_SRIOV_VF here?
>
>>
>>  	xe_force_wake_put(gt_to_fw(hwe->gt), fw_ref);
>>  	xe_pm_runtime_put(xe);
>> @@ -371,8 +372,10 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
>>  		class_name = xe_hw_engine_class_to_str(class);
>>  		drm_printf(p, "drm-cycles-%s:\t%llu\n",
>>  			   class_name, xef->run_ticks[class]);
>> -		drm_printf(p, "drm-total-cycles-%s:\t%llu\n",
>> -			   class_name, gpu_timestamp);
>> +
>> +		if (!err)
>> +			drm_printf(p, "drm-total-cycles-%s:\t%llu\n",
>
>are we sure we don't break any tools that might look for this?

It may break if the tool is expecting drm-total-cycles-* to exist when it
reads a drm-cycles-*. Also there isn't much value afaik from showing just
the total cycles. IMO we could just skip the entire function
on IS_SRIOV_VF().

Lucas De Marchi

>
>> +				   class_name, gpu_timestamp);
>>
>>  		if (capacity[class] > 1)
>>  			drm_printf(p, "drm-engine-capacity-%s:\t%lu\n",
>
