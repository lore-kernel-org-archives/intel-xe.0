Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FE69C021A0
	for <intel-xe@archiver.kernel.org>; Fri,  7 Feb 2025 22:48:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5964510E32A;
	Fri,  7 Feb 2025 22:48:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KUk+L7Uw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57E0310E32A
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Feb 2025 22:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738968493; x=1770504493;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=S+NMNOxQaR4PeWEHywOkK+Notc/Ixm6XDnnlesN/xSI=;
 b=KUk+L7Uw5qdSiZt4cQWLGMhqc8T+3q2ET65bU0WcEwpw1lhjvD9693vE
 HftlL8R7ci752aSoQd7c/2N6RtVCK0ngxtJCmX33cg8JlHcLkI/r3a3n0
 evGAiCnJmnkgldCJWAqnTe644qrl8grDpcsB8CNnTlKKEWikB+beQL4pf
 1VZyeOwhcPRaJIIEnxNQuG+BafgydvmFA7b5owjv18pDs6qPlyWwt9TB/
 Dka10GJPcYh/fTGjiU462Uzhmo+BAVgFM9FyPejVo7A3JBYrapuGvQwgu
 UDZYOBBoOy7YNI/qNcY2q6+IZOX5JJiQ+GqVlrFINi1uFLk8TkIez+kT/ w==;
