Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82F60D11195
	for <intel-xe@archiver.kernel.org>; Wed, 26 Nov 2025 20:14:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3015910E68C;
	Wed, 26 Nov 2025 20:14:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N1m8u/T2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 157A910E68C
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Nov 2025 20:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764188083; x=1795724083;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lZERhSJwEGUOWHKGVBHCEn0VVTrsf23REgHvcPZ0vsE=;
 b=N1m8u/T2R5r/mk4vjuOiemLElIFAsJggSlk47TURmBC8hu34kkyGNDAy
 E9SN7EmwfeRyGznb4IhnGrrZyUUgMYtxcineXbx6oon9gg8ImjaoTF3Ck
 uqCsHbKVc4sV9Zz6qliiRdrJJE1f/Jg7snThMgMjo3hwAj6+Ns+M4JoDi
 O8Ad8E90NiNBDqF4+z68vxcKUoCIEpzLe1ysF2JHF4zneKln2pbNoDroD
 u+ahRigMkjGjyGqnNW/oxODLyk4ZbGdUJ3062ngf7rkgZ3f/kJZ/3+pt9
 zxmROFG+NJBQ5LZs7+FUl4h/uhqH9N9sEr5ui3R2IpdcBxFPHv/cDqtb7 A==;
X-CSE-ConnectionGUID: EecxjsKEQtaLZJJ6MlVgrA==
X-CSE-MsgGUID: QrnXEPSIQ4qwkLW4cybUtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="68828629"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="68828629"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 12:14:43 -0800
X-CSE-ConnectionGUID: e3b/t9Y/QI+W6U368EkUaQ==
X-CSE-MsgGUID: Y7JbkHYdRCWix6Ae6SiNOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="193493059"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 12:14:43 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 12:14:42 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 26 Nov 2025 12:14:42 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.33) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 12:14:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YMSRX8c+NqVxGlRT5/Q+Ozcs19bccIaljMtoZyMU1TNbnbWXn0pqfXHX8ZOz5FbfZLVWmTNUFSq9aZdii7he+sQ4hbFPfTyrwQDROBnnMIacuqc/pBIL8fFdiKBd2OSgzwRHtjJ4g46hn/9VXNfCeRKM2K7nq4/h4FvzJUtNj1Relsmk9u53wSej3v4vF0Cyt6ruk0U9t3sqv7/nzG+o37xP9OSdOHgc/zFgdpgJFrPebBNjgF5C90HXYFAmkhufrdGYkH7lUmsqow3t71tuLpkgow6R8FX6Nu4l9L4pmZy5rClo7KvSPyv4U/d5e3rUOgVEe3aEeyFxP2SBbw/kDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/F3/jgXCze+ssosV4N7dVbMUTjpcbyBxdudDhcAX/VU=;
 b=yjFD9AvQ6a3R+ebyCJT5YsXJnDHDODZCq0o4y9EMaWfzXJoj/RcZr6V70e1TSBbZktfiHyZEfbkzakLlN4GOCY6uufdFyG1YdrDl8XlnDnAwPBVYbzaaq9Uvbr55z3sgcFNb9s6fm/TSLURDlgFShEP93opDM29Qq5v5znW0xYXlFxcDik2wmTWS/YNRdrYALeZyrkXoTdZo8pVUMpEtEbdeDaVOK8SN3BE7okgeNt0HMGiU8rtDPVlMu8bnanb1avPF+UQVkv68wRyrfRuAxIPC9FFkJfDKXxtgtpDPAvx2pr/XwVrshFrbK0Jax12C1/KWJmWYrZVkLr1RPgNMNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DS7PR11MB7857.namprd11.prod.outlook.com (2603:10b6:8:da::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Wed, 26 Nov
 2025 20:14:39 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%7]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 20:14:39 +0000
