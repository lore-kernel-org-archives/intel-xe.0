Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8724E7718B
	for <intel-xe@archiver.kernel.org>; Mon, 23 Dec 2024 10:25:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B04D10E308;
	Mon, 23 Dec 2024 10:25:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j9+ab8mX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70EB110E308
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Dec 2024 10:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734949554; x=1766485554;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jEFPJPTR9k6/AAIW+/hTb/5suRvO/10ogsJwCQZlvcE=;
 b=j9+ab8mXkKCXuSOKkOS7QcQb5FwR10N5ej/nAx3I7kx6pZVpdEkvhxa6
 rEeCBi6uEa2CwBSvXISafF6b5C2Ma3TlL3Ev0iIslioCwldRE2teHiN5n
 N4nMf4QzNsv73rM29ciwlatsLgRBSuZHxtg28JvZfjw7xF7PjsRgA2S/6
 Xy3atGE3wYdZqQa+pdVSZVOtTXvktkSZjRYhExJIPZv3AB/dBY0a0x/WH
 ZabjJXaOZGDCTEj2xo/xMucWFiVlekhxFrVNs7WyXE65VVnhSv/uoSdSQ
 Ldl+8/Z6mkil9oy9dmU6Dx4PJyECESkk3c53W3vc1Nbi97faXWcdL7vwe w==;
X-CSE-ConnectionGUID: dMQW51LrR2q6ceUtDrCApA==
X-CSE-MsgGUID: iDtrJs4QSTqwio/lONPDaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11294"; a="35293135"
X-IronPort-AV: E=Sophos;i="6.12,256,1728975600"; d="scan'208";a="35293135"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2024 02:25:54 -0800
X-CSE-ConnectionGUID: rrv2/vPrQ4+wBdWBxBGPJQ==
X-CSE-MsgGUID: DUdmeahMRW6dnqzXxntJQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,256,1728975600"; d="scan'208";a="104033562"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Dec 2024 02:25:54 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 23 Dec 2024 02:25:53 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 23 Dec 2024 02:25:53 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 23 Dec 2024 02:25:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T0lKlPCanKxI5zDolJPlUjQwJN7btdan942ixGTrIR0QByKIsW5huUDrsrrA4M7M06oHyd7LG+CMQwGRIU/8ZDEuD4bj8CZdERxQoX3eIzub9YVlWhGauhDhEP1RTme/RdGRbOYW9ARBzMjNgkqpPCMgaEB8Q7LMFL4BMDi3/2Bs+4952H3tJ4DxRDuoXG9jSleo1rsHcOZmWdkEH8RG0hiOmuFwLR4rZS83Lk6n2suAu6w+eRDd300uTcApBdBpcihvv2yOiXiKQ9t7x4y9hQwIA3c1qkvN2qJk9BsTLMDJaoaQ/DAVIhnIibPWhXXmI61ibGlKtp03Wpw4bYuV7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8KnG2WFW+EuVT5B3oDaJKBnPNygE/7/jb3zXvvvBHOs=;
 b=r2o8SKnY0eBEfWBUfwJVf2sGAy1vW4Ad7Va8PAz1VLoy/oPS0w1Vh9Mn2E+Fz3NHARGwLwwomyRBqRtJIl03H+k4MSDzh8p3hd3zAex2e7VnQrzW/XDpnAmjLk+EPBI005p16cGyd++XnmJsLjQN3EYQQqX8BeGZ6Zessu1DNTep+xR5bCRVLu+OhXjsKfHCRevWWl07ACV2mVwZ9flcmrVwmKeYqsMB6dHOpN9W0WfFu1FyWrVgJb167vBOMly410fZpQbGoUDwSzp3oONSEeovttTEEH/Biuj6S3QSRNgzJ+okmYQwUfOBNPgjRAZGeBUf+ESI8y/Cdn4sZ66NBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by MN0PR11MB6205.namprd11.prod.outlook.com (2603:10b6:208:3c7::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.20; Mon, 23 Dec
 2024 10:25:47 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%5]) with mapi id 15.20.8272.013; Mon, 23 Dec 2024
 10:25:47 +0000
