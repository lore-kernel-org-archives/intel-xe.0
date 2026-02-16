Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3554FE81A25
	for <intel-xe@archiver.kernel.org>; Mon, 16 Feb 2026 14:37:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEA6710E0C8;
	Mon, 16 Feb 2026 14:37:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q9a3Qx5Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47ABA10E0C8
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Feb 2026 14:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771252656; x=1802788656;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=0hLVolVgyW93wPgZ/khCjH63AkbChQ4C30Bb2kFp42A=;
 b=Q9a3Qx5ZAxpvZ49a5jmaU/AYexvGUSRukqNIQsqKiyputpIYce/2BRPD
 D95JcMrQlr6uz4eor32bM2/z5PZtW2iZ4kQU/sJ1au5Nts6604BTvMC4v
 ungkErQBRqDkfP4f68ovXov0J3xVhA14Q47SUPWvqlSDgJ5eGpsnayO+Y
 yMybfgWK3rHh1Ib6+N9utFvQwYvP8SKobb+UkRGxCuufAOp5oRTx2c1Li
 BQukowU0U61njMzQyHQ/1EEp3EkkZGNpDakV7ukIW5/0ScNxpP9tttNda
 pbzJnrgLLci78jpXQB9TwFeTRvuVCI6sdfP893Wd866CQF9K149qT2GpN Q==;
X-CSE-ConnectionGUID: R6uY7PfiTDi1ElIQKR586g==
X-CSE-MsgGUID: NFqfsgLJRSqoZD5PJ6z09g==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="94963922"
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="94963922"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 06:37:35 -0800
X-CSE-ConnectionGUID: 3wI0nrtpRyC5nlgbOMmKSw==
X-CSE-MsgGUID: wq/iie9UTCCvx1omq4rU8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="212724385"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 06:37:35 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 16 Feb 2026 06:37:33 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 16 Feb 2026 06:37:33 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.13) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 16 Feb 2026 06:37:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x7Us4h3SMzXGmyob5airY3KDEpni9a6Iv9dhLDzCzUdhw5Oi7dIUcSo9jkk/ghA2HP/0+BEFR1vGI3vjD+DmkD25sN3Z9USEO9aIZOWHCkX5nywNpYQY3VPflgo3DC2Vvm1UTEa0T9zelAWOfmgvyAihOslwSfLnTRrVQ5wfgidc+ohw9NQKqi/ifYsz1BIVQV/KyhNwgp0AJMzpXJALHjA4/fxwMjCPPvsi7IWKdagam0rXdMD4A0hH6FPBCRrJqnynxQ7TIYgdNB/k8d5Rmc+j/R/wKOvGUBPC64hw7PejfQQtx8hvDI7m5zXMdF95JP3k4pRUFRxuPXay/iTsGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XwbeB6hx4b76gJk4lB+L2i4RP8FWGCpf9h3qsqJ4OGg=;
 b=zCQHcexC9bUyEQvhOdgLAfgr/Vo/moWoBE6b6s7DHknMBCdewSzsh7n66AkVa/x7pJ2PzPEP4Ho987G3lPVN/GsgdQPTzD+XO5JVDDh6To5v1tCnN4d/hg+CQNFHSLhRNFQsIPc31WG4cmhPsh1C+JrKh9xB02FZAT4GHeYl5bLl55RHCMoQeDQuWtjfP/do5zBVnT9SNT2GMkzUE80XsZvY8wND4pkU4QOCLH9t84ny1Oz33bujChDZY61H/0eo6pi8bVqSQC3ScuaK0hptR5KRar6qefnLtogGkz0o93SMzIC4PUH1KTM7aXwQe4SW9rEe/bSN+q14KXjGHPyl+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by IA0PR11MB7861.namprd11.prod.outlook.com (2603:10b6:208:3de::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Mon, 16 Feb
 2026 14:37:26 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::efd5:501b:c890:26b0]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::efd5:501b:c890:26b0%5]) with mapi id 15.20.9611.013; Mon, 16 Feb 2026
 14:37:26 +0000
