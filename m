Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFA72C44500
	for <intel-xe@archiver.kernel.org>; Thu, 22 Jan 2026 11:09:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FBEF10E97A;
	Thu, 22 Jan 2026 11:09:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YTocXZYI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64E8610E97A
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Jan 2026 11:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769080166; x=1800616166;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ne69frETP+7/E291MJvimx3kgHxR7YqhpMcDjyfQz4U=;
 b=YTocXZYIhg43ojwcOqz/xp0kOKRb0KIFGES23+vGR2XjnyDzl11YNfOI
 oMo3jKvRQIvjK2P51x5merPF4D6utkf45eUOv2NmEIS1CMDHDgF/yjfZc
 hZNIbQfY6VMeG5cJKEcV/T5dxKBFJvqLMJLHEy4gOjuv3CVIvttOCznZC
 ikIllV7NKKtINp6O6sUd9RkMwHnAaLpYZ8Tp620GnCFoPpkuYj7GNLbSv
 +l5S9EFknhp2bgNjQ0CFl2vG8uOBkrMSpL1aREnBqOg4Chmw1N2kQUUPM
 QkRJ7AFEXGaO4cOs7QwUf6iaCh7++IRJgUbyYy8k411gwz9TGcO2HdSb5 g==;
X-CSE-ConnectionGUID: PXI60SZLQJOMWNUhOVcJjw==
X-CSE-MsgGUID: R6heVzD0QaaEXBjQO9GVAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="81430468"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="81430468"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 03:09:26 -0800
X-CSE-ConnectionGUID: TJx4g4/lR/SV0norXOMhmQ==
X-CSE-MsgGUID: 2TbJu2SrRyCxxaGVEb0Aag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="206610638"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 03:09:27 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 22 Jan 2026 03:09:26 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 22 Jan 2026 03:09:26 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.21) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 22 Jan 2026 03:09:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=waoROG0ZTCZ5bboTrmn3i9ltosWMaOD6AsXRnLy54DTjVLHrHfNJaJ8XIcEXysOq9Mz25B/qNVVrJVSeDEYnH1YmALR2Lips/ePmfLRy+iNVmWDVzQ+cAMwoFSoNNp8+7/s8XUMGXEiN16z4Mc5XDouzuy/RehZZyl/Jhqtnyr26SpZY/Aj3jPBcKUlYKEo107opAR24N7rz5MMzjS50WBAk+/m2fS0RxvLSersfjnOzm8Yo1swhN5X9dQKrdWRaou/WPOuZ2se++3932FBEtNCP/bcJcJ+irNRbBXMsMQ94Uf1IdOsm7yJ+x6ecyK1sNlmUD+HwmwjeW2PXdIeK1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ojz3yj6vj+pRBPRkgV3ReSAbXv9vZ4pw59kZwomN7BE=;
 b=K/c6Hd1OjnWMI8JwJVU/yvBfO5seaP+Dn+iTEtki/CmA2s8BIhK+dvOtk0aLlG59+3JlX7rIgptkkRX+BQjqCNpi16OYq7X485K8kt2F4qTFJP8Ra2OpZ3zCkUcsBAvD0neQR7qudktaZXQYuG01J8N7/1dvkFGM9noV3+zSmnCrYP6RIKpNq0gVqKZtXMrKUjKvHg/zNxkJF1nPBHh3BRbwjlFSJwjXBdM4R0NclT/riK1y6sSTG2StQqnkE8ATPDDlnGf/hKyyTMnDsBtxDQR11al8MeKQIKHMa1o/dxPm8If9/rwNInpsrzjAOo+NQkPqA0yvd7F2iZX33VauXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by PH0PR11MB4807.namprd11.prod.outlook.com (2603:10b6:510:3a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 11:09:24 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%7]) with mapi id 15.20.9542.009; Thu, 22 Jan 2026
 11:09:23 +0000
Date: Thu, 22 Jan 2026 16:39:09 +0530
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <badal.nilawar@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@intel.com>,
 <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <matthew.d.roper@intel.com>, <michael.j.ruhl@intel.com>,
 <paul.e.luse@intel.com>, <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
Subject: Re: [PATCH v4 3/6] drm/xe/sysctrl: Add System Controller mailbox
 implementation
Message-ID: <aXIFVVJPDIy7TUaR@soc-5CG1426VCC.clients.intel.com>
References: <20260119132938.2173032-8-anoop.c.vijay@intel.com>
 <20260119132938.2173032-11-anoop.c.vijay@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260119132938.2173032-11-anoop.c.vijay@intel.com>
