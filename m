Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D6AAC25B4F
	for <intel-xe@archiver.kernel.org>; Mon,  6 May 2024 17:31:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2834D10F9F3;
	Mon,  6 May 2024 17:31:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fjDoNErR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E36510F9F3
 for <intel-xe@lists.freedesktop.org>; Mon,  6 May 2024 17:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715016686; x=1746552686;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=umNVcVZQxdnprwL15QdQ1gOZFHjGOa+eRI129bX9k/w=;
 b=fjDoNErRWkGGBKmrhfB/Ky+XQlvQKOfPDuTbibBT9gbMjrNwxLRSWtFx
 cQEtMFDbcRiPupLwq5X0R6mU7rBa2VbXvP2fYkLre6do1OEsHuRZrtZs4
 zn+KLFaH/z9fBb2yDMwe/pjJ+vJAQaPj+ta+XRqe2nTqkFNTDrDRC7TUy
 V2WjBHtJ57e0iAPKErps899VnWm5zRfLPXqeYy47Meh5dgWIAWIhGcY05
 rskPGWEdaD3ARox/lYY1dkNqpa03DsjJi7u3YDRtYJ8CC4/qIH3oBKAsm
 Br58LMWYPn0x+PzKex87Fwi4Cxy2VRZ/0TbccQdstg7+kusoCbgIVsqoJ w==;
X-CSE-ConnectionGUID: scjrvF/VRDK2ePsMMj41Rg==
X-CSE-MsgGUID: mf90+xaHRcmuAeR3LwBnLA==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="10931789"
X-IronPort-AV: E=Sophos;i="6.07,259,1708416000"; d="scan'208";a="10931789"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 10:31:26 -0700
X-CSE-ConnectionGUID: SlZm+8gRQrC1V28sPhxhnQ==
X-CSE-MsgGUID: FxIGv0XjTZ+8iAz1fE9FGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,259,1708416000"; d="scan'208";a="32734314"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 May 2024 10:31:26 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 6 May 2024 10:31:25 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 6 May 2024 10:31:25 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 6 May 2024 10:31:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ezftv7Xe/uiEh7cvQ88hUxpnfW0e+2/QdrZ3QxHlhAHZ6jv0qweM8pb48mdF/cDs1f6f1eyw1KME8StOVL2fPRbETPCBlEdyJBLI1fSxo1jZvj7U7wR7NEUgcT9QSUOAg8Ws+HuI5x2i64TcUXGf1q2x/wEKCHmAs9kFt0wYzYHr3E6F7nGAjUSNd9Fk1bjh+iVxQ9BmuKZLTDk4zKGT/bR0bAVl3/RMzTOw5MCFqnCKR6FXWG4RHW8GgK/KPcmw3L6xz4g/ywujlPUPlZoZcXsVHBOaPQONDCQVWbjc9Dcf1ZExxegn+KAFJ4aHMSVsM4Ei+TcDJsRER0e+Aa3TjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=umNVcVZQxdnprwL15QdQ1gOZFHjGOa+eRI129bX9k/w=;
 b=Qeze+fUeEnUtKB4c0B4qC+7fTCic/Yna1hIFBtNtGcSz3S4tQntA4QNPaWADEMcPC1rzw/mM4n01V14Y+P9qJp9bmFZwvLOwIimI1yFVhVnV8sEJxWts6jl08IuL8fHtOkbnPfY9GR53wxuajstf02e4cRBoIPJb38SCi6UGlQ868x5067DmJ1im+apYBBAkWtibFnU6NQHbzMmxN/xmC3nAk3i6bIFBijGt9ziqObsy48x/GcKDPZ9GI22VZqt7pQbgPIUL2SPw5ZzxCnBpiJSCKym06tIAvNAA6O8mz5ndW3cTcUMJrcaruoiASNaO0/OQij2ojS3xQWv3nXn3Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 SA2PR11MB5017.namprd11.prod.outlook.com (2603:10b6:806:11e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42; Mon, 6 May
 2024 17:31:04 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::36d1:7f54:624d:aabf]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::36d1:7f54:624d:aabf%6]) with mapi id 15.20.7544.041; Mon, 6 May 2024
 17:31:04 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>
Subject: Re: [PATCH 1/4] drm/xe: Minor cleanup in LRC handling
Thread-Topic: [PATCH 1/4] drm/xe: Minor cleanup in LRC handling
Thread-Index: AQHannvDEwcd27g+gk6/AikSPtF6GrGKeV6A
Date: Mon, 6 May 2024 17:31:04 +0000
Message-ID: <9935ddbc402434f6aa1b417765f255e52ba5febc.camel@intel.com>
References: <20240504233503.16095-1-niranjana.vishwanathapura@intel.com>
 <20240504233503.16095-2-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20240504233503.16095-2-niranjana.vishwanathapura@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|SA2PR11MB5017:EE_
