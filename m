Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C90F5D7789E
	for <intel-xe@archiver.kernel.org>; Fri, 23 Jan 2026 17:58:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E07010EB8E;
	Fri, 23 Jan 2026 17:58:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ikelZZr0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA57110EB8F
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Jan 2026 17:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769191129; x=1800727129;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+2F7NJiEcvUclRLdSDDdpUDOpDsX4akHpkwgvwzEKpQ=;
 b=ikelZZr07muojzbfUdkwRQ2sM0664SroSA66gCoMOvwi1BeG/0pnYXZU
 VYvvA7c2RSXL2jI1Ysw/rbrao257EMJFjpyu6w8pIv5UIZY3aXx6zbMGZ
 jhEZLAgEh5fHYgFr2FWlXIAmIPNC0UqNqjcjR8JXaJgjwukpqDknS2yyX
 TFsE/CF4DjiuwheJxX0AzZW0OmDe4kLDvgA6bAbFtwB32jp48kXDSvo+E
 TMhM4ShXP38p8eEjvRLHURYEwIUeudpGZ8ZdAsNnE0NNPXDmCJjodqFbh
 caj4brJLSUy88LakeXus3IWzVrz4CVl7LK+UZjOg126yIAZDyFYxMgn7Z A==;
X-CSE-ConnectionGUID: +W35KP4bTsyiiKcA9uHlxw==
X-CSE-MsgGUID: i25OnLhmRZyRsvGAueTy+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="80755580"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="80755580"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 09:58:48 -0800
X-CSE-ConnectionGUID: RlJ9KQhYRVqUPywbNFJoBw==
X-CSE-MsgGUID: jGsqjhYXRZaWwA2AV4HRwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="207504398"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 09:58:48 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 23 Jan 2026 09:58:47 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 23 Jan 2026 09:58:47 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.29) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 23 Jan 2026 09:58:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UNv7UJp6Xfhf/BXU/QEyIrU55fmJayM26jr3lIi0FMhxOlDEHJKG/2mam4P9a2EXL5idx7cdm2mzLoU8YLNcQPK2fbGxz0LUVAJSTV6S5c7JhxjI1YqbDlbqcuNm2HdB58a8C5qD7L+029AcAQyK+cgPWUXNzNXj7fz2fcwwXjbcES8wFwsCQZscvXYqgF8DYOsEFQ3NoSWCrj7qYCdGEe/IRgU3W+CyA7oRwKH0v/Va4mW+19YMn3gUSpez9+7l5rxaB0Gi9XHkDDW9HQN/H9x0XE0oCWn7wWdZRfVfDBjWNNqBRzW0VhI5EP6k1edNeB2PK2qrnj4+bxqnR74HfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mQ7J4XeoYcP37ws7sptXZq3Uz8l27FGkk06mqcqbuQQ=;
 b=qgPHo2Y0w1ct+WnYhCqaKtCyJ0zI2ZL81UPaVRdfZMPtLnEoIQIJblXvGvIcsur0bHyU9k2Pr5rmCmpg3dMrZu8JNy/vScHdeE5AhDCu+EbNXZGZuGe85ibHvtp+BZMhi42Fe9QC35ya0fM7UZ+XjTAZilDOp4dLmQ5sJeR35QwB8R7ROryf3Gd+Bgr/nna5VUICkcFjNac+8JQvFofi7aul9PsX2TlvUt0iJSc+x1Pg3l2kzqSqfBvgDzYfNk9CmF5UdVB2hg9Zyby+X4k75Q4qanp1mo7LuZbMS7BFmHOZzGx9k3X+sNRUeiX/+CJ1SbSZx75keu6/FSUAwp46Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by SA2PR11MB5210.namprd11.prod.outlook.com (2603:10b6:806:fa::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.9; Fri, 23 Jan
 2026 17:58:45 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 17:58:45 +0000
Message-ID: <f8b01eb4-f582-4f78-be33-11e64bdd47c7@intel.com>
Date: Fri, 23 Jan 2026 09:58:44 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/xe/guc: Add Wa_14025883347 for GuC DMA failure
 on reset
To: "Anirban, Sk" <sk.anirban@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <raag.jadav@intel.com>,
 <soham.purkait@intel.com>, <mallesh.koujalagi@intel.com>,
 <vinay.belgaumkar@intel.com>, <nishanth.p.reddy@intel.com>,
 <rodrigo.vivi@intel.com>, <matthew.d.roper@intel.com>
References: <20260116103451.304716-4-sk.anirban@intel.com>
 <20260116103451.304716-6-sk.anirban@intel.com>
 <5d9b546a-421d-4006-98ea-a2e930f935fe@intel.com>
 <73520ae2-967e-453a-a7ec-dfa0b2d6a080@intel.com>
 <800a6f03-62ea-41c7-ae7b-d25606ccb708@intel.com>
 <847f9254-6712-4fc0-8bac-48c91aa2d0a7@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <847f9254-6712-4fc0-8bac-48c91aa2d0a7@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR07CA0077.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::18) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|SA2PR11MB5210:EE_
