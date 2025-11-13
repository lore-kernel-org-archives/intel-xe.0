Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10092CD8CB0
	for <intel-xe@archiver.kernel.org>; Thu, 13 Nov 2025 17:53:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF4DC10E8F9;
	Thu, 13 Nov 2025 17:53:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FrsGjzJr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BD0310E8F0
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Nov 2025 17:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763056405; x=1794592405;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=49RFfvkV3Wp+283p3pG8zjTjgIzZvAzjKImpqd5bdww=;
 b=FrsGjzJrZrcyABiaQdAOa/YdDFnM9M/L7q1IquwH1yukeeyghUC4aMB8
 vI6CPGPiMrv5cdKUg4HcZpYM1HH97/IsP/GTDUh9UZZXtV2Wuhj9Wq2Ro
 PUMzCumIEF1UnKv01JvhSkgP9L//Bj3RUbi5tUw90onlyPVgDvJS8ZN52
 T0cwYTue4VHjSlR3SvJYtOsstyvM3KRMF9UUfsYsVogvwNW8lzHHRVKil
 ioFVznPJA3pTn5rR2aHmNimivrtggFsxRySlzMsO4D4nSjXSKTRZFgzwT
 Sb5G8QGQkrSRCTxE81mQtMuknmuR5gRahS9xVTe1yKjWgDSq9DuvGAKrh A==;
