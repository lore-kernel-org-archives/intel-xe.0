Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34757D116F3
	for <intel-xe@archiver.kernel.org>; Mon,  1 Dec 2025 20:26:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D896C10E48C;
	Mon,  1 Dec 2025 20:26:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kvjL1vzu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E2E410E48C
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Dec 2025 20:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764620765; x=1796156765;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=/Ka3WjJvJ8+PAYhLSTqmR7C8LZF/Y7k+M1vOUJHyGtY=;
 b=kvjL1vzutY4pR1eZ4X+oHHlFZRUr30Wj8L+LYhlx5tGCSzZO8lT2kOoa
 KL6aOVSuuqETh6a1rl2zq0AessuS/9/6ecHGQaKUQklU5Wf/fvvOs9SBN
 OaEFz21JtGyAIBTaSeNGip8Zo49ojNt4xs+Xx57DiUntJj35j3c8TTDi/
 EyMvBlaI3Cbz+JbfcEVg09ys+SJ2tQKC1cQ0tH8DCC+MFeE7CVnOzVLw+
 4idnyzt2ZxHy6hay0Su4hzLS4LFSWr8DZlklW9Z4RwgULBhRC5vIPO79O
 8ydjyudGI41/eosnz8ZoBOTv54kVOlpKqVLbFg3AoaPk2lMcufFuUZlTz A==;