X-MS-Office365-Filtering-Correlation-Id: 89dc25ce-c381-4e47-ec6c-08de5aa90d67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UzhJdTdTVi9qUk42VDM0aGk5UG5vYjg5SFlHMm1FSFpyS0RMNytHZCtvUDg5?=
 =?utf-8?B?QXU1SGc0MHhuMTgxa1dNc1IzdnBWZDhJNzBwRG54WmpSdFZTZkFZK0tqbU1r?=
 =?utf-8?B?am40SDltNXlYdlovREhjSElrcy9XYzFRVnlycC9icW92QlJXRVVJOUF6M255?=
 =?utf-8?B?QkxPdHgrc2FyVS9PZzFwL1dSd0tZQXVOTkxvNmxJOHhCcHJqSjNEM0h6WWVv?=
 =?utf-8?B?K1JwZDg5WlE5cStxcFBLUDVOUXBzay9HVHZSYmgzSGF5Q0dpcW54cUhjczRY?=
 =?utf-8?B?aHQybTJKbE05L251V2lra1l1MW9EckcxcGNISThGN2VXOXBQTHRHdjQ5ZCtG?=
 =?utf-8?B?WTZNUHlPSGNoVEo2UmdIYkZXeUE0bm5xTEp6OU55ZkYxUXNwejRWZ3lUYm51?=
 =?utf-8?B?eGlZOStjMU9ta3ZWMkxuZzNOM0ZweiszajA3MGlyR3hRbjBhVER1RVNQMUdz?=
 =?utf-8?B?SUhZTElqWlJqdXExZTNYdUw0V0E2VFdIRWJEelk0cGJTTUpMNTVSR1RPbm1N?=
 =?utf-8?B?ZTNIeHMwcWJpMkZnTFJTU3EyaEd3bFdsSzNHTDNNQXdoYWJlYjF2UEpJQmV4?=
 =?utf-8?B?ZTAyVnUwY0wzRWpnQnYrUnkrTStXbGc3RVhqaTFKUFZ3d3ErYlJpNHdvVDNM?=
 =?utf-8?B?MzRDa1FmWWxHVXpNd3M5eExhbERqZGw2Z3paWkNzaVBBU1FSWmkyS3pHYmZL?=
 =?utf-8?B?WGkxczQwdlhwVVBLbFFodWlTMFp1UHZnV0xVaU4vOE42ckVaSFV2a2FacTRt?=
 =?utf-8?B?cUZJMHdQUnlmMXhEUmJVckE3Mm9vT2RqRVRRMkJBQVRpN0YvNTBHRGMzcXNk?=
 =?utf-8?B?QW9TK2xROE9ZTWU4dFVqdGhjZld2U2ZmeDdsM0tCck0vdy93aVZNTFNHZnZr?=
 =?utf-8?B?c0FkMjVDbFkvbTdDMFpEbWlNS1V2T2wrUG03K0VxYUxtcHpqc1JQTXJzekNO?=
 =?utf-8?B?eXR1Q3lhVEVGRTgvRk05Ym1Gb2VSTGk2bWRiYkJZR3VFbHZEZjZuMzJlTTNt?=
 =?utf-8?B?N1JHUlNlL1hVQlE4SzVTUFZQWHZ6M2dmWUlxRktWTkdtZDA3dzdoZ045aHdZ?=
 =?utf-8?B?eVpTY0NqWHVRZnZuMmlsSTZJS1k2K0VsVEEwdlArWFhLSVA2OG9sMWRSRHZp?=
 =?utf-8?B?RWRJMnZEWG9mdGU1Z3hxTVdPeDYrUXhSQ0NZc0gzWTlWUVBmMktqdHpmY1A0?=
 =?utf-8?B?cW1RZ3Vublc1bjljSmxtdzlORDhFN3YzYTZCbHBpZzZoVy9DQlN2cnZZTlpk?=
 =?utf-8?B?RkZvK3NpWWR5MjlrYkNQbHFqQjdSL0IxODFkeG12NjkrM0laV1FoUjFGc21l?=
 =?utf-8?B?ampNck9nM0NvcUxBOVRZdUJEaDk4R0pTME9TVjZjYnAyQkRQNmlNYmVLUnNR?=
 =?utf-8?B?ZVY1UG5qZ1RNUDRjU0NWTUxTWHFvbTBIVTlkUlAzMkhucXh0QVFSaC95VGVC?=
 =?utf-8?B?b3NJOWEyK3BtNWd3RGNNT0lTSkEweU03TnpvZTlyb21VSFJVREh2ZVhqUlVT?=
 =?utf-8?B?cWNhcnVkVi9MK092MnRyNldGODBOQ1crZkpaRVNOcElKakhRU0pTTFZNcDlB?=
 =?utf-8?B?ai8vM1l1MFg5d1RwNkNlbzMvQmU1Y0xkSzU2bHpMUmFRYm45cFlBa3M1VCs0?=
 =?utf-8?B?S2YvWU81OVo3RU9qUFltclBITCtqRllETTNZZ3prOGh1WlhHMXJaNEp6b0F0?=
 =?utf-8?B?b2psT0dyUVJqRW5FZzZaYmJCTHlMV0N6Y20rMmJJUTNOZnNWYk5oVmJ0QXN2?=
 =?utf-8?B?cUdkTDlmWTlKVy9VZHhTc1RlNnZ5UW5qSjBXV3pkQW54MjdXWktkU3UydEpK?=
 =?utf-8?B?bHBHY2JKNFE3Zkw3UHdjT1ZudzB1QkVZL3R5REI5dWRLMWprZnVDejdxUVFE?=
 =?utf-8?B?STNvc0dRQ2dvUFd2TnJGMkNPTVNQNVNjVGhjdERCRFRYaU02dmZIeDFUTlRo?=
 =?utf-8?B?UzFXSjFJaWk3UCtGOTN1c2M4Vzl0OGZpTkxYNWg4VTd5L2VWR1puY2paaWtX?=
 =?utf-8?B?QlZSRDVhYXdyTWdrZSthVnVTREQ2YnBMQUR0VHlCbEM4WWR6clR3cW1LNjdR?=
 =?utf-8?B?N0tydkdHbytiRHdqNlI3MXR2enUxNHVLZXU2VGlmdVZiMVNNeWlWMmU4UGNT?=
 =?utf-8?Q?8c6w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cUh3OUlPbHhSSytLSjgvdXBadE5TcG1EZHlpZUFVcXVOcmlHZkErTWRUSFBC?=
 =?utf-8?B?bXgyZmI4YkdtNk1mQ2tuWmxtMUhJU3prUVV4OFpBQW80dDhHWnVTcWVOVDhG?=
 =?utf-8?B?VVA0N3NDeS9Wem1wUWJWRnIxd2JmUVY0V3B5R0JrMU5vV0xBRjduSlV3UzVM?=
 =?utf-8?B?a0ZLZTNuNU5hL0VianYyY1owTW5kVjRMOGxvSTAxL21MaXdNSFpFQkFPVzdq?=
 =?utf-8?B?Vk1Bd2V1Z2tLU1JlS1FrcEpmWnJTMG52NkJFNm13OHM0SXkyOUkxd3FnWG1S?=
 =?utf-8?B?OW5EeDZHSytVaU96V0lJd1pDWnJMVThYVTJEQmM3c0wxbTFUcE9aeUpKM2xx?=
 =?utf-8?B?TVZycEZiZkppODFLcFhiWG4zZGdqL3gzVG9ac2s2ekVwYSt3ZXdyWXJnNEl4?=
 =?utf-8?B?SEJtQ3JEUndCU3puME1vckN1bTkxeldNdDJqbHNLZWtNWjh0cGg5SFBLZ0ls?=
 =?utf-8?B?bmg0SFJPQTVKQUtyZ0g2NnJjR1lsSDhPM1RFdWRtTUhScHBXZFh1S3RUQmFC?=
 =?utf-8?B?NTNPQ29IR1dldnNtdk95VTYvYTBETFlIVGdIQlcyU1VYTTAzUWtxekRhM1RU?=
 =?utf-8?B?RG8rcnErQUIvTFBVNTJ1QWJEWkJFakdYQmltcnZPY0tqMHJheVpNbDJmbzMy?=
 =?utf-8?B?SjVkVjE5eFoyalZNWXVRNER2eUNidHR5K3FDS244S2pTZEErZi9nTEpSOW42?=
 =?utf-8?B?dCtldytCQmJpRmVMVkYrRTBlWEMzR2tlaEVISEpJempXRG5HWG0yZXNBZmls?=
 =?utf-8?B?a1Q3M1c4Zll4anhBKy9JT2VsQS84Qm9CQzJMNmt2aUlkQ21YTlpYUnIvS0FD?=
 =?utf-8?B?VkJHK2ZtMUxvVXAya1ZhWFFXbjdrYUN5SGpvQUhjL1BKL0ovaGZlOHhRNHZZ?=
 =?utf-8?B?QmY4dWJZci9zVHFXTytRRVYxcUlUNldQNVoxWHpITmF1dlZFMUE3Y2xSNGFx?=
 =?utf-8?B?MDRjVFVuSTdOTEl0emFRN05seHQvbFl1c2d6d3BualltejdieXZjZjlBNTVk?=
 =?utf-8?B?Y01xcHNQbm80ZDFiOVRrbXpHNkgzcTVGTWRkSm92WEMxcEVkT1Rzemc5a2s2?=
 =?utf-8?B?WWZFTjJwa05HZ3FoWm1FNWtvY0NrM2wveTNtdkVLemY5T3NObkJXdXpEeHY2?=
 =?utf-8?B?VWdSUnNwYThuYk52c05CcGloSGMzcG9nTjFubTZPTUVRVnErbHlqLzlZTVRO?=
 =?utf-8?B?a1pVeU1ibXVzWFo4MytOS2srbnMyQjlxc0NicU5HZnNlbnN2ZVlUS3ptaFpr?=
 =?utf-8?B?QStLTnZCcEpZNmR3ekNIT3VLaUJ3UFU3NFBhWUZ1UTBzbVNLNm5SejhwdHhj?=
 =?utf-8?B?TkowZHdOVld1MkJkSFkyZWdXUXJ1SjFLcjN1eXUreDNSZk1mQWlqSE1FRXdF?=
 =?utf-8?B?QUMxQUxNd05Tc3VPT3hHMWltY0VtLzVLYUFiazgrcWxvT25FSDBxcnpaWWti?=
 =?utf-8?B?bHVEUTZWYWc0NlhReE5nUmpFa3NwTXRCbjJZdTVtWGpRTUsxRHVNS28rQXMz?=
 =?utf-8?B?VDdPMzN6L2I1cHZ0N2tyZHNOQTNwUm1tNUxyOGI2K2ZYVTlnNTNybHR1MGxR?=
 =?utf-8?B?MjBZRmRPeVZHNXB6d0FBbWZaUVY4R3ZEL05IQnQxSmdjY3Y2T3RHQW43NzhX?=
 =?utf-8?B?RWJlTUdGVU5qQVBnd2wzWHlZZ3dqcHlBSTh5QlRjem5DekQ5SXlYKzlaTTRU?=
 =?utf-8?B?TVBnSkNheHAwODBqVUFyTFpsdmVzY1Q2S0FhdnVFd3l0WGErOVl0dmRlQVRs?=
 =?utf-8?B?VjRVQnNmYkF4SzJYSjJRNVhPTkVPTHhyM2c0Q2xjd241Qy9CWnU4SUlrTGEr?=
 =?utf-8?B?WVlrZWNKcWFBdTgydzJxQmRtNEs4MHJyUG5FYzYxQ0FJV01tYURjSGd4YVV6?=
 =?utf-8?B?TWlPdGhtNjRMY1R5dUtlY2tRYUZZUEJVazF2Z2t2OW03T1cxKzdETVpvRUhK?=
 =?utf-8?B?eGRwVzlhckFJQnorRVlKYlBxS0NKaWJCNUZoenRoQm9maHJQRXBTWDJuWmRF?=
 =?utf-8?B?TUJSWEJxY3RIdThJcXBpWHpwU2toRlFoUFRnM0p2U1JWRlRiOVBZMG1LYXZ3?=
 =?utf-8?B?TmN4QSthZDBRMFdQWGVPZUM1ZU9GSHErVng3Wm00ck55aktOOVE1STNUUVZp?=
 =?utf-8?B?ZlRzSHBLbFJpK09WanlUSzNxazRvalFVbVFYNnlNV3RMLy8xaENLS3h6MEgz?=
 =?utf-8?B?TDVaa2I0NWw1a2dIaDBCWjdnc3pBbEsyeXNsREVCc3NXQ0N4RXRHL21GdmZv?=
 =?utf-8?B?WXRHeVBmdS9Ic0RJZE9oOXlpMWVBSGllSUYzR0hFNEhwcE11MStaLzZuenpz?=
 =?utf-8?B?Tzk3OERvZEszZlp4SVNiWG1SUVRLanNUQ1NRdTM2MVBZeFdoS3o4c3RjOTlp?=
 =?utf-8?Q?W//BNUow+Cdm6LLw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 89dc25ce-c381-4e47-ec6c-08de5aa90d67
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 17:58:45.5607 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rPa04f1GKjjW6iczI9ImF8xHWhkPy/mcFD3OHbulQIGBe/vwN+nmEWQiSf6yHrFHWNK4BV8nZPuVyLpwhh/VKLCZtJZuNuAwDedtVNX9L/w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5210
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