x-ms-office365-filtering-correlation-id: 68ea4ae7-8df1-4baa-9040-08dc6df24e93
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?T0p6Mm1CMkNFWDIvOWo0Nk4yRkp1M0dWSnJuaThpZE9LSElTK3dyaTNwZDN6?=
 =?utf-8?B?TWlFa1BDNmJnc0dXUUlnVG9vZk5JbC85dlEvTTh1aEVTRjNCNWxHR0hFNFcx?=
 =?utf-8?B?aFpVbE5iWXlUd2RFV1FOUi94S0JiWG4rNWxROVlsRVBUcHdxZ1RTd0hHOFpq?=
 =?utf-8?B?Z0RFZ1RDYUJQcFpXNjFxVldqU0tzVTBwVmNKbmYxVUFFdU9FdUF6K2dQV0lx?=
 =?utf-8?B?N25rbHppeG42Q0N0WEFIb0lkUTdyR09SUmxIak45emlZSjU0SEV4c3lmdDJS?=
 =?utf-8?B?MG1hek9MSS9ZK2ZPMnNheit0aEloNWxHMU0veW05NzVrRGowV2tWUWFUSEhn?=
 =?utf-8?B?cmVVMDUzcWxnU2tzZGtkdHVtYzlxTmViRER6RTVWOVlJdjBFRmVBNjl2SUJF?=
 =?utf-8?B?a0Zkb2VqcUx4VmFGTGFmR2VmRnoxRDdKSnh4OFdwUG9IZ3VzVDVxMm9KdDJp?=
 =?utf-8?B?L20xWjg3YkVmTityTXRPTTl2TnBCQm1GNzZ6empTZ3lWUHMvZVNWc0RQYU5o?=
 =?utf-8?B?L3dPdUtUenRCMDVtS1lvYUtQbGozNElUTEVWM3lESGN2eEhzR1hNeFRBekJS?=
 =?utf-8?B?U05aejlvR0JOZW5PcENZY25GbklPQk0zckVtV3NJVkVubE1nMEg5VWg0YkZx?=
 =?utf-8?B?ZVRpK0tGZGxwQVhVckNuRXhKTTM2blhGa3JzOUNPb0VqNzhmTVAxR1hrajdy?=
 =?utf-8?B?QXlUWUdnUFRpVXN5Z3BZbjhMSmRRWkptY0dhMklidzgwdEovWWplbmV4STc2?=
 =?utf-8?B?VzVNNVVsUDhxMC8wUVF1TmViUmRGMGVkaXBGdGdPSms0Q0FEZ01YRTB1N1RE?=
 =?utf-8?B?WGJKMjhJQUhKVG5CcnoxN1dQOTEyYXN6aFROOW9vdENuTmN1YTdkY0N1RHdQ?=
 =?utf-8?B?UEJPMHhsdEZGTFZ6U1NMVG5XTDJ3TXZHMWRHd0luYUhaSGc3ZGZlc3JzYm1h?=
 =?utf-8?B?blhweUdNN2E5dE5LcEh0VXdIRVQrTE1WY2tNdkZhanIzWDNaUGFMS25nbUVY?=
 =?utf-8?B?cmN5cmUwY3JuTGsrMllDcmsyRDNUR1hsV0tqOHNGSEJOM3YrRkoyTEtkRytZ?=
 =?utf-8?B?S01kMUZFYUNUT0VuVWpUTC9Benl2ckpPT2JSVFVZQW8zdkFPUFMza0tqL0li?=
 =?utf-8?B?UXRIclVKWnQ0NWtuc21wam1rajlrdWp0TWdVdnl1aFdhUWRLaTVDb2h6c1N6?=
 =?utf-8?B?RDhmWUtKeGlNSXlEejVQL0Y2dWJac2FqSUNsSk5qbldQS1RYK1JtSVVEVjBF?=
 =?utf-8?B?amltSjQwNVNVYnFvZm9Cbkx0QnpCTUZjUURmVExQdkE1cEt0QmJJRVBDSmNM?=
 =?utf-8?B?bHNXWDNreEtrUXNxb1BYQlcyak5uNkVsVlkwSzBFZVZFdFVxaGlhRXU2ZUZU?=
 =?utf-8?B?ZndBMVNISjNxZDlYOCt6cTZJYjB3cEdSU0NVa1ZpcjRjOE5STCtIRG9tNVBi?=
 =?utf-8?B?TlpMcUZtWEZabS9vbGdrdkRRYmJUQi82eXNxSnJ0cUR3bGJlQmFEMG5aeUpa?=
 =?utf-8?B?N1cvdXEvK1d4WCt1bzdmaXZ5Vlc4SVdzNjVqNzNiWk95NXNId29sQlBsY0U4?=
 =?utf-8?B?RkdsOGxBajlzU3lPQjBZRHdYTWZOVUJSY1JmTSs0V2htVC9XNzBCSU51UE9z?=
 =?utf-8?B?MU9rWmMzdC95TUJhcGFEcEtQWUtNc0oyMDFXQ294ekx3Mm15cXJQZHBndE1l?=
 =?utf-8?B?cTJVRC9QbDFEOE9FVUdCZXZLWXdPSjNHc3ZrQTFVQUN4UWxHZ1ZocTQ3a3Js?=
 =?utf-8?B?YW9ieElYaGxROFd2VHdaR3BXc0tUYzNyWmFTWFhzUkY5cjNaK3JDU3ArdVQ3?=
 =?utf-8?B?VUNzVEE0RFhweUdxNmRRZz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cHdscVZhVklwbk1ESURiQWUrMkJIR3d3bHg3aHFSL2cxWDQ0QUV3T1lvSmJk?=
 =?utf-8?B?amwyZUJrSTVvMkJpUWd2UDRMK2hqSnB0UnN0ZGdBZXUxZ1cxMnRkSHJuaDNP?=
 =?utf-8?B?YWdCcTExSTE2cDh4MFlwRS9KU2drRDRHdCtkZVp3TktCYkNHVXpBbUNnY3pi?=
 =?utf-8?B?cThranF5N0NtY1lIQnJtVnNpUWVBenE1eE9EZEFKK3BDcmh0anl2VXN1ak9N?=
 =?utf-8?B?cUEzWGR4LytabjQrdWRaNUNhaWV1OUcyamgvWFhrcDIyTzB4R1U3RXRoUDQ4?=
 =?utf-8?B?YzBCcmZDMzU4bmhkTXhsY21McEZVNVFkc2VZUnhuUVR5bFFwTXlVVHpwZDI2?=
 =?utf-8?B?THhLSG9FRjhpMk1KMEtKenJXR3NvdVRIL3ZSNTBGNnIwcU85dzBUdUxzejdV?=
 =?utf-8?B?dE1ieDhsL2U1bTZzcVVYVy9qZzhMSnFycGY4TlpWaFdwU1VlTGpNOG1iVEVv?=
 =?utf-8?B?S2RTaHhyZS9OSGRndEU5Wlpoby8zRm13SFpVYXI0blRaYjFobjZrZzhUZk1D?=
 =?utf-8?B?aXREaXIzU3NBRkdvUjk3T0YySjZaa2JjYVNzQlZGL0VLUldBQ0dscXd0VVR3?=
 =?utf-8?B?Nnc0eVlUWmdyem13NVlxRFFIbDlIRzNYMHlDRm90aTNYS1ZFdnBMR3E4UFUz?=
 =?utf-8?B?S29Ub0ZHTmNGdXovZ2l1MkFzQjRteU43S0pVWUVMWHNhN3Z0UnI4ME9Ddk9R?=
 =?utf-8?B?OUtxTWxjQ2hKZW03SER0THJJMGxRZmRRMC9MUWdHeHo3SW00bldEcE5JM2NK?=
 =?utf-8?B?TldFc1FZSUpTYVUyMHNYUHBwcXkvcWZzQ01mRkxPcDJ6SHkrSzk3R1FSTkwv?=
 =?utf-8?B?RVhSSFNyN1Q2T0xpaTBicEJ2alRMK1VRbTNoYU9RRVlScjRlR0ZpQkhrKzVh?=
 =?utf-8?B?YWo4THNxcUk0ZVhPMDhGNmt2YUdEVnNuTEl5cjhjK1d2T0ZoV2xUblBBcSt3?=
 =?utf-8?B?K3pmUjNtSzZWZXhqb0F5THVVczVWM0pEN2ltTndrMFRuai84bWR1bVpiT2sx?=
 =?utf-8?B?c1dybHI5SGd0WEYycXNQMnppa1hFakc1NFJLQW04aUZtVTJvR0JkRFVDTEF3?=
 =?utf-8?B?RDRUSWFmRzlxdVMvcG5tQUp5UklpTHVxdklyb2tCQThnNk5QMWJWcXFzMXN0?=
 =?utf-8?B?ZE53cjRrdkRDL3FhMGVSMUZmSG1OUUt6cHMwMUFoRGdHYlhlbklqemlwb1Yv?=
 =?utf-8?B?cFk4Ty9tWXdYdm82Y2h1U0JwMlYyUEtWbEFCbjhPVmJYUHJZd2tmeVBmTUE4?=
 =?utf-8?B?N2xVSEZPMXhsa3ZLWGxwZkJWM1RKMEYyaHBXdnU3ZTZCa0xYSlRZQ0pDdFFr?=
 =?utf-8?B?b3djNVgxRlFLSEVDT2l4RFFUM1kvNW9pUytiUWZRQkF4VTRsOFlwOVRQbVBI?=
 =?utf-8?B?Rkk2MkN0Wk82QklOS1dhTk9nTXUvNStQYXZqd3hub3NPbm9ZMmUwU0dPb3Rj?=
 =?utf-8?B?eEZKM09BRkRrNGlRQk1DVmlCaGR3cUhJdnYrNFhyTTZ6SkxIS0VSamZGdm1m?=
 =?utf-8?B?RzVEd1VnQ3Z1NmVFVEc5Nm9Xcm9xOUltRkRwb2tYdzUrUElQS1FTb09LWXcx?=
 =?utf-8?B?TWNPQmNURVlKS21sV2hGN2hJcjNFR1BSZ00xOUMzR1htUFJrYmNiZEJvWGZV?=
 =?utf-8?B?WTdWbkVQbVJMTnExcmdmU1ZaWUNCQUZkejZhcmdYZDRqbE1VcFFFdTRFL1pK?=
 =?utf-8?B?c1lZazZwQ1pxazI2dXlscSs4eUVwTWRTaFlnR1YwWEltTlJvZnVnQmVJQlgx?=
 =?utf-8?B?UGpIN1BVajI0eERYR3lRWnJPUlU1MWZMUWVpUmlaOFArcE1mVlhlZjJZNjdv?=
 =?utf-8?B?L09VUlpvMTl4NmxDN0dBMlRIdXB5N0dEdVRQV2V6RW14REp5d1BhUGVkMTBs?=
 =?utf-8?B?VGJ6V0I4Tk10Z2xTQnRaZnFBL0MxQzdsK25XSlFmdVF1YmdRRDZ5LytpWUJt?=
 =?utf-8?B?SDl4SWZxUndBZUdPSkVHSWlDODZ3ZzBMVG1abXZoTmhoQ01hekk3YVdPL25N?=
 =?utf-8?B?MGc2Q1dZanMzd2NUN0swUk04UDNzVHg1bDliQUhkVVRCK0NoTytOYmJrZXF2?=
 =?utf-8?B?Y1RaYkd2SUg4dUxnWDBMY2tvdGhGV1R3OGswRDE1NXlYQ05BRWlhc0lieXVs?=
 =?utf-8?B?aHlQeGk3RnJRbGNoSmlReGNYWkpYNEZTNmhkWVcrbjZWTk9QY2g5SzY2ZStt?=
 =?utf-8?B?SGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4043EEAA7E26CB448C6864D9796D998D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68ea4ae7-8df1-4baa-9040-08dc6df24e93
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2024 17:31:04.7327 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4tDhH0hXYSPMfCkGdkrJIagC2iII2qd020002hUpCArPHOos5BUKGlUA324AfD+l4kWyorgSH62NZp41nJdkGCIpwRq++tsOKIueNYqnpLk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5017
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

