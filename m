Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3FA0EDE99A
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 16:36:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D8BD10E16F;
	Tue, 10 Sep 2024 16:36:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="STovW4Pl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AB9010E16F
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 16:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725986206; x=1757522206;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=8NVCa3cHOgQQ/xO25rfs0e+KxFprY1ws160jRKpMTMQ=;
 b=STovW4Ple5KWS7oEW7A/nfn3eCnNklGwX6sTv163HNC+0RLhOtCseR5O
 su5Xo5ILR42Kp9WDS7GU4XR9c4TvpYn/WFFUtRlNY/zLm7p1ISLh4WKTT
 8iJEH2YkCHquG8QdvwbBINlm8VwmSHs9Ezc6EKQCJGBJ4KSWvCJK95pCW
 /qoDySIvvv88P7cnwD7Hrn9isJeJOH2GR7Tein2+ioZTe3kvqhT+H318W
 y3NLonPBOpG7mLmstTnNkTbZULbY3m8nDJiZ8HUn+l9d6K40KNcoZzdAw
 LeXfO/swR6w4Mrj5VckGPe/UZFQC1vUjCdpiuZFCaEno0vdJNCCTc4C7S w==;
X-CSE-ConnectionGUID: jprvKxXOQluPfQ/4uJot+Q==
X-CSE-MsgGUID: SeJajzgWRTenaVvg+BUf7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="35342473"
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="35342473"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 09:36:46 -0700
X-CSE-ConnectionGUID: FnthjcibR0O4o//RGASKkA==
X-CSE-MsgGUID: tWPEbYohSHu3QZG92oNA1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="67135593"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Sep 2024 09:36:45 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 09:36:45 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 09:36:44 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Sep 2024 09:36:44 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 09:36:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ERNqfwr7oPDjnCuh18q5571X5LUyhySO6/ZxnpykNQGz4+TefHBd4gYEEz53Jrv5N5f16mel/kXk1J6ICULVe6C7sPV6nEDqpFrKyJi45KRLGbgrL3hiwiaFyCMrLIfqsAH6Vp8vsXnSGNwLGvXyIfGDw6UpAI6P64P6Gp5Ktdo6runVbDFAJcQBI/zM0Ic0yH/F8rBwhnp0bIh8RrvT0df8XX+btgJqv+Bx/Gpxd+NCv6J2mbX3//3h6xonwrueVf4GWpLviv804SYXPPcd81qXyeBt+zj2ecmxd3N6QLI4wuFjuXzek248bvAFzH2HNJUCfqCe1vXD4ZyFgrQ0+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ERxv+B1LtlA2sG8rS/6J/5KR6gOufe/PWd8ub0rgOCI=;
 b=Rme73VhShfFqi+Mpn/xef3YFWh1qbnx2RGc9to4C7q+OxukRMjCT/+sbs9y2jyurt6NBOvxdJuCvBiHZeSiZmQMJ6ChHPAN+60lzPVFgjHBjUvq8RsPV3X8GQVubUuBuLTgBKCMcpM3wGlIx1rS/ei9oWdG7m6+Gi1HDjHbh/zKEkv68qZtHawUKYWlOiMyCdT7B7hjoUVNZjzTYLLXyOtMPz5cbuweKpbdvw2ON6hQEpMgt+LF7imc1yj41SCdpY3OlKn2m+bRe+NO1VlkQgiJG+XPorsUZG2HxeSZpLXcO8kwqUTzNYir6ta54O/rSB2GaT31st1hSMfMUix2I/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3238.namprd11.prod.outlook.com (2603:10b6:a03:7e::30)
 by BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Tue, 10 Sep
 2024 16:36:40 +0000
Received: from BYAPR11MB3238.namprd11.prod.outlook.com
 ([fe80::ba3:e9e3:27c2:bd03]) by BYAPR11MB3238.namprd11.prod.outlook.com
 ([fe80::ba3:e9e3:27c2:bd03%7]) with mapi id 15.20.7939.022; Tue, 10 Sep 2024
 16:36:37 +0000
Message-ID: <0f18d2ab-9b81-4baa-a3f4-e52a311883c0@intel.com>
Date: Tue, 10 Sep 2024 22:06:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/display: Workaround for odd panning for planar
 yuv