Date: Wed, 26 Nov 2025 12:14:36 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/5] drm/xe/oa/uapi: Add gt_id to struct drm_xe_oa_unit
Message-ID: <aSdfrKd7xhLXVggW@soc-5CG1426VCC.clients.intel.com>
References: <20251126035220.13089-1-ashutosh.dixit@intel.com>
 <20251126035220.13089-3-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251126035220.13089-3-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0001.namprd03.prod.outlook.com
 (2603:10b6:303:8f::6) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DS7PR11MB7857:EE_
X-MS-Office365-Filtering-Correlation-Id: de8356d4-c64c-4de8-931d-08de2d286d53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L3JlT2JYNjdqQjlMQjUvcWdxMUFrdFI1dHFIeS9ic204c2xNaVRqL0d0Nk0v?=
 =?utf-8?B?K3FEMUVNYko5ait5dFpQOXdENTliU1hiR09wZUc5bmNKQWZ3SlRRczNIQ2FE?=
 =?utf-8?B?aTNZTGJvTHZFdkVCd2Z6bjNHdm81azM2OEEyVEdJb1YrK1N6b2l2cGw1anNt?=
 =?utf-8?B?SitUQ2tHQk04Y2o3M3UyK3lrZHY0SlZDV0doakwrLzNvbTlkWXVycDV5OVNR?=
 =?utf-8?B?OUdkY1FreEpldDR4K3d4M2VudWdrV0d2ak5BVmtBRVdHYXNnaDYwNG5QVWRO?=
 =?utf-8?B?dlA3RlRsRXdZYlA2RlBvc01KM2dYM0NNV1RialhsR1N5dlZvR2lKL0o0S1l5?=
 =?utf-8?B?WjF2dEQ4ZkRiM3o1STNLU1Jyb1YrS0ZUSmQ1ZG8vVld3TXkwdUU3ZGZxc3Q0?=
 =?utf-8?B?SlIwUXlOUnBYd05UZVV0M0N3TXE0RU9XeWVDMUdWWVpuYWhaZ3B2ZUx3dWVk?=
 =?utf-8?B?WVVmR0N2WHBIeHNOd2tZcGYvWG5ib1IrbW5Oa0M1dk1WS2FuRFdHaGExT2dx?=
 =?utf-8?B?aDJKbmZlZnNIZzZRUEh5ZkJYWklWQ0UrZ1FQYzhuMEVLc2FBUThXd1J3aHdW?=
 =?utf-8?B?cXZ4dWlHdmJrWGdFR3ByRnEwWE9oTXpPVi95Q3BJdEVuUUJTZGgrUTVlbW1X?=
 =?utf-8?B?ME15N0Jyei9EckVXMDZ4dkFTVEl2VjNvRnpaQVplbnZ2UllkczNIbjU2U3V2?=
 =?utf-8?B?TUpTKzNHY1hlbExEQjRReVBmQzRwaDhHNUg5eVFGdTkzdE9NeVlmREVLRjlw?=
 =?utf-8?B?M3daV2dxeVdlUG9BZElBa0Z0NEpESzU4MmFKdDVzZDMwVjhDeG14ODdCbndL?=
 =?utf-8?B?am1QWU9WNzNUeEFvczlFVGVtOEhDeC92bEEvcUs2YjN5OUN1WHVKSHUyVjh5?=
 =?utf-8?B?eHBzbWxxcXRZY2R1N1NlZGJ5dy91Q1BPN0dBeGtKaTk3YWtqOFUxWnNJWVNv?=
 =?utf-8?B?eVRidDhxQjFUQW1Yb3Z4Tm1scEZoNm95NEhpTWpnR21TbjVwYmtYVURpY1FP?=
 =?utf-8?B?U1lMemZoTUc1QlpUSmJRMGpsZUUxUjUrRXdETFZkeDlOcEJ0WG5yL1B4WFNx?=
 =?utf-8?B?eVVoK0NELytFb01PdXFrNkN4Z3FrRWJ6L0MyVml4aUtqU3NXeXdlWkpXL2JQ?=
 =?utf-8?B?RlVMTVdXUVo0VWVSelhXTnNCM1dEM2RpdS8zM29YNk0rNnZQM3Q2dEJFd3hi?=
 =?utf-8?B?czByRm5kYXNNeW9uTmtyc0FBbjViUGZjaEZ5S0h2QmUrV1JMbmhab0RoTzFS?=
 =?utf-8?B?bFVDSXJ5eFI2dVBqT1RaWTZ3VjhiUFZQdVUzaUU3WVJ1NjhySnRjckZNaCtl?=
 =?utf-8?B?VGRyNFpwazZpZEVibG9ZVElvQVJoUm9mUHY1R0lhRU1jd0pUVHlTWFdMNjJr?=
 =?utf-8?B?dTlBZ3cwRnZCV3ZSb3cxdm1KY3FzNXVDbndhK29nWVFlYVd3WjBFTzJud3JV?=
 =?utf-8?B?YUVJSElneEFmTTN6QWt1Z01KQWRzMWgzNEpwV1hQMG9Lay9SbGRHQ0p6bkFK?=
 =?utf-8?B?UmJ4ZkRpYUVsdEtzU21rWlRwQzdNMkkvT3NxTWNlc2hiNlltejQ2OEtGdENv?=
 =?utf-8?B?YVJLTGlGRWQ5TmFPNkFJaGMwRjZ6emhnWE15TUNvaXRkYlExUVFKaUdkN0NR?=
 =?utf-8?B?eFo2NHVadG5MV3ZhamZweFJ5VnVkWmlFZFVQNDFFQzd0OWVSRzdOYTBPTWpo?=
 =?utf-8?B?bFh1aW5tcVU1SjJYaEFhQWdpNWsyTUQ4QmVPZUh3NTdTc2RiZyswSTRXcnlX?=
 =?utf-8?B?ZjVkeTZmb3ZuN21zWmJqRklOSjFhUE5mb0Y0b3ZoWE55MzFMYjJidzFGaldK?=
 =?utf-8?B?bVBxa3FUd1dOMXQwYmo0cU5kaFVUUnVXMzVUVUhYNmp6ak1UYVZ4MEx5ZEVL?=
 =?utf-8?B?WmlwN0hOWFJqbjBneCs0SzlhNlc3WGxCY3hwRHpTNENLeUZWaDM3R3BCV1Bu?=
 =?utf-8?Q?RrTWc1K6mp7kyOsUNgoOELLqgcHKurYC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bjZCZ3o1b2pEakovNCtKeDViUFZRNm4wYzVoa0o0MzFJc21aMHE0b2NMSS9S?=
 =?utf-8?B?eFZ6VTNqMno0aHBRbDZlTXNMb1FLT1V3clVGTW4vd0ViOHRjNjZvcjVGaW9G?=
 =?utf-8?B?Qlowb2VFcmZwczBlRGdvQlljNHl0aTZnVjZzOUJNYnYyaThhWkQ1RVBNazNW?=
 =?utf-8?B?UTRJd0ltRzBhVEdiSzF5NlMwTmFtWjBCYktLQ3dXTkpmVHN5cW1sTFFzOTRP?=
 =?utf-8?B?MjBheW55M0xvR285THdQTlFqZnZ4aWFVeWFxc04yQVQ3SzNiSDduMllzVlBO?=
 =?utf-8?B?MkRCenJxWXZDdlJUYzI2RC9sN25JdHN6ejhUdXNIOWJQanRnc1F0NS9maksv?=
 =?utf-8?B?S3ZMZFc2Tnd4SlZvUEFXYnB4L1UzdFlMMnUzSHl6bngwS2tKdkRvV1l6ZXNl?=
 =?utf-8?B?WWVaVHBtMGd2dnFuVGNkVzhmcVFhRkRMMndCWFQvaXZrNEVZM1pPLzlXai9P?=
 =?utf-8?B?eDVPcVRwc0tPZzE2NVZxOVRMbVJRR045dWxjajFBdGVNazhCOHNrZTlwQjd6?=
 =?utf-8?B?eDQwZXVSU1lhTXViczZ1UVo5QTJvdEVna25xR2ZTT3YzWEZOU3pxS1lpekI2?=
 =?utf-8?B?K1lpR2wzQjdwK0gwL2JkQVEyVW9qemRTL3dNWmJMRWJQOWYrbHE2a0FXd0J2?=
 =?utf-8?B?aXhWNm5MTEYzemZrcktXSVV5MU1TZXJEUnh6eFZFVzlhVlVJenBQMVNCT3Nn?=
 =?utf-8?B?VEt1K2haeUMvYXVHQS9YaTNvL2tndmhWTjNOeUxGVk04NzZNNnUvRUVXS1pz?=
 =?utf-8?B?amgzTGptVWFGa0NkTGloNGY1cVBMNDZEUS83ZEhZcXYzQWNSUnVwNzJBVFll?=
 =?utf-8?B?N2xQcVMrdDVnVnlQSDVYU1JRQzQ0MTdSYzJ4WXJieUJ4OTJUR0w5UDJ1bjgr?=
 =?utf-8?B?SWN6L3EwZ3d5RnR6VGtUdnlCNVNudTY0Mml1eWVBUjdzalVSUTJaODdtNWFt?=
 =?utf-8?B?c1hZQ2tuMkV3WWRQZlJuUmZjUWhmTm9NOFVzZDJLMWZDdUovUjBHOUVibjhM?=
 =?utf-8?B?ZUI4ZjA2MkgvcVhXY3NWaHpKK01la1lRc3dkK0Z4emdZaU1XMzArMGNlTUVl?=
 =?utf-8?B?SXB5a0dLVHlKR0VSa0lEaVNWVnZUaWU1TE5PS24yRWRXVjhYNjljL0YvQmVp?=
 =?utf-8?B?aS93L0tsRCt0V1JORlRrbGhTYzZsNExHYUVGZzdHNnhocWFLUmtITE1QSHRm?=
 =?utf-8?B?ZzdYakZEOExHSklIY0k5OHVpVWJ0amwrM1BjeFFBZ1RQMWN0RmdxNTNZYjdn?=
 =?utf-8?B?VmhVU2U3bkl2VHkzY2JpbisvNEZJTFVWQWtzOWVYNTdtL055YWxSTHIvcFRh?=
 =?utf-8?B?STFiUUx6T1FTSTVhbnQ2T1BacndZZmNPUi80UGU4N1Q4Vm0zeElwQjBBZXpM?=
 =?utf-8?B?RFVsOXF6MWcySk1BS2U1akhNb0N0RVQ3L3JwTjlSMVVQOFg0dDNCUzFDZE5h?=
 =?utf-8?B?elhEc3pqdEk5bG5BTHJJcFUvdGNwT1JLOUEwakFvNzFabHBuVGlvYnd3ZDZI?=
 =?utf-8?B?eEd4N0lMalB6LzljdVRwa3dFZGJyVmlCQTJmZng2TE4vaExyK0JsYjJUMXds?=
 =?utf-8?B?bWh4MnlMZDdTbGNlOVpGa0duSWl1emxyZkNEUVVaVzZrZWN2TVRTZG1wZTY5?=
 =?utf-8?B?ZTV0NVk0QkpsQVlaaTZLSUtDWnpYdDI0M0RNc1N0R1NYbHloRUtZRHZ4UFlV?=
 =?utf-8?B?RlN5THpqbGR3SDl5WkttdHRYTlF3L1M0a1RpdWNnUTFTYVNLczlwKzJwK1lK?=
 =?utf-8?B?T1FPakhuUHJIcjNPd2dFM2xLVW9FSUs4dk5XazdDb0RmM1dHRXZqSEZNMUoz?=
 =?utf-8?B?REpHUTdXczBjc3NIeDRoU0JmY2JwaHJHb1pMSk9BWHhaMEppVWdUT1dLQnVD?=
 =?utf-8?B?U25jdkxJUy9aUlBOUDNNaXVnUkxLZlQ3SXVMN3o5NEdtcG1pSERKNlVnOXBB?=
 =?utf-8?B?TWNWd2oyWm1RakxuRWp3STJGNmdJSytQRVNWS0wvRE5vSHlrcS9BR1lIZ3RZ?=
 =?utf-8?B?dDN4N1dXSjBlaHNxWTdERzVmRllhRk1wUjVRN2JGTHFDY1F2anRNYVBRWm5Z?=
 =?utf-8?B?YWZIdlR5NGJFTzFtYlFUUG5QVG9uUlZ3WUZqQ2M1MEhEUVd5eUFNRGVaRGZs?=
 =?utf-8?B?MTd3U2d6WDVuZXNKRHFDc2owK2JVbTBoWEVpcjlJMXRuNy9yK21hdXJzYnI4?=
 =?utf-8?Q?X0/5SArokPHBinC8JdAsUfY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: de8356d4-c64c-4de8-931d-08de2d286d53
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 20:14:39.0460 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bpsui49OX0Nl6NjrfB71JPt6wh/EzWFcsp4huAUWc0MvJBTtXEiIpzts/vEFK9py1CyGkWQ4aKvssryIoyMciHcAgA8xltfuLeYvDbkBfek=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7857
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

