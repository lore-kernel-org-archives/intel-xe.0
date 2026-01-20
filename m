Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1854D2629F
	for <intel-xe@archiver.kernel.org>; Tue, 20 Jan 2026 22:56:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82B2910E65D;
	Tue, 20 Jan 2026 22:56:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ka5xVlSP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E569E10E65B
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Jan 2026 22:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768949805; x=1800485805;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+aO2/1Ed6NHuJFL7503J3d4E62c20y8UbIrp1A+BygU=;
 b=Ka5xVlSPmaQ0I6R1XdHAKTTdMmq+tD2nXGmVZ4CYKqIBoz6cptqdTlMO
 xkjpRiePSy2L4ZXJNJ55t5cp8flG1gQz+9IKDONe0VlmtKmTkeqefR6GV
 qYeQFXUyCxJ5Sl+8V4JzVAhSADLyZvO+6GvOvmHnT8myMVxy72DrN1sXq
 wX2EWfvzsSoz05uSfKOvetvjrh+EBig9U+puNA894ZZTclSryK1jqDAWn
 JqX1KnGyKuWKd75xtUI1LTNjdFJdpmUb3LIUYx/PtjTzBLUli2Z6BvysH
 TwySDe4UyX98F2ZHUnrWowNOxbeqW/F4EmXAKsmUKZVmj7C2GsQdlkvBT Q==;
X-CSE-ConnectionGUID: ZX8XXkvvRrashodPSyicKQ==
X-CSE-MsgGUID: q4k+O3QUTHqK7hJ29gKAag==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="70336685"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="70336685"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 14:56:44 -0800
X-CSE-ConnectionGUID: HfL5+mLDSLOAoaAakGF4gg==
X-CSE-MsgGUID: BlenOf0mRkipLIzzcf8cAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="205890559"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 14:56:44 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 14:56:43 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 20 Jan 2026 14:56:43 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.1) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 14:56:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VNPEfDLRyQFR9RxhYMR52+EmkItkiRCK94Op8Wo1yBC7F6DUXnuzy/o4YRA3h4cKcVlqixRpUGMFBFTt4t30cs/IwZdGcP1kbIEbgWVSdn80TP2W0xnTa1yqvdBe65hPC/4dqE+Rpm+ueHmKSlopGZeZ2k29k7oY691HLpYuijYfsO3PLRcvx7SNjRrb7NgD7n0xOzDGPjZJ2w6NwF8PH5dG26dBqY0ulj9lNSc8ZgUg9J/723HKaO1GgIcz1KsIfgOHa2T5qsN67q8CJf/CMnkclwFO6jxW2A2n30L8rsgLPaeZa00DkwBubTJMw36d1NsoZlaCEM1+rcgLRFaLlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RVA3sGQNszMpsE3nPHXMFoN+mXzlQCbCkh/NaVpbiF4=;
 b=u7TjWas1ruDJobxl30iGwmHBohqrAs2BMh0yeeISfKS4ztptlqy4Z+GkibxakHtB/Wt40BX3Nqmif0cvEpEC+L3zxs0O7IApn8/5t5IIbpvdQKVPgUmEAM+CHtkygkiTRlV0MSGfuMo0O2MauWrWPaNxp0hZ5cXyHExB0RRwgMGSj22U5UGdng4kt8erfFRFk+wCZ4nDnHrrtZgKMY1JSttmUhvwwy6kyp3nNdHTUR+uiyUSyroMuRw4Ffdoqq8kiaSX+KglkrX8XB1+6VGHcOHPzusNjHWtW+uSmSRNDRuUL1ROq64+30VXrEpm5Byf2jvXhmT+1T0bpuzaZdKs4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by CH3PR11MB7276.namprd11.prod.outlook.com (2603:10b6:610:14b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 22:56:41 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%4]) with mapi id 15.20.9542.008; Tue, 20 Jan 2026
 22:56:41 +0000