Message-ID: <656c5722-1443-4ca0-a0ec-46ce1e08c020@intel.com>
Date: Mon, 23 Dec 2024 15:55:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/xe: Print vm flags in xe_vm trace print
To: Oak Zeng <oak.zeng@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <Thomas.Hellstrom@linux.intel.com>, <rodrigo.vivi@intel.com>
References: <20241218164833.2364049-1-oak.zeng@intel.com>
 <20241218164833.2364049-3-oak.zeng@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20241218164833.2364049-3-oak.zeng@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0090.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9a::9) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|MN0PR11MB6205:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ecf006b-f2c6-4c59-fa14-08dd233c2a4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K3FySm1XR1BTNnlnMWlUai9mRzBwODM2WE44V0RQWWx0OUNHalBjT0pxTU41?=
 =?utf-8?B?NWtOYnNjZHpzOEZXbkRHZ2pHeC96WXZsR2lmU2ozNXpDOXZLQlNGbkJGN2VD?=
 =?utf-8?B?TE00UzZkVUtxQ3hDS0djcmhoS05HME1sMmVwVGxpSXBGd29qS1dYbklJcXJD?=
 =?utf-8?B?cEdkQTJxcWF0Mi90OGRSWVlZV3RsL0p2TGUyenpkNzQ0TkpLUHFyanZiN2VW?=
 =?utf-8?B?VEpOTkp0MHVKb2Nsd3BvUHhhbUxvbStRS0lJa0pGWHBkVFpuazZCWEVURk83?=
 =?utf-8?B?a3lIaFVtLzNGZTAzblBROGJGRkljTmw2K0NyTThRbHpKNlNhSDM4ZkZGNEVi?=
 =?utf-8?B?b2dRU2JQWmppUUg0SXR2anp3N1RubUs5OHVzQU9LMjAwbjJ5ZUJ0eGR6S0dv?=
 =?utf-8?B?T2lXVnpCZHlzV3VFNGVOUlNpMGVPQWQ0UVF0MTZBeFIwUU9lcHRKMGZHTVJl?=
 =?utf-8?B?VFdNa3ZxZi9iSUhuVTZOQWZ4azFaUUloTjdrWHZpZFhtTXhwcFIxZytTTG40?=
 =?utf-8?B?NVBKWkNmR21mK08wMTg4bFZ5eDA0NFl0b0JzdjZTTU0rdG15R3dSVTdnTHl4?=
 =?utf-8?B?T3dQNjV0ek5VQWpMMGs4QU84V2tzeWl2NWtKQXQvdDkzQ3VsaUVLRmdpOHcv?=
 =?utf-8?B?YkVtMHNLMmxiNWZUN3dEKzJreTdIMXBDVDZlK09QM3ViK29ORnNwUjFpRURV?=
 =?utf-8?B?a3dVb1FZZHE5VmRvRU1aL0xXcUh0am8yd0VlT2pUaDhybDFvb1JCR2NGVGZ2?=
 =?utf-8?B?UlhsWmZkeXFTSFFIcThqd2RoS29pWXRnUlVXMTl4aC9ubFVlR0tHVlFKL2ll?=
 =?utf-8?B?bnpVMU9BWllyZ3hsanZLUGtZM0h1bCs1b2g5R1l2b3lKeURjOWJPVGFoMlFs?=
 =?utf-8?B?ajd1TU9DUW5RaTE0ZFZBRG9pKzRiYjFkVlExMGdtV3lqWXN3eWJVWERXQmN4?=
 =?utf-8?B?RklaTWZrZ2UyUjBuenJ3c0JlZnVPNEFnWTQ0RDE4clJETi9BUnBRUmxhUWd5?=
 =?utf-8?B?bWhhbUwwTzBKckx5QVV5ZjR0NHp5YVAxK2lNTjdDdUxFODJPVlFodGR4RVI1?=
 =?utf-8?B?ZlR0bDRGT2hnU2hleXI2aWh4RmxaWFd5YXl6Y1F3dWZtREFDRGw2blNNSERn?=
 =?utf-8?B?c3FGaEJPamp0WlFjcmlmNXNVb3RoVDdJV1c4Yk5SQ2NCM3RNSDVCaS96dms0?=
 =?utf-8?B?c1dla0VvOFNCWmxUam92V0RNZDc1QkdheWZVb1BCUEdYN011VzdvaE9KZmIr?=
 =?utf-8?B?SFVhemlRaHdzQ1VJWll4N3kxVVRhRWFoMjYzaGtSa2dNSWlvczYwbU5VQnNG?=
 =?utf-8?B?RXRMMkRvYU5QU2NLQ3N2ZFBFT0UyM29Yd3BHVU1PNVRDS2pYWTdmc09VN1hy?=
 =?utf-8?B?ZEtMWHVDQ1cyekc2bm9uSDNtRDhFUlRWU1B2cmtJSmNJbDg4bTBUUEhHRWJU?=
 =?utf-8?B?UVkrS0NNQWlrWUZZZ1U1d0p0NlhSN25IUDlRbE83aVpGOHNKcHhyMzRta0JO?=
 =?utf-8?B?aHB3cWFMajhqYXdTa1B6VjJrMlQ3QVF1VUZZVlZlVWhMZGNZeUI1ZE1ITmRw?=
 =?utf-8?B?QUxvUzRHaVJFaG4wdW5jb1lTRXo1Q1BHcGM4eWNDNEVMYnVmMVlOOTIzSytV?=
 =?utf-8?B?ZHNQenZFTk91RUl0TjFMYVVHM2lFS0Y2b2pBZlVMUTBVbWh0QWlReXZFOWkx?=
 =?utf-8?B?Y015MC95VTBnNXk2cjhRRGx5cjh4WmVaWThLNXVsMUlLWFVCcEEySjJsZkkv?=
 =?utf-8?B?SENFRW9oSHFNSVZVbmc0ZEJGc2xQYnhlbS9aNUdZWW9FdmZlS29OL0dJNEt3?=
 =?utf-8?B?TXQwaHl5NHQ1cVY1L1dETDBydlQvK2RVWjUxdmJhdXM0dmI2VEFFaWRjd0o4?=
 =?utf-8?Q?sI+gyMIbARRB3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OEcyM2RFdUloMTZlTWU1REgxNFRJQTc0VXdpbUg3c21sSk9PM1ZZVFJCbXZ5?=
 =?utf-8?B?d3RRWURVTHlSWnA1a1hoQ3JXWGtuampCSnptNm11cmlTRUg5SWVGUG5EaFQ1?=
 =?utf-8?B?cUtoRnh2MENFem5TSVVTVDNWODVDako0dGRsRjZYanNBY3NrOUV4S0xabzVy?=
 =?utf-8?B?Vk92VGhSb0hoc0QxZDAxeWFXMEZDbE1ybTgrUlNJUVd3MlR6bTNQU3VlSFJr?=
 =?utf-8?B?L25ENmpFWlg3WWdQanNQZkNJN2dnT3JJVnM2TE1meHNiYTVwbTMzSHpmNTgw?=
 =?utf-8?B?Wjh6Y0JXUmtraGtzVnkrclR1VW53UnJVdzZFa2pGZHptd3FQdG4xUjZMQ2t5?=
 =?utf-8?B?dWJFemtmcW1meXhuaDUzRGJGbU4vNWNiejRWWVY5QjNaMnhtWFFsdC9VVUlv?=
 =?utf-8?B?VVB2a1hWWmNnd1ZyTWpLRXl3UEZId0tldXM5Q3NCb2VBMFArdW9BZDA1UmRP?=
 =?utf-8?B?M1BJTkhoc2NkS01RN3YrS2lpcXVZUXVaem80ZHMwdnhkaFpiUkozbVcvTXdE?=
 =?utf-8?B?dXJKWmxDd0lvZk5tZVFDTEY0V2tjMEtLZzFvY3RyMVF4MVMyK2paTkhlN0hD?=
 =?utf-8?B?Z1VHK2JUbWxXeVdxY1o1elcxdDZZY0J3OGdLcVh6cGNDbUFYYWpNSU1tTlFN?=
 =?utf-8?B?Sm5tdkd4NWdoempTZHFVSlp3ZktPKzk2eERBaFdnbGVjOVVzb05nM2t2Y2k1?=
 =?utf-8?B?M1JsUGVWdms4WFZtblNYWjlmUXc0M0Q1UG80cTR2UndPczJoUHMvc2tibSt0?=
 =?utf-8?B?STFCNmZZNHpialNZN2FGcWhENU1uTG9tVkMwR2lVZWFYUFpXNGg1UzhIZ3V4?=
 =?utf-8?B?QnNsZFhPTGo0K0xicVZHTW5KNXZJVHhVSE9DdFE3QlJMQTFMWW1DL1Bzbnpu?=
 =?utf-8?B?TkpMcm1zcnl0Smo1ZzVwM2w4UU5FRy9LTzRZQld3Tm5HSEdNYzVCbllZRThr?=
 =?utf-8?B?Zmp1SWpsYTFyUHR5VXBGaDVacGFvd0tIbFVQM0tPMTFXRzJpZElha2sxbGNX?=
 =?utf-8?B?bUZ4TmFEdVAwUjhtVVByMWowS096ZlYzMEQySWZBeFJvSTFVaURDa29INlNL?=
 =?utf-8?B?WnZkdko1RG1jUmJlZGY0cmNRZnpQOW4wN2NpWmtlZFFubzZFdE1COTIvZHdh?=
 =?utf-8?B?aVdZcHR5eDFZK0I2bEc3dmNQOVFCQko5U2JBUmU1dEF3Z25GeXczcE1BMkZ1?=
 =?utf-8?B?ZHYvYXV4NVNUTldMdGt4UWI4ZGpyU0g0LzRrWEg2bTJiWnhDRWJkNzBaak5G?=
 =?utf-8?B?RUdKUTBxN2RObVR3RUI5aFA3R25JWXB2TlBaRUFwSXk0aHJRdzhGeU5zeXNW?=
 =?utf-8?B?bEhLSFhZSXRNWkp1RXlaNFUyYUJQdWowOEd5UHpnSWRYMHNVSHNoU1orWnE0?=
 =?utf-8?B?clByZ0UrYXV4aDVrVGZYS0ZUVGdCTDR2Tm5LdnVjSVQ2MDY2bVQ5bWZEa000?=
 =?utf-8?B?L1FmdHdDZnZLaFVING5VeUNQUXkrM2h0aTl1Z1N1OTViem04NjZnSEovVDg5?=
 =?utf-8?B?d2hqWG96L3VRVzBsbWFkS1E2cG5tSkJxTGJmR3ZObjFkcTlaV01ZNXJkMkVJ?=
 =?utf-8?B?VkUxNmxJTkdUeER1S1lzZWI4Q1JFNE5TQVNwUVBqd3dKYko1eW14ZmZNd21x?=
 =?utf-8?B?NEdqTy9XWDBFTkR2NXNSdVVUNTZreElXSTZkQXhORHBVZGRWZVVoRkRaaHhN?=
 =?utf-8?B?UzN6bXpTa2pOdVlvakRtUGM0ZW12S1VaeG1qMHdyaDNFZlhzN1BpeXE1NnE1?=
 =?utf-8?B?N3ZlQk02MmdnL2QzQlc4SjhGY1RQdThUNjlaa2owaDNYWnBPWmxnWnFCaS9C?=
 =?utf-8?B?WmVucWN0ODJZUllGWlJ3ZmphL2xhUzJRK1VjN3oxa3liemc3aHNZT0RhZDZl?=
 =?utf-8?B?U21FYitsUGwxcVExOVpwdUg0endwdlczUkkyQW1EMUlnN0FsVXhyTlVxR0dl?=
 =?utf-8?B?WElhNjliL3RkdFhNK0VST0Fjc3gyZ21IQnd0eDZaYVlUVzNuM2h0RDUyOGhk?=
 =?utf-8?B?S0pJa2xJYlQ0d05KODMxUmlYdFZmZXZ4SjNCTHFZSDJLRFJsZk12d1VrOUVa?=
 =?utf-8?B?Tm00TWc5RnZGZ3ppMHB0U2J0YkowU2VmSkxaMUkyTXUvcGs1bjlmMGpxeGNa?=
 =?utf-8?B?Q2txNG4yNC9UV0xPd3BqamZmTVoyZWt6Q2NScmV3R0dZTU85QXEyajFyeTlO?=
 =?utf-8?Q?6XGI51N8PCdJnERzZzrnbNc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ecf006b-f2c6-4c59-fa14-08dd233c2a4a
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2024 10:25:47.4372 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VWRIugo51lEuzzgpOnmfhx7pSj4kTXdCB7WCGovQFwhd6EZkz4/QKbqpyryHSsDvGxqZ1prEQsxzGxxUGVoIthX+dvmZORIgif53TtWNsos=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6205
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



