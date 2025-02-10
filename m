Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D9E4C02198
	for <intel-xe@archiver.kernel.org>; Mon, 10 Feb 2025 19:09:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 242CD10E1F0;
	Mon, 10 Feb 2025 19:09:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hsGuG1e/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7F8310E1F0
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Feb 2025 19:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739214555; x=1770750555;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=98rtJ/aKpu/ZBuZFHl35/NV+/6qoFzS08/B4zg3eoS8=;
 b=hsGuG1e/OoXeVYlUUd/bO4ubaPEa6mMRFimtupNawV5tI8/2msgXt80k
 RZjGwpGnvMEAsfqK1HbyW0AV8jbdVf1ppX3OX3gEraBWJfOgYd7oMLoZ8
 uFpJStBiVgUuyUwa/GADmnJxA9cWr/nFrdhQoBFOprAoeo3/7eXmxB8Jt
 FgDcgqbi24qhoyI+GBUfPgH+Rz429StT55yWz8DgLV8McWe4NFbK5NhA8
 0727LXlXtFVPO+NuMcoOCEZHsTyTi0MfC2A115b83aBDc73NOt+t3wXJH
 SiD2kLxokoB7vV8bkptC2EcvUcUCKZGo5zdGhBIUN0to44k2zODkKwbRo g==;
X-CSE-ConnectionGUID: wMNSYJMDRwGJqxOmKsNHGg==
X-CSE-MsgGUID: VYfJmGm1TZKxSjKRoNzFNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="43736780"
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; d="scan'208";a="43736780"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 11:09:13 -0800
X-CSE-ConnectionGUID: aZ24G39USRK/l+N0nOtEhA==
X-CSE-MsgGUID: +BivYP8MSVCOc/sbvJFbwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; d="scan'208";a="112910819"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Feb 2025 11:09:04 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 10 Feb 2025 11:09:03 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 10 Feb 2025 11:09:03 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Feb 2025 11:09:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Amitqii7RAdXsrmto19gQ+4nEO+1qImPN3rc65bTQQxNanNu7PH2EV/sklRDCjzdTbFbDEcBr9Lc6wqTth587eH4IGLQPgKOJZOWDh85p2ajvWdlAB9msng+XTRUphlL2geqlKFiAmqe4Zx4H/VdaW56nUC+3woBSr5BHt3HaOQiUk8q4Q19yYZYMYo2k78NUGS0tPc+C5kvMAs+FOa49dazwHG4KJM4HtENRasvqJXdP1zdkzqMhWg7biL1dPCHovEu4/rzuIOrhvOSdzjmd020IEGkcJaTRCAxtCskde0l/nNKUEEv11SRW/7enmF/jY3udgPx8RocRlM+v7ilkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/cQvnN40vn/unT2E6HXHa9CV3UMqY6zkkyrAMStOsAE=;
 b=pz1L9Ty0giR82nA8SXfB0X0dCz4BAE4EHd6l3gmH6H4ZaIPE6v0/AWfX3KQOf5NVO+AYOGLPiTut4tFKADmV0u23DQV2htC54I6DRlNL3UXdSzyJ3SSXJDfy4YETeYNsvsth/v3vVU9F/Fv2I24G5HPbI4HPHPvYilq8kwSO8zgxwvyNxntPAc2fmAaCxEOAYTUjY5cL8kBs/2eA5xfLJAunNY9hWyuLLxgcnSDylVQWuJBt792At4JnMFX9vZ99cndKUWa+NKvn+QuuROm90aKl2s9FHl3I2ONxG07pJDKsj49vBTWuPww/XlYu/m1USwiQn+dlKg6SD4gZQWyfEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by MW4PR11MB6983.namprd11.prod.outlook.com (2603:10b6:303:226::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 19:08:44 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 19:08:44 +0000
Message-ID: <4f6f6607-bab2-46f4-b471-cb099eaaed24@intel.com>
Date: Tue, 11 Feb 2025 00:38:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/13] drm/xe: Fix xe_display_fini() calls
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Francois Dugast
 <francois.dugast@intel.com>, Matthew Auld <matthew.auld@intel.com>, "Daniele
 Ceraolo Spurio" <daniele.ceraolospurio@intel.com>, Maarten Lankhorst
 <dev@lankhorst.se>