Message-ID: <63064ea4-f6a2-4407-baaf-462b1a82d4ee@intel.com>
Date: Tue, 20 Jan 2026 17:56:40 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] drm/xe/guc: Ensure CT state transitions via STOP
 before DISABLED
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20260120201621.2442803-1-zhanjun.dong@intel.com>
 <20260120201621.2442803-5-zhanjun.dong@intel.com>
 <aW/rhHiZc8Ty+L6d@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <aW/rhHiZc8Ty+L6d@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0225.namprd03.prod.outlook.com
 (2603:10b6:303:b9::20) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|CH3PR11MB7276:EE_
X-MS-Office365-Filtering-Correlation-Id: 36ba36a5-a538-4dbb-f2f4-08de58772cf5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eURJL3BtbDk2VXpxMjMvZUt3OCt2cXV0cXozeUxIc2hqWmIxdi9TL0MxWUZP?=
 =?utf-8?B?YVhoT29OcHhCMUdjVmd4MW9CYklQSjN6M3lsandUZnJxT1VEbUFjVUNJZWJY?=
 =?utf-8?B?UUZyWHUwNG1HbTlBSHZRdmUyN0RwQkRkbHFONUV4bU9xVk5ra0VFdDI5WFZa?=
 =?utf-8?B?b0N2MExPK0dUQ2hUUGZEQ1pLTktUc29pdVA2dSt6Y0loWVovcWxSTWxIY3Nx?=
 =?utf-8?B?M0NBcU5HL2s3YVFkL2I1SElyVGhSZEQ0OFpDRjltRHJ1K0dMVWU1SXU3V3hs?=
 =?utf-8?B?YnlQTzd2ZU9LVnNBcjI3aGM3SXZOYmJuMjRnS1l0Y2FIWjFGdDZHQ01pNmRm?=
 =?utf-8?B?QTNuU0JvTWVkaDlFRWFGdTZMNk11MmlyQjZMbUVXeVNPM2dOVEIrMStsM1d2?=
 =?utf-8?B?MitjTmJaZXUvWE9DVXk5S05IVHFKeUg4dklRMnkyYkdkVGZrS1A1Kzh1b1NX?=
 =?utf-8?B?SmdwS2kreGcrVmtPYzlQTTdxa3l4dnROTVJ3TlZCc29VaDRpM0grbTBPL0RF?=
 =?utf-8?B?VlMrQmkwU3VZdThCSmxOYkxJdjJ0R3gySWRWaGRBbTBCallIYXNQQmlIdWV5?=
 =?utf-8?B?ZkNsOWRZU3p6ZXVqQmU0VTJUcm9WSHkrZDBGNU1NRzlNQUlRbTBxUjRzaWdB?=
 =?utf-8?B?Q0RHZTZHVm14K1BSeVRnQlVSMU9lYUxYQkIvc3hEU2diT0U5N2pJNDY2MTdF?=
 =?utf-8?B?bXJvQjNOcW5yem5ZTk56NWZqMzkybVBJNGIrNlN3eDJqQ2RXd2JLaGU3ckJL?=
 =?utf-8?B?azBvVkNHZDRtN0pnZHlpRmMvNGlzZHgrTU85dmxIOEczK0xSU3pFQXhCRmZu?=
 =?utf-8?B?bFFKQ0kxeVhuM2x0ZjQ3Q21zTnhGR3A2c3l3NGZzZ0VMSTRCZHpIbHNmZWJC?=
 =?utf-8?B?VVYxQUwzb2oveHpCdG03QTdGSlY5bm5oVCtOYXdISlg1aE9UVlQwckVzNzdi?=
 =?utf-8?B?dnlYc3FvT3JqVzcwR3A3S05yK1BkMnpMVmxsRUkvL2UxcTdUTGN6dGdPRzRQ?=
 =?utf-8?B?RVF4djhiVnQ3SHZtdktoSlE2OWdTRk1oRWtxT3BiSm9JZkNybTdXdHpyeEU4?=
 =?utf-8?B?N0xyWEtETm9CbHdnalNkZ1dQOHNGQVQzWnp5N0V3Ujg2c1VOZ01mWk1WZEJT?=
 =?utf-8?B?NGZOQjV6UE5zRi9zd21UL2k2ZldVYkpYOXQ3RENaYldDa2JyazRodnpCV3lS?=
 =?utf-8?B?WTlSR0Zxc1IxbVFQd0VxSmxoQUJnY2dFeFVsdVNFSU5hcnVkQnRva2ovYUVs?=
 =?utf-8?B?cWpSK1phbWFGajhTb3BFUWZvMXZ6VU1CQ3djaU80ZXhBaklmcmcvdmRMclo5?=
 =?utf-8?B?QnIwSjVTRlVxUTF5aUV3eDdpckhZV2V2WFA3UzZCUDVzYy9oZWhYVzEzbFhO?=
 =?utf-8?B?Wlc1MkVPdlZMRVdtcEdkMXg0QkVjRC9iRGk2NXdkM1pNVUE2UHNUbHYybVdv?=
 =?utf-8?B?R3FCODNhY0hkdm5JS0l2V1BYdnIyMjdZQURWTUhKRFRiRDFHY05FYTBLcGU4?=
 =?utf-8?B?OC9QWW4yaGVETmM1UzBSVVZOVUYzM2RHbHh5UmJNT1IyREdWYWdzVGVtb09t?=
 =?utf-8?B?VytxYzg1SEhBc3d6My9Qa0I1SllFZTJ4eTl3U3pUYmlTRnJ6c05CbGpLZmRY?=
 =?utf-8?B?RVJadkhDM2tvZG45aEVWYXlpNkpuWlVpYUxsS2ZreXovT2lFOTlyVVJkV0lQ?=
 =?utf-8?B?MXdtdkJxTk9HVkRzN1BJekk0WVVuU0dIbEtjL2ZNTXJ6T25Wc3BTdTZTek5G?=
 =?utf-8?B?R0l6bkRuOG1ObTBFYm9aa25RYk0yTS9YUG9icUowZnpPWGZjcHY1YWxielFF?=
 =?utf-8?B?aksxeWQ4WUlxZjAvZWY4MjAxRVBlVnNSK3VaY1JWaTVlTWhaNHBtL3JXbXJ2?=
 =?utf-8?B?djJIckViY2V4ejRlTDFVSEU1d2RqaHU3QzJBK1l5cDlkWlZtWVYwN3U5cjFY?=
 =?utf-8?B?R1QzTGVjUE1xQVdQUzg2N2VackpZUC9Bc2IxYlFEVzkvbHd3RjhQRm1Ia1dz?=
 =?utf-8?B?ZStBS2svNU5QWEhSTFFMWlczOE1lWkljWkNuNkZuaXRZMUt1TWtDU08ybUIz?=
 =?utf-8?B?S3l6KzZRZCtVdWQyMFh3REFJanduYXVsZUN1VjUzaHFNcDdmNWZoQ0pOQXBm?=
 =?utf-8?Q?rjV8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UEtMenU1b3FrVmZCdlRKZzlONXcvS0xKK3lraEtZMzZUWjVIRVgraVJPODJW?=
 =?utf-8?B?ZTVCNk9DL0hyWHNySW9jaCtoWnM2QlhoRXhGNVExOUV1OTF6ZXhNSThES2Nl?=
 =?utf-8?B?ZXc3U09IcmRzYytPNUsxZmNEckxwbE9XYzNETlVFNER4Z1lKYjlxQ1dnUDAv?=
 =?utf-8?B?QTRyUjB1UnRUOVNDVnBzNFYvQ1hSdmgzelVZYjc5aVlPY1pKSXFaTmVyZ1F0?=
 =?utf-8?B?dFpiUXYzcTYyZzF0Nlp4UHN1V2FQekFCQ2dGUDcxUzN6aFFSYjk2RUVCRTlm?=
 =?utf-8?B?QTdRZHczNWQ0MU1RTTI0ZjNJVVZBMWplZmxCdHBZcDJBZ2dJdWR4YzArQi9O?=
 =?utf-8?B?K3JENDBycGpvWThvVEtXZVNkTS9QVktuT1NTUzlveGt2NFpZTGJpZ2pSUE1o?=
 =?utf-8?B?RHJUa3hlaFZiN05mYkRlWVY5SHRuM0xVeHZFZ3hQU2oxK3JLM3Q4Vk85cjZu?=
 =?utf-8?B?OHRrY0trZk54eWNYMlBmTDlYeDRhSGs2ZlIrRTlxN2JxMlU2WWpFelVpSTRK?=
 =?utf-8?B?MFMxM1hINVA2QUZhbmt1MXRVSEtvSEhOUmtJRmMvaDZFOElxdVI1L0NFS3pi?=
 =?utf-8?B?ai91cEt3RTdVMVF6eXdGREtXY3JpNHUwSUw0ckV5cTBMcitybXh4bGQ1UVJs?=
 =?utf-8?B?VVdDdENDSFhYcThFS1pEVEQwTXA4bGtPUVFoMjB5bjhzRUsxYWdTWTZML3ds?=
 =?utf-8?B?aWRiTHJPbDBncTI3K1FaU0wrQmlsT0FpY3UxT2xWN1ZHZnNXamJqVCtQOVBs?=
 =?utf-8?B?dm9nSHhFS3l6SkZ1VUpudFFpR1hSS3JRQmVLZWZzNUMyLzBnTnRvVE5rSTR2?=
 =?utf-8?B?ZHlYZ051dW5vajlRUkFLdGlERHlSUFV3OGhmemtVSWVUUGZtSm82VnNHYWZ2?=
 =?utf-8?B?UHJDUUZMeDdkNm5EcHJhajhUUkN2RHBXS2cwVlBzWkJ2cTNXM0dhblZaa2c5?=
 =?utf-8?B?ZGhUQzhwSXVnZGlYcnF0UzJqUkVISVljTDJDM2phZk01L2xYbytqQmhKWTRJ?=
 =?utf-8?B?LzlqOVNMT0YxNnhXT0FoQWFiOUNjSFpZa3pTWHBudy9ER2lNWStrbFpsTmlp?=
 =?utf-8?B?ZHdyOXp6UU0xU3NtL3R2YWE3OENWY1NtVU1VUG1XWDl6Q0Z2VUkvcnV4Znlu?=
 =?utf-8?B?eEhNM285YTFxMWc4TjkrbjVhVEJzZWc0WnFKVXY2WlcxaTFqb0RHZXlsak85?=
 =?utf-8?B?US84ZTlKYTY2aVpBd0tBRWpWRVhlMWNjeTlxbHFuQ1ZEeTRFMitmRG0rWDdp?=
 =?utf-8?B?NGp5dDVuQW5Ld2h2Z2VYVkU3bDZhcmZKaWtSRWdSTmRXK1pDcmRLR3NkVWdm?=
 =?utf-8?B?dFZIR0Qyc216Y3l2S3VMSWI5VFdjWkxjRjRDeDFEU2xWUXF3R09HRU1NTVov?=
 =?utf-8?B?Nlh3VzdsNWgwWUxuZE9Tb1pyQjNqL0c1dllQK0VqZFJmMVNTQnFjcldoTUJn?=
 =?utf-8?B?ZFR2aE5oU1J5YXd4THVLVGRUNDMycmxHSkMvUi84WUJKS3Y0OHlwRzhaNHVV?=
 =?utf-8?B?K0xwVHBBcEFPZlFkR3d1bzUvbTJ4dTRRcVM3V0hvV0dCeC93a0JWaWdCY2No?=
 =?utf-8?B?OUNNUDdBOUoreGRBY240c01BSG81a0hNV3pIZEpYcWFaREdZYWl6bzN6YnhC?=
 =?utf-8?B?aDIrYlpMMmhSUkxhQ1ZoRUpmMkN2K1kvb3Uwa3BwYmdOeXdaZG44UlBPQ2s5?=
 =?utf-8?B?TlQ0bGxnM3JMcHA3UGNDbFhKNllYYnhHUUEzYUZ6L3FXTWNGdXMyY1AzRWIx?=
 =?utf-8?B?SURaTFZqaktvaWpLZi9oK09wMUtVRTNmbU1iUHRRTmZ0amRlMjlvbTJsbXZu?=
 =?utf-8?B?RjVUZzFTMy93ckVjTVpEV1dJZnV0OVJpeEphZ1NrRGF1d1NtSTJaMDc1NUdm?=
 =?utf-8?B?WEpmM2xDOG9QdWVDN3BoRVhBSnp0Y3UzOUxKaHNZZytjbXgwalZLVUw4czMy?=
 =?utf-8?B?cVRwcWFkZWxtOE1aTk5OWUR4OG9PV3BMdm9nTnVsQStQbjFyaFU2VzZscmx4?=
 =?utf-8?B?TFZ0QVdETGJMSzNRK0FDSzc3K2E0V3FMQWJCclpvYUlvc05zQVBxMVl5bUJS?=
 =?utf-8?B?YVRsUmtGUFVDZDlsZmRQdFRCYWhueEczWXZzQWhFZE42NFJTYkNZbDdiTEpK?=
 =?utf-8?B?RkFBc2s1ODJwUnZTbnkwTmlWYUsyNEVST3UrK3hjNGdDR0h4QkZGdWcvL202?=
 =?utf-8?B?YVBKMXR4ejFYd2VaSWFlRDNxTEFTYTdIOG1oTisxU2dOUVlLc0FDdm1RQ2M2?=
 =?utf-8?B?RXczNE5CbWNkMUxqRzVkbmczMGhkUWk3eE5IWHlQM09Od3VmM1BEaGRoaWlZ?=
 =?utf-8?B?SmgxV0JrYytUalc0TXlxZDdyamluNkRHOW9ZNXdocll1MnQ3dWJkaGpNK29p?=
 =?utf-8?Q?6VSeC0hEt5HoDZ0g=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 36ba36a5-a538-4dbb-f2f4-08de58772cf5
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 22:56:41.3721 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ovlfzsU7W8/SAQ6DaLTacFm1JgXoNE77xN9RVunseTtyhDuhK5nAejsWasKPoTkFvQP8AkEJIxCuNI4NiRcsWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7276
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



On 2026-01-20 3:54 p.m., Matthew Brost wrote:
> On Tue, Jan 20, 2026 at 03:16:19PM -0500, Zhanjun Dong wrote:
>> The GuC CT state transition requires moving to the STOP state before
>> entering the DISABLED state. Updated the state machine logic to enforce
>> this sequence.
>>
> 
> s/Updated the state machine logic to enforce this sequence./Update the
> driver teardown sequence to make the proper state machine transitions./
> 
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> 
> With an adjusted commit message:
> 
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> 
> This is also probably a fixes patch too.
Good point. Let me add it in next rev.

Zhanjun

> 
> Matt
> 
>> ---
>>   drivers/gpu/drm/xe/xe_guc_ct.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>> index dfbf76037b04..6a658f085e0f 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>> @@ -345,6 +345,7 @@ static void guc_action_disable_ct(void *arg)
>>   {
>>   	struct xe_guc_ct *ct = arg;
>>   
>> +	xe_guc_ct_stop(ct);
>>   	guc_ct_change_state(ct, XE_GUC_CT_STATE_DISABLED);
>>   }
>>   
>> -- 
>> 2.34.1
>>