X-CSE-ConnectionGUID: +ou7bZcRR22udheSNRh8AA==
X-CSE-MsgGUID: W19gwfkUR0iDjif5Q/wgFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65073495"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="65073495"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 09:53:24 -0800
X-CSE-ConnectionGUID: PFYOq09ISRS9gNhxb3Q/Mw==
X-CSE-MsgGUID: Az9M9DNRRDyy8hq0ObXdgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="220389444"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 09:53:24 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 09:53:23 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 13 Nov 2025 09:53:23 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.65) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 09:53:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t5HLEsjFneMNeJ12TDNf5Z9JXIMawueOQY6ftyRqlTZxa83f91ed6npPBINKYR6xCUVBzDVvQ/DVMhHfdM/v/mDbPsaW0weSZwVaqeILkUma2XAiIVI2qmyBCQvy710oaUf6bIxPoZPJXExmgMDJiKu0BOEVk4WWltrl/EXlyGyfcbTFJMtFeoYDPmDybXoL3x9VofDaNisVVH399TsVsT0gt36HuHCmw8aMEJI3ZDK8oxSSRIZ07ZYofrhEW3oudaq97XsGcT9TWNsx7yrzkt6GbopWEGRf/qfv4lYj7VfVl0loZRV/Mc+dCGHJ3TeVPJEX26wZBVDOlFCPtXHfiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ULSQ/RATig+nnaL7UDWdwKzB2JuZTW4Gs4zx9vTl6zQ=;
 b=e9OnOtky5ZRlaz1RqD6leoe6x5oJuBY7SBdzKAO7qfizIZiJcmKUch/Ex+tndwYm2ip4Jm6zdZCRv6di+iLzF1TesZAOaz9Ms+7WRDBa64O3VvvGHxJMUnTtOh8WAeLEKStZG4S1lZi1GiRrkDPoom9KVh9YKr4NF9rB07qQjCbtNymJ4atDh/hVbdTQn9UuflII/aMETja9XvsHKoZ2b0oXmDJ+dxR7uPGC5EjoN4prqXavaT9zfKCKukLmmJEdjfrGw9pTkAfnUe/ymKITYpSyVKPCcojzm2VGb4rQ5yT/cW4CspKL9jKcOLqcPsKtbDn5IJwJbt63xhb0AWOs+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by IA3PR11MB9158.namprd11.prod.outlook.com (2603:10b6:208:57d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 17:53:16 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 17:53:16 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251110235715.1489543-2-matthew.d.roper@intel.com>
References: <20251110232017.1475869-55-matthew.d.roper@intel.com>
 <20251110235715.1489543-2-matthew.d.roper@intel.com>
Subject: Re: [PATCH v2.1 23/30] drm/xe/vram: Use scope-based forcewake
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <matthew.d.roper@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Thu, 13 Nov 2025 14:52:54 -0300
Message-ID: <176305637406.3698.5752677659484293201@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: BY5PR17CA0004.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::17) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|IA3PR11MB9158:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e0bf587-e975-4ad1-02cd-08de22dd857a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QjZnclQ1U284OVdxc2hPeG9QQ0JiOHQrRW95QjlJc21NRDZuWFQzLzRwMkZ3?=
 =?utf-8?B?N3NHUEphVzlXbG83aG5YYk5ReGlzL2FUdmhqZVdKenpqL2NBcHlzWXg1QUVt?=
 =?utf-8?B?am9OZDY0YkJSU3N0WE03NTE0ZTZEVHlOaDNFenZJZ1hCS0tudnN2SmUvZ0cx?=
 =?utf-8?B?TitvY21wYjhLVGdKYVpueDZTOFowSXpaYjZiT3M0V25hUmU4SjhGUFpYajVE?=
 =?utf-8?B?QWo1Q2NJYWV5N1RES1NJdEcvNUx4QUYya2ZNeDNPQ3RTSk1oTk1tSmlwNGlX?=
 =?utf-8?B?ZmhycFNrdVpBM0FYOUdmZTZqNUlzUXRNZWpPSjZVWnJ6S0E4NE5IZm0wcGdq?=
 =?utf-8?B?NjZ1Z00zL1Bxd01TWWh3RzVvTVREZE1OYUNNNS9BU0MxdWFMQXFxVWcxYit3?=
 =?utf-8?B?WFo4UkRFeitBckw3dGxYQUQzYjRsL0Y3MVd6ZXpvbS9CWTVBaFVWWXlFUEoz?=
 =?utf-8?B?VXBUQURhcWV3NUxLREUveTV4OVhYWkpWeElrMzRYeHZVZ0ZSYm8wNXMvZzBj?=
 =?utf-8?B?MlkxTDlYMzRXMlF3RnVuMTlDVUFtZjV4UUtFQWp1VTRmZVkyaTRtdkQrSXg0?=
 =?utf-8?B?WXc1cjh4NTdubElPU21Ca3V6K2xQV25BcXMzMDhNdm0vMnFDa1NjQkJQTGRI?=
 =?utf-8?B?L0NiMys1akJneVM4WmdwSjFOWEhsYXBHV2IrQnN4T3BNUnc4SHNsb2M4QTEy?=
 =?utf-8?B?MDRHNDBFbVJSZExZUlpqdkkreUJLUjNxQitZK1FBQWVVamdDd1lMaGVWaktG?=
 =?utf-8?B?NElnNlQ1SWY3ZnlKekdLdlZmTDZEK2hIRHk4ZThoR2hRWGlBRng5YTNXWUt5?=
 =?utf-8?B?NVEycUh1bkJMNmJtcStrRHArK3lqWjhPdkE0cWl2NWhSQnZPWkhBNDRrY2tP?=
 =?utf-8?B?WWY2ZTNVelcxNC84d2R0SUtzYTdXWXBHRVZYSXlFRW9kOFVETEd3WWZjbVV5?=
 =?utf-8?B?VmFlenZ2cCtsb2pXVXNHVWlDUWtCQkM5T3hXNUlMYlNNSTVzVG4yZExRSTJy?=
 =?utf-8?B?WS9KbSthK09XQ2dpcFk1eTlJVHl2MzREaDVRQ1RaTmc3aWFPdnBsaDNpMjMw?=
 =?utf-8?B?S3FVWE95bjRUVFQraGdtZENsT3FacE9UdnBGN1pseGxPQlk5V3NnNHgzT1Nu?=
 =?utf-8?B?SzJVeVE1dmMzWHFMVGNGT3Z0RXNUdFZVZUlIKzVnQkRUTWsraDFPMUUxSGx5?=
 =?utf-8?B?dHdGVEh0SnlrMVIxVklvTHB2YnVaWHRXZjI4TFFsOE5uc2JlWEdjeE5ieGlT?=
 =?utf-8?B?WUc4VEk1RTdBZlNUaThaYThPbUw5Qm5GSTNpKzYxSzkreFQzWTUxVllPM2JL?=
 =?utf-8?B?eStWSEtJbE90V21CN1J0ZHl2NG1ET1NJOEF3RTlOcTNQZW0zcjlsUmRFTXJD?=
 =?utf-8?B?dW5OL0xhWXJOcGhYTFp2c0JtMGl5dk85bXVzWG1Mb1lFS1dOemppWlZKaUpL?=
 =?utf-8?B?ZFVYTTA0cjcxdTBJQVpGS0JNTTFoRHZMWkxaM3crbE1KQ014Ull5NzFhYXNS?=
 =?utf-8?B?V3RSMVlseVkybnpMWFh2Y0xGclVpQkxtaVNvelFBaUU0bERQVDRRMHJOMEhU?=
 =?utf-8?B?N1I0cS9aSTZzNzlnaXFkR0N2aTVESXphSnhTNDJ5alV0dVd1SlBGWkUyVGNm?=
 =?utf-8?B?VWo2RittYXVMUjVmTHRMVlBLWkNKcU82NUZTV2ZUZjBRKzNHUEdTV0JDL3R4?=
 =?utf-8?B?ODBCUWQ4cGZPQm1oYktpOGs3aHdsTUNTZTF2YzIvcUF3WmpXSWF2NVd1N0h3?=
 =?utf-8?B?VUNPM0NWY0V1amJYc25keUxvSTAxWjhqQnJHcWpwbER6d3FHc0JmYW40YTRk?=
 =?utf-8?B?cEtka1ltU2ZtRlk0Smx5dk4vSTdOUzZJVnVLa2E4dGVoQzNkcjJBSFpMd2tG?=
 =?utf-8?B?T1BlNmV5bCtpSTBLaVdYWXhTeFlRSkhIbDlHdUxlWXIzdnlXcE13YitROG1M?=
 =?utf-8?Q?CaxfRZi37uH5NiuH2h1yTejJbrk1VJ/r?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YTJWWnhNM2RTSUUzSlhyTTBCTG0vTVI1c0FnVHM2V1Y5WlN5NVl1QXNRRXI3?=
 =?utf-8?B?T2MrNHJSN0dMcW95KzZlcTUxV3hSSkxxZmNhd2hoT3ZKOHRYdWdDYmtsT3pp?=
 =?utf-8?B?cWNnb1pDdm0vU2lsMzVTdUNoU0ZURDNvc2l0WUhXQmZMRXpFeFkxdFljS3Fj?=
 =?utf-8?B?NEJ4cUgxM0pna0oxdVhZZVhWUGR2OFlITXhmd0lpS1RKcjIxcUpoYVhhWUZa?=
 =?utf-8?B?VHdudGVzeDdpTi9oVDV4ZmZJSWo3eG5FQ1l6K0lxOHRWTVNwL2tJWGVVbTFu?=
 =?utf-8?B?SU93ZHhwQlFKNTdLaFpqVE5NQWNIbG1LU2NMZ0RLdm5LaXZvR0lpaWtvRzhh?=
 =?utf-8?B?TEY1NVlHbmlQbVNEUjFjQXl2Y0ViNGhwQmNsRDBUTkthN0ducjM2WFhsMUlW?=
 =?utf-8?B?U21RNERIZTZGYldxVW9OdWRxV2NEeTNoajFESW5tNlRlQVdXOGJQOWhxQ0Rz?=
 =?utf-8?B?eUVLRnpoUkVoOGZSSHVjZzVCUXNNZ3EyS3YrdHJwSTlqNFRCdXFHUWFZZFR0?=
 =?utf-8?B?V0VMZHVBQlNoWllKQm9IOXdzMWR4SnduR2dKdmV1UVpobGxrd052ZFVqNHhS?=
 =?utf-8?B?ditQdVUvblFIMnN0TlJpeHl3ZXh2S2V3VDNDT3YzcEVlUzlwUHF4dWtSYzJs?=
 =?utf-8?B?K0tVWGpscFpvOCtOSStVYlVvTnFTQUFRak4zd25Tb2JuOVQwTUxOK2w5K2Ni?=
 =?utf-8?B?YTVXTEM5ZUZwd2lvZjFQbXdxVStIRFpRN0dUakpwcHNGeFhwMWNoaksxcnAz?=
 =?utf-8?B?NVQycmVVcWJib0luM2FaTzN0SC9ldW5tOC9kWEdXR3V1UVkyY0xUcWcwc3lV?=
 =?utf-8?B?RVp0VDBtR1JzTFNjL3kzNHdUNy9zUHplOE1rbjJJdVhJT0R2Ryt0VUhBRHM3?=
 =?utf-8?B?cmF5aG82bXFKSlZhNGdZU0pTRjFzcnl2YjNJT3Y5czFyTkozV2NrSEs4a3BI?=
 =?utf-8?B?QTRibFFiVmp1d3dWODNCaXUzdGNaREptd05uOGRwQ1lmVVRYV0hmZGhwQWpB?=
 =?utf-8?B?Y1FMZGFtUmRoTDVKaDRreGpSRmN6bU5wWm8rU2tWOWE4UUwyd3F3QldmSDRW?=
 =?utf-8?B?VVRVcFI0WjFFWm1OOGxHb0V5UmVOdGtKb0s0SmVQMHBsbEF3N3VxYjRzUldR?=
 =?utf-8?B?SEZHL3FDT0hDR282NENVaWI1d2xyY1R1TDVmTzAxSTh0TExuaTIvSjVXYUFD?=
 =?utf-8?B?bzFUVlFITkpXOTFQb2lYVFgvbU9JWnhsSHZjaEptNDZNRDhPMmIxYThDZEZy?=
 =?utf-8?B?eDVZOWQwYWtOSWphbkVaZ2dwd3MzZTlaK0gwNFc3VlRlSFlBOXhBY2dxZ1Jh?=
 =?utf-8?B?bkhFeVZaa2J5TUx0NGcvRXd2UXNuNnZ1Z0xsckRzcmRxek9uVlM3cFkxTUY2?=
 =?utf-8?B?aytMcHZwZ3FPWXF4ZWpLdEpyeVFsK1NleXJjc1JoTlc2ZUlJQ1d4VkdJc0hE?=
 =?utf-8?B?RWsyUXlxV0xVMG9NbTdBbXFtL2EvSVFJejdDSjhhckxNOW1NTzk1Ylk0R3F0?=
 =?utf-8?B?SEZHVG1tRFVLMG8yY2o4YXAyeENWS1g1bXRnRmNobDNuLzg5SHppM05pOEEz?=
 =?utf-8?B?ZGtMdHhVd1lIZ2V0N25KYXpRbXh2cDl3Tzd4RWNCNnBhalpxaDBFZ3lma0dW?=
 =?utf-8?B?RVRtTHIrbyt5OE9JV3NCYVN4ZURyMUlpZ0RpUWg3eFJxc2RjZmRDQ0lsVTdk?=
 =?utf-8?B?Ym0wSXRqS25wK29kbS9oTkFPTlFCV2U5Nkh1blE5SEVEQjZJZmQwRmlWLzRP?=
 =?utf-8?B?clN2YXpyZWlEdkJHa2ZRMW8rdTZoL28xNGx6cWlhYUE0cy9NeUdRdktWRVA4?=
 =?utf-8?B?TUZ5M0IvM3NHMUtYVnFPQzEzaUJUNEwyQytkUmxNTDcxT1ZhQ1FUcks0K0hO?=
 =?utf-8?B?VWFWNlQ4N3I1dDUvUEthNWVqUVpUWGh0cUNadnVQU3dPSTZjZEVzR215b0hS?=
 =?utf-8?B?MmFhWGYrL1B2NnB4UWU3bnpUMUY1aEVvMW16dUVlbGJ2RGN5d1ZKaFNKd2E4?=
 =?utf-8?B?dDM2QkpzSjh3QjNqNmpJTkxsWVlTSzB0Rlc0TlRZSlBpOTJHcU1wMnZ4ckl5?=
 =?utf-8?B?QWFEQ2hCbnd3MUJWdnFYaCtLYzNCUjFuOUMrb1dWSWpqVndTUU1SU2FkZzdZ?=
 =?utf-8?B?aFlQU2hoKzRqVzJna3FjQkkvL21CNGdlbGt4RExld01lMGhoa0tSd3VHemVS?=
 =?utf-8?B?b1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e0bf587-e975-4ad1-02cd-08de22dd857a
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 17:53:16.2386 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D/Fxcc0Wlr4ZnCaewZctISMimjhuH7EekviXCl3nk7ZoT2C8P7LRz4WSQwPBvrwpjApokBe2abn9zL2wQ8dO/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9158
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