References: <20250207221945.2878241-1-lucas.demarchi@intel.com>
 <20250207221945.2878241-2-lucas.demarchi@intel.com>
 <7c0bfb21-ead6-472b-b68d-62eece414472@intel.com>
Content-Language: en-US
In-Reply-To: <7c0bfb21-ead6-472b-b68d-62eece414472@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0079.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::7) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|MW4PR11MB6983:EE_
X-MS-Office365-Filtering-Correlation-Id: 3deba1cf-a9fc-44e9-e1c3-08dd4a065691
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L3pGcmVGYUNlMkNEWlFVRUk5eEdQNmtMcU9UTTlYZ0VWV2IzSGtDUFQ4dW16?=
 =?utf-8?B?VzRFZ1FxL0Fqb3NLMUluQ3NEVUxPanpzeXJiamNuM1dIWFpRMkRKYlJXQ2lS?=
 =?utf-8?B?VGJhekdLZU9YeWZEV3d3L2JUdzBoeUxlaXRJMVRUMDZoSzRCcXR2NUxlRU9o?=
 =?utf-8?B?aUVMWW1Ea2tlUVlmRjMwWkJ3akFQQ3BYMHhUNVQydjhxY1BzR2h6WklWSmdY?=
 =?utf-8?B?N0sya2dzWllaVnhYYUVYRE93Skg0NytUdVRWbWRPT0Rqd0VPaEJ2WHFvMGE5?=
 =?utf-8?B?SFFQUkRXakNtaUNYUEIxeVZETFpGNFFhOWpmcjhRMVcvYjVzNUpldXlMQU01?=
 =?utf-8?B?cmd3a09GWk1KT0JxTGUyaDF4Z0pLUGJrMU5jZGhDMzFzRlMrUWNIdHRodmhX?=
 =?utf-8?B?bGhlZHc0eUlHODZjbUdCY2xQUkxVeUxpK0o2dHp3QmhIczNlam1XM3dGTkx3?=
 =?utf-8?B?Y3dBdHgya29DRGh5VkxwZi9oNVhyL1VsK0orZlR4ZkVGa01IaEpLbldNZGs0?=
 =?utf-8?B?TlNoOWhKZjNvcWVxNXUyb1NVZ2UzZW1INGxoUzN6cnNvbTU2SGdaaTh2c1pU?=
 =?utf-8?B?MDFGRXNLMFdMbkg2eVpZdFl4RlBEWm52OTRqemNaelNVR21jQVFUTHB3MXd6?=
 =?utf-8?B?dnpWTTNEQ09VZFZLMFNLbnIxQmJHeTIrTk13WElJMElrNVkyWlVPQmJiNTdV?=
 =?utf-8?B?b1NFWkErZmdocXBwSjEwaXcvdjFwaGJIV1hzSUh1YW5KcE1FaHQvL0FiR0s3?=
 =?utf-8?B?VGVVbWhsbm5Rd1MrZEFwWmVWczBQbGd3aCtXb3U5VGE0N2lDMmg0L1E3bEt1?=
 =?utf-8?B?WlVGVzhUWFZHclQ3SXJ2QWpNd0tWZUVMeEkzRTlEWEJzMmYzbnRyb0lLam8x?=
 =?utf-8?B?cW05bGU4YjJKWGdXODY0T1FQTER4STlteGllTEl2VXlkbGFNQU5SdG1IWHBT?=
 =?utf-8?B?UzRHRzQ3MjNFZTVjZnQvekdhZ2JubXhSeXVRY3dES3czZkpRVWZoZGt1Rmlh?=
 =?utf-8?B?M0V0eVlaSTV0TldvL3VEN2RUNUxvNGxzOVR3Znh5cHhvT2pWblJiOUZqMG9Z?=
 =?utf-8?B?RjlBNVJFcFF0algwVVJ1UG1iWkFSMC9GVGJYTVp3cnZEWTZET2duWTg5cC9O?=
 =?utf-8?B?b0FIZ1ZRNStNeWk4WG5VYk5KNmEyYjhYenBGbS96QlNwa1JzUkx1anRheHVs?=
 =?utf-8?B?L1pHRC9wOVhCa0NaZTNiSDZYQlNpbGlTZGZCcUgwaG5oUG1vdUFMVGhTT1hw?=
 =?utf-8?B?c0l1WndSNG5xQ0QyY0NPTXpEVU1DZ1BWRTZXRXJHQlUzK2JJV2Uwa0VwK2E1?=
 =?utf-8?B?RHJOM243S0syOUUxeHpmTERhMjYvbm5Uek40a2IwV29RNUxkUzJuSWJUWEND?=
 =?utf-8?B?eVBzc0wyNG0vUXhnQXNKODJLc1ppdGRPZ3d1QmFLUDVjZ1NBSmVZaVA0TW9r?=
 =?utf-8?B?YXluMDJZbUY1MmlZSW1wYllzZ3JkcUtNNGRqY3VBSWJDbXgvaUdJWmJIdFJ6?=
 =?utf-8?B?bGkwZnR1ejFVRXVBZXlzR0ZFZU5xZDhSRjNWNHdkSFk5VWptWkJydytVQnVH?=
 =?utf-8?B?U3l1WEk4WTdTNTY3bytUL2I2WEQ4akl5VG9oUlVkY3ZMeDJzR0lmRE9ueUlC?=
 =?utf-8?B?OUZ5YmhsajFjTWpaT2tqcXIzaFI5bnJWWlNuNEFqYndYSFBhbmdacE5jU2VT?=
 =?utf-8?B?VDFJTUxNeU5NcEdhMHppNmc3ZmljbXRvQjlXMkpkSEozdmZwai9ZVExtYmRT?=
 =?utf-8?B?cFpBdW1yYy9xOXd3SnE0bUtzNlJydTI3MHkyd2FPcjF6OHNYdFhzMmdSN2FK?=
 =?utf-8?B?dHl1YjUvSTYzNlNLZ3p6eWh2NTZ1b3lyNDVOUWo3NTVqSEE5ZE02K3hLTUlO?=
 =?utf-8?Q?Vx74b10g6+9vE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S1FZREMxMHpIOUJuemN3SHZzOGJ6UUNBdHJsK0RmS0xJdVlFVEwyRDFpNGZO?=
 =?utf-8?B?cVM1SDdESFRXRzE4aTdFYzF5VGNCejlJbmdZSjFxa1ZIUytTeCtvcUtCUXhS?=
 =?utf-8?B?VVJPbDNHZVUvYWNBZ2p2OTMrZ2xGUU1HMHZhL0dicHZteEVjdmZuaG14MHlq?=
 =?utf-8?B?S0dhWDR0SEUyM3dlZDUydlhwN0Fra3FqbFV3M2drbzlqMmhlbUJ1d3ZSUHlJ?=
 =?utf-8?B?K1V5ZmRTSEppaTdjVERwWmVLQ0l6UDU3bkErUTJxQnpFVFMrcDd3dFFEamRN?=
 =?utf-8?B?NWRjWERlczIzNnBlWU00ZUlubmt4VFF5SWcxakhZS0EyRWFqMEJJRnZYLzYz?=
 =?utf-8?B?dk9zRnRvNjJUeWVsQjNJWjlmNTdHVTdwOUxYbUxyTjZUTTFMUVpkNVkzZVY5?=
 =?utf-8?B?QlVJZVhBb1FBUmFuVHNIWW9hWVJBSWNrakJRbzlvL1Z4Mm05dGtjdERoWStw?=
 =?utf-8?B?K3ZNVFZ1dkFRYm9mTmxXUzkwRDdvblhEZUZhUmYrQ1poSVd3RmIvTThYaFpx?=
 =?utf-8?B?SWZaME5MTi92ejNWTHdQTGxSRGZGWHh2MmFkVy9pblZ6K0d1Rmt5c29SWHF5?=
 =?utf-8?B?QUFpT0FILzRFMFpZSU9UTGUrZU1vS3ZDWlNVNm1NdDBpYy8raG5VUmpBTUxT?=
 =?utf-8?B?NDIxcFJkVGxhOGxVdWhPVkJFNjJwNnQrL1lDdXM5b0l0eWNIMVNSTmtHMk4x?=
 =?utf-8?B?VzNwUlFreGZlZmtYOHZwa3doM0tjcCtZWGlIZEZodUdVRDUyKy93cko4SVR0?=
 =?utf-8?B?SkdRVjQxdVUrcktVN0hmMWN4T04wY3dVSGd5Ry9BOU04ZWlhTkE0Y29TTjQ1?=
 =?utf-8?B?Q3VDVUloODBwT3FoalNvZEtHdjAvVndUa3dCR3ZXMTVxVE5hNXlWdUZUUVJX?=
 =?utf-8?B?U1VXTGRUdDJwaHpITVMzWThXUmVEenR6UDJrSnlGbGt1endrbDcya1h1T0k2?=
 =?utf-8?B?UVJDSUM0NDB3TUJoZU5seEZOYURiRi9oUmY1UFdqZHFza0drc282M1BvTmtY?=
 =?utf-8?B?ZmZJNGtrMTlxMU0ySTg5UHBuOGVTZXIrMDBDSFIyR1BqVXdkY1FWaGszSVBR?=
 =?utf-8?B?L3d0TVVBVU1IUW9IT2pTY1krSi9icHQwOTQ0UmxrYW5JQjlQMHpKU1l0UmVX?=
 =?utf-8?B?RFhWTXFqMG54bGJ4L3V3K1hOZjVzUmVHZkYyWE93MTFpUFMrdGJubHE2Rzd3?=
 =?utf-8?B?WVN4Nks2VnZBdEhHTHNwMzlYbDZoUytBaVdmUWo3TXBWTkNMZUxEKzAvZE9u?=
 =?utf-8?B?ak1nbEkwUHU0enFqN0Y4MGNOTG9leU1OWEp6dFFMcGovYVYrNmdNY29KZ1My?=
 =?utf-8?B?NG4rZzRHbThSZ2pka0hxWFhybzQwTFR0MGY4cnJENHZxSklMcG11eVNkdFA4?=
 =?utf-8?B?NitqV0RsQjNLY2I0WkVoZE1mV2QxL0d1VzV2L2ZjSHF5YkJYQndycHl4QWpX?=
 =?utf-8?B?U0VrRWVPRWlTdmp1dU83TmlhdlJkd2tUSDNWNWlGUzJwaVlXTDQvLy8vRHFo?=
 =?utf-8?B?MUNtdkxWRGMrZlhOYXBlZzNtV3ZaVWc4Z0hKWXppdUJxMUd2ZlM1RmZ3RE93?=
 =?utf-8?B?TWZVeXhnVFdTNlJvZmptODIwNDZpVFU2V1k1Y21aR1J1UGwzaVRrZ2hFeDRO?=
 =?utf-8?B?UDNiSUtDTStxaXhtcWxkVCtRK0FvVWt0U3A5ZlExN0t6WnpDSWIrbkV4VnF5?=
 =?utf-8?B?WDZsRCtWclVJMkF4Rjh3Q3M3QUVKZ3hBRkNnUGFUbWF3U3ZINXZSN3ZvTFdV?=
 =?utf-8?B?eTRCNjlOc1A2MlBRdml3YlBRZURkTHlwMkJkaENGZlF5dWFFcm01eEJNNnpM?=
 =?utf-8?B?MGRiZHJ1NUxKczZJa2k1QU84NVUrTC85cTF2K29XNjlTS0c2TGZhc00rU0Jo?=
 =?utf-8?B?Y0tmTWZ4U3lwRFk1ckxCWHJoMEFCb1hNUmFzK1hsQTQ2Y0NUa2o3UEdUSFNK?=
 =?utf-8?B?N282QW9Gc25KVkZZVUlkRFFrNlZweXg5TDlZNFpjMXg1cVpVcWNSRVF2N2pq?=
 =?utf-8?B?OURBUGtJOTJSdWd5SVpCbHhaWUNBcUx6R1B5TjRXNEJhaktqd3Zuam5pNVlR?=
 =?utf-8?B?YTk5VXV6WXFvU00vTFRlNWZDbDU1c3RpTmxqRno4WkZjS3czL0VoT0hDbEY0?=
 =?utf-8?B?ZTZQNnpmeldhdHAyT00rbXB0WHhGcndXRm11WnBKdDlWcEZKb1FES3RDV3VT?=
 =?utf-8?Q?U8y1TPSui4ICVnrvZ5kJ05A=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3deba1cf-a9fc-44e9-e1c3-08dd4a065691
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 19:08:44.2247 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n/5bmtBB+Pl+y7bIMfd4JNKUkUhJ5T4lulzZ0SpP1QSYIb1EYLDN6yPu+CnSRXaBv6/VfEAF4HbwRknjkvOAERxAtF+rGQcbXg79+oCzhZ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6983
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