On 1/23/2026 9:54 AM, Anirban, Sk wrote:
> Hi,
>
> On 23-01-2026 10:58 pm, Daniele Ceraolo Spurio wrote:
>>
>>
>> On 1/23/2026 9:12 AM, Anirban, Sk wrote:
>>> Hi,
>>>
>>> On 23-01-2026 03:12 am, Daniele Ceraolo Spurio wrote:
>>>>
>>>>
>>>> On 1/16/2026 2:34 AM, Sk Anirban wrote:
>>>>> Prevent GuC firmware DMA failures during GuC-only reset by disabling
>>>>> idle flow and verifying SRAM handling completion. Without this, reset
>>>>> can be issued while SRAM handler is copying WOPCM to SRAM,
>>>>> causing GuC HW to get stuck.
>>>>>
>>>>> v2: Modify error message (Badal)
>>>>>      Rename reg bit name (Daniele)
>>>>>      Update WA skip condition (Daniele)
>>>>>      Update SRAM handling logic (Daniele)
>>>>>
>>>>> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
>>>>> ---
>>>>>   drivers/gpu/drm/xe/regs/xe_guc_regs.h |  8 +++++++
>>>>>   drivers/gpu/drm/xe/xe_guc.c           | 30 
>>>>> +++++++++++++++++++++++++++
>>>>>   drivers/gpu/drm/xe/xe_wa_oob.rules    |  9 ++++++++
>>>>>   3 files changed, 47 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h 
>>>>> b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>>>>> index 87984713dd12..c9cb02f32f5a 100644
>>>>> --- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>>>>> +++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>>>>> @@ -40,6 +40,9 @@
>>>>>   #define   GS_BOOTROM_JUMP_PASSED REG_FIELD_PREP(GS_BOOTROM_MASK, 
>>>>> 0x76)
>>>>>   #define   GS_MIA_IN_RESET            REG_BIT(0)
>>>>>   +#define GUC_HASH_BOOT_CHECK            XE_REG(0xc010)
>>>>> +#define   GUC_BOOT_UKERNEL_VALID        REG_BIT(31)
>>>>> +
>>>>>   #define GUC_HEADER_INFO                XE_REG(0xc014)
>>>>>     #define GUC_WOPCM_SIZE                XE_REG(0xc050)
>>>>> @@ -83,7 +86,12 @@
>>>>>   #define   GUC_WOPCM_OFFSET_MASK REG_GENMASK(31, 
>>>>> GUC_WOPCM_OFFSET_SHIFT)
>>>>>   #define   HUC_LOADING_AGENT_GUC            REG_BIT(1)
>>>>>   #define   GUC_WOPCM_OFFSET_VALID        REG_BIT(0)
>>>>> +
>>>>> +#define GUC_SRAM_STATUS                XE_REG(0xc398)
>>>>> +#define   GUC_SRAM_HANDLING_MASK        REG_GENMASK(8, 7)
>>>>> +
>>>>>   #define GUC_MAX_IDLE_COUNT            XE_REG(0xc3e4)
>>>>> +#define   GUC_IDLE_FLOW_DISABLE            REG_BIT(31)
>>>>>   #define GUC_PMTIMESTAMP_LO            XE_REG(0xc3e8)
>>>>>   #define GUC_PMTIMESTAMP_HI            XE_REG(0xc3ec)
>>>>>   diff --git a/drivers/gpu/drm/xe/xe_guc.c 
>>>>> b/drivers/gpu/drm/xe/xe_guc.c
>>>>> index 44360437beeb..42658a409556 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_guc.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>>>>> @@ -900,6 +900,33 @@ int xe_guc_post_load_init(struct xe_guc *guc)
>>>>>       return xe_guc_submit_enable(guc);
>>>>>   }
>>>>>   +/*
>>>>> + * Wa_14025883347: Prevent GuC firmware DMA failures during 
>>>>> GuC-only reset by ensuring
>>>>> + * SRAM save/restore operations are complete before reset.
>>>>> + */
>>>>> +static void guc_prevent_fw_dma_failure_on_reset(struct xe_guc *guc)
>>>>> +{
>>>>> +    struct xe_gt *gt = guc_to_gt(guc);
>>>>> +    u32 boot_hash_chk, guc_status, sram_status;
>>>>> +    int ret;
>>>>> +
>>>>> +    guc_status = xe_mmio_read32(&gt->mmio, GUC_STATUS);
>>>>> +    if (guc_status & GS_MIA_IN_RESET)
>>>>> +        return;
>>>>> +
>>>>> +    boot_hash_chk = xe_mmio_read32(&gt->mmio, GUC_HASH_BOOT_CHECK);
>>>>> +    if (!(boot_hash_chk & GUC_BOOT_UKERNEL_VALID))
>>>>> +        return;
>>>>> +
>>>>> +    xe_mmio_rmw32(&gt->mmio, GUC_MAX_IDLE_COUNT, 0, 
>>>>> GUC_IDLE_FLOW_DISABLE);
>>>>> +
>>>>
>>>> The WA says that we also need to wait for the status to be "ready" 
>>>> after setting GUC_IDLE_FLOW_DISABLE.
>>>>
>>>> Daniele
>>>>
>>> As discussed, a GuC reset can occur without firmware interaction, 
>>> and during RC6 exit the GuC load status may transition, meaning it 
>>> will not always be INTEL_GUC_LOAD_STATUS_READY.
>>>
>>> So we’re checking GS_MIA_IN_RESET instead. I just want to confirm 
>>> that this is enough to ensure FW is present before applying the WA.
>>
>> The GS_MIA_IN_RESET check + boot_hash_chk are enough to determine if 
>> the FW is present. However, waiting for the ready state is not about 
>> confirming if it is present, it is about waiting for the FW 
>> initialization to complete after we've confirmed that it is indeed 
>> present. Basically the WA is saying that we can't do a GuC reset 
>> while GuC init is still in progress.
>>
>> Daniele
>
> Understood. In that scenario, a timeout check on GUC_STATUS[15:8] = 
> 0xF0 should be adequate to verify that the status is ready. I will add 
> the code block for this.

Note that the GuC init can take a while if we're throttling due to 
excessive heat, so use a big timeout (100ms should do).

Daniele

>
> Thanks,
>
> Anirban
>
>>
>>>
>>> Thanks,
>>>
>>> Anirban
>>>
>>>>> +    ret = xe_mmio_wait32(&gt->mmio, GUC_SRAM_STATUS, 
>>>>> GUC_SRAM_HANDLING_MASK,
>>>>> +                 0, 5000, &sram_status, false);
>>>>> +    if (ret)
>>>>> +        xe_gt_warn(gt, "SRAM handling not complete 
>>>>> (GUC_SRAM_STATUS: 0x%x)\n",
>>>>> +               sram_status);
>>>>> +}
>>>>> +
>>>>>   int xe_guc_reset(struct xe_guc *guc)
>>>>>   {
>>>>>       struct xe_gt *gt = guc_to_gt(guc);
>>>>> @@ -909,6 +936,9 @@ int xe_guc_reset(struct xe_guc *guc)
>>>>>         xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
>>>>>   +    if (XE_GT_WA(gt, 14025883347))
>>>>> +        guc_prevent_fw_dma_failure_on_reset(guc);
>>>>> +
>>>>>       if (IS_SRIOV_VF(gt_to_xe(gt)))
>>>>>           return xe_gt_sriov_vf_bootstrap(gt);
>>>>>   diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules 
>>>>> b/drivers/gpu/drm/xe/xe_wa_oob.rules
>>>>> index 5cd7fa6d2a5c..ff2efc7a68cc 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
>>>>> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
>>>>> @@ -73,3 +73,12 @@
>>>>>   15015404425_disable    PLATFORM(PANTHERLAKE), MEDIA_STEP(B0, 
>>>>> FOREVER)
>>>>>   16026007364    MEDIA_VERSION(3000)
>>>>>   14020316580    MEDIA_VERSION(1301)
>>>>> +
>>>>> +14025883347    MEDIA_VERSION(1301)
>>>>> +        MEDIA_VERSION(2000)
>>>>> +        MEDIA_VERSION(3000)
>>>>> +        MEDIA_VERSION(3002)
>>>>> +        MEDIA_VERSION(3500)
>>>>> +        MEDIA_VERSION(3503)
>>>>> +        GRAPHICS_VERSION_RANGE(3000, 3001)
>>>>> +        GRAPHICS_VERSION_RANGE(3003, 3005)
>>>>
>>