Quoting Matt Roper (2025-11-10 20:57:16-03:00)
>Switch VRAM code to use scope-based forcewake for consistency with other
>parts of the driver.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
>v2.1:
> - Rebased again to resolve conflict with latest drm-tip
>
> drivers/gpu/drm/xe/xe_vram.c | 6 ++----
> 1 file changed, 2 insertions(+), 4 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
>index 0e10da790cc5..0a645e76e5fa 100644
>--- a/drivers/gpu/drm/xe/xe_vram.c
>+++ b/drivers/gpu/drm/xe/xe_vram.c
>@@ -186,12 +186,11 @@ static int determine_lmem_bar_size(struct xe_device =
*xe, struct xe_vram_region *
> static int get_flat_ccs_offset(struct xe_gt *gt, u64 tile_size, u64 *poff=
set)
> {
>         struct xe_device *xe =3D gt_to_xe(gt);
>-        unsigned int fw_ref;
>         u64 offset;
>         u32 reg;
>=20
>-        fw_ref =3D xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>-        if (!fw_ref)
>+        CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
>+        if (!fw_ref.domains)
>                 return -ETIMEDOUT;
>=20
>         if (GRAPHICS_VER(xe) >=3D 20) {
>@@ -223,7 +222,6 @@ static int get_flat_ccs_offset(struct xe_gt *gt, u64 t=
ile_size, u64 *poffset)
>                 offset =3D (u64)REG_FIELD_GET(XEHP_FLAT_CCS_PTR, reg) * S=
Z_64K;
>         }
>=20
>-        xe_force_wake_put(gt_to_fw(gt), fw_ref);
>         *poffset =3D offset;
>=20
>         return 0;
>--=20
>2.51.1
>