X-CSE-ConnectionGUID: mqXdgmlTRYa/eDsmukh7UA==
X-CSE-MsgGUID: xAEJSPVrTcWFFo7X2tA8/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="92050646"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="92050646"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 12:26:05 -0800
X-CSE-ConnectionGUID: Cw+rIcdYQiS9EgGhFbfuoA==
X-CSE-MsgGUID: R0GpfNNgTk2i1iUYTXu6nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="194003374"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 12:26:05 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 12:26:04 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 12:26:04 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.56) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 12:26:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xeiHCRXRq7WEUtp29jePJ+p7cYwiYaIWatqIWN8cOHPy7GN0J8tXadAc8KxM52EOXcq+dYERMnbURlXBXYzThc9tafFasQA9FR2MOsgZSW9G9onf/R6aiJiHP/JO0U9Lxf4WZR4thzixrJKP8c6huccJjylHZt/yj/nQ2FI7tQiYMpAmquzYEGN0y/80ozfts4KiLYsCKiabkzfN0fwWnAV7ZQdKJTtGDWbUqRWRc4r3gzK8DDW0w4iLmG0Mes4GMoKyvTWOO1puEvvRCwooyN0+dN2NjDxWr/3imuExS8dUqsTJL1hmnfoefrcBoGuMBd+JwBLIy68yeJgalxHnXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wh01TtziIn6FTV/CwkfdJaotDWf28F5ZUlBZw3WdtLA=;
 b=BlscL0f+l8hvu+kCKjEetiVMYWjdW39MVxSxEgVQ5ODDqIoLs1mffYQkC3uUAgeamRN2v4uaDwcZ0uxJ5nxNOyNwj3aAH4OtJPaUn5OIYOR/KvozBXvMYkiuEyaCtt5btdA8ymDerpwb9n3mlWHOXxLyDl3BYTLL7lMe1O9+OxKuG2ZA/Nmhyj90OjrKEis12fBimrsIs5pPOHjVlBpuOQhqYMZ4ASGb8V4c4YVwAxyxBpzGxb/Taf0FJCzikkNzW4K/zVTLhW0z6q7F6LyNSufD8SPgmeBA3+nlKhtx8Sn2VkV/KE8nqE0CKJPcEoYor8bAs0iwnZSni2jHRSOOuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CY8PR11MB7847.namprd11.prod.outlook.com (2603:10b6:930:7c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 20:26:02 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 20:26:02 +0000
Date: Mon, 1 Dec 2025 15:25:58 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi <demarchi@kernel.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/xe/configfs: free aux. array after storing the wa_bb
Message-ID: <aS351nEwG5YWKC7H@intel.com>
References: <20251129222541.3306090-1-michal.grzelak@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251129222541.3306090-1-michal.grzelak@intel.com>
X-ClientProxiedBy: BY3PR03CA0024.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::29) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CY8PR11MB7847:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a46ecdc-b7dc-4420-368f-08de3117d87e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T0JaNnJNSGY5NnRWbUV3MHlxZGladWlidk1HNUN3dlBncE9yQTVxUnJ1RmFU?=
 =?utf-8?B?ZjFyWWxWandUalU5TTcvVzcvWWRISG1PSmVOTFd4R2sxZmFNZHduV0JFR1ow?=
 =?utf-8?B?OWpqSkxsTU5VSytQdGs5VjdrL2k0UkhQWHhDRHJZQjdZRXdxa2U5OE1Yd1lm?=
 =?utf-8?B?N3dPcy9wRXI2OXg5M2V0SG1aV2VqMzcwWWowYTBSSVJyN2Z6MTFrS0lMbzE2?=
 =?utf-8?B?c1h1QWcxQ3FzbUEzQU9lb2ZyZVR5RVZlOTNWam1nMTB5bzBSbnIzWXpIMG0w?=
 =?utf-8?B?alhoZkVhZCtRQmNLd2RxazFPYzFoTStidmdPcUNmUmdLYzBrWTRLUkRZWU9K?=
 =?utf-8?B?S0VFdThqcldaejVvS3E1MDc5S2RyeVc4K0kydUc0STNKNC9QeWJQVWZ6S1ln?=
 =?utf-8?B?VmxBTS85eXZ4aldUUVVBdmM5c28wVENseUk5SlRCZ1Z3K1NhZEdPdWt3NWx5?=
 =?utf-8?B?dnl4N0VvWS8rKzVDVW04T2I2eWZrOW9RZ1RxZ3J2R3dPVmtiZmdUaVphNjZC?=
 =?utf-8?B?VTd0OG10WERvWmFkcnh6S09lUWdueGhRY25VMkNyYjE2WVc1S1l5Y291TnRi?=
 =?utf-8?B?RklMeGVOdkRYMlFVaUtMT3loT2RVVE5DSHUyT2I2QkcrZFl3Q3djb0VvbXdU?=
 =?utf-8?B?Z1FhL2pLTnVNL0xNSFlKWHM4bzEwWVJkU0Vtdm1JNUNsaTFXK2UzTHRFQmlB?=
 =?utf-8?B?d2tDZkJMcGlZUlFKQ1Z2ME1hRGNMQjRKOEhqM3o1MEVKZ2VidjYzb3JFS2NN?=
 =?utf-8?B?Q0hBcWYzUFYwejgrZUMydUVKUk1ySTBxckZVMlNjTGFsN01UUWJwalVwVDdL?=
 =?utf-8?B?TXE0akkxYUJUZWt6Qk01bUxMYWpTSU84U0dEUVdyQkVjdW4rcThjWU5ab3Br?=
 =?utf-8?B?YWxnVGxaRXhvQmdWalh4ZWtVMlRqczlhSEVEbk4zUlZnNWlhYXFueUxaOUdn?=
 =?utf-8?B?L0ozSzBMWXpuSTIrNWJ2OWxDVDNQcHovTytrblpCdVNrYVc1SWl6Z0Qwd0JH?=
 =?utf-8?B?aGs2UjFmT0VObE43Zm00MzhreTBHRWsvalJMTlFoSm1tZ3RLNytXc2tPWFZO?=
 =?utf-8?B?OXBJcWxUeE9jeU9LWmdtS2o2UXp3YVhES1E5ODIzdmZJRG0zU2xQMm13YkNu?=
 =?utf-8?B?Wm1FMUwvZ1ZLMmY0QnNWWXJhVGlHd3UwVFVBYWtQTjE2WkppUkxVS1MyYVJG?=
 =?utf-8?B?TExJc05DWFh2RkZ0QUVSSndqTW0rdWxVcjlaL1JpZ2xPeW1RNGVabG40K05O?=
 =?utf-8?B?N1NTaGFCL1VMTUJ1a1VMRmpBMHRXODBiSlFlVGdnVkVBdWJGUzV6aHV6QW1z?=
 =?utf-8?B?UVRoWThXTDI0RzdlNWVlZTZMemtpTEo4enJ6QW5yMDlSR3h1eVZxSXphelFi?=
 =?utf-8?B?Y2oyeUowUmxXVGRvZzVhQSs5bGhlam9tVXhublNOSTF0a2Fqc3FKNWYrcHJi?=
 =?utf-8?B?QVlCWG50eFVodTNsQWplV21TQUllQ2pTK0FGc00zRnV3OVNxSDB2em9qcEhy?=
 =?utf-8?B?a0ZrZUsvWkFCQmtEZkxlNDFFNXFhbEZSaGc0SEVWSTByNzN5clJKRnhsMVpj?=
 =?utf-8?B?UGJsYmhNdXFza0NLOXN0Z1RYR21XU1BBZk90NTZ3V3FHeXJoQWFPcUJqbTdw?=
 =?utf-8?B?UCtlNlVLQWlwQy9HQllUZUZGOW1ocnluSDI3Rk81cEMzVi9lOWovVi9yV2lj?=
 =?utf-8?B?czM4Vllmakw0NURDZGRZYjMvWTJRbjRTamMzSmNkZWxYVmZvSy9vZjVNRkMv?=
 =?utf-8?B?TngrUExGQnIvdGk2MFZQYWpPME8zT01ReUh2b0V2Q2s0cU9YaDVXaktHN0Iy?=
 =?utf-8?B?dXY1OEppUXRGdnNlTUlEMDU0TlZDV0hWUkFBOUIxQWp4Z0tlOU5pbFI3dzlm?=
 =?utf-8?B?NVhLUkRUeldwelM1K3VsM2toT2dsd1lwLzUwaXpOVkNnOHJydnI1R3dOR0FF?=
 =?utf-8?Q?18uGxDuhMU1XSkFDcXEfUTcmaI0DwHmd?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R0M5UXptWi9hR3dxMXBMWFRjOVJBbk9ENDVibklvTEF5RWk4bWpvbC85TU9r?=
 =?utf-8?B?VWY1RW9xQW9ncFZzTWpibDdCZkNyeEN6dkF6SXl3NlM5SkQrS092V1R4Tlp1?=
 =?utf-8?B?SHoxTjZYYTZ4QlgxUEp1SkY2dkNQZ2cxVk1ZeE1SdWNhSFRKU1RVSy9DdkEw?=
 =?utf-8?B?M1FuS1V6RTh4WktlTjRoN2krZFZPY2k5c3RrTDdtRjQ2U2I0TTU1M05YY3ZC?=
 =?utf-8?B?dGcza1BiVmp0YjVpSEx6Yk9iQkhNZkhvVkNuTEEySFpyOEorQlhiUTBDcnM4?=
 =?utf-8?B?SFpJanR6ZzhPekR5WGFwRitEMlkzd3ZyVWE2UjRHM1lYamdtK3RIY0VkVkdm?=
 =?utf-8?B?Sms3SXk3cDlKdW1IMW5vSUNRMWhxdUFnUkpBN1JXMStMaHJiVjNnVU5NQ3pv?=
 =?utf-8?B?RW52S1ZLQ2JoNDQ2TVBzNFEydUwrQnE1RS9MMTBVYnhJNmdiYkZHVXdBeWll?=
 =?utf-8?B?UklWMWIyZ2g5NXRnWHM0enFiZ0VxUTBMdzdkQ2lUZ25GRkF5Z1JPdkIxSW5q?=
 =?utf-8?B?RHVaaVRNbVd1YmdNZk5SRmp0V2Y3S1oyQ0wwclRPdHhhRTBYMHUzejlwM3cy?=
 =?utf-8?B?c2JCeGxRTGludHRsMnBNdDdqRGFhSnJVWWdFajdnWncyNHJqTEhNc0tEZnUx?=
 =?utf-8?B?R2I0RnJraHdscjJkTGVaTE91dE40V25UL3AzdHZxKy82ZmhZSzVOTnpGUTY2?=
 =?utf-8?B?VStpQ2o3U3M4cEU2TWpVUDErbDBjU3F4aTMzL2VhdE40QTZXbWtubFpOQ20w?=
 =?utf-8?B?Q2htQVRVclJiNWhHV2RWb1hHWklYbFJ4d1E2eXdqTkxSeTFhNTFZdHdvWmFS?=
 =?utf-8?B?M0VCanJ0SzNZMHBETHZMVVRQSHlzK3ZkRXIyZTQ0SVhxdEd4cUhsbWZIeTJO?=
 =?utf-8?B?NHkxTXVBemlqcDAyeU5vRTQ4UUdXSGRZcFU1MVM2RzVzblRIOStmdk1BSWlH?=
 =?utf-8?B?Q0FCMDJYTWsrWllyNDdncmlHRUJkbXM4SzFBc09KdDlEYkJ1VExpVlZTMmNG?=
 =?utf-8?B?eGNGWHN1a01FUUphaTFBeHBJMnJNekptcXl6ZEdzcGZkZzNaS3RubGZROE5K?=
 =?utf-8?B?cXhaSWhlK0Z3Wi84Y2lKVDlFMEEyTnNBai92NzZERzZhZER6dUdWYUppc0gy?=
 =?utf-8?B?QkdoWnBRcVNRUE8ybVNxWXZ3ODB1WDlPQk83VXZoNjk0R0NGNm81YlZWYzdt?=
 =?utf-8?B?Mkt0U1Irbi9UaDlFamdvUGZhcjdUVjEzRi9xdUd5Ynh2ejRkNDFhamVMVjQz?=
 =?utf-8?B?ajdCYnU2ZW9sc1JiSzVtV1FOQ3RBanowVmJCSEFXWTRGT1N2NWdNZTF5WDJp?=
 =?utf-8?B?S2hTcmE3TWRDMlI2QUdacUYzcFFGOGcwZk9hSnVBTDN3dC91MWVVK1B0ek9u?=
 =?utf-8?B?aTNqamY0N2xicisvZDlTMm1qU0IxdkU2L2NjdVowVHhDT2ZKRGhaWSsxTkdC?=
 =?utf-8?B?UHBNZHFxcFowSjRUNlhMdkVIdi96T2VrcCtLeitFTmdvSkczVGYvL1B3eFB3?=
 =?utf-8?B?Vk9wVFJyS3RNSTZxNmNHWE54WDdyNDdoU1FGc3ZDdG5KMmd5VXc4N3VicjIw?=
 =?utf-8?B?RThiMmxEYzB4eUkvRzFLc2RlcWpoVVdWYXdQK0YzaE0xME40ZlVtNUYrUFNO?=
 =?utf-8?B?WEdSZFdJSzlSdUFuZTVVVDVjbVVCZ1ZMMXNIeHJidUhaN3hLck1oMUdZa2da?=
 =?utf-8?B?Q3lzUStzSkRKZjVRdUNNcnpPdFJwL2xJWStMaXBxRzZDWEVvVVo0UW1pWnhy?=
 =?utf-8?B?aGdWd0lDRUxvNE5VMEQxbzRnUEpqVEhOdUhpNWVhbnc5V05IdjRrSG54UnJl?=
 =?utf-8?B?b1dhSkg4bUxzUzZFSEhOaWY0ekROaVpMUGp5WXBMUmtXdm9iWmtkdW9oK1Uy?=
 =?utf-8?B?MkhqVEhUb2h4R0dnc3pOY2JoK0FkTkZ2RGM5Nys5MURXcXJRbU1qZHIzWVZk?=
 =?utf-8?B?VHNWVU9oTVZQeVNncDVaSUVrbGlKeHUyMzhZay90SDRvaGVRcmt2Y1lqL3Uz?=
 =?utf-8?B?Ny85VFJxOGlabGQzZFhScmhUR1pXS2YxakZNMEM4ZFdDWVc2UTdwM29pYnZU?=
 =?utf-8?B?MVp2N0VENWpEVjZvelZoTEVNYnBqVWM2aTdtVzhzR3kwekJlSXRQK0RKTE9i?=
 =?utf-8?B?ZGFUN1Bqdkc4Qnh3bUsxVEUyb2p1SnI1NTRnUDRmUHorMEdlYXRKN1VLZFZY?=
 =?utf-8?B?TVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a46ecdc-b7dc-4420-368f-08de3117d87e
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 20:26:02.1331 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UVkmaY0W8nho5EAN4Gxn4ZK82oFDwuAzd6LCZDQ/aofk597rsTvNZfKYPOyg1SPXVdZbMdy1BvGzGNtiii8rfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7847
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