To: Nemesa Garg <nemesa.garg@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20240910143757.143614-1-nemesa.garg@intel.com>
Content-Language: en-US
From: "Pottumuttu, Sai Teja" <sai.teja.pottumuttu@intel.com>
In-Reply-To: <20240910143757.143614-1-nemesa.garg@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0P287CA0009.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::9) To BYAPR11MB3238.namprd11.prod.outlook.com
 (2603:10b6:a03:7e::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3238:EE_|BL3PR11MB6508:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ed4dbe0-5c9b-4c9e-57c4-08dcd1b6bd50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UzNZV3EzaXdJMEpNRCtIU1dDaEtHV3lCdUdnaGtpVU94dzc1UHoySUpEYUoy?=
 =?utf-8?B?Q0Q3MHM4UUpoNTZwbmVlYS9leTNkUFU5ZnZQNTA3Q202SVdXT3RwQmNPM1Bo?=
 =?utf-8?B?Z0w3a3hnQWkxTHVaai9lY3dsRHZxbnZkQU52SU54b2dVRVQ3K2dWdThCZ0pv?=
 =?utf-8?B?TnZMc0VKTnZUOFV5SFlSNm1NbmZrUk0xZHkxcVVZd0lSNkJxdGxsZEhVWHNm?=
 =?utf-8?B?TmNWaDdhQS9UK2hKOE54M1VqejFjei90YTVvY2F1OHNGWXc3cjJZUVp5dTFJ?=
 =?utf-8?B?a3V5S2h3RS8vcytsK2dzRHVOLytoeWJIRlZoRFBCZ0QrL2RCejRNZEFHVER5?=
 =?utf-8?B?Z0xUOVBna1lhcUx4VnpkOU54TmVaclVBdjRnRWFhSFZOOUdCdXJnZDBoUVJU?=
 =?utf-8?B?b0hsaC9YU21IOUZQWmtYUFFaeDMrako5OGFvWVY5ZDdnTzVHMVJFS1RGSzZK?=
 =?utf-8?B?VUdKdGM4aG9LWTQzOWFmdFA5alBwMjR1bG1RcDM1cFhORTNSTEdPMjN0SHJ2?=
 =?utf-8?B?SVE0dlBYVUp0NXA1OVRNYzl1WndrUzJHMm9YMzRtMGEram9NdUc3S0gxd1Nj?=
 =?utf-8?B?OU5XcEwzak5INTB1UFdEWE9hTmVCK3FGQkJnNXNuOGttUnNFdkFEd1FiSmhR?=
 =?utf-8?B?UEoyM1JtVXdQcUQrS1NCUXFHTC8xRFN0bGdrbjZBUDloM0M4U21MNkZQRm0y?=
 =?utf-8?B?YVBKZHJEQ1dnOVNyWDlDT0NmTFpEWFlDdGFSYkFiUndzOW9WcjVzeWpNMEMy?=
 =?utf-8?B?Q0VmeWpEb2t3bDBTOWRxWm9CZnQySnlQekt1bXA0U0MzOFZhaCtIZzRLWWxU?=
 =?utf-8?B?QVhPN2RwZ0lXb09hdWZTc2UyNnhMbENBeVBtK0ZWMm0wdGV0RE96QVFoREZk?=
 =?utf-8?B?bzhZWmgrYXltRXZtZkIwazV6R0xZYktJbStYT1dMVkJCZXZyVnNFY2hvSS9n?=
 =?utf-8?B?Mk51R0svVmZHNUxsQkRnMEFsK2NITmtJS1Byb3cvWG9TV1FmU05YcE43VTNO?=
 =?utf-8?B?Qm9DcXJHODdrRkpJSVQ0Y0lzTEVJL3lQQXJ6MWIzUXkvRGZXdHhsVW1vcGYy?=
 =?utf-8?B?aHREL3JxRE1PQkhySVEvWUxrandEdUxhLzdObXlhTFEzdlgvTk9Rb2ZGSnZo?=
 =?utf-8?B?b0J3V1BTdWZucEI0d242VkI3QkxUODN0M2d5TDBHd1BRSGlZYm1DaEFNOUVQ?=
 =?utf-8?B?Tllta3FybjMrMnRMTXU3SDlJcXZDMlFmb3dUWHVjSktrMCtvUG1lamRHSTUr?=
 =?utf-8?B?Zk9yUTIzc1dEcFFzVzJLQlY3a08xKytiMHVHRzkwK0RIRlB0M043a3QrL1Jy?=
 =?utf-8?B?WVM5MWswL3F0V2ttSVRlRXkrZEdrRldmYjJnLzJzYzJWR01xeFNlRFRkMUxE?=
 =?utf-8?B?V2Nnays4dG5rYU56cGpEd3luTk9wcU9FYnZkeTQ3N2Q4MWRPWEN5THpkY1kz?=
 =?utf-8?B?UlJZT2pkZXB5dDllTkhrVjVTdFRYZzcvcXRUY3pIYWpzYjlQOGVNUk9sR01r?=
 =?utf-8?B?T0VLT1RiNkU5aU55cXdKRWtIaXVDendXR3NvVDlQVFYrTFhiL2s0clF3TkNW?=
 =?utf-8?B?MENCSWUwOVlzTmU1bmZFSTEvdmdsS05sN3lFdy92TmNXSXRFWEIwZzFFeHVq?=
 =?utf-8?B?dzFVTlExQ2pXRDY2cHpiOGhmT0pBSlVEM2RmWUNudndXRFB3dzBCblNWNnVP?=
 =?utf-8?B?NWZObUZvMkZOY1Q4K1lUQ0pQK01BckVRZkRaWDJURlZBcGgzQVIveUJJUmVD?=
 =?utf-8?B?aitPeVluRVdFRjh1NTk4UFNkT1k1VDlkZEpnQVluQmtGb3pDcGM5WXFPN1lH?=
 =?utf-8?B?bUpGcm5kNExuNDVPNitRQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3238.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?enRlK3FYSlkwaUJXZngyRGw3eU1iRk11dzBPWmthVytCb3c2UHRKQ2U3RWps?=
 =?utf-8?B?RlIvenZrcU5RS2hRM3dhYTJ6d2RyeHRDVlZQYjBtUFBSeVBVQ3B5ZGdMNy9W?=
 =?utf-8?B?UEhQT1loZ3ZSL0VYblZPWGtZWVNaT0x0ZHhKSURhK2I4eEZWVkJBMjFPRWFw?=
 =?utf-8?B?SEZoek9uaUZPY3VOTVRPcnpOMmpIOEFKYnA2ZXJKODRpVXFjaHc2TnY1RUlT?=
 =?utf-8?B?dnVWTVh2eTA5emU0MWdKa2Q0TkR3c0NRU3Jtb0llUEcyUnpZRzBhZHhSWjMx?=
 =?utf-8?B?WXR1djBkZy9uNXBxLzRQRGxsOEJaZ3Z3WUxYVjJnTE1PN3o1WktCNEUwdUY5?=
 =?utf-8?B?enhVVE04aTNxVmZKT2Q2VDlFYmhaQ2VIWEx5eFFuUm5hN1dnRUcvVHJobG1s?=
 =?utf-8?B?RDdDNHdSM1Zmc1VEUlJ4eUZNbGc3QzBsbkhhSGpSKzNIb1I0ZmQxb3A5UHhV?=
 =?utf-8?B?SnpONHVySjhUR3NNWi8rd3dOdWl4M1pEUE9uMTNVbkYzLzFkOCtaR01TOXp3?=
 =?utf-8?B?THZ6UkN4VkxWRW5sWWh2TFR4dlNMMGg3Umk5QlRVei94akhESXFBS1UvZ0N4?=
 =?utf-8?B?QUp5T3BSaFR4Yms0OUhRemttcUdWTVQzLzZEUU83Z3JLdFBTODNJdU1RaFFC?=
 =?utf-8?B?bGozSGhCYjBGdkFvZzQ0ZFBrODVqQldtdEVHd1g2T1Z4dzZVcHAvYlBYdmJm?=
 =?utf-8?B?cXFyWXNEVTYrODFlTDUzVUx4SWVYU3JRYVIzUm9YSUlVa0tnZ0N6ZDF3aUN0?=
 =?utf-8?B?R2FXS1RkUGdDOTlDbWkwQVRYYjV5a2NaTC9EVWlncnVUSnhZZ3cvMW5Vb1pp?=
 =?utf-8?B?Qnh5UFVUTFlHdVB3OXliUE5XSlZlc1BpcTJBdnpFWmMwMUZ4eGJKZExMVzNO?=
 =?utf-8?B?K3FsQ0xRb0FVT3VRcGh5dUEvZEtSNXZIK1N4aTJ5ZDR6cVdqdGJqYjc0MjBj?=
 =?utf-8?B?a0orS1A4a2hRTGY2VFVVV2trN3FCaWR6WTRkaU5XUE04cFpwUVo2N3dlVEdn?=
 =?utf-8?B?NVdYR3dGd3ZtY216SDNFandoZGpQcEUxMUJ3eURBdEFMeTUwRkxLZXZjenE5?=
 =?utf-8?B?UnB3QW10ejdDT3VBTlY1ajY0eVdJTW9tTXh1QXcwUHkxNXBGbG4ycjdQekoz?=
 =?utf-8?B?OGhHSTR5UzdFNWNwL3FJTHp5YnBJRFV4c25qQUJYRXhMblNvdEZGdCtGN243?=
 =?utf-8?B?c1RpU2xFL3R4d3FNTzRTOWVPaGpTZldsdk5TemdBcmxQVmlXcWh3Um1hQkk2?=
 =?utf-8?B?K1RuUVVyUTFKRzVBWUJEdFhFY2xNZUR2ZzZmN3o5b1NmaWR2Y2IySmJtTFNy?=
 =?utf-8?B?ck9xdTJXRGNZSzZRZ3BPdFZpWGNPL2RCdjE2N09Ja0JJNjVqMTJrcUV0YTVa?=
 =?utf-8?B?TXBVUWZTMG1ZRDd4ZkhnNVJjdkRjRkkxZEFWQTlvNnRoaHRsWEYrM216VHJD?=
 =?utf-8?B?K0gxaWQxSnZERC93dGUyaFZHbUdjbVBpU1MrL21QYVRyaWpKekFrdWZvVWtY?=
 =?utf-8?B?eE84OUNJaStnL1Z4ZGJlOW10cEthT3poS2M1Y2pUMVBvZjBlWkFVaEs2Rmlv?=
 =?utf-8?B?SkJDTWVyT09xZXJWT0JkVFNzV21mVG9nbFFLQ1ZMNm9NVnBPQUcvdmtneTd5?=
 =?utf-8?B?NDZ5LzFVOGhLcnRCbGhNNk9RNVRwdWJNOHRidU1UaFRYYzFUYjNZdG9oRXNw?=
 =?utf-8?B?STRPcG4vdDMycUhwSGR1Z0d0akVYNVpHU3RvRFdRa1U2dnlMU2xiWldrTk8w?=
 =?utf-8?B?bUEzUGNzVThkL2I2UGY2MFFIYUFQcjRFbWMvQzVrUWo1akVML2ZTcysrTEJ1?=
 =?utf-8?B?ZXVmR0J1WUhXQXQ4M3dJeXRTcXNwK05oZnNoMjVIQ3JWM2Q5VjhBQjZoby9S?=
 =?utf-8?B?WVlTUTJHRWhPai9nRlNxMkRSR2dKYVNMS1pUKys1UnYwVWxhbU1hYW5TVGp1?=
 =?utf-8?B?Q0U4b2kzalY1ZmMrdjN0aFZlbkIzNy92cjVmaFR4NkxBdXRLQXdhU0FjbEpI?=
 =?utf-8?B?R3doTUoyZzQ0NmRjaGsydG1YdWZ3ZkJUdUU2elZNbkcrb0xtd1dLRndhL1FC?=
 =?utf-8?B?Y1ptNjNrejJyUVpBMFYyMERadWJxZitxYld1TElTd0NsN0hVYkxwU0VOK1Rh?=
 =?utf-8?B?U2Y1NW5PYU1aUXhpUElSVmFPMTM0ZmwwNndMOVZwQm9tUFk1NWZ3VXIrS2Vz?=
 =?utf-8?B?bXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ed4dbe0-5c9b-4c9e-57c4-08dcd1b6bd50
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3238.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 16:36:37.3330 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uk9NhfpQYaU7cnPP8Xi3BgcafR06UgJ9XdnpYRVIA4XgTHZlJLoXCXRsp/wwfxb88jOgJ1LxKGgoMDbZkopvLzxOqBE/VGC18Fn7/SS3J0U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6508
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


On 10-09-2024 20:07, Nemesa Garg wrote:
> Disable the support for odd x pan for NV12 format as underrun
> issue is seen.
>
> WA: 16024459452
>
> v2: Replace HSD with WA in commit message [Suraj]
>      Modified the condition for handling odd panning
>
> v3: Simplified the condition for checking hsub
>      Using older framework for wa as rev1[Jani]
>
> Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_atomic_plane.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> index e979786aa5cf..4afe808f128c 100644
> --- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> +++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> @@ -1029,8 +1029,13 @@ int intel_plane_check_src_coordinates(struct intel_plane_state *plane_state)
>   		 * This allows NV12 and P0xx formats to have odd size and/or odd
>   		 * source coordinates on DISPLAY_VER(i915) >= 20
>   		 */
> -		hsub = 1;
>   		vsub = 1;
> +		/*
> +		 * Wa_16023981245 for display version 20.
> +		 * Do not support odd x-panning for NV12.
> +		 */
> +		if (IS_LUNARLAKE(i915) && fb->format->format != DRM_FORMAT_NV12)
> +			hsub = 1;
1. Shouldn't it be:

if (!(IS_LUNARLAKE(i915) && fb->format->format == DRM_FORMAT_NV12))
     hsub = 1

2. Will you be adding the "disable even xsize" part as a separate patch?


>   	} else {
>   		hsub = fb->format->hsub;
>   		vsub = fb->format->vsub;

Thank You
Sai Teja

