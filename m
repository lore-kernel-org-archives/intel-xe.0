Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F13D9D1266A
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 20:18:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CBAD10E2B7;
	Tue,  2 Dec 2025 20:18:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N3pOCECC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8405B10E2B7
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Dec 2025 20:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764706681; x=1796242681;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=YwfoTlqghBt+42MApKhT5xYiwHwbjTY9uAxH+JcEXNA=;
 b=N3pOCECCMzlLC5wI9XNIe5oqrHrgPbnAolbFl+JgxMpjoPKxZsRVR0vQ
 F/Dg6l0Bh9jbidJ9ftgakhpc1I2ssPq5K3R6gcvbCXtu/ffs8zcWhhVAQ
 S/eWLCm6SRAJp/M2mw4XBXPyuNOQFka5sLLmjCpsoy4E7Vkq6oXQJehmf
 aEfh8UKU2EAnPwwbCCgdf1NCtIi4dO0+5eipsK7hn4vgQhjCFI9tN2Ch2
 rMIOe8LW/Da9ktbomP5T+dHq2maGHxrG+Ro7Sn8YqMi9fffSFGUnACwrN
 rkfyQqgw0VhUMkWduzOHox6O//7+TWGhsH5dFTwqHrhF/hlZkIcKYF/oM Q==;
X-CSE-ConnectionGUID: DK0f5JZMTJWZQQnDXGHJMQ==
X-CSE-MsgGUID: EaSOd/s1RPqTKf9ANQIb0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="70547850"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="70547850"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 12:18:00 -0800
X-CSE-ConnectionGUID: EkteUMqGSBOqxyGp9z8Xxg==
X-CSE-MsgGUID: MkBRwwRFSbKkTMDMJEfZ7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="194151128"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 12:18:00 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 12:17:59 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 12:17:59 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.19) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 12:17:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rNjPLr8kmQuprzm9WDwFV0u8Nr8x3LFLKwTbnjHZHsOMoKmBuW+ES9Khd/6ueh2NEptfJAESaxmI2Xhnr0so8rLF4Y8GZv98R8srgHHBeT+VJ79on0sHuYEaT2Rl84A+TRR+ly6lwiG6Mulz32Sc7fEdVvXi0C9h6IBYCbKj35XXjpdOUhIzaaP9n8VwfEgtg3QkqvVzGnSyZrpBarsNYQi+ai3Iq+BCYtikR4TYvRFPIit73Pq16Fz8DKWd4jxMy58kl8fKX8ZUS1ybm4evscQFBNTQ2/kSSgUXt8bzTdojkrL/L4uWKHhcjqZxYFM9adRxXxbknE4LhrIW4rXkxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=npECLdC7zaNbtT+m7Zx5+KFeYpXfhG9jB5hdbAY1lfs=;
 b=nZrZFARqSEX0GTTFcB2khBRrXetttQ1HmlKrN8xJ4QhbV/IHeSm75s7rXJyjj11KN8L7N3D7oLlWhMcRP1lFFikel4Q0LDUO0GwuFcUJpc1ZpqzlEgXt5gctkRcvcv1kxEuLiOOnr1JUtAaaE83SPKZH6RZ2r6ICZj/ThKYQi3xeMG6vYK+eL+KVZFhs1as3Kub3DzjfaUgd7nMqVIk5NMZZGcVUniQbxOlGXN5byWoUYOqp8OenRT3sdGDAoy2mO4wpS6LNXEvw9FFIp2BswhPuTCTJ669o7DTxBN9C2Lhv8/ZOH8Ard2JvyWFvF5cbT+qWN48oCa14kDOssYqbWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by MW4PR11MB6862.namprd11.prod.outlook.com (2603:10b6:303:220::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Tue, 2 Dec
 2025 20:17:56 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 20:17:56 +0000
Message-ID: <454e2e50-6fb8-4577-bc0b-4519b6beaf01@intel.com>
Date: Tue, 2 Dec 2025 21:17:53 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/10] drm/xe/sriov: Add debugfs to set EQ and PT for
 scheduler groups
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20251127014507.2323746-12-daniele.ceraolospurio@intel.com>
 <20251127014507.2323746-22-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251127014507.2323746-22-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR02CA0054.eurprd02.prod.outlook.com
 (2603:10a6:802:14::25) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|MW4PR11MB6862:EE_