On 18-12-2024 22:18, Oak Zeng wrote:
> Print vm flags in xe_vm trace print. This is helpful
> to diagnosis the VM mode of operation.
> 
> Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_trace_bo.h | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_trace_bo.h b/drivers/gpu/drm/xe/xe_trace_bo.h
> index 53807f2ef4808..a46f7cfd92c6f 100644
> --- a/drivers/gpu/drm/xe/xe_trace_bo.h
> +++ b/drivers/gpu/drm/xe/xe_trace_bo.h
> @@ -190,16 +190,19 @@ DECLARE_EVENT_CLASS(xe_vm,
>   			     __string(dev, __dev_name_vm(vm))
>   			     __field(struct xe_vm *, vm)
>   			     __field(u32, asid)
> +			     __field(u32, flags)
>   			     ),
>   
>   		    TP_fast_assign(
>   			   __assign_str(dev);
>   			   __entry->vm = vm;
>   			   __entry->asid = vm->usm.asid;
> +			   __entry->flags = vm->flags;
>   			   ),
>   
> -		    TP_printk("dev=%s, vm=%p, asid=0x%05x", __get_str(dev),
> -			      __entry->vm, __entry->asid)
> +		    TP_printk("dev=%s, vm=%p, asid=0x%05x, vm flags=0x%05x",
> +			      __get_str(dev), __entry->vm, __entry->asid,
> +			      __entry->flags)

Looks good.
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

>   );
>   
>   DEFINE_EVENT(xe_vm, xe_vm_kill,