On Sat, Nov 29, 2025 at 11:25:41PM +0100, Michał Grzelak wrote:
> When commands issued via configfs are executed mid- or post GPU context
> restoration, a temporary buffer is reallocated in order to store all of
> commands of varying count. However, after content of the buffer has been
> copied to the desired location it is never freed, which causes following
> memory leak to appear when running igt@xe_configfs@ctx-restore-mid-bb:
> 
>     kmemleak_alloc+0x4a/0x90
>     __kmalloc_node_track_caller_noprof+0x645/0x9d0
>     krealloc_node_align_noprof+0x206/0x3c0
>     wa_bb_store+0xf4/0x2c0 [xe]
>     ctx_restore_mid_bb_store+0x21/0x30 [xe]
>     configfs_write_iter+0xe6/0x150
>     vfs_write+0x231/0x540
>     ksys_write+0x6d/0xf0
>     __x64_sys_write+0x19/0x30
>     x64_sys_call+0x79/0x2350
>     do_syscall_64+0x93/0x10f0
>     entry_SYSCALL_64_after_hwframe+0x76/0x7e
> 
> Deallocate temporary array upon finishing the store of batch buffer
> into wa_bb.
> 
> Fixes: 39ac06f7006f ("drm/xe/configfs: Add post context restore bb")

this hash is wrong:

Fixes: 39ac06f70062 ("drm/xe/configfs: Add post context restore bb")

> Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_configfs.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
> index 9f6251b1008b..f9a64352138b 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
> @@ -789,6 +789,8 @@ static ssize_t wa_bb_store(struct wa_bb wa_bb[static XE_ENGINE_CLASS_MAX],
>  
>  	memcpy(wa_bb, tmp_wa_bb, sizeof(tmp_wa_bb));
>  
> +	kfree(tmp);

hmm...

do we need to change the kfree added in the xe_config_device_release()?

> +
>  	return len;
>  }
>  
> -- 
> 2.45.2
> 