X-ClientProxiedBy: MA5PR01CA0035.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:178::11) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|PH0PR11MB4807:EE_
X-MS-Office365-Filtering-Correlation-Id: 12ddd9a6-0131-4316-149d-08de59a6b2fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cDJYYUNxNjdFK05hNXl0V3RVdXE0cmhOUFk4bjVjYmkrR1VyT1d6NmdRQ2tM?=
 =?utf-8?B?RDJqWTVydHFjbW8wVDFBYzVUNlBXaWM2emFUVm5CM0NKRG5DR2toQmdGOGg3?=
 =?utf-8?B?RnVsNU5mMjRLMDBhcStlYTNVeHhTUHU1c05jRENQRVowTEZqWTlKOC9wU0ZE?=
 =?utf-8?B?N1pEbzc2SnR0enhveUR2VEFHU0Vqa280dmNUUUVNYUhaOGh2K3VzRVR4Tm44?=
 =?utf-8?B?TXpHNmY3Q3p3RmtlV3Z6MjYvVGR3QlJxcWVEdys3NEtTZWJWSS9RYWNaTWNB?=
 =?utf-8?B?U2JwaytNRDgvMHFLdHcremVBYnRXbFl1ZkxyTi82ckZlYzJ1VnFHUytFUE1i?=
 =?utf-8?B?WFhnMG1Cb3BLMlpCZVhZbTI1Sm83bjR2Qkp3RldZaUNBTWRIbFhPRWpyVTYz?=
 =?utf-8?B?YjF0dFVlRGhCbHo0RkZMU1JUY2h4dGhOT1AwSUlGNXk5VE9td2xrZithWEhl?=
 =?utf-8?B?dmNTTFhvUW13cmpOcmZ3WGxkaHJad3F0UURaekMraE9Hdml2SjRqNDFNNmxy?=
 =?utf-8?B?QlVMYXl1YnNNcmZNM2dYM0hJTW9WTXpPRWVkVWdqOXNVRTg0U3ZEWEJLWnlD?=
 =?utf-8?B?d014Tjd3K3gveUwwY09xTCtyVFkyQW9EOGR3NUw3d1VkMjVKeThQRVc5NGtr?=
 =?utf-8?B?clZEUGxQRlJsUFRZM1ByNmJSUG5yWXQ0NmpXU3U2MERTSEhWelJuUkgrTHc5?=
 =?utf-8?B?bnR1Tm1WR3oxM01BUVlRVWxHcGE4ZjhtSkkxMXFmRHh3RVlGVWVJQkQyYk1B?=
 =?utf-8?B?MjZRMHJNZWtEd0djWWpjQjhQUG9nREVFdE14VjVnQllYV2huWjJoV203N3hC?=
 =?utf-8?B?bno3czhUOEh0QXh3VmxrOE9nRElTMGtNWTJWbi9uNE4vdXZrS2FBUUFweC9j?=
 =?utf-8?B?RERJYW5JMGJ2Q2ZTM0haK3NmTVFzWW1pK29qM3JhZWUzTDNUVWJTczlBVXI3?=
 =?utf-8?B?QXJ2ZEZ3MkUzV0xQaEpVRFZEeWEzSDBSczR1eS9rTlgwd285dWJrN01iUStq?=
 =?utf-8?B?OUFNZThjNG1Dd0FpVUpjV0tyaFdkamZlYWg3WDRSOUdSeTJQQnIwbS9VdVhj?=
 =?utf-8?B?VjVpbmFqMTNJUmhCZnVQaEdKZFQ5VlFoVkdKZ2Ird1RsSEdaSU80UFYyLzNp?=
 =?utf-8?B?OHRjZWxkT3Q2TytSQncvd0xtejBIMzFCYmNLUWRSZXhFZ1JKSm1CTWpIMFll?=
 =?utf-8?B?NUx0ZVE2NFB4T3FEcmxJL0IvK2F5M2RETEhtYVYzSytjSVhtdXNmVk5JNWQv?=
 =?utf-8?B?T3I4bEd2UzAvNUJLSjh3YzMwSEpEZllKVWg1ZDJSUlJRNU91L3dqa1pDR3VG?=
 =?utf-8?B?eEYwRFhtRU1JeTA4RHlYdHFYdUt1OVZQVWIwRFA0RUI4RUpvajVCRkkvY01q?=
 =?utf-8?B?ZCtJaTd6ak8yRWRuLy9sY3RoV25jU2RXQnRKWCtvVldvQmFnQjd1OExaOElP?=
 =?utf-8?B?MVExS0Z5ZldzK2pyOU8xMUlPU0puc0Q0dXpha25sNlFpZkRuWlVxMkpBQWFK?=
 =?utf-8?B?aFE4eG9pUSttYjZxUC9HdXQ3bVZOQVl2T2t0OXE1ZjN5VUR0WmVxckxYUmR4?=
 =?utf-8?B?UDBJcWxLRjQ3TWltTWc1ckt3WGJ2ZG4xMFhxd1FpWGJwbUJVc1pHZ1RXRnU3?=
 =?utf-8?B?V3JPNjBPeWpEMnBIZTlEUEVBdXFKSnA3SXZXTkVmUVFrMjRiV0V1RGJySGQ1?=
 =?utf-8?B?RXNqOFgwSEY5cEhPeGJ4akozYUFVS2Rkek5aSGF6cXNieVM5RHF6MHJLaGh5?=
 =?utf-8?B?ME9neWpKcTRoWitzUGpobjZxV21RMlhYMG9PckNSUGhqK2Eza2RleGdxR0lN?=
 =?utf-8?B?SUVoR3NnaHZiVG0vM2lFRFN6UnE4eUdCSWs0dU5JaG42VVJFZWpWTUIxUHdK?=
 =?utf-8?B?MklMclJPZU5NakdGMC9BTHZFT21iR0lrV0FNUHYvUXBxMmlUZVpIbktUS3dt?=
 =?utf-8?B?M1ZyUkEwTSt6VXQxTk5tWlBmZlRlUVB5c1RwcmVsSU4wL0pweHdjQ3hrTzlv?=
 =?utf-8?B?SlBjRFc4M2JMbGhIM0JXU0UyRmRHT3hodk5HU2NPZ212ZXhMRSt0SWdUdUNx?=
 =?utf-8?B?YUFMWmI0azZLRHpaR3ZEL3JNUHFQZUlJSXNhRXJjOUgxOTNhenROSzZSakZo?=
 =?utf-8?Q?PbI8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TVZOVVd6YTlxcjZNNEM2dyt1bEUrQzgxTWZIYlczWVA0TWZ6NnVNMnhsWmwv?=
 =?utf-8?B?YUtKWlNsMnlIY2xndG1PbEI2blE5Tlg3Z3FOTTV5TTl2bXZ2SXloSGhoMDJT?=
 =?utf-8?B?dG5NUWRydVE0TjliSWd5S1VMaFVsRmg4Z0pLVFdSSUdjZnRTb3IxeWtpMEdZ?=
 =?utf-8?B?ekljSmtLTGJ5NVZUb3NycTNLM3JkU0RPbXNEQUZGaDh4V1FhZ2J0NTk0enMr?=
 =?utf-8?B?QWtkSThveTNybnFnbVRsd09RRWdVRXB2b2dhRHZ4UEMxOEsxWFlLZXJ5M05o?=
 =?utf-8?B?NFdPTWJXdkEvR1dlRXFxVU52YWFQZGJzU1hDR0ZiNW8xYnMrUFdyRkRaLzNF?=
 =?utf-8?B?eldNSzBoN2tCL014MUlqSUZ2VTVCeEV5NjlPaXJPVFdBTmZseHlsUnovbFlp?=
 =?utf-8?B?dWVTSnlQRWppTCs0bFhkV2dXeEhocFUxLzFIKzYxSVo3WGN2clk0V0FaUUkz?=
 =?utf-8?B?ZXpvZElOb0RUUE9FWlRQeFhoQm9FKzFITk5NaTZuK2UxVEJBMjBneUtQWXlh?=
 =?utf-8?B?QjE2d3hoUnMyUlNlYXFKVEgxZTlSRW9zblZsdnJ0S2laN3ZUd3FlVi91aWpD?=
 =?utf-8?B?Q2R0RkcvVEEyWGFLY2dKald0Qm9kd2lGLzRLODd2R0FrWWk2Rkh1REIvWHJB?=
 =?utf-8?B?ZUVjUUFERkhIdkoycTNjdThyRFhPS3g5THp5RmpmNWRUQ1dSYTBvU0lJaGlo?=
 =?utf-8?B?Q2Q3ek1rczArTVF4dXZ1UnJWWE1SUDlqRUp2NVhMZUdocEhJV09EdldraW1Q?=
 =?utf-8?B?bVN4SmJSTFNMUVZuTjJETlJJSXBNclRzc0N6NEwxdTFwSXc1dlg3Q2g0YzlE?=
 =?utf-8?B?VE1QdURndy9JL2gvRVVRYWFLdkNBSkE0Q1cvWEtHNVFlcFY4Z3RBdnVyd2pt?=
 =?utf-8?B?SGh1b0gvemFFbksvZEpDMnlqRkFNbGdZdTZscjV5cnIrb21QZG0xekhZdnRY?=
 =?utf-8?B?bm1rb0Y3UHBWUzRwTU80YXlQZThDV2c3dW1VVFZrWHlTQUtDSUpma2hmYnlV?=
 =?utf-8?B?akZRSjVvMS9KR3BRcDFDeHhVU25qQzZ0QTNwTWlKL1ZoeTI5LzQyVmxwS3M1?=
 =?utf-8?B?R3FPZVB3Mjd4UDZ3NFM3ek9yL2VyUnhRVmVDODZQeEZ2Z0RvMkpVaU9EVytH?=
 =?utf-8?B?em94MHQ3NG01bUkxSXVOdzU3TW9FT2g3c2xQWmVxaEtLeWc5bHJwcU5mTXlz?=
 =?utf-8?B?WU94MmJ3OW5RV2wwS01HVDJaWjBNekREN0tSeUVLSERFeG9vNWZQUWJiQnFG?=
 =?utf-8?B?bmdrR2sxaVJPY1VzenkrNFdJSXRXZWdtK0drbmF0bEpQcnd4QjE1REZ2UVlm?=
 =?utf-8?B?QnlraER0UnFuVmJqWlU2YzdFcWtoRHpNdC93S2hnV2NSVWkxRy9MMkZ1MTMr?=
 =?utf-8?B?RFkydEtNcFV3S255U1N5Y0xad3dJcTBFQ0pNSlF5eUhtd21SdlJYNks1ekFY?=
 =?utf-8?B?SHNZVWt2NjdaY1NBbVRRWjhQVzdYelNSZDRucUxQTFpyZFRlT2lRVW5idVNk?=
 =?utf-8?B?d1FmNW5zQmF0bThtNCthQjRwYk9FbjVWVkd6QTlWOUVmT1BobUhWeWU1RVdG?=
 =?utf-8?B?Unk2V0I4YVJqYWx1TitjYmRLMU5RM3lzYStQczdwbGcwZDdiYkFaVVgwdkc4?=
 =?utf-8?B?MmNYaXgyV1N6Vk1Kd3lNZG0xR3N5MFZ4Y1ZwYlpRUmszR1NmRzhCMjlXRlhy?=
 =?utf-8?B?ZUxxdEs4UTN4c1ozVXN3RTB2cDIzWWtXMzNCVzBIUmFhQ1hqSnhVd0hhYngr?=
 =?utf-8?B?WkxwMG02dGRBQlJQYmRuTXlVejV2TG9qUTdmUFBsSzR6REl1czdMWjdnRFFw?=
 =?utf-8?B?Tnc3QzhYNHZIcmQ5YTBJNERVQTh1d3FMQXBJOXpweEJNL0lCMmxlTjM3MWlC?=
 =?utf-8?B?T1BnWmJqaEZZZnBpbDIxbFRBRGY1Qm5tZldRUitOeWkwR1pxaDUyMUFleVZi?=
 =?utf-8?B?RXh5d1pKaU1ic2J0MkRCcEFDWC9DMER5U2g4Q1BLTEh0d2x1bm9OZTFKc2x2?=
 =?utf-8?B?aVo4MmdiTzkxNmhzMzN3MnlmWEJMUVE1b3FneHM3ZlZZdjBTTVdCdmdFUUdw?=
 =?utf-8?B?bHNXMXlJMTJadUJCUFVqU1dxa2tzY1JiYTBOdWllMFg5T1llcnBpTzVlVDR1?=
 =?utf-8?B?UEVldWpnVXAzQUJpSm9LRHljYTNmVzR1dHJEY3ZMK0x0VzJnMytHSC9maXRv?=
 =?utf-8?B?UnFSUE0vRnoyb1MyclRnU012LzJFRFBtQmduT2EzUnl3anVoWHBhcFgxdmw4?=
 =?utf-8?B?T2xlZUVQSUxqSThhcUF0QjZVNmtzRWdJaFFDZzVKYWFkK1h0bzNCTzJMRWU2?=
 =?utf-8?B?YnErN3VxT01ScWRiTU9IdUh6ZzBoendSTHhrbUZnbnRycUN2NkJxYlZ5cVUr?=
 =?utf-8?Q?TkOBuTmeugwtnml0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 12ddd9a6-0131-4316-149d-08de59a6b2fc
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 11:09:23.8014 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sdHnz9S3kVOry2BXW8O/KEtS8iw/WaII0EN/lx4WotuaO2sVdf9Z0uPZ+P0cBtOPd8JNQT4OQZe4VX8uUbJWZYi1G80X8BF9PIkfwq+T6kg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4807
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