X-CSE-ConnectionGUID: kSplBwZ9Tn+tyODfeI0eLA==
X-CSE-MsgGUID: 7oc0yG+PT8m0k0b/fhQgzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="50260905"
X-IronPort-AV: E=Sophos;i="6.13,268,1732608000"; d="scan'208";a="50260905"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 14:48:12 -0800
X-CSE-ConnectionGUID: fa/k7Zs8RgCqBD43iqtoww==
X-CSE-MsgGUID: ICiyhIGnSqKy6xy6Cq3x1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,268,1732608000"; d="scan'208";a="111592852"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Feb 2025 14:48:11 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 7 Feb 2025 14:48:11 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 7 Feb 2025 14:48:11 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 7 Feb 2025 14:48:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iKoKkXl3Wz9ucQFhUOJqcxbYCeVMk/GdaLeLHf12+Y3m2B3vuDfJwgm2wb8Iz39dPPK+5n4cc/VhMQRinF4LLnsdcnnsS6cQnP4UwCV2VrWZVFqyLst1J3r/ou/DVGLFD5F6HLRKxq895jI0Vy+wsB9J//sbTJ0sHCXWaGu1pJjO5lh3p5tzSQZGMqDheMT2d9OkvzRKF5PBnjBeSH7RpBJO64cd5JkADdBd169OsZZziizhTYseZOdCELgwN6f6zCcuRc196VN18XwTO4PYZ3apXkkcJQKWdtrOmnyTsPYPKB+KstbH6tCI7/lt/fmV5/mNxdePba9NDKytrtbllA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FqsCN9PAGA6ciVb8OrBYLZ99XHE/J57mgZjKEe2Mkyk=;
 b=gGi/1oyMA99vSwnE5htZQf2wz/WRATJiagViZz7yKeLuk3Li6G13mWZxDjDSlrLGAKaqWUnYHYMkCxso1NVxyKlpKvCQ1QtK+H+y+LpOwiK2m74XFczeiDeR69AGRBvUqS2TfdzFL/Y/fTsW/n2s1jsfDAZL/DTR/VxvagqUCHT91kbmf8ZeQIf7P3MGr9Bl7yyaf42w1COPVvHXxfOqvwfMeEPvuOAq99UgP4h55g03Z7p1OlUKLwyGXy+10WOuVSdtUqpnL1F9udQ8CRCaoNAFmdW5negujGtGHLhXpqhdyyjdug0PYKh/mdrgBsuIH5dtVNJoItGeiJOTd691bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by IA1PR11MB7917.namprd11.prod.outlook.com (2603:10b6:208:3fe::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Fri, 7 Feb
 2025 22:47:55 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8422.011; Fri, 7 Feb 2025
 22:47:55 +0000
Date: Fri, 7 Feb 2025 14:47:52 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <vinay.belgaumkar@intel.com>,
 <soham.purkait@intel.com>
Subject: Re: [PATCH v5 4/8] drm/xe/xe_pmu: Add PMU support for engine activity
Message-ID: <Z6aNmB4G2MKtwDtg@orsosgc001>
References: <20250206104358.3436519-1-riana.tauro@intel.com>
 <20250206104358.3436519-5-riana.tauro@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250206104358.3436519-5-riana.tauro@intel.com>
X-ClientProxiedBy: MW4PR04CA0059.namprd04.prod.outlook.com
 (2603:10b6:303:6a::34) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|IA1PR11MB7917:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d985bcc-3c55-48e5-5d31-08dd47c975c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M1YvL3JsS005QW9xNGhhYXZGWWJZR1pHcGFoVng0L2tIazJQMnJST0ZFdUFD?=
 =?utf-8?B?SkpVdXU1ZkFreFlEeDUreUlqcnRqdUU1WTBmTTNiNGpKWHRNWUVkLy9aSlY2?=
 =?utf-8?B?SzE1OWxBVUM5Vm5PblNwK1FPU0ZzN3hYSzhhYW1GeVF3ZWEwZE9WNXVKUnhD?=
 =?utf-8?B?bFZQYUVRZ0k0LzltSDVyWjl2YkVaNVp1Y1ZaMTE5bFFaMFpVYkJ2SDU0ZVZ2?=
 =?utf-8?B?alVNWnVlMmY2NzVjM0dhbTh3aWQzdHBnbmZtZHBSN2x2cjZxSThOS1ppaDUw?=
 =?utf-8?B?MzVlaEF2TEl5eS9zcWEyQjlEbWN0bHFEbGZVMit0VnAxaEUxS2hKK2Fwa2Jt?=
 =?utf-8?B?cGpBTklFWHhLZ3RQVVZxMEV5YytzUFBKSzVJN3Q1UjFtOUk4U3k0REtneWd1?=
 =?utf-8?B?TGM0cEdDU29DL3hjRUFCTk16Z09qVTlYWk9RWHlnQkVwTWVKNmp5ZHNsUzZK?=
 =?utf-8?B?YXBJSk93b0hkbjlOT3FWNFVVV1Z6blhYZTNWWU01V2xOUHlvbDdIWFkxY0Zh?=
 =?utf-8?B?ek5Ha0lZRGg0czNkY3NQc25FWGZ5amdNMElqeVdLM1c2dXVoUTk0UktncnRY?=
 =?utf-8?B?cDJFdyt6Sk5oZ3k1UTNuQkZJdlQyMUdSZk5DaTV0cTM5ZmQ0Yk85dVhKY0Fw?=
 =?utf-8?B?TklVS2pJeCtnVU9oNEVjSlRMei9zM3lzK1hLcmhCT3lsVmY2WWM4VE5tbUlR?=
 =?utf-8?B?NkNmaFJIdHNKU05VOEJVUFVOeUx4Q0xaVkU4SHduTVFWV2R2ZzhVYURmTGw4?=
 =?utf-8?B?OVpWVDZUTElMK0tJd280VzUzY1U5VG0xUmdWbnNYZEFHWmdPRGNhRGk2a1No?=
 =?utf-8?B?bTZ1aUQ0YVdNQlE3am9yaVlZbG9HNkQyYnFiQmZTcUswdmc5V3lxZW9xcFQ1?=
 =?utf-8?B?aXNZaVM4a1E1NlNqR2FITllYTis4L2I2RmFjTmIxbGVJVnljK0RIRmtEZnRy?=
 =?utf-8?B?OUI5K1B4ZXloZC80TGEwaEdlbmlUVGRzNmJIbHZOSjZPbWwwUVF2Y2FTQmh6?=
 =?utf-8?B?cEZ0SFY0dXNWSTZLTlduSEthR2JJaEFZNnA1UEFJVFBlNHVNTzZHMEVyd2FM?=
 =?utf-8?B?YldyWkVzb1crZFdTV3FHcHZLNU82bkMyMkhHVS9NK2t2VzQyTmkwTFlUVnFr?=
 =?utf-8?B?cjBxSTE2T1RnaEtYa0UzVjU5aUY2MFNGc3lxNHVwb2VmVmwrOW1kRnZFQ0pN?=
 =?utf-8?B?UFkvdnB6ZEF0c1FXcUpodkxoK1ZseEUxaEl6NVJrTVFZcExkSkJabHpVOXlk?=
 =?utf-8?B?ck5Xb2VlTE4wTkFIWXJBK2NxajNybDIyMWNlMm1sMG9GZnV1UDNlY3ExSVVZ?=
 =?utf-8?B?ZC9wTUhnOG5XOWFOd1VkVFN5ZjJDMzhBeTd6Tmt5UlE0WnNXVGRrTlA3NlFO?=
 =?utf-8?B?RmwwZkdVWWhoSWQwVVUxT2p5WEhNUTIxZ1MxM2lzald4R1FudVJBZXF1djZW?=
 =?utf-8?B?MlJINUErSCtSQys4KzZXRW85RnB2bzYzWVFEVksxc2tpSDRJNk1GcEFhcFp0?=
 =?utf-8?B?R0pMaVpNTHFJYnFRQWxrNk9XVUVIYUw4SmVicm5vVkI0a0Qybm5obVRmNTJE?=
 =?utf-8?B?Q0Q2RVV3UFZSa0FnRkpIenRMcXVyTEdiYjYwVDJrdjBlV0h5ckNFL3pyR29z?=
 =?utf-8?B?R3pyL0tuaENaSHE0ZTY2WDM5aEhNUUhHRDlpOGMwQ21lRGZFUTkya0JzUHZJ?=
 =?utf-8?B?MDBrUXUrMWxsZlFRNzFKdU4wRVJ6bjVmMGpJOWg4OUs3dWN3VGRMekl3RWI5?=
 =?utf-8?B?czZRN25xeG9tSkhwb0diZ0VPZVJwamlBeFFPTWdacEpxalppYUF6RHJodnNF?=
 =?utf-8?B?anMwTThTKzV2M2NWOVN5RDU4ZC9VLzg0RTVkajZxUGZ3ZlJJQm1JRmhId1Vh?=
 =?utf-8?Q?XXTs4EbxWRL/j?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SFM5WXlsL0VVK2Zpa1JyQ1l1YXg3RXFySmY2M3NaRWdZM1kxZTVYYityZGxN?=
 =?utf-8?B?RVM3NkN1Q24rdVNjWG5aNExKWjJ3VFJGSUJKZStTNDJKaDBMZVRIYitSVGRI?=
 =?utf-8?B?QmtNRmpyWVI1YlBFQ3JGaHNQNDlsaG1JbXdsZlkxSnFqOVVTMmt2K09zcC9s?=
 =?utf-8?B?cWtNT0R3QmFCZXJMQnRFWGVZdGF3UDhHeFB5YmFjeC8xTlE1USt0R0VpdnRZ?=
 =?utf-8?B?U2pzY2VNRm9xZEhGRWs2SitGYW5aeStaczFtSCs5Q0xpL0M4Uitva0xMZFBZ?=
 =?utf-8?B?a2lzbktkNk1PdXQvTU1Hd2pESDU4bUxrTzIrbEdBOGFyN01ON1RxWjNPVHRC?=
 =?utf-8?B?cXhscjl3TS9rdWJRcHp0emxKRHBCZmJYSGhPQk9Wd2NnTjB0dUNCV2tOeE1M?=
 =?utf-8?B?V21EeHBUd3FDeTA1eExFaHRIU3ppV1Vla1RWQnZkcUF1QkE2aEVobmtnemVm?=
 =?utf-8?B?MzNoM1hPdjVpeVhlRk8vZldEdGJEeGF0Vnc1R1docDgrRkZoY2g4OUFQMkEr?=
 =?utf-8?B?cE9BUWk1WUx2TEFhQzN2cEcvaFdUSGJFT1ppN3hWVGR6TUlqbmNaQUZSL3ZS?=
 =?utf-8?B?UEFuU1pUa3drZUFKbkQxVnl2Rm9HV0FxWCtMZllFUVRPZlNxeVM1L1BJbTRm?=
 =?utf-8?B?cjl2M1NLZXpidWczZzR5WWFqaXhkcFl3SWh0cU51UG94R2NwczRSRUNublRU?=
 =?utf-8?B?MmEvQjlaSW1zL2dwcHR0cktTR1BBOFl5MUx3cGkxSDZLc0xkRmpWR2JVOXF3?=
 =?utf-8?B?ZzFsRlVHRDN4eE9xL0MxejNwOWd0b21oZGhxdUxIY1lvaTdTNXdldml4bU9p?=
 =?utf-8?B?U1cyL1pTWjdQK2d2QVVaVWVrSlBXWmc0L3dueVR6Y05ZTkdYQXgrdS9kUWxM?=
 =?utf-8?B?OWpXRzVuQzBucUxLdW9DVU51NVJxclNoZHQwSGl5cHFwa2RzRkNNeHVodjho?=
 =?utf-8?B?MWtOTWNOSGZNL1NacUdnN3RuMEUrUGNld3dFTjdvdm1KU1dNcjJDeGF5MG5H?=
 =?utf-8?B?eFpVMTNZVWYwZWhGZTVSSEVDck1hWkhzN1pMaWs1TFByRWdJOWh2ako0R0Rl?=
 =?utf-8?B?ck14RGo4eDJSUDNjbXYwL3pTd1hmajBzVVROaWJrblM0OTI5b1ZOWjY0bWVt?=
 =?utf-8?B?SjZRUG9KVER4THhvK0tocHlYanphOEsvZUpvazhkQWdiUmZTb2tBelM0cXJu?=
 =?utf-8?B?cU91YmRnZ3kxczk3ZVl0QXF1Z3Q5L3UwQzZ5UURZaURMaSszV0prVms4b1Bq?=
 =?utf-8?B?emxFUDJwcENjRkszUWovK3JiYjcvSW5XMWZ1QzR4eFBJdEZnT2N2MER0dEhl?=
 =?utf-8?B?OFpXUlBLb25XUThwS1dpMmJib2YzVU9GQWlmSUJwMFp3alNVSDZTWXhhMDdv?=
 =?utf-8?B?WGtJaGVTV0RRY3lCVU1FQXNqamRzNUs5NmkyVmp1MkJOdXQvRkRZK0JlZitu?=
 =?utf-8?B?aHVPMklINENFZFBWK05UbThDK09WTGEwSDMvMGhuRzRBcDVHenZwM3VRQ2NI?=
 =?utf-8?B?MWhneHNBY1d3eVE1N1ZtcHlhZEFuMi8waUdQQXhXRitZMk1sVGZQVjZWMS94?=
 =?utf-8?B?dndwYit6VDFPZHlsM2ZzcGVZUCs2bWMxQ09mWWU1VEc4MG8rU0JnK0JuS1N0?=
 =?utf-8?B?ZjRSNVJ3MnQrSU5aNkJyMjF2a0diajF5Rnp1MmJnN0o0YXQzc1VTQjEvenY5?=
 =?utf-8?B?VWgrRzJ0bjhDODVpNEZVWDJIZGQvLzVNUW51cGlOalFMY1pFczlqdzk0UUtu?=
 =?utf-8?B?VnoyejliSHJLU3dkVzJ2anR3ZEMvaVZnTnZ3c0d5di9vWjJWdk9FSXp6Nlcv?=
 =?utf-8?B?MGdmZ2Q3ZzJ1UVZlWmZRRDIzSlQzTnd3d0ZJZDJ5d3ZMNUpRWitjR1Bvc2Yx?=
 =?utf-8?B?ZWVOMHRpdGZsRWwwTjdVSFVUZ3F3SVdBaDNmWEx4SHNPZHRxVDlkTG5mRkVl?=
 =?utf-8?B?OXpQWkZJVkE5VlAzTlEwb3UyVmhrdS9qM0E2VU1LU1RoK041bmNkam91bE1M?=
 =?utf-8?B?ckpRaURLZlplbVBBaGhKNjNiVzVUdStkejZKQjNHMTJtMndZWEE4WHh2ZVVK?=
 =?utf-8?B?QnJZcFRvOHJPeXpvTENiQUVLdXM5aDQ2NVRBVTlaZ0VjUlQ5R3dGRml6VjUv?=
 =?utf-8?B?eVBiWDVxa0VadDB4UVM1ejE1NVBmWm1VZGR5bU81a3RuUlRoNUhqOUxEUng3?=
 =?utf-8?Q?SptqHnO5JNZJXJssIY1xF1E=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d985bcc-3c55-48e5-5d31-08dd47c975c2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 22:47:54.8909 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g6gX+OxoFs+r3VeVUMnhNFoiRJd9x8ADBllHY1YqlBYEIvvsngVMPh/Kh1QV5jPtCiI/db9auoiqH01V1nx5sIdsxMcx//V34AQDF5sHkLM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7917
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

On Thu, Feb 06, 2025 at 04:13:53PM +0530, Riana Tauro wrote:
>PMU provides two counters (engine-active-ticks, engine-total-ticks)
>to calculate engine activity. When querying engine activity,
>user must group these 2 counters using the perf_event
>group mechanism to ensure both counters are sampled together.
>
>To list the events
>
>	./perf list
>	  xe_0000_03_00.0/engine-active-ticks/	[Kernel PMU event]
>	  xe_0000_03_00.0/engine-total-ticks/	[Kernel PMU event]
>
>The formats to be used with the above are
>
>	engine_instance	- config:12-19
>	engine_class	- config:20-27
>	gt		- config:60-63
>
>The events can then be read using perf tool
>
>./perf stat -e xe_0000_03_00.0/engine-active-ticks,gt=0,
>			       engine_class=0,engine_instance=0/,
>	       xe_0000_03_00.0/engine-total-ticks,gt=0,
>			       engine_class=0,engine_instance=0/ -I 1000
>
>Engine activity can then be calculated as below
>engine activity % = (engine active ticks/engine total ticks) * 100
>
>v2: validate gt
>    rename total-ticks to engine-total-ticks
>    add helper to get hwe (Umesh)
>
>v3: fix checkpatch warning
>    add details to documentation (Umesh)
>    remove ascii formats from documentation (Lucas)
>
>Signed-off-by: Riana Tauro <riana.tauro@intel.com>

LGTM,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh
>---
> drivers/gpu/drm/xe/xe_guc.c |   5 ++
> drivers/gpu/drm/xe/xe_pmu.c | 136 ++++++++++++++++++++++++++++++++----
> drivers/gpu/drm/xe/xe_uc.c  |   3 +
> 3 files changed, 131 insertions(+), 13 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>index 1619c0a52db9..bc1ff0a4e1e7 100644
>--- a/drivers/gpu/drm/xe/xe_guc.c
>+++ b/drivers/gpu/drm/xe/xe_guc.c
>@@ -27,6 +27,7 @@
> #include "xe_guc_capture.h"
> #include "xe_guc_ct.h"
> #include "xe_guc_db_mgr.h"
>+#include "xe_guc_engine_activity.h"
> #include "xe_guc_hwconfig.h"
> #include "xe_guc_log.h"
> #include "xe_guc_pc.h"
>@@ -744,6 +745,10 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
> 	if (ret)
> 		return ret;
>
>+	ret = xe_guc_engine_activity_init(guc);
>+	if (ret)
>+		return ret;
>+
> 	ret = xe_guc_buf_cache_init(&guc->buf);
> 	if (ret)
> 		return ret;
>diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>index 3910a82328ee..06a1c72a3838 100644
>--- a/drivers/gpu/drm/xe/xe_pmu.c
>+++ b/drivers/gpu/drm/xe/xe_pmu.c
>@@ -8,15 +8,16 @@
>
> #include "xe_device.h"
> #include "xe_gt_idle.h"
>+#include "xe_guc_engine_activity.h"
>+#include "xe_hw_engine.h"
> #include "xe_pm.h"
> #include "xe_pmu.h"
>
> /**
>  * DOC: Xe PMU (Performance Monitoring Unit)
>  *
>- * Expose events/counters like GT-C6 residency and GT frequency to user land via
>- * the perf interface. Events are per device. The GT can be selected with an
>- * extra config sub-field (bits 60-63).
>+ * Expose events/counters like GT-C6 residency, GT frequency and per-class-engine
>+ * activity to user land via the perf interface. Events are per device.
>  *
>  * All events are listed in sysfs:
>  *
>@@ -24,7 +25,18 @@
>  *     $ ls /sys/bus/event_source/devices/xe_0000_00_02.0/events/
>  *     $ ls /sys/bus/event_source/devices/xe_0000_00_02.0/format/
>  *
>- * The format directory has info regarding the configs that can be used.
>+ * The following format parameters are available to read events,
>+ * but only few are valid with each event:
>+ *
>+ *	gt[60:63]		Selects gt for the event
>+ *	engine_class[20:27]	Selects engine-class for event
>+ *	engine_instance[12:19]	Selects the engine-instance for the event
>+ *
>+ * For engine specific events (engine-*), gt, engine_class and engine_instance parameters must be
>+ * set as populated by DRM_XE_DEVICE_QUERY_ENGINES.
>+ *
>+ * For gt specific events (gt-*) gt parameter must be passed. All other parameters will be 0.
>+ *
>  * The standard perf tool can be used to grep for a certain event as well.
>  * Example:
>  *
>@@ -35,20 +47,34 @@
>  *     $ perf stat -e <event_name,gt=> -I <interval>
>  */
>
>-#define XE_PMU_EVENT_GT_MASK		GENMASK_ULL(63, 60)
>-#define XE_PMU_EVENT_ID_MASK		GENMASK_ULL(11, 0)
>+#define XE_PMU_EVENT_GT_MASK			GENMASK_ULL(63, 60)
>+#define XE_PMU_EVENT_ENGINE_CLASS_MASK		GENMASK_ULL(27, 20)
>+#define XE_PMU_EVENT_ENGINE_INSTANCE_MASK	GENMASK_ULL(19, 12)
>+#define XE_PMU_EVENT_ID_MASK			GENMASK_ULL(11, 0)
>
> static unsigned int config_to_event_id(u64 config)
> {
> 	return FIELD_GET(XE_PMU_EVENT_ID_MASK, config);
> }
>
>+static unsigned int config_to_engine_class(u64 config)
>+{
>+	return FIELD_GET(XE_PMU_EVENT_ENGINE_CLASS_MASK, config);
>+}
>+
>+static unsigned int config_to_engine_instance(u64 config)
>+{
>+	return FIELD_GET(XE_PMU_EVENT_ENGINE_INSTANCE_MASK, config);
>+}
>+
> static unsigned int config_to_gt_id(u64 config)
> {
> 	return FIELD_GET(XE_PMU_EVENT_GT_MASK, config);
> }
>
>-#define XE_PMU_EVENT_GT_C6_RESIDENCY	0x01
>+#define XE_PMU_EVENT_GT_C6_RESIDENCY		0x01
>+#define XE_PMU_EVENT_ENGINE_ACTIVE_TICKS	0x02
>+#define XE_PMU_EVENT_ENGINE_TOTAL_TICKS		0x03
>
> static struct xe_gt *event_to_gt(struct perf_event *event)
> {
>@@ -58,6 +84,24 @@ static struct xe_gt *event_to_gt(struct perf_event *event)
> 	return xe_device_get_gt(xe, gt);
> }
>
>+static struct xe_hw_engine *event_to_hwe(struct perf_event *event)
>+{
>+	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
>+	struct drm_xe_engine_class_instance eci;
>+	u64 config = event->attr.config;
>+	struct xe_hw_engine *hwe;
>+
>+	eci.engine_class = config_to_engine_class(config);
>+	eci.engine_instance = config_to_engine_instance(config);
>+	eci.gt_id = config_to_gt_id(config);
>+
>+	hwe = xe_hw_engine_lookup(xe, eci);
>+	if (!hwe || xe_hw_engine_is_reserved(hwe))
>+		return NULL;
>+
>+	return hwe;
>+}
>+
> static bool event_supported(struct xe_pmu *pmu, unsigned int gt,
> 			    unsigned int id)
> {
>@@ -68,6 +112,35 @@ static bool event_supported(struct xe_pmu *pmu, unsigned int gt,
> 		pmu->supported_events & BIT_ULL(id);
> }
>
>+static bool event_param_valid(struct perf_event *event)
>+{
>+	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
>+	unsigned int engine_class, engine_instance;
>+	u64 config = event->attr.config;
>+	struct xe_gt *gt;
>+
>+	gt = xe_device_get_gt(xe, config_to_gt_id(config));
>+	if (!gt)
>+		return false;
>+
>+	engine_class = config_to_engine_class(config);
>+	engine_instance = config_to_engine_instance(config);
>+
>+	switch (config_to_event_id(config)) {
>+	case XE_PMU_EVENT_GT_C6_RESIDENCY:
>+		if (engine_class || engine_instance)
>+			return false;
>+		break;
>+	case XE_PMU_EVENT_ENGINE_ACTIVE_TICKS:
>+	case XE_PMU_EVENT_ENGINE_TOTAL_TICKS:
>+		if (!event_to_hwe(event))
>+			return false;
>+		break;
>+	}
>+
>+	return true;
>+}
>+
> static void xe_pmu_event_destroy(struct perf_event *event)
> {
> 	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
>@@ -104,6 +177,9 @@ static int xe_pmu_event_init(struct perf_event *event)
> 	if (has_branch_stack(event))
> 		return -EOPNOTSUPP;
>
>+	if (!event_param_valid(event))
>+		return -ENOENT;
>+
> 	if (!event->parent) {
> 		drm_dev_get(&xe->drm);
> 		xe_pm_runtime_get(xe);
>@@ -113,16 +189,36 @@ static int xe_pmu_event_init(struct perf_event *event)
> 	return 0;
> }
>
>-static u64 __xe_pmu_event_read(struct perf_event *event)
>+static u64 read_engine_events(struct perf_event *event)
>+{
>+	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
>+	struct xe_hw_engine *hwe;
>+	u64 val = 0;
>+
>+	hwe = event_to_hwe(event);
>+	if (!hwe)
>+		drm_warn(&xe->drm, "unknown pmu engine\n");
>+	else if (config_to_event_id(event->attr.config) == XE_PMU_EVENT_ENGINE_ACTIVE_TICKS)
>+		val = xe_guc_engine_activity_active_ticks(hwe);
>+	else
>+		val = xe_guc_engine_activity_total_ticks(hwe);
>+
>+	return val;
>+}
>+
>+static u64 __xe_pmu_event_read(struct perf_event *event, u64 prev)
> {
> 	struct xe_gt *gt = event_to_gt(event);
>
> 	if (!gt)
>-		return 0;
>+		return prev;
>
> 	switch (config_to_event_id(event->attr.config)) {
> 	case XE_PMU_EVENT_GT_C6_RESIDENCY:
> 		return xe_gt_idle_residency_msec(&gt->gtidle);
>+	case XE_PMU_EVENT_ENGINE_ACTIVE_TICKS:
>+	case XE_PMU_EVENT_ENGINE_TOTAL_TICKS:
>+		return read_engine_events(event);
> 	}
>
> 	return 0;
>@@ -135,7 +231,7 @@ static void xe_pmu_event_update(struct perf_event *event)
>
> 	prev = local64_read(&hwc->prev_count);
> 	do {
>-		new = __xe_pmu_event_read(event);
>+		new = __xe_pmu_event_read(event, prev);
> 	} while (!local64_try_cmpxchg(&hwc->prev_count, &prev, new));
>
> 	local64_add(new - prev, &event->count);
>@@ -161,7 +257,7 @@ static void xe_pmu_enable(struct perf_event *event)
> 	 * for all listeners. Even when the event was already enabled and has
> 	 * an existing non-zero value.
> 	 */
>-	local64_set(&event->hw.prev_count, __xe_pmu_event_read(event));
>+	local64_set(&event->hw.prev_count, __xe_pmu_event_read(event, 0));
> }
>
> static void xe_pmu_event_start(struct perf_event *event, int flags)
>@@ -207,11 +303,15 @@ static void xe_pmu_event_del(struct perf_event *event, int flags)
> 	xe_pmu_event_stop(event, PERF_EF_UPDATE);
> }
>
>-PMU_FORMAT_ATTR(gt,	"config:60-63");
>-PMU_FORMAT_ATTR(event,	"config:0-11");
>+PMU_FORMAT_ATTR(gt,			"config:60-63");
>+PMU_FORMAT_ATTR(engine_class,		"config:20-27");
>+PMU_FORMAT_ATTR(engine_instance,	"config:12-19");
>+PMU_FORMAT_ATTR(event,			"config:0-11");
>
> static struct attribute *pmu_format_attrs[] = {
> 	&format_attr_event.attr,
>+	&format_attr_engine_class.attr,
>+	&format_attr_engine_instance.attr,
> 	&format_attr_gt.attr,
> 	NULL,
> };
>@@ -270,6 +370,8 @@ static ssize_t event_attr_show(struct device *dev,
> 	XE_EVENT_ATTR_GROUP(v_, id_, &pmu_event_ ##v_.attr.attr)
>
> XE_EVENT_ATTR_SIMPLE(gt-c6-residency, gt_c6_residency, XE_PMU_EVENT_GT_C6_RESIDENCY, "ms");
>+XE_EVENT_ATTR_NOUNIT(engine-active-ticks, engine_active_ticks, XE_PMU_EVENT_ENGINE_ACTIVE_TICKS);
>+XE_EVENT_ATTR_NOUNIT(engine-total-ticks, engine_total_ticks, XE_PMU_EVENT_ENGINE_TOTAL_TICKS);
>
> static struct attribute *pmu_empty_event_attrs[] = {
> 	/* Empty - all events are added as groups with .attr_update() */
>@@ -283,15 +385,23 @@ static const struct attribute_group pmu_events_attr_group = {
>
> static const struct attribute_group *pmu_events_attr_update[] = {
> 	&pmu_group_gt_c6_residency,
>+	&pmu_group_engine_active_ticks,
>+	&pmu_group_engine_total_ticks,
> 	NULL,
> };
>
> static void set_supported_events(struct xe_pmu *pmu)
> {
> 	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>+	struct xe_gt *gt = xe_device_get_gt(xe, 0);
>
> 	if (!xe->info.skip_guc_pc)
> 		pmu->supported_events |= BIT_ULL(XE_PMU_EVENT_GT_C6_RESIDENCY);
>+
>+	if (xe_guc_engine_activity_supported(&gt->uc.guc)) {
>+		pmu->supported_events |= BIT_ULL(XE_PMU_EVENT_ENGINE_ACTIVE_TICKS);
>+		pmu->supported_events |= BIT_ULL(XE_PMU_EVENT_ENGINE_TOTAL_TICKS);
>+	}
> }
>
> /**
>diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
>index 0d073a9987c2..769905036b35 100644
>--- a/drivers/gpu/drm/xe/xe_uc.c
>+++ b/drivers/gpu/drm/xe/xe_uc.c
>@@ -14,6 +14,7 @@
> #include "xe_gt_sriov_vf.h"
> #include "xe_guc.h"
> #include "xe_guc_pc.h"
>+#include "xe_guc_engine_activity.h"
> #include "xe_huc.h"
> #include "xe_sriov.h"
> #include "xe_uc_fw.h"
>@@ -210,6 +211,8 @@ int xe_uc_init_hw(struct xe_uc *uc)
> 	if (ret)
> 		return ret;
>
>+	xe_guc_engine_activity_enable_stats(&uc->guc);
>+
> 	/* We don't fail the driver load if HuC fails to auth, but let's warn */
> 	ret = xe_huc_auth(&uc->huc, XE_HUC_AUTH_VIA_GUC);
> 	xe_gt_assert(uc_to_gt(uc), !ret);
>-- 
>2.47.1
>