Date: Mon, 16 Feb 2026 15:37:22 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/9] drm/xe/pf: Add locked variants of VRAM configuration
 functions
Message-ID: <20260216143722.n3m3fzrso5zadkdd@intel.com>
References: <20260215203323.595-1-michal.wajdeczko@intel.com>
 <20260215203323.595-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260215203323.595-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: VI1PR07CA0302.eurprd07.prod.outlook.com
 (2603:10a6:800:130::30) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|IA0PR11MB7861:EE_
X-MS-Office365-Filtering-Correlation-Id: b64f6ff9-dd65-447d-63df-08de6d68e78c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V2xRS1BxQ3VRN3BTV2E2YVMvOE16dFNGTkRXOGJsLysxdG84NzNmRXN0c1Q4?=
 =?utf-8?B?c2hFSjlQcHlKSEdXaWs4alFnd1p5ckZYUVY5USs4cS9lRjZJTHhDd09jNVc0?=
 =?utf-8?B?cFpLN3NGR0VLd0lUbXhDZTNjZjJwSFJkM0E5V2g5MC9zeGMxbWE5cXFCWlBO?=
 =?utf-8?B?dW0za2hVd21McDBES0ZPdTlWQURCYXgzWjNXazdIWjVpZFdnU3E2ZVZSSkI0?=
 =?utf-8?B?bTV6aEtZSEZqVXhjVTFBT05hVDBiTlVDWG0vRHcvZlMzMENiTWdkKzZEWCtD?=
 =?utf-8?B?Qm13NDdFMmc1N1JPQnEyeGZGcDhIT1RRU0M1Ym9ZY2REcldQZFl3M0JoZDNr?=
 =?utf-8?B?LzIwSTQvbTVTYmNoV3hnTC9rTkhQNzZEV3RoRkQvZi8xcnprdkc5QjN2UmRH?=
 =?utf-8?B?OUdvcXAvaXNsa3RUdVpqLzEvWUxObHIrVldXcXpTbFRqalA5TG01dTZycVdZ?=
 =?utf-8?B?VVh5dy95TUI1TVJvYnBuckZlVWRTMkNCUmZaRGJMZ24yK01vWC9Xa3RGZlFx?=
 =?utf-8?B?cHlJZHRCTk9yZWMwK0I1bkdQTGJTUkZURmZjWDc1bkdRVHlWOE1Hb2RwTG9D?=
 =?utf-8?B?akR1TUQvUVRmQ1B0c25IL3lLMFMwejdxVGdVNnZqUnhUZmNxeTZsQVF1SE1i?=
 =?utf-8?B?QU9qb3h2SUFyeURzcnFYR1FiaVZVVHhjaEVIRGZVMU9VUGhrT3p0Uk10UGdN?=
 =?utf-8?B?d0NVYWJuV1NvdHZVK1NXMCtieWlaeHR5aVg4T2dlMGdURCtKc0xZTGZjZFR5?=
 =?utf-8?B?cGFnZzFRMEZrb1BHdnZNRDlTcWZidkxTOUQwVWtreERtTDZtNXhCcnBoRndW?=
 =?utf-8?B?ZUcwM1UwL3IyQnVuY1gveWdTZ1NUaWlEdis2K040bU96VThmTjg2c3FYcmVO?=
 =?utf-8?B?V0RtZWg1dnAyd1BHMktQSzFMY2tSN1VWbld1VCtPT3hUWGptdm5iNGR0N2tV?=
 =?utf-8?B?SVEzV1VEVi9KbTlSOXBYR2RFVzFranJ5b3pPN1VBbkJVV3RvSzJ3Sm9tckFq?=
 =?utf-8?B?MTdybzJ3T0krS2xhRUJzVjBKaUxNSGFCK2dqaEprVmRqaEIvdCtZUWJjNVhS?=
 =?utf-8?B?MXlyVkI4bVR3djBDUWlEV1cwSjZzbjB0bkwrZjI0NW9KRmpuMWRpRjZnWmhj?=
 =?utf-8?B?UEl6VFNXRWJUUjAwQytaQ01PTmpGNWN4eHExNGE2UHZ5dmlPKzh5UzFKM20z?=
 =?utf-8?B?bGp5ZmtyUW9qRHpJcktpS25oaTZycEF0OFRzaGRpTnVIYWNGN29zZGs1ZEJL?=
 =?utf-8?B?U0dvYXpkaVFSMGJmczlNTWh0amN2enMxUE5oRGtqaEY0T1UyOGhCU3B4SGlD?=
 =?utf-8?B?cWtiU0tWRlNrdjd3ckFLRUo3dHVjdDJRajROM2hVaG5najlZUDBvS1hEamlH?=
 =?utf-8?B?MGpwTHJhYUhBeHE4a2dDVTNrOEVjTFlKT054VWplRDl2RlVUdU9NSGd6T0tw?=
 =?utf-8?B?RU1qcmVObWhPLzBNZnpqZGIxYXRsM0NQM3JQb0twMlZXTmNhSnZCaW5YbTlk?=
 =?utf-8?B?LzNMVXZnN0JUY3IrU3dZSytwaTNrOTdhNm9XbkFEYlBRdk4zNVVXSzF4K0lF?=
 =?utf-8?B?ZnRpOW16cEFoNGVzUHFEaTd2SjkraE5VK2dtN1RBNkdiTlkxK1BEZEN3QkFp?=
 =?utf-8?B?UTBLeVhwZ2xTelBiUEt2QXdjYkNTVUluS0YzajJpbkZyUUxZRGI4MnZTYXhM?=
 =?utf-8?B?VzRJNTlIWTlVczFFc2FOS0hSVUU1WkdoN2tBbHh6STdpeTRWMFlpRlZ3WUNh?=
 =?utf-8?B?VktTcGQ4eU1OamVkbVMyMVJFd0t0VEE4bWRMWDIrYUhPV0lxQ1EzdkJaMTYv?=
 =?utf-8?B?VzRMV3hjU05JUUZqVFJpNGlOY0pXNUZ1U0dHSjBlc1kwRm9HYU5aVWxBRTNl?=
 =?utf-8?B?bFlVemV3dWE2ZkNkZFAzc1JVYlBMZERjRG10bWtwRzQ3cHR2Y3IwSUV5QXdk?=
 =?utf-8?B?VDhuTmFFYmlNMEVuQW5ZOXl4c0c4TE5nbUNvZWx6REJNbkNSY1dFYXgvRTJ1?=
 =?utf-8?B?V0thVmozMGdaU0VDNFNkUHdoQzQ5MVpsdU1iTFJZRndkSi83SzFLRzFZWWNq?=
 =?utf-8?B?R1pDb3dHaUhtTjg4ZzdFZVorTXVhdzRTMndjVSs4bWFYNzRNR1NmTFM3RGVM?=
 =?utf-8?Q?pNQQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VnpsL0VPL05ycVBEUEZLVGptNndCa0RTckdJNkJMclkvZ0JhVHA4TXptcklm?=
 =?utf-8?B?OXlqeERHdDVuVTNNQTZ5NjNlRjFEQ2RwaXExOEpJejZRT29wNXBYbE9tY3FG?=
 =?utf-8?B?bGMyN0RIT1hGY2NQaXhCSUd1bVhTSXlpNUhUejJON3Z1SUdNZUlZREUyZFJ5?=
 =?utf-8?B?eGhGY2QrOUNOWlFMMXBLQis0V3Z0aFJWKzR1K0ViSnVSenUrK1RleXZ6OHNy?=
 =?utf-8?B?cWFKTlFHMDZ6Q2lMbnFBY1hoZ3lieTZiZXJjSHE1cmM0Zm16Z082a0JkYmcx?=
 =?utf-8?B?dnMzU1V3SG94NFRlTjNnQzNObXVtaEQ1OWpZOWdwM1J2VDhiVFJIaHBkcGxj?=
 =?utf-8?B?SlBWWWZEcG8zSFlHdkZab2k1d0N4MysvT3dsdGpFZWlrQnp2NUlyTTVMZ1VP?=
 =?utf-8?B?UCtyTkFUcDhRZXgzTlg1eEpuYnBodXpUNVhpQ0RkTHI1Z215eTd4OUk2K0tU?=
 =?utf-8?B?b1o3bCtLWm5UYjlOSU5Ma1dmM2VZempZdXhLRkVJZ3BkMGtUVm4yMEZRZFlI?=
 =?utf-8?B?MDBiMGE4eTB5cERkU3gzWElKZ3NxTG1iTG9CK3REK3RzUEppOHVPUmhMRjFL?=
 =?utf-8?B?ZFdOL0JsS1NGMGxoOVRoSSt4c2d6ZmZ4Rk1UOGlWRlRVbnVDYWkralc2NDEw?=
 =?utf-8?B?MGlXVm1mYTF1UWpnMmtxVzBJQm9nc2lucVp2cVpYUk1YYlVRQTg5d2RISjZa?=
 =?utf-8?B?UVgyYVplbVI1enN6ZklyaE44dWhlc3Q2bWxyNkJ4Sm5TZlR0aFZMOTNGN0ZB?=
 =?utf-8?B?azgyeGZENDVCNHZCbjZabEFoaDc4a3E5V0lkL2IxV0FUZVc1R05WdER0d2o2?=
 =?utf-8?B?WkpSbC82QmVEeEVFekJvWk5LZk14NnkwcDE2VWpWei9UbE9pQWhBRndqMmtG?=
 =?utf-8?B?QjZBYUlEV0hOK0hpb3JhY0RjZzdvd2o2a3NLTTZIdGFoTFlUNW5pOUU4b1B4?=
 =?utf-8?B?SVF0ek50UFV5ZDFiN29LYXRhdzVFL3RoaUN1aUcvQklncUxkZk53ajZOb2tM?=
 =?utf-8?B?UEt4cWVWdElLL3ArOUtnbUtUYjFHMGV3WUk2V0tBRlBNNXNWdE44bC9jaTNr?=
 =?utf-8?B?NVVuNkthQXo5d3dQL016SFlEdUNCOExCSWMxMkE3L2Y2VTRBRi9CWGUrL0FT?=
 =?utf-8?B?Yy9wUFhVNnlGbTVvUU9kQ0dFSENOckNBSjBSTGI3NXhiUVNoZzMzTDJOeW1R?=
 =?utf-8?B?elA3UFFEQkVjMks1dGxEaWNhcUZPeU9sMkJwS2g2N0ttbEQ4WVk4UENmK1JC?=
 =?utf-8?B?WTI1L2VYeUQ5dHJvQnA4aGRqdUVIZG9MWFQwNld5ZWNCNmhrSjEzcFVOb1Fo?=
 =?utf-8?B?ZVpmQ216QTZucFFmbXB4WkxPMW03MjFoMWV1cER1TlYxNWpMSUhkby9yTC9k?=
 =?utf-8?B?RDArNUZQa2NOaTNzamx3Vy9QczVaazN5NjJBNjMrYlE3UFB6NlNjTTdLS3d4?=
 =?utf-8?B?VHJZbGx6L0JKSUVpQmRpRDRCUTN1SEJNWGgwTUlhTW5rQnBxRWkxUTdoKzhD?=
 =?utf-8?B?d2x1MU1qSU13aGpGTGJDUElrWWkvWHNkMitKS01NU3lrcTlZbGlWeUJvU1Az?=
 =?utf-8?B?dVFnQnd1L0pDaEZPMGJvc1FnRDl6am5hYkgwWGswekZSL1N1Znp2UVFncVpy?=
 =?utf-8?B?YzFldVhVWW9RZkRWbHZTYUpCUGdsVU1jaGgzKzU1N2NjWjZ3U3c0K0JqNkkv?=
 =?utf-8?B?VHhTellUT2ZSOUowUVU0c2E0bDJ1ZXluMUFscTd4VlpYRUdyUG83ZDNBbzcv?=
 =?utf-8?B?aEhjWlNaQ3VpMjBqbXZ3UXNnWmJNNi9jdHJoV1hBVmsvaVhDc2p1Um1Ra0Fn?=
 =?utf-8?B?RVJteGdldTBtMnJRL1VTL1VWODRoQ2VJZWc4SWFrUkppa1Jha2ZWWHdlZEpq?=
 =?utf-8?B?S2Z1bnQ3TktFemM4WEExcHh2TEZDTThsNmhBVURweFlYVmxJQ3BrU3dYdmh6?=
 =?utf-8?B?TU5JdkkycmN4YVBIOVBxaDJheFY2c05YMVMwaFhHTjVOS3dac3VWZ0dlZWh2?=
 =?utf-8?B?STZHTVIvd2ZnWG1aUUxtK3dHU3B4L2NvdysxUXVSYi9uaHpZdUQvOFRmdHU4?=
 =?utf-8?B?N3dVMG93ajlUbEFTZ2JwYldmb0NFT1MxMm1lbGxoVkNsSTdZU0FIWmVTOGl4?=
 =?utf-8?B?QkRnUXVIMkNWQnV5dHAydWZNQ3VpYkFTM2hOaVV0cmtkSnJEcU54RHdEc3Zu?=
 =?utf-8?B?ZEtXY29PUVptZGtEMks5aW1VeDhzNWJCNzAwRzQ2cjE4cnBIRWQ4SDduUHVs?=
 =?utf-8?B?a0drME5lZExJMEtvcTJxVFc2WEpLV0RYWU5CSUsrNzFKaXBUVHkxZGozOTBG?=
 =?utf-8?B?cWl1Q2ZLRUZ0VllZYVJORU1RcWpIei9UWXU4V2tjdm8wK0l3bDJnUzlwYmUy?=
 =?utf-8?Q?3mlH9wd6rQKF/wuE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b64f6ff9-dd65-447d-63df-08de6d68e78c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 14:37:26.3518 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NPFz1jl3QXNyioRs/dFLt++e4IY307ANwqFom+Q/0HuBLfRu2MvV6fpRSFxqaZaFI431BSHGnUxk7FF79nfciyg5q7lQCRi5TV+OCYGvX6E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7861
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on nie [2026-lut-15 21:33:15 +0100]:
> We already have few functions to configure LMEM (aka VRAM) but they
> all are taking master mutex. Split them and expose locked variants
> to allow use by the caller who already hold this mutex.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 77 ++++++++++++++++++++--
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |  4 ++
>  2 files changed, 74 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index 23601ce79348..23af49dc1bfa 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -1754,7 +1754,7 @@ int xe_gt_sriov_pf_config_set_lmem(struct xe_gt *gt, unsigned int vfid, u64 size
>  }
>  
>  /**
> - * xe_gt_sriov_pf_config_bulk_set_lmem - Provision many VFs with LMEM.
> + * xe_gt_sriov_pf_config_bulk_set_lmem_locked() - Provision many VFs with LMEM.
>   * @gt: the &xe_gt (can't be media)
>   * @vfid: starting VF identifier (can't be 0)
>   * @num_vfs: number of VFs to provision
> @@ -1764,31 +1764,94 @@ int xe_gt_sriov_pf_config_set_lmem(struct xe_gt *gt, unsigned int vfid, u64 size
>   *
>   * Return: 0 on success or a negative error code on failure.
>   */
> -int xe_gt_sriov_pf_config_bulk_set_lmem(struct xe_gt *gt, unsigned int vfid,
> -					unsigned int num_vfs, u64 size)
> +int xe_gt_sriov_pf_config_bulk_set_lmem_locked(struct xe_gt *gt, unsigned int vfid,
> +					       unsigned int num_vfs, u64 size)
>  {
>  	unsigned int n;
>  	int err = 0;
>  
> -	xe_gt_assert(gt, vfid);
> +	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
> +	xe_gt_assert(gt, xe_device_has_lmtt(gt_to_xe(gt)));
> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
>  	xe_gt_assert(gt, xe_gt_is_main_type(gt));
> +	xe_gt_assert(gt, vfid);
>  
>  	if (!num_vfs)
>  		return 0;
>  
> -	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
>  	for (n = vfid; n < vfid + num_vfs; n++) {
>  		err = pf_provision_vf_lmem(gt, n, size);
>  		if (err)
>  			break;
>  	}
> -	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
>  
>  	return pf_config_bulk_set_u64_done(gt, vfid, num_vfs, size,
> -					   xe_gt_sriov_pf_config_get_lmem,
> +					   pf_get_vf_config_lmem,
>  					   "LMEM", n, err);
>  }
>  
> +/**
> + * xe_gt_sriov_pf_config_bulk_set_lmem() - Provision many VFs with LMEM.
> + * @gt: the &xe_gt (can't be media)
> + * @vfid: starting VF identifier (can't be 0)
> + * @num_vfs: number of VFs to provision
> + * @size: requested LMEM size
> + *
> + * This function can only be called on PF.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_config_bulk_set_lmem(struct xe_gt *gt, unsigned int vfid,
> +					unsigned int num_vfs, u64 size)
> +{
> +	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	return xe_gt_sriov_pf_config_bulk_set_lmem_locked(gt, vfid, num_vfs, size);
> +}
> +
> +/**
> + * xe_gt_sriov_pf_config_get_lmem_locked() - Get VF's LMEM quota.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier (can't be 0 == PFID)
> + *
> + * This function can only be called on PF.
> + *
> + * Return: VF's LMEM quota.
> + */
> +u64 xe_gt_sriov_pf_config_get_lmem_locked(struct xe_gt *gt, unsigned int vfid)
> +{
> +	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> +	xe_gt_assert(gt, vfid);
> +
> +	return pf_get_vf_config_lmem(gt, vfid);
> +}
> +
> +/**
> + * xe_gt_sriov_pf_config_set_lmem_locked() - Provision VF with LMEM.
> + * @gt: the &xe_gt (can't be media)
> + * @vfid: the VF identifier (can't be 0 == PFID)
> + * @size: requested LMEM size
> + *
> + * This function can only be called on PF.
> + */
> +int xe_gt_sriov_pf_config_set_lmem_locked(struct xe_gt *gt, unsigned int vfid, u64 size)
> +{
> +	int err;
> +
> +	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
> +	xe_gt_assert(gt, xe_device_has_lmtt(gt_to_xe(gt)));
> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> +	xe_gt_assert(gt, xe_gt_is_main_type(gt));
> +	xe_gt_assert(gt, vfid);
> +
> +	err = pf_provision_vf_lmem(gt, vfid, size);
> +
> +	return pf_config_set_u64_done(gt, vfid, size,
> +				      pf_get_vf_config_lmem(gt, vfid),
> +				      "LMEM", err);
> +}
> +
>  static struct xe_bo *pf_get_vf_config_lmem_obj(struct xe_gt *gt, unsigned int vfid)
>  {
>  	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> index 3c6c8b6655af..4a004ecd6140 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> @@ -36,6 +36,10 @@ int xe_gt_sriov_pf_config_set_lmem(struct xe_gt *gt, unsigned int vfid, u64 size
>  int xe_gt_sriov_pf_config_set_fair_lmem(struct xe_gt *gt, unsigned int vfid, unsigned int num_vfs);
>  int xe_gt_sriov_pf_config_bulk_set_lmem(struct xe_gt *gt, unsigned int vfid, unsigned int num_vfs,
>  					u64 size);
> +u64 xe_gt_sriov_pf_config_get_lmem_locked(struct xe_gt *gt, unsigned int vfid);
> +int xe_gt_sriov_pf_config_set_lmem_locked(struct xe_gt *gt, unsigned int vfid, u64 size);
> +int xe_gt_sriov_pf_config_bulk_set_lmem_locked(struct xe_gt *gt, unsigned int vfid,
> +					       unsigned int num_vfs, u64 size);
>  struct xe_bo *xe_gt_sriov_pf_config_get_lmem_obj(struct xe_gt *gt, unsigned int vfid);
>  
>  u32 xe_gt_sriov_pf_config_get_exec_quantum(struct xe_gt *gt, unsigned int vfid);

LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>


> -- 
> 2.47.1
> 

-- 