X-MS-Office365-Filtering-Correlation-Id: 4343e44f-5067-421e-d462-08de31dfe16b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eTFmZ29LQWUrQm9WYWFKVEhFLzhjWnlKeUhpMEx6YzVmTkk0MHBpdUs4ZXhY?=
 =?utf-8?B?NHBJNkJqNlE2ZkRhWVBYYzlGY290OGxnMlVqNkh6VE12VTNNYjBRak1zUnlv?=
 =?utf-8?B?ejAvNWNTWnBoN3ZJYmZ2Rnlkbzlpd0ZRcmMrMkVnVnA4eE5CTUc4SlNUbUZE?=
 =?utf-8?B?UUtPOFQvTW1tQVpLVnhWdVJ2c1pCdDdsdU5zWlRDeFFxQ2I2ekFCSlpLSkVq?=
 =?utf-8?B?bFV2MUs5TG5EbDlucm5PZHVEdiszNGVFUW4wMUxQb05sZU5DWkpxTUFXZU43?=
 =?utf-8?B?TVc3UU1QUGNubzJoRXdQcEJTbGZla3dqbkU5YXRaYlVUOWRPbVZQTWN0K0M3?=
 =?utf-8?B?WUtCV3E3akpxVHpvOUlXZ2ZvZktXOXFFcU1KeFY3N0JFUUtzRE1ETXN0Qjc3?=
 =?utf-8?B?S0Rrem81aG9ONjBXOXhXbm1icFlXclN0cFFTbFZkUVU3eXVGYkZMVFV2cG5l?=
 =?utf-8?B?MXlXNysyY3Fyd0p4MmdJM29DbDNLaGUrUXRUZE8rak9yOGFIR0ozU3ZSM1Zn?=
 =?utf-8?B?OVMxaHBheFM5OEJPOWZGUUdNMzdxUE9tQnlBSG5lQ0FZNjFKUmZycWdhQWFJ?=
 =?utf-8?B?TGF3bjZqeG0vOXE2RWdrdWQzWE96ais4VFI3UWhLK3k5bTR3L0FPVkVYZ2RE?=
 =?utf-8?B?Tjc3b21EZncyVTJRQXNuV2VVVUh6dkcrazhxLzFWZzFQd1FPcVhBQVJ3ZlVG?=
 =?utf-8?B?OXh4aENZZmgrRjNPQkc3Slp2SkdyYlBtY3lOTkwrbGlwS0plTzFXTEZEZS9a?=
 =?utf-8?B?ZTByZHpBck5zNXF1NmEzK2NSanNYSjhVME1HQjdNWEtMdms1UUdYNjY5c3J0?=
 =?utf-8?B?VVpFYVMwQUo4dXF2UWh0bjk3d2VHR1JFZUZaUnBKUVhYSkVYcVRYQVp3bTNM?=
 =?utf-8?B?MnFpTjQ4dzRxbENWNDlMbGVQcDZDMW5lSFNwWlcxZ295Q1hTMHJOYjk4enNj?=
 =?utf-8?B?ampxYytBTEgzVkxZYTEvc0N4ZmgrZW5PRFMyM093RUZrWkVTNmdiemhuMHlM?=
 =?utf-8?B?UjFuZk1BbmNmVTVNWlNvQy9PdHVxcUlVL0RDenZtbzcwSHpRVHc1R0dnSS9G?=
 =?utf-8?B?aHp1QkNPUURNVkd5aTB0VFJVT3hTMGljYzVRRTNWdDN3d1JZNWpRQWpYWHNu?=
 =?utf-8?B?d2NuSjYvVzFxYUwrQVV1aVpnMVBUUGhHMS9mc2paaWpOZmt2bWsxcmh4MFZu?=
 =?utf-8?B?UEhrM0hhakl2YlBzazdVRFBwOWR0LzlVcHpIVVVGZksyQmRJUFIrbFMzeWly?=
 =?utf-8?B?bW1BalVGZlljNjAvWWVUbVpkRURyVUtvdEozOCtVdG5wbUNadGgybkFrYmFS?=
 =?utf-8?B?MkF0RXFlODVRL3Z6QWlTQjVIaWkzdkwwdi9oR2RsREFMNlBTbEJkQWYwYkxL?=
 =?utf-8?B?T2FXclBSL3VnT0Rabko2VHJkS1p3Sk9wQ1RvTmVVb0ZkTWJDY2dtVzhLV2Vt?=
 =?utf-8?B?UzdTOTFWdXROeVBvSUd4aG1kK3Q2NVYwcnFXalVtV293eXF2ckNFcVQvcDNw?=
 =?utf-8?B?d0NkVFkxRVJMbmtzd3lHZ1NOR0NtMkYwdWJIQmJvQk5BYmlMU2JEKzVrb005?=
 =?utf-8?B?VWluNlRQamoyem02d2swOFBGc01XN0xwTmZsdlpvYXpSVDZCamtPSHlmQ3lt?=
 =?utf-8?B?NTFMMFN6dTMrVnpsQWVFYkNxWW9oRmEwVjJCZkRiVmxtdjA2ejVFaDdqck1M?=
 =?utf-8?B?bE1SQXFtOWNGKzQzS3J6MFA2amRGbXVkMUI3Sk1pOW51a3E1UGVFWGVUa253?=
 =?utf-8?B?WXZvcGRleFF5cmtkTUZtd2RWZW1xamhqK2RCUTgrMTgxSmdxVHFiblA5MkxL?=
 =?utf-8?B?VFFBOHg2UFRUeENMRk5UZ1d0eTIrMVIrS2pxZHZWWlhORVBCQ2gzLzhCamV1?=
 =?utf-8?B?eld2aU1OWUU1UW5wYTZmMU1JM2l0NmZVVlNkazQ3R25LRVRFV21RWFVjRS8y?=
 =?utf-8?Q?sG2Ug/2aDxeOGYUWNnLGS82Ux4zVCKcC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZlBNaTFCUEUrbGtGeXJkSlNRZUhpaUI5Rng1K3JoR1ZPMW0yRVBjYkFVZytE?=
 =?utf-8?B?UnRNS0tlQ0FtanVnNzFFYTVXdnhpeEFSaVNzVU9VejRFbU5GQytYL3NQTmtK?=
 =?utf-8?B?OW9WdE54MVFrSUI3SDhsYngrYnU3Z3ZTM1BOSlNJU1o3TnFva2FIcERubngx?=
 =?utf-8?B?SUxMOVd5VnVlR21ENnU5OWhaaDErODB4YWJBajRmUU5KWTVZcXlHSGJST21O?=
 =?utf-8?B?WHFiRG55Wi92bS9rYU5GZHJsRDQycUpxRStsc2VnTDZFUmxIUVB5ZGxzMWxz?=
 =?utf-8?B?Qk5tY2pxdnVVQ2ZuQVBwT0FYZ3p2RWFxV2lzSkV5bC84ZGw0ajdiS29JeGQw?=
 =?utf-8?B?THNQSGFPL2FlYnc0SDBFcWN0ZzNCV3Bpc3FWa0FjZFFQb1VjK2RkZklDaVIv?=
 =?utf-8?B?di9BL2NpMDdrY0ZaYjdBUHNwd3JQVWtqQTk1ZmpjbkptdTNBa2pRNkZDZmpT?=
 =?utf-8?B?anBIK0NjOSsxVXgwWkpISjlmVUFHTm9SMzU4b2NkQ1hiUGt5dUxVaHlNR2lB?=
 =?utf-8?B?MGpETXREVURKWlN2Y0RvZUJVWjJzOG52a1hiL09EU0VoWGE5Z0krU0xXbStJ?=
 =?utf-8?B?MDRXU2EweUVvdklYdi84SVVZTGRteGRiU2pPWU15UWdxamE2YmZLVEh2aWlK?=
 =?utf-8?B?cWZGZGdyS1hVT2VMYXRVVExyTU1ZYUtyZ1JJczA3NHVTMXFKYnVQMHNxTnRk?=
 =?utf-8?B?ZWMvV3VrNm1pVjlXN0JnZTdMeHRzd2NZRXBPSVc2eUFJcGdwYm9kL28xZzgr?=
 =?utf-8?B?OUNINGY0djViQVZ1ci9VM1dlcm5Ra3BKZUo2SFB4ajl2MmFqZktXMWc2eEFh?=
 =?utf-8?B?MkU1VW4yb0tYTWkvV3p0WEh0N0o3cmVYNkV1ZlAydi8wQkFOTkM0MGw5Sy9N?=
 =?utf-8?B?a056Z3oxOFJhU3JWbCtDVlF5Yk5lNkY4bWhVWUcvOUdocDFGc0dINGI1U25m?=
 =?utf-8?B?cmtFb3NzN0FVcVY1cjJnVHhVKzhvcVBYc1FsNFBYZmNjTDVXQmJkSndQSnU4?=
 =?utf-8?B?a3IrSjVwdDJ3VEltSk1EbmRnSXp5a0JpSmpxWHdHNGZTbm1LNW9FZE5zUFNT?=
 =?utf-8?B?WVg3blpUOXd3cmFNT0pQLzdlSVlIaUp4NTlDZUdKQWZPMytqRWgzcDBPSURD?=
 =?utf-8?B?anRnNk9Hd1FWNXpZWGYyaG44aXhtY2Q2cFJ2RWNUSVVaVU44T1k1NjREb0l6?=
 =?utf-8?B?TU9YRHlrc3NxSjNxd0E2aXgzdzdDQlNzOEZQekt4VE1FamtHZjJOTVVPZTcw?=
 =?utf-8?B?WlZYQVhIUkh4YjhsN1ZnUE9CWkRVLzAvVUpiREdFc2NucW15U01HUnQ5ejd6?=
 =?utf-8?B?SHluN0E3alkvTnhxRnRqTzhJLzFucmQydHYzR1hxUmo1N1p1alNuMHFMMlY2?=
 =?utf-8?B?RUt0T2dnbUZqYmhEL2pWUlFsNVQxZkYwSzIrMWRwVGlwc2ljMVFiczRxc0l2?=
 =?utf-8?B?eEFTZWxnOHlha2RLNEtVUkx6VStjb01kQ1ZBcTI4cHNNYVZBZVRNUk9Xaysz?=
 =?utf-8?B?N0htbko3ZHM3OEdCTTJXYVZXSmNhZ2pyS3pBN2JzUm5EcGNtM2hnZGpVSldw?=
 =?utf-8?B?alk5NXNQbm5GeGJTQkwwaXBQa2ZDMWR1ckMzTEdSR1BNMkZpenIzczhVWGRo?=
 =?utf-8?B?cGNlY0Nya2JXUDNaQU10S2NJdVJWZW9xNVJEbGY3QTRPZnhGNTd6OUx4OElU?=
 =?utf-8?B?Z2lSNGo2RUF4a2Q5OVczSUd2VGliaVJnbTN4RWJmbUkrVDltVHhpZnBrNGpT?=
 =?utf-8?B?S2NKdy9hUHBCVCtVNmFkWEtOTkhSc3pRbVcwNVVJVS92Y2xWUDN6bWMwQzNu?=
 =?utf-8?B?UjJYSW9GQjZrTWZ0dUdUWE1IRlB0Qk9DbVV6di9TRlgrbGIrZmtuZzVRajFE?=
 =?utf-8?B?WGRjWlhZVFhlUW1jSlJiOXZYSDcrRld2WXRId2FSU2RLTE50d1pWcnduYS9p?=
 =?utf-8?B?eS9ManJvZ2U4K0IwQU5ETmxQUVBnb3BpSE9sN2hBOEJrWlFYTUJRaFpsKzBo?=
 =?utf-8?B?Z0RNNithMzhORWFTRTZtRTFCbmN6OW53NmtUT3lMZlNuRGlOZjUvU0pUVW8y?=
 =?utf-8?B?S21JNnZNc3kxUTJYbW8xckgrQ0VuYnVkdStLSktJNTEyMzE5QVQ5SndjckE0?=
 =?utf-8?B?dk5DNVByQ0dPR2pxSkFxaUxSVHBpMVF5N3Fvck92aDh1WCs2M1VTR2tDZENW?=
 =?utf-8?B?L3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4343e44f-5067-421e-d462-08de31dfe16b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 20:17:56.5265 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V5E6bfmRyN6EnIImsqBujfnHm3zeuW+W1KOPjEn4/1h4C2sH4vDqc1dvRx5ecEr3K0yCSju5ox2N1f18kEa8HjVNW3TAt8A8kCOV85Ro6GY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6862
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