On Mon, Jan 19, 2026 at 05:29:40AM -0800, Anoop, Vijay wrote:
>From: Anoop Vijay <anoop.c.vijay@intel.com>
>
>Implement the System Controller mailbox communication layer:
>- Low-level frame I/O operations
>- Mailbox busy/ready state polling
>- Command preparation and fragmentation
>- Multi-frame send/receive with phase bit handling
>- MKHI protocol header validation
>- Public API for sending commands to System Controller
>
>This provides the complete mailbox infrastructure for
>communicating with System Controller firmware on Xe3p
>dGPU platforms.
>
>Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
>---
>v4: (Matt, Mike)
>- Refactor MMIO access to use domain-specific accessor
>- Add input validation and buffer overflow protection
>- Add bounds checking for multi-frame operations
>- Fix potential NULL pointer dereference
>---
> drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 445 ++++++++++++++++++++++++
> 1 file changed, 445 insertions(+)
> create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>
>diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>new file mode 100644
>index 000000000000..162208f6018b
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>@@ -0,0 +1,445 @@
>+// SPDX-License-Identifier: MIT
>+/*
>+ * Copyright © 2026 Intel Corporation
>+ */
>+
>+#include <linux/bitfield.h>
>+#include <linux/container_of.h>
>+#include <linux/errno.h>
>+#include <linux/minmax.h>
>+#include <linux/mutex.h>
>+#include <linux/slab.h>
>+#include <linux/string.h>
>+#include <linux/types.h>
>+
>+#include "regs/xe_sysctrl_regs.h"
>+#include "xe_device.h"
>+#include "xe_device_types.h"
>+#include "xe_mmio.h"
>+#include "xe_pm.h"
>+#include "xe_printk.h"
>+#include "xe_sysctrl.h"
>+#include "xe_sysctrl_mailbox.h"
>+#include "xe_sysctrl_mailbox_types.h"
>+#include "xe_sysctrl_types.h"
>+
>+#define MKHI_HDR_GROUP_ID_MASK		GENMASK(7, 0)
>+#define MKHI_HDR_COMMAND_MASK		GENMASK(14, 8)
>+#define MKHI_HDR_IS_RESPONSE		BIT(15)
>+#define MKHI_HDR_RESERVED_MASK		GENMASK(23, 16)
>+#define MKHI_HDR_RESULT_MASK		GENMASK(31, 24)
>+
>+#define XE_SYSCTRL_MKHI_HDR_GROUP_ID(hdr) \
>+	FIELD_GET(MKHI_HDR_GROUP_ID_MASK, le32_to_cpu((hdr)->data))
>+
>+#define XE_SYSCTRL_MKHI_HDR_COMMAND(hdr) \
>+	FIELD_GET(MKHI_HDR_COMMAND_MASK, le32_to_cpu((hdr)->data))
>+
>+#define XE_SYSCTRL_MKHI_HDR_IS_RESPONSE(hdr) \
>+	FIELD_GET(MKHI_HDR_IS_RESPONSE, le32_to_cpu((hdr)->data))
>+
>+#define XE_SYSCTRL_MKHI_HDR_RESULT(hdr) \
>+	FIELD_GET(MKHI_HDR_RESULT_MASK, le32_to_cpu((hdr)->data))
>+
>+static struct xe_device *sc_to_xe(struct xe_sysctrl *sc)
>+{
>+	return container_of(sc, struct xe_device, sc);
>+}
>+
>+static bool xe_sysctrl_mailbox_wait_bit_clear(struct xe_sysctrl *sc, u32 bit_mask,
>+					      unsigned int timeout_ms)
>+{
>+	int ret;
>+
>+	ret = xe_mmio_wait32_not(sc->mmio, SYSCTRL_MB_CTRL, bit_mask, bit_mask,
>+				 timeout_ms * 1000, NULL, false);
>+
>+	return ret == 0;
>+}
>+
>+static bool xe_sysctrl_mailbox_wait_bit_set(struct xe_sysctrl *sc, u32 bit_mask,
>+					    unsigned int timeout_ms)
>+{
>+	int ret;
>+
>+	ret = xe_mmio_wait32(sc->mmio, SYSCTRL_MB_CTRL, bit_mask, bit_mask,
>+			     timeout_ms * 1000, NULL, false);
>+
>+	return ret == 0;
>+}
>+
>+static int xe_sysctrl_mailbox_write_frame(struct xe_sysctrl *sc, const void *frame,
>+					  size_t len)
>+{
>+	static const struct xe_reg regs[] = {
>+		SYSCTRL_MB_DATA0, SYSCTRL_MB_DATA1, SYSCTRL_MB_DATA2, SYSCTRL_MB_DATA3
>+	};
>+	u32 val[SYSCTRL_MB_FRAME_SIZE / sizeof(u32)] = {0};
>+	u32 dw = DIV_ROUND_UP(len, sizeof(u32));
>+	u32 i;
>+
>+	memcpy(val, frame, len);
>+
>+	for (i = 0; i < dw; i++)
>+		xe_mmio_write32(sc->mmio, regs[i], val[i]);
>+
>+	return 0;
>+}
>+
>+static int xe_sysctrl_mailbox_read_frame(struct xe_sysctrl *sc, void *frame,
>+					 size_t len)
>+{
>+	static const struct xe_reg regs[] = {
>+		SYSCTRL_MB_DATA0, SYSCTRL_MB_DATA1, SYSCTRL_MB_DATA2, SYSCTRL_MB_DATA3
>+	};
>+	u32 val[SYSCTRL_MB_FRAME_SIZE / sizeof(u32)] = {0};
>+	u32 dw = DIV_ROUND_UP(len, sizeof(u32));
>+	u32 i;
>+
>+	for (i = 0; i < dw; i++)
>+		val[i] = xe_mmio_read32(sc->mmio, regs[i]);
>+
>+	memcpy(frame, val, len);
>+
>+	return 0;
>+}
>+
>+static void xe_sysctrl_mailbox_clear_response(struct xe_sysctrl *sc)
>+{
>+	xe_mmio_rmw32(sc->mmio, SYSCTRL_MB_CTRL, SYSCTRL_MB_CTRL_RUN_BUSY_OUT, 0);
>+}
>+
>+static int xe_sysctrl_mailbox_prepare_command(struct xe_device *xe,
>+					      u8 group_id, u8 command,
>+					      const void *data_in, size_t data_in_len,
>+					      u8 **mbox_cmd, size_t *cmd_size)
>+{
>+	struct xe_sysctrl_mailbox_mkhi_msg_hdr *mkhi_hdr;
>+	size_t size;
>+	u8 *buffer;
>+
>+	if (data_in_len > SYSCTRL_MB_MAX_MESSAGE_SIZE - sizeof(*mkhi_hdr)) {
>+		xe_err(xe, "sysctrl: Input data too large: %zu bytes\n", data_in_len);
>+		return -EINVAL;
>+	}
>+
>+	size = sizeof(*mkhi_hdr) + data_in_len;
>+
>+	buffer = kmalloc(size, GFP_KERNEL);
>+	if (!buffer)
>+		return -ENOMEM;
>+
>+	mkhi_hdr = (struct xe_sysctrl_mailbox_mkhi_msg_hdr *)buffer;
>+	mkhi_hdr->data = cpu_to_le32(FIELD_PREP(MKHI_HDR_GROUP_ID_MASK, group_id) |
>+				     FIELD_PREP(MKHI_HDR_COMMAND_MASK, command & 0x7F) |
>+				     FIELD_PREP(MKHI_HDR_IS_RESPONSE, 0) |
>+				     FIELD_PREP(MKHI_HDR_RESERVED_MASK, 0) |
>+				     FIELD_PREP(MKHI_HDR_RESULT_MASK, 0));
>+
>+	if (data_in && data_in_len)
>+		memcpy(buffer + sizeof(*mkhi_hdr), data_in, data_in_len);
>+
>+	*mbox_cmd = buffer;
>+	*cmd_size = size;
>+
>+	return 0;
>+}
>+
>+static int xe_sysctrl_mailbox_send_frames(struct xe_sysctrl *sc,
>+					  const u8 *mbox_cmd,
>+					  size_t cmd_size, unsigned int timeout_ms)
>+{
>+	struct xe_device *xe = sc_to_xe(sc);
>+	u32 ctrl_reg, total_frames, frame;
>+	size_t bytes_sent, frame_size;
>+
>+	total_frames = DIV_ROUND_UP(cmd_size, SYSCTRL_MB_FRAME_SIZE);
>+
>+	if (!xe_sysctrl_mailbox_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms)) {
>+		xe_err(xe, "sysctrl: Mailbox busy\n");
>+		return -EBUSY;
>+	}
>+
>+	sc->phase_bit ^= 1;
>+	bytes_sent = 0;
>+
>+	for (frame = 0; frame < total_frames; frame++) {
>+		frame_size = min(cmd_size - bytes_sent, (size_t)SYSCTRL_MB_FRAME_SIZE);
>+
>+		if (xe_sysctrl_mailbox_write_frame(sc, mbox_cmd + bytes_sent, frame_size)) {
>+			xe_err(xe, "sysctrl: Failed to write frame %u\n", frame);
>+			sc->phase_bit ^= 1;
>+			return -EIO;
>+		}
>+
>+		ctrl_reg = SYSCTRL_MB_CTRL_RUN_BUSY |
>+			   FIELD_PREP(MKHI_FRAME_CURRENT_MASK, frame) |
>+			   FIELD_PREP(MKHI_FRAME_TOTAL_MASK, total_frames - 1) |
>+			   FIELD_PREP(MKHI_FRAME_COMMAND_MASK, SYSCTRL_MKHI_COMMAND) |
>+			   (sc->phase_bit ? MKHI_FRAME_PHASE : 0);
>+
>+		xe_mmio_write32(sc->mmio, SYSCTRL_MB_CTRL, ctrl_reg);
>+
>+		if (!xe_sysctrl_mailbox_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms)) {
>+			xe_err(xe, "sysctrl: Frame %u acknowledgment timeout\n", frame);
>+			sc->phase_bit ^= 1;
>+			return -ETIMEDOUT;
>+		}
>+
>+		bytes_sent += frame_size;
>+	}
>+
>+	return 0;
>+}
>+
>+static int xe_sysctrl_mailbox_process_first_frame(struct xe_sysctrl *sc,
>+						  const struct xe_sysctrl_mailbox_mkhi_msg_hdr *req,
>+						  void *out,
>+						  size_t out_size,
>+						  size_t frame_size,
>+						  size_t *payload_bytes)
>+{
>+	struct xe_device *xe = sc_to_xe(sc);
>+	struct xe_sysctrl_mailbox_mkhi_msg_hdr *resp_hdr;
>+	u32 frame_data[SYSCTRL_MB_FRAME_SIZE / sizeof(u32)];
>+	size_t hdr_size = sizeof(*resp_hdr);
>+	size_t payload_size;
>+	int ret;
>+
>+	if (frame_size < hdr_size) {
>+		xe_err(xe, "sysctrl: Frame size %zu too small\n", frame_size);
>+		return -EPROTO;
>+	}
>+
>+	ret = xe_sysctrl_mailbox_read_frame(sc, frame_data, frame_size);
>+	if (ret)
>+		return ret;
>+
>+	resp_hdr = (struct xe_sysctrl_mailbox_mkhi_msg_hdr *)frame_data;
>+
>+	if (!XE_SYSCTRL_MKHI_HDR_IS_RESPONSE(resp_hdr) ||
>+	    XE_SYSCTRL_MKHI_HDR_GROUP_ID(resp_hdr) != XE_SYSCTRL_MKHI_HDR_GROUP_ID(req) ||
>+	    XE_SYSCTRL_MKHI_HDR_COMMAND(resp_hdr) != XE_SYSCTRL_MKHI_HDR_COMMAND(req)) {
>+		xe_err(xe, "SC: Response header mismatch\n");
>+		return -EPROTO;
>+	}
>+
>+	if (XE_SYSCTRL_MKHI_HDR_RESULT(resp_hdr) != 0) {
>+		xe_err(xe, "SC: Firmware error: 0x%02lx\n",
>+		       XE_SYSCTRL_MKHI_HDR_RESULT(resp_hdr));
>+		return -EIO;
>+	}
>+
>+	payload_size = frame_size - hdr_size;
>+
>+	if (payload_size > out_size) {
>+		xe_err(xe, "sysctrl: Payload %zu bytes exceeds buffer %zu bytes\n",
>+		       payload_size, out_size);
>+		return -ENOSPC;
>+	}
>+
>+	if (payload_size > 0)
>+		memcpy(out, (u8 *)frame_data + hdr_size, payload_size);
>+
>+	*payload_bytes = payload_size;
>+
>+	xe_sysctrl_mailbox_clear_response(sc);
>+
>+	return 0;
>+}
>+
>+static int xe_sysctrl_mailbox_process_frame(struct xe_sysctrl *sc,
>+					    void *out, size_t frame_size,
>+					    unsigned int timeout_ms)
>+{
>+	struct xe_device *xe = sc_to_xe(sc);
>+	int ret;
>+
>+	if (!xe_sysctrl_mailbox_wait_bit_set(sc, SYSCTRL_MB_CTRL_RUN_BUSY_OUT, timeout_ms)) {
>+		xe_err(xe, "sysctrl: Response frame timeout\n");
>+		return -ETIMEDOUT;
>+	}
>+
>+	ret = xe_sysctrl_mailbox_read_frame(sc, out, frame_size);
>+	if (ret)
>+		return ret;
>+
>+	xe_sysctrl_mailbox_clear_response(sc);
>+
>+	return 0;
>+}
>+
>+static int xe_sysctrl_mailbox_receive_frames(struct xe_sysctrl *sc,
>+					     const struct xe_sysctrl_mailbox_mkhi_msg_hdr *req,
>+					     void *data_out, size_t data_out_len,
>+					     size_t *rdata_len, unsigned int timeout_ms)
>+{
>+	struct xe_device *xe = sc_to_xe(sc);
>+	struct xe_sysctrl_mailbox_mkhi_msg_hdr *mkhi_hdr;
>+	size_t hdr_size = sizeof(*mkhi_hdr);
>+	u32 ctrl_reg, total_frames, frame;
>+	size_t received = 0;
>+	u8 *out = data_out;
>+	size_t frame_size;
>+	int ret = 0;
>+
>+	if (!xe_sysctrl_mailbox_wait_bit_set(sc, SYSCTRL_MB_CTRL_RUN_BUSY_OUT, timeout_ms)) {
>+		xe_err(xe, "sysctrl: Response frame 0 timeout\n");
>+		return -ETIMEDOUT;
>+	}
>+
>+	ctrl_reg = xe_mmio_read32(sc->mmio, SYSCTRL_MB_CTRL);
>+	total_frames = FIELD_GET(MKHI_FRAME_TOTAL_MASK, ctrl_reg) + 1;
>+
>+	if (total_frames == 1)
>+		frame_size = min(hdr_size + data_out_len, (size_t)SYSCTRL_MB_FRAME_SIZE);
>+	else
>+		frame_size = SYSCTRL_MB_FRAME_SIZE;
>+
>+	ret = xe_sysctrl_mailbox_process_first_frame(sc, req, out, data_out_len,
>+						     frame_size, &received);
>+	if (ret)
>+		return ret;
>+
>+	out += received;
>+
>+	for (frame = 1; frame < total_frames; frame++) {
>+		size_t remaining;
>+
>+		if (received >= data_out_len) {
>+			xe_err(xe, "sysctrl: Received %zu bytes exceeds buffer %zu bytes\n",
>+			       received, data_out_len);
>+			return -ENOSPC;
>+		}
>+
>+		remaining = data_out_len - received;
>+		frame_size = min_t(size_t, remaining, SYSCTRL_MB_FRAME_SIZE);
>+
>+		ret = xe_sysctrl_mailbox_process_frame(sc, out, frame_size, timeout_ms);
>+		if (ret)
>+			break;
>+
>+		received += frame_size;
>+		out += frame_size;
>+	}
>+
>+	*rdata_len = received;
>+
>+	return ret;
>+}