On Tue, Nov 25, 2025 at 07:52:17PM -0800, Ashutosh Dixit wrote:
>gt_id was previously omitted from 'struct drm_xe_oa_unit' because it could
>be determine from hwe's attached to the OA unit. However, we now have OA
>units which don't have any hwe's attached to them. Hence add gt_id to
>'struct drm_xe_oa_unit' in order to provide this needed information to
>userspace.

nits:
s/determine/determined/
s/hwe's/hwes/

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>---
> drivers/gpu/drm/xe/xe_query.c | 4 +++-
> include/uapi/drm/xe_drm.h     | 6 +++++-
> 2 files changed, 8 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
>index a7bf1fd6dd6ac..18bd8047ebfdb 100644
>--- a/drivers/gpu/drm/xe/xe_query.c
>+++ b/drivers/gpu/drm/xe/xe_query.c
>@@ -682,7 +682,9 @@ static int query_oa_units(struct xe_device *xe,
> 			du->capabilities = DRM_XE_OA_CAPS_BASE | DRM_XE_OA_CAPS_SYNCS |
> 					   DRM_XE_OA_CAPS_OA_BUFFER_SIZE |
> 					   DRM_XE_OA_CAPS_WAIT_NUM_REPORTS |
>-					   DRM_XE_OA_CAPS_OAM;
>+					   DRM_XE_OA_CAPS_OAM |
>+					   DRM_XE_OA_CAPS_OA_UNIT_GT_ID;
>+			du->gt_id = u->gt->info.id;
> 			j = 0;
> 			for_each_hw_engine(hwe, gt, hwe_id) {
> 				if (!xe_hw_engine_is_reserved(hwe) &&
>diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>index 47853659a705e..ec09b281eafe7 100644
>--- a/include/uapi/drm/xe_drm.h
>+++ b/include/uapi/drm/xe_drm.h
>@@ -1676,12 +1676,16 @@ struct drm_xe_oa_unit {
> #define DRM_XE_OA_CAPS_OA_BUFFER_SIZE	(1 << 2)
> #define DRM_XE_OA_CAPS_WAIT_NUM_REPORTS	(1 << 3)
> #define DRM_XE_OA_CAPS_OAM		(1 << 4)
>+#define DRM_XE_OA_CAPS_OA_UNIT_GT_ID	(1 << 5)
>
> 	/** @oa_timestamp_freq: OA timestamp freq */
> 	__u64 oa_timestamp_freq;
>
>+	/** @gt_id: gt id for this OA unit */
>+	__u64 gt_id;
>+
> 	/** @reserved: MBZ */
>-	__u64 reserved[4];
>+	__u64 reserved[3];
>
> 	/** @num_engines: number of engines in @eci array */
> 	__u64 num_engines;
>-- 
>2.48.1
>