On 11/27/2025 2:45 AM, Daniele Ceraolo Spurio wrote:
> A top-level debugfs file is added that allows a user to provide a
> comma-separated list of values to assign to each group. Per-group files

it doesn't need to be comma-separated list, just array of integers

> are also added to allow individual tuning of a specific group.
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c | 173 +++++++++++++++++++-
>  1 file changed, 168 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> index 947e2b92d58a..052510736017 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> @@ -165,24 +165,169 @@ static void pf_add_policy_attrs(struct xe_gt *gt, struct dentry *parent)
>   *              :   ├── gt0
>   *                  :   ├── sched_groups_mode
>   *                      ├── sched_groups
> - *                      :   ├── group0
> - *                          :   └── engines
> + *                      :   ├── exec_quantums_ms
> + *                          ├── preempt_timeouts_us
> + *                          ├── group0
> + *                          :   ├── engines
> + *                              ├── exec_quantum_ms
> + *                              └── preempt_timeout_us

as already commented, per-group EQ/PT are overkill

let just keep array-variants

    *                      ├── sched_groups_exec_quantums_ms
    *                      ├── sched_groups_preempt_timeouts_us

and regular files for groups to show configured engines (if any)

    *                      ├── sched_groups/
    *                          ├── group0
    *                          ├── group1