[optional]

I lost track of a comment to simplify the receive handling to make it more
readable. I have pasted a draft version here. Check it out if possible, if not,
you could refactor in future.

This reads the ctrl_reg each time and relies on the current_frame value to stop
reading further frames. Note that this will drain the entire message from FW and
then validate the header. Also note that this reads the message to a temporary
buffer and then copies it over to the user buffer, so it will not copy partial
message to user buffer if the header checks fail.

static int xe_sysctrl_mailbox_process_frame(struct xe_sysctrl *sc, void *out,
                                             size_t frame_size, bool *done)
{
         u32 curr_frame, total_frames, ctrl_reg;
         struct xe_device *xe = sc_to_xe(sc);
         int ret;

         if (!xe_sysctrl_mailbox_wait_bit_set(sc, SYSCTRL_MB_CTRL_RUN_BUSY_OUT)) {
                 xe_err(xe, "sysctrl: Response frame timeout\n");
                 return -ETIMEDOUT;
         }

         ctrl_reg = xe_mmio_read32(sc->mmio, SYSCTRL_MB_CTRL);
         total_frames = FIELD_GET(MKHI_FRAME_TOTAL_MASK, ctrl_reg);
         curr_frame = FIELD_GET(MKHI_FRAME_CURRENT_MASK, ctrl_reg);

         ret = xe_sysctrl_mailbox_read_frame(sc, out, frame_size);
         if (ret)
                 return ret;

         xe_sysctrl_mailbox_clear_response(sc);

         if (curr_frame == total_frames)
                 *done = true;

         return 0;
}