On 10-02-2025 23:26, Ghimiray, Himal Prasad wrote:
> 
> 
> On 08-02-2025 03:49, Lucas De Marchi wrote:
>> xe_display_fini() undoes things from xe_display_init() (technically from
>> intel_display_driver_probe()). Those `goto err` in xe_device_probe()
>> were wrong and being accumulated over time.
>>
>> Commit 65e366ace5ee ("drm/xe/display: Use a single early init call for
>> display") made it easier to fix now that we don't have xe_display_* init
>> calls spread on xe_device_probe(). Change xe_display_init() to use
>> devm_add_action_or_reset() that will finalize display in the right
>> order.
>>
>> While at it, also add a newline and comment about calling
>> xe_driver_flr_fini.
>>
>> Cc: Maarten Lankhorst <dev@lankhorst.se>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>   drivers/gpu/drm/xe/display/xe_display.c | 22 ++++++++++++----------
>>   drivers/gpu/drm/xe/display/xe_display.h |  2 --
>>   drivers/gpu/drm/xe/xe_device.c          | 21 +++++++++++----------
>>   3 files changed, 23 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/ 
>> drm/xe/display/xe_display.c
>> index 651799c946ace..302f533af037d 100644
>> --- a/drivers/gpu/drm/xe/display/xe_display.c
>> +++ b/drivers/gpu/drm/xe/display/xe_display.c
>> @@ -161,27 +161,29 @@ int xe_display_init_early(struct xe_device *xe)
>>       return err;
>>   }
>> -int xe_display_init(struct xe_device *xe)
>> +static void xe_display_fini(void *arg)
>>   {
>> +    struct xe_device *xe = arg;
>>       struct intel_display *display = &xe->display;
>> -    if (!xe->info.probe_display)
>> -        return 0;
>> -
>> -    return intel_display_driver_probe(display);
>> +    intel_hpd_poll_fini(xe);
>> +    intel_hdcp_component_fini(display);
>> +    intel_audio_deinit(display);
>>   }
>> -void xe_display_fini(struct xe_device *xe)
>> +int xe_display_init(struct xe_device *xe)
>>   {
>>       struct intel_display *display = &xe->display;
>> +    int err;
>>       if (!xe->info.probe_display)
>> -        return;
>> +        return 0;
>> -    intel_hpd_poll_fini(xe);
>> +    err = intel_display_driver_probe(display);
>> +    if (err)
>> +        return err;
>> -    intel_hdcp_component_fini(display);
>> -    intel_audio_deinit(display);
>> +    return devm_add_action_or_reset(xe->drm.dev, xe_display_fini, xe);
>>   }
>>   void xe_display_register(struct xe_device *xe)
>> diff --git a/drivers/gpu/drm/xe/display/xe_display.h b/drivers/gpu/ 
>> drm/xe/display/xe_display.h
>> index e2a99624f7064..685dc74402fb8 100644
>> --- a/drivers/gpu/drm/xe/display/xe_display.h
>> +++ b/drivers/gpu/drm/xe/display/xe_display.h
>> @@ -22,7 +22,6 @@ int xe_display_probe(struct xe_device *xe);
>>   int xe_display_init_early(struct xe_device *xe);
>>   int xe_display_init(struct xe_device *xe);
>> -void xe_display_fini(struct xe_device *xe);
>>   void xe_display_register(struct xe_device *xe);
>>   void xe_display_unregister(struct xe_device *xe);
>> @@ -54,7 +53,6 @@ static inline int xe_display_probe(struct xe_device 
>> *xe) { return 0; }
>>   static inline int xe_display_init_early(struct xe_device *xe) 
>> { return 0; }
>>   static inline int xe_display_init(struct xe_device *xe) { return 0; }
>> -static inline void xe_display_fini(struct xe_device *xe) {}
>>   static inline void xe_display_register(struct xe_device *xe) {}
>>   static inline void xe_display_unregister(struct xe_device *xe) {}
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/ 
>> xe_device.c
>> index 36d7ffb3b4d90..ac3e344fe04ec 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -735,6 +735,7 @@ static int probe_has_flat_ccs(struct xe_device *xe)
>>               "Flat CCS has been disabled in bios, May lead to 
>> performance impact");
>>       xe_force_wake_put(gt_to_fw(gt), fw_ref);
>> +
>>       return 0;
>>   }
>> @@ -803,22 +804,26 @@ int xe_device_probe(struct xe_device *xe)
>>       err = xe_devcoredump_init(xe);
>>       if (err)
>>           return err;
>> +
>> +    /*
>> +     * From here on, if a step fails, make sure a Driver-FLR is 
>> triggereed
>> +     */
>>       err = devm_add_action_or_reset(xe->drm.dev, xe_driver_flr_fini, 
>> xe);
>>       if (err)
>>           return err;
>>       err = probe_has_flat_ccs(xe);
>>       if (err)
>> -        goto err;
>> +        return err;
>>       err = xe_vram_probe(xe);
>>       if (err)
>> -        goto err;
>> +        return err;
>>       for_each_tile(tile, xe, id) {
>>           err = xe_tile_init_noalloc(tile);
>>           if (err)
>> -            goto err;
>> +            return err;
>>       }
>>       /* Allocate and map stolen after potential VRAM resize */
>> @@ -832,17 +837,17 @@ int xe_device_probe(struct xe_device *xe)
>>        */
>>       err = xe_display_init_early(xe);
>>       if (err)
>> -        goto err;
>> +        return err;
> 
> Currently, xe_oa_fini and xe_heci_gsc_fini won't be called in case of an 
> error. This is incomplete without also moving xe_oa_fini and 
> xe_heci_gsc_fini under devm_add_action_or_reset.

xe_oa_fini is addressed in further patches and xe_heci_gsc_fini is 
already in cleanup path. With that patch LGTM

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

> 
> 
>>       for_each_tile(tile, xe, id) {
>>           err = xe_tile_init(tile);
>>           if (err)
>> -            goto err;
>> +            return err;
>>       }
>>       err = xe_irq_install(xe);
>>       if (err)
>> -        goto err;
>> +        return err;
>>       for_each_gt(gt, xe, id) {
>>           last_gt = id;
>> @@ -902,8 +907,6 @@ int xe_device_probe(struct xe_device *xe)
>>               break;
>>       }
>> -err:
>> -    xe_display_fini(xe);
>>       return err;
>>   }
>> @@ -924,8 +927,6 @@ void xe_device_remove(struct xe_device *xe)
>>       xe_device_remove_display(xe);
>> -    xe_display_fini(xe);
>> -
>>       xe_oa_fini(xe);
>>       xe_heci_gsc_fini(xe);
> 