>   *                          :
>   *                          └── groupN
> - *          :                   └── engines
> + *                              ├── engines
> + *                              ├── exec_quantum_ms
> + *          :                   └── preempt_timeout_us
>   *          ├── vf1
>   *          :   ├── tile0
>   *              :   ├── gt0
>   *                  :   ├── sched_groups
> - *                      :   ├── group0
> - *                          :   └── engines
> + *                      :   ├── exec_quantums_ms
> + *                          ├── preempt_timeouts_us
> + *                          ├── group0
> + *                          :   ├── engines
> + *                              ├── exec_quantum_ms
> + *                              └── preempt_timeout_us
>   */
>  
>  struct sched_group_info {
>  	struct xe_gt *gt;
> +	unsigned int vfid;
> +	u8 group_id;
>  	u32 *masks;
>  };
>  
> +static int sched_groups_config_show(struct seq_file *m, void *data,
> +				    void (*get)(struct xe_gt *, unsigned int, u32 *, u32))
> +{
> +	u32 values[GUC_KLV_VGT_POLICY_ENGINE_GROUP_MAX_COUNT];
> +	struct drm_printer p = drm_seq_file_printer(m);
> +	struct sched_group_info *groups = m->private;
> +	struct xe_gt *gt = groups[0].gt;
> +	unsigned int vfid = groups[0].vfid;
> +	bool first = true;
> +	u8 g;
> +
> +	get(gt, vfid, values, ARRAY_SIZE(values));
> +
> +	for (g = 0; g < ARRAY_SIZE(values); g++) {
> +		drm_printf(&p, "%s%u", first ? "" : ",", values[g]);

maybe we should print values without commas ?

	20 20 30

it's more likely to be accepted when we promote that to sysfs

> +
> +		first = false;
> +	}
> +
> +	drm_printf(&p, "\n");
> +
> +	return 0;
> +}
> +
> +#define MAX_EGS_ARRAY_SIZE (GUC_KLV_VGT_POLICY_ENGINE_GROUP_MAX_COUNT * sizeof(u32))
> +static ssize_t sched_groups_config_write(struct file *file, const char __user *ubuf,
> +					 size_t size, loff_t *pos,
> +					 int (*set)(struct xe_gt *, unsigned int, u32 *, u32))
> +{
> +	struct sched_group_info *groups = file_inode(file)->i_private;
> +	u32 values[GUC_KLV_VGT_POLICY_ENGINE_GROUP_MAX_COUNT];
> +	struct xe_gt *gt = groups[0].gt;
> +	unsigned int vfid = groups[0].vfid;
> +	int *input;
> +	u32 count;
> +	int ret;
> +	int i;
> +
> +	if (*pos)
> +		return -ESPIPE;
> +
> +	if (!size)
> +		return -ENODATA;
> +
> +	ret = parse_int_array_user(ubuf, min(size, MAX_EGS_ARRAY_SIZE), &input);
> +	if (ret)
> +		return ret;
> +
> +	count = input[0];

need to check against GUC_MAX_GROUPS

> +	for (i = 0; i < count; i++) {
> +		if (input[i + 1] < 0 || input[i + 1] > S32_MAX) {
> +			ret = -EINVAL;
> +			goto out;
> +		}
> +
> +		values[i] = input[i + 1];
> +	}
> +
> +	xe_pm_runtime_get(gt_to_xe(gt));
> +	ret = set(gt, vfid, values, count);
> +	xe_pm_runtime_put(gt_to_xe(gt));
> +
> +out:
> +	kfree(input);
> +	return (ret < 0) ? ret : size;
> +}
> +
> +#define DEFINE_SRIOV_GT_GRP_CFG_DEBUGFS_ATTRIBUTE(CONFIG, TYPE, FORMAT)		\
> +static int sched_groups_##CONFIG##s_show(struct seq_file *m,			\
> +						  void *data)			\
> +{										\
> +	return sched_groups_config_show(m, data,				\
> +					xe_gt_sriov_pf_config_get_groups_##CONFIG##s); \
> +}										\
> +										\
> +static int sched_groups_##CONFIG##s_open(struct inode *inode, struct file *file)\
> +{										\
> +	return single_open(file, sched_groups_##CONFIG##s_show,			\
> +			   inode->i_private);					\
> +}										\
> +										\
> +static ssize_t sched_groups_##CONFIG##s_write(struct file *file,		\
> +					      const char __user *ubuf,		\
> +					      size_t size, loff_t *pos)		\
> +{										\
> +	return sched_groups_config_write(file, ubuf, size, pos,			\
> +					 xe_gt_sriov_pf_config_set_groups_##CONFIG##s); \
> +}										\
> +										\
> +static const struct file_operations sched_groups_##CONFIG##s_fops = {		\
> +	.owner = THIS_MODULE,							\
> +	.open = sched_groups_##CONFIG##s_open,					\
> +	.read = seq_read,							\
> +	.llseek = seq_lseek,							\
> +	.write = sched_groups_##CONFIG##s_write,				\
> +	.release = single_release,						\
> +};										\
> +										\
> +static int group_##CONFIG##_set(void *data, u64 val)				\
> +{										\
> +	struct sched_group_info *gi = data;					\
> +	struct xe_device *xe = gt_to_xe(gi->gt);				\
> +	int err;								\
> +										\
> +	if (val > (TYPE)~0ull)							\
> +		return -EOVERFLOW;						\
> +										\
> +	xe_pm_runtime_get(xe);							\
> +	err = xe_sriov_pf_wait_ready(xe) ?:					\
> +	      xe_gt_sriov_pf_config_set_group_##CONFIG(gi->gt, gi->vfid,	\
> +						       gi->group_id, val);	\
> +	if (!err)								\
> +		xe_sriov_pf_provision_set_custom_mode(xe);			\
> +	xe_pm_runtime_put(xe);							\
> +										\
> +	return err;								\
> +}										\
> +										\
> +static int group_##CONFIG##_get(void *data, u64 *val)				\
> +{										\
> +	struct sched_group_info *gi = data;					\
> +										\
> +	*val = xe_gt_sriov_pf_config_get_group_##CONFIG(gi->gt, gi->vfid,	\
> +							gi->group_id);		\
> +	return 0;								\
> +}										\
> +										\
> +DEFINE_DEBUGFS_ATTRIBUTE(group_##CONFIG##_fops, group_##CONFIG##_get,		\
> +			 group_##CONFIG##_set, FORMAT)
> +
> +DEFINE_SRIOV_GT_GRP_CFG_DEBUGFS_ATTRIBUTE(exec_quantum, u32, "%llu\n");
> +DEFINE_SRIOV_GT_GRP_CFG_DEBUGFS_ATTRIBUTE(preempt_timeout, u32, "%llu\n");
> +
>  static int sched_group_engines_info(struct seq_file *m, void *data)
>  {
>  	struct drm_printer p = drm_seq_file_printer(m);
> @@ -261,6 +406,18 @@ static void sched_group_info_register(struct xe_gt *gt, unsigned int vfid)
>  		goto out_err;
>  	parent->d_inode->i_private = infos;
>  
> +	/*
> +	 * assign group 0 gt and VF id values early as they're used by the
> +	 * exec_quantums debugfs to set quantums for all groups
> +	 */
> +	infos[0].gt = gt;
> +	infos[0].vfid = vfid;
> +
> +	debugfs_create_file("exec_quantums_ms", 0644, parent, infos,
> +			    &sched_groups_exec_quantums_fops);
> +	debugfs_create_file("preempt_timeouts_us", 0644, parent, infos,
> +			    &sched_groups_preempt_timeouts_fops);
> +
>  	for (g = 0; g < num_groups; g++) {
>  		struct sched_group_info *info = &infos[g];
>  		u32 base = g * GUC_MAX_ENGINE_CLASSES;
> @@ -273,10 +430,16 @@ static void sched_group_info_register(struct xe_gt *gt, unsigned int vfid)
>  			goto out_err;
>  
>  		info->gt = gt;
> +		info->vfid = vfid;
> +		info->group_id = g;
>  		info->masks = &policy->guc.sched_groups.modes[mode].masks[base];
>  
>  		dent->d_inode->i_private = info;
>  		debugfs_create_file("engines", 0644, dent, info, &sched_group_engines_fops);
> +		debugfs_create_file("exec_quantum_ms", 0644, dent, info,
> +				    &group_exec_quantum_fops);
> +		debugfs_create_file("preempt_timeout_us", 0644, dent, info,
> +				    &group_preempt_timeout_fops);
>  	}
>  
>  	return;