static int xe_sysctrl_mailbox_receive_frames(struct xe_sysctrl *sc,
                                              const struct xe_sysctrl_mailbox_mkhi_msg_hdr *req,
                                              void *data_out, size_t data_out_len,
                                              size_t *rdata_len, unsigned int timeout_ms)
{
         struct xe_sysctrl_mailbox_mkhi_msg_hdr *mkhi_hdr;
         struct xe_device *xe = sc_to_xe(sc);
         size_t frame_size, remain;
         u32 curr_frame, total_frames, ctrl_reg;
         u8 *buffer, *out;
         int ret = 0;
         bool done = false;

         remain = sizeof(*mkhi_hdr) + data_out_len;
         buffer = kzalloc(remain, GFP_KERNEL);
         if (!buffer)
                 return -ENOMEM;

         out = buffer;
         while (!done && remain) {
                 frame_size = min(remain, (size_t)SYSCTRL_MB_FRAME_SIZE);

                 ret = xe_sysctrl_mailbox_process_frame(sc, out, frame_size,
                                                        timeout_ms, &done);
                 if (ret)
                         return ret;

                 remain -= frame_size;
                 out += frame_size;
         }

         mkhi_hdr = (struct xe_sysctrl_mailbox_mkhi_msg_hdr *) buffer;

         if (!XE_SYSCTRL_MKHI_HDR_IS_RESPONSE(mkhi_hdr) ||
             XE_SYSCTRL_MKHI_HDR_GROUP_ID(mkhi_hdr) != XE_SYSCTRL_MKHI_HDR_GROUP_ID(req) ||
             XE_SYSCTRL_MKHI_HDR_COMMAND(mkhi_hdr) != XE_SYSCTRL_MKHI_HDR_COMMAND(req)) {
                 xe_err(xe, "SC: Response header mismatch\n");
                 return -EPROTO;
         }

         if (XE_SYSCTRL_MKHI_HDR_RESULT(mkhi_hdr) != 0) {
                 xe_err(xe, "SC: Firmware error: 0x%02lx\n", XE_SYSCTRL_MKHI_HDR_RESULT(mkhi_hdr));
                 return -EIO;
         }

         memcpy(data_out, mkhi_hdr + 1, data_out_len);
         *rdata_len = received;

         return ret;
}