T24gU2F0LCAyMDI0LTA1LTA0IGF0IDE2OjM0IC0wNzAwLCBOaXJhbmphbmEgVmlzaHdhbmF0aGFw
dXJhIHdyb3RlOgo+IFByb3Blcmx5IGRlZmluZSByZWdpc3RlciBmaWVsZHMgYW5kIHJlbW92ZSBy
ZWR1bmRhbnQKPiBsb3dlcl8zMl9iaXRzKCkuCj4gCj4gU2lnbmVkLW9mZi1ieTogTmlyYW5qYW5h
IFZpc2h3YW5hdGhhcHVyYQo+IDxuaXJhbmphbmEudmlzaHdhbmF0aGFwdXJhQGludGVsLmNvbT4K
ClJldmlld2VkLWJ5OiBTdHVhcnQgU3VtbWVycyA8c3R1YXJ0LnN1bW1lcnNAaW50ZWwuY29tPgoK
PiAtLS0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS9yZWdzL3hlX2VuZ2luZV9yZWdzLmggfCA0ICsr
LS0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9scmMuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHwgMiArLQo+IMKgMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRp
b25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS9yZWdzL3hlX2VuZ2lu
ZV9yZWdzLmgKPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS9yZWdzL3hlX2VuZ2luZV9yZWdzLmgKPiBp
bmRleCA5N2QyYWVkNjNlMDEuLjdlMWIwZmQ2ODI3NSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0veGUvcmVncy94ZV9lbmdpbmVfcmVncy5oCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hl
L3JlZ3MveGVfZW5naW5lX3JlZ3MuaAo+IEBAIC00NCw5ICs0NCwxMCBAQAo+IMKgI2RlZmluZSBH
U0NDU19SSU5HX0JBU0XCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgMHgxMWEwMDAKPiDCoAo+IMKgI2RlZmluZSBSSU5HX1RBSUwo
YmFzZSnCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgWEVfUkVHKChiYXNlKQo+ICsgMHgzMCkKPiArI2RlZmluZcKgwqAgVEFJTF9B
RERSwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqBSRUdfR0VOTUFTSygyMCwgMykKPiDCoAo+IMKgI2RlZmluZSBSSU5HX0hFQUQoYmFzZSnCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgWEVfUkVHKChiYXNlKQo+ICsgMHgzNCkKPiAtI2RlZmluZcKgwqAgSEVBRF9BRERSwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAweDAwMUZG
RkZDCj4gKyNkZWZpbmXCoMKgIEhFQURfQUREUsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgUkVHX0dFTk1BU0soMjAsIDIpCj4gwqAKPiDCoCNk
ZWZpbmUgUklOR19TVEFSVChiYXNlKcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBYRV9SRUcoKGJhc2UpICsgMHgzOCkKPiDCoAo+IEBAIC0xMzYsNyArMTM3LDYg
QEAKPiDCoCNkZWZpbmXCoMKgIFJJTkdfVkFMSURfTUFTS8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgMHgwMDAwMDAwMQo+IMKgI2RlZmluZcKgwqAgUklOR19WQUxJ
RMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoDB4
MDAwMDAwMDEKPiDCoCNkZWZpbmXCoMKgIFNUT1BfUklOR8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgUkVHX0JJVCg4KQo+IC0jZGVmaW5lwqDC
oCBUQUlMX0FERFLCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoDB4MDAxRkZGRjgKPiDCoAo+IMKgI2RlZmluZSBSSU5HX0NUWF9USU1FU1RBTVAo
YmFzZSnCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBYRV9SRUcoKGJhc2UpICsKPiAweDNh
OCkKPiDCoCNkZWZpbmUgQ1NCRV9ERUJVR19TVEFUVVMoYmFzZSnCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBYRV9SRUcoKGJhc2UpCj4gKyAweDNmYykKPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2xyYy5jCj4gYi9kcml2ZXJzL2dwdS9k
cm0veGUveGVfbHJjLmMKPiBpbmRleCAyMDY2ZDM0ZGRmMGIuLmY3NTlmNGMxMDkxNCAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfbHJjLmMKPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0veGUveGVfbHJjLmMKPiBAQCAtMTM1NCw3ICsxMzU0LDcgQEAgc3RydWN0IHhlX2xyY19zbmFw
c2hvdAo+ICp4ZV9scmNfc25hcHNob3RfY2FwdHVyZShzdHJ1Y3QgeGVfbHJjICpscmMpCj4gwqDC
oMKgwqDCoMKgwqDCoGlmICghc25hcHNob3QpCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqByZXR1cm4gTlVMTDsKPiDCoAo+IC3CoMKgwqDCoMKgwqDCoHNuYXBzaG90LT5jb250ZXh0
X2Rlc2MgPQo+IGxvd2VyXzMyX2JpdHMoeGVfbHJjX2dndHRfYWRkcihscmMpKTsKPiArwqDCoMKg
wqDCoMKgwqBzbmFwc2hvdC0+Y29udGV4dF9kZXNjID0geGVfbHJjX2dndHRfYWRkcihscmMpOwo+
IMKgwqDCoMKgwqDCoMKgwqBzbmFwc2hvdC0+aGVhZCA9IHhlX2xyY19yaW5nX2hlYWQobHJjKTsK
PiDCoMKgwqDCoMKgwqDCoMKgc25hcHNob3QtPnRhaWwuaW50ZXJuYWwgPSBscmMtPnJpbmcudGFp
bDsKPiDCoMKgwqDCoMKgwqDCoMKgc25hcHNob3QtPnRhaWwubWVtb3J5ID0geGVfbHJjX3JlYWRf
Y3R4X3JlZyhscmMsCj4gQ1RYX1JJTkdfVEFJTCk7Cgo=