>+
>+static int xe_sysctrl_mailbox_send_command(struct xe_sysctrl *sc,
>+					   const u8 *mbox_cmd, size_t cmd_size,
>+					   void *data_out, size_t data_out_len,
>+					   size_t *rdata_len, unsigned int timeout_ms)
>+{
>+	const struct xe_sysctrl_mailbox_mkhi_msg_hdr *mkhi_hdr;
>+	size_t received;
>+	int ret;
>+
>+	ret = xe_sysctrl_mailbox_send_frames(sc, mbox_cmd, cmd_size, timeout_ms);
>+	if (ret)
>+		return ret;
>+
>+	if (!data_out || !rdata_len)
>+		return 0;
>+
>+	mkhi_hdr = (const struct xe_sysctrl_mailbox_mkhi_msg_hdr *)mbox_cmd;
>+
>+	ret = xe_sysctrl_mailbox_receive_frames(sc, mkhi_hdr, data_out, data_out_len,
>+						&received, timeout_ms);
>+	if (ret)
>+		return ret;
>+
>+	*rdata_len = received;
>+
>+	return 0;
>+}
>+
>+/**
>+ * xe_sysctrl_mailbox_init - Initialize System Controller mailbox interface
>+ * @sc: System controller structure
>+ *
>+ * Initialize system controller mailbox interface for communication.
>+ */
>+void xe_sysctrl_mailbox_init(struct xe_sysctrl *sc)
>+{
>+	u32 ctrl_reg;
>+
>+	ctrl_reg = xe_mmio_read32(sc->mmio, SYSCTRL_MB_CTRL);
>+	sc->phase_bit = (ctrl_reg & MKHI_FRAME_PHASE) ? 1 : 0;
>+}
>+
>+/**
>+ * xe_sysctrl_send_command - Send command to System Controller via mailbox
>+ * @xe: XE device instance
>+ * @cmd: Pointer to xe_sysctrl_mailbox_command structure
>+ * @rdata_len: Pointer to store actual response data size (can be NULL)
>+ *
>+ * Send a command to the System Controller using MKHI protocol. Handles
>+ * command preparation, fragmentation, transmission, and response reception.
>+ *
>+ * Return: 0 on success, negative error code on failure
>+ */
>+int xe_sysctrl_send_command(struct xe_device *xe,
>+			    struct xe_sysctrl_mailbox_command *cmd,
>+			    size_t *rdata_len)
>+{
>+	struct xe_sysctrl *sc;
>+	u8 group_id, command_code;
>+	u8 *mbox_cmd = NULL;
>+	size_t cmd_size = 0;
>+	int ret = 0;
>+
>+	if (!xe) {
>+		pr_err("sysctrl: Invalid device handle\n");
>+		return -EINVAL;
>+	}
>+
>+	if (!xe->info.has_sysctrl)
>+		return -ENODEV;
>+
>+	sc = &xe->sc;
>+
>+	if (!cmd) {
>+		xe_err(xe, "sysctrl: Invalid command buffer\n");
>+		return -EINVAL;
>+	}
>+
>+	group_id = XE_SYSCTRL_APP_HDR_GROUP_ID(&cmd->header);
>+	command_code = XE_SYSCTRL_APP_HDR_COMMAND(&cmd->header);
>+
>+	if (!cmd->data_in && cmd->data_in_len) {
>+		xe_err(xe, "sysctrl: Invalid input parameters\n");
>+		return -EINVAL;
>+	}
>+
>+	if (!cmd->data_out && cmd->data_out_len) {
>+		xe_err(xe, "sysctrl: Invalid output parameters\n");
>+		return -EINVAL;
>+	}
>+
>+	might_sleep();
>+
>+	ret = xe_sysctrl_mailbox_prepare_command(xe, group_id, command_code,
>+						 cmd->data_in, cmd->data_in_len,
>+						 &mbox_cmd, &cmd_size);
>+	if (ret) {
>+		xe_err(xe, "sysctrl: Failed to prepare command: %d\n", ret);
>+		return ret;
>+	}
>+
>+	guard(xe_pm_runtime)(xe);
>+
>+	guard(mutex)(&sc->cmd_lock);
>+
>+	ret = xe_sysctrl_mailbox_send_command(sc, mbox_cmd, cmd_size,
>+					      cmd->data_out, cmd->data_out_len, rdata_len,
>+					      SYSCTRL_MB_DEFAULT_TIMEOUT_MS);

Since the timeout is a macro you are defining locally, can you move this 
to the innermost function that uses it. That way you will not need to 
pass it to each function call in the stack.

Thanks,
Umesh

>+	if (ret)
>+		xe_err(xe, "sysctrl: Mailbox command failed: %d\n", ret);
>+
>+	kfree(mbox_cmd);
>+
>+	return ret;
>+}
>-- 
>2.43.0
>
